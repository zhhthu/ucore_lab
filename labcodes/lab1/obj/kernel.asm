
bin/kernel：     文件格式 elf32-i386


Disassembly of section .text:

00100000 <kern_init>:
int kern_init(void) __attribute__((noreturn));
void grade_backtrace(void);
static void lab1_switch_test(void);

int
kern_init(void) {
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 28             	sub    $0x28,%esp
    extern char edata[], end[];
    memset(edata, 0, end - edata);
  100006:	ba 40 fd 10 00       	mov    $0x10fd40,%edx
  10000b:	b8 16 ea 10 00       	mov    $0x10ea16,%eax
  100010:	29 c2                	sub    %eax,%edx
  100012:	89 d0                	mov    %edx,%eax
  100014:	89 44 24 08          	mov    %eax,0x8(%esp)
  100018:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  10001f:	00 
  100020:	c7 04 24 16 ea 10 00 	movl   $0x10ea16,(%esp)
  100027:	e8 c2 32 00 00       	call   1032ee <memset>

    cons_init();                // init the console
  10002c:	e8 37 15 00 00       	call   101568 <cons_init>

    const char *message = "(THU.CST) os is loading ...";
  100031:	c7 45 f4 80 34 10 00 	movl   $0x103480,-0xc(%ebp)
    cprintf("%s\n\n", message);
  100038:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10003b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10003f:	c7 04 24 9c 34 10 00 	movl   $0x10349c,(%esp)
  100046:	e8 c7 02 00 00       	call   100312 <cprintf>

    print_kerninfo();
  10004b:	e8 f6 07 00 00       	call   100846 <print_kerninfo>

    grade_backtrace();
  100050:	e8 86 00 00 00       	call   1000db <grade_backtrace>

    pmm_init();                 // init physical memory management
  100055:	e8 da 28 00 00       	call   102934 <pmm_init>

    pic_init();                 // init interrupt controller
  10005a:	e8 4c 16 00 00       	call   1016ab <pic_init>
    idt_init();                 // init interrupt descriptor table
  10005f:	e8 9e 17 00 00       	call   101802 <idt_init>

    clock_init();               // init clock interrupt
  100064:	e8 f2 0c 00 00       	call   100d5b <clock_init>
    intr_enable();              // enable irq interrupt
  100069:	e8 ab 15 00 00       	call   101619 <intr_enable>
    //LAB1: CAHLLENGE 1 If you try to do it, uncomment lab1_switch_test()
    // user/kernel mode switch test
    //lab1_switch_test();

    /* do nothing */
    while (1);
  10006e:	eb fe                	jmp    10006e <kern_init+0x6e>

00100070 <grade_backtrace2>:
}

void __attribute__((noinline))
grade_backtrace2(int arg0, int arg1, int arg2, int arg3) {
  100070:	55                   	push   %ebp
  100071:	89 e5                	mov    %esp,%ebp
  100073:	83 ec 18             	sub    $0x18,%esp
    mon_backtrace(0, NULL, NULL);
  100076:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  10007d:	00 
  10007e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  100085:	00 
  100086:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  10008d:	e8 fb 0b 00 00       	call   100c8d <mon_backtrace>
}
  100092:	c9                   	leave  
  100093:	c3                   	ret    

00100094 <grade_backtrace1>:

void __attribute__((noinline))
grade_backtrace1(int arg0, int arg1) {
  100094:	55                   	push   %ebp
  100095:	89 e5                	mov    %esp,%ebp
  100097:	53                   	push   %ebx
  100098:	83 ec 14             	sub    $0x14,%esp
    grade_backtrace2(arg0, (int)&arg0, arg1, (int)&arg1);
  10009b:	8d 5d 0c             	lea    0xc(%ebp),%ebx
  10009e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  1000a1:	8d 55 08             	lea    0x8(%ebp),%edx
  1000a4:	8b 45 08             	mov    0x8(%ebp),%eax
  1000a7:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  1000ab:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  1000af:	89 54 24 04          	mov    %edx,0x4(%esp)
  1000b3:	89 04 24             	mov    %eax,(%esp)
  1000b6:	e8 b5 ff ff ff       	call   100070 <grade_backtrace2>
}
  1000bb:	83 c4 14             	add    $0x14,%esp
  1000be:	5b                   	pop    %ebx
  1000bf:	5d                   	pop    %ebp
  1000c0:	c3                   	ret    

001000c1 <grade_backtrace0>:

void __attribute__((noinline))
grade_backtrace0(int arg0, int arg1, int arg2) {
  1000c1:	55                   	push   %ebp
  1000c2:	89 e5                	mov    %esp,%ebp
  1000c4:	83 ec 18             	sub    $0x18,%esp
    grade_backtrace1(arg0, arg2);
  1000c7:	8b 45 10             	mov    0x10(%ebp),%eax
  1000ca:	89 44 24 04          	mov    %eax,0x4(%esp)
  1000ce:	8b 45 08             	mov    0x8(%ebp),%eax
  1000d1:	89 04 24             	mov    %eax,(%esp)
  1000d4:	e8 bb ff ff ff       	call   100094 <grade_backtrace1>
}
  1000d9:	c9                   	leave  
  1000da:	c3                   	ret    

001000db <grade_backtrace>:

void
grade_backtrace(void) {
  1000db:	55                   	push   %ebp
  1000dc:	89 e5                	mov    %esp,%ebp
  1000de:	83 ec 18             	sub    $0x18,%esp
    grade_backtrace0(0, (int)kern_init, 0xffff0000);
  1000e1:	b8 00 00 10 00       	mov    $0x100000,%eax
  1000e6:	c7 44 24 08 00 00 ff 	movl   $0xffff0000,0x8(%esp)
  1000ed:	ff 
  1000ee:	89 44 24 04          	mov    %eax,0x4(%esp)
  1000f2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  1000f9:	e8 c3 ff ff ff       	call   1000c1 <grade_backtrace0>
}
  1000fe:	c9                   	leave  
  1000ff:	c3                   	ret    

00100100 <lab1_print_cur_status>:

static void
lab1_print_cur_status(void) {
  100100:	55                   	push   %ebp
  100101:	89 e5                	mov    %esp,%ebp
  100103:	83 ec 28             	sub    $0x28,%esp
    static int round = 0;
    uint16_t reg1, reg2, reg3, reg4;
    asm volatile (
  100106:	8c 4d f6             	mov    %cs,-0xa(%ebp)
  100109:	8c 5d f4             	mov    %ds,-0xc(%ebp)
  10010c:	8c 45 f2             	mov    %es,-0xe(%ebp)
  10010f:	8c 55 f0             	mov    %ss,-0x10(%ebp)
            "mov %%cs, %0;"
            "mov %%ds, %1;"
            "mov %%es, %2;"
            "mov %%ss, %3;"
            : "=m"(reg1), "=m"(reg2), "=m"(reg3), "=m"(reg4));
    cprintf("%d: @ring %d\n", round, reg1 & 3);
  100112:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100116:	0f b7 c0             	movzwl %ax,%eax
  100119:	83 e0 03             	and    $0x3,%eax
  10011c:	89 c2                	mov    %eax,%edx
  10011e:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100123:	89 54 24 08          	mov    %edx,0x8(%esp)
  100127:	89 44 24 04          	mov    %eax,0x4(%esp)
  10012b:	c7 04 24 a1 34 10 00 	movl   $0x1034a1,(%esp)
  100132:	e8 db 01 00 00       	call   100312 <cprintf>
    cprintf("%d:  cs = %x\n", round, reg1);
  100137:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  10013b:	0f b7 d0             	movzwl %ax,%edx
  10013e:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100143:	89 54 24 08          	mov    %edx,0x8(%esp)
  100147:	89 44 24 04          	mov    %eax,0x4(%esp)
  10014b:	c7 04 24 af 34 10 00 	movl   $0x1034af,(%esp)
  100152:	e8 bb 01 00 00       	call   100312 <cprintf>
    cprintf("%d:  ds = %x\n", round, reg2);
  100157:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
  10015b:	0f b7 d0             	movzwl %ax,%edx
  10015e:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100163:	89 54 24 08          	mov    %edx,0x8(%esp)
  100167:	89 44 24 04          	mov    %eax,0x4(%esp)
  10016b:	c7 04 24 bd 34 10 00 	movl   $0x1034bd,(%esp)
  100172:	e8 9b 01 00 00       	call   100312 <cprintf>
    cprintf("%d:  es = %x\n", round, reg3);
  100177:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  10017b:	0f b7 d0             	movzwl %ax,%edx
  10017e:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100183:	89 54 24 08          	mov    %edx,0x8(%esp)
  100187:	89 44 24 04          	mov    %eax,0x4(%esp)
  10018b:	c7 04 24 cb 34 10 00 	movl   $0x1034cb,(%esp)
  100192:	e8 7b 01 00 00       	call   100312 <cprintf>
    cprintf("%d:  ss = %x\n", round, reg4);
  100197:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  10019b:	0f b7 d0             	movzwl %ax,%edx
  10019e:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  1001a3:	89 54 24 08          	mov    %edx,0x8(%esp)
  1001a7:	89 44 24 04          	mov    %eax,0x4(%esp)
  1001ab:	c7 04 24 d9 34 10 00 	movl   $0x1034d9,(%esp)
  1001b2:	e8 5b 01 00 00       	call   100312 <cprintf>
    round ++;
  1001b7:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  1001bc:	83 c0 01             	add    $0x1,%eax
  1001bf:	a3 20 ea 10 00       	mov    %eax,0x10ea20
}
  1001c4:	c9                   	leave  
  1001c5:	c3                   	ret    

001001c6 <lab1_switch_to_user>:

static void
lab1_switch_to_user(void) {
  1001c6:	55                   	push   %ebp
  1001c7:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 : TODO
}
  1001c9:	5d                   	pop    %ebp
  1001ca:	c3                   	ret    

001001cb <lab1_switch_to_kernel>:

static void
lab1_switch_to_kernel(void) {
  1001cb:	55                   	push   %ebp
  1001cc:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 :  TODO
}
  1001ce:	5d                   	pop    %ebp
  1001cf:	c3                   	ret    

001001d0 <lab1_switch_test>:

static void
lab1_switch_test(void) {
  1001d0:	55                   	push   %ebp
  1001d1:	89 e5                	mov    %esp,%ebp
  1001d3:	83 ec 18             	sub    $0x18,%esp
    lab1_print_cur_status();
  1001d6:	e8 25 ff ff ff       	call   100100 <lab1_print_cur_status>
    cprintf("+++ switch to  user  mode +++\n");
  1001db:	c7 04 24 e8 34 10 00 	movl   $0x1034e8,(%esp)
  1001e2:	e8 2b 01 00 00       	call   100312 <cprintf>
    lab1_switch_to_user();
  1001e7:	e8 da ff ff ff       	call   1001c6 <lab1_switch_to_user>
    lab1_print_cur_status();
  1001ec:	e8 0f ff ff ff       	call   100100 <lab1_print_cur_status>
    cprintf("+++ switch to kernel mode +++\n");
  1001f1:	c7 04 24 08 35 10 00 	movl   $0x103508,(%esp)
  1001f8:	e8 15 01 00 00       	call   100312 <cprintf>
    lab1_switch_to_kernel();
  1001fd:	e8 c9 ff ff ff       	call   1001cb <lab1_switch_to_kernel>
    lab1_print_cur_status();
  100202:	e8 f9 fe ff ff       	call   100100 <lab1_print_cur_status>
}
  100207:	c9                   	leave  
  100208:	c3                   	ret    

00100209 <readline>:
 * The readline() function returns the text of the line read. If some errors
 * are happened, NULL is returned. The return value is a global variable,
 * thus it should be copied before it is used.
 * */
char *
readline(const char *prompt) {
  100209:	55                   	push   %ebp
  10020a:	89 e5                	mov    %esp,%ebp
  10020c:	83 ec 28             	sub    $0x28,%esp
    if (prompt != NULL) {
  10020f:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100213:	74 13                	je     100228 <readline+0x1f>
        cprintf("%s", prompt);
  100215:	8b 45 08             	mov    0x8(%ebp),%eax
  100218:	89 44 24 04          	mov    %eax,0x4(%esp)
  10021c:	c7 04 24 27 35 10 00 	movl   $0x103527,(%esp)
  100223:	e8 ea 00 00 00       	call   100312 <cprintf>
    }
    int i = 0, c;
  100228:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        c = getchar();
  10022f:	e8 66 01 00 00       	call   10039a <getchar>
  100234:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if (c < 0) {
  100237:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  10023b:	79 07                	jns    100244 <readline+0x3b>
            return NULL;
  10023d:	b8 00 00 00 00       	mov    $0x0,%eax
  100242:	eb 79                	jmp    1002bd <readline+0xb4>
        }
        else if (c >= ' ' && i < BUFSIZE - 1) {
  100244:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
  100248:	7e 28                	jle    100272 <readline+0x69>
  10024a:	81 7d f4 fe 03 00 00 	cmpl   $0x3fe,-0xc(%ebp)
  100251:	7f 1f                	jg     100272 <readline+0x69>
            cputchar(c);
  100253:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100256:	89 04 24             	mov    %eax,(%esp)
  100259:	e8 da 00 00 00       	call   100338 <cputchar>
            buf[i ++] = c;
  10025e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100261:	8d 50 01             	lea    0x1(%eax),%edx
  100264:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100267:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10026a:	88 90 40 ea 10 00    	mov    %dl,0x10ea40(%eax)
  100270:	eb 46                	jmp    1002b8 <readline+0xaf>
        }
        else if (c == '\b' && i > 0) {
  100272:	83 7d f0 08          	cmpl   $0x8,-0x10(%ebp)
  100276:	75 17                	jne    10028f <readline+0x86>
  100278:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  10027c:	7e 11                	jle    10028f <readline+0x86>
            cputchar(c);
  10027e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100281:	89 04 24             	mov    %eax,(%esp)
  100284:	e8 af 00 00 00       	call   100338 <cputchar>
            i --;
  100289:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
  10028d:	eb 29                	jmp    1002b8 <readline+0xaf>
        }
        else if (c == '\n' || c == '\r') {
  10028f:	83 7d f0 0a          	cmpl   $0xa,-0x10(%ebp)
  100293:	74 06                	je     10029b <readline+0x92>
  100295:	83 7d f0 0d          	cmpl   $0xd,-0x10(%ebp)
  100299:	75 1d                	jne    1002b8 <readline+0xaf>
            cputchar(c);
  10029b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10029e:	89 04 24             	mov    %eax,(%esp)
  1002a1:	e8 92 00 00 00       	call   100338 <cputchar>
            buf[i] = '\0';
  1002a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1002a9:	05 40 ea 10 00       	add    $0x10ea40,%eax
  1002ae:	c6 00 00             	movb   $0x0,(%eax)
            return buf;
  1002b1:	b8 40 ea 10 00       	mov    $0x10ea40,%eax
  1002b6:	eb 05                	jmp    1002bd <readline+0xb4>
        }
    }
  1002b8:	e9 72 ff ff ff       	jmp    10022f <readline+0x26>
}
  1002bd:	c9                   	leave  
  1002be:	c3                   	ret    

001002bf <cputch>:
/* *
 * cputch - writes a single character @c to stdout, and it will
 * increace the value of counter pointed by @cnt.
 * */
static void
cputch(int c, int *cnt) {
  1002bf:	55                   	push   %ebp
  1002c0:	89 e5                	mov    %esp,%ebp
  1002c2:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  1002c5:	8b 45 08             	mov    0x8(%ebp),%eax
  1002c8:	89 04 24             	mov    %eax,(%esp)
  1002cb:	e8 c4 12 00 00       	call   101594 <cons_putc>
    (*cnt) ++;
  1002d0:	8b 45 0c             	mov    0xc(%ebp),%eax
  1002d3:	8b 00                	mov    (%eax),%eax
  1002d5:	8d 50 01             	lea    0x1(%eax),%edx
  1002d8:	8b 45 0c             	mov    0xc(%ebp),%eax
  1002db:	89 10                	mov    %edx,(%eax)
}
  1002dd:	c9                   	leave  
  1002de:	c3                   	ret    

001002df <vcprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want cprintf() instead.
 * */
int
vcprintf(const char *fmt, va_list ap) {
  1002df:	55                   	push   %ebp
  1002e0:	89 e5                	mov    %esp,%ebp
  1002e2:	83 ec 28             	sub    $0x28,%esp
    int cnt = 0;
  1002e5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    vprintfmt((void*)cputch, &cnt, fmt, ap);
  1002ec:	8b 45 0c             	mov    0xc(%ebp),%eax
  1002ef:	89 44 24 0c          	mov    %eax,0xc(%esp)
  1002f3:	8b 45 08             	mov    0x8(%ebp),%eax
  1002f6:	89 44 24 08          	mov    %eax,0x8(%esp)
  1002fa:	8d 45 f4             	lea    -0xc(%ebp),%eax
  1002fd:	89 44 24 04          	mov    %eax,0x4(%esp)
  100301:	c7 04 24 bf 02 10 00 	movl   $0x1002bf,(%esp)
  100308:	e8 fa 27 00 00       	call   102b07 <vprintfmt>
    return cnt;
  10030d:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100310:	c9                   	leave  
  100311:	c3                   	ret    

00100312 <cprintf>:
 *
 * The return value is the number of characters which would be
 * written to stdout.
 * */
int
cprintf(const char *fmt, ...) {
  100312:	55                   	push   %ebp
  100313:	89 e5                	mov    %esp,%ebp
  100315:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  100318:	8d 45 0c             	lea    0xc(%ebp),%eax
  10031b:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vcprintf(fmt, ap);
  10031e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100321:	89 44 24 04          	mov    %eax,0x4(%esp)
  100325:	8b 45 08             	mov    0x8(%ebp),%eax
  100328:	89 04 24             	mov    %eax,(%esp)
  10032b:	e8 af ff ff ff       	call   1002df <vcprintf>
  100330:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  100333:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100336:	c9                   	leave  
  100337:	c3                   	ret    

00100338 <cputchar>:

/* cputchar - writes a single character to stdout */
void
cputchar(int c) {
  100338:	55                   	push   %ebp
  100339:	89 e5                	mov    %esp,%ebp
  10033b:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  10033e:	8b 45 08             	mov    0x8(%ebp),%eax
  100341:	89 04 24             	mov    %eax,(%esp)
  100344:	e8 4b 12 00 00       	call   101594 <cons_putc>
}
  100349:	c9                   	leave  
  10034a:	c3                   	ret    

0010034b <cputs>:
/* *
 * cputs- writes the string pointed by @str to stdout and
 * appends a newline character.
 * */
int
cputs(const char *str) {
  10034b:	55                   	push   %ebp
  10034c:	89 e5                	mov    %esp,%ebp
  10034e:	83 ec 28             	sub    $0x28,%esp
    int cnt = 0;
  100351:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    char c;
    while ((c = *str ++) != '\0') {
  100358:	eb 13                	jmp    10036d <cputs+0x22>
        cputch(c, &cnt);
  10035a:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  10035e:	8d 55 f0             	lea    -0x10(%ebp),%edx
  100361:	89 54 24 04          	mov    %edx,0x4(%esp)
  100365:	89 04 24             	mov    %eax,(%esp)
  100368:	e8 52 ff ff ff       	call   1002bf <cputch>
 * */
int
cputs(const char *str) {
    int cnt = 0;
    char c;
    while ((c = *str ++) != '\0') {
  10036d:	8b 45 08             	mov    0x8(%ebp),%eax
  100370:	8d 50 01             	lea    0x1(%eax),%edx
  100373:	89 55 08             	mov    %edx,0x8(%ebp)
  100376:	0f b6 00             	movzbl (%eax),%eax
  100379:	88 45 f7             	mov    %al,-0x9(%ebp)
  10037c:	80 7d f7 00          	cmpb   $0x0,-0x9(%ebp)
  100380:	75 d8                	jne    10035a <cputs+0xf>
        cputch(c, &cnt);
    }
    cputch('\n', &cnt);
  100382:	8d 45 f0             	lea    -0x10(%ebp),%eax
  100385:	89 44 24 04          	mov    %eax,0x4(%esp)
  100389:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
  100390:	e8 2a ff ff ff       	call   1002bf <cputch>
    return cnt;
  100395:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
  100398:	c9                   	leave  
  100399:	c3                   	ret    

0010039a <getchar>:

/* getchar - reads a single non-zero character from stdin */
int
getchar(void) {
  10039a:	55                   	push   %ebp
  10039b:	89 e5                	mov    %esp,%ebp
  10039d:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = cons_getc()) == 0)
  1003a0:	e8 18 12 00 00       	call   1015bd <cons_getc>
  1003a5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1003a8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1003ac:	74 f2                	je     1003a0 <getchar+0x6>
        /* do nothing */;
    return c;
  1003ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1003b1:	c9                   	leave  
  1003b2:	c3                   	ret    

001003b3 <stab_binsearch>:
 *      stab_binsearch(stabs, &left, &right, N_SO, 0xf0100184);
 * will exit setting left = 118, right = 554.
 * */
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
  1003b3:	55                   	push   %ebp
  1003b4:	89 e5                	mov    %esp,%ebp
  1003b6:	83 ec 20             	sub    $0x20,%esp
    int l = *region_left, r = *region_right, any_matches = 0;
  1003b9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1003bc:	8b 00                	mov    (%eax),%eax
  1003be:	89 45 fc             	mov    %eax,-0x4(%ebp)
  1003c1:	8b 45 10             	mov    0x10(%ebp),%eax
  1003c4:	8b 00                	mov    (%eax),%eax
  1003c6:	89 45 f8             	mov    %eax,-0x8(%ebp)
  1003c9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)

    while (l <= r) {
  1003d0:	e9 d2 00 00 00       	jmp    1004a7 <stab_binsearch+0xf4>
        int true_m = (l + r) / 2, m = true_m;
  1003d5:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1003d8:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1003db:	01 d0                	add    %edx,%eax
  1003dd:	89 c2                	mov    %eax,%edx
  1003df:	c1 ea 1f             	shr    $0x1f,%edx
  1003e2:	01 d0                	add    %edx,%eax
  1003e4:	d1 f8                	sar    %eax
  1003e6:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1003e9:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1003ec:	89 45 f0             	mov    %eax,-0x10(%ebp)

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  1003ef:	eb 04                	jmp    1003f5 <stab_binsearch+0x42>
            m --;
  1003f1:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)

    while (l <= r) {
        int true_m = (l + r) / 2, m = true_m;

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  1003f5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1003f8:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  1003fb:	7c 1f                	jl     10041c <stab_binsearch+0x69>
  1003fd:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100400:	89 d0                	mov    %edx,%eax
  100402:	01 c0                	add    %eax,%eax
  100404:	01 d0                	add    %edx,%eax
  100406:	c1 e0 02             	shl    $0x2,%eax
  100409:	89 c2                	mov    %eax,%edx
  10040b:	8b 45 08             	mov    0x8(%ebp),%eax
  10040e:	01 d0                	add    %edx,%eax
  100410:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100414:	0f b6 c0             	movzbl %al,%eax
  100417:	3b 45 14             	cmp    0x14(%ebp),%eax
  10041a:	75 d5                	jne    1003f1 <stab_binsearch+0x3e>
            m --;
        }
        if (m < l) {    // no match in [l, m]
  10041c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10041f:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  100422:	7d 0b                	jge    10042f <stab_binsearch+0x7c>
            l = true_m + 1;
  100424:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100427:	83 c0 01             	add    $0x1,%eax
  10042a:	89 45 fc             	mov    %eax,-0x4(%ebp)
            continue;
  10042d:	eb 78                	jmp    1004a7 <stab_binsearch+0xf4>
        }

        // actual binary search
        any_matches = 1;
  10042f:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
        if (stabs[m].n_value < addr) {
  100436:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100439:	89 d0                	mov    %edx,%eax
  10043b:	01 c0                	add    %eax,%eax
  10043d:	01 d0                	add    %edx,%eax
  10043f:	c1 e0 02             	shl    $0x2,%eax
  100442:	89 c2                	mov    %eax,%edx
  100444:	8b 45 08             	mov    0x8(%ebp),%eax
  100447:	01 d0                	add    %edx,%eax
  100449:	8b 40 08             	mov    0x8(%eax),%eax
  10044c:	3b 45 18             	cmp    0x18(%ebp),%eax
  10044f:	73 13                	jae    100464 <stab_binsearch+0xb1>
            *region_left = m;
  100451:	8b 45 0c             	mov    0xc(%ebp),%eax
  100454:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100457:	89 10                	mov    %edx,(%eax)
            l = true_m + 1;
  100459:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10045c:	83 c0 01             	add    $0x1,%eax
  10045f:	89 45 fc             	mov    %eax,-0x4(%ebp)
  100462:	eb 43                	jmp    1004a7 <stab_binsearch+0xf4>
        } else if (stabs[m].n_value > addr) {
  100464:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100467:	89 d0                	mov    %edx,%eax
  100469:	01 c0                	add    %eax,%eax
  10046b:	01 d0                	add    %edx,%eax
  10046d:	c1 e0 02             	shl    $0x2,%eax
  100470:	89 c2                	mov    %eax,%edx
  100472:	8b 45 08             	mov    0x8(%ebp),%eax
  100475:	01 d0                	add    %edx,%eax
  100477:	8b 40 08             	mov    0x8(%eax),%eax
  10047a:	3b 45 18             	cmp    0x18(%ebp),%eax
  10047d:	76 16                	jbe    100495 <stab_binsearch+0xe2>
            *region_right = m - 1;
  10047f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100482:	8d 50 ff             	lea    -0x1(%eax),%edx
  100485:	8b 45 10             	mov    0x10(%ebp),%eax
  100488:	89 10                	mov    %edx,(%eax)
            r = m - 1;
  10048a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10048d:	83 e8 01             	sub    $0x1,%eax
  100490:	89 45 f8             	mov    %eax,-0x8(%ebp)
  100493:	eb 12                	jmp    1004a7 <stab_binsearch+0xf4>
        } else {
            // exact match for 'addr', but continue loop to find
            // *region_right
            *region_left = m;
  100495:	8b 45 0c             	mov    0xc(%ebp),%eax
  100498:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10049b:	89 10                	mov    %edx,(%eax)
            l = m;
  10049d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1004a0:	89 45 fc             	mov    %eax,-0x4(%ebp)
            addr ++;
  1004a3:	83 45 18 01          	addl   $0x1,0x18(%ebp)
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
    int l = *region_left, r = *region_right, any_matches = 0;

    while (l <= r) {
  1004a7:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1004aa:	3b 45 f8             	cmp    -0x8(%ebp),%eax
  1004ad:	0f 8e 22 ff ff ff    	jle    1003d5 <stab_binsearch+0x22>
            l = m;
            addr ++;
        }
    }

    if (!any_matches) {
  1004b3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1004b7:	75 0f                	jne    1004c8 <stab_binsearch+0x115>
        *region_right = *region_left - 1;
  1004b9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004bc:	8b 00                	mov    (%eax),%eax
  1004be:	8d 50 ff             	lea    -0x1(%eax),%edx
  1004c1:	8b 45 10             	mov    0x10(%ebp),%eax
  1004c4:	89 10                	mov    %edx,(%eax)
  1004c6:	eb 3f                	jmp    100507 <stab_binsearch+0x154>
    }
    else {
        // find rightmost region containing 'addr'
        l = *region_right;
  1004c8:	8b 45 10             	mov    0x10(%ebp),%eax
  1004cb:	8b 00                	mov    (%eax),%eax
  1004cd:	89 45 fc             	mov    %eax,-0x4(%ebp)
        for (; l > *region_left && stabs[l].n_type != type; l --)
  1004d0:	eb 04                	jmp    1004d6 <stab_binsearch+0x123>
  1004d2:	83 6d fc 01          	subl   $0x1,-0x4(%ebp)
  1004d6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004d9:	8b 00                	mov    (%eax),%eax
  1004db:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  1004de:	7d 1f                	jge    1004ff <stab_binsearch+0x14c>
  1004e0:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1004e3:	89 d0                	mov    %edx,%eax
  1004e5:	01 c0                	add    %eax,%eax
  1004e7:	01 d0                	add    %edx,%eax
  1004e9:	c1 e0 02             	shl    $0x2,%eax
  1004ec:	89 c2                	mov    %eax,%edx
  1004ee:	8b 45 08             	mov    0x8(%ebp),%eax
  1004f1:	01 d0                	add    %edx,%eax
  1004f3:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1004f7:	0f b6 c0             	movzbl %al,%eax
  1004fa:	3b 45 14             	cmp    0x14(%ebp),%eax
  1004fd:	75 d3                	jne    1004d2 <stab_binsearch+0x11f>
            /* do nothing */;
        *region_left = l;
  1004ff:	8b 45 0c             	mov    0xc(%ebp),%eax
  100502:	8b 55 fc             	mov    -0x4(%ebp),%edx
  100505:	89 10                	mov    %edx,(%eax)
    }
}
  100507:	c9                   	leave  
  100508:	c3                   	ret    

00100509 <debuginfo_eip>:
 * the specified instruction address, @addr.  Returns 0 if information
 * was found, and negative if not.  But even if it returns negative it
 * has stored some information into '*info'.
 * */
int
debuginfo_eip(uintptr_t addr, struct eipdebuginfo *info) {
  100509:	55                   	push   %ebp
  10050a:	89 e5                	mov    %esp,%ebp
  10050c:	83 ec 58             	sub    $0x58,%esp
    const struct stab *stabs, *stab_end;
    const char *stabstr, *stabstr_end;

    info->eip_file = "<unknown>";
  10050f:	8b 45 0c             	mov    0xc(%ebp),%eax
  100512:	c7 00 2c 35 10 00    	movl   $0x10352c,(%eax)
    info->eip_line = 0;
  100518:	8b 45 0c             	mov    0xc(%ebp),%eax
  10051b:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    info->eip_fn_name = "<unknown>";
  100522:	8b 45 0c             	mov    0xc(%ebp),%eax
  100525:	c7 40 08 2c 35 10 00 	movl   $0x10352c,0x8(%eax)
    info->eip_fn_namelen = 9;
  10052c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10052f:	c7 40 0c 09 00 00 00 	movl   $0x9,0xc(%eax)
    info->eip_fn_addr = addr;
  100536:	8b 45 0c             	mov    0xc(%ebp),%eax
  100539:	8b 55 08             	mov    0x8(%ebp),%edx
  10053c:	89 50 10             	mov    %edx,0x10(%eax)
    info->eip_fn_narg = 0;
  10053f:	8b 45 0c             	mov    0xc(%ebp),%eax
  100542:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)

    stabs = __STAB_BEGIN__;
  100549:	c7 45 f4 8c 3d 10 00 	movl   $0x103d8c,-0xc(%ebp)
    stab_end = __STAB_END__;
  100550:	c7 45 f0 90 b4 10 00 	movl   $0x10b490,-0x10(%ebp)
    stabstr = __STABSTR_BEGIN__;
  100557:	c7 45 ec 91 b4 10 00 	movl   $0x10b491,-0x14(%ebp)
    stabstr_end = __STABSTR_END__;
  10055e:	c7 45 e8 8e d4 10 00 	movl   $0x10d48e,-0x18(%ebp)

    // String table validity checks
    if (stabstr_end <= stabstr || stabstr_end[-1] != 0) {
  100565:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100568:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  10056b:	76 0d                	jbe    10057a <debuginfo_eip+0x71>
  10056d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100570:	83 e8 01             	sub    $0x1,%eax
  100573:	0f b6 00             	movzbl (%eax),%eax
  100576:	84 c0                	test   %al,%al
  100578:	74 0a                	je     100584 <debuginfo_eip+0x7b>
        return -1;
  10057a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10057f:	e9 c0 02 00 00       	jmp    100844 <debuginfo_eip+0x33b>
    // 'eip'.  First, we find the basic source file containing 'eip'.
    // Then, we look in that source file for the function.  Then we look
    // for the line number.

    // Search the entire set of stabs for the source file (type N_SO).
    int lfile = 0, rfile = (stab_end - stabs) - 1;
  100584:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  10058b:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10058e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100591:	29 c2                	sub    %eax,%edx
  100593:	89 d0                	mov    %edx,%eax
  100595:	c1 f8 02             	sar    $0x2,%eax
  100598:	69 c0 ab aa aa aa    	imul   $0xaaaaaaab,%eax,%eax
  10059e:	83 e8 01             	sub    $0x1,%eax
  1005a1:	89 45 e0             	mov    %eax,-0x20(%ebp)
    stab_binsearch(stabs, &lfile, &rfile, N_SO, addr);
  1005a4:	8b 45 08             	mov    0x8(%ebp),%eax
  1005a7:	89 44 24 10          	mov    %eax,0x10(%esp)
  1005ab:	c7 44 24 0c 64 00 00 	movl   $0x64,0xc(%esp)
  1005b2:	00 
  1005b3:	8d 45 e0             	lea    -0x20(%ebp),%eax
  1005b6:	89 44 24 08          	mov    %eax,0x8(%esp)
  1005ba:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  1005bd:	89 44 24 04          	mov    %eax,0x4(%esp)
  1005c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1005c4:	89 04 24             	mov    %eax,(%esp)
  1005c7:	e8 e7 fd ff ff       	call   1003b3 <stab_binsearch>
    if (lfile == 0)
  1005cc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1005cf:	85 c0                	test   %eax,%eax
  1005d1:	75 0a                	jne    1005dd <debuginfo_eip+0xd4>
        return -1;
  1005d3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1005d8:	e9 67 02 00 00       	jmp    100844 <debuginfo_eip+0x33b>

    // Search within that file's stabs for the function definition
    // (N_FUN).
    int lfun = lfile, rfun = rfile;
  1005dd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1005e0:	89 45 dc             	mov    %eax,-0x24(%ebp)
  1005e3:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1005e6:	89 45 d8             	mov    %eax,-0x28(%ebp)
    int lline, rline;
    stab_binsearch(stabs, &lfun, &rfun, N_FUN, addr);
  1005e9:	8b 45 08             	mov    0x8(%ebp),%eax
  1005ec:	89 44 24 10          	mov    %eax,0x10(%esp)
  1005f0:	c7 44 24 0c 24 00 00 	movl   $0x24,0xc(%esp)
  1005f7:	00 
  1005f8:	8d 45 d8             	lea    -0x28(%ebp),%eax
  1005fb:	89 44 24 08          	mov    %eax,0x8(%esp)
  1005ff:	8d 45 dc             	lea    -0x24(%ebp),%eax
  100602:	89 44 24 04          	mov    %eax,0x4(%esp)
  100606:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100609:	89 04 24             	mov    %eax,(%esp)
  10060c:	e8 a2 fd ff ff       	call   1003b3 <stab_binsearch>

    if (lfun <= rfun) {
  100611:	8b 55 dc             	mov    -0x24(%ebp),%edx
  100614:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100617:	39 c2                	cmp    %eax,%edx
  100619:	7f 7c                	jg     100697 <debuginfo_eip+0x18e>
        // stabs[lfun] points to the function name
        // in the string table, but check bounds just in case.
        if (stabs[lfun].n_strx < stabstr_end - stabstr) {
  10061b:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10061e:	89 c2                	mov    %eax,%edx
  100620:	89 d0                	mov    %edx,%eax
  100622:	01 c0                	add    %eax,%eax
  100624:	01 d0                	add    %edx,%eax
  100626:	c1 e0 02             	shl    $0x2,%eax
  100629:	89 c2                	mov    %eax,%edx
  10062b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10062e:	01 d0                	add    %edx,%eax
  100630:	8b 10                	mov    (%eax),%edx
  100632:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  100635:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100638:	29 c1                	sub    %eax,%ecx
  10063a:	89 c8                	mov    %ecx,%eax
  10063c:	39 c2                	cmp    %eax,%edx
  10063e:	73 22                	jae    100662 <debuginfo_eip+0x159>
            info->eip_fn_name = stabstr + stabs[lfun].n_strx;
  100640:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100643:	89 c2                	mov    %eax,%edx
  100645:	89 d0                	mov    %edx,%eax
  100647:	01 c0                	add    %eax,%eax
  100649:	01 d0                	add    %edx,%eax
  10064b:	c1 e0 02             	shl    $0x2,%eax
  10064e:	89 c2                	mov    %eax,%edx
  100650:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100653:	01 d0                	add    %edx,%eax
  100655:	8b 10                	mov    (%eax),%edx
  100657:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10065a:	01 c2                	add    %eax,%edx
  10065c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10065f:	89 50 08             	mov    %edx,0x8(%eax)
        }
        info->eip_fn_addr = stabs[lfun].n_value;
  100662:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100665:	89 c2                	mov    %eax,%edx
  100667:	89 d0                	mov    %edx,%eax
  100669:	01 c0                	add    %eax,%eax
  10066b:	01 d0                	add    %edx,%eax
  10066d:	c1 e0 02             	shl    $0x2,%eax
  100670:	89 c2                	mov    %eax,%edx
  100672:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100675:	01 d0                	add    %edx,%eax
  100677:	8b 50 08             	mov    0x8(%eax),%edx
  10067a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10067d:	89 50 10             	mov    %edx,0x10(%eax)
        addr -= info->eip_fn_addr;
  100680:	8b 45 0c             	mov    0xc(%ebp),%eax
  100683:	8b 40 10             	mov    0x10(%eax),%eax
  100686:	29 45 08             	sub    %eax,0x8(%ebp)
        // Search within the function definition for the line number.
        lline = lfun;
  100689:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10068c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfun;
  10068f:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100692:	89 45 d0             	mov    %eax,-0x30(%ebp)
  100695:	eb 15                	jmp    1006ac <debuginfo_eip+0x1a3>
    } else {
        // Couldn't find function stab!  Maybe we're in an assembly
        // file.  Search the whole file for the line number.
        info->eip_fn_addr = addr;
  100697:	8b 45 0c             	mov    0xc(%ebp),%eax
  10069a:	8b 55 08             	mov    0x8(%ebp),%edx
  10069d:	89 50 10             	mov    %edx,0x10(%eax)
        lline = lfile;
  1006a0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1006a3:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfile;
  1006a6:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1006a9:	89 45 d0             	mov    %eax,-0x30(%ebp)
    }
    info->eip_fn_namelen = strfind(info->eip_fn_name, ':') - info->eip_fn_name;
  1006ac:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006af:	8b 40 08             	mov    0x8(%eax),%eax
  1006b2:	c7 44 24 04 3a 00 00 	movl   $0x3a,0x4(%esp)
  1006b9:	00 
  1006ba:	89 04 24             	mov    %eax,(%esp)
  1006bd:	e8 a0 2a 00 00       	call   103162 <strfind>
  1006c2:	89 c2                	mov    %eax,%edx
  1006c4:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006c7:	8b 40 08             	mov    0x8(%eax),%eax
  1006ca:	29 c2                	sub    %eax,%edx
  1006cc:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006cf:	89 50 0c             	mov    %edx,0xc(%eax)

    // Search within [lline, rline] for the line number stab.
    // If found, set info->eip_line to the right line number.
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
  1006d2:	8b 45 08             	mov    0x8(%ebp),%eax
  1006d5:	89 44 24 10          	mov    %eax,0x10(%esp)
  1006d9:	c7 44 24 0c 44 00 00 	movl   $0x44,0xc(%esp)
  1006e0:	00 
  1006e1:	8d 45 d0             	lea    -0x30(%ebp),%eax
  1006e4:	89 44 24 08          	mov    %eax,0x8(%esp)
  1006e8:	8d 45 d4             	lea    -0x2c(%ebp),%eax
  1006eb:	89 44 24 04          	mov    %eax,0x4(%esp)
  1006ef:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1006f2:	89 04 24             	mov    %eax,(%esp)
  1006f5:	e8 b9 fc ff ff       	call   1003b3 <stab_binsearch>
    if (lline <= rline) {
  1006fa:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1006fd:	8b 45 d0             	mov    -0x30(%ebp),%eax
  100700:	39 c2                	cmp    %eax,%edx
  100702:	7f 24                	jg     100728 <debuginfo_eip+0x21f>
        info->eip_line = stabs[rline].n_desc;
  100704:	8b 45 d0             	mov    -0x30(%ebp),%eax
  100707:	89 c2                	mov    %eax,%edx
  100709:	89 d0                	mov    %edx,%eax
  10070b:	01 c0                	add    %eax,%eax
  10070d:	01 d0                	add    %edx,%eax
  10070f:	c1 e0 02             	shl    $0x2,%eax
  100712:	89 c2                	mov    %eax,%edx
  100714:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100717:	01 d0                	add    %edx,%eax
  100719:	0f b7 40 06          	movzwl 0x6(%eax),%eax
  10071d:	0f b7 d0             	movzwl %ax,%edx
  100720:	8b 45 0c             	mov    0xc(%ebp),%eax
  100723:	89 50 04             	mov    %edx,0x4(%eax)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  100726:	eb 13                	jmp    10073b <debuginfo_eip+0x232>
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
    if (lline <= rline) {
        info->eip_line = stabs[rline].n_desc;
    } else {
        return -1;
  100728:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10072d:	e9 12 01 00 00       	jmp    100844 <debuginfo_eip+0x33b>
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
           && stabs[lline].n_type != N_SOL
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
        lline --;
  100732:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100735:	83 e8 01             	sub    $0x1,%eax
  100738:	89 45 d4             	mov    %eax,-0x2c(%ebp)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  10073b:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10073e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100741:	39 c2                	cmp    %eax,%edx
  100743:	7c 56                	jl     10079b <debuginfo_eip+0x292>
           && stabs[lline].n_type != N_SOL
  100745:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100748:	89 c2                	mov    %eax,%edx
  10074a:	89 d0                	mov    %edx,%eax
  10074c:	01 c0                	add    %eax,%eax
  10074e:	01 d0                	add    %edx,%eax
  100750:	c1 e0 02             	shl    $0x2,%eax
  100753:	89 c2                	mov    %eax,%edx
  100755:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100758:	01 d0                	add    %edx,%eax
  10075a:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10075e:	3c 84                	cmp    $0x84,%al
  100760:	74 39                	je     10079b <debuginfo_eip+0x292>
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
  100762:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100765:	89 c2                	mov    %eax,%edx
  100767:	89 d0                	mov    %edx,%eax
  100769:	01 c0                	add    %eax,%eax
  10076b:	01 d0                	add    %edx,%eax
  10076d:	c1 e0 02             	shl    $0x2,%eax
  100770:	89 c2                	mov    %eax,%edx
  100772:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100775:	01 d0                	add    %edx,%eax
  100777:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10077b:	3c 64                	cmp    $0x64,%al
  10077d:	75 b3                	jne    100732 <debuginfo_eip+0x229>
  10077f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100782:	89 c2                	mov    %eax,%edx
  100784:	89 d0                	mov    %edx,%eax
  100786:	01 c0                	add    %eax,%eax
  100788:	01 d0                	add    %edx,%eax
  10078a:	c1 e0 02             	shl    $0x2,%eax
  10078d:	89 c2                	mov    %eax,%edx
  10078f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100792:	01 d0                	add    %edx,%eax
  100794:	8b 40 08             	mov    0x8(%eax),%eax
  100797:	85 c0                	test   %eax,%eax
  100799:	74 97                	je     100732 <debuginfo_eip+0x229>
        lline --;
    }
    if (lline >= lfile && stabs[lline].n_strx < stabstr_end - stabstr) {
  10079b:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10079e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1007a1:	39 c2                	cmp    %eax,%edx
  1007a3:	7c 46                	jl     1007eb <debuginfo_eip+0x2e2>
  1007a5:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1007a8:	89 c2                	mov    %eax,%edx
  1007aa:	89 d0                	mov    %edx,%eax
  1007ac:	01 c0                	add    %eax,%eax
  1007ae:	01 d0                	add    %edx,%eax
  1007b0:	c1 e0 02             	shl    $0x2,%eax
  1007b3:	89 c2                	mov    %eax,%edx
  1007b5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007b8:	01 d0                	add    %edx,%eax
  1007ba:	8b 10                	mov    (%eax),%edx
  1007bc:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  1007bf:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1007c2:	29 c1                	sub    %eax,%ecx
  1007c4:	89 c8                	mov    %ecx,%eax
  1007c6:	39 c2                	cmp    %eax,%edx
  1007c8:	73 21                	jae    1007eb <debuginfo_eip+0x2e2>
        info->eip_file = stabstr + stabs[lline].n_strx;
  1007ca:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1007cd:	89 c2                	mov    %eax,%edx
  1007cf:	89 d0                	mov    %edx,%eax
  1007d1:	01 c0                	add    %eax,%eax
  1007d3:	01 d0                	add    %edx,%eax
  1007d5:	c1 e0 02             	shl    $0x2,%eax
  1007d8:	89 c2                	mov    %eax,%edx
  1007da:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007dd:	01 d0                	add    %edx,%eax
  1007df:	8b 10                	mov    (%eax),%edx
  1007e1:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1007e4:	01 c2                	add    %eax,%edx
  1007e6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007e9:	89 10                	mov    %edx,(%eax)
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
  1007eb:	8b 55 dc             	mov    -0x24(%ebp),%edx
  1007ee:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1007f1:	39 c2                	cmp    %eax,%edx
  1007f3:	7d 4a                	jge    10083f <debuginfo_eip+0x336>
        for (lline = lfun + 1;
  1007f5:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1007f8:	83 c0 01             	add    $0x1,%eax
  1007fb:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  1007fe:	eb 18                	jmp    100818 <debuginfo_eip+0x30f>
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
            info->eip_fn_narg ++;
  100800:	8b 45 0c             	mov    0xc(%ebp),%eax
  100803:	8b 40 14             	mov    0x14(%eax),%eax
  100806:	8d 50 01             	lea    0x1(%eax),%edx
  100809:	8b 45 0c             	mov    0xc(%ebp),%eax
  10080c:	89 50 14             	mov    %edx,0x14(%eax)
    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
        for (lline = lfun + 1;
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
  10080f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100812:	83 c0 01             	add    $0x1,%eax
  100815:	89 45 d4             	mov    %eax,-0x2c(%ebp)

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
        for (lline = lfun + 1;
             lline < rfun && stabs[lline].n_type == N_PSYM;
  100818:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10081b:	8b 45 d8             	mov    -0x28(%ebp),%eax
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
        for (lline = lfun + 1;
  10081e:	39 c2                	cmp    %eax,%edx
  100820:	7d 1d                	jge    10083f <debuginfo_eip+0x336>
             lline < rfun && stabs[lline].n_type == N_PSYM;
  100822:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100825:	89 c2                	mov    %eax,%edx
  100827:	89 d0                	mov    %edx,%eax
  100829:	01 c0                	add    %eax,%eax
  10082b:	01 d0                	add    %edx,%eax
  10082d:	c1 e0 02             	shl    $0x2,%eax
  100830:	89 c2                	mov    %eax,%edx
  100832:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100835:	01 d0                	add    %edx,%eax
  100837:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10083b:	3c a0                	cmp    $0xa0,%al
  10083d:	74 c1                	je     100800 <debuginfo_eip+0x2f7>
             lline ++) {
            info->eip_fn_narg ++;
        }
    }
    return 0;
  10083f:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100844:	c9                   	leave  
  100845:	c3                   	ret    

00100846 <print_kerninfo>:
 * print_kerninfo - print the information about kernel, including the location
 * of kernel entry, the start addresses of data and text segements, the start
 * address of free memory and how many memory that kernel has used.
 * */
void
print_kerninfo(void) {
  100846:	55                   	push   %ebp
  100847:	89 e5                	mov    %esp,%ebp
  100849:	83 ec 18             	sub    $0x18,%esp
    extern char etext[], edata[], end[], kern_init[];
    cprintf("Special kernel symbols:\n");
  10084c:	c7 04 24 36 35 10 00 	movl   $0x103536,(%esp)
  100853:	e8 ba fa ff ff       	call   100312 <cprintf>
    cprintf("  entry  0x%08x (phys)\n", kern_init);
  100858:	c7 44 24 04 00 00 10 	movl   $0x100000,0x4(%esp)
  10085f:	00 
  100860:	c7 04 24 4f 35 10 00 	movl   $0x10354f,(%esp)
  100867:	e8 a6 fa ff ff       	call   100312 <cprintf>
    cprintf("  etext  0x%08x (phys)\n", etext);
  10086c:	c7 44 24 04 77 34 10 	movl   $0x103477,0x4(%esp)
  100873:	00 
  100874:	c7 04 24 67 35 10 00 	movl   $0x103567,(%esp)
  10087b:	e8 92 fa ff ff       	call   100312 <cprintf>
    cprintf("  edata  0x%08x (phys)\n", edata);
  100880:	c7 44 24 04 16 ea 10 	movl   $0x10ea16,0x4(%esp)
  100887:	00 
  100888:	c7 04 24 7f 35 10 00 	movl   $0x10357f,(%esp)
  10088f:	e8 7e fa ff ff       	call   100312 <cprintf>
    cprintf("  end    0x%08x (phys)\n", end);
  100894:	c7 44 24 04 40 fd 10 	movl   $0x10fd40,0x4(%esp)
  10089b:	00 
  10089c:	c7 04 24 97 35 10 00 	movl   $0x103597,(%esp)
  1008a3:	e8 6a fa ff ff       	call   100312 <cprintf>
    cprintf("Kernel executable memory footprint: %dKB\n", (end - kern_init + 1023)/1024);
  1008a8:	b8 40 fd 10 00       	mov    $0x10fd40,%eax
  1008ad:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  1008b3:	b8 00 00 10 00       	mov    $0x100000,%eax
  1008b8:	29 c2                	sub    %eax,%edx
  1008ba:	89 d0                	mov    %edx,%eax
  1008bc:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  1008c2:	85 c0                	test   %eax,%eax
  1008c4:	0f 48 c2             	cmovs  %edx,%eax
  1008c7:	c1 f8 0a             	sar    $0xa,%eax
  1008ca:	89 44 24 04          	mov    %eax,0x4(%esp)
  1008ce:	c7 04 24 b0 35 10 00 	movl   $0x1035b0,(%esp)
  1008d5:	e8 38 fa ff ff       	call   100312 <cprintf>
}
  1008da:	c9                   	leave  
  1008db:	c3                   	ret    

001008dc <print_debuginfo>:
/* *
 * print_debuginfo - read and print the stat information for the address @eip,
 * and info.eip_fn_addr should be the first address of the related function.
 * */
void
print_debuginfo(uintptr_t eip) {
  1008dc:	55                   	push   %ebp
  1008dd:	89 e5                	mov    %esp,%ebp
  1008df:	81 ec 48 01 00 00    	sub    $0x148,%esp
    struct eipdebuginfo info;
    if (debuginfo_eip(eip, &info) != 0) {
  1008e5:	8d 45 dc             	lea    -0x24(%ebp),%eax
  1008e8:	89 44 24 04          	mov    %eax,0x4(%esp)
  1008ec:	8b 45 08             	mov    0x8(%ebp),%eax
  1008ef:	89 04 24             	mov    %eax,(%esp)
  1008f2:	e8 12 fc ff ff       	call   100509 <debuginfo_eip>
  1008f7:	85 c0                	test   %eax,%eax
  1008f9:	74 15                	je     100910 <print_debuginfo+0x34>
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
  1008fb:	8b 45 08             	mov    0x8(%ebp),%eax
  1008fe:	89 44 24 04          	mov    %eax,0x4(%esp)
  100902:	c7 04 24 da 35 10 00 	movl   $0x1035da,(%esp)
  100909:	e8 04 fa ff ff       	call   100312 <cprintf>
  10090e:	eb 6d                	jmp    10097d <print_debuginfo+0xa1>
    }
    else {
        char fnname[256];
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  100910:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100917:	eb 1c                	jmp    100935 <print_debuginfo+0x59>
            fnname[j] = info.eip_fn_name[j];
  100919:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  10091c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10091f:	01 d0                	add    %edx,%eax
  100921:	0f b6 00             	movzbl (%eax),%eax
  100924:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  10092a:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10092d:	01 ca                	add    %ecx,%edx
  10092f:	88 02                	mov    %al,(%edx)
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
    }
    else {
        char fnname[256];
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  100931:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100935:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100938:	3b 45 f4             	cmp    -0xc(%ebp),%eax
  10093b:	7f dc                	jg     100919 <print_debuginfo+0x3d>
            fnname[j] = info.eip_fn_name[j];
        }
        fnname[j] = '\0';
  10093d:	8d 95 dc fe ff ff    	lea    -0x124(%ebp),%edx
  100943:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100946:	01 d0                	add    %edx,%eax
  100948:	c6 00 00             	movb   $0x0,(%eax)
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
                fnname, eip - info.eip_fn_addr);
  10094b:	8b 45 ec             	mov    -0x14(%ebp),%eax
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
            fnname[j] = info.eip_fn_name[j];
        }
        fnname[j] = '\0';
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
  10094e:	8b 55 08             	mov    0x8(%ebp),%edx
  100951:	89 d1                	mov    %edx,%ecx
  100953:	29 c1                	sub    %eax,%ecx
  100955:	8b 55 e0             	mov    -0x20(%ebp),%edx
  100958:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10095b:	89 4c 24 10          	mov    %ecx,0x10(%esp)
  10095f:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  100965:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  100969:	89 54 24 08          	mov    %edx,0x8(%esp)
  10096d:	89 44 24 04          	mov    %eax,0x4(%esp)
  100971:	c7 04 24 f6 35 10 00 	movl   $0x1035f6,(%esp)
  100978:	e8 95 f9 ff ff       	call   100312 <cprintf>
                fnname, eip - info.eip_fn_addr);
    }
}
  10097d:	c9                   	leave  
  10097e:	c3                   	ret    

0010097f <read_eip>:

static __noinline uint32_t
read_eip(void) {
  10097f:	55                   	push   %ebp
  100980:	89 e5                	mov    %esp,%ebp
  100982:	83 ec 10             	sub    $0x10,%esp
    uint32_t eip;
    asm volatile("movl 4(%%ebp), %0" : "=r" (eip));
  100985:	8b 45 04             	mov    0x4(%ebp),%eax
  100988:	89 45 fc             	mov    %eax,-0x4(%ebp)
    return eip;
  10098b:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  10098e:	c9                   	leave  
  10098f:	c3                   	ret    

00100990 <print_stackframe>:
 *
 * Note that, the length of ebp-chain is limited. In boot/bootasm.S, before jumping
 * to the kernel entry, the value of ebp has been set to zero, that's the boundary.
 * */
void
print_stackframe(void) {
  100990:	55                   	push   %ebp
  100991:	89 e5                	mov    %esp,%ebp
  100993:	53                   	push   %ebx
  100994:	83 ec 44             	sub    $0x44,%esp
}

static inline uint32_t
read_ebp(void) {
    uint32_t ebp;
    asm volatile ("movl %%ebp, %0" : "=r" (ebp));
  100997:	89 e8                	mov    %ebp,%eax
  100999:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    return ebp;
  10099c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
      *    (3.5) popup a calling stackframe
      *           NOTICE: the calling funciton's return addr eip  = ss:[ebp+4]
      *                   the calling funciton's ebp = ss:[ebp]
      */
    
      uint32_t ebp = read_ebp();
  10099f:	89 45 f4             	mov    %eax,-0xc(%ebp)
      uint32_t eip = read_eip();
  1009a2:	e8 d8 ff ff ff       	call   10097f <read_eip>
  1009a7:	89 45 f0             	mov    %eax,-0x10(%ebp)
      int i;
      for (i = 0; i < STACKFRAME_DEPTH; i++)
  1009aa:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  1009b1:	e9 8c 00 00 00       	jmp    100a42 <print_stackframe+0xb2>
      {
            if (ebp == 0) break;
  1009b6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1009ba:	75 05                	jne    1009c1 <print_stackframe+0x31>
  1009bc:	e9 8b 00 00 00       	jmp    100a4c <print_stackframe+0xbc>
            cprintf("ebp:0x%08x eip:0x%08x ", ebp, eip);
  1009c1:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1009c4:	89 44 24 08          	mov    %eax,0x8(%esp)
  1009c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009cb:	89 44 24 04          	mov    %eax,0x4(%esp)
  1009cf:	c7 04 24 08 36 10 00 	movl   $0x103608,(%esp)
  1009d6:	e8 37 f9 ff ff       	call   100312 <cprintf>
            uint32_t* args = ((uint32_t*)ebp) + 2;
  1009db:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009de:	83 c0 08             	add    $0x8,%eax
  1009e1:	89 45 e8             	mov    %eax,-0x18(%ebp)
            cprintf("args:0x%08x 0x%08x 0x%08x 0x%08x\n", args[0], args[1], args[2], args[3]);
  1009e4:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1009e7:	83 c0 0c             	add    $0xc,%eax
  1009ea:	8b 18                	mov    (%eax),%ebx
  1009ec:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1009ef:	83 c0 08             	add    $0x8,%eax
  1009f2:	8b 08                	mov    (%eax),%ecx
  1009f4:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1009f7:	83 c0 04             	add    $0x4,%eax
  1009fa:	8b 10                	mov    (%eax),%edx
  1009fc:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1009ff:	8b 00                	mov    (%eax),%eax
  100a01:	89 5c 24 10          	mov    %ebx,0x10(%esp)
  100a05:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  100a09:	89 54 24 08          	mov    %edx,0x8(%esp)
  100a0d:	89 44 24 04          	mov    %eax,0x4(%esp)
  100a11:	c7 04 24 20 36 10 00 	movl   $0x103620,(%esp)
  100a18:	e8 f5 f8 ff ff       	call   100312 <cprintf>
            print_debuginfo(eip-1);
  100a1d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100a20:	83 e8 01             	sub    $0x1,%eax
  100a23:	89 04 24             	mov    %eax,(%esp)
  100a26:	e8 b1 fe ff ff       	call   1008dc <print_debuginfo>
            eip = *(uint32_t*)(ebp + 4);
  100a2b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a2e:	83 c0 04             	add    $0x4,%eax
  100a31:	8b 00                	mov    (%eax),%eax
  100a33:	89 45 f0             	mov    %eax,-0x10(%ebp)
            ebp = *(uint32_t*)ebp;
  100a36:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a39:	8b 00                	mov    (%eax),%eax
  100a3b:	89 45 f4             	mov    %eax,-0xc(%ebp)
      */
    
      uint32_t ebp = read_ebp();
      uint32_t eip = read_eip();
      int i;
      for (i = 0; i < STACKFRAME_DEPTH; i++)
  100a3e:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  100a42:	83 7d ec 13          	cmpl   $0x13,-0x14(%ebp)
  100a46:	0f 8e 6a ff ff ff    	jle    1009b6 <print_stackframe+0x26>
            cprintf("args:0x%08x 0x%08x 0x%08x 0x%08x\n", args[0], args[1], args[2], args[3]);
            print_debuginfo(eip-1);
            eip = *(uint32_t*)(ebp + 4);
            ebp = *(uint32_t*)ebp;
      }
}
  100a4c:	83 c4 44             	add    $0x44,%esp
  100a4f:	5b                   	pop    %ebx
  100a50:	5d                   	pop    %ebp
  100a51:	c3                   	ret    

00100a52 <parse>:
#define MAXARGS         16
#define WHITESPACE      " \t\n\r"

/* parse - parse the command buffer into whitespace-separated arguments */
static int
parse(char *buf, char **argv) {
  100a52:	55                   	push   %ebp
  100a53:	89 e5                	mov    %esp,%ebp
  100a55:	83 ec 28             	sub    $0x28,%esp
    int argc = 0;
  100a58:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100a5f:	eb 0c                	jmp    100a6d <parse+0x1b>
            *buf ++ = '\0';
  100a61:	8b 45 08             	mov    0x8(%ebp),%eax
  100a64:	8d 50 01             	lea    0x1(%eax),%edx
  100a67:	89 55 08             	mov    %edx,0x8(%ebp)
  100a6a:	c6 00 00             	movb   $0x0,(%eax)
static int
parse(char *buf, char **argv) {
    int argc = 0;
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100a6d:	8b 45 08             	mov    0x8(%ebp),%eax
  100a70:	0f b6 00             	movzbl (%eax),%eax
  100a73:	84 c0                	test   %al,%al
  100a75:	74 1d                	je     100a94 <parse+0x42>
  100a77:	8b 45 08             	mov    0x8(%ebp),%eax
  100a7a:	0f b6 00             	movzbl (%eax),%eax
  100a7d:	0f be c0             	movsbl %al,%eax
  100a80:	89 44 24 04          	mov    %eax,0x4(%esp)
  100a84:	c7 04 24 c4 36 10 00 	movl   $0x1036c4,(%esp)
  100a8b:	e8 9f 26 00 00       	call   10312f <strchr>
  100a90:	85 c0                	test   %eax,%eax
  100a92:	75 cd                	jne    100a61 <parse+0xf>
            *buf ++ = '\0';
        }
        if (*buf == '\0') {
  100a94:	8b 45 08             	mov    0x8(%ebp),%eax
  100a97:	0f b6 00             	movzbl (%eax),%eax
  100a9a:	84 c0                	test   %al,%al
  100a9c:	75 02                	jne    100aa0 <parse+0x4e>
            break;
  100a9e:	eb 67                	jmp    100b07 <parse+0xb5>
        }

        // save and scan past next arg
        if (argc == MAXARGS - 1) {
  100aa0:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
  100aa4:	75 14                	jne    100aba <parse+0x68>
            cprintf("Too many arguments (max %d).\n", MAXARGS);
  100aa6:	c7 44 24 04 10 00 00 	movl   $0x10,0x4(%esp)
  100aad:	00 
  100aae:	c7 04 24 c9 36 10 00 	movl   $0x1036c9,(%esp)
  100ab5:	e8 58 f8 ff ff       	call   100312 <cprintf>
        }
        argv[argc ++] = buf;
  100aba:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100abd:	8d 50 01             	lea    0x1(%eax),%edx
  100ac0:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100ac3:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100aca:	8b 45 0c             	mov    0xc(%ebp),%eax
  100acd:	01 c2                	add    %eax,%edx
  100acf:	8b 45 08             	mov    0x8(%ebp),%eax
  100ad2:	89 02                	mov    %eax,(%edx)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100ad4:	eb 04                	jmp    100ada <parse+0x88>
            buf ++;
  100ad6:	83 45 08 01          	addl   $0x1,0x8(%ebp)
        // save and scan past next arg
        if (argc == MAXARGS - 1) {
            cprintf("Too many arguments (max %d).\n", MAXARGS);
        }
        argv[argc ++] = buf;
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100ada:	8b 45 08             	mov    0x8(%ebp),%eax
  100add:	0f b6 00             	movzbl (%eax),%eax
  100ae0:	84 c0                	test   %al,%al
  100ae2:	74 1d                	je     100b01 <parse+0xaf>
  100ae4:	8b 45 08             	mov    0x8(%ebp),%eax
  100ae7:	0f b6 00             	movzbl (%eax),%eax
  100aea:	0f be c0             	movsbl %al,%eax
  100aed:	89 44 24 04          	mov    %eax,0x4(%esp)
  100af1:	c7 04 24 c4 36 10 00 	movl   $0x1036c4,(%esp)
  100af8:	e8 32 26 00 00       	call   10312f <strchr>
  100afd:	85 c0                	test   %eax,%eax
  100aff:	74 d5                	je     100ad6 <parse+0x84>
            buf ++;
        }
    }
  100b01:	90                   	nop
static int
parse(char *buf, char **argv) {
    int argc = 0;
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100b02:	e9 66 ff ff ff       	jmp    100a6d <parse+0x1b>
        argv[argc ++] = buf;
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
            buf ++;
        }
    }
    return argc;
  100b07:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100b0a:	c9                   	leave  
  100b0b:	c3                   	ret    

00100b0c <runcmd>:
/* *
 * runcmd - parse the input string, split it into separated arguments
 * and then lookup and invoke some related commands/
 * */
static int
runcmd(char *buf, struct trapframe *tf) {
  100b0c:	55                   	push   %ebp
  100b0d:	89 e5                	mov    %esp,%ebp
  100b0f:	83 ec 68             	sub    $0x68,%esp
    char *argv[MAXARGS];
    int argc = parse(buf, argv);
  100b12:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100b15:	89 44 24 04          	mov    %eax,0x4(%esp)
  100b19:	8b 45 08             	mov    0x8(%ebp),%eax
  100b1c:	89 04 24             	mov    %eax,(%esp)
  100b1f:	e8 2e ff ff ff       	call   100a52 <parse>
  100b24:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if (argc == 0) {
  100b27:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100b2b:	75 0a                	jne    100b37 <runcmd+0x2b>
        return 0;
  100b2d:	b8 00 00 00 00       	mov    $0x0,%eax
  100b32:	e9 85 00 00 00       	jmp    100bbc <runcmd+0xb0>
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100b37:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100b3e:	eb 5c                	jmp    100b9c <runcmd+0x90>
        if (strcmp(commands[i].name, argv[0]) == 0) {
  100b40:	8b 4d b0             	mov    -0x50(%ebp),%ecx
  100b43:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100b46:	89 d0                	mov    %edx,%eax
  100b48:	01 c0                	add    %eax,%eax
  100b4a:	01 d0                	add    %edx,%eax
  100b4c:	c1 e0 02             	shl    $0x2,%eax
  100b4f:	05 00 e0 10 00       	add    $0x10e000,%eax
  100b54:	8b 00                	mov    (%eax),%eax
  100b56:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  100b5a:	89 04 24             	mov    %eax,(%esp)
  100b5d:	e8 2e 25 00 00       	call   103090 <strcmp>
  100b62:	85 c0                	test   %eax,%eax
  100b64:	75 32                	jne    100b98 <runcmd+0x8c>
            return commands[i].func(argc - 1, argv + 1, tf);
  100b66:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100b69:	89 d0                	mov    %edx,%eax
  100b6b:	01 c0                	add    %eax,%eax
  100b6d:	01 d0                	add    %edx,%eax
  100b6f:	c1 e0 02             	shl    $0x2,%eax
  100b72:	05 00 e0 10 00       	add    $0x10e000,%eax
  100b77:	8b 40 08             	mov    0x8(%eax),%eax
  100b7a:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100b7d:	8d 4a ff             	lea    -0x1(%edx),%ecx
  100b80:	8b 55 0c             	mov    0xc(%ebp),%edx
  100b83:	89 54 24 08          	mov    %edx,0x8(%esp)
  100b87:	8d 55 b0             	lea    -0x50(%ebp),%edx
  100b8a:	83 c2 04             	add    $0x4,%edx
  100b8d:	89 54 24 04          	mov    %edx,0x4(%esp)
  100b91:	89 0c 24             	mov    %ecx,(%esp)
  100b94:	ff d0                	call   *%eax
  100b96:	eb 24                	jmp    100bbc <runcmd+0xb0>
    int argc = parse(buf, argv);
    if (argc == 0) {
        return 0;
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100b98:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100b9c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b9f:	83 f8 02             	cmp    $0x2,%eax
  100ba2:	76 9c                	jbe    100b40 <runcmd+0x34>
        if (strcmp(commands[i].name, argv[0]) == 0) {
            return commands[i].func(argc - 1, argv + 1, tf);
        }
    }
    cprintf("Unknown command '%s'\n", argv[0]);
  100ba4:	8b 45 b0             	mov    -0x50(%ebp),%eax
  100ba7:	89 44 24 04          	mov    %eax,0x4(%esp)
  100bab:	c7 04 24 e7 36 10 00 	movl   $0x1036e7,(%esp)
  100bb2:	e8 5b f7 ff ff       	call   100312 <cprintf>
    return 0;
  100bb7:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100bbc:	c9                   	leave  
  100bbd:	c3                   	ret    

00100bbe <kmonitor>:

/***** Implementations of basic kernel monitor commands *****/

void
kmonitor(struct trapframe *tf) {
  100bbe:	55                   	push   %ebp
  100bbf:	89 e5                	mov    %esp,%ebp
  100bc1:	83 ec 28             	sub    $0x28,%esp
    cprintf("Welcome to the kernel debug monitor!!\n");
  100bc4:	c7 04 24 00 37 10 00 	movl   $0x103700,(%esp)
  100bcb:	e8 42 f7 ff ff       	call   100312 <cprintf>
    cprintf("Type 'help' for a list of commands.\n");
  100bd0:	c7 04 24 28 37 10 00 	movl   $0x103728,(%esp)
  100bd7:	e8 36 f7 ff ff       	call   100312 <cprintf>

    if (tf != NULL) {
  100bdc:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100be0:	74 0b                	je     100bed <kmonitor+0x2f>
        print_trapframe(tf);
  100be2:	8b 45 08             	mov    0x8(%ebp),%eax
  100be5:	89 04 24             	mov    %eax,(%esp)
  100be8:	e8 c9 0d 00 00       	call   1019b6 <print_trapframe>
    }

    char *buf;
    while (1) {
        if ((buf = readline("K> ")) != NULL) {
  100bed:	c7 04 24 4d 37 10 00 	movl   $0x10374d,(%esp)
  100bf4:	e8 10 f6 ff ff       	call   100209 <readline>
  100bf9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100bfc:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100c00:	74 18                	je     100c1a <kmonitor+0x5c>
            if (runcmd(buf, tf) < 0) {
  100c02:	8b 45 08             	mov    0x8(%ebp),%eax
  100c05:	89 44 24 04          	mov    %eax,0x4(%esp)
  100c09:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c0c:	89 04 24             	mov    %eax,(%esp)
  100c0f:	e8 f8 fe ff ff       	call   100b0c <runcmd>
  100c14:	85 c0                	test   %eax,%eax
  100c16:	79 02                	jns    100c1a <kmonitor+0x5c>
                break;
  100c18:	eb 02                	jmp    100c1c <kmonitor+0x5e>
            }
        }
    }
  100c1a:	eb d1                	jmp    100bed <kmonitor+0x2f>
}
  100c1c:	c9                   	leave  
  100c1d:	c3                   	ret    

00100c1e <mon_help>:

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
  100c1e:	55                   	push   %ebp
  100c1f:	89 e5                	mov    %esp,%ebp
  100c21:	83 ec 28             	sub    $0x28,%esp
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100c24:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100c2b:	eb 3f                	jmp    100c6c <mon_help+0x4e>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
  100c2d:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100c30:	89 d0                	mov    %edx,%eax
  100c32:	01 c0                	add    %eax,%eax
  100c34:	01 d0                	add    %edx,%eax
  100c36:	c1 e0 02             	shl    $0x2,%eax
  100c39:	05 00 e0 10 00       	add    $0x10e000,%eax
  100c3e:	8b 48 04             	mov    0x4(%eax),%ecx
  100c41:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100c44:	89 d0                	mov    %edx,%eax
  100c46:	01 c0                	add    %eax,%eax
  100c48:	01 d0                	add    %edx,%eax
  100c4a:	c1 e0 02             	shl    $0x2,%eax
  100c4d:	05 00 e0 10 00       	add    $0x10e000,%eax
  100c52:	8b 00                	mov    (%eax),%eax
  100c54:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  100c58:	89 44 24 04          	mov    %eax,0x4(%esp)
  100c5c:	c7 04 24 51 37 10 00 	movl   $0x103751,(%esp)
  100c63:	e8 aa f6 ff ff       	call   100312 <cprintf>

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100c68:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100c6c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c6f:	83 f8 02             	cmp    $0x2,%eax
  100c72:	76 b9                	jbe    100c2d <mon_help+0xf>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
    }
    return 0;
  100c74:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100c79:	c9                   	leave  
  100c7a:	c3                   	ret    

00100c7b <mon_kerninfo>:
/* *
 * mon_kerninfo - call print_kerninfo in kern/debug/kdebug.c to
 * print the memory occupancy in kernel.
 * */
int
mon_kerninfo(int argc, char **argv, struct trapframe *tf) {
  100c7b:	55                   	push   %ebp
  100c7c:	89 e5                	mov    %esp,%ebp
  100c7e:	83 ec 08             	sub    $0x8,%esp
    print_kerninfo();
  100c81:	e8 c0 fb ff ff       	call   100846 <print_kerninfo>
    return 0;
  100c86:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100c8b:	c9                   	leave  
  100c8c:	c3                   	ret    

00100c8d <mon_backtrace>:
/* *
 * mon_backtrace - call print_stackframe in kern/debug/kdebug.c to
 * print a backtrace of the stack.
 * */
int
mon_backtrace(int argc, char **argv, struct trapframe *tf) {
  100c8d:	55                   	push   %ebp
  100c8e:	89 e5                	mov    %esp,%ebp
  100c90:	83 ec 08             	sub    $0x8,%esp
    print_stackframe();
  100c93:	e8 f8 fc ff ff       	call   100990 <print_stackframe>
    return 0;
  100c98:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100c9d:	c9                   	leave  
  100c9e:	c3                   	ret    

00100c9f <__panic>:
/* *
 * __panic - __panic is called on unresolvable fatal errors. it prints
 * "panic: 'message'", and then enters the kernel monitor.
 * */
void
__panic(const char *file, int line, const char *fmt, ...) {
  100c9f:	55                   	push   %ebp
  100ca0:	89 e5                	mov    %esp,%ebp
  100ca2:	83 ec 28             	sub    $0x28,%esp
    if (is_panic) {
  100ca5:	a1 40 ee 10 00       	mov    0x10ee40,%eax
  100caa:	85 c0                	test   %eax,%eax
  100cac:	74 02                	je     100cb0 <__panic+0x11>
        goto panic_dead;
  100cae:	eb 48                	jmp    100cf8 <__panic+0x59>
    }
    is_panic = 1;
  100cb0:	c7 05 40 ee 10 00 01 	movl   $0x1,0x10ee40
  100cb7:	00 00 00 

    // print the 'message'
    va_list ap;
    va_start(ap, fmt);
  100cba:	8d 45 14             	lea    0x14(%ebp),%eax
  100cbd:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel panic at %s:%d:\n    ", file, line);
  100cc0:	8b 45 0c             	mov    0xc(%ebp),%eax
  100cc3:	89 44 24 08          	mov    %eax,0x8(%esp)
  100cc7:	8b 45 08             	mov    0x8(%ebp),%eax
  100cca:	89 44 24 04          	mov    %eax,0x4(%esp)
  100cce:	c7 04 24 5a 37 10 00 	movl   $0x10375a,(%esp)
  100cd5:	e8 38 f6 ff ff       	call   100312 <cprintf>
    vcprintf(fmt, ap);
  100cda:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100cdd:	89 44 24 04          	mov    %eax,0x4(%esp)
  100ce1:	8b 45 10             	mov    0x10(%ebp),%eax
  100ce4:	89 04 24             	mov    %eax,(%esp)
  100ce7:	e8 f3 f5 ff ff       	call   1002df <vcprintf>
    cprintf("\n");
  100cec:	c7 04 24 76 37 10 00 	movl   $0x103776,(%esp)
  100cf3:	e8 1a f6 ff ff       	call   100312 <cprintf>
    va_end(ap);

panic_dead:
    intr_disable();
  100cf8:	e8 22 09 00 00       	call   10161f <intr_disable>
    while (1) {
        kmonitor(NULL);
  100cfd:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100d04:	e8 b5 fe ff ff       	call   100bbe <kmonitor>
    }
  100d09:	eb f2                	jmp    100cfd <__panic+0x5e>

00100d0b <__warn>:
}

/* __warn - like panic, but don't */
void
__warn(const char *file, int line, const char *fmt, ...) {
  100d0b:	55                   	push   %ebp
  100d0c:	89 e5                	mov    %esp,%ebp
  100d0e:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    va_start(ap, fmt);
  100d11:	8d 45 14             	lea    0x14(%ebp),%eax
  100d14:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel warning at %s:%d:\n    ", file, line);
  100d17:	8b 45 0c             	mov    0xc(%ebp),%eax
  100d1a:	89 44 24 08          	mov    %eax,0x8(%esp)
  100d1e:	8b 45 08             	mov    0x8(%ebp),%eax
  100d21:	89 44 24 04          	mov    %eax,0x4(%esp)
  100d25:	c7 04 24 78 37 10 00 	movl   $0x103778,(%esp)
  100d2c:	e8 e1 f5 ff ff       	call   100312 <cprintf>
    vcprintf(fmt, ap);
  100d31:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d34:	89 44 24 04          	mov    %eax,0x4(%esp)
  100d38:	8b 45 10             	mov    0x10(%ebp),%eax
  100d3b:	89 04 24             	mov    %eax,(%esp)
  100d3e:	e8 9c f5 ff ff       	call   1002df <vcprintf>
    cprintf("\n");
  100d43:	c7 04 24 76 37 10 00 	movl   $0x103776,(%esp)
  100d4a:	e8 c3 f5 ff ff       	call   100312 <cprintf>
    va_end(ap);
}
  100d4f:	c9                   	leave  
  100d50:	c3                   	ret    

00100d51 <is_kernel_panic>:

bool
is_kernel_panic(void) {
  100d51:	55                   	push   %ebp
  100d52:	89 e5                	mov    %esp,%ebp
    return is_panic;
  100d54:	a1 40 ee 10 00       	mov    0x10ee40,%eax
}
  100d59:	5d                   	pop    %ebp
  100d5a:	c3                   	ret    

00100d5b <clock_init>:
/* *
 * clock_init - initialize 8253 clock to interrupt 100 times per second,
 * and then enable IRQ_TIMER.
 * */
void
clock_init(void) {
  100d5b:	55                   	push   %ebp
  100d5c:	89 e5                	mov    %esp,%ebp
  100d5e:	83 ec 28             	sub    $0x28,%esp
  100d61:	66 c7 45 f6 43 00    	movw   $0x43,-0xa(%ebp)
  100d67:	c6 45 f5 34          	movb   $0x34,-0xb(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100d6b:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  100d6f:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100d73:	ee                   	out    %al,(%dx)
  100d74:	66 c7 45 f2 40 00    	movw   $0x40,-0xe(%ebp)
  100d7a:	c6 45 f1 9c          	movb   $0x9c,-0xf(%ebp)
  100d7e:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100d82:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100d86:	ee                   	out    %al,(%dx)
  100d87:	66 c7 45 ee 40 00    	movw   $0x40,-0x12(%ebp)
  100d8d:	c6 45 ed 2e          	movb   $0x2e,-0x13(%ebp)
  100d91:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100d95:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100d99:	ee                   	out    %al,(%dx)
    outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
    outb(IO_TIMER1, TIMER_DIV(100) % 256);
    outb(IO_TIMER1, TIMER_DIV(100) / 256);

    // initialize time counter 'ticks' to zero
    ticks = 0;
  100d9a:	c7 05 28 f9 10 00 00 	movl   $0x0,0x10f928
  100da1:	00 00 00 

    cprintf("++ setup timer interrupts\n");
  100da4:	c7 04 24 96 37 10 00 	movl   $0x103796,(%esp)
  100dab:	e8 62 f5 ff ff       	call   100312 <cprintf>
    pic_enable(IRQ_TIMER);
  100db0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100db7:	e8 c1 08 00 00       	call   10167d <pic_enable>
}
  100dbc:	c9                   	leave  
  100dbd:	c3                   	ret    

00100dbe <delay>:
#include <picirq.h>
#include <trap.h>

/* stupid I/O delay routine necessitated by historical PC design flaws */
static void
delay(void) {
  100dbe:	55                   	push   %ebp
  100dbf:	89 e5                	mov    %esp,%ebp
  100dc1:	83 ec 10             	sub    $0x10,%esp
  100dc4:	66 c7 45 fe 84 00    	movw   $0x84,-0x2(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100dca:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  100dce:	89 c2                	mov    %eax,%edx
  100dd0:	ec                   	in     (%dx),%al
  100dd1:	88 45 fd             	mov    %al,-0x3(%ebp)
  100dd4:	66 c7 45 fa 84 00    	movw   $0x84,-0x6(%ebp)
  100dda:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  100dde:	89 c2                	mov    %eax,%edx
  100de0:	ec                   	in     (%dx),%al
  100de1:	88 45 f9             	mov    %al,-0x7(%ebp)
  100de4:	66 c7 45 f6 84 00    	movw   $0x84,-0xa(%ebp)
  100dea:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100dee:	89 c2                	mov    %eax,%edx
  100df0:	ec                   	in     (%dx),%al
  100df1:	88 45 f5             	mov    %al,-0xb(%ebp)
  100df4:	66 c7 45 f2 84 00    	movw   $0x84,-0xe(%ebp)
  100dfa:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100dfe:	89 c2                	mov    %eax,%edx
  100e00:	ec                   	in     (%dx),%al
  100e01:	88 45 f1             	mov    %al,-0xf(%ebp)
    inb(0x84);
    inb(0x84);
    inb(0x84);
    inb(0x84);
}
  100e04:	c9                   	leave  
  100e05:	c3                   	ret    

00100e06 <cga_init>:
//    -- 数据寄存器 映射 到 端口 0x3D5或0x3B5 
//    -- 索引寄存器 0x3D4或0x3B4,决定在数据寄存器中的数据表示什么。

/* TEXT-mode CGA/VGA display output */
static void
cga_init(void) {
  100e06:	55                   	push   %ebp
  100e07:	89 e5                	mov    %esp,%ebp
  100e09:	83 ec 20             	sub    $0x20,%esp
    volatile uint16_t *cp = (uint16_t *)CGA_BUF;   //CGA_BUF: 0xB8000 (彩色显示的显存物理基址)
  100e0c:	c7 45 fc 00 80 0b 00 	movl   $0xb8000,-0x4(%ebp)
    uint16_t was = *cp;                                            //保存当前显存0xB8000处的值
  100e13:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e16:	0f b7 00             	movzwl (%eax),%eax
  100e19:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
    *cp = (uint16_t) 0xA55A;                                   // 给这个地址随便写个值，看看能否再读出同样的值
  100e1d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e20:	66 c7 00 5a a5       	movw   $0xa55a,(%eax)
    if (*cp != 0xA55A) {                                            // 如果读不出来，说明没有这块显存，即是单显配置
  100e25:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e28:	0f b7 00             	movzwl (%eax),%eax
  100e2b:	66 3d 5a a5          	cmp    $0xa55a,%ax
  100e2f:	74 12                	je     100e43 <cga_init+0x3d>
        cp = (uint16_t*)MONO_BUF;                         //设置为单显的显存基址 MONO_BUF： 0xB0000
  100e31:	c7 45 fc 00 00 0b 00 	movl   $0xb0000,-0x4(%ebp)
        addr_6845 = MONO_BASE;                           //设置为单显控制的IO地址，MONO_BASE: 0x3B4
  100e38:	66 c7 05 66 ee 10 00 	movw   $0x3b4,0x10ee66
  100e3f:	b4 03 
  100e41:	eb 13                	jmp    100e56 <cga_init+0x50>
    } else {                                                                // 如果读出来了，有这块显存，即是彩显配置
        *cp = was;                                                      //还原原来显存位置的值
  100e43:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e46:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  100e4a:	66 89 10             	mov    %dx,(%eax)
        addr_6845 = CGA_BASE;                               // 设置为彩显控制的IO地址，CGA_BASE: 0x3D4 
  100e4d:	66 c7 05 66 ee 10 00 	movw   $0x3d4,0x10ee66
  100e54:	d4 03 
    // Extract cursor location
    // 6845索引寄存器的index 0x0E（及十进制的14）== 光标位置(高位)
    // 6845索引寄存器的index 0x0F（及十进制的15）== 光标位置(低位)
    // 6845 reg 15 : Cursor Address (Low Byte)
    uint32_t pos;
    outb(addr_6845, 14);                                        
  100e56:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100e5d:	0f b7 c0             	movzwl %ax,%eax
  100e60:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
  100e64:	c6 45 f1 0e          	movb   $0xe,-0xf(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100e68:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100e6c:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100e70:	ee                   	out    %al,(%dx)
    pos = inb(addr_6845 + 1) << 8;                       //读出了光标位置(高位)
  100e71:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100e78:	83 c0 01             	add    $0x1,%eax
  100e7b:	0f b7 c0             	movzwl %ax,%eax
  100e7e:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100e82:	0f b7 45 ee          	movzwl -0x12(%ebp),%eax
  100e86:	89 c2                	mov    %eax,%edx
  100e88:	ec                   	in     (%dx),%al
  100e89:	88 45 ed             	mov    %al,-0x13(%ebp)
    return data;
  100e8c:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100e90:	0f b6 c0             	movzbl %al,%eax
  100e93:	c1 e0 08             	shl    $0x8,%eax
  100e96:	89 45 f4             	mov    %eax,-0xc(%ebp)
    outb(addr_6845, 15);
  100e99:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100ea0:	0f b7 c0             	movzwl %ax,%eax
  100ea3:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
  100ea7:	c6 45 e9 0f          	movb   $0xf,-0x17(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100eab:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100eaf:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100eb3:	ee                   	out    %al,(%dx)
    pos |= inb(addr_6845 + 1);                             //读出了光标位置(低位)
  100eb4:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100ebb:	83 c0 01             	add    $0x1,%eax
  100ebe:	0f b7 c0             	movzwl %ax,%eax
  100ec1:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100ec5:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
  100ec9:	89 c2                	mov    %eax,%edx
  100ecb:	ec                   	in     (%dx),%al
  100ecc:	88 45 e5             	mov    %al,-0x1b(%ebp)
    return data;
  100ecf:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100ed3:	0f b6 c0             	movzbl %al,%eax
  100ed6:	09 45 f4             	or     %eax,-0xc(%ebp)

    crt_buf = (uint16_t*) cp;                                  //crt_buf是CGA显存起始地址
  100ed9:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100edc:	a3 60 ee 10 00       	mov    %eax,0x10ee60
    crt_pos = pos;                                                  //crt_pos是CGA当前光标位置
  100ee1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100ee4:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
}
  100eea:	c9                   	leave  
  100eeb:	c3                   	ret    

00100eec <serial_init>:

static bool serial_exists = 0;

static void
serial_init(void) {
  100eec:	55                   	push   %ebp
  100eed:	89 e5                	mov    %esp,%ebp
  100eef:	83 ec 48             	sub    $0x48,%esp
  100ef2:	66 c7 45 f6 fa 03    	movw   $0x3fa,-0xa(%ebp)
  100ef8:	c6 45 f5 00          	movb   $0x0,-0xb(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100efc:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  100f00:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100f04:	ee                   	out    %al,(%dx)
  100f05:	66 c7 45 f2 fb 03    	movw   $0x3fb,-0xe(%ebp)
  100f0b:	c6 45 f1 80          	movb   $0x80,-0xf(%ebp)
  100f0f:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100f13:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100f17:	ee                   	out    %al,(%dx)
  100f18:	66 c7 45 ee f8 03    	movw   $0x3f8,-0x12(%ebp)
  100f1e:	c6 45 ed 0c          	movb   $0xc,-0x13(%ebp)
  100f22:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100f26:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100f2a:	ee                   	out    %al,(%dx)
  100f2b:	66 c7 45 ea f9 03    	movw   $0x3f9,-0x16(%ebp)
  100f31:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
  100f35:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100f39:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100f3d:	ee                   	out    %al,(%dx)
  100f3e:	66 c7 45 e6 fb 03    	movw   $0x3fb,-0x1a(%ebp)
  100f44:	c6 45 e5 03          	movb   $0x3,-0x1b(%ebp)
  100f48:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100f4c:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  100f50:	ee                   	out    %al,(%dx)
  100f51:	66 c7 45 e2 fc 03    	movw   $0x3fc,-0x1e(%ebp)
  100f57:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
  100f5b:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  100f5f:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  100f63:	ee                   	out    %al,(%dx)
  100f64:	66 c7 45 de f9 03    	movw   $0x3f9,-0x22(%ebp)
  100f6a:	c6 45 dd 01          	movb   $0x1,-0x23(%ebp)
  100f6e:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  100f72:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  100f76:	ee                   	out    %al,(%dx)
  100f77:	66 c7 45 da fd 03    	movw   $0x3fd,-0x26(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100f7d:	0f b7 45 da          	movzwl -0x26(%ebp),%eax
  100f81:	89 c2                	mov    %eax,%edx
  100f83:	ec                   	in     (%dx),%al
  100f84:	88 45 d9             	mov    %al,-0x27(%ebp)
    return data;
  100f87:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
    // Enable rcv interrupts
    outb(COM1 + COM_IER, COM_IER_RDI);

    // Clear any preexisting overrun indications and interrupts
    // Serial port doesn't exist if COM_LSR returns 0xFF
    serial_exists = (inb(COM1 + COM_LSR) != 0xFF);
  100f8b:	3c ff                	cmp    $0xff,%al
  100f8d:	0f 95 c0             	setne  %al
  100f90:	0f b6 c0             	movzbl %al,%eax
  100f93:	a3 68 ee 10 00       	mov    %eax,0x10ee68
  100f98:	66 c7 45 d6 fa 03    	movw   $0x3fa,-0x2a(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100f9e:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
  100fa2:	89 c2                	mov    %eax,%edx
  100fa4:	ec                   	in     (%dx),%al
  100fa5:	88 45 d5             	mov    %al,-0x2b(%ebp)
  100fa8:	66 c7 45 d2 f8 03    	movw   $0x3f8,-0x2e(%ebp)
  100fae:	0f b7 45 d2          	movzwl -0x2e(%ebp),%eax
  100fb2:	89 c2                	mov    %eax,%edx
  100fb4:	ec                   	in     (%dx),%al
  100fb5:	88 45 d1             	mov    %al,-0x2f(%ebp)
    (void) inb(COM1+COM_IIR);
    (void) inb(COM1+COM_RX);

    if (serial_exists) {
  100fb8:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  100fbd:	85 c0                	test   %eax,%eax
  100fbf:	74 0c                	je     100fcd <serial_init+0xe1>
        pic_enable(IRQ_COM1);
  100fc1:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
  100fc8:	e8 b0 06 00 00       	call   10167d <pic_enable>
    }
}
  100fcd:	c9                   	leave  
  100fce:	c3                   	ret    

00100fcf <lpt_putc_sub>:

static void
lpt_putc_sub(int c) {
  100fcf:	55                   	push   %ebp
  100fd0:	89 e5                	mov    %esp,%ebp
  100fd2:	83 ec 20             	sub    $0x20,%esp
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  100fd5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  100fdc:	eb 09                	jmp    100fe7 <lpt_putc_sub+0x18>
        delay();
  100fde:	e8 db fd ff ff       	call   100dbe <delay>
}

static void
lpt_putc_sub(int c) {
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  100fe3:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  100fe7:	66 c7 45 fa 79 03    	movw   $0x379,-0x6(%ebp)
  100fed:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  100ff1:	89 c2                	mov    %eax,%edx
  100ff3:	ec                   	in     (%dx),%al
  100ff4:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  100ff7:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  100ffb:	84 c0                	test   %al,%al
  100ffd:	78 09                	js     101008 <lpt_putc_sub+0x39>
  100fff:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  101006:	7e d6                	jle    100fde <lpt_putc_sub+0xf>
        delay();
    }
    outb(LPTPORT + 0, c);
  101008:	8b 45 08             	mov    0x8(%ebp),%eax
  10100b:	0f b6 c0             	movzbl %al,%eax
  10100e:	66 c7 45 f6 78 03    	movw   $0x378,-0xa(%ebp)
  101014:	88 45 f5             	mov    %al,-0xb(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101017:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  10101b:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  10101f:	ee                   	out    %al,(%dx)
  101020:	66 c7 45 f2 7a 03    	movw   $0x37a,-0xe(%ebp)
  101026:	c6 45 f1 0d          	movb   $0xd,-0xf(%ebp)
  10102a:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  10102e:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  101032:	ee                   	out    %al,(%dx)
  101033:	66 c7 45 ee 7a 03    	movw   $0x37a,-0x12(%ebp)
  101039:	c6 45 ed 08          	movb   $0x8,-0x13(%ebp)
  10103d:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  101041:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101045:	ee                   	out    %al,(%dx)
    outb(LPTPORT + 2, 0x08 | 0x04 | 0x01);
    outb(LPTPORT + 2, 0x08);
}
  101046:	c9                   	leave  
  101047:	c3                   	ret    

00101048 <lpt_putc>:

/* lpt_putc - copy console output to parallel port */
static void
lpt_putc(int c) {
  101048:	55                   	push   %ebp
  101049:	89 e5                	mov    %esp,%ebp
  10104b:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  10104e:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  101052:	74 0d                	je     101061 <lpt_putc+0x19>
        lpt_putc_sub(c);
  101054:	8b 45 08             	mov    0x8(%ebp),%eax
  101057:	89 04 24             	mov    %eax,(%esp)
  10105a:	e8 70 ff ff ff       	call   100fcf <lpt_putc_sub>
  10105f:	eb 24                	jmp    101085 <lpt_putc+0x3d>
    }
    else {
        lpt_putc_sub('\b');
  101061:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  101068:	e8 62 ff ff ff       	call   100fcf <lpt_putc_sub>
        lpt_putc_sub(' ');
  10106d:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  101074:	e8 56 ff ff ff       	call   100fcf <lpt_putc_sub>
        lpt_putc_sub('\b');
  101079:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  101080:	e8 4a ff ff ff       	call   100fcf <lpt_putc_sub>
    }
}
  101085:	c9                   	leave  
  101086:	c3                   	ret    

00101087 <cga_putc>:

/* cga_putc - print character to console */
static void
cga_putc(int c) {
  101087:	55                   	push   %ebp
  101088:	89 e5                	mov    %esp,%ebp
  10108a:	53                   	push   %ebx
  10108b:	83 ec 34             	sub    $0x34,%esp
    // set black on white
    if (!(c & ~0xFF)) {
  10108e:	8b 45 08             	mov    0x8(%ebp),%eax
  101091:	b0 00                	mov    $0x0,%al
  101093:	85 c0                	test   %eax,%eax
  101095:	75 07                	jne    10109e <cga_putc+0x17>
        c |= 0x0700;
  101097:	81 4d 08 00 07 00 00 	orl    $0x700,0x8(%ebp)
    }

    switch (c & 0xff) {
  10109e:	8b 45 08             	mov    0x8(%ebp),%eax
  1010a1:	0f b6 c0             	movzbl %al,%eax
  1010a4:	83 f8 0a             	cmp    $0xa,%eax
  1010a7:	74 4c                	je     1010f5 <cga_putc+0x6e>
  1010a9:	83 f8 0d             	cmp    $0xd,%eax
  1010ac:	74 57                	je     101105 <cga_putc+0x7e>
  1010ae:	83 f8 08             	cmp    $0x8,%eax
  1010b1:	0f 85 88 00 00 00    	jne    10113f <cga_putc+0xb8>
    case '\b':
        if (crt_pos > 0) {
  1010b7:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1010be:	66 85 c0             	test   %ax,%ax
  1010c1:	74 30                	je     1010f3 <cga_putc+0x6c>
            crt_pos --;
  1010c3:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1010ca:	83 e8 01             	sub    $0x1,%eax
  1010cd:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
            crt_buf[crt_pos] = (c & ~0xff) | ' ';
  1010d3:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  1010d8:	0f b7 15 64 ee 10 00 	movzwl 0x10ee64,%edx
  1010df:	0f b7 d2             	movzwl %dx,%edx
  1010e2:	01 d2                	add    %edx,%edx
  1010e4:	01 c2                	add    %eax,%edx
  1010e6:	8b 45 08             	mov    0x8(%ebp),%eax
  1010e9:	b0 00                	mov    $0x0,%al
  1010eb:	83 c8 20             	or     $0x20,%eax
  1010ee:	66 89 02             	mov    %ax,(%edx)
        }
        break;
  1010f1:	eb 72                	jmp    101165 <cga_putc+0xde>
  1010f3:	eb 70                	jmp    101165 <cga_putc+0xde>
    case '\n':
        crt_pos += CRT_COLS;
  1010f5:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1010fc:	83 c0 50             	add    $0x50,%eax
  1010ff:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
    case '\r':
        crt_pos -= (crt_pos % CRT_COLS);
  101105:	0f b7 1d 64 ee 10 00 	movzwl 0x10ee64,%ebx
  10110c:	0f b7 0d 64 ee 10 00 	movzwl 0x10ee64,%ecx
  101113:	0f b7 c1             	movzwl %cx,%eax
  101116:	69 c0 cd cc 00 00    	imul   $0xcccd,%eax,%eax
  10111c:	c1 e8 10             	shr    $0x10,%eax
  10111f:	89 c2                	mov    %eax,%edx
  101121:	66 c1 ea 06          	shr    $0x6,%dx
  101125:	89 d0                	mov    %edx,%eax
  101127:	c1 e0 02             	shl    $0x2,%eax
  10112a:	01 d0                	add    %edx,%eax
  10112c:	c1 e0 04             	shl    $0x4,%eax
  10112f:	29 c1                	sub    %eax,%ecx
  101131:	89 ca                	mov    %ecx,%edx
  101133:	89 d8                	mov    %ebx,%eax
  101135:	29 d0                	sub    %edx,%eax
  101137:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
        break;
  10113d:	eb 26                	jmp    101165 <cga_putc+0xde>
    default:
        crt_buf[crt_pos ++] = c;     // write the character
  10113f:	8b 0d 60 ee 10 00    	mov    0x10ee60,%ecx
  101145:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  10114c:	8d 50 01             	lea    0x1(%eax),%edx
  10114f:	66 89 15 64 ee 10 00 	mov    %dx,0x10ee64
  101156:	0f b7 c0             	movzwl %ax,%eax
  101159:	01 c0                	add    %eax,%eax
  10115b:	8d 14 01             	lea    (%ecx,%eax,1),%edx
  10115e:	8b 45 08             	mov    0x8(%ebp),%eax
  101161:	66 89 02             	mov    %ax,(%edx)
        break;
  101164:	90                   	nop
    }

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
  101165:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  10116c:	66 3d cf 07          	cmp    $0x7cf,%ax
  101170:	76 5b                	jbe    1011cd <cga_putc+0x146>
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
  101172:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  101177:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
  10117d:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  101182:	c7 44 24 08 00 0f 00 	movl   $0xf00,0x8(%esp)
  101189:	00 
  10118a:	89 54 24 04          	mov    %edx,0x4(%esp)
  10118e:	89 04 24             	mov    %eax,(%esp)
  101191:	e8 97 21 00 00       	call   10332d <memmove>
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  101196:	c7 45 f4 80 07 00 00 	movl   $0x780,-0xc(%ebp)
  10119d:	eb 15                	jmp    1011b4 <cga_putc+0x12d>
            crt_buf[i] = 0x0700 | ' ';
  10119f:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  1011a4:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1011a7:	01 d2                	add    %edx,%edx
  1011a9:	01 d0                	add    %edx,%eax
  1011ab:	66 c7 00 20 07       	movw   $0x720,(%eax)

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  1011b0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  1011b4:	81 7d f4 cf 07 00 00 	cmpl   $0x7cf,-0xc(%ebp)
  1011bb:	7e e2                	jle    10119f <cga_putc+0x118>
            crt_buf[i] = 0x0700 | ' ';
        }
        crt_pos -= CRT_COLS;
  1011bd:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1011c4:	83 e8 50             	sub    $0x50,%eax
  1011c7:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
    }

    // move that little blinky thing
    outb(addr_6845, 14);
  1011cd:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  1011d4:	0f b7 c0             	movzwl %ax,%eax
  1011d7:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
  1011db:	c6 45 f1 0e          	movb   $0xe,-0xf(%ebp)
  1011df:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  1011e3:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  1011e7:	ee                   	out    %al,(%dx)
    outb(addr_6845 + 1, crt_pos >> 8);
  1011e8:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1011ef:	66 c1 e8 08          	shr    $0x8,%ax
  1011f3:	0f b6 c0             	movzbl %al,%eax
  1011f6:	0f b7 15 66 ee 10 00 	movzwl 0x10ee66,%edx
  1011fd:	83 c2 01             	add    $0x1,%edx
  101200:	0f b7 d2             	movzwl %dx,%edx
  101203:	66 89 55 ee          	mov    %dx,-0x12(%ebp)
  101207:	88 45 ed             	mov    %al,-0x13(%ebp)
  10120a:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  10120e:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101212:	ee                   	out    %al,(%dx)
    outb(addr_6845, 15);
  101213:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  10121a:	0f b7 c0             	movzwl %ax,%eax
  10121d:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
  101221:	c6 45 e9 0f          	movb   $0xf,-0x17(%ebp)
  101225:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  101229:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  10122d:	ee                   	out    %al,(%dx)
    outb(addr_6845 + 1, crt_pos);
  10122e:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101235:	0f b6 c0             	movzbl %al,%eax
  101238:	0f b7 15 66 ee 10 00 	movzwl 0x10ee66,%edx
  10123f:	83 c2 01             	add    $0x1,%edx
  101242:	0f b7 d2             	movzwl %dx,%edx
  101245:	66 89 55 e6          	mov    %dx,-0x1a(%ebp)
  101249:	88 45 e5             	mov    %al,-0x1b(%ebp)
  10124c:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  101250:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  101254:	ee                   	out    %al,(%dx)
}
  101255:	83 c4 34             	add    $0x34,%esp
  101258:	5b                   	pop    %ebx
  101259:	5d                   	pop    %ebp
  10125a:	c3                   	ret    

0010125b <serial_putc_sub>:

static void
serial_putc_sub(int c) {
  10125b:	55                   	push   %ebp
  10125c:	89 e5                	mov    %esp,%ebp
  10125e:	83 ec 10             	sub    $0x10,%esp
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  101261:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101268:	eb 09                	jmp    101273 <serial_putc_sub+0x18>
        delay();
  10126a:	e8 4f fb ff ff       	call   100dbe <delay>
}

static void
serial_putc_sub(int c) {
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  10126f:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  101273:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101279:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  10127d:	89 c2                	mov    %eax,%edx
  10127f:	ec                   	in     (%dx),%al
  101280:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  101283:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  101287:	0f b6 c0             	movzbl %al,%eax
  10128a:	83 e0 20             	and    $0x20,%eax
  10128d:	85 c0                	test   %eax,%eax
  10128f:	75 09                	jne    10129a <serial_putc_sub+0x3f>
  101291:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  101298:	7e d0                	jle    10126a <serial_putc_sub+0xf>
        delay();
    }
    outb(COM1 + COM_TX, c);
  10129a:	8b 45 08             	mov    0x8(%ebp),%eax
  10129d:	0f b6 c0             	movzbl %al,%eax
  1012a0:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
  1012a6:	88 45 f5             	mov    %al,-0xb(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1012a9:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  1012ad:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  1012b1:	ee                   	out    %al,(%dx)
}
  1012b2:	c9                   	leave  
  1012b3:	c3                   	ret    

001012b4 <serial_putc>:

/* serial_putc - print character to serial port */
static void
serial_putc(int c) {
  1012b4:	55                   	push   %ebp
  1012b5:	89 e5                	mov    %esp,%ebp
  1012b7:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  1012ba:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  1012be:	74 0d                	je     1012cd <serial_putc+0x19>
        serial_putc_sub(c);
  1012c0:	8b 45 08             	mov    0x8(%ebp),%eax
  1012c3:	89 04 24             	mov    %eax,(%esp)
  1012c6:	e8 90 ff ff ff       	call   10125b <serial_putc_sub>
  1012cb:	eb 24                	jmp    1012f1 <serial_putc+0x3d>
    }
    else {
        serial_putc_sub('\b');
  1012cd:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  1012d4:	e8 82 ff ff ff       	call   10125b <serial_putc_sub>
        serial_putc_sub(' ');
  1012d9:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  1012e0:	e8 76 ff ff ff       	call   10125b <serial_putc_sub>
        serial_putc_sub('\b');
  1012e5:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  1012ec:	e8 6a ff ff ff       	call   10125b <serial_putc_sub>
    }
}
  1012f1:	c9                   	leave  
  1012f2:	c3                   	ret    

001012f3 <cons_intr>:
/* *
 * cons_intr - called by device interrupt routines to feed input
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
  1012f3:	55                   	push   %ebp
  1012f4:	89 e5                	mov    %esp,%ebp
  1012f6:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = (*proc)()) != -1) {
  1012f9:	eb 33                	jmp    10132e <cons_intr+0x3b>
        if (c != 0) {
  1012fb:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1012ff:	74 2d                	je     10132e <cons_intr+0x3b>
            cons.buf[cons.wpos ++] = c;
  101301:	a1 84 f0 10 00       	mov    0x10f084,%eax
  101306:	8d 50 01             	lea    0x1(%eax),%edx
  101309:	89 15 84 f0 10 00    	mov    %edx,0x10f084
  10130f:	8b 55 f4             	mov    -0xc(%ebp),%edx
  101312:	88 90 80 ee 10 00    	mov    %dl,0x10ee80(%eax)
            if (cons.wpos == CONSBUFSIZE) {
  101318:	a1 84 f0 10 00       	mov    0x10f084,%eax
  10131d:	3d 00 02 00 00       	cmp    $0x200,%eax
  101322:	75 0a                	jne    10132e <cons_intr+0x3b>
                cons.wpos = 0;
  101324:	c7 05 84 f0 10 00 00 	movl   $0x0,0x10f084
  10132b:	00 00 00 
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
    int c;
    while ((c = (*proc)()) != -1) {
  10132e:	8b 45 08             	mov    0x8(%ebp),%eax
  101331:	ff d0                	call   *%eax
  101333:	89 45 f4             	mov    %eax,-0xc(%ebp)
  101336:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
  10133a:	75 bf                	jne    1012fb <cons_intr+0x8>
            if (cons.wpos == CONSBUFSIZE) {
                cons.wpos = 0;
            }
        }
    }
}
  10133c:	c9                   	leave  
  10133d:	c3                   	ret    

0010133e <serial_proc_data>:

/* serial_proc_data - get data from serial port */
static int
serial_proc_data(void) {
  10133e:	55                   	push   %ebp
  10133f:	89 e5                	mov    %esp,%ebp
  101341:	83 ec 10             	sub    $0x10,%esp
  101344:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10134a:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  10134e:	89 c2                	mov    %eax,%edx
  101350:	ec                   	in     (%dx),%al
  101351:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  101354:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
    if (!(inb(COM1 + COM_LSR) & COM_LSR_DATA)) {
  101358:	0f b6 c0             	movzbl %al,%eax
  10135b:	83 e0 01             	and    $0x1,%eax
  10135e:	85 c0                	test   %eax,%eax
  101360:	75 07                	jne    101369 <serial_proc_data+0x2b>
        return -1;
  101362:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101367:	eb 2a                	jmp    101393 <serial_proc_data+0x55>
  101369:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10136f:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  101373:	89 c2                	mov    %eax,%edx
  101375:	ec                   	in     (%dx),%al
  101376:	88 45 f5             	mov    %al,-0xb(%ebp)
    return data;
  101379:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
    }
    int c = inb(COM1 + COM_RX);
  10137d:	0f b6 c0             	movzbl %al,%eax
  101380:	89 45 fc             	mov    %eax,-0x4(%ebp)
    if (c == 127) {
  101383:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%ebp)
  101387:	75 07                	jne    101390 <serial_proc_data+0x52>
        c = '\b';
  101389:	c7 45 fc 08 00 00 00 	movl   $0x8,-0x4(%ebp)
    }
    return c;
  101390:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  101393:	c9                   	leave  
  101394:	c3                   	ret    

00101395 <serial_intr>:

/* serial_intr - try to feed input characters from serial port */
void
serial_intr(void) {
  101395:	55                   	push   %ebp
  101396:	89 e5                	mov    %esp,%ebp
  101398:	83 ec 18             	sub    $0x18,%esp
    if (serial_exists) {
  10139b:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  1013a0:	85 c0                	test   %eax,%eax
  1013a2:	74 0c                	je     1013b0 <serial_intr+0x1b>
        cons_intr(serial_proc_data);
  1013a4:	c7 04 24 3e 13 10 00 	movl   $0x10133e,(%esp)
  1013ab:	e8 43 ff ff ff       	call   1012f3 <cons_intr>
    }
}
  1013b0:	c9                   	leave  
  1013b1:	c3                   	ret    

001013b2 <kbd_proc_data>:
 *
 * The kbd_proc_data() function gets data from the keyboard.
 * If we finish a character, return it, else 0. And return -1 if no data.
 * */
static int
kbd_proc_data(void) {
  1013b2:	55                   	push   %ebp
  1013b3:	89 e5                	mov    %esp,%ebp
  1013b5:	83 ec 38             	sub    $0x38,%esp
  1013b8:	66 c7 45 f0 64 00    	movw   $0x64,-0x10(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1013be:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  1013c2:	89 c2                	mov    %eax,%edx
  1013c4:	ec                   	in     (%dx),%al
  1013c5:	88 45 ef             	mov    %al,-0x11(%ebp)
    return data;
  1013c8:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    int c;
    uint8_t data;
    static uint32_t shift;

    if ((inb(KBSTATP) & KBS_DIB) == 0) {
  1013cc:	0f b6 c0             	movzbl %al,%eax
  1013cf:	83 e0 01             	and    $0x1,%eax
  1013d2:	85 c0                	test   %eax,%eax
  1013d4:	75 0a                	jne    1013e0 <kbd_proc_data+0x2e>
        return -1;
  1013d6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1013db:	e9 59 01 00 00       	jmp    101539 <kbd_proc_data+0x187>
  1013e0:	66 c7 45 ec 60 00    	movw   $0x60,-0x14(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1013e6:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  1013ea:	89 c2                	mov    %eax,%edx
  1013ec:	ec                   	in     (%dx),%al
  1013ed:	88 45 eb             	mov    %al,-0x15(%ebp)
    return data;
  1013f0:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
    }

    data = inb(KBDATAP);
  1013f4:	88 45 f3             	mov    %al,-0xd(%ebp)

    if (data == 0xE0) {
  1013f7:	80 7d f3 e0          	cmpb   $0xe0,-0xd(%ebp)
  1013fb:	75 17                	jne    101414 <kbd_proc_data+0x62>
        // E0 escape character
        shift |= E0ESC;
  1013fd:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101402:	83 c8 40             	or     $0x40,%eax
  101405:	a3 88 f0 10 00       	mov    %eax,0x10f088
        return 0;
  10140a:	b8 00 00 00 00       	mov    $0x0,%eax
  10140f:	e9 25 01 00 00       	jmp    101539 <kbd_proc_data+0x187>
    } else if (data & 0x80) {
  101414:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101418:	84 c0                	test   %al,%al
  10141a:	79 47                	jns    101463 <kbd_proc_data+0xb1>
        // Key released
        data = (shift & E0ESC ? data : data & 0x7F);
  10141c:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101421:	83 e0 40             	and    $0x40,%eax
  101424:	85 c0                	test   %eax,%eax
  101426:	75 09                	jne    101431 <kbd_proc_data+0x7f>
  101428:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10142c:	83 e0 7f             	and    $0x7f,%eax
  10142f:	eb 04                	jmp    101435 <kbd_proc_data+0x83>
  101431:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101435:	88 45 f3             	mov    %al,-0xd(%ebp)
        shift &= ~(shiftcode[data] | E0ESC);
  101438:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10143c:	0f b6 80 40 e0 10 00 	movzbl 0x10e040(%eax),%eax
  101443:	83 c8 40             	or     $0x40,%eax
  101446:	0f b6 c0             	movzbl %al,%eax
  101449:	f7 d0                	not    %eax
  10144b:	89 c2                	mov    %eax,%edx
  10144d:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101452:	21 d0                	and    %edx,%eax
  101454:	a3 88 f0 10 00       	mov    %eax,0x10f088
        return 0;
  101459:	b8 00 00 00 00       	mov    $0x0,%eax
  10145e:	e9 d6 00 00 00       	jmp    101539 <kbd_proc_data+0x187>
    } else if (shift & E0ESC) {
  101463:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101468:	83 e0 40             	and    $0x40,%eax
  10146b:	85 c0                	test   %eax,%eax
  10146d:	74 11                	je     101480 <kbd_proc_data+0xce>
        // Last character was an E0 escape; or with 0x80
        data |= 0x80;
  10146f:	80 4d f3 80          	orb    $0x80,-0xd(%ebp)
        shift &= ~E0ESC;
  101473:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101478:	83 e0 bf             	and    $0xffffffbf,%eax
  10147b:	a3 88 f0 10 00       	mov    %eax,0x10f088
    }

    shift |= shiftcode[data];
  101480:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101484:	0f b6 80 40 e0 10 00 	movzbl 0x10e040(%eax),%eax
  10148b:	0f b6 d0             	movzbl %al,%edx
  10148e:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101493:	09 d0                	or     %edx,%eax
  101495:	a3 88 f0 10 00       	mov    %eax,0x10f088
    shift ^= togglecode[data];
  10149a:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10149e:	0f b6 80 40 e1 10 00 	movzbl 0x10e140(%eax),%eax
  1014a5:	0f b6 d0             	movzbl %al,%edx
  1014a8:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014ad:	31 d0                	xor    %edx,%eax
  1014af:	a3 88 f0 10 00       	mov    %eax,0x10f088

    c = charcode[shift & (CTL | SHIFT)][data];
  1014b4:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014b9:	83 e0 03             	and    $0x3,%eax
  1014bc:	8b 14 85 40 e5 10 00 	mov    0x10e540(,%eax,4),%edx
  1014c3:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014c7:	01 d0                	add    %edx,%eax
  1014c9:	0f b6 00             	movzbl (%eax),%eax
  1014cc:	0f b6 c0             	movzbl %al,%eax
  1014cf:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if (shift & CAPSLOCK) {
  1014d2:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014d7:	83 e0 08             	and    $0x8,%eax
  1014da:	85 c0                	test   %eax,%eax
  1014dc:	74 22                	je     101500 <kbd_proc_data+0x14e>
        if ('a' <= c && c <= 'z')
  1014de:	83 7d f4 60          	cmpl   $0x60,-0xc(%ebp)
  1014e2:	7e 0c                	jle    1014f0 <kbd_proc_data+0x13e>
  1014e4:	83 7d f4 7a          	cmpl   $0x7a,-0xc(%ebp)
  1014e8:	7f 06                	jg     1014f0 <kbd_proc_data+0x13e>
            c += 'A' - 'a';
  1014ea:	83 6d f4 20          	subl   $0x20,-0xc(%ebp)
  1014ee:	eb 10                	jmp    101500 <kbd_proc_data+0x14e>
        else if ('A' <= c && c <= 'Z')
  1014f0:	83 7d f4 40          	cmpl   $0x40,-0xc(%ebp)
  1014f4:	7e 0a                	jle    101500 <kbd_proc_data+0x14e>
  1014f6:	83 7d f4 5a          	cmpl   $0x5a,-0xc(%ebp)
  1014fa:	7f 04                	jg     101500 <kbd_proc_data+0x14e>
            c += 'a' - 'A';
  1014fc:	83 45 f4 20          	addl   $0x20,-0xc(%ebp)
    }

    // Process special keys
    // Ctrl-Alt-Del: reboot
    if (!(~shift & (CTL | ALT)) && c == KEY_DEL) {
  101500:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101505:	f7 d0                	not    %eax
  101507:	83 e0 06             	and    $0x6,%eax
  10150a:	85 c0                	test   %eax,%eax
  10150c:	75 28                	jne    101536 <kbd_proc_data+0x184>
  10150e:	81 7d f4 e9 00 00 00 	cmpl   $0xe9,-0xc(%ebp)
  101515:	75 1f                	jne    101536 <kbd_proc_data+0x184>
        cprintf("Rebooting!\n");
  101517:	c7 04 24 b1 37 10 00 	movl   $0x1037b1,(%esp)
  10151e:	e8 ef ed ff ff       	call   100312 <cprintf>
  101523:	66 c7 45 e8 92 00    	movw   $0x92,-0x18(%ebp)
  101529:	c6 45 e7 03          	movb   $0x3,-0x19(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10152d:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  101531:	0f b7 55 e8          	movzwl -0x18(%ebp),%edx
  101535:	ee                   	out    %al,(%dx)
        outb(0x92, 0x3); // courtesy of Chris Frost
    }
    return c;
  101536:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  101539:	c9                   	leave  
  10153a:	c3                   	ret    

0010153b <kbd_intr>:

/* kbd_intr - try to feed input characters from keyboard */
static void
kbd_intr(void) {
  10153b:	55                   	push   %ebp
  10153c:	89 e5                	mov    %esp,%ebp
  10153e:	83 ec 18             	sub    $0x18,%esp
    cons_intr(kbd_proc_data);
  101541:	c7 04 24 b2 13 10 00 	movl   $0x1013b2,(%esp)
  101548:	e8 a6 fd ff ff       	call   1012f3 <cons_intr>
}
  10154d:	c9                   	leave  
  10154e:	c3                   	ret    

0010154f <kbd_init>:

static void
kbd_init(void) {
  10154f:	55                   	push   %ebp
  101550:	89 e5                	mov    %esp,%ebp
  101552:	83 ec 18             	sub    $0x18,%esp
    // drain the kbd buffer
    kbd_intr();
  101555:	e8 e1 ff ff ff       	call   10153b <kbd_intr>
    pic_enable(IRQ_KBD);
  10155a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  101561:	e8 17 01 00 00       	call   10167d <pic_enable>
}
  101566:	c9                   	leave  
  101567:	c3                   	ret    

00101568 <cons_init>:

/* cons_init - initializes the console devices */
void
cons_init(void) {
  101568:	55                   	push   %ebp
  101569:	89 e5                	mov    %esp,%ebp
  10156b:	83 ec 18             	sub    $0x18,%esp
    cga_init();
  10156e:	e8 93 f8 ff ff       	call   100e06 <cga_init>
    serial_init();
  101573:	e8 74 f9 ff ff       	call   100eec <serial_init>
    kbd_init();
  101578:	e8 d2 ff ff ff       	call   10154f <kbd_init>
    if (!serial_exists) {
  10157d:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  101582:	85 c0                	test   %eax,%eax
  101584:	75 0c                	jne    101592 <cons_init+0x2a>
        cprintf("serial port does not exist!!\n");
  101586:	c7 04 24 bd 37 10 00 	movl   $0x1037bd,(%esp)
  10158d:	e8 80 ed ff ff       	call   100312 <cprintf>
    }
}
  101592:	c9                   	leave  
  101593:	c3                   	ret    

00101594 <cons_putc>:

/* cons_putc - print a single character @c to console devices */
void
cons_putc(int c) {
  101594:	55                   	push   %ebp
  101595:	89 e5                	mov    %esp,%ebp
  101597:	83 ec 18             	sub    $0x18,%esp
    lpt_putc(c);
  10159a:	8b 45 08             	mov    0x8(%ebp),%eax
  10159d:	89 04 24             	mov    %eax,(%esp)
  1015a0:	e8 a3 fa ff ff       	call   101048 <lpt_putc>
    cga_putc(c);
  1015a5:	8b 45 08             	mov    0x8(%ebp),%eax
  1015a8:	89 04 24             	mov    %eax,(%esp)
  1015ab:	e8 d7 fa ff ff       	call   101087 <cga_putc>
    serial_putc(c);
  1015b0:	8b 45 08             	mov    0x8(%ebp),%eax
  1015b3:	89 04 24             	mov    %eax,(%esp)
  1015b6:	e8 f9 fc ff ff       	call   1012b4 <serial_putc>
}
  1015bb:	c9                   	leave  
  1015bc:	c3                   	ret    

001015bd <cons_getc>:
/* *
 * cons_getc - return the next input character from console,
 * or 0 if none waiting.
 * */
int
cons_getc(void) {
  1015bd:	55                   	push   %ebp
  1015be:	89 e5                	mov    %esp,%ebp
  1015c0:	83 ec 18             	sub    $0x18,%esp
    int c;

    // poll for any pending input characters,
    // so that this function works even when interrupts are disabled
    // (e.g., when called from the kernel monitor).
    serial_intr();
  1015c3:	e8 cd fd ff ff       	call   101395 <serial_intr>
    kbd_intr();
  1015c8:	e8 6e ff ff ff       	call   10153b <kbd_intr>

    // grab the next character from the input buffer.
    if (cons.rpos != cons.wpos) {
  1015cd:	8b 15 80 f0 10 00    	mov    0x10f080,%edx
  1015d3:	a1 84 f0 10 00       	mov    0x10f084,%eax
  1015d8:	39 c2                	cmp    %eax,%edx
  1015da:	74 36                	je     101612 <cons_getc+0x55>
        c = cons.buf[cons.rpos ++];
  1015dc:	a1 80 f0 10 00       	mov    0x10f080,%eax
  1015e1:	8d 50 01             	lea    0x1(%eax),%edx
  1015e4:	89 15 80 f0 10 00    	mov    %edx,0x10f080
  1015ea:	0f b6 80 80 ee 10 00 	movzbl 0x10ee80(%eax),%eax
  1015f1:	0f b6 c0             	movzbl %al,%eax
  1015f4:	89 45 f4             	mov    %eax,-0xc(%ebp)
        if (cons.rpos == CONSBUFSIZE) {
  1015f7:	a1 80 f0 10 00       	mov    0x10f080,%eax
  1015fc:	3d 00 02 00 00       	cmp    $0x200,%eax
  101601:	75 0a                	jne    10160d <cons_getc+0x50>
            cons.rpos = 0;
  101603:	c7 05 80 f0 10 00 00 	movl   $0x0,0x10f080
  10160a:	00 00 00 
        }
        return c;
  10160d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101610:	eb 05                	jmp    101617 <cons_getc+0x5a>
    }
    return 0;
  101612:	b8 00 00 00 00       	mov    $0x0,%eax
}
  101617:	c9                   	leave  
  101618:	c3                   	ret    

00101619 <intr_enable>:
#include <x86.h>
#include <intr.h>

/* intr_enable - enable irq interrupt */
void
intr_enable(void) {
  101619:	55                   	push   %ebp
  10161a:	89 e5                	mov    %esp,%ebp
    asm volatile ("lidt (%0)" :: "r" (pd));
}

static inline void
sti(void) {
    asm volatile ("sti");
  10161c:	fb                   	sti    
    sti();
}
  10161d:	5d                   	pop    %ebp
  10161e:	c3                   	ret    

0010161f <intr_disable>:

/* intr_disable - disable irq interrupt */
void
intr_disable(void) {
  10161f:	55                   	push   %ebp
  101620:	89 e5                	mov    %esp,%ebp
}

static inline void
cli(void) {
    asm volatile ("cli");
  101622:	fa                   	cli    
    cli();
}
  101623:	5d                   	pop    %ebp
  101624:	c3                   	ret    

00101625 <pic_setmask>:
// Initial IRQ mask has interrupt 2 enabled (for slave 8259A).
static uint16_t irq_mask = 0xFFFF & ~(1 << IRQ_SLAVE);
static bool did_init = 0;

static void
pic_setmask(uint16_t mask) {
  101625:	55                   	push   %ebp
  101626:	89 e5                	mov    %esp,%ebp
  101628:	83 ec 14             	sub    $0x14,%esp
  10162b:	8b 45 08             	mov    0x8(%ebp),%eax
  10162e:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
    irq_mask = mask;
  101632:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  101636:	66 a3 50 e5 10 00    	mov    %ax,0x10e550
    if (did_init) {
  10163c:	a1 8c f0 10 00       	mov    0x10f08c,%eax
  101641:	85 c0                	test   %eax,%eax
  101643:	74 36                	je     10167b <pic_setmask+0x56>
        outb(IO_PIC1 + 1, mask);
  101645:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  101649:	0f b6 c0             	movzbl %al,%eax
  10164c:	66 c7 45 fe 21 00    	movw   $0x21,-0x2(%ebp)
  101652:	88 45 fd             	mov    %al,-0x3(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101655:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  101659:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  10165d:	ee                   	out    %al,(%dx)
        outb(IO_PIC2 + 1, mask >> 8);
  10165e:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  101662:	66 c1 e8 08          	shr    $0x8,%ax
  101666:	0f b6 c0             	movzbl %al,%eax
  101669:	66 c7 45 fa a1 00    	movw   $0xa1,-0x6(%ebp)
  10166f:	88 45 f9             	mov    %al,-0x7(%ebp)
  101672:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  101676:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  10167a:	ee                   	out    %al,(%dx)
    }
}
  10167b:	c9                   	leave  
  10167c:	c3                   	ret    

0010167d <pic_enable>:

void
pic_enable(unsigned int irq) {
  10167d:	55                   	push   %ebp
  10167e:	89 e5                	mov    %esp,%ebp
  101680:	83 ec 04             	sub    $0x4,%esp
    pic_setmask(irq_mask & ~(1 << irq));
  101683:	8b 45 08             	mov    0x8(%ebp),%eax
  101686:	ba 01 00 00 00       	mov    $0x1,%edx
  10168b:	89 c1                	mov    %eax,%ecx
  10168d:	d3 e2                	shl    %cl,%edx
  10168f:	89 d0                	mov    %edx,%eax
  101691:	f7 d0                	not    %eax
  101693:	89 c2                	mov    %eax,%edx
  101695:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  10169c:	21 d0                	and    %edx,%eax
  10169e:	0f b7 c0             	movzwl %ax,%eax
  1016a1:	89 04 24             	mov    %eax,(%esp)
  1016a4:	e8 7c ff ff ff       	call   101625 <pic_setmask>
}
  1016a9:	c9                   	leave  
  1016aa:	c3                   	ret    

001016ab <pic_init>:

/* pic_init - initialize the 8259A interrupt controllers */
void
pic_init(void) {
  1016ab:	55                   	push   %ebp
  1016ac:	89 e5                	mov    %esp,%ebp
  1016ae:	83 ec 44             	sub    $0x44,%esp
    did_init = 1;
  1016b1:	c7 05 8c f0 10 00 01 	movl   $0x1,0x10f08c
  1016b8:	00 00 00 
  1016bb:	66 c7 45 fe 21 00    	movw   $0x21,-0x2(%ebp)
  1016c1:	c6 45 fd ff          	movb   $0xff,-0x3(%ebp)
  1016c5:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  1016c9:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  1016cd:	ee                   	out    %al,(%dx)
  1016ce:	66 c7 45 fa a1 00    	movw   $0xa1,-0x6(%ebp)
  1016d4:	c6 45 f9 ff          	movb   $0xff,-0x7(%ebp)
  1016d8:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  1016dc:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  1016e0:	ee                   	out    %al,(%dx)
  1016e1:	66 c7 45 f6 20 00    	movw   $0x20,-0xa(%ebp)
  1016e7:	c6 45 f5 11          	movb   $0x11,-0xb(%ebp)
  1016eb:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  1016ef:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  1016f3:	ee                   	out    %al,(%dx)
  1016f4:	66 c7 45 f2 21 00    	movw   $0x21,-0xe(%ebp)
  1016fa:	c6 45 f1 20          	movb   $0x20,-0xf(%ebp)
  1016fe:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  101702:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  101706:	ee                   	out    %al,(%dx)
  101707:	66 c7 45 ee 21 00    	movw   $0x21,-0x12(%ebp)
  10170d:	c6 45 ed 04          	movb   $0x4,-0x13(%ebp)
  101711:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  101715:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101719:	ee                   	out    %al,(%dx)
  10171a:	66 c7 45 ea 21 00    	movw   $0x21,-0x16(%ebp)
  101720:	c6 45 e9 03          	movb   $0x3,-0x17(%ebp)
  101724:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  101728:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  10172c:	ee                   	out    %al,(%dx)
  10172d:	66 c7 45 e6 a0 00    	movw   $0xa0,-0x1a(%ebp)
  101733:	c6 45 e5 11          	movb   $0x11,-0x1b(%ebp)
  101737:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  10173b:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  10173f:	ee                   	out    %al,(%dx)
  101740:	66 c7 45 e2 a1 00    	movw   $0xa1,-0x1e(%ebp)
  101746:	c6 45 e1 28          	movb   $0x28,-0x1f(%ebp)
  10174a:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  10174e:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  101752:	ee                   	out    %al,(%dx)
  101753:	66 c7 45 de a1 00    	movw   $0xa1,-0x22(%ebp)
  101759:	c6 45 dd 02          	movb   $0x2,-0x23(%ebp)
  10175d:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  101761:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  101765:	ee                   	out    %al,(%dx)
  101766:	66 c7 45 da a1 00    	movw   $0xa1,-0x26(%ebp)
  10176c:	c6 45 d9 03          	movb   $0x3,-0x27(%ebp)
  101770:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  101774:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  101778:	ee                   	out    %al,(%dx)
  101779:	66 c7 45 d6 20 00    	movw   $0x20,-0x2a(%ebp)
  10177f:	c6 45 d5 68          	movb   $0x68,-0x2b(%ebp)
  101783:	0f b6 45 d5          	movzbl -0x2b(%ebp),%eax
  101787:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  10178b:	ee                   	out    %al,(%dx)
  10178c:	66 c7 45 d2 20 00    	movw   $0x20,-0x2e(%ebp)
  101792:	c6 45 d1 0a          	movb   $0xa,-0x2f(%ebp)
  101796:	0f b6 45 d1          	movzbl -0x2f(%ebp),%eax
  10179a:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
  10179e:	ee                   	out    %al,(%dx)
  10179f:	66 c7 45 ce a0 00    	movw   $0xa0,-0x32(%ebp)
  1017a5:	c6 45 cd 68          	movb   $0x68,-0x33(%ebp)
  1017a9:	0f b6 45 cd          	movzbl -0x33(%ebp),%eax
  1017ad:	0f b7 55 ce          	movzwl -0x32(%ebp),%edx
  1017b1:	ee                   	out    %al,(%dx)
  1017b2:	66 c7 45 ca a0 00    	movw   $0xa0,-0x36(%ebp)
  1017b8:	c6 45 c9 0a          	movb   $0xa,-0x37(%ebp)
  1017bc:	0f b6 45 c9          	movzbl -0x37(%ebp),%eax
  1017c0:	0f b7 55 ca          	movzwl -0x36(%ebp),%edx
  1017c4:	ee                   	out    %al,(%dx)
    outb(IO_PIC1, 0x0a);    // read IRR by default

    outb(IO_PIC2, 0x68);    // OCW3
    outb(IO_PIC2, 0x0a);    // OCW3

    if (irq_mask != 0xFFFF) {
  1017c5:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  1017cc:	66 83 f8 ff          	cmp    $0xffff,%ax
  1017d0:	74 12                	je     1017e4 <pic_init+0x139>
        pic_setmask(irq_mask);
  1017d2:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  1017d9:	0f b7 c0             	movzwl %ax,%eax
  1017dc:	89 04 24             	mov    %eax,(%esp)
  1017df:	e8 41 fe ff ff       	call   101625 <pic_setmask>
    }
}
  1017e4:	c9                   	leave  
  1017e5:	c3                   	ret    

001017e6 <print_ticks>:
#include <console.h>
#include <kdebug.h>

#define TICK_NUM 100

static void print_ticks() {
  1017e6:	55                   	push   %ebp
  1017e7:	89 e5                	mov    %esp,%ebp
  1017e9:	83 ec 18             	sub    $0x18,%esp
    cprintf("%d ticks\n",TICK_NUM);
  1017ec:	c7 44 24 04 64 00 00 	movl   $0x64,0x4(%esp)
  1017f3:	00 
  1017f4:	c7 04 24 e0 37 10 00 	movl   $0x1037e0,(%esp)
  1017fb:	e8 12 eb ff ff       	call   100312 <cprintf>
#ifdef DEBUG_GRADE
    cprintf("End of Test.\n");
    panic("EOT: kernel seems ok.");
#endif
}
  101800:	c9                   	leave  
  101801:	c3                   	ret    

00101802 <idt_init>:
    sizeof(idt) - 1, (uintptr_t)idt
};

/* idt_init - initialize IDT to each of the entry points in kern/trap/vectors.S */
void
idt_init(void) {
  101802:	55                   	push   %ebp
  101803:	89 e5                	mov    %esp,%ebp
  101805:	83 ec 10             	sub    $0x10,%esp
      *     You don't know the meaning of this instruction? just google it! and check the libs/x86.h to know more.
      *     Notice: the argument of lidt is idt_pd. try to find it!
      */
    extern uintptr_t __vectors[];
    int i;
    for (i = 0; i < 256; i++)
  101808:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  10180f:	e9 c3 00 00 00       	jmp    1018d7 <idt_init+0xd5>
        SETGATE(idt[i], 0, GD_KTEXT, __vectors[i], DPL_KERNEL);
  101814:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101817:	8b 04 85 e0 e5 10 00 	mov    0x10e5e0(,%eax,4),%eax
  10181e:	89 c2                	mov    %eax,%edx
  101820:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101823:	66 89 14 c5 a0 f0 10 	mov    %dx,0x10f0a0(,%eax,8)
  10182a:	00 
  10182b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10182e:	66 c7 04 c5 a2 f0 10 	movw   $0x8,0x10f0a2(,%eax,8)
  101835:	00 08 00 
  101838:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10183b:	0f b6 14 c5 a4 f0 10 	movzbl 0x10f0a4(,%eax,8),%edx
  101842:	00 
  101843:	83 e2 e0             	and    $0xffffffe0,%edx
  101846:	88 14 c5 a4 f0 10 00 	mov    %dl,0x10f0a4(,%eax,8)
  10184d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101850:	0f b6 14 c5 a4 f0 10 	movzbl 0x10f0a4(,%eax,8),%edx
  101857:	00 
  101858:	83 e2 1f             	and    $0x1f,%edx
  10185b:	88 14 c5 a4 f0 10 00 	mov    %dl,0x10f0a4(,%eax,8)
  101862:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101865:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  10186c:	00 
  10186d:	83 e2 f0             	and    $0xfffffff0,%edx
  101870:	83 ca 0e             	or     $0xe,%edx
  101873:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  10187a:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10187d:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  101884:	00 
  101885:	83 e2 ef             	and    $0xffffffef,%edx
  101888:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  10188f:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101892:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  101899:	00 
  10189a:	83 e2 9f             	and    $0xffffff9f,%edx
  10189d:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  1018a4:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018a7:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  1018ae:	00 
  1018af:	83 ca 80             	or     $0xffffff80,%edx
  1018b2:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  1018b9:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018bc:	8b 04 85 e0 e5 10 00 	mov    0x10e5e0(,%eax,4),%eax
  1018c3:	c1 e8 10             	shr    $0x10,%eax
  1018c6:	89 c2                	mov    %eax,%edx
  1018c8:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018cb:	66 89 14 c5 a6 f0 10 	mov    %dx,0x10f0a6(,%eax,8)
  1018d2:	00 
      *     You don't know the meaning of this instruction? just google it! and check the libs/x86.h to know more.
      *     Notice: the argument of lidt is idt_pd. try to find it!
      */
    extern uintptr_t __vectors[];
    int i;
    for (i = 0; i < 256; i++)
  1018d3:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  1018d7:	81 7d fc ff 00 00 00 	cmpl   $0xff,-0x4(%ebp)
  1018de:	0f 8e 30 ff ff ff    	jle    101814 <idt_init+0x12>
        SETGATE(idt[i], 0, GD_KTEXT, __vectors[i], DPL_KERNEL);
    SETGATE(idt[T_SYSCALL], 1, GD_KTEXT, __vectors[T_SYSCALL], DPL_USER);
  1018e4:	a1 e0 e7 10 00       	mov    0x10e7e0,%eax
  1018e9:	66 a3 a0 f4 10 00    	mov    %ax,0x10f4a0
  1018ef:	66 c7 05 a2 f4 10 00 	movw   $0x8,0x10f4a2
  1018f6:	08 00 
  1018f8:	0f b6 05 a4 f4 10 00 	movzbl 0x10f4a4,%eax
  1018ff:	83 e0 e0             	and    $0xffffffe0,%eax
  101902:	a2 a4 f4 10 00       	mov    %al,0x10f4a4
  101907:	0f b6 05 a4 f4 10 00 	movzbl 0x10f4a4,%eax
  10190e:	83 e0 1f             	and    $0x1f,%eax
  101911:	a2 a4 f4 10 00       	mov    %al,0x10f4a4
  101916:	0f b6 05 a5 f4 10 00 	movzbl 0x10f4a5,%eax
  10191d:	83 c8 0f             	or     $0xf,%eax
  101920:	a2 a5 f4 10 00       	mov    %al,0x10f4a5
  101925:	0f b6 05 a5 f4 10 00 	movzbl 0x10f4a5,%eax
  10192c:	83 e0 ef             	and    $0xffffffef,%eax
  10192f:	a2 a5 f4 10 00       	mov    %al,0x10f4a5
  101934:	0f b6 05 a5 f4 10 00 	movzbl 0x10f4a5,%eax
  10193b:	83 c8 60             	or     $0x60,%eax
  10193e:	a2 a5 f4 10 00       	mov    %al,0x10f4a5
  101943:	0f b6 05 a5 f4 10 00 	movzbl 0x10f4a5,%eax
  10194a:	83 c8 80             	or     $0xffffff80,%eax
  10194d:	a2 a5 f4 10 00       	mov    %al,0x10f4a5
  101952:	a1 e0 e7 10 00       	mov    0x10e7e0,%eax
  101957:	c1 e8 10             	shr    $0x10,%eax
  10195a:	66 a3 a6 f4 10 00    	mov    %ax,0x10f4a6
  101960:	c7 45 f8 60 e5 10 00 	movl   $0x10e560,-0x8(%ebp)
    return ebp;
}

static inline void
lidt(struct pseudodesc *pd) {
    asm volatile ("lidt (%0)" :: "r" (pd));
  101967:	8b 45 f8             	mov    -0x8(%ebp),%eax
  10196a:	0f 01 18             	lidtl  (%eax)
    lidt(&idt_pd);
}
  10196d:	c9                   	leave  
  10196e:	c3                   	ret    

0010196f <trapname>:

static const char *
trapname(int trapno) {
  10196f:	55                   	push   %ebp
  101970:	89 e5                	mov    %esp,%ebp
        "Alignment Check",
        "Machine-Check",
        "SIMD Floating-Point Exception"
    };

    if (trapno < sizeof(excnames)/sizeof(const char * const)) {
  101972:	8b 45 08             	mov    0x8(%ebp),%eax
  101975:	83 f8 13             	cmp    $0x13,%eax
  101978:	77 0c                	ja     101986 <trapname+0x17>
        return excnames[trapno];
  10197a:	8b 45 08             	mov    0x8(%ebp),%eax
  10197d:	8b 04 85 40 3b 10 00 	mov    0x103b40(,%eax,4),%eax
  101984:	eb 18                	jmp    10199e <trapname+0x2f>
    }
    if (trapno >= IRQ_OFFSET && trapno < IRQ_OFFSET + 16) {
  101986:	83 7d 08 1f          	cmpl   $0x1f,0x8(%ebp)
  10198a:	7e 0d                	jle    101999 <trapname+0x2a>
  10198c:	83 7d 08 2f          	cmpl   $0x2f,0x8(%ebp)
  101990:	7f 07                	jg     101999 <trapname+0x2a>
        return "Hardware Interrupt";
  101992:	b8 ea 37 10 00       	mov    $0x1037ea,%eax
  101997:	eb 05                	jmp    10199e <trapname+0x2f>
    }
    return "(unknown trap)";
  101999:	b8 fd 37 10 00       	mov    $0x1037fd,%eax
}
  10199e:	5d                   	pop    %ebp
  10199f:	c3                   	ret    

001019a0 <trap_in_kernel>:

/* trap_in_kernel - test if trap happened in kernel */
bool
trap_in_kernel(struct trapframe *tf) {
  1019a0:	55                   	push   %ebp
  1019a1:	89 e5                	mov    %esp,%ebp
    return (tf->tf_cs == (uint16_t)KERNEL_CS);
  1019a3:	8b 45 08             	mov    0x8(%ebp),%eax
  1019a6:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  1019aa:	66 83 f8 08          	cmp    $0x8,%ax
  1019ae:	0f 94 c0             	sete   %al
  1019b1:	0f b6 c0             	movzbl %al,%eax
}
  1019b4:	5d                   	pop    %ebp
  1019b5:	c3                   	ret    

001019b6 <print_trapframe>:
    "TF", "IF", "DF", "OF", NULL, NULL, "NT", NULL,
    "RF", "VM", "AC", "VIF", "VIP", "ID", NULL, NULL,
};

void
print_trapframe(struct trapframe *tf) {
  1019b6:	55                   	push   %ebp
  1019b7:	89 e5                	mov    %esp,%ebp
  1019b9:	83 ec 28             	sub    $0x28,%esp
    cprintf("trapframe at %p\n", tf);
  1019bc:	8b 45 08             	mov    0x8(%ebp),%eax
  1019bf:	89 44 24 04          	mov    %eax,0x4(%esp)
  1019c3:	c7 04 24 3e 38 10 00 	movl   $0x10383e,(%esp)
  1019ca:	e8 43 e9 ff ff       	call   100312 <cprintf>
    print_regs(&tf->tf_regs);
  1019cf:	8b 45 08             	mov    0x8(%ebp),%eax
  1019d2:	89 04 24             	mov    %eax,(%esp)
  1019d5:	e8 a1 01 00 00       	call   101b7b <print_regs>
    cprintf("  ds   0x----%04x\n", tf->tf_ds);
  1019da:	8b 45 08             	mov    0x8(%ebp),%eax
  1019dd:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
  1019e1:	0f b7 c0             	movzwl %ax,%eax
  1019e4:	89 44 24 04          	mov    %eax,0x4(%esp)
  1019e8:	c7 04 24 4f 38 10 00 	movl   $0x10384f,(%esp)
  1019ef:	e8 1e e9 ff ff       	call   100312 <cprintf>
    cprintf("  es   0x----%04x\n", tf->tf_es);
  1019f4:	8b 45 08             	mov    0x8(%ebp),%eax
  1019f7:	0f b7 40 28          	movzwl 0x28(%eax),%eax
  1019fb:	0f b7 c0             	movzwl %ax,%eax
  1019fe:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a02:	c7 04 24 62 38 10 00 	movl   $0x103862,(%esp)
  101a09:	e8 04 e9 ff ff       	call   100312 <cprintf>
    cprintf("  fs   0x----%04x\n", tf->tf_fs);
  101a0e:	8b 45 08             	mov    0x8(%ebp),%eax
  101a11:	0f b7 40 24          	movzwl 0x24(%eax),%eax
  101a15:	0f b7 c0             	movzwl %ax,%eax
  101a18:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a1c:	c7 04 24 75 38 10 00 	movl   $0x103875,(%esp)
  101a23:	e8 ea e8 ff ff       	call   100312 <cprintf>
    cprintf("  gs   0x----%04x\n", tf->tf_gs);
  101a28:	8b 45 08             	mov    0x8(%ebp),%eax
  101a2b:	0f b7 40 20          	movzwl 0x20(%eax),%eax
  101a2f:	0f b7 c0             	movzwl %ax,%eax
  101a32:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a36:	c7 04 24 88 38 10 00 	movl   $0x103888,(%esp)
  101a3d:	e8 d0 e8 ff ff       	call   100312 <cprintf>
    cprintf("  trap 0x%08x %s\n", tf->tf_trapno, trapname(tf->tf_trapno));
  101a42:	8b 45 08             	mov    0x8(%ebp),%eax
  101a45:	8b 40 30             	mov    0x30(%eax),%eax
  101a48:	89 04 24             	mov    %eax,(%esp)
  101a4b:	e8 1f ff ff ff       	call   10196f <trapname>
  101a50:	8b 55 08             	mov    0x8(%ebp),%edx
  101a53:	8b 52 30             	mov    0x30(%edx),%edx
  101a56:	89 44 24 08          	mov    %eax,0x8(%esp)
  101a5a:	89 54 24 04          	mov    %edx,0x4(%esp)
  101a5e:	c7 04 24 9b 38 10 00 	movl   $0x10389b,(%esp)
  101a65:	e8 a8 e8 ff ff       	call   100312 <cprintf>
    cprintf("  err  0x%08x\n", tf->tf_err);
  101a6a:	8b 45 08             	mov    0x8(%ebp),%eax
  101a6d:	8b 40 34             	mov    0x34(%eax),%eax
  101a70:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a74:	c7 04 24 ad 38 10 00 	movl   $0x1038ad,(%esp)
  101a7b:	e8 92 e8 ff ff       	call   100312 <cprintf>
    cprintf("  eip  0x%08x\n", tf->tf_eip);
  101a80:	8b 45 08             	mov    0x8(%ebp),%eax
  101a83:	8b 40 38             	mov    0x38(%eax),%eax
  101a86:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a8a:	c7 04 24 bc 38 10 00 	movl   $0x1038bc,(%esp)
  101a91:	e8 7c e8 ff ff       	call   100312 <cprintf>
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
  101a96:	8b 45 08             	mov    0x8(%ebp),%eax
  101a99:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101a9d:	0f b7 c0             	movzwl %ax,%eax
  101aa0:	89 44 24 04          	mov    %eax,0x4(%esp)
  101aa4:	c7 04 24 cb 38 10 00 	movl   $0x1038cb,(%esp)
  101aab:	e8 62 e8 ff ff       	call   100312 <cprintf>
    cprintf("  flag 0x%08x ", tf->tf_eflags);
  101ab0:	8b 45 08             	mov    0x8(%ebp),%eax
  101ab3:	8b 40 40             	mov    0x40(%eax),%eax
  101ab6:	89 44 24 04          	mov    %eax,0x4(%esp)
  101aba:	c7 04 24 de 38 10 00 	movl   $0x1038de,(%esp)
  101ac1:	e8 4c e8 ff ff       	call   100312 <cprintf>

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101ac6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  101acd:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  101ad4:	eb 3e                	jmp    101b14 <print_trapframe+0x15e>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
  101ad6:	8b 45 08             	mov    0x8(%ebp),%eax
  101ad9:	8b 50 40             	mov    0x40(%eax),%edx
  101adc:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101adf:	21 d0                	and    %edx,%eax
  101ae1:	85 c0                	test   %eax,%eax
  101ae3:	74 28                	je     101b0d <print_trapframe+0x157>
  101ae5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101ae8:	8b 04 85 80 e5 10 00 	mov    0x10e580(,%eax,4),%eax
  101aef:	85 c0                	test   %eax,%eax
  101af1:	74 1a                	je     101b0d <print_trapframe+0x157>
            cprintf("%s,", IA32flags[i]);
  101af3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101af6:	8b 04 85 80 e5 10 00 	mov    0x10e580(,%eax,4),%eax
  101afd:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b01:	c7 04 24 ed 38 10 00 	movl   $0x1038ed,(%esp)
  101b08:	e8 05 e8 ff ff       	call   100312 <cprintf>
    cprintf("  eip  0x%08x\n", tf->tf_eip);
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
    cprintf("  flag 0x%08x ", tf->tf_eflags);

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101b0d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  101b11:	d1 65 f0             	shll   -0x10(%ebp)
  101b14:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101b17:	83 f8 17             	cmp    $0x17,%eax
  101b1a:	76 ba                	jbe    101ad6 <print_trapframe+0x120>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
            cprintf("%s,", IA32flags[i]);
        }
    }
    cprintf("IOPL=%d\n", (tf->tf_eflags & FL_IOPL_MASK) >> 12);
  101b1c:	8b 45 08             	mov    0x8(%ebp),%eax
  101b1f:	8b 40 40             	mov    0x40(%eax),%eax
  101b22:	25 00 30 00 00       	and    $0x3000,%eax
  101b27:	c1 e8 0c             	shr    $0xc,%eax
  101b2a:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b2e:	c7 04 24 f1 38 10 00 	movl   $0x1038f1,(%esp)
  101b35:	e8 d8 e7 ff ff       	call   100312 <cprintf>

    if (!trap_in_kernel(tf)) {
  101b3a:	8b 45 08             	mov    0x8(%ebp),%eax
  101b3d:	89 04 24             	mov    %eax,(%esp)
  101b40:	e8 5b fe ff ff       	call   1019a0 <trap_in_kernel>
  101b45:	85 c0                	test   %eax,%eax
  101b47:	75 30                	jne    101b79 <print_trapframe+0x1c3>
        cprintf("  esp  0x%08x\n", tf->tf_esp);
  101b49:	8b 45 08             	mov    0x8(%ebp),%eax
  101b4c:	8b 40 44             	mov    0x44(%eax),%eax
  101b4f:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b53:	c7 04 24 fa 38 10 00 	movl   $0x1038fa,(%esp)
  101b5a:	e8 b3 e7 ff ff       	call   100312 <cprintf>
        cprintf("  ss   0x----%04x\n", tf->tf_ss);
  101b5f:	8b 45 08             	mov    0x8(%ebp),%eax
  101b62:	0f b7 40 48          	movzwl 0x48(%eax),%eax
  101b66:	0f b7 c0             	movzwl %ax,%eax
  101b69:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b6d:	c7 04 24 09 39 10 00 	movl   $0x103909,(%esp)
  101b74:	e8 99 e7 ff ff       	call   100312 <cprintf>
    }
}
  101b79:	c9                   	leave  
  101b7a:	c3                   	ret    

00101b7b <print_regs>:

void
print_regs(struct pushregs *regs) {
  101b7b:	55                   	push   %ebp
  101b7c:	89 e5                	mov    %esp,%ebp
  101b7e:	83 ec 18             	sub    $0x18,%esp
    cprintf("  edi  0x%08x\n", regs->reg_edi);
  101b81:	8b 45 08             	mov    0x8(%ebp),%eax
  101b84:	8b 00                	mov    (%eax),%eax
  101b86:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b8a:	c7 04 24 1c 39 10 00 	movl   $0x10391c,(%esp)
  101b91:	e8 7c e7 ff ff       	call   100312 <cprintf>
    cprintf("  esi  0x%08x\n", regs->reg_esi);
  101b96:	8b 45 08             	mov    0x8(%ebp),%eax
  101b99:	8b 40 04             	mov    0x4(%eax),%eax
  101b9c:	89 44 24 04          	mov    %eax,0x4(%esp)
  101ba0:	c7 04 24 2b 39 10 00 	movl   $0x10392b,(%esp)
  101ba7:	e8 66 e7 ff ff       	call   100312 <cprintf>
    cprintf("  ebp  0x%08x\n", regs->reg_ebp);
  101bac:	8b 45 08             	mov    0x8(%ebp),%eax
  101baf:	8b 40 08             	mov    0x8(%eax),%eax
  101bb2:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bb6:	c7 04 24 3a 39 10 00 	movl   $0x10393a,(%esp)
  101bbd:	e8 50 e7 ff ff       	call   100312 <cprintf>
    cprintf("  oesp 0x%08x\n", regs->reg_oesp);
  101bc2:	8b 45 08             	mov    0x8(%ebp),%eax
  101bc5:	8b 40 0c             	mov    0xc(%eax),%eax
  101bc8:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bcc:	c7 04 24 49 39 10 00 	movl   $0x103949,(%esp)
  101bd3:	e8 3a e7 ff ff       	call   100312 <cprintf>
    cprintf("  ebx  0x%08x\n", regs->reg_ebx);
  101bd8:	8b 45 08             	mov    0x8(%ebp),%eax
  101bdb:	8b 40 10             	mov    0x10(%eax),%eax
  101bde:	89 44 24 04          	mov    %eax,0x4(%esp)
  101be2:	c7 04 24 58 39 10 00 	movl   $0x103958,(%esp)
  101be9:	e8 24 e7 ff ff       	call   100312 <cprintf>
    cprintf("  edx  0x%08x\n", regs->reg_edx);
  101bee:	8b 45 08             	mov    0x8(%ebp),%eax
  101bf1:	8b 40 14             	mov    0x14(%eax),%eax
  101bf4:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bf8:	c7 04 24 67 39 10 00 	movl   $0x103967,(%esp)
  101bff:	e8 0e e7 ff ff       	call   100312 <cprintf>
    cprintf("  ecx  0x%08x\n", regs->reg_ecx);
  101c04:	8b 45 08             	mov    0x8(%ebp),%eax
  101c07:	8b 40 18             	mov    0x18(%eax),%eax
  101c0a:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c0e:	c7 04 24 76 39 10 00 	movl   $0x103976,(%esp)
  101c15:	e8 f8 e6 ff ff       	call   100312 <cprintf>
    cprintf("  eax  0x%08x\n", regs->reg_eax);
  101c1a:	8b 45 08             	mov    0x8(%ebp),%eax
  101c1d:	8b 40 1c             	mov    0x1c(%eax),%eax
  101c20:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c24:	c7 04 24 85 39 10 00 	movl   $0x103985,(%esp)
  101c2b:	e8 e2 e6 ff ff       	call   100312 <cprintf>
}
  101c30:	c9                   	leave  
  101c31:	c3                   	ret    

00101c32 <trap_dispatch>:

/* trap_dispatch - dispatch based on what type of trap occurred */
static void
trap_dispatch(struct trapframe *tf) {
  101c32:	55                   	push   %ebp
  101c33:	89 e5                	mov    %esp,%ebp
  101c35:	83 ec 28             	sub    $0x28,%esp
    char c;
    static int ticks_time;
    switch (tf->tf_trapno) {
  101c38:	8b 45 08             	mov    0x8(%ebp),%eax
  101c3b:	8b 40 30             	mov    0x30(%eax),%eax
  101c3e:	83 f8 2f             	cmp    $0x2f,%eax
  101c41:	77 21                	ja     101c64 <trap_dispatch+0x32>
  101c43:	83 f8 2e             	cmp    $0x2e,%eax
  101c46:	0f 83 0b 01 00 00    	jae    101d57 <trap_dispatch+0x125>
  101c4c:	83 f8 21             	cmp    $0x21,%eax
  101c4f:	0f 84 88 00 00 00    	je     101cdd <trap_dispatch+0xab>
  101c55:	83 f8 24             	cmp    $0x24,%eax
  101c58:	74 5d                	je     101cb7 <trap_dispatch+0x85>
  101c5a:	83 f8 20             	cmp    $0x20,%eax
  101c5d:	74 16                	je     101c75 <trap_dispatch+0x43>
  101c5f:	e9 bb 00 00 00       	jmp    101d1f <trap_dispatch+0xed>
  101c64:	83 e8 78             	sub    $0x78,%eax
  101c67:	83 f8 01             	cmp    $0x1,%eax
  101c6a:	0f 87 af 00 00 00    	ja     101d1f <trap_dispatch+0xed>
  101c70:	e9 8e 00 00 00       	jmp    101d03 <trap_dispatch+0xd1>
        /* handle the timer interrupt */
        /* (1) After a timer interrupt, you should record this event using a global variable (increase it), such as ticks in kern/driver/clock.c
         * (2) Every TICK_NUM cycle, you can print some info using a funciton, such as print_ticks().
         * (3) Too Simple? Yes, I think so!
         */
        ticks_time++;
  101c75:	a1 a0 f8 10 00       	mov    0x10f8a0,%eax
  101c7a:	83 c0 01             	add    $0x1,%eax
  101c7d:	a3 a0 f8 10 00       	mov    %eax,0x10f8a0
	    if (ticks_time % TICK_NUM == 0)
  101c82:	8b 0d a0 f8 10 00    	mov    0x10f8a0,%ecx
  101c88:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
  101c8d:	89 c8                	mov    %ecx,%eax
  101c8f:	f7 ea                	imul   %edx
  101c91:	c1 fa 05             	sar    $0x5,%edx
  101c94:	89 c8                	mov    %ecx,%eax
  101c96:	c1 f8 1f             	sar    $0x1f,%eax
  101c99:	29 c2                	sub    %eax,%edx
  101c9b:	89 d0                	mov    %edx,%eax
  101c9d:	6b c0 64             	imul   $0x64,%eax,%eax
  101ca0:	29 c1                	sub    %eax,%ecx
  101ca2:	89 c8                	mov    %ecx,%eax
  101ca4:	85 c0                	test   %eax,%eax
  101ca6:	75 0a                	jne    101cb2 <trap_dispatch+0x80>
	        print_ticks();
  101ca8:	e8 39 fb ff ff       	call   1017e6 <print_ticks>
        break;
  101cad:	e9 a6 00 00 00       	jmp    101d58 <trap_dispatch+0x126>
  101cb2:	e9 a1 00 00 00       	jmp    101d58 <trap_dispatch+0x126>
    case IRQ_OFFSET + IRQ_COM1:
        c = cons_getc();
  101cb7:	e8 01 f9 ff ff       	call   1015bd <cons_getc>
  101cbc:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("serial [%03d] %c\n", c, c);
  101cbf:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101cc3:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101cc7:	89 54 24 08          	mov    %edx,0x8(%esp)
  101ccb:	89 44 24 04          	mov    %eax,0x4(%esp)
  101ccf:	c7 04 24 94 39 10 00 	movl   $0x103994,(%esp)
  101cd6:	e8 37 e6 ff ff       	call   100312 <cprintf>
        break;
  101cdb:	eb 7b                	jmp    101d58 <trap_dispatch+0x126>
    case IRQ_OFFSET + IRQ_KBD:
        c = cons_getc();
  101cdd:	e8 db f8 ff ff       	call   1015bd <cons_getc>
  101ce2:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("kbd [%03d] %c\n", c, c);
  101ce5:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101ce9:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101ced:	89 54 24 08          	mov    %edx,0x8(%esp)
  101cf1:	89 44 24 04          	mov    %eax,0x4(%esp)
  101cf5:	c7 04 24 a6 39 10 00 	movl   $0x1039a6,(%esp)
  101cfc:	e8 11 e6 ff ff       	call   100312 <cprintf>
        break;
  101d01:	eb 55                	jmp    101d58 <trap_dispatch+0x126>
    //LAB1 CHALLENGE 1 : YOUR CODE you should modify below codes.
    case T_SWITCH_TOU:
    case T_SWITCH_TOK:
        panic("T_SWITCH_** ??\n");
  101d03:	c7 44 24 08 b5 39 10 	movl   $0x1039b5,0x8(%esp)
  101d0a:	00 
  101d0b:	c7 44 24 04 ab 00 00 	movl   $0xab,0x4(%esp)
  101d12:	00 
  101d13:	c7 04 24 c5 39 10 00 	movl   $0x1039c5,(%esp)
  101d1a:	e8 80 ef ff ff       	call   100c9f <__panic>
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
    default:
        // in kernel, it must be a mistake
        if ((tf->tf_cs & 3) == 0) {
  101d1f:	8b 45 08             	mov    0x8(%ebp),%eax
  101d22:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101d26:	0f b7 c0             	movzwl %ax,%eax
  101d29:	83 e0 03             	and    $0x3,%eax
  101d2c:	85 c0                	test   %eax,%eax
  101d2e:	75 28                	jne    101d58 <trap_dispatch+0x126>
            print_trapframe(tf);
  101d30:	8b 45 08             	mov    0x8(%ebp),%eax
  101d33:	89 04 24             	mov    %eax,(%esp)
  101d36:	e8 7b fc ff ff       	call   1019b6 <print_trapframe>
            panic("unexpected trap in kernel.\n");
  101d3b:	c7 44 24 08 d6 39 10 	movl   $0x1039d6,0x8(%esp)
  101d42:	00 
  101d43:	c7 44 24 04 b5 00 00 	movl   $0xb5,0x4(%esp)
  101d4a:	00 
  101d4b:	c7 04 24 c5 39 10 00 	movl   $0x1039c5,(%esp)
  101d52:	e8 48 ef ff ff       	call   100c9f <__panic>
        panic("T_SWITCH_** ??\n");
        break;
    case IRQ_OFFSET + IRQ_IDE1:
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
  101d57:	90                   	nop
        if ((tf->tf_cs & 3) == 0) {
            print_trapframe(tf);
            panic("unexpected trap in kernel.\n");
        }
    }
}
  101d58:	c9                   	leave  
  101d59:	c3                   	ret    

00101d5a <trap>:
 * trap - handles or dispatches an exception/interrupt. if and when trap() returns,
 * the code in kern/trap/trapentry.S restores the old CPU state saved in the
 * trapframe and then uses the iret instruction to return from the exception.
 * */
void
trap(struct trapframe *tf) {
  101d5a:	55                   	push   %ebp
  101d5b:	89 e5                	mov    %esp,%ebp
  101d5d:	83 ec 18             	sub    $0x18,%esp
    // dispatch based on what type of trap occurred
    trap_dispatch(tf);
  101d60:	8b 45 08             	mov    0x8(%ebp),%eax
  101d63:	89 04 24             	mov    %eax,(%esp)
  101d66:	e8 c7 fe ff ff       	call   101c32 <trap_dispatch>
}
  101d6b:	c9                   	leave  
  101d6c:	c3                   	ret    

00101d6d <__alltraps>:
.text
.globl __alltraps
__alltraps:
    # push registers to build a trap frame
    # therefore make the stack look like a struct trapframe
    pushl %ds
  101d6d:	1e                   	push   %ds
    pushl %es
  101d6e:	06                   	push   %es
    pushl %fs
  101d6f:	0f a0                	push   %fs
    pushl %gs
  101d71:	0f a8                	push   %gs
    pushal
  101d73:	60                   	pusha  

    # load GD_KDATA into %ds and %es to set up data segments for kernel
    movl $GD_KDATA, %eax
  101d74:	b8 10 00 00 00       	mov    $0x10,%eax
    movw %ax, %ds
  101d79:	8e d8                	mov    %eax,%ds
    movw %ax, %es
  101d7b:	8e c0                	mov    %eax,%es

    # push %esp to pass a pointer to the trapframe as an argument to trap()
    pushl %esp
  101d7d:	54                   	push   %esp

    # call trap(tf), where tf=%esp
    call trap
  101d7e:	e8 d7 ff ff ff       	call   101d5a <trap>

    # pop the pushed stack pointer
    popl %esp
  101d83:	5c                   	pop    %esp

00101d84 <__trapret>:

    # return falls through to trapret...
.globl __trapret
__trapret:
    # restore registers from stack
    popal
  101d84:	61                   	popa   

    # restore %ds, %es, %fs and %gs
    popl %gs
  101d85:	0f a9                	pop    %gs
    popl %fs
  101d87:	0f a1                	pop    %fs
    popl %es
  101d89:	07                   	pop    %es
    popl %ds
  101d8a:	1f                   	pop    %ds

    # get rid of the trap number and error code
    addl $0x8, %esp
  101d8b:	83 c4 08             	add    $0x8,%esp
    iret
  101d8e:	cf                   	iret   

00101d8f <vector0>:
# handler
.text
.globl __alltraps
.globl vector0
vector0:
  pushl $0
  101d8f:	6a 00                	push   $0x0
  pushl $0
  101d91:	6a 00                	push   $0x0
  jmp __alltraps
  101d93:	e9 d5 ff ff ff       	jmp    101d6d <__alltraps>

00101d98 <vector1>:
.globl vector1
vector1:
  pushl $0
  101d98:	6a 00                	push   $0x0
  pushl $1
  101d9a:	6a 01                	push   $0x1
  jmp __alltraps
  101d9c:	e9 cc ff ff ff       	jmp    101d6d <__alltraps>

00101da1 <vector2>:
.globl vector2
vector2:
  pushl $0
  101da1:	6a 00                	push   $0x0
  pushl $2
  101da3:	6a 02                	push   $0x2
  jmp __alltraps
  101da5:	e9 c3 ff ff ff       	jmp    101d6d <__alltraps>

00101daa <vector3>:
.globl vector3
vector3:
  pushl $0
  101daa:	6a 00                	push   $0x0
  pushl $3
  101dac:	6a 03                	push   $0x3
  jmp __alltraps
  101dae:	e9 ba ff ff ff       	jmp    101d6d <__alltraps>

00101db3 <vector4>:
.globl vector4
vector4:
  pushl $0
  101db3:	6a 00                	push   $0x0
  pushl $4
  101db5:	6a 04                	push   $0x4
  jmp __alltraps
  101db7:	e9 b1 ff ff ff       	jmp    101d6d <__alltraps>

00101dbc <vector5>:
.globl vector5
vector5:
  pushl $0
  101dbc:	6a 00                	push   $0x0
  pushl $5
  101dbe:	6a 05                	push   $0x5
  jmp __alltraps
  101dc0:	e9 a8 ff ff ff       	jmp    101d6d <__alltraps>

00101dc5 <vector6>:
.globl vector6
vector6:
  pushl $0
  101dc5:	6a 00                	push   $0x0
  pushl $6
  101dc7:	6a 06                	push   $0x6
  jmp __alltraps
  101dc9:	e9 9f ff ff ff       	jmp    101d6d <__alltraps>

00101dce <vector7>:
.globl vector7
vector7:
  pushl $0
  101dce:	6a 00                	push   $0x0
  pushl $7
  101dd0:	6a 07                	push   $0x7
  jmp __alltraps
  101dd2:	e9 96 ff ff ff       	jmp    101d6d <__alltraps>

00101dd7 <vector8>:
.globl vector8
vector8:
  pushl $8
  101dd7:	6a 08                	push   $0x8
  jmp __alltraps
  101dd9:	e9 8f ff ff ff       	jmp    101d6d <__alltraps>

00101dde <vector9>:
.globl vector9
vector9:
  pushl $9
  101dde:	6a 09                	push   $0x9
  jmp __alltraps
  101de0:	e9 88 ff ff ff       	jmp    101d6d <__alltraps>

00101de5 <vector10>:
.globl vector10
vector10:
  pushl $10
  101de5:	6a 0a                	push   $0xa
  jmp __alltraps
  101de7:	e9 81 ff ff ff       	jmp    101d6d <__alltraps>

00101dec <vector11>:
.globl vector11
vector11:
  pushl $11
  101dec:	6a 0b                	push   $0xb
  jmp __alltraps
  101dee:	e9 7a ff ff ff       	jmp    101d6d <__alltraps>

00101df3 <vector12>:
.globl vector12
vector12:
  pushl $12
  101df3:	6a 0c                	push   $0xc
  jmp __alltraps
  101df5:	e9 73 ff ff ff       	jmp    101d6d <__alltraps>

00101dfa <vector13>:
.globl vector13
vector13:
  pushl $13
  101dfa:	6a 0d                	push   $0xd
  jmp __alltraps
  101dfc:	e9 6c ff ff ff       	jmp    101d6d <__alltraps>

00101e01 <vector14>:
.globl vector14
vector14:
  pushl $14
  101e01:	6a 0e                	push   $0xe
  jmp __alltraps
  101e03:	e9 65 ff ff ff       	jmp    101d6d <__alltraps>

00101e08 <vector15>:
.globl vector15
vector15:
  pushl $0
  101e08:	6a 00                	push   $0x0
  pushl $15
  101e0a:	6a 0f                	push   $0xf
  jmp __alltraps
  101e0c:	e9 5c ff ff ff       	jmp    101d6d <__alltraps>

00101e11 <vector16>:
.globl vector16
vector16:
  pushl $0
  101e11:	6a 00                	push   $0x0
  pushl $16
  101e13:	6a 10                	push   $0x10
  jmp __alltraps
  101e15:	e9 53 ff ff ff       	jmp    101d6d <__alltraps>

00101e1a <vector17>:
.globl vector17
vector17:
  pushl $17
  101e1a:	6a 11                	push   $0x11
  jmp __alltraps
  101e1c:	e9 4c ff ff ff       	jmp    101d6d <__alltraps>

00101e21 <vector18>:
.globl vector18
vector18:
  pushl $0
  101e21:	6a 00                	push   $0x0
  pushl $18
  101e23:	6a 12                	push   $0x12
  jmp __alltraps
  101e25:	e9 43 ff ff ff       	jmp    101d6d <__alltraps>

00101e2a <vector19>:
.globl vector19
vector19:
  pushl $0
  101e2a:	6a 00                	push   $0x0
  pushl $19
  101e2c:	6a 13                	push   $0x13
  jmp __alltraps
  101e2e:	e9 3a ff ff ff       	jmp    101d6d <__alltraps>

00101e33 <vector20>:
.globl vector20
vector20:
  pushl $0
  101e33:	6a 00                	push   $0x0
  pushl $20
  101e35:	6a 14                	push   $0x14
  jmp __alltraps
  101e37:	e9 31 ff ff ff       	jmp    101d6d <__alltraps>

00101e3c <vector21>:
.globl vector21
vector21:
  pushl $0
  101e3c:	6a 00                	push   $0x0
  pushl $21
  101e3e:	6a 15                	push   $0x15
  jmp __alltraps
  101e40:	e9 28 ff ff ff       	jmp    101d6d <__alltraps>

00101e45 <vector22>:
.globl vector22
vector22:
  pushl $0
  101e45:	6a 00                	push   $0x0
  pushl $22
  101e47:	6a 16                	push   $0x16
  jmp __alltraps
  101e49:	e9 1f ff ff ff       	jmp    101d6d <__alltraps>

00101e4e <vector23>:
.globl vector23
vector23:
  pushl $0
  101e4e:	6a 00                	push   $0x0
  pushl $23
  101e50:	6a 17                	push   $0x17
  jmp __alltraps
  101e52:	e9 16 ff ff ff       	jmp    101d6d <__alltraps>

00101e57 <vector24>:
.globl vector24
vector24:
  pushl $0
  101e57:	6a 00                	push   $0x0
  pushl $24
  101e59:	6a 18                	push   $0x18
  jmp __alltraps
  101e5b:	e9 0d ff ff ff       	jmp    101d6d <__alltraps>

00101e60 <vector25>:
.globl vector25
vector25:
  pushl $0
  101e60:	6a 00                	push   $0x0
  pushl $25
  101e62:	6a 19                	push   $0x19
  jmp __alltraps
  101e64:	e9 04 ff ff ff       	jmp    101d6d <__alltraps>

00101e69 <vector26>:
.globl vector26
vector26:
  pushl $0
  101e69:	6a 00                	push   $0x0
  pushl $26
  101e6b:	6a 1a                	push   $0x1a
  jmp __alltraps
  101e6d:	e9 fb fe ff ff       	jmp    101d6d <__alltraps>

00101e72 <vector27>:
.globl vector27
vector27:
  pushl $0
  101e72:	6a 00                	push   $0x0
  pushl $27
  101e74:	6a 1b                	push   $0x1b
  jmp __alltraps
  101e76:	e9 f2 fe ff ff       	jmp    101d6d <__alltraps>

00101e7b <vector28>:
.globl vector28
vector28:
  pushl $0
  101e7b:	6a 00                	push   $0x0
  pushl $28
  101e7d:	6a 1c                	push   $0x1c
  jmp __alltraps
  101e7f:	e9 e9 fe ff ff       	jmp    101d6d <__alltraps>

00101e84 <vector29>:
.globl vector29
vector29:
  pushl $0
  101e84:	6a 00                	push   $0x0
  pushl $29
  101e86:	6a 1d                	push   $0x1d
  jmp __alltraps
  101e88:	e9 e0 fe ff ff       	jmp    101d6d <__alltraps>

00101e8d <vector30>:
.globl vector30
vector30:
  pushl $0
  101e8d:	6a 00                	push   $0x0
  pushl $30
  101e8f:	6a 1e                	push   $0x1e
  jmp __alltraps
  101e91:	e9 d7 fe ff ff       	jmp    101d6d <__alltraps>

00101e96 <vector31>:
.globl vector31
vector31:
  pushl $0
  101e96:	6a 00                	push   $0x0
  pushl $31
  101e98:	6a 1f                	push   $0x1f
  jmp __alltraps
  101e9a:	e9 ce fe ff ff       	jmp    101d6d <__alltraps>

00101e9f <vector32>:
.globl vector32
vector32:
  pushl $0
  101e9f:	6a 00                	push   $0x0
  pushl $32
  101ea1:	6a 20                	push   $0x20
  jmp __alltraps
  101ea3:	e9 c5 fe ff ff       	jmp    101d6d <__alltraps>

00101ea8 <vector33>:
.globl vector33
vector33:
  pushl $0
  101ea8:	6a 00                	push   $0x0
  pushl $33
  101eaa:	6a 21                	push   $0x21
  jmp __alltraps
  101eac:	e9 bc fe ff ff       	jmp    101d6d <__alltraps>

00101eb1 <vector34>:
.globl vector34
vector34:
  pushl $0
  101eb1:	6a 00                	push   $0x0
  pushl $34
  101eb3:	6a 22                	push   $0x22
  jmp __alltraps
  101eb5:	e9 b3 fe ff ff       	jmp    101d6d <__alltraps>

00101eba <vector35>:
.globl vector35
vector35:
  pushl $0
  101eba:	6a 00                	push   $0x0
  pushl $35
  101ebc:	6a 23                	push   $0x23
  jmp __alltraps
  101ebe:	e9 aa fe ff ff       	jmp    101d6d <__alltraps>

00101ec3 <vector36>:
.globl vector36
vector36:
  pushl $0
  101ec3:	6a 00                	push   $0x0
  pushl $36
  101ec5:	6a 24                	push   $0x24
  jmp __alltraps
  101ec7:	e9 a1 fe ff ff       	jmp    101d6d <__alltraps>

00101ecc <vector37>:
.globl vector37
vector37:
  pushl $0
  101ecc:	6a 00                	push   $0x0
  pushl $37
  101ece:	6a 25                	push   $0x25
  jmp __alltraps
  101ed0:	e9 98 fe ff ff       	jmp    101d6d <__alltraps>

00101ed5 <vector38>:
.globl vector38
vector38:
  pushl $0
  101ed5:	6a 00                	push   $0x0
  pushl $38
  101ed7:	6a 26                	push   $0x26
  jmp __alltraps
  101ed9:	e9 8f fe ff ff       	jmp    101d6d <__alltraps>

00101ede <vector39>:
.globl vector39
vector39:
  pushl $0
  101ede:	6a 00                	push   $0x0
  pushl $39
  101ee0:	6a 27                	push   $0x27
  jmp __alltraps
  101ee2:	e9 86 fe ff ff       	jmp    101d6d <__alltraps>

00101ee7 <vector40>:
.globl vector40
vector40:
  pushl $0
  101ee7:	6a 00                	push   $0x0
  pushl $40
  101ee9:	6a 28                	push   $0x28
  jmp __alltraps
  101eeb:	e9 7d fe ff ff       	jmp    101d6d <__alltraps>

00101ef0 <vector41>:
.globl vector41
vector41:
  pushl $0
  101ef0:	6a 00                	push   $0x0
  pushl $41
  101ef2:	6a 29                	push   $0x29
  jmp __alltraps
  101ef4:	e9 74 fe ff ff       	jmp    101d6d <__alltraps>

00101ef9 <vector42>:
.globl vector42
vector42:
  pushl $0
  101ef9:	6a 00                	push   $0x0
  pushl $42
  101efb:	6a 2a                	push   $0x2a
  jmp __alltraps
  101efd:	e9 6b fe ff ff       	jmp    101d6d <__alltraps>

00101f02 <vector43>:
.globl vector43
vector43:
  pushl $0
  101f02:	6a 00                	push   $0x0
  pushl $43
  101f04:	6a 2b                	push   $0x2b
  jmp __alltraps
  101f06:	e9 62 fe ff ff       	jmp    101d6d <__alltraps>

00101f0b <vector44>:
.globl vector44
vector44:
  pushl $0
  101f0b:	6a 00                	push   $0x0
  pushl $44
  101f0d:	6a 2c                	push   $0x2c
  jmp __alltraps
  101f0f:	e9 59 fe ff ff       	jmp    101d6d <__alltraps>

00101f14 <vector45>:
.globl vector45
vector45:
  pushl $0
  101f14:	6a 00                	push   $0x0
  pushl $45
  101f16:	6a 2d                	push   $0x2d
  jmp __alltraps
  101f18:	e9 50 fe ff ff       	jmp    101d6d <__alltraps>

00101f1d <vector46>:
.globl vector46
vector46:
  pushl $0
  101f1d:	6a 00                	push   $0x0
  pushl $46
  101f1f:	6a 2e                	push   $0x2e
  jmp __alltraps
  101f21:	e9 47 fe ff ff       	jmp    101d6d <__alltraps>

00101f26 <vector47>:
.globl vector47
vector47:
  pushl $0
  101f26:	6a 00                	push   $0x0
  pushl $47
  101f28:	6a 2f                	push   $0x2f
  jmp __alltraps
  101f2a:	e9 3e fe ff ff       	jmp    101d6d <__alltraps>

00101f2f <vector48>:
.globl vector48
vector48:
  pushl $0
  101f2f:	6a 00                	push   $0x0
  pushl $48
  101f31:	6a 30                	push   $0x30
  jmp __alltraps
  101f33:	e9 35 fe ff ff       	jmp    101d6d <__alltraps>

00101f38 <vector49>:
.globl vector49
vector49:
  pushl $0
  101f38:	6a 00                	push   $0x0
  pushl $49
  101f3a:	6a 31                	push   $0x31
  jmp __alltraps
  101f3c:	e9 2c fe ff ff       	jmp    101d6d <__alltraps>

00101f41 <vector50>:
.globl vector50
vector50:
  pushl $0
  101f41:	6a 00                	push   $0x0
  pushl $50
  101f43:	6a 32                	push   $0x32
  jmp __alltraps
  101f45:	e9 23 fe ff ff       	jmp    101d6d <__alltraps>

00101f4a <vector51>:
.globl vector51
vector51:
  pushl $0
  101f4a:	6a 00                	push   $0x0
  pushl $51
  101f4c:	6a 33                	push   $0x33
  jmp __alltraps
  101f4e:	e9 1a fe ff ff       	jmp    101d6d <__alltraps>

00101f53 <vector52>:
.globl vector52
vector52:
  pushl $0
  101f53:	6a 00                	push   $0x0
  pushl $52
  101f55:	6a 34                	push   $0x34
  jmp __alltraps
  101f57:	e9 11 fe ff ff       	jmp    101d6d <__alltraps>

00101f5c <vector53>:
.globl vector53
vector53:
  pushl $0
  101f5c:	6a 00                	push   $0x0
  pushl $53
  101f5e:	6a 35                	push   $0x35
  jmp __alltraps
  101f60:	e9 08 fe ff ff       	jmp    101d6d <__alltraps>

00101f65 <vector54>:
.globl vector54
vector54:
  pushl $0
  101f65:	6a 00                	push   $0x0
  pushl $54
  101f67:	6a 36                	push   $0x36
  jmp __alltraps
  101f69:	e9 ff fd ff ff       	jmp    101d6d <__alltraps>

00101f6e <vector55>:
.globl vector55
vector55:
  pushl $0
  101f6e:	6a 00                	push   $0x0
  pushl $55
  101f70:	6a 37                	push   $0x37
  jmp __alltraps
  101f72:	e9 f6 fd ff ff       	jmp    101d6d <__alltraps>

00101f77 <vector56>:
.globl vector56
vector56:
  pushl $0
  101f77:	6a 00                	push   $0x0
  pushl $56
  101f79:	6a 38                	push   $0x38
  jmp __alltraps
  101f7b:	e9 ed fd ff ff       	jmp    101d6d <__alltraps>

00101f80 <vector57>:
.globl vector57
vector57:
  pushl $0
  101f80:	6a 00                	push   $0x0
  pushl $57
  101f82:	6a 39                	push   $0x39
  jmp __alltraps
  101f84:	e9 e4 fd ff ff       	jmp    101d6d <__alltraps>

00101f89 <vector58>:
.globl vector58
vector58:
  pushl $0
  101f89:	6a 00                	push   $0x0
  pushl $58
  101f8b:	6a 3a                	push   $0x3a
  jmp __alltraps
  101f8d:	e9 db fd ff ff       	jmp    101d6d <__alltraps>

00101f92 <vector59>:
.globl vector59
vector59:
  pushl $0
  101f92:	6a 00                	push   $0x0
  pushl $59
  101f94:	6a 3b                	push   $0x3b
  jmp __alltraps
  101f96:	e9 d2 fd ff ff       	jmp    101d6d <__alltraps>

00101f9b <vector60>:
.globl vector60
vector60:
  pushl $0
  101f9b:	6a 00                	push   $0x0
  pushl $60
  101f9d:	6a 3c                	push   $0x3c
  jmp __alltraps
  101f9f:	e9 c9 fd ff ff       	jmp    101d6d <__alltraps>

00101fa4 <vector61>:
.globl vector61
vector61:
  pushl $0
  101fa4:	6a 00                	push   $0x0
  pushl $61
  101fa6:	6a 3d                	push   $0x3d
  jmp __alltraps
  101fa8:	e9 c0 fd ff ff       	jmp    101d6d <__alltraps>

00101fad <vector62>:
.globl vector62
vector62:
  pushl $0
  101fad:	6a 00                	push   $0x0
  pushl $62
  101faf:	6a 3e                	push   $0x3e
  jmp __alltraps
  101fb1:	e9 b7 fd ff ff       	jmp    101d6d <__alltraps>

00101fb6 <vector63>:
.globl vector63
vector63:
  pushl $0
  101fb6:	6a 00                	push   $0x0
  pushl $63
  101fb8:	6a 3f                	push   $0x3f
  jmp __alltraps
  101fba:	e9 ae fd ff ff       	jmp    101d6d <__alltraps>

00101fbf <vector64>:
.globl vector64
vector64:
  pushl $0
  101fbf:	6a 00                	push   $0x0
  pushl $64
  101fc1:	6a 40                	push   $0x40
  jmp __alltraps
  101fc3:	e9 a5 fd ff ff       	jmp    101d6d <__alltraps>

00101fc8 <vector65>:
.globl vector65
vector65:
  pushl $0
  101fc8:	6a 00                	push   $0x0
  pushl $65
  101fca:	6a 41                	push   $0x41
  jmp __alltraps
  101fcc:	e9 9c fd ff ff       	jmp    101d6d <__alltraps>

00101fd1 <vector66>:
.globl vector66
vector66:
  pushl $0
  101fd1:	6a 00                	push   $0x0
  pushl $66
  101fd3:	6a 42                	push   $0x42
  jmp __alltraps
  101fd5:	e9 93 fd ff ff       	jmp    101d6d <__alltraps>

00101fda <vector67>:
.globl vector67
vector67:
  pushl $0
  101fda:	6a 00                	push   $0x0
  pushl $67
  101fdc:	6a 43                	push   $0x43
  jmp __alltraps
  101fde:	e9 8a fd ff ff       	jmp    101d6d <__alltraps>

00101fe3 <vector68>:
.globl vector68
vector68:
  pushl $0
  101fe3:	6a 00                	push   $0x0
  pushl $68
  101fe5:	6a 44                	push   $0x44
  jmp __alltraps
  101fe7:	e9 81 fd ff ff       	jmp    101d6d <__alltraps>

00101fec <vector69>:
.globl vector69
vector69:
  pushl $0
  101fec:	6a 00                	push   $0x0
  pushl $69
  101fee:	6a 45                	push   $0x45
  jmp __alltraps
  101ff0:	e9 78 fd ff ff       	jmp    101d6d <__alltraps>

00101ff5 <vector70>:
.globl vector70
vector70:
  pushl $0
  101ff5:	6a 00                	push   $0x0
  pushl $70
  101ff7:	6a 46                	push   $0x46
  jmp __alltraps
  101ff9:	e9 6f fd ff ff       	jmp    101d6d <__alltraps>

00101ffe <vector71>:
.globl vector71
vector71:
  pushl $0
  101ffe:	6a 00                	push   $0x0
  pushl $71
  102000:	6a 47                	push   $0x47
  jmp __alltraps
  102002:	e9 66 fd ff ff       	jmp    101d6d <__alltraps>

00102007 <vector72>:
.globl vector72
vector72:
  pushl $0
  102007:	6a 00                	push   $0x0
  pushl $72
  102009:	6a 48                	push   $0x48
  jmp __alltraps
  10200b:	e9 5d fd ff ff       	jmp    101d6d <__alltraps>

00102010 <vector73>:
.globl vector73
vector73:
  pushl $0
  102010:	6a 00                	push   $0x0
  pushl $73
  102012:	6a 49                	push   $0x49
  jmp __alltraps
  102014:	e9 54 fd ff ff       	jmp    101d6d <__alltraps>

00102019 <vector74>:
.globl vector74
vector74:
  pushl $0
  102019:	6a 00                	push   $0x0
  pushl $74
  10201b:	6a 4a                	push   $0x4a
  jmp __alltraps
  10201d:	e9 4b fd ff ff       	jmp    101d6d <__alltraps>

00102022 <vector75>:
.globl vector75
vector75:
  pushl $0
  102022:	6a 00                	push   $0x0
  pushl $75
  102024:	6a 4b                	push   $0x4b
  jmp __alltraps
  102026:	e9 42 fd ff ff       	jmp    101d6d <__alltraps>

0010202b <vector76>:
.globl vector76
vector76:
  pushl $0
  10202b:	6a 00                	push   $0x0
  pushl $76
  10202d:	6a 4c                	push   $0x4c
  jmp __alltraps
  10202f:	e9 39 fd ff ff       	jmp    101d6d <__alltraps>

00102034 <vector77>:
.globl vector77
vector77:
  pushl $0
  102034:	6a 00                	push   $0x0
  pushl $77
  102036:	6a 4d                	push   $0x4d
  jmp __alltraps
  102038:	e9 30 fd ff ff       	jmp    101d6d <__alltraps>

0010203d <vector78>:
.globl vector78
vector78:
  pushl $0
  10203d:	6a 00                	push   $0x0
  pushl $78
  10203f:	6a 4e                	push   $0x4e
  jmp __alltraps
  102041:	e9 27 fd ff ff       	jmp    101d6d <__alltraps>

00102046 <vector79>:
.globl vector79
vector79:
  pushl $0
  102046:	6a 00                	push   $0x0
  pushl $79
  102048:	6a 4f                	push   $0x4f
  jmp __alltraps
  10204a:	e9 1e fd ff ff       	jmp    101d6d <__alltraps>

0010204f <vector80>:
.globl vector80
vector80:
  pushl $0
  10204f:	6a 00                	push   $0x0
  pushl $80
  102051:	6a 50                	push   $0x50
  jmp __alltraps
  102053:	e9 15 fd ff ff       	jmp    101d6d <__alltraps>

00102058 <vector81>:
.globl vector81
vector81:
  pushl $0
  102058:	6a 00                	push   $0x0
  pushl $81
  10205a:	6a 51                	push   $0x51
  jmp __alltraps
  10205c:	e9 0c fd ff ff       	jmp    101d6d <__alltraps>

00102061 <vector82>:
.globl vector82
vector82:
  pushl $0
  102061:	6a 00                	push   $0x0
  pushl $82
  102063:	6a 52                	push   $0x52
  jmp __alltraps
  102065:	e9 03 fd ff ff       	jmp    101d6d <__alltraps>

0010206a <vector83>:
.globl vector83
vector83:
  pushl $0
  10206a:	6a 00                	push   $0x0
  pushl $83
  10206c:	6a 53                	push   $0x53
  jmp __alltraps
  10206e:	e9 fa fc ff ff       	jmp    101d6d <__alltraps>

00102073 <vector84>:
.globl vector84
vector84:
  pushl $0
  102073:	6a 00                	push   $0x0
  pushl $84
  102075:	6a 54                	push   $0x54
  jmp __alltraps
  102077:	e9 f1 fc ff ff       	jmp    101d6d <__alltraps>

0010207c <vector85>:
.globl vector85
vector85:
  pushl $0
  10207c:	6a 00                	push   $0x0
  pushl $85
  10207e:	6a 55                	push   $0x55
  jmp __alltraps
  102080:	e9 e8 fc ff ff       	jmp    101d6d <__alltraps>

00102085 <vector86>:
.globl vector86
vector86:
  pushl $0
  102085:	6a 00                	push   $0x0
  pushl $86
  102087:	6a 56                	push   $0x56
  jmp __alltraps
  102089:	e9 df fc ff ff       	jmp    101d6d <__alltraps>

0010208e <vector87>:
.globl vector87
vector87:
  pushl $0
  10208e:	6a 00                	push   $0x0
  pushl $87
  102090:	6a 57                	push   $0x57
  jmp __alltraps
  102092:	e9 d6 fc ff ff       	jmp    101d6d <__alltraps>

00102097 <vector88>:
.globl vector88
vector88:
  pushl $0
  102097:	6a 00                	push   $0x0
  pushl $88
  102099:	6a 58                	push   $0x58
  jmp __alltraps
  10209b:	e9 cd fc ff ff       	jmp    101d6d <__alltraps>

001020a0 <vector89>:
.globl vector89
vector89:
  pushl $0
  1020a0:	6a 00                	push   $0x0
  pushl $89
  1020a2:	6a 59                	push   $0x59
  jmp __alltraps
  1020a4:	e9 c4 fc ff ff       	jmp    101d6d <__alltraps>

001020a9 <vector90>:
.globl vector90
vector90:
  pushl $0
  1020a9:	6a 00                	push   $0x0
  pushl $90
  1020ab:	6a 5a                	push   $0x5a
  jmp __alltraps
  1020ad:	e9 bb fc ff ff       	jmp    101d6d <__alltraps>

001020b2 <vector91>:
.globl vector91
vector91:
  pushl $0
  1020b2:	6a 00                	push   $0x0
  pushl $91
  1020b4:	6a 5b                	push   $0x5b
  jmp __alltraps
  1020b6:	e9 b2 fc ff ff       	jmp    101d6d <__alltraps>

001020bb <vector92>:
.globl vector92
vector92:
  pushl $0
  1020bb:	6a 00                	push   $0x0
  pushl $92
  1020bd:	6a 5c                	push   $0x5c
  jmp __alltraps
  1020bf:	e9 a9 fc ff ff       	jmp    101d6d <__alltraps>

001020c4 <vector93>:
.globl vector93
vector93:
  pushl $0
  1020c4:	6a 00                	push   $0x0
  pushl $93
  1020c6:	6a 5d                	push   $0x5d
  jmp __alltraps
  1020c8:	e9 a0 fc ff ff       	jmp    101d6d <__alltraps>

001020cd <vector94>:
.globl vector94
vector94:
  pushl $0
  1020cd:	6a 00                	push   $0x0
  pushl $94
  1020cf:	6a 5e                	push   $0x5e
  jmp __alltraps
  1020d1:	e9 97 fc ff ff       	jmp    101d6d <__alltraps>

001020d6 <vector95>:
.globl vector95
vector95:
  pushl $0
  1020d6:	6a 00                	push   $0x0
  pushl $95
  1020d8:	6a 5f                	push   $0x5f
  jmp __alltraps
  1020da:	e9 8e fc ff ff       	jmp    101d6d <__alltraps>

001020df <vector96>:
.globl vector96
vector96:
  pushl $0
  1020df:	6a 00                	push   $0x0
  pushl $96
  1020e1:	6a 60                	push   $0x60
  jmp __alltraps
  1020e3:	e9 85 fc ff ff       	jmp    101d6d <__alltraps>

001020e8 <vector97>:
.globl vector97
vector97:
  pushl $0
  1020e8:	6a 00                	push   $0x0
  pushl $97
  1020ea:	6a 61                	push   $0x61
  jmp __alltraps
  1020ec:	e9 7c fc ff ff       	jmp    101d6d <__alltraps>

001020f1 <vector98>:
.globl vector98
vector98:
  pushl $0
  1020f1:	6a 00                	push   $0x0
  pushl $98
  1020f3:	6a 62                	push   $0x62
  jmp __alltraps
  1020f5:	e9 73 fc ff ff       	jmp    101d6d <__alltraps>

001020fa <vector99>:
.globl vector99
vector99:
  pushl $0
  1020fa:	6a 00                	push   $0x0
  pushl $99
  1020fc:	6a 63                	push   $0x63
  jmp __alltraps
  1020fe:	e9 6a fc ff ff       	jmp    101d6d <__alltraps>

00102103 <vector100>:
.globl vector100
vector100:
  pushl $0
  102103:	6a 00                	push   $0x0
  pushl $100
  102105:	6a 64                	push   $0x64
  jmp __alltraps
  102107:	e9 61 fc ff ff       	jmp    101d6d <__alltraps>

0010210c <vector101>:
.globl vector101
vector101:
  pushl $0
  10210c:	6a 00                	push   $0x0
  pushl $101
  10210e:	6a 65                	push   $0x65
  jmp __alltraps
  102110:	e9 58 fc ff ff       	jmp    101d6d <__alltraps>

00102115 <vector102>:
.globl vector102
vector102:
  pushl $0
  102115:	6a 00                	push   $0x0
  pushl $102
  102117:	6a 66                	push   $0x66
  jmp __alltraps
  102119:	e9 4f fc ff ff       	jmp    101d6d <__alltraps>

0010211e <vector103>:
.globl vector103
vector103:
  pushl $0
  10211e:	6a 00                	push   $0x0
  pushl $103
  102120:	6a 67                	push   $0x67
  jmp __alltraps
  102122:	e9 46 fc ff ff       	jmp    101d6d <__alltraps>

00102127 <vector104>:
.globl vector104
vector104:
  pushl $0
  102127:	6a 00                	push   $0x0
  pushl $104
  102129:	6a 68                	push   $0x68
  jmp __alltraps
  10212b:	e9 3d fc ff ff       	jmp    101d6d <__alltraps>

00102130 <vector105>:
.globl vector105
vector105:
  pushl $0
  102130:	6a 00                	push   $0x0
  pushl $105
  102132:	6a 69                	push   $0x69
  jmp __alltraps
  102134:	e9 34 fc ff ff       	jmp    101d6d <__alltraps>

00102139 <vector106>:
.globl vector106
vector106:
  pushl $0
  102139:	6a 00                	push   $0x0
  pushl $106
  10213b:	6a 6a                	push   $0x6a
  jmp __alltraps
  10213d:	e9 2b fc ff ff       	jmp    101d6d <__alltraps>

00102142 <vector107>:
.globl vector107
vector107:
  pushl $0
  102142:	6a 00                	push   $0x0
  pushl $107
  102144:	6a 6b                	push   $0x6b
  jmp __alltraps
  102146:	e9 22 fc ff ff       	jmp    101d6d <__alltraps>

0010214b <vector108>:
.globl vector108
vector108:
  pushl $0
  10214b:	6a 00                	push   $0x0
  pushl $108
  10214d:	6a 6c                	push   $0x6c
  jmp __alltraps
  10214f:	e9 19 fc ff ff       	jmp    101d6d <__alltraps>

00102154 <vector109>:
.globl vector109
vector109:
  pushl $0
  102154:	6a 00                	push   $0x0
  pushl $109
  102156:	6a 6d                	push   $0x6d
  jmp __alltraps
  102158:	e9 10 fc ff ff       	jmp    101d6d <__alltraps>

0010215d <vector110>:
.globl vector110
vector110:
  pushl $0
  10215d:	6a 00                	push   $0x0
  pushl $110
  10215f:	6a 6e                	push   $0x6e
  jmp __alltraps
  102161:	e9 07 fc ff ff       	jmp    101d6d <__alltraps>

00102166 <vector111>:
.globl vector111
vector111:
  pushl $0
  102166:	6a 00                	push   $0x0
  pushl $111
  102168:	6a 6f                	push   $0x6f
  jmp __alltraps
  10216a:	e9 fe fb ff ff       	jmp    101d6d <__alltraps>

0010216f <vector112>:
.globl vector112
vector112:
  pushl $0
  10216f:	6a 00                	push   $0x0
  pushl $112
  102171:	6a 70                	push   $0x70
  jmp __alltraps
  102173:	e9 f5 fb ff ff       	jmp    101d6d <__alltraps>

00102178 <vector113>:
.globl vector113
vector113:
  pushl $0
  102178:	6a 00                	push   $0x0
  pushl $113
  10217a:	6a 71                	push   $0x71
  jmp __alltraps
  10217c:	e9 ec fb ff ff       	jmp    101d6d <__alltraps>

00102181 <vector114>:
.globl vector114
vector114:
  pushl $0
  102181:	6a 00                	push   $0x0
  pushl $114
  102183:	6a 72                	push   $0x72
  jmp __alltraps
  102185:	e9 e3 fb ff ff       	jmp    101d6d <__alltraps>

0010218a <vector115>:
.globl vector115
vector115:
  pushl $0
  10218a:	6a 00                	push   $0x0
  pushl $115
  10218c:	6a 73                	push   $0x73
  jmp __alltraps
  10218e:	e9 da fb ff ff       	jmp    101d6d <__alltraps>

00102193 <vector116>:
.globl vector116
vector116:
  pushl $0
  102193:	6a 00                	push   $0x0
  pushl $116
  102195:	6a 74                	push   $0x74
  jmp __alltraps
  102197:	e9 d1 fb ff ff       	jmp    101d6d <__alltraps>

0010219c <vector117>:
.globl vector117
vector117:
  pushl $0
  10219c:	6a 00                	push   $0x0
  pushl $117
  10219e:	6a 75                	push   $0x75
  jmp __alltraps
  1021a0:	e9 c8 fb ff ff       	jmp    101d6d <__alltraps>

001021a5 <vector118>:
.globl vector118
vector118:
  pushl $0
  1021a5:	6a 00                	push   $0x0
  pushl $118
  1021a7:	6a 76                	push   $0x76
  jmp __alltraps
  1021a9:	e9 bf fb ff ff       	jmp    101d6d <__alltraps>

001021ae <vector119>:
.globl vector119
vector119:
  pushl $0
  1021ae:	6a 00                	push   $0x0
  pushl $119
  1021b0:	6a 77                	push   $0x77
  jmp __alltraps
  1021b2:	e9 b6 fb ff ff       	jmp    101d6d <__alltraps>

001021b7 <vector120>:
.globl vector120
vector120:
  pushl $0
  1021b7:	6a 00                	push   $0x0
  pushl $120
  1021b9:	6a 78                	push   $0x78
  jmp __alltraps
  1021bb:	e9 ad fb ff ff       	jmp    101d6d <__alltraps>

001021c0 <vector121>:
.globl vector121
vector121:
  pushl $0
  1021c0:	6a 00                	push   $0x0
  pushl $121
  1021c2:	6a 79                	push   $0x79
  jmp __alltraps
  1021c4:	e9 a4 fb ff ff       	jmp    101d6d <__alltraps>

001021c9 <vector122>:
.globl vector122
vector122:
  pushl $0
  1021c9:	6a 00                	push   $0x0
  pushl $122
  1021cb:	6a 7a                	push   $0x7a
  jmp __alltraps
  1021cd:	e9 9b fb ff ff       	jmp    101d6d <__alltraps>

001021d2 <vector123>:
.globl vector123
vector123:
  pushl $0
  1021d2:	6a 00                	push   $0x0
  pushl $123
  1021d4:	6a 7b                	push   $0x7b
  jmp __alltraps
  1021d6:	e9 92 fb ff ff       	jmp    101d6d <__alltraps>

001021db <vector124>:
.globl vector124
vector124:
  pushl $0
  1021db:	6a 00                	push   $0x0
  pushl $124
  1021dd:	6a 7c                	push   $0x7c
  jmp __alltraps
  1021df:	e9 89 fb ff ff       	jmp    101d6d <__alltraps>

001021e4 <vector125>:
.globl vector125
vector125:
  pushl $0
  1021e4:	6a 00                	push   $0x0
  pushl $125
  1021e6:	6a 7d                	push   $0x7d
  jmp __alltraps
  1021e8:	e9 80 fb ff ff       	jmp    101d6d <__alltraps>

001021ed <vector126>:
.globl vector126
vector126:
  pushl $0
  1021ed:	6a 00                	push   $0x0
  pushl $126
  1021ef:	6a 7e                	push   $0x7e
  jmp __alltraps
  1021f1:	e9 77 fb ff ff       	jmp    101d6d <__alltraps>

001021f6 <vector127>:
.globl vector127
vector127:
  pushl $0
  1021f6:	6a 00                	push   $0x0
  pushl $127
  1021f8:	6a 7f                	push   $0x7f
  jmp __alltraps
  1021fa:	e9 6e fb ff ff       	jmp    101d6d <__alltraps>

001021ff <vector128>:
.globl vector128
vector128:
  pushl $0
  1021ff:	6a 00                	push   $0x0
  pushl $128
  102201:	68 80 00 00 00       	push   $0x80
  jmp __alltraps
  102206:	e9 62 fb ff ff       	jmp    101d6d <__alltraps>

0010220b <vector129>:
.globl vector129
vector129:
  pushl $0
  10220b:	6a 00                	push   $0x0
  pushl $129
  10220d:	68 81 00 00 00       	push   $0x81
  jmp __alltraps
  102212:	e9 56 fb ff ff       	jmp    101d6d <__alltraps>

00102217 <vector130>:
.globl vector130
vector130:
  pushl $0
  102217:	6a 00                	push   $0x0
  pushl $130
  102219:	68 82 00 00 00       	push   $0x82
  jmp __alltraps
  10221e:	e9 4a fb ff ff       	jmp    101d6d <__alltraps>

00102223 <vector131>:
.globl vector131
vector131:
  pushl $0
  102223:	6a 00                	push   $0x0
  pushl $131
  102225:	68 83 00 00 00       	push   $0x83
  jmp __alltraps
  10222a:	e9 3e fb ff ff       	jmp    101d6d <__alltraps>

0010222f <vector132>:
.globl vector132
vector132:
  pushl $0
  10222f:	6a 00                	push   $0x0
  pushl $132
  102231:	68 84 00 00 00       	push   $0x84
  jmp __alltraps
  102236:	e9 32 fb ff ff       	jmp    101d6d <__alltraps>

0010223b <vector133>:
.globl vector133
vector133:
  pushl $0
  10223b:	6a 00                	push   $0x0
  pushl $133
  10223d:	68 85 00 00 00       	push   $0x85
  jmp __alltraps
  102242:	e9 26 fb ff ff       	jmp    101d6d <__alltraps>

00102247 <vector134>:
.globl vector134
vector134:
  pushl $0
  102247:	6a 00                	push   $0x0
  pushl $134
  102249:	68 86 00 00 00       	push   $0x86
  jmp __alltraps
  10224e:	e9 1a fb ff ff       	jmp    101d6d <__alltraps>

00102253 <vector135>:
.globl vector135
vector135:
  pushl $0
  102253:	6a 00                	push   $0x0
  pushl $135
  102255:	68 87 00 00 00       	push   $0x87
  jmp __alltraps
  10225a:	e9 0e fb ff ff       	jmp    101d6d <__alltraps>

0010225f <vector136>:
.globl vector136
vector136:
  pushl $0
  10225f:	6a 00                	push   $0x0
  pushl $136
  102261:	68 88 00 00 00       	push   $0x88
  jmp __alltraps
  102266:	e9 02 fb ff ff       	jmp    101d6d <__alltraps>

0010226b <vector137>:
.globl vector137
vector137:
  pushl $0
  10226b:	6a 00                	push   $0x0
  pushl $137
  10226d:	68 89 00 00 00       	push   $0x89
  jmp __alltraps
  102272:	e9 f6 fa ff ff       	jmp    101d6d <__alltraps>

00102277 <vector138>:
.globl vector138
vector138:
  pushl $0
  102277:	6a 00                	push   $0x0
  pushl $138
  102279:	68 8a 00 00 00       	push   $0x8a
  jmp __alltraps
  10227e:	e9 ea fa ff ff       	jmp    101d6d <__alltraps>

00102283 <vector139>:
.globl vector139
vector139:
  pushl $0
  102283:	6a 00                	push   $0x0
  pushl $139
  102285:	68 8b 00 00 00       	push   $0x8b
  jmp __alltraps
  10228a:	e9 de fa ff ff       	jmp    101d6d <__alltraps>

0010228f <vector140>:
.globl vector140
vector140:
  pushl $0
  10228f:	6a 00                	push   $0x0
  pushl $140
  102291:	68 8c 00 00 00       	push   $0x8c
  jmp __alltraps
  102296:	e9 d2 fa ff ff       	jmp    101d6d <__alltraps>

0010229b <vector141>:
.globl vector141
vector141:
  pushl $0
  10229b:	6a 00                	push   $0x0
  pushl $141
  10229d:	68 8d 00 00 00       	push   $0x8d
  jmp __alltraps
  1022a2:	e9 c6 fa ff ff       	jmp    101d6d <__alltraps>

001022a7 <vector142>:
.globl vector142
vector142:
  pushl $0
  1022a7:	6a 00                	push   $0x0
  pushl $142
  1022a9:	68 8e 00 00 00       	push   $0x8e
  jmp __alltraps
  1022ae:	e9 ba fa ff ff       	jmp    101d6d <__alltraps>

001022b3 <vector143>:
.globl vector143
vector143:
  pushl $0
  1022b3:	6a 00                	push   $0x0
  pushl $143
  1022b5:	68 8f 00 00 00       	push   $0x8f
  jmp __alltraps
  1022ba:	e9 ae fa ff ff       	jmp    101d6d <__alltraps>

001022bf <vector144>:
.globl vector144
vector144:
  pushl $0
  1022bf:	6a 00                	push   $0x0
  pushl $144
  1022c1:	68 90 00 00 00       	push   $0x90
  jmp __alltraps
  1022c6:	e9 a2 fa ff ff       	jmp    101d6d <__alltraps>

001022cb <vector145>:
.globl vector145
vector145:
  pushl $0
  1022cb:	6a 00                	push   $0x0
  pushl $145
  1022cd:	68 91 00 00 00       	push   $0x91
  jmp __alltraps
  1022d2:	e9 96 fa ff ff       	jmp    101d6d <__alltraps>

001022d7 <vector146>:
.globl vector146
vector146:
  pushl $0
  1022d7:	6a 00                	push   $0x0
  pushl $146
  1022d9:	68 92 00 00 00       	push   $0x92
  jmp __alltraps
  1022de:	e9 8a fa ff ff       	jmp    101d6d <__alltraps>

001022e3 <vector147>:
.globl vector147
vector147:
  pushl $0
  1022e3:	6a 00                	push   $0x0
  pushl $147
  1022e5:	68 93 00 00 00       	push   $0x93
  jmp __alltraps
  1022ea:	e9 7e fa ff ff       	jmp    101d6d <__alltraps>

001022ef <vector148>:
.globl vector148
vector148:
  pushl $0
  1022ef:	6a 00                	push   $0x0
  pushl $148
  1022f1:	68 94 00 00 00       	push   $0x94
  jmp __alltraps
  1022f6:	e9 72 fa ff ff       	jmp    101d6d <__alltraps>

001022fb <vector149>:
.globl vector149
vector149:
  pushl $0
  1022fb:	6a 00                	push   $0x0
  pushl $149
  1022fd:	68 95 00 00 00       	push   $0x95
  jmp __alltraps
  102302:	e9 66 fa ff ff       	jmp    101d6d <__alltraps>

00102307 <vector150>:
.globl vector150
vector150:
  pushl $0
  102307:	6a 00                	push   $0x0
  pushl $150
  102309:	68 96 00 00 00       	push   $0x96
  jmp __alltraps
  10230e:	e9 5a fa ff ff       	jmp    101d6d <__alltraps>

00102313 <vector151>:
.globl vector151
vector151:
  pushl $0
  102313:	6a 00                	push   $0x0
  pushl $151
  102315:	68 97 00 00 00       	push   $0x97
  jmp __alltraps
  10231a:	e9 4e fa ff ff       	jmp    101d6d <__alltraps>

0010231f <vector152>:
.globl vector152
vector152:
  pushl $0
  10231f:	6a 00                	push   $0x0
  pushl $152
  102321:	68 98 00 00 00       	push   $0x98
  jmp __alltraps
  102326:	e9 42 fa ff ff       	jmp    101d6d <__alltraps>

0010232b <vector153>:
.globl vector153
vector153:
  pushl $0
  10232b:	6a 00                	push   $0x0
  pushl $153
  10232d:	68 99 00 00 00       	push   $0x99
  jmp __alltraps
  102332:	e9 36 fa ff ff       	jmp    101d6d <__alltraps>

00102337 <vector154>:
.globl vector154
vector154:
  pushl $0
  102337:	6a 00                	push   $0x0
  pushl $154
  102339:	68 9a 00 00 00       	push   $0x9a
  jmp __alltraps
  10233e:	e9 2a fa ff ff       	jmp    101d6d <__alltraps>

00102343 <vector155>:
.globl vector155
vector155:
  pushl $0
  102343:	6a 00                	push   $0x0
  pushl $155
  102345:	68 9b 00 00 00       	push   $0x9b
  jmp __alltraps
  10234a:	e9 1e fa ff ff       	jmp    101d6d <__alltraps>

0010234f <vector156>:
.globl vector156
vector156:
  pushl $0
  10234f:	6a 00                	push   $0x0
  pushl $156
  102351:	68 9c 00 00 00       	push   $0x9c
  jmp __alltraps
  102356:	e9 12 fa ff ff       	jmp    101d6d <__alltraps>

0010235b <vector157>:
.globl vector157
vector157:
  pushl $0
  10235b:	6a 00                	push   $0x0
  pushl $157
  10235d:	68 9d 00 00 00       	push   $0x9d
  jmp __alltraps
  102362:	e9 06 fa ff ff       	jmp    101d6d <__alltraps>

00102367 <vector158>:
.globl vector158
vector158:
  pushl $0
  102367:	6a 00                	push   $0x0
  pushl $158
  102369:	68 9e 00 00 00       	push   $0x9e
  jmp __alltraps
  10236e:	e9 fa f9 ff ff       	jmp    101d6d <__alltraps>

00102373 <vector159>:
.globl vector159
vector159:
  pushl $0
  102373:	6a 00                	push   $0x0
  pushl $159
  102375:	68 9f 00 00 00       	push   $0x9f
  jmp __alltraps
  10237a:	e9 ee f9 ff ff       	jmp    101d6d <__alltraps>

0010237f <vector160>:
.globl vector160
vector160:
  pushl $0
  10237f:	6a 00                	push   $0x0
  pushl $160
  102381:	68 a0 00 00 00       	push   $0xa0
  jmp __alltraps
  102386:	e9 e2 f9 ff ff       	jmp    101d6d <__alltraps>

0010238b <vector161>:
.globl vector161
vector161:
  pushl $0
  10238b:	6a 00                	push   $0x0
  pushl $161
  10238d:	68 a1 00 00 00       	push   $0xa1
  jmp __alltraps
  102392:	e9 d6 f9 ff ff       	jmp    101d6d <__alltraps>

00102397 <vector162>:
.globl vector162
vector162:
  pushl $0
  102397:	6a 00                	push   $0x0
  pushl $162
  102399:	68 a2 00 00 00       	push   $0xa2
  jmp __alltraps
  10239e:	e9 ca f9 ff ff       	jmp    101d6d <__alltraps>

001023a3 <vector163>:
.globl vector163
vector163:
  pushl $0
  1023a3:	6a 00                	push   $0x0
  pushl $163
  1023a5:	68 a3 00 00 00       	push   $0xa3
  jmp __alltraps
  1023aa:	e9 be f9 ff ff       	jmp    101d6d <__alltraps>

001023af <vector164>:
.globl vector164
vector164:
  pushl $0
  1023af:	6a 00                	push   $0x0
  pushl $164
  1023b1:	68 a4 00 00 00       	push   $0xa4
  jmp __alltraps
  1023b6:	e9 b2 f9 ff ff       	jmp    101d6d <__alltraps>

001023bb <vector165>:
.globl vector165
vector165:
  pushl $0
  1023bb:	6a 00                	push   $0x0
  pushl $165
  1023bd:	68 a5 00 00 00       	push   $0xa5
  jmp __alltraps
  1023c2:	e9 a6 f9 ff ff       	jmp    101d6d <__alltraps>

001023c7 <vector166>:
.globl vector166
vector166:
  pushl $0
  1023c7:	6a 00                	push   $0x0
  pushl $166
  1023c9:	68 a6 00 00 00       	push   $0xa6
  jmp __alltraps
  1023ce:	e9 9a f9 ff ff       	jmp    101d6d <__alltraps>

001023d3 <vector167>:
.globl vector167
vector167:
  pushl $0
  1023d3:	6a 00                	push   $0x0
  pushl $167
  1023d5:	68 a7 00 00 00       	push   $0xa7
  jmp __alltraps
  1023da:	e9 8e f9 ff ff       	jmp    101d6d <__alltraps>

001023df <vector168>:
.globl vector168
vector168:
  pushl $0
  1023df:	6a 00                	push   $0x0
  pushl $168
  1023e1:	68 a8 00 00 00       	push   $0xa8
  jmp __alltraps
  1023e6:	e9 82 f9 ff ff       	jmp    101d6d <__alltraps>

001023eb <vector169>:
.globl vector169
vector169:
  pushl $0
  1023eb:	6a 00                	push   $0x0
  pushl $169
  1023ed:	68 a9 00 00 00       	push   $0xa9
  jmp __alltraps
  1023f2:	e9 76 f9 ff ff       	jmp    101d6d <__alltraps>

001023f7 <vector170>:
.globl vector170
vector170:
  pushl $0
  1023f7:	6a 00                	push   $0x0
  pushl $170
  1023f9:	68 aa 00 00 00       	push   $0xaa
  jmp __alltraps
  1023fe:	e9 6a f9 ff ff       	jmp    101d6d <__alltraps>

00102403 <vector171>:
.globl vector171
vector171:
  pushl $0
  102403:	6a 00                	push   $0x0
  pushl $171
  102405:	68 ab 00 00 00       	push   $0xab
  jmp __alltraps
  10240a:	e9 5e f9 ff ff       	jmp    101d6d <__alltraps>

0010240f <vector172>:
.globl vector172
vector172:
  pushl $0
  10240f:	6a 00                	push   $0x0
  pushl $172
  102411:	68 ac 00 00 00       	push   $0xac
  jmp __alltraps
  102416:	e9 52 f9 ff ff       	jmp    101d6d <__alltraps>

0010241b <vector173>:
.globl vector173
vector173:
  pushl $0
  10241b:	6a 00                	push   $0x0
  pushl $173
  10241d:	68 ad 00 00 00       	push   $0xad
  jmp __alltraps
  102422:	e9 46 f9 ff ff       	jmp    101d6d <__alltraps>

00102427 <vector174>:
.globl vector174
vector174:
  pushl $0
  102427:	6a 00                	push   $0x0
  pushl $174
  102429:	68 ae 00 00 00       	push   $0xae
  jmp __alltraps
  10242e:	e9 3a f9 ff ff       	jmp    101d6d <__alltraps>

00102433 <vector175>:
.globl vector175
vector175:
  pushl $0
  102433:	6a 00                	push   $0x0
  pushl $175
  102435:	68 af 00 00 00       	push   $0xaf
  jmp __alltraps
  10243a:	e9 2e f9 ff ff       	jmp    101d6d <__alltraps>

0010243f <vector176>:
.globl vector176
vector176:
  pushl $0
  10243f:	6a 00                	push   $0x0
  pushl $176
  102441:	68 b0 00 00 00       	push   $0xb0
  jmp __alltraps
  102446:	e9 22 f9 ff ff       	jmp    101d6d <__alltraps>

0010244b <vector177>:
.globl vector177
vector177:
  pushl $0
  10244b:	6a 00                	push   $0x0
  pushl $177
  10244d:	68 b1 00 00 00       	push   $0xb1
  jmp __alltraps
  102452:	e9 16 f9 ff ff       	jmp    101d6d <__alltraps>

00102457 <vector178>:
.globl vector178
vector178:
  pushl $0
  102457:	6a 00                	push   $0x0
  pushl $178
  102459:	68 b2 00 00 00       	push   $0xb2
  jmp __alltraps
  10245e:	e9 0a f9 ff ff       	jmp    101d6d <__alltraps>

00102463 <vector179>:
.globl vector179
vector179:
  pushl $0
  102463:	6a 00                	push   $0x0
  pushl $179
  102465:	68 b3 00 00 00       	push   $0xb3
  jmp __alltraps
  10246a:	e9 fe f8 ff ff       	jmp    101d6d <__alltraps>

0010246f <vector180>:
.globl vector180
vector180:
  pushl $0
  10246f:	6a 00                	push   $0x0
  pushl $180
  102471:	68 b4 00 00 00       	push   $0xb4
  jmp __alltraps
  102476:	e9 f2 f8 ff ff       	jmp    101d6d <__alltraps>

0010247b <vector181>:
.globl vector181
vector181:
  pushl $0
  10247b:	6a 00                	push   $0x0
  pushl $181
  10247d:	68 b5 00 00 00       	push   $0xb5
  jmp __alltraps
  102482:	e9 e6 f8 ff ff       	jmp    101d6d <__alltraps>

00102487 <vector182>:
.globl vector182
vector182:
  pushl $0
  102487:	6a 00                	push   $0x0
  pushl $182
  102489:	68 b6 00 00 00       	push   $0xb6
  jmp __alltraps
  10248e:	e9 da f8 ff ff       	jmp    101d6d <__alltraps>

00102493 <vector183>:
.globl vector183
vector183:
  pushl $0
  102493:	6a 00                	push   $0x0
  pushl $183
  102495:	68 b7 00 00 00       	push   $0xb7
  jmp __alltraps
  10249a:	e9 ce f8 ff ff       	jmp    101d6d <__alltraps>

0010249f <vector184>:
.globl vector184
vector184:
  pushl $0
  10249f:	6a 00                	push   $0x0
  pushl $184
  1024a1:	68 b8 00 00 00       	push   $0xb8
  jmp __alltraps
  1024a6:	e9 c2 f8 ff ff       	jmp    101d6d <__alltraps>

001024ab <vector185>:
.globl vector185
vector185:
  pushl $0
  1024ab:	6a 00                	push   $0x0
  pushl $185
  1024ad:	68 b9 00 00 00       	push   $0xb9
  jmp __alltraps
  1024b2:	e9 b6 f8 ff ff       	jmp    101d6d <__alltraps>

001024b7 <vector186>:
.globl vector186
vector186:
  pushl $0
  1024b7:	6a 00                	push   $0x0
  pushl $186
  1024b9:	68 ba 00 00 00       	push   $0xba
  jmp __alltraps
  1024be:	e9 aa f8 ff ff       	jmp    101d6d <__alltraps>

001024c3 <vector187>:
.globl vector187
vector187:
  pushl $0
  1024c3:	6a 00                	push   $0x0
  pushl $187
  1024c5:	68 bb 00 00 00       	push   $0xbb
  jmp __alltraps
  1024ca:	e9 9e f8 ff ff       	jmp    101d6d <__alltraps>

001024cf <vector188>:
.globl vector188
vector188:
  pushl $0
  1024cf:	6a 00                	push   $0x0
  pushl $188
  1024d1:	68 bc 00 00 00       	push   $0xbc
  jmp __alltraps
  1024d6:	e9 92 f8 ff ff       	jmp    101d6d <__alltraps>

001024db <vector189>:
.globl vector189
vector189:
  pushl $0
  1024db:	6a 00                	push   $0x0
  pushl $189
  1024dd:	68 bd 00 00 00       	push   $0xbd
  jmp __alltraps
  1024e2:	e9 86 f8 ff ff       	jmp    101d6d <__alltraps>

001024e7 <vector190>:
.globl vector190
vector190:
  pushl $0
  1024e7:	6a 00                	push   $0x0
  pushl $190
  1024e9:	68 be 00 00 00       	push   $0xbe
  jmp __alltraps
  1024ee:	e9 7a f8 ff ff       	jmp    101d6d <__alltraps>

001024f3 <vector191>:
.globl vector191
vector191:
  pushl $0
  1024f3:	6a 00                	push   $0x0
  pushl $191
  1024f5:	68 bf 00 00 00       	push   $0xbf
  jmp __alltraps
  1024fa:	e9 6e f8 ff ff       	jmp    101d6d <__alltraps>

001024ff <vector192>:
.globl vector192
vector192:
  pushl $0
  1024ff:	6a 00                	push   $0x0
  pushl $192
  102501:	68 c0 00 00 00       	push   $0xc0
  jmp __alltraps
  102506:	e9 62 f8 ff ff       	jmp    101d6d <__alltraps>

0010250b <vector193>:
.globl vector193
vector193:
  pushl $0
  10250b:	6a 00                	push   $0x0
  pushl $193
  10250d:	68 c1 00 00 00       	push   $0xc1
  jmp __alltraps
  102512:	e9 56 f8 ff ff       	jmp    101d6d <__alltraps>

00102517 <vector194>:
.globl vector194
vector194:
  pushl $0
  102517:	6a 00                	push   $0x0
  pushl $194
  102519:	68 c2 00 00 00       	push   $0xc2
  jmp __alltraps
  10251e:	e9 4a f8 ff ff       	jmp    101d6d <__alltraps>

00102523 <vector195>:
.globl vector195
vector195:
  pushl $0
  102523:	6a 00                	push   $0x0
  pushl $195
  102525:	68 c3 00 00 00       	push   $0xc3
  jmp __alltraps
  10252a:	e9 3e f8 ff ff       	jmp    101d6d <__alltraps>

0010252f <vector196>:
.globl vector196
vector196:
  pushl $0
  10252f:	6a 00                	push   $0x0
  pushl $196
  102531:	68 c4 00 00 00       	push   $0xc4
  jmp __alltraps
  102536:	e9 32 f8 ff ff       	jmp    101d6d <__alltraps>

0010253b <vector197>:
.globl vector197
vector197:
  pushl $0
  10253b:	6a 00                	push   $0x0
  pushl $197
  10253d:	68 c5 00 00 00       	push   $0xc5
  jmp __alltraps
  102542:	e9 26 f8 ff ff       	jmp    101d6d <__alltraps>

00102547 <vector198>:
.globl vector198
vector198:
  pushl $0
  102547:	6a 00                	push   $0x0
  pushl $198
  102549:	68 c6 00 00 00       	push   $0xc6
  jmp __alltraps
  10254e:	e9 1a f8 ff ff       	jmp    101d6d <__alltraps>

00102553 <vector199>:
.globl vector199
vector199:
  pushl $0
  102553:	6a 00                	push   $0x0
  pushl $199
  102555:	68 c7 00 00 00       	push   $0xc7
  jmp __alltraps
  10255a:	e9 0e f8 ff ff       	jmp    101d6d <__alltraps>

0010255f <vector200>:
.globl vector200
vector200:
  pushl $0
  10255f:	6a 00                	push   $0x0
  pushl $200
  102561:	68 c8 00 00 00       	push   $0xc8
  jmp __alltraps
  102566:	e9 02 f8 ff ff       	jmp    101d6d <__alltraps>

0010256b <vector201>:
.globl vector201
vector201:
  pushl $0
  10256b:	6a 00                	push   $0x0
  pushl $201
  10256d:	68 c9 00 00 00       	push   $0xc9
  jmp __alltraps
  102572:	e9 f6 f7 ff ff       	jmp    101d6d <__alltraps>

00102577 <vector202>:
.globl vector202
vector202:
  pushl $0
  102577:	6a 00                	push   $0x0
  pushl $202
  102579:	68 ca 00 00 00       	push   $0xca
  jmp __alltraps
  10257e:	e9 ea f7 ff ff       	jmp    101d6d <__alltraps>

00102583 <vector203>:
.globl vector203
vector203:
  pushl $0
  102583:	6a 00                	push   $0x0
  pushl $203
  102585:	68 cb 00 00 00       	push   $0xcb
  jmp __alltraps
  10258a:	e9 de f7 ff ff       	jmp    101d6d <__alltraps>

0010258f <vector204>:
.globl vector204
vector204:
  pushl $0
  10258f:	6a 00                	push   $0x0
  pushl $204
  102591:	68 cc 00 00 00       	push   $0xcc
  jmp __alltraps
  102596:	e9 d2 f7 ff ff       	jmp    101d6d <__alltraps>

0010259b <vector205>:
.globl vector205
vector205:
  pushl $0
  10259b:	6a 00                	push   $0x0
  pushl $205
  10259d:	68 cd 00 00 00       	push   $0xcd
  jmp __alltraps
  1025a2:	e9 c6 f7 ff ff       	jmp    101d6d <__alltraps>

001025a7 <vector206>:
.globl vector206
vector206:
  pushl $0
  1025a7:	6a 00                	push   $0x0
  pushl $206
  1025a9:	68 ce 00 00 00       	push   $0xce
  jmp __alltraps
  1025ae:	e9 ba f7 ff ff       	jmp    101d6d <__alltraps>

001025b3 <vector207>:
.globl vector207
vector207:
  pushl $0
  1025b3:	6a 00                	push   $0x0
  pushl $207
  1025b5:	68 cf 00 00 00       	push   $0xcf
  jmp __alltraps
  1025ba:	e9 ae f7 ff ff       	jmp    101d6d <__alltraps>

001025bf <vector208>:
.globl vector208
vector208:
  pushl $0
  1025bf:	6a 00                	push   $0x0
  pushl $208
  1025c1:	68 d0 00 00 00       	push   $0xd0
  jmp __alltraps
  1025c6:	e9 a2 f7 ff ff       	jmp    101d6d <__alltraps>

001025cb <vector209>:
.globl vector209
vector209:
  pushl $0
  1025cb:	6a 00                	push   $0x0
  pushl $209
  1025cd:	68 d1 00 00 00       	push   $0xd1
  jmp __alltraps
  1025d2:	e9 96 f7 ff ff       	jmp    101d6d <__alltraps>

001025d7 <vector210>:
.globl vector210
vector210:
  pushl $0
  1025d7:	6a 00                	push   $0x0
  pushl $210
  1025d9:	68 d2 00 00 00       	push   $0xd2
  jmp __alltraps
  1025de:	e9 8a f7 ff ff       	jmp    101d6d <__alltraps>

001025e3 <vector211>:
.globl vector211
vector211:
  pushl $0
  1025e3:	6a 00                	push   $0x0
  pushl $211
  1025e5:	68 d3 00 00 00       	push   $0xd3
  jmp __alltraps
  1025ea:	e9 7e f7 ff ff       	jmp    101d6d <__alltraps>

001025ef <vector212>:
.globl vector212
vector212:
  pushl $0
  1025ef:	6a 00                	push   $0x0
  pushl $212
  1025f1:	68 d4 00 00 00       	push   $0xd4
  jmp __alltraps
  1025f6:	e9 72 f7 ff ff       	jmp    101d6d <__alltraps>

001025fb <vector213>:
.globl vector213
vector213:
  pushl $0
  1025fb:	6a 00                	push   $0x0
  pushl $213
  1025fd:	68 d5 00 00 00       	push   $0xd5
  jmp __alltraps
  102602:	e9 66 f7 ff ff       	jmp    101d6d <__alltraps>

00102607 <vector214>:
.globl vector214
vector214:
  pushl $0
  102607:	6a 00                	push   $0x0
  pushl $214
  102609:	68 d6 00 00 00       	push   $0xd6
  jmp __alltraps
  10260e:	e9 5a f7 ff ff       	jmp    101d6d <__alltraps>

00102613 <vector215>:
.globl vector215
vector215:
  pushl $0
  102613:	6a 00                	push   $0x0
  pushl $215
  102615:	68 d7 00 00 00       	push   $0xd7
  jmp __alltraps
  10261a:	e9 4e f7 ff ff       	jmp    101d6d <__alltraps>

0010261f <vector216>:
.globl vector216
vector216:
  pushl $0
  10261f:	6a 00                	push   $0x0
  pushl $216
  102621:	68 d8 00 00 00       	push   $0xd8
  jmp __alltraps
  102626:	e9 42 f7 ff ff       	jmp    101d6d <__alltraps>

0010262b <vector217>:
.globl vector217
vector217:
  pushl $0
  10262b:	6a 00                	push   $0x0
  pushl $217
  10262d:	68 d9 00 00 00       	push   $0xd9
  jmp __alltraps
  102632:	e9 36 f7 ff ff       	jmp    101d6d <__alltraps>

00102637 <vector218>:
.globl vector218
vector218:
  pushl $0
  102637:	6a 00                	push   $0x0
  pushl $218
  102639:	68 da 00 00 00       	push   $0xda
  jmp __alltraps
  10263e:	e9 2a f7 ff ff       	jmp    101d6d <__alltraps>

00102643 <vector219>:
.globl vector219
vector219:
  pushl $0
  102643:	6a 00                	push   $0x0
  pushl $219
  102645:	68 db 00 00 00       	push   $0xdb
  jmp __alltraps
  10264a:	e9 1e f7 ff ff       	jmp    101d6d <__alltraps>

0010264f <vector220>:
.globl vector220
vector220:
  pushl $0
  10264f:	6a 00                	push   $0x0
  pushl $220
  102651:	68 dc 00 00 00       	push   $0xdc
  jmp __alltraps
  102656:	e9 12 f7 ff ff       	jmp    101d6d <__alltraps>

0010265b <vector221>:
.globl vector221
vector221:
  pushl $0
  10265b:	6a 00                	push   $0x0
  pushl $221
  10265d:	68 dd 00 00 00       	push   $0xdd
  jmp __alltraps
  102662:	e9 06 f7 ff ff       	jmp    101d6d <__alltraps>

00102667 <vector222>:
.globl vector222
vector222:
  pushl $0
  102667:	6a 00                	push   $0x0
  pushl $222
  102669:	68 de 00 00 00       	push   $0xde
  jmp __alltraps
  10266e:	e9 fa f6 ff ff       	jmp    101d6d <__alltraps>

00102673 <vector223>:
.globl vector223
vector223:
  pushl $0
  102673:	6a 00                	push   $0x0
  pushl $223
  102675:	68 df 00 00 00       	push   $0xdf
  jmp __alltraps
  10267a:	e9 ee f6 ff ff       	jmp    101d6d <__alltraps>

0010267f <vector224>:
.globl vector224
vector224:
  pushl $0
  10267f:	6a 00                	push   $0x0
  pushl $224
  102681:	68 e0 00 00 00       	push   $0xe0
  jmp __alltraps
  102686:	e9 e2 f6 ff ff       	jmp    101d6d <__alltraps>

0010268b <vector225>:
.globl vector225
vector225:
  pushl $0
  10268b:	6a 00                	push   $0x0
  pushl $225
  10268d:	68 e1 00 00 00       	push   $0xe1
  jmp __alltraps
  102692:	e9 d6 f6 ff ff       	jmp    101d6d <__alltraps>

00102697 <vector226>:
.globl vector226
vector226:
  pushl $0
  102697:	6a 00                	push   $0x0
  pushl $226
  102699:	68 e2 00 00 00       	push   $0xe2
  jmp __alltraps
  10269e:	e9 ca f6 ff ff       	jmp    101d6d <__alltraps>

001026a3 <vector227>:
.globl vector227
vector227:
  pushl $0
  1026a3:	6a 00                	push   $0x0
  pushl $227
  1026a5:	68 e3 00 00 00       	push   $0xe3
  jmp __alltraps
  1026aa:	e9 be f6 ff ff       	jmp    101d6d <__alltraps>

001026af <vector228>:
.globl vector228
vector228:
  pushl $0
  1026af:	6a 00                	push   $0x0
  pushl $228
  1026b1:	68 e4 00 00 00       	push   $0xe4
  jmp __alltraps
  1026b6:	e9 b2 f6 ff ff       	jmp    101d6d <__alltraps>

001026bb <vector229>:
.globl vector229
vector229:
  pushl $0
  1026bb:	6a 00                	push   $0x0
  pushl $229
  1026bd:	68 e5 00 00 00       	push   $0xe5
  jmp __alltraps
  1026c2:	e9 a6 f6 ff ff       	jmp    101d6d <__alltraps>

001026c7 <vector230>:
.globl vector230
vector230:
  pushl $0
  1026c7:	6a 00                	push   $0x0
  pushl $230
  1026c9:	68 e6 00 00 00       	push   $0xe6
  jmp __alltraps
  1026ce:	e9 9a f6 ff ff       	jmp    101d6d <__alltraps>

001026d3 <vector231>:
.globl vector231
vector231:
  pushl $0
  1026d3:	6a 00                	push   $0x0
  pushl $231
  1026d5:	68 e7 00 00 00       	push   $0xe7
  jmp __alltraps
  1026da:	e9 8e f6 ff ff       	jmp    101d6d <__alltraps>

001026df <vector232>:
.globl vector232
vector232:
  pushl $0
  1026df:	6a 00                	push   $0x0
  pushl $232
  1026e1:	68 e8 00 00 00       	push   $0xe8
  jmp __alltraps
  1026e6:	e9 82 f6 ff ff       	jmp    101d6d <__alltraps>

001026eb <vector233>:
.globl vector233
vector233:
  pushl $0
  1026eb:	6a 00                	push   $0x0
  pushl $233
  1026ed:	68 e9 00 00 00       	push   $0xe9
  jmp __alltraps
  1026f2:	e9 76 f6 ff ff       	jmp    101d6d <__alltraps>

001026f7 <vector234>:
.globl vector234
vector234:
  pushl $0
  1026f7:	6a 00                	push   $0x0
  pushl $234
  1026f9:	68 ea 00 00 00       	push   $0xea
  jmp __alltraps
  1026fe:	e9 6a f6 ff ff       	jmp    101d6d <__alltraps>

00102703 <vector235>:
.globl vector235
vector235:
  pushl $0
  102703:	6a 00                	push   $0x0
  pushl $235
  102705:	68 eb 00 00 00       	push   $0xeb
  jmp __alltraps
  10270a:	e9 5e f6 ff ff       	jmp    101d6d <__alltraps>

0010270f <vector236>:
.globl vector236
vector236:
  pushl $0
  10270f:	6a 00                	push   $0x0
  pushl $236
  102711:	68 ec 00 00 00       	push   $0xec
  jmp __alltraps
  102716:	e9 52 f6 ff ff       	jmp    101d6d <__alltraps>

0010271b <vector237>:
.globl vector237
vector237:
  pushl $0
  10271b:	6a 00                	push   $0x0
  pushl $237
  10271d:	68 ed 00 00 00       	push   $0xed
  jmp __alltraps
  102722:	e9 46 f6 ff ff       	jmp    101d6d <__alltraps>

00102727 <vector238>:
.globl vector238
vector238:
  pushl $0
  102727:	6a 00                	push   $0x0
  pushl $238
  102729:	68 ee 00 00 00       	push   $0xee
  jmp __alltraps
  10272e:	e9 3a f6 ff ff       	jmp    101d6d <__alltraps>

00102733 <vector239>:
.globl vector239
vector239:
  pushl $0
  102733:	6a 00                	push   $0x0
  pushl $239
  102735:	68 ef 00 00 00       	push   $0xef
  jmp __alltraps
  10273a:	e9 2e f6 ff ff       	jmp    101d6d <__alltraps>

0010273f <vector240>:
.globl vector240
vector240:
  pushl $0
  10273f:	6a 00                	push   $0x0
  pushl $240
  102741:	68 f0 00 00 00       	push   $0xf0
  jmp __alltraps
  102746:	e9 22 f6 ff ff       	jmp    101d6d <__alltraps>

0010274b <vector241>:
.globl vector241
vector241:
  pushl $0
  10274b:	6a 00                	push   $0x0
  pushl $241
  10274d:	68 f1 00 00 00       	push   $0xf1
  jmp __alltraps
  102752:	e9 16 f6 ff ff       	jmp    101d6d <__alltraps>

00102757 <vector242>:
.globl vector242
vector242:
  pushl $0
  102757:	6a 00                	push   $0x0
  pushl $242
  102759:	68 f2 00 00 00       	push   $0xf2
  jmp __alltraps
  10275e:	e9 0a f6 ff ff       	jmp    101d6d <__alltraps>

00102763 <vector243>:
.globl vector243
vector243:
  pushl $0
  102763:	6a 00                	push   $0x0
  pushl $243
  102765:	68 f3 00 00 00       	push   $0xf3
  jmp __alltraps
  10276a:	e9 fe f5 ff ff       	jmp    101d6d <__alltraps>

0010276f <vector244>:
.globl vector244
vector244:
  pushl $0
  10276f:	6a 00                	push   $0x0
  pushl $244
  102771:	68 f4 00 00 00       	push   $0xf4
  jmp __alltraps
  102776:	e9 f2 f5 ff ff       	jmp    101d6d <__alltraps>

0010277b <vector245>:
.globl vector245
vector245:
  pushl $0
  10277b:	6a 00                	push   $0x0
  pushl $245
  10277d:	68 f5 00 00 00       	push   $0xf5
  jmp __alltraps
  102782:	e9 e6 f5 ff ff       	jmp    101d6d <__alltraps>

00102787 <vector246>:
.globl vector246
vector246:
  pushl $0
  102787:	6a 00                	push   $0x0
  pushl $246
  102789:	68 f6 00 00 00       	push   $0xf6
  jmp __alltraps
  10278e:	e9 da f5 ff ff       	jmp    101d6d <__alltraps>

00102793 <vector247>:
.globl vector247
vector247:
  pushl $0
  102793:	6a 00                	push   $0x0
  pushl $247
  102795:	68 f7 00 00 00       	push   $0xf7
  jmp __alltraps
  10279a:	e9 ce f5 ff ff       	jmp    101d6d <__alltraps>

0010279f <vector248>:
.globl vector248
vector248:
  pushl $0
  10279f:	6a 00                	push   $0x0
  pushl $248
  1027a1:	68 f8 00 00 00       	push   $0xf8
  jmp __alltraps
  1027a6:	e9 c2 f5 ff ff       	jmp    101d6d <__alltraps>

001027ab <vector249>:
.globl vector249
vector249:
  pushl $0
  1027ab:	6a 00                	push   $0x0
  pushl $249
  1027ad:	68 f9 00 00 00       	push   $0xf9
  jmp __alltraps
  1027b2:	e9 b6 f5 ff ff       	jmp    101d6d <__alltraps>

001027b7 <vector250>:
.globl vector250
vector250:
  pushl $0
  1027b7:	6a 00                	push   $0x0
  pushl $250
  1027b9:	68 fa 00 00 00       	push   $0xfa
  jmp __alltraps
  1027be:	e9 aa f5 ff ff       	jmp    101d6d <__alltraps>

001027c3 <vector251>:
.globl vector251
vector251:
  pushl $0
  1027c3:	6a 00                	push   $0x0
  pushl $251
  1027c5:	68 fb 00 00 00       	push   $0xfb
  jmp __alltraps
  1027ca:	e9 9e f5 ff ff       	jmp    101d6d <__alltraps>

001027cf <vector252>:
.globl vector252
vector252:
  pushl $0
  1027cf:	6a 00                	push   $0x0
  pushl $252
  1027d1:	68 fc 00 00 00       	push   $0xfc
  jmp __alltraps
  1027d6:	e9 92 f5 ff ff       	jmp    101d6d <__alltraps>

001027db <vector253>:
.globl vector253
vector253:
  pushl $0
  1027db:	6a 00                	push   $0x0
  pushl $253
  1027dd:	68 fd 00 00 00       	push   $0xfd
  jmp __alltraps
  1027e2:	e9 86 f5 ff ff       	jmp    101d6d <__alltraps>

001027e7 <vector254>:
.globl vector254
vector254:
  pushl $0
  1027e7:	6a 00                	push   $0x0
  pushl $254
  1027e9:	68 fe 00 00 00       	push   $0xfe
  jmp __alltraps
  1027ee:	e9 7a f5 ff ff       	jmp    101d6d <__alltraps>

001027f3 <vector255>:
.globl vector255
vector255:
  pushl $0
  1027f3:	6a 00                	push   $0x0
  pushl $255
  1027f5:	68 ff 00 00 00       	push   $0xff
  jmp __alltraps
  1027fa:	e9 6e f5 ff ff       	jmp    101d6d <__alltraps>

001027ff <lgdt>:
/* *
 * lgdt - load the global descriptor table register and reset the
 * data/code segement registers for kernel.
 * */
static inline void
lgdt(struct pseudodesc *pd) {
  1027ff:	55                   	push   %ebp
  102800:	89 e5                	mov    %esp,%ebp
    asm volatile ("lgdt (%0)" :: "r" (pd));
  102802:	8b 45 08             	mov    0x8(%ebp),%eax
  102805:	0f 01 10             	lgdtl  (%eax)
    asm volatile ("movw %%ax, %%gs" :: "a" (USER_DS));
  102808:	b8 23 00 00 00       	mov    $0x23,%eax
  10280d:	8e e8                	mov    %eax,%gs
    asm volatile ("movw %%ax, %%fs" :: "a" (USER_DS));
  10280f:	b8 23 00 00 00       	mov    $0x23,%eax
  102814:	8e e0                	mov    %eax,%fs
    asm volatile ("movw %%ax, %%es" :: "a" (KERNEL_DS));
  102816:	b8 10 00 00 00       	mov    $0x10,%eax
  10281b:	8e c0                	mov    %eax,%es
    asm volatile ("movw %%ax, %%ds" :: "a" (KERNEL_DS));
  10281d:	b8 10 00 00 00       	mov    $0x10,%eax
  102822:	8e d8                	mov    %eax,%ds
    asm volatile ("movw %%ax, %%ss" :: "a" (KERNEL_DS));
  102824:	b8 10 00 00 00       	mov    $0x10,%eax
  102829:	8e d0                	mov    %eax,%ss
    // reload cs
    asm volatile ("ljmp %0, $1f\n 1:\n" :: "i" (KERNEL_CS));
  10282b:	ea 32 28 10 00 08 00 	ljmp   $0x8,$0x102832
}
  102832:	5d                   	pop    %ebp
  102833:	c3                   	ret    

00102834 <gdt_init>:
/* temporary kernel stack */
uint8_t stack0[1024];

/* gdt_init - initialize the default GDT and TSS */
static void
gdt_init(void) {
  102834:	55                   	push   %ebp
  102835:	89 e5                	mov    %esp,%ebp
  102837:	83 ec 14             	sub    $0x14,%esp
    // Setup a TSS so that we can get the right stack when we trap from
    // user to the kernel. But not safe here, it's only a temporary value,
    // it will be set to KSTACKTOP in lab2.
    ts.ts_esp0 = (uint32_t)&stack0 + sizeof(stack0);
  10283a:	b8 40 f9 10 00       	mov    $0x10f940,%eax
  10283f:	05 00 04 00 00       	add    $0x400,%eax
  102844:	a3 c4 f8 10 00       	mov    %eax,0x10f8c4
    ts.ts_ss0 = KERNEL_DS;
  102849:	66 c7 05 c8 f8 10 00 	movw   $0x10,0x10f8c8
  102850:	10 00 

    // initialize the TSS filed of the gdt
    gdt[SEG_TSS] = SEG16(STS_T32A, (uint32_t)&ts, sizeof(ts), DPL_KERNEL);
  102852:	66 c7 05 08 ea 10 00 	movw   $0x68,0x10ea08
  102859:	68 00 
  10285b:	b8 c0 f8 10 00       	mov    $0x10f8c0,%eax
  102860:	66 a3 0a ea 10 00    	mov    %ax,0x10ea0a
  102866:	b8 c0 f8 10 00       	mov    $0x10f8c0,%eax
  10286b:	c1 e8 10             	shr    $0x10,%eax
  10286e:	a2 0c ea 10 00       	mov    %al,0x10ea0c
  102873:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  10287a:	83 e0 f0             	and    $0xfffffff0,%eax
  10287d:	83 c8 09             	or     $0x9,%eax
  102880:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  102885:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  10288c:	83 c8 10             	or     $0x10,%eax
  10288f:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  102894:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  10289b:	83 e0 9f             	and    $0xffffff9f,%eax
  10289e:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  1028a3:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  1028aa:	83 c8 80             	or     $0xffffff80,%eax
  1028ad:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  1028b2:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  1028b9:	83 e0 f0             	and    $0xfffffff0,%eax
  1028bc:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  1028c1:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  1028c8:	83 e0 ef             	and    $0xffffffef,%eax
  1028cb:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  1028d0:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  1028d7:	83 e0 df             	and    $0xffffffdf,%eax
  1028da:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  1028df:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  1028e6:	83 c8 40             	or     $0x40,%eax
  1028e9:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  1028ee:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  1028f5:	83 e0 7f             	and    $0x7f,%eax
  1028f8:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  1028fd:	b8 c0 f8 10 00       	mov    $0x10f8c0,%eax
  102902:	c1 e8 18             	shr    $0x18,%eax
  102905:	a2 0f ea 10 00       	mov    %al,0x10ea0f
    gdt[SEG_TSS].sd_s = 0;
  10290a:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  102911:	83 e0 ef             	and    $0xffffffef,%eax
  102914:	a2 0d ea 10 00       	mov    %al,0x10ea0d

    // reload all segment registers
    lgdt(&gdt_pd);
  102919:	c7 04 24 10 ea 10 00 	movl   $0x10ea10,(%esp)
  102920:	e8 da fe ff ff       	call   1027ff <lgdt>
  102925:	66 c7 45 fe 28 00    	movw   $0x28,-0x2(%ebp)
    asm volatile ("cli");
}

static inline void
ltr(uint16_t sel) {
    asm volatile ("ltr %0" :: "r" (sel));
  10292b:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  10292f:	0f 00 d8             	ltr    %ax

    // load the TSS
    ltr(GD_TSS);
}
  102932:	c9                   	leave  
  102933:	c3                   	ret    

00102934 <pmm_init>:

/* pmm_init - initialize the physical memory management */
void
pmm_init(void) {
  102934:	55                   	push   %ebp
  102935:	89 e5                	mov    %esp,%ebp
    gdt_init();
  102937:	e8 f8 fe ff ff       	call   102834 <gdt_init>
}
  10293c:	5d                   	pop    %ebp
  10293d:	c3                   	ret    

0010293e <printnum>:
 * @width:         maximum number of digits, if the actual width is less than @width, use @padc instead
 * @padc:        character that padded on the left if the actual width is less than @width
 * */
static void
printnum(void (*putch)(int, void*), void *putdat,
        unsigned long long num, unsigned base, int width, int padc) {
  10293e:	55                   	push   %ebp
  10293f:	89 e5                	mov    %esp,%ebp
  102941:	83 ec 58             	sub    $0x58,%esp
  102944:	8b 45 10             	mov    0x10(%ebp),%eax
  102947:	89 45 d0             	mov    %eax,-0x30(%ebp)
  10294a:	8b 45 14             	mov    0x14(%ebp),%eax
  10294d:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    unsigned long long result = num;
  102950:	8b 45 d0             	mov    -0x30(%ebp),%eax
  102953:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  102956:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102959:	89 55 ec             	mov    %edx,-0x14(%ebp)
    unsigned mod = do_div(result, base);
  10295c:	8b 45 18             	mov    0x18(%ebp),%eax
  10295f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102962:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102965:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102968:	89 45 e0             	mov    %eax,-0x20(%ebp)
  10296b:	89 55 f0             	mov    %edx,-0x10(%ebp)
  10296e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102971:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102974:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  102978:	74 1c                	je     102996 <printnum+0x58>
  10297a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10297d:	ba 00 00 00 00       	mov    $0x0,%edx
  102982:	f7 75 e4             	divl   -0x1c(%ebp)
  102985:	89 55 f4             	mov    %edx,-0xc(%ebp)
  102988:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10298b:	ba 00 00 00 00       	mov    $0x0,%edx
  102990:	f7 75 e4             	divl   -0x1c(%ebp)
  102993:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102996:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102999:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10299c:	f7 75 e4             	divl   -0x1c(%ebp)
  10299f:	89 45 e0             	mov    %eax,-0x20(%ebp)
  1029a2:	89 55 dc             	mov    %edx,-0x24(%ebp)
  1029a5:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1029a8:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1029ab:	89 45 e8             	mov    %eax,-0x18(%ebp)
  1029ae:	89 55 ec             	mov    %edx,-0x14(%ebp)
  1029b1:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1029b4:	89 45 d8             	mov    %eax,-0x28(%ebp)

    // first recursively print all preceding (more significant) digits
    if (num >= base) {
  1029b7:	8b 45 18             	mov    0x18(%ebp),%eax
  1029ba:	ba 00 00 00 00       	mov    $0x0,%edx
  1029bf:	3b 55 d4             	cmp    -0x2c(%ebp),%edx
  1029c2:	77 56                	ja     102a1a <printnum+0xdc>
  1029c4:	3b 55 d4             	cmp    -0x2c(%ebp),%edx
  1029c7:	72 05                	jb     1029ce <printnum+0x90>
  1029c9:	3b 45 d0             	cmp    -0x30(%ebp),%eax
  1029cc:	77 4c                	ja     102a1a <printnum+0xdc>
        printnum(putch, putdat, result, base, width - 1, padc);
  1029ce:	8b 45 1c             	mov    0x1c(%ebp),%eax
  1029d1:	8d 50 ff             	lea    -0x1(%eax),%edx
  1029d4:	8b 45 20             	mov    0x20(%ebp),%eax
  1029d7:	89 44 24 18          	mov    %eax,0x18(%esp)
  1029db:	89 54 24 14          	mov    %edx,0x14(%esp)
  1029df:	8b 45 18             	mov    0x18(%ebp),%eax
  1029e2:	89 44 24 10          	mov    %eax,0x10(%esp)
  1029e6:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1029e9:	8b 55 ec             	mov    -0x14(%ebp),%edx
  1029ec:	89 44 24 08          	mov    %eax,0x8(%esp)
  1029f0:	89 54 24 0c          	mov    %edx,0xc(%esp)
  1029f4:	8b 45 0c             	mov    0xc(%ebp),%eax
  1029f7:	89 44 24 04          	mov    %eax,0x4(%esp)
  1029fb:	8b 45 08             	mov    0x8(%ebp),%eax
  1029fe:	89 04 24             	mov    %eax,(%esp)
  102a01:	e8 38 ff ff ff       	call   10293e <printnum>
  102a06:	eb 1c                	jmp    102a24 <printnum+0xe6>
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
            putch(padc, putdat);
  102a08:	8b 45 0c             	mov    0xc(%ebp),%eax
  102a0b:	89 44 24 04          	mov    %eax,0x4(%esp)
  102a0f:	8b 45 20             	mov    0x20(%ebp),%eax
  102a12:	89 04 24             	mov    %eax,(%esp)
  102a15:	8b 45 08             	mov    0x8(%ebp),%eax
  102a18:	ff d0                	call   *%eax
    // first recursively print all preceding (more significant) digits
    if (num >= base) {
        printnum(putch, putdat, result, base, width - 1, padc);
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
  102a1a:	83 6d 1c 01          	subl   $0x1,0x1c(%ebp)
  102a1e:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
  102a22:	7f e4                	jg     102a08 <printnum+0xca>
            putch(padc, putdat);
    }
    // then print this (the least significant) digit
    putch("0123456789abcdef"[mod], putdat);
  102a24:	8b 45 d8             	mov    -0x28(%ebp),%eax
  102a27:	05 10 3c 10 00       	add    $0x103c10,%eax
  102a2c:	0f b6 00             	movzbl (%eax),%eax
  102a2f:	0f be c0             	movsbl %al,%eax
  102a32:	8b 55 0c             	mov    0xc(%ebp),%edx
  102a35:	89 54 24 04          	mov    %edx,0x4(%esp)
  102a39:	89 04 24             	mov    %eax,(%esp)
  102a3c:	8b 45 08             	mov    0x8(%ebp),%eax
  102a3f:	ff d0                	call   *%eax
}
  102a41:	c9                   	leave  
  102a42:	c3                   	ret    

00102a43 <getuint>:
 * getuint - get an unsigned int of various possible sizes from a varargs list
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static unsigned long long
getuint(va_list *ap, int lflag) {
  102a43:	55                   	push   %ebp
  102a44:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  102a46:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  102a4a:	7e 14                	jle    102a60 <getuint+0x1d>
        return va_arg(*ap, unsigned long long);
  102a4c:	8b 45 08             	mov    0x8(%ebp),%eax
  102a4f:	8b 00                	mov    (%eax),%eax
  102a51:	8d 48 08             	lea    0x8(%eax),%ecx
  102a54:	8b 55 08             	mov    0x8(%ebp),%edx
  102a57:	89 0a                	mov    %ecx,(%edx)
  102a59:	8b 50 04             	mov    0x4(%eax),%edx
  102a5c:	8b 00                	mov    (%eax),%eax
  102a5e:	eb 30                	jmp    102a90 <getuint+0x4d>
    }
    else if (lflag) {
  102a60:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102a64:	74 16                	je     102a7c <getuint+0x39>
        return va_arg(*ap, unsigned long);
  102a66:	8b 45 08             	mov    0x8(%ebp),%eax
  102a69:	8b 00                	mov    (%eax),%eax
  102a6b:	8d 48 04             	lea    0x4(%eax),%ecx
  102a6e:	8b 55 08             	mov    0x8(%ebp),%edx
  102a71:	89 0a                	mov    %ecx,(%edx)
  102a73:	8b 00                	mov    (%eax),%eax
  102a75:	ba 00 00 00 00       	mov    $0x0,%edx
  102a7a:	eb 14                	jmp    102a90 <getuint+0x4d>
    }
    else {
        return va_arg(*ap, unsigned int);
  102a7c:	8b 45 08             	mov    0x8(%ebp),%eax
  102a7f:	8b 00                	mov    (%eax),%eax
  102a81:	8d 48 04             	lea    0x4(%eax),%ecx
  102a84:	8b 55 08             	mov    0x8(%ebp),%edx
  102a87:	89 0a                	mov    %ecx,(%edx)
  102a89:	8b 00                	mov    (%eax),%eax
  102a8b:	ba 00 00 00 00       	mov    $0x0,%edx
    }
}
  102a90:	5d                   	pop    %ebp
  102a91:	c3                   	ret    

00102a92 <getint>:
 * getint - same as getuint but signed, we can't use getuint because of sign extension
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static long long
getint(va_list *ap, int lflag) {
  102a92:	55                   	push   %ebp
  102a93:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  102a95:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  102a99:	7e 14                	jle    102aaf <getint+0x1d>
        return va_arg(*ap, long long);
  102a9b:	8b 45 08             	mov    0x8(%ebp),%eax
  102a9e:	8b 00                	mov    (%eax),%eax
  102aa0:	8d 48 08             	lea    0x8(%eax),%ecx
  102aa3:	8b 55 08             	mov    0x8(%ebp),%edx
  102aa6:	89 0a                	mov    %ecx,(%edx)
  102aa8:	8b 50 04             	mov    0x4(%eax),%edx
  102aab:	8b 00                	mov    (%eax),%eax
  102aad:	eb 28                	jmp    102ad7 <getint+0x45>
    }
    else if (lflag) {
  102aaf:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102ab3:	74 12                	je     102ac7 <getint+0x35>
        return va_arg(*ap, long);
  102ab5:	8b 45 08             	mov    0x8(%ebp),%eax
  102ab8:	8b 00                	mov    (%eax),%eax
  102aba:	8d 48 04             	lea    0x4(%eax),%ecx
  102abd:	8b 55 08             	mov    0x8(%ebp),%edx
  102ac0:	89 0a                	mov    %ecx,(%edx)
  102ac2:	8b 00                	mov    (%eax),%eax
  102ac4:	99                   	cltd   
  102ac5:	eb 10                	jmp    102ad7 <getint+0x45>
    }
    else {
        return va_arg(*ap, int);
  102ac7:	8b 45 08             	mov    0x8(%ebp),%eax
  102aca:	8b 00                	mov    (%eax),%eax
  102acc:	8d 48 04             	lea    0x4(%eax),%ecx
  102acf:	8b 55 08             	mov    0x8(%ebp),%edx
  102ad2:	89 0a                	mov    %ecx,(%edx)
  102ad4:	8b 00                	mov    (%eax),%eax
  102ad6:	99                   	cltd   
    }
}
  102ad7:	5d                   	pop    %ebp
  102ad8:	c3                   	ret    

00102ad9 <printfmt>:
 * @putch:        specified putch function, print a single character
 * @putdat:        used by @putch function
 * @fmt:        the format string to use
 * */
void
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...) {
  102ad9:	55                   	push   %ebp
  102ada:	89 e5                	mov    %esp,%ebp
  102adc:	83 ec 28             	sub    $0x28,%esp
    va_list ap;

    va_start(ap, fmt);
  102adf:	8d 45 14             	lea    0x14(%ebp),%eax
  102ae2:	89 45 f4             	mov    %eax,-0xc(%ebp)
    vprintfmt(putch, putdat, fmt, ap);
  102ae5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102ae8:	89 44 24 0c          	mov    %eax,0xc(%esp)
  102aec:	8b 45 10             	mov    0x10(%ebp),%eax
  102aef:	89 44 24 08          	mov    %eax,0x8(%esp)
  102af3:	8b 45 0c             	mov    0xc(%ebp),%eax
  102af6:	89 44 24 04          	mov    %eax,0x4(%esp)
  102afa:	8b 45 08             	mov    0x8(%ebp),%eax
  102afd:	89 04 24             	mov    %eax,(%esp)
  102b00:	e8 02 00 00 00       	call   102b07 <vprintfmt>
    va_end(ap);
}
  102b05:	c9                   	leave  
  102b06:	c3                   	ret    

00102b07 <vprintfmt>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want printfmt() instead.
 * */
void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap) {
  102b07:	55                   	push   %ebp
  102b08:	89 e5                	mov    %esp,%ebp
  102b0a:	56                   	push   %esi
  102b0b:	53                   	push   %ebx
  102b0c:	83 ec 40             	sub    $0x40,%esp
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  102b0f:	eb 18                	jmp    102b29 <vprintfmt+0x22>
            if (ch == '\0') {
  102b11:	85 db                	test   %ebx,%ebx
  102b13:	75 05                	jne    102b1a <vprintfmt+0x13>
                return;
  102b15:	e9 d1 03 00 00       	jmp    102eeb <vprintfmt+0x3e4>
            }
            putch(ch, putdat);
  102b1a:	8b 45 0c             	mov    0xc(%ebp),%eax
  102b1d:	89 44 24 04          	mov    %eax,0x4(%esp)
  102b21:	89 1c 24             	mov    %ebx,(%esp)
  102b24:	8b 45 08             	mov    0x8(%ebp),%eax
  102b27:	ff d0                	call   *%eax
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  102b29:	8b 45 10             	mov    0x10(%ebp),%eax
  102b2c:	8d 50 01             	lea    0x1(%eax),%edx
  102b2f:	89 55 10             	mov    %edx,0x10(%ebp)
  102b32:	0f b6 00             	movzbl (%eax),%eax
  102b35:	0f b6 d8             	movzbl %al,%ebx
  102b38:	83 fb 25             	cmp    $0x25,%ebx
  102b3b:	75 d4                	jne    102b11 <vprintfmt+0xa>
            }
            putch(ch, putdat);
        }

        // Process a %-escape sequence
        char padc = ' ';
  102b3d:	c6 45 db 20          	movb   $0x20,-0x25(%ebp)
        width = precision = -1;
  102b41:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
  102b48:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102b4b:	89 45 e8             	mov    %eax,-0x18(%ebp)
        lflag = altflag = 0;
  102b4e:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  102b55:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102b58:	89 45 e0             	mov    %eax,-0x20(%ebp)

    reswitch:
        switch (ch = *(unsigned char *)fmt ++) {
  102b5b:	8b 45 10             	mov    0x10(%ebp),%eax
  102b5e:	8d 50 01             	lea    0x1(%eax),%edx
  102b61:	89 55 10             	mov    %edx,0x10(%ebp)
  102b64:	0f b6 00             	movzbl (%eax),%eax
  102b67:	0f b6 d8             	movzbl %al,%ebx
  102b6a:	8d 43 dd             	lea    -0x23(%ebx),%eax
  102b6d:	83 f8 55             	cmp    $0x55,%eax
  102b70:	0f 87 44 03 00 00    	ja     102eba <vprintfmt+0x3b3>
  102b76:	8b 04 85 34 3c 10 00 	mov    0x103c34(,%eax,4),%eax
  102b7d:	ff e0                	jmp    *%eax

        // flag to pad on the right
        case '-':
            padc = '-';
  102b7f:	c6 45 db 2d          	movb   $0x2d,-0x25(%ebp)
            goto reswitch;
  102b83:	eb d6                	jmp    102b5b <vprintfmt+0x54>

        // flag to pad with 0's instead of spaces
        case '0':
            padc = '0';
  102b85:	c6 45 db 30          	movb   $0x30,-0x25(%ebp)
            goto reswitch;
  102b89:	eb d0                	jmp    102b5b <vprintfmt+0x54>

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  102b8b:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
                precision = precision * 10 + ch - '0';
  102b92:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  102b95:	89 d0                	mov    %edx,%eax
  102b97:	c1 e0 02             	shl    $0x2,%eax
  102b9a:	01 d0                	add    %edx,%eax
  102b9c:	01 c0                	add    %eax,%eax
  102b9e:	01 d8                	add    %ebx,%eax
  102ba0:	83 e8 30             	sub    $0x30,%eax
  102ba3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                ch = *fmt;
  102ba6:	8b 45 10             	mov    0x10(%ebp),%eax
  102ba9:	0f b6 00             	movzbl (%eax),%eax
  102bac:	0f be d8             	movsbl %al,%ebx
                if (ch < '0' || ch > '9') {
  102baf:	83 fb 2f             	cmp    $0x2f,%ebx
  102bb2:	7e 0b                	jle    102bbf <vprintfmt+0xb8>
  102bb4:	83 fb 39             	cmp    $0x39,%ebx
  102bb7:	7f 06                	jg     102bbf <vprintfmt+0xb8>
            padc = '0';
            goto reswitch;

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  102bb9:	83 45 10 01          	addl   $0x1,0x10(%ebp)
                precision = precision * 10 + ch - '0';
                ch = *fmt;
                if (ch < '0' || ch > '9') {
                    break;
                }
            }
  102bbd:	eb d3                	jmp    102b92 <vprintfmt+0x8b>
            goto process_precision;
  102bbf:	eb 33                	jmp    102bf4 <vprintfmt+0xed>

        case '*':
            precision = va_arg(ap, int);
  102bc1:	8b 45 14             	mov    0x14(%ebp),%eax
  102bc4:	8d 50 04             	lea    0x4(%eax),%edx
  102bc7:	89 55 14             	mov    %edx,0x14(%ebp)
  102bca:	8b 00                	mov    (%eax),%eax
  102bcc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            goto process_precision;
  102bcf:	eb 23                	jmp    102bf4 <vprintfmt+0xed>

        case '.':
            if (width < 0)
  102bd1:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102bd5:	79 0c                	jns    102be3 <vprintfmt+0xdc>
                width = 0;
  102bd7:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
            goto reswitch;
  102bde:	e9 78 ff ff ff       	jmp    102b5b <vprintfmt+0x54>
  102be3:	e9 73 ff ff ff       	jmp    102b5b <vprintfmt+0x54>

        case '#':
            altflag = 1;
  102be8:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
            goto reswitch;
  102bef:	e9 67 ff ff ff       	jmp    102b5b <vprintfmt+0x54>

        process_precision:
            if (width < 0)
  102bf4:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102bf8:	79 12                	jns    102c0c <vprintfmt+0x105>
                width = precision, precision = -1;
  102bfa:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102bfd:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102c00:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
            goto reswitch;
  102c07:	e9 4f ff ff ff       	jmp    102b5b <vprintfmt+0x54>
  102c0c:	e9 4a ff ff ff       	jmp    102b5b <vprintfmt+0x54>

        // long flag (doubled for long long)
        case 'l':
            lflag ++;
  102c11:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
            goto reswitch;
  102c15:	e9 41 ff ff ff       	jmp    102b5b <vprintfmt+0x54>

        // character
        case 'c':
            putch(va_arg(ap, int), putdat);
  102c1a:	8b 45 14             	mov    0x14(%ebp),%eax
  102c1d:	8d 50 04             	lea    0x4(%eax),%edx
  102c20:	89 55 14             	mov    %edx,0x14(%ebp)
  102c23:	8b 00                	mov    (%eax),%eax
  102c25:	8b 55 0c             	mov    0xc(%ebp),%edx
  102c28:	89 54 24 04          	mov    %edx,0x4(%esp)
  102c2c:	89 04 24             	mov    %eax,(%esp)
  102c2f:	8b 45 08             	mov    0x8(%ebp),%eax
  102c32:	ff d0                	call   *%eax
            break;
  102c34:	e9 ac 02 00 00       	jmp    102ee5 <vprintfmt+0x3de>

        // error message
        case 'e':
            err = va_arg(ap, int);
  102c39:	8b 45 14             	mov    0x14(%ebp),%eax
  102c3c:	8d 50 04             	lea    0x4(%eax),%edx
  102c3f:	89 55 14             	mov    %edx,0x14(%ebp)
  102c42:	8b 18                	mov    (%eax),%ebx
            if (err < 0) {
  102c44:	85 db                	test   %ebx,%ebx
  102c46:	79 02                	jns    102c4a <vprintfmt+0x143>
                err = -err;
  102c48:	f7 db                	neg    %ebx
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
  102c4a:	83 fb 06             	cmp    $0x6,%ebx
  102c4d:	7f 0b                	jg     102c5a <vprintfmt+0x153>
  102c4f:	8b 34 9d f4 3b 10 00 	mov    0x103bf4(,%ebx,4),%esi
  102c56:	85 f6                	test   %esi,%esi
  102c58:	75 23                	jne    102c7d <vprintfmt+0x176>
                printfmt(putch, putdat, "error %d", err);
  102c5a:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  102c5e:	c7 44 24 08 21 3c 10 	movl   $0x103c21,0x8(%esp)
  102c65:	00 
  102c66:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c69:	89 44 24 04          	mov    %eax,0x4(%esp)
  102c6d:	8b 45 08             	mov    0x8(%ebp),%eax
  102c70:	89 04 24             	mov    %eax,(%esp)
  102c73:	e8 61 fe ff ff       	call   102ad9 <printfmt>
            }
            else {
                printfmt(putch, putdat, "%s", p);
            }
            break;
  102c78:	e9 68 02 00 00       	jmp    102ee5 <vprintfmt+0x3de>
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
                printfmt(putch, putdat, "error %d", err);
            }
            else {
                printfmt(putch, putdat, "%s", p);
  102c7d:	89 74 24 0c          	mov    %esi,0xc(%esp)
  102c81:	c7 44 24 08 2a 3c 10 	movl   $0x103c2a,0x8(%esp)
  102c88:	00 
  102c89:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c8c:	89 44 24 04          	mov    %eax,0x4(%esp)
  102c90:	8b 45 08             	mov    0x8(%ebp),%eax
  102c93:	89 04 24             	mov    %eax,(%esp)
  102c96:	e8 3e fe ff ff       	call   102ad9 <printfmt>
            }
            break;
  102c9b:	e9 45 02 00 00       	jmp    102ee5 <vprintfmt+0x3de>

        // string
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
  102ca0:	8b 45 14             	mov    0x14(%ebp),%eax
  102ca3:	8d 50 04             	lea    0x4(%eax),%edx
  102ca6:	89 55 14             	mov    %edx,0x14(%ebp)
  102ca9:	8b 30                	mov    (%eax),%esi
  102cab:	85 f6                	test   %esi,%esi
  102cad:	75 05                	jne    102cb4 <vprintfmt+0x1ad>
                p = "(null)";
  102caf:	be 2d 3c 10 00       	mov    $0x103c2d,%esi
            }
            if (width > 0 && padc != '-') {
  102cb4:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102cb8:	7e 3e                	jle    102cf8 <vprintfmt+0x1f1>
  102cba:	80 7d db 2d          	cmpb   $0x2d,-0x25(%ebp)
  102cbe:	74 38                	je     102cf8 <vprintfmt+0x1f1>
                for (width -= strnlen(p, precision); width > 0; width --) {
  102cc0:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  102cc3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102cc6:	89 44 24 04          	mov    %eax,0x4(%esp)
  102cca:	89 34 24             	mov    %esi,(%esp)
  102ccd:	e8 15 03 00 00       	call   102fe7 <strnlen>
  102cd2:	29 c3                	sub    %eax,%ebx
  102cd4:	89 d8                	mov    %ebx,%eax
  102cd6:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102cd9:	eb 17                	jmp    102cf2 <vprintfmt+0x1eb>
                    putch(padc, putdat);
  102cdb:	0f be 45 db          	movsbl -0x25(%ebp),%eax
  102cdf:	8b 55 0c             	mov    0xc(%ebp),%edx
  102ce2:	89 54 24 04          	mov    %edx,0x4(%esp)
  102ce6:	89 04 24             	mov    %eax,(%esp)
  102ce9:	8b 45 08             	mov    0x8(%ebp),%eax
  102cec:	ff d0                	call   *%eax
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
                p = "(null)";
            }
            if (width > 0 && padc != '-') {
                for (width -= strnlen(p, precision); width > 0; width --) {
  102cee:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  102cf2:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102cf6:	7f e3                	jg     102cdb <vprintfmt+0x1d4>
                    putch(padc, putdat);
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  102cf8:	eb 38                	jmp    102d32 <vprintfmt+0x22b>
                if (altflag && (ch < ' ' || ch > '~')) {
  102cfa:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
  102cfe:	74 1f                	je     102d1f <vprintfmt+0x218>
  102d00:	83 fb 1f             	cmp    $0x1f,%ebx
  102d03:	7e 05                	jle    102d0a <vprintfmt+0x203>
  102d05:	83 fb 7e             	cmp    $0x7e,%ebx
  102d08:	7e 15                	jle    102d1f <vprintfmt+0x218>
                    putch('?', putdat);
  102d0a:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d0d:	89 44 24 04          	mov    %eax,0x4(%esp)
  102d11:	c7 04 24 3f 00 00 00 	movl   $0x3f,(%esp)
  102d18:	8b 45 08             	mov    0x8(%ebp),%eax
  102d1b:	ff d0                	call   *%eax
  102d1d:	eb 0f                	jmp    102d2e <vprintfmt+0x227>
                }
                else {
                    putch(ch, putdat);
  102d1f:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d22:	89 44 24 04          	mov    %eax,0x4(%esp)
  102d26:	89 1c 24             	mov    %ebx,(%esp)
  102d29:	8b 45 08             	mov    0x8(%ebp),%eax
  102d2c:	ff d0                	call   *%eax
            if (width > 0 && padc != '-') {
                for (width -= strnlen(p, precision); width > 0; width --) {
                    putch(padc, putdat);
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  102d2e:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  102d32:	89 f0                	mov    %esi,%eax
  102d34:	8d 70 01             	lea    0x1(%eax),%esi
  102d37:	0f b6 00             	movzbl (%eax),%eax
  102d3a:	0f be d8             	movsbl %al,%ebx
  102d3d:	85 db                	test   %ebx,%ebx
  102d3f:	74 10                	je     102d51 <vprintfmt+0x24a>
  102d41:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  102d45:	78 b3                	js     102cfa <vprintfmt+0x1f3>
  102d47:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
  102d4b:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  102d4f:	79 a9                	jns    102cfa <vprintfmt+0x1f3>
                }
                else {
                    putch(ch, putdat);
                }
            }
            for (; width > 0; width --) {
  102d51:	eb 17                	jmp    102d6a <vprintfmt+0x263>
                putch(' ', putdat);
  102d53:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d56:	89 44 24 04          	mov    %eax,0x4(%esp)
  102d5a:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  102d61:	8b 45 08             	mov    0x8(%ebp),%eax
  102d64:	ff d0                	call   *%eax
                }
                else {
                    putch(ch, putdat);
                }
            }
            for (; width > 0; width --) {
  102d66:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  102d6a:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102d6e:	7f e3                	jg     102d53 <vprintfmt+0x24c>
                putch(' ', putdat);
            }
            break;
  102d70:	e9 70 01 00 00       	jmp    102ee5 <vprintfmt+0x3de>

        // (signed) decimal
        case 'd':
            num = getint(&ap, lflag);
  102d75:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102d78:	89 44 24 04          	mov    %eax,0x4(%esp)
  102d7c:	8d 45 14             	lea    0x14(%ebp),%eax
  102d7f:	89 04 24             	mov    %eax,(%esp)
  102d82:	e8 0b fd ff ff       	call   102a92 <getint>
  102d87:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102d8a:	89 55 f4             	mov    %edx,-0xc(%ebp)
            if ((long long)num < 0) {
  102d8d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102d90:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102d93:	85 d2                	test   %edx,%edx
  102d95:	79 26                	jns    102dbd <vprintfmt+0x2b6>
                putch('-', putdat);
  102d97:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d9a:	89 44 24 04          	mov    %eax,0x4(%esp)
  102d9e:	c7 04 24 2d 00 00 00 	movl   $0x2d,(%esp)
  102da5:	8b 45 08             	mov    0x8(%ebp),%eax
  102da8:	ff d0                	call   *%eax
                num = -(long long)num;
  102daa:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102dad:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102db0:	f7 d8                	neg    %eax
  102db2:	83 d2 00             	adc    $0x0,%edx
  102db5:	f7 da                	neg    %edx
  102db7:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102dba:	89 55 f4             	mov    %edx,-0xc(%ebp)
            }
            base = 10;
  102dbd:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  102dc4:	e9 a8 00 00 00       	jmp    102e71 <vprintfmt+0x36a>

        // unsigned decimal
        case 'u':
            num = getuint(&ap, lflag);
  102dc9:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102dcc:	89 44 24 04          	mov    %eax,0x4(%esp)
  102dd0:	8d 45 14             	lea    0x14(%ebp),%eax
  102dd3:	89 04 24             	mov    %eax,(%esp)
  102dd6:	e8 68 fc ff ff       	call   102a43 <getuint>
  102ddb:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102dde:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 10;
  102de1:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  102de8:	e9 84 00 00 00       	jmp    102e71 <vprintfmt+0x36a>

        // (unsigned) octal
        case 'o':
            num = getuint(&ap, lflag);
  102ded:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102df0:	89 44 24 04          	mov    %eax,0x4(%esp)
  102df4:	8d 45 14             	lea    0x14(%ebp),%eax
  102df7:	89 04 24             	mov    %eax,(%esp)
  102dfa:	e8 44 fc ff ff       	call   102a43 <getuint>
  102dff:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102e02:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 8;
  102e05:	c7 45 ec 08 00 00 00 	movl   $0x8,-0x14(%ebp)
            goto number;
  102e0c:	eb 63                	jmp    102e71 <vprintfmt+0x36a>

        // pointer
        case 'p':
            putch('0', putdat);
  102e0e:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e11:	89 44 24 04          	mov    %eax,0x4(%esp)
  102e15:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
  102e1c:	8b 45 08             	mov    0x8(%ebp),%eax
  102e1f:	ff d0                	call   *%eax
            putch('x', putdat);
  102e21:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e24:	89 44 24 04          	mov    %eax,0x4(%esp)
  102e28:	c7 04 24 78 00 00 00 	movl   $0x78,(%esp)
  102e2f:	8b 45 08             	mov    0x8(%ebp),%eax
  102e32:	ff d0                	call   *%eax
            num = (unsigned long long)(uintptr_t)va_arg(ap, void *);
  102e34:	8b 45 14             	mov    0x14(%ebp),%eax
  102e37:	8d 50 04             	lea    0x4(%eax),%edx
  102e3a:	89 55 14             	mov    %edx,0x14(%ebp)
  102e3d:	8b 00                	mov    (%eax),%eax
  102e3f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102e42:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            base = 16;
  102e49:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
            goto number;
  102e50:	eb 1f                	jmp    102e71 <vprintfmt+0x36a>

        // (unsigned) hexadecimal
        case 'x':
            num = getuint(&ap, lflag);
  102e52:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102e55:	89 44 24 04          	mov    %eax,0x4(%esp)
  102e59:	8d 45 14             	lea    0x14(%ebp),%eax
  102e5c:	89 04 24             	mov    %eax,(%esp)
  102e5f:	e8 df fb ff ff       	call   102a43 <getuint>
  102e64:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102e67:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 16;
  102e6a:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
        number:
            printnum(putch, putdat, num, base, width, padc);
  102e71:	0f be 55 db          	movsbl -0x25(%ebp),%edx
  102e75:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102e78:	89 54 24 18          	mov    %edx,0x18(%esp)
  102e7c:	8b 55 e8             	mov    -0x18(%ebp),%edx
  102e7f:	89 54 24 14          	mov    %edx,0x14(%esp)
  102e83:	89 44 24 10          	mov    %eax,0x10(%esp)
  102e87:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102e8a:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102e8d:	89 44 24 08          	mov    %eax,0x8(%esp)
  102e91:	89 54 24 0c          	mov    %edx,0xc(%esp)
  102e95:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e98:	89 44 24 04          	mov    %eax,0x4(%esp)
  102e9c:	8b 45 08             	mov    0x8(%ebp),%eax
  102e9f:	89 04 24             	mov    %eax,(%esp)
  102ea2:	e8 97 fa ff ff       	call   10293e <printnum>
            break;
  102ea7:	eb 3c                	jmp    102ee5 <vprintfmt+0x3de>

        // escaped '%' character
        case '%':
            putch(ch, putdat);
  102ea9:	8b 45 0c             	mov    0xc(%ebp),%eax
  102eac:	89 44 24 04          	mov    %eax,0x4(%esp)
  102eb0:	89 1c 24             	mov    %ebx,(%esp)
  102eb3:	8b 45 08             	mov    0x8(%ebp),%eax
  102eb6:	ff d0                	call   *%eax
            break;
  102eb8:	eb 2b                	jmp    102ee5 <vprintfmt+0x3de>

        // unrecognized escape sequence - just print it literally
        default:
            putch('%', putdat);
  102eba:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ebd:	89 44 24 04          	mov    %eax,0x4(%esp)
  102ec1:	c7 04 24 25 00 00 00 	movl   $0x25,(%esp)
  102ec8:	8b 45 08             	mov    0x8(%ebp),%eax
  102ecb:	ff d0                	call   *%eax
            for (fmt --; fmt[-1] != '%'; fmt --)
  102ecd:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  102ed1:	eb 04                	jmp    102ed7 <vprintfmt+0x3d0>
  102ed3:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  102ed7:	8b 45 10             	mov    0x10(%ebp),%eax
  102eda:	83 e8 01             	sub    $0x1,%eax
  102edd:	0f b6 00             	movzbl (%eax),%eax
  102ee0:	3c 25                	cmp    $0x25,%al
  102ee2:	75 ef                	jne    102ed3 <vprintfmt+0x3cc>
                /* do nothing */;
            break;
  102ee4:	90                   	nop
        }
    }
  102ee5:	90                   	nop
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  102ee6:	e9 3e fc ff ff       	jmp    102b29 <vprintfmt+0x22>
            for (fmt --; fmt[-1] != '%'; fmt --)
                /* do nothing */;
            break;
        }
    }
}
  102eeb:	83 c4 40             	add    $0x40,%esp
  102eee:	5b                   	pop    %ebx
  102eef:	5e                   	pop    %esi
  102ef0:	5d                   	pop    %ebp
  102ef1:	c3                   	ret    

00102ef2 <sprintputch>:
 * sprintputch - 'print' a single character in a buffer
 * @ch:            the character will be printed
 * @b:            the buffer to place the character @ch
 * */
static void
sprintputch(int ch, struct sprintbuf *b) {
  102ef2:	55                   	push   %ebp
  102ef3:	89 e5                	mov    %esp,%ebp
    b->cnt ++;
  102ef5:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ef8:	8b 40 08             	mov    0x8(%eax),%eax
  102efb:	8d 50 01             	lea    0x1(%eax),%edx
  102efe:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f01:	89 50 08             	mov    %edx,0x8(%eax)
    if (b->buf < b->ebuf) {
  102f04:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f07:	8b 10                	mov    (%eax),%edx
  102f09:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f0c:	8b 40 04             	mov    0x4(%eax),%eax
  102f0f:	39 c2                	cmp    %eax,%edx
  102f11:	73 12                	jae    102f25 <sprintputch+0x33>
        *b->buf ++ = ch;
  102f13:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f16:	8b 00                	mov    (%eax),%eax
  102f18:	8d 48 01             	lea    0x1(%eax),%ecx
  102f1b:	8b 55 0c             	mov    0xc(%ebp),%edx
  102f1e:	89 0a                	mov    %ecx,(%edx)
  102f20:	8b 55 08             	mov    0x8(%ebp),%edx
  102f23:	88 10                	mov    %dl,(%eax)
    }
}
  102f25:	5d                   	pop    %ebp
  102f26:	c3                   	ret    

00102f27 <snprintf>:
 * @str:        the buffer to place the result into
 * @size:        the size of buffer, including the trailing null space
 * @fmt:        the format string to use
 * */
int
snprintf(char *str, size_t size, const char *fmt, ...) {
  102f27:	55                   	push   %ebp
  102f28:	89 e5                	mov    %esp,%ebp
  102f2a:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  102f2d:	8d 45 14             	lea    0x14(%ebp),%eax
  102f30:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vsnprintf(str, size, fmt, ap);
  102f33:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102f36:	89 44 24 0c          	mov    %eax,0xc(%esp)
  102f3a:	8b 45 10             	mov    0x10(%ebp),%eax
  102f3d:	89 44 24 08          	mov    %eax,0x8(%esp)
  102f41:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f44:	89 44 24 04          	mov    %eax,0x4(%esp)
  102f48:	8b 45 08             	mov    0x8(%ebp),%eax
  102f4b:	89 04 24             	mov    %eax,(%esp)
  102f4e:	e8 08 00 00 00       	call   102f5b <vsnprintf>
  102f53:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  102f56:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  102f59:	c9                   	leave  
  102f5a:	c3                   	ret    

00102f5b <vsnprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want snprintf() instead.
 * */
int
vsnprintf(char *str, size_t size, const char *fmt, va_list ap) {
  102f5b:	55                   	push   %ebp
  102f5c:	89 e5                	mov    %esp,%ebp
  102f5e:	83 ec 28             	sub    $0x28,%esp
    struct sprintbuf b = {str, str + size - 1, 0};
  102f61:	8b 45 08             	mov    0x8(%ebp),%eax
  102f64:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102f67:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f6a:	8d 50 ff             	lea    -0x1(%eax),%edx
  102f6d:	8b 45 08             	mov    0x8(%ebp),%eax
  102f70:	01 d0                	add    %edx,%eax
  102f72:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102f75:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    if (str == NULL || b.buf > b.ebuf) {
  102f7c:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  102f80:	74 0a                	je     102f8c <vsnprintf+0x31>
  102f82:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102f85:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102f88:	39 c2                	cmp    %eax,%edx
  102f8a:	76 07                	jbe    102f93 <vsnprintf+0x38>
        return -E_INVAL;
  102f8c:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  102f91:	eb 2a                	jmp    102fbd <vsnprintf+0x62>
    }
    // print the string to the buffer
    vprintfmt((void*)sprintputch, &b, fmt, ap);
  102f93:	8b 45 14             	mov    0x14(%ebp),%eax
  102f96:	89 44 24 0c          	mov    %eax,0xc(%esp)
  102f9a:	8b 45 10             	mov    0x10(%ebp),%eax
  102f9d:	89 44 24 08          	mov    %eax,0x8(%esp)
  102fa1:	8d 45 ec             	lea    -0x14(%ebp),%eax
  102fa4:	89 44 24 04          	mov    %eax,0x4(%esp)
  102fa8:	c7 04 24 f2 2e 10 00 	movl   $0x102ef2,(%esp)
  102faf:	e8 53 fb ff ff       	call   102b07 <vprintfmt>
    // null terminate the buffer
    *b.buf = '\0';
  102fb4:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102fb7:	c6 00 00             	movb   $0x0,(%eax)
    return b.cnt;
  102fba:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  102fbd:	c9                   	leave  
  102fbe:	c3                   	ret    

00102fbf <strlen>:
 * @s:        the input string
 *
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
  102fbf:	55                   	push   %ebp
  102fc0:	89 e5                	mov    %esp,%ebp
  102fc2:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  102fc5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (*s ++ != '\0') {
  102fcc:	eb 04                	jmp    102fd2 <strlen+0x13>
        cnt ++;
  102fce:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
    size_t cnt = 0;
    while (*s ++ != '\0') {
  102fd2:	8b 45 08             	mov    0x8(%ebp),%eax
  102fd5:	8d 50 01             	lea    0x1(%eax),%edx
  102fd8:	89 55 08             	mov    %edx,0x8(%ebp)
  102fdb:	0f b6 00             	movzbl (%eax),%eax
  102fde:	84 c0                	test   %al,%al
  102fe0:	75 ec                	jne    102fce <strlen+0xf>
        cnt ++;
    }
    return cnt;
  102fe2:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  102fe5:	c9                   	leave  
  102fe6:	c3                   	ret    

00102fe7 <strnlen>:
 * The return value is strlen(s), if that is less than @len, or
 * @len if there is no '\0' character among the first @len characters
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
  102fe7:	55                   	push   %ebp
  102fe8:	89 e5                	mov    %esp,%ebp
  102fea:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  102fed:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  102ff4:	eb 04                	jmp    102ffa <strnlen+0x13>
        cnt ++;
  102ff6:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
    size_t cnt = 0;
    while (cnt < len && *s ++ != '\0') {
  102ffa:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102ffd:	3b 45 0c             	cmp    0xc(%ebp),%eax
  103000:	73 10                	jae    103012 <strnlen+0x2b>
  103002:	8b 45 08             	mov    0x8(%ebp),%eax
  103005:	8d 50 01             	lea    0x1(%eax),%edx
  103008:	89 55 08             	mov    %edx,0x8(%ebp)
  10300b:	0f b6 00             	movzbl (%eax),%eax
  10300e:	84 c0                	test   %al,%al
  103010:	75 e4                	jne    102ff6 <strnlen+0xf>
        cnt ++;
    }
    return cnt;
  103012:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  103015:	c9                   	leave  
  103016:	c3                   	ret    

00103017 <strcpy>:
 * To avoid overflows, the size of array pointed by @dst should be long enough to
 * contain the same string as @src (including the terminating null character), and
 * should not overlap in memory with @src.
 * */
char *
strcpy(char *dst, const char *src) {
  103017:	55                   	push   %ebp
  103018:	89 e5                	mov    %esp,%ebp
  10301a:	57                   	push   %edi
  10301b:	56                   	push   %esi
  10301c:	83 ec 20             	sub    $0x20,%esp
  10301f:	8b 45 08             	mov    0x8(%ebp),%eax
  103022:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103025:	8b 45 0c             	mov    0xc(%ebp),%eax
  103028:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_STRCPY
#define __HAVE_ARCH_STRCPY
static inline char *
__strcpy(char *dst, const char *src) {
    int d0, d1, d2;
    asm volatile (
  10302b:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10302e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103031:	89 d1                	mov    %edx,%ecx
  103033:	89 c2                	mov    %eax,%edx
  103035:	89 ce                	mov    %ecx,%esi
  103037:	89 d7                	mov    %edx,%edi
  103039:	ac                   	lods   %ds:(%esi),%al
  10303a:	aa                   	stos   %al,%es:(%edi)
  10303b:	84 c0                	test   %al,%al
  10303d:	75 fa                	jne    103039 <strcpy+0x22>
  10303f:	89 fa                	mov    %edi,%edx
  103041:	89 f1                	mov    %esi,%ecx
  103043:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  103046:	89 55 e8             	mov    %edx,-0x18(%ebp)
  103049:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            "stosb;"
            "testb %%al, %%al;"
            "jne 1b;"
            : "=&S" (d0), "=&D" (d1), "=&a" (d2)
            : "0" (src), "1" (dst) : "memory");
    return dst;
  10304c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    char *p = dst;
    while ((*p ++ = *src ++) != '\0')
        /* nothing */;
    return dst;
#endif /* __HAVE_ARCH_STRCPY */
}
  10304f:	83 c4 20             	add    $0x20,%esp
  103052:	5e                   	pop    %esi
  103053:	5f                   	pop    %edi
  103054:	5d                   	pop    %ebp
  103055:	c3                   	ret    

00103056 <strncpy>:
 * @len:    maximum number of characters to be copied from @src
 *
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
  103056:	55                   	push   %ebp
  103057:	89 e5                	mov    %esp,%ebp
  103059:	83 ec 10             	sub    $0x10,%esp
    char *p = dst;
  10305c:	8b 45 08             	mov    0x8(%ebp),%eax
  10305f:	89 45 fc             	mov    %eax,-0x4(%ebp)
    while (len > 0) {
  103062:	eb 21                	jmp    103085 <strncpy+0x2f>
        if ((*p = *src) != '\0') {
  103064:	8b 45 0c             	mov    0xc(%ebp),%eax
  103067:	0f b6 10             	movzbl (%eax),%edx
  10306a:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10306d:	88 10                	mov    %dl,(%eax)
  10306f:	8b 45 fc             	mov    -0x4(%ebp),%eax
  103072:	0f b6 00             	movzbl (%eax),%eax
  103075:	84 c0                	test   %al,%al
  103077:	74 04                	je     10307d <strncpy+0x27>
            src ++;
  103079:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
        }
        p ++, len --;
  10307d:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  103081:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
    char *p = dst;
    while (len > 0) {
  103085:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  103089:	75 d9                	jne    103064 <strncpy+0xe>
        if ((*p = *src) != '\0') {
            src ++;
        }
        p ++, len --;
    }
    return dst;
  10308b:	8b 45 08             	mov    0x8(%ebp),%eax
}
  10308e:	c9                   	leave  
  10308f:	c3                   	ret    

00103090 <strcmp>:
 * - A value greater than zero indicates that the first character that does
 *   not match has a greater value in @s1 than in @s2;
 * - And a value less than zero indicates the opposite.
 * */
int
strcmp(const char *s1, const char *s2) {
  103090:	55                   	push   %ebp
  103091:	89 e5                	mov    %esp,%ebp
  103093:	57                   	push   %edi
  103094:	56                   	push   %esi
  103095:	83 ec 20             	sub    $0x20,%esp
  103098:	8b 45 08             	mov    0x8(%ebp),%eax
  10309b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10309e:	8b 45 0c             	mov    0xc(%ebp),%eax
  1030a1:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_STRCMP
#define __HAVE_ARCH_STRCMP
static inline int
__strcmp(const char *s1, const char *s2) {
    int d0, d1, ret;
    asm volatile (
  1030a4:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1030a7:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1030aa:	89 d1                	mov    %edx,%ecx
  1030ac:	89 c2                	mov    %eax,%edx
  1030ae:	89 ce                	mov    %ecx,%esi
  1030b0:	89 d7                	mov    %edx,%edi
  1030b2:	ac                   	lods   %ds:(%esi),%al
  1030b3:	ae                   	scas   %es:(%edi),%al
  1030b4:	75 08                	jne    1030be <strcmp+0x2e>
  1030b6:	84 c0                	test   %al,%al
  1030b8:	75 f8                	jne    1030b2 <strcmp+0x22>
  1030ba:	31 c0                	xor    %eax,%eax
  1030bc:	eb 04                	jmp    1030c2 <strcmp+0x32>
  1030be:	19 c0                	sbb    %eax,%eax
  1030c0:	0c 01                	or     $0x1,%al
  1030c2:	89 fa                	mov    %edi,%edx
  1030c4:	89 f1                	mov    %esi,%ecx
  1030c6:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1030c9:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  1030cc:	89 55 e4             	mov    %edx,-0x1c(%ebp)
            "orb $1, %%al;"
            "3:"
            : "=a" (ret), "=&S" (d0), "=&D" (d1)
            : "1" (s1), "2" (s2)
            : "memory");
    return ret;
  1030cf:	8b 45 ec             	mov    -0x14(%ebp),%eax
    while (*s1 != '\0' && *s1 == *s2) {
        s1 ++, s2 ++;
    }
    return (int)((unsigned char)*s1 - (unsigned char)*s2);
#endif /* __HAVE_ARCH_STRCMP */
}
  1030d2:	83 c4 20             	add    $0x20,%esp
  1030d5:	5e                   	pop    %esi
  1030d6:	5f                   	pop    %edi
  1030d7:	5d                   	pop    %ebp
  1030d8:	c3                   	ret    

001030d9 <strncmp>:
 * they are equal to each other, it continues with the following pairs until
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
  1030d9:	55                   	push   %ebp
  1030da:	89 e5                	mov    %esp,%ebp
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  1030dc:	eb 0c                	jmp    1030ea <strncmp+0x11>
        n --, s1 ++, s2 ++;
  1030de:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  1030e2:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  1030e6:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  1030ea:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1030ee:	74 1a                	je     10310a <strncmp+0x31>
  1030f0:	8b 45 08             	mov    0x8(%ebp),%eax
  1030f3:	0f b6 00             	movzbl (%eax),%eax
  1030f6:	84 c0                	test   %al,%al
  1030f8:	74 10                	je     10310a <strncmp+0x31>
  1030fa:	8b 45 08             	mov    0x8(%ebp),%eax
  1030fd:	0f b6 10             	movzbl (%eax),%edx
  103100:	8b 45 0c             	mov    0xc(%ebp),%eax
  103103:	0f b6 00             	movzbl (%eax),%eax
  103106:	38 c2                	cmp    %al,%dl
  103108:	74 d4                	je     1030de <strncmp+0x5>
        n --, s1 ++, s2 ++;
    }
    return (n == 0) ? 0 : (int)((unsigned char)*s1 - (unsigned char)*s2);
  10310a:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  10310e:	74 18                	je     103128 <strncmp+0x4f>
  103110:	8b 45 08             	mov    0x8(%ebp),%eax
  103113:	0f b6 00             	movzbl (%eax),%eax
  103116:	0f b6 d0             	movzbl %al,%edx
  103119:	8b 45 0c             	mov    0xc(%ebp),%eax
  10311c:	0f b6 00             	movzbl (%eax),%eax
  10311f:	0f b6 c0             	movzbl %al,%eax
  103122:	29 c2                	sub    %eax,%edx
  103124:	89 d0                	mov    %edx,%eax
  103126:	eb 05                	jmp    10312d <strncmp+0x54>
  103128:	b8 00 00 00 00       	mov    $0x0,%eax
}
  10312d:	5d                   	pop    %ebp
  10312e:	c3                   	ret    

0010312f <strchr>:
 *
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
  10312f:	55                   	push   %ebp
  103130:	89 e5                	mov    %esp,%ebp
  103132:	83 ec 04             	sub    $0x4,%esp
  103135:	8b 45 0c             	mov    0xc(%ebp),%eax
  103138:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  10313b:	eb 14                	jmp    103151 <strchr+0x22>
        if (*s == c) {
  10313d:	8b 45 08             	mov    0x8(%ebp),%eax
  103140:	0f b6 00             	movzbl (%eax),%eax
  103143:	3a 45 fc             	cmp    -0x4(%ebp),%al
  103146:	75 05                	jne    10314d <strchr+0x1e>
            return (char *)s;
  103148:	8b 45 08             	mov    0x8(%ebp),%eax
  10314b:	eb 13                	jmp    103160 <strchr+0x31>
        }
        s ++;
  10314d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
    while (*s != '\0') {
  103151:	8b 45 08             	mov    0x8(%ebp),%eax
  103154:	0f b6 00             	movzbl (%eax),%eax
  103157:	84 c0                	test   %al,%al
  103159:	75 e2                	jne    10313d <strchr+0xe>
        if (*s == c) {
            return (char *)s;
        }
        s ++;
    }
    return NULL;
  10315b:	b8 00 00 00 00       	mov    $0x0,%eax
}
  103160:	c9                   	leave  
  103161:	c3                   	ret    

00103162 <strfind>:
 * The strfind() function is like strchr() except that if @c is
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
  103162:	55                   	push   %ebp
  103163:	89 e5                	mov    %esp,%ebp
  103165:	83 ec 04             	sub    $0x4,%esp
  103168:	8b 45 0c             	mov    0xc(%ebp),%eax
  10316b:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  10316e:	eb 11                	jmp    103181 <strfind+0x1f>
        if (*s == c) {
  103170:	8b 45 08             	mov    0x8(%ebp),%eax
  103173:	0f b6 00             	movzbl (%eax),%eax
  103176:	3a 45 fc             	cmp    -0x4(%ebp),%al
  103179:	75 02                	jne    10317d <strfind+0x1b>
            break;
  10317b:	eb 0e                	jmp    10318b <strfind+0x29>
        }
        s ++;
  10317d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
    while (*s != '\0') {
  103181:	8b 45 08             	mov    0x8(%ebp),%eax
  103184:	0f b6 00             	movzbl (%eax),%eax
  103187:	84 c0                	test   %al,%al
  103189:	75 e5                	jne    103170 <strfind+0xe>
        if (*s == c) {
            break;
        }
        s ++;
    }
    return (char *)s;
  10318b:	8b 45 08             	mov    0x8(%ebp),%eax
}
  10318e:	c9                   	leave  
  10318f:	c3                   	ret    

00103190 <strtol>:
 * an optional "0x" or "0X" prefix.
 *
 * The strtol() function returns the converted integral number as a long int value.
 * */
long
strtol(const char *s, char **endptr, int base) {
  103190:	55                   	push   %ebp
  103191:	89 e5                	mov    %esp,%ebp
  103193:	83 ec 10             	sub    $0x10,%esp
    int neg = 0;
  103196:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    long val = 0;
  10319d:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  1031a4:	eb 04                	jmp    1031aa <strtol+0x1a>
        s ++;
  1031a6:	83 45 08 01          	addl   $0x1,0x8(%ebp)
strtol(const char *s, char **endptr, int base) {
    int neg = 0;
    long val = 0;

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  1031aa:	8b 45 08             	mov    0x8(%ebp),%eax
  1031ad:	0f b6 00             	movzbl (%eax),%eax
  1031b0:	3c 20                	cmp    $0x20,%al
  1031b2:	74 f2                	je     1031a6 <strtol+0x16>
  1031b4:	8b 45 08             	mov    0x8(%ebp),%eax
  1031b7:	0f b6 00             	movzbl (%eax),%eax
  1031ba:	3c 09                	cmp    $0x9,%al
  1031bc:	74 e8                	je     1031a6 <strtol+0x16>
        s ++;
    }

    // plus/minus sign
    if (*s == '+') {
  1031be:	8b 45 08             	mov    0x8(%ebp),%eax
  1031c1:	0f b6 00             	movzbl (%eax),%eax
  1031c4:	3c 2b                	cmp    $0x2b,%al
  1031c6:	75 06                	jne    1031ce <strtol+0x3e>
        s ++;
  1031c8:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  1031cc:	eb 15                	jmp    1031e3 <strtol+0x53>
    }
    else if (*s == '-') {
  1031ce:	8b 45 08             	mov    0x8(%ebp),%eax
  1031d1:	0f b6 00             	movzbl (%eax),%eax
  1031d4:	3c 2d                	cmp    $0x2d,%al
  1031d6:	75 0b                	jne    1031e3 <strtol+0x53>
        s ++, neg = 1;
  1031d8:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  1031dc:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)
    }

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x')) {
  1031e3:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1031e7:	74 06                	je     1031ef <strtol+0x5f>
  1031e9:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
  1031ed:	75 24                	jne    103213 <strtol+0x83>
  1031ef:	8b 45 08             	mov    0x8(%ebp),%eax
  1031f2:	0f b6 00             	movzbl (%eax),%eax
  1031f5:	3c 30                	cmp    $0x30,%al
  1031f7:	75 1a                	jne    103213 <strtol+0x83>
  1031f9:	8b 45 08             	mov    0x8(%ebp),%eax
  1031fc:	83 c0 01             	add    $0x1,%eax
  1031ff:	0f b6 00             	movzbl (%eax),%eax
  103202:	3c 78                	cmp    $0x78,%al
  103204:	75 0d                	jne    103213 <strtol+0x83>
        s += 2, base = 16;
  103206:	83 45 08 02          	addl   $0x2,0x8(%ebp)
  10320a:	c7 45 10 10 00 00 00 	movl   $0x10,0x10(%ebp)
  103211:	eb 2a                	jmp    10323d <strtol+0xad>
    }
    else if (base == 0 && s[0] == '0') {
  103213:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  103217:	75 17                	jne    103230 <strtol+0xa0>
  103219:	8b 45 08             	mov    0x8(%ebp),%eax
  10321c:	0f b6 00             	movzbl (%eax),%eax
  10321f:	3c 30                	cmp    $0x30,%al
  103221:	75 0d                	jne    103230 <strtol+0xa0>
        s ++, base = 8;
  103223:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  103227:	c7 45 10 08 00 00 00 	movl   $0x8,0x10(%ebp)
  10322e:	eb 0d                	jmp    10323d <strtol+0xad>
    }
    else if (base == 0) {
  103230:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  103234:	75 07                	jne    10323d <strtol+0xad>
        base = 10;
  103236:	c7 45 10 0a 00 00 00 	movl   $0xa,0x10(%ebp)

    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9') {
  10323d:	8b 45 08             	mov    0x8(%ebp),%eax
  103240:	0f b6 00             	movzbl (%eax),%eax
  103243:	3c 2f                	cmp    $0x2f,%al
  103245:	7e 1b                	jle    103262 <strtol+0xd2>
  103247:	8b 45 08             	mov    0x8(%ebp),%eax
  10324a:	0f b6 00             	movzbl (%eax),%eax
  10324d:	3c 39                	cmp    $0x39,%al
  10324f:	7f 11                	jg     103262 <strtol+0xd2>
            dig = *s - '0';
  103251:	8b 45 08             	mov    0x8(%ebp),%eax
  103254:	0f b6 00             	movzbl (%eax),%eax
  103257:	0f be c0             	movsbl %al,%eax
  10325a:	83 e8 30             	sub    $0x30,%eax
  10325d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103260:	eb 48                	jmp    1032aa <strtol+0x11a>
        }
        else if (*s >= 'a' && *s <= 'z') {
  103262:	8b 45 08             	mov    0x8(%ebp),%eax
  103265:	0f b6 00             	movzbl (%eax),%eax
  103268:	3c 60                	cmp    $0x60,%al
  10326a:	7e 1b                	jle    103287 <strtol+0xf7>
  10326c:	8b 45 08             	mov    0x8(%ebp),%eax
  10326f:	0f b6 00             	movzbl (%eax),%eax
  103272:	3c 7a                	cmp    $0x7a,%al
  103274:	7f 11                	jg     103287 <strtol+0xf7>
            dig = *s - 'a' + 10;
  103276:	8b 45 08             	mov    0x8(%ebp),%eax
  103279:	0f b6 00             	movzbl (%eax),%eax
  10327c:	0f be c0             	movsbl %al,%eax
  10327f:	83 e8 57             	sub    $0x57,%eax
  103282:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103285:	eb 23                	jmp    1032aa <strtol+0x11a>
        }
        else if (*s >= 'A' && *s <= 'Z') {
  103287:	8b 45 08             	mov    0x8(%ebp),%eax
  10328a:	0f b6 00             	movzbl (%eax),%eax
  10328d:	3c 40                	cmp    $0x40,%al
  10328f:	7e 3d                	jle    1032ce <strtol+0x13e>
  103291:	8b 45 08             	mov    0x8(%ebp),%eax
  103294:	0f b6 00             	movzbl (%eax),%eax
  103297:	3c 5a                	cmp    $0x5a,%al
  103299:	7f 33                	jg     1032ce <strtol+0x13e>
            dig = *s - 'A' + 10;
  10329b:	8b 45 08             	mov    0x8(%ebp),%eax
  10329e:	0f b6 00             	movzbl (%eax),%eax
  1032a1:	0f be c0             	movsbl %al,%eax
  1032a4:	83 e8 37             	sub    $0x37,%eax
  1032a7:	89 45 f4             	mov    %eax,-0xc(%ebp)
        }
        else {
            break;
        }
        if (dig >= base) {
  1032aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1032ad:	3b 45 10             	cmp    0x10(%ebp),%eax
  1032b0:	7c 02                	jl     1032b4 <strtol+0x124>
            break;
  1032b2:	eb 1a                	jmp    1032ce <strtol+0x13e>
        }
        s ++, val = (val * base) + dig;
  1032b4:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  1032b8:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1032bb:	0f af 45 10          	imul   0x10(%ebp),%eax
  1032bf:	89 c2                	mov    %eax,%edx
  1032c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1032c4:	01 d0                	add    %edx,%eax
  1032c6:	89 45 f8             	mov    %eax,-0x8(%ebp)
        // we don't properly detect overflow!
    }
  1032c9:	e9 6f ff ff ff       	jmp    10323d <strtol+0xad>

    if (endptr) {
  1032ce:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  1032d2:	74 08                	je     1032dc <strtol+0x14c>
        *endptr = (char *) s;
  1032d4:	8b 45 0c             	mov    0xc(%ebp),%eax
  1032d7:	8b 55 08             	mov    0x8(%ebp),%edx
  1032da:	89 10                	mov    %edx,(%eax)
    }
    return (neg ? -val : val);
  1032dc:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
  1032e0:	74 07                	je     1032e9 <strtol+0x159>
  1032e2:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1032e5:	f7 d8                	neg    %eax
  1032e7:	eb 03                	jmp    1032ec <strtol+0x15c>
  1032e9:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
  1032ec:	c9                   	leave  
  1032ed:	c3                   	ret    

001032ee <memset>:
 * @n:        number of bytes to be set to the value
 *
 * The memset() function returns @s.
 * */
void *
memset(void *s, char c, size_t n) {
  1032ee:	55                   	push   %ebp
  1032ef:	89 e5                	mov    %esp,%ebp
  1032f1:	57                   	push   %edi
  1032f2:	83 ec 24             	sub    $0x24,%esp
  1032f5:	8b 45 0c             	mov    0xc(%ebp),%eax
  1032f8:	88 45 d8             	mov    %al,-0x28(%ebp)
#ifdef __HAVE_ARCH_MEMSET
    return __memset(s, c, n);
  1032fb:	0f be 45 d8          	movsbl -0x28(%ebp),%eax
  1032ff:	8b 55 08             	mov    0x8(%ebp),%edx
  103302:	89 55 f8             	mov    %edx,-0x8(%ebp)
  103305:	88 45 f7             	mov    %al,-0x9(%ebp)
  103308:	8b 45 10             	mov    0x10(%ebp),%eax
  10330b:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_MEMSET
#define __HAVE_ARCH_MEMSET
static inline void *
__memset(void *s, char c, size_t n) {
    int d0, d1;
    asm volatile (
  10330e:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  103311:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  103315:	8b 55 f8             	mov    -0x8(%ebp),%edx
  103318:	89 d7                	mov    %edx,%edi
  10331a:	f3 aa                	rep stos %al,%es:(%edi)
  10331c:	89 fa                	mov    %edi,%edx
  10331e:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  103321:	89 55 e8             	mov    %edx,-0x18(%ebp)
            "rep; stosb;"
            : "=&c" (d0), "=&D" (d1)
            : "0" (n), "a" (c), "1" (s)
            : "memory");
    return s;
  103324:	8b 45 f8             	mov    -0x8(%ebp),%eax
    while (n -- > 0) {
        *p ++ = c;
    }
    return s;
#endif /* __HAVE_ARCH_MEMSET */
}
  103327:	83 c4 24             	add    $0x24,%esp
  10332a:	5f                   	pop    %edi
  10332b:	5d                   	pop    %ebp
  10332c:	c3                   	ret    

0010332d <memmove>:
 * @n:        number of bytes to copy
 *
 * The memmove() function returns @dst.
 * */
void *
memmove(void *dst, const void *src, size_t n) {
  10332d:	55                   	push   %ebp
  10332e:	89 e5                	mov    %esp,%ebp
  103330:	57                   	push   %edi
  103331:	56                   	push   %esi
  103332:	53                   	push   %ebx
  103333:	83 ec 30             	sub    $0x30,%esp
  103336:	8b 45 08             	mov    0x8(%ebp),%eax
  103339:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10333c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10333f:	89 45 ec             	mov    %eax,-0x14(%ebp)
  103342:	8b 45 10             	mov    0x10(%ebp),%eax
  103345:	89 45 e8             	mov    %eax,-0x18(%ebp)

#ifndef __HAVE_ARCH_MEMMOVE
#define __HAVE_ARCH_MEMMOVE
static inline void *
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
  103348:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10334b:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  10334e:	73 42                	jae    103392 <memmove+0x65>
  103350:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103353:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  103356:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103359:	89 45 e0             	mov    %eax,-0x20(%ebp)
  10335c:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10335f:	89 45 dc             	mov    %eax,-0x24(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  103362:	8b 45 dc             	mov    -0x24(%ebp),%eax
  103365:	c1 e8 02             	shr    $0x2,%eax
  103368:	89 c1                	mov    %eax,%ecx
#ifndef __HAVE_ARCH_MEMCPY
#define __HAVE_ARCH_MEMCPY
static inline void *
__memcpy(void *dst, const void *src, size_t n) {
    int d0, d1, d2;
    asm volatile (
  10336a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  10336d:	8b 45 e0             	mov    -0x20(%ebp),%eax
  103370:	89 d7                	mov    %edx,%edi
  103372:	89 c6                	mov    %eax,%esi
  103374:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  103376:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  103379:	83 e1 03             	and    $0x3,%ecx
  10337c:	74 02                	je     103380 <memmove+0x53>
  10337e:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  103380:	89 f0                	mov    %esi,%eax
  103382:	89 fa                	mov    %edi,%edx
  103384:	89 4d d8             	mov    %ecx,-0x28(%ebp)
  103387:	89 55 d4             	mov    %edx,-0x2c(%ebp)
  10338a:	89 45 d0             	mov    %eax,-0x30(%ebp)
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
            : "memory");
    return dst;
  10338d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  103390:	eb 36                	jmp    1033c8 <memmove+0x9b>
    asm volatile (
            "std;"
            "rep; movsb;"
            "cld;"
            : "=&c" (d0), "=&S" (d1), "=&D" (d2)
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
  103392:	8b 45 e8             	mov    -0x18(%ebp),%eax
  103395:	8d 50 ff             	lea    -0x1(%eax),%edx
  103398:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10339b:	01 c2                	add    %eax,%edx
  10339d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1033a0:	8d 48 ff             	lea    -0x1(%eax),%ecx
  1033a3:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1033a6:	8d 1c 01             	lea    (%ecx,%eax,1),%ebx
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
        return __memcpy(dst, src, n);
    }
    int d0, d1, d2;
    asm volatile (
  1033a9:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1033ac:	89 c1                	mov    %eax,%ecx
  1033ae:	89 d8                	mov    %ebx,%eax
  1033b0:	89 d6                	mov    %edx,%esi
  1033b2:	89 c7                	mov    %eax,%edi
  1033b4:	fd                   	std    
  1033b5:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  1033b7:	fc                   	cld    
  1033b8:	89 f8                	mov    %edi,%eax
  1033ba:	89 f2                	mov    %esi,%edx
  1033bc:	89 4d cc             	mov    %ecx,-0x34(%ebp)
  1033bf:	89 55 c8             	mov    %edx,-0x38(%ebp)
  1033c2:	89 45 c4             	mov    %eax,-0x3c(%ebp)
            "rep; movsb;"
            "cld;"
            : "=&c" (d0), "=&S" (d1), "=&D" (d2)
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
            : "memory");
    return dst;
  1033c5:	8b 45 f0             	mov    -0x10(%ebp),%eax
            *d ++ = *s ++;
        }
    }
    return dst;
#endif /* __HAVE_ARCH_MEMMOVE */
}
  1033c8:	83 c4 30             	add    $0x30,%esp
  1033cb:	5b                   	pop    %ebx
  1033cc:	5e                   	pop    %esi
  1033cd:	5f                   	pop    %edi
  1033ce:	5d                   	pop    %ebp
  1033cf:	c3                   	ret    

001033d0 <memcpy>:
 * it always copies exactly @n bytes. To avoid overflows, the size of arrays pointed
 * by both @src and @dst, should be at least @n bytes, and should not overlap
 * (for overlapping memory area, memmove is a safer approach).
 * */
void *
memcpy(void *dst, const void *src, size_t n) {
  1033d0:	55                   	push   %ebp
  1033d1:	89 e5                	mov    %esp,%ebp
  1033d3:	57                   	push   %edi
  1033d4:	56                   	push   %esi
  1033d5:	83 ec 20             	sub    $0x20,%esp
  1033d8:	8b 45 08             	mov    0x8(%ebp),%eax
  1033db:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1033de:	8b 45 0c             	mov    0xc(%ebp),%eax
  1033e1:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1033e4:	8b 45 10             	mov    0x10(%ebp),%eax
  1033e7:	89 45 ec             	mov    %eax,-0x14(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  1033ea:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1033ed:	c1 e8 02             	shr    $0x2,%eax
  1033f0:	89 c1                	mov    %eax,%ecx
#ifndef __HAVE_ARCH_MEMCPY
#define __HAVE_ARCH_MEMCPY
static inline void *
__memcpy(void *dst, const void *src, size_t n) {
    int d0, d1, d2;
    asm volatile (
  1033f2:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1033f5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1033f8:	89 d7                	mov    %edx,%edi
  1033fa:	89 c6                	mov    %eax,%esi
  1033fc:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1033fe:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  103401:	83 e1 03             	and    $0x3,%ecx
  103404:	74 02                	je     103408 <memcpy+0x38>
  103406:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  103408:	89 f0                	mov    %esi,%eax
  10340a:	89 fa                	mov    %edi,%edx
  10340c:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  10340f:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  103412:	89 45 e0             	mov    %eax,-0x20(%ebp)
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
            : "memory");
    return dst;
  103415:	8b 45 f4             	mov    -0xc(%ebp),%eax
    while (n -- > 0) {
        *d ++ = *s ++;
    }
    return dst;
#endif /* __HAVE_ARCH_MEMCPY */
}
  103418:	83 c4 20             	add    $0x20,%esp
  10341b:	5e                   	pop    %esi
  10341c:	5f                   	pop    %edi
  10341d:	5d                   	pop    %ebp
  10341e:	c3                   	ret    

0010341f <memcmp>:
 *   match in both memory blocks has a greater value in @v1 than in @v2
 *   as if evaluated as unsigned char values;
 * - And a value less than zero indicates the opposite.
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
  10341f:	55                   	push   %ebp
  103420:	89 e5                	mov    %esp,%ebp
  103422:	83 ec 10             	sub    $0x10,%esp
    const char *s1 = (const char *)v1;
  103425:	8b 45 08             	mov    0x8(%ebp),%eax
  103428:	89 45 fc             	mov    %eax,-0x4(%ebp)
    const char *s2 = (const char *)v2;
  10342b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10342e:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (n -- > 0) {
  103431:	eb 30                	jmp    103463 <memcmp+0x44>
        if (*s1 != *s2) {
  103433:	8b 45 fc             	mov    -0x4(%ebp),%eax
  103436:	0f b6 10             	movzbl (%eax),%edx
  103439:	8b 45 f8             	mov    -0x8(%ebp),%eax
  10343c:	0f b6 00             	movzbl (%eax),%eax
  10343f:	38 c2                	cmp    %al,%dl
  103441:	74 18                	je     10345b <memcmp+0x3c>
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
  103443:	8b 45 fc             	mov    -0x4(%ebp),%eax
  103446:	0f b6 00             	movzbl (%eax),%eax
  103449:	0f b6 d0             	movzbl %al,%edx
  10344c:	8b 45 f8             	mov    -0x8(%ebp),%eax
  10344f:	0f b6 00             	movzbl (%eax),%eax
  103452:	0f b6 c0             	movzbl %al,%eax
  103455:	29 c2                	sub    %eax,%edx
  103457:	89 d0                	mov    %edx,%eax
  103459:	eb 1a                	jmp    103475 <memcmp+0x56>
        }
        s1 ++, s2 ++;
  10345b:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  10345f:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
    const char *s1 = (const char *)v1;
    const char *s2 = (const char *)v2;
    while (n -- > 0) {
  103463:	8b 45 10             	mov    0x10(%ebp),%eax
  103466:	8d 50 ff             	lea    -0x1(%eax),%edx
  103469:	89 55 10             	mov    %edx,0x10(%ebp)
  10346c:	85 c0                	test   %eax,%eax
  10346e:	75 c3                	jne    103433 <memcmp+0x14>
        if (*s1 != *s2) {
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
        }
        s1 ++, s2 ++;
    }
    return 0;
  103470:	b8 00 00 00 00       	mov    $0x0,%eax
}
  103475:	c9                   	leave  
  103476:	c3                   	ret    
