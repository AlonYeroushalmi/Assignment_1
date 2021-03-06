
_echo:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

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
  11:	83 ec 08             	sub    $0x8,%esp
  14:	8b 31                	mov    (%ecx),%esi
  16:	8b 79 04             	mov    0x4(%ecx),%edi
  int i;

  for(i = 1; i < argc; i++)
  19:	83 fe 01             	cmp    $0x1,%esi
  1c:	7e 41                	jle    5f <main+0x5f>
  1e:	bb 01 00 00 00       	mov    $0x1,%ebx
  23:	eb 1b                	jmp    40 <main+0x40>
  25:	8d 76 00             	lea    0x0(%esi),%esi
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
  28:	68 e0 07 00 00       	push   $0x7e0
  2d:	ff 74 9f fc          	pushl  -0x4(%edi,%ebx,4)
  31:	68 e2 07 00 00       	push   $0x7e2
  36:	6a 01                	push   $0x1
  38:	e8 83 04 00 00       	call   4c0 <printf>
  3d:	83 c4 10             	add    $0x10,%esp
  40:	83 c3 01             	add    $0x1,%ebx
  43:	39 de                	cmp    %ebx,%esi
  45:	75 e1                	jne    28 <main+0x28>
  47:	68 e7 07 00 00       	push   $0x7e7
  4c:	ff 74 b7 fc          	pushl  -0x4(%edi,%esi,4)
  50:	68 e2 07 00 00       	push   $0x7e2
  55:	6a 01                	push   $0x1
  57:	e8 64 04 00 00       	call   4c0 <printf>
  5c:	83 c4 10             	add    $0x10,%esp
  exit();
  5f:	e8 f4 02 00 00       	call   358 <exit>
  64:	66 90                	xchg   %ax,%ax
  66:	66 90                	xchg   %ax,%ax
  68:	66 90                	xchg   %ax,%ax
  6a:	66 90                	xchg   %ax,%ax
  6c:	66 90                	xchg   %ax,%ax
  6e:	66 90                	xchg   %ax,%ax

00000070 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  70:	55                   	push   %ebp
  71:	89 e5                	mov    %esp,%ebp
  73:	53                   	push   %ebx
  74:	8b 45 08             	mov    0x8(%ebp),%eax
  77:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  7a:	89 c2                	mov    %eax,%edx
  7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  80:	83 c1 01             	add    $0x1,%ecx
  83:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
  87:	83 c2 01             	add    $0x1,%edx
  8a:	84 db                	test   %bl,%bl
  8c:	88 5a ff             	mov    %bl,-0x1(%edx)
  8f:	75 ef                	jne    80 <strcpy+0x10>
    ;
  return os;
}
  91:	5b                   	pop    %ebx
  92:	5d                   	pop    %ebp
  93:	c3                   	ret    
  94:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  9a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000000a0 <strncpy>:

char* strncpy(char* s, char* t, int n) {
  a0:	55                   	push   %ebp
  int i = 0;
  a1:	31 d2                	xor    %edx,%edx
  while((*s++ = *t++) != 0)
    ;
  return os;
}

char* strncpy(char* s, char* t, int n) {
  a3:	89 e5                	mov    %esp,%ebp
  a5:	56                   	push   %esi
  a6:	53                   	push   %ebx
  a7:	8b 45 08             	mov    0x8(%ebp),%eax
  aa:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  ad:	8b 75 10             	mov    0x10(%ebp),%esi
  int i = 0;
  char *os;
  os = s;
  while(((*s++ = *t++) != 0) && (++i < n));
  b0:	eb 0d                	jmp    bf <strncpy+0x1f>
  b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  b8:	83 c2 01             	add    $0x1,%edx
  bb:	39 f2                	cmp    %esi,%edx
  bd:	7d 0b                	jge    ca <strncpy+0x2a>
  bf:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
  c3:	84 c9                	test   %cl,%cl
  c5:	88 0c 10             	mov    %cl,(%eax,%edx,1)
  c8:	75 ee                	jne    b8 <strncpy+0x18>
  return os;
}
  ca:	5b                   	pop    %ebx
  cb:	5e                   	pop    %esi
  cc:	5d                   	pop    %ebp
  cd:	c3                   	ret    
  ce:	66 90                	xchg   %ax,%ax

000000d0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  d0:	55                   	push   %ebp
  d1:	89 e5                	mov    %esp,%ebp
  d3:	56                   	push   %esi
  d4:	53                   	push   %ebx
  d5:	8b 55 08             	mov    0x8(%ebp),%edx
  d8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  db:	0f b6 02             	movzbl (%edx),%eax
  de:	0f b6 19             	movzbl (%ecx),%ebx
  e1:	84 c0                	test   %al,%al
  e3:	75 1e                	jne    103 <strcmp+0x33>
  e5:	eb 29                	jmp    110 <strcmp+0x40>
  e7:	89 f6                	mov    %esi,%esi
  e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
  f0:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  f3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
  f6:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  f9:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
  fd:	84 c0                	test   %al,%al
  ff:	74 0f                	je     110 <strcmp+0x40>
 101:	89 f1                	mov    %esi,%ecx
 103:	38 d8                	cmp    %bl,%al
 105:	74 e9                	je     f0 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 107:	29 d8                	sub    %ebx,%eax
}
 109:	5b                   	pop    %ebx
 10a:	5e                   	pop    %esi
 10b:	5d                   	pop    %ebp
 10c:	c3                   	ret    
 10d:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 110:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
 112:	29 d8                	sub    %ebx,%eax
}
 114:	5b                   	pop    %ebx
 115:	5e                   	pop    %esi
 116:	5d                   	pop    %ebp
 117:	c3                   	ret    
 118:	90                   	nop
 119:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000120 <strncmp>:

int strncmp(const char *p, const char *q, int n) {
 120:	55                   	push   %ebp
 121:	89 e5                	mov    %esp,%ebp
 123:	57                   	push   %edi
 124:	56                   	push   %esi
 125:	53                   	push   %ebx
 126:	8b 5d 10             	mov    0x10(%ebp),%ebx
 129:	8b 75 08             	mov    0x8(%ebp),%esi
 12c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  int i = 0;
  while(i < n && *p == *q)
 12f:	85 db                	test   %ebx,%ebx
 131:	7e 28                	jle    15b <strncmp+0x3b>
 133:	0f b6 16             	movzbl (%esi),%edx
 136:	0f b6 0f             	movzbl (%edi),%ecx
 139:	38 d1                	cmp    %dl,%cl
 13b:	75 2b                	jne    168 <strncmp+0x48>
 13d:	31 c0                	xor    %eax,%eax
 13f:	eb 13                	jmp    154 <strncmp+0x34>
 141:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 148:	0f b6 14 06          	movzbl (%esi,%eax,1),%edx
 14c:	0f b6 0c 07          	movzbl (%edi,%eax,1),%ecx
 150:	38 ca                	cmp    %cl,%dl
 152:	75 14                	jne    168 <strncmp+0x48>
    p++, q++, i++;
 154:	83 c0 01             	add    $0x1,%eax
  return (uchar)*p - (uchar)*q;
}

int strncmp(const char *p, const char *q, int n) {
  int i = 0;
  while(i < n && *p == *q)
 157:	39 c3                	cmp    %eax,%ebx
 159:	75 ed                	jne    148 <strncmp+0x28>
    p++, q++, i++;
  if (i < n)
    return (uchar)*p - (uchar)*q;
  else
    return 0;
}
 15b:	5b                   	pop    %ebx
  while(i < n && *p == *q)
    p++, q++, i++;
  if (i < n)
    return (uchar)*p - (uchar)*q;
  else
    return 0;
 15c:	31 c0                	xor    %eax,%eax
}
 15e:	5e                   	pop    %esi
 15f:	5f                   	pop    %edi
 160:	5d                   	pop    %ebp
 161:	c3                   	ret    
 162:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
int strncmp(const char *p, const char *q, int n) {
  int i = 0;
  while(i < n && *p == *q)
    p++, q++, i++;
  if (i < n)
    return (uchar)*p - (uchar)*q;
 168:	0f b6 c2             	movzbl %dl,%eax
  else
    return 0;
}
 16b:	5b                   	pop    %ebx
int strncmp(const char *p, const char *q, int n) {
  int i = 0;
  while(i < n && *p == *q)
    p++, q++, i++;
  if (i < n)
    return (uchar)*p - (uchar)*q;
 16c:	29 c8                	sub    %ecx,%eax
  else
    return 0;
}
 16e:	5e                   	pop    %esi
 16f:	5f                   	pop    %edi
 170:	5d                   	pop    %ebp
 171:	c3                   	ret    
 172:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 179:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000180 <strlen>:

uint
strlen(char *s)
{
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 186:	80 39 00             	cmpb   $0x0,(%ecx)
 189:	74 12                	je     19d <strlen+0x1d>
 18b:	31 d2                	xor    %edx,%edx
 18d:	8d 76 00             	lea    0x0(%esi),%esi
 190:	83 c2 01             	add    $0x1,%edx
 193:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 197:	89 d0                	mov    %edx,%eax
 199:	75 f5                	jne    190 <strlen+0x10>
    ;
  return n;
}
 19b:	5d                   	pop    %ebp
 19c:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 19d:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
 19f:	5d                   	pop    %ebp
 1a0:	c3                   	ret    
 1a1:	eb 0d                	jmp    1b0 <memset>
 1a3:	90                   	nop
 1a4:	90                   	nop
 1a5:	90                   	nop
 1a6:	90                   	nop
 1a7:	90                   	nop
 1a8:	90                   	nop
 1a9:	90                   	nop
 1aa:	90                   	nop
 1ab:	90                   	nop
 1ac:	90                   	nop
 1ad:	90                   	nop
 1ae:	90                   	nop
 1af:	90                   	nop

000001b0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	57                   	push   %edi
 1b4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1b7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1ba:	8b 45 0c             	mov    0xc(%ebp),%eax
 1bd:	89 d7                	mov    %edx,%edi
 1bf:	fc                   	cld    
 1c0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1c2:	89 d0                	mov    %edx,%eax
 1c4:	5f                   	pop    %edi
 1c5:	5d                   	pop    %ebp
 1c6:	c3                   	ret    
 1c7:	89 f6                	mov    %esi,%esi
 1c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001d0 <strchr>:

char*
strchr(const char *s, char c)
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	53                   	push   %ebx
 1d4:	8b 45 08             	mov    0x8(%ebp),%eax
 1d7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 1da:	0f b6 10             	movzbl (%eax),%edx
 1dd:	84 d2                	test   %dl,%dl
 1df:	74 1d                	je     1fe <strchr+0x2e>
    if(*s == c)
 1e1:	38 d3                	cmp    %dl,%bl
 1e3:	89 d9                	mov    %ebx,%ecx
 1e5:	75 0d                	jne    1f4 <strchr+0x24>
 1e7:	eb 17                	jmp    200 <strchr+0x30>
 1e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1f0:	38 ca                	cmp    %cl,%dl
 1f2:	74 0c                	je     200 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 1f4:	83 c0 01             	add    $0x1,%eax
 1f7:	0f b6 10             	movzbl (%eax),%edx
 1fa:	84 d2                	test   %dl,%dl
 1fc:	75 f2                	jne    1f0 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
 1fe:	31 c0                	xor    %eax,%eax
}
 200:	5b                   	pop    %ebx
 201:	5d                   	pop    %ebp
 202:	c3                   	ret    
 203:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 209:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000210 <gets>:

char*
gets(char *buf, int max)
{
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	57                   	push   %edi
 214:	56                   	push   %esi
 215:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 216:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
 218:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
 21b:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 21e:	eb 29                	jmp    249 <gets+0x39>
    cc = read(0, &c, 1);
 220:	83 ec 04             	sub    $0x4,%esp
 223:	6a 01                	push   $0x1
 225:	57                   	push   %edi
 226:	6a 00                	push   $0x0
 228:	e8 43 01 00 00       	call   370 <read>
    if(cc < 1)
 22d:	83 c4 10             	add    $0x10,%esp
 230:	85 c0                	test   %eax,%eax
 232:	7e 1d                	jle    251 <gets+0x41>
      break;
    buf[i++] = c;
 234:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 238:	8b 55 08             	mov    0x8(%ebp),%edx
 23b:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
 23d:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 23f:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 243:	74 1b                	je     260 <gets+0x50>
 245:	3c 0d                	cmp    $0xd,%al
 247:	74 17                	je     260 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 249:	8d 5e 01             	lea    0x1(%esi),%ebx
 24c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 24f:	7c cf                	jl     220 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 251:	8b 45 08             	mov    0x8(%ebp),%eax
 254:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 258:	8d 65 f4             	lea    -0xc(%ebp),%esp
 25b:	5b                   	pop    %ebx
 25c:	5e                   	pop    %esi
 25d:	5f                   	pop    %edi
 25e:	5d                   	pop    %ebp
 25f:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 260:	8b 45 08             	mov    0x8(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 263:	89 de                	mov    %ebx,%esi
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 265:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 269:	8d 65 f4             	lea    -0xc(%ebp),%esp
 26c:	5b                   	pop    %ebx
 26d:	5e                   	pop    %esi
 26e:	5f                   	pop    %edi
 26f:	5d                   	pop    %ebp
 270:	c3                   	ret    
 271:	eb 0d                	jmp    280 <stat>
 273:	90                   	nop
 274:	90                   	nop
 275:	90                   	nop
 276:	90                   	nop
 277:	90                   	nop
 278:	90                   	nop
 279:	90                   	nop
 27a:	90                   	nop
 27b:	90                   	nop
 27c:	90                   	nop
 27d:	90                   	nop
 27e:	90                   	nop
 27f:	90                   	nop

00000280 <stat>:

int
stat(char *n, struct stat *st)
{
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
 283:	56                   	push   %esi
 284:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 285:	83 ec 08             	sub    $0x8,%esp
 288:	6a 00                	push   $0x0
 28a:	ff 75 08             	pushl  0x8(%ebp)
 28d:	e8 06 01 00 00       	call   398 <open>
  if(fd < 0)
 292:	83 c4 10             	add    $0x10,%esp
 295:	85 c0                	test   %eax,%eax
 297:	78 27                	js     2c0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 299:	83 ec 08             	sub    $0x8,%esp
 29c:	ff 75 0c             	pushl  0xc(%ebp)
 29f:	89 c3                	mov    %eax,%ebx
 2a1:	50                   	push   %eax
 2a2:	e8 09 01 00 00       	call   3b0 <fstat>
  close(fd);
 2a7:	89 1c 24             	mov    %ebx,(%esp)
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
  r = fstat(fd, st);
 2aa:	89 c6                	mov    %eax,%esi
  close(fd);
 2ac:	e8 cf 00 00 00       	call   380 <close>
  return r;
 2b1:	83 c4 10             	add    $0x10,%esp
}
 2b4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2b7:	89 f0                	mov    %esi,%eax
 2b9:	5b                   	pop    %ebx
 2ba:	5e                   	pop    %esi
 2bb:	5d                   	pop    %ebp
 2bc:	c3                   	ret    
 2bd:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 2c0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2c5:	eb ed                	jmp    2b4 <stat+0x34>
 2c7:	89 f6                	mov    %esi,%esi
 2c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002d0 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 2d0:	55                   	push   %ebp
 2d1:	89 e5                	mov    %esp,%ebp
 2d3:	53                   	push   %ebx
 2d4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2d7:	0f be 11             	movsbl (%ecx),%edx
 2da:	8d 42 d0             	lea    -0x30(%edx),%eax
 2dd:	3c 09                	cmp    $0x9,%al
 2df:	b8 00 00 00 00       	mov    $0x0,%eax
 2e4:	77 1f                	ja     305 <atoi+0x35>
 2e6:	8d 76 00             	lea    0x0(%esi),%esi
 2e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 2f0:	8d 04 80             	lea    (%eax,%eax,4),%eax
 2f3:	83 c1 01             	add    $0x1,%ecx
 2f6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2fa:	0f be 11             	movsbl (%ecx),%edx
 2fd:	8d 5a d0             	lea    -0x30(%edx),%ebx
 300:	80 fb 09             	cmp    $0x9,%bl
 303:	76 eb                	jbe    2f0 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
 305:	5b                   	pop    %ebx
 306:	5d                   	pop    %ebp
 307:	c3                   	ret    
 308:	90                   	nop
 309:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000310 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 310:	55                   	push   %ebp
 311:	89 e5                	mov    %esp,%ebp
 313:	56                   	push   %esi
 314:	53                   	push   %ebx
 315:	8b 5d 10             	mov    0x10(%ebp),%ebx
 318:	8b 45 08             	mov    0x8(%ebp),%eax
 31b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 31e:	85 db                	test   %ebx,%ebx
 320:	7e 14                	jle    336 <memmove+0x26>
 322:	31 d2                	xor    %edx,%edx
 324:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 328:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 32c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 32f:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 332:	39 da                	cmp    %ebx,%edx
 334:	75 f2                	jne    328 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 336:	5b                   	pop    %ebx
 337:	5e                   	pop    %esi
 338:	5d                   	pop    %ebp
 339:	c3                   	ret    
 33a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000340 <max>:

int max(int a, int b) {
 340:	55                   	push   %ebp
 341:	89 e5                	mov    %esp,%ebp
 343:	8b 55 08             	mov    0x8(%ebp),%edx
 346:	8b 45 0c             	mov    0xc(%ebp),%eax
  if (b > a) return b;
  else return a;
}
 349:	5d                   	pop    %ebp
 34a:	39 d0                	cmp    %edx,%eax
 34c:	0f 4c c2             	cmovl  %edx,%eax
 34f:	c3                   	ret    

00000350 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 350:	b8 01 00 00 00       	mov    $0x1,%eax
 355:	cd 40                	int    $0x40
 357:	c3                   	ret    

00000358 <exit>:
SYSCALL(exit)
 358:	b8 02 00 00 00       	mov    $0x2,%eax
 35d:	cd 40                	int    $0x40
 35f:	c3                   	ret    

00000360 <wait>:
SYSCALL(wait)
 360:	b8 03 00 00 00       	mov    $0x3,%eax
 365:	cd 40                	int    $0x40
 367:	c3                   	ret    

00000368 <pipe>:
SYSCALL(pipe)
 368:	b8 04 00 00 00       	mov    $0x4,%eax
 36d:	cd 40                	int    $0x40
 36f:	c3                   	ret    

00000370 <read>:
SYSCALL(read)
 370:	b8 05 00 00 00       	mov    $0x5,%eax
 375:	cd 40                	int    $0x40
 377:	c3                   	ret    

00000378 <write>:
SYSCALL(write)
 378:	b8 10 00 00 00       	mov    $0x10,%eax
 37d:	cd 40                	int    $0x40
 37f:	c3                   	ret    

00000380 <close>:
SYSCALL(close)
 380:	b8 15 00 00 00       	mov    $0x15,%eax
 385:	cd 40                	int    $0x40
 387:	c3                   	ret    

00000388 <kill>:
SYSCALL(kill)
 388:	b8 06 00 00 00       	mov    $0x6,%eax
 38d:	cd 40                	int    $0x40
 38f:	c3                   	ret    

00000390 <exec>:
SYSCALL(exec)
 390:	b8 07 00 00 00       	mov    $0x7,%eax
 395:	cd 40                	int    $0x40
 397:	c3                   	ret    

00000398 <open>:
SYSCALL(open)
 398:	b8 0f 00 00 00       	mov    $0xf,%eax
 39d:	cd 40                	int    $0x40
 39f:	c3                   	ret    

000003a0 <mknod>:
SYSCALL(mknod)
 3a0:	b8 11 00 00 00       	mov    $0x11,%eax
 3a5:	cd 40                	int    $0x40
 3a7:	c3                   	ret    

000003a8 <unlink>:
SYSCALL(unlink)
 3a8:	b8 12 00 00 00       	mov    $0x12,%eax
 3ad:	cd 40                	int    $0x40
 3af:	c3                   	ret    

000003b0 <fstat>:
SYSCALL(fstat)
 3b0:	b8 08 00 00 00       	mov    $0x8,%eax
 3b5:	cd 40                	int    $0x40
 3b7:	c3                   	ret    

000003b8 <link>:
SYSCALL(link)
 3b8:	b8 13 00 00 00       	mov    $0x13,%eax
 3bd:	cd 40                	int    $0x40
 3bf:	c3                   	ret    

000003c0 <mkdir>:
SYSCALL(mkdir)
 3c0:	b8 14 00 00 00       	mov    $0x14,%eax
 3c5:	cd 40                	int    $0x40
 3c7:	c3                   	ret    

000003c8 <chdir>:
SYSCALL(chdir)
 3c8:	b8 09 00 00 00       	mov    $0x9,%eax
 3cd:	cd 40                	int    $0x40
 3cf:	c3                   	ret    

000003d0 <dup>:
SYSCALL(dup)
 3d0:	b8 0a 00 00 00       	mov    $0xa,%eax
 3d5:	cd 40                	int    $0x40
 3d7:	c3                   	ret    

000003d8 <getpid>:
SYSCALL(getpid)
 3d8:	b8 0b 00 00 00       	mov    $0xb,%eax
 3dd:	cd 40                	int    $0x40
 3df:	c3                   	ret    

000003e0 <sbrk>:
SYSCALL(sbrk)
 3e0:	b8 0c 00 00 00       	mov    $0xc,%eax
 3e5:	cd 40                	int    $0x40
 3e7:	c3                   	ret    

000003e8 <sleep>:
SYSCALL(sleep)
 3e8:	b8 0d 00 00 00       	mov    $0xd,%eax
 3ed:	cd 40                	int    $0x40
 3ef:	c3                   	ret    

000003f0 <uptime>:
SYSCALL(uptime)
 3f0:	b8 0e 00 00 00       	mov    $0xe,%eax
 3f5:	cd 40                	int    $0x40
 3f7:	c3                   	ret    

000003f8 <setVariable>:
SYSCALL(setVariable)
 3f8:	b8 17 00 00 00       	mov    $0x17,%eax
 3fd:	cd 40                	int    $0x40
 3ff:	c3                   	ret    

00000400 <getVariable>:
SYSCALL(getVariable)
 400:	b8 18 00 00 00       	mov    $0x18,%eax
 405:	cd 40                	int    $0x40
 407:	c3                   	ret    

00000408 <remVariable>:
SYSCALL(remVariable)
 408:	b8 19 00 00 00       	mov    $0x19,%eax
 40d:	cd 40                	int    $0x40
 40f:	c3                   	ret    

00000410 <wait2>:
SYSCALL(wait2)
 410:	b8 1a 00 00 00       	mov    $0x1a,%eax
 415:	cd 40                	int    $0x40
 417:	c3                   	ret    
 418:	66 90                	xchg   %ax,%ax
 41a:	66 90                	xchg   %ax,%ax
 41c:	66 90                	xchg   %ax,%ax
 41e:	66 90                	xchg   %ax,%ax

00000420 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 420:	55                   	push   %ebp
 421:	89 e5                	mov    %esp,%ebp
 423:	57                   	push   %edi
 424:	56                   	push   %esi
 425:	53                   	push   %ebx
 426:	89 c6                	mov    %eax,%esi
 428:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 42b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 42e:	85 db                	test   %ebx,%ebx
 430:	74 7e                	je     4b0 <printint+0x90>
 432:	89 d0                	mov    %edx,%eax
 434:	c1 e8 1f             	shr    $0x1f,%eax
 437:	84 c0                	test   %al,%al
 439:	74 75                	je     4b0 <printint+0x90>
    neg = 1;
    x = -xx;
 43b:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 43d:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
 444:	f7 d8                	neg    %eax
 446:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 449:	31 ff                	xor    %edi,%edi
 44b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 44e:	89 ce                	mov    %ecx,%esi
 450:	eb 08                	jmp    45a <printint+0x3a>
 452:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 458:	89 cf                	mov    %ecx,%edi
 45a:	31 d2                	xor    %edx,%edx
 45c:	8d 4f 01             	lea    0x1(%edi),%ecx
 45f:	f7 f6                	div    %esi
 461:	0f b6 92 f0 07 00 00 	movzbl 0x7f0(%edx),%edx
  }while((x /= base) != 0);
 468:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 46a:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 46d:	75 e9                	jne    458 <printint+0x38>
  if(neg)
 46f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 472:	8b 75 c0             	mov    -0x40(%ebp),%esi
 475:	85 c0                	test   %eax,%eax
 477:	74 08                	je     481 <printint+0x61>
    buf[i++] = '-';
 479:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
 47e:	8d 4f 02             	lea    0x2(%edi),%ecx

  while(--i >= 0)
 481:	8d 79 ff             	lea    -0x1(%ecx),%edi
 484:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 488:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 48d:	83 ec 04             	sub    $0x4,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 490:	83 ef 01             	sub    $0x1,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 493:	6a 01                	push   $0x1
 495:	53                   	push   %ebx
 496:	56                   	push   %esi
 497:	88 45 d7             	mov    %al,-0x29(%ebp)
 49a:	e8 d9 fe ff ff       	call   378 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 49f:	83 c4 10             	add    $0x10,%esp
 4a2:	83 ff ff             	cmp    $0xffffffff,%edi
 4a5:	75 e1                	jne    488 <printint+0x68>
    putc(fd, buf[i]);
}
 4a7:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4aa:	5b                   	pop    %ebx
 4ab:	5e                   	pop    %esi
 4ac:	5f                   	pop    %edi
 4ad:	5d                   	pop    %ebp
 4ae:	c3                   	ret    
 4af:	90                   	nop
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 4b0:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 4b2:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 4b9:	eb 8b                	jmp    446 <printint+0x26>
 4bb:	90                   	nop
 4bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000004c0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 4c0:	55                   	push   %ebp
 4c1:	89 e5                	mov    %esp,%ebp
 4c3:	57                   	push   %edi
 4c4:	56                   	push   %esi
 4c5:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4c6:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 4c9:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4cc:	8b 75 0c             	mov    0xc(%ebp),%esi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 4cf:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4d2:	89 45 d0             	mov    %eax,-0x30(%ebp)
 4d5:	0f b6 1e             	movzbl (%esi),%ebx
 4d8:	83 c6 01             	add    $0x1,%esi
 4db:	84 db                	test   %bl,%bl
 4dd:	0f 84 b0 00 00 00    	je     593 <printf+0xd3>
 4e3:	31 d2                	xor    %edx,%edx
 4e5:	eb 39                	jmp    520 <printf+0x60>
 4e7:	89 f6                	mov    %esi,%esi
 4e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 4f0:	83 f8 25             	cmp    $0x25,%eax
 4f3:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
 4f6:	ba 25 00 00 00       	mov    $0x25,%edx
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 4fb:	74 18                	je     515 <printf+0x55>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 4fd:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 500:	83 ec 04             	sub    $0x4,%esp
 503:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 506:	6a 01                	push   $0x1
 508:	50                   	push   %eax
 509:	57                   	push   %edi
 50a:	e8 69 fe ff ff       	call   378 <write>
 50f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 512:	83 c4 10             	add    $0x10,%esp
 515:	83 c6 01             	add    $0x1,%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 518:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 51c:	84 db                	test   %bl,%bl
 51e:	74 73                	je     593 <printf+0xd3>
    c = fmt[i] & 0xff;
    if(state == 0){
 520:	85 d2                	test   %edx,%edx
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
 522:	0f be cb             	movsbl %bl,%ecx
 525:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 528:	74 c6                	je     4f0 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 52a:	83 fa 25             	cmp    $0x25,%edx
 52d:	75 e6                	jne    515 <printf+0x55>
      if(c == 'd'){
 52f:	83 f8 64             	cmp    $0x64,%eax
 532:	0f 84 f8 00 00 00    	je     630 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 538:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 53e:	83 f9 70             	cmp    $0x70,%ecx
 541:	74 5d                	je     5a0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 543:	83 f8 73             	cmp    $0x73,%eax
 546:	0f 84 84 00 00 00    	je     5d0 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 54c:	83 f8 63             	cmp    $0x63,%eax
 54f:	0f 84 ea 00 00 00    	je     63f <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 555:	83 f8 25             	cmp    $0x25,%eax
 558:	0f 84 c2 00 00 00    	je     620 <printf+0x160>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 55e:	8d 45 e7             	lea    -0x19(%ebp),%eax
 561:	83 ec 04             	sub    $0x4,%esp
 564:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 568:	6a 01                	push   $0x1
 56a:	50                   	push   %eax
 56b:	57                   	push   %edi
 56c:	e8 07 fe ff ff       	call   378 <write>
 571:	83 c4 0c             	add    $0xc,%esp
 574:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 577:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 57a:	6a 01                	push   $0x1
 57c:	50                   	push   %eax
 57d:	57                   	push   %edi
 57e:	83 c6 01             	add    $0x1,%esi
 581:	e8 f2 fd ff ff       	call   378 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 586:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 58a:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 58d:	31 d2                	xor    %edx,%edx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 58f:	84 db                	test   %bl,%bl
 591:	75 8d                	jne    520 <printf+0x60>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 593:	8d 65 f4             	lea    -0xc(%ebp),%esp
 596:	5b                   	pop    %ebx
 597:	5e                   	pop    %esi
 598:	5f                   	pop    %edi
 599:	5d                   	pop    %ebp
 59a:	c3                   	ret    
 59b:	90                   	nop
 59c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 5a0:	83 ec 0c             	sub    $0xc,%esp
 5a3:	b9 10 00 00 00       	mov    $0x10,%ecx
 5a8:	6a 00                	push   $0x0
 5aa:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 5ad:	89 f8                	mov    %edi,%eax
 5af:	8b 13                	mov    (%ebx),%edx
 5b1:	e8 6a fe ff ff       	call   420 <printint>
        ap++;
 5b6:	89 d8                	mov    %ebx,%eax
 5b8:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 5bb:	31 d2                	xor    %edx,%edx
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
 5bd:	83 c0 04             	add    $0x4,%eax
 5c0:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5c3:	e9 4d ff ff ff       	jmp    515 <printf+0x55>
 5c8:	90                   	nop
 5c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
 5d0:	8b 45 d0             	mov    -0x30(%ebp),%eax
 5d3:	8b 18                	mov    (%eax),%ebx
        ap++;
 5d5:	83 c0 04             	add    $0x4,%eax
 5d8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 5db:	85 db                	test   %ebx,%ebx
 5dd:	74 7c                	je     65b <printf+0x19b>
          s = "(null)";
        while(*s != 0){
 5df:	0f b6 03             	movzbl (%ebx),%eax
 5e2:	84 c0                	test   %al,%al
 5e4:	74 29                	je     60f <printf+0x14f>
 5e6:	8d 76 00             	lea    0x0(%esi),%esi
 5e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 5f0:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 5f3:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 5f6:	83 ec 04             	sub    $0x4,%esp
 5f9:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
 5fb:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 5fe:	50                   	push   %eax
 5ff:	57                   	push   %edi
 600:	e8 73 fd ff ff       	call   378 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 605:	0f b6 03             	movzbl (%ebx),%eax
 608:	83 c4 10             	add    $0x10,%esp
 60b:	84 c0                	test   %al,%al
 60d:	75 e1                	jne    5f0 <printf+0x130>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 60f:	31 d2                	xor    %edx,%edx
 611:	e9 ff fe ff ff       	jmp    515 <printf+0x55>
 616:	8d 76 00             	lea    0x0(%esi),%esi
 619:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 620:	83 ec 04             	sub    $0x4,%esp
 623:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 626:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 629:	6a 01                	push   $0x1
 62b:	e9 4c ff ff ff       	jmp    57c <printf+0xbc>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 630:	83 ec 0c             	sub    $0xc,%esp
 633:	b9 0a 00 00 00       	mov    $0xa,%ecx
 638:	6a 01                	push   $0x1
 63a:	e9 6b ff ff ff       	jmp    5aa <printf+0xea>
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 63f:	8b 5d d0             	mov    -0x30(%ebp),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 642:	83 ec 04             	sub    $0x4,%esp
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 645:	8b 03                	mov    (%ebx),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 647:	6a 01                	push   $0x1
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 649:	88 45 e4             	mov    %al,-0x1c(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 64c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 64f:	50                   	push   %eax
 650:	57                   	push   %edi
 651:	e8 22 fd ff ff       	call   378 <write>
 656:	e9 5b ff ff ff       	jmp    5b6 <printf+0xf6>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 65b:	b8 28 00 00 00       	mov    $0x28,%eax
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
 660:	bb e9 07 00 00       	mov    $0x7e9,%ebx
 665:	eb 89                	jmp    5f0 <printf+0x130>
 667:	66 90                	xchg   %ax,%ax
 669:	66 90                	xchg   %ax,%ax
 66b:	66 90                	xchg   %ax,%ax
 66d:	66 90                	xchg   %ax,%ax
 66f:	90                   	nop

00000670 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 670:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 671:	a1 18 0b 00 00       	mov    0xb18,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 676:	89 e5                	mov    %esp,%ebp
 678:	57                   	push   %edi
 679:	56                   	push   %esi
 67a:	53                   	push   %ebx
 67b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 67e:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
 680:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 683:	39 c8                	cmp    %ecx,%eax
 685:	73 19                	jae    6a0 <free+0x30>
 687:	89 f6                	mov    %esi,%esi
 689:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 690:	39 d1                	cmp    %edx,%ecx
 692:	72 1c                	jb     6b0 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 694:	39 d0                	cmp    %edx,%eax
 696:	73 18                	jae    6b0 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
 698:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 69a:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 69c:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 69e:	72 f0                	jb     690 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6a0:	39 d0                	cmp    %edx,%eax
 6a2:	72 f4                	jb     698 <free+0x28>
 6a4:	39 d1                	cmp    %edx,%ecx
 6a6:	73 f0                	jae    698 <free+0x28>
 6a8:	90                   	nop
 6a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
 6b0:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6b3:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 6b6:	39 fa                	cmp    %edi,%edx
 6b8:	74 19                	je     6d3 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 6ba:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 6bd:	8b 50 04             	mov    0x4(%eax),%edx
 6c0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6c3:	39 f1                	cmp    %esi,%ecx
 6c5:	74 23                	je     6ea <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 6c7:	89 08                	mov    %ecx,(%eax)
  freep = p;
 6c9:	a3 18 0b 00 00       	mov    %eax,0xb18
}
 6ce:	5b                   	pop    %ebx
 6cf:	5e                   	pop    %esi
 6d0:	5f                   	pop    %edi
 6d1:	5d                   	pop    %ebp
 6d2:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 6d3:	03 72 04             	add    0x4(%edx),%esi
 6d6:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 6d9:	8b 10                	mov    (%eax),%edx
 6db:	8b 12                	mov    (%edx),%edx
 6dd:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 6e0:	8b 50 04             	mov    0x4(%eax),%edx
 6e3:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6e6:	39 f1                	cmp    %esi,%ecx
 6e8:	75 dd                	jne    6c7 <free+0x57>
    p->s.size += bp->s.size;
 6ea:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 6ed:	a3 18 0b 00 00       	mov    %eax,0xb18
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 6f2:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6f5:	8b 53 f8             	mov    -0x8(%ebx),%edx
 6f8:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 6fa:	5b                   	pop    %ebx
 6fb:	5e                   	pop    %esi
 6fc:	5f                   	pop    %edi
 6fd:	5d                   	pop    %ebp
 6fe:	c3                   	ret    
 6ff:	90                   	nop

00000700 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 700:	55                   	push   %ebp
 701:	89 e5                	mov    %esp,%ebp
 703:	57                   	push   %edi
 704:	56                   	push   %esi
 705:	53                   	push   %ebx
 706:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 709:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 70c:	8b 15 18 0b 00 00    	mov    0xb18,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 712:	8d 78 07             	lea    0x7(%eax),%edi
 715:	c1 ef 03             	shr    $0x3,%edi
 718:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 71b:	85 d2                	test   %edx,%edx
 71d:	0f 84 93 00 00 00    	je     7b6 <malloc+0xb6>
 723:	8b 02                	mov    (%edx),%eax
 725:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 728:	39 cf                	cmp    %ecx,%edi
 72a:	76 64                	jbe    790 <malloc+0x90>
 72c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 732:	bb 00 10 00 00       	mov    $0x1000,%ebx
 737:	0f 43 df             	cmovae %edi,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 73a:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 741:	eb 0e                	jmp    751 <malloc+0x51>
 743:	90                   	nop
 744:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 748:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 74a:	8b 48 04             	mov    0x4(%eax),%ecx
 74d:	39 cf                	cmp    %ecx,%edi
 74f:	76 3f                	jbe    790 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 751:	39 05 18 0b 00 00    	cmp    %eax,0xb18
 757:	89 c2                	mov    %eax,%edx
 759:	75 ed                	jne    748 <malloc+0x48>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 75b:	83 ec 0c             	sub    $0xc,%esp
 75e:	56                   	push   %esi
 75f:	e8 7c fc ff ff       	call   3e0 <sbrk>
  if(p == (char*)-1)
 764:	83 c4 10             	add    $0x10,%esp
 767:	83 f8 ff             	cmp    $0xffffffff,%eax
 76a:	74 1c                	je     788 <malloc+0x88>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 76c:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 76f:	83 ec 0c             	sub    $0xc,%esp
 772:	83 c0 08             	add    $0x8,%eax
 775:	50                   	push   %eax
 776:	e8 f5 fe ff ff       	call   670 <free>
  return freep;
 77b:	8b 15 18 0b 00 00    	mov    0xb18,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 781:	83 c4 10             	add    $0x10,%esp
 784:	85 d2                	test   %edx,%edx
 786:	75 c0                	jne    748 <malloc+0x48>
        return 0;
 788:	31 c0                	xor    %eax,%eax
 78a:	eb 1c                	jmp    7a8 <malloc+0xa8>
 78c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 790:	39 cf                	cmp    %ecx,%edi
 792:	74 1c                	je     7b0 <malloc+0xb0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 794:	29 f9                	sub    %edi,%ecx
 796:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 799:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 79c:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
 79f:	89 15 18 0b 00 00    	mov    %edx,0xb18
      return (void*)(p + 1);
 7a5:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 7a8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7ab:	5b                   	pop    %ebx
 7ac:	5e                   	pop    %esi
 7ad:	5f                   	pop    %edi
 7ae:	5d                   	pop    %ebp
 7af:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 7b0:	8b 08                	mov    (%eax),%ecx
 7b2:	89 0a                	mov    %ecx,(%edx)
 7b4:	eb e9                	jmp    79f <malloc+0x9f>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 7b6:	c7 05 18 0b 00 00 1c 	movl   $0xb1c,0xb18
 7bd:	0b 00 00 
 7c0:	c7 05 1c 0b 00 00 1c 	movl   $0xb1c,0xb1c
 7c7:	0b 00 00 
    base.s.size = 0;
 7ca:	b8 1c 0b 00 00       	mov    $0xb1c,%eax
 7cf:	c7 05 20 0b 00 00 00 	movl   $0x0,0xb20
 7d6:	00 00 00 
 7d9:	e9 4e ff ff ff       	jmp    72c <malloc+0x2c>
