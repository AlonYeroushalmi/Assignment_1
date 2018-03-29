
_forktest:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  printf(1, "fork test OK\n");
}

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
  forktest();
  11:	e8 3a 00 00 00       	call   50 <forktest>
  exit();
  16:	e8 1d 04 00 00       	call   438 <exit>
  1b:	66 90                	xchg   %ax,%ax
  1d:	66 90                	xchg   %ax,%ax
  1f:	90                   	nop

00000020 <printf>:

#define N  1000

void
printf(int fd, char *s, ...)
{
  20:	55                   	push   %ebp
  21:	89 e5                	mov    %esp,%ebp
  23:	53                   	push   %ebx
  24:	83 ec 10             	sub    $0x10,%esp
  27:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  write(fd, s, strlen(s));
  2a:	53                   	push   %ebx
  2b:	e8 30 02 00 00       	call   260 <strlen>
  30:	83 c4 0c             	add    $0xc,%esp
  33:	50                   	push   %eax
  34:	53                   	push   %ebx
  35:	ff 75 08             	pushl  0x8(%ebp)
  38:	e8 1b 04 00 00       	call   458 <write>
}
  3d:	83 c4 10             	add    $0x10,%esp
  40:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  43:	c9                   	leave  
  44:	c3                   	ret    
  45:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000050 <forktest>:

void
forktest(void)
{
  50:	55                   	push   %ebp
  51:	89 e5                	mov    %esp,%ebp
  53:	53                   	push   %ebx
  int n, pid;

  printf(1, "fork test\n");

  for(n=0; n<N; n++){
  54:	31 db                	xor    %ebx,%ebx
  write(fd, s, strlen(s));
}

void
forktest(void)
{
  56:	83 ec 10             	sub    $0x10,%esp
#define N  1000

void
printf(int fd, char *s, ...)
{
  write(fd, s, strlen(s));
  59:	68 f8 04 00 00       	push   $0x4f8
  5e:	e8 fd 01 00 00       	call   260 <strlen>
  63:	83 c4 0c             	add    $0xc,%esp
  66:	50                   	push   %eax
  67:	68 f8 04 00 00       	push   $0x4f8
  6c:	6a 01                	push   $0x1
  6e:	e8 e5 03 00 00       	call   458 <write>
  73:	83 c4 10             	add    $0x10,%esp
  76:	eb 19                	jmp    91 <forktest+0x41>
  78:	90                   	nop
  79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

  for(n=0; n<N; n++){
    pid = fork();
    if(pid < 0)
      break;
    if(pid == 0)
  80:	0f 84 7c 00 00 00    	je     102 <forktest+0xb2>
{
  int n, pid;

  printf(1, "fork test\n");

  for(n=0; n<N; n++){
  86:	83 c3 01             	add    $0x1,%ebx
  89:	81 fb e8 03 00 00    	cmp    $0x3e8,%ebx
  8f:	74 4f                	je     e0 <forktest+0x90>
    pid = fork();
  91:	e8 9a 03 00 00       	call   430 <fork>
    if(pid < 0)
  96:	85 c0                	test   %eax,%eax
  98:	79 e6                	jns    80 <forktest+0x30>
  if(n == N){
    printf(1, "fork claimed to work N times!\n", N);
    exit();
  }

  for(; n > 0; n--){
  9a:	85 db                	test   %ebx,%ebx
  9c:	74 10                	je     ae <forktest+0x5e>
  9e:	66 90                	xchg   %ax,%ax
    if(wait() < 0){
  a0:	e8 9b 03 00 00       	call   440 <wait>
  a5:	85 c0                	test   %eax,%eax
  a7:	78 5e                	js     107 <forktest+0xb7>
  if(n == N){
    printf(1, "fork claimed to work N times!\n", N);
    exit();
  }

  for(; n > 0; n--){
  a9:	83 eb 01             	sub    $0x1,%ebx
  ac:	75 f2                	jne    a0 <forktest+0x50>
      printf(1, "wait stopped early\n");
      exit();
    }
  }

  if(wait() != -1){
  ae:	e8 8d 03 00 00       	call   440 <wait>
  b3:	83 f8 ff             	cmp    $0xffffffff,%eax
  b6:	75 71                	jne    129 <forktest+0xd9>
#define N  1000

void
printf(int fd, char *s, ...)
{
  write(fd, s, strlen(s));
  b8:	83 ec 0c             	sub    $0xc,%esp
  bb:	68 2a 05 00 00       	push   $0x52a
  c0:	e8 9b 01 00 00       	call   260 <strlen>
  c5:	83 c4 0c             	add    $0xc,%esp
  c8:	50                   	push   %eax
  c9:	68 2a 05 00 00       	push   $0x52a
  ce:	6a 01                	push   $0x1
  d0:	e8 83 03 00 00       	call   458 <write>
    printf(1, "wait got too many\n");
    exit();
  }

  printf(1, "fork test OK\n");
}
  d5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  d8:	c9                   	leave  
  d9:	c3                   	ret    
  da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
#define N  1000

void
printf(int fd, char *s, ...)
{
  write(fd, s, strlen(s));
  e0:	83 ec 0c             	sub    $0xc,%esp
  e3:	68 38 05 00 00       	push   $0x538
  e8:	e8 73 01 00 00       	call   260 <strlen>
  ed:	83 c4 0c             	add    $0xc,%esp
  f0:	50                   	push   %eax
  f1:	68 38 05 00 00       	push   $0x538
  f6:	6a 01                	push   $0x1
  f8:	e8 5b 03 00 00       	call   458 <write>
      exit();
  }

  if(n == N){
    printf(1, "fork claimed to work N times!\n", N);
    exit();
  fd:	e8 36 03 00 00       	call   438 <exit>
  for(n=0; n<N; n++){
    pid = fork();
    if(pid < 0)
      break;
    if(pid == 0)
      exit();
 102:	e8 31 03 00 00       	call   438 <exit>
#define N  1000

void
printf(int fd, char *s, ...)
{
  write(fd, s, strlen(s));
 107:	83 ec 0c             	sub    $0xc,%esp
 10a:	68 03 05 00 00       	push   $0x503
 10f:	e8 4c 01 00 00       	call   260 <strlen>
 114:	83 c4 0c             	add    $0xc,%esp
 117:	50                   	push   %eax
 118:	68 03 05 00 00       	push   $0x503
 11d:	6a 01                	push   $0x1
 11f:	e8 34 03 00 00       	call   458 <write>
  }

  for(; n > 0; n--){
    if(wait() < 0){
      printf(1, "wait stopped early\n");
      exit();
 124:	e8 0f 03 00 00       	call   438 <exit>
#define N  1000

void
printf(int fd, char *s, ...)
{
  write(fd, s, strlen(s));
 129:	83 ec 0c             	sub    $0xc,%esp
 12c:	68 17 05 00 00       	push   $0x517
 131:	e8 2a 01 00 00       	call   260 <strlen>
 136:	83 c4 0c             	add    $0xc,%esp
 139:	50                   	push   %eax
 13a:	68 17 05 00 00       	push   $0x517
 13f:	6a 01                	push   $0x1
 141:	e8 12 03 00 00       	call   458 <write>
    }
  }

  if(wait() != -1){
    printf(1, "wait got too many\n");
    exit();
 146:	e8 ed 02 00 00       	call   438 <exit>
 14b:	66 90                	xchg   %ax,%ax
 14d:	66 90                	xchg   %ax,%ax
 14f:	90                   	nop

00000150 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	53                   	push   %ebx
 154:	8b 45 08             	mov    0x8(%ebp),%eax
 157:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 15a:	89 c2                	mov    %eax,%edx
 15c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 160:	83 c1 01             	add    $0x1,%ecx
 163:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 167:	83 c2 01             	add    $0x1,%edx
 16a:	84 db                	test   %bl,%bl
 16c:	88 5a ff             	mov    %bl,-0x1(%edx)
 16f:	75 ef                	jne    160 <strcpy+0x10>
    ;
  return os;
}
 171:	5b                   	pop    %ebx
 172:	5d                   	pop    %ebp
 173:	c3                   	ret    
 174:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 17a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000180 <strncpy>:

char* strncpy(char* s, char* t, int n) {
 180:	55                   	push   %ebp
  int i = 0;
 181:	31 d2                	xor    %edx,%edx
  while((*s++ = *t++) != 0)
    ;
  return os;
}

char* strncpy(char* s, char* t, int n) {
 183:	89 e5                	mov    %esp,%ebp
 185:	56                   	push   %esi
 186:	53                   	push   %ebx
 187:	8b 45 08             	mov    0x8(%ebp),%eax
 18a:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 18d:	8b 75 10             	mov    0x10(%ebp),%esi
  int i = 0;
  char *os;
  os = s;
  while(((*s++ = *t++) != 0) && (++i < n));
 190:	eb 0d                	jmp    19f <strncpy+0x1f>
 192:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 198:	83 c2 01             	add    $0x1,%edx
 19b:	39 f2                	cmp    %esi,%edx
 19d:	7d 0b                	jge    1aa <strncpy+0x2a>
 19f:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
 1a3:	84 c9                	test   %cl,%cl
 1a5:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 1a8:	75 ee                	jne    198 <strncpy+0x18>
  return os;
}
 1aa:	5b                   	pop    %ebx
 1ab:	5e                   	pop    %esi
 1ac:	5d                   	pop    %ebp
 1ad:	c3                   	ret    
 1ae:	66 90                	xchg   %ax,%ax

000001b0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	56                   	push   %esi
 1b4:	53                   	push   %ebx
 1b5:	8b 55 08             	mov    0x8(%ebp),%edx
 1b8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 1bb:	0f b6 02             	movzbl (%edx),%eax
 1be:	0f b6 19             	movzbl (%ecx),%ebx
 1c1:	84 c0                	test   %al,%al
 1c3:	75 1e                	jne    1e3 <strcmp+0x33>
 1c5:	eb 29                	jmp    1f0 <strcmp+0x40>
 1c7:	89 f6                	mov    %esi,%esi
 1c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 1d0:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 1d3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 1d6:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 1d9:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 1dd:	84 c0                	test   %al,%al
 1df:	74 0f                	je     1f0 <strcmp+0x40>
 1e1:	89 f1                	mov    %esi,%ecx
 1e3:	38 d8                	cmp    %bl,%al
 1e5:	74 e9                	je     1d0 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 1e7:	29 d8                	sub    %ebx,%eax
}
 1e9:	5b                   	pop    %ebx
 1ea:	5e                   	pop    %esi
 1eb:	5d                   	pop    %ebp
 1ec:	c3                   	ret    
 1ed:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 1f0:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
 1f2:	29 d8                	sub    %ebx,%eax
}
 1f4:	5b                   	pop    %ebx
 1f5:	5e                   	pop    %esi
 1f6:	5d                   	pop    %ebp
 1f7:	c3                   	ret    
 1f8:	90                   	nop
 1f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000200 <strncmp>:

int strncmp(const char *p, const char *q, int n) {
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	57                   	push   %edi
 204:	56                   	push   %esi
 205:	53                   	push   %ebx
 206:	8b 5d 10             	mov    0x10(%ebp),%ebx
 209:	8b 75 08             	mov    0x8(%ebp),%esi
 20c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  int i = 0;
  while(i < n && *p == *q)
 20f:	85 db                	test   %ebx,%ebx
 211:	7e 28                	jle    23b <strncmp+0x3b>
 213:	0f b6 16             	movzbl (%esi),%edx
 216:	0f b6 0f             	movzbl (%edi),%ecx
 219:	38 d1                	cmp    %dl,%cl
 21b:	75 2b                	jne    248 <strncmp+0x48>
 21d:	31 c0                	xor    %eax,%eax
 21f:	eb 13                	jmp    234 <strncmp+0x34>
 221:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 228:	0f b6 14 06          	movzbl (%esi,%eax,1),%edx
 22c:	0f b6 0c 07          	movzbl (%edi,%eax,1),%ecx
 230:	38 ca                	cmp    %cl,%dl
 232:	75 14                	jne    248 <strncmp+0x48>
    p++, q++, i++;
 234:	83 c0 01             	add    $0x1,%eax
  return (uchar)*p - (uchar)*q;
}

int strncmp(const char *p, const char *q, int n) {
  int i = 0;
  while(i < n && *p == *q)
 237:	39 c3                	cmp    %eax,%ebx
 239:	75 ed                	jne    228 <strncmp+0x28>
    p++, q++, i++;
  if (i < n)
    return (uchar)*p - (uchar)*q;
  else
    return 0;
}
 23b:	5b                   	pop    %ebx
  while(i < n && *p == *q)
    p++, q++, i++;
  if (i < n)
    return (uchar)*p - (uchar)*q;
  else
    return 0;
 23c:	31 c0                	xor    %eax,%eax
}
 23e:	5e                   	pop    %esi
 23f:	5f                   	pop    %edi
 240:	5d                   	pop    %ebp
 241:	c3                   	ret    
 242:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
int strncmp(const char *p, const char *q, int n) {
  int i = 0;
  while(i < n && *p == *q)
    p++, q++, i++;
  if (i < n)
    return (uchar)*p - (uchar)*q;
 248:	0f b6 c2             	movzbl %dl,%eax
  else
    return 0;
}
 24b:	5b                   	pop    %ebx
int strncmp(const char *p, const char *q, int n) {
  int i = 0;
  while(i < n && *p == *q)
    p++, q++, i++;
  if (i < n)
    return (uchar)*p - (uchar)*q;
 24c:	29 c8                	sub    %ecx,%eax
  else
    return 0;
}
 24e:	5e                   	pop    %esi
 24f:	5f                   	pop    %edi
 250:	5d                   	pop    %ebp
 251:	c3                   	ret    
 252:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 259:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000260 <strlen>:

uint
strlen(char *s)
{
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 266:	80 39 00             	cmpb   $0x0,(%ecx)
 269:	74 12                	je     27d <strlen+0x1d>
 26b:	31 d2                	xor    %edx,%edx
 26d:	8d 76 00             	lea    0x0(%esi),%esi
 270:	83 c2 01             	add    $0x1,%edx
 273:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 277:	89 d0                	mov    %edx,%eax
 279:	75 f5                	jne    270 <strlen+0x10>
    ;
  return n;
}
 27b:	5d                   	pop    %ebp
 27c:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 27d:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
 27f:	5d                   	pop    %ebp
 280:	c3                   	ret    
 281:	eb 0d                	jmp    290 <memset>
 283:	90                   	nop
 284:	90                   	nop
 285:	90                   	nop
 286:	90                   	nop
 287:	90                   	nop
 288:	90                   	nop
 289:	90                   	nop
 28a:	90                   	nop
 28b:	90                   	nop
 28c:	90                   	nop
 28d:	90                   	nop
 28e:	90                   	nop
 28f:	90                   	nop

00000290 <memset>:

void*
memset(void *dst, int c, uint n)
{
 290:	55                   	push   %ebp
 291:	89 e5                	mov    %esp,%ebp
 293:	57                   	push   %edi
 294:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 297:	8b 4d 10             	mov    0x10(%ebp),%ecx
 29a:	8b 45 0c             	mov    0xc(%ebp),%eax
 29d:	89 d7                	mov    %edx,%edi
 29f:	fc                   	cld    
 2a0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 2a2:	89 d0                	mov    %edx,%eax
 2a4:	5f                   	pop    %edi
 2a5:	5d                   	pop    %ebp
 2a6:	c3                   	ret    
 2a7:	89 f6                	mov    %esi,%esi
 2a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002b0 <strchr>:

char*
strchr(const char *s, char c)
{
 2b0:	55                   	push   %ebp
 2b1:	89 e5                	mov    %esp,%ebp
 2b3:	53                   	push   %ebx
 2b4:	8b 45 08             	mov    0x8(%ebp),%eax
 2b7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 2ba:	0f b6 10             	movzbl (%eax),%edx
 2bd:	84 d2                	test   %dl,%dl
 2bf:	74 1d                	je     2de <strchr+0x2e>
    if(*s == c)
 2c1:	38 d3                	cmp    %dl,%bl
 2c3:	89 d9                	mov    %ebx,%ecx
 2c5:	75 0d                	jne    2d4 <strchr+0x24>
 2c7:	eb 17                	jmp    2e0 <strchr+0x30>
 2c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2d0:	38 ca                	cmp    %cl,%dl
 2d2:	74 0c                	je     2e0 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 2d4:	83 c0 01             	add    $0x1,%eax
 2d7:	0f b6 10             	movzbl (%eax),%edx
 2da:	84 d2                	test   %dl,%dl
 2dc:	75 f2                	jne    2d0 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
 2de:	31 c0                	xor    %eax,%eax
}
 2e0:	5b                   	pop    %ebx
 2e1:	5d                   	pop    %ebp
 2e2:	c3                   	ret    
 2e3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 2e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002f0 <gets>:

char*
gets(char *buf, int max)
{
 2f0:	55                   	push   %ebp
 2f1:	89 e5                	mov    %esp,%ebp
 2f3:	57                   	push   %edi
 2f4:	56                   	push   %esi
 2f5:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2f6:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
 2f8:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
 2fb:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2fe:	eb 29                	jmp    329 <gets+0x39>
    cc = read(0, &c, 1);
 300:	83 ec 04             	sub    $0x4,%esp
 303:	6a 01                	push   $0x1
 305:	57                   	push   %edi
 306:	6a 00                	push   $0x0
 308:	e8 43 01 00 00       	call   450 <read>
    if(cc < 1)
 30d:	83 c4 10             	add    $0x10,%esp
 310:	85 c0                	test   %eax,%eax
 312:	7e 1d                	jle    331 <gets+0x41>
      break;
    buf[i++] = c;
 314:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 318:	8b 55 08             	mov    0x8(%ebp),%edx
 31b:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
 31d:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 31f:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 323:	74 1b                	je     340 <gets+0x50>
 325:	3c 0d                	cmp    $0xd,%al
 327:	74 17                	je     340 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 329:	8d 5e 01             	lea    0x1(%esi),%ebx
 32c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 32f:	7c cf                	jl     300 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 331:	8b 45 08             	mov    0x8(%ebp),%eax
 334:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 338:	8d 65 f4             	lea    -0xc(%ebp),%esp
 33b:	5b                   	pop    %ebx
 33c:	5e                   	pop    %esi
 33d:	5f                   	pop    %edi
 33e:	5d                   	pop    %ebp
 33f:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 340:	8b 45 08             	mov    0x8(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 343:	89 de                	mov    %ebx,%esi
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 345:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 349:	8d 65 f4             	lea    -0xc(%ebp),%esp
 34c:	5b                   	pop    %ebx
 34d:	5e                   	pop    %esi
 34e:	5f                   	pop    %edi
 34f:	5d                   	pop    %ebp
 350:	c3                   	ret    
 351:	eb 0d                	jmp    360 <stat>
 353:	90                   	nop
 354:	90                   	nop
 355:	90                   	nop
 356:	90                   	nop
 357:	90                   	nop
 358:	90                   	nop
 359:	90                   	nop
 35a:	90                   	nop
 35b:	90                   	nop
 35c:	90                   	nop
 35d:	90                   	nop
 35e:	90                   	nop
 35f:	90                   	nop

00000360 <stat>:

int
stat(char *n, struct stat *st)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	56                   	push   %esi
 364:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 365:	83 ec 08             	sub    $0x8,%esp
 368:	6a 00                	push   $0x0
 36a:	ff 75 08             	pushl  0x8(%ebp)
 36d:	e8 06 01 00 00       	call   478 <open>
  if(fd < 0)
 372:	83 c4 10             	add    $0x10,%esp
 375:	85 c0                	test   %eax,%eax
 377:	78 27                	js     3a0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 379:	83 ec 08             	sub    $0x8,%esp
 37c:	ff 75 0c             	pushl  0xc(%ebp)
 37f:	89 c3                	mov    %eax,%ebx
 381:	50                   	push   %eax
 382:	e8 09 01 00 00       	call   490 <fstat>
  close(fd);
 387:	89 1c 24             	mov    %ebx,(%esp)
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
  r = fstat(fd, st);
 38a:	89 c6                	mov    %eax,%esi
  close(fd);
 38c:	e8 cf 00 00 00       	call   460 <close>
  return r;
 391:	83 c4 10             	add    $0x10,%esp
}
 394:	8d 65 f8             	lea    -0x8(%ebp),%esp
 397:	89 f0                	mov    %esi,%eax
 399:	5b                   	pop    %ebx
 39a:	5e                   	pop    %esi
 39b:	5d                   	pop    %ebp
 39c:	c3                   	ret    
 39d:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 3a0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 3a5:	eb ed                	jmp    394 <stat+0x34>
 3a7:	89 f6                	mov    %esi,%esi
 3a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000003b0 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 3b0:	55                   	push   %ebp
 3b1:	89 e5                	mov    %esp,%ebp
 3b3:	53                   	push   %ebx
 3b4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 3b7:	0f be 11             	movsbl (%ecx),%edx
 3ba:	8d 42 d0             	lea    -0x30(%edx),%eax
 3bd:	3c 09                	cmp    $0x9,%al
 3bf:	b8 00 00 00 00       	mov    $0x0,%eax
 3c4:	77 1f                	ja     3e5 <atoi+0x35>
 3c6:	8d 76 00             	lea    0x0(%esi),%esi
 3c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 3d0:	8d 04 80             	lea    (%eax,%eax,4),%eax
 3d3:	83 c1 01             	add    $0x1,%ecx
 3d6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 3da:	0f be 11             	movsbl (%ecx),%edx
 3dd:	8d 5a d0             	lea    -0x30(%edx),%ebx
 3e0:	80 fb 09             	cmp    $0x9,%bl
 3e3:	76 eb                	jbe    3d0 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
 3e5:	5b                   	pop    %ebx
 3e6:	5d                   	pop    %ebp
 3e7:	c3                   	ret    
 3e8:	90                   	nop
 3e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000003f0 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 3f0:	55                   	push   %ebp
 3f1:	89 e5                	mov    %esp,%ebp
 3f3:	56                   	push   %esi
 3f4:	53                   	push   %ebx
 3f5:	8b 5d 10             	mov    0x10(%ebp),%ebx
 3f8:	8b 45 08             	mov    0x8(%ebp),%eax
 3fb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3fe:	85 db                	test   %ebx,%ebx
 400:	7e 14                	jle    416 <memmove+0x26>
 402:	31 d2                	xor    %edx,%edx
 404:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 408:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 40c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 40f:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 412:	39 da                	cmp    %ebx,%edx
 414:	75 f2                	jne    408 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 416:	5b                   	pop    %ebx
 417:	5e                   	pop    %esi
 418:	5d                   	pop    %ebp
 419:	c3                   	ret    
 41a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000420 <max>:

int max(int a, int b) {
 420:	55                   	push   %ebp
 421:	89 e5                	mov    %esp,%ebp
 423:	8b 55 08             	mov    0x8(%ebp),%edx
 426:	8b 45 0c             	mov    0xc(%ebp),%eax
  if (b > a) return b;
  else return a;
}
 429:	5d                   	pop    %ebp
 42a:	39 d0                	cmp    %edx,%eax
 42c:	0f 4c c2             	cmovl  %edx,%eax
 42f:	c3                   	ret    

00000430 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 430:	b8 01 00 00 00       	mov    $0x1,%eax
 435:	cd 40                	int    $0x40
 437:	c3                   	ret    

00000438 <exit>:
SYSCALL(exit)
 438:	b8 02 00 00 00       	mov    $0x2,%eax
 43d:	cd 40                	int    $0x40
 43f:	c3                   	ret    

00000440 <wait>:
SYSCALL(wait)
 440:	b8 03 00 00 00       	mov    $0x3,%eax
 445:	cd 40                	int    $0x40
 447:	c3                   	ret    

00000448 <pipe>:
SYSCALL(pipe)
 448:	b8 04 00 00 00       	mov    $0x4,%eax
 44d:	cd 40                	int    $0x40
 44f:	c3                   	ret    

00000450 <read>:
SYSCALL(read)
 450:	b8 05 00 00 00       	mov    $0x5,%eax
 455:	cd 40                	int    $0x40
 457:	c3                   	ret    

00000458 <write>:
SYSCALL(write)
 458:	b8 10 00 00 00       	mov    $0x10,%eax
 45d:	cd 40                	int    $0x40
 45f:	c3                   	ret    

00000460 <close>:
SYSCALL(close)
 460:	b8 15 00 00 00       	mov    $0x15,%eax
 465:	cd 40                	int    $0x40
 467:	c3                   	ret    

00000468 <kill>:
SYSCALL(kill)
 468:	b8 06 00 00 00       	mov    $0x6,%eax
 46d:	cd 40                	int    $0x40
 46f:	c3                   	ret    

00000470 <exec>:
SYSCALL(exec)
 470:	b8 07 00 00 00       	mov    $0x7,%eax
 475:	cd 40                	int    $0x40
 477:	c3                   	ret    

00000478 <open>:
SYSCALL(open)
 478:	b8 0f 00 00 00       	mov    $0xf,%eax
 47d:	cd 40                	int    $0x40
 47f:	c3                   	ret    

00000480 <mknod>:
SYSCALL(mknod)
 480:	b8 11 00 00 00       	mov    $0x11,%eax
 485:	cd 40                	int    $0x40
 487:	c3                   	ret    

00000488 <unlink>:
SYSCALL(unlink)
 488:	b8 12 00 00 00       	mov    $0x12,%eax
 48d:	cd 40                	int    $0x40
 48f:	c3                   	ret    

00000490 <fstat>:
SYSCALL(fstat)
 490:	b8 08 00 00 00       	mov    $0x8,%eax
 495:	cd 40                	int    $0x40
 497:	c3                   	ret    

00000498 <link>:
SYSCALL(link)
 498:	b8 13 00 00 00       	mov    $0x13,%eax
 49d:	cd 40                	int    $0x40
 49f:	c3                   	ret    

000004a0 <mkdir>:
SYSCALL(mkdir)
 4a0:	b8 14 00 00 00       	mov    $0x14,%eax
 4a5:	cd 40                	int    $0x40
 4a7:	c3                   	ret    

000004a8 <chdir>:
SYSCALL(chdir)
 4a8:	b8 09 00 00 00       	mov    $0x9,%eax
 4ad:	cd 40                	int    $0x40
 4af:	c3                   	ret    

000004b0 <dup>:
SYSCALL(dup)
 4b0:	b8 0a 00 00 00       	mov    $0xa,%eax
 4b5:	cd 40                	int    $0x40
 4b7:	c3                   	ret    

000004b8 <getpid>:
SYSCALL(getpid)
 4b8:	b8 0b 00 00 00       	mov    $0xb,%eax
 4bd:	cd 40                	int    $0x40
 4bf:	c3                   	ret    

000004c0 <sbrk>:
SYSCALL(sbrk)
 4c0:	b8 0c 00 00 00       	mov    $0xc,%eax
 4c5:	cd 40                	int    $0x40
 4c7:	c3                   	ret    

000004c8 <sleep>:
SYSCALL(sleep)
 4c8:	b8 0d 00 00 00       	mov    $0xd,%eax
 4cd:	cd 40                	int    $0x40
 4cf:	c3                   	ret    

000004d0 <uptime>:
SYSCALL(uptime)
 4d0:	b8 0e 00 00 00       	mov    $0xe,%eax
 4d5:	cd 40                	int    $0x40
 4d7:	c3                   	ret    

000004d8 <setVariable>:
SYSCALL(setVariable)
 4d8:	b8 17 00 00 00       	mov    $0x17,%eax
 4dd:	cd 40                	int    $0x40
 4df:	c3                   	ret    

000004e0 <getVariable>:
SYSCALL(getVariable)
 4e0:	b8 18 00 00 00       	mov    $0x18,%eax
 4e5:	cd 40                	int    $0x40
 4e7:	c3                   	ret    

000004e8 <remVariable>:
SYSCALL(remVariable)
 4e8:	b8 19 00 00 00       	mov    $0x19,%eax
 4ed:	cd 40                	int    $0x40
 4ef:	c3                   	ret    

000004f0 <wait2>:
SYSCALL(wait2)
 4f0:	b8 1a 00 00 00       	mov    $0x1a,%eax
 4f5:	cd 40                	int    $0x40
 4f7:	c3                   	ret    
