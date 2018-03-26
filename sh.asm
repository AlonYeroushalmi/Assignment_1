
_sh:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  }
}

int
main(void)
{
       0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
       4:	83 e4 f0             	and    $0xfffffff0,%esp
       7:	ff 71 fc             	pushl  -0x4(%ecx)
       a:	55                   	push   %ebp
       b:	89 e5                	mov    %esp,%ebp
       d:	57                   	push   %edi
       e:	56                   	push   %esi
       f:	53                   	push   %ebx
      10:	51                   	push   %ecx
      11:	81 ec 18 01 00 00    	sub    $0x118,%esp
  static char buf[100];
  int fd;

  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
      17:	eb 10                	jmp    29 <main+0x29>
      19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(fd >= 3){
      20:	83 f8 02             	cmp    $0x2,%eax
      23:	0f 8f a9 02 00 00    	jg     2d2 <main+0x2d2>
{
  static char buf[100];
  int fd;

  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
      29:	83 ec 08             	sub    $0x8,%esp
      2c:	6a 02                	push   $0x2
      2e:	68 be 17 00 00       	push   $0x17be
      33:	e8 90 12 00 00       	call   12c8 <open>
      38:	83 c4 10             	add    $0x10,%esp
      3b:	85 c0                	test   %eax,%eax
      3d:	79 e1                	jns    20 <main+0x20>
        varBeginIndex--;
      if (varBeginIndex != buf)
        varBeginIndex++;
      if (varBeginIndex == equalIndex)
        break; //command in buf is probably an error
      strncpy(var, varBeginIndex, equalIndex - varBeginIndex); //copy the var to auxillary array
      3f:	8d b5 e8 fe ff ff    	lea    -0x118(%ebp),%esi
      char* valEndIndex;
      if ((valEndIndex = strchr(equalIndex, '\n')) == 0)
        if ((valEndIndex = strchr(equalIndex, 0)) == 0)
          break; //command in buf is probably an error
      valEndIndex--;
      strncpy(val, equalIndex+1, valEndIndex - equalIndex); //copy the val to auxillary array
      45:	8d 9d 68 ff ff ff    	lea    -0x98(%ebp),%ebx
      4b:	90                   	nop
      4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      break;
    }
  }

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
      50:	83 ec 08             	sub    $0x8,%esp
      53:	6a 64                	push   $0x64
      55:	68 60 1f 00 00       	push   $0x1f60
      5a:	e8 41 04 00 00       	call   4a0 <getcmd>
      5f:	83 c4 10             	add    $0x10,%esp
      62:	85 c0                	test   %eax,%eax
      64:	0f 88 c1 01 00 00    	js     22b <main+0x22b>
    enqueueHistory(buf);
      6a:	83 ec 0c             	sub    $0xc,%esp
      6d:	68 60 1f 00 00       	push   $0x1f60
      72:	e8 99 02 00 00       	call   310 <enqueueHistory>

    transformDollars(buf);
      77:	c7 04 24 60 1f 00 00 	movl   $0x1f60,(%esp)
      7e:	e8 9d 04 00 00       	call   520 <transformDollars>

    char* equalIndex;
    char* bufIterator = buf;
    if ((equalIndex = strchr(bufIterator, '=')) != 0) {
      83:	58                   	pop    %eax
      84:	5a                   	pop    %edx
      85:	6a 3d                	push   $0x3d
      87:	68 60 1f 00 00       	push   $0x1f60
      8c:	e8 6f 10 00 00       	call   1100 <strchr>
      91:	83 c4 10             	add    $0x10,%esp
      94:	85 c0                	test   %eax,%eax
      96:	89 c7                	mov    %eax,%edi
      98:	0f 84 2a 02 00 00    	je     2c8 <main+0x2c8>
      char var[USER_COMMAND_MAX_SIZE];
      char val[USER_COMMAND_MAX_SIZE];
      char* varBeginIndex = equalIndex - 1;
      9e:	8d 50 ff             	lea    -0x1(%eax),%edx
      while ((varBeginIndex != buf) && (*varBeginIndex != ' ')) //the check that var name is legal is done in the system call
      a1:	81 fa 60 1f 00 00    	cmp    $0x1f60,%edx
      a7:	74 2d                	je     d6 <main+0xd6>
      a9:	80 78 ff 20          	cmpb   $0x20,-0x1(%eax)
      ad:	0f 84 6d 01 00 00    	je     220 <main+0x220>
      b3:	8d 40 fe             	lea    -0x2(%eax),%eax
      b6:	eb 15                	jmp    cd <main+0xcd>
      b8:	90                   	nop
      b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      c0:	83 e8 01             	sub    $0x1,%eax
      c3:	80 78 01 20          	cmpb   $0x20,0x1(%eax)
      c7:	0f 84 53 01 00 00    	je     220 <main+0x220>
      cd:	3d 60 1f 00 00       	cmp    $0x1f60,%eax
        varBeginIndex--;
      d2:	89 c2                	mov    %eax,%edx
    char* bufIterator = buf;
    if ((equalIndex = strchr(bufIterator, '=')) != 0) {
      char var[USER_COMMAND_MAX_SIZE];
      char val[USER_COMMAND_MAX_SIZE];
      char* varBeginIndex = equalIndex - 1;
      while ((varBeginIndex != buf) && (*varBeginIndex != ' ')) //the check that var name is legal is done in the system call
      d4:	75 ea                	jne    c0 <main+0xc0>
      d6:	ba 60 1f 00 00       	mov    $0x1f60,%edx
        varBeginIndex--;
      if (varBeginIndex != buf)
        varBeginIndex++;
      if (varBeginIndex == equalIndex)
      db:	39 fa                	cmp    %edi,%edx
      dd:	0f 84 48 01 00 00    	je     22b <main+0x22b>
        break; //command in buf is probably an error
      strncpy(var, varBeginIndex, equalIndex - varBeginIndex); //copy the var to auxillary array
      e3:	89 f9                	mov    %edi,%ecx
      e5:	83 ec 04             	sub    $0x4,%esp
      e8:	29 d1                	sub    %edx,%ecx
      ea:	51                   	push   %ecx
      eb:	52                   	push   %edx
      ec:	56                   	push   %esi
      ed:	89 8d e4 fe ff ff    	mov    %ecx,-0x11c(%ebp)
      f3:	e8 d8 0e 00 00       	call   fd0 <strncpy>
      var[equalIndex - varBeginIndex] = 0; //make sure to make it a legal string
      f8:	8b 8d e4 fe ff ff    	mov    -0x11c(%ebp),%ecx
      fe:	c6 84 0d e8 fe ff ff 	movb   $0x0,-0x118(%ebp,%ecx,1)
     105:	00 
      //printf(2, "%s\n", var);
      char* valEndIndex;
      if ((valEndIndex = strchr(equalIndex, '\n')) == 0)
     106:	59                   	pop    %ecx
     107:	58                   	pop    %eax
     108:	6a 0a                	push   $0xa
     10a:	57                   	push   %edi
     10b:	e8 f0 0f 00 00       	call   1100 <strchr>
     110:	83 c4 10             	add    $0x10,%esp
     113:	85 c0                	test   %eax,%eax
     115:	0f 84 35 01 00 00    	je     250 <main+0x250>
        if ((valEndIndex = strchr(equalIndex, 0)) == 0)
          break; //command in buf is probably an error
      valEndIndex--;
     11b:	8d 50 ff             	lea    -0x1(%eax),%edx
      strncpy(val, equalIndex+1, valEndIndex - equalIndex); //copy the val to auxillary array
     11e:	83 ec 04             	sub    $0x4,%esp
     121:	89 d1                	mov    %edx,%ecx
     123:	89 95 e0 fe ff ff    	mov    %edx,-0x120(%ebp)
     129:	29 f9                	sub    %edi,%ecx
     12b:	83 c7 01             	add    $0x1,%edi
     12e:	51                   	push   %ecx
     12f:	57                   	push   %edi
     130:	53                   	push   %ebx
     131:	89 8d e4 fe ff ff    	mov    %ecx,-0x11c(%ebp)
     137:	e8 94 0e 00 00       	call   fd0 <strncpy>
      val[valEndIndex - equalIndex] = 0; //make sure to make it a legal string
      //printf(2, "%s\n", val);
      setVariable(var, val);
     13c:	58                   	pop    %eax
     13d:	5a                   	pop    %edx
      if ((valEndIndex = strchr(equalIndex, '\n')) == 0)
        if ((valEndIndex = strchr(equalIndex, 0)) == 0)
          break; //command in buf is probably an error
      valEndIndex--;
      strncpy(val, equalIndex+1, valEndIndex - equalIndex); //copy the val to auxillary array
      val[valEndIndex - equalIndex] = 0; //make sure to make it a legal string
     13e:	8b 8d e4 fe ff ff    	mov    -0x11c(%ebp),%ecx
      //printf(2, "%s\n", val);
      setVariable(var, val);
     144:	53                   	push   %ebx
     145:	56                   	push   %esi
      if ((valEndIndex = strchr(equalIndex, '\n')) == 0)
        if ((valEndIndex = strchr(equalIndex, 0)) == 0)
          break; //command in buf is probably an error
      valEndIndex--;
      strncpy(val, equalIndex+1, valEndIndex - equalIndex); //copy the val to auxillary array
      val[valEndIndex - equalIndex] = 0; //make sure to make it a legal string
     146:	c6 84 0d 68 ff ff ff 	movb   $0x0,-0x98(%ebp,%ecx,1)
     14d:	00 
      //printf(2, "%s\n", val);
      setVariable(var, val);
     14e:	e8 d5 11 00 00       	call   1328 <setVariable>
      bufIterator += valEndIndex - bufIterator + 1; //start next search after the val of the last found '='
     153:	8b 95 e0 fe ff ff    	mov    -0x120(%ebp),%edx
     159:	83 c4 10             	add    $0x10,%esp
     15c:	8d 42 01             	lea    0x1(%edx),%eax
    }
    strcpy(buf, bufIterator); //rewrite the buffer content without the variable assignments
     15f:	83 ec 08             	sub    $0x8,%esp
     162:	50                   	push   %eax
     163:	68 60 1f 00 00       	push   $0x1f60
     168:	e8 33 0e 00 00       	call   fa0 <strcpy>

    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
     16d:	83 c4 10             	add    $0x10,%esp
     170:	80 3d 60 1f 00 00 63 	cmpb   $0x63,0x1f60
     177:	75 0d                	jne    186 <main+0x186>
     179:	80 3d 61 1f 00 00 64 	cmpb   $0x64,0x1f61
     180:	0f 84 ea 00 00 00    	je     270 <main+0x270>
      if(chdir(buf+3) < 0)
        printf(2, "cannot cd %s\n", buf+3);
      continue;
    }

    if (strncmp("history", buf, 7) == 0) {
     186:	83 ec 04             	sub    $0x4,%esp
     189:	6a 07                	push   $0x7
     18b:	68 60 1f 00 00       	push   $0x1f60
     190:	68 d4 17 00 00       	push   $0x17d4
     195:	e8 b6 0e 00 00       	call   1050 <strncmp>
     19a:	83 c4 10             	add    $0x10,%esp
     19d:	85 c0                	test   %eax,%eax
     19f:	75 5a                	jne    1fb <main+0x1fb>
      if (strncmp (" -l ", buf+7, 4) == 0) {
     1a1:	83 ec 04             	sub    $0x4,%esp
     1a4:	6a 04                	push   $0x4
     1a6:	68 67 1f 00 00       	push   $0x1f67
     1ab:	68 dc 17 00 00       	push   $0x17dc
     1b0:	e8 9b 0e 00 00       	call   1050 <strncmp>
     1b5:	83 c4 10             	add    $0x10,%esp
     1b8:	85 c0                	test   %eax,%eax
     1ba:	75 74                	jne    230 <main+0x230>
        history(atoi(buf+11), buf);
     1bc:	83 ec 0c             	sub    $0xc,%esp
     1bf:	68 6b 1f 00 00       	push   $0x1f6b
     1c4:	e8 37 10 00 00       	call   1200 <atoi>
     1c9:	5a                   	pop    %edx
     1ca:	59                   	pop    %ecx
     1cb:	68 60 1f 00 00       	push   $0x1f60
     1d0:	50                   	push   %eax
     1d1:	e8 ba 01 00 00       	call   390 <history>
        if (strchr(buf, '$') != 0)
     1d6:	5f                   	pop    %edi
     1d7:	58                   	pop    %eax
     1d8:	6a 24                	push   $0x24
     1da:	68 60 1f 00 00       	push   $0x1f60
     1df:	e8 1c 0f 00 00       	call   1100 <strchr>
     1e4:	83 c4 10             	add    $0x10,%esp
     1e7:	85 c0                	test   %eax,%eax
     1e9:	74 10                	je     1fb <main+0x1fb>
          transformDollars(buf);
     1eb:	83 ec 0c             	sub    $0xc,%esp
     1ee:	68 60 1f 00 00       	push   $0x1f60
     1f3:	e8 28 03 00 00       	call   520 <transformDollars>
     1f8:	83 c4 10             	add    $0x10,%esp
int
fork1(void)
{
  int pid;

  pid = fork();
     1fb:	e8 80 10 00 00       	call   1280 <fork>
  if(pid == -1)
     200:	83 f8 ff             	cmp    $0xffffffff,%eax
     203:	0f 84 da 00 00 00    	je     2e3 <main+0x2e3>
        history(-1, buf);
        continue;
      }
    }

    if(fork1() == 0)
     209:	85 c0                	test   %eax,%eax
     20b:	0f 84 df 00 00 00    	je     2f0 <main+0x2f0>
      runcmd(parsecmd(buf));
    wait();
     211:	e8 7a 10 00 00       	call   1290 <wait>
     216:	e9 35 fe ff ff       	jmp    50 <main+0x50>
     21b:	90                   	nop
     21c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      char val[USER_COMMAND_MAX_SIZE];
      char* varBeginIndex = equalIndex - 1;
      while ((varBeginIndex != buf) && (*varBeginIndex != ' ')) //the check that var name is legal is done in the system call
        varBeginIndex--;
      if (varBeginIndex != buf)
        varBeginIndex++;
     220:	83 c2 01             	add    $0x1,%edx
      if (varBeginIndex == equalIndex)
     223:	39 fa                	cmp    %edi,%edx
     225:	0f 85 b8 fe ff ff    	jne    e3 <main+0xe3>

    if(fork1() == 0)
      runcmd(parsecmd(buf));
    wait();
  }
  exit();
     22b:	e8 58 10 00 00       	call   1288 <exit>
        history(atoi(buf+11), buf);
        if (strchr(buf, '$') != 0)
          transformDollars(buf);
      }
      else {
        history(-1, buf);
     230:	83 ec 08             	sub    $0x8,%esp
     233:	68 60 1f 00 00       	push   $0x1f60
     238:	6a ff                	push   $0xffffffff
     23a:	e8 51 01 00 00       	call   390 <history>
        continue;
     23f:	83 c4 10             	add    $0x10,%esp
     242:	e9 09 fe ff ff       	jmp    50 <main+0x50>
     247:	89 f6                	mov    %esi,%esi
     249:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      strncpy(var, varBeginIndex, equalIndex - varBeginIndex); //copy the var to auxillary array
      var[equalIndex - varBeginIndex] = 0; //make sure to make it a legal string
      //printf(2, "%s\n", var);
      char* valEndIndex;
      if ((valEndIndex = strchr(equalIndex, '\n')) == 0)
        if ((valEndIndex = strchr(equalIndex, 0)) == 0)
     250:	83 ec 08             	sub    $0x8,%esp
     253:	6a 00                	push   $0x0
     255:	57                   	push   %edi
     256:	e8 a5 0e 00 00       	call   1100 <strchr>
     25b:	83 c4 10             	add    $0x10,%esp
     25e:	85 c0                	test   %eax,%eax
     260:	0f 85 b5 fe ff ff    	jne    11b <main+0x11b>
     266:	eb c3                	jmp    22b <main+0x22b>
     268:	90                   	nop
     269:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      setVariable(var, val);
      bufIterator += valEndIndex - bufIterator + 1; //start next search after the val of the last found '='
    }
    strcpy(buf, bufIterator); //rewrite the buffer content without the variable assignments

    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
     270:	80 3d 62 1f 00 00 20 	cmpb   $0x20,0x1f62
     277:	0f 85 09 ff ff ff    	jne    186 <main+0x186>
      // Chdir must be called by the parent, not the child.
      buf[strlen(buf)-1] = 0;  // chop \n
     27d:	83 ec 0c             	sub    $0xc,%esp
     280:	68 60 1f 00 00       	push   $0x1f60
     285:	e8 26 0e 00 00       	call   10b0 <strlen>
      if(chdir(buf+3) < 0)
     28a:	c7 04 24 63 1f 00 00 	movl   $0x1f63,(%esp)
    }
    strcpy(buf, bufIterator); //rewrite the buffer content without the variable assignments

    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      // Chdir must be called by the parent, not the child.
      buf[strlen(buf)-1] = 0;  // chop \n
     291:	c6 80 5f 1f 00 00 00 	movb   $0x0,0x1f5f(%eax)
      if(chdir(buf+3) < 0)
     298:	e8 5b 10 00 00       	call   12f8 <chdir>
     29d:	83 c4 10             	add    $0x10,%esp
     2a0:	85 c0                	test   %eax,%eax
     2a2:	0f 89 a8 fd ff ff    	jns    50 <main+0x50>
        printf(2, "cannot cd %s\n", buf+3);
     2a8:	50                   	push   %eax
     2a9:	68 63 1f 00 00       	push   $0x1f63
     2ae:	68 c6 17 00 00       	push   $0x17c6
     2b3:	6a 02                	push   $0x2
     2b5:	e8 26 11 00 00       	call   13e0 <printf>
     2ba:	83 c4 10             	add    $0x10,%esp
     2bd:	e9 8e fd ff ff       	jmp    50 <main+0x50>
     2c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    enqueueHistory(buf);

    transformDollars(buf);

    char* equalIndex;
    char* bufIterator = buf;
     2c8:	b8 60 1f 00 00       	mov    $0x1f60,%eax
     2cd:	e9 8d fe ff ff       	jmp    15f <main+0x15f>
  int fd;

  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
    if(fd >= 3){
      close(fd);
     2d2:	83 ec 0c             	sub    $0xc,%esp
     2d5:	50                   	push   %eax
     2d6:	e8 d5 0f 00 00       	call   12b0 <close>
      break;
     2db:	83 c4 10             	add    $0x10,%esp
     2de:	e9 5c fd ff ff       	jmp    3f <main+0x3f>
{
  int pid;

  pid = fork();
  if(pid == -1)
    panic("fork");
     2e3:	83 ec 0c             	sub    $0xc,%esp
     2e6:	68 47 17 00 00       	push   $0x1747
     2eb:	e8 40 03 00 00       	call   630 <panic>
        continue;
      }
    }

    if(fork1() == 0)
      runcmd(parsecmd(buf));
     2f0:	83 ec 0c             	sub    $0xc,%esp
     2f3:	68 60 1f 00 00       	push   $0x1f60
     2f8:	e8 33 0c 00 00       	call   f30 <parsecmd>
     2fd:	89 04 24             	mov    %eax,(%esp)
     300:	e8 4b 03 00 00       	call   650 <runcmd>
     305:	66 90                	xchg   %ax,%ax
     307:	66 90                	xchg   %ax,%ax
     309:	66 90                	xchg   %ax,%ax
     30b:	66 90                	xchg   %ax,%ax
     30d:	66 90                	xchg   %ax,%ax
     30f:	90                   	nop

00000310 <enqueueHistory>:
char command_queue[MAX_HISTORY][USER_COMMAND_MAX_SIZE];
int queue_head_index = 0; //index of the oldest command in history (or next history line to fill)
int empty_index = 0; //index of the first empty cell in the queue (after 16 commands, there isn't an empty cell)
int next_total_index = 1;

void enqueueHistory(char* buf) {
     310:	55                   	push   %ebp
     311:	89 e5                	mov    %esp,%ebp
     313:	53                   	push   %ebx
     314:	83 ec 10             	sub    $0x10,%esp
     317:	8b 5d 08             	mov    0x8(%ebp),%ebx
  buf[strlen(buf)-1] = 0;
     31a:	53                   	push   %ebx
     31b:	e8 90 0d 00 00       	call   10b0 <strlen>
     320:	c6 44 03 ff 00       	movb   $0x0,-0x1(%ebx,%eax,1)
  strcpy(command_queue[queue_head_index], buf);
     325:	58                   	pop    %eax
     326:	a1 44 1f 00 00       	mov    0x1f44,%eax
     32b:	5a                   	pop    %edx
     32c:	53                   	push   %ebx
     32d:	c1 e0 07             	shl    $0x7,%eax
     330:	05 e0 1f 00 00       	add    $0x1fe0,%eax
     335:	50                   	push   %eax
     336:	e8 65 0c 00 00       	call   fa0 <strcpy>
  queue_head_index++;
     33b:	a1 44 1f 00 00       	mov    0x1f44,%eax
  next_total_index++;
  if (empty_index < MAX_HISTORY)
     340:	8b 15 40 1f 00 00    	mov    0x1f40,%edx
     346:	83 c4 10             	add    $0x10,%esp

void enqueueHistory(char* buf) {
  buf[strlen(buf)-1] = 0;
  strcpy(command_queue[queue_head_index], buf);
  queue_head_index++;
  next_total_index++;
     349:	83 05 20 1f 00 00 01 	addl   $0x1,0x1f20
int next_total_index = 1;

void enqueueHistory(char* buf) {
  buf[strlen(buf)-1] = 0;
  strcpy(command_queue[queue_head_index], buf);
  queue_head_index++;
     350:	83 c0 01             	add    $0x1,%eax
  next_total_index++;
  if (empty_index < MAX_HISTORY)
     353:	83 fa 0f             	cmp    $0xf,%edx
int next_total_index = 1;

void enqueueHistory(char* buf) {
  buf[strlen(buf)-1] = 0;
  strcpy(command_queue[queue_head_index], buf);
  queue_head_index++;
     356:	a3 44 1f 00 00       	mov    %eax,0x1f44
  next_total_index++;
  if (empty_index < MAX_HISTORY)
     35b:	7f 09                	jg     366 <enqueueHistory+0x56>
    empty_index++;
     35d:	83 c2 01             	add    $0x1,%edx
     360:	89 15 40 1f 00 00    	mov    %edx,0x1f40
  if (queue_head_index >= MAX_HISTORY)
     366:	83 f8 0f             	cmp    $0xf,%eax
     369:	7e 0a                	jle    375 <enqueueHistory+0x65>
    queue_head_index = 0;
     36b:	c7 05 44 1f 00 00 00 	movl   $0x0,0x1f44
     372:	00 00 00 
  buf[strlen(buf)] = '\n';
     375:	83 ec 0c             	sub    $0xc,%esp
     378:	53                   	push   %ebx
     379:	e8 32 0d 00 00       	call   10b0 <strlen>
}
     37e:	83 c4 10             	add    $0x10,%esp
  next_total_index++;
  if (empty_index < MAX_HISTORY)
    empty_index++;
  if (queue_head_index >= MAX_HISTORY)
    queue_head_index = 0;
  buf[strlen(buf)] = '\n';
     381:	c6 04 03 0a          	movb   $0xa,(%ebx,%eax,1)
}
     385:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     388:	c9                   	leave  
     389:	c3                   	ret    
     38a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000390 <history>:

void history(int commandNum, char* buf) {
     390:	55                   	push   %ebp
     391:	89 e5                	mov    %esp,%ebp
     393:	57                   	push   %edi
     394:	56                   	push   %esi
     395:	53                   	push   %ebx
     396:	83 ec 0c             	sub    $0xc,%esp
     399:	8b 45 08             	mov    0x8(%ebp),%eax
     39c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  if (commandNum==-1) {
     39f:	83 f8 ff             	cmp    $0xffffffff,%eax
     3a2:	74 7c                	je     420 <history+0x90>
      printf(2, "%d. %s\n", max(next_total_index-16+i, 1+i), command_queue[historyIterator]);
      historyIterator++;
    }
  }
  else {
    if (commandNum - 1 < next_total_index - 1 - MAX_HISTORY ||
     3a4:	8b 15 20 1f 00 00    	mov    0x1f20,%edx
     3aa:	8d 4a f0             	lea    -0x10(%edx),%ecx
     3ad:	39 c8                	cmp    %ecx,%eax
     3af:	7c 4f                	jl     400 <history+0x70>
     3b1:	39 d0                	cmp    %edx,%eax
     3b3:	7d 4b                	jge    400 <history+0x70>
        commandNum >= next_total_index) {
      printf(2, "command index error\n");
      return;
    }
    strcpy(buf, command_queue[(commandNum - 1) % 16]);
     3b5:	83 e8 01             	sub    $0x1,%eax
     3b8:	83 ec 08             	sub    $0x8,%esp
     3bb:	99                   	cltd   
     3bc:	c1 ea 1c             	shr    $0x1c,%edx
     3bf:	01 d0                	add    %edx,%eax
     3c1:	83 e0 0f             	and    $0xf,%eax
     3c4:	29 d0                	sub    %edx,%eax
     3c6:	c1 e0 07             	shl    $0x7,%eax
     3c9:	05 e0 1f 00 00       	add    $0x1fe0,%eax
     3ce:	50                   	push   %eax
     3cf:	53                   	push   %ebx
     3d0:	e8 cb 0b 00 00       	call   fa0 <strcpy>
    buf[strlen(buf)+1] = 0; 
     3d5:	89 1c 24             	mov    %ebx,(%esp)
     3d8:	e8 d3 0c 00 00       	call   10b0 <strlen>
     3dd:	c6 44 03 01 00       	movb   $0x0,0x1(%ebx,%eax,1)
    buf[strlen(buf)] = '\n'; //put newline in end of command (exec seems to expect that)
     3e2:	89 1c 24             	mov    %ebx,(%esp)
     3e5:	e8 c6 0c 00 00       	call   10b0 <strlen>
     3ea:	83 c4 10             	add    $0x10,%esp
     3ed:	c6 04 03 0a          	movb   $0xa,(%ebx,%eax,1)
  }
}
     3f1:	8d 65 f4             	lea    -0xc(%ebp),%esp
     3f4:	5b                   	pop    %ebx
     3f5:	5e                   	pop    %esi
     3f6:	5f                   	pop    %edi
     3f7:	5d                   	pop    %ebp
     3f8:	c3                   	ret    
     3f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    }
  }
  else {
    if (commandNum - 1 < next_total_index - 1 - MAX_HISTORY ||
        commandNum >= next_total_index) {
      printf(2, "command index error\n");
     400:	c7 45 0c 08 17 00 00 	movl   $0x1708,0xc(%ebp)
     407:	c7 45 08 02 00 00 00 	movl   $0x2,0x8(%ebp)
    }
    strcpy(buf, command_queue[(commandNum - 1) % 16]);
    buf[strlen(buf)+1] = 0; 
    buf[strlen(buf)] = '\n'; //put newline in end of command (exec seems to expect that)
  }
}
     40e:	8d 65 f4             	lea    -0xc(%ebp),%esp
     411:	5b                   	pop    %ebx
     412:	5e                   	pop    %esi
     413:	5f                   	pop    %edi
     414:	5d                   	pop    %ebp
    }
  }
  else {
    if (commandNum - 1 < next_total_index - 1 - MAX_HISTORY ||
        commandNum >= next_total_index) {
      printf(2, "command index error\n");
     415:	e9 c6 0f 00 00       	jmp    13e0 <printf>
     41a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
}

void history(int commandNum, char* buf) {
  if (commandNum==-1) {
    int historyIterator;
    if (empty_index >= MAX_HISTORY)
     420:	a1 40 1f 00 00       	mov    0x1f40,%eax
      historyIterator = queue_head_index;
     425:	8b 1d 44 1f 00 00    	mov    0x1f44,%ebx
}

void history(int commandNum, char* buf) {
  if (commandNum==-1) {
    int historyIterator;
    if (empty_index >= MAX_HISTORY)
     42b:	83 f8 0f             	cmp    $0xf,%eax
     42e:	7e 60                	jle    490 <history+0x100>
      historyIterator = queue_head_index;
    else
      historyIterator = 0;
     430:	31 c0                	xor    %eax,%eax
     432:	eb 48                	jmp    47c <history+0xec>
     434:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     438:	89 de                	mov    %ebx,%esi
     43a:	83 c3 01             	add    $0x1,%ebx
     43d:	c1 e6 07             	shl    $0x7,%esi
     440:	81 c6 e0 1f 00 00    	add    $0x1fe0,%esi
    for (int i=0; i<empty_index; i++) {
      if (historyIterator >= MAX_HISTORY)
        historyIterator = 0;
      printf(2, "%d. %s\n", max(next_total_index-16+i, 1+i), command_queue[historyIterator]);
     446:	8b 15 20 1f 00 00    	mov    0x1f20,%edx
     44c:	8d 78 01             	lea    0x1(%eax),%edi
     44f:	83 ec 08             	sub    $0x8,%esp
     452:	57                   	push   %edi
     453:	8d 44 10 f0          	lea    -0x10(%eax,%edx,1),%eax
     457:	50                   	push   %eax
     458:	e8 13 0e 00 00       	call   1270 <max>
     45d:	56                   	push   %esi
     45e:	50                   	push   %eax
     45f:	68 00 17 00 00       	push   $0x1700
     464:	6a 02                	push   $0x2
     466:	e8 75 0f 00 00       	call   13e0 <printf>
    int historyIterator;
    if (empty_index >= MAX_HISTORY)
      historyIterator = queue_head_index;
    else
      historyIterator = 0;
    for (int i=0; i<empty_index; i++) {
     46b:	83 c4 20             	add    $0x20,%esp
     46e:	39 3d 40 1f 00 00    	cmp    %edi,0x1f40
     474:	89 f8                	mov    %edi,%eax
     476:	0f 8e 75 ff ff ff    	jle    3f1 <history+0x61>
      if (historyIterator >= MAX_HISTORY)
     47c:	83 fb 0f             	cmp    $0xf,%ebx
     47f:	7e b7                	jle    438 <history+0xa8>
     481:	bb 01 00 00 00       	mov    $0x1,%ebx
     486:	be e0 1f 00 00       	mov    $0x1fe0,%esi
     48b:	eb b9                	jmp    446 <history+0xb6>
     48d:	8d 76 00             	lea    0x0(%esi),%esi
  if (commandNum==-1) {
    int historyIterator;
    if (empty_index >= MAX_HISTORY)
      historyIterator = queue_head_index;
    else
      historyIterator = 0;
     490:	31 db                	xor    %ebx,%ebx
    for (int i=0; i<empty_index; i++) {
     492:	85 c0                	test   %eax,%eax
     494:	7f 9a                	jg     430 <history+0xa0>
     496:	e9 56 ff ff ff       	jmp    3f1 <history+0x61>
     49b:	90                   	nop
     49c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000004a0 <getcmd>:
  exit();
}

int
getcmd(char *buf, int nbuf)
{
     4a0:	55                   	push   %ebp
     4a1:	89 e5                	mov    %esp,%ebp
     4a3:	56                   	push   %esi
     4a4:	53                   	push   %ebx
     4a5:	8b 75 0c             	mov    0xc(%ebp),%esi
     4a8:	8b 5d 08             	mov    0x8(%ebp),%ebx
  printf(2, "$ ");
     4ab:	83 ec 08             	sub    $0x8,%esp
     4ae:	68 1d 17 00 00       	push   $0x171d
     4b3:	6a 02                	push   $0x2
     4b5:	e8 26 0f 00 00       	call   13e0 <printf>
  memset(buf, 0, nbuf);
     4ba:	83 c4 0c             	add    $0xc,%esp
     4bd:	56                   	push   %esi
     4be:	6a 00                	push   $0x0
     4c0:	53                   	push   %ebx
     4c1:	e8 1a 0c 00 00       	call   10e0 <memset>
  gets(buf, nbuf);
     4c6:	58                   	pop    %eax
     4c7:	5a                   	pop    %edx
     4c8:	56                   	push   %esi
     4c9:	53                   	push   %ebx
     4ca:	e8 71 0c 00 00       	call   1140 <gets>
  if(buf[0] == 0) // EOF
     4cf:	83 c4 10             	add    $0x10,%esp
     4d2:	31 c0                	xor    %eax,%eax
     4d4:	80 3b 00             	cmpb   $0x0,(%ebx)
     4d7:	0f 94 c0             	sete   %al
    return -1;
  return 0;
}
     4da:	8d 65 f8             	lea    -0x8(%ebp),%esp
getcmd(char *buf, int nbuf)
{
  printf(2, "$ ");
  memset(buf, 0, nbuf);
  gets(buf, nbuf);
  if(buf[0] == 0) // EOF
     4dd:	f7 d8                	neg    %eax
    return -1;
  return 0;
}
     4df:	5b                   	pop    %ebx
     4e0:	5e                   	pop    %esi
     4e1:	5d                   	pop    %ebp
     4e2:	c3                   	ret    
     4e3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     4e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000004f0 <isLetter>:

int isLetter(char c) {
     4f0:	55                   	push   %ebp
     4f1:	89 e5                	mov    %esp,%ebp
     4f3:	8b 55 08             	mov    0x8(%ebp),%edx
  if(c < 'A' || c > 'z' ||
       (c > 'Z' && c < 'a'))
      return 0;
  return 1;
}
     4f6:	5d                   	pop    %ebp
    return -1;
  return 0;
}

int isLetter(char c) {
  if(c < 'A' || c > 'z' ||
     4f7:	8d 42 bf             	lea    -0x41(%edx),%eax
     4fa:	3c 39                	cmp    $0x39,%al
     4fc:	0f 97 c0             	seta   %al
       (c > 'Z' && c < 'a'))
     4ff:	83 ea 5b             	sub    $0x5b,%edx
     502:	80 fa 05             	cmp    $0x5,%dl
     505:	0f 96 c2             	setbe  %dl
    return -1;
  return 0;
}

int isLetter(char c) {
  if(c < 'A' || c > 'z' ||
     508:	09 d0                	or     %edx,%eax
     50a:	83 f0 01             	xor    $0x1,%eax
       (c > 'Z' && c < 'a'))
      return 0;
     50d:	0f b6 c0             	movzbl %al,%eax
  return 1;
}
     510:	c3                   	ret    
     511:	eb 0d                	jmp    520 <transformDollars>
     513:	90                   	nop
     514:	90                   	nop
     515:	90                   	nop
     516:	90                   	nop
     517:	90                   	nop
     518:	90                   	nop
     519:	90                   	nop
     51a:	90                   	nop
     51b:	90                   	nop
     51c:	90                   	nop
     51d:	90                   	nop
     51e:	90                   	nop
     51f:	90                   	nop

00000520 <transformDollars>:

void transformDollars(char* buf) {
     520:	55                   	push   %ebp
     521:	89 e5                	mov    %esp,%ebp
     523:	57                   	push   %edi
     524:	56                   	push   %esi
     525:	53                   	push   %ebx
     526:	81 ec 8c 01 00 00    	sub    $0x18c,%esp
     52c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  char* dollarIndex;
  while ((dollarIndex = strchr(buf, '$')) != 0) {
     530:	83 ec 08             	sub    $0x8,%esp
     533:	6a 24                	push   $0x24
     535:	ff 75 08             	pushl  0x8(%ebp)
     538:	e8 c3 0b 00 00       	call   1100 <strchr>
     53d:	83 c4 10             	add    $0x10,%esp
     540:	85 c0                	test   %eax,%eax
     542:	89 c6                	mov    %eax,%esi
     544:	0f 84 cd 00 00 00    	je     617 <transformDollars+0xf7>
    return -1;
  return 0;
}

int isLetter(char c) {
  if(c < 'A' || c > 'z' ||
     54a:	0f b6 56 01          	movzbl 0x1(%esi),%edx
  char* dollarIndex;
  while ((dollarIndex = strchr(buf, '$')) != 0) {
    char var[USER_COMMAND_MAX_SIZE];
    char val[USER_COMMAND_MAX_SIZE];
    char restOfCommand[USER_COMMAND_MAX_SIZE];
    char* varLastIndex = dollarIndex + 1;
     54e:	8d 46 01             	lea    0x1(%esi),%eax
    return -1;
  return 0;
}

int isLetter(char c) {
  if(c < 'A' || c > 'z' ||
     551:	8d 5a bf             	lea    -0x41(%edx),%ebx
     554:	80 fb 39             	cmp    $0x39,%bl
     557:	0f 87 c2 00 00 00    	ja     61f <transformDollars+0xff>
       (c > 'Z' && c < 'a'))
     55d:	83 ea 5b             	sub    $0x5b,%edx
    return -1;
  return 0;
}

int isLetter(char c) {
  if(c < 'A' || c > 'z' ||
     560:	89 c3                	mov    %eax,%ebx
     562:	80 fa 05             	cmp    $0x5,%dl
     565:	77 11                	ja     578 <transformDollars+0x58>
     567:	e9 b3 00 00 00       	jmp    61f <transformDollars+0xff>
     56c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
       (c > 'Z' && c < 'a'))
     570:	83 ea 5b             	sub    $0x5b,%edx
    return -1;
  return 0;
}

int isLetter(char c) {
  if(c < 'A' || c > 'z' ||
     573:	80 fa 05             	cmp    $0x5,%dl
     576:	76 0e                	jbe    586 <transformDollars+0x66>
    char var[USER_COMMAND_MAX_SIZE];
    char val[USER_COMMAND_MAX_SIZE];
    char restOfCommand[USER_COMMAND_MAX_SIZE];
    char* varLastIndex = dollarIndex + 1;
    while (isLetter(*varLastIndex))
      varLastIndex++;
     578:	83 c3 01             	add    $0x1,%ebx
    return -1;
  return 0;
}

int isLetter(char c) {
  if(c < 'A' || c > 'z' ||
     57b:	0f b6 13             	movzbl (%ebx),%edx
     57e:	8d 4a bf             	lea    -0x41(%edx),%ecx
     581:	80 f9 39             	cmp    $0x39,%cl
     584:	76 ea                	jbe    570 <transformDollars+0x50>
    char val[USER_COMMAND_MAX_SIZE];
    char restOfCommand[USER_COMMAND_MAX_SIZE];
    char* varLastIndex = dollarIndex + 1;
    while (isLetter(*varLastIndex))
      varLastIndex++;
    varLastIndex--;
     586:	8d 7b ff             	lea    -0x1(%ebx),%edi
    strncpy(var, dollarIndex+1, varLastIndex-dollarIndex); //copy the var to auxillary array
     589:	83 ec 04             	sub    $0x4,%esp
     58c:	29 f7                	sub    %esi,%edi
     58e:	57                   	push   %edi
     58f:	50                   	push   %eax
     590:	8d 85 68 fe ff ff    	lea    -0x198(%ebp),%eax
     596:	50                   	push   %eax
     597:	e8 34 0a 00 00       	call   fd0 <strncpy>
    var[varLastIndex-dollarIndex] = 0; //make sure to make it a legal string
    if (getVariable(var, val) < 0) { //get the variable value
     59c:	8d 85 e8 fe ff ff    	lea    -0x118(%ebp),%eax
    char* varLastIndex = dollarIndex + 1;
    while (isLetter(*varLastIndex))
      varLastIndex++;
    varLastIndex--;
    strncpy(var, dollarIndex+1, varLastIndex-dollarIndex); //copy the var to auxillary array
    var[varLastIndex-dollarIndex] = 0; //make sure to make it a legal string
     5a2:	c6 84 3d 68 fe ff ff 	movb   $0x0,-0x198(%ebp,%edi,1)
     5a9:	00 
    if (getVariable(var, val) < 0) { //get the variable value
     5aa:	59                   	pop    %ecx
     5ab:	5f                   	pop    %edi
     5ac:	50                   	push   %eax
     5ad:	8d 85 68 fe ff ff    	lea    -0x198(%ebp),%eax
     5b3:	50                   	push   %eax
     5b4:	e8 77 0d 00 00       	call   1330 <getVariable>
     5b9:	83 c4 10             	add    $0x10,%esp
     5bc:	85 c0                	test   %eax,%eax
     5be:	78 48                	js     608 <transformDollars+0xe8>
      strcpy(dollarIndex, varLastIndex+1); //remove the dollar var from the buffer (ubuntu behavior)
    }
    int valLength = strlen(val); //save the value length to use soon in restoring the rest of the command
     5c0:	8d 85 e8 fe ff ff    	lea    -0x118(%ebp),%eax
     5c6:	83 ec 0c             	sub    $0xc,%esp
     5c9:	50                   	push   %eax
     5ca:	e8 e1 0a 00 00       	call   10b0 <strlen>
     5cf:	89 c7                	mov    %eax,%edi
    strcpy(restOfCommand, varLastIndex+1); //copy the rest of the command to another auxillay array
     5d1:	58                   	pop    %eax
     5d2:	5a                   	pop    %edx
     5d3:	53                   	push   %ebx
     5d4:	8d 9d 68 ff ff ff    	lea    -0x98(%ebp),%ebx
    strcpy(dollarIndex, val); //copy the val to the buffer
    strcpy(dollarIndex+valLength, restOfCommand); //restore the rest of the command to the buffer
     5da:	01 f7                	add    %esi,%edi
    var[varLastIndex-dollarIndex] = 0; //make sure to make it a legal string
    if (getVariable(var, val) < 0) { //get the variable value
      strcpy(dollarIndex, varLastIndex+1); //remove the dollar var from the buffer (ubuntu behavior)
    }
    int valLength = strlen(val); //save the value length to use soon in restoring the rest of the command
    strcpy(restOfCommand, varLastIndex+1); //copy the rest of the command to another auxillay array
     5dc:	53                   	push   %ebx
     5dd:	e8 be 09 00 00       	call   fa0 <strcpy>
    strcpy(dollarIndex, val); //copy the val to the buffer
     5e2:	59                   	pop    %ecx
     5e3:	58                   	pop    %eax
     5e4:	8d 85 e8 fe ff ff    	lea    -0x118(%ebp),%eax
     5ea:	50                   	push   %eax
     5eb:	56                   	push   %esi
     5ec:	e8 af 09 00 00       	call   fa0 <strcpy>
    strcpy(dollarIndex+valLength, restOfCommand); //restore the rest of the command to the buffer
     5f1:	58                   	pop    %eax
     5f2:	5a                   	pop    %edx
     5f3:	53                   	push   %ebx
     5f4:	57                   	push   %edi
     5f5:	e8 a6 09 00 00       	call   fa0 <strcpy>
     5fa:	83 c4 10             	add    $0x10,%esp
     5fd:	e9 2e ff ff ff       	jmp    530 <transformDollars+0x10>
     602:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      varLastIndex++;
    varLastIndex--;
    strncpy(var, dollarIndex+1, varLastIndex-dollarIndex); //copy the var to auxillary array
    var[varLastIndex-dollarIndex] = 0; //make sure to make it a legal string
    if (getVariable(var, val) < 0) { //get the variable value
      strcpy(dollarIndex, varLastIndex+1); //remove the dollar var from the buffer (ubuntu behavior)
     608:	83 ec 08             	sub    $0x8,%esp
     60b:	53                   	push   %ebx
     60c:	56                   	push   %esi
     60d:	e8 8e 09 00 00       	call   fa0 <strcpy>
     612:	83 c4 10             	add    $0x10,%esp
     615:	eb a9                	jmp    5c0 <transformDollars+0xa0>
    int valLength = strlen(val); //save the value length to use soon in restoring the rest of the command
    strcpy(restOfCommand, varLastIndex+1); //copy the rest of the command to another auxillay array
    strcpy(dollarIndex, val); //copy the val to the buffer
    strcpy(dollarIndex+valLength, restOfCommand); //restore the rest of the command to the buffer
  }
}
     617:	8d 65 f4             	lea    -0xc(%ebp),%esp
     61a:	5b                   	pop    %ebx
     61b:	5e                   	pop    %esi
     61c:	5f                   	pop    %edi
     61d:	5d                   	pop    %ebp
     61e:	c3                   	ret    
  char* dollarIndex;
  while ((dollarIndex = strchr(buf, '$')) != 0) {
    char var[USER_COMMAND_MAX_SIZE];
    char val[USER_COMMAND_MAX_SIZE];
    char restOfCommand[USER_COMMAND_MAX_SIZE];
    char* varLastIndex = dollarIndex + 1;
     61f:	89 c3                	mov    %eax,%ebx
     621:	e9 60 ff ff ff       	jmp    586 <transformDollars+0x66>
     626:	8d 76 00             	lea    0x0(%esi),%esi
     629:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000630 <panic>:
  exit();
}

void
panic(char *s)
{
     630:	55                   	push   %ebp
     631:	89 e5                	mov    %esp,%ebp
     633:	83 ec 0c             	sub    $0xc,%esp
  printf(2, "%s\n", s);
     636:	ff 75 08             	pushl  0x8(%ebp)
     639:	68 04 17 00 00       	push   $0x1704
     63e:	6a 02                	push   $0x2
     640:	e8 9b 0d 00 00       	call   13e0 <printf>
  exit();
     645:	e8 3e 0c 00 00       	call   1288 <exit>
     64a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000650 <runcmd>:
struct cmd *parsecmd(char*);

// Execute cmd.  Never returns.
void
runcmd(struct cmd *cmd)
{
     650:	55                   	push   %ebp
     651:	89 e5                	mov    %esp,%ebp
     653:	53                   	push   %ebx
     654:	83 ec 14             	sub    $0x14,%esp
     657:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     65a:	85 db                	test   %ebx,%ebx
     65c:	74 76                	je     6d4 <runcmd+0x84>
    exit();

  switch(cmd->type){
     65e:	83 3b 05             	cmpl   $0x5,(%ebx)
     661:	0f 87 f8 00 00 00    	ja     75f <runcmd+0x10f>
     667:	8b 03                	mov    (%ebx),%eax
     669:	ff 24 85 e4 17 00 00 	jmp    *0x17e4(,%eax,4)
    runcmd(lcmd->right);
    break;

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
    if(pipe(p) < 0)
     670:	8d 45 f0             	lea    -0x10(%ebp),%eax
     673:	83 ec 0c             	sub    $0xc,%esp
     676:	50                   	push   %eax
     677:	e8 1c 0c 00 00       	call   1298 <pipe>
     67c:	83 c4 10             	add    $0x10,%esp
     67f:	85 c0                	test   %eax,%eax
     681:	0f 88 07 01 00 00    	js     78e <runcmd+0x13e>
int
fork1(void)
{
  int pid;

  pid = fork();
     687:	e8 f4 0b 00 00       	call   1280 <fork>
  if(pid == -1)
     68c:	83 f8 ff             	cmp    $0xffffffff,%eax
     68f:	0f 84 d7 00 00 00    	je     76c <runcmd+0x11c>

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
    if(pipe(p) < 0)
      panic("pipe");
    if(fork1() == 0){
     695:	85 c0                	test   %eax,%eax
     697:	0f 84 fe 00 00 00    	je     79b <runcmd+0x14b>
int
fork1(void)
{
  int pid;

  pid = fork();
     69d:	e8 de 0b 00 00       	call   1280 <fork>
  if(pid == -1)
     6a2:	83 f8 ff             	cmp    $0xffffffff,%eax
     6a5:	0f 84 c1 00 00 00    	je     76c <runcmd+0x11c>
      dup(p[1]);
      close(p[0]);
      close(p[1]);
      runcmd(pcmd->left);
    }
    if(fork1() == 0){
     6ab:	85 c0                	test   %eax,%eax
     6ad:	0f 84 16 01 00 00    	je     7c9 <runcmd+0x179>
      dup(p[0]);
      close(p[0]);
      close(p[1]);
      runcmd(pcmd->right);
    }
    close(p[0]);
     6b3:	83 ec 0c             	sub    $0xc,%esp
     6b6:	ff 75 f0             	pushl  -0x10(%ebp)
     6b9:	e8 f2 0b 00 00       	call   12b0 <close>
    close(p[1]);
     6be:	58                   	pop    %eax
     6bf:	ff 75 f4             	pushl  -0xc(%ebp)
     6c2:	e8 e9 0b 00 00       	call   12b0 <close>
    wait();
     6c7:	e8 c4 0b 00 00       	call   1290 <wait>
    wait();
     6cc:	e8 bf 0b 00 00       	call   1290 <wait>
    break;
     6d1:	83 c4 10             	add    $0x10,%esp
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
    exit();
     6d4:	e8 af 0b 00 00       	call   1288 <exit>
int
fork1(void)
{
  int pid;

  pid = fork();
     6d9:	e8 a2 0b 00 00       	call   1280 <fork>
  if(pid == -1)
     6de:	83 f8 ff             	cmp    $0xffffffff,%eax
     6e1:	0f 84 85 00 00 00    	je     76c <runcmd+0x11c>
    wait();
    break;

  case BACK:
    bcmd = (struct backcmd*)cmd;
    if(fork1() == 0)
     6e7:	85 c0                	test   %eax,%eax
     6e9:	75 e9                	jne    6d4 <runcmd+0x84>
     6eb:	eb 49                	jmp    736 <runcmd+0xe6>
  default:
    panic("runcmd");

  case EXEC:
    ecmd = (struct execcmd*)cmd;
    if(ecmd->argv[0] == 0)
     6ed:	8b 43 04             	mov    0x4(%ebx),%eax
     6f0:	85 c0                	test   %eax,%eax
     6f2:	74 e0                	je     6d4 <runcmd+0x84>
      exit();
    exec(ecmd->argv[0], ecmd->argv);
     6f4:	52                   	push   %edx
     6f5:	52                   	push   %edx
     6f6:	8d 53 04             	lea    0x4(%ebx),%edx
     6f9:	52                   	push   %edx
     6fa:	50                   	push   %eax
     6fb:	e8 c0 0b 00 00       	call   12c0 <exec>
    printf(2, "exec %s failed\n", ecmd->argv[0]);
     700:	83 c4 0c             	add    $0xc,%esp
     703:	ff 73 04             	pushl  0x4(%ebx)
     706:	68 27 17 00 00       	push   $0x1727
     70b:	6a 02                	push   $0x2
     70d:	e8 ce 0c 00 00       	call   13e0 <printf>
    break;
     712:	83 c4 10             	add    $0x10,%esp
     715:	eb bd                	jmp    6d4 <runcmd+0x84>

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    close(rcmd->fd);
     717:	83 ec 0c             	sub    $0xc,%esp
     71a:	ff 73 14             	pushl  0x14(%ebx)
     71d:	e8 8e 0b 00 00       	call   12b0 <close>
    if(open(rcmd->file, rcmd->mode) < 0){
     722:	59                   	pop    %ecx
     723:	58                   	pop    %eax
     724:	ff 73 10             	pushl  0x10(%ebx)
     727:	ff 73 08             	pushl  0x8(%ebx)
     72a:	e8 99 0b 00 00       	call   12c8 <open>
     72f:	83 c4 10             	add    $0x10,%esp
     732:	85 c0                	test   %eax,%eax
     734:	78 43                	js     779 <runcmd+0x129>
    break;

  case BACK:
    bcmd = (struct backcmd*)cmd;
    if(fork1() == 0)
      runcmd(bcmd->cmd);
     736:	83 ec 0c             	sub    $0xc,%esp
     739:	ff 73 04             	pushl  0x4(%ebx)
     73c:	e8 0f ff ff ff       	call   650 <runcmd>
int
fork1(void)
{
  int pid;

  pid = fork();
     741:	e8 3a 0b 00 00       	call   1280 <fork>
  if(pid == -1)
     746:	83 f8 ff             	cmp    $0xffffffff,%eax
     749:	74 21                	je     76c <runcmd+0x11c>
    runcmd(rcmd->cmd);
    break;

  case LIST:
    lcmd = (struct listcmd*)cmd;
    if(fork1() == 0)
     74b:	85 c0                	test   %eax,%eax
     74d:	74 e7                	je     736 <runcmd+0xe6>
      runcmd(lcmd->left);
    wait();
     74f:	e8 3c 0b 00 00       	call   1290 <wait>
    runcmd(lcmd->right);
     754:	83 ec 0c             	sub    $0xc,%esp
     757:	ff 73 08             	pushl  0x8(%ebx)
     75a:	e8 f1 fe ff ff       	call   650 <runcmd>
  if(cmd == 0)
    exit();

  switch(cmd->type){
  default:
    panic("runcmd");
     75f:	83 ec 0c             	sub    $0xc,%esp
     762:	68 20 17 00 00       	push   $0x1720
     767:	e8 c4 fe ff ff       	call   630 <panic>
{
  int pid;

  pid = fork();
  if(pid == -1)
    panic("fork");
     76c:	83 ec 0c             	sub    $0xc,%esp
     76f:	68 47 17 00 00       	push   $0x1747
     774:	e8 b7 fe ff ff       	call   630 <panic>

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    close(rcmd->fd);
    if(open(rcmd->file, rcmd->mode) < 0){
      printf(2, "open %s failed\n", rcmd->file);
     779:	52                   	push   %edx
     77a:	ff 73 08             	pushl  0x8(%ebx)
     77d:	68 37 17 00 00       	push   $0x1737
     782:	6a 02                	push   $0x2
     784:	e8 57 0c 00 00       	call   13e0 <printf>
      exit();
     789:	e8 fa 0a 00 00       	call   1288 <exit>
    break;

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
    if(pipe(p) < 0)
      panic("pipe");
     78e:	83 ec 0c             	sub    $0xc,%esp
     791:	68 4c 17 00 00       	push   $0x174c
     796:	e8 95 fe ff ff       	call   630 <panic>
    if(fork1() == 0){
      close(1);
     79b:	83 ec 0c             	sub    $0xc,%esp
     79e:	6a 01                	push   $0x1
     7a0:	e8 0b 0b 00 00       	call   12b0 <close>
      dup(p[1]);
     7a5:	58                   	pop    %eax
     7a6:	ff 75 f4             	pushl  -0xc(%ebp)
     7a9:	e8 52 0b 00 00       	call   1300 <dup>
      close(p[0]);
     7ae:	58                   	pop    %eax
     7af:	ff 75 f0             	pushl  -0x10(%ebp)
     7b2:	e8 f9 0a 00 00       	call   12b0 <close>
      close(p[1]);
     7b7:	58                   	pop    %eax
     7b8:	ff 75 f4             	pushl  -0xc(%ebp)
     7bb:	e8 f0 0a 00 00       	call   12b0 <close>
      runcmd(pcmd->left);
     7c0:	58                   	pop    %eax
     7c1:	ff 73 04             	pushl  0x4(%ebx)
     7c4:	e8 87 fe ff ff       	call   650 <runcmd>
    }
    if(fork1() == 0){
      close(0);
     7c9:	83 ec 0c             	sub    $0xc,%esp
     7cc:	6a 00                	push   $0x0
     7ce:	e8 dd 0a 00 00       	call   12b0 <close>
      dup(p[0]);
     7d3:	5a                   	pop    %edx
     7d4:	ff 75 f0             	pushl  -0x10(%ebp)
     7d7:	e8 24 0b 00 00       	call   1300 <dup>
      close(p[0]);
     7dc:	59                   	pop    %ecx
     7dd:	ff 75 f0             	pushl  -0x10(%ebp)
     7e0:	e8 cb 0a 00 00       	call   12b0 <close>
      close(p[1]);
     7e5:	58                   	pop    %eax
     7e6:	ff 75 f4             	pushl  -0xc(%ebp)
     7e9:	e8 c2 0a 00 00       	call   12b0 <close>
      runcmd(pcmd->right);
     7ee:	58                   	pop    %eax
     7ef:	ff 73 08             	pushl  0x8(%ebx)
     7f2:	e8 59 fe ff ff       	call   650 <runcmd>
     7f7:	89 f6                	mov    %esi,%esi
     7f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000800 <fork1>:
  exit();
}

int
fork1(void)
{
     800:	55                   	push   %ebp
     801:	89 e5                	mov    %esp,%ebp
     803:	83 ec 08             	sub    $0x8,%esp
  int pid;

  pid = fork();
     806:	e8 75 0a 00 00       	call   1280 <fork>
  if(pid == -1)
     80b:	83 f8 ff             	cmp    $0xffffffff,%eax
     80e:	74 02                	je     812 <fork1+0x12>
    panic("fork");
  return pid;
}
     810:	c9                   	leave  
     811:	c3                   	ret    
{
  int pid;

  pid = fork();
  if(pid == -1)
    panic("fork");
     812:	83 ec 0c             	sub    $0xc,%esp
     815:	68 47 17 00 00       	push   $0x1747
     81a:	e8 11 fe ff ff       	call   630 <panic>
     81f:	90                   	nop

00000820 <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
     820:	55                   	push   %ebp
     821:	89 e5                	mov    %esp,%ebp
     823:	53                   	push   %ebx
     824:	83 ec 10             	sub    $0x10,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     827:	6a 54                	push   $0x54
     829:	e8 f2 0d 00 00       	call   1620 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     82e:	83 c4 0c             	add    $0xc,%esp
struct cmd*
execcmd(void)
{
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     831:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     833:	6a 54                	push   $0x54
     835:	6a 00                	push   $0x0
     837:	50                   	push   %eax
     838:	e8 a3 08 00 00       	call   10e0 <memset>
  cmd->type = EXEC;
     83d:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  return (struct cmd*)cmd;
}
     843:	89 d8                	mov    %ebx,%eax
     845:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     848:	c9                   	leave  
     849:	c3                   	ret    
     84a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000850 <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     850:	55                   	push   %ebp
     851:	89 e5                	mov    %esp,%ebp
     853:	53                   	push   %ebx
     854:	83 ec 10             	sub    $0x10,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     857:	6a 18                	push   $0x18
     859:	e8 c2 0d 00 00       	call   1620 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     85e:	83 c4 0c             	add    $0xc,%esp
struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     861:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     863:	6a 18                	push   $0x18
     865:	6a 00                	push   $0x0
     867:	50                   	push   %eax
     868:	e8 73 08 00 00       	call   10e0 <memset>
  cmd->type = REDIR;
  cmd->cmd = subcmd;
     86d:	8b 45 08             	mov    0x8(%ebp),%eax
{
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = REDIR;
     870:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
  cmd->cmd = subcmd;
     876:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->file = file;
     879:	8b 45 0c             	mov    0xc(%ebp),%eax
     87c:	89 43 08             	mov    %eax,0x8(%ebx)
  cmd->efile = efile;
     87f:	8b 45 10             	mov    0x10(%ebp),%eax
     882:	89 43 0c             	mov    %eax,0xc(%ebx)
  cmd->mode = mode;
     885:	8b 45 14             	mov    0x14(%ebp),%eax
     888:	89 43 10             	mov    %eax,0x10(%ebx)
  cmd->fd = fd;
     88b:	8b 45 18             	mov    0x18(%ebp),%eax
     88e:	89 43 14             	mov    %eax,0x14(%ebx)
  return (struct cmd*)cmd;
}
     891:	89 d8                	mov    %ebx,%eax
     893:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     896:	c9                   	leave  
     897:	c3                   	ret    
     898:	90                   	nop
     899:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000008a0 <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
     8a0:	55                   	push   %ebp
     8a1:	89 e5                	mov    %esp,%ebp
     8a3:	53                   	push   %ebx
     8a4:	83 ec 10             	sub    $0x10,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     8a7:	6a 0c                	push   $0xc
     8a9:	e8 72 0d 00 00       	call   1620 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     8ae:	83 c4 0c             	add    $0xc,%esp
struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     8b1:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     8b3:	6a 0c                	push   $0xc
     8b5:	6a 00                	push   $0x0
     8b7:	50                   	push   %eax
     8b8:	e8 23 08 00 00       	call   10e0 <memset>
  cmd->type = PIPE;
  cmd->left = left;
     8bd:	8b 45 08             	mov    0x8(%ebp),%eax
{
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = PIPE;
     8c0:	c7 03 03 00 00 00    	movl   $0x3,(%ebx)
  cmd->left = left;
     8c6:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     8c9:	8b 45 0c             	mov    0xc(%ebp),%eax
     8cc:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     8cf:	89 d8                	mov    %ebx,%eax
     8d1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     8d4:	c9                   	leave  
     8d5:	c3                   	ret    
     8d6:	8d 76 00             	lea    0x0(%esi),%esi
     8d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000008e0 <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
     8e0:	55                   	push   %ebp
     8e1:	89 e5                	mov    %esp,%ebp
     8e3:	53                   	push   %ebx
     8e4:	83 ec 10             	sub    $0x10,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     8e7:	6a 0c                	push   $0xc
     8e9:	e8 32 0d 00 00       	call   1620 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     8ee:	83 c4 0c             	add    $0xc,%esp
struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     8f1:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     8f3:	6a 0c                	push   $0xc
     8f5:	6a 00                	push   $0x0
     8f7:	50                   	push   %eax
     8f8:	e8 e3 07 00 00       	call   10e0 <memset>
  cmd->type = LIST;
  cmd->left = left;
     8fd:	8b 45 08             	mov    0x8(%ebp),%eax
{
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = LIST;
     900:	c7 03 04 00 00 00    	movl   $0x4,(%ebx)
  cmd->left = left;
     906:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     909:	8b 45 0c             	mov    0xc(%ebp),%eax
     90c:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     90f:	89 d8                	mov    %ebx,%eax
     911:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     914:	c9                   	leave  
     915:	c3                   	ret    
     916:	8d 76 00             	lea    0x0(%esi),%esi
     919:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000920 <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
     920:	55                   	push   %ebp
     921:	89 e5                	mov    %esp,%ebp
     923:	53                   	push   %ebx
     924:	83 ec 10             	sub    $0x10,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     927:	6a 08                	push   $0x8
     929:	e8 f2 0c 00 00       	call   1620 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     92e:	83 c4 0c             	add    $0xc,%esp
struct cmd*
backcmd(struct cmd *subcmd)
{
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     931:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     933:	6a 08                	push   $0x8
     935:	6a 00                	push   $0x0
     937:	50                   	push   %eax
     938:	e8 a3 07 00 00       	call   10e0 <memset>
  cmd->type = BACK;
  cmd->cmd = subcmd;
     93d:	8b 45 08             	mov    0x8(%ebp),%eax
{
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = BACK;
     940:	c7 03 05 00 00 00    	movl   $0x5,(%ebx)
  cmd->cmd = subcmd;
     946:	89 43 04             	mov    %eax,0x4(%ebx)
  return (struct cmd*)cmd;
}
     949:	89 d8                	mov    %ebx,%eax
     94b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     94e:	c9                   	leave  
     94f:	c3                   	ret    

00000950 <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     950:	55                   	push   %ebp
     951:	89 e5                	mov    %esp,%ebp
     953:	57                   	push   %edi
     954:	56                   	push   %esi
     955:	53                   	push   %ebx
     956:	83 ec 0c             	sub    $0xc,%esp
  char *s;
  int ret;

  s = *ps;
     959:	8b 45 08             	mov    0x8(%ebp),%eax
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     95c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     95f:	8b 7d 10             	mov    0x10(%ebp),%edi
  char *s;
  int ret;

  s = *ps;
     962:	8b 30                	mov    (%eax),%esi
  while(s < es && strchr(whitespace, *s))
     964:	39 de                	cmp    %ebx,%esi
     966:	72 0f                	jb     977 <gettoken+0x27>
     968:	eb 25                	jmp    98f <gettoken+0x3f>
     96a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    s++;
     970:	83 c6 01             	add    $0x1,%esi
{
  char *s;
  int ret;

  s = *ps;
  while(s < es && strchr(whitespace, *s))
     973:	39 f3                	cmp    %esi,%ebx
     975:	74 18                	je     98f <gettoken+0x3f>
     977:	0f be 06             	movsbl (%esi),%eax
     97a:	83 ec 08             	sub    $0x8,%esp
     97d:	50                   	push   %eax
     97e:	68 18 1f 00 00       	push   $0x1f18
     983:	e8 78 07 00 00       	call   1100 <strchr>
     988:	83 c4 10             	add    $0x10,%esp
     98b:	85 c0                	test   %eax,%eax
     98d:	75 e1                	jne    970 <gettoken+0x20>
    s++;
  if(q)
     98f:	85 ff                	test   %edi,%edi
     991:	74 02                	je     995 <gettoken+0x45>
    *q = s;
     993:	89 37                	mov    %esi,(%edi)
  ret = *s;
     995:	0f be 06             	movsbl (%esi),%eax
  switch(*s){
     998:	3c 29                	cmp    $0x29,%al
     99a:	7f 54                	jg     9f0 <gettoken+0xa0>
     99c:	3c 28                	cmp    $0x28,%al
     99e:	0f 8d c8 00 00 00    	jge    a6c <gettoken+0x11c>
     9a4:	31 ff                	xor    %edi,%edi
     9a6:	84 c0                	test   %al,%al
     9a8:	0f 85 e2 00 00 00    	jne    a90 <gettoken+0x140>
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
     9ae:	8b 55 14             	mov    0x14(%ebp),%edx
     9b1:	85 d2                	test   %edx,%edx
     9b3:	74 05                	je     9ba <gettoken+0x6a>
    *eq = s;
     9b5:	8b 45 14             	mov    0x14(%ebp),%eax
     9b8:	89 30                	mov    %esi,(%eax)

  while(s < es && strchr(whitespace, *s))
     9ba:	39 f3                	cmp    %esi,%ebx
     9bc:	77 09                	ja     9c7 <gettoken+0x77>
     9be:	eb 1f                	jmp    9df <gettoken+0x8f>
    s++;
     9c0:	83 c6 01             	add    $0x1,%esi
    break;
  }
  if(eq)
    *eq = s;

  while(s < es && strchr(whitespace, *s))
     9c3:	39 f3                	cmp    %esi,%ebx
     9c5:	74 18                	je     9df <gettoken+0x8f>
     9c7:	0f be 06             	movsbl (%esi),%eax
     9ca:	83 ec 08             	sub    $0x8,%esp
     9cd:	50                   	push   %eax
     9ce:	68 18 1f 00 00       	push   $0x1f18
     9d3:	e8 28 07 00 00       	call   1100 <strchr>
     9d8:	83 c4 10             	add    $0x10,%esp
     9db:	85 c0                	test   %eax,%eax
     9dd:	75 e1                	jne    9c0 <gettoken+0x70>
    s++;
  *ps = s;
     9df:	8b 45 08             	mov    0x8(%ebp),%eax
     9e2:	89 30                	mov    %esi,(%eax)
  return ret;
}
     9e4:	8d 65 f4             	lea    -0xc(%ebp),%esp
     9e7:	89 f8                	mov    %edi,%eax
     9e9:	5b                   	pop    %ebx
     9ea:	5e                   	pop    %esi
     9eb:	5f                   	pop    %edi
     9ec:	5d                   	pop    %ebp
     9ed:	c3                   	ret    
     9ee:	66 90                	xchg   %ax,%ax
  while(s < es && strchr(whitespace, *s))
    s++;
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
     9f0:	3c 3e                	cmp    $0x3e,%al
     9f2:	75 1c                	jne    a10 <gettoken+0xc0>
  case '<':
    s++;
    break;
  case '>':
    s++;
    if(*s == '>'){
     9f4:	80 7e 01 3e          	cmpb   $0x3e,0x1(%esi)
     9f8:	0f 84 82 00 00 00    	je     a80 <gettoken+0x130>
  case '&':
  case '<':
    s++;
    break;
  case '>':
    s++;
     9fe:	83 c6 01             	add    $0x1,%esi
     a01:	bf 3e 00 00 00       	mov    $0x3e,%edi
     a06:	eb a6                	jmp    9ae <gettoken+0x5e>
     a08:	90                   	nop
     a09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  while(s < es && strchr(whitespace, *s))
    s++;
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
     a10:	7f 56                	jg     a68 <gettoken+0x118>
     a12:	8d 48 c5             	lea    -0x3b(%eax),%ecx
     a15:	80 f9 01             	cmp    $0x1,%cl
     a18:	76 52                	jbe    a6c <gettoken+0x11c>
      s++;
    }
    break;
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     a1a:	39 f3                	cmp    %esi,%ebx
     a1c:	77 24                	ja     a42 <gettoken+0xf2>
     a1e:	eb 7a                	jmp    a9a <gettoken+0x14a>
     a20:	0f be 06             	movsbl (%esi),%eax
     a23:	83 ec 08             	sub    $0x8,%esp
     a26:	50                   	push   %eax
     a27:	68 10 1f 00 00       	push   $0x1f10
     a2c:	e8 cf 06 00 00       	call   1100 <strchr>
     a31:	83 c4 10             	add    $0x10,%esp
     a34:	85 c0                	test   %eax,%eax
     a36:	75 1f                	jne    a57 <gettoken+0x107>
      s++;
     a38:	83 c6 01             	add    $0x1,%esi
      s++;
    }
    break;
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     a3b:	39 f3                	cmp    %esi,%ebx
     a3d:	74 5b                	je     a9a <gettoken+0x14a>
     a3f:	0f be 06             	movsbl (%esi),%eax
     a42:	83 ec 08             	sub    $0x8,%esp
     a45:	50                   	push   %eax
     a46:	68 18 1f 00 00       	push   $0x1f18
     a4b:	e8 b0 06 00 00       	call   1100 <strchr>
     a50:	83 c4 10             	add    $0x10,%esp
     a53:	85 c0                	test   %eax,%eax
     a55:	74 c9                	je     a20 <gettoken+0xd0>
      ret = '+';
      s++;
    }
    break;
  default:
    ret = 'a';
     a57:	bf 61 00 00 00       	mov    $0x61,%edi
     a5c:	e9 4d ff ff ff       	jmp    9ae <gettoken+0x5e>
     a61:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  while(s < es && strchr(whitespace, *s))
    s++;
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
     a68:	3c 7c                	cmp    $0x7c,%al
     a6a:	75 ae                	jne    a1a <gettoken+0xca>
  s = *ps;
  while(s < es && strchr(whitespace, *s))
    s++;
  if(q)
    *q = s;
  ret = *s;
     a6c:	0f be f8             	movsbl %al,%edi
  case '(':
  case ')':
  case ';':
  case '&':
  case '<':
    s++;
     a6f:	83 c6 01             	add    $0x1,%esi
    break;
     a72:	e9 37 ff ff ff       	jmp    9ae <gettoken+0x5e>
     a77:	89 f6                	mov    %esi,%esi
     a79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  case '>':
    s++;
    if(*s == '>'){
      ret = '+';
      s++;
     a80:	83 c6 02             	add    $0x2,%esi
    s++;
    break;
  case '>':
    s++;
    if(*s == '>'){
      ret = '+';
     a83:	bf 2b 00 00 00       	mov    $0x2b,%edi
     a88:	e9 21 ff ff ff       	jmp    9ae <gettoken+0x5e>
     a8d:	8d 76 00             	lea    0x0(%esi),%esi
  while(s < es && strchr(whitespace, *s))
    s++;
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
     a90:	3c 26                	cmp    $0x26,%al
     a92:	0f 85 82 ff ff ff    	jne    a1a <gettoken+0xca>
     a98:	eb d2                	jmp    a6c <gettoken+0x11c>
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
     a9a:	8b 45 14             	mov    0x14(%ebp),%eax
     a9d:	bf 61 00 00 00       	mov    $0x61,%edi
     aa2:	85 c0                	test   %eax,%eax
     aa4:	0f 85 0b ff ff ff    	jne    9b5 <gettoken+0x65>
     aaa:	e9 30 ff ff ff       	jmp    9df <gettoken+0x8f>
     aaf:	90                   	nop

00000ab0 <peek>:
  return ret;
}

int
peek(char **ps, char *es, char *toks)
{
     ab0:	55                   	push   %ebp
     ab1:	89 e5                	mov    %esp,%ebp
     ab3:	57                   	push   %edi
     ab4:	56                   	push   %esi
     ab5:	53                   	push   %ebx
     ab6:	83 ec 0c             	sub    $0xc,%esp
     ab9:	8b 7d 08             	mov    0x8(%ebp),%edi
     abc:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *s;

  s = *ps;
     abf:	8b 1f                	mov    (%edi),%ebx
  while(s < es && strchr(whitespace, *s))
     ac1:	39 f3                	cmp    %esi,%ebx
     ac3:	72 12                	jb     ad7 <peek+0x27>
     ac5:	eb 28                	jmp    aef <peek+0x3f>
     ac7:	89 f6                	mov    %esi,%esi
     ac9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    s++;
     ad0:	83 c3 01             	add    $0x1,%ebx
peek(char **ps, char *es, char *toks)
{
  char *s;

  s = *ps;
  while(s < es && strchr(whitespace, *s))
     ad3:	39 de                	cmp    %ebx,%esi
     ad5:	74 18                	je     aef <peek+0x3f>
     ad7:	0f be 03             	movsbl (%ebx),%eax
     ada:	83 ec 08             	sub    $0x8,%esp
     add:	50                   	push   %eax
     ade:	68 18 1f 00 00       	push   $0x1f18
     ae3:	e8 18 06 00 00       	call   1100 <strchr>
     ae8:	83 c4 10             	add    $0x10,%esp
     aeb:	85 c0                	test   %eax,%eax
     aed:	75 e1                	jne    ad0 <peek+0x20>
    s++;
  *ps = s;
     aef:	89 1f                	mov    %ebx,(%edi)
  return *s && strchr(toks, *s);
     af1:	0f be 13             	movsbl (%ebx),%edx
     af4:	31 c0                	xor    %eax,%eax
     af6:	84 d2                	test   %dl,%dl
     af8:	74 17                	je     b11 <peek+0x61>
     afa:	83 ec 08             	sub    $0x8,%esp
     afd:	52                   	push   %edx
     afe:	ff 75 10             	pushl  0x10(%ebp)
     b01:	e8 fa 05 00 00       	call   1100 <strchr>
     b06:	83 c4 10             	add    $0x10,%esp
     b09:	85 c0                	test   %eax,%eax
     b0b:	0f 95 c0             	setne  %al
     b0e:	0f b6 c0             	movzbl %al,%eax
}
     b11:	8d 65 f4             	lea    -0xc(%ebp),%esp
     b14:	5b                   	pop    %ebx
     b15:	5e                   	pop    %esi
     b16:	5f                   	pop    %edi
     b17:	5d                   	pop    %ebp
     b18:	c3                   	ret    
     b19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000b20 <parseredirs>:
  return cmd;
}

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
     b20:	55                   	push   %ebp
     b21:	89 e5                	mov    %esp,%ebp
     b23:	57                   	push   %edi
     b24:	56                   	push   %esi
     b25:	53                   	push   %ebx
     b26:	83 ec 1c             	sub    $0x1c,%esp
     b29:	8b 75 0c             	mov    0xc(%ebp),%esi
     b2c:	8b 5d 10             	mov    0x10(%ebp),%ebx
     b2f:	90                   	nop
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     b30:	83 ec 04             	sub    $0x4,%esp
     b33:	68 6e 17 00 00       	push   $0x176e
     b38:	53                   	push   %ebx
     b39:	56                   	push   %esi
     b3a:	e8 71 ff ff ff       	call   ab0 <peek>
     b3f:	83 c4 10             	add    $0x10,%esp
     b42:	85 c0                	test   %eax,%eax
     b44:	74 6a                	je     bb0 <parseredirs+0x90>
    tok = gettoken(ps, es, 0, 0);
     b46:	6a 00                	push   $0x0
     b48:	6a 00                	push   $0x0
     b4a:	53                   	push   %ebx
     b4b:	56                   	push   %esi
     b4c:	e8 ff fd ff ff       	call   950 <gettoken>
     b51:	89 c7                	mov    %eax,%edi
    if(gettoken(ps, es, &q, &eq) != 'a')
     b53:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     b56:	50                   	push   %eax
     b57:	8d 45 e0             	lea    -0x20(%ebp),%eax
     b5a:	50                   	push   %eax
     b5b:	53                   	push   %ebx
     b5c:	56                   	push   %esi
     b5d:	e8 ee fd ff ff       	call   950 <gettoken>
     b62:	83 c4 20             	add    $0x20,%esp
     b65:	83 f8 61             	cmp    $0x61,%eax
     b68:	75 51                	jne    bbb <parseredirs+0x9b>
      panic("missing file for redirection");
    switch(tok){
     b6a:	83 ff 3c             	cmp    $0x3c,%edi
     b6d:	74 31                	je     ba0 <parseredirs+0x80>
     b6f:	83 ff 3e             	cmp    $0x3e,%edi
     b72:	74 05                	je     b79 <parseredirs+0x59>
     b74:	83 ff 2b             	cmp    $0x2b,%edi
     b77:	75 b7                	jne    b30 <parseredirs+0x10>
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     b79:	83 ec 0c             	sub    $0xc,%esp
     b7c:	6a 01                	push   $0x1
     b7e:	68 01 02 00 00       	push   $0x201
     b83:	ff 75 e4             	pushl  -0x1c(%ebp)
     b86:	ff 75 e0             	pushl  -0x20(%ebp)
     b89:	ff 75 08             	pushl  0x8(%ebp)
     b8c:	e8 bf fc ff ff       	call   850 <redircmd>
      break;
     b91:	83 c4 20             	add    $0x20,%esp
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     b94:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
     b97:	eb 97                	jmp    b30 <parseredirs+0x10>
     b99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    tok = gettoken(ps, es, 0, 0);
    if(gettoken(ps, es, &q, &eq) != 'a')
      panic("missing file for redirection");
    switch(tok){
    case '<':
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     ba0:	83 ec 0c             	sub    $0xc,%esp
     ba3:	6a 00                	push   $0x0
     ba5:	6a 00                	push   $0x0
     ba7:	eb da                	jmp    b83 <parseredirs+0x63>
     ba9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    }
  }
  return cmd;
}
     bb0:	8b 45 08             	mov    0x8(%ebp),%eax
     bb3:	8d 65 f4             	lea    -0xc(%ebp),%esp
     bb6:	5b                   	pop    %ebx
     bb7:	5e                   	pop    %esi
     bb8:	5f                   	pop    %edi
     bb9:	5d                   	pop    %ebp
     bba:	c3                   	ret    
  char *q, *eq;

  while(peek(ps, es, "<>")){
    tok = gettoken(ps, es, 0, 0);
    if(gettoken(ps, es, &q, &eq) != 'a')
      panic("missing file for redirection");
     bbb:	83 ec 0c             	sub    $0xc,%esp
     bbe:	68 51 17 00 00       	push   $0x1751
     bc3:	e8 68 fa ff ff       	call   630 <panic>
     bc8:	90                   	nop
     bc9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000bd0 <parseexec>:
  return cmd;
}

struct cmd*
parseexec(char **ps, char *es)
{
     bd0:	55                   	push   %ebp
     bd1:	89 e5                	mov    %esp,%ebp
     bd3:	57                   	push   %edi
     bd4:	56                   	push   %esi
     bd5:	53                   	push   %ebx
     bd6:	83 ec 30             	sub    $0x30,%esp
     bd9:	8b 75 08             	mov    0x8(%ebp),%esi
     bdc:	8b 7d 0c             	mov    0xc(%ebp),%edi
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
     bdf:	68 71 17 00 00       	push   $0x1771
     be4:	57                   	push   %edi
     be5:	56                   	push   %esi
     be6:	e8 c5 fe ff ff       	call   ab0 <peek>
     beb:	83 c4 10             	add    $0x10,%esp
     bee:	85 c0                	test   %eax,%eax
     bf0:	0f 85 92 00 00 00    	jne    c88 <parseexec+0xb8>
     bf6:	89 c3                	mov    %eax,%ebx
    return parseblock(ps, es);

  ret = execcmd();
     bf8:	e8 23 fc ff ff       	call   820 <execcmd>
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
     bfd:	83 ec 04             	sub    $0x4,%esp
  struct cmd *ret;

  if(peek(ps, es, "("))
    return parseblock(ps, es);

  ret = execcmd();
     c00:	89 45 d0             	mov    %eax,-0x30(%ebp)
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
     c03:	57                   	push   %edi
     c04:	56                   	push   %esi
     c05:	50                   	push   %eax
     c06:	e8 15 ff ff ff       	call   b20 <parseredirs>
     c0b:	83 c4 10             	add    $0x10,%esp
     c0e:	89 45 d4             	mov    %eax,-0x2c(%ebp)
     c11:	eb 18                	jmp    c2b <parseexec+0x5b>
     c13:	90                   	nop
     c14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    cmd->argv[argc] = q;
    cmd->eargv[argc] = eq;
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
     c18:	83 ec 04             	sub    $0x4,%esp
     c1b:	57                   	push   %edi
     c1c:	56                   	push   %esi
     c1d:	ff 75 d4             	pushl  -0x2c(%ebp)
     c20:	e8 fb fe ff ff       	call   b20 <parseredirs>
     c25:	83 c4 10             	add    $0x10,%esp
     c28:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
  while(!peek(ps, es, "|)&;")){
     c2b:	83 ec 04             	sub    $0x4,%esp
     c2e:	68 88 17 00 00       	push   $0x1788
     c33:	57                   	push   %edi
     c34:	56                   	push   %esi
     c35:	e8 76 fe ff ff       	call   ab0 <peek>
     c3a:	83 c4 10             	add    $0x10,%esp
     c3d:	85 c0                	test   %eax,%eax
     c3f:	75 67                	jne    ca8 <parseexec+0xd8>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
     c41:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     c44:	50                   	push   %eax
     c45:	8d 45 e0             	lea    -0x20(%ebp),%eax
     c48:	50                   	push   %eax
     c49:	57                   	push   %edi
     c4a:	56                   	push   %esi
     c4b:	e8 00 fd ff ff       	call   950 <gettoken>
     c50:	83 c4 10             	add    $0x10,%esp
     c53:	85 c0                	test   %eax,%eax
     c55:	74 51                	je     ca8 <parseexec+0xd8>
      break;
    if(tok != 'a')
     c57:	83 f8 61             	cmp    $0x61,%eax
     c5a:	75 6b                	jne    cc7 <parseexec+0xf7>
      panic("syntax");
    cmd->argv[argc] = q;
     c5c:	8b 45 e0             	mov    -0x20(%ebp),%eax
     c5f:	8b 55 d0             	mov    -0x30(%ebp),%edx
     c62:	89 44 9a 04          	mov    %eax,0x4(%edx,%ebx,4)
    cmd->eargv[argc] = eq;
     c66:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     c69:	89 44 9a 2c          	mov    %eax,0x2c(%edx,%ebx,4)
    argc++;
     c6d:	83 c3 01             	add    $0x1,%ebx
    if(argc >= MAXARGS)
     c70:	83 fb 0a             	cmp    $0xa,%ebx
     c73:	75 a3                	jne    c18 <parseexec+0x48>
      panic("too many args");
     c75:	83 ec 0c             	sub    $0xc,%esp
     c78:	68 7a 17 00 00       	push   $0x177a
     c7d:	e8 ae f9 ff ff       	call   630 <panic>
     c82:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
    return parseblock(ps, es);
     c88:	83 ec 08             	sub    $0x8,%esp
     c8b:	57                   	push   %edi
     c8c:	56                   	push   %esi
     c8d:	e8 5e 01 00 00       	call   df0 <parseblock>
     c92:	83 c4 10             	add    $0x10,%esp
     c95:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
  cmd->eargv[argc] = 0;
  return ret;
}
     c98:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     c9b:	8d 65 f4             	lea    -0xc(%ebp),%esp
     c9e:	5b                   	pop    %ebx
     c9f:	5e                   	pop    %esi
     ca0:	5f                   	pop    %edi
     ca1:	5d                   	pop    %ebp
     ca2:	c3                   	ret    
     ca3:	90                   	nop
     ca4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     ca8:	8b 45 d0             	mov    -0x30(%ebp),%eax
     cab:	8d 04 98             	lea    (%eax,%ebx,4),%eax
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
     cae:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
  cmd->eargv[argc] = 0;
     cb5:	c7 40 2c 00 00 00 00 	movl   $0x0,0x2c(%eax)
  return ret;
}
     cbc:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     cbf:	8d 65 f4             	lea    -0xc(%ebp),%esp
     cc2:	5b                   	pop    %ebx
     cc3:	5e                   	pop    %esi
     cc4:	5f                   	pop    %edi
     cc5:	5d                   	pop    %ebp
     cc6:	c3                   	ret    
  ret = parseredirs(ret, ps, es);
  while(!peek(ps, es, "|)&;")){
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
      break;
    if(tok != 'a')
      panic("syntax");
     cc7:	83 ec 0c             	sub    $0xc,%esp
     cca:	68 73 17 00 00       	push   $0x1773
     ccf:	e8 5c f9 ff ff       	call   630 <panic>
     cd4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     cda:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000ce0 <parsepipe>:
  return cmd;
}

struct cmd*
parsepipe(char **ps, char *es)
{
     ce0:	55                   	push   %ebp
     ce1:	89 e5                	mov    %esp,%ebp
     ce3:	57                   	push   %edi
     ce4:	56                   	push   %esi
     ce5:	53                   	push   %ebx
     ce6:	83 ec 14             	sub    $0x14,%esp
     ce9:	8b 5d 08             	mov    0x8(%ebp),%ebx
     cec:	8b 75 0c             	mov    0xc(%ebp),%esi
  struct cmd *cmd;

  cmd = parseexec(ps, es);
     cef:	56                   	push   %esi
     cf0:	53                   	push   %ebx
     cf1:	e8 da fe ff ff       	call   bd0 <parseexec>
  if(peek(ps, es, "|")){
     cf6:	83 c4 0c             	add    $0xc,%esp
struct cmd*
parsepipe(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parseexec(ps, es);
     cf9:	89 c7                	mov    %eax,%edi
  if(peek(ps, es, "|")){
     cfb:	68 8d 17 00 00       	push   $0x178d
     d00:	56                   	push   %esi
     d01:	53                   	push   %ebx
     d02:	e8 a9 fd ff ff       	call   ab0 <peek>
     d07:	83 c4 10             	add    $0x10,%esp
     d0a:	85 c0                	test   %eax,%eax
     d0c:	75 12                	jne    d20 <parsepipe+0x40>
    gettoken(ps, es, 0, 0);
    cmd = pipecmd(cmd, parsepipe(ps, es));
  }
  return cmd;
}
     d0e:	8d 65 f4             	lea    -0xc(%ebp),%esp
     d11:	89 f8                	mov    %edi,%eax
     d13:	5b                   	pop    %ebx
     d14:	5e                   	pop    %esi
     d15:	5f                   	pop    %edi
     d16:	5d                   	pop    %ebp
     d17:	c3                   	ret    
     d18:	90                   	nop
     d19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
{
  struct cmd *cmd;

  cmd = parseexec(ps, es);
  if(peek(ps, es, "|")){
    gettoken(ps, es, 0, 0);
     d20:	6a 00                	push   $0x0
     d22:	6a 00                	push   $0x0
     d24:	56                   	push   %esi
     d25:	53                   	push   %ebx
     d26:	e8 25 fc ff ff       	call   950 <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
     d2b:	58                   	pop    %eax
     d2c:	5a                   	pop    %edx
     d2d:	56                   	push   %esi
     d2e:	53                   	push   %ebx
     d2f:	e8 ac ff ff ff       	call   ce0 <parsepipe>
     d34:	89 7d 08             	mov    %edi,0x8(%ebp)
     d37:	89 45 0c             	mov    %eax,0xc(%ebp)
     d3a:	83 c4 10             	add    $0x10,%esp
  }
  return cmd;
}
     d3d:	8d 65 f4             	lea    -0xc(%ebp),%esp
     d40:	5b                   	pop    %ebx
     d41:	5e                   	pop    %esi
     d42:	5f                   	pop    %edi
     d43:	5d                   	pop    %ebp
  struct cmd *cmd;

  cmd = parseexec(ps, es);
  if(peek(ps, es, "|")){
    gettoken(ps, es, 0, 0);
    cmd = pipecmd(cmd, parsepipe(ps, es));
     d44:	e9 57 fb ff ff       	jmp    8a0 <pipecmd>
     d49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000d50 <parseline>:
  return cmd;
}

struct cmd*
parseline(char **ps, char *es)
{
     d50:	55                   	push   %ebp
     d51:	89 e5                	mov    %esp,%ebp
     d53:	57                   	push   %edi
     d54:	56                   	push   %esi
     d55:	53                   	push   %ebx
     d56:	83 ec 14             	sub    $0x14,%esp
     d59:	8b 5d 08             	mov    0x8(%ebp),%ebx
     d5c:	8b 75 0c             	mov    0xc(%ebp),%esi
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
     d5f:	56                   	push   %esi
     d60:	53                   	push   %ebx
     d61:	e8 7a ff ff ff       	call   ce0 <parsepipe>
  while(peek(ps, es, "&")){
     d66:	83 c4 10             	add    $0x10,%esp
struct cmd*
parseline(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
     d69:	89 c7                	mov    %eax,%edi
  while(peek(ps, es, "&")){
     d6b:	eb 1b                	jmp    d88 <parseline+0x38>
     d6d:	8d 76 00             	lea    0x0(%esi),%esi
    gettoken(ps, es, 0, 0);
     d70:	6a 00                	push   $0x0
     d72:	6a 00                	push   $0x0
     d74:	56                   	push   %esi
     d75:	53                   	push   %ebx
     d76:	e8 d5 fb ff ff       	call   950 <gettoken>
    cmd = backcmd(cmd);
     d7b:	89 3c 24             	mov    %edi,(%esp)
     d7e:	e8 9d fb ff ff       	call   920 <backcmd>
     d83:	83 c4 10             	add    $0x10,%esp
     d86:	89 c7                	mov    %eax,%edi
parseline(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
  while(peek(ps, es, "&")){
     d88:	83 ec 04             	sub    $0x4,%esp
     d8b:	68 8f 17 00 00       	push   $0x178f
     d90:	56                   	push   %esi
     d91:	53                   	push   %ebx
     d92:	e8 19 fd ff ff       	call   ab0 <peek>
     d97:	83 c4 10             	add    $0x10,%esp
     d9a:	85 c0                	test   %eax,%eax
     d9c:	75 d2                	jne    d70 <parseline+0x20>
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";")){
     d9e:	83 ec 04             	sub    $0x4,%esp
     da1:	68 8b 17 00 00       	push   $0x178b
     da6:	56                   	push   %esi
     da7:	53                   	push   %ebx
     da8:	e8 03 fd ff ff       	call   ab0 <peek>
     dad:	83 c4 10             	add    $0x10,%esp
     db0:	85 c0                	test   %eax,%eax
     db2:	75 0c                	jne    dc0 <parseline+0x70>
    gettoken(ps, es, 0, 0);
    cmd = listcmd(cmd, parseline(ps, es));
  }
  return cmd;
}
     db4:	8d 65 f4             	lea    -0xc(%ebp),%esp
     db7:	89 f8                	mov    %edi,%eax
     db9:	5b                   	pop    %ebx
     dba:	5e                   	pop    %esi
     dbb:	5f                   	pop    %edi
     dbc:	5d                   	pop    %ebp
     dbd:	c3                   	ret    
     dbe:	66 90                	xchg   %ax,%ax
  while(peek(ps, es, "&")){
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";")){
    gettoken(ps, es, 0, 0);
     dc0:	6a 00                	push   $0x0
     dc2:	6a 00                	push   $0x0
     dc4:	56                   	push   %esi
     dc5:	53                   	push   %ebx
     dc6:	e8 85 fb ff ff       	call   950 <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
     dcb:	58                   	pop    %eax
     dcc:	5a                   	pop    %edx
     dcd:	56                   	push   %esi
     dce:	53                   	push   %ebx
     dcf:	e8 7c ff ff ff       	call   d50 <parseline>
     dd4:	89 7d 08             	mov    %edi,0x8(%ebp)
     dd7:	89 45 0c             	mov    %eax,0xc(%ebp)
     dda:	83 c4 10             	add    $0x10,%esp
  }
  return cmd;
}
     ddd:	8d 65 f4             	lea    -0xc(%ebp),%esp
     de0:	5b                   	pop    %ebx
     de1:	5e                   	pop    %esi
     de2:	5f                   	pop    %edi
     de3:	5d                   	pop    %ebp
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";")){
    gettoken(ps, es, 0, 0);
    cmd = listcmd(cmd, parseline(ps, es));
     de4:	e9 f7 fa ff ff       	jmp    8e0 <listcmd>
     de9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000df0 <parseblock>:
  return cmd;
}

struct cmd*
parseblock(char **ps, char *es)
{
     df0:	55                   	push   %ebp
     df1:	89 e5                	mov    %esp,%ebp
     df3:	57                   	push   %edi
     df4:	56                   	push   %esi
     df5:	53                   	push   %ebx
     df6:	83 ec 10             	sub    $0x10,%esp
     df9:	8b 5d 08             	mov    0x8(%ebp),%ebx
     dfc:	8b 75 0c             	mov    0xc(%ebp),%esi
  struct cmd *cmd;

  if(!peek(ps, es, "("))
     dff:	68 71 17 00 00       	push   $0x1771
     e04:	56                   	push   %esi
     e05:	53                   	push   %ebx
     e06:	e8 a5 fc ff ff       	call   ab0 <peek>
     e0b:	83 c4 10             	add    $0x10,%esp
     e0e:	85 c0                	test   %eax,%eax
     e10:	74 4a                	je     e5c <parseblock+0x6c>
    panic("parseblock");
  gettoken(ps, es, 0, 0);
     e12:	6a 00                	push   $0x0
     e14:	6a 00                	push   $0x0
     e16:	56                   	push   %esi
     e17:	53                   	push   %ebx
     e18:	e8 33 fb ff ff       	call   950 <gettoken>
  cmd = parseline(ps, es);
     e1d:	58                   	pop    %eax
     e1e:	5a                   	pop    %edx
     e1f:	56                   	push   %esi
     e20:	53                   	push   %ebx
     e21:	e8 2a ff ff ff       	call   d50 <parseline>
  if(!peek(ps, es, ")"))
     e26:	83 c4 0c             	add    $0xc,%esp
  struct cmd *cmd;

  if(!peek(ps, es, "("))
    panic("parseblock");
  gettoken(ps, es, 0, 0);
  cmd = parseline(ps, es);
     e29:	89 c7                	mov    %eax,%edi
  if(!peek(ps, es, ")"))
     e2b:	68 ad 17 00 00       	push   $0x17ad
     e30:	56                   	push   %esi
     e31:	53                   	push   %ebx
     e32:	e8 79 fc ff ff       	call   ab0 <peek>
     e37:	83 c4 10             	add    $0x10,%esp
     e3a:	85 c0                	test   %eax,%eax
     e3c:	74 2b                	je     e69 <parseblock+0x79>
    panic("syntax - missing )");
  gettoken(ps, es, 0, 0);
     e3e:	6a 00                	push   $0x0
     e40:	6a 00                	push   $0x0
     e42:	56                   	push   %esi
     e43:	53                   	push   %ebx
     e44:	e8 07 fb ff ff       	call   950 <gettoken>
  cmd = parseredirs(cmd, ps, es);
     e49:	83 c4 0c             	add    $0xc,%esp
     e4c:	56                   	push   %esi
     e4d:	53                   	push   %ebx
     e4e:	57                   	push   %edi
     e4f:	e8 cc fc ff ff       	call   b20 <parseredirs>
  return cmd;
}
     e54:	8d 65 f4             	lea    -0xc(%ebp),%esp
     e57:	5b                   	pop    %ebx
     e58:	5e                   	pop    %esi
     e59:	5f                   	pop    %edi
     e5a:	5d                   	pop    %ebp
     e5b:	c3                   	ret    
parseblock(char **ps, char *es)
{
  struct cmd *cmd;

  if(!peek(ps, es, "("))
    panic("parseblock");
     e5c:	83 ec 0c             	sub    $0xc,%esp
     e5f:	68 91 17 00 00       	push   $0x1791
     e64:	e8 c7 f7 ff ff       	call   630 <panic>
  gettoken(ps, es, 0, 0);
  cmd = parseline(ps, es);
  if(!peek(ps, es, ")"))
    panic("syntax - missing )");
     e69:	83 ec 0c             	sub    $0xc,%esp
     e6c:	68 9c 17 00 00       	push   $0x179c
     e71:	e8 ba f7 ff ff       	call   630 <panic>
     e76:	8d 76 00             	lea    0x0(%esi),%esi
     e79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000e80 <nulterminate>:
}

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
     e80:	55                   	push   %ebp
     e81:	89 e5                	mov    %esp,%ebp
     e83:	53                   	push   %ebx
     e84:	83 ec 04             	sub    $0x4,%esp
     e87:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     e8a:	85 db                	test   %ebx,%ebx
     e8c:	74 20                	je     eae <nulterminate+0x2e>
    return 0;

  switch(cmd->type){
     e8e:	83 3b 05             	cmpl   $0x5,(%ebx)
     e91:	77 1b                	ja     eae <nulterminate+0x2e>
     e93:	8b 03                	mov    (%ebx),%eax
     e95:	ff 24 85 fc 17 00 00 	jmp    *0x17fc(,%eax,4)
     e9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    nulterminate(lcmd->right);
    break;

  case BACK:
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
     ea0:	83 ec 0c             	sub    $0xc,%esp
     ea3:	ff 73 04             	pushl  0x4(%ebx)
     ea6:	e8 d5 ff ff ff       	call   e80 <nulterminate>
    break;
     eab:	83 c4 10             	add    $0x10,%esp
  }
  return cmd;
}
     eae:	89 d8                	mov    %ebx,%eax
     eb0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     eb3:	c9                   	leave  
     eb4:	c3                   	ret    
     eb5:	8d 76 00             	lea    0x0(%esi),%esi
    nulterminate(pcmd->right);
    break;

  case LIST:
    lcmd = (struct listcmd*)cmd;
    nulterminate(lcmd->left);
     eb8:	83 ec 0c             	sub    $0xc,%esp
     ebb:	ff 73 04             	pushl  0x4(%ebx)
     ebe:	e8 bd ff ff ff       	call   e80 <nulterminate>
    nulterminate(lcmd->right);
     ec3:	58                   	pop    %eax
     ec4:	ff 73 08             	pushl  0x8(%ebx)
     ec7:	e8 b4 ff ff ff       	call   e80 <nulterminate>
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     ecc:	89 d8                	mov    %ebx,%eax

  case LIST:
    lcmd = (struct listcmd*)cmd;
    nulterminate(lcmd->left);
    nulterminate(lcmd->right);
    break;
     ece:	83 c4 10             	add    $0x10,%esp
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     ed1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     ed4:	c9                   	leave  
     ed5:	c3                   	ret    
     ed6:	8d 76 00             	lea    0x0(%esi),%esi
     ed9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    return 0;

  switch(cmd->type){
  case EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
     ee0:	8b 4b 04             	mov    0x4(%ebx),%ecx
     ee3:	8d 43 08             	lea    0x8(%ebx),%eax
     ee6:	85 c9                	test   %ecx,%ecx
     ee8:	74 c4                	je     eae <nulterminate+0x2e>
     eea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      *ecmd->eargv[i] = 0;
     ef0:	8b 50 24             	mov    0x24(%eax),%edx
     ef3:	83 c0 04             	add    $0x4,%eax
     ef6:	c6 02 00             	movb   $0x0,(%edx)
    return 0;

  switch(cmd->type){
  case EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
     ef9:	8b 50 fc             	mov    -0x4(%eax),%edx
     efc:	85 d2                	test   %edx,%edx
     efe:	75 f0                	jne    ef0 <nulterminate+0x70>
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     f00:	89 d8                	mov    %ebx,%eax
     f02:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     f05:	c9                   	leave  
     f06:	c3                   	ret    
     f07:	89 f6                	mov    %esi,%esi
     f09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      *ecmd->eargv[i] = 0;
    break;

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    nulterminate(rcmd->cmd);
     f10:	83 ec 0c             	sub    $0xc,%esp
     f13:	ff 73 04             	pushl  0x4(%ebx)
     f16:	e8 65 ff ff ff       	call   e80 <nulterminate>
    *rcmd->efile = 0;
     f1b:	8b 43 0c             	mov    0xc(%ebx),%eax
    break;
     f1e:	83 c4 10             	add    $0x10,%esp
    break;

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    nulterminate(rcmd->cmd);
    *rcmd->efile = 0;
     f21:	c6 00 00             	movb   $0x0,(%eax)
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     f24:	89 d8                	mov    %ebx,%eax
     f26:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     f29:	c9                   	leave  
     f2a:	c3                   	ret    
     f2b:	90                   	nop
     f2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000f30 <parsecmd>:
struct cmd *parseexec(char**, char*);
struct cmd *nulterminate(struct cmd*);

struct cmd*
parsecmd(char *s)
{
     f30:	55                   	push   %ebp
     f31:	89 e5                	mov    %esp,%ebp
     f33:	56                   	push   %esi
     f34:	53                   	push   %ebx
  char *es;
  struct cmd *cmd;

  es = s + strlen(s);
     f35:	8b 5d 08             	mov    0x8(%ebp),%ebx
     f38:	83 ec 0c             	sub    $0xc,%esp
     f3b:	53                   	push   %ebx
     f3c:	e8 6f 01 00 00       	call   10b0 <strlen>
  cmd = parseline(&s, es);
     f41:	59                   	pop    %ecx
parsecmd(char *s)
{
  char *es;
  struct cmd *cmd;

  es = s + strlen(s);
     f42:	01 c3                	add    %eax,%ebx
  cmd = parseline(&s, es);
     f44:	8d 45 08             	lea    0x8(%ebp),%eax
     f47:	5e                   	pop    %esi
     f48:	53                   	push   %ebx
     f49:	50                   	push   %eax
     f4a:	e8 01 fe ff ff       	call   d50 <parseline>
     f4f:	89 c6                	mov    %eax,%esi
  peek(&s, es, "");
     f51:	8d 45 08             	lea    0x8(%ebp),%eax
     f54:	83 c4 0c             	add    $0xc,%esp
     f57:	68 36 17 00 00       	push   $0x1736
     f5c:	53                   	push   %ebx
     f5d:	50                   	push   %eax
     f5e:	e8 4d fb ff ff       	call   ab0 <peek>
  if(s != es){
     f63:	8b 45 08             	mov    0x8(%ebp),%eax
     f66:	83 c4 10             	add    $0x10,%esp
     f69:	39 c3                	cmp    %eax,%ebx
     f6b:	75 12                	jne    f7f <parsecmd+0x4f>
    printf(2, "leftovers: %s\n", s);
    panic("syntax");
  }
  nulterminate(cmd);
     f6d:	83 ec 0c             	sub    $0xc,%esp
     f70:	56                   	push   %esi
     f71:	e8 0a ff ff ff       	call   e80 <nulterminate>
  return cmd;
}
     f76:	8d 65 f8             	lea    -0x8(%ebp),%esp
     f79:	89 f0                	mov    %esi,%eax
     f7b:	5b                   	pop    %ebx
     f7c:	5e                   	pop    %esi
     f7d:	5d                   	pop    %ebp
     f7e:	c3                   	ret    

  es = s + strlen(s);
  cmd = parseline(&s, es);
  peek(&s, es, "");
  if(s != es){
    printf(2, "leftovers: %s\n", s);
     f7f:	52                   	push   %edx
     f80:	50                   	push   %eax
     f81:	68 af 17 00 00       	push   $0x17af
     f86:	6a 02                	push   $0x2
     f88:	e8 53 04 00 00       	call   13e0 <printf>
    panic("syntax");
     f8d:	c7 04 24 73 17 00 00 	movl   $0x1773,(%esp)
     f94:	e8 97 f6 ff ff       	call   630 <panic>
     f99:	66 90                	xchg   %ax,%ax
     f9b:	66 90                	xchg   %ax,%ax
     f9d:	66 90                	xchg   %ax,%ax
     f9f:	90                   	nop

00000fa0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
     fa0:	55                   	push   %ebp
     fa1:	89 e5                	mov    %esp,%ebp
     fa3:	53                   	push   %ebx
     fa4:	8b 45 08             	mov    0x8(%ebp),%eax
     fa7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     faa:	89 c2                	mov    %eax,%edx
     fac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     fb0:	83 c1 01             	add    $0x1,%ecx
     fb3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
     fb7:	83 c2 01             	add    $0x1,%edx
     fba:	84 db                	test   %bl,%bl
     fbc:	88 5a ff             	mov    %bl,-0x1(%edx)
     fbf:	75 ef                	jne    fb0 <strcpy+0x10>
    ;
  return os;
}
     fc1:	5b                   	pop    %ebx
     fc2:	5d                   	pop    %ebp
     fc3:	c3                   	ret    
     fc4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     fca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000fd0 <strncpy>:

char* strncpy(char* s, char* t, int n) {
     fd0:	55                   	push   %ebp
  int i = 0;
     fd1:	31 d2                	xor    %edx,%edx
  while((*s++ = *t++) != 0)
    ;
  return os;
}

char* strncpy(char* s, char* t, int n) {
     fd3:	89 e5                	mov    %esp,%ebp
     fd5:	56                   	push   %esi
     fd6:	53                   	push   %ebx
     fd7:	8b 45 08             	mov    0x8(%ebp),%eax
     fda:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     fdd:	8b 75 10             	mov    0x10(%ebp),%esi
  int i = 0;
  char *os;
  os = s;
  while(((*s++ = *t++) != 0) && (++i < n));
     fe0:	eb 0d                	jmp    fef <strncpy+0x1f>
     fe2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     fe8:	83 c2 01             	add    $0x1,%edx
     feb:	39 f2                	cmp    %esi,%edx
     fed:	7d 0b                	jge    ffa <strncpy+0x2a>
     fef:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
     ff3:	84 c9                	test   %cl,%cl
     ff5:	88 0c 10             	mov    %cl,(%eax,%edx,1)
     ff8:	75 ee                	jne    fe8 <strncpy+0x18>
  return os;
}
     ffa:	5b                   	pop    %ebx
     ffb:	5e                   	pop    %esi
     ffc:	5d                   	pop    %ebp
     ffd:	c3                   	ret    
     ffe:	66 90                	xchg   %ax,%ax

00001000 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1000:	55                   	push   %ebp
    1001:	89 e5                	mov    %esp,%ebp
    1003:	56                   	push   %esi
    1004:	53                   	push   %ebx
    1005:	8b 55 08             	mov    0x8(%ebp),%edx
    1008:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    100b:	0f b6 02             	movzbl (%edx),%eax
    100e:	0f b6 19             	movzbl (%ecx),%ebx
    1011:	84 c0                	test   %al,%al
    1013:	75 1e                	jne    1033 <strcmp+0x33>
    1015:	eb 29                	jmp    1040 <strcmp+0x40>
    1017:	89 f6                	mov    %esi,%esi
    1019:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
    1020:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    1023:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    1026:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    1029:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
    102d:	84 c0                	test   %al,%al
    102f:	74 0f                	je     1040 <strcmp+0x40>
    1031:	89 f1                	mov    %esi,%ecx
    1033:	38 d8                	cmp    %bl,%al
    1035:	74 e9                	je     1020 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    1037:	29 d8                	sub    %ebx,%eax
}
    1039:	5b                   	pop    %ebx
    103a:	5e                   	pop    %esi
    103b:	5d                   	pop    %ebp
    103c:	c3                   	ret    
    103d:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    1040:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
    1042:	29 d8                	sub    %ebx,%eax
}
    1044:	5b                   	pop    %ebx
    1045:	5e                   	pop    %esi
    1046:	5d                   	pop    %ebp
    1047:	c3                   	ret    
    1048:	90                   	nop
    1049:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001050 <strncmp>:

int strncmp(const char *p, const char *q, int n) {
    1050:	55                   	push   %ebp
    1051:	89 e5                	mov    %esp,%ebp
    1053:	57                   	push   %edi
    1054:	56                   	push   %esi
    1055:	53                   	push   %ebx
    1056:	8b 5d 10             	mov    0x10(%ebp),%ebx
    1059:	8b 75 08             	mov    0x8(%ebp),%esi
    105c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  int i = 0;
  while(i < n && *p == *q)
    105f:	85 db                	test   %ebx,%ebx
    1061:	7e 28                	jle    108b <strncmp+0x3b>
    1063:	0f b6 16             	movzbl (%esi),%edx
    1066:	0f b6 0f             	movzbl (%edi),%ecx
    1069:	38 d1                	cmp    %dl,%cl
    106b:	75 2b                	jne    1098 <strncmp+0x48>
    106d:	31 c0                	xor    %eax,%eax
    106f:	eb 13                	jmp    1084 <strncmp+0x34>
    1071:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1078:	0f b6 14 06          	movzbl (%esi,%eax,1),%edx
    107c:	0f b6 0c 07          	movzbl (%edi,%eax,1),%ecx
    1080:	38 ca                	cmp    %cl,%dl
    1082:	75 14                	jne    1098 <strncmp+0x48>
    p++, q++, i++;
    1084:	83 c0 01             	add    $0x1,%eax
  return (uchar)*p - (uchar)*q;
}

int strncmp(const char *p, const char *q, int n) {
  int i = 0;
  while(i < n && *p == *q)
    1087:	39 c3                	cmp    %eax,%ebx
    1089:	75 ed                	jne    1078 <strncmp+0x28>
    p++, q++, i++;
  if (i < n)
    return (uchar)*p - (uchar)*q;
  else
    return 0;
}
    108b:	5b                   	pop    %ebx
  while(i < n && *p == *q)
    p++, q++, i++;
  if (i < n)
    return (uchar)*p - (uchar)*q;
  else
    return 0;
    108c:	31 c0                	xor    %eax,%eax
}
    108e:	5e                   	pop    %esi
    108f:	5f                   	pop    %edi
    1090:	5d                   	pop    %ebp
    1091:	c3                   	ret    
    1092:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
int strncmp(const char *p, const char *q, int n) {
  int i = 0;
  while(i < n && *p == *q)
    p++, q++, i++;
  if (i < n)
    return (uchar)*p - (uchar)*q;
    1098:	0f b6 c2             	movzbl %dl,%eax
  else
    return 0;
}
    109b:	5b                   	pop    %ebx
int strncmp(const char *p, const char *q, int n) {
  int i = 0;
  while(i < n && *p == *q)
    p++, q++, i++;
  if (i < n)
    return (uchar)*p - (uchar)*q;
    109c:	29 c8                	sub    %ecx,%eax
  else
    return 0;
}
    109e:	5e                   	pop    %esi
    109f:	5f                   	pop    %edi
    10a0:	5d                   	pop    %ebp
    10a1:	c3                   	ret    
    10a2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000010b0 <strlen>:

uint
strlen(char *s)
{
    10b0:	55                   	push   %ebp
    10b1:	89 e5                	mov    %esp,%ebp
    10b3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    10b6:	80 39 00             	cmpb   $0x0,(%ecx)
    10b9:	74 12                	je     10cd <strlen+0x1d>
    10bb:	31 d2                	xor    %edx,%edx
    10bd:	8d 76 00             	lea    0x0(%esi),%esi
    10c0:	83 c2 01             	add    $0x1,%edx
    10c3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    10c7:	89 d0                	mov    %edx,%eax
    10c9:	75 f5                	jne    10c0 <strlen+0x10>
    ;
  return n;
}
    10cb:	5d                   	pop    %ebp
    10cc:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
    10cd:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
    10cf:	5d                   	pop    %ebp
    10d0:	c3                   	ret    
    10d1:	eb 0d                	jmp    10e0 <memset>
    10d3:	90                   	nop
    10d4:	90                   	nop
    10d5:	90                   	nop
    10d6:	90                   	nop
    10d7:	90                   	nop
    10d8:	90                   	nop
    10d9:	90                   	nop
    10da:	90                   	nop
    10db:	90                   	nop
    10dc:	90                   	nop
    10dd:	90                   	nop
    10de:	90                   	nop
    10df:	90                   	nop

000010e0 <memset>:

void*
memset(void *dst, int c, uint n)
{
    10e0:	55                   	push   %ebp
    10e1:	89 e5                	mov    %esp,%ebp
    10e3:	57                   	push   %edi
    10e4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    10e7:	8b 4d 10             	mov    0x10(%ebp),%ecx
    10ea:	8b 45 0c             	mov    0xc(%ebp),%eax
    10ed:	89 d7                	mov    %edx,%edi
    10ef:	fc                   	cld    
    10f0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    10f2:	89 d0                	mov    %edx,%eax
    10f4:	5f                   	pop    %edi
    10f5:	5d                   	pop    %ebp
    10f6:	c3                   	ret    
    10f7:	89 f6                	mov    %esi,%esi
    10f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001100 <strchr>:

char*
strchr(const char *s, char c)
{
    1100:	55                   	push   %ebp
    1101:	89 e5                	mov    %esp,%ebp
    1103:	53                   	push   %ebx
    1104:	8b 45 08             	mov    0x8(%ebp),%eax
    1107:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
    110a:	0f b6 10             	movzbl (%eax),%edx
    110d:	84 d2                	test   %dl,%dl
    110f:	74 1d                	je     112e <strchr+0x2e>
    if(*s == c)
    1111:	38 d3                	cmp    %dl,%bl
    1113:	89 d9                	mov    %ebx,%ecx
    1115:	75 0d                	jne    1124 <strchr+0x24>
    1117:	eb 17                	jmp    1130 <strchr+0x30>
    1119:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1120:	38 ca                	cmp    %cl,%dl
    1122:	74 0c                	je     1130 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    1124:	83 c0 01             	add    $0x1,%eax
    1127:	0f b6 10             	movzbl (%eax),%edx
    112a:	84 d2                	test   %dl,%dl
    112c:	75 f2                	jne    1120 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
    112e:	31 c0                	xor    %eax,%eax
}
    1130:	5b                   	pop    %ebx
    1131:	5d                   	pop    %ebp
    1132:	c3                   	ret    
    1133:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1139:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001140 <gets>:

char*
gets(char *buf, int max)
{
    1140:	55                   	push   %ebp
    1141:	89 e5                	mov    %esp,%ebp
    1143:	57                   	push   %edi
    1144:	56                   	push   %esi
    1145:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1146:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
    1148:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
    114b:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    114e:	eb 29                	jmp    1179 <gets+0x39>
    cc = read(0, &c, 1);
    1150:	83 ec 04             	sub    $0x4,%esp
    1153:	6a 01                	push   $0x1
    1155:	57                   	push   %edi
    1156:	6a 00                	push   $0x0
    1158:	e8 43 01 00 00       	call   12a0 <read>
    if(cc < 1)
    115d:	83 c4 10             	add    $0x10,%esp
    1160:	85 c0                	test   %eax,%eax
    1162:	7e 1d                	jle    1181 <gets+0x41>
      break;
    buf[i++] = c;
    1164:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    1168:	8b 55 08             	mov    0x8(%ebp),%edx
    116b:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
    116d:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    116f:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    1173:	74 1b                	je     1190 <gets+0x50>
    1175:	3c 0d                	cmp    $0xd,%al
    1177:	74 17                	je     1190 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1179:	8d 5e 01             	lea    0x1(%esi),%ebx
    117c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    117f:	7c cf                	jl     1150 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    1181:	8b 45 08             	mov    0x8(%ebp),%eax
    1184:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    1188:	8d 65 f4             	lea    -0xc(%ebp),%esp
    118b:	5b                   	pop    %ebx
    118c:	5e                   	pop    %esi
    118d:	5f                   	pop    %edi
    118e:	5d                   	pop    %ebp
    118f:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    1190:	8b 45 08             	mov    0x8(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1193:	89 de                	mov    %ebx,%esi
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    1195:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    1199:	8d 65 f4             	lea    -0xc(%ebp),%esp
    119c:	5b                   	pop    %ebx
    119d:	5e                   	pop    %esi
    119e:	5f                   	pop    %edi
    119f:	5d                   	pop    %ebp
    11a0:	c3                   	ret    
    11a1:	eb 0d                	jmp    11b0 <stat>
    11a3:	90                   	nop
    11a4:	90                   	nop
    11a5:	90                   	nop
    11a6:	90                   	nop
    11a7:	90                   	nop
    11a8:	90                   	nop
    11a9:	90                   	nop
    11aa:	90                   	nop
    11ab:	90                   	nop
    11ac:	90                   	nop
    11ad:	90                   	nop
    11ae:	90                   	nop
    11af:	90                   	nop

000011b0 <stat>:

int
stat(char *n, struct stat *st)
{
    11b0:	55                   	push   %ebp
    11b1:	89 e5                	mov    %esp,%ebp
    11b3:	56                   	push   %esi
    11b4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    11b5:	83 ec 08             	sub    $0x8,%esp
    11b8:	6a 00                	push   $0x0
    11ba:	ff 75 08             	pushl  0x8(%ebp)
    11bd:	e8 06 01 00 00       	call   12c8 <open>
  if(fd < 0)
    11c2:	83 c4 10             	add    $0x10,%esp
    11c5:	85 c0                	test   %eax,%eax
    11c7:	78 27                	js     11f0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    11c9:	83 ec 08             	sub    $0x8,%esp
    11cc:	ff 75 0c             	pushl  0xc(%ebp)
    11cf:	89 c3                	mov    %eax,%ebx
    11d1:	50                   	push   %eax
    11d2:	e8 09 01 00 00       	call   12e0 <fstat>
  close(fd);
    11d7:	89 1c 24             	mov    %ebx,(%esp)
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
  r = fstat(fd, st);
    11da:	89 c6                	mov    %eax,%esi
  close(fd);
    11dc:	e8 cf 00 00 00       	call   12b0 <close>
  return r;
    11e1:	83 c4 10             	add    $0x10,%esp
}
    11e4:	8d 65 f8             	lea    -0x8(%ebp),%esp
    11e7:	89 f0                	mov    %esi,%eax
    11e9:	5b                   	pop    %ebx
    11ea:	5e                   	pop    %esi
    11eb:	5d                   	pop    %ebp
    11ec:	c3                   	ret    
    11ed:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
    11f0:	be ff ff ff ff       	mov    $0xffffffff,%esi
    11f5:	eb ed                	jmp    11e4 <stat+0x34>
    11f7:	89 f6                	mov    %esi,%esi
    11f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001200 <atoi>:
  return r;
}

int
atoi(const char *s)
{
    1200:	55                   	push   %ebp
    1201:	89 e5                	mov    %esp,%ebp
    1203:	53                   	push   %ebx
    1204:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1207:	0f be 11             	movsbl (%ecx),%edx
    120a:	8d 42 d0             	lea    -0x30(%edx),%eax
    120d:	3c 09                	cmp    $0x9,%al
    120f:	b8 00 00 00 00       	mov    $0x0,%eax
    1214:	77 1f                	ja     1235 <atoi+0x35>
    1216:	8d 76 00             	lea    0x0(%esi),%esi
    1219:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
    1220:	8d 04 80             	lea    (%eax,%eax,4),%eax
    1223:	83 c1 01             	add    $0x1,%ecx
    1226:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    122a:	0f be 11             	movsbl (%ecx),%edx
    122d:	8d 5a d0             	lea    -0x30(%edx),%ebx
    1230:	80 fb 09             	cmp    $0x9,%bl
    1233:	76 eb                	jbe    1220 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
    1235:	5b                   	pop    %ebx
    1236:	5d                   	pop    %ebp
    1237:	c3                   	ret    
    1238:	90                   	nop
    1239:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001240 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    1240:	55                   	push   %ebp
    1241:	89 e5                	mov    %esp,%ebp
    1243:	56                   	push   %esi
    1244:	53                   	push   %ebx
    1245:	8b 5d 10             	mov    0x10(%ebp),%ebx
    1248:	8b 45 08             	mov    0x8(%ebp),%eax
    124b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    124e:	85 db                	test   %ebx,%ebx
    1250:	7e 14                	jle    1266 <memmove+0x26>
    1252:	31 d2                	xor    %edx,%edx
    1254:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    1258:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    125c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    125f:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    1262:	39 da                	cmp    %ebx,%edx
    1264:	75 f2                	jne    1258 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
    1266:	5b                   	pop    %ebx
    1267:	5e                   	pop    %esi
    1268:	5d                   	pop    %ebp
    1269:	c3                   	ret    
    126a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001270 <max>:

int max(int a, int b) {
    1270:	55                   	push   %ebp
    1271:	89 e5                	mov    %esp,%ebp
    1273:	8b 55 08             	mov    0x8(%ebp),%edx
    1276:	8b 45 0c             	mov    0xc(%ebp),%eax
  if (b > a) return b;
  else return a;
}
    1279:	5d                   	pop    %ebp
    127a:	39 d0                	cmp    %edx,%eax
    127c:	0f 4c c2             	cmovl  %edx,%eax
    127f:	c3                   	ret    

00001280 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    1280:	b8 01 00 00 00       	mov    $0x1,%eax
    1285:	cd 40                	int    $0x40
    1287:	c3                   	ret    

00001288 <exit>:
SYSCALL(exit)
    1288:	b8 02 00 00 00       	mov    $0x2,%eax
    128d:	cd 40                	int    $0x40
    128f:	c3                   	ret    

00001290 <wait>:
SYSCALL(wait)
    1290:	b8 03 00 00 00       	mov    $0x3,%eax
    1295:	cd 40                	int    $0x40
    1297:	c3                   	ret    

00001298 <pipe>:
SYSCALL(pipe)
    1298:	b8 04 00 00 00       	mov    $0x4,%eax
    129d:	cd 40                	int    $0x40
    129f:	c3                   	ret    

000012a0 <read>:
SYSCALL(read)
    12a0:	b8 05 00 00 00       	mov    $0x5,%eax
    12a5:	cd 40                	int    $0x40
    12a7:	c3                   	ret    

000012a8 <write>:
SYSCALL(write)
    12a8:	b8 10 00 00 00       	mov    $0x10,%eax
    12ad:	cd 40                	int    $0x40
    12af:	c3                   	ret    

000012b0 <close>:
SYSCALL(close)
    12b0:	b8 15 00 00 00       	mov    $0x15,%eax
    12b5:	cd 40                	int    $0x40
    12b7:	c3                   	ret    

000012b8 <kill>:
SYSCALL(kill)
    12b8:	b8 06 00 00 00       	mov    $0x6,%eax
    12bd:	cd 40                	int    $0x40
    12bf:	c3                   	ret    

000012c0 <exec>:
SYSCALL(exec)
    12c0:	b8 07 00 00 00       	mov    $0x7,%eax
    12c5:	cd 40                	int    $0x40
    12c7:	c3                   	ret    

000012c8 <open>:
SYSCALL(open)
    12c8:	b8 0f 00 00 00       	mov    $0xf,%eax
    12cd:	cd 40                	int    $0x40
    12cf:	c3                   	ret    

000012d0 <mknod>:
SYSCALL(mknod)
    12d0:	b8 11 00 00 00       	mov    $0x11,%eax
    12d5:	cd 40                	int    $0x40
    12d7:	c3                   	ret    

000012d8 <unlink>:
SYSCALL(unlink)
    12d8:	b8 12 00 00 00       	mov    $0x12,%eax
    12dd:	cd 40                	int    $0x40
    12df:	c3                   	ret    

000012e0 <fstat>:
SYSCALL(fstat)
    12e0:	b8 08 00 00 00       	mov    $0x8,%eax
    12e5:	cd 40                	int    $0x40
    12e7:	c3                   	ret    

000012e8 <link>:
SYSCALL(link)
    12e8:	b8 13 00 00 00       	mov    $0x13,%eax
    12ed:	cd 40                	int    $0x40
    12ef:	c3                   	ret    

000012f0 <mkdir>:
SYSCALL(mkdir)
    12f0:	b8 14 00 00 00       	mov    $0x14,%eax
    12f5:	cd 40                	int    $0x40
    12f7:	c3                   	ret    

000012f8 <chdir>:
SYSCALL(chdir)
    12f8:	b8 09 00 00 00       	mov    $0x9,%eax
    12fd:	cd 40                	int    $0x40
    12ff:	c3                   	ret    

00001300 <dup>:
SYSCALL(dup)
    1300:	b8 0a 00 00 00       	mov    $0xa,%eax
    1305:	cd 40                	int    $0x40
    1307:	c3                   	ret    

00001308 <getpid>:
SYSCALL(getpid)
    1308:	b8 0b 00 00 00       	mov    $0xb,%eax
    130d:	cd 40                	int    $0x40
    130f:	c3                   	ret    

00001310 <sbrk>:
SYSCALL(sbrk)
    1310:	b8 0c 00 00 00       	mov    $0xc,%eax
    1315:	cd 40                	int    $0x40
    1317:	c3                   	ret    

00001318 <sleep>:
SYSCALL(sleep)
    1318:	b8 0d 00 00 00       	mov    $0xd,%eax
    131d:	cd 40                	int    $0x40
    131f:	c3                   	ret    

00001320 <uptime>:
SYSCALL(uptime)
    1320:	b8 0e 00 00 00       	mov    $0xe,%eax
    1325:	cd 40                	int    $0x40
    1327:	c3                   	ret    

00001328 <setVariable>:
SYSCALL(setVariable)
    1328:	b8 17 00 00 00       	mov    $0x17,%eax
    132d:	cd 40                	int    $0x40
    132f:	c3                   	ret    

00001330 <getVariable>:
SYSCALL(getVariable)
    1330:	b8 18 00 00 00       	mov    $0x18,%eax
    1335:	cd 40                	int    $0x40
    1337:	c3                   	ret    

00001338 <remVariable>:
SYSCALL(remVariable)
    1338:	b8 19 00 00 00       	mov    $0x19,%eax
    133d:	cd 40                	int    $0x40
    133f:	c3                   	ret    

00001340 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1340:	55                   	push   %ebp
    1341:	89 e5                	mov    %esp,%ebp
    1343:	57                   	push   %edi
    1344:	56                   	push   %esi
    1345:	53                   	push   %ebx
    1346:	89 c6                	mov    %eax,%esi
    1348:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    134b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    134e:	85 db                	test   %ebx,%ebx
    1350:	74 7e                	je     13d0 <printint+0x90>
    1352:	89 d0                	mov    %edx,%eax
    1354:	c1 e8 1f             	shr    $0x1f,%eax
    1357:	84 c0                	test   %al,%al
    1359:	74 75                	je     13d0 <printint+0x90>
    neg = 1;
    x = -xx;
    135b:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    135d:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
    1364:	f7 d8                	neg    %eax
    1366:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    1369:	31 ff                	xor    %edi,%edi
    136b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    136e:	89 ce                	mov    %ecx,%esi
    1370:	eb 08                	jmp    137a <printint+0x3a>
    1372:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    1378:	89 cf                	mov    %ecx,%edi
    137a:	31 d2                	xor    %edx,%edx
    137c:	8d 4f 01             	lea    0x1(%edi),%ecx
    137f:	f7 f6                	div    %esi
    1381:	0f b6 92 1c 18 00 00 	movzbl 0x181c(%edx),%edx
  }while((x /= base) != 0);
    1388:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
    138a:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
    138d:	75 e9                	jne    1378 <printint+0x38>
  if(neg)
    138f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    1392:	8b 75 c0             	mov    -0x40(%ebp),%esi
    1395:	85 c0                	test   %eax,%eax
    1397:	74 08                	je     13a1 <printint+0x61>
    buf[i++] = '-';
    1399:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
    139e:	8d 4f 02             	lea    0x2(%edi),%ecx

  while(--i >= 0)
    13a1:	8d 79 ff             	lea    -0x1(%ecx),%edi
    13a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    13a8:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    13ad:	83 ec 04             	sub    $0x4,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    13b0:	83 ef 01             	sub    $0x1,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    13b3:	6a 01                	push   $0x1
    13b5:	53                   	push   %ebx
    13b6:	56                   	push   %esi
    13b7:	88 45 d7             	mov    %al,-0x29(%ebp)
    13ba:	e8 e9 fe ff ff       	call   12a8 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    13bf:	83 c4 10             	add    $0x10,%esp
    13c2:	83 ff ff             	cmp    $0xffffffff,%edi
    13c5:	75 e1                	jne    13a8 <printint+0x68>
    putc(fd, buf[i]);
}
    13c7:	8d 65 f4             	lea    -0xc(%ebp),%esp
    13ca:	5b                   	pop    %ebx
    13cb:	5e                   	pop    %esi
    13cc:	5f                   	pop    %edi
    13cd:	5d                   	pop    %ebp
    13ce:	c3                   	ret    
    13cf:	90                   	nop
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    13d0:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    13d2:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    13d9:	eb 8b                	jmp    1366 <printint+0x26>
    13db:	90                   	nop
    13dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000013e0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    13e0:	55                   	push   %ebp
    13e1:	89 e5                	mov    %esp,%ebp
    13e3:	57                   	push   %edi
    13e4:	56                   	push   %esi
    13e5:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    13e6:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    13e9:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    13ec:	8b 75 0c             	mov    0xc(%ebp),%esi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    13ef:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    13f2:	89 45 d0             	mov    %eax,-0x30(%ebp)
    13f5:	0f b6 1e             	movzbl (%esi),%ebx
    13f8:	83 c6 01             	add    $0x1,%esi
    13fb:	84 db                	test   %bl,%bl
    13fd:	0f 84 b0 00 00 00    	je     14b3 <printf+0xd3>
    1403:	31 d2                	xor    %edx,%edx
    1405:	eb 39                	jmp    1440 <printf+0x60>
    1407:	89 f6                	mov    %esi,%esi
    1409:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    1410:	83 f8 25             	cmp    $0x25,%eax
    1413:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
    1416:	ba 25 00 00 00       	mov    $0x25,%edx
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    141b:	74 18                	je     1435 <printf+0x55>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    141d:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    1420:	83 ec 04             	sub    $0x4,%esp
    1423:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    1426:	6a 01                	push   $0x1
    1428:	50                   	push   %eax
    1429:	57                   	push   %edi
    142a:	e8 79 fe ff ff       	call   12a8 <write>
    142f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    1432:	83 c4 10             	add    $0x10,%esp
    1435:	83 c6 01             	add    $0x1,%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1438:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    143c:	84 db                	test   %bl,%bl
    143e:	74 73                	je     14b3 <printf+0xd3>
    c = fmt[i] & 0xff;
    if(state == 0){
    1440:	85 d2                	test   %edx,%edx
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    1442:	0f be cb             	movsbl %bl,%ecx
    1445:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    1448:	74 c6                	je     1410 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    144a:	83 fa 25             	cmp    $0x25,%edx
    144d:	75 e6                	jne    1435 <printf+0x55>
      if(c == 'd'){
    144f:	83 f8 64             	cmp    $0x64,%eax
    1452:	0f 84 f8 00 00 00    	je     1550 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    1458:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    145e:	83 f9 70             	cmp    $0x70,%ecx
    1461:	74 5d                	je     14c0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    1463:	83 f8 73             	cmp    $0x73,%eax
    1466:	0f 84 84 00 00 00    	je     14f0 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    146c:	83 f8 63             	cmp    $0x63,%eax
    146f:	0f 84 ea 00 00 00    	je     155f <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    1475:	83 f8 25             	cmp    $0x25,%eax
    1478:	0f 84 c2 00 00 00    	je     1540 <printf+0x160>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    147e:	8d 45 e7             	lea    -0x19(%ebp),%eax
    1481:	83 ec 04             	sub    $0x4,%esp
    1484:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    1488:	6a 01                	push   $0x1
    148a:	50                   	push   %eax
    148b:	57                   	push   %edi
    148c:	e8 17 fe ff ff       	call   12a8 <write>
    1491:	83 c4 0c             	add    $0xc,%esp
    1494:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    1497:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    149a:	6a 01                	push   $0x1
    149c:	50                   	push   %eax
    149d:	57                   	push   %edi
    149e:	83 c6 01             	add    $0x1,%esi
    14a1:	e8 02 fe ff ff       	call   12a8 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    14a6:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    14aa:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    14ad:	31 d2                	xor    %edx,%edx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    14af:	84 db                	test   %bl,%bl
    14b1:	75 8d                	jne    1440 <printf+0x60>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    14b3:	8d 65 f4             	lea    -0xc(%ebp),%esp
    14b6:	5b                   	pop    %ebx
    14b7:	5e                   	pop    %esi
    14b8:	5f                   	pop    %edi
    14b9:	5d                   	pop    %ebp
    14ba:	c3                   	ret    
    14bb:	90                   	nop
    14bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
    14c0:	83 ec 0c             	sub    $0xc,%esp
    14c3:	b9 10 00 00 00       	mov    $0x10,%ecx
    14c8:	6a 00                	push   $0x0
    14ca:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    14cd:	89 f8                	mov    %edi,%eax
    14cf:	8b 13                	mov    (%ebx),%edx
    14d1:	e8 6a fe ff ff       	call   1340 <printint>
        ap++;
    14d6:	89 d8                	mov    %ebx,%eax
    14d8:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    14db:	31 d2                	xor    %edx,%edx
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
    14dd:	83 c0 04             	add    $0x4,%eax
    14e0:	89 45 d0             	mov    %eax,-0x30(%ebp)
    14e3:	e9 4d ff ff ff       	jmp    1435 <printf+0x55>
    14e8:	90                   	nop
    14e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
    14f0:	8b 45 d0             	mov    -0x30(%ebp),%eax
    14f3:	8b 18                	mov    (%eax),%ebx
        ap++;
    14f5:	83 c0 04             	add    $0x4,%eax
    14f8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    14fb:	85 db                	test   %ebx,%ebx
    14fd:	74 7c                	je     157b <printf+0x19b>
          s = "(null)";
        while(*s != 0){
    14ff:	0f b6 03             	movzbl (%ebx),%eax
    1502:	84 c0                	test   %al,%al
    1504:	74 29                	je     152f <printf+0x14f>
    1506:	8d 76 00             	lea    0x0(%esi),%esi
    1509:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    1510:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    1513:	8d 45 e3             	lea    -0x1d(%ebp),%eax
    1516:	83 ec 04             	sub    $0x4,%esp
    1519:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
    151b:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    151e:	50                   	push   %eax
    151f:	57                   	push   %edi
    1520:	e8 83 fd ff ff       	call   12a8 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    1525:	0f b6 03             	movzbl (%ebx),%eax
    1528:	83 c4 10             	add    $0x10,%esp
    152b:	84 c0                	test   %al,%al
    152d:	75 e1                	jne    1510 <printf+0x130>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    152f:	31 d2                	xor    %edx,%edx
    1531:	e9 ff fe ff ff       	jmp    1435 <printf+0x55>
    1536:	8d 76 00             	lea    0x0(%esi),%esi
    1539:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    1540:	83 ec 04             	sub    $0x4,%esp
    1543:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    1546:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1549:	6a 01                	push   $0x1
    154b:	e9 4c ff ff ff       	jmp    149c <printf+0xbc>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
    1550:	83 ec 0c             	sub    $0xc,%esp
    1553:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1558:	6a 01                	push   $0x1
    155a:	e9 6b ff ff ff       	jmp    14ca <printf+0xea>
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
    155f:	8b 5d d0             	mov    -0x30(%ebp),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    1562:	83 ec 04             	sub    $0x4,%esp
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
    1565:	8b 03                	mov    (%ebx),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    1567:	6a 01                	push   $0x1
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
    1569:	88 45 e4             	mov    %al,-0x1c(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    156c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    156f:	50                   	push   %eax
    1570:	57                   	push   %edi
    1571:	e8 32 fd ff ff       	call   12a8 <write>
    1576:	e9 5b ff ff ff       	jmp    14d6 <printf+0xf6>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    157b:	b8 28 00 00 00       	mov    $0x28,%eax
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
    1580:	bb 14 18 00 00       	mov    $0x1814,%ebx
    1585:	eb 89                	jmp    1510 <printf+0x130>
    1587:	66 90                	xchg   %ax,%ax
    1589:	66 90                	xchg   %ax,%ax
    158b:	66 90                	xchg   %ax,%ax
    158d:	66 90                	xchg   %ax,%ax
    158f:	90                   	nop

00001590 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1590:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1591:	a1 c4 1f 00 00       	mov    0x1fc4,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
    1596:	89 e5                	mov    %esp,%ebp
    1598:	57                   	push   %edi
    1599:	56                   	push   %esi
    159a:	53                   	push   %ebx
    159b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    159e:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
    15a0:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    15a3:	39 c8                	cmp    %ecx,%eax
    15a5:	73 19                	jae    15c0 <free+0x30>
    15a7:	89 f6                	mov    %esi,%esi
    15a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    15b0:	39 d1                	cmp    %edx,%ecx
    15b2:	72 1c                	jb     15d0 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    15b4:	39 d0                	cmp    %edx,%eax
    15b6:	73 18                	jae    15d0 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
    15b8:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    15ba:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    15bc:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    15be:	72 f0                	jb     15b0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    15c0:	39 d0                	cmp    %edx,%eax
    15c2:	72 f4                	jb     15b8 <free+0x28>
    15c4:	39 d1                	cmp    %edx,%ecx
    15c6:	73 f0                	jae    15b8 <free+0x28>
    15c8:	90                   	nop
    15c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
    15d0:	8b 73 fc             	mov    -0x4(%ebx),%esi
    15d3:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    15d6:	39 fa                	cmp    %edi,%edx
    15d8:	74 19                	je     15f3 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    15da:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    15dd:	8b 50 04             	mov    0x4(%eax),%edx
    15e0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    15e3:	39 f1                	cmp    %esi,%ecx
    15e5:	74 23                	je     160a <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    15e7:	89 08                	mov    %ecx,(%eax)
  freep = p;
    15e9:	a3 c4 1f 00 00       	mov    %eax,0x1fc4
}
    15ee:	5b                   	pop    %ebx
    15ef:	5e                   	pop    %esi
    15f0:	5f                   	pop    %edi
    15f1:	5d                   	pop    %ebp
    15f2:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
    15f3:	03 72 04             	add    0x4(%edx),%esi
    15f6:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    15f9:	8b 10                	mov    (%eax),%edx
    15fb:	8b 12                	mov    (%edx),%edx
    15fd:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    1600:	8b 50 04             	mov    0x4(%eax),%edx
    1603:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1606:	39 f1                	cmp    %esi,%ecx
    1608:	75 dd                	jne    15e7 <free+0x57>
    p->s.size += bp->s.size;
    160a:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
    160d:	a3 c4 1f 00 00       	mov    %eax,0x1fc4
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    1612:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1615:	8b 53 f8             	mov    -0x8(%ebx),%edx
    1618:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
    161a:	5b                   	pop    %ebx
    161b:	5e                   	pop    %esi
    161c:	5f                   	pop    %edi
    161d:	5d                   	pop    %ebp
    161e:	c3                   	ret    
    161f:	90                   	nop

00001620 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1620:	55                   	push   %ebp
    1621:	89 e5                	mov    %esp,%ebp
    1623:	57                   	push   %edi
    1624:	56                   	push   %esi
    1625:	53                   	push   %ebx
    1626:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1629:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    162c:	8b 15 c4 1f 00 00    	mov    0x1fc4,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1632:	8d 78 07             	lea    0x7(%eax),%edi
    1635:	c1 ef 03             	shr    $0x3,%edi
    1638:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    163b:	85 d2                	test   %edx,%edx
    163d:	0f 84 93 00 00 00    	je     16d6 <malloc+0xb6>
    1643:	8b 02                	mov    (%edx),%eax
    1645:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    1648:	39 cf                	cmp    %ecx,%edi
    164a:	76 64                	jbe    16b0 <malloc+0x90>
    164c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    1652:	bb 00 10 00 00       	mov    $0x1000,%ebx
    1657:	0f 43 df             	cmovae %edi,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
    165a:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    1661:	eb 0e                	jmp    1671 <malloc+0x51>
    1663:	90                   	nop
    1664:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1668:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    166a:	8b 48 04             	mov    0x4(%eax),%ecx
    166d:	39 cf                	cmp    %ecx,%edi
    166f:	76 3f                	jbe    16b0 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1671:	39 05 c4 1f 00 00    	cmp    %eax,0x1fc4
    1677:	89 c2                	mov    %eax,%edx
    1679:	75 ed                	jne    1668 <malloc+0x48>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
    167b:	83 ec 0c             	sub    $0xc,%esp
    167e:	56                   	push   %esi
    167f:	e8 8c fc ff ff       	call   1310 <sbrk>
  if(p == (char*)-1)
    1684:	83 c4 10             	add    $0x10,%esp
    1687:	83 f8 ff             	cmp    $0xffffffff,%eax
    168a:	74 1c                	je     16a8 <malloc+0x88>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
    168c:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    168f:	83 ec 0c             	sub    $0xc,%esp
    1692:	83 c0 08             	add    $0x8,%eax
    1695:	50                   	push   %eax
    1696:	e8 f5 fe ff ff       	call   1590 <free>
  return freep;
    169b:	8b 15 c4 1f 00 00    	mov    0x1fc4,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
    16a1:	83 c4 10             	add    $0x10,%esp
    16a4:	85 d2                	test   %edx,%edx
    16a6:	75 c0                	jne    1668 <malloc+0x48>
        return 0;
    16a8:	31 c0                	xor    %eax,%eax
    16aa:	eb 1c                	jmp    16c8 <malloc+0xa8>
    16ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
    16b0:	39 cf                	cmp    %ecx,%edi
    16b2:	74 1c                	je     16d0 <malloc+0xb0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
    16b4:	29 f9                	sub    %edi,%ecx
    16b6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    16b9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    16bc:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
    16bf:	89 15 c4 1f 00 00    	mov    %edx,0x1fc4
      return (void*)(p + 1);
    16c5:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
    16c8:	8d 65 f4             	lea    -0xc(%ebp),%esp
    16cb:	5b                   	pop    %ebx
    16cc:	5e                   	pop    %esi
    16cd:	5f                   	pop    %edi
    16ce:	5d                   	pop    %ebp
    16cf:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
    16d0:	8b 08                	mov    (%eax),%ecx
    16d2:	89 0a                	mov    %ecx,(%edx)
    16d4:	eb e9                	jmp    16bf <malloc+0x9f>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    16d6:	c7 05 c4 1f 00 00 c8 	movl   $0x1fc8,0x1fc4
    16dd:	1f 00 00 
    16e0:	c7 05 c8 1f 00 00 c8 	movl   $0x1fc8,0x1fc8
    16e7:	1f 00 00 
    base.s.size = 0;
    16ea:	b8 c8 1f 00 00       	mov    $0x1fc8,%eax
    16ef:	c7 05 cc 1f 00 00 00 	movl   $0x0,0x1fcc
    16f6:	00 00 00 
    16f9:	e9 4e ff ff ff       	jmp    164c <malloc+0x2c>
