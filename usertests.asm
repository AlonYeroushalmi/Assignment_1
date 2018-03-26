
_usertests:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  return randstate;
}

int
main(int argc, char *argv[])
{
       0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
       4:	83 e4 f0             	and    $0xfffffff0,%esp
       7:	ff 71 fc             	pushl  -0x4(%ecx)
       a:	55                   	push   %ebp
       b:	89 e5                	mov    %esp,%ebp
       d:	51                   	push   %ecx
       e:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "usertests starting\n");
      11:	68 de 4d 00 00       	push   $0x4dde
      16:	6a 01                	push   $0x1
      18:	e8 b3 3a 00 00       	call   3ad0 <printf>

  if(open("usertests.ran", 0) >= 0){
      1d:	5a                   	pop    %edx
      1e:	59                   	pop    %ecx
      1f:	6a 00                	push   $0x0
      21:	68 f2 4d 00 00       	push   $0x4df2
      26:	e8 8d 39 00 00       	call   39b8 <open>
      2b:	83 c4 10             	add    $0x10,%esp
      2e:	85 c0                	test   %eax,%eax
      30:	78 14                	js     46 <main+0x46>
    printf(1, "already ran user tests -- rebuild fs.img\n");
      32:	83 ec 08             	sub    $0x8,%esp
      35:	68 5c 55 00 00       	push   $0x555c
      3a:	6a 01                	push   $0x1
      3c:	e8 8f 3a 00 00       	call   3ad0 <printf>
    exit();
      41:	e8 32 39 00 00       	call   3978 <exit>
  }
  close(open("usertests.ran", O_CREATE));
      46:	50                   	push   %eax
      47:	50                   	push   %eax
      48:	68 00 02 00 00       	push   $0x200
      4d:	68 f2 4d 00 00       	push   $0x4df2
      52:	e8 61 39 00 00       	call   39b8 <open>
      57:	89 04 24             	mov    %eax,(%esp)
      5a:	e8 41 39 00 00       	call   39a0 <close>

  argptest();
      5f:	e8 9c 35 00 00       	call   3600 <argptest>
  createdelete();
      64:	e8 a7 11 00 00       	call   1210 <createdelete>
  linkunlink();
      69:	e8 62 1a 00 00       	call   1ad0 <linkunlink>
  concreate();
      6e:	e8 4d 17 00 00       	call   17c0 <concreate>
  fourfiles();
      73:	e8 98 0f 00 00       	call   1010 <fourfiles>
  sharedfd();
      78:	e8 d3 0d 00 00       	call   e50 <sharedfd>

  bigargtest();
      7d:	e8 1e 32 00 00       	call   32a0 <bigargtest>
  bigwrite();
      82:	e8 69 23 00 00       	call   23f0 <bigwrite>
  bigargtest();
      87:	e8 14 32 00 00       	call   32a0 <bigargtest>
  bsstest();
      8c:	e8 8f 31 00 00       	call   3220 <bsstest>
  sbrktest();
      91:	e8 aa 2c 00 00       	call   2d40 <sbrktest>
  validatetest();
      96:	e8 d5 30 00 00       	call   3170 <validatetest>

  opentest();
      9b:	e8 50 03 00 00       	call   3f0 <opentest>
  writetest();
      a0:	e8 db 03 00 00       	call   480 <writetest>
  writetest1();
      a5:	e8 b6 05 00 00       	call   660 <writetest1>
  createtest();
      aa:	e8 81 07 00 00       	call   830 <createtest>

  openiputtest();
      af:	e8 3c 02 00 00       	call   2f0 <openiputtest>
  exitiputtest();
      b4:	e8 47 01 00 00       	call   200 <exitiputtest>
  iputtest();
      b9:	e8 62 00 00 00       	call   120 <iputtest>

  mem();
      be:	e8 bd 0c 00 00       	call   d80 <mem>
  pipe1();
      c3:	e8 48 09 00 00       	call   a10 <pipe1>
  preempt();
      c8:	e8 e3 0a 00 00       	call   bb0 <preempt>
  exitwait();
      cd:	e8 1e 0c 00 00       	call   cf0 <exitwait>

  rmdot();
      d2:	e8 09 27 00 00       	call   27e0 <rmdot>
  fourteen();
      d7:	e8 c4 25 00 00       	call   26a0 <fourteen>
  bigfile();
      dc:	e8 ef 23 00 00       	call   24d0 <bigfile>
  subdir();
      e1:	e8 2a 1c 00 00       	call   1d10 <subdir>
  linktest();
      e6:	e8 c5 14 00 00       	call   15b0 <linktest>
  unlinkread();
      eb:	e8 30 13 00 00       	call   1420 <unlinkread>
  dirfile();
      f0:	e8 6b 28 00 00       	call   2960 <dirfile>
  iref();
      f5:	e8 66 2a 00 00       	call   2b60 <iref>
  forktest();
      fa:	e8 81 2b 00 00       	call   2c80 <forktest>
  bigdir(); // slow
      ff:	e8 dc 1a 00 00       	call   1be0 <bigdir>

  uio();
     104:	e8 87 34 00 00       	call   3590 <uio>

  exectest();
     109:	e8 b2 08 00 00       	call   9c0 <exectest>

  exit();
     10e:	e8 65 38 00 00       	call   3978 <exit>
     113:	66 90                	xchg   %ax,%ax
     115:	66 90                	xchg   %ax,%ax
     117:	66 90                	xchg   %ax,%ax
     119:	66 90                	xchg   %ax,%ax
     11b:	66 90                	xchg   %ax,%ax
     11d:	66 90                	xchg   %ax,%ax
     11f:	90                   	nop

00000120 <iputtest>:
int stdout = 1;

// does chdir() call iput(p->cwd) in a transaction?
void
iputtest(void)
{
     120:	55                   	push   %ebp
     121:	89 e5                	mov    %esp,%ebp
     123:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "iput test\n");
     126:	68 84 3e 00 00       	push   $0x3e84
     12b:	ff 35 0c 5f 00 00    	pushl  0x5f0c
     131:	e8 9a 39 00 00       	call   3ad0 <printf>

  if(mkdir("iputdir") < 0){
     136:	c7 04 24 17 3e 00 00 	movl   $0x3e17,(%esp)
     13d:	e8 9e 38 00 00       	call   39e0 <mkdir>
     142:	83 c4 10             	add    $0x10,%esp
     145:	85 c0                	test   %eax,%eax
     147:	78 58                	js     1a1 <iputtest+0x81>
    printf(stdout, "mkdir failed\n");
    exit();
  }
  if(chdir("iputdir") < 0){
     149:	83 ec 0c             	sub    $0xc,%esp
     14c:	68 17 3e 00 00       	push   $0x3e17
     151:	e8 92 38 00 00       	call   39e8 <chdir>
     156:	83 c4 10             	add    $0x10,%esp
     159:	85 c0                	test   %eax,%eax
     15b:	0f 88 85 00 00 00    	js     1e6 <iputtest+0xc6>
    printf(stdout, "chdir iputdir failed\n");
    exit();
  }
  if(unlink("../iputdir") < 0){
     161:	83 ec 0c             	sub    $0xc,%esp
     164:	68 14 3e 00 00       	push   $0x3e14
     169:	e8 5a 38 00 00       	call   39c8 <unlink>
     16e:	83 c4 10             	add    $0x10,%esp
     171:	85 c0                	test   %eax,%eax
     173:	78 5a                	js     1cf <iputtest+0xaf>
    printf(stdout, "unlink ../iputdir failed\n");
    exit();
  }
  if(chdir("/") < 0){
     175:	83 ec 0c             	sub    $0xc,%esp
     178:	68 39 3e 00 00       	push   $0x3e39
     17d:	e8 66 38 00 00       	call   39e8 <chdir>
     182:	83 c4 10             	add    $0x10,%esp
     185:	85 c0                	test   %eax,%eax
     187:	78 2f                	js     1b8 <iputtest+0x98>
    printf(stdout, "chdir / failed\n");
    exit();
  }
  printf(stdout, "iput test ok\n");
     189:	83 ec 08             	sub    $0x8,%esp
     18c:	68 bc 3e 00 00       	push   $0x3ebc
     191:	ff 35 0c 5f 00 00    	pushl  0x5f0c
     197:	e8 34 39 00 00       	call   3ad0 <printf>
}
     19c:	83 c4 10             	add    $0x10,%esp
     19f:	c9                   	leave  
     1a0:	c3                   	ret    
iputtest(void)
{
  printf(stdout, "iput test\n");

  if(mkdir("iputdir") < 0){
    printf(stdout, "mkdir failed\n");
     1a1:	50                   	push   %eax
     1a2:	50                   	push   %eax
     1a3:	68 f0 3d 00 00       	push   $0x3df0
     1a8:	ff 35 0c 5f 00 00    	pushl  0x5f0c
     1ae:	e8 1d 39 00 00       	call   3ad0 <printf>
    exit();
     1b3:	e8 c0 37 00 00       	call   3978 <exit>
  if(unlink("../iputdir") < 0){
    printf(stdout, "unlink ../iputdir failed\n");
    exit();
  }
  if(chdir("/") < 0){
    printf(stdout, "chdir / failed\n");
     1b8:	50                   	push   %eax
     1b9:	50                   	push   %eax
     1ba:	68 3b 3e 00 00       	push   $0x3e3b
     1bf:	ff 35 0c 5f 00 00    	pushl  0x5f0c
     1c5:	e8 06 39 00 00       	call   3ad0 <printf>
    exit();
     1ca:	e8 a9 37 00 00       	call   3978 <exit>
  if(chdir("iputdir") < 0){
    printf(stdout, "chdir iputdir failed\n");
    exit();
  }
  if(unlink("../iputdir") < 0){
    printf(stdout, "unlink ../iputdir failed\n");
     1cf:	52                   	push   %edx
     1d0:	52                   	push   %edx
     1d1:	68 1f 3e 00 00       	push   $0x3e1f
     1d6:	ff 35 0c 5f 00 00    	pushl  0x5f0c
     1dc:	e8 ef 38 00 00       	call   3ad0 <printf>
    exit();
     1e1:	e8 92 37 00 00       	call   3978 <exit>
  if(mkdir("iputdir") < 0){
    printf(stdout, "mkdir failed\n");
    exit();
  }
  if(chdir("iputdir") < 0){
    printf(stdout, "chdir iputdir failed\n");
     1e6:	51                   	push   %ecx
     1e7:	51                   	push   %ecx
     1e8:	68 fe 3d 00 00       	push   $0x3dfe
     1ed:	ff 35 0c 5f 00 00    	pushl  0x5f0c
     1f3:	e8 d8 38 00 00       	call   3ad0 <printf>
    exit();
     1f8:	e8 7b 37 00 00       	call   3978 <exit>
     1fd:	8d 76 00             	lea    0x0(%esi),%esi

00000200 <exitiputtest>:
}

// does exit() call iput(p->cwd) in a transaction?
void
exitiputtest(void)
{
     200:	55                   	push   %ebp
     201:	89 e5                	mov    %esp,%ebp
     203:	83 ec 10             	sub    $0x10,%esp
  int pid;

  printf(stdout, "exitiput test\n");
     206:	68 4b 3e 00 00       	push   $0x3e4b
     20b:	ff 35 0c 5f 00 00    	pushl  0x5f0c
     211:	e8 ba 38 00 00       	call   3ad0 <printf>

  pid = fork();
     216:	e8 55 37 00 00       	call   3970 <fork>
  if(pid < 0){
     21b:	83 c4 10             	add    $0x10,%esp
     21e:	85 c0                	test   %eax,%eax
     220:	0f 88 82 00 00 00    	js     2a8 <exitiputtest+0xa8>
    printf(stdout, "fork failed\n");
    exit();
  }
  if(pid == 0){
     226:	75 48                	jne    270 <exitiputtest+0x70>
    if(mkdir("iputdir") < 0){
     228:	83 ec 0c             	sub    $0xc,%esp
     22b:	68 17 3e 00 00       	push   $0x3e17
     230:	e8 ab 37 00 00       	call   39e0 <mkdir>
     235:	83 c4 10             	add    $0x10,%esp
     238:	85 c0                	test   %eax,%eax
     23a:	0f 88 96 00 00 00    	js     2d6 <exitiputtest+0xd6>
      printf(stdout, "mkdir failed\n");
      exit();
    }
    if(chdir("iputdir") < 0){
     240:	83 ec 0c             	sub    $0xc,%esp
     243:	68 17 3e 00 00       	push   $0x3e17
     248:	e8 9b 37 00 00       	call   39e8 <chdir>
     24d:	83 c4 10             	add    $0x10,%esp
     250:	85 c0                	test   %eax,%eax
     252:	78 6b                	js     2bf <exitiputtest+0xbf>
      printf(stdout, "child chdir failed\n");
      exit();
    }
    if(unlink("../iputdir") < 0){
     254:	83 ec 0c             	sub    $0xc,%esp
     257:	68 14 3e 00 00       	push   $0x3e14
     25c:	e8 67 37 00 00       	call   39c8 <unlink>
     261:	83 c4 10             	add    $0x10,%esp
     264:	85 c0                	test   %eax,%eax
     266:	78 28                	js     290 <exitiputtest+0x90>
      printf(stdout, "unlink ../iputdir failed\n");
      exit();
    }
    exit();
     268:	e8 0b 37 00 00       	call   3978 <exit>
     26d:	8d 76 00             	lea    0x0(%esi),%esi
  }
  wait();
     270:	e8 0b 37 00 00       	call   3980 <wait>
  printf(stdout, "exitiput test ok\n");
     275:	83 ec 08             	sub    $0x8,%esp
     278:	68 6e 3e 00 00       	push   $0x3e6e
     27d:	ff 35 0c 5f 00 00    	pushl  0x5f0c
     283:	e8 48 38 00 00       	call   3ad0 <printf>
}
     288:	83 c4 10             	add    $0x10,%esp
     28b:	c9                   	leave  
     28c:	c3                   	ret    
     28d:	8d 76 00             	lea    0x0(%esi),%esi
    if(chdir("iputdir") < 0){
      printf(stdout, "child chdir failed\n");
      exit();
    }
    if(unlink("../iputdir") < 0){
      printf(stdout, "unlink ../iputdir failed\n");
     290:	83 ec 08             	sub    $0x8,%esp
     293:	68 1f 3e 00 00       	push   $0x3e1f
     298:	ff 35 0c 5f 00 00    	pushl  0x5f0c
     29e:	e8 2d 38 00 00       	call   3ad0 <printf>
      exit();
     2a3:	e8 d0 36 00 00       	call   3978 <exit>

  printf(stdout, "exitiput test\n");

  pid = fork();
  if(pid < 0){
    printf(stdout, "fork failed\n");
     2a8:	51                   	push   %ecx
     2a9:	51                   	push   %ecx
     2aa:	68 31 4d 00 00       	push   $0x4d31
     2af:	ff 35 0c 5f 00 00    	pushl  0x5f0c
     2b5:	e8 16 38 00 00       	call   3ad0 <printf>
    exit();
     2ba:	e8 b9 36 00 00       	call   3978 <exit>
    if(mkdir("iputdir") < 0){
      printf(stdout, "mkdir failed\n");
      exit();
    }
    if(chdir("iputdir") < 0){
      printf(stdout, "child chdir failed\n");
     2bf:	50                   	push   %eax
     2c0:	50                   	push   %eax
     2c1:	68 5a 3e 00 00       	push   $0x3e5a
     2c6:	ff 35 0c 5f 00 00    	pushl  0x5f0c
     2cc:	e8 ff 37 00 00       	call   3ad0 <printf>
      exit();
     2d1:	e8 a2 36 00 00       	call   3978 <exit>
    printf(stdout, "fork failed\n");
    exit();
  }
  if(pid == 0){
    if(mkdir("iputdir") < 0){
      printf(stdout, "mkdir failed\n");
     2d6:	52                   	push   %edx
     2d7:	52                   	push   %edx
     2d8:	68 f0 3d 00 00       	push   $0x3df0
     2dd:	ff 35 0c 5f 00 00    	pushl  0x5f0c
     2e3:	e8 e8 37 00 00       	call   3ad0 <printf>
      exit();
     2e8:	e8 8b 36 00 00       	call   3978 <exit>
     2ed:	8d 76 00             	lea    0x0(%esi),%esi

000002f0 <openiputtest>:
//      for(i = 0; i < 10000; i++)
//        yield();
//    }
void
openiputtest(void)
{
     2f0:	55                   	push   %ebp
     2f1:	89 e5                	mov    %esp,%ebp
     2f3:	83 ec 10             	sub    $0x10,%esp
  int pid;

  printf(stdout, "openiput test\n");
     2f6:	68 80 3e 00 00       	push   $0x3e80
     2fb:	ff 35 0c 5f 00 00    	pushl  0x5f0c
     301:	e8 ca 37 00 00       	call   3ad0 <printf>
  if(mkdir("oidir") < 0){
     306:	c7 04 24 8f 3e 00 00 	movl   $0x3e8f,(%esp)
     30d:	e8 ce 36 00 00       	call   39e0 <mkdir>
     312:	83 c4 10             	add    $0x10,%esp
     315:	85 c0                	test   %eax,%eax
     317:	0f 88 88 00 00 00    	js     3a5 <openiputtest+0xb5>
    printf(stdout, "mkdir oidir failed\n");
    exit();
  }
  pid = fork();
     31d:	e8 4e 36 00 00       	call   3970 <fork>
  if(pid < 0){
     322:	85 c0                	test   %eax,%eax
     324:	0f 88 92 00 00 00    	js     3bc <openiputtest+0xcc>
    printf(stdout, "fork failed\n");
    exit();
  }
  if(pid == 0){
     32a:	75 34                	jne    360 <openiputtest+0x70>
    int fd = open("oidir", O_RDWR);
     32c:	83 ec 08             	sub    $0x8,%esp
     32f:	6a 02                	push   $0x2
     331:	68 8f 3e 00 00       	push   $0x3e8f
     336:	e8 7d 36 00 00       	call   39b8 <open>
    if(fd >= 0){
     33b:	83 c4 10             	add    $0x10,%esp
     33e:	85 c0                	test   %eax,%eax
     340:	78 5e                	js     3a0 <openiputtest+0xb0>
      printf(stdout, "open directory for write succeeded\n");
     342:	83 ec 08             	sub    $0x8,%esp
     345:	68 14 4e 00 00       	push   $0x4e14
     34a:	ff 35 0c 5f 00 00    	pushl  0x5f0c
     350:	e8 7b 37 00 00       	call   3ad0 <printf>
      exit();
     355:	e8 1e 36 00 00       	call   3978 <exit>
     35a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    }
    exit();
  }
  sleep(1);
     360:	83 ec 0c             	sub    $0xc,%esp
     363:	6a 01                	push   $0x1
     365:	e8 9e 36 00 00       	call   3a08 <sleep>
  if(unlink("oidir") != 0){
     36a:	c7 04 24 8f 3e 00 00 	movl   $0x3e8f,(%esp)
     371:	e8 52 36 00 00       	call   39c8 <unlink>
     376:	83 c4 10             	add    $0x10,%esp
     379:	85 c0                	test   %eax,%eax
     37b:	75 56                	jne    3d3 <openiputtest+0xe3>
    printf(stdout, "unlink failed\n");
    exit();
  }
  wait();
     37d:	e8 fe 35 00 00       	call   3980 <wait>
  printf(stdout, "openiput test ok\n");
     382:	83 ec 08             	sub    $0x8,%esp
     385:	68 b8 3e 00 00       	push   $0x3eb8
     38a:	ff 35 0c 5f 00 00    	pushl  0x5f0c
     390:	e8 3b 37 00 00       	call   3ad0 <printf>
     395:	83 c4 10             	add    $0x10,%esp
}
     398:	c9                   	leave  
     399:	c3                   	ret    
     39a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    int fd = open("oidir", O_RDWR);
    if(fd >= 0){
      printf(stdout, "open directory for write succeeded\n");
      exit();
    }
    exit();
     3a0:	e8 d3 35 00 00       	call   3978 <exit>
{
  int pid;

  printf(stdout, "openiput test\n");
  if(mkdir("oidir") < 0){
    printf(stdout, "mkdir oidir failed\n");
     3a5:	51                   	push   %ecx
     3a6:	51                   	push   %ecx
     3a7:	68 95 3e 00 00       	push   $0x3e95
     3ac:	ff 35 0c 5f 00 00    	pushl  0x5f0c
     3b2:	e8 19 37 00 00       	call   3ad0 <printf>
    exit();
     3b7:	e8 bc 35 00 00       	call   3978 <exit>
  }
  pid = fork();
  if(pid < 0){
    printf(stdout, "fork failed\n");
     3bc:	52                   	push   %edx
     3bd:	52                   	push   %edx
     3be:	68 31 4d 00 00       	push   $0x4d31
     3c3:	ff 35 0c 5f 00 00    	pushl  0x5f0c
     3c9:	e8 02 37 00 00       	call   3ad0 <printf>
    exit();
     3ce:	e8 a5 35 00 00       	call   3978 <exit>
    }
    exit();
  }
  sleep(1);
  if(unlink("oidir") != 0){
    printf(stdout, "unlink failed\n");
     3d3:	50                   	push   %eax
     3d4:	50                   	push   %eax
     3d5:	68 a9 3e 00 00       	push   $0x3ea9
     3da:	ff 35 0c 5f 00 00    	pushl  0x5f0c
     3e0:	e8 eb 36 00 00       	call   3ad0 <printf>
    exit();
     3e5:	e8 8e 35 00 00       	call   3978 <exit>
     3ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000003f0 <opentest>:

// simple file system tests

void
opentest(void)
{
     3f0:	55                   	push   %ebp
     3f1:	89 e5                	mov    %esp,%ebp
     3f3:	83 ec 10             	sub    $0x10,%esp
  int fd;

  printf(stdout, "open test\n");
     3f6:	68 ca 3e 00 00       	push   $0x3eca
     3fb:	ff 35 0c 5f 00 00    	pushl  0x5f0c
     401:	e8 ca 36 00 00       	call   3ad0 <printf>
  fd = open("echo", 0);
     406:	58                   	pop    %eax
     407:	5a                   	pop    %edx
     408:	6a 00                	push   $0x0
     40a:	68 d5 3e 00 00       	push   $0x3ed5
     40f:	e8 a4 35 00 00       	call   39b8 <open>
  if(fd < 0){
     414:	83 c4 10             	add    $0x10,%esp
     417:	85 c0                	test   %eax,%eax
     419:	78 36                	js     451 <opentest+0x61>
    printf(stdout, "open echo failed!\n");
    exit();
  }
  close(fd);
     41b:	83 ec 0c             	sub    $0xc,%esp
     41e:	50                   	push   %eax
     41f:	e8 7c 35 00 00       	call   39a0 <close>
  fd = open("doesnotexist", 0);
     424:	5a                   	pop    %edx
     425:	59                   	pop    %ecx
     426:	6a 00                	push   $0x0
     428:	68 ed 3e 00 00       	push   $0x3eed
     42d:	e8 86 35 00 00       	call   39b8 <open>
  if(fd >= 0){
     432:	83 c4 10             	add    $0x10,%esp
     435:	85 c0                	test   %eax,%eax
     437:	79 2f                	jns    468 <opentest+0x78>
    printf(stdout, "open doesnotexist succeeded!\n");
    exit();
  }
  printf(stdout, "open test ok\n");
     439:	83 ec 08             	sub    $0x8,%esp
     43c:	68 18 3f 00 00       	push   $0x3f18
     441:	ff 35 0c 5f 00 00    	pushl  0x5f0c
     447:	e8 84 36 00 00       	call   3ad0 <printf>
}
     44c:	83 c4 10             	add    $0x10,%esp
     44f:	c9                   	leave  
     450:	c3                   	ret    
  int fd;

  printf(stdout, "open test\n");
  fd = open("echo", 0);
  if(fd < 0){
    printf(stdout, "open echo failed!\n");
     451:	50                   	push   %eax
     452:	50                   	push   %eax
     453:	68 da 3e 00 00       	push   $0x3eda
     458:	ff 35 0c 5f 00 00    	pushl  0x5f0c
     45e:	e8 6d 36 00 00       	call   3ad0 <printf>
    exit();
     463:	e8 10 35 00 00       	call   3978 <exit>
  }
  close(fd);
  fd = open("doesnotexist", 0);
  if(fd >= 0){
    printf(stdout, "open doesnotexist succeeded!\n");
     468:	50                   	push   %eax
     469:	50                   	push   %eax
     46a:	68 fa 3e 00 00       	push   $0x3efa
     46f:	ff 35 0c 5f 00 00    	pushl  0x5f0c
     475:	e8 56 36 00 00       	call   3ad0 <printf>
    exit();
     47a:	e8 f9 34 00 00       	call   3978 <exit>
     47f:	90                   	nop

00000480 <writetest>:
  printf(stdout, "open test ok\n");
}

void
writetest(void)
{
     480:	55                   	push   %ebp
     481:	89 e5                	mov    %esp,%ebp
     483:	56                   	push   %esi
     484:	53                   	push   %ebx
  int fd;
  int i;

  printf(stdout, "small file test\n");
     485:	83 ec 08             	sub    $0x8,%esp
     488:	68 26 3f 00 00       	push   $0x3f26
     48d:	ff 35 0c 5f 00 00    	pushl  0x5f0c
     493:	e8 38 36 00 00       	call   3ad0 <printf>
  fd = open("small", O_CREATE|O_RDWR);
     498:	59                   	pop    %ecx
     499:	5b                   	pop    %ebx
     49a:	68 02 02 00 00       	push   $0x202
     49f:	68 37 3f 00 00       	push   $0x3f37
     4a4:	e8 0f 35 00 00       	call   39b8 <open>
  if(fd >= 0){
     4a9:	83 c4 10             	add    $0x10,%esp
     4ac:	85 c0                	test   %eax,%eax
     4ae:	0f 88 8b 01 00 00    	js     63f <writetest+0x1bf>
    printf(stdout, "creat small succeeded; ok\n");
     4b4:	83 ec 08             	sub    $0x8,%esp
     4b7:	89 c6                	mov    %eax,%esi
  } else {
    printf(stdout, "error: creat small failed!\n");
    exit();
  }
  for(i = 0; i < 100; i++){
     4b9:	31 db                	xor    %ebx,%ebx
  int i;

  printf(stdout, "small file test\n");
  fd = open("small", O_CREATE|O_RDWR);
  if(fd >= 0){
    printf(stdout, "creat small succeeded; ok\n");
     4bb:	68 3d 3f 00 00       	push   $0x3f3d
     4c0:	ff 35 0c 5f 00 00    	pushl  0x5f0c
     4c6:	e8 05 36 00 00       	call   3ad0 <printf>
     4cb:	83 c4 10             	add    $0x10,%esp
     4ce:	66 90                	xchg   %ax,%ax
  } else {
    printf(stdout, "error: creat small failed!\n");
    exit();
  }
  for(i = 0; i < 100; i++){
    if(write(fd, "aaaaaaaaaa", 10) != 10){
     4d0:	83 ec 04             	sub    $0x4,%esp
     4d3:	6a 0a                	push   $0xa
     4d5:	68 74 3f 00 00       	push   $0x3f74
     4da:	56                   	push   %esi
     4db:	e8 b8 34 00 00       	call   3998 <write>
     4e0:	83 c4 10             	add    $0x10,%esp
     4e3:	83 f8 0a             	cmp    $0xa,%eax
     4e6:	0f 85 d9 00 00 00    	jne    5c5 <writetest+0x145>
      printf(stdout, "error: write aa %d new file failed\n", i);
      exit();
    }
    if(write(fd, "bbbbbbbbbb", 10) != 10){
     4ec:	83 ec 04             	sub    $0x4,%esp
     4ef:	6a 0a                	push   $0xa
     4f1:	68 7f 3f 00 00       	push   $0x3f7f
     4f6:	56                   	push   %esi
     4f7:	e8 9c 34 00 00       	call   3998 <write>
     4fc:	83 c4 10             	add    $0x10,%esp
     4ff:	83 f8 0a             	cmp    $0xa,%eax
     502:	0f 85 d6 00 00 00    	jne    5de <writetest+0x15e>
    printf(stdout, "creat small succeeded; ok\n");
  } else {
    printf(stdout, "error: creat small failed!\n");
    exit();
  }
  for(i = 0; i < 100; i++){
     508:	83 c3 01             	add    $0x1,%ebx
     50b:	83 fb 64             	cmp    $0x64,%ebx
     50e:	75 c0                	jne    4d0 <writetest+0x50>
    if(write(fd, "bbbbbbbbbb", 10) != 10){
      printf(stdout, "error: write bb %d new file failed\n", i);
      exit();
    }
  }
  printf(stdout, "writes ok\n");
     510:	83 ec 08             	sub    $0x8,%esp
     513:	68 8a 3f 00 00       	push   $0x3f8a
     518:	ff 35 0c 5f 00 00    	pushl  0x5f0c
     51e:	e8 ad 35 00 00       	call   3ad0 <printf>
  close(fd);
     523:	89 34 24             	mov    %esi,(%esp)
     526:	e8 75 34 00 00       	call   39a0 <close>
  fd = open("small", O_RDONLY);
     52b:	58                   	pop    %eax
     52c:	5a                   	pop    %edx
     52d:	6a 00                	push   $0x0
     52f:	68 37 3f 00 00       	push   $0x3f37
     534:	e8 7f 34 00 00       	call   39b8 <open>
  if(fd >= 0){
     539:	83 c4 10             	add    $0x10,%esp
     53c:	85 c0                	test   %eax,%eax
      exit();
    }
  }
  printf(stdout, "writes ok\n");
  close(fd);
  fd = open("small", O_RDONLY);
     53e:	89 c3                	mov    %eax,%ebx
  if(fd >= 0){
     540:	0f 88 b1 00 00 00    	js     5f7 <writetest+0x177>
    printf(stdout, "open small succeeded ok\n");
     546:	83 ec 08             	sub    $0x8,%esp
     549:	68 95 3f 00 00       	push   $0x3f95
     54e:	ff 35 0c 5f 00 00    	pushl  0x5f0c
     554:	e8 77 35 00 00       	call   3ad0 <printf>
  } else {
    printf(stdout, "error: open small failed!\n");
    exit();
  }
  i = read(fd, buf, 2000);
     559:	83 c4 0c             	add    $0xc,%esp
     55c:	68 d0 07 00 00       	push   $0x7d0
     561:	68 00 87 00 00       	push   $0x8700
     566:	53                   	push   %ebx
     567:	e8 24 34 00 00       	call   3990 <read>
  if(i == 2000){
     56c:	83 c4 10             	add    $0x10,%esp
     56f:	3d d0 07 00 00       	cmp    $0x7d0,%eax
     574:	0f 85 95 00 00 00    	jne    60f <writetest+0x18f>
    printf(stdout, "read succeeded ok\n");
     57a:	83 ec 08             	sub    $0x8,%esp
     57d:	68 c9 3f 00 00       	push   $0x3fc9
     582:	ff 35 0c 5f 00 00    	pushl  0x5f0c
     588:	e8 43 35 00 00       	call   3ad0 <printf>
  } else {
    printf(stdout, "read failed\n");
    exit();
  }
  close(fd);
     58d:	89 1c 24             	mov    %ebx,(%esp)
     590:	e8 0b 34 00 00       	call   39a0 <close>

  if(unlink("small") < 0){
     595:	c7 04 24 37 3f 00 00 	movl   $0x3f37,(%esp)
     59c:	e8 27 34 00 00       	call   39c8 <unlink>
     5a1:	83 c4 10             	add    $0x10,%esp
     5a4:	85 c0                	test   %eax,%eax
     5a6:	78 7f                	js     627 <writetest+0x1a7>
    printf(stdout, "unlink small failed\n");
    exit();
  }
  printf(stdout, "small file test ok\n");
     5a8:	83 ec 08             	sub    $0x8,%esp
     5ab:	68 f1 3f 00 00       	push   $0x3ff1
     5b0:	ff 35 0c 5f 00 00    	pushl  0x5f0c
     5b6:	e8 15 35 00 00       	call   3ad0 <printf>
}
     5bb:	83 c4 10             	add    $0x10,%esp
     5be:	8d 65 f8             	lea    -0x8(%ebp),%esp
     5c1:	5b                   	pop    %ebx
     5c2:	5e                   	pop    %esi
     5c3:	5d                   	pop    %ebp
     5c4:	c3                   	ret    
    printf(stdout, "error: creat small failed!\n");
    exit();
  }
  for(i = 0; i < 100; i++){
    if(write(fd, "aaaaaaaaaa", 10) != 10){
      printf(stdout, "error: write aa %d new file failed\n", i);
     5c5:	83 ec 04             	sub    $0x4,%esp
     5c8:	53                   	push   %ebx
     5c9:	68 38 4e 00 00       	push   $0x4e38
     5ce:	ff 35 0c 5f 00 00    	pushl  0x5f0c
     5d4:	e8 f7 34 00 00       	call   3ad0 <printf>
      exit();
     5d9:	e8 9a 33 00 00       	call   3978 <exit>
    }
    if(write(fd, "bbbbbbbbbb", 10) != 10){
      printf(stdout, "error: write bb %d new file failed\n", i);
     5de:	83 ec 04             	sub    $0x4,%esp
     5e1:	53                   	push   %ebx
     5e2:	68 5c 4e 00 00       	push   $0x4e5c
     5e7:	ff 35 0c 5f 00 00    	pushl  0x5f0c
     5ed:	e8 de 34 00 00       	call   3ad0 <printf>
      exit();
     5f2:	e8 81 33 00 00       	call   3978 <exit>
  close(fd);
  fd = open("small", O_RDONLY);
  if(fd >= 0){
    printf(stdout, "open small succeeded ok\n");
  } else {
    printf(stdout, "error: open small failed!\n");
     5f7:	83 ec 08             	sub    $0x8,%esp
     5fa:	68 ae 3f 00 00       	push   $0x3fae
     5ff:	ff 35 0c 5f 00 00    	pushl  0x5f0c
     605:	e8 c6 34 00 00       	call   3ad0 <printf>
    exit();
     60a:	e8 69 33 00 00       	call   3978 <exit>
  }
  i = read(fd, buf, 2000);
  if(i == 2000){
    printf(stdout, "read succeeded ok\n");
  } else {
    printf(stdout, "read failed\n");
     60f:	83 ec 08             	sub    $0x8,%esp
     612:	68 f5 42 00 00       	push   $0x42f5
     617:	ff 35 0c 5f 00 00    	pushl  0x5f0c
     61d:	e8 ae 34 00 00       	call   3ad0 <printf>
    exit();
     622:	e8 51 33 00 00       	call   3978 <exit>
  }
  close(fd);

  if(unlink("small") < 0){
    printf(stdout, "unlink small failed\n");
     627:	83 ec 08             	sub    $0x8,%esp
     62a:	68 dc 3f 00 00       	push   $0x3fdc
     62f:	ff 35 0c 5f 00 00    	pushl  0x5f0c
     635:	e8 96 34 00 00       	call   3ad0 <printf>
    exit();
     63a:	e8 39 33 00 00       	call   3978 <exit>
  printf(stdout, "small file test\n");
  fd = open("small", O_CREATE|O_RDWR);
  if(fd >= 0){
    printf(stdout, "creat small succeeded; ok\n");
  } else {
    printf(stdout, "error: creat small failed!\n");
     63f:	83 ec 08             	sub    $0x8,%esp
     642:	68 58 3f 00 00       	push   $0x3f58
     647:	ff 35 0c 5f 00 00    	pushl  0x5f0c
     64d:	e8 7e 34 00 00       	call   3ad0 <printf>
    exit();
     652:	e8 21 33 00 00       	call   3978 <exit>
     657:	89 f6                	mov    %esi,%esi
     659:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000660 <writetest1>:
  printf(stdout, "small file test ok\n");
}

void
writetest1(void)
{
     660:	55                   	push   %ebp
     661:	89 e5                	mov    %esp,%ebp
     663:	56                   	push   %esi
     664:	53                   	push   %ebx
  int i, fd, n;

  printf(stdout, "big files test\n");
     665:	83 ec 08             	sub    $0x8,%esp
     668:	68 05 40 00 00       	push   $0x4005
     66d:	ff 35 0c 5f 00 00    	pushl  0x5f0c
     673:	e8 58 34 00 00       	call   3ad0 <printf>

  fd = open("big", O_CREATE|O_RDWR);
     678:	59                   	pop    %ecx
     679:	5b                   	pop    %ebx
     67a:	68 02 02 00 00       	push   $0x202
     67f:	68 7f 40 00 00       	push   $0x407f
     684:	e8 2f 33 00 00       	call   39b8 <open>
  if(fd < 0){
     689:	83 c4 10             	add    $0x10,%esp
     68c:	85 c0                	test   %eax,%eax
     68e:	0f 88 64 01 00 00    	js     7f8 <writetest1+0x198>
     694:	89 c6                	mov    %eax,%esi
     696:	31 db                	xor    %ebx,%ebx
     698:	90                   	nop
     699:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    exit();
  }

  for(i = 0; i < MAXFILE; i++){
    ((int*)buf)[0] = i;
    if(write(fd, buf, 512) != 512){
     6a0:	83 ec 04             	sub    $0x4,%esp
    printf(stdout, "error: creat big failed!\n");
    exit();
  }

  for(i = 0; i < MAXFILE; i++){
    ((int*)buf)[0] = i;
     6a3:	89 1d 00 87 00 00    	mov    %ebx,0x8700
    if(write(fd, buf, 512) != 512){
     6a9:	68 00 02 00 00       	push   $0x200
     6ae:	68 00 87 00 00       	push   $0x8700
     6b3:	56                   	push   %esi
     6b4:	e8 df 32 00 00       	call   3998 <write>
     6b9:	83 c4 10             	add    $0x10,%esp
     6bc:	3d 00 02 00 00       	cmp    $0x200,%eax
     6c1:	0f 85 b3 00 00 00    	jne    77a <writetest1+0x11a>
  if(fd < 0){
    printf(stdout, "error: creat big failed!\n");
    exit();
  }

  for(i = 0; i < MAXFILE; i++){
     6c7:	83 c3 01             	add    $0x1,%ebx
     6ca:	81 fb 8c 00 00 00    	cmp    $0x8c,%ebx
     6d0:	75 ce                	jne    6a0 <writetest1+0x40>
      printf(stdout, "error: write big file failed\n", i);
      exit();
    }
  }

  close(fd);
     6d2:	83 ec 0c             	sub    $0xc,%esp
     6d5:	56                   	push   %esi
     6d6:	e8 c5 32 00 00       	call   39a0 <close>

  fd = open("big", O_RDONLY);
     6db:	58                   	pop    %eax
     6dc:	5a                   	pop    %edx
     6dd:	6a 00                	push   $0x0
     6df:	68 7f 40 00 00       	push   $0x407f
     6e4:	e8 cf 32 00 00       	call   39b8 <open>
  if(fd < 0){
     6e9:	83 c4 10             	add    $0x10,%esp
     6ec:	85 c0                	test   %eax,%eax
    }
  }

  close(fd);

  fd = open("big", O_RDONLY);
     6ee:	89 c6                	mov    %eax,%esi
  if(fd < 0){
     6f0:	0f 88 ea 00 00 00    	js     7e0 <writetest1+0x180>
     6f6:	31 db                	xor    %ebx,%ebx
     6f8:	eb 1d                	jmp    717 <writetest1+0xb7>
     6fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(n == MAXFILE - 1){
        printf(stdout, "read only %d blocks from big", n);
        exit();
      }
      break;
    } else if(i != 512){
     700:	3d 00 02 00 00       	cmp    $0x200,%eax
     705:	0f 85 9f 00 00 00    	jne    7aa <writetest1+0x14a>
      printf(stdout, "read failed %d\n", i);
      exit();
    }
    if(((int*)buf)[0] != n){
     70b:	a1 00 87 00 00       	mov    0x8700,%eax
     710:	39 c3                	cmp    %eax,%ebx
     712:	75 7f                	jne    793 <writetest1+0x133>
      printf(stdout, "read content of block %d is %d\n",
             n, ((int*)buf)[0]);
      exit();
    }
    n++;
     714:	83 c3 01             	add    $0x1,%ebx
    exit();
  }

  n = 0;
  for(;;){
    i = read(fd, buf, 512);
     717:	83 ec 04             	sub    $0x4,%esp
     71a:	68 00 02 00 00       	push   $0x200
     71f:	68 00 87 00 00       	push   $0x8700
     724:	56                   	push   %esi
     725:	e8 66 32 00 00       	call   3990 <read>
    if(i == 0){
     72a:	83 c4 10             	add    $0x10,%esp
     72d:	85 c0                	test   %eax,%eax
     72f:	75 cf                	jne    700 <writetest1+0xa0>
      if(n == MAXFILE - 1){
     731:	81 fb 8b 00 00 00    	cmp    $0x8b,%ebx
     737:	0f 84 86 00 00 00    	je     7c3 <writetest1+0x163>
             n, ((int*)buf)[0]);
      exit();
    }
    n++;
  }
  close(fd);
     73d:	83 ec 0c             	sub    $0xc,%esp
     740:	56                   	push   %esi
     741:	e8 5a 32 00 00       	call   39a0 <close>
  if(unlink("big") < 0){
     746:	c7 04 24 7f 40 00 00 	movl   $0x407f,(%esp)
     74d:	e8 76 32 00 00       	call   39c8 <unlink>
     752:	83 c4 10             	add    $0x10,%esp
     755:	85 c0                	test   %eax,%eax
     757:	0f 88 b3 00 00 00    	js     810 <writetest1+0x1b0>
    printf(stdout, "unlink big failed\n");
    exit();
  }
  printf(stdout, "big files ok\n");
     75d:	83 ec 08             	sub    $0x8,%esp
     760:	68 a6 40 00 00       	push   $0x40a6
     765:	ff 35 0c 5f 00 00    	pushl  0x5f0c
     76b:	e8 60 33 00 00       	call   3ad0 <printf>
}
     770:	83 c4 10             	add    $0x10,%esp
     773:	8d 65 f8             	lea    -0x8(%ebp),%esp
     776:	5b                   	pop    %ebx
     777:	5e                   	pop    %esi
     778:	5d                   	pop    %ebp
     779:	c3                   	ret    
  }

  for(i = 0; i < MAXFILE; i++){
    ((int*)buf)[0] = i;
    if(write(fd, buf, 512) != 512){
      printf(stdout, "error: write big file failed\n", i);
     77a:	83 ec 04             	sub    $0x4,%esp
     77d:	53                   	push   %ebx
     77e:	68 2f 40 00 00       	push   $0x402f
     783:	ff 35 0c 5f 00 00    	pushl  0x5f0c
     789:	e8 42 33 00 00       	call   3ad0 <printf>
      exit();
     78e:	e8 e5 31 00 00       	call   3978 <exit>
    } else if(i != 512){
      printf(stdout, "read failed %d\n", i);
      exit();
    }
    if(((int*)buf)[0] != n){
      printf(stdout, "read content of block %d is %d\n",
     793:	50                   	push   %eax
     794:	53                   	push   %ebx
     795:	68 80 4e 00 00       	push   $0x4e80
     79a:	ff 35 0c 5f 00 00    	pushl  0x5f0c
     7a0:	e8 2b 33 00 00       	call   3ad0 <printf>
             n, ((int*)buf)[0]);
      exit();
     7a5:	e8 ce 31 00 00       	call   3978 <exit>
        printf(stdout, "read only %d blocks from big", n);
        exit();
      }
      break;
    } else if(i != 512){
      printf(stdout, "read failed %d\n", i);
     7aa:	83 ec 04             	sub    $0x4,%esp
     7ad:	50                   	push   %eax
     7ae:	68 83 40 00 00       	push   $0x4083
     7b3:	ff 35 0c 5f 00 00    	pushl  0x5f0c
     7b9:	e8 12 33 00 00       	call   3ad0 <printf>
      exit();
     7be:	e8 b5 31 00 00       	call   3978 <exit>
  n = 0;
  for(;;){
    i = read(fd, buf, 512);
    if(i == 0){
      if(n == MAXFILE - 1){
        printf(stdout, "read only %d blocks from big", n);
     7c3:	83 ec 04             	sub    $0x4,%esp
     7c6:	68 8b 00 00 00       	push   $0x8b
     7cb:	68 66 40 00 00       	push   $0x4066
     7d0:	ff 35 0c 5f 00 00    	pushl  0x5f0c
     7d6:	e8 f5 32 00 00       	call   3ad0 <printf>
        exit();
     7db:	e8 98 31 00 00       	call   3978 <exit>

  close(fd);

  fd = open("big", O_RDONLY);
  if(fd < 0){
    printf(stdout, "error: open big failed!\n");
     7e0:	83 ec 08             	sub    $0x8,%esp
     7e3:	68 4d 40 00 00       	push   $0x404d
     7e8:	ff 35 0c 5f 00 00    	pushl  0x5f0c
     7ee:	e8 dd 32 00 00       	call   3ad0 <printf>
    exit();
     7f3:	e8 80 31 00 00       	call   3978 <exit>

  printf(stdout, "big files test\n");

  fd = open("big", O_CREATE|O_RDWR);
  if(fd < 0){
    printf(stdout, "error: creat big failed!\n");
     7f8:	83 ec 08             	sub    $0x8,%esp
     7fb:	68 15 40 00 00       	push   $0x4015
     800:	ff 35 0c 5f 00 00    	pushl  0x5f0c
     806:	e8 c5 32 00 00       	call   3ad0 <printf>
    exit();
     80b:	e8 68 31 00 00       	call   3978 <exit>
    }
    n++;
  }
  close(fd);
  if(unlink("big") < 0){
    printf(stdout, "unlink big failed\n");
     810:	83 ec 08             	sub    $0x8,%esp
     813:	68 93 40 00 00       	push   $0x4093
     818:	ff 35 0c 5f 00 00    	pushl  0x5f0c
     81e:	e8 ad 32 00 00       	call   3ad0 <printf>
    exit();
     823:	e8 50 31 00 00       	call   3978 <exit>
     828:	90                   	nop
     829:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000830 <createtest>:
  printf(stdout, "big files ok\n");
}

void
createtest(void)
{
     830:	55                   	push   %ebp
     831:	89 e5                	mov    %esp,%ebp
     833:	53                   	push   %ebx
  int i, fd;

  printf(stdout, "many creates, followed by unlink test\n");

  name[0] = 'a';
  name[2] = '\0';
     834:	bb 30 00 00 00       	mov    $0x30,%ebx
  printf(stdout, "big files ok\n");
}

void
createtest(void)
{
     839:	83 ec 0c             	sub    $0xc,%esp
  int i, fd;

  printf(stdout, "many creates, followed by unlink test\n");
     83c:	68 a0 4e 00 00       	push   $0x4ea0
     841:	ff 35 0c 5f 00 00    	pushl  0x5f0c
     847:	e8 84 32 00 00       	call   3ad0 <printf>

  name[0] = 'a';
     84c:	c6 05 00 a7 00 00 61 	movb   $0x61,0xa700
  name[2] = '\0';
     853:	c6 05 02 a7 00 00 00 	movb   $0x0,0xa702
     85a:	83 c4 10             	add    $0x10,%esp
     85d:	8d 76 00             	lea    0x0(%esi),%esi
  for(i = 0; i < 52; i++){
    name[1] = '0' + i;
    fd = open(name, O_CREATE|O_RDWR);
     860:	83 ec 08             	sub    $0x8,%esp
  printf(stdout, "many creates, followed by unlink test\n");

  name[0] = 'a';
  name[2] = '\0';
  for(i = 0; i < 52; i++){
    name[1] = '0' + i;
     863:	88 1d 01 a7 00 00    	mov    %bl,0xa701
     869:	83 c3 01             	add    $0x1,%ebx
    fd = open(name, O_CREATE|O_RDWR);
     86c:	68 02 02 00 00       	push   $0x202
     871:	68 00 a7 00 00       	push   $0xa700
     876:	e8 3d 31 00 00       	call   39b8 <open>
    close(fd);
     87b:	89 04 24             	mov    %eax,(%esp)
     87e:	e8 1d 31 00 00       	call   39a0 <close>

  printf(stdout, "many creates, followed by unlink test\n");

  name[0] = 'a';
  name[2] = '\0';
  for(i = 0; i < 52; i++){
     883:	83 c4 10             	add    $0x10,%esp
     886:	80 fb 64             	cmp    $0x64,%bl
     889:	75 d5                	jne    860 <createtest+0x30>
    name[1] = '0' + i;
    fd = open(name, O_CREATE|O_RDWR);
    close(fd);
  }
  name[0] = 'a';
     88b:	c6 05 00 a7 00 00 61 	movb   $0x61,0xa700
  name[2] = '\0';
     892:	c6 05 02 a7 00 00 00 	movb   $0x0,0xa702
     899:	bb 30 00 00 00       	mov    $0x30,%ebx
     89e:	66 90                	xchg   %ax,%ax
  for(i = 0; i < 52; i++){
    name[1] = '0' + i;
    unlink(name);
     8a0:	83 ec 0c             	sub    $0xc,%esp
    close(fd);
  }
  name[0] = 'a';
  name[2] = '\0';
  for(i = 0; i < 52; i++){
    name[1] = '0' + i;
     8a3:	88 1d 01 a7 00 00    	mov    %bl,0xa701
     8a9:	83 c3 01             	add    $0x1,%ebx
    unlink(name);
     8ac:	68 00 a7 00 00       	push   $0xa700
     8b1:	e8 12 31 00 00       	call   39c8 <unlink>
    fd = open(name, O_CREATE|O_RDWR);
    close(fd);
  }
  name[0] = 'a';
  name[2] = '\0';
  for(i = 0; i < 52; i++){
     8b6:	83 c4 10             	add    $0x10,%esp
     8b9:	80 fb 64             	cmp    $0x64,%bl
     8bc:	75 e2                	jne    8a0 <createtest+0x70>
    name[1] = '0' + i;
    unlink(name);
  }
  printf(stdout, "many creates, followed by unlink; ok\n");
     8be:	83 ec 08             	sub    $0x8,%esp
     8c1:	68 c8 4e 00 00       	push   $0x4ec8
     8c6:	ff 35 0c 5f 00 00    	pushl  0x5f0c
     8cc:	e8 ff 31 00 00       	call   3ad0 <printf>
}
     8d1:	83 c4 10             	add    $0x10,%esp
     8d4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     8d7:	c9                   	leave  
     8d8:	c3                   	ret    
     8d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000008e0 <dirtest>:

void dirtest(void)
{
     8e0:	55                   	push   %ebp
     8e1:	89 e5                	mov    %esp,%ebp
     8e3:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "mkdir test\n");
     8e6:	68 b4 40 00 00       	push   $0x40b4
     8eb:	ff 35 0c 5f 00 00    	pushl  0x5f0c
     8f1:	e8 da 31 00 00       	call   3ad0 <printf>

  if(mkdir("dir0") < 0){
     8f6:	c7 04 24 c0 40 00 00 	movl   $0x40c0,(%esp)
     8fd:	e8 de 30 00 00       	call   39e0 <mkdir>
     902:	83 c4 10             	add    $0x10,%esp
     905:	85 c0                	test   %eax,%eax
     907:	78 58                	js     961 <dirtest+0x81>
    printf(stdout, "mkdir failed\n");
    exit();
  }

  if(chdir("dir0") < 0){
     909:	83 ec 0c             	sub    $0xc,%esp
     90c:	68 c0 40 00 00       	push   $0x40c0
     911:	e8 d2 30 00 00       	call   39e8 <chdir>
     916:	83 c4 10             	add    $0x10,%esp
     919:	85 c0                	test   %eax,%eax
     91b:	0f 88 85 00 00 00    	js     9a6 <dirtest+0xc6>
    printf(stdout, "chdir dir0 failed\n");
    exit();
  }

  if(chdir("..") < 0){
     921:	83 ec 0c             	sub    $0xc,%esp
     924:	68 65 46 00 00       	push   $0x4665
     929:	e8 ba 30 00 00       	call   39e8 <chdir>
     92e:	83 c4 10             	add    $0x10,%esp
     931:	85 c0                	test   %eax,%eax
     933:	78 5a                	js     98f <dirtest+0xaf>
    printf(stdout, "chdir .. failed\n");
    exit();
  }

  if(unlink("dir0") < 0){
     935:	83 ec 0c             	sub    $0xc,%esp
     938:	68 c0 40 00 00       	push   $0x40c0
     93d:	e8 86 30 00 00       	call   39c8 <unlink>
     942:	83 c4 10             	add    $0x10,%esp
     945:	85 c0                	test   %eax,%eax
     947:	78 2f                	js     978 <dirtest+0x98>
    printf(stdout, "unlink dir0 failed\n");
    exit();
  }
  printf(stdout, "mkdir test ok\n");
     949:	83 ec 08             	sub    $0x8,%esp
     94c:	68 fd 40 00 00       	push   $0x40fd
     951:	ff 35 0c 5f 00 00    	pushl  0x5f0c
     957:	e8 74 31 00 00       	call   3ad0 <printf>
}
     95c:	83 c4 10             	add    $0x10,%esp
     95f:	c9                   	leave  
     960:	c3                   	ret    
void dirtest(void)
{
  printf(stdout, "mkdir test\n");

  if(mkdir("dir0") < 0){
    printf(stdout, "mkdir failed\n");
     961:	50                   	push   %eax
     962:	50                   	push   %eax
     963:	68 f0 3d 00 00       	push   $0x3df0
     968:	ff 35 0c 5f 00 00    	pushl  0x5f0c
     96e:	e8 5d 31 00 00       	call   3ad0 <printf>
    exit();
     973:	e8 00 30 00 00       	call   3978 <exit>
    printf(stdout, "chdir .. failed\n");
    exit();
  }

  if(unlink("dir0") < 0){
    printf(stdout, "unlink dir0 failed\n");
     978:	50                   	push   %eax
     979:	50                   	push   %eax
     97a:	68 e9 40 00 00       	push   $0x40e9
     97f:	ff 35 0c 5f 00 00    	pushl  0x5f0c
     985:	e8 46 31 00 00       	call   3ad0 <printf>
    exit();
     98a:	e8 e9 2f 00 00       	call   3978 <exit>
    printf(stdout, "chdir dir0 failed\n");
    exit();
  }

  if(chdir("..") < 0){
    printf(stdout, "chdir .. failed\n");
     98f:	52                   	push   %edx
     990:	52                   	push   %edx
     991:	68 d8 40 00 00       	push   $0x40d8
     996:	ff 35 0c 5f 00 00    	pushl  0x5f0c
     99c:	e8 2f 31 00 00       	call   3ad0 <printf>
    exit();
     9a1:	e8 d2 2f 00 00       	call   3978 <exit>
    printf(stdout, "mkdir failed\n");
    exit();
  }

  if(chdir("dir0") < 0){
    printf(stdout, "chdir dir0 failed\n");
     9a6:	51                   	push   %ecx
     9a7:	51                   	push   %ecx
     9a8:	68 c5 40 00 00       	push   $0x40c5
     9ad:	ff 35 0c 5f 00 00    	pushl  0x5f0c
     9b3:	e8 18 31 00 00       	call   3ad0 <printf>
    exit();
     9b8:	e8 bb 2f 00 00       	call   3978 <exit>
     9bd:	8d 76 00             	lea    0x0(%esi),%esi

000009c0 <exectest>:
  printf(stdout, "mkdir test ok\n");
}

void
exectest(void)
{
     9c0:	55                   	push   %ebp
     9c1:	89 e5                	mov    %esp,%ebp
     9c3:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "exec test\n");
     9c6:	68 0c 41 00 00       	push   $0x410c
     9cb:	ff 35 0c 5f 00 00    	pushl  0x5f0c
     9d1:	e8 fa 30 00 00       	call   3ad0 <printf>
  if(exec("echo", echoargv) < 0){
     9d6:	5a                   	pop    %edx
     9d7:	59                   	pop    %ecx
     9d8:	68 10 5f 00 00       	push   $0x5f10
     9dd:	68 d5 3e 00 00       	push   $0x3ed5
     9e2:	e8 c9 2f 00 00       	call   39b0 <exec>
     9e7:	83 c4 10             	add    $0x10,%esp
     9ea:	85 c0                	test   %eax,%eax
     9ec:	78 02                	js     9f0 <exectest+0x30>
    printf(stdout, "exec echo failed\n");
    exit();
  }
}
     9ee:	c9                   	leave  
     9ef:	c3                   	ret    
void
exectest(void)
{
  printf(stdout, "exec test\n");
  if(exec("echo", echoargv) < 0){
    printf(stdout, "exec echo failed\n");
     9f0:	50                   	push   %eax
     9f1:	50                   	push   %eax
     9f2:	68 17 41 00 00       	push   $0x4117
     9f7:	ff 35 0c 5f 00 00    	pushl  0x5f0c
     9fd:	e8 ce 30 00 00       	call   3ad0 <printf>
    exit();
     a02:	e8 71 2f 00 00       	call   3978 <exit>
     a07:	89 f6                	mov    %esi,%esi
     a09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000a10 <pipe1>:

// simple fork and pipe read/write

void
pipe1(void)
{
     a10:	55                   	push   %ebp
     a11:	89 e5                	mov    %esp,%ebp
     a13:	57                   	push   %edi
     a14:	56                   	push   %esi
     a15:	53                   	push   %ebx
  int fds[2], pid;
  int seq, i, n, cc, total;

  if(pipe(fds) != 0){
     a16:	8d 45 e0             	lea    -0x20(%ebp),%eax

// simple fork and pipe read/write

void
pipe1(void)
{
     a19:	83 ec 38             	sub    $0x38,%esp
  int fds[2], pid;
  int seq, i, n, cc, total;

  if(pipe(fds) != 0){
     a1c:	50                   	push   %eax
     a1d:	e8 66 2f 00 00       	call   3988 <pipe>
     a22:	83 c4 10             	add    $0x10,%esp
     a25:	85 c0                	test   %eax,%eax
     a27:	0f 85 3d 01 00 00    	jne    b6a <pipe1+0x15a>
     a2d:	89 c3                	mov    %eax,%ebx
    printf(1, "pipe() failed\n");
    exit();
  }
  pid = fork();
     a2f:	e8 3c 2f 00 00       	call   3970 <fork>
  seq = 0;
  if(pid == 0){
     a34:	83 f8 00             	cmp    $0x0,%eax

  if(pipe(fds) != 0){
    printf(1, "pipe() failed\n");
    exit();
  }
  pid = fork();
     a37:	89 c6                	mov    %eax,%esi
  seq = 0;
  if(pid == 0){
     a39:	0f 84 8a 00 00 00    	je     ac9 <pipe1+0xb9>
        printf(1, "pipe1 oops 1\n");
        exit();
      }
    }
    exit();
  } else if(pid > 0){
     a3f:	0f 8e 39 01 00 00    	jle    b7e <pipe1+0x16e>
    close(fds[1]);
     a45:	83 ec 0c             	sub    $0xc,%esp
     a48:	ff 75 e4             	pushl  -0x1c(%ebp)
    total = 0;
    cc = 1;
     a4b:	bf 01 00 00 00       	mov    $0x1,%edi
        exit();
      }
    }
    exit();
  } else if(pid > 0){
    close(fds[1]);
     a50:	e8 4b 2f 00 00       	call   39a0 <close>
    total = 0;
    cc = 1;
    while((n = read(fds[0], buf, cc)) > 0){
     a55:	83 c4 10             	add    $0x10,%esp
      }
    }
    exit();
  } else if(pid > 0){
    close(fds[1]);
    total = 0;
     a58:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    cc = 1;
    while((n = read(fds[0], buf, cc)) > 0){
     a5f:	83 ec 04             	sub    $0x4,%esp
     a62:	57                   	push   %edi
     a63:	68 00 87 00 00       	push   $0x8700
     a68:	ff 75 e0             	pushl  -0x20(%ebp)
     a6b:	e8 20 2f 00 00       	call   3990 <read>
     a70:	83 c4 10             	add    $0x10,%esp
     a73:	85 c0                	test   %eax,%eax
     a75:	0f 8e a9 00 00 00    	jle    b24 <pipe1+0x114>
      for(i = 0; i < n; i++){
        if((buf[i] & 0xff) != (seq++ & 0xff)){
     a7b:	89 d9                	mov    %ebx,%ecx
     a7d:	8d 34 18             	lea    (%eax,%ebx,1),%esi
     a80:	f7 d9                	neg    %ecx
     a82:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     a88:	38 9c 0b 00 87 00 00 	cmp    %bl,0x8700(%ebx,%ecx,1)
     a8f:	8d 53 01             	lea    0x1(%ebx),%edx
     a92:	75 1b                	jne    aaf <pipe1+0x9f>
  } else if(pid > 0){
    close(fds[1]);
    total = 0;
    cc = 1;
    while((n = read(fds[0], buf, cc)) > 0){
      for(i = 0; i < n; i++){
     a94:	39 f2                	cmp    %esi,%edx
     a96:	89 d3                	mov    %edx,%ebx
     a98:	75 ee                	jne    a88 <pipe1+0x78>
          printf(1, "pipe1 oops 2\n");
          return;
        }
      }
      total += n;
      cc = cc * 2;
     a9a:	01 ff                	add    %edi,%edi
        if((buf[i] & 0xff) != (seq++ & 0xff)){
          printf(1, "pipe1 oops 2\n");
          return;
        }
      }
      total += n;
     a9c:	01 45 d4             	add    %eax,-0x2c(%ebp)
     a9f:	b8 00 20 00 00       	mov    $0x2000,%eax
     aa4:	81 ff 00 20 00 00    	cmp    $0x2000,%edi
     aaa:	0f 4f f8             	cmovg  %eax,%edi
     aad:	eb b0                	jmp    a5f <pipe1+0x4f>
    total = 0;
    cc = 1;
    while((n = read(fds[0], buf, cc)) > 0){
      for(i = 0; i < n; i++){
        if((buf[i] & 0xff) != (seq++ & 0xff)){
          printf(1, "pipe1 oops 2\n");
     aaf:	83 ec 08             	sub    $0x8,%esp
     ab2:	68 46 41 00 00       	push   $0x4146
     ab7:	6a 01                	push   $0x1
     ab9:	e8 12 30 00 00       	call   3ad0 <printf>
          return;
     abe:	83 c4 10             	add    $0x10,%esp
  } else {
    printf(1, "fork() failed\n");
    exit();
  }
  printf(1, "pipe1 ok\n");
}
     ac1:	8d 65 f4             	lea    -0xc(%ebp),%esp
     ac4:	5b                   	pop    %ebx
     ac5:	5e                   	pop    %esi
     ac6:	5f                   	pop    %edi
     ac7:	5d                   	pop    %ebp
     ac8:	c3                   	ret    
    exit();
  }
  pid = fork();
  seq = 0;
  if(pid == 0){
    close(fds[0]);
     ac9:	83 ec 0c             	sub    $0xc,%esp
     acc:	ff 75 e0             	pushl  -0x20(%ebp)
     acf:	e8 cc 2e 00 00       	call   39a0 <close>
     ad4:	83 c4 10             	add    $0x10,%esp
    for(n = 0; n < 5; n++){
      for(i = 0; i < 1033; i++)
        buf[i] = seq++;
     ad7:	89 f0                	mov    %esi,%eax
     ad9:	8d 96 09 04 00 00    	lea    0x409(%esi),%edx

// simple fork and pipe read/write

void
pipe1(void)
{
     adf:	89 f3                	mov    %esi,%ebx
  seq = 0;
  if(pid == 0){
    close(fds[0]);
    for(n = 0; n < 5; n++){
      for(i = 0; i < 1033; i++)
        buf[i] = seq++;
     ae1:	f7 d8                	neg    %eax
     ae3:	90                   	nop
     ae4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     ae8:	88 9c 18 00 87 00 00 	mov    %bl,0x8700(%eax,%ebx,1)
     aef:	83 c3 01             	add    $0x1,%ebx
  pid = fork();
  seq = 0;
  if(pid == 0){
    close(fds[0]);
    for(n = 0; n < 5; n++){
      for(i = 0; i < 1033; i++)
     af2:	39 d3                	cmp    %edx,%ebx
     af4:	75 f2                	jne    ae8 <pipe1+0xd8>
        buf[i] = seq++;
      if(write(fds[1], buf, 1033) != 1033){
     af6:	83 ec 04             	sub    $0x4,%esp
     af9:	89 de                	mov    %ebx,%esi
     afb:	68 09 04 00 00       	push   $0x409
     b00:	68 00 87 00 00       	push   $0x8700
     b05:	ff 75 e4             	pushl  -0x1c(%ebp)
     b08:	e8 8b 2e 00 00       	call   3998 <write>
     b0d:	83 c4 10             	add    $0x10,%esp
     b10:	3d 09 04 00 00       	cmp    $0x409,%eax
     b15:	75 7b                	jne    b92 <pipe1+0x182>
  }
  pid = fork();
  seq = 0;
  if(pid == 0){
    close(fds[0]);
    for(n = 0; n < 5; n++){
     b17:	81 fb 2d 14 00 00    	cmp    $0x142d,%ebx
     b1d:	75 b8                	jne    ad7 <pipe1+0xc7>
      if(write(fds[1], buf, 1033) != 1033){
        printf(1, "pipe1 oops 1\n");
        exit();
      }
    }
    exit();
     b1f:	e8 54 2e 00 00       	call   3978 <exit>
      total += n;
      cc = cc * 2;
      if(cc > sizeof(buf))
        cc = sizeof(buf);
    }
    if(total != 5 * 1033){
     b24:	81 7d d4 2d 14 00 00 	cmpl   $0x142d,-0x2c(%ebp)
     b2b:	75 26                	jne    b53 <pipe1+0x143>
      printf(1, "pipe1 oops 3 total %d\n", total);
      exit();
    }
    close(fds[0]);
     b2d:	83 ec 0c             	sub    $0xc,%esp
     b30:	ff 75 e0             	pushl  -0x20(%ebp)
     b33:	e8 68 2e 00 00       	call   39a0 <close>
    wait();
     b38:	e8 43 2e 00 00       	call   3980 <wait>
  } else {
    printf(1, "fork() failed\n");
    exit();
  }
  printf(1, "pipe1 ok\n");
     b3d:	58                   	pop    %eax
     b3e:	5a                   	pop    %edx
     b3f:	68 6b 41 00 00       	push   $0x416b
     b44:	6a 01                	push   $0x1
     b46:	e8 85 2f 00 00       	call   3ad0 <printf>
     b4b:	83 c4 10             	add    $0x10,%esp
     b4e:	e9 6e ff ff ff       	jmp    ac1 <pipe1+0xb1>
      cc = cc * 2;
      if(cc > sizeof(buf))
        cc = sizeof(buf);
    }
    if(total != 5 * 1033){
      printf(1, "pipe1 oops 3 total %d\n", total);
     b53:	83 ec 04             	sub    $0x4,%esp
     b56:	ff 75 d4             	pushl  -0x2c(%ebp)
     b59:	68 54 41 00 00       	push   $0x4154
     b5e:	6a 01                	push   $0x1
     b60:	e8 6b 2f 00 00       	call   3ad0 <printf>
      exit();
     b65:	e8 0e 2e 00 00       	call   3978 <exit>
{
  int fds[2], pid;
  int seq, i, n, cc, total;

  if(pipe(fds) != 0){
    printf(1, "pipe() failed\n");
     b6a:	83 ec 08             	sub    $0x8,%esp
     b6d:	68 29 41 00 00       	push   $0x4129
     b72:	6a 01                	push   $0x1
     b74:	e8 57 2f 00 00       	call   3ad0 <printf>
    exit();
     b79:	e8 fa 2d 00 00       	call   3978 <exit>
      exit();
    }
    close(fds[0]);
    wait();
  } else {
    printf(1, "fork() failed\n");
     b7e:	83 ec 08             	sub    $0x8,%esp
     b81:	68 75 41 00 00       	push   $0x4175
     b86:	6a 01                	push   $0x1
     b88:	e8 43 2f 00 00       	call   3ad0 <printf>
    exit();
     b8d:	e8 e6 2d 00 00       	call   3978 <exit>
    close(fds[0]);
    for(n = 0; n < 5; n++){
      for(i = 0; i < 1033; i++)
        buf[i] = seq++;
      if(write(fds[1], buf, 1033) != 1033){
        printf(1, "pipe1 oops 1\n");
     b92:	83 ec 08             	sub    $0x8,%esp
     b95:	68 38 41 00 00       	push   $0x4138
     b9a:	6a 01                	push   $0x1
     b9c:	e8 2f 2f 00 00       	call   3ad0 <printf>
        exit();
     ba1:	e8 d2 2d 00 00       	call   3978 <exit>
     ba6:	8d 76 00             	lea    0x0(%esi),%esi
     ba9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000bb0 <preempt>:
}

// meant to be run w/ at most two CPUs
void
preempt(void)
{
     bb0:	55                   	push   %ebp
     bb1:	89 e5                	mov    %esp,%ebp
     bb3:	57                   	push   %edi
     bb4:	56                   	push   %esi
     bb5:	53                   	push   %ebx
     bb6:	83 ec 24             	sub    $0x24,%esp
  int pid1, pid2, pid3;
  int pfds[2];

  printf(1, "preempt: ");
     bb9:	68 84 41 00 00       	push   $0x4184
     bbe:	6a 01                	push   $0x1
     bc0:	e8 0b 2f 00 00       	call   3ad0 <printf>
  pid1 = fork();
     bc5:	e8 a6 2d 00 00       	call   3970 <fork>
  if(pid1 == 0)
     bca:	83 c4 10             	add    $0x10,%esp
     bcd:	85 c0                	test   %eax,%eax
     bcf:	75 02                	jne    bd3 <preempt+0x23>
     bd1:	eb fe                	jmp    bd1 <preempt+0x21>
     bd3:	89 c7                	mov    %eax,%edi
    for(;;)
      ;

  pid2 = fork();
     bd5:	e8 96 2d 00 00       	call   3970 <fork>
  if(pid2 == 0)
     bda:	85 c0                	test   %eax,%eax
  pid1 = fork();
  if(pid1 == 0)
    for(;;)
      ;

  pid2 = fork();
     bdc:	89 c6                	mov    %eax,%esi
  if(pid2 == 0)
     bde:	75 02                	jne    be2 <preempt+0x32>
     be0:	eb fe                	jmp    be0 <preempt+0x30>
    for(;;)
      ;

  pipe(pfds);
     be2:	8d 45 e0             	lea    -0x20(%ebp),%eax
     be5:	83 ec 0c             	sub    $0xc,%esp
     be8:	50                   	push   %eax
     be9:	e8 9a 2d 00 00       	call   3988 <pipe>
  pid3 = fork();
     bee:	e8 7d 2d 00 00       	call   3970 <fork>
  if(pid3 == 0){
     bf3:	83 c4 10             	add    $0x10,%esp
     bf6:	85 c0                	test   %eax,%eax
  if(pid2 == 0)
    for(;;)
      ;

  pipe(pfds);
  pid3 = fork();
     bf8:	89 c3                	mov    %eax,%ebx
  if(pid3 == 0){
     bfa:	75 47                	jne    c43 <preempt+0x93>
    close(pfds[0]);
     bfc:	83 ec 0c             	sub    $0xc,%esp
     bff:	ff 75 e0             	pushl  -0x20(%ebp)
     c02:	e8 99 2d 00 00       	call   39a0 <close>
    if(write(pfds[1], "x", 1) != 1)
     c07:	83 c4 0c             	add    $0xc,%esp
     c0a:	6a 01                	push   $0x1
     c0c:	68 49 47 00 00       	push   $0x4749
     c11:	ff 75 e4             	pushl  -0x1c(%ebp)
     c14:	e8 7f 2d 00 00       	call   3998 <write>
     c19:	83 c4 10             	add    $0x10,%esp
     c1c:	83 f8 01             	cmp    $0x1,%eax
     c1f:	74 12                	je     c33 <preempt+0x83>
      printf(1, "preempt write error");
     c21:	83 ec 08             	sub    $0x8,%esp
     c24:	68 8e 41 00 00       	push   $0x418e
     c29:	6a 01                	push   $0x1
     c2b:	e8 a0 2e 00 00       	call   3ad0 <printf>
     c30:	83 c4 10             	add    $0x10,%esp
    close(pfds[1]);
     c33:	83 ec 0c             	sub    $0xc,%esp
     c36:	ff 75 e4             	pushl  -0x1c(%ebp)
     c39:	e8 62 2d 00 00       	call   39a0 <close>
     c3e:	83 c4 10             	add    $0x10,%esp
     c41:	eb fe                	jmp    c41 <preempt+0x91>
    for(;;)
      ;
  }

  close(pfds[1]);
     c43:	83 ec 0c             	sub    $0xc,%esp
     c46:	ff 75 e4             	pushl  -0x1c(%ebp)
     c49:	e8 52 2d 00 00       	call   39a0 <close>
  if(read(pfds[0], buf, sizeof(buf)) != 1){
     c4e:	83 c4 0c             	add    $0xc,%esp
     c51:	68 00 20 00 00       	push   $0x2000
     c56:	68 00 87 00 00       	push   $0x8700
     c5b:	ff 75 e0             	pushl  -0x20(%ebp)
     c5e:	e8 2d 2d 00 00       	call   3990 <read>
     c63:	83 c4 10             	add    $0x10,%esp
     c66:	83 f8 01             	cmp    $0x1,%eax
     c69:	74 1a                	je     c85 <preempt+0xd5>
    printf(1, "preempt read error");
     c6b:	83 ec 08             	sub    $0x8,%esp
     c6e:	68 a2 41 00 00       	push   $0x41a2
     c73:	6a 01                	push   $0x1
     c75:	e8 56 2e 00 00       	call   3ad0 <printf>
    return;
     c7a:	83 c4 10             	add    $0x10,%esp
  printf(1, "wait... ");
  wait();
  wait();
  wait();
  printf(1, "preempt ok\n");
}
     c7d:	8d 65 f4             	lea    -0xc(%ebp),%esp
     c80:	5b                   	pop    %ebx
     c81:	5e                   	pop    %esi
     c82:	5f                   	pop    %edi
     c83:	5d                   	pop    %ebp
     c84:	c3                   	ret    
  close(pfds[1]);
  if(read(pfds[0], buf, sizeof(buf)) != 1){
    printf(1, "preempt read error");
    return;
  }
  close(pfds[0]);
     c85:	83 ec 0c             	sub    $0xc,%esp
     c88:	ff 75 e0             	pushl  -0x20(%ebp)
     c8b:	e8 10 2d 00 00       	call   39a0 <close>
  printf(1, "kill... ");
     c90:	58                   	pop    %eax
     c91:	5a                   	pop    %edx
     c92:	68 b5 41 00 00       	push   $0x41b5
     c97:	6a 01                	push   $0x1
     c99:	e8 32 2e 00 00       	call   3ad0 <printf>
  kill(pid1);
     c9e:	89 3c 24             	mov    %edi,(%esp)
     ca1:	e8 02 2d 00 00       	call   39a8 <kill>
  kill(pid2);
     ca6:	89 34 24             	mov    %esi,(%esp)
     ca9:	e8 fa 2c 00 00       	call   39a8 <kill>
  kill(pid3);
     cae:	89 1c 24             	mov    %ebx,(%esp)
     cb1:	e8 f2 2c 00 00       	call   39a8 <kill>
  printf(1, "wait... ");
     cb6:	59                   	pop    %ecx
     cb7:	5b                   	pop    %ebx
     cb8:	68 be 41 00 00       	push   $0x41be
     cbd:	6a 01                	push   $0x1
     cbf:	e8 0c 2e 00 00       	call   3ad0 <printf>
  wait();
     cc4:	e8 b7 2c 00 00       	call   3980 <wait>
  wait();
     cc9:	e8 b2 2c 00 00       	call   3980 <wait>
  wait();
     cce:	e8 ad 2c 00 00       	call   3980 <wait>
  printf(1, "preempt ok\n");
     cd3:	5e                   	pop    %esi
     cd4:	5f                   	pop    %edi
     cd5:	68 c7 41 00 00       	push   $0x41c7
     cda:	6a 01                	push   $0x1
     cdc:	e8 ef 2d 00 00       	call   3ad0 <printf>
     ce1:	83 c4 10             	add    $0x10,%esp
     ce4:	eb 97                	jmp    c7d <preempt+0xcd>
     ce6:	8d 76 00             	lea    0x0(%esi),%esi
     ce9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000cf0 <exitwait>:
}

// try to find any races between exit and wait
void
exitwait(void)
{
     cf0:	55                   	push   %ebp
     cf1:	89 e5                	mov    %esp,%ebp
     cf3:	56                   	push   %esi
     cf4:	be 64 00 00 00       	mov    $0x64,%esi
     cf9:	53                   	push   %ebx
     cfa:	eb 14                	jmp    d10 <exitwait+0x20>
     cfc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    pid = fork();
    if(pid < 0){
      printf(1, "fork failed\n");
      return;
    }
    if(pid){
     d00:	74 6f                	je     d71 <exitwait+0x81>
      if(wait() != pid){
     d02:	e8 79 2c 00 00       	call   3980 <wait>
     d07:	39 c3                	cmp    %eax,%ebx
     d09:	75 2d                	jne    d38 <exitwait+0x48>
void
exitwait(void)
{
  int i, pid;

  for(i = 0; i < 100; i++){
     d0b:	83 ee 01             	sub    $0x1,%esi
     d0e:	74 48                	je     d58 <exitwait+0x68>
    pid = fork();
     d10:	e8 5b 2c 00 00       	call   3970 <fork>
    if(pid < 0){
     d15:	85 c0                	test   %eax,%eax
exitwait(void)
{
  int i, pid;

  for(i = 0; i < 100; i++){
    pid = fork();
     d17:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
     d19:	79 e5                	jns    d00 <exitwait+0x10>
      printf(1, "fork failed\n");
     d1b:	83 ec 08             	sub    $0x8,%esp
     d1e:	68 31 4d 00 00       	push   $0x4d31
     d23:	6a 01                	push   $0x1
     d25:	e8 a6 2d 00 00       	call   3ad0 <printf>
      return;
     d2a:	83 c4 10             	add    $0x10,%esp
    } else {
      exit();
    }
  }
  printf(1, "exitwait ok\n");
}
     d2d:	8d 65 f8             	lea    -0x8(%ebp),%esp
     d30:	5b                   	pop    %ebx
     d31:	5e                   	pop    %esi
     d32:	5d                   	pop    %ebp
     d33:	c3                   	ret    
     d34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      printf(1, "fork failed\n");
      return;
    }
    if(pid){
      if(wait() != pid){
        printf(1, "wait wrong pid\n");
     d38:	83 ec 08             	sub    $0x8,%esp
     d3b:	68 d3 41 00 00       	push   $0x41d3
     d40:	6a 01                	push   $0x1
     d42:	e8 89 2d 00 00       	call   3ad0 <printf>
        return;
     d47:	83 c4 10             	add    $0x10,%esp
    } else {
      exit();
    }
  }
  printf(1, "exitwait ok\n");
}
     d4a:	8d 65 f8             	lea    -0x8(%ebp),%esp
     d4d:	5b                   	pop    %ebx
     d4e:	5e                   	pop    %esi
     d4f:	5d                   	pop    %ebp
     d50:	c3                   	ret    
     d51:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      }
    } else {
      exit();
    }
  }
  printf(1, "exitwait ok\n");
     d58:	83 ec 08             	sub    $0x8,%esp
     d5b:	68 e3 41 00 00       	push   $0x41e3
     d60:	6a 01                	push   $0x1
     d62:	e8 69 2d 00 00       	call   3ad0 <printf>
     d67:	83 c4 10             	add    $0x10,%esp
}
     d6a:	8d 65 f8             	lea    -0x8(%ebp),%esp
     d6d:	5b                   	pop    %ebx
     d6e:	5e                   	pop    %esi
     d6f:	5d                   	pop    %ebp
     d70:	c3                   	ret    
      if(wait() != pid){
        printf(1, "wait wrong pid\n");
        return;
      }
    } else {
      exit();
     d71:	e8 02 2c 00 00       	call   3978 <exit>
     d76:	8d 76 00             	lea    0x0(%esi),%esi
     d79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000d80 <mem>:
  printf(1, "exitwait ok\n");
}

void
mem(void)
{
     d80:	55                   	push   %ebp
     d81:	89 e5                	mov    %esp,%ebp
     d83:	57                   	push   %edi
     d84:	56                   	push   %esi
     d85:	53                   	push   %ebx
     d86:	83 ec 14             	sub    $0x14,%esp
  void *m1, *m2;
  int pid, ppid;

  printf(1, "mem test\n");
     d89:	68 f0 41 00 00       	push   $0x41f0
     d8e:	6a 01                	push   $0x1
     d90:	e8 3b 2d 00 00       	call   3ad0 <printf>
  ppid = getpid();
     d95:	e8 5e 2c 00 00       	call   39f8 <getpid>
     d9a:	89 c6                	mov    %eax,%esi
  if((pid = fork()) == 0){
     d9c:	e8 cf 2b 00 00       	call   3970 <fork>
     da1:	83 c4 10             	add    $0x10,%esp
     da4:	85 c0                	test   %eax,%eax
     da6:	75 70                	jne    e18 <mem+0x98>
     da8:	31 db                	xor    %ebx,%ebx
     daa:	eb 08                	jmp    db4 <mem+0x34>
     dac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    m1 = 0;
    while((m2 = malloc(10001)) != 0){
      *(char**)m2 = m1;
     db0:	89 18                	mov    %ebx,(%eax)
     db2:	89 c3                	mov    %eax,%ebx

  printf(1, "mem test\n");
  ppid = getpid();
  if((pid = fork()) == 0){
    m1 = 0;
    while((m2 = malloc(10001)) != 0){
     db4:	83 ec 0c             	sub    $0xc,%esp
     db7:	68 11 27 00 00       	push   $0x2711
     dbc:	e8 4f 2f 00 00       	call   3d10 <malloc>
     dc1:	83 c4 10             	add    $0x10,%esp
     dc4:	85 c0                	test   %eax,%eax
     dc6:	75 e8                	jne    db0 <mem+0x30>
      *(char**)m2 = m1;
      m1 = m2;
    }
    while(m1){
     dc8:	85 db                	test   %ebx,%ebx
     dca:	74 18                	je     de4 <mem+0x64>
     dcc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      m2 = *(char**)m1;
     dd0:	8b 3b                	mov    (%ebx),%edi
      free(m1);
     dd2:	83 ec 0c             	sub    $0xc,%esp
     dd5:	53                   	push   %ebx
     dd6:	89 fb                	mov    %edi,%ebx
     dd8:	e8 a3 2e 00 00       	call   3c80 <free>
    m1 = 0;
    while((m2 = malloc(10001)) != 0){
      *(char**)m2 = m1;
      m1 = m2;
    }
    while(m1){
     ddd:	83 c4 10             	add    $0x10,%esp
     de0:	85 db                	test   %ebx,%ebx
     de2:	75 ec                	jne    dd0 <mem+0x50>
      m2 = *(char**)m1;
      free(m1);
      m1 = m2;
    }
    m1 = malloc(1024*20);
     de4:	83 ec 0c             	sub    $0xc,%esp
     de7:	68 00 50 00 00       	push   $0x5000
     dec:	e8 1f 2f 00 00       	call   3d10 <malloc>
    if(m1 == 0){
     df1:	83 c4 10             	add    $0x10,%esp
     df4:	85 c0                	test   %eax,%eax
     df6:	74 30                	je     e28 <mem+0xa8>
      printf(1, "couldn't allocate mem?!!\n");
      kill(ppid);
      exit();
    }
    free(m1);
     df8:	83 ec 0c             	sub    $0xc,%esp
     dfb:	50                   	push   %eax
     dfc:	e8 7f 2e 00 00       	call   3c80 <free>
    printf(1, "mem ok\n");
     e01:	58                   	pop    %eax
     e02:	5a                   	pop    %edx
     e03:	68 14 42 00 00       	push   $0x4214
     e08:	6a 01                	push   $0x1
     e0a:	e8 c1 2c 00 00       	call   3ad0 <printf>
    exit();
     e0f:	e8 64 2b 00 00       	call   3978 <exit>
     e14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  } else {
    wait();
  }
}
     e18:	8d 65 f4             	lea    -0xc(%ebp),%esp
     e1b:	5b                   	pop    %ebx
     e1c:	5e                   	pop    %esi
     e1d:	5f                   	pop    %edi
     e1e:	5d                   	pop    %ebp
    }
    free(m1);
    printf(1, "mem ok\n");
    exit();
  } else {
    wait();
     e1f:	e9 5c 2b 00 00       	jmp    3980 <wait>
     e24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      free(m1);
      m1 = m2;
    }
    m1 = malloc(1024*20);
    if(m1 == 0){
      printf(1, "couldn't allocate mem?!!\n");
     e28:	83 ec 08             	sub    $0x8,%esp
     e2b:	68 fa 41 00 00       	push   $0x41fa
     e30:	6a 01                	push   $0x1
     e32:	e8 99 2c 00 00       	call   3ad0 <printf>
      kill(ppid);
     e37:	89 34 24             	mov    %esi,(%esp)
     e3a:	e8 69 2b 00 00       	call   39a8 <kill>
      exit();
     e3f:	e8 34 2b 00 00       	call   3978 <exit>
     e44:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     e4a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000e50 <sharedfd>:

// two processes write to the same file descriptor
// is the offset shared? does inode locking work?
void
sharedfd(void)
{
     e50:	55                   	push   %ebp
     e51:	89 e5                	mov    %esp,%ebp
     e53:	57                   	push   %edi
     e54:	56                   	push   %esi
     e55:	53                   	push   %ebx
     e56:	83 ec 34             	sub    $0x34,%esp
  int fd, pid, i, n, nc, np;
  char buf[10];

  printf(1, "sharedfd test\n");
     e59:	68 1c 42 00 00       	push   $0x421c
     e5e:	6a 01                	push   $0x1
     e60:	e8 6b 2c 00 00       	call   3ad0 <printf>

  unlink("sharedfd");
     e65:	c7 04 24 2b 42 00 00 	movl   $0x422b,(%esp)
     e6c:	e8 57 2b 00 00       	call   39c8 <unlink>
  fd = open("sharedfd", O_CREATE|O_RDWR);
     e71:	5b                   	pop    %ebx
     e72:	5e                   	pop    %esi
     e73:	68 02 02 00 00       	push   $0x202
     e78:	68 2b 42 00 00       	push   $0x422b
     e7d:	e8 36 2b 00 00       	call   39b8 <open>
  if(fd < 0){
     e82:	83 c4 10             	add    $0x10,%esp
     e85:	85 c0                	test   %eax,%eax
     e87:	0f 88 29 01 00 00    	js     fb6 <sharedfd+0x166>
     e8d:	89 c7                	mov    %eax,%edi
    printf(1, "fstests: cannot open sharedfd for writing");
    return;
  }
  pid = fork();
  memset(buf, pid==0?'c':'p', sizeof(buf));
     e8f:	8d 75 de             	lea    -0x22(%ebp),%esi
     e92:	bb e8 03 00 00       	mov    $0x3e8,%ebx
  fd = open("sharedfd", O_CREATE|O_RDWR);
  if(fd < 0){
    printf(1, "fstests: cannot open sharedfd for writing");
    return;
  }
  pid = fork();
     e97:	e8 d4 2a 00 00       	call   3970 <fork>
  memset(buf, pid==0?'c':'p', sizeof(buf));
     e9c:	83 f8 01             	cmp    $0x1,%eax
  fd = open("sharedfd", O_CREATE|O_RDWR);
  if(fd < 0){
    printf(1, "fstests: cannot open sharedfd for writing");
    return;
  }
  pid = fork();
     e9f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  memset(buf, pid==0?'c':'p', sizeof(buf));
     ea2:	19 c0                	sbb    %eax,%eax
     ea4:	83 ec 04             	sub    $0x4,%esp
     ea7:	83 e0 f3             	and    $0xfffffff3,%eax
     eaa:	6a 0a                	push   $0xa
     eac:	83 c0 70             	add    $0x70,%eax
     eaf:	50                   	push   %eax
     eb0:	56                   	push   %esi
     eb1:	e8 1a 29 00 00       	call   37d0 <memset>
     eb6:	83 c4 10             	add    $0x10,%esp
     eb9:	eb 0a                	jmp    ec5 <sharedfd+0x75>
     ebb:	90                   	nop
     ebc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(i = 0; i < 1000; i++){
     ec0:	83 eb 01             	sub    $0x1,%ebx
     ec3:	74 26                	je     eeb <sharedfd+0x9b>
    if(write(fd, buf, sizeof(buf)) != sizeof(buf)){
     ec5:	83 ec 04             	sub    $0x4,%esp
     ec8:	6a 0a                	push   $0xa
     eca:	56                   	push   %esi
     ecb:	57                   	push   %edi
     ecc:	e8 c7 2a 00 00       	call   3998 <write>
     ed1:	83 c4 10             	add    $0x10,%esp
     ed4:	83 f8 0a             	cmp    $0xa,%eax
     ed7:	74 e7                	je     ec0 <sharedfd+0x70>
      printf(1, "fstests: write sharedfd failed\n");
     ed9:	83 ec 08             	sub    $0x8,%esp
     edc:	68 1c 4f 00 00       	push   $0x4f1c
     ee1:	6a 01                	push   $0x1
     ee3:	e8 e8 2b 00 00       	call   3ad0 <printf>
      break;
     ee8:	83 c4 10             	add    $0x10,%esp
    }
  }
  if(pid == 0)
     eeb:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
     eee:	85 c9                	test   %ecx,%ecx
     ef0:	0f 84 f4 00 00 00    	je     fea <sharedfd+0x19a>
    exit();
  else
    wait();
     ef6:	e8 85 2a 00 00       	call   3980 <wait>
  close(fd);
     efb:	83 ec 0c             	sub    $0xc,%esp
     efe:	31 db                	xor    %ebx,%ebx
     f00:	57                   	push   %edi
     f01:	8d 7d e8             	lea    -0x18(%ebp),%edi
     f04:	e8 97 2a 00 00       	call   39a0 <close>
  fd = open("sharedfd", 0);
     f09:	58                   	pop    %eax
     f0a:	5a                   	pop    %edx
     f0b:	6a 00                	push   $0x0
     f0d:	68 2b 42 00 00       	push   $0x422b
     f12:	e8 a1 2a 00 00       	call   39b8 <open>
  if(fd < 0){
     f17:	83 c4 10             	add    $0x10,%esp
     f1a:	31 d2                	xor    %edx,%edx
     f1c:	85 c0                	test   %eax,%eax
  if(pid == 0)
    exit();
  else
    wait();
  close(fd);
  fd = open("sharedfd", 0);
     f1e:	89 45 d0             	mov    %eax,-0x30(%ebp)
  if(fd < 0){
     f21:	0f 88 a9 00 00 00    	js     fd0 <sharedfd+0x180>
     f27:	89 f6                	mov    %esi,%esi
     f29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    printf(1, "fstests: cannot open sharedfd for reading\n");
    return;
  }
  nc = np = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
     f30:	83 ec 04             	sub    $0x4,%esp
     f33:	89 55 d4             	mov    %edx,-0x2c(%ebp)
     f36:	6a 0a                	push   $0xa
     f38:	56                   	push   %esi
     f39:	ff 75 d0             	pushl  -0x30(%ebp)
     f3c:	e8 4f 2a 00 00       	call   3990 <read>
     f41:	83 c4 10             	add    $0x10,%esp
     f44:	85 c0                	test   %eax,%eax
     f46:	7e 27                	jle    f6f <sharedfd+0x11f>
     f48:	89 f0                	mov    %esi,%eax
     f4a:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     f4d:	eb 13                	jmp    f62 <sharedfd+0x112>
     f4f:	90                   	nop
    for(i = 0; i < sizeof(buf); i++){
      if(buf[i] == 'c')
        nc++;
      if(buf[i] == 'p')
        np++;
     f50:	80 f9 70             	cmp    $0x70,%cl
     f53:	0f 94 c1             	sete   %cl
     f56:	0f b6 c9             	movzbl %cl,%ecx
     f59:	01 cb                	add    %ecx,%ebx
     f5b:	83 c0 01             	add    $0x1,%eax
    printf(1, "fstests: cannot open sharedfd for reading\n");
    return;
  }
  nc = np = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i = 0; i < sizeof(buf); i++){
     f5e:	39 c7                	cmp    %eax,%edi
     f60:	74 ce                	je     f30 <sharedfd+0xe0>
      if(buf[i] == 'c')
     f62:	0f b6 08             	movzbl (%eax),%ecx
     f65:	80 f9 63             	cmp    $0x63,%cl
     f68:	75 e6                	jne    f50 <sharedfd+0x100>
        nc++;
     f6a:	83 c2 01             	add    $0x1,%edx
     f6d:	eb ec                	jmp    f5b <sharedfd+0x10b>
      if(buf[i] == 'p')
        np++;
    }
  }
  close(fd);
     f6f:	83 ec 0c             	sub    $0xc,%esp
     f72:	ff 75 d0             	pushl  -0x30(%ebp)
     f75:	e8 26 2a 00 00       	call   39a0 <close>
  unlink("sharedfd");
     f7a:	c7 04 24 2b 42 00 00 	movl   $0x422b,(%esp)
     f81:	e8 42 2a 00 00       	call   39c8 <unlink>
  if(nc == 10000 && np == 10000){
     f86:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     f89:	83 c4 10             	add    $0x10,%esp
     f8c:	81 fa 10 27 00 00    	cmp    $0x2710,%edx
     f92:	75 5b                	jne    fef <sharedfd+0x19f>
     f94:	81 fb 10 27 00 00    	cmp    $0x2710,%ebx
     f9a:	75 53                	jne    fef <sharedfd+0x19f>
    printf(1, "sharedfd ok\n");
     f9c:	83 ec 08             	sub    $0x8,%esp
     f9f:	68 34 42 00 00       	push   $0x4234
     fa4:	6a 01                	push   $0x1
     fa6:	e8 25 2b 00 00       	call   3ad0 <printf>
     fab:	83 c4 10             	add    $0x10,%esp
  } else {
    printf(1, "sharedfd oops %d %d\n", nc, np);
    exit();
  }
}
     fae:	8d 65 f4             	lea    -0xc(%ebp),%esp
     fb1:	5b                   	pop    %ebx
     fb2:	5e                   	pop    %esi
     fb3:	5f                   	pop    %edi
     fb4:	5d                   	pop    %ebp
     fb5:	c3                   	ret    
  printf(1, "sharedfd test\n");

  unlink("sharedfd");
  fd = open("sharedfd", O_CREATE|O_RDWR);
  if(fd < 0){
    printf(1, "fstests: cannot open sharedfd for writing");
     fb6:	83 ec 08             	sub    $0x8,%esp
     fb9:	68 f0 4e 00 00       	push   $0x4ef0
     fbe:	6a 01                	push   $0x1
     fc0:	e8 0b 2b 00 00       	call   3ad0 <printf>
    return;
     fc5:	83 c4 10             	add    $0x10,%esp
    printf(1, "sharedfd ok\n");
  } else {
    printf(1, "sharedfd oops %d %d\n", nc, np);
    exit();
  }
}
     fc8:	8d 65 f4             	lea    -0xc(%ebp),%esp
     fcb:	5b                   	pop    %ebx
     fcc:	5e                   	pop    %esi
     fcd:	5f                   	pop    %edi
     fce:	5d                   	pop    %ebp
     fcf:	c3                   	ret    
  else
    wait();
  close(fd);
  fd = open("sharedfd", 0);
  if(fd < 0){
    printf(1, "fstests: cannot open sharedfd for reading\n");
     fd0:	83 ec 08             	sub    $0x8,%esp
     fd3:	68 3c 4f 00 00       	push   $0x4f3c
     fd8:	6a 01                	push   $0x1
     fda:	e8 f1 2a 00 00       	call   3ad0 <printf>
    return;
     fdf:	83 c4 10             	add    $0x10,%esp
    printf(1, "sharedfd ok\n");
  } else {
    printf(1, "sharedfd oops %d %d\n", nc, np);
    exit();
  }
}
     fe2:	8d 65 f4             	lea    -0xc(%ebp),%esp
     fe5:	5b                   	pop    %ebx
     fe6:	5e                   	pop    %esi
     fe7:	5f                   	pop    %edi
     fe8:	5d                   	pop    %ebp
     fe9:	c3                   	ret    
      printf(1, "fstests: write sharedfd failed\n");
      break;
    }
  }
  if(pid == 0)
    exit();
     fea:	e8 89 29 00 00       	call   3978 <exit>
  close(fd);
  unlink("sharedfd");
  if(nc == 10000 && np == 10000){
    printf(1, "sharedfd ok\n");
  } else {
    printf(1, "sharedfd oops %d %d\n", nc, np);
     fef:	53                   	push   %ebx
     ff0:	52                   	push   %edx
     ff1:	68 41 42 00 00       	push   $0x4241
     ff6:	6a 01                	push   $0x1
     ff8:	e8 d3 2a 00 00       	call   3ad0 <printf>
    exit();
     ffd:	e8 76 29 00 00       	call   3978 <exit>
    1002:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1009:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001010 <fourfiles>:

// four processes write different files at the same
// time, to test block allocation.
void
fourfiles(void)
{
    1010:	55                   	push   %ebp
    1011:	89 e5                	mov    %esp,%ebp
    1013:	57                   	push   %edi
    1014:	56                   	push   %esi
    1015:	53                   	push   %ebx
  int fd, pid, i, j, n, total, pi;
  char *names[] = { "f0", "f1", "f2", "f3" };
  char *fname;

  printf(1, "fourfiles test\n");
    1016:	be 56 42 00 00       	mov    $0x4256,%esi

  for(pi = 0; pi < 4; pi++){
    101b:	31 db                	xor    %ebx,%ebx

// four processes write different files at the same
// time, to test block allocation.
void
fourfiles(void)
{
    101d:	83 ec 34             	sub    $0x34,%esp
  int fd, pid, i, j, n, total, pi;
  char *names[] = { "f0", "f1", "f2", "f3" };
    1020:	c7 45 d8 56 42 00 00 	movl   $0x4256,-0x28(%ebp)
    1027:	c7 45 dc 9f 43 00 00 	movl   $0x439f,-0x24(%ebp)
  char *fname;

  printf(1, "fourfiles test\n");
    102e:	68 5c 42 00 00       	push   $0x425c
    1033:	6a 01                	push   $0x1
// time, to test block allocation.
void
fourfiles(void)
{
  int fd, pid, i, j, n, total, pi;
  char *names[] = { "f0", "f1", "f2", "f3" };
    1035:	c7 45 e0 a3 43 00 00 	movl   $0x43a3,-0x20(%ebp)
    103c:	c7 45 e4 59 42 00 00 	movl   $0x4259,-0x1c(%ebp)
  char *fname;

  printf(1, "fourfiles test\n");
    1043:	e8 88 2a 00 00       	call   3ad0 <printf>
    1048:	83 c4 10             	add    $0x10,%esp

  for(pi = 0; pi < 4; pi++){
    fname = names[pi];
    unlink(fname);
    104b:	83 ec 0c             	sub    $0xc,%esp
    104e:	56                   	push   %esi
    104f:	e8 74 29 00 00       	call   39c8 <unlink>

    pid = fork();
    1054:	e8 17 29 00 00       	call   3970 <fork>
    if(pid < 0){
    1059:	83 c4 10             	add    $0x10,%esp
    105c:	85 c0                	test   %eax,%eax
    105e:	0f 88 8d 01 00 00    	js     11f1 <fourfiles+0x1e1>
      printf(1, "fork failed\n");
      exit();
    }

    if(pid == 0){
    1064:	0f 84 ed 00 00 00    	je     1157 <fourfiles+0x147>
  char *names[] = { "f0", "f1", "f2", "f3" };
  char *fname;

  printf(1, "fourfiles test\n");

  for(pi = 0; pi < 4; pi++){
    106a:	83 c3 01             	add    $0x1,%ebx
    106d:	83 fb 04             	cmp    $0x4,%ebx
    1070:	74 06                	je     1078 <fourfiles+0x68>
    1072:	8b 74 9d d8          	mov    -0x28(%ebp,%ebx,4),%esi
    1076:	eb d3                	jmp    104b <fourfiles+0x3b>
      exit();
    }
  }

  for(pi = 0; pi < 4; pi++){
    wait();
    1078:	e8 03 29 00 00       	call   3980 <wait>
    107d:	31 ff                	xor    %edi,%edi
    107f:	e8 fc 28 00 00       	call   3980 <wait>
    1084:	e8 f7 28 00 00       	call   3980 <wait>
    1089:	e8 f2 28 00 00       	call   3980 <wait>
    108e:	c7 45 d0 56 42 00 00 	movl   $0x4256,-0x30(%ebp)
  }

  for(i = 0; i < 2; i++){
    fname = names[i];
    fd = open(fname, 0);
    1095:	83 ec 08             	sub    $0x8,%esp
    total = 0;
    1098:	31 db                	xor    %ebx,%ebx
    wait();
  }

  for(i = 0; i < 2; i++){
    fname = names[i];
    fd = open(fname, 0);
    109a:	6a 00                	push   $0x0
    109c:	ff 75 d0             	pushl  -0x30(%ebp)
    109f:	e8 14 29 00 00       	call   39b8 <open>
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
    10a4:	83 c4 10             	add    $0x10,%esp
    wait();
  }

  for(i = 0; i < 2; i++){
    fname = names[i];
    fd = open(fname, 0);
    10a7:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    10aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
    10b0:	83 ec 04             	sub    $0x4,%esp
    10b3:	68 00 20 00 00       	push   $0x2000
    10b8:	68 00 87 00 00       	push   $0x8700
    10bd:	ff 75 d4             	pushl  -0x2c(%ebp)
    10c0:	e8 cb 28 00 00       	call   3990 <read>
    10c5:	83 c4 10             	add    $0x10,%esp
    10c8:	85 c0                	test   %eax,%eax
    10ca:	7e 22                	jle    10ee <fourfiles+0xde>
    10cc:	31 d2                	xor    %edx,%edx
    10ce:	66 90                	xchg   %ax,%ax
      for(j = 0; j < n; j++){
        if(buf[j] != '0'+i){
    10d0:	0f be b2 00 87 00 00 	movsbl 0x8700(%edx),%esi
    10d7:	83 ff 01             	cmp    $0x1,%edi
    10da:	19 c9                	sbb    %ecx,%ecx
    10dc:	83 c1 31             	add    $0x31,%ecx
    10df:	39 ce                	cmp    %ecx,%esi
    10e1:	75 60                	jne    1143 <fourfiles+0x133>
  for(i = 0; i < 2; i++){
    fname = names[i];
    fd = open(fname, 0);
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
      for(j = 0; j < n; j++){
    10e3:	83 c2 01             	add    $0x1,%edx
    10e6:	39 d0                	cmp    %edx,%eax
    10e8:	75 e6                	jne    10d0 <fourfiles+0xc0>
        if(buf[j] != '0'+i){
          printf(1, "wrong char\n");
          exit();
        }
      }
      total += n;
    10ea:	01 c3                	add    %eax,%ebx
    10ec:	eb c2                	jmp    10b0 <fourfiles+0xa0>
    }
    close(fd);
    10ee:	83 ec 0c             	sub    $0xc,%esp
    10f1:	ff 75 d4             	pushl  -0x2c(%ebp)
    10f4:	e8 a7 28 00 00       	call   39a0 <close>
    if(total != 12*500){
    10f9:	83 c4 10             	add    $0x10,%esp
    10fc:	81 fb 70 17 00 00    	cmp    $0x1770,%ebx
    1102:	0f 85 d4 00 00 00    	jne    11dc <fourfiles+0x1cc>
      printf(1, "wrong length %d\n", total);
      exit();
    }
    unlink(fname);
    1108:	83 ec 0c             	sub    $0xc,%esp
    110b:	ff 75 d0             	pushl  -0x30(%ebp)

  for(pi = 0; pi < 4; pi++){
    wait();
  }

  for(i = 0; i < 2; i++){
    110e:	83 c7 01             	add    $0x1,%edi
    close(fd);
    if(total != 12*500){
      printf(1, "wrong length %d\n", total);
      exit();
    }
    unlink(fname);
    1111:	e8 b2 28 00 00       	call   39c8 <unlink>

  for(pi = 0; pi < 4; pi++){
    wait();
  }

  for(i = 0; i < 2; i++){
    1116:	83 c4 10             	add    $0x10,%esp
    1119:	83 ff 02             	cmp    $0x2,%edi
    111c:	75 1a                	jne    1138 <fourfiles+0x128>
      exit();
    }
    unlink(fname);
  }

  printf(1, "fourfiles ok\n");
    111e:	83 ec 08             	sub    $0x8,%esp
    1121:	68 9a 42 00 00       	push   $0x429a
    1126:	6a 01                	push   $0x1
    1128:	e8 a3 29 00 00       	call   3ad0 <printf>
}
    112d:	83 c4 10             	add    $0x10,%esp
    1130:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1133:	5b                   	pop    %ebx
    1134:	5e                   	pop    %esi
    1135:	5f                   	pop    %edi
    1136:	5d                   	pop    %ebp
    1137:	c3                   	ret    
    1138:	8b 45 dc             	mov    -0x24(%ebp),%eax
    113b:	89 45 d0             	mov    %eax,-0x30(%ebp)
    113e:	e9 52 ff ff ff       	jmp    1095 <fourfiles+0x85>
    fd = open(fname, 0);
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
      for(j = 0; j < n; j++){
        if(buf[j] != '0'+i){
          printf(1, "wrong char\n");
    1143:	83 ec 08             	sub    $0x8,%esp
    1146:	68 7d 42 00 00       	push   $0x427d
    114b:	6a 01                	push   $0x1
    114d:	e8 7e 29 00 00       	call   3ad0 <printf>
          exit();
    1152:	e8 21 28 00 00       	call   3978 <exit>
      printf(1, "fork failed\n");
      exit();
    }

    if(pid == 0){
      fd = open(fname, O_CREATE | O_RDWR);
    1157:	83 ec 08             	sub    $0x8,%esp
    115a:	68 02 02 00 00       	push   $0x202
    115f:	56                   	push   %esi
    1160:	e8 53 28 00 00       	call   39b8 <open>
      if(fd < 0){
    1165:	83 c4 10             	add    $0x10,%esp
    1168:	85 c0                	test   %eax,%eax
      printf(1, "fork failed\n");
      exit();
    }

    if(pid == 0){
      fd = open(fname, O_CREATE | O_RDWR);
    116a:	89 c6                	mov    %eax,%esi
      if(fd < 0){
    116c:	78 5a                	js     11c8 <fourfiles+0x1b8>
        printf(1, "create failed\n");
        exit();
      }

      memset(buf, '0'+pi, 512);
    116e:	83 ec 04             	sub    $0x4,%esp
    1171:	83 c3 30             	add    $0x30,%ebx
    1174:	68 00 02 00 00       	push   $0x200
    1179:	53                   	push   %ebx
    117a:	bb 0c 00 00 00       	mov    $0xc,%ebx
    117f:	68 00 87 00 00       	push   $0x8700
    1184:	e8 47 26 00 00       	call   37d0 <memset>
    1189:	83 c4 10             	add    $0x10,%esp
      for(i = 0; i < 12; i++){
        if((n = write(fd, buf, 500)) != 500){
    118c:	83 ec 04             	sub    $0x4,%esp
    118f:	68 f4 01 00 00       	push   $0x1f4
    1194:	68 00 87 00 00       	push   $0x8700
    1199:	56                   	push   %esi
    119a:	e8 f9 27 00 00       	call   3998 <write>
    119f:	83 c4 10             	add    $0x10,%esp
    11a2:	3d f4 01 00 00       	cmp    $0x1f4,%eax
    11a7:	75 0a                	jne    11b3 <fourfiles+0x1a3>
        printf(1, "create failed\n");
        exit();
      }

      memset(buf, '0'+pi, 512);
      for(i = 0; i < 12; i++){
    11a9:	83 eb 01             	sub    $0x1,%ebx
    11ac:	75 de                	jne    118c <fourfiles+0x17c>
        if((n = write(fd, buf, 500)) != 500){
          printf(1, "write failed %d\n", n);
          exit();
        }
      }
      exit();
    11ae:	e8 c5 27 00 00       	call   3978 <exit>
      }

      memset(buf, '0'+pi, 512);
      for(i = 0; i < 12; i++){
        if((n = write(fd, buf, 500)) != 500){
          printf(1, "write failed %d\n", n);
    11b3:	83 ec 04             	sub    $0x4,%esp
    11b6:	50                   	push   %eax
    11b7:	68 6c 42 00 00       	push   $0x426c
    11bc:	6a 01                	push   $0x1
    11be:	e8 0d 29 00 00       	call   3ad0 <printf>
          exit();
    11c3:	e8 b0 27 00 00       	call   3978 <exit>
    }

    if(pid == 0){
      fd = open(fname, O_CREATE | O_RDWR);
      if(fd < 0){
        printf(1, "create failed\n");
    11c8:	83 ec 08             	sub    $0x8,%esp
    11cb:	68 f7 44 00 00       	push   $0x44f7
    11d0:	6a 01                	push   $0x1
    11d2:	e8 f9 28 00 00       	call   3ad0 <printf>
        exit();
    11d7:	e8 9c 27 00 00       	call   3978 <exit>
      }
      total += n;
    }
    close(fd);
    if(total != 12*500){
      printf(1, "wrong length %d\n", total);
    11dc:	83 ec 04             	sub    $0x4,%esp
    11df:	53                   	push   %ebx
    11e0:	68 89 42 00 00       	push   $0x4289
    11e5:	6a 01                	push   $0x1
    11e7:	e8 e4 28 00 00       	call   3ad0 <printf>
      exit();
    11ec:	e8 87 27 00 00       	call   3978 <exit>
    fname = names[pi];
    unlink(fname);

    pid = fork();
    if(pid < 0){
      printf(1, "fork failed\n");
    11f1:	83 ec 08             	sub    $0x8,%esp
    11f4:	68 31 4d 00 00       	push   $0x4d31
    11f9:	6a 01                	push   $0x1
    11fb:	e8 d0 28 00 00       	call   3ad0 <printf>
      exit();
    1200:	e8 73 27 00 00       	call   3978 <exit>
    1205:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1209:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001210 <createdelete>:
}

// four processes create and delete different files in same directory
void
createdelete(void)
{
    1210:	55                   	push   %ebp
    1211:	89 e5                	mov    %esp,%ebp
    1213:	57                   	push   %edi
    1214:	56                   	push   %esi
    1215:	53                   	push   %ebx
  int pid, i, fd, pi;
  char name[32];

  printf(1, "createdelete test\n");

  for(pi = 0; pi < 4; pi++){
    1216:	31 db                	xor    %ebx,%ebx
}

// four processes create and delete different files in same directory
void
createdelete(void)
{
    1218:	83 ec 44             	sub    $0x44,%esp
  enum { N = 20 };
  int pid, i, fd, pi;
  char name[32];

  printf(1, "createdelete test\n");
    121b:	68 a8 42 00 00       	push   $0x42a8
    1220:	6a 01                	push   $0x1
    1222:	e8 a9 28 00 00       	call   3ad0 <printf>
    1227:	83 c4 10             	add    $0x10,%esp

  for(pi = 0; pi < 4; pi++){
    pid = fork();
    122a:	e8 41 27 00 00       	call   3970 <fork>
    if(pid < 0){
    122f:	85 c0                	test   %eax,%eax
    1231:	0f 88 b7 01 00 00    	js     13ee <createdelete+0x1de>
      printf(1, "fork failed\n");
      exit();
    }

    if(pid == 0){
    1237:	0f 84 f6 00 00 00    	je     1333 <createdelete+0x123>
  int pid, i, fd, pi;
  char name[32];

  printf(1, "createdelete test\n");

  for(pi = 0; pi < 4; pi++){
    123d:	83 c3 01             	add    $0x1,%ebx
    1240:	83 fb 04             	cmp    $0x4,%ebx
    1243:	75 e5                	jne    122a <createdelete+0x1a>
    1245:	8d 7d c8             	lea    -0x38(%ebp),%edi
  for(pi = 0; pi < 4; pi++){
    wait();
  }

  name[0] = name[1] = name[2] = 0;
  for(i = 0; i < N; i++){
    1248:	31 f6                	xor    %esi,%esi
      exit();
    }
  }

  for(pi = 0; pi < 4; pi++){
    wait();
    124a:	e8 31 27 00 00       	call   3980 <wait>
    124f:	e8 2c 27 00 00       	call   3980 <wait>
    1254:	e8 27 27 00 00       	call   3980 <wait>
    1259:	e8 22 27 00 00       	call   3980 <wait>
  }

  name[0] = name[1] = name[2] = 0;
    125e:	c6 45 ca 00          	movb   $0x0,-0x36(%ebp)
    1262:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1268:	8d 46 30             	lea    0x30(%esi),%eax
    126b:	83 fe 09             	cmp    $0x9,%esi
      exit();
    }

    if(pid == 0){
      name[0] = 'p' + pi;
      name[2] = '\0';
    126e:	bb 70 00 00 00       	mov    $0x70,%ebx
    1273:	0f 9f c2             	setg   %dl
    1276:	85 f6                	test   %esi,%esi
    1278:	88 45 c7             	mov    %al,-0x39(%ebp)
    127b:	0f 94 c0             	sete   %al
    127e:	09 c2                	or     %eax,%edx
      name[1] = '0' + i;
      fd = open(name, 0);
      if((i == 0 || i >= N/2) && fd < 0){
        printf(1, "oops createdelete %s didn't exist\n", name);
        exit();
      } else if((i >= 1 && i < N/2) && fd >= 0){
    1280:	8d 46 ff             	lea    -0x1(%esi),%eax
    1283:	88 55 c6             	mov    %dl,-0x3a(%ebp)
    1286:	89 45 c0             	mov    %eax,-0x40(%ebp)

  name[0] = name[1] = name[2] = 0;
  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + pi;
      name[1] = '0' + i;
    1289:	0f b6 45 c7          	movzbl -0x39(%ebp),%eax
      fd = open(name, 0);
    128d:	83 ec 08             	sub    $0x8,%esp
  }

  name[0] = name[1] = name[2] = 0;
  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + pi;
    1290:	88 5d c8             	mov    %bl,-0x38(%ebp)
      name[1] = '0' + i;
      fd = open(name, 0);
    1293:	6a 00                	push   $0x0
    1295:	57                   	push   %edi

  name[0] = name[1] = name[2] = 0;
  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + pi;
      name[1] = '0' + i;
    1296:	88 45 c9             	mov    %al,-0x37(%ebp)
      fd = open(name, 0);
    1299:	e8 1a 27 00 00       	call   39b8 <open>
      if((i == 0 || i >= N/2) && fd < 0){
    129e:	89 c1                	mov    %eax,%ecx
    12a0:	83 c4 10             	add    $0x10,%esp
    12a3:	c1 e9 1f             	shr    $0x1f,%ecx
    12a6:	84 c9                	test   %cl,%cl
    12a8:	74 0a                	je     12b4 <createdelete+0xa4>
    12aa:	80 7d c6 00          	cmpb   $0x0,-0x3a(%ebp)
    12ae:	0f 85 11 01 00 00    	jne    13c5 <createdelete+0x1b5>
        printf(1, "oops createdelete %s didn't exist\n", name);
        exit();
      } else if((i >= 1 && i < N/2) && fd >= 0){
    12b4:	83 7d c0 08          	cmpl   $0x8,-0x40(%ebp)
    12b8:	0f 86 44 01 00 00    	jbe    1402 <createdelete+0x1f2>
        printf(1, "oops createdelete %s did exist\n", name);
        exit();
      }
      if(fd >= 0)
    12be:	85 c0                	test   %eax,%eax
    12c0:	78 0c                	js     12ce <createdelete+0xbe>
        close(fd);
    12c2:	83 ec 0c             	sub    $0xc,%esp
    12c5:	50                   	push   %eax
    12c6:	e8 d5 26 00 00       	call   39a0 <close>
    12cb:	83 c4 10             	add    $0x10,%esp
    12ce:	83 c3 01             	add    $0x1,%ebx
    wait();
  }

  name[0] = name[1] = name[2] = 0;
  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
    12d1:	80 fb 74             	cmp    $0x74,%bl
    12d4:	75 b3                	jne    1289 <createdelete+0x79>
  for(pi = 0; pi < 4; pi++){
    wait();
  }

  name[0] = name[1] = name[2] = 0;
  for(i = 0; i < N; i++){
    12d6:	83 c6 01             	add    $0x1,%esi
    12d9:	83 fe 14             	cmp    $0x14,%esi
    12dc:	75 8a                	jne    1268 <createdelete+0x58>
    12de:	be 70 00 00 00       	mov    $0x70,%esi
    12e3:	90                   	nop
    12e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    12e8:	8d 46 c0             	lea    -0x40(%esi),%eax
    12eb:	bb 04 00 00 00       	mov    $0x4,%ebx
    12f0:	88 45 c7             	mov    %al,-0x39(%ebp)
    }
  }

  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + i;
    12f3:	89 f0                	mov    %esi,%eax
      name[1] = '0' + i;
      unlink(name);
    12f5:	83 ec 0c             	sub    $0xc,%esp
    }
  }

  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + i;
    12f8:	88 45 c8             	mov    %al,-0x38(%ebp)
      name[1] = '0' + i;
    12fb:	0f b6 45 c7          	movzbl -0x39(%ebp),%eax
      unlink(name);
    12ff:	57                   	push   %edi
  }

  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + i;
      name[1] = '0' + i;
    1300:	88 45 c9             	mov    %al,-0x37(%ebp)
      unlink(name);
    1303:	e8 c0 26 00 00       	call   39c8 <unlink>
        close(fd);
    }
  }

  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
    1308:	83 c4 10             	add    $0x10,%esp
    130b:	83 eb 01             	sub    $0x1,%ebx
    130e:	75 e3                	jne    12f3 <createdelete+0xe3>
    1310:	83 c6 01             	add    $0x1,%esi
      if(fd >= 0)
        close(fd);
    }
  }

  for(i = 0; i < N; i++){
    1313:	89 f0                	mov    %esi,%eax
    1315:	3c 84                	cmp    $0x84,%al
    1317:	75 cf                	jne    12e8 <createdelete+0xd8>
      name[1] = '0' + i;
      unlink(name);
    }
  }

  printf(1, "createdelete ok\n");
    1319:	83 ec 08             	sub    $0x8,%esp
    131c:	68 bb 42 00 00       	push   $0x42bb
    1321:	6a 01                	push   $0x1
    1323:	e8 a8 27 00 00       	call   3ad0 <printf>
}
    1328:	83 c4 10             	add    $0x10,%esp
    132b:	8d 65 f4             	lea    -0xc(%ebp),%esp
    132e:	5b                   	pop    %ebx
    132f:	5e                   	pop    %esi
    1330:	5f                   	pop    %edi
    1331:	5d                   	pop    %ebp
    1332:	c3                   	ret    
      printf(1, "fork failed\n");
      exit();
    }

    if(pid == 0){
      name[0] = 'p' + pi;
    1333:	83 c3 70             	add    $0x70,%ebx
      name[2] = '\0';
    1336:	c6 45 ca 00          	movb   $0x0,-0x36(%ebp)
    133a:	be 01 00 00 00       	mov    $0x1,%esi
      printf(1, "fork failed\n");
      exit();
    }

    if(pid == 0){
      name[0] = 'p' + pi;
    133f:	88 5d c8             	mov    %bl,-0x38(%ebp)
    1342:	8d 7d c8             	lea    -0x38(%ebp),%edi
      name[2] = '\0';
    1345:	31 db                	xor    %ebx,%ebx
    1347:	eb 12                	jmp    135b <createdelete+0x14b>
    1349:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      for(i = 0; i < N; i++){
    1350:	83 fe 14             	cmp    $0x14,%esi
    1353:	74 6b                	je     13c0 <createdelete+0x1b0>
    1355:	83 c3 01             	add    $0x1,%ebx
    1358:	83 c6 01             	add    $0x1,%esi
        name[1] = '0' + i;
        fd = open(name, O_CREATE | O_RDWR);
    135b:	83 ec 08             	sub    $0x8,%esp

    if(pid == 0){
      name[0] = 'p' + pi;
      name[2] = '\0';
      for(i = 0; i < N; i++){
        name[1] = '0' + i;
    135e:	8d 43 30             	lea    0x30(%ebx),%eax
        fd = open(name, O_CREATE | O_RDWR);
    1361:	68 02 02 00 00       	push   $0x202
    1366:	57                   	push   %edi

    if(pid == 0){
      name[0] = 'p' + pi;
      name[2] = '\0';
      for(i = 0; i < N; i++){
        name[1] = '0' + i;
    1367:	88 45 c9             	mov    %al,-0x37(%ebp)
        fd = open(name, O_CREATE | O_RDWR);
    136a:	e8 49 26 00 00       	call   39b8 <open>
        if(fd < 0){
    136f:	83 c4 10             	add    $0x10,%esp
    1372:	85 c0                	test   %eax,%eax
    1374:	78 64                	js     13da <createdelete+0x1ca>
          printf(1, "create failed\n");
          exit();
        }
        close(fd);
    1376:	83 ec 0c             	sub    $0xc,%esp
    1379:	50                   	push   %eax
    137a:	e8 21 26 00 00       	call   39a0 <close>
        if(i > 0 && (i % 2 ) == 0){
    137f:	83 c4 10             	add    $0x10,%esp
    1382:	85 db                	test   %ebx,%ebx
    1384:	74 cf                	je     1355 <createdelete+0x145>
    1386:	f6 c3 01             	test   $0x1,%bl
    1389:	75 c5                	jne    1350 <createdelete+0x140>
          name[1] = '0' + (i / 2);
          if(unlink(name) < 0){
    138b:	83 ec 0c             	sub    $0xc,%esp
          printf(1, "create failed\n");
          exit();
        }
        close(fd);
        if(i > 0 && (i % 2 ) == 0){
          name[1] = '0' + (i / 2);
    138e:	89 d8                	mov    %ebx,%eax
    1390:	d1 f8                	sar    %eax
          if(unlink(name) < 0){
    1392:	57                   	push   %edi
          printf(1, "create failed\n");
          exit();
        }
        close(fd);
        if(i > 0 && (i % 2 ) == 0){
          name[1] = '0' + (i / 2);
    1393:	83 c0 30             	add    $0x30,%eax
    1396:	88 45 c9             	mov    %al,-0x37(%ebp)
          if(unlink(name) < 0){
    1399:	e8 2a 26 00 00       	call   39c8 <unlink>
    139e:	83 c4 10             	add    $0x10,%esp
    13a1:	85 c0                	test   %eax,%eax
    13a3:	79 ab                	jns    1350 <createdelete+0x140>
            printf(1, "unlink failed\n");
    13a5:	83 ec 08             	sub    $0x8,%esp
    13a8:	68 a9 3e 00 00       	push   $0x3ea9
    13ad:	6a 01                	push   $0x1
    13af:	e8 1c 27 00 00       	call   3ad0 <printf>
            exit();
    13b4:	e8 bf 25 00 00       	call   3978 <exit>
    13b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
          }
        }
      }
      exit();
    13c0:	e8 b3 25 00 00       	call   3978 <exit>
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + pi;
      name[1] = '0' + i;
      fd = open(name, 0);
      if((i == 0 || i >= N/2) && fd < 0){
        printf(1, "oops createdelete %s didn't exist\n", name);
    13c5:	83 ec 04             	sub    $0x4,%esp
    13c8:	57                   	push   %edi
    13c9:	68 68 4f 00 00       	push   $0x4f68
    13ce:	6a 01                	push   $0x1
    13d0:	e8 fb 26 00 00       	call   3ad0 <printf>
        exit();
    13d5:	e8 9e 25 00 00       	call   3978 <exit>
      name[2] = '\0';
      for(i = 0; i < N; i++){
        name[1] = '0' + i;
        fd = open(name, O_CREATE | O_RDWR);
        if(fd < 0){
          printf(1, "create failed\n");
    13da:	83 ec 08             	sub    $0x8,%esp
    13dd:	68 f7 44 00 00       	push   $0x44f7
    13e2:	6a 01                	push   $0x1
    13e4:	e8 e7 26 00 00       	call   3ad0 <printf>
          exit();
    13e9:	e8 8a 25 00 00       	call   3978 <exit>
  printf(1, "createdelete test\n");

  for(pi = 0; pi < 4; pi++){
    pid = fork();
    if(pid < 0){
      printf(1, "fork failed\n");
    13ee:	83 ec 08             	sub    $0x8,%esp
    13f1:	68 31 4d 00 00       	push   $0x4d31
    13f6:	6a 01                	push   $0x1
    13f8:	e8 d3 26 00 00       	call   3ad0 <printf>
      exit();
    13fd:	e8 76 25 00 00       	call   3978 <exit>
      name[1] = '0' + i;
      fd = open(name, 0);
      if((i == 0 || i >= N/2) && fd < 0){
        printf(1, "oops createdelete %s didn't exist\n", name);
        exit();
      } else if((i >= 1 && i < N/2) && fd >= 0){
    1402:	85 c0                	test   %eax,%eax
    1404:	0f 88 c4 fe ff ff    	js     12ce <createdelete+0xbe>
        printf(1, "oops createdelete %s did exist\n", name);
    140a:	83 ec 04             	sub    $0x4,%esp
    140d:	57                   	push   %edi
    140e:	68 8c 4f 00 00       	push   $0x4f8c
    1413:	6a 01                	push   $0x1
    1415:	e8 b6 26 00 00       	call   3ad0 <printf>
        exit();
    141a:	e8 59 25 00 00       	call   3978 <exit>
    141f:	90                   	nop

00001420 <unlinkread>:
}

// can I unlink a file and still read it?
void
unlinkread(void)
{
    1420:	55                   	push   %ebp
    1421:	89 e5                	mov    %esp,%ebp
    1423:	56                   	push   %esi
    1424:	53                   	push   %ebx
  int fd, fd1;

  printf(1, "unlinkread test\n");
    1425:	83 ec 08             	sub    $0x8,%esp
    1428:	68 cc 42 00 00       	push   $0x42cc
    142d:	6a 01                	push   $0x1
    142f:	e8 9c 26 00 00       	call   3ad0 <printf>
  fd = open("unlinkread", O_CREATE | O_RDWR);
    1434:	5b                   	pop    %ebx
    1435:	5e                   	pop    %esi
    1436:	68 02 02 00 00       	push   $0x202
    143b:	68 dd 42 00 00       	push   $0x42dd
    1440:	e8 73 25 00 00       	call   39b8 <open>
  if(fd < 0){
    1445:	83 c4 10             	add    $0x10,%esp
    1448:	85 c0                	test   %eax,%eax
    144a:	0f 88 e6 00 00 00    	js     1536 <unlinkread+0x116>
    printf(1, "create unlinkread failed\n");
    exit();
  }
  write(fd, "hello", 5);
    1450:	83 ec 04             	sub    $0x4,%esp
    1453:	89 c3                	mov    %eax,%ebx
    1455:	6a 05                	push   $0x5
    1457:	68 02 43 00 00       	push   $0x4302
    145c:	50                   	push   %eax
    145d:	e8 36 25 00 00       	call   3998 <write>
  close(fd);
    1462:	89 1c 24             	mov    %ebx,(%esp)
    1465:	e8 36 25 00 00       	call   39a0 <close>

  fd = open("unlinkread", O_RDWR);
    146a:	58                   	pop    %eax
    146b:	5a                   	pop    %edx
    146c:	6a 02                	push   $0x2
    146e:	68 dd 42 00 00       	push   $0x42dd
    1473:	e8 40 25 00 00       	call   39b8 <open>
  if(fd < 0){
    1478:	83 c4 10             	add    $0x10,%esp
    147b:	85 c0                	test   %eax,%eax
    exit();
  }
  write(fd, "hello", 5);
  close(fd);

  fd = open("unlinkread", O_RDWR);
    147d:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    147f:	0f 88 10 01 00 00    	js     1595 <unlinkread+0x175>
    printf(1, "open unlinkread failed\n");
    exit();
  }
  if(unlink("unlinkread") != 0){
    1485:	83 ec 0c             	sub    $0xc,%esp
    1488:	68 dd 42 00 00       	push   $0x42dd
    148d:	e8 36 25 00 00       	call   39c8 <unlink>
    1492:	83 c4 10             	add    $0x10,%esp
    1495:	85 c0                	test   %eax,%eax
    1497:	0f 85 e5 00 00 00    	jne    1582 <unlinkread+0x162>
    printf(1, "unlink unlinkread failed\n");
    exit();
  }

  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    149d:	83 ec 08             	sub    $0x8,%esp
    14a0:	68 02 02 00 00       	push   $0x202
    14a5:	68 dd 42 00 00       	push   $0x42dd
    14aa:	e8 09 25 00 00       	call   39b8 <open>
  write(fd1, "yyy", 3);
    14af:	83 c4 0c             	add    $0xc,%esp
  if(unlink("unlinkread") != 0){
    printf(1, "unlink unlinkread failed\n");
    exit();
  }

  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    14b2:	89 c6                	mov    %eax,%esi
  write(fd1, "yyy", 3);
    14b4:	6a 03                	push   $0x3
    14b6:	68 3a 43 00 00       	push   $0x433a
    14bb:	50                   	push   %eax
    14bc:	e8 d7 24 00 00       	call   3998 <write>
  close(fd1);
    14c1:	89 34 24             	mov    %esi,(%esp)
    14c4:	e8 d7 24 00 00       	call   39a0 <close>

  if(read(fd, buf, sizeof(buf)) != 5){
    14c9:	83 c4 0c             	add    $0xc,%esp
    14cc:	68 00 20 00 00       	push   $0x2000
    14d1:	68 00 87 00 00       	push   $0x8700
    14d6:	53                   	push   %ebx
    14d7:	e8 b4 24 00 00       	call   3990 <read>
    14dc:	83 c4 10             	add    $0x10,%esp
    14df:	83 f8 05             	cmp    $0x5,%eax
    14e2:	0f 85 87 00 00 00    	jne    156f <unlinkread+0x14f>
    printf(1, "unlinkread read failed");
    exit();
  }
  if(buf[0] != 'h'){
    14e8:	80 3d 00 87 00 00 68 	cmpb   $0x68,0x8700
    14ef:	75 6b                	jne    155c <unlinkread+0x13c>
    printf(1, "unlinkread wrong data\n");
    exit();
  }
  if(write(fd, buf, 10) != 10){
    14f1:	83 ec 04             	sub    $0x4,%esp
    14f4:	6a 0a                	push   $0xa
    14f6:	68 00 87 00 00       	push   $0x8700
    14fb:	53                   	push   %ebx
    14fc:	e8 97 24 00 00       	call   3998 <write>
    1501:	83 c4 10             	add    $0x10,%esp
    1504:	83 f8 0a             	cmp    $0xa,%eax
    1507:	75 40                	jne    1549 <unlinkread+0x129>
    printf(1, "unlinkread write failed\n");
    exit();
  }
  close(fd);
    1509:	83 ec 0c             	sub    $0xc,%esp
    150c:	53                   	push   %ebx
    150d:	e8 8e 24 00 00       	call   39a0 <close>
  unlink("unlinkread");
    1512:	c7 04 24 dd 42 00 00 	movl   $0x42dd,(%esp)
    1519:	e8 aa 24 00 00       	call   39c8 <unlink>
  printf(1, "unlinkread ok\n");
    151e:	58                   	pop    %eax
    151f:	5a                   	pop    %edx
    1520:	68 85 43 00 00       	push   $0x4385
    1525:	6a 01                	push   $0x1
    1527:	e8 a4 25 00 00       	call   3ad0 <printf>
}
    152c:	83 c4 10             	add    $0x10,%esp
    152f:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1532:	5b                   	pop    %ebx
    1533:	5e                   	pop    %esi
    1534:	5d                   	pop    %ebp
    1535:	c3                   	ret    
  int fd, fd1;

  printf(1, "unlinkread test\n");
  fd = open("unlinkread", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "create unlinkread failed\n");
    1536:	51                   	push   %ecx
    1537:	51                   	push   %ecx
    1538:	68 e8 42 00 00       	push   $0x42e8
    153d:	6a 01                	push   $0x1
    153f:	e8 8c 25 00 00       	call   3ad0 <printf>
    exit();
    1544:	e8 2f 24 00 00       	call   3978 <exit>
  if(buf[0] != 'h'){
    printf(1, "unlinkread wrong data\n");
    exit();
  }
  if(write(fd, buf, 10) != 10){
    printf(1, "unlinkread write failed\n");
    1549:	51                   	push   %ecx
    154a:	51                   	push   %ecx
    154b:	68 6c 43 00 00       	push   $0x436c
    1550:	6a 01                	push   $0x1
    1552:	e8 79 25 00 00       	call   3ad0 <printf>
    exit();
    1557:	e8 1c 24 00 00       	call   3978 <exit>
  if(read(fd, buf, sizeof(buf)) != 5){
    printf(1, "unlinkread read failed");
    exit();
  }
  if(buf[0] != 'h'){
    printf(1, "unlinkread wrong data\n");
    155c:	53                   	push   %ebx
    155d:	53                   	push   %ebx
    155e:	68 55 43 00 00       	push   $0x4355
    1563:	6a 01                	push   $0x1
    1565:	e8 66 25 00 00       	call   3ad0 <printf>
    exit();
    156a:	e8 09 24 00 00       	call   3978 <exit>
  fd1 = open("unlinkread", O_CREATE | O_RDWR);
  write(fd1, "yyy", 3);
  close(fd1);

  if(read(fd, buf, sizeof(buf)) != 5){
    printf(1, "unlinkread read failed");
    156f:	56                   	push   %esi
    1570:	56                   	push   %esi
    1571:	68 3e 43 00 00       	push   $0x433e
    1576:	6a 01                	push   $0x1
    1578:	e8 53 25 00 00       	call   3ad0 <printf>
    exit();
    157d:	e8 f6 23 00 00       	call   3978 <exit>
  if(fd < 0){
    printf(1, "open unlinkread failed\n");
    exit();
  }
  if(unlink("unlinkread") != 0){
    printf(1, "unlink unlinkread failed\n");
    1582:	50                   	push   %eax
    1583:	50                   	push   %eax
    1584:	68 20 43 00 00       	push   $0x4320
    1589:	6a 01                	push   $0x1
    158b:	e8 40 25 00 00       	call   3ad0 <printf>
    exit();
    1590:	e8 e3 23 00 00       	call   3978 <exit>
  write(fd, "hello", 5);
  close(fd);

  fd = open("unlinkread", O_RDWR);
  if(fd < 0){
    printf(1, "open unlinkread failed\n");
    1595:	50                   	push   %eax
    1596:	50                   	push   %eax
    1597:	68 08 43 00 00       	push   $0x4308
    159c:	6a 01                	push   $0x1
    159e:	e8 2d 25 00 00       	call   3ad0 <printf>
    exit();
    15a3:	e8 d0 23 00 00       	call   3978 <exit>
    15a8:	90                   	nop
    15a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000015b0 <linktest>:
  printf(1, "unlinkread ok\n");
}

void
linktest(void)
{
    15b0:	55                   	push   %ebp
    15b1:	89 e5                	mov    %esp,%ebp
    15b3:	53                   	push   %ebx
    15b4:	83 ec 0c             	sub    $0xc,%esp
  int fd;

  printf(1, "linktest\n");
    15b7:	68 94 43 00 00       	push   $0x4394
    15bc:	6a 01                	push   $0x1
    15be:	e8 0d 25 00 00       	call   3ad0 <printf>

  unlink("lf1");
    15c3:	c7 04 24 9e 43 00 00 	movl   $0x439e,(%esp)
    15ca:	e8 f9 23 00 00       	call   39c8 <unlink>
  unlink("lf2");
    15cf:	c7 04 24 a2 43 00 00 	movl   $0x43a2,(%esp)
    15d6:	e8 ed 23 00 00       	call   39c8 <unlink>

  fd = open("lf1", O_CREATE|O_RDWR);
    15db:	58                   	pop    %eax
    15dc:	5a                   	pop    %edx
    15dd:	68 02 02 00 00       	push   $0x202
    15e2:	68 9e 43 00 00       	push   $0x439e
    15e7:	e8 cc 23 00 00       	call   39b8 <open>
  if(fd < 0){
    15ec:	83 c4 10             	add    $0x10,%esp
    15ef:	85 c0                	test   %eax,%eax
    15f1:	0f 88 1e 01 00 00    	js     1715 <linktest+0x165>
    printf(1, "create lf1 failed\n");
    exit();
  }
  if(write(fd, "hello", 5) != 5){
    15f7:	83 ec 04             	sub    $0x4,%esp
    15fa:	89 c3                	mov    %eax,%ebx
    15fc:	6a 05                	push   $0x5
    15fe:	68 02 43 00 00       	push   $0x4302
    1603:	50                   	push   %eax
    1604:	e8 8f 23 00 00       	call   3998 <write>
    1609:	83 c4 10             	add    $0x10,%esp
    160c:	83 f8 05             	cmp    $0x5,%eax
    160f:	0f 85 98 01 00 00    	jne    17ad <linktest+0x1fd>
    printf(1, "write lf1 failed\n");
    exit();
  }
  close(fd);
    1615:	83 ec 0c             	sub    $0xc,%esp
    1618:	53                   	push   %ebx
    1619:	e8 82 23 00 00       	call   39a0 <close>

  if(link("lf1", "lf2") < 0){
    161e:	5b                   	pop    %ebx
    161f:	58                   	pop    %eax
    1620:	68 a2 43 00 00       	push   $0x43a2
    1625:	68 9e 43 00 00       	push   $0x439e
    162a:	e8 a9 23 00 00       	call   39d8 <link>
    162f:	83 c4 10             	add    $0x10,%esp
    1632:	85 c0                	test   %eax,%eax
    1634:	0f 88 60 01 00 00    	js     179a <linktest+0x1ea>
    printf(1, "link lf1 lf2 failed\n");
    exit();
  }
  unlink("lf1");
    163a:	83 ec 0c             	sub    $0xc,%esp
    163d:	68 9e 43 00 00       	push   $0x439e
    1642:	e8 81 23 00 00       	call   39c8 <unlink>

  if(open("lf1", 0) >= 0){
    1647:	58                   	pop    %eax
    1648:	5a                   	pop    %edx
    1649:	6a 00                	push   $0x0
    164b:	68 9e 43 00 00       	push   $0x439e
    1650:	e8 63 23 00 00       	call   39b8 <open>
    1655:	83 c4 10             	add    $0x10,%esp
    1658:	85 c0                	test   %eax,%eax
    165a:	0f 89 27 01 00 00    	jns    1787 <linktest+0x1d7>
    printf(1, "unlinked lf1 but it is still there!\n");
    exit();
  }

  fd = open("lf2", 0);
    1660:	83 ec 08             	sub    $0x8,%esp
    1663:	6a 00                	push   $0x0
    1665:	68 a2 43 00 00       	push   $0x43a2
    166a:	e8 49 23 00 00       	call   39b8 <open>
  if(fd < 0){
    166f:	83 c4 10             	add    $0x10,%esp
    1672:	85 c0                	test   %eax,%eax
  if(open("lf1", 0) >= 0){
    printf(1, "unlinked lf1 but it is still there!\n");
    exit();
  }

  fd = open("lf2", 0);
    1674:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1676:	0f 88 f8 00 00 00    	js     1774 <linktest+0x1c4>
    printf(1, "open lf2 failed\n");
    exit();
  }
  if(read(fd, buf, sizeof(buf)) != 5){
    167c:	83 ec 04             	sub    $0x4,%esp
    167f:	68 00 20 00 00       	push   $0x2000
    1684:	68 00 87 00 00       	push   $0x8700
    1689:	50                   	push   %eax
    168a:	e8 01 23 00 00       	call   3990 <read>
    168f:	83 c4 10             	add    $0x10,%esp
    1692:	83 f8 05             	cmp    $0x5,%eax
    1695:	0f 85 c6 00 00 00    	jne    1761 <linktest+0x1b1>
    printf(1, "read lf2 failed\n");
    exit();
  }
  close(fd);
    169b:	83 ec 0c             	sub    $0xc,%esp
    169e:	53                   	push   %ebx
    169f:	e8 fc 22 00 00       	call   39a0 <close>

  if(link("lf2", "lf2") >= 0){
    16a4:	58                   	pop    %eax
    16a5:	5a                   	pop    %edx
    16a6:	68 a2 43 00 00       	push   $0x43a2
    16ab:	68 a2 43 00 00       	push   $0x43a2
    16b0:	e8 23 23 00 00       	call   39d8 <link>
    16b5:	83 c4 10             	add    $0x10,%esp
    16b8:	85 c0                	test   %eax,%eax
    16ba:	0f 89 8e 00 00 00    	jns    174e <linktest+0x19e>
    printf(1, "link lf2 lf2 succeeded! oops\n");
    exit();
  }

  unlink("lf2");
    16c0:	83 ec 0c             	sub    $0xc,%esp
    16c3:	68 a2 43 00 00       	push   $0x43a2
    16c8:	e8 fb 22 00 00       	call   39c8 <unlink>
  if(link("lf2", "lf1") >= 0){
    16cd:	59                   	pop    %ecx
    16ce:	5b                   	pop    %ebx
    16cf:	68 9e 43 00 00       	push   $0x439e
    16d4:	68 a2 43 00 00       	push   $0x43a2
    16d9:	e8 fa 22 00 00       	call   39d8 <link>
    16de:	83 c4 10             	add    $0x10,%esp
    16e1:	85 c0                	test   %eax,%eax
    16e3:	79 56                	jns    173b <linktest+0x18b>
    printf(1, "link non-existant succeeded! oops\n");
    exit();
  }

  if(link(".", "lf1") >= 0){
    16e5:	83 ec 08             	sub    $0x8,%esp
    16e8:	68 9e 43 00 00       	push   $0x439e
    16ed:	68 66 46 00 00       	push   $0x4666
    16f2:	e8 e1 22 00 00       	call   39d8 <link>
    16f7:	83 c4 10             	add    $0x10,%esp
    16fa:	85 c0                	test   %eax,%eax
    16fc:	79 2a                	jns    1728 <linktest+0x178>
    printf(1, "link . lf1 succeeded! oops\n");
    exit();
  }

  printf(1, "linktest ok\n");
    16fe:	83 ec 08             	sub    $0x8,%esp
    1701:	68 3c 44 00 00       	push   $0x443c
    1706:	6a 01                	push   $0x1
    1708:	e8 c3 23 00 00       	call   3ad0 <printf>
}
    170d:	83 c4 10             	add    $0x10,%esp
    1710:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1713:	c9                   	leave  
    1714:	c3                   	ret    
  unlink("lf1");
  unlink("lf2");

  fd = open("lf1", O_CREATE|O_RDWR);
  if(fd < 0){
    printf(1, "create lf1 failed\n");
    1715:	50                   	push   %eax
    1716:	50                   	push   %eax
    1717:	68 a6 43 00 00       	push   $0x43a6
    171c:	6a 01                	push   $0x1
    171e:	e8 ad 23 00 00       	call   3ad0 <printf>
    exit();
    1723:	e8 50 22 00 00       	call   3978 <exit>
    printf(1, "link non-existant succeeded! oops\n");
    exit();
  }

  if(link(".", "lf1") >= 0){
    printf(1, "link . lf1 succeeded! oops\n");
    1728:	50                   	push   %eax
    1729:	50                   	push   %eax
    172a:	68 20 44 00 00       	push   $0x4420
    172f:	6a 01                	push   $0x1
    1731:	e8 9a 23 00 00       	call   3ad0 <printf>
    exit();
    1736:	e8 3d 22 00 00       	call   3978 <exit>
    exit();
  }

  unlink("lf2");
  if(link("lf2", "lf1") >= 0){
    printf(1, "link non-existant succeeded! oops\n");
    173b:	52                   	push   %edx
    173c:	52                   	push   %edx
    173d:	68 d4 4f 00 00       	push   $0x4fd4
    1742:	6a 01                	push   $0x1
    1744:	e8 87 23 00 00       	call   3ad0 <printf>
    exit();
    1749:	e8 2a 22 00 00       	call   3978 <exit>
    exit();
  }
  close(fd);

  if(link("lf2", "lf2") >= 0){
    printf(1, "link lf2 lf2 succeeded! oops\n");
    174e:	50                   	push   %eax
    174f:	50                   	push   %eax
    1750:	68 02 44 00 00       	push   $0x4402
    1755:	6a 01                	push   $0x1
    1757:	e8 74 23 00 00       	call   3ad0 <printf>
    exit();
    175c:	e8 17 22 00 00       	call   3978 <exit>
  if(fd < 0){
    printf(1, "open lf2 failed\n");
    exit();
  }
  if(read(fd, buf, sizeof(buf)) != 5){
    printf(1, "read lf2 failed\n");
    1761:	51                   	push   %ecx
    1762:	51                   	push   %ecx
    1763:	68 f1 43 00 00       	push   $0x43f1
    1768:	6a 01                	push   $0x1
    176a:	e8 61 23 00 00       	call   3ad0 <printf>
    exit();
    176f:	e8 04 22 00 00       	call   3978 <exit>
    exit();
  }

  fd = open("lf2", 0);
  if(fd < 0){
    printf(1, "open lf2 failed\n");
    1774:	53                   	push   %ebx
    1775:	53                   	push   %ebx
    1776:	68 e0 43 00 00       	push   $0x43e0
    177b:	6a 01                	push   $0x1
    177d:	e8 4e 23 00 00       	call   3ad0 <printf>
    exit();
    1782:	e8 f1 21 00 00       	call   3978 <exit>
    exit();
  }
  unlink("lf1");

  if(open("lf1", 0) >= 0){
    printf(1, "unlinked lf1 but it is still there!\n");
    1787:	50                   	push   %eax
    1788:	50                   	push   %eax
    1789:	68 ac 4f 00 00       	push   $0x4fac
    178e:	6a 01                	push   $0x1
    1790:	e8 3b 23 00 00       	call   3ad0 <printf>
    exit();
    1795:	e8 de 21 00 00       	call   3978 <exit>
    exit();
  }
  close(fd);

  if(link("lf1", "lf2") < 0){
    printf(1, "link lf1 lf2 failed\n");
    179a:	51                   	push   %ecx
    179b:	51                   	push   %ecx
    179c:	68 cb 43 00 00       	push   $0x43cb
    17a1:	6a 01                	push   $0x1
    17a3:	e8 28 23 00 00       	call   3ad0 <printf>
    exit();
    17a8:	e8 cb 21 00 00       	call   3978 <exit>
  if(fd < 0){
    printf(1, "create lf1 failed\n");
    exit();
  }
  if(write(fd, "hello", 5) != 5){
    printf(1, "write lf1 failed\n");
    17ad:	50                   	push   %eax
    17ae:	50                   	push   %eax
    17af:	68 b9 43 00 00       	push   $0x43b9
    17b4:	6a 01                	push   $0x1
    17b6:	e8 15 23 00 00       	call   3ad0 <printf>
    exit();
    17bb:	e8 b8 21 00 00       	call   3978 <exit>

000017c0 <concreate>:
}

// test concurrent create/link/unlink of the same file
void
concreate(void)
{
    17c0:	55                   	push   %ebp
    17c1:	89 e5                	mov    %esp,%ebp
    17c3:	57                   	push   %edi
    17c4:	56                   	push   %esi
    17c5:	53                   	push   %ebx
  } de;

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    17c6:	31 f6                	xor    %esi,%esi
    17c8:	8d 5d ad             	lea    -0x53(%ebp),%ebx
    file[1] = '0' + i;
    unlink(file);
    pid = fork();
    if(pid && (i % 3) == 1){
    17cb:	bf 56 55 55 55       	mov    $0x55555556,%edi
}

// test concurrent create/link/unlink of the same file
void
concreate(void)
{
    17d0:	83 ec 64             	sub    $0x64,%esp
  struct {
    ushort inum;
    char name[14];
  } de;

  printf(1, "concreate test\n");
    17d3:	68 49 44 00 00       	push   $0x4449
    17d8:	6a 01                	push   $0x1
    17da:	e8 f1 22 00 00       	call   3ad0 <printf>
  file[0] = 'C';
    17df:	c6 45 ad 43          	movb   $0x43,-0x53(%ebp)
  file[2] = '\0';
    17e3:	c6 45 af 00          	movb   $0x0,-0x51(%ebp)
    17e7:	83 c4 10             	add    $0x10,%esp
    17ea:	eb 51                	jmp    183d <concreate+0x7d>
    17ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    unlink(file);
    pid = fork();
    if(pid && (i % 3) == 1){
    17f0:	89 f0                	mov    %esi,%eax
    17f2:	89 f1                	mov    %esi,%ecx
    17f4:	f7 ef                	imul   %edi
    17f6:	89 f0                	mov    %esi,%eax
    17f8:	c1 f8 1f             	sar    $0x1f,%eax
    17fb:	29 c2                	sub    %eax,%edx
    17fd:	8d 04 52             	lea    (%edx,%edx,2),%eax
    1800:	29 c1                	sub    %eax,%ecx
    1802:	83 f9 01             	cmp    $0x1,%ecx
    1805:	0f 84 b5 00 00 00    	je     18c0 <concreate+0x100>
      link("C0", file);
    } else if(pid == 0 && (i % 5) == 1){
      link("C0", file);
    } else {
      fd = open(file, O_CREATE | O_RDWR);
    180b:	83 ec 08             	sub    $0x8,%esp
    180e:	68 02 02 00 00       	push   $0x202
    1813:	53                   	push   %ebx
    1814:	e8 9f 21 00 00       	call   39b8 <open>
      if(fd < 0){
    1819:	83 c4 10             	add    $0x10,%esp
    181c:	85 c0                	test   %eax,%eax
    181e:	78 6d                	js     188d <concreate+0xcd>
        printf(1, "concreate create %s failed\n", file);
        exit();
      }
      close(fd);
    1820:	83 ec 0c             	sub    $0xc,%esp
  } de;

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    1823:	83 c6 01             	add    $0x1,%esi
      fd = open(file, O_CREATE | O_RDWR);
      if(fd < 0){
        printf(1, "concreate create %s failed\n", file);
        exit();
      }
      close(fd);
    1826:	50                   	push   %eax
    1827:	e8 74 21 00 00       	call   39a0 <close>
    182c:	83 c4 10             	add    $0x10,%esp
    }
    if(pid == 0)
      exit();
    else
      wait();
    182f:	e8 4c 21 00 00       	call   3980 <wait>
  } de;

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    1834:	83 fe 28             	cmp    $0x28,%esi
    1837:	0f 84 ab 00 00 00    	je     18e8 <concreate+0x128>
    file[1] = '0' + i;
    unlink(file);
    183d:	83 ec 0c             	sub    $0xc,%esp

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    1840:	8d 46 30             	lea    0x30(%esi),%eax
    unlink(file);
    1843:	53                   	push   %ebx

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    1844:	88 45 ae             	mov    %al,-0x52(%ebp)
    unlink(file);
    1847:	e8 7c 21 00 00       	call   39c8 <unlink>
    pid = fork();
    184c:	e8 1f 21 00 00       	call   3970 <fork>
    if(pid && (i % 3) == 1){
    1851:	83 c4 10             	add    $0x10,%esp
    1854:	85 c0                	test   %eax,%eax
    1856:	75 98                	jne    17f0 <concreate+0x30>
      link("C0", file);
    } else if(pid == 0 && (i % 5) == 1){
    1858:	89 f0                	mov    %esi,%eax
    185a:	ba 67 66 66 66       	mov    $0x66666667,%edx
    185f:	f7 ea                	imul   %edx
    1861:	89 f0                	mov    %esi,%eax
    1863:	c1 f8 1f             	sar    $0x1f,%eax
    1866:	d1 fa                	sar    %edx
    1868:	29 c2                	sub    %eax,%edx
    186a:	8d 04 92             	lea    (%edx,%edx,4),%eax
    186d:	29 c6                	sub    %eax,%esi
    186f:	83 fe 01             	cmp    $0x1,%esi
    1872:	74 34                	je     18a8 <concreate+0xe8>
      link("C0", file);
    } else {
      fd = open(file, O_CREATE | O_RDWR);
    1874:	83 ec 08             	sub    $0x8,%esp
    1877:	68 02 02 00 00       	push   $0x202
    187c:	53                   	push   %ebx
    187d:	e8 36 21 00 00       	call   39b8 <open>
      if(fd < 0){
    1882:	83 c4 10             	add    $0x10,%esp
    1885:	85 c0                	test   %eax,%eax
    1887:	0f 89 32 02 00 00    	jns    1abf <concreate+0x2ff>
        printf(1, "concreate create %s failed\n", file);
    188d:	83 ec 04             	sub    $0x4,%esp
    1890:	53                   	push   %ebx
    1891:	68 5c 44 00 00       	push   $0x445c
    1896:	6a 01                	push   $0x1
    1898:	e8 33 22 00 00       	call   3ad0 <printf>
        exit();
    189d:	e8 d6 20 00 00       	call   3978 <exit>
    18a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    unlink(file);
    pid = fork();
    if(pid && (i % 3) == 1){
      link("C0", file);
    } else if(pid == 0 && (i % 5) == 1){
      link("C0", file);
    18a8:	83 ec 08             	sub    $0x8,%esp
    18ab:	53                   	push   %ebx
    18ac:	68 59 44 00 00       	push   $0x4459
    18b1:	e8 22 21 00 00       	call   39d8 <link>
    18b6:	83 c4 10             	add    $0x10,%esp
        exit();
      }
      close(fd);
    }
    if(pid == 0)
      exit();
    18b9:	e8 ba 20 00 00       	call   3978 <exit>
    18be:	66 90                	xchg   %ax,%ax
  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    unlink(file);
    pid = fork();
    if(pid && (i % 3) == 1){
      link("C0", file);
    18c0:	83 ec 08             	sub    $0x8,%esp
  } de;

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    18c3:	83 c6 01             	add    $0x1,%esi
    file[1] = '0' + i;
    unlink(file);
    pid = fork();
    if(pid && (i % 3) == 1){
      link("C0", file);
    18c6:	53                   	push   %ebx
    18c7:	68 59 44 00 00       	push   $0x4459
    18cc:	e8 07 21 00 00       	call   39d8 <link>
    18d1:	83 c4 10             	add    $0x10,%esp
      close(fd);
    }
    if(pid == 0)
      exit();
    else
      wait();
    18d4:	e8 a7 20 00 00       	call   3980 <wait>
  } de;

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    18d9:	83 fe 28             	cmp    $0x28,%esi
    18dc:	0f 85 5b ff ff ff    	jne    183d <concreate+0x7d>
    18e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      exit();
    else
      wait();
  }

  memset(fa, 0, sizeof(fa));
    18e8:	8d 45 c0             	lea    -0x40(%ebp),%eax
    18eb:	83 ec 04             	sub    $0x4,%esp
    18ee:	8d 7d b0             	lea    -0x50(%ebp),%edi
    18f1:	6a 28                	push   $0x28
    18f3:	6a 00                	push   $0x0
    18f5:	50                   	push   %eax
    18f6:	e8 d5 1e 00 00       	call   37d0 <memset>
  fd = open(".", 0);
    18fb:	59                   	pop    %ecx
    18fc:	5e                   	pop    %esi
    18fd:	6a 00                	push   $0x0
    18ff:	68 66 46 00 00       	push   $0x4666
    1904:	e8 af 20 00 00       	call   39b8 <open>
  n = 0;
  while(read(fd, &de, sizeof(de)) > 0){
    1909:	83 c4 10             	add    $0x10,%esp
    else
      wait();
  }

  memset(fa, 0, sizeof(fa));
  fd = open(".", 0);
    190c:	89 c6                	mov    %eax,%esi
  n = 0;
    190e:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%ebp)
    1915:	8d 76 00             	lea    0x0(%esi),%esi
  while(read(fd, &de, sizeof(de)) > 0){
    1918:	83 ec 04             	sub    $0x4,%esp
    191b:	6a 10                	push   $0x10
    191d:	57                   	push   %edi
    191e:	56                   	push   %esi
    191f:	e8 6c 20 00 00       	call   3990 <read>
    1924:	83 c4 10             	add    $0x10,%esp
    1927:	85 c0                	test   %eax,%eax
    1929:	7e 3d                	jle    1968 <concreate+0x1a8>
    if(de.inum == 0)
    192b:	66 83 7d b0 00       	cmpw   $0x0,-0x50(%ebp)
    1930:	74 e6                	je     1918 <concreate+0x158>
      continue;
    if(de.name[0] == 'C' && de.name[2] == '\0'){
    1932:	80 7d b2 43          	cmpb   $0x43,-0x4e(%ebp)
    1936:	75 e0                	jne    1918 <concreate+0x158>
    1938:	80 7d b4 00          	cmpb   $0x0,-0x4c(%ebp)
    193c:	75 da                	jne    1918 <concreate+0x158>
      i = de.name[1] - '0';
    193e:	0f be 45 b3          	movsbl -0x4d(%ebp),%eax
    1942:	83 e8 30             	sub    $0x30,%eax
      if(i < 0 || i >= sizeof(fa)){
    1945:	83 f8 27             	cmp    $0x27,%eax
    1948:	0f 87 59 01 00 00    	ja     1aa7 <concreate+0x2e7>
        printf(1, "concreate weird file %s\n", de.name);
        exit();
      }
      if(fa[i]){
    194e:	80 7c 05 c0 00       	cmpb   $0x0,-0x40(%ebp,%eax,1)
    1953:	0f 85 36 01 00 00    	jne    1a8f <concreate+0x2cf>
        printf(1, "concreate duplicate file %s\n", de.name);
        exit();
      }
      fa[i] = 1;
    1959:	c6 44 05 c0 01       	movb   $0x1,-0x40(%ebp,%eax,1)
      n++;
    195e:	83 45 a4 01          	addl   $0x1,-0x5c(%ebp)
    1962:	eb b4                	jmp    1918 <concreate+0x158>
    1964:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
  }
  close(fd);
    1968:	83 ec 0c             	sub    $0xc,%esp
    196b:	56                   	push   %esi
    196c:	e8 2f 20 00 00       	call   39a0 <close>

  if(n != 40){
    1971:	83 c4 10             	add    $0x10,%esp
    1974:	83 7d a4 28          	cmpl   $0x28,-0x5c(%ebp)
    1978:	0f 85 fd 00 00 00    	jne    1a7b <concreate+0x2bb>
    197e:	31 f6                	xor    %esi,%esi
    1980:	eb 70                	jmp    19f2 <concreate+0x232>
    1982:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(pid < 0){
      printf(1, "fork failed\n");
      exit();
    }
    if(((i % 3) == 0 && pid == 0) ||
       ((i % 3) == 1 && pid != 0)){
    1988:	83 fa 01             	cmp    $0x1,%edx
    198b:	0f 85 99 00 00 00    	jne    1a2a <concreate+0x26a>
      close(open(file, 0));
    1991:	83 ec 08             	sub    $0x8,%esp
    1994:	6a 00                	push   $0x0
    1996:	53                   	push   %ebx
    1997:	e8 1c 20 00 00       	call   39b8 <open>
    199c:	89 04 24             	mov    %eax,(%esp)
    199f:	e8 fc 1f 00 00       	call   39a0 <close>
      close(open(file, 0));
    19a4:	58                   	pop    %eax
    19a5:	5a                   	pop    %edx
    19a6:	6a 00                	push   $0x0
    19a8:	53                   	push   %ebx
    19a9:	e8 0a 20 00 00       	call   39b8 <open>
    19ae:	89 04 24             	mov    %eax,(%esp)
    19b1:	e8 ea 1f 00 00       	call   39a0 <close>
      close(open(file, 0));
    19b6:	59                   	pop    %ecx
    19b7:	58                   	pop    %eax
    19b8:	6a 00                	push   $0x0
    19ba:	53                   	push   %ebx
    19bb:	e8 f8 1f 00 00       	call   39b8 <open>
    19c0:	89 04 24             	mov    %eax,(%esp)
    19c3:	e8 d8 1f 00 00       	call   39a0 <close>
      close(open(file, 0));
    19c8:	58                   	pop    %eax
    19c9:	5a                   	pop    %edx
    19ca:	6a 00                	push   $0x0
    19cc:	53                   	push   %ebx
    19cd:	e8 e6 1f 00 00       	call   39b8 <open>
    19d2:	89 04 24             	mov    %eax,(%esp)
    19d5:	e8 c6 1f 00 00       	call   39a0 <close>
    19da:	83 c4 10             	add    $0x10,%esp
      unlink(file);
      unlink(file);
      unlink(file);
      unlink(file);
    }
    if(pid == 0)
    19dd:	85 ff                	test   %edi,%edi
    19df:	0f 84 d4 fe ff ff    	je     18b9 <concreate+0xf9>
  if(n != 40){
    printf(1, "concreate not enough files in directory listing\n");
    exit();
  }

  for(i = 0; i < 40; i++){
    19e5:	83 c6 01             	add    $0x1,%esi
      unlink(file);
    }
    if(pid == 0)
      exit();
    else
      wait();
    19e8:	e8 93 1f 00 00       	call   3980 <wait>
  if(n != 40){
    printf(1, "concreate not enough files in directory listing\n");
    exit();
  }

  for(i = 0; i < 40; i++){
    19ed:	83 fe 28             	cmp    $0x28,%esi
    19f0:	74 5e                	je     1a50 <concreate+0x290>
    file[1] = '0' + i;
    19f2:	8d 46 30             	lea    0x30(%esi),%eax
    19f5:	88 45 ae             	mov    %al,-0x52(%ebp)
    pid = fork();
    19f8:	e8 73 1f 00 00       	call   3970 <fork>
    if(pid < 0){
    19fd:	85 c0                	test   %eax,%eax
    exit();
  }

  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    pid = fork();
    19ff:	89 c7                	mov    %eax,%edi
    if(pid < 0){
    1a01:	78 64                	js     1a67 <concreate+0x2a7>
      printf(1, "fork failed\n");
      exit();
    }
    if(((i % 3) == 0 && pid == 0) ||
    1a03:	b8 56 55 55 55       	mov    $0x55555556,%eax
    1a08:	f7 ee                	imul   %esi
    1a0a:	89 f0                	mov    %esi,%eax
    1a0c:	c1 f8 1f             	sar    $0x1f,%eax
    1a0f:	29 c2                	sub    %eax,%edx
    1a11:	8d 04 52             	lea    (%edx,%edx,2),%eax
    1a14:	89 f2                	mov    %esi,%edx
    1a16:	29 c2                	sub    %eax,%edx
    1a18:	89 f8                	mov    %edi,%eax
    1a1a:	09 d0                	or     %edx,%eax
    1a1c:	0f 84 6f ff ff ff    	je     1991 <concreate+0x1d1>
       ((i % 3) == 1 && pid != 0)){
    1a22:	85 ff                	test   %edi,%edi
    1a24:	0f 85 5e ff ff ff    	jne    1988 <concreate+0x1c8>
      close(open(file, 0));
      close(open(file, 0));
      close(open(file, 0));
      close(open(file, 0));
    } else {
      unlink(file);
    1a2a:	83 ec 0c             	sub    $0xc,%esp
    1a2d:	53                   	push   %ebx
    1a2e:	e8 95 1f 00 00       	call   39c8 <unlink>
      unlink(file);
    1a33:	89 1c 24             	mov    %ebx,(%esp)
    1a36:	e8 8d 1f 00 00       	call   39c8 <unlink>
      unlink(file);
    1a3b:	89 1c 24             	mov    %ebx,(%esp)
    1a3e:	e8 85 1f 00 00       	call   39c8 <unlink>
      unlink(file);
    1a43:	89 1c 24             	mov    %ebx,(%esp)
    1a46:	e8 7d 1f 00 00       	call   39c8 <unlink>
    1a4b:	83 c4 10             	add    $0x10,%esp
    1a4e:	eb 8d                	jmp    19dd <concreate+0x21d>
      exit();
    else
      wait();
  }

  printf(1, "concreate ok\n");
    1a50:	83 ec 08             	sub    $0x8,%esp
    1a53:	68 ae 44 00 00       	push   $0x44ae
    1a58:	6a 01                	push   $0x1
    1a5a:	e8 71 20 00 00       	call   3ad0 <printf>
}
    1a5f:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1a62:	5b                   	pop    %ebx
    1a63:	5e                   	pop    %esi
    1a64:	5f                   	pop    %edi
    1a65:	5d                   	pop    %ebp
    1a66:	c3                   	ret    

  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    pid = fork();
    if(pid < 0){
      printf(1, "fork failed\n");
    1a67:	83 ec 08             	sub    $0x8,%esp
    1a6a:	68 31 4d 00 00       	push   $0x4d31
    1a6f:	6a 01                	push   $0x1
    1a71:	e8 5a 20 00 00       	call   3ad0 <printf>
      exit();
    1a76:	e8 fd 1e 00 00       	call   3978 <exit>
    }
  }
  close(fd);

  if(n != 40){
    printf(1, "concreate not enough files in directory listing\n");
    1a7b:	83 ec 08             	sub    $0x8,%esp
    1a7e:	68 f8 4f 00 00       	push   $0x4ff8
    1a83:	6a 01                	push   $0x1
    1a85:	e8 46 20 00 00       	call   3ad0 <printf>
    exit();
    1a8a:	e8 e9 1e 00 00       	call   3978 <exit>
      if(i < 0 || i >= sizeof(fa)){
        printf(1, "concreate weird file %s\n", de.name);
        exit();
      }
      if(fa[i]){
        printf(1, "concreate duplicate file %s\n", de.name);
    1a8f:	8d 45 b2             	lea    -0x4e(%ebp),%eax
    1a92:	83 ec 04             	sub    $0x4,%esp
    1a95:	50                   	push   %eax
    1a96:	68 91 44 00 00       	push   $0x4491
    1a9b:	6a 01                	push   $0x1
    1a9d:	e8 2e 20 00 00       	call   3ad0 <printf>
        exit();
    1aa2:	e8 d1 1e 00 00       	call   3978 <exit>
    if(de.inum == 0)
      continue;
    if(de.name[0] == 'C' && de.name[2] == '\0'){
      i = de.name[1] - '0';
      if(i < 0 || i >= sizeof(fa)){
        printf(1, "concreate weird file %s\n", de.name);
    1aa7:	8d 45 b2             	lea    -0x4e(%ebp),%eax
    1aaa:	83 ec 04             	sub    $0x4,%esp
    1aad:	50                   	push   %eax
    1aae:	68 78 44 00 00       	push   $0x4478
    1ab3:	6a 01                	push   $0x1
    1ab5:	e8 16 20 00 00       	call   3ad0 <printf>
        exit();
    1aba:	e8 b9 1e 00 00       	call   3978 <exit>
      fd = open(file, O_CREATE | O_RDWR);
      if(fd < 0){
        printf(1, "concreate create %s failed\n", file);
        exit();
      }
      close(fd);
    1abf:	83 ec 0c             	sub    $0xc,%esp
    1ac2:	50                   	push   %eax
    1ac3:	e8 d8 1e 00 00       	call   39a0 <close>
    1ac8:	83 c4 10             	add    $0x10,%esp
    1acb:	e9 e9 fd ff ff       	jmp    18b9 <concreate+0xf9>

00001ad0 <linkunlink>:

// another concurrent link/unlink/create test,
// to look for deadlocks.
void
linkunlink()
{
    1ad0:	55                   	push   %ebp
    1ad1:	89 e5                	mov    %esp,%ebp
    1ad3:	57                   	push   %edi
    1ad4:	56                   	push   %esi
    1ad5:	53                   	push   %ebx
    1ad6:	83 ec 24             	sub    $0x24,%esp
  int pid, i;

  printf(1, "linkunlink test\n");
    1ad9:	68 bc 44 00 00       	push   $0x44bc
    1ade:	6a 01                	push   $0x1
    1ae0:	e8 eb 1f 00 00       	call   3ad0 <printf>

  unlink("x");
    1ae5:	c7 04 24 49 47 00 00 	movl   $0x4749,(%esp)
    1aec:	e8 d7 1e 00 00       	call   39c8 <unlink>
  pid = fork();
    1af1:	e8 7a 1e 00 00       	call   3970 <fork>
  if(pid < 0){
    1af6:	83 c4 10             	add    $0x10,%esp
    1af9:	85 c0                	test   %eax,%eax
  int pid, i;

  printf(1, "linkunlink test\n");

  unlink("x");
  pid = fork();
    1afb:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(pid < 0){
    1afe:	0f 88 b6 00 00 00    	js     1bba <linkunlink+0xea>
    printf(1, "fork failed\n");
    exit();
  }

  unsigned int x = (pid ? 1 : 97);
    1b04:	83 7d e4 01          	cmpl   $0x1,-0x1c(%ebp)
    1b08:	bb 64 00 00 00       	mov    $0x64,%ebx
  for(i = 0; i < 100; i++){
    x = x * 1103515245 + 12345;
    if((x % 3) == 0){
    1b0d:	be ab aa aa aa       	mov    $0xaaaaaaab,%esi
  if(pid < 0){
    printf(1, "fork failed\n");
    exit();
  }

  unsigned int x = (pid ? 1 : 97);
    1b12:	19 ff                	sbb    %edi,%edi
    1b14:	83 e7 60             	and    $0x60,%edi
    1b17:	83 c7 01             	add    $0x1,%edi
    1b1a:	eb 1e                	jmp    1b3a <linkunlink+0x6a>
    1b1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(i = 0; i < 100; i++){
    x = x * 1103515245 + 12345;
    if((x % 3) == 0){
      close(open("x", O_RDWR | O_CREATE));
    } else if((x % 3) == 1){
    1b20:	83 fa 01             	cmp    $0x1,%edx
    1b23:	74 7b                	je     1ba0 <linkunlink+0xd0>
      link("cat", "x");
    } else {
      unlink("x");
    1b25:	83 ec 0c             	sub    $0xc,%esp
    1b28:	68 49 47 00 00       	push   $0x4749
    1b2d:	e8 96 1e 00 00       	call   39c8 <unlink>
    1b32:	83 c4 10             	add    $0x10,%esp
    printf(1, "fork failed\n");
    exit();
  }

  unsigned int x = (pid ? 1 : 97);
  for(i = 0; i < 100; i++){
    1b35:	83 eb 01             	sub    $0x1,%ebx
    1b38:	74 3d                	je     1b77 <linkunlink+0xa7>
    x = x * 1103515245 + 12345;
    1b3a:	69 cf 6d 4e c6 41    	imul   $0x41c64e6d,%edi,%ecx
    1b40:	8d b9 39 30 00 00    	lea    0x3039(%ecx),%edi
    if((x % 3) == 0){
    1b46:	89 f8                	mov    %edi,%eax
    1b48:	f7 e6                	mul    %esi
    1b4a:	d1 ea                	shr    %edx
    1b4c:	8d 04 52             	lea    (%edx,%edx,2),%eax
    1b4f:	89 fa                	mov    %edi,%edx
    1b51:	29 c2                	sub    %eax,%edx
    1b53:	75 cb                	jne    1b20 <linkunlink+0x50>
      close(open("x", O_RDWR | O_CREATE));
    1b55:	83 ec 08             	sub    $0x8,%esp
    1b58:	68 02 02 00 00       	push   $0x202
    1b5d:	68 49 47 00 00       	push   $0x4749
    1b62:	e8 51 1e 00 00       	call   39b8 <open>
    1b67:	89 04 24             	mov    %eax,(%esp)
    1b6a:	e8 31 1e 00 00       	call   39a0 <close>
    1b6f:	83 c4 10             	add    $0x10,%esp
    printf(1, "fork failed\n");
    exit();
  }

  unsigned int x = (pid ? 1 : 97);
  for(i = 0; i < 100; i++){
    1b72:	83 eb 01             	sub    $0x1,%ebx
    1b75:	75 c3                	jne    1b3a <linkunlink+0x6a>
    } else {
      unlink("x");
    }
  }

  if(pid)
    1b77:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1b7a:	85 c0                	test   %eax,%eax
    1b7c:	74 50                	je     1bce <linkunlink+0xfe>
    wait();
    1b7e:	e8 fd 1d 00 00       	call   3980 <wait>
  else
    exit();

  printf(1, "linkunlink ok\n");
    1b83:	83 ec 08             	sub    $0x8,%esp
    1b86:	68 d1 44 00 00       	push   $0x44d1
    1b8b:	6a 01                	push   $0x1
    1b8d:	e8 3e 1f 00 00       	call   3ad0 <printf>
}
    1b92:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1b95:	5b                   	pop    %ebx
    1b96:	5e                   	pop    %esi
    1b97:	5f                   	pop    %edi
    1b98:	5d                   	pop    %ebp
    1b99:	c3                   	ret    
    1b9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(i = 0; i < 100; i++){
    x = x * 1103515245 + 12345;
    if((x % 3) == 0){
      close(open("x", O_RDWR | O_CREATE));
    } else if((x % 3) == 1){
      link("cat", "x");
    1ba0:	83 ec 08             	sub    $0x8,%esp
    1ba3:	68 49 47 00 00       	push   $0x4749
    1ba8:	68 cd 44 00 00       	push   $0x44cd
    1bad:	e8 26 1e 00 00       	call   39d8 <link>
    1bb2:	83 c4 10             	add    $0x10,%esp
    1bb5:	e9 7b ff ff ff       	jmp    1b35 <linkunlink+0x65>
  printf(1, "linkunlink test\n");

  unlink("x");
  pid = fork();
  if(pid < 0){
    printf(1, "fork failed\n");
    1bba:	83 ec 08             	sub    $0x8,%esp
    1bbd:	68 31 4d 00 00       	push   $0x4d31
    1bc2:	6a 01                	push   $0x1
    1bc4:	e8 07 1f 00 00       	call   3ad0 <printf>
    exit();
    1bc9:	e8 aa 1d 00 00       	call   3978 <exit>
  }

  if(pid)
    wait();
  else
    exit();
    1bce:	e8 a5 1d 00 00       	call   3978 <exit>
    1bd3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1bd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001be0 <bigdir>:
}

// directory that uses indirect blocks
void
bigdir(void)
{
    1be0:	55                   	push   %ebp
    1be1:	89 e5                	mov    %esp,%ebp
    1be3:	57                   	push   %edi
    1be4:	56                   	push   %esi
    1be5:	53                   	push   %ebx
    1be6:	83 ec 24             	sub    $0x24,%esp
  int i, fd;
  char name[10];

  printf(1, "bigdir test\n");
    1be9:	68 e0 44 00 00       	push   $0x44e0
    1bee:	6a 01                	push   $0x1
    1bf0:	e8 db 1e 00 00       	call   3ad0 <printf>
  unlink("bd");
    1bf5:	c7 04 24 ed 44 00 00 	movl   $0x44ed,(%esp)
    1bfc:	e8 c7 1d 00 00       	call   39c8 <unlink>

  fd = open("bd", O_CREATE);
    1c01:	58                   	pop    %eax
    1c02:	5a                   	pop    %edx
    1c03:	68 00 02 00 00       	push   $0x200
    1c08:	68 ed 44 00 00       	push   $0x44ed
    1c0d:	e8 a6 1d 00 00       	call   39b8 <open>
  if(fd < 0){
    1c12:	83 c4 10             	add    $0x10,%esp
    1c15:	85 c0                	test   %eax,%eax
    1c17:	0f 88 de 00 00 00    	js     1cfb <bigdir+0x11b>
    printf(1, "bigdir create failed\n");
    exit();
  }
  close(fd);
    1c1d:	83 ec 0c             	sub    $0xc,%esp
    1c20:	8d 7d de             	lea    -0x22(%ebp),%edi

  for(i = 0; i < 500; i++){
    1c23:	31 f6                	xor    %esi,%esi
  fd = open("bd", O_CREATE);
  if(fd < 0){
    printf(1, "bigdir create failed\n");
    exit();
  }
  close(fd);
    1c25:	50                   	push   %eax
    1c26:	e8 75 1d 00 00       	call   39a0 <close>
    1c2b:	83 c4 10             	add    $0x10,%esp
    1c2e:	66 90                	xchg   %ax,%ax

  for(i = 0; i < 500; i++){
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    1c30:	89 f0                	mov    %esi,%eax
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    if(link("bd", name) != 0){
    1c32:	83 ec 08             	sub    $0x8,%esp
    exit();
  }
  close(fd);

  for(i = 0; i < 500; i++){
    name[0] = 'x';
    1c35:	c6 45 de 78          	movb   $0x78,-0x22(%ebp)
    name[1] = '0' + (i / 64);
    1c39:	c1 f8 06             	sar    $0x6,%eax
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    if(link("bd", name) != 0){
    1c3c:	57                   	push   %edi
    1c3d:	68 ed 44 00 00       	push   $0x44ed
  }
  close(fd);

  for(i = 0; i < 500; i++){
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    1c42:	83 c0 30             	add    $0x30,%eax
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    1c45:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
  }
  close(fd);

  for(i = 0; i < 500; i++){
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    1c49:	88 45 df             	mov    %al,-0x21(%ebp)
    name[2] = '0' + (i % 64);
    1c4c:	89 f0                	mov    %esi,%eax
    1c4e:	83 e0 3f             	and    $0x3f,%eax
    1c51:	83 c0 30             	add    $0x30,%eax
    1c54:	88 45 e0             	mov    %al,-0x20(%ebp)
    name[3] = '\0';
    if(link("bd", name) != 0){
    1c57:	e8 7c 1d 00 00       	call   39d8 <link>
    1c5c:	83 c4 10             	add    $0x10,%esp
    1c5f:	85 c0                	test   %eax,%eax
    1c61:	89 c3                	mov    %eax,%ebx
    1c63:	75 6e                	jne    1cd3 <bigdir+0xf3>
    printf(1, "bigdir create failed\n");
    exit();
  }
  close(fd);

  for(i = 0; i < 500; i++){
    1c65:	83 c6 01             	add    $0x1,%esi
    1c68:	81 fe f4 01 00 00    	cmp    $0x1f4,%esi
    1c6e:	75 c0                	jne    1c30 <bigdir+0x50>
      printf(1, "bigdir link failed\n");
      exit();
    }
  }

  unlink("bd");
    1c70:	83 ec 0c             	sub    $0xc,%esp
    1c73:	68 ed 44 00 00       	push   $0x44ed
    1c78:	e8 4b 1d 00 00       	call   39c8 <unlink>
    1c7d:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < 500; i++){
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    1c80:	89 d8                	mov    %ebx,%eax
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    if(unlink(name) != 0){
    1c82:	83 ec 0c             	sub    $0xc,%esp
    }
  }

  unlink("bd");
  for(i = 0; i < 500; i++){
    name[0] = 'x';
    1c85:	c6 45 de 78          	movb   $0x78,-0x22(%ebp)
    name[1] = '0' + (i / 64);
    1c89:	c1 f8 06             	sar    $0x6,%eax
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    if(unlink(name) != 0){
    1c8c:	57                   	push   %edi
  unlink("bd");
  for(i = 0; i < 500; i++){
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    1c8d:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
  }

  unlink("bd");
  for(i = 0; i < 500; i++){
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    1c91:	83 c0 30             	add    $0x30,%eax
    1c94:	88 45 df             	mov    %al,-0x21(%ebp)
    name[2] = '0' + (i % 64);
    1c97:	89 d8                	mov    %ebx,%eax
    1c99:	83 e0 3f             	and    $0x3f,%eax
    1c9c:	83 c0 30             	add    $0x30,%eax
    1c9f:	88 45 e0             	mov    %al,-0x20(%ebp)
    name[3] = '\0';
    if(unlink(name) != 0){
    1ca2:	e8 21 1d 00 00       	call   39c8 <unlink>
    1ca7:	83 c4 10             	add    $0x10,%esp
    1caa:	85 c0                	test   %eax,%eax
    1cac:	75 39                	jne    1ce7 <bigdir+0x107>
      exit();
    }
  }

  unlink("bd");
  for(i = 0; i < 500; i++){
    1cae:	83 c3 01             	add    $0x1,%ebx
    1cb1:	81 fb f4 01 00 00    	cmp    $0x1f4,%ebx
    1cb7:	75 c7                	jne    1c80 <bigdir+0xa0>
      printf(1, "bigdir unlink failed");
      exit();
    }
  }

  printf(1, "bigdir ok\n");
    1cb9:	83 ec 08             	sub    $0x8,%esp
    1cbc:	68 2f 45 00 00       	push   $0x452f
    1cc1:	6a 01                	push   $0x1
    1cc3:	e8 08 1e 00 00       	call   3ad0 <printf>
}
    1cc8:	83 c4 10             	add    $0x10,%esp
    1ccb:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1cce:	5b                   	pop    %ebx
    1ccf:	5e                   	pop    %esi
    1cd0:	5f                   	pop    %edi
    1cd1:	5d                   	pop    %ebp
    1cd2:	c3                   	ret    
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    if(link("bd", name) != 0){
      printf(1, "bigdir link failed\n");
    1cd3:	83 ec 08             	sub    $0x8,%esp
    1cd6:	68 06 45 00 00       	push   $0x4506
    1cdb:	6a 01                	push   $0x1
    1cdd:	e8 ee 1d 00 00       	call   3ad0 <printf>
      exit();
    1ce2:	e8 91 1c 00 00       	call   3978 <exit>
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    if(unlink(name) != 0){
      printf(1, "bigdir unlink failed");
    1ce7:	83 ec 08             	sub    $0x8,%esp
    1cea:	68 1a 45 00 00       	push   $0x451a
    1cef:	6a 01                	push   $0x1
    1cf1:	e8 da 1d 00 00       	call   3ad0 <printf>
      exit();
    1cf6:	e8 7d 1c 00 00       	call   3978 <exit>
  printf(1, "bigdir test\n");
  unlink("bd");

  fd = open("bd", O_CREATE);
  if(fd < 0){
    printf(1, "bigdir create failed\n");
    1cfb:	83 ec 08             	sub    $0x8,%esp
    1cfe:	68 f0 44 00 00       	push   $0x44f0
    1d03:	6a 01                	push   $0x1
    1d05:	e8 c6 1d 00 00       	call   3ad0 <printf>
    exit();
    1d0a:	e8 69 1c 00 00       	call   3978 <exit>
    1d0f:	90                   	nop

00001d10 <subdir>:
  printf(1, "bigdir ok\n");
}

void
subdir(void)
{
    1d10:	55                   	push   %ebp
    1d11:	89 e5                	mov    %esp,%ebp
    1d13:	53                   	push   %ebx
    1d14:	83 ec 0c             	sub    $0xc,%esp
  int fd, cc;

  printf(1, "subdir test\n");
    1d17:	68 3a 45 00 00       	push   $0x453a
    1d1c:	6a 01                	push   $0x1
    1d1e:	e8 ad 1d 00 00       	call   3ad0 <printf>

  unlink("ff");
    1d23:	c7 04 24 c3 45 00 00 	movl   $0x45c3,(%esp)
    1d2a:	e8 99 1c 00 00       	call   39c8 <unlink>
  if(mkdir("dd") != 0){
    1d2f:	c7 04 24 60 46 00 00 	movl   $0x4660,(%esp)
    1d36:	e8 a5 1c 00 00       	call   39e0 <mkdir>
    1d3b:	83 c4 10             	add    $0x10,%esp
    1d3e:	85 c0                	test   %eax,%eax
    1d40:	0f 85 b3 05 00 00    	jne    22f9 <subdir+0x5e9>
    printf(1, "subdir mkdir dd failed\n");
    exit();
  }

  fd = open("dd/ff", O_CREATE | O_RDWR);
    1d46:	83 ec 08             	sub    $0x8,%esp
    1d49:	68 02 02 00 00       	push   $0x202
    1d4e:	68 99 45 00 00       	push   $0x4599
    1d53:	e8 60 1c 00 00       	call   39b8 <open>
  if(fd < 0){
    1d58:	83 c4 10             	add    $0x10,%esp
    1d5b:	85 c0                	test   %eax,%eax
  if(mkdir("dd") != 0){
    printf(1, "subdir mkdir dd failed\n");
    exit();
  }

  fd = open("dd/ff", O_CREATE | O_RDWR);
    1d5d:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1d5f:	0f 88 81 05 00 00    	js     22e6 <subdir+0x5d6>
    printf(1, "create dd/ff failed\n");
    exit();
  }
  write(fd, "ff", 2);
    1d65:	83 ec 04             	sub    $0x4,%esp
    1d68:	6a 02                	push   $0x2
    1d6a:	68 c3 45 00 00       	push   $0x45c3
    1d6f:	50                   	push   %eax
    1d70:	e8 23 1c 00 00       	call   3998 <write>
  close(fd);
    1d75:	89 1c 24             	mov    %ebx,(%esp)
    1d78:	e8 23 1c 00 00       	call   39a0 <close>

  if(unlink("dd") >= 0){
    1d7d:	c7 04 24 60 46 00 00 	movl   $0x4660,(%esp)
    1d84:	e8 3f 1c 00 00       	call   39c8 <unlink>
    1d89:	83 c4 10             	add    $0x10,%esp
    1d8c:	85 c0                	test   %eax,%eax
    1d8e:	0f 89 3f 05 00 00    	jns    22d3 <subdir+0x5c3>
    printf(1, "unlink dd (non-empty dir) succeeded!\n");
    exit();
  }

  if(mkdir("/dd/dd") != 0){
    1d94:	83 ec 0c             	sub    $0xc,%esp
    1d97:	68 74 45 00 00       	push   $0x4574
    1d9c:	e8 3f 1c 00 00       	call   39e0 <mkdir>
    1da1:	83 c4 10             	add    $0x10,%esp
    1da4:	85 c0                	test   %eax,%eax
    1da6:	0f 85 14 05 00 00    	jne    22c0 <subdir+0x5b0>
    printf(1, "subdir mkdir dd/dd failed\n");
    exit();
  }

  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
    1dac:	83 ec 08             	sub    $0x8,%esp
    1daf:	68 02 02 00 00       	push   $0x202
    1db4:	68 96 45 00 00       	push   $0x4596
    1db9:	e8 fa 1b 00 00       	call   39b8 <open>
  if(fd < 0){
    1dbe:	83 c4 10             	add    $0x10,%esp
    1dc1:	85 c0                	test   %eax,%eax
  if(mkdir("/dd/dd") != 0){
    printf(1, "subdir mkdir dd/dd failed\n");
    exit();
  }

  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
    1dc3:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1dc5:	0f 88 24 04 00 00    	js     21ef <subdir+0x4df>
    printf(1, "create dd/dd/ff failed\n");
    exit();
  }
  write(fd, "FF", 2);
    1dcb:	83 ec 04             	sub    $0x4,%esp
    1dce:	6a 02                	push   $0x2
    1dd0:	68 b7 45 00 00       	push   $0x45b7
    1dd5:	50                   	push   %eax
    1dd6:	e8 bd 1b 00 00       	call   3998 <write>
  close(fd);
    1ddb:	89 1c 24             	mov    %ebx,(%esp)
    1dde:	e8 bd 1b 00 00       	call   39a0 <close>

  fd = open("dd/dd/../ff", 0);
    1de3:	58                   	pop    %eax
    1de4:	5a                   	pop    %edx
    1de5:	6a 00                	push   $0x0
    1de7:	68 ba 45 00 00       	push   $0x45ba
    1dec:	e8 c7 1b 00 00       	call   39b8 <open>
  if(fd < 0){
    1df1:	83 c4 10             	add    $0x10,%esp
    1df4:	85 c0                	test   %eax,%eax
    exit();
  }
  write(fd, "FF", 2);
  close(fd);

  fd = open("dd/dd/../ff", 0);
    1df6:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1df8:	0f 88 de 03 00 00    	js     21dc <subdir+0x4cc>
    printf(1, "open dd/dd/../ff failed\n");
    exit();
  }
  cc = read(fd, buf, sizeof(buf));
    1dfe:	83 ec 04             	sub    $0x4,%esp
    1e01:	68 00 20 00 00       	push   $0x2000
    1e06:	68 00 87 00 00       	push   $0x8700
    1e0b:	50                   	push   %eax
    1e0c:	e8 7f 1b 00 00       	call   3990 <read>
  if(cc != 2 || buf[0] != 'f'){
    1e11:	83 c4 10             	add    $0x10,%esp
    1e14:	83 f8 02             	cmp    $0x2,%eax
    1e17:	0f 85 3a 03 00 00    	jne    2157 <subdir+0x447>
    1e1d:	80 3d 00 87 00 00 66 	cmpb   $0x66,0x8700
    1e24:	0f 85 2d 03 00 00    	jne    2157 <subdir+0x447>
    printf(1, "dd/dd/../ff wrong content\n");
    exit();
  }
  close(fd);
    1e2a:	83 ec 0c             	sub    $0xc,%esp
    1e2d:	53                   	push   %ebx
    1e2e:	e8 6d 1b 00 00       	call   39a0 <close>

  if(link("dd/dd/ff", "dd/dd/ffff") != 0){
    1e33:	5b                   	pop    %ebx
    1e34:	58                   	pop    %eax
    1e35:	68 fa 45 00 00       	push   $0x45fa
    1e3a:	68 96 45 00 00       	push   $0x4596
    1e3f:	e8 94 1b 00 00       	call   39d8 <link>
    1e44:	83 c4 10             	add    $0x10,%esp
    1e47:	85 c0                	test   %eax,%eax
    1e49:	0f 85 c6 03 00 00    	jne    2215 <subdir+0x505>
    printf(1, "link dd/dd/ff dd/dd/ffff failed\n");
    exit();
  }

  if(unlink("dd/dd/ff") != 0){
    1e4f:	83 ec 0c             	sub    $0xc,%esp
    1e52:	68 96 45 00 00       	push   $0x4596
    1e57:	e8 6c 1b 00 00       	call   39c8 <unlink>
    1e5c:	83 c4 10             	add    $0x10,%esp
    1e5f:	85 c0                	test   %eax,%eax
    1e61:	0f 85 16 03 00 00    	jne    217d <subdir+0x46d>
    printf(1, "unlink dd/dd/ff failed\n");
    exit();
  }
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    1e67:	83 ec 08             	sub    $0x8,%esp
    1e6a:	6a 00                	push   $0x0
    1e6c:	68 96 45 00 00       	push   $0x4596
    1e71:	e8 42 1b 00 00       	call   39b8 <open>
    1e76:	83 c4 10             	add    $0x10,%esp
    1e79:	85 c0                	test   %eax,%eax
    1e7b:	0f 89 2c 04 00 00    	jns    22ad <subdir+0x59d>
    printf(1, "open (unlinked) dd/dd/ff succeeded\n");
    exit();
  }

  if(chdir("dd") != 0){
    1e81:	83 ec 0c             	sub    $0xc,%esp
    1e84:	68 60 46 00 00       	push   $0x4660
    1e89:	e8 5a 1b 00 00       	call   39e8 <chdir>
    1e8e:	83 c4 10             	add    $0x10,%esp
    1e91:	85 c0                	test   %eax,%eax
    1e93:	0f 85 01 04 00 00    	jne    229a <subdir+0x58a>
    printf(1, "chdir dd failed\n");
    exit();
  }
  if(chdir("dd/../../dd") != 0){
    1e99:	83 ec 0c             	sub    $0xc,%esp
    1e9c:	68 2e 46 00 00       	push   $0x462e
    1ea1:	e8 42 1b 00 00       	call   39e8 <chdir>
    1ea6:	83 c4 10             	add    $0x10,%esp
    1ea9:	85 c0                	test   %eax,%eax
    1eab:	0f 85 b9 02 00 00    	jne    216a <subdir+0x45a>
    printf(1, "chdir dd/../../dd failed\n");
    exit();
  }
  if(chdir("dd/../../../dd") != 0){
    1eb1:	83 ec 0c             	sub    $0xc,%esp
    1eb4:	68 54 46 00 00       	push   $0x4654
    1eb9:	e8 2a 1b 00 00       	call   39e8 <chdir>
    1ebe:	83 c4 10             	add    $0x10,%esp
    1ec1:	85 c0                	test   %eax,%eax
    1ec3:	0f 85 a1 02 00 00    	jne    216a <subdir+0x45a>
    printf(1, "chdir dd/../../dd failed\n");
    exit();
  }
  if(chdir("./..") != 0){
    1ec9:	83 ec 0c             	sub    $0xc,%esp
    1ecc:	68 63 46 00 00       	push   $0x4663
    1ed1:	e8 12 1b 00 00       	call   39e8 <chdir>
    1ed6:	83 c4 10             	add    $0x10,%esp
    1ed9:	85 c0                	test   %eax,%eax
    1edb:	0f 85 21 03 00 00    	jne    2202 <subdir+0x4f2>
    printf(1, "chdir ./.. failed\n");
    exit();
  }

  fd = open("dd/dd/ffff", 0);
    1ee1:	83 ec 08             	sub    $0x8,%esp
    1ee4:	6a 00                	push   $0x0
    1ee6:	68 fa 45 00 00       	push   $0x45fa
    1eeb:	e8 c8 1a 00 00       	call   39b8 <open>
  if(fd < 0){
    1ef0:	83 c4 10             	add    $0x10,%esp
    1ef3:	85 c0                	test   %eax,%eax
  if(chdir("./..") != 0){
    printf(1, "chdir ./.. failed\n");
    exit();
  }

  fd = open("dd/dd/ffff", 0);
    1ef5:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1ef7:	0f 88 e0 04 00 00    	js     23dd <subdir+0x6cd>
    printf(1, "open dd/dd/ffff failed\n");
    exit();
  }
  if(read(fd, buf, sizeof(buf)) != 2){
    1efd:	83 ec 04             	sub    $0x4,%esp
    1f00:	68 00 20 00 00       	push   $0x2000
    1f05:	68 00 87 00 00       	push   $0x8700
    1f0a:	50                   	push   %eax
    1f0b:	e8 80 1a 00 00       	call   3990 <read>
    1f10:	83 c4 10             	add    $0x10,%esp
    1f13:	83 f8 02             	cmp    $0x2,%eax
    1f16:	0f 85 ae 04 00 00    	jne    23ca <subdir+0x6ba>
    printf(1, "read dd/dd/ffff wrong len\n");
    exit();
  }
  close(fd);
    1f1c:	83 ec 0c             	sub    $0xc,%esp
    1f1f:	53                   	push   %ebx
    1f20:	e8 7b 1a 00 00       	call   39a0 <close>

  if(open("dd/dd/ff", O_RDONLY) >= 0){
    1f25:	59                   	pop    %ecx
    1f26:	5b                   	pop    %ebx
    1f27:	6a 00                	push   $0x0
    1f29:	68 96 45 00 00       	push   $0x4596
    1f2e:	e8 85 1a 00 00       	call   39b8 <open>
    1f33:	83 c4 10             	add    $0x10,%esp
    1f36:	85 c0                	test   %eax,%eax
    1f38:	0f 89 65 02 00 00    	jns    21a3 <subdir+0x493>
    printf(1, "open (unlinked) dd/dd/ff succeeded!\n");
    exit();
  }

  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    1f3e:	83 ec 08             	sub    $0x8,%esp
    1f41:	68 02 02 00 00       	push   $0x202
    1f46:	68 ae 46 00 00       	push   $0x46ae
    1f4b:	e8 68 1a 00 00       	call   39b8 <open>
    1f50:	83 c4 10             	add    $0x10,%esp
    1f53:	85 c0                	test   %eax,%eax
    1f55:	0f 89 35 02 00 00    	jns    2190 <subdir+0x480>
    printf(1, "create dd/ff/ff succeeded!\n");
    exit();
  }
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    1f5b:	83 ec 08             	sub    $0x8,%esp
    1f5e:	68 02 02 00 00       	push   $0x202
    1f63:	68 d3 46 00 00       	push   $0x46d3
    1f68:	e8 4b 1a 00 00       	call   39b8 <open>
    1f6d:	83 c4 10             	add    $0x10,%esp
    1f70:	85 c0                	test   %eax,%eax
    1f72:	0f 89 0f 03 00 00    	jns    2287 <subdir+0x577>
    printf(1, "create dd/xx/ff succeeded!\n");
    exit();
  }
  if(open("dd", O_CREATE) >= 0){
    1f78:	83 ec 08             	sub    $0x8,%esp
    1f7b:	68 00 02 00 00       	push   $0x200
    1f80:	68 60 46 00 00       	push   $0x4660
    1f85:	e8 2e 1a 00 00       	call   39b8 <open>
    1f8a:	83 c4 10             	add    $0x10,%esp
    1f8d:	85 c0                	test   %eax,%eax
    1f8f:	0f 89 df 02 00 00    	jns    2274 <subdir+0x564>
    printf(1, "create dd succeeded!\n");
    exit();
  }
  if(open("dd", O_RDWR) >= 0){
    1f95:	83 ec 08             	sub    $0x8,%esp
    1f98:	6a 02                	push   $0x2
    1f9a:	68 60 46 00 00       	push   $0x4660
    1f9f:	e8 14 1a 00 00       	call   39b8 <open>
    1fa4:	83 c4 10             	add    $0x10,%esp
    1fa7:	85 c0                	test   %eax,%eax
    1fa9:	0f 89 b2 02 00 00    	jns    2261 <subdir+0x551>
    printf(1, "open dd rdwr succeeded!\n");
    exit();
  }
  if(open("dd", O_WRONLY) >= 0){
    1faf:	83 ec 08             	sub    $0x8,%esp
    1fb2:	6a 01                	push   $0x1
    1fb4:	68 60 46 00 00       	push   $0x4660
    1fb9:	e8 fa 19 00 00       	call   39b8 <open>
    1fbe:	83 c4 10             	add    $0x10,%esp
    1fc1:	85 c0                	test   %eax,%eax
    1fc3:	0f 89 85 02 00 00    	jns    224e <subdir+0x53e>
    printf(1, "open dd wronly succeeded!\n");
    exit();
  }
  if(link("dd/ff/ff", "dd/dd/xx") == 0){
    1fc9:	83 ec 08             	sub    $0x8,%esp
    1fcc:	68 42 47 00 00       	push   $0x4742
    1fd1:	68 ae 46 00 00       	push   $0x46ae
    1fd6:	e8 fd 19 00 00       	call   39d8 <link>
    1fdb:	83 c4 10             	add    $0x10,%esp
    1fde:	85 c0                	test   %eax,%eax
    1fe0:	0f 84 55 02 00 00    	je     223b <subdir+0x52b>
    printf(1, "link dd/ff/ff dd/dd/xx succeeded!\n");
    exit();
  }
  if(link("dd/xx/ff", "dd/dd/xx") == 0){
    1fe6:	83 ec 08             	sub    $0x8,%esp
    1fe9:	68 42 47 00 00       	push   $0x4742
    1fee:	68 d3 46 00 00       	push   $0x46d3
    1ff3:	e8 e0 19 00 00       	call   39d8 <link>
    1ff8:	83 c4 10             	add    $0x10,%esp
    1ffb:	85 c0                	test   %eax,%eax
    1ffd:	0f 84 25 02 00 00    	je     2228 <subdir+0x518>
    printf(1, "link dd/xx/ff dd/dd/xx succeeded!\n");
    exit();
  }
  if(link("dd/ff", "dd/dd/ffff") == 0){
    2003:	83 ec 08             	sub    $0x8,%esp
    2006:	68 fa 45 00 00       	push   $0x45fa
    200b:	68 99 45 00 00       	push   $0x4599
    2010:	e8 c3 19 00 00       	call   39d8 <link>
    2015:	83 c4 10             	add    $0x10,%esp
    2018:	85 c0                	test   %eax,%eax
    201a:	0f 84 a9 01 00 00    	je     21c9 <subdir+0x4b9>
    printf(1, "link dd/ff dd/dd/ffff succeeded!\n");
    exit();
  }
  if(mkdir("dd/ff/ff") == 0){
    2020:	83 ec 0c             	sub    $0xc,%esp
    2023:	68 ae 46 00 00       	push   $0x46ae
    2028:	e8 b3 19 00 00       	call   39e0 <mkdir>
    202d:	83 c4 10             	add    $0x10,%esp
    2030:	85 c0                	test   %eax,%eax
    2032:	0f 84 7e 01 00 00    	je     21b6 <subdir+0x4a6>
    printf(1, "mkdir dd/ff/ff succeeded!\n");
    exit();
  }
  if(mkdir("dd/xx/ff") == 0){
    2038:	83 ec 0c             	sub    $0xc,%esp
    203b:	68 d3 46 00 00       	push   $0x46d3
    2040:	e8 9b 19 00 00       	call   39e0 <mkdir>
    2045:	83 c4 10             	add    $0x10,%esp
    2048:	85 c0                	test   %eax,%eax
    204a:	0f 84 67 03 00 00    	je     23b7 <subdir+0x6a7>
    printf(1, "mkdir dd/xx/ff succeeded!\n");
    exit();
  }
  if(mkdir("dd/dd/ffff") == 0){
    2050:	83 ec 0c             	sub    $0xc,%esp
    2053:	68 fa 45 00 00       	push   $0x45fa
    2058:	e8 83 19 00 00       	call   39e0 <mkdir>
    205d:	83 c4 10             	add    $0x10,%esp
    2060:	85 c0                	test   %eax,%eax
    2062:	0f 84 3c 03 00 00    	je     23a4 <subdir+0x694>
    printf(1, "mkdir dd/dd/ffff succeeded!\n");
    exit();
  }
  if(unlink("dd/xx/ff") == 0){
    2068:	83 ec 0c             	sub    $0xc,%esp
    206b:	68 d3 46 00 00       	push   $0x46d3
    2070:	e8 53 19 00 00       	call   39c8 <unlink>
    2075:	83 c4 10             	add    $0x10,%esp
    2078:	85 c0                	test   %eax,%eax
    207a:	0f 84 11 03 00 00    	je     2391 <subdir+0x681>
    printf(1, "unlink dd/xx/ff succeeded!\n");
    exit();
  }
  if(unlink("dd/ff/ff") == 0){
    2080:	83 ec 0c             	sub    $0xc,%esp
    2083:	68 ae 46 00 00       	push   $0x46ae
    2088:	e8 3b 19 00 00       	call   39c8 <unlink>
    208d:	83 c4 10             	add    $0x10,%esp
    2090:	85 c0                	test   %eax,%eax
    2092:	0f 84 e6 02 00 00    	je     237e <subdir+0x66e>
    printf(1, "unlink dd/ff/ff succeeded!\n");
    exit();
  }
  if(chdir("dd/ff") == 0){
    2098:	83 ec 0c             	sub    $0xc,%esp
    209b:	68 99 45 00 00       	push   $0x4599
    20a0:	e8 43 19 00 00       	call   39e8 <chdir>
    20a5:	83 c4 10             	add    $0x10,%esp
    20a8:	85 c0                	test   %eax,%eax
    20aa:	0f 84 bb 02 00 00    	je     236b <subdir+0x65b>
    printf(1, "chdir dd/ff succeeded!\n");
    exit();
  }
  if(chdir("dd/xx") == 0){
    20b0:	83 ec 0c             	sub    $0xc,%esp
    20b3:	68 45 47 00 00       	push   $0x4745
    20b8:	e8 2b 19 00 00       	call   39e8 <chdir>
    20bd:	83 c4 10             	add    $0x10,%esp
    20c0:	85 c0                	test   %eax,%eax
    20c2:	0f 84 90 02 00 00    	je     2358 <subdir+0x648>
    printf(1, "chdir dd/xx succeeded!\n");
    exit();
  }

  if(unlink("dd/dd/ffff") != 0){
    20c8:	83 ec 0c             	sub    $0xc,%esp
    20cb:	68 fa 45 00 00       	push   $0x45fa
    20d0:	e8 f3 18 00 00       	call   39c8 <unlink>
    20d5:	83 c4 10             	add    $0x10,%esp
    20d8:	85 c0                	test   %eax,%eax
    20da:	0f 85 9d 00 00 00    	jne    217d <subdir+0x46d>
    printf(1, "unlink dd/dd/ff failed\n");
    exit();
  }
  if(unlink("dd/ff") != 0){
    20e0:	83 ec 0c             	sub    $0xc,%esp
    20e3:	68 99 45 00 00       	push   $0x4599
    20e8:	e8 db 18 00 00       	call   39c8 <unlink>
    20ed:	83 c4 10             	add    $0x10,%esp
    20f0:	85 c0                	test   %eax,%eax
    20f2:	0f 85 4d 02 00 00    	jne    2345 <subdir+0x635>
    printf(1, "unlink dd/ff failed\n");
    exit();
  }
  if(unlink("dd") == 0){
    20f8:	83 ec 0c             	sub    $0xc,%esp
    20fb:	68 60 46 00 00       	push   $0x4660
    2100:	e8 c3 18 00 00       	call   39c8 <unlink>
    2105:	83 c4 10             	add    $0x10,%esp
    2108:	85 c0                	test   %eax,%eax
    210a:	0f 84 22 02 00 00    	je     2332 <subdir+0x622>
    printf(1, "unlink non-empty dd succeeded!\n");
    exit();
  }
  if(unlink("dd/dd") < 0){
    2110:	83 ec 0c             	sub    $0xc,%esp
    2113:	68 75 45 00 00       	push   $0x4575
    2118:	e8 ab 18 00 00       	call   39c8 <unlink>
    211d:	83 c4 10             	add    $0x10,%esp
    2120:	85 c0                	test   %eax,%eax
    2122:	0f 88 f7 01 00 00    	js     231f <subdir+0x60f>
    printf(1, "unlink dd/dd failed\n");
    exit();
  }
  if(unlink("dd") < 0){
    2128:	83 ec 0c             	sub    $0xc,%esp
    212b:	68 60 46 00 00       	push   $0x4660
    2130:	e8 93 18 00 00       	call   39c8 <unlink>
    2135:	83 c4 10             	add    $0x10,%esp
    2138:	85 c0                	test   %eax,%eax
    213a:	0f 88 cc 01 00 00    	js     230c <subdir+0x5fc>
    printf(1, "unlink dd failed\n");
    exit();
  }

  printf(1, "subdir ok\n");
    2140:	83 ec 08             	sub    $0x8,%esp
    2143:	68 42 48 00 00       	push   $0x4842
    2148:	6a 01                	push   $0x1
    214a:	e8 81 19 00 00       	call   3ad0 <printf>
}
    214f:	83 c4 10             	add    $0x10,%esp
    2152:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2155:	c9                   	leave  
    2156:	c3                   	ret    
    printf(1, "open dd/dd/../ff failed\n");
    exit();
  }
  cc = read(fd, buf, sizeof(buf));
  if(cc != 2 || buf[0] != 'f'){
    printf(1, "dd/dd/../ff wrong content\n");
    2157:	50                   	push   %eax
    2158:	50                   	push   %eax
    2159:	68 df 45 00 00       	push   $0x45df
    215e:	6a 01                	push   $0x1
    2160:	e8 6b 19 00 00       	call   3ad0 <printf>
    exit();
    2165:	e8 0e 18 00 00       	call   3978 <exit>
  if(chdir("dd") != 0){
    printf(1, "chdir dd failed\n");
    exit();
  }
  if(chdir("dd/../../dd") != 0){
    printf(1, "chdir dd/../../dd failed\n");
    216a:	50                   	push   %eax
    216b:	50                   	push   %eax
    216c:	68 3a 46 00 00       	push   $0x463a
    2171:	6a 01                	push   $0x1
    2173:	e8 58 19 00 00       	call   3ad0 <printf>
    exit();
    2178:	e8 fb 17 00 00       	call   3978 <exit>
    printf(1, "link dd/dd/ff dd/dd/ffff failed\n");
    exit();
  }

  if(unlink("dd/dd/ff") != 0){
    printf(1, "unlink dd/dd/ff failed\n");
    217d:	52                   	push   %edx
    217e:	52                   	push   %edx
    217f:	68 05 46 00 00       	push   $0x4605
    2184:	6a 01                	push   $0x1
    2186:	e8 45 19 00 00       	call   3ad0 <printf>
    exit();
    218b:	e8 e8 17 00 00       	call   3978 <exit>
    printf(1, "open (unlinked) dd/dd/ff succeeded!\n");
    exit();
  }

  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    printf(1, "create dd/ff/ff succeeded!\n");
    2190:	50                   	push   %eax
    2191:	50                   	push   %eax
    2192:	68 b7 46 00 00       	push   $0x46b7
    2197:	6a 01                	push   $0x1
    2199:	e8 32 19 00 00       	call   3ad0 <printf>
    exit();
    219e:	e8 d5 17 00 00       	call   3978 <exit>
    exit();
  }
  close(fd);

  if(open("dd/dd/ff", O_RDONLY) >= 0){
    printf(1, "open (unlinked) dd/dd/ff succeeded!\n");
    21a3:	52                   	push   %edx
    21a4:	52                   	push   %edx
    21a5:	68 9c 50 00 00       	push   $0x509c
    21aa:	6a 01                	push   $0x1
    21ac:	e8 1f 19 00 00       	call   3ad0 <printf>
    exit();
    21b1:	e8 c2 17 00 00       	call   3978 <exit>
  if(link("dd/ff", "dd/dd/ffff") == 0){
    printf(1, "link dd/ff dd/dd/ffff succeeded!\n");
    exit();
  }
  if(mkdir("dd/ff/ff") == 0){
    printf(1, "mkdir dd/ff/ff succeeded!\n");
    21b6:	52                   	push   %edx
    21b7:	52                   	push   %edx
    21b8:	68 4b 47 00 00       	push   $0x474b
    21bd:	6a 01                	push   $0x1
    21bf:	e8 0c 19 00 00       	call   3ad0 <printf>
    exit();
    21c4:	e8 af 17 00 00       	call   3978 <exit>
  if(link("dd/xx/ff", "dd/dd/xx") == 0){
    printf(1, "link dd/xx/ff dd/dd/xx succeeded!\n");
    exit();
  }
  if(link("dd/ff", "dd/dd/ffff") == 0){
    printf(1, "link dd/ff dd/dd/ffff succeeded!\n");
    21c9:	51                   	push   %ecx
    21ca:	51                   	push   %ecx
    21cb:	68 0c 51 00 00       	push   $0x510c
    21d0:	6a 01                	push   $0x1
    21d2:	e8 f9 18 00 00       	call   3ad0 <printf>
    exit();
    21d7:	e8 9c 17 00 00       	call   3978 <exit>
  write(fd, "FF", 2);
  close(fd);

  fd = open("dd/dd/../ff", 0);
  if(fd < 0){
    printf(1, "open dd/dd/../ff failed\n");
    21dc:	50                   	push   %eax
    21dd:	50                   	push   %eax
    21de:	68 c6 45 00 00       	push   $0x45c6
    21e3:	6a 01                	push   $0x1
    21e5:	e8 e6 18 00 00       	call   3ad0 <printf>
    exit();
    21ea:	e8 89 17 00 00       	call   3978 <exit>
    exit();
  }

  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "create dd/dd/ff failed\n");
    21ef:	51                   	push   %ecx
    21f0:	51                   	push   %ecx
    21f1:	68 9f 45 00 00       	push   $0x459f
    21f6:	6a 01                	push   $0x1
    21f8:	e8 d3 18 00 00       	call   3ad0 <printf>
    exit();
    21fd:	e8 76 17 00 00       	call   3978 <exit>
  if(chdir("dd/../../../dd") != 0){
    printf(1, "chdir dd/../../dd failed\n");
    exit();
  }
  if(chdir("./..") != 0){
    printf(1, "chdir ./.. failed\n");
    2202:	50                   	push   %eax
    2203:	50                   	push   %eax
    2204:	68 68 46 00 00       	push   $0x4668
    2209:	6a 01                	push   $0x1
    220b:	e8 c0 18 00 00       	call   3ad0 <printf>
    exit();
    2210:	e8 63 17 00 00       	call   3978 <exit>
    exit();
  }
  close(fd);

  if(link("dd/dd/ff", "dd/dd/ffff") != 0){
    printf(1, "link dd/dd/ff dd/dd/ffff failed\n");
    2215:	51                   	push   %ecx
    2216:	51                   	push   %ecx
    2217:	68 54 50 00 00       	push   $0x5054
    221c:	6a 01                	push   $0x1
    221e:	e8 ad 18 00 00       	call   3ad0 <printf>
    exit();
    2223:	e8 50 17 00 00       	call   3978 <exit>
  if(link("dd/ff/ff", "dd/dd/xx") == 0){
    printf(1, "link dd/ff/ff dd/dd/xx succeeded!\n");
    exit();
  }
  if(link("dd/xx/ff", "dd/dd/xx") == 0){
    printf(1, "link dd/xx/ff dd/dd/xx succeeded!\n");
    2228:	53                   	push   %ebx
    2229:	53                   	push   %ebx
    222a:	68 e8 50 00 00       	push   $0x50e8
    222f:	6a 01                	push   $0x1
    2231:	e8 9a 18 00 00       	call   3ad0 <printf>
    exit();
    2236:	e8 3d 17 00 00       	call   3978 <exit>
  if(open("dd", O_WRONLY) >= 0){
    printf(1, "open dd wronly succeeded!\n");
    exit();
  }
  if(link("dd/ff/ff", "dd/dd/xx") == 0){
    printf(1, "link dd/ff/ff dd/dd/xx succeeded!\n");
    223b:	50                   	push   %eax
    223c:	50                   	push   %eax
    223d:	68 c4 50 00 00       	push   $0x50c4
    2242:	6a 01                	push   $0x1
    2244:	e8 87 18 00 00       	call   3ad0 <printf>
    exit();
    2249:	e8 2a 17 00 00       	call   3978 <exit>
  if(open("dd", O_RDWR) >= 0){
    printf(1, "open dd rdwr succeeded!\n");
    exit();
  }
  if(open("dd", O_WRONLY) >= 0){
    printf(1, "open dd wronly succeeded!\n");
    224e:	50                   	push   %eax
    224f:	50                   	push   %eax
    2250:	68 27 47 00 00       	push   $0x4727
    2255:	6a 01                	push   $0x1
    2257:	e8 74 18 00 00       	call   3ad0 <printf>
    exit();
    225c:	e8 17 17 00 00       	call   3978 <exit>
  if(open("dd", O_CREATE) >= 0){
    printf(1, "create dd succeeded!\n");
    exit();
  }
  if(open("dd", O_RDWR) >= 0){
    printf(1, "open dd rdwr succeeded!\n");
    2261:	50                   	push   %eax
    2262:	50                   	push   %eax
    2263:	68 0e 47 00 00       	push   $0x470e
    2268:	6a 01                	push   $0x1
    226a:	e8 61 18 00 00       	call   3ad0 <printf>
    exit();
    226f:	e8 04 17 00 00       	call   3978 <exit>
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    printf(1, "create dd/xx/ff succeeded!\n");
    exit();
  }
  if(open("dd", O_CREATE) >= 0){
    printf(1, "create dd succeeded!\n");
    2274:	50                   	push   %eax
    2275:	50                   	push   %eax
    2276:	68 f8 46 00 00       	push   $0x46f8
    227b:	6a 01                	push   $0x1
    227d:	e8 4e 18 00 00       	call   3ad0 <printf>
    exit();
    2282:	e8 f1 16 00 00       	call   3978 <exit>
  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    printf(1, "create dd/ff/ff succeeded!\n");
    exit();
  }
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    printf(1, "create dd/xx/ff succeeded!\n");
    2287:	50                   	push   %eax
    2288:	50                   	push   %eax
    2289:	68 dc 46 00 00       	push   $0x46dc
    228e:	6a 01                	push   $0x1
    2290:	e8 3b 18 00 00       	call   3ad0 <printf>
    exit();
    2295:	e8 de 16 00 00       	call   3978 <exit>
    printf(1, "open (unlinked) dd/dd/ff succeeded\n");
    exit();
  }

  if(chdir("dd") != 0){
    printf(1, "chdir dd failed\n");
    229a:	50                   	push   %eax
    229b:	50                   	push   %eax
    229c:	68 1d 46 00 00       	push   $0x461d
    22a1:	6a 01                	push   $0x1
    22a3:	e8 28 18 00 00       	call   3ad0 <printf>
    exit();
    22a8:	e8 cb 16 00 00       	call   3978 <exit>
  if(unlink("dd/dd/ff") != 0){
    printf(1, "unlink dd/dd/ff failed\n");
    exit();
  }
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    printf(1, "open (unlinked) dd/dd/ff succeeded\n");
    22ad:	50                   	push   %eax
    22ae:	50                   	push   %eax
    22af:	68 78 50 00 00       	push   $0x5078
    22b4:	6a 01                	push   $0x1
    22b6:	e8 15 18 00 00       	call   3ad0 <printf>
    exit();
    22bb:	e8 b8 16 00 00       	call   3978 <exit>
    printf(1, "unlink dd (non-empty dir) succeeded!\n");
    exit();
  }

  if(mkdir("/dd/dd") != 0){
    printf(1, "subdir mkdir dd/dd failed\n");
    22c0:	53                   	push   %ebx
    22c1:	53                   	push   %ebx
    22c2:	68 7b 45 00 00       	push   $0x457b
    22c7:	6a 01                	push   $0x1
    22c9:	e8 02 18 00 00       	call   3ad0 <printf>
    exit();
    22ce:	e8 a5 16 00 00       	call   3978 <exit>
  }
  write(fd, "ff", 2);
  close(fd);

  if(unlink("dd") >= 0){
    printf(1, "unlink dd (non-empty dir) succeeded!\n");
    22d3:	50                   	push   %eax
    22d4:	50                   	push   %eax
    22d5:	68 2c 50 00 00       	push   $0x502c
    22da:	6a 01                	push   $0x1
    22dc:	e8 ef 17 00 00       	call   3ad0 <printf>
    exit();
    22e1:	e8 92 16 00 00       	call   3978 <exit>
    exit();
  }

  fd = open("dd/ff", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "create dd/ff failed\n");
    22e6:	50                   	push   %eax
    22e7:	50                   	push   %eax
    22e8:	68 5f 45 00 00       	push   $0x455f
    22ed:	6a 01                	push   $0x1
    22ef:	e8 dc 17 00 00       	call   3ad0 <printf>
    exit();
    22f4:	e8 7f 16 00 00       	call   3978 <exit>

  printf(1, "subdir test\n");

  unlink("ff");
  if(mkdir("dd") != 0){
    printf(1, "subdir mkdir dd failed\n");
    22f9:	50                   	push   %eax
    22fa:	50                   	push   %eax
    22fb:	68 47 45 00 00       	push   $0x4547
    2300:	6a 01                	push   $0x1
    2302:	e8 c9 17 00 00       	call   3ad0 <printf>
    exit();
    2307:	e8 6c 16 00 00       	call   3978 <exit>
  if(unlink("dd/dd") < 0){
    printf(1, "unlink dd/dd failed\n");
    exit();
  }
  if(unlink("dd") < 0){
    printf(1, "unlink dd failed\n");
    230c:	50                   	push   %eax
    230d:	50                   	push   %eax
    230e:	68 30 48 00 00       	push   $0x4830
    2313:	6a 01                	push   $0x1
    2315:	e8 b6 17 00 00       	call   3ad0 <printf>
    exit();
    231a:	e8 59 16 00 00       	call   3978 <exit>
  if(unlink("dd") == 0){
    printf(1, "unlink non-empty dd succeeded!\n");
    exit();
  }
  if(unlink("dd/dd") < 0){
    printf(1, "unlink dd/dd failed\n");
    231f:	52                   	push   %edx
    2320:	52                   	push   %edx
    2321:	68 1b 48 00 00       	push   $0x481b
    2326:	6a 01                	push   $0x1
    2328:	e8 a3 17 00 00       	call   3ad0 <printf>
    exit();
    232d:	e8 46 16 00 00       	call   3978 <exit>
  if(unlink("dd/ff") != 0){
    printf(1, "unlink dd/ff failed\n");
    exit();
  }
  if(unlink("dd") == 0){
    printf(1, "unlink non-empty dd succeeded!\n");
    2332:	51                   	push   %ecx
    2333:	51                   	push   %ecx
    2334:	68 30 51 00 00       	push   $0x5130
    2339:	6a 01                	push   $0x1
    233b:	e8 90 17 00 00       	call   3ad0 <printf>
    exit();
    2340:	e8 33 16 00 00       	call   3978 <exit>
  if(unlink("dd/dd/ffff") != 0){
    printf(1, "unlink dd/dd/ff failed\n");
    exit();
  }
  if(unlink("dd/ff") != 0){
    printf(1, "unlink dd/ff failed\n");
    2345:	53                   	push   %ebx
    2346:	53                   	push   %ebx
    2347:	68 06 48 00 00       	push   $0x4806
    234c:	6a 01                	push   $0x1
    234e:	e8 7d 17 00 00       	call   3ad0 <printf>
    exit();
    2353:	e8 20 16 00 00       	call   3978 <exit>
  if(chdir("dd/ff") == 0){
    printf(1, "chdir dd/ff succeeded!\n");
    exit();
  }
  if(chdir("dd/xx") == 0){
    printf(1, "chdir dd/xx succeeded!\n");
    2358:	50                   	push   %eax
    2359:	50                   	push   %eax
    235a:	68 ee 47 00 00       	push   $0x47ee
    235f:	6a 01                	push   $0x1
    2361:	e8 6a 17 00 00       	call   3ad0 <printf>
    exit();
    2366:	e8 0d 16 00 00       	call   3978 <exit>
  if(unlink("dd/ff/ff") == 0){
    printf(1, "unlink dd/ff/ff succeeded!\n");
    exit();
  }
  if(chdir("dd/ff") == 0){
    printf(1, "chdir dd/ff succeeded!\n");
    236b:	50                   	push   %eax
    236c:	50                   	push   %eax
    236d:	68 d6 47 00 00       	push   $0x47d6
    2372:	6a 01                	push   $0x1
    2374:	e8 57 17 00 00       	call   3ad0 <printf>
    exit();
    2379:	e8 fa 15 00 00       	call   3978 <exit>
  if(unlink("dd/xx/ff") == 0){
    printf(1, "unlink dd/xx/ff succeeded!\n");
    exit();
  }
  if(unlink("dd/ff/ff") == 0){
    printf(1, "unlink dd/ff/ff succeeded!\n");
    237e:	50                   	push   %eax
    237f:	50                   	push   %eax
    2380:	68 ba 47 00 00       	push   $0x47ba
    2385:	6a 01                	push   $0x1
    2387:	e8 44 17 00 00       	call   3ad0 <printf>
    exit();
    238c:	e8 e7 15 00 00       	call   3978 <exit>
  if(mkdir("dd/dd/ffff") == 0){
    printf(1, "mkdir dd/dd/ffff succeeded!\n");
    exit();
  }
  if(unlink("dd/xx/ff") == 0){
    printf(1, "unlink dd/xx/ff succeeded!\n");
    2391:	50                   	push   %eax
    2392:	50                   	push   %eax
    2393:	68 9e 47 00 00       	push   $0x479e
    2398:	6a 01                	push   $0x1
    239a:	e8 31 17 00 00       	call   3ad0 <printf>
    exit();
    239f:	e8 d4 15 00 00       	call   3978 <exit>
  if(mkdir("dd/xx/ff") == 0){
    printf(1, "mkdir dd/xx/ff succeeded!\n");
    exit();
  }
  if(mkdir("dd/dd/ffff") == 0){
    printf(1, "mkdir dd/dd/ffff succeeded!\n");
    23a4:	50                   	push   %eax
    23a5:	50                   	push   %eax
    23a6:	68 81 47 00 00       	push   $0x4781
    23ab:	6a 01                	push   $0x1
    23ad:	e8 1e 17 00 00       	call   3ad0 <printf>
    exit();
    23b2:	e8 c1 15 00 00       	call   3978 <exit>
  if(mkdir("dd/ff/ff") == 0){
    printf(1, "mkdir dd/ff/ff succeeded!\n");
    exit();
  }
  if(mkdir("dd/xx/ff") == 0){
    printf(1, "mkdir dd/xx/ff succeeded!\n");
    23b7:	50                   	push   %eax
    23b8:	50                   	push   %eax
    23b9:	68 66 47 00 00       	push   $0x4766
    23be:	6a 01                	push   $0x1
    23c0:	e8 0b 17 00 00       	call   3ad0 <printf>
    exit();
    23c5:	e8 ae 15 00 00       	call   3978 <exit>
  if(fd < 0){
    printf(1, "open dd/dd/ffff failed\n");
    exit();
  }
  if(read(fd, buf, sizeof(buf)) != 2){
    printf(1, "read dd/dd/ffff wrong len\n");
    23ca:	50                   	push   %eax
    23cb:	50                   	push   %eax
    23cc:	68 93 46 00 00       	push   $0x4693
    23d1:	6a 01                	push   $0x1
    23d3:	e8 f8 16 00 00       	call   3ad0 <printf>
    exit();
    23d8:	e8 9b 15 00 00       	call   3978 <exit>
    exit();
  }

  fd = open("dd/dd/ffff", 0);
  if(fd < 0){
    printf(1, "open dd/dd/ffff failed\n");
    23dd:	50                   	push   %eax
    23de:	50                   	push   %eax
    23df:	68 7b 46 00 00       	push   $0x467b
    23e4:	6a 01                	push   $0x1
    23e6:	e8 e5 16 00 00       	call   3ad0 <printf>
    exit();
    23eb:	e8 88 15 00 00       	call   3978 <exit>

000023f0 <bigwrite>:
}

// test writes that are larger than the log.
void
bigwrite(void)
{
    23f0:	55                   	push   %ebp
    23f1:	89 e5                	mov    %esp,%ebp
    23f3:	56                   	push   %esi
    23f4:	53                   	push   %ebx
  int fd, sz;

  printf(1, "bigwrite test\n");

  unlink("bigwrite");
  for(sz = 499; sz < 12*512; sz += 471){
    23f5:	bb f3 01 00 00       	mov    $0x1f3,%ebx
void
bigwrite(void)
{
  int fd, sz;

  printf(1, "bigwrite test\n");
    23fa:	83 ec 08             	sub    $0x8,%esp
    23fd:	68 4d 48 00 00       	push   $0x484d
    2402:	6a 01                	push   $0x1
    2404:	e8 c7 16 00 00       	call   3ad0 <printf>

  unlink("bigwrite");
    2409:	c7 04 24 5c 48 00 00 	movl   $0x485c,(%esp)
    2410:	e8 b3 15 00 00       	call   39c8 <unlink>
    2415:	83 c4 10             	add    $0x10,%esp
    2418:	90                   	nop
    2419:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(sz = 499; sz < 12*512; sz += 471){
    fd = open("bigwrite", O_CREATE | O_RDWR);
    2420:	83 ec 08             	sub    $0x8,%esp
    2423:	68 02 02 00 00       	push   $0x202
    2428:	68 5c 48 00 00       	push   $0x485c
    242d:	e8 86 15 00 00       	call   39b8 <open>
    if(fd < 0){
    2432:	83 c4 10             	add    $0x10,%esp
    2435:	85 c0                	test   %eax,%eax

  printf(1, "bigwrite test\n");

  unlink("bigwrite");
  for(sz = 499; sz < 12*512; sz += 471){
    fd = open("bigwrite", O_CREATE | O_RDWR);
    2437:	89 c6                	mov    %eax,%esi
    if(fd < 0){
    2439:	78 7e                	js     24b9 <bigwrite+0xc9>
      printf(1, "cannot create bigwrite\n");
      exit();
    }
    int i;
    for(i = 0; i < 2; i++){
      int cc = write(fd, buf, sz);
    243b:	83 ec 04             	sub    $0x4,%esp
    243e:	53                   	push   %ebx
    243f:	68 00 87 00 00       	push   $0x8700
    2444:	50                   	push   %eax
    2445:	e8 4e 15 00 00       	call   3998 <write>
      if(cc != sz){
    244a:	83 c4 10             	add    $0x10,%esp
    244d:	39 d8                	cmp    %ebx,%eax
    244f:	75 55                	jne    24a6 <bigwrite+0xb6>
      printf(1, "cannot create bigwrite\n");
      exit();
    }
    int i;
    for(i = 0; i < 2; i++){
      int cc = write(fd, buf, sz);
    2451:	83 ec 04             	sub    $0x4,%esp
    2454:	53                   	push   %ebx
    2455:	68 00 87 00 00       	push   $0x8700
    245a:	56                   	push   %esi
    245b:	e8 38 15 00 00       	call   3998 <write>
      if(cc != sz){
    2460:	83 c4 10             	add    $0x10,%esp
    2463:	39 d8                	cmp    %ebx,%eax
    2465:	75 3f                	jne    24a6 <bigwrite+0xb6>
        printf(1, "write(%d) ret %d\n", sz, cc);
        exit();
      }
    }
    close(fd);
    2467:	83 ec 0c             	sub    $0xc,%esp
  int fd, sz;

  printf(1, "bigwrite test\n");

  unlink("bigwrite");
  for(sz = 499; sz < 12*512; sz += 471){
    246a:	81 c3 d7 01 00 00    	add    $0x1d7,%ebx
      if(cc != sz){
        printf(1, "write(%d) ret %d\n", sz, cc);
        exit();
      }
    }
    close(fd);
    2470:	56                   	push   %esi
    2471:	e8 2a 15 00 00       	call   39a0 <close>
    unlink("bigwrite");
    2476:	c7 04 24 5c 48 00 00 	movl   $0x485c,(%esp)
    247d:	e8 46 15 00 00       	call   39c8 <unlink>
  int fd, sz;

  printf(1, "bigwrite test\n");

  unlink("bigwrite");
  for(sz = 499; sz < 12*512; sz += 471){
    2482:	83 c4 10             	add    $0x10,%esp
    2485:	81 fb 07 18 00 00    	cmp    $0x1807,%ebx
    248b:	75 93                	jne    2420 <bigwrite+0x30>
    }
    close(fd);
    unlink("bigwrite");
  }

  printf(1, "bigwrite ok\n");
    248d:	83 ec 08             	sub    $0x8,%esp
    2490:	68 8f 48 00 00       	push   $0x488f
    2495:	6a 01                	push   $0x1
    2497:	e8 34 16 00 00       	call   3ad0 <printf>
}
    249c:	83 c4 10             	add    $0x10,%esp
    249f:	8d 65 f8             	lea    -0x8(%ebp),%esp
    24a2:	5b                   	pop    %ebx
    24a3:	5e                   	pop    %esi
    24a4:	5d                   	pop    %ebp
    24a5:	c3                   	ret    
    }
    int i;
    for(i = 0; i < 2; i++){
      int cc = write(fd, buf, sz);
      if(cc != sz){
        printf(1, "write(%d) ret %d\n", sz, cc);
    24a6:	50                   	push   %eax
    24a7:	53                   	push   %ebx
    24a8:	68 7d 48 00 00       	push   $0x487d
    24ad:	6a 01                	push   $0x1
    24af:	e8 1c 16 00 00       	call   3ad0 <printf>
        exit();
    24b4:	e8 bf 14 00 00       	call   3978 <exit>

  unlink("bigwrite");
  for(sz = 499; sz < 12*512; sz += 471){
    fd = open("bigwrite", O_CREATE | O_RDWR);
    if(fd < 0){
      printf(1, "cannot create bigwrite\n");
    24b9:	83 ec 08             	sub    $0x8,%esp
    24bc:	68 65 48 00 00       	push   $0x4865
    24c1:	6a 01                	push   $0x1
    24c3:	e8 08 16 00 00       	call   3ad0 <printf>
      exit();
    24c8:	e8 ab 14 00 00       	call   3978 <exit>
    24cd:	8d 76 00             	lea    0x0(%esi),%esi

000024d0 <bigfile>:
  printf(1, "bigwrite ok\n");
}

void
bigfile(void)
{
    24d0:	55                   	push   %ebp
    24d1:	89 e5                	mov    %esp,%ebp
    24d3:	57                   	push   %edi
    24d4:	56                   	push   %esi
    24d5:	53                   	push   %ebx
    24d6:	83 ec 14             	sub    $0x14,%esp
  int fd, i, total, cc;

  printf(1, "bigfile test\n");
    24d9:	68 9c 48 00 00       	push   $0x489c
    24de:	6a 01                	push   $0x1
    24e0:	e8 eb 15 00 00       	call   3ad0 <printf>

  unlink("bigfile");
    24e5:	c7 04 24 b8 48 00 00 	movl   $0x48b8,(%esp)
    24ec:	e8 d7 14 00 00       	call   39c8 <unlink>
  fd = open("bigfile", O_CREATE | O_RDWR);
    24f1:	5e                   	pop    %esi
    24f2:	5f                   	pop    %edi
    24f3:	68 02 02 00 00       	push   $0x202
    24f8:	68 b8 48 00 00       	push   $0x48b8
    24fd:	e8 b6 14 00 00       	call   39b8 <open>
  if(fd < 0){
    2502:	83 c4 10             	add    $0x10,%esp
    2505:	85 c0                	test   %eax,%eax
    2507:	0f 88 5f 01 00 00    	js     266c <bigfile+0x19c>
    250d:	89 c6                	mov    %eax,%esi
    250f:	31 db                	xor    %ebx,%ebx
    2511:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    printf(1, "cannot create bigfile");
    exit();
  }
  for(i = 0; i < 20; i++){
    memset(buf, i, 600);
    2518:	83 ec 04             	sub    $0x4,%esp
    251b:	68 58 02 00 00       	push   $0x258
    2520:	53                   	push   %ebx
    2521:	68 00 87 00 00       	push   $0x8700
    2526:	e8 a5 12 00 00       	call   37d0 <memset>
    if(write(fd, buf, 600) != 600){
    252b:	83 c4 0c             	add    $0xc,%esp
    252e:	68 58 02 00 00       	push   $0x258
    2533:	68 00 87 00 00       	push   $0x8700
    2538:	56                   	push   %esi
    2539:	e8 5a 14 00 00       	call   3998 <write>
    253e:	83 c4 10             	add    $0x10,%esp
    2541:	3d 58 02 00 00       	cmp    $0x258,%eax
    2546:	0f 85 f8 00 00 00    	jne    2644 <bigfile+0x174>
  fd = open("bigfile", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "cannot create bigfile");
    exit();
  }
  for(i = 0; i < 20; i++){
    254c:	83 c3 01             	add    $0x1,%ebx
    254f:	83 fb 14             	cmp    $0x14,%ebx
    2552:	75 c4                	jne    2518 <bigfile+0x48>
    if(write(fd, buf, 600) != 600){
      printf(1, "write bigfile failed\n");
      exit();
    }
  }
  close(fd);
    2554:	83 ec 0c             	sub    $0xc,%esp
    2557:	56                   	push   %esi
    2558:	e8 43 14 00 00       	call   39a0 <close>

  fd = open("bigfile", 0);
    255d:	59                   	pop    %ecx
    255e:	5b                   	pop    %ebx
    255f:	6a 00                	push   $0x0
    2561:	68 b8 48 00 00       	push   $0x48b8
    2566:	e8 4d 14 00 00       	call   39b8 <open>
  if(fd < 0){
    256b:	83 c4 10             	add    $0x10,%esp
    256e:	85 c0                	test   %eax,%eax
      exit();
    }
  }
  close(fd);

  fd = open("bigfile", 0);
    2570:	89 c6                	mov    %eax,%esi
  if(fd < 0){
    2572:	0f 88 e0 00 00 00    	js     2658 <bigfile+0x188>
    2578:	31 db                	xor    %ebx,%ebx
    257a:	31 ff                	xor    %edi,%edi
    257c:	eb 30                	jmp    25ae <bigfile+0xde>
    257e:	66 90                	xchg   %ax,%ax
      printf(1, "read bigfile failed\n");
      exit();
    }
    if(cc == 0)
      break;
    if(cc != 300){
    2580:	3d 2c 01 00 00       	cmp    $0x12c,%eax
    2585:	0f 85 91 00 00 00    	jne    261c <bigfile+0x14c>
      printf(1, "short read bigfile\n");
      exit();
    }
    if(buf[0] != i/2 || buf[299] != i/2){
    258b:	0f be 05 00 87 00 00 	movsbl 0x8700,%eax
    2592:	89 fa                	mov    %edi,%edx
    2594:	d1 fa                	sar    %edx
    2596:	39 d0                	cmp    %edx,%eax
    2598:	75 6e                	jne    2608 <bigfile+0x138>
    259a:	0f be 15 2b 88 00 00 	movsbl 0x882b,%edx
    25a1:	39 d0                	cmp    %edx,%eax
    25a3:	75 63                	jne    2608 <bigfile+0x138>
      printf(1, "read bigfile wrong data\n");
      exit();
    }
    total += cc;
    25a5:	81 c3 2c 01 00 00    	add    $0x12c,%ebx
  if(fd < 0){
    printf(1, "cannot open bigfile\n");
    exit();
  }
  total = 0;
  for(i = 0; ; i++){
    25ab:	83 c7 01             	add    $0x1,%edi
    cc = read(fd, buf, 300);
    25ae:	83 ec 04             	sub    $0x4,%esp
    25b1:	68 2c 01 00 00       	push   $0x12c
    25b6:	68 00 87 00 00       	push   $0x8700
    25bb:	56                   	push   %esi
    25bc:	e8 cf 13 00 00       	call   3990 <read>
    if(cc < 0){
    25c1:	83 c4 10             	add    $0x10,%esp
    25c4:	85 c0                	test   %eax,%eax
    25c6:	78 68                	js     2630 <bigfile+0x160>
      printf(1, "read bigfile failed\n");
      exit();
    }
    if(cc == 0)
    25c8:	75 b6                	jne    2580 <bigfile+0xb0>
      printf(1, "read bigfile wrong data\n");
      exit();
    }
    total += cc;
  }
  close(fd);
    25ca:	83 ec 0c             	sub    $0xc,%esp
    25cd:	56                   	push   %esi
    25ce:	e8 cd 13 00 00       	call   39a0 <close>
  if(total != 20*600){
    25d3:	83 c4 10             	add    $0x10,%esp
    25d6:	81 fb e0 2e 00 00    	cmp    $0x2ee0,%ebx
    25dc:	0f 85 9e 00 00 00    	jne    2680 <bigfile+0x1b0>
    printf(1, "read bigfile wrong total\n");
    exit();
  }
  unlink("bigfile");
    25e2:	83 ec 0c             	sub    $0xc,%esp
    25e5:	68 b8 48 00 00       	push   $0x48b8
    25ea:	e8 d9 13 00 00       	call   39c8 <unlink>

  printf(1, "bigfile test ok\n");
    25ef:	58                   	pop    %eax
    25f0:	5a                   	pop    %edx
    25f1:	68 47 49 00 00       	push   $0x4947
    25f6:	6a 01                	push   $0x1
    25f8:	e8 d3 14 00 00       	call   3ad0 <printf>
}
    25fd:	83 c4 10             	add    $0x10,%esp
    2600:	8d 65 f4             	lea    -0xc(%ebp),%esp
    2603:	5b                   	pop    %ebx
    2604:	5e                   	pop    %esi
    2605:	5f                   	pop    %edi
    2606:	5d                   	pop    %ebp
    2607:	c3                   	ret    
    if(cc != 300){
      printf(1, "short read bigfile\n");
      exit();
    }
    if(buf[0] != i/2 || buf[299] != i/2){
      printf(1, "read bigfile wrong data\n");
    2608:	83 ec 08             	sub    $0x8,%esp
    260b:	68 14 49 00 00       	push   $0x4914
    2610:	6a 01                	push   $0x1
    2612:	e8 b9 14 00 00       	call   3ad0 <printf>
      exit();
    2617:	e8 5c 13 00 00       	call   3978 <exit>
      exit();
    }
    if(cc == 0)
      break;
    if(cc != 300){
      printf(1, "short read bigfile\n");
    261c:	83 ec 08             	sub    $0x8,%esp
    261f:	68 00 49 00 00       	push   $0x4900
    2624:	6a 01                	push   $0x1
    2626:	e8 a5 14 00 00       	call   3ad0 <printf>
      exit();
    262b:	e8 48 13 00 00       	call   3978 <exit>
  }
  total = 0;
  for(i = 0; ; i++){
    cc = read(fd, buf, 300);
    if(cc < 0){
      printf(1, "read bigfile failed\n");
    2630:	83 ec 08             	sub    $0x8,%esp
    2633:	68 eb 48 00 00       	push   $0x48eb
    2638:	6a 01                	push   $0x1
    263a:	e8 91 14 00 00       	call   3ad0 <printf>
      exit();
    263f:	e8 34 13 00 00       	call   3978 <exit>
    exit();
  }
  for(i = 0; i < 20; i++){
    memset(buf, i, 600);
    if(write(fd, buf, 600) != 600){
      printf(1, "write bigfile failed\n");
    2644:	83 ec 08             	sub    $0x8,%esp
    2647:	68 c0 48 00 00       	push   $0x48c0
    264c:	6a 01                	push   $0x1
    264e:	e8 7d 14 00 00       	call   3ad0 <printf>
      exit();
    2653:	e8 20 13 00 00       	call   3978 <exit>
  }
  close(fd);

  fd = open("bigfile", 0);
  if(fd < 0){
    printf(1, "cannot open bigfile\n");
    2658:	83 ec 08             	sub    $0x8,%esp
    265b:	68 d6 48 00 00       	push   $0x48d6
    2660:	6a 01                	push   $0x1
    2662:	e8 69 14 00 00       	call   3ad0 <printf>
    exit();
    2667:	e8 0c 13 00 00       	call   3978 <exit>
  printf(1, "bigfile test\n");

  unlink("bigfile");
  fd = open("bigfile", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "cannot create bigfile");
    266c:	83 ec 08             	sub    $0x8,%esp
    266f:	68 aa 48 00 00       	push   $0x48aa
    2674:	6a 01                	push   $0x1
    2676:	e8 55 14 00 00       	call   3ad0 <printf>
    exit();
    267b:	e8 f8 12 00 00       	call   3978 <exit>
    }
    total += cc;
  }
  close(fd);
  if(total != 20*600){
    printf(1, "read bigfile wrong total\n");
    2680:	83 ec 08             	sub    $0x8,%esp
    2683:	68 2d 49 00 00       	push   $0x492d
    2688:	6a 01                	push   $0x1
    268a:	e8 41 14 00 00       	call   3ad0 <printf>
    exit();
    268f:	e8 e4 12 00 00       	call   3978 <exit>
    2694:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    269a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000026a0 <fourteen>:
  printf(1, "bigfile test ok\n");
}

void
fourteen(void)
{
    26a0:	55                   	push   %ebp
    26a1:	89 e5                	mov    %esp,%ebp
    26a3:	83 ec 10             	sub    $0x10,%esp
  int fd;

  // DIRSIZ is 14.
  printf(1, "fourteen test\n");
    26a6:	68 58 49 00 00       	push   $0x4958
    26ab:	6a 01                	push   $0x1
    26ad:	e8 1e 14 00 00       	call   3ad0 <printf>

  if(mkdir("12345678901234") != 0){
    26b2:	c7 04 24 93 49 00 00 	movl   $0x4993,(%esp)
    26b9:	e8 22 13 00 00       	call   39e0 <mkdir>
    26be:	83 c4 10             	add    $0x10,%esp
    26c1:	85 c0                	test   %eax,%eax
    26c3:	0f 85 97 00 00 00    	jne    2760 <fourteen+0xc0>
    printf(1, "mkdir 12345678901234 failed\n");
    exit();
  }
  if(mkdir("12345678901234/123456789012345") != 0){
    26c9:	83 ec 0c             	sub    $0xc,%esp
    26cc:	68 50 51 00 00       	push   $0x5150
    26d1:	e8 0a 13 00 00       	call   39e0 <mkdir>
    26d6:	83 c4 10             	add    $0x10,%esp
    26d9:	85 c0                	test   %eax,%eax
    26db:	0f 85 de 00 00 00    	jne    27bf <fourteen+0x11f>
    printf(1, "mkdir 12345678901234/123456789012345 failed\n");
    exit();
  }
  fd = open("123456789012345/123456789012345/123456789012345", O_CREATE);
    26e1:	83 ec 08             	sub    $0x8,%esp
    26e4:	68 00 02 00 00       	push   $0x200
    26e9:	68 a0 51 00 00       	push   $0x51a0
    26ee:	e8 c5 12 00 00       	call   39b8 <open>
  if(fd < 0){
    26f3:	83 c4 10             	add    $0x10,%esp
    26f6:	85 c0                	test   %eax,%eax
    26f8:	0f 88 ae 00 00 00    	js     27ac <fourteen+0x10c>
    printf(1, "create 123456789012345/123456789012345/123456789012345 failed\n");
    exit();
  }
  close(fd);
    26fe:	83 ec 0c             	sub    $0xc,%esp
    2701:	50                   	push   %eax
    2702:	e8 99 12 00 00       	call   39a0 <close>
  fd = open("12345678901234/12345678901234/12345678901234", 0);
    2707:	58                   	pop    %eax
    2708:	5a                   	pop    %edx
    2709:	6a 00                	push   $0x0
    270b:	68 10 52 00 00       	push   $0x5210
    2710:	e8 a3 12 00 00       	call   39b8 <open>
  if(fd < 0){
    2715:	83 c4 10             	add    $0x10,%esp
    2718:	85 c0                	test   %eax,%eax
    271a:	78 7d                	js     2799 <fourteen+0xf9>
    printf(1, "open 12345678901234/12345678901234/12345678901234 failed\n");
    exit();
  }
  close(fd);
    271c:	83 ec 0c             	sub    $0xc,%esp
    271f:	50                   	push   %eax
    2720:	e8 7b 12 00 00       	call   39a0 <close>

  if(mkdir("12345678901234/12345678901234") == 0){
    2725:	c7 04 24 84 49 00 00 	movl   $0x4984,(%esp)
    272c:	e8 af 12 00 00       	call   39e0 <mkdir>
    2731:	83 c4 10             	add    $0x10,%esp
    2734:	85 c0                	test   %eax,%eax
    2736:	74 4e                	je     2786 <fourteen+0xe6>
    printf(1, "mkdir 12345678901234/12345678901234 succeeded!\n");
    exit();
  }
  if(mkdir("123456789012345/12345678901234") == 0){
    2738:	83 ec 0c             	sub    $0xc,%esp
    273b:	68 ac 52 00 00       	push   $0x52ac
    2740:	e8 9b 12 00 00       	call   39e0 <mkdir>
    2745:	83 c4 10             	add    $0x10,%esp
    2748:	85 c0                	test   %eax,%eax
    274a:	74 27                	je     2773 <fourteen+0xd3>
    printf(1, "mkdir 12345678901234/123456789012345 succeeded!\n");
    exit();
  }

  printf(1, "fourteen ok\n");
    274c:	83 ec 08             	sub    $0x8,%esp
    274f:	68 a2 49 00 00       	push   $0x49a2
    2754:	6a 01                	push   $0x1
    2756:	e8 75 13 00 00       	call   3ad0 <printf>
}
    275b:	83 c4 10             	add    $0x10,%esp
    275e:	c9                   	leave  
    275f:	c3                   	ret    

  // DIRSIZ is 14.
  printf(1, "fourteen test\n");

  if(mkdir("12345678901234") != 0){
    printf(1, "mkdir 12345678901234 failed\n");
    2760:	50                   	push   %eax
    2761:	50                   	push   %eax
    2762:	68 67 49 00 00       	push   $0x4967
    2767:	6a 01                	push   $0x1
    2769:	e8 62 13 00 00       	call   3ad0 <printf>
    exit();
    276e:	e8 05 12 00 00       	call   3978 <exit>
  if(mkdir("12345678901234/12345678901234") == 0){
    printf(1, "mkdir 12345678901234/12345678901234 succeeded!\n");
    exit();
  }
  if(mkdir("123456789012345/12345678901234") == 0){
    printf(1, "mkdir 12345678901234/123456789012345 succeeded!\n");
    2773:	50                   	push   %eax
    2774:	50                   	push   %eax
    2775:	68 cc 52 00 00       	push   $0x52cc
    277a:	6a 01                	push   $0x1
    277c:	e8 4f 13 00 00       	call   3ad0 <printf>
    exit();
    2781:	e8 f2 11 00 00       	call   3978 <exit>
    exit();
  }
  close(fd);

  if(mkdir("12345678901234/12345678901234") == 0){
    printf(1, "mkdir 12345678901234/12345678901234 succeeded!\n");
    2786:	52                   	push   %edx
    2787:	52                   	push   %edx
    2788:	68 7c 52 00 00       	push   $0x527c
    278d:	6a 01                	push   $0x1
    278f:	e8 3c 13 00 00       	call   3ad0 <printf>
    exit();
    2794:	e8 df 11 00 00       	call   3978 <exit>
    exit();
  }
  close(fd);
  fd = open("12345678901234/12345678901234/12345678901234", 0);
  if(fd < 0){
    printf(1, "open 12345678901234/12345678901234/12345678901234 failed\n");
    2799:	51                   	push   %ecx
    279a:	51                   	push   %ecx
    279b:	68 40 52 00 00       	push   $0x5240
    27a0:	6a 01                	push   $0x1
    27a2:	e8 29 13 00 00       	call   3ad0 <printf>
    exit();
    27a7:	e8 cc 11 00 00       	call   3978 <exit>
    printf(1, "mkdir 12345678901234/123456789012345 failed\n");
    exit();
  }
  fd = open("123456789012345/123456789012345/123456789012345", O_CREATE);
  if(fd < 0){
    printf(1, "create 123456789012345/123456789012345/123456789012345 failed\n");
    27ac:	51                   	push   %ecx
    27ad:	51                   	push   %ecx
    27ae:	68 d0 51 00 00       	push   $0x51d0
    27b3:	6a 01                	push   $0x1
    27b5:	e8 16 13 00 00       	call   3ad0 <printf>
    exit();
    27ba:	e8 b9 11 00 00       	call   3978 <exit>
  if(mkdir("12345678901234") != 0){
    printf(1, "mkdir 12345678901234 failed\n");
    exit();
  }
  if(mkdir("12345678901234/123456789012345") != 0){
    printf(1, "mkdir 12345678901234/123456789012345 failed\n");
    27bf:	50                   	push   %eax
    27c0:	50                   	push   %eax
    27c1:	68 70 51 00 00       	push   $0x5170
    27c6:	6a 01                	push   $0x1
    27c8:	e8 03 13 00 00       	call   3ad0 <printf>
    exit();
    27cd:	e8 a6 11 00 00       	call   3978 <exit>
    27d2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    27d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000027e0 <rmdot>:
  printf(1, "fourteen ok\n");
}

void
rmdot(void)
{
    27e0:	55                   	push   %ebp
    27e1:	89 e5                	mov    %esp,%ebp
    27e3:	83 ec 10             	sub    $0x10,%esp
  printf(1, "rmdot test\n");
    27e6:	68 af 49 00 00       	push   $0x49af
    27eb:	6a 01                	push   $0x1
    27ed:	e8 de 12 00 00       	call   3ad0 <printf>
  if(mkdir("dots") != 0){
    27f2:	c7 04 24 bb 49 00 00 	movl   $0x49bb,(%esp)
    27f9:	e8 e2 11 00 00       	call   39e0 <mkdir>
    27fe:	83 c4 10             	add    $0x10,%esp
    2801:	85 c0                	test   %eax,%eax
    2803:	0f 85 b0 00 00 00    	jne    28b9 <rmdot+0xd9>
    printf(1, "mkdir dots failed\n");
    exit();
  }
  if(chdir("dots") != 0){
    2809:	83 ec 0c             	sub    $0xc,%esp
    280c:	68 bb 49 00 00       	push   $0x49bb
    2811:	e8 d2 11 00 00       	call   39e8 <chdir>
    2816:	83 c4 10             	add    $0x10,%esp
    2819:	85 c0                	test   %eax,%eax
    281b:	0f 85 1d 01 00 00    	jne    293e <rmdot+0x15e>
    printf(1, "chdir dots failed\n");
    exit();
  }
  if(unlink(".") == 0){
    2821:	83 ec 0c             	sub    $0xc,%esp
    2824:	68 66 46 00 00       	push   $0x4666
    2829:	e8 9a 11 00 00       	call   39c8 <unlink>
    282e:	83 c4 10             	add    $0x10,%esp
    2831:	85 c0                	test   %eax,%eax
    2833:	0f 84 f2 00 00 00    	je     292b <rmdot+0x14b>
    printf(1, "rm . worked!\n");
    exit();
  }
  if(unlink("..") == 0){
    2839:	83 ec 0c             	sub    $0xc,%esp
    283c:	68 65 46 00 00       	push   $0x4665
    2841:	e8 82 11 00 00       	call   39c8 <unlink>
    2846:	83 c4 10             	add    $0x10,%esp
    2849:	85 c0                	test   %eax,%eax
    284b:	0f 84 c7 00 00 00    	je     2918 <rmdot+0x138>
    printf(1, "rm .. worked!\n");
    exit();
  }
  if(chdir("/") != 0){
    2851:	83 ec 0c             	sub    $0xc,%esp
    2854:	68 39 3e 00 00       	push   $0x3e39
    2859:	e8 8a 11 00 00       	call   39e8 <chdir>
    285e:	83 c4 10             	add    $0x10,%esp
    2861:	85 c0                	test   %eax,%eax
    2863:	0f 85 9c 00 00 00    	jne    2905 <rmdot+0x125>
    printf(1, "chdir / failed\n");
    exit();
  }
  if(unlink("dots/.") == 0){
    2869:	83 ec 0c             	sub    $0xc,%esp
    286c:	68 03 4a 00 00       	push   $0x4a03
    2871:	e8 52 11 00 00       	call   39c8 <unlink>
    2876:	83 c4 10             	add    $0x10,%esp
    2879:	85 c0                	test   %eax,%eax
    287b:	74 75                	je     28f2 <rmdot+0x112>
    printf(1, "unlink dots/. worked!\n");
    exit();
  }
  if(unlink("dots/..") == 0){
    287d:	83 ec 0c             	sub    $0xc,%esp
    2880:	68 21 4a 00 00       	push   $0x4a21
    2885:	e8 3e 11 00 00       	call   39c8 <unlink>
    288a:	83 c4 10             	add    $0x10,%esp
    288d:	85 c0                	test   %eax,%eax
    288f:	74 4e                	je     28df <rmdot+0xff>
    printf(1, "unlink dots/.. worked!\n");
    exit();
  }
  if(unlink("dots") != 0){
    2891:	83 ec 0c             	sub    $0xc,%esp
    2894:	68 bb 49 00 00       	push   $0x49bb
    2899:	e8 2a 11 00 00       	call   39c8 <unlink>
    289e:	83 c4 10             	add    $0x10,%esp
    28a1:	85 c0                	test   %eax,%eax
    28a3:	75 27                	jne    28cc <rmdot+0xec>
    printf(1, "unlink dots failed!\n");
    exit();
  }
  printf(1, "rmdot ok\n");
    28a5:	83 ec 08             	sub    $0x8,%esp
    28a8:	68 56 4a 00 00       	push   $0x4a56
    28ad:	6a 01                	push   $0x1
    28af:	e8 1c 12 00 00       	call   3ad0 <printf>
}
    28b4:	83 c4 10             	add    $0x10,%esp
    28b7:	c9                   	leave  
    28b8:	c3                   	ret    
void
rmdot(void)
{
  printf(1, "rmdot test\n");
  if(mkdir("dots") != 0){
    printf(1, "mkdir dots failed\n");
    28b9:	50                   	push   %eax
    28ba:	50                   	push   %eax
    28bb:	68 c0 49 00 00       	push   $0x49c0
    28c0:	6a 01                	push   $0x1
    28c2:	e8 09 12 00 00       	call   3ad0 <printf>
    exit();
    28c7:	e8 ac 10 00 00       	call   3978 <exit>
  if(unlink("dots/..") == 0){
    printf(1, "unlink dots/.. worked!\n");
    exit();
  }
  if(unlink("dots") != 0){
    printf(1, "unlink dots failed!\n");
    28cc:	50                   	push   %eax
    28cd:	50                   	push   %eax
    28ce:	68 41 4a 00 00       	push   $0x4a41
    28d3:	6a 01                	push   $0x1
    28d5:	e8 f6 11 00 00       	call   3ad0 <printf>
    exit();
    28da:	e8 99 10 00 00       	call   3978 <exit>
  if(unlink("dots/.") == 0){
    printf(1, "unlink dots/. worked!\n");
    exit();
  }
  if(unlink("dots/..") == 0){
    printf(1, "unlink dots/.. worked!\n");
    28df:	52                   	push   %edx
    28e0:	52                   	push   %edx
    28e1:	68 29 4a 00 00       	push   $0x4a29
    28e6:	6a 01                	push   $0x1
    28e8:	e8 e3 11 00 00       	call   3ad0 <printf>
    exit();
    28ed:	e8 86 10 00 00       	call   3978 <exit>
  if(chdir("/") != 0){
    printf(1, "chdir / failed\n");
    exit();
  }
  if(unlink("dots/.") == 0){
    printf(1, "unlink dots/. worked!\n");
    28f2:	51                   	push   %ecx
    28f3:	51                   	push   %ecx
    28f4:	68 0a 4a 00 00       	push   $0x4a0a
    28f9:	6a 01                	push   $0x1
    28fb:	e8 d0 11 00 00       	call   3ad0 <printf>
    exit();
    2900:	e8 73 10 00 00       	call   3978 <exit>
  if(unlink("..") == 0){
    printf(1, "rm .. worked!\n");
    exit();
  }
  if(chdir("/") != 0){
    printf(1, "chdir / failed\n");
    2905:	50                   	push   %eax
    2906:	50                   	push   %eax
    2907:	68 3b 3e 00 00       	push   $0x3e3b
    290c:	6a 01                	push   $0x1
    290e:	e8 bd 11 00 00       	call   3ad0 <printf>
    exit();
    2913:	e8 60 10 00 00       	call   3978 <exit>
  if(unlink(".") == 0){
    printf(1, "rm . worked!\n");
    exit();
  }
  if(unlink("..") == 0){
    printf(1, "rm .. worked!\n");
    2918:	50                   	push   %eax
    2919:	50                   	push   %eax
    291a:	68 f4 49 00 00       	push   $0x49f4
    291f:	6a 01                	push   $0x1
    2921:	e8 aa 11 00 00       	call   3ad0 <printf>
    exit();
    2926:	e8 4d 10 00 00       	call   3978 <exit>
  if(chdir("dots") != 0){
    printf(1, "chdir dots failed\n");
    exit();
  }
  if(unlink(".") == 0){
    printf(1, "rm . worked!\n");
    292b:	50                   	push   %eax
    292c:	50                   	push   %eax
    292d:	68 e6 49 00 00       	push   $0x49e6
    2932:	6a 01                	push   $0x1
    2934:	e8 97 11 00 00       	call   3ad0 <printf>
    exit();
    2939:	e8 3a 10 00 00       	call   3978 <exit>
  if(mkdir("dots") != 0){
    printf(1, "mkdir dots failed\n");
    exit();
  }
  if(chdir("dots") != 0){
    printf(1, "chdir dots failed\n");
    293e:	50                   	push   %eax
    293f:	50                   	push   %eax
    2940:	68 d3 49 00 00       	push   $0x49d3
    2945:	6a 01                	push   $0x1
    2947:	e8 84 11 00 00       	call   3ad0 <printf>
    exit();
    294c:	e8 27 10 00 00       	call   3978 <exit>
    2951:	eb 0d                	jmp    2960 <dirfile>
    2953:	90                   	nop
    2954:	90                   	nop
    2955:	90                   	nop
    2956:	90                   	nop
    2957:	90                   	nop
    2958:	90                   	nop
    2959:	90                   	nop
    295a:	90                   	nop
    295b:	90                   	nop
    295c:	90                   	nop
    295d:	90                   	nop
    295e:	90                   	nop
    295f:	90                   	nop

00002960 <dirfile>:
  printf(1, "rmdot ok\n");
}

void
dirfile(void)
{
    2960:	55                   	push   %ebp
    2961:	89 e5                	mov    %esp,%ebp
    2963:	53                   	push   %ebx
    2964:	83 ec 0c             	sub    $0xc,%esp
  int fd;

  printf(1, "dir vs file\n");
    2967:	68 60 4a 00 00       	push   $0x4a60
    296c:	6a 01                	push   $0x1
    296e:	e8 5d 11 00 00       	call   3ad0 <printf>

  fd = open("dirfile", O_CREATE);
    2973:	59                   	pop    %ecx
    2974:	5b                   	pop    %ebx
    2975:	68 00 02 00 00       	push   $0x200
    297a:	68 6d 4a 00 00       	push   $0x4a6d
    297f:	e8 34 10 00 00       	call   39b8 <open>
  if(fd < 0){
    2984:	83 c4 10             	add    $0x10,%esp
    2987:	85 c0                	test   %eax,%eax
    2989:	0f 88 43 01 00 00    	js     2ad2 <dirfile+0x172>
    printf(1, "create dirfile failed\n");
    exit();
  }
  close(fd);
    298f:	83 ec 0c             	sub    $0xc,%esp
    2992:	50                   	push   %eax
    2993:	e8 08 10 00 00       	call   39a0 <close>
  if(chdir("dirfile") == 0){
    2998:	c7 04 24 6d 4a 00 00 	movl   $0x4a6d,(%esp)
    299f:	e8 44 10 00 00       	call   39e8 <chdir>
    29a4:	83 c4 10             	add    $0x10,%esp
    29a7:	85 c0                	test   %eax,%eax
    29a9:	0f 84 10 01 00 00    	je     2abf <dirfile+0x15f>
    printf(1, "chdir dirfile succeeded!\n");
    exit();
  }
  fd = open("dirfile/xx", 0);
    29af:	83 ec 08             	sub    $0x8,%esp
    29b2:	6a 00                	push   $0x0
    29b4:	68 a6 4a 00 00       	push   $0x4aa6
    29b9:	e8 fa 0f 00 00       	call   39b8 <open>
  if(fd >= 0){
    29be:	83 c4 10             	add    $0x10,%esp
    29c1:	85 c0                	test   %eax,%eax
    29c3:	0f 89 e3 00 00 00    	jns    2aac <dirfile+0x14c>
    printf(1, "create dirfile/xx succeeded!\n");
    exit();
  }
  fd = open("dirfile/xx", O_CREATE);
    29c9:	83 ec 08             	sub    $0x8,%esp
    29cc:	68 00 02 00 00       	push   $0x200
    29d1:	68 a6 4a 00 00       	push   $0x4aa6
    29d6:	e8 dd 0f 00 00       	call   39b8 <open>
  if(fd >= 0){
    29db:	83 c4 10             	add    $0x10,%esp
    29de:	85 c0                	test   %eax,%eax
    29e0:	0f 89 c6 00 00 00    	jns    2aac <dirfile+0x14c>
    printf(1, "create dirfile/xx succeeded!\n");
    exit();
  }
  if(mkdir("dirfile/xx") == 0){
    29e6:	83 ec 0c             	sub    $0xc,%esp
    29e9:	68 a6 4a 00 00       	push   $0x4aa6
    29ee:	e8 ed 0f 00 00       	call   39e0 <mkdir>
    29f3:	83 c4 10             	add    $0x10,%esp
    29f6:	85 c0                	test   %eax,%eax
    29f8:	0f 84 46 01 00 00    	je     2b44 <dirfile+0x1e4>
    printf(1, "mkdir dirfile/xx succeeded!\n");
    exit();
  }
  if(unlink("dirfile/xx") == 0){
    29fe:	83 ec 0c             	sub    $0xc,%esp
    2a01:	68 a6 4a 00 00       	push   $0x4aa6
    2a06:	e8 bd 0f 00 00       	call   39c8 <unlink>
    2a0b:	83 c4 10             	add    $0x10,%esp
    2a0e:	85 c0                	test   %eax,%eax
    2a10:	0f 84 1b 01 00 00    	je     2b31 <dirfile+0x1d1>
    printf(1, "unlink dirfile/xx succeeded!\n");
    exit();
  }
  if(link("README", "dirfile/xx") == 0){
    2a16:	83 ec 08             	sub    $0x8,%esp
    2a19:	68 a6 4a 00 00       	push   $0x4aa6
    2a1e:	68 0a 4b 00 00       	push   $0x4b0a
    2a23:	e8 b0 0f 00 00       	call   39d8 <link>
    2a28:	83 c4 10             	add    $0x10,%esp
    2a2b:	85 c0                	test   %eax,%eax
    2a2d:	0f 84 eb 00 00 00    	je     2b1e <dirfile+0x1be>
    printf(1, "link to dirfile/xx succeeded!\n");
    exit();
  }
  if(unlink("dirfile") != 0){
    2a33:	83 ec 0c             	sub    $0xc,%esp
    2a36:	68 6d 4a 00 00       	push   $0x4a6d
    2a3b:	e8 88 0f 00 00       	call   39c8 <unlink>
    2a40:	83 c4 10             	add    $0x10,%esp
    2a43:	85 c0                	test   %eax,%eax
    2a45:	0f 85 c0 00 00 00    	jne    2b0b <dirfile+0x1ab>
    printf(1, "unlink dirfile failed!\n");
    exit();
  }

  fd = open(".", O_RDWR);
    2a4b:	83 ec 08             	sub    $0x8,%esp
    2a4e:	6a 02                	push   $0x2
    2a50:	68 66 46 00 00       	push   $0x4666
    2a55:	e8 5e 0f 00 00       	call   39b8 <open>
  if(fd >= 0){
    2a5a:	83 c4 10             	add    $0x10,%esp
    2a5d:	85 c0                	test   %eax,%eax
    2a5f:	0f 89 93 00 00 00    	jns    2af8 <dirfile+0x198>
    printf(1, "open . for writing succeeded!\n");
    exit();
  }
  fd = open(".", 0);
    2a65:	83 ec 08             	sub    $0x8,%esp
    2a68:	6a 00                	push   $0x0
    2a6a:	68 66 46 00 00       	push   $0x4666
    2a6f:	e8 44 0f 00 00       	call   39b8 <open>
  if(write(fd, "x", 1) > 0){
    2a74:	83 c4 0c             	add    $0xc,%esp
  fd = open(".", O_RDWR);
  if(fd >= 0){
    printf(1, "open . for writing succeeded!\n");
    exit();
  }
  fd = open(".", 0);
    2a77:	89 c3                	mov    %eax,%ebx
  if(write(fd, "x", 1) > 0){
    2a79:	6a 01                	push   $0x1
    2a7b:	68 49 47 00 00       	push   $0x4749
    2a80:	50                   	push   %eax
    2a81:	e8 12 0f 00 00       	call   3998 <write>
    2a86:	83 c4 10             	add    $0x10,%esp
    2a89:	85 c0                	test   %eax,%eax
    2a8b:	7f 58                	jg     2ae5 <dirfile+0x185>
    printf(1, "write . succeeded!\n");
    exit();
  }
  close(fd);
    2a8d:	83 ec 0c             	sub    $0xc,%esp
    2a90:	53                   	push   %ebx
    2a91:	e8 0a 0f 00 00       	call   39a0 <close>

  printf(1, "dir vs file OK\n");
    2a96:	58                   	pop    %eax
    2a97:	5a                   	pop    %edx
    2a98:	68 3d 4b 00 00       	push   $0x4b3d
    2a9d:	6a 01                	push   $0x1
    2a9f:	e8 2c 10 00 00       	call   3ad0 <printf>
}
    2aa4:	83 c4 10             	add    $0x10,%esp
    2aa7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2aaa:	c9                   	leave  
    2aab:	c3                   	ret    
    printf(1, "chdir dirfile succeeded!\n");
    exit();
  }
  fd = open("dirfile/xx", 0);
  if(fd >= 0){
    printf(1, "create dirfile/xx succeeded!\n");
    2aac:	50                   	push   %eax
    2aad:	50                   	push   %eax
    2aae:	68 b1 4a 00 00       	push   $0x4ab1
    2ab3:	6a 01                	push   $0x1
    2ab5:	e8 16 10 00 00       	call   3ad0 <printf>
    exit();
    2aba:	e8 b9 0e 00 00       	call   3978 <exit>
    printf(1, "create dirfile failed\n");
    exit();
  }
  close(fd);
  if(chdir("dirfile") == 0){
    printf(1, "chdir dirfile succeeded!\n");
    2abf:	50                   	push   %eax
    2ac0:	50                   	push   %eax
    2ac1:	68 8c 4a 00 00       	push   $0x4a8c
    2ac6:	6a 01                	push   $0x1
    2ac8:	e8 03 10 00 00       	call   3ad0 <printf>
    exit();
    2acd:	e8 a6 0e 00 00       	call   3978 <exit>

  printf(1, "dir vs file\n");

  fd = open("dirfile", O_CREATE);
  if(fd < 0){
    printf(1, "create dirfile failed\n");
    2ad2:	52                   	push   %edx
    2ad3:	52                   	push   %edx
    2ad4:	68 75 4a 00 00       	push   $0x4a75
    2ad9:	6a 01                	push   $0x1
    2adb:	e8 f0 0f 00 00       	call   3ad0 <printf>
    exit();
    2ae0:	e8 93 0e 00 00       	call   3978 <exit>
    printf(1, "open . for writing succeeded!\n");
    exit();
  }
  fd = open(".", 0);
  if(write(fd, "x", 1) > 0){
    printf(1, "write . succeeded!\n");
    2ae5:	51                   	push   %ecx
    2ae6:	51                   	push   %ecx
    2ae7:	68 29 4b 00 00       	push   $0x4b29
    2aec:	6a 01                	push   $0x1
    2aee:	e8 dd 0f 00 00       	call   3ad0 <printf>
    exit();
    2af3:	e8 80 0e 00 00       	call   3978 <exit>
    exit();
  }

  fd = open(".", O_RDWR);
  if(fd >= 0){
    printf(1, "open . for writing succeeded!\n");
    2af8:	53                   	push   %ebx
    2af9:	53                   	push   %ebx
    2afa:	68 20 53 00 00       	push   $0x5320
    2aff:	6a 01                	push   $0x1
    2b01:	e8 ca 0f 00 00       	call   3ad0 <printf>
    exit();
    2b06:	e8 6d 0e 00 00       	call   3978 <exit>
  if(link("README", "dirfile/xx") == 0){
    printf(1, "link to dirfile/xx succeeded!\n");
    exit();
  }
  if(unlink("dirfile") != 0){
    printf(1, "unlink dirfile failed!\n");
    2b0b:	50                   	push   %eax
    2b0c:	50                   	push   %eax
    2b0d:	68 11 4b 00 00       	push   $0x4b11
    2b12:	6a 01                	push   $0x1
    2b14:	e8 b7 0f 00 00       	call   3ad0 <printf>
    exit();
    2b19:	e8 5a 0e 00 00       	call   3978 <exit>
  if(unlink("dirfile/xx") == 0){
    printf(1, "unlink dirfile/xx succeeded!\n");
    exit();
  }
  if(link("README", "dirfile/xx") == 0){
    printf(1, "link to dirfile/xx succeeded!\n");
    2b1e:	50                   	push   %eax
    2b1f:	50                   	push   %eax
    2b20:	68 00 53 00 00       	push   $0x5300
    2b25:	6a 01                	push   $0x1
    2b27:	e8 a4 0f 00 00       	call   3ad0 <printf>
    exit();
    2b2c:	e8 47 0e 00 00       	call   3978 <exit>
  if(mkdir("dirfile/xx") == 0){
    printf(1, "mkdir dirfile/xx succeeded!\n");
    exit();
  }
  if(unlink("dirfile/xx") == 0){
    printf(1, "unlink dirfile/xx succeeded!\n");
    2b31:	50                   	push   %eax
    2b32:	50                   	push   %eax
    2b33:	68 ec 4a 00 00       	push   $0x4aec
    2b38:	6a 01                	push   $0x1
    2b3a:	e8 91 0f 00 00       	call   3ad0 <printf>
    exit();
    2b3f:	e8 34 0e 00 00       	call   3978 <exit>
  if(fd >= 0){
    printf(1, "create dirfile/xx succeeded!\n");
    exit();
  }
  if(mkdir("dirfile/xx") == 0){
    printf(1, "mkdir dirfile/xx succeeded!\n");
    2b44:	50                   	push   %eax
    2b45:	50                   	push   %eax
    2b46:	68 cf 4a 00 00       	push   $0x4acf
    2b4b:	6a 01                	push   $0x1
    2b4d:	e8 7e 0f 00 00       	call   3ad0 <printf>
    exit();
    2b52:	e8 21 0e 00 00       	call   3978 <exit>
    2b57:	89 f6                	mov    %esi,%esi
    2b59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00002b60 <iref>:
}

// test that iput() is called at the end of _namei()
void
iref(void)
{
    2b60:	55                   	push   %ebp
    2b61:	89 e5                	mov    %esp,%ebp
    2b63:	53                   	push   %ebx
  int i, fd;

  printf(1, "empty file name\n");
    2b64:	bb 33 00 00 00       	mov    $0x33,%ebx
}

// test that iput() is called at the end of _namei()
void
iref(void)
{
    2b69:	83 ec 0c             	sub    $0xc,%esp
  int i, fd;

  printf(1, "empty file name\n");
    2b6c:	68 4d 4b 00 00       	push   $0x4b4d
    2b71:	6a 01                	push   $0x1
    2b73:	e8 58 0f 00 00       	call   3ad0 <printf>
    2b78:	83 c4 10             	add    $0x10,%esp
    2b7b:	90                   	nop
    2b7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  // the 50 is NINODE
  for(i = 0; i < 50 + 1; i++){
    if(mkdir("irefd") != 0){
    2b80:	83 ec 0c             	sub    $0xc,%esp
    2b83:	68 5e 4b 00 00       	push   $0x4b5e
    2b88:	e8 53 0e 00 00       	call   39e0 <mkdir>
    2b8d:	83 c4 10             	add    $0x10,%esp
    2b90:	85 c0                	test   %eax,%eax
    2b92:	0f 85 bb 00 00 00    	jne    2c53 <iref+0xf3>
      printf(1, "mkdir irefd failed\n");
      exit();
    }
    if(chdir("irefd") != 0){
    2b98:	83 ec 0c             	sub    $0xc,%esp
    2b9b:	68 5e 4b 00 00       	push   $0x4b5e
    2ba0:	e8 43 0e 00 00       	call   39e8 <chdir>
    2ba5:	83 c4 10             	add    $0x10,%esp
    2ba8:	85 c0                	test   %eax,%eax
    2baa:	0f 85 b7 00 00 00    	jne    2c67 <iref+0x107>
      printf(1, "chdir irefd failed\n");
      exit();
    }

    mkdir("");
    2bb0:	83 ec 0c             	sub    $0xc,%esp
    2bb3:	68 13 42 00 00       	push   $0x4213
    2bb8:	e8 23 0e 00 00       	call   39e0 <mkdir>
    link("README", "");
    2bbd:	59                   	pop    %ecx
    2bbe:	58                   	pop    %eax
    2bbf:	68 13 42 00 00       	push   $0x4213
    2bc4:	68 0a 4b 00 00       	push   $0x4b0a
    2bc9:	e8 0a 0e 00 00       	call   39d8 <link>
    fd = open("", O_CREATE);
    2bce:	58                   	pop    %eax
    2bcf:	5a                   	pop    %edx
    2bd0:	68 00 02 00 00       	push   $0x200
    2bd5:	68 13 42 00 00       	push   $0x4213
    2bda:	e8 d9 0d 00 00       	call   39b8 <open>
    if(fd >= 0)
    2bdf:	83 c4 10             	add    $0x10,%esp
    2be2:	85 c0                	test   %eax,%eax
    2be4:	78 0c                	js     2bf2 <iref+0x92>
      close(fd);
    2be6:	83 ec 0c             	sub    $0xc,%esp
    2be9:	50                   	push   %eax
    2bea:	e8 b1 0d 00 00       	call   39a0 <close>
    2bef:	83 c4 10             	add    $0x10,%esp
    fd = open("xx", O_CREATE);
    2bf2:	83 ec 08             	sub    $0x8,%esp
    2bf5:	68 00 02 00 00       	push   $0x200
    2bfa:	68 48 47 00 00       	push   $0x4748
    2bff:	e8 b4 0d 00 00       	call   39b8 <open>
    if(fd >= 0)
    2c04:	83 c4 10             	add    $0x10,%esp
    2c07:	85 c0                	test   %eax,%eax
    2c09:	78 0c                	js     2c17 <iref+0xb7>
      close(fd);
    2c0b:	83 ec 0c             	sub    $0xc,%esp
    2c0e:	50                   	push   %eax
    2c0f:	e8 8c 0d 00 00       	call   39a0 <close>
    2c14:	83 c4 10             	add    $0x10,%esp
    unlink("xx");
    2c17:	83 ec 0c             	sub    $0xc,%esp
    2c1a:	68 48 47 00 00       	push   $0x4748
    2c1f:	e8 a4 0d 00 00       	call   39c8 <unlink>
  int i, fd;

  printf(1, "empty file name\n");

  // the 50 is NINODE
  for(i = 0; i < 50 + 1; i++){
    2c24:	83 c4 10             	add    $0x10,%esp
    2c27:	83 eb 01             	sub    $0x1,%ebx
    2c2a:	0f 85 50 ff ff ff    	jne    2b80 <iref+0x20>
    if(fd >= 0)
      close(fd);
    unlink("xx");
  }

  chdir("/");
    2c30:	83 ec 0c             	sub    $0xc,%esp
    2c33:	68 39 3e 00 00       	push   $0x3e39
    2c38:	e8 ab 0d 00 00       	call   39e8 <chdir>
  printf(1, "empty file name OK\n");
    2c3d:	58                   	pop    %eax
    2c3e:	5a                   	pop    %edx
    2c3f:	68 8c 4b 00 00       	push   $0x4b8c
    2c44:	6a 01                	push   $0x1
    2c46:	e8 85 0e 00 00       	call   3ad0 <printf>
}
    2c4b:	83 c4 10             	add    $0x10,%esp
    2c4e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2c51:	c9                   	leave  
    2c52:	c3                   	ret    
  printf(1, "empty file name\n");

  // the 50 is NINODE
  for(i = 0; i < 50 + 1; i++){
    if(mkdir("irefd") != 0){
      printf(1, "mkdir irefd failed\n");
    2c53:	83 ec 08             	sub    $0x8,%esp
    2c56:	68 64 4b 00 00       	push   $0x4b64
    2c5b:	6a 01                	push   $0x1
    2c5d:	e8 6e 0e 00 00       	call   3ad0 <printf>
      exit();
    2c62:	e8 11 0d 00 00       	call   3978 <exit>
    }
    if(chdir("irefd") != 0){
      printf(1, "chdir irefd failed\n");
    2c67:	83 ec 08             	sub    $0x8,%esp
    2c6a:	68 78 4b 00 00       	push   $0x4b78
    2c6f:	6a 01                	push   $0x1
    2c71:	e8 5a 0e 00 00       	call   3ad0 <printf>
      exit();
    2c76:	e8 fd 0c 00 00       	call   3978 <exit>
    2c7b:	90                   	nop
    2c7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00002c80 <forktest>:
// test that fork fails gracefully
// the forktest binary also does this, but it runs out of proc entries first.
// inside the bigger usertests binary, we run out of memory first.
void
forktest(void)
{
    2c80:	55                   	push   %ebp
    2c81:	89 e5                	mov    %esp,%ebp
    2c83:	53                   	push   %ebx
  int n, pid;

  printf(1, "fork test\n");

  for(n=0; n<1000; n++){
    2c84:	31 db                	xor    %ebx,%ebx
// test that fork fails gracefully
// the forktest binary also does this, but it runs out of proc entries first.
// inside the bigger usertests binary, we run out of memory first.
void
forktest(void)
{
    2c86:	83 ec 0c             	sub    $0xc,%esp
  int n, pid;

  printf(1, "fork test\n");
    2c89:	68 a0 4b 00 00       	push   $0x4ba0
    2c8e:	6a 01                	push   $0x1
    2c90:	e8 3b 0e 00 00       	call   3ad0 <printf>
    2c95:	83 c4 10             	add    $0x10,%esp
    2c98:	eb 13                	jmp    2cad <forktest+0x2d>
    2c9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  for(n=0; n<1000; n++){
    pid = fork();
    if(pid < 0)
      break;
    if(pid == 0)
    2ca0:	74 62                	je     2d04 <forktest+0x84>
{
  int n, pid;

  printf(1, "fork test\n");

  for(n=0; n<1000; n++){
    2ca2:	83 c3 01             	add    $0x1,%ebx
    2ca5:	81 fb e8 03 00 00    	cmp    $0x3e8,%ebx
    2cab:	74 43                	je     2cf0 <forktest+0x70>
    pid = fork();
    2cad:	e8 be 0c 00 00       	call   3970 <fork>
    if(pid < 0)
    2cb2:	85 c0                	test   %eax,%eax
    2cb4:	79 ea                	jns    2ca0 <forktest+0x20>
  if(n == 1000){
    printf(1, "fork claimed to work 1000 times!\n");
    exit();
  }

  for(; n > 0; n--){
    2cb6:	85 db                	test   %ebx,%ebx
    2cb8:	74 14                	je     2cce <forktest+0x4e>
    2cba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(wait() < 0){
    2cc0:	e8 bb 0c 00 00       	call   3980 <wait>
    2cc5:	85 c0                	test   %eax,%eax
    2cc7:	78 40                	js     2d09 <forktest+0x89>
  if(n == 1000){
    printf(1, "fork claimed to work 1000 times!\n");
    exit();
  }

  for(; n > 0; n--){
    2cc9:	83 eb 01             	sub    $0x1,%ebx
    2ccc:	75 f2                	jne    2cc0 <forktest+0x40>
      printf(1, "wait stopped early\n");
      exit();
    }
  }

  if(wait() != -1){
    2cce:	e8 ad 0c 00 00       	call   3980 <wait>
    2cd3:	83 f8 ff             	cmp    $0xffffffff,%eax
    2cd6:	75 45                	jne    2d1d <forktest+0x9d>
    printf(1, "wait got too many\n");
    exit();
  }

  printf(1, "fork test OK\n");
    2cd8:	83 ec 08             	sub    $0x8,%esp
    2cdb:	68 d2 4b 00 00       	push   $0x4bd2
    2ce0:	6a 01                	push   $0x1
    2ce2:	e8 e9 0d 00 00       	call   3ad0 <printf>
}
    2ce7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2cea:	c9                   	leave  
    2ceb:	c3                   	ret    
    2cec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(pid == 0)
      exit();
  }

  if(n == 1000){
    printf(1, "fork claimed to work 1000 times!\n");
    2cf0:	83 ec 08             	sub    $0x8,%esp
    2cf3:	68 40 53 00 00       	push   $0x5340
    2cf8:	6a 01                	push   $0x1
    2cfa:	e8 d1 0d 00 00       	call   3ad0 <printf>
    exit();
    2cff:	e8 74 0c 00 00       	call   3978 <exit>
  for(n=0; n<1000; n++){
    pid = fork();
    if(pid < 0)
      break;
    if(pid == 0)
      exit();
    2d04:	e8 6f 0c 00 00       	call   3978 <exit>
    exit();
  }

  for(; n > 0; n--){
    if(wait() < 0){
      printf(1, "wait stopped early\n");
    2d09:	83 ec 08             	sub    $0x8,%esp
    2d0c:	68 ab 4b 00 00       	push   $0x4bab
    2d11:	6a 01                	push   $0x1
    2d13:	e8 b8 0d 00 00       	call   3ad0 <printf>
      exit();
    2d18:	e8 5b 0c 00 00       	call   3978 <exit>
    }
  }

  if(wait() != -1){
    printf(1, "wait got too many\n");
    2d1d:	83 ec 08             	sub    $0x8,%esp
    2d20:	68 bf 4b 00 00       	push   $0x4bbf
    2d25:	6a 01                	push   $0x1
    2d27:	e8 a4 0d 00 00       	call   3ad0 <printf>
    exit();
    2d2c:	e8 47 0c 00 00       	call   3978 <exit>
    2d31:	eb 0d                	jmp    2d40 <sbrktest>
    2d33:	90                   	nop
    2d34:	90                   	nop
    2d35:	90                   	nop
    2d36:	90                   	nop
    2d37:	90                   	nop
    2d38:	90                   	nop
    2d39:	90                   	nop
    2d3a:	90                   	nop
    2d3b:	90                   	nop
    2d3c:	90                   	nop
    2d3d:	90                   	nop
    2d3e:	90                   	nop
    2d3f:	90                   	nop

00002d40 <sbrktest>:
  printf(1, "fork test OK\n");
}

void
sbrktest(void)
{
    2d40:	55                   	push   %ebp
    2d41:	89 e5                	mov    %esp,%ebp
    2d43:	57                   	push   %edi
    2d44:	56                   	push   %esi
    2d45:	53                   	push   %ebx
  oldbrk = sbrk(0);

  // can one sbrk() less than a page?
  a = sbrk(0);
  int i;
  for(i = 0; i < 5000; i++){
    2d46:	31 f6                	xor    %esi,%esi
  printf(1, "fork test OK\n");
}

void
sbrktest(void)
{
    2d48:	83 ec 64             	sub    $0x64,%esp
  int fds[2], pid, pids[10], ppid;
  char *a, *b, *c, *lastaddr, *oldbrk, *p, scratch;
  uint amt;

  printf(stdout, "sbrk test\n");
    2d4b:	68 e0 4b 00 00       	push   $0x4be0
    2d50:	ff 35 0c 5f 00 00    	pushl  0x5f0c
    2d56:	e8 75 0d 00 00       	call   3ad0 <printf>
  oldbrk = sbrk(0);
    2d5b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2d62:	e8 99 0c 00 00       	call   3a00 <sbrk>

  // can one sbrk() less than a page?
  a = sbrk(0);
    2d67:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  int fds[2], pid, pids[10], ppid;
  char *a, *b, *c, *lastaddr, *oldbrk, *p, scratch;
  uint amt;

  printf(stdout, "sbrk test\n");
  oldbrk = sbrk(0);
    2d6e:	89 c7                	mov    %eax,%edi

  // can one sbrk() less than a page?
  a = sbrk(0);
    2d70:	e8 8b 0c 00 00       	call   3a00 <sbrk>
    2d75:	83 c4 10             	add    $0x10,%esp
    2d78:	89 c3                	mov    %eax,%ebx
    2d7a:	eb 06                	jmp    2d82 <sbrktest+0x42>
    2d7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(b != a){
      printf(stdout, "sbrk test failed %d %x %x\n", i, a, b);
      exit();
    }
    *b = 1;
    a = b + 1;
    2d80:	89 c3                	mov    %eax,%ebx

  // can one sbrk() less than a page?
  a = sbrk(0);
  int i;
  for(i = 0; i < 5000; i++){
    b = sbrk(1);
    2d82:	83 ec 0c             	sub    $0xc,%esp
    2d85:	6a 01                	push   $0x1
    2d87:	e8 74 0c 00 00       	call   3a00 <sbrk>
    if(b != a){
    2d8c:	83 c4 10             	add    $0x10,%esp
    2d8f:	39 d8                	cmp    %ebx,%eax
    2d91:	0f 85 83 02 00 00    	jne    301a <sbrktest+0x2da>
  oldbrk = sbrk(0);

  // can one sbrk() less than a page?
  a = sbrk(0);
  int i;
  for(i = 0; i < 5000; i++){
    2d97:	83 c6 01             	add    $0x1,%esi
    b = sbrk(1);
    if(b != a){
      printf(stdout, "sbrk test failed %d %x %x\n", i, a, b);
      exit();
    }
    *b = 1;
    2d9a:	c6 03 01             	movb   $0x1,(%ebx)
    a = b + 1;
    2d9d:	8d 43 01             	lea    0x1(%ebx),%eax
  oldbrk = sbrk(0);

  // can one sbrk() less than a page?
  a = sbrk(0);
  int i;
  for(i = 0; i < 5000; i++){
    2da0:	81 fe 88 13 00 00    	cmp    $0x1388,%esi
    2da6:	75 d8                	jne    2d80 <sbrktest+0x40>
      exit();
    }
    *b = 1;
    a = b + 1;
  }
  pid = fork();
    2da8:	e8 c3 0b 00 00       	call   3970 <fork>
  if(pid < 0){
    2dad:	85 c0                	test   %eax,%eax
      exit();
    }
    *b = 1;
    a = b + 1;
  }
  pid = fork();
    2daf:	89 c6                	mov    %eax,%esi
  if(pid < 0){
    2db1:	0f 88 91 03 00 00    	js     3148 <sbrktest+0x408>
    printf(stdout, "sbrk test fork failed\n");
    exit();
  }
  c = sbrk(1);
    2db7:	83 ec 0c             	sub    $0xc,%esp
  c = sbrk(1);
  if(c != a + 1){
    2dba:	83 c3 02             	add    $0x2,%ebx
  pid = fork();
  if(pid < 0){
    printf(stdout, "sbrk test fork failed\n");
    exit();
  }
  c = sbrk(1);
    2dbd:	6a 01                	push   $0x1
    2dbf:	e8 3c 0c 00 00       	call   3a00 <sbrk>
  c = sbrk(1);
    2dc4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2dcb:	e8 30 0c 00 00       	call   3a00 <sbrk>
  if(c != a + 1){
    2dd0:	83 c4 10             	add    $0x10,%esp
    2dd3:	39 d8                	cmp    %ebx,%eax
    2dd5:	0f 85 55 03 00 00    	jne    3130 <sbrktest+0x3f0>
    printf(stdout, "sbrk test failed post-fork\n");
    exit();
  }
  if(pid == 0)
    2ddb:	85 f6                	test   %esi,%esi
    2ddd:	0f 84 48 03 00 00    	je     312b <sbrktest+0x3eb>
    exit();
  wait();
    2de3:	e8 98 0b 00 00       	call   3980 <wait>

  // can one grow address space to something big?
#define BIG (100*1024*1024)
  a = sbrk(0);
    2de8:	83 ec 0c             	sub    $0xc,%esp
    2deb:	6a 00                	push   $0x0
    2ded:	e8 0e 0c 00 00       	call   3a00 <sbrk>
    2df2:	89 c3                	mov    %eax,%ebx
  amt = (BIG) - (uint)a;
    2df4:	b8 00 00 40 06       	mov    $0x6400000,%eax
    2df9:	29 d8                	sub    %ebx,%eax
  p = sbrk(amt);
    2dfb:	89 04 24             	mov    %eax,(%esp)
    2dfe:	e8 fd 0b 00 00       	call   3a00 <sbrk>
  if (p != a) {
    2e03:	83 c4 10             	add    $0x10,%esp
    2e06:	39 c3                	cmp    %eax,%ebx
    2e08:	0f 85 05 03 00 00    	jne    3113 <sbrktest+0x3d3>
  }
  lastaddr = (char*) (BIG-1);
  *lastaddr = 99;

  // can one de-allocate?
  a = sbrk(0);
    2e0e:	83 ec 0c             	sub    $0xc,%esp
  if (p != a) {
    printf(stdout, "sbrk test failed to grow big address space; enough phys mem?\n");
    exit();
  }
  lastaddr = (char*) (BIG-1);
  *lastaddr = 99;
    2e11:	c6 05 ff ff 3f 06 63 	movb   $0x63,0x63fffff

  // can one de-allocate?
  a = sbrk(0);
    2e18:	6a 00                	push   $0x0
    2e1a:	e8 e1 0b 00 00       	call   3a00 <sbrk>
  c = sbrk(-4096);
    2e1f:	c7 04 24 00 f0 ff ff 	movl   $0xfffff000,(%esp)
  }
  lastaddr = (char*) (BIG-1);
  *lastaddr = 99;

  // can one de-allocate?
  a = sbrk(0);
    2e26:	89 c3                	mov    %eax,%ebx
  c = sbrk(-4096);
    2e28:	e8 d3 0b 00 00       	call   3a00 <sbrk>
  if(c == (char*)0xffffffff){
    2e2d:	83 c4 10             	add    $0x10,%esp
    2e30:	83 f8 ff             	cmp    $0xffffffff,%eax
    2e33:	0f 84 c2 02 00 00    	je     30fb <sbrktest+0x3bb>
    printf(stdout, "sbrk could not deallocate\n");
    exit();
  }
  c = sbrk(0);
    2e39:	83 ec 0c             	sub    $0xc,%esp
    2e3c:	6a 00                	push   $0x0
    2e3e:	e8 bd 0b 00 00       	call   3a00 <sbrk>
  if(c != a - 4096){
    2e43:	8d 93 00 f0 ff ff    	lea    -0x1000(%ebx),%edx
    2e49:	83 c4 10             	add    $0x10,%esp
    2e4c:	39 d0                	cmp    %edx,%eax
    2e4e:	0f 85 90 02 00 00    	jne    30e4 <sbrktest+0x3a4>
    printf(stdout, "sbrk deallocation produced wrong address, a %x c %x\n", a, c);
    exit();
  }

  // can one re-allocate that page?
  a = sbrk(0);
    2e54:	83 ec 0c             	sub    $0xc,%esp
    2e57:	6a 00                	push   $0x0
    2e59:	e8 a2 0b 00 00       	call   3a00 <sbrk>
    2e5e:	89 c3                	mov    %eax,%ebx
  c = sbrk(4096);
    2e60:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    2e67:	e8 94 0b 00 00       	call   3a00 <sbrk>
  if(c != a || sbrk(0) != a + 4096){
    2e6c:	83 c4 10             	add    $0x10,%esp
    2e6f:	39 c3                	cmp    %eax,%ebx
    exit();
  }

  // can one re-allocate that page?
  a = sbrk(0);
  c = sbrk(4096);
    2e71:	89 c6                	mov    %eax,%esi
  if(c != a || sbrk(0) != a + 4096){
    2e73:	0f 85 54 02 00 00    	jne    30cd <sbrktest+0x38d>
    2e79:	83 ec 0c             	sub    $0xc,%esp
    2e7c:	6a 00                	push   $0x0
    2e7e:	e8 7d 0b 00 00       	call   3a00 <sbrk>
    2e83:	8d 93 00 10 00 00    	lea    0x1000(%ebx),%edx
    2e89:	83 c4 10             	add    $0x10,%esp
    2e8c:	39 d0                	cmp    %edx,%eax
    2e8e:	0f 85 39 02 00 00    	jne    30cd <sbrktest+0x38d>
    printf(stdout, "sbrk re-allocation failed, a %x c %x\n", a, c);
    exit();
  }
  if(*lastaddr == 99){
    2e94:	80 3d ff ff 3f 06 63 	cmpb   $0x63,0x63fffff
    2e9b:	0f 84 14 02 00 00    	je     30b5 <sbrktest+0x375>
    // should be zero
    printf(stdout, "sbrk de-allocation didn't really deallocate\n");
    exit();
  }

  a = sbrk(0);
    2ea1:	83 ec 0c             	sub    $0xc,%esp
    2ea4:	6a 00                	push   $0x0
    2ea6:	e8 55 0b 00 00       	call   3a00 <sbrk>
  c = sbrk(-(sbrk(0) - oldbrk));
    2eab:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    // should be zero
    printf(stdout, "sbrk de-allocation didn't really deallocate\n");
    exit();
  }

  a = sbrk(0);
    2eb2:	89 c3                	mov    %eax,%ebx
  c = sbrk(-(sbrk(0) - oldbrk));
    2eb4:	e8 47 0b 00 00       	call   3a00 <sbrk>
    2eb9:	89 f9                	mov    %edi,%ecx
    2ebb:	29 c1                	sub    %eax,%ecx
    2ebd:	89 0c 24             	mov    %ecx,(%esp)
    2ec0:	e8 3b 0b 00 00       	call   3a00 <sbrk>
  if(c != a){
    2ec5:	83 c4 10             	add    $0x10,%esp
    2ec8:	39 c3                	cmp    %eax,%ebx
    2eca:	0f 85 ce 01 00 00    	jne    309e <sbrktest+0x35e>
    2ed0:	bb 00 00 00 80       	mov    $0x80000000,%ebx
    2ed5:	8d 76 00             	lea    0x0(%esi),%esi
    exit();
  }

  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    ppid = getpid();
    2ed8:	e8 1b 0b 00 00       	call   39f8 <getpid>
    2edd:	89 c6                	mov    %eax,%esi
    pid = fork();
    2edf:	e8 8c 0a 00 00       	call   3970 <fork>
    if(pid < 0){
    2ee4:	85 c0                	test   %eax,%eax
    2ee6:	0f 88 9a 01 00 00    	js     3086 <sbrktest+0x346>
      printf(stdout, "fork failed\n");
      exit();
    }
    if(pid == 0){
    2eec:	0f 84 72 01 00 00    	je     3064 <sbrktest+0x324>
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    exit();
  }

  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    2ef2:	81 c3 50 c3 00 00    	add    $0xc350,%ebx
    if(pid == 0){
      printf(stdout, "oops could read %x = %x\n", a, *a);
      kill(ppid);
      exit();
    }
    wait();
    2ef8:	e8 83 0a 00 00       	call   3980 <wait>
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    exit();
  }

  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    2efd:	81 fb 80 84 1e 80    	cmp    $0x801e8480,%ebx
    2f03:	75 d3                	jne    2ed8 <sbrktest+0x198>
    wait();
  }

  // if we run the system out of memory, does it clean up the last
  // failed allocation?
  if(pipe(fds) != 0){
    2f05:	8d 45 b8             	lea    -0x48(%ebp),%eax
    2f08:	83 ec 0c             	sub    $0xc,%esp
    2f0b:	50                   	push   %eax
    2f0c:	e8 77 0a 00 00       	call   3988 <pipe>
    2f11:	83 c4 10             	add    $0x10,%esp
    2f14:	85 c0                	test   %eax,%eax
    2f16:	0f 85 34 01 00 00    	jne    3050 <sbrktest+0x310>
    2f1c:	8d 75 c0             	lea    -0x40(%ebp),%esi
    2f1f:	89 f3                	mov    %esi,%ebx
    printf(1, "pipe() failed\n");
    exit();
  }
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    if((pids[i] = fork()) == 0){
    2f21:	e8 4a 0a 00 00       	call   3970 <fork>
    2f26:	85 c0                	test   %eax,%eax
    2f28:	89 03                	mov    %eax,(%ebx)
    2f2a:	0f 84 a5 00 00 00    	je     2fd5 <sbrktest+0x295>
      sbrk(BIG - (uint)sbrk(0));
      write(fds[1], "x", 1);
      // sit around until killed
      for(;;) sleep(1000);
    }
    if(pids[i] != -1)
    2f30:	83 f8 ff             	cmp    $0xffffffff,%eax
    2f33:	74 14                	je     2f49 <sbrktest+0x209>
      read(fds[0], &scratch, 1);
    2f35:	8d 45 b7             	lea    -0x49(%ebp),%eax
    2f38:	83 ec 04             	sub    $0x4,%esp
    2f3b:	6a 01                	push   $0x1
    2f3d:	50                   	push   %eax
    2f3e:	ff 75 b8             	pushl  -0x48(%ebp)
    2f41:	e8 4a 0a 00 00       	call   3990 <read>
    2f46:	83 c4 10             	add    $0x10,%esp
  // failed allocation?
  if(pipe(fds) != 0){
    printf(1, "pipe() failed\n");
    exit();
  }
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    2f49:	8d 45 e8             	lea    -0x18(%ebp),%eax
    2f4c:	83 c3 04             	add    $0x4,%ebx
    2f4f:	39 c3                	cmp    %eax,%ebx
    2f51:	75 ce                	jne    2f21 <sbrktest+0x1e1>
    if(pids[i] != -1)
      read(fds[0], &scratch, 1);
  }
  // if those failed allocations freed up the pages they did allocate,
  // we'll be able to allocate here
  c = sbrk(4096);
    2f53:	83 ec 0c             	sub    $0xc,%esp
    2f56:	68 00 10 00 00       	push   $0x1000
    2f5b:	e8 a0 0a 00 00       	call   3a00 <sbrk>
    2f60:	83 c4 10             	add    $0x10,%esp
    2f63:	89 45 a4             	mov    %eax,-0x5c(%ebp)
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    if(pids[i] == -1)
    2f66:	8b 06                	mov    (%esi),%eax
    2f68:	83 f8 ff             	cmp    $0xffffffff,%eax
    2f6b:	74 11                	je     2f7e <sbrktest+0x23e>
      continue;
    kill(pids[i]);
    2f6d:	83 ec 0c             	sub    $0xc,%esp
    2f70:	50                   	push   %eax
    2f71:	e8 32 0a 00 00       	call   39a8 <kill>
    wait();
    2f76:	e8 05 0a 00 00       	call   3980 <wait>
    2f7b:	83 c4 10             	add    $0x10,%esp
    2f7e:	83 c6 04             	add    $0x4,%esi
      read(fds[0], &scratch, 1);
  }
  // if those failed allocations freed up the pages they did allocate,
  // we'll be able to allocate here
  c = sbrk(4096);
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    2f81:	39 f3                	cmp    %esi,%ebx
    2f83:	75 e1                	jne    2f66 <sbrktest+0x226>
    if(pids[i] == -1)
      continue;
    kill(pids[i]);
    wait();
  }
  if(c == (char*)0xffffffff){
    2f85:	83 7d a4 ff          	cmpl   $0xffffffff,-0x5c(%ebp)
    2f89:	0f 84 a9 00 00 00    	je     3038 <sbrktest+0x2f8>
    printf(stdout, "failed sbrk leaked memory\n");
    exit();
  }

  if(sbrk(0) > oldbrk)
    2f8f:	83 ec 0c             	sub    $0xc,%esp
    2f92:	6a 00                	push   $0x0
    2f94:	e8 67 0a 00 00       	call   3a00 <sbrk>
    2f99:	83 c4 10             	add    $0x10,%esp
    2f9c:	39 c7                	cmp    %eax,%edi
    2f9e:	73 17                	jae    2fb7 <sbrktest+0x277>
    sbrk(-(sbrk(0) - oldbrk));
    2fa0:	83 ec 0c             	sub    $0xc,%esp
    2fa3:	6a 00                	push   $0x0
    2fa5:	e8 56 0a 00 00       	call   3a00 <sbrk>
    2faa:	29 c7                	sub    %eax,%edi
    2fac:	89 3c 24             	mov    %edi,(%esp)
    2faf:	e8 4c 0a 00 00       	call   3a00 <sbrk>
    2fb4:	83 c4 10             	add    $0x10,%esp

  printf(stdout, "sbrk test OK\n");
    2fb7:	83 ec 08             	sub    $0x8,%esp
    2fba:	68 88 4c 00 00       	push   $0x4c88
    2fbf:	ff 35 0c 5f 00 00    	pushl  0x5f0c
    2fc5:	e8 06 0b 00 00       	call   3ad0 <printf>
}
    2fca:	83 c4 10             	add    $0x10,%esp
    2fcd:	8d 65 f4             	lea    -0xc(%ebp),%esp
    2fd0:	5b                   	pop    %ebx
    2fd1:	5e                   	pop    %esi
    2fd2:	5f                   	pop    %edi
    2fd3:	5d                   	pop    %ebp
    2fd4:	c3                   	ret    
    exit();
  }
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    if((pids[i] = fork()) == 0){
      // allocate a lot of memory
      sbrk(BIG - (uint)sbrk(0));
    2fd5:	83 ec 0c             	sub    $0xc,%esp
    2fd8:	6a 00                	push   $0x0
    2fda:	e8 21 0a 00 00       	call   3a00 <sbrk>
    2fdf:	ba 00 00 40 06       	mov    $0x6400000,%edx
    2fe4:	29 c2                	sub    %eax,%edx
    2fe6:	89 14 24             	mov    %edx,(%esp)
    2fe9:	e8 12 0a 00 00       	call   3a00 <sbrk>
      write(fds[1], "x", 1);
    2fee:	83 c4 0c             	add    $0xc,%esp
    2ff1:	6a 01                	push   $0x1
    2ff3:	68 49 47 00 00       	push   $0x4749
    2ff8:	ff 75 bc             	pushl  -0x44(%ebp)
    2ffb:	e8 98 09 00 00       	call   3998 <write>
    3000:	83 c4 10             	add    $0x10,%esp
    3003:	90                   	nop
    3004:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      // sit around until killed
      for(;;) sleep(1000);
    3008:	83 ec 0c             	sub    $0xc,%esp
    300b:	68 e8 03 00 00       	push   $0x3e8
    3010:	e8 f3 09 00 00       	call   3a08 <sleep>
    3015:	83 c4 10             	add    $0x10,%esp
    3018:	eb ee                	jmp    3008 <sbrktest+0x2c8>
  a = sbrk(0);
  int i;
  for(i = 0; i < 5000; i++){
    b = sbrk(1);
    if(b != a){
      printf(stdout, "sbrk test failed %d %x %x\n", i, a, b);
    301a:	83 ec 0c             	sub    $0xc,%esp
    301d:	50                   	push   %eax
    301e:	53                   	push   %ebx
    301f:	56                   	push   %esi
    3020:	68 eb 4b 00 00       	push   $0x4beb
    3025:	ff 35 0c 5f 00 00    	pushl  0x5f0c
    302b:	e8 a0 0a 00 00       	call   3ad0 <printf>
      exit();
    3030:	83 c4 20             	add    $0x20,%esp
    3033:	e8 40 09 00 00       	call   3978 <exit>
      continue;
    kill(pids[i]);
    wait();
  }
  if(c == (char*)0xffffffff){
    printf(stdout, "failed sbrk leaked memory\n");
    3038:	83 ec 08             	sub    $0x8,%esp
    303b:	68 6d 4c 00 00       	push   $0x4c6d
    3040:	ff 35 0c 5f 00 00    	pushl  0x5f0c
    3046:	e8 85 0a 00 00       	call   3ad0 <printf>
    exit();
    304b:	e8 28 09 00 00       	call   3978 <exit>
  }

  // if we run the system out of memory, does it clean up the last
  // failed allocation?
  if(pipe(fds) != 0){
    printf(1, "pipe() failed\n");
    3050:	83 ec 08             	sub    $0x8,%esp
    3053:	68 29 41 00 00       	push   $0x4129
    3058:	6a 01                	push   $0x1
    305a:	e8 71 0a 00 00       	call   3ad0 <printf>
    exit();
    305f:	e8 14 09 00 00       	call   3978 <exit>
    if(pid < 0){
      printf(stdout, "fork failed\n");
      exit();
    }
    if(pid == 0){
      printf(stdout, "oops could read %x = %x\n", a, *a);
    3064:	0f be 03             	movsbl (%ebx),%eax
    3067:	50                   	push   %eax
    3068:	53                   	push   %ebx
    3069:	68 54 4c 00 00       	push   $0x4c54
    306e:	ff 35 0c 5f 00 00    	pushl  0x5f0c
    3074:	e8 57 0a 00 00       	call   3ad0 <printf>
      kill(ppid);
    3079:	89 34 24             	mov    %esi,(%esp)
    307c:	e8 27 09 00 00       	call   39a8 <kill>
      exit();
    3081:	e8 f2 08 00 00       	call   3978 <exit>
  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    ppid = getpid();
    pid = fork();
    if(pid < 0){
      printf(stdout, "fork failed\n");
    3086:	83 ec 08             	sub    $0x8,%esp
    3089:	68 31 4d 00 00       	push   $0x4d31
    308e:	ff 35 0c 5f 00 00    	pushl  0x5f0c
    3094:	e8 37 0a 00 00       	call   3ad0 <printf>
      exit();
    3099:	e8 da 08 00 00       	call   3978 <exit>
  }

  a = sbrk(0);
  c = sbrk(-(sbrk(0) - oldbrk));
  if(c != a){
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    309e:	50                   	push   %eax
    309f:	53                   	push   %ebx
    30a0:	68 34 54 00 00       	push   $0x5434
    30a5:	ff 35 0c 5f 00 00    	pushl  0x5f0c
    30ab:	e8 20 0a 00 00       	call   3ad0 <printf>
    exit();
    30b0:	e8 c3 08 00 00       	call   3978 <exit>
    printf(stdout, "sbrk re-allocation failed, a %x c %x\n", a, c);
    exit();
  }
  if(*lastaddr == 99){
    // should be zero
    printf(stdout, "sbrk de-allocation didn't really deallocate\n");
    30b5:	83 ec 08             	sub    $0x8,%esp
    30b8:	68 04 54 00 00       	push   $0x5404
    30bd:	ff 35 0c 5f 00 00    	pushl  0x5f0c
    30c3:	e8 08 0a 00 00       	call   3ad0 <printf>
    exit();
    30c8:	e8 ab 08 00 00       	call   3978 <exit>

  // can one re-allocate that page?
  a = sbrk(0);
  c = sbrk(4096);
  if(c != a || sbrk(0) != a + 4096){
    printf(stdout, "sbrk re-allocation failed, a %x c %x\n", a, c);
    30cd:	56                   	push   %esi
    30ce:	53                   	push   %ebx
    30cf:	68 dc 53 00 00       	push   $0x53dc
    30d4:	ff 35 0c 5f 00 00    	pushl  0x5f0c
    30da:	e8 f1 09 00 00       	call   3ad0 <printf>
    exit();
    30df:	e8 94 08 00 00       	call   3978 <exit>
    printf(stdout, "sbrk could not deallocate\n");
    exit();
  }
  c = sbrk(0);
  if(c != a - 4096){
    printf(stdout, "sbrk deallocation produced wrong address, a %x c %x\n", a, c);
    30e4:	50                   	push   %eax
    30e5:	53                   	push   %ebx
    30e6:	68 a4 53 00 00       	push   $0x53a4
    30eb:	ff 35 0c 5f 00 00    	pushl  0x5f0c
    30f1:	e8 da 09 00 00       	call   3ad0 <printf>
    exit();
    30f6:	e8 7d 08 00 00       	call   3978 <exit>

  // can one de-allocate?
  a = sbrk(0);
  c = sbrk(-4096);
  if(c == (char*)0xffffffff){
    printf(stdout, "sbrk could not deallocate\n");
    30fb:	83 ec 08             	sub    $0x8,%esp
    30fe:	68 39 4c 00 00       	push   $0x4c39
    3103:	ff 35 0c 5f 00 00    	pushl  0x5f0c
    3109:	e8 c2 09 00 00       	call   3ad0 <printf>
    exit();
    310e:	e8 65 08 00 00       	call   3978 <exit>
#define BIG (100*1024*1024)
  a = sbrk(0);
  amt = (BIG) - (uint)a;
  p = sbrk(amt);
  if (p != a) {
    printf(stdout, "sbrk test failed to grow big address space; enough phys mem?\n");
    3113:	83 ec 08             	sub    $0x8,%esp
    3116:	68 64 53 00 00       	push   $0x5364
    311b:	ff 35 0c 5f 00 00    	pushl  0x5f0c
    3121:	e8 aa 09 00 00       	call   3ad0 <printf>
    exit();
    3126:	e8 4d 08 00 00       	call   3978 <exit>
  if(c != a + 1){
    printf(stdout, "sbrk test failed post-fork\n");
    exit();
  }
  if(pid == 0)
    exit();
    312b:	e8 48 08 00 00       	call   3978 <exit>
    exit();
  }
  c = sbrk(1);
  c = sbrk(1);
  if(c != a + 1){
    printf(stdout, "sbrk test failed post-fork\n");
    3130:	83 ec 08             	sub    $0x8,%esp
    3133:	68 1d 4c 00 00       	push   $0x4c1d
    3138:	ff 35 0c 5f 00 00    	pushl  0x5f0c
    313e:	e8 8d 09 00 00       	call   3ad0 <printf>
    exit();
    3143:	e8 30 08 00 00       	call   3978 <exit>
    *b = 1;
    a = b + 1;
  }
  pid = fork();
  if(pid < 0){
    printf(stdout, "sbrk test fork failed\n");
    3148:	83 ec 08             	sub    $0x8,%esp
    314b:	68 06 4c 00 00       	push   $0x4c06
    3150:	ff 35 0c 5f 00 00    	pushl  0x5f0c
    3156:	e8 75 09 00 00       	call   3ad0 <printf>
    exit();
    315b:	e8 18 08 00 00       	call   3978 <exit>

00003160 <validateint>:
  printf(stdout, "sbrk test OK\n");
}

void
validateint(int *p)
{
    3160:	55                   	push   %ebp
    3161:	89 e5                	mov    %esp,%ebp
      "int %2\n\t"
      "mov %%ebx, %%esp" :
      "=a" (res) :
      "a" (SYS_sleep), "n" (T_SYSCALL), "c" (p) :
      "ebx");
}
    3163:	5d                   	pop    %ebp
    3164:	c3                   	ret    
    3165:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    3169:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003170 <validatetest>:

void
validatetest(void)
{
    3170:	55                   	push   %ebp
    3171:	89 e5                	mov    %esp,%ebp
    3173:	56                   	push   %esi
    3174:	53                   	push   %ebx
  uint p;

  printf(stdout, "validate test\n");
  hi = 1100*1024;

  for(p = 0; p <= (uint)hi; p += 4096){
    3175:	31 db                	xor    %ebx,%ebx
validatetest(void)
{
  int hi, pid;
  uint p;

  printf(stdout, "validate test\n");
    3177:	83 ec 08             	sub    $0x8,%esp
    317a:	68 96 4c 00 00       	push   $0x4c96
    317f:	ff 35 0c 5f 00 00    	pushl  0x5f0c
    3185:	e8 46 09 00 00       	call   3ad0 <printf>
    318a:	83 c4 10             	add    $0x10,%esp
    318d:	8d 76 00             	lea    0x0(%esi),%esi
  hi = 1100*1024;

  for(p = 0; p <= (uint)hi; p += 4096){
    if((pid = fork()) == 0){
    3190:	e8 db 07 00 00       	call   3970 <fork>
    3195:	85 c0                	test   %eax,%eax
    3197:	89 c6                	mov    %eax,%esi
    3199:	74 63                	je     31fe <validatetest+0x8e>
      // try to crash the kernel by passing in a badly placed integer
      validateint((int*)p);
      exit();
    }
    sleep(0);
    319b:	83 ec 0c             	sub    $0xc,%esp
    319e:	6a 00                	push   $0x0
    31a0:	e8 63 08 00 00       	call   3a08 <sleep>
    sleep(0);
    31a5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    31ac:	e8 57 08 00 00       	call   3a08 <sleep>
    kill(pid);
    31b1:	89 34 24             	mov    %esi,(%esp)
    31b4:	e8 ef 07 00 00       	call   39a8 <kill>
    wait();
    31b9:	e8 c2 07 00 00       	call   3980 <wait>

    // try to crash the kernel by passing in a bad string pointer
    if(link("nosuchfile", (char*)p) != -1){
    31be:	58                   	pop    %eax
    31bf:	5a                   	pop    %edx
    31c0:	53                   	push   %ebx
    31c1:	68 a5 4c 00 00       	push   $0x4ca5
    31c6:	e8 0d 08 00 00       	call   39d8 <link>
    31cb:	83 c4 10             	add    $0x10,%esp
    31ce:	83 f8 ff             	cmp    $0xffffffff,%eax
    31d1:	75 30                	jne    3203 <validatetest+0x93>
  uint p;

  printf(stdout, "validate test\n");
  hi = 1100*1024;

  for(p = 0; p <= (uint)hi; p += 4096){
    31d3:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    31d9:	81 fb 00 40 11 00    	cmp    $0x114000,%ebx
    31df:	75 af                	jne    3190 <validatetest+0x20>
      printf(stdout, "link should not succeed\n");
      exit();
    }
  }

  printf(stdout, "validate ok\n");
    31e1:	83 ec 08             	sub    $0x8,%esp
    31e4:	68 c9 4c 00 00       	push   $0x4cc9
    31e9:	ff 35 0c 5f 00 00    	pushl  0x5f0c
    31ef:	e8 dc 08 00 00       	call   3ad0 <printf>
}
    31f4:	83 c4 10             	add    $0x10,%esp
    31f7:	8d 65 f8             	lea    -0x8(%ebp),%esp
    31fa:	5b                   	pop    %ebx
    31fb:	5e                   	pop    %esi
    31fc:	5d                   	pop    %ebp
    31fd:	c3                   	ret    

  for(p = 0; p <= (uint)hi; p += 4096){
    if((pid = fork()) == 0){
      // try to crash the kernel by passing in a badly placed integer
      validateint((int*)p);
      exit();
    31fe:	e8 75 07 00 00       	call   3978 <exit>
    kill(pid);
    wait();

    // try to crash the kernel by passing in a bad string pointer
    if(link("nosuchfile", (char*)p) != -1){
      printf(stdout, "link should not succeed\n");
    3203:	83 ec 08             	sub    $0x8,%esp
    3206:	68 b0 4c 00 00       	push   $0x4cb0
    320b:	ff 35 0c 5f 00 00    	pushl  0x5f0c
    3211:	e8 ba 08 00 00       	call   3ad0 <printf>
      exit();
    3216:	e8 5d 07 00 00       	call   3978 <exit>
    321b:	90                   	nop
    321c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00003220 <bsstest>:

// does unintialized data start out zero?
char uninit[10000];
void
bsstest(void)
{
    3220:	55                   	push   %ebp
    3221:	89 e5                	mov    %esp,%ebp
    3223:	83 ec 10             	sub    $0x10,%esp
  int i;

  printf(stdout, "bss test\n");
    3226:	68 d6 4c 00 00       	push   $0x4cd6
    322b:	ff 35 0c 5f 00 00    	pushl  0x5f0c
    3231:	e8 9a 08 00 00       	call   3ad0 <printf>
  for(i = 0; i < sizeof(uninit); i++){
    if(uninit[i] != '\0'){
    3236:	83 c4 10             	add    $0x10,%esp
    3239:	80 3d e0 5f 00 00 00 	cmpb   $0x0,0x5fe0
    3240:	75 39                	jne    327b <bsstest+0x5b>
    3242:	b8 01 00 00 00       	mov    $0x1,%eax
    3247:	89 f6                	mov    %esi,%esi
    3249:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    3250:	80 b8 e0 5f 00 00 00 	cmpb   $0x0,0x5fe0(%eax)
    3257:	75 22                	jne    327b <bsstest+0x5b>
bsstest(void)
{
  int i;

  printf(stdout, "bss test\n");
  for(i = 0; i < sizeof(uninit); i++){
    3259:	83 c0 01             	add    $0x1,%eax
    325c:	3d 10 27 00 00       	cmp    $0x2710,%eax
    3261:	75 ed                	jne    3250 <bsstest+0x30>
    if(uninit[i] != '\0'){
      printf(stdout, "bss test failed\n");
      exit();
    }
  }
  printf(stdout, "bss test ok\n");
    3263:	83 ec 08             	sub    $0x8,%esp
    3266:	68 f1 4c 00 00       	push   $0x4cf1
    326b:	ff 35 0c 5f 00 00    	pushl  0x5f0c
    3271:	e8 5a 08 00 00       	call   3ad0 <printf>
}
    3276:	83 c4 10             	add    $0x10,%esp
    3279:	c9                   	leave  
    327a:	c3                   	ret    
  int i;

  printf(stdout, "bss test\n");
  for(i = 0; i < sizeof(uninit); i++){
    if(uninit[i] != '\0'){
      printf(stdout, "bss test failed\n");
    327b:	83 ec 08             	sub    $0x8,%esp
    327e:	68 e0 4c 00 00       	push   $0x4ce0
    3283:	ff 35 0c 5f 00 00    	pushl  0x5f0c
    3289:	e8 42 08 00 00       	call   3ad0 <printf>
      exit();
    328e:	e8 e5 06 00 00       	call   3978 <exit>
    3293:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    3299:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000032a0 <bigargtest>:
// does exec return an error if the arguments
// are larger than a page? or does it write
// below the stack and wreck the instructions/data?
void
bigargtest(void)
{
    32a0:	55                   	push   %ebp
    32a1:	89 e5                	mov    %esp,%ebp
    32a3:	83 ec 14             	sub    $0x14,%esp
  int pid, fd;

  unlink("bigarg-ok");
    32a6:	68 fe 4c 00 00       	push   $0x4cfe
    32ab:	e8 18 07 00 00       	call   39c8 <unlink>
  pid = fork();
    32b0:	e8 bb 06 00 00       	call   3970 <fork>
  if(pid == 0){
    32b5:	83 c4 10             	add    $0x10,%esp
    32b8:	85 c0                	test   %eax,%eax
    32ba:	74 3f                	je     32fb <bigargtest+0x5b>
    exec("echo", args);
    printf(stdout, "bigarg test ok\n");
    fd = open("bigarg-ok", O_CREATE);
    close(fd);
    exit();
  } else if(pid < 0){
    32bc:	0f 88 c2 00 00 00    	js     3384 <bigargtest+0xe4>
    printf(stdout, "bigargtest: fork failed\n");
    exit();
  }
  wait();
    32c2:	e8 b9 06 00 00       	call   3980 <wait>
  fd = open("bigarg-ok", 0);
    32c7:	83 ec 08             	sub    $0x8,%esp
    32ca:	6a 00                	push   $0x0
    32cc:	68 fe 4c 00 00       	push   $0x4cfe
    32d1:	e8 e2 06 00 00       	call   39b8 <open>
  if(fd < 0){
    32d6:	83 c4 10             	add    $0x10,%esp
    32d9:	85 c0                	test   %eax,%eax
    32db:	0f 88 8c 00 00 00    	js     336d <bigargtest+0xcd>
    printf(stdout, "bigarg test failed!\n");
    exit();
  }
  close(fd);
    32e1:	83 ec 0c             	sub    $0xc,%esp
    32e4:	50                   	push   %eax
    32e5:	e8 b6 06 00 00       	call   39a0 <close>
  unlink("bigarg-ok");
    32ea:	c7 04 24 fe 4c 00 00 	movl   $0x4cfe,(%esp)
    32f1:	e8 d2 06 00 00       	call   39c8 <unlink>
}
    32f6:	83 c4 10             	add    $0x10,%esp
    32f9:	c9                   	leave  
    32fa:	c3                   	ret    
    32fb:	b8 40 5f 00 00       	mov    $0x5f40,%eax
  pid = fork();
  if(pid == 0){
    static char *args[MAXARG];
    int i;
    for(i = 0; i < MAXARG-1; i++)
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    3300:	c7 00 58 54 00 00    	movl   $0x5458,(%eax)
    3306:	83 c0 04             	add    $0x4,%eax
  unlink("bigarg-ok");
  pid = fork();
  if(pid == 0){
    static char *args[MAXARG];
    int i;
    for(i = 0; i < MAXARG-1; i++)
    3309:	3d bc 5f 00 00       	cmp    $0x5fbc,%eax
    330e:	75 f0                	jne    3300 <bigargtest+0x60>
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    args[MAXARG-1] = 0;
    printf(stdout, "bigarg test\n");
    3310:	51                   	push   %ecx
    3311:	51                   	push   %ecx
    3312:	68 08 4d 00 00       	push   $0x4d08
    3317:	ff 35 0c 5f 00 00    	pushl  0x5f0c
  if(pid == 0){
    static char *args[MAXARG];
    int i;
    for(i = 0; i < MAXARG-1; i++)
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    args[MAXARG-1] = 0;
    331d:	c7 05 bc 5f 00 00 00 	movl   $0x0,0x5fbc
    3324:	00 00 00 
    printf(stdout, "bigarg test\n");
    3327:	e8 a4 07 00 00       	call   3ad0 <printf>
    exec("echo", args);
    332c:	58                   	pop    %eax
    332d:	5a                   	pop    %edx
    332e:	68 40 5f 00 00       	push   $0x5f40
    3333:	68 d5 3e 00 00       	push   $0x3ed5
    3338:	e8 73 06 00 00       	call   39b0 <exec>
    printf(stdout, "bigarg test ok\n");
    333d:	59                   	pop    %ecx
    333e:	58                   	pop    %eax
    333f:	68 15 4d 00 00       	push   $0x4d15
    3344:	ff 35 0c 5f 00 00    	pushl  0x5f0c
    334a:	e8 81 07 00 00       	call   3ad0 <printf>
    fd = open("bigarg-ok", O_CREATE);
    334f:	58                   	pop    %eax
    3350:	5a                   	pop    %edx
    3351:	68 00 02 00 00       	push   $0x200
    3356:	68 fe 4c 00 00       	push   $0x4cfe
    335b:	e8 58 06 00 00       	call   39b8 <open>
    close(fd);
    3360:	89 04 24             	mov    %eax,(%esp)
    3363:	e8 38 06 00 00       	call   39a0 <close>
    exit();
    3368:	e8 0b 06 00 00       	call   3978 <exit>
    exit();
  }
  wait();
  fd = open("bigarg-ok", 0);
  if(fd < 0){
    printf(stdout, "bigarg test failed!\n");
    336d:	50                   	push   %eax
    336e:	50                   	push   %eax
    336f:	68 3e 4d 00 00       	push   $0x4d3e
    3374:	ff 35 0c 5f 00 00    	pushl  0x5f0c
    337a:	e8 51 07 00 00       	call   3ad0 <printf>
    exit();
    337f:	e8 f4 05 00 00       	call   3978 <exit>
    printf(stdout, "bigarg test ok\n");
    fd = open("bigarg-ok", O_CREATE);
    close(fd);
    exit();
  } else if(pid < 0){
    printf(stdout, "bigargtest: fork failed\n");
    3384:	52                   	push   %edx
    3385:	52                   	push   %edx
    3386:	68 25 4d 00 00       	push   $0x4d25
    338b:	ff 35 0c 5f 00 00    	pushl  0x5f0c
    3391:	e8 3a 07 00 00       	call   3ad0 <printf>
    exit();
    3396:	e8 dd 05 00 00       	call   3978 <exit>
    339b:	90                   	nop
    339c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000033a0 <fsfull>:

// what happens when the file system runs out of blocks?
// answer: balloc panics, so this test is not useful.
void
fsfull()
{
    33a0:	55                   	push   %ebp
    33a1:	89 e5                	mov    %esp,%ebp
    33a3:	57                   	push   %edi
    33a4:	56                   	push   %esi
    33a5:	53                   	push   %ebx
  int nfiles;
  int fsblocks = 0;

  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    33a6:	31 db                	xor    %ebx,%ebx

// what happens when the file system runs out of blocks?
// answer: balloc panics, so this test is not useful.
void
fsfull()
{
    33a8:	83 ec 54             	sub    $0x54,%esp
  int nfiles;
  int fsblocks = 0;

  printf(1, "fsfull test\n");
    33ab:	68 53 4d 00 00       	push   $0x4d53
    33b0:	6a 01                	push   $0x1
    33b2:	e8 19 07 00 00       	call   3ad0 <printf>
    33b7:	83 c4 10             	add    $0x10,%esp
    33ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    33c0:	b8 d3 4d 62 10       	mov    $0x10624dd3,%eax
    33c5:	89 de                	mov    %ebx,%esi
    name[2] = '0' + (nfiles % 1000) / 100;
    33c7:	89 d9                	mov    %ebx,%ecx
  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    33c9:	f7 eb                	imul   %ebx
    33cb:	c1 fe 1f             	sar    $0x1f,%esi
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    33ce:	89 df                	mov    %ebx,%edi
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    printf(1, "writing %s\n", name);
    33d0:	83 ec 04             	sub    $0x4,%esp

  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    33d3:	c6 45 a8 66          	movb   $0x66,-0x58(%ebp)
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    33d7:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    33db:	c1 fa 06             	sar    $0x6,%edx
    33de:	29 f2                	sub    %esi,%edx
    33e0:	8d 42 30             	lea    0x30(%edx),%eax
    name[2] = '0' + (nfiles % 1000) / 100;
    33e3:	69 d2 e8 03 00 00    	imul   $0x3e8,%edx,%edx
  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    33e9:	88 45 a9             	mov    %al,-0x57(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    33ec:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    33f1:	29 d1                	sub    %edx,%ecx
    33f3:	f7 e9                	imul   %ecx
    33f5:	c1 f9 1f             	sar    $0x1f,%ecx
    name[3] = '0' + (nfiles % 100) / 10;
    33f8:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    33fd:	c1 fa 05             	sar    $0x5,%edx
    3400:	29 ca                	sub    %ecx,%edx
    name[3] = '0' + (nfiles % 100) / 10;
    3402:	b9 67 66 66 66       	mov    $0x66666667,%ecx

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    3407:	83 c2 30             	add    $0x30,%edx
    340a:	88 55 aa             	mov    %dl,-0x56(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
    340d:	f7 eb                	imul   %ebx
    340f:	c1 fa 05             	sar    $0x5,%edx
    3412:	29 f2                	sub    %esi,%edx
    3414:	6b d2 64             	imul   $0x64,%edx,%edx
    3417:	29 d7                	sub    %edx,%edi
    3419:	89 f8                	mov    %edi,%eax
    341b:	c1 ff 1f             	sar    $0x1f,%edi
    341e:	f7 e9                	imul   %ecx
    name[4] = '0' + (nfiles % 10);
    3420:	89 d8                	mov    %ebx,%eax
  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    3422:	c1 fa 02             	sar    $0x2,%edx
    3425:	29 fa                	sub    %edi,%edx
    3427:	83 c2 30             	add    $0x30,%edx
    342a:	88 55 ab             	mov    %dl,-0x55(%ebp)
    name[4] = '0' + (nfiles % 10);
    342d:	f7 e9                	imul   %ecx
    342f:	89 d9                	mov    %ebx,%ecx
    3431:	c1 fa 02             	sar    $0x2,%edx
    3434:	29 f2                	sub    %esi,%edx
    3436:	8d 04 92             	lea    (%edx,%edx,4),%eax
    3439:	01 c0                	add    %eax,%eax
    343b:	29 c1                	sub    %eax,%ecx
    343d:	89 c8                	mov    %ecx,%eax
    343f:	83 c0 30             	add    $0x30,%eax
    3442:	88 45 ac             	mov    %al,-0x54(%ebp)
    name[5] = '\0';
    printf(1, "writing %s\n", name);
    3445:	8d 45 a8             	lea    -0x58(%ebp),%eax
    3448:	50                   	push   %eax
    3449:	68 60 4d 00 00       	push   $0x4d60
    344e:	6a 01                	push   $0x1
    3450:	e8 7b 06 00 00       	call   3ad0 <printf>
    int fd = open(name, O_CREATE|O_RDWR);
    3455:	58                   	pop    %eax
    3456:	8d 45 a8             	lea    -0x58(%ebp),%eax
    3459:	5a                   	pop    %edx
    345a:	68 02 02 00 00       	push   $0x202
    345f:	50                   	push   %eax
    3460:	e8 53 05 00 00       	call   39b8 <open>
    if(fd < 0){
    3465:	83 c4 10             	add    $0x10,%esp
    3468:	85 c0                	test   %eax,%eax
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    printf(1, "writing %s\n", name);
    int fd = open(name, O_CREATE|O_RDWR);
    346a:	89 c7                	mov    %eax,%edi
    if(fd < 0){
    346c:	78 50                	js     34be <fsfull+0x11e>
    346e:	31 f6                	xor    %esi,%esi
    3470:	eb 08                	jmp    347a <fsfull+0xda>
    3472:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    int total = 0;
    while(1){
      int cc = write(fd, buf, 512);
      if(cc < 512)
        break;
      total += cc;
    3478:	01 c6                	add    %eax,%esi
      printf(1, "open %s failed\n", name);
      break;
    }
    int total = 0;
    while(1){
      int cc = write(fd, buf, 512);
    347a:	83 ec 04             	sub    $0x4,%esp
    347d:	68 00 02 00 00       	push   $0x200
    3482:	68 00 87 00 00       	push   $0x8700
    3487:	57                   	push   %edi
    3488:	e8 0b 05 00 00       	call   3998 <write>
      if(cc < 512)
    348d:	83 c4 10             	add    $0x10,%esp
    3490:	3d ff 01 00 00       	cmp    $0x1ff,%eax
    3495:	7f e1                	jg     3478 <fsfull+0xd8>
        break;
      total += cc;
      fsblocks++;
    }
    printf(1, "wrote %d bytes\n", total);
    3497:	83 ec 04             	sub    $0x4,%esp
    349a:	56                   	push   %esi
    349b:	68 7c 4d 00 00       	push   $0x4d7c
    34a0:	6a 01                	push   $0x1
    34a2:	e8 29 06 00 00       	call   3ad0 <printf>
    close(fd);
    34a7:	89 3c 24             	mov    %edi,(%esp)
    34aa:	e8 f1 04 00 00       	call   39a0 <close>
    if(total == 0)
    34af:	83 c4 10             	add    $0x10,%esp
    34b2:	85 f6                	test   %esi,%esi
    34b4:	74 22                	je     34d8 <fsfull+0x138>
  int nfiles;
  int fsblocks = 0;

  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    34b6:	83 c3 01             	add    $0x1,%ebx
    34b9:	e9 02 ff ff ff       	jmp    33c0 <fsfull+0x20>
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    printf(1, "writing %s\n", name);
    int fd = open(name, O_CREATE|O_RDWR);
    if(fd < 0){
      printf(1, "open %s failed\n", name);
    34be:	8d 45 a8             	lea    -0x58(%ebp),%eax
    34c1:	83 ec 04             	sub    $0x4,%esp
    34c4:	50                   	push   %eax
    34c5:	68 6c 4d 00 00       	push   $0x4d6c
    34ca:	6a 01                	push   $0x1
    34cc:	e8 ff 05 00 00       	call   3ad0 <printf>
      break;
    34d1:	83 c4 10             	add    $0x10,%esp
    34d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  }

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    34d8:	b8 d3 4d 62 10       	mov    $0x10624dd3,%eax
    34dd:	89 de                	mov    %ebx,%esi
    name[2] = '0' + (nfiles % 1000) / 100;
    34df:	89 d9                	mov    %ebx,%ecx
  }

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    34e1:	f7 eb                	imul   %ebx
    34e3:	c1 fe 1f             	sar    $0x1f,%esi
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    34e6:	89 df                	mov    %ebx,%edi
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    unlink(name);
    34e8:	83 ec 0c             	sub    $0xc,%esp
      break;
  }

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    34eb:	c6 45 a8 66          	movb   $0x66,-0x58(%ebp)
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    34ef:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
  }

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    34f3:	c1 fa 06             	sar    $0x6,%edx
    34f6:	29 f2                	sub    %esi,%edx
    34f8:	8d 42 30             	lea    0x30(%edx),%eax
    name[2] = '0' + (nfiles % 1000) / 100;
    34fb:	69 d2 e8 03 00 00    	imul   $0x3e8,%edx,%edx
  }

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    3501:	88 45 a9             	mov    %al,-0x57(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    3504:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    3509:	29 d1                	sub    %edx,%ecx
    350b:	f7 e9                	imul   %ecx
    350d:	c1 f9 1f             	sar    $0x1f,%ecx
    name[3] = '0' + (nfiles % 100) / 10;
    3510:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    3515:	c1 fa 05             	sar    $0x5,%edx
    3518:	29 ca                	sub    %ecx,%edx
    name[3] = '0' + (nfiles % 100) / 10;
    351a:	b9 67 66 66 66       	mov    $0x66666667,%ecx

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    351f:	83 c2 30             	add    $0x30,%edx
    3522:	88 55 aa             	mov    %dl,-0x56(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
    3525:	f7 eb                	imul   %ebx
    3527:	c1 fa 05             	sar    $0x5,%edx
    352a:	29 f2                	sub    %esi,%edx
    352c:	6b d2 64             	imul   $0x64,%edx,%edx
    352f:	29 d7                	sub    %edx,%edi
    3531:	89 f8                	mov    %edi,%eax
    3533:	c1 ff 1f             	sar    $0x1f,%edi
    3536:	f7 e9                	imul   %ecx
    name[4] = '0' + (nfiles % 10);
    3538:	89 d8                	mov    %ebx,%eax
  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    353a:	c1 fa 02             	sar    $0x2,%edx
    353d:	29 fa                	sub    %edi,%edx
    353f:	83 c2 30             	add    $0x30,%edx
    3542:	88 55 ab             	mov    %dl,-0x55(%ebp)
    name[4] = '0' + (nfiles % 10);
    3545:	f7 e9                	imul   %ecx
    3547:	89 d9                	mov    %ebx,%ecx
    name[5] = '\0';
    unlink(name);
    nfiles--;
    3549:	83 eb 01             	sub    $0x1,%ebx
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    name[4] = '0' + (nfiles % 10);
    354c:	c1 fa 02             	sar    $0x2,%edx
    354f:	29 f2                	sub    %esi,%edx
    3551:	8d 04 92             	lea    (%edx,%edx,4),%eax
    3554:	01 c0                	add    %eax,%eax
    3556:	29 c1                	sub    %eax,%ecx
    3558:	89 c8                	mov    %ecx,%eax
    355a:	83 c0 30             	add    $0x30,%eax
    355d:	88 45 ac             	mov    %al,-0x54(%ebp)
    name[5] = '\0';
    unlink(name);
    3560:	8d 45 a8             	lea    -0x58(%ebp),%eax
    3563:	50                   	push   %eax
    3564:	e8 5f 04 00 00       	call   39c8 <unlink>
    close(fd);
    if(total == 0)
      break;
  }

  while(nfiles >= 0){
    3569:	83 c4 10             	add    $0x10,%esp
    356c:	83 fb ff             	cmp    $0xffffffff,%ebx
    356f:	0f 85 63 ff ff ff    	jne    34d8 <fsfull+0x138>
    name[5] = '\0';
    unlink(name);
    nfiles--;
  }

  printf(1, "fsfull test finished\n");
    3575:	83 ec 08             	sub    $0x8,%esp
    3578:	68 8c 4d 00 00       	push   $0x4d8c
    357d:	6a 01                	push   $0x1
    357f:	e8 4c 05 00 00       	call   3ad0 <printf>
}
    3584:	83 c4 10             	add    $0x10,%esp
    3587:	8d 65 f4             	lea    -0xc(%ebp),%esp
    358a:	5b                   	pop    %ebx
    358b:	5e                   	pop    %esi
    358c:	5f                   	pop    %edi
    358d:	5d                   	pop    %ebp
    358e:	c3                   	ret    
    358f:	90                   	nop

00003590 <uio>:

void
uio()
{
    3590:	55                   	push   %ebp
    3591:	89 e5                	mov    %esp,%ebp
    3593:	83 ec 10             	sub    $0x10,%esp

  ushort port = 0;
  uchar val = 0;
  int pid;

  printf(1, "uio test\n");
    3596:	68 a2 4d 00 00       	push   $0x4da2
    359b:	6a 01                	push   $0x1
    359d:	e8 2e 05 00 00       	call   3ad0 <printf>
  pid = fork();
    35a2:	e8 c9 03 00 00       	call   3970 <fork>
  if(pid == 0){
    35a7:	83 c4 10             	add    $0x10,%esp
    35aa:	85 c0                	test   %eax,%eax
    35ac:	74 1b                	je     35c9 <uio+0x39>
    asm volatile("outb %0,%1"::"a"(val), "d" (port));
    port = RTC_DATA;
    asm volatile("inb %1,%0" : "=a" (val) : "d" (port));
    printf(1, "uio: uio succeeded; test FAILED\n");
    exit();
  } else if(pid < 0){
    35ae:	78 3d                	js     35ed <uio+0x5d>
    printf (1, "fork failed\n");
    exit();
  }
  wait();
    35b0:	e8 cb 03 00 00       	call   3980 <wait>
  printf(1, "uio test done\n");
    35b5:	83 ec 08             	sub    $0x8,%esp
    35b8:	68 ac 4d 00 00       	push   $0x4dac
    35bd:	6a 01                	push   $0x1
    35bf:	e8 0c 05 00 00       	call   3ad0 <printf>
}
    35c4:	83 c4 10             	add    $0x10,%esp
    35c7:	c9                   	leave  
    35c8:	c3                   	ret    
  pid = fork();
  if(pid == 0){
    port = RTC_ADDR;
    val = 0x09;  /* year */
    /* http://wiki.osdev.org/Inline_Assembly/Examples */
    asm volatile("outb %0,%1"::"a"(val), "d" (port));
    35c9:	ba 70 00 00 00       	mov    $0x70,%edx
    35ce:	b8 09 00 00 00       	mov    $0x9,%eax
    35d3:	ee                   	out    %al,(%dx)
    port = RTC_DATA;
    asm volatile("inb %1,%0" : "=a" (val) : "d" (port));
    35d4:	ba 71 00 00 00       	mov    $0x71,%edx
    35d9:	ec                   	in     (%dx),%al
    printf(1, "uio: uio succeeded; test FAILED\n");
    35da:	52                   	push   %edx
    35db:	52                   	push   %edx
    35dc:	68 38 55 00 00       	push   $0x5538
    35e1:	6a 01                	push   $0x1
    35e3:	e8 e8 04 00 00       	call   3ad0 <printf>
    exit();
    35e8:	e8 8b 03 00 00       	call   3978 <exit>
  } else if(pid < 0){
    printf (1, "fork failed\n");
    35ed:	50                   	push   %eax
    35ee:	50                   	push   %eax
    35ef:	68 31 4d 00 00       	push   $0x4d31
    35f4:	6a 01                	push   $0x1
    35f6:	e8 d5 04 00 00       	call   3ad0 <printf>
    exit();
    35fb:	e8 78 03 00 00       	call   3978 <exit>

00003600 <argptest>:
  wait();
  printf(1, "uio test done\n");
}

void argptest()
{
    3600:	55                   	push   %ebp
    3601:	89 e5                	mov    %esp,%ebp
    3603:	53                   	push   %ebx
    3604:	83 ec 0c             	sub    $0xc,%esp
  int fd;
  fd = open("init", O_RDONLY);
    3607:	6a 00                	push   $0x0
    3609:	68 bb 4d 00 00       	push   $0x4dbb
    360e:	e8 a5 03 00 00       	call   39b8 <open>
  if (fd < 0) {
    3613:	83 c4 10             	add    $0x10,%esp
    3616:	85 c0                	test   %eax,%eax
    3618:	78 39                	js     3653 <argptest+0x53>
    printf(2, "open failed\n");
    exit();
  }
  read(fd, sbrk(0) - 1, -1);
    361a:	83 ec 0c             	sub    $0xc,%esp
    361d:	89 c3                	mov    %eax,%ebx
    361f:	6a 00                	push   $0x0
    3621:	e8 da 03 00 00       	call   3a00 <sbrk>
    3626:	83 c4 0c             	add    $0xc,%esp
    3629:	83 e8 01             	sub    $0x1,%eax
    362c:	6a ff                	push   $0xffffffff
    362e:	50                   	push   %eax
    362f:	53                   	push   %ebx
    3630:	e8 5b 03 00 00       	call   3990 <read>
  close(fd);
    3635:	89 1c 24             	mov    %ebx,(%esp)
    3638:	e8 63 03 00 00       	call   39a0 <close>
  printf(1, "arg test passed\n");
    363d:	58                   	pop    %eax
    363e:	5a                   	pop    %edx
    363f:	68 cd 4d 00 00       	push   $0x4dcd
    3644:	6a 01                	push   $0x1
    3646:	e8 85 04 00 00       	call   3ad0 <printf>
}
    364b:	83 c4 10             	add    $0x10,%esp
    364e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3651:	c9                   	leave  
    3652:	c3                   	ret    
void argptest()
{
  int fd;
  fd = open("init", O_RDONLY);
  if (fd < 0) {
    printf(2, "open failed\n");
    3653:	51                   	push   %ecx
    3654:	51                   	push   %ecx
    3655:	68 c0 4d 00 00       	push   $0x4dc0
    365a:	6a 02                	push   $0x2
    365c:	e8 6f 04 00 00       	call   3ad0 <printf>
    exit();
    3661:	e8 12 03 00 00       	call   3978 <exit>
    3666:	8d 76 00             	lea    0x0(%esi),%esi
    3669:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003670 <rand>:

unsigned long randstate = 1;
unsigned int
rand()
{
  randstate = randstate * 1664525 + 1013904223;
    3670:	69 05 08 5f 00 00 0d 	imul   $0x19660d,0x5f08,%eax
    3677:	66 19 00 
}

unsigned long randstate = 1;
unsigned int
rand()
{
    367a:	55                   	push   %ebp
    367b:	89 e5                	mov    %esp,%ebp
  randstate = randstate * 1664525 + 1013904223;
  return randstate;
}
    367d:	5d                   	pop    %ebp

unsigned long randstate = 1;
unsigned int
rand()
{
  randstate = randstate * 1664525 + 1013904223;
    367e:	05 5f f3 6e 3c       	add    $0x3c6ef35f,%eax
    3683:	a3 08 5f 00 00       	mov    %eax,0x5f08
  return randstate;
}
    3688:	c3                   	ret    
    3689:	66 90                	xchg   %ax,%ax
    368b:	66 90                	xchg   %ax,%ax
    368d:	66 90                	xchg   %ax,%ax
    368f:	90                   	nop

00003690 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    3690:	55                   	push   %ebp
    3691:	89 e5                	mov    %esp,%ebp
    3693:	53                   	push   %ebx
    3694:	8b 45 08             	mov    0x8(%ebp),%eax
    3697:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    369a:	89 c2                	mov    %eax,%edx
    369c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    36a0:	83 c1 01             	add    $0x1,%ecx
    36a3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    36a7:	83 c2 01             	add    $0x1,%edx
    36aa:	84 db                	test   %bl,%bl
    36ac:	88 5a ff             	mov    %bl,-0x1(%edx)
    36af:	75 ef                	jne    36a0 <strcpy+0x10>
    ;
  return os;
}
    36b1:	5b                   	pop    %ebx
    36b2:	5d                   	pop    %ebp
    36b3:	c3                   	ret    
    36b4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    36ba:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000036c0 <strncpy>:

char* strncpy(char* s, char* t, int n) {
    36c0:	55                   	push   %ebp
  int i = 0;
    36c1:	31 d2                	xor    %edx,%edx
  while((*s++ = *t++) != 0)
    ;
  return os;
}

char* strncpy(char* s, char* t, int n) {
    36c3:	89 e5                	mov    %esp,%ebp
    36c5:	56                   	push   %esi
    36c6:	53                   	push   %ebx
    36c7:	8b 45 08             	mov    0x8(%ebp),%eax
    36ca:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    36cd:	8b 75 10             	mov    0x10(%ebp),%esi
  int i = 0;
  char *os;
  os = s;
  while(((*s++ = *t++) != 0) && (++i < n));
    36d0:	eb 0d                	jmp    36df <strncpy+0x1f>
    36d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    36d8:	83 c2 01             	add    $0x1,%edx
    36db:	39 f2                	cmp    %esi,%edx
    36dd:	7d 0b                	jge    36ea <strncpy+0x2a>
    36df:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
    36e3:	84 c9                	test   %cl,%cl
    36e5:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    36e8:	75 ee                	jne    36d8 <strncpy+0x18>
  return os;
}
    36ea:	5b                   	pop    %ebx
    36eb:	5e                   	pop    %esi
    36ec:	5d                   	pop    %ebp
    36ed:	c3                   	ret    
    36ee:	66 90                	xchg   %ax,%ax

000036f0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    36f0:	55                   	push   %ebp
    36f1:	89 e5                	mov    %esp,%ebp
    36f3:	56                   	push   %esi
    36f4:	53                   	push   %ebx
    36f5:	8b 55 08             	mov    0x8(%ebp),%edx
    36f8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    36fb:	0f b6 02             	movzbl (%edx),%eax
    36fe:	0f b6 19             	movzbl (%ecx),%ebx
    3701:	84 c0                	test   %al,%al
    3703:	75 1e                	jne    3723 <strcmp+0x33>
    3705:	eb 29                	jmp    3730 <strcmp+0x40>
    3707:	89 f6                	mov    %esi,%esi
    3709:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
    3710:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    3713:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    3716:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    3719:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
    371d:	84 c0                	test   %al,%al
    371f:	74 0f                	je     3730 <strcmp+0x40>
    3721:	89 f1                	mov    %esi,%ecx
    3723:	38 d8                	cmp    %bl,%al
    3725:	74 e9                	je     3710 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    3727:	29 d8                	sub    %ebx,%eax
}
    3729:	5b                   	pop    %ebx
    372a:	5e                   	pop    %esi
    372b:	5d                   	pop    %ebp
    372c:	c3                   	ret    
    372d:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    3730:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
    3732:	29 d8                	sub    %ebx,%eax
}
    3734:	5b                   	pop    %ebx
    3735:	5e                   	pop    %esi
    3736:	5d                   	pop    %ebp
    3737:	c3                   	ret    
    3738:	90                   	nop
    3739:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00003740 <strncmp>:

int strncmp(const char *p, const char *q, int n) {
    3740:	55                   	push   %ebp
    3741:	89 e5                	mov    %esp,%ebp
    3743:	57                   	push   %edi
    3744:	56                   	push   %esi
    3745:	53                   	push   %ebx
    3746:	8b 5d 10             	mov    0x10(%ebp),%ebx
    3749:	8b 75 08             	mov    0x8(%ebp),%esi
    374c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  int i = 0;
  while(i < n && *p == *q)
    374f:	85 db                	test   %ebx,%ebx
    3751:	7e 28                	jle    377b <strncmp+0x3b>
    3753:	0f b6 16             	movzbl (%esi),%edx
    3756:	0f b6 0f             	movzbl (%edi),%ecx
    3759:	38 d1                	cmp    %dl,%cl
    375b:	75 2b                	jne    3788 <strncmp+0x48>
    375d:	31 c0                	xor    %eax,%eax
    375f:	eb 13                	jmp    3774 <strncmp+0x34>
    3761:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    3768:	0f b6 14 06          	movzbl (%esi,%eax,1),%edx
    376c:	0f b6 0c 07          	movzbl (%edi,%eax,1),%ecx
    3770:	38 ca                	cmp    %cl,%dl
    3772:	75 14                	jne    3788 <strncmp+0x48>
    p++, q++, i++;
    3774:	83 c0 01             	add    $0x1,%eax
  return (uchar)*p - (uchar)*q;
}

int strncmp(const char *p, const char *q, int n) {
  int i = 0;
  while(i < n && *p == *q)
    3777:	39 c3                	cmp    %eax,%ebx
    3779:	75 ed                	jne    3768 <strncmp+0x28>
    p++, q++, i++;
  if (i < n)
    return (uchar)*p - (uchar)*q;
  else
    return 0;
}
    377b:	5b                   	pop    %ebx
  while(i < n && *p == *q)
    p++, q++, i++;
  if (i < n)
    return (uchar)*p - (uchar)*q;
  else
    return 0;
    377c:	31 c0                	xor    %eax,%eax
}
    377e:	5e                   	pop    %esi
    377f:	5f                   	pop    %edi
    3780:	5d                   	pop    %ebp
    3781:	c3                   	ret    
    3782:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
int strncmp(const char *p, const char *q, int n) {
  int i = 0;
  while(i < n && *p == *q)
    p++, q++, i++;
  if (i < n)
    return (uchar)*p - (uchar)*q;
    3788:	0f b6 c2             	movzbl %dl,%eax
  else
    return 0;
}
    378b:	5b                   	pop    %ebx
int strncmp(const char *p, const char *q, int n) {
  int i = 0;
  while(i < n && *p == *q)
    p++, q++, i++;
  if (i < n)
    return (uchar)*p - (uchar)*q;
    378c:	29 c8                	sub    %ecx,%eax
  else
    return 0;
}
    378e:	5e                   	pop    %esi
    378f:	5f                   	pop    %edi
    3790:	5d                   	pop    %ebp
    3791:	c3                   	ret    
    3792:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    3799:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000037a0 <strlen>:

uint
strlen(char *s)
{
    37a0:	55                   	push   %ebp
    37a1:	89 e5                	mov    %esp,%ebp
    37a3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    37a6:	80 39 00             	cmpb   $0x0,(%ecx)
    37a9:	74 12                	je     37bd <strlen+0x1d>
    37ab:	31 d2                	xor    %edx,%edx
    37ad:	8d 76 00             	lea    0x0(%esi),%esi
    37b0:	83 c2 01             	add    $0x1,%edx
    37b3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    37b7:	89 d0                	mov    %edx,%eax
    37b9:	75 f5                	jne    37b0 <strlen+0x10>
    ;
  return n;
}
    37bb:	5d                   	pop    %ebp
    37bc:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
    37bd:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
    37bf:	5d                   	pop    %ebp
    37c0:	c3                   	ret    
    37c1:	eb 0d                	jmp    37d0 <memset>
    37c3:	90                   	nop
    37c4:	90                   	nop
    37c5:	90                   	nop
    37c6:	90                   	nop
    37c7:	90                   	nop
    37c8:	90                   	nop
    37c9:	90                   	nop
    37ca:	90                   	nop
    37cb:	90                   	nop
    37cc:	90                   	nop
    37cd:	90                   	nop
    37ce:	90                   	nop
    37cf:	90                   	nop

000037d0 <memset>:

void*
memset(void *dst, int c, uint n)
{
    37d0:	55                   	push   %ebp
    37d1:	89 e5                	mov    %esp,%ebp
    37d3:	57                   	push   %edi
    37d4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    37d7:	8b 4d 10             	mov    0x10(%ebp),%ecx
    37da:	8b 45 0c             	mov    0xc(%ebp),%eax
    37dd:	89 d7                	mov    %edx,%edi
    37df:	fc                   	cld    
    37e0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    37e2:	89 d0                	mov    %edx,%eax
    37e4:	5f                   	pop    %edi
    37e5:	5d                   	pop    %ebp
    37e6:	c3                   	ret    
    37e7:	89 f6                	mov    %esi,%esi
    37e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000037f0 <strchr>:

char*
strchr(const char *s, char c)
{
    37f0:	55                   	push   %ebp
    37f1:	89 e5                	mov    %esp,%ebp
    37f3:	53                   	push   %ebx
    37f4:	8b 45 08             	mov    0x8(%ebp),%eax
    37f7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
    37fa:	0f b6 10             	movzbl (%eax),%edx
    37fd:	84 d2                	test   %dl,%dl
    37ff:	74 1d                	je     381e <strchr+0x2e>
    if(*s == c)
    3801:	38 d3                	cmp    %dl,%bl
    3803:	89 d9                	mov    %ebx,%ecx
    3805:	75 0d                	jne    3814 <strchr+0x24>
    3807:	eb 17                	jmp    3820 <strchr+0x30>
    3809:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    3810:	38 ca                	cmp    %cl,%dl
    3812:	74 0c                	je     3820 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    3814:	83 c0 01             	add    $0x1,%eax
    3817:	0f b6 10             	movzbl (%eax),%edx
    381a:	84 d2                	test   %dl,%dl
    381c:	75 f2                	jne    3810 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
    381e:	31 c0                	xor    %eax,%eax
}
    3820:	5b                   	pop    %ebx
    3821:	5d                   	pop    %ebp
    3822:	c3                   	ret    
    3823:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    3829:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003830 <gets>:

char*
gets(char *buf, int max)
{
    3830:	55                   	push   %ebp
    3831:	89 e5                	mov    %esp,%ebp
    3833:	57                   	push   %edi
    3834:	56                   	push   %esi
    3835:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    3836:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
    3838:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
    383b:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    383e:	eb 29                	jmp    3869 <gets+0x39>
    cc = read(0, &c, 1);
    3840:	83 ec 04             	sub    $0x4,%esp
    3843:	6a 01                	push   $0x1
    3845:	57                   	push   %edi
    3846:	6a 00                	push   $0x0
    3848:	e8 43 01 00 00       	call   3990 <read>
    if(cc < 1)
    384d:	83 c4 10             	add    $0x10,%esp
    3850:	85 c0                	test   %eax,%eax
    3852:	7e 1d                	jle    3871 <gets+0x41>
      break;
    buf[i++] = c;
    3854:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    3858:	8b 55 08             	mov    0x8(%ebp),%edx
    385b:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
    385d:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    385f:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    3863:	74 1b                	je     3880 <gets+0x50>
    3865:	3c 0d                	cmp    $0xd,%al
    3867:	74 17                	je     3880 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    3869:	8d 5e 01             	lea    0x1(%esi),%ebx
    386c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    386f:	7c cf                	jl     3840 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    3871:	8b 45 08             	mov    0x8(%ebp),%eax
    3874:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    3878:	8d 65 f4             	lea    -0xc(%ebp),%esp
    387b:	5b                   	pop    %ebx
    387c:	5e                   	pop    %esi
    387d:	5f                   	pop    %edi
    387e:	5d                   	pop    %ebp
    387f:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    3880:	8b 45 08             	mov    0x8(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    3883:	89 de                	mov    %ebx,%esi
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    3885:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    3889:	8d 65 f4             	lea    -0xc(%ebp),%esp
    388c:	5b                   	pop    %ebx
    388d:	5e                   	pop    %esi
    388e:	5f                   	pop    %edi
    388f:	5d                   	pop    %ebp
    3890:	c3                   	ret    
    3891:	eb 0d                	jmp    38a0 <stat>
    3893:	90                   	nop
    3894:	90                   	nop
    3895:	90                   	nop
    3896:	90                   	nop
    3897:	90                   	nop
    3898:	90                   	nop
    3899:	90                   	nop
    389a:	90                   	nop
    389b:	90                   	nop
    389c:	90                   	nop
    389d:	90                   	nop
    389e:	90                   	nop
    389f:	90                   	nop

000038a0 <stat>:

int
stat(char *n, struct stat *st)
{
    38a0:	55                   	push   %ebp
    38a1:	89 e5                	mov    %esp,%ebp
    38a3:	56                   	push   %esi
    38a4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    38a5:	83 ec 08             	sub    $0x8,%esp
    38a8:	6a 00                	push   $0x0
    38aa:	ff 75 08             	pushl  0x8(%ebp)
    38ad:	e8 06 01 00 00       	call   39b8 <open>
  if(fd < 0)
    38b2:	83 c4 10             	add    $0x10,%esp
    38b5:	85 c0                	test   %eax,%eax
    38b7:	78 27                	js     38e0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    38b9:	83 ec 08             	sub    $0x8,%esp
    38bc:	ff 75 0c             	pushl  0xc(%ebp)
    38bf:	89 c3                	mov    %eax,%ebx
    38c1:	50                   	push   %eax
    38c2:	e8 09 01 00 00       	call   39d0 <fstat>
  close(fd);
    38c7:	89 1c 24             	mov    %ebx,(%esp)
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
  r = fstat(fd, st);
    38ca:	89 c6                	mov    %eax,%esi
  close(fd);
    38cc:	e8 cf 00 00 00       	call   39a0 <close>
  return r;
    38d1:	83 c4 10             	add    $0x10,%esp
}
    38d4:	8d 65 f8             	lea    -0x8(%ebp),%esp
    38d7:	89 f0                	mov    %esi,%eax
    38d9:	5b                   	pop    %ebx
    38da:	5e                   	pop    %esi
    38db:	5d                   	pop    %ebp
    38dc:	c3                   	ret    
    38dd:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
    38e0:	be ff ff ff ff       	mov    $0xffffffff,%esi
    38e5:	eb ed                	jmp    38d4 <stat+0x34>
    38e7:	89 f6                	mov    %esi,%esi
    38e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000038f0 <atoi>:
  return r;
}

int
atoi(const char *s)
{
    38f0:	55                   	push   %ebp
    38f1:	89 e5                	mov    %esp,%ebp
    38f3:	53                   	push   %ebx
    38f4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    38f7:	0f be 11             	movsbl (%ecx),%edx
    38fa:	8d 42 d0             	lea    -0x30(%edx),%eax
    38fd:	3c 09                	cmp    $0x9,%al
    38ff:	b8 00 00 00 00       	mov    $0x0,%eax
    3904:	77 1f                	ja     3925 <atoi+0x35>
    3906:	8d 76 00             	lea    0x0(%esi),%esi
    3909:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
    3910:	8d 04 80             	lea    (%eax,%eax,4),%eax
    3913:	83 c1 01             	add    $0x1,%ecx
    3916:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    391a:	0f be 11             	movsbl (%ecx),%edx
    391d:	8d 5a d0             	lea    -0x30(%edx),%ebx
    3920:	80 fb 09             	cmp    $0x9,%bl
    3923:	76 eb                	jbe    3910 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
    3925:	5b                   	pop    %ebx
    3926:	5d                   	pop    %ebp
    3927:	c3                   	ret    
    3928:	90                   	nop
    3929:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00003930 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    3930:	55                   	push   %ebp
    3931:	89 e5                	mov    %esp,%ebp
    3933:	56                   	push   %esi
    3934:	53                   	push   %ebx
    3935:	8b 5d 10             	mov    0x10(%ebp),%ebx
    3938:	8b 45 08             	mov    0x8(%ebp),%eax
    393b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    393e:	85 db                	test   %ebx,%ebx
    3940:	7e 14                	jle    3956 <memmove+0x26>
    3942:	31 d2                	xor    %edx,%edx
    3944:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    3948:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    394c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    394f:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    3952:	39 da                	cmp    %ebx,%edx
    3954:	75 f2                	jne    3948 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
    3956:	5b                   	pop    %ebx
    3957:	5e                   	pop    %esi
    3958:	5d                   	pop    %ebp
    3959:	c3                   	ret    
    395a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00003960 <max>:

int max(int a, int b) {
    3960:	55                   	push   %ebp
    3961:	89 e5                	mov    %esp,%ebp
    3963:	8b 55 08             	mov    0x8(%ebp),%edx
    3966:	8b 45 0c             	mov    0xc(%ebp),%eax
  if (b > a) return b;
  else return a;
}
    3969:	5d                   	pop    %ebp
    396a:	39 d0                	cmp    %edx,%eax
    396c:	0f 4c c2             	cmovl  %edx,%eax
    396f:	c3                   	ret    

00003970 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    3970:	b8 01 00 00 00       	mov    $0x1,%eax
    3975:	cd 40                	int    $0x40
    3977:	c3                   	ret    

00003978 <exit>:
SYSCALL(exit)
    3978:	b8 02 00 00 00       	mov    $0x2,%eax
    397d:	cd 40                	int    $0x40
    397f:	c3                   	ret    

00003980 <wait>:
SYSCALL(wait)
    3980:	b8 03 00 00 00       	mov    $0x3,%eax
    3985:	cd 40                	int    $0x40
    3987:	c3                   	ret    

00003988 <pipe>:
SYSCALL(pipe)
    3988:	b8 04 00 00 00       	mov    $0x4,%eax
    398d:	cd 40                	int    $0x40
    398f:	c3                   	ret    

00003990 <read>:
SYSCALL(read)
    3990:	b8 05 00 00 00       	mov    $0x5,%eax
    3995:	cd 40                	int    $0x40
    3997:	c3                   	ret    

00003998 <write>:
SYSCALL(write)
    3998:	b8 10 00 00 00       	mov    $0x10,%eax
    399d:	cd 40                	int    $0x40
    399f:	c3                   	ret    

000039a0 <close>:
SYSCALL(close)
    39a0:	b8 15 00 00 00       	mov    $0x15,%eax
    39a5:	cd 40                	int    $0x40
    39a7:	c3                   	ret    

000039a8 <kill>:
SYSCALL(kill)
    39a8:	b8 06 00 00 00       	mov    $0x6,%eax
    39ad:	cd 40                	int    $0x40
    39af:	c3                   	ret    

000039b0 <exec>:
SYSCALL(exec)
    39b0:	b8 07 00 00 00       	mov    $0x7,%eax
    39b5:	cd 40                	int    $0x40
    39b7:	c3                   	ret    

000039b8 <open>:
SYSCALL(open)
    39b8:	b8 0f 00 00 00       	mov    $0xf,%eax
    39bd:	cd 40                	int    $0x40
    39bf:	c3                   	ret    

000039c0 <mknod>:
SYSCALL(mknod)
    39c0:	b8 11 00 00 00       	mov    $0x11,%eax
    39c5:	cd 40                	int    $0x40
    39c7:	c3                   	ret    

000039c8 <unlink>:
SYSCALL(unlink)
    39c8:	b8 12 00 00 00       	mov    $0x12,%eax
    39cd:	cd 40                	int    $0x40
    39cf:	c3                   	ret    

000039d0 <fstat>:
SYSCALL(fstat)
    39d0:	b8 08 00 00 00       	mov    $0x8,%eax
    39d5:	cd 40                	int    $0x40
    39d7:	c3                   	ret    

000039d8 <link>:
SYSCALL(link)
    39d8:	b8 13 00 00 00       	mov    $0x13,%eax
    39dd:	cd 40                	int    $0x40
    39df:	c3                   	ret    

000039e0 <mkdir>:
SYSCALL(mkdir)
    39e0:	b8 14 00 00 00       	mov    $0x14,%eax
    39e5:	cd 40                	int    $0x40
    39e7:	c3                   	ret    

000039e8 <chdir>:
SYSCALL(chdir)
    39e8:	b8 09 00 00 00       	mov    $0x9,%eax
    39ed:	cd 40                	int    $0x40
    39ef:	c3                   	ret    

000039f0 <dup>:
SYSCALL(dup)
    39f0:	b8 0a 00 00 00       	mov    $0xa,%eax
    39f5:	cd 40                	int    $0x40
    39f7:	c3                   	ret    

000039f8 <getpid>:
SYSCALL(getpid)
    39f8:	b8 0b 00 00 00       	mov    $0xb,%eax
    39fd:	cd 40                	int    $0x40
    39ff:	c3                   	ret    

00003a00 <sbrk>:
SYSCALL(sbrk)
    3a00:	b8 0c 00 00 00       	mov    $0xc,%eax
    3a05:	cd 40                	int    $0x40
    3a07:	c3                   	ret    

00003a08 <sleep>:
SYSCALL(sleep)
    3a08:	b8 0d 00 00 00       	mov    $0xd,%eax
    3a0d:	cd 40                	int    $0x40
    3a0f:	c3                   	ret    

00003a10 <uptime>:
SYSCALL(uptime)
    3a10:	b8 0e 00 00 00       	mov    $0xe,%eax
    3a15:	cd 40                	int    $0x40
    3a17:	c3                   	ret    

00003a18 <setVariable>:
SYSCALL(setVariable)
    3a18:	b8 17 00 00 00       	mov    $0x17,%eax
    3a1d:	cd 40                	int    $0x40
    3a1f:	c3                   	ret    

00003a20 <getVariable>:
SYSCALL(getVariable)
    3a20:	b8 18 00 00 00       	mov    $0x18,%eax
    3a25:	cd 40                	int    $0x40
    3a27:	c3                   	ret    

00003a28 <remVariable>:
SYSCALL(remVariable)
    3a28:	b8 19 00 00 00       	mov    $0x19,%eax
    3a2d:	cd 40                	int    $0x40
    3a2f:	c3                   	ret    

00003a30 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    3a30:	55                   	push   %ebp
    3a31:	89 e5                	mov    %esp,%ebp
    3a33:	57                   	push   %edi
    3a34:	56                   	push   %esi
    3a35:	53                   	push   %ebx
    3a36:	89 c6                	mov    %eax,%esi
    3a38:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    3a3b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    3a3e:	85 db                	test   %ebx,%ebx
    3a40:	74 7e                	je     3ac0 <printint+0x90>
    3a42:	89 d0                	mov    %edx,%eax
    3a44:	c1 e8 1f             	shr    $0x1f,%eax
    3a47:	84 c0                	test   %al,%al
    3a49:	74 75                	je     3ac0 <printint+0x90>
    neg = 1;
    x = -xx;
    3a4b:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    3a4d:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
    3a54:	f7 d8                	neg    %eax
    3a56:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    3a59:	31 ff                	xor    %edi,%edi
    3a5b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    3a5e:	89 ce                	mov    %ecx,%esi
    3a60:	eb 08                	jmp    3a6a <printint+0x3a>
    3a62:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    3a68:	89 cf                	mov    %ecx,%edi
    3a6a:	31 d2                	xor    %edx,%edx
    3a6c:	8d 4f 01             	lea    0x1(%edi),%ecx
    3a6f:	f7 f6                	div    %esi
    3a71:	0f b6 92 90 55 00 00 	movzbl 0x5590(%edx),%edx
  }while((x /= base) != 0);
    3a78:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
    3a7a:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
    3a7d:	75 e9                	jne    3a68 <printint+0x38>
  if(neg)
    3a7f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    3a82:	8b 75 c0             	mov    -0x40(%ebp),%esi
    3a85:	85 c0                	test   %eax,%eax
    3a87:	74 08                	je     3a91 <printint+0x61>
    buf[i++] = '-';
    3a89:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
    3a8e:	8d 4f 02             	lea    0x2(%edi),%ecx

  while(--i >= 0)
    3a91:	8d 79 ff             	lea    -0x1(%ecx),%edi
    3a94:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    3a98:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3a9d:	83 ec 04             	sub    $0x4,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    3aa0:	83 ef 01             	sub    $0x1,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3aa3:	6a 01                	push   $0x1
    3aa5:	53                   	push   %ebx
    3aa6:	56                   	push   %esi
    3aa7:	88 45 d7             	mov    %al,-0x29(%ebp)
    3aaa:	e8 e9 fe ff ff       	call   3998 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    3aaf:	83 c4 10             	add    $0x10,%esp
    3ab2:	83 ff ff             	cmp    $0xffffffff,%edi
    3ab5:	75 e1                	jne    3a98 <printint+0x68>
    putc(fd, buf[i]);
}
    3ab7:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3aba:	5b                   	pop    %ebx
    3abb:	5e                   	pop    %esi
    3abc:	5f                   	pop    %edi
    3abd:	5d                   	pop    %ebp
    3abe:	c3                   	ret    
    3abf:	90                   	nop
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    3ac0:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    3ac2:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    3ac9:	eb 8b                	jmp    3a56 <printint+0x26>
    3acb:	90                   	nop
    3acc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00003ad0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    3ad0:	55                   	push   %ebp
    3ad1:	89 e5                	mov    %esp,%ebp
    3ad3:	57                   	push   %edi
    3ad4:	56                   	push   %esi
    3ad5:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    3ad6:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    3ad9:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    3adc:	8b 75 0c             	mov    0xc(%ebp),%esi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    3adf:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    3ae2:	89 45 d0             	mov    %eax,-0x30(%ebp)
    3ae5:	0f b6 1e             	movzbl (%esi),%ebx
    3ae8:	83 c6 01             	add    $0x1,%esi
    3aeb:	84 db                	test   %bl,%bl
    3aed:	0f 84 b0 00 00 00    	je     3ba3 <printf+0xd3>
    3af3:	31 d2                	xor    %edx,%edx
    3af5:	eb 39                	jmp    3b30 <printf+0x60>
    3af7:	89 f6                	mov    %esi,%esi
    3af9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    3b00:	83 f8 25             	cmp    $0x25,%eax
    3b03:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
    3b06:	ba 25 00 00 00       	mov    $0x25,%edx
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    3b0b:	74 18                	je     3b25 <printf+0x55>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3b0d:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    3b10:	83 ec 04             	sub    $0x4,%esp
    3b13:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    3b16:	6a 01                	push   $0x1
    3b18:	50                   	push   %eax
    3b19:	57                   	push   %edi
    3b1a:	e8 79 fe ff ff       	call   3998 <write>
    3b1f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    3b22:	83 c4 10             	add    $0x10,%esp
    3b25:	83 c6 01             	add    $0x1,%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    3b28:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    3b2c:	84 db                	test   %bl,%bl
    3b2e:	74 73                	je     3ba3 <printf+0xd3>
    c = fmt[i] & 0xff;
    if(state == 0){
    3b30:	85 d2                	test   %edx,%edx
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    3b32:	0f be cb             	movsbl %bl,%ecx
    3b35:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    3b38:	74 c6                	je     3b00 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    3b3a:	83 fa 25             	cmp    $0x25,%edx
    3b3d:	75 e6                	jne    3b25 <printf+0x55>
      if(c == 'd'){
    3b3f:	83 f8 64             	cmp    $0x64,%eax
    3b42:	0f 84 f8 00 00 00    	je     3c40 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    3b48:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    3b4e:	83 f9 70             	cmp    $0x70,%ecx
    3b51:	74 5d                	je     3bb0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    3b53:	83 f8 73             	cmp    $0x73,%eax
    3b56:	0f 84 84 00 00 00    	je     3be0 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    3b5c:	83 f8 63             	cmp    $0x63,%eax
    3b5f:	0f 84 ea 00 00 00    	je     3c4f <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    3b65:	83 f8 25             	cmp    $0x25,%eax
    3b68:	0f 84 c2 00 00 00    	je     3c30 <printf+0x160>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3b6e:	8d 45 e7             	lea    -0x19(%ebp),%eax
    3b71:	83 ec 04             	sub    $0x4,%esp
    3b74:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    3b78:	6a 01                	push   $0x1
    3b7a:	50                   	push   %eax
    3b7b:	57                   	push   %edi
    3b7c:	e8 17 fe ff ff       	call   3998 <write>
    3b81:	83 c4 0c             	add    $0xc,%esp
    3b84:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    3b87:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    3b8a:	6a 01                	push   $0x1
    3b8c:	50                   	push   %eax
    3b8d:	57                   	push   %edi
    3b8e:	83 c6 01             	add    $0x1,%esi
    3b91:	e8 02 fe ff ff       	call   3998 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    3b96:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3b9a:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    3b9d:	31 d2                	xor    %edx,%edx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    3b9f:	84 db                	test   %bl,%bl
    3ba1:	75 8d                	jne    3b30 <printf+0x60>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    3ba3:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3ba6:	5b                   	pop    %ebx
    3ba7:	5e                   	pop    %esi
    3ba8:	5f                   	pop    %edi
    3ba9:	5d                   	pop    %ebp
    3baa:	c3                   	ret    
    3bab:	90                   	nop
    3bac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
    3bb0:	83 ec 0c             	sub    $0xc,%esp
    3bb3:	b9 10 00 00 00       	mov    $0x10,%ecx
    3bb8:	6a 00                	push   $0x0
    3bba:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    3bbd:	89 f8                	mov    %edi,%eax
    3bbf:	8b 13                	mov    (%ebx),%edx
    3bc1:	e8 6a fe ff ff       	call   3a30 <printint>
        ap++;
    3bc6:	89 d8                	mov    %ebx,%eax
    3bc8:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    3bcb:	31 d2                	xor    %edx,%edx
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
    3bcd:	83 c0 04             	add    $0x4,%eax
    3bd0:	89 45 d0             	mov    %eax,-0x30(%ebp)
    3bd3:	e9 4d ff ff ff       	jmp    3b25 <printf+0x55>
    3bd8:	90                   	nop
    3bd9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
    3be0:	8b 45 d0             	mov    -0x30(%ebp),%eax
    3be3:	8b 18                	mov    (%eax),%ebx
        ap++;
    3be5:	83 c0 04             	add    $0x4,%eax
    3be8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    3beb:	85 db                	test   %ebx,%ebx
    3bed:	74 7c                	je     3c6b <printf+0x19b>
          s = "(null)";
        while(*s != 0){
    3bef:	0f b6 03             	movzbl (%ebx),%eax
    3bf2:	84 c0                	test   %al,%al
    3bf4:	74 29                	je     3c1f <printf+0x14f>
    3bf6:	8d 76 00             	lea    0x0(%esi),%esi
    3bf9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    3c00:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3c03:	8d 45 e3             	lea    -0x1d(%ebp),%eax
    3c06:	83 ec 04             	sub    $0x4,%esp
    3c09:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
    3c0b:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3c0e:	50                   	push   %eax
    3c0f:	57                   	push   %edi
    3c10:	e8 83 fd ff ff       	call   3998 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    3c15:	0f b6 03             	movzbl (%ebx),%eax
    3c18:	83 c4 10             	add    $0x10,%esp
    3c1b:	84 c0                	test   %al,%al
    3c1d:	75 e1                	jne    3c00 <printf+0x130>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    3c1f:	31 d2                	xor    %edx,%edx
    3c21:	e9 ff fe ff ff       	jmp    3b25 <printf+0x55>
    3c26:	8d 76 00             	lea    0x0(%esi),%esi
    3c29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3c30:	83 ec 04             	sub    $0x4,%esp
    3c33:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    3c36:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    3c39:	6a 01                	push   $0x1
    3c3b:	e9 4c ff ff ff       	jmp    3b8c <printf+0xbc>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
    3c40:	83 ec 0c             	sub    $0xc,%esp
    3c43:	b9 0a 00 00 00       	mov    $0xa,%ecx
    3c48:	6a 01                	push   $0x1
    3c4a:	e9 6b ff ff ff       	jmp    3bba <printf+0xea>
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
    3c4f:	8b 5d d0             	mov    -0x30(%ebp),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3c52:	83 ec 04             	sub    $0x4,%esp
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
    3c55:	8b 03                	mov    (%ebx),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3c57:	6a 01                	push   $0x1
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
    3c59:	88 45 e4             	mov    %al,-0x1c(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3c5c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    3c5f:	50                   	push   %eax
    3c60:	57                   	push   %edi
    3c61:	e8 32 fd ff ff       	call   3998 <write>
    3c66:	e9 5b ff ff ff       	jmp    3bc6 <printf+0xf6>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    3c6b:	b8 28 00 00 00       	mov    $0x28,%eax
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
    3c70:	bb 88 55 00 00       	mov    $0x5588,%ebx
    3c75:	eb 89                	jmp    3c00 <printf+0x130>
    3c77:	66 90                	xchg   %ax,%ax
    3c79:	66 90                	xchg   %ax,%ax
    3c7b:	66 90                	xchg   %ax,%ax
    3c7d:	66 90                	xchg   %ax,%ax
    3c7f:	90                   	nop

00003c80 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    3c80:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3c81:	a1 c0 5f 00 00       	mov    0x5fc0,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
    3c86:	89 e5                	mov    %esp,%ebp
    3c88:	57                   	push   %edi
    3c89:	56                   	push   %esi
    3c8a:	53                   	push   %ebx
    3c8b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    3c8e:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
    3c90:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3c93:	39 c8                	cmp    %ecx,%eax
    3c95:	73 19                	jae    3cb0 <free+0x30>
    3c97:	89 f6                	mov    %esi,%esi
    3c99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    3ca0:	39 d1                	cmp    %edx,%ecx
    3ca2:	72 1c                	jb     3cc0 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    3ca4:	39 d0                	cmp    %edx,%eax
    3ca6:	73 18                	jae    3cc0 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
    3ca8:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3caa:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    3cac:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3cae:	72 f0                	jb     3ca0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    3cb0:	39 d0                	cmp    %edx,%eax
    3cb2:	72 f4                	jb     3ca8 <free+0x28>
    3cb4:	39 d1                	cmp    %edx,%ecx
    3cb6:	73 f0                	jae    3ca8 <free+0x28>
    3cb8:	90                   	nop
    3cb9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
    3cc0:	8b 73 fc             	mov    -0x4(%ebx),%esi
    3cc3:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    3cc6:	39 fa                	cmp    %edi,%edx
    3cc8:	74 19                	je     3ce3 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    3cca:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    3ccd:	8b 50 04             	mov    0x4(%eax),%edx
    3cd0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    3cd3:	39 f1                	cmp    %esi,%ecx
    3cd5:	74 23                	je     3cfa <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    3cd7:	89 08                	mov    %ecx,(%eax)
  freep = p;
    3cd9:	a3 c0 5f 00 00       	mov    %eax,0x5fc0
}
    3cde:	5b                   	pop    %ebx
    3cdf:	5e                   	pop    %esi
    3ce0:	5f                   	pop    %edi
    3ce1:	5d                   	pop    %ebp
    3ce2:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
    3ce3:	03 72 04             	add    0x4(%edx),%esi
    3ce6:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    3ce9:	8b 10                	mov    (%eax),%edx
    3ceb:	8b 12                	mov    (%edx),%edx
    3ced:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    3cf0:	8b 50 04             	mov    0x4(%eax),%edx
    3cf3:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    3cf6:	39 f1                	cmp    %esi,%ecx
    3cf8:	75 dd                	jne    3cd7 <free+0x57>
    p->s.size += bp->s.size;
    3cfa:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
    3cfd:	a3 c0 5f 00 00       	mov    %eax,0x5fc0
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    3d02:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    3d05:	8b 53 f8             	mov    -0x8(%ebx),%edx
    3d08:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
    3d0a:	5b                   	pop    %ebx
    3d0b:	5e                   	pop    %esi
    3d0c:	5f                   	pop    %edi
    3d0d:	5d                   	pop    %ebp
    3d0e:	c3                   	ret    
    3d0f:	90                   	nop

00003d10 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    3d10:	55                   	push   %ebp
    3d11:	89 e5                	mov    %esp,%ebp
    3d13:	57                   	push   %edi
    3d14:	56                   	push   %esi
    3d15:	53                   	push   %ebx
    3d16:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    3d19:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    3d1c:	8b 15 c0 5f 00 00    	mov    0x5fc0,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    3d22:	8d 78 07             	lea    0x7(%eax),%edi
    3d25:	c1 ef 03             	shr    $0x3,%edi
    3d28:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    3d2b:	85 d2                	test   %edx,%edx
    3d2d:	0f 84 93 00 00 00    	je     3dc6 <malloc+0xb6>
    3d33:	8b 02                	mov    (%edx),%eax
    3d35:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    3d38:	39 cf                	cmp    %ecx,%edi
    3d3a:	76 64                	jbe    3da0 <malloc+0x90>
    3d3c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    3d42:	bb 00 10 00 00       	mov    $0x1000,%ebx
    3d47:	0f 43 df             	cmovae %edi,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
    3d4a:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    3d51:	eb 0e                	jmp    3d61 <malloc+0x51>
    3d53:	90                   	nop
    3d54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    3d58:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    3d5a:	8b 48 04             	mov    0x4(%eax),%ecx
    3d5d:	39 cf                	cmp    %ecx,%edi
    3d5f:	76 3f                	jbe    3da0 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    3d61:	39 05 c0 5f 00 00    	cmp    %eax,0x5fc0
    3d67:	89 c2                	mov    %eax,%edx
    3d69:	75 ed                	jne    3d58 <malloc+0x48>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
    3d6b:	83 ec 0c             	sub    $0xc,%esp
    3d6e:	56                   	push   %esi
    3d6f:	e8 8c fc ff ff       	call   3a00 <sbrk>
  if(p == (char*)-1)
    3d74:	83 c4 10             	add    $0x10,%esp
    3d77:	83 f8 ff             	cmp    $0xffffffff,%eax
    3d7a:	74 1c                	je     3d98 <malloc+0x88>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
    3d7c:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    3d7f:	83 ec 0c             	sub    $0xc,%esp
    3d82:	83 c0 08             	add    $0x8,%eax
    3d85:	50                   	push   %eax
    3d86:	e8 f5 fe ff ff       	call   3c80 <free>
  return freep;
    3d8b:	8b 15 c0 5f 00 00    	mov    0x5fc0,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
    3d91:	83 c4 10             	add    $0x10,%esp
    3d94:	85 d2                	test   %edx,%edx
    3d96:	75 c0                	jne    3d58 <malloc+0x48>
        return 0;
    3d98:	31 c0                	xor    %eax,%eax
    3d9a:	eb 1c                	jmp    3db8 <malloc+0xa8>
    3d9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
    3da0:	39 cf                	cmp    %ecx,%edi
    3da2:	74 1c                	je     3dc0 <malloc+0xb0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
    3da4:	29 f9                	sub    %edi,%ecx
    3da6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    3da9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    3dac:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
    3daf:	89 15 c0 5f 00 00    	mov    %edx,0x5fc0
      return (void*)(p + 1);
    3db5:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
    3db8:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3dbb:	5b                   	pop    %ebx
    3dbc:	5e                   	pop    %esi
    3dbd:	5f                   	pop    %edi
    3dbe:	5d                   	pop    %ebp
    3dbf:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
    3dc0:	8b 08                	mov    (%eax),%ecx
    3dc2:	89 0a                	mov    %ecx,(%edx)
    3dc4:	eb e9                	jmp    3daf <malloc+0x9f>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    3dc6:	c7 05 c0 5f 00 00 c4 	movl   $0x5fc4,0x5fc0
    3dcd:	5f 00 00 
    3dd0:	c7 05 c4 5f 00 00 c4 	movl   $0x5fc4,0x5fc4
    3dd7:	5f 00 00 
    base.s.size = 0;
    3dda:	b8 c4 5f 00 00       	mov    $0x5fc4,%eax
    3ddf:	c7 05 c8 5f 00 00 00 	movl   $0x0,0x5fc8
    3de6:	00 00 00 
    3de9:	e9 4e ff ff ff       	jmp    3d3c <malloc+0x2c>
