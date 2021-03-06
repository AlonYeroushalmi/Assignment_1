#include "types.h"
#include "defs.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "x86.h"
#include "proc.h"
#include "spinlock.h"

#define MAX_VARIABLES 32
#define USER_COMMAND_MAX_SIZE 128
#define MAX_NUMBER 99999999999999

//Variable table for shell
char variable_table[MAX_VARIABLES][2][USER_COMMAND_MAX_SIZE];
int next_empty_vartable_index = 0;

#ifdef FCFS
//Queue for FCFS
struct proc * processesQueue[NPROC];
int next_empty_processesQueue_index = 0;
int processesQueue_head_index = 0;
#endif

struct {
  struct spinlock lock;
  struct proc proc[NPROC];
} ptable;

static struct proc *initproc;

int nextpid = 1;
extern void forkret(void);
extern void trapret(void);

static void wakeup1(void *chan);

//the following are imported from ulibc. useful for updating the variable table:
char*
strcpy(char *s, char *t)
{
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    ;
  return os;
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
//end of imported functions from ulibc

void
pinit(void)
{
  initlock(&ptable.lock, "ptable");
}

// Must be called with interrupts disabled
int
cpuid() {
  return mycpu()-cpus;
}

// Must be called with interrupts disabled to avoid the caller being
// rescheduled between reading lapicid and running through the loop.
struct cpu*
mycpu(void)
{
  int apicid, i;
  
  if(readeflags()&FL_IF)
    panic("mycpu called with interrupts enabled\n");
  
  apicid = lapicid();
  // APIC IDs are not guaranteed to be contiguous. Maybe we should have
  // a reverse map, or reserve a register to store &cpus[i].
  for (i = 0; i < ncpu; ++i) {
    if (cpus[i].apicid == apicid)
      return &cpus[i];
  }
  panic("unknown apicid\n");
}

// Disable interrupts so that we are not rescheduled
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
  c = mycpu();
  p = c->proc;
  popcli();
  return p;
}

//PAGEBREAK: 32
// Look in the process table for an UNUSED proc.
// If found, change state to EMBRYO and initialize
// state required to run in the kernel.
// Otherwise return 0.
static struct proc*
allocproc(void)
{
  struct proc *p;
  char *sp;

  acquire(&ptable.lock);

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
    if(p->state == UNUSED)
      goto found;

  release(&ptable.lock);
  return 0;

found:
  p->state = EMBRYO;
  p->pid = nextpid++;
  release(&ptable.lock);

  // Allocate kernel stack.
  if((p->kstack = kalloc()) == 0){
    p->state = UNUSED;
    return 0;
  }
  sp = p->kstack + KSTACKSIZE;

  // Leave room for trap frame.
  sp -= sizeof *p->tf;
  p->tf = (struct trapframe*)sp;

  // Set up new context to start executing at forkret,
  // which returns to trapret.
  sp -= 4;
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
  p->context->eip = (uint)forkret;

  // set creation time of process
  p->ctime = ticks;
  p->etime = 0;
  p->rtime = 0;
  p->iotime=0; 
  p->approxRTime = QUANTUM;

  return p;
}

//PAGEBREAK: 32
// Set up first user process.
void
userinit(void)
{
  struct proc *p;
  extern char _binary_initcode_start[], _binary_initcode_size[];

  p = allocproc();
  
  #ifdef CFSD
  p->decayFactor = NORMAL_PRIORITY;
  #endif
  initproc = p;
  if((p->pgdir = setupkvm()) == 0)
    panic("userinit: out of memory?");
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
  p->sz = PGSIZE;
  memset(p->tf, 0, sizeof(*p->tf));
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
  p->tf->es = p->tf->ds;
  p->tf->ss = p->tf->ds;
  p->tf->eflags = FL_IF;
  p->tf->esp = PGSIZE;
  p->tf->eip = 0;  // beginning of initcode.S

  safestrcpy(p->name, "initcode", sizeof(p->name));
  p->cwd = namei("/");

  // this assignment to p->state lets other cores
  // run this process. the acquire forces the above
  // writes to be visible, and the lock is also needed
  // because the assignment might not be atomic.
  acquire(&ptable.lock);

  p->state = RUNNABLE;
  #ifdef FCFS
  processesQueue[next_empty_processesQueue_index] = p;
  next_empty_processesQueue_index++;
  #endif

  release(&ptable.lock);
}

// Grow current process's memory by n bytes.
// Return 0 on success, -1 on failure.
int
growproc(int n)
{
  uint sz;
  struct proc *curproc = myproc();

  sz = curproc->sz;
  if(n > 0){
    if((sz = allocuvm(curproc->pgdir, sz, sz + n)) == 0)
      return -1;
  } else if(n < 0){
    if((sz = deallocuvm(curproc->pgdir, sz, sz + n)) == 0)
      return -1;
  }
  curproc->sz = sz;
  switchuvm(curproc);
  return 0;
}

// Create a new process copying p as the parent.
// Sets up stack to return as if from system call.
// Caller must set state of returned proc to RUNNABLE.
int
fork(void)
{
  int i, pid;
  struct proc *np;
  struct proc *curproc = myproc();

  // Allocate process.
  if((np = allocproc()) == 0){
    return -1;
  }

  // Copy process state from proc.
  if((np->pgdir = copyuvm(curproc->pgdir, curproc->sz)) == 0){
    kfree(np->kstack);
    np->kstack = 0;
    np->state = UNUSED;
    return -1;
  }
  np->sz = curproc->sz;
  np->parent = curproc;
  #ifdef CFSD
  np->decayFactor = curproc->decayFactor;
  #endif
  *np->tf = *curproc->tf;

  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;

  for(i = 0; i < NOFILE; i++)
    if(curproc->ofile[i])
      np->ofile[i] = filedup(curproc->ofile[i]);
  np->cwd = idup(curproc->cwd);

  safestrcpy(np->name, curproc->name, sizeof(curproc->name));

  pid = np->pid;

  acquire(&ptable.lock);

  np->state = RUNNABLE;
  #ifdef FCFS
  processesQueue[next_empty_processesQueue_index] = np;
  if(++next_empty_processesQueue_index >= NPROC)
    next_empty_processesQueue_index = 0;
  #endif

  release(&ptable.lock);

  return pid;
}

// Exit the current process.  Does not return.
// An exited process remains in the zombie state
// until its parent calls wait() to find out it exited.
void
exit(void)
{
  struct proc *curproc = myproc();
  struct proc *p;
  int fd;


  if(curproc == initproc)
    panic("init exiting");

  // Close all open files.
  for(fd = 0; fd < NOFILE; fd++){
    if(curproc->ofile[fd]){
      fileclose(curproc->ofile[fd]);
      curproc->ofile[fd] = 0;
    }
  }

  begin_op();
  iput(curproc->cwd);
  end_op();
  curproc->cwd = 0;

  acquire(&ptable.lock);

  // Parent might be sleeping in wait().
  wakeup1(curproc->parent);

  // Pass abandoned children to init.
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->parent == curproc){
      p->parent = initproc;
      if(p->state == ZOMBIE)
        wakeup1(initproc);
    }
  }

  // set end time of process
  curproc->etime = ticks;
  // Jump into the scheduler, never to return.
  curproc->state = ZOMBIE;
  #ifdef SRT
  if (curproc->rtime >= curproc->approxRTime)
    curproc->approxRTime = curproc->approxRTime + ALPHA * curproc->approxRTime;
  #endif
  sched();
  panic("zombie exit");
}

// Wait for a child process to exit and return its pid.
// Return -1 if this process has no children.
int
wait(void)
{
  struct proc *p;
  int havekids, pid;
  struct proc *curproc = myproc();
  
  acquire(&ptable.lock);
  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
      if(p->parent != curproc)
        continue;
      havekids = 1;
      if(p->state == ZOMBIE){
        // Found one.
        pid = p->pid;
        kfree(p->kstack);
        p->kstack = 0;
        freevm(p->pgdir);
        p->pid = 0;
        p->parent = 0;
        p->name[0] = 0;
        p->killed = 0;
        p->state = UNUSED;
        release(&ptable.lock);
        return pid;
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || curproc->killed){
      release(&ptable.lock);
      return -1;
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
  }
}

//PAGEBREAK: 42
// Per-CPU process scheduler.
// Each CPU calls scheduler() after setting itself up.
// Scheduler never returns.  It loops, doing:
//  - choose a process to run
//  - swtch to start running that process
//  - eventually that process transfers control
//      via swtch back to the scheduler.
void
scheduler(void)
{
  struct proc *p;
  struct cpu *c = mycpu();
  c->proc = 0;
  
  for(;;){
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);

    // choose Scheduling policy and use it.
    // -----------------------------------

    #ifdef DEFAULT
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
      if(p->state != RUNNABLE)
        continue;

      // Switch to chosen process.  It is the process's job
      // to release ptable.lock and then reacquire it
      // before jumping back to us.
      c->proc = p;
      switchuvm(p);
      p->state = RUNNING;
      swtch(&(c->scheduler), p->context);
      switchkvm();

      // Process is done running for now.
      // It should have changed its p->state before coming back.
      c->proc = 0;
    }
    #endif
    //update queue only when process changes to runnable or running (running happens only here)
    #ifdef FCFS
    if (processesQueue[processesQueue_head_index] != 0 && processesQueue[processesQueue_head_index]->state == RUNNABLE) {
      p = processesQueue[processesQueue_head_index];
      if (++processesQueue_head_index >= NPROC) //increment head for the next scheduling
        processesQueue_head_index = 0;
      c->proc = p;
      switchuvm(p);
      p->state = RUNNING;
      swtch(&(c->scheduler), p->context);
      switchkvm();
      c->proc = 0;
    }
    #endif 

    #ifdef SRT
    struct proc * minApproxProcess = 0;
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){ //go through proc table and search for a RUNNALBE process with min approx time
      if(p->state == RUNNABLE && (minApproxProcess == 0 || p->approxRTime < minApproxProcess->approxRTime))
        minApproxProcess = p;
    }
    p = minApproxProcess;
    if (p != 0 && p->state == RUNNABLE) {//if found a legitimate process, context switch to it
      c->proc = p;
      switchuvm(p);
      p->state = RUNNING;
      swtch(&(c->scheduler), p->context);
      switchkvm();
      c->proc = 0;
    }
    //if no process found or no RUNNABLE one, iterate again
    #endif

    #ifdef CFSD
    struct proc * minRuntimeRatioProcess = 0;
    float minRuntimeRatio = MAX_NUMBER;
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){ //go through proc table and search for a RUNNABLE process with min runtime ratio
      float wtime = ticks - p->ctime - p->rtime - p->iotime;
      float curRuntimeRatio = (p->rtime * p->decayFactor) / (p->rtime + wtime);
      if(p->state == RUNNABLE && minRuntimeRatioProcess == 0) {
        minRuntimeRatioProcess = p;
        minRuntimeRatio = curRuntimeRatio;
      }
      else if (p->state == RUNNABLE && curRuntimeRatio < minRuntimeRatio) {
        minRuntimeRatioProcess = p;
        minRuntimeRatio = curRuntimeRatio;
      }
    }
    p = minRuntimeRatioProcess;
    if (p != 0 && p->state == RUNNABLE) {//if found a legitimate process, context switch to it
      c->proc = p;
      switchuvm(p);
      p->state = RUNNING;
      swtch(&(c->scheduler), p->context);
      switchkvm();
      c->proc = 0;
    }
    //if no process found or no RUNNABLE one, iterate again
    #endif

    release(&ptable.lock);

  }
}

// Enter scheduler.  Must hold only ptable.lock
// and have changed proc->state. Saves and restores
// intena because intena is a property of this
// kernel thread, not this CPU. It should
// be proc->intena and proc->ncli, but that would
// break in the few places where a lock is held but
// there's no process.
void
sched(void)
{
  int intena;
  struct proc *p = myproc();

  if(!holding(&ptable.lock))
    panic("sched ptable.lock");
  if(mycpu()->ncli != 1)
    panic("sched locks");
  if(p->state == RUNNING)
    panic("sched running");
  if(readeflags()&FL_IF)
    panic("sched interruptible");
  intena = mycpu()->intena;
  swtch(&p->context, mycpu()->scheduler);
  mycpu()->intena = intena;
}

// Give up the CPU for one scheduling round.
void
yield(void)
{
  struct proc * p = myproc();
  acquire(&ptable.lock);  //DOC: yieldlock
  p->state = RUNNABLE;
  #ifdef FCFS
  processesQueue[next_empty_processesQueue_index] = p;
  if (++next_empty_processesQueue_index >= NPROC)
    next_empty_processesQueue_index = 0;
  #endif
  #ifdef SRT
  if (p->rtime >= p->approxRTime)
    p->approxRTime = p->approxRTime + ALPHA * p->approxRTime;
  #endif
  sched();
  release(&ptable.lock);
}

// A fork child's very first scheduling by scheduler()
// will swtch here.  "Return" to user space.
void
forkret(void)
{
  static int first = 1;
  // Still holding ptable.lock from scheduler.
  release(&ptable.lock);

  if (first) {
    // Some initialization functions must be run in the context
    // of a regular process (e.g., they call sleep), and thus cannot
    // be run from main().
    first = 0;
    iinit(ROOTDEV);
    initlog(ROOTDEV);
  }

  // Return to "caller", actually trapret (see allocproc).
}

// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
  struct proc *p = myproc();
  
  if(p == 0)
    panic("sleep");

  if(lk == 0)
    panic("sleep without lk");

  // Must acquire ptable.lock in order to
  // change p->state and then call sched.
  // Once we hold ptable.lock, we can be
  // guaranteed that we won't miss any wakeup
  // (wakeup runs with ptable.lock locked),
  // so it's okay to release lk.
  if(lk != &ptable.lock){  //DOC: sleeplock0
    acquire(&ptable.lock);  //DOC: sleeplock1
    release(lk);
  }
  // Go to sleep.
  p->chan = chan;
  p->state = SLEEPING;
  #ifdef SRT
  if (p->rtime >= p->approxRTime)
    p->approxRTime = p->approxRTime + ALPHA * p->approxRTime;
  #endif
  sched();

  // Tidy up.
  p->chan = 0;

  // Reacquire original lock.
  if(lk != &ptable.lock){  //DOC: sleeplock2
    release(&ptable.lock);
    acquire(lk);
  }
}

//PAGEBREAK!
// Wake up all processes sleeping on chan.
// The ptable lock must be held.
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
    if(p->state == SLEEPING && p->chan == chan) {
      p->state = RUNNABLE;
      #ifdef FCFS
      processesQueue[next_empty_processesQueue_index] = p;
      if (++next_empty_processesQueue_index >= NPROC)
        next_empty_processesQueue_index = 0;
      #endif
    }
}

// Wake up all processes sleeping on chan.
void
wakeup(void *chan)
{
  acquire(&ptable.lock);
  wakeup1(chan);
  release(&ptable.lock);
}

// Kill the process with the given pid.
// Process won't exit until it returns
// to user space (see trap in trap.c).
int
kill(int pid)
{
  struct proc *p;

  acquire(&ptable.lock);
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->pid == pid){
      p->killed = 1;
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING) {
        p->state = RUNNABLE;
        #ifdef FCFS
        processesQueue[next_empty_processesQueue_index] = p;
        if (++next_empty_processesQueue_index >= NPROC)
          next_empty_processesQueue_index = 0;
        #endif
      }
      release(&ptable.lock);
      return 0;
    }
  }
  release(&ptable.lock);
  return -1;
}

//PAGEBREAK: 36
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
  static char *states[] = {
  [UNUSED]    "unused",
  [EMBRYO]    "embryo",
  [SLEEPING]  "sleep ",
  [RUNNABLE]  "runble",
  [RUNNING]   "run   ",
  [ZOMBIE]    "zombie"
  };
  int i;
  struct proc *p;
  char *state;
  uint pc[10];

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->state == UNUSED)
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
      state = states[p->state];
    else
      state = "???";
    cprintf("%d %s %s", p->pid, state, p->name);
    if(p->state == SLEEPING){
      getcallerpcs((uint*)p->context->ebp+2, pc);
      for(i=0; i<10 && pc[i] != 0; i++)
        cprintf(" %p", pc[i]);
    }
    cprintf("\n");
  }
}

int checkVarName(const char* var) {
  for(; *var; var++)
    if(*var < 'A' || *var > 'z' ||
       (*var > 'Z' && *var < 'a'))
      return -1;
  return 0;
}

int searchvar(char* var) {
  for (int i=0; i<next_empty_vartable_index; i++) {
    if (strcmp(var, variable_table[i][0]) == 0)
      return i;
  }
  return -1;
}

int setVariable(char* var, char* val) {
  int result = 0;
  if (next_empty_vartable_index >= MAX_VARIABLES)
    result = -1;
  if (checkVarName(var) < 0)
    result = -2;
  else {
    int indexToUpdate = searchvar(var);
    if (indexToUpdate < 0) {
      indexToUpdate = next_empty_vartable_index;
      next_empty_vartable_index++;
    }
    strcpy(variable_table[indexToUpdate][0], var);
    strcpy(variable_table[indexToUpdate][1], val);
  }
  return result;
}

int getVariable(char* var, char* val) {
  int result = 0;
  int varIndexInTable = searchvar(var);
  if (varIndexInTable < 0)
    result = -1;
  else
    strcpy(val, variable_table[varIndexInTable][1]);
  return result;
}

int remVariable(char* var) {
  int result = 0;
  int varIndexInTable = searchvar(var);
  if (varIndexInTable < 0)
    result = -1;
  else {
    for (int i=0; i<USER_COMMAND_MAX_SIZE; i++) {
      variable_table[varIndexInTable][0][i] = 0;
      variable_table[varIndexInTable][1][i] = 0;
    }
  }
  return result;
}
/*
int wait2(int pid, int* wtime, int* rtime, int* iotime)
input:
• Int pid – The process ID to wait for
• int* wtime – A pointer to an integer that will hold wait time (𝑤𝑡𝑖𝑚𝑒 = 𝑒𝑡𝑖𝑚𝑒 − 𝑐𝑡𝑖𝑚𝑒 − 𝑖𝑜𝑡𝑖𝑚𝑒 −
𝑟𝑡𝑖𝑚𝑒).
• int* rtime – A pointer to an integer that will hold run time.
• Int* iotime – A pointer to an integer that will hold io time.
Output:
• 0 – Process ID of caught child
• -1 – Process pid does not exist
*/
int wait2(int pid, int* wtime, int* rtime, int* iotime) {

  struct proc *p;
  int havekids;
  struct proc *curproc = myproc();
  
  acquire(&ptable.lock);
  for(;;){
    // Scan through table looking for specifiec son with the pid..
    havekids = 0;
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
      if( p->pid == pid){
        if(p->parent != curproc)
          continue;
        havekids = 1;
        if(p->state == ZOMBIE){
          // Found one.
          // regular wait syscall:
          kfree(p->kstack);
          p->kstack = 0;
          freevm(p->pgdir);
          p->pid = 0;
          p->parent = 0;
          p->name[0] = 0;
          p->killed = 0;
          p->state = UNUSED;
          //end of regular wait sys call, the following is wait2:
          *wtime = p->etime - p->ctime - p->rtime - p->iotime;
          *rtime = p->rtime;
          *iotime = p->iotime;
          release(&ptable.lock);
          return pid;
        }
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || curproc->killed){
      release(&ptable.lock);
      return -1;
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
  }
}

int set_priority(int priority) {
  switch (priority) {
    case 1:
      myproc()->decayFactor = HIGH_PRIORITY;
      break;
    case 2:
      myproc()->decayFactor = NORMAL_PRIORITY;
      break;
    case 3:
      myproc()->decayFactor = LOW_PRIORITY;
      break;
    default:
      return -1; //priority given is illegal
  }
  return 0;
}

int IncStatistics() {
  struct proc *p;
  acquire(&ptable.lock);
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    switch(p->state) {
      case SLEEPING:
        p->iotime++;
        break;
      case RUNNING:
        p->rtime++;
        //p->tickCounter++;
        break;
      default:
        ;
    }
  }
  release(&ptable.lock);
  return 0;
}

