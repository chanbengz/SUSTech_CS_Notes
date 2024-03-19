
bin/kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080200000 <kern_entry>:
#include <memlayout.h>

    .section .text,"ax",%progbits
    .globl kern_entry
kern_entry:
    la sp, bootstacktop
    80200000:	00004117          	auipc	sp,0x4
    80200004:	00010113          	mv	sp,sp

    tail kern_init
    80200008:	a009                	j	8020000a <kern_init>

000000008020000a <kern_init>:
extern char edata[], end[];
extern char kern_entry[];

int kern_init()
{
	memset(edata, 0, end - edata);
    8020000a:	00004517          	auipc	a0,0x4
    8020000e:	00650513          	addi	a0,a0,6 # 80204010 <SBI_SET_TIMER>
    80200012:	00004617          	auipc	a2,0x4
    80200016:	00e60613          	addi	a2,a2,14 # 80204020 <end>
{
    8020001a:	1141                	addi	sp,sp,-16
	memset(edata, 0, end - edata);
    8020001c:	8e09                	sub	a2,a2,a0
    8020001e:	4581                	li	a1,0
{
    80200020:	e406                	sd	ra,8(sp)
	memset(edata, 0, end - edata);
    80200022:	4e8000ef          	jal	ra,8020050a <memset>

	const char *message = "os is loading ...\n";
	cputs(message);
    80200026:	00001517          	auipc	a0,0x1
    8020002a:	93250513          	addi	a0,a0,-1742 # 80200958 <etext>
    8020002e:	068000ef          	jal	ra,80200096 <cputs>
    
    idt_init();
    80200032:	0c2000ef          	jal	ra,802000f4 <idt_init>
    intr_enable();
    80200036:	0b8000ef          	jal	ra,802000ee <intr_enable>
    asm volatile("ebreak"::);
    8020003a:	9002                	ebreak
	asm volatile("mret"::);
    8020003c:	30200073          	mret

	sbi_shutdown();
    80200040:	0ff000ef          	jal	ra,8020093e <sbi_shutdown>
	// clock_init();

	while (1) {
    80200044:	a001                	j	80200044 <kern_init+0x3a>

0000000080200046 <cputch>:
/* *
 * cputch - writes a single character @c to stdout, and it will
 * increace the value of counter pointed by @cnt.
 * */
static void cputch(int c, int *cnt)
{
    80200046:	1141                	addi	sp,sp,-16
    80200048:	e022                	sd	s0,0(sp)
    8020004a:	e406                	sd	ra,8(sp)
    8020004c:	842e                	mv	s0,a1
	cons_putc(c);
    8020004e:	098000ef          	jal	ra,802000e6 <cons_putc>
	(*cnt)++;
    80200052:	401c                	lw	a5,0(s0)
}
    80200054:	60a2                	ld	ra,8(sp)
	(*cnt)++;
    80200056:	2785                	addiw	a5,a5,1
    80200058:	c01c                	sw	a5,0(s0)
}
    8020005a:	6402                	ld	s0,0(sp)
    8020005c:	0141                	addi	sp,sp,16
    8020005e:	8082                	ret

0000000080200060 <cprintf>:
 *
 * The return value is the number of characters which would be
 * written to stdout.
 * */
int cprintf(const char *fmt, ...)
{
    80200060:	711d                	addi	sp,sp,-96
	va_list ap;
	int cnt;
	va_start(ap, fmt);
    80200062:	02810313          	addi	t1,sp,40 # 80204028 <end+0x8>
{
    80200066:	8e2a                	mv	t3,a0
    80200068:	f42e                	sd	a1,40(sp)
    8020006a:	f832                	sd	a2,48(sp)
    8020006c:	fc36                	sd	a3,56(sp)
	vprintfmt((void *)cputch, &cnt, fmt, ap);
    8020006e:	00000517          	auipc	a0,0x0
    80200072:	fd850513          	addi	a0,a0,-40 # 80200046 <cputch>
    80200076:	004c                	addi	a1,sp,4
    80200078:	869a                	mv	a3,t1
    8020007a:	8672                	mv	a2,t3
{
    8020007c:	ec06                	sd	ra,24(sp)
    8020007e:	e0ba                	sd	a4,64(sp)
    80200080:	e4be                	sd	a5,72(sp)
    80200082:	e8c2                	sd	a6,80(sp)
    80200084:	ecc6                	sd	a7,88(sp)
	va_start(ap, fmt);
    80200086:	e41a                	sd	t1,8(sp)
	int cnt = 0;
    80200088:	c202                	sw	zero,4(sp)
	vprintfmt((void *)cputch, &cnt, fmt, ap);
    8020008a:	4fe000ef          	jal	ra,80200588 <vprintfmt>
	cnt = vcprintf(fmt, ap);
	va_end(ap);
	return cnt;
}
    8020008e:	60e2                	ld	ra,24(sp)
    80200090:	4512                	lw	a0,4(sp)
    80200092:	6125                	addi	sp,sp,96
    80200094:	8082                	ret

0000000080200096 <cputs>:
/* *
 * cputs- writes the string pointed by @str to stdout and
 * appends a newline character.
 * */
int cputs(const char *str)
{
    80200096:	1101                	addi	sp,sp,-32
    80200098:	e822                	sd	s0,16(sp)
    8020009a:	ec06                	sd	ra,24(sp)
    8020009c:	e426                	sd	s1,8(sp)
    8020009e:	842a                	mv	s0,a0
	int cnt = 0;
	char c;
	while ((c = *str++) != '\0') {
    802000a0:	00054503          	lbu	a0,0(a0)
    802000a4:	c51d                	beqz	a0,802000d2 <cputs+0x3c>
    802000a6:	0405                	addi	s0,s0,1
    802000a8:	4485                	li	s1,1
    802000aa:	9c81                	subw	s1,s1,s0
	cons_putc(c);
    802000ac:	03a000ef          	jal	ra,802000e6 <cons_putc>
	while ((c = *str++) != '\0') {
    802000b0:	00044503          	lbu	a0,0(s0)
    802000b4:	008487bb          	addw	a5,s1,s0
    802000b8:	0405                	addi	s0,s0,1
    802000ba:	f96d                	bnez	a0,802000ac <cputs+0x16>
    802000bc:	0017841b          	addiw	s0,a5,1
	cons_putc(c);
    802000c0:	4529                	li	a0,10
    802000c2:	024000ef          	jal	ra,802000e6 <cons_putc>
		cputch(c, &cnt);
	}
	cputch('\n', &cnt);
	return cnt;
}
    802000c6:	60e2                	ld	ra,24(sp)
    802000c8:	8522                	mv	a0,s0
    802000ca:	6442                	ld	s0,16(sp)
    802000cc:	64a2                	ld	s1,8(sp)
    802000ce:	6105                	addi	sp,sp,32
    802000d0:	8082                	ret
	while ((c = *str++) != '\0') {
    802000d2:	4405                	li	s0,1
    802000d4:	b7f5                	j	802000c0 <cputs+0x2a>

00000000802000d6 <clock_set_next_event>:

static inline uint64_t get_cycles(void)
{
#if __riscv_xlen == 64
	uint64_t n;
	__asm__ __volatile__("rdtime %0" : "=r"(n));
    802000d6:	c0102573          	rdtime	a0
	cprintf("++ setup timer interrupts\n");
}

void clock_set_next_event(void)
{
	sbi_set_timer(get_cycles() + timebase);
    802000da:	67e1                	lui	a5,0x18
    802000dc:	6a078793          	addi	a5,a5,1696 # 186a0 <kern_entry-0x801e7960>
    802000e0:	953e                	add	a0,a0,a5
    802000e2:	0430006f          	j	80200924 <sbi_set_timer>

00000000802000e6 <cons_putc>:
}

/* cons_putc - print a single character @c to console devices */
void cons_putc(int c)
{
	sbi_console_putchar((unsigned char)c);
    802000e6:	0ff57513          	andi	a0,a0,255
    802000ea:	0210006f          	j	8020090a <sbi_console_putchar>

00000000802000ee <intr_enable>:
#include <riscv.h>

/* intr_enable - enable irq interrupt */
void intr_enable(void)
{
	set_csr(sstatus, SSTATUS_SIE);
    802000ee:	100167f3          	csrrsi	a5,sstatus,2
}
    802000f2:	8082                	ret

00000000802000f4 <idt_init>:
	extern void __alltraps(void);
	/* Set sscratch register to 0, indicating to exception vector that we are
     * presently executing in the kernel */
	// write_csr(sscratch, 0);
	/* Set the exception vector address */
	write_csr(stvec, &__alltraps);
    802000f4:	00000797          	auipc	a5,0x0
    802000f8:	34478793          	addi	a5,a5,836 # 80200438 <__alltraps>
    802000fc:	10579073          	csrw	stvec,a5
}
    80200100:	8082                	ret

0000000080200102 <print_regs>:
	cprintf("  cause    0x%08x\n", tf->cause);
}

void print_regs(struct pushregs *gpr)
{
	cprintf("  zero     0x%08x\n", gpr->zero);
    80200102:	610c                	ld	a1,0(a0)
{
    80200104:	1141                	addi	sp,sp,-16
    80200106:	e022                	sd	s0,0(sp)
    80200108:	842a                	mv	s0,a0
	cprintf("  zero     0x%08x\n", gpr->zero);
    8020010a:	00001517          	auipc	a0,0x1
    8020010e:	86650513          	addi	a0,a0,-1946 # 80200970 <etext+0x18>
{
    80200112:	e406                	sd	ra,8(sp)
	cprintf("  zero     0x%08x\n", gpr->zero);
    80200114:	f4dff0ef          	jal	ra,80200060 <cprintf>
	cprintf("  ra       0x%08x\n", gpr->ra);
    80200118:	640c                	ld	a1,8(s0)
    8020011a:	00001517          	auipc	a0,0x1
    8020011e:	86e50513          	addi	a0,a0,-1938 # 80200988 <etext+0x30>
    80200122:	f3fff0ef          	jal	ra,80200060 <cprintf>
	cprintf("  sp       0x%08x\n", gpr->sp);
    80200126:	680c                	ld	a1,16(s0)
    80200128:	00001517          	auipc	a0,0x1
    8020012c:	87850513          	addi	a0,a0,-1928 # 802009a0 <etext+0x48>
    80200130:	f31ff0ef          	jal	ra,80200060 <cprintf>
	cprintf("  gp       0x%08x\n", gpr->gp);
    80200134:	6c0c                	ld	a1,24(s0)
    80200136:	00001517          	auipc	a0,0x1
    8020013a:	88250513          	addi	a0,a0,-1918 # 802009b8 <etext+0x60>
    8020013e:	f23ff0ef          	jal	ra,80200060 <cprintf>
	cprintf("  tp       0x%08x\n", gpr->tp);
    80200142:	700c                	ld	a1,32(s0)
    80200144:	00001517          	auipc	a0,0x1
    80200148:	88c50513          	addi	a0,a0,-1908 # 802009d0 <etext+0x78>
    8020014c:	f15ff0ef          	jal	ra,80200060 <cprintf>
	cprintf("  t0       0x%08x\n", gpr->t0);
    80200150:	740c                	ld	a1,40(s0)
    80200152:	00001517          	auipc	a0,0x1
    80200156:	89650513          	addi	a0,a0,-1898 # 802009e8 <etext+0x90>
    8020015a:	f07ff0ef          	jal	ra,80200060 <cprintf>
	cprintf("  t1       0x%08x\n", gpr->t1);
    8020015e:	780c                	ld	a1,48(s0)
    80200160:	00001517          	auipc	a0,0x1
    80200164:	8a050513          	addi	a0,a0,-1888 # 80200a00 <etext+0xa8>
    80200168:	ef9ff0ef          	jal	ra,80200060 <cprintf>
	cprintf("  t2       0x%08x\n", gpr->t2);
    8020016c:	7c0c                	ld	a1,56(s0)
    8020016e:	00001517          	auipc	a0,0x1
    80200172:	8aa50513          	addi	a0,a0,-1878 # 80200a18 <etext+0xc0>
    80200176:	eebff0ef          	jal	ra,80200060 <cprintf>
	cprintf("  s0       0x%08x\n", gpr->s0);
    8020017a:	602c                	ld	a1,64(s0)
    8020017c:	00001517          	auipc	a0,0x1
    80200180:	8b450513          	addi	a0,a0,-1868 # 80200a30 <etext+0xd8>
    80200184:	eddff0ef          	jal	ra,80200060 <cprintf>
	cprintf("  s1       0x%08x\n", gpr->s1);
    80200188:	642c                	ld	a1,72(s0)
    8020018a:	00001517          	auipc	a0,0x1
    8020018e:	8be50513          	addi	a0,a0,-1858 # 80200a48 <etext+0xf0>
    80200192:	ecfff0ef          	jal	ra,80200060 <cprintf>
	cprintf("  a0       0x%08x\n", gpr->a0);
    80200196:	682c                	ld	a1,80(s0)
    80200198:	00001517          	auipc	a0,0x1
    8020019c:	8c850513          	addi	a0,a0,-1848 # 80200a60 <etext+0x108>
    802001a0:	ec1ff0ef          	jal	ra,80200060 <cprintf>
	cprintf("  a1       0x%08x\n", gpr->a1);
    802001a4:	6c2c                	ld	a1,88(s0)
    802001a6:	00001517          	auipc	a0,0x1
    802001aa:	8d250513          	addi	a0,a0,-1838 # 80200a78 <etext+0x120>
    802001ae:	eb3ff0ef          	jal	ra,80200060 <cprintf>
	cprintf("  a2       0x%08x\n", gpr->a2);
    802001b2:	702c                	ld	a1,96(s0)
    802001b4:	00001517          	auipc	a0,0x1
    802001b8:	8dc50513          	addi	a0,a0,-1828 # 80200a90 <etext+0x138>
    802001bc:	ea5ff0ef          	jal	ra,80200060 <cprintf>
	cprintf("  a3       0x%08x\n", gpr->a3);
    802001c0:	742c                	ld	a1,104(s0)
    802001c2:	00001517          	auipc	a0,0x1
    802001c6:	8e650513          	addi	a0,a0,-1818 # 80200aa8 <etext+0x150>
    802001ca:	e97ff0ef          	jal	ra,80200060 <cprintf>
	cprintf("  a4       0x%08x\n", gpr->a4);
    802001ce:	782c                	ld	a1,112(s0)
    802001d0:	00001517          	auipc	a0,0x1
    802001d4:	8f050513          	addi	a0,a0,-1808 # 80200ac0 <etext+0x168>
    802001d8:	e89ff0ef          	jal	ra,80200060 <cprintf>
	cprintf("  a5       0x%08x\n", gpr->a5);
    802001dc:	7c2c                	ld	a1,120(s0)
    802001de:	00001517          	auipc	a0,0x1
    802001e2:	8fa50513          	addi	a0,a0,-1798 # 80200ad8 <etext+0x180>
    802001e6:	e7bff0ef          	jal	ra,80200060 <cprintf>
	cprintf("  a6       0x%08x\n", gpr->a6);
    802001ea:	604c                	ld	a1,128(s0)
    802001ec:	00001517          	auipc	a0,0x1
    802001f0:	90450513          	addi	a0,a0,-1788 # 80200af0 <etext+0x198>
    802001f4:	e6dff0ef          	jal	ra,80200060 <cprintf>
	cprintf("  a7       0x%08x\n", gpr->a7);
    802001f8:	644c                	ld	a1,136(s0)
    802001fa:	00001517          	auipc	a0,0x1
    802001fe:	90e50513          	addi	a0,a0,-1778 # 80200b08 <etext+0x1b0>
    80200202:	e5fff0ef          	jal	ra,80200060 <cprintf>
	cprintf("  s2       0x%08x\n", gpr->s2);
    80200206:	684c                	ld	a1,144(s0)
    80200208:	00001517          	auipc	a0,0x1
    8020020c:	91850513          	addi	a0,a0,-1768 # 80200b20 <etext+0x1c8>
    80200210:	e51ff0ef          	jal	ra,80200060 <cprintf>
	cprintf("  s3       0x%08x\n", gpr->s3);
    80200214:	6c4c                	ld	a1,152(s0)
    80200216:	00001517          	auipc	a0,0x1
    8020021a:	92250513          	addi	a0,a0,-1758 # 80200b38 <etext+0x1e0>
    8020021e:	e43ff0ef          	jal	ra,80200060 <cprintf>
	cprintf("  s4       0x%08x\n", gpr->s4);
    80200222:	704c                	ld	a1,160(s0)
    80200224:	00001517          	auipc	a0,0x1
    80200228:	92c50513          	addi	a0,a0,-1748 # 80200b50 <etext+0x1f8>
    8020022c:	e35ff0ef          	jal	ra,80200060 <cprintf>
	cprintf("  s5       0x%08x\n", gpr->s5);
    80200230:	744c                	ld	a1,168(s0)
    80200232:	00001517          	auipc	a0,0x1
    80200236:	93650513          	addi	a0,a0,-1738 # 80200b68 <etext+0x210>
    8020023a:	e27ff0ef          	jal	ra,80200060 <cprintf>
	cprintf("  s6       0x%08x\n", gpr->s6);
    8020023e:	784c                	ld	a1,176(s0)
    80200240:	00001517          	auipc	a0,0x1
    80200244:	94050513          	addi	a0,a0,-1728 # 80200b80 <etext+0x228>
    80200248:	e19ff0ef          	jal	ra,80200060 <cprintf>
	cprintf("  s7       0x%08x\n", gpr->s7);
    8020024c:	7c4c                	ld	a1,184(s0)
    8020024e:	00001517          	auipc	a0,0x1
    80200252:	94a50513          	addi	a0,a0,-1718 # 80200b98 <etext+0x240>
    80200256:	e0bff0ef          	jal	ra,80200060 <cprintf>
	cprintf("  s8       0x%08x\n", gpr->s8);
    8020025a:	606c                	ld	a1,192(s0)
    8020025c:	00001517          	auipc	a0,0x1
    80200260:	95450513          	addi	a0,a0,-1708 # 80200bb0 <etext+0x258>
    80200264:	dfdff0ef          	jal	ra,80200060 <cprintf>
	cprintf("  s9       0x%08x\n", gpr->s9);
    80200268:	646c                	ld	a1,200(s0)
    8020026a:	00001517          	auipc	a0,0x1
    8020026e:	95e50513          	addi	a0,a0,-1698 # 80200bc8 <etext+0x270>
    80200272:	defff0ef          	jal	ra,80200060 <cprintf>
	cprintf("  s10      0x%08x\n", gpr->s10);
    80200276:	686c                	ld	a1,208(s0)
    80200278:	00001517          	auipc	a0,0x1
    8020027c:	96850513          	addi	a0,a0,-1688 # 80200be0 <etext+0x288>
    80200280:	de1ff0ef          	jal	ra,80200060 <cprintf>
	cprintf("  s11      0x%08x\n", gpr->s11);
    80200284:	6c6c                	ld	a1,216(s0)
    80200286:	00001517          	auipc	a0,0x1
    8020028a:	97250513          	addi	a0,a0,-1678 # 80200bf8 <etext+0x2a0>
    8020028e:	dd3ff0ef          	jal	ra,80200060 <cprintf>
	cprintf("  t3       0x%08x\n", gpr->t3);
    80200292:	706c                	ld	a1,224(s0)
    80200294:	00001517          	auipc	a0,0x1
    80200298:	97c50513          	addi	a0,a0,-1668 # 80200c10 <etext+0x2b8>
    8020029c:	dc5ff0ef          	jal	ra,80200060 <cprintf>
	cprintf("  t4       0x%08x\n", gpr->t4);
    802002a0:	746c                	ld	a1,232(s0)
    802002a2:	00001517          	auipc	a0,0x1
    802002a6:	98650513          	addi	a0,a0,-1658 # 80200c28 <etext+0x2d0>
    802002aa:	db7ff0ef          	jal	ra,80200060 <cprintf>
	cprintf("  t5       0x%08x\n", gpr->t5);
    802002ae:	786c                	ld	a1,240(s0)
    802002b0:	00001517          	auipc	a0,0x1
    802002b4:	99050513          	addi	a0,a0,-1648 # 80200c40 <etext+0x2e8>
    802002b8:	da9ff0ef          	jal	ra,80200060 <cprintf>
	cprintf("  t6       0x%08x\n", gpr->t6);
    802002bc:	7c6c                	ld	a1,248(s0)
}
    802002be:	6402                	ld	s0,0(sp)
    802002c0:	60a2                	ld	ra,8(sp)
	cprintf("  t6       0x%08x\n", gpr->t6);
    802002c2:	00001517          	auipc	a0,0x1
    802002c6:	99650513          	addi	a0,a0,-1642 # 80200c58 <etext+0x300>
}
    802002ca:	0141                	addi	sp,sp,16
	cprintf("  t6       0x%08x\n", gpr->t6);
    802002cc:	bb51                	j	80200060 <cprintf>

00000000802002ce <print_trapframe>:
{
    802002ce:	1141                	addi	sp,sp,-16
    802002d0:	e022                	sd	s0,0(sp)
	cprintf("trapframe at %p\n", tf);
    802002d2:	85aa                	mv	a1,a0
{
    802002d4:	842a                	mv	s0,a0
	cprintf("trapframe at %p\n", tf);
    802002d6:	00001517          	auipc	a0,0x1
    802002da:	99a50513          	addi	a0,a0,-1638 # 80200c70 <etext+0x318>
{
    802002de:	e406                	sd	ra,8(sp)
	cprintf("trapframe at %p\n", tf);
    802002e0:	d81ff0ef          	jal	ra,80200060 <cprintf>
	print_regs(&tf->gpr);
    802002e4:	8522                	mv	a0,s0
    802002e6:	e1dff0ef          	jal	ra,80200102 <print_regs>
	cprintf("  status   0x%08x\n", tf->status);
    802002ea:	10043583          	ld	a1,256(s0)
    802002ee:	00001517          	auipc	a0,0x1
    802002f2:	99a50513          	addi	a0,a0,-1638 # 80200c88 <etext+0x330>
    802002f6:	d6bff0ef          	jal	ra,80200060 <cprintf>
	cprintf("  epc      0x%08x\n", tf->epc);
    802002fa:	10843583          	ld	a1,264(s0)
    802002fe:	00001517          	auipc	a0,0x1
    80200302:	9a250513          	addi	a0,a0,-1630 # 80200ca0 <etext+0x348>
    80200306:	d5bff0ef          	jal	ra,80200060 <cprintf>
	cprintf("  badvaddr 0x%08x\n", tf->badvaddr);
    8020030a:	11043583          	ld	a1,272(s0)
    8020030e:	00001517          	auipc	a0,0x1
    80200312:	9aa50513          	addi	a0,a0,-1622 # 80200cb8 <etext+0x360>
    80200316:	d4bff0ef          	jal	ra,80200060 <cprintf>
	cprintf("  cause    0x%08x\n", tf->cause);
    8020031a:	11843583          	ld	a1,280(s0)
}
    8020031e:	6402                	ld	s0,0(sp)
    80200320:	60a2                	ld	ra,8(sp)
	cprintf("  cause    0x%08x\n", tf->cause);
    80200322:	00001517          	auipc	a0,0x1
    80200326:	9ae50513          	addi	a0,a0,-1618 # 80200cd0 <etext+0x378>
}
    8020032a:	0141                	addi	sp,sp,16
	cprintf("  cause    0x%08x\n", tf->cause);
    8020032c:	bb15                	j	80200060 <cprintf>

000000008020032e <interrupt_handler>:

void interrupt_handler(struct trapframe *tf)
{
	intptr_t cause = (tf->cause << 1) >> 1;
    8020032e:	11853783          	ld	a5,280(a0)
    80200332:	472d                	li	a4,11
    80200334:	0786                	slli	a5,a5,0x1
    80200336:	8385                	srli	a5,a5,0x1
    80200338:	06f76763          	bltu	a4,a5,802003a6 <interrupt_handler+0x78>
    8020033c:	00001717          	auipc	a4,0x1
    80200340:	a5c70713          	addi	a4,a4,-1444 # 80200d98 <etext+0x440>
    80200344:	078a                	slli	a5,a5,0x2
    80200346:	97ba                	add	a5,a5,a4
    80200348:	439c                	lw	a5,0(a5)
    8020034a:	97ba                	add	a5,a5,a4
    8020034c:	8782                	jr	a5
		break;
	case IRQ_H_SOFT:
		cprintf("Hypervisor software interrupt\n");
		break;
	case IRQ_M_SOFT:
		cprintf("Machine software interrupt\n");
    8020034e:	00001517          	auipc	a0,0x1
    80200352:	9fa50513          	addi	a0,a0,-1542 # 80200d48 <etext+0x3f0>
    80200356:	b329                	j	80200060 <cprintf>
		cprintf("Hypervisor software interrupt\n");
    80200358:	00001517          	auipc	a0,0x1
    8020035c:	9d050513          	addi	a0,a0,-1584 # 80200d28 <etext+0x3d0>
    80200360:	b301                	j	80200060 <cprintf>
		cprintf("User software interrupt\n");
    80200362:	00001517          	auipc	a0,0x1
    80200366:	98650513          	addi	a0,a0,-1658 # 80200ce8 <etext+0x390>
    8020036a:	b9dd                	j	80200060 <cprintf>
		cprintf("Supervisor software interrupt\n");
    8020036c:	00001517          	auipc	a0,0x1
    80200370:	99c50513          	addi	a0,a0,-1636 # 80200d08 <etext+0x3b0>
    80200374:	b1f5                	j	80200060 <cprintf>
{
    80200376:	1141                	addi	sp,sp,-16
    80200378:	e406                	sd	ra,8(sp)
		// "All bits besides SSIP and USIP in the sip register are
		// read-only." -- privileged spec1.9.1, 4.1.4, p59
		// In fact, Call sbi_set_timer will clear STIP, or you can clear it
		// directly.
		// cprintf("Supervisor timer interrupt\n");
		clock_set_next_event();
    8020037a:	d5dff0ef          	jal	ra,802000d6 <clock_set_next_event>
		if (++ticks % TICK_NUM == 0) {
    8020037e:	00004697          	auipc	a3,0x4
    80200382:	c9a68693          	addi	a3,a3,-870 # 80204018 <ticks>
    80200386:	629c                	ld	a5,0(a3)
    80200388:	06400713          	li	a4,100
    8020038c:	0785                	addi	a5,a5,1
    8020038e:	02e7f733          	remu	a4,a5,a4
    80200392:	e29c                	sd	a5,0(a3)
    80200394:	cb11                	beqz	a4,802003a8 <interrupt_handler+0x7a>
		break;
	default:
		print_trapframe(tf);
		break;
	}
}
    80200396:	60a2                	ld	ra,8(sp)
    80200398:	0141                	addi	sp,sp,16
    8020039a:	8082                	ret
		cprintf("Supervisor external interrupt\n");
    8020039c:	00001517          	auipc	a0,0x1
    802003a0:	9dc50513          	addi	a0,a0,-1572 # 80200d78 <etext+0x420>
    802003a4:	b975                	j	80200060 <cprintf>
		print_trapframe(tf);
    802003a6:	b725                	j	802002ce <print_trapframe>
}
    802003a8:	60a2                	ld	ra,8(sp)
	cprintf("%d ticks\n", TICK_NUM);
    802003aa:	06400593          	li	a1,100
    802003ae:	00001517          	auipc	a0,0x1
    802003b2:	9ba50513          	addi	a0,a0,-1606 # 80200d68 <etext+0x410>
}
    802003b6:	0141                	addi	sp,sp,16
	cprintf("%d ticks\n", TICK_NUM);
    802003b8:	b165                	j	80200060 <cprintf>

00000000802003ba <exception_handler>:

void exception_handler(struct trapframe *tf)
{
	switch (tf->cause) {
    802003ba:	11853783          	ld	a5,280(a0)
{
    802003be:	1141                	addi	sp,sp,-16
    802003c0:	e022                	sd	s0,0(sp)
    802003c2:	e406                	sd	ra,8(sp)
	switch (tf->cause) {
    802003c4:	470d                	li	a4,3
{
    802003c6:	842a                	mv	s0,a0
	switch (tf->cause) {
    802003c8:	04e78063          	beq	a5,a4,80200408 <exception_handler+0x4e>
    802003cc:	02f76663          	bltu	a4,a5,802003f8 <exception_handler+0x3e>
    802003d0:	4709                	li	a4,2
    802003d2:	00e79f63          	bne	a5,a4,802003f0 <exception_handler+0x36>
	case CAUSE_MISALIGNED_FETCH:
		break;
	case CAUSE_FAULT_FETCH:
		break;
	case CAUSE_ILLEGAL_INSTRUCTION:
		cprintf("Illegal instruction exception caught at 0x%016llx\n", tf->epc);
    802003d6:	10853583          	ld	a1,264(a0)
    802003da:	00001517          	auipc	a0,0x1
    802003de:	9ee50513          	addi	a0,a0,-1554 # 80200dc8 <etext+0x470>
    802003e2:	c7fff0ef          	jal	ra,80200060 <cprintf>
		tf->epc += 4;
    802003e6:	10843783          	ld	a5,264(s0)
    802003ea:	0791                	addi	a5,a5,4
    802003ec:	10f43423          	sd	a5,264(s0)
		break;
	default:
		print_trapframe(tf);
		break;
	}
}
    802003f0:	60a2                	ld	ra,8(sp)
    802003f2:	6402                	ld	s0,0(sp)
    802003f4:	0141                	addi	sp,sp,16
    802003f6:	8082                	ret
	switch (tf->cause) {
    802003f8:	17f1                	addi	a5,a5,-4
    802003fa:	471d                	li	a4,7
    802003fc:	fef77ae3          	bgeu	a4,a5,802003f0 <exception_handler+0x36>
}
    80200400:	6402                	ld	s0,0(sp)
    80200402:	60a2                	ld	ra,8(sp)
    80200404:	0141                	addi	sp,sp,16
		print_trapframe(tf);
    80200406:	b5e1                	j	802002ce <print_trapframe>
		cprintf("ebreak caught at 0x%016llx\n", tf->epc);
    80200408:	10853583          	ld	a1,264(a0)
    8020040c:	00001517          	auipc	a0,0x1
    80200410:	9f450513          	addi	a0,a0,-1548 # 80200e00 <etext+0x4a8>
    80200414:	c4dff0ef          	jal	ra,80200060 <cprintf>
		tf->epc += 2;
    80200418:	10843783          	ld	a5,264(s0)
}
    8020041c:	60a2                	ld	ra,8(sp)
		tf->epc += 2;
    8020041e:	0789                	addi	a5,a5,2
    80200420:	10f43423          	sd	a5,264(s0)
}
    80200424:	6402                	ld	s0,0(sp)
    80200426:	0141                	addi	sp,sp,16
    80200428:	8082                	ret

000000008020042a <trap>:

/* trap_dispatch - dispatch based on what type of trap occurred */
static inline void trap_dispatch(struct trapframe *tf)
{
	if ((intptr_t)tf->cause < 0) {
    8020042a:	11853783          	ld	a5,280(a0)
    8020042e:	0007c363          	bltz	a5,80200434 <trap+0xa>
		// interrupts
		interrupt_handler(tf);
	} else {
		// exceptions
		exception_handler(tf);
    80200432:	b761                	j	802003ba <exception_handler>
		interrupt_handler(tf);
    80200434:	bded                	j	8020032e <interrupt_handler>
	...

0000000080200438 <__alltraps>:
    .endm

    .globl __alltraps
.align(2)
__alltraps:
    SAVE_ALL
    80200438:	14011073          	csrw	sscratch,sp
    8020043c:	712d                	addi	sp,sp,-288
    8020043e:	e002                	sd	zero,0(sp)
    80200440:	e406                	sd	ra,8(sp)
    80200442:	ec0e                	sd	gp,24(sp)
    80200444:	f012                	sd	tp,32(sp)
    80200446:	f416                	sd	t0,40(sp)
    80200448:	f81a                	sd	t1,48(sp)
    8020044a:	fc1e                	sd	t2,56(sp)
    8020044c:	e0a2                	sd	s0,64(sp)
    8020044e:	e4a6                	sd	s1,72(sp)
    80200450:	e8aa                	sd	a0,80(sp)
    80200452:	ecae                	sd	a1,88(sp)
    80200454:	f0b2                	sd	a2,96(sp)
    80200456:	f4b6                	sd	a3,104(sp)
    80200458:	f8ba                	sd	a4,112(sp)
    8020045a:	fcbe                	sd	a5,120(sp)
    8020045c:	e142                	sd	a6,128(sp)
    8020045e:	e546                	sd	a7,136(sp)
    80200460:	e94a                	sd	s2,144(sp)
    80200462:	ed4e                	sd	s3,152(sp)
    80200464:	f152                	sd	s4,160(sp)
    80200466:	f556                	sd	s5,168(sp)
    80200468:	f95a                	sd	s6,176(sp)
    8020046a:	fd5e                	sd	s7,184(sp)
    8020046c:	e1e2                	sd	s8,192(sp)
    8020046e:	e5e6                	sd	s9,200(sp)
    80200470:	e9ea                	sd	s10,208(sp)
    80200472:	edee                	sd	s11,216(sp)
    80200474:	f1f2                	sd	t3,224(sp)
    80200476:	f5f6                	sd	t4,232(sp)
    80200478:	f9fa                	sd	t5,240(sp)
    8020047a:	fdfe                	sd	t6,248(sp)
    8020047c:	14001473          	csrrw	s0,sscratch,zero
    80200480:	100024f3          	csrr	s1,sstatus
    80200484:	14102973          	csrr	s2,sepc
    80200488:	143029f3          	csrr	s3,stval
    8020048c:	14202a73          	csrr	s4,scause
    80200490:	e822                	sd	s0,16(sp)
    80200492:	e226                	sd	s1,256(sp)
    80200494:	e64a                	sd	s2,264(sp)
    80200496:	ea4e                	sd	s3,272(sp)
    80200498:	ee52                	sd	s4,280(sp)

    move  a0, sp
    8020049a:	850a                	mv	a0,sp
    jal trap
    8020049c:	f8fff0ef          	jal	ra,8020042a <trap>

00000000802004a0 <__trapret>:
    # sp should be the same as before "jal trap"

    .globl __trapret
__trapret:
    RESTORE_ALL
    802004a0:	6492                	ld	s1,256(sp)
    802004a2:	6932                	ld	s2,264(sp)
    802004a4:	10049073          	csrw	sstatus,s1
    802004a8:	14191073          	csrw	sepc,s2
    802004ac:	60a2                	ld	ra,8(sp)
    802004ae:	61e2                	ld	gp,24(sp)
    802004b0:	7202                	ld	tp,32(sp)
    802004b2:	72a2                	ld	t0,40(sp)
    802004b4:	7342                	ld	t1,48(sp)
    802004b6:	73e2                	ld	t2,56(sp)
    802004b8:	6406                	ld	s0,64(sp)
    802004ba:	64a6                	ld	s1,72(sp)
    802004bc:	6546                	ld	a0,80(sp)
    802004be:	65e6                	ld	a1,88(sp)
    802004c0:	7606                	ld	a2,96(sp)
    802004c2:	76a6                	ld	a3,104(sp)
    802004c4:	7746                	ld	a4,112(sp)
    802004c6:	77e6                	ld	a5,120(sp)
    802004c8:	680a                	ld	a6,128(sp)
    802004ca:	68aa                	ld	a7,136(sp)
    802004cc:	694a                	ld	s2,144(sp)
    802004ce:	69ea                	ld	s3,152(sp)
    802004d0:	7a0a                	ld	s4,160(sp)
    802004d2:	7aaa                	ld	s5,168(sp)
    802004d4:	7b4a                	ld	s6,176(sp)
    802004d6:	7bea                	ld	s7,184(sp)
    802004d8:	6c0e                	ld	s8,192(sp)
    802004da:	6cae                	ld	s9,200(sp)
    802004dc:	6d4e                	ld	s10,208(sp)
    802004de:	6dee                	ld	s11,216(sp)
    802004e0:	7e0e                	ld	t3,224(sp)
    802004e2:	7eae                	ld	t4,232(sp)
    802004e4:	7f4e                	ld	t5,240(sp)
    802004e6:	7fee                	ld	t6,248(sp)
    802004e8:	6142                	ld	sp,16(sp)
    # return from supervisor call
    sret
    802004ea:	10200073          	sret

00000000802004ee <strnlen>:
 * The return value is strlen(s), if that is less than @len, or
 * @len if there is no '\0' character among the first @len characters
 * pointed by @s.
 * */
size_t strnlen(const char *s, size_t len)
{
    802004ee:	872a                	mv	a4,a0
	size_t cnt = 0;
    802004f0:	4501                	li	a0,0
	while (cnt < len && *s++ != '\0') {
    802004f2:	e589                	bnez	a1,802004fc <strnlen+0xe>
    802004f4:	a811                	j	80200508 <strnlen+0x1a>
		cnt++;
    802004f6:	0505                	addi	a0,a0,1
	while (cnt < len && *s++ != '\0') {
    802004f8:	00a58763          	beq	a1,a0,80200506 <strnlen+0x18>
    802004fc:	00a707b3          	add	a5,a4,a0
    80200500:	0007c783          	lbu	a5,0(a5)
    80200504:	fbed                	bnez	a5,802004f6 <strnlen+0x8>
	}
	return cnt;
}
    80200506:	8082                	ret
    80200508:	8082                	ret

000000008020050a <memset>:
{
#ifdef __HAVE_ARCH_MEMSET
	return __memset(s, c, n);
#else
	char *p = s;
	while (n-- > 0) {
    8020050a:	ca01                	beqz	a2,8020051a <memset+0x10>
    8020050c:	962a                	add	a2,a2,a0
	char *p = s;
    8020050e:	87aa                	mv	a5,a0
		*p++ = c;
    80200510:	0785                	addi	a5,a5,1
    80200512:	feb78fa3          	sb	a1,-1(a5)
	while (n-- > 0) {
    80200516:	fec79de3          	bne	a5,a2,80200510 <memset+0x6>
	}
	return s;
#endif /* __HAVE_ARCH_MEMSET */
}
    8020051a:	8082                	ret

000000008020051c <printnum>:
 * */
static void printnum(void (*putch)(int, void *), void *putdat,
		     unsigned long long num, unsigned base, int width, int padc)
{
	unsigned long long result = num;
	unsigned mod = do_div(result, base);
    8020051c:	02069813          	slli	a6,a3,0x20
{
    80200520:	7179                	addi	sp,sp,-48
	unsigned mod = do_div(result, base);
    80200522:	02085813          	srli	a6,a6,0x20
{
    80200526:	e052                	sd	s4,0(sp)
	unsigned mod = do_div(result, base);
    80200528:	03067a33          	remu	s4,a2,a6
{
    8020052c:	f022                	sd	s0,32(sp)
    8020052e:	ec26                	sd	s1,24(sp)
    80200530:	e84a                	sd	s2,16(sp)
    80200532:	f406                	sd	ra,40(sp)
    80200534:	e44e                	sd	s3,8(sp)
    80200536:	84aa                	mv	s1,a0
    80200538:	892e                	mv	s2,a1
    8020053a:	fff7041b          	addiw	s0,a4,-1
	unsigned mod = do_div(result, base);
    8020053e:	2a01                	sext.w	s4,s4

	// first recursively print all preceding (more significant) digits
	if (num >= base) {
    80200540:	03067e63          	bgeu	a2,a6,8020057c <printnum+0x60>
    80200544:	89be                	mv	s3,a5
		printnum(putch, putdat, result, base, width - 1, padc);
	} else {
		// print any needed pad characters before first digit
		while (--width > 0)
    80200546:	00805763          	blez	s0,80200554 <printnum+0x38>
    8020054a:	347d                	addiw	s0,s0,-1
			putch(padc, putdat);
    8020054c:	85ca                	mv	a1,s2
    8020054e:	854e                	mv	a0,s3
    80200550:	9482                	jalr	s1
		while (--width > 0)
    80200552:	fc65                	bnez	s0,8020054a <printnum+0x2e>
	}
	// then print this (the least significant) digit
	putch("0123456789abcdef"[mod], putdat);
    80200554:	1a02                	slli	s4,s4,0x20
    80200556:	020a5a13          	srli	s4,s4,0x20
    8020055a:	00001797          	auipc	a5,0x1
    8020055e:	8c678793          	addi	a5,a5,-1850 # 80200e20 <etext+0x4c8>
}
    80200562:	7402                	ld	s0,32(sp)
	putch("0123456789abcdef"[mod], putdat);
    80200564:	9a3e                	add	s4,s4,a5
    80200566:	000a4503          	lbu	a0,0(s4)
}
    8020056a:	70a2                	ld	ra,40(sp)
    8020056c:	69a2                	ld	s3,8(sp)
    8020056e:	6a02                	ld	s4,0(sp)
	putch("0123456789abcdef"[mod], putdat);
    80200570:	85ca                	mv	a1,s2
    80200572:	8326                	mv	t1,s1
}
    80200574:	6942                	ld	s2,16(sp)
    80200576:	64e2                	ld	s1,24(sp)
    80200578:	6145                	addi	sp,sp,48
	putch("0123456789abcdef"[mod], putdat);
    8020057a:	8302                	jr	t1
		printnum(putch, putdat, result, base, width - 1, padc);
    8020057c:	03065633          	divu	a2,a2,a6
    80200580:	8722                	mv	a4,s0
    80200582:	f9bff0ef          	jal	ra,8020051c <printnum>
    80200586:	b7f9                	j	80200554 <printnum+0x38>

0000000080200588 <vprintfmt>:
 * Call this function if you are already dealing with a va_list.
 * Or you probably want printfmt() instead.
 * */
void vprintfmt(void (*putch)(int, void *), void *putdat, const char *fmt,
	       va_list ap)
{
    80200588:	7119                	addi	sp,sp,-128
    8020058a:	f4a6                	sd	s1,104(sp)
    8020058c:	f0ca                	sd	s2,96(sp)
    8020058e:	ecce                	sd	s3,88(sp)
    80200590:	e8d2                	sd	s4,80(sp)
    80200592:	e4d6                	sd	s5,72(sp)
    80200594:	e0da                	sd	s6,64(sp)
    80200596:	fc5e                	sd	s7,56(sp)
    80200598:	f06a                	sd	s10,32(sp)
    8020059a:	fc86                	sd	ra,120(sp)
    8020059c:	f8a2                	sd	s0,112(sp)
    8020059e:	f862                	sd	s8,48(sp)
    802005a0:	f466                	sd	s9,40(sp)
    802005a2:	ec6e                	sd	s11,24(sp)
    802005a4:	892a                	mv	s2,a0
    802005a6:	84ae                	mv	s1,a1
    802005a8:	8d32                	mv	s10,a2
    802005aa:	8a36                	mv	s4,a3
	register int ch, err;
	unsigned long long num;
	int base, width, precision, lflag, altflag;

	while (1) {
		while ((ch = *(unsigned char *)fmt++) != '%') {
    802005ac:	02500993          	li	s3,37
			putch(ch, putdat);
		}

		// Process a %-escape sequence
		char padc = ' ';
		width = precision = -1;
    802005b0:	5b7d                	li	s6,-1
    802005b2:	00001a97          	auipc	s5,0x1
    802005b6:	8a2a8a93          	addi	s5,s5,-1886 # 80200e54 <etext+0x4fc>
		case 'e':
			err = va_arg(ap, int);
			if (err < 0) {
				err = -err;
			}
			if (err > MAXERROR || (p = error_string[err]) == NULL) {
    802005ba:	00001b97          	auipc	s7,0x1
    802005be:	a76b8b93          	addi	s7,s7,-1418 # 80201030 <error_string>
		while ((ch = *(unsigned char *)fmt++) != '%') {
    802005c2:	000d4503          	lbu	a0,0(s10)
    802005c6:	001d0413          	addi	s0,s10,1
    802005ca:	01350a63          	beq	a0,s3,802005de <vprintfmt+0x56>
			if (ch == '\0') {
    802005ce:	c121                	beqz	a0,8020060e <vprintfmt+0x86>
			putch(ch, putdat);
    802005d0:	85a6                	mv	a1,s1
		while ((ch = *(unsigned char *)fmt++) != '%') {
    802005d2:	0405                	addi	s0,s0,1
			putch(ch, putdat);
    802005d4:	9902                	jalr	s2
		while ((ch = *(unsigned char *)fmt++) != '%') {
    802005d6:	fff44503          	lbu	a0,-1(s0)
    802005da:	ff351ae3          	bne	a0,s3,802005ce <vprintfmt+0x46>
    802005de:	00044603          	lbu	a2,0(s0)
		char padc = ' ';
    802005e2:	02000793          	li	a5,32
		lflag = altflag = 0;
    802005e6:	4c81                	li	s9,0
    802005e8:	4881                	li	a7,0
		width = precision = -1;
    802005ea:	5c7d                	li	s8,-1
    802005ec:	5dfd                	li	s11,-1
    802005ee:	05500513          	li	a0,85
				if (ch < '0' || ch > '9') {
    802005f2:	4825                	li	a6,9
		switch (ch = *(unsigned char *)fmt++) {
    802005f4:	fdd6059b          	addiw	a1,a2,-35
    802005f8:	0ff5f593          	andi	a1,a1,255
    802005fc:	00140d13          	addi	s10,s0,1
    80200600:	04b56263          	bltu	a0,a1,80200644 <vprintfmt+0xbc>
    80200604:	058a                	slli	a1,a1,0x2
    80200606:	95d6                	add	a1,a1,s5
    80200608:	4194                	lw	a3,0(a1)
    8020060a:	96d6                	add	a3,a3,s5
    8020060c:	8682                	jr	a3
			for (fmt--; fmt[-1] != '%'; fmt--)
				/* do nothing */;
			break;
		}
	}
}
    8020060e:	70e6                	ld	ra,120(sp)
    80200610:	7446                	ld	s0,112(sp)
    80200612:	74a6                	ld	s1,104(sp)
    80200614:	7906                	ld	s2,96(sp)
    80200616:	69e6                	ld	s3,88(sp)
    80200618:	6a46                	ld	s4,80(sp)
    8020061a:	6aa6                	ld	s5,72(sp)
    8020061c:	6b06                	ld	s6,64(sp)
    8020061e:	7be2                	ld	s7,56(sp)
    80200620:	7c42                	ld	s8,48(sp)
    80200622:	7ca2                	ld	s9,40(sp)
    80200624:	7d02                	ld	s10,32(sp)
    80200626:	6de2                	ld	s11,24(sp)
    80200628:	6109                	addi	sp,sp,128
    8020062a:	8082                	ret
			padc = '0';
    8020062c:	87b2                	mv	a5,a2
			goto reswitch;
    8020062e:	00144603          	lbu	a2,1(s0)
		switch (ch = *(unsigned char *)fmt++) {
    80200632:	846a                	mv	s0,s10
    80200634:	00140d13          	addi	s10,s0,1
    80200638:	fdd6059b          	addiw	a1,a2,-35
    8020063c:	0ff5f593          	andi	a1,a1,255
    80200640:	fcb572e3          	bgeu	a0,a1,80200604 <vprintfmt+0x7c>
			putch('%', putdat);
    80200644:	85a6                	mv	a1,s1
    80200646:	02500513          	li	a0,37
    8020064a:	9902                	jalr	s2
			for (fmt--; fmt[-1] != '%'; fmt--)
    8020064c:	fff44783          	lbu	a5,-1(s0)
    80200650:	8d22                	mv	s10,s0
    80200652:	f73788e3          	beq	a5,s3,802005c2 <vprintfmt+0x3a>
    80200656:	ffed4783          	lbu	a5,-2(s10)
    8020065a:	1d7d                	addi	s10,s10,-1
    8020065c:	ff379de3          	bne	a5,s3,80200656 <vprintfmt+0xce>
    80200660:	b78d                	j	802005c2 <vprintfmt+0x3a>
				precision = precision * 10 + ch - '0';
    80200662:	fd060c1b          	addiw	s8,a2,-48
				ch = *fmt;
    80200666:	00144603          	lbu	a2,1(s0)
		switch (ch = *(unsigned char *)fmt++) {
    8020066a:	846a                	mv	s0,s10
				if (ch < '0' || ch > '9') {
    8020066c:	fd06069b          	addiw	a3,a2,-48
				ch = *fmt;
    80200670:	0006059b          	sext.w	a1,a2
				if (ch < '0' || ch > '9') {
    80200674:	02d86463          	bltu	a6,a3,8020069c <vprintfmt+0x114>
				ch = *fmt;
    80200678:	00144603          	lbu	a2,1(s0)
				precision = precision * 10 + ch - '0';
    8020067c:	002c169b          	slliw	a3,s8,0x2
    80200680:	0186873b          	addw	a4,a3,s8
    80200684:	0017171b          	slliw	a4,a4,0x1
    80200688:	9f2d                	addw	a4,a4,a1
				if (ch < '0' || ch > '9') {
    8020068a:	fd06069b          	addiw	a3,a2,-48
			for (precision = 0;; ++fmt) {
    8020068e:	0405                	addi	s0,s0,1
				precision = precision * 10 + ch - '0';
    80200690:	fd070c1b          	addiw	s8,a4,-48
				ch = *fmt;
    80200694:	0006059b          	sext.w	a1,a2
				if (ch < '0' || ch > '9') {
    80200698:	fed870e3          	bgeu	a6,a3,80200678 <vprintfmt+0xf0>
			if (width < 0)
    8020069c:	f40ddce3          	bgez	s11,802005f4 <vprintfmt+0x6c>
				width = precision, precision = -1;
    802006a0:	8de2                	mv	s11,s8
    802006a2:	5c7d                	li	s8,-1
    802006a4:	bf81                	j	802005f4 <vprintfmt+0x6c>
			if (width < 0)
    802006a6:	fffdc693          	not	a3,s11
    802006aa:	96fd                	srai	a3,a3,0x3f
    802006ac:	00ddfdb3          	and	s11,s11,a3
    802006b0:	00144603          	lbu	a2,1(s0)
    802006b4:	2d81                	sext.w	s11,s11
		switch (ch = *(unsigned char *)fmt++) {
    802006b6:	846a                	mv	s0,s10
			goto reswitch;
    802006b8:	bf35                	j	802005f4 <vprintfmt+0x6c>
			precision = va_arg(ap, int);
    802006ba:	000a2c03          	lw	s8,0(s4)
			goto process_precision;
    802006be:	00144603          	lbu	a2,1(s0)
			precision = va_arg(ap, int);
    802006c2:	0a21                	addi	s4,s4,8
		switch (ch = *(unsigned char *)fmt++) {
    802006c4:	846a                	mv	s0,s10
			goto process_precision;
    802006c6:	bfd9                	j	8020069c <vprintfmt+0x114>
	if (lflag >= 2) {
    802006c8:	4705                	li	a4,1
    802006ca:	008a0593          	addi	a1,s4,8
    802006ce:	01174463          	blt	a4,a7,802006d6 <vprintfmt+0x14e>
	} else if (lflag) {
    802006d2:	1a088e63          	beqz	a7,8020088e <vprintfmt+0x306>
		return va_arg(*ap, unsigned long);
    802006d6:	000a3603          	ld	a2,0(s4)
    802006da:	46c1                	li	a3,16
    802006dc:	8a2e                	mv	s4,a1
			printnum(putch, putdat, num, base, width, padc);
    802006de:	2781                	sext.w	a5,a5
    802006e0:	876e                	mv	a4,s11
    802006e2:	85a6                	mv	a1,s1
    802006e4:	854a                	mv	a0,s2
    802006e6:	e37ff0ef          	jal	ra,8020051c <printnum>
			break;
    802006ea:	bde1                	j	802005c2 <vprintfmt+0x3a>
			putch(va_arg(ap, int), putdat);
    802006ec:	000a2503          	lw	a0,0(s4)
    802006f0:	85a6                	mv	a1,s1
    802006f2:	0a21                	addi	s4,s4,8
    802006f4:	9902                	jalr	s2
			break;
    802006f6:	b5f1                	j	802005c2 <vprintfmt+0x3a>
	if (lflag >= 2) {
    802006f8:	4705                	li	a4,1
    802006fa:	008a0593          	addi	a1,s4,8
    802006fe:	01174463          	blt	a4,a7,80200706 <vprintfmt+0x17e>
	} else if (lflag) {
    80200702:	18088163          	beqz	a7,80200884 <vprintfmt+0x2fc>
		return va_arg(*ap, unsigned long);
    80200706:	000a3603          	ld	a2,0(s4)
    8020070a:	46a9                	li	a3,10
    8020070c:	8a2e                	mv	s4,a1
    8020070e:	bfc1                	j	802006de <vprintfmt+0x156>
			goto reswitch;
    80200710:	00144603          	lbu	a2,1(s0)
			altflag = 1;
    80200714:	4c85                	li	s9,1
		switch (ch = *(unsigned char *)fmt++) {
    80200716:	846a                	mv	s0,s10
			goto reswitch;
    80200718:	bdf1                	j	802005f4 <vprintfmt+0x6c>
			putch(ch, putdat);
    8020071a:	85a6                	mv	a1,s1
    8020071c:	02500513          	li	a0,37
    80200720:	9902                	jalr	s2
			break;
    80200722:	b545                	j	802005c2 <vprintfmt+0x3a>
			lflag++;
    80200724:	00144603          	lbu	a2,1(s0)
    80200728:	2885                	addiw	a7,a7,1
		switch (ch = *(unsigned char *)fmt++) {
    8020072a:	846a                	mv	s0,s10
			goto reswitch;
    8020072c:	b5e1                	j	802005f4 <vprintfmt+0x6c>
	if (lflag >= 2) {
    8020072e:	4705                	li	a4,1
    80200730:	008a0593          	addi	a1,s4,8
    80200734:	01174463          	blt	a4,a7,8020073c <vprintfmt+0x1b4>
	} else if (lflag) {
    80200738:	14088163          	beqz	a7,8020087a <vprintfmt+0x2f2>
		return va_arg(*ap, unsigned long);
    8020073c:	000a3603          	ld	a2,0(s4)
    80200740:	46a1                	li	a3,8
    80200742:	8a2e                	mv	s4,a1
    80200744:	bf69                	j	802006de <vprintfmt+0x156>
			putch('0', putdat);
    80200746:	03000513          	li	a0,48
    8020074a:	85a6                	mv	a1,s1
    8020074c:	e03e                	sd	a5,0(sp)
    8020074e:	9902                	jalr	s2
			putch('x', putdat);
    80200750:	85a6                	mv	a1,s1
    80200752:	07800513          	li	a0,120
    80200756:	9902                	jalr	s2
			num = (unsigned long long)va_arg(ap, void *);
    80200758:	0a21                	addi	s4,s4,8
			goto number;
    8020075a:	6782                	ld	a5,0(sp)
    8020075c:	46c1                	li	a3,16
			num = (unsigned long long)va_arg(ap, void *);
    8020075e:	ff8a3603          	ld	a2,-8(s4)
			goto number;
    80200762:	bfb5                	j	802006de <vprintfmt+0x156>
			if ((p = va_arg(ap, char *)) == NULL) {
    80200764:	000a3403          	ld	s0,0(s4)
    80200768:	008a0713          	addi	a4,s4,8
    8020076c:	e03a                	sd	a4,0(sp)
    8020076e:	14040263          	beqz	s0,802008b2 <vprintfmt+0x32a>
			if (width > 0 && padc != '-') {
    80200772:	0fb05763          	blez	s11,80200860 <vprintfmt+0x2d8>
    80200776:	02d00693          	li	a3,45
    8020077a:	0cd79163          	bne	a5,a3,8020083c <vprintfmt+0x2b4>
			for (; (ch = *p++) != '\0' &&
    8020077e:	00044783          	lbu	a5,0(s0)
    80200782:	0007851b          	sext.w	a0,a5
    80200786:	cf85                	beqz	a5,802007be <vprintfmt+0x236>
    80200788:	00140a13          	addi	s4,s0,1
				if (altflag && (ch < ' ' || ch > '~')) {
    8020078c:	05e00413          	li	s0,94
			for (; (ch = *p++) != '\0' &&
    80200790:	000c4563          	bltz	s8,8020079a <vprintfmt+0x212>
			       (precision < 0 || --precision >= 0);
    80200794:	3c7d                	addiw	s8,s8,-1
    80200796:	036c0263          	beq	s8,s6,802007ba <vprintfmt+0x232>
					putch('?', putdat);
    8020079a:	85a6                	mv	a1,s1
				if (altflag && (ch < ' ' || ch > '~')) {
    8020079c:	0e0c8e63          	beqz	s9,80200898 <vprintfmt+0x310>
    802007a0:	3781                	addiw	a5,a5,-32
    802007a2:	0ef47b63          	bgeu	s0,a5,80200898 <vprintfmt+0x310>
					putch('?', putdat);
    802007a6:	03f00513          	li	a0,63
    802007aa:	9902                	jalr	s2
			for (; (ch = *p++) != '\0' &&
    802007ac:	000a4783          	lbu	a5,0(s4)
			     width--) {
    802007b0:	3dfd                	addiw	s11,s11,-1
			for (; (ch = *p++) != '\0' &&
    802007b2:	0a05                	addi	s4,s4,1
    802007b4:	0007851b          	sext.w	a0,a5
    802007b8:	ffe1                	bnez	a5,80200790 <vprintfmt+0x208>
			for (; width > 0; width--) {
    802007ba:	01b05963          	blez	s11,802007cc <vprintfmt+0x244>
    802007be:	3dfd                	addiw	s11,s11,-1
				putch(' ', putdat);
    802007c0:	85a6                	mv	a1,s1
    802007c2:	02000513          	li	a0,32
    802007c6:	9902                	jalr	s2
			for (; width > 0; width--) {
    802007c8:	fe0d9be3          	bnez	s11,802007be <vprintfmt+0x236>
			if ((p = va_arg(ap, char *)) == NULL) {
    802007cc:	6a02                	ld	s4,0(sp)
    802007ce:	bbd5                	j	802005c2 <vprintfmt+0x3a>
	if (lflag >= 2) {
    802007d0:	4705                	li	a4,1
    802007d2:	008a0c93          	addi	s9,s4,8
    802007d6:	01174463          	blt	a4,a7,802007de <vprintfmt+0x256>
	} else if (lflag) {
    802007da:	08088d63          	beqz	a7,80200874 <vprintfmt+0x2ec>
		return va_arg(*ap, long);
    802007de:	000a3403          	ld	s0,0(s4)
			if ((long long)num < 0) {
    802007e2:	0a044d63          	bltz	s0,8020089c <vprintfmt+0x314>
			num = getint(&ap, lflag);
    802007e6:	8622                	mv	a2,s0
    802007e8:	8a66                	mv	s4,s9
    802007ea:	46a9                	li	a3,10
    802007ec:	bdcd                	j	802006de <vprintfmt+0x156>
			err = va_arg(ap, int);
    802007ee:	000a2783          	lw	a5,0(s4)
			if (err > MAXERROR || (p = error_string[err]) == NULL) {
    802007f2:	4719                	li	a4,6
			err = va_arg(ap, int);
    802007f4:	0a21                	addi	s4,s4,8
			if (err < 0) {
    802007f6:	41f7d69b          	sraiw	a3,a5,0x1f
    802007fa:	8fb5                	xor	a5,a5,a3
    802007fc:	40d786bb          	subw	a3,a5,a3
			if (err > MAXERROR || (p = error_string[err]) == NULL) {
    80200800:	02d74163          	blt	a4,a3,80200822 <vprintfmt+0x29a>
    80200804:	00369793          	slli	a5,a3,0x3
    80200808:	97de                	add	a5,a5,s7
    8020080a:	639c                	ld	a5,0(a5)
    8020080c:	cb99                	beqz	a5,80200822 <vprintfmt+0x29a>
				printfmt(putch, putdat, "%s", p);
    8020080e:	86be                	mv	a3,a5
    80200810:	00000617          	auipc	a2,0x0
    80200814:	64060613          	addi	a2,a2,1600 # 80200e50 <etext+0x4f8>
    80200818:	85a6                	mv	a1,s1
    8020081a:	854a                	mv	a0,s2
    8020081c:	0ce000ef          	jal	ra,802008ea <printfmt>
    80200820:	b34d                	j	802005c2 <vprintfmt+0x3a>
				printfmt(putch, putdat, "error %d", err);
    80200822:	00000617          	auipc	a2,0x0
    80200826:	61e60613          	addi	a2,a2,1566 # 80200e40 <etext+0x4e8>
    8020082a:	85a6                	mv	a1,s1
    8020082c:	854a                	mv	a0,s2
    8020082e:	0bc000ef          	jal	ra,802008ea <printfmt>
    80200832:	bb41                	j	802005c2 <vprintfmt+0x3a>
				p = "(null)";
    80200834:	00000417          	auipc	s0,0x0
    80200838:	60440413          	addi	s0,s0,1540 # 80200e38 <etext+0x4e0>
				for (width -= strnlen(p, precision); width > 0;
    8020083c:	85e2                	mv	a1,s8
    8020083e:	8522                	mv	a0,s0
    80200840:	e43e                	sd	a5,8(sp)
    80200842:	cadff0ef          	jal	ra,802004ee <strnlen>
    80200846:	40ad8dbb          	subw	s11,s11,a0
    8020084a:	01b05b63          	blez	s11,80200860 <vprintfmt+0x2d8>
    8020084e:	67a2                	ld	a5,8(sp)
    80200850:	00078a1b          	sext.w	s4,a5
				     width--) {
    80200854:	3dfd                	addiw	s11,s11,-1
					putch(padc, putdat);
    80200856:	85a6                	mv	a1,s1
    80200858:	8552                	mv	a0,s4
    8020085a:	9902                	jalr	s2
				for (width -= strnlen(p, precision); width > 0;
    8020085c:	fe0d9ce3          	bnez	s11,80200854 <vprintfmt+0x2cc>
			for (; (ch = *p++) != '\0' &&
    80200860:	00044783          	lbu	a5,0(s0)
    80200864:	00140a13          	addi	s4,s0,1
    80200868:	0007851b          	sext.w	a0,a5
    8020086c:	d3a5                	beqz	a5,802007cc <vprintfmt+0x244>
				if (altflag && (ch < ' ' || ch > '~')) {
    8020086e:	05e00413          	li	s0,94
    80200872:	bf39                	j	80200790 <vprintfmt+0x208>
		return va_arg(*ap, int);
    80200874:	000a2403          	lw	s0,0(s4)
    80200878:	b7ad                	j	802007e2 <vprintfmt+0x25a>
		return va_arg(*ap, unsigned int);
    8020087a:	000a6603          	lwu	a2,0(s4)
    8020087e:	46a1                	li	a3,8
    80200880:	8a2e                	mv	s4,a1
    80200882:	bdb1                	j	802006de <vprintfmt+0x156>
    80200884:	000a6603          	lwu	a2,0(s4)
    80200888:	46a9                	li	a3,10
    8020088a:	8a2e                	mv	s4,a1
    8020088c:	bd89                	j	802006de <vprintfmt+0x156>
    8020088e:	000a6603          	lwu	a2,0(s4)
    80200892:	46c1                	li	a3,16
    80200894:	8a2e                	mv	s4,a1
    80200896:	b5a1                	j	802006de <vprintfmt+0x156>
					putch(ch, putdat);
    80200898:	9902                	jalr	s2
    8020089a:	bf09                	j	802007ac <vprintfmt+0x224>
				putch('-', putdat);
    8020089c:	85a6                	mv	a1,s1
    8020089e:	02d00513          	li	a0,45
    802008a2:	e03e                	sd	a5,0(sp)
    802008a4:	9902                	jalr	s2
				num = -(long long)num;
    802008a6:	6782                	ld	a5,0(sp)
    802008a8:	8a66                	mv	s4,s9
    802008aa:	40800633          	neg	a2,s0
    802008ae:	46a9                	li	a3,10
    802008b0:	b53d                	j	802006de <vprintfmt+0x156>
			if (width > 0 && padc != '-') {
    802008b2:	03b05163          	blez	s11,802008d4 <vprintfmt+0x34c>
    802008b6:	02d00693          	li	a3,45
    802008ba:	f6d79de3          	bne	a5,a3,80200834 <vprintfmt+0x2ac>
				p = "(null)";
    802008be:	00000417          	auipc	s0,0x0
    802008c2:	57a40413          	addi	s0,s0,1402 # 80200e38 <etext+0x4e0>
			for (; (ch = *p++) != '\0' &&
    802008c6:	02800793          	li	a5,40
    802008ca:	02800513          	li	a0,40
    802008ce:	00140a13          	addi	s4,s0,1
    802008d2:	bd6d                	j	8020078c <vprintfmt+0x204>
    802008d4:	00000a17          	auipc	s4,0x0
    802008d8:	565a0a13          	addi	s4,s4,1381 # 80200e39 <etext+0x4e1>
    802008dc:	02800513          	li	a0,40
    802008e0:	02800793          	li	a5,40
				if (altflag && (ch < ' ' || ch > '~')) {
    802008e4:	05e00413          	li	s0,94
    802008e8:	b565                	j	80200790 <vprintfmt+0x208>

00000000802008ea <printfmt>:
{
    802008ea:	715d                	addi	sp,sp,-80
	va_start(ap, fmt);
    802008ec:	02810313          	addi	t1,sp,40
{
    802008f0:	f436                	sd	a3,40(sp)
	vprintfmt(putch, putdat, fmt, ap);
    802008f2:	869a                	mv	a3,t1
{
    802008f4:	ec06                	sd	ra,24(sp)
    802008f6:	f83a                	sd	a4,48(sp)
    802008f8:	fc3e                	sd	a5,56(sp)
    802008fa:	e0c2                	sd	a6,64(sp)
    802008fc:	e4c6                	sd	a7,72(sp)
	va_start(ap, fmt);
    802008fe:	e41a                	sd	t1,8(sp)
	vprintfmt(putch, putdat, fmt, ap);
    80200900:	c89ff0ef          	jal	ra,80200588 <vprintfmt>
}
    80200904:	60e2                	ld	ra,24(sp)
    80200906:	6161                	addi	sp,sp,80
    80200908:	8082                	ret

000000008020090a <sbi_console_putchar>:

uint64_t sbi_call(uint64_t sbi_type, uint64_t arg0, uint64_t arg1,
		  uint64_t arg2)
{
	uint64_t ret_val;
	__asm__ volatile("mv x17, %[sbi_type]\n"
    8020090a:	4781                	li	a5,0
    8020090c:	00003717          	auipc	a4,0x3
    80200910:	6f473703          	ld	a4,1780(a4) # 80204000 <SBI_CONSOLE_PUTCHAR>
    80200914:	88ba                	mv	a7,a4
    80200916:	852a                	mv	a0,a0
    80200918:	85be                	mv	a1,a5
    8020091a:	863e                	mv	a2,a5
    8020091c:	00000073          	ecall
    80200920:	87aa                	mv	a5,a0
	return sbi_call(SBI_CONSOLE_GETCHAR, 0, 0, 0);
}
void sbi_console_putchar(unsigned char ch)
{
	sbi_call(SBI_CONSOLE_PUTCHAR, ch, 0, 0);
}
    80200922:	8082                	ret

0000000080200924 <sbi_set_timer>:
	__asm__ volatile("mv x17, %[sbi_type]\n"
    80200924:	4781                	li	a5,0
    80200926:	00003717          	auipc	a4,0x3
    8020092a:	6ea73703          	ld	a4,1770(a4) # 80204010 <SBI_SET_TIMER>
    8020092e:	88ba                	mv	a7,a4
    80200930:	852a                	mv	a0,a0
    80200932:	85be                	mv	a1,a5
    80200934:	863e                	mv	a2,a5
    80200936:	00000073          	ecall
    8020093a:	87aa                	mv	a5,a0

void sbi_set_timer(unsigned long long stime_value)
{
	sbi_call(SBI_SET_TIMER, stime_value, 0, 0);
}
    8020093c:	8082                	ret

000000008020093e <sbi_shutdown>:
	__asm__ volatile("mv x17, %[sbi_type]\n"
    8020093e:	4781                	li	a5,0
    80200940:	00003717          	auipc	a4,0x3
    80200944:	6c873703          	ld	a4,1736(a4) # 80204008 <SBI_SHUTDOWN>
    80200948:	88ba                	mv	a7,a4
    8020094a:	853e                	mv	a0,a5
    8020094c:	85be                	mv	a1,a5
    8020094e:	863e                	mv	a2,a5
    80200950:	00000073          	ecall
    80200954:	87aa                	mv	a5,a0

void sbi_shutdown()
{
    sbi_call(SBI_SHUTDOWN, 0, 0, 0);
}
    80200956:	8082                	ret
