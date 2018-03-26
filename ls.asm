
_ls:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  close(fd);
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
  11:	bb 01 00 00 00       	mov    $0x1,%ebx
  16:	83 ec 08             	sub    $0x8,%esp
  19:	8b 31                	mov    (%ecx),%esi
  1b:	8b 79 04             	mov    0x4(%ecx),%edi
  int i;

  if(argc < 2){
  1e:	83 fe 01             	cmp    $0x1,%esi
  21:	7e 1f                	jle    42 <main+0x42>
  23:	90                   	nop
  24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    ls(".");
    exit();
  }
  for(i=1; i<argc; i++)
    ls(argv[i]);
  28:	83 ec 0c             	sub    $0xc,%esp
  2b:	ff 34 9f             	pushl  (%edi,%ebx,4)

  if(argc < 2){
    ls(".");
    exit();
  }
  for(i=1; i<argc; i++)
  2e:	83 c3 01             	add    $0x1,%ebx
    ls(argv[i]);
  31:	e8 ca 00 00 00       	call   100 <ls>

  if(argc < 2){
    ls(".");
    exit();
  }
  for(i=1; i<argc; i++)
  36:	83 c4 10             	add    $0x10,%esp
  39:	39 de                	cmp    %ebx,%esi
  3b:	75 eb                	jne    28 <main+0x28>
    ls(argv[i]);
  exit();
  3d:	e8 e6 05 00 00       	call   628 <exit>
main(int argc, char *argv[])
{
  int i;

  if(argc < 2){
    ls(".");
  42:	83 ec 0c             	sub    $0xc,%esp
  45:	68 e8 0a 00 00       	push   $0xae8
  4a:	e8 b1 00 00 00       	call   100 <ls>
    exit();
  4f:	e8 d4 05 00 00       	call   628 <exit>
  54:	66 90                	xchg   %ax,%ax
  56:	66 90                	xchg   %ax,%ax
  58:	66 90                	xchg   %ax,%ax
  5a:	66 90                	xchg   %ax,%ax
  5c:	66 90                	xchg   %ax,%ax
  5e:	66 90                	xchg   %ax,%ax

00000060 <fmtname>:
#include "user.h"
#include "fs.h"

char*
fmtname(char *path)
{
  60:	55                   	push   %ebp
  61:	89 e5                	mov    %esp,%ebp
  63:	56                   	push   %esi
  64:	53                   	push   %ebx
  65:	8b 5d 08             	mov    0x8(%ebp),%ebx
  static char buf[DIRSIZ+1];
  char *p;

  // Find first character after last slash.
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
  68:	83 ec 0c             	sub    $0xc,%esp
  6b:	53                   	push   %ebx
  6c:	e8 df 03 00 00       	call   450 <strlen>
  71:	83 c4 10             	add    $0x10,%esp
  74:	01 d8                	add    %ebx,%eax
  76:	73 0f                	jae    87 <fmtname+0x27>
  78:	eb 12                	jmp    8c <fmtname+0x2c>
  7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  80:	83 e8 01             	sub    $0x1,%eax
  83:	39 c3                	cmp    %eax,%ebx
  85:	77 05                	ja     8c <fmtname+0x2c>
  87:	80 38 2f             	cmpb   $0x2f,(%eax)
  8a:	75 f4                	jne    80 <fmtname+0x20>
    ;
  p++;
  8c:	8d 58 01             	lea    0x1(%eax),%ebx

  // Return blank-padded name.
  if(strlen(p) >= DIRSIZ)
  8f:	83 ec 0c             	sub    $0xc,%esp
  92:	53                   	push   %ebx
  93:	e8 b8 03 00 00       	call   450 <strlen>
  98:	83 c4 10             	add    $0x10,%esp
  9b:	83 f8 0d             	cmp    $0xd,%eax
  9e:	77 4a                	ja     ea <fmtname+0x8a>
    return p;
  memmove(buf, p, strlen(p));
  a0:	83 ec 0c             	sub    $0xc,%esp
  a3:	53                   	push   %ebx
  a4:	e8 a7 03 00 00       	call   450 <strlen>
  a9:	83 c4 0c             	add    $0xc,%esp
  ac:	50                   	push   %eax
  ad:	53                   	push   %ebx
  ae:	68 84 0e 00 00       	push   $0xe84
  b3:	e8 28 05 00 00       	call   5e0 <memmove>
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  b8:	89 1c 24             	mov    %ebx,(%esp)
  bb:	e8 90 03 00 00       	call   450 <strlen>
  c0:	89 1c 24             	mov    %ebx,(%esp)
  c3:	89 c6                	mov    %eax,%esi
  return buf;
  c5:	bb 84 0e 00 00       	mov    $0xe84,%ebx

  // Return blank-padded name.
  if(strlen(p) >= DIRSIZ)
    return p;
  memmove(buf, p, strlen(p));
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  ca:	e8 81 03 00 00       	call   450 <strlen>
  cf:	ba 0e 00 00 00       	mov    $0xe,%edx
  d4:	83 c4 0c             	add    $0xc,%esp
  d7:	05 84 0e 00 00       	add    $0xe84,%eax
  dc:	29 f2                	sub    %esi,%edx
  de:	52                   	push   %edx
  df:	6a 20                	push   $0x20
  e1:	50                   	push   %eax
  e2:	e8 99 03 00 00       	call   480 <memset>
  return buf;
  e7:	83 c4 10             	add    $0x10,%esp
}
  ea:	8d 65 f8             	lea    -0x8(%ebp),%esp
  ed:	89 d8                	mov    %ebx,%eax
  ef:	5b                   	pop    %ebx
  f0:	5e                   	pop    %esi
  f1:	5d                   	pop    %ebp
  f2:	c3                   	ret    
  f3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000100 <ls>:

void
ls(char *path)
{
 100:	55                   	push   %ebp
 101:	89 e5                	mov    %esp,%ebp
 103:	57                   	push   %edi
 104:	56                   	push   %esi
 105:	53                   	push   %ebx
 106:	81 ec 64 02 00 00    	sub    $0x264,%esp
 10c:	8b 7d 08             	mov    0x8(%ebp),%edi
  char buf[512], *p;
  int fd;
  struct dirent de;
  struct stat st;

  if((fd = open(path, 0)) < 0){
 10f:	6a 00                	push   $0x0
 111:	57                   	push   %edi
 112:	e8 51 05 00 00       	call   668 <open>
 117:	83 c4 10             	add    $0x10,%esp
 11a:	85 c0                	test   %eax,%eax
 11c:	0f 88 9e 01 00 00    	js     2c0 <ls+0x1c0>
    printf(2, "ls: cannot open %s\n", path);
    return;
  }

  if(fstat(fd, &st) < 0){
 122:	8d b5 d4 fd ff ff    	lea    -0x22c(%ebp),%esi
 128:	83 ec 08             	sub    $0x8,%esp
 12b:	89 c3                	mov    %eax,%ebx
 12d:	56                   	push   %esi
 12e:	50                   	push   %eax
 12f:	e8 4c 05 00 00       	call   680 <fstat>
 134:	83 c4 10             	add    $0x10,%esp
 137:	85 c0                	test   %eax,%eax
 139:	0f 88 c1 01 00 00    	js     300 <ls+0x200>
    printf(2, "ls: cannot stat %s\n", path);
    close(fd);
    return;
  }

  switch(st.type){
 13f:	0f b7 85 d4 fd ff ff 	movzwl -0x22c(%ebp),%eax
 146:	66 83 f8 01          	cmp    $0x1,%ax
 14a:	74 54                	je     1a0 <ls+0xa0>
 14c:	66 83 f8 02          	cmp    $0x2,%ax
 150:	75 37                	jne    189 <ls+0x89>
  case T_FILE:
    printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
 152:	83 ec 0c             	sub    $0xc,%esp
 155:	8b 95 e4 fd ff ff    	mov    -0x21c(%ebp),%edx
 15b:	8b b5 dc fd ff ff    	mov    -0x224(%ebp),%esi
 161:	57                   	push   %edi
 162:	89 95 b4 fd ff ff    	mov    %edx,-0x24c(%ebp)
 168:	e8 f3 fe ff ff       	call   60 <fmtname>
 16d:	8b 95 b4 fd ff ff    	mov    -0x24c(%ebp),%edx
 173:	59                   	pop    %ecx
 174:	5f                   	pop    %edi
 175:	52                   	push   %edx
 176:	56                   	push   %esi
 177:	6a 02                	push   $0x2
 179:	50                   	push   %eax
 17a:	68 c8 0a 00 00       	push   $0xac8
 17f:	6a 01                	push   $0x1
 181:	e8 fa 05 00 00       	call   780 <printf>
    break;
 186:	83 c4 20             	add    $0x20,%esp
      }
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
    }
    break;
  }
  close(fd);
 189:	83 ec 0c             	sub    $0xc,%esp
 18c:	53                   	push   %ebx
 18d:	e8 be 04 00 00       	call   650 <close>
 192:	83 c4 10             	add    $0x10,%esp
}
 195:	8d 65 f4             	lea    -0xc(%ebp),%esp
 198:	5b                   	pop    %ebx
 199:	5e                   	pop    %esi
 19a:	5f                   	pop    %edi
 19b:	5d                   	pop    %ebp
 19c:	c3                   	ret    
 19d:	8d 76 00             	lea    0x0(%esi),%esi
  case T_FILE:
    printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
    break;

  case T_DIR:
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
 1a0:	83 ec 0c             	sub    $0xc,%esp
 1a3:	57                   	push   %edi
 1a4:	e8 a7 02 00 00       	call   450 <strlen>
 1a9:	83 c0 10             	add    $0x10,%eax
 1ac:	83 c4 10             	add    $0x10,%esp
 1af:	3d 00 02 00 00       	cmp    $0x200,%eax
 1b4:	0f 87 26 01 00 00    	ja     2e0 <ls+0x1e0>
      printf(1, "ls: path too long\n");
      break;
    }
    strcpy(buf, path);
 1ba:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
 1c0:	83 ec 08             	sub    $0x8,%esp
 1c3:	57                   	push   %edi
 1c4:	8d bd c4 fd ff ff    	lea    -0x23c(%ebp),%edi
 1ca:	50                   	push   %eax
 1cb:	e8 70 01 00 00       	call   340 <strcpy>
    p = buf+strlen(buf);
 1d0:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
 1d6:	89 04 24             	mov    %eax,(%esp)
 1d9:	e8 72 02 00 00       	call   450 <strlen>
 1de:	8d 8d e8 fd ff ff    	lea    -0x218(%ebp),%ecx
    *p++ = '/';
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 1e4:	83 c4 10             	add    $0x10,%esp
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
      printf(1, "ls: path too long\n");
      break;
    }
    strcpy(buf, path);
    p = buf+strlen(buf);
 1e7:	01 c8                	add    %ecx,%eax
    *p++ = '/';
 1e9:	8d 48 01             	lea    0x1(%eax),%ecx
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
      printf(1, "ls: path too long\n");
      break;
    }
    strcpy(buf, path);
    p = buf+strlen(buf);
 1ec:	89 85 a8 fd ff ff    	mov    %eax,-0x258(%ebp)
    *p++ = '/';
 1f2:	c6 00 2f             	movb   $0x2f,(%eax)
 1f5:	89 8d a4 fd ff ff    	mov    %ecx,-0x25c(%ebp)
 1fb:	90                   	nop
 1fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 200:	83 ec 04             	sub    $0x4,%esp
 203:	6a 10                	push   $0x10
 205:	57                   	push   %edi
 206:	53                   	push   %ebx
 207:	e8 34 04 00 00       	call   640 <read>
 20c:	83 c4 10             	add    $0x10,%esp
 20f:	83 f8 10             	cmp    $0x10,%eax
 212:	0f 85 71 ff ff ff    	jne    189 <ls+0x89>
      if(de.inum == 0)
 218:	66 83 bd c4 fd ff ff 	cmpw   $0x0,-0x23c(%ebp)
 21f:	00 
 220:	74 de                	je     200 <ls+0x100>
        continue;
      memmove(p, de.name, DIRSIZ);
 222:	8d 85 c6 fd ff ff    	lea    -0x23a(%ebp),%eax
 228:	83 ec 04             	sub    $0x4,%esp
 22b:	6a 0e                	push   $0xe
 22d:	50                   	push   %eax
 22e:	ff b5 a4 fd ff ff    	pushl  -0x25c(%ebp)
 234:	e8 a7 03 00 00       	call   5e0 <memmove>
      p[DIRSIZ] = 0;
 239:	8b 85 a8 fd ff ff    	mov    -0x258(%ebp),%eax
 23f:	c6 40 0f 00          	movb   $0x0,0xf(%eax)
      if(stat(buf, &st) < 0){
 243:	58                   	pop    %eax
 244:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
 24a:	5a                   	pop    %edx
 24b:	56                   	push   %esi
 24c:	50                   	push   %eax
 24d:	e8 fe 02 00 00       	call   550 <stat>
 252:	83 c4 10             	add    $0x10,%esp
 255:	85 c0                	test   %eax,%eax
 257:	0f 88 c3 00 00 00    	js     320 <ls+0x220>
        printf(1, "ls: cannot stat %s\n", buf);
        continue;
      }
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
 25d:	8b 8d e4 fd ff ff    	mov    -0x21c(%ebp),%ecx
 263:	0f bf 85 d4 fd ff ff 	movswl -0x22c(%ebp),%eax
 26a:	83 ec 0c             	sub    $0xc,%esp
 26d:	8b 95 dc fd ff ff    	mov    -0x224(%ebp),%edx
 273:	89 8d ac fd ff ff    	mov    %ecx,-0x254(%ebp)
 279:	8d 8d e8 fd ff ff    	lea    -0x218(%ebp),%ecx
 27f:	89 95 b0 fd ff ff    	mov    %edx,-0x250(%ebp)
 285:	89 85 b4 fd ff ff    	mov    %eax,-0x24c(%ebp)
 28b:	51                   	push   %ecx
 28c:	e8 cf fd ff ff       	call   60 <fmtname>
 291:	5a                   	pop    %edx
 292:	8b 95 b0 fd ff ff    	mov    -0x250(%ebp),%edx
 298:	59                   	pop    %ecx
 299:	8b 8d ac fd ff ff    	mov    -0x254(%ebp),%ecx
 29f:	51                   	push   %ecx
 2a0:	52                   	push   %edx
 2a1:	ff b5 b4 fd ff ff    	pushl  -0x24c(%ebp)
 2a7:	50                   	push   %eax
 2a8:	68 c8 0a 00 00       	push   $0xac8
 2ad:	6a 01                	push   $0x1
 2af:	e8 cc 04 00 00       	call   780 <printf>
 2b4:	83 c4 20             	add    $0x20,%esp
 2b7:	e9 44 ff ff ff       	jmp    200 <ls+0x100>
 2bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  int fd;
  struct dirent de;
  struct stat st;

  if((fd = open(path, 0)) < 0){
    printf(2, "ls: cannot open %s\n", path);
 2c0:	83 ec 04             	sub    $0x4,%esp
 2c3:	57                   	push   %edi
 2c4:	68 a0 0a 00 00       	push   $0xaa0
 2c9:	6a 02                	push   $0x2
 2cb:	e8 b0 04 00 00       	call   780 <printf>
    return;
 2d0:	83 c4 10             	add    $0x10,%esp
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
    }
    break;
  }
  close(fd);
}
 2d3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2d6:	5b                   	pop    %ebx
 2d7:	5e                   	pop    %esi
 2d8:	5f                   	pop    %edi
 2d9:	5d                   	pop    %ebp
 2da:	c3                   	ret    
 2db:	90                   	nop
 2dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
    break;

  case T_DIR:
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
      printf(1, "ls: path too long\n");
 2e0:	83 ec 08             	sub    $0x8,%esp
 2e3:	68 d5 0a 00 00       	push   $0xad5
 2e8:	6a 01                	push   $0x1
 2ea:	e8 91 04 00 00       	call   780 <printf>
      break;
 2ef:	83 c4 10             	add    $0x10,%esp
 2f2:	e9 92 fe ff ff       	jmp    189 <ls+0x89>
 2f7:	89 f6                	mov    %esi,%esi
 2f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    printf(2, "ls: cannot open %s\n", path);
    return;
  }

  if(fstat(fd, &st) < 0){
    printf(2, "ls: cannot stat %s\n", path);
 300:	83 ec 04             	sub    $0x4,%esp
 303:	57                   	push   %edi
 304:	68 b4 0a 00 00       	push   $0xab4
 309:	6a 02                	push   $0x2
 30b:	e8 70 04 00 00       	call   780 <printf>
    close(fd);
 310:	89 1c 24             	mov    %ebx,(%esp)
 313:	e8 38 03 00 00       	call   650 <close>
    return;
 318:	83 c4 10             	add    $0x10,%esp
 31b:	e9 75 fe ff ff       	jmp    195 <ls+0x95>
      if(de.inum == 0)
        continue;
      memmove(p, de.name, DIRSIZ);
      p[DIRSIZ] = 0;
      if(stat(buf, &st) < 0){
        printf(1, "ls: cannot stat %s\n", buf);
 320:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
 326:	83 ec 04             	sub    $0x4,%esp
 329:	50                   	push   %eax
 32a:	68 b4 0a 00 00       	push   $0xab4
 32f:	6a 01                	push   $0x1
 331:	e8 4a 04 00 00       	call   780 <printf>
        continue;
 336:	83 c4 10             	add    $0x10,%esp
 339:	e9 c2 fe ff ff       	jmp    200 <ls+0x100>
 33e:	66 90                	xchg   %ax,%ax

00000340 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 340:	55                   	push   %ebp
 341:	89 e5                	mov    %esp,%ebp
 343:	53                   	push   %ebx
 344:	8b 45 08             	mov    0x8(%ebp),%eax
 347:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 34a:	89 c2                	mov    %eax,%edx
 34c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 350:	83 c1 01             	add    $0x1,%ecx
 353:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 357:	83 c2 01             	add    $0x1,%edx
 35a:	84 db                	test   %bl,%bl
 35c:	88 5a ff             	mov    %bl,-0x1(%edx)
 35f:	75 ef                	jne    350 <strcpy+0x10>
    ;
  return os;
}
 361:	5b                   	pop    %ebx
 362:	5d                   	pop    %ebp
 363:	c3                   	ret    
 364:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 36a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000370 <strncpy>:

char* strncpy(char* s, char* t, int n) {
 370:	55                   	push   %ebp
  int i = 0;
 371:	31 d2                	xor    %edx,%edx
  while((*s++ = *t++) != 0)
    ;
  return os;
}

char* strncpy(char* s, char* t, int n) {
 373:	89 e5                	mov    %esp,%ebp
 375:	56                   	push   %esi
 376:	53                   	push   %ebx
 377:	8b 45 08             	mov    0x8(%ebp),%eax
 37a:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 37d:	8b 75 10             	mov    0x10(%ebp),%esi
  int i = 0;
  char *os;
  os = s;
  while(((*s++ = *t++) != 0) && (++i < n));
 380:	eb 0d                	jmp    38f <strncpy+0x1f>
 382:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 388:	83 c2 01             	add    $0x1,%edx
 38b:	39 f2                	cmp    %esi,%edx
 38d:	7d 0b                	jge    39a <strncpy+0x2a>
 38f:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
 393:	84 c9                	test   %cl,%cl
 395:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 398:	75 ee                	jne    388 <strncpy+0x18>
  return os;
}
 39a:	5b                   	pop    %ebx
 39b:	5e                   	pop    %esi
 39c:	5d                   	pop    %ebp
 39d:	c3                   	ret    
 39e:	66 90                	xchg   %ax,%ax

000003a0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 3a0:	55                   	push   %ebp
 3a1:	89 e5                	mov    %esp,%ebp
 3a3:	56                   	push   %esi
 3a4:	53                   	push   %ebx
 3a5:	8b 55 08             	mov    0x8(%ebp),%edx
 3a8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 3ab:	0f b6 02             	movzbl (%edx),%eax
 3ae:	0f b6 19             	movzbl (%ecx),%ebx
 3b1:	84 c0                	test   %al,%al
 3b3:	75 1e                	jne    3d3 <strcmp+0x33>
 3b5:	eb 29                	jmp    3e0 <strcmp+0x40>
 3b7:	89 f6                	mov    %esi,%esi
 3b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 3c0:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 3c3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 3c6:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 3c9:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 3cd:	84 c0                	test   %al,%al
 3cf:	74 0f                	je     3e0 <strcmp+0x40>
 3d1:	89 f1                	mov    %esi,%ecx
 3d3:	38 d8                	cmp    %bl,%al
 3d5:	74 e9                	je     3c0 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 3d7:	29 d8                	sub    %ebx,%eax
}
 3d9:	5b                   	pop    %ebx
 3da:	5e                   	pop    %esi
 3db:	5d                   	pop    %ebp
 3dc:	c3                   	ret    
 3dd:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 3e0:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
 3e2:	29 d8                	sub    %ebx,%eax
}
 3e4:	5b                   	pop    %ebx
 3e5:	5e                   	pop    %esi
 3e6:	5d                   	pop    %ebp
 3e7:	c3                   	ret    
 3e8:	90                   	nop
 3e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000003f0 <strncmp>:

int strncmp(const char *p, const char *q, int n) {
 3f0:	55                   	push   %ebp
 3f1:	89 e5                	mov    %esp,%ebp
 3f3:	57                   	push   %edi
 3f4:	56                   	push   %esi
 3f5:	53                   	push   %ebx
 3f6:	8b 5d 10             	mov    0x10(%ebp),%ebx
 3f9:	8b 75 08             	mov    0x8(%ebp),%esi
 3fc:	8b 7d 0c             	mov    0xc(%ebp),%edi
  int i = 0;
  while(i < n && *p == *q)
 3ff:	85 db                	test   %ebx,%ebx
 401:	7e 28                	jle    42b <strncmp+0x3b>
 403:	0f b6 16             	movzbl (%esi),%edx
 406:	0f b6 0f             	movzbl (%edi),%ecx
 409:	38 d1                	cmp    %dl,%cl
 40b:	75 2b                	jne    438 <strncmp+0x48>
 40d:	31 c0                	xor    %eax,%eax
 40f:	eb 13                	jmp    424 <strncmp+0x34>
 411:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 418:	0f b6 14 06          	movzbl (%esi,%eax,1),%edx
 41c:	0f b6 0c 07          	movzbl (%edi,%eax,1),%ecx
 420:	38 ca                	cmp    %cl,%dl
 422:	75 14                	jne    438 <strncmp+0x48>
    p++, q++, i++;
 424:	83 c0 01             	add    $0x1,%eax
  return (uchar)*p - (uchar)*q;
}

int strncmp(const char *p, const char *q, int n) {
  int i = 0;
  while(i < n && *p == *q)
 427:	39 c3                	cmp    %eax,%ebx
 429:	75 ed                	jne    418 <strncmp+0x28>
    p++, q++, i++;
  if (i < n)
    return (uchar)*p - (uchar)*q;
  else
    return 0;
}
 42b:	5b                   	pop    %ebx
  while(i < n && *p == *q)
    p++, q++, i++;
  if (i < n)
    return (uchar)*p - (uchar)*q;
  else
    return 0;
 42c:	31 c0                	xor    %eax,%eax
}
 42e:	5e                   	pop    %esi
 42f:	5f                   	pop    %edi
 430:	5d                   	pop    %ebp
 431:	c3                   	ret    
 432:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
int strncmp(const char *p, const char *q, int n) {
  int i = 0;
  while(i < n && *p == *q)
    p++, q++, i++;
  if (i < n)
    return (uchar)*p - (uchar)*q;
 438:	0f b6 c2             	movzbl %dl,%eax
  else
    return 0;
}
 43b:	5b                   	pop    %ebx
int strncmp(const char *p, const char *q, int n) {
  int i = 0;
  while(i < n && *p == *q)
    p++, q++, i++;
  if (i < n)
    return (uchar)*p - (uchar)*q;
 43c:	29 c8                	sub    %ecx,%eax
  else
    return 0;
}
 43e:	5e                   	pop    %esi
 43f:	5f                   	pop    %edi
 440:	5d                   	pop    %ebp
 441:	c3                   	ret    
 442:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 449:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000450 <strlen>:

uint
strlen(char *s)
{
 450:	55                   	push   %ebp
 451:	89 e5                	mov    %esp,%ebp
 453:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 456:	80 39 00             	cmpb   $0x0,(%ecx)
 459:	74 12                	je     46d <strlen+0x1d>
 45b:	31 d2                	xor    %edx,%edx
 45d:	8d 76 00             	lea    0x0(%esi),%esi
 460:	83 c2 01             	add    $0x1,%edx
 463:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 467:	89 d0                	mov    %edx,%eax
 469:	75 f5                	jne    460 <strlen+0x10>
    ;
  return n;
}
 46b:	5d                   	pop    %ebp
 46c:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 46d:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
 46f:	5d                   	pop    %ebp
 470:	c3                   	ret    
 471:	eb 0d                	jmp    480 <memset>
 473:	90                   	nop
 474:	90                   	nop
 475:	90                   	nop
 476:	90                   	nop
 477:	90                   	nop
 478:	90                   	nop
 479:	90                   	nop
 47a:	90                   	nop
 47b:	90                   	nop
 47c:	90                   	nop
 47d:	90                   	nop
 47e:	90                   	nop
 47f:	90                   	nop

00000480 <memset>:

void*
memset(void *dst, int c, uint n)
{
 480:	55                   	push   %ebp
 481:	89 e5                	mov    %esp,%ebp
 483:	57                   	push   %edi
 484:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 487:	8b 4d 10             	mov    0x10(%ebp),%ecx
 48a:	8b 45 0c             	mov    0xc(%ebp),%eax
 48d:	89 d7                	mov    %edx,%edi
 48f:	fc                   	cld    
 490:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 492:	89 d0                	mov    %edx,%eax
 494:	5f                   	pop    %edi
 495:	5d                   	pop    %ebp
 496:	c3                   	ret    
 497:	89 f6                	mov    %esi,%esi
 499:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000004a0 <strchr>:

char*
strchr(const char *s, char c)
{
 4a0:	55                   	push   %ebp
 4a1:	89 e5                	mov    %esp,%ebp
 4a3:	53                   	push   %ebx
 4a4:	8b 45 08             	mov    0x8(%ebp),%eax
 4a7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 4aa:	0f b6 10             	movzbl (%eax),%edx
 4ad:	84 d2                	test   %dl,%dl
 4af:	74 1d                	je     4ce <strchr+0x2e>
    if(*s == c)
 4b1:	38 d3                	cmp    %dl,%bl
 4b3:	89 d9                	mov    %ebx,%ecx
 4b5:	75 0d                	jne    4c4 <strchr+0x24>
 4b7:	eb 17                	jmp    4d0 <strchr+0x30>
 4b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4c0:	38 ca                	cmp    %cl,%dl
 4c2:	74 0c                	je     4d0 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 4c4:	83 c0 01             	add    $0x1,%eax
 4c7:	0f b6 10             	movzbl (%eax),%edx
 4ca:	84 d2                	test   %dl,%dl
 4cc:	75 f2                	jne    4c0 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
 4ce:	31 c0                	xor    %eax,%eax
}
 4d0:	5b                   	pop    %ebx
 4d1:	5d                   	pop    %ebp
 4d2:	c3                   	ret    
 4d3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 4d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000004e0 <gets>:

char*
gets(char *buf, int max)
{
 4e0:	55                   	push   %ebp
 4e1:	89 e5                	mov    %esp,%ebp
 4e3:	57                   	push   %edi
 4e4:	56                   	push   %esi
 4e5:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 4e6:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
 4e8:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
 4eb:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 4ee:	eb 29                	jmp    519 <gets+0x39>
    cc = read(0, &c, 1);
 4f0:	83 ec 04             	sub    $0x4,%esp
 4f3:	6a 01                	push   $0x1
 4f5:	57                   	push   %edi
 4f6:	6a 00                	push   $0x0
 4f8:	e8 43 01 00 00       	call   640 <read>
    if(cc < 1)
 4fd:	83 c4 10             	add    $0x10,%esp
 500:	85 c0                	test   %eax,%eax
 502:	7e 1d                	jle    521 <gets+0x41>
      break;
    buf[i++] = c;
 504:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 508:	8b 55 08             	mov    0x8(%ebp),%edx
 50b:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
 50d:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 50f:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 513:	74 1b                	je     530 <gets+0x50>
 515:	3c 0d                	cmp    $0xd,%al
 517:	74 17                	je     530 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 519:	8d 5e 01             	lea    0x1(%esi),%ebx
 51c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 51f:	7c cf                	jl     4f0 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 521:	8b 45 08             	mov    0x8(%ebp),%eax
 524:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 528:	8d 65 f4             	lea    -0xc(%ebp),%esp
 52b:	5b                   	pop    %ebx
 52c:	5e                   	pop    %esi
 52d:	5f                   	pop    %edi
 52e:	5d                   	pop    %ebp
 52f:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 530:	8b 45 08             	mov    0x8(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 533:	89 de                	mov    %ebx,%esi
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 535:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 539:	8d 65 f4             	lea    -0xc(%ebp),%esp
 53c:	5b                   	pop    %ebx
 53d:	5e                   	pop    %esi
 53e:	5f                   	pop    %edi
 53f:	5d                   	pop    %ebp
 540:	c3                   	ret    
 541:	eb 0d                	jmp    550 <stat>
 543:	90                   	nop
 544:	90                   	nop
 545:	90                   	nop
 546:	90                   	nop
 547:	90                   	nop
 548:	90                   	nop
 549:	90                   	nop
 54a:	90                   	nop
 54b:	90                   	nop
 54c:	90                   	nop
 54d:	90                   	nop
 54e:	90                   	nop
 54f:	90                   	nop

00000550 <stat>:

int
stat(char *n, struct stat *st)
{
 550:	55                   	push   %ebp
 551:	89 e5                	mov    %esp,%ebp
 553:	56                   	push   %esi
 554:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 555:	83 ec 08             	sub    $0x8,%esp
 558:	6a 00                	push   $0x0
 55a:	ff 75 08             	pushl  0x8(%ebp)
 55d:	e8 06 01 00 00       	call   668 <open>
  if(fd < 0)
 562:	83 c4 10             	add    $0x10,%esp
 565:	85 c0                	test   %eax,%eax
 567:	78 27                	js     590 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 569:	83 ec 08             	sub    $0x8,%esp
 56c:	ff 75 0c             	pushl  0xc(%ebp)
 56f:	89 c3                	mov    %eax,%ebx
 571:	50                   	push   %eax
 572:	e8 09 01 00 00       	call   680 <fstat>
  close(fd);
 577:	89 1c 24             	mov    %ebx,(%esp)
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
  r = fstat(fd, st);
 57a:	89 c6                	mov    %eax,%esi
  close(fd);
 57c:	e8 cf 00 00 00       	call   650 <close>
  return r;
 581:	83 c4 10             	add    $0x10,%esp
}
 584:	8d 65 f8             	lea    -0x8(%ebp),%esp
 587:	89 f0                	mov    %esi,%eax
 589:	5b                   	pop    %ebx
 58a:	5e                   	pop    %esi
 58b:	5d                   	pop    %ebp
 58c:	c3                   	ret    
 58d:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 590:	be ff ff ff ff       	mov    $0xffffffff,%esi
 595:	eb ed                	jmp    584 <stat+0x34>
 597:	89 f6                	mov    %esi,%esi
 599:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000005a0 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 5a0:	55                   	push   %ebp
 5a1:	89 e5                	mov    %esp,%ebp
 5a3:	53                   	push   %ebx
 5a4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 5a7:	0f be 11             	movsbl (%ecx),%edx
 5aa:	8d 42 d0             	lea    -0x30(%edx),%eax
 5ad:	3c 09                	cmp    $0x9,%al
 5af:	b8 00 00 00 00       	mov    $0x0,%eax
 5b4:	77 1f                	ja     5d5 <atoi+0x35>
 5b6:	8d 76 00             	lea    0x0(%esi),%esi
 5b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 5c0:	8d 04 80             	lea    (%eax,%eax,4),%eax
 5c3:	83 c1 01             	add    $0x1,%ecx
 5c6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 5ca:	0f be 11             	movsbl (%ecx),%edx
 5cd:	8d 5a d0             	lea    -0x30(%edx),%ebx
 5d0:	80 fb 09             	cmp    $0x9,%bl
 5d3:	76 eb                	jbe    5c0 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
 5d5:	5b                   	pop    %ebx
 5d6:	5d                   	pop    %ebp
 5d7:	c3                   	ret    
 5d8:	90                   	nop
 5d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000005e0 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 5e0:	55                   	push   %ebp
 5e1:	89 e5                	mov    %esp,%ebp
 5e3:	56                   	push   %esi
 5e4:	53                   	push   %ebx
 5e5:	8b 5d 10             	mov    0x10(%ebp),%ebx
 5e8:	8b 45 08             	mov    0x8(%ebp),%eax
 5eb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 5ee:	85 db                	test   %ebx,%ebx
 5f0:	7e 14                	jle    606 <memmove+0x26>
 5f2:	31 d2                	xor    %edx,%edx
 5f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 5f8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 5fc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 5ff:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 602:	39 da                	cmp    %ebx,%edx
 604:	75 f2                	jne    5f8 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 606:	5b                   	pop    %ebx
 607:	5e                   	pop    %esi
 608:	5d                   	pop    %ebp
 609:	c3                   	ret    
 60a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000610 <max>:

int max(int a, int b) {
 610:	55                   	push   %ebp
 611:	89 e5                	mov    %esp,%ebp
 613:	8b 55 08             	mov    0x8(%ebp),%edx
 616:	8b 45 0c             	mov    0xc(%ebp),%eax
  if (b > a) return b;
  else return a;
}
 619:	5d                   	pop    %ebp
 61a:	39 d0                	cmp    %edx,%eax
 61c:	0f 4c c2             	cmovl  %edx,%eax
 61f:	c3                   	ret    

00000620 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 620:	b8 01 00 00 00       	mov    $0x1,%eax
 625:	cd 40                	int    $0x40
 627:	c3                   	ret    

00000628 <exit>:
SYSCALL(exit)
 628:	b8 02 00 00 00       	mov    $0x2,%eax
 62d:	cd 40                	int    $0x40
 62f:	c3                   	ret    

00000630 <wait>:
SYSCALL(wait)
 630:	b8 03 00 00 00       	mov    $0x3,%eax
 635:	cd 40                	int    $0x40
 637:	c3                   	ret    

00000638 <pipe>:
SYSCALL(pipe)
 638:	b8 04 00 00 00       	mov    $0x4,%eax
 63d:	cd 40                	int    $0x40
 63f:	c3                   	ret    

00000640 <read>:
SYSCALL(read)
 640:	b8 05 00 00 00       	mov    $0x5,%eax
 645:	cd 40                	int    $0x40
 647:	c3                   	ret    

00000648 <write>:
SYSCALL(write)
 648:	b8 10 00 00 00       	mov    $0x10,%eax
 64d:	cd 40                	int    $0x40
 64f:	c3                   	ret    

00000650 <close>:
SYSCALL(close)
 650:	b8 15 00 00 00       	mov    $0x15,%eax
 655:	cd 40                	int    $0x40
 657:	c3                   	ret    

00000658 <kill>:
SYSCALL(kill)
 658:	b8 06 00 00 00       	mov    $0x6,%eax
 65d:	cd 40                	int    $0x40
 65f:	c3                   	ret    

00000660 <exec>:
SYSCALL(exec)
 660:	b8 07 00 00 00       	mov    $0x7,%eax
 665:	cd 40                	int    $0x40
 667:	c3                   	ret    

00000668 <open>:
SYSCALL(open)
 668:	b8 0f 00 00 00       	mov    $0xf,%eax
 66d:	cd 40                	int    $0x40
 66f:	c3                   	ret    

00000670 <mknod>:
SYSCALL(mknod)
 670:	b8 11 00 00 00       	mov    $0x11,%eax
 675:	cd 40                	int    $0x40
 677:	c3                   	ret    

00000678 <unlink>:
SYSCALL(unlink)
 678:	b8 12 00 00 00       	mov    $0x12,%eax
 67d:	cd 40                	int    $0x40
 67f:	c3                   	ret    

00000680 <fstat>:
SYSCALL(fstat)
 680:	b8 08 00 00 00       	mov    $0x8,%eax
 685:	cd 40                	int    $0x40
 687:	c3                   	ret    

00000688 <link>:
SYSCALL(link)
 688:	b8 13 00 00 00       	mov    $0x13,%eax
 68d:	cd 40                	int    $0x40
 68f:	c3                   	ret    

00000690 <mkdir>:
SYSCALL(mkdir)
 690:	b8 14 00 00 00       	mov    $0x14,%eax
 695:	cd 40                	int    $0x40
 697:	c3                   	ret    

00000698 <chdir>:
SYSCALL(chdir)
 698:	b8 09 00 00 00       	mov    $0x9,%eax
 69d:	cd 40                	int    $0x40
 69f:	c3                   	ret    

000006a0 <dup>:
SYSCALL(dup)
 6a0:	b8 0a 00 00 00       	mov    $0xa,%eax
 6a5:	cd 40                	int    $0x40
 6a7:	c3                   	ret    

000006a8 <getpid>:
SYSCALL(getpid)
 6a8:	b8 0b 00 00 00       	mov    $0xb,%eax
 6ad:	cd 40                	int    $0x40
 6af:	c3                   	ret    

000006b0 <sbrk>:
SYSCALL(sbrk)
 6b0:	b8 0c 00 00 00       	mov    $0xc,%eax
 6b5:	cd 40                	int    $0x40
 6b7:	c3                   	ret    

000006b8 <sleep>:
SYSCALL(sleep)
 6b8:	b8 0d 00 00 00       	mov    $0xd,%eax
 6bd:	cd 40                	int    $0x40
 6bf:	c3                   	ret    

000006c0 <uptime>:
SYSCALL(uptime)
 6c0:	b8 0e 00 00 00       	mov    $0xe,%eax
 6c5:	cd 40                	int    $0x40
 6c7:	c3                   	ret    

000006c8 <setVariable>:
SYSCALL(setVariable)
 6c8:	b8 17 00 00 00       	mov    $0x17,%eax
 6cd:	cd 40                	int    $0x40
 6cf:	c3                   	ret    

000006d0 <getVariable>:
SYSCALL(getVariable)
 6d0:	b8 18 00 00 00       	mov    $0x18,%eax
 6d5:	cd 40                	int    $0x40
 6d7:	c3                   	ret    

000006d8 <remVariable>:
SYSCALL(remVariable)
 6d8:	b8 19 00 00 00       	mov    $0x19,%eax
 6dd:	cd 40                	int    $0x40
 6df:	c3                   	ret    

000006e0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 6e0:	55                   	push   %ebp
 6e1:	89 e5                	mov    %esp,%ebp
 6e3:	57                   	push   %edi
 6e4:	56                   	push   %esi
 6e5:	53                   	push   %ebx
 6e6:	89 c6                	mov    %eax,%esi
 6e8:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 6eb:	8b 5d 08             	mov    0x8(%ebp),%ebx
 6ee:	85 db                	test   %ebx,%ebx
 6f0:	74 7e                	je     770 <printint+0x90>
 6f2:	89 d0                	mov    %edx,%eax
 6f4:	c1 e8 1f             	shr    $0x1f,%eax
 6f7:	84 c0                	test   %al,%al
 6f9:	74 75                	je     770 <printint+0x90>
    neg = 1;
    x = -xx;
 6fb:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 6fd:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
 704:	f7 d8                	neg    %eax
 706:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 709:	31 ff                	xor    %edi,%edi
 70b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 70e:	89 ce                	mov    %ecx,%esi
 710:	eb 08                	jmp    71a <printint+0x3a>
 712:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 718:	89 cf                	mov    %ecx,%edi
 71a:	31 d2                	xor    %edx,%edx
 71c:	8d 4f 01             	lea    0x1(%edi),%ecx
 71f:	f7 f6                	div    %esi
 721:	0f b6 92 f4 0a 00 00 	movzbl 0xaf4(%edx),%edx
  }while((x /= base) != 0);
 728:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 72a:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 72d:	75 e9                	jne    718 <printint+0x38>
  if(neg)
 72f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 732:	8b 75 c0             	mov    -0x40(%ebp),%esi
 735:	85 c0                	test   %eax,%eax
 737:	74 08                	je     741 <printint+0x61>
    buf[i++] = '-';
 739:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
 73e:	8d 4f 02             	lea    0x2(%edi),%ecx

  while(--i >= 0)
 741:	8d 79 ff             	lea    -0x1(%ecx),%edi
 744:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 748:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 74d:	83 ec 04             	sub    $0x4,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 750:	83 ef 01             	sub    $0x1,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 753:	6a 01                	push   $0x1
 755:	53                   	push   %ebx
 756:	56                   	push   %esi
 757:	88 45 d7             	mov    %al,-0x29(%ebp)
 75a:	e8 e9 fe ff ff       	call   648 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 75f:	83 c4 10             	add    $0x10,%esp
 762:	83 ff ff             	cmp    $0xffffffff,%edi
 765:	75 e1                	jne    748 <printint+0x68>
    putc(fd, buf[i]);
}
 767:	8d 65 f4             	lea    -0xc(%ebp),%esp
 76a:	5b                   	pop    %ebx
 76b:	5e                   	pop    %esi
 76c:	5f                   	pop    %edi
 76d:	5d                   	pop    %ebp
 76e:	c3                   	ret    
 76f:	90                   	nop
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 770:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 772:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 779:	eb 8b                	jmp    706 <printint+0x26>
 77b:	90                   	nop
 77c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000780 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 780:	55                   	push   %ebp
 781:	89 e5                	mov    %esp,%ebp
 783:	57                   	push   %edi
 784:	56                   	push   %esi
 785:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 786:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 789:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 78c:	8b 75 0c             	mov    0xc(%ebp),%esi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 78f:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 792:	89 45 d0             	mov    %eax,-0x30(%ebp)
 795:	0f b6 1e             	movzbl (%esi),%ebx
 798:	83 c6 01             	add    $0x1,%esi
 79b:	84 db                	test   %bl,%bl
 79d:	0f 84 b0 00 00 00    	je     853 <printf+0xd3>
 7a3:	31 d2                	xor    %edx,%edx
 7a5:	eb 39                	jmp    7e0 <printf+0x60>
 7a7:	89 f6                	mov    %esi,%esi
 7a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 7b0:	83 f8 25             	cmp    $0x25,%eax
 7b3:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
 7b6:	ba 25 00 00 00       	mov    $0x25,%edx
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 7bb:	74 18                	je     7d5 <printf+0x55>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 7bd:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 7c0:	83 ec 04             	sub    $0x4,%esp
 7c3:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 7c6:	6a 01                	push   $0x1
 7c8:	50                   	push   %eax
 7c9:	57                   	push   %edi
 7ca:	e8 79 fe ff ff       	call   648 <write>
 7cf:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 7d2:	83 c4 10             	add    $0x10,%esp
 7d5:	83 c6 01             	add    $0x1,%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 7d8:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 7dc:	84 db                	test   %bl,%bl
 7de:	74 73                	je     853 <printf+0xd3>
    c = fmt[i] & 0xff;
    if(state == 0){
 7e0:	85 d2                	test   %edx,%edx
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
 7e2:	0f be cb             	movsbl %bl,%ecx
 7e5:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 7e8:	74 c6                	je     7b0 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 7ea:	83 fa 25             	cmp    $0x25,%edx
 7ed:	75 e6                	jne    7d5 <printf+0x55>
      if(c == 'd'){
 7ef:	83 f8 64             	cmp    $0x64,%eax
 7f2:	0f 84 f8 00 00 00    	je     8f0 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 7f8:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 7fe:	83 f9 70             	cmp    $0x70,%ecx
 801:	74 5d                	je     860 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 803:	83 f8 73             	cmp    $0x73,%eax
 806:	0f 84 84 00 00 00    	je     890 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 80c:	83 f8 63             	cmp    $0x63,%eax
 80f:	0f 84 ea 00 00 00    	je     8ff <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 815:	83 f8 25             	cmp    $0x25,%eax
 818:	0f 84 c2 00 00 00    	je     8e0 <printf+0x160>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 81e:	8d 45 e7             	lea    -0x19(%ebp),%eax
 821:	83 ec 04             	sub    $0x4,%esp
 824:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 828:	6a 01                	push   $0x1
 82a:	50                   	push   %eax
 82b:	57                   	push   %edi
 82c:	e8 17 fe ff ff       	call   648 <write>
 831:	83 c4 0c             	add    $0xc,%esp
 834:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 837:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 83a:	6a 01                	push   $0x1
 83c:	50                   	push   %eax
 83d:	57                   	push   %edi
 83e:	83 c6 01             	add    $0x1,%esi
 841:	e8 02 fe ff ff       	call   648 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 846:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 84a:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 84d:	31 d2                	xor    %edx,%edx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 84f:	84 db                	test   %bl,%bl
 851:	75 8d                	jne    7e0 <printf+0x60>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 853:	8d 65 f4             	lea    -0xc(%ebp),%esp
 856:	5b                   	pop    %ebx
 857:	5e                   	pop    %esi
 858:	5f                   	pop    %edi
 859:	5d                   	pop    %ebp
 85a:	c3                   	ret    
 85b:	90                   	nop
 85c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 860:	83 ec 0c             	sub    $0xc,%esp
 863:	b9 10 00 00 00       	mov    $0x10,%ecx
 868:	6a 00                	push   $0x0
 86a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 86d:	89 f8                	mov    %edi,%eax
 86f:	8b 13                	mov    (%ebx),%edx
 871:	e8 6a fe ff ff       	call   6e0 <printint>
        ap++;
 876:	89 d8                	mov    %ebx,%eax
 878:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 87b:	31 d2                	xor    %edx,%edx
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
 87d:	83 c0 04             	add    $0x4,%eax
 880:	89 45 d0             	mov    %eax,-0x30(%ebp)
 883:	e9 4d ff ff ff       	jmp    7d5 <printf+0x55>
 888:	90                   	nop
 889:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
 890:	8b 45 d0             	mov    -0x30(%ebp),%eax
 893:	8b 18                	mov    (%eax),%ebx
        ap++;
 895:	83 c0 04             	add    $0x4,%eax
 898:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 89b:	85 db                	test   %ebx,%ebx
 89d:	74 7c                	je     91b <printf+0x19b>
          s = "(null)";
        while(*s != 0){
 89f:	0f b6 03             	movzbl (%ebx),%eax
 8a2:	84 c0                	test   %al,%al
 8a4:	74 29                	je     8cf <printf+0x14f>
 8a6:	8d 76 00             	lea    0x0(%esi),%esi
 8a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 8b0:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 8b3:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 8b6:	83 ec 04             	sub    $0x4,%esp
 8b9:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
 8bb:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 8be:	50                   	push   %eax
 8bf:	57                   	push   %edi
 8c0:	e8 83 fd ff ff       	call   648 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 8c5:	0f b6 03             	movzbl (%ebx),%eax
 8c8:	83 c4 10             	add    $0x10,%esp
 8cb:	84 c0                	test   %al,%al
 8cd:	75 e1                	jne    8b0 <printf+0x130>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 8cf:	31 d2                	xor    %edx,%edx
 8d1:	e9 ff fe ff ff       	jmp    7d5 <printf+0x55>
 8d6:	8d 76 00             	lea    0x0(%esi),%esi
 8d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 8e0:	83 ec 04             	sub    $0x4,%esp
 8e3:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 8e6:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 8e9:	6a 01                	push   $0x1
 8eb:	e9 4c ff ff ff       	jmp    83c <printf+0xbc>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 8f0:	83 ec 0c             	sub    $0xc,%esp
 8f3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 8f8:	6a 01                	push   $0x1
 8fa:	e9 6b ff ff ff       	jmp    86a <printf+0xea>
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 8ff:	8b 5d d0             	mov    -0x30(%ebp),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 902:	83 ec 04             	sub    $0x4,%esp
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 905:	8b 03                	mov    (%ebx),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 907:	6a 01                	push   $0x1
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 909:	88 45 e4             	mov    %al,-0x1c(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 90c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 90f:	50                   	push   %eax
 910:	57                   	push   %edi
 911:	e8 32 fd ff ff       	call   648 <write>
 916:	e9 5b ff ff ff       	jmp    876 <printf+0xf6>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 91b:	b8 28 00 00 00       	mov    $0x28,%eax
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
 920:	bb ea 0a 00 00       	mov    $0xaea,%ebx
 925:	eb 89                	jmp    8b0 <printf+0x130>
 927:	66 90                	xchg   %ax,%ax
 929:	66 90                	xchg   %ax,%ax
 92b:	66 90                	xchg   %ax,%ax
 92d:	66 90                	xchg   %ax,%ax
 92f:	90                   	nop

00000930 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 930:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 931:	a1 94 0e 00 00       	mov    0xe94,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 936:	89 e5                	mov    %esp,%ebp
 938:	57                   	push   %edi
 939:	56                   	push   %esi
 93a:	53                   	push   %ebx
 93b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 93e:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
 940:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 943:	39 c8                	cmp    %ecx,%eax
 945:	73 19                	jae    960 <free+0x30>
 947:	89 f6                	mov    %esi,%esi
 949:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 950:	39 d1                	cmp    %edx,%ecx
 952:	72 1c                	jb     970 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 954:	39 d0                	cmp    %edx,%eax
 956:	73 18                	jae    970 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
 958:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 95a:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 95c:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 95e:	72 f0                	jb     950 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 960:	39 d0                	cmp    %edx,%eax
 962:	72 f4                	jb     958 <free+0x28>
 964:	39 d1                	cmp    %edx,%ecx
 966:	73 f0                	jae    958 <free+0x28>
 968:	90                   	nop
 969:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
 970:	8b 73 fc             	mov    -0x4(%ebx),%esi
 973:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 976:	39 fa                	cmp    %edi,%edx
 978:	74 19                	je     993 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 97a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 97d:	8b 50 04             	mov    0x4(%eax),%edx
 980:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 983:	39 f1                	cmp    %esi,%ecx
 985:	74 23                	je     9aa <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 987:	89 08                	mov    %ecx,(%eax)
  freep = p;
 989:	a3 94 0e 00 00       	mov    %eax,0xe94
}
 98e:	5b                   	pop    %ebx
 98f:	5e                   	pop    %esi
 990:	5f                   	pop    %edi
 991:	5d                   	pop    %ebp
 992:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 993:	03 72 04             	add    0x4(%edx),%esi
 996:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 999:	8b 10                	mov    (%eax),%edx
 99b:	8b 12                	mov    (%edx),%edx
 99d:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 9a0:	8b 50 04             	mov    0x4(%eax),%edx
 9a3:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 9a6:	39 f1                	cmp    %esi,%ecx
 9a8:	75 dd                	jne    987 <free+0x57>
    p->s.size += bp->s.size;
 9aa:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 9ad:	a3 94 0e 00 00       	mov    %eax,0xe94
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 9b2:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 9b5:	8b 53 f8             	mov    -0x8(%ebx),%edx
 9b8:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 9ba:	5b                   	pop    %ebx
 9bb:	5e                   	pop    %esi
 9bc:	5f                   	pop    %edi
 9bd:	5d                   	pop    %ebp
 9be:	c3                   	ret    
 9bf:	90                   	nop

000009c0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 9c0:	55                   	push   %ebp
 9c1:	89 e5                	mov    %esp,%ebp
 9c3:	57                   	push   %edi
 9c4:	56                   	push   %esi
 9c5:	53                   	push   %ebx
 9c6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9c9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 9cc:	8b 15 94 0e 00 00    	mov    0xe94,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9d2:	8d 78 07             	lea    0x7(%eax),%edi
 9d5:	c1 ef 03             	shr    $0x3,%edi
 9d8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 9db:	85 d2                	test   %edx,%edx
 9dd:	0f 84 93 00 00 00    	je     a76 <malloc+0xb6>
 9e3:	8b 02                	mov    (%edx),%eax
 9e5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 9e8:	39 cf                	cmp    %ecx,%edi
 9ea:	76 64                	jbe    a50 <malloc+0x90>
 9ec:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 9f2:	bb 00 10 00 00       	mov    $0x1000,%ebx
 9f7:	0f 43 df             	cmovae %edi,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 9fa:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 a01:	eb 0e                	jmp    a11 <malloc+0x51>
 a03:	90                   	nop
 a04:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a08:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 a0a:	8b 48 04             	mov    0x4(%eax),%ecx
 a0d:	39 cf                	cmp    %ecx,%edi
 a0f:	76 3f                	jbe    a50 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 a11:	39 05 94 0e 00 00    	cmp    %eax,0xe94
 a17:	89 c2                	mov    %eax,%edx
 a19:	75 ed                	jne    a08 <malloc+0x48>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 a1b:	83 ec 0c             	sub    $0xc,%esp
 a1e:	56                   	push   %esi
 a1f:	e8 8c fc ff ff       	call   6b0 <sbrk>
  if(p == (char*)-1)
 a24:	83 c4 10             	add    $0x10,%esp
 a27:	83 f8 ff             	cmp    $0xffffffff,%eax
 a2a:	74 1c                	je     a48 <malloc+0x88>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 a2c:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 a2f:	83 ec 0c             	sub    $0xc,%esp
 a32:	83 c0 08             	add    $0x8,%eax
 a35:	50                   	push   %eax
 a36:	e8 f5 fe ff ff       	call   930 <free>
  return freep;
 a3b:	8b 15 94 0e 00 00    	mov    0xe94,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 a41:	83 c4 10             	add    $0x10,%esp
 a44:	85 d2                	test   %edx,%edx
 a46:	75 c0                	jne    a08 <malloc+0x48>
        return 0;
 a48:	31 c0                	xor    %eax,%eax
 a4a:	eb 1c                	jmp    a68 <malloc+0xa8>
 a4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 a50:	39 cf                	cmp    %ecx,%edi
 a52:	74 1c                	je     a70 <malloc+0xb0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 a54:	29 f9                	sub    %edi,%ecx
 a56:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 a59:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 a5c:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
 a5f:	89 15 94 0e 00 00    	mov    %edx,0xe94
      return (void*)(p + 1);
 a65:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 a68:	8d 65 f4             	lea    -0xc(%ebp),%esp
 a6b:	5b                   	pop    %ebx
 a6c:	5e                   	pop    %esi
 a6d:	5f                   	pop    %edi
 a6e:	5d                   	pop    %ebp
 a6f:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 a70:	8b 08                	mov    (%eax),%ecx
 a72:	89 0a                	mov    %ecx,(%edx)
 a74:	eb e9                	jmp    a5f <malloc+0x9f>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 a76:	c7 05 94 0e 00 00 98 	movl   $0xe98,0xe94
 a7d:	0e 00 00 
 a80:	c7 05 98 0e 00 00 98 	movl   $0xe98,0xe98
 a87:	0e 00 00 
    base.s.size = 0;
 a8a:	b8 98 0e 00 00       	mov    $0xe98,%eax
 a8f:	c7 05 9c 0e 00 00 00 	movl   $0x0,0xe9c
 a96:	00 00 00 
 a99:	e9 4e ff ff ff       	jmp    9ec <malloc+0x2c>