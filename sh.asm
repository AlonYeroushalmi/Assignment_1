
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
      33:	e8 80 12 00 00       	call   12b8 <open>
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
      55:	68 40 1f 00 00       	push   $0x1f40
      5a:	e8 41 04 00 00       	call   4a0 <getcmd>
      5f:	83 c4 10             	add    $0x10,%esp
      62:	85 c0                	test   %eax,%eax
      64:	0f 88 c1 01 00 00    	js     22b <main+0x22b>
    enqueueHistory(buf);
      6a:	83 ec 0c             	sub    $0xc,%esp
      6d:	68 40 1f 00 00       	push   $0x1f40
      72:	e8 99 02 00 00       	call   310 <enqueueHistory>

    transformDollars(buf);
      77:	c7 04 24 40 1f 00 00 	movl   $0x1f40,(%esp)
      7e:	e8 9d 04 00 00       	call   520 <transformDollars>

    char* equalIndex;
    char* bufIterator = buf; //NOTICE: seems that wanted behavior is different than in bash. There can be only one assignment
    if ((equalIndex = strchr(bufIterator, '=')) != 0) { //in a command, therefore iterator is redundant.
      83:	58                   	pop    %eax
      84:	5a                   	pop    %edx
      85:	6a 3d                	push   $0x3d
      87:	68 40 1f 00 00       	push   $0x1f40
      8c:	e8 5f 10 00 00       	call   10f0 <strchr>
      91:	83 c4 10             	add    $0x10,%esp
      94:	85 c0                	test   %eax,%eax
      96:	89 c7                	mov    %eax,%edi
      98:	0f 84 2a 02 00 00    	je     2c8 <main+0x2c8>
      char var[USER_COMMAND_MAX_SIZE];
      char val[USER_COMMAND_MAX_SIZE];
      char* varBeginIndex = equalIndex - 1;
      9e:	8d 50 ff             	lea    -0x1(%eax),%edx
      while ((varBeginIndex != buf) && (*varBeginIndex != ' ')) //the check that var name is legal is done in the system call
      a1:	81 fa 40 1f 00 00    	cmp    $0x1f40,%edx
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
      cd:	3d 40 1f 00 00       	cmp    $0x1f40,%eax
        varBeginIndex--;
      d2:	89 c2                	mov    %eax,%edx
    char* bufIterator = buf; //NOTICE: seems that wanted behavior is different than in bash. There can be only one assignment
    if ((equalIndex = strchr(bufIterator, '=')) != 0) { //in a command, therefore iterator is redundant.
      char var[USER_COMMAND_MAX_SIZE];
      char val[USER_COMMAND_MAX_SIZE];
      char* varBeginIndex = equalIndex - 1;
      while ((varBeginIndex != buf) && (*varBeginIndex != ' ')) //the check that var name is legal is done in the system call
      d4:	75 ea                	jne    c0 <main+0xc0>
        varBeginIndex--;
      if (varBeginIndex != buf)
        varBeginIndex++;
      if (varBeginIndex == equalIndex)
      d6:	39 fa                	cmp    %edi,%edx
      d8:	0f 84 4d 01 00 00    	je     22b <main+0x22b>
      de:	66 90                	xchg   %ax,%ax
        break; //command in buf is probably an error
      strncpy(var, varBeginIndex, equalIndex - varBeginIndex); //copy the var to auxillary array
      e0:	89 f9                	mov    %edi,%ecx
      e2:	83 ec 04             	sub    $0x4,%esp
      e5:	29 d1                	sub    %edx,%ecx
      e7:	51                   	push   %ecx
      e8:	52                   	push   %edx
      e9:	56                   	push   %esi
      ea:	89 8d e4 fe ff ff    	mov    %ecx,-0x11c(%ebp)
      f0:	e8 cb 0e 00 00       	call   fc0 <strncpy>
      var[equalIndex - varBeginIndex] = 0; //make sure to make it a legal string
      f5:	8b 8d e4 fe ff ff    	mov    -0x11c(%ebp),%ecx
      fb:	c6 84 0d e8 fe ff ff 	movb   $0x0,-0x118(%ebp,%ecx,1)
     102:	00 
      //printf(2, "%s\n", var);
      char* valEndIndex;
      if ((valEndIndex = strchr(equalIndex, '\n')) == 0)
     103:	59                   	pop    %ecx
     104:	58                   	pop    %eax
     105:	6a 0a                	push   $0xa
     107:	57                   	push   %edi
     108:	e8 e3 0f 00 00       	call   10f0 <strchr>
     10d:	83 c4 10             	add    $0x10,%esp
     110:	85 c0                	test   %eax,%eax
     112:	0f 84 38 01 00 00    	je     250 <main+0x250>
        if ((valEndIndex = strchr(equalIndex, 0)) == 0)
          break; //command in buf is probably an error
      valEndIndex--;
      strncpy(val, equalIndex+1, valEndIndex - equalIndex); //copy the val to auxillary array
     118:	8d 50 ff             	lea    -0x1(%eax),%edx
     11b:	83 ec 04             	sub    $0x4,%esp
     11e:	89 d1                	mov    %edx,%ecx
     120:	89 95 e0 fe ff ff    	mov    %edx,-0x120(%ebp)
     126:	29 f9                	sub    %edi,%ecx
     128:	83 c7 01             	add    $0x1,%edi
     12b:	51                   	push   %ecx
     12c:	57                   	push   %edi
     12d:	53                   	push   %ebx
     12e:	89 8d e4 fe ff ff    	mov    %ecx,-0x11c(%ebp)
     134:	e8 87 0e 00 00       	call   fc0 <strncpy>
      val[valEndIndex - equalIndex] = 0; //make sure to make it a legal string
      //printf(2, "%s\n", val);
      setVariable(var, val);
     139:	58                   	pop    %eax
     13a:	5a                   	pop    %edx
      if ((valEndIndex = strchr(equalIndex, '\n')) == 0)
        if ((valEndIndex = strchr(equalIndex, 0)) == 0)
          break; //command in buf is probably an error
      valEndIndex--;
      strncpy(val, equalIndex+1, valEndIndex - equalIndex); //copy the val to auxillary array
      val[valEndIndex - equalIndex] = 0; //make sure to make it a legal string
     13b:	8b 8d e4 fe ff ff    	mov    -0x11c(%ebp),%ecx
      //printf(2, "%s\n", val);
      setVariable(var, val);
     141:	53                   	push   %ebx
     142:	56                   	push   %esi
      if ((valEndIndex = strchr(equalIndex, '\n')) == 0)
        if ((valEndIndex = strchr(equalIndex, 0)) == 0)
          break; //command in buf is probably an error
      valEndIndex--;
      strncpy(val, equalIndex+1, valEndIndex - equalIndex); //copy the val to auxillary array
      val[valEndIndex - equalIndex] = 0; //make sure to make it a legal string
     143:	c6 84 0d 68 ff ff ff 	movb   $0x0,-0x98(%ebp,%ecx,1)
     14a:	00 
      //printf(2, "%s\n", val);
      setVariable(var, val);
     14b:	e8 c8 11 00 00       	call   1318 <setVariable>
      bufIterator += valEndIndex - bufIterator + 1; //start next search after the val of the last found '=' (redundant)
     150:	8b 95 e0 fe ff ff    	mov    -0x120(%ebp),%edx
     156:	83 c4 10             	add    $0x10,%esp
     159:	8d 42 01             	lea    0x1(%edx),%eax
    }
    strcpy(buf, bufIterator); //rewrite the buffer content without the variable assignment
     15c:	83 ec 08             	sub    $0x8,%esp
     15f:	50                   	push   %eax
     160:	68 40 1f 00 00       	push   $0x1f40
     165:	e8 26 0e 00 00       	call   f90 <strcpy>

    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
     16a:	83 c4 10             	add    $0x10,%esp
     16d:	80 3d 40 1f 00 00 63 	cmpb   $0x63,0x1f40
     174:	75 0d                	jne    183 <main+0x183>
     176:	80 3d 41 1f 00 00 64 	cmpb   $0x64,0x1f41
     17d:	0f 84 ed 00 00 00    	je     270 <main+0x270>
      if(chdir(buf+3) < 0)
        printf(2, "cannot cd %s\n", buf+3);
      continue;
    }

    if (strncmp("history", buf, 7) == 0) {
     183:	83 ec 04             	sub    $0x4,%esp
     186:	6a 07                	push   $0x7
     188:	68 40 1f 00 00       	push   $0x1f40
     18d:	68 d4 17 00 00       	push   $0x17d4
     192:	e8 a9 0e 00 00       	call   1040 <strncmp>
     197:	83 c4 10             	add    $0x10,%esp
     19a:	85 c0                	test   %eax,%eax
     19c:	75 5a                	jne    1f8 <main+0x1f8>
      if (strncmp (" -l ", buf+7, 4) == 0) {
     19e:	83 ec 04             	sub    $0x4,%esp
     1a1:	6a 04                	push   $0x4
     1a3:	68 47 1f 00 00       	push   $0x1f47
     1a8:	68 dc 17 00 00       	push   $0x17dc
     1ad:	e8 8e 0e 00 00       	call   1040 <strncmp>
     1b2:	83 c4 10             	add    $0x10,%esp
     1b5:	85 c0                	test   %eax,%eax
     1b7:	75 77                	jne    230 <main+0x230>
        history(atoi(buf+11), buf);
     1b9:	83 ec 0c             	sub    $0xc,%esp
     1bc:	68 4b 1f 00 00       	push   $0x1f4b
     1c1:	e8 2a 10 00 00       	call   11f0 <atoi>
     1c6:	5a                   	pop    %edx
     1c7:	59                   	pop    %ecx
     1c8:	68 40 1f 00 00       	push   $0x1f40
     1cd:	50                   	push   %eax
     1ce:	e8 bd 01 00 00       	call   390 <history>
        if (strchr(buf, '$') != 0)
     1d3:	5f                   	pop    %edi
     1d4:	58                   	pop    %eax
     1d5:	6a 24                	push   $0x24
     1d7:	68 40 1f 00 00       	push   $0x1f40
     1dc:	e8 0f 0f 00 00       	call   10f0 <strchr>
     1e1:	83 c4 10             	add    $0x10,%esp
     1e4:	85 c0                	test   %eax,%eax
     1e6:	74 10                	je     1f8 <main+0x1f8>
          transformDollars(buf);
     1e8:	83 ec 0c             	sub    $0xc,%esp
     1eb:	68 40 1f 00 00       	push   $0x1f40
     1f0:	e8 2b 03 00 00       	call   520 <transformDollars>
     1f5:	83 c4 10             	add    $0x10,%esp
int
fork1(void)
{
  int pid;

  pid = fork();
     1f8:	e8 73 10 00 00       	call   1270 <fork>
  if(pid == -1)
     1fd:	83 f8 ff             	cmp    $0xffffffff,%eax
     200:	0f 84 dd 00 00 00    	je     2e3 <main+0x2e3>
        history(-1, buf);
        continue;
      }
    }

    if(fork1() == 0)
     206:	85 c0                	test   %eax,%eax
     208:	0f 84 e2 00 00 00    	je     2f0 <main+0x2f0>
      runcmd(parsecmd(buf));
    wait();
     20e:	e8 6d 10 00 00       	call   1280 <wait>
     213:	e9 38 fe ff ff       	jmp    50 <main+0x50>
     218:	90                   	nop
     219:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      char val[USER_COMMAND_MAX_SIZE];
      char* varBeginIndex = equalIndex - 1;
      while ((varBeginIndex != buf) && (*varBeginIndex != ' ')) //the check that var name is legal is done in the system call
        varBeginIndex--;
      if (varBeginIndex != buf)
        varBeginIndex++;
     220:	83 c2 01             	add    $0x1,%edx
      if (varBeginIndex == equalIndex)
     223:	39 fa                	cmp    %edi,%edx
     225:	0f 85 b5 fe ff ff    	jne    e0 <main+0xe0>

    if(fork1() == 0)
      runcmd(parsecmd(buf));
    wait();
  }
  exit();
     22b:	e8 48 10 00 00       	call   1278 <exit>
        history(atoi(buf+11), buf);
        if (strchr(buf, '$') != 0)
          transformDollars(buf);
      }
      else {
        history(-1, buf);
     230:	83 ec 08             	sub    $0x8,%esp
     233:	68 40 1f 00 00       	push   $0x1f40
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
     256:	e8 95 0e 00 00       	call   10f0 <strchr>
     25b:	83 c4 10             	add    $0x10,%esp
     25e:	85 c0                	test   %eax,%eax
     260:	0f 85 b2 fe ff ff    	jne    118 <main+0x118>
     266:	eb c3                	jmp    22b <main+0x22b>
     268:	90                   	nop
     269:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      setVariable(var, val);
      bufIterator += valEndIndex - bufIterator + 1; //start next search after the val of the last found '=' (redundant)
    }
    strcpy(buf, bufIterator); //rewrite the buffer content without the variable assignment

    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
     270:	80 3d 42 1f 00 00 20 	cmpb   $0x20,0x1f42
     277:	0f 85 06 ff ff ff    	jne    183 <main+0x183>
      // Chdir must be called by the parent, not the child.
      buf[strlen(buf)-1] = 0;  // chop \n
     27d:	83 ec 0c             	sub    $0xc,%esp
     280:	68 40 1f 00 00       	push   $0x1f40
     285:	e8 16 0e 00 00       	call   10a0 <strlen>
      if(chdir(buf+3) < 0)
     28a:	c7 04 24 43 1f 00 00 	movl   $0x1f43,(%esp)
    }
    strcpy(buf, bufIterator); //rewrite the buffer content without the variable assignment

    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      // Chdir must be called by the parent, not the child.
      buf[strlen(buf)-1] = 0;  // chop \n
     291:	c6 80 3f 1f 00 00 00 	movb   $0x0,0x1f3f(%eax)
      if(chdir(buf+3) < 0)
     298:	e8 4b 10 00 00       	call   12e8 <chdir>
     29d:	83 c4 10             	add    $0x10,%esp
     2a0:	85 c0                	test   %eax,%eax
     2a2:	0f 89 a8 fd ff ff    	jns    50 <main+0x50>
        printf(2, "cannot cd %s\n", buf+3);
     2a8:	50                   	push   %eax
     2a9:	68 43 1f 00 00       	push   $0x1f43
     2ae:	68 c6 17 00 00       	push   $0x17c6
     2b3:	6a 02                	push   $0x2
     2b5:	e8 26 11 00 00       	call   13e0 <printf>
     2ba:	83 c4 10             	add    $0x10,%esp
     2bd:	e9 8e fd ff ff       	jmp    50 <main+0x50>
     2c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    enqueueHistory(buf);

    transformDollars(buf);

    char* equalIndex;
    char* bufIterator = buf; //NOTICE: seems that wanted behavior is different than in bash. There can be only one assignment
     2c8:	b8 40 1f 00 00       	mov    $0x1f40,%eax
     2cd:	e9 8a fe ff ff       	jmp    15c <main+0x15c>
  int fd;

  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
    if(fd >= 3){
      close(fd);
     2d2:	83 ec 0c             	sub    $0xc,%esp
     2d5:	50                   	push   %eax
     2d6:	e8 c5 0f 00 00       	call   12a0 <close>
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
     2eb:	e8 20 03 00 00       	call   610 <panic>
        continue;
      }
    }

    if(fork1() == 0)
      runcmd(parsecmd(buf));
     2f0:	83 ec 0c             	sub    $0xc,%esp
     2f3:	68 40 1f 00 00       	push   $0x1f40
     2f8:	e8 23 0c 00 00       	call   f20 <parsecmd>
     2fd:	89 04 24             	mov    %eax,(%esp)
     300:	e8 2b 03 00 00       	call   630 <runcmd>
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
     31b:	e8 80 0d 00 00       	call   10a0 <strlen>
     320:	c6 44 03 ff 00       	movb   $0x0,-0x1(%ebx,%eax,1)
  strcpy(command_queue[queue_head_index], buf);
     325:	58                   	pop    %eax
     326:	a1 24 1f 00 00       	mov    0x1f24,%eax
     32b:	5a                   	pop    %edx
     32c:	53                   	push   %ebx
     32d:	c1 e0 07             	shl    $0x7,%eax
     330:	05 c0 1f 00 00       	add    $0x1fc0,%eax
     335:	50                   	push   %eax
     336:	e8 55 0c 00 00       	call   f90 <strcpy>
  queue_head_index++;
     33b:	a1 24 1f 00 00       	mov    0x1f24,%eax
  next_total_index++;
  if (empty_index < MAX_HISTORY)
     340:	8b 15 20 1f 00 00    	mov    0x1f20,%edx
     346:	83 c4 10             	add    $0x10,%esp

void enqueueHistory(char* buf) {
  buf[strlen(buf)-1] = 0;
  strcpy(command_queue[queue_head_index], buf);
  queue_head_index++;
  next_total_index++;
     349:	83 05 1c 1f 00 00 01 	addl   $0x1,0x1f1c
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
     356:	a3 24 1f 00 00       	mov    %eax,0x1f24
  next_total_index++;
  if (empty_index < MAX_HISTORY)
     35b:	7f 09                	jg     366 <enqueueHistory+0x56>
    empty_index++;
     35d:	83 c2 01             	add    $0x1,%edx
     360:	89 15 20 1f 00 00    	mov    %edx,0x1f20
  if (queue_head_index >= MAX_HISTORY)
     366:	83 f8 0f             	cmp    $0xf,%eax
     369:	7e 0a                	jle    375 <enqueueHistory+0x65>
    queue_head_index = 0;
     36b:	c7 05 24 1f 00 00 00 	movl   $0x0,0x1f24
     372:	00 00 00 
  buf[strlen(buf)] = '\n';
     375:	83 ec 0c             	sub    $0xc,%esp
     378:	53                   	push   %ebx
     379:	e8 22 0d 00 00       	call   10a0 <strlen>
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
     3a4:	8b 15 1c 1f 00 00    	mov    0x1f1c,%edx
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
     3c9:	05 c0 1f 00 00       	add    $0x1fc0,%eax
     3ce:	50                   	push   %eax
     3cf:	53                   	push   %ebx
     3d0:	e8 bb 0b 00 00       	call   f90 <strcpy>
    buf[strlen(buf)+1] = 0; 
     3d5:	89 1c 24             	mov    %ebx,(%esp)
     3d8:	e8 c3 0c 00 00       	call   10a0 <strlen>
     3dd:	c6 44 03 01 00       	movb   $0x0,0x1(%ebx,%eax,1)
    buf[strlen(buf)] = '\n'; //put newline in end of command (exec seems to expect that)
     3e2:	89 1c 24             	mov    %ebx,(%esp)
     3e5:	e8 b6 0c 00 00       	call   10a0 <strlen>
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
     420:	a1 20 1f 00 00       	mov    0x1f20,%eax
      historyIterator = queue_head_index;
     425:	8b 3d 24 1f 00 00    	mov    0x1f24,%edi
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
    for (int i=0; i<empty_index; i++) {
      if (historyIterator >= MAX_HISTORY)
     438:	89 fb                	mov    %edi,%ebx
     43a:	83 c7 01             	add    $0x1,%edi
        historyIterator = 0;
      printf(2, "%d. %s\n", max(next_total_index-16+i, 1+i), command_queue[historyIterator]);
     43d:	8b 15 1c 1f 00 00    	mov    0x1f1c,%edx
     443:	8d 70 01             	lea    0x1(%eax),%esi
     446:	83 ec 08             	sub    $0x8,%esp
     449:	c1 e3 07             	shl    $0x7,%ebx
     44c:	56                   	push   %esi
     44d:	81 c3 c0 1f 00 00    	add    $0x1fc0,%ebx
     453:	8d 44 10 f0          	lea    -0x10(%eax,%edx,1),%eax
     457:	50                   	push   %eax
     458:	e8 03 0e 00 00       	call   1260 <max>
     45d:	53                   	push   %ebx
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
     46e:	39 35 20 1f 00 00    	cmp    %esi,0x1f20
     474:	0f 8e 77 ff ff ff    	jle    3f1 <history+0x61>
     47a:	89 f0                	mov    %esi,%eax
      if (historyIterator >= MAX_HISTORY)
     47c:	83 ff 0f             	cmp    $0xf,%edi
     47f:	7e b7                	jle    438 <history+0xa8>
     481:	bf 01 00 00 00       	mov    $0x1,%edi
        historyIterator = 0;
     486:	31 db                	xor    %ebx,%ebx
     488:	eb b3                	jmp    43d <history+0xad>
     48a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  if (commandNum==-1) {
    int historyIterator;
    if (empty_index >= MAX_HISTORY)
      historyIterator = queue_head_index;
    else
      historyIterator = 0;
     490:	31 ff                	xor    %edi,%edi
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
     4c1:	e8 0a 0c 00 00       	call   10d0 <memset>
  gets(buf, nbuf);
     4c6:	58                   	pop    %eax
     4c7:	5a                   	pop    %edx
     4c8:	56                   	push   %esi
     4c9:	53                   	push   %ebx
     4ca:	e8 61 0c 00 00       	call   1130 <gets>
     4cf:	83 c4 10             	add    $0x10,%esp
     4d2:	31 c0                	xor    %eax,%eax
     4d4:	80 3b 00             	cmpb   $0x0,(%ebx)
     4d7:	0f 94 c0             	sete   %al
  if(buf[0] == 0) // EOF
    return -1;
  return 0;
}
     4da:	8d 65 f8             	lea    -0x8(%ebp),%esp
     4dd:	f7 d8                	neg    %eax
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
     4f7:	8d 42 bf             	lea    -0x41(%edx),%eax
     4fa:	3c 39                	cmp    $0x39,%al
     4fc:	0f 97 c1             	seta   %cl
     4ff:	83 ea 5b             	sub    $0x5b,%edx
     502:	80 fa 05             	cmp    $0x5,%dl
     505:	0f 96 c0             	setbe  %al
     508:	09 c8                	or     %ecx,%eax
     50a:	83 f0 01             	xor    $0x1,%eax
     50d:	0f b6 c0             	movzbl %al,%eax
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
     538:	e8 b3 0b 00 00       	call   10f0 <strchr>
     53d:	83 c4 10             	add    $0x10,%esp
     540:	85 c0                	test   %eax,%eax
     542:	89 c6                	mov    %eax,%esi
     544:	0f 84 bd 00 00 00    	je     607 <transformDollars+0xe7>
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
  char* dollarIndex;
  while ((dollarIndex = strchr(buf, '$')) != 0) {
    char var[USER_COMMAND_MAX_SIZE];
    char val[USER_COMMAND_MAX_SIZE];
    char restOfCommand[USER_COMMAND_MAX_SIZE];
    char* varLastIndex = dollarIndex + 1;
     557:	89 c3                	mov    %eax,%ebx
    return -1;
  return 0;
}

int isLetter(char c) {
  if(c < 'A' || c > 'z' ||
     559:	76 13                	jbe    56e <transformDollars+0x4e>
     55b:	eb 19                	jmp    576 <transformDollars+0x56>
     55d:	8d 76 00             	lea    0x0(%esi),%esi
    char var[USER_COMMAND_MAX_SIZE];
    char val[USER_COMMAND_MAX_SIZE];
    char restOfCommand[USER_COMMAND_MAX_SIZE];
    char* varLastIndex = dollarIndex + 1;
    while (isLetter(*varLastIndex))
      varLastIndex++;
     560:	83 c3 01             	add    $0x1,%ebx
    return -1;
  return 0;
}

int isLetter(char c) {
  if(c < 'A' || c > 'z' ||
     563:	0f b6 13             	movzbl (%ebx),%edx
     566:	8d 4a bf             	lea    -0x41(%edx),%ecx
     569:	80 f9 39             	cmp    $0x39,%cl
     56c:	77 08                	ja     576 <transformDollars+0x56>
     56e:	83 ea 5b             	sub    $0x5b,%edx
     571:	80 fa 05             	cmp    $0x5,%dl
     574:	77 ea                	ja     560 <transformDollars+0x40>
    char restOfCommand[USER_COMMAND_MAX_SIZE];
    char* varLastIndex = dollarIndex + 1;
    while (isLetter(*varLastIndex))
      varLastIndex++;
    varLastIndex--;
    strncpy(var, dollarIndex+1, varLastIndex-dollarIndex); //copy the var to auxillary array
     576:	8d 7b ff             	lea    -0x1(%ebx),%edi
     579:	83 ec 04             	sub    $0x4,%esp
     57c:	29 f7                	sub    %esi,%edi
     57e:	57                   	push   %edi
     57f:	50                   	push   %eax
     580:	8d 85 68 fe ff ff    	lea    -0x198(%ebp),%eax
     586:	50                   	push   %eax
     587:	e8 34 0a 00 00       	call   fc0 <strncpy>
    var[varLastIndex-dollarIndex] = 0; //make sure to make it a legal string
    if (getVariable(var, val) < 0) { //get the variable value
     58c:	58                   	pop    %eax
     58d:	8d 85 e8 fe ff ff    	lea    -0x118(%ebp),%eax
    char* varLastIndex = dollarIndex + 1;
    while (isLetter(*varLastIndex))
      varLastIndex++;
    varLastIndex--;
    strncpy(var, dollarIndex+1, varLastIndex-dollarIndex); //copy the var to auxillary array
    var[varLastIndex-dollarIndex] = 0; //make sure to make it a legal string
     593:	c6 84 3d 68 fe ff ff 	movb   $0x0,-0x198(%ebp,%edi,1)
     59a:	00 
    if (getVariable(var, val) < 0) { //get the variable value
     59b:	5a                   	pop    %edx
     59c:	50                   	push   %eax
     59d:	8d 85 68 fe ff ff    	lea    -0x198(%ebp),%eax
     5a3:	50                   	push   %eax
     5a4:	e8 77 0d 00 00       	call   1320 <getVariable>
     5a9:	83 c4 10             	add    $0x10,%esp
     5ac:	85 c0                	test   %eax,%eax
     5ae:	78 48                	js     5f8 <transformDollars+0xd8>
      strcpy(dollarIndex, varLastIndex+1); //remove the dollar var from the buffer (ubuntu behavior)
    }
    int valLength = strlen(val); //save the value length to use soon in restoring the rest of the command
     5b0:	8d 85 e8 fe ff ff    	lea    -0x118(%ebp),%eax
     5b6:	83 ec 0c             	sub    $0xc,%esp
     5b9:	50                   	push   %eax
     5ba:	e8 e1 0a 00 00       	call   10a0 <strlen>
    strcpy(restOfCommand, varLastIndex+1); //copy the rest of the command to another auxillay array
     5bf:	59                   	pop    %ecx
    strncpy(var, dollarIndex+1, varLastIndex-dollarIndex); //copy the var to auxillary array
    var[varLastIndex-dollarIndex] = 0; //make sure to make it a legal string
    if (getVariable(var, val) < 0) { //get the variable value
      strcpy(dollarIndex, varLastIndex+1); //remove the dollar var from the buffer (ubuntu behavior)
    }
    int valLength = strlen(val); //save the value length to use soon in restoring the rest of the command
     5c0:	89 c7                	mov    %eax,%edi
    strcpy(restOfCommand, varLastIndex+1); //copy the rest of the command to another auxillay array
     5c2:	58                   	pop    %eax
     5c3:	53                   	push   %ebx
     5c4:	8d 9d 68 ff ff ff    	lea    -0x98(%ebp),%ebx
    strcpy(dollarIndex, val); //copy the val to the buffer
    strcpy(dollarIndex+valLength, restOfCommand); //restore the rest of the command to the buffer
     5ca:	01 f7                	add    %esi,%edi
    var[varLastIndex-dollarIndex] = 0; //make sure to make it a legal string
    if (getVariable(var, val) < 0) { //get the variable value
      strcpy(dollarIndex, varLastIndex+1); //remove the dollar var from the buffer (ubuntu behavior)
    }
    int valLength = strlen(val); //save the value length to use soon in restoring the rest of the command
    strcpy(restOfCommand, varLastIndex+1); //copy the rest of the command to another auxillay array
     5cc:	53                   	push   %ebx
     5cd:	e8 be 09 00 00       	call   f90 <strcpy>
    strcpy(dollarIndex, val); //copy the val to the buffer
     5d2:	58                   	pop    %eax
     5d3:	8d 85 e8 fe ff ff    	lea    -0x118(%ebp),%eax
     5d9:	5a                   	pop    %edx
     5da:	50                   	push   %eax
     5db:	56                   	push   %esi
     5dc:	e8 af 09 00 00       	call   f90 <strcpy>
    strcpy(dollarIndex+valLength, restOfCommand); //restore the rest of the command to the buffer
     5e1:	59                   	pop    %ecx
     5e2:	58                   	pop    %eax
     5e3:	53                   	push   %ebx
     5e4:	57                   	push   %edi
     5e5:	e8 a6 09 00 00       	call   f90 <strcpy>
     5ea:	83 c4 10             	add    $0x10,%esp
     5ed:	e9 3e ff ff ff       	jmp    530 <transformDollars+0x10>
     5f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      varLastIndex++;
    varLastIndex--;
    strncpy(var, dollarIndex+1, varLastIndex-dollarIndex); //copy the var to auxillary array
    var[varLastIndex-dollarIndex] = 0; //make sure to make it a legal string
    if (getVariable(var, val) < 0) { //get the variable value
      strcpy(dollarIndex, varLastIndex+1); //remove the dollar var from the buffer (ubuntu behavior)
     5f8:	83 ec 08             	sub    $0x8,%esp
     5fb:	53                   	push   %ebx
     5fc:	56                   	push   %esi
     5fd:	e8 8e 09 00 00       	call   f90 <strcpy>
     602:	83 c4 10             	add    $0x10,%esp
     605:	eb a9                	jmp    5b0 <transformDollars+0x90>
    int valLength = strlen(val); //save the value length to use soon in restoring the rest of the command
    strcpy(restOfCommand, varLastIndex+1); //copy the rest of the command to another auxillay array
    strcpy(dollarIndex, val); //copy the val to the buffer
    strcpy(dollarIndex+valLength, restOfCommand); //restore the rest of the command to the buffer
  }
}
     607:	8d 65 f4             	lea    -0xc(%ebp),%esp
     60a:	5b                   	pop    %ebx
     60b:	5e                   	pop    %esi
     60c:	5f                   	pop    %edi
     60d:	5d                   	pop    %ebp
     60e:	c3                   	ret    
     60f:	90                   	nop

00000610 <panic>:
  exit();
}

void
panic(char *s)
{
     610:	55                   	push   %ebp
     611:	89 e5                	mov    %esp,%ebp
     613:	83 ec 0c             	sub    $0xc,%esp
  printf(2, "%s\n", s);
     616:	ff 75 08             	pushl  0x8(%ebp)
     619:	68 04 17 00 00       	push   $0x1704
     61e:	6a 02                	push   $0x2
     620:	e8 bb 0d 00 00       	call   13e0 <printf>
  exit();
     625:	e8 4e 0c 00 00       	call   1278 <exit>
     62a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000630 <runcmd>:
struct cmd *parsecmd(char*);

// Execute cmd.  Never returns.
void
runcmd(struct cmd *cmd)
{
     630:	55                   	push   %ebp
     631:	89 e5                	mov    %esp,%ebp
     633:	53                   	push   %ebx
     634:	83 ec 14             	sub    $0x14,%esp
     637:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     63a:	85 db                	test   %ebx,%ebx
     63c:	74 76                	je     6b4 <runcmd+0x84>
    exit();

  switch(cmd->type){
     63e:	83 3b 05             	cmpl   $0x5,(%ebx)
     641:	0f 87 f8 00 00 00    	ja     73f <runcmd+0x10f>
     647:	8b 03                	mov    (%ebx),%eax
     649:	ff 24 85 e4 17 00 00 	jmp    *0x17e4(,%eax,4)
    runcmd(lcmd->right);
    break;

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
    if(pipe(p) < 0)
     650:	8d 45 f0             	lea    -0x10(%ebp),%eax
     653:	83 ec 0c             	sub    $0xc,%esp
     656:	50                   	push   %eax
     657:	e8 2c 0c 00 00       	call   1288 <pipe>
     65c:	83 c4 10             	add    $0x10,%esp
     65f:	85 c0                	test   %eax,%eax
     661:	0f 88 07 01 00 00    	js     76e <runcmd+0x13e>
int
fork1(void)
{
  int pid;

  pid = fork();
     667:	e8 04 0c 00 00       	call   1270 <fork>
  if(pid == -1)
     66c:	83 f8 ff             	cmp    $0xffffffff,%eax
     66f:	0f 84 d7 00 00 00    	je     74c <runcmd+0x11c>

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
    if(pipe(p) < 0)
      panic("pipe");
    if(fork1() == 0){
     675:	85 c0                	test   %eax,%eax
     677:	0f 84 fe 00 00 00    	je     77b <runcmd+0x14b>
int
fork1(void)
{
  int pid;

  pid = fork();
     67d:	e8 ee 0b 00 00       	call   1270 <fork>
  if(pid == -1)
     682:	83 f8 ff             	cmp    $0xffffffff,%eax
     685:	0f 84 c1 00 00 00    	je     74c <runcmd+0x11c>
      dup(p[1]);
      close(p[0]);
      close(p[1]);
      runcmd(pcmd->left);
    }
    if(fork1() == 0){
     68b:	85 c0                	test   %eax,%eax
     68d:	0f 84 16 01 00 00    	je     7a9 <runcmd+0x179>
      dup(p[0]);
      close(p[0]);
      close(p[1]);
      runcmd(pcmd->right);
    }
    close(p[0]);
     693:	83 ec 0c             	sub    $0xc,%esp
     696:	ff 75 f0             	pushl  -0x10(%ebp)
     699:	e8 02 0c 00 00       	call   12a0 <close>
    close(p[1]);
     69e:	58                   	pop    %eax
     69f:	ff 75 f4             	pushl  -0xc(%ebp)
     6a2:	e8 f9 0b 00 00       	call   12a0 <close>
    wait();
     6a7:	e8 d4 0b 00 00       	call   1280 <wait>
    wait();
     6ac:	e8 cf 0b 00 00       	call   1280 <wait>
    break;
     6b1:	83 c4 10             	add    $0x10,%esp
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
    exit();
     6b4:	e8 bf 0b 00 00       	call   1278 <exit>
int
fork1(void)
{
  int pid;

  pid = fork();
     6b9:	e8 b2 0b 00 00       	call   1270 <fork>
  if(pid == -1)
     6be:	83 f8 ff             	cmp    $0xffffffff,%eax
     6c1:	0f 84 85 00 00 00    	je     74c <runcmd+0x11c>
    wait();
    break;

  case BACK:
    bcmd = (struct backcmd*)cmd;
    if(fork1() == 0)
     6c7:	85 c0                	test   %eax,%eax
     6c9:	75 e9                	jne    6b4 <runcmd+0x84>
     6cb:	eb 49                	jmp    716 <runcmd+0xe6>
  default:
    panic("runcmd");

  case EXEC:
    ecmd = (struct execcmd*)cmd;
    if(ecmd->argv[0] == 0)
     6cd:	8b 43 04             	mov    0x4(%ebx),%eax
     6d0:	85 c0                	test   %eax,%eax
     6d2:	74 e0                	je     6b4 <runcmd+0x84>
      exit();
    exec(ecmd->argv[0], ecmd->argv);
     6d4:	52                   	push   %edx
     6d5:	52                   	push   %edx
     6d6:	8d 53 04             	lea    0x4(%ebx),%edx
     6d9:	52                   	push   %edx
     6da:	50                   	push   %eax
     6db:	e8 d0 0b 00 00       	call   12b0 <exec>
    printf(2, "exec %s failed\n", ecmd->argv[0]);
     6e0:	83 c4 0c             	add    $0xc,%esp
     6e3:	ff 73 04             	pushl  0x4(%ebx)
     6e6:	68 27 17 00 00       	push   $0x1727
     6eb:	6a 02                	push   $0x2
     6ed:	e8 ee 0c 00 00       	call   13e0 <printf>
    break;
     6f2:	83 c4 10             	add    $0x10,%esp
     6f5:	eb bd                	jmp    6b4 <runcmd+0x84>

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    close(rcmd->fd);
     6f7:	83 ec 0c             	sub    $0xc,%esp
     6fa:	ff 73 14             	pushl  0x14(%ebx)
     6fd:	e8 9e 0b 00 00       	call   12a0 <close>
    if(open(rcmd->file, rcmd->mode) < 0){
     702:	59                   	pop    %ecx
     703:	58                   	pop    %eax
     704:	ff 73 10             	pushl  0x10(%ebx)
     707:	ff 73 08             	pushl  0x8(%ebx)
     70a:	e8 a9 0b 00 00       	call   12b8 <open>
     70f:	83 c4 10             	add    $0x10,%esp
     712:	85 c0                	test   %eax,%eax
     714:	78 43                	js     759 <runcmd+0x129>
    break;

  case BACK:
    bcmd = (struct backcmd*)cmd;
    if(fork1() == 0)
      runcmd(bcmd->cmd);
     716:	83 ec 0c             	sub    $0xc,%esp
     719:	ff 73 04             	pushl  0x4(%ebx)
     71c:	e8 0f ff ff ff       	call   630 <runcmd>
int
fork1(void)
{
  int pid;

  pid = fork();
     721:	e8 4a 0b 00 00       	call   1270 <fork>
  if(pid == -1)
     726:	83 f8 ff             	cmp    $0xffffffff,%eax
     729:	74 21                	je     74c <runcmd+0x11c>
    runcmd(rcmd->cmd);
    break;

  case LIST:
    lcmd = (struct listcmd*)cmd;
    if(fork1() == 0)
     72b:	85 c0                	test   %eax,%eax
     72d:	74 e7                	je     716 <runcmd+0xe6>
      runcmd(lcmd->left);
    wait();
     72f:	e8 4c 0b 00 00       	call   1280 <wait>
    runcmd(lcmd->right);
     734:	83 ec 0c             	sub    $0xc,%esp
     737:	ff 73 08             	pushl  0x8(%ebx)
     73a:	e8 f1 fe ff ff       	call   630 <runcmd>
  if(cmd == 0)
    exit();

  switch(cmd->type){
  default:
    panic("runcmd");
     73f:	83 ec 0c             	sub    $0xc,%esp
     742:	68 20 17 00 00       	push   $0x1720
     747:	e8 c4 fe ff ff       	call   610 <panic>
{
  int pid;

  pid = fork();
  if(pid == -1)
    panic("fork");
     74c:	83 ec 0c             	sub    $0xc,%esp
     74f:	68 47 17 00 00       	push   $0x1747
     754:	e8 b7 fe ff ff       	call   610 <panic>

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    close(rcmd->fd);
    if(open(rcmd->file, rcmd->mode) < 0){
      printf(2, "open %s failed\n", rcmd->file);
     759:	52                   	push   %edx
     75a:	ff 73 08             	pushl  0x8(%ebx)
     75d:	68 37 17 00 00       	push   $0x1737
     762:	6a 02                	push   $0x2
     764:	e8 77 0c 00 00       	call   13e0 <printf>
      exit();
     769:	e8 0a 0b 00 00       	call   1278 <exit>
    break;

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
    if(pipe(p) < 0)
      panic("pipe");
     76e:	83 ec 0c             	sub    $0xc,%esp
     771:	68 4c 17 00 00       	push   $0x174c
     776:	e8 95 fe ff ff       	call   610 <panic>
    if(fork1() == 0){
      close(1);
     77b:	83 ec 0c             	sub    $0xc,%esp
     77e:	6a 01                	push   $0x1
     780:	e8 1b 0b 00 00       	call   12a0 <close>
      dup(p[1]);
     785:	58                   	pop    %eax
     786:	ff 75 f4             	pushl  -0xc(%ebp)
     789:	e8 62 0b 00 00       	call   12f0 <dup>
      close(p[0]);
     78e:	58                   	pop    %eax
     78f:	ff 75 f0             	pushl  -0x10(%ebp)
     792:	e8 09 0b 00 00       	call   12a0 <close>
      close(p[1]);
     797:	58                   	pop    %eax
     798:	ff 75 f4             	pushl  -0xc(%ebp)
     79b:	e8 00 0b 00 00       	call   12a0 <close>
      runcmd(pcmd->left);
     7a0:	58                   	pop    %eax
     7a1:	ff 73 04             	pushl  0x4(%ebx)
     7a4:	e8 87 fe ff ff       	call   630 <runcmd>
    }
    if(fork1() == 0){
      close(0);
     7a9:	83 ec 0c             	sub    $0xc,%esp
     7ac:	6a 00                	push   $0x0
     7ae:	e8 ed 0a 00 00       	call   12a0 <close>
      dup(p[0]);
     7b3:	5a                   	pop    %edx
     7b4:	ff 75 f0             	pushl  -0x10(%ebp)
     7b7:	e8 34 0b 00 00       	call   12f0 <dup>
      close(p[0]);
     7bc:	59                   	pop    %ecx
     7bd:	ff 75 f0             	pushl  -0x10(%ebp)
     7c0:	e8 db 0a 00 00       	call   12a0 <close>
      close(p[1]);
     7c5:	58                   	pop    %eax
     7c6:	ff 75 f4             	pushl  -0xc(%ebp)
     7c9:	e8 d2 0a 00 00       	call   12a0 <close>
      runcmd(pcmd->right);
     7ce:	58                   	pop    %eax
     7cf:	ff 73 08             	pushl  0x8(%ebx)
     7d2:	e8 59 fe ff ff       	call   630 <runcmd>
     7d7:	89 f6                	mov    %esi,%esi
     7d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000007e0 <fork1>:
  exit();
}

int
fork1(void)
{
     7e0:	55                   	push   %ebp
     7e1:	89 e5                	mov    %esp,%ebp
     7e3:	83 ec 08             	sub    $0x8,%esp
  int pid;

  pid = fork();
     7e6:	e8 85 0a 00 00       	call   1270 <fork>
  if(pid == -1)
     7eb:	83 f8 ff             	cmp    $0xffffffff,%eax
     7ee:	74 02                	je     7f2 <fork1+0x12>
    panic("fork");
  return pid;
}
     7f0:	c9                   	leave  
     7f1:	c3                   	ret    
{
  int pid;

  pid = fork();
  if(pid == -1)
    panic("fork");
     7f2:	83 ec 0c             	sub    $0xc,%esp
     7f5:	68 47 17 00 00       	push   $0x1747
     7fa:	e8 11 fe ff ff       	call   610 <panic>
     7ff:	90                   	nop

00000800 <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
     800:	55                   	push   %ebp
     801:	89 e5                	mov    %esp,%ebp
     803:	53                   	push   %ebx
     804:	83 ec 10             	sub    $0x10,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     807:	6a 54                	push   $0x54
     809:	e8 02 0e 00 00       	call   1610 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     80e:	83 c4 0c             	add    $0xc,%esp
struct cmd*
execcmd(void)
{
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     811:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     813:	6a 54                	push   $0x54
     815:	6a 00                	push   $0x0
     817:	50                   	push   %eax
     818:	e8 b3 08 00 00       	call   10d0 <memset>
  cmd->type = EXEC;
     81d:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  return (struct cmd*)cmd;
}
     823:	89 d8                	mov    %ebx,%eax
     825:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     828:	c9                   	leave  
     829:	c3                   	ret    
     82a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000830 <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     830:	55                   	push   %ebp
     831:	89 e5                	mov    %esp,%ebp
     833:	53                   	push   %ebx
     834:	83 ec 10             	sub    $0x10,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     837:	6a 18                	push   $0x18
     839:	e8 d2 0d 00 00       	call   1610 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     83e:	83 c4 0c             	add    $0xc,%esp
struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     841:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     843:	6a 18                	push   $0x18
     845:	6a 00                	push   $0x0
     847:	50                   	push   %eax
     848:	e8 83 08 00 00       	call   10d0 <memset>
  cmd->type = REDIR;
  cmd->cmd = subcmd;
     84d:	8b 45 08             	mov    0x8(%ebp),%eax
{
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = REDIR;
     850:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
  cmd->cmd = subcmd;
     856:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->file = file;
     859:	8b 45 0c             	mov    0xc(%ebp),%eax
     85c:	89 43 08             	mov    %eax,0x8(%ebx)
  cmd->efile = efile;
     85f:	8b 45 10             	mov    0x10(%ebp),%eax
     862:	89 43 0c             	mov    %eax,0xc(%ebx)
  cmd->mode = mode;
     865:	8b 45 14             	mov    0x14(%ebp),%eax
     868:	89 43 10             	mov    %eax,0x10(%ebx)
  cmd->fd = fd;
     86b:	8b 45 18             	mov    0x18(%ebp),%eax
     86e:	89 43 14             	mov    %eax,0x14(%ebx)
  return (struct cmd*)cmd;
}
     871:	89 d8                	mov    %ebx,%eax
     873:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     876:	c9                   	leave  
     877:	c3                   	ret    
     878:	90                   	nop
     879:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000880 <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
     880:	55                   	push   %ebp
     881:	89 e5                	mov    %esp,%ebp
     883:	53                   	push   %ebx
     884:	83 ec 10             	sub    $0x10,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     887:	6a 0c                	push   $0xc
     889:	e8 82 0d 00 00       	call   1610 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     88e:	83 c4 0c             	add    $0xc,%esp
struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     891:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     893:	6a 0c                	push   $0xc
     895:	6a 00                	push   $0x0
     897:	50                   	push   %eax
     898:	e8 33 08 00 00       	call   10d0 <memset>
  cmd->type = PIPE;
  cmd->left = left;
     89d:	8b 45 08             	mov    0x8(%ebp),%eax
{
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = PIPE;
     8a0:	c7 03 03 00 00 00    	movl   $0x3,(%ebx)
  cmd->left = left;
     8a6:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     8a9:	8b 45 0c             	mov    0xc(%ebp),%eax
     8ac:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     8af:	89 d8                	mov    %ebx,%eax
     8b1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     8b4:	c9                   	leave  
     8b5:	c3                   	ret    
     8b6:	8d 76 00             	lea    0x0(%esi),%esi
     8b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000008c0 <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
     8c0:	55                   	push   %ebp
     8c1:	89 e5                	mov    %esp,%ebp
     8c3:	53                   	push   %ebx
     8c4:	83 ec 10             	sub    $0x10,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     8c7:	6a 0c                	push   $0xc
     8c9:	e8 42 0d 00 00       	call   1610 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     8ce:	83 c4 0c             	add    $0xc,%esp
struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     8d1:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     8d3:	6a 0c                	push   $0xc
     8d5:	6a 00                	push   $0x0
     8d7:	50                   	push   %eax
     8d8:	e8 f3 07 00 00       	call   10d0 <memset>
  cmd->type = LIST;
  cmd->left = left;
     8dd:	8b 45 08             	mov    0x8(%ebp),%eax
{
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = LIST;
     8e0:	c7 03 04 00 00 00    	movl   $0x4,(%ebx)
  cmd->left = left;
     8e6:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     8e9:	8b 45 0c             	mov    0xc(%ebp),%eax
     8ec:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     8ef:	89 d8                	mov    %ebx,%eax
     8f1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     8f4:	c9                   	leave  
     8f5:	c3                   	ret    
     8f6:	8d 76 00             	lea    0x0(%esi),%esi
     8f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000900 <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
     900:	55                   	push   %ebp
     901:	89 e5                	mov    %esp,%ebp
     903:	53                   	push   %ebx
     904:	83 ec 10             	sub    $0x10,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     907:	6a 08                	push   $0x8
     909:	e8 02 0d 00 00       	call   1610 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     90e:	83 c4 0c             	add    $0xc,%esp
struct cmd*
backcmd(struct cmd *subcmd)
{
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     911:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     913:	6a 08                	push   $0x8
     915:	6a 00                	push   $0x0
     917:	50                   	push   %eax
     918:	e8 b3 07 00 00       	call   10d0 <memset>
  cmd->type = BACK;
  cmd->cmd = subcmd;
     91d:	8b 45 08             	mov    0x8(%ebp),%eax
{
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = BACK;
     920:	c7 03 05 00 00 00    	movl   $0x5,(%ebx)
  cmd->cmd = subcmd;
     926:	89 43 04             	mov    %eax,0x4(%ebx)
  return (struct cmd*)cmd;
}
     929:	89 d8                	mov    %ebx,%eax
     92b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     92e:	c9                   	leave  
     92f:	c3                   	ret    

00000930 <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     930:	55                   	push   %ebp
     931:	89 e5                	mov    %esp,%ebp
     933:	57                   	push   %edi
     934:	56                   	push   %esi
     935:	53                   	push   %ebx
     936:	83 ec 0c             	sub    $0xc,%esp
  char *s;
  int ret;

  s = *ps;
     939:	8b 45 08             	mov    0x8(%ebp),%eax
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     93c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     93f:	8b 75 10             	mov    0x10(%ebp),%esi
  char *s;
  int ret;

  s = *ps;
     942:	8b 38                	mov    (%eax),%edi
  while(s < es && strchr(whitespace, *s))
     944:	39 df                	cmp    %ebx,%edi
     946:	72 13                	jb     95b <gettoken+0x2b>
     948:	eb 29                	jmp    973 <gettoken+0x43>
     94a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    s++;
     950:	83 c7 01             	add    $0x1,%edi
{
  char *s;
  int ret;

  s = *ps;
  while(s < es && strchr(whitespace, *s))
     953:	39 fb                	cmp    %edi,%ebx
     955:	0f 84 ed 00 00 00    	je     a48 <gettoken+0x118>
     95b:	0f be 07             	movsbl (%edi),%eax
     95e:	83 ec 08             	sub    $0x8,%esp
     961:	50                   	push   %eax
     962:	68 14 1f 00 00       	push   $0x1f14
     967:	e8 84 07 00 00       	call   10f0 <strchr>
     96c:	83 c4 10             	add    $0x10,%esp
     96f:	85 c0                	test   %eax,%eax
     971:	75 dd                	jne    950 <gettoken+0x20>
    s++;
  if(q)
     973:	85 f6                	test   %esi,%esi
     975:	74 02                	je     979 <gettoken+0x49>
    *q = s;
     977:	89 3e                	mov    %edi,(%esi)
  ret = *s;
     979:	0f be 37             	movsbl (%edi),%esi
     97c:	89 f1                	mov    %esi,%ecx
     97e:	89 f0                	mov    %esi,%eax
  switch(*s){
     980:	80 f9 29             	cmp    $0x29,%cl
     983:	7f 5b                	jg     9e0 <gettoken+0xb0>
     985:	80 f9 28             	cmp    $0x28,%cl
     988:	7d 61                	jge    9eb <gettoken+0xbb>
     98a:	84 c9                	test   %cl,%cl
     98c:	0f 85 de 00 00 00    	jne    a70 <gettoken+0x140>
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
     992:	8b 55 14             	mov    0x14(%ebp),%edx
     995:	85 d2                	test   %edx,%edx
     997:	74 05                	je     99e <gettoken+0x6e>
    *eq = s;
     999:	8b 45 14             	mov    0x14(%ebp),%eax
     99c:	89 38                	mov    %edi,(%eax)

  while(s < es && strchr(whitespace, *s))
     99e:	39 fb                	cmp    %edi,%ebx
     9a0:	77 0d                	ja     9af <gettoken+0x7f>
     9a2:	eb 23                	jmp    9c7 <gettoken+0x97>
     9a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    s++;
     9a8:	83 c7 01             	add    $0x1,%edi
    break;
  }
  if(eq)
    *eq = s;

  while(s < es && strchr(whitespace, *s))
     9ab:	39 fb                	cmp    %edi,%ebx
     9ad:	74 18                	je     9c7 <gettoken+0x97>
     9af:	0f be 07             	movsbl (%edi),%eax
     9b2:	83 ec 08             	sub    $0x8,%esp
     9b5:	50                   	push   %eax
     9b6:	68 14 1f 00 00       	push   $0x1f14
     9bb:	e8 30 07 00 00       	call   10f0 <strchr>
     9c0:	83 c4 10             	add    $0x10,%esp
     9c3:	85 c0                	test   %eax,%eax
     9c5:	75 e1                	jne    9a8 <gettoken+0x78>
    s++;
  *ps = s;
     9c7:	8b 45 08             	mov    0x8(%ebp),%eax
     9ca:	89 38                	mov    %edi,(%eax)
  return ret;
}
     9cc:	8d 65 f4             	lea    -0xc(%ebp),%esp
     9cf:	89 f0                	mov    %esi,%eax
     9d1:	5b                   	pop    %ebx
     9d2:	5e                   	pop    %esi
     9d3:	5f                   	pop    %edi
     9d4:	5d                   	pop    %ebp
     9d5:	c3                   	ret    
     9d6:	8d 76 00             	lea    0x0(%esi),%esi
     9d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  while(s < es && strchr(whitespace, *s))
    s++;
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
     9e0:	80 f9 3e             	cmp    $0x3e,%cl
     9e3:	75 0b                	jne    9f0 <gettoken+0xc0>
  case '<':
    s++;
    break;
  case '>':
    s++;
    if(*s == '>'){
     9e5:	80 7f 01 3e          	cmpb   $0x3e,0x1(%edi)
     9e9:	74 75                	je     a60 <gettoken+0x130>
  case '&':
  case '<':
    s++;
    break;
  case '>':
    s++;
     9eb:	83 c7 01             	add    $0x1,%edi
     9ee:	eb a2                	jmp    992 <gettoken+0x62>
  while(s < es && strchr(whitespace, *s))
    s++;
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
     9f0:	7f 5e                	jg     a50 <gettoken+0x120>
     9f2:	83 e9 3b             	sub    $0x3b,%ecx
     9f5:	80 f9 01             	cmp    $0x1,%cl
     9f8:	76 f1                	jbe    9eb <gettoken+0xbb>
      s++;
    }
    break;
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     9fa:	39 fb                	cmp    %edi,%ebx
     9fc:	77 24                	ja     a22 <gettoken+0xf2>
     9fe:	eb 7c                	jmp    a7c <gettoken+0x14c>
     a00:	0f be 07             	movsbl (%edi),%eax
     a03:	83 ec 08             	sub    $0x8,%esp
     a06:	50                   	push   %eax
     a07:	68 0c 1f 00 00       	push   $0x1f0c
     a0c:	e8 df 06 00 00       	call   10f0 <strchr>
     a11:	83 c4 10             	add    $0x10,%esp
     a14:	85 c0                	test   %eax,%eax
     a16:	75 1f                	jne    a37 <gettoken+0x107>
      s++;
     a18:	83 c7 01             	add    $0x1,%edi
      s++;
    }
    break;
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     a1b:	39 fb                	cmp    %edi,%ebx
     a1d:	74 5b                	je     a7a <gettoken+0x14a>
     a1f:	0f be 07             	movsbl (%edi),%eax
     a22:	83 ec 08             	sub    $0x8,%esp
     a25:	50                   	push   %eax
     a26:	68 14 1f 00 00       	push   $0x1f14
     a2b:	e8 c0 06 00 00       	call   10f0 <strchr>
     a30:	83 c4 10             	add    $0x10,%esp
     a33:	85 c0                	test   %eax,%eax
     a35:	74 c9                	je     a00 <gettoken+0xd0>
      ret = '+';
      s++;
    }
    break;
  default:
    ret = 'a';
     a37:	be 61 00 00 00       	mov    $0x61,%esi
     a3c:	e9 51 ff ff ff       	jmp    992 <gettoken+0x62>
     a41:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     a48:	89 df                	mov    %ebx,%edi
     a4a:	e9 24 ff ff ff       	jmp    973 <gettoken+0x43>
     a4f:	90                   	nop
  while(s < es && strchr(whitespace, *s))
    s++;
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
     a50:	80 f9 7c             	cmp    $0x7c,%cl
     a53:	74 96                	je     9eb <gettoken+0xbb>
     a55:	eb a3                	jmp    9fa <gettoken+0xca>
     a57:	89 f6                	mov    %esi,%esi
     a59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    break;
  case '>':
    s++;
    if(*s == '>'){
      ret = '+';
      s++;
     a60:	83 c7 02             	add    $0x2,%edi
    s++;
    break;
  case '>':
    s++;
    if(*s == '>'){
      ret = '+';
     a63:	be 2b 00 00 00       	mov    $0x2b,%esi
     a68:	e9 25 ff ff ff       	jmp    992 <gettoken+0x62>
     a6d:	8d 76 00             	lea    0x0(%esi),%esi
  while(s < es && strchr(whitespace, *s))
    s++;
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
     a70:	80 f9 26             	cmp    $0x26,%cl
     a73:	75 85                	jne    9fa <gettoken+0xca>
     a75:	e9 71 ff ff ff       	jmp    9eb <gettoken+0xbb>
     a7a:	89 df                	mov    %ebx,%edi
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
     a7c:	8b 45 14             	mov    0x14(%ebp),%eax
     a7f:	be 61 00 00 00       	mov    $0x61,%esi
     a84:	85 c0                	test   %eax,%eax
     a86:	0f 85 0d ff ff ff    	jne    999 <gettoken+0x69>
     a8c:	e9 36 ff ff ff       	jmp    9c7 <gettoken+0x97>
     a91:	eb 0d                	jmp    aa0 <peek>
     a93:	90                   	nop
     a94:	90                   	nop
     a95:	90                   	nop
     a96:	90                   	nop
     a97:	90                   	nop
     a98:	90                   	nop
     a99:	90                   	nop
     a9a:	90                   	nop
     a9b:	90                   	nop
     a9c:	90                   	nop
     a9d:	90                   	nop
     a9e:	90                   	nop
     a9f:	90                   	nop

00000aa0 <peek>:
  return ret;
}

int
peek(char **ps, char *es, char *toks)
{
     aa0:	55                   	push   %ebp
     aa1:	89 e5                	mov    %esp,%ebp
     aa3:	57                   	push   %edi
     aa4:	56                   	push   %esi
     aa5:	53                   	push   %ebx
     aa6:	83 ec 0c             	sub    $0xc,%esp
     aa9:	8b 7d 08             	mov    0x8(%ebp),%edi
     aac:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *s;

  s = *ps;
     aaf:	8b 1f                	mov    (%edi),%ebx
  while(s < es && strchr(whitespace, *s))
     ab1:	39 f3                	cmp    %esi,%ebx
     ab3:	72 12                	jb     ac7 <peek+0x27>
     ab5:	eb 28                	jmp    adf <peek+0x3f>
     ab7:	89 f6                	mov    %esi,%esi
     ab9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    s++;
     ac0:	83 c3 01             	add    $0x1,%ebx
peek(char **ps, char *es, char *toks)
{
  char *s;

  s = *ps;
  while(s < es && strchr(whitespace, *s))
     ac3:	39 de                	cmp    %ebx,%esi
     ac5:	74 18                	je     adf <peek+0x3f>
     ac7:	0f be 03             	movsbl (%ebx),%eax
     aca:	83 ec 08             	sub    $0x8,%esp
     acd:	50                   	push   %eax
     ace:	68 14 1f 00 00       	push   $0x1f14
     ad3:	e8 18 06 00 00       	call   10f0 <strchr>
     ad8:	83 c4 10             	add    $0x10,%esp
     adb:	85 c0                	test   %eax,%eax
     add:	75 e1                	jne    ac0 <peek+0x20>
    s++;
  *ps = s;
     adf:	89 1f                	mov    %ebx,(%edi)
  return *s && strchr(toks, *s);
     ae1:	0f be 13             	movsbl (%ebx),%edx
     ae4:	31 c0                	xor    %eax,%eax
     ae6:	84 d2                	test   %dl,%dl
     ae8:	74 17                	je     b01 <peek+0x61>
     aea:	83 ec 08             	sub    $0x8,%esp
     aed:	52                   	push   %edx
     aee:	ff 75 10             	pushl  0x10(%ebp)
     af1:	e8 fa 05 00 00       	call   10f0 <strchr>
     af6:	83 c4 10             	add    $0x10,%esp
     af9:	85 c0                	test   %eax,%eax
     afb:	0f 95 c0             	setne  %al
     afe:	0f b6 c0             	movzbl %al,%eax
}
     b01:	8d 65 f4             	lea    -0xc(%ebp),%esp
     b04:	5b                   	pop    %ebx
     b05:	5e                   	pop    %esi
     b06:	5f                   	pop    %edi
     b07:	5d                   	pop    %ebp
     b08:	c3                   	ret    
     b09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000b10 <parseredirs>:
  return cmd;
}

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
     b10:	55                   	push   %ebp
     b11:	89 e5                	mov    %esp,%ebp
     b13:	57                   	push   %edi
     b14:	56                   	push   %esi
     b15:	53                   	push   %ebx
     b16:	83 ec 1c             	sub    $0x1c,%esp
     b19:	8b 75 0c             	mov    0xc(%ebp),%esi
     b1c:	8b 5d 10             	mov    0x10(%ebp),%ebx
     b1f:	90                   	nop
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     b20:	83 ec 04             	sub    $0x4,%esp
     b23:	68 6e 17 00 00       	push   $0x176e
     b28:	53                   	push   %ebx
     b29:	56                   	push   %esi
     b2a:	e8 71 ff ff ff       	call   aa0 <peek>
     b2f:	83 c4 10             	add    $0x10,%esp
     b32:	85 c0                	test   %eax,%eax
     b34:	74 6a                	je     ba0 <parseredirs+0x90>
    tok = gettoken(ps, es, 0, 0);
     b36:	6a 00                	push   $0x0
     b38:	6a 00                	push   $0x0
     b3a:	53                   	push   %ebx
     b3b:	56                   	push   %esi
     b3c:	e8 ef fd ff ff       	call   930 <gettoken>
     b41:	89 c7                	mov    %eax,%edi
    if(gettoken(ps, es, &q, &eq) != 'a')
     b43:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     b46:	50                   	push   %eax
     b47:	8d 45 e0             	lea    -0x20(%ebp),%eax
     b4a:	50                   	push   %eax
     b4b:	53                   	push   %ebx
     b4c:	56                   	push   %esi
     b4d:	e8 de fd ff ff       	call   930 <gettoken>
     b52:	83 c4 20             	add    $0x20,%esp
     b55:	83 f8 61             	cmp    $0x61,%eax
     b58:	75 51                	jne    bab <parseredirs+0x9b>
      panic("missing file for redirection");
    switch(tok){
     b5a:	83 ff 3c             	cmp    $0x3c,%edi
     b5d:	74 31                	je     b90 <parseredirs+0x80>
     b5f:	83 ff 3e             	cmp    $0x3e,%edi
     b62:	74 05                	je     b69 <parseredirs+0x59>
     b64:	83 ff 2b             	cmp    $0x2b,%edi
     b67:	75 b7                	jne    b20 <parseredirs+0x10>
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     b69:	83 ec 0c             	sub    $0xc,%esp
     b6c:	6a 01                	push   $0x1
     b6e:	68 01 02 00 00       	push   $0x201
     b73:	ff 75 e4             	pushl  -0x1c(%ebp)
     b76:	ff 75 e0             	pushl  -0x20(%ebp)
     b79:	ff 75 08             	pushl  0x8(%ebp)
     b7c:	e8 af fc ff ff       	call   830 <redircmd>
      break;
     b81:	83 c4 20             	add    $0x20,%esp
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     b84:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
     b87:	eb 97                	jmp    b20 <parseredirs+0x10>
     b89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    tok = gettoken(ps, es, 0, 0);
    if(gettoken(ps, es, &q, &eq) != 'a')
      panic("missing file for redirection");
    switch(tok){
    case '<':
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     b90:	83 ec 0c             	sub    $0xc,%esp
     b93:	6a 00                	push   $0x0
     b95:	6a 00                	push   $0x0
     b97:	eb da                	jmp    b73 <parseredirs+0x63>
     b99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    }
  }
  return cmd;
}
     ba0:	8b 45 08             	mov    0x8(%ebp),%eax
     ba3:	8d 65 f4             	lea    -0xc(%ebp),%esp
     ba6:	5b                   	pop    %ebx
     ba7:	5e                   	pop    %esi
     ba8:	5f                   	pop    %edi
     ba9:	5d                   	pop    %ebp
     baa:	c3                   	ret    
  char *q, *eq;

  while(peek(ps, es, "<>")){
    tok = gettoken(ps, es, 0, 0);
    if(gettoken(ps, es, &q, &eq) != 'a')
      panic("missing file for redirection");
     bab:	83 ec 0c             	sub    $0xc,%esp
     bae:	68 51 17 00 00       	push   $0x1751
     bb3:	e8 58 fa ff ff       	call   610 <panic>
     bb8:	90                   	nop
     bb9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000bc0 <parseexec>:
  return cmd;
}

struct cmd*
parseexec(char **ps, char *es)
{
     bc0:	55                   	push   %ebp
     bc1:	89 e5                	mov    %esp,%ebp
     bc3:	57                   	push   %edi
     bc4:	56                   	push   %esi
     bc5:	53                   	push   %ebx
     bc6:	83 ec 30             	sub    $0x30,%esp
     bc9:	8b 75 08             	mov    0x8(%ebp),%esi
     bcc:	8b 7d 0c             	mov    0xc(%ebp),%edi
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
     bcf:	68 71 17 00 00       	push   $0x1771
     bd4:	57                   	push   %edi
     bd5:	56                   	push   %esi
     bd6:	e8 c5 fe ff ff       	call   aa0 <peek>
     bdb:	83 c4 10             	add    $0x10,%esp
     bde:	85 c0                	test   %eax,%eax
     be0:	0f 85 9a 00 00 00    	jne    c80 <parseexec+0xc0>
    return parseblock(ps, es);

  ret = execcmd();
     be6:	e8 15 fc ff ff       	call   800 <execcmd>
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
     beb:	83 ec 04             	sub    $0x4,%esp
  struct cmd *ret;

  if(peek(ps, es, "("))
    return parseblock(ps, es);

  ret = execcmd();
     bee:	89 c3                	mov    %eax,%ebx
     bf0:	89 45 cc             	mov    %eax,-0x34(%ebp)
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
     bf3:	57                   	push   %edi
     bf4:	56                   	push   %esi
     bf5:	8d 5b 04             	lea    0x4(%ebx),%ebx
     bf8:	50                   	push   %eax
     bf9:	e8 12 ff ff ff       	call   b10 <parseredirs>
     bfe:	83 c4 10             	add    $0x10,%esp
     c01:	89 45 d0             	mov    %eax,-0x30(%ebp)
    return parseblock(ps, es);

  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
     c04:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
     c0b:	eb 16                	jmp    c23 <parseexec+0x63>
     c0d:	8d 76 00             	lea    0x0(%esi),%esi
    cmd->argv[argc] = q;
    cmd->eargv[argc] = eq;
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
     c10:	83 ec 04             	sub    $0x4,%esp
     c13:	57                   	push   %edi
     c14:	56                   	push   %esi
     c15:	ff 75 d0             	pushl  -0x30(%ebp)
     c18:	e8 f3 fe ff ff       	call   b10 <parseredirs>
     c1d:	83 c4 10             	add    $0x10,%esp
     c20:	89 45 d0             	mov    %eax,-0x30(%ebp)
  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
  while(!peek(ps, es, "|)&;")){
     c23:	83 ec 04             	sub    $0x4,%esp
     c26:	68 88 17 00 00       	push   $0x1788
     c2b:	57                   	push   %edi
     c2c:	56                   	push   %esi
     c2d:	e8 6e fe ff ff       	call   aa0 <peek>
     c32:	83 c4 10             	add    $0x10,%esp
     c35:	85 c0                	test   %eax,%eax
     c37:	75 5f                	jne    c98 <parseexec+0xd8>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
     c39:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     c3c:	50                   	push   %eax
     c3d:	8d 45 e0             	lea    -0x20(%ebp),%eax
     c40:	50                   	push   %eax
     c41:	57                   	push   %edi
     c42:	56                   	push   %esi
     c43:	e8 e8 fc ff ff       	call   930 <gettoken>
     c48:	83 c4 10             	add    $0x10,%esp
     c4b:	85 c0                	test   %eax,%eax
     c4d:	74 49                	je     c98 <parseexec+0xd8>
      break;
    if(tok != 'a')
     c4f:	83 f8 61             	cmp    $0x61,%eax
     c52:	75 66                	jne    cba <parseexec+0xfa>
      panic("syntax");
    cmd->argv[argc] = q;
     c54:	8b 45 e0             	mov    -0x20(%ebp),%eax
    cmd->eargv[argc] = eq;
    argc++;
     c57:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
     c5b:	83 c3 04             	add    $0x4,%ebx
  while(!peek(ps, es, "|)&;")){
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
      break;
    if(tok != 'a')
      panic("syntax");
    cmd->argv[argc] = q;
     c5e:	89 43 fc             	mov    %eax,-0x4(%ebx)
    cmd->eargv[argc] = eq;
     c61:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     c64:	89 43 24             	mov    %eax,0x24(%ebx)
    argc++;
     c67:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    if(argc >= MAXARGS)
     c6a:	83 f8 0a             	cmp    $0xa,%eax
     c6d:	75 a1                	jne    c10 <parseexec+0x50>
      panic("too many args");
     c6f:	83 ec 0c             	sub    $0xc,%esp
     c72:	68 7a 17 00 00       	push   $0x177a
     c77:	e8 94 f9 ff ff       	call   610 <panic>
     c7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
    return parseblock(ps, es);
     c80:	83 ec 08             	sub    $0x8,%esp
     c83:	57                   	push   %edi
     c84:	56                   	push   %esi
     c85:	e8 56 01 00 00       	call   de0 <parseblock>
     c8a:	83 c4 10             	add    $0x10,%esp
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
  cmd->eargv[argc] = 0;
  return ret;
}
     c8d:	8d 65 f4             	lea    -0xc(%ebp),%esp
     c90:	5b                   	pop    %ebx
     c91:	5e                   	pop    %esi
     c92:	5f                   	pop    %edi
     c93:	5d                   	pop    %ebp
     c94:	c3                   	ret    
     c95:	8d 76 00             	lea    0x0(%esi),%esi
     c98:	8b 45 cc             	mov    -0x34(%ebp),%eax
     c9b:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     c9e:	8d 04 90             	lea    (%eax,%edx,4),%eax
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
     ca1:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
  cmd->eargv[argc] = 0;
     ca8:	c7 40 2c 00 00 00 00 	movl   $0x0,0x2c(%eax)
     caf:	8b 45 d0             	mov    -0x30(%ebp),%eax
  return ret;
}
     cb2:	8d 65 f4             	lea    -0xc(%ebp),%esp
     cb5:	5b                   	pop    %ebx
     cb6:	5e                   	pop    %esi
     cb7:	5f                   	pop    %edi
     cb8:	5d                   	pop    %ebp
     cb9:	c3                   	ret    
  ret = parseredirs(ret, ps, es);
  while(!peek(ps, es, "|)&;")){
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
      break;
    if(tok != 'a')
      panic("syntax");
     cba:	83 ec 0c             	sub    $0xc,%esp
     cbd:	68 73 17 00 00       	push   $0x1773
     cc2:	e8 49 f9 ff ff       	call   610 <panic>
     cc7:	89 f6                	mov    %esi,%esi
     cc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000cd0 <parsepipe>:
  return cmd;
}

struct cmd*
parsepipe(char **ps, char *es)
{
     cd0:	55                   	push   %ebp
     cd1:	89 e5                	mov    %esp,%ebp
     cd3:	57                   	push   %edi
     cd4:	56                   	push   %esi
     cd5:	53                   	push   %ebx
     cd6:	83 ec 14             	sub    $0x14,%esp
     cd9:	8b 5d 08             	mov    0x8(%ebp),%ebx
     cdc:	8b 75 0c             	mov    0xc(%ebp),%esi
  struct cmd *cmd;

  cmd = parseexec(ps, es);
     cdf:	56                   	push   %esi
     ce0:	53                   	push   %ebx
     ce1:	e8 da fe ff ff       	call   bc0 <parseexec>
  if(peek(ps, es, "|")){
     ce6:	83 c4 0c             	add    $0xc,%esp
struct cmd*
parsepipe(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parseexec(ps, es);
     ce9:	89 c7                	mov    %eax,%edi
  if(peek(ps, es, "|")){
     ceb:	68 8d 17 00 00       	push   $0x178d
     cf0:	56                   	push   %esi
     cf1:	53                   	push   %ebx
     cf2:	e8 a9 fd ff ff       	call   aa0 <peek>
     cf7:	83 c4 10             	add    $0x10,%esp
     cfa:	85 c0                	test   %eax,%eax
     cfc:	75 12                	jne    d10 <parsepipe+0x40>
    gettoken(ps, es, 0, 0);
    cmd = pipecmd(cmd, parsepipe(ps, es));
  }
  return cmd;
}
     cfe:	8d 65 f4             	lea    -0xc(%ebp),%esp
     d01:	89 f8                	mov    %edi,%eax
     d03:	5b                   	pop    %ebx
     d04:	5e                   	pop    %esi
     d05:	5f                   	pop    %edi
     d06:	5d                   	pop    %ebp
     d07:	c3                   	ret    
     d08:	90                   	nop
     d09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
{
  struct cmd *cmd;

  cmd = parseexec(ps, es);
  if(peek(ps, es, "|")){
    gettoken(ps, es, 0, 0);
     d10:	6a 00                	push   $0x0
     d12:	6a 00                	push   $0x0
     d14:	56                   	push   %esi
     d15:	53                   	push   %ebx
     d16:	e8 15 fc ff ff       	call   930 <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
     d1b:	58                   	pop    %eax
     d1c:	5a                   	pop    %edx
     d1d:	56                   	push   %esi
     d1e:	53                   	push   %ebx
     d1f:	e8 ac ff ff ff       	call   cd0 <parsepipe>
     d24:	89 7d 08             	mov    %edi,0x8(%ebp)
     d27:	89 45 0c             	mov    %eax,0xc(%ebp)
     d2a:	83 c4 10             	add    $0x10,%esp
  }
  return cmd;
}
     d2d:	8d 65 f4             	lea    -0xc(%ebp),%esp
     d30:	5b                   	pop    %ebx
     d31:	5e                   	pop    %esi
     d32:	5f                   	pop    %edi
     d33:	5d                   	pop    %ebp
  struct cmd *cmd;

  cmd = parseexec(ps, es);
  if(peek(ps, es, "|")){
    gettoken(ps, es, 0, 0);
    cmd = pipecmd(cmd, parsepipe(ps, es));
     d34:	e9 47 fb ff ff       	jmp    880 <pipecmd>
     d39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000d40 <parseline>:
  return cmd;
}

struct cmd*
parseline(char **ps, char *es)
{
     d40:	55                   	push   %ebp
     d41:	89 e5                	mov    %esp,%ebp
     d43:	57                   	push   %edi
     d44:	56                   	push   %esi
     d45:	53                   	push   %ebx
     d46:	83 ec 14             	sub    $0x14,%esp
     d49:	8b 5d 08             	mov    0x8(%ebp),%ebx
     d4c:	8b 75 0c             	mov    0xc(%ebp),%esi
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
     d4f:	56                   	push   %esi
     d50:	53                   	push   %ebx
     d51:	e8 7a ff ff ff       	call   cd0 <parsepipe>
  while(peek(ps, es, "&")){
     d56:	83 c4 10             	add    $0x10,%esp
struct cmd*
parseline(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
     d59:	89 c7                	mov    %eax,%edi
  while(peek(ps, es, "&")){
     d5b:	eb 1b                	jmp    d78 <parseline+0x38>
     d5d:	8d 76 00             	lea    0x0(%esi),%esi
    gettoken(ps, es, 0, 0);
     d60:	6a 00                	push   $0x0
     d62:	6a 00                	push   $0x0
     d64:	56                   	push   %esi
     d65:	53                   	push   %ebx
     d66:	e8 c5 fb ff ff       	call   930 <gettoken>
    cmd = backcmd(cmd);
     d6b:	89 3c 24             	mov    %edi,(%esp)
     d6e:	e8 8d fb ff ff       	call   900 <backcmd>
     d73:	83 c4 10             	add    $0x10,%esp
     d76:	89 c7                	mov    %eax,%edi
parseline(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
  while(peek(ps, es, "&")){
     d78:	83 ec 04             	sub    $0x4,%esp
     d7b:	68 8f 17 00 00       	push   $0x178f
     d80:	56                   	push   %esi
     d81:	53                   	push   %ebx
     d82:	e8 19 fd ff ff       	call   aa0 <peek>
     d87:	83 c4 10             	add    $0x10,%esp
     d8a:	85 c0                	test   %eax,%eax
     d8c:	75 d2                	jne    d60 <parseline+0x20>
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";")){
     d8e:	83 ec 04             	sub    $0x4,%esp
     d91:	68 8b 17 00 00       	push   $0x178b
     d96:	56                   	push   %esi
     d97:	53                   	push   %ebx
     d98:	e8 03 fd ff ff       	call   aa0 <peek>
     d9d:	83 c4 10             	add    $0x10,%esp
     da0:	85 c0                	test   %eax,%eax
     da2:	75 0c                	jne    db0 <parseline+0x70>
    gettoken(ps, es, 0, 0);
    cmd = listcmd(cmd, parseline(ps, es));
  }
  return cmd;
}
     da4:	8d 65 f4             	lea    -0xc(%ebp),%esp
     da7:	89 f8                	mov    %edi,%eax
     da9:	5b                   	pop    %ebx
     daa:	5e                   	pop    %esi
     dab:	5f                   	pop    %edi
     dac:	5d                   	pop    %ebp
     dad:	c3                   	ret    
     dae:	66 90                	xchg   %ax,%ax
  while(peek(ps, es, "&")){
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";")){
    gettoken(ps, es, 0, 0);
     db0:	6a 00                	push   $0x0
     db2:	6a 00                	push   $0x0
     db4:	56                   	push   %esi
     db5:	53                   	push   %ebx
     db6:	e8 75 fb ff ff       	call   930 <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
     dbb:	58                   	pop    %eax
     dbc:	5a                   	pop    %edx
     dbd:	56                   	push   %esi
     dbe:	53                   	push   %ebx
     dbf:	e8 7c ff ff ff       	call   d40 <parseline>
     dc4:	89 7d 08             	mov    %edi,0x8(%ebp)
     dc7:	89 45 0c             	mov    %eax,0xc(%ebp)
     dca:	83 c4 10             	add    $0x10,%esp
  }
  return cmd;
}
     dcd:	8d 65 f4             	lea    -0xc(%ebp),%esp
     dd0:	5b                   	pop    %ebx
     dd1:	5e                   	pop    %esi
     dd2:	5f                   	pop    %edi
     dd3:	5d                   	pop    %ebp
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";")){
    gettoken(ps, es, 0, 0);
    cmd = listcmd(cmd, parseline(ps, es));
     dd4:	e9 e7 fa ff ff       	jmp    8c0 <listcmd>
     dd9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000de0 <parseblock>:
  return cmd;
}

struct cmd*
parseblock(char **ps, char *es)
{
     de0:	55                   	push   %ebp
     de1:	89 e5                	mov    %esp,%ebp
     de3:	57                   	push   %edi
     de4:	56                   	push   %esi
     de5:	53                   	push   %ebx
     de6:	83 ec 10             	sub    $0x10,%esp
     de9:	8b 5d 08             	mov    0x8(%ebp),%ebx
     dec:	8b 75 0c             	mov    0xc(%ebp),%esi
  struct cmd *cmd;

  if(!peek(ps, es, "("))
     def:	68 71 17 00 00       	push   $0x1771
     df4:	56                   	push   %esi
     df5:	53                   	push   %ebx
     df6:	e8 a5 fc ff ff       	call   aa0 <peek>
     dfb:	83 c4 10             	add    $0x10,%esp
     dfe:	85 c0                	test   %eax,%eax
     e00:	74 4a                	je     e4c <parseblock+0x6c>
    panic("parseblock");
  gettoken(ps, es, 0, 0);
     e02:	6a 00                	push   $0x0
     e04:	6a 00                	push   $0x0
     e06:	56                   	push   %esi
     e07:	53                   	push   %ebx
     e08:	e8 23 fb ff ff       	call   930 <gettoken>
  cmd = parseline(ps, es);
     e0d:	58                   	pop    %eax
     e0e:	5a                   	pop    %edx
     e0f:	56                   	push   %esi
     e10:	53                   	push   %ebx
     e11:	e8 2a ff ff ff       	call   d40 <parseline>
  if(!peek(ps, es, ")"))
     e16:	83 c4 0c             	add    $0xc,%esp
  struct cmd *cmd;

  if(!peek(ps, es, "("))
    panic("parseblock");
  gettoken(ps, es, 0, 0);
  cmd = parseline(ps, es);
     e19:	89 c7                	mov    %eax,%edi
  if(!peek(ps, es, ")"))
     e1b:	68 ad 17 00 00       	push   $0x17ad
     e20:	56                   	push   %esi
     e21:	53                   	push   %ebx
     e22:	e8 79 fc ff ff       	call   aa0 <peek>
     e27:	83 c4 10             	add    $0x10,%esp
     e2a:	85 c0                	test   %eax,%eax
     e2c:	74 2b                	je     e59 <parseblock+0x79>
    panic("syntax - missing )");
  gettoken(ps, es, 0, 0);
     e2e:	6a 00                	push   $0x0
     e30:	6a 00                	push   $0x0
     e32:	56                   	push   %esi
     e33:	53                   	push   %ebx
     e34:	e8 f7 fa ff ff       	call   930 <gettoken>
  cmd = parseredirs(cmd, ps, es);
     e39:	83 c4 0c             	add    $0xc,%esp
     e3c:	56                   	push   %esi
     e3d:	53                   	push   %ebx
     e3e:	57                   	push   %edi
     e3f:	e8 cc fc ff ff       	call   b10 <parseredirs>
  return cmd;
}
     e44:	8d 65 f4             	lea    -0xc(%ebp),%esp
     e47:	5b                   	pop    %ebx
     e48:	5e                   	pop    %esi
     e49:	5f                   	pop    %edi
     e4a:	5d                   	pop    %ebp
     e4b:	c3                   	ret    
parseblock(char **ps, char *es)
{
  struct cmd *cmd;

  if(!peek(ps, es, "("))
    panic("parseblock");
     e4c:	83 ec 0c             	sub    $0xc,%esp
     e4f:	68 91 17 00 00       	push   $0x1791
     e54:	e8 b7 f7 ff ff       	call   610 <panic>
  gettoken(ps, es, 0, 0);
  cmd = parseline(ps, es);
  if(!peek(ps, es, ")"))
    panic("syntax - missing )");
     e59:	83 ec 0c             	sub    $0xc,%esp
     e5c:	68 9c 17 00 00       	push   $0x179c
     e61:	e8 aa f7 ff ff       	call   610 <panic>
     e66:	8d 76 00             	lea    0x0(%esi),%esi
     e69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000e70 <nulterminate>:
}

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
     e70:	55                   	push   %ebp
     e71:	89 e5                	mov    %esp,%ebp
     e73:	53                   	push   %ebx
     e74:	83 ec 04             	sub    $0x4,%esp
     e77:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     e7a:	85 db                	test   %ebx,%ebx
     e7c:	0f 84 96 00 00 00    	je     f18 <nulterminate+0xa8>
    return 0;

  switch(cmd->type){
     e82:	83 3b 05             	cmpl   $0x5,(%ebx)
     e85:	77 48                	ja     ecf <nulterminate+0x5f>
     e87:	8b 03                	mov    (%ebx),%eax
     e89:	ff 24 85 fc 17 00 00 	jmp    *0x17fc(,%eax,4)
    nulterminate(pcmd->right);
    break;

  case LIST:
    lcmd = (struct listcmd*)cmd;
    nulterminate(lcmd->left);
     e90:	83 ec 0c             	sub    $0xc,%esp
     e93:	ff 73 04             	pushl  0x4(%ebx)
     e96:	e8 d5 ff ff ff       	call   e70 <nulterminate>
    nulterminate(lcmd->right);
     e9b:	58                   	pop    %eax
     e9c:	ff 73 08             	pushl  0x8(%ebx)
     e9f:	e8 cc ff ff ff       	call   e70 <nulterminate>
    break;
     ea4:	83 c4 10             	add    $0x10,%esp
     ea7:	89 d8                	mov    %ebx,%eax
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     ea9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     eac:	c9                   	leave  
     ead:	c3                   	ret    
     eae:	66 90                	xchg   %ax,%ax
    return 0;

  switch(cmd->type){
  case EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
     eb0:	8b 4b 04             	mov    0x4(%ebx),%ecx
     eb3:	8d 43 2c             	lea    0x2c(%ebx),%eax
     eb6:	85 c9                	test   %ecx,%ecx
     eb8:	74 15                	je     ecf <nulterminate+0x5f>
     eba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      *ecmd->eargv[i] = 0;
     ec0:	8b 10                	mov    (%eax),%edx
     ec2:	83 c0 04             	add    $0x4,%eax
     ec5:	c6 02 00             	movb   $0x0,(%edx)
    return 0;

  switch(cmd->type){
  case EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
     ec8:	8b 50 d8             	mov    -0x28(%eax),%edx
     ecb:	85 d2                	test   %edx,%edx
     ecd:	75 f1                	jne    ec0 <nulterminate+0x50>
  struct redircmd *rcmd;

  if(cmd == 0)
    return 0;

  switch(cmd->type){
     ecf:	89 d8                	mov    %ebx,%eax
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
    nulterminate(lcmd->right);
    break;

  case BACK:
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
     ee0:	83 ec 0c             	sub    $0xc,%esp
     ee3:	ff 73 04             	pushl  0x4(%ebx)
     ee6:	e8 85 ff ff ff       	call   e70 <nulterminate>
    break;
     eeb:	89 d8                	mov    %ebx,%eax
     eed:	83 c4 10             	add    $0x10,%esp
  }
  return cmd;
}
     ef0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     ef3:	c9                   	leave  
     ef4:	c3                   	ret    
     ef5:	8d 76 00             	lea    0x0(%esi),%esi
      *ecmd->eargv[i] = 0;
    break;

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    nulterminate(rcmd->cmd);
     ef8:	83 ec 0c             	sub    $0xc,%esp
     efb:	ff 73 04             	pushl  0x4(%ebx)
     efe:	e8 6d ff ff ff       	call   e70 <nulterminate>
    *rcmd->efile = 0;
     f03:	8b 43 0c             	mov    0xc(%ebx),%eax
    break;
     f06:	83 c4 10             	add    $0x10,%esp
    break;

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    nulterminate(rcmd->cmd);
    *rcmd->efile = 0;
     f09:	c6 00 00             	movb   $0x0,(%eax)
    break;
     f0c:	89 d8                	mov    %ebx,%eax
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     f0e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     f11:	c9                   	leave  
     f12:	c3                   	ret    
     f13:	90                   	nop
     f14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
    return 0;
     f18:	31 c0                	xor    %eax,%eax
     f1a:	eb 8d                	jmp    ea9 <nulterminate+0x39>
     f1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000f20 <parsecmd>:
struct cmd *parseexec(char**, char*);
struct cmd *nulterminate(struct cmd*);

struct cmd*
parsecmd(char *s)
{
     f20:	55                   	push   %ebp
     f21:	89 e5                	mov    %esp,%ebp
     f23:	56                   	push   %esi
     f24:	53                   	push   %ebx
  char *es;
  struct cmd *cmd;

  es = s + strlen(s);
     f25:	8b 5d 08             	mov    0x8(%ebp),%ebx
     f28:	83 ec 0c             	sub    $0xc,%esp
     f2b:	53                   	push   %ebx
     f2c:	e8 6f 01 00 00       	call   10a0 <strlen>
  cmd = parseline(&s, es);
     f31:	59                   	pop    %ecx
parsecmd(char *s)
{
  char *es;
  struct cmd *cmd;

  es = s + strlen(s);
     f32:	01 c3                	add    %eax,%ebx
  cmd = parseline(&s, es);
     f34:	8d 45 08             	lea    0x8(%ebp),%eax
     f37:	5e                   	pop    %esi
     f38:	53                   	push   %ebx
     f39:	50                   	push   %eax
     f3a:	e8 01 fe ff ff       	call   d40 <parseline>
     f3f:	89 c6                	mov    %eax,%esi
  peek(&s, es, "");
     f41:	8d 45 08             	lea    0x8(%ebp),%eax
     f44:	83 c4 0c             	add    $0xc,%esp
     f47:	68 36 17 00 00       	push   $0x1736
     f4c:	53                   	push   %ebx
     f4d:	50                   	push   %eax
     f4e:	e8 4d fb ff ff       	call   aa0 <peek>
  if(s != es){
     f53:	8b 45 08             	mov    0x8(%ebp),%eax
     f56:	83 c4 10             	add    $0x10,%esp
     f59:	39 c3                	cmp    %eax,%ebx
     f5b:	75 12                	jne    f6f <parsecmd+0x4f>
    printf(2, "leftovers: %s\n", s);
    panic("syntax");
  }
  nulterminate(cmd);
     f5d:	83 ec 0c             	sub    $0xc,%esp
     f60:	56                   	push   %esi
     f61:	e8 0a ff ff ff       	call   e70 <nulterminate>
  return cmd;
}
     f66:	8d 65 f8             	lea    -0x8(%ebp),%esp
     f69:	89 f0                	mov    %esi,%eax
     f6b:	5b                   	pop    %ebx
     f6c:	5e                   	pop    %esi
     f6d:	5d                   	pop    %ebp
     f6e:	c3                   	ret    

  es = s + strlen(s);
  cmd = parseline(&s, es);
  peek(&s, es, "");
  if(s != es){
    printf(2, "leftovers: %s\n", s);
     f6f:	52                   	push   %edx
     f70:	50                   	push   %eax
     f71:	68 af 17 00 00       	push   $0x17af
     f76:	6a 02                	push   $0x2
     f78:	e8 63 04 00 00       	call   13e0 <printf>
    panic("syntax");
     f7d:	c7 04 24 73 17 00 00 	movl   $0x1773,(%esp)
     f84:	e8 87 f6 ff ff       	call   610 <panic>
     f89:	66 90                	xchg   %ax,%ax
     f8b:	66 90                	xchg   %ax,%ax
     f8d:	66 90                	xchg   %ax,%ax
     f8f:	90                   	nop

00000f90 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
     f90:	55                   	push   %ebp
     f91:	89 e5                	mov    %esp,%ebp
     f93:	53                   	push   %ebx
     f94:	8b 45 08             	mov    0x8(%ebp),%eax
     f97:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     f9a:	89 c2                	mov    %eax,%edx
     f9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     fa0:	83 c1 01             	add    $0x1,%ecx
     fa3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
     fa7:	83 c2 01             	add    $0x1,%edx
     faa:	84 db                	test   %bl,%bl
     fac:	88 5a ff             	mov    %bl,-0x1(%edx)
     faf:	75 ef                	jne    fa0 <strcpy+0x10>
    ;
  return os;
}
     fb1:	5b                   	pop    %ebx
     fb2:	5d                   	pop    %ebp
     fb3:	c3                   	ret    
     fb4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     fba:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000fc0 <strncpy>:

char* strncpy(char* s, char* t, int n) {
     fc0:	55                   	push   %ebp
  int i = 0;
     fc1:	31 d2                	xor    %edx,%edx
  while((*s++ = *t++) != 0)
    ;
  return os;
}

char* strncpy(char* s, char* t, int n) {
     fc3:	89 e5                	mov    %esp,%ebp
     fc5:	56                   	push   %esi
     fc6:	53                   	push   %ebx
     fc7:	8b 45 08             	mov    0x8(%ebp),%eax
     fca:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     fcd:	8b 75 10             	mov    0x10(%ebp),%esi
  int i = 0;
  char *os;
  os = s;
  while(((*s++ = *t++) != 0) && (++i < n));
     fd0:	eb 0d                	jmp    fdf <strncpy+0x1f>
     fd2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     fd8:	83 c2 01             	add    $0x1,%edx
     fdb:	39 f2                	cmp    %esi,%edx
     fdd:	7d 0b                	jge    fea <strncpy+0x2a>
     fdf:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
     fe3:	84 c9                	test   %cl,%cl
     fe5:	88 0c 10             	mov    %cl,(%eax,%edx,1)
     fe8:	75 ee                	jne    fd8 <strncpy+0x18>
  return os;
}
     fea:	5b                   	pop    %ebx
     feb:	5e                   	pop    %esi
     fec:	5d                   	pop    %ebp
     fed:	c3                   	ret    
     fee:	66 90                	xchg   %ax,%ax

00000ff0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     ff0:	55                   	push   %ebp
     ff1:	89 e5                	mov    %esp,%ebp
     ff3:	56                   	push   %esi
     ff4:	53                   	push   %ebx
     ff5:	8b 55 08             	mov    0x8(%ebp),%edx
     ff8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
     ffb:	0f b6 02             	movzbl (%edx),%eax
     ffe:	0f b6 19             	movzbl (%ecx),%ebx
    1001:	84 c0                	test   %al,%al
    1003:	75 1e                	jne    1023 <strcmp+0x33>
    1005:	eb 29                	jmp    1030 <strcmp+0x40>
    1007:	89 f6                	mov    %esi,%esi
    1009:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
    1010:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    1013:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    1016:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    1019:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
    101d:	84 c0                	test   %al,%al
    101f:	74 0f                	je     1030 <strcmp+0x40>
    1021:	89 f1                	mov    %esi,%ecx
    1023:	38 d8                	cmp    %bl,%al
    1025:	74 e9                	je     1010 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    1027:	29 d8                	sub    %ebx,%eax
}
    1029:	5b                   	pop    %ebx
    102a:	5e                   	pop    %esi
    102b:	5d                   	pop    %ebp
    102c:	c3                   	ret    
    102d:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    1030:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
    1032:	29 d8                	sub    %ebx,%eax
}
    1034:	5b                   	pop    %ebx
    1035:	5e                   	pop    %esi
    1036:	5d                   	pop    %ebp
    1037:	c3                   	ret    
    1038:	90                   	nop
    1039:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001040 <strncmp>:

int strncmp(const char *p, const char *q, int n) {
    1040:	55                   	push   %ebp
    1041:	89 e5                	mov    %esp,%ebp
    1043:	57                   	push   %edi
    1044:	56                   	push   %esi
    1045:	53                   	push   %ebx
    1046:	8b 5d 10             	mov    0x10(%ebp),%ebx
    1049:	8b 75 08             	mov    0x8(%ebp),%esi
    104c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  int i = 0;
  while(i < n && *p == *q)
    104f:	85 db                	test   %ebx,%ebx
    1051:	7e 28                	jle    107b <strncmp+0x3b>
    1053:	0f b6 16             	movzbl (%esi),%edx
    1056:	0f b6 0f             	movzbl (%edi),%ecx
    1059:	38 d1                	cmp    %dl,%cl
    105b:	75 2b                	jne    1088 <strncmp+0x48>
    105d:	31 c0                	xor    %eax,%eax
    105f:	eb 13                	jmp    1074 <strncmp+0x34>
    1061:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1068:	0f b6 14 06          	movzbl (%esi,%eax,1),%edx
    106c:	0f b6 0c 07          	movzbl (%edi,%eax,1),%ecx
    1070:	38 ca                	cmp    %cl,%dl
    1072:	75 14                	jne    1088 <strncmp+0x48>
    p++, q++, i++;
    1074:	83 c0 01             	add    $0x1,%eax
  return (uchar)*p - (uchar)*q;
}

int strncmp(const char *p, const char *q, int n) {
  int i = 0;
  while(i < n && *p == *q)
    1077:	39 c3                	cmp    %eax,%ebx
    1079:	75 ed                	jne    1068 <strncmp+0x28>
    p++, q++, i++;
  if (i < n)
    return (uchar)*p - (uchar)*q;
  else
    return 0;
}
    107b:	5b                   	pop    %ebx
  while(i < n && *p == *q)
    p++, q++, i++;
  if (i < n)
    return (uchar)*p - (uchar)*q;
  else
    return 0;
    107c:	31 c0                	xor    %eax,%eax
}
    107e:	5e                   	pop    %esi
    107f:	5f                   	pop    %edi
    1080:	5d                   	pop    %ebp
    1081:	c3                   	ret    
    1082:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
int strncmp(const char *p, const char *q, int n) {
  int i = 0;
  while(i < n && *p == *q)
    p++, q++, i++;
  if (i < n)
    return (uchar)*p - (uchar)*q;
    1088:	0f b6 c2             	movzbl %dl,%eax
  else
    return 0;
}
    108b:	5b                   	pop    %ebx
int strncmp(const char *p, const char *q, int n) {
  int i = 0;
  while(i < n && *p == *q)
    p++, q++, i++;
  if (i < n)
    return (uchar)*p - (uchar)*q;
    108c:	29 c8                	sub    %ecx,%eax
  else
    return 0;
}
    108e:	5e                   	pop    %esi
    108f:	5f                   	pop    %edi
    1090:	5d                   	pop    %ebp
    1091:	c3                   	ret    
    1092:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1099:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000010a0 <strlen>:

uint
strlen(char *s)
{
    10a0:	55                   	push   %ebp
    10a1:	89 e5                	mov    %esp,%ebp
    10a3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    10a6:	80 39 00             	cmpb   $0x0,(%ecx)
    10a9:	74 12                	je     10bd <strlen+0x1d>
    10ab:	31 d2                	xor    %edx,%edx
    10ad:	8d 76 00             	lea    0x0(%esi),%esi
    10b0:	83 c2 01             	add    $0x1,%edx
    10b3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    10b7:	89 d0                	mov    %edx,%eax
    10b9:	75 f5                	jne    10b0 <strlen+0x10>
    ;
  return n;
}
    10bb:	5d                   	pop    %ebp
    10bc:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
    10bd:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
    10bf:	5d                   	pop    %ebp
    10c0:	c3                   	ret    
    10c1:	eb 0d                	jmp    10d0 <memset>
    10c3:	90                   	nop
    10c4:	90                   	nop
    10c5:	90                   	nop
    10c6:	90                   	nop
    10c7:	90                   	nop
    10c8:	90                   	nop
    10c9:	90                   	nop
    10ca:	90                   	nop
    10cb:	90                   	nop
    10cc:	90                   	nop
    10cd:	90                   	nop
    10ce:	90                   	nop
    10cf:	90                   	nop

000010d0 <memset>:

void*
memset(void *dst, int c, uint n)
{
    10d0:	55                   	push   %ebp
    10d1:	89 e5                	mov    %esp,%ebp
    10d3:	57                   	push   %edi
    10d4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    10d7:	8b 4d 10             	mov    0x10(%ebp),%ecx
    10da:	8b 45 0c             	mov    0xc(%ebp),%eax
    10dd:	89 d7                	mov    %edx,%edi
    10df:	fc                   	cld    
    10e0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    10e2:	89 d0                	mov    %edx,%eax
    10e4:	5f                   	pop    %edi
    10e5:	5d                   	pop    %ebp
    10e6:	c3                   	ret    
    10e7:	89 f6                	mov    %esi,%esi
    10e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000010f0 <strchr>:

char*
strchr(const char *s, char c)
{
    10f0:	55                   	push   %ebp
    10f1:	89 e5                	mov    %esp,%ebp
    10f3:	53                   	push   %ebx
    10f4:	8b 45 08             	mov    0x8(%ebp),%eax
    10f7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
    10fa:	0f b6 10             	movzbl (%eax),%edx
    10fd:	84 d2                	test   %dl,%dl
    10ff:	74 1d                	je     111e <strchr+0x2e>
    if(*s == c)
    1101:	38 d3                	cmp    %dl,%bl
    1103:	89 d9                	mov    %ebx,%ecx
    1105:	75 0d                	jne    1114 <strchr+0x24>
    1107:	eb 17                	jmp    1120 <strchr+0x30>
    1109:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1110:	38 ca                	cmp    %cl,%dl
    1112:	74 0c                	je     1120 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    1114:	83 c0 01             	add    $0x1,%eax
    1117:	0f b6 10             	movzbl (%eax),%edx
    111a:	84 d2                	test   %dl,%dl
    111c:	75 f2                	jne    1110 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
    111e:	31 c0                	xor    %eax,%eax
}
    1120:	5b                   	pop    %ebx
    1121:	5d                   	pop    %ebp
    1122:	c3                   	ret    
    1123:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1129:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001130 <gets>:

char*
gets(char *buf, int max)
{
    1130:	55                   	push   %ebp
    1131:	89 e5                	mov    %esp,%ebp
    1133:	57                   	push   %edi
    1134:	56                   	push   %esi
    1135:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1136:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
    1138:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
    113b:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    113e:	eb 29                	jmp    1169 <gets+0x39>
    cc = read(0, &c, 1);
    1140:	83 ec 04             	sub    $0x4,%esp
    1143:	6a 01                	push   $0x1
    1145:	57                   	push   %edi
    1146:	6a 00                	push   $0x0
    1148:	e8 43 01 00 00       	call   1290 <read>
    if(cc < 1)
    114d:	83 c4 10             	add    $0x10,%esp
    1150:	85 c0                	test   %eax,%eax
    1152:	7e 1d                	jle    1171 <gets+0x41>
      break;
    buf[i++] = c;
    1154:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    1158:	8b 55 08             	mov    0x8(%ebp),%edx
    115b:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
    115d:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    115f:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    1163:	74 1b                	je     1180 <gets+0x50>
    1165:	3c 0d                	cmp    $0xd,%al
    1167:	74 17                	je     1180 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1169:	8d 5e 01             	lea    0x1(%esi),%ebx
    116c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    116f:	7c cf                	jl     1140 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    1171:	8b 45 08             	mov    0x8(%ebp),%eax
    1174:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    1178:	8d 65 f4             	lea    -0xc(%ebp),%esp
    117b:	5b                   	pop    %ebx
    117c:	5e                   	pop    %esi
    117d:	5f                   	pop    %edi
    117e:	5d                   	pop    %ebp
    117f:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    1180:	8b 45 08             	mov    0x8(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1183:	89 de                	mov    %ebx,%esi
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    1185:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    1189:	8d 65 f4             	lea    -0xc(%ebp),%esp
    118c:	5b                   	pop    %ebx
    118d:	5e                   	pop    %esi
    118e:	5f                   	pop    %edi
    118f:	5d                   	pop    %ebp
    1190:	c3                   	ret    
    1191:	eb 0d                	jmp    11a0 <stat>
    1193:	90                   	nop
    1194:	90                   	nop
    1195:	90                   	nop
    1196:	90                   	nop
    1197:	90                   	nop
    1198:	90                   	nop
    1199:	90                   	nop
    119a:	90                   	nop
    119b:	90                   	nop
    119c:	90                   	nop
    119d:	90                   	nop
    119e:	90                   	nop
    119f:	90                   	nop

000011a0 <stat>:

int
stat(char *n, struct stat *st)
{
    11a0:	55                   	push   %ebp
    11a1:	89 e5                	mov    %esp,%ebp
    11a3:	56                   	push   %esi
    11a4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    11a5:	83 ec 08             	sub    $0x8,%esp
    11a8:	6a 00                	push   $0x0
    11aa:	ff 75 08             	pushl  0x8(%ebp)
    11ad:	e8 06 01 00 00       	call   12b8 <open>
  if(fd < 0)
    11b2:	83 c4 10             	add    $0x10,%esp
    11b5:	85 c0                	test   %eax,%eax
    11b7:	78 27                	js     11e0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    11b9:	83 ec 08             	sub    $0x8,%esp
    11bc:	ff 75 0c             	pushl  0xc(%ebp)
    11bf:	89 c3                	mov    %eax,%ebx
    11c1:	50                   	push   %eax
    11c2:	e8 09 01 00 00       	call   12d0 <fstat>
    11c7:	89 c6                	mov    %eax,%esi
  close(fd);
    11c9:	89 1c 24             	mov    %ebx,(%esp)
    11cc:	e8 cf 00 00 00       	call   12a0 <close>
  return r;
    11d1:	83 c4 10             	add    $0x10,%esp
    11d4:	89 f0                	mov    %esi,%eax
}
    11d6:	8d 65 f8             	lea    -0x8(%ebp),%esp
    11d9:	5b                   	pop    %ebx
    11da:	5e                   	pop    %esi
    11db:	5d                   	pop    %ebp
    11dc:	c3                   	ret    
    11dd:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
    11e0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    11e5:	eb ef                	jmp    11d6 <stat+0x36>
    11e7:	89 f6                	mov    %esi,%esi
    11e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000011f0 <atoi>:
  return r;
}

int
atoi(const char *s)
{
    11f0:	55                   	push   %ebp
    11f1:	89 e5                	mov    %esp,%ebp
    11f3:	53                   	push   %ebx
    11f4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    11f7:	0f be 11             	movsbl (%ecx),%edx
    11fa:	8d 42 d0             	lea    -0x30(%edx),%eax
    11fd:	3c 09                	cmp    $0x9,%al
    11ff:	b8 00 00 00 00       	mov    $0x0,%eax
    1204:	77 1f                	ja     1225 <atoi+0x35>
    1206:	8d 76 00             	lea    0x0(%esi),%esi
    1209:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
    1210:	8d 04 80             	lea    (%eax,%eax,4),%eax
    1213:	83 c1 01             	add    $0x1,%ecx
    1216:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    121a:	0f be 11             	movsbl (%ecx),%edx
    121d:	8d 5a d0             	lea    -0x30(%edx),%ebx
    1220:	80 fb 09             	cmp    $0x9,%bl
    1223:	76 eb                	jbe    1210 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
    1225:	5b                   	pop    %ebx
    1226:	5d                   	pop    %ebp
    1227:	c3                   	ret    
    1228:	90                   	nop
    1229:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001230 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    1230:	55                   	push   %ebp
    1231:	89 e5                	mov    %esp,%ebp
    1233:	56                   	push   %esi
    1234:	53                   	push   %ebx
    1235:	8b 5d 10             	mov    0x10(%ebp),%ebx
    1238:	8b 45 08             	mov    0x8(%ebp),%eax
    123b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    123e:	85 db                	test   %ebx,%ebx
    1240:	7e 14                	jle    1256 <memmove+0x26>
    1242:	31 d2                	xor    %edx,%edx
    1244:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    1248:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    124c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    124f:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    1252:	39 da                	cmp    %ebx,%edx
    1254:	75 f2                	jne    1248 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
    1256:	5b                   	pop    %ebx
    1257:	5e                   	pop    %esi
    1258:	5d                   	pop    %ebp
    1259:	c3                   	ret    
    125a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001260 <max>:

int max(int a, int b) {
    1260:	55                   	push   %ebp
    1261:	89 e5                	mov    %esp,%ebp
    1263:	8b 55 08             	mov    0x8(%ebp),%edx
    1266:	8b 45 0c             	mov    0xc(%ebp),%eax
  if (b > a) return b;
  else return a;
}
    1269:	5d                   	pop    %ebp
    126a:	39 d0                	cmp    %edx,%eax
    126c:	0f 4c c2             	cmovl  %edx,%eax
    126f:	c3                   	ret    

00001270 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    1270:	b8 01 00 00 00       	mov    $0x1,%eax
    1275:	cd 40                	int    $0x40
    1277:	c3                   	ret    

00001278 <exit>:
SYSCALL(exit)
    1278:	b8 02 00 00 00       	mov    $0x2,%eax
    127d:	cd 40                	int    $0x40
    127f:	c3                   	ret    

00001280 <wait>:
SYSCALL(wait)
    1280:	b8 03 00 00 00       	mov    $0x3,%eax
    1285:	cd 40                	int    $0x40
    1287:	c3                   	ret    

00001288 <pipe>:
SYSCALL(pipe)
    1288:	b8 04 00 00 00       	mov    $0x4,%eax
    128d:	cd 40                	int    $0x40
    128f:	c3                   	ret    

00001290 <read>:
SYSCALL(read)
    1290:	b8 05 00 00 00       	mov    $0x5,%eax
    1295:	cd 40                	int    $0x40
    1297:	c3                   	ret    

00001298 <write>:
SYSCALL(write)
    1298:	b8 10 00 00 00       	mov    $0x10,%eax
    129d:	cd 40                	int    $0x40
    129f:	c3                   	ret    

000012a0 <close>:
SYSCALL(close)
    12a0:	b8 15 00 00 00       	mov    $0x15,%eax
    12a5:	cd 40                	int    $0x40
    12a7:	c3                   	ret    

000012a8 <kill>:
SYSCALL(kill)
    12a8:	b8 06 00 00 00       	mov    $0x6,%eax
    12ad:	cd 40                	int    $0x40
    12af:	c3                   	ret    

000012b0 <exec>:
SYSCALL(exec)
    12b0:	b8 07 00 00 00       	mov    $0x7,%eax
    12b5:	cd 40                	int    $0x40
    12b7:	c3                   	ret    

000012b8 <open>:
SYSCALL(open)
    12b8:	b8 0f 00 00 00       	mov    $0xf,%eax
    12bd:	cd 40                	int    $0x40
    12bf:	c3                   	ret    

000012c0 <mknod>:
SYSCALL(mknod)
    12c0:	b8 11 00 00 00       	mov    $0x11,%eax
    12c5:	cd 40                	int    $0x40
    12c7:	c3                   	ret    

000012c8 <unlink>:
SYSCALL(unlink)
    12c8:	b8 12 00 00 00       	mov    $0x12,%eax
    12cd:	cd 40                	int    $0x40
    12cf:	c3                   	ret    

000012d0 <fstat>:
SYSCALL(fstat)
    12d0:	b8 08 00 00 00       	mov    $0x8,%eax
    12d5:	cd 40                	int    $0x40
    12d7:	c3                   	ret    

000012d8 <link>:
SYSCALL(link)
    12d8:	b8 13 00 00 00       	mov    $0x13,%eax
    12dd:	cd 40                	int    $0x40
    12df:	c3                   	ret    

000012e0 <mkdir>:
SYSCALL(mkdir)
    12e0:	b8 14 00 00 00       	mov    $0x14,%eax
    12e5:	cd 40                	int    $0x40
    12e7:	c3                   	ret    

000012e8 <chdir>:
SYSCALL(chdir)
    12e8:	b8 09 00 00 00       	mov    $0x9,%eax
    12ed:	cd 40                	int    $0x40
    12ef:	c3                   	ret    

000012f0 <dup>:
SYSCALL(dup)
    12f0:	b8 0a 00 00 00       	mov    $0xa,%eax
    12f5:	cd 40                	int    $0x40
    12f7:	c3                   	ret    

000012f8 <getpid>:
SYSCALL(getpid)
    12f8:	b8 0b 00 00 00       	mov    $0xb,%eax
    12fd:	cd 40                	int    $0x40
    12ff:	c3                   	ret    

00001300 <sbrk>:
SYSCALL(sbrk)
    1300:	b8 0c 00 00 00       	mov    $0xc,%eax
    1305:	cd 40                	int    $0x40
    1307:	c3                   	ret    

00001308 <sleep>:
SYSCALL(sleep)
    1308:	b8 0d 00 00 00       	mov    $0xd,%eax
    130d:	cd 40                	int    $0x40
    130f:	c3                   	ret    

00001310 <uptime>:
SYSCALL(uptime)
    1310:	b8 0e 00 00 00       	mov    $0xe,%eax
    1315:	cd 40                	int    $0x40
    1317:	c3                   	ret    

00001318 <setVariable>:
SYSCALL(setVariable)
    1318:	b8 17 00 00 00       	mov    $0x17,%eax
    131d:	cd 40                	int    $0x40
    131f:	c3                   	ret    

00001320 <getVariable>:
SYSCALL(getVariable)
    1320:	b8 18 00 00 00       	mov    $0x18,%eax
    1325:	cd 40                	int    $0x40
    1327:	c3                   	ret    

00001328 <remVariable>:
SYSCALL(remVariable)
    1328:	b8 19 00 00 00       	mov    $0x19,%eax
    132d:	cd 40                	int    $0x40
    132f:	c3                   	ret    

00001330 <wait2>:
SYSCALL(wait2)
    1330:	b8 1a 00 00 00       	mov    $0x1a,%eax
    1335:	cd 40                	int    $0x40
    1337:	c3                   	ret    
    1338:	66 90                	xchg   %ax,%ax
    133a:	66 90                	xchg   %ax,%ax
    133c:	66 90                	xchg   %ax,%ax
    133e:	66 90                	xchg   %ax,%ax

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
    13a1:	8d 7c 0d d7          	lea    -0x29(%ebp,%ecx,1),%edi
    13a5:	8d 76 00             	lea    0x0(%esi),%esi
    13a8:	0f b6 07             	movzbl (%edi),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    13ab:	83 ec 04             	sub    $0x4,%esp
    13ae:	83 ef 01             	sub    $0x1,%edi
    13b1:	6a 01                	push   $0x1
    13b3:	53                   	push   %ebx
    13b4:	56                   	push   %esi
    13b5:	88 45 d7             	mov    %al,-0x29(%ebp)
    13b8:	e8 db fe ff ff       	call   1298 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    13bd:	83 c4 10             	add    $0x10,%esp
    13c0:	39 df                	cmp    %ebx,%edi
    13c2:	75 e4                	jne    13a8 <printint+0x68>
    putc(fd, buf[i]);
}
    13c4:	8d 65 f4             	lea    -0xc(%ebp),%esp
    13c7:	5b                   	pop    %ebx
    13c8:	5e                   	pop    %esi
    13c9:	5f                   	pop    %edi
    13ca:	5d                   	pop    %ebp
    13cb:	c3                   	ret    
    13cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
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
    142a:	e8 69 fe ff ff       	call   1298 <write>
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
    148c:	e8 07 fe ff ff       	call   1298 <write>
    1491:	83 c4 0c             	add    $0xc,%esp
    1494:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    1497:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    149a:	6a 01                	push   $0x1
    149c:	50                   	push   %eax
    149d:	57                   	push   %edi
    149e:	83 c6 01             	add    $0x1,%esi
    14a1:	e8 f2 fd ff ff       	call   1298 <write>
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
          s = "(null)";
    14fb:	b8 14 18 00 00       	mov    $0x1814,%eax
    1500:	85 db                	test   %ebx,%ebx
    1502:	0f 44 d8             	cmove  %eax,%ebx
        while(*s != 0){
    1505:	0f b6 03             	movzbl (%ebx),%eax
    1508:	84 c0                	test   %al,%al
    150a:	74 23                	je     152f <printf+0x14f>
    150c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
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
    1520:	e8 73 fd ff ff       	call   1298 <write>
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
    155f:	8b 5d d0             	mov    -0x30(%ebp),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    1562:	83 ec 04             	sub    $0x4,%esp
    1565:	8b 03                	mov    (%ebx),%eax
    1567:	6a 01                	push   $0x1
    1569:	88 45 e4             	mov    %al,-0x1c(%ebp)
    156c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    156f:	50                   	push   %eax
    1570:	57                   	push   %edi
    1571:	e8 22 fd ff ff       	call   1298 <write>
    1576:	e9 5b ff ff ff       	jmp    14d6 <printf+0xf6>
    157b:	66 90                	xchg   %ax,%ax
    157d:	66 90                	xchg   %ax,%ax
    157f:	90                   	nop

00001580 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1580:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1581:	a1 a4 1f 00 00       	mov    0x1fa4,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
    1586:	89 e5                	mov    %esp,%ebp
    1588:	57                   	push   %edi
    1589:	56                   	push   %esi
    158a:	53                   	push   %ebx
    158b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    158e:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
    1590:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1593:	39 c8                	cmp    %ecx,%eax
    1595:	73 19                	jae    15b0 <free+0x30>
    1597:	89 f6                	mov    %esi,%esi
    1599:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    15a0:	39 d1                	cmp    %edx,%ecx
    15a2:	72 1c                	jb     15c0 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    15a4:	39 d0                	cmp    %edx,%eax
    15a6:	73 18                	jae    15c0 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
    15a8:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    15aa:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    15ac:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    15ae:	72 f0                	jb     15a0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    15b0:	39 d0                	cmp    %edx,%eax
    15b2:	72 f4                	jb     15a8 <free+0x28>
    15b4:	39 d1                	cmp    %edx,%ecx
    15b6:	73 f0                	jae    15a8 <free+0x28>
    15b8:	90                   	nop
    15b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
    15c0:	8b 73 fc             	mov    -0x4(%ebx),%esi
    15c3:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    15c6:	39 d7                	cmp    %edx,%edi
    15c8:	74 19                	je     15e3 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    15ca:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    15cd:	8b 50 04             	mov    0x4(%eax),%edx
    15d0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    15d3:	39 f1                	cmp    %esi,%ecx
    15d5:	74 23                	je     15fa <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    15d7:	89 08                	mov    %ecx,(%eax)
  freep = p;
    15d9:	a3 a4 1f 00 00       	mov    %eax,0x1fa4
}
    15de:	5b                   	pop    %ebx
    15df:	5e                   	pop    %esi
    15e0:	5f                   	pop    %edi
    15e1:	5d                   	pop    %ebp
    15e2:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
    15e3:	03 72 04             	add    0x4(%edx),%esi
    15e6:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    15e9:	8b 10                	mov    (%eax),%edx
    15eb:	8b 12                	mov    (%edx),%edx
    15ed:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    15f0:	8b 50 04             	mov    0x4(%eax),%edx
    15f3:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    15f6:	39 f1                	cmp    %esi,%ecx
    15f8:	75 dd                	jne    15d7 <free+0x57>
    p->s.size += bp->s.size;
    15fa:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
    15fd:	a3 a4 1f 00 00       	mov    %eax,0x1fa4
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    1602:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1605:	8b 53 f8             	mov    -0x8(%ebx),%edx
    1608:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
    160a:	5b                   	pop    %ebx
    160b:	5e                   	pop    %esi
    160c:	5f                   	pop    %edi
    160d:	5d                   	pop    %ebp
    160e:	c3                   	ret    
    160f:	90                   	nop

00001610 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1610:	55                   	push   %ebp
    1611:	89 e5                	mov    %esp,%ebp
    1613:	57                   	push   %edi
    1614:	56                   	push   %esi
    1615:	53                   	push   %ebx
    1616:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1619:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    161c:	8b 15 a4 1f 00 00    	mov    0x1fa4,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1622:	8d 78 07             	lea    0x7(%eax),%edi
    1625:	c1 ef 03             	shr    $0x3,%edi
    1628:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    162b:	85 d2                	test   %edx,%edx
    162d:	0f 84 a3 00 00 00    	je     16d6 <malloc+0xc6>
    1633:	8b 02                	mov    (%edx),%eax
    1635:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    1638:	39 cf                	cmp    %ecx,%edi
    163a:	76 74                	jbe    16b0 <malloc+0xa0>
    163c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    1642:	be 00 10 00 00       	mov    $0x1000,%esi
    1647:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
    164e:	0f 43 f7             	cmovae %edi,%esi
    1651:	ba 00 80 00 00       	mov    $0x8000,%edx
    1656:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
    165c:	0f 46 da             	cmovbe %edx,%ebx
    165f:	eb 10                	jmp    1671 <malloc+0x61>
    1661:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
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
    166f:	76 3f                	jbe    16b0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1671:	39 05 a4 1f 00 00    	cmp    %eax,0x1fa4
    1677:	89 c2                	mov    %eax,%edx
    1679:	75 ed                	jne    1668 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
    167b:	83 ec 0c             	sub    $0xc,%esp
    167e:	53                   	push   %ebx
    167f:	e8 7c fc ff ff       	call   1300 <sbrk>
  if(p == (char*)-1)
    1684:	83 c4 10             	add    $0x10,%esp
    1687:	83 f8 ff             	cmp    $0xffffffff,%eax
    168a:	74 1c                	je     16a8 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
    168c:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
    168f:	83 ec 0c             	sub    $0xc,%esp
    1692:	83 c0 08             	add    $0x8,%eax
    1695:	50                   	push   %eax
    1696:	e8 e5 fe ff ff       	call   1580 <free>
  return freep;
    169b:	8b 15 a4 1f 00 00    	mov    0x1fa4,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
    16a1:	83 c4 10             	add    $0x10,%esp
    16a4:	85 d2                	test   %edx,%edx
    16a6:	75 c0                	jne    1668 <malloc+0x58>
        return 0;
    16a8:	31 c0                	xor    %eax,%eax
    16aa:	eb 1c                	jmp    16c8 <malloc+0xb8>
    16ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
    16b0:	39 cf                	cmp    %ecx,%edi
    16b2:	74 1c                	je     16d0 <malloc+0xc0>
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
    16bf:	89 15 a4 1f 00 00    	mov    %edx,0x1fa4
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
    16d4:	eb e9                	jmp    16bf <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    16d6:	c7 05 a4 1f 00 00 a8 	movl   $0x1fa8,0x1fa4
    16dd:	1f 00 00 
    16e0:	c7 05 a8 1f 00 00 a8 	movl   $0x1fa8,0x1fa8
    16e7:	1f 00 00 
    base.s.size = 0;
    16ea:	b8 a8 1f 00 00       	mov    $0x1fa8,%eax
    16ef:	c7 05 ac 1f 00 00 00 	movl   $0x0,0x1fac
    16f6:	00 00 00 
    16f9:	e9 3e ff ff ff       	jmp    163c <malloc+0x2c>
