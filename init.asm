
_init:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

char *argv[] = { "sh", 0 };

int
main(void)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	53                   	push   %ebx
   e:	51                   	push   %ecx
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
   f:	83 ec 08             	sub    $0x8,%esp
  12:	6a 02                	push   $0x2
  14:	68 60 08 00 00       	push   $0x860
  19:	e8 fa 03 00 00       	call   418 <open>
  1e:	83 c4 10             	add    $0x10,%esp
  21:	85 c0                	test   %eax,%eax
  23:	0f 88 9f 00 00 00    	js     c8 <main+0xc8>
    mknod("console", 1, 1);
    open("console", O_RDWR);
  }
  dup(0);  // stdout
  29:	83 ec 0c             	sub    $0xc,%esp
  2c:	6a 00                	push   $0x0
  2e:	e8 1d 04 00 00       	call   450 <dup>
  dup(0);  // stderr
  33:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  3a:	e8 11 04 00 00       	call   450 <dup>
  3f:	83 c4 10             	add    $0x10,%esp
  42:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  for(;;){
    printf(1, "init: starting sh\n");
  48:	83 ec 08             	sub    $0x8,%esp
  4b:	68 68 08 00 00       	push   $0x868
  50:	6a 01                	push   $0x1
  52:	e8 e9 04 00 00       	call   540 <printf>
    pid = fork();
  57:	e8 74 03 00 00       	call   3d0 <fork>
    if(pid < 0){
  5c:	83 c4 10             	add    $0x10,%esp
  5f:	85 c0                	test   %eax,%eax
  dup(0);  // stdout
  dup(0);  // stderr

  for(;;){
    printf(1, "init: starting sh\n");
    pid = fork();
  61:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
  63:	78 2c                	js     91 <main+0x91>
      printf(1, "init: fork failed\n");
      exit();
    }
    if(pid == 0){
  65:	74 3d                	je     a4 <main+0xa4>
  67:	89 f6                	mov    %esi,%esi
  69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      exec("sh", argv);
      printf(1, "init: exec sh failed\n");
      exit();
    }
    while((wpid=wait()) >= 0 && wpid != pid)
  70:	e8 6b 03 00 00       	call   3e0 <wait>
  75:	85 c0                	test   %eax,%eax
  77:	78 cf                	js     48 <main+0x48>
  79:	39 c3                	cmp    %eax,%ebx
  7b:	74 cb                	je     48 <main+0x48>
      printf(1, "zombie!\n");
  7d:	83 ec 08             	sub    $0x8,%esp
  80:	68 a7 08 00 00       	push   $0x8a7
  85:	6a 01                	push   $0x1
  87:	e8 b4 04 00 00       	call   540 <printf>
  8c:	83 c4 10             	add    $0x10,%esp
  8f:	eb df                	jmp    70 <main+0x70>

  for(;;){
    printf(1, "init: starting sh\n");
    pid = fork();
    if(pid < 0){
      printf(1, "init: fork failed\n");
  91:	53                   	push   %ebx
  92:	53                   	push   %ebx
  93:	68 7b 08 00 00       	push   $0x87b
  98:	6a 01                	push   $0x1
  9a:	e8 a1 04 00 00       	call   540 <printf>
      exit();
  9f:	e8 34 03 00 00       	call   3d8 <exit>
    }
    if(pid == 0){
      exec("sh", argv);
  a4:	50                   	push   %eax
  a5:	50                   	push   %eax
  a6:	68 d8 0b 00 00       	push   $0xbd8
  ab:	68 8e 08 00 00       	push   $0x88e
  b0:	e8 5b 03 00 00       	call   410 <exec>
      printf(1, "init: exec sh failed\n");
  b5:	5a                   	pop    %edx
  b6:	59                   	pop    %ecx
  b7:	68 91 08 00 00       	push   $0x891
  bc:	6a 01                	push   $0x1
  be:	e8 7d 04 00 00       	call   540 <printf>
      exit();
  c3:	e8 10 03 00 00       	call   3d8 <exit>
main(void)
{
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
    mknod("console", 1, 1);
  c8:	50                   	push   %eax
  c9:	6a 01                	push   $0x1
  cb:	6a 01                	push   $0x1
  cd:	68 60 08 00 00       	push   $0x860
  d2:	e8 49 03 00 00       	call   420 <mknod>
    open("console", O_RDWR);
  d7:	58                   	pop    %eax
  d8:	5a                   	pop    %edx
  d9:	6a 02                	push   $0x2
  db:	68 60 08 00 00       	push   $0x860
  e0:	e8 33 03 00 00       	call   418 <open>
  e5:	83 c4 10             	add    $0x10,%esp
  e8:	e9 3c ff ff ff       	jmp    29 <main+0x29>
  ed:	66 90                	xchg   %ax,%ax
  ef:	90                   	nop

000000f0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  f0:	55                   	push   %ebp
  f1:	89 e5                	mov    %esp,%ebp
  f3:	53                   	push   %ebx
  f4:	8b 45 08             	mov    0x8(%ebp),%eax
  f7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  fa:	89 c2                	mov    %eax,%edx
  fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 100:	83 c1 01             	add    $0x1,%ecx
 103:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 107:	83 c2 01             	add    $0x1,%edx
 10a:	84 db                	test   %bl,%bl
 10c:	88 5a ff             	mov    %bl,-0x1(%edx)
 10f:	75 ef                	jne    100 <strcpy+0x10>
    ;
  return os;
}
 111:	5b                   	pop    %ebx
 112:	5d                   	pop    %ebp
 113:	c3                   	ret    
 114:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 11a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000120 <strncpy>:

char* strncpy(char* s, char* t, int n) {
 120:	55                   	push   %ebp
  int i = 0;
 121:	31 d2                	xor    %edx,%edx
  while((*s++ = *t++) != 0)
    ;
  return os;
}

char* strncpy(char* s, char* t, int n) {
 123:	89 e5                	mov    %esp,%ebp
 125:	56                   	push   %esi
 126:	53                   	push   %ebx
 127:	8b 45 08             	mov    0x8(%ebp),%eax
 12a:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 12d:	8b 75 10             	mov    0x10(%ebp),%esi
  int i = 0;
  char *os;
  os = s;
  while(((*s++ = *t++) != 0) && (++i < n));
 130:	eb 0d                	jmp    13f <strncpy+0x1f>
 132:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 138:	83 c2 01             	add    $0x1,%edx
 13b:	39 f2                	cmp    %esi,%edx
 13d:	7d 0b                	jge    14a <strncpy+0x2a>
 13f:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
 143:	84 c9                	test   %cl,%cl
 145:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 148:	75 ee                	jne    138 <strncpy+0x18>
  return os;
}
 14a:	5b                   	pop    %ebx
 14b:	5e                   	pop    %esi
 14c:	5d                   	pop    %ebp
 14d:	c3                   	ret    
 14e:	66 90                	xchg   %ax,%ax

00000150 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	56                   	push   %esi
 154:	53                   	push   %ebx
 155:	8b 55 08             	mov    0x8(%ebp),%edx
 158:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 15b:	0f b6 02             	movzbl (%edx),%eax
 15e:	0f b6 19             	movzbl (%ecx),%ebx
 161:	84 c0                	test   %al,%al
 163:	75 1e                	jne    183 <strcmp+0x33>
 165:	eb 29                	jmp    190 <strcmp+0x40>
 167:	89 f6                	mov    %esi,%esi
 169:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 170:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 173:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 176:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 179:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 17d:	84 c0                	test   %al,%al
 17f:	74 0f                	je     190 <strcmp+0x40>
 181:	89 f1                	mov    %esi,%ecx
 183:	38 d8                	cmp    %bl,%al
 185:	74 e9                	je     170 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 187:	29 d8                	sub    %ebx,%eax
}
 189:	5b                   	pop    %ebx
 18a:	5e                   	pop    %esi
 18b:	5d                   	pop    %ebp
 18c:	c3                   	ret    
 18d:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 190:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
 192:	29 d8                	sub    %ebx,%eax
}
 194:	5b                   	pop    %ebx
 195:	5e                   	pop    %esi
 196:	5d                   	pop    %ebp
 197:	c3                   	ret    
 198:	90                   	nop
 199:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001a0 <strncmp>:

int strncmp(const char *p, const char *q, int n) {
 1a0:	55                   	push   %ebp
 1a1:	89 e5                	mov    %esp,%ebp
 1a3:	57                   	push   %edi
 1a4:	56                   	push   %esi
 1a5:	53                   	push   %ebx
 1a6:	8b 5d 10             	mov    0x10(%ebp),%ebx
 1a9:	8b 75 08             	mov    0x8(%ebp),%esi
 1ac:	8b 7d 0c             	mov    0xc(%ebp),%edi
  int i = 0;
  while(i < n && *p == *q)
 1af:	85 db                	test   %ebx,%ebx
 1b1:	7e 28                	jle    1db <strncmp+0x3b>
 1b3:	0f b6 16             	movzbl (%esi),%edx
 1b6:	0f b6 0f             	movzbl (%edi),%ecx
 1b9:	38 d1                	cmp    %dl,%cl
 1bb:	75 2b                	jne    1e8 <strncmp+0x48>
 1bd:	31 c0                	xor    %eax,%eax
 1bf:	eb 13                	jmp    1d4 <strncmp+0x34>
 1c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1c8:	0f b6 14 06          	movzbl (%esi,%eax,1),%edx
 1cc:	0f b6 0c 07          	movzbl (%edi,%eax,1),%ecx
 1d0:	38 ca                	cmp    %cl,%dl
 1d2:	75 14                	jne    1e8 <strncmp+0x48>
    p++, q++, i++;
 1d4:	83 c0 01             	add    $0x1,%eax
  return (uchar)*p - (uchar)*q;
}

int strncmp(const char *p, const char *q, int n) {
  int i = 0;
  while(i < n && *p == *q)
 1d7:	39 c3                	cmp    %eax,%ebx
 1d9:	75 ed                	jne    1c8 <strncmp+0x28>
    p++, q++, i++;
  if (i < n)
    return (uchar)*p - (uchar)*q;
  else
    return 0;
}
 1db:	5b                   	pop    %ebx
  while(i < n && *p == *q)
    p++, q++, i++;
  if (i < n)
    return (uchar)*p - (uchar)*q;
  else
    return 0;
 1dc:	31 c0                	xor    %eax,%eax
}
 1de:	5e                   	pop    %esi
 1df:	5f                   	pop    %edi
 1e0:	5d                   	pop    %ebp
 1e1:	c3                   	ret    
 1e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
int strncmp(const char *p, const char *q, int n) {
  int i = 0;
  while(i < n && *p == *q)
    p++, q++, i++;
  if (i < n)
    return (uchar)*p - (uchar)*q;
 1e8:	0f b6 c2             	movzbl %dl,%eax
  else
    return 0;
}
 1eb:	5b                   	pop    %ebx
int strncmp(const char *p, const char *q, int n) {
  int i = 0;
  while(i < n && *p == *q)
    p++, q++, i++;
  if (i < n)
    return (uchar)*p - (uchar)*q;
 1ec:	29 c8                	sub    %ecx,%eax
  else
    return 0;
}
 1ee:	5e                   	pop    %esi
 1ef:	5f                   	pop    %edi
 1f0:	5d                   	pop    %ebp
 1f1:	c3                   	ret    
 1f2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000200 <strlen>:

uint
strlen(char *s)
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 206:	80 39 00             	cmpb   $0x0,(%ecx)
 209:	74 12                	je     21d <strlen+0x1d>
 20b:	31 d2                	xor    %edx,%edx
 20d:	8d 76 00             	lea    0x0(%esi),%esi
 210:	83 c2 01             	add    $0x1,%edx
 213:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 217:	89 d0                	mov    %edx,%eax
 219:	75 f5                	jne    210 <strlen+0x10>
    ;
  return n;
}
 21b:	5d                   	pop    %ebp
 21c:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 21d:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
 21f:	5d                   	pop    %ebp
 220:	c3                   	ret    
 221:	eb 0d                	jmp    230 <memset>
 223:	90                   	nop
 224:	90                   	nop
 225:	90                   	nop
 226:	90                   	nop
 227:	90                   	nop
 228:	90                   	nop
 229:	90                   	nop
 22a:	90                   	nop
 22b:	90                   	nop
 22c:	90                   	nop
 22d:	90                   	nop
 22e:	90                   	nop
 22f:	90                   	nop

00000230 <memset>:

void*
memset(void *dst, int c, uint n)
{
 230:	55                   	push   %ebp
 231:	89 e5                	mov    %esp,%ebp
 233:	57                   	push   %edi
 234:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 237:	8b 4d 10             	mov    0x10(%ebp),%ecx
 23a:	8b 45 0c             	mov    0xc(%ebp),%eax
 23d:	89 d7                	mov    %edx,%edi
 23f:	fc                   	cld    
 240:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 242:	89 d0                	mov    %edx,%eax
 244:	5f                   	pop    %edi
 245:	5d                   	pop    %ebp
 246:	c3                   	ret    
 247:	89 f6                	mov    %esi,%esi
 249:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000250 <strchr>:

char*
strchr(const char *s, char c)
{
 250:	55                   	push   %ebp
 251:	89 e5                	mov    %esp,%ebp
 253:	53                   	push   %ebx
 254:	8b 45 08             	mov    0x8(%ebp),%eax
 257:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 25a:	0f b6 10             	movzbl (%eax),%edx
 25d:	84 d2                	test   %dl,%dl
 25f:	74 1d                	je     27e <strchr+0x2e>
    if(*s == c)
 261:	38 d3                	cmp    %dl,%bl
 263:	89 d9                	mov    %ebx,%ecx
 265:	75 0d                	jne    274 <strchr+0x24>
 267:	eb 17                	jmp    280 <strchr+0x30>
 269:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 270:	38 ca                	cmp    %cl,%dl
 272:	74 0c                	je     280 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 274:	83 c0 01             	add    $0x1,%eax
 277:	0f b6 10             	movzbl (%eax),%edx
 27a:	84 d2                	test   %dl,%dl
 27c:	75 f2                	jne    270 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
 27e:	31 c0                	xor    %eax,%eax
}
 280:	5b                   	pop    %ebx
 281:	5d                   	pop    %ebp
 282:	c3                   	ret    
 283:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 289:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000290 <gets>:

char*
gets(char *buf, int max)
{
 290:	55                   	push   %ebp
 291:	89 e5                	mov    %esp,%ebp
 293:	57                   	push   %edi
 294:	56                   	push   %esi
 295:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 296:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
 298:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
 29b:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 29e:	eb 29                	jmp    2c9 <gets+0x39>
    cc = read(0, &c, 1);
 2a0:	83 ec 04             	sub    $0x4,%esp
 2a3:	6a 01                	push   $0x1
 2a5:	57                   	push   %edi
 2a6:	6a 00                	push   $0x0
 2a8:	e8 43 01 00 00       	call   3f0 <read>
    if(cc < 1)
 2ad:	83 c4 10             	add    $0x10,%esp
 2b0:	85 c0                	test   %eax,%eax
 2b2:	7e 1d                	jle    2d1 <gets+0x41>
      break;
    buf[i++] = c;
 2b4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2b8:	8b 55 08             	mov    0x8(%ebp),%edx
 2bb:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
 2bd:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 2bf:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 2c3:	74 1b                	je     2e0 <gets+0x50>
 2c5:	3c 0d                	cmp    $0xd,%al
 2c7:	74 17                	je     2e0 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2c9:	8d 5e 01             	lea    0x1(%esi),%ebx
 2cc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2cf:	7c cf                	jl     2a0 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 2d1:	8b 45 08             	mov    0x8(%ebp),%eax
 2d4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 2d8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2db:	5b                   	pop    %ebx
 2dc:	5e                   	pop    %esi
 2dd:	5f                   	pop    %edi
 2de:	5d                   	pop    %ebp
 2df:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 2e0:	8b 45 08             	mov    0x8(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2e3:	89 de                	mov    %ebx,%esi
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 2e5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 2e9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2ec:	5b                   	pop    %ebx
 2ed:	5e                   	pop    %esi
 2ee:	5f                   	pop    %edi
 2ef:	5d                   	pop    %ebp
 2f0:	c3                   	ret    
 2f1:	eb 0d                	jmp    300 <stat>
 2f3:	90                   	nop
 2f4:	90                   	nop
 2f5:	90                   	nop
 2f6:	90                   	nop
 2f7:	90                   	nop
 2f8:	90                   	nop
 2f9:	90                   	nop
 2fa:	90                   	nop
 2fb:	90                   	nop
 2fc:	90                   	nop
 2fd:	90                   	nop
 2fe:	90                   	nop
 2ff:	90                   	nop

00000300 <stat>:

int
stat(char *n, struct stat *st)
{
 300:	55                   	push   %ebp
 301:	89 e5                	mov    %esp,%ebp
 303:	56                   	push   %esi
 304:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 305:	83 ec 08             	sub    $0x8,%esp
 308:	6a 00                	push   $0x0
 30a:	ff 75 08             	pushl  0x8(%ebp)
 30d:	e8 06 01 00 00       	call   418 <open>
  if(fd < 0)
 312:	83 c4 10             	add    $0x10,%esp
 315:	85 c0                	test   %eax,%eax
 317:	78 27                	js     340 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 319:	83 ec 08             	sub    $0x8,%esp
 31c:	ff 75 0c             	pushl  0xc(%ebp)
 31f:	89 c3                	mov    %eax,%ebx
 321:	50                   	push   %eax
 322:	e8 09 01 00 00       	call   430 <fstat>
 327:	89 c6                	mov    %eax,%esi
  close(fd);
 329:	89 1c 24             	mov    %ebx,(%esp)
 32c:	e8 cf 00 00 00       	call   400 <close>
  return r;
 331:	83 c4 10             	add    $0x10,%esp
 334:	89 f0                	mov    %esi,%eax
}
 336:	8d 65 f8             	lea    -0x8(%ebp),%esp
 339:	5b                   	pop    %ebx
 33a:	5e                   	pop    %esi
 33b:	5d                   	pop    %ebp
 33c:	c3                   	ret    
 33d:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 340:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 345:	eb ef                	jmp    336 <stat+0x36>
 347:	89 f6                	mov    %esi,%esi
 349:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000350 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 350:	55                   	push   %ebp
 351:	89 e5                	mov    %esp,%ebp
 353:	53                   	push   %ebx
 354:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 357:	0f be 11             	movsbl (%ecx),%edx
 35a:	8d 42 d0             	lea    -0x30(%edx),%eax
 35d:	3c 09                	cmp    $0x9,%al
 35f:	b8 00 00 00 00       	mov    $0x0,%eax
 364:	77 1f                	ja     385 <atoi+0x35>
 366:	8d 76 00             	lea    0x0(%esi),%esi
 369:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 370:	8d 04 80             	lea    (%eax,%eax,4),%eax
 373:	83 c1 01             	add    $0x1,%ecx
 376:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 37a:	0f be 11             	movsbl (%ecx),%edx
 37d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 380:	80 fb 09             	cmp    $0x9,%bl
 383:	76 eb                	jbe    370 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
 385:	5b                   	pop    %ebx
 386:	5d                   	pop    %ebp
 387:	c3                   	ret    
 388:	90                   	nop
 389:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000390 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 390:	55                   	push   %ebp
 391:	89 e5                	mov    %esp,%ebp
 393:	56                   	push   %esi
 394:	53                   	push   %ebx
 395:	8b 5d 10             	mov    0x10(%ebp),%ebx
 398:	8b 45 08             	mov    0x8(%ebp),%eax
 39b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 39e:	85 db                	test   %ebx,%ebx
 3a0:	7e 14                	jle    3b6 <memmove+0x26>
 3a2:	31 d2                	xor    %edx,%edx
 3a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 3a8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 3ac:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 3af:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3b2:	39 da                	cmp    %ebx,%edx
 3b4:	75 f2                	jne    3a8 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 3b6:	5b                   	pop    %ebx
 3b7:	5e                   	pop    %esi
 3b8:	5d                   	pop    %ebp
 3b9:	c3                   	ret    
 3ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000003c0 <max>:

int max(int a, int b) {
 3c0:	55                   	push   %ebp
 3c1:	89 e5                	mov    %esp,%ebp
 3c3:	8b 55 08             	mov    0x8(%ebp),%edx
 3c6:	8b 45 0c             	mov    0xc(%ebp),%eax
  if (b > a) return b;
  else return a;
}
 3c9:	5d                   	pop    %ebp
 3ca:	39 d0                	cmp    %edx,%eax
 3cc:	0f 4c c2             	cmovl  %edx,%eax
 3cf:	c3                   	ret    

000003d0 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3d0:	b8 01 00 00 00       	mov    $0x1,%eax
 3d5:	cd 40                	int    $0x40
 3d7:	c3                   	ret    

000003d8 <exit>:
SYSCALL(exit)
 3d8:	b8 02 00 00 00       	mov    $0x2,%eax
 3dd:	cd 40                	int    $0x40
 3df:	c3                   	ret    

000003e0 <wait>:
SYSCALL(wait)
 3e0:	b8 03 00 00 00       	mov    $0x3,%eax
 3e5:	cd 40                	int    $0x40
 3e7:	c3                   	ret    

000003e8 <pipe>:
SYSCALL(pipe)
 3e8:	b8 04 00 00 00       	mov    $0x4,%eax
 3ed:	cd 40                	int    $0x40
 3ef:	c3                   	ret    

000003f0 <read>:
SYSCALL(read)
 3f0:	b8 05 00 00 00       	mov    $0x5,%eax
 3f5:	cd 40                	int    $0x40
 3f7:	c3                   	ret    

000003f8 <write>:
SYSCALL(write)
 3f8:	b8 10 00 00 00       	mov    $0x10,%eax
 3fd:	cd 40                	int    $0x40
 3ff:	c3                   	ret    

00000400 <close>:
SYSCALL(close)
 400:	b8 15 00 00 00       	mov    $0x15,%eax
 405:	cd 40                	int    $0x40
 407:	c3                   	ret    

00000408 <kill>:
SYSCALL(kill)
 408:	b8 06 00 00 00       	mov    $0x6,%eax
 40d:	cd 40                	int    $0x40
 40f:	c3                   	ret    

00000410 <exec>:
SYSCALL(exec)
 410:	b8 07 00 00 00       	mov    $0x7,%eax
 415:	cd 40                	int    $0x40
 417:	c3                   	ret    

00000418 <open>:
SYSCALL(open)
 418:	b8 0f 00 00 00       	mov    $0xf,%eax
 41d:	cd 40                	int    $0x40
 41f:	c3                   	ret    

00000420 <mknod>:
SYSCALL(mknod)
 420:	b8 11 00 00 00       	mov    $0x11,%eax
 425:	cd 40                	int    $0x40
 427:	c3                   	ret    

00000428 <unlink>:
SYSCALL(unlink)
 428:	b8 12 00 00 00       	mov    $0x12,%eax
 42d:	cd 40                	int    $0x40
 42f:	c3                   	ret    

00000430 <fstat>:
SYSCALL(fstat)
 430:	b8 08 00 00 00       	mov    $0x8,%eax
 435:	cd 40                	int    $0x40
 437:	c3                   	ret    

00000438 <link>:
SYSCALL(link)
 438:	b8 13 00 00 00       	mov    $0x13,%eax
 43d:	cd 40                	int    $0x40
 43f:	c3                   	ret    

00000440 <mkdir>:
SYSCALL(mkdir)
 440:	b8 14 00 00 00       	mov    $0x14,%eax
 445:	cd 40                	int    $0x40
 447:	c3                   	ret    

00000448 <chdir>:
SYSCALL(chdir)
 448:	b8 09 00 00 00       	mov    $0x9,%eax
 44d:	cd 40                	int    $0x40
 44f:	c3                   	ret    

00000450 <dup>:
SYSCALL(dup)
 450:	b8 0a 00 00 00       	mov    $0xa,%eax
 455:	cd 40                	int    $0x40
 457:	c3                   	ret    

00000458 <getpid>:
SYSCALL(getpid)
 458:	b8 0b 00 00 00       	mov    $0xb,%eax
 45d:	cd 40                	int    $0x40
 45f:	c3                   	ret    

00000460 <sbrk>:
SYSCALL(sbrk)
 460:	b8 0c 00 00 00       	mov    $0xc,%eax
 465:	cd 40                	int    $0x40
 467:	c3                   	ret    

00000468 <sleep>:
SYSCALL(sleep)
 468:	b8 0d 00 00 00       	mov    $0xd,%eax
 46d:	cd 40                	int    $0x40
 46f:	c3                   	ret    

00000470 <uptime>:
SYSCALL(uptime)
 470:	b8 0e 00 00 00       	mov    $0xe,%eax
 475:	cd 40                	int    $0x40
 477:	c3                   	ret    

00000478 <setVariable>:
SYSCALL(setVariable)
 478:	b8 17 00 00 00       	mov    $0x17,%eax
 47d:	cd 40                	int    $0x40
 47f:	c3                   	ret    

00000480 <getVariable>:
SYSCALL(getVariable)
 480:	b8 18 00 00 00       	mov    $0x18,%eax
 485:	cd 40                	int    $0x40
 487:	c3                   	ret    

00000488 <remVariable>:
SYSCALL(remVariable)
 488:	b8 19 00 00 00       	mov    $0x19,%eax
 48d:	cd 40                	int    $0x40
 48f:	c3                   	ret    

00000490 <wait2>:
SYSCALL(wait2)
 490:	b8 1a 00 00 00       	mov    $0x1a,%eax
 495:	cd 40                	int    $0x40
 497:	c3                   	ret    
 498:	66 90                	xchg   %ax,%ax
 49a:	66 90                	xchg   %ax,%ax
 49c:	66 90                	xchg   %ax,%ax
 49e:	66 90                	xchg   %ax,%ax

000004a0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 4a0:	55                   	push   %ebp
 4a1:	89 e5                	mov    %esp,%ebp
 4a3:	57                   	push   %edi
 4a4:	56                   	push   %esi
 4a5:	53                   	push   %ebx
 4a6:	89 c6                	mov    %eax,%esi
 4a8:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 4ab:	8b 5d 08             	mov    0x8(%ebp),%ebx
 4ae:	85 db                	test   %ebx,%ebx
 4b0:	74 7e                	je     530 <printint+0x90>
 4b2:	89 d0                	mov    %edx,%eax
 4b4:	c1 e8 1f             	shr    $0x1f,%eax
 4b7:	84 c0                	test   %al,%al
 4b9:	74 75                	je     530 <printint+0x90>
    neg = 1;
    x = -xx;
 4bb:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 4bd:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
 4c4:	f7 d8                	neg    %eax
 4c6:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 4c9:	31 ff                	xor    %edi,%edi
 4cb:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 4ce:	89 ce                	mov    %ecx,%esi
 4d0:	eb 08                	jmp    4da <printint+0x3a>
 4d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 4d8:	89 cf                	mov    %ecx,%edi
 4da:	31 d2                	xor    %edx,%edx
 4dc:	8d 4f 01             	lea    0x1(%edi),%ecx
 4df:	f7 f6                	div    %esi
 4e1:	0f b6 92 b8 08 00 00 	movzbl 0x8b8(%edx),%edx
  }while((x /= base) != 0);
 4e8:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 4ea:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 4ed:	75 e9                	jne    4d8 <printint+0x38>
  if(neg)
 4ef:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 4f2:	8b 75 c0             	mov    -0x40(%ebp),%esi
 4f5:	85 c0                	test   %eax,%eax
 4f7:	74 08                	je     501 <printint+0x61>
    buf[i++] = '-';
 4f9:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
 4fe:	8d 4f 02             	lea    0x2(%edi),%ecx
 501:	8d 7c 0d d7          	lea    -0x29(%ebp,%ecx,1),%edi
 505:	8d 76 00             	lea    0x0(%esi),%esi
 508:	0f b6 07             	movzbl (%edi),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 50b:	83 ec 04             	sub    $0x4,%esp
 50e:	83 ef 01             	sub    $0x1,%edi
 511:	6a 01                	push   $0x1
 513:	53                   	push   %ebx
 514:	56                   	push   %esi
 515:	88 45 d7             	mov    %al,-0x29(%ebp)
 518:	e8 db fe ff ff       	call   3f8 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 51d:	83 c4 10             	add    $0x10,%esp
 520:	39 df                	cmp    %ebx,%edi
 522:	75 e4                	jne    508 <printint+0x68>
    putc(fd, buf[i]);
}
 524:	8d 65 f4             	lea    -0xc(%ebp),%esp
 527:	5b                   	pop    %ebx
 528:	5e                   	pop    %esi
 529:	5f                   	pop    %edi
 52a:	5d                   	pop    %ebp
 52b:	c3                   	ret    
 52c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 530:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 532:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 539:	eb 8b                	jmp    4c6 <printint+0x26>
 53b:	90                   	nop
 53c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000540 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 540:	55                   	push   %ebp
 541:	89 e5                	mov    %esp,%ebp
 543:	57                   	push   %edi
 544:	56                   	push   %esi
 545:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 546:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 549:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 54c:	8b 75 0c             	mov    0xc(%ebp),%esi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 54f:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 552:	89 45 d0             	mov    %eax,-0x30(%ebp)
 555:	0f b6 1e             	movzbl (%esi),%ebx
 558:	83 c6 01             	add    $0x1,%esi
 55b:	84 db                	test   %bl,%bl
 55d:	0f 84 b0 00 00 00    	je     613 <printf+0xd3>
 563:	31 d2                	xor    %edx,%edx
 565:	eb 39                	jmp    5a0 <printf+0x60>
 567:	89 f6                	mov    %esi,%esi
 569:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 570:	83 f8 25             	cmp    $0x25,%eax
 573:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
 576:	ba 25 00 00 00       	mov    $0x25,%edx
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 57b:	74 18                	je     595 <printf+0x55>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 57d:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 580:	83 ec 04             	sub    $0x4,%esp
 583:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 586:	6a 01                	push   $0x1
 588:	50                   	push   %eax
 589:	57                   	push   %edi
 58a:	e8 69 fe ff ff       	call   3f8 <write>
 58f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 592:	83 c4 10             	add    $0x10,%esp
 595:	83 c6 01             	add    $0x1,%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 598:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 59c:	84 db                	test   %bl,%bl
 59e:	74 73                	je     613 <printf+0xd3>
    c = fmt[i] & 0xff;
    if(state == 0){
 5a0:	85 d2                	test   %edx,%edx
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
 5a2:	0f be cb             	movsbl %bl,%ecx
 5a5:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 5a8:	74 c6                	je     570 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 5aa:	83 fa 25             	cmp    $0x25,%edx
 5ad:	75 e6                	jne    595 <printf+0x55>
      if(c == 'd'){
 5af:	83 f8 64             	cmp    $0x64,%eax
 5b2:	0f 84 f8 00 00 00    	je     6b0 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 5b8:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 5be:	83 f9 70             	cmp    $0x70,%ecx
 5c1:	74 5d                	je     620 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 5c3:	83 f8 73             	cmp    $0x73,%eax
 5c6:	0f 84 84 00 00 00    	je     650 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 5cc:	83 f8 63             	cmp    $0x63,%eax
 5cf:	0f 84 ea 00 00 00    	je     6bf <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 5d5:	83 f8 25             	cmp    $0x25,%eax
 5d8:	0f 84 c2 00 00 00    	je     6a0 <printf+0x160>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 5de:	8d 45 e7             	lea    -0x19(%ebp),%eax
 5e1:	83 ec 04             	sub    $0x4,%esp
 5e4:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 5e8:	6a 01                	push   $0x1
 5ea:	50                   	push   %eax
 5eb:	57                   	push   %edi
 5ec:	e8 07 fe ff ff       	call   3f8 <write>
 5f1:	83 c4 0c             	add    $0xc,%esp
 5f4:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 5f7:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 5fa:	6a 01                	push   $0x1
 5fc:	50                   	push   %eax
 5fd:	57                   	push   %edi
 5fe:	83 c6 01             	add    $0x1,%esi
 601:	e8 f2 fd ff ff       	call   3f8 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 606:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 60a:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 60d:	31 d2                	xor    %edx,%edx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 60f:	84 db                	test   %bl,%bl
 611:	75 8d                	jne    5a0 <printf+0x60>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 613:	8d 65 f4             	lea    -0xc(%ebp),%esp
 616:	5b                   	pop    %ebx
 617:	5e                   	pop    %esi
 618:	5f                   	pop    %edi
 619:	5d                   	pop    %ebp
 61a:	c3                   	ret    
 61b:	90                   	nop
 61c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 620:	83 ec 0c             	sub    $0xc,%esp
 623:	b9 10 00 00 00       	mov    $0x10,%ecx
 628:	6a 00                	push   $0x0
 62a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 62d:	89 f8                	mov    %edi,%eax
 62f:	8b 13                	mov    (%ebx),%edx
 631:	e8 6a fe ff ff       	call   4a0 <printint>
        ap++;
 636:	89 d8                	mov    %ebx,%eax
 638:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 63b:	31 d2                	xor    %edx,%edx
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
 63d:	83 c0 04             	add    $0x4,%eax
 640:	89 45 d0             	mov    %eax,-0x30(%ebp)
 643:	e9 4d ff ff ff       	jmp    595 <printf+0x55>
 648:	90                   	nop
 649:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
 650:	8b 45 d0             	mov    -0x30(%ebp),%eax
 653:	8b 18                	mov    (%eax),%ebx
        ap++;
 655:	83 c0 04             	add    $0x4,%eax
 658:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
          s = "(null)";
 65b:	b8 b0 08 00 00       	mov    $0x8b0,%eax
 660:	85 db                	test   %ebx,%ebx
 662:	0f 44 d8             	cmove  %eax,%ebx
        while(*s != 0){
 665:	0f b6 03             	movzbl (%ebx),%eax
 668:	84 c0                	test   %al,%al
 66a:	74 23                	je     68f <printf+0x14f>
 66c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 670:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 673:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 676:	83 ec 04             	sub    $0x4,%esp
 679:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
 67b:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 67e:	50                   	push   %eax
 67f:	57                   	push   %edi
 680:	e8 73 fd ff ff       	call   3f8 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 685:	0f b6 03             	movzbl (%ebx),%eax
 688:	83 c4 10             	add    $0x10,%esp
 68b:	84 c0                	test   %al,%al
 68d:	75 e1                	jne    670 <printf+0x130>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 68f:	31 d2                	xor    %edx,%edx
 691:	e9 ff fe ff ff       	jmp    595 <printf+0x55>
 696:	8d 76 00             	lea    0x0(%esi),%esi
 699:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 6a0:	83 ec 04             	sub    $0x4,%esp
 6a3:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 6a6:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 6a9:	6a 01                	push   $0x1
 6ab:	e9 4c ff ff ff       	jmp    5fc <printf+0xbc>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 6b0:	83 ec 0c             	sub    $0xc,%esp
 6b3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6b8:	6a 01                	push   $0x1
 6ba:	e9 6b ff ff ff       	jmp    62a <printf+0xea>
 6bf:	8b 5d d0             	mov    -0x30(%ebp),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 6c2:	83 ec 04             	sub    $0x4,%esp
 6c5:	8b 03                	mov    (%ebx),%eax
 6c7:	6a 01                	push   $0x1
 6c9:	88 45 e4             	mov    %al,-0x1c(%ebp)
 6cc:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 6cf:	50                   	push   %eax
 6d0:	57                   	push   %edi
 6d1:	e8 22 fd ff ff       	call   3f8 <write>
 6d6:	e9 5b ff ff ff       	jmp    636 <printf+0xf6>
 6db:	66 90                	xchg   %ax,%ax
 6dd:	66 90                	xchg   %ax,%ax
 6df:	90                   	nop

000006e0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6e0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6e1:	a1 e0 0b 00 00       	mov    0xbe0,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 6e6:	89 e5                	mov    %esp,%ebp
 6e8:	57                   	push   %edi
 6e9:	56                   	push   %esi
 6ea:	53                   	push   %ebx
 6eb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6ee:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6f0:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6f3:	39 c8                	cmp    %ecx,%eax
 6f5:	73 19                	jae    710 <free+0x30>
 6f7:	89 f6                	mov    %esi,%esi
 6f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 700:	39 d1                	cmp    %edx,%ecx
 702:	72 1c                	jb     720 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 704:	39 d0                	cmp    %edx,%eax
 706:	73 18                	jae    720 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
 708:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 70a:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 70c:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 70e:	72 f0                	jb     700 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 710:	39 d0                	cmp    %edx,%eax
 712:	72 f4                	jb     708 <free+0x28>
 714:	39 d1                	cmp    %edx,%ecx
 716:	73 f0                	jae    708 <free+0x28>
 718:	90                   	nop
 719:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
 720:	8b 73 fc             	mov    -0x4(%ebx),%esi
 723:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 726:	39 d7                	cmp    %edx,%edi
 728:	74 19                	je     743 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 72a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 72d:	8b 50 04             	mov    0x4(%eax),%edx
 730:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 733:	39 f1                	cmp    %esi,%ecx
 735:	74 23                	je     75a <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 737:	89 08                	mov    %ecx,(%eax)
  freep = p;
 739:	a3 e0 0b 00 00       	mov    %eax,0xbe0
}
 73e:	5b                   	pop    %ebx
 73f:	5e                   	pop    %esi
 740:	5f                   	pop    %edi
 741:	5d                   	pop    %ebp
 742:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 743:	03 72 04             	add    0x4(%edx),%esi
 746:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 749:	8b 10                	mov    (%eax),%edx
 74b:	8b 12                	mov    (%edx),%edx
 74d:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 750:	8b 50 04             	mov    0x4(%eax),%edx
 753:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 756:	39 f1                	cmp    %esi,%ecx
 758:	75 dd                	jne    737 <free+0x57>
    p->s.size += bp->s.size;
 75a:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 75d:	a3 e0 0b 00 00       	mov    %eax,0xbe0
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 762:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 765:	8b 53 f8             	mov    -0x8(%ebx),%edx
 768:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 76a:	5b                   	pop    %ebx
 76b:	5e                   	pop    %esi
 76c:	5f                   	pop    %edi
 76d:	5d                   	pop    %ebp
 76e:	c3                   	ret    
 76f:	90                   	nop

00000770 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 770:	55                   	push   %ebp
 771:	89 e5                	mov    %esp,%ebp
 773:	57                   	push   %edi
 774:	56                   	push   %esi
 775:	53                   	push   %ebx
 776:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 779:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 77c:	8b 15 e0 0b 00 00    	mov    0xbe0,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 782:	8d 78 07             	lea    0x7(%eax),%edi
 785:	c1 ef 03             	shr    $0x3,%edi
 788:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 78b:	85 d2                	test   %edx,%edx
 78d:	0f 84 a3 00 00 00    	je     836 <malloc+0xc6>
 793:	8b 02                	mov    (%edx),%eax
 795:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 798:	39 cf                	cmp    %ecx,%edi
 79a:	76 74                	jbe    810 <malloc+0xa0>
 79c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 7a2:	be 00 10 00 00       	mov    $0x1000,%esi
 7a7:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
 7ae:	0f 43 f7             	cmovae %edi,%esi
 7b1:	ba 00 80 00 00       	mov    $0x8000,%edx
 7b6:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
 7bc:	0f 46 da             	cmovbe %edx,%ebx
 7bf:	eb 10                	jmp    7d1 <malloc+0x61>
 7c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7c8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 7ca:	8b 48 04             	mov    0x4(%eax),%ecx
 7cd:	39 cf                	cmp    %ecx,%edi
 7cf:	76 3f                	jbe    810 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 7d1:	39 05 e0 0b 00 00    	cmp    %eax,0xbe0
 7d7:	89 c2                	mov    %eax,%edx
 7d9:	75 ed                	jne    7c8 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 7db:	83 ec 0c             	sub    $0xc,%esp
 7de:	53                   	push   %ebx
 7df:	e8 7c fc ff ff       	call   460 <sbrk>
  if(p == (char*)-1)
 7e4:	83 c4 10             	add    $0x10,%esp
 7e7:	83 f8 ff             	cmp    $0xffffffff,%eax
 7ea:	74 1c                	je     808 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 7ec:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
 7ef:	83 ec 0c             	sub    $0xc,%esp
 7f2:	83 c0 08             	add    $0x8,%eax
 7f5:	50                   	push   %eax
 7f6:	e8 e5 fe ff ff       	call   6e0 <free>
  return freep;
 7fb:	8b 15 e0 0b 00 00    	mov    0xbe0,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 801:	83 c4 10             	add    $0x10,%esp
 804:	85 d2                	test   %edx,%edx
 806:	75 c0                	jne    7c8 <malloc+0x58>
        return 0;
 808:	31 c0                	xor    %eax,%eax
 80a:	eb 1c                	jmp    828 <malloc+0xb8>
 80c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 810:	39 cf                	cmp    %ecx,%edi
 812:	74 1c                	je     830 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 814:	29 f9                	sub    %edi,%ecx
 816:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 819:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 81c:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
 81f:	89 15 e0 0b 00 00    	mov    %edx,0xbe0
      return (void*)(p + 1);
 825:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 828:	8d 65 f4             	lea    -0xc(%ebp),%esp
 82b:	5b                   	pop    %ebx
 82c:	5e                   	pop    %esi
 82d:	5f                   	pop    %edi
 82e:	5d                   	pop    %ebp
 82f:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 830:	8b 08                	mov    (%eax),%ecx
 832:	89 0a                	mov    %ecx,(%edx)
 834:	eb e9                	jmp    81f <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 836:	c7 05 e0 0b 00 00 e4 	movl   $0xbe4,0xbe0
 83d:	0b 00 00 
 840:	c7 05 e4 0b 00 00 e4 	movl   $0xbe4,0xbe4
 847:	0b 00 00 
    base.s.size = 0;
 84a:	b8 e4 0b 00 00       	mov    $0xbe4,%eax
 84f:	c7 05 e8 0b 00 00 00 	movl   $0x0,0xbe8
 856:	00 00 00 
 859:	e9 3e ff ff ff       	jmp    79c <malloc+0x2c>
