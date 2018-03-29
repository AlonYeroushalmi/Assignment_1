
kernel:     file format elf32-i386


Disassembly of section .text:

80100000 <multiboot_header>:
80100000:	02 b0 ad 1b 00 00    	add    0x1bad(%eax),%dh
80100006:	00 00                	add    %al,(%eax)
80100008:	fe 4f 52             	decb   0x52(%edi)
8010000b:	e4 0f                	in     $0xf,%al

8010000c <entry>:

# Entering xv6 on boot processor, with paging off.
.globl entry
entry:
  # Turn on page size extension for 4Mbyte pages
  movl    %cr4, %eax
8010000c:	0f 20 e0             	mov    %cr4,%eax
  orl     $(CR4_PSE), %eax
8010000f:	83 c8 10             	or     $0x10,%eax
  movl    %eax, %cr4
80100012:	0f 22 e0             	mov    %eax,%cr4
  # Set page directory
  movl    $(V2P_WO(entrypgdir)), %eax
80100015:	b8 00 a0 10 00       	mov    $0x10a000,%eax
  movl    %eax, %cr3
8010001a:	0f 22 d8             	mov    %eax,%cr3
  # Turn on paging.
  movl    %cr0, %eax
8010001d:	0f 20 c0             	mov    %cr0,%eax
  orl     $(CR0_PG|CR0_WP), %eax
80100020:	0d 00 00 01 80       	or     $0x80010000,%eax
  movl    %eax, %cr0
80100025:	0f 22 c0             	mov    %eax,%cr0

  # Set up the stack pointer.
  movl $(stack + KSTACKSIZE), %esp
80100028:	bc d0 c5 10 80       	mov    $0x8010c5d0,%esp

  # Jump to main(), and switch to executing at
  # high addresses. The indirect call is needed because
  # the assembler produces a PC-relative instruction
  # for a direct jump.
  mov $main, %eax
8010002d:	b8 80 2e 10 80       	mov    $0x80102e80,%eax
  jmp *%eax
80100032:	ff e0                	jmp    *%eax
80100034:	66 90                	xchg   %ax,%ax
80100036:	66 90                	xchg   %ax,%ax
80100038:	66 90                	xchg   %ax,%ax
8010003a:	66 90                	xchg   %ax,%ax
8010003c:	66 90                	xchg   %ax,%ax
8010003e:	66 90                	xchg   %ax,%ax

80100040 <binit>:
  struct buf head;
} bcache;

void
binit(void)
{
80100040:	55                   	push   %ebp
80100041:	89 e5                	mov    %esp,%ebp
80100043:	53                   	push   %ebx

//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  bcache.head.next = &bcache.head;
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
80100044:	bb 14 c6 10 80       	mov    $0x8010c614,%ebx
  struct buf head;
} bcache;

void
binit(void)
{
80100049:	83 ec 0c             	sub    $0xc,%esp
  struct buf *b;

  initlock(&bcache.lock, "bcache");
8010004c:	68 20 76 10 80       	push   $0x80107620
80100051:	68 e0 c5 10 80       	push   $0x8010c5e0
80100056:	e8 95 47 00 00       	call   801047f0 <initlock>

//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
8010005b:	c7 05 2c 0d 11 80 dc 	movl   $0x80110cdc,0x80110d2c
80100062:	0c 11 80 
  bcache.head.next = &bcache.head;
80100065:	c7 05 30 0d 11 80 dc 	movl   $0x80110cdc,0x80110d30
8010006c:	0c 11 80 
8010006f:	83 c4 10             	add    $0x10,%esp
80100072:	ba dc 0c 11 80       	mov    $0x80110cdc,%edx
80100077:	eb 09                	jmp    80100082 <binit+0x42>
80100079:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100080:	89 c3                	mov    %eax,%ebx
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    b->next = bcache.head.next;
    b->prev = &bcache.head;
    initsleeplock(&b->lock, "buffer");
80100082:	8d 43 0c             	lea    0xc(%ebx),%eax
80100085:	83 ec 08             	sub    $0x8,%esp
//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  bcache.head.next = &bcache.head;
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    b->next = bcache.head.next;
80100088:	89 53 54             	mov    %edx,0x54(%ebx)
    b->prev = &bcache.head;
8010008b:	c7 43 50 dc 0c 11 80 	movl   $0x80110cdc,0x50(%ebx)
    initsleeplock(&b->lock, "buffer");
80100092:	68 27 76 10 80       	push   $0x80107627
80100097:	50                   	push   %eax
80100098:	e8 43 46 00 00       	call   801046e0 <initsleeplock>
    bcache.head.next->prev = b;
8010009d:	a1 30 0d 11 80       	mov    0x80110d30,%eax

//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  bcache.head.next = &bcache.head;
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
801000a2:	83 c4 10             	add    $0x10,%esp
801000a5:	89 da                	mov    %ebx,%edx
    b->next = bcache.head.next;
    b->prev = &bcache.head;
    initsleeplock(&b->lock, "buffer");
    bcache.head.next->prev = b;
801000a7:	89 58 50             	mov    %ebx,0x50(%eax)

//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  bcache.head.next = &bcache.head;
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
801000aa:	8d 83 5c 02 00 00    	lea    0x25c(%ebx),%eax
    b->next = bcache.head.next;
    b->prev = &bcache.head;
    initsleeplock(&b->lock, "buffer");
    bcache.head.next->prev = b;
    bcache.head.next = b;
801000b0:	89 1d 30 0d 11 80    	mov    %ebx,0x80110d30

//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  bcache.head.next = &bcache.head;
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
801000b6:	3d dc 0c 11 80       	cmp    $0x80110cdc,%eax
801000bb:	72 c3                	jb     80100080 <binit+0x40>
    b->prev = &bcache.head;
    initsleeplock(&b->lock, "buffer");
    bcache.head.next->prev = b;
    bcache.head.next = b;
  }
}
801000bd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801000c0:	c9                   	leave  
801000c1:	c3                   	ret    
801000c2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801000c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801000d0 <bread>:
}

// Return a locked buf with the contents of the indicated block.
struct buf*
bread(uint dev, uint blockno)
{
801000d0:	55                   	push   %ebp
801000d1:	89 e5                	mov    %esp,%ebp
801000d3:	57                   	push   %edi
801000d4:	56                   	push   %esi
801000d5:	53                   	push   %ebx
801000d6:	83 ec 18             	sub    $0x18,%esp
801000d9:	8b 75 08             	mov    0x8(%ebp),%esi
801000dc:	8b 7d 0c             	mov    0xc(%ebp),%edi
static struct buf*
bget(uint dev, uint blockno)
{
  struct buf *b;

  acquire(&bcache.lock);
801000df:	68 e0 c5 10 80       	push   $0x8010c5e0
801000e4:	e8 07 48 00 00       	call   801048f0 <acquire>

  // Is the block already cached?
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
801000e9:	8b 1d 30 0d 11 80    	mov    0x80110d30,%ebx
801000ef:	83 c4 10             	add    $0x10,%esp
801000f2:	81 fb dc 0c 11 80    	cmp    $0x80110cdc,%ebx
801000f8:	75 11                	jne    8010010b <bread+0x3b>
801000fa:	eb 24                	jmp    80100120 <bread+0x50>
801000fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100100:	8b 5b 54             	mov    0x54(%ebx),%ebx
80100103:	81 fb dc 0c 11 80    	cmp    $0x80110cdc,%ebx
80100109:	74 15                	je     80100120 <bread+0x50>
    if(b->dev == dev && b->blockno == blockno){
8010010b:	3b 73 04             	cmp    0x4(%ebx),%esi
8010010e:	75 f0                	jne    80100100 <bread+0x30>
80100110:	3b 7b 08             	cmp    0x8(%ebx),%edi
80100113:	75 eb                	jne    80100100 <bread+0x30>
      b->refcnt++;
80100115:	83 43 4c 01          	addl   $0x1,0x4c(%ebx)
80100119:	eb 3f                	jmp    8010015a <bread+0x8a>
8010011b:	90                   	nop
8010011c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  }

  // Not cached; recycle an unused buffer.
  // Even if refcnt==0, B_DIRTY indicates a buffer is in use
  // because log.c has modified it but not yet committed it.
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
80100120:	8b 1d 2c 0d 11 80    	mov    0x80110d2c,%ebx
80100126:	81 fb dc 0c 11 80    	cmp    $0x80110cdc,%ebx
8010012c:	75 0d                	jne    8010013b <bread+0x6b>
8010012e:	eb 60                	jmp    80100190 <bread+0xc0>
80100130:	8b 5b 50             	mov    0x50(%ebx),%ebx
80100133:	81 fb dc 0c 11 80    	cmp    $0x80110cdc,%ebx
80100139:	74 55                	je     80100190 <bread+0xc0>
    if(b->refcnt == 0 && (b->flags & B_DIRTY) == 0) {
8010013b:	8b 43 4c             	mov    0x4c(%ebx),%eax
8010013e:	85 c0                	test   %eax,%eax
80100140:	75 ee                	jne    80100130 <bread+0x60>
80100142:	f6 03 04             	testb  $0x4,(%ebx)
80100145:	75 e9                	jne    80100130 <bread+0x60>
      b->dev = dev;
80100147:	89 73 04             	mov    %esi,0x4(%ebx)
      b->blockno = blockno;
8010014a:	89 7b 08             	mov    %edi,0x8(%ebx)
      b->flags = 0;
8010014d:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
      b->refcnt = 1;
80100153:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
      release(&bcache.lock);
8010015a:	83 ec 0c             	sub    $0xc,%esp
8010015d:	68 e0 c5 10 80       	push   $0x8010c5e0
80100162:	e8 a9 48 00 00       	call   80104a10 <release>
      acquiresleep(&b->lock);
80100167:	8d 43 0c             	lea    0xc(%ebx),%eax
8010016a:	89 04 24             	mov    %eax,(%esp)
8010016d:	e8 ae 45 00 00       	call   80104720 <acquiresleep>
80100172:	83 c4 10             	add    $0x10,%esp
bread(uint dev, uint blockno)
{
  struct buf *b;

  b = bget(dev, blockno);
  if((b->flags & B_VALID) == 0) {
80100175:	f6 03 02             	testb  $0x2,(%ebx)
80100178:	75 0c                	jne    80100186 <bread+0xb6>
    iderw(b);
8010017a:	83 ec 0c             	sub    $0xc,%esp
8010017d:	53                   	push   %ebx
8010017e:	e8 6d 1f 00 00       	call   801020f0 <iderw>
80100183:	83 c4 10             	add    $0x10,%esp
  }
  return b;
}
80100186:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100189:	89 d8                	mov    %ebx,%eax
8010018b:	5b                   	pop    %ebx
8010018c:	5e                   	pop    %esi
8010018d:	5f                   	pop    %edi
8010018e:	5d                   	pop    %ebp
8010018f:	c3                   	ret    
      release(&bcache.lock);
      acquiresleep(&b->lock);
      return b;
    }
  }
  panic("bget: no buffers");
80100190:	83 ec 0c             	sub    $0xc,%esp
80100193:	68 2e 76 10 80       	push   $0x8010762e
80100198:	e8 d3 01 00 00       	call   80100370 <panic>
8010019d:	8d 76 00             	lea    0x0(%esi),%esi

801001a0 <bwrite>:
}

// Write b's contents to disk.  Must be locked.
void
bwrite(struct buf *b)
{
801001a0:	55                   	push   %ebp
801001a1:	89 e5                	mov    %esp,%ebp
801001a3:	53                   	push   %ebx
801001a4:	83 ec 10             	sub    $0x10,%esp
801001a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(!holdingsleep(&b->lock))
801001aa:	8d 43 0c             	lea    0xc(%ebx),%eax
801001ad:	50                   	push   %eax
801001ae:	e8 0d 46 00 00       	call   801047c0 <holdingsleep>
801001b3:	83 c4 10             	add    $0x10,%esp
801001b6:	85 c0                	test   %eax,%eax
801001b8:	74 0f                	je     801001c9 <bwrite+0x29>
    panic("bwrite");
  b->flags |= B_DIRTY;
801001ba:	83 0b 04             	orl    $0x4,(%ebx)
  iderw(b);
801001bd:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
801001c0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801001c3:	c9                   	leave  
bwrite(struct buf *b)
{
  if(!holdingsleep(&b->lock))
    panic("bwrite");
  b->flags |= B_DIRTY;
  iderw(b);
801001c4:	e9 27 1f 00 00       	jmp    801020f0 <iderw>
// Write b's contents to disk.  Must be locked.
void
bwrite(struct buf *b)
{
  if(!holdingsleep(&b->lock))
    panic("bwrite");
801001c9:	83 ec 0c             	sub    $0xc,%esp
801001cc:	68 3f 76 10 80       	push   $0x8010763f
801001d1:	e8 9a 01 00 00       	call   80100370 <panic>
801001d6:	8d 76 00             	lea    0x0(%esi),%esi
801001d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801001e0 <brelse>:

// Release a locked buffer.
// Move to the head of the MRU list.
void
brelse(struct buf *b)
{
801001e0:	55                   	push   %ebp
801001e1:	89 e5                	mov    %esp,%ebp
801001e3:	56                   	push   %esi
801001e4:	53                   	push   %ebx
801001e5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(!holdingsleep(&b->lock))
801001e8:	83 ec 0c             	sub    $0xc,%esp
801001eb:	8d 73 0c             	lea    0xc(%ebx),%esi
801001ee:	56                   	push   %esi
801001ef:	e8 cc 45 00 00       	call   801047c0 <holdingsleep>
801001f4:	83 c4 10             	add    $0x10,%esp
801001f7:	85 c0                	test   %eax,%eax
801001f9:	74 66                	je     80100261 <brelse+0x81>
    panic("brelse");

  releasesleep(&b->lock);
801001fb:	83 ec 0c             	sub    $0xc,%esp
801001fe:	56                   	push   %esi
801001ff:	e8 7c 45 00 00       	call   80104780 <releasesleep>

  acquire(&bcache.lock);
80100204:	c7 04 24 e0 c5 10 80 	movl   $0x8010c5e0,(%esp)
8010020b:	e8 e0 46 00 00       	call   801048f0 <acquire>
  b->refcnt--;
80100210:	8b 43 4c             	mov    0x4c(%ebx),%eax
  if (b->refcnt == 0) {
80100213:	83 c4 10             	add    $0x10,%esp
    panic("brelse");

  releasesleep(&b->lock);

  acquire(&bcache.lock);
  b->refcnt--;
80100216:	83 e8 01             	sub    $0x1,%eax
  if (b->refcnt == 0) {
80100219:	85 c0                	test   %eax,%eax
    panic("brelse");

  releasesleep(&b->lock);

  acquire(&bcache.lock);
  b->refcnt--;
8010021b:	89 43 4c             	mov    %eax,0x4c(%ebx)
  if (b->refcnt == 0) {
8010021e:	75 2f                	jne    8010024f <brelse+0x6f>
    // no one is waiting for it.
    b->next->prev = b->prev;
80100220:	8b 43 54             	mov    0x54(%ebx),%eax
80100223:	8b 53 50             	mov    0x50(%ebx),%edx
80100226:	89 50 50             	mov    %edx,0x50(%eax)
    b->prev->next = b->next;
80100229:	8b 43 50             	mov    0x50(%ebx),%eax
8010022c:	8b 53 54             	mov    0x54(%ebx),%edx
8010022f:	89 50 54             	mov    %edx,0x54(%eax)
    b->next = bcache.head.next;
80100232:	a1 30 0d 11 80       	mov    0x80110d30,%eax
    b->prev = &bcache.head;
80100237:	c7 43 50 dc 0c 11 80 	movl   $0x80110cdc,0x50(%ebx)
  b->refcnt--;
  if (b->refcnt == 0) {
    // no one is waiting for it.
    b->next->prev = b->prev;
    b->prev->next = b->next;
    b->next = bcache.head.next;
8010023e:	89 43 54             	mov    %eax,0x54(%ebx)
    b->prev = &bcache.head;
    bcache.head.next->prev = b;
80100241:	a1 30 0d 11 80       	mov    0x80110d30,%eax
80100246:	89 58 50             	mov    %ebx,0x50(%eax)
    bcache.head.next = b;
80100249:	89 1d 30 0d 11 80    	mov    %ebx,0x80110d30
  }
  
  release(&bcache.lock);
8010024f:	c7 45 08 e0 c5 10 80 	movl   $0x8010c5e0,0x8(%ebp)
}
80100256:	8d 65 f8             	lea    -0x8(%ebp),%esp
80100259:	5b                   	pop    %ebx
8010025a:	5e                   	pop    %esi
8010025b:	5d                   	pop    %ebp
    b->prev = &bcache.head;
    bcache.head.next->prev = b;
    bcache.head.next = b;
  }
  
  release(&bcache.lock);
8010025c:	e9 af 47 00 00       	jmp    80104a10 <release>
// Move to the head of the MRU list.
void
brelse(struct buf *b)
{
  if(!holdingsleep(&b->lock))
    panic("brelse");
80100261:	83 ec 0c             	sub    $0xc,%esp
80100264:	68 46 76 10 80       	push   $0x80107646
80100269:	e8 02 01 00 00       	call   80100370 <panic>
8010026e:	66 90                	xchg   %ax,%ax

80100270 <consoleread>:
  }
}

int
consoleread(struct inode *ip, char *dst, int n)
{
80100270:	55                   	push   %ebp
80100271:	89 e5                	mov    %esp,%ebp
80100273:	57                   	push   %edi
80100274:	56                   	push   %esi
80100275:	53                   	push   %ebx
80100276:	83 ec 28             	sub    $0x28,%esp
80100279:	8b 7d 08             	mov    0x8(%ebp),%edi
8010027c:	8b 75 0c             	mov    0xc(%ebp),%esi
  uint target;
  int c;

  iunlock(ip);
8010027f:	57                   	push   %edi
80100280:	e8 cb 14 00 00       	call   80101750 <iunlock>
  target = n;
  acquire(&cons.lock);
80100285:	c7 04 24 20 b5 10 80 	movl   $0x8010b520,(%esp)
8010028c:	e8 5f 46 00 00       	call   801048f0 <acquire>
  while(n > 0){
80100291:	8b 5d 10             	mov    0x10(%ebp),%ebx
80100294:	83 c4 10             	add    $0x10,%esp
80100297:	31 c0                	xor    %eax,%eax
80100299:	85 db                	test   %ebx,%ebx
8010029b:	0f 8e 9a 00 00 00    	jle    8010033b <consoleread+0xcb>
    while(input.r == input.w){
801002a1:	a1 c0 0f 11 80       	mov    0x80110fc0,%eax
801002a6:	3b 05 c4 0f 11 80    	cmp    0x80110fc4,%eax
801002ac:	74 24                	je     801002d2 <consoleread+0x62>
801002ae:	eb 58                	jmp    80100308 <consoleread+0x98>
      if(myproc()->killed){
        release(&cons.lock);
        ilock(ip);
        return -1;
      }
      sleep(&input.r, &cons.lock);
801002b0:	83 ec 08             	sub    $0x8,%esp
801002b3:	68 20 b5 10 80       	push   $0x8010b520
801002b8:	68 c0 0f 11 80       	push   $0x80110fc0
801002bd:	e8 fe 3b 00 00       	call   80103ec0 <sleep>

  iunlock(ip);
  target = n;
  acquire(&cons.lock);
  while(n > 0){
    while(input.r == input.w){
801002c2:	a1 c0 0f 11 80       	mov    0x80110fc0,%eax
801002c7:	83 c4 10             	add    $0x10,%esp
801002ca:	3b 05 c4 0f 11 80    	cmp    0x80110fc4,%eax
801002d0:	75 36                	jne    80100308 <consoleread+0x98>
      if(myproc()->killed){
801002d2:	e8 e9 35 00 00       	call   801038c0 <myproc>
801002d7:	8b 40 24             	mov    0x24(%eax),%eax
801002da:	85 c0                	test   %eax,%eax
801002dc:	74 d2                	je     801002b0 <consoleread+0x40>
        release(&cons.lock);
801002de:	83 ec 0c             	sub    $0xc,%esp
801002e1:	68 20 b5 10 80       	push   $0x8010b520
801002e6:	e8 25 47 00 00       	call   80104a10 <release>
        ilock(ip);
801002eb:	89 3c 24             	mov    %edi,(%esp)
801002ee:	e8 7d 13 00 00       	call   80101670 <ilock>
        return -1;
801002f3:	83 c4 10             	add    $0x10,%esp
801002f6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  release(&cons.lock);
  ilock(ip);

  return target - n;
}
801002fb:	8d 65 f4             	lea    -0xc(%ebp),%esp
801002fe:	5b                   	pop    %ebx
801002ff:	5e                   	pop    %esi
80100300:	5f                   	pop    %edi
80100301:	5d                   	pop    %ebp
80100302:	c3                   	ret    
80100303:	90                   	nop
80100304:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        ilock(ip);
        return -1;
      }
      sleep(&input.r, &cons.lock);
    }
    c = input.buf[input.r++ % INPUT_BUF];
80100308:	8d 50 01             	lea    0x1(%eax),%edx
8010030b:	89 15 c0 0f 11 80    	mov    %edx,0x80110fc0
80100311:	89 c2                	mov    %eax,%edx
80100313:	83 e2 7f             	and    $0x7f,%edx
80100316:	0f be 92 40 0f 11 80 	movsbl -0x7feef0c0(%edx),%edx
    if(c == C('D')){  // EOF
8010031d:	83 fa 04             	cmp    $0x4,%edx
80100320:	74 39                	je     8010035b <consoleread+0xeb>
        // caller gets a 0-byte result.
        input.r--;
      }
      break;
    }
    *dst++ = c;
80100322:	83 c6 01             	add    $0x1,%esi
    --n;
80100325:	83 eb 01             	sub    $0x1,%ebx
    if(c == '\n')
80100328:	83 fa 0a             	cmp    $0xa,%edx
        // caller gets a 0-byte result.
        input.r--;
      }
      break;
    }
    *dst++ = c;
8010032b:	88 56 ff             	mov    %dl,-0x1(%esi)
    --n;
    if(c == '\n')
8010032e:	74 35                	je     80100365 <consoleread+0xf5>
  int c;

  iunlock(ip);
  target = n;
  acquire(&cons.lock);
  while(n > 0){
80100330:	85 db                	test   %ebx,%ebx
80100332:	0f 85 69 ff ff ff    	jne    801002a1 <consoleread+0x31>
80100338:	8b 45 10             	mov    0x10(%ebp),%eax
    *dst++ = c;
    --n;
    if(c == '\n')
      break;
  }
  release(&cons.lock);
8010033b:	83 ec 0c             	sub    $0xc,%esp
8010033e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100341:	68 20 b5 10 80       	push   $0x8010b520
80100346:	e8 c5 46 00 00       	call   80104a10 <release>
  ilock(ip);
8010034b:	89 3c 24             	mov    %edi,(%esp)
8010034e:	e8 1d 13 00 00       	call   80101670 <ilock>

  return target - n;
80100353:	83 c4 10             	add    $0x10,%esp
80100356:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100359:	eb a0                	jmp    801002fb <consoleread+0x8b>
      }
      sleep(&input.r, &cons.lock);
    }
    c = input.buf[input.r++ % INPUT_BUF];
    if(c == C('D')){  // EOF
      if(n < target){
8010035b:	39 5d 10             	cmp    %ebx,0x10(%ebp)
8010035e:	76 05                	jbe    80100365 <consoleread+0xf5>
        // Save ^D for next time, to make sure
        // caller gets a 0-byte result.
        input.r--;
80100360:	a3 c0 0f 11 80       	mov    %eax,0x80110fc0
80100365:	8b 45 10             	mov    0x10(%ebp),%eax
80100368:	29 d8                	sub    %ebx,%eax
8010036a:	eb cf                	jmp    8010033b <consoleread+0xcb>
8010036c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100370 <panic>:
    release(&cons.lock);
}

void
panic(char *s)
{
80100370:	55                   	push   %ebp
80100371:	89 e5                	mov    %esp,%ebp
80100373:	56                   	push   %esi
80100374:	53                   	push   %ebx
80100375:	83 ec 30             	sub    $0x30,%esp
}

static inline void
cli(void)
{
  asm volatile("cli");
80100378:	fa                   	cli    
  int i;
  uint pcs[10];

  cli();
  cons.locking = 0;
80100379:	c7 05 54 b5 10 80 00 	movl   $0x0,0x8010b554
80100380:	00 00 00 
  // use lapiccpunum so that we can call panic from mycpu()
  cprintf("lapicid %d: panic: ", lapicid());
  cprintf(s);
  cprintf("\n");
  getcallerpcs(&s, pcs);
80100383:	8d 5d d0             	lea    -0x30(%ebp),%ebx
80100386:	8d 75 f8             	lea    -0x8(%ebp),%esi
  uint pcs[10];

  cli();
  cons.locking = 0;
  // use lapiccpunum so that we can call panic from mycpu()
  cprintf("lapicid %d: panic: ", lapicid());
80100389:	e8 72 23 00 00       	call   80102700 <lapicid>
8010038e:	83 ec 08             	sub    $0x8,%esp
80100391:	50                   	push   %eax
80100392:	68 4d 76 10 80       	push   $0x8010764d
80100397:	e8 c4 02 00 00       	call   80100660 <cprintf>
  cprintf(s);
8010039c:	58                   	pop    %eax
8010039d:	ff 75 08             	pushl  0x8(%ebp)
801003a0:	e8 bb 02 00 00       	call   80100660 <cprintf>
  cprintf("\n");
801003a5:	c7 04 24 ab 7f 10 80 	movl   $0x80107fab,(%esp)
801003ac:	e8 af 02 00 00       	call   80100660 <cprintf>
  getcallerpcs(&s, pcs);
801003b1:	5a                   	pop    %edx
801003b2:	8d 45 08             	lea    0x8(%ebp),%eax
801003b5:	59                   	pop    %ecx
801003b6:	53                   	push   %ebx
801003b7:	50                   	push   %eax
801003b8:	e8 53 44 00 00       	call   80104810 <getcallerpcs>
801003bd:	83 c4 10             	add    $0x10,%esp
  for(i=0; i<10; i++)
    cprintf(" %p", pcs[i]);
801003c0:	83 ec 08             	sub    $0x8,%esp
801003c3:	ff 33                	pushl  (%ebx)
801003c5:	83 c3 04             	add    $0x4,%ebx
801003c8:	68 61 76 10 80       	push   $0x80107661
801003cd:	e8 8e 02 00 00       	call   80100660 <cprintf>
  // use lapiccpunum so that we can call panic from mycpu()
  cprintf("lapicid %d: panic: ", lapicid());
  cprintf(s);
  cprintf("\n");
  getcallerpcs(&s, pcs);
  for(i=0; i<10; i++)
801003d2:	83 c4 10             	add    $0x10,%esp
801003d5:	39 f3                	cmp    %esi,%ebx
801003d7:	75 e7                	jne    801003c0 <panic+0x50>
    cprintf(" %p", pcs[i]);
  panicked = 1; // freeze other CPU
801003d9:	c7 05 58 b5 10 80 01 	movl   $0x1,0x8010b558
801003e0:	00 00 00 
801003e3:	eb fe                	jmp    801003e3 <panic+0x73>
801003e5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801003e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801003f0 <consputc>:
}

void
consputc(int c)
{
  if(panicked){
801003f0:	8b 15 58 b5 10 80    	mov    0x8010b558,%edx
801003f6:	85 d2                	test   %edx,%edx
801003f8:	74 06                	je     80100400 <consputc+0x10>
801003fa:	fa                   	cli    
801003fb:	eb fe                	jmp    801003fb <consputc+0xb>
801003fd:	8d 76 00             	lea    0x0(%esi),%esi
  crt[pos] = ' ' | 0x0700;
}

void
consputc(int c)
{
80100400:	55                   	push   %ebp
80100401:	89 e5                	mov    %esp,%ebp
80100403:	57                   	push   %edi
80100404:	56                   	push   %esi
80100405:	53                   	push   %ebx
80100406:	89 c3                	mov    %eax,%ebx
80100408:	83 ec 0c             	sub    $0xc,%esp
    cli();
    for(;;)
      ;
  }

  if(c == BACKSPACE){
8010040b:	3d 00 01 00 00       	cmp    $0x100,%eax
80100410:	0f 84 b8 00 00 00    	je     801004ce <consputc+0xde>
    uartputc('\b'); uartputc(' '); uartputc('\b');
  } else
    uartputc(c);
80100416:	83 ec 0c             	sub    $0xc,%esp
80100419:	50                   	push   %eax
8010041a:	e8 e1 5d 00 00       	call   80106200 <uartputc>
8010041f:	83 c4 10             	add    $0x10,%esp
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80100422:	bf d4 03 00 00       	mov    $0x3d4,%edi
80100427:	b8 0e 00 00 00       	mov    $0xe,%eax
8010042c:	89 fa                	mov    %edi,%edx
8010042e:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010042f:	b9 d5 03 00 00       	mov    $0x3d5,%ecx
80100434:	89 ca                	mov    %ecx,%edx
80100436:	ec                   	in     (%dx),%al
{
  int pos;

  // Cursor position: col + 80*row.
  outb(CRTPORT, 14);
  pos = inb(CRTPORT+1) << 8;
80100437:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010043a:	89 fa                	mov    %edi,%edx
8010043c:	c1 e0 08             	shl    $0x8,%eax
8010043f:	89 c6                	mov    %eax,%esi
80100441:	b8 0f 00 00 00       	mov    $0xf,%eax
80100446:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80100447:	89 ca                	mov    %ecx,%edx
80100449:	ec                   	in     (%dx),%al
  outb(CRTPORT, 15);
  pos |= inb(CRTPORT+1);
8010044a:	0f b6 c0             	movzbl %al,%eax
8010044d:	09 f0                	or     %esi,%eax

  if(c == '\n')
8010044f:	83 fb 0a             	cmp    $0xa,%ebx
80100452:	0f 84 0b 01 00 00    	je     80100563 <consputc+0x173>
    pos += 80 - pos%80;
  else if(c == BACKSPACE){
80100458:	81 fb 00 01 00 00    	cmp    $0x100,%ebx
8010045e:	0f 84 e6 00 00 00    	je     8010054a <consputc+0x15a>
    if(pos > 0) --pos;
  } else
    crt[pos++] = (c&0xff) | 0x0700;  // black on white
80100464:	0f b6 d3             	movzbl %bl,%edx
80100467:	8d 78 01             	lea    0x1(%eax),%edi
8010046a:	80 ce 07             	or     $0x7,%dh
8010046d:	66 89 94 00 00 80 0b 	mov    %dx,-0x7ff48000(%eax,%eax,1)
80100474:	80 

  if(pos < 0 || pos > 25*80)
80100475:	81 ff d0 07 00 00    	cmp    $0x7d0,%edi
8010047b:	0f 8f bc 00 00 00    	jg     8010053d <consputc+0x14d>
    panic("pos under/overflow");

  if((pos/80) >= 24){  // Scroll up.
80100481:	81 ff 7f 07 00 00    	cmp    $0x77f,%edi
80100487:	7f 6f                	jg     801004f8 <consputc+0x108>
80100489:	89 f8                	mov    %edi,%eax
8010048b:	8d 9c 3f 00 80 0b 80 	lea    -0x7ff48000(%edi,%edi,1),%ebx
80100492:	89 f9                	mov    %edi,%ecx
80100494:	c1 e8 08             	shr    $0x8,%eax
80100497:	89 c6                	mov    %eax,%esi
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80100499:	bf d4 03 00 00       	mov    $0x3d4,%edi
8010049e:	b8 0e 00 00 00       	mov    $0xe,%eax
801004a3:	89 fa                	mov    %edi,%edx
801004a5:	ee                   	out    %al,(%dx)
801004a6:	ba d5 03 00 00       	mov    $0x3d5,%edx
801004ab:	89 f0                	mov    %esi,%eax
801004ad:	ee                   	out    %al,(%dx)
801004ae:	b8 0f 00 00 00       	mov    $0xf,%eax
801004b3:	89 fa                	mov    %edi,%edx
801004b5:	ee                   	out    %al,(%dx)
801004b6:	ba d5 03 00 00       	mov    $0x3d5,%edx
801004bb:	89 c8                	mov    %ecx,%eax
801004bd:	ee                   	out    %al,(%dx)

  outb(CRTPORT, 14);
  outb(CRTPORT+1, pos>>8);
  outb(CRTPORT, 15);
  outb(CRTPORT+1, pos);
  crt[pos] = ' ' | 0x0700;
801004be:	b8 20 07 00 00       	mov    $0x720,%eax
801004c3:	66 89 03             	mov    %ax,(%ebx)
  if(c == BACKSPACE){
    uartputc('\b'); uartputc(' '); uartputc('\b');
  } else
    uartputc(c);
  cgaputc(c);
}
801004c6:	8d 65 f4             	lea    -0xc(%ebp),%esp
801004c9:	5b                   	pop    %ebx
801004ca:	5e                   	pop    %esi
801004cb:	5f                   	pop    %edi
801004cc:	5d                   	pop    %ebp
801004cd:	c3                   	ret    
    for(;;)
      ;
  }

  if(c == BACKSPACE){
    uartputc('\b'); uartputc(' '); uartputc('\b');
801004ce:	83 ec 0c             	sub    $0xc,%esp
801004d1:	6a 08                	push   $0x8
801004d3:	e8 28 5d 00 00       	call   80106200 <uartputc>
801004d8:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
801004df:	e8 1c 5d 00 00       	call   80106200 <uartputc>
801004e4:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
801004eb:	e8 10 5d 00 00       	call   80106200 <uartputc>
801004f0:	83 c4 10             	add    $0x10,%esp
801004f3:	e9 2a ff ff ff       	jmp    80100422 <consputc+0x32>

  if(pos < 0 || pos > 25*80)
    panic("pos under/overflow");

  if((pos/80) >= 24){  // Scroll up.
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
801004f8:	83 ec 04             	sub    $0x4,%esp
    pos -= 80;
801004fb:	83 ef 50             	sub    $0x50,%edi
    memset(crt+pos, 0, sizeof(crt[0])*(24*80 - pos));
801004fe:	be 07 00 00 00       	mov    $0x7,%esi

  if(pos < 0 || pos > 25*80)
    panic("pos under/overflow");

  if((pos/80) >= 24){  // Scroll up.
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
80100503:	68 60 0e 00 00       	push   $0xe60
80100508:	68 a0 80 0b 80       	push   $0x800b80a0
    pos -= 80;
    memset(crt+pos, 0, sizeof(crt[0])*(24*80 - pos));
8010050d:	8d 9c 3f 00 80 0b 80 	lea    -0x7ff48000(%edi,%edi,1),%ebx

  if(pos < 0 || pos > 25*80)
    panic("pos under/overflow");

  if((pos/80) >= 24){  // Scroll up.
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
80100514:	68 00 80 0b 80       	push   $0x800b8000
80100519:	e8 f2 45 00 00       	call   80104b10 <memmove>
    pos -= 80;
    memset(crt+pos, 0, sizeof(crt[0])*(24*80 - pos));
8010051e:	b8 80 07 00 00       	mov    $0x780,%eax
80100523:	83 c4 0c             	add    $0xc,%esp
80100526:	29 f8                	sub    %edi,%eax
80100528:	01 c0                	add    %eax,%eax
8010052a:	50                   	push   %eax
8010052b:	6a 00                	push   $0x0
8010052d:	53                   	push   %ebx
8010052e:	e8 2d 45 00 00       	call   80104a60 <memset>
80100533:	89 f9                	mov    %edi,%ecx
80100535:	83 c4 10             	add    $0x10,%esp
80100538:	e9 5c ff ff ff       	jmp    80100499 <consputc+0xa9>
    if(pos > 0) --pos;
  } else
    crt[pos++] = (c&0xff) | 0x0700;  // black on white

  if(pos < 0 || pos > 25*80)
    panic("pos under/overflow");
8010053d:	83 ec 0c             	sub    $0xc,%esp
80100540:	68 65 76 10 80       	push   $0x80107665
80100545:	e8 26 fe ff ff       	call   80100370 <panic>
  pos |= inb(CRTPORT+1);

  if(c == '\n')
    pos += 80 - pos%80;
  else if(c == BACKSPACE){
    if(pos > 0) --pos;
8010054a:	85 c0                	test   %eax,%eax
8010054c:	8d 78 ff             	lea    -0x1(%eax),%edi
8010054f:	0f 85 20 ff ff ff    	jne    80100475 <consputc+0x85>
80100555:	bb 00 80 0b 80       	mov    $0x800b8000,%ebx
8010055a:	31 c9                	xor    %ecx,%ecx
8010055c:	31 f6                	xor    %esi,%esi
8010055e:	e9 36 ff ff ff       	jmp    80100499 <consputc+0xa9>
  pos = inb(CRTPORT+1) << 8;
  outb(CRTPORT, 15);
  pos |= inb(CRTPORT+1);

  if(c == '\n')
    pos += 80 - pos%80;
80100563:	ba 67 66 66 66       	mov    $0x66666667,%edx
80100568:	f7 ea                	imul   %edx
8010056a:	89 d0                	mov    %edx,%eax
8010056c:	c1 e8 05             	shr    $0x5,%eax
8010056f:	8d 04 80             	lea    (%eax,%eax,4),%eax
80100572:	c1 e0 04             	shl    $0x4,%eax
80100575:	8d 78 50             	lea    0x50(%eax),%edi
80100578:	e9 f8 fe ff ff       	jmp    80100475 <consputc+0x85>
8010057d:	8d 76 00             	lea    0x0(%esi),%esi

80100580 <printint>:
  int locking;
} cons;

static void
printint(int xx, int base, int sign)
{
80100580:	55                   	push   %ebp
80100581:	89 e5                	mov    %esp,%ebp
80100583:	57                   	push   %edi
80100584:	56                   	push   %esi
80100585:	53                   	push   %ebx
80100586:	89 d6                	mov    %edx,%esi
80100588:	83 ec 1c             	sub    $0x1c,%esp
  static char digits[] = "0123456789abcdef";
  char buf[16];
  int i;
  uint x;

  if(sign && (sign = xx < 0))
8010058b:	85 c9                	test   %ecx,%ecx
8010058d:	74 04                	je     80100593 <printint+0x13>
8010058f:	85 c0                	test   %eax,%eax
80100591:	78 57                	js     801005ea <printint+0x6a>
    x = -xx;
  else
    x = xx;
80100593:	31 ff                	xor    %edi,%edi

  i = 0;
80100595:	31 c9                	xor    %ecx,%ecx
80100597:	eb 09                	jmp    801005a2 <printint+0x22>
80100599:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
801005a0:	89 d9                	mov    %ebx,%ecx
801005a2:	31 d2                	xor    %edx,%edx
801005a4:	8d 59 01             	lea    0x1(%ecx),%ebx
801005a7:	f7 f6                	div    %esi
801005a9:	0f b6 92 90 76 10 80 	movzbl -0x7fef8970(%edx),%edx
  }while((x /= base) != 0);
801005b0:	85 c0                	test   %eax,%eax
  else
    x = xx;

  i = 0;
  do{
    buf[i++] = digits[x % base];
801005b2:	88 54 1d d7          	mov    %dl,-0x29(%ebp,%ebx,1)
  }while((x /= base) != 0);
801005b6:	75 e8                	jne    801005a0 <printint+0x20>

  if(sign)
801005b8:	85 ff                	test   %edi,%edi
801005ba:	74 08                	je     801005c4 <printint+0x44>
    buf[i++] = '-';
801005bc:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
801005c1:	8d 59 02             	lea    0x2(%ecx),%ebx

  while(--i >= 0)
801005c4:	83 eb 01             	sub    $0x1,%ebx
801005c7:	89 f6                	mov    %esi,%esi
801005c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    consputc(buf[i]);
801005d0:	0f be 44 1d d8       	movsbl -0x28(%ebp,%ebx,1),%eax
  }while((x /= base) != 0);

  if(sign)
    buf[i++] = '-';

  while(--i >= 0)
801005d5:	83 eb 01             	sub    $0x1,%ebx
    consputc(buf[i]);
801005d8:	e8 13 fe ff ff       	call   801003f0 <consputc>
  }while((x /= base) != 0);

  if(sign)
    buf[i++] = '-';

  while(--i >= 0)
801005dd:	83 fb ff             	cmp    $0xffffffff,%ebx
801005e0:	75 ee                	jne    801005d0 <printint+0x50>
    consputc(buf[i]);
}
801005e2:	83 c4 1c             	add    $0x1c,%esp
801005e5:	5b                   	pop    %ebx
801005e6:	5e                   	pop    %esi
801005e7:	5f                   	pop    %edi
801005e8:	5d                   	pop    %ebp
801005e9:	c3                   	ret    
  char buf[16];
  int i;
  uint x;

  if(sign && (sign = xx < 0))
    x = -xx;
801005ea:	f7 d8                	neg    %eax
  static char digits[] = "0123456789abcdef";
  char buf[16];
  int i;
  uint x;

  if(sign && (sign = xx < 0))
801005ec:	bf 01 00 00 00       	mov    $0x1,%edi
    x = -xx;
801005f1:	eb a2                	jmp    80100595 <printint+0x15>
801005f3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801005f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100600 <consolewrite>:
  return target - n;
}

int
consolewrite(struct inode *ip, char *buf, int n)
{
80100600:	55                   	push   %ebp
80100601:	89 e5                	mov    %esp,%ebp
80100603:	57                   	push   %edi
80100604:	56                   	push   %esi
80100605:	53                   	push   %ebx
80100606:	83 ec 18             	sub    $0x18,%esp
  int i;

  iunlock(ip);
80100609:	ff 75 08             	pushl  0x8(%ebp)
  return target - n;
}

int
consolewrite(struct inode *ip, char *buf, int n)
{
8010060c:	8b 75 10             	mov    0x10(%ebp),%esi
  int i;

  iunlock(ip);
8010060f:	e8 3c 11 00 00       	call   80101750 <iunlock>
  acquire(&cons.lock);
80100614:	c7 04 24 20 b5 10 80 	movl   $0x8010b520,(%esp)
8010061b:	e8 d0 42 00 00       	call   801048f0 <acquire>
80100620:	8b 7d 0c             	mov    0xc(%ebp),%edi
  for(i = 0; i < n; i++)
80100623:	83 c4 10             	add    $0x10,%esp
80100626:	85 f6                	test   %esi,%esi
80100628:	8d 1c 37             	lea    (%edi,%esi,1),%ebx
8010062b:	7e 12                	jle    8010063f <consolewrite+0x3f>
8010062d:	8d 76 00             	lea    0x0(%esi),%esi
    consputc(buf[i] & 0xff);
80100630:	0f b6 07             	movzbl (%edi),%eax
80100633:	83 c7 01             	add    $0x1,%edi
80100636:	e8 b5 fd ff ff       	call   801003f0 <consputc>
{
  int i;

  iunlock(ip);
  acquire(&cons.lock);
  for(i = 0; i < n; i++)
8010063b:	39 fb                	cmp    %edi,%ebx
8010063d:	75 f1                	jne    80100630 <consolewrite+0x30>
    consputc(buf[i] & 0xff);
  release(&cons.lock);
8010063f:	83 ec 0c             	sub    $0xc,%esp
80100642:	68 20 b5 10 80       	push   $0x8010b520
80100647:	e8 c4 43 00 00       	call   80104a10 <release>
  ilock(ip);
8010064c:	58                   	pop    %eax
8010064d:	ff 75 08             	pushl  0x8(%ebp)
80100650:	e8 1b 10 00 00       	call   80101670 <ilock>

  return n;
}
80100655:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100658:	89 f0                	mov    %esi,%eax
8010065a:	5b                   	pop    %ebx
8010065b:	5e                   	pop    %esi
8010065c:	5f                   	pop    %edi
8010065d:	5d                   	pop    %ebp
8010065e:	c3                   	ret    
8010065f:	90                   	nop

80100660 <cprintf>:
//PAGEBREAK: 50

// Print to the console. only understands %d, %x, %p, %s.
void
cprintf(char *fmt, ...)
{
80100660:	55                   	push   %ebp
80100661:	89 e5                	mov    %esp,%ebp
80100663:	57                   	push   %edi
80100664:	56                   	push   %esi
80100665:	53                   	push   %ebx
80100666:	83 ec 1c             	sub    $0x1c,%esp
  int i, c, locking;
  uint *argp;
  char *s;

  locking = cons.locking;
80100669:	a1 54 b5 10 80       	mov    0x8010b554,%eax
  if(locking)
8010066e:	85 c0                	test   %eax,%eax
{
  int i, c, locking;
  uint *argp;
  char *s;

  locking = cons.locking;
80100670:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(locking)
80100673:	0f 85 27 01 00 00    	jne    801007a0 <cprintf+0x140>
    acquire(&cons.lock);

  if (fmt == 0)
80100679:	8b 75 08             	mov    0x8(%ebp),%esi
8010067c:	85 f6                	test   %esi,%esi
8010067e:	0f 84 40 01 00 00    	je     801007c4 <cprintf+0x164>
    panic("null fmt");

  argp = (uint*)(void*)(&fmt + 1);
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
80100684:	0f b6 06             	movzbl (%esi),%eax
80100687:	31 db                	xor    %ebx,%ebx
80100689:	8d 7d 0c             	lea    0xc(%ebp),%edi
8010068c:	85 c0                	test   %eax,%eax
8010068e:	75 51                	jne    801006e1 <cprintf+0x81>
80100690:	eb 64                	jmp    801006f6 <cprintf+0x96>
80100692:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(c != '%'){
      consputc(c);
      continue;
    }
    c = fmt[++i] & 0xff;
80100698:	83 c3 01             	add    $0x1,%ebx
8010069b:	0f b6 14 1e          	movzbl (%esi,%ebx,1),%edx
    if(c == 0)
8010069f:	85 d2                	test   %edx,%edx
801006a1:	74 53                	je     801006f6 <cprintf+0x96>
      break;
    switch(c){
801006a3:	83 fa 70             	cmp    $0x70,%edx
801006a6:	74 7a                	je     80100722 <cprintf+0xc2>
801006a8:	7f 6e                	jg     80100718 <cprintf+0xb8>
801006aa:	83 fa 25             	cmp    $0x25,%edx
801006ad:	0f 84 ad 00 00 00    	je     80100760 <cprintf+0x100>
801006b3:	83 fa 64             	cmp    $0x64,%edx
801006b6:	0f 85 84 00 00 00    	jne    80100740 <cprintf+0xe0>
    case 'd':
      printint(*argp++, 10, 1);
801006bc:	8d 47 04             	lea    0x4(%edi),%eax
801006bf:	b9 01 00 00 00       	mov    $0x1,%ecx
801006c4:	ba 0a 00 00 00       	mov    $0xa,%edx
801006c9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801006cc:	8b 07                	mov    (%edi),%eax
801006ce:	e8 ad fe ff ff       	call   80100580 <printint>
801006d3:	8b 7d e4             	mov    -0x1c(%ebp),%edi

  if (fmt == 0)
    panic("null fmt");

  argp = (uint*)(void*)(&fmt + 1);
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
801006d6:	83 c3 01             	add    $0x1,%ebx
801006d9:	0f b6 04 1e          	movzbl (%esi,%ebx,1),%eax
801006dd:	85 c0                	test   %eax,%eax
801006df:	74 15                	je     801006f6 <cprintf+0x96>
    if(c != '%'){
801006e1:	83 f8 25             	cmp    $0x25,%eax
801006e4:	74 b2                	je     80100698 <cprintf+0x38>
        s = "(null)";
      for(; *s; s++)
        consputc(*s);
      break;
    case '%':
      consputc('%');
801006e6:	e8 05 fd ff ff       	call   801003f0 <consputc>

  if (fmt == 0)
    panic("null fmt");

  argp = (uint*)(void*)(&fmt + 1);
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
801006eb:	83 c3 01             	add    $0x1,%ebx
801006ee:	0f b6 04 1e          	movzbl (%esi,%ebx,1),%eax
801006f2:	85 c0                	test   %eax,%eax
801006f4:	75 eb                	jne    801006e1 <cprintf+0x81>
      consputc(c);
      break;
    }
  }

  if(locking)
801006f6:	8b 45 e0             	mov    -0x20(%ebp),%eax
801006f9:	85 c0                	test   %eax,%eax
801006fb:	74 10                	je     8010070d <cprintf+0xad>
    release(&cons.lock);
801006fd:	83 ec 0c             	sub    $0xc,%esp
80100700:	68 20 b5 10 80       	push   $0x8010b520
80100705:	e8 06 43 00 00       	call   80104a10 <release>
8010070a:	83 c4 10             	add    $0x10,%esp
}
8010070d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100710:	5b                   	pop    %ebx
80100711:	5e                   	pop    %esi
80100712:	5f                   	pop    %edi
80100713:	5d                   	pop    %ebp
80100714:	c3                   	ret    
80100715:	8d 76 00             	lea    0x0(%esi),%esi
      continue;
    }
    c = fmt[++i] & 0xff;
    if(c == 0)
      break;
    switch(c){
80100718:	83 fa 73             	cmp    $0x73,%edx
8010071b:	74 53                	je     80100770 <cprintf+0x110>
8010071d:	83 fa 78             	cmp    $0x78,%edx
80100720:	75 1e                	jne    80100740 <cprintf+0xe0>
    case 'd':
      printint(*argp++, 10, 1);
      break;
    case 'x':
    case 'p':
      printint(*argp++, 16, 0);
80100722:	8d 47 04             	lea    0x4(%edi),%eax
80100725:	31 c9                	xor    %ecx,%ecx
80100727:	ba 10 00 00 00       	mov    $0x10,%edx
8010072c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010072f:	8b 07                	mov    (%edi),%eax
80100731:	e8 4a fe ff ff       	call   80100580 <printint>
80100736:	8b 7d e4             	mov    -0x1c(%ebp),%edi
      break;
80100739:	eb 9b                	jmp    801006d6 <cprintf+0x76>
8010073b:	90                   	nop
8010073c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    case '%':
      consputc('%');
      break;
    default:
      // Print unknown % sequence to draw attention.
      consputc('%');
80100740:	b8 25 00 00 00       	mov    $0x25,%eax
80100745:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80100748:	e8 a3 fc ff ff       	call   801003f0 <consputc>
      consputc(c);
8010074d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80100750:	89 d0                	mov    %edx,%eax
80100752:	e8 99 fc ff ff       	call   801003f0 <consputc>
      break;
80100757:	e9 7a ff ff ff       	jmp    801006d6 <cprintf+0x76>
8010075c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = "(null)";
      for(; *s; s++)
        consputc(*s);
      break;
    case '%':
      consputc('%');
80100760:	b8 25 00 00 00       	mov    $0x25,%eax
80100765:	e8 86 fc ff ff       	call   801003f0 <consputc>
8010076a:	e9 7c ff ff ff       	jmp    801006eb <cprintf+0x8b>
8010076f:	90                   	nop
    case 'x':
    case 'p':
      printint(*argp++, 16, 0);
      break;
    case 's':
      if((s = (char*)*argp++) == 0)
80100770:	8d 47 04             	lea    0x4(%edi),%eax
80100773:	8b 3f                	mov    (%edi),%edi
80100775:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100778:	85 ff                	test   %edi,%edi
8010077a:	75 0c                	jne    80100788 <cprintf+0x128>
8010077c:	eb 3a                	jmp    801007b8 <cprintf+0x158>
8010077e:	66 90                	xchg   %ax,%ax
        s = "(null)";
      for(; *s; s++)
80100780:	83 c7 01             	add    $0x1,%edi
        consputc(*s);
80100783:	e8 68 fc ff ff       	call   801003f0 <consputc>
      printint(*argp++, 16, 0);
      break;
    case 's':
      if((s = (char*)*argp++) == 0)
        s = "(null)";
      for(; *s; s++)
80100788:	0f be 07             	movsbl (%edi),%eax
8010078b:	84 c0                	test   %al,%al
8010078d:	75 f1                	jne    80100780 <cprintf+0x120>
    case 'x':
    case 'p':
      printint(*argp++, 16, 0);
      break;
    case 's':
      if((s = (char*)*argp++) == 0)
8010078f:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80100792:	e9 3f ff ff ff       	jmp    801006d6 <cprintf+0x76>
80100797:	89 f6                	mov    %esi,%esi
80100799:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  uint *argp;
  char *s;

  locking = cons.locking;
  if(locking)
    acquire(&cons.lock);
801007a0:	83 ec 0c             	sub    $0xc,%esp
801007a3:	68 20 b5 10 80       	push   $0x8010b520
801007a8:	e8 43 41 00 00       	call   801048f0 <acquire>
801007ad:	83 c4 10             	add    $0x10,%esp
801007b0:	e9 c4 fe ff ff       	jmp    80100679 <cprintf+0x19>
801007b5:	8d 76 00             	lea    0x0(%esi),%esi
      printint(*argp++, 16, 0);
      break;
    case 's':
      if((s = (char*)*argp++) == 0)
        s = "(null)";
      for(; *s; s++)
801007b8:	b8 28 00 00 00       	mov    $0x28,%eax
    case 'p':
      printint(*argp++, 16, 0);
      break;
    case 's':
      if((s = (char*)*argp++) == 0)
        s = "(null)";
801007bd:	bf 78 76 10 80       	mov    $0x80107678,%edi
801007c2:	eb bc                	jmp    80100780 <cprintf+0x120>
  locking = cons.locking;
  if(locking)
    acquire(&cons.lock);

  if (fmt == 0)
    panic("null fmt");
801007c4:	83 ec 0c             	sub    $0xc,%esp
801007c7:	68 7f 76 10 80       	push   $0x8010767f
801007cc:	e8 9f fb ff ff       	call   80100370 <panic>
801007d1:	eb 0d                	jmp    801007e0 <consoleintr>
801007d3:	90                   	nop
801007d4:	90                   	nop
801007d5:	90                   	nop
801007d6:	90                   	nop
801007d7:	90                   	nop
801007d8:	90                   	nop
801007d9:	90                   	nop
801007da:	90                   	nop
801007db:	90                   	nop
801007dc:	90                   	nop
801007dd:	90                   	nop
801007de:	90                   	nop
801007df:	90                   	nop

801007e0 <consoleintr>:

#define C(x)  ((x)-'@')  // Control-x

void
consoleintr(int (*getc)(void))
{
801007e0:	55                   	push   %ebp
801007e1:	89 e5                	mov    %esp,%ebp
801007e3:	57                   	push   %edi
801007e4:	56                   	push   %esi
801007e5:	53                   	push   %ebx
  int c, doprocdump = 0;
801007e6:	31 f6                	xor    %esi,%esi

#define C(x)  ((x)-'@')  // Control-x

void
consoleintr(int (*getc)(void))
{
801007e8:	83 ec 18             	sub    $0x18,%esp
801007eb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int c, doprocdump = 0;

  acquire(&cons.lock);
801007ee:	68 20 b5 10 80       	push   $0x8010b520
801007f3:	e8 f8 40 00 00       	call   801048f0 <acquire>
  while((c = getc()) >= 0){
801007f8:	83 c4 10             	add    $0x10,%esp
801007fb:	90                   	nop
801007fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100800:	ff d3                	call   *%ebx
80100802:	85 c0                	test   %eax,%eax
80100804:	89 c7                	mov    %eax,%edi
80100806:	78 48                	js     80100850 <consoleintr+0x70>
    switch(c){
80100808:	83 ff 10             	cmp    $0x10,%edi
8010080b:	0f 84 3f 01 00 00    	je     80100950 <consoleintr+0x170>
80100811:	7e 5d                	jle    80100870 <consoleintr+0x90>
80100813:	83 ff 15             	cmp    $0x15,%edi
80100816:	0f 84 dc 00 00 00    	je     801008f8 <consoleintr+0x118>
8010081c:	83 ff 7f             	cmp    $0x7f,%edi
8010081f:	75 54                	jne    80100875 <consoleintr+0x95>
        input.e--;
        consputc(BACKSPACE);
      }
      break;
    case C('H'): case '\x7f':  // Backspace
      if(input.e != input.w){
80100821:	a1 c8 0f 11 80       	mov    0x80110fc8,%eax
80100826:	3b 05 c4 0f 11 80    	cmp    0x80110fc4,%eax
8010082c:	74 d2                	je     80100800 <consoleintr+0x20>
        input.e--;
8010082e:	83 e8 01             	sub    $0x1,%eax
80100831:	a3 c8 0f 11 80       	mov    %eax,0x80110fc8
        consputc(BACKSPACE);
80100836:	b8 00 01 00 00       	mov    $0x100,%eax
8010083b:	e8 b0 fb ff ff       	call   801003f0 <consputc>
consoleintr(int (*getc)(void))
{
  int c, doprocdump = 0;

  acquire(&cons.lock);
  while((c = getc()) >= 0){
80100840:	ff d3                	call   *%ebx
80100842:	85 c0                	test   %eax,%eax
80100844:	89 c7                	mov    %eax,%edi
80100846:	79 c0                	jns    80100808 <consoleintr+0x28>
80100848:	90                   	nop
80100849:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        }
      }
      break;
    }
  }
  release(&cons.lock);
80100850:	83 ec 0c             	sub    $0xc,%esp
80100853:	68 20 b5 10 80       	push   $0x8010b520
80100858:	e8 b3 41 00 00       	call   80104a10 <release>
  if(doprocdump) {
8010085d:	83 c4 10             	add    $0x10,%esp
80100860:	85 f6                	test   %esi,%esi
80100862:	0f 85 f8 00 00 00    	jne    80100960 <consoleintr+0x180>
    procdump();  // now call procdump() wo. cons.lock held
  }
}
80100868:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010086b:	5b                   	pop    %ebx
8010086c:	5e                   	pop    %esi
8010086d:	5f                   	pop    %edi
8010086e:	5d                   	pop    %ebp
8010086f:	c3                   	ret    
{
  int c, doprocdump = 0;

  acquire(&cons.lock);
  while((c = getc()) >= 0){
    switch(c){
80100870:	83 ff 08             	cmp    $0x8,%edi
80100873:	74 ac                	je     80100821 <consoleintr+0x41>
        input.e--;
        consputc(BACKSPACE);
      }
      break;
    default:
      if(c != 0 && input.e-input.r < INPUT_BUF){
80100875:	85 ff                	test   %edi,%edi
80100877:	74 87                	je     80100800 <consoleintr+0x20>
80100879:	a1 c8 0f 11 80       	mov    0x80110fc8,%eax
8010087e:	89 c2                	mov    %eax,%edx
80100880:	2b 15 c0 0f 11 80    	sub    0x80110fc0,%edx
80100886:	83 fa 7f             	cmp    $0x7f,%edx
80100889:	0f 87 71 ff ff ff    	ja     80100800 <consoleintr+0x20>
        c = (c == '\r') ? '\n' : c;
        input.buf[input.e++ % INPUT_BUF] = c;
8010088f:	8d 50 01             	lea    0x1(%eax),%edx
80100892:	83 e0 7f             	and    $0x7f,%eax
        consputc(BACKSPACE);
      }
      break;
    default:
      if(c != 0 && input.e-input.r < INPUT_BUF){
        c = (c == '\r') ? '\n' : c;
80100895:	83 ff 0d             	cmp    $0xd,%edi
        input.buf[input.e++ % INPUT_BUF] = c;
80100898:	89 15 c8 0f 11 80    	mov    %edx,0x80110fc8
        consputc(BACKSPACE);
      }
      break;
    default:
      if(c != 0 && input.e-input.r < INPUT_BUF){
        c = (c == '\r') ? '\n' : c;
8010089e:	0f 84 c8 00 00 00    	je     8010096c <consoleintr+0x18c>
        input.buf[input.e++ % INPUT_BUF] = c;
801008a4:	89 f9                	mov    %edi,%ecx
801008a6:	88 88 40 0f 11 80    	mov    %cl,-0x7feef0c0(%eax)
        consputc(c);
801008ac:	89 f8                	mov    %edi,%eax
801008ae:	e8 3d fb ff ff       	call   801003f0 <consputc>
        if(c == '\n' || c == C('D') || input.e == input.r+INPUT_BUF){
801008b3:	83 ff 0a             	cmp    $0xa,%edi
801008b6:	0f 84 c1 00 00 00    	je     8010097d <consoleintr+0x19d>
801008bc:	83 ff 04             	cmp    $0x4,%edi
801008bf:	0f 84 b8 00 00 00    	je     8010097d <consoleintr+0x19d>
801008c5:	a1 c0 0f 11 80       	mov    0x80110fc0,%eax
801008ca:	83 e8 80             	sub    $0xffffff80,%eax
801008cd:	39 05 c8 0f 11 80    	cmp    %eax,0x80110fc8
801008d3:	0f 85 27 ff ff ff    	jne    80100800 <consoleintr+0x20>
          input.w = input.e;
          wakeup(&input.r);
801008d9:	83 ec 0c             	sub    $0xc,%esp
      if(c != 0 && input.e-input.r < INPUT_BUF){
        c = (c == '\r') ? '\n' : c;
        input.buf[input.e++ % INPUT_BUF] = c;
        consputc(c);
        if(c == '\n' || c == C('D') || input.e == input.r+INPUT_BUF){
          input.w = input.e;
801008dc:	a3 c4 0f 11 80       	mov    %eax,0x80110fc4
          wakeup(&input.r);
801008e1:	68 c0 0f 11 80       	push   $0x80110fc0
801008e6:	e8 95 37 00 00       	call   80104080 <wakeup>
801008eb:	83 c4 10             	add    $0x10,%esp
801008ee:	e9 0d ff ff ff       	jmp    80100800 <consoleintr+0x20>
801008f3:	90                   	nop
801008f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    case C('P'):  // Process listing.
      // procdump() locks cons.lock indirectly; invoke later
      doprocdump = 1;
      break;
    case C('U'):  // Kill line.
      while(input.e != input.w &&
801008f8:	a1 c8 0f 11 80       	mov    0x80110fc8,%eax
801008fd:	39 05 c4 0f 11 80    	cmp    %eax,0x80110fc4
80100903:	75 2b                	jne    80100930 <consoleintr+0x150>
80100905:	e9 f6 fe ff ff       	jmp    80100800 <consoleintr+0x20>
8010090a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
            input.buf[(input.e-1) % INPUT_BUF] != '\n'){
        input.e--;
80100910:	a3 c8 0f 11 80       	mov    %eax,0x80110fc8
        consputc(BACKSPACE);
80100915:	b8 00 01 00 00       	mov    $0x100,%eax
8010091a:	e8 d1 fa ff ff       	call   801003f0 <consputc>
    case C('P'):  // Process listing.
      // procdump() locks cons.lock indirectly; invoke later
      doprocdump = 1;
      break;
    case C('U'):  // Kill line.
      while(input.e != input.w &&
8010091f:	a1 c8 0f 11 80       	mov    0x80110fc8,%eax
80100924:	3b 05 c4 0f 11 80    	cmp    0x80110fc4,%eax
8010092a:	0f 84 d0 fe ff ff    	je     80100800 <consoleintr+0x20>
            input.buf[(input.e-1) % INPUT_BUF] != '\n'){
80100930:	83 e8 01             	sub    $0x1,%eax
80100933:	89 c2                	mov    %eax,%edx
80100935:	83 e2 7f             	and    $0x7f,%edx
    case C('P'):  // Process listing.
      // procdump() locks cons.lock indirectly; invoke later
      doprocdump = 1;
      break;
    case C('U'):  // Kill line.
      while(input.e != input.w &&
80100938:	80 ba 40 0f 11 80 0a 	cmpb   $0xa,-0x7feef0c0(%edx)
8010093f:	75 cf                	jne    80100910 <consoleintr+0x130>
80100941:	e9 ba fe ff ff       	jmp    80100800 <consoleintr+0x20>
80100946:	8d 76 00             	lea    0x0(%esi),%esi
80100949:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  acquire(&cons.lock);
  while((c = getc()) >= 0){
    switch(c){
    case C('P'):  // Process listing.
      // procdump() locks cons.lock indirectly; invoke later
      doprocdump = 1;
80100950:	be 01 00 00 00       	mov    $0x1,%esi
80100955:	e9 a6 fe ff ff       	jmp    80100800 <consoleintr+0x20>
8010095a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  }
  release(&cons.lock);
  if(doprocdump) {
    procdump();  // now call procdump() wo. cons.lock held
  }
}
80100960:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100963:	5b                   	pop    %ebx
80100964:	5e                   	pop    %esi
80100965:	5f                   	pop    %edi
80100966:	5d                   	pop    %ebp
      break;
    }
  }
  release(&cons.lock);
  if(doprocdump) {
    procdump();  // now call procdump() wo. cons.lock held
80100967:	e9 f4 37 00 00       	jmp    80104160 <procdump>
      }
      break;
    default:
      if(c != 0 && input.e-input.r < INPUT_BUF){
        c = (c == '\r') ? '\n' : c;
        input.buf[input.e++ % INPUT_BUF] = c;
8010096c:	c6 80 40 0f 11 80 0a 	movb   $0xa,-0x7feef0c0(%eax)
        consputc(c);
80100973:	b8 0a 00 00 00       	mov    $0xa,%eax
80100978:	e8 73 fa ff ff       	call   801003f0 <consputc>
8010097d:	a1 c8 0f 11 80       	mov    0x80110fc8,%eax
80100982:	e9 52 ff ff ff       	jmp    801008d9 <consoleintr+0xf9>
80100987:	89 f6                	mov    %esi,%esi
80100989:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100990 <consoleinit>:
  return n;
}

void
consoleinit(void)
{
80100990:	55                   	push   %ebp
80100991:	89 e5                	mov    %esp,%ebp
80100993:	83 ec 10             	sub    $0x10,%esp
  initlock(&cons.lock, "console");
80100996:	68 88 76 10 80       	push   $0x80107688
8010099b:	68 20 b5 10 80       	push   $0x8010b520
801009a0:	e8 4b 3e 00 00       	call   801047f0 <initlock>

  devsw[CONSOLE].write = consolewrite;
  devsw[CONSOLE].read = consoleread;
  cons.locking = 1;

  ioapicenable(IRQ_KBD, 0);
801009a5:	58                   	pop    %eax
801009a6:	5a                   	pop    %edx
801009a7:	6a 00                	push   $0x0
801009a9:	6a 01                	push   $0x1
void
consoleinit(void)
{
  initlock(&cons.lock, "console");

  devsw[CONSOLE].write = consolewrite;
801009ab:	c7 05 8c 19 11 80 00 	movl   $0x80100600,0x8011198c
801009b2:	06 10 80 
  devsw[CONSOLE].read = consoleread;
801009b5:	c7 05 88 19 11 80 70 	movl   $0x80100270,0x80111988
801009bc:	02 10 80 
  cons.locking = 1;
801009bf:	c7 05 54 b5 10 80 01 	movl   $0x1,0x8010b554
801009c6:	00 00 00 

  ioapicenable(IRQ_KBD, 0);
801009c9:	e8 d2 18 00 00       	call   801022a0 <ioapicenable>
}
801009ce:	83 c4 10             	add    $0x10,%esp
801009d1:	c9                   	leave  
801009d2:	c3                   	ret    
801009d3:	66 90                	xchg   %ax,%ax
801009d5:	66 90                	xchg   %ax,%ax
801009d7:	66 90                	xchg   %ax,%ax
801009d9:	66 90                	xchg   %ax,%ax
801009db:	66 90                	xchg   %ax,%ax
801009dd:	66 90                	xchg   %ax,%ax
801009df:	90                   	nop

801009e0 <exec>:
#include "x86.h"
#include "elf.h"

int
exec(char *path, char **argv)
{
801009e0:	55                   	push   %ebp
801009e1:	89 e5                	mov    %esp,%ebp
801009e3:	57                   	push   %edi
801009e4:	56                   	push   %esi
801009e5:	53                   	push   %ebx
801009e6:	81 ec 0c 01 00 00    	sub    $0x10c,%esp
  uint argc, sz, sp, ustack[3+MAXARG+1];
  struct elfhdr elf;
  struct inode *ip;
  struct proghdr ph;
  pde_t *pgdir, *oldpgdir;
  struct proc *curproc = myproc();
801009ec:	e8 cf 2e 00 00       	call   801038c0 <myproc>
801009f1:	89 85 f4 fe ff ff    	mov    %eax,-0x10c(%ebp)

  begin_op();
801009f7:	e8 74 21 00 00       	call   80102b70 <begin_op>

  if((ip = namei(path)) == 0){
801009fc:	83 ec 0c             	sub    $0xc,%esp
801009ff:	ff 75 08             	pushl  0x8(%ebp)
80100a02:	e8 b9 14 00 00       	call   80101ec0 <namei>
80100a07:	83 c4 10             	add    $0x10,%esp
80100a0a:	85 c0                	test   %eax,%eax
80100a0c:	0f 84 9c 01 00 00    	je     80100bae <exec+0x1ce>
    end_op();
    cprintf("exec: fail\n");
    return -1;
  }
  ilock(ip);
80100a12:	83 ec 0c             	sub    $0xc,%esp
80100a15:	89 c3                	mov    %eax,%ebx
80100a17:	50                   	push   %eax
80100a18:	e8 53 0c 00 00       	call   80101670 <ilock>
  pgdir = 0;

  // Check ELF header
  if(readi(ip, (char*)&elf, 0, sizeof(elf)) != sizeof(elf))
80100a1d:	8d 85 24 ff ff ff    	lea    -0xdc(%ebp),%eax
80100a23:	6a 34                	push   $0x34
80100a25:	6a 00                	push   $0x0
80100a27:	50                   	push   %eax
80100a28:	53                   	push   %ebx
80100a29:	e8 22 0f 00 00       	call   80101950 <readi>
80100a2e:	83 c4 20             	add    $0x20,%esp
80100a31:	83 f8 34             	cmp    $0x34,%eax
80100a34:	74 22                	je     80100a58 <exec+0x78>

 bad:
  if(pgdir)
    freevm(pgdir);
  if(ip){
    iunlockput(ip);
80100a36:	83 ec 0c             	sub    $0xc,%esp
80100a39:	53                   	push   %ebx
80100a3a:	e8 c1 0e 00 00       	call   80101900 <iunlockput>
    end_op();
80100a3f:	e8 9c 21 00 00       	call   80102be0 <end_op>
80100a44:	83 c4 10             	add    $0x10,%esp
  }
  return -1;
80100a47:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80100a4c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100a4f:	5b                   	pop    %ebx
80100a50:	5e                   	pop    %esi
80100a51:	5f                   	pop    %edi
80100a52:	5d                   	pop    %ebp
80100a53:	c3                   	ret    
80100a54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  pgdir = 0;

  // Check ELF header
  if(readi(ip, (char*)&elf, 0, sizeof(elf)) != sizeof(elf))
    goto bad;
  if(elf.magic != ELF_MAGIC)
80100a58:	81 bd 24 ff ff ff 7f 	cmpl   $0x464c457f,-0xdc(%ebp)
80100a5f:	45 4c 46 
80100a62:	75 d2                	jne    80100a36 <exec+0x56>
    goto bad;

  if((pgdir = setupkvm()) == 0)
80100a64:	e8 17 69 00 00       	call   80107380 <setupkvm>
80100a69:	85 c0                	test   %eax,%eax
80100a6b:	89 85 f0 fe ff ff    	mov    %eax,-0x110(%ebp)
80100a71:	74 c3                	je     80100a36 <exec+0x56>
    goto bad;

  // Load program into memory.
  sz = 0;
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100a73:	66 83 bd 50 ff ff ff 	cmpw   $0x0,-0xb0(%ebp)
80100a7a:	00 
80100a7b:	8b b5 40 ff ff ff    	mov    -0xc0(%ebp),%esi
80100a81:	c7 85 ec fe ff ff 00 	movl   $0x0,-0x114(%ebp)
80100a88:	00 00 00 
80100a8b:	0f 84 c5 00 00 00    	je     80100b56 <exec+0x176>
80100a91:	31 ff                	xor    %edi,%edi
80100a93:	eb 18                	jmp    80100aad <exec+0xcd>
80100a95:	8d 76 00             	lea    0x0(%esi),%esi
80100a98:	0f b7 85 50 ff ff ff 	movzwl -0xb0(%ebp),%eax
80100a9f:	83 c7 01             	add    $0x1,%edi
80100aa2:	83 c6 20             	add    $0x20,%esi
80100aa5:	39 f8                	cmp    %edi,%eax
80100aa7:	0f 8e a9 00 00 00    	jle    80100b56 <exec+0x176>
    if(readi(ip, (char*)&ph, off, sizeof(ph)) != sizeof(ph))
80100aad:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
80100ab3:	6a 20                	push   $0x20
80100ab5:	56                   	push   %esi
80100ab6:	50                   	push   %eax
80100ab7:	53                   	push   %ebx
80100ab8:	e8 93 0e 00 00       	call   80101950 <readi>
80100abd:	83 c4 10             	add    $0x10,%esp
80100ac0:	83 f8 20             	cmp    $0x20,%eax
80100ac3:	75 7b                	jne    80100b40 <exec+0x160>
      goto bad;
    if(ph.type != ELF_PROG_LOAD)
80100ac5:	83 bd 04 ff ff ff 01 	cmpl   $0x1,-0xfc(%ebp)
80100acc:	75 ca                	jne    80100a98 <exec+0xb8>
      continue;
    if(ph.memsz < ph.filesz)
80100ace:	8b 85 18 ff ff ff    	mov    -0xe8(%ebp),%eax
80100ad4:	3b 85 14 ff ff ff    	cmp    -0xec(%ebp),%eax
80100ada:	72 64                	jb     80100b40 <exec+0x160>
80100adc:	03 85 0c ff ff ff    	add    -0xf4(%ebp),%eax
80100ae2:	72 5c                	jb     80100b40 <exec+0x160>
      goto bad;
    if(ph.vaddr + ph.memsz < ph.vaddr)
      goto bad;
    if((sz = allocuvm(pgdir, sz, ph.vaddr + ph.memsz)) == 0)
80100ae4:	83 ec 04             	sub    $0x4,%esp
80100ae7:	50                   	push   %eax
80100ae8:	ff b5 ec fe ff ff    	pushl  -0x114(%ebp)
80100aee:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100af4:	e8 e7 66 00 00       	call   801071e0 <allocuvm>
80100af9:	83 c4 10             	add    $0x10,%esp
80100afc:	85 c0                	test   %eax,%eax
80100afe:	89 85 ec fe ff ff    	mov    %eax,-0x114(%ebp)
80100b04:	74 3a                	je     80100b40 <exec+0x160>
      goto bad;
    if(ph.vaddr % PGSIZE != 0)
80100b06:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
80100b0c:	a9 ff 0f 00 00       	test   $0xfff,%eax
80100b11:	75 2d                	jne    80100b40 <exec+0x160>
      goto bad;
    if(loaduvm(pgdir, (char*)ph.vaddr, ip, ph.off, ph.filesz) < 0)
80100b13:	83 ec 0c             	sub    $0xc,%esp
80100b16:	ff b5 14 ff ff ff    	pushl  -0xec(%ebp)
80100b1c:	ff b5 08 ff ff ff    	pushl  -0xf8(%ebp)
80100b22:	53                   	push   %ebx
80100b23:	50                   	push   %eax
80100b24:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100b2a:	e8 f1 65 00 00       	call   80107120 <loaduvm>
80100b2f:	83 c4 20             	add    $0x20,%esp
80100b32:	85 c0                	test   %eax,%eax
80100b34:	0f 89 5e ff ff ff    	jns    80100a98 <exec+0xb8>
80100b3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  freevm(oldpgdir);
  return 0;

 bad:
  if(pgdir)
    freevm(pgdir);
80100b40:	83 ec 0c             	sub    $0xc,%esp
80100b43:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100b49:	e8 b2 67 00 00       	call   80107300 <freevm>
80100b4e:	83 c4 10             	add    $0x10,%esp
80100b51:	e9 e0 fe ff ff       	jmp    80100a36 <exec+0x56>
    if(ph.vaddr % PGSIZE != 0)
      goto bad;
    if(loaduvm(pgdir, (char*)ph.vaddr, ip, ph.off, ph.filesz) < 0)
      goto bad;
  }
  iunlockput(ip);
80100b56:	83 ec 0c             	sub    $0xc,%esp
80100b59:	53                   	push   %ebx
80100b5a:	e8 a1 0d 00 00       	call   80101900 <iunlockput>
  end_op();
80100b5f:	e8 7c 20 00 00       	call   80102be0 <end_op>
  ip = 0;

  // Allocate two pages at the next page boundary.
  // Make the first inaccessible.  Use the second as the user stack.
  sz = PGROUNDUP(sz);
80100b64:	8b 85 ec fe ff ff    	mov    -0x114(%ebp),%eax
  if((sz = allocuvm(pgdir, sz, sz + 2*PGSIZE)) == 0)
80100b6a:	83 c4 0c             	add    $0xc,%esp
  end_op();
  ip = 0;

  // Allocate two pages at the next page boundary.
  // Make the first inaccessible.  Use the second as the user stack.
  sz = PGROUNDUP(sz);
80100b6d:	05 ff 0f 00 00       	add    $0xfff,%eax
80100b72:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  if((sz = allocuvm(pgdir, sz, sz + 2*PGSIZE)) == 0)
80100b77:	8d 90 00 20 00 00    	lea    0x2000(%eax),%edx
80100b7d:	52                   	push   %edx
80100b7e:	50                   	push   %eax
80100b7f:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100b85:	e8 56 66 00 00       	call   801071e0 <allocuvm>
80100b8a:	83 c4 10             	add    $0x10,%esp
80100b8d:	85 c0                	test   %eax,%eax
80100b8f:	89 c6                	mov    %eax,%esi
80100b91:	75 3a                	jne    80100bcd <exec+0x1ed>
  freevm(oldpgdir);
  return 0;

 bad:
  if(pgdir)
    freevm(pgdir);
80100b93:	83 ec 0c             	sub    $0xc,%esp
80100b96:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100b9c:	e8 5f 67 00 00       	call   80107300 <freevm>
80100ba1:	83 c4 10             	add    $0x10,%esp
  if(ip){
    iunlockput(ip);
    end_op();
  }
  return -1;
80100ba4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100ba9:	e9 9e fe ff ff       	jmp    80100a4c <exec+0x6c>
  struct proc *curproc = myproc();

  begin_op();

  if((ip = namei(path)) == 0){
    end_op();
80100bae:	e8 2d 20 00 00       	call   80102be0 <end_op>
    cprintf("exec: fail\n");
80100bb3:	83 ec 0c             	sub    $0xc,%esp
80100bb6:	68 a1 76 10 80       	push   $0x801076a1
80100bbb:	e8 a0 fa ff ff       	call   80100660 <cprintf>
    return -1;
80100bc0:	83 c4 10             	add    $0x10,%esp
80100bc3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100bc8:	e9 7f fe ff ff       	jmp    80100a4c <exec+0x6c>
  // Allocate two pages at the next page boundary.
  // Make the first inaccessible.  Use the second as the user stack.
  sz = PGROUNDUP(sz);
  if((sz = allocuvm(pgdir, sz, sz + 2*PGSIZE)) == 0)
    goto bad;
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
80100bcd:	8d 80 00 e0 ff ff    	lea    -0x2000(%eax),%eax
80100bd3:	83 ec 08             	sub    $0x8,%esp
  sp = sz;

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
80100bd6:	31 ff                	xor    %edi,%edi
80100bd8:	89 f3                	mov    %esi,%ebx
  // Allocate two pages at the next page boundary.
  // Make the first inaccessible.  Use the second as the user stack.
  sz = PGROUNDUP(sz);
  if((sz = allocuvm(pgdir, sz, sz + 2*PGSIZE)) == 0)
    goto bad;
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
80100bda:	50                   	push   %eax
80100bdb:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100be1:	e8 3a 68 00 00       	call   80107420 <clearpteu>
  sp = sz;

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
80100be6:	8b 45 0c             	mov    0xc(%ebp),%eax
80100be9:	83 c4 10             	add    $0x10,%esp
80100bec:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
80100bf2:	8b 00                	mov    (%eax),%eax
80100bf4:	85 c0                	test   %eax,%eax
80100bf6:	74 79                	je     80100c71 <exec+0x291>
80100bf8:	89 b5 ec fe ff ff    	mov    %esi,-0x114(%ebp)
80100bfe:	8b b5 f0 fe ff ff    	mov    -0x110(%ebp),%esi
80100c04:	eb 13                	jmp    80100c19 <exec+0x239>
80100c06:	8d 76 00             	lea    0x0(%esi),%esi
80100c09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    if(argc >= MAXARG)
80100c10:	83 ff 20             	cmp    $0x20,%edi
80100c13:	0f 84 7a ff ff ff    	je     80100b93 <exec+0x1b3>
      goto bad;
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
80100c19:	83 ec 0c             	sub    $0xc,%esp
80100c1c:	50                   	push   %eax
80100c1d:	e8 5e 40 00 00       	call   80104c80 <strlen>
80100c22:	f7 d0                	not    %eax
80100c24:	01 c3                	add    %eax,%ebx
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
80100c26:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c29:	5a                   	pop    %edx

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
    if(argc >= MAXARG)
      goto bad;
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
80100c2a:	83 e3 fc             	and    $0xfffffffc,%ebx
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
80100c2d:	ff 34 b8             	pushl  (%eax,%edi,4)
80100c30:	e8 4b 40 00 00       	call   80104c80 <strlen>
80100c35:	83 c0 01             	add    $0x1,%eax
80100c38:	50                   	push   %eax
80100c39:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c3c:	ff 34 b8             	pushl  (%eax,%edi,4)
80100c3f:	53                   	push   %ebx
80100c40:	56                   	push   %esi
80100c41:	e8 2a 69 00 00       	call   80107570 <copyout>
80100c46:	83 c4 20             	add    $0x20,%esp
80100c49:	85 c0                	test   %eax,%eax
80100c4b:	0f 88 42 ff ff ff    	js     80100b93 <exec+0x1b3>
    goto bad;
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
  sp = sz;

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
80100c51:	8b 45 0c             	mov    0xc(%ebp),%eax
    if(argc >= MAXARG)
      goto bad;
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
      goto bad;
    ustack[3+argc] = sp;
80100c54:	89 9c bd 64 ff ff ff 	mov    %ebx,-0x9c(%ebp,%edi,4)
    goto bad;
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
  sp = sz;

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
80100c5b:	83 c7 01             	add    $0x1,%edi
    if(argc >= MAXARG)
      goto bad;
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
      goto bad;
    ustack[3+argc] = sp;
80100c5e:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
    goto bad;
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
  sp = sz;

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
80100c64:	8b 04 b8             	mov    (%eax,%edi,4),%eax
80100c67:	85 c0                	test   %eax,%eax
80100c69:	75 a5                	jne    80100c10 <exec+0x230>
80100c6b:	8b b5 ec fe ff ff    	mov    -0x114(%ebp),%esi
  }
  ustack[3+argc] = 0;

  ustack[0] = 0xffffffff;  // fake return PC
  ustack[1] = argc;
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100c71:	8d 04 bd 04 00 00 00 	lea    0x4(,%edi,4),%eax
80100c78:	89 d9                	mov    %ebx,%ecx
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
      goto bad;
    ustack[3+argc] = sp;
  }
  ustack[3+argc] = 0;
80100c7a:	c7 84 bd 64 ff ff ff 	movl   $0x0,-0x9c(%ebp,%edi,4)
80100c81:	00 00 00 00 

  ustack[0] = 0xffffffff;  // fake return PC
80100c85:	c7 85 58 ff ff ff ff 	movl   $0xffffffff,-0xa8(%ebp)
80100c8c:	ff ff ff 
  ustack[1] = argc;
80100c8f:	89 bd 5c ff ff ff    	mov    %edi,-0xa4(%ebp)
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100c95:	29 c1                	sub    %eax,%ecx

  sp -= (3+argc+1) * 4;
80100c97:	83 c0 0c             	add    $0xc,%eax
80100c9a:	29 c3                	sub    %eax,%ebx
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
80100c9c:	50                   	push   %eax
80100c9d:	52                   	push   %edx
80100c9e:	53                   	push   %ebx
80100c9f:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
  }
  ustack[3+argc] = 0;

  ustack[0] = 0xffffffff;  // fake return PC
  ustack[1] = argc;
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100ca5:	89 8d 60 ff ff ff    	mov    %ecx,-0xa0(%ebp)

  sp -= (3+argc+1) * 4;
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
80100cab:	e8 c0 68 00 00       	call   80107570 <copyout>
80100cb0:	83 c4 10             	add    $0x10,%esp
80100cb3:	85 c0                	test   %eax,%eax
80100cb5:	0f 88 d8 fe ff ff    	js     80100b93 <exec+0x1b3>
    goto bad;

  // Save program name for debugging.
  for(last=s=path; *s; s++)
80100cbb:	8b 45 08             	mov    0x8(%ebp),%eax
80100cbe:	0f b6 10             	movzbl (%eax),%edx
80100cc1:	84 d2                	test   %dl,%dl
80100cc3:	74 19                	je     80100cde <exec+0x2fe>
80100cc5:	8b 4d 08             	mov    0x8(%ebp),%ecx
80100cc8:	83 c0 01             	add    $0x1,%eax
    if(*s == '/')
      last = s+1;
80100ccb:	80 fa 2f             	cmp    $0x2f,%dl
  sp -= (3+argc+1) * 4;
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
    goto bad;

  // Save program name for debugging.
  for(last=s=path; *s; s++)
80100cce:	0f b6 10             	movzbl (%eax),%edx
    if(*s == '/')
      last = s+1;
80100cd1:	0f 44 c8             	cmove  %eax,%ecx
80100cd4:	83 c0 01             	add    $0x1,%eax
  sp -= (3+argc+1) * 4;
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
    goto bad;

  // Save program name for debugging.
  for(last=s=path; *s; s++)
80100cd7:	84 d2                	test   %dl,%dl
80100cd9:	75 f0                	jne    80100ccb <exec+0x2eb>
80100cdb:	89 4d 08             	mov    %ecx,0x8(%ebp)
    if(*s == '/')
      last = s+1;
  safestrcpy(curproc->name, last, sizeof(curproc->name));
80100cde:	8b bd f4 fe ff ff    	mov    -0x10c(%ebp),%edi
80100ce4:	50                   	push   %eax
80100ce5:	6a 10                	push   $0x10
80100ce7:	ff 75 08             	pushl  0x8(%ebp)
80100cea:	89 f8                	mov    %edi,%eax
80100cec:	83 c0 6c             	add    $0x6c,%eax
80100cef:	50                   	push   %eax
80100cf0:	e8 4b 3f 00 00       	call   80104c40 <safestrcpy>

  // Commit to the user image.
  oldpgdir = curproc->pgdir;
  curproc->pgdir = pgdir;
80100cf5:	8b 8d f0 fe ff ff    	mov    -0x110(%ebp),%ecx
    if(*s == '/')
      last = s+1;
  safestrcpy(curproc->name, last, sizeof(curproc->name));

  // Commit to the user image.
  oldpgdir = curproc->pgdir;
80100cfb:	89 f8                	mov    %edi,%eax
80100cfd:	8b 7f 04             	mov    0x4(%edi),%edi
  curproc->pgdir = pgdir;
  curproc->sz = sz;
80100d00:	89 30                	mov    %esi,(%eax)
      last = s+1;
  safestrcpy(curproc->name, last, sizeof(curproc->name));

  // Commit to the user image.
  oldpgdir = curproc->pgdir;
  curproc->pgdir = pgdir;
80100d02:	89 48 04             	mov    %ecx,0x4(%eax)
  curproc->sz = sz;
  curproc->tf->eip = elf.entry;  // main
80100d05:	89 c1                	mov    %eax,%ecx
80100d07:	8b 95 3c ff ff ff    	mov    -0xc4(%ebp),%edx
80100d0d:	8b 40 18             	mov    0x18(%eax),%eax
80100d10:	89 50 38             	mov    %edx,0x38(%eax)
  curproc->tf->esp = sp;
80100d13:	8b 41 18             	mov    0x18(%ecx),%eax
80100d16:	89 58 44             	mov    %ebx,0x44(%eax)
  switchuvm(curproc);
80100d19:	89 0c 24             	mov    %ecx,(%esp)
80100d1c:	e8 6f 62 00 00       	call   80106f90 <switchuvm>
  freevm(oldpgdir);
80100d21:	89 3c 24             	mov    %edi,(%esp)
80100d24:	e8 d7 65 00 00       	call   80107300 <freevm>
  return 0;
80100d29:	83 c4 10             	add    $0x10,%esp
80100d2c:	31 c0                	xor    %eax,%eax
80100d2e:	e9 19 fd ff ff       	jmp    80100a4c <exec+0x6c>
80100d33:	66 90                	xchg   %ax,%ax
80100d35:	66 90                	xchg   %ax,%ax
80100d37:	66 90                	xchg   %ax,%ax
80100d39:	66 90                	xchg   %ax,%ax
80100d3b:	66 90                	xchg   %ax,%ax
80100d3d:	66 90                	xchg   %ax,%ax
80100d3f:	90                   	nop

80100d40 <fileinit>:
  struct file file[NFILE];
} ftable;

void
fileinit(void)
{
80100d40:	55                   	push   %ebp
80100d41:	89 e5                	mov    %esp,%ebp
80100d43:	83 ec 10             	sub    $0x10,%esp
  initlock(&ftable.lock, "ftable");
80100d46:	68 ad 76 10 80       	push   $0x801076ad
80100d4b:	68 e0 0f 11 80       	push   $0x80110fe0
80100d50:	e8 9b 3a 00 00       	call   801047f0 <initlock>
}
80100d55:	83 c4 10             	add    $0x10,%esp
80100d58:	c9                   	leave  
80100d59:	c3                   	ret    
80100d5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100d60 <filealloc>:

// Allocate a file structure.
struct file*
filealloc(void)
{
80100d60:	55                   	push   %ebp
80100d61:	89 e5                	mov    %esp,%ebp
80100d63:	53                   	push   %ebx
  struct file *f;

  acquire(&ftable.lock);
  for(f = ftable.file; f < ftable.file + NFILE; f++){
80100d64:	bb 14 10 11 80       	mov    $0x80111014,%ebx
}

// Allocate a file structure.
struct file*
filealloc(void)
{
80100d69:	83 ec 10             	sub    $0x10,%esp
  struct file *f;

  acquire(&ftable.lock);
80100d6c:	68 e0 0f 11 80       	push   $0x80110fe0
80100d71:	e8 7a 3b 00 00       	call   801048f0 <acquire>
80100d76:	83 c4 10             	add    $0x10,%esp
80100d79:	eb 10                	jmp    80100d8b <filealloc+0x2b>
80100d7b:	90                   	nop
80100d7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(f = ftable.file; f < ftable.file + NFILE; f++){
80100d80:	83 c3 18             	add    $0x18,%ebx
80100d83:	81 fb 74 19 11 80    	cmp    $0x80111974,%ebx
80100d89:	73 25                	jae    80100db0 <filealloc+0x50>
    if(f->ref == 0){
80100d8b:	8b 43 04             	mov    0x4(%ebx),%eax
80100d8e:	85 c0                	test   %eax,%eax
80100d90:	75 ee                	jne    80100d80 <filealloc+0x20>
      f->ref = 1;
      release(&ftable.lock);
80100d92:	83 ec 0c             	sub    $0xc,%esp
  struct file *f;

  acquire(&ftable.lock);
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    if(f->ref == 0){
      f->ref = 1;
80100d95:	c7 43 04 01 00 00 00 	movl   $0x1,0x4(%ebx)
      release(&ftable.lock);
80100d9c:	68 e0 0f 11 80       	push   $0x80110fe0
80100da1:	e8 6a 3c 00 00       	call   80104a10 <release>
      return f;
    }
  }
  release(&ftable.lock);
  return 0;
}
80100da6:	89 d8                	mov    %ebx,%eax
  acquire(&ftable.lock);
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    if(f->ref == 0){
      f->ref = 1;
      release(&ftable.lock);
      return f;
80100da8:	83 c4 10             	add    $0x10,%esp
    }
  }
  release(&ftable.lock);
  return 0;
}
80100dab:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100dae:	c9                   	leave  
80100daf:	c3                   	ret    
      f->ref = 1;
      release(&ftable.lock);
      return f;
    }
  }
  release(&ftable.lock);
80100db0:	83 ec 0c             	sub    $0xc,%esp
  return 0;
80100db3:	31 db                	xor    %ebx,%ebx
      f->ref = 1;
      release(&ftable.lock);
      return f;
    }
  }
  release(&ftable.lock);
80100db5:	68 e0 0f 11 80       	push   $0x80110fe0
80100dba:	e8 51 3c 00 00       	call   80104a10 <release>
  return 0;
}
80100dbf:	89 d8                	mov    %ebx,%eax
      release(&ftable.lock);
      return f;
    }
  }
  release(&ftable.lock);
  return 0;
80100dc1:	83 c4 10             	add    $0x10,%esp
}
80100dc4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100dc7:	c9                   	leave  
80100dc8:	c3                   	ret    
80100dc9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80100dd0 <filedup>:

// Increment ref count for file f.
struct file*
filedup(struct file *f)
{
80100dd0:	55                   	push   %ebp
80100dd1:	89 e5                	mov    %esp,%ebp
80100dd3:	53                   	push   %ebx
80100dd4:	83 ec 10             	sub    $0x10,%esp
80100dd7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&ftable.lock);
80100dda:	68 e0 0f 11 80       	push   $0x80110fe0
80100ddf:	e8 0c 3b 00 00       	call   801048f0 <acquire>
  if(f->ref < 1)
80100de4:	8b 43 04             	mov    0x4(%ebx),%eax
80100de7:	83 c4 10             	add    $0x10,%esp
80100dea:	85 c0                	test   %eax,%eax
80100dec:	7e 1a                	jle    80100e08 <filedup+0x38>
    panic("filedup");
  f->ref++;
80100dee:	83 c0 01             	add    $0x1,%eax
  release(&ftable.lock);
80100df1:	83 ec 0c             	sub    $0xc,%esp
filedup(struct file *f)
{
  acquire(&ftable.lock);
  if(f->ref < 1)
    panic("filedup");
  f->ref++;
80100df4:	89 43 04             	mov    %eax,0x4(%ebx)
  release(&ftable.lock);
80100df7:	68 e0 0f 11 80       	push   $0x80110fe0
80100dfc:	e8 0f 3c 00 00       	call   80104a10 <release>
  return f;
}
80100e01:	89 d8                	mov    %ebx,%eax
80100e03:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100e06:	c9                   	leave  
80100e07:	c3                   	ret    
struct file*
filedup(struct file *f)
{
  acquire(&ftable.lock);
  if(f->ref < 1)
    panic("filedup");
80100e08:	83 ec 0c             	sub    $0xc,%esp
80100e0b:	68 b4 76 10 80       	push   $0x801076b4
80100e10:	e8 5b f5 ff ff       	call   80100370 <panic>
80100e15:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100e19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100e20 <fileclose>:
}

// Close file f.  (Decrement ref count, close when reaches 0.)
void
fileclose(struct file *f)
{
80100e20:	55                   	push   %ebp
80100e21:	89 e5                	mov    %esp,%ebp
80100e23:	57                   	push   %edi
80100e24:	56                   	push   %esi
80100e25:	53                   	push   %ebx
80100e26:	83 ec 28             	sub    $0x28,%esp
80100e29:	8b 7d 08             	mov    0x8(%ebp),%edi
  struct file ff;

  acquire(&ftable.lock);
80100e2c:	68 e0 0f 11 80       	push   $0x80110fe0
80100e31:	e8 ba 3a 00 00       	call   801048f0 <acquire>
  if(f->ref < 1)
80100e36:	8b 47 04             	mov    0x4(%edi),%eax
80100e39:	83 c4 10             	add    $0x10,%esp
80100e3c:	85 c0                	test   %eax,%eax
80100e3e:	0f 8e 9b 00 00 00    	jle    80100edf <fileclose+0xbf>
    panic("fileclose");
  if(--f->ref > 0){
80100e44:	83 e8 01             	sub    $0x1,%eax
80100e47:	85 c0                	test   %eax,%eax
80100e49:	89 47 04             	mov    %eax,0x4(%edi)
80100e4c:	74 1a                	je     80100e68 <fileclose+0x48>
    release(&ftable.lock);
80100e4e:	c7 45 08 e0 0f 11 80 	movl   $0x80110fe0,0x8(%ebp)
  else if(ff.type == FD_INODE){
    begin_op();
    iput(ff.ip);
    end_op();
  }
}
80100e55:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100e58:	5b                   	pop    %ebx
80100e59:	5e                   	pop    %esi
80100e5a:	5f                   	pop    %edi
80100e5b:	5d                   	pop    %ebp

  acquire(&ftable.lock);
  if(f->ref < 1)
    panic("fileclose");
  if(--f->ref > 0){
    release(&ftable.lock);
80100e5c:	e9 af 3b 00 00       	jmp    80104a10 <release>
80100e61:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return;
  }
  ff = *f;
80100e68:	0f b6 47 09          	movzbl 0x9(%edi),%eax
80100e6c:	8b 1f                	mov    (%edi),%ebx
  f->ref = 0;
  f->type = FD_NONE;
  release(&ftable.lock);
80100e6e:	83 ec 0c             	sub    $0xc,%esp
    panic("fileclose");
  if(--f->ref > 0){
    release(&ftable.lock);
    return;
  }
  ff = *f;
80100e71:	8b 77 0c             	mov    0xc(%edi),%esi
  f->ref = 0;
  f->type = FD_NONE;
80100e74:	c7 07 00 00 00 00    	movl   $0x0,(%edi)
    panic("fileclose");
  if(--f->ref > 0){
    release(&ftable.lock);
    return;
  }
  ff = *f;
80100e7a:	88 45 e7             	mov    %al,-0x19(%ebp)
80100e7d:	8b 47 10             	mov    0x10(%edi),%eax
  f->ref = 0;
  f->type = FD_NONE;
  release(&ftable.lock);
80100e80:	68 e0 0f 11 80       	push   $0x80110fe0
    panic("fileclose");
  if(--f->ref > 0){
    release(&ftable.lock);
    return;
  }
  ff = *f;
80100e85:	89 45 e0             	mov    %eax,-0x20(%ebp)
  f->ref = 0;
  f->type = FD_NONE;
  release(&ftable.lock);
80100e88:	e8 83 3b 00 00       	call   80104a10 <release>

  if(ff.type == FD_PIPE)
80100e8d:	83 c4 10             	add    $0x10,%esp
80100e90:	83 fb 01             	cmp    $0x1,%ebx
80100e93:	74 13                	je     80100ea8 <fileclose+0x88>
    pipeclose(ff.pipe, ff.writable);
  else if(ff.type == FD_INODE){
80100e95:	83 fb 02             	cmp    $0x2,%ebx
80100e98:	74 26                	je     80100ec0 <fileclose+0xa0>
    begin_op();
    iput(ff.ip);
    end_op();
  }
}
80100e9a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100e9d:	5b                   	pop    %ebx
80100e9e:	5e                   	pop    %esi
80100e9f:	5f                   	pop    %edi
80100ea0:	5d                   	pop    %ebp
80100ea1:	c3                   	ret    
80100ea2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  f->ref = 0;
  f->type = FD_NONE;
  release(&ftable.lock);

  if(ff.type == FD_PIPE)
    pipeclose(ff.pipe, ff.writable);
80100ea8:	0f be 5d e7          	movsbl -0x19(%ebp),%ebx
80100eac:	83 ec 08             	sub    $0x8,%esp
80100eaf:	53                   	push   %ebx
80100eb0:	56                   	push   %esi
80100eb1:	e8 4a 24 00 00       	call   80103300 <pipeclose>
80100eb6:	83 c4 10             	add    $0x10,%esp
80100eb9:	eb df                	jmp    80100e9a <fileclose+0x7a>
80100ebb:	90                   	nop
80100ebc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  else if(ff.type == FD_INODE){
    begin_op();
80100ec0:	e8 ab 1c 00 00       	call   80102b70 <begin_op>
    iput(ff.ip);
80100ec5:	83 ec 0c             	sub    $0xc,%esp
80100ec8:	ff 75 e0             	pushl  -0x20(%ebp)
80100ecb:	e8 d0 08 00 00       	call   801017a0 <iput>
    end_op();
80100ed0:	83 c4 10             	add    $0x10,%esp
  }
}
80100ed3:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100ed6:	5b                   	pop    %ebx
80100ed7:	5e                   	pop    %esi
80100ed8:	5f                   	pop    %edi
80100ed9:	5d                   	pop    %ebp
  if(ff.type == FD_PIPE)
    pipeclose(ff.pipe, ff.writable);
  else if(ff.type == FD_INODE){
    begin_op();
    iput(ff.ip);
    end_op();
80100eda:	e9 01 1d 00 00       	jmp    80102be0 <end_op>
{
  struct file ff;

  acquire(&ftable.lock);
  if(f->ref < 1)
    panic("fileclose");
80100edf:	83 ec 0c             	sub    $0xc,%esp
80100ee2:	68 bc 76 10 80       	push   $0x801076bc
80100ee7:	e8 84 f4 ff ff       	call   80100370 <panic>
80100eec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100ef0 <filestat>:
}

// Get metadata about file f.
int
filestat(struct file *f, struct stat *st)
{
80100ef0:	55                   	push   %ebp
80100ef1:	89 e5                	mov    %esp,%ebp
80100ef3:	53                   	push   %ebx
80100ef4:	83 ec 04             	sub    $0x4,%esp
80100ef7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(f->type == FD_INODE){
80100efa:	83 3b 02             	cmpl   $0x2,(%ebx)
80100efd:	75 31                	jne    80100f30 <filestat+0x40>
    ilock(f->ip);
80100eff:	83 ec 0c             	sub    $0xc,%esp
80100f02:	ff 73 10             	pushl  0x10(%ebx)
80100f05:	e8 66 07 00 00       	call   80101670 <ilock>
    stati(f->ip, st);
80100f0a:	58                   	pop    %eax
80100f0b:	5a                   	pop    %edx
80100f0c:	ff 75 0c             	pushl  0xc(%ebp)
80100f0f:	ff 73 10             	pushl  0x10(%ebx)
80100f12:	e8 09 0a 00 00       	call   80101920 <stati>
    iunlock(f->ip);
80100f17:	59                   	pop    %ecx
80100f18:	ff 73 10             	pushl  0x10(%ebx)
80100f1b:	e8 30 08 00 00       	call   80101750 <iunlock>
    return 0;
80100f20:	83 c4 10             	add    $0x10,%esp
80100f23:	31 c0                	xor    %eax,%eax
  }
  return -1;
}
80100f25:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100f28:	c9                   	leave  
80100f29:	c3                   	ret    
80100f2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    ilock(f->ip);
    stati(f->ip, st);
    iunlock(f->ip);
    return 0;
  }
  return -1;
80100f30:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80100f35:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100f38:	c9                   	leave  
80100f39:	c3                   	ret    
80100f3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100f40 <fileread>:

// Read from file f.
int
fileread(struct file *f, char *addr, int n)
{
80100f40:	55                   	push   %ebp
80100f41:	89 e5                	mov    %esp,%ebp
80100f43:	57                   	push   %edi
80100f44:	56                   	push   %esi
80100f45:	53                   	push   %ebx
80100f46:	83 ec 0c             	sub    $0xc,%esp
80100f49:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100f4c:	8b 75 0c             	mov    0xc(%ebp),%esi
80100f4f:	8b 7d 10             	mov    0x10(%ebp),%edi
  int r;

  if(f->readable == 0)
80100f52:	80 7b 08 00          	cmpb   $0x0,0x8(%ebx)
80100f56:	74 60                	je     80100fb8 <fileread+0x78>
    return -1;
  if(f->type == FD_PIPE)
80100f58:	8b 03                	mov    (%ebx),%eax
80100f5a:	83 f8 01             	cmp    $0x1,%eax
80100f5d:	74 41                	je     80100fa0 <fileread+0x60>
    return piperead(f->pipe, addr, n);
  if(f->type == FD_INODE){
80100f5f:	83 f8 02             	cmp    $0x2,%eax
80100f62:	75 5b                	jne    80100fbf <fileread+0x7f>
    ilock(f->ip);
80100f64:	83 ec 0c             	sub    $0xc,%esp
80100f67:	ff 73 10             	pushl  0x10(%ebx)
80100f6a:	e8 01 07 00 00       	call   80101670 <ilock>
    if((r = readi(f->ip, addr, f->off, n)) > 0)
80100f6f:	57                   	push   %edi
80100f70:	ff 73 14             	pushl  0x14(%ebx)
80100f73:	56                   	push   %esi
80100f74:	ff 73 10             	pushl  0x10(%ebx)
80100f77:	e8 d4 09 00 00       	call   80101950 <readi>
80100f7c:	83 c4 20             	add    $0x20,%esp
80100f7f:	85 c0                	test   %eax,%eax
80100f81:	89 c6                	mov    %eax,%esi
80100f83:	7e 03                	jle    80100f88 <fileread+0x48>
      f->off += r;
80100f85:	01 43 14             	add    %eax,0x14(%ebx)
    iunlock(f->ip);
80100f88:	83 ec 0c             	sub    $0xc,%esp
80100f8b:	ff 73 10             	pushl  0x10(%ebx)
80100f8e:	e8 bd 07 00 00       	call   80101750 <iunlock>
    return r;
80100f93:	83 c4 10             	add    $0x10,%esp
  }
  panic("fileread");
}
80100f96:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100f99:	89 f0                	mov    %esi,%eax
80100f9b:	5b                   	pop    %ebx
80100f9c:	5e                   	pop    %esi
80100f9d:	5f                   	pop    %edi
80100f9e:	5d                   	pop    %ebp
80100f9f:	c3                   	ret    
  int r;

  if(f->readable == 0)
    return -1;
  if(f->type == FD_PIPE)
    return piperead(f->pipe, addr, n);
80100fa0:	8b 43 0c             	mov    0xc(%ebx),%eax
80100fa3:	89 45 08             	mov    %eax,0x8(%ebp)
      f->off += r;
    iunlock(f->ip);
    return r;
  }
  panic("fileread");
}
80100fa6:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100fa9:	5b                   	pop    %ebx
80100faa:	5e                   	pop    %esi
80100fab:	5f                   	pop    %edi
80100fac:	5d                   	pop    %ebp
  int r;

  if(f->readable == 0)
    return -1;
  if(f->type == FD_PIPE)
    return piperead(f->pipe, addr, n);
80100fad:	e9 fe 24 00 00       	jmp    801034b0 <piperead>
80100fb2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
fileread(struct file *f, char *addr, int n)
{
  int r;

  if(f->readable == 0)
    return -1;
80100fb8:	be ff ff ff ff       	mov    $0xffffffff,%esi
80100fbd:	eb d7                	jmp    80100f96 <fileread+0x56>
    if((r = readi(f->ip, addr, f->off, n)) > 0)
      f->off += r;
    iunlock(f->ip);
    return r;
  }
  panic("fileread");
80100fbf:	83 ec 0c             	sub    $0xc,%esp
80100fc2:	68 c6 76 10 80       	push   $0x801076c6
80100fc7:	e8 a4 f3 ff ff       	call   80100370 <panic>
80100fcc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100fd0 <filewrite>:

//PAGEBREAK!
// Write to file f.
int
filewrite(struct file *f, char *addr, int n)
{
80100fd0:	55                   	push   %ebp
80100fd1:	89 e5                	mov    %esp,%ebp
80100fd3:	57                   	push   %edi
80100fd4:	56                   	push   %esi
80100fd5:	53                   	push   %ebx
80100fd6:	83 ec 1c             	sub    $0x1c,%esp
80100fd9:	8b 75 08             	mov    0x8(%ebp),%esi
80100fdc:	8b 45 0c             	mov    0xc(%ebp),%eax
  int r;

  if(f->writable == 0)
80100fdf:	80 7e 09 00          	cmpb   $0x0,0x9(%esi)

//PAGEBREAK!
// Write to file f.
int
filewrite(struct file *f, char *addr, int n)
{
80100fe3:	89 45 dc             	mov    %eax,-0x24(%ebp)
80100fe6:	8b 45 10             	mov    0x10(%ebp),%eax
80100fe9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  int r;

  if(f->writable == 0)
80100fec:	0f 84 aa 00 00 00    	je     8010109c <filewrite+0xcc>
    return -1;
  if(f->type == FD_PIPE)
80100ff2:	8b 06                	mov    (%esi),%eax
80100ff4:	83 f8 01             	cmp    $0x1,%eax
80100ff7:	0f 84 c2 00 00 00    	je     801010bf <filewrite+0xef>
    return pipewrite(f->pipe, addr, n);
  if(f->type == FD_INODE){
80100ffd:	83 f8 02             	cmp    $0x2,%eax
80101000:	0f 85 e4 00 00 00    	jne    801010ea <filewrite+0x11a>
    // and 2 blocks of slop for non-aligned writes.
    // this really belongs lower down, since writei()
    // might be writing a device like the console.
    int max = ((MAXOPBLOCKS-1-1-2) / 2) * 512;
    int i = 0;
    while(i < n){
80101006:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101009:	31 ff                	xor    %edi,%edi
8010100b:	85 c0                	test   %eax,%eax
8010100d:	7f 34                	jg     80101043 <filewrite+0x73>
8010100f:	e9 9c 00 00 00       	jmp    801010b0 <filewrite+0xe0>
80101014:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        n1 = max;

      begin_op();
      ilock(f->ip);
      if ((r = writei(f->ip, addr + i, f->off, n1)) > 0)
        f->off += r;
80101018:	01 46 14             	add    %eax,0x14(%esi)
      iunlock(f->ip);
8010101b:	83 ec 0c             	sub    $0xc,%esp
8010101e:	ff 76 10             	pushl  0x10(%esi)
        n1 = max;

      begin_op();
      ilock(f->ip);
      if ((r = writei(f->ip, addr + i, f->off, n1)) > 0)
        f->off += r;
80101021:	89 45 e0             	mov    %eax,-0x20(%ebp)
      iunlock(f->ip);
80101024:	e8 27 07 00 00       	call   80101750 <iunlock>
      end_op();
80101029:	e8 b2 1b 00 00       	call   80102be0 <end_op>
8010102e:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101031:	83 c4 10             	add    $0x10,%esp

      if(r < 0)
        break;
      if(r != n1)
80101034:	39 d8                	cmp    %ebx,%eax
80101036:	0f 85 a1 00 00 00    	jne    801010dd <filewrite+0x10d>
        panic("short filewrite");
      i += r;
8010103c:	01 c7                	add    %eax,%edi
    // and 2 blocks of slop for non-aligned writes.
    // this really belongs lower down, since writei()
    // might be writing a device like the console.
    int max = ((MAXOPBLOCKS-1-1-2) / 2) * 512;
    int i = 0;
    while(i < n){
8010103e:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
80101041:	7e 6d                	jle    801010b0 <filewrite+0xe0>
      int n1 = n - i;
80101043:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80101046:	b8 00 06 00 00       	mov    $0x600,%eax
8010104b:	29 fb                	sub    %edi,%ebx
8010104d:	81 fb 00 06 00 00    	cmp    $0x600,%ebx
80101053:	0f 4f d8             	cmovg  %eax,%ebx
      if(n1 > max)
        n1 = max;

      begin_op();
80101056:	e8 15 1b 00 00       	call   80102b70 <begin_op>
      ilock(f->ip);
8010105b:	83 ec 0c             	sub    $0xc,%esp
8010105e:	ff 76 10             	pushl  0x10(%esi)
80101061:	e8 0a 06 00 00       	call   80101670 <ilock>
      if ((r = writei(f->ip, addr + i, f->off, n1)) > 0)
80101066:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101069:	53                   	push   %ebx
8010106a:	ff 76 14             	pushl  0x14(%esi)
8010106d:	01 f8                	add    %edi,%eax
8010106f:	50                   	push   %eax
80101070:	ff 76 10             	pushl  0x10(%esi)
80101073:	e8 d8 09 00 00       	call   80101a50 <writei>
80101078:	83 c4 20             	add    $0x20,%esp
8010107b:	85 c0                	test   %eax,%eax
8010107d:	7f 99                	jg     80101018 <filewrite+0x48>
        f->off += r;
      iunlock(f->ip);
8010107f:	83 ec 0c             	sub    $0xc,%esp
80101082:	ff 76 10             	pushl  0x10(%esi)
80101085:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101088:	e8 c3 06 00 00       	call   80101750 <iunlock>
      end_op();
8010108d:	e8 4e 1b 00 00       	call   80102be0 <end_op>

      if(r < 0)
80101092:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101095:	83 c4 10             	add    $0x10,%esp
80101098:	85 c0                	test   %eax,%eax
8010109a:	74 98                	je     80101034 <filewrite+0x64>
      i += r;
    }
    return i == n ? n : -1;
  }
  panic("filewrite");
}
8010109c:	8d 65 f4             	lea    -0xc(%ebp),%esp
filewrite(struct file *f, char *addr, int n)
{
  int r;

  if(f->writable == 0)
    return -1;
8010109f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
      i += r;
    }
    return i == n ? n : -1;
  }
  panic("filewrite");
}
801010a4:	5b                   	pop    %ebx
801010a5:	5e                   	pop    %esi
801010a6:	5f                   	pop    %edi
801010a7:	5d                   	pop    %ebp
801010a8:	c3                   	ret    
801010a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        break;
      if(r != n1)
        panic("short filewrite");
      i += r;
    }
    return i == n ? n : -1;
801010b0:	3b 7d e4             	cmp    -0x1c(%ebp),%edi
801010b3:	75 e7                	jne    8010109c <filewrite+0xcc>
  }
  panic("filewrite");
}
801010b5:	8d 65 f4             	lea    -0xc(%ebp),%esp
801010b8:	89 f8                	mov    %edi,%eax
801010ba:	5b                   	pop    %ebx
801010bb:	5e                   	pop    %esi
801010bc:	5f                   	pop    %edi
801010bd:	5d                   	pop    %ebp
801010be:	c3                   	ret    
  int r;

  if(f->writable == 0)
    return -1;
  if(f->type == FD_PIPE)
    return pipewrite(f->pipe, addr, n);
801010bf:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801010c2:	89 45 10             	mov    %eax,0x10(%ebp)
801010c5:	8b 45 dc             	mov    -0x24(%ebp),%eax
801010c8:	89 45 0c             	mov    %eax,0xc(%ebp)
801010cb:	8b 46 0c             	mov    0xc(%esi),%eax
801010ce:	89 45 08             	mov    %eax,0x8(%ebp)
      i += r;
    }
    return i == n ? n : -1;
  }
  panic("filewrite");
}
801010d1:	8d 65 f4             	lea    -0xc(%ebp),%esp
801010d4:	5b                   	pop    %ebx
801010d5:	5e                   	pop    %esi
801010d6:	5f                   	pop    %edi
801010d7:	5d                   	pop    %ebp
  int r;

  if(f->writable == 0)
    return -1;
  if(f->type == FD_PIPE)
    return pipewrite(f->pipe, addr, n);
801010d8:	e9 c3 22 00 00       	jmp    801033a0 <pipewrite>
      end_op();

      if(r < 0)
        break;
      if(r != n1)
        panic("short filewrite");
801010dd:	83 ec 0c             	sub    $0xc,%esp
801010e0:	68 cf 76 10 80       	push   $0x801076cf
801010e5:	e8 86 f2 ff ff       	call   80100370 <panic>
      i += r;
    }
    return i == n ? n : -1;
  }
  panic("filewrite");
801010ea:	83 ec 0c             	sub    $0xc,%esp
801010ed:	68 d5 76 10 80       	push   $0x801076d5
801010f2:	e8 79 f2 ff ff       	call   80100370 <panic>
801010f7:	66 90                	xchg   %ax,%ax
801010f9:	66 90                	xchg   %ax,%ax
801010fb:	66 90                	xchg   %ax,%ax
801010fd:	66 90                	xchg   %ax,%ax
801010ff:	90                   	nop

80101100 <balloc>:
// Blocks.

// Allocate a zeroed disk block.
static uint
balloc(uint dev)
{
80101100:	55                   	push   %ebp
80101101:	89 e5                	mov    %esp,%ebp
80101103:	57                   	push   %edi
80101104:	56                   	push   %esi
80101105:	53                   	push   %ebx
80101106:	83 ec 1c             	sub    $0x1c,%esp
  int b, bi, m;
  struct buf *bp;

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
80101109:	8b 0d e0 19 11 80    	mov    0x801119e0,%ecx
// Blocks.

// Allocate a zeroed disk block.
static uint
balloc(uint dev)
{
8010110f:	89 45 d8             	mov    %eax,-0x28(%ebp)
  int b, bi, m;
  struct buf *bp;

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
80101112:	85 c9                	test   %ecx,%ecx
80101114:	0f 84 87 00 00 00    	je     801011a1 <balloc+0xa1>
8010111a:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    bp = bread(dev, BBLOCK(b, sb));
80101121:	8b 75 dc             	mov    -0x24(%ebp),%esi
80101124:	83 ec 08             	sub    $0x8,%esp
80101127:	89 f0                	mov    %esi,%eax
80101129:	c1 f8 0c             	sar    $0xc,%eax
8010112c:	03 05 f8 19 11 80    	add    0x801119f8,%eax
80101132:	50                   	push   %eax
80101133:	ff 75 d8             	pushl  -0x28(%ebp)
80101136:	e8 95 ef ff ff       	call   801000d0 <bread>
8010113b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010113e:	a1 e0 19 11 80       	mov    0x801119e0,%eax
80101143:	83 c4 10             	add    $0x10,%esp
80101146:	89 45 e0             	mov    %eax,-0x20(%ebp)
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
80101149:	31 c0                	xor    %eax,%eax
8010114b:	eb 2f                	jmp    8010117c <balloc+0x7c>
8010114d:	8d 76 00             	lea    0x0(%esi),%esi
      m = 1 << (bi % 8);
80101150:	89 c1                	mov    %eax,%ecx
      if((bp->data[bi/8] & m) == 0){  // Is block free?
80101152:	8b 55 e4             	mov    -0x1c(%ebp),%edx

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
    bp = bread(dev, BBLOCK(b, sb));
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
      m = 1 << (bi % 8);
80101155:	bb 01 00 00 00       	mov    $0x1,%ebx
8010115a:	83 e1 07             	and    $0x7,%ecx
8010115d:	d3 e3                	shl    %cl,%ebx
      if((bp->data[bi/8] & m) == 0){  // Is block free?
8010115f:	89 c1                	mov    %eax,%ecx
80101161:	c1 f9 03             	sar    $0x3,%ecx
80101164:	0f b6 7c 0a 5c       	movzbl 0x5c(%edx,%ecx,1),%edi
80101169:	85 df                	test   %ebx,%edi
8010116b:	89 fa                	mov    %edi,%edx
8010116d:	74 41                	je     801011b0 <balloc+0xb0>
  struct buf *bp;

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
    bp = bread(dev, BBLOCK(b, sb));
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
8010116f:	83 c0 01             	add    $0x1,%eax
80101172:	83 c6 01             	add    $0x1,%esi
80101175:	3d 00 10 00 00       	cmp    $0x1000,%eax
8010117a:	74 05                	je     80101181 <balloc+0x81>
8010117c:	3b 75 e0             	cmp    -0x20(%ebp),%esi
8010117f:	72 cf                	jb     80101150 <balloc+0x50>
        brelse(bp);
        bzero(dev, b + bi);
        return b + bi;
      }
    }
    brelse(bp);
80101181:	83 ec 0c             	sub    $0xc,%esp
80101184:	ff 75 e4             	pushl  -0x1c(%ebp)
80101187:	e8 54 f0 ff ff       	call   801001e0 <brelse>
{
  int b, bi, m;
  struct buf *bp;

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
8010118c:	81 45 dc 00 10 00 00 	addl   $0x1000,-0x24(%ebp)
80101193:	83 c4 10             	add    $0x10,%esp
80101196:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101199:	39 05 e0 19 11 80    	cmp    %eax,0x801119e0
8010119f:	77 80                	ja     80101121 <balloc+0x21>
        return b + bi;
      }
    }
    brelse(bp);
  }
  panic("balloc: out of blocks");
801011a1:	83 ec 0c             	sub    $0xc,%esp
801011a4:	68 df 76 10 80       	push   $0x801076df
801011a9:	e8 c2 f1 ff ff       	call   80100370 <panic>
801011ae:	66 90                	xchg   %ax,%ax
  for(b = 0; b < sb.size; b += BPB){
    bp = bread(dev, BBLOCK(b, sb));
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
      m = 1 << (bi % 8);
      if((bp->data[bi/8] & m) == 0){  // Is block free?
        bp->data[bi/8] |= m;  // Mark block in use.
801011b0:	8b 7d e4             	mov    -0x1c(%ebp),%edi
        log_write(bp);
801011b3:	83 ec 0c             	sub    $0xc,%esp
  for(b = 0; b < sb.size; b += BPB){
    bp = bread(dev, BBLOCK(b, sb));
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
      m = 1 << (bi % 8);
      if((bp->data[bi/8] & m) == 0){  // Is block free?
        bp->data[bi/8] |= m;  // Mark block in use.
801011b6:	09 da                	or     %ebx,%edx
801011b8:	88 54 0f 5c          	mov    %dl,0x5c(%edi,%ecx,1)
        log_write(bp);
801011bc:	57                   	push   %edi
801011bd:	e8 8e 1b 00 00       	call   80102d50 <log_write>
        brelse(bp);
801011c2:	89 3c 24             	mov    %edi,(%esp)
801011c5:	e8 16 f0 ff ff       	call   801001e0 <brelse>
static void
bzero(int dev, int bno)
{
  struct buf *bp;

  bp = bread(dev, bno);
801011ca:	58                   	pop    %eax
801011cb:	5a                   	pop    %edx
801011cc:	56                   	push   %esi
801011cd:	ff 75 d8             	pushl  -0x28(%ebp)
801011d0:	e8 fb ee ff ff       	call   801000d0 <bread>
801011d5:	89 c3                	mov    %eax,%ebx
  memset(bp->data, 0, BSIZE);
801011d7:	8d 40 5c             	lea    0x5c(%eax),%eax
801011da:	83 c4 0c             	add    $0xc,%esp
801011dd:	68 00 02 00 00       	push   $0x200
801011e2:	6a 00                	push   $0x0
801011e4:	50                   	push   %eax
801011e5:	e8 76 38 00 00       	call   80104a60 <memset>
  log_write(bp);
801011ea:	89 1c 24             	mov    %ebx,(%esp)
801011ed:	e8 5e 1b 00 00       	call   80102d50 <log_write>
  brelse(bp);
801011f2:	89 1c 24             	mov    %ebx,(%esp)
801011f5:	e8 e6 ef ff ff       	call   801001e0 <brelse>
      }
    }
    brelse(bp);
  }
  panic("balloc: out of blocks");
}
801011fa:	8d 65 f4             	lea    -0xc(%ebp),%esp
801011fd:	89 f0                	mov    %esi,%eax
801011ff:	5b                   	pop    %ebx
80101200:	5e                   	pop    %esi
80101201:	5f                   	pop    %edi
80101202:	5d                   	pop    %ebp
80101203:	c3                   	ret    
80101204:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010120a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80101210 <iget>:
// Find the inode with number inum on device dev
// and return the in-memory copy. Does not lock
// the inode and does not read it from disk.
static struct inode*
iget(uint dev, uint inum)
{
80101210:	55                   	push   %ebp
80101211:	89 e5                	mov    %esp,%ebp
80101213:	57                   	push   %edi
80101214:	56                   	push   %esi
80101215:	53                   	push   %ebx
80101216:	89 c7                	mov    %eax,%edi
  struct inode *ip, *empty;

  acquire(&icache.lock);

  // Is the inode already cached?
  empty = 0;
80101218:	31 f6                	xor    %esi,%esi
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
8010121a:	bb 34 1a 11 80       	mov    $0x80111a34,%ebx
// Find the inode with number inum on device dev
// and return the in-memory copy. Does not lock
// the inode and does not read it from disk.
static struct inode*
iget(uint dev, uint inum)
{
8010121f:	83 ec 28             	sub    $0x28,%esp
80101222:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  struct inode *ip, *empty;

  acquire(&icache.lock);
80101225:	68 00 1a 11 80       	push   $0x80111a00
8010122a:	e8 c1 36 00 00       	call   801048f0 <acquire>
8010122f:	83 c4 10             	add    $0x10,%esp

  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
80101232:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101235:	eb 1b                	jmp    80101252 <iget+0x42>
80101237:	89 f6                	mov    %esi,%esi
80101239:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
      ip->ref++;
      release(&icache.lock);
      return ip;
    }
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
80101240:	85 f6                	test   %esi,%esi
80101242:	74 44                	je     80101288 <iget+0x78>

  acquire(&icache.lock);

  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
80101244:	81 c3 90 00 00 00    	add    $0x90,%ebx
8010124a:	81 fb 54 36 11 80    	cmp    $0x80113654,%ebx
80101250:	73 4e                	jae    801012a0 <iget+0x90>
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
80101252:	8b 4b 08             	mov    0x8(%ebx),%ecx
80101255:	85 c9                	test   %ecx,%ecx
80101257:	7e e7                	jle    80101240 <iget+0x30>
80101259:	39 3b                	cmp    %edi,(%ebx)
8010125b:	75 e3                	jne    80101240 <iget+0x30>
8010125d:	39 53 04             	cmp    %edx,0x4(%ebx)
80101260:	75 de                	jne    80101240 <iget+0x30>
      ip->ref++;
      release(&icache.lock);
80101262:	83 ec 0c             	sub    $0xc,%esp

  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
      ip->ref++;
80101265:	83 c1 01             	add    $0x1,%ecx
      release(&icache.lock);
      return ip;
80101268:	89 de                	mov    %ebx,%esi
  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
      ip->ref++;
      release(&icache.lock);
8010126a:	68 00 1a 11 80       	push   $0x80111a00

  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
      ip->ref++;
8010126f:	89 4b 08             	mov    %ecx,0x8(%ebx)
      release(&icache.lock);
80101272:	e8 99 37 00 00       	call   80104a10 <release>
      return ip;
80101277:	83 c4 10             	add    $0x10,%esp
  ip->ref = 1;
  ip->valid = 0;
  release(&icache.lock);

  return ip;
}
8010127a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010127d:	89 f0                	mov    %esi,%eax
8010127f:	5b                   	pop    %ebx
80101280:	5e                   	pop    %esi
80101281:	5f                   	pop    %edi
80101282:	5d                   	pop    %ebp
80101283:	c3                   	ret    
80101284:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
      ip->ref++;
      release(&icache.lock);
      return ip;
    }
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
80101288:	85 c9                	test   %ecx,%ecx
8010128a:	0f 44 f3             	cmove  %ebx,%esi

  acquire(&icache.lock);

  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
8010128d:	81 c3 90 00 00 00    	add    $0x90,%ebx
80101293:	81 fb 54 36 11 80    	cmp    $0x80113654,%ebx
80101299:	72 b7                	jb     80101252 <iget+0x42>
8010129b:	90                   	nop
8010129c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
      empty = ip;
  }

  // Recycle an inode cache entry.
  if(empty == 0)
801012a0:	85 f6                	test   %esi,%esi
801012a2:	74 2d                	je     801012d1 <iget+0xc1>
  ip = empty;
  ip->dev = dev;
  ip->inum = inum;
  ip->ref = 1;
  ip->valid = 0;
  release(&icache.lock);
801012a4:	83 ec 0c             	sub    $0xc,%esp
  // Recycle an inode cache entry.
  if(empty == 0)
    panic("iget: no inodes");

  ip = empty;
  ip->dev = dev;
801012a7:	89 3e                	mov    %edi,(%esi)
  ip->inum = inum;
801012a9:	89 56 04             	mov    %edx,0x4(%esi)
  ip->ref = 1;
801012ac:	c7 46 08 01 00 00 00 	movl   $0x1,0x8(%esi)
  ip->valid = 0;
801012b3:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
  release(&icache.lock);
801012ba:	68 00 1a 11 80       	push   $0x80111a00
801012bf:	e8 4c 37 00 00       	call   80104a10 <release>

  return ip;
801012c4:	83 c4 10             	add    $0x10,%esp
}
801012c7:	8d 65 f4             	lea    -0xc(%ebp),%esp
801012ca:	89 f0                	mov    %esi,%eax
801012cc:	5b                   	pop    %ebx
801012cd:	5e                   	pop    %esi
801012ce:	5f                   	pop    %edi
801012cf:	5d                   	pop    %ebp
801012d0:	c3                   	ret    
      empty = ip;
  }

  // Recycle an inode cache entry.
  if(empty == 0)
    panic("iget: no inodes");
801012d1:	83 ec 0c             	sub    $0xc,%esp
801012d4:	68 f5 76 10 80       	push   $0x801076f5
801012d9:	e8 92 f0 ff ff       	call   80100370 <panic>
801012de:	66 90                	xchg   %ax,%ax

801012e0 <bmap>:

// Return the disk block address of the nth block in inode ip.
// If there is no such block, bmap allocates one.
static uint
bmap(struct inode *ip, uint bn)
{
801012e0:	55                   	push   %ebp
801012e1:	89 e5                	mov    %esp,%ebp
801012e3:	57                   	push   %edi
801012e4:	56                   	push   %esi
801012e5:	53                   	push   %ebx
801012e6:	89 c6                	mov    %eax,%esi
801012e8:	83 ec 1c             	sub    $0x1c,%esp
  uint addr, *a;
  struct buf *bp;

  if(bn < NDIRECT){
801012eb:	83 fa 0b             	cmp    $0xb,%edx
801012ee:	77 18                	ja     80101308 <bmap+0x28>
801012f0:	8d 3c 90             	lea    (%eax,%edx,4),%edi
    if((addr = ip->addrs[bn]) == 0)
801012f3:	8b 5f 5c             	mov    0x5c(%edi),%ebx
801012f6:	85 db                	test   %ebx,%ebx
801012f8:	74 76                	je     80101370 <bmap+0x90>
    brelse(bp);
    return addr;
  }

  panic("bmap: out of range");
}
801012fa:	8d 65 f4             	lea    -0xc(%ebp),%esp
801012fd:	89 d8                	mov    %ebx,%eax
801012ff:	5b                   	pop    %ebx
80101300:	5e                   	pop    %esi
80101301:	5f                   	pop    %edi
80101302:	5d                   	pop    %ebp
80101303:	c3                   	ret    
80101304:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if(bn < NDIRECT){
    if((addr = ip->addrs[bn]) == 0)
      ip->addrs[bn] = addr = balloc(ip->dev);
    return addr;
  }
  bn -= NDIRECT;
80101308:	8d 5a f4             	lea    -0xc(%edx),%ebx

  if(bn < NINDIRECT){
8010130b:	83 fb 7f             	cmp    $0x7f,%ebx
8010130e:	0f 87 8e 00 00 00    	ja     801013a2 <bmap+0xc2>
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0)
80101314:	8b 80 8c 00 00 00    	mov    0x8c(%eax),%eax
8010131a:	85 c0                	test   %eax,%eax
8010131c:	74 72                	je     80101390 <bmap+0xb0>
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
    bp = bread(ip->dev, addr);
8010131e:	83 ec 08             	sub    $0x8,%esp
80101321:	50                   	push   %eax
80101322:	ff 36                	pushl  (%esi)
80101324:	e8 a7 ed ff ff       	call   801000d0 <bread>
    a = (uint*)bp->data;
    if((addr = a[bn]) == 0){
80101329:	8d 54 98 5c          	lea    0x5c(%eax,%ebx,4),%edx
8010132d:	83 c4 10             	add    $0x10,%esp

  if(bn < NINDIRECT){
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0)
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
    bp = bread(ip->dev, addr);
80101330:	89 c7                	mov    %eax,%edi
    a = (uint*)bp->data;
    if((addr = a[bn]) == 0){
80101332:	8b 1a                	mov    (%edx),%ebx
80101334:	85 db                	test   %ebx,%ebx
80101336:	75 1d                	jne    80101355 <bmap+0x75>
      a[bn] = addr = balloc(ip->dev);
80101338:	8b 06                	mov    (%esi),%eax
8010133a:	89 55 e4             	mov    %edx,-0x1c(%ebp)
8010133d:	e8 be fd ff ff       	call   80101100 <balloc>
80101342:	8b 55 e4             	mov    -0x1c(%ebp),%edx
      log_write(bp);
80101345:	83 ec 0c             	sub    $0xc,%esp
    if((addr = ip->addrs[NDIRECT]) == 0)
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
    bp = bread(ip->dev, addr);
    a = (uint*)bp->data;
    if((addr = a[bn]) == 0){
      a[bn] = addr = balloc(ip->dev);
80101348:	89 c3                	mov    %eax,%ebx
8010134a:	89 02                	mov    %eax,(%edx)
      log_write(bp);
8010134c:	57                   	push   %edi
8010134d:	e8 fe 19 00 00       	call   80102d50 <log_write>
80101352:	83 c4 10             	add    $0x10,%esp
    }
    brelse(bp);
80101355:	83 ec 0c             	sub    $0xc,%esp
80101358:	57                   	push   %edi
80101359:	e8 82 ee ff ff       	call   801001e0 <brelse>
8010135e:	83 c4 10             	add    $0x10,%esp
    return addr;
  }

  panic("bmap: out of range");
}
80101361:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101364:	89 d8                	mov    %ebx,%eax
80101366:	5b                   	pop    %ebx
80101367:	5e                   	pop    %esi
80101368:	5f                   	pop    %edi
80101369:	5d                   	pop    %ebp
8010136a:	c3                   	ret    
8010136b:	90                   	nop
8010136c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  uint addr, *a;
  struct buf *bp;

  if(bn < NDIRECT){
    if((addr = ip->addrs[bn]) == 0)
      ip->addrs[bn] = addr = balloc(ip->dev);
80101370:	8b 00                	mov    (%eax),%eax
80101372:	e8 89 fd ff ff       	call   80101100 <balloc>
80101377:	89 47 5c             	mov    %eax,0x5c(%edi)
    brelse(bp);
    return addr;
  }

  panic("bmap: out of range");
}
8010137a:	8d 65 f4             	lea    -0xc(%ebp),%esp
  uint addr, *a;
  struct buf *bp;

  if(bn < NDIRECT){
    if((addr = ip->addrs[bn]) == 0)
      ip->addrs[bn] = addr = balloc(ip->dev);
8010137d:	89 c3                	mov    %eax,%ebx
    brelse(bp);
    return addr;
  }

  panic("bmap: out of range");
}
8010137f:	89 d8                	mov    %ebx,%eax
80101381:	5b                   	pop    %ebx
80101382:	5e                   	pop    %esi
80101383:	5f                   	pop    %edi
80101384:	5d                   	pop    %ebp
80101385:	c3                   	ret    
80101386:	8d 76 00             	lea    0x0(%esi),%esi
80101389:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  bn -= NDIRECT;

  if(bn < NINDIRECT){
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0)
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
80101390:	8b 06                	mov    (%esi),%eax
80101392:	e8 69 fd ff ff       	call   80101100 <balloc>
80101397:	89 86 8c 00 00 00    	mov    %eax,0x8c(%esi)
8010139d:	e9 7c ff ff ff       	jmp    8010131e <bmap+0x3e>
    }
    brelse(bp);
    return addr;
  }

  panic("bmap: out of range");
801013a2:	83 ec 0c             	sub    $0xc,%esp
801013a5:	68 05 77 10 80       	push   $0x80107705
801013aa:	e8 c1 ef ff ff       	call   80100370 <panic>
801013af:	90                   	nop

801013b0 <readsb>:
struct superblock sb; 

// Read the super block.
void
readsb(int dev, struct superblock *sb)
{
801013b0:	55                   	push   %ebp
801013b1:	89 e5                	mov    %esp,%ebp
801013b3:	56                   	push   %esi
801013b4:	53                   	push   %ebx
801013b5:	8b 75 0c             	mov    0xc(%ebp),%esi
  struct buf *bp;

  bp = bread(dev, 1);
801013b8:	83 ec 08             	sub    $0x8,%esp
801013bb:	6a 01                	push   $0x1
801013bd:	ff 75 08             	pushl  0x8(%ebp)
801013c0:	e8 0b ed ff ff       	call   801000d0 <bread>
801013c5:	89 c3                	mov    %eax,%ebx
  memmove(sb, bp->data, sizeof(*sb));
801013c7:	8d 40 5c             	lea    0x5c(%eax),%eax
801013ca:	83 c4 0c             	add    $0xc,%esp
801013cd:	6a 1c                	push   $0x1c
801013cf:	50                   	push   %eax
801013d0:	56                   	push   %esi
801013d1:	e8 3a 37 00 00       	call   80104b10 <memmove>
  brelse(bp);
801013d6:	89 5d 08             	mov    %ebx,0x8(%ebp)
801013d9:	83 c4 10             	add    $0x10,%esp
}
801013dc:	8d 65 f8             	lea    -0x8(%ebp),%esp
801013df:	5b                   	pop    %ebx
801013e0:	5e                   	pop    %esi
801013e1:	5d                   	pop    %ebp
{
  struct buf *bp;

  bp = bread(dev, 1);
  memmove(sb, bp->data, sizeof(*sb));
  brelse(bp);
801013e2:	e9 f9 ed ff ff       	jmp    801001e0 <brelse>
801013e7:	89 f6                	mov    %esi,%esi
801013e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801013f0 <bfree>:
}

// Free a disk block.
static void
bfree(int dev, uint b)
{
801013f0:	55                   	push   %ebp
801013f1:	89 e5                	mov    %esp,%ebp
801013f3:	56                   	push   %esi
801013f4:	53                   	push   %ebx
801013f5:	89 d3                	mov    %edx,%ebx
801013f7:	89 c6                	mov    %eax,%esi
  struct buf *bp;
  int bi, m;

  readsb(dev, &sb);
801013f9:	83 ec 08             	sub    $0x8,%esp
801013fc:	68 e0 19 11 80       	push   $0x801119e0
80101401:	50                   	push   %eax
80101402:	e8 a9 ff ff ff       	call   801013b0 <readsb>
  bp = bread(dev, BBLOCK(b, sb));
80101407:	58                   	pop    %eax
80101408:	5a                   	pop    %edx
80101409:	89 da                	mov    %ebx,%edx
8010140b:	c1 ea 0c             	shr    $0xc,%edx
8010140e:	03 15 f8 19 11 80    	add    0x801119f8,%edx
80101414:	52                   	push   %edx
80101415:	56                   	push   %esi
80101416:	e8 b5 ec ff ff       	call   801000d0 <bread>
  bi = b % BPB;
  m = 1 << (bi % 8);
8010141b:	89 d9                	mov    %ebx,%ecx
  if((bp->data[bi/8] & m) == 0)
8010141d:	c1 fb 03             	sar    $0x3,%ebx
  int bi, m;

  readsb(dev, &sb);
  bp = bread(dev, BBLOCK(b, sb));
  bi = b % BPB;
  m = 1 << (bi % 8);
80101420:	ba 01 00 00 00       	mov    $0x1,%edx
80101425:	83 e1 07             	and    $0x7,%ecx
  if((bp->data[bi/8] & m) == 0)
80101428:	81 e3 ff 01 00 00    	and    $0x1ff,%ebx
8010142e:	83 c4 10             	add    $0x10,%esp
  int bi, m;

  readsb(dev, &sb);
  bp = bread(dev, BBLOCK(b, sb));
  bi = b % BPB;
  m = 1 << (bi % 8);
80101431:	d3 e2                	shl    %cl,%edx
  if((bp->data[bi/8] & m) == 0)
80101433:	0f b6 4c 18 5c       	movzbl 0x5c(%eax,%ebx,1),%ecx
80101438:	85 d1                	test   %edx,%ecx
8010143a:	74 25                	je     80101461 <bfree+0x71>
    panic("freeing free block");
  bp->data[bi/8] &= ~m;
8010143c:	f7 d2                	not    %edx
8010143e:	89 c6                	mov    %eax,%esi
  log_write(bp);
80101440:	83 ec 0c             	sub    $0xc,%esp
  bp = bread(dev, BBLOCK(b, sb));
  bi = b % BPB;
  m = 1 << (bi % 8);
  if((bp->data[bi/8] & m) == 0)
    panic("freeing free block");
  bp->data[bi/8] &= ~m;
80101443:	21 ca                	and    %ecx,%edx
80101445:	88 54 1e 5c          	mov    %dl,0x5c(%esi,%ebx,1)
  log_write(bp);
80101449:	56                   	push   %esi
8010144a:	e8 01 19 00 00       	call   80102d50 <log_write>
  brelse(bp);
8010144f:	89 34 24             	mov    %esi,(%esp)
80101452:	e8 89 ed ff ff       	call   801001e0 <brelse>
}
80101457:	83 c4 10             	add    $0x10,%esp
8010145a:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010145d:	5b                   	pop    %ebx
8010145e:	5e                   	pop    %esi
8010145f:	5d                   	pop    %ebp
80101460:	c3                   	ret    
  readsb(dev, &sb);
  bp = bread(dev, BBLOCK(b, sb));
  bi = b % BPB;
  m = 1 << (bi % 8);
  if((bp->data[bi/8] & m) == 0)
    panic("freeing free block");
80101461:	83 ec 0c             	sub    $0xc,%esp
80101464:	68 18 77 10 80       	push   $0x80107718
80101469:	e8 02 ef ff ff       	call   80100370 <panic>
8010146e:	66 90                	xchg   %ax,%ax

80101470 <iinit>:
  struct inode inode[NINODE];
} icache;

void
iinit(int dev)
{
80101470:	55                   	push   %ebp
80101471:	89 e5                	mov    %esp,%ebp
80101473:	53                   	push   %ebx
80101474:	bb 40 1a 11 80       	mov    $0x80111a40,%ebx
80101479:	83 ec 0c             	sub    $0xc,%esp
  int i = 0;
  
  initlock(&icache.lock, "icache");
8010147c:	68 2b 77 10 80       	push   $0x8010772b
80101481:	68 00 1a 11 80       	push   $0x80111a00
80101486:	e8 65 33 00 00       	call   801047f0 <initlock>
8010148b:	83 c4 10             	add    $0x10,%esp
8010148e:	66 90                	xchg   %ax,%ax
  for(i = 0; i < NINODE; i++) {
    initsleeplock(&icache.inode[i].lock, "inode");
80101490:	83 ec 08             	sub    $0x8,%esp
80101493:	68 32 77 10 80       	push   $0x80107732
80101498:	53                   	push   %ebx
80101499:	81 c3 90 00 00 00    	add    $0x90,%ebx
8010149f:	e8 3c 32 00 00       	call   801046e0 <initsleeplock>
iinit(int dev)
{
  int i = 0;
  
  initlock(&icache.lock, "icache");
  for(i = 0; i < NINODE; i++) {
801014a4:	83 c4 10             	add    $0x10,%esp
801014a7:	81 fb 60 36 11 80    	cmp    $0x80113660,%ebx
801014ad:	75 e1                	jne    80101490 <iinit+0x20>
    initsleeplock(&icache.inode[i].lock, "inode");
  }

  readsb(dev, &sb);
801014af:	83 ec 08             	sub    $0x8,%esp
801014b2:	68 e0 19 11 80       	push   $0x801119e0
801014b7:	ff 75 08             	pushl  0x8(%ebp)
801014ba:	e8 f1 fe ff ff       	call   801013b0 <readsb>
  cprintf("sb: size %d nblocks %d ninodes %d nlog %d logstart %d\
801014bf:	ff 35 f8 19 11 80    	pushl  0x801119f8
801014c5:	ff 35 f4 19 11 80    	pushl  0x801119f4
801014cb:	ff 35 f0 19 11 80    	pushl  0x801119f0
801014d1:	ff 35 ec 19 11 80    	pushl  0x801119ec
801014d7:	ff 35 e8 19 11 80    	pushl  0x801119e8
801014dd:	ff 35 e4 19 11 80    	pushl  0x801119e4
801014e3:	ff 35 e0 19 11 80    	pushl  0x801119e0
801014e9:	68 98 77 10 80       	push   $0x80107798
801014ee:	e8 6d f1 ff ff       	call   80100660 <cprintf>
 inodestart %d bmap start %d\n", sb.size, sb.nblocks,
          sb.ninodes, sb.nlog, sb.logstart, sb.inodestart,
          sb.bmapstart);
}
801014f3:	83 c4 30             	add    $0x30,%esp
801014f6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801014f9:	c9                   	leave  
801014fa:	c3                   	ret    
801014fb:	90                   	nop
801014fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101500 <ialloc>:
// Allocate an inode on device dev.
// Mark it as allocated by  giving it type type.
// Returns an unlocked but allocated and referenced inode.
struct inode*
ialloc(uint dev, short type)
{
80101500:	55                   	push   %ebp
80101501:	89 e5                	mov    %esp,%ebp
80101503:	57                   	push   %edi
80101504:	56                   	push   %esi
80101505:	53                   	push   %ebx
80101506:	83 ec 1c             	sub    $0x1c,%esp
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
80101509:	83 3d e8 19 11 80 01 	cmpl   $0x1,0x801119e8
// Allocate an inode on device dev.
// Mark it as allocated by  giving it type type.
// Returns an unlocked but allocated and referenced inode.
struct inode*
ialloc(uint dev, short type)
{
80101510:	8b 45 0c             	mov    0xc(%ebp),%eax
80101513:	8b 75 08             	mov    0x8(%ebp),%esi
80101516:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
80101519:	0f 86 91 00 00 00    	jbe    801015b0 <ialloc+0xb0>
8010151f:	bb 01 00 00 00       	mov    $0x1,%ebx
80101524:	eb 21                	jmp    80101547 <ialloc+0x47>
80101526:	8d 76 00             	lea    0x0(%esi),%esi
80101529:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      dip->type = type;
      log_write(bp);   // mark it allocated on the disk
      brelse(bp);
      return iget(dev, inum);
    }
    brelse(bp);
80101530:	83 ec 0c             	sub    $0xc,%esp
{
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
80101533:	83 c3 01             	add    $0x1,%ebx
      dip->type = type;
      log_write(bp);   // mark it allocated on the disk
      brelse(bp);
      return iget(dev, inum);
    }
    brelse(bp);
80101536:	57                   	push   %edi
80101537:	e8 a4 ec ff ff       	call   801001e0 <brelse>
{
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
8010153c:	83 c4 10             	add    $0x10,%esp
8010153f:	39 1d e8 19 11 80    	cmp    %ebx,0x801119e8
80101545:	76 69                	jbe    801015b0 <ialloc+0xb0>
    bp = bread(dev, IBLOCK(inum, sb));
80101547:	89 d8                	mov    %ebx,%eax
80101549:	83 ec 08             	sub    $0x8,%esp
8010154c:	c1 e8 03             	shr    $0x3,%eax
8010154f:	03 05 f4 19 11 80    	add    0x801119f4,%eax
80101555:	50                   	push   %eax
80101556:	56                   	push   %esi
80101557:	e8 74 eb ff ff       	call   801000d0 <bread>
8010155c:	89 c7                	mov    %eax,%edi
    dip = (struct dinode*)bp->data + inum%IPB;
8010155e:	89 d8                	mov    %ebx,%eax
    if(dip->type == 0){  // a free inode
80101560:	83 c4 10             	add    $0x10,%esp
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
    bp = bread(dev, IBLOCK(inum, sb));
    dip = (struct dinode*)bp->data + inum%IPB;
80101563:	83 e0 07             	and    $0x7,%eax
80101566:	c1 e0 06             	shl    $0x6,%eax
80101569:	8d 4c 07 5c          	lea    0x5c(%edi,%eax,1),%ecx
    if(dip->type == 0){  // a free inode
8010156d:	66 83 39 00          	cmpw   $0x0,(%ecx)
80101571:	75 bd                	jne    80101530 <ialloc+0x30>
      memset(dip, 0, sizeof(*dip));
80101573:	83 ec 04             	sub    $0x4,%esp
80101576:	89 4d e0             	mov    %ecx,-0x20(%ebp)
80101579:	6a 40                	push   $0x40
8010157b:	6a 00                	push   $0x0
8010157d:	51                   	push   %ecx
8010157e:	e8 dd 34 00 00       	call   80104a60 <memset>
      dip->type = type;
80101583:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
80101587:	8b 4d e0             	mov    -0x20(%ebp),%ecx
8010158a:	66 89 01             	mov    %ax,(%ecx)
      log_write(bp);   // mark it allocated on the disk
8010158d:	89 3c 24             	mov    %edi,(%esp)
80101590:	e8 bb 17 00 00       	call   80102d50 <log_write>
      brelse(bp);
80101595:	89 3c 24             	mov    %edi,(%esp)
80101598:	e8 43 ec ff ff       	call   801001e0 <brelse>
      return iget(dev, inum);
8010159d:	83 c4 10             	add    $0x10,%esp
    }
    brelse(bp);
  }
  panic("ialloc: no inodes");
}
801015a0:	8d 65 f4             	lea    -0xc(%ebp),%esp
    if(dip->type == 0){  // a free inode
      memset(dip, 0, sizeof(*dip));
      dip->type = type;
      log_write(bp);   // mark it allocated on the disk
      brelse(bp);
      return iget(dev, inum);
801015a3:	89 da                	mov    %ebx,%edx
801015a5:	89 f0                	mov    %esi,%eax
    }
    brelse(bp);
  }
  panic("ialloc: no inodes");
}
801015a7:	5b                   	pop    %ebx
801015a8:	5e                   	pop    %esi
801015a9:	5f                   	pop    %edi
801015aa:	5d                   	pop    %ebp
    if(dip->type == 0){  // a free inode
      memset(dip, 0, sizeof(*dip));
      dip->type = type;
      log_write(bp);   // mark it allocated on the disk
      brelse(bp);
      return iget(dev, inum);
801015ab:	e9 60 fc ff ff       	jmp    80101210 <iget>
    }
    brelse(bp);
  }
  panic("ialloc: no inodes");
801015b0:	83 ec 0c             	sub    $0xc,%esp
801015b3:	68 38 77 10 80       	push   $0x80107738
801015b8:	e8 b3 ed ff ff       	call   80100370 <panic>
801015bd:	8d 76 00             	lea    0x0(%esi),%esi

801015c0 <iupdate>:
// Must be called after every change to an ip->xxx field
// that lives on disk, since i-node cache is write-through.
// Caller must hold ip->lock.
void
iupdate(struct inode *ip)
{
801015c0:	55                   	push   %ebp
801015c1:	89 e5                	mov    %esp,%ebp
801015c3:	56                   	push   %esi
801015c4:	53                   	push   %ebx
801015c5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct buf *bp;
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
801015c8:	83 ec 08             	sub    $0x8,%esp
801015cb:	8b 43 04             	mov    0x4(%ebx),%eax
  dip->type = ip->type;
  dip->major = ip->major;
  dip->minor = ip->minor;
  dip->nlink = ip->nlink;
  dip->size = ip->size;
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
801015ce:	83 c3 5c             	add    $0x5c,%ebx
iupdate(struct inode *ip)
{
  struct buf *bp;
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
801015d1:	c1 e8 03             	shr    $0x3,%eax
801015d4:	03 05 f4 19 11 80    	add    0x801119f4,%eax
801015da:	50                   	push   %eax
801015db:	ff 73 a4             	pushl  -0x5c(%ebx)
801015de:	e8 ed ea ff ff       	call   801000d0 <bread>
801015e3:	89 c6                	mov    %eax,%esi
  dip = (struct dinode*)bp->data + ip->inum%IPB;
801015e5:	8b 43 a8             	mov    -0x58(%ebx),%eax
  dip->type = ip->type;
801015e8:	0f b7 53 f4          	movzwl -0xc(%ebx),%edx
  dip->major = ip->major;
  dip->minor = ip->minor;
  dip->nlink = ip->nlink;
  dip->size = ip->size;
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
801015ec:	83 c4 0c             	add    $0xc,%esp
{
  struct buf *bp;
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
  dip = (struct dinode*)bp->data + ip->inum%IPB;
801015ef:	83 e0 07             	and    $0x7,%eax
801015f2:	c1 e0 06             	shl    $0x6,%eax
801015f5:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
  dip->type = ip->type;
801015f9:	66 89 10             	mov    %dx,(%eax)
  dip->major = ip->major;
801015fc:	0f b7 53 f6          	movzwl -0xa(%ebx),%edx
  dip->minor = ip->minor;
  dip->nlink = ip->nlink;
  dip->size = ip->size;
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
80101600:	83 c0 0c             	add    $0xc,%eax
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
  dip = (struct dinode*)bp->data + ip->inum%IPB;
  dip->type = ip->type;
  dip->major = ip->major;
80101603:	66 89 50 f6          	mov    %dx,-0xa(%eax)
  dip->minor = ip->minor;
80101607:	0f b7 53 f8          	movzwl -0x8(%ebx),%edx
8010160b:	66 89 50 f8          	mov    %dx,-0x8(%eax)
  dip->nlink = ip->nlink;
8010160f:	0f b7 53 fa          	movzwl -0x6(%ebx),%edx
80101613:	66 89 50 fa          	mov    %dx,-0x6(%eax)
  dip->size = ip->size;
80101617:	8b 53 fc             	mov    -0x4(%ebx),%edx
8010161a:	89 50 fc             	mov    %edx,-0x4(%eax)
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
8010161d:	6a 34                	push   $0x34
8010161f:	53                   	push   %ebx
80101620:	50                   	push   %eax
80101621:	e8 ea 34 00 00       	call   80104b10 <memmove>
  log_write(bp);
80101626:	89 34 24             	mov    %esi,(%esp)
80101629:	e8 22 17 00 00       	call   80102d50 <log_write>
  brelse(bp);
8010162e:	89 75 08             	mov    %esi,0x8(%ebp)
80101631:	83 c4 10             	add    $0x10,%esp
}
80101634:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101637:	5b                   	pop    %ebx
80101638:	5e                   	pop    %esi
80101639:	5d                   	pop    %ebp
  dip->minor = ip->minor;
  dip->nlink = ip->nlink;
  dip->size = ip->size;
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
  log_write(bp);
  brelse(bp);
8010163a:	e9 a1 eb ff ff       	jmp    801001e0 <brelse>
8010163f:	90                   	nop

80101640 <idup>:

// Increment reference count for ip.
// Returns ip to enable ip = idup(ip1) idiom.
struct inode*
idup(struct inode *ip)
{
80101640:	55                   	push   %ebp
80101641:	89 e5                	mov    %esp,%ebp
80101643:	53                   	push   %ebx
80101644:	83 ec 10             	sub    $0x10,%esp
80101647:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&icache.lock);
8010164a:	68 00 1a 11 80       	push   $0x80111a00
8010164f:	e8 9c 32 00 00       	call   801048f0 <acquire>
  ip->ref++;
80101654:	83 43 08 01          	addl   $0x1,0x8(%ebx)
  release(&icache.lock);
80101658:	c7 04 24 00 1a 11 80 	movl   $0x80111a00,(%esp)
8010165f:	e8 ac 33 00 00       	call   80104a10 <release>
  return ip;
}
80101664:	89 d8                	mov    %ebx,%eax
80101666:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101669:	c9                   	leave  
8010166a:	c3                   	ret    
8010166b:	90                   	nop
8010166c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101670 <ilock>:

// Lock the given inode.
// Reads the inode from disk if necessary.
void
ilock(struct inode *ip)
{
80101670:	55                   	push   %ebp
80101671:	89 e5                	mov    %esp,%ebp
80101673:	56                   	push   %esi
80101674:	53                   	push   %ebx
80101675:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct buf *bp;
  struct dinode *dip;

  if(ip == 0 || ip->ref < 1)
80101678:	85 db                	test   %ebx,%ebx
8010167a:	0f 84 b7 00 00 00    	je     80101737 <ilock+0xc7>
80101680:	8b 53 08             	mov    0x8(%ebx),%edx
80101683:	85 d2                	test   %edx,%edx
80101685:	0f 8e ac 00 00 00    	jle    80101737 <ilock+0xc7>
    panic("ilock");

  acquiresleep(&ip->lock);
8010168b:	8d 43 0c             	lea    0xc(%ebx),%eax
8010168e:	83 ec 0c             	sub    $0xc,%esp
80101691:	50                   	push   %eax
80101692:	e8 89 30 00 00       	call   80104720 <acquiresleep>

  if(ip->valid == 0){
80101697:	8b 43 4c             	mov    0x4c(%ebx),%eax
8010169a:	83 c4 10             	add    $0x10,%esp
8010169d:	85 c0                	test   %eax,%eax
8010169f:	74 0f                	je     801016b0 <ilock+0x40>
    brelse(bp);
    ip->valid = 1;
    if(ip->type == 0)
      panic("ilock: no type");
  }
}
801016a1:	8d 65 f8             	lea    -0x8(%ebp),%esp
801016a4:	5b                   	pop    %ebx
801016a5:	5e                   	pop    %esi
801016a6:	5d                   	pop    %ebp
801016a7:	c3                   	ret    
801016a8:	90                   	nop
801016a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    panic("ilock");

  acquiresleep(&ip->lock);

  if(ip->valid == 0){
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
801016b0:	8b 43 04             	mov    0x4(%ebx),%eax
801016b3:	83 ec 08             	sub    $0x8,%esp
801016b6:	c1 e8 03             	shr    $0x3,%eax
801016b9:	03 05 f4 19 11 80    	add    0x801119f4,%eax
801016bf:	50                   	push   %eax
801016c0:	ff 33                	pushl  (%ebx)
801016c2:	e8 09 ea ff ff       	call   801000d0 <bread>
801016c7:	89 c6                	mov    %eax,%esi
    dip = (struct dinode*)bp->data + ip->inum%IPB;
801016c9:	8b 43 04             	mov    0x4(%ebx),%eax
    ip->type = dip->type;
    ip->major = dip->major;
    ip->minor = dip->minor;
    ip->nlink = dip->nlink;
    ip->size = dip->size;
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
801016cc:	83 c4 0c             	add    $0xc,%esp

  acquiresleep(&ip->lock);

  if(ip->valid == 0){
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
    dip = (struct dinode*)bp->data + ip->inum%IPB;
801016cf:	83 e0 07             	and    $0x7,%eax
801016d2:	c1 e0 06             	shl    $0x6,%eax
801016d5:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
    ip->type = dip->type;
801016d9:	0f b7 10             	movzwl (%eax),%edx
    ip->major = dip->major;
    ip->minor = dip->minor;
    ip->nlink = dip->nlink;
    ip->size = dip->size;
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
801016dc:	83 c0 0c             	add    $0xc,%eax
  acquiresleep(&ip->lock);

  if(ip->valid == 0){
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
    dip = (struct dinode*)bp->data + ip->inum%IPB;
    ip->type = dip->type;
801016df:	66 89 53 50          	mov    %dx,0x50(%ebx)
    ip->major = dip->major;
801016e3:	0f b7 50 f6          	movzwl -0xa(%eax),%edx
801016e7:	66 89 53 52          	mov    %dx,0x52(%ebx)
    ip->minor = dip->minor;
801016eb:	0f b7 50 f8          	movzwl -0x8(%eax),%edx
801016ef:	66 89 53 54          	mov    %dx,0x54(%ebx)
    ip->nlink = dip->nlink;
801016f3:	0f b7 50 fa          	movzwl -0x6(%eax),%edx
801016f7:	66 89 53 56          	mov    %dx,0x56(%ebx)
    ip->size = dip->size;
801016fb:	8b 50 fc             	mov    -0x4(%eax),%edx
801016fe:	89 53 58             	mov    %edx,0x58(%ebx)
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
80101701:	6a 34                	push   $0x34
80101703:	50                   	push   %eax
80101704:	8d 43 5c             	lea    0x5c(%ebx),%eax
80101707:	50                   	push   %eax
80101708:	e8 03 34 00 00       	call   80104b10 <memmove>
    brelse(bp);
8010170d:	89 34 24             	mov    %esi,(%esp)
80101710:	e8 cb ea ff ff       	call   801001e0 <brelse>
    ip->valid = 1;
    if(ip->type == 0)
80101715:	83 c4 10             	add    $0x10,%esp
80101718:	66 83 7b 50 00       	cmpw   $0x0,0x50(%ebx)
    ip->minor = dip->minor;
    ip->nlink = dip->nlink;
    ip->size = dip->size;
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
    brelse(bp);
    ip->valid = 1;
8010171d:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
    if(ip->type == 0)
80101724:	0f 85 77 ff ff ff    	jne    801016a1 <ilock+0x31>
      panic("ilock: no type");
8010172a:	83 ec 0c             	sub    $0xc,%esp
8010172d:	68 50 77 10 80       	push   $0x80107750
80101732:	e8 39 ec ff ff       	call   80100370 <panic>
{
  struct buf *bp;
  struct dinode *dip;

  if(ip == 0 || ip->ref < 1)
    panic("ilock");
80101737:	83 ec 0c             	sub    $0xc,%esp
8010173a:	68 4a 77 10 80       	push   $0x8010774a
8010173f:	e8 2c ec ff ff       	call   80100370 <panic>
80101744:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010174a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80101750 <iunlock>:
}

// Unlock the given inode.
void
iunlock(struct inode *ip)
{
80101750:	55                   	push   %ebp
80101751:	89 e5                	mov    %esp,%ebp
80101753:	56                   	push   %esi
80101754:	53                   	push   %ebx
80101755:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
80101758:	85 db                	test   %ebx,%ebx
8010175a:	74 28                	je     80101784 <iunlock+0x34>
8010175c:	8d 73 0c             	lea    0xc(%ebx),%esi
8010175f:	83 ec 0c             	sub    $0xc,%esp
80101762:	56                   	push   %esi
80101763:	e8 58 30 00 00       	call   801047c0 <holdingsleep>
80101768:	83 c4 10             	add    $0x10,%esp
8010176b:	85 c0                	test   %eax,%eax
8010176d:	74 15                	je     80101784 <iunlock+0x34>
8010176f:	8b 43 08             	mov    0x8(%ebx),%eax
80101772:	85 c0                	test   %eax,%eax
80101774:	7e 0e                	jle    80101784 <iunlock+0x34>
    panic("iunlock");

  releasesleep(&ip->lock);
80101776:	89 75 08             	mov    %esi,0x8(%ebp)
}
80101779:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010177c:	5b                   	pop    %ebx
8010177d:	5e                   	pop    %esi
8010177e:	5d                   	pop    %ebp
iunlock(struct inode *ip)
{
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
    panic("iunlock");

  releasesleep(&ip->lock);
8010177f:	e9 fc 2f 00 00       	jmp    80104780 <releasesleep>
// Unlock the given inode.
void
iunlock(struct inode *ip)
{
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
    panic("iunlock");
80101784:	83 ec 0c             	sub    $0xc,%esp
80101787:	68 5f 77 10 80       	push   $0x8010775f
8010178c:	e8 df eb ff ff       	call   80100370 <panic>
80101791:	eb 0d                	jmp    801017a0 <iput>
80101793:	90                   	nop
80101794:	90                   	nop
80101795:	90                   	nop
80101796:	90                   	nop
80101797:	90                   	nop
80101798:	90                   	nop
80101799:	90                   	nop
8010179a:	90                   	nop
8010179b:	90                   	nop
8010179c:	90                   	nop
8010179d:	90                   	nop
8010179e:	90                   	nop
8010179f:	90                   	nop

801017a0 <iput>:
// to it, free the inode (and its content) on disk.
// All calls to iput() must be inside a transaction in
// case it has to free the inode.
void
iput(struct inode *ip)
{
801017a0:	55                   	push   %ebp
801017a1:	89 e5                	mov    %esp,%ebp
801017a3:	57                   	push   %edi
801017a4:	56                   	push   %esi
801017a5:	53                   	push   %ebx
801017a6:	83 ec 28             	sub    $0x28,%esp
801017a9:	8b 75 08             	mov    0x8(%ebp),%esi
  acquiresleep(&ip->lock);
801017ac:	8d 7e 0c             	lea    0xc(%esi),%edi
801017af:	57                   	push   %edi
801017b0:	e8 6b 2f 00 00       	call   80104720 <acquiresleep>
  if(ip->valid && ip->nlink == 0){
801017b5:	8b 56 4c             	mov    0x4c(%esi),%edx
801017b8:	83 c4 10             	add    $0x10,%esp
801017bb:	85 d2                	test   %edx,%edx
801017bd:	74 07                	je     801017c6 <iput+0x26>
801017bf:	66 83 7e 56 00       	cmpw   $0x0,0x56(%esi)
801017c4:	74 32                	je     801017f8 <iput+0x58>
      ip->type = 0;
      iupdate(ip);
      ip->valid = 0;
    }
  }
  releasesleep(&ip->lock);
801017c6:	83 ec 0c             	sub    $0xc,%esp
801017c9:	57                   	push   %edi
801017ca:	e8 b1 2f 00 00       	call   80104780 <releasesleep>

  acquire(&icache.lock);
801017cf:	c7 04 24 00 1a 11 80 	movl   $0x80111a00,(%esp)
801017d6:	e8 15 31 00 00       	call   801048f0 <acquire>
  ip->ref--;
801017db:	83 6e 08 01          	subl   $0x1,0x8(%esi)
  release(&icache.lock);
801017df:	83 c4 10             	add    $0x10,%esp
801017e2:	c7 45 08 00 1a 11 80 	movl   $0x80111a00,0x8(%ebp)
}
801017e9:	8d 65 f4             	lea    -0xc(%ebp),%esp
801017ec:	5b                   	pop    %ebx
801017ed:	5e                   	pop    %esi
801017ee:	5f                   	pop    %edi
801017ef:	5d                   	pop    %ebp
  }
  releasesleep(&ip->lock);

  acquire(&icache.lock);
  ip->ref--;
  release(&icache.lock);
801017f0:	e9 1b 32 00 00       	jmp    80104a10 <release>
801017f5:	8d 76 00             	lea    0x0(%esi),%esi
void
iput(struct inode *ip)
{
  acquiresleep(&ip->lock);
  if(ip->valid && ip->nlink == 0){
    acquire(&icache.lock);
801017f8:	83 ec 0c             	sub    $0xc,%esp
801017fb:	68 00 1a 11 80       	push   $0x80111a00
80101800:	e8 eb 30 00 00       	call   801048f0 <acquire>
    int r = ip->ref;
80101805:	8b 5e 08             	mov    0x8(%esi),%ebx
    release(&icache.lock);
80101808:	c7 04 24 00 1a 11 80 	movl   $0x80111a00,(%esp)
8010180f:	e8 fc 31 00 00       	call   80104a10 <release>
    if(r == 1){
80101814:	83 c4 10             	add    $0x10,%esp
80101817:	83 fb 01             	cmp    $0x1,%ebx
8010181a:	75 aa                	jne    801017c6 <iput+0x26>
8010181c:	8d 8e 8c 00 00 00    	lea    0x8c(%esi),%ecx
80101822:	89 7d e4             	mov    %edi,-0x1c(%ebp)
80101825:	8d 5e 5c             	lea    0x5c(%esi),%ebx
80101828:	89 cf                	mov    %ecx,%edi
8010182a:	eb 0b                	jmp    80101837 <iput+0x97>
8010182c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101830:	83 c3 04             	add    $0x4,%ebx
{
  int i, j;
  struct buf *bp;
  uint *a;

  for(i = 0; i < NDIRECT; i++){
80101833:	39 fb                	cmp    %edi,%ebx
80101835:	74 19                	je     80101850 <iput+0xb0>
    if(ip->addrs[i]){
80101837:	8b 13                	mov    (%ebx),%edx
80101839:	85 d2                	test   %edx,%edx
8010183b:	74 f3                	je     80101830 <iput+0x90>
      bfree(ip->dev, ip->addrs[i]);
8010183d:	8b 06                	mov    (%esi),%eax
8010183f:	e8 ac fb ff ff       	call   801013f0 <bfree>
      ip->addrs[i] = 0;
80101844:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
8010184a:	eb e4                	jmp    80101830 <iput+0x90>
8010184c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
  }

  if(ip->addrs[NDIRECT]){
80101850:	8b 86 8c 00 00 00    	mov    0x8c(%esi),%eax
80101856:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80101859:	85 c0                	test   %eax,%eax
8010185b:	75 33                	jne    80101890 <iput+0xf0>
    bfree(ip->dev, ip->addrs[NDIRECT]);
    ip->addrs[NDIRECT] = 0;
  }

  ip->size = 0;
  iupdate(ip);
8010185d:	83 ec 0c             	sub    $0xc,%esp
    brelse(bp);
    bfree(ip->dev, ip->addrs[NDIRECT]);
    ip->addrs[NDIRECT] = 0;
  }

  ip->size = 0;
80101860:	c7 46 58 00 00 00 00 	movl   $0x0,0x58(%esi)
  iupdate(ip);
80101867:	56                   	push   %esi
80101868:	e8 53 fd ff ff       	call   801015c0 <iupdate>
    int r = ip->ref;
    release(&icache.lock);
    if(r == 1){
      // inode has no links and no other references: truncate and free.
      itrunc(ip);
      ip->type = 0;
8010186d:	31 c0                	xor    %eax,%eax
8010186f:	66 89 46 50          	mov    %ax,0x50(%esi)
      iupdate(ip);
80101873:	89 34 24             	mov    %esi,(%esp)
80101876:	e8 45 fd ff ff       	call   801015c0 <iupdate>
      ip->valid = 0;
8010187b:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
80101882:	83 c4 10             	add    $0x10,%esp
80101885:	e9 3c ff ff ff       	jmp    801017c6 <iput+0x26>
8010188a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      ip->addrs[i] = 0;
    }
  }

  if(ip->addrs[NDIRECT]){
    bp = bread(ip->dev, ip->addrs[NDIRECT]);
80101890:	83 ec 08             	sub    $0x8,%esp
80101893:	50                   	push   %eax
80101894:	ff 36                	pushl  (%esi)
80101896:	e8 35 e8 ff ff       	call   801000d0 <bread>
8010189b:	8d 88 5c 02 00 00    	lea    0x25c(%eax),%ecx
801018a1:	89 7d e0             	mov    %edi,-0x20(%ebp)
801018a4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    a = (uint*)bp->data;
801018a7:	8d 58 5c             	lea    0x5c(%eax),%ebx
801018aa:	83 c4 10             	add    $0x10,%esp
801018ad:	89 cf                	mov    %ecx,%edi
801018af:	eb 0e                	jmp    801018bf <iput+0x11f>
801018b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801018b8:	83 c3 04             	add    $0x4,%ebx
    for(j = 0; j < NINDIRECT; j++){
801018bb:	39 fb                	cmp    %edi,%ebx
801018bd:	74 0f                	je     801018ce <iput+0x12e>
      if(a[j])
801018bf:	8b 13                	mov    (%ebx),%edx
801018c1:	85 d2                	test   %edx,%edx
801018c3:	74 f3                	je     801018b8 <iput+0x118>
        bfree(ip->dev, a[j]);
801018c5:	8b 06                	mov    (%esi),%eax
801018c7:	e8 24 fb ff ff       	call   801013f0 <bfree>
801018cc:	eb ea                	jmp    801018b8 <iput+0x118>
    }
    brelse(bp);
801018ce:	83 ec 0c             	sub    $0xc,%esp
801018d1:	ff 75 e4             	pushl  -0x1c(%ebp)
801018d4:	8b 7d e0             	mov    -0x20(%ebp),%edi
801018d7:	e8 04 e9 ff ff       	call   801001e0 <brelse>
    bfree(ip->dev, ip->addrs[NDIRECT]);
801018dc:	8b 96 8c 00 00 00    	mov    0x8c(%esi),%edx
801018e2:	8b 06                	mov    (%esi),%eax
801018e4:	e8 07 fb ff ff       	call   801013f0 <bfree>
    ip->addrs[NDIRECT] = 0;
801018e9:	c7 86 8c 00 00 00 00 	movl   $0x0,0x8c(%esi)
801018f0:	00 00 00 
801018f3:	83 c4 10             	add    $0x10,%esp
801018f6:	e9 62 ff ff ff       	jmp    8010185d <iput+0xbd>
801018fb:	90                   	nop
801018fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101900 <iunlockput>:
}

// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
80101900:	55                   	push   %ebp
80101901:	89 e5                	mov    %esp,%ebp
80101903:	53                   	push   %ebx
80101904:	83 ec 10             	sub    $0x10,%esp
80101907:	8b 5d 08             	mov    0x8(%ebp),%ebx
  iunlock(ip);
8010190a:	53                   	push   %ebx
8010190b:	e8 40 fe ff ff       	call   80101750 <iunlock>
  iput(ip);
80101910:	89 5d 08             	mov    %ebx,0x8(%ebp)
80101913:	83 c4 10             	add    $0x10,%esp
}
80101916:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101919:	c9                   	leave  
// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
  iunlock(ip);
  iput(ip);
8010191a:	e9 81 fe ff ff       	jmp    801017a0 <iput>
8010191f:	90                   	nop

80101920 <stati>:

// Copy stat information from inode.
// Caller must hold ip->lock.
void
stati(struct inode *ip, struct stat *st)
{
80101920:	55                   	push   %ebp
80101921:	89 e5                	mov    %esp,%ebp
80101923:	8b 55 08             	mov    0x8(%ebp),%edx
80101926:	8b 45 0c             	mov    0xc(%ebp),%eax
  st->dev = ip->dev;
80101929:	8b 0a                	mov    (%edx),%ecx
8010192b:	89 48 04             	mov    %ecx,0x4(%eax)
  st->ino = ip->inum;
8010192e:	8b 4a 04             	mov    0x4(%edx),%ecx
80101931:	89 48 08             	mov    %ecx,0x8(%eax)
  st->type = ip->type;
80101934:	0f b7 4a 50          	movzwl 0x50(%edx),%ecx
80101938:	66 89 08             	mov    %cx,(%eax)
  st->nlink = ip->nlink;
8010193b:	0f b7 4a 56          	movzwl 0x56(%edx),%ecx
8010193f:	66 89 48 0c          	mov    %cx,0xc(%eax)
  st->size = ip->size;
80101943:	8b 52 58             	mov    0x58(%edx),%edx
80101946:	89 50 10             	mov    %edx,0x10(%eax)
}
80101949:	5d                   	pop    %ebp
8010194a:	c3                   	ret    
8010194b:	90                   	nop
8010194c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101950 <readi>:
//PAGEBREAK!
// Read data from inode.
// Caller must hold ip->lock.
int
readi(struct inode *ip, char *dst, uint off, uint n)
{
80101950:	55                   	push   %ebp
80101951:	89 e5                	mov    %esp,%ebp
80101953:	57                   	push   %edi
80101954:	56                   	push   %esi
80101955:	53                   	push   %ebx
80101956:	83 ec 1c             	sub    $0x1c,%esp
80101959:	8b 45 08             	mov    0x8(%ebp),%eax
8010195c:	8b 7d 0c             	mov    0xc(%ebp),%edi
8010195f:	8b 75 10             	mov    0x10(%ebp),%esi
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101962:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
//PAGEBREAK!
// Read data from inode.
// Caller must hold ip->lock.
int
readi(struct inode *ip, char *dst, uint off, uint n)
{
80101967:	89 7d e0             	mov    %edi,-0x20(%ebp)
8010196a:	8b 7d 14             	mov    0x14(%ebp),%edi
8010196d:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101970:	89 7d e4             	mov    %edi,-0x1c(%ebp)
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101973:	0f 84 a7 00 00 00    	je     80101a20 <readi+0xd0>
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
      return -1;
    return devsw[ip->major].read(ip, dst, n);
  }

  if(off > ip->size || off + n < off)
80101979:	8b 45 d8             	mov    -0x28(%ebp),%eax
8010197c:	8b 40 58             	mov    0x58(%eax),%eax
8010197f:	39 f0                	cmp    %esi,%eax
80101981:	0f 82 ba 00 00 00    	jb     80101a41 <readi+0xf1>
80101987:	8b 7d e4             	mov    -0x1c(%ebp),%edi
8010198a:	89 f9                	mov    %edi,%ecx
8010198c:	01 f1                	add    %esi,%ecx
8010198e:	0f 82 ad 00 00 00    	jb     80101a41 <readi+0xf1>
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;
80101994:	89 c2                	mov    %eax,%edx
80101996:	29 f2                	sub    %esi,%edx
80101998:	39 c8                	cmp    %ecx,%eax
8010199a:	0f 43 d7             	cmovae %edi,%edx

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
8010199d:	31 ff                	xor    %edi,%edi
8010199f:	85 d2                	test   %edx,%edx
  }

  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;
801019a1:	89 55 e4             	mov    %edx,-0x1c(%ebp)

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
801019a4:	74 6c                	je     80101a12 <readi+0xc2>
801019a6:	8d 76 00             	lea    0x0(%esi),%esi
801019a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
801019b0:	8b 5d d8             	mov    -0x28(%ebp),%ebx
801019b3:	89 f2                	mov    %esi,%edx
801019b5:	c1 ea 09             	shr    $0x9,%edx
801019b8:	89 d8                	mov    %ebx,%eax
801019ba:	e8 21 f9 ff ff       	call   801012e0 <bmap>
801019bf:	83 ec 08             	sub    $0x8,%esp
801019c2:	50                   	push   %eax
801019c3:	ff 33                	pushl  (%ebx)
801019c5:	e8 06 e7 ff ff       	call   801000d0 <bread>
    m = min(n - tot, BSIZE - off%BSIZE);
801019ca:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
801019cd:	89 c2                	mov    %eax,%edx
    m = min(n - tot, BSIZE - off%BSIZE);
801019cf:	89 f0                	mov    %esi,%eax
801019d1:	25 ff 01 00 00       	and    $0x1ff,%eax
801019d6:	b9 00 02 00 00       	mov    $0x200,%ecx
801019db:	83 c4 0c             	add    $0xc,%esp
801019de:	29 c1                	sub    %eax,%ecx
    memmove(dst, bp->data + off%BSIZE, m);
801019e0:	8d 44 02 5c          	lea    0x5c(%edx,%eax,1),%eax
801019e4:	89 55 dc             	mov    %edx,-0x24(%ebp)
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    m = min(n - tot, BSIZE - off%BSIZE);
801019e7:	29 fb                	sub    %edi,%ebx
801019e9:	39 d9                	cmp    %ebx,%ecx
801019eb:	0f 46 d9             	cmovbe %ecx,%ebx
    memmove(dst, bp->data + off%BSIZE, m);
801019ee:	53                   	push   %ebx
801019ef:	50                   	push   %eax
  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
801019f0:	01 df                	add    %ebx,%edi
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    m = min(n - tot, BSIZE - off%BSIZE);
    memmove(dst, bp->data + off%BSIZE, m);
801019f2:	ff 75 e0             	pushl  -0x20(%ebp)
  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
801019f5:	01 de                	add    %ebx,%esi
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    m = min(n - tot, BSIZE - off%BSIZE);
    memmove(dst, bp->data + off%BSIZE, m);
801019f7:	e8 14 31 00 00       	call   80104b10 <memmove>
    brelse(bp);
801019fc:	8b 55 dc             	mov    -0x24(%ebp),%edx
801019ff:	89 14 24             	mov    %edx,(%esp)
80101a02:	e8 d9 e7 ff ff       	call   801001e0 <brelse>
  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
80101a07:	01 5d e0             	add    %ebx,-0x20(%ebp)
80101a0a:	83 c4 10             	add    $0x10,%esp
80101a0d:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
80101a10:	77 9e                	ja     801019b0 <readi+0x60>
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    m = min(n - tot, BSIZE - off%BSIZE);
    memmove(dst, bp->data + off%BSIZE, m);
    brelse(bp);
  }
  return n;
80101a12:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
80101a15:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101a18:	5b                   	pop    %ebx
80101a19:	5e                   	pop    %esi
80101a1a:	5f                   	pop    %edi
80101a1b:	5d                   	pop    %ebp
80101a1c:	c3                   	ret    
80101a1d:	8d 76 00             	lea    0x0(%esi),%esi
{
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
80101a20:	0f bf 40 52          	movswl 0x52(%eax),%eax
80101a24:	66 83 f8 09          	cmp    $0x9,%ax
80101a28:	77 17                	ja     80101a41 <readi+0xf1>
80101a2a:	8b 04 c5 80 19 11 80 	mov    -0x7feee680(,%eax,8),%eax
80101a31:	85 c0                	test   %eax,%eax
80101a33:	74 0c                	je     80101a41 <readi+0xf1>
      return -1;
    return devsw[ip->major].read(ip, dst, n);
80101a35:	89 7d 10             	mov    %edi,0x10(%ebp)
    m = min(n - tot, BSIZE - off%BSIZE);
    memmove(dst, bp->data + off%BSIZE, m);
    brelse(bp);
  }
  return n;
}
80101a38:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101a3b:	5b                   	pop    %ebx
80101a3c:	5e                   	pop    %esi
80101a3d:	5f                   	pop    %edi
80101a3e:	5d                   	pop    %ebp
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
      return -1;
    return devsw[ip->major].read(ip, dst, n);
80101a3f:	ff e0                	jmp    *%eax
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
      return -1;
80101a41:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101a46:	eb cd                	jmp    80101a15 <readi+0xc5>
80101a48:	90                   	nop
80101a49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80101a50 <writei>:
// PAGEBREAK!
// Write data to inode.
// Caller must hold ip->lock.
int
writei(struct inode *ip, char *src, uint off, uint n)
{
80101a50:	55                   	push   %ebp
80101a51:	89 e5                	mov    %esp,%ebp
80101a53:	57                   	push   %edi
80101a54:	56                   	push   %esi
80101a55:	53                   	push   %ebx
80101a56:	83 ec 1c             	sub    $0x1c,%esp
80101a59:	8b 45 08             	mov    0x8(%ebp),%eax
80101a5c:	8b 75 0c             	mov    0xc(%ebp),%esi
80101a5f:	8b 4d 14             	mov    0x14(%ebp),%ecx
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101a62:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
// PAGEBREAK!
// Write data to inode.
// Caller must hold ip->lock.
int
writei(struct inode *ip, char *src, uint off, uint n)
{
80101a67:	89 75 dc             	mov    %esi,-0x24(%ebp)
80101a6a:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101a6d:	8b 75 10             	mov    0x10(%ebp),%esi
80101a70:	89 4d e0             	mov    %ecx,-0x20(%ebp)
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101a73:	0f 84 b7 00 00 00    	je     80101b30 <writei+0xe0>
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
      return -1;
    return devsw[ip->major].write(ip, src, n);
  }

  if(off > ip->size || off + n < off)
80101a79:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101a7c:	39 70 58             	cmp    %esi,0x58(%eax)
80101a7f:	0f 82 eb 00 00 00    	jb     80101b70 <writei+0x120>
    return -1;
  if(off + n > MAXFILE*BSIZE)
80101a85:	8b 4d e0             	mov    -0x20(%ebp),%ecx
80101a88:	89 c8                	mov    %ecx,%eax
80101a8a:	01 f0                	add    %esi,%eax
80101a8c:	0f 82 de 00 00 00    	jb     80101b70 <writei+0x120>
80101a92:	3d 00 18 01 00       	cmp    $0x11800,%eax
80101a97:	0f 87 d3 00 00 00    	ja     80101b70 <writei+0x120>
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101a9d:	85 c9                	test   %ecx,%ecx
80101a9f:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
80101aa6:	74 79                	je     80101b21 <writei+0xd1>
80101aa8:	90                   	nop
80101aa9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101ab0:	8b 7d d8             	mov    -0x28(%ebp),%edi
80101ab3:	89 f2                	mov    %esi,%edx
80101ab5:	c1 ea 09             	shr    $0x9,%edx
80101ab8:	89 f8                	mov    %edi,%eax
80101aba:	e8 21 f8 ff ff       	call   801012e0 <bmap>
80101abf:	83 ec 08             	sub    $0x8,%esp
80101ac2:	50                   	push   %eax
80101ac3:	ff 37                	pushl  (%edi)
80101ac5:	e8 06 e6 ff ff       	call   801000d0 <bread>
    m = min(n - tot, BSIZE - off%BSIZE);
80101aca:	8b 5d e0             	mov    -0x20(%ebp),%ebx
80101acd:	2b 5d e4             	sub    -0x1c(%ebp),%ebx
    return -1;
  if(off + n > MAXFILE*BSIZE)
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101ad0:	89 c7                	mov    %eax,%edi
    m = min(n - tot, BSIZE - off%BSIZE);
80101ad2:	89 f0                	mov    %esi,%eax
80101ad4:	b9 00 02 00 00       	mov    $0x200,%ecx
80101ad9:	83 c4 0c             	add    $0xc,%esp
80101adc:	25 ff 01 00 00       	and    $0x1ff,%eax
80101ae1:	29 c1                	sub    %eax,%ecx
    memmove(bp->data + off%BSIZE, src, m);
80101ae3:	8d 44 07 5c          	lea    0x5c(%edi,%eax,1),%eax
  if(off + n > MAXFILE*BSIZE)
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    m = min(n - tot, BSIZE - off%BSIZE);
80101ae7:	39 d9                	cmp    %ebx,%ecx
80101ae9:	0f 46 d9             	cmovbe %ecx,%ebx
    memmove(bp->data + off%BSIZE, src, m);
80101aec:	53                   	push   %ebx
80101aed:	ff 75 dc             	pushl  -0x24(%ebp)
  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > MAXFILE*BSIZE)
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101af0:	01 de                	add    %ebx,%esi
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    m = min(n - tot, BSIZE - off%BSIZE);
    memmove(bp->data + off%BSIZE, src, m);
80101af2:	50                   	push   %eax
80101af3:	e8 18 30 00 00       	call   80104b10 <memmove>
    log_write(bp);
80101af8:	89 3c 24             	mov    %edi,(%esp)
80101afb:	e8 50 12 00 00       	call   80102d50 <log_write>
    brelse(bp);
80101b00:	89 3c 24             	mov    %edi,(%esp)
80101b03:	e8 d8 e6 ff ff       	call   801001e0 <brelse>
  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > MAXFILE*BSIZE)
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101b08:	01 5d e4             	add    %ebx,-0x1c(%ebp)
80101b0b:	01 5d dc             	add    %ebx,-0x24(%ebp)
80101b0e:	83 c4 10             	add    $0x10,%esp
80101b11:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101b14:	39 55 e0             	cmp    %edx,-0x20(%ebp)
80101b17:	77 97                	ja     80101ab0 <writei+0x60>
    memmove(bp->data + off%BSIZE, src, m);
    log_write(bp);
    brelse(bp);
  }

  if(n > 0 && off > ip->size){
80101b19:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101b1c:	3b 70 58             	cmp    0x58(%eax),%esi
80101b1f:	77 37                	ja     80101b58 <writei+0x108>
    ip->size = off;
    iupdate(ip);
  }
  return n;
80101b21:	8b 45 e0             	mov    -0x20(%ebp),%eax
}
80101b24:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101b27:	5b                   	pop    %ebx
80101b28:	5e                   	pop    %esi
80101b29:	5f                   	pop    %edi
80101b2a:	5d                   	pop    %ebp
80101b2b:	c3                   	ret    
80101b2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
{
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
80101b30:	0f bf 40 52          	movswl 0x52(%eax),%eax
80101b34:	66 83 f8 09          	cmp    $0x9,%ax
80101b38:	77 36                	ja     80101b70 <writei+0x120>
80101b3a:	8b 04 c5 84 19 11 80 	mov    -0x7feee67c(,%eax,8),%eax
80101b41:	85 c0                	test   %eax,%eax
80101b43:	74 2b                	je     80101b70 <writei+0x120>
      return -1;
    return devsw[ip->major].write(ip, src, n);
80101b45:	89 4d 10             	mov    %ecx,0x10(%ebp)
  if(n > 0 && off > ip->size){
    ip->size = off;
    iupdate(ip);
  }
  return n;
}
80101b48:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101b4b:	5b                   	pop    %ebx
80101b4c:	5e                   	pop    %esi
80101b4d:	5f                   	pop    %edi
80101b4e:	5d                   	pop    %ebp
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
      return -1;
    return devsw[ip->major].write(ip, src, n);
80101b4f:	ff e0                	jmp    *%eax
80101b51:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    log_write(bp);
    brelse(bp);
  }

  if(n > 0 && off > ip->size){
    ip->size = off;
80101b58:	8b 45 d8             	mov    -0x28(%ebp),%eax
    iupdate(ip);
80101b5b:	83 ec 0c             	sub    $0xc,%esp
    log_write(bp);
    brelse(bp);
  }

  if(n > 0 && off > ip->size){
    ip->size = off;
80101b5e:	89 70 58             	mov    %esi,0x58(%eax)
    iupdate(ip);
80101b61:	50                   	push   %eax
80101b62:	e8 59 fa ff ff       	call   801015c0 <iupdate>
80101b67:	83 c4 10             	add    $0x10,%esp
80101b6a:	eb b5                	jmp    80101b21 <writei+0xd1>
80101b6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
      return -1;
80101b70:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101b75:	eb ad                	jmp    80101b24 <writei+0xd4>
80101b77:	89 f6                	mov    %esi,%esi
80101b79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101b80 <namecmp>:
//PAGEBREAK!
// Directories

int
namecmp(const char *s, const char *t)
{
80101b80:	55                   	push   %ebp
80101b81:	89 e5                	mov    %esp,%ebp
80101b83:	83 ec 0c             	sub    $0xc,%esp
  return strncmp(s, t, DIRSIZ);
80101b86:	6a 0e                	push   $0xe
80101b88:	ff 75 0c             	pushl  0xc(%ebp)
80101b8b:	ff 75 08             	pushl  0x8(%ebp)
80101b8e:	e8 ed 2f 00 00       	call   80104b80 <strncmp>
}
80101b93:	c9                   	leave  
80101b94:	c3                   	ret    
80101b95:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101b99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101ba0 <dirlookup>:

// Look for a directory entry in a directory.
// If found, set *poff to byte offset of entry.
struct inode*
dirlookup(struct inode *dp, char *name, uint *poff)
{
80101ba0:	55                   	push   %ebp
80101ba1:	89 e5                	mov    %esp,%ebp
80101ba3:	57                   	push   %edi
80101ba4:	56                   	push   %esi
80101ba5:	53                   	push   %ebx
80101ba6:	83 ec 1c             	sub    $0x1c,%esp
80101ba9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  uint off, inum;
  struct dirent de;

  if(dp->type != T_DIR)
80101bac:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80101bb1:	0f 85 80 00 00 00    	jne    80101c37 <dirlookup+0x97>
    panic("dirlookup not DIR");

  for(off = 0; off < dp->size; off += sizeof(de)){
80101bb7:	8b 53 58             	mov    0x58(%ebx),%edx
80101bba:	31 ff                	xor    %edi,%edi
80101bbc:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101bbf:	85 d2                	test   %edx,%edx
80101bc1:	75 0d                	jne    80101bd0 <dirlookup+0x30>
80101bc3:	eb 5b                	jmp    80101c20 <dirlookup+0x80>
80101bc5:	8d 76 00             	lea    0x0(%esi),%esi
80101bc8:	83 c7 10             	add    $0x10,%edi
80101bcb:	39 7b 58             	cmp    %edi,0x58(%ebx)
80101bce:	76 50                	jbe    80101c20 <dirlookup+0x80>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101bd0:	6a 10                	push   $0x10
80101bd2:	57                   	push   %edi
80101bd3:	56                   	push   %esi
80101bd4:	53                   	push   %ebx
80101bd5:	e8 76 fd ff ff       	call   80101950 <readi>
80101bda:	83 c4 10             	add    $0x10,%esp
80101bdd:	83 f8 10             	cmp    $0x10,%eax
80101be0:	75 48                	jne    80101c2a <dirlookup+0x8a>
      panic("dirlookup read");
    if(de.inum == 0)
80101be2:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101be7:	74 df                	je     80101bc8 <dirlookup+0x28>
// Directories

int
namecmp(const char *s, const char *t)
{
  return strncmp(s, t, DIRSIZ);
80101be9:	8d 45 da             	lea    -0x26(%ebp),%eax
80101bec:	83 ec 04             	sub    $0x4,%esp
80101bef:	6a 0e                	push   $0xe
80101bf1:	50                   	push   %eax
80101bf2:	ff 75 0c             	pushl  0xc(%ebp)
80101bf5:	e8 86 2f 00 00       	call   80104b80 <strncmp>
  for(off = 0; off < dp->size; off += sizeof(de)){
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
      panic("dirlookup read");
    if(de.inum == 0)
      continue;
    if(namecmp(name, de.name) == 0){
80101bfa:	83 c4 10             	add    $0x10,%esp
80101bfd:	85 c0                	test   %eax,%eax
80101bff:	75 c7                	jne    80101bc8 <dirlookup+0x28>
      // entry matches path element
      if(poff)
80101c01:	8b 45 10             	mov    0x10(%ebp),%eax
80101c04:	85 c0                	test   %eax,%eax
80101c06:	74 05                	je     80101c0d <dirlookup+0x6d>
        *poff = off;
80101c08:	8b 45 10             	mov    0x10(%ebp),%eax
80101c0b:	89 38                	mov    %edi,(%eax)
      inum = de.inum;
80101c0d:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
      return iget(dp->dev, inum);
80101c11:	8b 03                	mov    (%ebx),%eax
80101c13:	e8 f8 f5 ff ff       	call   80101210 <iget>
    }
  }

  return 0;
}
80101c18:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101c1b:	5b                   	pop    %ebx
80101c1c:	5e                   	pop    %esi
80101c1d:	5f                   	pop    %edi
80101c1e:	5d                   	pop    %ebp
80101c1f:	c3                   	ret    
80101c20:	8d 65 f4             	lea    -0xc(%ebp),%esp
      inum = de.inum;
      return iget(dp->dev, inum);
    }
  }

  return 0;
80101c23:	31 c0                	xor    %eax,%eax
}
80101c25:	5b                   	pop    %ebx
80101c26:	5e                   	pop    %esi
80101c27:	5f                   	pop    %edi
80101c28:	5d                   	pop    %ebp
80101c29:	c3                   	ret    
  if(dp->type != T_DIR)
    panic("dirlookup not DIR");

  for(off = 0; off < dp->size; off += sizeof(de)){
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
      panic("dirlookup read");
80101c2a:	83 ec 0c             	sub    $0xc,%esp
80101c2d:	68 79 77 10 80       	push   $0x80107779
80101c32:	e8 39 e7 ff ff       	call   80100370 <panic>
{
  uint off, inum;
  struct dirent de;

  if(dp->type != T_DIR)
    panic("dirlookup not DIR");
80101c37:	83 ec 0c             	sub    $0xc,%esp
80101c3a:	68 67 77 10 80       	push   $0x80107767
80101c3f:	e8 2c e7 ff ff       	call   80100370 <panic>
80101c44:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101c4a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80101c50 <namex>:
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
// Must be called inside a transaction since it calls iput().
static struct inode*
namex(char *path, int nameiparent, char *name)
{
80101c50:	55                   	push   %ebp
80101c51:	89 e5                	mov    %esp,%ebp
80101c53:	57                   	push   %edi
80101c54:	56                   	push   %esi
80101c55:	53                   	push   %ebx
80101c56:	89 cf                	mov    %ecx,%edi
80101c58:	89 c3                	mov    %eax,%ebx
80101c5a:	83 ec 1c             	sub    $0x1c,%esp
  struct inode *ip, *next;

  if(*path == '/')
80101c5d:	80 38 2f             	cmpb   $0x2f,(%eax)
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
// Must be called inside a transaction since it calls iput().
static struct inode*
namex(char *path, int nameiparent, char *name)
{
80101c60:	89 55 e0             	mov    %edx,-0x20(%ebp)
  struct inode *ip, *next;

  if(*path == '/')
80101c63:	0f 84 55 01 00 00    	je     80101dbe <namex+0x16e>
    ip = iget(ROOTDEV, ROOTINO);
  else
    ip = idup(myproc()->cwd);
80101c69:	e8 52 1c 00 00       	call   801038c0 <myproc>
// Increment reference count for ip.
// Returns ip to enable ip = idup(ip1) idiom.
struct inode*
idup(struct inode *ip)
{
  acquire(&icache.lock);
80101c6e:	83 ec 0c             	sub    $0xc,%esp
  struct inode *ip, *next;

  if(*path == '/')
    ip = iget(ROOTDEV, ROOTINO);
  else
    ip = idup(myproc()->cwd);
80101c71:	8b 70 68             	mov    0x68(%eax),%esi
// Increment reference count for ip.
// Returns ip to enable ip = idup(ip1) idiom.
struct inode*
idup(struct inode *ip)
{
  acquire(&icache.lock);
80101c74:	68 00 1a 11 80       	push   $0x80111a00
80101c79:	e8 72 2c 00 00       	call   801048f0 <acquire>
  ip->ref++;
80101c7e:	83 46 08 01          	addl   $0x1,0x8(%esi)
  release(&icache.lock);
80101c82:	c7 04 24 00 1a 11 80 	movl   $0x80111a00,(%esp)
80101c89:	e8 82 2d 00 00       	call   80104a10 <release>
80101c8e:	83 c4 10             	add    $0x10,%esp
80101c91:	eb 08                	jmp    80101c9b <namex+0x4b>
80101c93:	90                   	nop
80101c94:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
{
  char *s;
  int len;

  while(*path == '/')
    path++;
80101c98:	83 c3 01             	add    $0x1,%ebx
skipelem(char *path, char *name)
{
  char *s;
  int len;

  while(*path == '/')
80101c9b:	0f b6 03             	movzbl (%ebx),%eax
80101c9e:	3c 2f                	cmp    $0x2f,%al
80101ca0:	74 f6                	je     80101c98 <namex+0x48>
    path++;
  if(*path == 0)
80101ca2:	84 c0                	test   %al,%al
80101ca4:	0f 84 e3 00 00 00    	je     80101d8d <namex+0x13d>
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
80101caa:	0f b6 03             	movzbl (%ebx),%eax
80101cad:	89 da                	mov    %ebx,%edx
80101caf:	84 c0                	test   %al,%al
80101cb1:	0f 84 ac 00 00 00    	je     80101d63 <namex+0x113>
80101cb7:	3c 2f                	cmp    $0x2f,%al
80101cb9:	75 09                	jne    80101cc4 <namex+0x74>
80101cbb:	e9 a3 00 00 00       	jmp    80101d63 <namex+0x113>
80101cc0:	84 c0                	test   %al,%al
80101cc2:	74 0a                	je     80101cce <namex+0x7e>
    path++;
80101cc4:	83 c2 01             	add    $0x1,%edx
  while(*path == '/')
    path++;
  if(*path == 0)
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
80101cc7:	0f b6 02             	movzbl (%edx),%eax
80101cca:	3c 2f                	cmp    $0x2f,%al
80101ccc:	75 f2                	jne    80101cc0 <namex+0x70>
80101cce:	89 d1                	mov    %edx,%ecx
80101cd0:	29 d9                	sub    %ebx,%ecx
    path++;
  len = path - s;
  if(len >= DIRSIZ)
80101cd2:	83 f9 0d             	cmp    $0xd,%ecx
80101cd5:	0f 8e 8d 00 00 00    	jle    80101d68 <namex+0x118>
    memmove(name, s, DIRSIZ);
80101cdb:	83 ec 04             	sub    $0x4,%esp
80101cde:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80101ce1:	6a 0e                	push   $0xe
80101ce3:	53                   	push   %ebx
80101ce4:	57                   	push   %edi
80101ce5:	e8 26 2e 00 00       	call   80104b10 <memmove>
    path++;
  if(*path == 0)
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
    path++;
80101cea:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  len = path - s;
  if(len >= DIRSIZ)
    memmove(name, s, DIRSIZ);
80101ced:	83 c4 10             	add    $0x10,%esp
    path++;
  if(*path == 0)
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
    path++;
80101cf0:	89 d3                	mov    %edx,%ebx
    memmove(name, s, DIRSIZ);
  else {
    memmove(name, s, len);
    name[len] = 0;
  }
  while(*path == '/')
80101cf2:	80 3a 2f             	cmpb   $0x2f,(%edx)
80101cf5:	75 11                	jne    80101d08 <namex+0xb8>
80101cf7:	89 f6                	mov    %esi,%esi
80101cf9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    path++;
80101d00:	83 c3 01             	add    $0x1,%ebx
    memmove(name, s, DIRSIZ);
  else {
    memmove(name, s, len);
    name[len] = 0;
  }
  while(*path == '/')
80101d03:	80 3b 2f             	cmpb   $0x2f,(%ebx)
80101d06:	74 f8                	je     80101d00 <namex+0xb0>
    ip = iget(ROOTDEV, ROOTINO);
  else
    ip = idup(myproc()->cwd);

  while((path = skipelem(path, name)) != 0){
    ilock(ip);
80101d08:	83 ec 0c             	sub    $0xc,%esp
80101d0b:	56                   	push   %esi
80101d0c:	e8 5f f9 ff ff       	call   80101670 <ilock>
    if(ip->type != T_DIR){
80101d11:	83 c4 10             	add    $0x10,%esp
80101d14:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80101d19:	0f 85 7f 00 00 00    	jne    80101d9e <namex+0x14e>
      iunlockput(ip);
      return 0;
    }
    if(nameiparent && *path == '\0'){
80101d1f:	8b 55 e0             	mov    -0x20(%ebp),%edx
80101d22:	85 d2                	test   %edx,%edx
80101d24:	74 09                	je     80101d2f <namex+0xdf>
80101d26:	80 3b 00             	cmpb   $0x0,(%ebx)
80101d29:	0f 84 a5 00 00 00    	je     80101dd4 <namex+0x184>
      // Stop one level early.
      iunlock(ip);
      return ip;
    }
    if((next = dirlookup(ip, name, 0)) == 0){
80101d2f:	83 ec 04             	sub    $0x4,%esp
80101d32:	6a 00                	push   $0x0
80101d34:	57                   	push   %edi
80101d35:	56                   	push   %esi
80101d36:	e8 65 fe ff ff       	call   80101ba0 <dirlookup>
80101d3b:	83 c4 10             	add    $0x10,%esp
80101d3e:	85 c0                	test   %eax,%eax
80101d40:	74 5c                	je     80101d9e <namex+0x14e>

// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
  iunlock(ip);
80101d42:	83 ec 0c             	sub    $0xc,%esp
80101d45:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101d48:	56                   	push   %esi
80101d49:	e8 02 fa ff ff       	call   80101750 <iunlock>
  iput(ip);
80101d4e:	89 34 24             	mov    %esi,(%esp)
80101d51:	e8 4a fa ff ff       	call   801017a0 <iput>
80101d56:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101d59:	83 c4 10             	add    $0x10,%esp
80101d5c:	89 c6                	mov    %eax,%esi
80101d5e:	e9 38 ff ff ff       	jmp    80101c9b <namex+0x4b>
  while(*path == '/')
    path++;
  if(*path == 0)
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
80101d63:	31 c9                	xor    %ecx,%ecx
80101d65:	8d 76 00             	lea    0x0(%esi),%esi
    path++;
  len = path - s;
  if(len >= DIRSIZ)
    memmove(name, s, DIRSIZ);
  else {
    memmove(name, s, len);
80101d68:	83 ec 04             	sub    $0x4,%esp
80101d6b:	89 55 dc             	mov    %edx,-0x24(%ebp)
80101d6e:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80101d71:	51                   	push   %ecx
80101d72:	53                   	push   %ebx
80101d73:	57                   	push   %edi
80101d74:	e8 97 2d 00 00       	call   80104b10 <memmove>
    name[len] = 0;
80101d79:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80101d7c:	8b 55 dc             	mov    -0x24(%ebp),%edx
80101d7f:	83 c4 10             	add    $0x10,%esp
80101d82:	c6 04 0f 00          	movb   $0x0,(%edi,%ecx,1)
80101d86:	89 d3                	mov    %edx,%ebx
80101d88:	e9 65 ff ff ff       	jmp    80101cf2 <namex+0xa2>
      return 0;
    }
    iunlockput(ip);
    ip = next;
  }
  if(nameiparent){
80101d8d:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101d90:	85 c0                	test   %eax,%eax
80101d92:	75 56                	jne    80101dea <namex+0x19a>
    iput(ip);
    return 0;
  }
  return ip;
}
80101d94:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101d97:	89 f0                	mov    %esi,%eax
80101d99:	5b                   	pop    %ebx
80101d9a:	5e                   	pop    %esi
80101d9b:	5f                   	pop    %edi
80101d9c:	5d                   	pop    %ebp
80101d9d:	c3                   	ret    

// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
  iunlock(ip);
80101d9e:	83 ec 0c             	sub    $0xc,%esp
80101da1:	56                   	push   %esi
80101da2:	e8 a9 f9 ff ff       	call   80101750 <iunlock>
  iput(ip);
80101da7:	89 34 24             	mov    %esi,(%esp)
      iunlock(ip);
      return ip;
    }
    if((next = dirlookup(ip, name, 0)) == 0){
      iunlockput(ip);
      return 0;
80101daa:	31 f6                	xor    %esi,%esi
// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
  iunlock(ip);
  iput(ip);
80101dac:	e8 ef f9 ff ff       	call   801017a0 <iput>
      iunlock(ip);
      return ip;
    }
    if((next = dirlookup(ip, name, 0)) == 0){
      iunlockput(ip);
      return 0;
80101db1:	83 c4 10             	add    $0x10,%esp
  if(nameiparent){
    iput(ip);
    return 0;
  }
  return ip;
}
80101db4:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101db7:	89 f0                	mov    %esi,%eax
80101db9:	5b                   	pop    %ebx
80101dba:	5e                   	pop    %esi
80101dbb:	5f                   	pop    %edi
80101dbc:	5d                   	pop    %ebp
80101dbd:	c3                   	ret    
namex(char *path, int nameiparent, char *name)
{
  struct inode *ip, *next;

  if(*path == '/')
    ip = iget(ROOTDEV, ROOTINO);
80101dbe:	ba 01 00 00 00       	mov    $0x1,%edx
80101dc3:	b8 01 00 00 00       	mov    $0x1,%eax
80101dc8:	e8 43 f4 ff ff       	call   80101210 <iget>
80101dcd:	89 c6                	mov    %eax,%esi
80101dcf:	e9 c7 fe ff ff       	jmp    80101c9b <namex+0x4b>
      iunlockput(ip);
      return 0;
    }
    if(nameiparent && *path == '\0'){
      // Stop one level early.
      iunlock(ip);
80101dd4:	83 ec 0c             	sub    $0xc,%esp
80101dd7:	56                   	push   %esi
80101dd8:	e8 73 f9 ff ff       	call   80101750 <iunlock>
      return ip;
80101ddd:	83 c4 10             	add    $0x10,%esp
  if(nameiparent){
    iput(ip);
    return 0;
  }
  return ip;
}
80101de0:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101de3:	89 f0                	mov    %esi,%eax
80101de5:	5b                   	pop    %ebx
80101de6:	5e                   	pop    %esi
80101de7:	5f                   	pop    %edi
80101de8:	5d                   	pop    %ebp
80101de9:	c3                   	ret    
    }
    iunlockput(ip);
    ip = next;
  }
  if(nameiparent){
    iput(ip);
80101dea:	83 ec 0c             	sub    $0xc,%esp
80101ded:	56                   	push   %esi
    return 0;
80101dee:	31 f6                	xor    %esi,%esi
    }
    iunlockput(ip);
    ip = next;
  }
  if(nameiparent){
    iput(ip);
80101df0:	e8 ab f9 ff ff       	call   801017a0 <iput>
    return 0;
80101df5:	83 c4 10             	add    $0x10,%esp
80101df8:	eb 9a                	jmp    80101d94 <namex+0x144>
80101dfa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80101e00 <dirlink>:
}

// Write a new directory entry (name, inum) into the directory dp.
int
dirlink(struct inode *dp, char *name, uint inum)
{
80101e00:	55                   	push   %ebp
80101e01:	89 e5                	mov    %esp,%ebp
80101e03:	57                   	push   %edi
80101e04:	56                   	push   %esi
80101e05:	53                   	push   %ebx
80101e06:	83 ec 20             	sub    $0x20,%esp
80101e09:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int off;
  struct dirent de;
  struct inode *ip;

  // Check that name is not present.
  if((ip = dirlookup(dp, name, 0)) != 0){
80101e0c:	6a 00                	push   $0x0
80101e0e:	ff 75 0c             	pushl  0xc(%ebp)
80101e11:	53                   	push   %ebx
80101e12:	e8 89 fd ff ff       	call   80101ba0 <dirlookup>
80101e17:	83 c4 10             	add    $0x10,%esp
80101e1a:	85 c0                	test   %eax,%eax
80101e1c:	75 67                	jne    80101e85 <dirlink+0x85>
    iput(ip);
    return -1;
  }

  // Look for an empty dirent.
  for(off = 0; off < dp->size; off += sizeof(de)){
80101e1e:	8b 7b 58             	mov    0x58(%ebx),%edi
80101e21:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101e24:	85 ff                	test   %edi,%edi
80101e26:	74 29                	je     80101e51 <dirlink+0x51>
80101e28:	31 ff                	xor    %edi,%edi
80101e2a:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101e2d:	eb 09                	jmp    80101e38 <dirlink+0x38>
80101e2f:	90                   	nop
80101e30:	83 c7 10             	add    $0x10,%edi
80101e33:	39 7b 58             	cmp    %edi,0x58(%ebx)
80101e36:	76 19                	jbe    80101e51 <dirlink+0x51>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101e38:	6a 10                	push   $0x10
80101e3a:	57                   	push   %edi
80101e3b:	56                   	push   %esi
80101e3c:	53                   	push   %ebx
80101e3d:	e8 0e fb ff ff       	call   80101950 <readi>
80101e42:	83 c4 10             	add    $0x10,%esp
80101e45:	83 f8 10             	cmp    $0x10,%eax
80101e48:	75 4e                	jne    80101e98 <dirlink+0x98>
      panic("dirlink read");
    if(de.inum == 0)
80101e4a:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101e4f:	75 df                	jne    80101e30 <dirlink+0x30>
      break;
  }

  strncpy(de.name, name, DIRSIZ);
80101e51:	8d 45 da             	lea    -0x26(%ebp),%eax
80101e54:	83 ec 04             	sub    $0x4,%esp
80101e57:	6a 0e                	push   $0xe
80101e59:	ff 75 0c             	pushl  0xc(%ebp)
80101e5c:	50                   	push   %eax
80101e5d:	e8 7e 2d 00 00       	call   80104be0 <strncpy>
  de.inum = inum;
80101e62:	8b 45 10             	mov    0x10(%ebp),%eax
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101e65:	6a 10                	push   $0x10
80101e67:	57                   	push   %edi
80101e68:	56                   	push   %esi
80101e69:	53                   	push   %ebx
    if(de.inum == 0)
      break;
  }

  strncpy(de.name, name, DIRSIZ);
  de.inum = inum;
80101e6a:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101e6e:	e8 dd fb ff ff       	call   80101a50 <writei>
80101e73:	83 c4 20             	add    $0x20,%esp
80101e76:	83 f8 10             	cmp    $0x10,%eax
80101e79:	75 2a                	jne    80101ea5 <dirlink+0xa5>
    panic("dirlink");

  return 0;
80101e7b:	31 c0                	xor    %eax,%eax
}
80101e7d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101e80:	5b                   	pop    %ebx
80101e81:	5e                   	pop    %esi
80101e82:	5f                   	pop    %edi
80101e83:	5d                   	pop    %ebp
80101e84:	c3                   	ret    
  struct dirent de;
  struct inode *ip;

  // Check that name is not present.
  if((ip = dirlookup(dp, name, 0)) != 0){
    iput(ip);
80101e85:	83 ec 0c             	sub    $0xc,%esp
80101e88:	50                   	push   %eax
80101e89:	e8 12 f9 ff ff       	call   801017a0 <iput>
    return -1;
80101e8e:	83 c4 10             	add    $0x10,%esp
80101e91:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101e96:	eb e5                	jmp    80101e7d <dirlink+0x7d>
  }

  // Look for an empty dirent.
  for(off = 0; off < dp->size; off += sizeof(de)){
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
      panic("dirlink read");
80101e98:	83 ec 0c             	sub    $0xc,%esp
80101e9b:	68 88 77 10 80       	push   $0x80107788
80101ea0:	e8 cb e4 ff ff       	call   80100370 <panic>
  }

  strncpy(de.name, name, DIRSIZ);
  de.inum = inum;
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
    panic("dirlink");
80101ea5:	83 ec 0c             	sub    $0xc,%esp
80101ea8:	68 92 7d 10 80       	push   $0x80107d92
80101ead:	e8 be e4 ff ff       	call   80100370 <panic>
80101eb2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101eb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101ec0 <namei>:
  return ip;
}

struct inode*
namei(char *path)
{
80101ec0:	55                   	push   %ebp
  char name[DIRSIZ];
  return namex(path, 0, name);
80101ec1:	31 d2                	xor    %edx,%edx
  return ip;
}

struct inode*
namei(char *path)
{
80101ec3:	89 e5                	mov    %esp,%ebp
80101ec5:	83 ec 18             	sub    $0x18,%esp
  char name[DIRSIZ];
  return namex(path, 0, name);
80101ec8:	8b 45 08             	mov    0x8(%ebp),%eax
80101ecb:	8d 4d ea             	lea    -0x16(%ebp),%ecx
80101ece:	e8 7d fd ff ff       	call   80101c50 <namex>
}
80101ed3:	c9                   	leave  
80101ed4:	c3                   	ret    
80101ed5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101ed9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101ee0 <nameiparent>:

struct inode*
nameiparent(char *path, char *name)
{
80101ee0:	55                   	push   %ebp
  return namex(path, 1, name);
80101ee1:	ba 01 00 00 00       	mov    $0x1,%edx
  return namex(path, 0, name);
}

struct inode*
nameiparent(char *path, char *name)
{
80101ee6:	89 e5                	mov    %esp,%ebp
  return namex(path, 1, name);
80101ee8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80101eeb:	8b 45 08             	mov    0x8(%ebp),%eax
}
80101eee:	5d                   	pop    %ebp
}

struct inode*
nameiparent(char *path, char *name)
{
  return namex(path, 1, name);
80101eef:	e9 5c fd ff ff       	jmp    80101c50 <namex>
80101ef4:	66 90                	xchg   %ax,%ax
80101ef6:	66 90                	xchg   %ax,%ax
80101ef8:	66 90                	xchg   %ax,%ax
80101efa:	66 90                	xchg   %ax,%ax
80101efc:	66 90                	xchg   %ax,%ax
80101efe:	66 90                	xchg   %ax,%ax

80101f00 <idestart>:
}

// Start the request for b.  Caller must hold idelock.
static void
idestart(struct buf *b)
{
80101f00:	55                   	push   %ebp
  if(b == 0)
80101f01:	85 c0                	test   %eax,%eax
}

// Start the request for b.  Caller must hold idelock.
static void
idestart(struct buf *b)
{
80101f03:	89 e5                	mov    %esp,%ebp
80101f05:	56                   	push   %esi
80101f06:	53                   	push   %ebx
  if(b == 0)
80101f07:	0f 84 ad 00 00 00    	je     80101fba <idestart+0xba>
    panic("idestart");
  if(b->blockno >= FSSIZE)
80101f0d:	8b 58 08             	mov    0x8(%eax),%ebx
80101f10:	89 c1                	mov    %eax,%ecx
80101f12:	81 fb e7 03 00 00    	cmp    $0x3e7,%ebx
80101f18:	0f 87 8f 00 00 00    	ja     80101fad <idestart+0xad>
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80101f1e:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101f23:	90                   	nop
80101f24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101f28:	ec                   	in     (%dx),%al
static int
idewait(int checkerr)
{
  int r;

  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
80101f29:	83 e0 c0             	and    $0xffffffc0,%eax
80101f2c:	3c 40                	cmp    $0x40,%al
80101f2e:	75 f8                	jne    80101f28 <idestart+0x28>
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80101f30:	31 f6                	xor    %esi,%esi
80101f32:	ba f6 03 00 00       	mov    $0x3f6,%edx
80101f37:	89 f0                	mov    %esi,%eax
80101f39:	ee                   	out    %al,(%dx)
80101f3a:	ba f2 01 00 00       	mov    $0x1f2,%edx
80101f3f:	b8 01 00 00 00       	mov    $0x1,%eax
80101f44:	ee                   	out    %al,(%dx)
80101f45:	ba f3 01 00 00       	mov    $0x1f3,%edx
80101f4a:	89 d8                	mov    %ebx,%eax
80101f4c:	ee                   	out    %al,(%dx)

  idewait(0);
  outb(0x3f6, 0);  // generate interrupt
  outb(0x1f2, sector_per_block);  // number of sectors
  outb(0x1f3, sector & 0xff);
  outb(0x1f4, (sector >> 8) & 0xff);
80101f4d:	89 d8                	mov    %ebx,%eax
80101f4f:	ba f4 01 00 00       	mov    $0x1f4,%edx
80101f54:	c1 f8 08             	sar    $0x8,%eax
80101f57:	ee                   	out    %al,(%dx)
80101f58:	ba f5 01 00 00       	mov    $0x1f5,%edx
80101f5d:	89 f0                	mov    %esi,%eax
80101f5f:	ee                   	out    %al,(%dx)
  outb(0x1f5, (sector >> 16) & 0xff);
  outb(0x1f6, 0xe0 | ((b->dev&1)<<4) | ((sector>>24)&0x0f));
80101f60:	0f b6 41 04          	movzbl 0x4(%ecx),%eax
80101f64:	ba f6 01 00 00       	mov    $0x1f6,%edx
80101f69:	c1 e0 04             	shl    $0x4,%eax
80101f6c:	83 e0 10             	and    $0x10,%eax
80101f6f:	83 c8 e0             	or     $0xffffffe0,%eax
80101f72:	ee                   	out    %al,(%dx)
  if(b->flags & B_DIRTY){
80101f73:	f6 01 04             	testb  $0x4,(%ecx)
80101f76:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101f7b:	75 13                	jne    80101f90 <idestart+0x90>
80101f7d:	b8 20 00 00 00       	mov    $0x20,%eax
80101f82:	ee                   	out    %al,(%dx)
    outb(0x1f7, write_cmd);
    outsl(0x1f0, b->data, BSIZE/4);
  } else {
    outb(0x1f7, read_cmd);
  }
}
80101f83:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101f86:	5b                   	pop    %ebx
80101f87:	5e                   	pop    %esi
80101f88:	5d                   	pop    %ebp
80101f89:	c3                   	ret    
80101f8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101f90:	b8 30 00 00 00       	mov    $0x30,%eax
80101f95:	ee                   	out    %al,(%dx)
}

static inline void
outsl(int port, const void *addr, int cnt)
{
  asm volatile("cld; rep outsl" :
80101f96:	ba f0 01 00 00       	mov    $0x1f0,%edx
  outb(0x1f4, (sector >> 8) & 0xff);
  outb(0x1f5, (sector >> 16) & 0xff);
  outb(0x1f6, 0xe0 | ((b->dev&1)<<4) | ((sector>>24)&0x0f));
  if(b->flags & B_DIRTY){
    outb(0x1f7, write_cmd);
    outsl(0x1f0, b->data, BSIZE/4);
80101f9b:	8d 71 5c             	lea    0x5c(%ecx),%esi
80101f9e:	b9 80 00 00 00       	mov    $0x80,%ecx
80101fa3:	fc                   	cld    
80101fa4:	f3 6f                	rep outsl %ds:(%esi),(%dx)
  } else {
    outb(0x1f7, read_cmd);
  }
}
80101fa6:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101fa9:	5b                   	pop    %ebx
80101faa:	5e                   	pop    %esi
80101fab:	5d                   	pop    %ebp
80101fac:	c3                   	ret    
idestart(struct buf *b)
{
  if(b == 0)
    panic("idestart");
  if(b->blockno >= FSSIZE)
    panic("incorrect blockno");
80101fad:	83 ec 0c             	sub    $0xc,%esp
80101fb0:	68 f4 77 10 80       	push   $0x801077f4
80101fb5:	e8 b6 e3 ff ff       	call   80100370 <panic>
// Start the request for b.  Caller must hold idelock.
static void
idestart(struct buf *b)
{
  if(b == 0)
    panic("idestart");
80101fba:	83 ec 0c             	sub    $0xc,%esp
80101fbd:	68 eb 77 10 80       	push   $0x801077eb
80101fc2:	e8 a9 e3 ff ff       	call   80100370 <panic>
80101fc7:	89 f6                	mov    %esi,%esi
80101fc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101fd0 <ideinit>:
  return 0;
}

void
ideinit(void)
{
80101fd0:	55                   	push   %ebp
80101fd1:	89 e5                	mov    %esp,%ebp
80101fd3:	83 ec 10             	sub    $0x10,%esp
  int i;

  initlock(&idelock, "ide");
80101fd6:	68 06 78 10 80       	push   $0x80107806
80101fdb:	68 80 b5 10 80       	push   $0x8010b580
80101fe0:	e8 0b 28 00 00       	call   801047f0 <initlock>
  ioapicenable(IRQ_IDE, ncpu - 1);
80101fe5:	58                   	pop    %eax
80101fe6:	a1 20 3d 11 80       	mov    0x80113d20,%eax
80101feb:	5a                   	pop    %edx
80101fec:	83 e8 01             	sub    $0x1,%eax
80101fef:	50                   	push   %eax
80101ff0:	6a 0e                	push   $0xe
80101ff2:	e8 a9 02 00 00       	call   801022a0 <ioapicenable>
80101ff7:	83 c4 10             	add    $0x10,%esp
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80101ffa:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101fff:	90                   	nop
80102000:	ec                   	in     (%dx),%al
static int
idewait(int checkerr)
{
  int r;

  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
80102001:	83 e0 c0             	and    $0xffffffc0,%eax
80102004:	3c 40                	cmp    $0x40,%al
80102006:	75 f8                	jne    80102000 <ideinit+0x30>
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102008:	ba f6 01 00 00       	mov    $0x1f6,%edx
8010200d:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
80102012:	ee                   	out    %al,(%dx)
80102013:	b9 e8 03 00 00       	mov    $0x3e8,%ecx
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102018:	ba f7 01 00 00       	mov    $0x1f7,%edx
8010201d:	eb 06                	jmp    80102025 <ideinit+0x55>
8010201f:	90                   	nop
  ioapicenable(IRQ_IDE, ncpu - 1);
  idewait(0);

  // Check if disk 1 is present
  outb(0x1f6, 0xe0 | (1<<4));
  for(i=0; i<1000; i++){
80102020:	83 e9 01             	sub    $0x1,%ecx
80102023:	74 0f                	je     80102034 <ideinit+0x64>
80102025:	ec                   	in     (%dx),%al
    if(inb(0x1f7) != 0){
80102026:	84 c0                	test   %al,%al
80102028:	74 f6                	je     80102020 <ideinit+0x50>
      havedisk1 = 1;
8010202a:	c7 05 60 b5 10 80 01 	movl   $0x1,0x8010b560
80102031:	00 00 00 
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102034:	ba f6 01 00 00       	mov    $0x1f6,%edx
80102039:	b8 e0 ff ff ff       	mov    $0xffffffe0,%eax
8010203e:	ee                   	out    %al,(%dx)
    }
  }

  // Switch back to disk 0.
  outb(0x1f6, 0xe0 | (0<<4));
}
8010203f:	c9                   	leave  
80102040:	c3                   	ret    
80102041:	eb 0d                	jmp    80102050 <ideintr>
80102043:	90                   	nop
80102044:	90                   	nop
80102045:	90                   	nop
80102046:	90                   	nop
80102047:	90                   	nop
80102048:	90                   	nop
80102049:	90                   	nop
8010204a:	90                   	nop
8010204b:	90                   	nop
8010204c:	90                   	nop
8010204d:	90                   	nop
8010204e:	90                   	nop
8010204f:	90                   	nop

80102050 <ideintr>:
}

// Interrupt handler.
void
ideintr(void)
{
80102050:	55                   	push   %ebp
80102051:	89 e5                	mov    %esp,%ebp
80102053:	57                   	push   %edi
80102054:	56                   	push   %esi
80102055:	53                   	push   %ebx
80102056:	83 ec 18             	sub    $0x18,%esp
  struct buf *b;

  // First queued buffer is the active request.
  acquire(&idelock);
80102059:	68 80 b5 10 80       	push   $0x8010b580
8010205e:	e8 8d 28 00 00       	call   801048f0 <acquire>

  if((b = idequeue) == 0){
80102063:	8b 1d 64 b5 10 80    	mov    0x8010b564,%ebx
80102069:	83 c4 10             	add    $0x10,%esp
8010206c:	85 db                	test   %ebx,%ebx
8010206e:	74 34                	je     801020a4 <ideintr+0x54>
    release(&idelock);
    return;
  }
  idequeue = b->qnext;
80102070:	8b 43 58             	mov    0x58(%ebx),%eax
80102073:	a3 64 b5 10 80       	mov    %eax,0x8010b564

  // Read data if needed.
  if(!(b->flags & B_DIRTY) && idewait(1) >= 0)
80102078:	8b 33                	mov    (%ebx),%esi
8010207a:	f7 c6 04 00 00 00    	test   $0x4,%esi
80102080:	74 3e                	je     801020c0 <ideintr+0x70>
    insl(0x1f0, b->data, BSIZE/4);

  // Wake process waiting for this buf.
  b->flags |= B_VALID;
  b->flags &= ~B_DIRTY;
80102082:	83 e6 fb             	and    $0xfffffffb,%esi
  wakeup(b);
80102085:	83 ec 0c             	sub    $0xc,%esp
  if(!(b->flags & B_DIRTY) && idewait(1) >= 0)
    insl(0x1f0, b->data, BSIZE/4);

  // Wake process waiting for this buf.
  b->flags |= B_VALID;
  b->flags &= ~B_DIRTY;
80102088:	83 ce 02             	or     $0x2,%esi
8010208b:	89 33                	mov    %esi,(%ebx)
  wakeup(b);
8010208d:	53                   	push   %ebx
8010208e:	e8 ed 1f 00 00       	call   80104080 <wakeup>

  // Start disk on next buf in queue.
  if(idequeue != 0)
80102093:	a1 64 b5 10 80       	mov    0x8010b564,%eax
80102098:	83 c4 10             	add    $0x10,%esp
8010209b:	85 c0                	test   %eax,%eax
8010209d:	74 05                	je     801020a4 <ideintr+0x54>
    idestart(idequeue);
8010209f:	e8 5c fe ff ff       	call   80101f00 <idestart>

  // First queued buffer is the active request.
  acquire(&idelock);

  if((b = idequeue) == 0){
    release(&idelock);
801020a4:	83 ec 0c             	sub    $0xc,%esp
801020a7:	68 80 b5 10 80       	push   $0x8010b580
801020ac:	e8 5f 29 00 00       	call   80104a10 <release>
  // Start disk on next buf in queue.
  if(idequeue != 0)
    idestart(idequeue);

  release(&idelock);
}
801020b1:	8d 65 f4             	lea    -0xc(%ebp),%esp
801020b4:	5b                   	pop    %ebx
801020b5:	5e                   	pop    %esi
801020b6:	5f                   	pop    %edi
801020b7:	5d                   	pop    %ebp
801020b8:	c3                   	ret    
801020b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801020c0:	ba f7 01 00 00       	mov    $0x1f7,%edx
801020c5:	8d 76 00             	lea    0x0(%esi),%esi
801020c8:	ec                   	in     (%dx),%al
static int
idewait(int checkerr)
{
  int r;

  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
801020c9:	89 c1                	mov    %eax,%ecx
801020cb:	83 e1 c0             	and    $0xffffffc0,%ecx
801020ce:	80 f9 40             	cmp    $0x40,%cl
801020d1:	75 f5                	jne    801020c8 <ideintr+0x78>
    ;
  if(checkerr && (r & (IDE_DF|IDE_ERR)) != 0)
801020d3:	a8 21                	test   $0x21,%al
801020d5:	75 ab                	jne    80102082 <ideintr+0x32>
  }
  idequeue = b->qnext;

  // Read data if needed.
  if(!(b->flags & B_DIRTY) && idewait(1) >= 0)
    insl(0x1f0, b->data, BSIZE/4);
801020d7:	8d 7b 5c             	lea    0x5c(%ebx),%edi
}

static inline void
insl(int port, void *addr, int cnt)
{
  asm volatile("cld; rep insl" :
801020da:	b9 80 00 00 00       	mov    $0x80,%ecx
801020df:	ba f0 01 00 00       	mov    $0x1f0,%edx
801020e4:	fc                   	cld    
801020e5:	f3 6d                	rep insl (%dx),%es:(%edi)
801020e7:	8b 33                	mov    (%ebx),%esi
801020e9:	eb 97                	jmp    80102082 <ideintr+0x32>
801020eb:	90                   	nop
801020ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801020f0 <iderw>:
// Sync buf with disk.
// If B_DIRTY is set, write buf to disk, clear B_DIRTY, set B_VALID.
// Else if B_VALID is not set, read buf from disk, set B_VALID.
void
iderw(struct buf *b)
{
801020f0:	55                   	push   %ebp
801020f1:	89 e5                	mov    %esp,%ebp
801020f3:	53                   	push   %ebx
801020f4:	83 ec 10             	sub    $0x10,%esp
801020f7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct buf **pp;

  if(!holdingsleep(&b->lock))
801020fa:	8d 43 0c             	lea    0xc(%ebx),%eax
801020fd:	50                   	push   %eax
801020fe:	e8 bd 26 00 00       	call   801047c0 <holdingsleep>
80102103:	83 c4 10             	add    $0x10,%esp
80102106:	85 c0                	test   %eax,%eax
80102108:	0f 84 ad 00 00 00    	je     801021bb <iderw+0xcb>
    panic("iderw: buf not locked");
  if((b->flags & (B_VALID|B_DIRTY)) == B_VALID)
8010210e:	8b 03                	mov    (%ebx),%eax
80102110:	83 e0 06             	and    $0x6,%eax
80102113:	83 f8 02             	cmp    $0x2,%eax
80102116:	0f 84 b9 00 00 00    	je     801021d5 <iderw+0xe5>
    panic("iderw: nothing to do");
  if(b->dev != 0 && !havedisk1)
8010211c:	8b 53 04             	mov    0x4(%ebx),%edx
8010211f:	85 d2                	test   %edx,%edx
80102121:	74 0d                	je     80102130 <iderw+0x40>
80102123:	a1 60 b5 10 80       	mov    0x8010b560,%eax
80102128:	85 c0                	test   %eax,%eax
8010212a:	0f 84 98 00 00 00    	je     801021c8 <iderw+0xd8>
    panic("iderw: ide disk 1 not present");

  acquire(&idelock);  //DOC:acquire-lock
80102130:	83 ec 0c             	sub    $0xc,%esp
80102133:	68 80 b5 10 80       	push   $0x8010b580
80102138:	e8 b3 27 00 00       	call   801048f0 <acquire>

  // Append b to idequeue.
  b->qnext = 0;
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
8010213d:	8b 15 64 b5 10 80    	mov    0x8010b564,%edx
80102143:	83 c4 10             	add    $0x10,%esp
    panic("iderw: ide disk 1 not present");

  acquire(&idelock);  //DOC:acquire-lock

  // Append b to idequeue.
  b->qnext = 0;
80102146:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
8010214d:	85 d2                	test   %edx,%edx
8010214f:	75 09                	jne    8010215a <iderw+0x6a>
80102151:	eb 58                	jmp    801021ab <iderw+0xbb>
80102153:	90                   	nop
80102154:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102158:	89 c2                	mov    %eax,%edx
8010215a:	8b 42 58             	mov    0x58(%edx),%eax
8010215d:	85 c0                	test   %eax,%eax
8010215f:	75 f7                	jne    80102158 <iderw+0x68>
80102161:	83 c2 58             	add    $0x58,%edx
    ;
  *pp = b;
80102164:	89 1a                	mov    %ebx,(%edx)

  // Start disk if necessary.
  if(idequeue == b)
80102166:	3b 1d 64 b5 10 80    	cmp    0x8010b564,%ebx
8010216c:	74 44                	je     801021b2 <iderw+0xc2>
    idestart(b);

  // Wait for request to finish.
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
8010216e:	8b 03                	mov    (%ebx),%eax
80102170:	83 e0 06             	and    $0x6,%eax
80102173:	83 f8 02             	cmp    $0x2,%eax
80102176:	74 23                	je     8010219b <iderw+0xab>
80102178:	90                   	nop
80102179:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    sleep(b, &idelock);
80102180:	83 ec 08             	sub    $0x8,%esp
80102183:	68 80 b5 10 80       	push   $0x8010b580
80102188:	53                   	push   %ebx
80102189:	e8 32 1d 00 00       	call   80103ec0 <sleep>
  // Start disk if necessary.
  if(idequeue == b)
    idestart(b);

  // Wait for request to finish.
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
8010218e:	8b 03                	mov    (%ebx),%eax
80102190:	83 c4 10             	add    $0x10,%esp
80102193:	83 e0 06             	and    $0x6,%eax
80102196:	83 f8 02             	cmp    $0x2,%eax
80102199:	75 e5                	jne    80102180 <iderw+0x90>
    sleep(b, &idelock);
  }


  release(&idelock);
8010219b:	c7 45 08 80 b5 10 80 	movl   $0x8010b580,0x8(%ebp)
}
801021a2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801021a5:	c9                   	leave  
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
    sleep(b, &idelock);
  }


  release(&idelock);
801021a6:	e9 65 28 00 00       	jmp    80104a10 <release>

  acquire(&idelock);  //DOC:acquire-lock

  // Append b to idequeue.
  b->qnext = 0;
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
801021ab:	ba 64 b5 10 80       	mov    $0x8010b564,%edx
801021b0:	eb b2                	jmp    80102164 <iderw+0x74>
    ;
  *pp = b;

  // Start disk if necessary.
  if(idequeue == b)
    idestart(b);
801021b2:	89 d8                	mov    %ebx,%eax
801021b4:	e8 47 fd ff ff       	call   80101f00 <idestart>
801021b9:	eb b3                	jmp    8010216e <iderw+0x7e>
iderw(struct buf *b)
{
  struct buf **pp;

  if(!holdingsleep(&b->lock))
    panic("iderw: buf not locked");
801021bb:	83 ec 0c             	sub    $0xc,%esp
801021be:	68 0a 78 10 80       	push   $0x8010780a
801021c3:	e8 a8 e1 ff ff       	call   80100370 <panic>
  if((b->flags & (B_VALID|B_DIRTY)) == B_VALID)
    panic("iderw: nothing to do");
  if(b->dev != 0 && !havedisk1)
    panic("iderw: ide disk 1 not present");
801021c8:	83 ec 0c             	sub    $0xc,%esp
801021cb:	68 35 78 10 80       	push   $0x80107835
801021d0:	e8 9b e1 ff ff       	call   80100370 <panic>
  struct buf **pp;

  if(!holdingsleep(&b->lock))
    panic("iderw: buf not locked");
  if((b->flags & (B_VALID|B_DIRTY)) == B_VALID)
    panic("iderw: nothing to do");
801021d5:	83 ec 0c             	sub    $0xc,%esp
801021d8:	68 20 78 10 80       	push   $0x80107820
801021dd:	e8 8e e1 ff ff       	call   80100370 <panic>
801021e2:	66 90                	xchg   %ax,%ax
801021e4:	66 90                	xchg   %ax,%ax
801021e6:	66 90                	xchg   %ax,%ax
801021e8:	66 90                	xchg   %ax,%ax
801021ea:	66 90                	xchg   %ax,%ax
801021ec:	66 90                	xchg   %ax,%ax
801021ee:	66 90                	xchg   %ax,%ax

801021f0 <ioapicinit>:
  ioapic->data = data;
}

void
ioapicinit(void)
{
801021f0:	55                   	push   %ebp
  int i, id, maxintr;

  ioapic = (volatile struct ioapic*)IOAPIC;
801021f1:	c7 05 54 36 11 80 00 	movl   $0xfec00000,0x80113654
801021f8:	00 c0 fe 
  ioapic->data = data;
}

void
ioapicinit(void)
{
801021fb:	89 e5                	mov    %esp,%ebp
801021fd:	56                   	push   %esi
801021fe:	53                   	push   %ebx
};

static uint
ioapicread(int reg)
{
  ioapic->reg = reg;
801021ff:	c7 05 00 00 c0 fe 01 	movl   $0x1,0xfec00000
80102206:	00 00 00 
  return ioapic->data;
80102209:	8b 15 54 36 11 80    	mov    0x80113654,%edx
8010220f:	8b 72 10             	mov    0x10(%edx),%esi
};

static uint
ioapicread(int reg)
{
  ioapic->reg = reg;
80102212:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
  return ioapic->data;
80102218:	8b 0d 54 36 11 80    	mov    0x80113654,%ecx
  int i, id, maxintr;

  ioapic = (volatile struct ioapic*)IOAPIC;
  maxintr = (ioapicread(REG_VER) >> 16) & 0xFF;
  id = ioapicread(REG_ID) >> 24;
  if(id != ioapicid)
8010221e:	0f b6 15 80 37 11 80 	movzbl 0x80113780,%edx
ioapicinit(void)
{
  int i, id, maxintr;

  ioapic = (volatile struct ioapic*)IOAPIC;
  maxintr = (ioapicread(REG_VER) >> 16) & 0xFF;
80102225:	c1 ee 10             	shr    $0x10,%esi
80102228:	89 f0                	mov    %esi,%eax
8010222a:	0f b6 f0             	movzbl %al,%esi

static uint
ioapicread(int reg)
{
  ioapic->reg = reg;
  return ioapic->data;
8010222d:	8b 41 10             	mov    0x10(%ecx),%eax
{
  int i, id, maxintr;

  ioapic = (volatile struct ioapic*)IOAPIC;
  maxintr = (ioapicread(REG_VER) >> 16) & 0xFF;
  id = ioapicread(REG_ID) >> 24;
80102230:	c1 e8 18             	shr    $0x18,%eax
  if(id != ioapicid)
80102233:	39 d0                	cmp    %edx,%eax
80102235:	74 16                	je     8010224d <ioapicinit+0x5d>
    cprintf("ioapicinit: id isn't equal to ioapicid; not a MP\n");
80102237:	83 ec 0c             	sub    $0xc,%esp
8010223a:	68 54 78 10 80       	push   $0x80107854
8010223f:	e8 1c e4 ff ff       	call   80100660 <cprintf>
80102244:	8b 0d 54 36 11 80    	mov    0x80113654,%ecx
8010224a:	83 c4 10             	add    $0x10,%esp
8010224d:	83 c6 21             	add    $0x21,%esi
  ioapic->data = data;
}

void
ioapicinit(void)
{
80102250:	ba 10 00 00 00       	mov    $0x10,%edx
80102255:	b8 20 00 00 00       	mov    $0x20,%eax
8010225a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
}

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
80102260:	89 11                	mov    %edx,(%ecx)
  ioapic->data = data;
80102262:	8b 0d 54 36 11 80    	mov    0x80113654,%ecx
    cprintf("ioapicinit: id isn't equal to ioapicid; not a MP\n");

  // Mark all interrupts edge-triggered, active high, disabled,
  // and not routed to any CPUs.
  for(i = 0; i <= maxintr; i++){
    ioapicwrite(REG_TABLE+2*i, INT_DISABLED | (T_IRQ0 + i));
80102268:	89 c3                	mov    %eax,%ebx
8010226a:	81 cb 00 00 01 00    	or     $0x10000,%ebx
80102270:	83 c0 01             	add    $0x1,%eax

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
  ioapic->data = data;
80102273:	89 59 10             	mov    %ebx,0x10(%ecx)
80102276:	8d 5a 01             	lea    0x1(%edx),%ebx
80102279:	83 c2 02             	add    $0x2,%edx
  if(id != ioapicid)
    cprintf("ioapicinit: id isn't equal to ioapicid; not a MP\n");

  // Mark all interrupts edge-triggered, active high, disabled,
  // and not routed to any CPUs.
  for(i = 0; i <= maxintr; i++){
8010227c:	39 f0                	cmp    %esi,%eax
}

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
8010227e:	89 19                	mov    %ebx,(%ecx)
  ioapic->data = data;
80102280:	8b 0d 54 36 11 80    	mov    0x80113654,%ecx
80102286:	c7 41 10 00 00 00 00 	movl   $0x0,0x10(%ecx)
  if(id != ioapicid)
    cprintf("ioapicinit: id isn't equal to ioapicid; not a MP\n");

  // Mark all interrupts edge-triggered, active high, disabled,
  // and not routed to any CPUs.
  for(i = 0; i <= maxintr; i++){
8010228d:	75 d1                	jne    80102260 <ioapicinit+0x70>
    ioapicwrite(REG_TABLE+2*i, INT_DISABLED | (T_IRQ0 + i));
    ioapicwrite(REG_TABLE+2*i+1, 0);
  }
}
8010228f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102292:	5b                   	pop    %ebx
80102293:	5e                   	pop    %esi
80102294:	5d                   	pop    %ebp
80102295:	c3                   	ret    
80102296:	8d 76 00             	lea    0x0(%esi),%esi
80102299:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801022a0 <ioapicenable>:

void
ioapicenable(int irq, int cpunum)
{
801022a0:	55                   	push   %ebp
}

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
801022a1:	8b 0d 54 36 11 80    	mov    0x80113654,%ecx
  }
}

void
ioapicenable(int irq, int cpunum)
{
801022a7:	89 e5                	mov    %esp,%ebp
801022a9:	8b 45 08             	mov    0x8(%ebp),%eax
  // Mark interrupt edge-triggered, active high,
  // enabled, and routed to the given cpunum,
  // which happens to be that cpu's APIC ID.
  ioapicwrite(REG_TABLE+2*irq, T_IRQ0 + irq);
801022ac:	8d 50 20             	lea    0x20(%eax),%edx
801022af:	8d 44 00 10          	lea    0x10(%eax,%eax,1),%eax
}

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
801022b3:	89 01                	mov    %eax,(%ecx)
  ioapic->data = data;
801022b5:	8b 0d 54 36 11 80    	mov    0x80113654,%ecx
{
  // Mark interrupt edge-triggered, active high,
  // enabled, and routed to the given cpunum,
  // which happens to be that cpu's APIC ID.
  ioapicwrite(REG_TABLE+2*irq, T_IRQ0 + irq);
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
801022bb:	83 c0 01             	add    $0x1,%eax

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
  ioapic->data = data;
801022be:	89 51 10             	mov    %edx,0x10(%ecx)
{
  // Mark interrupt edge-triggered, active high,
  // enabled, and routed to the given cpunum,
  // which happens to be that cpu's APIC ID.
  ioapicwrite(REG_TABLE+2*irq, T_IRQ0 + irq);
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
801022c1:	8b 55 0c             	mov    0xc(%ebp),%edx
}

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
801022c4:	89 01                	mov    %eax,(%ecx)
  ioapic->data = data;
801022c6:	a1 54 36 11 80       	mov    0x80113654,%eax
{
  // Mark interrupt edge-triggered, active high,
  // enabled, and routed to the given cpunum,
  // which happens to be that cpu's APIC ID.
  ioapicwrite(REG_TABLE+2*irq, T_IRQ0 + irq);
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
801022cb:	c1 e2 18             	shl    $0x18,%edx

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
  ioapic->data = data;
801022ce:	89 50 10             	mov    %edx,0x10(%eax)
  // Mark interrupt edge-triggered, active high,
  // enabled, and routed to the given cpunum,
  // which happens to be that cpu's APIC ID.
  ioapicwrite(REG_TABLE+2*irq, T_IRQ0 + irq);
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
}
801022d1:	5d                   	pop    %ebp
801022d2:	c3                   	ret    
801022d3:	66 90                	xchg   %ax,%ax
801022d5:	66 90                	xchg   %ax,%ax
801022d7:	66 90                	xchg   %ax,%ax
801022d9:	66 90                	xchg   %ax,%ax
801022db:	66 90                	xchg   %ax,%ax
801022dd:	66 90                	xchg   %ax,%ax
801022df:	90                   	nop

801022e0 <kfree>:
// which normally should have been returned by a
// call to kalloc().  (The exception is when
// initializing the allocator; see kinit above.)
void
kfree(char *v)
{
801022e0:	55                   	push   %ebp
801022e1:	89 e5                	mov    %esp,%ebp
801022e3:	53                   	push   %ebx
801022e4:	83 ec 04             	sub    $0x4,%esp
801022e7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct run *r;

  if((uint)v % PGSIZE || v < end || V2P(v) >= PHYSTOP)
801022ea:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
801022f0:	75 70                	jne    80102362 <kfree+0x82>
801022f2:	81 fb c8 8b 11 80    	cmp    $0x80118bc8,%ebx
801022f8:	72 68                	jb     80102362 <kfree+0x82>
801022fa:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80102300:	3d ff ff ff 0d       	cmp    $0xdffffff,%eax
80102305:	77 5b                	ja     80102362 <kfree+0x82>
    panic("kfree");

  // Fill with junk to catch dangling refs.
  memset(v, 1, PGSIZE);
80102307:	83 ec 04             	sub    $0x4,%esp
8010230a:	68 00 10 00 00       	push   $0x1000
8010230f:	6a 01                	push   $0x1
80102311:	53                   	push   %ebx
80102312:	e8 49 27 00 00       	call   80104a60 <memset>

  if(kmem.use_lock)
80102317:	8b 15 94 36 11 80    	mov    0x80113694,%edx
8010231d:	83 c4 10             	add    $0x10,%esp
80102320:	85 d2                	test   %edx,%edx
80102322:	75 2c                	jne    80102350 <kfree+0x70>
    acquire(&kmem.lock);
  r = (struct run*)v;
  r->next = kmem.freelist;
80102324:	a1 98 36 11 80       	mov    0x80113698,%eax
80102329:	89 03                	mov    %eax,(%ebx)
  kmem.freelist = r;
  if(kmem.use_lock)
8010232b:	a1 94 36 11 80       	mov    0x80113694,%eax

  if(kmem.use_lock)
    acquire(&kmem.lock);
  r = (struct run*)v;
  r->next = kmem.freelist;
  kmem.freelist = r;
80102330:	89 1d 98 36 11 80    	mov    %ebx,0x80113698
  if(kmem.use_lock)
80102336:	85 c0                	test   %eax,%eax
80102338:	75 06                	jne    80102340 <kfree+0x60>
    release(&kmem.lock);
}
8010233a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010233d:	c9                   	leave  
8010233e:	c3                   	ret    
8010233f:	90                   	nop
    acquire(&kmem.lock);
  r = (struct run*)v;
  r->next = kmem.freelist;
  kmem.freelist = r;
  if(kmem.use_lock)
    release(&kmem.lock);
80102340:	c7 45 08 60 36 11 80 	movl   $0x80113660,0x8(%ebp)
}
80102347:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010234a:	c9                   	leave  
    acquire(&kmem.lock);
  r = (struct run*)v;
  r->next = kmem.freelist;
  kmem.freelist = r;
  if(kmem.use_lock)
    release(&kmem.lock);
8010234b:	e9 c0 26 00 00       	jmp    80104a10 <release>

  // Fill with junk to catch dangling refs.
  memset(v, 1, PGSIZE);

  if(kmem.use_lock)
    acquire(&kmem.lock);
80102350:	83 ec 0c             	sub    $0xc,%esp
80102353:	68 60 36 11 80       	push   $0x80113660
80102358:	e8 93 25 00 00       	call   801048f0 <acquire>
8010235d:	83 c4 10             	add    $0x10,%esp
80102360:	eb c2                	jmp    80102324 <kfree+0x44>
kfree(char *v)
{
  struct run *r;

  if((uint)v % PGSIZE || v < end || V2P(v) >= PHYSTOP)
    panic("kfree");
80102362:	83 ec 0c             	sub    $0xc,%esp
80102365:	68 86 78 10 80       	push   $0x80107886
8010236a:	e8 01 e0 ff ff       	call   80100370 <panic>
8010236f:	90                   	nop

80102370 <freerange>:
  kmem.use_lock = 1;
}

void
freerange(void *vstart, void *vend)
{
80102370:	55                   	push   %ebp
80102371:	89 e5                	mov    %esp,%ebp
80102373:	56                   	push   %esi
80102374:	53                   	push   %ebx
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
80102375:	8b 45 08             	mov    0x8(%ebp),%eax
  kmem.use_lock = 1;
}

void
freerange(void *vstart, void *vend)
{
80102378:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
8010237b:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102381:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102387:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010238d:	39 de                	cmp    %ebx,%esi
8010238f:	72 23                	jb     801023b4 <freerange+0x44>
80102391:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    kfree(p);
80102398:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
8010239e:	83 ec 0c             	sub    $0xc,%esp
void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801023a1:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    kfree(p);
801023a7:	50                   	push   %eax
801023a8:	e8 33 ff ff ff       	call   801022e0 <kfree>
void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801023ad:	83 c4 10             	add    $0x10,%esp
801023b0:	39 f3                	cmp    %esi,%ebx
801023b2:	76 e4                	jbe    80102398 <freerange+0x28>
    kfree(p);
}
801023b4:	8d 65 f8             	lea    -0x8(%ebp),%esp
801023b7:	5b                   	pop    %ebx
801023b8:	5e                   	pop    %esi
801023b9:	5d                   	pop    %ebp
801023ba:	c3                   	ret    
801023bb:	90                   	nop
801023bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801023c0 <kinit1>:
// the pages mapped by entrypgdir on free list.
// 2. main() calls kinit2() with the rest of the physical pages
// after installing a full page table that maps them on all cores.
void
kinit1(void *vstart, void *vend)
{
801023c0:	55                   	push   %ebp
801023c1:	89 e5                	mov    %esp,%ebp
801023c3:	56                   	push   %esi
801023c4:	53                   	push   %ebx
801023c5:	8b 75 0c             	mov    0xc(%ebp),%esi
  initlock(&kmem.lock, "kmem");
801023c8:	83 ec 08             	sub    $0x8,%esp
801023cb:	68 8c 78 10 80       	push   $0x8010788c
801023d0:	68 60 36 11 80       	push   $0x80113660
801023d5:	e8 16 24 00 00       	call   801047f0 <initlock>

void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
801023da:	8b 45 08             	mov    0x8(%ebp),%eax
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801023dd:	83 c4 10             	add    $0x10,%esp
// after installing a full page table that maps them on all cores.
void
kinit1(void *vstart, void *vend)
{
  initlock(&kmem.lock, "kmem");
  kmem.use_lock = 0;
801023e0:	c7 05 94 36 11 80 00 	movl   $0x0,0x80113694
801023e7:	00 00 00 

void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
801023ea:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
801023f0:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801023f6:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801023fc:	39 de                	cmp    %ebx,%esi
801023fe:	72 1c                	jb     8010241c <kinit1+0x5c>
    kfree(p);
80102400:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
80102406:	83 ec 0c             	sub    $0xc,%esp
void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102409:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    kfree(p);
8010240f:	50                   	push   %eax
80102410:	e8 cb fe ff ff       	call   801022e0 <kfree>
void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102415:	83 c4 10             	add    $0x10,%esp
80102418:	39 de                	cmp    %ebx,%esi
8010241a:	73 e4                	jae    80102400 <kinit1+0x40>
kinit1(void *vstart, void *vend)
{
  initlock(&kmem.lock, "kmem");
  kmem.use_lock = 0;
  freerange(vstart, vend);
}
8010241c:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010241f:	5b                   	pop    %ebx
80102420:	5e                   	pop    %esi
80102421:	5d                   	pop    %ebp
80102422:	c3                   	ret    
80102423:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102429:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102430 <kinit2>:

void
kinit2(void *vstart, void *vend)
{
80102430:	55                   	push   %ebp
80102431:	89 e5                	mov    %esp,%ebp
80102433:	56                   	push   %esi
80102434:	53                   	push   %ebx

void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
80102435:	8b 45 08             	mov    0x8(%ebp),%eax
  freerange(vstart, vend);
}

void
kinit2(void *vstart, void *vend)
{
80102438:	8b 75 0c             	mov    0xc(%ebp),%esi

void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
8010243b:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102441:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102447:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010244d:	39 de                	cmp    %ebx,%esi
8010244f:	72 23                	jb     80102474 <kinit2+0x44>
80102451:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    kfree(p);
80102458:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
8010245e:	83 ec 0c             	sub    $0xc,%esp
void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102461:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    kfree(p);
80102467:	50                   	push   %eax
80102468:	e8 73 fe ff ff       	call   801022e0 <kfree>
void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
8010246d:	83 c4 10             	add    $0x10,%esp
80102470:	39 de                	cmp    %ebx,%esi
80102472:	73 e4                	jae    80102458 <kinit2+0x28>

void
kinit2(void *vstart, void *vend)
{
  freerange(vstart, vend);
  kmem.use_lock = 1;
80102474:	c7 05 94 36 11 80 01 	movl   $0x1,0x80113694
8010247b:	00 00 00 
}
8010247e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102481:	5b                   	pop    %ebx
80102482:	5e                   	pop    %esi
80102483:	5d                   	pop    %ebp
80102484:	c3                   	ret    
80102485:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102489:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102490 <kalloc>:
// Allocate one 4096-byte page of physical memory.
// Returns a pointer that the kernel can use.
// Returns 0 if the memory cannot be allocated.
char*
kalloc(void)
{
80102490:	55                   	push   %ebp
80102491:	89 e5                	mov    %esp,%ebp
80102493:	53                   	push   %ebx
80102494:	83 ec 04             	sub    $0x4,%esp
  struct run *r;

  if(kmem.use_lock)
80102497:	a1 94 36 11 80       	mov    0x80113694,%eax
8010249c:	85 c0                	test   %eax,%eax
8010249e:	75 30                	jne    801024d0 <kalloc+0x40>
    acquire(&kmem.lock);
  r = kmem.freelist;
801024a0:	8b 1d 98 36 11 80    	mov    0x80113698,%ebx
  if(r)
801024a6:	85 db                	test   %ebx,%ebx
801024a8:	74 1c                	je     801024c6 <kalloc+0x36>
    kmem.freelist = r->next;
801024aa:	8b 13                	mov    (%ebx),%edx
801024ac:	89 15 98 36 11 80    	mov    %edx,0x80113698
  if(kmem.use_lock)
801024b2:	85 c0                	test   %eax,%eax
801024b4:	74 10                	je     801024c6 <kalloc+0x36>
    release(&kmem.lock);
801024b6:	83 ec 0c             	sub    $0xc,%esp
801024b9:	68 60 36 11 80       	push   $0x80113660
801024be:	e8 4d 25 00 00       	call   80104a10 <release>
801024c3:	83 c4 10             	add    $0x10,%esp
  return (char*)r;
}
801024c6:	89 d8                	mov    %ebx,%eax
801024c8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801024cb:	c9                   	leave  
801024cc:	c3                   	ret    
801024cd:	8d 76 00             	lea    0x0(%esi),%esi
kalloc(void)
{
  struct run *r;

  if(kmem.use_lock)
    acquire(&kmem.lock);
801024d0:	83 ec 0c             	sub    $0xc,%esp
801024d3:	68 60 36 11 80       	push   $0x80113660
801024d8:	e8 13 24 00 00       	call   801048f0 <acquire>
  r = kmem.freelist;
801024dd:	8b 1d 98 36 11 80    	mov    0x80113698,%ebx
  if(r)
801024e3:	83 c4 10             	add    $0x10,%esp
801024e6:	a1 94 36 11 80       	mov    0x80113694,%eax
801024eb:	85 db                	test   %ebx,%ebx
801024ed:	75 bb                	jne    801024aa <kalloc+0x1a>
801024ef:	eb c1                	jmp    801024b2 <kalloc+0x22>
801024f1:	66 90                	xchg   %ax,%ax
801024f3:	66 90                	xchg   %ax,%ax
801024f5:	66 90                	xchg   %ax,%ax
801024f7:	66 90                	xchg   %ax,%ax
801024f9:	66 90                	xchg   %ax,%ax
801024fb:	66 90                	xchg   %ax,%ax
801024fd:	66 90                	xchg   %ax,%ax
801024ff:	90                   	nop

80102500 <kbdgetc>:
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102500:	ba 64 00 00 00       	mov    $0x64,%edx
80102505:	ec                   	in     (%dx),%al
    normalmap, shiftmap, ctlmap, ctlmap
  };
  uint st, data, c;

  st = inb(KBSTATP);
  if((st & KBS_DIB) == 0)
80102506:	a8 01                	test   $0x1,%al
80102508:	0f 84 c2 00 00 00    	je     801025d0 <kbdgetc+0xd0>
8010250e:	ba 60 00 00 00       	mov    $0x60,%edx
80102513:	ec                   	in     (%dx),%al
    return -1;
  data = inb(KBDATAP);
80102514:	0f b6 d0             	movzbl %al,%edx

  if(data == 0xE0){
80102517:	81 fa e0 00 00 00    	cmp    $0xe0,%edx
8010251d:	0f 84 9d 00 00 00    	je     801025c0 <kbdgetc+0xc0>
    shift |= E0ESC;
    return 0;
  } else if(data & 0x80){
80102523:	84 c0                	test   %al,%al
80102525:	78 59                	js     80102580 <kbdgetc+0x80>
#include "defs.h"
#include "kbd.h"

int
kbdgetc(void)
{
80102527:	55                   	push   %ebp
80102528:	89 e5                	mov    %esp,%ebp
8010252a:	53                   	push   %ebx
  } else if(data & 0x80){
    // Key released
    data = (shift & E0ESC ? data : data & 0x7F);
    shift &= ~(shiftcode[data] | E0ESC);
    return 0;
  } else if(shift & E0ESC){
8010252b:	8b 1d b4 b5 10 80    	mov    0x8010b5b4,%ebx
80102531:	f6 c3 40             	test   $0x40,%bl
80102534:	74 09                	je     8010253f <kbdgetc+0x3f>
    // Last character was an E0 escape; or with 0x80
    data |= 0x80;
80102536:	83 c8 80             	or     $0xffffff80,%eax
    shift &= ~E0ESC;
80102539:	83 e3 bf             	and    $0xffffffbf,%ebx
    data = (shift & E0ESC ? data : data & 0x7F);
    shift &= ~(shiftcode[data] | E0ESC);
    return 0;
  } else if(shift & E0ESC){
    // Last character was an E0 escape; or with 0x80
    data |= 0x80;
8010253c:	0f b6 d0             	movzbl %al,%edx
    shift &= ~E0ESC;
  }

  shift |= shiftcode[data];
8010253f:	0f b6 8a c0 79 10 80 	movzbl -0x7fef8640(%edx),%ecx
  shift ^= togglecode[data];
80102546:	0f b6 82 c0 78 10 80 	movzbl -0x7fef8740(%edx),%eax
    // Last character was an E0 escape; or with 0x80
    data |= 0x80;
    shift &= ~E0ESC;
  }

  shift |= shiftcode[data];
8010254d:	09 d9                	or     %ebx,%ecx
  shift ^= togglecode[data];
8010254f:	31 c1                	xor    %eax,%ecx
  c = charcode[shift & (CTL | SHIFT)][data];
80102551:	89 c8                	mov    %ecx,%eax
    data |= 0x80;
    shift &= ~E0ESC;
  }

  shift |= shiftcode[data];
  shift ^= togglecode[data];
80102553:	89 0d b4 b5 10 80    	mov    %ecx,0x8010b5b4
  c = charcode[shift & (CTL | SHIFT)][data];
80102559:	83 e0 03             	and    $0x3,%eax
  if(shift & CAPSLOCK){
8010255c:	83 e1 08             	and    $0x8,%ecx
    shift &= ~E0ESC;
  }

  shift |= shiftcode[data];
  shift ^= togglecode[data];
  c = charcode[shift & (CTL | SHIFT)][data];
8010255f:	8b 04 85 a0 78 10 80 	mov    -0x7fef8760(,%eax,4),%eax
80102566:	0f b6 04 10          	movzbl (%eax,%edx,1),%eax
  if(shift & CAPSLOCK){
8010256a:	74 0b                	je     80102577 <kbdgetc+0x77>
    if('a' <= c && c <= 'z')
8010256c:	8d 50 9f             	lea    -0x61(%eax),%edx
8010256f:	83 fa 19             	cmp    $0x19,%edx
80102572:	77 3c                	ja     801025b0 <kbdgetc+0xb0>
      c += 'A' - 'a';
80102574:	83 e8 20             	sub    $0x20,%eax
    else if('A' <= c && c <= 'Z')
      c += 'a' - 'A';
  }
  return c;
}
80102577:	5b                   	pop    %ebx
80102578:	5d                   	pop    %ebp
80102579:	c3                   	ret    
8010257a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  if(data == 0xE0){
    shift |= E0ESC;
    return 0;
  } else if(data & 0x80){
    // Key released
    data = (shift & E0ESC ? data : data & 0x7F);
80102580:	8b 0d b4 b5 10 80    	mov    0x8010b5b4,%ecx
80102586:	83 e0 7f             	and    $0x7f,%eax
80102589:	f6 c1 40             	test   $0x40,%cl
8010258c:	0f 44 d0             	cmove  %eax,%edx
    shift &= ~(shiftcode[data] | E0ESC);
8010258f:	0f b6 82 c0 79 10 80 	movzbl -0x7fef8640(%edx),%eax
80102596:	83 c8 40             	or     $0x40,%eax
80102599:	0f b6 c0             	movzbl %al,%eax
8010259c:	f7 d0                	not    %eax
8010259e:	21 c8                	and    %ecx,%eax
801025a0:	a3 b4 b5 10 80       	mov    %eax,0x8010b5b4
    return 0;
801025a5:	31 c0                	xor    %eax,%eax
801025a7:	c3                   	ret    
801025a8:	90                   	nop
801025a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  shift ^= togglecode[data];
  c = charcode[shift & (CTL | SHIFT)][data];
  if(shift & CAPSLOCK){
    if('a' <= c && c <= 'z')
      c += 'A' - 'a';
    else if('A' <= c && c <= 'Z')
801025b0:	8d 48 bf             	lea    -0x41(%eax),%ecx
      c += 'a' - 'A';
801025b3:	8d 50 20             	lea    0x20(%eax),%edx
  }
  return c;
}
801025b6:	5b                   	pop    %ebx
  c = charcode[shift & (CTL | SHIFT)][data];
  if(shift & CAPSLOCK){
    if('a' <= c && c <= 'z')
      c += 'A' - 'a';
    else if('A' <= c && c <= 'Z')
      c += 'a' - 'A';
801025b7:	83 f9 19             	cmp    $0x19,%ecx
801025ba:	0f 46 c2             	cmovbe %edx,%eax
  }
  return c;
}
801025bd:	5d                   	pop    %ebp
801025be:	c3                   	ret    
801025bf:	90                   	nop
  if((st & KBS_DIB) == 0)
    return -1;
  data = inb(KBDATAP);

  if(data == 0xE0){
    shift |= E0ESC;
801025c0:	83 0d b4 b5 10 80 40 	orl    $0x40,0x8010b5b4
    return 0;
801025c7:	31 c0                	xor    %eax,%eax
801025c9:	c3                   	ret    
801025ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  };
  uint st, data, c;

  st = inb(KBSTATP);
  if((st & KBS_DIB) == 0)
    return -1;
801025d0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801025d5:	c3                   	ret    
801025d6:	8d 76 00             	lea    0x0(%esi),%esi
801025d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801025e0 <kbdintr>:
  return c;
}

void
kbdintr(void)
{
801025e0:	55                   	push   %ebp
801025e1:	89 e5                	mov    %esp,%ebp
801025e3:	83 ec 14             	sub    $0x14,%esp
  consoleintr(kbdgetc);
801025e6:	68 00 25 10 80       	push   $0x80102500
801025eb:	e8 f0 e1 ff ff       	call   801007e0 <consoleintr>
}
801025f0:	83 c4 10             	add    $0x10,%esp
801025f3:	c9                   	leave  
801025f4:	c3                   	ret    
801025f5:	66 90                	xchg   %ax,%ax
801025f7:	66 90                	xchg   %ax,%ax
801025f9:	66 90                	xchg   %ax,%ax
801025fb:	66 90                	xchg   %ax,%ax
801025fd:	66 90                	xchg   %ax,%ax
801025ff:	90                   	nop

80102600 <lapicinit>:
}

void
lapicinit(void)
{
  if(!lapic)
80102600:	a1 9c 36 11 80       	mov    0x8011369c,%eax
  lapic[ID];  // wait for write to finish, by reading
}

void
lapicinit(void)
{
80102605:	55                   	push   %ebp
80102606:	89 e5                	mov    %esp,%ebp
  if(!lapic)
80102608:	85 c0                	test   %eax,%eax
8010260a:	0f 84 c8 00 00 00    	je     801026d8 <lapicinit+0xd8>

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102610:	c7 80 f0 00 00 00 3f 	movl   $0x13f,0xf0(%eax)
80102617:	01 00 00 
  lapic[ID];  // wait for write to finish, by reading
8010261a:	8b 50 20             	mov    0x20(%eax),%edx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010261d:	c7 80 e0 03 00 00 0b 	movl   $0xb,0x3e0(%eax)
80102624:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102627:	8b 50 20             	mov    0x20(%eax),%edx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010262a:	c7 80 20 03 00 00 20 	movl   $0x20020,0x320(%eax)
80102631:	00 02 00 
  lapic[ID];  // wait for write to finish, by reading
80102634:	8b 50 20             	mov    0x20(%eax),%edx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102637:	c7 80 80 03 00 00 80 	movl   $0x989680,0x380(%eax)
8010263e:	96 98 00 
  lapic[ID];  // wait for write to finish, by reading
80102641:	8b 50 20             	mov    0x20(%eax),%edx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102644:	c7 80 50 03 00 00 00 	movl   $0x10000,0x350(%eax)
8010264b:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
8010264e:	8b 50 20             	mov    0x20(%eax),%edx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102651:	c7 80 60 03 00 00 00 	movl   $0x10000,0x360(%eax)
80102658:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
8010265b:	8b 50 20             	mov    0x20(%eax),%edx
  lapicw(LINT0, MASKED);
  lapicw(LINT1, MASKED);

  // Disable performance counter overflow interrupts
  // on machines that provide that interrupt entry.
  if(((lapic[VER]>>16) & 0xFF) >= 4)
8010265e:	8b 50 30             	mov    0x30(%eax),%edx
80102661:	c1 ea 10             	shr    $0x10,%edx
80102664:	80 fa 03             	cmp    $0x3,%dl
80102667:	77 77                	ja     801026e0 <lapicinit+0xe0>

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102669:	c7 80 70 03 00 00 33 	movl   $0x33,0x370(%eax)
80102670:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102673:	8b 50 20             	mov    0x20(%eax),%edx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102676:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
8010267d:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102680:	8b 50 20             	mov    0x20(%eax),%edx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102683:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
8010268a:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
8010268d:	8b 50 20             	mov    0x20(%eax),%edx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102690:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
80102697:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
8010269a:	8b 50 20             	mov    0x20(%eax),%edx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010269d:	c7 80 10 03 00 00 00 	movl   $0x0,0x310(%eax)
801026a4:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
801026a7:	8b 50 20             	mov    0x20(%eax),%edx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
801026aa:	c7 80 00 03 00 00 00 	movl   $0x88500,0x300(%eax)
801026b1:	85 08 00 
  lapic[ID];  // wait for write to finish, by reading
801026b4:	8b 50 20             	mov    0x20(%eax),%edx
801026b7:	89 f6                	mov    %esi,%esi
801026b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  lapicw(EOI, 0);

  // Send an Init Level De-Assert to synchronise arbitration ID's.
  lapicw(ICRHI, 0);
  lapicw(ICRLO, BCAST | INIT | LEVEL);
  while(lapic[ICRLO] & DELIVS)
801026c0:	8b 90 00 03 00 00    	mov    0x300(%eax),%edx
801026c6:	80 e6 10             	and    $0x10,%dh
801026c9:	75 f5                	jne    801026c0 <lapicinit+0xc0>

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
801026cb:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
801026d2:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
801026d5:	8b 40 20             	mov    0x20(%eax),%eax
  while(lapic[ICRLO] & DELIVS)
    ;

  // Enable interrupts on the APIC (but not on the processor).
  lapicw(TPR, 0);
}
801026d8:	5d                   	pop    %ebp
801026d9:	c3                   	ret    
801026da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
801026e0:	c7 80 40 03 00 00 00 	movl   $0x10000,0x340(%eax)
801026e7:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
801026ea:	8b 50 20             	mov    0x20(%eax),%edx
801026ed:	e9 77 ff ff ff       	jmp    80102669 <lapicinit+0x69>
801026f2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801026f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102700 <lapicid>:
}

int
lapicid(void)
{
  if (!lapic)
80102700:	a1 9c 36 11 80       	mov    0x8011369c,%eax
  lapicw(TPR, 0);
}

int
lapicid(void)
{
80102705:	55                   	push   %ebp
80102706:	89 e5                	mov    %esp,%ebp
  if (!lapic)
80102708:	85 c0                	test   %eax,%eax
8010270a:	74 0c                	je     80102718 <lapicid+0x18>
    return 0;
  return lapic[ID] >> 24;
8010270c:	8b 40 20             	mov    0x20(%eax),%eax
}
8010270f:	5d                   	pop    %ebp
int
lapicid(void)
{
  if (!lapic)
    return 0;
  return lapic[ID] >> 24;
80102710:	c1 e8 18             	shr    $0x18,%eax
}
80102713:	c3                   	ret    
80102714:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102718:	31 c0                	xor    %eax,%eax
8010271a:	5d                   	pop    %ebp
8010271b:	c3                   	ret    
8010271c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102720 <lapiceoi>:

// Acknowledge interrupt.
void
lapiceoi(void)
{
  if(lapic)
80102720:	a1 9c 36 11 80       	mov    0x8011369c,%eax
}

// Acknowledge interrupt.
void
lapiceoi(void)
{
80102725:	55                   	push   %ebp
80102726:	89 e5                	mov    %esp,%ebp
  if(lapic)
80102728:	85 c0                	test   %eax,%eax
8010272a:	74 0d                	je     80102739 <lapiceoi+0x19>

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010272c:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
80102733:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102736:	8b 40 20             	mov    0x20(%eax),%eax
void
lapiceoi(void)
{
  if(lapic)
    lapicw(EOI, 0);
}
80102739:	5d                   	pop    %ebp
8010273a:	c3                   	ret    
8010273b:	90                   	nop
8010273c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102740 <microdelay>:

// Spin for a given number of microseconds.
// On real hardware would want to tune this dynamically.
void
microdelay(int us)
{
80102740:	55                   	push   %ebp
80102741:	89 e5                	mov    %esp,%ebp
}
80102743:	5d                   	pop    %ebp
80102744:	c3                   	ret    
80102745:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102749:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102750 <lapicstartap>:

// Start additional processor running entry code at addr.
// See Appendix B of MultiProcessor Specification.
void
lapicstartap(uchar apicid, uint addr)
{
80102750:	55                   	push   %ebp
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102751:	ba 70 00 00 00       	mov    $0x70,%edx
80102756:	b8 0f 00 00 00       	mov    $0xf,%eax
8010275b:	89 e5                	mov    %esp,%ebp
8010275d:	53                   	push   %ebx
8010275e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80102761:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102764:	ee                   	out    %al,(%dx)
80102765:	ba 71 00 00 00       	mov    $0x71,%edx
8010276a:	b8 0a 00 00 00       	mov    $0xa,%eax
8010276f:	ee                   	out    %al,(%dx)
  // and the warm reset vector (DWORD based at 40:67) to point at
  // the AP startup code prior to the [universal startup algorithm]."
  outb(CMOS_PORT, 0xF);  // offset 0xF is shutdown code
  outb(CMOS_PORT+1, 0x0A);
  wrv = (ushort*)P2V((0x40<<4 | 0x67));  // Warm reset vector
  wrv[0] = 0;
80102770:	31 c0                	xor    %eax,%eax
  wrv[1] = addr >> 4;

  // "Universal startup algorithm."
  // Send INIT (level-triggered) interrupt to reset other CPU.
  lapicw(ICRHI, apicid<<24);
80102772:	c1 e3 18             	shl    $0x18,%ebx
  // and the warm reset vector (DWORD based at 40:67) to point at
  // the AP startup code prior to the [universal startup algorithm]."
  outb(CMOS_PORT, 0xF);  // offset 0xF is shutdown code
  outb(CMOS_PORT+1, 0x0A);
  wrv = (ushort*)P2V((0x40<<4 | 0x67));  // Warm reset vector
  wrv[0] = 0;
80102775:	66 a3 67 04 00 80    	mov    %ax,0x80000467
  wrv[1] = addr >> 4;
8010277b:	89 c8                	mov    %ecx,%eax
  // when it is in the halted state due to an INIT.  So the second
  // should be ignored, but it is part of the official Intel algorithm.
  // Bochs complains about the second one.  Too bad for Bochs.
  for(i = 0; i < 2; i++){
    lapicw(ICRHI, apicid<<24);
    lapicw(ICRLO, STARTUP | (addr>>12));
8010277d:	c1 e9 0c             	shr    $0xc,%ecx
  // the AP startup code prior to the [universal startup algorithm]."
  outb(CMOS_PORT, 0xF);  // offset 0xF is shutdown code
  outb(CMOS_PORT+1, 0x0A);
  wrv = (ushort*)P2V((0x40<<4 | 0x67));  // Warm reset vector
  wrv[0] = 0;
  wrv[1] = addr >> 4;
80102780:	c1 e8 04             	shr    $0x4,%eax

  // "Universal startup algorithm."
  // Send INIT (level-triggered) interrupt to reset other CPU.
  lapicw(ICRHI, apicid<<24);
80102783:	89 da                	mov    %ebx,%edx
  // when it is in the halted state due to an INIT.  So the second
  // should be ignored, but it is part of the official Intel algorithm.
  // Bochs complains about the second one.  Too bad for Bochs.
  for(i = 0; i < 2; i++){
    lapicw(ICRHI, apicid<<24);
    lapicw(ICRLO, STARTUP | (addr>>12));
80102785:	80 cd 06             	or     $0x6,%ch
  // the AP startup code prior to the [universal startup algorithm]."
  outb(CMOS_PORT, 0xF);  // offset 0xF is shutdown code
  outb(CMOS_PORT+1, 0x0A);
  wrv = (ushort*)P2V((0x40<<4 | 0x67));  // Warm reset vector
  wrv[0] = 0;
  wrv[1] = addr >> 4;
80102788:	66 a3 69 04 00 80    	mov    %ax,0x80000469

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010278e:	a1 9c 36 11 80       	mov    0x8011369c,%eax
80102793:	89 98 10 03 00 00    	mov    %ebx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
80102799:	8b 58 20             	mov    0x20(%eax),%ebx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010279c:	c7 80 00 03 00 00 00 	movl   $0xc500,0x300(%eax)
801027a3:	c5 00 00 
  lapic[ID];  // wait for write to finish, by reading
801027a6:	8b 58 20             	mov    0x20(%eax),%ebx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
801027a9:	c7 80 00 03 00 00 00 	movl   $0x8500,0x300(%eax)
801027b0:	85 00 00 
  lapic[ID];  // wait for write to finish, by reading
801027b3:	8b 58 20             	mov    0x20(%eax),%ebx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
801027b6:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
801027bc:	8b 58 20             	mov    0x20(%eax),%ebx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
801027bf:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
  lapic[ID];  // wait for write to finish, by reading
801027c5:	8b 58 20             	mov    0x20(%eax),%ebx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
801027c8:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
801027ce:	8b 50 20             	mov    0x20(%eax),%edx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
801027d1:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
  lapic[ID];  // wait for write to finish, by reading
801027d7:	8b 40 20             	mov    0x20(%eax),%eax
  for(i = 0; i < 2; i++){
    lapicw(ICRHI, apicid<<24);
    lapicw(ICRLO, STARTUP | (addr>>12));
    microdelay(200);
  }
}
801027da:	5b                   	pop    %ebx
801027db:	5d                   	pop    %ebp
801027dc:	c3                   	ret    
801027dd:	8d 76 00             	lea    0x0(%esi),%esi

801027e0 <cmostime>:
  r->year   = cmos_read(YEAR);
}

// qemu seems to use 24-hour GWT and the values are BCD encoded
void cmostime(struct rtcdate *r)
{
801027e0:	55                   	push   %ebp
801027e1:	ba 70 00 00 00       	mov    $0x70,%edx
801027e6:	b8 0b 00 00 00       	mov    $0xb,%eax
801027eb:	89 e5                	mov    %esp,%ebp
801027ed:	57                   	push   %edi
801027ee:	56                   	push   %esi
801027ef:	53                   	push   %ebx
801027f0:	83 ec 5c             	sub    $0x5c,%esp
801027f3:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801027f4:	ba 71 00 00 00       	mov    $0x71,%edx
801027f9:	ec                   	in     (%dx),%al
801027fa:	83 e0 04             	and    $0x4,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801027fd:	bb 70 00 00 00       	mov    $0x70,%ebx
80102802:	88 45 a7             	mov    %al,-0x59(%ebp)
80102805:	8d 76 00             	lea    0x0(%esi),%esi
80102808:	31 c0                	xor    %eax,%eax
8010280a:	89 da                	mov    %ebx,%edx
8010280c:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010280d:	b9 71 00 00 00       	mov    $0x71,%ecx
80102812:	89 ca                	mov    %ecx,%edx
80102814:	ec                   	in     (%dx),%al
static uint cmos_read(uint reg)
{
  outb(CMOS_PORT,  reg);
  microdelay(200);

  return inb(CMOS_RETURN);
80102815:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102818:	89 da                	mov    %ebx,%edx
8010281a:	89 45 b4             	mov    %eax,-0x4c(%ebp)
8010281d:	b8 02 00 00 00       	mov    $0x2,%eax
80102822:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102823:	89 ca                	mov    %ecx,%edx
80102825:	ec                   	in     (%dx),%al
80102826:	0f b6 f0             	movzbl %al,%esi
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102829:	89 da                	mov    %ebx,%edx
8010282b:	b8 04 00 00 00       	mov    $0x4,%eax
80102830:	89 75 b0             	mov    %esi,-0x50(%ebp)
80102833:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102834:	89 ca                	mov    %ecx,%edx
80102836:	ec                   	in     (%dx),%al
80102837:	0f b6 f8             	movzbl %al,%edi
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010283a:	89 da                	mov    %ebx,%edx
8010283c:	b8 07 00 00 00       	mov    $0x7,%eax
80102841:	89 7d ac             	mov    %edi,-0x54(%ebp)
80102844:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102845:	89 ca                	mov    %ecx,%edx
80102847:	ec                   	in     (%dx),%al
80102848:	0f b6 d0             	movzbl %al,%edx
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010284b:	b8 08 00 00 00       	mov    $0x8,%eax
80102850:	89 55 a8             	mov    %edx,-0x58(%ebp)
80102853:	89 da                	mov    %ebx,%edx
80102855:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102856:	89 ca                	mov    %ecx,%edx
80102858:	ec                   	in     (%dx),%al
80102859:	0f b6 f8             	movzbl %al,%edi
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010285c:	89 da                	mov    %ebx,%edx
8010285e:	b8 09 00 00 00       	mov    $0x9,%eax
80102863:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102864:	89 ca                	mov    %ecx,%edx
80102866:	ec                   	in     (%dx),%al
80102867:	0f b6 f0             	movzbl %al,%esi
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010286a:	89 da                	mov    %ebx,%edx
8010286c:	b8 0a 00 00 00       	mov    $0xa,%eax
80102871:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102872:	89 ca                	mov    %ecx,%edx
80102874:	ec                   	in     (%dx),%al
  bcd = (sb & (1 << 2)) == 0;

  // make sure CMOS doesn't modify time while we read it
  for(;;) {
    fill_rtcdate(&t1);
    if(cmos_read(CMOS_STATA) & CMOS_UIP)
80102875:	84 c0                	test   %al,%al
80102877:	78 8f                	js     80102808 <cmostime+0x28>
80102879:	8b 45 b4             	mov    -0x4c(%ebp),%eax
8010287c:	8b 55 a8             	mov    -0x58(%ebp),%edx
8010287f:	89 7d c8             	mov    %edi,-0x38(%ebp)
80102882:	89 75 cc             	mov    %esi,-0x34(%ebp)
80102885:	89 45 b8             	mov    %eax,-0x48(%ebp)
80102888:	8b 45 b0             	mov    -0x50(%ebp),%eax
8010288b:	89 55 c4             	mov    %edx,-0x3c(%ebp)
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010288e:	89 da                	mov    %ebx,%edx
80102890:	89 45 bc             	mov    %eax,-0x44(%ebp)
80102893:	8b 45 ac             	mov    -0x54(%ebp),%eax
80102896:	89 45 c0             	mov    %eax,-0x40(%ebp)
80102899:	31 c0                	xor    %eax,%eax
8010289b:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010289c:	89 ca                	mov    %ecx,%edx
8010289e:	ec                   	in     (%dx),%al
static uint cmos_read(uint reg)
{
  outb(CMOS_PORT,  reg);
  microdelay(200);

  return inb(CMOS_RETURN);
8010289f:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801028a2:	89 da                	mov    %ebx,%edx
801028a4:	89 45 d0             	mov    %eax,-0x30(%ebp)
801028a7:	b8 02 00 00 00       	mov    $0x2,%eax
801028ac:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801028ad:	89 ca                	mov    %ecx,%edx
801028af:	ec                   	in     (%dx),%al
801028b0:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801028b3:	89 da                	mov    %ebx,%edx
801028b5:	89 45 d4             	mov    %eax,-0x2c(%ebp)
801028b8:	b8 04 00 00 00       	mov    $0x4,%eax
801028bd:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801028be:	89 ca                	mov    %ecx,%edx
801028c0:	ec                   	in     (%dx),%al
801028c1:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801028c4:	89 da                	mov    %ebx,%edx
801028c6:	89 45 d8             	mov    %eax,-0x28(%ebp)
801028c9:	b8 07 00 00 00       	mov    $0x7,%eax
801028ce:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801028cf:	89 ca                	mov    %ecx,%edx
801028d1:	ec                   	in     (%dx),%al
801028d2:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801028d5:	89 da                	mov    %ebx,%edx
801028d7:	89 45 dc             	mov    %eax,-0x24(%ebp)
801028da:	b8 08 00 00 00       	mov    $0x8,%eax
801028df:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801028e0:	89 ca                	mov    %ecx,%edx
801028e2:	ec                   	in     (%dx),%al
801028e3:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801028e6:	89 da                	mov    %ebx,%edx
801028e8:	89 45 e0             	mov    %eax,-0x20(%ebp)
801028eb:	b8 09 00 00 00       	mov    $0x9,%eax
801028f0:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801028f1:	89 ca                	mov    %ecx,%edx
801028f3:	ec                   	in     (%dx),%al
801028f4:	0f b6 c0             	movzbl %al,%eax
  for(;;) {
    fill_rtcdate(&t1);
    if(cmos_read(CMOS_STATA) & CMOS_UIP)
        continue;
    fill_rtcdate(&t2);
    if(memcmp(&t1, &t2, sizeof(t1)) == 0)
801028f7:	83 ec 04             	sub    $0x4,%esp
static uint cmos_read(uint reg)
{
  outb(CMOS_PORT,  reg);
  microdelay(200);

  return inb(CMOS_RETURN);
801028fa:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  for(;;) {
    fill_rtcdate(&t1);
    if(cmos_read(CMOS_STATA) & CMOS_UIP)
        continue;
    fill_rtcdate(&t2);
    if(memcmp(&t1, &t2, sizeof(t1)) == 0)
801028fd:	8d 45 d0             	lea    -0x30(%ebp),%eax
80102900:	6a 18                	push   $0x18
80102902:	50                   	push   %eax
80102903:	8d 45 b8             	lea    -0x48(%ebp),%eax
80102906:	50                   	push   %eax
80102907:	e8 a4 21 00 00       	call   80104ab0 <memcmp>
8010290c:	83 c4 10             	add    $0x10,%esp
8010290f:	85 c0                	test   %eax,%eax
80102911:	0f 85 f1 fe ff ff    	jne    80102808 <cmostime+0x28>
      break;
  }

  // convert
  if(bcd) {
80102917:	80 7d a7 00          	cmpb   $0x0,-0x59(%ebp)
8010291b:	75 78                	jne    80102995 <cmostime+0x1b5>
#define    CONV(x)     (t1.x = ((t1.x >> 4) * 10) + (t1.x & 0xf))
    CONV(second);
8010291d:	8b 45 b8             	mov    -0x48(%ebp),%eax
80102920:	89 c2                	mov    %eax,%edx
80102922:	83 e0 0f             	and    $0xf,%eax
80102925:	c1 ea 04             	shr    $0x4,%edx
80102928:	8d 14 92             	lea    (%edx,%edx,4),%edx
8010292b:	8d 04 50             	lea    (%eax,%edx,2),%eax
8010292e:	89 45 b8             	mov    %eax,-0x48(%ebp)
    CONV(minute);
80102931:	8b 45 bc             	mov    -0x44(%ebp),%eax
80102934:	89 c2                	mov    %eax,%edx
80102936:	83 e0 0f             	and    $0xf,%eax
80102939:	c1 ea 04             	shr    $0x4,%edx
8010293c:	8d 14 92             	lea    (%edx,%edx,4),%edx
8010293f:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102942:	89 45 bc             	mov    %eax,-0x44(%ebp)
    CONV(hour  );
80102945:	8b 45 c0             	mov    -0x40(%ebp),%eax
80102948:	89 c2                	mov    %eax,%edx
8010294a:	83 e0 0f             	and    $0xf,%eax
8010294d:	c1 ea 04             	shr    $0x4,%edx
80102950:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102953:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102956:	89 45 c0             	mov    %eax,-0x40(%ebp)
    CONV(day   );
80102959:	8b 45 c4             	mov    -0x3c(%ebp),%eax
8010295c:	89 c2                	mov    %eax,%edx
8010295e:	83 e0 0f             	and    $0xf,%eax
80102961:	c1 ea 04             	shr    $0x4,%edx
80102964:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102967:	8d 04 50             	lea    (%eax,%edx,2),%eax
8010296a:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    CONV(month );
8010296d:	8b 45 c8             	mov    -0x38(%ebp),%eax
80102970:	89 c2                	mov    %eax,%edx
80102972:	83 e0 0f             	and    $0xf,%eax
80102975:	c1 ea 04             	shr    $0x4,%edx
80102978:	8d 14 92             	lea    (%edx,%edx,4),%edx
8010297b:	8d 04 50             	lea    (%eax,%edx,2),%eax
8010297e:	89 45 c8             	mov    %eax,-0x38(%ebp)
    CONV(year  );
80102981:	8b 45 cc             	mov    -0x34(%ebp),%eax
80102984:	89 c2                	mov    %eax,%edx
80102986:	83 e0 0f             	and    $0xf,%eax
80102989:	c1 ea 04             	shr    $0x4,%edx
8010298c:	8d 14 92             	lea    (%edx,%edx,4),%edx
8010298f:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102992:	89 45 cc             	mov    %eax,-0x34(%ebp)
#undef     CONV
  }

  *r = t1;
80102995:	8b 75 08             	mov    0x8(%ebp),%esi
80102998:	8b 45 b8             	mov    -0x48(%ebp),%eax
8010299b:	89 06                	mov    %eax,(%esi)
8010299d:	8b 45 bc             	mov    -0x44(%ebp),%eax
801029a0:	89 46 04             	mov    %eax,0x4(%esi)
801029a3:	8b 45 c0             	mov    -0x40(%ebp),%eax
801029a6:	89 46 08             	mov    %eax,0x8(%esi)
801029a9:	8b 45 c4             	mov    -0x3c(%ebp),%eax
801029ac:	89 46 0c             	mov    %eax,0xc(%esi)
801029af:	8b 45 c8             	mov    -0x38(%ebp),%eax
801029b2:	89 46 10             	mov    %eax,0x10(%esi)
801029b5:	8b 45 cc             	mov    -0x34(%ebp),%eax
801029b8:	89 46 14             	mov    %eax,0x14(%esi)
  r->year += 2000;
801029bb:	81 46 14 d0 07 00 00 	addl   $0x7d0,0x14(%esi)
}
801029c2:	8d 65 f4             	lea    -0xc(%ebp),%esp
801029c5:	5b                   	pop    %ebx
801029c6:	5e                   	pop    %esi
801029c7:	5f                   	pop    %edi
801029c8:	5d                   	pop    %ebp
801029c9:	c3                   	ret    
801029ca:	66 90                	xchg   %ax,%ax
801029cc:	66 90                	xchg   %ax,%ax
801029ce:	66 90                	xchg   %ax,%ax

801029d0 <install_trans>:
static void
install_trans(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
801029d0:	8b 0d e8 36 11 80    	mov    0x801136e8,%ecx
801029d6:	85 c9                	test   %ecx,%ecx
801029d8:	0f 8e 85 00 00 00    	jle    80102a63 <install_trans+0x93>
}

// Copy committed blocks from log to their home location
static void
install_trans(void)
{
801029de:	55                   	push   %ebp
801029df:	89 e5                	mov    %esp,%ebp
801029e1:	57                   	push   %edi
801029e2:	56                   	push   %esi
801029e3:	53                   	push   %ebx
801029e4:	31 db                	xor    %ebx,%ebx
801029e6:	83 ec 0c             	sub    $0xc,%esp
801029e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
    struct buf *lbuf = bread(log.dev, log.start+tail+1); // read log block
801029f0:	a1 d4 36 11 80       	mov    0x801136d4,%eax
801029f5:	83 ec 08             	sub    $0x8,%esp
801029f8:	01 d8                	add    %ebx,%eax
801029fa:	83 c0 01             	add    $0x1,%eax
801029fd:	50                   	push   %eax
801029fe:	ff 35 e4 36 11 80    	pushl  0x801136e4
80102a04:	e8 c7 d6 ff ff       	call   801000d0 <bread>
80102a09:	89 c7                	mov    %eax,%edi
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
80102a0b:	58                   	pop    %eax
80102a0c:	5a                   	pop    %edx
80102a0d:	ff 34 9d ec 36 11 80 	pushl  -0x7feec914(,%ebx,4)
80102a14:	ff 35 e4 36 11 80    	pushl  0x801136e4
static void
install_trans(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
80102a1a:	83 c3 01             	add    $0x1,%ebx
    struct buf *lbuf = bread(log.dev, log.start+tail+1); // read log block
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
80102a1d:	e8 ae d6 ff ff       	call   801000d0 <bread>
80102a22:	89 c6                	mov    %eax,%esi
    memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
80102a24:	8d 47 5c             	lea    0x5c(%edi),%eax
80102a27:	83 c4 0c             	add    $0xc,%esp
80102a2a:	68 00 02 00 00       	push   $0x200
80102a2f:	50                   	push   %eax
80102a30:	8d 46 5c             	lea    0x5c(%esi),%eax
80102a33:	50                   	push   %eax
80102a34:	e8 d7 20 00 00       	call   80104b10 <memmove>
    bwrite(dbuf);  // write dst to disk
80102a39:	89 34 24             	mov    %esi,(%esp)
80102a3c:	e8 5f d7 ff ff       	call   801001a0 <bwrite>
    brelse(lbuf);
80102a41:	89 3c 24             	mov    %edi,(%esp)
80102a44:	e8 97 d7 ff ff       	call   801001e0 <brelse>
    brelse(dbuf);
80102a49:	89 34 24             	mov    %esi,(%esp)
80102a4c:	e8 8f d7 ff ff       	call   801001e0 <brelse>
static void
install_trans(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
80102a51:	83 c4 10             	add    $0x10,%esp
80102a54:	39 1d e8 36 11 80    	cmp    %ebx,0x801136e8
80102a5a:	7f 94                	jg     801029f0 <install_trans+0x20>
    memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
    bwrite(dbuf);  // write dst to disk
    brelse(lbuf);
    brelse(dbuf);
  }
}
80102a5c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102a5f:	5b                   	pop    %ebx
80102a60:	5e                   	pop    %esi
80102a61:	5f                   	pop    %edi
80102a62:	5d                   	pop    %ebp
80102a63:	f3 c3                	repz ret 
80102a65:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102a69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102a70 <write_head>:
// Write in-memory log header to disk.
// This is the true point at which the
// current transaction commits.
static void
write_head(void)
{
80102a70:	55                   	push   %ebp
80102a71:	89 e5                	mov    %esp,%ebp
80102a73:	53                   	push   %ebx
80102a74:	83 ec 0c             	sub    $0xc,%esp
  struct buf *buf = bread(log.dev, log.start);
80102a77:	ff 35 d4 36 11 80    	pushl  0x801136d4
80102a7d:	ff 35 e4 36 11 80    	pushl  0x801136e4
80102a83:	e8 48 d6 ff ff       	call   801000d0 <bread>
  struct logheader *hb = (struct logheader *) (buf->data);
  int i;
  hb->n = log.lh.n;
80102a88:	8b 0d e8 36 11 80    	mov    0x801136e8,%ecx
  for (i = 0; i < log.lh.n; i++) {
80102a8e:	83 c4 10             	add    $0x10,%esp
// This is the true point at which the
// current transaction commits.
static void
write_head(void)
{
  struct buf *buf = bread(log.dev, log.start);
80102a91:	89 c3                	mov    %eax,%ebx
  struct logheader *hb = (struct logheader *) (buf->data);
  int i;
  hb->n = log.lh.n;
  for (i = 0; i < log.lh.n; i++) {
80102a93:	85 c9                	test   %ecx,%ecx
write_head(void)
{
  struct buf *buf = bread(log.dev, log.start);
  struct logheader *hb = (struct logheader *) (buf->data);
  int i;
  hb->n = log.lh.n;
80102a95:	89 48 5c             	mov    %ecx,0x5c(%eax)
  for (i = 0; i < log.lh.n; i++) {
80102a98:	7e 1f                	jle    80102ab9 <write_head+0x49>
80102a9a:	8d 04 8d 00 00 00 00 	lea    0x0(,%ecx,4),%eax
80102aa1:	31 d2                	xor    %edx,%edx
80102aa3:	90                   	nop
80102aa4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    hb->block[i] = log.lh.block[i];
80102aa8:	8b 8a ec 36 11 80    	mov    -0x7feec914(%edx),%ecx
80102aae:	89 4c 13 60          	mov    %ecx,0x60(%ebx,%edx,1)
80102ab2:	83 c2 04             	add    $0x4,%edx
{
  struct buf *buf = bread(log.dev, log.start);
  struct logheader *hb = (struct logheader *) (buf->data);
  int i;
  hb->n = log.lh.n;
  for (i = 0; i < log.lh.n; i++) {
80102ab5:	39 c2                	cmp    %eax,%edx
80102ab7:	75 ef                	jne    80102aa8 <write_head+0x38>
    hb->block[i] = log.lh.block[i];
  }
  bwrite(buf);
80102ab9:	83 ec 0c             	sub    $0xc,%esp
80102abc:	53                   	push   %ebx
80102abd:	e8 de d6 ff ff       	call   801001a0 <bwrite>
  brelse(buf);
80102ac2:	89 1c 24             	mov    %ebx,(%esp)
80102ac5:	e8 16 d7 ff ff       	call   801001e0 <brelse>
}
80102aca:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102acd:	c9                   	leave  
80102ace:	c3                   	ret    
80102acf:	90                   	nop

80102ad0 <initlog>:
static void recover_from_log(void);
static void commit();

void
initlog(int dev)
{
80102ad0:	55                   	push   %ebp
80102ad1:	89 e5                	mov    %esp,%ebp
80102ad3:	53                   	push   %ebx
80102ad4:	83 ec 2c             	sub    $0x2c,%esp
80102ad7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if (sizeof(struct logheader) >= BSIZE)
    panic("initlog: too big logheader");

  struct superblock sb;
  initlock(&log.lock, "log");
80102ada:	68 c0 7a 10 80       	push   $0x80107ac0
80102adf:	68 a0 36 11 80       	push   $0x801136a0
80102ae4:	e8 07 1d 00 00       	call   801047f0 <initlock>
  readsb(dev, &sb);
80102ae9:	58                   	pop    %eax
80102aea:	8d 45 dc             	lea    -0x24(%ebp),%eax
80102aed:	5a                   	pop    %edx
80102aee:	50                   	push   %eax
80102aef:	53                   	push   %ebx
80102af0:	e8 bb e8 ff ff       	call   801013b0 <readsb>
  log.start = sb.logstart;
  log.size = sb.nlog;
80102af5:	8b 55 e8             	mov    -0x18(%ebp),%edx
    panic("initlog: too big logheader");

  struct superblock sb;
  initlock(&log.lock, "log");
  readsb(dev, &sb);
  log.start = sb.logstart;
80102af8:	8b 45 ec             	mov    -0x14(%ebp),%eax

// Read the log header from disk into the in-memory log header
static void
read_head(void)
{
  struct buf *buf = bread(log.dev, log.start);
80102afb:	59                   	pop    %ecx
  struct superblock sb;
  initlock(&log.lock, "log");
  readsb(dev, &sb);
  log.start = sb.logstart;
  log.size = sb.nlog;
  log.dev = dev;
80102afc:	89 1d e4 36 11 80    	mov    %ebx,0x801136e4

  struct superblock sb;
  initlock(&log.lock, "log");
  readsb(dev, &sb);
  log.start = sb.logstart;
  log.size = sb.nlog;
80102b02:	89 15 d8 36 11 80    	mov    %edx,0x801136d8
    panic("initlog: too big logheader");

  struct superblock sb;
  initlock(&log.lock, "log");
  readsb(dev, &sb);
  log.start = sb.logstart;
80102b08:	a3 d4 36 11 80       	mov    %eax,0x801136d4

// Read the log header from disk into the in-memory log header
static void
read_head(void)
{
  struct buf *buf = bread(log.dev, log.start);
80102b0d:	5a                   	pop    %edx
80102b0e:	50                   	push   %eax
80102b0f:	53                   	push   %ebx
80102b10:	e8 bb d5 ff ff       	call   801000d0 <bread>
  struct logheader *lh = (struct logheader *) (buf->data);
  int i;
  log.lh.n = lh->n;
80102b15:	8b 48 5c             	mov    0x5c(%eax),%ecx
  for (i = 0; i < log.lh.n; i++) {
80102b18:	83 c4 10             	add    $0x10,%esp
80102b1b:	85 c9                	test   %ecx,%ecx
read_head(void)
{
  struct buf *buf = bread(log.dev, log.start);
  struct logheader *lh = (struct logheader *) (buf->data);
  int i;
  log.lh.n = lh->n;
80102b1d:	89 0d e8 36 11 80    	mov    %ecx,0x801136e8
  for (i = 0; i < log.lh.n; i++) {
80102b23:	7e 1c                	jle    80102b41 <initlog+0x71>
80102b25:	8d 1c 8d 00 00 00 00 	lea    0x0(,%ecx,4),%ebx
80102b2c:	31 d2                	xor    %edx,%edx
80102b2e:	66 90                	xchg   %ax,%ax
    log.lh.block[i] = lh->block[i];
80102b30:	8b 4c 10 60          	mov    0x60(%eax,%edx,1),%ecx
80102b34:	83 c2 04             	add    $0x4,%edx
80102b37:	89 8a e8 36 11 80    	mov    %ecx,-0x7feec918(%edx)
{
  struct buf *buf = bread(log.dev, log.start);
  struct logheader *lh = (struct logheader *) (buf->data);
  int i;
  log.lh.n = lh->n;
  for (i = 0; i < log.lh.n; i++) {
80102b3d:	39 da                	cmp    %ebx,%edx
80102b3f:	75 ef                	jne    80102b30 <initlog+0x60>
    log.lh.block[i] = lh->block[i];
  }
  brelse(buf);
80102b41:	83 ec 0c             	sub    $0xc,%esp
80102b44:	50                   	push   %eax
80102b45:	e8 96 d6 ff ff       	call   801001e0 <brelse>

static void
recover_from_log(void)
{
  read_head();
  install_trans(); // if committed, copy from log to disk
80102b4a:	e8 81 fe ff ff       	call   801029d0 <install_trans>
  log.lh.n = 0;
80102b4f:	c7 05 e8 36 11 80 00 	movl   $0x0,0x801136e8
80102b56:	00 00 00 
  write_head(); // clear the log
80102b59:	e8 12 ff ff ff       	call   80102a70 <write_head>
  readsb(dev, &sb);
  log.start = sb.logstart;
  log.size = sb.nlog;
  log.dev = dev;
  recover_from_log();
}
80102b5e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102b61:	c9                   	leave  
80102b62:	c3                   	ret    
80102b63:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102b69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102b70 <begin_op>:
}

// called at the start of each FS system call.
void
begin_op(void)
{
80102b70:	55                   	push   %ebp
80102b71:	89 e5                	mov    %esp,%ebp
80102b73:	83 ec 14             	sub    $0x14,%esp
  acquire(&log.lock);
80102b76:	68 a0 36 11 80       	push   $0x801136a0
80102b7b:	e8 70 1d 00 00       	call   801048f0 <acquire>
80102b80:	83 c4 10             	add    $0x10,%esp
80102b83:	eb 18                	jmp    80102b9d <begin_op+0x2d>
80102b85:	8d 76 00             	lea    0x0(%esi),%esi
  while(1){
    if(log.committing){
      sleep(&log, &log.lock);
80102b88:	83 ec 08             	sub    $0x8,%esp
80102b8b:	68 a0 36 11 80       	push   $0x801136a0
80102b90:	68 a0 36 11 80       	push   $0x801136a0
80102b95:	e8 26 13 00 00       	call   80103ec0 <sleep>
80102b9a:	83 c4 10             	add    $0x10,%esp
void
begin_op(void)
{
  acquire(&log.lock);
  while(1){
    if(log.committing){
80102b9d:	a1 e0 36 11 80       	mov    0x801136e0,%eax
80102ba2:	85 c0                	test   %eax,%eax
80102ba4:	75 e2                	jne    80102b88 <begin_op+0x18>
      sleep(&log, &log.lock);
    } else if(log.lh.n + (log.outstanding+1)*MAXOPBLOCKS > LOGSIZE){
80102ba6:	a1 dc 36 11 80       	mov    0x801136dc,%eax
80102bab:	8b 15 e8 36 11 80    	mov    0x801136e8,%edx
80102bb1:	83 c0 01             	add    $0x1,%eax
80102bb4:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
80102bb7:	8d 14 4a             	lea    (%edx,%ecx,2),%edx
80102bba:	83 fa 1e             	cmp    $0x1e,%edx
80102bbd:	7f c9                	jg     80102b88 <begin_op+0x18>
      // this op might exhaust log space; wait for commit.
      sleep(&log, &log.lock);
    } else {
      log.outstanding += 1;
      release(&log.lock);
80102bbf:	83 ec 0c             	sub    $0xc,%esp
      sleep(&log, &log.lock);
    } else if(log.lh.n + (log.outstanding+1)*MAXOPBLOCKS > LOGSIZE){
      // this op might exhaust log space; wait for commit.
      sleep(&log, &log.lock);
    } else {
      log.outstanding += 1;
80102bc2:	a3 dc 36 11 80       	mov    %eax,0x801136dc
      release(&log.lock);
80102bc7:	68 a0 36 11 80       	push   $0x801136a0
80102bcc:	e8 3f 1e 00 00       	call   80104a10 <release>
      break;
    }
  }
}
80102bd1:	83 c4 10             	add    $0x10,%esp
80102bd4:	c9                   	leave  
80102bd5:	c3                   	ret    
80102bd6:	8d 76 00             	lea    0x0(%esi),%esi
80102bd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102be0 <end_op>:

// called at the end of each FS system call.
// commits if this was the last outstanding operation.
void
end_op(void)
{
80102be0:	55                   	push   %ebp
80102be1:	89 e5                	mov    %esp,%ebp
80102be3:	57                   	push   %edi
80102be4:	56                   	push   %esi
80102be5:	53                   	push   %ebx
80102be6:	83 ec 18             	sub    $0x18,%esp
  int do_commit = 0;

  acquire(&log.lock);
80102be9:	68 a0 36 11 80       	push   $0x801136a0
80102bee:	e8 fd 1c 00 00       	call   801048f0 <acquire>
  log.outstanding -= 1;
80102bf3:	a1 dc 36 11 80       	mov    0x801136dc,%eax
  if(log.committing)
80102bf8:	8b 35 e0 36 11 80    	mov    0x801136e0,%esi
80102bfe:	83 c4 10             	add    $0x10,%esp
end_op(void)
{
  int do_commit = 0;

  acquire(&log.lock);
  log.outstanding -= 1;
80102c01:	8d 58 ff             	lea    -0x1(%eax),%ebx
  if(log.committing)
80102c04:	85 f6                	test   %esi,%esi
end_op(void)
{
  int do_commit = 0;

  acquire(&log.lock);
  log.outstanding -= 1;
80102c06:	89 1d dc 36 11 80    	mov    %ebx,0x801136dc
  if(log.committing)
80102c0c:	0f 85 22 01 00 00    	jne    80102d34 <end_op+0x154>
    panic("log.committing");
  if(log.outstanding == 0){
80102c12:	85 db                	test   %ebx,%ebx
80102c14:	0f 85 f6 00 00 00    	jne    80102d10 <end_op+0x130>
    // begin_op() may be waiting for log space,
    // and decrementing log.outstanding has decreased
    // the amount of reserved space.
    wakeup(&log);
  }
  release(&log.lock);
80102c1a:	83 ec 0c             	sub    $0xc,%esp
  log.outstanding -= 1;
  if(log.committing)
    panic("log.committing");
  if(log.outstanding == 0){
    do_commit = 1;
    log.committing = 1;
80102c1d:	c7 05 e0 36 11 80 01 	movl   $0x1,0x801136e0
80102c24:	00 00 00 
    // begin_op() may be waiting for log space,
    // and decrementing log.outstanding has decreased
    // the amount of reserved space.
    wakeup(&log);
  }
  release(&log.lock);
80102c27:	68 a0 36 11 80       	push   $0x801136a0
80102c2c:	e8 df 1d 00 00       	call   80104a10 <release>
}

static void
commit()
{
  if (log.lh.n > 0) {
80102c31:	8b 0d e8 36 11 80    	mov    0x801136e8,%ecx
80102c37:	83 c4 10             	add    $0x10,%esp
80102c3a:	85 c9                	test   %ecx,%ecx
80102c3c:	0f 8e 8b 00 00 00    	jle    80102ccd <end_op+0xed>
80102c42:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
write_log(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
    struct buf *to = bread(log.dev, log.start+tail+1); // log block
80102c48:	a1 d4 36 11 80       	mov    0x801136d4,%eax
80102c4d:	83 ec 08             	sub    $0x8,%esp
80102c50:	01 d8                	add    %ebx,%eax
80102c52:	83 c0 01             	add    $0x1,%eax
80102c55:	50                   	push   %eax
80102c56:	ff 35 e4 36 11 80    	pushl  0x801136e4
80102c5c:	e8 6f d4 ff ff       	call   801000d0 <bread>
80102c61:	89 c6                	mov    %eax,%esi
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
80102c63:	58                   	pop    %eax
80102c64:	5a                   	pop    %edx
80102c65:	ff 34 9d ec 36 11 80 	pushl  -0x7feec914(,%ebx,4)
80102c6c:	ff 35 e4 36 11 80    	pushl  0x801136e4
static void
write_log(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
80102c72:	83 c3 01             	add    $0x1,%ebx
    struct buf *to = bread(log.dev, log.start+tail+1); // log block
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
80102c75:	e8 56 d4 ff ff       	call   801000d0 <bread>
80102c7a:	89 c7                	mov    %eax,%edi
    memmove(to->data, from->data, BSIZE);
80102c7c:	8d 40 5c             	lea    0x5c(%eax),%eax
80102c7f:	83 c4 0c             	add    $0xc,%esp
80102c82:	68 00 02 00 00       	push   $0x200
80102c87:	50                   	push   %eax
80102c88:	8d 46 5c             	lea    0x5c(%esi),%eax
80102c8b:	50                   	push   %eax
80102c8c:	e8 7f 1e 00 00       	call   80104b10 <memmove>
    bwrite(to);  // write the log
80102c91:	89 34 24             	mov    %esi,(%esp)
80102c94:	e8 07 d5 ff ff       	call   801001a0 <bwrite>
    brelse(from);
80102c99:	89 3c 24             	mov    %edi,(%esp)
80102c9c:	e8 3f d5 ff ff       	call   801001e0 <brelse>
    brelse(to);
80102ca1:	89 34 24             	mov    %esi,(%esp)
80102ca4:	e8 37 d5 ff ff       	call   801001e0 <brelse>
static void
write_log(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
80102ca9:	83 c4 10             	add    $0x10,%esp
80102cac:	3b 1d e8 36 11 80    	cmp    0x801136e8,%ebx
80102cb2:	7c 94                	jl     80102c48 <end_op+0x68>
static void
commit()
{
  if (log.lh.n > 0) {
    write_log();     // Write modified blocks from cache to log
    write_head();    // Write header to disk -- the real commit
80102cb4:	e8 b7 fd ff ff       	call   80102a70 <write_head>
    install_trans(); // Now install writes to home locations
80102cb9:	e8 12 fd ff ff       	call   801029d0 <install_trans>
    log.lh.n = 0;
80102cbe:	c7 05 e8 36 11 80 00 	movl   $0x0,0x801136e8
80102cc5:	00 00 00 
    write_head();    // Erase the transaction from the log
80102cc8:	e8 a3 fd ff ff       	call   80102a70 <write_head>

  if(do_commit){
    // call commit w/o holding locks, since not allowed
    // to sleep with locks.
    commit();
    acquire(&log.lock);
80102ccd:	83 ec 0c             	sub    $0xc,%esp
80102cd0:	68 a0 36 11 80       	push   $0x801136a0
80102cd5:	e8 16 1c 00 00       	call   801048f0 <acquire>
    log.committing = 0;
    wakeup(&log);
80102cda:	c7 04 24 a0 36 11 80 	movl   $0x801136a0,(%esp)
  if(do_commit){
    // call commit w/o holding locks, since not allowed
    // to sleep with locks.
    commit();
    acquire(&log.lock);
    log.committing = 0;
80102ce1:	c7 05 e0 36 11 80 00 	movl   $0x0,0x801136e0
80102ce8:	00 00 00 
    wakeup(&log);
80102ceb:	e8 90 13 00 00       	call   80104080 <wakeup>
    release(&log.lock);
80102cf0:	c7 04 24 a0 36 11 80 	movl   $0x801136a0,(%esp)
80102cf7:	e8 14 1d 00 00       	call   80104a10 <release>
80102cfc:	83 c4 10             	add    $0x10,%esp
  }
}
80102cff:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102d02:	5b                   	pop    %ebx
80102d03:	5e                   	pop    %esi
80102d04:	5f                   	pop    %edi
80102d05:	5d                   	pop    %ebp
80102d06:	c3                   	ret    
80102d07:	89 f6                	mov    %esi,%esi
80102d09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    log.committing = 1;
  } else {
    // begin_op() may be waiting for log space,
    // and decrementing log.outstanding has decreased
    // the amount of reserved space.
    wakeup(&log);
80102d10:	83 ec 0c             	sub    $0xc,%esp
80102d13:	68 a0 36 11 80       	push   $0x801136a0
80102d18:	e8 63 13 00 00       	call   80104080 <wakeup>
  }
  release(&log.lock);
80102d1d:	c7 04 24 a0 36 11 80 	movl   $0x801136a0,(%esp)
80102d24:	e8 e7 1c 00 00       	call   80104a10 <release>
80102d29:	83 c4 10             	add    $0x10,%esp
    acquire(&log.lock);
    log.committing = 0;
    wakeup(&log);
    release(&log.lock);
  }
}
80102d2c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102d2f:	5b                   	pop    %ebx
80102d30:	5e                   	pop    %esi
80102d31:	5f                   	pop    %edi
80102d32:	5d                   	pop    %ebp
80102d33:	c3                   	ret    
  int do_commit = 0;

  acquire(&log.lock);
  log.outstanding -= 1;
  if(log.committing)
    panic("log.committing");
80102d34:	83 ec 0c             	sub    $0xc,%esp
80102d37:	68 c4 7a 10 80       	push   $0x80107ac4
80102d3c:	e8 2f d6 ff ff       	call   80100370 <panic>
80102d41:	eb 0d                	jmp    80102d50 <log_write>
80102d43:	90                   	nop
80102d44:	90                   	nop
80102d45:	90                   	nop
80102d46:	90                   	nop
80102d47:	90                   	nop
80102d48:	90                   	nop
80102d49:	90                   	nop
80102d4a:	90                   	nop
80102d4b:	90                   	nop
80102d4c:	90                   	nop
80102d4d:	90                   	nop
80102d4e:	90                   	nop
80102d4f:	90                   	nop

80102d50 <log_write>:
//   modify bp->data[]
//   log_write(bp)
//   brelse(bp)
void
log_write(struct buf *b)
{
80102d50:	55                   	push   %ebp
80102d51:	89 e5                	mov    %esp,%ebp
80102d53:	53                   	push   %ebx
80102d54:	83 ec 04             	sub    $0x4,%esp
  int i;

  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
80102d57:	8b 15 e8 36 11 80    	mov    0x801136e8,%edx
//   modify bp->data[]
//   log_write(bp)
//   brelse(bp)
void
log_write(struct buf *b)
{
80102d5d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int i;

  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
80102d60:	83 fa 1d             	cmp    $0x1d,%edx
80102d63:	0f 8f 97 00 00 00    	jg     80102e00 <log_write+0xb0>
80102d69:	a1 d8 36 11 80       	mov    0x801136d8,%eax
80102d6e:	83 e8 01             	sub    $0x1,%eax
80102d71:	39 c2                	cmp    %eax,%edx
80102d73:	0f 8d 87 00 00 00    	jge    80102e00 <log_write+0xb0>
    panic("too big a transaction");
  if (log.outstanding < 1)
80102d79:	a1 dc 36 11 80       	mov    0x801136dc,%eax
80102d7e:	85 c0                	test   %eax,%eax
80102d80:	0f 8e 87 00 00 00    	jle    80102e0d <log_write+0xbd>
    panic("log_write outside of trans");

  acquire(&log.lock);
80102d86:	83 ec 0c             	sub    $0xc,%esp
80102d89:	68 a0 36 11 80       	push   $0x801136a0
80102d8e:	e8 5d 1b 00 00       	call   801048f0 <acquire>
  for (i = 0; i < log.lh.n; i++) {
80102d93:	8b 0d e8 36 11 80    	mov    0x801136e8,%ecx
80102d99:	83 c4 10             	add    $0x10,%esp
80102d9c:	83 f9 00             	cmp    $0x0,%ecx
80102d9f:	7e 50                	jle    80102df1 <log_write+0xa1>
    if (log.lh.block[i] == b->blockno)   // log absorbtion
80102da1:	8b 53 08             	mov    0x8(%ebx),%edx
    panic("too big a transaction");
  if (log.outstanding < 1)
    panic("log_write outside of trans");

  acquire(&log.lock);
  for (i = 0; i < log.lh.n; i++) {
80102da4:	31 c0                	xor    %eax,%eax
    if (log.lh.block[i] == b->blockno)   // log absorbtion
80102da6:	3b 15 ec 36 11 80    	cmp    0x801136ec,%edx
80102dac:	75 0b                	jne    80102db9 <log_write+0x69>
80102dae:	eb 38                	jmp    80102de8 <log_write+0x98>
80102db0:	39 14 85 ec 36 11 80 	cmp    %edx,-0x7feec914(,%eax,4)
80102db7:	74 2f                	je     80102de8 <log_write+0x98>
    panic("too big a transaction");
  if (log.outstanding < 1)
    panic("log_write outside of trans");

  acquire(&log.lock);
  for (i = 0; i < log.lh.n; i++) {
80102db9:	83 c0 01             	add    $0x1,%eax
80102dbc:	39 c8                	cmp    %ecx,%eax
80102dbe:	75 f0                	jne    80102db0 <log_write+0x60>
    if (log.lh.block[i] == b->blockno)   // log absorbtion
      break;
  }
  log.lh.block[i] = b->blockno;
80102dc0:	89 14 85 ec 36 11 80 	mov    %edx,-0x7feec914(,%eax,4)
  if (i == log.lh.n)
    log.lh.n++;
80102dc7:	83 c0 01             	add    $0x1,%eax
80102dca:	a3 e8 36 11 80       	mov    %eax,0x801136e8
  b->flags |= B_DIRTY; // prevent eviction
80102dcf:	83 0b 04             	orl    $0x4,(%ebx)
  release(&log.lock);
80102dd2:	c7 45 08 a0 36 11 80 	movl   $0x801136a0,0x8(%ebp)
}
80102dd9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102ddc:	c9                   	leave  
  }
  log.lh.block[i] = b->blockno;
  if (i == log.lh.n)
    log.lh.n++;
  b->flags |= B_DIRTY; // prevent eviction
  release(&log.lock);
80102ddd:	e9 2e 1c 00 00       	jmp    80104a10 <release>
80102de2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  acquire(&log.lock);
  for (i = 0; i < log.lh.n; i++) {
    if (log.lh.block[i] == b->blockno)   // log absorbtion
      break;
  }
  log.lh.block[i] = b->blockno;
80102de8:	89 14 85 ec 36 11 80 	mov    %edx,-0x7feec914(,%eax,4)
80102def:	eb de                	jmp    80102dcf <log_write+0x7f>
80102df1:	8b 43 08             	mov    0x8(%ebx),%eax
80102df4:	a3 ec 36 11 80       	mov    %eax,0x801136ec
  if (i == log.lh.n)
80102df9:	75 d4                	jne    80102dcf <log_write+0x7f>
80102dfb:	31 c0                	xor    %eax,%eax
80102dfd:	eb c8                	jmp    80102dc7 <log_write+0x77>
80102dff:	90                   	nop
log_write(struct buf *b)
{
  int i;

  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
    panic("too big a transaction");
80102e00:	83 ec 0c             	sub    $0xc,%esp
80102e03:	68 d3 7a 10 80       	push   $0x80107ad3
80102e08:	e8 63 d5 ff ff       	call   80100370 <panic>
  if (log.outstanding < 1)
    panic("log_write outside of trans");
80102e0d:	83 ec 0c             	sub    $0xc,%esp
80102e10:	68 e9 7a 10 80       	push   $0x80107ae9
80102e15:	e8 56 d5 ff ff       	call   80100370 <panic>
80102e1a:	66 90                	xchg   %ax,%ax
80102e1c:	66 90                	xchg   %ax,%ax
80102e1e:	66 90                	xchg   %ax,%ax

80102e20 <mpmain>:
}

// Common CPU setup code.
static void
mpmain(void)
{
80102e20:	55                   	push   %ebp
80102e21:	89 e5                	mov    %esp,%ebp
80102e23:	53                   	push   %ebx
80102e24:	83 ec 04             	sub    $0x4,%esp
  cprintf("cpu%d: starting %d\n", cpuid(), cpuid());
80102e27:	e8 74 0a 00 00       	call   801038a0 <cpuid>
80102e2c:	89 c3                	mov    %eax,%ebx
80102e2e:	e8 6d 0a 00 00       	call   801038a0 <cpuid>
80102e33:	83 ec 04             	sub    $0x4,%esp
80102e36:	53                   	push   %ebx
80102e37:	50                   	push   %eax
80102e38:	68 04 7b 10 80       	push   $0x80107b04
80102e3d:	e8 1e d8 ff ff       	call   80100660 <cprintf>
  idtinit();       // load idt register
80102e42:	e8 f9 2f 00 00       	call   80105e40 <idtinit>
  xchg(&(mycpu()->started), 1); // tell startothers() we're up
80102e47:	e8 d4 09 00 00       	call   80103820 <mycpu>
80102e4c:	89 c2                	mov    %eax,%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
80102e4e:	b8 01 00 00 00       	mov    $0x1,%eax
80102e53:	f0 87 82 a0 00 00 00 	lock xchg %eax,0xa0(%edx)
  scheduler();     // start running processes
80102e5a:	e8 61 0d 00 00       	call   80103bc0 <scheduler>
80102e5f:	90                   	nop

80102e60 <mpenter>:
}

// Other CPUs jump here from entryother.S.
static void
mpenter(void)
{
80102e60:	55                   	push   %ebp
80102e61:	89 e5                	mov    %esp,%ebp
80102e63:	83 ec 08             	sub    $0x8,%esp
  switchkvm();
80102e66:	e8 05 41 00 00       	call   80106f70 <switchkvm>
  seginit();
80102e6b:	e8 00 40 00 00       	call   80106e70 <seginit>
  lapicinit();
80102e70:	e8 8b f7 ff ff       	call   80102600 <lapicinit>
  mpmain();
80102e75:	e8 a6 ff ff ff       	call   80102e20 <mpmain>
80102e7a:	66 90                	xchg   %ax,%ax
80102e7c:	66 90                	xchg   %ax,%ax
80102e7e:	66 90                	xchg   %ax,%ax

80102e80 <main>:
// Bootstrap processor starts running C code here.
// Allocate a real stack and switch to it, first
// doing some setup required for memory allocator to work.
int
main(void)
{
80102e80:	8d 4c 24 04          	lea    0x4(%esp),%ecx
80102e84:	83 e4 f0             	and    $0xfffffff0,%esp
80102e87:	ff 71 fc             	pushl  -0x4(%ecx)
80102e8a:	55                   	push   %ebp
80102e8b:	89 e5                	mov    %esp,%ebp
80102e8d:	53                   	push   %ebx
80102e8e:	51                   	push   %ecx
  // The linker has placed the image of entryother.S in
  // _binary_entryother_start.
  code = P2V(0x7000);
  memmove(code, _binary_entryother_start, (uint)_binary_entryother_size);

  for(c = cpus; c < cpus+ncpu; c++){
80102e8f:	bb a0 37 11 80       	mov    $0x801137a0,%ebx
// Allocate a real stack and switch to it, first
// doing some setup required for memory allocator to work.
int
main(void)
{
  kinit1(end, P2V(4*1024*1024)); // phys page allocator
80102e94:	83 ec 08             	sub    $0x8,%esp
80102e97:	68 00 00 40 80       	push   $0x80400000
80102e9c:	68 c8 8b 11 80       	push   $0x80118bc8
80102ea1:	e8 1a f5 ff ff       	call   801023c0 <kinit1>
  kvmalloc();      // kernel page table
80102ea6:	e8 55 45 00 00       	call   80107400 <kvmalloc>
  mpinit();        // detect other processors
80102eab:	e8 60 01 00 00       	call   80103010 <mpinit>
  lapicinit();     // interrupt controller
80102eb0:	e8 4b f7 ff ff       	call   80102600 <lapicinit>
  seginit();       // segment descriptors
80102eb5:	e8 b6 3f 00 00       	call   80106e70 <seginit>
  picinit();       // disable pic
80102eba:	e8 21 03 00 00       	call   801031e0 <picinit>
  ioapicinit();    // another interrupt controller
80102ebf:	e8 2c f3 ff ff       	call   801021f0 <ioapicinit>
  consoleinit();   // console hardware
80102ec4:	e8 c7 da ff ff       	call   80100990 <consoleinit>
  uartinit();      // serial port
80102ec9:	e8 72 32 00 00       	call   80106140 <uartinit>
  pinit();         // process table
80102ece:	e8 2d 09 00 00       	call   80103800 <pinit>
  tvinit();        // trap vectors
80102ed3:	e8 c8 2e 00 00       	call   80105da0 <tvinit>
  binit();         // buffer cache
80102ed8:	e8 63 d1 ff ff       	call   80100040 <binit>
  fileinit();      // file table
80102edd:	e8 5e de ff ff       	call   80100d40 <fileinit>
  ideinit();       // disk 
80102ee2:	e8 e9 f0 ff ff       	call   80101fd0 <ideinit>

  // Write entry code to unused memory at 0x7000.
  // The linker has placed the image of entryother.S in
  // _binary_entryother_start.
  code = P2V(0x7000);
  memmove(code, _binary_entryother_start, (uint)_binary_entryother_size);
80102ee7:	83 c4 0c             	add    $0xc,%esp
80102eea:	68 8a 00 00 00       	push   $0x8a
80102eef:	68 8c b4 10 80       	push   $0x8010b48c
80102ef4:	68 00 70 00 80       	push   $0x80007000
80102ef9:	e8 12 1c 00 00       	call   80104b10 <memmove>

  for(c = cpus; c < cpus+ncpu; c++){
80102efe:	69 05 20 3d 11 80 b0 	imul   $0xb0,0x80113d20,%eax
80102f05:	00 00 00 
80102f08:	83 c4 10             	add    $0x10,%esp
80102f0b:	05 a0 37 11 80       	add    $0x801137a0,%eax
80102f10:	39 d8                	cmp    %ebx,%eax
80102f12:	76 6f                	jbe    80102f83 <main+0x103>
80102f14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(c == mycpu())  // We've started already.
80102f18:	e8 03 09 00 00       	call   80103820 <mycpu>
80102f1d:	39 d8                	cmp    %ebx,%eax
80102f1f:	74 49                	je     80102f6a <main+0xea>
      continue;

    // Tell entryother.S what stack to use, where to enter, and what
    // pgdir to use. We cannot use kpgdir yet, because the AP processor
    // is running in low  memory, so we use entrypgdir for the APs too.
    stack = kalloc();
80102f21:	e8 6a f5 ff ff       	call   80102490 <kalloc>
    *(void**)(code-4) = stack + KSTACKSIZE;
80102f26:	05 00 10 00 00       	add    $0x1000,%eax
    *(void**)(code-8) = mpenter;
80102f2b:	c7 05 f8 6f 00 80 60 	movl   $0x80102e60,0x80006ff8
80102f32:	2e 10 80 
    *(int**)(code-12) = (void *) V2P(entrypgdir);
80102f35:	c7 05 f4 6f 00 80 00 	movl   $0x10a000,0x80006ff4
80102f3c:	a0 10 00 

    // Tell entryother.S what stack to use, where to enter, and what
    // pgdir to use. We cannot use kpgdir yet, because the AP processor
    // is running in low  memory, so we use entrypgdir for the APs too.
    stack = kalloc();
    *(void**)(code-4) = stack + KSTACKSIZE;
80102f3f:	a3 fc 6f 00 80       	mov    %eax,0x80006ffc
    *(void**)(code-8) = mpenter;
    *(int**)(code-12) = (void *) V2P(entrypgdir);

    lapicstartap(c->apicid, V2P(code));
80102f44:	0f b6 03             	movzbl (%ebx),%eax
80102f47:	83 ec 08             	sub    $0x8,%esp
80102f4a:	68 00 70 00 00       	push   $0x7000
80102f4f:	50                   	push   %eax
80102f50:	e8 fb f7 ff ff       	call   80102750 <lapicstartap>
80102f55:	83 c4 10             	add    $0x10,%esp
80102f58:	90                   	nop
80102f59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

    // wait for cpu to finish mpmain()
    while(c->started == 0)
80102f60:	8b 83 a0 00 00 00    	mov    0xa0(%ebx),%eax
80102f66:	85 c0                	test   %eax,%eax
80102f68:	74 f6                	je     80102f60 <main+0xe0>
  // The linker has placed the image of entryother.S in
  // _binary_entryother_start.
  code = P2V(0x7000);
  memmove(code, _binary_entryother_start, (uint)_binary_entryother_size);

  for(c = cpus; c < cpus+ncpu; c++){
80102f6a:	69 05 20 3d 11 80 b0 	imul   $0xb0,0x80113d20,%eax
80102f71:	00 00 00 
80102f74:	81 c3 b0 00 00 00    	add    $0xb0,%ebx
80102f7a:	05 a0 37 11 80       	add    $0x801137a0,%eax
80102f7f:	39 c3                	cmp    %eax,%ebx
80102f81:	72 95                	jb     80102f18 <main+0x98>
  tvinit();        // trap vectors
  binit();         // buffer cache
  fileinit();      // file table
  ideinit();       // disk 
  startothers();   // start other processors
  kinit2(P2V(4*1024*1024), P2V(PHYSTOP)); // must come after startothers()
80102f83:	83 ec 08             	sub    $0x8,%esp
80102f86:	68 00 00 00 8e       	push   $0x8e000000
80102f8b:	68 00 00 40 80       	push   $0x80400000
80102f90:	e8 9b f4 ff ff       	call   80102430 <kinit2>
  userinit();      // first user process
80102f95:	e8 56 09 00 00       	call   801038f0 <userinit>
  mpmain();        // finish this processor's setup
80102f9a:	e8 81 fe ff ff       	call   80102e20 <mpmain>
80102f9f:	90                   	nop

80102fa0 <mpsearch1>:
}

// Look for an MP structure in the len bytes at addr.
static struct mp*
mpsearch1(uint a, int len)
{
80102fa0:	55                   	push   %ebp
80102fa1:	89 e5                	mov    %esp,%ebp
80102fa3:	57                   	push   %edi
80102fa4:	56                   	push   %esi
  uchar *e, *p, *addr;

  addr = P2V(a);
80102fa5:	8d b0 00 00 00 80    	lea    -0x80000000(%eax),%esi
}

// Look for an MP structure in the len bytes at addr.
static struct mp*
mpsearch1(uint a, int len)
{
80102fab:	53                   	push   %ebx
  uchar *e, *p, *addr;

  addr = P2V(a);
  e = addr+len;
80102fac:	8d 1c 16             	lea    (%esi,%edx,1),%ebx
}

// Look for an MP structure in the len bytes at addr.
static struct mp*
mpsearch1(uint a, int len)
{
80102faf:	83 ec 0c             	sub    $0xc,%esp
  uchar *e, *p, *addr;

  addr = P2V(a);
  e = addr+len;
  for(p = addr; p < e; p += sizeof(struct mp))
80102fb2:	39 de                	cmp    %ebx,%esi
80102fb4:	73 40                	jae    80102ff6 <mpsearch1+0x56>
80102fb6:	8d 76 00             	lea    0x0(%esi),%esi
80102fb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
80102fc0:	83 ec 04             	sub    $0x4,%esp
80102fc3:	8d 7e 10             	lea    0x10(%esi),%edi
80102fc6:	6a 04                	push   $0x4
80102fc8:	68 18 7b 10 80       	push   $0x80107b18
80102fcd:	56                   	push   %esi
80102fce:	e8 dd 1a 00 00       	call   80104ab0 <memcmp>
80102fd3:	83 c4 10             	add    $0x10,%esp
80102fd6:	85 c0                	test   %eax,%eax
80102fd8:	75 16                	jne    80102ff0 <mpsearch1+0x50>
80102fda:	8d 7e 10             	lea    0x10(%esi),%edi
80102fdd:	89 f2                	mov    %esi,%edx
80102fdf:	90                   	nop
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
    sum += addr[i];
80102fe0:	0f b6 0a             	movzbl (%edx),%ecx
80102fe3:	83 c2 01             	add    $0x1,%edx
80102fe6:	01 c8                	add    %ecx,%eax
sum(uchar *addr, int len)
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
80102fe8:	39 fa                	cmp    %edi,%edx
80102fea:	75 f4                	jne    80102fe0 <mpsearch1+0x40>
  uchar *e, *p, *addr;

  addr = P2V(a);
  e = addr+len;
  for(p = addr; p < e; p += sizeof(struct mp))
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
80102fec:	84 c0                	test   %al,%al
80102fee:	74 10                	je     80103000 <mpsearch1+0x60>
{
  uchar *e, *p, *addr;

  addr = P2V(a);
  e = addr+len;
  for(p = addr; p < e; p += sizeof(struct mp))
80102ff0:	39 fb                	cmp    %edi,%ebx
80102ff2:	89 fe                	mov    %edi,%esi
80102ff4:	77 ca                	ja     80102fc0 <mpsearch1+0x20>
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
      return (struct mp*)p;
  return 0;
}
80102ff6:	8d 65 f4             	lea    -0xc(%ebp),%esp
  addr = P2V(a);
  e = addr+len;
  for(p = addr; p < e; p += sizeof(struct mp))
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
      return (struct mp*)p;
  return 0;
80102ff9:	31 c0                	xor    %eax,%eax
}
80102ffb:	5b                   	pop    %ebx
80102ffc:	5e                   	pop    %esi
80102ffd:	5f                   	pop    %edi
80102ffe:	5d                   	pop    %ebp
80102fff:	c3                   	ret    
80103000:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103003:	89 f0                	mov    %esi,%eax
80103005:	5b                   	pop    %ebx
80103006:	5e                   	pop    %esi
80103007:	5f                   	pop    %edi
80103008:	5d                   	pop    %ebp
80103009:	c3                   	ret    
8010300a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80103010 <mpinit>:
  return conf;
}

void
mpinit(void)
{
80103010:	55                   	push   %ebp
80103011:	89 e5                	mov    %esp,%ebp
80103013:	57                   	push   %edi
80103014:	56                   	push   %esi
80103015:	53                   	push   %ebx
80103016:	83 ec 1c             	sub    $0x1c,%esp
  uchar *bda;
  uint p;
  struct mp *mp;

  bda = (uchar *) P2V(0x400);
  if((p = ((bda[0x0F]<<8)| bda[0x0E]) << 4)){
80103019:	0f b6 05 0f 04 00 80 	movzbl 0x8000040f,%eax
80103020:	0f b6 15 0e 04 00 80 	movzbl 0x8000040e,%edx
80103027:	c1 e0 08             	shl    $0x8,%eax
8010302a:	09 d0                	or     %edx,%eax
8010302c:	c1 e0 04             	shl    $0x4,%eax
8010302f:	85 c0                	test   %eax,%eax
80103031:	75 1b                	jne    8010304e <mpinit+0x3e>
    if((mp = mpsearch1(p, 1024)))
      return mp;
  } else {
    p = ((bda[0x14]<<8)|bda[0x13])*1024;
80103033:	0f b6 05 14 04 00 80 	movzbl 0x80000414,%eax
8010303a:	0f b6 15 13 04 00 80 	movzbl 0x80000413,%edx
80103041:	c1 e0 08             	shl    $0x8,%eax
80103044:	09 d0                	or     %edx,%eax
80103046:	c1 e0 0a             	shl    $0xa,%eax
    if((mp = mpsearch1(p-1024, 1024)))
80103049:	2d 00 04 00 00       	sub    $0x400,%eax
  uint p;
  struct mp *mp;

  bda = (uchar *) P2V(0x400);
  if((p = ((bda[0x0F]<<8)| bda[0x0E]) << 4)){
    if((mp = mpsearch1(p, 1024)))
8010304e:	ba 00 04 00 00       	mov    $0x400,%edx
80103053:	e8 48 ff ff ff       	call   80102fa0 <mpsearch1>
80103058:	85 c0                	test   %eax,%eax
8010305a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010305d:	0f 84 37 01 00 00    	je     8010319a <mpinit+0x18a>
mpconfig(struct mp **pmp)
{
  struct mpconf *conf;
  struct mp *mp;

  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
80103063:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80103066:	8b 58 04             	mov    0x4(%eax),%ebx
80103069:	85 db                	test   %ebx,%ebx
8010306b:	0f 84 43 01 00 00    	je     801031b4 <mpinit+0x1a4>
    return 0;
  conf = (struct mpconf*) P2V((uint) mp->physaddr);
80103071:	8d b3 00 00 00 80    	lea    -0x80000000(%ebx),%esi
  if(memcmp(conf, "PCMP", 4) != 0)
80103077:	83 ec 04             	sub    $0x4,%esp
8010307a:	6a 04                	push   $0x4
8010307c:	68 35 7b 10 80       	push   $0x80107b35
80103081:	56                   	push   %esi
80103082:	e8 29 1a 00 00       	call   80104ab0 <memcmp>
80103087:	83 c4 10             	add    $0x10,%esp
8010308a:	85 c0                	test   %eax,%eax
8010308c:	0f 85 22 01 00 00    	jne    801031b4 <mpinit+0x1a4>
    return 0;
  if(conf->version != 1 && conf->version != 4)
80103092:	0f b6 83 06 00 00 80 	movzbl -0x7ffffffa(%ebx),%eax
80103099:	3c 01                	cmp    $0x1,%al
8010309b:	74 08                	je     801030a5 <mpinit+0x95>
8010309d:	3c 04                	cmp    $0x4,%al
8010309f:	0f 85 0f 01 00 00    	jne    801031b4 <mpinit+0x1a4>
    return 0;
  if(sum((uchar*)conf, conf->length) != 0)
801030a5:	0f b7 bb 04 00 00 80 	movzwl -0x7ffffffc(%ebx),%edi
sum(uchar *addr, int len)
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
801030ac:	85 ff                	test   %edi,%edi
801030ae:	74 21                	je     801030d1 <mpinit+0xc1>
801030b0:	31 d2                	xor    %edx,%edx
801030b2:	31 c0                	xor    %eax,%eax
801030b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    sum += addr[i];
801030b8:	0f b6 8c 03 00 00 00 	movzbl -0x80000000(%ebx,%eax,1),%ecx
801030bf:	80 
sum(uchar *addr, int len)
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
801030c0:	83 c0 01             	add    $0x1,%eax
    sum += addr[i];
801030c3:	01 ca                	add    %ecx,%edx
sum(uchar *addr, int len)
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
801030c5:	39 c7                	cmp    %eax,%edi
801030c7:	75 ef                	jne    801030b8 <mpinit+0xa8>
  conf = (struct mpconf*) P2V((uint) mp->physaddr);
  if(memcmp(conf, "PCMP", 4) != 0)
    return 0;
  if(conf->version != 1 && conf->version != 4)
    return 0;
  if(sum((uchar*)conf, conf->length) != 0)
801030c9:	84 d2                	test   %dl,%dl
801030cb:	0f 85 e3 00 00 00    	jne    801031b4 <mpinit+0x1a4>
  struct mp *mp;
  struct mpconf *conf;
  struct mpproc *proc;
  struct mpioapic *ioapic;

  if((conf = mpconfig(&mp)) == 0)
801030d1:	85 f6                	test   %esi,%esi
801030d3:	0f 84 db 00 00 00    	je     801031b4 <mpinit+0x1a4>
    panic("Expect to run on an SMP");
  ismp = 1;
  lapic = (uint*)conf->lapicaddr;
801030d9:	8b 83 24 00 00 80    	mov    -0x7fffffdc(%ebx),%eax
801030df:	a3 9c 36 11 80       	mov    %eax,0x8011369c
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
801030e4:	0f b7 93 04 00 00 80 	movzwl -0x7ffffffc(%ebx),%edx
801030eb:	8d 83 2c 00 00 80    	lea    -0x7fffffd4(%ebx),%eax
  struct mpproc *proc;
  struct mpioapic *ioapic;

  if((conf = mpconfig(&mp)) == 0)
    panic("Expect to run on an SMP");
  ismp = 1;
801030f1:	bb 01 00 00 00       	mov    $0x1,%ebx
  lapic = (uint*)conf->lapicaddr;
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
801030f6:	01 d6                	add    %edx,%esi
801030f8:	90                   	nop
801030f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103100:	39 c6                	cmp    %eax,%esi
80103102:	76 23                	jbe    80103127 <mpinit+0x117>
80103104:	0f b6 10             	movzbl (%eax),%edx
    switch(*p){
80103107:	80 fa 04             	cmp    $0x4,%dl
8010310a:	0f 87 c0 00 00 00    	ja     801031d0 <mpinit+0x1c0>
80103110:	ff 24 95 5c 7b 10 80 	jmp    *-0x7fef84a4(,%edx,4)
80103117:	89 f6                	mov    %esi,%esi
80103119:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      p += sizeof(struct mpioapic);
      continue;
    case MPBUS:
    case MPIOINTR:
    case MPLINTR:
      p += 8;
80103120:	83 c0 08             	add    $0x8,%eax

  if((conf = mpconfig(&mp)) == 0)
    panic("Expect to run on an SMP");
  ismp = 1;
  lapic = (uint*)conf->lapicaddr;
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
80103123:	39 c6                	cmp    %eax,%esi
80103125:	77 dd                	ja     80103104 <mpinit+0xf4>
    default:
      ismp = 0;
      break;
    }
  }
  if(!ismp)
80103127:	85 db                	test   %ebx,%ebx
80103129:	0f 84 92 00 00 00    	je     801031c1 <mpinit+0x1b1>
    panic("Didn't find a suitable machine");

  if(mp->imcrp){
8010312f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80103132:	80 78 0c 00          	cmpb   $0x0,0xc(%eax)
80103136:	74 15                	je     8010314d <mpinit+0x13d>
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80103138:	ba 22 00 00 00       	mov    $0x22,%edx
8010313d:	b8 70 00 00 00       	mov    $0x70,%eax
80103142:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80103143:	ba 23 00 00 00       	mov    $0x23,%edx
80103148:	ec                   	in     (%dx),%al
    // Bochs doesn't support IMCR, so this doesn't run on Bochs.
    // But it would on real hardware.
    outb(0x22, 0x70);   // Select IMCR
    outb(0x23, inb(0x23) | 1);  // Mask external interrupts.
80103149:	83 c8 01             	or     $0x1,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010314c:	ee                   	out    %al,(%dx)
  }
}
8010314d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103150:	5b                   	pop    %ebx
80103151:	5e                   	pop    %esi
80103152:	5f                   	pop    %edi
80103153:	5d                   	pop    %ebp
80103154:	c3                   	ret    
80103155:	8d 76 00             	lea    0x0(%esi),%esi
  lapic = (uint*)conf->lapicaddr;
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
    switch(*p){
    case MPPROC:
      proc = (struct mpproc*)p;
      if(ncpu < NCPU) {
80103158:	8b 0d 20 3d 11 80    	mov    0x80113d20,%ecx
8010315e:	83 f9 07             	cmp    $0x7,%ecx
80103161:	7f 19                	jg     8010317c <mpinit+0x16c>
        cpus[ncpu].apicid = proc->apicid;  // apicid may differ from ncpu
80103163:	0f b6 50 01          	movzbl 0x1(%eax),%edx
80103167:	69 f9 b0 00 00 00    	imul   $0xb0,%ecx,%edi
        ncpu++;
8010316d:	83 c1 01             	add    $0x1,%ecx
80103170:	89 0d 20 3d 11 80    	mov    %ecx,0x80113d20
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
    switch(*p){
    case MPPROC:
      proc = (struct mpproc*)p;
      if(ncpu < NCPU) {
        cpus[ncpu].apicid = proc->apicid;  // apicid may differ from ncpu
80103176:	88 97 a0 37 11 80    	mov    %dl,-0x7feec860(%edi)
        ncpu++;
      }
      p += sizeof(struct mpproc);
8010317c:	83 c0 14             	add    $0x14,%eax
      continue;
8010317f:	e9 7c ff ff ff       	jmp    80103100 <mpinit+0xf0>
80103184:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    case MPIOAPIC:
      ioapic = (struct mpioapic*)p;
      ioapicid = ioapic->apicno;
80103188:	0f b6 50 01          	movzbl 0x1(%eax),%edx
      p += sizeof(struct mpioapic);
8010318c:	83 c0 08             	add    $0x8,%eax
      }
      p += sizeof(struct mpproc);
      continue;
    case MPIOAPIC:
      ioapic = (struct mpioapic*)p;
      ioapicid = ioapic->apicno;
8010318f:	88 15 80 37 11 80    	mov    %dl,0x80113780
      p += sizeof(struct mpioapic);
      continue;
80103195:	e9 66 ff ff ff       	jmp    80103100 <mpinit+0xf0>
  } else {
    p = ((bda[0x14]<<8)|bda[0x13])*1024;
    if((mp = mpsearch1(p-1024, 1024)))
      return mp;
  }
  return mpsearch1(0xF0000, 0x10000);
8010319a:	ba 00 00 01 00       	mov    $0x10000,%edx
8010319f:	b8 00 00 0f 00       	mov    $0xf0000,%eax
801031a4:	e8 f7 fd ff ff       	call   80102fa0 <mpsearch1>
mpconfig(struct mp **pmp)
{
  struct mpconf *conf;
  struct mp *mp;

  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
801031a9:	85 c0                	test   %eax,%eax
  } else {
    p = ((bda[0x14]<<8)|bda[0x13])*1024;
    if((mp = mpsearch1(p-1024, 1024)))
      return mp;
  }
  return mpsearch1(0xF0000, 0x10000);
801031ab:	89 45 e4             	mov    %eax,-0x1c(%ebp)
mpconfig(struct mp **pmp)
{
  struct mpconf *conf;
  struct mp *mp;

  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
801031ae:	0f 85 af fe ff ff    	jne    80103063 <mpinit+0x53>
  struct mpconf *conf;
  struct mpproc *proc;
  struct mpioapic *ioapic;

  if((conf = mpconfig(&mp)) == 0)
    panic("Expect to run on an SMP");
801031b4:	83 ec 0c             	sub    $0xc,%esp
801031b7:	68 1d 7b 10 80       	push   $0x80107b1d
801031bc:	e8 af d1 ff ff       	call   80100370 <panic>
      ismp = 0;
      break;
    }
  }
  if(!ismp)
    panic("Didn't find a suitable machine");
801031c1:	83 ec 0c             	sub    $0xc,%esp
801031c4:	68 3c 7b 10 80       	push   $0x80107b3c
801031c9:	e8 a2 d1 ff ff       	call   80100370 <panic>
801031ce:	66 90                	xchg   %ax,%ax
    case MPIOINTR:
    case MPLINTR:
      p += 8;
      continue;
    default:
      ismp = 0;
801031d0:	31 db                	xor    %ebx,%ebx
801031d2:	e9 30 ff ff ff       	jmp    80103107 <mpinit+0xf7>
801031d7:	66 90                	xchg   %ax,%ax
801031d9:	66 90                	xchg   %ax,%ax
801031db:	66 90                	xchg   %ax,%ax
801031dd:	66 90                	xchg   %ax,%ax
801031df:	90                   	nop

801031e0 <picinit>:
#define IO_PIC2         0xA0    // Slave (IRQs 8-15)

// Don't use the 8259A interrupt controllers.  Xv6 assumes SMP hardware.
void
picinit(void)
{
801031e0:	55                   	push   %ebp
801031e1:	ba 21 00 00 00       	mov    $0x21,%edx
801031e6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801031eb:	89 e5                	mov    %esp,%ebp
801031ed:	ee                   	out    %al,(%dx)
801031ee:	ba a1 00 00 00       	mov    $0xa1,%edx
801031f3:	ee                   	out    %al,(%dx)
  // mask all interrupts
  outb(IO_PIC1+1, 0xFF);
  outb(IO_PIC2+1, 0xFF);
}
801031f4:	5d                   	pop    %ebp
801031f5:	c3                   	ret    
801031f6:	66 90                	xchg   %ax,%ax
801031f8:	66 90                	xchg   %ax,%ax
801031fa:	66 90                	xchg   %ax,%ax
801031fc:	66 90                	xchg   %ax,%ax
801031fe:	66 90                	xchg   %ax,%ax

80103200 <pipealloc>:
  int writeopen;  // write fd is still open
};

int
pipealloc(struct file **f0, struct file **f1)
{
80103200:	55                   	push   %ebp
80103201:	89 e5                	mov    %esp,%ebp
80103203:	57                   	push   %edi
80103204:	56                   	push   %esi
80103205:	53                   	push   %ebx
80103206:	83 ec 0c             	sub    $0xc,%esp
80103209:	8b 75 08             	mov    0x8(%ebp),%esi
8010320c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  struct pipe *p;

  p = 0;
  *f0 = *f1 = 0;
8010320f:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80103215:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
  if((*f0 = filealloc()) == 0 || (*f1 = filealloc()) == 0)
8010321b:	e8 40 db ff ff       	call   80100d60 <filealloc>
80103220:	85 c0                	test   %eax,%eax
80103222:	89 06                	mov    %eax,(%esi)
80103224:	0f 84 a8 00 00 00    	je     801032d2 <pipealloc+0xd2>
8010322a:	e8 31 db ff ff       	call   80100d60 <filealloc>
8010322f:	85 c0                	test   %eax,%eax
80103231:	89 03                	mov    %eax,(%ebx)
80103233:	0f 84 87 00 00 00    	je     801032c0 <pipealloc+0xc0>
    goto bad;
  if((p = (struct pipe*)kalloc()) == 0)
80103239:	e8 52 f2 ff ff       	call   80102490 <kalloc>
8010323e:	85 c0                	test   %eax,%eax
80103240:	89 c7                	mov    %eax,%edi
80103242:	0f 84 b0 00 00 00    	je     801032f8 <pipealloc+0xf8>
    goto bad;
  p->readopen = 1;
  p->writeopen = 1;
  p->nwrite = 0;
  p->nread = 0;
  initlock(&p->lock, "pipe");
80103248:	83 ec 08             	sub    $0x8,%esp
  *f0 = *f1 = 0;
  if((*f0 = filealloc()) == 0 || (*f1 = filealloc()) == 0)
    goto bad;
  if((p = (struct pipe*)kalloc()) == 0)
    goto bad;
  p->readopen = 1;
8010324b:	c7 80 3c 02 00 00 01 	movl   $0x1,0x23c(%eax)
80103252:	00 00 00 
  p->writeopen = 1;
80103255:	c7 80 40 02 00 00 01 	movl   $0x1,0x240(%eax)
8010325c:	00 00 00 
  p->nwrite = 0;
8010325f:	c7 80 38 02 00 00 00 	movl   $0x0,0x238(%eax)
80103266:	00 00 00 
  p->nread = 0;
80103269:	c7 80 34 02 00 00 00 	movl   $0x0,0x234(%eax)
80103270:	00 00 00 
  initlock(&p->lock, "pipe");
80103273:	68 70 7b 10 80       	push   $0x80107b70
80103278:	50                   	push   %eax
80103279:	e8 72 15 00 00       	call   801047f0 <initlock>
  (*f0)->type = FD_PIPE;
8010327e:	8b 06                	mov    (%esi),%eax
  (*f0)->pipe = p;
  (*f1)->type = FD_PIPE;
  (*f1)->readable = 0;
  (*f1)->writable = 1;
  (*f1)->pipe = p;
  return 0;
80103280:	83 c4 10             	add    $0x10,%esp
  p->readopen = 1;
  p->writeopen = 1;
  p->nwrite = 0;
  p->nread = 0;
  initlock(&p->lock, "pipe");
  (*f0)->type = FD_PIPE;
80103283:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  (*f0)->readable = 1;
80103289:	8b 06                	mov    (%esi),%eax
8010328b:	c6 40 08 01          	movb   $0x1,0x8(%eax)
  (*f0)->writable = 0;
8010328f:	8b 06                	mov    (%esi),%eax
80103291:	c6 40 09 00          	movb   $0x0,0x9(%eax)
  (*f0)->pipe = p;
80103295:	8b 06                	mov    (%esi),%eax
80103297:	89 78 0c             	mov    %edi,0xc(%eax)
  (*f1)->type = FD_PIPE;
8010329a:	8b 03                	mov    (%ebx),%eax
8010329c:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  (*f1)->readable = 0;
801032a2:	8b 03                	mov    (%ebx),%eax
801032a4:	c6 40 08 00          	movb   $0x0,0x8(%eax)
  (*f1)->writable = 1;
801032a8:	8b 03                	mov    (%ebx),%eax
801032aa:	c6 40 09 01          	movb   $0x1,0x9(%eax)
  (*f1)->pipe = p;
801032ae:	8b 03                	mov    (%ebx),%eax
801032b0:	89 78 0c             	mov    %edi,0xc(%eax)
  if(*f0)
    fileclose(*f0);
  if(*f1)
    fileclose(*f1);
  return -1;
}
801032b3:	8d 65 f4             	lea    -0xc(%ebp),%esp
  (*f0)->pipe = p;
  (*f1)->type = FD_PIPE;
  (*f1)->readable = 0;
  (*f1)->writable = 1;
  (*f1)->pipe = p;
  return 0;
801032b6:	31 c0                	xor    %eax,%eax
  if(*f0)
    fileclose(*f0);
  if(*f1)
    fileclose(*f1);
  return -1;
}
801032b8:	5b                   	pop    %ebx
801032b9:	5e                   	pop    %esi
801032ba:	5f                   	pop    %edi
801032bb:	5d                   	pop    %ebp
801032bc:	c3                   	ret    
801032bd:	8d 76 00             	lea    0x0(%esi),%esi

//PAGEBREAK: 20
 bad:
  if(p)
    kfree((char*)p);
  if(*f0)
801032c0:	8b 06                	mov    (%esi),%eax
801032c2:	85 c0                	test   %eax,%eax
801032c4:	74 1e                	je     801032e4 <pipealloc+0xe4>
    fileclose(*f0);
801032c6:	83 ec 0c             	sub    $0xc,%esp
801032c9:	50                   	push   %eax
801032ca:	e8 51 db ff ff       	call   80100e20 <fileclose>
801032cf:	83 c4 10             	add    $0x10,%esp
  if(*f1)
801032d2:	8b 03                	mov    (%ebx),%eax
801032d4:	85 c0                	test   %eax,%eax
801032d6:	74 0c                	je     801032e4 <pipealloc+0xe4>
    fileclose(*f1);
801032d8:	83 ec 0c             	sub    $0xc,%esp
801032db:	50                   	push   %eax
801032dc:	e8 3f db ff ff       	call   80100e20 <fileclose>
801032e1:	83 c4 10             	add    $0x10,%esp
  return -1;
}
801032e4:	8d 65 f4             	lea    -0xc(%ebp),%esp
    kfree((char*)p);
  if(*f0)
    fileclose(*f0);
  if(*f1)
    fileclose(*f1);
  return -1;
801032e7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801032ec:	5b                   	pop    %ebx
801032ed:	5e                   	pop    %esi
801032ee:	5f                   	pop    %edi
801032ef:	5d                   	pop    %ebp
801032f0:	c3                   	ret    
801032f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

//PAGEBREAK: 20
 bad:
  if(p)
    kfree((char*)p);
  if(*f0)
801032f8:	8b 06                	mov    (%esi),%eax
801032fa:	85 c0                	test   %eax,%eax
801032fc:	75 c8                	jne    801032c6 <pipealloc+0xc6>
801032fe:	eb d2                	jmp    801032d2 <pipealloc+0xd2>

80103300 <pipeclose>:
  return -1;
}

void
pipeclose(struct pipe *p, int writable)
{
80103300:	55                   	push   %ebp
80103301:	89 e5                	mov    %esp,%ebp
80103303:	56                   	push   %esi
80103304:	53                   	push   %ebx
80103305:	8b 5d 08             	mov    0x8(%ebp),%ebx
80103308:	8b 75 0c             	mov    0xc(%ebp),%esi
  acquire(&p->lock);
8010330b:	83 ec 0c             	sub    $0xc,%esp
8010330e:	53                   	push   %ebx
8010330f:	e8 dc 15 00 00       	call   801048f0 <acquire>
  if(writable){
80103314:	83 c4 10             	add    $0x10,%esp
80103317:	85 f6                	test   %esi,%esi
80103319:	74 45                	je     80103360 <pipeclose+0x60>
    p->writeopen = 0;
    wakeup(&p->nread);
8010331b:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
80103321:	83 ec 0c             	sub    $0xc,%esp
void
pipeclose(struct pipe *p, int writable)
{
  acquire(&p->lock);
  if(writable){
    p->writeopen = 0;
80103324:	c7 83 40 02 00 00 00 	movl   $0x0,0x240(%ebx)
8010332b:	00 00 00 
    wakeup(&p->nread);
8010332e:	50                   	push   %eax
8010332f:	e8 4c 0d 00 00       	call   80104080 <wakeup>
80103334:	83 c4 10             	add    $0x10,%esp
  } else {
    p->readopen = 0;
    wakeup(&p->nwrite);
  }
  if(p->readopen == 0 && p->writeopen == 0){
80103337:	8b 93 3c 02 00 00    	mov    0x23c(%ebx),%edx
8010333d:	85 d2                	test   %edx,%edx
8010333f:	75 0a                	jne    8010334b <pipeclose+0x4b>
80103341:	8b 83 40 02 00 00    	mov    0x240(%ebx),%eax
80103347:	85 c0                	test   %eax,%eax
80103349:	74 35                	je     80103380 <pipeclose+0x80>
    release(&p->lock);
    kfree((char*)p);
  } else
    release(&p->lock);
8010334b:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
8010334e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103351:	5b                   	pop    %ebx
80103352:	5e                   	pop    %esi
80103353:	5d                   	pop    %ebp
  }
  if(p->readopen == 0 && p->writeopen == 0){
    release(&p->lock);
    kfree((char*)p);
  } else
    release(&p->lock);
80103354:	e9 b7 16 00 00       	jmp    80104a10 <release>
80103359:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  if(writable){
    p->writeopen = 0;
    wakeup(&p->nread);
  } else {
    p->readopen = 0;
    wakeup(&p->nwrite);
80103360:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
80103366:	83 ec 0c             	sub    $0xc,%esp
  acquire(&p->lock);
  if(writable){
    p->writeopen = 0;
    wakeup(&p->nread);
  } else {
    p->readopen = 0;
80103369:	c7 83 3c 02 00 00 00 	movl   $0x0,0x23c(%ebx)
80103370:	00 00 00 
    wakeup(&p->nwrite);
80103373:	50                   	push   %eax
80103374:	e8 07 0d 00 00       	call   80104080 <wakeup>
80103379:	83 c4 10             	add    $0x10,%esp
8010337c:	eb b9                	jmp    80103337 <pipeclose+0x37>
8010337e:	66 90                	xchg   %ax,%ax
  }
  if(p->readopen == 0 && p->writeopen == 0){
    release(&p->lock);
80103380:	83 ec 0c             	sub    $0xc,%esp
80103383:	53                   	push   %ebx
80103384:	e8 87 16 00 00       	call   80104a10 <release>
    kfree((char*)p);
80103389:	89 5d 08             	mov    %ebx,0x8(%ebp)
8010338c:	83 c4 10             	add    $0x10,%esp
  } else
    release(&p->lock);
}
8010338f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103392:	5b                   	pop    %ebx
80103393:	5e                   	pop    %esi
80103394:	5d                   	pop    %ebp
    p->readopen = 0;
    wakeup(&p->nwrite);
  }
  if(p->readopen == 0 && p->writeopen == 0){
    release(&p->lock);
    kfree((char*)p);
80103395:	e9 46 ef ff ff       	jmp    801022e0 <kfree>
8010339a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801033a0 <pipewrite>:
}

//PAGEBREAK: 40
int
pipewrite(struct pipe *p, char *addr, int n)
{
801033a0:	55                   	push   %ebp
801033a1:	89 e5                	mov    %esp,%ebp
801033a3:	57                   	push   %edi
801033a4:	56                   	push   %esi
801033a5:	53                   	push   %ebx
801033a6:	83 ec 28             	sub    $0x28,%esp
801033a9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int i;

  acquire(&p->lock);
801033ac:	53                   	push   %ebx
801033ad:	e8 3e 15 00 00       	call   801048f0 <acquire>
  for(i = 0; i < n; i++){
801033b2:	8b 45 10             	mov    0x10(%ebp),%eax
801033b5:	83 c4 10             	add    $0x10,%esp
801033b8:	85 c0                	test   %eax,%eax
801033ba:	0f 8e ca 00 00 00    	jle    8010348a <pipewrite+0xea>
801033c0:	8b 4d 0c             	mov    0xc(%ebp),%ecx
801033c3:	8b 83 38 02 00 00    	mov    0x238(%ebx),%eax
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
      if(p->readopen == 0 || myproc()->killed){
        release(&p->lock);
        return -1;
      }
      wakeup(&p->nread);
801033c9:	8d bb 34 02 00 00    	lea    0x234(%ebx),%edi
801033cf:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
801033d2:	03 4d 10             	add    0x10(%ebp),%ecx
801033d5:	89 4d e0             	mov    %ecx,-0x20(%ebp)
{
  int i;

  acquire(&p->lock);
  for(i = 0; i < n; i++){
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
801033d8:	8b 8b 34 02 00 00    	mov    0x234(%ebx),%ecx
801033de:	8d 91 00 02 00 00    	lea    0x200(%ecx),%edx
801033e4:	39 d0                	cmp    %edx,%eax
801033e6:	75 71                	jne    80103459 <pipewrite+0xb9>
      if(p->readopen == 0 || myproc()->killed){
801033e8:	8b 83 3c 02 00 00    	mov    0x23c(%ebx),%eax
801033ee:	85 c0                	test   %eax,%eax
801033f0:	74 4e                	je     80103440 <pipewrite+0xa0>
        release(&p->lock);
        return -1;
      }
      wakeup(&p->nread);
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
801033f2:	8d b3 38 02 00 00    	lea    0x238(%ebx),%esi
801033f8:	eb 3a                	jmp    80103434 <pipewrite+0x94>
801033fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
      if(p->readopen == 0 || myproc()->killed){
        release(&p->lock);
        return -1;
      }
      wakeup(&p->nread);
80103400:	83 ec 0c             	sub    $0xc,%esp
80103403:	57                   	push   %edi
80103404:	e8 77 0c 00 00       	call   80104080 <wakeup>
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
80103409:	5a                   	pop    %edx
8010340a:	59                   	pop    %ecx
8010340b:	53                   	push   %ebx
8010340c:	56                   	push   %esi
8010340d:	e8 ae 0a 00 00       	call   80103ec0 <sleep>
{
  int i;

  acquire(&p->lock);
  for(i = 0; i < n; i++){
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
80103412:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
80103418:	8b 93 38 02 00 00    	mov    0x238(%ebx),%edx
8010341e:	83 c4 10             	add    $0x10,%esp
80103421:	05 00 02 00 00       	add    $0x200,%eax
80103426:	39 c2                	cmp    %eax,%edx
80103428:	75 36                	jne    80103460 <pipewrite+0xc0>
      if(p->readopen == 0 || myproc()->killed){
8010342a:	8b 83 3c 02 00 00    	mov    0x23c(%ebx),%eax
80103430:	85 c0                	test   %eax,%eax
80103432:	74 0c                	je     80103440 <pipewrite+0xa0>
80103434:	e8 87 04 00 00       	call   801038c0 <myproc>
80103439:	8b 40 24             	mov    0x24(%eax),%eax
8010343c:	85 c0                	test   %eax,%eax
8010343e:	74 c0                	je     80103400 <pipewrite+0x60>
        release(&p->lock);
80103440:	83 ec 0c             	sub    $0xc,%esp
80103443:	53                   	push   %ebx
80103444:	e8 c7 15 00 00       	call   80104a10 <release>
        return -1;
80103449:	83 c4 10             	add    $0x10,%esp
8010344c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
  }
  wakeup(&p->nread);  //DOC: pipewrite-wakeup1
  release(&p->lock);
  return n;
}
80103451:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103454:	5b                   	pop    %ebx
80103455:	5e                   	pop    %esi
80103456:	5f                   	pop    %edi
80103457:	5d                   	pop    %ebp
80103458:	c3                   	ret    
{
  int i;

  acquire(&p->lock);
  for(i = 0; i < n; i++){
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
80103459:	89 c2                	mov    %eax,%edx
8010345b:	90                   	nop
8010345c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        return -1;
      }
      wakeup(&p->nread);
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
    }
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
80103460:	8b 75 e4             	mov    -0x1c(%ebp),%esi
80103463:	8d 42 01             	lea    0x1(%edx),%eax
80103466:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
8010346c:	89 83 38 02 00 00    	mov    %eax,0x238(%ebx)
80103472:	0f b6 0e             	movzbl (%esi),%ecx
80103475:	88 4c 13 34          	mov    %cl,0x34(%ebx,%edx,1)
80103479:	89 f1                	mov    %esi,%ecx
8010347b:	83 c1 01             	add    $0x1,%ecx
pipewrite(struct pipe *p, char *addr, int n)
{
  int i;

  acquire(&p->lock);
  for(i = 0; i < n; i++){
8010347e:	3b 4d e0             	cmp    -0x20(%ebp),%ecx
80103481:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80103484:	0f 85 4e ff ff ff    	jne    801033d8 <pipewrite+0x38>
      wakeup(&p->nread);
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
    }
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
  }
  wakeup(&p->nread);  //DOC: pipewrite-wakeup1
8010348a:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
80103490:	83 ec 0c             	sub    $0xc,%esp
80103493:	50                   	push   %eax
80103494:	e8 e7 0b 00 00       	call   80104080 <wakeup>
  release(&p->lock);
80103499:	89 1c 24             	mov    %ebx,(%esp)
8010349c:	e8 6f 15 00 00       	call   80104a10 <release>
  return n;
801034a1:	83 c4 10             	add    $0x10,%esp
801034a4:	8b 45 10             	mov    0x10(%ebp),%eax
801034a7:	eb a8                	jmp    80103451 <pipewrite+0xb1>
801034a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801034b0 <piperead>:
}

int
piperead(struct pipe *p, char *addr, int n)
{
801034b0:	55                   	push   %ebp
801034b1:	89 e5                	mov    %esp,%ebp
801034b3:	57                   	push   %edi
801034b4:	56                   	push   %esi
801034b5:	53                   	push   %ebx
801034b6:	83 ec 18             	sub    $0x18,%esp
801034b9:	8b 75 08             	mov    0x8(%ebp),%esi
801034bc:	8b 7d 0c             	mov    0xc(%ebp),%edi
  int i;

  acquire(&p->lock);
801034bf:	56                   	push   %esi
801034c0:	e8 2b 14 00 00       	call   801048f0 <acquire>
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
801034c5:	83 c4 10             	add    $0x10,%esp
801034c8:	8b 8e 34 02 00 00    	mov    0x234(%esi),%ecx
801034ce:	3b 8e 38 02 00 00    	cmp    0x238(%esi),%ecx
801034d4:	75 6a                	jne    80103540 <piperead+0x90>
801034d6:	8b 9e 40 02 00 00    	mov    0x240(%esi),%ebx
801034dc:	85 db                	test   %ebx,%ebx
801034de:	0f 84 c4 00 00 00    	je     801035a8 <piperead+0xf8>
    if(myproc()->killed){
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
801034e4:	8d 9e 34 02 00 00    	lea    0x234(%esi),%ebx
801034ea:	eb 2d                	jmp    80103519 <piperead+0x69>
801034ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801034f0:	83 ec 08             	sub    $0x8,%esp
801034f3:	56                   	push   %esi
801034f4:	53                   	push   %ebx
801034f5:	e8 c6 09 00 00       	call   80103ec0 <sleep>
piperead(struct pipe *p, char *addr, int n)
{
  int i;

  acquire(&p->lock);
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
801034fa:	83 c4 10             	add    $0x10,%esp
801034fd:	8b 8e 34 02 00 00    	mov    0x234(%esi),%ecx
80103503:	3b 8e 38 02 00 00    	cmp    0x238(%esi),%ecx
80103509:	75 35                	jne    80103540 <piperead+0x90>
8010350b:	8b 96 40 02 00 00    	mov    0x240(%esi),%edx
80103511:	85 d2                	test   %edx,%edx
80103513:	0f 84 8f 00 00 00    	je     801035a8 <piperead+0xf8>
    if(myproc()->killed){
80103519:	e8 a2 03 00 00       	call   801038c0 <myproc>
8010351e:	8b 48 24             	mov    0x24(%eax),%ecx
80103521:	85 c9                	test   %ecx,%ecx
80103523:	74 cb                	je     801034f0 <piperead+0x40>
      release(&p->lock);
80103525:	83 ec 0c             	sub    $0xc,%esp
      return -1;
80103528:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
  int i;

  acquire(&p->lock);
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
    if(myproc()->killed){
      release(&p->lock);
8010352d:	56                   	push   %esi
8010352e:	e8 dd 14 00 00       	call   80104a10 <release>
      return -1;
80103533:	83 c4 10             	add    $0x10,%esp
    addr[i] = p->data[p->nread++ % PIPESIZE];
  }
  wakeup(&p->nwrite);  //DOC: piperead-wakeup
  release(&p->lock);
  return i;
}
80103536:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103539:	89 d8                	mov    %ebx,%eax
8010353b:	5b                   	pop    %ebx
8010353c:	5e                   	pop    %esi
8010353d:	5f                   	pop    %edi
8010353e:	5d                   	pop    %ebp
8010353f:	c3                   	ret    
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
80103540:	8b 45 10             	mov    0x10(%ebp),%eax
80103543:	85 c0                	test   %eax,%eax
80103545:	7e 61                	jle    801035a8 <piperead+0xf8>
    if(p->nread == p->nwrite)
80103547:	31 db                	xor    %ebx,%ebx
80103549:	eb 13                	jmp    8010355e <piperead+0xae>
8010354b:	90                   	nop
8010354c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103550:	8b 8e 34 02 00 00    	mov    0x234(%esi),%ecx
80103556:	3b 8e 38 02 00 00    	cmp    0x238(%esi),%ecx
8010355c:	74 1f                	je     8010357d <piperead+0xcd>
      break;
    addr[i] = p->data[p->nread++ % PIPESIZE];
8010355e:	8d 41 01             	lea    0x1(%ecx),%eax
80103561:	81 e1 ff 01 00 00    	and    $0x1ff,%ecx
80103567:	89 86 34 02 00 00    	mov    %eax,0x234(%esi)
8010356d:	0f b6 44 0e 34       	movzbl 0x34(%esi,%ecx,1),%eax
80103572:	88 04 1f             	mov    %al,(%edi,%ebx,1)
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
80103575:	83 c3 01             	add    $0x1,%ebx
80103578:	39 5d 10             	cmp    %ebx,0x10(%ebp)
8010357b:	75 d3                	jne    80103550 <piperead+0xa0>
    if(p->nread == p->nwrite)
      break;
    addr[i] = p->data[p->nread++ % PIPESIZE];
  }
  wakeup(&p->nwrite);  //DOC: piperead-wakeup
8010357d:	8d 86 38 02 00 00    	lea    0x238(%esi),%eax
80103583:	83 ec 0c             	sub    $0xc,%esp
80103586:	50                   	push   %eax
80103587:	e8 f4 0a 00 00       	call   80104080 <wakeup>
  release(&p->lock);
8010358c:	89 34 24             	mov    %esi,(%esp)
8010358f:	e8 7c 14 00 00       	call   80104a10 <release>
  return i;
80103594:	83 c4 10             	add    $0x10,%esp
}
80103597:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010359a:	89 d8                	mov    %ebx,%eax
8010359c:	5b                   	pop    %ebx
8010359d:	5e                   	pop    %esi
8010359e:	5f                   	pop    %edi
8010359f:	5d                   	pop    %ebp
801035a0:	c3                   	ret    
801035a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    if(p->nread == p->nwrite)
801035a8:	31 db                	xor    %ebx,%ebx
801035aa:	eb d1                	jmp    8010357d <piperead+0xcd>
801035ac:	66 90                	xchg   %ax,%ax
801035ae:	66 90                	xchg   %ax,%ax

801035b0 <wakeup1>:
//PAGEBREAK!
// Wake up all processes sleeping on chan.
// The ptable lock must be held.
static void
wakeup1(void *chan)
{
801035b0:	55                   	push   %ebp
801035b1:	8b 0d bc b5 10 80    	mov    0x8010b5bc,%ecx
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
801035b7:	ba 74 5e 11 80       	mov    $0x80115e74,%edx
//PAGEBREAK!
// Wake up all processes sleeping on chan.
// The ptable lock must be held.
static void
wakeup1(void *chan)
{
801035bc:	89 e5                	mov    %esp,%ebp
801035be:	56                   	push   %esi
801035bf:	31 f6                	xor    %esi,%esi
801035c1:	53                   	push   %ebx
801035c2:	eb 12                	jmp    801035d6 <wakeup1+0x26>
801035c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
801035c8:	81 c2 94 00 00 00    	add    $0x94,%edx
801035ce:	81 fa 74 83 11 80    	cmp    $0x80118374,%edx
801035d4:	73 3a                	jae    80103610 <wakeup1+0x60>
    if(p->state == SLEEPING && p->chan == chan) {
801035d6:	83 7a 0c 02          	cmpl   $0x2,0xc(%edx)
801035da:	75 ec                	jne    801035c8 <wakeup1+0x18>
801035dc:	39 42 20             	cmp    %eax,0x20(%edx)
801035df:	75 e7                	jne    801035c8 <wakeup1+0x18>
      p->state = RUNNABLE;
      #ifdef FCFS
      processesQueue[next_empty_processesQueue_index] = p;
801035e1:	89 14 8d 40 5d 11 80 	mov    %edx,-0x7feea2c0(,%ecx,4)
      if (++next_empty_processesQueue_index >= NPROC)
801035e8:	83 c1 01             	add    $0x1,%ecx
        next_empty_processesQueue_index = 0;
801035eb:	bb 00 00 00 00       	mov    $0x0,%ebx
801035f0:	83 f9 40             	cmp    $0x40,%ecx
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
    if(p->state == SLEEPING && p->chan == chan) {
      p->state = RUNNABLE;
801035f3:	c7 42 0c 03 00 00 00 	movl   $0x3,0xc(%edx)
801035fa:	be 01 00 00 00       	mov    $0x1,%esi
      #ifdef FCFS
      processesQueue[next_empty_processesQueue_index] = p;
      if (++next_empty_processesQueue_index >= NPROC)
        next_empty_processesQueue_index = 0;
801035ff:	0f 4d cb             	cmovge %ebx,%ecx
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103602:	81 c2 94 00 00 00    	add    $0x94,%edx
80103608:	81 fa 74 83 11 80    	cmp    $0x80118374,%edx
8010360e:	72 c6                	jb     801035d6 <wakeup1+0x26>
80103610:	89 f0                	mov    %esi,%eax
80103612:	84 c0                	test   %al,%al
80103614:	75 04                	jne    8010361a <wakeup1+0x6a>
      processesQueue[next_empty_processesQueue_index] = p;
      if (++next_empty_processesQueue_index >= NPROC)
        next_empty_processesQueue_index = 0;
      #endif
    }
}
80103616:	5b                   	pop    %ebx
80103617:	5e                   	pop    %esi
80103618:	5d                   	pop    %ebp
80103619:	c3                   	ret    
8010361a:	89 0d bc b5 10 80    	mov    %ecx,0x8010b5bc
80103620:	eb f4                	jmp    80103616 <wakeup1+0x66>
80103622:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103629:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103630 <allocproc>:
// If found, change state to EMBRYO and initialize
// state required to run in the kernel.
// Otherwise return 0.
static struct proc*
allocproc(void)
{
80103630:	55                   	push   %ebp
80103631:	89 e5                	mov    %esp,%ebp
80103633:	53                   	push   %ebx
  struct proc *p;
  char *sp;

  acquire(&ptable.lock);

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103634:	bb 74 5e 11 80       	mov    $0x80115e74,%ebx
// If found, change state to EMBRYO and initialize
// state required to run in the kernel.
// Otherwise return 0.
static struct proc*
allocproc(void)
{
80103639:	83 ec 10             	sub    $0x10,%esp
  struct proc *p;
  char *sp;

  acquire(&ptable.lock);
8010363c:	68 40 5e 11 80       	push   $0x80115e40
80103641:	e8 aa 12 00 00       	call   801048f0 <acquire>
80103646:	83 c4 10             	add    $0x10,%esp
80103649:	eb 17                	jmp    80103662 <allocproc+0x32>
8010364b:	90                   	nop
8010364c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103650:	81 c3 94 00 00 00    	add    $0x94,%ebx
80103656:	81 fb 74 83 11 80    	cmp    $0x80118374,%ebx
8010365c:	0f 83 9e 00 00 00    	jae    80103700 <allocproc+0xd0>
    if(p->state == UNUSED)
80103662:	8b 43 0c             	mov    0xc(%ebx),%eax
80103665:	85 c0                	test   %eax,%eax
80103667:	75 e7                	jne    80103650 <allocproc+0x20>
  release(&ptable.lock);
  return 0;

found:
  p->state = EMBRYO;
  p->pid = nextpid++;
80103669:	a1 04 b0 10 80       	mov    0x8010b004,%eax

  release(&ptable.lock);
8010366e:	83 ec 0c             	sub    $0xc,%esp

  release(&ptable.lock);
  return 0;

found:
  p->state = EMBRYO;
80103671:	c7 43 0c 01 00 00 00 	movl   $0x1,0xc(%ebx)
  p->pid = nextpid++;
80103678:	8d 50 01             	lea    0x1(%eax),%edx
8010367b:	89 43 10             	mov    %eax,0x10(%ebx)

  release(&ptable.lock);
8010367e:	68 40 5e 11 80       	push   $0x80115e40
  release(&ptable.lock);
  return 0;

found:
  p->state = EMBRYO;
  p->pid = nextpid++;
80103683:	89 15 04 b0 10 80    	mov    %edx,0x8010b004

  release(&ptable.lock);
80103689:	e8 82 13 00 00       	call   80104a10 <release>

  // Allocate kernel stack.
  if((p->kstack = kalloc()) == 0){
8010368e:	e8 fd ed ff ff       	call   80102490 <kalloc>
80103693:	83 c4 10             	add    $0x10,%esp
80103696:	85 c0                	test   %eax,%eax
80103698:	89 43 08             	mov    %eax,0x8(%ebx)
8010369b:	74 7c                	je     80103719 <allocproc+0xe9>
    return 0;
  }
  sp = p->kstack + KSTACKSIZE;

  // Leave room for trap frame.
  sp -= sizeof *p->tf;
8010369d:	8d 90 b4 0f 00 00    	lea    0xfb4(%eax),%edx
  sp -= 4;
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
801036a3:	83 ec 04             	sub    $0x4,%esp
  // Set up new context to start executing at forkret,
  // which returns to trapret.
  sp -= 4;
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
801036a6:	05 9c 0f 00 00       	add    $0xf9c,%eax
    return 0;
  }
  sp = p->kstack + KSTACKSIZE;

  // Leave room for trap frame.
  sp -= sizeof *p->tf;
801036ab:	89 53 18             	mov    %edx,0x18(%ebx)
  p->tf = (struct trapframe*)sp;

  // Set up new context to start executing at forkret,
  // which returns to trapret.
  sp -= 4;
  *(uint*)sp = (uint)trapret;
801036ae:	c7 40 14 87 5d 10 80 	movl   $0x80105d87,0x14(%eax)

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
801036b5:	89 43 1c             	mov    %eax,0x1c(%ebx)
  memset(p->context, 0, sizeof *p->context);
801036b8:	6a 14                	push   $0x14
801036ba:	6a 00                	push   $0x0
801036bc:	50                   	push   %eax
801036bd:	e8 9e 13 00 00       	call   80104a60 <memset>
  p->context->eip = (uint)forkret;
801036c2:	8b 43 1c             	mov    0x1c(%ebx),%eax
  p->ctime = ticks;
  p->etime = 0;
  p->rtime = 0;
  p->iotime=0; 

  return p;
801036c5:	83 c4 10             	add    $0x10,%esp
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
  p->context->eip = (uint)forkret;
801036c8:	c7 40 10 30 37 10 80 	movl   $0x80103730,0x10(%eax)

  // set creation time of process
  p->ctime = ticks;
801036cf:	a1 c0 8b 11 80       	mov    0x80118bc0,%eax
  p->etime = 0;
801036d4:	c7 83 80 00 00 00 00 	movl   $0x0,0x80(%ebx)
801036db:	00 00 00 
  p->rtime = 0;
801036de:	c7 83 88 00 00 00 00 	movl   $0x0,0x88(%ebx)
801036e5:	00 00 00 
  p->iotime=0; 
801036e8:	c7 83 84 00 00 00 00 	movl   $0x0,0x84(%ebx)
801036ef:	00 00 00 
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
  p->context->eip = (uint)forkret;

  // set creation time of process
  p->ctime = ticks;
801036f2:	89 43 7c             	mov    %eax,0x7c(%ebx)
  p->etime = 0;
  p->rtime = 0;
  p->iotime=0; 

  return p;
}
801036f5:	89 d8                	mov    %ebx,%eax
801036f7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801036fa:	c9                   	leave  
801036fb:	c3                   	ret    
801036fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
    if(p->state == UNUSED)
      goto found;

  release(&ptable.lock);
80103700:	83 ec 0c             	sub    $0xc,%esp
  return 0;
80103703:	31 db                	xor    %ebx,%ebx

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
    if(p->state == UNUSED)
      goto found;

  release(&ptable.lock);
80103705:	68 40 5e 11 80       	push   $0x80115e40
8010370a:	e8 01 13 00 00       	call   80104a10 <release>
  p->etime = 0;
  p->rtime = 0;
  p->iotime=0; 

  return p;
}
8010370f:	89 d8                	mov    %ebx,%eax
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
    if(p->state == UNUSED)
      goto found;

  release(&ptable.lock);
  return 0;
80103711:	83 c4 10             	add    $0x10,%esp
  p->etime = 0;
  p->rtime = 0;
  p->iotime=0; 

  return p;
}
80103714:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103717:	c9                   	leave  
80103718:	c3                   	ret    

  release(&ptable.lock);

  // Allocate kernel stack.
  if((p->kstack = kalloc()) == 0){
    p->state = UNUSED;
80103719:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
    return 0;
80103720:	31 db                	xor    %ebx,%ebx
80103722:	eb d1                	jmp    801036f5 <allocproc+0xc5>
80103724:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010372a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103730 <forkret>:

// A fork child's very first scheduling by scheduler()
// will swtch here.  "Return" to user space.
void
forkret(void)
{
80103730:	55                   	push   %ebp
80103731:	89 e5                	mov    %esp,%ebp
80103733:	83 ec 14             	sub    $0x14,%esp
  static int first = 1;
  // Still holding ptable.lock from scheduler.
  release(&ptable.lock);
80103736:	68 40 5e 11 80       	push   $0x80115e40
8010373b:	e8 d0 12 00 00       	call   80104a10 <release>

  if (first) {
80103740:	a1 00 b0 10 80       	mov    0x8010b000,%eax
80103745:	83 c4 10             	add    $0x10,%esp
80103748:	85 c0                	test   %eax,%eax
8010374a:	75 04                	jne    80103750 <forkret+0x20>
    iinit(ROOTDEV);
    initlog(ROOTDEV);
  }

  // Return to "caller", actually trapret (see allocproc).
}
8010374c:	c9                   	leave  
8010374d:	c3                   	ret    
8010374e:	66 90                	xchg   %ax,%ax
  if (first) {
    // Some initialization functions must be run in the context
    // of a regular process (e.g., they call sleep), and thus cannot
    // be run from main().
    first = 0;
    iinit(ROOTDEV);
80103750:	83 ec 0c             	sub    $0xc,%esp

  if (first) {
    // Some initialization functions must be run in the context
    // of a regular process (e.g., they call sleep), and thus cannot
    // be run from main().
    first = 0;
80103753:	c7 05 00 b0 10 80 00 	movl   $0x0,0x8010b000
8010375a:	00 00 00 
    iinit(ROOTDEV);
8010375d:	6a 01                	push   $0x1
8010375f:	e8 0c dd ff ff       	call   80101470 <iinit>
    initlog(ROOTDEV);
80103764:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
8010376b:	e8 60 f3 ff ff       	call   80102ad0 <initlog>
80103770:	83 c4 10             	add    $0x10,%esp
  }

  // Return to "caller", actually trapret (see allocproc).
}
80103773:	c9                   	leave  
80103774:	c3                   	ret    
80103775:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103779:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103780 <strcpy>:
static void wakeup1(void *chan);

//the following are imported from ulibc. useful for updating the variable table:
char*
strcpy(char *s, char *t)
{
80103780:	55                   	push   %ebp
80103781:	89 e5                	mov    %esp,%ebp
80103783:	53                   	push   %ebx
80103784:	8b 45 08             	mov    0x8(%ebp),%eax
80103787:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
8010378a:	89 c2                	mov    %eax,%edx
8010378c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103790:	83 c1 01             	add    $0x1,%ecx
80103793:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
80103797:	83 c2 01             	add    $0x1,%edx
8010379a:	84 db                	test   %bl,%bl
8010379c:	88 5a ff             	mov    %bl,-0x1(%edx)
8010379f:	75 ef                	jne    80103790 <strcpy+0x10>
    ;
  return os;
}
801037a1:	5b                   	pop    %ebx
801037a2:	5d                   	pop    %ebp
801037a3:	c3                   	ret    
801037a4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801037aa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801037b0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
801037b0:	55                   	push   %ebp
801037b1:	89 e5                	mov    %esp,%ebp
801037b3:	56                   	push   %esi
801037b4:	53                   	push   %ebx
801037b5:	8b 55 08             	mov    0x8(%ebp),%edx
801037b8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
801037bb:	0f b6 02             	movzbl (%edx),%eax
801037be:	0f b6 19             	movzbl (%ecx),%ebx
801037c1:	84 c0                	test   %al,%al
801037c3:	75 1e                	jne    801037e3 <strcmp+0x33>
801037c5:	eb 29                	jmp    801037f0 <strcmp+0x40>
801037c7:	89 f6                	mov    %esi,%esi
801037c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
801037d0:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
801037d3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
801037d6:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
801037d9:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
801037dd:	84 c0                	test   %al,%al
801037df:	74 0f                	je     801037f0 <strcmp+0x40>
801037e1:	89 f1                	mov    %esi,%ecx
801037e3:	38 d8                	cmp    %bl,%al
801037e5:	74 e9                	je     801037d0 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
801037e7:	29 d8                	sub    %ebx,%eax
}
801037e9:	5b                   	pop    %ebx
801037ea:	5e                   	pop    %esi
801037eb:	5d                   	pop    %ebp
801037ec:	c3                   	ret    
801037ed:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
801037f0:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
801037f2:	29 d8                	sub    %ebx,%eax
}
801037f4:	5b                   	pop    %ebx
801037f5:	5e                   	pop    %esi
801037f6:	5d                   	pop    %ebp
801037f7:	c3                   	ret    
801037f8:	90                   	nop
801037f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103800 <pinit>:
//end of imported functions from ulibc

void
pinit(void)
{
80103800:	55                   	push   %ebp
80103801:	89 e5                	mov    %esp,%ebp
80103803:	83 ec 10             	sub    $0x10,%esp
  initlock(&ptable.lock, "ptable");
80103806:	68 75 7b 10 80       	push   $0x80107b75
8010380b:	68 40 5e 11 80       	push   $0x80115e40
80103810:	e8 db 0f 00 00       	call   801047f0 <initlock>
}
80103815:	83 c4 10             	add    $0x10,%esp
80103818:	c9                   	leave  
80103819:	c3                   	ret    
8010381a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80103820 <mycpu>:

// Must be called with interrupts disabled to avoid the caller being
// rescheduled between reading lapicid and running through the loop.
struct cpu*
mycpu(void)
{
80103820:	55                   	push   %ebp
80103821:	89 e5                	mov    %esp,%ebp
80103823:	56                   	push   %esi
80103824:	53                   	push   %ebx

static inline uint
readeflags(void)
{
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80103825:	9c                   	pushf  
80103826:	58                   	pop    %eax
  int apicid, i;
  
  if(readeflags()&FL_IF)
80103827:	f6 c4 02             	test   $0x2,%ah
8010382a:	75 5e                	jne    8010388a <mycpu+0x6a>
    panic("mycpu called with interrupts enabled\n");
  
  apicid = lapicid();
8010382c:	e8 cf ee ff ff       	call   80102700 <lapicid>
  // APIC IDs are not guaranteed to be contiguous. Maybe we should have
  // a reverse map, or reserve a register to store &cpus[i].
  for (i = 0; i < ncpu; ++i) {
80103831:	8b 35 20 3d 11 80    	mov    0x80113d20,%esi
80103837:	85 f6                	test   %esi,%esi
80103839:	7e 42                	jle    8010387d <mycpu+0x5d>
    if (cpus[i].apicid == apicid)
8010383b:	0f b6 15 a0 37 11 80 	movzbl 0x801137a0,%edx
80103842:	39 d0                	cmp    %edx,%eax
80103844:	74 30                	je     80103876 <mycpu+0x56>
80103846:	b9 50 38 11 80       	mov    $0x80113850,%ecx
8010384b:	31 d2                	xor    %edx,%edx
8010384d:	8d 76 00             	lea    0x0(%esi),%esi
    panic("mycpu called with interrupts enabled\n");
  
  apicid = lapicid();
  // APIC IDs are not guaranteed to be contiguous. Maybe we should have
  // a reverse map, or reserve a register to store &cpus[i].
  for (i = 0; i < ncpu; ++i) {
80103850:	83 c2 01             	add    $0x1,%edx
80103853:	39 f2                	cmp    %esi,%edx
80103855:	74 26                	je     8010387d <mycpu+0x5d>
    if (cpus[i].apicid == apicid)
80103857:	0f b6 19             	movzbl (%ecx),%ebx
8010385a:	81 c1 b0 00 00 00    	add    $0xb0,%ecx
80103860:	39 d8                	cmp    %ebx,%eax
80103862:	75 ec                	jne    80103850 <mycpu+0x30>
80103864:	69 c2 b0 00 00 00    	imul   $0xb0,%edx,%eax
8010386a:	05 a0 37 11 80       	add    $0x801137a0,%eax
      return &cpus[i];
  }
  panic("unknown apicid\n");
}
8010386f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103872:	5b                   	pop    %ebx
80103873:	5e                   	pop    %esi
80103874:	5d                   	pop    %ebp
80103875:	c3                   	ret    
  
  apicid = lapicid();
  // APIC IDs are not guaranteed to be contiguous. Maybe we should have
  // a reverse map, or reserve a register to store &cpus[i].
  for (i = 0; i < ncpu; ++i) {
    if (cpus[i].apicid == apicid)
80103876:	b8 a0 37 11 80       	mov    $0x801137a0,%eax
      return &cpus[i];
8010387b:	eb f2                	jmp    8010386f <mycpu+0x4f>
  }
  panic("unknown apicid\n");
8010387d:	83 ec 0c             	sub    $0xc,%esp
80103880:	68 7c 7b 10 80       	push   $0x80107b7c
80103885:	e8 e6 ca ff ff       	call   80100370 <panic>
mycpu(void)
{
  int apicid, i;
  
  if(readeflags()&FL_IF)
    panic("mycpu called with interrupts enabled\n");
8010388a:	83 ec 0c             	sub    $0xc,%esp
8010388d:	68 58 7c 10 80       	push   $0x80107c58
80103892:	e8 d9 ca ff ff       	call   80100370 <panic>
80103897:	89 f6                	mov    %esi,%esi
80103899:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801038a0 <cpuid>:
  initlock(&ptable.lock, "ptable");
}

// Must be called with interrupts disabled
int
cpuid() {
801038a0:	55                   	push   %ebp
801038a1:	89 e5                	mov    %esp,%ebp
801038a3:	83 ec 08             	sub    $0x8,%esp
  return mycpu()-cpus;
801038a6:	e8 75 ff ff ff       	call   80103820 <mycpu>
801038ab:	2d a0 37 11 80       	sub    $0x801137a0,%eax
}
801038b0:	c9                   	leave  
}

// Must be called with interrupts disabled
int
cpuid() {
  return mycpu()-cpus;
801038b1:	c1 f8 04             	sar    $0x4,%eax
801038b4:	69 c0 a3 8b 2e ba    	imul   $0xba2e8ba3,%eax,%eax
}
801038ba:	c3                   	ret    
801038bb:	90                   	nop
801038bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801038c0 <myproc>:
}

// Disable interrupts so that we are not rescheduled
// while reading proc from the cpu structure
struct proc*
myproc(void) {
801038c0:	55                   	push   %ebp
801038c1:	89 e5                	mov    %esp,%ebp
801038c3:	53                   	push   %ebx
801038c4:	83 ec 04             	sub    $0x4,%esp
  struct cpu *c;
  struct proc *p;
  pushcli();
801038c7:	e8 e4 0f 00 00       	call   801048b0 <pushcli>
  c = mycpu();
801038cc:	e8 4f ff ff ff       	call   80103820 <mycpu>
  p = c->proc;
801038d1:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
801038d7:	e8 c4 10 00 00       	call   801049a0 <popcli>
  return p;
}
801038dc:	83 c4 04             	add    $0x4,%esp
801038df:	89 d8                	mov    %ebx,%eax
801038e1:	5b                   	pop    %ebx
801038e2:	5d                   	pop    %ebp
801038e3:	c3                   	ret    
801038e4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801038ea:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801038f0 <userinit>:

//PAGEBREAK: 32
// Set up first user process.
void
userinit(void)
{
801038f0:	55                   	push   %ebp
801038f1:	89 e5                	mov    %esp,%ebp
801038f3:	53                   	push   %ebx
801038f4:	83 ec 04             	sub    $0x4,%esp
  struct proc *p;
  extern char _binary_initcode_start[], _binary_initcode_size[];

  p = allocproc();
801038f7:	e8 34 fd ff ff       	call   80103630 <allocproc>
801038fc:	89 c3                	mov    %eax,%ebx
  
  initproc = p;
801038fe:	a3 c4 b5 10 80       	mov    %eax,0x8010b5c4
  if((p->pgdir = setupkvm()) == 0)
80103903:	e8 78 3a 00 00       	call   80107380 <setupkvm>
80103908:	85 c0                	test   %eax,%eax
8010390a:	89 43 04             	mov    %eax,0x4(%ebx)
8010390d:	0f 84 d1 00 00 00    	je     801039e4 <userinit+0xf4>
    panic("userinit: out of memory?");
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
80103913:	83 ec 04             	sub    $0x4,%esp
80103916:	68 2c 00 00 00       	push   $0x2c
8010391b:	68 60 b4 10 80       	push   $0x8010b460
80103920:	50                   	push   %eax
80103921:	e8 7a 37 00 00       	call   801070a0 <inituvm>
  p->sz = PGSIZE;
  memset(p->tf, 0, sizeof(*p->tf));
80103926:	83 c4 0c             	add    $0xc,%esp
  
  initproc = p;
  if((p->pgdir = setupkvm()) == 0)
    panic("userinit: out of memory?");
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
  p->sz = PGSIZE;
80103929:	c7 03 00 10 00 00    	movl   $0x1000,(%ebx)
  memset(p->tf, 0, sizeof(*p->tf));
8010392f:	6a 4c                	push   $0x4c
80103931:	6a 00                	push   $0x0
80103933:	ff 73 18             	pushl  0x18(%ebx)
80103936:	e8 25 11 00 00       	call   80104a60 <memset>
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
8010393b:	8b 43 18             	mov    0x18(%ebx),%eax
8010393e:	ba 1b 00 00 00       	mov    $0x1b,%edx
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
80103943:	b9 23 00 00 00       	mov    $0x23,%ecx
  p->tf->ss = p->tf->ds;
  p->tf->eflags = FL_IF;
  p->tf->esp = PGSIZE;
  p->tf->eip = 0;  // beginning of initcode.S

  safestrcpy(p->name, "initcode", sizeof(p->name));
80103948:	83 c4 0c             	add    $0xc,%esp
  if((p->pgdir = setupkvm()) == 0)
    panic("userinit: out of memory?");
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
  p->sz = PGSIZE;
  memset(p->tf, 0, sizeof(*p->tf));
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
8010394b:	66 89 50 3c          	mov    %dx,0x3c(%eax)
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
8010394f:	8b 43 18             	mov    0x18(%ebx),%eax
80103952:	66 89 48 2c          	mov    %cx,0x2c(%eax)
  p->tf->es = p->tf->ds;
80103956:	8b 43 18             	mov    0x18(%ebx),%eax
80103959:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
8010395d:	66 89 50 28          	mov    %dx,0x28(%eax)
  p->tf->ss = p->tf->ds;
80103961:	8b 43 18             	mov    0x18(%ebx),%eax
80103964:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
80103968:	66 89 50 48          	mov    %dx,0x48(%eax)
  p->tf->eflags = FL_IF;
8010396c:	8b 43 18             	mov    0x18(%ebx),%eax
8010396f:	c7 40 40 00 02 00 00 	movl   $0x200,0x40(%eax)
  p->tf->esp = PGSIZE;
80103976:	8b 43 18             	mov    0x18(%ebx),%eax
80103979:	c7 40 44 00 10 00 00 	movl   $0x1000,0x44(%eax)
  p->tf->eip = 0;  // beginning of initcode.S
80103980:	8b 43 18             	mov    0x18(%ebx),%eax
80103983:	c7 40 38 00 00 00 00 	movl   $0x0,0x38(%eax)

  safestrcpy(p->name, "initcode", sizeof(p->name));
8010398a:	8d 43 6c             	lea    0x6c(%ebx),%eax
8010398d:	6a 10                	push   $0x10
8010398f:	68 a5 7b 10 80       	push   $0x80107ba5
80103994:	50                   	push   %eax
80103995:	e8 a6 12 00 00       	call   80104c40 <safestrcpy>
  p->cwd = namei("/");
8010399a:	c7 04 24 ae 7b 10 80 	movl   $0x80107bae,(%esp)
801039a1:	e8 1a e5 ff ff       	call   80101ec0 <namei>
801039a6:	89 43 68             	mov    %eax,0x68(%ebx)

  // this assignment to p->state lets other cores
  // run this process. the acquire forces the above
  // writes to be visible, and the lock is also needed
  // because the assignment might not be atomic.
  acquire(&ptable.lock);
801039a9:	c7 04 24 40 5e 11 80 	movl   $0x80115e40,(%esp)
801039b0:	e8 3b 0f 00 00       	call   801048f0 <acquire>

  p->state = RUNNABLE;
  #ifdef FCFS
  processesQueue[next_empty_processesQueue_index] = p;
801039b5:	a1 bc b5 10 80       	mov    0x8010b5bc,%eax
  // run this process. the acquire forces the above
  // writes to be visible, and the lock is also needed
  // because the assignment might not be atomic.
  acquire(&ptable.lock);

  p->state = RUNNABLE;
801039ba:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)
  #ifdef FCFS
  processesQueue[next_empty_processesQueue_index] = p;
  next_empty_processesQueue_index++;
  #endif

  release(&ptable.lock);
801039c1:	c7 04 24 40 5e 11 80 	movl   $0x80115e40,(%esp)
  // because the assignment might not be atomic.
  acquire(&ptable.lock);

  p->state = RUNNABLE;
  #ifdef FCFS
  processesQueue[next_empty_processesQueue_index] = p;
801039c8:	89 1c 85 40 5d 11 80 	mov    %ebx,-0x7feea2c0(,%eax,4)
  next_empty_processesQueue_index++;
801039cf:	83 c0 01             	add    $0x1,%eax
801039d2:	a3 bc b5 10 80       	mov    %eax,0x8010b5bc
  #endif

  release(&ptable.lock);
801039d7:	e8 34 10 00 00       	call   80104a10 <release>
}
801039dc:	83 c4 10             	add    $0x10,%esp
801039df:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801039e2:	c9                   	leave  
801039e3:	c3                   	ret    

  p = allocproc();
  
  initproc = p;
  if((p->pgdir = setupkvm()) == 0)
    panic("userinit: out of memory?");
801039e4:	83 ec 0c             	sub    $0xc,%esp
801039e7:	68 8c 7b 10 80       	push   $0x80107b8c
801039ec:	e8 7f c9 ff ff       	call   80100370 <panic>
801039f1:	eb 0d                	jmp    80103a00 <growproc>
801039f3:	90                   	nop
801039f4:	90                   	nop
801039f5:	90                   	nop
801039f6:	90                   	nop
801039f7:	90                   	nop
801039f8:	90                   	nop
801039f9:	90                   	nop
801039fa:	90                   	nop
801039fb:	90                   	nop
801039fc:	90                   	nop
801039fd:	90                   	nop
801039fe:	90                   	nop
801039ff:	90                   	nop

80103a00 <growproc>:

// Grow current process's memory by n bytes.
// Return 0 on success, -1 on failure.
int
growproc(int n)
{
80103a00:	55                   	push   %ebp
80103a01:	89 e5                	mov    %esp,%ebp
80103a03:	56                   	push   %esi
80103a04:	53                   	push   %ebx
80103a05:	8b 75 08             	mov    0x8(%ebp),%esi
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
80103a08:	e8 a3 0e 00 00       	call   801048b0 <pushcli>
  c = mycpu();
80103a0d:	e8 0e fe ff ff       	call   80103820 <mycpu>
  p = c->proc;
80103a12:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103a18:	e8 83 0f 00 00       	call   801049a0 <popcli>
{
  uint sz;
  struct proc *curproc = myproc();

  sz = curproc->sz;
  if(n > 0){
80103a1d:	83 fe 00             	cmp    $0x0,%esi
growproc(int n)
{
  uint sz;
  struct proc *curproc = myproc();

  sz = curproc->sz;
80103a20:	8b 03                	mov    (%ebx),%eax
  if(n > 0){
80103a22:	7e 34                	jle    80103a58 <growproc+0x58>
    if((sz = allocuvm(curproc->pgdir, sz, sz + n)) == 0)
80103a24:	83 ec 04             	sub    $0x4,%esp
80103a27:	01 c6                	add    %eax,%esi
80103a29:	56                   	push   %esi
80103a2a:	50                   	push   %eax
80103a2b:	ff 73 04             	pushl  0x4(%ebx)
80103a2e:	e8 ad 37 00 00       	call   801071e0 <allocuvm>
80103a33:	83 c4 10             	add    $0x10,%esp
80103a36:	85 c0                	test   %eax,%eax
80103a38:	74 36                	je     80103a70 <growproc+0x70>
  } else if(n < 0){
    if((sz = deallocuvm(curproc->pgdir, sz, sz + n)) == 0)
      return -1;
  }
  curproc->sz = sz;
  switchuvm(curproc);
80103a3a:	83 ec 0c             	sub    $0xc,%esp
      return -1;
  } else if(n < 0){
    if((sz = deallocuvm(curproc->pgdir, sz, sz + n)) == 0)
      return -1;
  }
  curproc->sz = sz;
80103a3d:	89 03                	mov    %eax,(%ebx)
  switchuvm(curproc);
80103a3f:	53                   	push   %ebx
80103a40:	e8 4b 35 00 00       	call   80106f90 <switchuvm>
  return 0;
80103a45:	83 c4 10             	add    $0x10,%esp
80103a48:	31 c0                	xor    %eax,%eax
}
80103a4a:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103a4d:	5b                   	pop    %ebx
80103a4e:	5e                   	pop    %esi
80103a4f:	5d                   	pop    %ebp
80103a50:	c3                   	ret    
80103a51:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

  sz = curproc->sz;
  if(n > 0){
    if((sz = allocuvm(curproc->pgdir, sz, sz + n)) == 0)
      return -1;
  } else if(n < 0){
80103a58:	74 e0                	je     80103a3a <growproc+0x3a>
    if((sz = deallocuvm(curproc->pgdir, sz, sz + n)) == 0)
80103a5a:	83 ec 04             	sub    $0x4,%esp
80103a5d:	01 c6                	add    %eax,%esi
80103a5f:	56                   	push   %esi
80103a60:	50                   	push   %eax
80103a61:	ff 73 04             	pushl  0x4(%ebx)
80103a64:	e8 67 38 00 00       	call   801072d0 <deallocuvm>
80103a69:	83 c4 10             	add    $0x10,%esp
80103a6c:	85 c0                	test   %eax,%eax
80103a6e:	75 ca                	jne    80103a3a <growproc+0x3a>
  struct proc *curproc = myproc();

  sz = curproc->sz;
  if(n > 0){
    if((sz = allocuvm(curproc->pgdir, sz, sz + n)) == 0)
      return -1;
80103a70:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103a75:	eb d3                	jmp    80103a4a <growproc+0x4a>
80103a77:	89 f6                	mov    %esi,%esi
80103a79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103a80 <fork>:
// Create a new process copying p as the parent.
// Sets up stack to return as if from system call.
// Caller must set state of returned proc to RUNNABLE.
int
fork(void)
{
80103a80:	55                   	push   %ebp
80103a81:	89 e5                	mov    %esp,%ebp
80103a83:	57                   	push   %edi
80103a84:	56                   	push   %esi
80103a85:	53                   	push   %ebx
80103a86:	83 ec 1c             	sub    $0x1c,%esp
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
80103a89:	e8 22 0e 00 00       	call   801048b0 <pushcli>
  c = mycpu();
80103a8e:	e8 8d fd ff ff       	call   80103820 <mycpu>
  p = c->proc;
80103a93:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103a99:	e8 02 0f 00 00       	call   801049a0 <popcli>
  int i, pid;
  struct proc *np;
  struct proc *curproc = myproc();

  // Allocate process.
  if((np = allocproc()) == 0){
80103a9e:	e8 8d fb ff ff       	call   80103630 <allocproc>
80103aa3:	85 c0                	test   %eax,%eax
80103aa5:	89 c7                	mov    %eax,%edi
80103aa7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80103aaa:	0f 84 d6 00 00 00    	je     80103b86 <fork+0x106>
    return -1;
  }

  // Copy process state from proc.
  if((np->pgdir = copyuvm(curproc->pgdir, curproc->sz)) == 0){
80103ab0:	83 ec 08             	sub    $0x8,%esp
80103ab3:	ff 33                	pushl  (%ebx)
80103ab5:	ff 73 04             	pushl  0x4(%ebx)
80103ab8:	e8 93 39 00 00       	call   80107450 <copyuvm>
80103abd:	83 c4 10             	add    $0x10,%esp
80103ac0:	85 c0                	test   %eax,%eax
80103ac2:	89 47 04             	mov    %eax,0x4(%edi)
80103ac5:	0f 84 c2 00 00 00    	je     80103b8d <fork+0x10d>
    kfree(np->kstack);
    np->kstack = 0;
    np->state = UNUSED;
    return -1;
  }
  np->sz = curproc->sz;
80103acb:	8b 03                	mov    (%ebx),%eax
80103acd:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  np->parent = curproc;
  *np->tf = *curproc->tf;
80103ad0:	b9 13 00 00 00       	mov    $0x13,%ecx
    kfree(np->kstack);
    np->kstack = 0;
    np->state = UNUSED;
    return -1;
  }
  np->sz = curproc->sz;
80103ad5:	89 02                	mov    %eax,(%edx)
  np->parent = curproc;
80103ad7:	89 5a 14             	mov    %ebx,0x14(%edx)
  *np->tf = *curproc->tf;
80103ada:	8b 7a 18             	mov    0x18(%edx),%edi
80103add:	8b 73 18             	mov    0x18(%ebx),%esi
80103ae0:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;

  for(i = 0; i < NOFILE; i++)
80103ae2:	31 f6                	xor    %esi,%esi
  np->sz = curproc->sz;
  np->parent = curproc;
  *np->tf = *curproc->tf;

  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;
80103ae4:	8b 42 18             	mov    0x18(%edx),%eax
80103ae7:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
80103aee:	66 90                	xchg   %ax,%ax

  for(i = 0; i < NOFILE; i++)
    if(curproc->ofile[i])
80103af0:	8b 44 b3 28          	mov    0x28(%ebx,%esi,4),%eax
80103af4:	85 c0                	test   %eax,%eax
80103af6:	74 13                	je     80103b0b <fork+0x8b>
      np->ofile[i] = filedup(curproc->ofile[i]);
80103af8:	83 ec 0c             	sub    $0xc,%esp
80103afb:	50                   	push   %eax
80103afc:	e8 cf d2 ff ff       	call   80100dd0 <filedup>
80103b01:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80103b04:	83 c4 10             	add    $0x10,%esp
80103b07:	89 44 b1 28          	mov    %eax,0x28(%ecx,%esi,4)
  *np->tf = *curproc->tf;

  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;

  for(i = 0; i < NOFILE; i++)
80103b0b:	83 c6 01             	add    $0x1,%esi
80103b0e:	83 fe 10             	cmp    $0x10,%esi
80103b11:	75 dd                	jne    80103af0 <fork+0x70>
    if(curproc->ofile[i])
      np->ofile[i] = filedup(curproc->ofile[i]);
  np->cwd = idup(curproc->cwd);
80103b13:	83 ec 0c             	sub    $0xc,%esp
80103b16:	ff 73 68             	pushl  0x68(%ebx)

  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
80103b19:	83 c3 6c             	add    $0x6c,%ebx
  np->tf->eax = 0;

  for(i = 0; i < NOFILE; i++)
    if(curproc->ofile[i])
      np->ofile[i] = filedup(curproc->ofile[i]);
  np->cwd = idup(curproc->cwd);
80103b1c:	e8 1f db ff ff       	call   80101640 <idup>
80103b21:	8b 7d e4             	mov    -0x1c(%ebp),%edi

  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
80103b24:	83 c4 0c             	add    $0xc,%esp
  np->tf->eax = 0;

  for(i = 0; i < NOFILE; i++)
    if(curproc->ofile[i])
      np->ofile[i] = filedup(curproc->ofile[i]);
  np->cwd = idup(curproc->cwd);
80103b27:	89 47 68             	mov    %eax,0x68(%edi)

  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
80103b2a:	8d 47 6c             	lea    0x6c(%edi),%eax
80103b2d:	6a 10                	push   $0x10
80103b2f:	53                   	push   %ebx
80103b30:	50                   	push   %eax
80103b31:	e8 0a 11 00 00       	call   80104c40 <safestrcpy>

  pid = np->pid;
80103b36:	8b 5f 10             	mov    0x10(%edi),%ebx

  acquire(&ptable.lock);
80103b39:	c7 04 24 40 5e 11 80 	movl   $0x80115e40,(%esp)
80103b40:	e8 ab 0d 00 00       	call   801048f0 <acquire>

  np->state = RUNNABLE;
  #ifdef FCFS
  processesQueue[next_empty_processesQueue_index] = np;
80103b45:	8b 15 bc b5 10 80    	mov    0x8010b5bc,%edx

  pid = np->pid;

  acquire(&ptable.lock);

  np->state = RUNNABLE;
80103b4b:	c7 47 0c 03 00 00 00 	movl   $0x3,0xc(%edi)
  #ifdef FCFS
  processesQueue[next_empty_processesQueue_index] = np;
  if(++next_empty_processesQueue_index >= NPROC)
80103b52:	b8 00 00 00 00       	mov    $0x0,%eax
    next_empty_processesQueue_index = 0;
  #endif

  release(&ptable.lock);
80103b57:	c7 04 24 40 5e 11 80 	movl   $0x80115e40,(%esp)

  acquire(&ptable.lock);

  np->state = RUNNABLE;
  #ifdef FCFS
  processesQueue[next_empty_processesQueue_index] = np;
80103b5e:	89 3c 95 40 5d 11 80 	mov    %edi,-0x7feea2c0(,%edx,4)
  if(++next_empty_processesQueue_index >= NPROC)
80103b65:	83 c2 01             	add    $0x1,%edx
80103b68:	83 fa 3f             	cmp    $0x3f,%edx
80103b6b:	0f 4f d0             	cmovg  %eax,%edx
80103b6e:	89 15 bc b5 10 80    	mov    %edx,0x8010b5bc
    next_empty_processesQueue_index = 0;
  #endif

  release(&ptable.lock);
80103b74:	e8 97 0e 00 00       	call   80104a10 <release>

  return pid;
80103b79:	83 c4 10             	add    $0x10,%esp
}
80103b7c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103b7f:	89 d8                	mov    %ebx,%eax
80103b81:	5b                   	pop    %ebx
80103b82:	5e                   	pop    %esi
80103b83:	5f                   	pop    %edi
80103b84:	5d                   	pop    %ebp
80103b85:	c3                   	ret    
  struct proc *np;
  struct proc *curproc = myproc();

  // Allocate process.
  if((np = allocproc()) == 0){
    return -1;
80103b86:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80103b8b:	eb ef                	jmp    80103b7c <fork+0xfc>
  }

  // Copy process state from proc.
  if((np->pgdir = copyuvm(curproc->pgdir, curproc->sz)) == 0){
    kfree(np->kstack);
80103b8d:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80103b90:	83 ec 0c             	sub    $0xc,%esp
80103b93:	ff 73 08             	pushl  0x8(%ebx)
80103b96:	e8 45 e7 ff ff       	call   801022e0 <kfree>
    np->kstack = 0;
80103b9b:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
    np->state = UNUSED;
80103ba2:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
    return -1;
80103ba9:	83 c4 10             	add    $0x10,%esp
80103bac:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80103bb1:	eb c9                	jmp    80103b7c <fork+0xfc>
80103bb3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103bb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103bc0 <scheduler>:
//  - swtch to start running that process
//  - eventually that process transfers control
//      via swtch back to the scheduler.
void
scheduler(void)
{
80103bc0:	55                   	push   %ebp
80103bc1:	89 e5                	mov    %esp,%ebp
80103bc3:	57                   	push   %edi
80103bc4:	56                   	push   %esi
80103bc5:	53                   	push   %ebx
80103bc6:	83 ec 0c             	sub    $0xc,%esp
  struct proc *p;
  struct cpu *c = mycpu();
80103bc9:	e8 52 fc ff ff       	call   80103820 <mycpu>
80103bce:	89 c3                	mov    %eax,%ebx
  c->proc = 0;
80103bd0:	c7 80 ac 00 00 00 00 	movl   $0x0,0xac(%eax)
80103bd7:	00 00 00 
80103bda:	8d 78 04             	lea    0x4(%eax),%edi
80103bdd:	eb 11                	jmp    80103bf0 <scheduler+0x30>
80103bdf:	90                   	nop
      // change p->state before coming back.
      c->proc = 0;
    }
    #endif 

    release(&ptable.lock);
80103be0:	83 ec 0c             	sub    $0xc,%esp
80103be3:	68 40 5e 11 80       	push   $0x80115e40
80103be8:	e8 23 0e 00 00       	call   80104a10 <release>
  struct cpu *c = mycpu();
  c->proc = 0;
  
  for(;;){
    // Enable interrupts on this processor.
    sti();
80103bed:	83 c4 10             	add    $0x10,%esp
}

static inline void
sti(void)
{
  asm volatile("sti");
80103bf0:	fb                   	sti    

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
80103bf1:	83 ec 0c             	sub    $0xc,%esp
80103bf4:	68 40 5e 11 80       	push   $0x80115e40
80103bf9:	e8 f2 0c 00 00       	call   801048f0 <acquire>
      c->proc = 0;
    }
    #endif

    #ifdef FCFS
    if (processesQueue[processesQueue_head_index] != 0 && processesQueue[processesQueue_head_index]->state == RUNNABLE) {
80103bfe:	8b 15 b8 b5 10 80    	mov    0x8010b5b8,%edx
80103c04:	83 c4 10             	add    $0x10,%esp
80103c07:	8b 34 95 40 5d 11 80 	mov    -0x7feea2c0(,%edx,4),%esi
80103c0e:	85 f6                	test   %esi,%esi
80103c10:	74 ce                	je     80103be0 <scheduler+0x20>
80103c12:	83 7e 0c 03          	cmpl   $0x3,0xc(%esi)
80103c16:	75 c8                	jne    80103be0 <scheduler+0x20>
      p = processesQueue[processesQueue_head_index];
      if (++processesQueue_head_index >= NPROC)
80103c18:	83 c2 01             	add    $0x1,%edx
80103c1b:	b8 00 00 00 00       	mov    $0x0,%eax
        processesQueue_head_index = 0;
      c->proc = p;
80103c20:	89 b3 ac 00 00 00    	mov    %esi,0xac(%ebx)
    #endif

    #ifdef FCFS
    if (processesQueue[processesQueue_head_index] != 0 && processesQueue[processesQueue_head_index]->state == RUNNABLE) {
      p = processesQueue[processesQueue_head_index];
      if (++processesQueue_head_index >= NPROC)
80103c26:	83 fa 3f             	cmp    $0x3f,%edx
80103c29:	0f 4f d0             	cmovg  %eax,%edx
        processesQueue_head_index = 0;
      c->proc = p;
      switchuvm(p);
80103c2c:	83 ec 0c             	sub    $0xc,%esp
80103c2f:	56                   	push   %esi
    #endif

    #ifdef FCFS
    if (processesQueue[processesQueue_head_index] != 0 && processesQueue[processesQueue_head_index]->state == RUNNABLE) {
      p = processesQueue[processesQueue_head_index];
      if (++processesQueue_head_index >= NPROC)
80103c30:	89 15 b8 b5 10 80    	mov    %edx,0x8010b5b8
        processesQueue_head_index = 0;
      c->proc = p;
      switchuvm(p);
80103c36:	e8 55 33 00 00       	call   80106f90 <switchuvm>
      p->state = RUNNING;
80103c3b:	c7 46 0c 04 00 00 00 	movl   $0x4,0xc(%esi)
      swtch(&(c->scheduler), p->context);
80103c42:	58                   	pop    %eax
80103c43:	5a                   	pop    %edx
80103c44:	ff 76 1c             	pushl  0x1c(%esi)
80103c47:	57                   	push   %edi
80103c48:	e8 4e 10 00 00       	call   80104c9b <swtch>
      switchkvm();
80103c4d:	e8 1e 33 00 00       	call   80106f70 <switchkvm>
      // after return from switchkvm - the proccess stopped running
      // change p->state before coming back.
      c->proc = 0;
80103c52:	c7 83 ac 00 00 00 00 	movl   $0x0,0xac(%ebx)
80103c59:	00 00 00 
80103c5c:	83 c4 10             	add    $0x10,%esp
80103c5f:	e9 7c ff ff ff       	jmp    80103be0 <scheduler+0x20>
80103c64:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103c6a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103c70 <sched>:
// be proc->intena and proc->ncli, but that would
// break in the few places where a lock is held but
// there's no process.
void
sched(void)
{
80103c70:	55                   	push   %ebp
80103c71:	89 e5                	mov    %esp,%ebp
80103c73:	56                   	push   %esi
80103c74:	53                   	push   %ebx
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
80103c75:	e8 36 0c 00 00       	call   801048b0 <pushcli>
  c = mycpu();
80103c7a:	e8 a1 fb ff ff       	call   80103820 <mycpu>
  p = c->proc;
80103c7f:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103c85:	e8 16 0d 00 00       	call   801049a0 <popcli>
sched(void)
{
  int intena;
  struct proc *p = myproc();

  if(!holding(&ptable.lock))
80103c8a:	83 ec 0c             	sub    $0xc,%esp
80103c8d:	68 40 5e 11 80       	push   $0x80115e40
80103c92:	e8 d9 0b 00 00       	call   80104870 <holding>
80103c97:	83 c4 10             	add    $0x10,%esp
80103c9a:	85 c0                	test   %eax,%eax
80103c9c:	74 4f                	je     80103ced <sched+0x7d>
    panic("sched ptable.lock");
  if(mycpu()->ncli != 1)
80103c9e:	e8 7d fb ff ff       	call   80103820 <mycpu>
80103ca3:	83 b8 a4 00 00 00 01 	cmpl   $0x1,0xa4(%eax)
80103caa:	75 68                	jne    80103d14 <sched+0xa4>
    panic("sched locks");
  if(p->state == RUNNING)
80103cac:	83 7b 0c 04          	cmpl   $0x4,0xc(%ebx)
80103cb0:	74 55                	je     80103d07 <sched+0x97>

static inline uint
readeflags(void)
{
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80103cb2:	9c                   	pushf  
80103cb3:	58                   	pop    %eax
    panic("sched running");
  if(readeflags()&FL_IF)
80103cb4:	f6 c4 02             	test   $0x2,%ah
80103cb7:	75 41                	jne    80103cfa <sched+0x8a>
    panic("sched interruptible");
  intena = mycpu()->intena;
80103cb9:	e8 62 fb ff ff       	call   80103820 <mycpu>
  swtch(&p->context, mycpu()->scheduler);
80103cbe:	83 c3 1c             	add    $0x1c,%ebx
    panic("sched locks");
  if(p->state == RUNNING)
    panic("sched running");
  if(readeflags()&FL_IF)
    panic("sched interruptible");
  intena = mycpu()->intena;
80103cc1:	8b b0 a8 00 00 00    	mov    0xa8(%eax),%esi
  swtch(&p->context, mycpu()->scheduler);
80103cc7:	e8 54 fb ff ff       	call   80103820 <mycpu>
80103ccc:	83 ec 08             	sub    $0x8,%esp
80103ccf:	ff 70 04             	pushl  0x4(%eax)
80103cd2:	53                   	push   %ebx
80103cd3:	e8 c3 0f 00 00       	call   80104c9b <swtch>
  mycpu()->intena = intena;
80103cd8:	e8 43 fb ff ff       	call   80103820 <mycpu>
}
80103cdd:	83 c4 10             	add    $0x10,%esp
    panic("sched running");
  if(readeflags()&FL_IF)
    panic("sched interruptible");
  intena = mycpu()->intena;
  swtch(&p->context, mycpu()->scheduler);
  mycpu()->intena = intena;
80103ce0:	89 b0 a8 00 00 00    	mov    %esi,0xa8(%eax)
}
80103ce6:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103ce9:	5b                   	pop    %ebx
80103cea:	5e                   	pop    %esi
80103ceb:	5d                   	pop    %ebp
80103cec:	c3                   	ret    
{
  int intena;
  struct proc *p = myproc();

  if(!holding(&ptable.lock))
    panic("sched ptable.lock");
80103ced:	83 ec 0c             	sub    $0xc,%esp
80103cf0:	68 b0 7b 10 80       	push   $0x80107bb0
80103cf5:	e8 76 c6 ff ff       	call   80100370 <panic>
  if(mycpu()->ncli != 1)
    panic("sched locks");
  if(p->state == RUNNING)
    panic("sched running");
  if(readeflags()&FL_IF)
    panic("sched interruptible");
80103cfa:	83 ec 0c             	sub    $0xc,%esp
80103cfd:	68 dc 7b 10 80       	push   $0x80107bdc
80103d02:	e8 69 c6 ff ff       	call   80100370 <panic>
  if(!holding(&ptable.lock))
    panic("sched ptable.lock");
  if(mycpu()->ncli != 1)
    panic("sched locks");
  if(p->state == RUNNING)
    panic("sched running");
80103d07:	83 ec 0c             	sub    $0xc,%esp
80103d0a:	68 ce 7b 10 80       	push   $0x80107bce
80103d0f:	e8 5c c6 ff ff       	call   80100370 <panic>
  struct proc *p = myproc();

  if(!holding(&ptable.lock))
    panic("sched ptable.lock");
  if(mycpu()->ncli != 1)
    panic("sched locks");
80103d14:	83 ec 0c             	sub    $0xc,%esp
80103d17:	68 c2 7b 10 80       	push   $0x80107bc2
80103d1c:	e8 4f c6 ff ff       	call   80100370 <panic>
80103d21:	eb 0d                	jmp    80103d30 <exit>
80103d23:	90                   	nop
80103d24:	90                   	nop
80103d25:	90                   	nop
80103d26:	90                   	nop
80103d27:	90                   	nop
80103d28:	90                   	nop
80103d29:	90                   	nop
80103d2a:	90                   	nop
80103d2b:	90                   	nop
80103d2c:	90                   	nop
80103d2d:	90                   	nop
80103d2e:	90                   	nop
80103d2f:	90                   	nop

80103d30 <exit>:
// Exit the current process.  Does not return.
// An exited process remains in the zombie state
// until its parent calls wait() to find out it exited.
void
exit(void)
{
80103d30:	55                   	push   %ebp
80103d31:	89 e5                	mov    %esp,%ebp
80103d33:	57                   	push   %edi
80103d34:	56                   	push   %esi
80103d35:	53                   	push   %ebx
80103d36:	83 ec 0c             	sub    $0xc,%esp
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
80103d39:	e8 72 0b 00 00       	call   801048b0 <pushcli>
  c = mycpu();
80103d3e:	e8 dd fa ff ff       	call   80103820 <mycpu>
  p = c->proc;
80103d43:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
  popcli();
80103d49:	e8 52 0c 00 00       	call   801049a0 <popcli>
  struct proc *curproc = myproc();
  struct proc *p;
  int fd;


  if(curproc == initproc)
80103d4e:	39 35 c4 b5 10 80    	cmp    %esi,0x8010b5c4
80103d54:	8d 5e 28             	lea    0x28(%esi),%ebx
80103d57:	8d 7e 68             	lea    0x68(%esi),%edi
80103d5a:	0f 84 bc 00 00 00    	je     80103e1c <exit+0xec>
    panic("init exiting");

  // Close all open files.
  for(fd = 0; fd < NOFILE; fd++){
    if(curproc->ofile[fd]){
80103d60:	8b 03                	mov    (%ebx),%eax
80103d62:	85 c0                	test   %eax,%eax
80103d64:	74 12                	je     80103d78 <exit+0x48>
      fileclose(curproc->ofile[fd]);
80103d66:	83 ec 0c             	sub    $0xc,%esp
80103d69:	50                   	push   %eax
80103d6a:	e8 b1 d0 ff ff       	call   80100e20 <fileclose>
      curproc->ofile[fd] = 0;
80103d6f:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80103d75:	83 c4 10             	add    $0x10,%esp
80103d78:	83 c3 04             	add    $0x4,%ebx

  if(curproc == initproc)
    panic("init exiting");

  // Close all open files.
  for(fd = 0; fd < NOFILE; fd++){
80103d7b:	39 fb                	cmp    %edi,%ebx
80103d7d:	75 e1                	jne    80103d60 <exit+0x30>
      fileclose(curproc->ofile[fd]);
      curproc->ofile[fd] = 0;
    }
  }

  begin_op();
80103d7f:	e8 ec ed ff ff       	call   80102b70 <begin_op>
  iput(curproc->cwd);
80103d84:	83 ec 0c             	sub    $0xc,%esp
80103d87:	ff 76 68             	pushl  0x68(%esi)

  // Parent might be sleeping in wait().
  wakeup1(curproc->parent);

  // Pass abandoned children to init.
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103d8a:	bb 74 5e 11 80       	mov    $0x80115e74,%ebx
      curproc->ofile[fd] = 0;
    }
  }

  begin_op();
  iput(curproc->cwd);
80103d8f:	e8 0c da ff ff       	call   801017a0 <iput>
  end_op();
80103d94:	e8 47 ee ff ff       	call   80102be0 <end_op>
  curproc->cwd = 0;
80103d99:	c7 46 68 00 00 00 00 	movl   $0x0,0x68(%esi)

  acquire(&ptable.lock);
80103da0:	c7 04 24 40 5e 11 80 	movl   $0x80115e40,(%esp)
80103da7:	e8 44 0b 00 00       	call   801048f0 <acquire>

  // Parent might be sleeping in wait().
  wakeup1(curproc->parent);
80103dac:	8b 46 14             	mov    0x14(%esi),%eax
80103daf:	e8 fc f7 ff ff       	call   801035b0 <wakeup1>
80103db4:	83 c4 10             	add    $0x10,%esp
80103db7:	eb 15                	jmp    80103dce <exit+0x9e>
80103db9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

  // Pass abandoned children to init.
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103dc0:	81 c3 94 00 00 00    	add    $0x94,%ebx
80103dc6:	81 fb 74 83 11 80    	cmp    $0x80118374,%ebx
80103dcc:	73 2a                	jae    80103df8 <exit+0xc8>
    if(p->parent == curproc){
80103dce:	39 73 14             	cmp    %esi,0x14(%ebx)
80103dd1:	75 ed                	jne    80103dc0 <exit+0x90>
      p->parent = initproc;
      if(p->state == ZOMBIE)
80103dd3:	83 7b 0c 05          	cmpl   $0x5,0xc(%ebx)
  wakeup1(curproc->parent);

  // Pass abandoned children to init.
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->parent == curproc){
      p->parent = initproc;
80103dd7:	a1 c4 b5 10 80       	mov    0x8010b5c4,%eax
80103ddc:	89 43 14             	mov    %eax,0x14(%ebx)
      if(p->state == ZOMBIE)
80103ddf:	75 df                	jne    80103dc0 <exit+0x90>

  // Parent might be sleeping in wait().
  wakeup1(curproc->parent);

  // Pass abandoned children to init.
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103de1:	81 c3 94 00 00 00    	add    $0x94,%ebx
    if(p->parent == curproc){
      p->parent = initproc;
      if(p->state == ZOMBIE)
        wakeup1(initproc);
80103de7:	e8 c4 f7 ff ff       	call   801035b0 <wakeup1>

  // Parent might be sleeping in wait().
  wakeup1(curproc->parent);

  // Pass abandoned children to init.
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103dec:	81 fb 74 83 11 80    	cmp    $0x80118374,%ebx
80103df2:	72 da                	jb     80103dce <exit+0x9e>
80103df4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        wakeup1(initproc);
    }
  }

  // set end time of process
  curproc->etime = ticks;
80103df8:	a1 c0 8b 11 80       	mov    0x80118bc0,%eax
  // Jump into the scheduler, never to return.
  curproc->state = ZOMBIE;
80103dfd:	c7 46 0c 05 00 00 00 	movl   $0x5,0xc(%esi)
        wakeup1(initproc);
    }
  }

  // set end time of process
  curproc->etime = ticks;
80103e04:	89 86 80 00 00 00    	mov    %eax,0x80(%esi)
  // Jump into the scheduler, never to return.
  curproc->state = ZOMBIE;
  sched();
80103e0a:	e8 61 fe ff ff       	call   80103c70 <sched>
  panic("zombie exit");
80103e0f:	83 ec 0c             	sub    $0xc,%esp
80103e12:	68 fd 7b 10 80       	push   $0x80107bfd
80103e17:	e8 54 c5 ff ff       	call   80100370 <panic>
  struct proc *p;
  int fd;


  if(curproc == initproc)
    panic("init exiting");
80103e1c:	83 ec 0c             	sub    $0xc,%esp
80103e1f:	68 f0 7b 10 80       	push   $0x80107bf0
80103e24:	e8 47 c5 ff ff       	call   80100370 <panic>
80103e29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103e30 <yield>:
}

// Give up the CPU for one scheduling round.
void
yield(void)
{
80103e30:	55                   	push   %ebp
80103e31:	89 e5                	mov    %esp,%ebp
80103e33:	56                   	push   %esi
80103e34:	53                   	push   %ebx
  acquire(&ptable.lock);  //DOC: yieldlock
80103e35:	83 ec 0c             	sub    $0xc,%esp
80103e38:	68 40 5e 11 80       	push   $0x80115e40
80103e3d:	e8 ae 0a 00 00       	call   801048f0 <acquire>
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
80103e42:	e8 69 0a 00 00       	call   801048b0 <pushcli>
  c = mycpu();
80103e47:	e8 d4 f9 ff ff       	call   80103820 <mycpu>
  p = c->proc;
80103e4c:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103e52:	e8 49 0b 00 00       	call   801049a0 <popcli>
// Give up the CPU for one scheduling round.
void
yield(void)
{
  acquire(&ptable.lock);  //DOC: yieldlock
  myproc()->state = RUNNABLE;
80103e57:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)
  #ifdef FCFS
  processesQueue[next_empty_processesQueue_index] = myproc();
80103e5e:	8b 1d bc b5 10 80    	mov    0x8010b5bc,%ebx
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
80103e64:	e8 47 0a 00 00       	call   801048b0 <pushcli>
  c = mycpu();
80103e69:	e8 b2 f9 ff ff       	call   80103820 <mycpu>
  p = c->proc;
80103e6e:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
  popcli();
80103e74:	e8 27 0b 00 00       	call   801049a0 <popcli>
{
  acquire(&ptable.lock);  //DOC: yieldlock
  myproc()->state = RUNNABLE;
  #ifdef FCFS
  processesQueue[next_empty_processesQueue_index] = myproc();
  if (++next_empty_processesQueue_index >= NPROC)
80103e79:	a1 bc b5 10 80       	mov    0x8010b5bc,%eax
80103e7e:	83 c4 10             	add    $0x10,%esp
80103e81:	ba 00 00 00 00       	mov    $0x0,%edx
yield(void)
{
  acquire(&ptable.lock);  //DOC: yieldlock
  myproc()->state = RUNNABLE;
  #ifdef FCFS
  processesQueue[next_empty_processesQueue_index] = myproc();
80103e86:	89 34 9d 40 5d 11 80 	mov    %esi,-0x7feea2c0(,%ebx,4)
  if (++next_empty_processesQueue_index >= NPROC)
80103e8d:	83 c0 01             	add    $0x1,%eax
80103e90:	83 f8 3f             	cmp    $0x3f,%eax
80103e93:	0f 4f c2             	cmovg  %edx,%eax
80103e96:	a3 bc b5 10 80       	mov    %eax,0x8010b5bc
    next_empty_processesQueue_index = 0;
  #endif
  sched();
80103e9b:	e8 d0 fd ff ff       	call   80103c70 <sched>
  release(&ptable.lock);
80103ea0:	83 ec 0c             	sub    $0xc,%esp
80103ea3:	68 40 5e 11 80       	push   $0x80115e40
80103ea8:	e8 63 0b 00 00       	call   80104a10 <release>
}
80103ead:	83 c4 10             	add    $0x10,%esp
80103eb0:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103eb3:	5b                   	pop    %ebx
80103eb4:	5e                   	pop    %esi
80103eb5:	5d                   	pop    %ebp
80103eb6:	c3                   	ret    
80103eb7:	89 f6                	mov    %esi,%esi
80103eb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103ec0 <sleep>:

// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
80103ec0:	55                   	push   %ebp
80103ec1:	89 e5                	mov    %esp,%ebp
80103ec3:	57                   	push   %edi
80103ec4:	56                   	push   %esi
80103ec5:	53                   	push   %ebx
80103ec6:	83 ec 0c             	sub    $0xc,%esp
80103ec9:	8b 7d 08             	mov    0x8(%ebp),%edi
80103ecc:	8b 75 0c             	mov    0xc(%ebp),%esi
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
80103ecf:	e8 dc 09 00 00       	call   801048b0 <pushcli>
  c = mycpu();
80103ed4:	e8 47 f9 ff ff       	call   80103820 <mycpu>
  p = c->proc;
80103ed9:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103edf:	e8 bc 0a 00 00       	call   801049a0 <popcli>
void
sleep(void *chan, struct spinlock *lk)
{
  struct proc *p = myproc();
  
  if(p == 0)
80103ee4:	85 db                	test   %ebx,%ebx
80103ee6:	0f 84 87 00 00 00    	je     80103f73 <sleep+0xb3>
    panic("sleep");

  if(lk == 0)
80103eec:	85 f6                	test   %esi,%esi
80103eee:	74 76                	je     80103f66 <sleep+0xa6>
  // change p->state and then call sched.
  // Once we hold ptable.lock, we can be
  // guaranteed that we won't miss any wakeup
  // (wakeup runs with ptable.lock locked),
  // so it's okay to release lk.
  if(lk != &ptable.lock){  //DOC: sleeplock0
80103ef0:	81 fe 40 5e 11 80    	cmp    $0x80115e40,%esi
80103ef6:	74 50                	je     80103f48 <sleep+0x88>
    acquire(&ptable.lock);  //DOC: sleeplock1
80103ef8:	83 ec 0c             	sub    $0xc,%esp
80103efb:	68 40 5e 11 80       	push   $0x80115e40
80103f00:	e8 eb 09 00 00       	call   801048f0 <acquire>
    release(lk);
80103f05:	89 34 24             	mov    %esi,(%esp)
80103f08:	e8 03 0b 00 00       	call   80104a10 <release>
  }
  // Go to sleep.
  p->chan = chan;
80103f0d:	89 7b 20             	mov    %edi,0x20(%ebx)
  p->state = SLEEPING;
80103f10:	c7 43 0c 02 00 00 00 	movl   $0x2,0xc(%ebx)

  sched();
80103f17:	e8 54 fd ff ff       	call   80103c70 <sched>

  // Tidy up.
  p->chan = 0;
80103f1c:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)

  // Reacquire original lock.
  if(lk != &ptable.lock){  //DOC: sleeplock2
    release(&ptable.lock);
80103f23:	c7 04 24 40 5e 11 80 	movl   $0x80115e40,(%esp)
80103f2a:	e8 e1 0a 00 00       	call   80104a10 <release>
    acquire(lk);
80103f2f:	89 75 08             	mov    %esi,0x8(%ebp)
80103f32:	83 c4 10             	add    $0x10,%esp
  }
}
80103f35:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103f38:	5b                   	pop    %ebx
80103f39:	5e                   	pop    %esi
80103f3a:	5f                   	pop    %edi
80103f3b:	5d                   	pop    %ebp
  p->chan = 0;

  // Reacquire original lock.
  if(lk != &ptable.lock){  //DOC: sleeplock2
    release(&ptable.lock);
    acquire(lk);
80103f3c:	e9 af 09 00 00       	jmp    801048f0 <acquire>
80103f41:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  if(lk != &ptable.lock){  //DOC: sleeplock0
    acquire(&ptable.lock);  //DOC: sleeplock1
    release(lk);
  }
  // Go to sleep.
  p->chan = chan;
80103f48:	89 7b 20             	mov    %edi,0x20(%ebx)
  p->state = SLEEPING;
80103f4b:	c7 43 0c 02 00 00 00 	movl   $0x2,0xc(%ebx)

  sched();
80103f52:	e8 19 fd ff ff       	call   80103c70 <sched>

  // Tidy up.
  p->chan = 0;
80103f57:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)
  // Reacquire original lock.
  if(lk != &ptable.lock){  //DOC: sleeplock2
    release(&ptable.lock);
    acquire(lk);
  }
}
80103f5e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103f61:	5b                   	pop    %ebx
80103f62:	5e                   	pop    %esi
80103f63:	5f                   	pop    %edi
80103f64:	5d                   	pop    %ebp
80103f65:	c3                   	ret    
  
  if(p == 0)
    panic("sleep");

  if(lk == 0)
    panic("sleep without lk");
80103f66:	83 ec 0c             	sub    $0xc,%esp
80103f69:	68 0f 7c 10 80       	push   $0x80107c0f
80103f6e:	e8 fd c3 ff ff       	call   80100370 <panic>
sleep(void *chan, struct spinlock *lk)
{
  struct proc *p = myproc();
  
  if(p == 0)
    panic("sleep");
80103f73:	83 ec 0c             	sub    $0xc,%esp
80103f76:	68 09 7c 10 80       	push   $0x80107c09
80103f7b:	e8 f0 c3 ff ff       	call   80100370 <panic>

80103f80 <wait>:

// Wait for a child process to exit and return its pid.
// Return -1 if this process has no children.
int
wait(void)
{
80103f80:	55                   	push   %ebp
80103f81:	89 e5                	mov    %esp,%ebp
80103f83:	56                   	push   %esi
80103f84:	53                   	push   %ebx
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
80103f85:	e8 26 09 00 00       	call   801048b0 <pushcli>
  c = mycpu();
80103f8a:	e8 91 f8 ff ff       	call   80103820 <mycpu>
  p = c->proc;
80103f8f:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
  popcli();
80103f95:	e8 06 0a 00 00       	call   801049a0 <popcli>
{
  struct proc *p;
  int havekids, pid;
  struct proc *curproc = myproc();
  
  acquire(&ptable.lock);
80103f9a:	83 ec 0c             	sub    $0xc,%esp
80103f9d:	68 40 5e 11 80       	push   $0x80115e40
80103fa2:	e8 49 09 00 00       	call   801048f0 <acquire>
80103fa7:	83 c4 10             	add    $0x10,%esp
  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
80103faa:	31 c0                	xor    %eax,%eax
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103fac:	bb 74 5e 11 80       	mov    $0x80115e74,%ebx
80103fb1:	eb 13                	jmp    80103fc6 <wait+0x46>
80103fb3:	90                   	nop
80103fb4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103fb8:	81 c3 94 00 00 00    	add    $0x94,%ebx
80103fbe:	81 fb 74 83 11 80    	cmp    $0x80118374,%ebx
80103fc4:	73 22                	jae    80103fe8 <wait+0x68>
      if(p->parent != curproc)
80103fc6:	39 73 14             	cmp    %esi,0x14(%ebx)
80103fc9:	75 ed                	jne    80103fb8 <wait+0x38>
        continue;
      havekids = 1;
      if(p->state == ZOMBIE){
80103fcb:	83 7b 0c 05          	cmpl   $0x5,0xc(%ebx)
80103fcf:	74 35                	je     80104006 <wait+0x86>
  
  acquire(&ptable.lock);
  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103fd1:	81 c3 94 00 00 00    	add    $0x94,%ebx
      if(p->parent != curproc)
        continue;
      havekids = 1;
80103fd7:	b8 01 00 00 00       	mov    $0x1,%eax
  
  acquire(&ptable.lock);
  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103fdc:	81 fb 74 83 11 80    	cmp    $0x80118374,%ebx
80103fe2:	72 e2                	jb     80103fc6 <wait+0x46>
80103fe4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        return pid;
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || curproc->killed){
80103fe8:	85 c0                	test   %eax,%eax
80103fea:	74 70                	je     8010405c <wait+0xdc>
80103fec:	8b 46 24             	mov    0x24(%esi),%eax
80103fef:	85 c0                	test   %eax,%eax
80103ff1:	75 69                	jne    8010405c <wait+0xdc>
      release(&ptable.lock);
      return -1;
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
80103ff3:	83 ec 08             	sub    $0x8,%esp
80103ff6:	68 40 5e 11 80       	push   $0x80115e40
80103ffb:	56                   	push   %esi
80103ffc:	e8 bf fe ff ff       	call   80103ec0 <sleep>
  struct proc *curproc = myproc();
  
  acquire(&ptable.lock);
  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
80104001:	83 c4 10             	add    $0x10,%esp
80104004:	eb a4                	jmp    80103faa <wait+0x2a>
        continue;
      havekids = 1;
      if(p->state == ZOMBIE){
        // Found one.
        pid = p->pid;
        kfree(p->kstack);
80104006:	83 ec 0c             	sub    $0xc,%esp
80104009:	ff 73 08             	pushl  0x8(%ebx)
      if(p->parent != curproc)
        continue;
      havekids = 1;
      if(p->state == ZOMBIE){
        // Found one.
        pid = p->pid;
8010400c:	8b 73 10             	mov    0x10(%ebx),%esi
        kfree(p->kstack);
8010400f:	e8 cc e2 ff ff       	call   801022e0 <kfree>
        p->kstack = 0;
        freevm(p->pgdir);
80104014:	5a                   	pop    %edx
80104015:	ff 73 04             	pushl  0x4(%ebx)
      havekids = 1;
      if(p->state == ZOMBIE){
        // Found one.
        pid = p->pid;
        kfree(p->kstack);
        p->kstack = 0;
80104018:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
        freevm(p->pgdir);
8010401f:	e8 dc 32 00 00       	call   80107300 <freevm>
        p->pid = 0;
80104024:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
        p->parent = 0;
8010402b:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
        p->name[0] = 0;
80104032:	c6 43 6c 00          	movb   $0x0,0x6c(%ebx)
        p->killed = 0;
80104036:	c7 43 24 00 00 00 00 	movl   $0x0,0x24(%ebx)
        p->state = UNUSED;
8010403d:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
        release(&ptable.lock);
80104044:	c7 04 24 40 5e 11 80 	movl   $0x80115e40,(%esp)
8010404b:	e8 c0 09 00 00       	call   80104a10 <release>
        return pid;
80104050:	83 c4 10             	add    $0x10,%esp
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
  }
}
80104053:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104056:	89 f0                	mov    %esi,%eax
80104058:	5b                   	pop    %ebx
80104059:	5e                   	pop    %esi
8010405a:	5d                   	pop    %ebp
8010405b:	c3                   	ret    
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || curproc->killed){
      release(&ptable.lock);
8010405c:	83 ec 0c             	sub    $0xc,%esp
      return -1;
8010405f:	be ff ff ff ff       	mov    $0xffffffff,%esi
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || curproc->killed){
      release(&ptable.lock);
80104064:	68 40 5e 11 80       	push   $0x80115e40
80104069:	e8 a2 09 00 00       	call   80104a10 <release>
      return -1;
8010406e:	83 c4 10             	add    $0x10,%esp
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
  }
}
80104071:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104074:	89 f0                	mov    %esi,%eax
80104076:	5b                   	pop    %ebx
80104077:	5e                   	pop    %esi
80104078:	5d                   	pop    %ebp
80104079:	c3                   	ret    
8010407a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104080 <wakeup>:
}

// Wake up all processes sleeping on chan.
void
wakeup(void *chan)
{
80104080:	55                   	push   %ebp
80104081:	89 e5                	mov    %esp,%ebp
80104083:	53                   	push   %ebx
80104084:	83 ec 10             	sub    $0x10,%esp
80104087:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&ptable.lock);
8010408a:	68 40 5e 11 80       	push   $0x80115e40
8010408f:	e8 5c 08 00 00       	call   801048f0 <acquire>
  wakeup1(chan);
80104094:	89 d8                	mov    %ebx,%eax
80104096:	e8 15 f5 ff ff       	call   801035b0 <wakeup1>
  release(&ptable.lock);
8010409b:	83 c4 10             	add    $0x10,%esp
8010409e:	c7 45 08 40 5e 11 80 	movl   $0x80115e40,0x8(%ebp)
}
801040a5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801040a8:	c9                   	leave  
void
wakeup(void *chan)
{
  acquire(&ptable.lock);
  wakeup1(chan);
  release(&ptable.lock);
801040a9:	e9 62 09 00 00       	jmp    80104a10 <release>
801040ae:	66 90                	xchg   %ax,%ax

801040b0 <kill>:
// Kill the process with the given pid.
// Process won't exit until it returns
// to user space (see trap in trap.c).
int
kill(int pid)
{
801040b0:	55                   	push   %ebp
801040b1:	89 e5                	mov    %esp,%ebp
801040b3:	53                   	push   %ebx
801040b4:	83 ec 10             	sub    $0x10,%esp
801040b7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct proc *p;

  acquire(&ptable.lock);
801040ba:	68 40 5e 11 80       	push   $0x80115e40
801040bf:	e8 2c 08 00 00       	call   801048f0 <acquire>
801040c4:	83 c4 10             	add    $0x10,%esp
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
801040c7:	b8 74 5e 11 80       	mov    $0x80115e74,%eax
801040cc:	eb 0e                	jmp    801040dc <kill+0x2c>
801040ce:	66 90                	xchg   %ax,%ax
801040d0:	05 94 00 00 00       	add    $0x94,%eax
801040d5:	3d 74 83 11 80       	cmp    $0x80118374,%eax
801040da:	73 5c                	jae    80104138 <kill+0x88>
    if(p->pid == pid){
801040dc:	39 58 10             	cmp    %ebx,0x10(%eax)
801040df:	75 ef                	jne    801040d0 <kill+0x20>
      p->killed = 1;
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING) {
801040e1:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
  struct proc *p;

  acquire(&ptable.lock);
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->pid == pid){
      p->killed = 1;
801040e5:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING) {
801040ec:	74 1a                	je     80104108 <kill+0x58>
        processesQueue[next_empty_processesQueue_index] = p;
        if (++next_empty_processesQueue_index >= NPROC)
          next_empty_processesQueue_index = 0;
        #endif
      }
      release(&ptable.lock);
801040ee:	83 ec 0c             	sub    $0xc,%esp
801040f1:	68 40 5e 11 80       	push   $0x80115e40
801040f6:	e8 15 09 00 00       	call   80104a10 <release>
      return 0;
801040fb:	83 c4 10             	add    $0x10,%esp
801040fe:	31 c0                	xor    %eax,%eax
    }
  }
  release(&ptable.lock);
  return -1;
}
80104100:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104103:	c9                   	leave  
80104104:	c3                   	ret    
80104105:	8d 76 00             	lea    0x0(%esi),%esi
      p->killed = 1;
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING) {
        p->state = RUNNABLE;
        #ifdef FCFS
        processesQueue[next_empty_processesQueue_index] = p;
80104108:	8b 15 bc b5 10 80    	mov    0x8010b5bc,%edx
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->pid == pid){
      p->killed = 1;
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING) {
        p->state = RUNNABLE;
8010410e:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
        #ifdef FCFS
        processesQueue[next_empty_processesQueue_index] = p;
80104115:	89 04 95 40 5d 11 80 	mov    %eax,-0x7feea2c0(,%edx,4)
        if (++next_empty_processesQueue_index >= NPROC)
8010411c:	8d 42 01             	lea    0x1(%edx),%eax
8010411f:	ba 00 00 00 00       	mov    $0x0,%edx
80104124:	83 f8 3f             	cmp    $0x3f,%eax
80104127:	0f 4f c2             	cmovg  %edx,%eax
8010412a:	a3 bc b5 10 80       	mov    %eax,0x8010b5bc
8010412f:	eb bd                	jmp    801040ee <kill+0x3e>
80104131:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      }
      release(&ptable.lock);
      return 0;
    }
  }
  release(&ptable.lock);
80104138:	83 ec 0c             	sub    $0xc,%esp
8010413b:	68 40 5e 11 80       	push   $0x80115e40
80104140:	e8 cb 08 00 00       	call   80104a10 <release>
  return -1;
80104145:	83 c4 10             	add    $0x10,%esp
80104148:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010414d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104150:	c9                   	leave  
80104151:	c3                   	ret    
80104152:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104159:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104160 <procdump>:
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
80104160:	55                   	push   %ebp
80104161:	89 e5                	mov    %esp,%ebp
80104163:	57                   	push   %edi
80104164:	56                   	push   %esi
80104165:	53                   	push   %ebx
80104166:	8d 75 e8             	lea    -0x18(%ebp),%esi
  int i;
  struct proc *p;
  char *state;
  uint pc[10];

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104169:	bb 74 5e 11 80       	mov    $0x80115e74,%ebx
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
8010416e:	83 ec 3c             	sub    $0x3c,%esp
80104171:	eb 27                	jmp    8010419a <procdump+0x3a>
80104173:	90                   	nop
80104174:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p->state == SLEEPING){
      getcallerpcs((uint*)p->context->ebp+2, pc);
      for(i=0; i<10 && pc[i] != 0; i++)
        cprintf(" %p", pc[i]);
    }
    cprintf("\n");
80104178:	83 ec 0c             	sub    $0xc,%esp
8010417b:	68 ab 7f 10 80       	push   $0x80107fab
80104180:	e8 db c4 ff ff       	call   80100660 <cprintf>
80104185:	83 c4 10             	add    $0x10,%esp
  int i;
  struct proc *p;
  char *state;
  uint pc[10];

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104188:	81 c3 94 00 00 00    	add    $0x94,%ebx
8010418e:	81 fb 74 83 11 80    	cmp    $0x80118374,%ebx
80104194:	0f 83 86 00 00 00    	jae    80104220 <procdump+0xc0>
    if(p->state == UNUSED)
8010419a:	8b 43 0c             	mov    0xc(%ebx),%eax
8010419d:	85 c0                	test   %eax,%eax
8010419f:	74 e7                	je     80104188 <procdump+0x28>
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
801041a1:	83 f8 05             	cmp    $0x5,%eax
      state = states[p->state];
    else
      state = "???";
801041a4:	ba 20 7c 10 80       	mov    $0x80107c20,%edx
  uint pc[10];

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->state == UNUSED)
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
801041a9:	77 11                	ja     801041bc <procdump+0x5c>
801041ab:	8b 14 85 80 7c 10 80 	mov    -0x7fef8380(,%eax,4),%edx
      state = states[p->state];
    else
      state = "???";
801041b2:	b8 20 7c 10 80       	mov    $0x80107c20,%eax
801041b7:	85 d2                	test   %edx,%edx
801041b9:	0f 44 d0             	cmove  %eax,%edx
    cprintf("%d %s %s", p->pid, state, p->name);
801041bc:	8d 43 6c             	lea    0x6c(%ebx),%eax
801041bf:	50                   	push   %eax
801041c0:	52                   	push   %edx
801041c1:	ff 73 10             	pushl  0x10(%ebx)
801041c4:	68 24 7c 10 80       	push   $0x80107c24
801041c9:	e8 92 c4 ff ff       	call   80100660 <cprintf>
    if(p->state == SLEEPING){
801041ce:	83 c4 10             	add    $0x10,%esp
801041d1:	83 7b 0c 02          	cmpl   $0x2,0xc(%ebx)
801041d5:	75 a1                	jne    80104178 <procdump+0x18>
      getcallerpcs((uint*)p->context->ebp+2, pc);
801041d7:	8d 45 c0             	lea    -0x40(%ebp),%eax
801041da:	83 ec 08             	sub    $0x8,%esp
801041dd:	8d 7d c0             	lea    -0x40(%ebp),%edi
801041e0:	50                   	push   %eax
801041e1:	8b 43 1c             	mov    0x1c(%ebx),%eax
801041e4:	8b 40 0c             	mov    0xc(%eax),%eax
801041e7:	83 c0 08             	add    $0x8,%eax
801041ea:	50                   	push   %eax
801041eb:	e8 20 06 00 00       	call   80104810 <getcallerpcs>
801041f0:	83 c4 10             	add    $0x10,%esp
801041f3:	90                   	nop
801041f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      for(i=0; i<10 && pc[i] != 0; i++)
801041f8:	8b 17                	mov    (%edi),%edx
801041fa:	85 d2                	test   %edx,%edx
801041fc:	0f 84 76 ff ff ff    	je     80104178 <procdump+0x18>
        cprintf(" %p", pc[i]);
80104202:	83 ec 08             	sub    $0x8,%esp
80104205:	83 c7 04             	add    $0x4,%edi
80104208:	52                   	push   %edx
80104209:	68 61 76 10 80       	push   $0x80107661
8010420e:	e8 4d c4 ff ff       	call   80100660 <cprintf>
    else
      state = "???";
    cprintf("%d %s %s", p->pid, state, p->name);
    if(p->state == SLEEPING){
      getcallerpcs((uint*)p->context->ebp+2, pc);
      for(i=0; i<10 && pc[i] != 0; i++)
80104213:	83 c4 10             	add    $0x10,%esp
80104216:	39 fe                	cmp    %edi,%esi
80104218:	75 de                	jne    801041f8 <procdump+0x98>
8010421a:	e9 59 ff ff ff       	jmp    80104178 <procdump+0x18>
8010421f:	90                   	nop
        cprintf(" %p", pc[i]);
    }
    cprintf("\n");
  }
}
80104220:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104223:	5b                   	pop    %ebx
80104224:	5e                   	pop    %esi
80104225:	5f                   	pop    %edi
80104226:	5d                   	pop    %ebp
80104227:	c3                   	ret    
80104228:	90                   	nop
80104229:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80104230 <checkVarName>:

int checkVarName(const char* var) {
80104230:	55                   	push   %ebp
80104231:	89 e5                	mov    %esp,%ebp
80104233:	8b 55 08             	mov    0x8(%ebp),%edx
  for(; *var; var++)
80104236:	0f b6 02             	movzbl (%edx),%eax
80104239:	84 c0                	test   %al,%al
8010423b:	74 1c                	je     80104259 <checkVarName+0x29>
8010423d:	8d 76 00             	lea    0x0(%esi),%esi
    if(*var < 'A' || *var > 'z' ||
80104240:	8d 48 bf             	lea    -0x41(%eax),%ecx
80104243:	80 f9 39             	cmp    $0x39,%cl
80104246:	77 18                	ja     80104260 <checkVarName+0x30>
80104248:	83 e8 5b             	sub    $0x5b,%eax
8010424b:	3c 05                	cmp    $0x5,%al
8010424d:	76 11                	jbe    80104260 <checkVarName+0x30>
    cprintf("\n");
  }
}

int checkVarName(const char* var) {
  for(; *var; var++)
8010424f:	83 c2 01             	add    $0x1,%edx
80104252:	0f b6 02             	movzbl (%edx),%eax
80104255:	84 c0                	test   %al,%al
80104257:	75 e7                	jne    80104240 <checkVarName+0x10>
    if(*var < 'A' || *var > 'z' ||
       (*var > 'Z' && *var < 'a'))
      return -1;
  return 0;
80104259:	31 c0                	xor    %eax,%eax
}
8010425b:	5d                   	pop    %ebp
8010425c:	c3                   	ret    
8010425d:	8d 76 00             	lea    0x0(%esi),%esi

int checkVarName(const char* var) {
  for(; *var; var++)
    if(*var < 'A' || *var > 'z' ||
       (*var > 'Z' && *var < 'a'))
      return -1;
80104260:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return 0;
}
80104265:	5d                   	pop    %ebp
80104266:	c3                   	ret    
80104267:	89 f6                	mov    %esi,%esi
80104269:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104270 <searchvar>:

int searchvar(char* var) {
80104270:	55                   	push   %ebp
80104271:	89 e5                	mov    %esp,%ebp
80104273:	57                   	push   %edi
80104274:	56                   	push   %esi
80104275:	53                   	push   %ebx
80104276:	83 ec 04             	sub    $0x4,%esp
  for (int i=0; i<next_empty_vartable_index; i++) {
80104279:	a1 c0 b5 10 80       	mov    0x8010b5c0,%eax
8010427e:	85 c0                	test   %eax,%eax
80104280:	89 45 f0             	mov    %eax,-0x10(%ebp)
80104283:	7e 4f                	jle    801042d4 <searchvar+0x64>
80104285:	8b 45 08             	mov    0x8(%ebp),%eax
80104288:	be 40 3d 11 80       	mov    $0x80113d40,%esi
8010428d:	0f b6 38             	movzbl (%eax),%edi
80104290:	31 c0                	xor    %eax,%eax
80104292:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
80104298:	89 f9                	mov    %edi,%ecx
8010429a:	84 c9                	test   %cl,%cl
8010429c:	74 43                	je     801042e1 <searchvar+0x71>
8010429e:	38 0e                	cmp    %cl,(%esi)
801042a0:	75 24                	jne    801042c6 <searchvar+0x56>
801042a2:	89 f2                	mov    %esi,%edx
801042a4:	8b 4d 08             	mov    0x8(%ebp),%ecx
801042a7:	eb 0b                	jmp    801042b4 <searchvar+0x44>
801042a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801042b0:	3a 1a                	cmp    (%edx),%bl
801042b2:	75 12                	jne    801042c6 <searchvar+0x56>
    p++, q++;
801042b4:	83 c1 01             	add    $0x1,%ecx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
801042b7:	0f b6 19             	movzbl (%ecx),%ebx
    p++, q++;
801042ba:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
801042bd:	84 db                	test   %bl,%bl
801042bf:	75 ef                	jne    801042b0 <searchvar+0x40>
  return 0;
}

int searchvar(char* var) {
  for (int i=0; i<next_empty_vartable_index; i++) {
    if (strcmp(var, variable_table[i][0]) == 0)
801042c1:	80 3a 00             	cmpb   $0x0,(%edx)
801042c4:	74 13                	je     801042d9 <searchvar+0x69>
      return -1;
  return 0;
}

int searchvar(char* var) {
  for (int i=0; i<next_empty_vartable_index; i++) {
801042c6:	83 c0 01             	add    $0x1,%eax
801042c9:	81 c6 00 01 00 00    	add    $0x100,%esi
801042cf:	3b 45 f0             	cmp    -0x10(%ebp),%eax
801042d2:	75 c4                	jne    80104298 <searchvar+0x28>
    if (strcmp(var, variable_table[i][0]) == 0)
      return i;
  }
  return -1;
801042d4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801042d9:	83 c4 04             	add    $0x4,%esp
801042dc:	5b                   	pop    %ebx
801042dd:	5e                   	pop    %esi
801042de:	5f                   	pop    %edi
801042df:	5d                   	pop    %ebp
801042e0:	c3                   	ret    
  return 0;
}

int searchvar(char* var) {
  for (int i=0; i<next_empty_vartable_index; i++) {
    if (strcmp(var, variable_table[i][0]) == 0)
801042e1:	89 f2                	mov    %esi,%edx
801042e3:	eb dc                	jmp    801042c1 <searchvar+0x51>
801042e5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801042e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801042f0 <setVariable>:
      return i;
  }
  return -1;
}

int setVariable(char* var, char* val) {
801042f0:	55                   	push   %ebp
801042f1:	89 e5                	mov    %esp,%ebp
801042f3:	57                   	push   %edi
801042f4:	56                   	push   %esi
801042f5:	53                   	push   %ebx
801042f6:	83 ec 10             	sub    $0x10,%esp
  int result = 0;
  if (next_empty_vartable_index >= MAX_VARIABLES)
801042f9:	a1 c0 b5 10 80       	mov    0x8010b5c0,%eax
      return i;
  }
  return -1;
}

int setVariable(char* var, char* val) {
801042fe:	8b 75 08             	mov    0x8(%ebp),%esi
  int result = 0;
  if (next_empty_vartable_index >= MAX_VARIABLES)
80104301:	83 f8 1f             	cmp    $0x1f,%eax
80104304:	89 45 ec             	mov    %eax,-0x14(%ebp)
80104307:	0f 9f c0             	setg   %al
8010430a:	0f b6 c0             	movzbl %al,%eax
8010430d:	f7 d8                	neg    %eax
8010430f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    cprintf("\n");
  }
}

int checkVarName(const char* var) {
  for(; *var; var++)
80104312:	0f b6 06             	movzbl (%esi),%eax
80104315:	84 c0                	test   %al,%al
80104317:	88 45 f3             	mov    %al,-0xd(%ebp)
8010431a:	74 45                	je     80104361 <setVariable+0x71>
    if(*var < 'A' || *var > 'z' ||
8010431c:	89 c7                	mov    %eax,%edi
8010431e:	83 e8 41             	sub    $0x41,%eax
80104321:	3c 39                	cmp    $0x39,%al
80104323:	0f 87 f3 00 00 00    	ja     8010441c <setVariable+0x12c>
80104329:	89 f8                	mov    %edi,%eax
8010432b:	83 e8 5b             	sub    $0x5b,%eax
8010432e:	3c 05                	cmp    $0x5,%al
80104330:	0f 86 e6 00 00 00    	jbe    8010441c <setVariable+0x12c>
80104336:	89 f2                	mov    %esi,%edx
80104338:	eb 1d                	jmp    80104357 <setVariable+0x67>
8010433a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104340:	8d 48 bf             	lea    -0x41(%eax),%ecx
80104343:	80 f9 39             	cmp    $0x39,%cl
80104346:	0f 87 d0 00 00 00    	ja     8010441c <setVariable+0x12c>
8010434c:	83 e8 5b             	sub    $0x5b,%eax
8010434f:	3c 05                	cmp    $0x5,%al
80104351:	0f 86 c5 00 00 00    	jbe    8010441c <setVariable+0x12c>
    cprintf("\n");
  }
}

int checkVarName(const char* var) {
  for(; *var; var++)
80104357:	83 c2 01             	add    $0x1,%edx
8010435a:	0f b6 02             	movzbl (%edx),%eax
8010435d:	84 c0                	test   %al,%al
8010435f:	75 df                	jne    80104340 <setVariable+0x50>
      return -1;
  return 0;
}

int searchvar(char* var) {
  for (int i=0; i<next_empty_vartable_index; i++) {
80104361:	8b 45 ec             	mov    -0x14(%ebp),%eax
80104364:	85 c0                	test   %eax,%eax
80104366:	7e 4c                	jle    801043b4 <setVariable+0xc4>
80104368:	bb 40 3d 11 80       	mov    $0x80113d40,%ebx
8010436d:	31 ff                	xor    %edi,%edi
8010436f:	90                   	nop
80104370:	89 f8                	mov    %edi,%eax
80104372:	c1 e0 08             	shl    $0x8,%eax
80104375:	89 45 e8             	mov    %eax,-0x18(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
80104378:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
8010437c:	84 c0                	test   %al,%al
8010437e:	0f 84 aa 00 00 00    	je     8010442e <setVariable+0x13e>
80104384:	38 03                	cmp    %al,(%ebx)
80104386:	75 1e                	jne    801043a6 <setVariable+0xb6>
80104388:	89 d8                	mov    %ebx,%eax
8010438a:	89 f2                	mov    %esi,%edx
8010438c:	eb 06                	jmp    80104394 <setVariable+0xa4>
8010438e:	66 90                	xchg   %ax,%ax
80104390:	3a 08                	cmp    (%eax),%cl
80104392:	75 12                	jne    801043a6 <setVariable+0xb6>
    p++, q++;
80104394:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
80104397:	0f b6 0a             	movzbl (%edx),%ecx
    p++, q++;
8010439a:	83 c0 01             	add    $0x1,%eax
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
8010439d:	84 c9                	test   %cl,%cl
8010439f:	75 ef                	jne    80104390 <setVariable+0xa0>
  return 0;
}

int searchvar(char* var) {
  for (int i=0; i<next_empty_vartable_index; i++) {
    if (strcmp(var, variable_table[i][0]) == 0)
801043a1:	80 38 00             	cmpb   $0x0,(%eax)
801043a4:	74 2f                	je     801043d5 <setVariable+0xe5>
      return -1;
  return 0;
}

int searchvar(char* var) {
  for (int i=0; i<next_empty_vartable_index; i++) {
801043a6:	83 c7 01             	add    $0x1,%edi
801043a9:	81 c3 00 01 00 00    	add    $0x100,%ebx
801043af:	39 7d ec             	cmp    %edi,-0x14(%ebp)
801043b2:	75 bc                	jne    80104370 <setVariable+0x80>
    result = -2;
  else {
    int indexToUpdate = searchvar(var);
    if (indexToUpdate < 0) {
      indexToUpdate = next_empty_vartable_index;
      next_empty_vartable_index++;
801043b4:	8b 7d ec             	mov    -0x14(%ebp),%edi
801043b7:	89 f8                	mov    %edi,%eax
801043b9:	83 c0 01             	add    $0x1,%eax
801043bc:	a3 c0 b5 10 80       	mov    %eax,0x8010b5c0
801043c1:	89 f8                	mov    %edi,%eax
801043c3:	c1 e0 08             	shl    $0x8,%eax
801043c6:	89 45 e8             	mov    %eax,-0x18(%ebp)
801043c9:	8d 98 40 3d 11 80    	lea    -0x7feec2c0(%eax),%ebx
801043cf:	0f b6 06             	movzbl (%esi),%eax
801043d2:	88 45 f3             	mov    %al,-0xd(%ebp)
  return 0;
}

int searchvar(char* var) {
  for (int i=0; i<next_empty_vartable_index; i++) {
    if (strcmp(var, variable_table[i][0]) == 0)
801043d5:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
801043d9:	eb 08                	jmp    801043e3 <setVariable+0xf3>
801043db:	90                   	nop
801043dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801043e0:	0f b6 06             	movzbl (%esi),%eax
strcpy(char *s, char *t)
{
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
801043e3:	83 c3 01             	add    $0x1,%ebx
801043e6:	83 c6 01             	add    $0x1,%esi
801043e9:	84 c0                	test   %al,%al
801043eb:	88 43 ff             	mov    %al,-0x1(%ebx)
801043ee:	75 f0                	jne    801043e0 <setVariable+0xf0>
    if (indexToUpdate < 0) {
      indexToUpdate = next_empty_vartable_index;
      next_empty_vartable_index++;
    }
    strcpy(variable_table[indexToUpdate][0], var);
    strcpy(variable_table[indexToUpdate][1], val);
801043f0:	8b 45 e8             	mov    -0x18(%ebp),%eax
801043f3:	8b 55 0c             	mov    0xc(%ebp),%edx
801043f6:	05 c0 3d 11 80       	add    $0x80113dc0,%eax
801043fb:	90                   	nop
801043fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
strcpy(char *s, char *t)
{
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
80104400:	83 c2 01             	add    $0x1,%edx
80104403:	0f b6 4a ff          	movzbl -0x1(%edx),%ecx
80104407:	83 c0 01             	add    $0x1,%eax
8010440a:	84 c9                	test   %cl,%cl
8010440c:	88 48 ff             	mov    %cl,-0x1(%eax)
8010440f:	75 ef                	jne    80104400 <setVariable+0x110>
    }
    strcpy(variable_table[indexToUpdate][0], var);
    strcpy(variable_table[indexToUpdate][1], val);
  }
  return result;
}
80104411:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80104414:	83 c4 10             	add    $0x10,%esp
80104417:	5b                   	pop    %ebx
80104418:	5e                   	pop    %esi
80104419:	5f                   	pop    %edi
8010441a:	5d                   	pop    %ebp
8010441b:	c3                   	ret    
int setVariable(char* var, char* val) {
  int result = 0;
  if (next_empty_vartable_index >= MAX_VARIABLES)
    result = -1;
  if (checkVarName(var) < 0)
    result = -2;
8010441c:	c7 45 e4 fe ff ff ff 	movl   $0xfffffffe,-0x1c(%ebp)
    }
    strcpy(variable_table[indexToUpdate][0], var);
    strcpy(variable_table[indexToUpdate][1], val);
  }
  return result;
}
80104423:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80104426:	83 c4 10             	add    $0x10,%esp
80104429:	5b                   	pop    %ebx
8010442a:	5e                   	pop    %esi
8010442b:	5f                   	pop    %edi
8010442c:	5d                   	pop    %ebp
8010442d:	c3                   	ret    
  return 0;
}

int searchvar(char* var) {
  for (int i=0; i<next_empty_vartable_index; i++) {
    if (strcmp(var, variable_table[i][0]) == 0)
8010442e:	89 d8                	mov    %ebx,%eax
80104430:	e9 6c ff ff ff       	jmp    801043a1 <setVariable+0xb1>
80104435:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104439:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104440 <getVariable>:
    strcpy(variable_table[indexToUpdate][1], val);
  }
  return result;
}

int getVariable(char* var, char* val) {
80104440:	55                   	push   %ebp
80104441:	89 e5                	mov    %esp,%ebp
80104443:	57                   	push   %edi
80104444:	56                   	push   %esi
80104445:	53                   	push   %ebx
80104446:	83 ec 08             	sub    $0x8,%esp
      return -1;
  return 0;
}

int searchvar(char* var) {
  for (int i=0; i<next_empty_vartable_index; i++) {
80104449:	a1 c0 b5 10 80       	mov    0x8010b5c0,%eax
8010444e:	85 c0                	test   %eax,%eax
80104450:	89 45 ec             	mov    %eax,-0x14(%ebp)
80104453:	7e 57                	jle    801044ac <getVariable+0x6c>
80104455:	8b 45 08             	mov    0x8(%ebp),%eax
80104458:	be 40 3d 11 80       	mov    $0x80113d40,%esi
8010445d:	31 db                	xor    %ebx,%ebx
8010445f:	0f b6 00             	movzbl (%eax),%eax
80104462:	89 c7                	mov    %eax,%edi
80104464:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104468:	89 d8                	mov    %ebx,%eax
8010446a:	c1 e0 08             	shl    $0x8,%eax
8010446d:	89 45 f0             	mov    %eax,-0x10(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
80104470:	89 f8                	mov    %edi,%eax
80104472:	84 c0                	test   %al,%al
80104474:	74 6d                	je     801044e3 <getVariable+0xa3>
80104476:	38 06                	cmp    %al,(%esi)
80104478:	75 24                	jne    8010449e <getVariable+0x5e>
8010447a:	89 f0                	mov    %esi,%eax
8010447c:	8b 55 08             	mov    0x8(%ebp),%edx
8010447f:	eb 0b                	jmp    8010448c <getVariable+0x4c>
80104481:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104488:	3a 08                	cmp    (%eax),%cl
8010448a:	75 12                	jne    8010449e <getVariable+0x5e>
    p++, q++;
8010448c:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
8010448f:	0f b6 0a             	movzbl (%edx),%ecx
    p++, q++;
80104492:	83 c0 01             	add    $0x1,%eax
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
80104495:	84 c9                	test   %cl,%cl
80104497:	75 ef                	jne    80104488 <getVariable+0x48>
  return 0;
}

int searchvar(char* var) {
  for (int i=0; i<next_empty_vartable_index; i++) {
    if (strcmp(var, variable_table[i][0]) == 0)
80104499:	80 38 00             	cmpb   $0x0,(%eax)
8010449c:	74 1b                	je     801044b9 <getVariable+0x79>
      return -1;
  return 0;
}

int searchvar(char* var) {
  for (int i=0; i<next_empty_vartable_index; i++) {
8010449e:	83 c3 01             	add    $0x1,%ebx
801044a1:	81 c6 00 01 00 00    	add    $0x100,%esi
801044a7:	3b 5d ec             	cmp    -0x14(%ebp),%ebx
801044aa:	75 bc                	jne    80104468 <getVariable+0x28>
  if (varIndexInTable < 0)
    result = -1;
  else
    strcpy(val, variable_table[varIndexInTable][1]);
  return result;
}
801044ac:	83 c4 08             	add    $0x8,%esp

int getVariable(char* var, char* val) {
  int result = 0;
  int varIndexInTable = searchvar(var);
  if (varIndexInTable < 0)
    result = -1;
801044af:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  else
    strcpy(val, variable_table[varIndexInTable][1]);
  return result;
}
801044b4:	5b                   	pop    %ebx
801044b5:	5e                   	pop    %esi
801044b6:	5f                   	pop    %edi
801044b7:	5d                   	pop    %ebp
801044b8:	c3                   	ret    
  int result = 0;
  int varIndexInTable = searchvar(var);
  if (varIndexInTable < 0)
    result = -1;
  else
    strcpy(val, variable_table[varIndexInTable][1]);
801044b9:	8b 45 f0             	mov    -0x10(%ebp),%eax
801044bc:	8b 7d 0c             	mov    0xc(%ebp),%edi
801044bf:	05 c0 3d 11 80       	add    $0x80113dc0,%eax
801044c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
strcpy(char *s, char *t)
{
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
801044c8:	83 c0 01             	add    $0x1,%eax
801044cb:	0f b6 50 ff          	movzbl -0x1(%eax),%edx
801044cf:	83 c7 01             	add    $0x1,%edi
801044d2:	84 d2                	test   %dl,%dl
801044d4:	88 57 ff             	mov    %dl,-0x1(%edi)
801044d7:	75 ef                	jne    801044c8 <getVariable+0x88>
  if (varIndexInTable < 0)
    result = -1;
  else
    strcpy(val, variable_table[varIndexInTable][1]);
  return result;
}
801044d9:	83 c4 08             	add    $0x8,%esp
  }
  return result;
}

int getVariable(char* var, char* val) {
  int result = 0;
801044dc:	31 c0                	xor    %eax,%eax
  if (varIndexInTable < 0)
    result = -1;
  else
    strcpy(val, variable_table[varIndexInTable][1]);
  return result;
}
801044de:	5b                   	pop    %ebx
801044df:	5e                   	pop    %esi
801044e0:	5f                   	pop    %edi
801044e1:	5d                   	pop    %ebp
801044e2:	c3                   	ret    
  return 0;
}

int searchvar(char* var) {
  for (int i=0; i<next_empty_vartable_index; i++) {
    if (strcmp(var, variable_table[i][0]) == 0)
801044e3:	89 f0                	mov    %esi,%eax
801044e5:	eb b2                	jmp    80104499 <getVariable+0x59>
801044e7:	89 f6                	mov    %esi,%esi
801044e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801044f0 <remVariable>:
  else
    strcpy(val, variable_table[varIndexInTable][1]);
  return result;
}

int remVariable(char* var) {
801044f0:	55                   	push   %ebp
801044f1:	89 e5                	mov    %esp,%ebp
801044f3:	57                   	push   %edi
801044f4:	56                   	push   %esi
801044f5:	53                   	push   %ebx
801044f6:	83 ec 04             	sub    $0x4,%esp
      return -1;
  return 0;
}

int searchvar(char* var) {
  for (int i=0; i<next_empty_vartable_index; i++) {
801044f9:	a1 c0 b5 10 80       	mov    0x8010b5c0,%eax
801044fe:	85 c0                	test   %eax,%eax
80104500:	89 45 f0             	mov    %eax,-0x10(%ebp)
80104503:	7e 4f                	jle    80104554 <remVariable+0x64>
80104505:	8b 45 08             	mov    0x8(%ebp),%eax
80104508:	be 40 3d 11 80       	mov    $0x80113d40,%esi
8010450d:	31 db                	xor    %ebx,%ebx
8010450f:	0f b6 38             	movzbl (%eax),%edi
80104512:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
80104518:	89 f8                	mov    %edi,%eax
8010451a:	84 c0                	test   %al,%al
8010451c:	74 6d                	je     8010458b <remVariable+0x9b>
8010451e:	38 06                	cmp    %al,(%esi)
80104520:	75 24                	jne    80104546 <remVariable+0x56>
80104522:	89 f0                	mov    %esi,%eax
80104524:	8b 55 08             	mov    0x8(%ebp),%edx
80104527:	eb 0b                	jmp    80104534 <remVariable+0x44>
80104529:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104530:	3a 08                	cmp    (%eax),%cl
80104532:	75 12                	jne    80104546 <remVariable+0x56>
    p++, q++;
80104534:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
80104537:	0f b6 0a             	movzbl (%edx),%ecx
    p++, q++;
8010453a:	83 c0 01             	add    $0x1,%eax
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
8010453d:	84 c9                	test   %cl,%cl
8010453f:	75 ef                	jne    80104530 <remVariable+0x40>
  return 0;
}

int searchvar(char* var) {
  for (int i=0; i<next_empty_vartable_index; i++) {
    if (strcmp(var, variable_table[i][0]) == 0)
80104541:	80 38 00             	cmpb   $0x0,(%eax)
80104544:	74 1b                	je     80104561 <remVariable+0x71>
      return -1;
  return 0;
}

int searchvar(char* var) {
  for (int i=0; i<next_empty_vartable_index; i++) {
80104546:	83 c3 01             	add    $0x1,%ebx
80104549:	81 c6 00 01 00 00    	add    $0x100,%esi
8010454f:	39 5d f0             	cmp    %ebx,-0x10(%ebp)
80104552:	75 c4                	jne    80104518 <remVariable+0x28>
      variable_table[varIndexInTable][0][i] = 0;
      variable_table[varIndexInTable][1][i] = 0;
    }
  }
  return result;
}
80104554:	83 c4 04             	add    $0x4,%esp

int remVariable(char* var) {
  int result = 0;
  int varIndexInTable = searchvar(var);
  if (varIndexInTable < 0)
    result = -1;
80104557:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
      variable_table[varIndexInTable][0][i] = 0;
      variable_table[varIndexInTable][1][i] = 0;
    }
  }
  return result;
}
8010455c:	5b                   	pop    %ebx
8010455d:	5e                   	pop    %esi
8010455e:	5f                   	pop    %edi
8010455f:	5d                   	pop    %ebp
80104560:	c3                   	ret    
80104561:	c1 e3 08             	shl    $0x8,%ebx
80104564:	8d 83 40 3d 11 80    	lea    -0x7feec2c0(%ebx),%eax
8010456a:	8d 93 c0 3d 11 80    	lea    -0x7feec240(%ebx),%edx
  int varIndexInTable = searchvar(var);
  if (varIndexInTable < 0)
    result = -1;
  else {
    for (int i=0; i<USER_COMMAND_MAX_SIZE; i++) {
      variable_table[varIndexInTable][0][i] = 0;
80104570:	c6 00 00             	movb   $0x0,(%eax)
      variable_table[varIndexInTable][1][i] = 0;
80104573:	c6 80 80 00 00 00 00 	movb   $0x0,0x80(%eax)
8010457a:	83 c0 01             	add    $0x1,%eax
  int result = 0;
  int varIndexInTable = searchvar(var);
  if (varIndexInTable < 0)
    result = -1;
  else {
    for (int i=0; i<USER_COMMAND_MAX_SIZE; i++) {
8010457d:	39 d0                	cmp    %edx,%eax
8010457f:	75 ef                	jne    80104570 <remVariable+0x80>
      variable_table[varIndexInTable][0][i] = 0;
      variable_table[varIndexInTable][1][i] = 0;
    }
  }
  return result;
}
80104581:	83 c4 04             	add    $0x4,%esp
    strcpy(val, variable_table[varIndexInTable][1]);
  return result;
}

int remVariable(char* var) {
  int result = 0;
80104584:	31 c0                	xor    %eax,%eax
      variable_table[varIndexInTable][0][i] = 0;
      variable_table[varIndexInTable][1][i] = 0;
    }
  }
  return result;
}
80104586:	5b                   	pop    %ebx
80104587:	5e                   	pop    %esi
80104588:	5f                   	pop    %edi
80104589:	5d                   	pop    %ebp
8010458a:	c3                   	ret    
  return 0;
}

int searchvar(char* var) {
  for (int i=0; i<next_empty_vartable_index; i++) {
    if (strcmp(var, variable_table[i][0]) == 0)
8010458b:	89 f0                	mov    %esi,%eax
8010458d:	eb b2                	jmp    80104541 <remVariable+0x51>
8010458f:	90                   	nop

80104590 <wait2>:
• Int* iotime – A pointer to an integer that will hold io time.
Output:
• 0 – Process ID of caught child
• -1 – Process pid does not exist
*/
int wait2(int pid, int* wtime, int* rtime, int* iotime) {
80104590:	55                   	push   %ebp
80104591:	89 e5                	mov    %esp,%ebp
80104593:	57                   	push   %edi
80104594:	56                   	push   %esi
80104595:	53                   	push   %ebx
80104596:	83 ec 1c             	sub    $0x1c,%esp
80104599:	8b 75 08             	mov    0x8(%ebp),%esi
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
8010459c:	e8 0f 03 00 00       	call   801048b0 <pushcli>
  c = mycpu();
801045a1:	e8 7a f2 ff ff       	call   80103820 <mycpu>
  p = c->proc;
801045a6:	8b b8 ac 00 00 00    	mov    0xac(%eax),%edi
  popcli();
801045ac:	e8 ef 03 00 00       	call   801049a0 <popcli>

  struct proc *p;
  int havekids;
  struct proc *curproc = myproc();
  
  acquire(&ptable.lock);
801045b1:	83 ec 0c             	sub    $0xc,%esp
801045b4:	68 40 5e 11 80       	push   $0x80115e40
801045b9:	e8 32 03 00 00       	call   801048f0 <acquire>
801045be:	83 c4 10             	add    $0x10,%esp
801045c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(;;){
    // Scan through table looking for specifiec son with the pid..
    havekids = 0;
801045c8:	31 d2                	xor    %edx,%edx
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
801045ca:	bb 74 5e 11 80       	mov    $0x80115e74,%ebx
801045cf:	eb 15                	jmp    801045e6 <wait2+0x56>
801045d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801045d8:	81 c3 94 00 00 00    	add    $0x94,%ebx
801045de:	81 fb 74 83 11 80    	cmp    $0x80118374,%ebx
801045e4:	73 2a                	jae    80104610 <wait2+0x80>
      if( p->pid == pid){
801045e6:	8b 43 10             	mov    0x10(%ebx),%eax
801045e9:	39 f0                	cmp    %esi,%eax
801045eb:	75 eb                	jne    801045d8 <wait2+0x48>
        if(p->parent != curproc)
801045ed:	39 7b 14             	cmp    %edi,0x14(%ebx)
801045f0:	75 e6                	jne    801045d8 <wait2+0x48>
          continue;
        havekids = 1;
        if(p->state == ZOMBIE){
801045f2:	83 7b 0c 05          	cmpl   $0x5,0xc(%ebx)
801045f6:	74 3e                	je     80104636 <wait2+0xa6>
  
  acquire(&ptable.lock);
  for(;;){
    // Scan through table looking for specifiec son with the pid..
    havekids = 0;
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
801045f8:	81 c3 94 00 00 00    	add    $0x94,%ebx
      if( p->pid == pid){
        if(p->parent != curproc)
          continue;
        havekids = 1;
801045fe:	ba 01 00 00 00       	mov    $0x1,%edx
  
  acquire(&ptable.lock);
  for(;;){
    // Scan through table looking for specifiec son with the pid..
    havekids = 0;
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104603:	81 fb 74 83 11 80    	cmp    $0x80118374,%ebx
80104609:	72 db                	jb     801045e6 <wait2+0x56>
8010460b:	90                   	nop
8010460c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        }
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || curproc->killed){
80104610:	85 d2                	test   %edx,%edx
80104612:	0f 84 a6 00 00 00    	je     801046be <wait2+0x12e>
80104618:	8b 47 24             	mov    0x24(%edi),%eax
8010461b:	85 c0                	test   %eax,%eax
8010461d:	0f 85 9b 00 00 00    	jne    801046be <wait2+0x12e>
      release(&ptable.lock);
      return -1;
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
80104623:	83 ec 08             	sub    $0x8,%esp
80104626:	68 40 5e 11 80       	push   $0x80115e40
8010462b:	57                   	push   %edi
8010462c:	e8 8f f8 ff ff       	call   80103ec0 <sleep>
  struct proc *curproc = myproc();
  
  acquire(&ptable.lock);
  for(;;){
    // Scan through table looking for specifiec son with the pid..
    havekids = 0;
80104631:	83 c4 10             	add    $0x10,%esp
80104634:	eb 92                	jmp    801045c8 <wait2+0x38>
          continue;
        havekids = 1;
        if(p->state == ZOMBIE){
          // Found one.
          // regular wait syscall:
          kfree(p->kstack);
80104636:	83 ec 0c             	sub    $0xc,%esp
80104639:	ff 73 08             	pushl  0x8(%ebx)
8010463c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010463f:	e8 9c dc ff ff       	call   801022e0 <kfree>
          p->kstack = 0;
          freevm(p->pgdir);
80104644:	5a                   	pop    %edx
80104645:	ff 73 04             	pushl  0x4(%ebx)
        havekids = 1;
        if(p->state == ZOMBIE){
          // Found one.
          // regular wait syscall:
          kfree(p->kstack);
          p->kstack = 0;
80104648:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
          freevm(p->pgdir);
8010464f:	e8 ac 2c 00 00       	call   80107300 <freevm>
          p->parent = 0;
          p->name[0] = 0;
          p->killed = 0;
          p->state = UNUSED;
          //end of regular wait sys call, the following is wait2:
          *wtime = p->etime - p->ctime - p->rtime - p->iotime;
80104654:	8b 93 80 00 00 00    	mov    0x80(%ebx),%edx
8010465a:	2b 53 7c             	sub    0x7c(%ebx),%edx
8010465d:	2b 93 88 00 00 00    	sub    0x88(%ebx),%edx
80104663:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80104666:	2b 93 84 00 00 00    	sub    0x84(%ebx),%edx
          // Found one.
          // regular wait syscall:
          kfree(p->kstack);
          p->kstack = 0;
          freevm(p->pgdir);
          p->pid = 0;
8010466c:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
          p->parent = 0;
80104673:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
          p->name[0] = 0;
8010467a:	c6 43 6c 00          	movb   $0x0,0x6c(%ebx)
          p->killed = 0;
8010467e:	c7 43 24 00 00 00 00 	movl   $0x0,0x24(%ebx)
          p->state = UNUSED;
80104685:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
          //end of regular wait sys call, the following is wait2:
          *wtime = p->etime - p->ctime - p->rtime - p->iotime;
8010468c:	89 11                	mov    %edx,(%ecx)
          *rtime = p->rtime;
8010468e:	8b 55 10             	mov    0x10(%ebp),%edx
80104691:	8b 8b 88 00 00 00    	mov    0x88(%ebx),%ecx
80104697:	89 0a                	mov    %ecx,(%edx)
          *iotime = p->iotime;
80104699:	8b 55 14             	mov    0x14(%ebp),%edx
8010469c:	8b 8b 84 00 00 00    	mov    0x84(%ebx),%ecx
801046a2:	89 0a                	mov    %ecx,(%edx)
          release(&ptable.lock);
801046a4:	c7 04 24 40 5e 11 80 	movl   $0x80115e40,(%esp)
801046ab:	e8 60 03 00 00       	call   80104a10 <release>
          return pid;
801046b0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801046b3:	83 c4 10             	add    $0x10,%esp
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
  }
}
801046b6:	8d 65 f4             	lea    -0xc(%ebp),%esp
801046b9:	5b                   	pop    %ebx
801046ba:	5e                   	pop    %esi
801046bb:	5f                   	pop    %edi
801046bc:	5d                   	pop    %ebp
801046bd:	c3                   	ret    
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || curproc->killed){
      release(&ptable.lock);
801046be:	83 ec 0c             	sub    $0xc,%esp
801046c1:	68 40 5e 11 80       	push   $0x80115e40
801046c6:	e8 45 03 00 00       	call   80104a10 <release>
      return -1;
801046cb:	83 c4 10             	add    $0x10,%esp
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
  }
}
801046ce:	8d 65 f4             	lea    -0xc(%ebp),%esp
    }

    // No point waiting if we don't have any children.
    if(!havekids || curproc->killed){
      release(&ptable.lock);
      return -1;
801046d1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
  }
}
801046d6:	5b                   	pop    %ebx
801046d7:	5e                   	pop    %esi
801046d8:	5f                   	pop    %edi
801046d9:	5d                   	pop    %ebp
801046da:	c3                   	ret    
801046db:	66 90                	xchg   %ax,%ax
801046dd:	66 90                	xchg   %ax,%ax
801046df:	90                   	nop

801046e0 <initsleeplock>:
#include "spinlock.h"
#include "sleeplock.h"

void
initsleeplock(struct sleeplock *lk, char *name)
{
801046e0:	55                   	push   %ebp
801046e1:	89 e5                	mov    %esp,%ebp
801046e3:	53                   	push   %ebx
801046e4:	83 ec 0c             	sub    $0xc,%esp
801046e7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  initlock(&lk->lk, "sleep lock");
801046ea:	68 98 7c 10 80       	push   $0x80107c98
801046ef:	8d 43 04             	lea    0x4(%ebx),%eax
801046f2:	50                   	push   %eax
801046f3:	e8 f8 00 00 00       	call   801047f0 <initlock>
  lk->name = name;
801046f8:	8b 45 0c             	mov    0xc(%ebp),%eax
  lk->locked = 0;
801046fb:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  lk->pid = 0;
}
80104701:	83 c4 10             	add    $0x10,%esp
initsleeplock(struct sleeplock *lk, char *name)
{
  initlock(&lk->lk, "sleep lock");
  lk->name = name;
  lk->locked = 0;
  lk->pid = 0;
80104704:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)

void
initsleeplock(struct sleeplock *lk, char *name)
{
  initlock(&lk->lk, "sleep lock");
  lk->name = name;
8010470b:	89 43 38             	mov    %eax,0x38(%ebx)
  lk->locked = 0;
  lk->pid = 0;
}
8010470e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104711:	c9                   	leave  
80104712:	c3                   	ret    
80104713:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104719:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104720 <acquiresleep>:

void
acquiresleep(struct sleeplock *lk)
{
80104720:	55                   	push   %ebp
80104721:	89 e5                	mov    %esp,%ebp
80104723:	56                   	push   %esi
80104724:	53                   	push   %ebx
80104725:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&lk->lk);
80104728:	83 ec 0c             	sub    $0xc,%esp
8010472b:	8d 73 04             	lea    0x4(%ebx),%esi
8010472e:	56                   	push   %esi
8010472f:	e8 bc 01 00 00       	call   801048f0 <acquire>
  while (lk->locked) {
80104734:	8b 13                	mov    (%ebx),%edx
80104736:	83 c4 10             	add    $0x10,%esp
80104739:	85 d2                	test   %edx,%edx
8010473b:	74 16                	je     80104753 <acquiresleep+0x33>
8010473d:	8d 76 00             	lea    0x0(%esi),%esi
    sleep(lk, &lk->lk);
80104740:	83 ec 08             	sub    $0x8,%esp
80104743:	56                   	push   %esi
80104744:	53                   	push   %ebx
80104745:	e8 76 f7 ff ff       	call   80103ec0 <sleep>

void
acquiresleep(struct sleeplock *lk)
{
  acquire(&lk->lk);
  while (lk->locked) {
8010474a:	8b 03                	mov    (%ebx),%eax
8010474c:	83 c4 10             	add    $0x10,%esp
8010474f:	85 c0                	test   %eax,%eax
80104751:	75 ed                	jne    80104740 <acquiresleep+0x20>
    sleep(lk, &lk->lk);
  }
  lk->locked = 1;
80104753:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  lk->pid = myproc()->pid;
80104759:	e8 62 f1 ff ff       	call   801038c0 <myproc>
8010475e:	8b 40 10             	mov    0x10(%eax),%eax
80104761:	89 43 3c             	mov    %eax,0x3c(%ebx)
  release(&lk->lk);
80104764:	89 75 08             	mov    %esi,0x8(%ebp)
}
80104767:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010476a:	5b                   	pop    %ebx
8010476b:	5e                   	pop    %esi
8010476c:	5d                   	pop    %ebp
  while (lk->locked) {
    sleep(lk, &lk->lk);
  }
  lk->locked = 1;
  lk->pid = myproc()->pid;
  release(&lk->lk);
8010476d:	e9 9e 02 00 00       	jmp    80104a10 <release>
80104772:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104779:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104780 <releasesleep>:
}

void
releasesleep(struct sleeplock *lk)
{
80104780:	55                   	push   %ebp
80104781:	89 e5                	mov    %esp,%ebp
80104783:	56                   	push   %esi
80104784:	53                   	push   %ebx
80104785:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&lk->lk);
80104788:	83 ec 0c             	sub    $0xc,%esp
8010478b:	8d 73 04             	lea    0x4(%ebx),%esi
8010478e:	56                   	push   %esi
8010478f:	e8 5c 01 00 00       	call   801048f0 <acquire>
  lk->locked = 0;
80104794:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  lk->pid = 0;
8010479a:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
  wakeup(lk);
801047a1:	89 1c 24             	mov    %ebx,(%esp)
801047a4:	e8 d7 f8 ff ff       	call   80104080 <wakeup>
  release(&lk->lk);
801047a9:	89 75 08             	mov    %esi,0x8(%ebp)
801047ac:	83 c4 10             	add    $0x10,%esp
}
801047af:	8d 65 f8             	lea    -0x8(%ebp),%esp
801047b2:	5b                   	pop    %ebx
801047b3:	5e                   	pop    %esi
801047b4:	5d                   	pop    %ebp
{
  acquire(&lk->lk);
  lk->locked = 0;
  lk->pid = 0;
  wakeup(lk);
  release(&lk->lk);
801047b5:	e9 56 02 00 00       	jmp    80104a10 <release>
801047ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801047c0 <holdingsleep>:
}

int
holdingsleep(struct sleeplock *lk)
{
801047c0:	55                   	push   %ebp
801047c1:	89 e5                	mov    %esp,%ebp
801047c3:	56                   	push   %esi
801047c4:	53                   	push   %ebx
801047c5:	8b 75 08             	mov    0x8(%ebp),%esi
  int r;
  
  acquire(&lk->lk);
801047c8:	83 ec 0c             	sub    $0xc,%esp
801047cb:	8d 5e 04             	lea    0x4(%esi),%ebx
801047ce:	53                   	push   %ebx
801047cf:	e8 1c 01 00 00       	call   801048f0 <acquire>
  r = lk->locked;
801047d4:	8b 36                	mov    (%esi),%esi
  release(&lk->lk);
801047d6:	89 1c 24             	mov    %ebx,(%esp)
801047d9:	e8 32 02 00 00       	call   80104a10 <release>
  return r;
}
801047de:	8d 65 f8             	lea    -0x8(%ebp),%esp
801047e1:	89 f0                	mov    %esi,%eax
801047e3:	5b                   	pop    %ebx
801047e4:	5e                   	pop    %esi
801047e5:	5d                   	pop    %ebp
801047e6:	c3                   	ret    
801047e7:	66 90                	xchg   %ax,%ax
801047e9:	66 90                	xchg   %ax,%ax
801047eb:	66 90                	xchg   %ax,%ax
801047ed:	66 90                	xchg   %ax,%ax
801047ef:	90                   	nop

801047f0 <initlock>:
#include "proc.h"
#include "spinlock.h"

void
initlock(struct spinlock *lk, char *name)
{
801047f0:	55                   	push   %ebp
801047f1:	89 e5                	mov    %esp,%ebp
801047f3:	8b 45 08             	mov    0x8(%ebp),%eax
  lk->name = name;
801047f6:	8b 55 0c             	mov    0xc(%ebp),%edx
  lk->locked = 0;
801047f9:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
#include "spinlock.h"

void
initlock(struct spinlock *lk, char *name)
{
  lk->name = name;
801047ff:	89 50 04             	mov    %edx,0x4(%eax)
  lk->locked = 0;
  lk->cpu = 0;
80104802:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
80104809:	5d                   	pop    %ebp
8010480a:	c3                   	ret    
8010480b:	90                   	nop
8010480c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104810 <getcallerpcs>:
}

// Record the current call stack in pcs[] by following the %ebp chain.
void
getcallerpcs(void *v, uint pcs[])
{
80104810:	55                   	push   %ebp
80104811:	89 e5                	mov    %esp,%ebp
80104813:	53                   	push   %ebx
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
80104814:	8b 45 08             	mov    0x8(%ebp),%eax
}

// Record the current call stack in pcs[] by following the %ebp chain.
void
getcallerpcs(void *v, uint pcs[])
{
80104817:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
8010481a:	8d 50 f8             	lea    -0x8(%eax),%edx
  for(i = 0; i < 10; i++){
8010481d:	31 c0                	xor    %eax,%eax
8010481f:	90                   	nop
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
80104820:	8d 9a 00 00 00 80    	lea    -0x80000000(%edx),%ebx
80104826:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
8010482c:	77 1a                	ja     80104848 <getcallerpcs+0x38>
      break;
    pcs[i] = ebp[1];     // saved %eip
8010482e:	8b 5a 04             	mov    0x4(%edx),%ebx
80104831:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
80104834:	83 c0 01             	add    $0x1,%eax
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
80104837:	8b 12                	mov    (%edx),%edx
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
80104839:	83 f8 0a             	cmp    $0xa,%eax
8010483c:	75 e2                	jne    80104820 <getcallerpcs+0x10>
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
    pcs[i] = 0;
}
8010483e:	5b                   	pop    %ebx
8010483f:	5d                   	pop    %ebp
80104840:	c3                   	ret    
80104841:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
    pcs[i] = 0;
80104848:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
8010484f:	83 c0 01             	add    $0x1,%eax
80104852:	83 f8 0a             	cmp    $0xa,%eax
80104855:	74 e7                	je     8010483e <getcallerpcs+0x2e>
    pcs[i] = 0;
80104857:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
8010485e:	83 c0 01             	add    $0x1,%eax
80104861:	83 f8 0a             	cmp    $0xa,%eax
80104864:	75 e2                	jne    80104848 <getcallerpcs+0x38>
80104866:	eb d6                	jmp    8010483e <getcallerpcs+0x2e>
80104868:	90                   	nop
80104869:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80104870 <holding>:
}

// Check whether this cpu is holding the lock.
int
holding(struct spinlock *lock)
{
80104870:	55                   	push   %ebp
80104871:	89 e5                	mov    %esp,%ebp
80104873:	53                   	push   %ebx
80104874:	83 ec 04             	sub    $0x4,%esp
80104877:	8b 55 08             	mov    0x8(%ebp),%edx
  return lock->locked && lock->cpu == mycpu();
8010487a:	8b 02                	mov    (%edx),%eax
8010487c:	85 c0                	test   %eax,%eax
8010487e:	75 10                	jne    80104890 <holding+0x20>
}
80104880:	83 c4 04             	add    $0x4,%esp
80104883:	31 c0                	xor    %eax,%eax
80104885:	5b                   	pop    %ebx
80104886:	5d                   	pop    %ebp
80104887:	c3                   	ret    
80104888:	90                   	nop
80104889:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

// Check whether this cpu is holding the lock.
int
holding(struct spinlock *lock)
{
  return lock->locked && lock->cpu == mycpu();
80104890:	8b 5a 08             	mov    0x8(%edx),%ebx
80104893:	e8 88 ef ff ff       	call   80103820 <mycpu>
80104898:	39 c3                	cmp    %eax,%ebx
8010489a:	0f 94 c0             	sete   %al
}
8010489d:	83 c4 04             	add    $0x4,%esp

// Check whether this cpu is holding the lock.
int
holding(struct spinlock *lock)
{
  return lock->locked && lock->cpu == mycpu();
801048a0:	0f b6 c0             	movzbl %al,%eax
}
801048a3:	5b                   	pop    %ebx
801048a4:	5d                   	pop    %ebp
801048a5:	c3                   	ret    
801048a6:	8d 76 00             	lea    0x0(%esi),%esi
801048a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801048b0 <pushcli>:
// it takes two popcli to undo two pushcli.  Also, if interrupts
// are off, then pushcli, popcli leaves them off.

void
pushcli(void)
{
801048b0:	55                   	push   %ebp
801048b1:	89 e5                	mov    %esp,%ebp
801048b3:	53                   	push   %ebx
801048b4:	83 ec 04             	sub    $0x4,%esp
801048b7:	9c                   	pushf  
801048b8:	5b                   	pop    %ebx
}

static inline void
cli(void)
{
  asm volatile("cli");
801048b9:	fa                   	cli    
  int eflags;

  eflags = readeflags();
  cli();
  if(mycpu()->ncli == 0)
801048ba:	e8 61 ef ff ff       	call   80103820 <mycpu>
801048bf:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
801048c5:	85 c0                	test   %eax,%eax
801048c7:	75 11                	jne    801048da <pushcli+0x2a>
    mycpu()->intena = eflags & FL_IF;
801048c9:	81 e3 00 02 00 00    	and    $0x200,%ebx
801048cf:	e8 4c ef ff ff       	call   80103820 <mycpu>
801048d4:	89 98 a8 00 00 00    	mov    %ebx,0xa8(%eax)
  mycpu()->ncli += 1;
801048da:	e8 41 ef ff ff       	call   80103820 <mycpu>
801048df:	83 80 a4 00 00 00 01 	addl   $0x1,0xa4(%eax)
}
801048e6:	83 c4 04             	add    $0x4,%esp
801048e9:	5b                   	pop    %ebx
801048ea:	5d                   	pop    %ebp
801048eb:	c3                   	ret    
801048ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801048f0 <acquire>:
// Loops (spins) until the lock is acquired.
// Holding a lock for a long time may cause
// other CPUs to waste time spinning to acquire it.
void
acquire(struct spinlock *lk)
{
801048f0:	55                   	push   %ebp
801048f1:	89 e5                	mov    %esp,%ebp
801048f3:	56                   	push   %esi
801048f4:	53                   	push   %ebx
  pushcli(); // disable interrupts to avoid deadlock.
801048f5:	e8 b6 ff ff ff       	call   801048b0 <pushcli>
  if(holding(lk))
801048fa:	8b 5d 08             	mov    0x8(%ebp),%ebx

// Check whether this cpu is holding the lock.
int
holding(struct spinlock *lock)
{
  return lock->locked && lock->cpu == mycpu();
801048fd:	8b 03                	mov    (%ebx),%eax
801048ff:	85 c0                	test   %eax,%eax
80104901:	75 7d                	jne    80104980 <acquire+0x90>
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
80104903:	ba 01 00 00 00       	mov    $0x1,%edx
80104908:	eb 09                	jmp    80104913 <acquire+0x23>
8010490a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104910:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104913:	89 d0                	mov    %edx,%eax
80104915:	f0 87 03             	lock xchg %eax,(%ebx)
  pushcli(); // disable interrupts to avoid deadlock.
  if(holding(lk))
    panic("acquire");

  // The xchg is atomic.
  while(xchg(&lk->locked, 1) != 0)
80104918:	85 c0                	test   %eax,%eax
8010491a:	75 f4                	jne    80104910 <acquire+0x20>
    ;

  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that the critical section's memory
  // references happen after the lock is acquired.
  __sync_synchronize();
8010491c:	f0 83 0c 24 00       	lock orl $0x0,(%esp)

  // Record info about lock acquisition for debugging.
  lk->cpu = mycpu();
80104921:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104924:	e8 f7 ee ff ff       	call   80103820 <mycpu>
getcallerpcs(void *v, uint pcs[])
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
80104929:	89 ea                	mov    %ebp,%edx
  // references happen after the lock is acquired.
  __sync_synchronize();

  // Record info about lock acquisition for debugging.
  lk->cpu = mycpu();
  getcallerpcs(&lk, lk->pcs);
8010492b:	8d 4b 0c             	lea    0xc(%ebx),%ecx
  // past this point, to ensure that the critical section's memory
  // references happen after the lock is acquired.
  __sync_synchronize();

  // Record info about lock acquisition for debugging.
  lk->cpu = mycpu();
8010492e:	89 43 08             	mov    %eax,0x8(%ebx)
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
80104931:	31 c0                	xor    %eax,%eax
80104933:	90                   	nop
80104934:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
80104938:	8d 9a 00 00 00 80    	lea    -0x80000000(%edx),%ebx
8010493e:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
80104944:	77 1a                	ja     80104960 <acquire+0x70>
      break;
    pcs[i] = ebp[1];     // saved %eip
80104946:	8b 5a 04             	mov    0x4(%edx),%ebx
80104949:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
8010494c:	83 c0 01             	add    $0x1,%eax
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
8010494f:	8b 12                	mov    (%edx),%edx
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
80104951:	83 f8 0a             	cmp    $0xa,%eax
80104954:	75 e2                	jne    80104938 <acquire+0x48>
  __sync_synchronize();

  // Record info about lock acquisition for debugging.
  lk->cpu = mycpu();
  getcallerpcs(&lk, lk->pcs);
}
80104956:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104959:	5b                   	pop    %ebx
8010495a:	5e                   	pop    %esi
8010495b:	5d                   	pop    %ebp
8010495c:	c3                   	ret    
8010495d:	8d 76 00             	lea    0x0(%esi),%esi
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
    pcs[i] = 0;
80104960:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
80104967:	83 c0 01             	add    $0x1,%eax
8010496a:	83 f8 0a             	cmp    $0xa,%eax
8010496d:	74 e7                	je     80104956 <acquire+0x66>
    pcs[i] = 0;
8010496f:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
80104976:	83 c0 01             	add    $0x1,%eax
80104979:	83 f8 0a             	cmp    $0xa,%eax
8010497c:	75 e2                	jne    80104960 <acquire+0x70>
8010497e:	eb d6                	jmp    80104956 <acquire+0x66>

// Check whether this cpu is holding the lock.
int
holding(struct spinlock *lock)
{
  return lock->locked && lock->cpu == mycpu();
80104980:	8b 73 08             	mov    0x8(%ebx),%esi
80104983:	e8 98 ee ff ff       	call   80103820 <mycpu>
80104988:	39 c6                	cmp    %eax,%esi
8010498a:	0f 85 73 ff ff ff    	jne    80104903 <acquire+0x13>
void
acquire(struct spinlock *lk)
{
  pushcli(); // disable interrupts to avoid deadlock.
  if(holding(lk))
    panic("acquire");
80104990:	83 ec 0c             	sub    $0xc,%esp
80104993:	68 a3 7c 10 80       	push   $0x80107ca3
80104998:	e8 d3 b9 ff ff       	call   80100370 <panic>
8010499d:	8d 76 00             	lea    0x0(%esi),%esi

801049a0 <popcli>:
  mycpu()->ncli += 1;
}

void
popcli(void)
{
801049a0:	55                   	push   %ebp
801049a1:	89 e5                	mov    %esp,%ebp
801049a3:	83 ec 08             	sub    $0x8,%esp

static inline uint
readeflags(void)
{
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
801049a6:	9c                   	pushf  
801049a7:	58                   	pop    %eax
  if(readeflags()&FL_IF)
801049a8:	f6 c4 02             	test   $0x2,%ah
801049ab:	75 52                	jne    801049ff <popcli+0x5f>
    panic("popcli - interruptible");
  if(--mycpu()->ncli < 0)
801049ad:	e8 6e ee ff ff       	call   80103820 <mycpu>
801049b2:	8b 88 a4 00 00 00    	mov    0xa4(%eax),%ecx
801049b8:	8d 51 ff             	lea    -0x1(%ecx),%edx
801049bb:	85 d2                	test   %edx,%edx
801049bd:	89 90 a4 00 00 00    	mov    %edx,0xa4(%eax)
801049c3:	78 2d                	js     801049f2 <popcli+0x52>
    panic("popcli");
  if(mycpu()->ncli == 0 && mycpu()->intena)
801049c5:	e8 56 ee ff ff       	call   80103820 <mycpu>
801049ca:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
801049d0:	85 d2                	test   %edx,%edx
801049d2:	74 0c                	je     801049e0 <popcli+0x40>
    sti();
}
801049d4:	c9                   	leave  
801049d5:	c3                   	ret    
801049d6:	8d 76 00             	lea    0x0(%esi),%esi
801049d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
{
  if(readeflags()&FL_IF)
    panic("popcli - interruptible");
  if(--mycpu()->ncli < 0)
    panic("popcli");
  if(mycpu()->ncli == 0 && mycpu()->intena)
801049e0:	e8 3b ee ff ff       	call   80103820 <mycpu>
801049e5:	8b 80 a8 00 00 00    	mov    0xa8(%eax),%eax
801049eb:	85 c0                	test   %eax,%eax
801049ed:	74 e5                	je     801049d4 <popcli+0x34>
}

static inline void
sti(void)
{
  asm volatile("sti");
801049ef:	fb                   	sti    
    sti();
}
801049f0:	c9                   	leave  
801049f1:	c3                   	ret    
popcli(void)
{
  if(readeflags()&FL_IF)
    panic("popcli - interruptible");
  if(--mycpu()->ncli < 0)
    panic("popcli");
801049f2:	83 ec 0c             	sub    $0xc,%esp
801049f5:	68 c2 7c 10 80       	push   $0x80107cc2
801049fa:	e8 71 b9 ff ff       	call   80100370 <panic>

void
popcli(void)
{
  if(readeflags()&FL_IF)
    panic("popcli - interruptible");
801049ff:	83 ec 0c             	sub    $0xc,%esp
80104a02:	68 ab 7c 10 80       	push   $0x80107cab
80104a07:	e8 64 b9 ff ff       	call   80100370 <panic>
80104a0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104a10 <release>:
}

// Release the lock.
void
release(struct spinlock *lk)
{
80104a10:	55                   	push   %ebp
80104a11:	89 e5                	mov    %esp,%ebp
80104a13:	56                   	push   %esi
80104a14:	53                   	push   %ebx
80104a15:	8b 5d 08             	mov    0x8(%ebp),%ebx

// Check whether this cpu is holding the lock.
int
holding(struct spinlock *lock)
{
  return lock->locked && lock->cpu == mycpu();
80104a18:	8b 03                	mov    (%ebx),%eax
80104a1a:	85 c0                	test   %eax,%eax
80104a1c:	75 12                	jne    80104a30 <release+0x20>
// Release the lock.
void
release(struct spinlock *lk)
{
  if(!holding(lk))
    panic("release");
80104a1e:	83 ec 0c             	sub    $0xc,%esp
80104a21:	68 c9 7c 10 80       	push   $0x80107cc9
80104a26:	e8 45 b9 ff ff       	call   80100370 <panic>
80104a2b:	90                   	nop
80104a2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

// Check whether this cpu is holding the lock.
int
holding(struct spinlock *lock)
{
  return lock->locked && lock->cpu == mycpu();
80104a30:	8b 73 08             	mov    0x8(%ebx),%esi
80104a33:	e8 e8 ed ff ff       	call   80103820 <mycpu>
80104a38:	39 c6                	cmp    %eax,%esi
80104a3a:	75 e2                	jne    80104a1e <release+0xe>
release(struct spinlock *lk)
{
  if(!holding(lk))
    panic("release");

  lk->pcs[0] = 0;
80104a3c:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
  lk->cpu = 0;
80104a43:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that all the stores in the critical
  // section are visible to other cores before the lock is released.
  // Both the C compiler and the hardware may re-order loads and
  // stores; __sync_synchronize() tells them both not to.
  __sync_synchronize();
80104a4a:	f0 83 0c 24 00       	lock orl $0x0,(%esp)

  // Release the lock, equivalent to lk->locked = 0.
  // This code can't use a C assignment, since it might
  // not be atomic. A real OS would use C atomics here.
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );
80104a4f:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)

  popcli();
}
80104a55:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104a58:	5b                   	pop    %ebx
80104a59:	5e                   	pop    %esi
80104a5a:	5d                   	pop    %ebp
  // Release the lock, equivalent to lk->locked = 0.
  // This code can't use a C assignment, since it might
  // not be atomic. A real OS would use C atomics here.
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );

  popcli();
80104a5b:	e9 40 ff ff ff       	jmp    801049a0 <popcli>

80104a60 <memset>:
#include "types.h"
#include "x86.h"

void*
memset(void *dst, int c, uint n)
{
80104a60:	55                   	push   %ebp
80104a61:	89 e5                	mov    %esp,%ebp
80104a63:	57                   	push   %edi
80104a64:	53                   	push   %ebx
80104a65:	8b 55 08             	mov    0x8(%ebp),%edx
80104a68:	8b 4d 10             	mov    0x10(%ebp),%ecx
  if ((int)dst%4 == 0 && n%4 == 0){
80104a6b:	f6 c2 03             	test   $0x3,%dl
80104a6e:	75 05                	jne    80104a75 <memset+0x15>
80104a70:	f6 c1 03             	test   $0x3,%cl
80104a73:	74 13                	je     80104a88 <memset+0x28>
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
80104a75:	89 d7                	mov    %edx,%edi
80104a77:	8b 45 0c             	mov    0xc(%ebp),%eax
80104a7a:	fc                   	cld    
80104a7b:	f3 aa                	rep stos %al,%es:(%edi)
    c &= 0xFF;
    stosl(dst, (c<<24)|(c<<16)|(c<<8)|c, n/4);
  } else
    stosb(dst, c, n);
  return dst;
}
80104a7d:	5b                   	pop    %ebx
80104a7e:	89 d0                	mov    %edx,%eax
80104a80:	5f                   	pop    %edi
80104a81:	5d                   	pop    %ebp
80104a82:	c3                   	ret    
80104a83:	90                   	nop
80104a84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

void*
memset(void *dst, int c, uint n)
{
  if ((int)dst%4 == 0 && n%4 == 0){
    c &= 0xFF;
80104a88:	0f b6 7d 0c          	movzbl 0xc(%ebp),%edi
    stosl(dst, (c<<24)|(c<<16)|(c<<8)|c, n/4);
80104a8c:	c1 e9 02             	shr    $0x2,%ecx
80104a8f:	89 f8                	mov    %edi,%eax
80104a91:	89 fb                	mov    %edi,%ebx
80104a93:	c1 e0 18             	shl    $0x18,%eax
80104a96:	c1 e3 10             	shl    $0x10,%ebx
80104a99:	09 d8                	or     %ebx,%eax
80104a9b:	09 f8                	or     %edi,%eax
80104a9d:	c1 e7 08             	shl    $0x8,%edi
80104aa0:	09 f8                	or     %edi,%eax
}

static inline void
stosl(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosl" :
80104aa2:	89 d7                	mov    %edx,%edi
80104aa4:	fc                   	cld    
80104aa5:	f3 ab                	rep stos %eax,%es:(%edi)
  } else
    stosb(dst, c, n);
  return dst;
}
80104aa7:	5b                   	pop    %ebx
80104aa8:	89 d0                	mov    %edx,%eax
80104aaa:	5f                   	pop    %edi
80104aab:	5d                   	pop    %ebp
80104aac:	c3                   	ret    
80104aad:	8d 76 00             	lea    0x0(%esi),%esi

80104ab0 <memcmp>:

int
memcmp(const void *v1, const void *v2, uint n)
{
80104ab0:	55                   	push   %ebp
80104ab1:	89 e5                	mov    %esp,%ebp
80104ab3:	57                   	push   %edi
80104ab4:	56                   	push   %esi
80104ab5:	53                   	push   %ebx
80104ab6:	8b 5d 10             	mov    0x10(%ebp),%ebx
80104ab9:	8b 75 08             	mov    0x8(%ebp),%esi
80104abc:	8b 7d 0c             	mov    0xc(%ebp),%edi
  const uchar *s1, *s2;

  s1 = v1;
  s2 = v2;
  while(n-- > 0){
80104abf:	85 db                	test   %ebx,%ebx
80104ac1:	74 29                	je     80104aec <memcmp+0x3c>
    if(*s1 != *s2)
80104ac3:	0f b6 16             	movzbl (%esi),%edx
80104ac6:	0f b6 0f             	movzbl (%edi),%ecx
80104ac9:	38 d1                	cmp    %dl,%cl
80104acb:	75 2b                	jne    80104af8 <memcmp+0x48>
80104acd:	b8 01 00 00 00       	mov    $0x1,%eax
80104ad2:	eb 14                	jmp    80104ae8 <memcmp+0x38>
80104ad4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104ad8:	0f b6 14 06          	movzbl (%esi,%eax,1),%edx
80104adc:	83 c0 01             	add    $0x1,%eax
80104adf:	0f b6 4c 07 ff       	movzbl -0x1(%edi,%eax,1),%ecx
80104ae4:	38 ca                	cmp    %cl,%dl
80104ae6:	75 10                	jne    80104af8 <memcmp+0x48>
{
  const uchar *s1, *s2;

  s1 = v1;
  s2 = v2;
  while(n-- > 0){
80104ae8:	39 d8                	cmp    %ebx,%eax
80104aea:	75 ec                	jne    80104ad8 <memcmp+0x28>
      return *s1 - *s2;
    s1++, s2++;
  }

  return 0;
}
80104aec:	5b                   	pop    %ebx
    if(*s1 != *s2)
      return *s1 - *s2;
    s1++, s2++;
  }

  return 0;
80104aed:	31 c0                	xor    %eax,%eax
}
80104aef:	5e                   	pop    %esi
80104af0:	5f                   	pop    %edi
80104af1:	5d                   	pop    %ebp
80104af2:	c3                   	ret    
80104af3:	90                   	nop
80104af4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  s1 = v1;
  s2 = v2;
  while(n-- > 0){
    if(*s1 != *s2)
      return *s1 - *s2;
80104af8:	0f b6 c2             	movzbl %dl,%eax
    s1++, s2++;
  }

  return 0;
}
80104afb:	5b                   	pop    %ebx

  s1 = v1;
  s2 = v2;
  while(n-- > 0){
    if(*s1 != *s2)
      return *s1 - *s2;
80104afc:	29 c8                	sub    %ecx,%eax
    s1++, s2++;
  }

  return 0;
}
80104afe:	5e                   	pop    %esi
80104aff:	5f                   	pop    %edi
80104b00:	5d                   	pop    %ebp
80104b01:	c3                   	ret    
80104b02:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104b09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104b10 <memmove>:

void*
memmove(void *dst, const void *src, uint n)
{
80104b10:	55                   	push   %ebp
80104b11:	89 e5                	mov    %esp,%ebp
80104b13:	56                   	push   %esi
80104b14:	53                   	push   %ebx
80104b15:	8b 45 08             	mov    0x8(%ebp),%eax
80104b18:	8b 5d 0c             	mov    0xc(%ebp),%ebx
80104b1b:	8b 75 10             	mov    0x10(%ebp),%esi
  const char *s;
  char *d;

  s = src;
  d = dst;
  if(s < d && s + n > d){
80104b1e:	39 c3                	cmp    %eax,%ebx
80104b20:	73 26                	jae    80104b48 <memmove+0x38>
80104b22:	8d 14 33             	lea    (%ebx,%esi,1),%edx
80104b25:	39 d0                	cmp    %edx,%eax
80104b27:	73 1f                	jae    80104b48 <memmove+0x38>
    s += n;
    d += n;
    while(n-- > 0)
80104b29:	85 f6                	test   %esi,%esi
80104b2b:	8d 56 ff             	lea    -0x1(%esi),%edx
80104b2e:	74 0f                	je     80104b3f <memmove+0x2f>
      *--d = *--s;
80104b30:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
80104b34:	88 0c 10             	mov    %cl,(%eax,%edx,1)
  s = src;
  d = dst;
  if(s < d && s + n > d){
    s += n;
    d += n;
    while(n-- > 0)
80104b37:	83 ea 01             	sub    $0x1,%edx
80104b3a:	83 fa ff             	cmp    $0xffffffff,%edx
80104b3d:	75 f1                	jne    80104b30 <memmove+0x20>
  } else
    while(n-- > 0)
      *d++ = *s++;

  return dst;
}
80104b3f:	5b                   	pop    %ebx
80104b40:	5e                   	pop    %esi
80104b41:	5d                   	pop    %ebp
80104b42:	c3                   	ret    
80104b43:	90                   	nop
80104b44:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    s += n;
    d += n;
    while(n-- > 0)
      *--d = *--s;
  } else
    while(n-- > 0)
80104b48:	31 d2                	xor    %edx,%edx
80104b4a:	85 f6                	test   %esi,%esi
80104b4c:	74 f1                	je     80104b3f <memmove+0x2f>
80104b4e:	66 90                	xchg   %ax,%ax
      *d++ = *s++;
80104b50:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
80104b54:	88 0c 10             	mov    %cl,(%eax,%edx,1)
80104b57:	83 c2 01             	add    $0x1,%edx
    s += n;
    d += n;
    while(n-- > 0)
      *--d = *--s;
  } else
    while(n-- > 0)
80104b5a:	39 f2                	cmp    %esi,%edx
80104b5c:	75 f2                	jne    80104b50 <memmove+0x40>
      *d++ = *s++;

  return dst;
}
80104b5e:	5b                   	pop    %ebx
80104b5f:	5e                   	pop    %esi
80104b60:	5d                   	pop    %ebp
80104b61:	c3                   	ret    
80104b62:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104b69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104b70 <memcpy>:

// memcpy exists to placate GCC.  Use memmove.
void*
memcpy(void *dst, const void *src, uint n)
{
80104b70:	55                   	push   %ebp
80104b71:	89 e5                	mov    %esp,%ebp
  return memmove(dst, src, n);
}
80104b73:	5d                   	pop    %ebp

// memcpy exists to placate GCC.  Use memmove.
void*
memcpy(void *dst, const void *src, uint n)
{
  return memmove(dst, src, n);
80104b74:	e9 97 ff ff ff       	jmp    80104b10 <memmove>
80104b79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80104b80 <strncmp>:
}

int
strncmp(const char *p, const char *q, uint n)
{
80104b80:	55                   	push   %ebp
80104b81:	89 e5                	mov    %esp,%ebp
80104b83:	57                   	push   %edi
80104b84:	56                   	push   %esi
80104b85:	8b 7d 10             	mov    0x10(%ebp),%edi
80104b88:	53                   	push   %ebx
80104b89:	8b 4d 08             	mov    0x8(%ebp),%ecx
80104b8c:	8b 75 0c             	mov    0xc(%ebp),%esi
  while(n > 0 && *p && *p == *q)
80104b8f:	85 ff                	test   %edi,%edi
80104b91:	74 2f                	je     80104bc2 <strncmp+0x42>
80104b93:	0f b6 11             	movzbl (%ecx),%edx
80104b96:	0f b6 1e             	movzbl (%esi),%ebx
80104b99:	84 d2                	test   %dl,%dl
80104b9b:	74 37                	je     80104bd4 <strncmp+0x54>
80104b9d:	38 d3                	cmp    %dl,%bl
80104b9f:	75 33                	jne    80104bd4 <strncmp+0x54>
80104ba1:	01 f7                	add    %esi,%edi
80104ba3:	eb 13                	jmp    80104bb8 <strncmp+0x38>
80104ba5:	8d 76 00             	lea    0x0(%esi),%esi
80104ba8:	0f b6 11             	movzbl (%ecx),%edx
80104bab:	84 d2                	test   %dl,%dl
80104bad:	74 21                	je     80104bd0 <strncmp+0x50>
80104baf:	0f b6 18             	movzbl (%eax),%ebx
80104bb2:	89 c6                	mov    %eax,%esi
80104bb4:	38 da                	cmp    %bl,%dl
80104bb6:	75 1c                	jne    80104bd4 <strncmp+0x54>
    n--, p++, q++;
80104bb8:	8d 46 01             	lea    0x1(%esi),%eax
80104bbb:	83 c1 01             	add    $0x1,%ecx
}

int
strncmp(const char *p, const char *q, uint n)
{
  while(n > 0 && *p && *p == *q)
80104bbe:	39 f8                	cmp    %edi,%eax
80104bc0:	75 e6                	jne    80104ba8 <strncmp+0x28>
    n--, p++, q++;
  if(n == 0)
    return 0;
  return (uchar)*p - (uchar)*q;
}
80104bc2:	5b                   	pop    %ebx
strncmp(const char *p, const char *q, uint n)
{
  while(n > 0 && *p && *p == *q)
    n--, p++, q++;
  if(n == 0)
    return 0;
80104bc3:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
}
80104bc5:	5e                   	pop    %esi
80104bc6:	5f                   	pop    %edi
80104bc7:	5d                   	pop    %ebp
80104bc8:	c3                   	ret    
80104bc9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104bd0:	0f b6 5e 01          	movzbl 0x1(%esi),%ebx
{
  while(n > 0 && *p && *p == *q)
    n--, p++, q++;
  if(n == 0)
    return 0;
  return (uchar)*p - (uchar)*q;
80104bd4:	0f b6 c2             	movzbl %dl,%eax
80104bd7:	29 d8                	sub    %ebx,%eax
}
80104bd9:	5b                   	pop    %ebx
80104bda:	5e                   	pop    %esi
80104bdb:	5f                   	pop    %edi
80104bdc:	5d                   	pop    %ebp
80104bdd:	c3                   	ret    
80104bde:	66 90                	xchg   %ax,%ax

80104be0 <strncpy>:

char*
strncpy(char *s, const char *t, int n)
{
80104be0:	55                   	push   %ebp
80104be1:	89 e5                	mov    %esp,%ebp
80104be3:	56                   	push   %esi
80104be4:	53                   	push   %ebx
80104be5:	8b 45 08             	mov    0x8(%ebp),%eax
80104be8:	8b 5d 0c             	mov    0xc(%ebp),%ebx
80104beb:	8b 4d 10             	mov    0x10(%ebp),%ecx
  char *os;

  os = s;
  while(n-- > 0 && (*s++ = *t++) != 0)
80104bee:	89 c2                	mov    %eax,%edx
80104bf0:	eb 19                	jmp    80104c0b <strncpy+0x2b>
80104bf2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104bf8:	83 c3 01             	add    $0x1,%ebx
80104bfb:	0f b6 4b ff          	movzbl -0x1(%ebx),%ecx
80104bff:	83 c2 01             	add    $0x1,%edx
80104c02:	84 c9                	test   %cl,%cl
80104c04:	88 4a ff             	mov    %cl,-0x1(%edx)
80104c07:	74 09                	je     80104c12 <strncpy+0x32>
80104c09:	89 f1                	mov    %esi,%ecx
80104c0b:	85 c9                	test   %ecx,%ecx
80104c0d:	8d 71 ff             	lea    -0x1(%ecx),%esi
80104c10:	7f e6                	jg     80104bf8 <strncpy+0x18>
    ;
  while(n-- > 0)
80104c12:	31 c9                	xor    %ecx,%ecx
80104c14:	85 f6                	test   %esi,%esi
80104c16:	7e 17                	jle    80104c2f <strncpy+0x4f>
80104c18:	90                   	nop
80104c19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    *s++ = 0;
80104c20:	c6 04 0a 00          	movb   $0x0,(%edx,%ecx,1)
80104c24:	89 f3                	mov    %esi,%ebx
80104c26:	83 c1 01             	add    $0x1,%ecx
80104c29:	29 cb                	sub    %ecx,%ebx
  char *os;

  os = s;
  while(n-- > 0 && (*s++ = *t++) != 0)
    ;
  while(n-- > 0)
80104c2b:	85 db                	test   %ebx,%ebx
80104c2d:	7f f1                	jg     80104c20 <strncpy+0x40>
    *s++ = 0;
  return os;
}
80104c2f:	5b                   	pop    %ebx
80104c30:	5e                   	pop    %esi
80104c31:	5d                   	pop    %ebp
80104c32:	c3                   	ret    
80104c33:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104c39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104c40 <safestrcpy>:

// Like strncpy but guaranteed to NUL-terminate.
char*
safestrcpy(char *s, const char *t, int n)
{
80104c40:	55                   	push   %ebp
80104c41:	89 e5                	mov    %esp,%ebp
80104c43:	56                   	push   %esi
80104c44:	53                   	push   %ebx
80104c45:	8b 4d 10             	mov    0x10(%ebp),%ecx
80104c48:	8b 45 08             	mov    0x8(%ebp),%eax
80104c4b:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  if(n <= 0)
80104c4e:	85 c9                	test   %ecx,%ecx
80104c50:	7e 26                	jle    80104c78 <safestrcpy+0x38>
80104c52:	8d 74 0a ff          	lea    -0x1(%edx,%ecx,1),%esi
80104c56:	89 c1                	mov    %eax,%ecx
80104c58:	eb 17                	jmp    80104c71 <safestrcpy+0x31>
80104c5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return os;
  while(--n > 0 && (*s++ = *t++) != 0)
80104c60:	83 c2 01             	add    $0x1,%edx
80104c63:	0f b6 5a ff          	movzbl -0x1(%edx),%ebx
80104c67:	83 c1 01             	add    $0x1,%ecx
80104c6a:	84 db                	test   %bl,%bl
80104c6c:	88 59 ff             	mov    %bl,-0x1(%ecx)
80104c6f:	74 04                	je     80104c75 <safestrcpy+0x35>
80104c71:	39 f2                	cmp    %esi,%edx
80104c73:	75 eb                	jne    80104c60 <safestrcpy+0x20>
    ;
  *s = 0;
80104c75:	c6 01 00             	movb   $0x0,(%ecx)
  return os;
}
80104c78:	5b                   	pop    %ebx
80104c79:	5e                   	pop    %esi
80104c7a:	5d                   	pop    %ebp
80104c7b:	c3                   	ret    
80104c7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104c80 <strlen>:

int
strlen(const char *s)
{
80104c80:	55                   	push   %ebp
  int n;

  for(n = 0; s[n]; n++)
80104c81:	31 c0                	xor    %eax,%eax
  return os;
}

int
strlen(const char *s)
{
80104c83:	89 e5                	mov    %esp,%ebp
80104c85:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
80104c88:	80 3a 00             	cmpb   $0x0,(%edx)
80104c8b:	74 0c                	je     80104c99 <strlen+0x19>
80104c8d:	8d 76 00             	lea    0x0(%esi),%esi
80104c90:	83 c0 01             	add    $0x1,%eax
80104c93:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
80104c97:	75 f7                	jne    80104c90 <strlen+0x10>
    ;
  return n;
}
80104c99:	5d                   	pop    %ebp
80104c9a:	c3                   	ret    

80104c9b <swtch>:
# a struct context, and save its address in *old.
# Switch stacks to new and pop previously-saved registers.

.globl swtch
swtch:
  movl 4(%esp), %eax
80104c9b:	8b 44 24 04          	mov    0x4(%esp),%eax
  movl 8(%esp), %edx
80104c9f:	8b 54 24 08          	mov    0x8(%esp),%edx

  # Save old callee-save registers
  pushl %ebp
80104ca3:	55                   	push   %ebp
  pushl %ebx
80104ca4:	53                   	push   %ebx
  pushl %esi
80104ca5:	56                   	push   %esi
  pushl %edi
80104ca6:	57                   	push   %edi

  # Switch stacks
  movl %esp, (%eax)
80104ca7:	89 20                	mov    %esp,(%eax)
  movl %edx, %esp
80104ca9:	89 d4                	mov    %edx,%esp

  # Load new callee-save registers
  popl %edi
80104cab:	5f                   	pop    %edi
  popl %esi
80104cac:	5e                   	pop    %esi
  popl %ebx
80104cad:	5b                   	pop    %ebx
  popl %ebp
80104cae:	5d                   	pop    %ebp
  ret
80104caf:	c3                   	ret    

80104cb0 <fetchint>:
// to a saved program counter, and then the first argument.

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
80104cb0:	55                   	push   %ebp
80104cb1:	89 e5                	mov    %esp,%ebp
80104cb3:	53                   	push   %ebx
80104cb4:	83 ec 04             	sub    $0x4,%esp
80104cb7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct proc *curproc = myproc();
80104cba:	e8 01 ec ff ff       	call   801038c0 <myproc>

  if(addr >= curproc->sz || addr+4 > curproc->sz)
80104cbf:	8b 00                	mov    (%eax),%eax
80104cc1:	39 d8                	cmp    %ebx,%eax
80104cc3:	76 1b                	jbe    80104ce0 <fetchint+0x30>
80104cc5:	8d 53 04             	lea    0x4(%ebx),%edx
80104cc8:	39 d0                	cmp    %edx,%eax
80104cca:	72 14                	jb     80104ce0 <fetchint+0x30>
    return -1;
  *ip = *(int*)(addr);
80104ccc:	8b 45 0c             	mov    0xc(%ebp),%eax
80104ccf:	8b 13                	mov    (%ebx),%edx
80104cd1:	89 10                	mov    %edx,(%eax)
  return 0;
80104cd3:	31 c0                	xor    %eax,%eax
}
80104cd5:	83 c4 04             	add    $0x4,%esp
80104cd8:	5b                   	pop    %ebx
80104cd9:	5d                   	pop    %ebp
80104cda:	c3                   	ret    
80104cdb:	90                   	nop
80104cdc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
fetchint(uint addr, int *ip)
{
  struct proc *curproc = myproc();

  if(addr >= curproc->sz || addr+4 > curproc->sz)
    return -1;
80104ce0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104ce5:	eb ee                	jmp    80104cd5 <fetchint+0x25>
80104ce7:	89 f6                	mov    %esi,%esi
80104ce9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104cf0 <fetchstr>:
// Fetch the nul-terminated string at addr from the current process.
// Doesn't actually copy the string - just sets *pp to point at it.
// Returns length of string, not including nul.
int
fetchstr(uint addr, char **pp)
{
80104cf0:	55                   	push   %ebp
80104cf1:	89 e5                	mov    %esp,%ebp
80104cf3:	53                   	push   %ebx
80104cf4:	83 ec 04             	sub    $0x4,%esp
80104cf7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  char *s, *ep;
  struct proc *curproc = myproc();
80104cfa:	e8 c1 eb ff ff       	call   801038c0 <myproc>

  if(addr >= curproc->sz)
80104cff:	39 18                	cmp    %ebx,(%eax)
80104d01:	76 29                	jbe    80104d2c <fetchstr+0x3c>
    return -1;
  *pp = (char*)addr;
80104d03:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80104d06:	89 da                	mov    %ebx,%edx
80104d08:	89 19                	mov    %ebx,(%ecx)
  ep = (char*)curproc->sz;
80104d0a:	8b 00                	mov    (%eax),%eax
  for(s = *pp; s < ep; s++){
80104d0c:	39 c3                	cmp    %eax,%ebx
80104d0e:	73 1c                	jae    80104d2c <fetchstr+0x3c>
    if(*s == 0)
80104d10:	80 3b 00             	cmpb   $0x0,(%ebx)
80104d13:	75 10                	jne    80104d25 <fetchstr+0x35>
80104d15:	eb 29                	jmp    80104d40 <fetchstr+0x50>
80104d17:	89 f6                	mov    %esi,%esi
80104d19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104d20:	80 3a 00             	cmpb   $0x0,(%edx)
80104d23:	74 1b                	je     80104d40 <fetchstr+0x50>

  if(addr >= curproc->sz)
    return -1;
  *pp = (char*)addr;
  ep = (char*)curproc->sz;
  for(s = *pp; s < ep; s++){
80104d25:	83 c2 01             	add    $0x1,%edx
80104d28:	39 d0                	cmp    %edx,%eax
80104d2a:	77 f4                	ja     80104d20 <fetchstr+0x30>
    if(*s == 0)
      return s - *pp;
  }
  return -1;
}
80104d2c:	83 c4 04             	add    $0x4,%esp
{
  char *s, *ep;
  struct proc *curproc = myproc();

  if(addr >= curproc->sz)
    return -1;
80104d2f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  for(s = *pp; s < ep; s++){
    if(*s == 0)
      return s - *pp;
  }
  return -1;
}
80104d34:	5b                   	pop    %ebx
80104d35:	5d                   	pop    %ebp
80104d36:	c3                   	ret    
80104d37:	89 f6                	mov    %esi,%esi
80104d39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104d40:	83 c4 04             	add    $0x4,%esp
    return -1;
  *pp = (char*)addr;
  ep = (char*)curproc->sz;
  for(s = *pp; s < ep; s++){
    if(*s == 0)
      return s - *pp;
80104d43:	89 d0                	mov    %edx,%eax
80104d45:	29 d8                	sub    %ebx,%eax
  }
  return -1;
}
80104d47:	5b                   	pop    %ebx
80104d48:	5d                   	pop    %ebp
80104d49:	c3                   	ret    
80104d4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104d50 <argint>:

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
80104d50:	55                   	push   %ebp
80104d51:	89 e5                	mov    %esp,%ebp
80104d53:	56                   	push   %esi
80104d54:	53                   	push   %ebx
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
80104d55:	e8 66 eb ff ff       	call   801038c0 <myproc>
80104d5a:	8b 40 18             	mov    0x18(%eax),%eax
80104d5d:	8b 55 08             	mov    0x8(%ebp),%edx
80104d60:	8b 40 44             	mov    0x44(%eax),%eax
80104d63:	8d 1c 90             	lea    (%eax,%edx,4),%ebx

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  struct proc *curproc = myproc();
80104d66:	e8 55 eb ff ff       	call   801038c0 <myproc>

  if(addr >= curproc->sz || addr+4 > curproc->sz)
80104d6b:	8b 00                	mov    (%eax),%eax

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
80104d6d:	8d 73 04             	lea    0x4(%ebx),%esi
int
fetchint(uint addr, int *ip)
{
  struct proc *curproc = myproc();

  if(addr >= curproc->sz || addr+4 > curproc->sz)
80104d70:	39 c6                	cmp    %eax,%esi
80104d72:	73 1c                	jae    80104d90 <argint+0x40>
80104d74:	8d 53 08             	lea    0x8(%ebx),%edx
80104d77:	39 d0                	cmp    %edx,%eax
80104d79:	72 15                	jb     80104d90 <argint+0x40>
    return -1;
  *ip = *(int*)(addr);
80104d7b:	8b 45 0c             	mov    0xc(%ebp),%eax
80104d7e:	8b 53 04             	mov    0x4(%ebx),%edx
80104d81:	89 10                	mov    %edx,(%eax)
  return 0;
80104d83:	31 c0                	xor    %eax,%eax
// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
}
80104d85:	5b                   	pop    %ebx
80104d86:	5e                   	pop    %esi
80104d87:	5d                   	pop    %ebp
80104d88:	c3                   	ret    
80104d89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
fetchint(uint addr, int *ip)
{
  struct proc *curproc = myproc();

  if(addr >= curproc->sz || addr+4 > curproc->sz)
    return -1;
80104d90:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
80104d95:	eb ee                	jmp    80104d85 <argint+0x35>
80104d97:	89 f6                	mov    %esi,%esi
80104d99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104da0 <argptr>:
// Fetch the nth word-sized system call argument as a pointer
// to a block of memory of size bytes.  Check that the pointer
// lies within the process address space.
int
argptr(int n, char **pp, int size)
{
80104da0:	55                   	push   %ebp
80104da1:	89 e5                	mov    %esp,%ebp
80104da3:	56                   	push   %esi
80104da4:	53                   	push   %ebx
80104da5:	83 ec 10             	sub    $0x10,%esp
80104da8:	8b 5d 10             	mov    0x10(%ebp),%ebx
  int i;
  struct proc *curproc = myproc();
80104dab:	e8 10 eb ff ff       	call   801038c0 <myproc>
80104db0:	89 c6                	mov    %eax,%esi
 
  if(argint(n, &i) < 0)
80104db2:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104db5:	83 ec 08             	sub    $0x8,%esp
80104db8:	50                   	push   %eax
80104db9:	ff 75 08             	pushl  0x8(%ebp)
80104dbc:	e8 8f ff ff ff       	call   80104d50 <argint>
80104dc1:	c1 e8 1f             	shr    $0x1f,%eax
    return -1;
  if(size < 0 || (uint)i >= curproc->sz || (uint)i+size > curproc->sz)
80104dc4:	83 c4 10             	add    $0x10,%esp
80104dc7:	84 c0                	test   %al,%al
80104dc9:	75 2d                	jne    80104df8 <argptr+0x58>
80104dcb:	89 d8                	mov    %ebx,%eax
80104dcd:	c1 e8 1f             	shr    $0x1f,%eax
80104dd0:	84 c0                	test   %al,%al
80104dd2:	75 24                	jne    80104df8 <argptr+0x58>
80104dd4:	8b 16                	mov    (%esi),%edx
80104dd6:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104dd9:	39 c2                	cmp    %eax,%edx
80104ddb:	76 1b                	jbe    80104df8 <argptr+0x58>
80104ddd:	01 c3                	add    %eax,%ebx
80104ddf:	39 da                	cmp    %ebx,%edx
80104de1:	72 15                	jb     80104df8 <argptr+0x58>
    return -1;
  *pp = (char*)i;
80104de3:	8b 55 0c             	mov    0xc(%ebp),%edx
80104de6:	89 02                	mov    %eax,(%edx)
  return 0;
80104de8:	31 c0                	xor    %eax,%eax
}
80104dea:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104ded:	5b                   	pop    %ebx
80104dee:	5e                   	pop    %esi
80104def:	5d                   	pop    %ebp
80104df0:	c3                   	ret    
80104df1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  struct proc *curproc = myproc();
 
  if(argint(n, &i) < 0)
    return -1;
  if(size < 0 || (uint)i >= curproc->sz || (uint)i+size > curproc->sz)
    return -1;
80104df8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104dfd:	eb eb                	jmp    80104dea <argptr+0x4a>
80104dff:	90                   	nop

80104e00 <argstr>:
// Check that the pointer is valid and the string is nul-terminated.
// (There is no shared writable memory, so the string can't change
// between this check and being used by the kernel.)
int
argstr(int n, char **pp)
{
80104e00:	55                   	push   %ebp
80104e01:	89 e5                	mov    %esp,%ebp
80104e03:	83 ec 20             	sub    $0x20,%esp
  int addr;
  if(argint(n, &addr) < 0)
80104e06:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104e09:	50                   	push   %eax
80104e0a:	ff 75 08             	pushl  0x8(%ebp)
80104e0d:	e8 3e ff ff ff       	call   80104d50 <argint>
80104e12:	83 c4 10             	add    $0x10,%esp
80104e15:	85 c0                	test   %eax,%eax
80104e17:	78 17                	js     80104e30 <argstr+0x30>
    return -1;
  return fetchstr(addr, pp);
80104e19:	83 ec 08             	sub    $0x8,%esp
80104e1c:	ff 75 0c             	pushl  0xc(%ebp)
80104e1f:	ff 75 f4             	pushl  -0xc(%ebp)
80104e22:	e8 c9 fe ff ff       	call   80104cf0 <fetchstr>
80104e27:	83 c4 10             	add    $0x10,%esp
}
80104e2a:	c9                   	leave  
80104e2b:	c3                   	ret    
80104e2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
int
argstr(int n, char **pp)
{
  int addr;
  if(argint(n, &addr) < 0)
    return -1;
80104e30:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return fetchstr(addr, pp);
}
80104e35:	c9                   	leave  
80104e36:	c3                   	ret    
80104e37:	89 f6                	mov    %esi,%esi
80104e39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104e40 <syscall>:
[SYS_wait2]   sys_wait2,
};

void
syscall(void)
{
80104e40:	55                   	push   %ebp
80104e41:	89 e5                	mov    %esp,%ebp
80104e43:	56                   	push   %esi
80104e44:	53                   	push   %ebx
  int num;
  struct proc *curproc = myproc();
80104e45:	e8 76 ea ff ff       	call   801038c0 <myproc>

  num = curproc->tf->eax;
80104e4a:	8b 70 18             	mov    0x18(%eax),%esi

void
syscall(void)
{
  int num;
  struct proc *curproc = myproc();
80104e4d:	89 c3                	mov    %eax,%ebx

  num = curproc->tf->eax;
80104e4f:	8b 46 1c             	mov    0x1c(%esi),%eax
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
80104e52:	8d 50 ff             	lea    -0x1(%eax),%edx
80104e55:	83 fa 19             	cmp    $0x19,%edx
80104e58:	77 1e                	ja     80104e78 <syscall+0x38>
80104e5a:	8b 14 85 00 7d 10 80 	mov    -0x7fef8300(,%eax,4),%edx
80104e61:	85 d2                	test   %edx,%edx
80104e63:	74 13                	je     80104e78 <syscall+0x38>
    curproc->tf->eax = syscalls[num]();
80104e65:	ff d2                	call   *%edx
80104e67:	89 46 1c             	mov    %eax,0x1c(%esi)
  } else {
    cprintf("%d %s: unknown sys call %d\n",
            curproc->pid, curproc->name, num);
    curproc->tf->eax = -1;
  }
}
80104e6a:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104e6d:	5b                   	pop    %ebx
80104e6e:	5e                   	pop    %esi
80104e6f:	5d                   	pop    %ebp
80104e70:	c3                   	ret    
80104e71:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

  num = curproc->tf->eax;
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
    curproc->tf->eax = syscalls[num]();
  } else {
    cprintf("%d %s: unknown sys call %d\n",
80104e78:	50                   	push   %eax
            curproc->pid, curproc->name, num);
80104e79:	8d 43 6c             	lea    0x6c(%ebx),%eax

  num = curproc->tf->eax;
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
    curproc->tf->eax = syscalls[num]();
  } else {
    cprintf("%d %s: unknown sys call %d\n",
80104e7c:	50                   	push   %eax
80104e7d:	ff 73 10             	pushl  0x10(%ebx)
80104e80:	68 d1 7c 10 80       	push   $0x80107cd1
80104e85:	e8 d6 b7 ff ff       	call   80100660 <cprintf>
            curproc->pid, curproc->name, num);
    curproc->tf->eax = -1;
80104e8a:	8b 43 18             	mov    0x18(%ebx),%eax
80104e8d:	83 c4 10             	add    $0x10,%esp
80104e90:	c7 40 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%eax)
  }
}
80104e97:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104e9a:	5b                   	pop    %ebx
80104e9b:	5e                   	pop    %esi
80104e9c:	5d                   	pop    %ebp
80104e9d:	c3                   	ret    
80104e9e:	66 90                	xchg   %ax,%ax

80104ea0 <create>:
  return -1;
}

static struct inode*
create(char *path, short type, short major, short minor)
{
80104ea0:	55                   	push   %ebp
80104ea1:	89 e5                	mov    %esp,%ebp
80104ea3:	57                   	push   %edi
80104ea4:	56                   	push   %esi
80104ea5:	53                   	push   %ebx
  uint off;
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
80104ea6:	8d 5d da             	lea    -0x26(%ebp),%ebx
  return -1;
}

static struct inode*
create(char *path, short type, short major, short minor)
{
80104ea9:	83 ec 44             	sub    $0x44,%esp
80104eac:	89 4d c0             	mov    %ecx,-0x40(%ebp)
80104eaf:	8b 4d 08             	mov    0x8(%ebp),%ecx
  uint off;
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
80104eb2:	53                   	push   %ebx
80104eb3:	50                   	push   %eax
  return -1;
}

static struct inode*
create(char *path, short type, short major, short minor)
{
80104eb4:	89 55 c4             	mov    %edx,-0x3c(%ebp)
80104eb7:	89 4d bc             	mov    %ecx,-0x44(%ebp)
  uint off;
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
80104eba:	e8 21 d0 ff ff       	call   80101ee0 <nameiparent>
80104ebf:	83 c4 10             	add    $0x10,%esp
80104ec2:	85 c0                	test   %eax,%eax
80104ec4:	0f 84 f6 00 00 00    	je     80104fc0 <create+0x120>
    return 0;
  ilock(dp);
80104eca:	83 ec 0c             	sub    $0xc,%esp
80104ecd:	89 c6                	mov    %eax,%esi
80104ecf:	50                   	push   %eax
80104ed0:	e8 9b c7 ff ff       	call   80101670 <ilock>

  if((ip = dirlookup(dp, name, &off)) != 0){
80104ed5:	8d 45 d4             	lea    -0x2c(%ebp),%eax
80104ed8:	83 c4 0c             	add    $0xc,%esp
80104edb:	50                   	push   %eax
80104edc:	53                   	push   %ebx
80104edd:	56                   	push   %esi
80104ede:	e8 bd cc ff ff       	call   80101ba0 <dirlookup>
80104ee3:	83 c4 10             	add    $0x10,%esp
80104ee6:	85 c0                	test   %eax,%eax
80104ee8:	89 c7                	mov    %eax,%edi
80104eea:	74 54                	je     80104f40 <create+0xa0>
    iunlockput(dp);
80104eec:	83 ec 0c             	sub    $0xc,%esp
80104eef:	56                   	push   %esi
80104ef0:	e8 0b ca ff ff       	call   80101900 <iunlockput>
    ilock(ip);
80104ef5:	89 3c 24             	mov    %edi,(%esp)
80104ef8:	e8 73 c7 ff ff       	call   80101670 <ilock>
    if(type == T_FILE && ip->type == T_FILE)
80104efd:	83 c4 10             	add    $0x10,%esp
80104f00:	66 83 7d c4 02       	cmpw   $0x2,-0x3c(%ebp)
80104f05:	75 19                	jne    80104f20 <create+0x80>
80104f07:	66 83 7f 50 02       	cmpw   $0x2,0x50(%edi)
80104f0c:	75 12                	jne    80104f20 <create+0x80>
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
}
80104f0e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104f11:	89 f8                	mov    %edi,%eax
80104f13:	5b                   	pop    %ebx
80104f14:	5e                   	pop    %esi
80104f15:	5f                   	pop    %edi
80104f16:	5d                   	pop    %ebp
80104f17:	c3                   	ret    
80104f18:	90                   	nop
80104f19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  if((ip = dirlookup(dp, name, &off)) != 0){
    iunlockput(dp);
    ilock(ip);
    if(type == T_FILE && ip->type == T_FILE)
      return ip;
    iunlockput(ip);
80104f20:	83 ec 0c             	sub    $0xc,%esp
80104f23:	57                   	push   %edi
    return 0;
80104f24:	31 ff                	xor    %edi,%edi
  if((ip = dirlookup(dp, name, &off)) != 0){
    iunlockput(dp);
    ilock(ip);
    if(type == T_FILE && ip->type == T_FILE)
      return ip;
    iunlockput(ip);
80104f26:	e8 d5 c9 ff ff       	call   80101900 <iunlockput>
    return 0;
80104f2b:	83 c4 10             	add    $0x10,%esp
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
}
80104f2e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104f31:	89 f8                	mov    %edi,%eax
80104f33:	5b                   	pop    %ebx
80104f34:	5e                   	pop    %esi
80104f35:	5f                   	pop    %edi
80104f36:	5d                   	pop    %ebp
80104f37:	c3                   	ret    
80104f38:	90                   	nop
80104f39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      return ip;
    iunlockput(ip);
    return 0;
  }

  if((ip = ialloc(dp->dev, type)) == 0)
80104f40:	0f bf 45 c4          	movswl -0x3c(%ebp),%eax
80104f44:	83 ec 08             	sub    $0x8,%esp
80104f47:	50                   	push   %eax
80104f48:	ff 36                	pushl  (%esi)
80104f4a:	e8 b1 c5 ff ff       	call   80101500 <ialloc>
80104f4f:	83 c4 10             	add    $0x10,%esp
80104f52:	85 c0                	test   %eax,%eax
80104f54:	89 c7                	mov    %eax,%edi
80104f56:	0f 84 cc 00 00 00    	je     80105028 <create+0x188>
    panic("create: ialloc");

  ilock(ip);
80104f5c:	83 ec 0c             	sub    $0xc,%esp
80104f5f:	50                   	push   %eax
80104f60:	e8 0b c7 ff ff       	call   80101670 <ilock>
  ip->major = major;
80104f65:	0f b7 45 c0          	movzwl -0x40(%ebp),%eax
80104f69:	66 89 47 52          	mov    %ax,0x52(%edi)
  ip->minor = minor;
80104f6d:	0f b7 45 bc          	movzwl -0x44(%ebp),%eax
80104f71:	66 89 47 54          	mov    %ax,0x54(%edi)
  ip->nlink = 1;
80104f75:	b8 01 00 00 00       	mov    $0x1,%eax
80104f7a:	66 89 47 56          	mov    %ax,0x56(%edi)
  iupdate(ip);
80104f7e:	89 3c 24             	mov    %edi,(%esp)
80104f81:	e8 3a c6 ff ff       	call   801015c0 <iupdate>

  if(type == T_DIR){  // Create . and .. entries.
80104f86:	83 c4 10             	add    $0x10,%esp
80104f89:	66 83 7d c4 01       	cmpw   $0x1,-0x3c(%ebp)
80104f8e:	74 40                	je     80104fd0 <create+0x130>
    // No ip->nlink++ for ".": avoid cyclic ref count.
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
      panic("create dots");
  }

  if(dirlink(dp, name, ip->inum) < 0)
80104f90:	83 ec 04             	sub    $0x4,%esp
80104f93:	ff 77 04             	pushl  0x4(%edi)
80104f96:	53                   	push   %ebx
80104f97:	56                   	push   %esi
80104f98:	e8 63 ce ff ff       	call   80101e00 <dirlink>
80104f9d:	83 c4 10             	add    $0x10,%esp
80104fa0:	85 c0                	test   %eax,%eax
80104fa2:	78 77                	js     8010501b <create+0x17b>
    panic("create: dirlink");

  iunlockput(dp);
80104fa4:	83 ec 0c             	sub    $0xc,%esp
80104fa7:	56                   	push   %esi
80104fa8:	e8 53 c9 ff ff       	call   80101900 <iunlockput>

  return ip;
80104fad:	83 c4 10             	add    $0x10,%esp
}
80104fb0:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104fb3:	89 f8                	mov    %edi,%eax
80104fb5:	5b                   	pop    %ebx
80104fb6:	5e                   	pop    %esi
80104fb7:	5f                   	pop    %edi
80104fb8:	5d                   	pop    %ebp
80104fb9:	c3                   	ret    
80104fba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  uint off;
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
    return 0;
80104fc0:	31 ff                	xor    %edi,%edi
80104fc2:	e9 47 ff ff ff       	jmp    80104f0e <create+0x6e>
80104fc7:	89 f6                	mov    %esi,%esi
80104fc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  ip->minor = minor;
  ip->nlink = 1;
  iupdate(ip);

  if(type == T_DIR){  // Create . and .. entries.
    dp->nlink++;  // for ".."
80104fd0:	66 83 46 56 01       	addw   $0x1,0x56(%esi)
    iupdate(dp);
80104fd5:	83 ec 0c             	sub    $0xc,%esp
80104fd8:	56                   	push   %esi
80104fd9:	e8 e2 c5 ff ff       	call   801015c0 <iupdate>
    // No ip->nlink++ for ".": avoid cyclic ref count.
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
80104fde:	83 c4 0c             	add    $0xc,%esp
80104fe1:	ff 77 04             	pushl  0x4(%edi)
80104fe4:	68 88 7d 10 80       	push   $0x80107d88
80104fe9:	57                   	push   %edi
80104fea:	e8 11 ce ff ff       	call   80101e00 <dirlink>
80104fef:	83 c4 10             	add    $0x10,%esp
80104ff2:	85 c0                	test   %eax,%eax
80104ff4:	78 18                	js     8010500e <create+0x16e>
80104ff6:	83 ec 04             	sub    $0x4,%esp
80104ff9:	ff 76 04             	pushl  0x4(%esi)
80104ffc:	68 87 7d 10 80       	push   $0x80107d87
80105001:	57                   	push   %edi
80105002:	e8 f9 cd ff ff       	call   80101e00 <dirlink>
80105007:	83 c4 10             	add    $0x10,%esp
8010500a:	85 c0                	test   %eax,%eax
8010500c:	79 82                	jns    80104f90 <create+0xf0>
      panic("create dots");
8010500e:	83 ec 0c             	sub    $0xc,%esp
80105011:	68 7b 7d 10 80       	push   $0x80107d7b
80105016:	e8 55 b3 ff ff       	call   80100370 <panic>
  }

  if(dirlink(dp, name, ip->inum) < 0)
    panic("create: dirlink");
8010501b:	83 ec 0c             	sub    $0xc,%esp
8010501e:	68 8a 7d 10 80       	push   $0x80107d8a
80105023:	e8 48 b3 ff ff       	call   80100370 <panic>
    iunlockput(ip);
    return 0;
  }

  if((ip = ialloc(dp->dev, type)) == 0)
    panic("create: ialloc");
80105028:	83 ec 0c             	sub    $0xc,%esp
8010502b:	68 6c 7d 10 80       	push   $0x80107d6c
80105030:	e8 3b b3 ff ff       	call   80100370 <panic>
80105035:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105039:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105040 <argfd.constprop.0>:
#include "fcntl.h"

// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int
argfd(int n, int *pfd, struct file **pf)
80105040:	55                   	push   %ebp
80105041:	89 e5                	mov    %esp,%ebp
80105043:	56                   	push   %esi
80105044:	53                   	push   %ebx
80105045:	89 c6                	mov    %eax,%esi
{
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
80105047:	8d 45 f4             	lea    -0xc(%ebp),%eax
#include "fcntl.h"

// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int
argfd(int n, int *pfd, struct file **pf)
8010504a:	89 d3                	mov    %edx,%ebx
8010504c:	83 ec 18             	sub    $0x18,%esp
{
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
8010504f:	50                   	push   %eax
80105050:	6a 00                	push   $0x0
80105052:	e8 f9 fc ff ff       	call   80104d50 <argint>
80105057:	83 c4 10             	add    $0x10,%esp
8010505a:	85 c0                	test   %eax,%eax
8010505c:	78 32                	js     80105090 <argfd.constprop.0+0x50>
    return -1;
  if(fd < 0 || fd >= NOFILE || (f=myproc()->ofile[fd]) == 0)
8010505e:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
80105062:	77 2c                	ja     80105090 <argfd.constprop.0+0x50>
80105064:	e8 57 e8 ff ff       	call   801038c0 <myproc>
80105069:	8b 55 f4             	mov    -0xc(%ebp),%edx
8010506c:	8b 44 90 28          	mov    0x28(%eax,%edx,4),%eax
80105070:	85 c0                	test   %eax,%eax
80105072:	74 1c                	je     80105090 <argfd.constprop.0+0x50>
    return -1;
  if(pfd)
80105074:	85 f6                	test   %esi,%esi
80105076:	74 02                	je     8010507a <argfd.constprop.0+0x3a>
    *pfd = fd;
80105078:	89 16                	mov    %edx,(%esi)
  if(pf)
8010507a:	85 db                	test   %ebx,%ebx
8010507c:	74 22                	je     801050a0 <argfd.constprop.0+0x60>
    *pf = f;
8010507e:	89 03                	mov    %eax,(%ebx)
  return 0;
80105080:	31 c0                	xor    %eax,%eax
}
80105082:	8d 65 f8             	lea    -0x8(%ebp),%esp
80105085:	5b                   	pop    %ebx
80105086:	5e                   	pop    %esi
80105087:	5d                   	pop    %ebp
80105088:	c3                   	ret    
80105089:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105090:	8d 65 f8             	lea    -0x8(%ebp),%esp
{
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
    return -1;
80105093:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  if(pfd)
    *pfd = fd;
  if(pf)
    *pf = f;
  return 0;
}
80105098:	5b                   	pop    %ebx
80105099:	5e                   	pop    %esi
8010509a:	5d                   	pop    %ebp
8010509b:	c3                   	ret    
8010509c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
  if(pfd)
    *pfd = fd;
  if(pf)
    *pf = f;
  return 0;
801050a0:	31 c0                	xor    %eax,%eax
801050a2:	eb de                	jmp    80105082 <argfd.constprop.0+0x42>
801050a4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801050aa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801050b0 <sys_dup>:
  return -1;
}

int
sys_dup(void)
{
801050b0:	55                   	push   %ebp
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
801050b1:	31 c0                	xor    %eax,%eax
  return -1;
}

int
sys_dup(void)
{
801050b3:	89 e5                	mov    %esp,%ebp
801050b5:	56                   	push   %esi
801050b6:	53                   	push   %ebx
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
801050b7:	8d 55 f4             	lea    -0xc(%ebp),%edx
  return -1;
}

int
sys_dup(void)
{
801050ba:	83 ec 10             	sub    $0x10,%esp
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
801050bd:	e8 7e ff ff ff       	call   80105040 <argfd.constprop.0>
801050c2:	85 c0                	test   %eax,%eax
801050c4:	78 1a                	js     801050e0 <sys_dup+0x30>
fdalloc(struct file *f)
{
  int fd;
  struct proc *curproc = myproc();

  for(fd = 0; fd < NOFILE; fd++){
801050c6:	31 db                	xor    %ebx,%ebx
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
    return -1;
  if((fd=fdalloc(f)) < 0)
801050c8:	8b 75 f4             	mov    -0xc(%ebp),%esi
// Takes over file reference from caller on success.
static int
fdalloc(struct file *f)
{
  int fd;
  struct proc *curproc = myproc();
801050cb:	e8 f0 e7 ff ff       	call   801038c0 <myproc>

  for(fd = 0; fd < NOFILE; fd++){
    if(curproc->ofile[fd] == 0){
801050d0:	8b 54 98 28          	mov    0x28(%eax,%ebx,4),%edx
801050d4:	85 d2                	test   %edx,%edx
801050d6:	74 18                	je     801050f0 <sys_dup+0x40>
fdalloc(struct file *f)
{
  int fd;
  struct proc *curproc = myproc();

  for(fd = 0; fd < NOFILE; fd++){
801050d8:	83 c3 01             	add    $0x1,%ebx
801050db:	83 fb 10             	cmp    $0x10,%ebx
801050de:	75 f0                	jne    801050d0 <sys_dup+0x20>
    return -1;
  if((fd=fdalloc(f)) < 0)
    return -1;
  filedup(f);
  return fd;
}
801050e0:	8d 65 f8             	lea    -0x8(%ebp),%esp
{
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
    return -1;
801050e3:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
  if((fd=fdalloc(f)) < 0)
    return -1;
  filedup(f);
  return fd;
}
801050e8:	89 d8                	mov    %ebx,%eax
801050ea:	5b                   	pop    %ebx
801050eb:	5e                   	pop    %esi
801050ec:	5d                   	pop    %ebp
801050ed:	c3                   	ret    
801050ee:	66 90                	xchg   %ax,%ax
  int fd;
  struct proc *curproc = myproc();

  for(fd = 0; fd < NOFILE; fd++){
    if(curproc->ofile[fd] == 0){
      curproc->ofile[fd] = f;
801050f0:	89 74 98 28          	mov    %esi,0x28(%eax,%ebx,4)

  if(argfd(0, 0, &f) < 0)
    return -1;
  if((fd=fdalloc(f)) < 0)
    return -1;
  filedup(f);
801050f4:	83 ec 0c             	sub    $0xc,%esp
801050f7:	ff 75 f4             	pushl  -0xc(%ebp)
801050fa:	e8 d1 bc ff ff       	call   80100dd0 <filedup>
  return fd;
801050ff:	83 c4 10             	add    $0x10,%esp
}
80105102:	8d 65 f8             	lea    -0x8(%ebp),%esp
80105105:	89 d8                	mov    %ebx,%eax
80105107:	5b                   	pop    %ebx
80105108:	5e                   	pop    %esi
80105109:	5d                   	pop    %ebp
8010510a:	c3                   	ret    
8010510b:	90                   	nop
8010510c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105110 <sys_read>:

int
sys_read(void)
{
80105110:	55                   	push   %ebp
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80105111:	31 c0                	xor    %eax,%eax
  return fd;
}

int
sys_read(void)
{
80105113:	89 e5                	mov    %esp,%ebp
80105115:	83 ec 18             	sub    $0x18,%esp
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80105118:	8d 55 ec             	lea    -0x14(%ebp),%edx
8010511b:	e8 20 ff ff ff       	call   80105040 <argfd.constprop.0>
80105120:	85 c0                	test   %eax,%eax
80105122:	78 4c                	js     80105170 <sys_read+0x60>
80105124:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105127:	83 ec 08             	sub    $0x8,%esp
8010512a:	50                   	push   %eax
8010512b:	6a 02                	push   $0x2
8010512d:	e8 1e fc ff ff       	call   80104d50 <argint>
80105132:	83 c4 10             	add    $0x10,%esp
80105135:	85 c0                	test   %eax,%eax
80105137:	78 37                	js     80105170 <sys_read+0x60>
80105139:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010513c:	83 ec 04             	sub    $0x4,%esp
8010513f:	ff 75 f0             	pushl  -0x10(%ebp)
80105142:	50                   	push   %eax
80105143:	6a 01                	push   $0x1
80105145:	e8 56 fc ff ff       	call   80104da0 <argptr>
8010514a:	83 c4 10             	add    $0x10,%esp
8010514d:	85 c0                	test   %eax,%eax
8010514f:	78 1f                	js     80105170 <sys_read+0x60>
    return -1;
  return fileread(f, p, n);
80105151:	83 ec 04             	sub    $0x4,%esp
80105154:	ff 75 f0             	pushl  -0x10(%ebp)
80105157:	ff 75 f4             	pushl  -0xc(%ebp)
8010515a:	ff 75 ec             	pushl  -0x14(%ebp)
8010515d:	e8 de bd ff ff       	call   80100f40 <fileread>
80105162:	83 c4 10             	add    $0x10,%esp
}
80105165:	c9                   	leave  
80105166:	c3                   	ret    
80105167:	89 f6                	mov    %esi,%esi
80105169:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
    return -1;
80105170:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return fileread(f, p, n);
}
80105175:	c9                   	leave  
80105176:	c3                   	ret    
80105177:	89 f6                	mov    %esi,%esi
80105179:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105180 <sys_write>:

int
sys_write(void)
{
80105180:	55                   	push   %ebp
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80105181:	31 c0                	xor    %eax,%eax
  return fileread(f, p, n);
}

int
sys_write(void)
{
80105183:	89 e5                	mov    %esp,%ebp
80105185:	83 ec 18             	sub    $0x18,%esp
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80105188:	8d 55 ec             	lea    -0x14(%ebp),%edx
8010518b:	e8 b0 fe ff ff       	call   80105040 <argfd.constprop.0>
80105190:	85 c0                	test   %eax,%eax
80105192:	78 4c                	js     801051e0 <sys_write+0x60>
80105194:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105197:	83 ec 08             	sub    $0x8,%esp
8010519a:	50                   	push   %eax
8010519b:	6a 02                	push   $0x2
8010519d:	e8 ae fb ff ff       	call   80104d50 <argint>
801051a2:	83 c4 10             	add    $0x10,%esp
801051a5:	85 c0                	test   %eax,%eax
801051a7:	78 37                	js     801051e0 <sys_write+0x60>
801051a9:	8d 45 f4             	lea    -0xc(%ebp),%eax
801051ac:	83 ec 04             	sub    $0x4,%esp
801051af:	ff 75 f0             	pushl  -0x10(%ebp)
801051b2:	50                   	push   %eax
801051b3:	6a 01                	push   $0x1
801051b5:	e8 e6 fb ff ff       	call   80104da0 <argptr>
801051ba:	83 c4 10             	add    $0x10,%esp
801051bd:	85 c0                	test   %eax,%eax
801051bf:	78 1f                	js     801051e0 <sys_write+0x60>
    return -1;
  return filewrite(f, p, n);
801051c1:	83 ec 04             	sub    $0x4,%esp
801051c4:	ff 75 f0             	pushl  -0x10(%ebp)
801051c7:	ff 75 f4             	pushl  -0xc(%ebp)
801051ca:	ff 75 ec             	pushl  -0x14(%ebp)
801051cd:	e8 fe bd ff ff       	call   80100fd0 <filewrite>
801051d2:	83 c4 10             	add    $0x10,%esp
}
801051d5:	c9                   	leave  
801051d6:	c3                   	ret    
801051d7:	89 f6                	mov    %esi,%esi
801051d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
    return -1;
801051e0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return filewrite(f, p, n);
}
801051e5:	c9                   	leave  
801051e6:	c3                   	ret    
801051e7:	89 f6                	mov    %esi,%esi
801051e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801051f0 <sys_close>:

int
sys_close(void)
{
801051f0:	55                   	push   %ebp
801051f1:	89 e5                	mov    %esp,%ebp
801051f3:	83 ec 18             	sub    $0x18,%esp
  int fd;
  struct file *f;

  if(argfd(0, &fd, &f) < 0)
801051f6:	8d 55 f4             	lea    -0xc(%ebp),%edx
801051f9:	8d 45 f0             	lea    -0x10(%ebp),%eax
801051fc:	e8 3f fe ff ff       	call   80105040 <argfd.constprop.0>
80105201:	85 c0                	test   %eax,%eax
80105203:	78 2b                	js     80105230 <sys_close+0x40>
    return -1;
  myproc()->ofile[fd] = 0;
80105205:	e8 b6 e6 ff ff       	call   801038c0 <myproc>
8010520a:	8b 55 f0             	mov    -0x10(%ebp),%edx
  fileclose(f);
8010520d:	83 ec 0c             	sub    $0xc,%esp
  int fd;
  struct file *f;

  if(argfd(0, &fd, &f) < 0)
    return -1;
  myproc()->ofile[fd] = 0;
80105210:	c7 44 90 28 00 00 00 	movl   $0x0,0x28(%eax,%edx,4)
80105217:	00 
  fileclose(f);
80105218:	ff 75 f4             	pushl  -0xc(%ebp)
8010521b:	e8 00 bc ff ff       	call   80100e20 <fileclose>
  return 0;
80105220:	83 c4 10             	add    $0x10,%esp
80105223:	31 c0                	xor    %eax,%eax
}
80105225:	c9                   	leave  
80105226:	c3                   	ret    
80105227:	89 f6                	mov    %esi,%esi
80105229:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
{
  int fd;
  struct file *f;

  if(argfd(0, &fd, &f) < 0)
    return -1;
80105230:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  myproc()->ofile[fd] = 0;
  fileclose(f);
  return 0;
}
80105235:	c9                   	leave  
80105236:	c3                   	ret    
80105237:	89 f6                	mov    %esi,%esi
80105239:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105240 <sys_fstat>:

int
sys_fstat(void)
{
80105240:	55                   	push   %ebp
  struct file *f;
  struct stat *st;

  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
80105241:	31 c0                	xor    %eax,%eax
  return 0;
}

int
sys_fstat(void)
{
80105243:	89 e5                	mov    %esp,%ebp
80105245:	83 ec 18             	sub    $0x18,%esp
  struct file *f;
  struct stat *st;

  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
80105248:	8d 55 f0             	lea    -0x10(%ebp),%edx
8010524b:	e8 f0 fd ff ff       	call   80105040 <argfd.constprop.0>
80105250:	85 c0                	test   %eax,%eax
80105252:	78 2c                	js     80105280 <sys_fstat+0x40>
80105254:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105257:	83 ec 04             	sub    $0x4,%esp
8010525a:	6a 14                	push   $0x14
8010525c:	50                   	push   %eax
8010525d:	6a 01                	push   $0x1
8010525f:	e8 3c fb ff ff       	call   80104da0 <argptr>
80105264:	83 c4 10             	add    $0x10,%esp
80105267:	85 c0                	test   %eax,%eax
80105269:	78 15                	js     80105280 <sys_fstat+0x40>
    return -1;
  return filestat(f, st);
8010526b:	83 ec 08             	sub    $0x8,%esp
8010526e:	ff 75 f4             	pushl  -0xc(%ebp)
80105271:	ff 75 f0             	pushl  -0x10(%ebp)
80105274:	e8 77 bc ff ff       	call   80100ef0 <filestat>
80105279:	83 c4 10             	add    $0x10,%esp
}
8010527c:	c9                   	leave  
8010527d:	c3                   	ret    
8010527e:	66 90                	xchg   %ax,%ax
{
  struct file *f;
  struct stat *st;

  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
    return -1;
80105280:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return filestat(f, st);
}
80105285:	c9                   	leave  
80105286:	c3                   	ret    
80105287:	89 f6                	mov    %esi,%esi
80105289:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105290 <sys_link>:

// Create the path new as a link to the same inode as old.
int
sys_link(void)
{
80105290:	55                   	push   %ebp
80105291:	89 e5                	mov    %esp,%ebp
80105293:	57                   	push   %edi
80105294:	56                   	push   %esi
80105295:	53                   	push   %ebx
  char name[DIRSIZ], *new, *old;
  struct inode *dp, *ip;

  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
80105296:	8d 45 d4             	lea    -0x2c(%ebp),%eax
}

// Create the path new as a link to the same inode as old.
int
sys_link(void)
{
80105299:	83 ec 34             	sub    $0x34,%esp
  char name[DIRSIZ], *new, *old;
  struct inode *dp, *ip;

  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
8010529c:	50                   	push   %eax
8010529d:	6a 00                	push   $0x0
8010529f:	e8 5c fb ff ff       	call   80104e00 <argstr>
801052a4:	83 c4 10             	add    $0x10,%esp
801052a7:	85 c0                	test   %eax,%eax
801052a9:	0f 88 fb 00 00 00    	js     801053aa <sys_link+0x11a>
801052af:	8d 45 d0             	lea    -0x30(%ebp),%eax
801052b2:	83 ec 08             	sub    $0x8,%esp
801052b5:	50                   	push   %eax
801052b6:	6a 01                	push   $0x1
801052b8:	e8 43 fb ff ff       	call   80104e00 <argstr>
801052bd:	83 c4 10             	add    $0x10,%esp
801052c0:	85 c0                	test   %eax,%eax
801052c2:	0f 88 e2 00 00 00    	js     801053aa <sys_link+0x11a>
    return -1;

  begin_op();
801052c8:	e8 a3 d8 ff ff       	call   80102b70 <begin_op>
  if((ip = namei(old)) == 0){
801052cd:	83 ec 0c             	sub    $0xc,%esp
801052d0:	ff 75 d4             	pushl  -0x2c(%ebp)
801052d3:	e8 e8 cb ff ff       	call   80101ec0 <namei>
801052d8:	83 c4 10             	add    $0x10,%esp
801052db:	85 c0                	test   %eax,%eax
801052dd:	89 c3                	mov    %eax,%ebx
801052df:	0f 84 f3 00 00 00    	je     801053d8 <sys_link+0x148>
    end_op();
    return -1;
  }

  ilock(ip);
801052e5:	83 ec 0c             	sub    $0xc,%esp
801052e8:	50                   	push   %eax
801052e9:	e8 82 c3 ff ff       	call   80101670 <ilock>
  if(ip->type == T_DIR){
801052ee:	83 c4 10             	add    $0x10,%esp
801052f1:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
801052f6:	0f 84 c4 00 00 00    	je     801053c0 <sys_link+0x130>
    iunlockput(ip);
    end_op();
    return -1;
  }

  ip->nlink++;
801052fc:	66 83 43 56 01       	addw   $0x1,0x56(%ebx)
  iupdate(ip);
80105301:	83 ec 0c             	sub    $0xc,%esp
  iunlock(ip);

  if((dp = nameiparent(new, name)) == 0)
80105304:	8d 7d da             	lea    -0x26(%ebp),%edi
    end_op();
    return -1;
  }

  ip->nlink++;
  iupdate(ip);
80105307:	53                   	push   %ebx
80105308:	e8 b3 c2 ff ff       	call   801015c0 <iupdate>
  iunlock(ip);
8010530d:	89 1c 24             	mov    %ebx,(%esp)
80105310:	e8 3b c4 ff ff       	call   80101750 <iunlock>

  if((dp = nameiparent(new, name)) == 0)
80105315:	58                   	pop    %eax
80105316:	5a                   	pop    %edx
80105317:	57                   	push   %edi
80105318:	ff 75 d0             	pushl  -0x30(%ebp)
8010531b:	e8 c0 cb ff ff       	call   80101ee0 <nameiparent>
80105320:	83 c4 10             	add    $0x10,%esp
80105323:	85 c0                	test   %eax,%eax
80105325:	89 c6                	mov    %eax,%esi
80105327:	74 5b                	je     80105384 <sys_link+0xf4>
    goto bad;
  ilock(dp);
80105329:	83 ec 0c             	sub    $0xc,%esp
8010532c:	50                   	push   %eax
8010532d:	e8 3e c3 ff ff       	call   80101670 <ilock>
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
80105332:	83 c4 10             	add    $0x10,%esp
80105335:	8b 03                	mov    (%ebx),%eax
80105337:	39 06                	cmp    %eax,(%esi)
80105339:	75 3d                	jne    80105378 <sys_link+0xe8>
8010533b:	83 ec 04             	sub    $0x4,%esp
8010533e:	ff 73 04             	pushl  0x4(%ebx)
80105341:	57                   	push   %edi
80105342:	56                   	push   %esi
80105343:	e8 b8 ca ff ff       	call   80101e00 <dirlink>
80105348:	83 c4 10             	add    $0x10,%esp
8010534b:	85 c0                	test   %eax,%eax
8010534d:	78 29                	js     80105378 <sys_link+0xe8>
    iunlockput(dp);
    goto bad;
  }
  iunlockput(dp);
8010534f:	83 ec 0c             	sub    $0xc,%esp
80105352:	56                   	push   %esi
80105353:	e8 a8 c5 ff ff       	call   80101900 <iunlockput>
  iput(ip);
80105358:	89 1c 24             	mov    %ebx,(%esp)
8010535b:	e8 40 c4 ff ff       	call   801017a0 <iput>

  end_op();
80105360:	e8 7b d8 ff ff       	call   80102be0 <end_op>

  return 0;
80105365:	83 c4 10             	add    $0x10,%esp
80105368:	31 c0                	xor    %eax,%eax
  ip->nlink--;
  iupdate(ip);
  iunlockput(ip);
  end_op();
  return -1;
}
8010536a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010536d:	5b                   	pop    %ebx
8010536e:	5e                   	pop    %esi
8010536f:	5f                   	pop    %edi
80105370:	5d                   	pop    %ebp
80105371:	c3                   	ret    
80105372:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  if((dp = nameiparent(new, name)) == 0)
    goto bad;
  ilock(dp);
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
    iunlockput(dp);
80105378:	83 ec 0c             	sub    $0xc,%esp
8010537b:	56                   	push   %esi
8010537c:	e8 7f c5 ff ff       	call   80101900 <iunlockput>
    goto bad;
80105381:	83 c4 10             	add    $0x10,%esp
  end_op();

  return 0;

bad:
  ilock(ip);
80105384:	83 ec 0c             	sub    $0xc,%esp
80105387:	53                   	push   %ebx
80105388:	e8 e3 c2 ff ff       	call   80101670 <ilock>
  ip->nlink--;
8010538d:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
  iupdate(ip);
80105392:	89 1c 24             	mov    %ebx,(%esp)
80105395:	e8 26 c2 ff ff       	call   801015c0 <iupdate>
  iunlockput(ip);
8010539a:	89 1c 24             	mov    %ebx,(%esp)
8010539d:	e8 5e c5 ff ff       	call   80101900 <iunlockput>
  end_op();
801053a2:	e8 39 d8 ff ff       	call   80102be0 <end_op>
  return -1;
801053a7:	83 c4 10             	add    $0x10,%esp
}
801053aa:	8d 65 f4             	lea    -0xc(%ebp),%esp
  ilock(ip);
  ip->nlink--;
  iupdate(ip);
  iunlockput(ip);
  end_op();
  return -1;
801053ad:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801053b2:	5b                   	pop    %ebx
801053b3:	5e                   	pop    %esi
801053b4:	5f                   	pop    %edi
801053b5:	5d                   	pop    %ebp
801053b6:	c3                   	ret    
801053b7:	89 f6                	mov    %esi,%esi
801053b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    return -1;
  }

  ilock(ip);
  if(ip->type == T_DIR){
    iunlockput(ip);
801053c0:	83 ec 0c             	sub    $0xc,%esp
801053c3:	53                   	push   %ebx
801053c4:	e8 37 c5 ff ff       	call   80101900 <iunlockput>
    end_op();
801053c9:	e8 12 d8 ff ff       	call   80102be0 <end_op>
    return -1;
801053ce:	83 c4 10             	add    $0x10,%esp
801053d1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801053d6:	eb 92                	jmp    8010536a <sys_link+0xda>
  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
    return -1;

  begin_op();
  if((ip = namei(old)) == 0){
    end_op();
801053d8:	e8 03 d8 ff ff       	call   80102be0 <end_op>
    return -1;
801053dd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801053e2:	eb 86                	jmp    8010536a <sys_link+0xda>
801053e4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801053ea:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801053f0 <sys_unlink>:
}

//PAGEBREAK!
int
sys_unlink(void)
{
801053f0:	55                   	push   %ebp
801053f1:	89 e5                	mov    %esp,%ebp
801053f3:	57                   	push   %edi
801053f4:	56                   	push   %esi
801053f5:	53                   	push   %ebx
  struct inode *ip, *dp;
  struct dirent de;
  char name[DIRSIZ], *path;
  uint off;

  if(argstr(0, &path) < 0)
801053f6:	8d 45 c0             	lea    -0x40(%ebp),%eax
}

//PAGEBREAK!
int
sys_unlink(void)
{
801053f9:	83 ec 54             	sub    $0x54,%esp
  struct inode *ip, *dp;
  struct dirent de;
  char name[DIRSIZ], *path;
  uint off;

  if(argstr(0, &path) < 0)
801053fc:	50                   	push   %eax
801053fd:	6a 00                	push   $0x0
801053ff:	e8 fc f9 ff ff       	call   80104e00 <argstr>
80105404:	83 c4 10             	add    $0x10,%esp
80105407:	85 c0                	test   %eax,%eax
80105409:	0f 88 82 01 00 00    	js     80105591 <sys_unlink+0x1a1>
    return -1;

  begin_op();
  if((dp = nameiparent(path, name)) == 0){
8010540f:	8d 5d ca             	lea    -0x36(%ebp),%ebx
  uint off;

  if(argstr(0, &path) < 0)
    return -1;

  begin_op();
80105412:	e8 59 d7 ff ff       	call   80102b70 <begin_op>
  if((dp = nameiparent(path, name)) == 0){
80105417:	83 ec 08             	sub    $0x8,%esp
8010541a:	53                   	push   %ebx
8010541b:	ff 75 c0             	pushl  -0x40(%ebp)
8010541e:	e8 bd ca ff ff       	call   80101ee0 <nameiparent>
80105423:	83 c4 10             	add    $0x10,%esp
80105426:	85 c0                	test   %eax,%eax
80105428:	89 45 b4             	mov    %eax,-0x4c(%ebp)
8010542b:	0f 84 6a 01 00 00    	je     8010559b <sys_unlink+0x1ab>
    end_op();
    return -1;
  }

  ilock(dp);
80105431:	8b 75 b4             	mov    -0x4c(%ebp),%esi
80105434:	83 ec 0c             	sub    $0xc,%esp
80105437:	56                   	push   %esi
80105438:	e8 33 c2 ff ff       	call   80101670 <ilock>

  // Cannot unlink "." or "..".
  if(namecmp(name, ".") == 0 || namecmp(name, "..") == 0)
8010543d:	58                   	pop    %eax
8010543e:	5a                   	pop    %edx
8010543f:	68 88 7d 10 80       	push   $0x80107d88
80105444:	53                   	push   %ebx
80105445:	e8 36 c7 ff ff       	call   80101b80 <namecmp>
8010544a:	83 c4 10             	add    $0x10,%esp
8010544d:	85 c0                	test   %eax,%eax
8010544f:	0f 84 fc 00 00 00    	je     80105551 <sys_unlink+0x161>
80105455:	83 ec 08             	sub    $0x8,%esp
80105458:	68 87 7d 10 80       	push   $0x80107d87
8010545d:	53                   	push   %ebx
8010545e:	e8 1d c7 ff ff       	call   80101b80 <namecmp>
80105463:	83 c4 10             	add    $0x10,%esp
80105466:	85 c0                	test   %eax,%eax
80105468:	0f 84 e3 00 00 00    	je     80105551 <sys_unlink+0x161>
    goto bad;

  if((ip = dirlookup(dp, name, &off)) == 0)
8010546e:	8d 45 c4             	lea    -0x3c(%ebp),%eax
80105471:	83 ec 04             	sub    $0x4,%esp
80105474:	50                   	push   %eax
80105475:	53                   	push   %ebx
80105476:	56                   	push   %esi
80105477:	e8 24 c7 ff ff       	call   80101ba0 <dirlookup>
8010547c:	83 c4 10             	add    $0x10,%esp
8010547f:	85 c0                	test   %eax,%eax
80105481:	89 c3                	mov    %eax,%ebx
80105483:	0f 84 c8 00 00 00    	je     80105551 <sys_unlink+0x161>
    goto bad;
  ilock(ip);
80105489:	83 ec 0c             	sub    $0xc,%esp
8010548c:	50                   	push   %eax
8010548d:	e8 de c1 ff ff       	call   80101670 <ilock>

  if(ip->nlink < 1)
80105492:	83 c4 10             	add    $0x10,%esp
80105495:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
8010549a:	0f 8e 24 01 00 00    	jle    801055c4 <sys_unlink+0x1d4>
    panic("unlink: nlink < 1");
  if(ip->type == T_DIR && !isdirempty(ip)){
801054a0:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
801054a5:	8d 75 d8             	lea    -0x28(%ebp),%esi
801054a8:	74 66                	je     80105510 <sys_unlink+0x120>
    iunlockput(ip);
    goto bad;
  }

  memset(&de, 0, sizeof(de));
801054aa:	83 ec 04             	sub    $0x4,%esp
801054ad:	6a 10                	push   $0x10
801054af:	6a 00                	push   $0x0
801054b1:	56                   	push   %esi
801054b2:	e8 a9 f5 ff ff       	call   80104a60 <memset>
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
801054b7:	6a 10                	push   $0x10
801054b9:	ff 75 c4             	pushl  -0x3c(%ebp)
801054bc:	56                   	push   %esi
801054bd:	ff 75 b4             	pushl  -0x4c(%ebp)
801054c0:	e8 8b c5 ff ff       	call   80101a50 <writei>
801054c5:	83 c4 20             	add    $0x20,%esp
801054c8:	83 f8 10             	cmp    $0x10,%eax
801054cb:	0f 85 e6 00 00 00    	jne    801055b7 <sys_unlink+0x1c7>
    panic("unlink: writei");
  if(ip->type == T_DIR){
801054d1:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
801054d6:	0f 84 9c 00 00 00    	je     80105578 <sys_unlink+0x188>
    dp->nlink--;
    iupdate(dp);
  }
  iunlockput(dp);
801054dc:	83 ec 0c             	sub    $0xc,%esp
801054df:	ff 75 b4             	pushl  -0x4c(%ebp)
801054e2:	e8 19 c4 ff ff       	call   80101900 <iunlockput>

  ip->nlink--;
801054e7:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
  iupdate(ip);
801054ec:	89 1c 24             	mov    %ebx,(%esp)
801054ef:	e8 cc c0 ff ff       	call   801015c0 <iupdate>
  iunlockput(ip);
801054f4:	89 1c 24             	mov    %ebx,(%esp)
801054f7:	e8 04 c4 ff ff       	call   80101900 <iunlockput>

  end_op();
801054fc:	e8 df d6 ff ff       	call   80102be0 <end_op>

  return 0;
80105501:	83 c4 10             	add    $0x10,%esp
80105504:	31 c0                	xor    %eax,%eax

bad:
  iunlockput(dp);
  end_op();
  return -1;
}
80105506:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105509:	5b                   	pop    %ebx
8010550a:	5e                   	pop    %esi
8010550b:	5f                   	pop    %edi
8010550c:	5d                   	pop    %ebp
8010550d:	c3                   	ret    
8010550e:	66 90                	xchg   %ax,%ax
isdirempty(struct inode *dp)
{
  int off;
  struct dirent de;

  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
80105510:	83 7b 58 20          	cmpl   $0x20,0x58(%ebx)
80105514:	76 94                	jbe    801054aa <sys_unlink+0xba>
80105516:	bf 20 00 00 00       	mov    $0x20,%edi
8010551b:	eb 0f                	jmp    8010552c <sys_unlink+0x13c>
8010551d:	8d 76 00             	lea    0x0(%esi),%esi
80105520:	83 c7 10             	add    $0x10,%edi
80105523:	3b 7b 58             	cmp    0x58(%ebx),%edi
80105526:	0f 83 7e ff ff ff    	jae    801054aa <sys_unlink+0xba>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
8010552c:	6a 10                	push   $0x10
8010552e:	57                   	push   %edi
8010552f:	56                   	push   %esi
80105530:	53                   	push   %ebx
80105531:	e8 1a c4 ff ff       	call   80101950 <readi>
80105536:	83 c4 10             	add    $0x10,%esp
80105539:	83 f8 10             	cmp    $0x10,%eax
8010553c:	75 6c                	jne    801055aa <sys_unlink+0x1ba>
      panic("isdirempty: readi");
    if(de.inum != 0)
8010553e:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80105543:	74 db                	je     80105520 <sys_unlink+0x130>
  ilock(ip);

  if(ip->nlink < 1)
    panic("unlink: nlink < 1");
  if(ip->type == T_DIR && !isdirempty(ip)){
    iunlockput(ip);
80105545:	83 ec 0c             	sub    $0xc,%esp
80105548:	53                   	push   %ebx
80105549:	e8 b2 c3 ff ff       	call   80101900 <iunlockput>
    goto bad;
8010554e:	83 c4 10             	add    $0x10,%esp
  end_op();

  return 0;

bad:
  iunlockput(dp);
80105551:	83 ec 0c             	sub    $0xc,%esp
80105554:	ff 75 b4             	pushl  -0x4c(%ebp)
80105557:	e8 a4 c3 ff ff       	call   80101900 <iunlockput>
  end_op();
8010555c:	e8 7f d6 ff ff       	call   80102be0 <end_op>
  return -1;
80105561:	83 c4 10             	add    $0x10,%esp
}
80105564:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;

bad:
  iunlockput(dp);
  end_op();
  return -1;
80105567:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010556c:	5b                   	pop    %ebx
8010556d:	5e                   	pop    %esi
8010556e:	5f                   	pop    %edi
8010556f:	5d                   	pop    %ebp
80105570:	c3                   	ret    
80105571:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

  memset(&de, 0, sizeof(de));
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
    panic("unlink: writei");
  if(ip->type == T_DIR){
    dp->nlink--;
80105578:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    iupdate(dp);
8010557b:	83 ec 0c             	sub    $0xc,%esp

  memset(&de, 0, sizeof(de));
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
    panic("unlink: writei");
  if(ip->type == T_DIR){
    dp->nlink--;
8010557e:	66 83 68 56 01       	subw   $0x1,0x56(%eax)
    iupdate(dp);
80105583:	50                   	push   %eax
80105584:	e8 37 c0 ff ff       	call   801015c0 <iupdate>
80105589:	83 c4 10             	add    $0x10,%esp
8010558c:	e9 4b ff ff ff       	jmp    801054dc <sys_unlink+0xec>
  struct dirent de;
  char name[DIRSIZ], *path;
  uint off;

  if(argstr(0, &path) < 0)
    return -1;
80105591:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105596:	e9 6b ff ff ff       	jmp    80105506 <sys_unlink+0x116>

  begin_op();
  if((dp = nameiparent(path, name)) == 0){
    end_op();
8010559b:	e8 40 d6 ff ff       	call   80102be0 <end_op>
    return -1;
801055a0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801055a5:	e9 5c ff ff ff       	jmp    80105506 <sys_unlink+0x116>
  int off;
  struct dirent de;

  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
      panic("isdirempty: readi");
801055aa:	83 ec 0c             	sub    $0xc,%esp
801055ad:	68 ac 7d 10 80       	push   $0x80107dac
801055b2:	e8 b9 ad ff ff       	call   80100370 <panic>
    goto bad;
  }

  memset(&de, 0, sizeof(de));
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
    panic("unlink: writei");
801055b7:	83 ec 0c             	sub    $0xc,%esp
801055ba:	68 be 7d 10 80       	push   $0x80107dbe
801055bf:	e8 ac ad ff ff       	call   80100370 <panic>
  if((ip = dirlookup(dp, name, &off)) == 0)
    goto bad;
  ilock(ip);

  if(ip->nlink < 1)
    panic("unlink: nlink < 1");
801055c4:	83 ec 0c             	sub    $0xc,%esp
801055c7:	68 9a 7d 10 80       	push   $0x80107d9a
801055cc:	e8 9f ad ff ff       	call   80100370 <panic>
801055d1:	eb 0d                	jmp    801055e0 <sys_open>
801055d3:	90                   	nop
801055d4:	90                   	nop
801055d5:	90                   	nop
801055d6:	90                   	nop
801055d7:	90                   	nop
801055d8:	90                   	nop
801055d9:	90                   	nop
801055da:	90                   	nop
801055db:	90                   	nop
801055dc:	90                   	nop
801055dd:	90                   	nop
801055de:	90                   	nop
801055df:	90                   	nop

801055e0 <sys_open>:
  return ip;
}

int
sys_open(void)
{
801055e0:	55                   	push   %ebp
801055e1:	89 e5                	mov    %esp,%ebp
801055e3:	57                   	push   %edi
801055e4:	56                   	push   %esi
801055e5:	53                   	push   %ebx
  char *path;
  int fd, omode;
  struct file *f;
  struct inode *ip;

  if(argstr(0, &path) < 0 || argint(1, &omode) < 0)
801055e6:	8d 45 e0             	lea    -0x20(%ebp),%eax
  return ip;
}

int
sys_open(void)
{
801055e9:	83 ec 24             	sub    $0x24,%esp
  char *path;
  int fd, omode;
  struct file *f;
  struct inode *ip;

  if(argstr(0, &path) < 0 || argint(1, &omode) < 0)
801055ec:	50                   	push   %eax
801055ed:	6a 00                	push   $0x0
801055ef:	e8 0c f8 ff ff       	call   80104e00 <argstr>
801055f4:	83 c4 10             	add    $0x10,%esp
801055f7:	85 c0                	test   %eax,%eax
801055f9:	0f 88 9e 00 00 00    	js     8010569d <sys_open+0xbd>
801055ff:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80105602:	83 ec 08             	sub    $0x8,%esp
80105605:	50                   	push   %eax
80105606:	6a 01                	push   $0x1
80105608:	e8 43 f7 ff ff       	call   80104d50 <argint>
8010560d:	83 c4 10             	add    $0x10,%esp
80105610:	85 c0                	test   %eax,%eax
80105612:	0f 88 85 00 00 00    	js     8010569d <sys_open+0xbd>
    return -1;

  begin_op();
80105618:	e8 53 d5 ff ff       	call   80102b70 <begin_op>

  if(omode & O_CREATE){
8010561d:	f6 45 e5 02          	testb  $0x2,-0x1b(%ebp)
80105621:	0f 85 89 00 00 00    	jne    801056b0 <sys_open+0xd0>
    if(ip == 0){
      end_op();
      return -1;
    }
  } else {
    if((ip = namei(path)) == 0){
80105627:	83 ec 0c             	sub    $0xc,%esp
8010562a:	ff 75 e0             	pushl  -0x20(%ebp)
8010562d:	e8 8e c8 ff ff       	call   80101ec0 <namei>
80105632:	83 c4 10             	add    $0x10,%esp
80105635:	85 c0                	test   %eax,%eax
80105637:	89 c6                	mov    %eax,%esi
80105639:	0f 84 8e 00 00 00    	je     801056cd <sys_open+0xed>
      end_op();
      return -1;
    }
    ilock(ip);
8010563f:	83 ec 0c             	sub    $0xc,%esp
80105642:	50                   	push   %eax
80105643:	e8 28 c0 ff ff       	call   80101670 <ilock>
    if(ip->type == T_DIR && omode != O_RDONLY){
80105648:	83 c4 10             	add    $0x10,%esp
8010564b:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80105650:	0f 84 d2 00 00 00    	je     80105728 <sys_open+0x148>
      end_op();
      return -1;
    }
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
80105656:	e8 05 b7 ff ff       	call   80100d60 <filealloc>
8010565b:	85 c0                	test   %eax,%eax
8010565d:	89 c7                	mov    %eax,%edi
8010565f:	74 2b                	je     8010568c <sys_open+0xac>
fdalloc(struct file *f)
{
  int fd;
  struct proc *curproc = myproc();

  for(fd = 0; fd < NOFILE; fd++){
80105661:	31 db                	xor    %ebx,%ebx
// Takes over file reference from caller on success.
static int
fdalloc(struct file *f)
{
  int fd;
  struct proc *curproc = myproc();
80105663:	e8 58 e2 ff ff       	call   801038c0 <myproc>
80105668:	90                   	nop
80105669:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

  for(fd = 0; fd < NOFILE; fd++){
    if(curproc->ofile[fd] == 0){
80105670:	8b 54 98 28          	mov    0x28(%eax,%ebx,4),%edx
80105674:	85 d2                	test   %edx,%edx
80105676:	74 68                	je     801056e0 <sys_open+0x100>
fdalloc(struct file *f)
{
  int fd;
  struct proc *curproc = myproc();

  for(fd = 0; fd < NOFILE; fd++){
80105678:	83 c3 01             	add    $0x1,%ebx
8010567b:	83 fb 10             	cmp    $0x10,%ebx
8010567e:	75 f0                	jne    80105670 <sys_open+0x90>
    }
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
    if(f)
      fileclose(f);
80105680:	83 ec 0c             	sub    $0xc,%esp
80105683:	57                   	push   %edi
80105684:	e8 97 b7 ff ff       	call   80100e20 <fileclose>
80105689:	83 c4 10             	add    $0x10,%esp
    iunlockput(ip);
8010568c:	83 ec 0c             	sub    $0xc,%esp
8010568f:	56                   	push   %esi
80105690:	e8 6b c2 ff ff       	call   80101900 <iunlockput>
    end_op();
80105695:	e8 46 d5 ff ff       	call   80102be0 <end_op>
    return -1;
8010569a:	83 c4 10             	add    $0x10,%esp
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
  return fd;
}
8010569d:	8d 65 f4             	lea    -0xc(%ebp),%esp
  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
    if(f)
      fileclose(f);
    iunlockput(ip);
    end_op();
    return -1;
801056a0:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
  return fd;
}
801056a5:	89 d8                	mov    %ebx,%eax
801056a7:	5b                   	pop    %ebx
801056a8:	5e                   	pop    %esi
801056a9:	5f                   	pop    %edi
801056aa:	5d                   	pop    %ebp
801056ab:	c3                   	ret    
801056ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;

  begin_op();

  if(omode & O_CREATE){
    ip = create(path, T_FILE, 0, 0);
801056b0:	83 ec 0c             	sub    $0xc,%esp
801056b3:	8b 45 e0             	mov    -0x20(%ebp),%eax
801056b6:	31 c9                	xor    %ecx,%ecx
801056b8:	6a 00                	push   $0x0
801056ba:	ba 02 00 00 00       	mov    $0x2,%edx
801056bf:	e8 dc f7 ff ff       	call   80104ea0 <create>
    if(ip == 0){
801056c4:	83 c4 10             	add    $0x10,%esp
801056c7:	85 c0                	test   %eax,%eax
    return -1;

  begin_op();

  if(omode & O_CREATE){
    ip = create(path, T_FILE, 0, 0);
801056c9:	89 c6                	mov    %eax,%esi
    if(ip == 0){
801056cb:	75 89                	jne    80105656 <sys_open+0x76>
      end_op();
801056cd:	e8 0e d5 ff ff       	call   80102be0 <end_op>
      return -1;
801056d2:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
801056d7:	eb 40                	jmp    80105719 <sys_open+0x139>
801056d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      fileclose(f);
    iunlockput(ip);
    end_op();
    return -1;
  }
  iunlock(ip);
801056e0:	83 ec 0c             	sub    $0xc,%esp
  int fd;
  struct proc *curproc = myproc();

  for(fd = 0; fd < NOFILE; fd++){
    if(curproc->ofile[fd] == 0){
      curproc->ofile[fd] = f;
801056e3:	89 7c 98 28          	mov    %edi,0x28(%eax,%ebx,4)
      fileclose(f);
    iunlockput(ip);
    end_op();
    return -1;
  }
  iunlock(ip);
801056e7:	56                   	push   %esi
801056e8:	e8 63 c0 ff ff       	call   80101750 <iunlock>
  end_op();
801056ed:	e8 ee d4 ff ff       	call   80102be0 <end_op>

  f->type = FD_INODE;
801056f2:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
801056f8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
801056fb:	83 c4 10             	add    $0x10,%esp
  }
  iunlock(ip);
  end_op();

  f->type = FD_INODE;
  f->ip = ip;
801056fe:	89 77 10             	mov    %esi,0x10(%edi)
  f->off = 0;
80105701:	c7 47 14 00 00 00 00 	movl   $0x0,0x14(%edi)
  f->readable = !(omode & O_WRONLY);
80105708:	89 c2                	mov    %eax,%edx
8010570a:	f7 d2                	not    %edx
8010570c:	88 57 08             	mov    %dl,0x8(%edi)
8010570f:	80 67 08 01          	andb   $0x1,0x8(%edi)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
80105713:	a8 03                	test   $0x3,%al
80105715:	0f 95 47 09          	setne  0x9(%edi)
  return fd;
}
80105719:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010571c:	89 d8                	mov    %ebx,%eax
8010571e:	5b                   	pop    %ebx
8010571f:	5e                   	pop    %esi
80105720:	5f                   	pop    %edi
80105721:	5d                   	pop    %ebp
80105722:	c3                   	ret    
80105723:	90                   	nop
80105724:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if((ip = namei(path)) == 0){
      end_op();
      return -1;
    }
    ilock(ip);
    if(ip->type == T_DIR && omode != O_RDONLY){
80105728:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
8010572b:	85 c9                	test   %ecx,%ecx
8010572d:	0f 84 23 ff ff ff    	je     80105656 <sys_open+0x76>
80105733:	e9 54 ff ff ff       	jmp    8010568c <sys_open+0xac>
80105738:	90                   	nop
80105739:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105740 <sys_mkdir>:
  return fd;
}

int
sys_mkdir(void)
{
80105740:	55                   	push   %ebp
80105741:	89 e5                	mov    %esp,%ebp
80105743:	83 ec 18             	sub    $0x18,%esp
  char *path;
  struct inode *ip;

  begin_op();
80105746:	e8 25 d4 ff ff       	call   80102b70 <begin_op>
  if(argstr(0, &path) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
8010574b:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010574e:	83 ec 08             	sub    $0x8,%esp
80105751:	50                   	push   %eax
80105752:	6a 00                	push   $0x0
80105754:	e8 a7 f6 ff ff       	call   80104e00 <argstr>
80105759:	83 c4 10             	add    $0x10,%esp
8010575c:	85 c0                	test   %eax,%eax
8010575e:	78 30                	js     80105790 <sys_mkdir+0x50>
80105760:	83 ec 0c             	sub    $0xc,%esp
80105763:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105766:	31 c9                	xor    %ecx,%ecx
80105768:	6a 00                	push   $0x0
8010576a:	ba 01 00 00 00       	mov    $0x1,%edx
8010576f:	e8 2c f7 ff ff       	call   80104ea0 <create>
80105774:	83 c4 10             	add    $0x10,%esp
80105777:	85 c0                	test   %eax,%eax
80105779:	74 15                	je     80105790 <sys_mkdir+0x50>
    end_op();
    return -1;
  }
  iunlockput(ip);
8010577b:	83 ec 0c             	sub    $0xc,%esp
8010577e:	50                   	push   %eax
8010577f:	e8 7c c1 ff ff       	call   80101900 <iunlockput>
  end_op();
80105784:	e8 57 d4 ff ff       	call   80102be0 <end_op>
  return 0;
80105789:	83 c4 10             	add    $0x10,%esp
8010578c:	31 c0                	xor    %eax,%eax
}
8010578e:	c9                   	leave  
8010578f:	c3                   	ret    
  char *path;
  struct inode *ip;

  begin_op();
  if(argstr(0, &path) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
    end_op();
80105790:	e8 4b d4 ff ff       	call   80102be0 <end_op>
    return -1;
80105795:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  iunlockput(ip);
  end_op();
  return 0;
}
8010579a:	c9                   	leave  
8010579b:	c3                   	ret    
8010579c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801057a0 <sys_mknod>:

int
sys_mknod(void)
{
801057a0:	55                   	push   %ebp
801057a1:	89 e5                	mov    %esp,%ebp
801057a3:	83 ec 18             	sub    $0x18,%esp
  struct inode *ip;
  char *path;
  int major, minor;

  begin_op();
801057a6:	e8 c5 d3 ff ff       	call   80102b70 <begin_op>
  if((argstr(0, &path)) < 0 ||
801057ab:	8d 45 ec             	lea    -0x14(%ebp),%eax
801057ae:	83 ec 08             	sub    $0x8,%esp
801057b1:	50                   	push   %eax
801057b2:	6a 00                	push   $0x0
801057b4:	e8 47 f6 ff ff       	call   80104e00 <argstr>
801057b9:	83 c4 10             	add    $0x10,%esp
801057bc:	85 c0                	test   %eax,%eax
801057be:	78 60                	js     80105820 <sys_mknod+0x80>
     argint(1, &major) < 0 ||
801057c0:	8d 45 f0             	lea    -0x10(%ebp),%eax
801057c3:	83 ec 08             	sub    $0x8,%esp
801057c6:	50                   	push   %eax
801057c7:	6a 01                	push   $0x1
801057c9:	e8 82 f5 ff ff       	call   80104d50 <argint>
  struct inode *ip;
  char *path;
  int major, minor;

  begin_op();
  if((argstr(0, &path)) < 0 ||
801057ce:	83 c4 10             	add    $0x10,%esp
801057d1:	85 c0                	test   %eax,%eax
801057d3:	78 4b                	js     80105820 <sys_mknod+0x80>
     argint(1, &major) < 0 ||
     argint(2, &minor) < 0 ||
801057d5:	8d 45 f4             	lea    -0xc(%ebp),%eax
801057d8:	83 ec 08             	sub    $0x8,%esp
801057db:	50                   	push   %eax
801057dc:	6a 02                	push   $0x2
801057de:	e8 6d f5 ff ff       	call   80104d50 <argint>
  char *path;
  int major, minor;

  begin_op();
  if((argstr(0, &path)) < 0 ||
     argint(1, &major) < 0 ||
801057e3:	83 c4 10             	add    $0x10,%esp
801057e6:	85 c0                	test   %eax,%eax
801057e8:	78 36                	js     80105820 <sys_mknod+0x80>
     argint(2, &minor) < 0 ||
     (ip = create(path, T_DEV, major, minor)) == 0){
801057ea:	0f bf 45 f4          	movswl -0xc(%ebp),%eax
  int major, minor;

  begin_op();
  if((argstr(0, &path)) < 0 ||
     argint(1, &major) < 0 ||
     argint(2, &minor) < 0 ||
801057ee:	83 ec 0c             	sub    $0xc,%esp
     (ip = create(path, T_DEV, major, minor)) == 0){
801057f1:	0f bf 4d f0          	movswl -0x10(%ebp),%ecx
  int major, minor;

  begin_op();
  if((argstr(0, &path)) < 0 ||
     argint(1, &major) < 0 ||
     argint(2, &minor) < 0 ||
801057f5:	ba 03 00 00 00       	mov    $0x3,%edx
801057fa:	50                   	push   %eax
801057fb:	8b 45 ec             	mov    -0x14(%ebp),%eax
801057fe:	e8 9d f6 ff ff       	call   80104ea0 <create>
80105803:	83 c4 10             	add    $0x10,%esp
80105806:	85 c0                	test   %eax,%eax
80105808:	74 16                	je     80105820 <sys_mknod+0x80>
     (ip = create(path, T_DEV, major, minor)) == 0){
    end_op();
    return -1;
  }
  iunlockput(ip);
8010580a:	83 ec 0c             	sub    $0xc,%esp
8010580d:	50                   	push   %eax
8010580e:	e8 ed c0 ff ff       	call   80101900 <iunlockput>
  end_op();
80105813:	e8 c8 d3 ff ff       	call   80102be0 <end_op>
  return 0;
80105818:	83 c4 10             	add    $0x10,%esp
8010581b:	31 c0                	xor    %eax,%eax
}
8010581d:	c9                   	leave  
8010581e:	c3                   	ret    
8010581f:	90                   	nop
  begin_op();
  if((argstr(0, &path)) < 0 ||
     argint(1, &major) < 0 ||
     argint(2, &minor) < 0 ||
     (ip = create(path, T_DEV, major, minor)) == 0){
    end_op();
80105820:	e8 bb d3 ff ff       	call   80102be0 <end_op>
    return -1;
80105825:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  iunlockput(ip);
  end_op();
  return 0;
}
8010582a:	c9                   	leave  
8010582b:	c3                   	ret    
8010582c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105830 <sys_chdir>:

int
sys_chdir(void)
{
80105830:	55                   	push   %ebp
80105831:	89 e5                	mov    %esp,%ebp
80105833:	56                   	push   %esi
80105834:	53                   	push   %ebx
80105835:	83 ec 10             	sub    $0x10,%esp
  char *path;
  struct inode *ip;
  struct proc *curproc = myproc();
80105838:	e8 83 e0 ff ff       	call   801038c0 <myproc>
8010583d:	89 c6                	mov    %eax,%esi
  
  begin_op();
8010583f:	e8 2c d3 ff ff       	call   80102b70 <begin_op>
  if(argstr(0, &path) < 0 || (ip = namei(path)) == 0){
80105844:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105847:	83 ec 08             	sub    $0x8,%esp
8010584a:	50                   	push   %eax
8010584b:	6a 00                	push   $0x0
8010584d:	e8 ae f5 ff ff       	call   80104e00 <argstr>
80105852:	83 c4 10             	add    $0x10,%esp
80105855:	85 c0                	test   %eax,%eax
80105857:	78 77                	js     801058d0 <sys_chdir+0xa0>
80105859:	83 ec 0c             	sub    $0xc,%esp
8010585c:	ff 75 f4             	pushl  -0xc(%ebp)
8010585f:	e8 5c c6 ff ff       	call   80101ec0 <namei>
80105864:	83 c4 10             	add    $0x10,%esp
80105867:	85 c0                	test   %eax,%eax
80105869:	89 c3                	mov    %eax,%ebx
8010586b:	74 63                	je     801058d0 <sys_chdir+0xa0>
    end_op();
    return -1;
  }
  ilock(ip);
8010586d:	83 ec 0c             	sub    $0xc,%esp
80105870:	50                   	push   %eax
80105871:	e8 fa bd ff ff       	call   80101670 <ilock>
  if(ip->type != T_DIR){
80105876:	83 c4 10             	add    $0x10,%esp
80105879:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
8010587e:	75 30                	jne    801058b0 <sys_chdir+0x80>
    iunlockput(ip);
    end_op();
    return -1;
  }
  iunlock(ip);
80105880:	83 ec 0c             	sub    $0xc,%esp
80105883:	53                   	push   %ebx
80105884:	e8 c7 be ff ff       	call   80101750 <iunlock>
  iput(curproc->cwd);
80105889:	58                   	pop    %eax
8010588a:	ff 76 68             	pushl  0x68(%esi)
8010588d:	e8 0e bf ff ff       	call   801017a0 <iput>
  end_op();
80105892:	e8 49 d3 ff ff       	call   80102be0 <end_op>
  curproc->cwd = ip;
80105897:	89 5e 68             	mov    %ebx,0x68(%esi)
  return 0;
8010589a:	83 c4 10             	add    $0x10,%esp
8010589d:	31 c0                	xor    %eax,%eax
}
8010589f:	8d 65 f8             	lea    -0x8(%ebp),%esp
801058a2:	5b                   	pop    %ebx
801058a3:	5e                   	pop    %esi
801058a4:	5d                   	pop    %ebp
801058a5:	c3                   	ret    
801058a6:	8d 76 00             	lea    0x0(%esi),%esi
801058a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    end_op();
    return -1;
  }
  ilock(ip);
  if(ip->type != T_DIR){
    iunlockput(ip);
801058b0:	83 ec 0c             	sub    $0xc,%esp
801058b3:	53                   	push   %ebx
801058b4:	e8 47 c0 ff ff       	call   80101900 <iunlockput>
    end_op();
801058b9:	e8 22 d3 ff ff       	call   80102be0 <end_op>
    return -1;
801058be:	83 c4 10             	add    $0x10,%esp
801058c1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801058c6:	eb d7                	jmp    8010589f <sys_chdir+0x6f>
801058c8:	90                   	nop
801058c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  struct inode *ip;
  struct proc *curproc = myproc();
  
  begin_op();
  if(argstr(0, &path) < 0 || (ip = namei(path)) == 0){
    end_op();
801058d0:	e8 0b d3 ff ff       	call   80102be0 <end_op>
    return -1;
801058d5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801058da:	eb c3                	jmp    8010589f <sys_chdir+0x6f>
801058dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801058e0 <sys_exec>:
  return 0;
}

int
sys_exec(void)
{
801058e0:	55                   	push   %ebp
801058e1:	89 e5                	mov    %esp,%ebp
801058e3:	57                   	push   %edi
801058e4:	56                   	push   %esi
801058e5:	53                   	push   %ebx
  char *path, *argv[MAXARG];
  int i;
  uint uargv, uarg;

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
801058e6:	8d 85 5c ff ff ff    	lea    -0xa4(%ebp),%eax
  return 0;
}

int
sys_exec(void)
{
801058ec:	81 ec a4 00 00 00    	sub    $0xa4,%esp
  char *path, *argv[MAXARG];
  int i;
  uint uargv, uarg;

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
801058f2:	50                   	push   %eax
801058f3:	6a 00                	push   $0x0
801058f5:	e8 06 f5 ff ff       	call   80104e00 <argstr>
801058fa:	83 c4 10             	add    $0x10,%esp
801058fd:	85 c0                	test   %eax,%eax
801058ff:	78 7f                	js     80105980 <sys_exec+0xa0>
80105901:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
80105907:	83 ec 08             	sub    $0x8,%esp
8010590a:	50                   	push   %eax
8010590b:	6a 01                	push   $0x1
8010590d:	e8 3e f4 ff ff       	call   80104d50 <argint>
80105912:	83 c4 10             	add    $0x10,%esp
80105915:	85 c0                	test   %eax,%eax
80105917:	78 67                	js     80105980 <sys_exec+0xa0>
    return -1;
  }
  memset(argv, 0, sizeof(argv));
80105919:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
8010591f:	83 ec 04             	sub    $0x4,%esp
80105922:	8d b5 68 ff ff ff    	lea    -0x98(%ebp),%esi
80105928:	68 80 00 00 00       	push   $0x80
8010592d:	6a 00                	push   $0x0
8010592f:	8d bd 64 ff ff ff    	lea    -0x9c(%ebp),%edi
80105935:	50                   	push   %eax
80105936:	31 db                	xor    %ebx,%ebx
80105938:	e8 23 f1 ff ff       	call   80104a60 <memset>
8010593d:	83 c4 10             	add    $0x10,%esp
  for(i=0;; i++){
    if(i >= NELEM(argv))
      return -1;
    if(fetchint(uargv+4*i, (int*)&uarg) < 0)
80105940:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
80105946:	83 ec 08             	sub    $0x8,%esp
80105949:	57                   	push   %edi
8010594a:	8d 04 98             	lea    (%eax,%ebx,4),%eax
8010594d:	50                   	push   %eax
8010594e:	e8 5d f3 ff ff       	call   80104cb0 <fetchint>
80105953:	83 c4 10             	add    $0x10,%esp
80105956:	85 c0                	test   %eax,%eax
80105958:	78 26                	js     80105980 <sys_exec+0xa0>
      return -1;
    if(uarg == 0){
8010595a:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
80105960:	85 c0                	test   %eax,%eax
80105962:	74 2c                	je     80105990 <sys_exec+0xb0>
      argv[i] = 0;
      break;
    }
    if(fetchstr(uarg, &argv[i]) < 0)
80105964:	83 ec 08             	sub    $0x8,%esp
80105967:	56                   	push   %esi
80105968:	50                   	push   %eax
80105969:	e8 82 f3 ff ff       	call   80104cf0 <fetchstr>
8010596e:	83 c4 10             	add    $0x10,%esp
80105971:	85 c0                	test   %eax,%eax
80105973:	78 0b                	js     80105980 <sys_exec+0xa0>

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
    return -1;
  }
  memset(argv, 0, sizeof(argv));
  for(i=0;; i++){
80105975:	83 c3 01             	add    $0x1,%ebx
80105978:	83 c6 04             	add    $0x4,%esi
    if(i >= NELEM(argv))
8010597b:	83 fb 20             	cmp    $0x20,%ebx
8010597e:	75 c0                	jne    80105940 <sys_exec+0x60>
    }
    if(fetchstr(uarg, &argv[i]) < 0)
      return -1;
  }
  return exec(path, argv);
}
80105980:	8d 65 f4             	lea    -0xc(%ebp),%esp
  char *path, *argv[MAXARG];
  int i;
  uint uargv, uarg;

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
    return -1;
80105983:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    }
    if(fetchstr(uarg, &argv[i]) < 0)
      return -1;
  }
  return exec(path, argv);
}
80105988:	5b                   	pop    %ebx
80105989:	5e                   	pop    %esi
8010598a:	5f                   	pop    %edi
8010598b:	5d                   	pop    %ebp
8010598c:	c3                   	ret    
8010598d:	8d 76 00             	lea    0x0(%esi),%esi
      break;
    }
    if(fetchstr(uarg, &argv[i]) < 0)
      return -1;
  }
  return exec(path, argv);
80105990:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
80105996:	83 ec 08             	sub    $0x8,%esp
    if(i >= NELEM(argv))
      return -1;
    if(fetchint(uargv+4*i, (int*)&uarg) < 0)
      return -1;
    if(uarg == 0){
      argv[i] = 0;
80105999:	c7 84 9d 68 ff ff ff 	movl   $0x0,-0x98(%ebp,%ebx,4)
801059a0:	00 00 00 00 
      break;
    }
    if(fetchstr(uarg, &argv[i]) < 0)
      return -1;
  }
  return exec(path, argv);
801059a4:	50                   	push   %eax
801059a5:	ff b5 5c ff ff ff    	pushl  -0xa4(%ebp)
801059ab:	e8 30 b0 ff ff       	call   801009e0 <exec>
801059b0:	83 c4 10             	add    $0x10,%esp
}
801059b3:	8d 65 f4             	lea    -0xc(%ebp),%esp
801059b6:	5b                   	pop    %ebx
801059b7:	5e                   	pop    %esi
801059b8:	5f                   	pop    %edi
801059b9:	5d                   	pop    %ebp
801059ba:	c3                   	ret    
801059bb:	90                   	nop
801059bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801059c0 <sys_pipe>:

int
sys_pipe(void)
{
801059c0:	55                   	push   %ebp
801059c1:	89 e5                	mov    %esp,%ebp
801059c3:	57                   	push   %edi
801059c4:	56                   	push   %esi
801059c5:	53                   	push   %ebx
  int *fd;
  struct file *rf, *wf;
  int fd0, fd1;

  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
801059c6:	8d 45 dc             	lea    -0x24(%ebp),%eax
  return exec(path, argv);
}

int
sys_pipe(void)
{
801059c9:	83 ec 20             	sub    $0x20,%esp
  int *fd;
  struct file *rf, *wf;
  int fd0, fd1;

  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
801059cc:	6a 08                	push   $0x8
801059ce:	50                   	push   %eax
801059cf:	6a 00                	push   $0x0
801059d1:	e8 ca f3 ff ff       	call   80104da0 <argptr>
801059d6:	83 c4 10             	add    $0x10,%esp
801059d9:	85 c0                	test   %eax,%eax
801059db:	78 4a                	js     80105a27 <sys_pipe+0x67>
    return -1;
  if(pipealloc(&rf, &wf) < 0)
801059dd:	8d 45 e4             	lea    -0x1c(%ebp),%eax
801059e0:	83 ec 08             	sub    $0x8,%esp
801059e3:	50                   	push   %eax
801059e4:	8d 45 e0             	lea    -0x20(%ebp),%eax
801059e7:	50                   	push   %eax
801059e8:	e8 13 d8 ff ff       	call   80103200 <pipealloc>
801059ed:	83 c4 10             	add    $0x10,%esp
801059f0:	85 c0                	test   %eax,%eax
801059f2:	78 33                	js     80105a27 <sys_pipe+0x67>
fdalloc(struct file *f)
{
  int fd;
  struct proc *curproc = myproc();

  for(fd = 0; fd < NOFILE; fd++){
801059f4:	31 db                	xor    %ebx,%ebx
  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
    return -1;
  if(pipealloc(&rf, &wf) < 0)
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
801059f6:	8b 7d e0             	mov    -0x20(%ebp),%edi
// Takes over file reference from caller on success.
static int
fdalloc(struct file *f)
{
  int fd;
  struct proc *curproc = myproc();
801059f9:	e8 c2 de ff ff       	call   801038c0 <myproc>
801059fe:	66 90                	xchg   %ax,%ax

  for(fd = 0; fd < NOFILE; fd++){
    if(curproc->ofile[fd] == 0){
80105a00:	8b 74 98 28          	mov    0x28(%eax,%ebx,4),%esi
80105a04:	85 f6                	test   %esi,%esi
80105a06:	74 30                	je     80105a38 <sys_pipe+0x78>
fdalloc(struct file *f)
{
  int fd;
  struct proc *curproc = myproc();

  for(fd = 0; fd < NOFILE; fd++){
80105a08:	83 c3 01             	add    $0x1,%ebx
80105a0b:	83 fb 10             	cmp    $0x10,%ebx
80105a0e:	75 f0                	jne    80105a00 <sys_pipe+0x40>
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    if(fd0 >= 0)
      myproc()->ofile[fd0] = 0;
    fileclose(rf);
80105a10:	83 ec 0c             	sub    $0xc,%esp
80105a13:	ff 75 e0             	pushl  -0x20(%ebp)
80105a16:	e8 05 b4 ff ff       	call   80100e20 <fileclose>
    fileclose(wf);
80105a1b:	58                   	pop    %eax
80105a1c:	ff 75 e4             	pushl  -0x1c(%ebp)
80105a1f:	e8 fc b3 ff ff       	call   80100e20 <fileclose>
    return -1;
80105a24:	83 c4 10             	add    $0x10,%esp
  }
  fd[0] = fd0;
  fd[1] = fd1;
  return 0;
}
80105a27:	8d 65 f4             	lea    -0xc(%ebp),%esp
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    if(fd0 >= 0)
      myproc()->ofile[fd0] = 0;
    fileclose(rf);
    fileclose(wf);
    return -1;
80105a2a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  fd[0] = fd0;
  fd[1] = fd1;
  return 0;
}
80105a2f:	5b                   	pop    %ebx
80105a30:	5e                   	pop    %esi
80105a31:	5f                   	pop    %edi
80105a32:	5d                   	pop    %ebp
80105a33:	c3                   	ret    
80105a34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  int fd;
  struct proc *curproc = myproc();

  for(fd = 0; fd < NOFILE; fd++){
    if(curproc->ofile[fd] == 0){
      curproc->ofile[fd] = f;
80105a38:	8d 73 08             	lea    0x8(%ebx),%esi
80105a3b:	89 7c b0 08          	mov    %edi,0x8(%eax,%esi,4)
  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
    return -1;
  if(pipealloc(&rf, &wf) < 0)
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
80105a3f:	8b 7d e4             	mov    -0x1c(%ebp),%edi
// Takes over file reference from caller on success.
static int
fdalloc(struct file *f)
{
  int fd;
  struct proc *curproc = myproc();
80105a42:	e8 79 de ff ff       	call   801038c0 <myproc>

  for(fd = 0; fd < NOFILE; fd++){
80105a47:	31 d2                	xor    %edx,%edx
80105a49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(curproc->ofile[fd] == 0){
80105a50:	8b 4c 90 28          	mov    0x28(%eax,%edx,4),%ecx
80105a54:	85 c9                	test   %ecx,%ecx
80105a56:	74 18                	je     80105a70 <sys_pipe+0xb0>
fdalloc(struct file *f)
{
  int fd;
  struct proc *curproc = myproc();

  for(fd = 0; fd < NOFILE; fd++){
80105a58:	83 c2 01             	add    $0x1,%edx
80105a5b:	83 fa 10             	cmp    $0x10,%edx
80105a5e:	75 f0                	jne    80105a50 <sys_pipe+0x90>
  if(pipealloc(&rf, &wf) < 0)
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    if(fd0 >= 0)
      myproc()->ofile[fd0] = 0;
80105a60:	e8 5b de ff ff       	call   801038c0 <myproc>
80105a65:	c7 44 b0 08 00 00 00 	movl   $0x0,0x8(%eax,%esi,4)
80105a6c:	00 
80105a6d:	eb a1                	jmp    80105a10 <sys_pipe+0x50>
80105a6f:	90                   	nop
  int fd;
  struct proc *curproc = myproc();

  for(fd = 0; fd < NOFILE; fd++){
    if(curproc->ofile[fd] == 0){
      curproc->ofile[fd] = f;
80105a70:	89 7c 90 28          	mov    %edi,0x28(%eax,%edx,4)
      myproc()->ofile[fd0] = 0;
    fileclose(rf);
    fileclose(wf);
    return -1;
  }
  fd[0] = fd0;
80105a74:	8b 45 dc             	mov    -0x24(%ebp),%eax
80105a77:	89 18                	mov    %ebx,(%eax)
  fd[1] = fd1;
80105a79:	8b 45 dc             	mov    -0x24(%ebp),%eax
80105a7c:	89 50 04             	mov    %edx,0x4(%eax)
  return 0;
}
80105a7f:	8d 65 f4             	lea    -0xc(%ebp),%esp
    fileclose(wf);
    return -1;
  }
  fd[0] = fd0;
  fd[1] = fd1;
  return 0;
80105a82:	31 c0                	xor    %eax,%eax
}
80105a84:	5b                   	pop    %ebx
80105a85:	5e                   	pop    %esi
80105a86:	5f                   	pop    %edi
80105a87:	5d                   	pop    %ebp
80105a88:	c3                   	ret    
80105a89:	66 90                	xchg   %ax,%ax
80105a8b:	66 90                	xchg   %ax,%ax
80105a8d:	66 90                	xchg   %ax,%ax
80105a8f:	90                   	nop

80105a90 <sys_yield>:
#include "mmu.h"
#include "proc.h"


int sys_yield(void)
{
80105a90:	55                   	push   %ebp
80105a91:	89 e5                	mov    %esp,%ebp
80105a93:	83 ec 08             	sub    $0x8,%esp
  yield(); 
80105a96:	e8 95 e3 ff ff       	call   80103e30 <yield>
  return 0;
}
80105a9b:	31 c0                	xor    %eax,%eax
80105a9d:	c9                   	leave  
80105a9e:	c3                   	ret    
80105a9f:	90                   	nop

80105aa0 <sys_fork>:

int
sys_fork(void)
{
80105aa0:	55                   	push   %ebp
80105aa1:	89 e5                	mov    %esp,%ebp
  return fork();
}
80105aa3:	5d                   	pop    %ebp
}

int
sys_fork(void)
{
  return fork();
80105aa4:	e9 d7 df ff ff       	jmp    80103a80 <fork>
80105aa9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105ab0 <sys_exit>:
}

int
sys_exit(void)
{
80105ab0:	55                   	push   %ebp
80105ab1:	89 e5                	mov    %esp,%ebp
80105ab3:	83 ec 08             	sub    $0x8,%esp
  exit();
80105ab6:	e8 75 e2 ff ff       	call   80103d30 <exit>
  return 0;  // not reached
}
80105abb:	31 c0                	xor    %eax,%eax
80105abd:	c9                   	leave  
80105abe:	c3                   	ret    
80105abf:	90                   	nop

80105ac0 <sys_wait>:

int
sys_wait(void)
{
80105ac0:	55                   	push   %ebp
80105ac1:	89 e5                	mov    %esp,%ebp
  return wait();
}
80105ac3:	5d                   	pop    %ebp
}

int
sys_wait(void)
{
  return wait();
80105ac4:	e9 b7 e4 ff ff       	jmp    80103f80 <wait>
80105ac9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105ad0 <sys_kill>:
}

int
sys_kill(void)
{
80105ad0:	55                   	push   %ebp
80105ad1:	89 e5                	mov    %esp,%ebp
80105ad3:	83 ec 20             	sub    $0x20,%esp
  int pid;

  if(argint(0, &pid) < 0)
80105ad6:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105ad9:	50                   	push   %eax
80105ada:	6a 00                	push   $0x0
80105adc:	e8 6f f2 ff ff       	call   80104d50 <argint>
80105ae1:	83 c4 10             	add    $0x10,%esp
80105ae4:	85 c0                	test   %eax,%eax
80105ae6:	78 18                	js     80105b00 <sys_kill+0x30>
    return -1;
  return kill(pid);
80105ae8:	83 ec 0c             	sub    $0xc,%esp
80105aeb:	ff 75 f4             	pushl  -0xc(%ebp)
80105aee:	e8 bd e5 ff ff       	call   801040b0 <kill>
80105af3:	83 c4 10             	add    $0x10,%esp
}
80105af6:	c9                   	leave  
80105af7:	c3                   	ret    
80105af8:	90                   	nop
80105af9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
sys_kill(void)
{
  int pid;

  if(argint(0, &pid) < 0)
    return -1;
80105b00:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return kill(pid);
}
80105b05:	c9                   	leave  
80105b06:	c3                   	ret    
80105b07:	89 f6                	mov    %esi,%esi
80105b09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105b10 <sys_getpid>:

int
sys_getpid(void)
{
80105b10:	55                   	push   %ebp
80105b11:	89 e5                	mov    %esp,%ebp
80105b13:	83 ec 08             	sub    $0x8,%esp
  return myproc()->pid;
80105b16:	e8 a5 dd ff ff       	call   801038c0 <myproc>
80105b1b:	8b 40 10             	mov    0x10(%eax),%eax
}
80105b1e:	c9                   	leave  
80105b1f:	c3                   	ret    

80105b20 <sys_sbrk>:

int
sys_sbrk(void)
{
80105b20:	55                   	push   %ebp
80105b21:	89 e5                	mov    %esp,%ebp
80105b23:	53                   	push   %ebx
  int addr;
  int n;

  if(argint(0, &n) < 0)
80105b24:	8d 45 f4             	lea    -0xc(%ebp),%eax
  return myproc()->pid;
}

int
sys_sbrk(void)
{
80105b27:	83 ec 1c             	sub    $0x1c,%esp
  int addr;
  int n;

  if(argint(0, &n) < 0)
80105b2a:	50                   	push   %eax
80105b2b:	6a 00                	push   $0x0
80105b2d:	e8 1e f2 ff ff       	call   80104d50 <argint>
80105b32:	83 c4 10             	add    $0x10,%esp
80105b35:	85 c0                	test   %eax,%eax
80105b37:	78 27                	js     80105b60 <sys_sbrk+0x40>
    return -1;
  addr = myproc()->sz;
80105b39:	e8 82 dd ff ff       	call   801038c0 <myproc>
  if(growproc(n) < 0)
80105b3e:	83 ec 0c             	sub    $0xc,%esp
  int addr;
  int n;

  if(argint(0, &n) < 0)
    return -1;
  addr = myproc()->sz;
80105b41:	8b 18                	mov    (%eax),%ebx
  if(growproc(n) < 0)
80105b43:	ff 75 f4             	pushl  -0xc(%ebp)
80105b46:	e8 b5 de ff ff       	call   80103a00 <growproc>
80105b4b:	83 c4 10             	add    $0x10,%esp
80105b4e:	85 c0                	test   %eax,%eax
80105b50:	78 0e                	js     80105b60 <sys_sbrk+0x40>
    return -1;
  return addr;
}
80105b52:	89 d8                	mov    %ebx,%eax
80105b54:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105b57:	c9                   	leave  
80105b58:	c3                   	ret    
80105b59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
{
  int addr;
  int n;

  if(argint(0, &n) < 0)
    return -1;
80105b60:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80105b65:	eb eb                	jmp    80105b52 <sys_sbrk+0x32>
80105b67:	89 f6                	mov    %esi,%esi
80105b69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105b70 <sys_sleep>:
  return addr;
}

int
sys_sleep(void)
{
80105b70:	55                   	push   %ebp
80105b71:	89 e5                	mov    %esp,%ebp
80105b73:	53                   	push   %ebx
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
80105b74:	8d 45 f4             	lea    -0xc(%ebp),%eax
  return addr;
}

int
sys_sleep(void)
{
80105b77:	83 ec 1c             	sub    $0x1c,%esp
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
80105b7a:	50                   	push   %eax
80105b7b:	6a 00                	push   $0x0
80105b7d:	e8 ce f1 ff ff       	call   80104d50 <argint>
80105b82:	83 c4 10             	add    $0x10,%esp
80105b85:	85 c0                	test   %eax,%eax
80105b87:	0f 88 8a 00 00 00    	js     80105c17 <sys_sleep+0xa7>
    return -1;
  acquire(&tickslock);
80105b8d:	83 ec 0c             	sub    $0xc,%esp
80105b90:	68 80 83 11 80       	push   $0x80118380
80105b95:	e8 56 ed ff ff       	call   801048f0 <acquire>
  ticks0 = ticks;
  while(ticks - ticks0 < n){
80105b9a:	8b 55 f4             	mov    -0xc(%ebp),%edx
80105b9d:	83 c4 10             	add    $0x10,%esp
  uint ticks0;

  if(argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  ticks0 = ticks;
80105ba0:	8b 1d c0 8b 11 80    	mov    0x80118bc0,%ebx
  while(ticks - ticks0 < n){
80105ba6:	85 d2                	test   %edx,%edx
80105ba8:	75 27                	jne    80105bd1 <sys_sleep+0x61>
80105baa:	eb 54                	jmp    80105c00 <sys_sleep+0x90>
80105bac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(myproc()->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
80105bb0:	83 ec 08             	sub    $0x8,%esp
80105bb3:	68 80 83 11 80       	push   $0x80118380
80105bb8:	68 c0 8b 11 80       	push   $0x80118bc0
80105bbd:	e8 fe e2 ff ff       	call   80103ec0 <sleep>

  if(argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  ticks0 = ticks;
  while(ticks - ticks0 < n){
80105bc2:	a1 c0 8b 11 80       	mov    0x80118bc0,%eax
80105bc7:	83 c4 10             	add    $0x10,%esp
80105bca:	29 d8                	sub    %ebx,%eax
80105bcc:	3b 45 f4             	cmp    -0xc(%ebp),%eax
80105bcf:	73 2f                	jae    80105c00 <sys_sleep+0x90>
    if(myproc()->killed){
80105bd1:	e8 ea dc ff ff       	call   801038c0 <myproc>
80105bd6:	8b 40 24             	mov    0x24(%eax),%eax
80105bd9:	85 c0                	test   %eax,%eax
80105bdb:	74 d3                	je     80105bb0 <sys_sleep+0x40>
      release(&tickslock);
80105bdd:	83 ec 0c             	sub    $0xc,%esp
80105be0:	68 80 83 11 80       	push   $0x80118380
80105be5:	e8 26 ee ff ff       	call   80104a10 <release>
      return -1;
80105bea:	83 c4 10             	add    $0x10,%esp
80105bed:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
  return 0;
}
80105bf2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105bf5:	c9                   	leave  
80105bf6:	c3                   	ret    
80105bf7:	89 f6                	mov    %esi,%esi
80105bf9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
80105c00:	83 ec 0c             	sub    $0xc,%esp
80105c03:	68 80 83 11 80       	push   $0x80118380
80105c08:	e8 03 ee ff ff       	call   80104a10 <release>
  return 0;
80105c0d:	83 c4 10             	add    $0x10,%esp
80105c10:	31 c0                	xor    %eax,%eax
}
80105c12:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105c15:	c9                   	leave  
80105c16:	c3                   	ret    
{
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
    return -1;
80105c17:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105c1c:	eb d4                	jmp    80105bf2 <sys_sleep+0x82>
80105c1e:	66 90                	xchg   %ax,%ax

80105c20 <sys_uptime>:

// return how many clock tick interrupts have occurred
// since start.
int
sys_uptime(void)
{
80105c20:	55                   	push   %ebp
80105c21:	89 e5                	mov    %esp,%ebp
80105c23:	53                   	push   %ebx
80105c24:	83 ec 10             	sub    $0x10,%esp
  uint xticks;

  acquire(&tickslock);
80105c27:	68 80 83 11 80       	push   $0x80118380
80105c2c:	e8 bf ec ff ff       	call   801048f0 <acquire>
  xticks = ticks;
80105c31:	8b 1d c0 8b 11 80    	mov    0x80118bc0,%ebx
  release(&tickslock);
80105c37:	c7 04 24 80 83 11 80 	movl   $0x80118380,(%esp)
80105c3e:	e8 cd ed ff ff       	call   80104a10 <release>
  return xticks;
}
80105c43:	89 d8                	mov    %ebx,%eax
80105c45:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105c48:	c9                   	leave  
80105c49:	c3                   	ret    
80105c4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80105c50 <sys_setVariable>:

int sys_setVariable(void) {
80105c50:	55                   	push   %ebp
80105c51:	89 e5                	mov    %esp,%ebp
80105c53:	83 ec 20             	sub    $0x20,%esp
  char* var;
  char *val;
  if(argstr(0, &var) < 0 || argstr(1, &val) < 0)
80105c56:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105c59:	50                   	push   %eax
80105c5a:	6a 00                	push   $0x0
80105c5c:	e8 9f f1 ff ff       	call   80104e00 <argstr>
80105c61:	83 c4 10             	add    $0x10,%esp
80105c64:	85 c0                	test   %eax,%eax
80105c66:	78 28                	js     80105c90 <sys_setVariable+0x40>
80105c68:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105c6b:	83 ec 08             	sub    $0x8,%esp
80105c6e:	50                   	push   %eax
80105c6f:	6a 01                	push   $0x1
80105c71:	e8 8a f1 ff ff       	call   80104e00 <argstr>
80105c76:	83 c4 10             	add    $0x10,%esp
80105c79:	85 c0                	test   %eax,%eax
80105c7b:	78 13                	js     80105c90 <sys_setVariable+0x40>
    return -1;
  return setVariable(var, val);
80105c7d:	83 ec 08             	sub    $0x8,%esp
80105c80:	ff 75 f4             	pushl  -0xc(%ebp)
80105c83:	ff 75 f0             	pushl  -0x10(%ebp)
80105c86:	e8 65 e6 ff ff       	call   801042f0 <setVariable>
80105c8b:	83 c4 10             	add    $0x10,%esp
}
80105c8e:	c9                   	leave  
80105c8f:	c3                   	ret    

int sys_setVariable(void) {
  char* var;
  char *val;
  if(argstr(0, &var) < 0 || argstr(1, &val) < 0)
    return -1;
80105c90:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return setVariable(var, val);
}
80105c95:	c9                   	leave  
80105c96:	c3                   	ret    
80105c97:	89 f6                	mov    %esi,%esi
80105c99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105ca0 <sys_getVariable>:

int sys_getVariable(void) {
80105ca0:	55                   	push   %ebp
80105ca1:	89 e5                	mov    %esp,%ebp
80105ca3:	83 ec 20             	sub    $0x20,%esp
  char* var;
  char *val;
  if(argstr(0, &var) < 0 || argstr(1, &val) < 0)
80105ca6:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105ca9:	50                   	push   %eax
80105caa:	6a 00                	push   $0x0
80105cac:	e8 4f f1 ff ff       	call   80104e00 <argstr>
80105cb1:	83 c4 10             	add    $0x10,%esp
80105cb4:	85 c0                	test   %eax,%eax
80105cb6:	78 28                	js     80105ce0 <sys_getVariable+0x40>
80105cb8:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105cbb:	83 ec 08             	sub    $0x8,%esp
80105cbe:	50                   	push   %eax
80105cbf:	6a 01                	push   $0x1
80105cc1:	e8 3a f1 ff ff       	call   80104e00 <argstr>
80105cc6:	83 c4 10             	add    $0x10,%esp
80105cc9:	85 c0                	test   %eax,%eax
80105ccb:	78 13                	js     80105ce0 <sys_getVariable+0x40>
    return -1;
  return getVariable(var, val);
80105ccd:	83 ec 08             	sub    $0x8,%esp
80105cd0:	ff 75 f4             	pushl  -0xc(%ebp)
80105cd3:	ff 75 f0             	pushl  -0x10(%ebp)
80105cd6:	e8 65 e7 ff ff       	call   80104440 <getVariable>
80105cdb:	83 c4 10             	add    $0x10,%esp
}
80105cde:	c9                   	leave  
80105cdf:	c3                   	ret    

int sys_getVariable(void) {
  char* var;
  char *val;
  if(argstr(0, &var) < 0 || argstr(1, &val) < 0)
    return -1;
80105ce0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return getVariable(var, val);
}
80105ce5:	c9                   	leave  
80105ce6:	c3                   	ret    
80105ce7:	89 f6                	mov    %esi,%esi
80105ce9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105cf0 <sys_remVariable>:

int sys_remVariable(void) {
80105cf0:	55                   	push   %ebp
80105cf1:	89 e5                	mov    %esp,%ebp
80105cf3:	83 ec 20             	sub    $0x20,%esp
  char* var;
  if(argstr(0, &var) < 0)
80105cf6:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105cf9:	50                   	push   %eax
80105cfa:	6a 00                	push   $0x0
80105cfc:	e8 ff f0 ff ff       	call   80104e00 <argstr>
80105d01:	83 c4 10             	add    $0x10,%esp
80105d04:	85 c0                	test   %eax,%eax
80105d06:	78 18                	js     80105d20 <sys_remVariable+0x30>
    return -1;
  return remVariable(var);
80105d08:	83 ec 0c             	sub    $0xc,%esp
80105d0b:	ff 75 f4             	pushl  -0xc(%ebp)
80105d0e:	e8 dd e7 ff ff       	call   801044f0 <remVariable>
80105d13:	83 c4 10             	add    $0x10,%esp
}
80105d16:	c9                   	leave  
80105d17:	c3                   	ret    
80105d18:	90                   	nop
80105d19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
}

int sys_remVariable(void) {
  char* var;
  if(argstr(0, &var) < 0)
    return -1;
80105d20:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return remVariable(var);
}
80105d25:	c9                   	leave  
80105d26:	c3                   	ret    
80105d27:	89 f6                	mov    %esi,%esi
80105d29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105d30 <sys_wait2>:

int sys_wait2(void){
80105d30:	55                   	push   %ebp
80105d31:	89 e5                	mov    %esp,%ebp
80105d33:	83 ec 20             	sub    $0x20,%esp
  int pid, wtime, rtime, iotime;
  if(argint(0, &pid) < 0)
80105d36:	8d 45 e8             	lea    -0x18(%ebp),%eax
80105d39:	50                   	push   %eax
80105d3a:	6a 00                	push   $0x0
80105d3c:	e8 0f f0 ff ff       	call   80104d50 <argint>
80105d41:	83 c4 10             	add    $0x10,%esp
80105d44:	85 c0                	test   %eax,%eax
80105d46:	78 20                	js     80105d68 <sys_wait2+0x38>
    return -1;
  return wait2(pid, &wtime, &rtime, &iotime);
80105d48:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105d4b:	50                   	push   %eax
80105d4c:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105d4f:	50                   	push   %eax
80105d50:	8d 45 ec             	lea    -0x14(%ebp),%eax
80105d53:	50                   	push   %eax
80105d54:	ff 75 e8             	pushl  -0x18(%ebp)
80105d57:	e8 34 e8 ff ff       	call   80104590 <wait2>
80105d5c:	83 c4 10             	add    $0x10,%esp
}
80105d5f:	c9                   	leave  
80105d60:	c3                   	ret    
80105d61:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
}

int sys_wait2(void){
  int pid, wtime, rtime, iotime;
  if(argint(0, &pid) < 0)
    return -1;
80105d68:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return wait2(pid, &wtime, &rtime, &iotime);
}
80105d6d:	c9                   	leave  
80105d6e:	c3                   	ret    

80105d6f <alltraps>:

  # vectors.S sends all traps here.
.globl alltraps
alltraps:
  # Build trap frame.
  pushl %ds
80105d6f:	1e                   	push   %ds
  pushl %es
80105d70:	06                   	push   %es
  pushl %fs
80105d71:	0f a0                	push   %fs
  pushl %gs
80105d73:	0f a8                	push   %gs
  pushal
80105d75:	60                   	pusha  
  
  # Set up data segments.
  movw $(SEG_KDATA<<3), %ax
80105d76:	66 b8 10 00          	mov    $0x10,%ax
  movw %ax, %ds
80105d7a:	8e d8                	mov    %eax,%ds
  movw %ax, %es
80105d7c:	8e c0                	mov    %eax,%es

  # Call trap(tf), where tf=%esp
  pushl %esp
80105d7e:	54                   	push   %esp
  call trap
80105d7f:	e8 ec 00 00 00       	call   80105e70 <trap>
  addl $4, %esp
80105d84:	83 c4 04             	add    $0x4,%esp

80105d87 <trapret>:

  # Return falls through to trapret...
.globl trapret
trapret:
  popal
80105d87:	61                   	popa   
  popl %gs
80105d88:	0f a9                	pop    %gs
  popl %fs
80105d8a:	0f a1                	pop    %fs
  popl %es
80105d8c:	07                   	pop    %es
  popl %ds
80105d8d:	1f                   	pop    %ds
  addl $0x8, %esp  # trapno and errcode
80105d8e:	83 c4 08             	add    $0x8,%esp
  iret
80105d91:	cf                   	iret   
80105d92:	66 90                	xchg   %ax,%ax
80105d94:	66 90                	xchg   %ax,%ax
80105d96:	66 90                	xchg   %ax,%ax
80105d98:	66 90                	xchg   %ax,%ax
80105d9a:	66 90                	xchg   %ax,%ax
80105d9c:	66 90                	xchg   %ax,%ax
80105d9e:	66 90                	xchg   %ax,%ax

80105da0 <tvinit>:
uint ticks;
extern int inctickcounter(void);

void
tvinit(void)
{
80105da0:	55                   	push   %ebp
  int i;

  for(i = 0; i < 256; i++)
80105da1:	31 c0                	xor    %eax,%eax
uint ticks;
extern int inctickcounter(void);

void
tvinit(void)
{
80105da3:	89 e5                	mov    %esp,%ebp
80105da5:	83 ec 08             	sub    $0x8,%esp
80105da8:	90                   	nop
80105da9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  int i;

  for(i = 0; i < 256; i++)
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
80105db0:	8b 14 85 08 b0 10 80 	mov    -0x7fef4ff8(,%eax,4),%edx
80105db7:	b9 08 00 00 00       	mov    $0x8,%ecx
80105dbc:	c6 04 c5 c4 83 11 80 	movb   $0x0,-0x7fee7c3c(,%eax,8)
80105dc3:	00 
80105dc4:	66 89 0c c5 c2 83 11 	mov    %cx,-0x7fee7c3e(,%eax,8)
80105dcb:	80 
80105dcc:	c6 04 c5 c5 83 11 80 	movb   $0x8e,-0x7fee7c3b(,%eax,8)
80105dd3:	8e 
80105dd4:	66 89 14 c5 c0 83 11 	mov    %dx,-0x7fee7c40(,%eax,8)
80105ddb:	80 
80105ddc:	c1 ea 10             	shr    $0x10,%edx
80105ddf:	66 89 14 c5 c6 83 11 	mov    %dx,-0x7fee7c3a(,%eax,8)
80105de6:	80 
void
tvinit(void)
{
  int i;

  for(i = 0; i < 256; i++)
80105de7:	83 c0 01             	add    $0x1,%eax
80105dea:	3d 00 01 00 00       	cmp    $0x100,%eax
80105def:	75 bf                	jne    80105db0 <tvinit+0x10>
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
80105df1:	a1 08 b1 10 80       	mov    0x8010b108,%eax

  initlock(&tickslock, "time");
80105df6:	83 ec 08             	sub    $0x8,%esp
{
  int i;

  for(i = 0; i < 256; i++)
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
80105df9:	ba 08 00 00 00       	mov    $0x8,%edx

  initlock(&tickslock, "time");
80105dfe:	68 cd 7d 10 80       	push   $0x80107dcd
80105e03:	68 80 83 11 80       	push   $0x80118380
{
  int i;

  for(i = 0; i < 256; i++)
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
80105e08:	66 89 15 c2 85 11 80 	mov    %dx,0x801185c2
80105e0f:	c6 05 c4 85 11 80 00 	movb   $0x0,0x801185c4
80105e16:	66 a3 c0 85 11 80    	mov    %ax,0x801185c0
80105e1c:	c1 e8 10             	shr    $0x10,%eax
80105e1f:	c6 05 c5 85 11 80 ef 	movb   $0xef,0x801185c5
80105e26:	66 a3 c6 85 11 80    	mov    %ax,0x801185c6

  initlock(&tickslock, "time");
80105e2c:	e8 bf e9 ff ff       	call   801047f0 <initlock>
}
80105e31:	83 c4 10             	add    $0x10,%esp
80105e34:	c9                   	leave  
80105e35:	c3                   	ret    
80105e36:	8d 76 00             	lea    0x0(%esi),%esi
80105e39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105e40 <idtinit>:

void
idtinit(void)
{
80105e40:	55                   	push   %ebp
static inline void
lidt(struct gatedesc *p, int size)
{
  volatile ushort pd[3];

  pd[0] = size-1;
80105e41:	b8 ff 07 00 00       	mov    $0x7ff,%eax
80105e46:	89 e5                	mov    %esp,%ebp
80105e48:	83 ec 10             	sub    $0x10,%esp
80105e4b:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
  pd[1] = (uint)p;
80105e4f:	b8 c0 83 11 80       	mov    $0x801183c0,%eax
80105e54:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  pd[2] = (uint)p >> 16;
80105e58:	c1 e8 10             	shr    $0x10,%eax
80105e5b:	66 89 45 fe          	mov    %ax,-0x2(%ebp)

  asm volatile("lidt (%0)" : : "r" (pd));
80105e5f:	8d 45 fa             	lea    -0x6(%ebp),%eax
80105e62:	0f 01 18             	lidtl  (%eax)
  lidt(idt, sizeof(idt));
}
80105e65:	c9                   	leave  
80105e66:	c3                   	ret    
80105e67:	89 f6                	mov    %esi,%esi
80105e69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105e70 <trap>:

//PAGEBREAK: 41
void
trap(struct trapframe *tf)
{
80105e70:	55                   	push   %ebp
80105e71:	89 e5                	mov    %esp,%ebp
80105e73:	57                   	push   %edi
80105e74:	56                   	push   %esi
80105e75:	53                   	push   %ebx
80105e76:	83 ec 1c             	sub    $0x1c,%esp
80105e79:	8b 7d 08             	mov    0x8(%ebp),%edi
  if(tf->trapno == T_SYSCALL){
80105e7c:	8b 47 30             	mov    0x30(%edi),%eax
80105e7f:	83 f8 40             	cmp    $0x40,%eax
80105e82:	0f 84 b8 01 00 00    	je     80106040 <trap+0x1d0>
      exit();
    return;
  }
//if we got here, trap() was called because of interrupt.
//switch asks which interrupt occured.
  switch(tf->trapno){
80105e88:	83 e8 20             	sub    $0x20,%eax
80105e8b:	83 f8 1f             	cmp    $0x1f,%eax
80105e8e:	77 10                	ja     80105ea0 <trap+0x30>
80105e90:	ff 24 85 74 7e 10 80 	jmp    *-0x7fef818c(,%eax,4)
80105e97:	89 f6                	mov    %esi,%esi
80105e99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    lapiceoi();
    break;

  //PAGEBREAK: 13
  default:
    if(myproc() == 0 || (tf->cs&3) == 0){
80105ea0:	e8 1b da ff ff       	call   801038c0 <myproc>
80105ea5:	85 c0                	test   %eax,%eax
80105ea7:	0f 84 e3 01 00 00    	je     80106090 <trap+0x220>
80105ead:	f6 47 3c 03          	testb  $0x3,0x3c(%edi)
80105eb1:	0f 84 d9 01 00 00    	je     80106090 <trap+0x220>

static inline uint
rcr2(void)
{
  uint val;
  asm volatile("movl %%cr2,%0" : "=r" (val));
80105eb7:	0f 20 d1             	mov    %cr2,%ecx
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpuid(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80105eba:	8b 57 38             	mov    0x38(%edi),%edx
80105ebd:	89 4d d8             	mov    %ecx,-0x28(%ebp)
80105ec0:	89 55 dc             	mov    %edx,-0x24(%ebp)
80105ec3:	e8 d8 d9 ff ff       	call   801038a0 <cpuid>
80105ec8:	8b 77 34             	mov    0x34(%edi),%esi
80105ecb:	8b 5f 30             	mov    0x30(%edi),%ebx
80105ece:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            "eip 0x%x addr 0x%x--kill proc\n",
            myproc()->pid, myproc()->name, tf->trapno,
80105ed1:	e8 ea d9 ff ff       	call   801038c0 <myproc>
80105ed6:	89 45 e0             	mov    %eax,-0x20(%ebp)
80105ed9:	e8 e2 d9 ff ff       	call   801038c0 <myproc>
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpuid(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80105ede:	8b 4d d8             	mov    -0x28(%ebp),%ecx
80105ee1:	8b 55 dc             	mov    -0x24(%ebp),%edx
80105ee4:	51                   	push   %ecx
80105ee5:	52                   	push   %edx
            "eip 0x%x addr 0x%x--kill proc\n",
            myproc()->pid, myproc()->name, tf->trapno,
80105ee6:	8b 55 e0             	mov    -0x20(%ebp),%edx
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpuid(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80105ee9:	ff 75 e4             	pushl  -0x1c(%ebp)
80105eec:	56                   	push   %esi
80105eed:	53                   	push   %ebx
            "eip 0x%x addr 0x%x--kill proc\n",
            myproc()->pid, myproc()->name, tf->trapno,
80105eee:	83 c2 6c             	add    $0x6c,%edx
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpuid(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80105ef1:	52                   	push   %edx
80105ef2:	ff 70 10             	pushl  0x10(%eax)
80105ef5:	68 30 7e 10 80       	push   $0x80107e30
80105efa:	e8 61 a7 ff ff       	call   80100660 <cprintf>
            "eip 0x%x addr 0x%x--kill proc\n",
            myproc()->pid, myproc()->name, tf->trapno,
            tf->err, cpuid(), tf->eip, rcr2());
    myproc()->killed = 1;
80105eff:	83 c4 20             	add    $0x20,%esp
80105f02:	e8 b9 d9 ff ff       	call   801038c0 <myproc>
80105f07:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
80105f0e:	66 90                	xchg   %ax,%ax
  }

  // Force process exit if it has been killed and is in user space.
  // (If it is still executing in the kernel, let it keep running
  // until it gets to the regular system call return.)
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
80105f10:	e8 ab d9 ff ff       	call   801038c0 <myproc>
80105f15:	85 c0                	test   %eax,%eax
80105f17:	74 0c                	je     80105f25 <trap+0xb5>
80105f19:	e8 a2 d9 ff ff       	call   801038c0 <myproc>
80105f1e:	8b 50 24             	mov    0x24(%eax),%edx
80105f21:	85 d2                	test   %edx,%edx
80105f23:	75 33                	jne    80105f58 <trap+0xe8>
     tf->trapno == T_IRQ0+IRQ_TIMER && ticks % QUANTUM == 0)
    yield();
  #endif

  // Check if the process has been killed since we yielded
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
80105f25:	e8 96 d9 ff ff       	call   801038c0 <myproc>
80105f2a:	85 c0                	test   %eax,%eax
80105f2c:	74 1d                	je     80105f4b <trap+0xdb>
80105f2e:	e8 8d d9 ff ff       	call   801038c0 <myproc>
80105f33:	8b 40 24             	mov    0x24(%eax),%eax
80105f36:	85 c0                	test   %eax,%eax
80105f38:	74 11                	je     80105f4b <trap+0xdb>
80105f3a:	0f b7 47 3c          	movzwl 0x3c(%edi),%eax
80105f3e:	83 e0 03             	and    $0x3,%eax
80105f41:	66 83 f8 03          	cmp    $0x3,%ax
80105f45:	0f 84 1e 01 00 00    	je     80106069 <trap+0x1f9>
    exit();
}
80105f4b:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105f4e:	5b                   	pop    %ebx
80105f4f:	5e                   	pop    %esi
80105f50:	5f                   	pop    %edi
80105f51:	5d                   	pop    %ebp
80105f52:	c3                   	ret    
80105f53:	90                   	nop
80105f54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  }

  // Force process exit if it has been killed and is in user space.
  // (If it is still executing in the kernel, let it keep running
  // until it gets to the regular system call return.)
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
80105f58:	0f b7 47 3c          	movzwl 0x3c(%edi),%eax
80105f5c:	83 e0 03             	and    $0x3,%eax
80105f5f:	66 83 f8 03          	cmp    $0x3,%ax
80105f63:	75 c0                	jne    80105f25 <trap+0xb5>
    exit();
80105f65:	e8 c6 dd ff ff       	call   80103d30 <exit>
80105f6a:	eb b9                	jmp    80105f25 <trap+0xb5>
80105f6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      }
    }
    lapiceoi();
    break;
  case T_IRQ0 + IRQ_IDE:
    ideintr();
80105f70:	e8 db c0 ff ff       	call   80102050 <ideintr>
    lapiceoi();
80105f75:	e8 a6 c7 ff ff       	call   80102720 <lapiceoi>
    break;
80105f7a:	eb 94                	jmp    80105f10 <trap+0xa0>
80105f7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  }
//if we got here, trap() was called because of interrupt.
//switch asks which interrupt occured.
  switch(tf->trapno){
  case T_IRQ0 + IRQ_TIMER: //clock interrupt
    if(cpuid() == 0){
80105f80:	e8 1b d9 ff ff       	call   801038a0 <cpuid>
80105f85:	85 c0                	test   %eax,%eax
80105f87:	75 ec                	jne    80105f75 <trap+0x105>
      acquire(&tickslock);
80105f89:	83 ec 0c             	sub    $0xc,%esp
80105f8c:	68 80 83 11 80       	push   $0x80118380
80105f91:	e8 5a e9 ff ff       	call   801048f0 <acquire>
      ticks++;
      wakeup(&ticks);
80105f96:	c7 04 24 c0 8b 11 80 	movl   $0x80118bc0,(%esp)
//switch asks which interrupt occured.
  switch(tf->trapno){
  case T_IRQ0 + IRQ_TIMER: //clock interrupt
    if(cpuid() == 0){
      acquire(&tickslock);
      ticks++;
80105f9d:	83 05 c0 8b 11 80 01 	addl   $0x1,0x80118bc0
      wakeup(&ticks);
80105fa4:	e8 d7 e0 ff ff       	call   80104080 <wakeup>
      release(&tickslock);
80105fa9:	c7 04 24 80 83 11 80 	movl   $0x80118380,(%esp)
80105fb0:	e8 5b ea ff ff       	call   80104a10 <release>
      // check if proc is running or sleeping and update time fields accordingly.
      if(myproc() != 0){
80105fb5:	e8 06 d9 ff ff       	call   801038c0 <myproc>
80105fba:	83 c4 10             	add    $0x10,%esp
80105fbd:	85 c0                	test   %eax,%eax
80105fbf:	74 b4                	je     80105f75 <trap+0x105>
        if(myproc()->state == RUNNING)
80105fc1:	e8 fa d8 ff ff       	call   801038c0 <myproc>
80105fc6:	83 78 0c 04          	cmpl   $0x4,0xc(%eax)
80105fca:	0f 84 af 00 00 00    	je     8010607f <trap+0x20f>
          myproc()->rtime++;
        else if(myproc()->state == SLEEPING)
80105fd0:	e8 eb d8 ff ff       	call   801038c0 <myproc>
80105fd5:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80105fd9:	75 9a                	jne    80105f75 <trap+0x105>
          myproc()->iotime++;
80105fdb:	e8 e0 d8 ff ff       	call   801038c0 <myproc>
80105fe0:	83 80 84 00 00 00 01 	addl   $0x1,0x84(%eax)
80105fe7:	eb 8c                	jmp    80105f75 <trap+0x105>
80105fe9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    break;
  case T_IRQ0 + IRQ_IDE+1:
    // Bochs generates spurious IDE1 interrupts.
    break;
  case T_IRQ0 + IRQ_KBD:
    kbdintr();
80105ff0:	e8 eb c5 ff ff       	call   801025e0 <kbdintr>
    lapiceoi();
80105ff5:	e8 26 c7 ff ff       	call   80102720 <lapiceoi>
    break;
80105ffa:	e9 11 ff ff ff       	jmp    80105f10 <trap+0xa0>
80105fff:	90                   	nop
  case T_IRQ0 + IRQ_COM1:
    uartintr();
80106000:	e8 2b 02 00 00       	call   80106230 <uartintr>
    lapiceoi();
80106005:	e8 16 c7 ff ff       	call   80102720 <lapiceoi>
    break;
8010600a:	e9 01 ff ff ff       	jmp    80105f10 <trap+0xa0>
8010600f:	90                   	nop
  case T_IRQ0 + 7:
  case T_IRQ0 + IRQ_SPURIOUS:
    cprintf("cpu%d: spurious interrupt at %x:%x\n",
80106010:	0f b7 5f 3c          	movzwl 0x3c(%edi),%ebx
80106014:	8b 77 38             	mov    0x38(%edi),%esi
80106017:	e8 84 d8 ff ff       	call   801038a0 <cpuid>
8010601c:	56                   	push   %esi
8010601d:	53                   	push   %ebx
8010601e:	50                   	push   %eax
8010601f:	68 d8 7d 10 80       	push   $0x80107dd8
80106024:	e8 37 a6 ff ff       	call   80100660 <cprintf>
            cpuid(), tf->cs, tf->eip);
    lapiceoi();
80106029:	e8 f2 c6 ff ff       	call   80102720 <lapiceoi>
    break;
8010602e:	83 c4 10             	add    $0x10,%esp
80106031:	e9 da fe ff ff       	jmp    80105f10 <trap+0xa0>
80106036:	8d 76 00             	lea    0x0(%esi),%esi
80106039:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
//PAGEBREAK: 41
void
trap(struct trapframe *tf)
{
  if(tf->trapno == T_SYSCALL){
    if(myproc()->killed)
80106040:	e8 7b d8 ff ff       	call   801038c0 <myproc>
80106045:	8b 58 24             	mov    0x24(%eax),%ebx
80106048:	85 db                	test   %ebx,%ebx
8010604a:	75 2c                	jne    80106078 <trap+0x208>
      exit();
    myproc()->tf = tf;
8010604c:	e8 6f d8 ff ff       	call   801038c0 <myproc>
80106051:	89 78 18             	mov    %edi,0x18(%eax)
    syscall();
80106054:	e8 e7 ed ff ff       	call   80104e40 <syscall>
    if(myproc()->killed)
80106059:	e8 62 d8 ff ff       	call   801038c0 <myproc>
8010605e:	8b 48 24             	mov    0x24(%eax),%ecx
80106061:	85 c9                	test   %ecx,%ecx
80106063:	0f 84 e2 fe ff ff    	je     80105f4b <trap+0xdb>
  #endif

  // Check if the process has been killed since we yielded
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
    exit();
}
80106069:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010606c:	5b                   	pop    %ebx
8010606d:	5e                   	pop    %esi
8010606e:	5f                   	pop    %edi
8010606f:	5d                   	pop    %ebp
    if(myproc()->killed)
      exit();
    myproc()->tf = tf;
    syscall();
    if(myproc()->killed)
      exit();
80106070:	e9 bb dc ff ff       	jmp    80103d30 <exit>
80106075:	8d 76 00             	lea    0x0(%esi),%esi
void
trap(struct trapframe *tf)
{
  if(tf->trapno == T_SYSCALL){
    if(myproc()->killed)
      exit();
80106078:	e8 b3 dc ff ff       	call   80103d30 <exit>
8010607d:	eb cd                	jmp    8010604c <trap+0x1dc>
      wakeup(&ticks);
      release(&tickslock);
      // check if proc is running or sleeping and update time fields accordingly.
      if(myproc() != 0){
        if(myproc()->state == RUNNING)
          myproc()->rtime++;
8010607f:	e8 3c d8 ff ff       	call   801038c0 <myproc>
80106084:	83 80 88 00 00 00 01 	addl   $0x1,0x88(%eax)
8010608b:	e9 e5 fe ff ff       	jmp    80105f75 <trap+0x105>
80106090:	0f 20 d6             	mov    %cr2,%esi

  //PAGEBREAK: 13
  default:
    if(myproc() == 0 || (tf->cs&3) == 0){
      // In kernel, it must be our mistake.
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
80106093:	8b 5f 38             	mov    0x38(%edi),%ebx
80106096:	e8 05 d8 ff ff       	call   801038a0 <cpuid>
8010609b:	83 ec 0c             	sub    $0xc,%esp
8010609e:	56                   	push   %esi
8010609f:	53                   	push   %ebx
801060a0:	50                   	push   %eax
801060a1:	ff 77 30             	pushl  0x30(%edi)
801060a4:	68 fc 7d 10 80       	push   $0x80107dfc
801060a9:	e8 b2 a5 ff ff       	call   80100660 <cprintf>
              tf->trapno, cpuid(), tf->eip, rcr2());
      panic("trap");
801060ae:	83 c4 14             	add    $0x14,%esp
801060b1:	68 d2 7d 10 80       	push   $0x80107dd2
801060b6:	e8 b5 a2 ff ff       	call   80100370 <panic>
801060bb:	66 90                	xchg   %ax,%ax
801060bd:	66 90                	xchg   %ax,%ax
801060bf:	90                   	nop

801060c0 <uartgetc>:
}

static int
uartgetc(void)
{
  if(!uart)
801060c0:	a1 c8 b5 10 80       	mov    0x8010b5c8,%eax
  outb(COM1+0, c);
}

static int
uartgetc(void)
{
801060c5:	55                   	push   %ebp
801060c6:	89 e5                	mov    %esp,%ebp
  if(!uart)
801060c8:	85 c0                	test   %eax,%eax
801060ca:	74 1c                	je     801060e8 <uartgetc+0x28>
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801060cc:	ba fd 03 00 00       	mov    $0x3fd,%edx
801060d1:	ec                   	in     (%dx),%al
    return -1;
  if(!(inb(COM1+5) & 0x01))
801060d2:	a8 01                	test   $0x1,%al
801060d4:	74 12                	je     801060e8 <uartgetc+0x28>
801060d6:	ba f8 03 00 00       	mov    $0x3f8,%edx
801060db:	ec                   	in     (%dx),%al
    return -1;
  return inb(COM1+0);
801060dc:	0f b6 c0             	movzbl %al,%eax
}
801060df:	5d                   	pop    %ebp
801060e0:	c3                   	ret    
801060e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

static int
uartgetc(void)
{
  if(!uart)
    return -1;
801060e8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  if(!(inb(COM1+5) & 0x01))
    return -1;
  return inb(COM1+0);
}
801060ed:	5d                   	pop    %ebp
801060ee:	c3                   	ret    
801060ef:	90                   	nop

801060f0 <uartputc.part.0>:
  for(p="xv6...\n"; *p; p++)
    uartputc(*p);
}

void
uartputc(int c)
801060f0:	55                   	push   %ebp
801060f1:	89 e5                	mov    %esp,%ebp
801060f3:	57                   	push   %edi
801060f4:	56                   	push   %esi
801060f5:	53                   	push   %ebx
801060f6:	89 c7                	mov    %eax,%edi
801060f8:	bb 80 00 00 00       	mov    $0x80,%ebx
801060fd:	be fd 03 00 00       	mov    $0x3fd,%esi
80106102:	83 ec 0c             	sub    $0xc,%esp
80106105:	eb 1b                	jmp    80106122 <uartputc.part.0+0x32>
80106107:	89 f6                	mov    %esi,%esi
80106109:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  int i;

  if(!uart)
    return;
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
    microdelay(10);
80106110:	83 ec 0c             	sub    $0xc,%esp
80106113:	6a 0a                	push   $0xa
80106115:	e8 26 c6 ff ff       	call   80102740 <microdelay>
{
  int i;

  if(!uart)
    return;
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
8010611a:	83 c4 10             	add    $0x10,%esp
8010611d:	83 eb 01             	sub    $0x1,%ebx
80106120:	74 07                	je     80106129 <uartputc.part.0+0x39>
80106122:	89 f2                	mov    %esi,%edx
80106124:	ec                   	in     (%dx),%al
80106125:	a8 20                	test   $0x20,%al
80106127:	74 e7                	je     80106110 <uartputc.part.0+0x20>
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80106129:	ba f8 03 00 00       	mov    $0x3f8,%edx
8010612e:	89 f8                	mov    %edi,%eax
80106130:	ee                   	out    %al,(%dx)
    microdelay(10);
  outb(COM1+0, c);
}
80106131:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106134:	5b                   	pop    %ebx
80106135:	5e                   	pop    %esi
80106136:	5f                   	pop    %edi
80106137:	5d                   	pop    %ebp
80106138:	c3                   	ret    
80106139:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80106140 <uartinit>:

static int uart;    // is there a uart?

void
uartinit(void)
{
80106140:	55                   	push   %ebp
80106141:	31 c9                	xor    %ecx,%ecx
80106143:	89 c8                	mov    %ecx,%eax
80106145:	89 e5                	mov    %esp,%ebp
80106147:	57                   	push   %edi
80106148:	56                   	push   %esi
80106149:	53                   	push   %ebx
8010614a:	bb fa 03 00 00       	mov    $0x3fa,%ebx
8010614f:	89 da                	mov    %ebx,%edx
80106151:	83 ec 0c             	sub    $0xc,%esp
80106154:	ee                   	out    %al,(%dx)
80106155:	bf fb 03 00 00       	mov    $0x3fb,%edi
8010615a:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
8010615f:	89 fa                	mov    %edi,%edx
80106161:	ee                   	out    %al,(%dx)
80106162:	b8 0c 00 00 00       	mov    $0xc,%eax
80106167:	ba f8 03 00 00       	mov    $0x3f8,%edx
8010616c:	ee                   	out    %al,(%dx)
8010616d:	be f9 03 00 00       	mov    $0x3f9,%esi
80106172:	89 c8                	mov    %ecx,%eax
80106174:	89 f2                	mov    %esi,%edx
80106176:	ee                   	out    %al,(%dx)
80106177:	b8 03 00 00 00       	mov    $0x3,%eax
8010617c:	89 fa                	mov    %edi,%edx
8010617e:	ee                   	out    %al,(%dx)
8010617f:	ba fc 03 00 00       	mov    $0x3fc,%edx
80106184:	89 c8                	mov    %ecx,%eax
80106186:	ee                   	out    %al,(%dx)
80106187:	b8 01 00 00 00       	mov    $0x1,%eax
8010618c:	89 f2                	mov    %esi,%edx
8010618e:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010618f:	ba fd 03 00 00       	mov    $0x3fd,%edx
80106194:	ec                   	in     (%dx),%al
  outb(COM1+3, 0x03);    // Lock divisor, 8 data bits.
  outb(COM1+4, 0);
  outb(COM1+1, 0x01);    // Enable receive interrupts.

  // If status is 0xFF, no serial port.
  if(inb(COM1+5) == 0xFF)
80106195:	3c ff                	cmp    $0xff,%al
80106197:	74 5a                	je     801061f3 <uartinit+0xb3>
    return;
  uart = 1;
80106199:	c7 05 c8 b5 10 80 01 	movl   $0x1,0x8010b5c8
801061a0:	00 00 00 
801061a3:	89 da                	mov    %ebx,%edx
801061a5:	ec                   	in     (%dx),%al
801061a6:	ba f8 03 00 00       	mov    $0x3f8,%edx
801061ab:	ec                   	in     (%dx),%al

  // Acknowledge pre-existing interrupt conditions;
  // enable interrupts.
  inb(COM1+2);
  inb(COM1+0);
  ioapicenable(IRQ_COM1, 0);
801061ac:	83 ec 08             	sub    $0x8,%esp
801061af:	bb f4 7e 10 80       	mov    $0x80107ef4,%ebx
801061b4:	6a 00                	push   $0x0
801061b6:	6a 04                	push   $0x4
801061b8:	e8 e3 c0 ff ff       	call   801022a0 <ioapicenable>
801061bd:	83 c4 10             	add    $0x10,%esp
801061c0:	b8 78 00 00 00       	mov    $0x78,%eax
801061c5:	eb 13                	jmp    801061da <uartinit+0x9a>
801061c7:	89 f6                	mov    %esi,%esi
801061c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

  // Announce that we're here.
  for(p="xv6...\n"; *p; p++)
801061d0:	83 c3 01             	add    $0x1,%ebx
801061d3:	0f be 03             	movsbl (%ebx),%eax
801061d6:	84 c0                	test   %al,%al
801061d8:	74 19                	je     801061f3 <uartinit+0xb3>
void
uartputc(int c)
{
  int i;

  if(!uart)
801061da:	8b 15 c8 b5 10 80    	mov    0x8010b5c8,%edx
801061e0:	85 d2                	test   %edx,%edx
801061e2:	74 ec                	je     801061d0 <uartinit+0x90>
  inb(COM1+2);
  inb(COM1+0);
  ioapicenable(IRQ_COM1, 0);

  // Announce that we're here.
  for(p="xv6...\n"; *p; p++)
801061e4:	83 c3 01             	add    $0x1,%ebx
801061e7:	e8 04 ff ff ff       	call   801060f0 <uartputc.part.0>
801061ec:	0f be 03             	movsbl (%ebx),%eax
801061ef:	84 c0                	test   %al,%al
801061f1:	75 e7                	jne    801061da <uartinit+0x9a>
    uartputc(*p);
}
801061f3:	8d 65 f4             	lea    -0xc(%ebp),%esp
801061f6:	5b                   	pop    %ebx
801061f7:	5e                   	pop    %esi
801061f8:	5f                   	pop    %edi
801061f9:	5d                   	pop    %ebp
801061fa:	c3                   	ret    
801061fb:	90                   	nop
801061fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106200 <uartputc>:
void
uartputc(int c)
{
  int i;

  if(!uart)
80106200:	8b 15 c8 b5 10 80    	mov    0x8010b5c8,%edx
    uartputc(*p);
}

void
uartputc(int c)
{
80106206:	55                   	push   %ebp
80106207:	89 e5                	mov    %esp,%ebp
  int i;

  if(!uart)
80106209:	85 d2                	test   %edx,%edx
    uartputc(*p);
}

void
uartputc(int c)
{
8010620b:	8b 45 08             	mov    0x8(%ebp),%eax
  int i;

  if(!uart)
8010620e:	74 10                	je     80106220 <uartputc+0x20>
    return;
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
    microdelay(10);
  outb(COM1+0, c);
}
80106210:	5d                   	pop    %ebp
80106211:	e9 da fe ff ff       	jmp    801060f0 <uartputc.part.0>
80106216:	8d 76 00             	lea    0x0(%esi),%esi
80106219:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80106220:	5d                   	pop    %ebp
80106221:	c3                   	ret    
80106222:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106229:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106230 <uartintr>:
  return inb(COM1+0);
}

void
uartintr(void)
{
80106230:	55                   	push   %ebp
80106231:	89 e5                	mov    %esp,%ebp
80106233:	83 ec 14             	sub    $0x14,%esp
  consoleintr(uartgetc);
80106236:	68 c0 60 10 80       	push   $0x801060c0
8010623b:	e8 a0 a5 ff ff       	call   801007e0 <consoleintr>
}
80106240:	83 c4 10             	add    $0x10,%esp
80106243:	c9                   	leave  
80106244:	c3                   	ret    

80106245 <vector0>:
# generated by vectors.pl - do not edit
# handlers
.globl alltraps
.globl vector0
vector0:
  pushl $0
80106245:	6a 00                	push   $0x0
  pushl $0
80106247:	6a 00                	push   $0x0
  jmp alltraps
80106249:	e9 21 fb ff ff       	jmp    80105d6f <alltraps>

8010624e <vector1>:
.globl vector1
vector1:
  pushl $0
8010624e:	6a 00                	push   $0x0
  pushl $1
80106250:	6a 01                	push   $0x1
  jmp alltraps
80106252:	e9 18 fb ff ff       	jmp    80105d6f <alltraps>

80106257 <vector2>:
.globl vector2
vector2:
  pushl $0
80106257:	6a 00                	push   $0x0
  pushl $2
80106259:	6a 02                	push   $0x2
  jmp alltraps
8010625b:	e9 0f fb ff ff       	jmp    80105d6f <alltraps>

80106260 <vector3>:
.globl vector3
vector3:
  pushl $0
80106260:	6a 00                	push   $0x0
  pushl $3
80106262:	6a 03                	push   $0x3
  jmp alltraps
80106264:	e9 06 fb ff ff       	jmp    80105d6f <alltraps>

80106269 <vector4>:
.globl vector4
vector4:
  pushl $0
80106269:	6a 00                	push   $0x0
  pushl $4
8010626b:	6a 04                	push   $0x4
  jmp alltraps
8010626d:	e9 fd fa ff ff       	jmp    80105d6f <alltraps>

80106272 <vector5>:
.globl vector5
vector5:
  pushl $0
80106272:	6a 00                	push   $0x0
  pushl $5
80106274:	6a 05                	push   $0x5
  jmp alltraps
80106276:	e9 f4 fa ff ff       	jmp    80105d6f <alltraps>

8010627b <vector6>:
.globl vector6
vector6:
  pushl $0
8010627b:	6a 00                	push   $0x0
  pushl $6
8010627d:	6a 06                	push   $0x6
  jmp alltraps
8010627f:	e9 eb fa ff ff       	jmp    80105d6f <alltraps>

80106284 <vector7>:
.globl vector7
vector7:
  pushl $0
80106284:	6a 00                	push   $0x0
  pushl $7
80106286:	6a 07                	push   $0x7
  jmp alltraps
80106288:	e9 e2 fa ff ff       	jmp    80105d6f <alltraps>

8010628d <vector8>:
.globl vector8
vector8:
  pushl $8
8010628d:	6a 08                	push   $0x8
  jmp alltraps
8010628f:	e9 db fa ff ff       	jmp    80105d6f <alltraps>

80106294 <vector9>:
.globl vector9
vector9:
  pushl $0
80106294:	6a 00                	push   $0x0
  pushl $9
80106296:	6a 09                	push   $0x9
  jmp alltraps
80106298:	e9 d2 fa ff ff       	jmp    80105d6f <alltraps>

8010629d <vector10>:
.globl vector10
vector10:
  pushl $10
8010629d:	6a 0a                	push   $0xa
  jmp alltraps
8010629f:	e9 cb fa ff ff       	jmp    80105d6f <alltraps>

801062a4 <vector11>:
.globl vector11
vector11:
  pushl $11
801062a4:	6a 0b                	push   $0xb
  jmp alltraps
801062a6:	e9 c4 fa ff ff       	jmp    80105d6f <alltraps>

801062ab <vector12>:
.globl vector12
vector12:
  pushl $12
801062ab:	6a 0c                	push   $0xc
  jmp alltraps
801062ad:	e9 bd fa ff ff       	jmp    80105d6f <alltraps>

801062b2 <vector13>:
.globl vector13
vector13:
  pushl $13
801062b2:	6a 0d                	push   $0xd
  jmp alltraps
801062b4:	e9 b6 fa ff ff       	jmp    80105d6f <alltraps>

801062b9 <vector14>:
.globl vector14
vector14:
  pushl $14
801062b9:	6a 0e                	push   $0xe
  jmp alltraps
801062bb:	e9 af fa ff ff       	jmp    80105d6f <alltraps>

801062c0 <vector15>:
.globl vector15
vector15:
  pushl $0
801062c0:	6a 00                	push   $0x0
  pushl $15
801062c2:	6a 0f                	push   $0xf
  jmp alltraps
801062c4:	e9 a6 fa ff ff       	jmp    80105d6f <alltraps>

801062c9 <vector16>:
.globl vector16
vector16:
  pushl $0
801062c9:	6a 00                	push   $0x0
  pushl $16
801062cb:	6a 10                	push   $0x10
  jmp alltraps
801062cd:	e9 9d fa ff ff       	jmp    80105d6f <alltraps>

801062d2 <vector17>:
.globl vector17
vector17:
  pushl $17
801062d2:	6a 11                	push   $0x11
  jmp alltraps
801062d4:	e9 96 fa ff ff       	jmp    80105d6f <alltraps>

801062d9 <vector18>:
.globl vector18
vector18:
  pushl $0
801062d9:	6a 00                	push   $0x0
  pushl $18
801062db:	6a 12                	push   $0x12
  jmp alltraps
801062dd:	e9 8d fa ff ff       	jmp    80105d6f <alltraps>

801062e2 <vector19>:
.globl vector19
vector19:
  pushl $0
801062e2:	6a 00                	push   $0x0
  pushl $19
801062e4:	6a 13                	push   $0x13
  jmp alltraps
801062e6:	e9 84 fa ff ff       	jmp    80105d6f <alltraps>

801062eb <vector20>:
.globl vector20
vector20:
  pushl $0
801062eb:	6a 00                	push   $0x0
  pushl $20
801062ed:	6a 14                	push   $0x14
  jmp alltraps
801062ef:	e9 7b fa ff ff       	jmp    80105d6f <alltraps>

801062f4 <vector21>:
.globl vector21
vector21:
  pushl $0
801062f4:	6a 00                	push   $0x0
  pushl $21
801062f6:	6a 15                	push   $0x15
  jmp alltraps
801062f8:	e9 72 fa ff ff       	jmp    80105d6f <alltraps>

801062fd <vector22>:
.globl vector22
vector22:
  pushl $0
801062fd:	6a 00                	push   $0x0
  pushl $22
801062ff:	6a 16                	push   $0x16
  jmp alltraps
80106301:	e9 69 fa ff ff       	jmp    80105d6f <alltraps>

80106306 <vector23>:
.globl vector23
vector23:
  pushl $0
80106306:	6a 00                	push   $0x0
  pushl $23
80106308:	6a 17                	push   $0x17
  jmp alltraps
8010630a:	e9 60 fa ff ff       	jmp    80105d6f <alltraps>

8010630f <vector24>:
.globl vector24
vector24:
  pushl $0
8010630f:	6a 00                	push   $0x0
  pushl $24
80106311:	6a 18                	push   $0x18
  jmp alltraps
80106313:	e9 57 fa ff ff       	jmp    80105d6f <alltraps>

80106318 <vector25>:
.globl vector25
vector25:
  pushl $0
80106318:	6a 00                	push   $0x0
  pushl $25
8010631a:	6a 19                	push   $0x19
  jmp alltraps
8010631c:	e9 4e fa ff ff       	jmp    80105d6f <alltraps>

80106321 <vector26>:
.globl vector26
vector26:
  pushl $0
80106321:	6a 00                	push   $0x0
  pushl $26
80106323:	6a 1a                	push   $0x1a
  jmp alltraps
80106325:	e9 45 fa ff ff       	jmp    80105d6f <alltraps>

8010632a <vector27>:
.globl vector27
vector27:
  pushl $0
8010632a:	6a 00                	push   $0x0
  pushl $27
8010632c:	6a 1b                	push   $0x1b
  jmp alltraps
8010632e:	e9 3c fa ff ff       	jmp    80105d6f <alltraps>

80106333 <vector28>:
.globl vector28
vector28:
  pushl $0
80106333:	6a 00                	push   $0x0
  pushl $28
80106335:	6a 1c                	push   $0x1c
  jmp alltraps
80106337:	e9 33 fa ff ff       	jmp    80105d6f <alltraps>

8010633c <vector29>:
.globl vector29
vector29:
  pushl $0
8010633c:	6a 00                	push   $0x0
  pushl $29
8010633e:	6a 1d                	push   $0x1d
  jmp alltraps
80106340:	e9 2a fa ff ff       	jmp    80105d6f <alltraps>

80106345 <vector30>:
.globl vector30
vector30:
  pushl $0
80106345:	6a 00                	push   $0x0
  pushl $30
80106347:	6a 1e                	push   $0x1e
  jmp alltraps
80106349:	e9 21 fa ff ff       	jmp    80105d6f <alltraps>

8010634e <vector31>:
.globl vector31
vector31:
  pushl $0
8010634e:	6a 00                	push   $0x0
  pushl $31
80106350:	6a 1f                	push   $0x1f
  jmp alltraps
80106352:	e9 18 fa ff ff       	jmp    80105d6f <alltraps>

80106357 <vector32>:
.globl vector32
vector32:
  pushl $0
80106357:	6a 00                	push   $0x0
  pushl $32
80106359:	6a 20                	push   $0x20
  jmp alltraps
8010635b:	e9 0f fa ff ff       	jmp    80105d6f <alltraps>

80106360 <vector33>:
.globl vector33
vector33:
  pushl $0
80106360:	6a 00                	push   $0x0
  pushl $33
80106362:	6a 21                	push   $0x21
  jmp alltraps
80106364:	e9 06 fa ff ff       	jmp    80105d6f <alltraps>

80106369 <vector34>:
.globl vector34
vector34:
  pushl $0
80106369:	6a 00                	push   $0x0
  pushl $34
8010636b:	6a 22                	push   $0x22
  jmp alltraps
8010636d:	e9 fd f9 ff ff       	jmp    80105d6f <alltraps>

80106372 <vector35>:
.globl vector35
vector35:
  pushl $0
80106372:	6a 00                	push   $0x0
  pushl $35
80106374:	6a 23                	push   $0x23
  jmp alltraps
80106376:	e9 f4 f9 ff ff       	jmp    80105d6f <alltraps>

8010637b <vector36>:
.globl vector36
vector36:
  pushl $0
8010637b:	6a 00                	push   $0x0
  pushl $36
8010637d:	6a 24                	push   $0x24
  jmp alltraps
8010637f:	e9 eb f9 ff ff       	jmp    80105d6f <alltraps>

80106384 <vector37>:
.globl vector37
vector37:
  pushl $0
80106384:	6a 00                	push   $0x0
  pushl $37
80106386:	6a 25                	push   $0x25
  jmp alltraps
80106388:	e9 e2 f9 ff ff       	jmp    80105d6f <alltraps>

8010638d <vector38>:
.globl vector38
vector38:
  pushl $0
8010638d:	6a 00                	push   $0x0
  pushl $38
8010638f:	6a 26                	push   $0x26
  jmp alltraps
80106391:	e9 d9 f9 ff ff       	jmp    80105d6f <alltraps>

80106396 <vector39>:
.globl vector39
vector39:
  pushl $0
80106396:	6a 00                	push   $0x0
  pushl $39
80106398:	6a 27                	push   $0x27
  jmp alltraps
8010639a:	e9 d0 f9 ff ff       	jmp    80105d6f <alltraps>

8010639f <vector40>:
.globl vector40
vector40:
  pushl $0
8010639f:	6a 00                	push   $0x0
  pushl $40
801063a1:	6a 28                	push   $0x28
  jmp alltraps
801063a3:	e9 c7 f9 ff ff       	jmp    80105d6f <alltraps>

801063a8 <vector41>:
.globl vector41
vector41:
  pushl $0
801063a8:	6a 00                	push   $0x0
  pushl $41
801063aa:	6a 29                	push   $0x29
  jmp alltraps
801063ac:	e9 be f9 ff ff       	jmp    80105d6f <alltraps>

801063b1 <vector42>:
.globl vector42
vector42:
  pushl $0
801063b1:	6a 00                	push   $0x0
  pushl $42
801063b3:	6a 2a                	push   $0x2a
  jmp alltraps
801063b5:	e9 b5 f9 ff ff       	jmp    80105d6f <alltraps>

801063ba <vector43>:
.globl vector43
vector43:
  pushl $0
801063ba:	6a 00                	push   $0x0
  pushl $43
801063bc:	6a 2b                	push   $0x2b
  jmp alltraps
801063be:	e9 ac f9 ff ff       	jmp    80105d6f <alltraps>

801063c3 <vector44>:
.globl vector44
vector44:
  pushl $0
801063c3:	6a 00                	push   $0x0
  pushl $44
801063c5:	6a 2c                	push   $0x2c
  jmp alltraps
801063c7:	e9 a3 f9 ff ff       	jmp    80105d6f <alltraps>

801063cc <vector45>:
.globl vector45
vector45:
  pushl $0
801063cc:	6a 00                	push   $0x0
  pushl $45
801063ce:	6a 2d                	push   $0x2d
  jmp alltraps
801063d0:	e9 9a f9 ff ff       	jmp    80105d6f <alltraps>

801063d5 <vector46>:
.globl vector46
vector46:
  pushl $0
801063d5:	6a 00                	push   $0x0
  pushl $46
801063d7:	6a 2e                	push   $0x2e
  jmp alltraps
801063d9:	e9 91 f9 ff ff       	jmp    80105d6f <alltraps>

801063de <vector47>:
.globl vector47
vector47:
  pushl $0
801063de:	6a 00                	push   $0x0
  pushl $47
801063e0:	6a 2f                	push   $0x2f
  jmp alltraps
801063e2:	e9 88 f9 ff ff       	jmp    80105d6f <alltraps>

801063e7 <vector48>:
.globl vector48
vector48:
  pushl $0
801063e7:	6a 00                	push   $0x0
  pushl $48
801063e9:	6a 30                	push   $0x30
  jmp alltraps
801063eb:	e9 7f f9 ff ff       	jmp    80105d6f <alltraps>

801063f0 <vector49>:
.globl vector49
vector49:
  pushl $0
801063f0:	6a 00                	push   $0x0
  pushl $49
801063f2:	6a 31                	push   $0x31
  jmp alltraps
801063f4:	e9 76 f9 ff ff       	jmp    80105d6f <alltraps>

801063f9 <vector50>:
.globl vector50
vector50:
  pushl $0
801063f9:	6a 00                	push   $0x0
  pushl $50
801063fb:	6a 32                	push   $0x32
  jmp alltraps
801063fd:	e9 6d f9 ff ff       	jmp    80105d6f <alltraps>

80106402 <vector51>:
.globl vector51
vector51:
  pushl $0
80106402:	6a 00                	push   $0x0
  pushl $51
80106404:	6a 33                	push   $0x33
  jmp alltraps
80106406:	e9 64 f9 ff ff       	jmp    80105d6f <alltraps>

8010640b <vector52>:
.globl vector52
vector52:
  pushl $0
8010640b:	6a 00                	push   $0x0
  pushl $52
8010640d:	6a 34                	push   $0x34
  jmp alltraps
8010640f:	e9 5b f9 ff ff       	jmp    80105d6f <alltraps>

80106414 <vector53>:
.globl vector53
vector53:
  pushl $0
80106414:	6a 00                	push   $0x0
  pushl $53
80106416:	6a 35                	push   $0x35
  jmp alltraps
80106418:	e9 52 f9 ff ff       	jmp    80105d6f <alltraps>

8010641d <vector54>:
.globl vector54
vector54:
  pushl $0
8010641d:	6a 00                	push   $0x0
  pushl $54
8010641f:	6a 36                	push   $0x36
  jmp alltraps
80106421:	e9 49 f9 ff ff       	jmp    80105d6f <alltraps>

80106426 <vector55>:
.globl vector55
vector55:
  pushl $0
80106426:	6a 00                	push   $0x0
  pushl $55
80106428:	6a 37                	push   $0x37
  jmp alltraps
8010642a:	e9 40 f9 ff ff       	jmp    80105d6f <alltraps>

8010642f <vector56>:
.globl vector56
vector56:
  pushl $0
8010642f:	6a 00                	push   $0x0
  pushl $56
80106431:	6a 38                	push   $0x38
  jmp alltraps
80106433:	e9 37 f9 ff ff       	jmp    80105d6f <alltraps>

80106438 <vector57>:
.globl vector57
vector57:
  pushl $0
80106438:	6a 00                	push   $0x0
  pushl $57
8010643a:	6a 39                	push   $0x39
  jmp alltraps
8010643c:	e9 2e f9 ff ff       	jmp    80105d6f <alltraps>

80106441 <vector58>:
.globl vector58
vector58:
  pushl $0
80106441:	6a 00                	push   $0x0
  pushl $58
80106443:	6a 3a                	push   $0x3a
  jmp alltraps
80106445:	e9 25 f9 ff ff       	jmp    80105d6f <alltraps>

8010644a <vector59>:
.globl vector59
vector59:
  pushl $0
8010644a:	6a 00                	push   $0x0
  pushl $59
8010644c:	6a 3b                	push   $0x3b
  jmp alltraps
8010644e:	e9 1c f9 ff ff       	jmp    80105d6f <alltraps>

80106453 <vector60>:
.globl vector60
vector60:
  pushl $0
80106453:	6a 00                	push   $0x0
  pushl $60
80106455:	6a 3c                	push   $0x3c
  jmp alltraps
80106457:	e9 13 f9 ff ff       	jmp    80105d6f <alltraps>

8010645c <vector61>:
.globl vector61
vector61:
  pushl $0
8010645c:	6a 00                	push   $0x0
  pushl $61
8010645e:	6a 3d                	push   $0x3d
  jmp alltraps
80106460:	e9 0a f9 ff ff       	jmp    80105d6f <alltraps>

80106465 <vector62>:
.globl vector62
vector62:
  pushl $0
80106465:	6a 00                	push   $0x0
  pushl $62
80106467:	6a 3e                	push   $0x3e
  jmp alltraps
80106469:	e9 01 f9 ff ff       	jmp    80105d6f <alltraps>

8010646e <vector63>:
.globl vector63
vector63:
  pushl $0
8010646e:	6a 00                	push   $0x0
  pushl $63
80106470:	6a 3f                	push   $0x3f
  jmp alltraps
80106472:	e9 f8 f8 ff ff       	jmp    80105d6f <alltraps>

80106477 <vector64>:
.globl vector64
vector64:
  pushl $0
80106477:	6a 00                	push   $0x0
  pushl $64
80106479:	6a 40                	push   $0x40
  jmp alltraps
8010647b:	e9 ef f8 ff ff       	jmp    80105d6f <alltraps>

80106480 <vector65>:
.globl vector65
vector65:
  pushl $0
80106480:	6a 00                	push   $0x0
  pushl $65
80106482:	6a 41                	push   $0x41
  jmp alltraps
80106484:	e9 e6 f8 ff ff       	jmp    80105d6f <alltraps>

80106489 <vector66>:
.globl vector66
vector66:
  pushl $0
80106489:	6a 00                	push   $0x0
  pushl $66
8010648b:	6a 42                	push   $0x42
  jmp alltraps
8010648d:	e9 dd f8 ff ff       	jmp    80105d6f <alltraps>

80106492 <vector67>:
.globl vector67
vector67:
  pushl $0
80106492:	6a 00                	push   $0x0
  pushl $67
80106494:	6a 43                	push   $0x43
  jmp alltraps
80106496:	e9 d4 f8 ff ff       	jmp    80105d6f <alltraps>

8010649b <vector68>:
.globl vector68
vector68:
  pushl $0
8010649b:	6a 00                	push   $0x0
  pushl $68
8010649d:	6a 44                	push   $0x44
  jmp alltraps
8010649f:	e9 cb f8 ff ff       	jmp    80105d6f <alltraps>

801064a4 <vector69>:
.globl vector69
vector69:
  pushl $0
801064a4:	6a 00                	push   $0x0
  pushl $69
801064a6:	6a 45                	push   $0x45
  jmp alltraps
801064a8:	e9 c2 f8 ff ff       	jmp    80105d6f <alltraps>

801064ad <vector70>:
.globl vector70
vector70:
  pushl $0
801064ad:	6a 00                	push   $0x0
  pushl $70
801064af:	6a 46                	push   $0x46
  jmp alltraps
801064b1:	e9 b9 f8 ff ff       	jmp    80105d6f <alltraps>

801064b6 <vector71>:
.globl vector71
vector71:
  pushl $0
801064b6:	6a 00                	push   $0x0
  pushl $71
801064b8:	6a 47                	push   $0x47
  jmp alltraps
801064ba:	e9 b0 f8 ff ff       	jmp    80105d6f <alltraps>

801064bf <vector72>:
.globl vector72
vector72:
  pushl $0
801064bf:	6a 00                	push   $0x0
  pushl $72
801064c1:	6a 48                	push   $0x48
  jmp alltraps
801064c3:	e9 a7 f8 ff ff       	jmp    80105d6f <alltraps>

801064c8 <vector73>:
.globl vector73
vector73:
  pushl $0
801064c8:	6a 00                	push   $0x0
  pushl $73
801064ca:	6a 49                	push   $0x49
  jmp alltraps
801064cc:	e9 9e f8 ff ff       	jmp    80105d6f <alltraps>

801064d1 <vector74>:
.globl vector74
vector74:
  pushl $0
801064d1:	6a 00                	push   $0x0
  pushl $74
801064d3:	6a 4a                	push   $0x4a
  jmp alltraps
801064d5:	e9 95 f8 ff ff       	jmp    80105d6f <alltraps>

801064da <vector75>:
.globl vector75
vector75:
  pushl $0
801064da:	6a 00                	push   $0x0
  pushl $75
801064dc:	6a 4b                	push   $0x4b
  jmp alltraps
801064de:	e9 8c f8 ff ff       	jmp    80105d6f <alltraps>

801064e3 <vector76>:
.globl vector76
vector76:
  pushl $0
801064e3:	6a 00                	push   $0x0
  pushl $76
801064e5:	6a 4c                	push   $0x4c
  jmp alltraps
801064e7:	e9 83 f8 ff ff       	jmp    80105d6f <alltraps>

801064ec <vector77>:
.globl vector77
vector77:
  pushl $0
801064ec:	6a 00                	push   $0x0
  pushl $77
801064ee:	6a 4d                	push   $0x4d
  jmp alltraps
801064f0:	e9 7a f8 ff ff       	jmp    80105d6f <alltraps>

801064f5 <vector78>:
.globl vector78
vector78:
  pushl $0
801064f5:	6a 00                	push   $0x0
  pushl $78
801064f7:	6a 4e                	push   $0x4e
  jmp alltraps
801064f9:	e9 71 f8 ff ff       	jmp    80105d6f <alltraps>

801064fe <vector79>:
.globl vector79
vector79:
  pushl $0
801064fe:	6a 00                	push   $0x0
  pushl $79
80106500:	6a 4f                	push   $0x4f
  jmp alltraps
80106502:	e9 68 f8 ff ff       	jmp    80105d6f <alltraps>

80106507 <vector80>:
.globl vector80
vector80:
  pushl $0
80106507:	6a 00                	push   $0x0
  pushl $80
80106509:	6a 50                	push   $0x50
  jmp alltraps
8010650b:	e9 5f f8 ff ff       	jmp    80105d6f <alltraps>

80106510 <vector81>:
.globl vector81
vector81:
  pushl $0
80106510:	6a 00                	push   $0x0
  pushl $81
80106512:	6a 51                	push   $0x51
  jmp alltraps
80106514:	e9 56 f8 ff ff       	jmp    80105d6f <alltraps>

80106519 <vector82>:
.globl vector82
vector82:
  pushl $0
80106519:	6a 00                	push   $0x0
  pushl $82
8010651b:	6a 52                	push   $0x52
  jmp alltraps
8010651d:	e9 4d f8 ff ff       	jmp    80105d6f <alltraps>

80106522 <vector83>:
.globl vector83
vector83:
  pushl $0
80106522:	6a 00                	push   $0x0
  pushl $83
80106524:	6a 53                	push   $0x53
  jmp alltraps
80106526:	e9 44 f8 ff ff       	jmp    80105d6f <alltraps>

8010652b <vector84>:
.globl vector84
vector84:
  pushl $0
8010652b:	6a 00                	push   $0x0
  pushl $84
8010652d:	6a 54                	push   $0x54
  jmp alltraps
8010652f:	e9 3b f8 ff ff       	jmp    80105d6f <alltraps>

80106534 <vector85>:
.globl vector85
vector85:
  pushl $0
80106534:	6a 00                	push   $0x0
  pushl $85
80106536:	6a 55                	push   $0x55
  jmp alltraps
80106538:	e9 32 f8 ff ff       	jmp    80105d6f <alltraps>

8010653d <vector86>:
.globl vector86
vector86:
  pushl $0
8010653d:	6a 00                	push   $0x0
  pushl $86
8010653f:	6a 56                	push   $0x56
  jmp alltraps
80106541:	e9 29 f8 ff ff       	jmp    80105d6f <alltraps>

80106546 <vector87>:
.globl vector87
vector87:
  pushl $0
80106546:	6a 00                	push   $0x0
  pushl $87
80106548:	6a 57                	push   $0x57
  jmp alltraps
8010654a:	e9 20 f8 ff ff       	jmp    80105d6f <alltraps>

8010654f <vector88>:
.globl vector88
vector88:
  pushl $0
8010654f:	6a 00                	push   $0x0
  pushl $88
80106551:	6a 58                	push   $0x58
  jmp alltraps
80106553:	e9 17 f8 ff ff       	jmp    80105d6f <alltraps>

80106558 <vector89>:
.globl vector89
vector89:
  pushl $0
80106558:	6a 00                	push   $0x0
  pushl $89
8010655a:	6a 59                	push   $0x59
  jmp alltraps
8010655c:	e9 0e f8 ff ff       	jmp    80105d6f <alltraps>

80106561 <vector90>:
.globl vector90
vector90:
  pushl $0
80106561:	6a 00                	push   $0x0
  pushl $90
80106563:	6a 5a                	push   $0x5a
  jmp alltraps
80106565:	e9 05 f8 ff ff       	jmp    80105d6f <alltraps>

8010656a <vector91>:
.globl vector91
vector91:
  pushl $0
8010656a:	6a 00                	push   $0x0
  pushl $91
8010656c:	6a 5b                	push   $0x5b
  jmp alltraps
8010656e:	e9 fc f7 ff ff       	jmp    80105d6f <alltraps>

80106573 <vector92>:
.globl vector92
vector92:
  pushl $0
80106573:	6a 00                	push   $0x0
  pushl $92
80106575:	6a 5c                	push   $0x5c
  jmp alltraps
80106577:	e9 f3 f7 ff ff       	jmp    80105d6f <alltraps>

8010657c <vector93>:
.globl vector93
vector93:
  pushl $0
8010657c:	6a 00                	push   $0x0
  pushl $93
8010657e:	6a 5d                	push   $0x5d
  jmp alltraps
80106580:	e9 ea f7 ff ff       	jmp    80105d6f <alltraps>

80106585 <vector94>:
.globl vector94
vector94:
  pushl $0
80106585:	6a 00                	push   $0x0
  pushl $94
80106587:	6a 5e                	push   $0x5e
  jmp alltraps
80106589:	e9 e1 f7 ff ff       	jmp    80105d6f <alltraps>

8010658e <vector95>:
.globl vector95
vector95:
  pushl $0
8010658e:	6a 00                	push   $0x0
  pushl $95
80106590:	6a 5f                	push   $0x5f
  jmp alltraps
80106592:	e9 d8 f7 ff ff       	jmp    80105d6f <alltraps>

80106597 <vector96>:
.globl vector96
vector96:
  pushl $0
80106597:	6a 00                	push   $0x0
  pushl $96
80106599:	6a 60                	push   $0x60
  jmp alltraps
8010659b:	e9 cf f7 ff ff       	jmp    80105d6f <alltraps>

801065a0 <vector97>:
.globl vector97
vector97:
  pushl $0
801065a0:	6a 00                	push   $0x0
  pushl $97
801065a2:	6a 61                	push   $0x61
  jmp alltraps
801065a4:	e9 c6 f7 ff ff       	jmp    80105d6f <alltraps>

801065a9 <vector98>:
.globl vector98
vector98:
  pushl $0
801065a9:	6a 00                	push   $0x0
  pushl $98
801065ab:	6a 62                	push   $0x62
  jmp alltraps
801065ad:	e9 bd f7 ff ff       	jmp    80105d6f <alltraps>

801065b2 <vector99>:
.globl vector99
vector99:
  pushl $0
801065b2:	6a 00                	push   $0x0
  pushl $99
801065b4:	6a 63                	push   $0x63
  jmp alltraps
801065b6:	e9 b4 f7 ff ff       	jmp    80105d6f <alltraps>

801065bb <vector100>:
.globl vector100
vector100:
  pushl $0
801065bb:	6a 00                	push   $0x0
  pushl $100
801065bd:	6a 64                	push   $0x64
  jmp alltraps
801065bf:	e9 ab f7 ff ff       	jmp    80105d6f <alltraps>

801065c4 <vector101>:
.globl vector101
vector101:
  pushl $0
801065c4:	6a 00                	push   $0x0
  pushl $101
801065c6:	6a 65                	push   $0x65
  jmp alltraps
801065c8:	e9 a2 f7 ff ff       	jmp    80105d6f <alltraps>

801065cd <vector102>:
.globl vector102
vector102:
  pushl $0
801065cd:	6a 00                	push   $0x0
  pushl $102
801065cf:	6a 66                	push   $0x66
  jmp alltraps
801065d1:	e9 99 f7 ff ff       	jmp    80105d6f <alltraps>

801065d6 <vector103>:
.globl vector103
vector103:
  pushl $0
801065d6:	6a 00                	push   $0x0
  pushl $103
801065d8:	6a 67                	push   $0x67
  jmp alltraps
801065da:	e9 90 f7 ff ff       	jmp    80105d6f <alltraps>

801065df <vector104>:
.globl vector104
vector104:
  pushl $0
801065df:	6a 00                	push   $0x0
  pushl $104
801065e1:	6a 68                	push   $0x68
  jmp alltraps
801065e3:	e9 87 f7 ff ff       	jmp    80105d6f <alltraps>

801065e8 <vector105>:
.globl vector105
vector105:
  pushl $0
801065e8:	6a 00                	push   $0x0
  pushl $105
801065ea:	6a 69                	push   $0x69
  jmp alltraps
801065ec:	e9 7e f7 ff ff       	jmp    80105d6f <alltraps>

801065f1 <vector106>:
.globl vector106
vector106:
  pushl $0
801065f1:	6a 00                	push   $0x0
  pushl $106
801065f3:	6a 6a                	push   $0x6a
  jmp alltraps
801065f5:	e9 75 f7 ff ff       	jmp    80105d6f <alltraps>

801065fa <vector107>:
.globl vector107
vector107:
  pushl $0
801065fa:	6a 00                	push   $0x0
  pushl $107
801065fc:	6a 6b                	push   $0x6b
  jmp alltraps
801065fe:	e9 6c f7 ff ff       	jmp    80105d6f <alltraps>

80106603 <vector108>:
.globl vector108
vector108:
  pushl $0
80106603:	6a 00                	push   $0x0
  pushl $108
80106605:	6a 6c                	push   $0x6c
  jmp alltraps
80106607:	e9 63 f7 ff ff       	jmp    80105d6f <alltraps>

8010660c <vector109>:
.globl vector109
vector109:
  pushl $0
8010660c:	6a 00                	push   $0x0
  pushl $109
8010660e:	6a 6d                	push   $0x6d
  jmp alltraps
80106610:	e9 5a f7 ff ff       	jmp    80105d6f <alltraps>

80106615 <vector110>:
.globl vector110
vector110:
  pushl $0
80106615:	6a 00                	push   $0x0
  pushl $110
80106617:	6a 6e                	push   $0x6e
  jmp alltraps
80106619:	e9 51 f7 ff ff       	jmp    80105d6f <alltraps>

8010661e <vector111>:
.globl vector111
vector111:
  pushl $0
8010661e:	6a 00                	push   $0x0
  pushl $111
80106620:	6a 6f                	push   $0x6f
  jmp alltraps
80106622:	e9 48 f7 ff ff       	jmp    80105d6f <alltraps>

80106627 <vector112>:
.globl vector112
vector112:
  pushl $0
80106627:	6a 00                	push   $0x0
  pushl $112
80106629:	6a 70                	push   $0x70
  jmp alltraps
8010662b:	e9 3f f7 ff ff       	jmp    80105d6f <alltraps>

80106630 <vector113>:
.globl vector113
vector113:
  pushl $0
80106630:	6a 00                	push   $0x0
  pushl $113
80106632:	6a 71                	push   $0x71
  jmp alltraps
80106634:	e9 36 f7 ff ff       	jmp    80105d6f <alltraps>

80106639 <vector114>:
.globl vector114
vector114:
  pushl $0
80106639:	6a 00                	push   $0x0
  pushl $114
8010663b:	6a 72                	push   $0x72
  jmp alltraps
8010663d:	e9 2d f7 ff ff       	jmp    80105d6f <alltraps>

80106642 <vector115>:
.globl vector115
vector115:
  pushl $0
80106642:	6a 00                	push   $0x0
  pushl $115
80106644:	6a 73                	push   $0x73
  jmp alltraps
80106646:	e9 24 f7 ff ff       	jmp    80105d6f <alltraps>

8010664b <vector116>:
.globl vector116
vector116:
  pushl $0
8010664b:	6a 00                	push   $0x0
  pushl $116
8010664d:	6a 74                	push   $0x74
  jmp alltraps
8010664f:	e9 1b f7 ff ff       	jmp    80105d6f <alltraps>

80106654 <vector117>:
.globl vector117
vector117:
  pushl $0
80106654:	6a 00                	push   $0x0
  pushl $117
80106656:	6a 75                	push   $0x75
  jmp alltraps
80106658:	e9 12 f7 ff ff       	jmp    80105d6f <alltraps>

8010665d <vector118>:
.globl vector118
vector118:
  pushl $0
8010665d:	6a 00                	push   $0x0
  pushl $118
8010665f:	6a 76                	push   $0x76
  jmp alltraps
80106661:	e9 09 f7 ff ff       	jmp    80105d6f <alltraps>

80106666 <vector119>:
.globl vector119
vector119:
  pushl $0
80106666:	6a 00                	push   $0x0
  pushl $119
80106668:	6a 77                	push   $0x77
  jmp alltraps
8010666a:	e9 00 f7 ff ff       	jmp    80105d6f <alltraps>

8010666f <vector120>:
.globl vector120
vector120:
  pushl $0
8010666f:	6a 00                	push   $0x0
  pushl $120
80106671:	6a 78                	push   $0x78
  jmp alltraps
80106673:	e9 f7 f6 ff ff       	jmp    80105d6f <alltraps>

80106678 <vector121>:
.globl vector121
vector121:
  pushl $0
80106678:	6a 00                	push   $0x0
  pushl $121
8010667a:	6a 79                	push   $0x79
  jmp alltraps
8010667c:	e9 ee f6 ff ff       	jmp    80105d6f <alltraps>

80106681 <vector122>:
.globl vector122
vector122:
  pushl $0
80106681:	6a 00                	push   $0x0
  pushl $122
80106683:	6a 7a                	push   $0x7a
  jmp alltraps
80106685:	e9 e5 f6 ff ff       	jmp    80105d6f <alltraps>

8010668a <vector123>:
.globl vector123
vector123:
  pushl $0
8010668a:	6a 00                	push   $0x0
  pushl $123
8010668c:	6a 7b                	push   $0x7b
  jmp alltraps
8010668e:	e9 dc f6 ff ff       	jmp    80105d6f <alltraps>

80106693 <vector124>:
.globl vector124
vector124:
  pushl $0
80106693:	6a 00                	push   $0x0
  pushl $124
80106695:	6a 7c                	push   $0x7c
  jmp alltraps
80106697:	e9 d3 f6 ff ff       	jmp    80105d6f <alltraps>

8010669c <vector125>:
.globl vector125
vector125:
  pushl $0
8010669c:	6a 00                	push   $0x0
  pushl $125
8010669e:	6a 7d                	push   $0x7d
  jmp alltraps
801066a0:	e9 ca f6 ff ff       	jmp    80105d6f <alltraps>

801066a5 <vector126>:
.globl vector126
vector126:
  pushl $0
801066a5:	6a 00                	push   $0x0
  pushl $126
801066a7:	6a 7e                	push   $0x7e
  jmp alltraps
801066a9:	e9 c1 f6 ff ff       	jmp    80105d6f <alltraps>

801066ae <vector127>:
.globl vector127
vector127:
  pushl $0
801066ae:	6a 00                	push   $0x0
  pushl $127
801066b0:	6a 7f                	push   $0x7f
  jmp alltraps
801066b2:	e9 b8 f6 ff ff       	jmp    80105d6f <alltraps>

801066b7 <vector128>:
.globl vector128
vector128:
  pushl $0
801066b7:	6a 00                	push   $0x0
  pushl $128
801066b9:	68 80 00 00 00       	push   $0x80
  jmp alltraps
801066be:	e9 ac f6 ff ff       	jmp    80105d6f <alltraps>

801066c3 <vector129>:
.globl vector129
vector129:
  pushl $0
801066c3:	6a 00                	push   $0x0
  pushl $129
801066c5:	68 81 00 00 00       	push   $0x81
  jmp alltraps
801066ca:	e9 a0 f6 ff ff       	jmp    80105d6f <alltraps>

801066cf <vector130>:
.globl vector130
vector130:
  pushl $0
801066cf:	6a 00                	push   $0x0
  pushl $130
801066d1:	68 82 00 00 00       	push   $0x82
  jmp alltraps
801066d6:	e9 94 f6 ff ff       	jmp    80105d6f <alltraps>

801066db <vector131>:
.globl vector131
vector131:
  pushl $0
801066db:	6a 00                	push   $0x0
  pushl $131
801066dd:	68 83 00 00 00       	push   $0x83
  jmp alltraps
801066e2:	e9 88 f6 ff ff       	jmp    80105d6f <alltraps>

801066e7 <vector132>:
.globl vector132
vector132:
  pushl $0
801066e7:	6a 00                	push   $0x0
  pushl $132
801066e9:	68 84 00 00 00       	push   $0x84
  jmp alltraps
801066ee:	e9 7c f6 ff ff       	jmp    80105d6f <alltraps>

801066f3 <vector133>:
.globl vector133
vector133:
  pushl $0
801066f3:	6a 00                	push   $0x0
  pushl $133
801066f5:	68 85 00 00 00       	push   $0x85
  jmp alltraps
801066fa:	e9 70 f6 ff ff       	jmp    80105d6f <alltraps>

801066ff <vector134>:
.globl vector134
vector134:
  pushl $0
801066ff:	6a 00                	push   $0x0
  pushl $134
80106701:	68 86 00 00 00       	push   $0x86
  jmp alltraps
80106706:	e9 64 f6 ff ff       	jmp    80105d6f <alltraps>

8010670b <vector135>:
.globl vector135
vector135:
  pushl $0
8010670b:	6a 00                	push   $0x0
  pushl $135
8010670d:	68 87 00 00 00       	push   $0x87
  jmp alltraps
80106712:	e9 58 f6 ff ff       	jmp    80105d6f <alltraps>

80106717 <vector136>:
.globl vector136
vector136:
  pushl $0
80106717:	6a 00                	push   $0x0
  pushl $136
80106719:	68 88 00 00 00       	push   $0x88
  jmp alltraps
8010671e:	e9 4c f6 ff ff       	jmp    80105d6f <alltraps>

80106723 <vector137>:
.globl vector137
vector137:
  pushl $0
80106723:	6a 00                	push   $0x0
  pushl $137
80106725:	68 89 00 00 00       	push   $0x89
  jmp alltraps
8010672a:	e9 40 f6 ff ff       	jmp    80105d6f <alltraps>

8010672f <vector138>:
.globl vector138
vector138:
  pushl $0
8010672f:	6a 00                	push   $0x0
  pushl $138
80106731:	68 8a 00 00 00       	push   $0x8a
  jmp alltraps
80106736:	e9 34 f6 ff ff       	jmp    80105d6f <alltraps>

8010673b <vector139>:
.globl vector139
vector139:
  pushl $0
8010673b:	6a 00                	push   $0x0
  pushl $139
8010673d:	68 8b 00 00 00       	push   $0x8b
  jmp alltraps
80106742:	e9 28 f6 ff ff       	jmp    80105d6f <alltraps>

80106747 <vector140>:
.globl vector140
vector140:
  pushl $0
80106747:	6a 00                	push   $0x0
  pushl $140
80106749:	68 8c 00 00 00       	push   $0x8c
  jmp alltraps
8010674e:	e9 1c f6 ff ff       	jmp    80105d6f <alltraps>

80106753 <vector141>:
.globl vector141
vector141:
  pushl $0
80106753:	6a 00                	push   $0x0
  pushl $141
80106755:	68 8d 00 00 00       	push   $0x8d
  jmp alltraps
8010675a:	e9 10 f6 ff ff       	jmp    80105d6f <alltraps>

8010675f <vector142>:
.globl vector142
vector142:
  pushl $0
8010675f:	6a 00                	push   $0x0
  pushl $142
80106761:	68 8e 00 00 00       	push   $0x8e
  jmp alltraps
80106766:	e9 04 f6 ff ff       	jmp    80105d6f <alltraps>

8010676b <vector143>:
.globl vector143
vector143:
  pushl $0
8010676b:	6a 00                	push   $0x0
  pushl $143
8010676d:	68 8f 00 00 00       	push   $0x8f
  jmp alltraps
80106772:	e9 f8 f5 ff ff       	jmp    80105d6f <alltraps>

80106777 <vector144>:
.globl vector144
vector144:
  pushl $0
80106777:	6a 00                	push   $0x0
  pushl $144
80106779:	68 90 00 00 00       	push   $0x90
  jmp alltraps
8010677e:	e9 ec f5 ff ff       	jmp    80105d6f <alltraps>

80106783 <vector145>:
.globl vector145
vector145:
  pushl $0
80106783:	6a 00                	push   $0x0
  pushl $145
80106785:	68 91 00 00 00       	push   $0x91
  jmp alltraps
8010678a:	e9 e0 f5 ff ff       	jmp    80105d6f <alltraps>

8010678f <vector146>:
.globl vector146
vector146:
  pushl $0
8010678f:	6a 00                	push   $0x0
  pushl $146
80106791:	68 92 00 00 00       	push   $0x92
  jmp alltraps
80106796:	e9 d4 f5 ff ff       	jmp    80105d6f <alltraps>

8010679b <vector147>:
.globl vector147
vector147:
  pushl $0
8010679b:	6a 00                	push   $0x0
  pushl $147
8010679d:	68 93 00 00 00       	push   $0x93
  jmp alltraps
801067a2:	e9 c8 f5 ff ff       	jmp    80105d6f <alltraps>

801067a7 <vector148>:
.globl vector148
vector148:
  pushl $0
801067a7:	6a 00                	push   $0x0
  pushl $148
801067a9:	68 94 00 00 00       	push   $0x94
  jmp alltraps
801067ae:	e9 bc f5 ff ff       	jmp    80105d6f <alltraps>

801067b3 <vector149>:
.globl vector149
vector149:
  pushl $0
801067b3:	6a 00                	push   $0x0
  pushl $149
801067b5:	68 95 00 00 00       	push   $0x95
  jmp alltraps
801067ba:	e9 b0 f5 ff ff       	jmp    80105d6f <alltraps>

801067bf <vector150>:
.globl vector150
vector150:
  pushl $0
801067bf:	6a 00                	push   $0x0
  pushl $150
801067c1:	68 96 00 00 00       	push   $0x96
  jmp alltraps
801067c6:	e9 a4 f5 ff ff       	jmp    80105d6f <alltraps>

801067cb <vector151>:
.globl vector151
vector151:
  pushl $0
801067cb:	6a 00                	push   $0x0
  pushl $151
801067cd:	68 97 00 00 00       	push   $0x97
  jmp alltraps
801067d2:	e9 98 f5 ff ff       	jmp    80105d6f <alltraps>

801067d7 <vector152>:
.globl vector152
vector152:
  pushl $0
801067d7:	6a 00                	push   $0x0
  pushl $152
801067d9:	68 98 00 00 00       	push   $0x98
  jmp alltraps
801067de:	e9 8c f5 ff ff       	jmp    80105d6f <alltraps>

801067e3 <vector153>:
.globl vector153
vector153:
  pushl $0
801067e3:	6a 00                	push   $0x0
  pushl $153
801067e5:	68 99 00 00 00       	push   $0x99
  jmp alltraps
801067ea:	e9 80 f5 ff ff       	jmp    80105d6f <alltraps>

801067ef <vector154>:
.globl vector154
vector154:
  pushl $0
801067ef:	6a 00                	push   $0x0
  pushl $154
801067f1:	68 9a 00 00 00       	push   $0x9a
  jmp alltraps
801067f6:	e9 74 f5 ff ff       	jmp    80105d6f <alltraps>

801067fb <vector155>:
.globl vector155
vector155:
  pushl $0
801067fb:	6a 00                	push   $0x0
  pushl $155
801067fd:	68 9b 00 00 00       	push   $0x9b
  jmp alltraps
80106802:	e9 68 f5 ff ff       	jmp    80105d6f <alltraps>

80106807 <vector156>:
.globl vector156
vector156:
  pushl $0
80106807:	6a 00                	push   $0x0
  pushl $156
80106809:	68 9c 00 00 00       	push   $0x9c
  jmp alltraps
8010680e:	e9 5c f5 ff ff       	jmp    80105d6f <alltraps>

80106813 <vector157>:
.globl vector157
vector157:
  pushl $0
80106813:	6a 00                	push   $0x0
  pushl $157
80106815:	68 9d 00 00 00       	push   $0x9d
  jmp alltraps
8010681a:	e9 50 f5 ff ff       	jmp    80105d6f <alltraps>

8010681f <vector158>:
.globl vector158
vector158:
  pushl $0
8010681f:	6a 00                	push   $0x0
  pushl $158
80106821:	68 9e 00 00 00       	push   $0x9e
  jmp alltraps
80106826:	e9 44 f5 ff ff       	jmp    80105d6f <alltraps>

8010682b <vector159>:
.globl vector159
vector159:
  pushl $0
8010682b:	6a 00                	push   $0x0
  pushl $159
8010682d:	68 9f 00 00 00       	push   $0x9f
  jmp alltraps
80106832:	e9 38 f5 ff ff       	jmp    80105d6f <alltraps>

80106837 <vector160>:
.globl vector160
vector160:
  pushl $0
80106837:	6a 00                	push   $0x0
  pushl $160
80106839:	68 a0 00 00 00       	push   $0xa0
  jmp alltraps
8010683e:	e9 2c f5 ff ff       	jmp    80105d6f <alltraps>

80106843 <vector161>:
.globl vector161
vector161:
  pushl $0
80106843:	6a 00                	push   $0x0
  pushl $161
80106845:	68 a1 00 00 00       	push   $0xa1
  jmp alltraps
8010684a:	e9 20 f5 ff ff       	jmp    80105d6f <alltraps>

8010684f <vector162>:
.globl vector162
vector162:
  pushl $0
8010684f:	6a 00                	push   $0x0
  pushl $162
80106851:	68 a2 00 00 00       	push   $0xa2
  jmp alltraps
80106856:	e9 14 f5 ff ff       	jmp    80105d6f <alltraps>

8010685b <vector163>:
.globl vector163
vector163:
  pushl $0
8010685b:	6a 00                	push   $0x0
  pushl $163
8010685d:	68 a3 00 00 00       	push   $0xa3
  jmp alltraps
80106862:	e9 08 f5 ff ff       	jmp    80105d6f <alltraps>

80106867 <vector164>:
.globl vector164
vector164:
  pushl $0
80106867:	6a 00                	push   $0x0
  pushl $164
80106869:	68 a4 00 00 00       	push   $0xa4
  jmp alltraps
8010686e:	e9 fc f4 ff ff       	jmp    80105d6f <alltraps>

80106873 <vector165>:
.globl vector165
vector165:
  pushl $0
80106873:	6a 00                	push   $0x0
  pushl $165
80106875:	68 a5 00 00 00       	push   $0xa5
  jmp alltraps
8010687a:	e9 f0 f4 ff ff       	jmp    80105d6f <alltraps>

8010687f <vector166>:
.globl vector166
vector166:
  pushl $0
8010687f:	6a 00                	push   $0x0
  pushl $166
80106881:	68 a6 00 00 00       	push   $0xa6
  jmp alltraps
80106886:	e9 e4 f4 ff ff       	jmp    80105d6f <alltraps>

8010688b <vector167>:
.globl vector167
vector167:
  pushl $0
8010688b:	6a 00                	push   $0x0
  pushl $167
8010688d:	68 a7 00 00 00       	push   $0xa7
  jmp alltraps
80106892:	e9 d8 f4 ff ff       	jmp    80105d6f <alltraps>

80106897 <vector168>:
.globl vector168
vector168:
  pushl $0
80106897:	6a 00                	push   $0x0
  pushl $168
80106899:	68 a8 00 00 00       	push   $0xa8
  jmp alltraps
8010689e:	e9 cc f4 ff ff       	jmp    80105d6f <alltraps>

801068a3 <vector169>:
.globl vector169
vector169:
  pushl $0
801068a3:	6a 00                	push   $0x0
  pushl $169
801068a5:	68 a9 00 00 00       	push   $0xa9
  jmp alltraps
801068aa:	e9 c0 f4 ff ff       	jmp    80105d6f <alltraps>

801068af <vector170>:
.globl vector170
vector170:
  pushl $0
801068af:	6a 00                	push   $0x0
  pushl $170
801068b1:	68 aa 00 00 00       	push   $0xaa
  jmp alltraps
801068b6:	e9 b4 f4 ff ff       	jmp    80105d6f <alltraps>

801068bb <vector171>:
.globl vector171
vector171:
  pushl $0
801068bb:	6a 00                	push   $0x0
  pushl $171
801068bd:	68 ab 00 00 00       	push   $0xab
  jmp alltraps
801068c2:	e9 a8 f4 ff ff       	jmp    80105d6f <alltraps>

801068c7 <vector172>:
.globl vector172
vector172:
  pushl $0
801068c7:	6a 00                	push   $0x0
  pushl $172
801068c9:	68 ac 00 00 00       	push   $0xac
  jmp alltraps
801068ce:	e9 9c f4 ff ff       	jmp    80105d6f <alltraps>

801068d3 <vector173>:
.globl vector173
vector173:
  pushl $0
801068d3:	6a 00                	push   $0x0
  pushl $173
801068d5:	68 ad 00 00 00       	push   $0xad
  jmp alltraps
801068da:	e9 90 f4 ff ff       	jmp    80105d6f <alltraps>

801068df <vector174>:
.globl vector174
vector174:
  pushl $0
801068df:	6a 00                	push   $0x0
  pushl $174
801068e1:	68 ae 00 00 00       	push   $0xae
  jmp alltraps
801068e6:	e9 84 f4 ff ff       	jmp    80105d6f <alltraps>

801068eb <vector175>:
.globl vector175
vector175:
  pushl $0
801068eb:	6a 00                	push   $0x0
  pushl $175
801068ed:	68 af 00 00 00       	push   $0xaf
  jmp alltraps
801068f2:	e9 78 f4 ff ff       	jmp    80105d6f <alltraps>

801068f7 <vector176>:
.globl vector176
vector176:
  pushl $0
801068f7:	6a 00                	push   $0x0
  pushl $176
801068f9:	68 b0 00 00 00       	push   $0xb0
  jmp alltraps
801068fe:	e9 6c f4 ff ff       	jmp    80105d6f <alltraps>

80106903 <vector177>:
.globl vector177
vector177:
  pushl $0
80106903:	6a 00                	push   $0x0
  pushl $177
80106905:	68 b1 00 00 00       	push   $0xb1
  jmp alltraps
8010690a:	e9 60 f4 ff ff       	jmp    80105d6f <alltraps>

8010690f <vector178>:
.globl vector178
vector178:
  pushl $0
8010690f:	6a 00                	push   $0x0
  pushl $178
80106911:	68 b2 00 00 00       	push   $0xb2
  jmp alltraps
80106916:	e9 54 f4 ff ff       	jmp    80105d6f <alltraps>

8010691b <vector179>:
.globl vector179
vector179:
  pushl $0
8010691b:	6a 00                	push   $0x0
  pushl $179
8010691d:	68 b3 00 00 00       	push   $0xb3
  jmp alltraps
80106922:	e9 48 f4 ff ff       	jmp    80105d6f <alltraps>

80106927 <vector180>:
.globl vector180
vector180:
  pushl $0
80106927:	6a 00                	push   $0x0
  pushl $180
80106929:	68 b4 00 00 00       	push   $0xb4
  jmp alltraps
8010692e:	e9 3c f4 ff ff       	jmp    80105d6f <alltraps>

80106933 <vector181>:
.globl vector181
vector181:
  pushl $0
80106933:	6a 00                	push   $0x0
  pushl $181
80106935:	68 b5 00 00 00       	push   $0xb5
  jmp alltraps
8010693a:	e9 30 f4 ff ff       	jmp    80105d6f <alltraps>

8010693f <vector182>:
.globl vector182
vector182:
  pushl $0
8010693f:	6a 00                	push   $0x0
  pushl $182
80106941:	68 b6 00 00 00       	push   $0xb6
  jmp alltraps
80106946:	e9 24 f4 ff ff       	jmp    80105d6f <alltraps>

8010694b <vector183>:
.globl vector183
vector183:
  pushl $0
8010694b:	6a 00                	push   $0x0
  pushl $183
8010694d:	68 b7 00 00 00       	push   $0xb7
  jmp alltraps
80106952:	e9 18 f4 ff ff       	jmp    80105d6f <alltraps>

80106957 <vector184>:
.globl vector184
vector184:
  pushl $0
80106957:	6a 00                	push   $0x0
  pushl $184
80106959:	68 b8 00 00 00       	push   $0xb8
  jmp alltraps
8010695e:	e9 0c f4 ff ff       	jmp    80105d6f <alltraps>

80106963 <vector185>:
.globl vector185
vector185:
  pushl $0
80106963:	6a 00                	push   $0x0
  pushl $185
80106965:	68 b9 00 00 00       	push   $0xb9
  jmp alltraps
8010696a:	e9 00 f4 ff ff       	jmp    80105d6f <alltraps>

8010696f <vector186>:
.globl vector186
vector186:
  pushl $0
8010696f:	6a 00                	push   $0x0
  pushl $186
80106971:	68 ba 00 00 00       	push   $0xba
  jmp alltraps
80106976:	e9 f4 f3 ff ff       	jmp    80105d6f <alltraps>

8010697b <vector187>:
.globl vector187
vector187:
  pushl $0
8010697b:	6a 00                	push   $0x0
  pushl $187
8010697d:	68 bb 00 00 00       	push   $0xbb
  jmp alltraps
80106982:	e9 e8 f3 ff ff       	jmp    80105d6f <alltraps>

80106987 <vector188>:
.globl vector188
vector188:
  pushl $0
80106987:	6a 00                	push   $0x0
  pushl $188
80106989:	68 bc 00 00 00       	push   $0xbc
  jmp alltraps
8010698e:	e9 dc f3 ff ff       	jmp    80105d6f <alltraps>

80106993 <vector189>:
.globl vector189
vector189:
  pushl $0
80106993:	6a 00                	push   $0x0
  pushl $189
80106995:	68 bd 00 00 00       	push   $0xbd
  jmp alltraps
8010699a:	e9 d0 f3 ff ff       	jmp    80105d6f <alltraps>

8010699f <vector190>:
.globl vector190
vector190:
  pushl $0
8010699f:	6a 00                	push   $0x0
  pushl $190
801069a1:	68 be 00 00 00       	push   $0xbe
  jmp alltraps
801069a6:	e9 c4 f3 ff ff       	jmp    80105d6f <alltraps>

801069ab <vector191>:
.globl vector191
vector191:
  pushl $0
801069ab:	6a 00                	push   $0x0
  pushl $191
801069ad:	68 bf 00 00 00       	push   $0xbf
  jmp alltraps
801069b2:	e9 b8 f3 ff ff       	jmp    80105d6f <alltraps>

801069b7 <vector192>:
.globl vector192
vector192:
  pushl $0
801069b7:	6a 00                	push   $0x0
  pushl $192
801069b9:	68 c0 00 00 00       	push   $0xc0
  jmp alltraps
801069be:	e9 ac f3 ff ff       	jmp    80105d6f <alltraps>

801069c3 <vector193>:
.globl vector193
vector193:
  pushl $0
801069c3:	6a 00                	push   $0x0
  pushl $193
801069c5:	68 c1 00 00 00       	push   $0xc1
  jmp alltraps
801069ca:	e9 a0 f3 ff ff       	jmp    80105d6f <alltraps>

801069cf <vector194>:
.globl vector194
vector194:
  pushl $0
801069cf:	6a 00                	push   $0x0
  pushl $194
801069d1:	68 c2 00 00 00       	push   $0xc2
  jmp alltraps
801069d6:	e9 94 f3 ff ff       	jmp    80105d6f <alltraps>

801069db <vector195>:
.globl vector195
vector195:
  pushl $0
801069db:	6a 00                	push   $0x0
  pushl $195
801069dd:	68 c3 00 00 00       	push   $0xc3
  jmp alltraps
801069e2:	e9 88 f3 ff ff       	jmp    80105d6f <alltraps>

801069e7 <vector196>:
.globl vector196
vector196:
  pushl $0
801069e7:	6a 00                	push   $0x0
  pushl $196
801069e9:	68 c4 00 00 00       	push   $0xc4
  jmp alltraps
801069ee:	e9 7c f3 ff ff       	jmp    80105d6f <alltraps>

801069f3 <vector197>:
.globl vector197
vector197:
  pushl $0
801069f3:	6a 00                	push   $0x0
  pushl $197
801069f5:	68 c5 00 00 00       	push   $0xc5
  jmp alltraps
801069fa:	e9 70 f3 ff ff       	jmp    80105d6f <alltraps>

801069ff <vector198>:
.globl vector198
vector198:
  pushl $0
801069ff:	6a 00                	push   $0x0
  pushl $198
80106a01:	68 c6 00 00 00       	push   $0xc6
  jmp alltraps
80106a06:	e9 64 f3 ff ff       	jmp    80105d6f <alltraps>

80106a0b <vector199>:
.globl vector199
vector199:
  pushl $0
80106a0b:	6a 00                	push   $0x0
  pushl $199
80106a0d:	68 c7 00 00 00       	push   $0xc7
  jmp alltraps
80106a12:	e9 58 f3 ff ff       	jmp    80105d6f <alltraps>

80106a17 <vector200>:
.globl vector200
vector200:
  pushl $0
80106a17:	6a 00                	push   $0x0
  pushl $200
80106a19:	68 c8 00 00 00       	push   $0xc8
  jmp alltraps
80106a1e:	e9 4c f3 ff ff       	jmp    80105d6f <alltraps>

80106a23 <vector201>:
.globl vector201
vector201:
  pushl $0
80106a23:	6a 00                	push   $0x0
  pushl $201
80106a25:	68 c9 00 00 00       	push   $0xc9
  jmp alltraps
80106a2a:	e9 40 f3 ff ff       	jmp    80105d6f <alltraps>

80106a2f <vector202>:
.globl vector202
vector202:
  pushl $0
80106a2f:	6a 00                	push   $0x0
  pushl $202
80106a31:	68 ca 00 00 00       	push   $0xca
  jmp alltraps
80106a36:	e9 34 f3 ff ff       	jmp    80105d6f <alltraps>

80106a3b <vector203>:
.globl vector203
vector203:
  pushl $0
80106a3b:	6a 00                	push   $0x0
  pushl $203
80106a3d:	68 cb 00 00 00       	push   $0xcb
  jmp alltraps
80106a42:	e9 28 f3 ff ff       	jmp    80105d6f <alltraps>

80106a47 <vector204>:
.globl vector204
vector204:
  pushl $0
80106a47:	6a 00                	push   $0x0
  pushl $204
80106a49:	68 cc 00 00 00       	push   $0xcc
  jmp alltraps
80106a4e:	e9 1c f3 ff ff       	jmp    80105d6f <alltraps>

80106a53 <vector205>:
.globl vector205
vector205:
  pushl $0
80106a53:	6a 00                	push   $0x0
  pushl $205
80106a55:	68 cd 00 00 00       	push   $0xcd
  jmp alltraps
80106a5a:	e9 10 f3 ff ff       	jmp    80105d6f <alltraps>

80106a5f <vector206>:
.globl vector206
vector206:
  pushl $0
80106a5f:	6a 00                	push   $0x0
  pushl $206
80106a61:	68 ce 00 00 00       	push   $0xce
  jmp alltraps
80106a66:	e9 04 f3 ff ff       	jmp    80105d6f <alltraps>

80106a6b <vector207>:
.globl vector207
vector207:
  pushl $0
80106a6b:	6a 00                	push   $0x0
  pushl $207
80106a6d:	68 cf 00 00 00       	push   $0xcf
  jmp alltraps
80106a72:	e9 f8 f2 ff ff       	jmp    80105d6f <alltraps>

80106a77 <vector208>:
.globl vector208
vector208:
  pushl $0
80106a77:	6a 00                	push   $0x0
  pushl $208
80106a79:	68 d0 00 00 00       	push   $0xd0
  jmp alltraps
80106a7e:	e9 ec f2 ff ff       	jmp    80105d6f <alltraps>

80106a83 <vector209>:
.globl vector209
vector209:
  pushl $0
80106a83:	6a 00                	push   $0x0
  pushl $209
80106a85:	68 d1 00 00 00       	push   $0xd1
  jmp alltraps
80106a8a:	e9 e0 f2 ff ff       	jmp    80105d6f <alltraps>

80106a8f <vector210>:
.globl vector210
vector210:
  pushl $0
80106a8f:	6a 00                	push   $0x0
  pushl $210
80106a91:	68 d2 00 00 00       	push   $0xd2
  jmp alltraps
80106a96:	e9 d4 f2 ff ff       	jmp    80105d6f <alltraps>

80106a9b <vector211>:
.globl vector211
vector211:
  pushl $0
80106a9b:	6a 00                	push   $0x0
  pushl $211
80106a9d:	68 d3 00 00 00       	push   $0xd3
  jmp alltraps
80106aa2:	e9 c8 f2 ff ff       	jmp    80105d6f <alltraps>

80106aa7 <vector212>:
.globl vector212
vector212:
  pushl $0
80106aa7:	6a 00                	push   $0x0
  pushl $212
80106aa9:	68 d4 00 00 00       	push   $0xd4
  jmp alltraps
80106aae:	e9 bc f2 ff ff       	jmp    80105d6f <alltraps>

80106ab3 <vector213>:
.globl vector213
vector213:
  pushl $0
80106ab3:	6a 00                	push   $0x0
  pushl $213
80106ab5:	68 d5 00 00 00       	push   $0xd5
  jmp alltraps
80106aba:	e9 b0 f2 ff ff       	jmp    80105d6f <alltraps>

80106abf <vector214>:
.globl vector214
vector214:
  pushl $0
80106abf:	6a 00                	push   $0x0
  pushl $214
80106ac1:	68 d6 00 00 00       	push   $0xd6
  jmp alltraps
80106ac6:	e9 a4 f2 ff ff       	jmp    80105d6f <alltraps>

80106acb <vector215>:
.globl vector215
vector215:
  pushl $0
80106acb:	6a 00                	push   $0x0
  pushl $215
80106acd:	68 d7 00 00 00       	push   $0xd7
  jmp alltraps
80106ad2:	e9 98 f2 ff ff       	jmp    80105d6f <alltraps>

80106ad7 <vector216>:
.globl vector216
vector216:
  pushl $0
80106ad7:	6a 00                	push   $0x0
  pushl $216
80106ad9:	68 d8 00 00 00       	push   $0xd8
  jmp alltraps
80106ade:	e9 8c f2 ff ff       	jmp    80105d6f <alltraps>

80106ae3 <vector217>:
.globl vector217
vector217:
  pushl $0
80106ae3:	6a 00                	push   $0x0
  pushl $217
80106ae5:	68 d9 00 00 00       	push   $0xd9
  jmp alltraps
80106aea:	e9 80 f2 ff ff       	jmp    80105d6f <alltraps>

80106aef <vector218>:
.globl vector218
vector218:
  pushl $0
80106aef:	6a 00                	push   $0x0
  pushl $218
80106af1:	68 da 00 00 00       	push   $0xda
  jmp alltraps
80106af6:	e9 74 f2 ff ff       	jmp    80105d6f <alltraps>

80106afb <vector219>:
.globl vector219
vector219:
  pushl $0
80106afb:	6a 00                	push   $0x0
  pushl $219
80106afd:	68 db 00 00 00       	push   $0xdb
  jmp alltraps
80106b02:	e9 68 f2 ff ff       	jmp    80105d6f <alltraps>

80106b07 <vector220>:
.globl vector220
vector220:
  pushl $0
80106b07:	6a 00                	push   $0x0
  pushl $220
80106b09:	68 dc 00 00 00       	push   $0xdc
  jmp alltraps
80106b0e:	e9 5c f2 ff ff       	jmp    80105d6f <alltraps>

80106b13 <vector221>:
.globl vector221
vector221:
  pushl $0
80106b13:	6a 00                	push   $0x0
  pushl $221
80106b15:	68 dd 00 00 00       	push   $0xdd
  jmp alltraps
80106b1a:	e9 50 f2 ff ff       	jmp    80105d6f <alltraps>

80106b1f <vector222>:
.globl vector222
vector222:
  pushl $0
80106b1f:	6a 00                	push   $0x0
  pushl $222
80106b21:	68 de 00 00 00       	push   $0xde
  jmp alltraps
80106b26:	e9 44 f2 ff ff       	jmp    80105d6f <alltraps>

80106b2b <vector223>:
.globl vector223
vector223:
  pushl $0
80106b2b:	6a 00                	push   $0x0
  pushl $223
80106b2d:	68 df 00 00 00       	push   $0xdf
  jmp alltraps
80106b32:	e9 38 f2 ff ff       	jmp    80105d6f <alltraps>

80106b37 <vector224>:
.globl vector224
vector224:
  pushl $0
80106b37:	6a 00                	push   $0x0
  pushl $224
80106b39:	68 e0 00 00 00       	push   $0xe0
  jmp alltraps
80106b3e:	e9 2c f2 ff ff       	jmp    80105d6f <alltraps>

80106b43 <vector225>:
.globl vector225
vector225:
  pushl $0
80106b43:	6a 00                	push   $0x0
  pushl $225
80106b45:	68 e1 00 00 00       	push   $0xe1
  jmp alltraps
80106b4a:	e9 20 f2 ff ff       	jmp    80105d6f <alltraps>

80106b4f <vector226>:
.globl vector226
vector226:
  pushl $0
80106b4f:	6a 00                	push   $0x0
  pushl $226
80106b51:	68 e2 00 00 00       	push   $0xe2
  jmp alltraps
80106b56:	e9 14 f2 ff ff       	jmp    80105d6f <alltraps>

80106b5b <vector227>:
.globl vector227
vector227:
  pushl $0
80106b5b:	6a 00                	push   $0x0
  pushl $227
80106b5d:	68 e3 00 00 00       	push   $0xe3
  jmp alltraps
80106b62:	e9 08 f2 ff ff       	jmp    80105d6f <alltraps>

80106b67 <vector228>:
.globl vector228
vector228:
  pushl $0
80106b67:	6a 00                	push   $0x0
  pushl $228
80106b69:	68 e4 00 00 00       	push   $0xe4
  jmp alltraps
80106b6e:	e9 fc f1 ff ff       	jmp    80105d6f <alltraps>

80106b73 <vector229>:
.globl vector229
vector229:
  pushl $0
80106b73:	6a 00                	push   $0x0
  pushl $229
80106b75:	68 e5 00 00 00       	push   $0xe5
  jmp alltraps
80106b7a:	e9 f0 f1 ff ff       	jmp    80105d6f <alltraps>

80106b7f <vector230>:
.globl vector230
vector230:
  pushl $0
80106b7f:	6a 00                	push   $0x0
  pushl $230
80106b81:	68 e6 00 00 00       	push   $0xe6
  jmp alltraps
80106b86:	e9 e4 f1 ff ff       	jmp    80105d6f <alltraps>

80106b8b <vector231>:
.globl vector231
vector231:
  pushl $0
80106b8b:	6a 00                	push   $0x0
  pushl $231
80106b8d:	68 e7 00 00 00       	push   $0xe7
  jmp alltraps
80106b92:	e9 d8 f1 ff ff       	jmp    80105d6f <alltraps>

80106b97 <vector232>:
.globl vector232
vector232:
  pushl $0
80106b97:	6a 00                	push   $0x0
  pushl $232
80106b99:	68 e8 00 00 00       	push   $0xe8
  jmp alltraps
80106b9e:	e9 cc f1 ff ff       	jmp    80105d6f <alltraps>

80106ba3 <vector233>:
.globl vector233
vector233:
  pushl $0
80106ba3:	6a 00                	push   $0x0
  pushl $233
80106ba5:	68 e9 00 00 00       	push   $0xe9
  jmp alltraps
80106baa:	e9 c0 f1 ff ff       	jmp    80105d6f <alltraps>

80106baf <vector234>:
.globl vector234
vector234:
  pushl $0
80106baf:	6a 00                	push   $0x0
  pushl $234
80106bb1:	68 ea 00 00 00       	push   $0xea
  jmp alltraps
80106bb6:	e9 b4 f1 ff ff       	jmp    80105d6f <alltraps>

80106bbb <vector235>:
.globl vector235
vector235:
  pushl $0
80106bbb:	6a 00                	push   $0x0
  pushl $235
80106bbd:	68 eb 00 00 00       	push   $0xeb
  jmp alltraps
80106bc2:	e9 a8 f1 ff ff       	jmp    80105d6f <alltraps>

80106bc7 <vector236>:
.globl vector236
vector236:
  pushl $0
80106bc7:	6a 00                	push   $0x0
  pushl $236
80106bc9:	68 ec 00 00 00       	push   $0xec
  jmp alltraps
80106bce:	e9 9c f1 ff ff       	jmp    80105d6f <alltraps>

80106bd3 <vector237>:
.globl vector237
vector237:
  pushl $0
80106bd3:	6a 00                	push   $0x0
  pushl $237
80106bd5:	68 ed 00 00 00       	push   $0xed
  jmp alltraps
80106bda:	e9 90 f1 ff ff       	jmp    80105d6f <alltraps>

80106bdf <vector238>:
.globl vector238
vector238:
  pushl $0
80106bdf:	6a 00                	push   $0x0
  pushl $238
80106be1:	68 ee 00 00 00       	push   $0xee
  jmp alltraps
80106be6:	e9 84 f1 ff ff       	jmp    80105d6f <alltraps>

80106beb <vector239>:
.globl vector239
vector239:
  pushl $0
80106beb:	6a 00                	push   $0x0
  pushl $239
80106bed:	68 ef 00 00 00       	push   $0xef
  jmp alltraps
80106bf2:	e9 78 f1 ff ff       	jmp    80105d6f <alltraps>

80106bf7 <vector240>:
.globl vector240
vector240:
  pushl $0
80106bf7:	6a 00                	push   $0x0
  pushl $240
80106bf9:	68 f0 00 00 00       	push   $0xf0
  jmp alltraps
80106bfe:	e9 6c f1 ff ff       	jmp    80105d6f <alltraps>

80106c03 <vector241>:
.globl vector241
vector241:
  pushl $0
80106c03:	6a 00                	push   $0x0
  pushl $241
80106c05:	68 f1 00 00 00       	push   $0xf1
  jmp alltraps
80106c0a:	e9 60 f1 ff ff       	jmp    80105d6f <alltraps>

80106c0f <vector242>:
.globl vector242
vector242:
  pushl $0
80106c0f:	6a 00                	push   $0x0
  pushl $242
80106c11:	68 f2 00 00 00       	push   $0xf2
  jmp alltraps
80106c16:	e9 54 f1 ff ff       	jmp    80105d6f <alltraps>

80106c1b <vector243>:
.globl vector243
vector243:
  pushl $0
80106c1b:	6a 00                	push   $0x0
  pushl $243
80106c1d:	68 f3 00 00 00       	push   $0xf3
  jmp alltraps
80106c22:	e9 48 f1 ff ff       	jmp    80105d6f <alltraps>

80106c27 <vector244>:
.globl vector244
vector244:
  pushl $0
80106c27:	6a 00                	push   $0x0
  pushl $244
80106c29:	68 f4 00 00 00       	push   $0xf4
  jmp alltraps
80106c2e:	e9 3c f1 ff ff       	jmp    80105d6f <alltraps>

80106c33 <vector245>:
.globl vector245
vector245:
  pushl $0
80106c33:	6a 00                	push   $0x0
  pushl $245
80106c35:	68 f5 00 00 00       	push   $0xf5
  jmp alltraps
80106c3a:	e9 30 f1 ff ff       	jmp    80105d6f <alltraps>

80106c3f <vector246>:
.globl vector246
vector246:
  pushl $0
80106c3f:	6a 00                	push   $0x0
  pushl $246
80106c41:	68 f6 00 00 00       	push   $0xf6
  jmp alltraps
80106c46:	e9 24 f1 ff ff       	jmp    80105d6f <alltraps>

80106c4b <vector247>:
.globl vector247
vector247:
  pushl $0
80106c4b:	6a 00                	push   $0x0
  pushl $247
80106c4d:	68 f7 00 00 00       	push   $0xf7
  jmp alltraps
80106c52:	e9 18 f1 ff ff       	jmp    80105d6f <alltraps>

80106c57 <vector248>:
.globl vector248
vector248:
  pushl $0
80106c57:	6a 00                	push   $0x0
  pushl $248
80106c59:	68 f8 00 00 00       	push   $0xf8
  jmp alltraps
80106c5e:	e9 0c f1 ff ff       	jmp    80105d6f <alltraps>

80106c63 <vector249>:
.globl vector249
vector249:
  pushl $0
80106c63:	6a 00                	push   $0x0
  pushl $249
80106c65:	68 f9 00 00 00       	push   $0xf9
  jmp alltraps
80106c6a:	e9 00 f1 ff ff       	jmp    80105d6f <alltraps>

80106c6f <vector250>:
.globl vector250
vector250:
  pushl $0
80106c6f:	6a 00                	push   $0x0
  pushl $250
80106c71:	68 fa 00 00 00       	push   $0xfa
  jmp alltraps
80106c76:	e9 f4 f0 ff ff       	jmp    80105d6f <alltraps>

80106c7b <vector251>:
.globl vector251
vector251:
  pushl $0
80106c7b:	6a 00                	push   $0x0
  pushl $251
80106c7d:	68 fb 00 00 00       	push   $0xfb
  jmp alltraps
80106c82:	e9 e8 f0 ff ff       	jmp    80105d6f <alltraps>

80106c87 <vector252>:
.globl vector252
vector252:
  pushl $0
80106c87:	6a 00                	push   $0x0
  pushl $252
80106c89:	68 fc 00 00 00       	push   $0xfc
  jmp alltraps
80106c8e:	e9 dc f0 ff ff       	jmp    80105d6f <alltraps>

80106c93 <vector253>:
.globl vector253
vector253:
  pushl $0
80106c93:	6a 00                	push   $0x0
  pushl $253
80106c95:	68 fd 00 00 00       	push   $0xfd
  jmp alltraps
80106c9a:	e9 d0 f0 ff ff       	jmp    80105d6f <alltraps>

80106c9f <vector254>:
.globl vector254
vector254:
  pushl $0
80106c9f:	6a 00                	push   $0x0
  pushl $254
80106ca1:	68 fe 00 00 00       	push   $0xfe
  jmp alltraps
80106ca6:	e9 c4 f0 ff ff       	jmp    80105d6f <alltraps>

80106cab <vector255>:
.globl vector255
vector255:
  pushl $0
80106cab:	6a 00                	push   $0x0
  pushl $255
80106cad:	68 ff 00 00 00       	push   $0xff
  jmp alltraps
80106cb2:	e9 b8 f0 ff ff       	jmp    80105d6f <alltraps>
80106cb7:	66 90                	xchg   %ax,%ax
80106cb9:	66 90                	xchg   %ax,%ax
80106cbb:	66 90                	xchg   %ax,%ax
80106cbd:	66 90                	xchg   %ax,%ax
80106cbf:	90                   	nop

80106cc0 <walkpgdir>:
// Return the address of the PTE in page table pgdir
// that corresponds to virtual address va.  If alloc!=0,
// create any required page table pages.
static pte_t *
walkpgdir(pde_t *pgdir, const void *va, int alloc)
{
80106cc0:	55                   	push   %ebp
80106cc1:	89 e5                	mov    %esp,%ebp
80106cc3:	57                   	push   %edi
80106cc4:	56                   	push   %esi
80106cc5:	53                   	push   %ebx
  pde_t *pde;
  pte_t *pgtab;

  pde = &pgdir[PDX(va)];
80106cc6:	89 d3                	mov    %edx,%ebx
// Return the address of the PTE in page table pgdir
// that corresponds to virtual address va.  If alloc!=0,
// create any required page table pages.
static pte_t *
walkpgdir(pde_t *pgdir, const void *va, int alloc)
{
80106cc8:	89 d7                	mov    %edx,%edi
  pde_t *pde;
  pte_t *pgtab;

  pde = &pgdir[PDX(va)];
80106cca:	c1 eb 16             	shr    $0x16,%ebx
80106ccd:	8d 34 98             	lea    (%eax,%ebx,4),%esi
// Return the address of the PTE in page table pgdir
// that corresponds to virtual address va.  If alloc!=0,
// create any required page table pages.
static pte_t *
walkpgdir(pde_t *pgdir, const void *va, int alloc)
{
80106cd0:	83 ec 0c             	sub    $0xc,%esp
  pde_t *pde;
  pte_t *pgtab;

  pde = &pgdir[PDX(va)];
  if(*pde & PTE_P){
80106cd3:	8b 06                	mov    (%esi),%eax
80106cd5:	a8 01                	test   $0x1,%al
80106cd7:	74 27                	je     80106d00 <walkpgdir+0x40>
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
80106cd9:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106cde:	8d 98 00 00 00 80    	lea    -0x80000000(%eax),%ebx
    // The permissions here are overly generous, but they can
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
  }
  return &pgtab[PTX(va)];
80106ce4:	c1 ef 0a             	shr    $0xa,%edi
}
80106ce7:	8d 65 f4             	lea    -0xc(%ebp),%esp
    // The permissions here are overly generous, but they can
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
  }
  return &pgtab[PTX(va)];
80106cea:	89 fa                	mov    %edi,%edx
80106cec:	81 e2 fc 0f 00 00    	and    $0xffc,%edx
80106cf2:	8d 04 13             	lea    (%ebx,%edx,1),%eax
}
80106cf5:	5b                   	pop    %ebx
80106cf6:	5e                   	pop    %esi
80106cf7:	5f                   	pop    %edi
80106cf8:	5d                   	pop    %ebp
80106cf9:	c3                   	ret    
80106cfa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  pde = &pgdir[PDX(va)];
  if(*pde & PTE_P){
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
  } else {
    if(!alloc || (pgtab = (pte_t*)kalloc()) == 0)
80106d00:	85 c9                	test   %ecx,%ecx
80106d02:	74 2c                	je     80106d30 <walkpgdir+0x70>
80106d04:	e8 87 b7 ff ff       	call   80102490 <kalloc>
80106d09:	85 c0                	test   %eax,%eax
80106d0b:	89 c3                	mov    %eax,%ebx
80106d0d:	74 21                	je     80106d30 <walkpgdir+0x70>
      return 0;
    // Make sure all those PTE_P bits are zero.
    memset(pgtab, 0, PGSIZE);
80106d0f:	83 ec 04             	sub    $0x4,%esp
80106d12:	68 00 10 00 00       	push   $0x1000
80106d17:	6a 00                	push   $0x0
80106d19:	50                   	push   %eax
80106d1a:	e8 41 dd ff ff       	call   80104a60 <memset>
    // The permissions here are overly generous, but they can
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
80106d1f:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80106d25:	83 c4 10             	add    $0x10,%esp
80106d28:	83 c8 07             	or     $0x7,%eax
80106d2b:	89 06                	mov    %eax,(%esi)
80106d2d:	eb b5                	jmp    80106ce4 <walkpgdir+0x24>
80106d2f:	90                   	nop
  }
  return &pgtab[PTX(va)];
}
80106d30:	8d 65 f4             	lea    -0xc(%ebp),%esp
  pde = &pgdir[PDX(va)];
  if(*pde & PTE_P){
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
  } else {
    if(!alloc || (pgtab = (pte_t*)kalloc()) == 0)
      return 0;
80106d33:	31 c0                	xor    %eax,%eax
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
  }
  return &pgtab[PTX(va)];
}
80106d35:	5b                   	pop    %ebx
80106d36:	5e                   	pop    %esi
80106d37:	5f                   	pop    %edi
80106d38:	5d                   	pop    %ebp
80106d39:	c3                   	ret    
80106d3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106d40 <mappages>:
// Create PTEs for virtual addresses starting at va that refer to
// physical addresses starting at pa. va and size might not
// be page-aligned.
static int
mappages(pde_t *pgdir, void *va, uint size, uint pa, int perm)
{
80106d40:	55                   	push   %ebp
80106d41:	89 e5                	mov    %esp,%ebp
80106d43:	57                   	push   %edi
80106d44:	56                   	push   %esi
80106d45:	53                   	push   %ebx
  char *a, *last;
  pte_t *pte;

  a = (char*)PGROUNDDOWN((uint)va);
80106d46:	89 d3                	mov    %edx,%ebx
80106d48:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
// Create PTEs for virtual addresses starting at va that refer to
// physical addresses starting at pa. va and size might not
// be page-aligned.
static int
mappages(pde_t *pgdir, void *va, uint size, uint pa, int perm)
{
80106d4e:	83 ec 1c             	sub    $0x1c,%esp
80106d51:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  char *a, *last;
  pte_t *pte;

  a = (char*)PGROUNDDOWN((uint)va);
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
80106d54:	8d 44 0a ff          	lea    -0x1(%edx,%ecx,1),%eax
80106d58:	8b 7d 08             	mov    0x8(%ebp),%edi
80106d5b:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106d60:	89 45 e0             	mov    %eax,-0x20(%ebp)
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
      panic("remap");
    *pte = pa | perm | PTE_P;
80106d63:	8b 45 0c             	mov    0xc(%ebp),%eax
80106d66:	29 df                	sub    %ebx,%edi
80106d68:	83 c8 01             	or     $0x1,%eax
80106d6b:	89 45 dc             	mov    %eax,-0x24(%ebp)
80106d6e:	eb 15                	jmp    80106d85 <mappages+0x45>
  a = (char*)PGROUNDDOWN((uint)va);
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
80106d70:	f6 00 01             	testb  $0x1,(%eax)
80106d73:	75 45                	jne    80106dba <mappages+0x7a>
      panic("remap");
    *pte = pa | perm | PTE_P;
80106d75:	0b 75 dc             	or     -0x24(%ebp),%esi
    if(a == last)
80106d78:	3b 5d e0             	cmp    -0x20(%ebp),%ebx
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
      panic("remap");
    *pte = pa | perm | PTE_P;
80106d7b:	89 30                	mov    %esi,(%eax)
    if(a == last)
80106d7d:	74 31                	je     80106db0 <mappages+0x70>
      break;
    a += PGSIZE;
80106d7f:	81 c3 00 10 00 00    	add    $0x1000,%ebx
  pte_t *pte;

  a = (char*)PGROUNDDOWN((uint)va);
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
80106d85:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106d88:	b9 01 00 00 00       	mov    $0x1,%ecx
80106d8d:	89 da                	mov    %ebx,%edx
80106d8f:	8d 34 3b             	lea    (%ebx,%edi,1),%esi
80106d92:	e8 29 ff ff ff       	call   80106cc0 <walkpgdir>
80106d97:	85 c0                	test   %eax,%eax
80106d99:	75 d5                	jne    80106d70 <mappages+0x30>
      break;
    a += PGSIZE;
    pa += PGSIZE;
  }
  return 0;
}
80106d9b:	8d 65 f4             	lea    -0xc(%ebp),%esp

  a = (char*)PGROUNDDOWN((uint)va);
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
80106d9e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
      break;
    a += PGSIZE;
    pa += PGSIZE;
  }
  return 0;
}
80106da3:	5b                   	pop    %ebx
80106da4:	5e                   	pop    %esi
80106da5:	5f                   	pop    %edi
80106da6:	5d                   	pop    %ebp
80106da7:	c3                   	ret    
80106da8:	90                   	nop
80106da9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106db0:	8d 65 f4             	lea    -0xc(%ebp),%esp
    if(a == last)
      break;
    a += PGSIZE;
    pa += PGSIZE;
  }
  return 0;
80106db3:	31 c0                	xor    %eax,%eax
}
80106db5:	5b                   	pop    %ebx
80106db6:	5e                   	pop    %esi
80106db7:	5f                   	pop    %edi
80106db8:	5d                   	pop    %ebp
80106db9:	c3                   	ret    
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
      panic("remap");
80106dba:	83 ec 0c             	sub    $0xc,%esp
80106dbd:	68 fc 7e 10 80       	push   $0x80107efc
80106dc2:	e8 a9 95 ff ff       	call   80100370 <panic>
80106dc7:	89 f6                	mov    %esi,%esi
80106dc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106dd0 <deallocuvm.part.0>:
// Deallocate user pages to bring the process size from oldsz to
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
80106dd0:	55                   	push   %ebp
80106dd1:	89 e5                	mov    %esp,%ebp
80106dd3:	57                   	push   %edi
80106dd4:	56                   	push   %esi
80106dd5:	53                   	push   %ebx
  uint a, pa;

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
80106dd6:	8d 99 ff 0f 00 00    	lea    0xfff(%ecx),%ebx
// Deallocate user pages to bring the process size from oldsz to
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
80106ddc:	89 c7                	mov    %eax,%edi
  uint a, pa;

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
80106dde:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
// Deallocate user pages to bring the process size from oldsz to
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
80106de4:	83 ec 1c             	sub    $0x1c,%esp
80106de7:	89 4d e0             	mov    %ecx,-0x20(%ebp)

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
  for(; a  < oldsz; a += PGSIZE){
80106dea:	39 d3                	cmp    %edx,%ebx
80106dec:	73 66                	jae    80106e54 <deallocuvm.part.0+0x84>
80106dee:	89 d6                	mov    %edx,%esi
80106df0:	eb 3d                	jmp    80106e2f <deallocuvm.part.0+0x5f>
80106df2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    pte = walkpgdir(pgdir, (char*)a, 0);
    if(!pte)
      a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
    else if((*pte & PTE_P) != 0){
80106df8:	8b 10                	mov    (%eax),%edx
80106dfa:	f6 c2 01             	test   $0x1,%dl
80106dfd:	74 26                	je     80106e25 <deallocuvm.part.0+0x55>
      pa = PTE_ADDR(*pte);
      if(pa == 0)
80106dff:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
80106e05:	74 58                	je     80106e5f <deallocuvm.part.0+0x8f>
        panic("kfree");
      char *v = P2V(pa);
      kfree(v);
80106e07:	83 ec 0c             	sub    $0xc,%esp
      a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
    else if((*pte & PTE_P) != 0){
      pa = PTE_ADDR(*pte);
      if(pa == 0)
        panic("kfree");
      char *v = P2V(pa);
80106e0a:	81 c2 00 00 00 80    	add    $0x80000000,%edx
80106e10:	89 45 e4             	mov    %eax,-0x1c(%ebp)
      kfree(v);
80106e13:	52                   	push   %edx
80106e14:	e8 c7 b4 ff ff       	call   801022e0 <kfree>
      *pte = 0;
80106e19:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106e1c:	83 c4 10             	add    $0x10,%esp
80106e1f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
  for(; a  < oldsz; a += PGSIZE){
80106e25:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106e2b:	39 f3                	cmp    %esi,%ebx
80106e2d:	73 25                	jae    80106e54 <deallocuvm.part.0+0x84>
    pte = walkpgdir(pgdir, (char*)a, 0);
80106e2f:	31 c9                	xor    %ecx,%ecx
80106e31:	89 da                	mov    %ebx,%edx
80106e33:	89 f8                	mov    %edi,%eax
80106e35:	e8 86 fe ff ff       	call   80106cc0 <walkpgdir>
    if(!pte)
80106e3a:	85 c0                	test   %eax,%eax
80106e3c:	75 ba                	jne    80106df8 <deallocuvm.part.0+0x28>
      a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
80106e3e:	81 e3 00 00 c0 ff    	and    $0xffc00000,%ebx
80106e44:	81 c3 00 f0 3f 00    	add    $0x3ff000,%ebx

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
  for(; a  < oldsz; a += PGSIZE){
80106e4a:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106e50:	39 f3                	cmp    %esi,%ebx
80106e52:	72 db                	jb     80106e2f <deallocuvm.part.0+0x5f>
      kfree(v);
      *pte = 0;
    }
  }
  return newsz;
}
80106e54:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106e57:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106e5a:	5b                   	pop    %ebx
80106e5b:	5e                   	pop    %esi
80106e5c:	5f                   	pop    %edi
80106e5d:	5d                   	pop    %ebp
80106e5e:	c3                   	ret    
    if(!pte)
      a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
    else if((*pte & PTE_P) != 0){
      pa = PTE_ADDR(*pte);
      if(pa == 0)
        panic("kfree");
80106e5f:	83 ec 0c             	sub    $0xc,%esp
80106e62:	68 86 78 10 80       	push   $0x80107886
80106e67:	e8 04 95 ff ff       	call   80100370 <panic>
80106e6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106e70 <seginit>:

// Set up CPU's kernel segment descriptors.
// Run once on entry on each CPU.
void
seginit(void)
{
80106e70:	55                   	push   %ebp
80106e71:	89 e5                	mov    %esp,%ebp
80106e73:	83 ec 18             	sub    $0x18,%esp

  // Map "logical" addresses to virtual addresses using identity map.
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpuid()];
80106e76:	e8 25 ca ff ff       	call   801038a0 <cpuid>
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
80106e7b:	69 c0 b0 00 00 00    	imul   $0xb0,%eax,%eax
80106e81:	31 c9                	xor    %ecx,%ecx
80106e83:	ba ff ff ff ff       	mov    $0xffffffff,%edx
80106e88:	66 89 90 18 38 11 80 	mov    %dx,-0x7feec7e8(%eax)
80106e8f:	66 89 88 1a 38 11 80 	mov    %cx,-0x7feec7e6(%eax)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
80106e96:	ba ff ff ff ff       	mov    $0xffffffff,%edx
80106e9b:	31 c9                	xor    %ecx,%ecx
80106e9d:	66 89 90 20 38 11 80 	mov    %dx,-0x7feec7e0(%eax)
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
80106ea4:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpuid()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
80106ea9:	66 89 88 22 38 11 80 	mov    %cx,-0x7feec7de(%eax)
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
80106eb0:	31 c9                	xor    %ecx,%ecx
80106eb2:	66 89 90 28 38 11 80 	mov    %dx,-0x7feec7d8(%eax)
80106eb9:	66 89 88 2a 38 11 80 	mov    %cx,-0x7feec7d6(%eax)
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
80106ec0:	ba ff ff ff ff       	mov    $0xffffffff,%edx
80106ec5:	31 c9                	xor    %ecx,%ecx
80106ec7:	66 89 90 30 38 11 80 	mov    %dx,-0x7feec7d0(%eax)
  // Map "logical" addresses to virtual addresses using identity map.
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpuid()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
80106ece:	c6 80 1c 38 11 80 00 	movb   $0x0,-0x7feec7e4(%eax)
static inline void
lgdt(struct segdesc *p, int size)
{
  volatile ushort pd[3];

  pd[0] = size-1;
80106ed5:	ba 2f 00 00 00       	mov    $0x2f,%edx
80106eda:	c6 80 1d 38 11 80 9a 	movb   $0x9a,-0x7feec7e3(%eax)
80106ee1:	c6 80 1e 38 11 80 cf 	movb   $0xcf,-0x7feec7e2(%eax)
80106ee8:	c6 80 1f 38 11 80 00 	movb   $0x0,-0x7feec7e1(%eax)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
80106eef:	c6 80 24 38 11 80 00 	movb   $0x0,-0x7feec7dc(%eax)
80106ef6:	c6 80 25 38 11 80 92 	movb   $0x92,-0x7feec7db(%eax)
80106efd:	c6 80 26 38 11 80 cf 	movb   $0xcf,-0x7feec7da(%eax)
80106f04:	c6 80 27 38 11 80 00 	movb   $0x0,-0x7feec7d9(%eax)
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
80106f0b:	c6 80 2c 38 11 80 00 	movb   $0x0,-0x7feec7d4(%eax)
80106f12:	c6 80 2d 38 11 80 fa 	movb   $0xfa,-0x7feec7d3(%eax)
80106f19:	c6 80 2e 38 11 80 cf 	movb   $0xcf,-0x7feec7d2(%eax)
80106f20:	c6 80 2f 38 11 80 00 	movb   $0x0,-0x7feec7d1(%eax)
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
80106f27:	66 89 88 32 38 11 80 	mov    %cx,-0x7feec7ce(%eax)
80106f2e:	c6 80 34 38 11 80 00 	movb   $0x0,-0x7feec7cc(%eax)
80106f35:	c6 80 35 38 11 80 f2 	movb   $0xf2,-0x7feec7cb(%eax)
80106f3c:	c6 80 36 38 11 80 cf 	movb   $0xcf,-0x7feec7ca(%eax)
80106f43:	c6 80 37 38 11 80 00 	movb   $0x0,-0x7feec7c9(%eax)
  lgdt(c->gdt, sizeof(c->gdt));
80106f4a:	05 10 38 11 80       	add    $0x80113810,%eax
80106f4f:	66 89 55 f2          	mov    %dx,-0xe(%ebp)
  pd[1] = (uint)p;
80106f53:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
  pd[2] = (uint)p >> 16;
80106f57:	c1 e8 10             	shr    $0x10,%eax
80106f5a:	66 89 45 f6          	mov    %ax,-0xa(%ebp)

  asm volatile("lgdt (%0)" : : "r" (pd));
80106f5e:	8d 45 f2             	lea    -0xe(%ebp),%eax
80106f61:	0f 01 10             	lgdtl  (%eax)
}
80106f64:	c9                   	leave  
80106f65:	c3                   	ret    
80106f66:	8d 76 00             	lea    0x0(%esi),%esi
80106f69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106f70 <switchkvm>:
// Switch h/w page table register to the kernel-only page table,
// for when no process is running.
void
switchkvm(void)
{
  lcr3(V2P(kpgdir));   // switch to the kernel page table
80106f70:	a1 c4 8b 11 80       	mov    0x80118bc4,%eax

// Switch h/w page table register to the kernel-only page table,
// for when no process is running.
void
switchkvm(void)
{
80106f75:	55                   	push   %ebp
80106f76:	89 e5                	mov    %esp,%ebp
  lcr3(V2P(kpgdir));   // switch to the kernel page table
80106f78:	05 00 00 00 80       	add    $0x80000000,%eax
}

static inline void
lcr3(uint val)
{
  asm volatile("movl %0,%%cr3" : : "r" (val));
80106f7d:	0f 22 d8             	mov    %eax,%cr3
}
80106f80:	5d                   	pop    %ebp
80106f81:	c3                   	ret    
80106f82:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106f89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106f90 <switchuvm>:

// Switch TSS and h/w page table to correspond to process p.
void
switchuvm(struct proc *p)
{
80106f90:	55                   	push   %ebp
80106f91:	89 e5                	mov    %esp,%ebp
80106f93:	57                   	push   %edi
80106f94:	56                   	push   %esi
80106f95:	53                   	push   %ebx
80106f96:	83 ec 1c             	sub    $0x1c,%esp
80106f99:	8b 75 08             	mov    0x8(%ebp),%esi
  if(p == 0)
80106f9c:	85 f6                	test   %esi,%esi
80106f9e:	0f 84 cd 00 00 00    	je     80107071 <switchuvm+0xe1>
    panic("switchuvm: no process");
  if(p->kstack == 0)
80106fa4:	8b 46 08             	mov    0x8(%esi),%eax
80106fa7:	85 c0                	test   %eax,%eax
80106fa9:	0f 84 dc 00 00 00    	je     8010708b <switchuvm+0xfb>
    panic("switchuvm: no kstack");
  if(p->pgdir == 0)
80106faf:	8b 7e 04             	mov    0x4(%esi),%edi
80106fb2:	85 ff                	test   %edi,%edi
80106fb4:	0f 84 c4 00 00 00    	je     8010707e <switchuvm+0xee>
    panic("switchuvm: no pgdir");

  pushcli();
80106fba:	e8 f1 d8 ff ff       	call   801048b0 <pushcli>
  mycpu()->gdt[SEG_TSS] = SEG16(STS_T32A, &mycpu()->ts,
80106fbf:	e8 5c c8 ff ff       	call   80103820 <mycpu>
80106fc4:	89 c3                	mov    %eax,%ebx
80106fc6:	e8 55 c8 ff ff       	call   80103820 <mycpu>
80106fcb:	89 c7                	mov    %eax,%edi
80106fcd:	e8 4e c8 ff ff       	call   80103820 <mycpu>
80106fd2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106fd5:	83 c7 08             	add    $0x8,%edi
80106fd8:	e8 43 c8 ff ff       	call   80103820 <mycpu>
80106fdd:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80106fe0:	83 c0 08             	add    $0x8,%eax
80106fe3:	ba 67 00 00 00       	mov    $0x67,%edx
80106fe8:	c1 e8 18             	shr    $0x18,%eax
80106feb:	66 89 93 98 00 00 00 	mov    %dx,0x98(%ebx)
80106ff2:	66 89 bb 9a 00 00 00 	mov    %di,0x9a(%ebx)
80106ff9:	c6 83 9d 00 00 00 99 	movb   $0x99,0x9d(%ebx)
80107000:	c6 83 9e 00 00 00 40 	movb   $0x40,0x9e(%ebx)
80107007:	83 c1 08             	add    $0x8,%ecx
8010700a:	88 83 9f 00 00 00    	mov    %al,0x9f(%ebx)
80107010:	c1 e9 10             	shr    $0x10,%ecx
80107013:	88 8b 9c 00 00 00    	mov    %cl,0x9c(%ebx)
  mycpu()->gdt[SEG_TSS].s = 0;
  mycpu()->ts.ss0 = SEG_KDATA << 3;
  mycpu()->ts.esp0 = (uint)p->kstack + KSTACKSIZE;
  // setting IOPL=0 in eflags *and* iomb beyond the tss segment limit
  // forbids I/O instructions (e.g., inb and outb) from user space
  mycpu()->ts.iomb = (ushort) 0xFFFF;
80107019:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
    panic("switchuvm: no pgdir");

  pushcli();
  mycpu()->gdt[SEG_TSS] = SEG16(STS_T32A, &mycpu()->ts,
                                sizeof(mycpu()->ts)-1, 0);
  mycpu()->gdt[SEG_TSS].s = 0;
8010701e:	e8 fd c7 ff ff       	call   80103820 <mycpu>
80107023:	80 a0 9d 00 00 00 ef 	andb   $0xef,0x9d(%eax)
  mycpu()->ts.ss0 = SEG_KDATA << 3;
8010702a:	e8 f1 c7 ff ff       	call   80103820 <mycpu>
8010702f:	b9 10 00 00 00       	mov    $0x10,%ecx
80107034:	66 89 48 10          	mov    %cx,0x10(%eax)
  mycpu()->ts.esp0 = (uint)p->kstack + KSTACKSIZE;
80107038:	e8 e3 c7 ff ff       	call   80103820 <mycpu>
8010703d:	8b 56 08             	mov    0x8(%esi),%edx
80107040:	8d 8a 00 10 00 00    	lea    0x1000(%edx),%ecx
80107046:	89 48 0c             	mov    %ecx,0xc(%eax)
  // setting IOPL=0 in eflags *and* iomb beyond the tss segment limit
  // forbids I/O instructions (e.g., inb and outb) from user space
  mycpu()->ts.iomb = (ushort) 0xFFFF;
80107049:	e8 d2 c7 ff ff       	call   80103820 <mycpu>
8010704e:	66 89 58 6e          	mov    %bx,0x6e(%eax)
}

static inline void
ltr(ushort sel)
{
  asm volatile("ltr %0" : : "r" (sel));
80107052:	b8 28 00 00 00       	mov    $0x28,%eax
80107057:	0f 00 d8             	ltr    %ax
  ltr(SEG_TSS << 3);
  lcr3(V2P(p->pgdir));  // switch to process's address space
8010705a:	8b 46 04             	mov    0x4(%esi),%eax
8010705d:	05 00 00 00 80       	add    $0x80000000,%eax
}

static inline void
lcr3(uint val)
{
  asm volatile("movl %0,%%cr3" : : "r" (val));
80107062:	0f 22 d8             	mov    %eax,%cr3
  popcli();
}
80107065:	8d 65 f4             	lea    -0xc(%ebp),%esp
80107068:	5b                   	pop    %ebx
80107069:	5e                   	pop    %esi
8010706a:	5f                   	pop    %edi
8010706b:	5d                   	pop    %ebp
  // setting IOPL=0 in eflags *and* iomb beyond the tss segment limit
  // forbids I/O instructions (e.g., inb and outb) from user space
  mycpu()->ts.iomb = (ushort) 0xFFFF;
  ltr(SEG_TSS << 3);
  lcr3(V2P(p->pgdir));  // switch to process's address space
  popcli();
8010706c:	e9 2f d9 ff ff       	jmp    801049a0 <popcli>
// Switch TSS and h/w page table to correspond to process p.
void
switchuvm(struct proc *p)
{
  if(p == 0)
    panic("switchuvm: no process");
80107071:	83 ec 0c             	sub    $0xc,%esp
80107074:	68 02 7f 10 80       	push   $0x80107f02
80107079:	e8 f2 92 ff ff       	call   80100370 <panic>
  if(p->kstack == 0)
    panic("switchuvm: no kstack");
  if(p->pgdir == 0)
    panic("switchuvm: no pgdir");
8010707e:	83 ec 0c             	sub    $0xc,%esp
80107081:	68 2d 7f 10 80       	push   $0x80107f2d
80107086:	e8 e5 92 ff ff       	call   80100370 <panic>
switchuvm(struct proc *p)
{
  if(p == 0)
    panic("switchuvm: no process");
  if(p->kstack == 0)
    panic("switchuvm: no kstack");
8010708b:	83 ec 0c             	sub    $0xc,%esp
8010708e:	68 18 7f 10 80       	push   $0x80107f18
80107093:	e8 d8 92 ff ff       	call   80100370 <panic>
80107098:	90                   	nop
80107099:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801070a0 <inituvm>:

// Load the initcode into address 0 of pgdir.
// sz must be less than a page.
void
inituvm(pde_t *pgdir, char *init, uint sz)
{
801070a0:	55                   	push   %ebp
801070a1:	89 e5                	mov    %esp,%ebp
801070a3:	57                   	push   %edi
801070a4:	56                   	push   %esi
801070a5:	53                   	push   %ebx
801070a6:	83 ec 1c             	sub    $0x1c,%esp
801070a9:	8b 75 10             	mov    0x10(%ebp),%esi
801070ac:	8b 45 08             	mov    0x8(%ebp),%eax
801070af:	8b 7d 0c             	mov    0xc(%ebp),%edi
  char *mem;

  if(sz >= PGSIZE)
801070b2:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi

// Load the initcode into address 0 of pgdir.
// sz must be less than a page.
void
inituvm(pde_t *pgdir, char *init, uint sz)
{
801070b8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  char *mem;

  if(sz >= PGSIZE)
801070bb:	77 49                	ja     80107106 <inituvm+0x66>
    panic("inituvm: more than a page");
  mem = kalloc();
801070bd:	e8 ce b3 ff ff       	call   80102490 <kalloc>
  memset(mem, 0, PGSIZE);
801070c2:	83 ec 04             	sub    $0x4,%esp
{
  char *mem;

  if(sz >= PGSIZE)
    panic("inituvm: more than a page");
  mem = kalloc();
801070c5:	89 c3                	mov    %eax,%ebx
  memset(mem, 0, PGSIZE);
801070c7:	68 00 10 00 00       	push   $0x1000
801070cc:	6a 00                	push   $0x0
801070ce:	50                   	push   %eax
801070cf:	e8 8c d9 ff ff       	call   80104a60 <memset>
  mappages(pgdir, 0, PGSIZE, V2P(mem), PTE_W|PTE_U);
801070d4:	58                   	pop    %eax
801070d5:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
801070db:	b9 00 10 00 00       	mov    $0x1000,%ecx
801070e0:	5a                   	pop    %edx
801070e1:	6a 06                	push   $0x6
801070e3:	50                   	push   %eax
801070e4:	31 d2                	xor    %edx,%edx
801070e6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801070e9:	e8 52 fc ff ff       	call   80106d40 <mappages>
  memmove(mem, init, sz);
801070ee:	89 75 10             	mov    %esi,0x10(%ebp)
801070f1:	89 7d 0c             	mov    %edi,0xc(%ebp)
801070f4:	83 c4 10             	add    $0x10,%esp
801070f7:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
801070fa:	8d 65 f4             	lea    -0xc(%ebp),%esp
801070fd:	5b                   	pop    %ebx
801070fe:	5e                   	pop    %esi
801070ff:	5f                   	pop    %edi
80107100:	5d                   	pop    %ebp
  if(sz >= PGSIZE)
    panic("inituvm: more than a page");
  mem = kalloc();
  memset(mem, 0, PGSIZE);
  mappages(pgdir, 0, PGSIZE, V2P(mem), PTE_W|PTE_U);
  memmove(mem, init, sz);
80107101:	e9 0a da ff ff       	jmp    80104b10 <memmove>
inituvm(pde_t *pgdir, char *init, uint sz)
{
  char *mem;

  if(sz >= PGSIZE)
    panic("inituvm: more than a page");
80107106:	83 ec 0c             	sub    $0xc,%esp
80107109:	68 41 7f 10 80       	push   $0x80107f41
8010710e:	e8 5d 92 ff ff       	call   80100370 <panic>
80107113:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80107119:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80107120 <loaduvm>:

// Load a program segment into pgdir.  addr must be page-aligned
// and the pages from addr to addr+sz must already be mapped.
int
loaduvm(pde_t *pgdir, char *addr, struct inode *ip, uint offset, uint sz)
{
80107120:	55                   	push   %ebp
80107121:	89 e5                	mov    %esp,%ebp
80107123:	57                   	push   %edi
80107124:	56                   	push   %esi
80107125:	53                   	push   %ebx
80107126:	83 ec 0c             	sub    $0xc,%esp
  uint i, pa, n;
  pte_t *pte;

  if((uint) addr % PGSIZE != 0)
80107129:	f7 45 0c ff 0f 00 00 	testl  $0xfff,0xc(%ebp)
80107130:	0f 85 91 00 00 00    	jne    801071c7 <loaduvm+0xa7>
    panic("loaduvm: addr must be page aligned");
  for(i = 0; i < sz; i += PGSIZE){
80107136:	8b 75 18             	mov    0x18(%ebp),%esi
80107139:	31 db                	xor    %ebx,%ebx
8010713b:	85 f6                	test   %esi,%esi
8010713d:	75 1a                	jne    80107159 <loaduvm+0x39>
8010713f:	eb 6f                	jmp    801071b0 <loaduvm+0x90>
80107141:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80107148:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010714e:	81 ee 00 10 00 00    	sub    $0x1000,%esi
80107154:	39 5d 18             	cmp    %ebx,0x18(%ebp)
80107157:	76 57                	jbe    801071b0 <loaduvm+0x90>
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
80107159:	8b 55 0c             	mov    0xc(%ebp),%edx
8010715c:	8b 45 08             	mov    0x8(%ebp),%eax
8010715f:	31 c9                	xor    %ecx,%ecx
80107161:	01 da                	add    %ebx,%edx
80107163:	e8 58 fb ff ff       	call   80106cc0 <walkpgdir>
80107168:	85 c0                	test   %eax,%eax
8010716a:	74 4e                	je     801071ba <loaduvm+0x9a>
      panic("loaduvm: address should exist");
    pa = PTE_ADDR(*pte);
8010716c:	8b 00                	mov    (%eax),%eax
    if(sz - i < PGSIZE)
      n = sz - i;
    else
      n = PGSIZE;
    if(readi(ip, P2V(pa), offset+i, n) != n)
8010716e:	8b 4d 14             	mov    0x14(%ebp),%ecx
    panic("loaduvm: addr must be page aligned");
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
      panic("loaduvm: address should exist");
    pa = PTE_ADDR(*pte);
    if(sz - i < PGSIZE)
80107171:	bf 00 10 00 00       	mov    $0x1000,%edi
  if((uint) addr % PGSIZE != 0)
    panic("loaduvm: addr must be page aligned");
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
      panic("loaduvm: address should exist");
    pa = PTE_ADDR(*pte);
80107176:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    if(sz - i < PGSIZE)
8010717b:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
80107181:	0f 46 fe             	cmovbe %esi,%edi
      n = sz - i;
    else
      n = PGSIZE;
    if(readi(ip, P2V(pa), offset+i, n) != n)
80107184:	01 d9                	add    %ebx,%ecx
80107186:	05 00 00 00 80       	add    $0x80000000,%eax
8010718b:	57                   	push   %edi
8010718c:	51                   	push   %ecx
8010718d:	50                   	push   %eax
8010718e:	ff 75 10             	pushl  0x10(%ebp)
80107191:	e8 ba a7 ff ff       	call   80101950 <readi>
80107196:	83 c4 10             	add    $0x10,%esp
80107199:	39 c7                	cmp    %eax,%edi
8010719b:	74 ab                	je     80107148 <loaduvm+0x28>
      return -1;
  }
  return 0;
}
8010719d:	8d 65 f4             	lea    -0xc(%ebp),%esp
    if(sz - i < PGSIZE)
      n = sz - i;
    else
      n = PGSIZE;
    if(readi(ip, P2V(pa), offset+i, n) != n)
      return -1;
801071a0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  return 0;
}
801071a5:	5b                   	pop    %ebx
801071a6:	5e                   	pop    %esi
801071a7:	5f                   	pop    %edi
801071a8:	5d                   	pop    %ebp
801071a9:	c3                   	ret    
801071aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801071b0:	8d 65 f4             	lea    -0xc(%ebp),%esp
    else
      n = PGSIZE;
    if(readi(ip, P2V(pa), offset+i, n) != n)
      return -1;
  }
  return 0;
801071b3:	31 c0                	xor    %eax,%eax
}
801071b5:	5b                   	pop    %ebx
801071b6:	5e                   	pop    %esi
801071b7:	5f                   	pop    %edi
801071b8:	5d                   	pop    %ebp
801071b9:	c3                   	ret    

  if((uint) addr % PGSIZE != 0)
    panic("loaduvm: addr must be page aligned");
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
      panic("loaduvm: address should exist");
801071ba:	83 ec 0c             	sub    $0xc,%esp
801071bd:	68 5b 7f 10 80       	push   $0x80107f5b
801071c2:	e8 a9 91 ff ff       	call   80100370 <panic>
{
  uint i, pa, n;
  pte_t *pte;

  if((uint) addr % PGSIZE != 0)
    panic("loaduvm: addr must be page aligned");
801071c7:	83 ec 0c             	sub    $0xc,%esp
801071ca:	68 fc 7f 10 80       	push   $0x80107ffc
801071cf:	e8 9c 91 ff ff       	call   80100370 <panic>
801071d4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801071da:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801071e0 <allocuvm>:

// Allocate page tables and physical memory to grow process from oldsz to
// newsz, which need not be page aligned.  Returns new size or 0 on error.
int
allocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
801071e0:	55                   	push   %ebp
801071e1:	89 e5                	mov    %esp,%ebp
801071e3:	57                   	push   %edi
801071e4:	56                   	push   %esi
801071e5:	53                   	push   %ebx
801071e6:	83 ec 0c             	sub    $0xc,%esp
801071e9:	8b 7d 10             	mov    0x10(%ebp),%edi
  char *mem;
  uint a;

  if(newsz >= KERNBASE)
801071ec:	85 ff                	test   %edi,%edi
801071ee:	78 7b                	js     8010726b <allocuvm+0x8b>
    return 0;
  if(newsz < oldsz)
801071f0:	3b 7d 0c             	cmp    0xc(%ebp),%edi
    return oldsz;
801071f3:	8b 45 0c             	mov    0xc(%ebp),%eax
  char *mem;
  uint a;

  if(newsz >= KERNBASE)
    return 0;
  if(newsz < oldsz)
801071f6:	72 75                	jb     8010726d <allocuvm+0x8d>
    return oldsz;

  a = PGROUNDUP(oldsz);
801071f8:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
801071fe:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; a < newsz; a += PGSIZE){
80107204:	39 df                	cmp    %ebx,%edi
80107206:	77 43                	ja     8010724b <allocuvm+0x6b>
80107208:	eb 6e                	jmp    80107278 <allocuvm+0x98>
8010720a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(mem == 0){
      cprintf("allocuvm out of memory\n");
      deallocuvm(pgdir, newsz, oldsz);
      return 0;
    }
    memset(mem, 0, PGSIZE);
80107210:	83 ec 04             	sub    $0x4,%esp
80107213:	68 00 10 00 00       	push   $0x1000
80107218:	6a 00                	push   $0x0
8010721a:	50                   	push   %eax
8010721b:	e8 40 d8 ff ff       	call   80104a60 <memset>
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
80107220:	58                   	pop    %eax
80107221:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
80107227:	b9 00 10 00 00       	mov    $0x1000,%ecx
8010722c:	5a                   	pop    %edx
8010722d:	6a 06                	push   $0x6
8010722f:	50                   	push   %eax
80107230:	89 da                	mov    %ebx,%edx
80107232:	8b 45 08             	mov    0x8(%ebp),%eax
80107235:	e8 06 fb ff ff       	call   80106d40 <mappages>
8010723a:	83 c4 10             	add    $0x10,%esp
8010723d:	85 c0                	test   %eax,%eax
8010723f:	78 47                	js     80107288 <allocuvm+0xa8>
    return 0;
  if(newsz < oldsz)
    return oldsz;

  a = PGROUNDUP(oldsz);
  for(; a < newsz; a += PGSIZE){
80107241:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80107247:	39 df                	cmp    %ebx,%edi
80107249:	76 2d                	jbe    80107278 <allocuvm+0x98>
    mem = kalloc();
8010724b:	e8 40 b2 ff ff       	call   80102490 <kalloc>
    if(mem == 0){
80107250:	85 c0                	test   %eax,%eax
  if(newsz < oldsz)
    return oldsz;

  a = PGROUNDUP(oldsz);
  for(; a < newsz; a += PGSIZE){
    mem = kalloc();
80107252:	89 c6                	mov    %eax,%esi
    if(mem == 0){
80107254:	75 ba                	jne    80107210 <allocuvm+0x30>
      cprintf("allocuvm out of memory\n");
80107256:	83 ec 0c             	sub    $0xc,%esp
80107259:	68 79 7f 10 80       	push   $0x80107f79
8010725e:	e8 fd 93 ff ff       	call   80100660 <cprintf>
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
  pte_t *pte;
  uint a, pa;

  if(newsz >= oldsz)
80107263:	83 c4 10             	add    $0x10,%esp
80107266:	3b 7d 0c             	cmp    0xc(%ebp),%edi
80107269:	77 4f                	ja     801072ba <allocuvm+0xda>
    memset(mem, 0, PGSIZE);
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
      cprintf("allocuvm out of memory (2)\n");
      deallocuvm(pgdir, newsz, oldsz);
      kfree(mem);
      return 0;
8010726b:	31 c0                	xor    %eax,%eax
    }
  }
  return newsz;
}
8010726d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80107270:	5b                   	pop    %ebx
80107271:	5e                   	pop    %esi
80107272:	5f                   	pop    %edi
80107273:	5d                   	pop    %ebp
80107274:	c3                   	ret    
80107275:	8d 76 00             	lea    0x0(%esi),%esi
80107278:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return 0;
  if(newsz < oldsz)
    return oldsz;

  a = PGROUNDUP(oldsz);
  for(; a < newsz; a += PGSIZE){
8010727b:	89 f8                	mov    %edi,%eax
      kfree(mem);
      return 0;
    }
  }
  return newsz;
}
8010727d:	5b                   	pop    %ebx
8010727e:	5e                   	pop    %esi
8010727f:	5f                   	pop    %edi
80107280:	5d                   	pop    %ebp
80107281:	c3                   	ret    
80107282:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      deallocuvm(pgdir, newsz, oldsz);
      return 0;
    }
    memset(mem, 0, PGSIZE);
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
      cprintf("allocuvm out of memory (2)\n");
80107288:	83 ec 0c             	sub    $0xc,%esp
8010728b:	68 91 7f 10 80       	push   $0x80107f91
80107290:	e8 cb 93 ff ff       	call   80100660 <cprintf>
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
  pte_t *pte;
  uint a, pa;

  if(newsz >= oldsz)
80107295:	83 c4 10             	add    $0x10,%esp
80107298:	3b 7d 0c             	cmp    0xc(%ebp),%edi
8010729b:	76 0d                	jbe    801072aa <allocuvm+0xca>
8010729d:	8b 4d 0c             	mov    0xc(%ebp),%ecx
801072a0:	8b 45 08             	mov    0x8(%ebp),%eax
801072a3:	89 fa                	mov    %edi,%edx
801072a5:	e8 26 fb ff ff       	call   80106dd0 <deallocuvm.part.0>
    }
    memset(mem, 0, PGSIZE);
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
      cprintf("allocuvm out of memory (2)\n");
      deallocuvm(pgdir, newsz, oldsz);
      kfree(mem);
801072aa:	83 ec 0c             	sub    $0xc,%esp
801072ad:	56                   	push   %esi
801072ae:	e8 2d b0 ff ff       	call   801022e0 <kfree>
      return 0;
801072b3:	83 c4 10             	add    $0x10,%esp
801072b6:	31 c0                	xor    %eax,%eax
801072b8:	eb b3                	jmp    8010726d <allocuvm+0x8d>
801072ba:	8b 4d 0c             	mov    0xc(%ebp),%ecx
801072bd:	8b 45 08             	mov    0x8(%ebp),%eax
801072c0:	89 fa                	mov    %edi,%edx
801072c2:	e8 09 fb ff ff       	call   80106dd0 <deallocuvm.part.0>
  for(; a < newsz; a += PGSIZE){
    mem = kalloc();
    if(mem == 0){
      cprintf("allocuvm out of memory\n");
      deallocuvm(pgdir, newsz, oldsz);
      return 0;
801072c7:	31 c0                	xor    %eax,%eax
801072c9:	eb a2                	jmp    8010726d <allocuvm+0x8d>
801072cb:	90                   	nop
801072cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801072d0 <deallocuvm>:
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
801072d0:	55                   	push   %ebp
801072d1:	89 e5                	mov    %esp,%ebp
801072d3:	8b 55 0c             	mov    0xc(%ebp),%edx
801072d6:	8b 4d 10             	mov    0x10(%ebp),%ecx
801072d9:	8b 45 08             	mov    0x8(%ebp),%eax
  pte_t *pte;
  uint a, pa;

  if(newsz >= oldsz)
801072dc:	39 d1                	cmp    %edx,%ecx
801072de:	73 10                	jae    801072f0 <deallocuvm+0x20>
      kfree(v);
      *pte = 0;
    }
  }
  return newsz;
}
801072e0:	5d                   	pop    %ebp
801072e1:	e9 ea fa ff ff       	jmp    80106dd0 <deallocuvm.part.0>
801072e6:	8d 76 00             	lea    0x0(%esi),%esi
801072e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801072f0:	89 d0                	mov    %edx,%eax
801072f2:	5d                   	pop    %ebp
801072f3:	c3                   	ret    
801072f4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801072fa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80107300 <freevm>:

// Free a page table and all the physical memory pages
// in the user part.
void
freevm(pde_t *pgdir)
{
80107300:	55                   	push   %ebp
80107301:	89 e5                	mov    %esp,%ebp
80107303:	57                   	push   %edi
80107304:	56                   	push   %esi
80107305:	53                   	push   %ebx
80107306:	83 ec 0c             	sub    $0xc,%esp
80107309:	8b 75 08             	mov    0x8(%ebp),%esi
  uint i;

  if(pgdir == 0)
8010730c:	85 f6                	test   %esi,%esi
8010730e:	74 59                	je     80107369 <freevm+0x69>
80107310:	31 c9                	xor    %ecx,%ecx
80107312:	ba 00 00 00 80       	mov    $0x80000000,%edx
80107317:	89 f0                	mov    %esi,%eax
80107319:	e8 b2 fa ff ff       	call   80106dd0 <deallocuvm.part.0>
8010731e:	89 f3                	mov    %esi,%ebx
80107320:	8d be 00 10 00 00    	lea    0x1000(%esi),%edi
80107326:	eb 0f                	jmp    80107337 <freevm+0x37>
80107328:	90                   	nop
80107329:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80107330:	83 c3 04             	add    $0x4,%ebx
    panic("freevm: no pgdir");
  deallocuvm(pgdir, KERNBASE, 0);
  for(i = 0; i < NPDENTRIES; i++){
80107333:	39 fb                	cmp    %edi,%ebx
80107335:	74 23                	je     8010735a <freevm+0x5a>
    if(pgdir[i] & PTE_P){
80107337:	8b 03                	mov    (%ebx),%eax
80107339:	a8 01                	test   $0x1,%al
8010733b:	74 f3                	je     80107330 <freevm+0x30>
      char * v = P2V(PTE_ADDR(pgdir[i]));
8010733d:	25 00 f0 ff ff       	and    $0xfffff000,%eax
      kfree(v);
80107342:	83 ec 0c             	sub    $0xc,%esp
80107345:	83 c3 04             	add    $0x4,%ebx
  if(pgdir == 0)
    panic("freevm: no pgdir");
  deallocuvm(pgdir, KERNBASE, 0);
  for(i = 0; i < NPDENTRIES; i++){
    if(pgdir[i] & PTE_P){
      char * v = P2V(PTE_ADDR(pgdir[i]));
80107348:	05 00 00 00 80       	add    $0x80000000,%eax
      kfree(v);
8010734d:	50                   	push   %eax
8010734e:	e8 8d af ff ff       	call   801022e0 <kfree>
80107353:	83 c4 10             	add    $0x10,%esp
  uint i;

  if(pgdir == 0)
    panic("freevm: no pgdir");
  deallocuvm(pgdir, KERNBASE, 0);
  for(i = 0; i < NPDENTRIES; i++){
80107356:	39 fb                	cmp    %edi,%ebx
80107358:	75 dd                	jne    80107337 <freevm+0x37>
    if(pgdir[i] & PTE_P){
      char * v = P2V(PTE_ADDR(pgdir[i]));
      kfree(v);
    }
  }
  kfree((char*)pgdir);
8010735a:	89 75 08             	mov    %esi,0x8(%ebp)
}
8010735d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80107360:	5b                   	pop    %ebx
80107361:	5e                   	pop    %esi
80107362:	5f                   	pop    %edi
80107363:	5d                   	pop    %ebp
    if(pgdir[i] & PTE_P){
      char * v = P2V(PTE_ADDR(pgdir[i]));
      kfree(v);
    }
  }
  kfree((char*)pgdir);
80107364:	e9 77 af ff ff       	jmp    801022e0 <kfree>
freevm(pde_t *pgdir)
{
  uint i;

  if(pgdir == 0)
    panic("freevm: no pgdir");
80107369:	83 ec 0c             	sub    $0xc,%esp
8010736c:	68 ad 7f 10 80       	push   $0x80107fad
80107371:	e8 fa 8f ff ff       	call   80100370 <panic>
80107376:	8d 76 00             	lea    0x0(%esi),%esi
80107379:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80107380 <setupkvm>:
};

// Set up kernel part of a page table.
pde_t*
setupkvm(void)
{
80107380:	55                   	push   %ebp
80107381:	89 e5                	mov    %esp,%ebp
80107383:	56                   	push   %esi
80107384:	53                   	push   %ebx
  pde_t *pgdir;
  struct kmap *k;

  if((pgdir = (pde_t*)kalloc()) == 0)
80107385:	e8 06 b1 ff ff       	call   80102490 <kalloc>
8010738a:	85 c0                	test   %eax,%eax
8010738c:	89 c6                	mov    %eax,%esi
8010738e:	74 42                	je     801073d2 <setupkvm+0x52>
    return 0;
  memset(pgdir, 0, PGSIZE);
80107390:	83 ec 04             	sub    $0x4,%esp
  if (P2V(PHYSTOP) > (void*)DEVSPACE)
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
80107393:	bb 20 b4 10 80       	mov    $0x8010b420,%ebx
  pde_t *pgdir;
  struct kmap *k;

  if((pgdir = (pde_t*)kalloc()) == 0)
    return 0;
  memset(pgdir, 0, PGSIZE);
80107398:	68 00 10 00 00       	push   $0x1000
8010739d:	6a 00                	push   $0x0
8010739f:	50                   	push   %eax
801073a0:	e8 bb d6 ff ff       	call   80104a60 <memset>
801073a5:	83 c4 10             	add    $0x10,%esp
  if (P2V(PHYSTOP) > (void*)DEVSPACE)
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start,
                (uint)k->phys_start, k->perm) < 0) {
801073a8:	8b 43 04             	mov    0x4(%ebx),%eax
    return 0;
  memset(pgdir, 0, PGSIZE);
  if (P2V(PHYSTOP) > (void*)DEVSPACE)
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start,
801073ab:	8b 4b 08             	mov    0x8(%ebx),%ecx
801073ae:	83 ec 08             	sub    $0x8,%esp
801073b1:	8b 13                	mov    (%ebx),%edx
801073b3:	ff 73 0c             	pushl  0xc(%ebx)
801073b6:	50                   	push   %eax
801073b7:	29 c1                	sub    %eax,%ecx
801073b9:	89 f0                	mov    %esi,%eax
801073bb:	e8 80 f9 ff ff       	call   80106d40 <mappages>
801073c0:	83 c4 10             	add    $0x10,%esp
801073c3:	85 c0                	test   %eax,%eax
801073c5:	78 19                	js     801073e0 <setupkvm+0x60>
  if((pgdir = (pde_t*)kalloc()) == 0)
    return 0;
  memset(pgdir, 0, PGSIZE);
  if (P2V(PHYSTOP) > (void*)DEVSPACE)
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
801073c7:	83 c3 10             	add    $0x10,%ebx
801073ca:	81 fb 60 b4 10 80    	cmp    $0x8010b460,%ebx
801073d0:	75 d6                	jne    801073a8 <setupkvm+0x28>
                (uint)k->phys_start, k->perm) < 0) {
      freevm(pgdir);
      return 0;
    }
  return pgdir;
}
801073d2:	8d 65 f8             	lea    -0x8(%ebp),%esp
801073d5:	89 f0                	mov    %esi,%eax
801073d7:	5b                   	pop    %ebx
801073d8:	5e                   	pop    %esi
801073d9:	5d                   	pop    %ebp
801073da:	c3                   	ret    
801073db:	90                   	nop
801073dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if (P2V(PHYSTOP) > (void*)DEVSPACE)
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start,
                (uint)k->phys_start, k->perm) < 0) {
      freevm(pgdir);
801073e0:	83 ec 0c             	sub    $0xc,%esp
801073e3:	56                   	push   %esi
      return 0;
801073e4:	31 f6                	xor    %esi,%esi
  if (P2V(PHYSTOP) > (void*)DEVSPACE)
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start,
                (uint)k->phys_start, k->perm) < 0) {
      freevm(pgdir);
801073e6:	e8 15 ff ff ff       	call   80107300 <freevm>
      return 0;
801073eb:	83 c4 10             	add    $0x10,%esp
    }
  return pgdir;
}
801073ee:	8d 65 f8             	lea    -0x8(%ebp),%esp
801073f1:	89 f0                	mov    %esi,%eax
801073f3:	5b                   	pop    %ebx
801073f4:	5e                   	pop    %esi
801073f5:	5d                   	pop    %ebp
801073f6:	c3                   	ret    
801073f7:	89 f6                	mov    %esi,%esi
801073f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80107400 <kvmalloc>:

// Allocate one page table for the machine for the kernel address
// space for scheduler processes.
void
kvmalloc(void)
{
80107400:	55                   	push   %ebp
80107401:	89 e5                	mov    %esp,%ebp
80107403:	83 ec 08             	sub    $0x8,%esp
  kpgdir = setupkvm();
80107406:	e8 75 ff ff ff       	call   80107380 <setupkvm>
8010740b:	a3 c4 8b 11 80       	mov    %eax,0x80118bc4
// Switch h/w page table register to the kernel-only page table,
// for when no process is running.
void
switchkvm(void)
{
  lcr3(V2P(kpgdir));   // switch to the kernel page table
80107410:	05 00 00 00 80       	add    $0x80000000,%eax
80107415:	0f 22 d8             	mov    %eax,%cr3
void
kvmalloc(void)
{
  kpgdir = setupkvm();
  switchkvm();
}
80107418:	c9                   	leave  
80107419:	c3                   	ret    
8010741a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80107420 <clearpteu>:

// Clear PTE_U on a page. Used to create an inaccessible
// page beneath the user stack.
void
clearpteu(pde_t *pgdir, char *uva)
{
80107420:	55                   	push   %ebp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80107421:	31 c9                	xor    %ecx,%ecx

// Clear PTE_U on a page. Used to create an inaccessible
// page beneath the user stack.
void
clearpteu(pde_t *pgdir, char *uva)
{
80107423:	89 e5                	mov    %esp,%ebp
80107425:	83 ec 08             	sub    $0x8,%esp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80107428:	8b 55 0c             	mov    0xc(%ebp),%edx
8010742b:	8b 45 08             	mov    0x8(%ebp),%eax
8010742e:	e8 8d f8 ff ff       	call   80106cc0 <walkpgdir>
  if(pte == 0)
80107433:	85 c0                	test   %eax,%eax
80107435:	74 05                	je     8010743c <clearpteu+0x1c>
    panic("clearpteu");
  *pte &= ~PTE_U;
80107437:	83 20 fb             	andl   $0xfffffffb,(%eax)
}
8010743a:	c9                   	leave  
8010743b:	c3                   	ret    
{
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
  if(pte == 0)
    panic("clearpteu");
8010743c:	83 ec 0c             	sub    $0xc,%esp
8010743f:	68 be 7f 10 80       	push   $0x80107fbe
80107444:	e8 27 8f ff ff       	call   80100370 <panic>
80107449:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80107450 <copyuvm>:

// Given a parent process's page table, create a copy
// of it for a child.
pde_t*
copyuvm(pde_t *pgdir, uint sz)
{
80107450:	55                   	push   %ebp
80107451:	89 e5                	mov    %esp,%ebp
80107453:	57                   	push   %edi
80107454:	56                   	push   %esi
80107455:	53                   	push   %ebx
80107456:	83 ec 1c             	sub    $0x1c,%esp
  pde_t *d;
  pte_t *pte;
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
80107459:	e8 22 ff ff ff       	call   80107380 <setupkvm>
8010745e:	85 c0                	test   %eax,%eax
80107460:	89 45 e0             	mov    %eax,-0x20(%ebp)
80107463:	0f 84 a0 00 00 00    	je     80107509 <copyuvm+0xb9>
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
80107469:	8b 4d 0c             	mov    0xc(%ebp),%ecx
8010746c:	85 c9                	test   %ecx,%ecx
8010746e:	0f 84 95 00 00 00    	je     80107509 <copyuvm+0xb9>
80107474:	31 f6                	xor    %esi,%esi
80107476:	eb 4e                	jmp    801074c6 <copyuvm+0x76>
80107478:	90                   	nop
80107479:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
    flags = PTE_FLAGS(*pte);
    if((mem = kalloc()) == 0)
      goto bad;
    memmove(mem, (char*)P2V(pa), PGSIZE);
80107480:	83 ec 04             	sub    $0x4,%esp
80107483:	81 c7 00 00 00 80    	add    $0x80000000,%edi
80107489:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010748c:	68 00 10 00 00       	push   $0x1000
80107491:	57                   	push   %edi
80107492:	50                   	push   %eax
80107493:	e8 78 d6 ff ff       	call   80104b10 <memmove>
    if(mappages(d, (void*)i, PGSIZE, V2P(mem), flags) < 0)
80107498:	58                   	pop    %eax
80107499:	5a                   	pop    %edx
8010749a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
8010749d:	8b 45 e0             	mov    -0x20(%ebp),%eax
801074a0:	b9 00 10 00 00       	mov    $0x1000,%ecx
801074a5:	53                   	push   %ebx
801074a6:	81 c2 00 00 00 80    	add    $0x80000000,%edx
801074ac:	52                   	push   %edx
801074ad:	89 f2                	mov    %esi,%edx
801074af:	e8 8c f8 ff ff       	call   80106d40 <mappages>
801074b4:	83 c4 10             	add    $0x10,%esp
801074b7:	85 c0                	test   %eax,%eax
801074b9:	78 39                	js     801074f4 <copyuvm+0xa4>
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
801074bb:	81 c6 00 10 00 00    	add    $0x1000,%esi
801074c1:	39 75 0c             	cmp    %esi,0xc(%ebp)
801074c4:	76 43                	jbe    80107509 <copyuvm+0xb9>
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
801074c6:	8b 45 08             	mov    0x8(%ebp),%eax
801074c9:	31 c9                	xor    %ecx,%ecx
801074cb:	89 f2                	mov    %esi,%edx
801074cd:	e8 ee f7 ff ff       	call   80106cc0 <walkpgdir>
801074d2:	85 c0                	test   %eax,%eax
801074d4:	74 3e                	je     80107514 <copyuvm+0xc4>
      panic("copyuvm: pte should exist");
    if(!(*pte & PTE_P))
801074d6:	8b 18                	mov    (%eax),%ebx
801074d8:	f6 c3 01             	test   $0x1,%bl
801074db:	74 44                	je     80107521 <copyuvm+0xd1>
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
801074dd:	89 df                	mov    %ebx,%edi
    flags = PTE_FLAGS(*pte);
801074df:	81 e3 ff 0f 00 00    	and    $0xfff,%ebx
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
      panic("copyuvm: pte should exist");
    if(!(*pte & PTE_P))
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
801074e5:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
    flags = PTE_FLAGS(*pte);
    if((mem = kalloc()) == 0)
801074eb:	e8 a0 af ff ff       	call   80102490 <kalloc>
801074f0:	85 c0                	test   %eax,%eax
801074f2:	75 8c                	jne    80107480 <copyuvm+0x30>
      goto bad;
  }
  return d;

bad:
  freevm(d);
801074f4:	83 ec 0c             	sub    $0xc,%esp
801074f7:	ff 75 e0             	pushl  -0x20(%ebp)
801074fa:	e8 01 fe ff ff       	call   80107300 <freevm>
  return 0;
801074ff:	83 c4 10             	add    $0x10,%esp
80107502:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
}
80107509:	8b 45 e0             	mov    -0x20(%ebp),%eax
8010750c:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010750f:	5b                   	pop    %ebx
80107510:	5e                   	pop    %esi
80107511:	5f                   	pop    %edi
80107512:	5d                   	pop    %ebp
80107513:	c3                   	ret    

  if((d = setupkvm()) == 0)
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
      panic("copyuvm: pte should exist");
80107514:	83 ec 0c             	sub    $0xc,%esp
80107517:	68 c8 7f 10 80       	push   $0x80107fc8
8010751c:	e8 4f 8e ff ff       	call   80100370 <panic>
    if(!(*pte & PTE_P))
      panic("copyuvm: page not present");
80107521:	83 ec 0c             	sub    $0xc,%esp
80107524:	68 e2 7f 10 80       	push   $0x80107fe2
80107529:	e8 42 8e ff ff       	call   80100370 <panic>
8010752e:	66 90                	xchg   %ax,%ax

80107530 <uva2ka>:

//PAGEBREAK!
// Map user virtual address to kernel address.
char*
uva2ka(pde_t *pgdir, char *uva)
{
80107530:	55                   	push   %ebp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80107531:	31 c9                	xor    %ecx,%ecx

//PAGEBREAK!
// Map user virtual address to kernel address.
char*
uva2ka(pde_t *pgdir, char *uva)
{
80107533:	89 e5                	mov    %esp,%ebp
80107535:	83 ec 08             	sub    $0x8,%esp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80107538:	8b 55 0c             	mov    0xc(%ebp),%edx
8010753b:	8b 45 08             	mov    0x8(%ebp),%eax
8010753e:	e8 7d f7 ff ff       	call   80106cc0 <walkpgdir>
  if((*pte & PTE_P) == 0)
80107543:	8b 00                	mov    (%eax),%eax
    return 0;
  if((*pte & PTE_U) == 0)
    return 0;
  return (char*)P2V(PTE_ADDR(*pte));
}
80107545:	c9                   	leave  
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
  if((*pte & PTE_P) == 0)
    return 0;
  if((*pte & PTE_U) == 0)
80107546:	89 c2                	mov    %eax,%edx
    return 0;
  return (char*)P2V(PTE_ADDR(*pte));
80107548:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
  if((*pte & PTE_P) == 0)
    return 0;
  if((*pte & PTE_U) == 0)
8010754d:	83 e2 05             	and    $0x5,%edx
    return 0;
  return (char*)P2V(PTE_ADDR(*pte));
80107550:	05 00 00 00 80       	add    $0x80000000,%eax
80107555:	83 fa 05             	cmp    $0x5,%edx
80107558:	ba 00 00 00 00       	mov    $0x0,%edx
8010755d:	0f 45 c2             	cmovne %edx,%eax
}
80107560:	c3                   	ret    
80107561:	eb 0d                	jmp    80107570 <copyout>
80107563:	90                   	nop
80107564:	90                   	nop
80107565:	90                   	nop
80107566:	90                   	nop
80107567:	90                   	nop
80107568:	90                   	nop
80107569:	90                   	nop
8010756a:	90                   	nop
8010756b:	90                   	nop
8010756c:	90                   	nop
8010756d:	90                   	nop
8010756e:	90                   	nop
8010756f:	90                   	nop

80107570 <copyout>:
// Copy len bytes from p to user address va in page table pgdir.
// Most useful when pgdir is not the current page table.
// uva2ka ensures this only works for PTE_U pages.
int
copyout(pde_t *pgdir, uint va, void *p, uint len)
{
80107570:	55                   	push   %ebp
80107571:	89 e5                	mov    %esp,%ebp
80107573:	57                   	push   %edi
80107574:	56                   	push   %esi
80107575:	53                   	push   %ebx
80107576:	83 ec 1c             	sub    $0x1c,%esp
80107579:	8b 5d 14             	mov    0x14(%ebp),%ebx
8010757c:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
8010757f:	8b 7d 10             	mov    0x10(%ebp),%edi
80107582:	85 db                	test   %ebx,%ebx
80107584:	75 40                	jne    801075c6 <copyout+0x56>
80107586:	eb 70                	jmp    801075f8 <copyout+0x88>
80107588:	90                   	nop
80107589:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    va0 = (uint)PGROUNDDOWN(va);
    pa0 = uva2ka(pgdir, (char*)va0);
    if(pa0 == 0)
      return -1;
    n = PGSIZE - (va - va0);
80107590:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80107593:	89 f1                	mov    %esi,%ecx
80107595:	29 d1                	sub    %edx,%ecx
80107597:	81 c1 00 10 00 00    	add    $0x1000,%ecx
8010759d:	39 d9                	cmp    %ebx,%ecx
8010759f:	0f 47 cb             	cmova  %ebx,%ecx
    if(n > len)
      n = len;
    memmove(pa0 + (va - va0), buf, n);
801075a2:	29 f2                	sub    %esi,%edx
801075a4:	83 ec 04             	sub    $0x4,%esp
801075a7:	01 d0                	add    %edx,%eax
801075a9:	51                   	push   %ecx
801075aa:	57                   	push   %edi
801075ab:	50                   	push   %eax
801075ac:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
801075af:	e8 5c d5 ff ff       	call   80104b10 <memmove>
    len -= n;
    buf += n;
801075b4:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
{
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
801075b7:	83 c4 10             	add    $0x10,%esp
    if(n > len)
      n = len;
    memmove(pa0 + (va - va0), buf, n);
    len -= n;
    buf += n;
    va = va0 + PGSIZE;
801075ba:	8d 96 00 10 00 00    	lea    0x1000(%esi),%edx
    n = PGSIZE - (va - va0);
    if(n > len)
      n = len;
    memmove(pa0 + (va - va0), buf, n);
    len -= n;
    buf += n;
801075c0:	01 cf                	add    %ecx,%edi
{
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
801075c2:	29 cb                	sub    %ecx,%ebx
801075c4:	74 32                	je     801075f8 <copyout+0x88>
    va0 = (uint)PGROUNDDOWN(va);
801075c6:	89 d6                	mov    %edx,%esi
    pa0 = uva2ka(pgdir, (char*)va0);
801075c8:	83 ec 08             	sub    $0x8,%esp
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
    va0 = (uint)PGROUNDDOWN(va);
801075cb:	89 55 e4             	mov    %edx,-0x1c(%ebp)
801075ce:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
    pa0 = uva2ka(pgdir, (char*)va0);
801075d4:	56                   	push   %esi
801075d5:	ff 75 08             	pushl  0x8(%ebp)
801075d8:	e8 53 ff ff ff       	call   80107530 <uva2ka>
    if(pa0 == 0)
801075dd:	83 c4 10             	add    $0x10,%esp
801075e0:	85 c0                	test   %eax,%eax
801075e2:	75 ac                	jne    80107590 <copyout+0x20>
    len -= n;
    buf += n;
    va = va0 + PGSIZE;
  }
  return 0;
}
801075e4:	8d 65 f4             	lea    -0xc(%ebp),%esp
  buf = (char*)p;
  while(len > 0){
    va0 = (uint)PGROUNDDOWN(va);
    pa0 = uva2ka(pgdir, (char*)va0);
    if(pa0 == 0)
      return -1;
801075e7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    len -= n;
    buf += n;
    va = va0 + PGSIZE;
  }
  return 0;
}
801075ec:	5b                   	pop    %ebx
801075ed:	5e                   	pop    %esi
801075ee:	5f                   	pop    %edi
801075ef:	5d                   	pop    %ebp
801075f0:	c3                   	ret    
801075f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801075f8:	8d 65 f4             	lea    -0xc(%ebp),%esp
    memmove(pa0 + (va - va0), buf, n);
    len -= n;
    buf += n;
    va = va0 + PGSIZE;
  }
  return 0;
801075fb:	31 c0                	xor    %eax,%eax
}
801075fd:	5b                   	pop    %ebx
801075fe:	5e                   	pop    %esi
801075ff:	5f                   	pop    %edi
80107600:	5d                   	pop    %ebp
80107601:	c3                   	ret    
