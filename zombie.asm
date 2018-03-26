
_zombie:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(void)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	83 ec 04             	sub    $0x4,%esp
  if(fork() > 0)
  11:	e8 fa 02 00 00       	call   310 <fork>
  16:	85 c0                	test   %eax,%eax
  18:	7e 0d                	jle    27 <main+0x27>
    sleep(5);  // Let child exit before parent.
  1a:	83 ec 0c             	sub    $0xc,%esp
  1d:	6a 05                	push   $0x5
  1f:	e8 84 03 00 00       	call   3a8 <sleep>
  24:	83 c4 10             	add    $0x10,%esp
  exit();
  27:	e8 ec 02 00 00       	call   318 <exit>
  2c:	66 90                	xchg   %ax,%ax
  2e:	66 90                	xchg   %ax,%ax

00000030 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  30:	55                   	push   %ebp
  31:	89 e5                	mov    %esp,%ebp
  33:	53                   	push   %ebx
  34:	8b 45 08             	mov    0x8(%ebp),%eax
  37:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  3a:	89 c2                	mov    %eax,%edx
  3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  40:	83 c1 01             	add    $0x1,%ecx
  43:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
  47:	83 c2 01             	add    $0x1,%edx
  4a:	84 db                	test   %bl,%bl
  4c:	88 5a ff             	mov    %bl,-0x1(%edx)
  4f:	75 ef                	jne    40 <strcpy+0x10>
    ;
  return os;
}
  51:	5b                   	pop    %ebx
  52:	5d                   	pop    %ebp
  53:	c3                   	ret    
  54:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  5a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000060 <strncpy>:

char* strncpy(char* s, char* t, int n) {
  60:	55                   	push   %ebp
  int i = 0;
  61:	31 d2                	xor    %edx,%edx
  while((*s++ = *t++) != 0)
    ;
  return os;
}

char* strncpy(char* s, char* t, int n) {
  63:	89 e5                	mov    %esp,%ebp
  65:	56                   	push   %esi
  66:	53                   	push   %ebx
  67:	8b 45 08             	mov    0x8(%ebp),%eax
  6a:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  6d:	8b 75 10             	mov    0x10(%ebp),%esi
  int i = 0;
  char *os;
  os = s;
  while(((*s++ = *t++) != 0) && (++i < n));
  70:	eb 0d                	jmp    7f <strncpy+0x1f>
  72:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  78:	83 c2 01             	add    $0x1,%edx
  7b:	39 f2                	cmp    %esi,%edx
  7d:	7d 0b                	jge    8a <strncpy+0x2a>
  7f:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
  83:	84 c9                	test   %cl,%cl
  85:	88 0c 10             	mov    %cl,(%eax,%edx,1)
  88:	75 ee                	jne    78 <strncpy+0x18>
  return os;
}
  8a:	5b                   	pop    %ebx
  8b:	5e                   	pop    %esi
  8c:	5d                   	pop    %ebp
  8d:	c3                   	ret    
  8e:	66 90                	xchg   %ax,%ax

00000090 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  90:	55                   	push   %ebp
  91:	89 e5                	mov    %esp,%ebp
  93:	56                   	push   %esi
  94:	53                   	push   %ebx
  95:	8b 55 08             	mov    0x8(%ebp),%edx
  98:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  9b:	0f b6 02             	movzbl (%edx),%eax
  9e:	0f b6 19             	movzbl (%ecx),%ebx
  a1:	84 c0                	test   %al,%al
  a3:	75 1e                	jne    c3 <strcmp+0x33>
  a5:	eb 29                	jmp    d0 <strcmp+0x40>
  a7:	89 f6                	mov    %esi,%esi
  a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
  b0:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  b3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
  b6:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  b9:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
  bd:	84 c0                	test   %al,%al
  bf:	74 0f                	je     d0 <strcmp+0x40>
  c1:	89 f1                	mov    %esi,%ecx
  c3:	38 d8                	cmp    %bl,%al
  c5:	74 e9                	je     b0 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
  c7:	29 d8                	sub    %ebx,%eax
}
  c9:	5b                   	pop    %ebx
  ca:	5e                   	pop    %esi
  cb:	5d                   	pop    %ebp
  cc:	c3                   	ret    
  cd:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  d0:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
  d2:	29 d8                	sub    %ebx,%eax
}
  d4:	5b                   	pop    %ebx
  d5:	5e                   	pop    %esi
  d6:	5d                   	pop    %ebp
  d7:	c3                   	ret    
  d8:	90                   	nop
  d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000000e0 <strncmp>:

int strncmp(const char *p, const char *q, int n) {
  e0:	55                   	push   %ebp
  e1:	89 e5                	mov    %esp,%ebp
  e3:	57                   	push   %edi
  e4:	56                   	push   %esi
  e5:	53                   	push   %ebx
  e6:	8b 5d 10             	mov    0x10(%ebp),%ebx
  e9:	8b 75 08             	mov    0x8(%ebp),%esi
  ec:	8b 7d 0c             	mov    0xc(%ebp),%edi
  int i = 0;
  while(i < n && *p == *q)
  ef:	85 db                	test   %ebx,%ebx
  f1:	7e 28                	jle    11b <strncmp+0x3b>
  f3:	0f b6 16             	movzbl (%esi),%edx
  f6:	0f b6 0f             	movzbl (%edi),%ecx
  f9:	38 d1                	cmp    %dl,%cl
  fb:	75 2b                	jne    128 <strncmp+0x48>
  fd:	31 c0                	xor    %eax,%eax
  ff:	eb 13                	jmp    114 <strncmp+0x34>
 101:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 108:	0f b6 14 06          	movzbl (%esi,%eax,1),%edx
 10c:	0f b6 0c 07          	movzbl (%edi,%eax,1),%ecx
 110:	38 ca                	cmp    %cl,%dl
 112:	75 14                	jne    128 <strncmp+0x48>
    p++, q++, i++;
 114:	83 c0 01             	add    $0x1,%eax
  return (uchar)*p - (uchar)*q;
}

int strncmp(const char *p, const char *q, int n) {
  int i = 0;
  while(i < n && *p == *q)
 117:	39 c3                	cmp    %eax,%ebx
 119:	75 ed                	jne    108 <strncmp+0x28>
    p++, q++, i++;
  if (i < n)
    return (uchar)*p - (uchar)*q;
  else
    return 0;
}
 11b:	5b                   	pop    %ebx
  while(i < n && *p == *q)
    p++, q++, i++;
  if (i < n)
    return (uchar)*p - (uchar)*q;
  else
    return 0;
 11c:	31 c0                	xor    %eax,%eax
}
 11e:	5e                   	pop    %esi
 11f:	5f                   	pop    %edi
 120:	5d                   	pop    %ebp
 121:	c3                   	ret    
 122:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
int strncmp(const char *p, const char *q, int n) {
  int i = 0;
  while(i < n && *p == *q)
    p++, q++, i++;
  if (i < n)
    return (uchar)*p - (uchar)*q;
 128:	0f b6 c2             	movzbl %dl,%eax
  else
    return 0;
}
 12b:	5b                   	pop    %ebx
int strncmp(const char *p, const char *q, int n) {
  int i = 0;
  while(i < n && *p == *q)
    p++, q++, i++;
  if (i < n)
    return (uchar)*p - (uchar)*q;
 12c:	29 c8                	sub    %ecx,%eax
  else
    return 0;
}
 12e:	5e                   	pop    %esi
 12f:	5f                   	pop    %edi
 130:	5d                   	pop    %ebp
 131:	c3                   	ret    
 132:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 139:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000140 <strlen>:

uint
strlen(char *s)
{
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 146:	80 39 00             	cmpb   $0x0,(%ecx)
 149:	74 12                	je     15d <strlen+0x1d>
 14b:	31 d2                	xor    %edx,%edx
 14d:	8d 76 00             	lea    0x0(%esi),%esi
 150:	83 c2 01             	add    $0x1,%edx
 153:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 157:	89 d0                	mov    %edx,%eax
 159:	75 f5                	jne    150 <strlen+0x10>
    ;
  return n;
}
 15b:	5d                   	pop    %ebp
 15c:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 15d:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
 15f:	5d                   	pop    %ebp
 160:	c3                   	ret    
 161:	eb 0d                	jmp    170 <memset>
 163:	90                   	nop
 164:	90                   	nop
 165:	90                   	nop
 166:	90                   	nop
 167:	90                   	nop
 168:	90                   	nop
 169:	90                   	nop
 16a:	90                   	nop
 16b:	90                   	nop
 16c:	90                   	nop
 16d:	90                   	nop
 16e:	90                   	nop
 16f:	90                   	nop

00000170 <memset>:

void*
memset(void *dst, int c, uint n)
{
 170:	55                   	push   %ebp
 171:	89 e5                	mov    %esp,%ebp
 173:	57                   	push   %edi
 174:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 177:	8b 4d 10             	mov    0x10(%ebp),%ecx
 17a:	8b 45 0c             	mov    0xc(%ebp),%eax
 17d:	89 d7                	mov    %edx,%edi
 17f:	fc                   	cld    
 180:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 182:	89 d0                	mov    %edx,%eax
 184:	5f                   	pop    %edi
 185:	5d                   	pop    %ebp
 186:	c3                   	ret    
 187:	89 f6                	mov    %esi,%esi
 189:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000190 <strchr>:

char*
strchr(const char *s, char c)
{
 190:	55                   	push   %ebp
 191:	89 e5                	mov    %esp,%ebp
 193:	53                   	push   %ebx
 194:	8b 45 08             	mov    0x8(%ebp),%eax
 197:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 19a:	0f b6 10             	movzbl (%eax),%edx
 19d:	84 d2                	test   %dl,%dl
 19f:	74 1d                	je     1be <strchr+0x2e>
    if(*s == c)
 1a1:	38 d3                	cmp    %dl,%bl
 1a3:	89 d9                	mov    %ebx,%ecx
 1a5:	75 0d                	jne    1b4 <strchr+0x24>
 1a7:	eb 17                	jmp    1c0 <strchr+0x30>
 1a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1b0:	38 ca                	cmp    %cl,%dl
 1b2:	74 0c                	je     1c0 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 1b4:	83 c0 01             	add    $0x1,%eax
 1b7:	0f b6 10             	movzbl (%eax),%edx
 1ba:	84 d2                	test   %dl,%dl
 1bc:	75 f2                	jne    1b0 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
 1be:	31 c0                	xor    %eax,%eax
}
 1c0:	5b                   	pop    %ebx
 1c1:	5d                   	pop    %ebp
 1c2:	c3                   	ret    
 1c3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001d0 <gets>:

char*
gets(char *buf, int max)
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	57                   	push   %edi
 1d4:	56                   	push   %esi
 1d5:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1d6:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
 1d8:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
 1db:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1de:	eb 29                	jmp    209 <gets+0x39>
    cc = read(0, &c, 1);
 1e0:	83 ec 04             	sub    $0x4,%esp
 1e3:	6a 01                	push   $0x1
 1e5:	57                   	push   %edi
 1e6:	6a 00                	push   $0x0
 1e8:	e8 43 01 00 00       	call   330 <read>
    if(cc < 1)
 1ed:	83 c4 10             	add    $0x10,%esp
 1f0:	85 c0                	test   %eax,%eax
 1f2:	7e 1d                	jle    211 <gets+0x41>
      break;
    buf[i++] = c;
 1f4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1f8:	8b 55 08             	mov    0x8(%ebp),%edx
 1fb:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
 1fd:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 1ff:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 203:	74 1b                	je     220 <gets+0x50>
 205:	3c 0d                	cmp    $0xd,%al
 207:	74 17                	je     220 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 209:	8d 5e 01             	lea    0x1(%esi),%ebx
 20c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 20f:	7c cf                	jl     1e0 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 211:	8b 45 08             	mov    0x8(%ebp),%eax
 214:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 218:	8d 65 f4             	lea    -0xc(%ebp),%esp
 21b:	5b                   	pop    %ebx
 21c:	5e                   	pop    %esi
 21d:	5f                   	pop    %edi
 21e:	5d                   	pop    %ebp
 21f:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 220:	8b 45 08             	mov    0x8(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 223:	89 de                	mov    %ebx,%esi
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 225:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 229:	8d 65 f4             	lea    -0xc(%ebp),%esp
 22c:	5b                   	pop    %ebx
 22d:	5e                   	pop    %esi
 22e:	5f                   	pop    %edi
 22f:	5d                   	pop    %ebp
 230:	c3                   	ret    
 231:	eb 0d                	jmp    240 <stat>
 233:	90                   	nop
 234:	90                   	nop
 235:	90                   	nop
 236:	90                   	nop
 237:	90                   	nop
 238:	90                   	nop
 239:	90                   	nop
 23a:	90                   	nop
 23b:	90                   	nop
 23c:	90                   	nop
 23d:	90                   	nop
 23e:	90                   	nop
 23f:	90                   	nop

00000240 <stat>:

int
stat(char *n, struct stat *st)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	56                   	push   %esi
 244:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 245:	83 ec 08             	sub    $0x8,%esp
 248:	6a 00                	push   $0x0
 24a:	ff 75 08             	pushl  0x8(%ebp)
 24d:	e8 06 01 00 00       	call   358 <open>
  if(fd < 0)
 252:	83 c4 10             	add    $0x10,%esp
 255:	85 c0                	test   %eax,%eax
 257:	78 27                	js     280 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 259:	83 ec 08             	sub    $0x8,%esp
 25c:	ff 75 0c             	pushl  0xc(%ebp)
 25f:	89 c3                	mov    %eax,%ebx
 261:	50                   	push   %eax
 262:	e8 09 01 00 00       	call   370 <fstat>
  close(fd);
 267:	89 1c 24             	mov    %ebx,(%esp)
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
  r = fstat(fd, st);
 26a:	89 c6                	mov    %eax,%esi
  close(fd);
 26c:	e8 cf 00 00 00       	call   340 <close>
  return r;
 271:	83 c4 10             	add    $0x10,%esp
}
 274:	8d 65 f8             	lea    -0x8(%ebp),%esp
 277:	89 f0                	mov    %esi,%eax
 279:	5b                   	pop    %ebx
 27a:	5e                   	pop    %esi
 27b:	5d                   	pop    %ebp
 27c:	c3                   	ret    
 27d:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 280:	be ff ff ff ff       	mov    $0xffffffff,%esi
 285:	eb ed                	jmp    274 <stat+0x34>
 287:	89 f6                	mov    %esi,%esi
 289:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000290 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 290:	55                   	push   %ebp
 291:	89 e5                	mov    %esp,%ebp
 293:	53                   	push   %ebx
 294:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 297:	0f be 11             	movsbl (%ecx),%edx
 29a:	8d 42 d0             	lea    -0x30(%edx),%eax
 29d:	3c 09                	cmp    $0x9,%al
 29f:	b8 00 00 00 00       	mov    $0x0,%eax
 2a4:	77 1f                	ja     2c5 <atoi+0x35>
 2a6:	8d 76 00             	lea    0x0(%esi),%esi
 2a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 2b0:	8d 04 80             	lea    (%eax,%eax,4),%eax
 2b3:	83 c1 01             	add    $0x1,%ecx
 2b6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2ba:	0f be 11             	movsbl (%ecx),%edx
 2bd:	8d 5a d0             	lea    -0x30(%edx),%ebx
 2c0:	80 fb 09             	cmp    $0x9,%bl
 2c3:	76 eb                	jbe    2b0 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
 2c5:	5b                   	pop    %ebx
 2c6:	5d                   	pop    %ebp
 2c7:	c3                   	ret    
 2c8:	90                   	nop
 2c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000002d0 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 2d0:	55                   	push   %ebp
 2d1:	89 e5                	mov    %esp,%ebp
 2d3:	56                   	push   %esi
 2d4:	53                   	push   %ebx
 2d5:	8b 5d 10             	mov    0x10(%ebp),%ebx
 2d8:	8b 45 08             	mov    0x8(%ebp),%eax
 2db:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2de:	85 db                	test   %ebx,%ebx
 2e0:	7e 14                	jle    2f6 <memmove+0x26>
 2e2:	31 d2                	xor    %edx,%edx
 2e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 2e8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 2ec:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 2ef:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2f2:	39 da                	cmp    %ebx,%edx
 2f4:	75 f2                	jne    2e8 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 2f6:	5b                   	pop    %ebx
 2f7:	5e                   	pop    %esi
 2f8:	5d                   	pop    %ebp
 2f9:	c3                   	ret    
 2fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000300 <max>:

int max(int a, int b) {
 300:	55                   	push   %ebp
 301:	89 e5                	mov    %esp,%ebp
 303:	8b 55 08             	mov    0x8(%ebp),%edx
 306:	8b 45 0c             	mov    0xc(%ebp),%eax
  if (b > a) return b;
  else return a;
}
 309:	5d                   	pop    %ebp
 30a:	39 d0                	cmp    %edx,%eax
 30c:	0f 4c c2             	cmovl  %edx,%eax
 30f:	c3                   	ret    

00000310 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 310:	b8 01 00 00 00       	mov    $0x1,%eax
 315:	cd 40                	int    $0x40
 317:	c3                   	ret    

00000318 <exit>:
SYSCALL(exit)
 318:	b8 02 00 00 00       	mov    $0x2,%eax
 31d:	cd 40                	int    $0x40
 31f:	c3                   	ret    

00000320 <wait>:
SYSCALL(wait)
 320:	b8 03 00 00 00       	mov    $0x3,%eax
 325:	cd 40                	int    $0x40
 327:	c3                   	ret    

00000328 <pipe>:
SYSCALL(pipe)
 328:	b8 04 00 00 00       	mov    $0x4,%eax
 32d:	cd 40                	int    $0x40
 32f:	c3                   	ret    

00000330 <read>:
SYSCALL(read)
 330:	b8 05 00 00 00       	mov    $0x5,%eax
 335:	cd 40                	int    $0x40
 337:	c3                   	ret    

00000338 <write>:
SYSCALL(write)
 338:	b8 10 00 00 00       	mov    $0x10,%eax
 33d:	cd 40                	int    $0x40
 33f:	c3                   	ret    

00000340 <close>:
SYSCALL(close)
 340:	b8 15 00 00 00       	mov    $0x15,%eax
 345:	cd 40                	int    $0x40
 347:	c3                   	ret    

00000348 <kill>:
SYSCALL(kill)
 348:	b8 06 00 00 00       	mov    $0x6,%eax
 34d:	cd 40                	int    $0x40
 34f:	c3                   	ret    

00000350 <exec>:
SYSCALL(exec)
 350:	b8 07 00 00 00       	mov    $0x7,%eax
 355:	cd 40                	int    $0x40
 357:	c3                   	ret    

00000358 <open>:
SYSCALL(open)
 358:	b8 0f 00 00 00       	mov    $0xf,%eax
 35d:	cd 40                	int    $0x40
 35f:	c3                   	ret    

00000360 <mknod>:
SYSCALL(mknod)
 360:	b8 11 00 00 00       	mov    $0x11,%eax
 365:	cd 40                	int    $0x40
 367:	c3                   	ret    

00000368 <unlink>:
SYSCALL(unlink)
 368:	b8 12 00 00 00       	mov    $0x12,%eax
 36d:	cd 40                	int    $0x40
 36f:	c3                   	ret    

00000370 <fstat>:
SYSCALL(fstat)
 370:	b8 08 00 00 00       	mov    $0x8,%eax
 375:	cd 40                	int    $0x40
 377:	c3                   	ret    

00000378 <link>:
SYSCALL(link)
 378:	b8 13 00 00 00       	mov    $0x13,%eax
 37d:	cd 40                	int    $0x40
 37f:	c3                   	ret    

00000380 <mkdir>:
SYSCALL(mkdir)
 380:	b8 14 00 00 00       	mov    $0x14,%eax
 385:	cd 40                	int    $0x40
 387:	c3                   	ret    

00000388 <chdir>:
SYSCALL(chdir)
 388:	b8 09 00 00 00       	mov    $0x9,%eax
 38d:	cd 40                	int    $0x40
 38f:	c3                   	ret    

00000390 <dup>:
SYSCALL(dup)
 390:	b8 0a 00 00 00       	mov    $0xa,%eax
 395:	cd 40                	int    $0x40
 397:	c3                   	ret    

00000398 <getpid>:
SYSCALL(getpid)
 398:	b8 0b 00 00 00       	mov    $0xb,%eax
 39d:	cd 40                	int    $0x40
 39f:	c3                   	ret    

000003a0 <sbrk>:
SYSCALL(sbrk)
 3a0:	b8 0c 00 00 00       	mov    $0xc,%eax
 3a5:	cd 40                	int    $0x40
 3a7:	c3                   	ret    

000003a8 <sleep>:
SYSCALL(sleep)
 3a8:	b8 0d 00 00 00       	mov    $0xd,%eax
 3ad:	cd 40                	int    $0x40
 3af:	c3                   	ret    

000003b0 <uptime>:
SYSCALL(uptime)
 3b0:	b8 0e 00 00 00       	mov    $0xe,%eax
 3b5:	cd 40                	int    $0x40
 3b7:	c3                   	ret    

000003b8 <setVariable>:
SYSCALL(setVariable)
 3b8:	b8 17 00 00 00       	mov    $0x17,%eax
 3bd:	cd 40                	int    $0x40
 3bf:	c3                   	ret    

000003c0 <getVariable>:
SYSCALL(getVariable)
 3c0:	b8 18 00 00 00       	mov    $0x18,%eax
 3c5:	cd 40                	int    $0x40
 3c7:	c3                   	ret    

000003c8 <remVariable>:
SYSCALL(remVariable)
 3c8:	b8 19 00 00 00       	mov    $0x19,%eax
 3cd:	cd 40                	int    $0x40
 3cf:	c3                   	ret    

000003d0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 3d0:	55                   	push   %ebp
 3d1:	89 e5                	mov    %esp,%ebp
 3d3:	57                   	push   %edi
 3d4:	56                   	push   %esi
 3d5:	53                   	push   %ebx
 3d6:	89 c6                	mov    %eax,%esi
 3d8:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 3db:	8b 5d 08             	mov    0x8(%ebp),%ebx
 3de:	85 db                	test   %ebx,%ebx
 3e0:	74 7e                	je     460 <printint+0x90>
 3e2:	89 d0                	mov    %edx,%eax
 3e4:	c1 e8 1f             	shr    $0x1f,%eax
 3e7:	84 c0                	test   %al,%al
 3e9:	74 75                	je     460 <printint+0x90>
    neg = 1;
    x = -xx;
 3eb:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 3ed:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
 3f4:	f7 d8                	neg    %eax
 3f6:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 3f9:	31 ff                	xor    %edi,%edi
 3fb:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 3fe:	89 ce                	mov    %ecx,%esi
 400:	eb 08                	jmp    40a <printint+0x3a>
 402:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 408:	89 cf                	mov    %ecx,%edi
 40a:	31 d2                	xor    %edx,%edx
 40c:	8d 4f 01             	lea    0x1(%edi),%ecx
 40f:	f7 f6                	div    %esi
 411:	0f b6 92 98 07 00 00 	movzbl 0x798(%edx),%edx
  }while((x /= base) != 0);
 418:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 41a:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 41d:	75 e9                	jne    408 <printint+0x38>
  if(neg)
 41f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 422:	8b 75 c0             	mov    -0x40(%ebp),%esi
 425:	85 c0                	test   %eax,%eax
 427:	74 08                	je     431 <printint+0x61>
    buf[i++] = '-';
 429:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
 42e:	8d 4f 02             	lea    0x2(%edi),%ecx

  while(--i >= 0)
 431:	8d 79 ff             	lea    -0x1(%ecx),%edi
 434:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 438:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 43d:	83 ec 04             	sub    $0x4,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 440:	83 ef 01             	sub    $0x1,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 443:	6a 01                	push   $0x1
 445:	53                   	push   %ebx
 446:	56                   	push   %esi
 447:	88 45 d7             	mov    %al,-0x29(%ebp)
 44a:	e8 e9 fe ff ff       	call   338 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 44f:	83 c4 10             	add    $0x10,%esp
 452:	83 ff ff             	cmp    $0xffffffff,%edi
 455:	75 e1                	jne    438 <printint+0x68>
    putc(fd, buf[i]);
}
 457:	8d 65 f4             	lea    -0xc(%ebp),%esp
 45a:	5b                   	pop    %ebx
 45b:	5e                   	pop    %esi
 45c:	5f                   	pop    %edi
 45d:	5d                   	pop    %ebp
 45e:	c3                   	ret    
 45f:	90                   	nop
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 460:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 462:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 469:	eb 8b                	jmp    3f6 <printint+0x26>
 46b:	90                   	nop
 46c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000470 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 470:	55                   	push   %ebp
 471:	89 e5                	mov    %esp,%ebp
 473:	57                   	push   %edi
 474:	56                   	push   %esi
 475:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 476:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 479:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 47c:	8b 75 0c             	mov    0xc(%ebp),%esi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 47f:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 482:	89 45 d0             	mov    %eax,-0x30(%ebp)
 485:	0f b6 1e             	movzbl (%esi),%ebx
 488:	83 c6 01             	add    $0x1,%esi
 48b:	84 db                	test   %bl,%bl
 48d:	0f 84 b0 00 00 00    	je     543 <printf+0xd3>
 493:	31 d2                	xor    %edx,%edx
 495:	eb 39                	jmp    4d0 <printf+0x60>
 497:	89 f6                	mov    %esi,%esi
 499:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 4a0:	83 f8 25             	cmp    $0x25,%eax
 4a3:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
 4a6:	ba 25 00 00 00       	mov    $0x25,%edx
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 4ab:	74 18                	je     4c5 <printf+0x55>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 4ad:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 4b0:	83 ec 04             	sub    $0x4,%esp
 4b3:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 4b6:	6a 01                	push   $0x1
 4b8:	50                   	push   %eax
 4b9:	57                   	push   %edi
 4ba:	e8 79 fe ff ff       	call   338 <write>
 4bf:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 4c2:	83 c4 10             	add    $0x10,%esp
 4c5:	83 c6 01             	add    $0x1,%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4c8:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 4cc:	84 db                	test   %bl,%bl
 4ce:	74 73                	je     543 <printf+0xd3>
    c = fmt[i] & 0xff;
    if(state == 0){
 4d0:	85 d2                	test   %edx,%edx
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
 4d2:	0f be cb             	movsbl %bl,%ecx
 4d5:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 4d8:	74 c6                	je     4a0 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 4da:	83 fa 25             	cmp    $0x25,%edx
 4dd:	75 e6                	jne    4c5 <printf+0x55>
      if(c == 'd'){
 4df:	83 f8 64             	cmp    $0x64,%eax
 4e2:	0f 84 f8 00 00 00    	je     5e0 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 4e8:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 4ee:	83 f9 70             	cmp    $0x70,%ecx
 4f1:	74 5d                	je     550 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 4f3:	83 f8 73             	cmp    $0x73,%eax
 4f6:	0f 84 84 00 00 00    	je     580 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 4fc:	83 f8 63             	cmp    $0x63,%eax
 4ff:	0f 84 ea 00 00 00    	je     5ef <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 505:	83 f8 25             	cmp    $0x25,%eax
 508:	0f 84 c2 00 00 00    	je     5d0 <printf+0x160>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 50e:	8d 45 e7             	lea    -0x19(%ebp),%eax
 511:	83 ec 04             	sub    $0x4,%esp
 514:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 518:	6a 01                	push   $0x1
 51a:	50                   	push   %eax
 51b:	57                   	push   %edi
 51c:	e8 17 fe ff ff       	call   338 <write>
 521:	83 c4 0c             	add    $0xc,%esp
 524:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 527:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 52a:	6a 01                	push   $0x1
 52c:	50                   	push   %eax
 52d:	57                   	push   %edi
 52e:	83 c6 01             	add    $0x1,%esi
 531:	e8 02 fe ff ff       	call   338 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 536:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 53a:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 53d:	31 d2                	xor    %edx,%edx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 53f:	84 db                	test   %bl,%bl
 541:	75 8d                	jne    4d0 <printf+0x60>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 543:	8d 65 f4             	lea    -0xc(%ebp),%esp
 546:	5b                   	pop    %ebx
 547:	5e                   	pop    %esi
 548:	5f                   	pop    %edi
 549:	5d                   	pop    %ebp
 54a:	c3                   	ret    
 54b:	90                   	nop
 54c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 550:	83 ec 0c             	sub    $0xc,%esp
 553:	b9 10 00 00 00       	mov    $0x10,%ecx
 558:	6a 00                	push   $0x0
 55a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 55d:	89 f8                	mov    %edi,%eax
 55f:	8b 13                	mov    (%ebx),%edx
 561:	e8 6a fe ff ff       	call   3d0 <printint>
        ap++;
 566:	89 d8                	mov    %ebx,%eax
 568:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 56b:	31 d2                	xor    %edx,%edx
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
 56d:	83 c0 04             	add    $0x4,%eax
 570:	89 45 d0             	mov    %eax,-0x30(%ebp)
 573:	e9 4d ff ff ff       	jmp    4c5 <printf+0x55>
 578:	90                   	nop
 579:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
 580:	8b 45 d0             	mov    -0x30(%ebp),%eax
 583:	8b 18                	mov    (%eax),%ebx
        ap++;
 585:	83 c0 04             	add    $0x4,%eax
 588:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 58b:	85 db                	test   %ebx,%ebx
 58d:	74 7c                	je     60b <printf+0x19b>
          s = "(null)";
        while(*s != 0){
 58f:	0f b6 03             	movzbl (%ebx),%eax
 592:	84 c0                	test   %al,%al
 594:	74 29                	je     5bf <printf+0x14f>
 596:	8d 76 00             	lea    0x0(%esi),%esi
 599:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 5a0:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 5a3:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 5a6:	83 ec 04             	sub    $0x4,%esp
 5a9:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
 5ab:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 5ae:	50                   	push   %eax
 5af:	57                   	push   %edi
 5b0:	e8 83 fd ff ff       	call   338 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 5b5:	0f b6 03             	movzbl (%ebx),%eax
 5b8:	83 c4 10             	add    $0x10,%esp
 5bb:	84 c0                	test   %al,%al
 5bd:	75 e1                	jne    5a0 <printf+0x130>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 5bf:	31 d2                	xor    %edx,%edx
 5c1:	e9 ff fe ff ff       	jmp    4c5 <printf+0x55>
 5c6:	8d 76 00             	lea    0x0(%esi),%esi
 5c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 5d0:	83 ec 04             	sub    $0x4,%esp
 5d3:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 5d6:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 5d9:	6a 01                	push   $0x1
 5db:	e9 4c ff ff ff       	jmp    52c <printf+0xbc>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 5e0:	83 ec 0c             	sub    $0xc,%esp
 5e3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 5e8:	6a 01                	push   $0x1
 5ea:	e9 6b ff ff ff       	jmp    55a <printf+0xea>
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 5ef:	8b 5d d0             	mov    -0x30(%ebp),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 5f2:	83 ec 04             	sub    $0x4,%esp
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 5f5:	8b 03                	mov    (%ebx),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 5f7:	6a 01                	push   $0x1
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 5f9:	88 45 e4             	mov    %al,-0x1c(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 5fc:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 5ff:	50                   	push   %eax
 600:	57                   	push   %edi
 601:	e8 32 fd ff ff       	call   338 <write>
 606:	e9 5b ff ff ff       	jmp    566 <printf+0xf6>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 60b:	b8 28 00 00 00       	mov    $0x28,%eax
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
 610:	bb 90 07 00 00       	mov    $0x790,%ebx
 615:	eb 89                	jmp    5a0 <printf+0x130>
 617:	66 90                	xchg   %ax,%ax
 619:	66 90                	xchg   %ax,%ax
 61b:	66 90                	xchg   %ax,%ax
 61d:	66 90                	xchg   %ax,%ax
 61f:	90                   	nop

00000620 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 620:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 621:	a1 b4 0a 00 00       	mov    0xab4,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 626:	89 e5                	mov    %esp,%ebp
 628:	57                   	push   %edi
 629:	56                   	push   %esi
 62a:	53                   	push   %ebx
 62b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 62e:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
 630:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 633:	39 c8                	cmp    %ecx,%eax
 635:	73 19                	jae    650 <free+0x30>
 637:	89 f6                	mov    %esi,%esi
 639:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 640:	39 d1                	cmp    %edx,%ecx
 642:	72 1c                	jb     660 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 644:	39 d0                	cmp    %edx,%eax
 646:	73 18                	jae    660 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
 648:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 64a:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 64c:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 64e:	72 f0                	jb     640 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 650:	39 d0                	cmp    %edx,%eax
 652:	72 f4                	jb     648 <free+0x28>
 654:	39 d1                	cmp    %edx,%ecx
 656:	73 f0                	jae    648 <free+0x28>
 658:	90                   	nop
 659:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
 660:	8b 73 fc             	mov    -0x4(%ebx),%esi
 663:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 666:	39 fa                	cmp    %edi,%edx
 668:	74 19                	je     683 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 66a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 66d:	8b 50 04             	mov    0x4(%eax),%edx
 670:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 673:	39 f1                	cmp    %esi,%ecx
 675:	74 23                	je     69a <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 677:	89 08                	mov    %ecx,(%eax)
  freep = p;
 679:	a3 b4 0a 00 00       	mov    %eax,0xab4
}
 67e:	5b                   	pop    %ebx
 67f:	5e                   	pop    %esi
 680:	5f                   	pop    %edi
 681:	5d                   	pop    %ebp
 682:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 683:	03 72 04             	add    0x4(%edx),%esi
 686:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 689:	8b 10                	mov    (%eax),%edx
 68b:	8b 12                	mov    (%edx),%edx
 68d:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 690:	8b 50 04             	mov    0x4(%eax),%edx
 693:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 696:	39 f1                	cmp    %esi,%ecx
 698:	75 dd                	jne    677 <free+0x57>
    p->s.size += bp->s.size;
 69a:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 69d:	a3 b4 0a 00 00       	mov    %eax,0xab4
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 6a2:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6a5:	8b 53 f8             	mov    -0x8(%ebx),%edx
 6a8:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 6aa:	5b                   	pop    %ebx
 6ab:	5e                   	pop    %esi
 6ac:	5f                   	pop    %edi
 6ad:	5d                   	pop    %ebp
 6ae:	c3                   	ret    
 6af:	90                   	nop

000006b0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 6b0:	55                   	push   %ebp
 6b1:	89 e5                	mov    %esp,%ebp
 6b3:	57                   	push   %edi
 6b4:	56                   	push   %esi
 6b5:	53                   	push   %ebx
 6b6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6b9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 6bc:	8b 15 b4 0a 00 00    	mov    0xab4,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6c2:	8d 78 07             	lea    0x7(%eax),%edi
 6c5:	c1 ef 03             	shr    $0x3,%edi
 6c8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 6cb:	85 d2                	test   %edx,%edx
 6cd:	0f 84 93 00 00 00    	je     766 <malloc+0xb6>
 6d3:	8b 02                	mov    (%edx),%eax
 6d5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 6d8:	39 cf                	cmp    %ecx,%edi
 6da:	76 64                	jbe    740 <malloc+0x90>
 6dc:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 6e2:	bb 00 10 00 00       	mov    $0x1000,%ebx
 6e7:	0f 43 df             	cmovae %edi,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 6ea:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 6f1:	eb 0e                	jmp    701 <malloc+0x51>
 6f3:	90                   	nop
 6f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6f8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 6fa:	8b 48 04             	mov    0x4(%eax),%ecx
 6fd:	39 cf                	cmp    %ecx,%edi
 6ff:	76 3f                	jbe    740 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 701:	39 05 b4 0a 00 00    	cmp    %eax,0xab4
 707:	89 c2                	mov    %eax,%edx
 709:	75 ed                	jne    6f8 <malloc+0x48>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 70b:	83 ec 0c             	sub    $0xc,%esp
 70e:	56                   	push   %esi
 70f:	e8 8c fc ff ff       	call   3a0 <sbrk>
  if(p == (char*)-1)
 714:	83 c4 10             	add    $0x10,%esp
 717:	83 f8 ff             	cmp    $0xffffffff,%eax
 71a:	74 1c                	je     738 <malloc+0x88>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 71c:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 71f:	83 ec 0c             	sub    $0xc,%esp
 722:	83 c0 08             	add    $0x8,%eax
 725:	50                   	push   %eax
 726:	e8 f5 fe ff ff       	call   620 <free>
  return freep;
 72b:	8b 15 b4 0a 00 00    	mov    0xab4,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 731:	83 c4 10             	add    $0x10,%esp
 734:	85 d2                	test   %edx,%edx
 736:	75 c0                	jne    6f8 <malloc+0x48>
        return 0;
 738:	31 c0                	xor    %eax,%eax
 73a:	eb 1c                	jmp    758 <malloc+0xa8>
 73c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 740:	39 cf                	cmp    %ecx,%edi
 742:	74 1c                	je     760 <malloc+0xb0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 744:	29 f9                	sub    %edi,%ecx
 746:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 749:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 74c:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
 74f:	89 15 b4 0a 00 00    	mov    %edx,0xab4
      return (void*)(p + 1);
 755:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 758:	8d 65 f4             	lea    -0xc(%ebp),%esp
 75b:	5b                   	pop    %ebx
 75c:	5e                   	pop    %esi
 75d:	5f                   	pop    %edi
 75e:	5d                   	pop    %ebp
 75f:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 760:	8b 08                	mov    (%eax),%ecx
 762:	89 0a                	mov    %ecx,(%edx)
 764:	eb e9                	jmp    74f <malloc+0x9f>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 766:	c7 05 b4 0a 00 00 b8 	movl   $0xab8,0xab4
 76d:	0a 00 00 
 770:	c7 05 b8 0a 00 00 b8 	movl   $0xab8,0xab8
 777:	0a 00 00 
    base.s.size = 0;
 77a:	b8 b8 0a 00 00       	mov    $0xab8,%eax
 77f:	c7 05 bc 0a 00 00 00 	movl   $0x0,0xabc
 786:	00 00 00 
 789:	e9 4e ff ff ff       	jmp    6dc <malloc+0x2c>
