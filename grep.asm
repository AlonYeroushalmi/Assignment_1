
_grep:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  }
}

int
main(int argc, char *argv[])
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
  11:	83 ec 18             	sub    $0x18,%esp
  14:	8b 01                	mov    (%ecx),%eax
  16:	8b 59 04             	mov    0x4(%ecx),%ebx
  int fd, i;
  char *pattern;

  if(argc <= 1){
  19:	83 f8 01             	cmp    $0x1,%eax
  }
}

int
main(int argc, char *argv[])
{
  1c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  int fd, i;
  char *pattern;

  if(argc <= 1){
  1f:	7e 76                	jle    97 <main+0x97>
    printf(2, "usage: grep pattern [file ...]\n");
    exit();
  }
  pattern = argv[1];
  21:	8b 43 04             	mov    0x4(%ebx),%eax
  24:	83 c3 08             	add    $0x8,%ebx

  if(argc <= 2){
  27:	83 7d e4 02          	cmpl   $0x2,-0x1c(%ebp)
  2b:	be 02 00 00 00       	mov    $0x2,%esi

  if(argc <= 1){
    printf(2, "usage: grep pattern [file ...]\n");
    exit();
  }
  pattern = argv[1];
  30:	89 45 e0             	mov    %eax,-0x20(%ebp)

  if(argc <= 2){
  33:	74 53                	je     88 <main+0x88>
  35:	8d 76 00             	lea    0x0(%esi),%esi
    grep(pattern, 0);
    exit();
  }

  for(i = 2; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
  38:	83 ec 08             	sub    $0x8,%esp
  3b:	6a 00                	push   $0x0
  3d:	ff 33                	pushl  (%ebx)
  3f:	e8 04 06 00 00       	call   648 <open>
  44:	83 c4 10             	add    $0x10,%esp
  47:	85 c0                	test   %eax,%eax
  49:	89 c7                	mov    %eax,%edi
  4b:	78 27                	js     74 <main+0x74>
      printf(1, "grep: cannot open %s\n", argv[i]);
      exit();
    }
    grep(pattern, fd);
  4d:	83 ec 08             	sub    $0x8,%esp
  if(argc <= 2){
    grep(pattern, 0);
    exit();
  }

  for(i = 2; i < argc; i++){
  50:	83 c6 01             	add    $0x1,%esi
  53:	83 c3 04             	add    $0x4,%ebx
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "grep: cannot open %s\n", argv[i]);
      exit();
    }
    grep(pattern, fd);
  56:	50                   	push   %eax
  57:	ff 75 e0             	pushl  -0x20(%ebp)
  5a:	e8 c1 01 00 00       	call   220 <grep>
    close(fd);
  5f:	89 3c 24             	mov    %edi,(%esp)
  62:	e8 c9 05 00 00       	call   630 <close>
  if(argc <= 2){
    grep(pattern, 0);
    exit();
  }

  for(i = 2; i < argc; i++){
  67:	83 c4 10             	add    $0x10,%esp
  6a:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
  6d:	7f c9                	jg     38 <main+0x38>
      exit();
    }
    grep(pattern, fd);
    close(fd);
  }
  exit();
  6f:	e8 94 05 00 00       	call   608 <exit>
    exit();
  }

  for(i = 2; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "grep: cannot open %s\n", argv[i]);
  74:	50                   	push   %eax
  75:	ff 33                	pushl  (%ebx)
  77:	68 b0 0a 00 00       	push   $0xab0
  7c:	6a 01                	push   $0x1
  7e:	e8 ed 06 00 00       	call   770 <printf>
      exit();
  83:	e8 80 05 00 00       	call   608 <exit>
    exit();
  }
  pattern = argv[1];

  if(argc <= 2){
    grep(pattern, 0);
  88:	52                   	push   %edx
  89:	52                   	push   %edx
  8a:	6a 00                	push   $0x0
  8c:	50                   	push   %eax
  8d:	e8 8e 01 00 00       	call   220 <grep>
    exit();
  92:	e8 71 05 00 00       	call   608 <exit>
{
  int fd, i;
  char *pattern;

  if(argc <= 1){
    printf(2, "usage: grep pattern [file ...]\n");
  97:	51                   	push   %ecx
  98:	51                   	push   %ecx
  99:	68 90 0a 00 00       	push   $0xa90
  9e:	6a 02                	push   $0x2
  a0:	e8 cb 06 00 00       	call   770 <printf>
    exit();
  a5:	e8 5e 05 00 00       	call   608 <exit>
  aa:	66 90                	xchg   %ax,%ax
  ac:	66 90                	xchg   %ax,%ax
  ae:	66 90                	xchg   %ax,%ax

000000b0 <matchstar>:
  return 0;
}

// matchstar: search for c*re at beginning of text
int matchstar(int c, char *re, char *text)
{
  b0:	55                   	push   %ebp
  b1:	89 e5                	mov    %esp,%ebp
  b3:	57                   	push   %edi
  b4:	56                   	push   %esi
  b5:	53                   	push   %ebx
  b6:	83 ec 0c             	sub    $0xc,%esp
  b9:	8b 75 08             	mov    0x8(%ebp),%esi
  bc:	8b 7d 0c             	mov    0xc(%ebp),%edi
  bf:	8b 5d 10             	mov    0x10(%ebp),%ebx
  c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{  // a * matches zero or more instances
    if(matchhere(re, text))
  c8:	83 ec 08             	sub    $0x8,%esp
  cb:	53                   	push   %ebx
  cc:	57                   	push   %edi
  cd:	e8 3e 00 00 00       	call   110 <matchhere>
  d2:	83 c4 10             	add    $0x10,%esp
  d5:	85 c0                	test   %eax,%eax
  d7:	75 1f                	jne    f8 <matchstar+0x48>
      return 1;
  }while(*text!='\0' && (*text++==c || c=='.'));
  d9:	0f be 13             	movsbl (%ebx),%edx
  dc:	84 d2                	test   %dl,%dl
  de:	74 0c                	je     ec <matchstar+0x3c>
  e0:	83 c3 01             	add    $0x1,%ebx
  e3:	83 fe 2e             	cmp    $0x2e,%esi
  e6:	74 e0                	je     c8 <matchstar+0x18>
  e8:	39 f2                	cmp    %esi,%edx
  ea:	74 dc                	je     c8 <matchstar+0x18>
  return 0;
}
  ec:	8d 65 f4             	lea    -0xc(%ebp),%esp
  ef:	5b                   	pop    %ebx
  f0:	5e                   	pop    %esi
  f1:	5f                   	pop    %edi
  f2:	5d                   	pop    %ebp
  f3:	c3                   	ret    
  f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  f8:	8d 65 f4             	lea    -0xc(%ebp),%esp
// matchstar: search for c*re at beginning of text
int matchstar(int c, char *re, char *text)
{
  do{  // a * matches zero or more instances
    if(matchhere(re, text))
      return 1;
  fb:	b8 01 00 00 00       	mov    $0x1,%eax
  }while(*text!='\0' && (*text++==c || c=='.'));
  return 0;
}
 100:	5b                   	pop    %ebx
 101:	5e                   	pop    %esi
 102:	5f                   	pop    %edi
 103:	5d                   	pop    %ebp
 104:	c3                   	ret    
 105:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 109:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000110 <matchhere>:
  return 0;
}

// matchhere: search for re at beginning of text
int matchhere(char *re, char *text)
{
 110:	55                   	push   %ebp
 111:	89 e5                	mov    %esp,%ebp
 113:	57                   	push   %edi
 114:	56                   	push   %esi
 115:	53                   	push   %ebx
 116:	83 ec 0c             	sub    $0xc,%esp
 119:	8b 45 08             	mov    0x8(%ebp),%eax
 11c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  if(re[0] == '\0')
 11f:	0f b6 18             	movzbl (%eax),%ebx
 122:	84 db                	test   %bl,%bl
 124:	74 63                	je     189 <matchhere+0x79>
    return 1;
  if(re[1] == '*')
 126:	0f be 50 01          	movsbl 0x1(%eax),%edx
 12a:	80 fa 2a             	cmp    $0x2a,%dl
 12d:	74 7b                	je     1aa <matchhere+0x9a>
    return matchstar(re[0], re+2, text);
  if(re[0] == '$' && re[1] == '\0')
 12f:	80 fb 24             	cmp    $0x24,%bl
 132:	75 08                	jne    13c <matchhere+0x2c>
 134:	84 d2                	test   %dl,%dl
 136:	0f 84 8a 00 00 00    	je     1c6 <matchhere+0xb6>
    return *text == '\0';
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
 13c:	0f b6 37             	movzbl (%edi),%esi
 13f:	89 f1                	mov    %esi,%ecx
 141:	84 c9                	test   %cl,%cl
 143:	74 5b                	je     1a0 <matchhere+0x90>
 145:	38 cb                	cmp    %cl,%bl
 147:	74 05                	je     14e <matchhere+0x3e>
 149:	80 fb 2e             	cmp    $0x2e,%bl
 14c:	75 52                	jne    1a0 <matchhere+0x90>
    return matchhere(re+1, text+1);
 14e:	83 c7 01             	add    $0x1,%edi
 151:	83 c0 01             	add    $0x1,%eax
}

// matchhere: search for re at beginning of text
int matchhere(char *re, char *text)
{
  if(re[0] == '\0')
 154:	84 d2                	test   %dl,%dl
 156:	74 31                	je     189 <matchhere+0x79>
    return 1;
  if(re[1] == '*')
 158:	0f b6 58 01          	movzbl 0x1(%eax),%ebx
 15c:	80 fb 2a             	cmp    $0x2a,%bl
 15f:	74 4c                	je     1ad <matchhere+0x9d>
    return matchstar(re[0], re+2, text);
  if(re[0] == '$' && re[1] == '\0')
 161:	80 fa 24             	cmp    $0x24,%dl
 164:	75 04                	jne    16a <matchhere+0x5a>
 166:	84 db                	test   %bl,%bl
 168:	74 5c                	je     1c6 <matchhere+0xb6>
    return *text == '\0';
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
 16a:	0f b6 37             	movzbl (%edi),%esi
 16d:	89 f1                	mov    %esi,%ecx
 16f:	84 c9                	test   %cl,%cl
 171:	74 2d                	je     1a0 <matchhere+0x90>
 173:	80 fa 2e             	cmp    $0x2e,%dl
 176:	74 04                	je     17c <matchhere+0x6c>
 178:	38 d1                	cmp    %dl,%cl
 17a:	75 24                	jne    1a0 <matchhere+0x90>
 17c:	0f be d3             	movsbl %bl,%edx
    return matchhere(re+1, text+1);
 17f:	83 c7 01             	add    $0x1,%edi
 182:	83 c0 01             	add    $0x1,%eax
}

// matchhere: search for re at beginning of text
int matchhere(char *re, char *text)
{
  if(re[0] == '\0')
 185:	84 d2                	test   %dl,%dl
 187:	75 cf                	jne    158 <matchhere+0x48>
    return 1;
 189:	b8 01 00 00 00       	mov    $0x1,%eax
  if(re[0] == '$' && re[1] == '\0')
    return *text == '\0';
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
    return matchhere(re+1, text+1);
  return 0;
}
 18e:	8d 65 f4             	lea    -0xc(%ebp),%esp
 191:	5b                   	pop    %ebx
 192:	5e                   	pop    %esi
 193:	5f                   	pop    %edi
 194:	5d                   	pop    %ebp
 195:	c3                   	ret    
 196:	8d 76 00             	lea    0x0(%esi),%esi
 199:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 1a0:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return matchstar(re[0], re+2, text);
  if(re[0] == '$' && re[1] == '\0')
    return *text == '\0';
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
    return matchhere(re+1, text+1);
  return 0;
 1a3:	31 c0                	xor    %eax,%eax
}
 1a5:	5b                   	pop    %ebx
 1a6:	5e                   	pop    %esi
 1a7:	5f                   	pop    %edi
 1a8:	5d                   	pop    %ebp
 1a9:	c3                   	ret    
// matchhere: search for re at beginning of text
int matchhere(char *re, char *text)
{
  if(re[0] == '\0')
    return 1;
  if(re[1] == '*')
 1aa:	0f be d3             	movsbl %bl,%edx
    return matchstar(re[0], re+2, text);
 1ad:	83 ec 04             	sub    $0x4,%esp
 1b0:	83 c0 02             	add    $0x2,%eax
 1b3:	57                   	push   %edi
 1b4:	50                   	push   %eax
 1b5:	52                   	push   %edx
 1b6:	e8 f5 fe ff ff       	call   b0 <matchstar>
 1bb:	83 c4 10             	add    $0x10,%esp
  if(re[0] == '$' && re[1] == '\0')
    return *text == '\0';
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
    return matchhere(re+1, text+1);
  return 0;
}
 1be:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1c1:	5b                   	pop    %ebx
 1c2:	5e                   	pop    %esi
 1c3:	5f                   	pop    %edi
 1c4:	5d                   	pop    %ebp
 1c5:	c3                   	ret    
  if(re[0] == '\0')
    return 1;
  if(re[1] == '*')
    return matchstar(re[0], re+2, text);
  if(re[0] == '$' && re[1] == '\0')
    return *text == '\0';
 1c6:	31 c0                	xor    %eax,%eax
 1c8:	80 3f 00             	cmpb   $0x0,(%edi)
 1cb:	0f 94 c0             	sete   %al
 1ce:	eb be                	jmp    18e <matchhere+0x7e>

000001d0 <match>:
int matchhere(char*, char*);
int matchstar(int, char*, char*);

int
match(char *re, char *text)
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	56                   	push   %esi
 1d4:	53                   	push   %ebx
 1d5:	8b 75 08             	mov    0x8(%ebp),%esi
 1d8:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  if(re[0] == '^')
 1db:	80 3e 5e             	cmpb   $0x5e,(%esi)
 1de:	75 11                	jne    1f1 <match+0x21>
 1e0:	eb 2c                	jmp    20e <match+0x3e>
 1e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return matchhere(re+1, text);
  do{  // must look at empty string
    if(matchhere(re, text))
      return 1;
  }while(*text++ != '\0');
 1e8:	83 c3 01             	add    $0x1,%ebx
 1eb:	80 7b ff 00          	cmpb   $0x0,-0x1(%ebx)
 1ef:	74 16                	je     207 <match+0x37>
match(char *re, char *text)
{
  if(re[0] == '^')
    return matchhere(re+1, text);
  do{  // must look at empty string
    if(matchhere(re, text))
 1f1:	83 ec 08             	sub    $0x8,%esp
 1f4:	53                   	push   %ebx
 1f5:	56                   	push   %esi
 1f6:	e8 15 ff ff ff       	call   110 <matchhere>
 1fb:	83 c4 10             	add    $0x10,%esp
 1fe:	85 c0                	test   %eax,%eax
 200:	74 e6                	je     1e8 <match+0x18>
      return 1;
 202:	b8 01 00 00 00       	mov    $0x1,%eax
  }while(*text++ != '\0');
  return 0;
}
 207:	8d 65 f8             	lea    -0x8(%ebp),%esp
 20a:	5b                   	pop    %ebx
 20b:	5e                   	pop    %esi
 20c:	5d                   	pop    %ebp
 20d:	c3                   	ret    

int
match(char *re, char *text)
{
  if(re[0] == '^')
    return matchhere(re+1, text);
 20e:	83 c6 01             	add    $0x1,%esi
 211:	89 75 08             	mov    %esi,0x8(%ebp)
  do{  // must look at empty string
    if(matchhere(re, text))
      return 1;
  }while(*text++ != '\0');
  return 0;
}
 214:	8d 65 f8             	lea    -0x8(%ebp),%esp
 217:	5b                   	pop    %ebx
 218:	5e                   	pop    %esi
 219:	5d                   	pop    %ebp

int
match(char *re, char *text)
{
  if(re[0] == '^')
    return matchhere(re+1, text);
 21a:	e9 f1 fe ff ff       	jmp    110 <matchhere>
 21f:	90                   	nop

00000220 <grep>:
char buf[1024];
int match(char*, char*);

void
grep(char *pattern, int fd)
{
 220:	55                   	push   %ebp
 221:	89 e5                	mov    %esp,%ebp
 223:	57                   	push   %edi
 224:	56                   	push   %esi
 225:	53                   	push   %ebx
 226:	83 ec 1c             	sub    $0x1c,%esp
 229:	8b 75 08             	mov    0x8(%ebp),%esi
  int n, m;
  char *p, *q;

  m = 0;
 22c:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 233:	90                   	nop
 234:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
 238:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 23b:	b8 ff 03 00 00       	mov    $0x3ff,%eax
 240:	83 ec 04             	sub    $0x4,%esp
 243:	29 c8                	sub    %ecx,%eax
 245:	50                   	push   %eax
 246:	8d 81 00 0f 00 00    	lea    0xf00(%ecx),%eax
 24c:	50                   	push   %eax
 24d:	ff 75 0c             	pushl  0xc(%ebp)
 250:	e8 cb 03 00 00       	call   620 <read>
 255:	83 c4 10             	add    $0x10,%esp
 258:	85 c0                	test   %eax,%eax
 25a:	0f 8e ac 00 00 00    	jle    30c <grep+0xec>
    m += n;
 260:	01 45 e4             	add    %eax,-0x1c(%ebp)
    buf[m] = '\0';
    p = buf;
 263:	bb 00 0f 00 00       	mov    $0xf00,%ebx
  int n, m;
  char *p, *q;

  m = 0;
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
    m += n;
 268:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    buf[m] = '\0';
 26b:	c6 82 00 0f 00 00 00 	movb   $0x0,0xf00(%edx)
 272:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    p = buf;
    while((q = strchr(p, '\n')) != 0){
 278:	83 ec 08             	sub    $0x8,%esp
 27b:	6a 0a                	push   $0xa
 27d:	53                   	push   %ebx
 27e:	e8 fd 01 00 00       	call   480 <strchr>
 283:	83 c4 10             	add    $0x10,%esp
 286:	85 c0                	test   %eax,%eax
 288:	89 c7                	mov    %eax,%edi
 28a:	74 3c                	je     2c8 <grep+0xa8>
      *q = 0;
      if(match(pattern, p)){
 28c:	83 ec 08             	sub    $0x8,%esp
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
    m += n;
    buf[m] = '\0';
    p = buf;
    while((q = strchr(p, '\n')) != 0){
      *q = 0;
 28f:	c6 07 00             	movb   $0x0,(%edi)
      if(match(pattern, p)){
 292:	53                   	push   %ebx
 293:	56                   	push   %esi
 294:	e8 37 ff ff ff       	call   1d0 <match>
 299:	83 c4 10             	add    $0x10,%esp
 29c:	85 c0                	test   %eax,%eax
 29e:	75 08                	jne    2a8 <grep+0x88>
 2a0:	8d 5f 01             	lea    0x1(%edi),%ebx
 2a3:	eb d3                	jmp    278 <grep+0x58>
 2a5:	8d 76 00             	lea    0x0(%esi),%esi
        *q = '\n';
 2a8:	c6 07 0a             	movb   $0xa,(%edi)
        write(1, p, q+1 - p);
 2ab:	83 c7 01             	add    $0x1,%edi
 2ae:	83 ec 04             	sub    $0x4,%esp
 2b1:	89 f8                	mov    %edi,%eax
 2b3:	29 d8                	sub    %ebx,%eax
 2b5:	50                   	push   %eax
 2b6:	53                   	push   %ebx
 2b7:	89 fb                	mov    %edi,%ebx
 2b9:	6a 01                	push   $0x1
 2bb:	e8 68 03 00 00       	call   628 <write>
 2c0:	83 c4 10             	add    $0x10,%esp
 2c3:	eb b3                	jmp    278 <grep+0x58>
 2c5:	8d 76 00             	lea    0x0(%esi),%esi
      }
      p = q+1;
    }
    if(p == buf)
 2c8:	81 fb 00 0f 00 00    	cmp    $0xf00,%ebx
 2ce:	74 30                	je     300 <grep+0xe0>
      m = 0;
    if(m > 0){
 2d0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 2d3:	85 c0                	test   %eax,%eax
 2d5:	0f 8e 5d ff ff ff    	jle    238 <grep+0x18>
      m -= p - buf;
 2db:	89 d8                	mov    %ebx,%eax
      memmove(buf, p, m);
 2dd:	83 ec 04             	sub    $0x4,%esp
      p = q+1;
    }
    if(p == buf)
      m = 0;
    if(m > 0){
      m -= p - buf;
 2e0:	2d 00 0f 00 00       	sub    $0xf00,%eax
 2e5:	29 45 e4             	sub    %eax,-0x1c(%ebp)
 2e8:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
      memmove(buf, p, m);
 2eb:	51                   	push   %ecx
 2ec:	53                   	push   %ebx
 2ed:	68 00 0f 00 00       	push   $0xf00
 2f2:	e8 c9 02 00 00       	call   5c0 <memmove>
 2f7:	83 c4 10             	add    $0x10,%esp
 2fa:	e9 39 ff ff ff       	jmp    238 <grep+0x18>
 2ff:	90                   	nop
        write(1, p, q+1 - p);
      }
      p = q+1;
    }
    if(p == buf)
      m = 0;
 300:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 307:	e9 2c ff ff ff       	jmp    238 <grep+0x18>
    if(m > 0){
      m -= p - buf;
      memmove(buf, p, m);
    }
  }
}
 30c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 30f:	5b                   	pop    %ebx
 310:	5e                   	pop    %esi
 311:	5f                   	pop    %edi
 312:	5d                   	pop    %ebp
 313:	c3                   	ret    
 314:	66 90                	xchg   %ax,%ax
 316:	66 90                	xchg   %ax,%ax
 318:	66 90                	xchg   %ax,%ax
 31a:	66 90                	xchg   %ax,%ax
 31c:	66 90                	xchg   %ax,%ax
 31e:	66 90                	xchg   %ax,%ax

00000320 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 320:	55                   	push   %ebp
 321:	89 e5                	mov    %esp,%ebp
 323:	53                   	push   %ebx
 324:	8b 45 08             	mov    0x8(%ebp),%eax
 327:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 32a:	89 c2                	mov    %eax,%edx
 32c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 330:	83 c1 01             	add    $0x1,%ecx
 333:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 337:	83 c2 01             	add    $0x1,%edx
 33a:	84 db                	test   %bl,%bl
 33c:	88 5a ff             	mov    %bl,-0x1(%edx)
 33f:	75 ef                	jne    330 <strcpy+0x10>
    ;
  return os;
}
 341:	5b                   	pop    %ebx
 342:	5d                   	pop    %ebp
 343:	c3                   	ret    
 344:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 34a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000350 <strncpy>:

char* strncpy(char* s, char* t, int n) {
 350:	55                   	push   %ebp
  int i = 0;
 351:	31 d2                	xor    %edx,%edx
  while((*s++ = *t++) != 0)
    ;
  return os;
}

char* strncpy(char* s, char* t, int n) {
 353:	89 e5                	mov    %esp,%ebp
 355:	56                   	push   %esi
 356:	53                   	push   %ebx
 357:	8b 45 08             	mov    0x8(%ebp),%eax
 35a:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 35d:	8b 75 10             	mov    0x10(%ebp),%esi
  int i = 0;
  char *os;
  os = s;
  while(((*s++ = *t++) != 0) && (++i < n));
 360:	eb 0d                	jmp    36f <strncpy+0x1f>
 362:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 368:	83 c2 01             	add    $0x1,%edx
 36b:	39 f2                	cmp    %esi,%edx
 36d:	7d 0b                	jge    37a <strncpy+0x2a>
 36f:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
 373:	84 c9                	test   %cl,%cl
 375:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 378:	75 ee                	jne    368 <strncpy+0x18>
  return os;
}
 37a:	5b                   	pop    %ebx
 37b:	5e                   	pop    %esi
 37c:	5d                   	pop    %ebp
 37d:	c3                   	ret    
 37e:	66 90                	xchg   %ax,%ax

00000380 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 380:	55                   	push   %ebp
 381:	89 e5                	mov    %esp,%ebp
 383:	56                   	push   %esi
 384:	53                   	push   %ebx
 385:	8b 55 08             	mov    0x8(%ebp),%edx
 388:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 38b:	0f b6 02             	movzbl (%edx),%eax
 38e:	0f b6 19             	movzbl (%ecx),%ebx
 391:	84 c0                	test   %al,%al
 393:	75 1e                	jne    3b3 <strcmp+0x33>
 395:	eb 29                	jmp    3c0 <strcmp+0x40>
 397:	89 f6                	mov    %esi,%esi
 399:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 3a0:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 3a3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 3a6:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 3a9:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 3ad:	84 c0                	test   %al,%al
 3af:	74 0f                	je     3c0 <strcmp+0x40>
 3b1:	89 f1                	mov    %esi,%ecx
 3b3:	38 d8                	cmp    %bl,%al
 3b5:	74 e9                	je     3a0 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 3b7:	29 d8                	sub    %ebx,%eax
}
 3b9:	5b                   	pop    %ebx
 3ba:	5e                   	pop    %esi
 3bb:	5d                   	pop    %ebp
 3bc:	c3                   	ret    
 3bd:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 3c0:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
 3c2:	29 d8                	sub    %ebx,%eax
}
 3c4:	5b                   	pop    %ebx
 3c5:	5e                   	pop    %esi
 3c6:	5d                   	pop    %ebp
 3c7:	c3                   	ret    
 3c8:	90                   	nop
 3c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000003d0 <strncmp>:

int strncmp(const char *p, const char *q, int n) {
 3d0:	55                   	push   %ebp
 3d1:	89 e5                	mov    %esp,%ebp
 3d3:	57                   	push   %edi
 3d4:	56                   	push   %esi
 3d5:	53                   	push   %ebx
 3d6:	8b 5d 10             	mov    0x10(%ebp),%ebx
 3d9:	8b 75 08             	mov    0x8(%ebp),%esi
 3dc:	8b 7d 0c             	mov    0xc(%ebp),%edi
  int i = 0;
  while(i < n && *p == *q)
 3df:	85 db                	test   %ebx,%ebx
 3e1:	7e 28                	jle    40b <strncmp+0x3b>
 3e3:	0f b6 16             	movzbl (%esi),%edx
 3e6:	0f b6 0f             	movzbl (%edi),%ecx
 3e9:	38 d1                	cmp    %dl,%cl
 3eb:	75 2b                	jne    418 <strncmp+0x48>
 3ed:	31 c0                	xor    %eax,%eax
 3ef:	eb 13                	jmp    404 <strncmp+0x34>
 3f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3f8:	0f b6 14 06          	movzbl (%esi,%eax,1),%edx
 3fc:	0f b6 0c 07          	movzbl (%edi,%eax,1),%ecx
 400:	38 ca                	cmp    %cl,%dl
 402:	75 14                	jne    418 <strncmp+0x48>
    p++, q++, i++;
 404:	83 c0 01             	add    $0x1,%eax
  return (uchar)*p - (uchar)*q;
}

int strncmp(const char *p, const char *q, int n) {
  int i = 0;
  while(i < n && *p == *q)
 407:	39 c3                	cmp    %eax,%ebx
 409:	75 ed                	jne    3f8 <strncmp+0x28>
    p++, q++, i++;
  if (i < n)
    return (uchar)*p - (uchar)*q;
  else
    return 0;
}
 40b:	5b                   	pop    %ebx
  while(i < n && *p == *q)
    p++, q++, i++;
  if (i < n)
    return (uchar)*p - (uchar)*q;
  else
    return 0;
 40c:	31 c0                	xor    %eax,%eax
}
 40e:	5e                   	pop    %esi
 40f:	5f                   	pop    %edi
 410:	5d                   	pop    %ebp
 411:	c3                   	ret    
 412:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
int strncmp(const char *p, const char *q, int n) {
  int i = 0;
  while(i < n && *p == *q)
    p++, q++, i++;
  if (i < n)
    return (uchar)*p - (uchar)*q;
 418:	0f b6 c2             	movzbl %dl,%eax
  else
    return 0;
}
 41b:	5b                   	pop    %ebx
int strncmp(const char *p, const char *q, int n) {
  int i = 0;
  while(i < n && *p == *q)
    p++, q++, i++;
  if (i < n)
    return (uchar)*p - (uchar)*q;
 41c:	29 c8                	sub    %ecx,%eax
  else
    return 0;
}
 41e:	5e                   	pop    %esi
 41f:	5f                   	pop    %edi
 420:	5d                   	pop    %ebp
 421:	c3                   	ret    
 422:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 429:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000430 <strlen>:

uint
strlen(char *s)
{
 430:	55                   	push   %ebp
 431:	89 e5                	mov    %esp,%ebp
 433:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 436:	80 39 00             	cmpb   $0x0,(%ecx)
 439:	74 12                	je     44d <strlen+0x1d>
 43b:	31 d2                	xor    %edx,%edx
 43d:	8d 76 00             	lea    0x0(%esi),%esi
 440:	83 c2 01             	add    $0x1,%edx
 443:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 447:	89 d0                	mov    %edx,%eax
 449:	75 f5                	jne    440 <strlen+0x10>
    ;
  return n;
}
 44b:	5d                   	pop    %ebp
 44c:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 44d:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
 44f:	5d                   	pop    %ebp
 450:	c3                   	ret    
 451:	eb 0d                	jmp    460 <memset>
 453:	90                   	nop
 454:	90                   	nop
 455:	90                   	nop
 456:	90                   	nop
 457:	90                   	nop
 458:	90                   	nop
 459:	90                   	nop
 45a:	90                   	nop
 45b:	90                   	nop
 45c:	90                   	nop
 45d:	90                   	nop
 45e:	90                   	nop
 45f:	90                   	nop

00000460 <memset>:

void*
memset(void *dst, int c, uint n)
{
 460:	55                   	push   %ebp
 461:	89 e5                	mov    %esp,%ebp
 463:	57                   	push   %edi
 464:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 467:	8b 4d 10             	mov    0x10(%ebp),%ecx
 46a:	8b 45 0c             	mov    0xc(%ebp),%eax
 46d:	89 d7                	mov    %edx,%edi
 46f:	fc                   	cld    
 470:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 472:	89 d0                	mov    %edx,%eax
 474:	5f                   	pop    %edi
 475:	5d                   	pop    %ebp
 476:	c3                   	ret    
 477:	89 f6                	mov    %esi,%esi
 479:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000480 <strchr>:

char*
strchr(const char *s, char c)
{
 480:	55                   	push   %ebp
 481:	89 e5                	mov    %esp,%ebp
 483:	53                   	push   %ebx
 484:	8b 45 08             	mov    0x8(%ebp),%eax
 487:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 48a:	0f b6 10             	movzbl (%eax),%edx
 48d:	84 d2                	test   %dl,%dl
 48f:	74 1d                	je     4ae <strchr+0x2e>
    if(*s == c)
 491:	38 d3                	cmp    %dl,%bl
 493:	89 d9                	mov    %ebx,%ecx
 495:	75 0d                	jne    4a4 <strchr+0x24>
 497:	eb 17                	jmp    4b0 <strchr+0x30>
 499:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4a0:	38 ca                	cmp    %cl,%dl
 4a2:	74 0c                	je     4b0 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 4a4:	83 c0 01             	add    $0x1,%eax
 4a7:	0f b6 10             	movzbl (%eax),%edx
 4aa:	84 d2                	test   %dl,%dl
 4ac:	75 f2                	jne    4a0 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
 4ae:	31 c0                	xor    %eax,%eax
}
 4b0:	5b                   	pop    %ebx
 4b1:	5d                   	pop    %ebp
 4b2:	c3                   	ret    
 4b3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 4b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000004c0 <gets>:

char*
gets(char *buf, int max)
{
 4c0:	55                   	push   %ebp
 4c1:	89 e5                	mov    %esp,%ebp
 4c3:	57                   	push   %edi
 4c4:	56                   	push   %esi
 4c5:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 4c6:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
 4c8:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
 4cb:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 4ce:	eb 29                	jmp    4f9 <gets+0x39>
    cc = read(0, &c, 1);
 4d0:	83 ec 04             	sub    $0x4,%esp
 4d3:	6a 01                	push   $0x1
 4d5:	57                   	push   %edi
 4d6:	6a 00                	push   $0x0
 4d8:	e8 43 01 00 00       	call   620 <read>
    if(cc < 1)
 4dd:	83 c4 10             	add    $0x10,%esp
 4e0:	85 c0                	test   %eax,%eax
 4e2:	7e 1d                	jle    501 <gets+0x41>
      break;
    buf[i++] = c;
 4e4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 4e8:	8b 55 08             	mov    0x8(%ebp),%edx
 4eb:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
 4ed:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 4ef:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 4f3:	74 1b                	je     510 <gets+0x50>
 4f5:	3c 0d                	cmp    $0xd,%al
 4f7:	74 17                	je     510 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 4f9:	8d 5e 01             	lea    0x1(%esi),%ebx
 4fc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 4ff:	7c cf                	jl     4d0 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 501:	8b 45 08             	mov    0x8(%ebp),%eax
 504:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 508:	8d 65 f4             	lea    -0xc(%ebp),%esp
 50b:	5b                   	pop    %ebx
 50c:	5e                   	pop    %esi
 50d:	5f                   	pop    %edi
 50e:	5d                   	pop    %ebp
 50f:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 510:	8b 45 08             	mov    0x8(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 513:	89 de                	mov    %ebx,%esi
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 515:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 519:	8d 65 f4             	lea    -0xc(%ebp),%esp
 51c:	5b                   	pop    %ebx
 51d:	5e                   	pop    %esi
 51e:	5f                   	pop    %edi
 51f:	5d                   	pop    %ebp
 520:	c3                   	ret    
 521:	eb 0d                	jmp    530 <stat>
 523:	90                   	nop
 524:	90                   	nop
 525:	90                   	nop
 526:	90                   	nop
 527:	90                   	nop
 528:	90                   	nop
 529:	90                   	nop
 52a:	90                   	nop
 52b:	90                   	nop
 52c:	90                   	nop
 52d:	90                   	nop
 52e:	90                   	nop
 52f:	90                   	nop

00000530 <stat>:

int
stat(char *n, struct stat *st)
{
 530:	55                   	push   %ebp
 531:	89 e5                	mov    %esp,%ebp
 533:	56                   	push   %esi
 534:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 535:	83 ec 08             	sub    $0x8,%esp
 538:	6a 00                	push   $0x0
 53a:	ff 75 08             	pushl  0x8(%ebp)
 53d:	e8 06 01 00 00       	call   648 <open>
  if(fd < 0)
 542:	83 c4 10             	add    $0x10,%esp
 545:	85 c0                	test   %eax,%eax
 547:	78 27                	js     570 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 549:	83 ec 08             	sub    $0x8,%esp
 54c:	ff 75 0c             	pushl  0xc(%ebp)
 54f:	89 c3                	mov    %eax,%ebx
 551:	50                   	push   %eax
 552:	e8 09 01 00 00       	call   660 <fstat>
 557:	89 c6                	mov    %eax,%esi
  close(fd);
 559:	89 1c 24             	mov    %ebx,(%esp)
 55c:	e8 cf 00 00 00       	call   630 <close>
  return r;
 561:	83 c4 10             	add    $0x10,%esp
 564:	89 f0                	mov    %esi,%eax
}
 566:	8d 65 f8             	lea    -0x8(%ebp),%esp
 569:	5b                   	pop    %ebx
 56a:	5e                   	pop    %esi
 56b:	5d                   	pop    %ebp
 56c:	c3                   	ret    
 56d:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 570:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 575:	eb ef                	jmp    566 <stat+0x36>
 577:	89 f6                	mov    %esi,%esi
 579:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000580 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 580:	55                   	push   %ebp
 581:	89 e5                	mov    %esp,%ebp
 583:	53                   	push   %ebx
 584:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 587:	0f be 11             	movsbl (%ecx),%edx
 58a:	8d 42 d0             	lea    -0x30(%edx),%eax
 58d:	3c 09                	cmp    $0x9,%al
 58f:	b8 00 00 00 00       	mov    $0x0,%eax
 594:	77 1f                	ja     5b5 <atoi+0x35>
 596:	8d 76 00             	lea    0x0(%esi),%esi
 599:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 5a0:	8d 04 80             	lea    (%eax,%eax,4),%eax
 5a3:	83 c1 01             	add    $0x1,%ecx
 5a6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 5aa:	0f be 11             	movsbl (%ecx),%edx
 5ad:	8d 5a d0             	lea    -0x30(%edx),%ebx
 5b0:	80 fb 09             	cmp    $0x9,%bl
 5b3:	76 eb                	jbe    5a0 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
 5b5:	5b                   	pop    %ebx
 5b6:	5d                   	pop    %ebp
 5b7:	c3                   	ret    
 5b8:	90                   	nop
 5b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000005c0 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 5c0:	55                   	push   %ebp
 5c1:	89 e5                	mov    %esp,%ebp
 5c3:	56                   	push   %esi
 5c4:	53                   	push   %ebx
 5c5:	8b 5d 10             	mov    0x10(%ebp),%ebx
 5c8:	8b 45 08             	mov    0x8(%ebp),%eax
 5cb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 5ce:	85 db                	test   %ebx,%ebx
 5d0:	7e 14                	jle    5e6 <memmove+0x26>
 5d2:	31 d2                	xor    %edx,%edx
 5d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 5d8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 5dc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 5df:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 5e2:	39 da                	cmp    %ebx,%edx
 5e4:	75 f2                	jne    5d8 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 5e6:	5b                   	pop    %ebx
 5e7:	5e                   	pop    %esi
 5e8:	5d                   	pop    %ebp
 5e9:	c3                   	ret    
 5ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000005f0 <max>:

int max(int a, int b) {
 5f0:	55                   	push   %ebp
 5f1:	89 e5                	mov    %esp,%ebp
 5f3:	8b 55 08             	mov    0x8(%ebp),%edx
 5f6:	8b 45 0c             	mov    0xc(%ebp),%eax
  if (b > a) return b;
  else return a;
}
 5f9:	5d                   	pop    %ebp
 5fa:	39 d0                	cmp    %edx,%eax
 5fc:	0f 4c c2             	cmovl  %edx,%eax
 5ff:	c3                   	ret    

00000600 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 600:	b8 01 00 00 00       	mov    $0x1,%eax
 605:	cd 40                	int    $0x40
 607:	c3                   	ret    

00000608 <exit>:
SYSCALL(exit)
 608:	b8 02 00 00 00       	mov    $0x2,%eax
 60d:	cd 40                	int    $0x40
 60f:	c3                   	ret    

00000610 <wait>:
SYSCALL(wait)
 610:	b8 03 00 00 00       	mov    $0x3,%eax
 615:	cd 40                	int    $0x40
 617:	c3                   	ret    

00000618 <pipe>:
SYSCALL(pipe)
 618:	b8 04 00 00 00       	mov    $0x4,%eax
 61d:	cd 40                	int    $0x40
 61f:	c3                   	ret    

00000620 <read>:
SYSCALL(read)
 620:	b8 05 00 00 00       	mov    $0x5,%eax
 625:	cd 40                	int    $0x40
 627:	c3                   	ret    

00000628 <write>:
SYSCALL(write)
 628:	b8 10 00 00 00       	mov    $0x10,%eax
 62d:	cd 40                	int    $0x40
 62f:	c3                   	ret    

00000630 <close>:
SYSCALL(close)
 630:	b8 15 00 00 00       	mov    $0x15,%eax
 635:	cd 40                	int    $0x40
 637:	c3                   	ret    

00000638 <kill>:
SYSCALL(kill)
 638:	b8 06 00 00 00       	mov    $0x6,%eax
 63d:	cd 40                	int    $0x40
 63f:	c3                   	ret    

00000640 <exec>:
SYSCALL(exec)
 640:	b8 07 00 00 00       	mov    $0x7,%eax
 645:	cd 40                	int    $0x40
 647:	c3                   	ret    

00000648 <open>:
SYSCALL(open)
 648:	b8 0f 00 00 00       	mov    $0xf,%eax
 64d:	cd 40                	int    $0x40
 64f:	c3                   	ret    

00000650 <mknod>:
SYSCALL(mknod)
 650:	b8 11 00 00 00       	mov    $0x11,%eax
 655:	cd 40                	int    $0x40
 657:	c3                   	ret    

00000658 <unlink>:
SYSCALL(unlink)
 658:	b8 12 00 00 00       	mov    $0x12,%eax
 65d:	cd 40                	int    $0x40
 65f:	c3                   	ret    

00000660 <fstat>:
SYSCALL(fstat)
 660:	b8 08 00 00 00       	mov    $0x8,%eax
 665:	cd 40                	int    $0x40
 667:	c3                   	ret    

00000668 <link>:
SYSCALL(link)
 668:	b8 13 00 00 00       	mov    $0x13,%eax
 66d:	cd 40                	int    $0x40
 66f:	c3                   	ret    

00000670 <mkdir>:
SYSCALL(mkdir)
 670:	b8 14 00 00 00       	mov    $0x14,%eax
 675:	cd 40                	int    $0x40
 677:	c3                   	ret    

00000678 <chdir>:
SYSCALL(chdir)
 678:	b8 09 00 00 00       	mov    $0x9,%eax
 67d:	cd 40                	int    $0x40
 67f:	c3                   	ret    

00000680 <dup>:
SYSCALL(dup)
 680:	b8 0a 00 00 00       	mov    $0xa,%eax
 685:	cd 40                	int    $0x40
 687:	c3                   	ret    

00000688 <getpid>:
SYSCALL(getpid)
 688:	b8 0b 00 00 00       	mov    $0xb,%eax
 68d:	cd 40                	int    $0x40
 68f:	c3                   	ret    

00000690 <sbrk>:
SYSCALL(sbrk)
 690:	b8 0c 00 00 00       	mov    $0xc,%eax
 695:	cd 40                	int    $0x40
 697:	c3                   	ret    

00000698 <sleep>:
SYSCALL(sleep)
 698:	b8 0d 00 00 00       	mov    $0xd,%eax
 69d:	cd 40                	int    $0x40
 69f:	c3                   	ret    

000006a0 <uptime>:
SYSCALL(uptime)
 6a0:	b8 0e 00 00 00       	mov    $0xe,%eax
 6a5:	cd 40                	int    $0x40
 6a7:	c3                   	ret    

000006a8 <setVariable>:
SYSCALL(setVariable)
 6a8:	b8 17 00 00 00       	mov    $0x17,%eax
 6ad:	cd 40                	int    $0x40
 6af:	c3                   	ret    

000006b0 <getVariable>:
SYSCALL(getVariable)
 6b0:	b8 18 00 00 00       	mov    $0x18,%eax
 6b5:	cd 40                	int    $0x40
 6b7:	c3                   	ret    

000006b8 <remVariable>:
SYSCALL(remVariable)
 6b8:	b8 19 00 00 00       	mov    $0x19,%eax
 6bd:	cd 40                	int    $0x40
 6bf:	c3                   	ret    

000006c0 <wait2>:
SYSCALL(wait2)
 6c0:	b8 1a 00 00 00       	mov    $0x1a,%eax
 6c5:	cd 40                	int    $0x40
 6c7:	c3                   	ret    
 6c8:	66 90                	xchg   %ax,%ax
 6ca:	66 90                	xchg   %ax,%ax
 6cc:	66 90                	xchg   %ax,%ax
 6ce:	66 90                	xchg   %ax,%ax

000006d0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 6d0:	55                   	push   %ebp
 6d1:	89 e5                	mov    %esp,%ebp
 6d3:	57                   	push   %edi
 6d4:	56                   	push   %esi
 6d5:	53                   	push   %ebx
 6d6:	89 c6                	mov    %eax,%esi
 6d8:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 6db:	8b 5d 08             	mov    0x8(%ebp),%ebx
 6de:	85 db                	test   %ebx,%ebx
 6e0:	74 7e                	je     760 <printint+0x90>
 6e2:	89 d0                	mov    %edx,%eax
 6e4:	c1 e8 1f             	shr    $0x1f,%eax
 6e7:	84 c0                	test   %al,%al
 6e9:	74 75                	je     760 <printint+0x90>
    neg = 1;
    x = -xx;
 6eb:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 6ed:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
 6f4:	f7 d8                	neg    %eax
 6f6:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 6f9:	31 ff                	xor    %edi,%edi
 6fb:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 6fe:	89 ce                	mov    %ecx,%esi
 700:	eb 08                	jmp    70a <printint+0x3a>
 702:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 708:	89 cf                	mov    %ecx,%edi
 70a:	31 d2                	xor    %edx,%edx
 70c:	8d 4f 01             	lea    0x1(%edi),%ecx
 70f:	f7 f6                	div    %esi
 711:	0f b6 92 d0 0a 00 00 	movzbl 0xad0(%edx),%edx
  }while((x /= base) != 0);
 718:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 71a:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 71d:	75 e9                	jne    708 <printint+0x38>
  if(neg)
 71f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 722:	8b 75 c0             	mov    -0x40(%ebp),%esi
 725:	85 c0                	test   %eax,%eax
 727:	74 08                	je     731 <printint+0x61>
    buf[i++] = '-';
 729:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
 72e:	8d 4f 02             	lea    0x2(%edi),%ecx
 731:	8d 7c 0d d7          	lea    -0x29(%ebp,%ecx,1),%edi
 735:	8d 76 00             	lea    0x0(%esi),%esi
 738:	0f b6 07             	movzbl (%edi),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 73b:	83 ec 04             	sub    $0x4,%esp
 73e:	83 ef 01             	sub    $0x1,%edi
 741:	6a 01                	push   $0x1
 743:	53                   	push   %ebx
 744:	56                   	push   %esi
 745:	88 45 d7             	mov    %al,-0x29(%ebp)
 748:	e8 db fe ff ff       	call   628 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 74d:	83 c4 10             	add    $0x10,%esp
 750:	39 df                	cmp    %ebx,%edi
 752:	75 e4                	jne    738 <printint+0x68>
    putc(fd, buf[i]);
}
 754:	8d 65 f4             	lea    -0xc(%ebp),%esp
 757:	5b                   	pop    %ebx
 758:	5e                   	pop    %esi
 759:	5f                   	pop    %edi
 75a:	5d                   	pop    %ebp
 75b:	c3                   	ret    
 75c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 760:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 762:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 769:	eb 8b                	jmp    6f6 <printint+0x26>
 76b:	90                   	nop
 76c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000770 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 770:	55                   	push   %ebp
 771:	89 e5                	mov    %esp,%ebp
 773:	57                   	push   %edi
 774:	56                   	push   %esi
 775:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 776:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 779:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 77c:	8b 75 0c             	mov    0xc(%ebp),%esi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 77f:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 782:	89 45 d0             	mov    %eax,-0x30(%ebp)
 785:	0f b6 1e             	movzbl (%esi),%ebx
 788:	83 c6 01             	add    $0x1,%esi
 78b:	84 db                	test   %bl,%bl
 78d:	0f 84 b0 00 00 00    	je     843 <printf+0xd3>
 793:	31 d2                	xor    %edx,%edx
 795:	eb 39                	jmp    7d0 <printf+0x60>
 797:	89 f6                	mov    %esi,%esi
 799:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 7a0:	83 f8 25             	cmp    $0x25,%eax
 7a3:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
 7a6:	ba 25 00 00 00       	mov    $0x25,%edx
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 7ab:	74 18                	je     7c5 <printf+0x55>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 7ad:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 7b0:	83 ec 04             	sub    $0x4,%esp
 7b3:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 7b6:	6a 01                	push   $0x1
 7b8:	50                   	push   %eax
 7b9:	57                   	push   %edi
 7ba:	e8 69 fe ff ff       	call   628 <write>
 7bf:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 7c2:	83 c4 10             	add    $0x10,%esp
 7c5:	83 c6 01             	add    $0x1,%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 7c8:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 7cc:	84 db                	test   %bl,%bl
 7ce:	74 73                	je     843 <printf+0xd3>
    c = fmt[i] & 0xff;
    if(state == 0){
 7d0:	85 d2                	test   %edx,%edx
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
 7d2:	0f be cb             	movsbl %bl,%ecx
 7d5:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 7d8:	74 c6                	je     7a0 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 7da:	83 fa 25             	cmp    $0x25,%edx
 7dd:	75 e6                	jne    7c5 <printf+0x55>
      if(c == 'd'){
 7df:	83 f8 64             	cmp    $0x64,%eax
 7e2:	0f 84 f8 00 00 00    	je     8e0 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 7e8:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 7ee:	83 f9 70             	cmp    $0x70,%ecx
 7f1:	74 5d                	je     850 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 7f3:	83 f8 73             	cmp    $0x73,%eax
 7f6:	0f 84 84 00 00 00    	je     880 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 7fc:	83 f8 63             	cmp    $0x63,%eax
 7ff:	0f 84 ea 00 00 00    	je     8ef <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 805:	83 f8 25             	cmp    $0x25,%eax
 808:	0f 84 c2 00 00 00    	je     8d0 <printf+0x160>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 80e:	8d 45 e7             	lea    -0x19(%ebp),%eax
 811:	83 ec 04             	sub    $0x4,%esp
 814:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 818:	6a 01                	push   $0x1
 81a:	50                   	push   %eax
 81b:	57                   	push   %edi
 81c:	e8 07 fe ff ff       	call   628 <write>
 821:	83 c4 0c             	add    $0xc,%esp
 824:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 827:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 82a:	6a 01                	push   $0x1
 82c:	50                   	push   %eax
 82d:	57                   	push   %edi
 82e:	83 c6 01             	add    $0x1,%esi
 831:	e8 f2 fd ff ff       	call   628 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 836:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 83a:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 83d:	31 d2                	xor    %edx,%edx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 83f:	84 db                	test   %bl,%bl
 841:	75 8d                	jne    7d0 <printf+0x60>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 843:	8d 65 f4             	lea    -0xc(%ebp),%esp
 846:	5b                   	pop    %ebx
 847:	5e                   	pop    %esi
 848:	5f                   	pop    %edi
 849:	5d                   	pop    %ebp
 84a:	c3                   	ret    
 84b:	90                   	nop
 84c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 850:	83 ec 0c             	sub    $0xc,%esp
 853:	b9 10 00 00 00       	mov    $0x10,%ecx
 858:	6a 00                	push   $0x0
 85a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 85d:	89 f8                	mov    %edi,%eax
 85f:	8b 13                	mov    (%ebx),%edx
 861:	e8 6a fe ff ff       	call   6d0 <printint>
        ap++;
 866:	89 d8                	mov    %ebx,%eax
 868:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 86b:	31 d2                	xor    %edx,%edx
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
 86d:	83 c0 04             	add    $0x4,%eax
 870:	89 45 d0             	mov    %eax,-0x30(%ebp)
 873:	e9 4d ff ff ff       	jmp    7c5 <printf+0x55>
 878:	90                   	nop
 879:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
 880:	8b 45 d0             	mov    -0x30(%ebp),%eax
 883:	8b 18                	mov    (%eax),%ebx
        ap++;
 885:	83 c0 04             	add    $0x4,%eax
 888:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
          s = "(null)";
 88b:	b8 c6 0a 00 00       	mov    $0xac6,%eax
 890:	85 db                	test   %ebx,%ebx
 892:	0f 44 d8             	cmove  %eax,%ebx
        while(*s != 0){
 895:	0f b6 03             	movzbl (%ebx),%eax
 898:	84 c0                	test   %al,%al
 89a:	74 23                	je     8bf <printf+0x14f>
 89c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8a0:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 8a3:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 8a6:	83 ec 04             	sub    $0x4,%esp
 8a9:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
 8ab:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 8ae:	50                   	push   %eax
 8af:	57                   	push   %edi
 8b0:	e8 73 fd ff ff       	call   628 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 8b5:	0f b6 03             	movzbl (%ebx),%eax
 8b8:	83 c4 10             	add    $0x10,%esp
 8bb:	84 c0                	test   %al,%al
 8bd:	75 e1                	jne    8a0 <printf+0x130>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 8bf:	31 d2                	xor    %edx,%edx
 8c1:	e9 ff fe ff ff       	jmp    7c5 <printf+0x55>
 8c6:	8d 76 00             	lea    0x0(%esi),%esi
 8c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 8d0:	83 ec 04             	sub    $0x4,%esp
 8d3:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 8d6:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 8d9:	6a 01                	push   $0x1
 8db:	e9 4c ff ff ff       	jmp    82c <printf+0xbc>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 8e0:	83 ec 0c             	sub    $0xc,%esp
 8e3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 8e8:	6a 01                	push   $0x1
 8ea:	e9 6b ff ff ff       	jmp    85a <printf+0xea>
 8ef:	8b 5d d0             	mov    -0x30(%ebp),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 8f2:	83 ec 04             	sub    $0x4,%esp
 8f5:	8b 03                	mov    (%ebx),%eax
 8f7:	6a 01                	push   $0x1
 8f9:	88 45 e4             	mov    %al,-0x1c(%ebp)
 8fc:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 8ff:	50                   	push   %eax
 900:	57                   	push   %edi
 901:	e8 22 fd ff ff       	call   628 <write>
 906:	e9 5b ff ff ff       	jmp    866 <printf+0xf6>
 90b:	66 90                	xchg   %ax,%ax
 90d:	66 90                	xchg   %ax,%ax
 90f:	90                   	nop

00000910 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 910:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 911:	a1 e0 0e 00 00       	mov    0xee0,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 916:	89 e5                	mov    %esp,%ebp
 918:	57                   	push   %edi
 919:	56                   	push   %esi
 91a:	53                   	push   %ebx
 91b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 91e:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
 920:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 923:	39 c8                	cmp    %ecx,%eax
 925:	73 19                	jae    940 <free+0x30>
 927:	89 f6                	mov    %esi,%esi
 929:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 930:	39 d1                	cmp    %edx,%ecx
 932:	72 1c                	jb     950 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 934:	39 d0                	cmp    %edx,%eax
 936:	73 18                	jae    950 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
 938:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 93a:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 93c:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 93e:	72 f0                	jb     930 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 940:	39 d0                	cmp    %edx,%eax
 942:	72 f4                	jb     938 <free+0x28>
 944:	39 d1                	cmp    %edx,%ecx
 946:	73 f0                	jae    938 <free+0x28>
 948:	90                   	nop
 949:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
 950:	8b 73 fc             	mov    -0x4(%ebx),%esi
 953:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 956:	39 d7                	cmp    %edx,%edi
 958:	74 19                	je     973 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 95a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 95d:	8b 50 04             	mov    0x4(%eax),%edx
 960:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 963:	39 f1                	cmp    %esi,%ecx
 965:	74 23                	je     98a <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 967:	89 08                	mov    %ecx,(%eax)
  freep = p;
 969:	a3 e0 0e 00 00       	mov    %eax,0xee0
}
 96e:	5b                   	pop    %ebx
 96f:	5e                   	pop    %esi
 970:	5f                   	pop    %edi
 971:	5d                   	pop    %ebp
 972:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 973:	03 72 04             	add    0x4(%edx),%esi
 976:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 979:	8b 10                	mov    (%eax),%edx
 97b:	8b 12                	mov    (%edx),%edx
 97d:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 980:	8b 50 04             	mov    0x4(%eax),%edx
 983:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 986:	39 f1                	cmp    %esi,%ecx
 988:	75 dd                	jne    967 <free+0x57>
    p->s.size += bp->s.size;
 98a:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 98d:	a3 e0 0e 00 00       	mov    %eax,0xee0
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 992:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 995:	8b 53 f8             	mov    -0x8(%ebx),%edx
 998:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 99a:	5b                   	pop    %ebx
 99b:	5e                   	pop    %esi
 99c:	5f                   	pop    %edi
 99d:	5d                   	pop    %ebp
 99e:	c3                   	ret    
 99f:	90                   	nop

000009a0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 9a0:	55                   	push   %ebp
 9a1:	89 e5                	mov    %esp,%ebp
 9a3:	57                   	push   %edi
 9a4:	56                   	push   %esi
 9a5:	53                   	push   %ebx
 9a6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9a9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 9ac:	8b 15 e0 0e 00 00    	mov    0xee0,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9b2:	8d 78 07             	lea    0x7(%eax),%edi
 9b5:	c1 ef 03             	shr    $0x3,%edi
 9b8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 9bb:	85 d2                	test   %edx,%edx
 9bd:	0f 84 a3 00 00 00    	je     a66 <malloc+0xc6>
 9c3:	8b 02                	mov    (%edx),%eax
 9c5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 9c8:	39 cf                	cmp    %ecx,%edi
 9ca:	76 74                	jbe    a40 <malloc+0xa0>
 9cc:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 9d2:	be 00 10 00 00       	mov    $0x1000,%esi
 9d7:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
 9de:	0f 43 f7             	cmovae %edi,%esi
 9e1:	ba 00 80 00 00       	mov    $0x8000,%edx
 9e6:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
 9ec:	0f 46 da             	cmovbe %edx,%ebx
 9ef:	eb 10                	jmp    a01 <malloc+0x61>
 9f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9f8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 9fa:	8b 48 04             	mov    0x4(%eax),%ecx
 9fd:	39 cf                	cmp    %ecx,%edi
 9ff:	76 3f                	jbe    a40 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 a01:	39 05 e0 0e 00 00    	cmp    %eax,0xee0
 a07:	89 c2                	mov    %eax,%edx
 a09:	75 ed                	jne    9f8 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 a0b:	83 ec 0c             	sub    $0xc,%esp
 a0e:	53                   	push   %ebx
 a0f:	e8 7c fc ff ff       	call   690 <sbrk>
  if(p == (char*)-1)
 a14:	83 c4 10             	add    $0x10,%esp
 a17:	83 f8 ff             	cmp    $0xffffffff,%eax
 a1a:	74 1c                	je     a38 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 a1c:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
 a1f:	83 ec 0c             	sub    $0xc,%esp
 a22:	83 c0 08             	add    $0x8,%eax
 a25:	50                   	push   %eax
 a26:	e8 e5 fe ff ff       	call   910 <free>
  return freep;
 a2b:	8b 15 e0 0e 00 00    	mov    0xee0,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 a31:	83 c4 10             	add    $0x10,%esp
 a34:	85 d2                	test   %edx,%edx
 a36:	75 c0                	jne    9f8 <malloc+0x58>
        return 0;
 a38:	31 c0                	xor    %eax,%eax
 a3a:	eb 1c                	jmp    a58 <malloc+0xb8>
 a3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 a40:	39 cf                	cmp    %ecx,%edi
 a42:	74 1c                	je     a60 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 a44:	29 f9                	sub    %edi,%ecx
 a46:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 a49:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 a4c:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
 a4f:	89 15 e0 0e 00 00    	mov    %edx,0xee0
      return (void*)(p + 1);
 a55:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 a58:	8d 65 f4             	lea    -0xc(%ebp),%esp
 a5b:	5b                   	pop    %ebx
 a5c:	5e                   	pop    %esi
 a5d:	5f                   	pop    %edi
 a5e:	5d                   	pop    %ebp
 a5f:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 a60:	8b 08                	mov    (%eax),%ecx
 a62:	89 0a                	mov    %ecx,(%edx)
 a64:	eb e9                	jmp    a4f <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 a66:	c7 05 e0 0e 00 00 e4 	movl   $0xee4,0xee0
 a6d:	0e 00 00 
 a70:	c7 05 e4 0e 00 00 e4 	movl   $0xee4,0xee4
 a77:	0e 00 00 
    base.s.size = 0;
 a7a:	b8 e4 0e 00 00       	mov    $0xee4,%eax
 a7f:	c7 05 e8 0e 00 00 00 	movl   $0x0,0xee8
 a86:	00 00 00 
 a89:	e9 3e ff ff ff       	jmp    9cc <malloc+0x2c>
