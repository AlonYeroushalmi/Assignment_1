
_wc:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  printf(1, "%d %d %d %s\n", l, w, c, name);
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
  11:	be 01 00 00 00       	mov    $0x1,%esi
  16:	83 ec 18             	sub    $0x18,%esp
  19:	8b 01                	mov    (%ecx),%eax
  1b:	8b 59 04             	mov    0x4(%ecx),%ebx
  1e:	83 c3 04             	add    $0x4,%ebx
  int fd, i;

  if(argc <= 1){
  21:	83 f8 01             	cmp    $0x1,%eax
  printf(1, "%d %d %d %s\n", l, w, c, name);
}

int
main(int argc, char *argv[])
{
  24:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  int fd, i;

  if(argc <= 1){
  27:	7e 56                	jle    7f <main+0x7f>
  29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    wc(0, "");
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
  30:	83 ec 08             	sub    $0x8,%esp
  33:	6a 00                	push   $0x0
  35:	ff 33                	pushl  (%ebx)
  37:	e8 6c 04 00 00       	call   4a8 <open>
  3c:	83 c4 10             	add    $0x10,%esp
  3f:	85 c0                	test   %eax,%eax
  41:	89 c7                	mov    %eax,%edi
  43:	78 26                	js     6b <main+0x6b>
      printf(1, "wc: cannot open %s\n", argv[i]);
      exit();
    }
    wc(fd, argv[i]);
  45:	83 ec 08             	sub    $0x8,%esp
  48:	ff 33                	pushl  (%ebx)
  if(argc <= 1){
    wc(0, "");
    exit();
  }

  for(i = 1; i < argc; i++){
  4a:	83 c6 01             	add    $0x1,%esi
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "wc: cannot open %s\n", argv[i]);
      exit();
    }
    wc(fd, argv[i]);
  4d:	50                   	push   %eax
  4e:	83 c3 04             	add    $0x4,%ebx
  51:	e8 4a 00 00 00       	call   a0 <wc>
    close(fd);
  56:	89 3c 24             	mov    %edi,(%esp)
  59:	e8 32 04 00 00       	call   490 <close>
  if(argc <= 1){
    wc(0, "");
    exit();
  }

  for(i = 1; i < argc; i++){
  5e:	83 c4 10             	add    $0x10,%esp
  61:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
  64:	75 ca                	jne    30 <main+0x30>
      exit();
    }
    wc(fd, argv[i]);
    close(fd);
  }
  exit();
  66:	e8 fd 03 00 00       	call   468 <exit>
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "wc: cannot open %s\n", argv[i]);
  6b:	50                   	push   %eax
  6c:	ff 33                	pushl  (%ebx)
  6e:	68 13 09 00 00       	push   $0x913
  73:	6a 01                	push   $0x1
  75:	e8 56 05 00 00       	call   5d0 <printf>
      exit();
  7a:	e8 e9 03 00 00       	call   468 <exit>
main(int argc, char *argv[])
{
  int fd, i;

  if(argc <= 1){
    wc(0, "");
  7f:	52                   	push   %edx
  80:	52                   	push   %edx
  81:	68 05 09 00 00       	push   $0x905
  86:	6a 00                	push   $0x0
  88:	e8 13 00 00 00       	call   a0 <wc>
    exit();
  8d:	e8 d6 03 00 00       	call   468 <exit>
  92:	66 90                	xchg   %ax,%ax
  94:	66 90                	xchg   %ax,%ax
  96:	66 90                	xchg   %ax,%ax
  98:	66 90                	xchg   %ax,%ax
  9a:	66 90                	xchg   %ax,%ax
  9c:	66 90                	xchg   %ax,%ax
  9e:	66 90                	xchg   %ax,%ax

000000a0 <wc>:

char buf[512];

void
wc(int fd, char *name)
{
  a0:	55                   	push   %ebp
  a1:	89 e5                	mov    %esp,%ebp
  a3:	57                   	push   %edi
  a4:	56                   	push   %esi
  a5:	53                   	push   %ebx
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
  a6:	31 f6                	xor    %esi,%esi
wc(int fd, char *name)
{
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
  a8:	31 db                	xor    %ebx,%ebx

char buf[512];

void
wc(int fd, char *name)
{
  aa:	83 ec 1c             	sub    $0x1c,%esp
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
  ad:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  b4:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  bb:	90                   	nop
  bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
  c0:	83 ec 04             	sub    $0x4,%esp
  c3:	68 00 02 00 00       	push   $0x200
  c8:	68 c0 0c 00 00       	push   $0xcc0
  cd:	ff 75 08             	pushl  0x8(%ebp)
  d0:	e8 ab 03 00 00       	call   480 <read>
  d5:	83 c4 10             	add    $0x10,%esp
  d8:	83 f8 00             	cmp    $0x0,%eax
  db:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  de:	7e 5f                	jle    13f <wc+0x9f>
  e0:	31 ff                	xor    %edi,%edi
  e2:	eb 0e                	jmp    f2 <wc+0x52>
  e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    for(i=0; i<n; i++){
      c++;
      if(buf[i] == '\n')
        l++;
      if(strchr(" \r\t\n\v", buf[i]))
        inword = 0;
  e8:	31 f6                	xor    %esi,%esi
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i=0; i<n; i++){
  ea:	83 c7 01             	add    $0x1,%edi
  ed:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
  f0:	74 3a                	je     12c <wc+0x8c>
      c++;
      if(buf[i] == '\n')
  f2:	0f be 87 c0 0c 00 00 	movsbl 0xcc0(%edi),%eax
        l++;
  f9:	31 c9                	xor    %ecx,%ecx
  fb:	3c 0a                	cmp    $0xa,%al
  fd:	0f 94 c1             	sete   %cl
      if(strchr(" \r\t\n\v", buf[i]))
 100:	83 ec 08             	sub    $0x8,%esp
 103:	50                   	push   %eax
 104:	68 f0 08 00 00       	push   $0x8f0
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i=0; i<n; i++){
      c++;
      if(buf[i] == '\n')
        l++;
 109:	01 cb                	add    %ecx,%ebx
      if(strchr(" \r\t\n\v", buf[i]))
 10b:	e8 d0 01 00 00       	call   2e0 <strchr>
 110:	83 c4 10             	add    $0x10,%esp
 113:	85 c0                	test   %eax,%eax
 115:	75 d1                	jne    e8 <wc+0x48>
        inword = 0;
      else if(!inword){
 117:	85 f6                	test   %esi,%esi
 119:	75 1d                	jne    138 <wc+0x98>
        w++;
 11b:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i=0; i<n; i++){
 11f:	83 c7 01             	add    $0x1,%edi
 122:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
        l++;
      if(strchr(" \r\t\n\v", buf[i]))
        inword = 0;
      else if(!inword){
        w++;
        inword = 1;
 125:	be 01 00 00 00       	mov    $0x1,%esi
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i=0; i<n; i++){
 12a:	75 c6                	jne    f2 <wc+0x52>
 12c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 12f:	01 55 dc             	add    %edx,-0x24(%ebp)
 132:	eb 8c                	jmp    c0 <wc+0x20>
 134:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 138:	be 01 00 00 00       	mov    $0x1,%esi
 13d:	eb ab                	jmp    ea <wc+0x4a>
        w++;
        inword = 1;
      }
    }
  }
  if(n < 0){
 13f:	75 24                	jne    165 <wc+0xc5>
    printf(1, "wc: read error\n");
    exit();
  }
  printf(1, "%d %d %d %s\n", l, w, c, name);
 141:	83 ec 08             	sub    $0x8,%esp
 144:	ff 75 0c             	pushl  0xc(%ebp)
 147:	ff 75 dc             	pushl  -0x24(%ebp)
 14a:	ff 75 e0             	pushl  -0x20(%ebp)
 14d:	53                   	push   %ebx
 14e:	68 06 09 00 00       	push   $0x906
 153:	6a 01                	push   $0x1
 155:	e8 76 04 00 00       	call   5d0 <printf>
}
 15a:	83 c4 20             	add    $0x20,%esp
 15d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 160:	5b                   	pop    %ebx
 161:	5e                   	pop    %esi
 162:	5f                   	pop    %edi
 163:	5d                   	pop    %ebp
 164:	c3                   	ret    
        inword = 1;
      }
    }
  }
  if(n < 0){
    printf(1, "wc: read error\n");
 165:	83 ec 08             	sub    $0x8,%esp
 168:	68 f6 08 00 00       	push   $0x8f6
 16d:	6a 01                	push   $0x1
 16f:	e8 5c 04 00 00       	call   5d0 <printf>
    exit();
 174:	e8 ef 02 00 00       	call   468 <exit>
 179:	66 90                	xchg   %ax,%ax
 17b:	66 90                	xchg   %ax,%ax
 17d:	66 90                	xchg   %ax,%ax
 17f:	90                   	nop

00000180 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	53                   	push   %ebx
 184:	8b 45 08             	mov    0x8(%ebp),%eax
 187:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 18a:	89 c2                	mov    %eax,%edx
 18c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 190:	83 c1 01             	add    $0x1,%ecx
 193:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 197:	83 c2 01             	add    $0x1,%edx
 19a:	84 db                	test   %bl,%bl
 19c:	88 5a ff             	mov    %bl,-0x1(%edx)
 19f:	75 ef                	jne    190 <strcpy+0x10>
    ;
  return os;
}
 1a1:	5b                   	pop    %ebx
 1a2:	5d                   	pop    %ebp
 1a3:	c3                   	ret    
 1a4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1aa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000001b0 <strncpy>:

char* strncpy(char* s, char* t, int n) {
 1b0:	55                   	push   %ebp
  int i = 0;
 1b1:	31 d2                	xor    %edx,%edx
  while((*s++ = *t++) != 0)
    ;
  return os;
}

char* strncpy(char* s, char* t, int n) {
 1b3:	89 e5                	mov    %esp,%ebp
 1b5:	56                   	push   %esi
 1b6:	53                   	push   %ebx
 1b7:	8b 45 08             	mov    0x8(%ebp),%eax
 1ba:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 1bd:	8b 75 10             	mov    0x10(%ebp),%esi
  int i = 0;
  char *os;
  os = s;
  while(((*s++ = *t++) != 0) && (++i < n));
 1c0:	eb 0d                	jmp    1cf <strncpy+0x1f>
 1c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1c8:	83 c2 01             	add    $0x1,%edx
 1cb:	39 f2                	cmp    %esi,%edx
 1cd:	7d 0b                	jge    1da <strncpy+0x2a>
 1cf:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
 1d3:	84 c9                	test   %cl,%cl
 1d5:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 1d8:	75 ee                	jne    1c8 <strncpy+0x18>
  return os;
}
 1da:	5b                   	pop    %ebx
 1db:	5e                   	pop    %esi
 1dc:	5d                   	pop    %ebp
 1dd:	c3                   	ret    
 1de:	66 90                	xchg   %ax,%ax

000001e0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	56                   	push   %esi
 1e4:	53                   	push   %ebx
 1e5:	8b 55 08             	mov    0x8(%ebp),%edx
 1e8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 1eb:	0f b6 02             	movzbl (%edx),%eax
 1ee:	0f b6 19             	movzbl (%ecx),%ebx
 1f1:	84 c0                	test   %al,%al
 1f3:	75 1e                	jne    213 <strcmp+0x33>
 1f5:	eb 29                	jmp    220 <strcmp+0x40>
 1f7:	89 f6                	mov    %esi,%esi
 1f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 200:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 203:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 206:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 209:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 20d:	84 c0                	test   %al,%al
 20f:	74 0f                	je     220 <strcmp+0x40>
 211:	89 f1                	mov    %esi,%ecx
 213:	38 d8                	cmp    %bl,%al
 215:	74 e9                	je     200 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 217:	29 d8                	sub    %ebx,%eax
}
 219:	5b                   	pop    %ebx
 21a:	5e                   	pop    %esi
 21b:	5d                   	pop    %ebp
 21c:	c3                   	ret    
 21d:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 220:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
 222:	29 d8                	sub    %ebx,%eax
}
 224:	5b                   	pop    %ebx
 225:	5e                   	pop    %esi
 226:	5d                   	pop    %ebp
 227:	c3                   	ret    
 228:	90                   	nop
 229:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000230 <strncmp>:

int strncmp(const char *p, const char *q, int n) {
 230:	55                   	push   %ebp
 231:	89 e5                	mov    %esp,%ebp
 233:	57                   	push   %edi
 234:	56                   	push   %esi
 235:	53                   	push   %ebx
 236:	8b 5d 10             	mov    0x10(%ebp),%ebx
 239:	8b 75 08             	mov    0x8(%ebp),%esi
 23c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  int i = 0;
  while(i < n && *p == *q)
 23f:	85 db                	test   %ebx,%ebx
 241:	7e 28                	jle    26b <strncmp+0x3b>
 243:	0f b6 16             	movzbl (%esi),%edx
 246:	0f b6 0f             	movzbl (%edi),%ecx
 249:	38 d1                	cmp    %dl,%cl
 24b:	75 2b                	jne    278 <strncmp+0x48>
 24d:	31 c0                	xor    %eax,%eax
 24f:	eb 13                	jmp    264 <strncmp+0x34>
 251:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 258:	0f b6 14 06          	movzbl (%esi,%eax,1),%edx
 25c:	0f b6 0c 07          	movzbl (%edi,%eax,1),%ecx
 260:	38 ca                	cmp    %cl,%dl
 262:	75 14                	jne    278 <strncmp+0x48>
    p++, q++, i++;
 264:	83 c0 01             	add    $0x1,%eax
  return (uchar)*p - (uchar)*q;
}

int strncmp(const char *p, const char *q, int n) {
  int i = 0;
  while(i < n && *p == *q)
 267:	39 c3                	cmp    %eax,%ebx
 269:	75 ed                	jne    258 <strncmp+0x28>
    p++, q++, i++;
  if (i < n)
    return (uchar)*p - (uchar)*q;
  else
    return 0;
}
 26b:	5b                   	pop    %ebx
  while(i < n && *p == *q)
    p++, q++, i++;
  if (i < n)
    return (uchar)*p - (uchar)*q;
  else
    return 0;
 26c:	31 c0                	xor    %eax,%eax
}
 26e:	5e                   	pop    %esi
 26f:	5f                   	pop    %edi
 270:	5d                   	pop    %ebp
 271:	c3                   	ret    
 272:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
int strncmp(const char *p, const char *q, int n) {
  int i = 0;
  while(i < n && *p == *q)
    p++, q++, i++;
  if (i < n)
    return (uchar)*p - (uchar)*q;
 278:	0f b6 c2             	movzbl %dl,%eax
  else
    return 0;
}
 27b:	5b                   	pop    %ebx
int strncmp(const char *p, const char *q, int n) {
  int i = 0;
  while(i < n && *p == *q)
    p++, q++, i++;
  if (i < n)
    return (uchar)*p - (uchar)*q;
 27c:	29 c8                	sub    %ecx,%eax
  else
    return 0;
}
 27e:	5e                   	pop    %esi
 27f:	5f                   	pop    %edi
 280:	5d                   	pop    %ebp
 281:	c3                   	ret    
 282:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 289:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000290 <strlen>:

uint
strlen(char *s)
{
 290:	55                   	push   %ebp
 291:	89 e5                	mov    %esp,%ebp
 293:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 296:	80 39 00             	cmpb   $0x0,(%ecx)
 299:	74 12                	je     2ad <strlen+0x1d>
 29b:	31 d2                	xor    %edx,%edx
 29d:	8d 76 00             	lea    0x0(%esi),%esi
 2a0:	83 c2 01             	add    $0x1,%edx
 2a3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 2a7:	89 d0                	mov    %edx,%eax
 2a9:	75 f5                	jne    2a0 <strlen+0x10>
    ;
  return n;
}
 2ab:	5d                   	pop    %ebp
 2ac:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 2ad:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
 2af:	5d                   	pop    %ebp
 2b0:	c3                   	ret    
 2b1:	eb 0d                	jmp    2c0 <memset>
 2b3:	90                   	nop
 2b4:	90                   	nop
 2b5:	90                   	nop
 2b6:	90                   	nop
 2b7:	90                   	nop
 2b8:	90                   	nop
 2b9:	90                   	nop
 2ba:	90                   	nop
 2bb:	90                   	nop
 2bc:	90                   	nop
 2bd:	90                   	nop
 2be:	90                   	nop
 2bf:	90                   	nop

000002c0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 2c0:	55                   	push   %ebp
 2c1:	89 e5                	mov    %esp,%ebp
 2c3:	57                   	push   %edi
 2c4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 2c7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 2ca:	8b 45 0c             	mov    0xc(%ebp),%eax
 2cd:	89 d7                	mov    %edx,%edi
 2cf:	fc                   	cld    
 2d0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 2d2:	89 d0                	mov    %edx,%eax
 2d4:	5f                   	pop    %edi
 2d5:	5d                   	pop    %ebp
 2d6:	c3                   	ret    
 2d7:	89 f6                	mov    %esi,%esi
 2d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002e0 <strchr>:

char*
strchr(const char *s, char c)
{
 2e0:	55                   	push   %ebp
 2e1:	89 e5                	mov    %esp,%ebp
 2e3:	53                   	push   %ebx
 2e4:	8b 45 08             	mov    0x8(%ebp),%eax
 2e7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 2ea:	0f b6 10             	movzbl (%eax),%edx
 2ed:	84 d2                	test   %dl,%dl
 2ef:	74 1d                	je     30e <strchr+0x2e>
    if(*s == c)
 2f1:	38 d3                	cmp    %dl,%bl
 2f3:	89 d9                	mov    %ebx,%ecx
 2f5:	75 0d                	jne    304 <strchr+0x24>
 2f7:	eb 17                	jmp    310 <strchr+0x30>
 2f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 300:	38 ca                	cmp    %cl,%dl
 302:	74 0c                	je     310 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 304:	83 c0 01             	add    $0x1,%eax
 307:	0f b6 10             	movzbl (%eax),%edx
 30a:	84 d2                	test   %dl,%dl
 30c:	75 f2                	jne    300 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
 30e:	31 c0                	xor    %eax,%eax
}
 310:	5b                   	pop    %ebx
 311:	5d                   	pop    %ebp
 312:	c3                   	ret    
 313:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 319:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000320 <gets>:

char*
gets(char *buf, int max)
{
 320:	55                   	push   %ebp
 321:	89 e5                	mov    %esp,%ebp
 323:	57                   	push   %edi
 324:	56                   	push   %esi
 325:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 326:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
 328:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
 32b:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 32e:	eb 29                	jmp    359 <gets+0x39>
    cc = read(0, &c, 1);
 330:	83 ec 04             	sub    $0x4,%esp
 333:	6a 01                	push   $0x1
 335:	57                   	push   %edi
 336:	6a 00                	push   $0x0
 338:	e8 43 01 00 00       	call   480 <read>
    if(cc < 1)
 33d:	83 c4 10             	add    $0x10,%esp
 340:	85 c0                	test   %eax,%eax
 342:	7e 1d                	jle    361 <gets+0x41>
      break;
    buf[i++] = c;
 344:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 348:	8b 55 08             	mov    0x8(%ebp),%edx
 34b:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
 34d:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 34f:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 353:	74 1b                	je     370 <gets+0x50>
 355:	3c 0d                	cmp    $0xd,%al
 357:	74 17                	je     370 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 359:	8d 5e 01             	lea    0x1(%esi),%ebx
 35c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 35f:	7c cf                	jl     330 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 361:	8b 45 08             	mov    0x8(%ebp),%eax
 364:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 368:	8d 65 f4             	lea    -0xc(%ebp),%esp
 36b:	5b                   	pop    %ebx
 36c:	5e                   	pop    %esi
 36d:	5f                   	pop    %edi
 36e:	5d                   	pop    %ebp
 36f:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 370:	8b 45 08             	mov    0x8(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 373:	89 de                	mov    %ebx,%esi
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 375:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 379:	8d 65 f4             	lea    -0xc(%ebp),%esp
 37c:	5b                   	pop    %ebx
 37d:	5e                   	pop    %esi
 37e:	5f                   	pop    %edi
 37f:	5d                   	pop    %ebp
 380:	c3                   	ret    
 381:	eb 0d                	jmp    390 <stat>
 383:	90                   	nop
 384:	90                   	nop
 385:	90                   	nop
 386:	90                   	nop
 387:	90                   	nop
 388:	90                   	nop
 389:	90                   	nop
 38a:	90                   	nop
 38b:	90                   	nop
 38c:	90                   	nop
 38d:	90                   	nop
 38e:	90                   	nop
 38f:	90                   	nop

00000390 <stat>:

int
stat(char *n, struct stat *st)
{
 390:	55                   	push   %ebp
 391:	89 e5                	mov    %esp,%ebp
 393:	56                   	push   %esi
 394:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 395:	83 ec 08             	sub    $0x8,%esp
 398:	6a 00                	push   $0x0
 39a:	ff 75 08             	pushl  0x8(%ebp)
 39d:	e8 06 01 00 00       	call   4a8 <open>
  if(fd < 0)
 3a2:	83 c4 10             	add    $0x10,%esp
 3a5:	85 c0                	test   %eax,%eax
 3a7:	78 27                	js     3d0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 3a9:	83 ec 08             	sub    $0x8,%esp
 3ac:	ff 75 0c             	pushl  0xc(%ebp)
 3af:	89 c3                	mov    %eax,%ebx
 3b1:	50                   	push   %eax
 3b2:	e8 09 01 00 00       	call   4c0 <fstat>
 3b7:	89 c6                	mov    %eax,%esi
  close(fd);
 3b9:	89 1c 24             	mov    %ebx,(%esp)
 3bc:	e8 cf 00 00 00       	call   490 <close>
  return r;
 3c1:	83 c4 10             	add    $0x10,%esp
 3c4:	89 f0                	mov    %esi,%eax
}
 3c6:	8d 65 f8             	lea    -0x8(%ebp),%esp
 3c9:	5b                   	pop    %ebx
 3ca:	5e                   	pop    %esi
 3cb:	5d                   	pop    %ebp
 3cc:	c3                   	ret    
 3cd:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 3d0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 3d5:	eb ef                	jmp    3c6 <stat+0x36>
 3d7:	89 f6                	mov    %esi,%esi
 3d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000003e0 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 3e0:	55                   	push   %ebp
 3e1:	89 e5                	mov    %esp,%ebp
 3e3:	53                   	push   %ebx
 3e4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 3e7:	0f be 11             	movsbl (%ecx),%edx
 3ea:	8d 42 d0             	lea    -0x30(%edx),%eax
 3ed:	3c 09                	cmp    $0x9,%al
 3ef:	b8 00 00 00 00       	mov    $0x0,%eax
 3f4:	77 1f                	ja     415 <atoi+0x35>
 3f6:	8d 76 00             	lea    0x0(%esi),%esi
 3f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 400:	8d 04 80             	lea    (%eax,%eax,4),%eax
 403:	83 c1 01             	add    $0x1,%ecx
 406:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 40a:	0f be 11             	movsbl (%ecx),%edx
 40d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 410:	80 fb 09             	cmp    $0x9,%bl
 413:	76 eb                	jbe    400 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
 415:	5b                   	pop    %ebx
 416:	5d                   	pop    %ebp
 417:	c3                   	ret    
 418:	90                   	nop
 419:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000420 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 420:	55                   	push   %ebp
 421:	89 e5                	mov    %esp,%ebp
 423:	56                   	push   %esi
 424:	53                   	push   %ebx
 425:	8b 5d 10             	mov    0x10(%ebp),%ebx
 428:	8b 45 08             	mov    0x8(%ebp),%eax
 42b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 42e:	85 db                	test   %ebx,%ebx
 430:	7e 14                	jle    446 <memmove+0x26>
 432:	31 d2                	xor    %edx,%edx
 434:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 438:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 43c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 43f:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 442:	39 da                	cmp    %ebx,%edx
 444:	75 f2                	jne    438 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 446:	5b                   	pop    %ebx
 447:	5e                   	pop    %esi
 448:	5d                   	pop    %ebp
 449:	c3                   	ret    
 44a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000450 <max>:

int max(int a, int b) {
 450:	55                   	push   %ebp
 451:	89 e5                	mov    %esp,%ebp
 453:	8b 55 08             	mov    0x8(%ebp),%edx
 456:	8b 45 0c             	mov    0xc(%ebp),%eax
  if (b > a) return b;
  else return a;
}
 459:	5d                   	pop    %ebp
 45a:	39 d0                	cmp    %edx,%eax
 45c:	0f 4c c2             	cmovl  %edx,%eax
 45f:	c3                   	ret    

00000460 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 460:	b8 01 00 00 00       	mov    $0x1,%eax
 465:	cd 40                	int    $0x40
 467:	c3                   	ret    

00000468 <exit>:
SYSCALL(exit)
 468:	b8 02 00 00 00       	mov    $0x2,%eax
 46d:	cd 40                	int    $0x40
 46f:	c3                   	ret    

00000470 <wait>:
SYSCALL(wait)
 470:	b8 03 00 00 00       	mov    $0x3,%eax
 475:	cd 40                	int    $0x40
 477:	c3                   	ret    

00000478 <pipe>:
SYSCALL(pipe)
 478:	b8 04 00 00 00       	mov    $0x4,%eax
 47d:	cd 40                	int    $0x40
 47f:	c3                   	ret    

00000480 <read>:
SYSCALL(read)
 480:	b8 05 00 00 00       	mov    $0x5,%eax
 485:	cd 40                	int    $0x40
 487:	c3                   	ret    

00000488 <write>:
SYSCALL(write)
 488:	b8 10 00 00 00       	mov    $0x10,%eax
 48d:	cd 40                	int    $0x40
 48f:	c3                   	ret    

00000490 <close>:
SYSCALL(close)
 490:	b8 15 00 00 00       	mov    $0x15,%eax
 495:	cd 40                	int    $0x40
 497:	c3                   	ret    

00000498 <kill>:
SYSCALL(kill)
 498:	b8 06 00 00 00       	mov    $0x6,%eax
 49d:	cd 40                	int    $0x40
 49f:	c3                   	ret    

000004a0 <exec>:
SYSCALL(exec)
 4a0:	b8 07 00 00 00       	mov    $0x7,%eax
 4a5:	cd 40                	int    $0x40
 4a7:	c3                   	ret    

000004a8 <open>:
SYSCALL(open)
 4a8:	b8 0f 00 00 00       	mov    $0xf,%eax
 4ad:	cd 40                	int    $0x40
 4af:	c3                   	ret    

000004b0 <mknod>:
SYSCALL(mknod)
 4b0:	b8 11 00 00 00       	mov    $0x11,%eax
 4b5:	cd 40                	int    $0x40
 4b7:	c3                   	ret    

000004b8 <unlink>:
SYSCALL(unlink)
 4b8:	b8 12 00 00 00       	mov    $0x12,%eax
 4bd:	cd 40                	int    $0x40
 4bf:	c3                   	ret    

000004c0 <fstat>:
SYSCALL(fstat)
 4c0:	b8 08 00 00 00       	mov    $0x8,%eax
 4c5:	cd 40                	int    $0x40
 4c7:	c3                   	ret    

000004c8 <link>:
SYSCALL(link)
 4c8:	b8 13 00 00 00       	mov    $0x13,%eax
 4cd:	cd 40                	int    $0x40
 4cf:	c3                   	ret    

000004d0 <mkdir>:
SYSCALL(mkdir)
 4d0:	b8 14 00 00 00       	mov    $0x14,%eax
 4d5:	cd 40                	int    $0x40
 4d7:	c3                   	ret    

000004d8 <chdir>:
SYSCALL(chdir)
 4d8:	b8 09 00 00 00       	mov    $0x9,%eax
 4dd:	cd 40                	int    $0x40
 4df:	c3                   	ret    

000004e0 <dup>:
SYSCALL(dup)
 4e0:	b8 0a 00 00 00       	mov    $0xa,%eax
 4e5:	cd 40                	int    $0x40
 4e7:	c3                   	ret    

000004e8 <getpid>:
SYSCALL(getpid)
 4e8:	b8 0b 00 00 00       	mov    $0xb,%eax
 4ed:	cd 40                	int    $0x40
 4ef:	c3                   	ret    

000004f0 <sbrk>:
SYSCALL(sbrk)
 4f0:	b8 0c 00 00 00       	mov    $0xc,%eax
 4f5:	cd 40                	int    $0x40
 4f7:	c3                   	ret    

000004f8 <sleep>:
SYSCALL(sleep)
 4f8:	b8 0d 00 00 00       	mov    $0xd,%eax
 4fd:	cd 40                	int    $0x40
 4ff:	c3                   	ret    

00000500 <uptime>:
SYSCALL(uptime)
 500:	b8 0e 00 00 00       	mov    $0xe,%eax
 505:	cd 40                	int    $0x40
 507:	c3                   	ret    

00000508 <setVariable>:
SYSCALL(setVariable)
 508:	b8 17 00 00 00       	mov    $0x17,%eax
 50d:	cd 40                	int    $0x40
 50f:	c3                   	ret    

00000510 <getVariable>:
SYSCALL(getVariable)
 510:	b8 18 00 00 00       	mov    $0x18,%eax
 515:	cd 40                	int    $0x40
 517:	c3                   	ret    

00000518 <remVariable>:
SYSCALL(remVariable)
 518:	b8 19 00 00 00       	mov    $0x19,%eax
 51d:	cd 40                	int    $0x40
 51f:	c3                   	ret    

00000520 <wait2>:
SYSCALL(wait2)
 520:	b8 1a 00 00 00       	mov    $0x1a,%eax
 525:	cd 40                	int    $0x40
 527:	c3                   	ret    
 528:	66 90                	xchg   %ax,%ax
 52a:	66 90                	xchg   %ax,%ax
 52c:	66 90                	xchg   %ax,%ax
 52e:	66 90                	xchg   %ax,%ax

00000530 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 530:	55                   	push   %ebp
 531:	89 e5                	mov    %esp,%ebp
 533:	57                   	push   %edi
 534:	56                   	push   %esi
 535:	53                   	push   %ebx
 536:	89 c6                	mov    %eax,%esi
 538:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 53b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 53e:	85 db                	test   %ebx,%ebx
 540:	74 7e                	je     5c0 <printint+0x90>
 542:	89 d0                	mov    %edx,%eax
 544:	c1 e8 1f             	shr    $0x1f,%eax
 547:	84 c0                	test   %al,%al
 549:	74 75                	je     5c0 <printint+0x90>
    neg = 1;
    x = -xx;
 54b:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 54d:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
 554:	f7 d8                	neg    %eax
 556:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 559:	31 ff                	xor    %edi,%edi
 55b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 55e:	89 ce                	mov    %ecx,%esi
 560:	eb 08                	jmp    56a <printint+0x3a>
 562:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 568:	89 cf                	mov    %ecx,%edi
 56a:	31 d2                	xor    %edx,%edx
 56c:	8d 4f 01             	lea    0x1(%edi),%ecx
 56f:	f7 f6                	div    %esi
 571:	0f b6 92 30 09 00 00 	movzbl 0x930(%edx),%edx
  }while((x /= base) != 0);
 578:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 57a:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 57d:	75 e9                	jne    568 <printint+0x38>
  if(neg)
 57f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 582:	8b 75 c0             	mov    -0x40(%ebp),%esi
 585:	85 c0                	test   %eax,%eax
 587:	74 08                	je     591 <printint+0x61>
    buf[i++] = '-';
 589:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
 58e:	8d 4f 02             	lea    0x2(%edi),%ecx
 591:	8d 7c 0d d7          	lea    -0x29(%ebp,%ecx,1),%edi
 595:	8d 76 00             	lea    0x0(%esi),%esi
 598:	0f b6 07             	movzbl (%edi),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 59b:	83 ec 04             	sub    $0x4,%esp
 59e:	83 ef 01             	sub    $0x1,%edi
 5a1:	6a 01                	push   $0x1
 5a3:	53                   	push   %ebx
 5a4:	56                   	push   %esi
 5a5:	88 45 d7             	mov    %al,-0x29(%ebp)
 5a8:	e8 db fe ff ff       	call   488 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 5ad:	83 c4 10             	add    $0x10,%esp
 5b0:	39 df                	cmp    %ebx,%edi
 5b2:	75 e4                	jne    598 <printint+0x68>
    putc(fd, buf[i]);
}
 5b4:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5b7:	5b                   	pop    %ebx
 5b8:	5e                   	pop    %esi
 5b9:	5f                   	pop    %edi
 5ba:	5d                   	pop    %ebp
 5bb:	c3                   	ret    
 5bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 5c0:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 5c2:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 5c9:	eb 8b                	jmp    556 <printint+0x26>
 5cb:	90                   	nop
 5cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000005d0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 5d0:	55                   	push   %ebp
 5d1:	89 e5                	mov    %esp,%ebp
 5d3:	57                   	push   %edi
 5d4:	56                   	push   %esi
 5d5:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5d6:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 5d9:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5dc:	8b 75 0c             	mov    0xc(%ebp),%esi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 5df:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5e2:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5e5:	0f b6 1e             	movzbl (%esi),%ebx
 5e8:	83 c6 01             	add    $0x1,%esi
 5eb:	84 db                	test   %bl,%bl
 5ed:	0f 84 b0 00 00 00    	je     6a3 <printf+0xd3>
 5f3:	31 d2                	xor    %edx,%edx
 5f5:	eb 39                	jmp    630 <printf+0x60>
 5f7:	89 f6                	mov    %esi,%esi
 5f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 600:	83 f8 25             	cmp    $0x25,%eax
 603:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
 606:	ba 25 00 00 00       	mov    $0x25,%edx
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 60b:	74 18                	je     625 <printf+0x55>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 60d:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 610:	83 ec 04             	sub    $0x4,%esp
 613:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 616:	6a 01                	push   $0x1
 618:	50                   	push   %eax
 619:	57                   	push   %edi
 61a:	e8 69 fe ff ff       	call   488 <write>
 61f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 622:	83 c4 10             	add    $0x10,%esp
 625:	83 c6 01             	add    $0x1,%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 628:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 62c:	84 db                	test   %bl,%bl
 62e:	74 73                	je     6a3 <printf+0xd3>
    c = fmt[i] & 0xff;
    if(state == 0){
 630:	85 d2                	test   %edx,%edx
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
 632:	0f be cb             	movsbl %bl,%ecx
 635:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 638:	74 c6                	je     600 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 63a:	83 fa 25             	cmp    $0x25,%edx
 63d:	75 e6                	jne    625 <printf+0x55>
      if(c == 'd'){
 63f:	83 f8 64             	cmp    $0x64,%eax
 642:	0f 84 f8 00 00 00    	je     740 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 648:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 64e:	83 f9 70             	cmp    $0x70,%ecx
 651:	74 5d                	je     6b0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 653:	83 f8 73             	cmp    $0x73,%eax
 656:	0f 84 84 00 00 00    	je     6e0 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 65c:	83 f8 63             	cmp    $0x63,%eax
 65f:	0f 84 ea 00 00 00    	je     74f <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 665:	83 f8 25             	cmp    $0x25,%eax
 668:	0f 84 c2 00 00 00    	je     730 <printf+0x160>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 66e:	8d 45 e7             	lea    -0x19(%ebp),%eax
 671:	83 ec 04             	sub    $0x4,%esp
 674:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 678:	6a 01                	push   $0x1
 67a:	50                   	push   %eax
 67b:	57                   	push   %edi
 67c:	e8 07 fe ff ff       	call   488 <write>
 681:	83 c4 0c             	add    $0xc,%esp
 684:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 687:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 68a:	6a 01                	push   $0x1
 68c:	50                   	push   %eax
 68d:	57                   	push   %edi
 68e:	83 c6 01             	add    $0x1,%esi
 691:	e8 f2 fd ff ff       	call   488 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 696:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 69a:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 69d:	31 d2                	xor    %edx,%edx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 69f:	84 db                	test   %bl,%bl
 6a1:	75 8d                	jne    630 <printf+0x60>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 6a3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6a6:	5b                   	pop    %ebx
 6a7:	5e                   	pop    %esi
 6a8:	5f                   	pop    %edi
 6a9:	5d                   	pop    %ebp
 6aa:	c3                   	ret    
 6ab:	90                   	nop
 6ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 6b0:	83 ec 0c             	sub    $0xc,%esp
 6b3:	b9 10 00 00 00       	mov    $0x10,%ecx
 6b8:	6a 00                	push   $0x0
 6ba:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 6bd:	89 f8                	mov    %edi,%eax
 6bf:	8b 13                	mov    (%ebx),%edx
 6c1:	e8 6a fe ff ff       	call   530 <printint>
        ap++;
 6c6:	89 d8                	mov    %ebx,%eax
 6c8:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 6cb:	31 d2                	xor    %edx,%edx
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
 6cd:	83 c0 04             	add    $0x4,%eax
 6d0:	89 45 d0             	mov    %eax,-0x30(%ebp)
 6d3:	e9 4d ff ff ff       	jmp    625 <printf+0x55>
 6d8:	90                   	nop
 6d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
 6e0:	8b 45 d0             	mov    -0x30(%ebp),%eax
 6e3:	8b 18                	mov    (%eax),%ebx
        ap++;
 6e5:	83 c0 04             	add    $0x4,%eax
 6e8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
          s = "(null)";
 6eb:	b8 27 09 00 00       	mov    $0x927,%eax
 6f0:	85 db                	test   %ebx,%ebx
 6f2:	0f 44 d8             	cmove  %eax,%ebx
        while(*s != 0){
 6f5:	0f b6 03             	movzbl (%ebx),%eax
 6f8:	84 c0                	test   %al,%al
 6fa:	74 23                	je     71f <printf+0x14f>
 6fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 700:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 703:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 706:	83 ec 04             	sub    $0x4,%esp
 709:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
 70b:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 70e:	50                   	push   %eax
 70f:	57                   	push   %edi
 710:	e8 73 fd ff ff       	call   488 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 715:	0f b6 03             	movzbl (%ebx),%eax
 718:	83 c4 10             	add    $0x10,%esp
 71b:	84 c0                	test   %al,%al
 71d:	75 e1                	jne    700 <printf+0x130>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 71f:	31 d2                	xor    %edx,%edx
 721:	e9 ff fe ff ff       	jmp    625 <printf+0x55>
 726:	8d 76 00             	lea    0x0(%esi),%esi
 729:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 730:	83 ec 04             	sub    $0x4,%esp
 733:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 736:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 739:	6a 01                	push   $0x1
 73b:	e9 4c ff ff ff       	jmp    68c <printf+0xbc>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 740:	83 ec 0c             	sub    $0xc,%esp
 743:	b9 0a 00 00 00       	mov    $0xa,%ecx
 748:	6a 01                	push   $0x1
 74a:	e9 6b ff ff ff       	jmp    6ba <printf+0xea>
 74f:	8b 5d d0             	mov    -0x30(%ebp),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 752:	83 ec 04             	sub    $0x4,%esp
 755:	8b 03                	mov    (%ebx),%eax
 757:	6a 01                	push   $0x1
 759:	88 45 e4             	mov    %al,-0x1c(%ebp)
 75c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 75f:	50                   	push   %eax
 760:	57                   	push   %edi
 761:	e8 22 fd ff ff       	call   488 <write>
 766:	e9 5b ff ff ff       	jmp    6c6 <printf+0xf6>
 76b:	66 90                	xchg   %ax,%ax
 76d:	66 90                	xchg   %ax,%ax
 76f:	90                   	nop

00000770 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 770:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 771:	a1 a0 0c 00 00       	mov    0xca0,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 776:	89 e5                	mov    %esp,%ebp
 778:	57                   	push   %edi
 779:	56                   	push   %esi
 77a:	53                   	push   %ebx
 77b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 77e:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
 780:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 783:	39 c8                	cmp    %ecx,%eax
 785:	73 19                	jae    7a0 <free+0x30>
 787:	89 f6                	mov    %esi,%esi
 789:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 790:	39 d1                	cmp    %edx,%ecx
 792:	72 1c                	jb     7b0 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 794:	39 d0                	cmp    %edx,%eax
 796:	73 18                	jae    7b0 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
 798:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 79a:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 79c:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 79e:	72 f0                	jb     790 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7a0:	39 d0                	cmp    %edx,%eax
 7a2:	72 f4                	jb     798 <free+0x28>
 7a4:	39 d1                	cmp    %edx,%ecx
 7a6:	73 f0                	jae    798 <free+0x28>
 7a8:	90                   	nop
 7a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
 7b0:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7b3:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7b6:	39 d7                	cmp    %edx,%edi
 7b8:	74 19                	je     7d3 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 7ba:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7bd:	8b 50 04             	mov    0x4(%eax),%edx
 7c0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7c3:	39 f1                	cmp    %esi,%ecx
 7c5:	74 23                	je     7ea <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 7c7:	89 08                	mov    %ecx,(%eax)
  freep = p;
 7c9:	a3 a0 0c 00 00       	mov    %eax,0xca0
}
 7ce:	5b                   	pop    %ebx
 7cf:	5e                   	pop    %esi
 7d0:	5f                   	pop    %edi
 7d1:	5d                   	pop    %ebp
 7d2:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 7d3:	03 72 04             	add    0x4(%edx),%esi
 7d6:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7d9:	8b 10                	mov    (%eax),%edx
 7db:	8b 12                	mov    (%edx),%edx
 7dd:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 7e0:	8b 50 04             	mov    0x4(%eax),%edx
 7e3:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7e6:	39 f1                	cmp    %esi,%ecx
 7e8:	75 dd                	jne    7c7 <free+0x57>
    p->s.size += bp->s.size;
 7ea:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 7ed:	a3 a0 0c 00 00       	mov    %eax,0xca0
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 7f2:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7f5:	8b 53 f8             	mov    -0x8(%ebx),%edx
 7f8:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 7fa:	5b                   	pop    %ebx
 7fb:	5e                   	pop    %esi
 7fc:	5f                   	pop    %edi
 7fd:	5d                   	pop    %ebp
 7fe:	c3                   	ret    
 7ff:	90                   	nop

00000800 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 800:	55                   	push   %ebp
 801:	89 e5                	mov    %esp,%ebp
 803:	57                   	push   %edi
 804:	56                   	push   %esi
 805:	53                   	push   %ebx
 806:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 809:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 80c:	8b 15 a0 0c 00 00    	mov    0xca0,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 812:	8d 78 07             	lea    0x7(%eax),%edi
 815:	c1 ef 03             	shr    $0x3,%edi
 818:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 81b:	85 d2                	test   %edx,%edx
 81d:	0f 84 a3 00 00 00    	je     8c6 <malloc+0xc6>
 823:	8b 02                	mov    (%edx),%eax
 825:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 828:	39 cf                	cmp    %ecx,%edi
 82a:	76 74                	jbe    8a0 <malloc+0xa0>
 82c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 832:	be 00 10 00 00       	mov    $0x1000,%esi
 837:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
 83e:	0f 43 f7             	cmovae %edi,%esi
 841:	ba 00 80 00 00       	mov    $0x8000,%edx
 846:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
 84c:	0f 46 da             	cmovbe %edx,%ebx
 84f:	eb 10                	jmp    861 <malloc+0x61>
 851:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 858:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 85a:	8b 48 04             	mov    0x4(%eax),%ecx
 85d:	39 cf                	cmp    %ecx,%edi
 85f:	76 3f                	jbe    8a0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 861:	39 05 a0 0c 00 00    	cmp    %eax,0xca0
 867:	89 c2                	mov    %eax,%edx
 869:	75 ed                	jne    858 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 86b:	83 ec 0c             	sub    $0xc,%esp
 86e:	53                   	push   %ebx
 86f:	e8 7c fc ff ff       	call   4f0 <sbrk>
  if(p == (char*)-1)
 874:	83 c4 10             	add    $0x10,%esp
 877:	83 f8 ff             	cmp    $0xffffffff,%eax
 87a:	74 1c                	je     898 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 87c:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
 87f:	83 ec 0c             	sub    $0xc,%esp
 882:	83 c0 08             	add    $0x8,%eax
 885:	50                   	push   %eax
 886:	e8 e5 fe ff ff       	call   770 <free>
  return freep;
 88b:	8b 15 a0 0c 00 00    	mov    0xca0,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 891:	83 c4 10             	add    $0x10,%esp
 894:	85 d2                	test   %edx,%edx
 896:	75 c0                	jne    858 <malloc+0x58>
        return 0;
 898:	31 c0                	xor    %eax,%eax
 89a:	eb 1c                	jmp    8b8 <malloc+0xb8>
 89c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 8a0:	39 cf                	cmp    %ecx,%edi
 8a2:	74 1c                	je     8c0 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 8a4:	29 f9                	sub    %edi,%ecx
 8a6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 8a9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 8ac:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
 8af:	89 15 a0 0c 00 00    	mov    %edx,0xca0
      return (void*)(p + 1);
 8b5:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 8b8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8bb:	5b                   	pop    %ebx
 8bc:	5e                   	pop    %esi
 8bd:	5f                   	pop    %edi
 8be:	5d                   	pop    %ebp
 8bf:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 8c0:	8b 08                	mov    (%eax),%ecx
 8c2:	89 0a                	mov    %ecx,(%edx)
 8c4:	eb e9                	jmp    8af <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 8c6:	c7 05 a0 0c 00 00 a4 	movl   $0xca4,0xca0
 8cd:	0c 00 00 
 8d0:	c7 05 a4 0c 00 00 a4 	movl   $0xca4,0xca4
 8d7:	0c 00 00 
    base.s.size = 0;
 8da:	b8 a4 0c 00 00       	mov    $0xca4,%eax
 8df:	c7 05 a8 0c 00 00 00 	movl   $0x0,0xca8
 8e6:	00 00 00 
 8e9:	e9 3e ff ff ff       	jmp    82c <malloc+0x2c>
