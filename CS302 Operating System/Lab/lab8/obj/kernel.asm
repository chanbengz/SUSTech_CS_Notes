
bin/kernel:     file format elf64-littleriscv


Disassembly of section .text:

ffffffffc0200000 <kern_entry>:
ffffffffc0200000:	c020d2b7          	lui	t0,0xc020d
ffffffffc0200004:	ffd0031b          	addiw	t1,zero,-3
ffffffffc0200008:	037a                	slli	t1,t1,0x1e
ffffffffc020000a:	406282b3          	sub	t0,t0,t1
ffffffffc020000e:	00c2d293          	srli	t0,t0,0xc
ffffffffc0200012:	fff0031b          	addiw	t1,zero,-1
ffffffffc0200016:	137e                	slli	t1,t1,0x3f
ffffffffc0200018:	0062e2b3          	or	t0,t0,t1
ffffffffc020001c:	18029073          	csrw	satp,t0
ffffffffc0200020:	12000073          	sfence.vma
ffffffffc0200024:	c020d137          	lui	sp,0xc020d
ffffffffc0200028:	c02002b7          	lui	t0,0xc0200
ffffffffc020002c:	03228293          	addi	t0,t0,50 # ffffffffc0200032 <kern_init>
ffffffffc0200030:	8282                	jr	t0

ffffffffc0200032 <kern_init>:
ffffffffc0200032:	00035517          	auipc	a0,0x35
ffffffffc0200036:	a4a50513          	addi	a0,a0,-1462 # ffffffffc0234a7c <edata>
ffffffffc020003a:	00040617          	auipc	a2,0x40
ffffffffc020003e:	06660613          	addi	a2,a2,102 # ffffffffc02400a0 <end>
ffffffffc0200042:	1141                	addi	sp,sp,-16
ffffffffc0200044:	8e09                	sub	a2,a2,a0
ffffffffc0200046:	4581                	li	a1,0
ffffffffc0200048:	e406                	sd	ra,8(sp)
ffffffffc020004a:	419070ef          	jal	ra,ffffffffc0207c62 <memset>
ffffffffc020004e:	570000ef          	jal	ra,ffffffffc02005be <cons_init>
ffffffffc0200052:	00008597          	auipc	a1,0x8
ffffffffc0200056:	03e58593          	addi	a1,a1,62 # ffffffffc0208090 <etext>
ffffffffc020005a:	00008517          	auipc	a0,0x8
ffffffffc020005e:	04e50513          	addi	a0,a0,78 # ffffffffc02080a8 <etext+0x18>
ffffffffc0200062:	06a000ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200066:	5f5000ef          	jal	ra,ffffffffc0200e5a <pmm_init>
ffffffffc020006a:	5c6000ef          	jal	ra,ffffffffc0200630 <pic_init>
ffffffffc020006e:	5d0000ef          	jal	ra,ffffffffc020063e <idt_init>
ffffffffc0200072:	237010ef          	jal	ra,ffffffffc0201aa8 <vmm_init>
ffffffffc0200076:	263040ef          	jal	ra,ffffffffc0204ad8 <sched_init>
ffffffffc020007a:	051040ef          	jal	ra,ffffffffc02048ca <proc_init>
ffffffffc020007e:	4a2000ef          	jal	ra,ffffffffc0200520 <ide_init>
ffffffffc0200082:	3bf010ef          	jal	ra,ffffffffc0201c40 <swap_init>
ffffffffc0200086:	4f0000ef          	jal	ra,ffffffffc0200576 <clock_init>
ffffffffc020008a:	5a8000ef          	jal	ra,ffffffffc0200632 <intr_enable>
ffffffffc020008e:	173040ef          	jal	ra,ffffffffc0204a00 <cpu_idle>

ffffffffc0200092 <cputch>:
ffffffffc0200092:	1141                	addi	sp,sp,-16
ffffffffc0200094:	e022                	sd	s0,0(sp)
ffffffffc0200096:	e406                	sd	ra,8(sp)
ffffffffc0200098:	842e                	mv	s0,a1
ffffffffc020009a:	526000ef          	jal	ra,ffffffffc02005c0 <cons_putc>
ffffffffc020009e:	401c                	lw	a5,0(s0)
ffffffffc02000a0:	60a2                	ld	ra,8(sp)
ffffffffc02000a2:	2785                	addiw	a5,a5,1
ffffffffc02000a4:	c01c                	sw	a5,0(s0)
ffffffffc02000a6:	6402                	ld	s0,0(sp)
ffffffffc02000a8:	0141                	addi	sp,sp,16
ffffffffc02000aa:	8082                	ret

ffffffffc02000ac <vcprintf>:
ffffffffc02000ac:	1101                	addi	sp,sp,-32
ffffffffc02000ae:	862a                	mv	a2,a0
ffffffffc02000b0:	86ae                	mv	a3,a1
ffffffffc02000b2:	00000517          	auipc	a0,0x0
ffffffffc02000b6:	fe050513          	addi	a0,a0,-32 # ffffffffc0200092 <cputch>
ffffffffc02000ba:	006c                	addi	a1,sp,12
ffffffffc02000bc:	ec06                	sd	ra,24(sp)
ffffffffc02000be:	c602                	sw	zero,12(sp)
ffffffffc02000c0:	439070ef          	jal	ra,ffffffffc0207cf8 <vprintfmt>
ffffffffc02000c4:	60e2                	ld	ra,24(sp)
ffffffffc02000c6:	4532                	lw	a0,12(sp)
ffffffffc02000c8:	6105                	addi	sp,sp,32
ffffffffc02000ca:	8082                	ret

ffffffffc02000cc <cprintf>:
ffffffffc02000cc:	711d                	addi	sp,sp,-96
ffffffffc02000ce:	02810313          	addi	t1,sp,40 # ffffffffc020d028 <boot_page_table_sv39+0x28>
ffffffffc02000d2:	8e2a                	mv	t3,a0
ffffffffc02000d4:	f42e                	sd	a1,40(sp)
ffffffffc02000d6:	f832                	sd	a2,48(sp)
ffffffffc02000d8:	fc36                	sd	a3,56(sp)
ffffffffc02000da:	00000517          	auipc	a0,0x0
ffffffffc02000de:	fb850513          	addi	a0,a0,-72 # ffffffffc0200092 <cputch>
ffffffffc02000e2:	004c                	addi	a1,sp,4
ffffffffc02000e4:	869a                	mv	a3,t1
ffffffffc02000e6:	8672                	mv	a2,t3
ffffffffc02000e8:	ec06                	sd	ra,24(sp)
ffffffffc02000ea:	e0ba                	sd	a4,64(sp)
ffffffffc02000ec:	e4be                	sd	a5,72(sp)
ffffffffc02000ee:	e8c2                	sd	a6,80(sp)
ffffffffc02000f0:	ecc6                	sd	a7,88(sp)
ffffffffc02000f2:	e41a                	sd	t1,8(sp)
ffffffffc02000f4:	c202                	sw	zero,4(sp)
ffffffffc02000f6:	403070ef          	jal	ra,ffffffffc0207cf8 <vprintfmt>
ffffffffc02000fa:	60e2                	ld	ra,24(sp)
ffffffffc02000fc:	4512                	lw	a0,4(sp)
ffffffffc02000fe:	6125                	addi	sp,sp,96
ffffffffc0200100:	8082                	ret

ffffffffc0200102 <cputchar>:
ffffffffc0200102:	a97d                	j	ffffffffc02005c0 <cons_putc>

ffffffffc0200104 <cputs>:
ffffffffc0200104:	1101                	addi	sp,sp,-32
ffffffffc0200106:	e822                	sd	s0,16(sp)
ffffffffc0200108:	ec06                	sd	ra,24(sp)
ffffffffc020010a:	e426                	sd	s1,8(sp)
ffffffffc020010c:	842a                	mv	s0,a0
ffffffffc020010e:	00054503          	lbu	a0,0(a0)
ffffffffc0200112:	c51d                	beqz	a0,ffffffffc0200140 <cputs+0x3c>
ffffffffc0200114:	0405                	addi	s0,s0,1
ffffffffc0200116:	4485                	li	s1,1
ffffffffc0200118:	9c81                	subw	s1,s1,s0
ffffffffc020011a:	4a6000ef          	jal	ra,ffffffffc02005c0 <cons_putc>
ffffffffc020011e:	00044503          	lbu	a0,0(s0)
ffffffffc0200122:	008487bb          	addw	a5,s1,s0
ffffffffc0200126:	0405                	addi	s0,s0,1
ffffffffc0200128:	f96d                	bnez	a0,ffffffffc020011a <cputs+0x16>
ffffffffc020012a:	0017841b          	addiw	s0,a5,1
ffffffffc020012e:	4529                	li	a0,10
ffffffffc0200130:	490000ef          	jal	ra,ffffffffc02005c0 <cons_putc>
ffffffffc0200134:	60e2                	ld	ra,24(sp)
ffffffffc0200136:	8522                	mv	a0,s0
ffffffffc0200138:	6442                	ld	s0,16(sp)
ffffffffc020013a:	64a2                	ld	s1,8(sp)
ffffffffc020013c:	6105                	addi	sp,sp,32
ffffffffc020013e:	8082                	ret
ffffffffc0200140:	4405                	li	s0,1
ffffffffc0200142:	b7f5                	j	ffffffffc020012e <cputs+0x2a>

ffffffffc0200144 <getchar>:
ffffffffc0200144:	1141                	addi	sp,sp,-16
ffffffffc0200146:	e406                	sd	ra,8(sp)
ffffffffc0200148:	4ac000ef          	jal	ra,ffffffffc02005f4 <cons_getc>
ffffffffc020014c:	dd75                	beqz	a0,ffffffffc0200148 <getchar+0x4>
ffffffffc020014e:	60a2                	ld	ra,8(sp)
ffffffffc0200150:	0141                	addi	sp,sp,16
ffffffffc0200152:	8082                	ret

ffffffffc0200154 <readline>:
ffffffffc0200154:	715d                	addi	sp,sp,-80
ffffffffc0200156:	e486                	sd	ra,72(sp)
ffffffffc0200158:	e0a6                	sd	s1,64(sp)
ffffffffc020015a:	fc4a                	sd	s2,56(sp)
ffffffffc020015c:	f84e                	sd	s3,48(sp)
ffffffffc020015e:	f452                	sd	s4,40(sp)
ffffffffc0200160:	f056                	sd	s5,32(sp)
ffffffffc0200162:	ec5a                	sd	s6,24(sp)
ffffffffc0200164:	e85e                	sd	s7,16(sp)
ffffffffc0200166:	c901                	beqz	a0,ffffffffc0200176 <readline+0x22>
ffffffffc0200168:	85aa                	mv	a1,a0
ffffffffc020016a:	00008517          	auipc	a0,0x8
ffffffffc020016e:	f4650513          	addi	a0,a0,-186 # ffffffffc02080b0 <etext+0x20>
ffffffffc0200172:	f5bff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200176:	4481                	li	s1,0
ffffffffc0200178:	497d                	li	s2,31
ffffffffc020017a:	49a1                	li	s3,8
ffffffffc020017c:	4aa9                	li	s5,10
ffffffffc020017e:	4b35                	li	s6,13
ffffffffc0200180:	00035b97          	auipc	s7,0x35
ffffffffc0200184:	900b8b93          	addi	s7,s7,-1792 # ffffffffc0234a80 <buf>
ffffffffc0200188:	3fe00a13          	li	s4,1022
ffffffffc020018c:	fb9ff0ef          	jal	ra,ffffffffc0200144 <getchar>
ffffffffc0200190:	00054a63          	bltz	a0,ffffffffc02001a4 <readline+0x50>
ffffffffc0200194:	00a95a63          	bge	s2,a0,ffffffffc02001a8 <readline+0x54>
ffffffffc0200198:	029a5263          	bge	s4,s1,ffffffffc02001bc <readline+0x68>
ffffffffc020019c:	fa9ff0ef          	jal	ra,ffffffffc0200144 <getchar>
ffffffffc02001a0:	fe055ae3          	bgez	a0,ffffffffc0200194 <readline+0x40>
ffffffffc02001a4:	4501                	li	a0,0
ffffffffc02001a6:	a091                	j	ffffffffc02001ea <readline+0x96>
ffffffffc02001a8:	03351463          	bne	a0,s3,ffffffffc02001d0 <readline+0x7c>
ffffffffc02001ac:	e8a9                	bnez	s1,ffffffffc02001fe <readline+0xaa>
ffffffffc02001ae:	f97ff0ef          	jal	ra,ffffffffc0200144 <getchar>
ffffffffc02001b2:	fe0549e3          	bltz	a0,ffffffffc02001a4 <readline+0x50>
ffffffffc02001b6:	fea959e3          	bge	s2,a0,ffffffffc02001a8 <readline+0x54>
ffffffffc02001ba:	4481                	li	s1,0
ffffffffc02001bc:	e42a                	sd	a0,8(sp)
ffffffffc02001be:	f45ff0ef          	jal	ra,ffffffffc0200102 <cputchar>
ffffffffc02001c2:	6522                	ld	a0,8(sp)
ffffffffc02001c4:	009b87b3          	add	a5,s7,s1
ffffffffc02001c8:	2485                	addiw	s1,s1,1
ffffffffc02001ca:	00a78023          	sb	a0,0(a5)
ffffffffc02001ce:	bf7d                	j	ffffffffc020018c <readline+0x38>
ffffffffc02001d0:	01550463          	beq	a0,s5,ffffffffc02001d8 <readline+0x84>
ffffffffc02001d4:	fb651ce3          	bne	a0,s6,ffffffffc020018c <readline+0x38>
ffffffffc02001d8:	f2bff0ef          	jal	ra,ffffffffc0200102 <cputchar>
ffffffffc02001dc:	00035517          	auipc	a0,0x35
ffffffffc02001e0:	8a450513          	addi	a0,a0,-1884 # ffffffffc0234a80 <buf>
ffffffffc02001e4:	94aa                	add	s1,s1,a0
ffffffffc02001e6:	00048023          	sb	zero,0(s1)
ffffffffc02001ea:	60a6                	ld	ra,72(sp)
ffffffffc02001ec:	6486                	ld	s1,64(sp)
ffffffffc02001ee:	7962                	ld	s2,56(sp)
ffffffffc02001f0:	79c2                	ld	s3,48(sp)
ffffffffc02001f2:	7a22                	ld	s4,40(sp)
ffffffffc02001f4:	7a82                	ld	s5,32(sp)
ffffffffc02001f6:	6b62                	ld	s6,24(sp)
ffffffffc02001f8:	6bc2                	ld	s7,16(sp)
ffffffffc02001fa:	6161                	addi	sp,sp,80
ffffffffc02001fc:	8082                	ret
ffffffffc02001fe:	4521                	li	a0,8
ffffffffc0200200:	f03ff0ef          	jal	ra,ffffffffc0200102 <cputchar>
ffffffffc0200204:	34fd                	addiw	s1,s1,-1
ffffffffc0200206:	b759                	j	ffffffffc020018c <readline+0x38>

ffffffffc0200208 <__panic>:
ffffffffc0200208:	00040317          	auipc	t1,0x40
ffffffffc020020c:	ca830313          	addi	t1,t1,-856 # ffffffffc023feb0 <is_panic>
ffffffffc0200210:	00033e03          	ld	t3,0(t1)
ffffffffc0200214:	715d                	addi	sp,sp,-80
ffffffffc0200216:	ec06                	sd	ra,24(sp)
ffffffffc0200218:	e822                	sd	s0,16(sp)
ffffffffc020021a:	f436                	sd	a3,40(sp)
ffffffffc020021c:	f83a                	sd	a4,48(sp)
ffffffffc020021e:	fc3e                	sd	a5,56(sp)
ffffffffc0200220:	e0c2                	sd	a6,64(sp)
ffffffffc0200222:	e4c6                	sd	a7,72(sp)
ffffffffc0200224:	020e1a63          	bnez	t3,ffffffffc0200258 <__panic+0x50>
ffffffffc0200228:	4785                	li	a5,1
ffffffffc020022a:	00f33023          	sd	a5,0(t1)
ffffffffc020022e:	8432                	mv	s0,a2
ffffffffc0200230:	103c                	addi	a5,sp,40
ffffffffc0200232:	862e                	mv	a2,a1
ffffffffc0200234:	85aa                	mv	a1,a0
ffffffffc0200236:	00008517          	auipc	a0,0x8
ffffffffc020023a:	e8250513          	addi	a0,a0,-382 # ffffffffc02080b8 <etext+0x28>
ffffffffc020023e:	e43e                	sd	a5,8(sp)
ffffffffc0200240:	e8dff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200244:	65a2                	ld	a1,8(sp)
ffffffffc0200246:	8522                	mv	a0,s0
ffffffffc0200248:	e65ff0ef          	jal	ra,ffffffffc02000ac <vcprintf>
ffffffffc020024c:	0000a517          	auipc	a0,0xa
ffffffffc0200250:	8f450513          	addi	a0,a0,-1804 # ffffffffc0209b40 <default_pmm_manager+0x6c0>
ffffffffc0200254:	e79ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200258:	4501                	li	a0,0
ffffffffc020025a:	4581                	li	a1,0
ffffffffc020025c:	4601                	li	a2,0
ffffffffc020025e:	48a1                	li	a7,8
ffffffffc0200260:	00000073          	ecall
ffffffffc0200264:	3d4000ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc0200268:	4501                	li	a0,0
ffffffffc020026a:	174000ef          	jal	ra,ffffffffc02003de <kmonitor>
ffffffffc020026e:	bfed                	j	ffffffffc0200268 <__panic+0x60>

ffffffffc0200270 <__warn>:
ffffffffc0200270:	715d                	addi	sp,sp,-80
ffffffffc0200272:	832e                	mv	t1,a1
ffffffffc0200274:	e822                	sd	s0,16(sp)
ffffffffc0200276:	85aa                	mv	a1,a0
ffffffffc0200278:	8432                	mv	s0,a2
ffffffffc020027a:	fc3e                	sd	a5,56(sp)
ffffffffc020027c:	861a                	mv	a2,t1
ffffffffc020027e:	103c                	addi	a5,sp,40
ffffffffc0200280:	00008517          	auipc	a0,0x8
ffffffffc0200284:	e5850513          	addi	a0,a0,-424 # ffffffffc02080d8 <etext+0x48>
ffffffffc0200288:	ec06                	sd	ra,24(sp)
ffffffffc020028a:	f436                	sd	a3,40(sp)
ffffffffc020028c:	f83a                	sd	a4,48(sp)
ffffffffc020028e:	e0c2                	sd	a6,64(sp)
ffffffffc0200290:	e4c6                	sd	a7,72(sp)
ffffffffc0200292:	e43e                	sd	a5,8(sp)
ffffffffc0200294:	e39ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200298:	65a2                	ld	a1,8(sp)
ffffffffc020029a:	8522                	mv	a0,s0
ffffffffc020029c:	e11ff0ef          	jal	ra,ffffffffc02000ac <vcprintf>
ffffffffc02002a0:	0000a517          	auipc	a0,0xa
ffffffffc02002a4:	8a050513          	addi	a0,a0,-1888 # ffffffffc0209b40 <default_pmm_manager+0x6c0>
ffffffffc02002a8:	e25ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02002ac:	60e2                	ld	ra,24(sp)
ffffffffc02002ae:	6442                	ld	s0,16(sp)
ffffffffc02002b0:	6161                	addi	sp,sp,80
ffffffffc02002b2:	8082                	ret

ffffffffc02002b4 <print_kerninfo>:
ffffffffc02002b4:	1141                	addi	sp,sp,-16
ffffffffc02002b6:	00008517          	auipc	a0,0x8
ffffffffc02002ba:	e4250513          	addi	a0,a0,-446 # ffffffffc02080f8 <etext+0x68>
ffffffffc02002be:	e406                	sd	ra,8(sp)
ffffffffc02002c0:	e0dff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02002c4:	00000597          	auipc	a1,0x0
ffffffffc02002c8:	d6e58593          	addi	a1,a1,-658 # ffffffffc0200032 <kern_init>
ffffffffc02002cc:	00008517          	auipc	a0,0x8
ffffffffc02002d0:	e4c50513          	addi	a0,a0,-436 # ffffffffc0208118 <etext+0x88>
ffffffffc02002d4:	df9ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02002d8:	00008597          	auipc	a1,0x8
ffffffffc02002dc:	db858593          	addi	a1,a1,-584 # ffffffffc0208090 <etext>
ffffffffc02002e0:	00008517          	auipc	a0,0x8
ffffffffc02002e4:	e5850513          	addi	a0,a0,-424 # ffffffffc0208138 <etext+0xa8>
ffffffffc02002e8:	de5ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02002ec:	00034597          	auipc	a1,0x34
ffffffffc02002f0:	79058593          	addi	a1,a1,1936 # ffffffffc0234a7c <edata>
ffffffffc02002f4:	00008517          	auipc	a0,0x8
ffffffffc02002f8:	e6450513          	addi	a0,a0,-412 # ffffffffc0208158 <etext+0xc8>
ffffffffc02002fc:	dd1ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200300:	00040597          	auipc	a1,0x40
ffffffffc0200304:	da058593          	addi	a1,a1,-608 # ffffffffc02400a0 <end>
ffffffffc0200308:	00008517          	auipc	a0,0x8
ffffffffc020030c:	e7050513          	addi	a0,a0,-400 # ffffffffc0208178 <etext+0xe8>
ffffffffc0200310:	dbdff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200314:	00040597          	auipc	a1,0x40
ffffffffc0200318:	18b58593          	addi	a1,a1,395 # ffffffffc024049f <end+0x3ff>
ffffffffc020031c:	00000797          	auipc	a5,0x0
ffffffffc0200320:	d1678793          	addi	a5,a5,-746 # ffffffffc0200032 <kern_init>
ffffffffc0200324:	40f587b3          	sub	a5,a1,a5
ffffffffc0200328:	43f7d593          	srai	a1,a5,0x3f
ffffffffc020032c:	60a2                	ld	ra,8(sp)
ffffffffc020032e:	3ff5f593          	andi	a1,a1,1023
ffffffffc0200332:	95be                	add	a1,a1,a5
ffffffffc0200334:	85a9                	srai	a1,a1,0xa
ffffffffc0200336:	00008517          	auipc	a0,0x8
ffffffffc020033a:	e6250513          	addi	a0,a0,-414 # ffffffffc0208198 <etext+0x108>
ffffffffc020033e:	0141                	addi	sp,sp,16
ffffffffc0200340:	b371                	j	ffffffffc02000cc <cprintf>

ffffffffc0200342 <print_stackframe>:
ffffffffc0200342:	1141                	addi	sp,sp,-16
ffffffffc0200344:	00008617          	auipc	a2,0x8
ffffffffc0200348:	e8460613          	addi	a2,a2,-380 # ffffffffc02081c8 <etext+0x138>
ffffffffc020034c:	05b00593          	li	a1,91
ffffffffc0200350:	00008517          	auipc	a0,0x8
ffffffffc0200354:	e9050513          	addi	a0,a0,-368 # ffffffffc02081e0 <etext+0x150>
ffffffffc0200358:	e406                	sd	ra,8(sp)
ffffffffc020035a:	eafff0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc020035e <mon_help>:
ffffffffc020035e:	1141                	addi	sp,sp,-16
ffffffffc0200360:	00008617          	auipc	a2,0x8
ffffffffc0200364:	e9860613          	addi	a2,a2,-360 # ffffffffc02081f8 <etext+0x168>
ffffffffc0200368:	00008597          	auipc	a1,0x8
ffffffffc020036c:	eb058593          	addi	a1,a1,-336 # ffffffffc0208218 <etext+0x188>
ffffffffc0200370:	00008517          	auipc	a0,0x8
ffffffffc0200374:	eb050513          	addi	a0,a0,-336 # ffffffffc0208220 <etext+0x190>
ffffffffc0200378:	e406                	sd	ra,8(sp)
ffffffffc020037a:	d53ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc020037e:	00008617          	auipc	a2,0x8
ffffffffc0200382:	eb260613          	addi	a2,a2,-334 # ffffffffc0208230 <etext+0x1a0>
ffffffffc0200386:	00008597          	auipc	a1,0x8
ffffffffc020038a:	ed258593          	addi	a1,a1,-302 # ffffffffc0208258 <etext+0x1c8>
ffffffffc020038e:	00008517          	auipc	a0,0x8
ffffffffc0200392:	e9250513          	addi	a0,a0,-366 # ffffffffc0208220 <etext+0x190>
ffffffffc0200396:	d37ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc020039a:	00008617          	auipc	a2,0x8
ffffffffc020039e:	ece60613          	addi	a2,a2,-306 # ffffffffc0208268 <etext+0x1d8>
ffffffffc02003a2:	00008597          	auipc	a1,0x8
ffffffffc02003a6:	ee658593          	addi	a1,a1,-282 # ffffffffc0208288 <etext+0x1f8>
ffffffffc02003aa:	00008517          	auipc	a0,0x8
ffffffffc02003ae:	e7650513          	addi	a0,a0,-394 # ffffffffc0208220 <etext+0x190>
ffffffffc02003b2:	d1bff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02003b6:	60a2                	ld	ra,8(sp)
ffffffffc02003b8:	4501                	li	a0,0
ffffffffc02003ba:	0141                	addi	sp,sp,16
ffffffffc02003bc:	8082                	ret

ffffffffc02003be <mon_kerninfo>:
ffffffffc02003be:	1141                	addi	sp,sp,-16
ffffffffc02003c0:	e406                	sd	ra,8(sp)
ffffffffc02003c2:	ef3ff0ef          	jal	ra,ffffffffc02002b4 <print_kerninfo>
ffffffffc02003c6:	60a2                	ld	ra,8(sp)
ffffffffc02003c8:	4501                	li	a0,0
ffffffffc02003ca:	0141                	addi	sp,sp,16
ffffffffc02003cc:	8082                	ret

ffffffffc02003ce <mon_backtrace>:
ffffffffc02003ce:	1141                	addi	sp,sp,-16
ffffffffc02003d0:	e406                	sd	ra,8(sp)
ffffffffc02003d2:	f71ff0ef          	jal	ra,ffffffffc0200342 <print_stackframe>
ffffffffc02003d6:	60a2                	ld	ra,8(sp)
ffffffffc02003d8:	4501                	li	a0,0
ffffffffc02003da:	0141                	addi	sp,sp,16
ffffffffc02003dc:	8082                	ret

ffffffffc02003de <kmonitor>:
ffffffffc02003de:	7115                	addi	sp,sp,-224
ffffffffc02003e0:	e962                	sd	s8,144(sp)
ffffffffc02003e2:	8c2a                	mv	s8,a0
ffffffffc02003e4:	00008517          	auipc	a0,0x8
ffffffffc02003e8:	eb450513          	addi	a0,a0,-332 # ffffffffc0208298 <etext+0x208>
ffffffffc02003ec:	ed86                	sd	ra,216(sp)
ffffffffc02003ee:	e9a2                	sd	s0,208(sp)
ffffffffc02003f0:	e5a6                	sd	s1,200(sp)
ffffffffc02003f2:	e1ca                	sd	s2,192(sp)
ffffffffc02003f4:	fd4e                	sd	s3,184(sp)
ffffffffc02003f6:	f952                	sd	s4,176(sp)
ffffffffc02003f8:	f556                	sd	s5,168(sp)
ffffffffc02003fa:	f15a                	sd	s6,160(sp)
ffffffffc02003fc:	ed5e                	sd	s7,152(sp)
ffffffffc02003fe:	e566                	sd	s9,136(sp)
ffffffffc0200400:	e16a                	sd	s10,128(sp)
ffffffffc0200402:	ccbff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200406:	00008517          	auipc	a0,0x8
ffffffffc020040a:	eba50513          	addi	a0,a0,-326 # ffffffffc02082c0 <etext+0x230>
ffffffffc020040e:	cbfff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200412:	000c0563          	beqz	s8,ffffffffc020041c <kmonitor+0x3e>
ffffffffc0200416:	8562                	mv	a0,s8
ffffffffc0200418:	40e000ef          	jal	ra,ffffffffc0200826 <print_trapframe>
ffffffffc020041c:	00008c97          	auipc	s9,0x8
ffffffffc0200420:	f14c8c93          	addi	s9,s9,-236 # ffffffffc0208330 <commands>
ffffffffc0200424:	00008997          	auipc	s3,0x8
ffffffffc0200428:	ec498993          	addi	s3,s3,-316 # ffffffffc02082e8 <etext+0x258>
ffffffffc020042c:	00008917          	auipc	s2,0x8
ffffffffc0200430:	ec490913          	addi	s2,s2,-316 # ffffffffc02082f0 <etext+0x260>
ffffffffc0200434:	4a3d                	li	s4,15
ffffffffc0200436:	00008b17          	auipc	s6,0x8
ffffffffc020043a:	ec2b0b13          	addi	s6,s6,-318 # ffffffffc02082f8 <etext+0x268>
ffffffffc020043e:	00008a97          	auipc	s5,0x8
ffffffffc0200442:	ddaa8a93          	addi	s5,s5,-550 # ffffffffc0208218 <etext+0x188>
ffffffffc0200446:	4b8d                	li	s7,3
ffffffffc0200448:	854e                	mv	a0,s3
ffffffffc020044a:	d0bff0ef          	jal	ra,ffffffffc0200154 <readline>
ffffffffc020044e:	842a                	mv	s0,a0
ffffffffc0200450:	dd65                	beqz	a0,ffffffffc0200448 <kmonitor+0x6a>
ffffffffc0200452:	00054583          	lbu	a1,0(a0)
ffffffffc0200456:	4481                	li	s1,0
ffffffffc0200458:	c999                	beqz	a1,ffffffffc020046e <kmonitor+0x90>
ffffffffc020045a:	854a                	mv	a0,s2
ffffffffc020045c:	7f0070ef          	jal	ra,ffffffffc0207c4c <strchr>
ffffffffc0200460:	c925                	beqz	a0,ffffffffc02004d0 <kmonitor+0xf2>
ffffffffc0200462:	00144583          	lbu	a1,1(s0)
ffffffffc0200466:	00040023          	sb	zero,0(s0)
ffffffffc020046a:	0405                	addi	s0,s0,1
ffffffffc020046c:	f5fd                	bnez	a1,ffffffffc020045a <kmonitor+0x7c>
ffffffffc020046e:	dce9                	beqz	s1,ffffffffc0200448 <kmonitor+0x6a>
ffffffffc0200470:	6582                	ld	a1,0(sp)
ffffffffc0200472:	00008d17          	auipc	s10,0x8
ffffffffc0200476:	ebed0d13          	addi	s10,s10,-322 # ffffffffc0208330 <commands>
ffffffffc020047a:	8556                	mv	a0,s5
ffffffffc020047c:	4401                	li	s0,0
ffffffffc020047e:	0d61                	addi	s10,s10,24
ffffffffc0200480:	7ae070ef          	jal	ra,ffffffffc0207c2e <strcmp>
ffffffffc0200484:	c919                	beqz	a0,ffffffffc020049a <kmonitor+0xbc>
ffffffffc0200486:	2405                	addiw	s0,s0,1
ffffffffc0200488:	09740463          	beq	s0,s7,ffffffffc0200510 <kmonitor+0x132>
ffffffffc020048c:	000d3503          	ld	a0,0(s10)
ffffffffc0200490:	6582                	ld	a1,0(sp)
ffffffffc0200492:	0d61                	addi	s10,s10,24
ffffffffc0200494:	79a070ef          	jal	ra,ffffffffc0207c2e <strcmp>
ffffffffc0200498:	f57d                	bnez	a0,ffffffffc0200486 <kmonitor+0xa8>
ffffffffc020049a:	00141793          	slli	a5,s0,0x1
ffffffffc020049e:	97a2                	add	a5,a5,s0
ffffffffc02004a0:	078e                	slli	a5,a5,0x3
ffffffffc02004a2:	97e6                	add	a5,a5,s9
ffffffffc02004a4:	6b9c                	ld	a5,16(a5)
ffffffffc02004a6:	8662                	mv	a2,s8
ffffffffc02004a8:	002c                	addi	a1,sp,8
ffffffffc02004aa:	fff4851b          	addiw	a0,s1,-1
ffffffffc02004ae:	9782                	jalr	a5
ffffffffc02004b0:	f8055ce3          	bgez	a0,ffffffffc0200448 <kmonitor+0x6a>
ffffffffc02004b4:	60ee                	ld	ra,216(sp)
ffffffffc02004b6:	644e                	ld	s0,208(sp)
ffffffffc02004b8:	64ae                	ld	s1,200(sp)
ffffffffc02004ba:	690e                	ld	s2,192(sp)
ffffffffc02004bc:	79ea                	ld	s3,184(sp)
ffffffffc02004be:	7a4a                	ld	s4,176(sp)
ffffffffc02004c0:	7aaa                	ld	s5,168(sp)
ffffffffc02004c2:	7b0a                	ld	s6,160(sp)
ffffffffc02004c4:	6bea                	ld	s7,152(sp)
ffffffffc02004c6:	6c4a                	ld	s8,144(sp)
ffffffffc02004c8:	6caa                	ld	s9,136(sp)
ffffffffc02004ca:	6d0a                	ld	s10,128(sp)
ffffffffc02004cc:	612d                	addi	sp,sp,224
ffffffffc02004ce:	8082                	ret
ffffffffc02004d0:	00044783          	lbu	a5,0(s0)
ffffffffc02004d4:	dfc9                	beqz	a5,ffffffffc020046e <kmonitor+0x90>
ffffffffc02004d6:	03448863          	beq	s1,s4,ffffffffc0200506 <kmonitor+0x128>
ffffffffc02004da:	00349793          	slli	a5,s1,0x3
ffffffffc02004de:	0118                	addi	a4,sp,128
ffffffffc02004e0:	97ba                	add	a5,a5,a4
ffffffffc02004e2:	f887b023          	sd	s0,-128(a5)
ffffffffc02004e6:	00044583          	lbu	a1,0(s0)
ffffffffc02004ea:	2485                	addiw	s1,s1,1
ffffffffc02004ec:	e591                	bnez	a1,ffffffffc02004f8 <kmonitor+0x11a>
ffffffffc02004ee:	b749                	j	ffffffffc0200470 <kmonitor+0x92>
ffffffffc02004f0:	00144583          	lbu	a1,1(s0)
ffffffffc02004f4:	0405                	addi	s0,s0,1
ffffffffc02004f6:	ddad                	beqz	a1,ffffffffc0200470 <kmonitor+0x92>
ffffffffc02004f8:	854a                	mv	a0,s2
ffffffffc02004fa:	752070ef          	jal	ra,ffffffffc0207c4c <strchr>
ffffffffc02004fe:	d96d                	beqz	a0,ffffffffc02004f0 <kmonitor+0x112>
ffffffffc0200500:	00044583          	lbu	a1,0(s0)
ffffffffc0200504:	bf91                	j	ffffffffc0200458 <kmonitor+0x7a>
ffffffffc0200506:	45c1                	li	a1,16
ffffffffc0200508:	855a                	mv	a0,s6
ffffffffc020050a:	bc3ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc020050e:	b7f1                	j	ffffffffc02004da <kmonitor+0xfc>
ffffffffc0200510:	6582                	ld	a1,0(sp)
ffffffffc0200512:	00008517          	auipc	a0,0x8
ffffffffc0200516:	e0650513          	addi	a0,a0,-506 # ffffffffc0208318 <etext+0x288>
ffffffffc020051a:	bb3ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc020051e:	b72d                	j	ffffffffc0200448 <kmonitor+0x6a>

ffffffffc0200520 <ide_init>:
ffffffffc0200520:	8082                	ret

ffffffffc0200522 <ide_device_valid>:
ffffffffc0200522:	00253513          	sltiu	a0,a0,2
ffffffffc0200526:	8082                	ret

ffffffffc0200528 <ide_device_size>:
ffffffffc0200528:	03800513          	li	a0,56
ffffffffc020052c:	8082                	ret

ffffffffc020052e <ide_read_secs>:
ffffffffc020052e:	00035797          	auipc	a5,0x35
ffffffffc0200532:	95278793          	addi	a5,a5,-1710 # ffffffffc0234e80 <ide>
ffffffffc0200536:	0095959b          	slliw	a1,a1,0x9
ffffffffc020053a:	1141                	addi	sp,sp,-16
ffffffffc020053c:	8532                	mv	a0,a2
ffffffffc020053e:	95be                	add	a1,a1,a5
ffffffffc0200540:	00969613          	slli	a2,a3,0x9
ffffffffc0200544:	e406                	sd	ra,8(sp)
ffffffffc0200546:	72e070ef          	jal	ra,ffffffffc0207c74 <memcpy>
ffffffffc020054a:	60a2                	ld	ra,8(sp)
ffffffffc020054c:	4501                	li	a0,0
ffffffffc020054e:	0141                	addi	sp,sp,16
ffffffffc0200550:	8082                	ret

ffffffffc0200552 <ide_write_secs>:
ffffffffc0200552:	0095979b          	slliw	a5,a1,0x9
ffffffffc0200556:	00035517          	auipc	a0,0x35
ffffffffc020055a:	92a50513          	addi	a0,a0,-1750 # ffffffffc0234e80 <ide>
ffffffffc020055e:	1141                	addi	sp,sp,-16
ffffffffc0200560:	85b2                	mv	a1,a2
ffffffffc0200562:	953e                	add	a0,a0,a5
ffffffffc0200564:	00969613          	slli	a2,a3,0x9
ffffffffc0200568:	e406                	sd	ra,8(sp)
ffffffffc020056a:	70a070ef          	jal	ra,ffffffffc0207c74 <memcpy>
ffffffffc020056e:	60a2                	ld	ra,8(sp)
ffffffffc0200570:	4501                	li	a0,0
ffffffffc0200572:	0141                	addi	sp,sp,16
ffffffffc0200574:	8082                	ret

ffffffffc0200576 <clock_init>:
ffffffffc0200576:	02000793          	li	a5,32
ffffffffc020057a:	1047a7f3          	csrrs	a5,sie,a5
ffffffffc020057e:	c0102573          	rdtime	a0
ffffffffc0200582:	67e1                	lui	a5,0x18
ffffffffc0200584:	6a078793          	addi	a5,a5,1696 # 186a0 <_binary_obj___user_matrix_out_size+0x15d00>
ffffffffc0200588:	953e                	add	a0,a0,a5
ffffffffc020058a:	4581                	li	a1,0
ffffffffc020058c:	4601                	li	a2,0
ffffffffc020058e:	4881                	li	a7,0
ffffffffc0200590:	00000073          	ecall
ffffffffc0200594:	00008517          	auipc	a0,0x8
ffffffffc0200598:	de450513          	addi	a0,a0,-540 # ffffffffc0208378 <commands+0x48>
ffffffffc020059c:	00040797          	auipc	a5,0x40
ffffffffc02005a0:	9607be23          	sd	zero,-1668(a5) # ffffffffc023ff18 <ticks>
ffffffffc02005a4:	b625                	j	ffffffffc02000cc <cprintf>

ffffffffc02005a6 <clock_set_next_event>:
ffffffffc02005a6:	c0102573          	rdtime	a0
ffffffffc02005aa:	67e1                	lui	a5,0x18
ffffffffc02005ac:	6a078793          	addi	a5,a5,1696 # 186a0 <_binary_obj___user_matrix_out_size+0x15d00>
ffffffffc02005b0:	953e                	add	a0,a0,a5
ffffffffc02005b2:	4581                	li	a1,0
ffffffffc02005b4:	4601                	li	a2,0
ffffffffc02005b6:	4881                	li	a7,0
ffffffffc02005b8:	00000073          	ecall
ffffffffc02005bc:	8082                	ret

ffffffffc02005be <cons_init>:
ffffffffc02005be:	8082                	ret

ffffffffc02005c0 <cons_putc>:
ffffffffc02005c0:	100027f3          	csrr	a5,sstatus
ffffffffc02005c4:	8b89                	andi	a5,a5,2
ffffffffc02005c6:	0ff57513          	andi	a0,a0,255
ffffffffc02005ca:	e799                	bnez	a5,ffffffffc02005d8 <cons_putc+0x18>
ffffffffc02005cc:	4581                	li	a1,0
ffffffffc02005ce:	4601                	li	a2,0
ffffffffc02005d0:	4885                	li	a7,1
ffffffffc02005d2:	00000073          	ecall
ffffffffc02005d6:	8082                	ret
ffffffffc02005d8:	1101                	addi	sp,sp,-32
ffffffffc02005da:	ec06                	sd	ra,24(sp)
ffffffffc02005dc:	e42a                	sd	a0,8(sp)
ffffffffc02005de:	05a000ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc02005e2:	6522                	ld	a0,8(sp)
ffffffffc02005e4:	4581                	li	a1,0
ffffffffc02005e6:	4601                	li	a2,0
ffffffffc02005e8:	4885                	li	a7,1
ffffffffc02005ea:	00000073          	ecall
ffffffffc02005ee:	60e2                	ld	ra,24(sp)
ffffffffc02005f0:	6105                	addi	sp,sp,32
ffffffffc02005f2:	a081                	j	ffffffffc0200632 <intr_enable>

ffffffffc02005f4 <cons_getc>:
ffffffffc02005f4:	100027f3          	csrr	a5,sstatus
ffffffffc02005f8:	8b89                	andi	a5,a5,2
ffffffffc02005fa:	eb89                	bnez	a5,ffffffffc020060c <cons_getc+0x18>
ffffffffc02005fc:	4501                	li	a0,0
ffffffffc02005fe:	4581                	li	a1,0
ffffffffc0200600:	4601                	li	a2,0
ffffffffc0200602:	4889                	li	a7,2
ffffffffc0200604:	00000073          	ecall
ffffffffc0200608:	2501                	sext.w	a0,a0
ffffffffc020060a:	8082                	ret
ffffffffc020060c:	1101                	addi	sp,sp,-32
ffffffffc020060e:	ec06                	sd	ra,24(sp)
ffffffffc0200610:	028000ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc0200614:	4501                	li	a0,0
ffffffffc0200616:	4581                	li	a1,0
ffffffffc0200618:	4601                	li	a2,0
ffffffffc020061a:	4889                	li	a7,2
ffffffffc020061c:	00000073          	ecall
ffffffffc0200620:	2501                	sext.w	a0,a0
ffffffffc0200622:	e42a                	sd	a0,8(sp)
ffffffffc0200624:	00e000ef          	jal	ra,ffffffffc0200632 <intr_enable>
ffffffffc0200628:	60e2                	ld	ra,24(sp)
ffffffffc020062a:	6522                	ld	a0,8(sp)
ffffffffc020062c:	6105                	addi	sp,sp,32
ffffffffc020062e:	8082                	ret

ffffffffc0200630 <pic_init>:
ffffffffc0200630:	8082                	ret

ffffffffc0200632 <intr_enable>:
ffffffffc0200632:	100167f3          	csrrsi	a5,sstatus,2
ffffffffc0200636:	8082                	ret

ffffffffc0200638 <intr_disable>:
ffffffffc0200638:	100177f3          	csrrci	a5,sstatus,2
ffffffffc020063c:	8082                	ret

ffffffffc020063e <idt_init>:
ffffffffc020063e:	14005073          	csrwi	sscratch,0
ffffffffc0200642:	00000797          	auipc	a5,0x0
ffffffffc0200646:	61e78793          	addi	a5,a5,1566 # ffffffffc0200c60 <__alltraps>
ffffffffc020064a:	10579073          	csrw	stvec,a5
ffffffffc020064e:	000407b7          	lui	a5,0x40
ffffffffc0200652:	1007a7f3          	csrrs	a5,sstatus,a5
ffffffffc0200656:	8082                	ret

ffffffffc0200658 <print_regs>:
ffffffffc0200658:	610c                	ld	a1,0(a0)
ffffffffc020065a:	1141                	addi	sp,sp,-16
ffffffffc020065c:	e022                	sd	s0,0(sp)
ffffffffc020065e:	842a                	mv	s0,a0
ffffffffc0200660:	00008517          	auipc	a0,0x8
ffffffffc0200664:	d3850513          	addi	a0,a0,-712 # ffffffffc0208398 <commands+0x68>
ffffffffc0200668:	e406                	sd	ra,8(sp)
ffffffffc020066a:	a63ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc020066e:	640c                	ld	a1,8(s0)
ffffffffc0200670:	00008517          	auipc	a0,0x8
ffffffffc0200674:	d4050513          	addi	a0,a0,-704 # ffffffffc02083b0 <commands+0x80>
ffffffffc0200678:	a55ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc020067c:	680c                	ld	a1,16(s0)
ffffffffc020067e:	00008517          	auipc	a0,0x8
ffffffffc0200682:	d4a50513          	addi	a0,a0,-694 # ffffffffc02083c8 <commands+0x98>
ffffffffc0200686:	a47ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc020068a:	6c0c                	ld	a1,24(s0)
ffffffffc020068c:	00008517          	auipc	a0,0x8
ffffffffc0200690:	d5450513          	addi	a0,a0,-684 # ffffffffc02083e0 <commands+0xb0>
ffffffffc0200694:	a39ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200698:	700c                	ld	a1,32(s0)
ffffffffc020069a:	00008517          	auipc	a0,0x8
ffffffffc020069e:	d5e50513          	addi	a0,a0,-674 # ffffffffc02083f8 <commands+0xc8>
ffffffffc02006a2:	a2bff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02006a6:	740c                	ld	a1,40(s0)
ffffffffc02006a8:	00008517          	auipc	a0,0x8
ffffffffc02006ac:	d6850513          	addi	a0,a0,-664 # ffffffffc0208410 <commands+0xe0>
ffffffffc02006b0:	a1dff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02006b4:	780c                	ld	a1,48(s0)
ffffffffc02006b6:	00008517          	auipc	a0,0x8
ffffffffc02006ba:	d7250513          	addi	a0,a0,-654 # ffffffffc0208428 <commands+0xf8>
ffffffffc02006be:	a0fff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02006c2:	7c0c                	ld	a1,56(s0)
ffffffffc02006c4:	00008517          	auipc	a0,0x8
ffffffffc02006c8:	d7c50513          	addi	a0,a0,-644 # ffffffffc0208440 <commands+0x110>
ffffffffc02006cc:	a01ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02006d0:	602c                	ld	a1,64(s0)
ffffffffc02006d2:	00008517          	auipc	a0,0x8
ffffffffc02006d6:	d8650513          	addi	a0,a0,-634 # ffffffffc0208458 <commands+0x128>
ffffffffc02006da:	9f3ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02006de:	642c                	ld	a1,72(s0)
ffffffffc02006e0:	00008517          	auipc	a0,0x8
ffffffffc02006e4:	d9050513          	addi	a0,a0,-624 # ffffffffc0208470 <commands+0x140>
ffffffffc02006e8:	9e5ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02006ec:	682c                	ld	a1,80(s0)
ffffffffc02006ee:	00008517          	auipc	a0,0x8
ffffffffc02006f2:	d9a50513          	addi	a0,a0,-614 # ffffffffc0208488 <commands+0x158>
ffffffffc02006f6:	9d7ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02006fa:	6c2c                	ld	a1,88(s0)
ffffffffc02006fc:	00008517          	auipc	a0,0x8
ffffffffc0200700:	da450513          	addi	a0,a0,-604 # ffffffffc02084a0 <commands+0x170>
ffffffffc0200704:	9c9ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200708:	702c                	ld	a1,96(s0)
ffffffffc020070a:	00008517          	auipc	a0,0x8
ffffffffc020070e:	dae50513          	addi	a0,a0,-594 # ffffffffc02084b8 <commands+0x188>
ffffffffc0200712:	9bbff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200716:	742c                	ld	a1,104(s0)
ffffffffc0200718:	00008517          	auipc	a0,0x8
ffffffffc020071c:	db850513          	addi	a0,a0,-584 # ffffffffc02084d0 <commands+0x1a0>
ffffffffc0200720:	9adff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200724:	782c                	ld	a1,112(s0)
ffffffffc0200726:	00008517          	auipc	a0,0x8
ffffffffc020072a:	dc250513          	addi	a0,a0,-574 # ffffffffc02084e8 <commands+0x1b8>
ffffffffc020072e:	99fff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200732:	7c2c                	ld	a1,120(s0)
ffffffffc0200734:	00008517          	auipc	a0,0x8
ffffffffc0200738:	dcc50513          	addi	a0,a0,-564 # ffffffffc0208500 <commands+0x1d0>
ffffffffc020073c:	991ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200740:	604c                	ld	a1,128(s0)
ffffffffc0200742:	00008517          	auipc	a0,0x8
ffffffffc0200746:	dd650513          	addi	a0,a0,-554 # ffffffffc0208518 <commands+0x1e8>
ffffffffc020074a:	983ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc020074e:	644c                	ld	a1,136(s0)
ffffffffc0200750:	00008517          	auipc	a0,0x8
ffffffffc0200754:	de050513          	addi	a0,a0,-544 # ffffffffc0208530 <commands+0x200>
ffffffffc0200758:	975ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc020075c:	684c                	ld	a1,144(s0)
ffffffffc020075e:	00008517          	auipc	a0,0x8
ffffffffc0200762:	dea50513          	addi	a0,a0,-534 # ffffffffc0208548 <commands+0x218>
ffffffffc0200766:	967ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc020076a:	6c4c                	ld	a1,152(s0)
ffffffffc020076c:	00008517          	auipc	a0,0x8
ffffffffc0200770:	df450513          	addi	a0,a0,-524 # ffffffffc0208560 <commands+0x230>
ffffffffc0200774:	959ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200778:	704c                	ld	a1,160(s0)
ffffffffc020077a:	00008517          	auipc	a0,0x8
ffffffffc020077e:	dfe50513          	addi	a0,a0,-514 # ffffffffc0208578 <commands+0x248>
ffffffffc0200782:	94bff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200786:	744c                	ld	a1,168(s0)
ffffffffc0200788:	00008517          	auipc	a0,0x8
ffffffffc020078c:	e0850513          	addi	a0,a0,-504 # ffffffffc0208590 <commands+0x260>
ffffffffc0200790:	93dff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200794:	784c                	ld	a1,176(s0)
ffffffffc0200796:	00008517          	auipc	a0,0x8
ffffffffc020079a:	e1250513          	addi	a0,a0,-494 # ffffffffc02085a8 <commands+0x278>
ffffffffc020079e:	92fff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02007a2:	7c4c                	ld	a1,184(s0)
ffffffffc02007a4:	00008517          	auipc	a0,0x8
ffffffffc02007a8:	e1c50513          	addi	a0,a0,-484 # ffffffffc02085c0 <commands+0x290>
ffffffffc02007ac:	921ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02007b0:	606c                	ld	a1,192(s0)
ffffffffc02007b2:	00008517          	auipc	a0,0x8
ffffffffc02007b6:	e2650513          	addi	a0,a0,-474 # ffffffffc02085d8 <commands+0x2a8>
ffffffffc02007ba:	913ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02007be:	646c                	ld	a1,200(s0)
ffffffffc02007c0:	00008517          	auipc	a0,0x8
ffffffffc02007c4:	e3050513          	addi	a0,a0,-464 # ffffffffc02085f0 <commands+0x2c0>
ffffffffc02007c8:	905ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02007cc:	686c                	ld	a1,208(s0)
ffffffffc02007ce:	00008517          	auipc	a0,0x8
ffffffffc02007d2:	e3a50513          	addi	a0,a0,-454 # ffffffffc0208608 <commands+0x2d8>
ffffffffc02007d6:	8f7ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02007da:	6c6c                	ld	a1,216(s0)
ffffffffc02007dc:	00008517          	auipc	a0,0x8
ffffffffc02007e0:	e4450513          	addi	a0,a0,-444 # ffffffffc0208620 <commands+0x2f0>
ffffffffc02007e4:	8e9ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02007e8:	706c                	ld	a1,224(s0)
ffffffffc02007ea:	00008517          	auipc	a0,0x8
ffffffffc02007ee:	e4e50513          	addi	a0,a0,-434 # ffffffffc0208638 <commands+0x308>
ffffffffc02007f2:	8dbff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02007f6:	746c                	ld	a1,232(s0)
ffffffffc02007f8:	00008517          	auipc	a0,0x8
ffffffffc02007fc:	e5850513          	addi	a0,a0,-424 # ffffffffc0208650 <commands+0x320>
ffffffffc0200800:	8cdff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200804:	786c                	ld	a1,240(s0)
ffffffffc0200806:	00008517          	auipc	a0,0x8
ffffffffc020080a:	e6250513          	addi	a0,a0,-414 # ffffffffc0208668 <commands+0x338>
ffffffffc020080e:	8bfff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200812:	7c6c                	ld	a1,248(s0)
ffffffffc0200814:	6402                	ld	s0,0(sp)
ffffffffc0200816:	60a2                	ld	ra,8(sp)
ffffffffc0200818:	00008517          	auipc	a0,0x8
ffffffffc020081c:	e6850513          	addi	a0,a0,-408 # ffffffffc0208680 <commands+0x350>
ffffffffc0200820:	0141                	addi	sp,sp,16
ffffffffc0200822:	8abff06f          	j	ffffffffc02000cc <cprintf>

ffffffffc0200826 <print_trapframe>:
ffffffffc0200826:	1141                	addi	sp,sp,-16
ffffffffc0200828:	e022                	sd	s0,0(sp)
ffffffffc020082a:	85aa                	mv	a1,a0
ffffffffc020082c:	842a                	mv	s0,a0
ffffffffc020082e:	00008517          	auipc	a0,0x8
ffffffffc0200832:	e6a50513          	addi	a0,a0,-406 # ffffffffc0208698 <commands+0x368>
ffffffffc0200836:	e406                	sd	ra,8(sp)
ffffffffc0200838:	895ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc020083c:	8522                	mv	a0,s0
ffffffffc020083e:	e1bff0ef          	jal	ra,ffffffffc0200658 <print_regs>
ffffffffc0200842:	10043583          	ld	a1,256(s0)
ffffffffc0200846:	00008517          	auipc	a0,0x8
ffffffffc020084a:	e6a50513          	addi	a0,a0,-406 # ffffffffc02086b0 <commands+0x380>
ffffffffc020084e:	87fff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200852:	10843583          	ld	a1,264(s0)
ffffffffc0200856:	00008517          	auipc	a0,0x8
ffffffffc020085a:	e7250513          	addi	a0,a0,-398 # ffffffffc02086c8 <commands+0x398>
ffffffffc020085e:	86fff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200862:	11043583          	ld	a1,272(s0)
ffffffffc0200866:	00008517          	auipc	a0,0x8
ffffffffc020086a:	e7a50513          	addi	a0,a0,-390 # ffffffffc02086e0 <commands+0x3b0>
ffffffffc020086e:	85fff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200872:	11843583          	ld	a1,280(s0)
ffffffffc0200876:	6402                	ld	s0,0(sp)
ffffffffc0200878:	60a2                	ld	ra,8(sp)
ffffffffc020087a:	00008517          	auipc	a0,0x8
ffffffffc020087e:	e7650513          	addi	a0,a0,-394 # ffffffffc02086f0 <commands+0x3c0>
ffffffffc0200882:	0141                	addi	sp,sp,16
ffffffffc0200884:	849ff06f          	j	ffffffffc02000cc <cprintf>

ffffffffc0200888 <pgfault_handler>:
ffffffffc0200888:	1101                	addi	sp,sp,-32
ffffffffc020088a:	e426                	sd	s1,8(sp)
ffffffffc020088c:	0003f497          	auipc	s1,0x3f
ffffffffc0200890:	6b448493          	addi	s1,s1,1716 # ffffffffc023ff40 <check_mm_struct>
ffffffffc0200894:	609c                	ld	a5,0(s1)
ffffffffc0200896:	e822                	sd	s0,16(sp)
ffffffffc0200898:	ec06                	sd	ra,24(sp)
ffffffffc020089a:	842a                	mv	s0,a0
ffffffffc020089c:	cbad                	beqz	a5,ffffffffc020090e <pgfault_handler+0x86>
ffffffffc020089e:	10053783          	ld	a5,256(a0)
ffffffffc02008a2:	11053583          	ld	a1,272(a0)
ffffffffc02008a6:	04b00613          	li	a2,75
ffffffffc02008aa:	1007f793          	andi	a5,a5,256
ffffffffc02008ae:	c7b1                	beqz	a5,ffffffffc02008fa <pgfault_handler+0x72>
ffffffffc02008b0:	11843703          	ld	a4,280(s0)
ffffffffc02008b4:	47bd                	li	a5,15
ffffffffc02008b6:	05700693          	li	a3,87
ffffffffc02008ba:	00f70463          	beq	a4,a5,ffffffffc02008c2 <pgfault_handler+0x3a>
ffffffffc02008be:	05200693          	li	a3,82
ffffffffc02008c2:	00008517          	auipc	a0,0x8
ffffffffc02008c6:	e4650513          	addi	a0,a0,-442 # ffffffffc0208708 <commands+0x3d8>
ffffffffc02008ca:	803ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02008ce:	6088                	ld	a0,0(s1)
ffffffffc02008d0:	cd1d                	beqz	a0,ffffffffc020090e <pgfault_handler+0x86>
ffffffffc02008d2:	0003f717          	auipc	a4,0x3f
ffffffffc02008d6:	61673703          	ld	a4,1558(a4) # ffffffffc023fee8 <current>
ffffffffc02008da:	0003f797          	auipc	a5,0x3f
ffffffffc02008de:	6167b783          	ld	a5,1558(a5) # ffffffffc023fef0 <idleproc>
ffffffffc02008e2:	04f71663          	bne	a4,a5,ffffffffc020092e <pgfault_handler+0xa6>
ffffffffc02008e6:	11043603          	ld	a2,272(s0)
ffffffffc02008ea:	11843583          	ld	a1,280(s0)
ffffffffc02008ee:	6442                	ld	s0,16(sp)
ffffffffc02008f0:	60e2                	ld	ra,24(sp)
ffffffffc02008f2:	64a2                	ld	s1,8(sp)
ffffffffc02008f4:	6105                	addi	sp,sp,32
ffffffffc02008f6:	1b40106f          	j	ffffffffc0201aaa <do_pgfault>
ffffffffc02008fa:	11843703          	ld	a4,280(s0)
ffffffffc02008fe:	47bd                	li	a5,15
ffffffffc0200900:	05500613          	li	a2,85
ffffffffc0200904:	05700693          	li	a3,87
ffffffffc0200908:	faf71be3          	bne	a4,a5,ffffffffc02008be <pgfault_handler+0x36>
ffffffffc020090c:	bf5d                	j	ffffffffc02008c2 <pgfault_handler+0x3a>
ffffffffc020090e:	0003f797          	auipc	a5,0x3f
ffffffffc0200912:	5da7b783          	ld	a5,1498(a5) # ffffffffc023fee8 <current>
ffffffffc0200916:	cf85                	beqz	a5,ffffffffc020094e <pgfault_handler+0xc6>
ffffffffc0200918:	11043603          	ld	a2,272(s0)
ffffffffc020091c:	11843583          	ld	a1,280(s0)
ffffffffc0200920:	6442                	ld	s0,16(sp)
ffffffffc0200922:	60e2                	ld	ra,24(sp)
ffffffffc0200924:	64a2                	ld	s1,8(sp)
ffffffffc0200926:	7788                	ld	a0,40(a5)
ffffffffc0200928:	6105                	addi	sp,sp,32
ffffffffc020092a:	1800106f          	j	ffffffffc0201aaa <do_pgfault>
ffffffffc020092e:	00008697          	auipc	a3,0x8
ffffffffc0200932:	dfa68693          	addi	a3,a3,-518 # ffffffffc0208728 <commands+0x3f8>
ffffffffc0200936:	00008617          	auipc	a2,0x8
ffffffffc020093a:	e0a60613          	addi	a2,a2,-502 # ffffffffc0208740 <commands+0x410>
ffffffffc020093e:	06c00593          	li	a1,108
ffffffffc0200942:	00008517          	auipc	a0,0x8
ffffffffc0200946:	e1650513          	addi	a0,a0,-490 # ffffffffc0208758 <commands+0x428>
ffffffffc020094a:	8bfff0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc020094e:	8522                	mv	a0,s0
ffffffffc0200950:	ed7ff0ef          	jal	ra,ffffffffc0200826 <print_trapframe>
ffffffffc0200954:	10043783          	ld	a5,256(s0)
ffffffffc0200958:	11043583          	ld	a1,272(s0)
ffffffffc020095c:	04b00613          	li	a2,75
ffffffffc0200960:	1007f793          	andi	a5,a5,256
ffffffffc0200964:	e399                	bnez	a5,ffffffffc020096a <pgfault_handler+0xe2>
ffffffffc0200966:	05500613          	li	a2,85
ffffffffc020096a:	11843703          	ld	a4,280(s0)
ffffffffc020096e:	47bd                	li	a5,15
ffffffffc0200970:	02f70663          	beq	a4,a5,ffffffffc020099c <pgfault_handler+0x114>
ffffffffc0200974:	05200693          	li	a3,82
ffffffffc0200978:	00008517          	auipc	a0,0x8
ffffffffc020097c:	d9050513          	addi	a0,a0,-624 # ffffffffc0208708 <commands+0x3d8>
ffffffffc0200980:	f4cff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200984:	00008617          	auipc	a2,0x8
ffffffffc0200988:	dec60613          	addi	a2,a2,-532 # ffffffffc0208770 <commands+0x440>
ffffffffc020098c:	07300593          	li	a1,115
ffffffffc0200990:	00008517          	auipc	a0,0x8
ffffffffc0200994:	dc850513          	addi	a0,a0,-568 # ffffffffc0208758 <commands+0x428>
ffffffffc0200998:	871ff0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc020099c:	05700693          	li	a3,87
ffffffffc02009a0:	bfe1                	j	ffffffffc0200978 <pgfault_handler+0xf0>

ffffffffc02009a2 <interrupt_handler>:
ffffffffc02009a2:	11853783          	ld	a5,280(a0)
ffffffffc02009a6:	472d                	li	a4,11
ffffffffc02009a8:	0786                	slli	a5,a5,0x1
ffffffffc02009aa:	8385                	srli	a5,a5,0x1
ffffffffc02009ac:	06f76863          	bltu	a4,a5,ffffffffc0200a1c <interrupt_handler+0x7a>
ffffffffc02009b0:	00008717          	auipc	a4,0x8
ffffffffc02009b4:	e7870713          	addi	a4,a4,-392 # ffffffffc0208828 <commands+0x4f8>
ffffffffc02009b8:	078a                	slli	a5,a5,0x2
ffffffffc02009ba:	97ba                	add	a5,a5,a4
ffffffffc02009bc:	439c                	lw	a5,0(a5)
ffffffffc02009be:	97ba                	add	a5,a5,a4
ffffffffc02009c0:	8782                	jr	a5
ffffffffc02009c2:	00008517          	auipc	a0,0x8
ffffffffc02009c6:	e2650513          	addi	a0,a0,-474 # ffffffffc02087e8 <commands+0x4b8>
ffffffffc02009ca:	f02ff06f          	j	ffffffffc02000cc <cprintf>
ffffffffc02009ce:	00008517          	auipc	a0,0x8
ffffffffc02009d2:	dfa50513          	addi	a0,a0,-518 # ffffffffc02087c8 <commands+0x498>
ffffffffc02009d6:	ef6ff06f          	j	ffffffffc02000cc <cprintf>
ffffffffc02009da:	00008517          	auipc	a0,0x8
ffffffffc02009de:	dae50513          	addi	a0,a0,-594 # ffffffffc0208788 <commands+0x458>
ffffffffc02009e2:	eeaff06f          	j	ffffffffc02000cc <cprintf>
ffffffffc02009e6:	00008517          	auipc	a0,0x8
ffffffffc02009ea:	dc250513          	addi	a0,a0,-574 # ffffffffc02087a8 <commands+0x478>
ffffffffc02009ee:	edeff06f          	j	ffffffffc02000cc <cprintf>
ffffffffc02009f2:	1141                	addi	sp,sp,-16
ffffffffc02009f4:	e406                	sd	ra,8(sp)
ffffffffc02009f6:	bb1ff0ef          	jal	ra,ffffffffc02005a6 <clock_set_next_event>
ffffffffc02009fa:	0003f717          	auipc	a4,0x3f
ffffffffc02009fe:	51e70713          	addi	a4,a4,1310 # ffffffffc023ff18 <ticks>
ffffffffc0200a02:	631c                	ld	a5,0(a4)
ffffffffc0200a04:	60a2                	ld	ra,8(sp)
ffffffffc0200a06:	0785                	addi	a5,a5,1
ffffffffc0200a08:	e31c                	sd	a5,0(a4)
ffffffffc0200a0a:	0141                	addi	sp,sp,16
ffffffffc0200a0c:	3e20406f          	j	ffffffffc0204dee <run_timer_list>
ffffffffc0200a10:	00008517          	auipc	a0,0x8
ffffffffc0200a14:	df850513          	addi	a0,a0,-520 # ffffffffc0208808 <commands+0x4d8>
ffffffffc0200a18:	eb4ff06f          	j	ffffffffc02000cc <cprintf>
ffffffffc0200a1c:	b529                	j	ffffffffc0200826 <print_trapframe>

ffffffffc0200a1e <exception_handler>:
ffffffffc0200a1e:	11853783          	ld	a5,280(a0)
ffffffffc0200a22:	1101                	addi	sp,sp,-32
ffffffffc0200a24:	e822                	sd	s0,16(sp)
ffffffffc0200a26:	ec06                	sd	ra,24(sp)
ffffffffc0200a28:	e426                	sd	s1,8(sp)
ffffffffc0200a2a:	473d                	li	a4,15
ffffffffc0200a2c:	842a                	mv	s0,a0
ffffffffc0200a2e:	16f76163          	bltu	a4,a5,ffffffffc0200b90 <exception_handler+0x172>
ffffffffc0200a32:	00008717          	auipc	a4,0x8
ffffffffc0200a36:	fbe70713          	addi	a4,a4,-66 # ffffffffc02089f0 <commands+0x6c0>
ffffffffc0200a3a:	078a                	slli	a5,a5,0x2
ffffffffc0200a3c:	97ba                	add	a5,a5,a4
ffffffffc0200a3e:	439c                	lw	a5,0(a5)
ffffffffc0200a40:	97ba                	add	a5,a5,a4
ffffffffc0200a42:	8782                	jr	a5
ffffffffc0200a44:	00008517          	auipc	a0,0x8
ffffffffc0200a48:	f0450513          	addi	a0,a0,-252 # ffffffffc0208948 <commands+0x618>
ffffffffc0200a4c:	e80ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200a50:	10843783          	ld	a5,264(s0)
ffffffffc0200a54:	60e2                	ld	ra,24(sp)
ffffffffc0200a56:	64a2                	ld	s1,8(sp)
ffffffffc0200a58:	0791                	addi	a5,a5,4
ffffffffc0200a5a:	10f43423          	sd	a5,264(s0)
ffffffffc0200a5e:	6442                	ld	s0,16(sp)
ffffffffc0200a60:	6105                	addi	sp,sp,32
ffffffffc0200a62:	12e0706f          	j	ffffffffc0207b90 <syscall>
ffffffffc0200a66:	00008517          	auipc	a0,0x8
ffffffffc0200a6a:	f0250513          	addi	a0,a0,-254 # ffffffffc0208968 <commands+0x638>
ffffffffc0200a6e:	6442                	ld	s0,16(sp)
ffffffffc0200a70:	60e2                	ld	ra,24(sp)
ffffffffc0200a72:	64a2                	ld	s1,8(sp)
ffffffffc0200a74:	6105                	addi	sp,sp,32
ffffffffc0200a76:	e56ff06f          	j	ffffffffc02000cc <cprintf>
ffffffffc0200a7a:	00008517          	auipc	a0,0x8
ffffffffc0200a7e:	f0e50513          	addi	a0,a0,-242 # ffffffffc0208988 <commands+0x658>
ffffffffc0200a82:	b7f5                	j	ffffffffc0200a6e <exception_handler+0x50>
ffffffffc0200a84:	00008517          	auipc	a0,0x8
ffffffffc0200a88:	f2450513          	addi	a0,a0,-220 # ffffffffc02089a8 <commands+0x678>
ffffffffc0200a8c:	b7cd                	j	ffffffffc0200a6e <exception_handler+0x50>
ffffffffc0200a8e:	00008517          	auipc	a0,0x8
ffffffffc0200a92:	f3250513          	addi	a0,a0,-206 # ffffffffc02089c0 <commands+0x690>
ffffffffc0200a96:	e36ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200a9a:	8522                	mv	a0,s0
ffffffffc0200a9c:	dedff0ef          	jal	ra,ffffffffc0200888 <pgfault_handler>
ffffffffc0200aa0:	84aa                	mv	s1,a0
ffffffffc0200aa2:	10051963          	bnez	a0,ffffffffc0200bb4 <exception_handler+0x196>
ffffffffc0200aa6:	60e2                	ld	ra,24(sp)
ffffffffc0200aa8:	6442                	ld	s0,16(sp)
ffffffffc0200aaa:	64a2                	ld	s1,8(sp)
ffffffffc0200aac:	6105                	addi	sp,sp,32
ffffffffc0200aae:	8082                	ret
ffffffffc0200ab0:	00008517          	auipc	a0,0x8
ffffffffc0200ab4:	f2850513          	addi	a0,a0,-216 # ffffffffc02089d8 <commands+0x6a8>
ffffffffc0200ab8:	e14ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200abc:	8522                	mv	a0,s0
ffffffffc0200abe:	dcbff0ef          	jal	ra,ffffffffc0200888 <pgfault_handler>
ffffffffc0200ac2:	84aa                	mv	s1,a0
ffffffffc0200ac4:	d16d                	beqz	a0,ffffffffc0200aa6 <exception_handler+0x88>
ffffffffc0200ac6:	8522                	mv	a0,s0
ffffffffc0200ac8:	d5fff0ef          	jal	ra,ffffffffc0200826 <print_trapframe>
ffffffffc0200acc:	86a6                	mv	a3,s1
ffffffffc0200ace:	00008617          	auipc	a2,0x8
ffffffffc0200ad2:	e2a60613          	addi	a2,a2,-470 # ffffffffc02088f8 <commands+0x5c8>
ffffffffc0200ad6:	0f600593          	li	a1,246
ffffffffc0200ada:	00008517          	auipc	a0,0x8
ffffffffc0200ade:	c7e50513          	addi	a0,a0,-898 # ffffffffc0208758 <commands+0x428>
ffffffffc0200ae2:	f26ff0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0200ae6:	00008517          	auipc	a0,0x8
ffffffffc0200aea:	d7250513          	addi	a0,a0,-654 # ffffffffc0208858 <commands+0x528>
ffffffffc0200aee:	b741                	j	ffffffffc0200a6e <exception_handler+0x50>
ffffffffc0200af0:	00008517          	auipc	a0,0x8
ffffffffc0200af4:	d8850513          	addi	a0,a0,-632 # ffffffffc0208878 <commands+0x548>
ffffffffc0200af8:	bf9d                	j	ffffffffc0200a6e <exception_handler+0x50>
ffffffffc0200afa:	00008517          	auipc	a0,0x8
ffffffffc0200afe:	d9e50513          	addi	a0,a0,-610 # ffffffffc0208898 <commands+0x568>
ffffffffc0200b02:	b7b5                	j	ffffffffc0200a6e <exception_handler+0x50>
ffffffffc0200b04:	00008517          	auipc	a0,0x8
ffffffffc0200b08:	dac50513          	addi	a0,a0,-596 # ffffffffc02088b0 <commands+0x580>
ffffffffc0200b0c:	dc0ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200b10:	6458                	ld	a4,136(s0)
ffffffffc0200b12:	47a9                	li	a5,10
ffffffffc0200b14:	f8f719e3          	bne	a4,a5,ffffffffc0200aa6 <exception_handler+0x88>
ffffffffc0200b18:	bf25                	j	ffffffffc0200a50 <exception_handler+0x32>
ffffffffc0200b1a:	00008517          	auipc	a0,0x8
ffffffffc0200b1e:	da650513          	addi	a0,a0,-602 # ffffffffc02088c0 <commands+0x590>
ffffffffc0200b22:	b7b1                	j	ffffffffc0200a6e <exception_handler+0x50>
ffffffffc0200b24:	00008517          	auipc	a0,0x8
ffffffffc0200b28:	dbc50513          	addi	a0,a0,-580 # ffffffffc02088e0 <commands+0x5b0>
ffffffffc0200b2c:	da0ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200b30:	8522                	mv	a0,s0
ffffffffc0200b32:	d57ff0ef          	jal	ra,ffffffffc0200888 <pgfault_handler>
ffffffffc0200b36:	84aa                	mv	s1,a0
ffffffffc0200b38:	d53d                	beqz	a0,ffffffffc0200aa6 <exception_handler+0x88>
ffffffffc0200b3a:	8522                	mv	a0,s0
ffffffffc0200b3c:	cebff0ef          	jal	ra,ffffffffc0200826 <print_trapframe>
ffffffffc0200b40:	86a6                	mv	a3,s1
ffffffffc0200b42:	00008617          	auipc	a2,0x8
ffffffffc0200b46:	db660613          	addi	a2,a2,-586 # ffffffffc02088f8 <commands+0x5c8>
ffffffffc0200b4a:	0cb00593          	li	a1,203
ffffffffc0200b4e:	00008517          	auipc	a0,0x8
ffffffffc0200b52:	c0a50513          	addi	a0,a0,-1014 # ffffffffc0208758 <commands+0x428>
ffffffffc0200b56:	eb2ff0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0200b5a:	00008517          	auipc	a0,0x8
ffffffffc0200b5e:	dd650513          	addi	a0,a0,-554 # ffffffffc0208930 <commands+0x600>
ffffffffc0200b62:	d6aff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200b66:	8522                	mv	a0,s0
ffffffffc0200b68:	d21ff0ef          	jal	ra,ffffffffc0200888 <pgfault_handler>
ffffffffc0200b6c:	84aa                	mv	s1,a0
ffffffffc0200b6e:	dd05                	beqz	a0,ffffffffc0200aa6 <exception_handler+0x88>
ffffffffc0200b70:	8522                	mv	a0,s0
ffffffffc0200b72:	cb5ff0ef          	jal	ra,ffffffffc0200826 <print_trapframe>
ffffffffc0200b76:	86a6                	mv	a3,s1
ffffffffc0200b78:	00008617          	auipc	a2,0x8
ffffffffc0200b7c:	d8060613          	addi	a2,a2,-640 # ffffffffc02088f8 <commands+0x5c8>
ffffffffc0200b80:	0d500593          	li	a1,213
ffffffffc0200b84:	00008517          	auipc	a0,0x8
ffffffffc0200b88:	bd450513          	addi	a0,a0,-1068 # ffffffffc0208758 <commands+0x428>
ffffffffc0200b8c:	e7cff0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0200b90:	8522                	mv	a0,s0
ffffffffc0200b92:	6442                	ld	s0,16(sp)
ffffffffc0200b94:	60e2                	ld	ra,24(sp)
ffffffffc0200b96:	64a2                	ld	s1,8(sp)
ffffffffc0200b98:	6105                	addi	sp,sp,32
ffffffffc0200b9a:	b171                	j	ffffffffc0200826 <print_trapframe>
ffffffffc0200b9c:	00008617          	auipc	a2,0x8
ffffffffc0200ba0:	d7c60613          	addi	a2,a2,-644 # ffffffffc0208918 <commands+0x5e8>
ffffffffc0200ba4:	0cf00593          	li	a1,207
ffffffffc0200ba8:	00008517          	auipc	a0,0x8
ffffffffc0200bac:	bb050513          	addi	a0,a0,-1104 # ffffffffc0208758 <commands+0x428>
ffffffffc0200bb0:	e58ff0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0200bb4:	8522                	mv	a0,s0
ffffffffc0200bb6:	c71ff0ef          	jal	ra,ffffffffc0200826 <print_trapframe>
ffffffffc0200bba:	86a6                	mv	a3,s1
ffffffffc0200bbc:	00008617          	auipc	a2,0x8
ffffffffc0200bc0:	d3c60613          	addi	a2,a2,-708 # ffffffffc02088f8 <commands+0x5c8>
ffffffffc0200bc4:	0ef00593          	li	a1,239
ffffffffc0200bc8:	00008517          	auipc	a0,0x8
ffffffffc0200bcc:	b9050513          	addi	a0,a0,-1136 # ffffffffc0208758 <commands+0x428>
ffffffffc0200bd0:	e38ff0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0200bd4 <trap>:
ffffffffc0200bd4:	1101                	addi	sp,sp,-32
ffffffffc0200bd6:	e822                	sd	s0,16(sp)
ffffffffc0200bd8:	0003f417          	auipc	s0,0x3f
ffffffffc0200bdc:	31040413          	addi	s0,s0,784 # ffffffffc023fee8 <current>
ffffffffc0200be0:	6018                	ld	a4,0(s0)
ffffffffc0200be2:	ec06                	sd	ra,24(sp)
ffffffffc0200be4:	e426                	sd	s1,8(sp)
ffffffffc0200be6:	e04a                	sd	s2,0(sp)
ffffffffc0200be8:	11853683          	ld	a3,280(a0)
ffffffffc0200bec:	cf1d                	beqz	a4,ffffffffc0200c2a <trap+0x56>
ffffffffc0200bee:	10053483          	ld	s1,256(a0)
ffffffffc0200bf2:	0a073903          	ld	s2,160(a4)
ffffffffc0200bf6:	f348                	sd	a0,160(a4)
ffffffffc0200bf8:	1004f493          	andi	s1,s1,256
ffffffffc0200bfc:	0206c463          	bltz	a3,ffffffffc0200c24 <trap+0x50>
ffffffffc0200c00:	e1fff0ef          	jal	ra,ffffffffc0200a1e <exception_handler>
ffffffffc0200c04:	601c                	ld	a5,0(s0)
ffffffffc0200c06:	0b27b023          	sd	s2,160(a5)
ffffffffc0200c0a:	e499                	bnez	s1,ffffffffc0200c18 <trap+0x44>
ffffffffc0200c0c:	0b07a703          	lw	a4,176(a5)
ffffffffc0200c10:	8b05                	andi	a4,a4,1
ffffffffc0200c12:	e329                	bnez	a4,ffffffffc0200c54 <trap+0x80>
ffffffffc0200c14:	6f9c                	ld	a5,24(a5)
ffffffffc0200c16:	eb85                	bnez	a5,ffffffffc0200c46 <trap+0x72>
ffffffffc0200c18:	60e2                	ld	ra,24(sp)
ffffffffc0200c1a:	6442                	ld	s0,16(sp)
ffffffffc0200c1c:	64a2                	ld	s1,8(sp)
ffffffffc0200c1e:	6902                	ld	s2,0(sp)
ffffffffc0200c20:	6105                	addi	sp,sp,32
ffffffffc0200c22:	8082                	ret
ffffffffc0200c24:	d7fff0ef          	jal	ra,ffffffffc02009a2 <interrupt_handler>
ffffffffc0200c28:	bff1                	j	ffffffffc0200c04 <trap+0x30>
ffffffffc0200c2a:	0006c863          	bltz	a3,ffffffffc0200c3a <trap+0x66>
ffffffffc0200c2e:	6442                	ld	s0,16(sp)
ffffffffc0200c30:	60e2                	ld	ra,24(sp)
ffffffffc0200c32:	64a2                	ld	s1,8(sp)
ffffffffc0200c34:	6902                	ld	s2,0(sp)
ffffffffc0200c36:	6105                	addi	sp,sp,32
ffffffffc0200c38:	b3dd                	j	ffffffffc0200a1e <exception_handler>
ffffffffc0200c3a:	6442                	ld	s0,16(sp)
ffffffffc0200c3c:	60e2                	ld	ra,24(sp)
ffffffffc0200c3e:	64a2                	ld	s1,8(sp)
ffffffffc0200c40:	6902                	ld	s2,0(sp)
ffffffffc0200c42:	6105                	addi	sp,sp,32
ffffffffc0200c44:	bbb9                	j	ffffffffc02009a2 <interrupt_handler>
ffffffffc0200c46:	6442                	ld	s0,16(sp)
ffffffffc0200c48:	60e2                	ld	ra,24(sp)
ffffffffc0200c4a:	64a2                	ld	s1,8(sp)
ffffffffc0200c4c:	6902                	ld	s2,0(sp)
ffffffffc0200c4e:	6105                	addi	sp,sp,32
ffffffffc0200c50:	78d0306f          	j	ffffffffc0204bdc <schedule>
ffffffffc0200c54:	555d                	li	a0,-9
ffffffffc0200c56:	20c030ef          	jal	ra,ffffffffc0203e62 <do_exit>
ffffffffc0200c5a:	601c                	ld	a5,0(s0)
ffffffffc0200c5c:	bf65                	j	ffffffffc0200c14 <trap+0x40>
	...

ffffffffc0200c60 <__alltraps>:
ffffffffc0200c60:	14011173          	csrrw	sp,sscratch,sp
ffffffffc0200c64:	00011463          	bnez	sp,ffffffffc0200c6c <__alltraps+0xc>
ffffffffc0200c68:	14002173          	csrr	sp,sscratch
ffffffffc0200c6c:	712d                	addi	sp,sp,-288
ffffffffc0200c6e:	e002                	sd	zero,0(sp)
ffffffffc0200c70:	e406                	sd	ra,8(sp)
ffffffffc0200c72:	ec0e                	sd	gp,24(sp)
ffffffffc0200c74:	f012                	sd	tp,32(sp)
ffffffffc0200c76:	f416                	sd	t0,40(sp)
ffffffffc0200c78:	f81a                	sd	t1,48(sp)
ffffffffc0200c7a:	fc1e                	sd	t2,56(sp)
ffffffffc0200c7c:	e0a2                	sd	s0,64(sp)
ffffffffc0200c7e:	e4a6                	sd	s1,72(sp)
ffffffffc0200c80:	e8aa                	sd	a0,80(sp)
ffffffffc0200c82:	ecae                	sd	a1,88(sp)
ffffffffc0200c84:	f0b2                	sd	a2,96(sp)
ffffffffc0200c86:	f4b6                	sd	a3,104(sp)
ffffffffc0200c88:	f8ba                	sd	a4,112(sp)
ffffffffc0200c8a:	fcbe                	sd	a5,120(sp)
ffffffffc0200c8c:	e142                	sd	a6,128(sp)
ffffffffc0200c8e:	e546                	sd	a7,136(sp)
ffffffffc0200c90:	e94a                	sd	s2,144(sp)
ffffffffc0200c92:	ed4e                	sd	s3,152(sp)
ffffffffc0200c94:	f152                	sd	s4,160(sp)
ffffffffc0200c96:	f556                	sd	s5,168(sp)
ffffffffc0200c98:	f95a                	sd	s6,176(sp)
ffffffffc0200c9a:	fd5e                	sd	s7,184(sp)
ffffffffc0200c9c:	e1e2                	sd	s8,192(sp)
ffffffffc0200c9e:	e5e6                	sd	s9,200(sp)
ffffffffc0200ca0:	e9ea                	sd	s10,208(sp)
ffffffffc0200ca2:	edee                	sd	s11,216(sp)
ffffffffc0200ca4:	f1f2                	sd	t3,224(sp)
ffffffffc0200ca6:	f5f6                	sd	t4,232(sp)
ffffffffc0200ca8:	f9fa                	sd	t5,240(sp)
ffffffffc0200caa:	fdfe                	sd	t6,248(sp)
ffffffffc0200cac:	14001473          	csrrw	s0,sscratch,zero
ffffffffc0200cb0:	100024f3          	csrr	s1,sstatus
ffffffffc0200cb4:	14102973          	csrr	s2,sepc
ffffffffc0200cb8:	143029f3          	csrr	s3,stval
ffffffffc0200cbc:	14202a73          	csrr	s4,scause
ffffffffc0200cc0:	e822                	sd	s0,16(sp)
ffffffffc0200cc2:	e226                	sd	s1,256(sp)
ffffffffc0200cc4:	e64a                	sd	s2,264(sp)
ffffffffc0200cc6:	ea4e                	sd	s3,272(sp)
ffffffffc0200cc8:	ee52                	sd	s4,280(sp)
ffffffffc0200cca:	850a                	mv	a0,sp
ffffffffc0200ccc:	f09ff0ef          	jal	ra,ffffffffc0200bd4 <trap>

ffffffffc0200cd0 <__trapret>:
ffffffffc0200cd0:	6492                	ld	s1,256(sp)
ffffffffc0200cd2:	6932                	ld	s2,264(sp)
ffffffffc0200cd4:	1004f413          	andi	s0,s1,256
ffffffffc0200cd8:	e401                	bnez	s0,ffffffffc0200ce0 <__trapret+0x10>
ffffffffc0200cda:	1200                	addi	s0,sp,288
ffffffffc0200cdc:	14041073          	csrw	sscratch,s0
ffffffffc0200ce0:	10049073          	csrw	sstatus,s1
ffffffffc0200ce4:	14191073          	csrw	sepc,s2
ffffffffc0200ce8:	60a2                	ld	ra,8(sp)
ffffffffc0200cea:	61e2                	ld	gp,24(sp)
ffffffffc0200cec:	7202                	ld	tp,32(sp)
ffffffffc0200cee:	72a2                	ld	t0,40(sp)
ffffffffc0200cf0:	7342                	ld	t1,48(sp)
ffffffffc0200cf2:	73e2                	ld	t2,56(sp)
ffffffffc0200cf4:	6406                	ld	s0,64(sp)
ffffffffc0200cf6:	64a6                	ld	s1,72(sp)
ffffffffc0200cf8:	6546                	ld	a0,80(sp)
ffffffffc0200cfa:	65e6                	ld	a1,88(sp)
ffffffffc0200cfc:	7606                	ld	a2,96(sp)
ffffffffc0200cfe:	76a6                	ld	a3,104(sp)
ffffffffc0200d00:	7746                	ld	a4,112(sp)
ffffffffc0200d02:	77e6                	ld	a5,120(sp)
ffffffffc0200d04:	680a                	ld	a6,128(sp)
ffffffffc0200d06:	68aa                	ld	a7,136(sp)
ffffffffc0200d08:	694a                	ld	s2,144(sp)
ffffffffc0200d0a:	69ea                	ld	s3,152(sp)
ffffffffc0200d0c:	7a0a                	ld	s4,160(sp)
ffffffffc0200d0e:	7aaa                	ld	s5,168(sp)
ffffffffc0200d10:	7b4a                	ld	s6,176(sp)
ffffffffc0200d12:	7bea                	ld	s7,184(sp)
ffffffffc0200d14:	6c0e                	ld	s8,192(sp)
ffffffffc0200d16:	6cae                	ld	s9,200(sp)
ffffffffc0200d18:	6d4e                	ld	s10,208(sp)
ffffffffc0200d1a:	6dee                	ld	s11,216(sp)
ffffffffc0200d1c:	7e0e                	ld	t3,224(sp)
ffffffffc0200d1e:	7eae                	ld	t4,232(sp)
ffffffffc0200d20:	7f4e                	ld	t5,240(sp)
ffffffffc0200d22:	7fee                	ld	t6,248(sp)
ffffffffc0200d24:	6142                	ld	sp,16(sp)
ffffffffc0200d26:	10200073          	sret

ffffffffc0200d2a <forkrets>:
ffffffffc0200d2a:	812a                	mv	sp,a0
ffffffffc0200d2c:	b755                	j	ffffffffc0200cd0 <__trapret>

ffffffffc0200d2e <pa2page.part.0>:
ffffffffc0200d2e:	1141                	addi	sp,sp,-16
ffffffffc0200d30:	00008617          	auipc	a2,0x8
ffffffffc0200d34:	d0060613          	addi	a2,a2,-768 # ffffffffc0208a30 <commands+0x700>
ffffffffc0200d38:	06200593          	li	a1,98
ffffffffc0200d3c:	00008517          	auipc	a0,0x8
ffffffffc0200d40:	d1450513          	addi	a0,a0,-748 # ffffffffc0208a50 <commands+0x720>
ffffffffc0200d44:	e406                	sd	ra,8(sp)
ffffffffc0200d46:	cc2ff0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0200d4a <alloc_pages>:
ffffffffc0200d4a:	7139                	addi	sp,sp,-64
ffffffffc0200d4c:	f426                	sd	s1,40(sp)
ffffffffc0200d4e:	f04a                	sd	s2,32(sp)
ffffffffc0200d50:	ec4e                	sd	s3,24(sp)
ffffffffc0200d52:	e852                	sd	s4,16(sp)
ffffffffc0200d54:	e456                	sd	s5,8(sp)
ffffffffc0200d56:	e05a                	sd	s6,0(sp)
ffffffffc0200d58:	fc06                	sd	ra,56(sp)
ffffffffc0200d5a:	f822                	sd	s0,48(sp)
ffffffffc0200d5c:	84aa                	mv	s1,a0
ffffffffc0200d5e:	0003f917          	auipc	s2,0x3f
ffffffffc0200d62:	1c290913          	addi	s2,s2,450 # ffffffffc023ff20 <pmm_manager>
ffffffffc0200d66:	4a05                	li	s4,1
ffffffffc0200d68:	0003fa97          	auipc	s5,0x3f
ffffffffc0200d6c:	170a8a93          	addi	s5,s5,368 # ffffffffc023fed8 <swap_init_ok>
ffffffffc0200d70:	0005099b          	sext.w	s3,a0
ffffffffc0200d74:	0003fb17          	auipc	s6,0x3f
ffffffffc0200d78:	1ccb0b13          	addi	s6,s6,460 # ffffffffc023ff40 <check_mm_struct>
ffffffffc0200d7c:	a01d                	j	ffffffffc0200da2 <alloc_pages+0x58>
ffffffffc0200d7e:	00093783          	ld	a5,0(s2)
ffffffffc0200d82:	6f9c                	ld	a5,24(a5)
ffffffffc0200d84:	9782                	jalr	a5
ffffffffc0200d86:	842a                	mv	s0,a0
ffffffffc0200d88:	4601                	li	a2,0
ffffffffc0200d8a:	85ce                	mv	a1,s3
ffffffffc0200d8c:	ec0d                	bnez	s0,ffffffffc0200dc6 <alloc_pages+0x7c>
ffffffffc0200d8e:	029a6c63          	bltu	s4,s1,ffffffffc0200dc6 <alloc_pages+0x7c>
ffffffffc0200d92:	000aa783          	lw	a5,0(s5)
ffffffffc0200d96:	2781                	sext.w	a5,a5
ffffffffc0200d98:	c79d                	beqz	a5,ffffffffc0200dc6 <alloc_pages+0x7c>
ffffffffc0200d9a:	000b3503          	ld	a0,0(s6)
ffffffffc0200d9e:	745000ef          	jal	ra,ffffffffc0201ce2 <swap_out>
ffffffffc0200da2:	100027f3          	csrr	a5,sstatus
ffffffffc0200da6:	8b89                	andi	a5,a5,2
ffffffffc0200da8:	8526                	mv	a0,s1
ffffffffc0200daa:	dbf1                	beqz	a5,ffffffffc0200d7e <alloc_pages+0x34>
ffffffffc0200dac:	88dff0ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc0200db0:	00093783          	ld	a5,0(s2)
ffffffffc0200db4:	8526                	mv	a0,s1
ffffffffc0200db6:	6f9c                	ld	a5,24(a5)
ffffffffc0200db8:	9782                	jalr	a5
ffffffffc0200dba:	842a                	mv	s0,a0
ffffffffc0200dbc:	877ff0ef          	jal	ra,ffffffffc0200632 <intr_enable>
ffffffffc0200dc0:	4601                	li	a2,0
ffffffffc0200dc2:	85ce                	mv	a1,s3
ffffffffc0200dc4:	d469                	beqz	s0,ffffffffc0200d8e <alloc_pages+0x44>
ffffffffc0200dc6:	70e2                	ld	ra,56(sp)
ffffffffc0200dc8:	8522                	mv	a0,s0
ffffffffc0200dca:	7442                	ld	s0,48(sp)
ffffffffc0200dcc:	74a2                	ld	s1,40(sp)
ffffffffc0200dce:	7902                	ld	s2,32(sp)
ffffffffc0200dd0:	69e2                	ld	s3,24(sp)
ffffffffc0200dd2:	6a42                	ld	s4,16(sp)
ffffffffc0200dd4:	6aa2                	ld	s5,8(sp)
ffffffffc0200dd6:	6b02                	ld	s6,0(sp)
ffffffffc0200dd8:	6121                	addi	sp,sp,64
ffffffffc0200dda:	8082                	ret

ffffffffc0200ddc <free_pages>:
ffffffffc0200ddc:	100027f3          	csrr	a5,sstatus
ffffffffc0200de0:	8b89                	andi	a5,a5,2
ffffffffc0200de2:	eb81                	bnez	a5,ffffffffc0200df2 <free_pages+0x16>
ffffffffc0200de4:	0003f797          	auipc	a5,0x3f
ffffffffc0200de8:	13c7b783          	ld	a5,316(a5) # ffffffffc023ff20 <pmm_manager>
ffffffffc0200dec:	0207b303          	ld	t1,32(a5)
ffffffffc0200df0:	8302                	jr	t1
ffffffffc0200df2:	1101                	addi	sp,sp,-32
ffffffffc0200df4:	ec06                	sd	ra,24(sp)
ffffffffc0200df6:	e822                	sd	s0,16(sp)
ffffffffc0200df8:	e426                	sd	s1,8(sp)
ffffffffc0200dfa:	842a                	mv	s0,a0
ffffffffc0200dfc:	84ae                	mv	s1,a1
ffffffffc0200dfe:	83bff0ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc0200e02:	0003f797          	auipc	a5,0x3f
ffffffffc0200e06:	11e7b783          	ld	a5,286(a5) # ffffffffc023ff20 <pmm_manager>
ffffffffc0200e0a:	739c                	ld	a5,32(a5)
ffffffffc0200e0c:	85a6                	mv	a1,s1
ffffffffc0200e0e:	8522                	mv	a0,s0
ffffffffc0200e10:	9782                	jalr	a5
ffffffffc0200e12:	6442                	ld	s0,16(sp)
ffffffffc0200e14:	60e2                	ld	ra,24(sp)
ffffffffc0200e16:	64a2                	ld	s1,8(sp)
ffffffffc0200e18:	6105                	addi	sp,sp,32
ffffffffc0200e1a:	819ff06f          	j	ffffffffc0200632 <intr_enable>

ffffffffc0200e1e <nr_free_pages>:
ffffffffc0200e1e:	100027f3          	csrr	a5,sstatus
ffffffffc0200e22:	8b89                	andi	a5,a5,2
ffffffffc0200e24:	eb81                	bnez	a5,ffffffffc0200e34 <nr_free_pages+0x16>
ffffffffc0200e26:	0003f797          	auipc	a5,0x3f
ffffffffc0200e2a:	0fa7b783          	ld	a5,250(a5) # ffffffffc023ff20 <pmm_manager>
ffffffffc0200e2e:	0287b303          	ld	t1,40(a5)
ffffffffc0200e32:	8302                	jr	t1
ffffffffc0200e34:	1141                	addi	sp,sp,-16
ffffffffc0200e36:	e406                	sd	ra,8(sp)
ffffffffc0200e38:	e022                	sd	s0,0(sp)
ffffffffc0200e3a:	ffeff0ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc0200e3e:	0003f797          	auipc	a5,0x3f
ffffffffc0200e42:	0e27b783          	ld	a5,226(a5) # ffffffffc023ff20 <pmm_manager>
ffffffffc0200e46:	779c                	ld	a5,40(a5)
ffffffffc0200e48:	9782                	jalr	a5
ffffffffc0200e4a:	842a                	mv	s0,a0
ffffffffc0200e4c:	fe6ff0ef          	jal	ra,ffffffffc0200632 <intr_enable>
ffffffffc0200e50:	60a2                	ld	ra,8(sp)
ffffffffc0200e52:	8522                	mv	a0,s0
ffffffffc0200e54:	6402                	ld	s0,0(sp)
ffffffffc0200e56:	0141                	addi	sp,sp,16
ffffffffc0200e58:	8082                	ret

ffffffffc0200e5a <pmm_init>:
ffffffffc0200e5a:	00008797          	auipc	a5,0x8
ffffffffc0200e5e:	62678793          	addi	a5,a5,1574 # ffffffffc0209480 <default_pmm_manager>
ffffffffc0200e62:	638c                	ld	a1,0(a5)
ffffffffc0200e64:	1101                	addi	sp,sp,-32
ffffffffc0200e66:	e426                	sd	s1,8(sp)
ffffffffc0200e68:	00008517          	auipc	a0,0x8
ffffffffc0200e6c:	bf850513          	addi	a0,a0,-1032 # ffffffffc0208a60 <commands+0x730>
ffffffffc0200e70:	0003f497          	auipc	s1,0x3f
ffffffffc0200e74:	0b048493          	addi	s1,s1,176 # ffffffffc023ff20 <pmm_manager>
ffffffffc0200e78:	ec06                	sd	ra,24(sp)
ffffffffc0200e7a:	e822                	sd	s0,16(sp)
ffffffffc0200e7c:	e09c                	sd	a5,0(s1)
ffffffffc0200e7e:	a4eff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200e82:	609c                	ld	a5,0(s1)
ffffffffc0200e84:	0003f417          	auipc	s0,0x3f
ffffffffc0200e88:	0a440413          	addi	s0,s0,164 # ffffffffc023ff28 <va_pa_offset>
ffffffffc0200e8c:	679c                	ld	a5,8(a5)
ffffffffc0200e8e:	9782                	jalr	a5
ffffffffc0200e90:	57f5                	li	a5,-3
ffffffffc0200e92:	07fa                	slli	a5,a5,0x1e
ffffffffc0200e94:	00008517          	auipc	a0,0x8
ffffffffc0200e98:	be450513          	addi	a0,a0,-1052 # ffffffffc0208a78 <commands+0x748>
ffffffffc0200e9c:	e01c                	sd	a5,0(s0)
ffffffffc0200e9e:	a2eff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200ea2:	44300693          	li	a3,1091
ffffffffc0200ea6:	06d6                	slli	a3,a3,0x15
ffffffffc0200ea8:	40100613          	li	a2,1025
ffffffffc0200eac:	0656                	slli	a2,a2,0x15
ffffffffc0200eae:	088005b7          	lui	a1,0x8800
ffffffffc0200eb2:	16fd                	addi	a3,a3,-1
ffffffffc0200eb4:	00008517          	auipc	a0,0x8
ffffffffc0200eb8:	bdc50513          	addi	a0,a0,-1060 # ffffffffc0208a90 <commands+0x760>
ffffffffc0200ebc:	a10ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200ec0:	777d                	lui	a4,0xfffff
ffffffffc0200ec2:	00040797          	auipc	a5,0x40
ffffffffc0200ec6:	1dd78793          	addi	a5,a5,477 # ffffffffc024109f <end+0xfff>
ffffffffc0200eca:	8ff9                	and	a5,a5,a4
ffffffffc0200ecc:	00088737          	lui	a4,0x88
ffffffffc0200ed0:	60070713          	addi	a4,a4,1536 # 88600 <_binary_obj___user_matrix_out_size+0x85c60>
ffffffffc0200ed4:	0003f597          	auipc	a1,0x3f
ffffffffc0200ed8:	fec58593          	addi	a1,a1,-20 # ffffffffc023fec0 <npage>
ffffffffc0200edc:	0003f617          	auipc	a2,0x3f
ffffffffc0200ee0:	05c60613          	addi	a2,a2,92 # ffffffffc023ff38 <pages>
ffffffffc0200ee4:	e198                	sd	a4,0(a1)
ffffffffc0200ee6:	e21c                	sd	a5,0(a2)
ffffffffc0200ee8:	4701                	li	a4,0
ffffffffc0200eea:	4505                	li	a0,1
ffffffffc0200eec:	fff80837          	lui	a6,0xfff80
ffffffffc0200ef0:	a011                	j	ffffffffc0200ef4 <pmm_init+0x9a>
ffffffffc0200ef2:	621c                	ld	a5,0(a2)
ffffffffc0200ef4:	00671693          	slli	a3,a4,0x6
ffffffffc0200ef8:	97b6                	add	a5,a5,a3
ffffffffc0200efa:	07a1                	addi	a5,a5,8
ffffffffc0200efc:	40a7b02f          	amoor.d	zero,a0,(a5)
ffffffffc0200f00:	0005b883          	ld	a7,0(a1)
ffffffffc0200f04:	0705                	addi	a4,a4,1
ffffffffc0200f06:	010886b3          	add	a3,a7,a6
ffffffffc0200f0a:	fed764e3          	bltu	a4,a3,ffffffffc0200ef2 <pmm_init+0x98>
ffffffffc0200f0e:	6208                	ld	a0,0(a2)
ffffffffc0200f10:	069a                	slli	a3,a3,0x6
ffffffffc0200f12:	c02007b7          	lui	a5,0xc0200
ffffffffc0200f16:	96aa                	add	a3,a3,a0
ffffffffc0200f18:	06f6e163          	bltu	a3,a5,ffffffffc0200f7a <pmm_init+0x120>
ffffffffc0200f1c:	601c                	ld	a5,0(s0)
ffffffffc0200f1e:	44300593          	li	a1,1091
ffffffffc0200f22:	05d6                	slli	a1,a1,0x15
ffffffffc0200f24:	8e9d                	sub	a3,a3,a5
ffffffffc0200f26:	02b6f363          	bgeu	a3,a1,ffffffffc0200f4c <pmm_init+0xf2>
ffffffffc0200f2a:	6785                	lui	a5,0x1
ffffffffc0200f2c:	17fd                	addi	a5,a5,-1
ffffffffc0200f2e:	96be                	add	a3,a3,a5
ffffffffc0200f30:	00c6d793          	srli	a5,a3,0xc
ffffffffc0200f34:	0717fb63          	bgeu	a5,a7,ffffffffc0200faa <pmm_init+0x150>
ffffffffc0200f38:	6098                	ld	a4,0(s1)
ffffffffc0200f3a:	767d                	lui	a2,0xfffff
ffffffffc0200f3c:	8ef1                	and	a3,a3,a2
ffffffffc0200f3e:	97c2                	add	a5,a5,a6
ffffffffc0200f40:	6b18                	ld	a4,16(a4)
ffffffffc0200f42:	8d95                	sub	a1,a1,a3
ffffffffc0200f44:	079a                	slli	a5,a5,0x6
ffffffffc0200f46:	81b1                	srli	a1,a1,0xc
ffffffffc0200f48:	953e                	add	a0,a0,a5
ffffffffc0200f4a:	9702                	jalr	a4
ffffffffc0200f4c:	0000c697          	auipc	a3,0xc
ffffffffc0200f50:	0b468693          	addi	a3,a3,180 # ffffffffc020d000 <boot_page_table_sv39>
ffffffffc0200f54:	0003f797          	auipc	a5,0x3f
ffffffffc0200f58:	f6d7b223          	sd	a3,-156(a5) # ffffffffc023feb8 <boot_pgdir>
ffffffffc0200f5c:	c02007b7          	lui	a5,0xc0200
ffffffffc0200f60:	02f6e963          	bltu	a3,a5,ffffffffc0200f92 <pmm_init+0x138>
ffffffffc0200f64:	601c                	ld	a5,0(s0)
ffffffffc0200f66:	60e2                	ld	ra,24(sp)
ffffffffc0200f68:	6442                	ld	s0,16(sp)
ffffffffc0200f6a:	8e9d                	sub	a3,a3,a5
ffffffffc0200f6c:	0003f797          	auipc	a5,0x3f
ffffffffc0200f70:	fcd7b223          	sd	a3,-60(a5) # ffffffffc023ff30 <boot_cr3>
ffffffffc0200f74:	64a2                	ld	s1,8(sp)
ffffffffc0200f76:	6105                	addi	sp,sp,32
ffffffffc0200f78:	8082                	ret
ffffffffc0200f7a:	00008617          	auipc	a2,0x8
ffffffffc0200f7e:	b3e60613          	addi	a2,a2,-1218 # ffffffffc0208ab8 <commands+0x788>
ffffffffc0200f82:	07f00593          	li	a1,127
ffffffffc0200f86:	00008517          	auipc	a0,0x8
ffffffffc0200f8a:	b5a50513          	addi	a0,a0,-1190 # ffffffffc0208ae0 <commands+0x7b0>
ffffffffc0200f8e:	a7aff0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0200f92:	00008617          	auipc	a2,0x8
ffffffffc0200f96:	b2660613          	addi	a2,a2,-1242 # ffffffffc0208ab8 <commands+0x788>
ffffffffc0200f9a:	0c100593          	li	a1,193
ffffffffc0200f9e:	00008517          	auipc	a0,0x8
ffffffffc0200fa2:	b4250513          	addi	a0,a0,-1214 # ffffffffc0208ae0 <commands+0x7b0>
ffffffffc0200fa6:	a62ff0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0200faa:	d85ff0ef          	jal	ra,ffffffffc0200d2e <pa2page.part.0>

ffffffffc0200fae <get_pte>:
ffffffffc0200fae:	01e5d793          	srli	a5,a1,0x1e
ffffffffc0200fb2:	1ff7f793          	andi	a5,a5,511
ffffffffc0200fb6:	7139                	addi	sp,sp,-64
ffffffffc0200fb8:	078e                	slli	a5,a5,0x3
ffffffffc0200fba:	f426                	sd	s1,40(sp)
ffffffffc0200fbc:	00f504b3          	add	s1,a0,a5
ffffffffc0200fc0:	6094                	ld	a3,0(s1)
ffffffffc0200fc2:	f04a                	sd	s2,32(sp)
ffffffffc0200fc4:	ec4e                	sd	s3,24(sp)
ffffffffc0200fc6:	e852                	sd	s4,16(sp)
ffffffffc0200fc8:	fc06                	sd	ra,56(sp)
ffffffffc0200fca:	f822                	sd	s0,48(sp)
ffffffffc0200fcc:	e456                	sd	s5,8(sp)
ffffffffc0200fce:	e05a                	sd	s6,0(sp)
ffffffffc0200fd0:	0016f793          	andi	a5,a3,1
ffffffffc0200fd4:	892e                	mv	s2,a1
ffffffffc0200fd6:	89b2                	mv	s3,a2
ffffffffc0200fd8:	0003fa17          	auipc	s4,0x3f
ffffffffc0200fdc:	ee8a0a13          	addi	s4,s4,-280 # ffffffffc023fec0 <npage>
ffffffffc0200fe0:	e7b5                	bnez	a5,ffffffffc020104c <get_pte+0x9e>
ffffffffc0200fe2:	12060b63          	beqz	a2,ffffffffc0201118 <get_pte+0x16a>
ffffffffc0200fe6:	4505                	li	a0,1
ffffffffc0200fe8:	d63ff0ef          	jal	ra,ffffffffc0200d4a <alloc_pages>
ffffffffc0200fec:	842a                	mv	s0,a0
ffffffffc0200fee:	12050563          	beqz	a0,ffffffffc0201118 <get_pte+0x16a>
ffffffffc0200ff2:	0003fb17          	auipc	s6,0x3f
ffffffffc0200ff6:	f46b0b13          	addi	s6,s6,-186 # ffffffffc023ff38 <pages>
ffffffffc0200ffa:	000b3503          	ld	a0,0(s6)
ffffffffc0200ffe:	00080ab7          	lui	s5,0x80
ffffffffc0201002:	0003fa17          	auipc	s4,0x3f
ffffffffc0201006:	ebea0a13          	addi	s4,s4,-322 # ffffffffc023fec0 <npage>
ffffffffc020100a:	40a40533          	sub	a0,s0,a0
ffffffffc020100e:	8519                	srai	a0,a0,0x6
ffffffffc0201010:	9556                	add	a0,a0,s5
ffffffffc0201012:	000a3703          	ld	a4,0(s4)
ffffffffc0201016:	00c51793          	slli	a5,a0,0xc
ffffffffc020101a:	4685                	li	a3,1
ffffffffc020101c:	c014                	sw	a3,0(s0)
ffffffffc020101e:	83b1                	srli	a5,a5,0xc
ffffffffc0201020:	0532                	slli	a0,a0,0xc
ffffffffc0201022:	14e7f263          	bgeu	a5,a4,ffffffffc0201166 <get_pte+0x1b8>
ffffffffc0201026:	0003f797          	auipc	a5,0x3f
ffffffffc020102a:	f027b783          	ld	a5,-254(a5) # ffffffffc023ff28 <va_pa_offset>
ffffffffc020102e:	6605                	lui	a2,0x1
ffffffffc0201030:	4581                	li	a1,0
ffffffffc0201032:	953e                	add	a0,a0,a5
ffffffffc0201034:	42f060ef          	jal	ra,ffffffffc0207c62 <memset>
ffffffffc0201038:	000b3683          	ld	a3,0(s6)
ffffffffc020103c:	40d406b3          	sub	a3,s0,a3
ffffffffc0201040:	8699                	srai	a3,a3,0x6
ffffffffc0201042:	96d6                	add	a3,a3,s5
ffffffffc0201044:	06aa                	slli	a3,a3,0xa
ffffffffc0201046:	0116e693          	ori	a3,a3,17
ffffffffc020104a:	e094                	sd	a3,0(s1)
ffffffffc020104c:	77fd                	lui	a5,0xfffff
ffffffffc020104e:	068a                	slli	a3,a3,0x2
ffffffffc0201050:	000a3703          	ld	a4,0(s4)
ffffffffc0201054:	8efd                	and	a3,a3,a5
ffffffffc0201056:	00c6d793          	srli	a5,a3,0xc
ffffffffc020105a:	0ce7f163          	bgeu	a5,a4,ffffffffc020111c <get_pte+0x16e>
ffffffffc020105e:	0003fa97          	auipc	s5,0x3f
ffffffffc0201062:	ecaa8a93          	addi	s5,s5,-310 # ffffffffc023ff28 <va_pa_offset>
ffffffffc0201066:	000ab403          	ld	s0,0(s5)
ffffffffc020106a:	01595793          	srli	a5,s2,0x15
ffffffffc020106e:	1ff7f793          	andi	a5,a5,511
ffffffffc0201072:	96a2                	add	a3,a3,s0
ffffffffc0201074:	00379413          	slli	s0,a5,0x3
ffffffffc0201078:	9436                	add	s0,s0,a3
ffffffffc020107a:	6014                	ld	a3,0(s0)
ffffffffc020107c:	0016f793          	andi	a5,a3,1
ffffffffc0201080:	e3ad                	bnez	a5,ffffffffc02010e2 <get_pte+0x134>
ffffffffc0201082:	08098b63          	beqz	s3,ffffffffc0201118 <get_pte+0x16a>
ffffffffc0201086:	4505                	li	a0,1
ffffffffc0201088:	cc3ff0ef          	jal	ra,ffffffffc0200d4a <alloc_pages>
ffffffffc020108c:	84aa                	mv	s1,a0
ffffffffc020108e:	c549                	beqz	a0,ffffffffc0201118 <get_pte+0x16a>
ffffffffc0201090:	0003fb17          	auipc	s6,0x3f
ffffffffc0201094:	ea8b0b13          	addi	s6,s6,-344 # ffffffffc023ff38 <pages>
ffffffffc0201098:	000b3503          	ld	a0,0(s6)
ffffffffc020109c:	000809b7          	lui	s3,0x80
ffffffffc02010a0:	000a3703          	ld	a4,0(s4)
ffffffffc02010a4:	40a48533          	sub	a0,s1,a0
ffffffffc02010a8:	8519                	srai	a0,a0,0x6
ffffffffc02010aa:	954e                	add	a0,a0,s3
ffffffffc02010ac:	00c51793          	slli	a5,a0,0xc
ffffffffc02010b0:	4685                	li	a3,1
ffffffffc02010b2:	c094                	sw	a3,0(s1)
ffffffffc02010b4:	83b1                	srli	a5,a5,0xc
ffffffffc02010b6:	0532                	slli	a0,a0,0xc
ffffffffc02010b8:	08e7fa63          	bgeu	a5,a4,ffffffffc020114c <get_pte+0x19e>
ffffffffc02010bc:	000ab783          	ld	a5,0(s5)
ffffffffc02010c0:	6605                	lui	a2,0x1
ffffffffc02010c2:	4581                	li	a1,0
ffffffffc02010c4:	953e                	add	a0,a0,a5
ffffffffc02010c6:	39d060ef          	jal	ra,ffffffffc0207c62 <memset>
ffffffffc02010ca:	000b3683          	ld	a3,0(s6)
ffffffffc02010ce:	40d486b3          	sub	a3,s1,a3
ffffffffc02010d2:	8699                	srai	a3,a3,0x6
ffffffffc02010d4:	96ce                	add	a3,a3,s3
ffffffffc02010d6:	06aa                	slli	a3,a3,0xa
ffffffffc02010d8:	0116e693          	ori	a3,a3,17
ffffffffc02010dc:	e014                	sd	a3,0(s0)
ffffffffc02010de:	000a3703          	ld	a4,0(s4)
ffffffffc02010e2:	068a                	slli	a3,a3,0x2
ffffffffc02010e4:	757d                	lui	a0,0xfffff
ffffffffc02010e6:	8ee9                	and	a3,a3,a0
ffffffffc02010e8:	00c6d793          	srli	a5,a3,0xc
ffffffffc02010ec:	04e7f463          	bgeu	a5,a4,ffffffffc0201134 <get_pte+0x186>
ffffffffc02010f0:	000ab503          	ld	a0,0(s5)
ffffffffc02010f4:	00c95913          	srli	s2,s2,0xc
ffffffffc02010f8:	1ff97913          	andi	s2,s2,511
ffffffffc02010fc:	96aa                	add	a3,a3,a0
ffffffffc02010fe:	00391513          	slli	a0,s2,0x3
ffffffffc0201102:	9536                	add	a0,a0,a3
ffffffffc0201104:	70e2                	ld	ra,56(sp)
ffffffffc0201106:	7442                	ld	s0,48(sp)
ffffffffc0201108:	74a2                	ld	s1,40(sp)
ffffffffc020110a:	7902                	ld	s2,32(sp)
ffffffffc020110c:	69e2                	ld	s3,24(sp)
ffffffffc020110e:	6a42                	ld	s4,16(sp)
ffffffffc0201110:	6aa2                	ld	s5,8(sp)
ffffffffc0201112:	6b02                	ld	s6,0(sp)
ffffffffc0201114:	6121                	addi	sp,sp,64
ffffffffc0201116:	8082                	ret
ffffffffc0201118:	4501                	li	a0,0
ffffffffc020111a:	b7ed                	j	ffffffffc0201104 <get_pte+0x156>
ffffffffc020111c:	00008617          	auipc	a2,0x8
ffffffffc0201120:	9d460613          	addi	a2,a2,-1580 # ffffffffc0208af0 <commands+0x7c0>
ffffffffc0201124:	0fe00593          	li	a1,254
ffffffffc0201128:	00008517          	auipc	a0,0x8
ffffffffc020112c:	9b850513          	addi	a0,a0,-1608 # ffffffffc0208ae0 <commands+0x7b0>
ffffffffc0201130:	8d8ff0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0201134:	00008617          	auipc	a2,0x8
ffffffffc0201138:	9bc60613          	addi	a2,a2,-1604 # ffffffffc0208af0 <commands+0x7c0>
ffffffffc020113c:	10900593          	li	a1,265
ffffffffc0201140:	00008517          	auipc	a0,0x8
ffffffffc0201144:	9a050513          	addi	a0,a0,-1632 # ffffffffc0208ae0 <commands+0x7b0>
ffffffffc0201148:	8c0ff0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc020114c:	86aa                	mv	a3,a0
ffffffffc020114e:	00008617          	auipc	a2,0x8
ffffffffc0201152:	9a260613          	addi	a2,a2,-1630 # ffffffffc0208af0 <commands+0x7c0>
ffffffffc0201156:	10600593          	li	a1,262
ffffffffc020115a:	00008517          	auipc	a0,0x8
ffffffffc020115e:	98650513          	addi	a0,a0,-1658 # ffffffffc0208ae0 <commands+0x7b0>
ffffffffc0201162:	8a6ff0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0201166:	86aa                	mv	a3,a0
ffffffffc0201168:	00008617          	auipc	a2,0x8
ffffffffc020116c:	98860613          	addi	a2,a2,-1656 # ffffffffc0208af0 <commands+0x7c0>
ffffffffc0201170:	0fa00593          	li	a1,250
ffffffffc0201174:	00008517          	auipc	a0,0x8
ffffffffc0201178:	96c50513          	addi	a0,a0,-1684 # ffffffffc0208ae0 <commands+0x7b0>
ffffffffc020117c:	88cff0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0201180 <unmap_range>:
ffffffffc0201180:	711d                	addi	sp,sp,-96
ffffffffc0201182:	00c5e7b3          	or	a5,a1,a2
ffffffffc0201186:	ec86                	sd	ra,88(sp)
ffffffffc0201188:	e8a2                	sd	s0,80(sp)
ffffffffc020118a:	e4a6                	sd	s1,72(sp)
ffffffffc020118c:	e0ca                	sd	s2,64(sp)
ffffffffc020118e:	fc4e                	sd	s3,56(sp)
ffffffffc0201190:	f852                	sd	s4,48(sp)
ffffffffc0201192:	f456                	sd	s5,40(sp)
ffffffffc0201194:	f05a                	sd	s6,32(sp)
ffffffffc0201196:	ec5e                	sd	s7,24(sp)
ffffffffc0201198:	e862                	sd	s8,16(sp)
ffffffffc020119a:	e466                	sd	s9,8(sp)
ffffffffc020119c:	17d2                	slli	a5,a5,0x34
ffffffffc020119e:	ebf1                	bnez	a5,ffffffffc0201272 <unmap_range+0xf2>
ffffffffc02011a0:	002007b7          	lui	a5,0x200
ffffffffc02011a4:	842e                	mv	s0,a1
ffffffffc02011a6:	0af5e663          	bltu	a1,a5,ffffffffc0201252 <unmap_range+0xd2>
ffffffffc02011aa:	8932                	mv	s2,a2
ffffffffc02011ac:	0ac5f363          	bgeu	a1,a2,ffffffffc0201252 <unmap_range+0xd2>
ffffffffc02011b0:	4785                	li	a5,1
ffffffffc02011b2:	07fe                	slli	a5,a5,0x1f
ffffffffc02011b4:	08c7ef63          	bltu	a5,a2,ffffffffc0201252 <unmap_range+0xd2>
ffffffffc02011b8:	89aa                	mv	s3,a0
ffffffffc02011ba:	6a05                	lui	s4,0x1
ffffffffc02011bc:	0003fc97          	auipc	s9,0x3f
ffffffffc02011c0:	d04c8c93          	addi	s9,s9,-764 # ffffffffc023fec0 <npage>
ffffffffc02011c4:	0003fc17          	auipc	s8,0x3f
ffffffffc02011c8:	d74c0c13          	addi	s8,s8,-652 # ffffffffc023ff38 <pages>
ffffffffc02011cc:	fff80bb7          	lui	s7,0xfff80
ffffffffc02011d0:	00200b37          	lui	s6,0x200
ffffffffc02011d4:	ffe00ab7          	lui	s5,0xffe00
ffffffffc02011d8:	4601                	li	a2,0
ffffffffc02011da:	85a2                	mv	a1,s0
ffffffffc02011dc:	854e                	mv	a0,s3
ffffffffc02011de:	dd1ff0ef          	jal	ra,ffffffffc0200fae <get_pte>
ffffffffc02011e2:	84aa                	mv	s1,a0
ffffffffc02011e4:	cd21                	beqz	a0,ffffffffc020123c <unmap_range+0xbc>
ffffffffc02011e6:	611c                	ld	a5,0(a0)
ffffffffc02011e8:	e38d                	bnez	a5,ffffffffc020120a <unmap_range+0x8a>
ffffffffc02011ea:	9452                	add	s0,s0,s4
ffffffffc02011ec:	ff2466e3          	bltu	s0,s2,ffffffffc02011d8 <unmap_range+0x58>
ffffffffc02011f0:	60e6                	ld	ra,88(sp)
ffffffffc02011f2:	6446                	ld	s0,80(sp)
ffffffffc02011f4:	64a6                	ld	s1,72(sp)
ffffffffc02011f6:	6906                	ld	s2,64(sp)
ffffffffc02011f8:	79e2                	ld	s3,56(sp)
ffffffffc02011fa:	7a42                	ld	s4,48(sp)
ffffffffc02011fc:	7aa2                	ld	s5,40(sp)
ffffffffc02011fe:	7b02                	ld	s6,32(sp)
ffffffffc0201200:	6be2                	ld	s7,24(sp)
ffffffffc0201202:	6c42                	ld	s8,16(sp)
ffffffffc0201204:	6ca2                	ld	s9,8(sp)
ffffffffc0201206:	6125                	addi	sp,sp,96
ffffffffc0201208:	8082                	ret
ffffffffc020120a:	0017f713          	andi	a4,a5,1
ffffffffc020120e:	df71                	beqz	a4,ffffffffc02011ea <unmap_range+0x6a>
ffffffffc0201210:	000cb703          	ld	a4,0(s9)
ffffffffc0201214:	078a                	slli	a5,a5,0x2
ffffffffc0201216:	83b1                	srli	a5,a5,0xc
ffffffffc0201218:	06e7fd63          	bgeu	a5,a4,ffffffffc0201292 <unmap_range+0x112>
ffffffffc020121c:	000c3503          	ld	a0,0(s8)
ffffffffc0201220:	97de                	add	a5,a5,s7
ffffffffc0201222:	079a                	slli	a5,a5,0x6
ffffffffc0201224:	953e                	add	a0,a0,a5
ffffffffc0201226:	411c                	lw	a5,0(a0)
ffffffffc0201228:	fff7871b          	addiw	a4,a5,-1
ffffffffc020122c:	c118                	sw	a4,0(a0)
ffffffffc020122e:	cf11                	beqz	a4,ffffffffc020124a <unmap_range+0xca>
ffffffffc0201230:	0004b023          	sd	zero,0(s1)
ffffffffc0201234:	12040073          	sfence.vma	s0
ffffffffc0201238:	9452                	add	s0,s0,s4
ffffffffc020123a:	bf4d                	j	ffffffffc02011ec <unmap_range+0x6c>
ffffffffc020123c:	945a                	add	s0,s0,s6
ffffffffc020123e:	01547433          	and	s0,s0,s5
ffffffffc0201242:	d45d                	beqz	s0,ffffffffc02011f0 <unmap_range+0x70>
ffffffffc0201244:	f9246ae3          	bltu	s0,s2,ffffffffc02011d8 <unmap_range+0x58>
ffffffffc0201248:	b765                	j	ffffffffc02011f0 <unmap_range+0x70>
ffffffffc020124a:	4585                	li	a1,1
ffffffffc020124c:	b91ff0ef          	jal	ra,ffffffffc0200ddc <free_pages>
ffffffffc0201250:	b7c5                	j	ffffffffc0201230 <unmap_range+0xb0>
ffffffffc0201252:	00008697          	auipc	a3,0x8
ffffffffc0201256:	8f668693          	addi	a3,a3,-1802 # ffffffffc0208b48 <commands+0x818>
ffffffffc020125a:	00007617          	auipc	a2,0x7
ffffffffc020125e:	4e660613          	addi	a2,a2,1254 # ffffffffc0208740 <commands+0x410>
ffffffffc0201262:	14100593          	li	a1,321
ffffffffc0201266:	00008517          	auipc	a0,0x8
ffffffffc020126a:	87a50513          	addi	a0,a0,-1926 # ffffffffc0208ae0 <commands+0x7b0>
ffffffffc020126e:	f9bfe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0201272:	00008697          	auipc	a3,0x8
ffffffffc0201276:	8a668693          	addi	a3,a3,-1882 # ffffffffc0208b18 <commands+0x7e8>
ffffffffc020127a:	00007617          	auipc	a2,0x7
ffffffffc020127e:	4c660613          	addi	a2,a2,1222 # ffffffffc0208740 <commands+0x410>
ffffffffc0201282:	14000593          	li	a1,320
ffffffffc0201286:	00008517          	auipc	a0,0x8
ffffffffc020128a:	85a50513          	addi	a0,a0,-1958 # ffffffffc0208ae0 <commands+0x7b0>
ffffffffc020128e:	f7bfe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0201292:	a9dff0ef          	jal	ra,ffffffffc0200d2e <pa2page.part.0>

ffffffffc0201296 <exit_range>:
ffffffffc0201296:	715d                	addi	sp,sp,-80
ffffffffc0201298:	00c5e7b3          	or	a5,a1,a2
ffffffffc020129c:	e486                	sd	ra,72(sp)
ffffffffc020129e:	e0a2                	sd	s0,64(sp)
ffffffffc02012a0:	fc26                	sd	s1,56(sp)
ffffffffc02012a2:	f84a                	sd	s2,48(sp)
ffffffffc02012a4:	f44e                	sd	s3,40(sp)
ffffffffc02012a6:	f052                	sd	s4,32(sp)
ffffffffc02012a8:	ec56                	sd	s5,24(sp)
ffffffffc02012aa:	e85a                	sd	s6,16(sp)
ffffffffc02012ac:	e45e                	sd	s7,8(sp)
ffffffffc02012ae:	17d2                	slli	a5,a5,0x34
ffffffffc02012b0:	e3f1                	bnez	a5,ffffffffc0201374 <exit_range+0xde>
ffffffffc02012b2:	002007b7          	lui	a5,0x200
ffffffffc02012b6:	08f5ef63          	bltu	a1,a5,ffffffffc0201354 <exit_range+0xbe>
ffffffffc02012ba:	89b2                	mv	s3,a2
ffffffffc02012bc:	08c5fc63          	bgeu	a1,a2,ffffffffc0201354 <exit_range+0xbe>
ffffffffc02012c0:	4785                	li	a5,1
ffffffffc02012c2:	ffe004b7          	lui	s1,0xffe00
ffffffffc02012c6:	07fe                	slli	a5,a5,0x1f
ffffffffc02012c8:	8ced                	and	s1,s1,a1
ffffffffc02012ca:	08c7e563          	bltu	a5,a2,ffffffffc0201354 <exit_range+0xbe>
ffffffffc02012ce:	8a2a                	mv	s4,a0
ffffffffc02012d0:	0003fb17          	auipc	s6,0x3f
ffffffffc02012d4:	bf0b0b13          	addi	s6,s6,-1040 # ffffffffc023fec0 <npage>
ffffffffc02012d8:	0003fb97          	auipc	s7,0x3f
ffffffffc02012dc:	c60b8b93          	addi	s7,s7,-928 # ffffffffc023ff38 <pages>
ffffffffc02012e0:	fff80937          	lui	s2,0xfff80
ffffffffc02012e4:	00200ab7          	lui	s5,0x200
ffffffffc02012e8:	a019                	j	ffffffffc02012ee <exit_range+0x58>
ffffffffc02012ea:	0334fe63          	bgeu	s1,s3,ffffffffc0201326 <exit_range+0x90>
ffffffffc02012ee:	01e4d413          	srli	s0,s1,0x1e
ffffffffc02012f2:	1ff47413          	andi	s0,s0,511
ffffffffc02012f6:	040e                	slli	s0,s0,0x3
ffffffffc02012f8:	9452                	add	s0,s0,s4
ffffffffc02012fa:	601c                	ld	a5,0(s0)
ffffffffc02012fc:	0017f713          	andi	a4,a5,1
ffffffffc0201300:	c30d                	beqz	a4,ffffffffc0201322 <exit_range+0x8c>
ffffffffc0201302:	000b3703          	ld	a4,0(s6)
ffffffffc0201306:	078a                	slli	a5,a5,0x2
ffffffffc0201308:	83b1                	srli	a5,a5,0xc
ffffffffc020130a:	02e7f963          	bgeu	a5,a4,ffffffffc020133c <exit_range+0xa6>
ffffffffc020130e:	000bb503          	ld	a0,0(s7)
ffffffffc0201312:	97ca                	add	a5,a5,s2
ffffffffc0201314:	079a                	slli	a5,a5,0x6
ffffffffc0201316:	4585                	li	a1,1
ffffffffc0201318:	953e                	add	a0,a0,a5
ffffffffc020131a:	ac3ff0ef          	jal	ra,ffffffffc0200ddc <free_pages>
ffffffffc020131e:	00043023          	sd	zero,0(s0)
ffffffffc0201322:	94d6                	add	s1,s1,s5
ffffffffc0201324:	f0f9                	bnez	s1,ffffffffc02012ea <exit_range+0x54>
ffffffffc0201326:	60a6                	ld	ra,72(sp)
ffffffffc0201328:	6406                	ld	s0,64(sp)
ffffffffc020132a:	74e2                	ld	s1,56(sp)
ffffffffc020132c:	7942                	ld	s2,48(sp)
ffffffffc020132e:	79a2                	ld	s3,40(sp)
ffffffffc0201330:	7a02                	ld	s4,32(sp)
ffffffffc0201332:	6ae2                	ld	s5,24(sp)
ffffffffc0201334:	6b42                	ld	s6,16(sp)
ffffffffc0201336:	6ba2                	ld	s7,8(sp)
ffffffffc0201338:	6161                	addi	sp,sp,80
ffffffffc020133a:	8082                	ret
ffffffffc020133c:	00007617          	auipc	a2,0x7
ffffffffc0201340:	6f460613          	addi	a2,a2,1780 # ffffffffc0208a30 <commands+0x700>
ffffffffc0201344:	06200593          	li	a1,98
ffffffffc0201348:	00007517          	auipc	a0,0x7
ffffffffc020134c:	70850513          	addi	a0,a0,1800 # ffffffffc0208a50 <commands+0x720>
ffffffffc0201350:	eb9fe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0201354:	00007697          	auipc	a3,0x7
ffffffffc0201358:	7f468693          	addi	a3,a3,2036 # ffffffffc0208b48 <commands+0x818>
ffffffffc020135c:	00007617          	auipc	a2,0x7
ffffffffc0201360:	3e460613          	addi	a2,a2,996 # ffffffffc0208740 <commands+0x410>
ffffffffc0201364:	15200593          	li	a1,338
ffffffffc0201368:	00007517          	auipc	a0,0x7
ffffffffc020136c:	77850513          	addi	a0,a0,1912 # ffffffffc0208ae0 <commands+0x7b0>
ffffffffc0201370:	e99fe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0201374:	00007697          	auipc	a3,0x7
ffffffffc0201378:	7a468693          	addi	a3,a3,1956 # ffffffffc0208b18 <commands+0x7e8>
ffffffffc020137c:	00007617          	auipc	a2,0x7
ffffffffc0201380:	3c460613          	addi	a2,a2,964 # ffffffffc0208740 <commands+0x410>
ffffffffc0201384:	15100593          	li	a1,337
ffffffffc0201388:	00007517          	auipc	a0,0x7
ffffffffc020138c:	75850513          	addi	a0,a0,1880 # ffffffffc0208ae0 <commands+0x7b0>
ffffffffc0201390:	e79fe0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0201394 <page_insert>:
ffffffffc0201394:	7179                	addi	sp,sp,-48
ffffffffc0201396:	e44e                	sd	s3,8(sp)
ffffffffc0201398:	89b2                	mv	s3,a2
ffffffffc020139a:	f022                	sd	s0,32(sp)
ffffffffc020139c:	4605                	li	a2,1
ffffffffc020139e:	842e                	mv	s0,a1
ffffffffc02013a0:	85ce                	mv	a1,s3
ffffffffc02013a2:	ec26                	sd	s1,24(sp)
ffffffffc02013a4:	f406                	sd	ra,40(sp)
ffffffffc02013a6:	e84a                	sd	s2,16(sp)
ffffffffc02013a8:	e052                	sd	s4,0(sp)
ffffffffc02013aa:	84b6                	mv	s1,a3
ffffffffc02013ac:	c03ff0ef          	jal	ra,ffffffffc0200fae <get_pte>
ffffffffc02013b0:	cd41                	beqz	a0,ffffffffc0201448 <page_insert+0xb4>
ffffffffc02013b2:	4014                	lw	a3,0(s0)
ffffffffc02013b4:	611c                	ld	a5,0(a0)
ffffffffc02013b6:	892a                	mv	s2,a0
ffffffffc02013b8:	0016871b          	addiw	a4,a3,1
ffffffffc02013bc:	c018                	sw	a4,0(s0)
ffffffffc02013be:	0017f713          	andi	a4,a5,1
ffffffffc02013c2:	eb1d                	bnez	a4,ffffffffc02013f8 <page_insert+0x64>
ffffffffc02013c4:	0003f717          	auipc	a4,0x3f
ffffffffc02013c8:	b7473703          	ld	a4,-1164(a4) # ffffffffc023ff38 <pages>
ffffffffc02013cc:	8c19                	sub	s0,s0,a4
ffffffffc02013ce:	000807b7          	lui	a5,0x80
ffffffffc02013d2:	8419                	srai	s0,s0,0x6
ffffffffc02013d4:	943e                	add	s0,s0,a5
ffffffffc02013d6:	042a                	slli	s0,s0,0xa
ffffffffc02013d8:	8c45                	or	s0,s0,s1
ffffffffc02013da:	00146413          	ori	s0,s0,1
ffffffffc02013de:	00893023          	sd	s0,0(s2) # fffffffffff80000 <end+0x3fd3ff60>
ffffffffc02013e2:	12098073          	sfence.vma	s3
ffffffffc02013e6:	4501                	li	a0,0
ffffffffc02013e8:	70a2                	ld	ra,40(sp)
ffffffffc02013ea:	7402                	ld	s0,32(sp)
ffffffffc02013ec:	64e2                	ld	s1,24(sp)
ffffffffc02013ee:	6942                	ld	s2,16(sp)
ffffffffc02013f0:	69a2                	ld	s3,8(sp)
ffffffffc02013f2:	6a02                	ld	s4,0(sp)
ffffffffc02013f4:	6145                	addi	sp,sp,48
ffffffffc02013f6:	8082                	ret
ffffffffc02013f8:	078a                	slli	a5,a5,0x2
ffffffffc02013fa:	83b1                	srli	a5,a5,0xc
ffffffffc02013fc:	0003f717          	auipc	a4,0x3f
ffffffffc0201400:	ac473703          	ld	a4,-1340(a4) # ffffffffc023fec0 <npage>
ffffffffc0201404:	04e7f463          	bgeu	a5,a4,ffffffffc020144c <page_insert+0xb8>
ffffffffc0201408:	0003fa17          	auipc	s4,0x3f
ffffffffc020140c:	b30a0a13          	addi	s4,s4,-1232 # ffffffffc023ff38 <pages>
ffffffffc0201410:	000a3703          	ld	a4,0(s4)
ffffffffc0201414:	fff80537          	lui	a0,0xfff80
ffffffffc0201418:	97aa                	add	a5,a5,a0
ffffffffc020141a:	079a                	slli	a5,a5,0x6
ffffffffc020141c:	97ba                	add	a5,a5,a4
ffffffffc020141e:	00f40a63          	beq	s0,a5,ffffffffc0201432 <page_insert+0x9e>
ffffffffc0201422:	4394                	lw	a3,0(a5)
ffffffffc0201424:	fff6861b          	addiw	a2,a3,-1
ffffffffc0201428:	c390                	sw	a2,0(a5)
ffffffffc020142a:	c611                	beqz	a2,ffffffffc0201436 <page_insert+0xa2>
ffffffffc020142c:	12098073          	sfence.vma	s3
ffffffffc0201430:	bf71                	j	ffffffffc02013cc <page_insert+0x38>
ffffffffc0201432:	c014                	sw	a3,0(s0)
ffffffffc0201434:	bf61                	j	ffffffffc02013cc <page_insert+0x38>
ffffffffc0201436:	4585                	li	a1,1
ffffffffc0201438:	853e                	mv	a0,a5
ffffffffc020143a:	9a3ff0ef          	jal	ra,ffffffffc0200ddc <free_pages>
ffffffffc020143e:	000a3703          	ld	a4,0(s4)
ffffffffc0201442:	12098073          	sfence.vma	s3
ffffffffc0201446:	b759                	j	ffffffffc02013cc <page_insert+0x38>
ffffffffc0201448:	5571                	li	a0,-4
ffffffffc020144a:	bf79                	j	ffffffffc02013e8 <page_insert+0x54>
ffffffffc020144c:	8e3ff0ef          	jal	ra,ffffffffc0200d2e <pa2page.part.0>

ffffffffc0201450 <copy_range>:
ffffffffc0201450:	7159                	addi	sp,sp,-112
ffffffffc0201452:	00d667b3          	or	a5,a2,a3
ffffffffc0201456:	f486                	sd	ra,104(sp)
ffffffffc0201458:	f0a2                	sd	s0,96(sp)
ffffffffc020145a:	eca6                	sd	s1,88(sp)
ffffffffc020145c:	e8ca                	sd	s2,80(sp)
ffffffffc020145e:	e4ce                	sd	s3,72(sp)
ffffffffc0201460:	e0d2                	sd	s4,64(sp)
ffffffffc0201462:	fc56                	sd	s5,56(sp)
ffffffffc0201464:	f85a                	sd	s6,48(sp)
ffffffffc0201466:	f45e                	sd	s7,40(sp)
ffffffffc0201468:	f062                	sd	s8,32(sp)
ffffffffc020146a:	ec66                	sd	s9,24(sp)
ffffffffc020146c:	e86a                	sd	s10,16(sp)
ffffffffc020146e:	e46e                	sd	s11,8(sp)
ffffffffc0201470:	17d2                	slli	a5,a5,0x34
ffffffffc0201472:	1e079763          	bnez	a5,ffffffffc0201660 <copy_range+0x210>
ffffffffc0201476:	002007b7          	lui	a5,0x200
ffffffffc020147a:	8432                	mv	s0,a2
ffffffffc020147c:	16f66a63          	bltu	a2,a5,ffffffffc02015f0 <copy_range+0x1a0>
ffffffffc0201480:	8936                	mv	s2,a3
ffffffffc0201482:	16d67763          	bgeu	a2,a3,ffffffffc02015f0 <copy_range+0x1a0>
ffffffffc0201486:	4785                	li	a5,1
ffffffffc0201488:	07fe                	slli	a5,a5,0x1f
ffffffffc020148a:	16d7e363          	bltu	a5,a3,ffffffffc02015f0 <copy_range+0x1a0>
ffffffffc020148e:	5b7d                	li	s6,-1
ffffffffc0201490:	8aaa                	mv	s5,a0
ffffffffc0201492:	89ae                	mv	s3,a1
ffffffffc0201494:	6a05                	lui	s4,0x1
ffffffffc0201496:	0003fc97          	auipc	s9,0x3f
ffffffffc020149a:	a2ac8c93          	addi	s9,s9,-1494 # ffffffffc023fec0 <npage>
ffffffffc020149e:	0003fc17          	auipc	s8,0x3f
ffffffffc02014a2:	a9ac0c13          	addi	s8,s8,-1382 # ffffffffc023ff38 <pages>
ffffffffc02014a6:	00080bb7          	lui	s7,0x80
ffffffffc02014aa:	00cb5b13          	srli	s6,s6,0xc
ffffffffc02014ae:	4601                	li	a2,0
ffffffffc02014b0:	85a2                	mv	a1,s0
ffffffffc02014b2:	854e                	mv	a0,s3
ffffffffc02014b4:	afbff0ef          	jal	ra,ffffffffc0200fae <get_pte>
ffffffffc02014b8:	84aa                	mv	s1,a0
ffffffffc02014ba:	c175                	beqz	a0,ffffffffc020159e <copy_range+0x14e>
ffffffffc02014bc:	611c                	ld	a5,0(a0)
ffffffffc02014be:	8b85                	andi	a5,a5,1
ffffffffc02014c0:	e785                	bnez	a5,ffffffffc02014e8 <copy_range+0x98>
ffffffffc02014c2:	9452                	add	s0,s0,s4
ffffffffc02014c4:	ff2465e3          	bltu	s0,s2,ffffffffc02014ae <copy_range+0x5e>
ffffffffc02014c8:	4501                	li	a0,0
ffffffffc02014ca:	70a6                	ld	ra,104(sp)
ffffffffc02014cc:	7406                	ld	s0,96(sp)
ffffffffc02014ce:	64e6                	ld	s1,88(sp)
ffffffffc02014d0:	6946                	ld	s2,80(sp)
ffffffffc02014d2:	69a6                	ld	s3,72(sp)
ffffffffc02014d4:	6a06                	ld	s4,64(sp)
ffffffffc02014d6:	7ae2                	ld	s5,56(sp)
ffffffffc02014d8:	7b42                	ld	s6,48(sp)
ffffffffc02014da:	7ba2                	ld	s7,40(sp)
ffffffffc02014dc:	7c02                	ld	s8,32(sp)
ffffffffc02014de:	6ce2                	ld	s9,24(sp)
ffffffffc02014e0:	6d42                	ld	s10,16(sp)
ffffffffc02014e2:	6da2                	ld	s11,8(sp)
ffffffffc02014e4:	6165                	addi	sp,sp,112
ffffffffc02014e6:	8082                	ret
ffffffffc02014e8:	4605                	li	a2,1
ffffffffc02014ea:	85a2                	mv	a1,s0
ffffffffc02014ec:	8556                	mv	a0,s5
ffffffffc02014ee:	ac1ff0ef          	jal	ra,ffffffffc0200fae <get_pte>
ffffffffc02014f2:	c161                	beqz	a0,ffffffffc02015b2 <copy_range+0x162>
ffffffffc02014f4:	609c                	ld	a5,0(s1)
ffffffffc02014f6:	0017f713          	andi	a4,a5,1
ffffffffc02014fa:	01f7f493          	andi	s1,a5,31
ffffffffc02014fe:	14070563          	beqz	a4,ffffffffc0201648 <copy_range+0x1f8>
ffffffffc0201502:	000cb683          	ld	a3,0(s9)
ffffffffc0201506:	078a                	slli	a5,a5,0x2
ffffffffc0201508:	00c7d713          	srli	a4,a5,0xc
ffffffffc020150c:	12d77263          	bgeu	a4,a3,ffffffffc0201630 <copy_range+0x1e0>
ffffffffc0201510:	000c3783          	ld	a5,0(s8)
ffffffffc0201514:	fff806b7          	lui	a3,0xfff80
ffffffffc0201518:	9736                	add	a4,a4,a3
ffffffffc020151a:	071a                	slli	a4,a4,0x6
ffffffffc020151c:	4505                	li	a0,1
ffffffffc020151e:	00e78db3          	add	s11,a5,a4
ffffffffc0201522:	829ff0ef          	jal	ra,ffffffffc0200d4a <alloc_pages>
ffffffffc0201526:	8d2a                	mv	s10,a0
ffffffffc0201528:	0a0d8463          	beqz	s11,ffffffffc02015d0 <copy_range+0x180>
ffffffffc020152c:	c175                	beqz	a0,ffffffffc0201610 <copy_range+0x1c0>
ffffffffc020152e:	000c3703          	ld	a4,0(s8)
ffffffffc0201532:	000cb603          	ld	a2,0(s9)
ffffffffc0201536:	40ed86b3          	sub	a3,s11,a4
ffffffffc020153a:	8699                	srai	a3,a3,0x6
ffffffffc020153c:	96de                	add	a3,a3,s7
ffffffffc020153e:	0166f7b3          	and	a5,a3,s6
ffffffffc0201542:	06b2                	slli	a3,a3,0xc
ffffffffc0201544:	06c7fa63          	bgeu	a5,a2,ffffffffc02015b8 <copy_range+0x168>
ffffffffc0201548:	40e507b3          	sub	a5,a0,a4
ffffffffc020154c:	0003f717          	auipc	a4,0x3f
ffffffffc0201550:	9dc70713          	addi	a4,a4,-1572 # ffffffffc023ff28 <va_pa_offset>
ffffffffc0201554:	6308                	ld	a0,0(a4)
ffffffffc0201556:	8799                	srai	a5,a5,0x6
ffffffffc0201558:	97de                	add	a5,a5,s7
ffffffffc020155a:	0167f733          	and	a4,a5,s6
ffffffffc020155e:	00a685b3          	add	a1,a3,a0
ffffffffc0201562:	07b2                	slli	a5,a5,0xc
ffffffffc0201564:	04c77963          	bgeu	a4,a2,ffffffffc02015b6 <copy_range+0x166>
ffffffffc0201568:	6605                	lui	a2,0x1
ffffffffc020156a:	953e                	add	a0,a0,a5
ffffffffc020156c:	708060ef          	jal	ra,ffffffffc0207c74 <memcpy>
ffffffffc0201570:	86a6                	mv	a3,s1
ffffffffc0201572:	8622                	mv	a2,s0
ffffffffc0201574:	85ea                	mv	a1,s10
ffffffffc0201576:	8556                	mv	a0,s5
ffffffffc0201578:	e1dff0ef          	jal	ra,ffffffffc0201394 <page_insert>
ffffffffc020157c:	d139                	beqz	a0,ffffffffc02014c2 <copy_range+0x72>
ffffffffc020157e:	00007697          	auipc	a3,0x7
ffffffffc0201582:	62a68693          	addi	a3,a3,1578 # ffffffffc0208ba8 <commands+0x878>
ffffffffc0201586:	00007617          	auipc	a2,0x7
ffffffffc020158a:	1ba60613          	addi	a2,a2,442 # ffffffffc0208740 <commands+0x410>
ffffffffc020158e:	19900593          	li	a1,409
ffffffffc0201592:	00007517          	auipc	a0,0x7
ffffffffc0201596:	54e50513          	addi	a0,a0,1358 # ffffffffc0208ae0 <commands+0x7b0>
ffffffffc020159a:	c6ffe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc020159e:	00200637          	lui	a2,0x200
ffffffffc02015a2:	9432                	add	s0,s0,a2
ffffffffc02015a4:	ffe00637          	lui	a2,0xffe00
ffffffffc02015a8:	8c71                	and	s0,s0,a2
ffffffffc02015aa:	dc19                	beqz	s0,ffffffffc02014c8 <copy_range+0x78>
ffffffffc02015ac:	f12461e3          	bltu	s0,s2,ffffffffc02014ae <copy_range+0x5e>
ffffffffc02015b0:	bf21                	j	ffffffffc02014c8 <copy_range+0x78>
ffffffffc02015b2:	5571                	li	a0,-4
ffffffffc02015b4:	bf19                	j	ffffffffc02014ca <copy_range+0x7a>
ffffffffc02015b6:	86be                	mv	a3,a5
ffffffffc02015b8:	00007617          	auipc	a2,0x7
ffffffffc02015bc:	53860613          	addi	a2,a2,1336 # ffffffffc0208af0 <commands+0x7c0>
ffffffffc02015c0:	06900593          	li	a1,105
ffffffffc02015c4:	00007517          	auipc	a0,0x7
ffffffffc02015c8:	48c50513          	addi	a0,a0,1164 # ffffffffc0208a50 <commands+0x720>
ffffffffc02015cc:	c3dfe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc02015d0:	00007697          	auipc	a3,0x7
ffffffffc02015d4:	5b868693          	addi	a3,a3,1464 # ffffffffc0208b88 <commands+0x858>
ffffffffc02015d8:	00007617          	auipc	a2,0x7
ffffffffc02015dc:	16860613          	addi	a2,a2,360 # ffffffffc0208740 <commands+0x410>
ffffffffc02015e0:	17e00593          	li	a1,382
ffffffffc02015e4:	00007517          	auipc	a0,0x7
ffffffffc02015e8:	4fc50513          	addi	a0,a0,1276 # ffffffffc0208ae0 <commands+0x7b0>
ffffffffc02015ec:	c1dfe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc02015f0:	00007697          	auipc	a3,0x7
ffffffffc02015f4:	55868693          	addi	a3,a3,1368 # ffffffffc0208b48 <commands+0x818>
ffffffffc02015f8:	00007617          	auipc	a2,0x7
ffffffffc02015fc:	14860613          	addi	a2,a2,328 # ffffffffc0208740 <commands+0x410>
ffffffffc0201600:	16a00593          	li	a1,362
ffffffffc0201604:	00007517          	auipc	a0,0x7
ffffffffc0201608:	4dc50513          	addi	a0,a0,1244 # ffffffffc0208ae0 <commands+0x7b0>
ffffffffc020160c:	bfdfe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0201610:	00007697          	auipc	a3,0x7
ffffffffc0201614:	58868693          	addi	a3,a3,1416 # ffffffffc0208b98 <commands+0x868>
ffffffffc0201618:	00007617          	auipc	a2,0x7
ffffffffc020161c:	12860613          	addi	a2,a2,296 # ffffffffc0208740 <commands+0x410>
ffffffffc0201620:	17f00593          	li	a1,383
ffffffffc0201624:	00007517          	auipc	a0,0x7
ffffffffc0201628:	4bc50513          	addi	a0,a0,1212 # ffffffffc0208ae0 <commands+0x7b0>
ffffffffc020162c:	bddfe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0201630:	00007617          	auipc	a2,0x7
ffffffffc0201634:	40060613          	addi	a2,a2,1024 # ffffffffc0208a30 <commands+0x700>
ffffffffc0201638:	06200593          	li	a1,98
ffffffffc020163c:	00007517          	auipc	a0,0x7
ffffffffc0201640:	41450513          	addi	a0,a0,1044 # ffffffffc0208a50 <commands+0x720>
ffffffffc0201644:	bc5fe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0201648:	00007617          	auipc	a2,0x7
ffffffffc020164c:	51860613          	addi	a2,a2,1304 # ffffffffc0208b60 <commands+0x830>
ffffffffc0201650:	07400593          	li	a1,116
ffffffffc0201654:	00007517          	auipc	a0,0x7
ffffffffc0201658:	3fc50513          	addi	a0,a0,1020 # ffffffffc0208a50 <commands+0x720>
ffffffffc020165c:	badfe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0201660:	00007697          	auipc	a3,0x7
ffffffffc0201664:	4b868693          	addi	a3,a3,1208 # ffffffffc0208b18 <commands+0x7e8>
ffffffffc0201668:	00007617          	auipc	a2,0x7
ffffffffc020166c:	0d860613          	addi	a2,a2,216 # ffffffffc0208740 <commands+0x410>
ffffffffc0201670:	16900593          	li	a1,361
ffffffffc0201674:	00007517          	auipc	a0,0x7
ffffffffc0201678:	46c50513          	addi	a0,a0,1132 # ffffffffc0208ae0 <commands+0x7b0>
ffffffffc020167c:	b8dfe0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0201680 <tlb_invalidate>:
ffffffffc0201680:	12058073          	sfence.vma	a1
ffffffffc0201684:	8082                	ret

ffffffffc0201686 <pgdir_alloc_page>:
ffffffffc0201686:	7179                	addi	sp,sp,-48
ffffffffc0201688:	e84a                	sd	s2,16(sp)
ffffffffc020168a:	892a                	mv	s2,a0
ffffffffc020168c:	4505                	li	a0,1
ffffffffc020168e:	f022                	sd	s0,32(sp)
ffffffffc0201690:	ec26                	sd	s1,24(sp)
ffffffffc0201692:	e44e                	sd	s3,8(sp)
ffffffffc0201694:	f406                	sd	ra,40(sp)
ffffffffc0201696:	84ae                	mv	s1,a1
ffffffffc0201698:	89b2                	mv	s3,a2
ffffffffc020169a:	eb0ff0ef          	jal	ra,ffffffffc0200d4a <alloc_pages>
ffffffffc020169e:	842a                	mv	s0,a0
ffffffffc02016a0:	cd05                	beqz	a0,ffffffffc02016d8 <pgdir_alloc_page+0x52>
ffffffffc02016a2:	85aa                	mv	a1,a0
ffffffffc02016a4:	86ce                	mv	a3,s3
ffffffffc02016a6:	8626                	mv	a2,s1
ffffffffc02016a8:	854a                	mv	a0,s2
ffffffffc02016aa:	cebff0ef          	jal	ra,ffffffffc0201394 <page_insert>
ffffffffc02016ae:	ed0d                	bnez	a0,ffffffffc02016e8 <pgdir_alloc_page+0x62>
ffffffffc02016b0:	0003f797          	auipc	a5,0x3f
ffffffffc02016b4:	8287a783          	lw	a5,-2008(a5) # ffffffffc023fed8 <swap_init_ok>
ffffffffc02016b8:	c385                	beqz	a5,ffffffffc02016d8 <pgdir_alloc_page+0x52>
ffffffffc02016ba:	0003f517          	auipc	a0,0x3f
ffffffffc02016be:	88653503          	ld	a0,-1914(a0) # ffffffffc023ff40 <check_mm_struct>
ffffffffc02016c2:	c919                	beqz	a0,ffffffffc02016d8 <pgdir_alloc_page+0x52>
ffffffffc02016c4:	4681                	li	a3,0
ffffffffc02016c6:	8622                	mv	a2,s0
ffffffffc02016c8:	85a6                	mv	a1,s1
ffffffffc02016ca:	60a000ef          	jal	ra,ffffffffc0201cd4 <swap_map_swappable>
ffffffffc02016ce:	4018                	lw	a4,0(s0)
ffffffffc02016d0:	fc04                	sd	s1,56(s0)
ffffffffc02016d2:	4785                	li	a5,1
ffffffffc02016d4:	02f71063          	bne	a4,a5,ffffffffc02016f4 <pgdir_alloc_page+0x6e>
ffffffffc02016d8:	70a2                	ld	ra,40(sp)
ffffffffc02016da:	8522                	mv	a0,s0
ffffffffc02016dc:	7402                	ld	s0,32(sp)
ffffffffc02016de:	64e2                	ld	s1,24(sp)
ffffffffc02016e0:	6942                	ld	s2,16(sp)
ffffffffc02016e2:	69a2                	ld	s3,8(sp)
ffffffffc02016e4:	6145                	addi	sp,sp,48
ffffffffc02016e6:	8082                	ret
ffffffffc02016e8:	8522                	mv	a0,s0
ffffffffc02016ea:	4585                	li	a1,1
ffffffffc02016ec:	ef0ff0ef          	jal	ra,ffffffffc0200ddc <free_pages>
ffffffffc02016f0:	4401                	li	s0,0
ffffffffc02016f2:	b7dd                	j	ffffffffc02016d8 <pgdir_alloc_page+0x52>
ffffffffc02016f4:	00007697          	auipc	a3,0x7
ffffffffc02016f8:	4c468693          	addi	a3,a3,1220 # ffffffffc0208bb8 <commands+0x888>
ffffffffc02016fc:	00007617          	auipc	a2,0x7
ffffffffc0201700:	04460613          	addi	a2,a2,68 # ffffffffc0208740 <commands+0x410>
ffffffffc0201704:	1d800593          	li	a1,472
ffffffffc0201708:	00007517          	auipc	a0,0x7
ffffffffc020170c:	3d850513          	addi	a0,a0,984 # ffffffffc0208ae0 <commands+0x7b0>
ffffffffc0201710:	af9fe0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0201714 <check_vma_overlap.isra.0.part.0>:
ffffffffc0201714:	1141                	addi	sp,sp,-16
ffffffffc0201716:	00007697          	auipc	a3,0x7
ffffffffc020171a:	4ba68693          	addi	a3,a3,1210 # ffffffffc0208bd0 <commands+0x8a0>
ffffffffc020171e:	00007617          	auipc	a2,0x7
ffffffffc0201722:	02260613          	addi	a2,a2,34 # ffffffffc0208740 <commands+0x410>
ffffffffc0201726:	06d00593          	li	a1,109
ffffffffc020172a:	00007517          	auipc	a0,0x7
ffffffffc020172e:	4c650513          	addi	a0,a0,1222 # ffffffffc0208bf0 <commands+0x8c0>
ffffffffc0201732:	e406                	sd	ra,8(sp)
ffffffffc0201734:	ad5fe0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0201738 <mm_create>:
ffffffffc0201738:	1141                	addi	sp,sp,-16
ffffffffc020173a:	05800513          	li	a0,88
ffffffffc020173e:	e022                	sd	s0,0(sp)
ffffffffc0201740:	e406                	sd	ra,8(sp)
ffffffffc0201742:	12f000ef          	jal	ra,ffffffffc0202070 <kmalloc>
ffffffffc0201746:	842a                	mv	s0,a0
ffffffffc0201748:	c51d                	beqz	a0,ffffffffc0201776 <mm_create+0x3e>
ffffffffc020174a:	e408                	sd	a0,8(s0)
ffffffffc020174c:	e008                	sd	a0,0(s0)
ffffffffc020174e:	00053823          	sd	zero,16(a0)
ffffffffc0201752:	00053c23          	sd	zero,24(a0)
ffffffffc0201756:	02052023          	sw	zero,32(a0)
ffffffffc020175a:	0003e797          	auipc	a5,0x3e
ffffffffc020175e:	77e7a783          	lw	a5,1918(a5) # ffffffffc023fed8 <swap_init_ok>
ffffffffc0201762:	ef99                	bnez	a5,ffffffffc0201780 <mm_create+0x48>
ffffffffc0201764:	02053423          	sd	zero,40(a0)
ffffffffc0201768:	02042823          	sw	zero,48(s0)
ffffffffc020176c:	4585                	li	a1,1
ffffffffc020176e:	03840513          	addi	a0,s0,56
ffffffffc0201772:	6ab010ef          	jal	ra,ffffffffc020361c <sem_init>
ffffffffc0201776:	60a2                	ld	ra,8(sp)
ffffffffc0201778:	8522                	mv	a0,s0
ffffffffc020177a:	6402                	ld	s0,0(sp)
ffffffffc020177c:	0141                	addi	sp,sp,16
ffffffffc020177e:	8082                	ret
ffffffffc0201780:	546000ef          	jal	ra,ffffffffc0201cc6 <swap_init_mm>
ffffffffc0201784:	b7d5                	j	ffffffffc0201768 <mm_create+0x30>

ffffffffc0201786 <find_vma>:
ffffffffc0201786:	86aa                	mv	a3,a0
ffffffffc0201788:	c505                	beqz	a0,ffffffffc02017b0 <find_vma+0x2a>
ffffffffc020178a:	6908                	ld	a0,16(a0)
ffffffffc020178c:	c501                	beqz	a0,ffffffffc0201794 <find_vma+0xe>
ffffffffc020178e:	651c                	ld	a5,8(a0)
ffffffffc0201790:	02f5f263          	bgeu	a1,a5,ffffffffc02017b4 <find_vma+0x2e>
ffffffffc0201794:	669c                	ld	a5,8(a3)
ffffffffc0201796:	00f68d63          	beq	a3,a5,ffffffffc02017b0 <find_vma+0x2a>
ffffffffc020179a:	fe87b703          	ld	a4,-24(a5)
ffffffffc020179e:	00e5e663          	bltu	a1,a4,ffffffffc02017aa <find_vma+0x24>
ffffffffc02017a2:	ff07b703          	ld	a4,-16(a5)
ffffffffc02017a6:	00e5ec63          	bltu	a1,a4,ffffffffc02017be <find_vma+0x38>
ffffffffc02017aa:	679c                	ld	a5,8(a5)
ffffffffc02017ac:	fef697e3          	bne	a3,a5,ffffffffc020179a <find_vma+0x14>
ffffffffc02017b0:	4501                	li	a0,0
ffffffffc02017b2:	8082                	ret
ffffffffc02017b4:	691c                	ld	a5,16(a0)
ffffffffc02017b6:	fcf5ffe3          	bgeu	a1,a5,ffffffffc0201794 <find_vma+0xe>
ffffffffc02017ba:	ea88                	sd	a0,16(a3)
ffffffffc02017bc:	8082                	ret
ffffffffc02017be:	fe078513          	addi	a0,a5,-32
ffffffffc02017c2:	ea88                	sd	a0,16(a3)
ffffffffc02017c4:	8082                	ret

ffffffffc02017c6 <insert_vma_struct>:
ffffffffc02017c6:	6590                	ld	a2,8(a1)
ffffffffc02017c8:	0105b803          	ld	a6,16(a1)
ffffffffc02017cc:	1141                	addi	sp,sp,-16
ffffffffc02017ce:	e406                	sd	ra,8(sp)
ffffffffc02017d0:	87aa                	mv	a5,a0
ffffffffc02017d2:	01066763          	bltu	a2,a6,ffffffffc02017e0 <insert_vma_struct+0x1a>
ffffffffc02017d6:	a085                	j	ffffffffc0201836 <insert_vma_struct+0x70>
ffffffffc02017d8:	fe87b703          	ld	a4,-24(a5)
ffffffffc02017dc:	04e66863          	bltu	a2,a4,ffffffffc020182c <insert_vma_struct+0x66>
ffffffffc02017e0:	86be                	mv	a3,a5
ffffffffc02017e2:	679c                	ld	a5,8(a5)
ffffffffc02017e4:	fef51ae3          	bne	a0,a5,ffffffffc02017d8 <insert_vma_struct+0x12>
ffffffffc02017e8:	02a68463          	beq	a3,a0,ffffffffc0201810 <insert_vma_struct+0x4a>
ffffffffc02017ec:	ff06b703          	ld	a4,-16(a3)
ffffffffc02017f0:	fe86b883          	ld	a7,-24(a3)
ffffffffc02017f4:	08e8f163          	bgeu	a7,a4,ffffffffc0201876 <insert_vma_struct+0xb0>
ffffffffc02017f8:	04e66f63          	bltu	a2,a4,ffffffffc0201856 <insert_vma_struct+0x90>
ffffffffc02017fc:	00f50a63          	beq	a0,a5,ffffffffc0201810 <insert_vma_struct+0x4a>
ffffffffc0201800:	fe87b703          	ld	a4,-24(a5)
ffffffffc0201804:	05076963          	bltu	a4,a6,ffffffffc0201856 <insert_vma_struct+0x90>
ffffffffc0201808:	ff07b603          	ld	a2,-16(a5)
ffffffffc020180c:	02c77363          	bgeu	a4,a2,ffffffffc0201832 <insert_vma_struct+0x6c>
ffffffffc0201810:	5118                	lw	a4,32(a0)
ffffffffc0201812:	e188                	sd	a0,0(a1)
ffffffffc0201814:	02058613          	addi	a2,a1,32
ffffffffc0201818:	e390                	sd	a2,0(a5)
ffffffffc020181a:	e690                	sd	a2,8(a3)
ffffffffc020181c:	60a2                	ld	ra,8(sp)
ffffffffc020181e:	f59c                	sd	a5,40(a1)
ffffffffc0201820:	f194                	sd	a3,32(a1)
ffffffffc0201822:	0017079b          	addiw	a5,a4,1
ffffffffc0201826:	d11c                	sw	a5,32(a0)
ffffffffc0201828:	0141                	addi	sp,sp,16
ffffffffc020182a:	8082                	ret
ffffffffc020182c:	fca690e3          	bne	a3,a0,ffffffffc02017ec <insert_vma_struct+0x26>
ffffffffc0201830:	bfd1                	j	ffffffffc0201804 <insert_vma_struct+0x3e>
ffffffffc0201832:	ee3ff0ef          	jal	ra,ffffffffc0201714 <check_vma_overlap.isra.0.part.0>
ffffffffc0201836:	00007697          	auipc	a3,0x7
ffffffffc020183a:	3ca68693          	addi	a3,a3,970 # ffffffffc0208c00 <commands+0x8d0>
ffffffffc020183e:	00007617          	auipc	a2,0x7
ffffffffc0201842:	f0260613          	addi	a2,a2,-254 # ffffffffc0208740 <commands+0x410>
ffffffffc0201846:	07400593          	li	a1,116
ffffffffc020184a:	00007517          	auipc	a0,0x7
ffffffffc020184e:	3a650513          	addi	a0,a0,934 # ffffffffc0208bf0 <commands+0x8c0>
ffffffffc0201852:	9b7fe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0201856:	00007697          	auipc	a3,0x7
ffffffffc020185a:	3ea68693          	addi	a3,a3,1002 # ffffffffc0208c40 <commands+0x910>
ffffffffc020185e:	00007617          	auipc	a2,0x7
ffffffffc0201862:	ee260613          	addi	a2,a2,-286 # ffffffffc0208740 <commands+0x410>
ffffffffc0201866:	06c00593          	li	a1,108
ffffffffc020186a:	00007517          	auipc	a0,0x7
ffffffffc020186e:	38650513          	addi	a0,a0,902 # ffffffffc0208bf0 <commands+0x8c0>
ffffffffc0201872:	997fe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0201876:	00007697          	auipc	a3,0x7
ffffffffc020187a:	3aa68693          	addi	a3,a3,938 # ffffffffc0208c20 <commands+0x8f0>
ffffffffc020187e:	00007617          	auipc	a2,0x7
ffffffffc0201882:	ec260613          	addi	a2,a2,-318 # ffffffffc0208740 <commands+0x410>
ffffffffc0201886:	06b00593          	li	a1,107
ffffffffc020188a:	00007517          	auipc	a0,0x7
ffffffffc020188e:	36650513          	addi	a0,a0,870 # ffffffffc0208bf0 <commands+0x8c0>
ffffffffc0201892:	977fe0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0201896 <mm_destroy>:
ffffffffc0201896:	591c                	lw	a5,48(a0)
ffffffffc0201898:	1141                	addi	sp,sp,-16
ffffffffc020189a:	e406                	sd	ra,8(sp)
ffffffffc020189c:	e022                	sd	s0,0(sp)
ffffffffc020189e:	e78d                	bnez	a5,ffffffffc02018c8 <mm_destroy+0x32>
ffffffffc02018a0:	842a                	mv	s0,a0
ffffffffc02018a2:	6508                	ld	a0,8(a0)
ffffffffc02018a4:	00a40c63          	beq	s0,a0,ffffffffc02018bc <mm_destroy+0x26>
ffffffffc02018a8:	6118                	ld	a4,0(a0)
ffffffffc02018aa:	651c                	ld	a5,8(a0)
ffffffffc02018ac:	1501                	addi	a0,a0,-32
ffffffffc02018ae:	e71c                	sd	a5,8(a4)
ffffffffc02018b0:	e398                	sd	a4,0(a5)
ffffffffc02018b2:	06f000ef          	jal	ra,ffffffffc0202120 <kfree>
ffffffffc02018b6:	6408                	ld	a0,8(s0)
ffffffffc02018b8:	fea418e3          	bne	s0,a0,ffffffffc02018a8 <mm_destroy+0x12>
ffffffffc02018bc:	8522                	mv	a0,s0
ffffffffc02018be:	6402                	ld	s0,0(sp)
ffffffffc02018c0:	60a2                	ld	ra,8(sp)
ffffffffc02018c2:	0141                	addi	sp,sp,16
ffffffffc02018c4:	05d0006f          	j	ffffffffc0202120 <kfree>
ffffffffc02018c8:	00007697          	auipc	a3,0x7
ffffffffc02018cc:	39868693          	addi	a3,a3,920 # ffffffffc0208c60 <commands+0x930>
ffffffffc02018d0:	00007617          	auipc	a2,0x7
ffffffffc02018d4:	e7060613          	addi	a2,a2,-400 # ffffffffc0208740 <commands+0x410>
ffffffffc02018d8:	09400593          	li	a1,148
ffffffffc02018dc:	00007517          	auipc	a0,0x7
ffffffffc02018e0:	31450513          	addi	a0,a0,788 # ffffffffc0208bf0 <commands+0x8c0>
ffffffffc02018e4:	925fe0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc02018e8 <mm_map>:
ffffffffc02018e8:	7139                	addi	sp,sp,-64
ffffffffc02018ea:	f822                	sd	s0,48(sp)
ffffffffc02018ec:	6405                	lui	s0,0x1
ffffffffc02018ee:	147d                	addi	s0,s0,-1
ffffffffc02018f0:	77fd                	lui	a5,0xfffff
ffffffffc02018f2:	9622                	add	a2,a2,s0
ffffffffc02018f4:	962e                	add	a2,a2,a1
ffffffffc02018f6:	f426                	sd	s1,40(sp)
ffffffffc02018f8:	fc06                	sd	ra,56(sp)
ffffffffc02018fa:	00f5f4b3          	and	s1,a1,a5
ffffffffc02018fe:	f04a                	sd	s2,32(sp)
ffffffffc0201900:	ec4e                	sd	s3,24(sp)
ffffffffc0201902:	e852                	sd	s4,16(sp)
ffffffffc0201904:	e456                	sd	s5,8(sp)
ffffffffc0201906:	002005b7          	lui	a1,0x200
ffffffffc020190a:	00f67433          	and	s0,a2,a5
ffffffffc020190e:	06b4e363          	bltu	s1,a1,ffffffffc0201974 <mm_map+0x8c>
ffffffffc0201912:	0684f163          	bgeu	s1,s0,ffffffffc0201974 <mm_map+0x8c>
ffffffffc0201916:	4785                	li	a5,1
ffffffffc0201918:	07fe                	slli	a5,a5,0x1f
ffffffffc020191a:	0487ed63          	bltu	a5,s0,ffffffffc0201974 <mm_map+0x8c>
ffffffffc020191e:	89aa                	mv	s3,a0
ffffffffc0201920:	cd21                	beqz	a0,ffffffffc0201978 <mm_map+0x90>
ffffffffc0201922:	85a6                	mv	a1,s1
ffffffffc0201924:	8ab6                	mv	s5,a3
ffffffffc0201926:	8a3a                	mv	s4,a4
ffffffffc0201928:	e5fff0ef          	jal	ra,ffffffffc0201786 <find_vma>
ffffffffc020192c:	c501                	beqz	a0,ffffffffc0201934 <mm_map+0x4c>
ffffffffc020192e:	651c                	ld	a5,8(a0)
ffffffffc0201930:	0487e263          	bltu	a5,s0,ffffffffc0201974 <mm_map+0x8c>
ffffffffc0201934:	03000513          	li	a0,48
ffffffffc0201938:	738000ef          	jal	ra,ffffffffc0202070 <kmalloc>
ffffffffc020193c:	892a                	mv	s2,a0
ffffffffc020193e:	5571                	li	a0,-4
ffffffffc0201940:	02090163          	beqz	s2,ffffffffc0201962 <mm_map+0x7a>
ffffffffc0201944:	854e                	mv	a0,s3
ffffffffc0201946:	00993423          	sd	s1,8(s2)
ffffffffc020194a:	00893823          	sd	s0,16(s2)
ffffffffc020194e:	01592c23          	sw	s5,24(s2)
ffffffffc0201952:	85ca                	mv	a1,s2
ffffffffc0201954:	e73ff0ef          	jal	ra,ffffffffc02017c6 <insert_vma_struct>
ffffffffc0201958:	4501                	li	a0,0
ffffffffc020195a:	000a0463          	beqz	s4,ffffffffc0201962 <mm_map+0x7a>
ffffffffc020195e:	012a3023          	sd	s2,0(s4) # 1000 <_binary_obj___user_faultread_out_size-0xd50>
ffffffffc0201962:	70e2                	ld	ra,56(sp)
ffffffffc0201964:	7442                	ld	s0,48(sp)
ffffffffc0201966:	74a2                	ld	s1,40(sp)
ffffffffc0201968:	7902                	ld	s2,32(sp)
ffffffffc020196a:	69e2                	ld	s3,24(sp)
ffffffffc020196c:	6a42                	ld	s4,16(sp)
ffffffffc020196e:	6aa2                	ld	s5,8(sp)
ffffffffc0201970:	6121                	addi	sp,sp,64
ffffffffc0201972:	8082                	ret
ffffffffc0201974:	5575                	li	a0,-3
ffffffffc0201976:	b7f5                	j	ffffffffc0201962 <mm_map+0x7a>
ffffffffc0201978:	00007697          	auipc	a3,0x7
ffffffffc020197c:	30068693          	addi	a3,a3,768 # ffffffffc0208c78 <commands+0x948>
ffffffffc0201980:	00007617          	auipc	a2,0x7
ffffffffc0201984:	dc060613          	addi	a2,a2,-576 # ffffffffc0208740 <commands+0x410>
ffffffffc0201988:	0a700593          	li	a1,167
ffffffffc020198c:	00007517          	auipc	a0,0x7
ffffffffc0201990:	26450513          	addi	a0,a0,612 # ffffffffc0208bf0 <commands+0x8c0>
ffffffffc0201994:	875fe0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0201998 <dup_mmap>:
ffffffffc0201998:	7139                	addi	sp,sp,-64
ffffffffc020199a:	fc06                	sd	ra,56(sp)
ffffffffc020199c:	f822                	sd	s0,48(sp)
ffffffffc020199e:	f426                	sd	s1,40(sp)
ffffffffc02019a0:	f04a                	sd	s2,32(sp)
ffffffffc02019a2:	ec4e                	sd	s3,24(sp)
ffffffffc02019a4:	e852                	sd	s4,16(sp)
ffffffffc02019a6:	e456                	sd	s5,8(sp)
ffffffffc02019a8:	c52d                	beqz	a0,ffffffffc0201a12 <dup_mmap+0x7a>
ffffffffc02019aa:	892a                	mv	s2,a0
ffffffffc02019ac:	84ae                	mv	s1,a1
ffffffffc02019ae:	842e                	mv	s0,a1
ffffffffc02019b0:	e595                	bnez	a1,ffffffffc02019dc <dup_mmap+0x44>
ffffffffc02019b2:	a085                	j	ffffffffc0201a12 <dup_mmap+0x7a>
ffffffffc02019b4:	854a                	mv	a0,s2
ffffffffc02019b6:	0155b423          	sd	s5,8(a1) # 200008 <_binary_obj___user_matrix_out_size+0x1fd668>
ffffffffc02019ba:	0145b823          	sd	s4,16(a1)
ffffffffc02019be:	0135ac23          	sw	s3,24(a1)
ffffffffc02019c2:	e05ff0ef          	jal	ra,ffffffffc02017c6 <insert_vma_struct>
ffffffffc02019c6:	ff043683          	ld	a3,-16(s0) # ff0 <_binary_obj___user_faultread_out_size-0xd60>
ffffffffc02019ca:	fe843603          	ld	a2,-24(s0)
ffffffffc02019ce:	6c8c                	ld	a1,24(s1)
ffffffffc02019d0:	01893503          	ld	a0,24(s2)
ffffffffc02019d4:	4701                	li	a4,0
ffffffffc02019d6:	a7bff0ef          	jal	ra,ffffffffc0201450 <copy_range>
ffffffffc02019da:	e105                	bnez	a0,ffffffffc02019fa <dup_mmap+0x62>
ffffffffc02019dc:	6000                	ld	s0,0(s0)
ffffffffc02019de:	02848863          	beq	s1,s0,ffffffffc0201a0e <dup_mmap+0x76>
ffffffffc02019e2:	03000513          	li	a0,48
ffffffffc02019e6:	fe843a83          	ld	s5,-24(s0)
ffffffffc02019ea:	ff043a03          	ld	s4,-16(s0)
ffffffffc02019ee:	ff842983          	lw	s3,-8(s0)
ffffffffc02019f2:	67e000ef          	jal	ra,ffffffffc0202070 <kmalloc>
ffffffffc02019f6:	85aa                	mv	a1,a0
ffffffffc02019f8:	fd55                	bnez	a0,ffffffffc02019b4 <dup_mmap+0x1c>
ffffffffc02019fa:	5571                	li	a0,-4
ffffffffc02019fc:	70e2                	ld	ra,56(sp)
ffffffffc02019fe:	7442                	ld	s0,48(sp)
ffffffffc0201a00:	74a2                	ld	s1,40(sp)
ffffffffc0201a02:	7902                	ld	s2,32(sp)
ffffffffc0201a04:	69e2                	ld	s3,24(sp)
ffffffffc0201a06:	6a42                	ld	s4,16(sp)
ffffffffc0201a08:	6aa2                	ld	s5,8(sp)
ffffffffc0201a0a:	6121                	addi	sp,sp,64
ffffffffc0201a0c:	8082                	ret
ffffffffc0201a0e:	4501                	li	a0,0
ffffffffc0201a10:	b7f5                	j	ffffffffc02019fc <dup_mmap+0x64>
ffffffffc0201a12:	00007697          	auipc	a3,0x7
ffffffffc0201a16:	27668693          	addi	a3,a3,630 # ffffffffc0208c88 <commands+0x958>
ffffffffc0201a1a:	00007617          	auipc	a2,0x7
ffffffffc0201a1e:	d2660613          	addi	a2,a2,-730 # ffffffffc0208740 <commands+0x410>
ffffffffc0201a22:	0c000593          	li	a1,192
ffffffffc0201a26:	00007517          	auipc	a0,0x7
ffffffffc0201a2a:	1ca50513          	addi	a0,a0,458 # ffffffffc0208bf0 <commands+0x8c0>
ffffffffc0201a2e:	fdafe0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0201a32 <exit_mmap>:
ffffffffc0201a32:	1101                	addi	sp,sp,-32
ffffffffc0201a34:	ec06                	sd	ra,24(sp)
ffffffffc0201a36:	e822                	sd	s0,16(sp)
ffffffffc0201a38:	e426                	sd	s1,8(sp)
ffffffffc0201a3a:	e04a                	sd	s2,0(sp)
ffffffffc0201a3c:	c531                	beqz	a0,ffffffffc0201a88 <exit_mmap+0x56>
ffffffffc0201a3e:	591c                	lw	a5,48(a0)
ffffffffc0201a40:	84aa                	mv	s1,a0
ffffffffc0201a42:	e3b9                	bnez	a5,ffffffffc0201a88 <exit_mmap+0x56>
ffffffffc0201a44:	6500                	ld	s0,8(a0)
ffffffffc0201a46:	01853903          	ld	s2,24(a0)
ffffffffc0201a4a:	02850663          	beq	a0,s0,ffffffffc0201a76 <exit_mmap+0x44>
ffffffffc0201a4e:	ff043603          	ld	a2,-16(s0)
ffffffffc0201a52:	fe843583          	ld	a1,-24(s0)
ffffffffc0201a56:	854a                	mv	a0,s2
ffffffffc0201a58:	f28ff0ef          	jal	ra,ffffffffc0201180 <unmap_range>
ffffffffc0201a5c:	6400                	ld	s0,8(s0)
ffffffffc0201a5e:	fe8498e3          	bne	s1,s0,ffffffffc0201a4e <exit_mmap+0x1c>
ffffffffc0201a62:	6400                	ld	s0,8(s0)
ffffffffc0201a64:	00848c63          	beq	s1,s0,ffffffffc0201a7c <exit_mmap+0x4a>
ffffffffc0201a68:	ff043603          	ld	a2,-16(s0)
ffffffffc0201a6c:	fe843583          	ld	a1,-24(s0)
ffffffffc0201a70:	854a                	mv	a0,s2
ffffffffc0201a72:	825ff0ef          	jal	ra,ffffffffc0201296 <exit_range>
ffffffffc0201a76:	6400                	ld	s0,8(s0)
ffffffffc0201a78:	fe8498e3          	bne	s1,s0,ffffffffc0201a68 <exit_mmap+0x36>
ffffffffc0201a7c:	60e2                	ld	ra,24(sp)
ffffffffc0201a7e:	6442                	ld	s0,16(sp)
ffffffffc0201a80:	64a2                	ld	s1,8(sp)
ffffffffc0201a82:	6902                	ld	s2,0(sp)
ffffffffc0201a84:	6105                	addi	sp,sp,32
ffffffffc0201a86:	8082                	ret
ffffffffc0201a88:	00007697          	auipc	a3,0x7
ffffffffc0201a8c:	22068693          	addi	a3,a3,544 # ffffffffc0208ca8 <commands+0x978>
ffffffffc0201a90:	00007617          	auipc	a2,0x7
ffffffffc0201a94:	cb060613          	addi	a2,a2,-848 # ffffffffc0208740 <commands+0x410>
ffffffffc0201a98:	0d600593          	li	a1,214
ffffffffc0201a9c:	00007517          	auipc	a0,0x7
ffffffffc0201aa0:	15450513          	addi	a0,a0,340 # ffffffffc0208bf0 <commands+0x8c0>
ffffffffc0201aa4:	f64fe0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0201aa8 <vmm_init>:
ffffffffc0201aa8:	8082                	ret

ffffffffc0201aaa <do_pgfault>:
ffffffffc0201aaa:	7139                	addi	sp,sp,-64
ffffffffc0201aac:	85b2                	mv	a1,a2
ffffffffc0201aae:	f822                	sd	s0,48(sp)
ffffffffc0201ab0:	f426                	sd	s1,40(sp)
ffffffffc0201ab2:	fc06                	sd	ra,56(sp)
ffffffffc0201ab4:	f04a                	sd	s2,32(sp)
ffffffffc0201ab6:	ec4e                	sd	s3,24(sp)
ffffffffc0201ab8:	8432                	mv	s0,a2
ffffffffc0201aba:	84aa                	mv	s1,a0
ffffffffc0201abc:	ccbff0ef          	jal	ra,ffffffffc0201786 <find_vma>
ffffffffc0201ac0:	0003e797          	auipc	a5,0x3e
ffffffffc0201ac4:	4087a783          	lw	a5,1032(a5) # ffffffffc023fec8 <pgfault_num>
ffffffffc0201ac8:	2785                	addiw	a5,a5,1
ffffffffc0201aca:	0003e717          	auipc	a4,0x3e
ffffffffc0201ace:	3ef72f23          	sw	a5,1022(a4) # ffffffffc023fec8 <pgfault_num>
ffffffffc0201ad2:	c545                	beqz	a0,ffffffffc0201b7a <do_pgfault+0xd0>
ffffffffc0201ad4:	651c                	ld	a5,8(a0)
ffffffffc0201ad6:	0af46263          	bltu	s0,a5,ffffffffc0201b7a <do_pgfault+0xd0>
ffffffffc0201ada:	4d1c                	lw	a5,24(a0)
ffffffffc0201adc:	49c1                	li	s3,16
ffffffffc0201ade:	8b89                	andi	a5,a5,2
ffffffffc0201ae0:	efb1                	bnez	a5,ffffffffc0201b3c <do_pgfault+0x92>
ffffffffc0201ae2:	75fd                	lui	a1,0xfffff
ffffffffc0201ae4:	6c88                	ld	a0,24(s1)
ffffffffc0201ae6:	8c6d                	and	s0,s0,a1
ffffffffc0201ae8:	4605                	li	a2,1
ffffffffc0201aea:	85a2                	mv	a1,s0
ffffffffc0201aec:	cc2ff0ef          	jal	ra,ffffffffc0200fae <get_pte>
ffffffffc0201af0:	c555                	beqz	a0,ffffffffc0201b9c <do_pgfault+0xf2>
ffffffffc0201af2:	610c                	ld	a1,0(a0)
ffffffffc0201af4:	c5a5                	beqz	a1,ffffffffc0201b5c <do_pgfault+0xb2>
ffffffffc0201af6:	0003e797          	auipc	a5,0x3e
ffffffffc0201afa:	3e27a783          	lw	a5,994(a5) # ffffffffc023fed8 <swap_init_ok>
ffffffffc0201afe:	c7d9                	beqz	a5,ffffffffc0201b8c <do_pgfault+0xe2>
ffffffffc0201b00:	0030                	addi	a2,sp,8
ffffffffc0201b02:	85a2                	mv	a1,s0
ffffffffc0201b04:	8526                	mv	a0,s1
ffffffffc0201b06:	e402                	sd	zero,8(sp)
ffffffffc0201b08:	2ee000ef          	jal	ra,ffffffffc0201df6 <swap_in>
ffffffffc0201b0c:	892a                	mv	s2,a0
ffffffffc0201b0e:	e90d                	bnez	a0,ffffffffc0201b40 <do_pgfault+0x96>
ffffffffc0201b10:	65a2                	ld	a1,8(sp)
ffffffffc0201b12:	6c88                	ld	a0,24(s1)
ffffffffc0201b14:	86ce                	mv	a3,s3
ffffffffc0201b16:	8622                	mv	a2,s0
ffffffffc0201b18:	87dff0ef          	jal	ra,ffffffffc0201394 <page_insert>
ffffffffc0201b1c:	6622                	ld	a2,8(sp)
ffffffffc0201b1e:	4685                	li	a3,1
ffffffffc0201b20:	85a2                	mv	a1,s0
ffffffffc0201b22:	8526                	mv	a0,s1
ffffffffc0201b24:	1b0000ef          	jal	ra,ffffffffc0201cd4 <swap_map_swappable>
ffffffffc0201b28:	67a2                	ld	a5,8(sp)
ffffffffc0201b2a:	ff80                	sd	s0,56(a5)
ffffffffc0201b2c:	70e2                	ld	ra,56(sp)
ffffffffc0201b2e:	7442                	ld	s0,48(sp)
ffffffffc0201b30:	74a2                	ld	s1,40(sp)
ffffffffc0201b32:	69e2                	ld	s3,24(sp)
ffffffffc0201b34:	854a                	mv	a0,s2
ffffffffc0201b36:	7902                	ld	s2,32(sp)
ffffffffc0201b38:	6121                	addi	sp,sp,64
ffffffffc0201b3a:	8082                	ret
ffffffffc0201b3c:	49dd                	li	s3,23
ffffffffc0201b3e:	b755                	j	ffffffffc0201ae2 <do_pgfault+0x38>
ffffffffc0201b40:	00007517          	auipc	a0,0x7
ffffffffc0201b44:	20050513          	addi	a0,a0,512 # ffffffffc0208d40 <commands+0xa10>
ffffffffc0201b48:	d84fe0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0201b4c:	70e2                	ld	ra,56(sp)
ffffffffc0201b4e:	7442                	ld	s0,48(sp)
ffffffffc0201b50:	74a2                	ld	s1,40(sp)
ffffffffc0201b52:	69e2                	ld	s3,24(sp)
ffffffffc0201b54:	854a                	mv	a0,s2
ffffffffc0201b56:	7902                	ld	s2,32(sp)
ffffffffc0201b58:	6121                	addi	sp,sp,64
ffffffffc0201b5a:	8082                	ret
ffffffffc0201b5c:	6c88                	ld	a0,24(s1)
ffffffffc0201b5e:	864e                	mv	a2,s3
ffffffffc0201b60:	85a2                	mv	a1,s0
ffffffffc0201b62:	b25ff0ef          	jal	ra,ffffffffc0201686 <pgdir_alloc_page>
ffffffffc0201b66:	4901                	li	s2,0
ffffffffc0201b68:	f171                	bnez	a0,ffffffffc0201b2c <do_pgfault+0x82>
ffffffffc0201b6a:	00007517          	auipc	a0,0x7
ffffffffc0201b6e:	1ae50513          	addi	a0,a0,430 # ffffffffc0208d18 <commands+0x9e8>
ffffffffc0201b72:	d5afe0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0201b76:	5971                	li	s2,-4
ffffffffc0201b78:	bf55                	j	ffffffffc0201b2c <do_pgfault+0x82>
ffffffffc0201b7a:	85a2                	mv	a1,s0
ffffffffc0201b7c:	00007517          	auipc	a0,0x7
ffffffffc0201b80:	14c50513          	addi	a0,a0,332 # ffffffffc0208cc8 <commands+0x998>
ffffffffc0201b84:	d48fe0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0201b88:	5975                	li	s2,-3
ffffffffc0201b8a:	b74d                	j	ffffffffc0201b2c <do_pgfault+0x82>
ffffffffc0201b8c:	00007517          	auipc	a0,0x7
ffffffffc0201b90:	1d450513          	addi	a0,a0,468 # ffffffffc0208d60 <commands+0xa30>
ffffffffc0201b94:	d38fe0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0201b98:	5971                	li	s2,-4
ffffffffc0201b9a:	bf49                	j	ffffffffc0201b2c <do_pgfault+0x82>
ffffffffc0201b9c:	00007517          	auipc	a0,0x7
ffffffffc0201ba0:	15c50513          	addi	a0,a0,348 # ffffffffc0208cf8 <commands+0x9c8>
ffffffffc0201ba4:	d28fe0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0201ba8:	5971                	li	s2,-4
ffffffffc0201baa:	b749                	j	ffffffffc0201b2c <do_pgfault+0x82>

ffffffffc0201bac <user_mem_check>:
ffffffffc0201bac:	7179                	addi	sp,sp,-48
ffffffffc0201bae:	f022                	sd	s0,32(sp)
ffffffffc0201bb0:	f406                	sd	ra,40(sp)
ffffffffc0201bb2:	ec26                	sd	s1,24(sp)
ffffffffc0201bb4:	e84a                	sd	s2,16(sp)
ffffffffc0201bb6:	e44e                	sd	s3,8(sp)
ffffffffc0201bb8:	e052                	sd	s4,0(sp)
ffffffffc0201bba:	842e                	mv	s0,a1
ffffffffc0201bbc:	c135                	beqz	a0,ffffffffc0201c20 <user_mem_check+0x74>
ffffffffc0201bbe:	002007b7          	lui	a5,0x200
ffffffffc0201bc2:	04f5e663          	bltu	a1,a5,ffffffffc0201c0e <user_mem_check+0x62>
ffffffffc0201bc6:	00c584b3          	add	s1,a1,a2
ffffffffc0201bca:	0495f263          	bgeu	a1,s1,ffffffffc0201c0e <user_mem_check+0x62>
ffffffffc0201bce:	4785                	li	a5,1
ffffffffc0201bd0:	07fe                	slli	a5,a5,0x1f
ffffffffc0201bd2:	0297ee63          	bltu	a5,s1,ffffffffc0201c0e <user_mem_check+0x62>
ffffffffc0201bd6:	892a                	mv	s2,a0
ffffffffc0201bd8:	89b6                	mv	s3,a3
ffffffffc0201bda:	6a05                	lui	s4,0x1
ffffffffc0201bdc:	a821                	j	ffffffffc0201bf4 <user_mem_check+0x48>
ffffffffc0201bde:	0027f693          	andi	a3,a5,2
ffffffffc0201be2:	9752                	add	a4,a4,s4
ffffffffc0201be4:	8ba1                	andi	a5,a5,8
ffffffffc0201be6:	c685                	beqz	a3,ffffffffc0201c0e <user_mem_check+0x62>
ffffffffc0201be8:	c399                	beqz	a5,ffffffffc0201bee <user_mem_check+0x42>
ffffffffc0201bea:	02e46263          	bltu	s0,a4,ffffffffc0201c0e <user_mem_check+0x62>
ffffffffc0201bee:	6900                	ld	s0,16(a0)
ffffffffc0201bf0:	04947663          	bgeu	s0,s1,ffffffffc0201c3c <user_mem_check+0x90>
ffffffffc0201bf4:	85a2                	mv	a1,s0
ffffffffc0201bf6:	854a                	mv	a0,s2
ffffffffc0201bf8:	b8fff0ef          	jal	ra,ffffffffc0201786 <find_vma>
ffffffffc0201bfc:	c909                	beqz	a0,ffffffffc0201c0e <user_mem_check+0x62>
ffffffffc0201bfe:	6518                	ld	a4,8(a0)
ffffffffc0201c00:	00e46763          	bltu	s0,a4,ffffffffc0201c0e <user_mem_check+0x62>
ffffffffc0201c04:	4d1c                	lw	a5,24(a0)
ffffffffc0201c06:	fc099ce3          	bnez	s3,ffffffffc0201bde <user_mem_check+0x32>
ffffffffc0201c0a:	8b85                	andi	a5,a5,1
ffffffffc0201c0c:	f3ed                	bnez	a5,ffffffffc0201bee <user_mem_check+0x42>
ffffffffc0201c0e:	4501                	li	a0,0
ffffffffc0201c10:	70a2                	ld	ra,40(sp)
ffffffffc0201c12:	7402                	ld	s0,32(sp)
ffffffffc0201c14:	64e2                	ld	s1,24(sp)
ffffffffc0201c16:	6942                	ld	s2,16(sp)
ffffffffc0201c18:	69a2                	ld	s3,8(sp)
ffffffffc0201c1a:	6a02                	ld	s4,0(sp)
ffffffffc0201c1c:	6145                	addi	sp,sp,48
ffffffffc0201c1e:	8082                	ret
ffffffffc0201c20:	c02007b7          	lui	a5,0xc0200
ffffffffc0201c24:	4501                	li	a0,0
ffffffffc0201c26:	fef5e5e3          	bltu	a1,a5,ffffffffc0201c10 <user_mem_check+0x64>
ffffffffc0201c2a:	962e                	add	a2,a2,a1
ffffffffc0201c2c:	fec5f2e3          	bgeu	a1,a2,ffffffffc0201c10 <user_mem_check+0x64>
ffffffffc0201c30:	c8000537          	lui	a0,0xc8000
ffffffffc0201c34:	0505                	addi	a0,a0,1
ffffffffc0201c36:	00a63533          	sltu	a0,a2,a0
ffffffffc0201c3a:	bfd9                	j	ffffffffc0201c10 <user_mem_check+0x64>
ffffffffc0201c3c:	4505                	li	a0,1
ffffffffc0201c3e:	bfc9                	j	ffffffffc0201c10 <user_mem_check+0x64>

ffffffffc0201c40 <swap_init>:
ffffffffc0201c40:	1101                	addi	sp,sp,-32
ffffffffc0201c42:	ec06                	sd	ra,24(sp)
ffffffffc0201c44:	e822                	sd	s0,16(sp)
ffffffffc0201c46:	e426                	sd	s1,8(sp)
ffffffffc0201c48:	243010ef          	jal	ra,ffffffffc020368a <swapfs_init>
ffffffffc0201c4c:	0003e697          	auipc	a3,0x3e
ffffffffc0201c50:	3846b683          	ld	a3,900(a3) # ffffffffc023ffd0 <max_swap_offset>
ffffffffc0201c54:	010007b7          	lui	a5,0x1000
ffffffffc0201c58:	ff968713          	addi	a4,a3,-7
ffffffffc0201c5c:	17e1                	addi	a5,a5,-8
ffffffffc0201c5e:	04e7e863          	bltu	a5,a4,ffffffffc0201cae <swap_init+0x6e>
ffffffffc0201c62:	00033797          	auipc	a5,0x33
ffffffffc0201c66:	d9678793          	addi	a5,a5,-618 # ffffffffc02349f8 <swap_manager_fifo>
ffffffffc0201c6a:	6798                	ld	a4,8(a5)
ffffffffc0201c6c:	0003e497          	auipc	s1,0x3e
ffffffffc0201c70:	26448493          	addi	s1,s1,612 # ffffffffc023fed0 <sm>
ffffffffc0201c74:	e09c                	sd	a5,0(s1)
ffffffffc0201c76:	9702                	jalr	a4
ffffffffc0201c78:	842a                	mv	s0,a0
ffffffffc0201c7a:	c519                	beqz	a0,ffffffffc0201c88 <swap_init+0x48>
ffffffffc0201c7c:	60e2                	ld	ra,24(sp)
ffffffffc0201c7e:	8522                	mv	a0,s0
ffffffffc0201c80:	6442                	ld	s0,16(sp)
ffffffffc0201c82:	64a2                	ld	s1,8(sp)
ffffffffc0201c84:	6105                	addi	sp,sp,32
ffffffffc0201c86:	8082                	ret
ffffffffc0201c88:	609c                	ld	a5,0(s1)
ffffffffc0201c8a:	00007517          	auipc	a0,0x7
ffffffffc0201c8e:	12e50513          	addi	a0,a0,302 # ffffffffc0208db8 <commands+0xa88>
ffffffffc0201c92:	638c                	ld	a1,0(a5)
ffffffffc0201c94:	4785                	li	a5,1
ffffffffc0201c96:	0003e717          	auipc	a4,0x3e
ffffffffc0201c9a:	24f72123          	sw	a5,578(a4) # ffffffffc023fed8 <swap_init_ok>
ffffffffc0201c9e:	c2efe0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0201ca2:	60e2                	ld	ra,24(sp)
ffffffffc0201ca4:	8522                	mv	a0,s0
ffffffffc0201ca6:	6442                	ld	s0,16(sp)
ffffffffc0201ca8:	64a2                	ld	s1,8(sp)
ffffffffc0201caa:	6105                	addi	sp,sp,32
ffffffffc0201cac:	8082                	ret
ffffffffc0201cae:	00007617          	auipc	a2,0x7
ffffffffc0201cb2:	0da60613          	addi	a2,a2,218 # ffffffffc0208d88 <commands+0xa58>
ffffffffc0201cb6:	02800593          	li	a1,40
ffffffffc0201cba:	00007517          	auipc	a0,0x7
ffffffffc0201cbe:	0ee50513          	addi	a0,a0,238 # ffffffffc0208da8 <commands+0xa78>
ffffffffc0201cc2:	d46fe0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0201cc6 <swap_init_mm>:
ffffffffc0201cc6:	0003e797          	auipc	a5,0x3e
ffffffffc0201cca:	20a7b783          	ld	a5,522(a5) # ffffffffc023fed0 <sm>
ffffffffc0201cce:	0107b303          	ld	t1,16(a5)
ffffffffc0201cd2:	8302                	jr	t1

ffffffffc0201cd4 <swap_map_swappable>:
ffffffffc0201cd4:	0003e797          	auipc	a5,0x3e
ffffffffc0201cd8:	1fc7b783          	ld	a5,508(a5) # ffffffffc023fed0 <sm>
ffffffffc0201cdc:	0207b303          	ld	t1,32(a5)
ffffffffc0201ce0:	8302                	jr	t1

ffffffffc0201ce2 <swap_out>:
ffffffffc0201ce2:	711d                	addi	sp,sp,-96
ffffffffc0201ce4:	ec86                	sd	ra,88(sp)
ffffffffc0201ce6:	e8a2                	sd	s0,80(sp)
ffffffffc0201ce8:	e4a6                	sd	s1,72(sp)
ffffffffc0201cea:	e0ca                	sd	s2,64(sp)
ffffffffc0201cec:	fc4e                	sd	s3,56(sp)
ffffffffc0201cee:	f852                	sd	s4,48(sp)
ffffffffc0201cf0:	f456                	sd	s5,40(sp)
ffffffffc0201cf2:	f05a                	sd	s6,32(sp)
ffffffffc0201cf4:	ec5e                	sd	s7,24(sp)
ffffffffc0201cf6:	e862                	sd	s8,16(sp)
ffffffffc0201cf8:	cde9                	beqz	a1,ffffffffc0201dd2 <swap_out+0xf0>
ffffffffc0201cfa:	8a2e                	mv	s4,a1
ffffffffc0201cfc:	892a                	mv	s2,a0
ffffffffc0201cfe:	8ab2                	mv	s5,a2
ffffffffc0201d00:	4401                	li	s0,0
ffffffffc0201d02:	0003e997          	auipc	s3,0x3e
ffffffffc0201d06:	1ce98993          	addi	s3,s3,462 # ffffffffc023fed0 <sm>
ffffffffc0201d0a:	00007b17          	auipc	s6,0x7
ffffffffc0201d0e:	126b0b13          	addi	s6,s6,294 # ffffffffc0208e30 <commands+0xb00>
ffffffffc0201d12:	00007b97          	auipc	s7,0x7
ffffffffc0201d16:	106b8b93          	addi	s7,s7,262 # ffffffffc0208e18 <commands+0xae8>
ffffffffc0201d1a:	a825                	j	ffffffffc0201d52 <swap_out+0x70>
ffffffffc0201d1c:	67a2                	ld	a5,8(sp)
ffffffffc0201d1e:	8626                	mv	a2,s1
ffffffffc0201d20:	85a2                	mv	a1,s0
ffffffffc0201d22:	7f94                	ld	a3,56(a5)
ffffffffc0201d24:	855a                	mv	a0,s6
ffffffffc0201d26:	2405                	addiw	s0,s0,1
ffffffffc0201d28:	82b1                	srli	a3,a3,0xc
ffffffffc0201d2a:	0685                	addi	a3,a3,1
ffffffffc0201d2c:	ba0fe0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0201d30:	6522                	ld	a0,8(sp)
ffffffffc0201d32:	4585                	li	a1,1
ffffffffc0201d34:	7d1c                	ld	a5,56(a0)
ffffffffc0201d36:	83b1                	srli	a5,a5,0xc
ffffffffc0201d38:	0785                	addi	a5,a5,1
ffffffffc0201d3a:	07a2                	slli	a5,a5,0x8
ffffffffc0201d3c:	00fc3023          	sd	a5,0(s8)
ffffffffc0201d40:	89cff0ef          	jal	ra,ffffffffc0200ddc <free_pages>
ffffffffc0201d44:	01893503          	ld	a0,24(s2)
ffffffffc0201d48:	85a6                	mv	a1,s1
ffffffffc0201d4a:	937ff0ef          	jal	ra,ffffffffc0201680 <tlb_invalidate>
ffffffffc0201d4e:	048a0d63          	beq	s4,s0,ffffffffc0201da8 <swap_out+0xc6>
ffffffffc0201d52:	0009b783          	ld	a5,0(s3)
ffffffffc0201d56:	8656                	mv	a2,s5
ffffffffc0201d58:	002c                	addi	a1,sp,8
ffffffffc0201d5a:	7b9c                	ld	a5,48(a5)
ffffffffc0201d5c:	854a                	mv	a0,s2
ffffffffc0201d5e:	9782                	jalr	a5
ffffffffc0201d60:	e12d                	bnez	a0,ffffffffc0201dc2 <swap_out+0xe0>
ffffffffc0201d62:	67a2                	ld	a5,8(sp)
ffffffffc0201d64:	01893503          	ld	a0,24(s2)
ffffffffc0201d68:	4601                	li	a2,0
ffffffffc0201d6a:	7f84                	ld	s1,56(a5)
ffffffffc0201d6c:	85a6                	mv	a1,s1
ffffffffc0201d6e:	a40ff0ef          	jal	ra,ffffffffc0200fae <get_pte>
ffffffffc0201d72:	611c                	ld	a5,0(a0)
ffffffffc0201d74:	8c2a                	mv	s8,a0
ffffffffc0201d76:	8b85                	andi	a5,a5,1
ffffffffc0201d78:	cfb9                	beqz	a5,ffffffffc0201dd6 <swap_out+0xf4>
ffffffffc0201d7a:	65a2                	ld	a1,8(sp)
ffffffffc0201d7c:	7d9c                	ld	a5,56(a1)
ffffffffc0201d7e:	83b1                	srli	a5,a5,0xc
ffffffffc0201d80:	0785                	addi	a5,a5,1
ffffffffc0201d82:	00879513          	slli	a0,a5,0x8
ffffffffc0201d86:	1cb010ef          	jal	ra,ffffffffc0203750 <swapfs_write>
ffffffffc0201d8a:	d949                	beqz	a0,ffffffffc0201d1c <swap_out+0x3a>
ffffffffc0201d8c:	855e                	mv	a0,s7
ffffffffc0201d8e:	b3efe0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0201d92:	0009b783          	ld	a5,0(s3)
ffffffffc0201d96:	6622                	ld	a2,8(sp)
ffffffffc0201d98:	4681                	li	a3,0
ffffffffc0201d9a:	739c                	ld	a5,32(a5)
ffffffffc0201d9c:	85a6                	mv	a1,s1
ffffffffc0201d9e:	854a                	mv	a0,s2
ffffffffc0201da0:	2405                	addiw	s0,s0,1
ffffffffc0201da2:	9782                	jalr	a5
ffffffffc0201da4:	fa8a17e3          	bne	s4,s0,ffffffffc0201d52 <swap_out+0x70>
ffffffffc0201da8:	60e6                	ld	ra,88(sp)
ffffffffc0201daa:	8522                	mv	a0,s0
ffffffffc0201dac:	6446                	ld	s0,80(sp)
ffffffffc0201dae:	64a6                	ld	s1,72(sp)
ffffffffc0201db0:	6906                	ld	s2,64(sp)
ffffffffc0201db2:	79e2                	ld	s3,56(sp)
ffffffffc0201db4:	7a42                	ld	s4,48(sp)
ffffffffc0201db6:	7aa2                	ld	s5,40(sp)
ffffffffc0201db8:	7b02                	ld	s6,32(sp)
ffffffffc0201dba:	6be2                	ld	s7,24(sp)
ffffffffc0201dbc:	6c42                	ld	s8,16(sp)
ffffffffc0201dbe:	6125                	addi	sp,sp,96
ffffffffc0201dc0:	8082                	ret
ffffffffc0201dc2:	85a2                	mv	a1,s0
ffffffffc0201dc4:	00007517          	auipc	a0,0x7
ffffffffc0201dc8:	00c50513          	addi	a0,a0,12 # ffffffffc0208dd0 <commands+0xaa0>
ffffffffc0201dcc:	b00fe0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0201dd0:	bfe1                	j	ffffffffc0201da8 <swap_out+0xc6>
ffffffffc0201dd2:	4401                	li	s0,0
ffffffffc0201dd4:	bfd1                	j	ffffffffc0201da8 <swap_out+0xc6>
ffffffffc0201dd6:	00007697          	auipc	a3,0x7
ffffffffc0201dda:	02a68693          	addi	a3,a3,42 # ffffffffc0208e00 <commands+0xad0>
ffffffffc0201dde:	00007617          	auipc	a2,0x7
ffffffffc0201de2:	96260613          	addi	a2,a2,-1694 # ffffffffc0208740 <commands+0x410>
ffffffffc0201de6:	06800593          	li	a1,104
ffffffffc0201dea:	00007517          	auipc	a0,0x7
ffffffffc0201dee:	fbe50513          	addi	a0,a0,-66 # ffffffffc0208da8 <commands+0xa78>
ffffffffc0201df2:	c16fe0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0201df6 <swap_in>:
ffffffffc0201df6:	7179                	addi	sp,sp,-48
ffffffffc0201df8:	e84a                	sd	s2,16(sp)
ffffffffc0201dfa:	892a                	mv	s2,a0
ffffffffc0201dfc:	4505                	li	a0,1
ffffffffc0201dfe:	ec26                	sd	s1,24(sp)
ffffffffc0201e00:	e44e                	sd	s3,8(sp)
ffffffffc0201e02:	f406                	sd	ra,40(sp)
ffffffffc0201e04:	f022                	sd	s0,32(sp)
ffffffffc0201e06:	84ae                	mv	s1,a1
ffffffffc0201e08:	89b2                	mv	s3,a2
ffffffffc0201e0a:	f41fe0ef          	jal	ra,ffffffffc0200d4a <alloc_pages>
ffffffffc0201e0e:	c129                	beqz	a0,ffffffffc0201e50 <swap_in+0x5a>
ffffffffc0201e10:	842a                	mv	s0,a0
ffffffffc0201e12:	01893503          	ld	a0,24(s2)
ffffffffc0201e16:	4601                	li	a2,0
ffffffffc0201e18:	85a6                	mv	a1,s1
ffffffffc0201e1a:	994ff0ef          	jal	ra,ffffffffc0200fae <get_pte>
ffffffffc0201e1e:	892a                	mv	s2,a0
ffffffffc0201e20:	6108                	ld	a0,0(a0)
ffffffffc0201e22:	85a2                	mv	a1,s0
ffffffffc0201e24:	09f010ef          	jal	ra,ffffffffc02036c2 <swapfs_read>
ffffffffc0201e28:	00093583          	ld	a1,0(s2)
ffffffffc0201e2c:	8626                	mv	a2,s1
ffffffffc0201e2e:	00007517          	auipc	a0,0x7
ffffffffc0201e32:	05250513          	addi	a0,a0,82 # ffffffffc0208e80 <commands+0xb50>
ffffffffc0201e36:	81a1                	srli	a1,a1,0x8
ffffffffc0201e38:	a94fe0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0201e3c:	70a2                	ld	ra,40(sp)
ffffffffc0201e3e:	0089b023          	sd	s0,0(s3)
ffffffffc0201e42:	7402                	ld	s0,32(sp)
ffffffffc0201e44:	64e2                	ld	s1,24(sp)
ffffffffc0201e46:	6942                	ld	s2,16(sp)
ffffffffc0201e48:	69a2                	ld	s3,8(sp)
ffffffffc0201e4a:	4501                	li	a0,0
ffffffffc0201e4c:	6145                	addi	sp,sp,48
ffffffffc0201e4e:	8082                	ret
ffffffffc0201e50:	00007697          	auipc	a3,0x7
ffffffffc0201e54:	02068693          	addi	a3,a3,32 # ffffffffc0208e70 <commands+0xb40>
ffffffffc0201e58:	00007617          	auipc	a2,0x7
ffffffffc0201e5c:	8e860613          	addi	a2,a2,-1816 # ffffffffc0208740 <commands+0x410>
ffffffffc0201e60:	07e00593          	li	a1,126
ffffffffc0201e64:	00007517          	auipc	a0,0x7
ffffffffc0201e68:	f4450513          	addi	a0,a0,-188 # ffffffffc0208da8 <commands+0xa78>
ffffffffc0201e6c:	b9cfe0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0201e70 <slob_free>:
ffffffffc0201e70:	c145                	beqz	a0,ffffffffc0201f10 <slob_free+0xa0>
ffffffffc0201e72:	1141                	addi	sp,sp,-16
ffffffffc0201e74:	e022                	sd	s0,0(sp)
ffffffffc0201e76:	e406                	sd	ra,8(sp)
ffffffffc0201e78:	842a                	mv	s0,a0
ffffffffc0201e7a:	edb1                	bnez	a1,ffffffffc0201ed6 <slob_free+0x66>
ffffffffc0201e7c:	100027f3          	csrr	a5,sstatus
ffffffffc0201e80:	8b89                	andi	a5,a5,2
ffffffffc0201e82:	4501                	li	a0,0
ffffffffc0201e84:	e3ad                	bnez	a5,ffffffffc0201ee6 <slob_free+0x76>
ffffffffc0201e86:	00033617          	auipc	a2,0x33
ffffffffc0201e8a:	be260613          	addi	a2,a2,-1054 # ffffffffc0234a68 <slobfree>
ffffffffc0201e8e:	621c                	ld	a5,0(a2)
ffffffffc0201e90:	6798                	ld	a4,8(a5)
ffffffffc0201e92:	0087fa63          	bgeu	a5,s0,ffffffffc0201ea6 <slob_free+0x36>
ffffffffc0201e96:	00e46c63          	bltu	s0,a4,ffffffffc0201eae <slob_free+0x3e>
ffffffffc0201e9a:	00e7fa63          	bgeu	a5,a4,ffffffffc0201eae <slob_free+0x3e>
ffffffffc0201e9e:	87ba                	mv	a5,a4
ffffffffc0201ea0:	6798                	ld	a4,8(a5)
ffffffffc0201ea2:	fe87eae3          	bltu	a5,s0,ffffffffc0201e96 <slob_free+0x26>
ffffffffc0201ea6:	fee7ece3          	bltu	a5,a4,ffffffffc0201e9e <slob_free+0x2e>
ffffffffc0201eaa:	fee47ae3          	bgeu	s0,a4,ffffffffc0201e9e <slob_free+0x2e>
ffffffffc0201eae:	400c                	lw	a1,0(s0)
ffffffffc0201eb0:	00459693          	slli	a3,a1,0x4
ffffffffc0201eb4:	96a2                	add	a3,a3,s0
ffffffffc0201eb6:	04d70763          	beq	a4,a3,ffffffffc0201f04 <slob_free+0x94>
ffffffffc0201eba:	e418                	sd	a4,8(s0)
ffffffffc0201ebc:	4394                	lw	a3,0(a5)
ffffffffc0201ebe:	00469713          	slli	a4,a3,0x4
ffffffffc0201ec2:	973e                	add	a4,a4,a5
ffffffffc0201ec4:	02e40a63          	beq	s0,a4,ffffffffc0201ef8 <slob_free+0x88>
ffffffffc0201ec8:	e780                	sd	s0,8(a5)
ffffffffc0201eca:	e21c                	sd	a5,0(a2)
ffffffffc0201ecc:	e10d                	bnez	a0,ffffffffc0201eee <slob_free+0x7e>
ffffffffc0201ece:	60a2                	ld	ra,8(sp)
ffffffffc0201ed0:	6402                	ld	s0,0(sp)
ffffffffc0201ed2:	0141                	addi	sp,sp,16
ffffffffc0201ed4:	8082                	ret
ffffffffc0201ed6:	05bd                	addi	a1,a1,15
ffffffffc0201ed8:	8191                	srli	a1,a1,0x4
ffffffffc0201eda:	c10c                	sw	a1,0(a0)
ffffffffc0201edc:	100027f3          	csrr	a5,sstatus
ffffffffc0201ee0:	8b89                	andi	a5,a5,2
ffffffffc0201ee2:	4501                	li	a0,0
ffffffffc0201ee4:	d3cd                	beqz	a5,ffffffffc0201e86 <slob_free+0x16>
ffffffffc0201ee6:	f52fe0ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc0201eea:	4505                	li	a0,1
ffffffffc0201eec:	bf69                	j	ffffffffc0201e86 <slob_free+0x16>
ffffffffc0201eee:	6402                	ld	s0,0(sp)
ffffffffc0201ef0:	60a2                	ld	ra,8(sp)
ffffffffc0201ef2:	0141                	addi	sp,sp,16
ffffffffc0201ef4:	f3efe06f          	j	ffffffffc0200632 <intr_enable>
ffffffffc0201ef8:	4018                	lw	a4,0(s0)
ffffffffc0201efa:	640c                	ld	a1,8(s0)
ffffffffc0201efc:	9eb9                	addw	a3,a3,a4
ffffffffc0201efe:	c394                	sw	a3,0(a5)
ffffffffc0201f00:	e78c                	sd	a1,8(a5)
ffffffffc0201f02:	b7e1                	j	ffffffffc0201eca <slob_free+0x5a>
ffffffffc0201f04:	4314                	lw	a3,0(a4)
ffffffffc0201f06:	6718                	ld	a4,8(a4)
ffffffffc0201f08:	9db5                	addw	a1,a1,a3
ffffffffc0201f0a:	c00c                	sw	a1,0(s0)
ffffffffc0201f0c:	e418                	sd	a4,8(s0)
ffffffffc0201f0e:	b77d                	j	ffffffffc0201ebc <slob_free+0x4c>
ffffffffc0201f10:	8082                	ret

ffffffffc0201f12 <__slob_get_free_pages.isra.0>:
ffffffffc0201f12:	4785                	li	a5,1
ffffffffc0201f14:	1141                	addi	sp,sp,-16
ffffffffc0201f16:	00a7953b          	sllw	a0,a5,a0
ffffffffc0201f1a:	e406                	sd	ra,8(sp)
ffffffffc0201f1c:	e2ffe0ef          	jal	ra,ffffffffc0200d4a <alloc_pages>
ffffffffc0201f20:	c91d                	beqz	a0,ffffffffc0201f56 <__slob_get_free_pages.isra.0+0x44>
ffffffffc0201f22:	0003e697          	auipc	a3,0x3e
ffffffffc0201f26:	0166b683          	ld	a3,22(a3) # ffffffffc023ff38 <pages>
ffffffffc0201f2a:	8d15                	sub	a0,a0,a3
ffffffffc0201f2c:	8519                	srai	a0,a0,0x6
ffffffffc0201f2e:	00009697          	auipc	a3,0x9
ffffffffc0201f32:	9726b683          	ld	a3,-1678(a3) # ffffffffc020a8a0 <nbase>
ffffffffc0201f36:	9536                	add	a0,a0,a3
ffffffffc0201f38:	00c51793          	slli	a5,a0,0xc
ffffffffc0201f3c:	83b1                	srli	a5,a5,0xc
ffffffffc0201f3e:	0003e717          	auipc	a4,0x3e
ffffffffc0201f42:	f8273703          	ld	a4,-126(a4) # ffffffffc023fec0 <npage>
ffffffffc0201f46:	0532                	slli	a0,a0,0xc
ffffffffc0201f48:	00e7fa63          	bgeu	a5,a4,ffffffffc0201f5c <__slob_get_free_pages.isra.0+0x4a>
ffffffffc0201f4c:	0003e697          	auipc	a3,0x3e
ffffffffc0201f50:	fdc6b683          	ld	a3,-36(a3) # ffffffffc023ff28 <va_pa_offset>
ffffffffc0201f54:	9536                	add	a0,a0,a3
ffffffffc0201f56:	60a2                	ld	ra,8(sp)
ffffffffc0201f58:	0141                	addi	sp,sp,16
ffffffffc0201f5a:	8082                	ret
ffffffffc0201f5c:	86aa                	mv	a3,a0
ffffffffc0201f5e:	00007617          	auipc	a2,0x7
ffffffffc0201f62:	b9260613          	addi	a2,a2,-1134 # ffffffffc0208af0 <commands+0x7c0>
ffffffffc0201f66:	06900593          	li	a1,105
ffffffffc0201f6a:	00007517          	auipc	a0,0x7
ffffffffc0201f6e:	ae650513          	addi	a0,a0,-1306 # ffffffffc0208a50 <commands+0x720>
ffffffffc0201f72:	a96fe0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0201f76 <slob_alloc.isra.0.constprop.0>:
ffffffffc0201f76:	1101                	addi	sp,sp,-32
ffffffffc0201f78:	ec06                	sd	ra,24(sp)
ffffffffc0201f7a:	e822                	sd	s0,16(sp)
ffffffffc0201f7c:	e426                	sd	s1,8(sp)
ffffffffc0201f7e:	e04a                	sd	s2,0(sp)
ffffffffc0201f80:	01050713          	addi	a4,a0,16
ffffffffc0201f84:	6785                	lui	a5,0x1
ffffffffc0201f86:	0cf77363          	bgeu	a4,a5,ffffffffc020204c <slob_alloc.isra.0.constprop.0+0xd6>
ffffffffc0201f8a:	00f50493          	addi	s1,a0,15
ffffffffc0201f8e:	8091                	srli	s1,s1,0x4
ffffffffc0201f90:	2481                	sext.w	s1,s1
ffffffffc0201f92:	10002673          	csrr	a2,sstatus
ffffffffc0201f96:	8a09                	andi	a2,a2,2
ffffffffc0201f98:	e25d                	bnez	a2,ffffffffc020203e <slob_alloc.isra.0.constprop.0+0xc8>
ffffffffc0201f9a:	00033917          	auipc	s2,0x33
ffffffffc0201f9e:	ace90913          	addi	s2,s2,-1330 # ffffffffc0234a68 <slobfree>
ffffffffc0201fa2:	00093683          	ld	a3,0(s2)
ffffffffc0201fa6:	669c                	ld	a5,8(a3)
ffffffffc0201fa8:	4398                	lw	a4,0(a5)
ffffffffc0201faa:	08975e63          	bge	a4,s1,ffffffffc0202046 <slob_alloc.isra.0.constprop.0+0xd0>
ffffffffc0201fae:	00d78b63          	beq	a5,a3,ffffffffc0201fc4 <slob_alloc.isra.0.constprop.0+0x4e>
ffffffffc0201fb2:	6780                	ld	s0,8(a5)
ffffffffc0201fb4:	4018                	lw	a4,0(s0)
ffffffffc0201fb6:	02975a63          	bge	a4,s1,ffffffffc0201fea <slob_alloc.isra.0.constprop.0+0x74>
ffffffffc0201fba:	00093683          	ld	a3,0(s2)
ffffffffc0201fbe:	87a2                	mv	a5,s0
ffffffffc0201fc0:	fed799e3          	bne	a5,a3,ffffffffc0201fb2 <slob_alloc.isra.0.constprop.0+0x3c>
ffffffffc0201fc4:	ee31                	bnez	a2,ffffffffc0202020 <slob_alloc.isra.0.constprop.0+0xaa>
ffffffffc0201fc6:	4501                	li	a0,0
ffffffffc0201fc8:	f4bff0ef          	jal	ra,ffffffffc0201f12 <__slob_get_free_pages.isra.0>
ffffffffc0201fcc:	842a                	mv	s0,a0
ffffffffc0201fce:	cd05                	beqz	a0,ffffffffc0202006 <slob_alloc.isra.0.constprop.0+0x90>
ffffffffc0201fd0:	6585                	lui	a1,0x1
ffffffffc0201fd2:	e9fff0ef          	jal	ra,ffffffffc0201e70 <slob_free>
ffffffffc0201fd6:	10002673          	csrr	a2,sstatus
ffffffffc0201fda:	8a09                	andi	a2,a2,2
ffffffffc0201fdc:	ee05                	bnez	a2,ffffffffc0202014 <slob_alloc.isra.0.constprop.0+0x9e>
ffffffffc0201fde:	00093783          	ld	a5,0(s2)
ffffffffc0201fe2:	6780                	ld	s0,8(a5)
ffffffffc0201fe4:	4018                	lw	a4,0(s0)
ffffffffc0201fe6:	fc974ae3          	blt	a4,s1,ffffffffc0201fba <slob_alloc.isra.0.constprop.0+0x44>
ffffffffc0201fea:	04e48763          	beq	s1,a4,ffffffffc0202038 <slob_alloc.isra.0.constprop.0+0xc2>
ffffffffc0201fee:	00449693          	slli	a3,s1,0x4
ffffffffc0201ff2:	96a2                	add	a3,a3,s0
ffffffffc0201ff4:	e794                	sd	a3,8(a5)
ffffffffc0201ff6:	640c                	ld	a1,8(s0)
ffffffffc0201ff8:	9f05                	subw	a4,a4,s1
ffffffffc0201ffa:	c298                	sw	a4,0(a3)
ffffffffc0201ffc:	e68c                	sd	a1,8(a3)
ffffffffc0201ffe:	c004                	sw	s1,0(s0)
ffffffffc0202000:	00f93023          	sd	a5,0(s2)
ffffffffc0202004:	e20d                	bnez	a2,ffffffffc0202026 <slob_alloc.isra.0.constprop.0+0xb0>
ffffffffc0202006:	60e2                	ld	ra,24(sp)
ffffffffc0202008:	8522                	mv	a0,s0
ffffffffc020200a:	6442                	ld	s0,16(sp)
ffffffffc020200c:	64a2                	ld	s1,8(sp)
ffffffffc020200e:	6902                	ld	s2,0(sp)
ffffffffc0202010:	6105                	addi	sp,sp,32
ffffffffc0202012:	8082                	ret
ffffffffc0202014:	e24fe0ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc0202018:	00093783          	ld	a5,0(s2)
ffffffffc020201c:	4605                	li	a2,1
ffffffffc020201e:	b7d1                	j	ffffffffc0201fe2 <slob_alloc.isra.0.constprop.0+0x6c>
ffffffffc0202020:	e12fe0ef          	jal	ra,ffffffffc0200632 <intr_enable>
ffffffffc0202024:	b74d                	j	ffffffffc0201fc6 <slob_alloc.isra.0.constprop.0+0x50>
ffffffffc0202026:	e0cfe0ef          	jal	ra,ffffffffc0200632 <intr_enable>
ffffffffc020202a:	60e2                	ld	ra,24(sp)
ffffffffc020202c:	8522                	mv	a0,s0
ffffffffc020202e:	6442                	ld	s0,16(sp)
ffffffffc0202030:	64a2                	ld	s1,8(sp)
ffffffffc0202032:	6902                	ld	s2,0(sp)
ffffffffc0202034:	6105                	addi	sp,sp,32
ffffffffc0202036:	8082                	ret
ffffffffc0202038:	6418                	ld	a4,8(s0)
ffffffffc020203a:	e798                	sd	a4,8(a5)
ffffffffc020203c:	b7d1                	j	ffffffffc0202000 <slob_alloc.isra.0.constprop.0+0x8a>
ffffffffc020203e:	dfafe0ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc0202042:	4605                	li	a2,1
ffffffffc0202044:	bf99                	j	ffffffffc0201f9a <slob_alloc.isra.0.constprop.0+0x24>
ffffffffc0202046:	843e                	mv	s0,a5
ffffffffc0202048:	87b6                	mv	a5,a3
ffffffffc020204a:	b745                	j	ffffffffc0201fea <slob_alloc.isra.0.constprop.0+0x74>
ffffffffc020204c:	00007697          	auipc	a3,0x7
ffffffffc0202050:	e7468693          	addi	a3,a3,-396 # ffffffffc0208ec0 <commands+0xb90>
ffffffffc0202054:	00006617          	auipc	a2,0x6
ffffffffc0202058:	6ec60613          	addi	a2,a2,1772 # ffffffffc0208740 <commands+0x410>
ffffffffc020205c:	06400593          	li	a1,100
ffffffffc0202060:	00007517          	auipc	a0,0x7
ffffffffc0202064:	e8050513          	addi	a0,a0,-384 # ffffffffc0208ee0 <commands+0xbb0>
ffffffffc0202068:	9a0fe0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc020206c <kallocated>:
ffffffffc020206c:	4501                	li	a0,0
ffffffffc020206e:	8082                	ret

ffffffffc0202070 <kmalloc>:
ffffffffc0202070:	1101                	addi	sp,sp,-32
ffffffffc0202072:	e04a                	sd	s2,0(sp)
ffffffffc0202074:	6905                	lui	s2,0x1
ffffffffc0202076:	e822                	sd	s0,16(sp)
ffffffffc0202078:	ec06                	sd	ra,24(sp)
ffffffffc020207a:	e426                	sd	s1,8(sp)
ffffffffc020207c:	fef90793          	addi	a5,s2,-17 # fef <_binary_obj___user_faultread_out_size-0xd61>
ffffffffc0202080:	842a                	mv	s0,a0
ffffffffc0202082:	04a7f963          	bgeu	a5,a0,ffffffffc02020d4 <kmalloc+0x64>
ffffffffc0202086:	4561                	li	a0,24
ffffffffc0202088:	eefff0ef          	jal	ra,ffffffffc0201f76 <slob_alloc.isra.0.constprop.0>
ffffffffc020208c:	84aa                	mv	s1,a0
ffffffffc020208e:	c929                	beqz	a0,ffffffffc02020e0 <kmalloc+0x70>
ffffffffc0202090:	0004079b          	sext.w	a5,s0
ffffffffc0202094:	4501                	li	a0,0
ffffffffc0202096:	00f95763          	bge	s2,a5,ffffffffc02020a4 <kmalloc+0x34>
ffffffffc020209a:	6705                	lui	a4,0x1
ffffffffc020209c:	8785                	srai	a5,a5,0x1
ffffffffc020209e:	2505                	addiw	a0,a0,1
ffffffffc02020a0:	fef74ee3          	blt	a4,a5,ffffffffc020209c <kmalloc+0x2c>
ffffffffc02020a4:	c088                	sw	a0,0(s1)
ffffffffc02020a6:	e6dff0ef          	jal	ra,ffffffffc0201f12 <__slob_get_free_pages.isra.0>
ffffffffc02020aa:	e488                	sd	a0,8(s1)
ffffffffc02020ac:	842a                	mv	s0,a0
ffffffffc02020ae:	c525                	beqz	a0,ffffffffc0202116 <kmalloc+0xa6>
ffffffffc02020b0:	100027f3          	csrr	a5,sstatus
ffffffffc02020b4:	8b89                	andi	a5,a5,2
ffffffffc02020b6:	ef8d                	bnez	a5,ffffffffc02020f0 <kmalloc+0x80>
ffffffffc02020b8:	0003e797          	auipc	a5,0x3e
ffffffffc02020bc:	e2878793          	addi	a5,a5,-472 # ffffffffc023fee0 <bigblocks>
ffffffffc02020c0:	6398                	ld	a4,0(a5)
ffffffffc02020c2:	e384                	sd	s1,0(a5)
ffffffffc02020c4:	e898                	sd	a4,16(s1)
ffffffffc02020c6:	60e2                	ld	ra,24(sp)
ffffffffc02020c8:	8522                	mv	a0,s0
ffffffffc02020ca:	6442                	ld	s0,16(sp)
ffffffffc02020cc:	64a2                	ld	s1,8(sp)
ffffffffc02020ce:	6902                	ld	s2,0(sp)
ffffffffc02020d0:	6105                	addi	sp,sp,32
ffffffffc02020d2:	8082                	ret
ffffffffc02020d4:	0541                	addi	a0,a0,16
ffffffffc02020d6:	ea1ff0ef          	jal	ra,ffffffffc0201f76 <slob_alloc.isra.0.constprop.0>
ffffffffc02020da:	01050413          	addi	s0,a0,16
ffffffffc02020de:	f565                	bnez	a0,ffffffffc02020c6 <kmalloc+0x56>
ffffffffc02020e0:	4401                	li	s0,0
ffffffffc02020e2:	60e2                	ld	ra,24(sp)
ffffffffc02020e4:	8522                	mv	a0,s0
ffffffffc02020e6:	6442                	ld	s0,16(sp)
ffffffffc02020e8:	64a2                	ld	s1,8(sp)
ffffffffc02020ea:	6902                	ld	s2,0(sp)
ffffffffc02020ec:	6105                	addi	sp,sp,32
ffffffffc02020ee:	8082                	ret
ffffffffc02020f0:	d48fe0ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc02020f4:	0003e797          	auipc	a5,0x3e
ffffffffc02020f8:	dec78793          	addi	a5,a5,-532 # ffffffffc023fee0 <bigblocks>
ffffffffc02020fc:	6398                	ld	a4,0(a5)
ffffffffc02020fe:	e384                	sd	s1,0(a5)
ffffffffc0202100:	e898                	sd	a4,16(s1)
ffffffffc0202102:	d30fe0ef          	jal	ra,ffffffffc0200632 <intr_enable>
ffffffffc0202106:	6480                	ld	s0,8(s1)
ffffffffc0202108:	60e2                	ld	ra,24(sp)
ffffffffc020210a:	64a2                	ld	s1,8(sp)
ffffffffc020210c:	8522                	mv	a0,s0
ffffffffc020210e:	6442                	ld	s0,16(sp)
ffffffffc0202110:	6902                	ld	s2,0(sp)
ffffffffc0202112:	6105                	addi	sp,sp,32
ffffffffc0202114:	8082                	ret
ffffffffc0202116:	45e1                	li	a1,24
ffffffffc0202118:	8526                	mv	a0,s1
ffffffffc020211a:	d57ff0ef          	jal	ra,ffffffffc0201e70 <slob_free>
ffffffffc020211e:	b765                	j	ffffffffc02020c6 <kmalloc+0x56>

ffffffffc0202120 <kfree>:
ffffffffc0202120:	c169                	beqz	a0,ffffffffc02021e2 <kfree+0xc2>
ffffffffc0202122:	1101                	addi	sp,sp,-32
ffffffffc0202124:	e822                	sd	s0,16(sp)
ffffffffc0202126:	ec06                	sd	ra,24(sp)
ffffffffc0202128:	e426                	sd	s1,8(sp)
ffffffffc020212a:	03451793          	slli	a5,a0,0x34
ffffffffc020212e:	842a                	mv	s0,a0
ffffffffc0202130:	e7c9                	bnez	a5,ffffffffc02021ba <kfree+0x9a>
ffffffffc0202132:	100027f3          	csrr	a5,sstatus
ffffffffc0202136:	8b89                	andi	a5,a5,2
ffffffffc0202138:	ebc9                	bnez	a5,ffffffffc02021ca <kfree+0xaa>
ffffffffc020213a:	0003e797          	auipc	a5,0x3e
ffffffffc020213e:	da67b783          	ld	a5,-602(a5) # ffffffffc023fee0 <bigblocks>
ffffffffc0202142:	4601                	li	a2,0
ffffffffc0202144:	cbbd                	beqz	a5,ffffffffc02021ba <kfree+0x9a>
ffffffffc0202146:	0003e697          	auipc	a3,0x3e
ffffffffc020214a:	d9a68693          	addi	a3,a3,-614 # ffffffffc023fee0 <bigblocks>
ffffffffc020214e:	a021                	j	ffffffffc0202156 <kfree+0x36>
ffffffffc0202150:	01048693          	addi	a3,s1,16
ffffffffc0202154:	c3a5                	beqz	a5,ffffffffc02021b4 <kfree+0x94>
ffffffffc0202156:	6798                	ld	a4,8(a5)
ffffffffc0202158:	84be                	mv	s1,a5
ffffffffc020215a:	6b9c                	ld	a5,16(a5)
ffffffffc020215c:	fe871ae3          	bne	a4,s0,ffffffffc0202150 <kfree+0x30>
ffffffffc0202160:	e29c                	sd	a5,0(a3)
ffffffffc0202162:	ee2d                	bnez	a2,ffffffffc02021dc <kfree+0xbc>
ffffffffc0202164:	c02007b7          	lui	a5,0xc0200
ffffffffc0202168:	4098                	lw	a4,0(s1)
ffffffffc020216a:	08f46963          	bltu	s0,a5,ffffffffc02021fc <kfree+0xdc>
ffffffffc020216e:	0003e697          	auipc	a3,0x3e
ffffffffc0202172:	dba6b683          	ld	a3,-582(a3) # ffffffffc023ff28 <va_pa_offset>
ffffffffc0202176:	8c15                	sub	s0,s0,a3
ffffffffc0202178:	8031                	srli	s0,s0,0xc
ffffffffc020217a:	0003e797          	auipc	a5,0x3e
ffffffffc020217e:	d467b783          	ld	a5,-698(a5) # ffffffffc023fec0 <npage>
ffffffffc0202182:	06f47163          	bgeu	s0,a5,ffffffffc02021e4 <kfree+0xc4>
ffffffffc0202186:	00008517          	auipc	a0,0x8
ffffffffc020218a:	71a53503          	ld	a0,1818(a0) # ffffffffc020a8a0 <nbase>
ffffffffc020218e:	8c09                	sub	s0,s0,a0
ffffffffc0202190:	041a                	slli	s0,s0,0x6
ffffffffc0202192:	0003e517          	auipc	a0,0x3e
ffffffffc0202196:	da653503          	ld	a0,-602(a0) # ffffffffc023ff38 <pages>
ffffffffc020219a:	4585                	li	a1,1
ffffffffc020219c:	9522                	add	a0,a0,s0
ffffffffc020219e:	00e595bb          	sllw	a1,a1,a4
ffffffffc02021a2:	c3bfe0ef          	jal	ra,ffffffffc0200ddc <free_pages>
ffffffffc02021a6:	6442                	ld	s0,16(sp)
ffffffffc02021a8:	60e2                	ld	ra,24(sp)
ffffffffc02021aa:	8526                	mv	a0,s1
ffffffffc02021ac:	64a2                	ld	s1,8(sp)
ffffffffc02021ae:	45e1                	li	a1,24
ffffffffc02021b0:	6105                	addi	sp,sp,32
ffffffffc02021b2:	b97d                	j	ffffffffc0201e70 <slob_free>
ffffffffc02021b4:	c219                	beqz	a2,ffffffffc02021ba <kfree+0x9a>
ffffffffc02021b6:	c7cfe0ef          	jal	ra,ffffffffc0200632 <intr_enable>
ffffffffc02021ba:	ff040513          	addi	a0,s0,-16
ffffffffc02021be:	6442                	ld	s0,16(sp)
ffffffffc02021c0:	60e2                	ld	ra,24(sp)
ffffffffc02021c2:	64a2                	ld	s1,8(sp)
ffffffffc02021c4:	4581                	li	a1,0
ffffffffc02021c6:	6105                	addi	sp,sp,32
ffffffffc02021c8:	b165                	j	ffffffffc0201e70 <slob_free>
ffffffffc02021ca:	c6efe0ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc02021ce:	0003e797          	auipc	a5,0x3e
ffffffffc02021d2:	d127b783          	ld	a5,-750(a5) # ffffffffc023fee0 <bigblocks>
ffffffffc02021d6:	4605                	li	a2,1
ffffffffc02021d8:	f7bd                	bnez	a5,ffffffffc0202146 <kfree+0x26>
ffffffffc02021da:	bff1                	j	ffffffffc02021b6 <kfree+0x96>
ffffffffc02021dc:	c56fe0ef          	jal	ra,ffffffffc0200632 <intr_enable>
ffffffffc02021e0:	b751                	j	ffffffffc0202164 <kfree+0x44>
ffffffffc02021e2:	8082                	ret
ffffffffc02021e4:	00007617          	auipc	a2,0x7
ffffffffc02021e8:	84c60613          	addi	a2,a2,-1972 # ffffffffc0208a30 <commands+0x700>
ffffffffc02021ec:	06200593          	li	a1,98
ffffffffc02021f0:	00007517          	auipc	a0,0x7
ffffffffc02021f4:	86050513          	addi	a0,a0,-1952 # ffffffffc0208a50 <commands+0x720>
ffffffffc02021f8:	810fe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc02021fc:	86a2                	mv	a3,s0
ffffffffc02021fe:	00007617          	auipc	a2,0x7
ffffffffc0202202:	8ba60613          	addi	a2,a2,-1862 # ffffffffc0208ab8 <commands+0x788>
ffffffffc0202206:	06e00593          	li	a1,110
ffffffffc020220a:	00007517          	auipc	a0,0x7
ffffffffc020220e:	84650513          	addi	a0,a0,-1978 # ffffffffc0208a50 <commands+0x720>
ffffffffc0202212:	ff7fd0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0202216 <_fifo_init_mm>:
ffffffffc0202216:	0003e797          	auipc	a5,0x3e
ffffffffc020221a:	dfa78793          	addi	a5,a5,-518 # ffffffffc0240010 <pra_list_head>
ffffffffc020221e:	f51c                	sd	a5,40(a0)
ffffffffc0202220:	e79c                	sd	a5,8(a5)
ffffffffc0202222:	e39c                	sd	a5,0(a5)
ffffffffc0202224:	4501                	li	a0,0
ffffffffc0202226:	8082                	ret

ffffffffc0202228 <_fifo_init>:
ffffffffc0202228:	4501                	li	a0,0
ffffffffc020222a:	8082                	ret

ffffffffc020222c <_fifo_set_unswappable>:
ffffffffc020222c:	4501                	li	a0,0
ffffffffc020222e:	8082                	ret

ffffffffc0202230 <_fifo_tick_event>:
ffffffffc0202230:	4501                	li	a0,0
ffffffffc0202232:	8082                	ret

ffffffffc0202234 <_fifo_check_swap>:
ffffffffc0202234:	711d                	addi	sp,sp,-96
ffffffffc0202236:	fc4e                	sd	s3,56(sp)
ffffffffc0202238:	f852                	sd	s4,48(sp)
ffffffffc020223a:	00007517          	auipc	a0,0x7
ffffffffc020223e:	cbe50513          	addi	a0,a0,-834 # ffffffffc0208ef8 <commands+0xbc8>
ffffffffc0202242:	698d                	lui	s3,0x3
ffffffffc0202244:	4a31                	li	s4,12
ffffffffc0202246:	e0ca                	sd	s2,64(sp)
ffffffffc0202248:	ec86                	sd	ra,88(sp)
ffffffffc020224a:	e8a2                	sd	s0,80(sp)
ffffffffc020224c:	e4a6                	sd	s1,72(sp)
ffffffffc020224e:	f456                	sd	s5,40(sp)
ffffffffc0202250:	f05a                	sd	s6,32(sp)
ffffffffc0202252:	ec5e                	sd	s7,24(sp)
ffffffffc0202254:	e862                	sd	s8,16(sp)
ffffffffc0202256:	e466                	sd	s9,8(sp)
ffffffffc0202258:	e06a                	sd	s10,0(sp)
ffffffffc020225a:	e73fd0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc020225e:	01498023          	sb	s4,0(s3) # 3000 <_binary_obj___user_matrix_out_size+0x660>
ffffffffc0202262:	0003e917          	auipc	s2,0x3e
ffffffffc0202266:	c6692903          	lw	s2,-922(s2) # ffffffffc023fec8 <pgfault_num>
ffffffffc020226a:	4791                	li	a5,4
ffffffffc020226c:	14f91e63          	bne	s2,a5,ffffffffc02023c8 <_fifo_check_swap+0x194>
ffffffffc0202270:	00007517          	auipc	a0,0x7
ffffffffc0202274:	cd850513          	addi	a0,a0,-808 # ffffffffc0208f48 <commands+0xc18>
ffffffffc0202278:	6a85                	lui	s5,0x1
ffffffffc020227a:	4b29                	li	s6,10
ffffffffc020227c:	e51fd0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0202280:	0003e417          	auipc	s0,0x3e
ffffffffc0202284:	c4840413          	addi	s0,s0,-952 # ffffffffc023fec8 <pgfault_num>
ffffffffc0202288:	016a8023          	sb	s6,0(s5) # 1000 <_binary_obj___user_faultread_out_size-0xd50>
ffffffffc020228c:	4004                	lw	s1,0(s0)
ffffffffc020228e:	2481                	sext.w	s1,s1
ffffffffc0202290:	2b249c63          	bne	s1,s2,ffffffffc0202548 <_fifo_check_swap+0x314>
ffffffffc0202294:	00007517          	auipc	a0,0x7
ffffffffc0202298:	cdc50513          	addi	a0,a0,-804 # ffffffffc0208f70 <commands+0xc40>
ffffffffc020229c:	6b91                	lui	s7,0x4
ffffffffc020229e:	4c35                	li	s8,13
ffffffffc02022a0:	e2dfd0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02022a4:	018b8023          	sb	s8,0(s7) # 4000 <_binary_obj___user_matrix_out_size+0x1660>
ffffffffc02022a8:	00042903          	lw	s2,0(s0)
ffffffffc02022ac:	2901                	sext.w	s2,s2
ffffffffc02022ae:	26991d63          	bne	s2,s1,ffffffffc0202528 <_fifo_check_swap+0x2f4>
ffffffffc02022b2:	00007517          	auipc	a0,0x7
ffffffffc02022b6:	ce650513          	addi	a0,a0,-794 # ffffffffc0208f98 <commands+0xc68>
ffffffffc02022ba:	6c89                	lui	s9,0x2
ffffffffc02022bc:	4d2d                	li	s10,11
ffffffffc02022be:	e0ffd0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02022c2:	01ac8023          	sb	s10,0(s9) # 2000 <_binary_obj___user_forktree_out_size>
ffffffffc02022c6:	401c                	lw	a5,0(s0)
ffffffffc02022c8:	2781                	sext.w	a5,a5
ffffffffc02022ca:	23279f63          	bne	a5,s2,ffffffffc0202508 <_fifo_check_swap+0x2d4>
ffffffffc02022ce:	00007517          	auipc	a0,0x7
ffffffffc02022d2:	cf250513          	addi	a0,a0,-782 # ffffffffc0208fc0 <commands+0xc90>
ffffffffc02022d6:	df7fd0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02022da:	6795                	lui	a5,0x5
ffffffffc02022dc:	4739                	li	a4,14
ffffffffc02022de:	00e78023          	sb	a4,0(a5) # 5000 <_binary_obj___user_matrix_out_size+0x2660>
ffffffffc02022e2:	4004                	lw	s1,0(s0)
ffffffffc02022e4:	4795                	li	a5,5
ffffffffc02022e6:	2481                	sext.w	s1,s1
ffffffffc02022e8:	20f49063          	bne	s1,a5,ffffffffc02024e8 <_fifo_check_swap+0x2b4>
ffffffffc02022ec:	00007517          	auipc	a0,0x7
ffffffffc02022f0:	cac50513          	addi	a0,a0,-852 # ffffffffc0208f98 <commands+0xc68>
ffffffffc02022f4:	dd9fd0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02022f8:	01ac8023          	sb	s10,0(s9)
ffffffffc02022fc:	401c                	lw	a5,0(s0)
ffffffffc02022fe:	2781                	sext.w	a5,a5
ffffffffc0202300:	1c979463          	bne	a5,s1,ffffffffc02024c8 <_fifo_check_swap+0x294>
ffffffffc0202304:	00007517          	auipc	a0,0x7
ffffffffc0202308:	c4450513          	addi	a0,a0,-956 # ffffffffc0208f48 <commands+0xc18>
ffffffffc020230c:	dc1fd0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0202310:	016a8023          	sb	s6,0(s5)
ffffffffc0202314:	401c                	lw	a5,0(s0)
ffffffffc0202316:	4719                	li	a4,6
ffffffffc0202318:	2781                	sext.w	a5,a5
ffffffffc020231a:	18e79763          	bne	a5,a4,ffffffffc02024a8 <_fifo_check_swap+0x274>
ffffffffc020231e:	00007517          	auipc	a0,0x7
ffffffffc0202322:	c7a50513          	addi	a0,a0,-902 # ffffffffc0208f98 <commands+0xc68>
ffffffffc0202326:	da7fd0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc020232a:	01ac8023          	sb	s10,0(s9)
ffffffffc020232e:	401c                	lw	a5,0(s0)
ffffffffc0202330:	471d                	li	a4,7
ffffffffc0202332:	2781                	sext.w	a5,a5
ffffffffc0202334:	14e79a63          	bne	a5,a4,ffffffffc0202488 <_fifo_check_swap+0x254>
ffffffffc0202338:	00007517          	auipc	a0,0x7
ffffffffc020233c:	bc050513          	addi	a0,a0,-1088 # ffffffffc0208ef8 <commands+0xbc8>
ffffffffc0202340:	d8dfd0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0202344:	01498023          	sb	s4,0(s3)
ffffffffc0202348:	401c                	lw	a5,0(s0)
ffffffffc020234a:	4721                	li	a4,8
ffffffffc020234c:	2781                	sext.w	a5,a5
ffffffffc020234e:	10e79d63          	bne	a5,a4,ffffffffc0202468 <_fifo_check_swap+0x234>
ffffffffc0202352:	00007517          	auipc	a0,0x7
ffffffffc0202356:	c1e50513          	addi	a0,a0,-994 # ffffffffc0208f70 <commands+0xc40>
ffffffffc020235a:	d73fd0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc020235e:	018b8023          	sb	s8,0(s7)
ffffffffc0202362:	401c                	lw	a5,0(s0)
ffffffffc0202364:	4725                	li	a4,9
ffffffffc0202366:	2781                	sext.w	a5,a5
ffffffffc0202368:	0ee79063          	bne	a5,a4,ffffffffc0202448 <_fifo_check_swap+0x214>
ffffffffc020236c:	00007517          	auipc	a0,0x7
ffffffffc0202370:	c5450513          	addi	a0,a0,-940 # ffffffffc0208fc0 <commands+0xc90>
ffffffffc0202374:	d59fd0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0202378:	6795                	lui	a5,0x5
ffffffffc020237a:	4739                	li	a4,14
ffffffffc020237c:	00e78023          	sb	a4,0(a5) # 5000 <_binary_obj___user_matrix_out_size+0x2660>
ffffffffc0202380:	4004                	lw	s1,0(s0)
ffffffffc0202382:	47a9                	li	a5,10
ffffffffc0202384:	2481                	sext.w	s1,s1
ffffffffc0202386:	0af49163          	bne	s1,a5,ffffffffc0202428 <_fifo_check_swap+0x1f4>
ffffffffc020238a:	00007517          	auipc	a0,0x7
ffffffffc020238e:	bbe50513          	addi	a0,a0,-1090 # ffffffffc0208f48 <commands+0xc18>
ffffffffc0202392:	d3bfd0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0202396:	6785                	lui	a5,0x1
ffffffffc0202398:	0007c783          	lbu	a5,0(a5) # 1000 <_binary_obj___user_faultread_out_size-0xd50>
ffffffffc020239c:	06979663          	bne	a5,s1,ffffffffc0202408 <_fifo_check_swap+0x1d4>
ffffffffc02023a0:	401c                	lw	a5,0(s0)
ffffffffc02023a2:	472d                	li	a4,11
ffffffffc02023a4:	2781                	sext.w	a5,a5
ffffffffc02023a6:	04e79163          	bne	a5,a4,ffffffffc02023e8 <_fifo_check_swap+0x1b4>
ffffffffc02023aa:	60e6                	ld	ra,88(sp)
ffffffffc02023ac:	6446                	ld	s0,80(sp)
ffffffffc02023ae:	64a6                	ld	s1,72(sp)
ffffffffc02023b0:	6906                	ld	s2,64(sp)
ffffffffc02023b2:	79e2                	ld	s3,56(sp)
ffffffffc02023b4:	7a42                	ld	s4,48(sp)
ffffffffc02023b6:	7aa2                	ld	s5,40(sp)
ffffffffc02023b8:	7b02                	ld	s6,32(sp)
ffffffffc02023ba:	6be2                	ld	s7,24(sp)
ffffffffc02023bc:	6c42                	ld	s8,16(sp)
ffffffffc02023be:	6ca2                	ld	s9,8(sp)
ffffffffc02023c0:	6d02                	ld	s10,0(sp)
ffffffffc02023c2:	4501                	li	a0,0
ffffffffc02023c4:	6125                	addi	sp,sp,96
ffffffffc02023c6:	8082                	ret
ffffffffc02023c8:	00007697          	auipc	a3,0x7
ffffffffc02023cc:	b5868693          	addi	a3,a3,-1192 # ffffffffc0208f20 <commands+0xbf0>
ffffffffc02023d0:	00006617          	auipc	a2,0x6
ffffffffc02023d4:	37060613          	addi	a2,a2,880 # ffffffffc0208740 <commands+0x410>
ffffffffc02023d8:	05100593          	li	a1,81
ffffffffc02023dc:	00007517          	auipc	a0,0x7
ffffffffc02023e0:	b5450513          	addi	a0,a0,-1196 # ffffffffc0208f30 <commands+0xc00>
ffffffffc02023e4:	e25fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc02023e8:	00007697          	auipc	a3,0x7
ffffffffc02023ec:	c8868693          	addi	a3,a3,-888 # ffffffffc0209070 <commands+0xd40>
ffffffffc02023f0:	00006617          	auipc	a2,0x6
ffffffffc02023f4:	35060613          	addi	a2,a2,848 # ffffffffc0208740 <commands+0x410>
ffffffffc02023f8:	07300593          	li	a1,115
ffffffffc02023fc:	00007517          	auipc	a0,0x7
ffffffffc0202400:	b3450513          	addi	a0,a0,-1228 # ffffffffc0208f30 <commands+0xc00>
ffffffffc0202404:	e05fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202408:	00007697          	auipc	a3,0x7
ffffffffc020240c:	c4068693          	addi	a3,a3,-960 # ffffffffc0209048 <commands+0xd18>
ffffffffc0202410:	00006617          	auipc	a2,0x6
ffffffffc0202414:	33060613          	addi	a2,a2,816 # ffffffffc0208740 <commands+0x410>
ffffffffc0202418:	07100593          	li	a1,113
ffffffffc020241c:	00007517          	auipc	a0,0x7
ffffffffc0202420:	b1450513          	addi	a0,a0,-1260 # ffffffffc0208f30 <commands+0xc00>
ffffffffc0202424:	de5fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202428:	00007697          	auipc	a3,0x7
ffffffffc020242c:	c1068693          	addi	a3,a3,-1008 # ffffffffc0209038 <commands+0xd08>
ffffffffc0202430:	00006617          	auipc	a2,0x6
ffffffffc0202434:	31060613          	addi	a2,a2,784 # ffffffffc0208740 <commands+0x410>
ffffffffc0202438:	06f00593          	li	a1,111
ffffffffc020243c:	00007517          	auipc	a0,0x7
ffffffffc0202440:	af450513          	addi	a0,a0,-1292 # ffffffffc0208f30 <commands+0xc00>
ffffffffc0202444:	dc5fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202448:	00007697          	auipc	a3,0x7
ffffffffc020244c:	be068693          	addi	a3,a3,-1056 # ffffffffc0209028 <commands+0xcf8>
ffffffffc0202450:	00006617          	auipc	a2,0x6
ffffffffc0202454:	2f060613          	addi	a2,a2,752 # ffffffffc0208740 <commands+0x410>
ffffffffc0202458:	06c00593          	li	a1,108
ffffffffc020245c:	00007517          	auipc	a0,0x7
ffffffffc0202460:	ad450513          	addi	a0,a0,-1324 # ffffffffc0208f30 <commands+0xc00>
ffffffffc0202464:	da5fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202468:	00007697          	auipc	a3,0x7
ffffffffc020246c:	bb068693          	addi	a3,a3,-1104 # ffffffffc0209018 <commands+0xce8>
ffffffffc0202470:	00006617          	auipc	a2,0x6
ffffffffc0202474:	2d060613          	addi	a2,a2,720 # ffffffffc0208740 <commands+0x410>
ffffffffc0202478:	06900593          	li	a1,105
ffffffffc020247c:	00007517          	auipc	a0,0x7
ffffffffc0202480:	ab450513          	addi	a0,a0,-1356 # ffffffffc0208f30 <commands+0xc00>
ffffffffc0202484:	d85fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202488:	00007697          	auipc	a3,0x7
ffffffffc020248c:	b8068693          	addi	a3,a3,-1152 # ffffffffc0209008 <commands+0xcd8>
ffffffffc0202490:	00006617          	auipc	a2,0x6
ffffffffc0202494:	2b060613          	addi	a2,a2,688 # ffffffffc0208740 <commands+0x410>
ffffffffc0202498:	06600593          	li	a1,102
ffffffffc020249c:	00007517          	auipc	a0,0x7
ffffffffc02024a0:	a9450513          	addi	a0,a0,-1388 # ffffffffc0208f30 <commands+0xc00>
ffffffffc02024a4:	d65fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc02024a8:	00007697          	auipc	a3,0x7
ffffffffc02024ac:	b5068693          	addi	a3,a3,-1200 # ffffffffc0208ff8 <commands+0xcc8>
ffffffffc02024b0:	00006617          	auipc	a2,0x6
ffffffffc02024b4:	29060613          	addi	a2,a2,656 # ffffffffc0208740 <commands+0x410>
ffffffffc02024b8:	06300593          	li	a1,99
ffffffffc02024bc:	00007517          	auipc	a0,0x7
ffffffffc02024c0:	a7450513          	addi	a0,a0,-1420 # ffffffffc0208f30 <commands+0xc00>
ffffffffc02024c4:	d45fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc02024c8:	00007697          	auipc	a3,0x7
ffffffffc02024cc:	b2068693          	addi	a3,a3,-1248 # ffffffffc0208fe8 <commands+0xcb8>
ffffffffc02024d0:	00006617          	auipc	a2,0x6
ffffffffc02024d4:	27060613          	addi	a2,a2,624 # ffffffffc0208740 <commands+0x410>
ffffffffc02024d8:	06000593          	li	a1,96
ffffffffc02024dc:	00007517          	auipc	a0,0x7
ffffffffc02024e0:	a5450513          	addi	a0,a0,-1452 # ffffffffc0208f30 <commands+0xc00>
ffffffffc02024e4:	d25fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc02024e8:	00007697          	auipc	a3,0x7
ffffffffc02024ec:	b0068693          	addi	a3,a3,-1280 # ffffffffc0208fe8 <commands+0xcb8>
ffffffffc02024f0:	00006617          	auipc	a2,0x6
ffffffffc02024f4:	25060613          	addi	a2,a2,592 # ffffffffc0208740 <commands+0x410>
ffffffffc02024f8:	05d00593          	li	a1,93
ffffffffc02024fc:	00007517          	auipc	a0,0x7
ffffffffc0202500:	a3450513          	addi	a0,a0,-1484 # ffffffffc0208f30 <commands+0xc00>
ffffffffc0202504:	d05fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202508:	00007697          	auipc	a3,0x7
ffffffffc020250c:	a1868693          	addi	a3,a3,-1512 # ffffffffc0208f20 <commands+0xbf0>
ffffffffc0202510:	00006617          	auipc	a2,0x6
ffffffffc0202514:	23060613          	addi	a2,a2,560 # ffffffffc0208740 <commands+0x410>
ffffffffc0202518:	05a00593          	li	a1,90
ffffffffc020251c:	00007517          	auipc	a0,0x7
ffffffffc0202520:	a1450513          	addi	a0,a0,-1516 # ffffffffc0208f30 <commands+0xc00>
ffffffffc0202524:	ce5fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202528:	00007697          	auipc	a3,0x7
ffffffffc020252c:	9f868693          	addi	a3,a3,-1544 # ffffffffc0208f20 <commands+0xbf0>
ffffffffc0202530:	00006617          	auipc	a2,0x6
ffffffffc0202534:	21060613          	addi	a2,a2,528 # ffffffffc0208740 <commands+0x410>
ffffffffc0202538:	05700593          	li	a1,87
ffffffffc020253c:	00007517          	auipc	a0,0x7
ffffffffc0202540:	9f450513          	addi	a0,a0,-1548 # ffffffffc0208f30 <commands+0xc00>
ffffffffc0202544:	cc5fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202548:	00007697          	auipc	a3,0x7
ffffffffc020254c:	9d868693          	addi	a3,a3,-1576 # ffffffffc0208f20 <commands+0xbf0>
ffffffffc0202550:	00006617          	auipc	a2,0x6
ffffffffc0202554:	1f060613          	addi	a2,a2,496 # ffffffffc0208740 <commands+0x410>
ffffffffc0202558:	05400593          	li	a1,84
ffffffffc020255c:	00007517          	auipc	a0,0x7
ffffffffc0202560:	9d450513          	addi	a0,a0,-1580 # ffffffffc0208f30 <commands+0xc00>
ffffffffc0202564:	ca5fd0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0202568 <_fifo_swap_out_victim>:
ffffffffc0202568:	751c                	ld	a5,40(a0)
ffffffffc020256a:	1141                	addi	sp,sp,-16
ffffffffc020256c:	e406                	sd	ra,8(sp)
ffffffffc020256e:	cf91                	beqz	a5,ffffffffc020258a <_fifo_swap_out_victim+0x22>
ffffffffc0202570:	ee0d                	bnez	a2,ffffffffc02025aa <_fifo_swap_out_victim+0x42>
ffffffffc0202572:	679c                	ld	a5,8(a5)
ffffffffc0202574:	60a2                	ld	ra,8(sp)
ffffffffc0202576:	4501                	li	a0,0
ffffffffc0202578:	6394                	ld	a3,0(a5)
ffffffffc020257a:	6798                	ld	a4,8(a5)
ffffffffc020257c:	fd878793          	addi	a5,a5,-40
ffffffffc0202580:	e698                	sd	a4,8(a3)
ffffffffc0202582:	e314                	sd	a3,0(a4)
ffffffffc0202584:	e19c                	sd	a5,0(a1)
ffffffffc0202586:	0141                	addi	sp,sp,16
ffffffffc0202588:	8082                	ret
ffffffffc020258a:	00007697          	auipc	a3,0x7
ffffffffc020258e:	af668693          	addi	a3,a3,-1290 # ffffffffc0209080 <commands+0xd50>
ffffffffc0202592:	00006617          	auipc	a2,0x6
ffffffffc0202596:	1ae60613          	addi	a2,a2,430 # ffffffffc0208740 <commands+0x410>
ffffffffc020259a:	04100593          	li	a1,65
ffffffffc020259e:	00007517          	auipc	a0,0x7
ffffffffc02025a2:	99250513          	addi	a0,a0,-1646 # ffffffffc0208f30 <commands+0xc00>
ffffffffc02025a6:	c63fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc02025aa:	00007697          	auipc	a3,0x7
ffffffffc02025ae:	ae668693          	addi	a3,a3,-1306 # ffffffffc0209090 <commands+0xd60>
ffffffffc02025b2:	00006617          	auipc	a2,0x6
ffffffffc02025b6:	18e60613          	addi	a2,a2,398 # ffffffffc0208740 <commands+0x410>
ffffffffc02025ba:	04200593          	li	a1,66
ffffffffc02025be:	00007517          	auipc	a0,0x7
ffffffffc02025c2:	97250513          	addi	a0,a0,-1678 # ffffffffc0208f30 <commands+0xc00>
ffffffffc02025c6:	c43fd0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc02025ca <_fifo_map_swappable>:
ffffffffc02025ca:	751c                	ld	a5,40(a0)
ffffffffc02025cc:	cb91                	beqz	a5,ffffffffc02025e0 <_fifo_map_swappable+0x16>
ffffffffc02025ce:	6394                	ld	a3,0(a5)
ffffffffc02025d0:	02860713          	addi	a4,a2,40
ffffffffc02025d4:	e398                	sd	a4,0(a5)
ffffffffc02025d6:	e698                	sd	a4,8(a3)
ffffffffc02025d8:	4501                	li	a0,0
ffffffffc02025da:	fa1c                	sd	a5,48(a2)
ffffffffc02025dc:	f614                	sd	a3,40(a2)
ffffffffc02025de:	8082                	ret
ffffffffc02025e0:	1141                	addi	sp,sp,-16
ffffffffc02025e2:	00007697          	auipc	a3,0x7
ffffffffc02025e6:	abe68693          	addi	a3,a3,-1346 # ffffffffc02090a0 <commands+0xd70>
ffffffffc02025ea:	00006617          	auipc	a2,0x6
ffffffffc02025ee:	15660613          	addi	a2,a2,342 # ffffffffc0208740 <commands+0x410>
ffffffffc02025f2:	03200593          	li	a1,50
ffffffffc02025f6:	00007517          	auipc	a0,0x7
ffffffffc02025fa:	93a50513          	addi	a0,a0,-1734 # ffffffffc0208f30 <commands+0xc00>
ffffffffc02025fe:	e406                	sd	ra,8(sp)
ffffffffc0202600:	c09fd0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0202604 <default_init>:
ffffffffc0202604:	0003e797          	auipc	a5,0x3e
ffffffffc0202608:	a1c78793          	addi	a5,a5,-1508 # ffffffffc0240020 <free_area>
ffffffffc020260c:	e79c                	sd	a5,8(a5)
ffffffffc020260e:	e39c                	sd	a5,0(a5)
ffffffffc0202610:	0007a823          	sw	zero,16(a5)
ffffffffc0202614:	8082                	ret

ffffffffc0202616 <default_nr_free_pages>:
ffffffffc0202616:	0003e517          	auipc	a0,0x3e
ffffffffc020261a:	a1a56503          	lwu	a0,-1510(a0) # ffffffffc0240030 <free_area+0x10>
ffffffffc020261e:	8082                	ret

ffffffffc0202620 <default_check>:
ffffffffc0202620:	715d                	addi	sp,sp,-80
ffffffffc0202622:	e0a2                	sd	s0,64(sp)
ffffffffc0202624:	0003e417          	auipc	s0,0x3e
ffffffffc0202628:	9fc40413          	addi	s0,s0,-1540 # ffffffffc0240020 <free_area>
ffffffffc020262c:	641c                	ld	a5,8(s0)
ffffffffc020262e:	e486                	sd	ra,72(sp)
ffffffffc0202630:	fc26                	sd	s1,56(sp)
ffffffffc0202632:	f84a                	sd	s2,48(sp)
ffffffffc0202634:	f44e                	sd	s3,40(sp)
ffffffffc0202636:	f052                	sd	s4,32(sp)
ffffffffc0202638:	ec56                	sd	s5,24(sp)
ffffffffc020263a:	e85a                	sd	s6,16(sp)
ffffffffc020263c:	e45e                	sd	s7,8(sp)
ffffffffc020263e:	e062                	sd	s8,0(sp)
ffffffffc0202640:	2a878d63          	beq	a5,s0,ffffffffc02028fa <default_check+0x2da>
ffffffffc0202644:	4481                	li	s1,0
ffffffffc0202646:	4901                	li	s2,0
ffffffffc0202648:	ff07b703          	ld	a4,-16(a5)
ffffffffc020264c:	8b09                	andi	a4,a4,2
ffffffffc020264e:	2a070a63          	beqz	a4,ffffffffc0202902 <default_check+0x2e2>
ffffffffc0202652:	ff87a703          	lw	a4,-8(a5)
ffffffffc0202656:	679c                	ld	a5,8(a5)
ffffffffc0202658:	2905                	addiw	s2,s2,1
ffffffffc020265a:	9cb9                	addw	s1,s1,a4
ffffffffc020265c:	fe8796e3          	bne	a5,s0,ffffffffc0202648 <default_check+0x28>
ffffffffc0202660:	89a6                	mv	s3,s1
ffffffffc0202662:	fbcfe0ef          	jal	ra,ffffffffc0200e1e <nr_free_pages>
ffffffffc0202666:	6f351e63          	bne	a0,s3,ffffffffc0202d62 <default_check+0x742>
ffffffffc020266a:	4505                	li	a0,1
ffffffffc020266c:	edefe0ef          	jal	ra,ffffffffc0200d4a <alloc_pages>
ffffffffc0202670:	8aaa                	mv	s5,a0
ffffffffc0202672:	42050863          	beqz	a0,ffffffffc0202aa2 <default_check+0x482>
ffffffffc0202676:	4505                	li	a0,1
ffffffffc0202678:	ed2fe0ef          	jal	ra,ffffffffc0200d4a <alloc_pages>
ffffffffc020267c:	89aa                	mv	s3,a0
ffffffffc020267e:	70050263          	beqz	a0,ffffffffc0202d82 <default_check+0x762>
ffffffffc0202682:	4505                	li	a0,1
ffffffffc0202684:	ec6fe0ef          	jal	ra,ffffffffc0200d4a <alloc_pages>
ffffffffc0202688:	8a2a                	mv	s4,a0
ffffffffc020268a:	48050c63          	beqz	a0,ffffffffc0202b22 <default_check+0x502>
ffffffffc020268e:	293a8a63          	beq	s5,s3,ffffffffc0202922 <default_check+0x302>
ffffffffc0202692:	28aa8863          	beq	s5,a0,ffffffffc0202922 <default_check+0x302>
ffffffffc0202696:	28a98663          	beq	s3,a0,ffffffffc0202922 <default_check+0x302>
ffffffffc020269a:	000aa783          	lw	a5,0(s5)
ffffffffc020269e:	2a079263          	bnez	a5,ffffffffc0202942 <default_check+0x322>
ffffffffc02026a2:	0009a783          	lw	a5,0(s3)
ffffffffc02026a6:	28079e63          	bnez	a5,ffffffffc0202942 <default_check+0x322>
ffffffffc02026aa:	411c                	lw	a5,0(a0)
ffffffffc02026ac:	28079b63          	bnez	a5,ffffffffc0202942 <default_check+0x322>
ffffffffc02026b0:	0003e797          	auipc	a5,0x3e
ffffffffc02026b4:	8887b783          	ld	a5,-1912(a5) # ffffffffc023ff38 <pages>
ffffffffc02026b8:	40fa8733          	sub	a4,s5,a5
ffffffffc02026bc:	00008617          	auipc	a2,0x8
ffffffffc02026c0:	1e463603          	ld	a2,484(a2) # ffffffffc020a8a0 <nbase>
ffffffffc02026c4:	8719                	srai	a4,a4,0x6
ffffffffc02026c6:	9732                	add	a4,a4,a2
ffffffffc02026c8:	0003d697          	auipc	a3,0x3d
ffffffffc02026cc:	7f86b683          	ld	a3,2040(a3) # ffffffffc023fec0 <npage>
ffffffffc02026d0:	06b2                	slli	a3,a3,0xc
ffffffffc02026d2:	0732                	slli	a4,a4,0xc
ffffffffc02026d4:	28d77763          	bgeu	a4,a3,ffffffffc0202962 <default_check+0x342>
ffffffffc02026d8:	40f98733          	sub	a4,s3,a5
ffffffffc02026dc:	8719                	srai	a4,a4,0x6
ffffffffc02026de:	9732                	add	a4,a4,a2
ffffffffc02026e0:	0732                	slli	a4,a4,0xc
ffffffffc02026e2:	4cd77063          	bgeu	a4,a3,ffffffffc0202ba2 <default_check+0x582>
ffffffffc02026e6:	40f507b3          	sub	a5,a0,a5
ffffffffc02026ea:	8799                	srai	a5,a5,0x6
ffffffffc02026ec:	97b2                	add	a5,a5,a2
ffffffffc02026ee:	07b2                	slli	a5,a5,0xc
ffffffffc02026f0:	30d7f963          	bgeu	a5,a3,ffffffffc0202a02 <default_check+0x3e2>
ffffffffc02026f4:	4505                	li	a0,1
ffffffffc02026f6:	00043c03          	ld	s8,0(s0)
ffffffffc02026fa:	00843b83          	ld	s7,8(s0)
ffffffffc02026fe:	01042b03          	lw	s6,16(s0)
ffffffffc0202702:	e400                	sd	s0,8(s0)
ffffffffc0202704:	e000                	sd	s0,0(s0)
ffffffffc0202706:	0003e797          	auipc	a5,0x3e
ffffffffc020270a:	9207a523          	sw	zero,-1750(a5) # ffffffffc0240030 <free_area+0x10>
ffffffffc020270e:	e3cfe0ef          	jal	ra,ffffffffc0200d4a <alloc_pages>
ffffffffc0202712:	2c051863          	bnez	a0,ffffffffc02029e2 <default_check+0x3c2>
ffffffffc0202716:	4585                	li	a1,1
ffffffffc0202718:	8556                	mv	a0,s5
ffffffffc020271a:	ec2fe0ef          	jal	ra,ffffffffc0200ddc <free_pages>
ffffffffc020271e:	4585                	li	a1,1
ffffffffc0202720:	854e                	mv	a0,s3
ffffffffc0202722:	ebafe0ef          	jal	ra,ffffffffc0200ddc <free_pages>
ffffffffc0202726:	4585                	li	a1,1
ffffffffc0202728:	8552                	mv	a0,s4
ffffffffc020272a:	eb2fe0ef          	jal	ra,ffffffffc0200ddc <free_pages>
ffffffffc020272e:	4818                	lw	a4,16(s0)
ffffffffc0202730:	478d                	li	a5,3
ffffffffc0202732:	28f71863          	bne	a4,a5,ffffffffc02029c2 <default_check+0x3a2>
ffffffffc0202736:	4505                	li	a0,1
ffffffffc0202738:	e12fe0ef          	jal	ra,ffffffffc0200d4a <alloc_pages>
ffffffffc020273c:	89aa                	mv	s3,a0
ffffffffc020273e:	26050263          	beqz	a0,ffffffffc02029a2 <default_check+0x382>
ffffffffc0202742:	4505                	li	a0,1
ffffffffc0202744:	e06fe0ef          	jal	ra,ffffffffc0200d4a <alloc_pages>
ffffffffc0202748:	8aaa                	mv	s5,a0
ffffffffc020274a:	3a050c63          	beqz	a0,ffffffffc0202b02 <default_check+0x4e2>
ffffffffc020274e:	4505                	li	a0,1
ffffffffc0202750:	dfafe0ef          	jal	ra,ffffffffc0200d4a <alloc_pages>
ffffffffc0202754:	8a2a                	mv	s4,a0
ffffffffc0202756:	38050663          	beqz	a0,ffffffffc0202ae2 <default_check+0x4c2>
ffffffffc020275a:	4505                	li	a0,1
ffffffffc020275c:	deefe0ef          	jal	ra,ffffffffc0200d4a <alloc_pages>
ffffffffc0202760:	36051163          	bnez	a0,ffffffffc0202ac2 <default_check+0x4a2>
ffffffffc0202764:	4585                	li	a1,1
ffffffffc0202766:	854e                	mv	a0,s3
ffffffffc0202768:	e74fe0ef          	jal	ra,ffffffffc0200ddc <free_pages>
ffffffffc020276c:	641c                	ld	a5,8(s0)
ffffffffc020276e:	20878a63          	beq	a5,s0,ffffffffc0202982 <default_check+0x362>
ffffffffc0202772:	4505                	li	a0,1
ffffffffc0202774:	dd6fe0ef          	jal	ra,ffffffffc0200d4a <alloc_pages>
ffffffffc0202778:	30a99563          	bne	s3,a0,ffffffffc0202a82 <default_check+0x462>
ffffffffc020277c:	4505                	li	a0,1
ffffffffc020277e:	dccfe0ef          	jal	ra,ffffffffc0200d4a <alloc_pages>
ffffffffc0202782:	2e051063          	bnez	a0,ffffffffc0202a62 <default_check+0x442>
ffffffffc0202786:	481c                	lw	a5,16(s0)
ffffffffc0202788:	2a079d63          	bnez	a5,ffffffffc0202a42 <default_check+0x422>
ffffffffc020278c:	854e                	mv	a0,s3
ffffffffc020278e:	4585                	li	a1,1
ffffffffc0202790:	01843023          	sd	s8,0(s0)
ffffffffc0202794:	01743423          	sd	s7,8(s0)
ffffffffc0202798:	01642823          	sw	s6,16(s0)
ffffffffc020279c:	e40fe0ef          	jal	ra,ffffffffc0200ddc <free_pages>
ffffffffc02027a0:	4585                	li	a1,1
ffffffffc02027a2:	8556                	mv	a0,s5
ffffffffc02027a4:	e38fe0ef          	jal	ra,ffffffffc0200ddc <free_pages>
ffffffffc02027a8:	4585                	li	a1,1
ffffffffc02027aa:	8552                	mv	a0,s4
ffffffffc02027ac:	e30fe0ef          	jal	ra,ffffffffc0200ddc <free_pages>
ffffffffc02027b0:	4515                	li	a0,5
ffffffffc02027b2:	d98fe0ef          	jal	ra,ffffffffc0200d4a <alloc_pages>
ffffffffc02027b6:	89aa                	mv	s3,a0
ffffffffc02027b8:	26050563          	beqz	a0,ffffffffc0202a22 <default_check+0x402>
ffffffffc02027bc:	651c                	ld	a5,8(a0)
ffffffffc02027be:	8385                	srli	a5,a5,0x1
ffffffffc02027c0:	8b85                	andi	a5,a5,1
ffffffffc02027c2:	54079063          	bnez	a5,ffffffffc0202d02 <default_check+0x6e2>
ffffffffc02027c6:	4505                	li	a0,1
ffffffffc02027c8:	00043b03          	ld	s6,0(s0)
ffffffffc02027cc:	00843a83          	ld	s5,8(s0)
ffffffffc02027d0:	e000                	sd	s0,0(s0)
ffffffffc02027d2:	e400                	sd	s0,8(s0)
ffffffffc02027d4:	d76fe0ef          	jal	ra,ffffffffc0200d4a <alloc_pages>
ffffffffc02027d8:	50051563          	bnez	a0,ffffffffc0202ce2 <default_check+0x6c2>
ffffffffc02027dc:	08098a13          	addi	s4,s3,128
ffffffffc02027e0:	8552                	mv	a0,s4
ffffffffc02027e2:	458d                	li	a1,3
ffffffffc02027e4:	01042b83          	lw	s7,16(s0)
ffffffffc02027e8:	0003e797          	auipc	a5,0x3e
ffffffffc02027ec:	8407a423          	sw	zero,-1976(a5) # ffffffffc0240030 <free_area+0x10>
ffffffffc02027f0:	decfe0ef          	jal	ra,ffffffffc0200ddc <free_pages>
ffffffffc02027f4:	4511                	li	a0,4
ffffffffc02027f6:	d54fe0ef          	jal	ra,ffffffffc0200d4a <alloc_pages>
ffffffffc02027fa:	4c051463          	bnez	a0,ffffffffc0202cc2 <default_check+0x6a2>
ffffffffc02027fe:	0889b783          	ld	a5,136(s3)
ffffffffc0202802:	8385                	srli	a5,a5,0x1
ffffffffc0202804:	8b85                	andi	a5,a5,1
ffffffffc0202806:	48078e63          	beqz	a5,ffffffffc0202ca2 <default_check+0x682>
ffffffffc020280a:	0909a703          	lw	a4,144(s3)
ffffffffc020280e:	478d                	li	a5,3
ffffffffc0202810:	48f71963          	bne	a4,a5,ffffffffc0202ca2 <default_check+0x682>
ffffffffc0202814:	450d                	li	a0,3
ffffffffc0202816:	d34fe0ef          	jal	ra,ffffffffc0200d4a <alloc_pages>
ffffffffc020281a:	8c2a                	mv	s8,a0
ffffffffc020281c:	46050363          	beqz	a0,ffffffffc0202c82 <default_check+0x662>
ffffffffc0202820:	4505                	li	a0,1
ffffffffc0202822:	d28fe0ef          	jal	ra,ffffffffc0200d4a <alloc_pages>
ffffffffc0202826:	42051e63          	bnez	a0,ffffffffc0202c62 <default_check+0x642>
ffffffffc020282a:	418a1c63          	bne	s4,s8,ffffffffc0202c42 <default_check+0x622>
ffffffffc020282e:	4585                	li	a1,1
ffffffffc0202830:	854e                	mv	a0,s3
ffffffffc0202832:	daafe0ef          	jal	ra,ffffffffc0200ddc <free_pages>
ffffffffc0202836:	458d                	li	a1,3
ffffffffc0202838:	8552                	mv	a0,s4
ffffffffc020283a:	da2fe0ef          	jal	ra,ffffffffc0200ddc <free_pages>
ffffffffc020283e:	0089b783          	ld	a5,8(s3)
ffffffffc0202842:	04098c13          	addi	s8,s3,64
ffffffffc0202846:	8385                	srli	a5,a5,0x1
ffffffffc0202848:	8b85                	andi	a5,a5,1
ffffffffc020284a:	3c078c63          	beqz	a5,ffffffffc0202c22 <default_check+0x602>
ffffffffc020284e:	0109a703          	lw	a4,16(s3)
ffffffffc0202852:	4785                	li	a5,1
ffffffffc0202854:	3cf71763          	bne	a4,a5,ffffffffc0202c22 <default_check+0x602>
ffffffffc0202858:	008a3783          	ld	a5,8(s4) # 1008 <_binary_obj___user_faultread_out_size-0xd48>
ffffffffc020285c:	8385                	srli	a5,a5,0x1
ffffffffc020285e:	8b85                	andi	a5,a5,1
ffffffffc0202860:	3a078163          	beqz	a5,ffffffffc0202c02 <default_check+0x5e2>
ffffffffc0202864:	010a2703          	lw	a4,16(s4)
ffffffffc0202868:	478d                	li	a5,3
ffffffffc020286a:	38f71c63          	bne	a4,a5,ffffffffc0202c02 <default_check+0x5e2>
ffffffffc020286e:	4505                	li	a0,1
ffffffffc0202870:	cdafe0ef          	jal	ra,ffffffffc0200d4a <alloc_pages>
ffffffffc0202874:	36a99763          	bne	s3,a0,ffffffffc0202be2 <default_check+0x5c2>
ffffffffc0202878:	4585                	li	a1,1
ffffffffc020287a:	d62fe0ef          	jal	ra,ffffffffc0200ddc <free_pages>
ffffffffc020287e:	4509                	li	a0,2
ffffffffc0202880:	ccafe0ef          	jal	ra,ffffffffc0200d4a <alloc_pages>
ffffffffc0202884:	32aa1f63          	bne	s4,a0,ffffffffc0202bc2 <default_check+0x5a2>
ffffffffc0202888:	4589                	li	a1,2
ffffffffc020288a:	d52fe0ef          	jal	ra,ffffffffc0200ddc <free_pages>
ffffffffc020288e:	4585                	li	a1,1
ffffffffc0202890:	8562                	mv	a0,s8
ffffffffc0202892:	d4afe0ef          	jal	ra,ffffffffc0200ddc <free_pages>
ffffffffc0202896:	4515                	li	a0,5
ffffffffc0202898:	cb2fe0ef          	jal	ra,ffffffffc0200d4a <alloc_pages>
ffffffffc020289c:	89aa                	mv	s3,a0
ffffffffc020289e:	48050263          	beqz	a0,ffffffffc0202d22 <default_check+0x702>
ffffffffc02028a2:	4505                	li	a0,1
ffffffffc02028a4:	ca6fe0ef          	jal	ra,ffffffffc0200d4a <alloc_pages>
ffffffffc02028a8:	2c051d63          	bnez	a0,ffffffffc0202b82 <default_check+0x562>
ffffffffc02028ac:	481c                	lw	a5,16(s0)
ffffffffc02028ae:	2a079a63          	bnez	a5,ffffffffc0202b62 <default_check+0x542>
ffffffffc02028b2:	4595                	li	a1,5
ffffffffc02028b4:	854e                	mv	a0,s3
ffffffffc02028b6:	01742823          	sw	s7,16(s0)
ffffffffc02028ba:	01643023          	sd	s6,0(s0)
ffffffffc02028be:	01543423          	sd	s5,8(s0)
ffffffffc02028c2:	d1afe0ef          	jal	ra,ffffffffc0200ddc <free_pages>
ffffffffc02028c6:	641c                	ld	a5,8(s0)
ffffffffc02028c8:	00878963          	beq	a5,s0,ffffffffc02028da <default_check+0x2ba>
ffffffffc02028cc:	ff87a703          	lw	a4,-8(a5)
ffffffffc02028d0:	679c                	ld	a5,8(a5)
ffffffffc02028d2:	397d                	addiw	s2,s2,-1
ffffffffc02028d4:	9c99                	subw	s1,s1,a4
ffffffffc02028d6:	fe879be3          	bne	a5,s0,ffffffffc02028cc <default_check+0x2ac>
ffffffffc02028da:	26091463          	bnez	s2,ffffffffc0202b42 <default_check+0x522>
ffffffffc02028de:	46049263          	bnez	s1,ffffffffc0202d42 <default_check+0x722>
ffffffffc02028e2:	60a6                	ld	ra,72(sp)
ffffffffc02028e4:	6406                	ld	s0,64(sp)
ffffffffc02028e6:	74e2                	ld	s1,56(sp)
ffffffffc02028e8:	7942                	ld	s2,48(sp)
ffffffffc02028ea:	79a2                	ld	s3,40(sp)
ffffffffc02028ec:	7a02                	ld	s4,32(sp)
ffffffffc02028ee:	6ae2                	ld	s5,24(sp)
ffffffffc02028f0:	6b42                	ld	s6,16(sp)
ffffffffc02028f2:	6ba2                	ld	s7,8(sp)
ffffffffc02028f4:	6c02                	ld	s8,0(sp)
ffffffffc02028f6:	6161                	addi	sp,sp,80
ffffffffc02028f8:	8082                	ret
ffffffffc02028fa:	4981                	li	s3,0
ffffffffc02028fc:	4481                	li	s1,0
ffffffffc02028fe:	4901                	li	s2,0
ffffffffc0202900:	b38d                	j	ffffffffc0202662 <default_check+0x42>
ffffffffc0202902:	00006697          	auipc	a3,0x6
ffffffffc0202906:	7d668693          	addi	a3,a3,2006 # ffffffffc02090d8 <commands+0xda8>
ffffffffc020290a:	00006617          	auipc	a2,0x6
ffffffffc020290e:	e3660613          	addi	a2,a2,-458 # ffffffffc0208740 <commands+0x410>
ffffffffc0202912:	0f000593          	li	a1,240
ffffffffc0202916:	00006517          	auipc	a0,0x6
ffffffffc020291a:	7d250513          	addi	a0,a0,2002 # ffffffffc02090e8 <commands+0xdb8>
ffffffffc020291e:	8ebfd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202922:	00007697          	auipc	a3,0x7
ffffffffc0202926:	85e68693          	addi	a3,a3,-1954 # ffffffffc0209180 <commands+0xe50>
ffffffffc020292a:	00006617          	auipc	a2,0x6
ffffffffc020292e:	e1660613          	addi	a2,a2,-490 # ffffffffc0208740 <commands+0x410>
ffffffffc0202932:	0bd00593          	li	a1,189
ffffffffc0202936:	00006517          	auipc	a0,0x6
ffffffffc020293a:	7b250513          	addi	a0,a0,1970 # ffffffffc02090e8 <commands+0xdb8>
ffffffffc020293e:	8cbfd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202942:	00007697          	auipc	a3,0x7
ffffffffc0202946:	86668693          	addi	a3,a3,-1946 # ffffffffc02091a8 <commands+0xe78>
ffffffffc020294a:	00006617          	auipc	a2,0x6
ffffffffc020294e:	df660613          	addi	a2,a2,-522 # ffffffffc0208740 <commands+0x410>
ffffffffc0202952:	0be00593          	li	a1,190
ffffffffc0202956:	00006517          	auipc	a0,0x6
ffffffffc020295a:	79250513          	addi	a0,a0,1938 # ffffffffc02090e8 <commands+0xdb8>
ffffffffc020295e:	8abfd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202962:	00007697          	auipc	a3,0x7
ffffffffc0202966:	88668693          	addi	a3,a3,-1914 # ffffffffc02091e8 <commands+0xeb8>
ffffffffc020296a:	00006617          	auipc	a2,0x6
ffffffffc020296e:	dd660613          	addi	a2,a2,-554 # ffffffffc0208740 <commands+0x410>
ffffffffc0202972:	0c000593          	li	a1,192
ffffffffc0202976:	00006517          	auipc	a0,0x6
ffffffffc020297a:	77250513          	addi	a0,a0,1906 # ffffffffc02090e8 <commands+0xdb8>
ffffffffc020297e:	88bfd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202982:	00007697          	auipc	a3,0x7
ffffffffc0202986:	8ee68693          	addi	a3,a3,-1810 # ffffffffc0209270 <commands+0xf40>
ffffffffc020298a:	00006617          	auipc	a2,0x6
ffffffffc020298e:	db660613          	addi	a2,a2,-586 # ffffffffc0208740 <commands+0x410>
ffffffffc0202992:	0d900593          	li	a1,217
ffffffffc0202996:	00006517          	auipc	a0,0x6
ffffffffc020299a:	75250513          	addi	a0,a0,1874 # ffffffffc02090e8 <commands+0xdb8>
ffffffffc020299e:	86bfd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc02029a2:	00006697          	auipc	a3,0x6
ffffffffc02029a6:	77e68693          	addi	a3,a3,1918 # ffffffffc0209120 <commands+0xdf0>
ffffffffc02029aa:	00006617          	auipc	a2,0x6
ffffffffc02029ae:	d9660613          	addi	a2,a2,-618 # ffffffffc0208740 <commands+0x410>
ffffffffc02029b2:	0d200593          	li	a1,210
ffffffffc02029b6:	00006517          	auipc	a0,0x6
ffffffffc02029ba:	73250513          	addi	a0,a0,1842 # ffffffffc02090e8 <commands+0xdb8>
ffffffffc02029be:	84bfd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc02029c2:	00007697          	auipc	a3,0x7
ffffffffc02029c6:	89e68693          	addi	a3,a3,-1890 # ffffffffc0209260 <commands+0xf30>
ffffffffc02029ca:	00006617          	auipc	a2,0x6
ffffffffc02029ce:	d7660613          	addi	a2,a2,-650 # ffffffffc0208740 <commands+0x410>
ffffffffc02029d2:	0d000593          	li	a1,208
ffffffffc02029d6:	00006517          	auipc	a0,0x6
ffffffffc02029da:	71250513          	addi	a0,a0,1810 # ffffffffc02090e8 <commands+0xdb8>
ffffffffc02029de:	82bfd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc02029e2:	00007697          	auipc	a3,0x7
ffffffffc02029e6:	86668693          	addi	a3,a3,-1946 # ffffffffc0209248 <commands+0xf18>
ffffffffc02029ea:	00006617          	auipc	a2,0x6
ffffffffc02029ee:	d5660613          	addi	a2,a2,-682 # ffffffffc0208740 <commands+0x410>
ffffffffc02029f2:	0cb00593          	li	a1,203
ffffffffc02029f6:	00006517          	auipc	a0,0x6
ffffffffc02029fa:	6f250513          	addi	a0,a0,1778 # ffffffffc02090e8 <commands+0xdb8>
ffffffffc02029fe:	80bfd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202a02:	00007697          	auipc	a3,0x7
ffffffffc0202a06:	82668693          	addi	a3,a3,-2010 # ffffffffc0209228 <commands+0xef8>
ffffffffc0202a0a:	00006617          	auipc	a2,0x6
ffffffffc0202a0e:	d3660613          	addi	a2,a2,-714 # ffffffffc0208740 <commands+0x410>
ffffffffc0202a12:	0c200593          	li	a1,194
ffffffffc0202a16:	00006517          	auipc	a0,0x6
ffffffffc0202a1a:	6d250513          	addi	a0,a0,1746 # ffffffffc02090e8 <commands+0xdb8>
ffffffffc0202a1e:	feafd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202a22:	00007697          	auipc	a3,0x7
ffffffffc0202a26:	89668693          	addi	a3,a3,-1898 # ffffffffc02092b8 <commands+0xf88>
ffffffffc0202a2a:	00006617          	auipc	a2,0x6
ffffffffc0202a2e:	d1660613          	addi	a2,a2,-746 # ffffffffc0208740 <commands+0x410>
ffffffffc0202a32:	0f800593          	li	a1,248
ffffffffc0202a36:	00006517          	auipc	a0,0x6
ffffffffc0202a3a:	6b250513          	addi	a0,a0,1714 # ffffffffc02090e8 <commands+0xdb8>
ffffffffc0202a3e:	fcafd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202a42:	00007697          	auipc	a3,0x7
ffffffffc0202a46:	86668693          	addi	a3,a3,-1946 # ffffffffc02092a8 <commands+0xf78>
ffffffffc0202a4a:	00006617          	auipc	a2,0x6
ffffffffc0202a4e:	cf660613          	addi	a2,a2,-778 # ffffffffc0208740 <commands+0x410>
ffffffffc0202a52:	0df00593          	li	a1,223
ffffffffc0202a56:	00006517          	auipc	a0,0x6
ffffffffc0202a5a:	69250513          	addi	a0,a0,1682 # ffffffffc02090e8 <commands+0xdb8>
ffffffffc0202a5e:	faafd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202a62:	00006697          	auipc	a3,0x6
ffffffffc0202a66:	7e668693          	addi	a3,a3,2022 # ffffffffc0209248 <commands+0xf18>
ffffffffc0202a6a:	00006617          	auipc	a2,0x6
ffffffffc0202a6e:	cd660613          	addi	a2,a2,-810 # ffffffffc0208740 <commands+0x410>
ffffffffc0202a72:	0dd00593          	li	a1,221
ffffffffc0202a76:	00006517          	auipc	a0,0x6
ffffffffc0202a7a:	67250513          	addi	a0,a0,1650 # ffffffffc02090e8 <commands+0xdb8>
ffffffffc0202a7e:	f8afd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202a82:	00007697          	auipc	a3,0x7
ffffffffc0202a86:	80668693          	addi	a3,a3,-2042 # ffffffffc0209288 <commands+0xf58>
ffffffffc0202a8a:	00006617          	auipc	a2,0x6
ffffffffc0202a8e:	cb660613          	addi	a2,a2,-842 # ffffffffc0208740 <commands+0x410>
ffffffffc0202a92:	0dc00593          	li	a1,220
ffffffffc0202a96:	00006517          	auipc	a0,0x6
ffffffffc0202a9a:	65250513          	addi	a0,a0,1618 # ffffffffc02090e8 <commands+0xdb8>
ffffffffc0202a9e:	f6afd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202aa2:	00006697          	auipc	a3,0x6
ffffffffc0202aa6:	67e68693          	addi	a3,a3,1662 # ffffffffc0209120 <commands+0xdf0>
ffffffffc0202aaa:	00006617          	auipc	a2,0x6
ffffffffc0202aae:	c9660613          	addi	a2,a2,-874 # ffffffffc0208740 <commands+0x410>
ffffffffc0202ab2:	0b900593          	li	a1,185
ffffffffc0202ab6:	00006517          	auipc	a0,0x6
ffffffffc0202aba:	63250513          	addi	a0,a0,1586 # ffffffffc02090e8 <commands+0xdb8>
ffffffffc0202abe:	f4afd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202ac2:	00006697          	auipc	a3,0x6
ffffffffc0202ac6:	78668693          	addi	a3,a3,1926 # ffffffffc0209248 <commands+0xf18>
ffffffffc0202aca:	00006617          	auipc	a2,0x6
ffffffffc0202ace:	c7660613          	addi	a2,a2,-906 # ffffffffc0208740 <commands+0x410>
ffffffffc0202ad2:	0d600593          	li	a1,214
ffffffffc0202ad6:	00006517          	auipc	a0,0x6
ffffffffc0202ada:	61250513          	addi	a0,a0,1554 # ffffffffc02090e8 <commands+0xdb8>
ffffffffc0202ade:	f2afd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202ae2:	00006697          	auipc	a3,0x6
ffffffffc0202ae6:	67e68693          	addi	a3,a3,1662 # ffffffffc0209160 <commands+0xe30>
ffffffffc0202aea:	00006617          	auipc	a2,0x6
ffffffffc0202aee:	c5660613          	addi	a2,a2,-938 # ffffffffc0208740 <commands+0x410>
ffffffffc0202af2:	0d400593          	li	a1,212
ffffffffc0202af6:	00006517          	auipc	a0,0x6
ffffffffc0202afa:	5f250513          	addi	a0,a0,1522 # ffffffffc02090e8 <commands+0xdb8>
ffffffffc0202afe:	f0afd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202b02:	00006697          	auipc	a3,0x6
ffffffffc0202b06:	63e68693          	addi	a3,a3,1598 # ffffffffc0209140 <commands+0xe10>
ffffffffc0202b0a:	00006617          	auipc	a2,0x6
ffffffffc0202b0e:	c3660613          	addi	a2,a2,-970 # ffffffffc0208740 <commands+0x410>
ffffffffc0202b12:	0d300593          	li	a1,211
ffffffffc0202b16:	00006517          	auipc	a0,0x6
ffffffffc0202b1a:	5d250513          	addi	a0,a0,1490 # ffffffffc02090e8 <commands+0xdb8>
ffffffffc0202b1e:	eeafd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202b22:	00006697          	auipc	a3,0x6
ffffffffc0202b26:	63e68693          	addi	a3,a3,1598 # ffffffffc0209160 <commands+0xe30>
ffffffffc0202b2a:	00006617          	auipc	a2,0x6
ffffffffc0202b2e:	c1660613          	addi	a2,a2,-1002 # ffffffffc0208740 <commands+0x410>
ffffffffc0202b32:	0bb00593          	li	a1,187
ffffffffc0202b36:	00006517          	auipc	a0,0x6
ffffffffc0202b3a:	5b250513          	addi	a0,a0,1458 # ffffffffc02090e8 <commands+0xdb8>
ffffffffc0202b3e:	ecafd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202b42:	00007697          	auipc	a3,0x7
ffffffffc0202b46:	8c668693          	addi	a3,a3,-1850 # ffffffffc0209408 <commands+0x10d8>
ffffffffc0202b4a:	00006617          	auipc	a2,0x6
ffffffffc0202b4e:	bf660613          	addi	a2,a2,-1034 # ffffffffc0208740 <commands+0x410>
ffffffffc0202b52:	12500593          	li	a1,293
ffffffffc0202b56:	00006517          	auipc	a0,0x6
ffffffffc0202b5a:	59250513          	addi	a0,a0,1426 # ffffffffc02090e8 <commands+0xdb8>
ffffffffc0202b5e:	eaafd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202b62:	00006697          	auipc	a3,0x6
ffffffffc0202b66:	74668693          	addi	a3,a3,1862 # ffffffffc02092a8 <commands+0xf78>
ffffffffc0202b6a:	00006617          	auipc	a2,0x6
ffffffffc0202b6e:	bd660613          	addi	a2,a2,-1066 # ffffffffc0208740 <commands+0x410>
ffffffffc0202b72:	11a00593          	li	a1,282
ffffffffc0202b76:	00006517          	auipc	a0,0x6
ffffffffc0202b7a:	57250513          	addi	a0,a0,1394 # ffffffffc02090e8 <commands+0xdb8>
ffffffffc0202b7e:	e8afd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202b82:	00006697          	auipc	a3,0x6
ffffffffc0202b86:	6c668693          	addi	a3,a3,1734 # ffffffffc0209248 <commands+0xf18>
ffffffffc0202b8a:	00006617          	auipc	a2,0x6
ffffffffc0202b8e:	bb660613          	addi	a2,a2,-1098 # ffffffffc0208740 <commands+0x410>
ffffffffc0202b92:	11800593          	li	a1,280
ffffffffc0202b96:	00006517          	auipc	a0,0x6
ffffffffc0202b9a:	55250513          	addi	a0,a0,1362 # ffffffffc02090e8 <commands+0xdb8>
ffffffffc0202b9e:	e6afd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202ba2:	00006697          	auipc	a3,0x6
ffffffffc0202ba6:	66668693          	addi	a3,a3,1638 # ffffffffc0209208 <commands+0xed8>
ffffffffc0202baa:	00006617          	auipc	a2,0x6
ffffffffc0202bae:	b9660613          	addi	a2,a2,-1130 # ffffffffc0208740 <commands+0x410>
ffffffffc0202bb2:	0c100593          	li	a1,193
ffffffffc0202bb6:	00006517          	auipc	a0,0x6
ffffffffc0202bba:	53250513          	addi	a0,a0,1330 # ffffffffc02090e8 <commands+0xdb8>
ffffffffc0202bbe:	e4afd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202bc2:	00007697          	auipc	a3,0x7
ffffffffc0202bc6:	80668693          	addi	a3,a3,-2042 # ffffffffc02093c8 <commands+0x1098>
ffffffffc0202bca:	00006617          	auipc	a2,0x6
ffffffffc0202bce:	b7660613          	addi	a2,a2,-1162 # ffffffffc0208740 <commands+0x410>
ffffffffc0202bd2:	11200593          	li	a1,274
ffffffffc0202bd6:	00006517          	auipc	a0,0x6
ffffffffc0202bda:	51250513          	addi	a0,a0,1298 # ffffffffc02090e8 <commands+0xdb8>
ffffffffc0202bde:	e2afd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202be2:	00006697          	auipc	a3,0x6
ffffffffc0202be6:	7c668693          	addi	a3,a3,1990 # ffffffffc02093a8 <commands+0x1078>
ffffffffc0202bea:	00006617          	auipc	a2,0x6
ffffffffc0202bee:	b5660613          	addi	a2,a2,-1194 # ffffffffc0208740 <commands+0x410>
ffffffffc0202bf2:	11000593          	li	a1,272
ffffffffc0202bf6:	00006517          	auipc	a0,0x6
ffffffffc0202bfa:	4f250513          	addi	a0,a0,1266 # ffffffffc02090e8 <commands+0xdb8>
ffffffffc0202bfe:	e0afd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202c02:	00006697          	auipc	a3,0x6
ffffffffc0202c06:	77e68693          	addi	a3,a3,1918 # ffffffffc0209380 <commands+0x1050>
ffffffffc0202c0a:	00006617          	auipc	a2,0x6
ffffffffc0202c0e:	b3660613          	addi	a2,a2,-1226 # ffffffffc0208740 <commands+0x410>
ffffffffc0202c12:	10e00593          	li	a1,270
ffffffffc0202c16:	00006517          	auipc	a0,0x6
ffffffffc0202c1a:	4d250513          	addi	a0,a0,1234 # ffffffffc02090e8 <commands+0xdb8>
ffffffffc0202c1e:	deafd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202c22:	00006697          	auipc	a3,0x6
ffffffffc0202c26:	73668693          	addi	a3,a3,1846 # ffffffffc0209358 <commands+0x1028>
ffffffffc0202c2a:	00006617          	auipc	a2,0x6
ffffffffc0202c2e:	b1660613          	addi	a2,a2,-1258 # ffffffffc0208740 <commands+0x410>
ffffffffc0202c32:	10d00593          	li	a1,269
ffffffffc0202c36:	00006517          	auipc	a0,0x6
ffffffffc0202c3a:	4b250513          	addi	a0,a0,1202 # ffffffffc02090e8 <commands+0xdb8>
ffffffffc0202c3e:	dcafd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202c42:	00006697          	auipc	a3,0x6
ffffffffc0202c46:	70668693          	addi	a3,a3,1798 # ffffffffc0209348 <commands+0x1018>
ffffffffc0202c4a:	00006617          	auipc	a2,0x6
ffffffffc0202c4e:	af660613          	addi	a2,a2,-1290 # ffffffffc0208740 <commands+0x410>
ffffffffc0202c52:	10800593          	li	a1,264
ffffffffc0202c56:	00006517          	auipc	a0,0x6
ffffffffc0202c5a:	49250513          	addi	a0,a0,1170 # ffffffffc02090e8 <commands+0xdb8>
ffffffffc0202c5e:	daafd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202c62:	00006697          	auipc	a3,0x6
ffffffffc0202c66:	5e668693          	addi	a3,a3,1510 # ffffffffc0209248 <commands+0xf18>
ffffffffc0202c6a:	00006617          	auipc	a2,0x6
ffffffffc0202c6e:	ad660613          	addi	a2,a2,-1322 # ffffffffc0208740 <commands+0x410>
ffffffffc0202c72:	10700593          	li	a1,263
ffffffffc0202c76:	00006517          	auipc	a0,0x6
ffffffffc0202c7a:	47250513          	addi	a0,a0,1138 # ffffffffc02090e8 <commands+0xdb8>
ffffffffc0202c7e:	d8afd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202c82:	00006697          	auipc	a3,0x6
ffffffffc0202c86:	6a668693          	addi	a3,a3,1702 # ffffffffc0209328 <commands+0xff8>
ffffffffc0202c8a:	00006617          	auipc	a2,0x6
ffffffffc0202c8e:	ab660613          	addi	a2,a2,-1354 # ffffffffc0208740 <commands+0x410>
ffffffffc0202c92:	10600593          	li	a1,262
ffffffffc0202c96:	00006517          	auipc	a0,0x6
ffffffffc0202c9a:	45250513          	addi	a0,a0,1106 # ffffffffc02090e8 <commands+0xdb8>
ffffffffc0202c9e:	d6afd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202ca2:	00006697          	auipc	a3,0x6
ffffffffc0202ca6:	65668693          	addi	a3,a3,1622 # ffffffffc02092f8 <commands+0xfc8>
ffffffffc0202caa:	00006617          	auipc	a2,0x6
ffffffffc0202cae:	a9660613          	addi	a2,a2,-1386 # ffffffffc0208740 <commands+0x410>
ffffffffc0202cb2:	10500593          	li	a1,261
ffffffffc0202cb6:	00006517          	auipc	a0,0x6
ffffffffc0202cba:	43250513          	addi	a0,a0,1074 # ffffffffc02090e8 <commands+0xdb8>
ffffffffc0202cbe:	d4afd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202cc2:	00006697          	auipc	a3,0x6
ffffffffc0202cc6:	61e68693          	addi	a3,a3,1566 # ffffffffc02092e0 <commands+0xfb0>
ffffffffc0202cca:	00006617          	auipc	a2,0x6
ffffffffc0202cce:	a7660613          	addi	a2,a2,-1418 # ffffffffc0208740 <commands+0x410>
ffffffffc0202cd2:	10400593          	li	a1,260
ffffffffc0202cd6:	00006517          	auipc	a0,0x6
ffffffffc0202cda:	41250513          	addi	a0,a0,1042 # ffffffffc02090e8 <commands+0xdb8>
ffffffffc0202cde:	d2afd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202ce2:	00006697          	auipc	a3,0x6
ffffffffc0202ce6:	56668693          	addi	a3,a3,1382 # ffffffffc0209248 <commands+0xf18>
ffffffffc0202cea:	00006617          	auipc	a2,0x6
ffffffffc0202cee:	a5660613          	addi	a2,a2,-1450 # ffffffffc0208740 <commands+0x410>
ffffffffc0202cf2:	0fe00593          	li	a1,254
ffffffffc0202cf6:	00006517          	auipc	a0,0x6
ffffffffc0202cfa:	3f250513          	addi	a0,a0,1010 # ffffffffc02090e8 <commands+0xdb8>
ffffffffc0202cfe:	d0afd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202d02:	00006697          	auipc	a3,0x6
ffffffffc0202d06:	5c668693          	addi	a3,a3,1478 # ffffffffc02092c8 <commands+0xf98>
ffffffffc0202d0a:	00006617          	auipc	a2,0x6
ffffffffc0202d0e:	a3660613          	addi	a2,a2,-1482 # ffffffffc0208740 <commands+0x410>
ffffffffc0202d12:	0f900593          	li	a1,249
ffffffffc0202d16:	00006517          	auipc	a0,0x6
ffffffffc0202d1a:	3d250513          	addi	a0,a0,978 # ffffffffc02090e8 <commands+0xdb8>
ffffffffc0202d1e:	ceafd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202d22:	00006697          	auipc	a3,0x6
ffffffffc0202d26:	6c668693          	addi	a3,a3,1734 # ffffffffc02093e8 <commands+0x10b8>
ffffffffc0202d2a:	00006617          	auipc	a2,0x6
ffffffffc0202d2e:	a1660613          	addi	a2,a2,-1514 # ffffffffc0208740 <commands+0x410>
ffffffffc0202d32:	11700593          	li	a1,279
ffffffffc0202d36:	00006517          	auipc	a0,0x6
ffffffffc0202d3a:	3b250513          	addi	a0,a0,946 # ffffffffc02090e8 <commands+0xdb8>
ffffffffc0202d3e:	ccafd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202d42:	00006697          	auipc	a3,0x6
ffffffffc0202d46:	6d668693          	addi	a3,a3,1750 # ffffffffc0209418 <commands+0x10e8>
ffffffffc0202d4a:	00006617          	auipc	a2,0x6
ffffffffc0202d4e:	9f660613          	addi	a2,a2,-1546 # ffffffffc0208740 <commands+0x410>
ffffffffc0202d52:	12600593          	li	a1,294
ffffffffc0202d56:	00006517          	auipc	a0,0x6
ffffffffc0202d5a:	39250513          	addi	a0,a0,914 # ffffffffc02090e8 <commands+0xdb8>
ffffffffc0202d5e:	caafd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202d62:	00006697          	auipc	a3,0x6
ffffffffc0202d66:	39e68693          	addi	a3,a3,926 # ffffffffc0209100 <commands+0xdd0>
ffffffffc0202d6a:	00006617          	auipc	a2,0x6
ffffffffc0202d6e:	9d660613          	addi	a2,a2,-1578 # ffffffffc0208740 <commands+0x410>
ffffffffc0202d72:	0f300593          	li	a1,243
ffffffffc0202d76:	00006517          	auipc	a0,0x6
ffffffffc0202d7a:	37250513          	addi	a0,a0,882 # ffffffffc02090e8 <commands+0xdb8>
ffffffffc0202d7e:	c8afd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202d82:	00006697          	auipc	a3,0x6
ffffffffc0202d86:	3be68693          	addi	a3,a3,958 # ffffffffc0209140 <commands+0xe10>
ffffffffc0202d8a:	00006617          	auipc	a2,0x6
ffffffffc0202d8e:	9b660613          	addi	a2,a2,-1610 # ffffffffc0208740 <commands+0x410>
ffffffffc0202d92:	0ba00593          	li	a1,186
ffffffffc0202d96:	00006517          	auipc	a0,0x6
ffffffffc0202d9a:	35250513          	addi	a0,a0,850 # ffffffffc02090e8 <commands+0xdb8>
ffffffffc0202d9e:	c6afd0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0202da2 <default_free_pages>:
ffffffffc0202da2:	1141                	addi	sp,sp,-16
ffffffffc0202da4:	e406                	sd	ra,8(sp)
ffffffffc0202da6:	12058f63          	beqz	a1,ffffffffc0202ee4 <default_free_pages+0x142>
ffffffffc0202daa:	00659693          	slli	a3,a1,0x6
ffffffffc0202dae:	96aa                	add	a3,a3,a0
ffffffffc0202db0:	87aa                	mv	a5,a0
ffffffffc0202db2:	02d50263          	beq	a0,a3,ffffffffc0202dd6 <default_free_pages+0x34>
ffffffffc0202db6:	6798                	ld	a4,8(a5)
ffffffffc0202db8:	8b05                	andi	a4,a4,1
ffffffffc0202dba:	10071563          	bnez	a4,ffffffffc0202ec4 <default_free_pages+0x122>
ffffffffc0202dbe:	6798                	ld	a4,8(a5)
ffffffffc0202dc0:	8b09                	andi	a4,a4,2
ffffffffc0202dc2:	10071163          	bnez	a4,ffffffffc0202ec4 <default_free_pages+0x122>
ffffffffc0202dc6:	0007b423          	sd	zero,8(a5)
ffffffffc0202dca:	0007a023          	sw	zero,0(a5)
ffffffffc0202dce:	04078793          	addi	a5,a5,64
ffffffffc0202dd2:	fed792e3          	bne	a5,a3,ffffffffc0202db6 <default_free_pages+0x14>
ffffffffc0202dd6:	2581                	sext.w	a1,a1
ffffffffc0202dd8:	c90c                	sw	a1,16(a0)
ffffffffc0202dda:	00850893          	addi	a7,a0,8
ffffffffc0202dde:	4789                	li	a5,2
ffffffffc0202de0:	40f8b02f          	amoor.d	zero,a5,(a7)
ffffffffc0202de4:	0003d697          	auipc	a3,0x3d
ffffffffc0202de8:	23c68693          	addi	a3,a3,572 # ffffffffc0240020 <free_area>
ffffffffc0202dec:	4a98                	lw	a4,16(a3)
ffffffffc0202dee:	669c                	ld	a5,8(a3)
ffffffffc0202df0:	01850613          	addi	a2,a0,24
ffffffffc0202df4:	9db9                	addw	a1,a1,a4
ffffffffc0202df6:	ca8c                	sw	a1,16(a3)
ffffffffc0202df8:	08d78f63          	beq	a5,a3,ffffffffc0202e96 <default_free_pages+0xf4>
ffffffffc0202dfc:	fe878713          	addi	a4,a5,-24
ffffffffc0202e00:	0006b803          	ld	a6,0(a3)
ffffffffc0202e04:	4581                	li	a1,0
ffffffffc0202e06:	00e56a63          	bltu	a0,a4,ffffffffc0202e1a <default_free_pages+0x78>
ffffffffc0202e0a:	6798                	ld	a4,8(a5)
ffffffffc0202e0c:	04d70a63          	beq	a4,a3,ffffffffc0202e60 <default_free_pages+0xbe>
ffffffffc0202e10:	87ba                	mv	a5,a4
ffffffffc0202e12:	fe878713          	addi	a4,a5,-24
ffffffffc0202e16:	fee57ae3          	bgeu	a0,a4,ffffffffc0202e0a <default_free_pages+0x68>
ffffffffc0202e1a:	c199                	beqz	a1,ffffffffc0202e20 <default_free_pages+0x7e>
ffffffffc0202e1c:	0106b023          	sd	a6,0(a3)
ffffffffc0202e20:	6398                	ld	a4,0(a5)
ffffffffc0202e22:	e390                	sd	a2,0(a5)
ffffffffc0202e24:	e710                	sd	a2,8(a4)
ffffffffc0202e26:	f11c                	sd	a5,32(a0)
ffffffffc0202e28:	ed18                	sd	a4,24(a0)
ffffffffc0202e2a:	00d70c63          	beq	a4,a3,ffffffffc0202e42 <default_free_pages+0xa0>
ffffffffc0202e2e:	ff872583          	lw	a1,-8(a4) # ff8 <_binary_obj___user_faultread_out_size-0xd58>
ffffffffc0202e32:	fe870613          	addi	a2,a4,-24
ffffffffc0202e36:	02059793          	slli	a5,a1,0x20
ffffffffc0202e3a:	83e9                	srli	a5,a5,0x1a
ffffffffc0202e3c:	97b2                	add	a5,a5,a2
ffffffffc0202e3e:	02f50b63          	beq	a0,a5,ffffffffc0202e74 <default_free_pages+0xd2>
ffffffffc0202e42:	7118                	ld	a4,32(a0)
ffffffffc0202e44:	00d70b63          	beq	a4,a3,ffffffffc0202e5a <default_free_pages+0xb8>
ffffffffc0202e48:	4910                	lw	a2,16(a0)
ffffffffc0202e4a:	fe870693          	addi	a3,a4,-24
ffffffffc0202e4e:	02061793          	slli	a5,a2,0x20
ffffffffc0202e52:	83e9                	srli	a5,a5,0x1a
ffffffffc0202e54:	97aa                	add	a5,a5,a0
ffffffffc0202e56:	04f68763          	beq	a3,a5,ffffffffc0202ea4 <default_free_pages+0x102>
ffffffffc0202e5a:	60a2                	ld	ra,8(sp)
ffffffffc0202e5c:	0141                	addi	sp,sp,16
ffffffffc0202e5e:	8082                	ret
ffffffffc0202e60:	e790                	sd	a2,8(a5)
ffffffffc0202e62:	f114                	sd	a3,32(a0)
ffffffffc0202e64:	6798                	ld	a4,8(a5)
ffffffffc0202e66:	ed1c                	sd	a5,24(a0)
ffffffffc0202e68:	02d70463          	beq	a4,a3,ffffffffc0202e90 <default_free_pages+0xee>
ffffffffc0202e6c:	8832                	mv	a6,a2
ffffffffc0202e6e:	4585                	li	a1,1
ffffffffc0202e70:	87ba                	mv	a5,a4
ffffffffc0202e72:	b745                	j	ffffffffc0202e12 <default_free_pages+0x70>
ffffffffc0202e74:	491c                	lw	a5,16(a0)
ffffffffc0202e76:	9dbd                	addw	a1,a1,a5
ffffffffc0202e78:	feb72c23          	sw	a1,-8(a4)
ffffffffc0202e7c:	57f5                	li	a5,-3
ffffffffc0202e7e:	60f8b02f          	amoand.d	zero,a5,(a7)
ffffffffc0202e82:	6d0c                	ld	a1,24(a0)
ffffffffc0202e84:	711c                	ld	a5,32(a0)
ffffffffc0202e86:	8532                	mv	a0,a2
ffffffffc0202e88:	e59c                	sd	a5,8(a1)
ffffffffc0202e8a:	6718                	ld	a4,8(a4)
ffffffffc0202e8c:	e38c                	sd	a1,0(a5)
ffffffffc0202e8e:	bf5d                	j	ffffffffc0202e44 <default_free_pages+0xa2>
ffffffffc0202e90:	e290                	sd	a2,0(a3)
ffffffffc0202e92:	873e                	mv	a4,a5
ffffffffc0202e94:	bf69                	j	ffffffffc0202e2e <default_free_pages+0x8c>
ffffffffc0202e96:	60a2                	ld	ra,8(sp)
ffffffffc0202e98:	e390                	sd	a2,0(a5)
ffffffffc0202e9a:	e790                	sd	a2,8(a5)
ffffffffc0202e9c:	f11c                	sd	a5,32(a0)
ffffffffc0202e9e:	ed1c                	sd	a5,24(a0)
ffffffffc0202ea0:	0141                	addi	sp,sp,16
ffffffffc0202ea2:	8082                	ret
ffffffffc0202ea4:	ff872783          	lw	a5,-8(a4)
ffffffffc0202ea8:	ff070693          	addi	a3,a4,-16
ffffffffc0202eac:	9e3d                	addw	a2,a2,a5
ffffffffc0202eae:	c910                	sw	a2,16(a0)
ffffffffc0202eb0:	57f5                	li	a5,-3
ffffffffc0202eb2:	60f6b02f          	amoand.d	zero,a5,(a3)
ffffffffc0202eb6:	6314                	ld	a3,0(a4)
ffffffffc0202eb8:	671c                	ld	a5,8(a4)
ffffffffc0202eba:	60a2                	ld	ra,8(sp)
ffffffffc0202ebc:	e69c                	sd	a5,8(a3)
ffffffffc0202ebe:	e394                	sd	a3,0(a5)
ffffffffc0202ec0:	0141                	addi	sp,sp,16
ffffffffc0202ec2:	8082                	ret
ffffffffc0202ec4:	00006697          	auipc	a3,0x6
ffffffffc0202ec8:	56c68693          	addi	a3,a3,1388 # ffffffffc0209430 <commands+0x1100>
ffffffffc0202ecc:	00006617          	auipc	a2,0x6
ffffffffc0202ed0:	87460613          	addi	a2,a2,-1932 # ffffffffc0208740 <commands+0x410>
ffffffffc0202ed4:	08300593          	li	a1,131
ffffffffc0202ed8:	00006517          	auipc	a0,0x6
ffffffffc0202edc:	21050513          	addi	a0,a0,528 # ffffffffc02090e8 <commands+0xdb8>
ffffffffc0202ee0:	b28fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202ee4:	00006697          	auipc	a3,0x6
ffffffffc0202ee8:	54468693          	addi	a3,a3,1348 # ffffffffc0209428 <commands+0x10f8>
ffffffffc0202eec:	00006617          	auipc	a2,0x6
ffffffffc0202ef0:	85460613          	addi	a2,a2,-1964 # ffffffffc0208740 <commands+0x410>
ffffffffc0202ef4:	08000593          	li	a1,128
ffffffffc0202ef8:	00006517          	auipc	a0,0x6
ffffffffc0202efc:	1f050513          	addi	a0,a0,496 # ffffffffc02090e8 <commands+0xdb8>
ffffffffc0202f00:	b08fd0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0202f04 <default_alloc_pages>:
ffffffffc0202f04:	c941                	beqz	a0,ffffffffc0202f94 <default_alloc_pages+0x90>
ffffffffc0202f06:	0003d597          	auipc	a1,0x3d
ffffffffc0202f0a:	11a58593          	addi	a1,a1,282 # ffffffffc0240020 <free_area>
ffffffffc0202f0e:	0105a803          	lw	a6,16(a1)
ffffffffc0202f12:	872a                	mv	a4,a0
ffffffffc0202f14:	02081793          	slli	a5,a6,0x20
ffffffffc0202f18:	9381                	srli	a5,a5,0x20
ffffffffc0202f1a:	00a7ee63          	bltu	a5,a0,ffffffffc0202f36 <default_alloc_pages+0x32>
ffffffffc0202f1e:	87ae                	mv	a5,a1
ffffffffc0202f20:	a801                	j	ffffffffc0202f30 <default_alloc_pages+0x2c>
ffffffffc0202f22:	ff87a683          	lw	a3,-8(a5)
ffffffffc0202f26:	02069613          	slli	a2,a3,0x20
ffffffffc0202f2a:	9201                	srli	a2,a2,0x20
ffffffffc0202f2c:	00e67763          	bgeu	a2,a4,ffffffffc0202f3a <default_alloc_pages+0x36>
ffffffffc0202f30:	679c                	ld	a5,8(a5)
ffffffffc0202f32:	feb798e3          	bne	a5,a1,ffffffffc0202f22 <default_alloc_pages+0x1e>
ffffffffc0202f36:	4501                	li	a0,0
ffffffffc0202f38:	8082                	ret
ffffffffc0202f3a:	0007b883          	ld	a7,0(a5)
ffffffffc0202f3e:	0087b303          	ld	t1,8(a5)
ffffffffc0202f42:	fe878513          	addi	a0,a5,-24
ffffffffc0202f46:	00070e1b          	sext.w	t3,a4
ffffffffc0202f4a:	0068b423          	sd	t1,8(a7)
ffffffffc0202f4e:	01133023          	sd	a7,0(t1)
ffffffffc0202f52:	02c77863          	bgeu	a4,a2,ffffffffc0202f82 <default_alloc_pages+0x7e>
ffffffffc0202f56:	071a                	slli	a4,a4,0x6
ffffffffc0202f58:	972a                	add	a4,a4,a0
ffffffffc0202f5a:	41c686bb          	subw	a3,a3,t3
ffffffffc0202f5e:	cb14                	sw	a3,16(a4)
ffffffffc0202f60:	00870613          	addi	a2,a4,8
ffffffffc0202f64:	4689                	li	a3,2
ffffffffc0202f66:	40d6302f          	amoor.d	zero,a3,(a2)
ffffffffc0202f6a:	0088b683          	ld	a3,8(a7)
ffffffffc0202f6e:	01870613          	addi	a2,a4,24
ffffffffc0202f72:	0105a803          	lw	a6,16(a1)
ffffffffc0202f76:	e290                	sd	a2,0(a3)
ffffffffc0202f78:	00c8b423          	sd	a2,8(a7)
ffffffffc0202f7c:	f314                	sd	a3,32(a4)
ffffffffc0202f7e:	01173c23          	sd	a7,24(a4)
ffffffffc0202f82:	41c8083b          	subw	a6,a6,t3
ffffffffc0202f86:	0105a823          	sw	a6,16(a1)
ffffffffc0202f8a:	5775                	li	a4,-3
ffffffffc0202f8c:	17c1                	addi	a5,a5,-16
ffffffffc0202f8e:	60e7b02f          	amoand.d	zero,a4,(a5)
ffffffffc0202f92:	8082                	ret
ffffffffc0202f94:	1141                	addi	sp,sp,-16
ffffffffc0202f96:	00006697          	auipc	a3,0x6
ffffffffc0202f9a:	49268693          	addi	a3,a3,1170 # ffffffffc0209428 <commands+0x10f8>
ffffffffc0202f9e:	00005617          	auipc	a2,0x5
ffffffffc0202fa2:	7a260613          	addi	a2,a2,1954 # ffffffffc0208740 <commands+0x410>
ffffffffc0202fa6:	06200593          	li	a1,98
ffffffffc0202faa:	00006517          	auipc	a0,0x6
ffffffffc0202fae:	13e50513          	addi	a0,a0,318 # ffffffffc02090e8 <commands+0xdb8>
ffffffffc0202fb2:	e406                	sd	ra,8(sp)
ffffffffc0202fb4:	a54fd0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0202fb8 <default_init_memmap>:
ffffffffc0202fb8:	1141                	addi	sp,sp,-16
ffffffffc0202fba:	e406                	sd	ra,8(sp)
ffffffffc0202fbc:	c5f1                	beqz	a1,ffffffffc0203088 <default_init_memmap+0xd0>
ffffffffc0202fbe:	00659693          	slli	a3,a1,0x6
ffffffffc0202fc2:	96aa                	add	a3,a3,a0
ffffffffc0202fc4:	87aa                	mv	a5,a0
ffffffffc0202fc6:	00d50f63          	beq	a0,a3,ffffffffc0202fe4 <default_init_memmap+0x2c>
ffffffffc0202fca:	6798                	ld	a4,8(a5)
ffffffffc0202fcc:	8b05                	andi	a4,a4,1
ffffffffc0202fce:	cf49                	beqz	a4,ffffffffc0203068 <default_init_memmap+0xb0>
ffffffffc0202fd0:	0007a823          	sw	zero,16(a5)
ffffffffc0202fd4:	0007b423          	sd	zero,8(a5)
ffffffffc0202fd8:	0007a023          	sw	zero,0(a5)
ffffffffc0202fdc:	04078793          	addi	a5,a5,64
ffffffffc0202fe0:	fed795e3          	bne	a5,a3,ffffffffc0202fca <default_init_memmap+0x12>
ffffffffc0202fe4:	2581                	sext.w	a1,a1
ffffffffc0202fe6:	c90c                	sw	a1,16(a0)
ffffffffc0202fe8:	4789                	li	a5,2
ffffffffc0202fea:	00850713          	addi	a4,a0,8
ffffffffc0202fee:	40f7302f          	amoor.d	zero,a5,(a4)
ffffffffc0202ff2:	0003d697          	auipc	a3,0x3d
ffffffffc0202ff6:	02e68693          	addi	a3,a3,46 # ffffffffc0240020 <free_area>
ffffffffc0202ffa:	4a98                	lw	a4,16(a3)
ffffffffc0202ffc:	669c                	ld	a5,8(a3)
ffffffffc0202ffe:	01850613          	addi	a2,a0,24
ffffffffc0203002:	9db9                	addw	a1,a1,a4
ffffffffc0203004:	ca8c                	sw	a1,16(a3)
ffffffffc0203006:	04d78a63          	beq	a5,a3,ffffffffc020305a <default_init_memmap+0xa2>
ffffffffc020300a:	fe878713          	addi	a4,a5,-24
ffffffffc020300e:	0006b803          	ld	a6,0(a3)
ffffffffc0203012:	4581                	li	a1,0
ffffffffc0203014:	00e56a63          	bltu	a0,a4,ffffffffc0203028 <default_init_memmap+0x70>
ffffffffc0203018:	6798                	ld	a4,8(a5)
ffffffffc020301a:	02d70263          	beq	a4,a3,ffffffffc020303e <default_init_memmap+0x86>
ffffffffc020301e:	87ba                	mv	a5,a4
ffffffffc0203020:	fe878713          	addi	a4,a5,-24
ffffffffc0203024:	fee57ae3          	bgeu	a0,a4,ffffffffc0203018 <default_init_memmap+0x60>
ffffffffc0203028:	c199                	beqz	a1,ffffffffc020302e <default_init_memmap+0x76>
ffffffffc020302a:	0106b023          	sd	a6,0(a3)
ffffffffc020302e:	6398                	ld	a4,0(a5)
ffffffffc0203030:	60a2                	ld	ra,8(sp)
ffffffffc0203032:	e390                	sd	a2,0(a5)
ffffffffc0203034:	e710                	sd	a2,8(a4)
ffffffffc0203036:	f11c                	sd	a5,32(a0)
ffffffffc0203038:	ed18                	sd	a4,24(a0)
ffffffffc020303a:	0141                	addi	sp,sp,16
ffffffffc020303c:	8082                	ret
ffffffffc020303e:	e790                	sd	a2,8(a5)
ffffffffc0203040:	f114                	sd	a3,32(a0)
ffffffffc0203042:	6798                	ld	a4,8(a5)
ffffffffc0203044:	ed1c                	sd	a5,24(a0)
ffffffffc0203046:	00d70663          	beq	a4,a3,ffffffffc0203052 <default_init_memmap+0x9a>
ffffffffc020304a:	8832                	mv	a6,a2
ffffffffc020304c:	4585                	li	a1,1
ffffffffc020304e:	87ba                	mv	a5,a4
ffffffffc0203050:	bfc1                	j	ffffffffc0203020 <default_init_memmap+0x68>
ffffffffc0203052:	60a2                	ld	ra,8(sp)
ffffffffc0203054:	e290                	sd	a2,0(a3)
ffffffffc0203056:	0141                	addi	sp,sp,16
ffffffffc0203058:	8082                	ret
ffffffffc020305a:	60a2                	ld	ra,8(sp)
ffffffffc020305c:	e390                	sd	a2,0(a5)
ffffffffc020305e:	e790                	sd	a2,8(a5)
ffffffffc0203060:	f11c                	sd	a5,32(a0)
ffffffffc0203062:	ed1c                	sd	a5,24(a0)
ffffffffc0203064:	0141                	addi	sp,sp,16
ffffffffc0203066:	8082                	ret
ffffffffc0203068:	00006697          	auipc	a3,0x6
ffffffffc020306c:	3f068693          	addi	a3,a3,1008 # ffffffffc0209458 <commands+0x1128>
ffffffffc0203070:	00005617          	auipc	a2,0x5
ffffffffc0203074:	6d060613          	addi	a2,a2,1744 # ffffffffc0208740 <commands+0x410>
ffffffffc0203078:	04900593          	li	a1,73
ffffffffc020307c:	00006517          	auipc	a0,0x6
ffffffffc0203080:	06c50513          	addi	a0,a0,108 # ffffffffc02090e8 <commands+0xdb8>
ffffffffc0203084:	984fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0203088:	00006697          	auipc	a3,0x6
ffffffffc020308c:	3a068693          	addi	a3,a3,928 # ffffffffc0209428 <commands+0x10f8>
ffffffffc0203090:	00005617          	auipc	a2,0x5
ffffffffc0203094:	6b060613          	addi	a2,a2,1712 # ffffffffc0208740 <commands+0x410>
ffffffffc0203098:	04600593          	li	a1,70
ffffffffc020309c:	00006517          	auipc	a0,0x6
ffffffffc02030a0:	04c50513          	addi	a0,a0,76 # ffffffffc02090e8 <commands+0xdb8>
ffffffffc02030a4:	964fd0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc02030a8 <mom>:
ffffffffc02030a8:	715d                	addi	sp,sp,-80
ffffffffc02030aa:	e0a2                	sd	s0,64(sp)
ffffffffc02030ac:	fc26                	sd	s1,56(sp)
ffffffffc02030ae:	f84a                	sd	s2,48(sp)
ffffffffc02030b0:	f44e                	sd	s3,40(sp)
ffffffffc02030b2:	f052                	sd	s4,32(sp)
ffffffffc02030b4:	ec56                	sd	s5,24(sp)
ffffffffc02030b6:	e85a                	sd	s6,16(sp)
ffffffffc02030b8:	e45e                	sd	s7,8(sp)
ffffffffc02030ba:	e062                	sd	s8,0(sp)
ffffffffc02030bc:	e486                	sd	ra,72(sp)
ffffffffc02030be:	00032417          	auipc	s0,0x32
ffffffffc02030c2:	9b240413          	addi	s0,s0,-1614 # ffffffffc0234a70 <milk>
ffffffffc02030c6:	0003d497          	auipc	s1,0x3d
ffffffffc02030ca:	f9a48493          	addi	s1,s1,-102 # ffffffffc0240060 <mutex>
ffffffffc02030ce:	00006b17          	auipc	s6,0x6
ffffffffc02030d2:	3eab0b13          	addi	s6,s6,1002 # ffffffffc02094b8 <default_pmm_manager+0x38>
ffffffffc02030d6:	00006997          	auipc	s3,0x6
ffffffffc02030da:	3fa98993          	addi	s3,s3,1018 # ffffffffc02094d0 <default_pmm_manager+0x50>
ffffffffc02030de:	0003d917          	auipc	s2,0x3d
ffffffffc02030e2:	f6290913          	addi	s2,s2,-158 # ffffffffc0240040 <p1>
ffffffffc02030e6:	00006a97          	auipc	s5,0x6
ffffffffc02030ea:	3faa8a93          	addi	s5,s5,1018 # ffffffffc02094e0 <default_pmm_manager+0x60>
ffffffffc02030ee:	00006a17          	auipc	s4,0x6
ffffffffc02030f2:	412a0a13          	addi	s4,s4,1042 # ffffffffc0209500 <default_pmm_manager+0x80>
ffffffffc02030f6:	00006c17          	auipc	s8,0x6
ffffffffc02030fa:	462c0c13          	addi	s8,s8,1122 # ffffffffc0209558 <default_pmm_manager+0xd8>
ffffffffc02030fe:	00006b97          	auipc	s7,0x6
ffffffffc0203102:	41ab8b93          	addi	s7,s7,1050 # ffffffffc0209518 <default_pmm_manager+0x98>
ffffffffc0203106:	8526                	mv	a0,s1
ffffffffc0203108:	51e000ef          	jal	ra,ffffffffc0203626 <down>
ffffffffc020310c:	855a                	mv	a0,s6
ffffffffc020310e:	fbffc0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0203112:	401c                	lw	a5,0(s0)
ffffffffc0203114:	00f05e63          	blez	a5,ffffffffc0203130 <mom+0x88>
ffffffffc0203118:	854e                	mv	a0,s3
ffffffffc020311a:	fb3fc0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc020311e:	8526                	mv	a0,s1
ffffffffc0203120:	504000ef          	jal	ra,ffffffffc0203624 <up>
ffffffffc0203124:	854a                	mv	a0,s2
ffffffffc0203126:	544000ef          	jal	ra,ffffffffc020366a <cond_wait>
ffffffffc020312a:	401c                	lw	a5,0(s0)
ffffffffc020312c:	fef046e3          	bgtz	a5,ffffffffc0203118 <mom+0x70>
ffffffffc0203130:	8556                	mv	a0,s5
ffffffffc0203132:	f9bfc0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0203136:	8552                	mv	a0,s4
ffffffffc0203138:	f95fc0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc020313c:	401c                	lw	a5,0(s0)
ffffffffc020313e:	00f05c63          	blez	a5,ffffffffc0203156 <mom+0xae>
ffffffffc0203142:	855e                	mv	a0,s7
ffffffffc0203144:	f89fc0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0203148:	8526                	mv	a0,s1
ffffffffc020314a:	4da000ef          	jal	ra,ffffffffc0203624 <up>
ffffffffc020314e:	4529                	li	a0,10
ffffffffc0203150:	105010ef          	jal	ra,ffffffffc0204a54 <do_sleep>
ffffffffc0203154:	bf4d                	j	ffffffffc0203106 <mom+0x5e>
ffffffffc0203156:	0647879b          	addiw	a5,a5,100
ffffffffc020315a:	8562                	mv	a0,s8
ffffffffc020315c:	c01c                	sw	a5,0(s0)
ffffffffc020315e:	f6ffc0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0203162:	b7dd                	j	ffffffffc0203148 <mom+0xa0>

ffffffffc0203164 <sister>:
ffffffffc0203164:	715d                	addi	sp,sp,-80
ffffffffc0203166:	e0a2                	sd	s0,64(sp)
ffffffffc0203168:	fc26                	sd	s1,56(sp)
ffffffffc020316a:	f84a                	sd	s2,48(sp)
ffffffffc020316c:	f44e                	sd	s3,40(sp)
ffffffffc020316e:	f052                	sd	s4,32(sp)
ffffffffc0203170:	ec56                	sd	s5,24(sp)
ffffffffc0203172:	e85a                	sd	s6,16(sp)
ffffffffc0203174:	e45e                	sd	s7,8(sp)
ffffffffc0203176:	e062                	sd	s8,0(sp)
ffffffffc0203178:	e486                	sd	ra,72(sp)
ffffffffc020317a:	00032417          	auipc	s0,0x32
ffffffffc020317e:	8f640413          	addi	s0,s0,-1802 # ffffffffc0234a70 <milk>
ffffffffc0203182:	0003d497          	auipc	s1,0x3d
ffffffffc0203186:	ede48493          	addi	s1,s1,-290 # ffffffffc0240060 <mutex>
ffffffffc020318a:	00006b17          	auipc	s6,0x6
ffffffffc020318e:	3f6b0b13          	addi	s6,s6,1014 # ffffffffc0209580 <default_pmm_manager+0x100>
ffffffffc0203192:	00006997          	auipc	s3,0x6
ffffffffc0203196:	40698993          	addi	s3,s3,1030 # ffffffffc0209598 <default_pmm_manager+0x118>
ffffffffc020319a:	0003d917          	auipc	s2,0x3d
ffffffffc020319e:	ea690913          	addi	s2,s2,-346 # ffffffffc0240040 <p1>
ffffffffc02031a2:	00006a97          	auipc	s5,0x6
ffffffffc02031a6:	406a8a93          	addi	s5,s5,1030 # ffffffffc02095a8 <default_pmm_manager+0x128>
ffffffffc02031aa:	00006a17          	auipc	s4,0x6
ffffffffc02031ae:	41ea0a13          	addi	s4,s4,1054 # ffffffffc02095c8 <default_pmm_manager+0x148>
ffffffffc02031b2:	00006c17          	auipc	s8,0x6
ffffffffc02031b6:	42ec0c13          	addi	s8,s8,1070 # ffffffffc02095e0 <default_pmm_manager+0x160>
ffffffffc02031ba:	00006b97          	auipc	s7,0x6
ffffffffc02031be:	35eb8b93          	addi	s7,s7,862 # ffffffffc0209518 <default_pmm_manager+0x98>
ffffffffc02031c2:	8526                	mv	a0,s1
ffffffffc02031c4:	462000ef          	jal	ra,ffffffffc0203626 <down>
ffffffffc02031c8:	855a                	mv	a0,s6
ffffffffc02031ca:	f03fc0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02031ce:	401c                	lw	a5,0(s0)
ffffffffc02031d0:	00f05e63          	blez	a5,ffffffffc02031ec <sister+0x88>
ffffffffc02031d4:	854e                	mv	a0,s3
ffffffffc02031d6:	ef7fc0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02031da:	8526                	mv	a0,s1
ffffffffc02031dc:	448000ef          	jal	ra,ffffffffc0203624 <up>
ffffffffc02031e0:	854a                	mv	a0,s2
ffffffffc02031e2:	488000ef          	jal	ra,ffffffffc020366a <cond_wait>
ffffffffc02031e6:	401c                	lw	a5,0(s0)
ffffffffc02031e8:	fef046e3          	bgtz	a5,ffffffffc02031d4 <sister+0x70>
ffffffffc02031ec:	8556                	mv	a0,s5
ffffffffc02031ee:	edffc0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02031f2:	8552                	mv	a0,s4
ffffffffc02031f4:	ed9fc0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02031f8:	401c                	lw	a5,0(s0)
ffffffffc02031fa:	00f05c63          	blez	a5,ffffffffc0203212 <sister+0xae>
ffffffffc02031fe:	855e                	mv	a0,s7
ffffffffc0203200:	ecdfc0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0203204:	8526                	mv	a0,s1
ffffffffc0203206:	41e000ef          	jal	ra,ffffffffc0203624 <up>
ffffffffc020320a:	4529                	li	a0,10
ffffffffc020320c:	049010ef          	jal	ra,ffffffffc0204a54 <do_sleep>
ffffffffc0203210:	bf4d                	j	ffffffffc02031c2 <sister+0x5e>
ffffffffc0203212:	0647879b          	addiw	a5,a5,100
ffffffffc0203216:	8562                	mv	a0,s8
ffffffffc0203218:	c01c                	sw	a5,0(s0)
ffffffffc020321a:	eb3fc0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc020321e:	b7dd                	j	ffffffffc0203204 <sister+0xa0>

ffffffffc0203220 <dad>:
ffffffffc0203220:	7139                	addi	sp,sp,-64
ffffffffc0203222:	f822                	sd	s0,48(sp)
ffffffffc0203224:	f426                	sd	s1,40(sp)
ffffffffc0203226:	f04a                	sd	s2,32(sp)
ffffffffc0203228:	ec4e                	sd	s3,24(sp)
ffffffffc020322a:	e852                	sd	s4,16(sp)
ffffffffc020322c:	e456                	sd	s5,8(sp)
ffffffffc020322e:	fc06                	sd	ra,56(sp)
ffffffffc0203230:	00032497          	auipc	s1,0x32
ffffffffc0203234:	84048493          	addi	s1,s1,-1984 # ffffffffc0234a70 <milk>
ffffffffc0203238:	0003d417          	auipc	s0,0x3d
ffffffffc020323c:	e2840413          	addi	s0,s0,-472 # ffffffffc0240060 <mutex>
ffffffffc0203240:	00006997          	auipc	s3,0x6
ffffffffc0203244:	3c898993          	addi	s3,s3,968 # ffffffffc0209608 <default_pmm_manager+0x188>
ffffffffc0203248:	00006a97          	auipc	s5,0x6
ffffffffc020324c:	400a8a93          	addi	s5,s5,1024 # ffffffffc0209648 <default_pmm_manager+0x1c8>
ffffffffc0203250:	0003d917          	auipc	s2,0x3d
ffffffffc0203254:	df090913          	addi	s2,s2,-528 # ffffffffc0240040 <p1>
ffffffffc0203258:	00006a17          	auipc	s4,0x6
ffffffffc020325c:	3c8a0a13          	addi	s4,s4,968 # ffffffffc0209620 <default_pmm_manager+0x1a0>
ffffffffc0203260:	a821                	j	ffffffffc0203278 <dad+0x58>
ffffffffc0203262:	3fe000ef          	jal	ra,ffffffffc0203660 <cond_signal>
ffffffffc0203266:	8552                	mv	a0,s4
ffffffffc0203268:	e65fc0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc020326c:	8522                	mv	a0,s0
ffffffffc020326e:	3b6000ef          	jal	ra,ffffffffc0203624 <up>
ffffffffc0203272:	4529                	li	a0,10
ffffffffc0203274:	7e0010ef          	jal	ra,ffffffffc0204a54 <do_sleep>
ffffffffc0203278:	8522                	mv	a0,s0
ffffffffc020327a:	3ac000ef          	jal	ra,ffffffffc0203626 <down>
ffffffffc020327e:	854e                	mv	a0,s3
ffffffffc0203280:	e4dfc0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0203284:	409c                	lw	a5,0(s1)
ffffffffc0203286:	854a                	mv	a0,s2
ffffffffc0203288:	dfe9                	beqz	a5,ffffffffc0203262 <dad+0x42>
ffffffffc020328a:	37b1                	addiw	a5,a5,-20
ffffffffc020328c:	8556                	mv	a0,s5
ffffffffc020328e:	c09c                	sw	a5,0(s1)
ffffffffc0203290:	e3dfc0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0203294:	bfe1                	j	ffffffffc020326c <dad+0x4c>

ffffffffc0203296 <you>:
ffffffffc0203296:	7139                	addi	sp,sp,-64
ffffffffc0203298:	f822                	sd	s0,48(sp)
ffffffffc020329a:	f426                	sd	s1,40(sp)
ffffffffc020329c:	f04a                	sd	s2,32(sp)
ffffffffc020329e:	ec4e                	sd	s3,24(sp)
ffffffffc02032a0:	e852                	sd	s4,16(sp)
ffffffffc02032a2:	e456                	sd	s5,8(sp)
ffffffffc02032a4:	fc06                	sd	ra,56(sp)
ffffffffc02032a6:	00031497          	auipc	s1,0x31
ffffffffc02032aa:	7ca48493          	addi	s1,s1,1994 # ffffffffc0234a70 <milk>
ffffffffc02032ae:	0003d417          	auipc	s0,0x3d
ffffffffc02032b2:	db240413          	addi	s0,s0,-590 # ffffffffc0240060 <mutex>
ffffffffc02032b6:	00006997          	auipc	s3,0x6
ffffffffc02032ba:	3aa98993          	addi	s3,s3,938 # ffffffffc0209660 <default_pmm_manager+0x1e0>
ffffffffc02032be:	00006a97          	auipc	s5,0x6
ffffffffc02032c2:	3e2a8a93          	addi	s5,s5,994 # ffffffffc02096a0 <default_pmm_manager+0x220>
ffffffffc02032c6:	0003d917          	auipc	s2,0x3d
ffffffffc02032ca:	d7a90913          	addi	s2,s2,-646 # ffffffffc0240040 <p1>
ffffffffc02032ce:	00006a17          	auipc	s4,0x6
ffffffffc02032d2:	3aaa0a13          	addi	s4,s4,938 # ffffffffc0209678 <default_pmm_manager+0x1f8>
ffffffffc02032d6:	a821                	j	ffffffffc02032ee <you+0x58>
ffffffffc02032d8:	388000ef          	jal	ra,ffffffffc0203660 <cond_signal>
ffffffffc02032dc:	8552                	mv	a0,s4
ffffffffc02032de:	deffc0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02032e2:	8522                	mv	a0,s0
ffffffffc02032e4:	340000ef          	jal	ra,ffffffffc0203624 <up>
ffffffffc02032e8:	4529                	li	a0,10
ffffffffc02032ea:	76a010ef          	jal	ra,ffffffffc0204a54 <do_sleep>
ffffffffc02032ee:	8522                	mv	a0,s0
ffffffffc02032f0:	336000ef          	jal	ra,ffffffffc0203626 <down>
ffffffffc02032f4:	854e                	mv	a0,s3
ffffffffc02032f6:	dd7fc0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02032fa:	409c                	lw	a5,0(s1)
ffffffffc02032fc:	854a                	mv	a0,s2
ffffffffc02032fe:	dfe9                	beqz	a5,ffffffffc02032d8 <you+0x42>
ffffffffc0203300:	37b1                	addiw	a5,a5,-20
ffffffffc0203302:	8556                	mv	a0,s5
ffffffffc0203304:	c09c                	sw	a5,0(s1)
ffffffffc0203306:	dc7fc0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc020330a:	bfe1                	j	ffffffffc02032e2 <you+0x4c>

ffffffffc020330c <check_milk>:
ffffffffc020330c:	7179                	addi	sp,sp,-48
ffffffffc020330e:	4585                	li	a1,1
ffffffffc0203310:	0003d517          	auipc	a0,0x3d
ffffffffc0203314:	d5050513          	addi	a0,a0,-688 # ffffffffc0240060 <mutex>
ffffffffc0203318:	f406                	sd	ra,40(sp)
ffffffffc020331a:	f022                	sd	s0,32(sp)
ffffffffc020331c:	ec26                	sd	s1,24(sp)
ffffffffc020331e:	e84a                	sd	s2,16(sp)
ffffffffc0203320:	e44e                	sd	s3,8(sp)
ffffffffc0203322:	2fa000ef          	jal	ra,ffffffffc020361c <sem_init>
ffffffffc0203326:	0003d517          	auipc	a0,0x3d
ffffffffc020332a:	d1a50513          	addi	a0,a0,-742 # ffffffffc0240040 <p1>
ffffffffc020332e:	32a000ef          	jal	ra,ffffffffc0203658 <cond_init>
ffffffffc0203332:	4601                	li	a2,0
ffffffffc0203334:	4581                	li	a1,0
ffffffffc0203336:	00000517          	auipc	a0,0x0
ffffffffc020333a:	eea50513          	addi	a0,a0,-278 # ffffffffc0203220 <dad>
ffffffffc020333e:	2d5000ef          	jal	ra,ffffffffc0203e12 <kernel_thread>
ffffffffc0203342:	89aa                	mv	s3,a0
ffffffffc0203344:	4601                	li	a2,0
ffffffffc0203346:	4581                	li	a1,0
ffffffffc0203348:	00000517          	auipc	a0,0x0
ffffffffc020334c:	d6050513          	addi	a0,a0,-672 # ffffffffc02030a8 <mom>
ffffffffc0203350:	2c3000ef          	jal	ra,ffffffffc0203e12 <kernel_thread>
ffffffffc0203354:	892a                	mv	s2,a0
ffffffffc0203356:	4601                	li	a2,0
ffffffffc0203358:	4581                	li	a1,0
ffffffffc020335a:	00000517          	auipc	a0,0x0
ffffffffc020335e:	e0a50513          	addi	a0,a0,-502 # ffffffffc0203164 <sister>
ffffffffc0203362:	2b1000ef          	jal	ra,ffffffffc0203e12 <kernel_thread>
ffffffffc0203366:	4601                	li	a2,0
ffffffffc0203368:	84aa                	mv	s1,a0
ffffffffc020336a:	4581                	li	a1,0
ffffffffc020336c:	00000517          	auipc	a0,0x0
ffffffffc0203370:	f2a50513          	addi	a0,a0,-214 # ffffffffc0203296 <you>
ffffffffc0203374:	29f000ef          	jal	ra,ffffffffc0203e12 <kernel_thread>
ffffffffc0203378:	842a                	mv	s0,a0
ffffffffc020337a:	854e                	mv	a0,s3
ffffffffc020337c:	66c000ef          	jal	ra,ffffffffc02039e8 <find_proc>
ffffffffc0203380:	00006597          	auipc	a1,0x6
ffffffffc0203384:	33858593          	addi	a1,a1,824 # ffffffffc02096b8 <default_pmm_manager+0x238>
ffffffffc0203388:	0003d797          	auipc	a5,0x3d
ffffffffc020338c:	d0a7b023          	sd	a0,-768(a5) # ffffffffc0240088 <pdad>
ffffffffc0203390:	5c2000ef          	jal	ra,ffffffffc0203952 <set_proc_name>
ffffffffc0203394:	854a                	mv	a0,s2
ffffffffc0203396:	652000ef          	jal	ra,ffffffffc02039e8 <find_proc>
ffffffffc020339a:	00006597          	auipc	a1,0x6
ffffffffc020339e:	32658593          	addi	a1,a1,806 # ffffffffc02096c0 <default_pmm_manager+0x240>
ffffffffc02033a2:	0003d797          	auipc	a5,0x3d
ffffffffc02033a6:	cca7bf23          	sd	a0,-802(a5) # ffffffffc0240080 <pmom>
ffffffffc02033aa:	5a8000ef          	jal	ra,ffffffffc0203952 <set_proc_name>
ffffffffc02033ae:	8526                	mv	a0,s1
ffffffffc02033b0:	638000ef          	jal	ra,ffffffffc02039e8 <find_proc>
ffffffffc02033b4:	00006597          	auipc	a1,0x6
ffffffffc02033b8:	31458593          	addi	a1,a1,788 # ffffffffc02096c8 <default_pmm_manager+0x248>
ffffffffc02033bc:	0003d797          	auipc	a5,0x3d
ffffffffc02033c0:	c6a7be23          	sd	a0,-900(a5) # ffffffffc0240038 <psister>
ffffffffc02033c4:	58e000ef          	jal	ra,ffffffffc0203952 <set_proc_name>
ffffffffc02033c8:	8522                	mv	a0,s0
ffffffffc02033ca:	61e000ef          	jal	ra,ffffffffc02039e8 <find_proc>
ffffffffc02033ce:	7402                	ld	s0,32(sp)
ffffffffc02033d0:	70a2                	ld	ra,40(sp)
ffffffffc02033d2:	64e2                	ld	s1,24(sp)
ffffffffc02033d4:	6942                	ld	s2,16(sp)
ffffffffc02033d6:	69a2                	ld	s3,8(sp)
ffffffffc02033d8:	0003d797          	auipc	a5,0x3d
ffffffffc02033dc:	caa7b023          	sd	a0,-864(a5) # ffffffffc0240078 <pyou>
ffffffffc02033e0:	00006597          	auipc	a1,0x6
ffffffffc02033e4:	2f058593          	addi	a1,a1,752 # ffffffffc02096d0 <default_pmm_manager+0x250>
ffffffffc02033e8:	6145                	addi	sp,sp,48
ffffffffc02033ea:	a3a5                	j	ffffffffc0203952 <set_proc_name>

ffffffffc02033ec <wait_queue_del.part.0>:
ffffffffc02033ec:	1141                	addi	sp,sp,-16
ffffffffc02033ee:	00006697          	auipc	a3,0x6
ffffffffc02033f2:	2ea68693          	addi	a3,a3,746 # ffffffffc02096d8 <default_pmm_manager+0x258>
ffffffffc02033f6:	00005617          	auipc	a2,0x5
ffffffffc02033fa:	34a60613          	addi	a2,a2,842 # ffffffffc0208740 <commands+0x410>
ffffffffc02033fe:	45f1                	li	a1,28
ffffffffc0203400:	00006517          	auipc	a0,0x6
ffffffffc0203404:	31850513          	addi	a0,a0,792 # ffffffffc0209718 <default_pmm_manager+0x298>
ffffffffc0203408:	e406                	sd	ra,8(sp)
ffffffffc020340a:	dfffc0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc020340e <wait_queue_init>:
ffffffffc020340e:	e508                	sd	a0,8(a0)
ffffffffc0203410:	e108                	sd	a0,0(a0)
ffffffffc0203412:	8082                	ret

ffffffffc0203414 <wait_queue_del>:
ffffffffc0203414:	7198                	ld	a4,32(a1)
ffffffffc0203416:	01858793          	addi	a5,a1,24
ffffffffc020341a:	00e78b63          	beq	a5,a4,ffffffffc0203430 <wait_queue_del+0x1c>
ffffffffc020341e:	6994                	ld	a3,16(a1)
ffffffffc0203420:	00a69863          	bne	a3,a0,ffffffffc0203430 <wait_queue_del+0x1c>
ffffffffc0203424:	6d94                	ld	a3,24(a1)
ffffffffc0203426:	e698                	sd	a4,8(a3)
ffffffffc0203428:	e314                	sd	a3,0(a4)
ffffffffc020342a:	f19c                	sd	a5,32(a1)
ffffffffc020342c:	ed9c                	sd	a5,24(a1)
ffffffffc020342e:	8082                	ret
ffffffffc0203430:	1141                	addi	sp,sp,-16
ffffffffc0203432:	e406                	sd	ra,8(sp)
ffffffffc0203434:	fb9ff0ef          	jal	ra,ffffffffc02033ec <wait_queue_del.part.0>

ffffffffc0203438 <wait_queue_first>:
ffffffffc0203438:	651c                	ld	a5,8(a0)
ffffffffc020343a:	00f50563          	beq	a0,a5,ffffffffc0203444 <wait_queue_first+0xc>
ffffffffc020343e:	fe878513          	addi	a0,a5,-24
ffffffffc0203442:	8082                	ret
ffffffffc0203444:	4501                	li	a0,0
ffffffffc0203446:	8082                	ret

ffffffffc0203448 <wait_in_queue>:
ffffffffc0203448:	711c                	ld	a5,32(a0)
ffffffffc020344a:	0561                	addi	a0,a0,24
ffffffffc020344c:	40a78533          	sub	a0,a5,a0
ffffffffc0203450:	00a03533          	snez	a0,a0
ffffffffc0203454:	8082                	ret

ffffffffc0203456 <wakeup_wait>:
ffffffffc0203456:	ce91                	beqz	a3,ffffffffc0203472 <wakeup_wait+0x1c>
ffffffffc0203458:	7198                	ld	a4,32(a1)
ffffffffc020345a:	01858793          	addi	a5,a1,24
ffffffffc020345e:	00e78e63          	beq	a5,a4,ffffffffc020347a <wakeup_wait+0x24>
ffffffffc0203462:	6994                	ld	a3,16(a1)
ffffffffc0203464:	00d51b63          	bne	a0,a3,ffffffffc020347a <wakeup_wait+0x24>
ffffffffc0203468:	6d94                	ld	a3,24(a1)
ffffffffc020346a:	e698                	sd	a4,8(a3)
ffffffffc020346c:	e314                	sd	a3,0(a4)
ffffffffc020346e:	f19c                	sd	a5,32(a1)
ffffffffc0203470:	ed9c                	sd	a5,24(a1)
ffffffffc0203472:	6188                	ld	a0,0(a1)
ffffffffc0203474:	c590                	sw	a2,8(a1)
ffffffffc0203476:	6b40106f          	j	ffffffffc0204b2a <wakeup_proc>
ffffffffc020347a:	1141                	addi	sp,sp,-16
ffffffffc020347c:	e406                	sd	ra,8(sp)
ffffffffc020347e:	f6fff0ef          	jal	ra,ffffffffc02033ec <wait_queue_del.part.0>

ffffffffc0203482 <wait_current_set>:
ffffffffc0203482:	0003d797          	auipc	a5,0x3d
ffffffffc0203486:	a667b783          	ld	a5,-1434(a5) # ffffffffc023fee8 <current>
ffffffffc020348a:	c39d                	beqz	a5,ffffffffc02034b0 <wait_current_set+0x2e>
ffffffffc020348c:	01858713          	addi	a4,a1,24
ffffffffc0203490:	800006b7          	lui	a3,0x80000
ffffffffc0203494:	ed98                	sd	a4,24(a1)
ffffffffc0203496:	e19c                	sd	a5,0(a1)
ffffffffc0203498:	c594                	sw	a3,8(a1)
ffffffffc020349a:	4685                	li	a3,1
ffffffffc020349c:	c394                	sw	a3,0(a5)
ffffffffc020349e:	0ec7a623          	sw	a2,236(a5)
ffffffffc02034a2:	611c                	ld	a5,0(a0)
ffffffffc02034a4:	e988                	sd	a0,16(a1)
ffffffffc02034a6:	e118                	sd	a4,0(a0)
ffffffffc02034a8:	e798                	sd	a4,8(a5)
ffffffffc02034aa:	f188                	sd	a0,32(a1)
ffffffffc02034ac:	ed9c                	sd	a5,24(a1)
ffffffffc02034ae:	8082                	ret
ffffffffc02034b0:	1141                	addi	sp,sp,-16
ffffffffc02034b2:	00006697          	auipc	a3,0x6
ffffffffc02034b6:	27e68693          	addi	a3,a3,638 # ffffffffc0209730 <default_pmm_manager+0x2b0>
ffffffffc02034ba:	00005617          	auipc	a2,0x5
ffffffffc02034be:	28660613          	addi	a2,a2,646 # ffffffffc0208740 <commands+0x410>
ffffffffc02034c2:	07400593          	li	a1,116
ffffffffc02034c6:	00006517          	auipc	a0,0x6
ffffffffc02034ca:	25250513          	addi	a0,a0,594 # ffffffffc0209718 <default_pmm_manager+0x298>
ffffffffc02034ce:	e406                	sd	ra,8(sp)
ffffffffc02034d0:	d39fc0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc02034d4 <__down.constprop.0>:
ffffffffc02034d4:	715d                	addi	sp,sp,-80
ffffffffc02034d6:	e0a2                	sd	s0,64(sp)
ffffffffc02034d8:	e486                	sd	ra,72(sp)
ffffffffc02034da:	fc26                	sd	s1,56(sp)
ffffffffc02034dc:	842a                	mv	s0,a0
ffffffffc02034de:	100027f3          	csrr	a5,sstatus
ffffffffc02034e2:	8b89                	andi	a5,a5,2
ffffffffc02034e4:	ebb1                	bnez	a5,ffffffffc0203538 <__down.constprop.0+0x64>
ffffffffc02034e6:	411c                	lw	a5,0(a0)
ffffffffc02034e8:	00f05a63          	blez	a5,ffffffffc02034fc <__down.constprop.0+0x28>
ffffffffc02034ec:	37fd                	addiw	a5,a5,-1
ffffffffc02034ee:	c11c                	sw	a5,0(a0)
ffffffffc02034f0:	4501                	li	a0,0
ffffffffc02034f2:	60a6                	ld	ra,72(sp)
ffffffffc02034f4:	6406                	ld	s0,64(sp)
ffffffffc02034f6:	74e2                	ld	s1,56(sp)
ffffffffc02034f8:	6161                	addi	sp,sp,80
ffffffffc02034fa:	8082                	ret
ffffffffc02034fc:	00850413          	addi	s0,a0,8
ffffffffc0203500:	0024                	addi	s1,sp,8
ffffffffc0203502:	10000613          	li	a2,256
ffffffffc0203506:	85a6                	mv	a1,s1
ffffffffc0203508:	8522                	mv	a0,s0
ffffffffc020350a:	f79ff0ef          	jal	ra,ffffffffc0203482 <wait_current_set>
ffffffffc020350e:	6ce010ef          	jal	ra,ffffffffc0204bdc <schedule>
ffffffffc0203512:	100027f3          	csrr	a5,sstatus
ffffffffc0203516:	8b89                	andi	a5,a5,2
ffffffffc0203518:	efb9                	bnez	a5,ffffffffc0203576 <__down.constprop.0+0xa2>
ffffffffc020351a:	8526                	mv	a0,s1
ffffffffc020351c:	f2dff0ef          	jal	ra,ffffffffc0203448 <wait_in_queue>
ffffffffc0203520:	e531                	bnez	a0,ffffffffc020356c <__down.constprop.0+0x98>
ffffffffc0203522:	4542                	lw	a0,16(sp)
ffffffffc0203524:	10000793          	li	a5,256
ffffffffc0203528:	fcf515e3          	bne	a0,a5,ffffffffc02034f2 <__down.constprop.0+0x1e>
ffffffffc020352c:	60a6                	ld	ra,72(sp)
ffffffffc020352e:	6406                	ld	s0,64(sp)
ffffffffc0203530:	74e2                	ld	s1,56(sp)
ffffffffc0203532:	4501                	li	a0,0
ffffffffc0203534:	6161                	addi	sp,sp,80
ffffffffc0203536:	8082                	ret
ffffffffc0203538:	900fd0ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc020353c:	401c                	lw	a5,0(s0)
ffffffffc020353e:	00f05c63          	blez	a5,ffffffffc0203556 <__down.constprop.0+0x82>
ffffffffc0203542:	37fd                	addiw	a5,a5,-1
ffffffffc0203544:	c01c                	sw	a5,0(s0)
ffffffffc0203546:	8ecfd0ef          	jal	ra,ffffffffc0200632 <intr_enable>
ffffffffc020354a:	60a6                	ld	ra,72(sp)
ffffffffc020354c:	6406                	ld	s0,64(sp)
ffffffffc020354e:	74e2                	ld	s1,56(sp)
ffffffffc0203550:	4501                	li	a0,0
ffffffffc0203552:	6161                	addi	sp,sp,80
ffffffffc0203554:	8082                	ret
ffffffffc0203556:	0421                	addi	s0,s0,8
ffffffffc0203558:	0024                	addi	s1,sp,8
ffffffffc020355a:	10000613          	li	a2,256
ffffffffc020355e:	85a6                	mv	a1,s1
ffffffffc0203560:	8522                	mv	a0,s0
ffffffffc0203562:	f21ff0ef          	jal	ra,ffffffffc0203482 <wait_current_set>
ffffffffc0203566:	8ccfd0ef          	jal	ra,ffffffffc0200632 <intr_enable>
ffffffffc020356a:	b755                	j	ffffffffc020350e <__down.constprop.0+0x3a>
ffffffffc020356c:	85a6                	mv	a1,s1
ffffffffc020356e:	8522                	mv	a0,s0
ffffffffc0203570:	ea5ff0ef          	jal	ra,ffffffffc0203414 <wait_queue_del>
ffffffffc0203574:	b77d                	j	ffffffffc0203522 <__down.constprop.0+0x4e>
ffffffffc0203576:	8c2fd0ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc020357a:	8526                	mv	a0,s1
ffffffffc020357c:	ecdff0ef          	jal	ra,ffffffffc0203448 <wait_in_queue>
ffffffffc0203580:	e501                	bnez	a0,ffffffffc0203588 <__down.constprop.0+0xb4>
ffffffffc0203582:	8b0fd0ef          	jal	ra,ffffffffc0200632 <intr_enable>
ffffffffc0203586:	bf71                	j	ffffffffc0203522 <__down.constprop.0+0x4e>
ffffffffc0203588:	85a6                	mv	a1,s1
ffffffffc020358a:	8522                	mv	a0,s0
ffffffffc020358c:	e89ff0ef          	jal	ra,ffffffffc0203414 <wait_queue_del>
ffffffffc0203590:	bfcd                	j	ffffffffc0203582 <__down.constprop.0+0xae>

ffffffffc0203592 <__up.constprop.0>:
ffffffffc0203592:	1101                	addi	sp,sp,-32
ffffffffc0203594:	e822                	sd	s0,16(sp)
ffffffffc0203596:	ec06                	sd	ra,24(sp)
ffffffffc0203598:	e426                	sd	s1,8(sp)
ffffffffc020359a:	e04a                	sd	s2,0(sp)
ffffffffc020359c:	842a                	mv	s0,a0
ffffffffc020359e:	100027f3          	csrr	a5,sstatus
ffffffffc02035a2:	8b89                	andi	a5,a5,2
ffffffffc02035a4:	4901                	li	s2,0
ffffffffc02035a6:	eba1                	bnez	a5,ffffffffc02035f6 <__up.constprop.0+0x64>
ffffffffc02035a8:	00840493          	addi	s1,s0,8
ffffffffc02035ac:	8526                	mv	a0,s1
ffffffffc02035ae:	e8bff0ef          	jal	ra,ffffffffc0203438 <wait_queue_first>
ffffffffc02035b2:	85aa                	mv	a1,a0
ffffffffc02035b4:	cd0d                	beqz	a0,ffffffffc02035ee <__up.constprop.0+0x5c>
ffffffffc02035b6:	6118                	ld	a4,0(a0)
ffffffffc02035b8:	10000793          	li	a5,256
ffffffffc02035bc:	0ec72703          	lw	a4,236(a4)
ffffffffc02035c0:	02f71f63          	bne	a4,a5,ffffffffc02035fe <__up.constprop.0+0x6c>
ffffffffc02035c4:	4685                	li	a3,1
ffffffffc02035c6:	10000613          	li	a2,256
ffffffffc02035ca:	8526                	mv	a0,s1
ffffffffc02035cc:	e8bff0ef          	jal	ra,ffffffffc0203456 <wakeup_wait>
ffffffffc02035d0:	00091863          	bnez	s2,ffffffffc02035e0 <__up.constprop.0+0x4e>
ffffffffc02035d4:	60e2                	ld	ra,24(sp)
ffffffffc02035d6:	6442                	ld	s0,16(sp)
ffffffffc02035d8:	64a2                	ld	s1,8(sp)
ffffffffc02035da:	6902                	ld	s2,0(sp)
ffffffffc02035dc:	6105                	addi	sp,sp,32
ffffffffc02035de:	8082                	ret
ffffffffc02035e0:	6442                	ld	s0,16(sp)
ffffffffc02035e2:	60e2                	ld	ra,24(sp)
ffffffffc02035e4:	64a2                	ld	s1,8(sp)
ffffffffc02035e6:	6902                	ld	s2,0(sp)
ffffffffc02035e8:	6105                	addi	sp,sp,32
ffffffffc02035ea:	848fd06f          	j	ffffffffc0200632 <intr_enable>
ffffffffc02035ee:	401c                	lw	a5,0(s0)
ffffffffc02035f0:	2785                	addiw	a5,a5,1
ffffffffc02035f2:	c01c                	sw	a5,0(s0)
ffffffffc02035f4:	bff1                	j	ffffffffc02035d0 <__up.constprop.0+0x3e>
ffffffffc02035f6:	842fd0ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc02035fa:	4905                	li	s2,1
ffffffffc02035fc:	b775                	j	ffffffffc02035a8 <__up.constprop.0+0x16>
ffffffffc02035fe:	00006697          	auipc	a3,0x6
ffffffffc0203602:	14268693          	addi	a3,a3,322 # ffffffffc0209740 <default_pmm_manager+0x2c0>
ffffffffc0203606:	00005617          	auipc	a2,0x5
ffffffffc020360a:	13a60613          	addi	a2,a2,314 # ffffffffc0208740 <commands+0x410>
ffffffffc020360e:	45e5                	li	a1,25
ffffffffc0203610:	00006517          	auipc	a0,0x6
ffffffffc0203614:	15850513          	addi	a0,a0,344 # ffffffffc0209768 <default_pmm_manager+0x2e8>
ffffffffc0203618:	bf1fc0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc020361c <sem_init>:
ffffffffc020361c:	c10c                	sw	a1,0(a0)
ffffffffc020361e:	0521                	addi	a0,a0,8
ffffffffc0203620:	defff06f          	j	ffffffffc020340e <wait_queue_init>

ffffffffc0203624 <up>:
ffffffffc0203624:	b7bd                	j	ffffffffc0203592 <__up.constprop.0>

ffffffffc0203626 <down>:
ffffffffc0203626:	1141                	addi	sp,sp,-16
ffffffffc0203628:	e406                	sd	ra,8(sp)
ffffffffc020362a:	eabff0ef          	jal	ra,ffffffffc02034d4 <__down.constprop.0>
ffffffffc020362e:	2501                	sext.w	a0,a0
ffffffffc0203630:	e501                	bnez	a0,ffffffffc0203638 <down+0x12>
ffffffffc0203632:	60a2                	ld	ra,8(sp)
ffffffffc0203634:	0141                	addi	sp,sp,16
ffffffffc0203636:	8082                	ret
ffffffffc0203638:	00006697          	auipc	a3,0x6
ffffffffc020363c:	14068693          	addi	a3,a3,320 # ffffffffc0209778 <default_pmm_manager+0x2f8>
ffffffffc0203640:	00005617          	auipc	a2,0x5
ffffffffc0203644:	10060613          	addi	a2,a2,256 # ffffffffc0208740 <commands+0x410>
ffffffffc0203648:	04000593          	li	a1,64
ffffffffc020364c:	00006517          	auipc	a0,0x6
ffffffffc0203650:	11c50513          	addi	a0,a0,284 # ffffffffc0209768 <default_pmm_manager+0x2e8>
ffffffffc0203654:	bb5fc0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0203658 <cond_init>:
ffffffffc0203658:	00052c23          	sw	zero,24(a0)
ffffffffc020365c:	4581                	li	a1,0
ffffffffc020365e:	bf7d                	j	ffffffffc020361c <sem_init>

ffffffffc0203660 <cond_signal>:
ffffffffc0203660:	4d1c                	lw	a5,24(a0)
ffffffffc0203662:	00f04363          	bgtz	a5,ffffffffc0203668 <cond_signal+0x8>
ffffffffc0203666:	8082                	ret
ffffffffc0203668:	bf75                	j	ffffffffc0203624 <up>

ffffffffc020366a <cond_wait>:
ffffffffc020366a:	4d1c                	lw	a5,24(a0)
ffffffffc020366c:	1141                	addi	sp,sp,-16
ffffffffc020366e:	e022                	sd	s0,0(sp)
ffffffffc0203670:	2785                	addiw	a5,a5,1
ffffffffc0203672:	cd1c                	sw	a5,24(a0)
ffffffffc0203674:	e406                	sd	ra,8(sp)
ffffffffc0203676:	842a                	mv	s0,a0
ffffffffc0203678:	fafff0ef          	jal	ra,ffffffffc0203626 <down>
ffffffffc020367c:	4c1c                	lw	a5,24(s0)
ffffffffc020367e:	60a2                	ld	ra,8(sp)
ffffffffc0203680:	37fd                	addiw	a5,a5,-1
ffffffffc0203682:	cc1c                	sw	a5,24(s0)
ffffffffc0203684:	6402                	ld	s0,0(sp)
ffffffffc0203686:	0141                	addi	sp,sp,16
ffffffffc0203688:	8082                	ret

ffffffffc020368a <swapfs_init>:
ffffffffc020368a:	1141                	addi	sp,sp,-16
ffffffffc020368c:	4505                	li	a0,1
ffffffffc020368e:	e406                	sd	ra,8(sp)
ffffffffc0203690:	e93fc0ef          	jal	ra,ffffffffc0200522 <ide_device_valid>
ffffffffc0203694:	cd01                	beqz	a0,ffffffffc02036ac <swapfs_init+0x22>
ffffffffc0203696:	4505                	li	a0,1
ffffffffc0203698:	e91fc0ef          	jal	ra,ffffffffc0200528 <ide_device_size>
ffffffffc020369c:	60a2                	ld	ra,8(sp)
ffffffffc020369e:	810d                	srli	a0,a0,0x3
ffffffffc02036a0:	0003d797          	auipc	a5,0x3d
ffffffffc02036a4:	92a7b823          	sd	a0,-1744(a5) # ffffffffc023ffd0 <max_swap_offset>
ffffffffc02036a8:	0141                	addi	sp,sp,16
ffffffffc02036aa:	8082                	ret
ffffffffc02036ac:	00006617          	auipc	a2,0x6
ffffffffc02036b0:	0dc60613          	addi	a2,a2,220 # ffffffffc0209788 <default_pmm_manager+0x308>
ffffffffc02036b4:	45b5                	li	a1,13
ffffffffc02036b6:	00006517          	auipc	a0,0x6
ffffffffc02036ba:	0f250513          	addi	a0,a0,242 # ffffffffc02097a8 <default_pmm_manager+0x328>
ffffffffc02036be:	b4bfc0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc02036c2 <swapfs_read>:
ffffffffc02036c2:	1141                	addi	sp,sp,-16
ffffffffc02036c4:	e406                	sd	ra,8(sp)
ffffffffc02036c6:	00855793          	srli	a5,a0,0x8
ffffffffc02036ca:	cbb1                	beqz	a5,ffffffffc020371e <swapfs_read+0x5c>
ffffffffc02036cc:	0003d717          	auipc	a4,0x3d
ffffffffc02036d0:	90473703          	ld	a4,-1788(a4) # ffffffffc023ffd0 <max_swap_offset>
ffffffffc02036d4:	04e7f563          	bgeu	a5,a4,ffffffffc020371e <swapfs_read+0x5c>
ffffffffc02036d8:	0003d617          	auipc	a2,0x3d
ffffffffc02036dc:	86063603          	ld	a2,-1952(a2) # ffffffffc023ff38 <pages>
ffffffffc02036e0:	8d91                	sub	a1,a1,a2
ffffffffc02036e2:	4065d613          	srai	a2,a1,0x6
ffffffffc02036e6:	00007717          	auipc	a4,0x7
ffffffffc02036ea:	1ba73703          	ld	a4,442(a4) # ffffffffc020a8a0 <nbase>
ffffffffc02036ee:	963a                	add	a2,a2,a4
ffffffffc02036f0:	00c61713          	slli	a4,a2,0xc
ffffffffc02036f4:	8331                	srli	a4,a4,0xc
ffffffffc02036f6:	0003c697          	auipc	a3,0x3c
ffffffffc02036fa:	7ca6b683          	ld	a3,1994(a3) # ffffffffc023fec0 <npage>
ffffffffc02036fe:	0037959b          	slliw	a1,a5,0x3
ffffffffc0203702:	0632                	slli	a2,a2,0xc
ffffffffc0203704:	02d77963          	bgeu	a4,a3,ffffffffc0203736 <swapfs_read+0x74>
ffffffffc0203708:	60a2                	ld	ra,8(sp)
ffffffffc020370a:	0003d797          	auipc	a5,0x3d
ffffffffc020370e:	81e7b783          	ld	a5,-2018(a5) # ffffffffc023ff28 <va_pa_offset>
ffffffffc0203712:	46a1                	li	a3,8
ffffffffc0203714:	963e                	add	a2,a2,a5
ffffffffc0203716:	4505                	li	a0,1
ffffffffc0203718:	0141                	addi	sp,sp,16
ffffffffc020371a:	e15fc06f          	j	ffffffffc020052e <ide_read_secs>
ffffffffc020371e:	86aa                	mv	a3,a0
ffffffffc0203720:	00006617          	auipc	a2,0x6
ffffffffc0203724:	0a060613          	addi	a2,a2,160 # ffffffffc02097c0 <default_pmm_manager+0x340>
ffffffffc0203728:	45d1                	li	a1,20
ffffffffc020372a:	00006517          	auipc	a0,0x6
ffffffffc020372e:	07e50513          	addi	a0,a0,126 # ffffffffc02097a8 <default_pmm_manager+0x328>
ffffffffc0203732:	ad7fc0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0203736:	86b2                	mv	a3,a2
ffffffffc0203738:	06900593          	li	a1,105
ffffffffc020373c:	00005617          	auipc	a2,0x5
ffffffffc0203740:	3b460613          	addi	a2,a2,948 # ffffffffc0208af0 <commands+0x7c0>
ffffffffc0203744:	00005517          	auipc	a0,0x5
ffffffffc0203748:	30c50513          	addi	a0,a0,780 # ffffffffc0208a50 <commands+0x720>
ffffffffc020374c:	abdfc0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0203750 <swapfs_write>:
ffffffffc0203750:	1141                	addi	sp,sp,-16
ffffffffc0203752:	e406                	sd	ra,8(sp)
ffffffffc0203754:	00855793          	srli	a5,a0,0x8
ffffffffc0203758:	cbb1                	beqz	a5,ffffffffc02037ac <swapfs_write+0x5c>
ffffffffc020375a:	0003d717          	auipc	a4,0x3d
ffffffffc020375e:	87673703          	ld	a4,-1930(a4) # ffffffffc023ffd0 <max_swap_offset>
ffffffffc0203762:	04e7f563          	bgeu	a5,a4,ffffffffc02037ac <swapfs_write+0x5c>
ffffffffc0203766:	0003c617          	auipc	a2,0x3c
ffffffffc020376a:	7d263603          	ld	a2,2002(a2) # ffffffffc023ff38 <pages>
ffffffffc020376e:	8d91                	sub	a1,a1,a2
ffffffffc0203770:	4065d613          	srai	a2,a1,0x6
ffffffffc0203774:	00007717          	auipc	a4,0x7
ffffffffc0203778:	12c73703          	ld	a4,300(a4) # ffffffffc020a8a0 <nbase>
ffffffffc020377c:	963a                	add	a2,a2,a4
ffffffffc020377e:	00c61713          	slli	a4,a2,0xc
ffffffffc0203782:	8331                	srli	a4,a4,0xc
ffffffffc0203784:	0003c697          	auipc	a3,0x3c
ffffffffc0203788:	73c6b683          	ld	a3,1852(a3) # ffffffffc023fec0 <npage>
ffffffffc020378c:	0037959b          	slliw	a1,a5,0x3
ffffffffc0203790:	0632                	slli	a2,a2,0xc
ffffffffc0203792:	02d77963          	bgeu	a4,a3,ffffffffc02037c4 <swapfs_write+0x74>
ffffffffc0203796:	60a2                	ld	ra,8(sp)
ffffffffc0203798:	0003c797          	auipc	a5,0x3c
ffffffffc020379c:	7907b783          	ld	a5,1936(a5) # ffffffffc023ff28 <va_pa_offset>
ffffffffc02037a0:	46a1                	li	a3,8
ffffffffc02037a2:	963e                	add	a2,a2,a5
ffffffffc02037a4:	4505                	li	a0,1
ffffffffc02037a6:	0141                	addi	sp,sp,16
ffffffffc02037a8:	dabfc06f          	j	ffffffffc0200552 <ide_write_secs>
ffffffffc02037ac:	86aa                	mv	a3,a0
ffffffffc02037ae:	00006617          	auipc	a2,0x6
ffffffffc02037b2:	01260613          	addi	a2,a2,18 # ffffffffc02097c0 <default_pmm_manager+0x340>
ffffffffc02037b6:	45e5                	li	a1,25
ffffffffc02037b8:	00006517          	auipc	a0,0x6
ffffffffc02037bc:	ff050513          	addi	a0,a0,-16 # ffffffffc02097a8 <default_pmm_manager+0x328>
ffffffffc02037c0:	a49fc0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc02037c4:	86b2                	mv	a3,a2
ffffffffc02037c6:	06900593          	li	a1,105
ffffffffc02037ca:	00005617          	auipc	a2,0x5
ffffffffc02037ce:	32660613          	addi	a2,a2,806 # ffffffffc0208af0 <commands+0x7c0>
ffffffffc02037d2:	00005517          	auipc	a0,0x5
ffffffffc02037d6:	27e50513          	addi	a0,a0,638 # ffffffffc0208a50 <commands+0x720>
ffffffffc02037da:	a2ffc0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc02037de <kernel_thread_entry>:
ffffffffc02037de:	8526                	mv	a0,s1
ffffffffc02037e0:	9402                	jalr	s0
ffffffffc02037e2:	680000ef          	jal	ra,ffffffffc0203e62 <do_exit>

ffffffffc02037e6 <switch_to>:
ffffffffc02037e6:	00153023          	sd	ra,0(a0)
ffffffffc02037ea:	00253423          	sd	sp,8(a0)
ffffffffc02037ee:	e900                	sd	s0,16(a0)
ffffffffc02037f0:	ed04                	sd	s1,24(a0)
ffffffffc02037f2:	03253023          	sd	s2,32(a0)
ffffffffc02037f6:	03353423          	sd	s3,40(a0)
ffffffffc02037fa:	03453823          	sd	s4,48(a0)
ffffffffc02037fe:	03553c23          	sd	s5,56(a0)
ffffffffc0203802:	05653023          	sd	s6,64(a0)
ffffffffc0203806:	05753423          	sd	s7,72(a0)
ffffffffc020380a:	05853823          	sd	s8,80(a0)
ffffffffc020380e:	05953c23          	sd	s9,88(a0)
ffffffffc0203812:	07a53023          	sd	s10,96(a0)
ffffffffc0203816:	07b53423          	sd	s11,104(a0)
ffffffffc020381a:	0005b083          	ld	ra,0(a1)
ffffffffc020381e:	0085b103          	ld	sp,8(a1)
ffffffffc0203822:	6980                	ld	s0,16(a1)
ffffffffc0203824:	6d84                	ld	s1,24(a1)
ffffffffc0203826:	0205b903          	ld	s2,32(a1)
ffffffffc020382a:	0285b983          	ld	s3,40(a1)
ffffffffc020382e:	0305ba03          	ld	s4,48(a1)
ffffffffc0203832:	0385ba83          	ld	s5,56(a1)
ffffffffc0203836:	0405bb03          	ld	s6,64(a1)
ffffffffc020383a:	0485bb83          	ld	s7,72(a1)
ffffffffc020383e:	0505bc03          	ld	s8,80(a1)
ffffffffc0203842:	0585bc83          	ld	s9,88(a1)
ffffffffc0203846:	0605bd03          	ld	s10,96(a1)
ffffffffc020384a:	0685bd83          	ld	s11,104(a1)
ffffffffc020384e:	8082                	ret

ffffffffc0203850 <alloc_proc>:
ffffffffc0203850:	1141                	addi	sp,sp,-16
ffffffffc0203852:	14800513          	li	a0,328
ffffffffc0203856:	e022                	sd	s0,0(sp)
ffffffffc0203858:	e406                	sd	ra,8(sp)
ffffffffc020385a:	817fe0ef          	jal	ra,ffffffffc0202070 <kmalloc>
ffffffffc020385e:	842a                	mv	s0,a0
ffffffffc0203860:	cd21                	beqz	a0,ffffffffc02038b8 <alloc_proc+0x68>
ffffffffc0203862:	57fd                	li	a5,-1
ffffffffc0203864:	1782                	slli	a5,a5,0x20
ffffffffc0203866:	e11c                	sd	a5,0(a0)
ffffffffc0203868:	07000613          	li	a2,112
ffffffffc020386c:	4581                	li	a1,0
ffffffffc020386e:	00052423          	sw	zero,8(a0)
ffffffffc0203872:	00053823          	sd	zero,16(a0)
ffffffffc0203876:	00053c23          	sd	zero,24(a0)
ffffffffc020387a:	02053023          	sd	zero,32(a0)
ffffffffc020387e:	02053423          	sd	zero,40(a0)
ffffffffc0203882:	03050513          	addi	a0,a0,48
ffffffffc0203886:	3dc040ef          	jal	ra,ffffffffc0207c62 <memset>
ffffffffc020388a:	0003c797          	auipc	a5,0x3c
ffffffffc020388e:	6a67b783          	ld	a5,1702(a5) # ffffffffc023ff30 <boot_cr3>
ffffffffc0203892:	0a043023          	sd	zero,160(s0)
ffffffffc0203896:	f45c                	sd	a5,168(s0)
ffffffffc0203898:	0a042823          	sw	zero,176(s0)
ffffffffc020389c:	463d                	li	a2,15
ffffffffc020389e:	4581                	li	a1,0
ffffffffc02038a0:	0b440513          	addi	a0,s0,180
ffffffffc02038a4:	3be040ef          	jal	ra,ffffffffc0207c62 <memset>
ffffffffc02038a8:	0e042623          	sw	zero,236(s0)
ffffffffc02038ac:	0e043c23          	sd	zero,248(s0)
ffffffffc02038b0:	10043023          	sd	zero,256(s0)
ffffffffc02038b4:	0e043823          	sd	zero,240(s0)
ffffffffc02038b8:	60a2                	ld	ra,8(sp)
ffffffffc02038ba:	8522                	mv	a0,s0
ffffffffc02038bc:	6402                	ld	s0,0(sp)
ffffffffc02038be:	0141                	addi	sp,sp,16
ffffffffc02038c0:	8082                	ret

ffffffffc02038c2 <forkret>:
ffffffffc02038c2:	0003c797          	auipc	a5,0x3c
ffffffffc02038c6:	6267b783          	ld	a5,1574(a5) # ffffffffc023fee8 <current>
ffffffffc02038ca:	73c8                	ld	a0,160(a5)
ffffffffc02038cc:	c5efd06f          	j	ffffffffc0200d2a <forkrets>

ffffffffc02038d0 <setup_pgdir.isra.0>:
ffffffffc02038d0:	1101                	addi	sp,sp,-32
ffffffffc02038d2:	e426                	sd	s1,8(sp)
ffffffffc02038d4:	84aa                	mv	s1,a0
ffffffffc02038d6:	4505                	li	a0,1
ffffffffc02038d8:	ec06                	sd	ra,24(sp)
ffffffffc02038da:	e822                	sd	s0,16(sp)
ffffffffc02038dc:	c6efd0ef          	jal	ra,ffffffffc0200d4a <alloc_pages>
ffffffffc02038e0:	c939                	beqz	a0,ffffffffc0203936 <setup_pgdir.isra.0+0x66>
ffffffffc02038e2:	0003c697          	auipc	a3,0x3c
ffffffffc02038e6:	6566b683          	ld	a3,1622(a3) # ffffffffc023ff38 <pages>
ffffffffc02038ea:	40d506b3          	sub	a3,a0,a3
ffffffffc02038ee:	8699                	srai	a3,a3,0x6
ffffffffc02038f0:	00007417          	auipc	s0,0x7
ffffffffc02038f4:	fb043403          	ld	s0,-80(s0) # ffffffffc020a8a0 <nbase>
ffffffffc02038f8:	96a2                	add	a3,a3,s0
ffffffffc02038fa:	00c69793          	slli	a5,a3,0xc
ffffffffc02038fe:	83b1                	srli	a5,a5,0xc
ffffffffc0203900:	0003c717          	auipc	a4,0x3c
ffffffffc0203904:	5c073703          	ld	a4,1472(a4) # ffffffffc023fec0 <npage>
ffffffffc0203908:	06b2                	slli	a3,a3,0xc
ffffffffc020390a:	02e7f863          	bgeu	a5,a4,ffffffffc020393a <setup_pgdir.isra.0+0x6a>
ffffffffc020390e:	0003c417          	auipc	s0,0x3c
ffffffffc0203912:	61a43403          	ld	s0,1562(s0) # ffffffffc023ff28 <va_pa_offset>
ffffffffc0203916:	9436                	add	s0,s0,a3
ffffffffc0203918:	6605                	lui	a2,0x1
ffffffffc020391a:	0003c597          	auipc	a1,0x3c
ffffffffc020391e:	59e5b583          	ld	a1,1438(a1) # ffffffffc023feb8 <boot_pgdir>
ffffffffc0203922:	8522                	mv	a0,s0
ffffffffc0203924:	350040ef          	jal	ra,ffffffffc0207c74 <memcpy>
ffffffffc0203928:	4501                	li	a0,0
ffffffffc020392a:	e080                	sd	s0,0(s1)
ffffffffc020392c:	60e2                	ld	ra,24(sp)
ffffffffc020392e:	6442                	ld	s0,16(sp)
ffffffffc0203930:	64a2                	ld	s1,8(sp)
ffffffffc0203932:	6105                	addi	sp,sp,32
ffffffffc0203934:	8082                	ret
ffffffffc0203936:	5571                	li	a0,-4
ffffffffc0203938:	bfd5                	j	ffffffffc020392c <setup_pgdir.isra.0+0x5c>
ffffffffc020393a:	00005617          	auipc	a2,0x5
ffffffffc020393e:	1b660613          	addi	a2,a2,438 # ffffffffc0208af0 <commands+0x7c0>
ffffffffc0203942:	06900593          	li	a1,105
ffffffffc0203946:	00005517          	auipc	a0,0x5
ffffffffc020394a:	10a50513          	addi	a0,a0,266 # ffffffffc0208a50 <commands+0x720>
ffffffffc020394e:	8bbfc0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0203952 <set_proc_name>:
ffffffffc0203952:	1101                	addi	sp,sp,-32
ffffffffc0203954:	e822                	sd	s0,16(sp)
ffffffffc0203956:	0b450413          	addi	s0,a0,180
ffffffffc020395a:	e426                	sd	s1,8(sp)
ffffffffc020395c:	4641                	li	a2,16
ffffffffc020395e:	84ae                	mv	s1,a1
ffffffffc0203960:	8522                	mv	a0,s0
ffffffffc0203962:	4581                	li	a1,0
ffffffffc0203964:	ec06                	sd	ra,24(sp)
ffffffffc0203966:	2fc040ef          	jal	ra,ffffffffc0207c62 <memset>
ffffffffc020396a:	8522                	mv	a0,s0
ffffffffc020396c:	6442                	ld	s0,16(sp)
ffffffffc020396e:	60e2                	ld	ra,24(sp)
ffffffffc0203970:	85a6                	mv	a1,s1
ffffffffc0203972:	64a2                	ld	s1,8(sp)
ffffffffc0203974:	463d                	li	a2,15
ffffffffc0203976:	6105                	addi	sp,sp,32
ffffffffc0203978:	2fc0406f          	j	ffffffffc0207c74 <memcpy>

ffffffffc020397c <proc_run>:
ffffffffc020397c:	7179                	addi	sp,sp,-48
ffffffffc020397e:	ec4a                	sd	s2,24(sp)
ffffffffc0203980:	0003c917          	auipc	s2,0x3c
ffffffffc0203984:	56890913          	addi	s2,s2,1384 # ffffffffc023fee8 <current>
ffffffffc0203988:	f026                	sd	s1,32(sp)
ffffffffc020398a:	00093483          	ld	s1,0(s2)
ffffffffc020398e:	f406                	sd	ra,40(sp)
ffffffffc0203990:	e84e                	sd	s3,16(sp)
ffffffffc0203992:	02a48863          	beq	s1,a0,ffffffffc02039c2 <proc_run+0x46>
ffffffffc0203996:	100027f3          	csrr	a5,sstatus
ffffffffc020399a:	8b89                	andi	a5,a5,2
ffffffffc020399c:	4981                	li	s3,0
ffffffffc020399e:	ef9d                	bnez	a5,ffffffffc02039dc <proc_run+0x60>
ffffffffc02039a0:	755c                	ld	a5,168(a0)
ffffffffc02039a2:	577d                	li	a4,-1
ffffffffc02039a4:	177e                	slli	a4,a4,0x3f
ffffffffc02039a6:	83b1                	srli	a5,a5,0xc
ffffffffc02039a8:	00a93023          	sd	a0,0(s2)
ffffffffc02039ac:	8fd9                	or	a5,a5,a4
ffffffffc02039ae:	18079073          	csrw	satp,a5
ffffffffc02039b2:	03050593          	addi	a1,a0,48
ffffffffc02039b6:	03048513          	addi	a0,s1,48
ffffffffc02039ba:	e2dff0ef          	jal	ra,ffffffffc02037e6 <switch_to>
ffffffffc02039be:	00099863          	bnez	s3,ffffffffc02039ce <proc_run+0x52>
ffffffffc02039c2:	70a2                	ld	ra,40(sp)
ffffffffc02039c4:	7482                	ld	s1,32(sp)
ffffffffc02039c6:	6962                	ld	s2,24(sp)
ffffffffc02039c8:	69c2                	ld	s3,16(sp)
ffffffffc02039ca:	6145                	addi	sp,sp,48
ffffffffc02039cc:	8082                	ret
ffffffffc02039ce:	70a2                	ld	ra,40(sp)
ffffffffc02039d0:	7482                	ld	s1,32(sp)
ffffffffc02039d2:	6962                	ld	s2,24(sp)
ffffffffc02039d4:	69c2                	ld	s3,16(sp)
ffffffffc02039d6:	6145                	addi	sp,sp,48
ffffffffc02039d8:	c5bfc06f          	j	ffffffffc0200632 <intr_enable>
ffffffffc02039dc:	e42a                	sd	a0,8(sp)
ffffffffc02039de:	c5bfc0ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc02039e2:	6522                	ld	a0,8(sp)
ffffffffc02039e4:	4985                	li	s3,1
ffffffffc02039e6:	bf6d                	j	ffffffffc02039a0 <proc_run+0x24>

ffffffffc02039e8 <find_proc>:
ffffffffc02039e8:	6789                	lui	a5,0x2
ffffffffc02039ea:	fff5071b          	addiw	a4,a0,-1
ffffffffc02039ee:	17f9                	addi	a5,a5,-2
ffffffffc02039f0:	04e7e063          	bltu	a5,a4,ffffffffc0203a30 <find_proc+0x48>
ffffffffc02039f4:	1141                	addi	sp,sp,-16
ffffffffc02039f6:	e022                	sd	s0,0(sp)
ffffffffc02039f8:	45a9                	li	a1,10
ffffffffc02039fa:	842a                	mv	s0,a0
ffffffffc02039fc:	2501                	sext.w	a0,a0
ffffffffc02039fe:	e406                	sd	ra,8(sp)
ffffffffc0203a00:	67a040ef          	jal	ra,ffffffffc020807a <hash32>
ffffffffc0203a04:	02051693          	slli	a3,a0,0x20
ffffffffc0203a08:	00038797          	auipc	a5,0x38
ffffffffc0203a0c:	47878793          	addi	a5,a5,1144 # ffffffffc023be80 <hash_list>
ffffffffc0203a10:	82f1                	srli	a3,a3,0x1c
ffffffffc0203a12:	96be                	add	a3,a3,a5
ffffffffc0203a14:	87b6                	mv	a5,a3
ffffffffc0203a16:	a029                	j	ffffffffc0203a20 <find_proc+0x38>
ffffffffc0203a18:	f2c7a703          	lw	a4,-212(a5)
ffffffffc0203a1c:	00870c63          	beq	a4,s0,ffffffffc0203a34 <find_proc+0x4c>
ffffffffc0203a20:	679c                	ld	a5,8(a5)
ffffffffc0203a22:	fef69be3          	bne	a3,a5,ffffffffc0203a18 <find_proc+0x30>
ffffffffc0203a26:	60a2                	ld	ra,8(sp)
ffffffffc0203a28:	6402                	ld	s0,0(sp)
ffffffffc0203a2a:	4501                	li	a0,0
ffffffffc0203a2c:	0141                	addi	sp,sp,16
ffffffffc0203a2e:	8082                	ret
ffffffffc0203a30:	4501                	li	a0,0
ffffffffc0203a32:	8082                	ret
ffffffffc0203a34:	60a2                	ld	ra,8(sp)
ffffffffc0203a36:	6402                	ld	s0,0(sp)
ffffffffc0203a38:	f2878513          	addi	a0,a5,-216
ffffffffc0203a3c:	0141                	addi	sp,sp,16
ffffffffc0203a3e:	8082                	ret

ffffffffc0203a40 <do_fork>:
ffffffffc0203a40:	7159                	addi	sp,sp,-112
ffffffffc0203a42:	e4ce                	sd	s3,72(sp)
ffffffffc0203a44:	0003c997          	auipc	s3,0x3c
ffffffffc0203a48:	4bc98993          	addi	s3,s3,1212 # ffffffffc023ff00 <nr_process>
ffffffffc0203a4c:	0009a703          	lw	a4,0(s3)
ffffffffc0203a50:	f486                	sd	ra,104(sp)
ffffffffc0203a52:	f0a2                	sd	s0,96(sp)
ffffffffc0203a54:	eca6                	sd	s1,88(sp)
ffffffffc0203a56:	e8ca                	sd	s2,80(sp)
ffffffffc0203a58:	e0d2                	sd	s4,64(sp)
ffffffffc0203a5a:	fc56                	sd	s5,56(sp)
ffffffffc0203a5c:	f85a                	sd	s6,48(sp)
ffffffffc0203a5e:	f45e                	sd	s7,40(sp)
ffffffffc0203a60:	f062                	sd	s8,32(sp)
ffffffffc0203a62:	ec66                	sd	s9,24(sp)
ffffffffc0203a64:	e86a                	sd	s10,16(sp)
ffffffffc0203a66:	e46e                	sd	s11,8(sp)
ffffffffc0203a68:	6785                	lui	a5,0x1
ffffffffc0203a6a:	30f75f63          	bge	a4,a5,ffffffffc0203d88 <do_fork+0x348>
ffffffffc0203a6e:	8a2a                	mv	s4,a0
ffffffffc0203a70:	892e                	mv	s2,a1
ffffffffc0203a72:	84b2                	mv	s1,a2
ffffffffc0203a74:	dddff0ef          	jal	ra,ffffffffc0203850 <alloc_proc>
ffffffffc0203a78:	842a                	mv	s0,a0
ffffffffc0203a7a:	28050263          	beqz	a0,ffffffffc0203cfe <do_fork+0x2be>
ffffffffc0203a7e:	0003cb97          	auipc	s7,0x3c
ffffffffc0203a82:	46ab8b93          	addi	s7,s7,1130 # ffffffffc023fee8 <current>
ffffffffc0203a86:	000bb783          	ld	a5,0(s7)
ffffffffc0203a8a:	0ec7a703          	lw	a4,236(a5) # 10ec <_binary_obj___user_faultread_out_size-0xc64>
ffffffffc0203a8e:	f11c                	sd	a5,32(a0)
ffffffffc0203a90:	30071c63          	bnez	a4,ffffffffc0203da8 <do_fork+0x368>
ffffffffc0203a94:	4509                	li	a0,2
ffffffffc0203a96:	ab4fd0ef          	jal	ra,ffffffffc0200d4a <alloc_pages>
ffffffffc0203a9a:	24050f63          	beqz	a0,ffffffffc0203cf8 <do_fork+0x2b8>
ffffffffc0203a9e:	0003cc17          	auipc	s8,0x3c
ffffffffc0203aa2:	49ac0c13          	addi	s8,s8,1178 # ffffffffc023ff38 <pages>
ffffffffc0203aa6:	000c3683          	ld	a3,0(s8)
ffffffffc0203aaa:	00007a97          	auipc	s5,0x7
ffffffffc0203aae:	df6aba83          	ld	s5,-522(s5) # ffffffffc020a8a0 <nbase>
ffffffffc0203ab2:	0003cc97          	auipc	s9,0x3c
ffffffffc0203ab6:	40ec8c93          	addi	s9,s9,1038 # ffffffffc023fec0 <npage>
ffffffffc0203aba:	40d506b3          	sub	a3,a0,a3
ffffffffc0203abe:	8699                	srai	a3,a3,0x6
ffffffffc0203ac0:	96d6                	add	a3,a3,s5
ffffffffc0203ac2:	000cb703          	ld	a4,0(s9)
ffffffffc0203ac6:	00c69793          	slli	a5,a3,0xc
ffffffffc0203aca:	83b1                	srli	a5,a5,0xc
ffffffffc0203acc:	06b2                	slli	a3,a3,0xc
ffffffffc0203ace:	2ce7f163          	bgeu	a5,a4,ffffffffc0203d90 <do_fork+0x350>
ffffffffc0203ad2:	000bb703          	ld	a4,0(s7)
ffffffffc0203ad6:	0003cd17          	auipc	s10,0x3c
ffffffffc0203ada:	452d0d13          	addi	s10,s10,1106 # ffffffffc023ff28 <va_pa_offset>
ffffffffc0203ade:	000d3783          	ld	a5,0(s10)
ffffffffc0203ae2:	02873b03          	ld	s6,40(a4)
ffffffffc0203ae6:	96be                	add	a3,a3,a5
ffffffffc0203ae8:	e814                	sd	a3,16(s0)
ffffffffc0203aea:	020b0863          	beqz	s6,ffffffffc0203b1a <do_fork+0xda>
ffffffffc0203aee:	100a7a13          	andi	s4,s4,256
ffffffffc0203af2:	1c0a0163          	beqz	s4,ffffffffc0203cb4 <do_fork+0x274>
ffffffffc0203af6:	030b2703          	lw	a4,48(s6)
ffffffffc0203afa:	018b3783          	ld	a5,24(s6)
ffffffffc0203afe:	c02006b7          	lui	a3,0xc0200
ffffffffc0203b02:	2705                	addiw	a4,a4,1
ffffffffc0203b04:	02eb2823          	sw	a4,48(s6)
ffffffffc0203b08:	03643423          	sd	s6,40(s0)
ffffffffc0203b0c:	2ad7ee63          	bltu	a5,a3,ffffffffc0203dc8 <do_fork+0x388>
ffffffffc0203b10:	000d3703          	ld	a4,0(s10)
ffffffffc0203b14:	6814                	ld	a3,16(s0)
ffffffffc0203b16:	8f99                	sub	a5,a5,a4
ffffffffc0203b18:	f45c                	sd	a5,168(s0)
ffffffffc0203b1a:	6789                	lui	a5,0x2
ffffffffc0203b1c:	ee078793          	addi	a5,a5,-288 # 1ee0 <_binary_obj___user_faultreadkernel_out_size+0x38>
ffffffffc0203b20:	97b6                	add	a5,a5,a3
ffffffffc0203b22:	8626                	mv	a2,s1
ffffffffc0203b24:	f05c                	sd	a5,160(s0)
ffffffffc0203b26:	873e                	mv	a4,a5
ffffffffc0203b28:	12048313          	addi	t1,s1,288
ffffffffc0203b2c:	00063883          	ld	a7,0(a2)
ffffffffc0203b30:	00863803          	ld	a6,8(a2)
ffffffffc0203b34:	6a08                	ld	a0,16(a2)
ffffffffc0203b36:	6e0c                	ld	a1,24(a2)
ffffffffc0203b38:	01173023          	sd	a7,0(a4)
ffffffffc0203b3c:	01073423          	sd	a6,8(a4)
ffffffffc0203b40:	eb08                	sd	a0,16(a4)
ffffffffc0203b42:	ef0c                	sd	a1,24(a4)
ffffffffc0203b44:	02060613          	addi	a2,a2,32
ffffffffc0203b48:	02070713          	addi	a4,a4,32
ffffffffc0203b4c:	fe6610e3          	bne	a2,t1,ffffffffc0203b2c <do_fork+0xec>
ffffffffc0203b50:	0407b823          	sd	zero,80(a5)
ffffffffc0203b54:	12090a63          	beqz	s2,ffffffffc0203c88 <do_fork+0x248>
ffffffffc0203b58:	0127b823          	sd	s2,16(a5)
ffffffffc0203b5c:	00000717          	auipc	a4,0x0
ffffffffc0203b60:	d6670713          	addi	a4,a4,-666 # ffffffffc02038c2 <forkret>
ffffffffc0203b64:	f818                	sd	a4,48(s0)
ffffffffc0203b66:	fc1c                	sd	a5,56(s0)
ffffffffc0203b68:	100027f3          	csrr	a5,sstatus
ffffffffc0203b6c:	8b89                	andi	a5,a5,2
ffffffffc0203b6e:	4901                	li	s2,0
ffffffffc0203b70:	12079e63          	bnez	a5,ffffffffc0203cac <do_fork+0x26c>
ffffffffc0203b74:	00031597          	auipc	a1,0x31
ffffffffc0203b78:	f0058593          	addi	a1,a1,-256 # ffffffffc0234a74 <last_pid.1812>
ffffffffc0203b7c:	419c                	lw	a5,0(a1)
ffffffffc0203b7e:	6709                	lui	a4,0x2
ffffffffc0203b80:	0017851b          	addiw	a0,a5,1
ffffffffc0203b84:	c188                	sw	a0,0(a1)
ffffffffc0203b86:	08e55b63          	bge	a0,a4,ffffffffc0203c1c <do_fork+0x1dc>
ffffffffc0203b8a:	00031897          	auipc	a7,0x31
ffffffffc0203b8e:	eee88893          	addi	a7,a7,-274 # ffffffffc0234a78 <next_safe.1811>
ffffffffc0203b92:	0008a783          	lw	a5,0(a7)
ffffffffc0203b96:	0003c497          	auipc	s1,0x3c
ffffffffc0203b9a:	4fa48493          	addi	s1,s1,1274 # ffffffffc0240090 <proc_list>
ffffffffc0203b9e:	08f55663          	bge	a0,a5,ffffffffc0203c2a <do_fork+0x1ea>
ffffffffc0203ba2:	c048                	sw	a0,4(s0)
ffffffffc0203ba4:	45a9                	li	a1,10
ffffffffc0203ba6:	2501                	sext.w	a0,a0
ffffffffc0203ba8:	4d2040ef          	jal	ra,ffffffffc020807a <hash32>
ffffffffc0203bac:	1502                	slli	a0,a0,0x20
ffffffffc0203bae:	00038797          	auipc	a5,0x38
ffffffffc0203bb2:	2d278793          	addi	a5,a5,722 # ffffffffc023be80 <hash_list>
ffffffffc0203bb6:	8171                	srli	a0,a0,0x1c
ffffffffc0203bb8:	953e                	add	a0,a0,a5
ffffffffc0203bba:	650c                	ld	a1,8(a0)
ffffffffc0203bbc:	7014                	ld	a3,32(s0)
ffffffffc0203bbe:	0d840793          	addi	a5,s0,216
ffffffffc0203bc2:	e19c                	sd	a5,0(a1)
ffffffffc0203bc4:	6490                	ld	a2,8(s1)
ffffffffc0203bc6:	e51c                	sd	a5,8(a0)
ffffffffc0203bc8:	7af8                	ld	a4,240(a3)
ffffffffc0203bca:	0c840793          	addi	a5,s0,200
ffffffffc0203bce:	f06c                	sd	a1,224(s0)
ffffffffc0203bd0:	ec68                	sd	a0,216(s0)
ffffffffc0203bd2:	e21c                	sd	a5,0(a2)
ffffffffc0203bd4:	e49c                	sd	a5,8(s1)
ffffffffc0203bd6:	e870                	sd	a2,208(s0)
ffffffffc0203bd8:	e464                	sd	s1,200(s0)
ffffffffc0203bda:	0e043c23          	sd	zero,248(s0)
ffffffffc0203bde:	10e43023          	sd	a4,256(s0)
ffffffffc0203be2:	c311                	beqz	a4,ffffffffc0203be6 <do_fork+0x1a6>
ffffffffc0203be4:	ff60                	sd	s0,248(a4)
ffffffffc0203be6:	0009a783          	lw	a5,0(s3)
ffffffffc0203bea:	fae0                	sd	s0,240(a3)
ffffffffc0203bec:	2785                	addiw	a5,a5,1
ffffffffc0203bee:	00f9a023          	sw	a5,0(s3)
ffffffffc0203bf2:	10091863          	bnez	s2,ffffffffc0203d02 <do_fork+0x2c2>
ffffffffc0203bf6:	8522                	mv	a0,s0
ffffffffc0203bf8:	733000ef          	jal	ra,ffffffffc0204b2a <wakeup_proc>
ffffffffc0203bfc:	4048                	lw	a0,4(s0)
ffffffffc0203bfe:	70a6                	ld	ra,104(sp)
ffffffffc0203c00:	7406                	ld	s0,96(sp)
ffffffffc0203c02:	64e6                	ld	s1,88(sp)
ffffffffc0203c04:	6946                	ld	s2,80(sp)
ffffffffc0203c06:	69a6                	ld	s3,72(sp)
ffffffffc0203c08:	6a06                	ld	s4,64(sp)
ffffffffc0203c0a:	7ae2                	ld	s5,56(sp)
ffffffffc0203c0c:	7b42                	ld	s6,48(sp)
ffffffffc0203c0e:	7ba2                	ld	s7,40(sp)
ffffffffc0203c10:	7c02                	ld	s8,32(sp)
ffffffffc0203c12:	6ce2                	ld	s9,24(sp)
ffffffffc0203c14:	6d42                	ld	s10,16(sp)
ffffffffc0203c16:	6da2                	ld	s11,8(sp)
ffffffffc0203c18:	6165                	addi	sp,sp,112
ffffffffc0203c1a:	8082                	ret
ffffffffc0203c1c:	4785                	li	a5,1
ffffffffc0203c1e:	c19c                	sw	a5,0(a1)
ffffffffc0203c20:	4505                	li	a0,1
ffffffffc0203c22:	00031897          	auipc	a7,0x31
ffffffffc0203c26:	e5688893          	addi	a7,a7,-426 # ffffffffc0234a78 <next_safe.1811>
ffffffffc0203c2a:	0003c497          	auipc	s1,0x3c
ffffffffc0203c2e:	46648493          	addi	s1,s1,1126 # ffffffffc0240090 <proc_list>
ffffffffc0203c32:	0084b303          	ld	t1,8(s1)
ffffffffc0203c36:	6789                	lui	a5,0x2
ffffffffc0203c38:	00f8a023          	sw	a5,0(a7)
ffffffffc0203c3c:	4801                	li	a6,0
ffffffffc0203c3e:	87aa                	mv	a5,a0
ffffffffc0203c40:	6e89                	lui	t4,0x2
ffffffffc0203c42:	12930e63          	beq	t1,s1,ffffffffc0203d7e <do_fork+0x33e>
ffffffffc0203c46:	8e42                	mv	t3,a6
ffffffffc0203c48:	869a                	mv	a3,t1
ffffffffc0203c4a:	6609                	lui	a2,0x2
ffffffffc0203c4c:	a811                	j	ffffffffc0203c60 <do_fork+0x220>
ffffffffc0203c4e:	00e7d663          	bge	a5,a4,ffffffffc0203c5a <do_fork+0x21a>
ffffffffc0203c52:	00c75463          	bge	a4,a2,ffffffffc0203c5a <do_fork+0x21a>
ffffffffc0203c56:	863a                	mv	a2,a4
ffffffffc0203c58:	4e05                	li	t3,1
ffffffffc0203c5a:	6694                	ld	a3,8(a3)
ffffffffc0203c5c:	00968d63          	beq	a3,s1,ffffffffc0203c76 <do_fork+0x236>
ffffffffc0203c60:	f3c6a703          	lw	a4,-196(a3) # ffffffffc01fff3c <_binary_obj___user_matrix_out_size+0xffffffffc01fd59c>
ffffffffc0203c64:	fef715e3          	bne	a4,a5,ffffffffc0203c4e <do_fork+0x20e>
ffffffffc0203c68:	2785                	addiw	a5,a5,1
ffffffffc0203c6a:	08c7df63          	bge	a5,a2,ffffffffc0203d08 <do_fork+0x2c8>
ffffffffc0203c6e:	6694                	ld	a3,8(a3)
ffffffffc0203c70:	4805                	li	a6,1
ffffffffc0203c72:	fe9697e3          	bne	a3,s1,ffffffffc0203c60 <do_fork+0x220>
ffffffffc0203c76:	00080463          	beqz	a6,ffffffffc0203c7e <do_fork+0x23e>
ffffffffc0203c7a:	c19c                	sw	a5,0(a1)
ffffffffc0203c7c:	853e                	mv	a0,a5
ffffffffc0203c7e:	f20e02e3          	beqz	t3,ffffffffc0203ba2 <do_fork+0x162>
ffffffffc0203c82:	00c8a023          	sw	a2,0(a7)
ffffffffc0203c86:	bf31                	j	ffffffffc0203ba2 <do_fork+0x162>
ffffffffc0203c88:	6909                	lui	s2,0x2
ffffffffc0203c8a:	edc90913          	addi	s2,s2,-292 # 1edc <_binary_obj___user_faultreadkernel_out_size+0x34>
ffffffffc0203c8e:	9936                	add	s2,s2,a3
ffffffffc0203c90:	0127b823          	sd	s2,16(a5) # 2010 <_binary_obj___user_forktree_out_size+0x10>
ffffffffc0203c94:	00000717          	auipc	a4,0x0
ffffffffc0203c98:	c2e70713          	addi	a4,a4,-978 # ffffffffc02038c2 <forkret>
ffffffffc0203c9c:	f818                	sd	a4,48(s0)
ffffffffc0203c9e:	fc1c                	sd	a5,56(s0)
ffffffffc0203ca0:	100027f3          	csrr	a5,sstatus
ffffffffc0203ca4:	8b89                	andi	a5,a5,2
ffffffffc0203ca6:	4901                	li	s2,0
ffffffffc0203ca8:	ec0786e3          	beqz	a5,ffffffffc0203b74 <do_fork+0x134>
ffffffffc0203cac:	98dfc0ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc0203cb0:	4905                	li	s2,1
ffffffffc0203cb2:	b5c9                	j	ffffffffc0203b74 <do_fork+0x134>
ffffffffc0203cb4:	a85fd0ef          	jal	ra,ffffffffc0201738 <mm_create>
ffffffffc0203cb8:	8a2a                	mv	s4,a0
ffffffffc0203cba:	c901                	beqz	a0,ffffffffc0203cca <do_fork+0x28a>
ffffffffc0203cbc:	0561                	addi	a0,a0,24
ffffffffc0203cbe:	c13ff0ef          	jal	ra,ffffffffc02038d0 <setup_pgdir.isra.0>
ffffffffc0203cc2:	c921                	beqz	a0,ffffffffc0203d12 <do_fork+0x2d2>
ffffffffc0203cc4:	8552                	mv	a0,s4
ffffffffc0203cc6:	bd1fd0ef          	jal	ra,ffffffffc0201896 <mm_destroy>
ffffffffc0203cca:	6814                	ld	a3,16(s0)
ffffffffc0203ccc:	c02007b7          	lui	a5,0xc0200
ffffffffc0203cd0:	12f6e563          	bltu	a3,a5,ffffffffc0203dfa <do_fork+0x3ba>
ffffffffc0203cd4:	000d3783          	ld	a5,0(s10)
ffffffffc0203cd8:	000cb703          	ld	a4,0(s9)
ffffffffc0203cdc:	40f687b3          	sub	a5,a3,a5
ffffffffc0203ce0:	83b1                	srli	a5,a5,0xc
ffffffffc0203ce2:	10e7f063          	bgeu	a5,a4,ffffffffc0203de2 <do_fork+0x3a2>
ffffffffc0203ce6:	000c3503          	ld	a0,0(s8)
ffffffffc0203cea:	415787b3          	sub	a5,a5,s5
ffffffffc0203cee:	079a                	slli	a5,a5,0x6
ffffffffc0203cf0:	4589                	li	a1,2
ffffffffc0203cf2:	953e                	add	a0,a0,a5
ffffffffc0203cf4:	8e8fd0ef          	jal	ra,ffffffffc0200ddc <free_pages>
ffffffffc0203cf8:	8522                	mv	a0,s0
ffffffffc0203cfa:	c26fe0ef          	jal	ra,ffffffffc0202120 <kfree>
ffffffffc0203cfe:	5571                	li	a0,-4
ffffffffc0203d00:	bdfd                	j	ffffffffc0203bfe <do_fork+0x1be>
ffffffffc0203d02:	931fc0ef          	jal	ra,ffffffffc0200632 <intr_enable>
ffffffffc0203d06:	bdc5                	j	ffffffffc0203bf6 <do_fork+0x1b6>
ffffffffc0203d08:	01d7c363          	blt	a5,t4,ffffffffc0203d0e <do_fork+0x2ce>
ffffffffc0203d0c:	4785                	li	a5,1
ffffffffc0203d0e:	4805                	li	a6,1
ffffffffc0203d10:	bf0d                	j	ffffffffc0203c42 <do_fork+0x202>
ffffffffc0203d12:	038b0d93          	addi	s11,s6,56
ffffffffc0203d16:	856e                	mv	a0,s11
ffffffffc0203d18:	90fff0ef          	jal	ra,ffffffffc0203626 <down>
ffffffffc0203d1c:	000bb783          	ld	a5,0(s7)
ffffffffc0203d20:	c781                	beqz	a5,ffffffffc0203d28 <do_fork+0x2e8>
ffffffffc0203d22:	43dc                	lw	a5,4(a5)
ffffffffc0203d24:	04fb2823          	sw	a5,80(s6)
ffffffffc0203d28:	85da                	mv	a1,s6
ffffffffc0203d2a:	8552                	mv	a0,s4
ffffffffc0203d2c:	c6dfd0ef          	jal	ra,ffffffffc0201998 <dup_mmap>
ffffffffc0203d30:	8baa                	mv	s7,a0
ffffffffc0203d32:	856e                	mv	a0,s11
ffffffffc0203d34:	8f1ff0ef          	jal	ra,ffffffffc0203624 <up>
ffffffffc0203d38:	040b2823          	sw	zero,80(s6)
ffffffffc0203d3c:	8b52                	mv	s6,s4
ffffffffc0203d3e:	da0b8ce3          	beqz	s7,ffffffffc0203af6 <do_fork+0xb6>
ffffffffc0203d42:	8552                	mv	a0,s4
ffffffffc0203d44:	ceffd0ef          	jal	ra,ffffffffc0201a32 <exit_mmap>
ffffffffc0203d48:	018a3683          	ld	a3,24(s4)
ffffffffc0203d4c:	c02007b7          	lui	a5,0xc0200
ffffffffc0203d50:	0af6e563          	bltu	a3,a5,ffffffffc0203dfa <do_fork+0x3ba>
ffffffffc0203d54:	000d3703          	ld	a4,0(s10)
ffffffffc0203d58:	000cb783          	ld	a5,0(s9)
ffffffffc0203d5c:	8e99                	sub	a3,a3,a4
ffffffffc0203d5e:	82b1                	srli	a3,a3,0xc
ffffffffc0203d60:	08f6f163          	bgeu	a3,a5,ffffffffc0203de2 <do_fork+0x3a2>
ffffffffc0203d64:	000c3503          	ld	a0,0(s8)
ffffffffc0203d68:	415686b3          	sub	a3,a3,s5
ffffffffc0203d6c:	069a                	slli	a3,a3,0x6
ffffffffc0203d6e:	9536                	add	a0,a0,a3
ffffffffc0203d70:	4585                	li	a1,1
ffffffffc0203d72:	86afd0ef          	jal	ra,ffffffffc0200ddc <free_pages>
ffffffffc0203d76:	8552                	mv	a0,s4
ffffffffc0203d78:	b1ffd0ef          	jal	ra,ffffffffc0201896 <mm_destroy>
ffffffffc0203d7c:	b7b9                	j	ffffffffc0203cca <do_fork+0x28a>
ffffffffc0203d7e:	00080763          	beqz	a6,ffffffffc0203d8c <do_fork+0x34c>
ffffffffc0203d82:	c19c                	sw	a5,0(a1)
ffffffffc0203d84:	853e                	mv	a0,a5
ffffffffc0203d86:	bd31                	j	ffffffffc0203ba2 <do_fork+0x162>
ffffffffc0203d88:	556d                	li	a0,-5
ffffffffc0203d8a:	bd95                	j	ffffffffc0203bfe <do_fork+0x1be>
ffffffffc0203d8c:	4188                	lw	a0,0(a1)
ffffffffc0203d8e:	bd11                	j	ffffffffc0203ba2 <do_fork+0x162>
ffffffffc0203d90:	00005617          	auipc	a2,0x5
ffffffffc0203d94:	d6060613          	addi	a2,a2,-672 # ffffffffc0208af0 <commands+0x7c0>
ffffffffc0203d98:	06900593          	li	a1,105
ffffffffc0203d9c:	00005517          	auipc	a0,0x5
ffffffffc0203da0:	cb450513          	addi	a0,a0,-844 # ffffffffc0208a50 <commands+0x720>
ffffffffc0203da4:	c64fc0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0203da8:	00006697          	auipc	a3,0x6
ffffffffc0203dac:	a3868693          	addi	a3,a3,-1480 # ffffffffc02097e0 <default_pmm_manager+0x360>
ffffffffc0203db0:	00005617          	auipc	a2,0x5
ffffffffc0203db4:	99060613          	addi	a2,a2,-1648 # ffffffffc0208740 <commands+0x410>
ffffffffc0203db8:	1a600593          	li	a1,422
ffffffffc0203dbc:	00006517          	auipc	a0,0x6
ffffffffc0203dc0:	a4450513          	addi	a0,a0,-1468 # ffffffffc0209800 <default_pmm_manager+0x380>
ffffffffc0203dc4:	c44fc0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0203dc8:	86be                	mv	a3,a5
ffffffffc0203dca:	00005617          	auipc	a2,0x5
ffffffffc0203dce:	cee60613          	addi	a2,a2,-786 # ffffffffc0208ab8 <commands+0x788>
ffffffffc0203dd2:	15900593          	li	a1,345
ffffffffc0203dd6:	00006517          	auipc	a0,0x6
ffffffffc0203dda:	a2a50513          	addi	a0,a0,-1494 # ffffffffc0209800 <default_pmm_manager+0x380>
ffffffffc0203dde:	c2afc0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0203de2:	00005617          	auipc	a2,0x5
ffffffffc0203de6:	c4e60613          	addi	a2,a2,-946 # ffffffffc0208a30 <commands+0x700>
ffffffffc0203dea:	06200593          	li	a1,98
ffffffffc0203dee:	00005517          	auipc	a0,0x5
ffffffffc0203df2:	c6250513          	addi	a0,a0,-926 # ffffffffc0208a50 <commands+0x720>
ffffffffc0203df6:	c12fc0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0203dfa:	00005617          	auipc	a2,0x5
ffffffffc0203dfe:	cbe60613          	addi	a2,a2,-834 # ffffffffc0208ab8 <commands+0x788>
ffffffffc0203e02:	06e00593          	li	a1,110
ffffffffc0203e06:	00005517          	auipc	a0,0x5
ffffffffc0203e0a:	c4a50513          	addi	a0,a0,-950 # ffffffffc0208a50 <commands+0x720>
ffffffffc0203e0e:	bfafc0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0203e12 <kernel_thread>:
ffffffffc0203e12:	7129                	addi	sp,sp,-320
ffffffffc0203e14:	fa22                	sd	s0,304(sp)
ffffffffc0203e16:	f626                	sd	s1,296(sp)
ffffffffc0203e18:	f24a                	sd	s2,288(sp)
ffffffffc0203e1a:	84ae                	mv	s1,a1
ffffffffc0203e1c:	892a                	mv	s2,a0
ffffffffc0203e1e:	8432                	mv	s0,a2
ffffffffc0203e20:	4581                	li	a1,0
ffffffffc0203e22:	12000613          	li	a2,288
ffffffffc0203e26:	850a                	mv	a0,sp
ffffffffc0203e28:	fe06                	sd	ra,312(sp)
ffffffffc0203e2a:	639030ef          	jal	ra,ffffffffc0207c62 <memset>
ffffffffc0203e2e:	e0ca                	sd	s2,64(sp)
ffffffffc0203e30:	e4a6                	sd	s1,72(sp)
ffffffffc0203e32:	100027f3          	csrr	a5,sstatus
ffffffffc0203e36:	edd7f793          	andi	a5,a5,-291
ffffffffc0203e3a:	1207e793          	ori	a5,a5,288
ffffffffc0203e3e:	e23e                	sd	a5,256(sp)
ffffffffc0203e40:	860a                	mv	a2,sp
ffffffffc0203e42:	10046513          	ori	a0,s0,256
ffffffffc0203e46:	00000797          	auipc	a5,0x0
ffffffffc0203e4a:	99878793          	addi	a5,a5,-1640 # ffffffffc02037de <kernel_thread_entry>
ffffffffc0203e4e:	4581                	li	a1,0
ffffffffc0203e50:	e63e                	sd	a5,264(sp)
ffffffffc0203e52:	befff0ef          	jal	ra,ffffffffc0203a40 <do_fork>
ffffffffc0203e56:	70f2                	ld	ra,312(sp)
ffffffffc0203e58:	7452                	ld	s0,304(sp)
ffffffffc0203e5a:	74b2                	ld	s1,296(sp)
ffffffffc0203e5c:	7912                	ld	s2,288(sp)
ffffffffc0203e5e:	6131                	addi	sp,sp,320
ffffffffc0203e60:	8082                	ret

ffffffffc0203e62 <do_exit>:
ffffffffc0203e62:	7179                	addi	sp,sp,-48
ffffffffc0203e64:	f022                	sd	s0,32(sp)
ffffffffc0203e66:	0003c417          	auipc	s0,0x3c
ffffffffc0203e6a:	08240413          	addi	s0,s0,130 # ffffffffc023fee8 <current>
ffffffffc0203e6e:	601c                	ld	a5,0(s0)
ffffffffc0203e70:	f406                	sd	ra,40(sp)
ffffffffc0203e72:	ec26                	sd	s1,24(sp)
ffffffffc0203e74:	e84a                	sd	s2,16(sp)
ffffffffc0203e76:	e44e                	sd	s3,8(sp)
ffffffffc0203e78:	e052                	sd	s4,0(sp)
ffffffffc0203e7a:	0003c717          	auipc	a4,0x3c
ffffffffc0203e7e:	07673703          	ld	a4,118(a4) # ffffffffc023fef0 <idleproc>
ffffffffc0203e82:	0ce78d63          	beq	a5,a4,ffffffffc0203f5c <do_exit+0xfa>
ffffffffc0203e86:	0003c497          	auipc	s1,0x3c
ffffffffc0203e8a:	07248493          	addi	s1,s1,114 # ffffffffc023fef8 <initproc>
ffffffffc0203e8e:	6098                	ld	a4,0(s1)
ffffffffc0203e90:	12e78963          	beq	a5,a4,ffffffffc0203fc2 <do_exit+0x160>
ffffffffc0203e94:	0287b903          	ld	s2,40(a5)
ffffffffc0203e98:	89aa                	mv	s3,a0
ffffffffc0203e9a:	02090663          	beqz	s2,ffffffffc0203ec6 <do_exit+0x64>
ffffffffc0203e9e:	0003c797          	auipc	a5,0x3c
ffffffffc0203ea2:	0927b783          	ld	a5,146(a5) # ffffffffc023ff30 <boot_cr3>
ffffffffc0203ea6:	577d                	li	a4,-1
ffffffffc0203ea8:	177e                	slli	a4,a4,0x3f
ffffffffc0203eaa:	83b1                	srli	a5,a5,0xc
ffffffffc0203eac:	8fd9                	or	a5,a5,a4
ffffffffc0203eae:	18079073          	csrw	satp,a5
ffffffffc0203eb2:	03092783          	lw	a5,48(s2)
ffffffffc0203eb6:	fff7871b          	addiw	a4,a5,-1
ffffffffc0203eba:	02e92823          	sw	a4,48(s2)
ffffffffc0203ebe:	cb5d                	beqz	a4,ffffffffc0203f74 <do_exit+0x112>
ffffffffc0203ec0:	601c                	ld	a5,0(s0)
ffffffffc0203ec2:	0207b423          	sd	zero,40(a5)
ffffffffc0203ec6:	601c                	ld	a5,0(s0)
ffffffffc0203ec8:	470d                	li	a4,3
ffffffffc0203eca:	c398                	sw	a4,0(a5)
ffffffffc0203ecc:	0f37a423          	sw	s3,232(a5)
ffffffffc0203ed0:	100027f3          	csrr	a5,sstatus
ffffffffc0203ed4:	8b89                	andi	a5,a5,2
ffffffffc0203ed6:	4a01                	li	s4,0
ffffffffc0203ed8:	10079163          	bnez	a5,ffffffffc0203fda <do_exit+0x178>
ffffffffc0203edc:	6018                	ld	a4,0(s0)
ffffffffc0203ede:	800007b7          	lui	a5,0x80000
ffffffffc0203ee2:	0785                	addi	a5,a5,1
ffffffffc0203ee4:	7308                	ld	a0,32(a4)
ffffffffc0203ee6:	0ec52703          	lw	a4,236(a0)
ffffffffc0203eea:	0ef70c63          	beq	a4,a5,ffffffffc0203fe2 <do_exit+0x180>
ffffffffc0203eee:	6018                	ld	a4,0(s0)
ffffffffc0203ef0:	7b7c                	ld	a5,240(a4)
ffffffffc0203ef2:	c3a1                	beqz	a5,ffffffffc0203f32 <do_exit+0xd0>
ffffffffc0203ef4:	800009b7          	lui	s3,0x80000
ffffffffc0203ef8:	490d                	li	s2,3
ffffffffc0203efa:	0985                	addi	s3,s3,1
ffffffffc0203efc:	a021                	j	ffffffffc0203f04 <do_exit+0xa2>
ffffffffc0203efe:	6018                	ld	a4,0(s0)
ffffffffc0203f00:	7b7c                	ld	a5,240(a4)
ffffffffc0203f02:	cb85                	beqz	a5,ffffffffc0203f32 <do_exit+0xd0>
ffffffffc0203f04:	1007b683          	ld	a3,256(a5) # ffffffff80000100 <_binary_obj___user_matrix_out_size+0xffffffff7fffd760>
ffffffffc0203f08:	6088                	ld	a0,0(s1)
ffffffffc0203f0a:	fb74                	sd	a3,240(a4)
ffffffffc0203f0c:	7978                	ld	a4,240(a0)
ffffffffc0203f0e:	0e07bc23          	sd	zero,248(a5)
ffffffffc0203f12:	10e7b023          	sd	a4,256(a5)
ffffffffc0203f16:	c311                	beqz	a4,ffffffffc0203f1a <do_exit+0xb8>
ffffffffc0203f18:	ff7c                	sd	a5,248(a4)
ffffffffc0203f1a:	4398                	lw	a4,0(a5)
ffffffffc0203f1c:	f388                	sd	a0,32(a5)
ffffffffc0203f1e:	f97c                	sd	a5,240(a0)
ffffffffc0203f20:	fd271fe3          	bne	a4,s2,ffffffffc0203efe <do_exit+0x9c>
ffffffffc0203f24:	0ec52783          	lw	a5,236(a0)
ffffffffc0203f28:	fd379be3          	bne	a5,s3,ffffffffc0203efe <do_exit+0x9c>
ffffffffc0203f2c:	3ff000ef          	jal	ra,ffffffffc0204b2a <wakeup_proc>
ffffffffc0203f30:	b7f9                	j	ffffffffc0203efe <do_exit+0x9c>
ffffffffc0203f32:	020a1263          	bnez	s4,ffffffffc0203f56 <do_exit+0xf4>
ffffffffc0203f36:	4a7000ef          	jal	ra,ffffffffc0204bdc <schedule>
ffffffffc0203f3a:	601c                	ld	a5,0(s0)
ffffffffc0203f3c:	00006617          	auipc	a2,0x6
ffffffffc0203f40:	8fc60613          	addi	a2,a2,-1796 # ffffffffc0209838 <default_pmm_manager+0x3b8>
ffffffffc0203f44:	1f900593          	li	a1,505
ffffffffc0203f48:	43d4                	lw	a3,4(a5)
ffffffffc0203f4a:	00006517          	auipc	a0,0x6
ffffffffc0203f4e:	8b650513          	addi	a0,a0,-1866 # ffffffffc0209800 <default_pmm_manager+0x380>
ffffffffc0203f52:	ab6fc0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0203f56:	edcfc0ef          	jal	ra,ffffffffc0200632 <intr_enable>
ffffffffc0203f5a:	bff1                	j	ffffffffc0203f36 <do_exit+0xd4>
ffffffffc0203f5c:	00006617          	auipc	a2,0x6
ffffffffc0203f60:	8bc60613          	addi	a2,a2,-1860 # ffffffffc0209818 <default_pmm_manager+0x398>
ffffffffc0203f64:	1cd00593          	li	a1,461
ffffffffc0203f68:	00006517          	auipc	a0,0x6
ffffffffc0203f6c:	89850513          	addi	a0,a0,-1896 # ffffffffc0209800 <default_pmm_manager+0x380>
ffffffffc0203f70:	a98fc0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0203f74:	854a                	mv	a0,s2
ffffffffc0203f76:	abdfd0ef          	jal	ra,ffffffffc0201a32 <exit_mmap>
ffffffffc0203f7a:	01893683          	ld	a3,24(s2)
ffffffffc0203f7e:	c02007b7          	lui	a5,0xc0200
ffffffffc0203f82:	06f6e363          	bltu	a3,a5,ffffffffc0203fe8 <do_exit+0x186>
ffffffffc0203f86:	0003c797          	auipc	a5,0x3c
ffffffffc0203f8a:	fa27b783          	ld	a5,-94(a5) # ffffffffc023ff28 <va_pa_offset>
ffffffffc0203f8e:	8e9d                	sub	a3,a3,a5
ffffffffc0203f90:	82b1                	srli	a3,a3,0xc
ffffffffc0203f92:	0003c797          	auipc	a5,0x3c
ffffffffc0203f96:	f2e7b783          	ld	a5,-210(a5) # ffffffffc023fec0 <npage>
ffffffffc0203f9a:	06f6f363          	bgeu	a3,a5,ffffffffc0204000 <do_exit+0x19e>
ffffffffc0203f9e:	00007517          	auipc	a0,0x7
ffffffffc0203fa2:	90253503          	ld	a0,-1790(a0) # ffffffffc020a8a0 <nbase>
ffffffffc0203fa6:	8e89                	sub	a3,a3,a0
ffffffffc0203fa8:	069a                	slli	a3,a3,0x6
ffffffffc0203faa:	0003c517          	auipc	a0,0x3c
ffffffffc0203fae:	f8e53503          	ld	a0,-114(a0) # ffffffffc023ff38 <pages>
ffffffffc0203fb2:	9536                	add	a0,a0,a3
ffffffffc0203fb4:	4585                	li	a1,1
ffffffffc0203fb6:	e27fc0ef          	jal	ra,ffffffffc0200ddc <free_pages>
ffffffffc0203fba:	854a                	mv	a0,s2
ffffffffc0203fbc:	8dbfd0ef          	jal	ra,ffffffffc0201896 <mm_destroy>
ffffffffc0203fc0:	b701                	j	ffffffffc0203ec0 <do_exit+0x5e>
ffffffffc0203fc2:	00006617          	auipc	a2,0x6
ffffffffc0203fc6:	86660613          	addi	a2,a2,-1946 # ffffffffc0209828 <default_pmm_manager+0x3a8>
ffffffffc0203fca:	1d000593          	li	a1,464
ffffffffc0203fce:	00006517          	auipc	a0,0x6
ffffffffc0203fd2:	83250513          	addi	a0,a0,-1998 # ffffffffc0209800 <default_pmm_manager+0x380>
ffffffffc0203fd6:	a32fc0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0203fda:	e5efc0ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc0203fde:	4a05                	li	s4,1
ffffffffc0203fe0:	bdf5                	j	ffffffffc0203edc <do_exit+0x7a>
ffffffffc0203fe2:	349000ef          	jal	ra,ffffffffc0204b2a <wakeup_proc>
ffffffffc0203fe6:	b721                	j	ffffffffc0203eee <do_exit+0x8c>
ffffffffc0203fe8:	00005617          	auipc	a2,0x5
ffffffffc0203fec:	ad060613          	addi	a2,a2,-1328 # ffffffffc0208ab8 <commands+0x788>
ffffffffc0203ff0:	06e00593          	li	a1,110
ffffffffc0203ff4:	00005517          	auipc	a0,0x5
ffffffffc0203ff8:	a5c50513          	addi	a0,a0,-1444 # ffffffffc0208a50 <commands+0x720>
ffffffffc0203ffc:	a0cfc0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0204000:	00005617          	auipc	a2,0x5
ffffffffc0204004:	a3060613          	addi	a2,a2,-1488 # ffffffffc0208a30 <commands+0x700>
ffffffffc0204008:	06200593          	li	a1,98
ffffffffc020400c:	00005517          	auipc	a0,0x5
ffffffffc0204010:	a4450513          	addi	a0,a0,-1468 # ffffffffc0208a50 <commands+0x720>
ffffffffc0204014:	9f4fc0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0204018 <do_wait.part.0>:
ffffffffc0204018:	7139                	addi	sp,sp,-64
ffffffffc020401a:	e852                	sd	s4,16(sp)
ffffffffc020401c:	80000a37          	lui	s4,0x80000
ffffffffc0204020:	f426                	sd	s1,40(sp)
ffffffffc0204022:	f04a                	sd	s2,32(sp)
ffffffffc0204024:	ec4e                	sd	s3,24(sp)
ffffffffc0204026:	e456                	sd	s5,8(sp)
ffffffffc0204028:	e05a                	sd	s6,0(sp)
ffffffffc020402a:	fc06                	sd	ra,56(sp)
ffffffffc020402c:	f822                	sd	s0,48(sp)
ffffffffc020402e:	892a                	mv	s2,a0
ffffffffc0204030:	8aae                	mv	s5,a1
ffffffffc0204032:	0003c997          	auipc	s3,0x3c
ffffffffc0204036:	eb698993          	addi	s3,s3,-330 # ffffffffc023fee8 <current>
ffffffffc020403a:	448d                	li	s1,3
ffffffffc020403c:	4b05                	li	s6,1
ffffffffc020403e:	2a05                	addiw	s4,s4,1
ffffffffc0204040:	02090f63          	beqz	s2,ffffffffc020407e <do_wait.part.0+0x66>
ffffffffc0204044:	854a                	mv	a0,s2
ffffffffc0204046:	9a3ff0ef          	jal	ra,ffffffffc02039e8 <find_proc>
ffffffffc020404a:	842a                	mv	s0,a0
ffffffffc020404c:	10050763          	beqz	a0,ffffffffc020415a <do_wait.part.0+0x142>
ffffffffc0204050:	0009b703          	ld	a4,0(s3)
ffffffffc0204054:	711c                	ld	a5,32(a0)
ffffffffc0204056:	10e79263          	bne	a5,a4,ffffffffc020415a <do_wait.part.0+0x142>
ffffffffc020405a:	411c                	lw	a5,0(a0)
ffffffffc020405c:	02978c63          	beq	a5,s1,ffffffffc0204094 <do_wait.part.0+0x7c>
ffffffffc0204060:	01672023          	sw	s6,0(a4)
ffffffffc0204064:	0f472623          	sw	s4,236(a4)
ffffffffc0204068:	375000ef          	jal	ra,ffffffffc0204bdc <schedule>
ffffffffc020406c:	0009b783          	ld	a5,0(s3)
ffffffffc0204070:	0b07a783          	lw	a5,176(a5)
ffffffffc0204074:	8b85                	andi	a5,a5,1
ffffffffc0204076:	d7e9                	beqz	a5,ffffffffc0204040 <do_wait.part.0+0x28>
ffffffffc0204078:	555d                	li	a0,-9
ffffffffc020407a:	de9ff0ef          	jal	ra,ffffffffc0203e62 <do_exit>
ffffffffc020407e:	0009b703          	ld	a4,0(s3)
ffffffffc0204082:	7b60                	ld	s0,240(a4)
ffffffffc0204084:	e409                	bnez	s0,ffffffffc020408e <do_wait.part.0+0x76>
ffffffffc0204086:	a8d1                	j	ffffffffc020415a <do_wait.part.0+0x142>
ffffffffc0204088:	10043403          	ld	s0,256(s0)
ffffffffc020408c:	d871                	beqz	s0,ffffffffc0204060 <do_wait.part.0+0x48>
ffffffffc020408e:	401c                	lw	a5,0(s0)
ffffffffc0204090:	fe979ce3          	bne	a5,s1,ffffffffc0204088 <do_wait.part.0+0x70>
ffffffffc0204094:	0003c797          	auipc	a5,0x3c
ffffffffc0204098:	e5c7b783          	ld	a5,-420(a5) # ffffffffc023fef0 <idleproc>
ffffffffc020409c:	0c878563          	beq	a5,s0,ffffffffc0204166 <do_wait.part.0+0x14e>
ffffffffc02040a0:	0003c797          	auipc	a5,0x3c
ffffffffc02040a4:	e587b783          	ld	a5,-424(a5) # ffffffffc023fef8 <initproc>
ffffffffc02040a8:	0af40f63          	beq	s0,a5,ffffffffc0204166 <do_wait.part.0+0x14e>
ffffffffc02040ac:	000a8663          	beqz	s5,ffffffffc02040b8 <do_wait.part.0+0xa0>
ffffffffc02040b0:	0e842783          	lw	a5,232(s0)
ffffffffc02040b4:	00faa023          	sw	a5,0(s5)
ffffffffc02040b8:	100027f3          	csrr	a5,sstatus
ffffffffc02040bc:	8b89                	andi	a5,a5,2
ffffffffc02040be:	4581                	li	a1,0
ffffffffc02040c0:	efd9                	bnez	a5,ffffffffc020415e <do_wait.part.0+0x146>
ffffffffc02040c2:	6c70                	ld	a2,216(s0)
ffffffffc02040c4:	7074                	ld	a3,224(s0)
ffffffffc02040c6:	10043703          	ld	a4,256(s0)
ffffffffc02040ca:	7c7c                	ld	a5,248(s0)
ffffffffc02040cc:	e614                	sd	a3,8(a2)
ffffffffc02040ce:	e290                	sd	a2,0(a3)
ffffffffc02040d0:	6470                	ld	a2,200(s0)
ffffffffc02040d2:	6874                	ld	a3,208(s0)
ffffffffc02040d4:	e614                	sd	a3,8(a2)
ffffffffc02040d6:	e290                	sd	a2,0(a3)
ffffffffc02040d8:	c319                	beqz	a4,ffffffffc02040de <do_wait.part.0+0xc6>
ffffffffc02040da:	ff7c                	sd	a5,248(a4)
ffffffffc02040dc:	7c7c                	ld	a5,248(s0)
ffffffffc02040de:	cbbd                	beqz	a5,ffffffffc0204154 <do_wait.part.0+0x13c>
ffffffffc02040e0:	10e7b023          	sd	a4,256(a5)
ffffffffc02040e4:	0003c717          	auipc	a4,0x3c
ffffffffc02040e8:	e1c70713          	addi	a4,a4,-484 # ffffffffc023ff00 <nr_process>
ffffffffc02040ec:	431c                	lw	a5,0(a4)
ffffffffc02040ee:	37fd                	addiw	a5,a5,-1
ffffffffc02040f0:	c31c                	sw	a5,0(a4)
ffffffffc02040f2:	edb1                	bnez	a1,ffffffffc020414e <do_wait.part.0+0x136>
ffffffffc02040f4:	6814                	ld	a3,16(s0)
ffffffffc02040f6:	c02007b7          	lui	a5,0xc0200
ffffffffc02040fa:	08f6ee63          	bltu	a3,a5,ffffffffc0204196 <do_wait.part.0+0x17e>
ffffffffc02040fe:	0003c797          	auipc	a5,0x3c
ffffffffc0204102:	e2a7b783          	ld	a5,-470(a5) # ffffffffc023ff28 <va_pa_offset>
ffffffffc0204106:	8e9d                	sub	a3,a3,a5
ffffffffc0204108:	82b1                	srli	a3,a3,0xc
ffffffffc020410a:	0003c797          	auipc	a5,0x3c
ffffffffc020410e:	db67b783          	ld	a5,-586(a5) # ffffffffc023fec0 <npage>
ffffffffc0204112:	06f6f663          	bgeu	a3,a5,ffffffffc020417e <do_wait.part.0+0x166>
ffffffffc0204116:	00006517          	auipc	a0,0x6
ffffffffc020411a:	78a53503          	ld	a0,1930(a0) # ffffffffc020a8a0 <nbase>
ffffffffc020411e:	8e89                	sub	a3,a3,a0
ffffffffc0204120:	069a                	slli	a3,a3,0x6
ffffffffc0204122:	0003c517          	auipc	a0,0x3c
ffffffffc0204126:	e1653503          	ld	a0,-490(a0) # ffffffffc023ff38 <pages>
ffffffffc020412a:	9536                	add	a0,a0,a3
ffffffffc020412c:	4589                	li	a1,2
ffffffffc020412e:	caffc0ef          	jal	ra,ffffffffc0200ddc <free_pages>
ffffffffc0204132:	8522                	mv	a0,s0
ffffffffc0204134:	fedfd0ef          	jal	ra,ffffffffc0202120 <kfree>
ffffffffc0204138:	4501                	li	a0,0
ffffffffc020413a:	70e2                	ld	ra,56(sp)
ffffffffc020413c:	7442                	ld	s0,48(sp)
ffffffffc020413e:	74a2                	ld	s1,40(sp)
ffffffffc0204140:	7902                	ld	s2,32(sp)
ffffffffc0204142:	69e2                	ld	s3,24(sp)
ffffffffc0204144:	6a42                	ld	s4,16(sp)
ffffffffc0204146:	6aa2                	ld	s5,8(sp)
ffffffffc0204148:	6b02                	ld	s6,0(sp)
ffffffffc020414a:	6121                	addi	sp,sp,64
ffffffffc020414c:	8082                	ret
ffffffffc020414e:	ce4fc0ef          	jal	ra,ffffffffc0200632 <intr_enable>
ffffffffc0204152:	b74d                	j	ffffffffc02040f4 <do_wait.part.0+0xdc>
ffffffffc0204154:	701c                	ld	a5,32(s0)
ffffffffc0204156:	fbf8                	sd	a4,240(a5)
ffffffffc0204158:	b771                	j	ffffffffc02040e4 <do_wait.part.0+0xcc>
ffffffffc020415a:	5579                	li	a0,-2
ffffffffc020415c:	bff9                	j	ffffffffc020413a <do_wait.part.0+0x122>
ffffffffc020415e:	cdafc0ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc0204162:	4585                	li	a1,1
ffffffffc0204164:	bfb9                	j	ffffffffc02040c2 <do_wait.part.0+0xaa>
ffffffffc0204166:	00005617          	auipc	a2,0x5
ffffffffc020416a:	6f260613          	addi	a2,a2,1778 # ffffffffc0209858 <default_pmm_manager+0x3d8>
ffffffffc020416e:	2f600593          	li	a1,758
ffffffffc0204172:	00005517          	auipc	a0,0x5
ffffffffc0204176:	68e50513          	addi	a0,a0,1678 # ffffffffc0209800 <default_pmm_manager+0x380>
ffffffffc020417a:	88efc0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc020417e:	00005617          	auipc	a2,0x5
ffffffffc0204182:	8b260613          	addi	a2,a2,-1870 # ffffffffc0208a30 <commands+0x700>
ffffffffc0204186:	06200593          	li	a1,98
ffffffffc020418a:	00005517          	auipc	a0,0x5
ffffffffc020418e:	8c650513          	addi	a0,a0,-1850 # ffffffffc0208a50 <commands+0x720>
ffffffffc0204192:	876fc0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0204196:	00005617          	auipc	a2,0x5
ffffffffc020419a:	92260613          	addi	a2,a2,-1758 # ffffffffc0208ab8 <commands+0x788>
ffffffffc020419e:	06e00593          	li	a1,110
ffffffffc02041a2:	00005517          	auipc	a0,0x5
ffffffffc02041a6:	8ae50513          	addi	a0,a0,-1874 # ffffffffc0208a50 <commands+0x720>
ffffffffc02041aa:	85efc0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc02041ae <init_main>:
ffffffffc02041ae:	1141                	addi	sp,sp,-16
ffffffffc02041b0:	e406                	sd	ra,8(sp)
ffffffffc02041b2:	c6dfc0ef          	jal	ra,ffffffffc0200e1e <nr_free_pages>
ffffffffc02041b6:	eb7fd0ef          	jal	ra,ffffffffc020206c <kallocated>
ffffffffc02041ba:	952ff0ef          	jal	ra,ffffffffc020330c <check_milk>
ffffffffc02041be:	a019                	j	ffffffffc02041c4 <init_main+0x16>
ffffffffc02041c0:	21d000ef          	jal	ra,ffffffffc0204bdc <schedule>
ffffffffc02041c4:	4581                	li	a1,0
ffffffffc02041c6:	4501                	li	a0,0
ffffffffc02041c8:	e51ff0ef          	jal	ra,ffffffffc0204018 <do_wait.part.0>
ffffffffc02041cc:	d975                	beqz	a0,ffffffffc02041c0 <init_main+0x12>
ffffffffc02041ce:	00005517          	auipc	a0,0x5
ffffffffc02041d2:	6aa50513          	addi	a0,a0,1706 # ffffffffc0209878 <default_pmm_manager+0x3f8>
ffffffffc02041d6:	ef7fb0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02041da:	0003c797          	auipc	a5,0x3c
ffffffffc02041de:	d1e7b783          	ld	a5,-738(a5) # ffffffffc023fef8 <initproc>
ffffffffc02041e2:	7bf8                	ld	a4,240(a5)
ffffffffc02041e4:	e339                	bnez	a4,ffffffffc020422a <init_main+0x7c>
ffffffffc02041e6:	7ff8                	ld	a4,248(a5)
ffffffffc02041e8:	e329                	bnez	a4,ffffffffc020422a <init_main+0x7c>
ffffffffc02041ea:	1007b703          	ld	a4,256(a5)
ffffffffc02041ee:	ef15                	bnez	a4,ffffffffc020422a <init_main+0x7c>
ffffffffc02041f0:	0003c697          	auipc	a3,0x3c
ffffffffc02041f4:	d106a683          	lw	a3,-752(a3) # ffffffffc023ff00 <nr_process>
ffffffffc02041f8:	4709                	li	a4,2
ffffffffc02041fa:	08e69863          	bne	a3,a4,ffffffffc020428a <init_main+0xdc>
ffffffffc02041fe:	0003c717          	auipc	a4,0x3c
ffffffffc0204202:	e9270713          	addi	a4,a4,-366 # ffffffffc0240090 <proc_list>
ffffffffc0204206:	6714                	ld	a3,8(a4)
ffffffffc0204208:	0c878793          	addi	a5,a5,200
ffffffffc020420c:	04d79f63          	bne	a5,a3,ffffffffc020426a <init_main+0xbc>
ffffffffc0204210:	6318                	ld	a4,0(a4)
ffffffffc0204212:	02e79c63          	bne	a5,a4,ffffffffc020424a <init_main+0x9c>
ffffffffc0204216:	00005517          	auipc	a0,0x5
ffffffffc020421a:	74a50513          	addi	a0,a0,1866 # ffffffffc0209960 <default_pmm_manager+0x4e0>
ffffffffc020421e:	eaffb0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0204222:	60a2                	ld	ra,8(sp)
ffffffffc0204224:	4501                	li	a0,0
ffffffffc0204226:	0141                	addi	sp,sp,16
ffffffffc0204228:	8082                	ret
ffffffffc020422a:	00005697          	auipc	a3,0x5
ffffffffc020422e:	67668693          	addi	a3,a3,1654 # ffffffffc02098a0 <default_pmm_manager+0x420>
ffffffffc0204232:	00004617          	auipc	a2,0x4
ffffffffc0204236:	50e60613          	addi	a2,a2,1294 # ffffffffc0208740 <commands+0x410>
ffffffffc020423a:	35f00593          	li	a1,863
ffffffffc020423e:	00005517          	auipc	a0,0x5
ffffffffc0204242:	5c250513          	addi	a0,a0,1474 # ffffffffc0209800 <default_pmm_manager+0x380>
ffffffffc0204246:	fc3fb0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc020424a:	00005697          	auipc	a3,0x5
ffffffffc020424e:	6e668693          	addi	a3,a3,1766 # ffffffffc0209930 <default_pmm_manager+0x4b0>
ffffffffc0204252:	00004617          	auipc	a2,0x4
ffffffffc0204256:	4ee60613          	addi	a2,a2,1262 # ffffffffc0208740 <commands+0x410>
ffffffffc020425a:	36200593          	li	a1,866
ffffffffc020425e:	00005517          	auipc	a0,0x5
ffffffffc0204262:	5a250513          	addi	a0,a0,1442 # ffffffffc0209800 <default_pmm_manager+0x380>
ffffffffc0204266:	fa3fb0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc020426a:	00005697          	auipc	a3,0x5
ffffffffc020426e:	69668693          	addi	a3,a3,1686 # ffffffffc0209900 <default_pmm_manager+0x480>
ffffffffc0204272:	00004617          	auipc	a2,0x4
ffffffffc0204276:	4ce60613          	addi	a2,a2,1230 # ffffffffc0208740 <commands+0x410>
ffffffffc020427a:	36100593          	li	a1,865
ffffffffc020427e:	00005517          	auipc	a0,0x5
ffffffffc0204282:	58250513          	addi	a0,a0,1410 # ffffffffc0209800 <default_pmm_manager+0x380>
ffffffffc0204286:	f83fb0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc020428a:	00005697          	auipc	a3,0x5
ffffffffc020428e:	66668693          	addi	a3,a3,1638 # ffffffffc02098f0 <default_pmm_manager+0x470>
ffffffffc0204292:	00004617          	auipc	a2,0x4
ffffffffc0204296:	4ae60613          	addi	a2,a2,1198 # ffffffffc0208740 <commands+0x410>
ffffffffc020429a:	36000593          	li	a1,864
ffffffffc020429e:	00005517          	auipc	a0,0x5
ffffffffc02042a2:	56250513          	addi	a0,a0,1378 # ffffffffc0209800 <default_pmm_manager+0x380>
ffffffffc02042a6:	f63fb0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc02042aa <do_execve>:
ffffffffc02042aa:	7135                	addi	sp,sp,-160
ffffffffc02042ac:	f4d6                	sd	s5,104(sp)
ffffffffc02042ae:	0003ca97          	auipc	s5,0x3c
ffffffffc02042b2:	c3aa8a93          	addi	s5,s5,-966 # ffffffffc023fee8 <current>
ffffffffc02042b6:	000ab783          	ld	a5,0(s5)
ffffffffc02042ba:	f8d2                	sd	s4,112(sp)
ffffffffc02042bc:	e526                	sd	s1,136(sp)
ffffffffc02042be:	0287ba03          	ld	s4,40(a5)
ffffffffc02042c2:	e14a                	sd	s2,128(sp)
ffffffffc02042c4:	fcce                	sd	s3,120(sp)
ffffffffc02042c6:	892a                	mv	s2,a0
ffffffffc02042c8:	84ae                	mv	s1,a1
ffffffffc02042ca:	89b2                	mv	s3,a2
ffffffffc02042cc:	4681                	li	a3,0
ffffffffc02042ce:	862e                	mv	a2,a1
ffffffffc02042d0:	85aa                	mv	a1,a0
ffffffffc02042d2:	8552                	mv	a0,s4
ffffffffc02042d4:	ed06                	sd	ra,152(sp)
ffffffffc02042d6:	e922                	sd	s0,144(sp)
ffffffffc02042d8:	f0da                	sd	s6,96(sp)
ffffffffc02042da:	ecde                	sd	s7,88(sp)
ffffffffc02042dc:	e8e2                	sd	s8,80(sp)
ffffffffc02042de:	e4e6                	sd	s9,72(sp)
ffffffffc02042e0:	e0ea                	sd	s10,64(sp)
ffffffffc02042e2:	fc6e                	sd	s11,56(sp)
ffffffffc02042e4:	8c9fd0ef          	jal	ra,ffffffffc0201bac <user_mem_check>
ffffffffc02042e8:	46050063          	beqz	a0,ffffffffc0204748 <do_execve+0x49e>
ffffffffc02042ec:	4641                	li	a2,16
ffffffffc02042ee:	4581                	li	a1,0
ffffffffc02042f0:	1008                	addi	a0,sp,32
ffffffffc02042f2:	171030ef          	jal	ra,ffffffffc0207c62 <memset>
ffffffffc02042f6:	47bd                	li	a5,15
ffffffffc02042f8:	8626                	mv	a2,s1
ffffffffc02042fa:	1897ea63          	bltu	a5,s1,ffffffffc020448e <do_execve+0x1e4>
ffffffffc02042fe:	85ca                	mv	a1,s2
ffffffffc0204300:	1008                	addi	a0,sp,32
ffffffffc0204302:	173030ef          	jal	ra,ffffffffc0207c74 <memcpy>
ffffffffc0204306:	180a0b63          	beqz	s4,ffffffffc020449c <do_execve+0x1f2>
ffffffffc020430a:	00005517          	auipc	a0,0x5
ffffffffc020430e:	96e50513          	addi	a0,a0,-1682 # ffffffffc0208c78 <commands+0x948>
ffffffffc0204312:	df3fb0ef          	jal	ra,ffffffffc0200104 <cputs>
ffffffffc0204316:	0003c797          	auipc	a5,0x3c
ffffffffc020431a:	c1a7b783          	ld	a5,-998(a5) # ffffffffc023ff30 <boot_cr3>
ffffffffc020431e:	577d                	li	a4,-1
ffffffffc0204320:	177e                	slli	a4,a4,0x3f
ffffffffc0204322:	83b1                	srli	a5,a5,0xc
ffffffffc0204324:	8fd9                	or	a5,a5,a4
ffffffffc0204326:	18079073          	csrw	satp,a5
ffffffffc020432a:	030a2783          	lw	a5,48(s4) # ffffffff80000030 <_binary_obj___user_matrix_out_size+0xffffffff7fffd690>
ffffffffc020432e:	fff7871b          	addiw	a4,a5,-1
ffffffffc0204332:	02ea2823          	sw	a4,48(s4)
ffffffffc0204336:	2c070163          	beqz	a4,ffffffffc02045f8 <do_execve+0x34e>
ffffffffc020433a:	000ab783          	ld	a5,0(s5)
ffffffffc020433e:	0207b423          	sd	zero,40(a5)
ffffffffc0204342:	bf6fd0ef          	jal	ra,ffffffffc0201738 <mm_create>
ffffffffc0204346:	84aa                	mv	s1,a0
ffffffffc0204348:	18050263          	beqz	a0,ffffffffc02044cc <do_execve+0x222>
ffffffffc020434c:	0561                	addi	a0,a0,24
ffffffffc020434e:	d82ff0ef          	jal	ra,ffffffffc02038d0 <setup_pgdir.isra.0>
ffffffffc0204352:	16051663          	bnez	a0,ffffffffc02044be <do_execve+0x214>
ffffffffc0204356:	0009a703          	lw	a4,0(s3)
ffffffffc020435a:	464c47b7          	lui	a5,0x464c4
ffffffffc020435e:	57f78793          	addi	a5,a5,1407 # 464c457f <_binary_obj___user_matrix_out_size+0x464c1bdf>
ffffffffc0204362:	24f71763          	bne	a4,a5,ffffffffc02045b0 <do_execve+0x306>
ffffffffc0204366:	0389d703          	lhu	a4,56(s3)
ffffffffc020436a:	0209b903          	ld	s2,32(s3)
ffffffffc020436e:	00371793          	slli	a5,a4,0x3
ffffffffc0204372:	8f99                	sub	a5,a5,a4
ffffffffc0204374:	994e                	add	s2,s2,s3
ffffffffc0204376:	078e                	slli	a5,a5,0x3
ffffffffc0204378:	97ca                	add	a5,a5,s2
ffffffffc020437a:	ec3e                	sd	a5,24(sp)
ffffffffc020437c:	02f97c63          	bgeu	s2,a5,ffffffffc02043b4 <do_execve+0x10a>
ffffffffc0204380:	5bfd                	li	s7,-1
ffffffffc0204382:	00cbd793          	srli	a5,s7,0xc
ffffffffc0204386:	0003cd97          	auipc	s11,0x3c
ffffffffc020438a:	bb2d8d93          	addi	s11,s11,-1102 # ffffffffc023ff38 <pages>
ffffffffc020438e:	00006d17          	auipc	s10,0x6
ffffffffc0204392:	512d0d13          	addi	s10,s10,1298 # ffffffffc020a8a0 <nbase>
ffffffffc0204396:	e43e                	sd	a5,8(sp)
ffffffffc0204398:	0003cc97          	auipc	s9,0x3c
ffffffffc020439c:	b28c8c93          	addi	s9,s9,-1240 # ffffffffc023fec0 <npage>
ffffffffc02043a0:	00092703          	lw	a4,0(s2)
ffffffffc02043a4:	4785                	li	a5,1
ffffffffc02043a6:	12f70563          	beq	a4,a5,ffffffffc02044d0 <do_execve+0x226>
ffffffffc02043aa:	67e2                	ld	a5,24(sp)
ffffffffc02043ac:	03890913          	addi	s2,s2,56
ffffffffc02043b0:	fef968e3          	bltu	s2,a5,ffffffffc02043a0 <do_execve+0xf6>
ffffffffc02043b4:	4701                	li	a4,0
ffffffffc02043b6:	46ad                	li	a3,11
ffffffffc02043b8:	00100637          	lui	a2,0x100
ffffffffc02043bc:	7ff005b7          	lui	a1,0x7ff00
ffffffffc02043c0:	8526                	mv	a0,s1
ffffffffc02043c2:	d26fd0ef          	jal	ra,ffffffffc02018e8 <mm_map>
ffffffffc02043c6:	8a2a                	mv	s4,a0
ffffffffc02043c8:	1e051063          	bnez	a0,ffffffffc02045a8 <do_execve+0x2fe>
ffffffffc02043cc:	6c88                	ld	a0,24(s1)
ffffffffc02043ce:	467d                	li	a2,31
ffffffffc02043d0:	7ffff5b7          	lui	a1,0x7ffff
ffffffffc02043d4:	ab2fd0ef          	jal	ra,ffffffffc0201686 <pgdir_alloc_page>
ffffffffc02043d8:	42050e63          	beqz	a0,ffffffffc0204814 <do_execve+0x56a>
ffffffffc02043dc:	6c88                	ld	a0,24(s1)
ffffffffc02043de:	467d                	li	a2,31
ffffffffc02043e0:	7fffe5b7          	lui	a1,0x7fffe
ffffffffc02043e4:	aa2fd0ef          	jal	ra,ffffffffc0201686 <pgdir_alloc_page>
ffffffffc02043e8:	40050663          	beqz	a0,ffffffffc02047f4 <do_execve+0x54a>
ffffffffc02043ec:	6c88                	ld	a0,24(s1)
ffffffffc02043ee:	467d                	li	a2,31
ffffffffc02043f0:	7fffd5b7          	lui	a1,0x7fffd
ffffffffc02043f4:	a92fd0ef          	jal	ra,ffffffffc0201686 <pgdir_alloc_page>
ffffffffc02043f8:	3c050e63          	beqz	a0,ffffffffc02047d4 <do_execve+0x52a>
ffffffffc02043fc:	6c88                	ld	a0,24(s1)
ffffffffc02043fe:	467d                	li	a2,31
ffffffffc0204400:	7fffc5b7          	lui	a1,0x7fffc
ffffffffc0204404:	a82fd0ef          	jal	ra,ffffffffc0201686 <pgdir_alloc_page>
ffffffffc0204408:	3a050663          	beqz	a0,ffffffffc02047b4 <do_execve+0x50a>
ffffffffc020440c:	589c                	lw	a5,48(s1)
ffffffffc020440e:	000ab603          	ld	a2,0(s5)
ffffffffc0204412:	6c94                	ld	a3,24(s1)
ffffffffc0204414:	2785                	addiw	a5,a5,1
ffffffffc0204416:	d89c                	sw	a5,48(s1)
ffffffffc0204418:	f604                	sd	s1,40(a2)
ffffffffc020441a:	c02007b7          	lui	a5,0xc0200
ffffffffc020441e:	36f6ef63          	bltu	a3,a5,ffffffffc020479c <do_execve+0x4f2>
ffffffffc0204422:	0003c797          	auipc	a5,0x3c
ffffffffc0204426:	b067b783          	ld	a5,-1274(a5) # ffffffffc023ff28 <va_pa_offset>
ffffffffc020442a:	8e9d                	sub	a3,a3,a5
ffffffffc020442c:	577d                	li	a4,-1
ffffffffc020442e:	00c6d793          	srli	a5,a3,0xc
ffffffffc0204432:	177e                	slli	a4,a4,0x3f
ffffffffc0204434:	f654                	sd	a3,168(a2)
ffffffffc0204436:	8fd9                	or	a5,a5,a4
ffffffffc0204438:	18079073          	csrw	satp,a5
ffffffffc020443c:	7240                	ld	s0,160(a2)
ffffffffc020443e:	4581                	li	a1,0
ffffffffc0204440:	12000613          	li	a2,288
ffffffffc0204444:	8522                	mv	a0,s0
ffffffffc0204446:	10043483          	ld	s1,256(s0)
ffffffffc020444a:	019030ef          	jal	ra,ffffffffc0207c62 <memset>
ffffffffc020444e:	0189b703          	ld	a4,24(s3)
ffffffffc0204452:	4785                	li	a5,1
ffffffffc0204454:	000ab503          	ld	a0,0(s5)
ffffffffc0204458:	edf4f493          	andi	s1,s1,-289
ffffffffc020445c:	07fe                	slli	a5,a5,0x1f
ffffffffc020445e:	e81c                	sd	a5,16(s0)
ffffffffc0204460:	10e43423          	sd	a4,264(s0)
ffffffffc0204464:	10943023          	sd	s1,256(s0)
ffffffffc0204468:	100c                	addi	a1,sp,32
ffffffffc020446a:	ce8ff0ef          	jal	ra,ffffffffc0203952 <set_proc_name>
ffffffffc020446e:	60ea                	ld	ra,152(sp)
ffffffffc0204470:	644a                	ld	s0,144(sp)
ffffffffc0204472:	64aa                	ld	s1,136(sp)
ffffffffc0204474:	690a                	ld	s2,128(sp)
ffffffffc0204476:	79e6                	ld	s3,120(sp)
ffffffffc0204478:	7aa6                	ld	s5,104(sp)
ffffffffc020447a:	7b06                	ld	s6,96(sp)
ffffffffc020447c:	6be6                	ld	s7,88(sp)
ffffffffc020447e:	6c46                	ld	s8,80(sp)
ffffffffc0204480:	6ca6                	ld	s9,72(sp)
ffffffffc0204482:	6d06                	ld	s10,64(sp)
ffffffffc0204484:	7de2                	ld	s11,56(sp)
ffffffffc0204486:	8552                	mv	a0,s4
ffffffffc0204488:	7a46                	ld	s4,112(sp)
ffffffffc020448a:	610d                	addi	sp,sp,160
ffffffffc020448c:	8082                	ret
ffffffffc020448e:	463d                	li	a2,15
ffffffffc0204490:	85ca                	mv	a1,s2
ffffffffc0204492:	1008                	addi	a0,sp,32
ffffffffc0204494:	7e0030ef          	jal	ra,ffffffffc0207c74 <memcpy>
ffffffffc0204498:	e60a19e3          	bnez	s4,ffffffffc020430a <do_execve+0x60>
ffffffffc020449c:	000ab783          	ld	a5,0(s5)
ffffffffc02044a0:	779c                	ld	a5,40(a5)
ffffffffc02044a2:	ea0780e3          	beqz	a5,ffffffffc0204342 <do_execve+0x98>
ffffffffc02044a6:	00005617          	auipc	a2,0x5
ffffffffc02044aa:	4da60613          	addi	a2,a2,1242 # ffffffffc0209980 <default_pmm_manager+0x500>
ffffffffc02044ae:	20300593          	li	a1,515
ffffffffc02044b2:	00005517          	auipc	a0,0x5
ffffffffc02044b6:	34e50513          	addi	a0,a0,846 # ffffffffc0209800 <default_pmm_manager+0x380>
ffffffffc02044ba:	d4ffb0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc02044be:	8526                	mv	a0,s1
ffffffffc02044c0:	bd6fd0ef          	jal	ra,ffffffffc0201896 <mm_destroy>
ffffffffc02044c4:	5a71                	li	s4,-4
ffffffffc02044c6:	8552                	mv	a0,s4
ffffffffc02044c8:	99bff0ef          	jal	ra,ffffffffc0203e62 <do_exit>
ffffffffc02044cc:	5a71                	li	s4,-4
ffffffffc02044ce:	bfe5                	j	ffffffffc02044c6 <do_execve+0x21c>
ffffffffc02044d0:	02893603          	ld	a2,40(s2)
ffffffffc02044d4:	02093783          	ld	a5,32(s2)
ffffffffc02044d8:	26f66c63          	bltu	a2,a5,ffffffffc0204750 <do_execve+0x4a6>
ffffffffc02044dc:	00492783          	lw	a5,4(s2)
ffffffffc02044e0:	0017f693          	andi	a3,a5,1
ffffffffc02044e4:	c291                	beqz	a3,ffffffffc02044e8 <do_execve+0x23e>
ffffffffc02044e6:	4691                	li	a3,4
ffffffffc02044e8:	0027f713          	andi	a4,a5,2
ffffffffc02044ec:	8b91                	andi	a5,a5,4
ffffffffc02044ee:	14071c63          	bnez	a4,ffffffffc0204646 <do_execve+0x39c>
ffffffffc02044f2:	4745                	li	a4,17
ffffffffc02044f4:	e03a                	sd	a4,0(sp)
ffffffffc02044f6:	c789                	beqz	a5,ffffffffc0204500 <do_execve+0x256>
ffffffffc02044f8:	47cd                	li	a5,19
ffffffffc02044fa:	0016e693          	ori	a3,a3,1
ffffffffc02044fe:	e03e                	sd	a5,0(sp)
ffffffffc0204500:	0026f793          	andi	a5,a3,2
ffffffffc0204504:	14079563          	bnez	a5,ffffffffc020464e <do_execve+0x3a4>
ffffffffc0204508:	0046f793          	andi	a5,a3,4
ffffffffc020450c:	c789                	beqz	a5,ffffffffc0204516 <do_execve+0x26c>
ffffffffc020450e:	6782                	ld	a5,0(sp)
ffffffffc0204510:	0087e793          	ori	a5,a5,8
ffffffffc0204514:	e03e                	sd	a5,0(sp)
ffffffffc0204516:	01093583          	ld	a1,16(s2)
ffffffffc020451a:	4701                	li	a4,0
ffffffffc020451c:	8526                	mv	a0,s1
ffffffffc020451e:	bcafd0ef          	jal	ra,ffffffffc02018e8 <mm_map>
ffffffffc0204522:	8a2a                	mv	s4,a0
ffffffffc0204524:	e151                	bnez	a0,ffffffffc02045a8 <do_execve+0x2fe>
ffffffffc0204526:	01093c03          	ld	s8,16(s2)
ffffffffc020452a:	02093a03          	ld	s4,32(s2)
ffffffffc020452e:	00893b03          	ld	s6,8(s2)
ffffffffc0204532:	77fd                	lui	a5,0xfffff
ffffffffc0204534:	9a62                	add	s4,s4,s8
ffffffffc0204536:	9b4e                	add	s6,s6,s3
ffffffffc0204538:	00fc7bb3          	and	s7,s8,a5
ffffffffc020453c:	054c6e63          	bltu	s8,s4,ffffffffc0204598 <do_execve+0x2ee>
ffffffffc0204540:	a431                	j	ffffffffc020474c <do_execve+0x4a2>
ffffffffc0204542:	6785                	lui	a5,0x1
ffffffffc0204544:	417c0533          	sub	a0,s8,s7
ffffffffc0204548:	9bbe                	add	s7,s7,a5
ffffffffc020454a:	418b8633          	sub	a2,s7,s8
ffffffffc020454e:	017a7463          	bgeu	s4,s7,ffffffffc0204556 <do_execve+0x2ac>
ffffffffc0204552:	418a0633          	sub	a2,s4,s8
ffffffffc0204556:	000db683          	ld	a3,0(s11)
ffffffffc020455a:	000d3803          	ld	a6,0(s10)
ffffffffc020455e:	67a2                	ld	a5,8(sp)
ffffffffc0204560:	40d406b3          	sub	a3,s0,a3
ffffffffc0204564:	8699                	srai	a3,a3,0x6
ffffffffc0204566:	000cb583          	ld	a1,0(s9)
ffffffffc020456a:	96c2                	add	a3,a3,a6
ffffffffc020456c:	00f6f833          	and	a6,a3,a5
ffffffffc0204570:	06b2                	slli	a3,a3,0xc
ffffffffc0204572:	1eb87163          	bgeu	a6,a1,ffffffffc0204754 <do_execve+0x4aa>
ffffffffc0204576:	0003c797          	auipc	a5,0x3c
ffffffffc020457a:	9b278793          	addi	a5,a5,-1614 # ffffffffc023ff28 <va_pa_offset>
ffffffffc020457e:	0007b803          	ld	a6,0(a5)
ffffffffc0204582:	85da                	mv	a1,s6
ffffffffc0204584:	9c32                	add	s8,s8,a2
ffffffffc0204586:	96c2                	add	a3,a3,a6
ffffffffc0204588:	9536                	add	a0,a0,a3
ffffffffc020458a:	e832                	sd	a2,16(sp)
ffffffffc020458c:	6e8030ef          	jal	ra,ffffffffc0207c74 <memcpy>
ffffffffc0204590:	6642                	ld	a2,16(sp)
ffffffffc0204592:	9b32                	add	s6,s6,a2
ffffffffc0204594:	0d4c7063          	bgeu	s8,s4,ffffffffc0204654 <do_execve+0x3aa>
ffffffffc0204598:	6c88                	ld	a0,24(s1)
ffffffffc020459a:	6602                	ld	a2,0(sp)
ffffffffc020459c:	85de                	mv	a1,s7
ffffffffc020459e:	8e8fd0ef          	jal	ra,ffffffffc0201686 <pgdir_alloc_page>
ffffffffc02045a2:	842a                	mv	s0,a0
ffffffffc02045a4:	fd59                	bnez	a0,ffffffffc0204542 <do_execve+0x298>
ffffffffc02045a6:	5a71                	li	s4,-4
ffffffffc02045a8:	8526                	mv	a0,s1
ffffffffc02045aa:	c88fd0ef          	jal	ra,ffffffffc0201a32 <exit_mmap>
ffffffffc02045ae:	a011                	j	ffffffffc02045b2 <do_execve+0x308>
ffffffffc02045b0:	5a61                	li	s4,-8
ffffffffc02045b2:	6c94                	ld	a3,24(s1)
ffffffffc02045b4:	c02007b7          	lui	a5,0xc0200
ffffffffc02045b8:	1af6ea63          	bltu	a3,a5,ffffffffc020476c <do_execve+0x4c2>
ffffffffc02045bc:	0003c517          	auipc	a0,0x3c
ffffffffc02045c0:	96c53503          	ld	a0,-1684(a0) # ffffffffc023ff28 <va_pa_offset>
ffffffffc02045c4:	8e89                	sub	a3,a3,a0
ffffffffc02045c6:	82b1                	srli	a3,a3,0xc
ffffffffc02045c8:	0003c797          	auipc	a5,0x3c
ffffffffc02045cc:	8f87b783          	ld	a5,-1800(a5) # ffffffffc023fec0 <npage>
ffffffffc02045d0:	1af6fa63          	bgeu	a3,a5,ffffffffc0204784 <do_execve+0x4da>
ffffffffc02045d4:	00006517          	auipc	a0,0x6
ffffffffc02045d8:	2cc53503          	ld	a0,716(a0) # ffffffffc020a8a0 <nbase>
ffffffffc02045dc:	8e89                	sub	a3,a3,a0
ffffffffc02045de:	069a                	slli	a3,a3,0x6
ffffffffc02045e0:	0003c517          	auipc	a0,0x3c
ffffffffc02045e4:	95853503          	ld	a0,-1704(a0) # ffffffffc023ff38 <pages>
ffffffffc02045e8:	9536                	add	a0,a0,a3
ffffffffc02045ea:	4585                	li	a1,1
ffffffffc02045ec:	ff0fc0ef          	jal	ra,ffffffffc0200ddc <free_pages>
ffffffffc02045f0:	8526                	mv	a0,s1
ffffffffc02045f2:	aa4fd0ef          	jal	ra,ffffffffc0201896 <mm_destroy>
ffffffffc02045f6:	bdc1                	j	ffffffffc02044c6 <do_execve+0x21c>
ffffffffc02045f8:	8552                	mv	a0,s4
ffffffffc02045fa:	c38fd0ef          	jal	ra,ffffffffc0201a32 <exit_mmap>
ffffffffc02045fe:	018a3683          	ld	a3,24(s4)
ffffffffc0204602:	c02007b7          	lui	a5,0xc0200
ffffffffc0204606:	16f6e363          	bltu	a3,a5,ffffffffc020476c <do_execve+0x4c2>
ffffffffc020460a:	0003c797          	auipc	a5,0x3c
ffffffffc020460e:	91e7b783          	ld	a5,-1762(a5) # ffffffffc023ff28 <va_pa_offset>
ffffffffc0204612:	8e9d                	sub	a3,a3,a5
ffffffffc0204614:	82b1                	srli	a3,a3,0xc
ffffffffc0204616:	0003c797          	auipc	a5,0x3c
ffffffffc020461a:	8aa7b783          	ld	a5,-1878(a5) # ffffffffc023fec0 <npage>
ffffffffc020461e:	16f6f363          	bgeu	a3,a5,ffffffffc0204784 <do_execve+0x4da>
ffffffffc0204622:	00006517          	auipc	a0,0x6
ffffffffc0204626:	27e53503          	ld	a0,638(a0) # ffffffffc020a8a0 <nbase>
ffffffffc020462a:	8e89                	sub	a3,a3,a0
ffffffffc020462c:	069a                	slli	a3,a3,0x6
ffffffffc020462e:	0003c517          	auipc	a0,0x3c
ffffffffc0204632:	90a53503          	ld	a0,-1782(a0) # ffffffffc023ff38 <pages>
ffffffffc0204636:	9536                	add	a0,a0,a3
ffffffffc0204638:	4585                	li	a1,1
ffffffffc020463a:	fa2fc0ef          	jal	ra,ffffffffc0200ddc <free_pages>
ffffffffc020463e:	8552                	mv	a0,s4
ffffffffc0204640:	a56fd0ef          	jal	ra,ffffffffc0201896 <mm_destroy>
ffffffffc0204644:	b9dd                	j	ffffffffc020433a <do_execve+0x90>
ffffffffc0204646:	0026e693          	ori	a3,a3,2
ffffffffc020464a:	ea0797e3          	bnez	a5,ffffffffc02044f8 <do_execve+0x24e>
ffffffffc020464e:	47dd                	li	a5,23
ffffffffc0204650:	e03e                	sd	a5,0(sp)
ffffffffc0204652:	bd5d                	j	ffffffffc0204508 <do_execve+0x25e>
ffffffffc0204654:	01093a03          	ld	s4,16(s2)
ffffffffc0204658:	02893683          	ld	a3,40(s2)
ffffffffc020465c:	9a36                	add	s4,s4,a3
ffffffffc020465e:	077c7f63          	bgeu	s8,s7,ffffffffc02046dc <do_execve+0x432>
ffffffffc0204662:	d58a04e3          	beq	s4,s8,ffffffffc02043aa <do_execve+0x100>
ffffffffc0204666:	6505                	lui	a0,0x1
ffffffffc0204668:	9562                	add	a0,a0,s8
ffffffffc020466a:	41750533          	sub	a0,a0,s7
ffffffffc020466e:	418a0b33          	sub	s6,s4,s8
ffffffffc0204672:	0d7a7863          	bgeu	s4,s7,ffffffffc0204742 <do_execve+0x498>
ffffffffc0204676:	000db683          	ld	a3,0(s11)
ffffffffc020467a:	000d3583          	ld	a1,0(s10)
ffffffffc020467e:	67a2                	ld	a5,8(sp)
ffffffffc0204680:	40d406b3          	sub	a3,s0,a3
ffffffffc0204684:	8699                	srai	a3,a3,0x6
ffffffffc0204686:	000cb603          	ld	a2,0(s9)
ffffffffc020468a:	96ae                	add	a3,a3,a1
ffffffffc020468c:	00f6f5b3          	and	a1,a3,a5
ffffffffc0204690:	06b2                	slli	a3,a3,0xc
ffffffffc0204692:	0cc5f163          	bgeu	a1,a2,ffffffffc0204754 <do_execve+0x4aa>
ffffffffc0204696:	0003c617          	auipc	a2,0x3c
ffffffffc020469a:	89263603          	ld	a2,-1902(a2) # ffffffffc023ff28 <va_pa_offset>
ffffffffc020469e:	96b2                	add	a3,a3,a2
ffffffffc02046a0:	4581                	li	a1,0
ffffffffc02046a2:	865a                	mv	a2,s6
ffffffffc02046a4:	9536                	add	a0,a0,a3
ffffffffc02046a6:	5bc030ef          	jal	ra,ffffffffc0207c62 <memset>
ffffffffc02046aa:	018b0733          	add	a4,s6,s8
ffffffffc02046ae:	037a7463          	bgeu	s4,s7,ffffffffc02046d6 <do_execve+0x42c>
ffffffffc02046b2:	ceea0ce3          	beq	s4,a4,ffffffffc02043aa <do_execve+0x100>
ffffffffc02046b6:	00005697          	auipc	a3,0x5
ffffffffc02046ba:	2f268693          	addi	a3,a3,754 # ffffffffc02099a8 <default_pmm_manager+0x528>
ffffffffc02046be:	00004617          	auipc	a2,0x4
ffffffffc02046c2:	08260613          	addi	a2,a2,130 # ffffffffc0208740 <commands+0x410>
ffffffffc02046c6:	25800593          	li	a1,600
ffffffffc02046ca:	00005517          	auipc	a0,0x5
ffffffffc02046ce:	13650513          	addi	a0,a0,310 # ffffffffc0209800 <default_pmm_manager+0x380>
ffffffffc02046d2:	b37fb0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc02046d6:	ff7710e3          	bne	a4,s7,ffffffffc02046b6 <do_execve+0x40c>
ffffffffc02046da:	8c5e                	mv	s8,s7
ffffffffc02046dc:	0003cb17          	auipc	s6,0x3c
ffffffffc02046e0:	84cb0b13          	addi	s6,s6,-1972 # ffffffffc023ff28 <va_pa_offset>
ffffffffc02046e4:	054c6763          	bltu	s8,s4,ffffffffc0204732 <do_execve+0x488>
ffffffffc02046e8:	b1c9                	j	ffffffffc02043aa <do_execve+0x100>
ffffffffc02046ea:	6785                	lui	a5,0x1
ffffffffc02046ec:	417c0533          	sub	a0,s8,s7
ffffffffc02046f0:	9bbe                	add	s7,s7,a5
ffffffffc02046f2:	418b8633          	sub	a2,s7,s8
ffffffffc02046f6:	017a7463          	bgeu	s4,s7,ffffffffc02046fe <do_execve+0x454>
ffffffffc02046fa:	418a0633          	sub	a2,s4,s8
ffffffffc02046fe:	000db683          	ld	a3,0(s11)
ffffffffc0204702:	000d3803          	ld	a6,0(s10)
ffffffffc0204706:	67a2                	ld	a5,8(sp)
ffffffffc0204708:	40d406b3          	sub	a3,s0,a3
ffffffffc020470c:	8699                	srai	a3,a3,0x6
ffffffffc020470e:	000cb583          	ld	a1,0(s9)
ffffffffc0204712:	96c2                	add	a3,a3,a6
ffffffffc0204714:	00f6f833          	and	a6,a3,a5
ffffffffc0204718:	06b2                	slli	a3,a3,0xc
ffffffffc020471a:	02b87d63          	bgeu	a6,a1,ffffffffc0204754 <do_execve+0x4aa>
ffffffffc020471e:	000b3803          	ld	a6,0(s6)
ffffffffc0204722:	9c32                	add	s8,s8,a2
ffffffffc0204724:	4581                	li	a1,0
ffffffffc0204726:	96c2                	add	a3,a3,a6
ffffffffc0204728:	9536                	add	a0,a0,a3
ffffffffc020472a:	538030ef          	jal	ra,ffffffffc0207c62 <memset>
ffffffffc020472e:	c74c7ee3          	bgeu	s8,s4,ffffffffc02043aa <do_execve+0x100>
ffffffffc0204732:	6c88                	ld	a0,24(s1)
ffffffffc0204734:	6602                	ld	a2,0(sp)
ffffffffc0204736:	85de                	mv	a1,s7
ffffffffc0204738:	f4ffc0ef          	jal	ra,ffffffffc0201686 <pgdir_alloc_page>
ffffffffc020473c:	842a                	mv	s0,a0
ffffffffc020473e:	f555                	bnez	a0,ffffffffc02046ea <do_execve+0x440>
ffffffffc0204740:	b59d                	j	ffffffffc02045a6 <do_execve+0x2fc>
ffffffffc0204742:	418b8b33          	sub	s6,s7,s8
ffffffffc0204746:	bf05                	j	ffffffffc0204676 <do_execve+0x3cc>
ffffffffc0204748:	5a75                	li	s4,-3
ffffffffc020474a:	b315                	j	ffffffffc020446e <do_execve+0x1c4>
ffffffffc020474c:	8a62                	mv	s4,s8
ffffffffc020474e:	b729                	j	ffffffffc0204658 <do_execve+0x3ae>
ffffffffc0204750:	5a61                	li	s4,-8
ffffffffc0204752:	bd99                	j	ffffffffc02045a8 <do_execve+0x2fe>
ffffffffc0204754:	00004617          	auipc	a2,0x4
ffffffffc0204758:	39c60613          	addi	a2,a2,924 # ffffffffc0208af0 <commands+0x7c0>
ffffffffc020475c:	06900593          	li	a1,105
ffffffffc0204760:	00004517          	auipc	a0,0x4
ffffffffc0204764:	2f050513          	addi	a0,a0,752 # ffffffffc0208a50 <commands+0x720>
ffffffffc0204768:	aa1fb0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc020476c:	00004617          	auipc	a2,0x4
ffffffffc0204770:	34c60613          	addi	a2,a2,844 # ffffffffc0208ab8 <commands+0x788>
ffffffffc0204774:	06e00593          	li	a1,110
ffffffffc0204778:	00004517          	auipc	a0,0x4
ffffffffc020477c:	2d850513          	addi	a0,a0,728 # ffffffffc0208a50 <commands+0x720>
ffffffffc0204780:	a89fb0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0204784:	00004617          	auipc	a2,0x4
ffffffffc0204788:	2ac60613          	addi	a2,a2,684 # ffffffffc0208a30 <commands+0x700>
ffffffffc020478c:	06200593          	li	a1,98
ffffffffc0204790:	00004517          	auipc	a0,0x4
ffffffffc0204794:	2c050513          	addi	a0,a0,704 # ffffffffc0208a50 <commands+0x720>
ffffffffc0204798:	a71fb0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc020479c:	00004617          	auipc	a2,0x4
ffffffffc02047a0:	31c60613          	addi	a2,a2,796 # ffffffffc0208ab8 <commands+0x788>
ffffffffc02047a4:	27300593          	li	a1,627
ffffffffc02047a8:	00005517          	auipc	a0,0x5
ffffffffc02047ac:	05850513          	addi	a0,a0,88 # ffffffffc0209800 <default_pmm_manager+0x380>
ffffffffc02047b0:	a59fb0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc02047b4:	00005697          	auipc	a3,0x5
ffffffffc02047b8:	30c68693          	addi	a3,a3,780 # ffffffffc0209ac0 <default_pmm_manager+0x640>
ffffffffc02047bc:	00004617          	auipc	a2,0x4
ffffffffc02047c0:	f8460613          	addi	a2,a2,-124 # ffffffffc0208740 <commands+0x410>
ffffffffc02047c4:	26e00593          	li	a1,622
ffffffffc02047c8:	00005517          	auipc	a0,0x5
ffffffffc02047cc:	03850513          	addi	a0,a0,56 # ffffffffc0209800 <default_pmm_manager+0x380>
ffffffffc02047d0:	a39fb0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc02047d4:	00005697          	auipc	a3,0x5
ffffffffc02047d8:	2a468693          	addi	a3,a3,676 # ffffffffc0209a78 <default_pmm_manager+0x5f8>
ffffffffc02047dc:	00004617          	auipc	a2,0x4
ffffffffc02047e0:	f6460613          	addi	a2,a2,-156 # ffffffffc0208740 <commands+0x410>
ffffffffc02047e4:	26d00593          	li	a1,621
ffffffffc02047e8:	00005517          	auipc	a0,0x5
ffffffffc02047ec:	01850513          	addi	a0,a0,24 # ffffffffc0209800 <default_pmm_manager+0x380>
ffffffffc02047f0:	a19fb0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc02047f4:	00005697          	auipc	a3,0x5
ffffffffc02047f8:	23c68693          	addi	a3,a3,572 # ffffffffc0209a30 <default_pmm_manager+0x5b0>
ffffffffc02047fc:	00004617          	auipc	a2,0x4
ffffffffc0204800:	f4460613          	addi	a2,a2,-188 # ffffffffc0208740 <commands+0x410>
ffffffffc0204804:	26c00593          	li	a1,620
ffffffffc0204808:	00005517          	auipc	a0,0x5
ffffffffc020480c:	ff850513          	addi	a0,a0,-8 # ffffffffc0209800 <default_pmm_manager+0x380>
ffffffffc0204810:	9f9fb0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0204814:	00005697          	auipc	a3,0x5
ffffffffc0204818:	1d468693          	addi	a3,a3,468 # ffffffffc02099e8 <default_pmm_manager+0x568>
ffffffffc020481c:	00004617          	auipc	a2,0x4
ffffffffc0204820:	f2460613          	addi	a2,a2,-220 # ffffffffc0208740 <commands+0x410>
ffffffffc0204824:	26b00593          	li	a1,619
ffffffffc0204828:	00005517          	auipc	a0,0x5
ffffffffc020482c:	fd850513          	addi	a0,a0,-40 # ffffffffc0209800 <default_pmm_manager+0x380>
ffffffffc0204830:	9d9fb0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0204834 <do_yield>:
ffffffffc0204834:	0003b797          	auipc	a5,0x3b
ffffffffc0204838:	6b47b783          	ld	a5,1716(a5) # ffffffffc023fee8 <current>
ffffffffc020483c:	4705                	li	a4,1
ffffffffc020483e:	ef98                	sd	a4,24(a5)
ffffffffc0204840:	4501                	li	a0,0
ffffffffc0204842:	8082                	ret

ffffffffc0204844 <do_wait>:
ffffffffc0204844:	1101                	addi	sp,sp,-32
ffffffffc0204846:	e822                	sd	s0,16(sp)
ffffffffc0204848:	e426                	sd	s1,8(sp)
ffffffffc020484a:	ec06                	sd	ra,24(sp)
ffffffffc020484c:	842e                	mv	s0,a1
ffffffffc020484e:	84aa                	mv	s1,a0
ffffffffc0204850:	c999                	beqz	a1,ffffffffc0204866 <do_wait+0x22>
ffffffffc0204852:	0003b797          	auipc	a5,0x3b
ffffffffc0204856:	6967b783          	ld	a5,1686(a5) # ffffffffc023fee8 <current>
ffffffffc020485a:	7788                	ld	a0,40(a5)
ffffffffc020485c:	4685                	li	a3,1
ffffffffc020485e:	4611                	li	a2,4
ffffffffc0204860:	b4cfd0ef          	jal	ra,ffffffffc0201bac <user_mem_check>
ffffffffc0204864:	c909                	beqz	a0,ffffffffc0204876 <do_wait+0x32>
ffffffffc0204866:	85a2                	mv	a1,s0
ffffffffc0204868:	6442                	ld	s0,16(sp)
ffffffffc020486a:	60e2                	ld	ra,24(sp)
ffffffffc020486c:	8526                	mv	a0,s1
ffffffffc020486e:	64a2                	ld	s1,8(sp)
ffffffffc0204870:	6105                	addi	sp,sp,32
ffffffffc0204872:	fa6ff06f          	j	ffffffffc0204018 <do_wait.part.0>
ffffffffc0204876:	60e2                	ld	ra,24(sp)
ffffffffc0204878:	6442                	ld	s0,16(sp)
ffffffffc020487a:	64a2                	ld	s1,8(sp)
ffffffffc020487c:	5575                	li	a0,-3
ffffffffc020487e:	6105                	addi	sp,sp,32
ffffffffc0204880:	8082                	ret

ffffffffc0204882 <do_kill>:
ffffffffc0204882:	1141                	addi	sp,sp,-16
ffffffffc0204884:	e406                	sd	ra,8(sp)
ffffffffc0204886:	e022                	sd	s0,0(sp)
ffffffffc0204888:	960ff0ef          	jal	ra,ffffffffc02039e8 <find_proc>
ffffffffc020488c:	cd0d                	beqz	a0,ffffffffc02048c6 <do_kill+0x44>
ffffffffc020488e:	0b052703          	lw	a4,176(a0)
ffffffffc0204892:	00177693          	andi	a3,a4,1
ffffffffc0204896:	e695                	bnez	a3,ffffffffc02048c2 <do_kill+0x40>
ffffffffc0204898:	0ec52683          	lw	a3,236(a0)
ffffffffc020489c:	00176713          	ori	a4,a4,1
ffffffffc02048a0:	0ae52823          	sw	a4,176(a0)
ffffffffc02048a4:	4401                	li	s0,0
ffffffffc02048a6:	0006c763          	bltz	a3,ffffffffc02048b4 <do_kill+0x32>
ffffffffc02048aa:	60a2                	ld	ra,8(sp)
ffffffffc02048ac:	8522                	mv	a0,s0
ffffffffc02048ae:	6402                	ld	s0,0(sp)
ffffffffc02048b0:	0141                	addi	sp,sp,16
ffffffffc02048b2:	8082                	ret
ffffffffc02048b4:	276000ef          	jal	ra,ffffffffc0204b2a <wakeup_proc>
ffffffffc02048b8:	60a2                	ld	ra,8(sp)
ffffffffc02048ba:	8522                	mv	a0,s0
ffffffffc02048bc:	6402                	ld	s0,0(sp)
ffffffffc02048be:	0141                	addi	sp,sp,16
ffffffffc02048c0:	8082                	ret
ffffffffc02048c2:	545d                	li	s0,-9
ffffffffc02048c4:	b7dd                	j	ffffffffc02048aa <do_kill+0x28>
ffffffffc02048c6:	5475                	li	s0,-3
ffffffffc02048c8:	b7cd                	j	ffffffffc02048aa <do_kill+0x28>

ffffffffc02048ca <proc_init>:
ffffffffc02048ca:	1101                	addi	sp,sp,-32
ffffffffc02048cc:	0003b797          	auipc	a5,0x3b
ffffffffc02048d0:	7c478793          	addi	a5,a5,1988 # ffffffffc0240090 <proc_list>
ffffffffc02048d4:	ec06                	sd	ra,24(sp)
ffffffffc02048d6:	e822                	sd	s0,16(sp)
ffffffffc02048d8:	e426                	sd	s1,8(sp)
ffffffffc02048da:	e04a                	sd	s2,0(sp)
ffffffffc02048dc:	e79c                	sd	a5,8(a5)
ffffffffc02048de:	e39c                	sd	a5,0(a5)
ffffffffc02048e0:	0003b717          	auipc	a4,0x3b
ffffffffc02048e4:	5a070713          	addi	a4,a4,1440 # ffffffffc023fe80 <__rq>
ffffffffc02048e8:	00037797          	auipc	a5,0x37
ffffffffc02048ec:	59878793          	addi	a5,a5,1432 # ffffffffc023be80 <hash_list>
ffffffffc02048f0:	e79c                	sd	a5,8(a5)
ffffffffc02048f2:	e39c                	sd	a5,0(a5)
ffffffffc02048f4:	07c1                	addi	a5,a5,16
ffffffffc02048f6:	fef71de3          	bne	a4,a5,ffffffffc02048f0 <proc_init+0x26>
ffffffffc02048fa:	f57fe0ef          	jal	ra,ffffffffc0203850 <alloc_proc>
ffffffffc02048fe:	0003b417          	auipc	s0,0x3b
ffffffffc0204902:	5f240413          	addi	s0,s0,1522 # ffffffffc023fef0 <idleproc>
ffffffffc0204906:	e008                	sd	a0,0(s0)
ffffffffc0204908:	c541                	beqz	a0,ffffffffc0204990 <proc_init+0xc6>
ffffffffc020490a:	4709                	li	a4,2
ffffffffc020490c:	e118                	sd	a4,0(a0)
ffffffffc020490e:	4485                	li	s1,1
ffffffffc0204910:	00006717          	auipc	a4,0x6
ffffffffc0204914:	6f070713          	addi	a4,a4,1776 # ffffffffc020b000 <bootstack>
ffffffffc0204918:	00005597          	auipc	a1,0x5
ffffffffc020491c:	20858593          	addi	a1,a1,520 # ffffffffc0209b20 <default_pmm_manager+0x6a0>
ffffffffc0204920:	e918                	sd	a4,16(a0)
ffffffffc0204922:	ed04                	sd	s1,24(a0)
ffffffffc0204924:	82eff0ef          	jal	ra,ffffffffc0203952 <set_proc_name>
ffffffffc0204928:	0003b717          	auipc	a4,0x3b
ffffffffc020492c:	5d870713          	addi	a4,a4,1496 # ffffffffc023ff00 <nr_process>
ffffffffc0204930:	431c                	lw	a5,0(a4)
ffffffffc0204932:	6014                	ld	a3,0(s0)
ffffffffc0204934:	4601                	li	a2,0
ffffffffc0204936:	2785                	addiw	a5,a5,1
ffffffffc0204938:	4581                	li	a1,0
ffffffffc020493a:	00000517          	auipc	a0,0x0
ffffffffc020493e:	87450513          	addi	a0,a0,-1932 # ffffffffc02041ae <init_main>
ffffffffc0204942:	c31c                	sw	a5,0(a4)
ffffffffc0204944:	0003b797          	auipc	a5,0x3b
ffffffffc0204948:	5ad7b223          	sd	a3,1444(a5) # ffffffffc023fee8 <current>
ffffffffc020494c:	cc6ff0ef          	jal	ra,ffffffffc0203e12 <kernel_thread>
ffffffffc0204950:	08a05c63          	blez	a0,ffffffffc02049e8 <proc_init+0x11e>
ffffffffc0204954:	894ff0ef          	jal	ra,ffffffffc02039e8 <find_proc>
ffffffffc0204958:	0003b917          	auipc	s2,0x3b
ffffffffc020495c:	5a090913          	addi	s2,s2,1440 # ffffffffc023fef8 <initproc>
ffffffffc0204960:	00005597          	auipc	a1,0x5
ffffffffc0204964:	1e858593          	addi	a1,a1,488 # ffffffffc0209b48 <default_pmm_manager+0x6c8>
ffffffffc0204968:	00a93023          	sd	a0,0(s2)
ffffffffc020496c:	fe7fe0ef          	jal	ra,ffffffffc0203952 <set_proc_name>
ffffffffc0204970:	601c                	ld	a5,0(s0)
ffffffffc0204972:	cbb9                	beqz	a5,ffffffffc02049c8 <proc_init+0xfe>
ffffffffc0204974:	43dc                	lw	a5,4(a5)
ffffffffc0204976:	eba9                	bnez	a5,ffffffffc02049c8 <proc_init+0xfe>
ffffffffc0204978:	00093783          	ld	a5,0(s2)
ffffffffc020497c:	c795                	beqz	a5,ffffffffc02049a8 <proc_init+0xde>
ffffffffc020497e:	43dc                	lw	a5,4(a5)
ffffffffc0204980:	02979463          	bne	a5,s1,ffffffffc02049a8 <proc_init+0xde>
ffffffffc0204984:	60e2                	ld	ra,24(sp)
ffffffffc0204986:	6442                	ld	s0,16(sp)
ffffffffc0204988:	64a2                	ld	s1,8(sp)
ffffffffc020498a:	6902                	ld	s2,0(sp)
ffffffffc020498c:	6105                	addi	sp,sp,32
ffffffffc020498e:	8082                	ret
ffffffffc0204990:	00005617          	auipc	a2,0x5
ffffffffc0204994:	17860613          	addi	a2,a2,376 # ffffffffc0209b08 <default_pmm_manager+0x688>
ffffffffc0204998:	37400593          	li	a1,884
ffffffffc020499c:	00005517          	auipc	a0,0x5
ffffffffc02049a0:	e6450513          	addi	a0,a0,-412 # ffffffffc0209800 <default_pmm_manager+0x380>
ffffffffc02049a4:	865fb0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc02049a8:	00005697          	auipc	a3,0x5
ffffffffc02049ac:	1d068693          	addi	a3,a3,464 # ffffffffc0209b78 <default_pmm_manager+0x6f8>
ffffffffc02049b0:	00004617          	auipc	a2,0x4
ffffffffc02049b4:	d9060613          	addi	a2,a2,-624 # ffffffffc0208740 <commands+0x410>
ffffffffc02049b8:	38900593          	li	a1,905
ffffffffc02049bc:	00005517          	auipc	a0,0x5
ffffffffc02049c0:	e4450513          	addi	a0,a0,-444 # ffffffffc0209800 <default_pmm_manager+0x380>
ffffffffc02049c4:	845fb0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc02049c8:	00005697          	auipc	a3,0x5
ffffffffc02049cc:	18868693          	addi	a3,a3,392 # ffffffffc0209b50 <default_pmm_manager+0x6d0>
ffffffffc02049d0:	00004617          	auipc	a2,0x4
ffffffffc02049d4:	d7060613          	addi	a2,a2,-656 # ffffffffc0208740 <commands+0x410>
ffffffffc02049d8:	38800593          	li	a1,904
ffffffffc02049dc:	00005517          	auipc	a0,0x5
ffffffffc02049e0:	e2450513          	addi	a0,a0,-476 # ffffffffc0209800 <default_pmm_manager+0x380>
ffffffffc02049e4:	825fb0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc02049e8:	00005617          	auipc	a2,0x5
ffffffffc02049ec:	14060613          	addi	a2,a2,320 # ffffffffc0209b28 <default_pmm_manager+0x6a8>
ffffffffc02049f0:	38200593          	li	a1,898
ffffffffc02049f4:	00005517          	auipc	a0,0x5
ffffffffc02049f8:	e0c50513          	addi	a0,a0,-500 # ffffffffc0209800 <default_pmm_manager+0x380>
ffffffffc02049fc:	80dfb0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0204a00 <cpu_idle>:
ffffffffc0204a00:	1141                	addi	sp,sp,-16
ffffffffc0204a02:	e022                	sd	s0,0(sp)
ffffffffc0204a04:	e406                	sd	ra,8(sp)
ffffffffc0204a06:	0003b417          	auipc	s0,0x3b
ffffffffc0204a0a:	4e240413          	addi	s0,s0,1250 # ffffffffc023fee8 <current>
ffffffffc0204a0e:	6018                	ld	a4,0(s0)
ffffffffc0204a10:	6f1c                	ld	a5,24(a4)
ffffffffc0204a12:	dffd                	beqz	a5,ffffffffc0204a10 <cpu_idle+0x10>
ffffffffc0204a14:	1c8000ef          	jal	ra,ffffffffc0204bdc <schedule>
ffffffffc0204a18:	bfdd                	j	ffffffffc0204a0e <cpu_idle+0xe>

ffffffffc0204a1a <lab6_set_priority>:
ffffffffc0204a1a:	1141                	addi	sp,sp,-16
ffffffffc0204a1c:	e022                	sd	s0,0(sp)
ffffffffc0204a1e:	85aa                	mv	a1,a0
ffffffffc0204a20:	842a                	mv	s0,a0
ffffffffc0204a22:	00005517          	auipc	a0,0x5
ffffffffc0204a26:	17e50513          	addi	a0,a0,382 # ffffffffc0209ba0 <default_pmm_manager+0x720>
ffffffffc0204a2a:	e406                	sd	ra,8(sp)
ffffffffc0204a2c:	ea0fb0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0204a30:	0003b797          	auipc	a5,0x3b
ffffffffc0204a34:	4b87b783          	ld	a5,1208(a5) # ffffffffc023fee8 <current>
ffffffffc0204a38:	e801                	bnez	s0,ffffffffc0204a48 <lab6_set_priority+0x2e>
ffffffffc0204a3a:	60a2                	ld	ra,8(sp)
ffffffffc0204a3c:	6402                	ld	s0,0(sp)
ffffffffc0204a3e:	4705                	li	a4,1
ffffffffc0204a40:	14e7a223          	sw	a4,324(a5)
ffffffffc0204a44:	0141                	addi	sp,sp,16
ffffffffc0204a46:	8082                	ret
ffffffffc0204a48:	60a2                	ld	ra,8(sp)
ffffffffc0204a4a:	1487a223          	sw	s0,324(a5)
ffffffffc0204a4e:	6402                	ld	s0,0(sp)
ffffffffc0204a50:	0141                	addi	sp,sp,16
ffffffffc0204a52:	8082                	ret

ffffffffc0204a54 <do_sleep>:
ffffffffc0204a54:	c539                	beqz	a0,ffffffffc0204aa2 <do_sleep+0x4e>
ffffffffc0204a56:	7179                	addi	sp,sp,-48
ffffffffc0204a58:	f022                	sd	s0,32(sp)
ffffffffc0204a5a:	f406                	sd	ra,40(sp)
ffffffffc0204a5c:	842a                	mv	s0,a0
ffffffffc0204a5e:	100027f3          	csrr	a5,sstatus
ffffffffc0204a62:	8b89                	andi	a5,a5,2
ffffffffc0204a64:	e3a9                	bnez	a5,ffffffffc0204aa6 <do_sleep+0x52>
ffffffffc0204a66:	0003b797          	auipc	a5,0x3b
ffffffffc0204a6a:	4827b783          	ld	a5,1154(a5) # ffffffffc023fee8 <current>
ffffffffc0204a6e:	0818                	addi	a4,sp,16
ffffffffc0204a70:	c02a                	sw	a0,0(sp)
ffffffffc0204a72:	ec3a                	sd	a4,24(sp)
ffffffffc0204a74:	e83a                	sd	a4,16(sp)
ffffffffc0204a76:	e43e                	sd	a5,8(sp)
ffffffffc0204a78:	4705                	li	a4,1
ffffffffc0204a7a:	c398                	sw	a4,0(a5)
ffffffffc0204a7c:	80000737          	lui	a4,0x80000
ffffffffc0204a80:	840a                	mv	s0,sp
ffffffffc0204a82:	2709                	addiw	a4,a4,2
ffffffffc0204a84:	0ee7a623          	sw	a4,236(a5)
ffffffffc0204a88:	8522                	mv	a0,s0
ffffffffc0204a8a:	218000ef          	jal	ra,ffffffffc0204ca2 <add_timer>
ffffffffc0204a8e:	14e000ef          	jal	ra,ffffffffc0204bdc <schedule>
ffffffffc0204a92:	8522                	mv	a0,s0
ffffffffc0204a94:	2d6000ef          	jal	ra,ffffffffc0204d6a <del_timer>
ffffffffc0204a98:	70a2                	ld	ra,40(sp)
ffffffffc0204a9a:	7402                	ld	s0,32(sp)
ffffffffc0204a9c:	4501                	li	a0,0
ffffffffc0204a9e:	6145                	addi	sp,sp,48
ffffffffc0204aa0:	8082                	ret
ffffffffc0204aa2:	4501                	li	a0,0
ffffffffc0204aa4:	8082                	ret
ffffffffc0204aa6:	b93fb0ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc0204aaa:	0003b797          	auipc	a5,0x3b
ffffffffc0204aae:	43e7b783          	ld	a5,1086(a5) # ffffffffc023fee8 <current>
ffffffffc0204ab2:	0818                	addi	a4,sp,16
ffffffffc0204ab4:	c022                	sw	s0,0(sp)
ffffffffc0204ab6:	e43e                	sd	a5,8(sp)
ffffffffc0204ab8:	ec3a                	sd	a4,24(sp)
ffffffffc0204aba:	e83a                	sd	a4,16(sp)
ffffffffc0204abc:	4705                	li	a4,1
ffffffffc0204abe:	c398                	sw	a4,0(a5)
ffffffffc0204ac0:	80000737          	lui	a4,0x80000
ffffffffc0204ac4:	2709                	addiw	a4,a4,2
ffffffffc0204ac6:	840a                	mv	s0,sp
ffffffffc0204ac8:	8522                	mv	a0,s0
ffffffffc0204aca:	0ee7a623          	sw	a4,236(a5)
ffffffffc0204ace:	1d4000ef          	jal	ra,ffffffffc0204ca2 <add_timer>
ffffffffc0204ad2:	b61fb0ef          	jal	ra,ffffffffc0200632 <intr_enable>
ffffffffc0204ad6:	bf65                	j	ffffffffc0204a8e <do_sleep+0x3a>

ffffffffc0204ad8 <sched_init>:
ffffffffc0204ad8:	1141                	addi	sp,sp,-16
ffffffffc0204ada:	00030717          	auipc	a4,0x30
ffffffffc0204ade:	f5e70713          	addi	a4,a4,-162 # ffffffffc0234a38 <default_sched_class>
ffffffffc0204ae2:	e022                	sd	s0,0(sp)
ffffffffc0204ae4:	e406                	sd	ra,8(sp)
ffffffffc0204ae6:	0003b797          	auipc	a5,0x3b
ffffffffc0204aea:	3ba78793          	addi	a5,a5,954 # ffffffffc023fea0 <timer_list>
ffffffffc0204aee:	6714                	ld	a3,8(a4)
ffffffffc0204af0:	0003b517          	auipc	a0,0x3b
ffffffffc0204af4:	39050513          	addi	a0,a0,912 # ffffffffc023fe80 <__rq>
ffffffffc0204af8:	e79c                	sd	a5,8(a5)
ffffffffc0204afa:	e39c                	sd	a5,0(a5)
ffffffffc0204afc:	4795                	li	a5,5
ffffffffc0204afe:	c95c                	sw	a5,20(a0)
ffffffffc0204b00:	0003b417          	auipc	s0,0x3b
ffffffffc0204b04:	41040413          	addi	s0,s0,1040 # ffffffffc023ff10 <sched_class>
ffffffffc0204b08:	0003b797          	auipc	a5,0x3b
ffffffffc0204b0c:	40a7b023          	sd	a0,1024(a5) # ffffffffc023ff08 <rq>
ffffffffc0204b10:	e018                	sd	a4,0(s0)
ffffffffc0204b12:	9682                	jalr	a3
ffffffffc0204b14:	601c                	ld	a5,0(s0)
ffffffffc0204b16:	6402                	ld	s0,0(sp)
ffffffffc0204b18:	60a2                	ld	ra,8(sp)
ffffffffc0204b1a:	638c                	ld	a1,0(a5)
ffffffffc0204b1c:	00005517          	auipc	a0,0x5
ffffffffc0204b20:	09c50513          	addi	a0,a0,156 # ffffffffc0209bb8 <default_pmm_manager+0x738>
ffffffffc0204b24:	0141                	addi	sp,sp,16
ffffffffc0204b26:	da6fb06f          	j	ffffffffc02000cc <cprintf>

ffffffffc0204b2a <wakeup_proc>:
ffffffffc0204b2a:	4118                	lw	a4,0(a0)
ffffffffc0204b2c:	1101                	addi	sp,sp,-32
ffffffffc0204b2e:	ec06                	sd	ra,24(sp)
ffffffffc0204b30:	e822                	sd	s0,16(sp)
ffffffffc0204b32:	e426                	sd	s1,8(sp)
ffffffffc0204b34:	478d                	li	a5,3
ffffffffc0204b36:	08f70363          	beq	a4,a5,ffffffffc0204bbc <wakeup_proc+0x92>
ffffffffc0204b3a:	842a                	mv	s0,a0
ffffffffc0204b3c:	100027f3          	csrr	a5,sstatus
ffffffffc0204b40:	8b89                	andi	a5,a5,2
ffffffffc0204b42:	4481                	li	s1,0
ffffffffc0204b44:	e7bd                	bnez	a5,ffffffffc0204bb2 <wakeup_proc+0x88>
ffffffffc0204b46:	4789                	li	a5,2
ffffffffc0204b48:	04f70863          	beq	a4,a5,ffffffffc0204b98 <wakeup_proc+0x6e>
ffffffffc0204b4c:	c01c                	sw	a5,0(s0)
ffffffffc0204b4e:	0e042623          	sw	zero,236(s0)
ffffffffc0204b52:	0003b797          	auipc	a5,0x3b
ffffffffc0204b56:	3967b783          	ld	a5,918(a5) # ffffffffc023fee8 <current>
ffffffffc0204b5a:	02878363          	beq	a5,s0,ffffffffc0204b80 <wakeup_proc+0x56>
ffffffffc0204b5e:	0003b797          	auipc	a5,0x3b
ffffffffc0204b62:	3927b783          	ld	a5,914(a5) # ffffffffc023fef0 <idleproc>
ffffffffc0204b66:	00f40d63          	beq	s0,a5,ffffffffc0204b80 <wakeup_proc+0x56>
ffffffffc0204b6a:	0003b797          	auipc	a5,0x3b
ffffffffc0204b6e:	3a67b783          	ld	a5,934(a5) # ffffffffc023ff10 <sched_class>
ffffffffc0204b72:	6b9c                	ld	a5,16(a5)
ffffffffc0204b74:	85a2                	mv	a1,s0
ffffffffc0204b76:	0003b517          	auipc	a0,0x3b
ffffffffc0204b7a:	39253503          	ld	a0,914(a0) # ffffffffc023ff08 <rq>
ffffffffc0204b7e:	9782                	jalr	a5
ffffffffc0204b80:	e491                	bnez	s1,ffffffffc0204b8c <wakeup_proc+0x62>
ffffffffc0204b82:	60e2                	ld	ra,24(sp)
ffffffffc0204b84:	6442                	ld	s0,16(sp)
ffffffffc0204b86:	64a2                	ld	s1,8(sp)
ffffffffc0204b88:	6105                	addi	sp,sp,32
ffffffffc0204b8a:	8082                	ret
ffffffffc0204b8c:	6442                	ld	s0,16(sp)
ffffffffc0204b8e:	60e2                	ld	ra,24(sp)
ffffffffc0204b90:	64a2                	ld	s1,8(sp)
ffffffffc0204b92:	6105                	addi	sp,sp,32
ffffffffc0204b94:	a9ffb06f          	j	ffffffffc0200632 <intr_enable>
ffffffffc0204b98:	00005617          	auipc	a2,0x5
ffffffffc0204b9c:	07060613          	addi	a2,a2,112 # ffffffffc0209c08 <default_pmm_manager+0x788>
ffffffffc0204ba0:	04800593          	li	a1,72
ffffffffc0204ba4:	00005517          	auipc	a0,0x5
ffffffffc0204ba8:	04c50513          	addi	a0,a0,76 # ffffffffc0209bf0 <default_pmm_manager+0x770>
ffffffffc0204bac:	ec4fb0ef          	jal	ra,ffffffffc0200270 <__warn>
ffffffffc0204bb0:	bfc1                	j	ffffffffc0204b80 <wakeup_proc+0x56>
ffffffffc0204bb2:	a87fb0ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc0204bb6:	4018                	lw	a4,0(s0)
ffffffffc0204bb8:	4485                	li	s1,1
ffffffffc0204bba:	b771                	j	ffffffffc0204b46 <wakeup_proc+0x1c>
ffffffffc0204bbc:	00005697          	auipc	a3,0x5
ffffffffc0204bc0:	01468693          	addi	a3,a3,20 # ffffffffc0209bd0 <default_pmm_manager+0x750>
ffffffffc0204bc4:	00004617          	auipc	a2,0x4
ffffffffc0204bc8:	b7c60613          	addi	a2,a2,-1156 # ffffffffc0208740 <commands+0x410>
ffffffffc0204bcc:	03c00593          	li	a1,60
ffffffffc0204bd0:	00005517          	auipc	a0,0x5
ffffffffc0204bd4:	02050513          	addi	a0,a0,32 # ffffffffc0209bf0 <default_pmm_manager+0x770>
ffffffffc0204bd8:	e30fb0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0204bdc <schedule>:
ffffffffc0204bdc:	7179                	addi	sp,sp,-48
ffffffffc0204bde:	f406                	sd	ra,40(sp)
ffffffffc0204be0:	f022                	sd	s0,32(sp)
ffffffffc0204be2:	ec26                	sd	s1,24(sp)
ffffffffc0204be4:	e84a                	sd	s2,16(sp)
ffffffffc0204be6:	e44e                	sd	s3,8(sp)
ffffffffc0204be8:	e052                	sd	s4,0(sp)
ffffffffc0204bea:	100027f3          	csrr	a5,sstatus
ffffffffc0204bee:	8b89                	andi	a5,a5,2
ffffffffc0204bf0:	4a01                	li	s4,0
ffffffffc0204bf2:	e7c5                	bnez	a5,ffffffffc0204c9a <schedule+0xbe>
ffffffffc0204bf4:	0003b497          	auipc	s1,0x3b
ffffffffc0204bf8:	2f448493          	addi	s1,s1,756 # ffffffffc023fee8 <current>
ffffffffc0204bfc:	608c                	ld	a1,0(s1)
ffffffffc0204bfe:	0003b997          	auipc	s3,0x3b
ffffffffc0204c02:	31298993          	addi	s3,s3,786 # ffffffffc023ff10 <sched_class>
ffffffffc0204c06:	0003b917          	auipc	s2,0x3b
ffffffffc0204c0a:	30290913          	addi	s2,s2,770 # ffffffffc023ff08 <rq>
ffffffffc0204c0e:	4194                	lw	a3,0(a1)
ffffffffc0204c10:	0005bc23          	sd	zero,24(a1)
ffffffffc0204c14:	4709                	li	a4,2
ffffffffc0204c16:	0009b783          	ld	a5,0(s3)
ffffffffc0204c1a:	00093503          	ld	a0,0(s2)
ffffffffc0204c1e:	04e68063          	beq	a3,a4,ffffffffc0204c5e <schedule+0x82>
ffffffffc0204c22:	739c                	ld	a5,32(a5)
ffffffffc0204c24:	9782                	jalr	a5
ffffffffc0204c26:	842a                	mv	s0,a0
ffffffffc0204c28:	c939                	beqz	a0,ffffffffc0204c7e <schedule+0xa2>
ffffffffc0204c2a:	0009b783          	ld	a5,0(s3)
ffffffffc0204c2e:	00093503          	ld	a0,0(s2)
ffffffffc0204c32:	85a2                	mv	a1,s0
ffffffffc0204c34:	6f9c                	ld	a5,24(a5)
ffffffffc0204c36:	9782                	jalr	a5
ffffffffc0204c38:	441c                	lw	a5,8(s0)
ffffffffc0204c3a:	6098                	ld	a4,0(s1)
ffffffffc0204c3c:	2785                	addiw	a5,a5,1
ffffffffc0204c3e:	c41c                	sw	a5,8(s0)
ffffffffc0204c40:	00870563          	beq	a4,s0,ffffffffc0204c4a <schedule+0x6e>
ffffffffc0204c44:	8522                	mv	a0,s0
ffffffffc0204c46:	d37fe0ef          	jal	ra,ffffffffc020397c <proc_run>
ffffffffc0204c4a:	020a1f63          	bnez	s4,ffffffffc0204c88 <schedule+0xac>
ffffffffc0204c4e:	70a2                	ld	ra,40(sp)
ffffffffc0204c50:	7402                	ld	s0,32(sp)
ffffffffc0204c52:	64e2                	ld	s1,24(sp)
ffffffffc0204c54:	6942                	ld	s2,16(sp)
ffffffffc0204c56:	69a2                	ld	s3,8(sp)
ffffffffc0204c58:	6a02                	ld	s4,0(sp)
ffffffffc0204c5a:	6145                	addi	sp,sp,48
ffffffffc0204c5c:	8082                	ret
ffffffffc0204c5e:	0003b717          	auipc	a4,0x3b
ffffffffc0204c62:	29273703          	ld	a4,658(a4) # ffffffffc023fef0 <idleproc>
ffffffffc0204c66:	fae58ee3          	beq	a1,a4,ffffffffc0204c22 <schedule+0x46>
ffffffffc0204c6a:	6b9c                	ld	a5,16(a5)
ffffffffc0204c6c:	9782                	jalr	a5
ffffffffc0204c6e:	0009b783          	ld	a5,0(s3)
ffffffffc0204c72:	00093503          	ld	a0,0(s2)
ffffffffc0204c76:	739c                	ld	a5,32(a5)
ffffffffc0204c78:	9782                	jalr	a5
ffffffffc0204c7a:	842a                	mv	s0,a0
ffffffffc0204c7c:	f55d                	bnez	a0,ffffffffc0204c2a <schedule+0x4e>
ffffffffc0204c7e:	0003b417          	auipc	s0,0x3b
ffffffffc0204c82:	27243403          	ld	s0,626(s0) # ffffffffc023fef0 <idleproc>
ffffffffc0204c86:	bf4d                	j	ffffffffc0204c38 <schedule+0x5c>
ffffffffc0204c88:	7402                	ld	s0,32(sp)
ffffffffc0204c8a:	70a2                	ld	ra,40(sp)
ffffffffc0204c8c:	64e2                	ld	s1,24(sp)
ffffffffc0204c8e:	6942                	ld	s2,16(sp)
ffffffffc0204c90:	69a2                	ld	s3,8(sp)
ffffffffc0204c92:	6a02                	ld	s4,0(sp)
ffffffffc0204c94:	6145                	addi	sp,sp,48
ffffffffc0204c96:	99dfb06f          	j	ffffffffc0200632 <intr_enable>
ffffffffc0204c9a:	99ffb0ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc0204c9e:	4a05                	li	s4,1
ffffffffc0204ca0:	bf91                	j	ffffffffc0204bf4 <schedule+0x18>

ffffffffc0204ca2 <add_timer>:
ffffffffc0204ca2:	1141                	addi	sp,sp,-16
ffffffffc0204ca4:	e022                	sd	s0,0(sp)
ffffffffc0204ca6:	e406                	sd	ra,8(sp)
ffffffffc0204ca8:	842a                	mv	s0,a0
ffffffffc0204caa:	100027f3          	csrr	a5,sstatus
ffffffffc0204cae:	8b89                	andi	a5,a5,2
ffffffffc0204cb0:	4501                	li	a0,0
ffffffffc0204cb2:	eba5                	bnez	a5,ffffffffc0204d22 <add_timer+0x80>
ffffffffc0204cb4:	401c                	lw	a5,0(s0)
ffffffffc0204cb6:	cbb5                	beqz	a5,ffffffffc0204d2a <add_timer+0x88>
ffffffffc0204cb8:	6418                	ld	a4,8(s0)
ffffffffc0204cba:	cb25                	beqz	a4,ffffffffc0204d2a <add_timer+0x88>
ffffffffc0204cbc:	6c18                	ld	a4,24(s0)
ffffffffc0204cbe:	01040593          	addi	a1,s0,16
ffffffffc0204cc2:	08e59463          	bne	a1,a4,ffffffffc0204d4a <add_timer+0xa8>
ffffffffc0204cc6:	0003b617          	auipc	a2,0x3b
ffffffffc0204cca:	1da60613          	addi	a2,a2,474 # ffffffffc023fea0 <timer_list>
ffffffffc0204cce:	6618                	ld	a4,8(a2)
ffffffffc0204cd0:	00c71863          	bne	a4,a2,ffffffffc0204ce0 <add_timer+0x3e>
ffffffffc0204cd4:	a80d                	j	ffffffffc0204d06 <add_timer+0x64>
ffffffffc0204cd6:	6718                	ld	a4,8(a4)
ffffffffc0204cd8:	9f95                	subw	a5,a5,a3
ffffffffc0204cda:	c01c                	sw	a5,0(s0)
ffffffffc0204cdc:	02c70563          	beq	a4,a2,ffffffffc0204d06 <add_timer+0x64>
ffffffffc0204ce0:	ff072683          	lw	a3,-16(a4)
ffffffffc0204ce4:	fed7f9e3          	bgeu	a5,a3,ffffffffc0204cd6 <add_timer+0x34>
ffffffffc0204ce8:	40f687bb          	subw	a5,a3,a5
ffffffffc0204cec:	fef72823          	sw	a5,-16(a4)
ffffffffc0204cf0:	631c                	ld	a5,0(a4)
ffffffffc0204cf2:	e30c                	sd	a1,0(a4)
ffffffffc0204cf4:	e78c                	sd	a1,8(a5)
ffffffffc0204cf6:	ec18                	sd	a4,24(s0)
ffffffffc0204cf8:	e81c                	sd	a5,16(s0)
ffffffffc0204cfa:	c105                	beqz	a0,ffffffffc0204d1a <add_timer+0x78>
ffffffffc0204cfc:	6402                	ld	s0,0(sp)
ffffffffc0204cfe:	60a2                	ld	ra,8(sp)
ffffffffc0204d00:	0141                	addi	sp,sp,16
ffffffffc0204d02:	931fb06f          	j	ffffffffc0200632 <intr_enable>
ffffffffc0204d06:	0003b717          	auipc	a4,0x3b
ffffffffc0204d0a:	19a70713          	addi	a4,a4,410 # ffffffffc023fea0 <timer_list>
ffffffffc0204d0e:	631c                	ld	a5,0(a4)
ffffffffc0204d10:	e30c                	sd	a1,0(a4)
ffffffffc0204d12:	e78c                	sd	a1,8(a5)
ffffffffc0204d14:	ec18                	sd	a4,24(s0)
ffffffffc0204d16:	e81c                	sd	a5,16(s0)
ffffffffc0204d18:	f175                	bnez	a0,ffffffffc0204cfc <add_timer+0x5a>
ffffffffc0204d1a:	60a2                	ld	ra,8(sp)
ffffffffc0204d1c:	6402                	ld	s0,0(sp)
ffffffffc0204d1e:	0141                	addi	sp,sp,16
ffffffffc0204d20:	8082                	ret
ffffffffc0204d22:	917fb0ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc0204d26:	4505                	li	a0,1
ffffffffc0204d28:	b771                	j	ffffffffc0204cb4 <add_timer+0x12>
ffffffffc0204d2a:	00005697          	auipc	a3,0x5
ffffffffc0204d2e:	efe68693          	addi	a3,a3,-258 # ffffffffc0209c28 <default_pmm_manager+0x7a8>
ffffffffc0204d32:	00004617          	auipc	a2,0x4
ffffffffc0204d36:	a0e60613          	addi	a2,a2,-1522 # ffffffffc0208740 <commands+0x410>
ffffffffc0204d3a:	06c00593          	li	a1,108
ffffffffc0204d3e:	00005517          	auipc	a0,0x5
ffffffffc0204d42:	eb250513          	addi	a0,a0,-334 # ffffffffc0209bf0 <default_pmm_manager+0x770>
ffffffffc0204d46:	cc2fb0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0204d4a:	00005697          	auipc	a3,0x5
ffffffffc0204d4e:	f0e68693          	addi	a3,a3,-242 # ffffffffc0209c58 <default_pmm_manager+0x7d8>
ffffffffc0204d52:	00004617          	auipc	a2,0x4
ffffffffc0204d56:	9ee60613          	addi	a2,a2,-1554 # ffffffffc0208740 <commands+0x410>
ffffffffc0204d5a:	06d00593          	li	a1,109
ffffffffc0204d5e:	00005517          	auipc	a0,0x5
ffffffffc0204d62:	e9250513          	addi	a0,a0,-366 # ffffffffc0209bf0 <default_pmm_manager+0x770>
ffffffffc0204d66:	ca2fb0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0204d6a <del_timer>:
ffffffffc0204d6a:	1101                	addi	sp,sp,-32
ffffffffc0204d6c:	e822                	sd	s0,16(sp)
ffffffffc0204d6e:	ec06                	sd	ra,24(sp)
ffffffffc0204d70:	e426                	sd	s1,8(sp)
ffffffffc0204d72:	842a                	mv	s0,a0
ffffffffc0204d74:	100027f3          	csrr	a5,sstatus
ffffffffc0204d78:	8b89                	andi	a5,a5,2
ffffffffc0204d7a:	01050493          	addi	s1,a0,16
ffffffffc0204d7e:	eb9d                	bnez	a5,ffffffffc0204db4 <del_timer+0x4a>
ffffffffc0204d80:	6d1c                	ld	a5,24(a0)
ffffffffc0204d82:	02978463          	beq	a5,s1,ffffffffc0204daa <del_timer+0x40>
ffffffffc0204d86:	4114                	lw	a3,0(a0)
ffffffffc0204d88:	6918                	ld	a4,16(a0)
ffffffffc0204d8a:	ce81                	beqz	a3,ffffffffc0204da2 <del_timer+0x38>
ffffffffc0204d8c:	0003b617          	auipc	a2,0x3b
ffffffffc0204d90:	11460613          	addi	a2,a2,276 # ffffffffc023fea0 <timer_list>
ffffffffc0204d94:	00c78763          	beq	a5,a2,ffffffffc0204da2 <del_timer+0x38>
ffffffffc0204d98:	ff07a603          	lw	a2,-16(a5)
ffffffffc0204d9c:	9eb1                	addw	a3,a3,a2
ffffffffc0204d9e:	fed7a823          	sw	a3,-16(a5)
ffffffffc0204da2:	e71c                	sd	a5,8(a4)
ffffffffc0204da4:	e398                	sd	a4,0(a5)
ffffffffc0204da6:	ec04                	sd	s1,24(s0)
ffffffffc0204da8:	e804                	sd	s1,16(s0)
ffffffffc0204daa:	60e2                	ld	ra,24(sp)
ffffffffc0204dac:	6442                	ld	s0,16(sp)
ffffffffc0204dae:	64a2                	ld	s1,8(sp)
ffffffffc0204db0:	6105                	addi	sp,sp,32
ffffffffc0204db2:	8082                	ret
ffffffffc0204db4:	885fb0ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc0204db8:	6c1c                	ld	a5,24(s0)
ffffffffc0204dba:	02978463          	beq	a5,s1,ffffffffc0204de2 <del_timer+0x78>
ffffffffc0204dbe:	4014                	lw	a3,0(s0)
ffffffffc0204dc0:	6818                	ld	a4,16(s0)
ffffffffc0204dc2:	ce81                	beqz	a3,ffffffffc0204dda <del_timer+0x70>
ffffffffc0204dc4:	0003b617          	auipc	a2,0x3b
ffffffffc0204dc8:	0dc60613          	addi	a2,a2,220 # ffffffffc023fea0 <timer_list>
ffffffffc0204dcc:	00c78763          	beq	a5,a2,ffffffffc0204dda <del_timer+0x70>
ffffffffc0204dd0:	ff07a603          	lw	a2,-16(a5)
ffffffffc0204dd4:	9eb1                	addw	a3,a3,a2
ffffffffc0204dd6:	fed7a823          	sw	a3,-16(a5)
ffffffffc0204dda:	e71c                	sd	a5,8(a4)
ffffffffc0204ddc:	e398                	sd	a4,0(a5)
ffffffffc0204dde:	ec04                	sd	s1,24(s0)
ffffffffc0204de0:	e804                	sd	s1,16(s0)
ffffffffc0204de2:	6442                	ld	s0,16(sp)
ffffffffc0204de4:	60e2                	ld	ra,24(sp)
ffffffffc0204de6:	64a2                	ld	s1,8(sp)
ffffffffc0204de8:	6105                	addi	sp,sp,32
ffffffffc0204dea:	849fb06f          	j	ffffffffc0200632 <intr_enable>

ffffffffc0204dee <run_timer_list>:
ffffffffc0204dee:	7139                	addi	sp,sp,-64
ffffffffc0204df0:	fc06                	sd	ra,56(sp)
ffffffffc0204df2:	f822                	sd	s0,48(sp)
ffffffffc0204df4:	f426                	sd	s1,40(sp)
ffffffffc0204df6:	f04a                	sd	s2,32(sp)
ffffffffc0204df8:	ec4e                	sd	s3,24(sp)
ffffffffc0204dfa:	e852                	sd	s4,16(sp)
ffffffffc0204dfc:	e456                	sd	s5,8(sp)
ffffffffc0204dfe:	e05a                	sd	s6,0(sp)
ffffffffc0204e00:	100027f3          	csrr	a5,sstatus
ffffffffc0204e04:	8b89                	andi	a5,a5,2
ffffffffc0204e06:	4b01                	li	s6,0
ffffffffc0204e08:	eff9                	bnez	a5,ffffffffc0204ee6 <run_timer_list+0xf8>
ffffffffc0204e0a:	0003b997          	auipc	s3,0x3b
ffffffffc0204e0e:	09698993          	addi	s3,s3,150 # ffffffffc023fea0 <timer_list>
ffffffffc0204e12:	0089b403          	ld	s0,8(s3)
ffffffffc0204e16:	07340a63          	beq	s0,s3,ffffffffc0204e8a <run_timer_list+0x9c>
ffffffffc0204e1a:	ff042783          	lw	a5,-16(s0)
ffffffffc0204e1e:	ff040913          	addi	s2,s0,-16
ffffffffc0204e22:	0e078663          	beqz	a5,ffffffffc0204f0e <run_timer_list+0x120>
ffffffffc0204e26:	fff7871b          	addiw	a4,a5,-1
ffffffffc0204e2a:	fee42823          	sw	a4,-16(s0)
ffffffffc0204e2e:	ef31                	bnez	a4,ffffffffc0204e8a <run_timer_list+0x9c>
ffffffffc0204e30:	00005a97          	auipc	s5,0x5
ffffffffc0204e34:	e90a8a93          	addi	s5,s5,-368 # ffffffffc0209cc0 <default_pmm_manager+0x840>
ffffffffc0204e38:	00005a17          	auipc	s4,0x5
ffffffffc0204e3c:	db8a0a13          	addi	s4,s4,-584 # ffffffffc0209bf0 <default_pmm_manager+0x770>
ffffffffc0204e40:	a005                	j	ffffffffc0204e60 <run_timer_list+0x72>
ffffffffc0204e42:	0a07d663          	bgez	a5,ffffffffc0204eee <run_timer_list+0x100>
ffffffffc0204e46:	8526                	mv	a0,s1
ffffffffc0204e48:	ce3ff0ef          	jal	ra,ffffffffc0204b2a <wakeup_proc>
ffffffffc0204e4c:	854a                	mv	a0,s2
ffffffffc0204e4e:	f1dff0ef          	jal	ra,ffffffffc0204d6a <del_timer>
ffffffffc0204e52:	03340c63          	beq	s0,s3,ffffffffc0204e8a <run_timer_list+0x9c>
ffffffffc0204e56:	ff042783          	lw	a5,-16(s0)
ffffffffc0204e5a:	ff040913          	addi	s2,s0,-16
ffffffffc0204e5e:	e795                	bnez	a5,ffffffffc0204e8a <run_timer_list+0x9c>
ffffffffc0204e60:	00893483          	ld	s1,8(s2)
ffffffffc0204e64:	6400                	ld	s0,8(s0)
ffffffffc0204e66:	0ec4a783          	lw	a5,236(s1)
ffffffffc0204e6a:	ffe1                	bnez	a5,ffffffffc0204e42 <run_timer_list+0x54>
ffffffffc0204e6c:	40d4                	lw	a3,4(s1)
ffffffffc0204e6e:	8656                	mv	a2,s5
ffffffffc0204e70:	0a300593          	li	a1,163
ffffffffc0204e74:	8552                	mv	a0,s4
ffffffffc0204e76:	bfafb0ef          	jal	ra,ffffffffc0200270 <__warn>
ffffffffc0204e7a:	8526                	mv	a0,s1
ffffffffc0204e7c:	cafff0ef          	jal	ra,ffffffffc0204b2a <wakeup_proc>
ffffffffc0204e80:	854a                	mv	a0,s2
ffffffffc0204e82:	ee9ff0ef          	jal	ra,ffffffffc0204d6a <del_timer>
ffffffffc0204e86:	fd3418e3          	bne	s0,s3,ffffffffc0204e56 <run_timer_list+0x68>
ffffffffc0204e8a:	0003b597          	auipc	a1,0x3b
ffffffffc0204e8e:	05e5b583          	ld	a1,94(a1) # ffffffffc023fee8 <current>
ffffffffc0204e92:	0003b797          	auipc	a5,0x3b
ffffffffc0204e96:	05e7b783          	ld	a5,94(a5) # ffffffffc023fef0 <idleproc>
ffffffffc0204e9a:	04f58363          	beq	a1,a5,ffffffffc0204ee0 <run_timer_list+0xf2>
ffffffffc0204e9e:	0003b797          	auipc	a5,0x3b
ffffffffc0204ea2:	0727b783          	ld	a5,114(a5) # ffffffffc023ff10 <sched_class>
ffffffffc0204ea6:	779c                	ld	a5,40(a5)
ffffffffc0204ea8:	0003b517          	auipc	a0,0x3b
ffffffffc0204eac:	06053503          	ld	a0,96(a0) # ffffffffc023ff08 <rq>
ffffffffc0204eb0:	9782                	jalr	a5
ffffffffc0204eb2:	000b1c63          	bnez	s6,ffffffffc0204eca <run_timer_list+0xdc>
ffffffffc0204eb6:	70e2                	ld	ra,56(sp)
ffffffffc0204eb8:	7442                	ld	s0,48(sp)
ffffffffc0204eba:	74a2                	ld	s1,40(sp)
ffffffffc0204ebc:	7902                	ld	s2,32(sp)
ffffffffc0204ebe:	69e2                	ld	s3,24(sp)
ffffffffc0204ec0:	6a42                	ld	s4,16(sp)
ffffffffc0204ec2:	6aa2                	ld	s5,8(sp)
ffffffffc0204ec4:	6b02                	ld	s6,0(sp)
ffffffffc0204ec6:	6121                	addi	sp,sp,64
ffffffffc0204ec8:	8082                	ret
ffffffffc0204eca:	7442                	ld	s0,48(sp)
ffffffffc0204ecc:	70e2                	ld	ra,56(sp)
ffffffffc0204ece:	74a2                	ld	s1,40(sp)
ffffffffc0204ed0:	7902                	ld	s2,32(sp)
ffffffffc0204ed2:	69e2                	ld	s3,24(sp)
ffffffffc0204ed4:	6a42                	ld	s4,16(sp)
ffffffffc0204ed6:	6aa2                	ld	s5,8(sp)
ffffffffc0204ed8:	6b02                	ld	s6,0(sp)
ffffffffc0204eda:	6121                	addi	sp,sp,64
ffffffffc0204edc:	f56fb06f          	j	ffffffffc0200632 <intr_enable>
ffffffffc0204ee0:	4785                	li	a5,1
ffffffffc0204ee2:	ed9c                	sd	a5,24(a1)
ffffffffc0204ee4:	b7f9                	j	ffffffffc0204eb2 <run_timer_list+0xc4>
ffffffffc0204ee6:	f52fb0ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc0204eea:	4b05                	li	s6,1
ffffffffc0204eec:	bf39                	j	ffffffffc0204e0a <run_timer_list+0x1c>
ffffffffc0204eee:	00005697          	auipc	a3,0x5
ffffffffc0204ef2:	daa68693          	addi	a3,a3,-598 # ffffffffc0209c98 <default_pmm_manager+0x818>
ffffffffc0204ef6:	00004617          	auipc	a2,0x4
ffffffffc0204efa:	84a60613          	addi	a2,a2,-1974 # ffffffffc0208740 <commands+0x410>
ffffffffc0204efe:	0a000593          	li	a1,160
ffffffffc0204f02:	00005517          	auipc	a0,0x5
ffffffffc0204f06:	cee50513          	addi	a0,a0,-786 # ffffffffc0209bf0 <default_pmm_manager+0x770>
ffffffffc0204f0a:	afefb0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0204f0e:	00005697          	auipc	a3,0x5
ffffffffc0204f12:	d7268693          	addi	a3,a3,-654 # ffffffffc0209c80 <default_pmm_manager+0x800>
ffffffffc0204f16:	00004617          	auipc	a2,0x4
ffffffffc0204f1a:	82a60613          	addi	a2,a2,-2006 # ffffffffc0208740 <commands+0x410>
ffffffffc0204f1e:	09a00593          	li	a1,154
ffffffffc0204f22:	00005517          	auipc	a0,0x5
ffffffffc0204f26:	cce50513          	addi	a0,a0,-818 # ffffffffc0209bf0 <default_pmm_manager+0x770>
ffffffffc0204f2a:	adefb0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0204f2e <proc_stride_comp_f>:
ffffffffc0204f2e:	4d08                	lw	a0,24(a0)
ffffffffc0204f30:	4d9c                	lw	a5,24(a1)
ffffffffc0204f32:	9d1d                	subw	a0,a0,a5
ffffffffc0204f34:	00a04763          	bgtz	a0,ffffffffc0204f42 <proc_stride_comp_f+0x14>
ffffffffc0204f38:	00a03533          	snez	a0,a0
ffffffffc0204f3c:	40a00533          	neg	a0,a0
ffffffffc0204f40:	8082                	ret
ffffffffc0204f42:	4505                	li	a0,1
ffffffffc0204f44:	8082                	ret

ffffffffc0204f46 <stride_init>:
ffffffffc0204f46:	e508                	sd	a0,8(a0)
ffffffffc0204f48:	e108                	sd	a0,0(a0)
ffffffffc0204f4a:	00053c23          	sd	zero,24(a0)
ffffffffc0204f4e:	00052823          	sw	zero,16(a0)
ffffffffc0204f52:	8082                	ret

ffffffffc0204f54 <stride_pick_next>:
ffffffffc0204f54:	6d1c                	ld	a5,24(a0)
ffffffffc0204f56:	cf89                	beqz	a5,ffffffffc0204f70 <stride_pick_next+0x1c>
ffffffffc0204f58:	4fd0                	lw	a2,28(a5)
ffffffffc0204f5a:	4f98                	lw	a4,24(a5)
ffffffffc0204f5c:	ed878513          	addi	a0,a5,-296
ffffffffc0204f60:	400006b7          	lui	a3,0x40000
ffffffffc0204f64:	c219                	beqz	a2,ffffffffc0204f6a <stride_pick_next+0x16>
ffffffffc0204f66:	02c6d6bb          	divuw	a3,a3,a2
ffffffffc0204f6a:	9f35                	addw	a4,a4,a3
ffffffffc0204f6c:	cf98                	sw	a4,24(a5)
ffffffffc0204f6e:	8082                	ret
ffffffffc0204f70:	4501                	li	a0,0
ffffffffc0204f72:	8082                	ret

ffffffffc0204f74 <stride_proc_tick>:
ffffffffc0204f74:	1205a783          	lw	a5,288(a1)
ffffffffc0204f78:	00f05563          	blez	a5,ffffffffc0204f82 <stride_proc_tick+0xe>
ffffffffc0204f7c:	37fd                	addiw	a5,a5,-1
ffffffffc0204f7e:	12f5a023          	sw	a5,288(a1)
ffffffffc0204f82:	e399                	bnez	a5,ffffffffc0204f88 <stride_proc_tick+0x14>
ffffffffc0204f84:	4785                	li	a5,1
ffffffffc0204f86:	ed9c                	sd	a5,24(a1)
ffffffffc0204f88:	8082                	ret

ffffffffc0204f8a <skew_heap_merge.constprop.0>:
ffffffffc0204f8a:	1101                	addi	sp,sp,-32
ffffffffc0204f8c:	e822                	sd	s0,16(sp)
ffffffffc0204f8e:	ec06                	sd	ra,24(sp)
ffffffffc0204f90:	e426                	sd	s1,8(sp)
ffffffffc0204f92:	e04a                	sd	s2,0(sp)
ffffffffc0204f94:	842e                	mv	s0,a1
ffffffffc0204f96:	c11d                	beqz	a0,ffffffffc0204fbc <skew_heap_merge.constprop.0+0x32>
ffffffffc0204f98:	84aa                	mv	s1,a0
ffffffffc0204f9a:	c1b9                	beqz	a1,ffffffffc0204fe0 <skew_heap_merge.constprop.0+0x56>
ffffffffc0204f9c:	f93ff0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc0204fa0:	57fd                	li	a5,-1
ffffffffc0204fa2:	02f50463          	beq	a0,a5,ffffffffc0204fca <skew_heap_merge.constprop.0+0x40>
ffffffffc0204fa6:	680c                	ld	a1,16(s0)
ffffffffc0204fa8:	00843903          	ld	s2,8(s0)
ffffffffc0204fac:	8526                	mv	a0,s1
ffffffffc0204fae:	fddff0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc0204fb2:	e408                	sd	a0,8(s0)
ffffffffc0204fb4:	01243823          	sd	s2,16(s0)
ffffffffc0204fb8:	c111                	beqz	a0,ffffffffc0204fbc <skew_heap_merge.constprop.0+0x32>
ffffffffc0204fba:	e100                	sd	s0,0(a0)
ffffffffc0204fbc:	60e2                	ld	ra,24(sp)
ffffffffc0204fbe:	8522                	mv	a0,s0
ffffffffc0204fc0:	6442                	ld	s0,16(sp)
ffffffffc0204fc2:	64a2                	ld	s1,8(sp)
ffffffffc0204fc4:	6902                	ld	s2,0(sp)
ffffffffc0204fc6:	6105                	addi	sp,sp,32
ffffffffc0204fc8:	8082                	ret
ffffffffc0204fca:	6888                	ld	a0,16(s1)
ffffffffc0204fcc:	0084b903          	ld	s2,8(s1)
ffffffffc0204fd0:	85a2                	mv	a1,s0
ffffffffc0204fd2:	fb9ff0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc0204fd6:	e488                	sd	a0,8(s1)
ffffffffc0204fd8:	0124b823          	sd	s2,16(s1)
ffffffffc0204fdc:	c111                	beqz	a0,ffffffffc0204fe0 <skew_heap_merge.constprop.0+0x56>
ffffffffc0204fde:	e104                	sd	s1,0(a0)
ffffffffc0204fe0:	60e2                	ld	ra,24(sp)
ffffffffc0204fe2:	6442                	ld	s0,16(sp)
ffffffffc0204fe4:	6902                	ld	s2,0(sp)
ffffffffc0204fe6:	8526                	mv	a0,s1
ffffffffc0204fe8:	64a2                	ld	s1,8(sp)
ffffffffc0204fea:	6105                	addi	sp,sp,32
ffffffffc0204fec:	8082                	ret

ffffffffc0204fee <stride_enqueue>:
ffffffffc0204fee:	7119                	addi	sp,sp,-128
ffffffffc0204ff0:	f4a6                	sd	s1,104(sp)
ffffffffc0204ff2:	6d04                	ld	s1,24(a0)
ffffffffc0204ff4:	f8a2                	sd	s0,112(sp)
ffffffffc0204ff6:	f0ca                	sd	s2,96(sp)
ffffffffc0204ff8:	e8d2                	sd	s4,80(sp)
ffffffffc0204ffa:	fc86                	sd	ra,120(sp)
ffffffffc0204ffc:	ecce                	sd	s3,88(sp)
ffffffffc0204ffe:	e4d6                	sd	s5,72(sp)
ffffffffc0205000:	e0da                	sd	s6,64(sp)
ffffffffc0205002:	fc5e                	sd	s7,56(sp)
ffffffffc0205004:	f862                	sd	s8,48(sp)
ffffffffc0205006:	f466                	sd	s9,40(sp)
ffffffffc0205008:	f06a                	sd	s10,32(sp)
ffffffffc020500a:	ec6e                	sd	s11,24(sp)
ffffffffc020500c:	1205b423          	sd	zero,296(a1)
ffffffffc0205010:	1205bc23          	sd	zero,312(a1)
ffffffffc0205014:	1205b823          	sd	zero,304(a1)
ffffffffc0205018:	8a2a                	mv	s4,a0
ffffffffc020501a:	842e                	mv	s0,a1
ffffffffc020501c:	12858913          	addi	s2,a1,296
ffffffffc0205020:	cc89                	beqz	s1,ffffffffc020503a <stride_enqueue+0x4c>
ffffffffc0205022:	85ca                	mv	a1,s2
ffffffffc0205024:	8526                	mv	a0,s1
ffffffffc0205026:	f09ff0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc020502a:	57fd                	li	a5,-1
ffffffffc020502c:	89aa                	mv	s3,a0
ffffffffc020502e:	04f50763          	beq	a0,a5,ffffffffc020507c <stride_enqueue+0x8e>
ffffffffc0205032:	12943823          	sd	s1,304(s0)
ffffffffc0205036:	0124b023          	sd	s2,0(s1)
ffffffffc020503a:	12042783          	lw	a5,288(s0)
ffffffffc020503e:	012a3c23          	sd	s2,24(s4)
ffffffffc0205042:	014a2703          	lw	a4,20(s4)
ffffffffc0205046:	c399                	beqz	a5,ffffffffc020504c <stride_enqueue+0x5e>
ffffffffc0205048:	00f75463          	bge	a4,a5,ffffffffc0205050 <stride_enqueue+0x62>
ffffffffc020504c:	12e42023          	sw	a4,288(s0)
ffffffffc0205050:	010a2783          	lw	a5,16(s4)
ffffffffc0205054:	70e6                	ld	ra,120(sp)
ffffffffc0205056:	11443423          	sd	s4,264(s0)
ffffffffc020505a:	7446                	ld	s0,112(sp)
ffffffffc020505c:	2785                	addiw	a5,a5,1
ffffffffc020505e:	00fa2823          	sw	a5,16(s4)
ffffffffc0205062:	74a6                	ld	s1,104(sp)
ffffffffc0205064:	7906                	ld	s2,96(sp)
ffffffffc0205066:	69e6                	ld	s3,88(sp)
ffffffffc0205068:	6a46                	ld	s4,80(sp)
ffffffffc020506a:	6aa6                	ld	s5,72(sp)
ffffffffc020506c:	6b06                	ld	s6,64(sp)
ffffffffc020506e:	7be2                	ld	s7,56(sp)
ffffffffc0205070:	7c42                	ld	s8,48(sp)
ffffffffc0205072:	7ca2                	ld	s9,40(sp)
ffffffffc0205074:	7d02                	ld	s10,32(sp)
ffffffffc0205076:	6de2                	ld	s11,24(sp)
ffffffffc0205078:	6109                	addi	sp,sp,128
ffffffffc020507a:	8082                	ret
ffffffffc020507c:	0104ba83          	ld	s5,16(s1)
ffffffffc0205080:	0084bb83          	ld	s7,8(s1)
ffffffffc0205084:	000a8d63          	beqz	s5,ffffffffc020509e <stride_enqueue+0xb0>
ffffffffc0205088:	85ca                	mv	a1,s2
ffffffffc020508a:	8556                	mv	a0,s5
ffffffffc020508c:	ea3ff0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc0205090:	8b2a                	mv	s6,a0
ffffffffc0205092:	01350e63          	beq	a0,s3,ffffffffc02050ae <stride_enqueue+0xc0>
ffffffffc0205096:	13543823          	sd	s5,304(s0)
ffffffffc020509a:	012ab023          	sd	s2,0(s5)
ffffffffc020509e:	0124b423          	sd	s2,8(s1)
ffffffffc02050a2:	0174b823          	sd	s7,16(s1)
ffffffffc02050a6:	00993023          	sd	s1,0(s2)
ffffffffc02050aa:	8926                	mv	s2,s1
ffffffffc02050ac:	b779                	j	ffffffffc020503a <stride_enqueue+0x4c>
ffffffffc02050ae:	010ab983          	ld	s3,16(s5)
ffffffffc02050b2:	008abc83          	ld	s9,8(s5)
ffffffffc02050b6:	00098d63          	beqz	s3,ffffffffc02050d0 <stride_enqueue+0xe2>
ffffffffc02050ba:	85ca                	mv	a1,s2
ffffffffc02050bc:	854e                	mv	a0,s3
ffffffffc02050be:	e71ff0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc02050c2:	8c2a                	mv	s8,a0
ffffffffc02050c4:	01650e63          	beq	a0,s6,ffffffffc02050e0 <stride_enqueue+0xf2>
ffffffffc02050c8:	13343823          	sd	s3,304(s0)
ffffffffc02050cc:	0129b023          	sd	s2,0(s3)
ffffffffc02050d0:	012ab423          	sd	s2,8(s5)
ffffffffc02050d4:	019ab823          	sd	s9,16(s5)
ffffffffc02050d8:	01593023          	sd	s5,0(s2)
ffffffffc02050dc:	8956                	mv	s2,s5
ffffffffc02050de:	b7c1                	j	ffffffffc020509e <stride_enqueue+0xb0>
ffffffffc02050e0:	0109bb03          	ld	s6,16(s3)
ffffffffc02050e4:	0089bd83          	ld	s11,8(s3)
ffffffffc02050e8:	000b0d63          	beqz	s6,ffffffffc0205102 <stride_enqueue+0x114>
ffffffffc02050ec:	85ca                	mv	a1,s2
ffffffffc02050ee:	855a                	mv	a0,s6
ffffffffc02050f0:	e3fff0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc02050f4:	8d2a                	mv	s10,a0
ffffffffc02050f6:	01850e63          	beq	a0,s8,ffffffffc0205112 <stride_enqueue+0x124>
ffffffffc02050fa:	13643823          	sd	s6,304(s0)
ffffffffc02050fe:	012b3023          	sd	s2,0(s6)
ffffffffc0205102:	0129b423          	sd	s2,8(s3)
ffffffffc0205106:	01b9b823          	sd	s11,16(s3)
ffffffffc020510a:	01393023          	sd	s3,0(s2)
ffffffffc020510e:	894e                	mv	s2,s3
ffffffffc0205110:	b7c1                	j	ffffffffc02050d0 <stride_enqueue+0xe2>
ffffffffc0205112:	008b3783          	ld	a5,8(s6)
ffffffffc0205116:	010b3c03          	ld	s8,16(s6)
ffffffffc020511a:	e43e                	sd	a5,8(sp)
ffffffffc020511c:	000c0c63          	beqz	s8,ffffffffc0205134 <stride_enqueue+0x146>
ffffffffc0205120:	85ca                	mv	a1,s2
ffffffffc0205122:	8562                	mv	a0,s8
ffffffffc0205124:	e0bff0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc0205128:	01a50f63          	beq	a0,s10,ffffffffc0205146 <stride_enqueue+0x158>
ffffffffc020512c:	13843823          	sd	s8,304(s0)
ffffffffc0205130:	012c3023          	sd	s2,0(s8)
ffffffffc0205134:	67a2                	ld	a5,8(sp)
ffffffffc0205136:	012b3423          	sd	s2,8(s6)
ffffffffc020513a:	00fb3823          	sd	a5,16(s6)
ffffffffc020513e:	01693023          	sd	s6,0(s2)
ffffffffc0205142:	895a                	mv	s2,s6
ffffffffc0205144:	bf7d                	j	ffffffffc0205102 <stride_enqueue+0x114>
ffffffffc0205146:	010c3503          	ld	a0,16(s8)
ffffffffc020514a:	008c3d03          	ld	s10,8(s8)
ffffffffc020514e:	85ca                	mv	a1,s2
ffffffffc0205150:	e3bff0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc0205154:	00ac3423          	sd	a0,8(s8)
ffffffffc0205158:	01ac3823          	sd	s10,16(s8)
ffffffffc020515c:	c509                	beqz	a0,ffffffffc0205166 <stride_enqueue+0x178>
ffffffffc020515e:	01853023          	sd	s8,0(a0)
ffffffffc0205162:	8962                	mv	s2,s8
ffffffffc0205164:	bfc1                	j	ffffffffc0205134 <stride_enqueue+0x146>
ffffffffc0205166:	8962                	mv	s2,s8
ffffffffc0205168:	b7f1                	j	ffffffffc0205134 <stride_enqueue+0x146>

ffffffffc020516a <stride_dequeue>:
ffffffffc020516a:	1085b783          	ld	a5,264(a1)
ffffffffc020516e:	7171                	addi	sp,sp,-176
ffffffffc0205170:	f506                	sd	ra,168(sp)
ffffffffc0205172:	f122                	sd	s0,160(sp)
ffffffffc0205174:	ed26                	sd	s1,152(sp)
ffffffffc0205176:	e94a                	sd	s2,144(sp)
ffffffffc0205178:	e54e                	sd	s3,136(sp)
ffffffffc020517a:	e152                	sd	s4,128(sp)
ffffffffc020517c:	fcd6                	sd	s5,120(sp)
ffffffffc020517e:	f8da                	sd	s6,112(sp)
ffffffffc0205180:	f4de                	sd	s7,104(sp)
ffffffffc0205182:	f0e2                	sd	s8,96(sp)
ffffffffc0205184:	ece6                	sd	s9,88(sp)
ffffffffc0205186:	e8ea                	sd	s10,80(sp)
ffffffffc0205188:	e4ee                	sd	s11,72(sp)
ffffffffc020518a:	00a78463          	beq	a5,a0,ffffffffc0205192 <stride_dequeue+0x28>
ffffffffc020518e:	7870106f          	j	ffffffffc0207114 <stride_dequeue+0x1faa>
ffffffffc0205192:	01052983          	lw	s3,16(a0)
ffffffffc0205196:	8c2a                	mv	s8,a0
ffffffffc0205198:	8b4e                	mv	s6,s3
ffffffffc020519a:	00099463          	bnez	s3,ffffffffc02051a2 <stride_dequeue+0x38>
ffffffffc020519e:	7770106f          	j	ffffffffc0207114 <stride_dequeue+0x1faa>
ffffffffc02051a2:	1305b903          	ld	s2,304(a1)
ffffffffc02051a6:	01853a83          	ld	s5,24(a0)
ffffffffc02051aa:	1285bd03          	ld	s10,296(a1)
ffffffffc02051ae:	1385b483          	ld	s1,312(a1)
ffffffffc02051b2:	842e                	mv	s0,a1
ffffffffc02051b4:	2e090263          	beqz	s2,ffffffffc0205498 <stride_dequeue+0x32e>
ffffffffc02051b8:	42048263          	beqz	s1,ffffffffc02055dc <stride_dequeue+0x472>
ffffffffc02051bc:	85a6                	mv	a1,s1
ffffffffc02051be:	854a                	mv	a0,s2
ffffffffc02051c0:	d6fff0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc02051c4:	5cfd                	li	s9,-1
ffffffffc02051c6:	8a2a                	mv	s4,a0
ffffffffc02051c8:	19950163          	beq	a0,s9,ffffffffc020534a <stride_dequeue+0x1e0>
ffffffffc02051cc:	0104ba03          	ld	s4,16(s1)
ffffffffc02051d0:	0084bb83          	ld	s7,8(s1)
ffffffffc02051d4:	120a0563          	beqz	s4,ffffffffc02052fe <stride_dequeue+0x194>
ffffffffc02051d8:	85d2                	mv	a1,s4
ffffffffc02051da:	854a                	mv	a0,s2
ffffffffc02051dc:	d53ff0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc02051e0:	2d950563          	beq	a0,s9,ffffffffc02054aa <stride_dequeue+0x340>
ffffffffc02051e4:	008a3783          	ld	a5,8(s4)
ffffffffc02051e8:	010a3d83          	ld	s11,16(s4)
ffffffffc02051ec:	e03e                	sd	a5,0(sp)
ffffffffc02051ee:	100d8063          	beqz	s11,ffffffffc02052ee <stride_dequeue+0x184>
ffffffffc02051f2:	85ee                	mv	a1,s11
ffffffffc02051f4:	854a                	mv	a0,s2
ffffffffc02051f6:	d39ff0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc02051fa:	7f950563          	beq	a0,s9,ffffffffc02059e4 <stride_dequeue+0x87a>
ffffffffc02051fe:	008db783          	ld	a5,8(s11)
ffffffffc0205202:	010dbc83          	ld	s9,16(s11)
ffffffffc0205206:	e43e                	sd	a5,8(sp)
ffffffffc0205208:	0c0c8b63          	beqz	s9,ffffffffc02052de <stride_dequeue+0x174>
ffffffffc020520c:	85e6                	mv	a1,s9
ffffffffc020520e:	854a                	mv	a0,s2
ffffffffc0205210:	d1fff0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc0205214:	58fd                	li	a7,-1
ffffffffc0205216:	71150063          	beq	a0,a7,ffffffffc0205916 <stride_dequeue+0x7ac>
ffffffffc020521a:	008cb783          	ld	a5,8(s9)
ffffffffc020521e:	010cb803          	ld	a6,16(s9)
ffffffffc0205222:	e83e                	sd	a5,16(sp)
ffffffffc0205224:	0a080563          	beqz	a6,ffffffffc02052ce <stride_dequeue+0x164>
ffffffffc0205228:	85c2                	mv	a1,a6
ffffffffc020522a:	854a                	mv	a0,s2
ffffffffc020522c:	ec42                	sd	a6,24(sp)
ffffffffc020522e:	d01ff0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc0205232:	58fd                	li	a7,-1
ffffffffc0205234:	6862                	ld	a6,24(sp)
ffffffffc0205236:	41150be3          	beq	a0,a7,ffffffffc0205e4c <stride_dequeue+0xce2>
ffffffffc020523a:	00883703          	ld	a4,8(a6) # fffffffffff80008 <end+0x3fd3ff68>
ffffffffc020523e:	01083783          	ld	a5,16(a6)
ffffffffc0205242:	ec3a                	sd	a4,24(sp)
ffffffffc0205244:	cfad                	beqz	a5,ffffffffc02052be <stride_dequeue+0x154>
ffffffffc0205246:	85be                	mv	a1,a5
ffffffffc0205248:	854a                	mv	a0,s2
ffffffffc020524a:	f442                	sd	a6,40(sp)
ffffffffc020524c:	f03e                	sd	a5,32(sp)
ffffffffc020524e:	ce1ff0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc0205252:	58fd                	li	a7,-1
ffffffffc0205254:	7782                	ld	a5,32(sp)
ffffffffc0205256:	7822                	ld	a6,40(sp)
ffffffffc0205258:	01151463          	bne	a0,a7,ffffffffc0205260 <stride_dequeue+0xf6>
ffffffffc020525c:	17a0106f          	j	ffffffffc02063d6 <stride_dequeue+0x126c>
ffffffffc0205260:	6798                	ld	a4,8(a5)
ffffffffc0205262:	0107bb03          	ld	s6,16(a5)
ffffffffc0205266:	f03a                	sd	a4,32(sp)
ffffffffc0205268:	040b0463          	beqz	s6,ffffffffc02052b0 <stride_dequeue+0x146>
ffffffffc020526c:	85da                	mv	a1,s6
ffffffffc020526e:	854a                	mv	a0,s2
ffffffffc0205270:	f83e                	sd	a5,48(sp)
ffffffffc0205272:	f442                	sd	a6,40(sp)
ffffffffc0205274:	cbbff0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc0205278:	58fd                	li	a7,-1
ffffffffc020527a:	7822                	ld	a6,40(sp)
ffffffffc020527c:	77c2                	ld	a5,48(sp)
ffffffffc020527e:	01151463          	bne	a0,a7,ffffffffc0205286 <stride_dequeue+0x11c>
ffffffffc0205282:	00d0106f          	j	ffffffffc0206a8e <stride_dequeue+0x1924>
ffffffffc0205286:	010b3583          	ld	a1,16(s6)
ffffffffc020528a:	008b3983          	ld	s3,8(s6)
ffffffffc020528e:	854a                	mv	a0,s2
ffffffffc0205290:	f83e                	sd	a5,48(sp)
ffffffffc0205292:	f442                	sd	a6,40(sp)
ffffffffc0205294:	cf7ff0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc0205298:	00ab3423          	sd	a0,8(s6)
ffffffffc020529c:	013b3823          	sd	s3,16(s6)
ffffffffc02052a0:	7822                	ld	a6,40(sp)
ffffffffc02052a2:	77c2                	ld	a5,48(sp)
ffffffffc02052a4:	010c2983          	lw	s3,16(s8)
ffffffffc02052a8:	c119                	beqz	a0,ffffffffc02052ae <stride_dequeue+0x144>
ffffffffc02052aa:	01653023          	sd	s6,0(a0)
ffffffffc02052ae:	895a                	mv	s2,s6
ffffffffc02052b0:	7702                	ld	a4,32(sp)
ffffffffc02052b2:	0127b423          	sd	s2,8(a5)
ffffffffc02052b6:	eb98                	sd	a4,16(a5)
ffffffffc02052b8:	00f93023          	sd	a5,0(s2)
ffffffffc02052bc:	893e                	mv	s2,a5
ffffffffc02052be:	67e2                	ld	a5,24(sp)
ffffffffc02052c0:	01283423          	sd	s2,8(a6)
ffffffffc02052c4:	00f83823          	sd	a5,16(a6)
ffffffffc02052c8:	01093023          	sd	a6,0(s2)
ffffffffc02052cc:	8942                	mv	s2,a6
ffffffffc02052ce:	67c2                	ld	a5,16(sp)
ffffffffc02052d0:	012cb423          	sd	s2,8(s9)
ffffffffc02052d4:	00fcb823          	sd	a5,16(s9)
ffffffffc02052d8:	01993023          	sd	s9,0(s2)
ffffffffc02052dc:	8966                	mv	s2,s9
ffffffffc02052de:	67a2                	ld	a5,8(sp)
ffffffffc02052e0:	012db423          	sd	s2,8(s11)
ffffffffc02052e4:	00fdb823          	sd	a5,16(s11)
ffffffffc02052e8:	01b93023          	sd	s11,0(s2)
ffffffffc02052ec:	896e                	mv	s2,s11
ffffffffc02052ee:	6782                	ld	a5,0(sp)
ffffffffc02052f0:	012a3423          	sd	s2,8(s4)
ffffffffc02052f4:	00fa3823          	sd	a5,16(s4)
ffffffffc02052f8:	01493023          	sd	s4,0(s2)
ffffffffc02052fc:	8952                	mv	s2,s4
ffffffffc02052fe:	0124b423          	sd	s2,8(s1)
ffffffffc0205302:	0174b823          	sd	s7,16(s1)
ffffffffc0205306:	00993023          	sd	s1,0(s2)
ffffffffc020530a:	01a4b023          	sd	s10,0(s1)
ffffffffc020530e:	180d0963          	beqz	s10,ffffffffc02054a0 <stride_dequeue+0x336>
ffffffffc0205312:	008d3683          	ld	a3,8(s10)
ffffffffc0205316:	12840413          	addi	s0,s0,296
ffffffffc020531a:	18868563          	beq	a3,s0,ffffffffc02054a4 <stride_dequeue+0x33a>
ffffffffc020531e:	009d3823          	sd	s1,16(s10)
ffffffffc0205322:	70aa                	ld	ra,168(sp)
ffffffffc0205324:	740a                	ld	s0,160(sp)
ffffffffc0205326:	39fd                	addiw	s3,s3,-1
ffffffffc0205328:	015c3c23          	sd	s5,24(s8)
ffffffffc020532c:	013c2823          	sw	s3,16(s8)
ffffffffc0205330:	64ea                	ld	s1,152(sp)
ffffffffc0205332:	694a                	ld	s2,144(sp)
ffffffffc0205334:	69aa                	ld	s3,136(sp)
ffffffffc0205336:	6a0a                	ld	s4,128(sp)
ffffffffc0205338:	7ae6                	ld	s5,120(sp)
ffffffffc020533a:	7b46                	ld	s6,112(sp)
ffffffffc020533c:	7ba6                	ld	s7,104(sp)
ffffffffc020533e:	7c06                	ld	s8,96(sp)
ffffffffc0205340:	6ce6                	ld	s9,88(sp)
ffffffffc0205342:	6d46                	ld	s10,80(sp)
ffffffffc0205344:	6da6                	ld	s11,72(sp)
ffffffffc0205346:	614d                	addi	sp,sp,176
ffffffffc0205348:	8082                	ret
ffffffffc020534a:	01093d83          	ld	s11,16(s2)
ffffffffc020534e:	00893b83          	ld	s7,8(s2)
ffffffffc0205352:	120d8963          	beqz	s11,ffffffffc0205484 <stride_dequeue+0x31a>
ffffffffc0205356:	85a6                	mv	a1,s1
ffffffffc0205358:	856e                	mv	a0,s11
ffffffffc020535a:	bd5ff0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc020535e:	29450363          	beq	a0,s4,ffffffffc02055e4 <stride_dequeue+0x47a>
ffffffffc0205362:	649c                	ld	a5,8(s1)
ffffffffc0205364:	0104bc83          	ld	s9,16(s1)
ffffffffc0205368:	e03e                	sd	a5,0(sp)
ffffffffc020536a:	100c8763          	beqz	s9,ffffffffc0205478 <stride_dequeue+0x30e>
ffffffffc020536e:	85e6                	mv	a1,s9
ffffffffc0205370:	856e                	mv	a0,s11
ffffffffc0205372:	bbdff0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc0205376:	4b450263          	beq	a0,s4,ffffffffc020581a <stride_dequeue+0x6b0>
ffffffffc020537a:	008cb783          	ld	a5,8(s9)
ffffffffc020537e:	010cba03          	ld	s4,16(s9)
ffffffffc0205382:	e43e                	sd	a5,8(sp)
ffffffffc0205384:	0e0a0263          	beqz	s4,ffffffffc0205468 <stride_dequeue+0x2fe>
ffffffffc0205388:	85d2                	mv	a1,s4
ffffffffc020538a:	856e                	mv	a0,s11
ffffffffc020538c:	ba3ff0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc0205390:	58fd                	li	a7,-1
ffffffffc0205392:	03150fe3          	beq	a0,a7,ffffffffc0205bd0 <stride_dequeue+0xa66>
ffffffffc0205396:	008a3783          	ld	a5,8(s4)
ffffffffc020539a:	010a3803          	ld	a6,16(s4)
ffffffffc020539e:	e83e                	sd	a5,16(sp)
ffffffffc02053a0:	0a080c63          	beqz	a6,ffffffffc0205458 <stride_dequeue+0x2ee>
ffffffffc02053a4:	85c2                	mv	a1,a6
ffffffffc02053a6:	856e                	mv	a0,s11
ffffffffc02053a8:	ec42                	sd	a6,24(sp)
ffffffffc02053aa:	b85ff0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc02053ae:	58fd                	li	a7,-1
ffffffffc02053b0:	6862                	ld	a6,24(sp)
ffffffffc02053b2:	01151463          	bne	a0,a7,ffffffffc02053ba <stride_dequeue+0x250>
ffffffffc02053b6:	6e10006f          	j	ffffffffc0206296 <stride_dequeue+0x112c>
ffffffffc02053ba:	00883783          	ld	a5,8(a6)
ffffffffc02053be:	01083303          	ld	t1,16(a6)
ffffffffc02053c2:	ec3e                	sd	a5,24(sp)
ffffffffc02053c4:	08030263          	beqz	t1,ffffffffc0205448 <stride_dequeue+0x2de>
ffffffffc02053c8:	859a                	mv	a1,t1
ffffffffc02053ca:	856e                	mv	a0,s11
ffffffffc02053cc:	f442                	sd	a6,40(sp)
ffffffffc02053ce:	f01a                	sd	t1,32(sp)
ffffffffc02053d0:	b5fff0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc02053d4:	58fd                	li	a7,-1
ffffffffc02053d6:	7302                	ld	t1,32(sp)
ffffffffc02053d8:	7822                	ld	a6,40(sp)
ffffffffc02053da:	01151463          	bne	a0,a7,ffffffffc02053e2 <stride_dequeue+0x278>
ffffffffc02053de:	5ee0106f          	j	ffffffffc02069cc <stride_dequeue+0x1862>
ffffffffc02053e2:	00833783          	ld	a5,8(t1)
ffffffffc02053e6:	01033983          	ld	s3,16(t1)
ffffffffc02053ea:	f03e                	sd	a5,32(sp)
ffffffffc02053ec:	00099463          	bnez	s3,ffffffffc02053f4 <stride_dequeue+0x28a>
ffffffffc02053f0:	26f0106f          	j	ffffffffc0206e5e <stride_dequeue+0x1cf4>
ffffffffc02053f4:	85ce                	mv	a1,s3
ffffffffc02053f6:	856e                	mv	a0,s11
ffffffffc02053f8:	f842                	sd	a6,48(sp)
ffffffffc02053fa:	f41a                	sd	t1,40(sp)
ffffffffc02053fc:	b33ff0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc0205400:	58fd                	li	a7,-1
ffffffffc0205402:	7322                	ld	t1,40(sp)
ffffffffc0205404:	7842                	ld	a6,48(sp)
ffffffffc0205406:	01151463          	bne	a0,a7,ffffffffc020540e <stride_dequeue+0x2a4>
ffffffffc020540a:	4d30106f          	j	ffffffffc02070dc <stride_dequeue+0x1f72>
ffffffffc020540e:	0109b583          	ld	a1,16(s3)
ffffffffc0205412:	0089bb03          	ld	s6,8(s3)
ffffffffc0205416:	856e                	mv	a0,s11
ffffffffc0205418:	f842                	sd	a6,48(sp)
ffffffffc020541a:	f41a                	sd	t1,40(sp)
ffffffffc020541c:	b6fff0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc0205420:	00a9b423          	sd	a0,8(s3)
ffffffffc0205424:	0169b823          	sd	s6,16(s3)
ffffffffc0205428:	7322                	ld	t1,40(sp)
ffffffffc020542a:	7842                	ld	a6,48(sp)
ffffffffc020542c:	010c2b03          	lw	s6,16(s8)
ffffffffc0205430:	c119                	beqz	a0,ffffffffc0205436 <stride_dequeue+0x2cc>
ffffffffc0205432:	01353023          	sd	s3,0(a0)
ffffffffc0205436:	7782                	ld	a5,32(sp)
ffffffffc0205438:	01333423          	sd	s3,8(t1)
ffffffffc020543c:	8d9a                	mv	s11,t1
ffffffffc020543e:	00f33823          	sd	a5,16(t1)
ffffffffc0205442:	0069b023          	sd	t1,0(s3)
ffffffffc0205446:	89da                	mv	s3,s6
ffffffffc0205448:	67e2                	ld	a5,24(sp)
ffffffffc020544a:	01b83423          	sd	s11,8(a6)
ffffffffc020544e:	00f83823          	sd	a5,16(a6)
ffffffffc0205452:	010db023          	sd	a6,0(s11)
ffffffffc0205456:	8dc2                	mv	s11,a6
ffffffffc0205458:	67c2                	ld	a5,16(sp)
ffffffffc020545a:	01ba3423          	sd	s11,8(s4)
ffffffffc020545e:	00fa3823          	sd	a5,16(s4)
ffffffffc0205462:	014db023          	sd	s4,0(s11)
ffffffffc0205466:	8dd2                	mv	s11,s4
ffffffffc0205468:	67a2                	ld	a5,8(sp)
ffffffffc020546a:	01bcb423          	sd	s11,8(s9)
ffffffffc020546e:	00fcb823          	sd	a5,16(s9)
ffffffffc0205472:	019db023          	sd	s9,0(s11)
ffffffffc0205476:	8de6                	mv	s11,s9
ffffffffc0205478:	6782                	ld	a5,0(sp)
ffffffffc020547a:	01b4b423          	sd	s11,8(s1)
ffffffffc020547e:	e89c                	sd	a5,16(s1)
ffffffffc0205480:	009db023          	sd	s1,0(s11)
ffffffffc0205484:	00993423          	sd	s1,8(s2)
ffffffffc0205488:	01793823          	sd	s7,16(s2)
ffffffffc020548c:	0124b023          	sd	s2,0(s1)
ffffffffc0205490:	84ca                	mv	s1,s2
ffffffffc0205492:	01a4b023          	sd	s10,0(s1)
ffffffffc0205496:	bda5                	j	ffffffffc020530e <stride_dequeue+0x1a4>
ffffffffc0205498:	e60499e3          	bnez	s1,ffffffffc020530a <stride_dequeue+0x1a0>
ffffffffc020549c:	e60d1be3          	bnez	s10,ffffffffc0205312 <stride_dequeue+0x1a8>
ffffffffc02054a0:	8aa6                	mv	s5,s1
ffffffffc02054a2:	b541                	j	ffffffffc0205322 <stride_dequeue+0x1b8>
ffffffffc02054a4:	009d3423          	sd	s1,8(s10)
ffffffffc02054a8:	bdad                	j	ffffffffc0205322 <stride_dequeue+0x1b8>
ffffffffc02054aa:	01093d83          	ld	s11,16(s2)
ffffffffc02054ae:	e02a                	sd	a0,0(sp)
ffffffffc02054b0:	00893c83          	ld	s9,8(s2)
ffffffffc02054b4:	100d8d63          	beqz	s11,ffffffffc02055ce <stride_dequeue+0x464>
ffffffffc02054b8:	85d2                	mv	a1,s4
ffffffffc02054ba:	856e                	mv	a0,s11
ffffffffc02054bc:	a73ff0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc02054c0:	6782                	ld	a5,0(sp)
ffffffffc02054c2:	24f50563          	beq	a0,a5,ffffffffc020570c <stride_dequeue+0x5a2>
ffffffffc02054c6:	008a3783          	ld	a5,8(s4)
ffffffffc02054ca:	010a3603          	ld	a2,16(s4)
ffffffffc02054ce:	e03e                	sd	a5,0(sp)
ffffffffc02054d0:	0e060863          	beqz	a2,ffffffffc02055c0 <stride_dequeue+0x456>
ffffffffc02054d4:	85b2                	mv	a1,a2
ffffffffc02054d6:	856e                	mv	a0,s11
ffffffffc02054d8:	e432                	sd	a2,8(sp)
ffffffffc02054da:	a55ff0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc02054de:	58fd                	li	a7,-1
ffffffffc02054e0:	6622                	ld	a2,8(sp)
ffffffffc02054e2:	7b150f63          	beq	a0,a7,ffffffffc0205ca0 <stride_dequeue+0xb36>
ffffffffc02054e6:	661c                	ld	a5,8(a2)
ffffffffc02054e8:	01063803          	ld	a6,16(a2)
ffffffffc02054ec:	e43e                	sd	a5,8(sp)
ffffffffc02054ee:	0c080263          	beqz	a6,ffffffffc02055b2 <stride_dequeue+0x448>
ffffffffc02054f2:	85c2                	mv	a1,a6
ffffffffc02054f4:	856e                	mv	a0,s11
ffffffffc02054f6:	ec32                	sd	a2,24(sp)
ffffffffc02054f8:	e842                	sd	a6,16(sp)
ffffffffc02054fa:	a35ff0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc02054fe:	58fd                	li	a7,-1
ffffffffc0205500:	6842                	ld	a6,16(sp)
ffffffffc0205502:	6662                	ld	a2,24(sp)
ffffffffc0205504:	631507e3          	beq	a0,a7,ffffffffc0206332 <stride_dequeue+0x11c8>
ffffffffc0205508:	00883783          	ld	a5,8(a6)
ffffffffc020550c:	01083303          	ld	t1,16(a6)
ffffffffc0205510:	e83e                	sd	a5,16(sp)
ffffffffc0205512:	08030863          	beqz	t1,ffffffffc02055a2 <stride_dequeue+0x438>
ffffffffc0205516:	859a                	mv	a1,t1
ffffffffc0205518:	856e                	mv	a0,s11
ffffffffc020551a:	f442                	sd	a6,40(sp)
ffffffffc020551c:	f032                	sd	a2,32(sp)
ffffffffc020551e:	ec1a                	sd	t1,24(sp)
ffffffffc0205520:	a0fff0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc0205524:	58fd                	li	a7,-1
ffffffffc0205526:	6362                	ld	t1,24(sp)
ffffffffc0205528:	7602                	ld	a2,32(sp)
ffffffffc020552a:	7822                	ld	a6,40(sp)
ffffffffc020552c:	01151463          	bne	a0,a7,ffffffffc0205534 <stride_dequeue+0x3ca>
ffffffffc0205530:	3d00106f          	j	ffffffffc0206900 <stride_dequeue+0x1796>
ffffffffc0205534:	00833783          	ld	a5,8(t1)
ffffffffc0205538:	01033983          	ld	s3,16(t1)
ffffffffc020553c:	ec3e                	sd	a5,24(sp)
ffffffffc020553e:	00099463          	bnez	s3,ffffffffc0205546 <stride_dequeue+0x3dc>
ffffffffc0205542:	2af0106f          	j	ffffffffc0206ff0 <stride_dequeue+0x1e86>
ffffffffc0205546:	85ce                	mv	a1,s3
ffffffffc0205548:	856e                	mv	a0,s11
ffffffffc020554a:	f81a                	sd	t1,48(sp)
ffffffffc020554c:	f442                	sd	a6,40(sp)
ffffffffc020554e:	f032                	sd	a2,32(sp)
ffffffffc0205550:	9dfff0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc0205554:	58fd                	li	a7,-1
ffffffffc0205556:	7602                	ld	a2,32(sp)
ffffffffc0205558:	7822                	ld	a6,40(sp)
ffffffffc020555a:	7342                	ld	t1,48(sp)
ffffffffc020555c:	01151463          	bne	a0,a7,ffffffffc0205564 <stride_dequeue+0x3fa>
ffffffffc0205560:	3510106f          	j	ffffffffc02070b0 <stride_dequeue+0x1f46>
ffffffffc0205564:	0109b583          	ld	a1,16(s3)
ffffffffc0205568:	0089bb03          	ld	s6,8(s3)
ffffffffc020556c:	856e                	mv	a0,s11
ffffffffc020556e:	f81a                	sd	t1,48(sp)
ffffffffc0205570:	f442                	sd	a6,40(sp)
ffffffffc0205572:	f032                	sd	a2,32(sp)
ffffffffc0205574:	a17ff0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc0205578:	00a9b423          	sd	a0,8(s3)
ffffffffc020557c:	0169b823          	sd	s6,16(s3)
ffffffffc0205580:	7602                	ld	a2,32(sp)
ffffffffc0205582:	7822                	ld	a6,40(sp)
ffffffffc0205584:	7342                	ld	t1,48(sp)
ffffffffc0205586:	010c2b03          	lw	s6,16(s8)
ffffffffc020558a:	c119                	beqz	a0,ffffffffc0205590 <stride_dequeue+0x426>
ffffffffc020558c:	01353023          	sd	s3,0(a0)
ffffffffc0205590:	67e2                	ld	a5,24(sp)
ffffffffc0205592:	01333423          	sd	s3,8(t1)
ffffffffc0205596:	8d9a                	mv	s11,t1
ffffffffc0205598:	00f33823          	sd	a5,16(t1)
ffffffffc020559c:	0069b023          	sd	t1,0(s3)
ffffffffc02055a0:	89da                	mv	s3,s6
ffffffffc02055a2:	67c2                	ld	a5,16(sp)
ffffffffc02055a4:	01b83423          	sd	s11,8(a6)
ffffffffc02055a8:	00f83823          	sd	a5,16(a6)
ffffffffc02055ac:	010db023          	sd	a6,0(s11)
ffffffffc02055b0:	8dc2                	mv	s11,a6
ffffffffc02055b2:	67a2                	ld	a5,8(sp)
ffffffffc02055b4:	01b63423          	sd	s11,8(a2)
ffffffffc02055b8:	ea1c                	sd	a5,16(a2)
ffffffffc02055ba:	00cdb023          	sd	a2,0(s11)
ffffffffc02055be:	8db2                	mv	s11,a2
ffffffffc02055c0:	6782                	ld	a5,0(sp)
ffffffffc02055c2:	01ba3423          	sd	s11,8(s4)
ffffffffc02055c6:	00fa3823          	sd	a5,16(s4)
ffffffffc02055ca:	014db023          	sd	s4,0(s11)
ffffffffc02055ce:	01493423          	sd	s4,8(s2)
ffffffffc02055d2:	01993823          	sd	s9,16(s2)
ffffffffc02055d6:	012a3023          	sd	s2,0(s4)
ffffffffc02055da:	b315                	j	ffffffffc02052fe <stride_dequeue+0x194>
ffffffffc02055dc:	84ca                	mv	s1,s2
ffffffffc02055de:	01a4b023          	sd	s10,0(s1)
ffffffffc02055e2:	b335                	j	ffffffffc020530e <stride_dequeue+0x1a4>
ffffffffc02055e4:	008db783          	ld	a5,8(s11)
ffffffffc02055e8:	010dbc83          	ld	s9,16(s11)
ffffffffc02055ec:	e42a                	sd	a0,8(sp)
ffffffffc02055ee:	e03e                	sd	a5,0(sp)
ffffffffc02055f0:	100c8563          	beqz	s9,ffffffffc02056fa <stride_dequeue+0x590>
ffffffffc02055f4:	85a6                	mv	a1,s1
ffffffffc02055f6:	8566                	mv	a0,s9
ffffffffc02055f8:	937ff0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc02055fc:	67a2                	ld	a5,8(sp)
ffffffffc02055fe:	4cf50e63          	beq	a0,a5,ffffffffc0205ada <stride_dequeue+0x970>
ffffffffc0205602:	649c                	ld	a5,8(s1)
ffffffffc0205604:	0104ba03          	ld	s4,16(s1)
ffffffffc0205608:	e43e                	sd	a5,8(sp)
ffffffffc020560a:	0e0a0263          	beqz	s4,ffffffffc02056ee <stride_dequeue+0x584>
ffffffffc020560e:	85d2                	mv	a1,s4
ffffffffc0205610:	8566                	mv	a0,s9
ffffffffc0205612:	91dff0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc0205616:	58fd                	li	a7,-1
ffffffffc0205618:	0d1505e3          	beq	a0,a7,ffffffffc0205ee2 <stride_dequeue+0xd78>
ffffffffc020561c:	008a3783          	ld	a5,8(s4)
ffffffffc0205620:	010a3803          	ld	a6,16(s4)
ffffffffc0205624:	e83e                	sd	a5,16(sp)
ffffffffc0205626:	0a080c63          	beqz	a6,ffffffffc02056de <stride_dequeue+0x574>
ffffffffc020562a:	85c2                	mv	a1,a6
ffffffffc020562c:	8566                	mv	a0,s9
ffffffffc020562e:	ec42                	sd	a6,24(sp)
ffffffffc0205630:	8ffff0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc0205634:	58fd                	li	a7,-1
ffffffffc0205636:	6862                	ld	a6,24(sp)
ffffffffc0205638:	01151463          	bne	a0,a7,ffffffffc0205640 <stride_dequeue+0x4d6>
ffffffffc020563c:	07c0106f          	j	ffffffffc02066b8 <stride_dequeue+0x154e>
ffffffffc0205640:	00883783          	ld	a5,8(a6)
ffffffffc0205644:	01083983          	ld	s3,16(a6)
ffffffffc0205648:	ec3e                	sd	a5,24(sp)
ffffffffc020564a:	00099463          	bnez	s3,ffffffffc0205652 <stride_dequeue+0x4e8>
ffffffffc020564e:	2bb0106f          	j	ffffffffc0207108 <stride_dequeue+0x1f9e>
ffffffffc0205652:	85ce                	mv	a1,s3
ffffffffc0205654:	8566                	mv	a0,s9
ffffffffc0205656:	f042                	sd	a6,32(sp)
ffffffffc0205658:	8d7ff0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc020565c:	58fd                	li	a7,-1
ffffffffc020565e:	7802                	ld	a6,32(sp)
ffffffffc0205660:	01151463          	bne	a0,a7,ffffffffc0205668 <stride_dequeue+0x4fe>
ffffffffc0205664:	05f0106f          	j	ffffffffc0206ec2 <stride_dequeue+0x1d58>
ffffffffc0205668:	0089b783          	ld	a5,8(s3)
ffffffffc020566c:	0109be03          	ld	t3,16(s3)
ffffffffc0205670:	f03e                	sd	a5,32(sp)
ffffffffc0205672:	040e0663          	beqz	t3,ffffffffc02056be <stride_dequeue+0x554>
ffffffffc0205676:	85f2                	mv	a1,t3
ffffffffc0205678:	8566                	mv	a0,s9
ffffffffc020567a:	f842                	sd	a6,48(sp)
ffffffffc020567c:	f472                	sd	t3,40(sp)
ffffffffc020567e:	8b1ff0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc0205682:	58fd                	li	a7,-1
ffffffffc0205684:	7e22                	ld	t3,40(sp)
ffffffffc0205686:	7842                	ld	a6,48(sp)
ffffffffc0205688:	01151463          	bne	a0,a7,ffffffffc0205690 <stride_dequeue+0x526>
ffffffffc020568c:	4e70106f          	j	ffffffffc0207372 <stride_dequeue+0x2208>
ffffffffc0205690:	010e3583          	ld	a1,16(t3)
ffffffffc0205694:	8566                	mv	a0,s9
ffffffffc0205696:	008e3b03          	ld	s6,8(t3)
ffffffffc020569a:	f842                	sd	a6,48(sp)
ffffffffc020569c:	f472                	sd	t3,40(sp)
ffffffffc020569e:	8edff0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc02056a2:	7e22                	ld	t3,40(sp)
ffffffffc02056a4:	7842                	ld	a6,48(sp)
ffffffffc02056a6:	016e3823          	sd	s6,16(t3)
ffffffffc02056aa:	00ae3423          	sd	a0,8(t3)
ffffffffc02056ae:	010c2b03          	lw	s6,16(s8)
ffffffffc02056b2:	e119                	bnez	a0,ffffffffc02056b8 <stride_dequeue+0x54e>
ffffffffc02056b4:	7bb0106f          	j	ffffffffc020766e <stride_dequeue+0x2504>
ffffffffc02056b8:	01c53023          	sd	t3,0(a0)
ffffffffc02056bc:	8cf2                	mv	s9,t3
ffffffffc02056be:	7782                	ld	a5,32(sp)
ffffffffc02056c0:	0199b423          	sd	s9,8(s3)
ffffffffc02056c4:	00f9b823          	sd	a5,16(s3)
ffffffffc02056c8:	013cb023          	sd	s3,0(s9)
ffffffffc02056cc:	67e2                	ld	a5,24(sp)
ffffffffc02056ce:	01383423          	sd	s3,8(a6)
ffffffffc02056d2:	8cc2                	mv	s9,a6
ffffffffc02056d4:	00f83823          	sd	a5,16(a6)
ffffffffc02056d8:	0109b023          	sd	a6,0(s3)
ffffffffc02056dc:	89da                	mv	s3,s6
ffffffffc02056de:	67c2                	ld	a5,16(sp)
ffffffffc02056e0:	019a3423          	sd	s9,8(s4)
ffffffffc02056e4:	00fa3823          	sd	a5,16(s4)
ffffffffc02056e8:	014cb023          	sd	s4,0(s9)
ffffffffc02056ec:	8cd2                	mv	s9,s4
ffffffffc02056ee:	67a2                	ld	a5,8(sp)
ffffffffc02056f0:	0194b423          	sd	s9,8(s1)
ffffffffc02056f4:	e89c                	sd	a5,16(s1)
ffffffffc02056f6:	009cb023          	sd	s1,0(s9)
ffffffffc02056fa:	6782                	ld	a5,0(sp)
ffffffffc02056fc:	009db423          	sd	s1,8(s11)
ffffffffc0205700:	00fdb823          	sd	a5,16(s11)
ffffffffc0205704:	01b4b023          	sd	s11,0(s1)
ffffffffc0205708:	84ee                	mv	s1,s11
ffffffffc020570a:	bbad                	j	ffffffffc0205484 <stride_dequeue+0x31a>
ffffffffc020570c:	008db783          	ld	a5,8(s11)
ffffffffc0205710:	010db603          	ld	a2,16(s11)
ffffffffc0205714:	e03e                	sd	a5,0(sp)
ffffffffc0205716:	0e060963          	beqz	a2,ffffffffc0205808 <stride_dequeue+0x69e>
ffffffffc020571a:	8532                	mv	a0,a2
ffffffffc020571c:	85d2                	mv	a1,s4
ffffffffc020571e:	e432                	sd	a2,8(sp)
ffffffffc0205720:	80fff0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc0205724:	58fd                	li	a7,-1
ffffffffc0205726:	6622                	ld	a2,8(sp)
ffffffffc0205728:	091504e3          	beq	a0,a7,ffffffffc0205fb0 <stride_dequeue+0xe46>
ffffffffc020572c:	008a3783          	ld	a5,8(s4)
ffffffffc0205730:	010a3803          	ld	a6,16(s4)
ffffffffc0205734:	e43e                	sd	a5,8(sp)
ffffffffc0205736:	0c080263          	beqz	a6,ffffffffc02057fa <stride_dequeue+0x690>
ffffffffc020573a:	85c2                	mv	a1,a6
ffffffffc020573c:	8532                	mv	a0,a2
ffffffffc020573e:	ec42                	sd	a6,24(sp)
ffffffffc0205740:	e832                	sd	a2,16(sp)
ffffffffc0205742:	fecff0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc0205746:	58fd                	li	a7,-1
ffffffffc0205748:	6642                	ld	a2,16(sp)
ffffffffc020574a:	6862                	ld	a6,24(sp)
ffffffffc020574c:	01151463          	bne	a0,a7,ffffffffc0205754 <stride_dequeue+0x5ea>
ffffffffc0205750:	00a0106f          	j	ffffffffc020675a <stride_dequeue+0x15f0>
ffffffffc0205754:	00883783          	ld	a5,8(a6)
ffffffffc0205758:	01083983          	ld	s3,16(a6)
ffffffffc020575c:	e83e                	sd	a5,16(sp)
ffffffffc020575e:	00099463          	bnez	s3,ffffffffc0205766 <stride_dequeue+0x5fc>
ffffffffc0205762:	1e50106f          	j	ffffffffc0207146 <stride_dequeue+0x1fdc>
ffffffffc0205766:	8532                	mv	a0,a2
ffffffffc0205768:	85ce                	mv	a1,s3
ffffffffc020576a:	f042                	sd	a6,32(sp)
ffffffffc020576c:	ec32                	sd	a2,24(sp)
ffffffffc020576e:	fc0ff0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc0205772:	58fd                	li	a7,-1
ffffffffc0205774:	6662                	ld	a2,24(sp)
ffffffffc0205776:	7802                	ld	a6,32(sp)
ffffffffc0205778:	01151463          	bne	a0,a7,ffffffffc0205780 <stride_dequeue+0x616>
ffffffffc020577c:	4fc0106f          	j	ffffffffc0206c78 <stride_dequeue+0x1b0e>
ffffffffc0205780:	0089b783          	ld	a5,8(s3)
ffffffffc0205784:	0109be03          	ld	t3,16(s3)
ffffffffc0205788:	ec3e                	sd	a5,24(sp)
ffffffffc020578a:	040e0863          	beqz	t3,ffffffffc02057da <stride_dequeue+0x670>
ffffffffc020578e:	85f2                	mv	a1,t3
ffffffffc0205790:	8532                	mv	a0,a2
ffffffffc0205792:	f842                	sd	a6,48(sp)
ffffffffc0205794:	f472                	sd	t3,40(sp)
ffffffffc0205796:	f032                	sd	a2,32(sp)
ffffffffc0205798:	f96ff0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc020579c:	7842                	ld	a6,48(sp)
ffffffffc020579e:	7e22                	ld	t3,40(sp)
ffffffffc02057a0:	58fd                	li	a7,-1
ffffffffc02057a2:	f442                	sd	a6,40(sp)
ffffffffc02057a4:	7602                	ld	a2,32(sp)
ffffffffc02057a6:	01151463          	bne	a0,a7,ffffffffc02057ae <stride_dequeue+0x644>
ffffffffc02057aa:	37b0106f          	j	ffffffffc0207324 <stride_dequeue+0x21ba>
ffffffffc02057ae:	010e3583          	ld	a1,16(t3)
ffffffffc02057b2:	8532                	mv	a0,a2
ffffffffc02057b4:	008e3b03          	ld	s6,8(t3)
ffffffffc02057b8:	f072                	sd	t3,32(sp)
ffffffffc02057ba:	fd0ff0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc02057be:	7e02                	ld	t3,32(sp)
ffffffffc02057c0:	7822                	ld	a6,40(sp)
ffffffffc02057c2:	016e3823          	sd	s6,16(t3)
ffffffffc02057c6:	00ae3423          	sd	a0,8(t3)
ffffffffc02057ca:	010c2b03          	lw	s6,16(s8)
ffffffffc02057ce:	e119                	bnez	a0,ffffffffc02057d4 <stride_dequeue+0x66a>
ffffffffc02057d0:	7090106f          	j	ffffffffc02076d8 <stride_dequeue+0x256e>
ffffffffc02057d4:	01c53023          	sd	t3,0(a0)
ffffffffc02057d8:	8672                	mv	a2,t3
ffffffffc02057da:	67e2                	ld	a5,24(sp)
ffffffffc02057dc:	00c9b423          	sd	a2,8(s3)
ffffffffc02057e0:	00f9b823          	sd	a5,16(s3)
ffffffffc02057e4:	01363023          	sd	s3,0(a2)
ffffffffc02057e8:	67c2                	ld	a5,16(sp)
ffffffffc02057ea:	01383423          	sd	s3,8(a6)
ffffffffc02057ee:	8642                	mv	a2,a6
ffffffffc02057f0:	00f83823          	sd	a5,16(a6)
ffffffffc02057f4:	0109b023          	sd	a6,0(s3)
ffffffffc02057f8:	89da                	mv	s3,s6
ffffffffc02057fa:	67a2                	ld	a5,8(sp)
ffffffffc02057fc:	00ca3423          	sd	a2,8(s4)
ffffffffc0205800:	00fa3823          	sd	a5,16(s4)
ffffffffc0205804:	01463023          	sd	s4,0(a2)
ffffffffc0205808:	6782                	ld	a5,0(sp)
ffffffffc020580a:	014db423          	sd	s4,8(s11)
ffffffffc020580e:	00fdb823          	sd	a5,16(s11)
ffffffffc0205812:	01ba3023          	sd	s11,0(s4)
ffffffffc0205816:	8a6e                	mv	s4,s11
ffffffffc0205818:	bb5d                	j	ffffffffc02055ce <stride_dequeue+0x464>
ffffffffc020581a:	008db783          	ld	a5,8(s11)
ffffffffc020581e:	010dba03          	ld	s4,16(s11)
ffffffffc0205822:	e43e                	sd	a5,8(sp)
ffffffffc0205824:	0e0a0163          	beqz	s4,ffffffffc0205906 <stride_dequeue+0x79c>
ffffffffc0205828:	85e6                	mv	a1,s9
ffffffffc020582a:	8552                	mv	a0,s4
ffffffffc020582c:	f02ff0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc0205830:	58fd                	li	a7,-1
ffffffffc0205832:	05150de3          	beq	a0,a7,ffffffffc020608c <stride_dequeue+0xf22>
ffffffffc0205836:	008cb783          	ld	a5,8(s9)
ffffffffc020583a:	010cb803          	ld	a6,16(s9)
ffffffffc020583e:	e83e                	sd	a5,16(sp)
ffffffffc0205840:	0a080c63          	beqz	a6,ffffffffc02058f8 <stride_dequeue+0x78e>
ffffffffc0205844:	85c2                	mv	a1,a6
ffffffffc0205846:	8552                	mv	a0,s4
ffffffffc0205848:	ec42                	sd	a6,24(sp)
ffffffffc020584a:	ee4ff0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc020584e:	58fd                	li	a7,-1
ffffffffc0205850:	6862                	ld	a6,24(sp)
ffffffffc0205852:	01151463          	bne	a0,a7,ffffffffc020585a <stride_dequeue+0x6f0>
ffffffffc0205856:	7ab0006f          	j	ffffffffc0206800 <stride_dequeue+0x1696>
ffffffffc020585a:	00883783          	ld	a5,8(a6)
ffffffffc020585e:	01083983          	ld	s3,16(a6)
ffffffffc0205862:	ec3e                	sd	a5,24(sp)
ffffffffc0205864:	00099463          	bnez	s3,ffffffffc020586c <stride_dequeue+0x702>
ffffffffc0205868:	0cd0106f          	j	ffffffffc0207134 <stride_dequeue+0x1fca>
ffffffffc020586c:	85ce                	mv	a1,s3
ffffffffc020586e:	8552                	mv	a0,s4
ffffffffc0205870:	f042                	sd	a6,32(sp)
ffffffffc0205872:	ebcff0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc0205876:	58fd                	li	a7,-1
ffffffffc0205878:	7802                	ld	a6,32(sp)
ffffffffc020587a:	01151463          	bne	a0,a7,ffffffffc0205882 <stride_dequeue+0x718>
ffffffffc020587e:	39c0106f          	j	ffffffffc0206c1a <stride_dequeue+0x1ab0>
ffffffffc0205882:	0089b783          	ld	a5,8(s3)
ffffffffc0205886:	0109be03          	ld	t3,16(s3)
ffffffffc020588a:	f03e                	sd	a5,32(sp)
ffffffffc020588c:	040e0663          	beqz	t3,ffffffffc02058d8 <stride_dequeue+0x76e>
ffffffffc0205890:	85f2                	mv	a1,t3
ffffffffc0205892:	8552                	mv	a0,s4
ffffffffc0205894:	f842                	sd	a6,48(sp)
ffffffffc0205896:	f472                	sd	t3,40(sp)
ffffffffc0205898:	e96ff0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc020589c:	58fd                	li	a7,-1
ffffffffc020589e:	7e22                	ld	t3,40(sp)
ffffffffc02058a0:	7842                	ld	a6,48(sp)
ffffffffc02058a2:	01151463          	bne	a0,a7,ffffffffc02058aa <stride_dequeue+0x740>
ffffffffc02058a6:	2f90106f          	j	ffffffffc020739e <stride_dequeue+0x2234>
ffffffffc02058aa:	010e3583          	ld	a1,16(t3)
ffffffffc02058ae:	8552                	mv	a0,s4
ffffffffc02058b0:	008e3b03          	ld	s6,8(t3)
ffffffffc02058b4:	f842                	sd	a6,48(sp)
ffffffffc02058b6:	f472                	sd	t3,40(sp)
ffffffffc02058b8:	ed2ff0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc02058bc:	7e22                	ld	t3,40(sp)
ffffffffc02058be:	7842                	ld	a6,48(sp)
ffffffffc02058c0:	016e3823          	sd	s6,16(t3)
ffffffffc02058c4:	00ae3423          	sd	a0,8(t3)
ffffffffc02058c8:	010c2b03          	lw	s6,16(s8)
ffffffffc02058cc:	e119                	bnez	a0,ffffffffc02058d2 <stride_dequeue+0x768>
ffffffffc02058ce:	5a70106f          	j	ffffffffc0207674 <stride_dequeue+0x250a>
ffffffffc02058d2:	01c53023          	sd	t3,0(a0)
ffffffffc02058d6:	8a72                	mv	s4,t3
ffffffffc02058d8:	7782                	ld	a5,32(sp)
ffffffffc02058da:	0149b423          	sd	s4,8(s3)
ffffffffc02058de:	00f9b823          	sd	a5,16(s3)
ffffffffc02058e2:	013a3023          	sd	s3,0(s4)
ffffffffc02058e6:	67e2                	ld	a5,24(sp)
ffffffffc02058e8:	01383423          	sd	s3,8(a6)
ffffffffc02058ec:	8a42                	mv	s4,a6
ffffffffc02058ee:	00f83823          	sd	a5,16(a6)
ffffffffc02058f2:	0109b023          	sd	a6,0(s3)
ffffffffc02058f6:	89da                	mv	s3,s6
ffffffffc02058f8:	67c2                	ld	a5,16(sp)
ffffffffc02058fa:	014cb423          	sd	s4,8(s9)
ffffffffc02058fe:	00fcb823          	sd	a5,16(s9)
ffffffffc0205902:	019a3023          	sd	s9,0(s4)
ffffffffc0205906:	67a2                	ld	a5,8(sp)
ffffffffc0205908:	019db423          	sd	s9,8(s11)
ffffffffc020590c:	00fdb823          	sd	a5,16(s11)
ffffffffc0205910:	01bcb023          	sd	s11,0(s9)
ffffffffc0205914:	b695                	j	ffffffffc0205478 <stride_dequeue+0x30e>
ffffffffc0205916:	00893783          	ld	a5,8(s2)
ffffffffc020591a:	01093883          	ld	a7,16(s2)
ffffffffc020591e:	ec2a                	sd	a0,24(sp)
ffffffffc0205920:	e83e                	sd	a5,16(sp)
ffffffffc0205922:	0a088963          	beqz	a7,ffffffffc02059d4 <stride_dequeue+0x86a>
ffffffffc0205926:	8546                	mv	a0,a7
ffffffffc0205928:	85e6                	mv	a1,s9
ffffffffc020592a:	f046                	sd	a7,32(sp)
ffffffffc020592c:	e02ff0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc0205930:	6862                	ld	a6,24(sp)
ffffffffc0205932:	7882                	ld	a7,32(sp)
ffffffffc0205934:	030504e3          	beq	a0,a6,ffffffffc020615c <stride_dequeue+0xff2>
ffffffffc0205938:	008cb783          	ld	a5,8(s9)
ffffffffc020593c:	010cb303          	ld	t1,16(s9)
ffffffffc0205940:	f042                	sd	a6,32(sp)
ffffffffc0205942:	ec3e                	sd	a5,24(sp)
ffffffffc0205944:	08030163          	beqz	t1,ffffffffc02059c6 <stride_dequeue+0x85c>
ffffffffc0205948:	859a                	mv	a1,t1
ffffffffc020594a:	8546                	mv	a0,a7
ffffffffc020594c:	f81a                	sd	t1,48(sp)
ffffffffc020594e:	f446                	sd	a7,40(sp)
ffffffffc0205950:	ddeff0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc0205954:	7802                	ld	a6,32(sp)
ffffffffc0205956:	78a2                	ld	a7,40(sp)
ffffffffc0205958:	7342                	ld	t1,48(sp)
ffffffffc020595a:	01051463          	bne	a0,a6,ffffffffc0205962 <stride_dequeue+0x7f8>
ffffffffc020595e:	0d00106f          	j	ffffffffc0206a2e <stride_dequeue+0x18c4>
ffffffffc0205962:	00833783          	ld	a5,8(t1)
ffffffffc0205966:	01033983          	ld	s3,16(t1)
ffffffffc020596a:	f442                	sd	a6,40(sp)
ffffffffc020596c:	f03e                	sd	a5,32(sp)
ffffffffc020596e:	00099463          	bnez	s3,ffffffffc0205976 <stride_dequeue+0x80c>
ffffffffc0205972:	6720106f          	j	ffffffffc0206fe4 <stride_dequeue+0x1e7a>
ffffffffc0205976:	8546                	mv	a0,a7
ffffffffc0205978:	85ce                	mv	a1,s3
ffffffffc020597a:	fc1a                	sd	t1,56(sp)
ffffffffc020597c:	f846                	sd	a7,48(sp)
ffffffffc020597e:	db0ff0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc0205982:	7822                	ld	a6,40(sp)
ffffffffc0205984:	78c2                	ld	a7,48(sp)
ffffffffc0205986:	7362                	ld	t1,56(sp)
ffffffffc0205988:	01051463          	bne	a0,a6,ffffffffc0205990 <stride_dequeue+0x826>
ffffffffc020598c:	6700106f          	j	ffffffffc0206ffc <stride_dequeue+0x1e92>
ffffffffc0205990:	0109b583          	ld	a1,16(s3)
ffffffffc0205994:	0089bb03          	ld	s6,8(s3)
ffffffffc0205998:	8546                	mv	a0,a7
ffffffffc020599a:	f41a                	sd	t1,40(sp)
ffffffffc020599c:	deeff0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc02059a0:	00a9b423          	sd	a0,8(s3)
ffffffffc02059a4:	0169b823          	sd	s6,16(s3)
ffffffffc02059a8:	7322                	ld	t1,40(sp)
ffffffffc02059aa:	010c2b03          	lw	s6,16(s8)
ffffffffc02059ae:	c119                	beqz	a0,ffffffffc02059b4 <stride_dequeue+0x84a>
ffffffffc02059b0:	01353023          	sd	s3,0(a0)
ffffffffc02059b4:	7782                	ld	a5,32(sp)
ffffffffc02059b6:	01333423          	sd	s3,8(t1)
ffffffffc02059ba:	889a                	mv	a7,t1
ffffffffc02059bc:	00f33823          	sd	a5,16(t1)
ffffffffc02059c0:	0069b023          	sd	t1,0(s3)
ffffffffc02059c4:	89da                	mv	s3,s6
ffffffffc02059c6:	67e2                	ld	a5,24(sp)
ffffffffc02059c8:	011cb423          	sd	a7,8(s9)
ffffffffc02059cc:	00fcb823          	sd	a5,16(s9)
ffffffffc02059d0:	0198b023          	sd	s9,0(a7)
ffffffffc02059d4:	67c2                	ld	a5,16(sp)
ffffffffc02059d6:	01993423          	sd	s9,8(s2)
ffffffffc02059da:	00f93823          	sd	a5,16(s2)
ffffffffc02059de:	012cb023          	sd	s2,0(s9)
ffffffffc02059e2:	b8f5                	j	ffffffffc02052de <stride_dequeue+0x174>
ffffffffc02059e4:	00893783          	ld	a5,8(s2)
ffffffffc02059e8:	01093c83          	ld	s9,16(s2)
ffffffffc02059ec:	e43e                	sd	a5,8(sp)
ffffffffc02059ee:	0c0c8d63          	beqz	s9,ffffffffc0205ac8 <stride_dequeue+0x95e>
ffffffffc02059f2:	85ee                	mv	a1,s11
ffffffffc02059f4:	8566                	mv	a0,s9
ffffffffc02059f6:	d38ff0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc02059fa:	58fd                	li	a7,-1
ffffffffc02059fc:	39150063          	beq	a0,a7,ffffffffc0205d7c <stride_dequeue+0xc12>
ffffffffc0205a00:	008db783          	ld	a5,8(s11)
ffffffffc0205a04:	010db803          	ld	a6,16(s11)
ffffffffc0205a08:	e83e                	sd	a5,16(sp)
ffffffffc0205a0a:	0a080863          	beqz	a6,ffffffffc0205aba <stride_dequeue+0x950>
ffffffffc0205a0e:	85c2                	mv	a1,a6
ffffffffc0205a10:	8566                	mv	a0,s9
ffffffffc0205a12:	ec42                	sd	a6,24(sp)
ffffffffc0205a14:	d1aff0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc0205a18:	58fd                	li	a7,-1
ffffffffc0205a1a:	6862                	ld	a6,24(sp)
ffffffffc0205a1c:	7d150f63          	beq	a0,a7,ffffffffc02061fa <stride_dequeue+0x1090>
ffffffffc0205a20:	00883783          	ld	a5,8(a6)
ffffffffc0205a24:	01083303          	ld	t1,16(a6)
ffffffffc0205a28:	ec3e                	sd	a5,24(sp)
ffffffffc0205a2a:	08030063          	beqz	t1,ffffffffc0205aaa <stride_dequeue+0x940>
ffffffffc0205a2e:	859a                	mv	a1,t1
ffffffffc0205a30:	8566                	mv	a0,s9
ffffffffc0205a32:	f442                	sd	a6,40(sp)
ffffffffc0205a34:	f01a                	sd	t1,32(sp)
ffffffffc0205a36:	cf8ff0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc0205a3a:	58fd                	li	a7,-1
ffffffffc0205a3c:	7302                	ld	t1,32(sp)
ffffffffc0205a3e:	7822                	ld	a6,40(sp)
ffffffffc0205a40:	65150fe3          	beq	a0,a7,ffffffffc020689e <stride_dequeue+0x1734>
ffffffffc0205a44:	00833783          	ld	a5,8(t1)
ffffffffc0205a48:	01033983          	ld	s3,16(t1)
ffffffffc0205a4c:	f03e                	sd	a5,32(sp)
ffffffffc0205a4e:	00099463          	bnez	s3,ffffffffc0205a56 <stride_dequeue+0x8ec>
ffffffffc0205a52:	5980106f          	j	ffffffffc0206fea <stride_dequeue+0x1e80>
ffffffffc0205a56:	85ce                	mv	a1,s3
ffffffffc0205a58:	8566                	mv	a0,s9
ffffffffc0205a5a:	f81a                	sd	t1,48(sp)
ffffffffc0205a5c:	f442                	sd	a6,40(sp)
ffffffffc0205a5e:	cd0ff0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc0205a62:	58fd                	li	a7,-1
ffffffffc0205a64:	7822                	ld	a6,40(sp)
ffffffffc0205a66:	7342                	ld	t1,48(sp)
ffffffffc0205a68:	01151463          	bne	a0,a7,ffffffffc0205a70 <stride_dequeue+0x906>
ffffffffc0205a6c:	5ea0106f          	j	ffffffffc0207056 <stride_dequeue+0x1eec>
ffffffffc0205a70:	0109b583          	ld	a1,16(s3)
ffffffffc0205a74:	0089bb03          	ld	s6,8(s3)
ffffffffc0205a78:	8566                	mv	a0,s9
ffffffffc0205a7a:	f81a                	sd	t1,48(sp)
ffffffffc0205a7c:	f442                	sd	a6,40(sp)
ffffffffc0205a7e:	d0cff0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc0205a82:	00a9b423          	sd	a0,8(s3)
ffffffffc0205a86:	0169b823          	sd	s6,16(s3)
ffffffffc0205a8a:	7822                	ld	a6,40(sp)
ffffffffc0205a8c:	7342                	ld	t1,48(sp)
ffffffffc0205a8e:	010c2b03          	lw	s6,16(s8)
ffffffffc0205a92:	c119                	beqz	a0,ffffffffc0205a98 <stride_dequeue+0x92e>
ffffffffc0205a94:	01353023          	sd	s3,0(a0)
ffffffffc0205a98:	7782                	ld	a5,32(sp)
ffffffffc0205a9a:	01333423          	sd	s3,8(t1)
ffffffffc0205a9e:	8c9a                	mv	s9,t1
ffffffffc0205aa0:	00f33823          	sd	a5,16(t1)
ffffffffc0205aa4:	0069b023          	sd	t1,0(s3)
ffffffffc0205aa8:	89da                	mv	s3,s6
ffffffffc0205aaa:	67e2                	ld	a5,24(sp)
ffffffffc0205aac:	01983423          	sd	s9,8(a6)
ffffffffc0205ab0:	00f83823          	sd	a5,16(a6)
ffffffffc0205ab4:	010cb023          	sd	a6,0(s9)
ffffffffc0205ab8:	8cc2                	mv	s9,a6
ffffffffc0205aba:	67c2                	ld	a5,16(sp)
ffffffffc0205abc:	019db423          	sd	s9,8(s11)
ffffffffc0205ac0:	00fdb823          	sd	a5,16(s11)
ffffffffc0205ac4:	01bcb023          	sd	s11,0(s9)
ffffffffc0205ac8:	67a2                	ld	a5,8(sp)
ffffffffc0205aca:	01b93423          	sd	s11,8(s2)
ffffffffc0205ace:	00f93823          	sd	a5,16(s2)
ffffffffc0205ad2:	012db023          	sd	s2,0(s11)
ffffffffc0205ad6:	819ff06f          	j	ffffffffc02052ee <stride_dequeue+0x184>
ffffffffc0205ada:	008cb783          	ld	a5,8(s9)
ffffffffc0205ade:	010cba03          	ld	s4,16(s9)
ffffffffc0205ae2:	e43e                	sd	a5,8(sp)
ffffffffc0205ae4:	0c0a0d63          	beqz	s4,ffffffffc0205bbe <stride_dequeue+0xa54>
ffffffffc0205ae8:	85a6                	mv	a1,s1
ffffffffc0205aea:	8552                	mv	a0,s4
ffffffffc0205aec:	c42ff0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc0205af0:	58fd                	li	a7,-1
ffffffffc0205af2:	151500e3          	beq	a0,a7,ffffffffc0206432 <stride_dequeue+0x12c8>
ffffffffc0205af6:	649c                	ld	a5,8(s1)
ffffffffc0205af8:	0104b983          	ld	s3,16(s1)
ffffffffc0205afc:	e83e                	sd	a5,16(sp)
ffffffffc0205afe:	00099463          	bnez	s3,ffffffffc0205b06 <stride_dequeue+0x99c>
ffffffffc0205b02:	4f40106f          	j	ffffffffc0206ff6 <stride_dequeue+0x1e8c>
ffffffffc0205b06:	85ce                	mv	a1,s3
ffffffffc0205b08:	8552                	mv	a0,s4
ffffffffc0205b0a:	c24ff0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc0205b0e:	58fd                	li	a7,-1
ffffffffc0205b10:	01151463          	bne	a0,a7,ffffffffc0205b18 <stride_dequeue+0x9ae>
ffffffffc0205b14:	0b00106f          	j	ffffffffc0206bc4 <stride_dequeue+0x1a5a>
ffffffffc0205b18:	0089b783          	ld	a5,8(s3)
ffffffffc0205b1c:	0109b303          	ld	t1,16(s3)
ffffffffc0205b20:	ec3e                	sd	a5,24(sp)
ffffffffc0205b22:	08030063          	beqz	t1,ffffffffc0205ba2 <stride_dequeue+0xa38>
ffffffffc0205b26:	859a                	mv	a1,t1
ffffffffc0205b28:	8552                	mv	a0,s4
ffffffffc0205b2a:	f01a                	sd	t1,32(sp)
ffffffffc0205b2c:	c02ff0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc0205b30:	58fd                	li	a7,-1
ffffffffc0205b32:	7302                	ld	t1,32(sp)
ffffffffc0205b34:	01151463          	bne	a0,a7,ffffffffc0205b3c <stride_dequeue+0x9d2>
ffffffffc0205b38:	0130106f          	j	ffffffffc020734a <stride_dequeue+0x21e0>
ffffffffc0205b3c:	00833783          	ld	a5,8(t1)
ffffffffc0205b40:	01033e03          	ld	t3,16(t1)
ffffffffc0205b44:	f03e                	sd	a5,32(sp)
ffffffffc0205b46:	040e0663          	beqz	t3,ffffffffc0205b92 <stride_dequeue+0xa28>
ffffffffc0205b4a:	85f2                	mv	a1,t3
ffffffffc0205b4c:	8552                	mv	a0,s4
ffffffffc0205b4e:	f81a                	sd	t1,48(sp)
ffffffffc0205b50:	f472                	sd	t3,40(sp)
ffffffffc0205b52:	bdcff0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc0205b56:	58fd                	li	a7,-1
ffffffffc0205b58:	7e22                	ld	t3,40(sp)
ffffffffc0205b5a:	7342                	ld	t1,48(sp)
ffffffffc0205b5c:	01151463          	bne	a0,a7,ffffffffc0205b64 <stride_dequeue+0x9fa>
ffffffffc0205b60:	53d0106f          	j	ffffffffc020789c <stride_dequeue+0x2732>
ffffffffc0205b64:	010e3583          	ld	a1,16(t3)
ffffffffc0205b68:	8552                	mv	a0,s4
ffffffffc0205b6a:	008e3b03          	ld	s6,8(t3)
ffffffffc0205b6e:	f81a                	sd	t1,48(sp)
ffffffffc0205b70:	f472                	sd	t3,40(sp)
ffffffffc0205b72:	c18ff0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc0205b76:	7e22                	ld	t3,40(sp)
ffffffffc0205b78:	7342                	ld	t1,48(sp)
ffffffffc0205b7a:	016e3823          	sd	s6,16(t3)
ffffffffc0205b7e:	00ae3423          	sd	a0,8(t3)
ffffffffc0205b82:	010c2b03          	lw	s6,16(s8)
ffffffffc0205b86:	e119                	bnez	a0,ffffffffc0205b8c <stride_dequeue+0xa22>
ffffffffc0205b88:	76d0106f          	j	ffffffffc0207af4 <stride_dequeue+0x298a>
ffffffffc0205b8c:	01c53023          	sd	t3,0(a0)
ffffffffc0205b90:	8a72                	mv	s4,t3
ffffffffc0205b92:	7782                	ld	a5,32(sp)
ffffffffc0205b94:	01433423          	sd	s4,8(t1)
ffffffffc0205b98:	00f33823          	sd	a5,16(t1)
ffffffffc0205b9c:	006a3023          	sd	t1,0(s4)
ffffffffc0205ba0:	8a1a                	mv	s4,t1
ffffffffc0205ba2:	67e2                	ld	a5,24(sp)
ffffffffc0205ba4:	0149b423          	sd	s4,8(s3)
ffffffffc0205ba8:	00f9b823          	sd	a5,16(s3)
ffffffffc0205bac:	013a3023          	sd	s3,0(s4)
ffffffffc0205bb0:	67c2                	ld	a5,16(sp)
ffffffffc0205bb2:	0134b423          	sd	s3,8(s1)
ffffffffc0205bb6:	e89c                	sd	a5,16(s1)
ffffffffc0205bb8:	0099b023          	sd	s1,0(s3)
ffffffffc0205bbc:	89da                	mv	s3,s6
ffffffffc0205bbe:	67a2                	ld	a5,8(sp)
ffffffffc0205bc0:	009cb423          	sd	s1,8(s9)
ffffffffc0205bc4:	00fcb823          	sd	a5,16(s9)
ffffffffc0205bc8:	0194b023          	sd	s9,0(s1)
ffffffffc0205bcc:	84e6                	mv	s1,s9
ffffffffc0205bce:	b635                	j	ffffffffc02056fa <stride_dequeue+0x590>
ffffffffc0205bd0:	008db783          	ld	a5,8(s11)
ffffffffc0205bd4:	010db883          	ld	a7,16(s11)
ffffffffc0205bd8:	ec2a                	sd	a0,24(sp)
ffffffffc0205bda:	e83e                	sd	a5,16(sp)
ffffffffc0205bdc:	0a088963          	beqz	a7,ffffffffc0205c8e <stride_dequeue+0xb24>
ffffffffc0205be0:	8546                	mv	a0,a7
ffffffffc0205be2:	85d2                	mv	a1,s4
ffffffffc0205be4:	f046                	sd	a7,32(sp)
ffffffffc0205be6:	b48ff0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc0205bea:	6862                	ld	a6,24(sp)
ffffffffc0205bec:	7882                	ld	a7,32(sp)
ffffffffc0205bee:	0d050ae3          	beq	a0,a6,ffffffffc02064c2 <stride_dequeue+0x1358>
ffffffffc0205bf2:	008a3783          	ld	a5,8(s4)
ffffffffc0205bf6:	010a3983          	ld	s3,16(s4)
ffffffffc0205bfa:	f042                	sd	a6,32(sp)
ffffffffc0205bfc:	ec3e                	sd	a5,24(sp)
ffffffffc0205bfe:	00099463          	bnez	s3,ffffffffc0205c06 <stride_dequeue+0xa9c>
ffffffffc0205c02:	53e0106f          	j	ffffffffc0207140 <stride_dequeue+0x1fd6>
ffffffffc0205c06:	8546                	mv	a0,a7
ffffffffc0205c08:	85ce                	mv	a1,s3
ffffffffc0205c0a:	f446                	sd	a7,40(sp)
ffffffffc0205c0c:	b22ff0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc0205c10:	7802                	ld	a6,32(sp)
ffffffffc0205c12:	78a2                	ld	a7,40(sp)
ffffffffc0205c14:	01051463          	bne	a0,a6,ffffffffc0205c1c <stride_dequeue+0xab2>
ffffffffc0205c18:	1260106f          	j	ffffffffc0206d3e <stride_dequeue+0x1bd4>
ffffffffc0205c1c:	0089b783          	ld	a5,8(s3)
ffffffffc0205c20:	0109be03          	ld	t3,16(s3)
ffffffffc0205c24:	f442                	sd	a6,40(sp)
ffffffffc0205c26:	f03e                	sd	a5,32(sp)
ffffffffc0205c28:	040e0463          	beqz	t3,ffffffffc0205c70 <stride_dequeue+0xb06>
ffffffffc0205c2c:	85f2                	mv	a1,t3
ffffffffc0205c2e:	8546                	mv	a0,a7
ffffffffc0205c30:	fc72                	sd	t3,56(sp)
ffffffffc0205c32:	f846                	sd	a7,48(sp)
ffffffffc0205c34:	afaff0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc0205c38:	7822                	ld	a6,40(sp)
ffffffffc0205c3a:	78c2                	ld	a7,48(sp)
ffffffffc0205c3c:	7e62                	ld	t3,56(sp)
ffffffffc0205c3e:	01051463          	bne	a0,a6,ffffffffc0205c46 <stride_dequeue+0xadc>
ffffffffc0205c42:	0e70106f          	j	ffffffffc0207528 <stride_dequeue+0x23be>
ffffffffc0205c46:	010e3583          	ld	a1,16(t3)
ffffffffc0205c4a:	8546                	mv	a0,a7
ffffffffc0205c4c:	008e3b03          	ld	s6,8(t3)
ffffffffc0205c50:	f472                	sd	t3,40(sp)
ffffffffc0205c52:	b38ff0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc0205c56:	7e22                	ld	t3,40(sp)
ffffffffc0205c58:	016e3823          	sd	s6,16(t3)
ffffffffc0205c5c:	00ae3423          	sd	a0,8(t3)
ffffffffc0205c60:	010c2b03          	lw	s6,16(s8)
ffffffffc0205c64:	e119                	bnez	a0,ffffffffc0205c6a <stride_dequeue+0xb00>
ffffffffc0205c66:	1c10106f          	j	ffffffffc0207626 <stride_dequeue+0x24bc>
ffffffffc0205c6a:	01c53023          	sd	t3,0(a0)
ffffffffc0205c6e:	88f2                	mv	a7,t3
ffffffffc0205c70:	7782                	ld	a5,32(sp)
ffffffffc0205c72:	0119b423          	sd	a7,8(s3)
ffffffffc0205c76:	00f9b823          	sd	a5,16(s3)
ffffffffc0205c7a:	0138b023          	sd	s3,0(a7)
ffffffffc0205c7e:	67e2                	ld	a5,24(sp)
ffffffffc0205c80:	013a3423          	sd	s3,8(s4)
ffffffffc0205c84:	00fa3823          	sd	a5,16(s4)
ffffffffc0205c88:	0149b023          	sd	s4,0(s3)
ffffffffc0205c8c:	89da                	mv	s3,s6
ffffffffc0205c8e:	67c2                	ld	a5,16(sp)
ffffffffc0205c90:	014db423          	sd	s4,8(s11)
ffffffffc0205c94:	00fdb823          	sd	a5,16(s11)
ffffffffc0205c98:	01ba3023          	sd	s11,0(s4)
ffffffffc0205c9c:	fccff06f          	j	ffffffffc0205468 <stride_dequeue+0x2fe>
ffffffffc0205ca0:	008db783          	ld	a5,8(s11)
ffffffffc0205ca4:	010db883          	ld	a7,16(s11)
ffffffffc0205ca8:	e82a                	sd	a0,16(sp)
ffffffffc0205caa:	e43e                	sd	a5,8(sp)
ffffffffc0205cac:	0a088f63          	beqz	a7,ffffffffc0205d6a <stride_dequeue+0xc00>
ffffffffc0205cb0:	85b2                	mv	a1,a2
ffffffffc0205cb2:	8546                	mv	a0,a7
ffffffffc0205cb4:	f032                	sd	a2,32(sp)
ffffffffc0205cb6:	ec46                	sd	a7,24(sp)
ffffffffc0205cb8:	a76ff0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc0205cbc:	6842                	ld	a6,16(sp)
ffffffffc0205cbe:	68e2                	ld	a7,24(sp)
ffffffffc0205cc0:	7602                	ld	a2,32(sp)
ffffffffc0205cc2:	150506e3          	beq	a0,a6,ffffffffc020660e <stride_dequeue+0x14a4>
ffffffffc0205cc6:	661c                	ld	a5,8(a2)
ffffffffc0205cc8:	01063983          	ld	s3,16(a2)
ffffffffc0205ccc:	ec42                	sd	a6,24(sp)
ffffffffc0205cce:	e83e                	sd	a5,16(sp)
ffffffffc0205cd0:	00099463          	bnez	s3,ffffffffc0205cd8 <stride_dequeue+0xb6e>
ffffffffc0205cd4:	4660106f          	j	ffffffffc020713a <stride_dequeue+0x1fd0>
ffffffffc0205cd8:	8546                	mv	a0,a7
ffffffffc0205cda:	85ce                	mv	a1,s3
ffffffffc0205cdc:	f432                	sd	a2,40(sp)
ffffffffc0205cde:	f046                	sd	a7,32(sp)
ffffffffc0205ce0:	a4eff0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc0205ce4:	6862                	ld	a6,24(sp)
ffffffffc0205ce6:	7882                	ld	a7,32(sp)
ffffffffc0205ce8:	7622                	ld	a2,40(sp)
ffffffffc0205cea:	01051463          	bne	a0,a6,ffffffffc0205cf2 <stride_dequeue+0xb88>
ffffffffc0205cee:	0ae0106f          	j	ffffffffc0206d9c <stride_dequeue+0x1c32>
ffffffffc0205cf2:	0089b783          	ld	a5,8(s3)
ffffffffc0205cf6:	0109be03          	ld	t3,16(s3)
ffffffffc0205cfa:	f042                	sd	a6,32(sp)
ffffffffc0205cfc:	ec3e                	sd	a5,24(sp)
ffffffffc0205cfe:	040e0863          	beqz	t3,ffffffffc0205d4e <stride_dequeue+0xbe4>
ffffffffc0205d02:	85f2                	mv	a1,t3
ffffffffc0205d04:	8546                	mv	a0,a7
ffffffffc0205d06:	fc32                	sd	a2,56(sp)
ffffffffc0205d08:	f872                	sd	t3,48(sp)
ffffffffc0205d0a:	f446                	sd	a7,40(sp)
ffffffffc0205d0c:	a22ff0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc0205d10:	7662                	ld	a2,56(sp)
ffffffffc0205d12:	7802                	ld	a6,32(sp)
ffffffffc0205d14:	78a2                	ld	a7,40(sp)
ffffffffc0205d16:	f432                	sd	a2,40(sp)
ffffffffc0205d18:	7e42                	ld	t3,48(sp)
ffffffffc0205d1a:	01051463          	bne	a0,a6,ffffffffc0205d22 <stride_dequeue+0xbb8>
ffffffffc0205d1e:	6ac0106f          	j	ffffffffc02073ca <stride_dequeue+0x2260>
ffffffffc0205d22:	010e3583          	ld	a1,16(t3)
ffffffffc0205d26:	8546                	mv	a0,a7
ffffffffc0205d28:	008e3b03          	ld	s6,8(t3)
ffffffffc0205d2c:	f072                	sd	t3,32(sp)
ffffffffc0205d2e:	a5cff0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc0205d32:	7e02                	ld	t3,32(sp)
ffffffffc0205d34:	7622                	ld	a2,40(sp)
ffffffffc0205d36:	016e3823          	sd	s6,16(t3)
ffffffffc0205d3a:	00ae3423          	sd	a0,8(t3)
ffffffffc0205d3e:	010c2b03          	lw	s6,16(s8)
ffffffffc0205d42:	e119                	bnez	a0,ffffffffc0205d48 <stride_dequeue+0xbde>
ffffffffc0205d44:	1370106f          	j	ffffffffc020767a <stride_dequeue+0x2510>
ffffffffc0205d48:	01c53023          	sd	t3,0(a0)
ffffffffc0205d4c:	88f2                	mv	a7,t3
ffffffffc0205d4e:	67e2                	ld	a5,24(sp)
ffffffffc0205d50:	0119b423          	sd	a7,8(s3)
ffffffffc0205d54:	00f9b823          	sd	a5,16(s3)
ffffffffc0205d58:	0138b023          	sd	s3,0(a7)
ffffffffc0205d5c:	67c2                	ld	a5,16(sp)
ffffffffc0205d5e:	01363423          	sd	s3,8(a2)
ffffffffc0205d62:	ea1c                	sd	a5,16(a2)
ffffffffc0205d64:	00c9b023          	sd	a2,0(s3)
ffffffffc0205d68:	89da                	mv	s3,s6
ffffffffc0205d6a:	67a2                	ld	a5,8(sp)
ffffffffc0205d6c:	00cdb423          	sd	a2,8(s11)
ffffffffc0205d70:	00fdb823          	sd	a5,16(s11)
ffffffffc0205d74:	01b63023          	sd	s11,0(a2)
ffffffffc0205d78:	849ff06f          	j	ffffffffc02055c0 <stride_dequeue+0x456>
ffffffffc0205d7c:	008cb783          	ld	a5,8(s9)
ffffffffc0205d80:	010cb883          	ld	a7,16(s9)
ffffffffc0205d84:	ec2a                	sd	a0,24(sp)
ffffffffc0205d86:	e83e                	sd	a5,16(sp)
ffffffffc0205d88:	0a088963          	beqz	a7,ffffffffc0205e3a <stride_dequeue+0xcd0>
ffffffffc0205d8c:	8546                	mv	a0,a7
ffffffffc0205d8e:	85ee                	mv	a1,s11
ffffffffc0205d90:	f046                	sd	a7,32(sp)
ffffffffc0205d92:	99cff0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc0205d96:	6862                	ld	a6,24(sp)
ffffffffc0205d98:	7882                	ld	a7,32(sp)
ffffffffc0205d9a:	7d050863          	beq	a0,a6,ffffffffc020656a <stride_dequeue+0x1400>
ffffffffc0205d9e:	008db783          	ld	a5,8(s11)
ffffffffc0205da2:	010db983          	ld	s3,16(s11)
ffffffffc0205da6:	f042                	sd	a6,32(sp)
ffffffffc0205da8:	ec3e                	sd	a5,24(sp)
ffffffffc0205daa:	00099463          	bnez	s3,ffffffffc0205db2 <stride_dequeue+0xc48>
ffffffffc0205dae:	3600106f          	j	ffffffffc020710e <stride_dequeue+0x1fa4>
ffffffffc0205db2:	8546                	mv	a0,a7
ffffffffc0205db4:	85ce                	mv	a1,s3
ffffffffc0205db6:	f446                	sd	a7,40(sp)
ffffffffc0205db8:	976ff0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc0205dbc:	7802                	ld	a6,32(sp)
ffffffffc0205dbe:	78a2                	ld	a7,40(sp)
ffffffffc0205dc0:	01051463          	bne	a0,a6,ffffffffc0205dc8 <stride_dequeue+0xc5e>
ffffffffc0205dc4:	71d0006f          	j	ffffffffc0206ce0 <stride_dequeue+0x1b76>
ffffffffc0205dc8:	0089b783          	ld	a5,8(s3)
ffffffffc0205dcc:	0109be03          	ld	t3,16(s3)
ffffffffc0205dd0:	f442                	sd	a6,40(sp)
ffffffffc0205dd2:	f03e                	sd	a5,32(sp)
ffffffffc0205dd4:	040e0463          	beqz	t3,ffffffffc0205e1c <stride_dequeue+0xcb2>
ffffffffc0205dd8:	85f2                	mv	a1,t3
ffffffffc0205dda:	8546                	mv	a0,a7
ffffffffc0205ddc:	fc72                	sd	t3,56(sp)
ffffffffc0205dde:	f846                	sd	a7,48(sp)
ffffffffc0205de0:	94eff0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc0205de4:	7822                	ld	a6,40(sp)
ffffffffc0205de6:	78c2                	ld	a7,48(sp)
ffffffffc0205de8:	7e62                	ld	t3,56(sp)
ffffffffc0205dea:	01051463          	bne	a0,a6,ffffffffc0205df2 <stride_dequeue+0xc88>
ffffffffc0205dee:	60a0106f          	j	ffffffffc02073f8 <stride_dequeue+0x228e>
ffffffffc0205df2:	010e3583          	ld	a1,16(t3)
ffffffffc0205df6:	8546                	mv	a0,a7
ffffffffc0205df8:	008e3b03          	ld	s6,8(t3)
ffffffffc0205dfc:	f472                	sd	t3,40(sp)
ffffffffc0205dfe:	98cff0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc0205e02:	7e22                	ld	t3,40(sp)
ffffffffc0205e04:	016e3823          	sd	s6,16(t3)
ffffffffc0205e08:	00ae3423          	sd	a0,8(t3)
ffffffffc0205e0c:	010c2b03          	lw	s6,16(s8)
ffffffffc0205e10:	e119                	bnez	a0,ffffffffc0205e16 <stride_dequeue+0xcac>
ffffffffc0205e12:	0270106f          	j	ffffffffc0207638 <stride_dequeue+0x24ce>
ffffffffc0205e16:	01c53023          	sd	t3,0(a0)
ffffffffc0205e1a:	88f2                	mv	a7,t3
ffffffffc0205e1c:	7782                	ld	a5,32(sp)
ffffffffc0205e1e:	0119b423          	sd	a7,8(s3)
ffffffffc0205e22:	00f9b823          	sd	a5,16(s3)
ffffffffc0205e26:	0138b023          	sd	s3,0(a7)
ffffffffc0205e2a:	67e2                	ld	a5,24(sp)
ffffffffc0205e2c:	013db423          	sd	s3,8(s11)
ffffffffc0205e30:	00fdb823          	sd	a5,16(s11)
ffffffffc0205e34:	01b9b023          	sd	s11,0(s3)
ffffffffc0205e38:	89da                	mv	s3,s6
ffffffffc0205e3a:	67c2                	ld	a5,16(sp)
ffffffffc0205e3c:	01bcb423          	sd	s11,8(s9)
ffffffffc0205e40:	00fcb823          	sd	a5,16(s9)
ffffffffc0205e44:	019db023          	sd	s9,0(s11)
ffffffffc0205e48:	8de6                	mv	s11,s9
ffffffffc0205e4a:	b9bd                	j	ffffffffc0205ac8 <stride_dequeue+0x95e>
ffffffffc0205e4c:	00893783          	ld	a5,8(s2)
ffffffffc0205e50:	01093883          	ld	a7,16(s2)
ffffffffc0205e54:	f02a                	sd	a0,32(sp)
ffffffffc0205e56:	ec3e                	sd	a5,24(sp)
ffffffffc0205e58:	06088c63          	beqz	a7,ffffffffc0205ed0 <stride_dequeue+0xd66>
ffffffffc0205e5c:	85c2                	mv	a1,a6
ffffffffc0205e5e:	8546                	mv	a0,a7
ffffffffc0205e60:	f842                	sd	a6,48(sp)
ffffffffc0205e62:	f446                	sd	a7,40(sp)
ffffffffc0205e64:	8caff0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc0205e68:	7302                	ld	t1,32(sp)
ffffffffc0205e6a:	78a2                	ld	a7,40(sp)
ffffffffc0205e6c:	7842                	ld	a6,48(sp)
ffffffffc0205e6e:	2e650ee3          	beq	a0,t1,ffffffffc020696a <stride_dequeue+0x1800>
ffffffffc0205e72:	00883783          	ld	a5,8(a6)
ffffffffc0205e76:	01083983          	ld	s3,16(a6)
ffffffffc0205e7a:	f41a                	sd	t1,40(sp)
ffffffffc0205e7c:	f03e                	sd	a5,32(sp)
ffffffffc0205e7e:	64098ee3          	beqz	s3,ffffffffc0206cda <stride_dequeue+0x1b70>
ffffffffc0205e82:	8546                	mv	a0,a7
ffffffffc0205e84:	85ce                	mv	a1,s3
ffffffffc0205e86:	fc42                	sd	a6,56(sp)
ffffffffc0205e88:	f846                	sd	a7,48(sp)
ffffffffc0205e8a:	8a4ff0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc0205e8e:	7322                	ld	t1,40(sp)
ffffffffc0205e90:	78c2                	ld	a7,48(sp)
ffffffffc0205e92:	7862                	ld	a6,56(sp)
ffffffffc0205e94:	00651463          	bne	a0,t1,ffffffffc0205e9c <stride_dequeue+0xd32>
ffffffffc0205e98:	1e80106f          	j	ffffffffc0207080 <stride_dequeue+0x1f16>
ffffffffc0205e9c:	0109b583          	ld	a1,16(s3)
ffffffffc0205ea0:	0089bb03          	ld	s6,8(s3)
ffffffffc0205ea4:	8546                	mv	a0,a7
ffffffffc0205ea6:	f442                	sd	a6,40(sp)
ffffffffc0205ea8:	8e2ff0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc0205eac:	00a9b423          	sd	a0,8(s3)
ffffffffc0205eb0:	0169b823          	sd	s6,16(s3)
ffffffffc0205eb4:	7822                	ld	a6,40(sp)
ffffffffc0205eb6:	010c2b03          	lw	s6,16(s8)
ffffffffc0205eba:	c119                	beqz	a0,ffffffffc0205ec0 <stride_dequeue+0xd56>
ffffffffc0205ebc:	01353023          	sd	s3,0(a0)
ffffffffc0205ec0:	7782                	ld	a5,32(sp)
ffffffffc0205ec2:	01383423          	sd	s3,8(a6)
ffffffffc0205ec6:	00f83823          	sd	a5,16(a6)
ffffffffc0205eca:	0109b023          	sd	a6,0(s3)
ffffffffc0205ece:	89da                	mv	s3,s6
ffffffffc0205ed0:	67e2                	ld	a5,24(sp)
ffffffffc0205ed2:	01093423          	sd	a6,8(s2)
ffffffffc0205ed6:	00f93823          	sd	a5,16(s2)
ffffffffc0205eda:	01283023          	sd	s2,0(a6)
ffffffffc0205ede:	bf0ff06f          	j	ffffffffc02052ce <stride_dequeue+0x164>
ffffffffc0205ee2:	008cb783          	ld	a5,8(s9)
ffffffffc0205ee6:	010cb983          	ld	s3,16(s9)
ffffffffc0205eea:	ec2a                	sd	a0,24(sp)
ffffffffc0205eec:	e83e                	sd	a5,16(sp)
ffffffffc0205eee:	0a098763          	beqz	s3,ffffffffc0205f9c <stride_dequeue+0xe32>
ffffffffc0205ef2:	85d2                	mv	a1,s4
ffffffffc0205ef4:	854e                	mv	a0,s3
ffffffffc0205ef6:	838ff0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc0205efa:	6862                	ld	a6,24(sp)
ffffffffc0205efc:	3b050fe3          	beq	a0,a6,ffffffffc0206aba <stride_dequeue+0x1950>
ffffffffc0205f00:	008a3783          	ld	a5,8(s4)
ffffffffc0205f04:	010a3303          	ld	t1,16(s4)
ffffffffc0205f08:	f042                	sd	a6,32(sp)
ffffffffc0205f0a:	ec3e                	sd	a5,24(sp)
ffffffffc0205f0c:	08030163          	beqz	t1,ffffffffc0205f8e <stride_dequeue+0xe24>
ffffffffc0205f10:	859a                	mv	a1,t1
ffffffffc0205f12:	854e                	mv	a0,s3
ffffffffc0205f14:	f41a                	sd	t1,40(sp)
ffffffffc0205f16:	818ff0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc0205f1a:	7802                	ld	a6,32(sp)
ffffffffc0205f1c:	7322                	ld	t1,40(sp)
ffffffffc0205f1e:	01051463          	bne	a0,a6,ffffffffc0205f26 <stride_dequeue+0xdbc>
ffffffffc0205f22:	3da0106f          	j	ffffffffc02072fc <stride_dequeue+0x2192>
ffffffffc0205f26:	00833783          	ld	a5,8(t1)
ffffffffc0205f2a:	01033e03          	ld	t3,16(t1)
ffffffffc0205f2e:	fc42                	sd	a6,56(sp)
ffffffffc0205f30:	f03e                	sd	a5,32(sp)
ffffffffc0205f32:	040e0663          	beqz	t3,ffffffffc0205f7e <stride_dequeue+0xe14>
ffffffffc0205f36:	85f2                	mv	a1,t3
ffffffffc0205f38:	854e                	mv	a0,s3
ffffffffc0205f3a:	f81a                	sd	t1,48(sp)
ffffffffc0205f3c:	f472                	sd	t3,40(sp)
ffffffffc0205f3e:	ff1fe0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc0205f42:	7862                	ld	a6,56(sp)
ffffffffc0205f44:	7e22                	ld	t3,40(sp)
ffffffffc0205f46:	7342                	ld	t1,48(sp)
ffffffffc0205f48:	01051463          	bne	a0,a6,ffffffffc0205f50 <stride_dequeue+0xde6>
ffffffffc0205f4c:	0c90106f          	j	ffffffffc0207814 <stride_dequeue+0x26aa>
ffffffffc0205f50:	010e3583          	ld	a1,16(t3)
ffffffffc0205f54:	854e                	mv	a0,s3
ffffffffc0205f56:	008e3b03          	ld	s6,8(t3)
ffffffffc0205f5a:	f81a                	sd	t1,48(sp)
ffffffffc0205f5c:	f472                	sd	t3,40(sp)
ffffffffc0205f5e:	82cff0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc0205f62:	7e22                	ld	t3,40(sp)
ffffffffc0205f64:	7342                	ld	t1,48(sp)
ffffffffc0205f66:	016e3823          	sd	s6,16(t3)
ffffffffc0205f6a:	00ae3423          	sd	a0,8(t3)
ffffffffc0205f6e:	010c2b03          	lw	s6,16(s8)
ffffffffc0205f72:	e119                	bnez	a0,ffffffffc0205f78 <stride_dequeue+0xe0e>
ffffffffc0205f74:	32d0106f          	j	ffffffffc0207aa0 <stride_dequeue+0x2936>
ffffffffc0205f78:	01c53023          	sd	t3,0(a0)
ffffffffc0205f7c:	89f2                	mv	s3,t3
ffffffffc0205f7e:	7782                	ld	a5,32(sp)
ffffffffc0205f80:	01333423          	sd	s3,8(t1)
ffffffffc0205f84:	00f33823          	sd	a5,16(t1)
ffffffffc0205f88:	0069b023          	sd	t1,0(s3)
ffffffffc0205f8c:	899a                	mv	s3,t1
ffffffffc0205f8e:	67e2                	ld	a5,24(sp)
ffffffffc0205f90:	013a3423          	sd	s3,8(s4)
ffffffffc0205f94:	00fa3823          	sd	a5,16(s4)
ffffffffc0205f98:	0149b023          	sd	s4,0(s3)
ffffffffc0205f9c:	67c2                	ld	a5,16(sp)
ffffffffc0205f9e:	014cb423          	sd	s4,8(s9)
ffffffffc0205fa2:	89da                	mv	s3,s6
ffffffffc0205fa4:	00fcb823          	sd	a5,16(s9)
ffffffffc0205fa8:	019a3023          	sd	s9,0(s4)
ffffffffc0205fac:	f42ff06f          	j	ffffffffc02056ee <stride_dequeue+0x584>
ffffffffc0205fb0:	661c                	ld	a5,8(a2)
ffffffffc0205fb2:	01063983          	ld	s3,16(a2)
ffffffffc0205fb6:	e82a                	sd	a0,16(sp)
ffffffffc0205fb8:	e43e                	sd	a5,8(sp)
ffffffffc0205fba:	0a098f63          	beqz	s3,ffffffffc0206078 <stride_dequeue+0xf0e>
ffffffffc0205fbe:	85d2                	mv	a1,s4
ffffffffc0205fc0:	854e                	mv	a0,s3
ffffffffc0205fc2:	ec32                	sd	a2,24(sp)
ffffffffc0205fc4:	f6bfe0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc0205fc8:	6842                	ld	a6,16(sp)
ffffffffc0205fca:	6662                	ld	a2,24(sp)
ffffffffc0205fcc:	39050de3          	beq	a0,a6,ffffffffc0206b66 <stride_dequeue+0x19fc>
ffffffffc0205fd0:	008a3783          	ld	a5,8(s4)
ffffffffc0205fd4:	010a3303          	ld	t1,16(s4)
ffffffffc0205fd8:	ec42                	sd	a6,24(sp)
ffffffffc0205fda:	e83e                	sd	a5,16(sp)
ffffffffc0205fdc:	08030763          	beqz	t1,ffffffffc020606a <stride_dequeue+0xf00>
ffffffffc0205fe0:	859a                	mv	a1,t1
ffffffffc0205fe2:	854e                	mv	a0,s3
ffffffffc0205fe4:	f432                	sd	a2,40(sp)
ffffffffc0205fe6:	f01a                	sd	t1,32(sp)
ffffffffc0205fe8:	f47fe0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc0205fec:	6862                	ld	a6,24(sp)
ffffffffc0205fee:	7302                	ld	t1,32(sp)
ffffffffc0205ff0:	7622                	ld	a2,40(sp)
ffffffffc0205ff2:	01051463          	bne	a0,a6,ffffffffc0205ffa <stride_dequeue+0xe90>
ffffffffc0205ff6:	5060106f          	j	ffffffffc02074fc <stride_dequeue+0x2392>
ffffffffc0205ffa:	00833783          	ld	a5,8(t1)
ffffffffc0205ffe:	01033e03          	ld	t3,16(t1)
ffffffffc0206002:	fc42                	sd	a6,56(sp)
ffffffffc0206004:	ec3e                	sd	a5,24(sp)
ffffffffc0206006:	040e0a63          	beqz	t3,ffffffffc020605a <stride_dequeue+0xef0>
ffffffffc020600a:	85f2                	mv	a1,t3
ffffffffc020600c:	854e                	mv	a0,s3
ffffffffc020600e:	f81a                	sd	t1,48(sp)
ffffffffc0206010:	f432                	sd	a2,40(sp)
ffffffffc0206012:	f072                	sd	t3,32(sp)
ffffffffc0206014:	f1bfe0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc0206018:	7862                	ld	a6,56(sp)
ffffffffc020601a:	7e02                	ld	t3,32(sp)
ffffffffc020601c:	7622                	ld	a2,40(sp)
ffffffffc020601e:	7342                	ld	t1,48(sp)
ffffffffc0206020:	01051463          	bne	a0,a6,ffffffffc0206028 <stride_dequeue+0xebe>
ffffffffc0206024:	1e10106f          	j	ffffffffc0207a04 <stride_dequeue+0x289a>
ffffffffc0206028:	010e3583          	ld	a1,16(t3)
ffffffffc020602c:	854e                	mv	a0,s3
ffffffffc020602e:	008e3b03          	ld	s6,8(t3)
ffffffffc0206032:	f81a                	sd	t1,48(sp)
ffffffffc0206034:	f432                	sd	a2,40(sp)
ffffffffc0206036:	f072                	sd	t3,32(sp)
ffffffffc0206038:	f53fe0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc020603c:	7e02                	ld	t3,32(sp)
ffffffffc020603e:	7622                	ld	a2,40(sp)
ffffffffc0206040:	7342                	ld	t1,48(sp)
ffffffffc0206042:	016e3823          	sd	s6,16(t3)
ffffffffc0206046:	00ae3423          	sd	a0,8(t3)
ffffffffc020604a:	010c2b03          	lw	s6,16(s8)
ffffffffc020604e:	e119                	bnez	a0,ffffffffc0206054 <stride_dequeue+0xeea>
ffffffffc0206050:	22d0106f          	j	ffffffffc0207a7c <stride_dequeue+0x2912>
ffffffffc0206054:	01c53023          	sd	t3,0(a0)
ffffffffc0206058:	89f2                	mv	s3,t3
ffffffffc020605a:	67e2                	ld	a5,24(sp)
ffffffffc020605c:	01333423          	sd	s3,8(t1)
ffffffffc0206060:	00f33823          	sd	a5,16(t1)
ffffffffc0206064:	0069b023          	sd	t1,0(s3)
ffffffffc0206068:	899a                	mv	s3,t1
ffffffffc020606a:	67c2                	ld	a5,16(sp)
ffffffffc020606c:	013a3423          	sd	s3,8(s4)
ffffffffc0206070:	00fa3823          	sd	a5,16(s4)
ffffffffc0206074:	0149b023          	sd	s4,0(s3)
ffffffffc0206078:	67a2                	ld	a5,8(sp)
ffffffffc020607a:	01463423          	sd	s4,8(a2)
ffffffffc020607e:	89da                	mv	s3,s6
ffffffffc0206080:	ea1c                	sd	a5,16(a2)
ffffffffc0206082:	00ca3023          	sd	a2,0(s4)
ffffffffc0206086:	8a32                	mv	s4,a2
ffffffffc0206088:	f80ff06f          	j	ffffffffc0205808 <stride_dequeue+0x69e>
ffffffffc020608c:	008a3783          	ld	a5,8(s4)
ffffffffc0206090:	010a3983          	ld	s3,16(s4)
ffffffffc0206094:	ec2a                	sd	a0,24(sp)
ffffffffc0206096:	e83e                	sd	a5,16(sp)
ffffffffc0206098:	0a098763          	beqz	s3,ffffffffc0206146 <stride_dequeue+0xfdc>
ffffffffc020609c:	85e6                	mv	a1,s9
ffffffffc020609e:	854e                	mv	a0,s3
ffffffffc02060a0:	e8ffe0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc02060a4:	6862                	ld	a6,24(sp)
ffffffffc02060a6:	270505e3          	beq	a0,a6,ffffffffc0206b10 <stride_dequeue+0x19a6>
ffffffffc02060aa:	008cb783          	ld	a5,8(s9)
ffffffffc02060ae:	010cb303          	ld	t1,16(s9)
ffffffffc02060b2:	f042                	sd	a6,32(sp)
ffffffffc02060b4:	ec3e                	sd	a5,24(sp)
ffffffffc02060b6:	08030163          	beqz	t1,ffffffffc0206138 <stride_dequeue+0xfce>
ffffffffc02060ba:	859a                	mv	a1,t1
ffffffffc02060bc:	854e                	mv	a0,s3
ffffffffc02060be:	f41a                	sd	t1,40(sp)
ffffffffc02060c0:	e6ffe0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc02060c4:	7802                	ld	a6,32(sp)
ffffffffc02060c6:	7322                	ld	t1,40(sp)
ffffffffc02060c8:	01051463          	bne	a0,a6,ffffffffc02060d0 <stride_dequeue+0xf66>
ffffffffc02060cc:	4080106f          	j	ffffffffc02074d4 <stride_dequeue+0x236a>
ffffffffc02060d0:	00833783          	ld	a5,8(t1)
ffffffffc02060d4:	01033e03          	ld	t3,16(t1)
ffffffffc02060d8:	fc42                	sd	a6,56(sp)
ffffffffc02060da:	f03e                	sd	a5,32(sp)
ffffffffc02060dc:	040e0663          	beqz	t3,ffffffffc0206128 <stride_dequeue+0xfbe>
ffffffffc02060e0:	85f2                	mv	a1,t3
ffffffffc02060e2:	854e                	mv	a0,s3
ffffffffc02060e4:	f81a                	sd	t1,48(sp)
ffffffffc02060e6:	f472                	sd	t3,40(sp)
ffffffffc02060e8:	e47fe0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc02060ec:	7862                	ld	a6,56(sp)
ffffffffc02060ee:	7e22                	ld	t3,40(sp)
ffffffffc02060f0:	7342                	ld	t1,48(sp)
ffffffffc02060f2:	01051463          	bne	a0,a6,ffffffffc02060fa <stride_dequeue+0xf90>
ffffffffc02060f6:	6160106f          	j	ffffffffc020770c <stride_dequeue+0x25a2>
ffffffffc02060fa:	010e3583          	ld	a1,16(t3)
ffffffffc02060fe:	854e                	mv	a0,s3
ffffffffc0206100:	008e3b03          	ld	s6,8(t3)
ffffffffc0206104:	f81a                	sd	t1,48(sp)
ffffffffc0206106:	f472                	sd	t3,40(sp)
ffffffffc0206108:	e83fe0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc020610c:	7e22                	ld	t3,40(sp)
ffffffffc020610e:	7342                	ld	t1,48(sp)
ffffffffc0206110:	016e3823          	sd	s6,16(t3)
ffffffffc0206114:	00ae3423          	sd	a0,8(t3)
ffffffffc0206118:	010c2b03          	lw	s6,16(s8)
ffffffffc020611c:	e119                	bnez	a0,ffffffffc0206122 <stride_dequeue+0xfb8>
ffffffffc020611e:	1b30106f          	j	ffffffffc0207ad0 <stride_dequeue+0x2966>
ffffffffc0206122:	01c53023          	sd	t3,0(a0)
ffffffffc0206126:	89f2                	mv	s3,t3
ffffffffc0206128:	7782                	ld	a5,32(sp)
ffffffffc020612a:	01333423          	sd	s3,8(t1)
ffffffffc020612e:	00f33823          	sd	a5,16(t1)
ffffffffc0206132:	0069b023          	sd	t1,0(s3)
ffffffffc0206136:	899a                	mv	s3,t1
ffffffffc0206138:	67e2                	ld	a5,24(sp)
ffffffffc020613a:	013cb423          	sd	s3,8(s9)
ffffffffc020613e:	00fcb823          	sd	a5,16(s9)
ffffffffc0206142:	0199b023          	sd	s9,0(s3)
ffffffffc0206146:	67c2                	ld	a5,16(sp)
ffffffffc0206148:	019a3423          	sd	s9,8(s4)
ffffffffc020614c:	89da                	mv	s3,s6
ffffffffc020614e:	00fa3823          	sd	a5,16(s4)
ffffffffc0206152:	014cb023          	sd	s4,0(s9)
ffffffffc0206156:	8cd2                	mv	s9,s4
ffffffffc0206158:	faeff06f          	j	ffffffffc0205906 <stride_dequeue+0x79c>
ffffffffc020615c:	0088b783          	ld	a5,8(a7)
ffffffffc0206160:	0108b983          	ld	s3,16(a7)
ffffffffc0206164:	f02a                	sd	a0,32(sp)
ffffffffc0206166:	ec3e                	sd	a5,24(sp)
ffffffffc0206168:	06098e63          	beqz	s3,ffffffffc02061e4 <stride_dequeue+0x107a>
ffffffffc020616c:	85e6                	mv	a1,s9
ffffffffc020616e:	854e                	mv	a0,s3
ffffffffc0206170:	f446                	sd	a7,40(sp)
ffffffffc0206172:	dbdfe0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc0206176:	7302                	ld	t1,32(sp)
ffffffffc0206178:	78a2                	ld	a7,40(sp)
ffffffffc020617a:	486503e3          	beq	a0,t1,ffffffffc0206e00 <stride_dequeue+0x1c96>
ffffffffc020617e:	008cb783          	ld	a5,8(s9)
ffffffffc0206182:	010cbe03          	ld	t3,16(s9)
ffffffffc0206186:	f41a                	sd	t1,40(sp)
ffffffffc0206188:	f03e                	sd	a5,32(sp)
ffffffffc020618a:	040e0663          	beqz	t3,ffffffffc02061d6 <stride_dequeue+0x106c>
ffffffffc020618e:	85f2                	mv	a1,t3
ffffffffc0206190:	854e                	mv	a0,s3
ffffffffc0206192:	fc46                	sd	a7,56(sp)
ffffffffc0206194:	f872                	sd	t3,48(sp)
ffffffffc0206196:	d99fe0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc020619a:	7322                	ld	t1,40(sp)
ffffffffc020619c:	7e42                	ld	t3,48(sp)
ffffffffc020619e:	78e2                	ld	a7,56(sp)
ffffffffc02061a0:	00651463          	bne	a0,t1,ffffffffc02061a8 <stride_dequeue+0x103e>
ffffffffc02061a4:	3040106f          	j	ffffffffc02074a8 <stride_dequeue+0x233e>
ffffffffc02061a8:	010e3583          	ld	a1,16(t3)
ffffffffc02061ac:	854e                	mv	a0,s3
ffffffffc02061ae:	008e3b03          	ld	s6,8(t3)
ffffffffc02061b2:	f846                	sd	a7,48(sp)
ffffffffc02061b4:	f472                	sd	t3,40(sp)
ffffffffc02061b6:	dd5fe0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc02061ba:	7e22                	ld	t3,40(sp)
ffffffffc02061bc:	78c2                	ld	a7,48(sp)
ffffffffc02061be:	016e3823          	sd	s6,16(t3)
ffffffffc02061c2:	00ae3423          	sd	a0,8(t3)
ffffffffc02061c6:	010c2b03          	lw	s6,16(s8)
ffffffffc02061ca:	e119                	bnez	a0,ffffffffc02061d0 <stride_dequeue+0x1066>
ffffffffc02061cc:	4540106f          	j	ffffffffc0207620 <stride_dequeue+0x24b6>
ffffffffc02061d0:	01c53023          	sd	t3,0(a0)
ffffffffc02061d4:	89f2                	mv	s3,t3
ffffffffc02061d6:	7782                	ld	a5,32(sp)
ffffffffc02061d8:	013cb423          	sd	s3,8(s9)
ffffffffc02061dc:	00fcb823          	sd	a5,16(s9)
ffffffffc02061e0:	0199b023          	sd	s9,0(s3)
ffffffffc02061e4:	67e2                	ld	a5,24(sp)
ffffffffc02061e6:	0198b423          	sd	s9,8(a7)
ffffffffc02061ea:	89da                	mv	s3,s6
ffffffffc02061ec:	00f8b823          	sd	a5,16(a7)
ffffffffc02061f0:	011cb023          	sd	a7,0(s9)
ffffffffc02061f4:	8cc6                	mv	s9,a7
ffffffffc02061f6:	fdeff06f          	j	ffffffffc02059d4 <stride_dequeue+0x86a>
ffffffffc02061fa:	008cb783          	ld	a5,8(s9)
ffffffffc02061fe:	010cb983          	ld	s3,16(s9)
ffffffffc0206202:	f02a                	sd	a0,32(sp)
ffffffffc0206204:	ec3e                	sd	a5,24(sp)
ffffffffc0206206:	06098e63          	beqz	s3,ffffffffc0206282 <stride_dequeue+0x1118>
ffffffffc020620a:	85c2                	mv	a1,a6
ffffffffc020620c:	854e                	mv	a0,s3
ffffffffc020620e:	f442                	sd	a6,40(sp)
ffffffffc0206210:	d1ffe0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc0206214:	7302                	ld	t1,32(sp)
ffffffffc0206216:	7822                	ld	a6,40(sp)
ffffffffc0206218:	446506e3          	beq	a0,t1,ffffffffc0206e64 <stride_dequeue+0x1cfa>
ffffffffc020621c:	00883783          	ld	a5,8(a6)
ffffffffc0206220:	01083e03          	ld	t3,16(a6)
ffffffffc0206224:	f41a                	sd	t1,40(sp)
ffffffffc0206226:	f03e                	sd	a5,32(sp)
ffffffffc0206228:	040e0663          	beqz	t3,ffffffffc0206274 <stride_dequeue+0x110a>
ffffffffc020622c:	85f2                	mv	a1,t3
ffffffffc020622e:	854e                	mv	a0,s3
ffffffffc0206230:	fc42                	sd	a6,56(sp)
ffffffffc0206232:	f872                	sd	t3,48(sp)
ffffffffc0206234:	cfbfe0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc0206238:	7322                	ld	t1,40(sp)
ffffffffc020623a:	7e42                	ld	t3,48(sp)
ffffffffc020623c:	7862                	ld	a6,56(sp)
ffffffffc020623e:	00651463          	bne	a0,t1,ffffffffc0206246 <stride_dequeue+0x10dc>
ffffffffc0206242:	20e0106f          	j	ffffffffc0207450 <stride_dequeue+0x22e6>
ffffffffc0206246:	010e3583          	ld	a1,16(t3)
ffffffffc020624a:	854e                	mv	a0,s3
ffffffffc020624c:	008e3b03          	ld	s6,8(t3)
ffffffffc0206250:	f842                	sd	a6,48(sp)
ffffffffc0206252:	f472                	sd	t3,40(sp)
ffffffffc0206254:	d37fe0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc0206258:	7e22                	ld	t3,40(sp)
ffffffffc020625a:	7842                	ld	a6,48(sp)
ffffffffc020625c:	016e3823          	sd	s6,16(t3)
ffffffffc0206260:	00ae3423          	sd	a0,8(t3)
ffffffffc0206264:	010c2b03          	lw	s6,16(s8)
ffffffffc0206268:	e119                	bnez	a0,ffffffffc020626e <stride_dequeue+0x1104>
ffffffffc020626a:	3c80106f          	j	ffffffffc0207632 <stride_dequeue+0x24c8>
ffffffffc020626e:	01c53023          	sd	t3,0(a0)
ffffffffc0206272:	89f2                	mv	s3,t3
ffffffffc0206274:	7782                	ld	a5,32(sp)
ffffffffc0206276:	01383423          	sd	s3,8(a6)
ffffffffc020627a:	00f83823          	sd	a5,16(a6)
ffffffffc020627e:	0109b023          	sd	a6,0(s3)
ffffffffc0206282:	67e2                	ld	a5,24(sp)
ffffffffc0206284:	010cb423          	sd	a6,8(s9)
ffffffffc0206288:	89da                	mv	s3,s6
ffffffffc020628a:	00fcb823          	sd	a5,16(s9)
ffffffffc020628e:	01983023          	sd	s9,0(a6)
ffffffffc0206292:	829ff06f          	j	ffffffffc0205aba <stride_dequeue+0x950>
ffffffffc0206296:	008db783          	ld	a5,8(s11)
ffffffffc020629a:	010db983          	ld	s3,16(s11)
ffffffffc020629e:	f02a                	sd	a0,32(sp)
ffffffffc02062a0:	ec3e                	sd	a5,24(sp)
ffffffffc02062a2:	06098e63          	beqz	s3,ffffffffc020631e <stride_dequeue+0x11b4>
ffffffffc02062a6:	85c2                	mv	a1,a6
ffffffffc02062a8:	854e                	mv	a0,s3
ffffffffc02062aa:	f442                	sd	a6,40(sp)
ffffffffc02062ac:	c83fe0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc02062b0:	7302                	ld	t1,32(sp)
ffffffffc02062b2:	7822                	ld	a6,40(sp)
ffffffffc02062b4:	466506e3          	beq	a0,t1,ffffffffc0206f20 <stride_dequeue+0x1db6>
ffffffffc02062b8:	00883783          	ld	a5,8(a6)
ffffffffc02062bc:	01083e03          	ld	t3,16(a6)
ffffffffc02062c0:	f41a                	sd	t1,40(sp)
ffffffffc02062c2:	f03e                	sd	a5,32(sp)
ffffffffc02062c4:	040e0663          	beqz	t3,ffffffffc0206310 <stride_dequeue+0x11a6>
ffffffffc02062c8:	85f2                	mv	a1,t3
ffffffffc02062ca:	854e                	mv	a0,s3
ffffffffc02062cc:	fc42                	sd	a6,56(sp)
ffffffffc02062ce:	f872                	sd	t3,48(sp)
ffffffffc02062d0:	c5ffe0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc02062d4:	7322                	ld	t1,40(sp)
ffffffffc02062d6:	7e42                	ld	t3,48(sp)
ffffffffc02062d8:	7862                	ld	a6,56(sp)
ffffffffc02062da:	00651463          	bne	a0,t1,ffffffffc02062e2 <stride_dequeue+0x1178>
ffffffffc02062de:	7490006f          	j	ffffffffc0207226 <stride_dequeue+0x20bc>
ffffffffc02062e2:	010e3583          	ld	a1,16(t3)
ffffffffc02062e6:	854e                	mv	a0,s3
ffffffffc02062e8:	008e3b03          	ld	s6,8(t3)
ffffffffc02062ec:	f842                	sd	a6,48(sp)
ffffffffc02062ee:	f472                	sd	t3,40(sp)
ffffffffc02062f0:	c9bfe0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc02062f4:	7e22                	ld	t3,40(sp)
ffffffffc02062f6:	7842                	ld	a6,48(sp)
ffffffffc02062f8:	016e3823          	sd	s6,16(t3)
ffffffffc02062fc:	00ae3423          	sd	a0,8(t3)
ffffffffc0206300:	010c2b03          	lw	s6,16(s8)
ffffffffc0206304:	e119                	bnez	a0,ffffffffc020630a <stride_dequeue+0x11a0>
ffffffffc0206306:	3260106f          	j	ffffffffc020762c <stride_dequeue+0x24c2>
ffffffffc020630a:	01c53023          	sd	t3,0(a0)
ffffffffc020630e:	89f2                	mv	s3,t3
ffffffffc0206310:	7782                	ld	a5,32(sp)
ffffffffc0206312:	01383423          	sd	s3,8(a6)
ffffffffc0206316:	00f83823          	sd	a5,16(a6)
ffffffffc020631a:	0109b023          	sd	a6,0(s3)
ffffffffc020631e:	67e2                	ld	a5,24(sp)
ffffffffc0206320:	010db423          	sd	a6,8(s11)
ffffffffc0206324:	89da                	mv	s3,s6
ffffffffc0206326:	00fdb823          	sd	a5,16(s11)
ffffffffc020632a:	01b83023          	sd	s11,0(a6)
ffffffffc020632e:	92aff06f          	j	ffffffffc0205458 <stride_dequeue+0x2ee>
ffffffffc0206332:	008db783          	ld	a5,8(s11)
ffffffffc0206336:	010db983          	ld	s3,16(s11)
ffffffffc020633a:	ec2a                	sd	a0,24(sp)
ffffffffc020633c:	e83e                	sd	a5,16(sp)
ffffffffc020633e:	08098263          	beqz	s3,ffffffffc02063c2 <stride_dequeue+0x1258>
ffffffffc0206342:	85c2                	mv	a1,a6
ffffffffc0206344:	854e                	mv	a0,s3
ffffffffc0206346:	f432                	sd	a2,40(sp)
ffffffffc0206348:	f042                	sd	a6,32(sp)
ffffffffc020634a:	be5fe0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc020634e:	6362                	ld	t1,24(sp)
ffffffffc0206350:	7802                	ld	a6,32(sp)
ffffffffc0206352:	7622                	ld	a2,40(sp)
ffffffffc0206354:	426505e3          	beq	a0,t1,ffffffffc0206f7e <stride_dequeue+0x1e14>
ffffffffc0206358:	00883783          	ld	a5,8(a6)
ffffffffc020635c:	01083e03          	ld	t3,16(a6)
ffffffffc0206360:	f01a                	sd	t1,32(sp)
ffffffffc0206362:	ec3e                	sd	a5,24(sp)
ffffffffc0206364:	040e0863          	beqz	t3,ffffffffc02063b4 <stride_dequeue+0x124a>
ffffffffc0206368:	85f2                	mv	a1,t3
ffffffffc020636a:	854e                	mv	a0,s3
ffffffffc020636c:	fc42                	sd	a6,56(sp)
ffffffffc020636e:	f832                	sd	a2,48(sp)
ffffffffc0206370:	f472                	sd	t3,40(sp)
ffffffffc0206372:	bbdfe0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc0206376:	7302                	ld	t1,32(sp)
ffffffffc0206378:	7e22                	ld	t3,40(sp)
ffffffffc020637a:	7642                	ld	a2,48(sp)
ffffffffc020637c:	7862                	ld	a6,56(sp)
ffffffffc020637e:	60650fe3          	beq	a0,t1,ffffffffc020719c <stride_dequeue+0x2032>
ffffffffc0206382:	010e3583          	ld	a1,16(t3)
ffffffffc0206386:	854e                	mv	a0,s3
ffffffffc0206388:	008e3b03          	ld	s6,8(t3)
ffffffffc020638c:	f842                	sd	a6,48(sp)
ffffffffc020638e:	f432                	sd	a2,40(sp)
ffffffffc0206390:	f072                	sd	t3,32(sp)
ffffffffc0206392:	bf9fe0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc0206396:	7e02                	ld	t3,32(sp)
ffffffffc0206398:	7622                	ld	a2,40(sp)
ffffffffc020639a:	7842                	ld	a6,48(sp)
ffffffffc020639c:	016e3823          	sd	s6,16(t3)
ffffffffc02063a0:	00ae3423          	sd	a0,8(t3)
ffffffffc02063a4:	010c2b03          	lw	s6,16(s8)
ffffffffc02063a8:	e119                	bnez	a0,ffffffffc02063ae <stride_dequeue+0x1244>
ffffffffc02063aa:	2d60106f          	j	ffffffffc0207680 <stride_dequeue+0x2516>
ffffffffc02063ae:	01c53023          	sd	t3,0(a0)
ffffffffc02063b2:	89f2                	mv	s3,t3
ffffffffc02063b4:	67e2                	ld	a5,24(sp)
ffffffffc02063b6:	01383423          	sd	s3,8(a6)
ffffffffc02063ba:	00f83823          	sd	a5,16(a6)
ffffffffc02063be:	0109b023          	sd	a6,0(s3)
ffffffffc02063c2:	67c2                	ld	a5,16(sp)
ffffffffc02063c4:	010db423          	sd	a6,8(s11)
ffffffffc02063c8:	89da                	mv	s3,s6
ffffffffc02063ca:	00fdb823          	sd	a5,16(s11)
ffffffffc02063ce:	01b83023          	sd	s11,0(a6)
ffffffffc02063d2:	9e0ff06f          	j	ffffffffc02055b2 <stride_dequeue+0x448>
ffffffffc02063d6:	00893703          	ld	a4,8(s2)
ffffffffc02063da:	01093983          	ld	s3,16(s2)
ffffffffc02063de:	f42a                	sd	a0,40(sp)
ffffffffc02063e0:	f03a                	sd	a4,32(sp)
ffffffffc02063e2:	02098e63          	beqz	s3,ffffffffc020641e <stride_dequeue+0x12b4>
ffffffffc02063e6:	85be                	mv	a1,a5
ffffffffc02063e8:	854e                	mv	a0,s3
ffffffffc02063ea:	fc42                	sd	a6,56(sp)
ffffffffc02063ec:	f83e                	sd	a5,48(sp)
ffffffffc02063ee:	b41fe0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc02063f2:	7e22                	ld	t3,40(sp)
ffffffffc02063f4:	77c2                	ld	a5,48(sp)
ffffffffc02063f6:	7862                	ld	a6,56(sp)
ffffffffc02063f8:	43c509e3          	beq	a0,t3,ffffffffc020702a <stride_dequeue+0x1ec0>
ffffffffc02063fc:	6b8c                	ld	a1,16(a5)
ffffffffc02063fe:	854e                	mv	a0,s3
ffffffffc0206400:	0087bb03          	ld	s6,8(a5)
ffffffffc0206404:	f842                	sd	a6,48(sp)
ffffffffc0206406:	f43e                	sd	a5,40(sp)
ffffffffc0206408:	b83fe0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc020640c:	77a2                	ld	a5,40(sp)
ffffffffc020640e:	7842                	ld	a6,48(sp)
ffffffffc0206410:	0167b823          	sd	s6,16(a5)
ffffffffc0206414:	e788                	sd	a0,8(a5)
ffffffffc0206416:	010c2b03          	lw	s6,16(s8)
ffffffffc020641a:	c111                	beqz	a0,ffffffffc020641e <stride_dequeue+0x12b4>
ffffffffc020641c:	e11c                	sd	a5,0(a0)
ffffffffc020641e:	7702                	ld	a4,32(sp)
ffffffffc0206420:	00f93423          	sd	a5,8(s2)
ffffffffc0206424:	89da                	mv	s3,s6
ffffffffc0206426:	00e93823          	sd	a4,16(s2)
ffffffffc020642a:	0127b023          	sd	s2,0(a5)
ffffffffc020642e:	e91fe06f          	j	ffffffffc02052be <stride_dequeue+0x154>
ffffffffc0206432:	008a3783          	ld	a5,8(s4)
ffffffffc0206436:	010a3983          	ld	s3,16(s4)
ffffffffc020643a:	ec2a                	sd	a0,24(sp)
ffffffffc020643c:	e83e                	sd	a5,16(sp)
ffffffffc020643e:	5a098ce3          	beqz	s3,ffffffffc02071f6 <stride_dequeue+0x208c>
ffffffffc0206442:	85a6                	mv	a1,s1
ffffffffc0206444:	854e                	mv	a0,s3
ffffffffc0206446:	ae9fe0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc020644a:	67e2                	ld	a5,24(sp)
ffffffffc020644c:	50f500e3          	beq	a0,a5,ffffffffc020714c <stride_dequeue+0x1fe2>
ffffffffc0206450:	f43e                	sd	a5,40(sp)
ffffffffc0206452:	649c                	ld	a5,8(s1)
ffffffffc0206454:	0104b883          	ld	a7,16(s1)
ffffffffc0206458:	ec3e                	sd	a5,24(sp)
ffffffffc020645a:	04088263          	beqz	a7,ffffffffc020649e <stride_dequeue+0x1334>
ffffffffc020645e:	85c6                	mv	a1,a7
ffffffffc0206460:	854e                	mv	a0,s3
ffffffffc0206462:	f046                	sd	a7,32(sp)
ffffffffc0206464:	acbfe0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc0206468:	77a2                	ld	a5,40(sp)
ffffffffc020646a:	7882                	ld	a7,32(sp)
ffffffffc020646c:	00f51463          	bne	a0,a5,ffffffffc0206474 <stride_dequeue+0x130a>
ffffffffc0206470:	2160106f          	j	ffffffffc0207686 <stride_dequeue+0x251c>
ffffffffc0206474:	0108b583          	ld	a1,16(a7)
ffffffffc0206478:	854e                	mv	a0,s3
ffffffffc020647a:	0088bb03          	ld	s6,8(a7)
ffffffffc020647e:	f046                	sd	a7,32(sp)
ffffffffc0206480:	b0bfe0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc0206484:	7882                	ld	a7,32(sp)
ffffffffc0206486:	0168b823          	sd	s6,16(a7)
ffffffffc020648a:	00a8b423          	sd	a0,8(a7)
ffffffffc020648e:	010c2b03          	lw	s6,16(s8)
ffffffffc0206492:	e119                	bnez	a0,ffffffffc0206498 <stride_dequeue+0x132e>
ffffffffc0206494:	56a0106f          	j	ffffffffc02079fe <stride_dequeue+0x2894>
ffffffffc0206498:	01153023          	sd	a7,0(a0)
ffffffffc020649c:	89c6                	mv	s3,a7
ffffffffc020649e:	67e2                	ld	a5,24(sp)
ffffffffc02064a0:	0134b423          	sd	s3,8(s1)
ffffffffc02064a4:	e89c                	sd	a5,16(s1)
ffffffffc02064a6:	0099b023          	sd	s1,0(s3)
ffffffffc02064aa:	89a6                	mv	s3,s1
ffffffffc02064ac:	67c2                	ld	a5,16(sp)
ffffffffc02064ae:	013a3423          	sd	s3,8(s4)
ffffffffc02064b2:	84d2                	mv	s1,s4
ffffffffc02064b4:	00fa3823          	sd	a5,16(s4)
ffffffffc02064b8:	0149b023          	sd	s4,0(s3)
ffffffffc02064bc:	89da                	mv	s3,s6
ffffffffc02064be:	f00ff06f          	j	ffffffffc0205bbe <stride_dequeue+0xa54>
ffffffffc02064c2:	0088b783          	ld	a5,8(a7)
ffffffffc02064c6:	0108b983          	ld	s3,16(a7)
ffffffffc02064ca:	f02a                	sd	a0,32(sp)
ffffffffc02064cc:	ec3e                	sd	a5,24(sp)
ffffffffc02064ce:	00099463          	bnez	s3,ffffffffc02064d6 <stride_dequeue+0x136c>
ffffffffc02064d2:	0d40106f          	j	ffffffffc02075a6 <stride_dequeue+0x243c>
ffffffffc02064d6:	85d2                	mv	a1,s4
ffffffffc02064d8:	854e                	mv	a0,s3
ffffffffc02064da:	f446                	sd	a7,40(sp)
ffffffffc02064dc:	a53fe0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc02064e0:	7302                	ld	t1,32(sp)
ffffffffc02064e2:	78a2                	ld	a7,40(sp)
ffffffffc02064e4:	00651463          	bne	a0,t1,ffffffffc02064ec <stride_dequeue+0x1382>
ffffffffc02064e8:	06c0106f          	j	ffffffffc0207554 <stride_dequeue+0x23ea>
ffffffffc02064ec:	008a3783          	ld	a5,8(s4)
ffffffffc02064f0:	010a3e03          	ld	t3,16(s4)
ffffffffc02064f4:	fc1a                	sd	t1,56(sp)
ffffffffc02064f6:	f03e                	sd	a5,32(sp)
ffffffffc02064f8:	040e0663          	beqz	t3,ffffffffc0206544 <stride_dequeue+0x13da>
ffffffffc02064fc:	85f2                	mv	a1,t3
ffffffffc02064fe:	854e                	mv	a0,s3
ffffffffc0206500:	f846                	sd	a7,48(sp)
ffffffffc0206502:	f472                	sd	t3,40(sp)
ffffffffc0206504:	a2bfe0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc0206508:	7362                	ld	t1,56(sp)
ffffffffc020650a:	7e22                	ld	t3,40(sp)
ffffffffc020650c:	78c2                	ld	a7,48(sp)
ffffffffc020650e:	00651463          	bne	a0,t1,ffffffffc0206516 <stride_dequeue+0x13ac>
ffffffffc0206512:	32e0106f          	j	ffffffffc0207840 <stride_dequeue+0x26d6>
ffffffffc0206516:	010e3583          	ld	a1,16(t3)
ffffffffc020651a:	854e                	mv	a0,s3
ffffffffc020651c:	008e3b03          	ld	s6,8(t3)
ffffffffc0206520:	f846                	sd	a7,48(sp)
ffffffffc0206522:	f472                	sd	t3,40(sp)
ffffffffc0206524:	a67fe0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc0206528:	7e22                	ld	t3,40(sp)
ffffffffc020652a:	78c2                	ld	a7,48(sp)
ffffffffc020652c:	016e3823          	sd	s6,16(t3)
ffffffffc0206530:	00ae3423          	sd	a0,8(t3)
ffffffffc0206534:	010c2b03          	lw	s6,16(s8)
ffffffffc0206538:	e119                	bnez	a0,ffffffffc020653e <stride_dequeue+0x13d4>
ffffffffc020653a:	58a0106f          	j	ffffffffc0207ac4 <stride_dequeue+0x295a>
ffffffffc020653e:	01c53023          	sd	t3,0(a0)
ffffffffc0206542:	89f2                	mv	s3,t3
ffffffffc0206544:	7782                	ld	a5,32(sp)
ffffffffc0206546:	013a3423          	sd	s3,8(s4)
ffffffffc020654a:	00fa3823          	sd	a5,16(s4)
ffffffffc020654e:	0149b023          	sd	s4,0(s3)
ffffffffc0206552:	89d2                	mv	s3,s4
ffffffffc0206554:	67e2                	ld	a5,24(sp)
ffffffffc0206556:	0138b423          	sd	s3,8(a7)
ffffffffc020655a:	8a46                	mv	s4,a7
ffffffffc020655c:	00f8b823          	sd	a5,16(a7)
ffffffffc0206560:	0119b023          	sd	a7,0(s3)
ffffffffc0206564:	89da                	mv	s3,s6
ffffffffc0206566:	f28ff06f          	j	ffffffffc0205c8e <stride_dequeue+0xb24>
ffffffffc020656a:	0088b783          	ld	a5,8(a7)
ffffffffc020656e:	0108b983          	ld	s3,16(a7)
ffffffffc0206572:	f02a                	sd	a0,32(sp)
ffffffffc0206574:	ec3e                	sd	a5,24(sp)
ffffffffc0206576:	00099463          	bnez	s3,ffffffffc020657e <stride_dequeue+0x1414>
ffffffffc020657a:	0320106f          	j	ffffffffc02075ac <stride_dequeue+0x2442>
ffffffffc020657e:	85ee                	mv	a1,s11
ffffffffc0206580:	854e                	mv	a0,s3
ffffffffc0206582:	f446                	sd	a7,40(sp)
ffffffffc0206584:	9abfe0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc0206588:	7302                	ld	t1,32(sp)
ffffffffc020658a:	78a2                	ld	a7,40(sp)
ffffffffc020658c:	466508e3          	beq	a0,t1,ffffffffc02071fc <stride_dequeue+0x2092>
ffffffffc0206590:	008db783          	ld	a5,8(s11)
ffffffffc0206594:	010dbe03          	ld	t3,16(s11)
ffffffffc0206598:	fc1a                	sd	t1,56(sp)
ffffffffc020659a:	f03e                	sd	a5,32(sp)
ffffffffc020659c:	040e0663          	beqz	t3,ffffffffc02065e8 <stride_dequeue+0x147e>
ffffffffc02065a0:	85f2                	mv	a1,t3
ffffffffc02065a2:	854e                	mv	a0,s3
ffffffffc02065a4:	f846                	sd	a7,48(sp)
ffffffffc02065a6:	f472                	sd	t3,40(sp)
ffffffffc02065a8:	987fe0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc02065ac:	7362                	ld	t1,56(sp)
ffffffffc02065ae:	7e22                	ld	t3,40(sp)
ffffffffc02065b0:	78c2                	ld	a7,48(sp)
ffffffffc02065b2:	00651463          	bne	a0,t1,ffffffffc02065ba <stride_dequeue+0x1450>
ffffffffc02065b6:	3120106f          	j	ffffffffc02078c8 <stride_dequeue+0x275e>
ffffffffc02065ba:	010e3583          	ld	a1,16(t3)
ffffffffc02065be:	854e                	mv	a0,s3
ffffffffc02065c0:	008e3b03          	ld	s6,8(t3)
ffffffffc02065c4:	f846                	sd	a7,48(sp)
ffffffffc02065c6:	f472                	sd	t3,40(sp)
ffffffffc02065c8:	9c3fe0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc02065cc:	7e22                	ld	t3,40(sp)
ffffffffc02065ce:	78c2                	ld	a7,48(sp)
ffffffffc02065d0:	016e3823          	sd	s6,16(t3)
ffffffffc02065d4:	00ae3423          	sd	a0,8(t3)
ffffffffc02065d8:	010c2b03          	lw	s6,16(s8)
ffffffffc02065dc:	e119                	bnez	a0,ffffffffc02065e2 <stride_dequeue+0x1478>
ffffffffc02065de:	51c0106f          	j	ffffffffc0207afa <stride_dequeue+0x2990>
ffffffffc02065e2:	01c53023          	sd	t3,0(a0)
ffffffffc02065e6:	89f2                	mv	s3,t3
ffffffffc02065e8:	7782                	ld	a5,32(sp)
ffffffffc02065ea:	013db423          	sd	s3,8(s11)
ffffffffc02065ee:	00fdb823          	sd	a5,16(s11)
ffffffffc02065f2:	01b9b023          	sd	s11,0(s3)
ffffffffc02065f6:	89ee                	mv	s3,s11
ffffffffc02065f8:	67e2                	ld	a5,24(sp)
ffffffffc02065fa:	0138b423          	sd	s3,8(a7)
ffffffffc02065fe:	8dc6                	mv	s11,a7
ffffffffc0206600:	00f8b823          	sd	a5,16(a7)
ffffffffc0206604:	0119b023          	sd	a7,0(s3)
ffffffffc0206608:	89da                	mv	s3,s6
ffffffffc020660a:	831ff06f          	j	ffffffffc0205e3a <stride_dequeue+0xcd0>
ffffffffc020660e:	0088b783          	ld	a5,8(a7)
ffffffffc0206612:	0108b983          	ld	s3,16(a7)
ffffffffc0206616:	ec2a                	sd	a0,24(sp)
ffffffffc0206618:	e83e                	sd	a5,16(sp)
ffffffffc020661a:	00099463          	bnez	s3,ffffffffc0206622 <stride_dequeue+0x14b8>
ffffffffc020661e:	7a10006f          	j	ffffffffc02075be <stride_dequeue+0x2454>
ffffffffc0206622:	85b2                	mv	a1,a2
ffffffffc0206624:	854e                	mv	a0,s3
ffffffffc0206626:	f446                	sd	a7,40(sp)
ffffffffc0206628:	907fe0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc020662c:	6362                	ld	t1,24(sp)
ffffffffc020662e:	7602                	ld	a2,32(sp)
ffffffffc0206630:	78a2                	ld	a7,40(sp)
ffffffffc0206632:	426500e3          	beq	a0,t1,ffffffffc0207252 <stride_dequeue+0x20e8>
ffffffffc0206636:	661c                	ld	a5,8(a2)
ffffffffc0206638:	01063e03          	ld	t3,16(a2)
ffffffffc020663c:	fc1a                	sd	t1,56(sp)
ffffffffc020663e:	ec3e                	sd	a5,24(sp)
ffffffffc0206640:	040e0a63          	beqz	t3,ffffffffc0206694 <stride_dequeue+0x152a>
ffffffffc0206644:	85f2                	mv	a1,t3
ffffffffc0206646:	854e                	mv	a0,s3
ffffffffc0206648:	f846                	sd	a7,48(sp)
ffffffffc020664a:	f432                	sd	a2,40(sp)
ffffffffc020664c:	f072                	sd	t3,32(sp)
ffffffffc020664e:	8e1fe0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc0206652:	7362                	ld	t1,56(sp)
ffffffffc0206654:	7e02                	ld	t3,32(sp)
ffffffffc0206656:	7622                	ld	a2,40(sp)
ffffffffc0206658:	78c2                	ld	a7,48(sp)
ffffffffc020665a:	00651463          	bne	a0,t1,ffffffffc0206662 <stride_dequeue+0x14f8>
ffffffffc020665e:	20e0106f          	j	ffffffffc020786c <stride_dequeue+0x2702>
ffffffffc0206662:	010e3583          	ld	a1,16(t3)
ffffffffc0206666:	854e                	mv	a0,s3
ffffffffc0206668:	008e3b03          	ld	s6,8(t3)
ffffffffc020666c:	f846                	sd	a7,48(sp)
ffffffffc020666e:	f432                	sd	a2,40(sp)
ffffffffc0206670:	f072                	sd	t3,32(sp)
ffffffffc0206672:	919fe0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc0206676:	7e02                	ld	t3,32(sp)
ffffffffc0206678:	7622                	ld	a2,40(sp)
ffffffffc020667a:	78c2                	ld	a7,48(sp)
ffffffffc020667c:	016e3823          	sd	s6,16(t3)
ffffffffc0206680:	00ae3423          	sd	a0,8(t3)
ffffffffc0206684:	010c2b03          	lw	s6,16(s8)
ffffffffc0206688:	e119                	bnez	a0,ffffffffc020668e <stride_dequeue+0x1524>
ffffffffc020668a:	4400106f          	j	ffffffffc0207aca <stride_dequeue+0x2960>
ffffffffc020668e:	01c53023          	sd	t3,0(a0)
ffffffffc0206692:	89f2                	mv	s3,t3
ffffffffc0206694:	67e2                	ld	a5,24(sp)
ffffffffc0206696:	01363423          	sd	s3,8(a2)
ffffffffc020669a:	ea1c                	sd	a5,16(a2)
ffffffffc020669c:	00c9b023          	sd	a2,0(s3)
ffffffffc02066a0:	89b2                	mv	s3,a2
ffffffffc02066a2:	67c2                	ld	a5,16(sp)
ffffffffc02066a4:	0138b423          	sd	s3,8(a7)
ffffffffc02066a8:	8646                	mv	a2,a7
ffffffffc02066aa:	00f8b823          	sd	a5,16(a7)
ffffffffc02066ae:	0119b023          	sd	a7,0(s3)
ffffffffc02066b2:	89da                	mv	s3,s6
ffffffffc02066b4:	eb6ff06f          	j	ffffffffc0205d6a <stride_dequeue+0xc00>
ffffffffc02066b8:	008cb783          	ld	a5,8(s9)
ffffffffc02066bc:	010cb983          	ld	s3,16(s9)
ffffffffc02066c0:	f02a                	sd	a0,32(sp)
ffffffffc02066c2:	ec3e                	sd	a5,24(sp)
ffffffffc02066c4:	00099463          	bnez	s3,ffffffffc02066cc <stride_dequeue+0x1562>
ffffffffc02066c8:	6eb0006f          	j	ffffffffc02075b2 <stride_dequeue+0x2448>
ffffffffc02066cc:	85c2                	mv	a1,a6
ffffffffc02066ce:	854e                	mv	a0,s3
ffffffffc02066d0:	f442                	sd	a6,40(sp)
ffffffffc02066d2:	85dfe0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc02066d6:	7302                	ld	t1,32(sp)
ffffffffc02066d8:	7822                	ld	a6,40(sp)
ffffffffc02066da:	3e650ee3          	beq	a0,t1,ffffffffc02072d6 <stride_dequeue+0x216c>
ffffffffc02066de:	00883783          	ld	a5,8(a6)
ffffffffc02066e2:	01083e03          	ld	t3,16(a6)
ffffffffc02066e6:	fc1a                	sd	t1,56(sp)
ffffffffc02066e8:	f03e                	sd	a5,32(sp)
ffffffffc02066ea:	040e0663          	beqz	t3,ffffffffc0206736 <stride_dequeue+0x15cc>
ffffffffc02066ee:	85f2                	mv	a1,t3
ffffffffc02066f0:	854e                	mv	a0,s3
ffffffffc02066f2:	f842                	sd	a6,48(sp)
ffffffffc02066f4:	f472                	sd	t3,40(sp)
ffffffffc02066f6:	839fe0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc02066fa:	7362                	ld	t1,56(sp)
ffffffffc02066fc:	7e22                	ld	t3,40(sp)
ffffffffc02066fe:	7842                	ld	a6,48(sp)
ffffffffc0206700:	00651463          	bne	a0,t1,ffffffffc0206708 <stride_dequeue+0x159e>
ffffffffc0206704:	2a20106f          	j	ffffffffc02079a6 <stride_dequeue+0x283c>
ffffffffc0206708:	010e3583          	ld	a1,16(t3)
ffffffffc020670c:	854e                	mv	a0,s3
ffffffffc020670e:	008e3b03          	ld	s6,8(t3)
ffffffffc0206712:	f842                	sd	a6,48(sp)
ffffffffc0206714:	f472                	sd	t3,40(sp)
ffffffffc0206716:	875fe0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc020671a:	7e22                	ld	t3,40(sp)
ffffffffc020671c:	7842                	ld	a6,48(sp)
ffffffffc020671e:	016e3823          	sd	s6,16(t3)
ffffffffc0206722:	00ae3423          	sd	a0,8(t3)
ffffffffc0206726:	010c2b03          	lw	s6,16(s8)
ffffffffc020672a:	e119                	bnez	a0,ffffffffc0206730 <stride_dequeue+0x15c6>
ffffffffc020672c:	35c0106f          	j	ffffffffc0207a88 <stride_dequeue+0x291e>
ffffffffc0206730:	01c53023          	sd	t3,0(a0)
ffffffffc0206734:	89f2                	mv	s3,t3
ffffffffc0206736:	7782                	ld	a5,32(sp)
ffffffffc0206738:	01383423          	sd	s3,8(a6)
ffffffffc020673c:	00f83823          	sd	a5,16(a6)
ffffffffc0206740:	0109b023          	sd	a6,0(s3)
ffffffffc0206744:	89c2                	mv	s3,a6
ffffffffc0206746:	67e2                	ld	a5,24(sp)
ffffffffc0206748:	013cb423          	sd	s3,8(s9)
ffffffffc020674c:	00fcb823          	sd	a5,16(s9)
ffffffffc0206750:	0199b023          	sd	s9,0(s3)
ffffffffc0206754:	89da                	mv	s3,s6
ffffffffc0206756:	f89fe06f          	j	ffffffffc02056de <stride_dequeue+0x574>
ffffffffc020675a:	661c                	ld	a5,8(a2)
ffffffffc020675c:	01063983          	ld	s3,16(a2)
ffffffffc0206760:	ec2a                	sd	a0,24(sp)
ffffffffc0206762:	e83e                	sd	a5,16(sp)
ffffffffc0206764:	64098ae3          	beqz	s3,ffffffffc02075b8 <stride_dequeue+0x244e>
ffffffffc0206768:	85c2                	mv	a1,a6
ffffffffc020676a:	854e                	mv	a0,s3
ffffffffc020676c:	f432                	sd	a2,40(sp)
ffffffffc020676e:	f042                	sd	a6,32(sp)
ffffffffc0206770:	fbefe0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc0206774:	6362                	ld	t1,24(sp)
ffffffffc0206776:	7802                	ld	a6,32(sp)
ffffffffc0206778:	7622                	ld	a2,40(sp)
ffffffffc020677a:	326509e3          	beq	a0,t1,ffffffffc02072ac <stride_dequeue+0x2142>
ffffffffc020677e:	00883783          	ld	a5,8(a6)
ffffffffc0206782:	01083e03          	ld	t3,16(a6)
ffffffffc0206786:	fc1a                	sd	t1,56(sp)
ffffffffc0206788:	ec3e                	sd	a5,24(sp)
ffffffffc020678a:	040e0a63          	beqz	t3,ffffffffc02067de <stride_dequeue+0x1674>
ffffffffc020678e:	85f2                	mv	a1,t3
ffffffffc0206790:	854e                	mv	a0,s3
ffffffffc0206792:	f842                	sd	a6,48(sp)
ffffffffc0206794:	f432                	sd	a2,40(sp)
ffffffffc0206796:	f072                	sd	t3,32(sp)
ffffffffc0206798:	f96fe0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc020679c:	7362                	ld	t1,56(sp)
ffffffffc020679e:	7e02                	ld	t3,32(sp)
ffffffffc02067a0:	7622                	ld	a2,40(sp)
ffffffffc02067a2:	7842                	ld	a6,48(sp)
ffffffffc02067a4:	00651463          	bne	a0,t1,ffffffffc02067ac <stride_dequeue+0x1642>
ffffffffc02067a8:	1760106f          	j	ffffffffc020791e <stride_dequeue+0x27b4>
ffffffffc02067ac:	010e3583          	ld	a1,16(t3)
ffffffffc02067b0:	854e                	mv	a0,s3
ffffffffc02067b2:	008e3b03          	ld	s6,8(t3)
ffffffffc02067b6:	f842                	sd	a6,48(sp)
ffffffffc02067b8:	f432                	sd	a2,40(sp)
ffffffffc02067ba:	f072                	sd	t3,32(sp)
ffffffffc02067bc:	fcefe0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc02067c0:	7e02                	ld	t3,32(sp)
ffffffffc02067c2:	7622                	ld	a2,40(sp)
ffffffffc02067c4:	7842                	ld	a6,48(sp)
ffffffffc02067c6:	016e3823          	sd	s6,16(t3)
ffffffffc02067ca:	00ae3423          	sd	a0,8(t3)
ffffffffc02067ce:	010c2b03          	lw	s6,16(s8)
ffffffffc02067d2:	e119                	bnez	a0,ffffffffc02067d8 <stride_dequeue+0x166e>
ffffffffc02067d4:	32c0106f          	j	ffffffffc0207b00 <stride_dequeue+0x2996>
ffffffffc02067d8:	01c53023          	sd	t3,0(a0)
ffffffffc02067dc:	89f2                	mv	s3,t3
ffffffffc02067de:	67e2                	ld	a5,24(sp)
ffffffffc02067e0:	01383423          	sd	s3,8(a6)
ffffffffc02067e4:	00f83823          	sd	a5,16(a6)
ffffffffc02067e8:	0109b023          	sd	a6,0(s3)
ffffffffc02067ec:	89c2                	mv	s3,a6
ffffffffc02067ee:	67c2                	ld	a5,16(sp)
ffffffffc02067f0:	01363423          	sd	s3,8(a2)
ffffffffc02067f4:	ea1c                	sd	a5,16(a2)
ffffffffc02067f6:	00c9b023          	sd	a2,0(s3)
ffffffffc02067fa:	89da                	mv	s3,s6
ffffffffc02067fc:	ffffe06f          	j	ffffffffc02057fa <stride_dequeue+0x690>
ffffffffc0206800:	008a3783          	ld	a5,8(s4)
ffffffffc0206804:	010a3983          	ld	s3,16(s4)
ffffffffc0206808:	f02a                	sd	a0,32(sp)
ffffffffc020680a:	ec3e                	sd	a5,24(sp)
ffffffffc020680c:	5a098ce3          	beqz	s3,ffffffffc02075c4 <stride_dequeue+0x245a>
ffffffffc0206810:	85c2                	mv	a1,a6
ffffffffc0206812:	854e                	mv	a0,s3
ffffffffc0206814:	f442                	sd	a6,40(sp)
ffffffffc0206816:	f18fe0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc020681a:	7302                	ld	t1,32(sp)
ffffffffc020681c:	7822                	ld	a6,40(sp)
ffffffffc020681e:	566501e3          	beq	a0,t1,ffffffffc0207580 <stride_dequeue+0x2416>
ffffffffc0206822:	00883783          	ld	a5,8(a6)
ffffffffc0206826:	01083e03          	ld	t3,16(a6)
ffffffffc020682a:	fc1a                	sd	t1,56(sp)
ffffffffc020682c:	f03e                	sd	a5,32(sp)
ffffffffc020682e:	040e0663          	beqz	t3,ffffffffc020687a <stride_dequeue+0x1710>
ffffffffc0206832:	85f2                	mv	a1,t3
ffffffffc0206834:	854e                	mv	a0,s3
ffffffffc0206836:	f842                	sd	a6,48(sp)
ffffffffc0206838:	f472                	sd	t3,40(sp)
ffffffffc020683a:	ef4fe0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc020683e:	7362                	ld	t1,56(sp)
ffffffffc0206840:	7e22                	ld	t3,40(sp)
ffffffffc0206842:	7842                	ld	a6,48(sp)
ffffffffc0206844:	00651463          	bne	a0,t1,ffffffffc020684c <stride_dequeue+0x16e2>
ffffffffc0206848:	18a0106f          	j	ffffffffc02079d2 <stride_dequeue+0x2868>
ffffffffc020684c:	010e3583          	ld	a1,16(t3)
ffffffffc0206850:	854e                	mv	a0,s3
ffffffffc0206852:	008e3b03          	ld	s6,8(t3)
ffffffffc0206856:	f842                	sd	a6,48(sp)
ffffffffc0206858:	f472                	sd	t3,40(sp)
ffffffffc020685a:	f30fe0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc020685e:	7e22                	ld	t3,40(sp)
ffffffffc0206860:	7842                	ld	a6,48(sp)
ffffffffc0206862:	016e3823          	sd	s6,16(t3)
ffffffffc0206866:	00ae3423          	sd	a0,8(t3)
ffffffffc020686a:	010c2b03          	lw	s6,16(s8)
ffffffffc020686e:	e119                	bnez	a0,ffffffffc0206874 <stride_dequeue+0x170a>
ffffffffc0206870:	1ee0106f          	j	ffffffffc0207a5e <stride_dequeue+0x28f4>
ffffffffc0206874:	01c53023          	sd	t3,0(a0)
ffffffffc0206878:	89f2                	mv	s3,t3
ffffffffc020687a:	7782                	ld	a5,32(sp)
ffffffffc020687c:	01383423          	sd	s3,8(a6)
ffffffffc0206880:	00f83823          	sd	a5,16(a6)
ffffffffc0206884:	0109b023          	sd	a6,0(s3)
ffffffffc0206888:	89c2                	mv	s3,a6
ffffffffc020688a:	67e2                	ld	a5,24(sp)
ffffffffc020688c:	013a3423          	sd	s3,8(s4)
ffffffffc0206890:	00fa3823          	sd	a5,16(s4)
ffffffffc0206894:	0149b023          	sd	s4,0(s3)
ffffffffc0206898:	89da                	mv	s3,s6
ffffffffc020689a:	85eff06f          	j	ffffffffc02058f8 <stride_dequeue+0x78e>
ffffffffc020689e:	008cb783          	ld	a5,8(s9)
ffffffffc02068a2:	010cb983          	ld	s3,16(s9)
ffffffffc02068a6:	f42a                	sd	a0,40(sp)
ffffffffc02068a8:	f03e                	sd	a5,32(sp)
ffffffffc02068aa:	04098163          	beqz	s3,ffffffffc02068ec <stride_dequeue+0x1782>
ffffffffc02068ae:	859a                	mv	a1,t1
ffffffffc02068b0:	854e                	mv	a0,s3
ffffffffc02068b2:	fc42                	sd	a6,56(sp)
ffffffffc02068b4:	f81a                	sd	t1,48(sp)
ffffffffc02068b6:	e78fe0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc02068ba:	7e22                	ld	t3,40(sp)
ffffffffc02068bc:	7342                	ld	t1,48(sp)
ffffffffc02068be:	7862                	ld	a6,56(sp)
ffffffffc02068c0:	11c505e3          	beq	a0,t3,ffffffffc02071ca <stride_dequeue+0x2060>
ffffffffc02068c4:	01033583          	ld	a1,16(t1)
ffffffffc02068c8:	854e                	mv	a0,s3
ffffffffc02068ca:	00833b03          	ld	s6,8(t1)
ffffffffc02068ce:	f842                	sd	a6,48(sp)
ffffffffc02068d0:	f41a                	sd	t1,40(sp)
ffffffffc02068d2:	eb8fe0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc02068d6:	7322                	ld	t1,40(sp)
ffffffffc02068d8:	7842                	ld	a6,48(sp)
ffffffffc02068da:	01633823          	sd	s6,16(t1)
ffffffffc02068de:	00a33423          	sd	a0,8(t1)
ffffffffc02068e2:	010c2b03          	lw	s6,16(s8)
ffffffffc02068e6:	c119                	beqz	a0,ffffffffc02068ec <stride_dequeue+0x1782>
ffffffffc02068e8:	00653023          	sd	t1,0(a0)
ffffffffc02068ec:	7782                	ld	a5,32(sp)
ffffffffc02068ee:	006cb423          	sd	t1,8(s9)
ffffffffc02068f2:	89da                	mv	s3,s6
ffffffffc02068f4:	00fcb823          	sd	a5,16(s9)
ffffffffc02068f8:	01933023          	sd	s9,0(t1)
ffffffffc02068fc:	9aeff06f          	j	ffffffffc0205aaa <stride_dequeue+0x940>
ffffffffc0206900:	008db783          	ld	a5,8(s11)
ffffffffc0206904:	010db983          	ld	s3,16(s11)
ffffffffc0206908:	f02a                	sd	a0,32(sp)
ffffffffc020690a:	ec3e                	sd	a5,24(sp)
ffffffffc020690c:	04098563          	beqz	s3,ffffffffc0206956 <stride_dequeue+0x17ec>
ffffffffc0206910:	859a                	mv	a1,t1
ffffffffc0206912:	854e                	mv	a0,s3
ffffffffc0206914:	fc42                	sd	a6,56(sp)
ffffffffc0206916:	f832                	sd	a2,48(sp)
ffffffffc0206918:	f41a                	sd	t1,40(sp)
ffffffffc020691a:	e14fe0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc020691e:	7e02                	ld	t3,32(sp)
ffffffffc0206920:	7322                	ld	t1,40(sp)
ffffffffc0206922:	7642                	ld	a2,48(sp)
ffffffffc0206924:	7862                	ld	a6,56(sp)
ffffffffc0206926:	15c50be3          	beq	a0,t3,ffffffffc020727c <stride_dequeue+0x2112>
ffffffffc020692a:	01033583          	ld	a1,16(t1)
ffffffffc020692e:	854e                	mv	a0,s3
ffffffffc0206930:	00833b03          	ld	s6,8(t1)
ffffffffc0206934:	f842                	sd	a6,48(sp)
ffffffffc0206936:	f432                	sd	a2,40(sp)
ffffffffc0206938:	f01a                	sd	t1,32(sp)
ffffffffc020693a:	e50fe0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc020693e:	7302                	ld	t1,32(sp)
ffffffffc0206940:	7622                	ld	a2,40(sp)
ffffffffc0206942:	7842                	ld	a6,48(sp)
ffffffffc0206944:	01633823          	sd	s6,16(t1)
ffffffffc0206948:	00a33423          	sd	a0,8(t1)
ffffffffc020694c:	010c2b03          	lw	s6,16(s8)
ffffffffc0206950:	c119                	beqz	a0,ffffffffc0206956 <stride_dequeue+0x17ec>
ffffffffc0206952:	00653023          	sd	t1,0(a0)
ffffffffc0206956:	67e2                	ld	a5,24(sp)
ffffffffc0206958:	006db423          	sd	t1,8(s11)
ffffffffc020695c:	89da                	mv	s3,s6
ffffffffc020695e:	00fdb823          	sd	a5,16(s11)
ffffffffc0206962:	01b33023          	sd	s11,0(t1)
ffffffffc0206966:	c3dfe06f          	j	ffffffffc02055a2 <stride_dequeue+0x438>
ffffffffc020696a:	0088b783          	ld	a5,8(a7)
ffffffffc020696e:	0108b983          	ld	s3,16(a7)
ffffffffc0206972:	f42a                	sd	a0,40(sp)
ffffffffc0206974:	f03e                	sd	a5,32(sp)
ffffffffc0206976:	04098063          	beqz	s3,ffffffffc02069b6 <stride_dequeue+0x184c>
ffffffffc020697a:	85c2                	mv	a1,a6
ffffffffc020697c:	854e                	mv	a0,s3
ffffffffc020697e:	fc46                	sd	a7,56(sp)
ffffffffc0206980:	daefe0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc0206984:	7e22                	ld	t3,40(sp)
ffffffffc0206986:	7842                	ld	a6,48(sp)
ffffffffc0206988:	78e2                	ld	a7,56(sp)
ffffffffc020698a:	29c50de3          	beq	a0,t3,ffffffffc0207424 <stride_dequeue+0x22ba>
ffffffffc020698e:	01083583          	ld	a1,16(a6)
ffffffffc0206992:	854e                	mv	a0,s3
ffffffffc0206994:	00883b03          	ld	s6,8(a6)
ffffffffc0206998:	f846                	sd	a7,48(sp)
ffffffffc020699a:	f442                	sd	a6,40(sp)
ffffffffc020699c:	deefe0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc02069a0:	7822                	ld	a6,40(sp)
ffffffffc02069a2:	78c2                	ld	a7,48(sp)
ffffffffc02069a4:	01683823          	sd	s6,16(a6)
ffffffffc02069a8:	00a83423          	sd	a0,8(a6)
ffffffffc02069ac:	010c2b03          	lw	s6,16(s8)
ffffffffc02069b0:	c119                	beqz	a0,ffffffffc02069b6 <stride_dequeue+0x184c>
ffffffffc02069b2:	01053023          	sd	a6,0(a0)
ffffffffc02069b6:	7782                	ld	a5,32(sp)
ffffffffc02069b8:	0108b423          	sd	a6,8(a7)
ffffffffc02069bc:	89da                	mv	s3,s6
ffffffffc02069be:	00f8b823          	sd	a5,16(a7)
ffffffffc02069c2:	01183023          	sd	a7,0(a6)
ffffffffc02069c6:	8846                	mv	a6,a7
ffffffffc02069c8:	d08ff06f          	j	ffffffffc0205ed0 <stride_dequeue+0xd66>
ffffffffc02069cc:	008db783          	ld	a5,8(s11)
ffffffffc02069d0:	010db983          	ld	s3,16(s11)
ffffffffc02069d4:	f42a                	sd	a0,40(sp)
ffffffffc02069d6:	f03e                	sd	a5,32(sp)
ffffffffc02069d8:	04098163          	beqz	s3,ffffffffc0206a1a <stride_dequeue+0x18b0>
ffffffffc02069dc:	859a                	mv	a1,t1
ffffffffc02069de:	854e                	mv	a0,s3
ffffffffc02069e0:	fc42                	sd	a6,56(sp)
ffffffffc02069e2:	f81a                	sd	t1,48(sp)
ffffffffc02069e4:	d4afe0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc02069e8:	7e22                	ld	t3,40(sp)
ffffffffc02069ea:	7342                	ld	t1,48(sp)
ffffffffc02069ec:	7862                	ld	a6,56(sp)
ffffffffc02069ee:	29c507e3          	beq	a0,t3,ffffffffc020747c <stride_dequeue+0x2312>
ffffffffc02069f2:	01033583          	ld	a1,16(t1)
ffffffffc02069f6:	854e                	mv	a0,s3
ffffffffc02069f8:	00833b03          	ld	s6,8(t1)
ffffffffc02069fc:	f842                	sd	a6,48(sp)
ffffffffc02069fe:	f41a                	sd	t1,40(sp)
ffffffffc0206a00:	d8afe0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc0206a04:	7322                	ld	t1,40(sp)
ffffffffc0206a06:	7842                	ld	a6,48(sp)
ffffffffc0206a08:	01633823          	sd	s6,16(t1)
ffffffffc0206a0c:	00a33423          	sd	a0,8(t1)
ffffffffc0206a10:	010c2b03          	lw	s6,16(s8)
ffffffffc0206a14:	c119                	beqz	a0,ffffffffc0206a1a <stride_dequeue+0x18b0>
ffffffffc0206a16:	00653023          	sd	t1,0(a0)
ffffffffc0206a1a:	7782                	ld	a5,32(sp)
ffffffffc0206a1c:	006db423          	sd	t1,8(s11)
ffffffffc0206a20:	89da                	mv	s3,s6
ffffffffc0206a22:	00fdb823          	sd	a5,16(s11)
ffffffffc0206a26:	01b33023          	sd	s11,0(t1)
ffffffffc0206a2a:	a1ffe06f          	j	ffffffffc0205448 <stride_dequeue+0x2de>
ffffffffc0206a2e:	0088b783          	ld	a5,8(a7)
ffffffffc0206a32:	0108b983          	ld	s3,16(a7)
ffffffffc0206a36:	f42a                	sd	a0,40(sp)
ffffffffc0206a38:	f03e                	sd	a5,32(sp)
ffffffffc0206a3a:	04098063          	beqz	s3,ffffffffc0206a7a <stride_dequeue+0x1910>
ffffffffc0206a3e:	859a                	mv	a1,t1
ffffffffc0206a40:	854e                	mv	a0,s3
ffffffffc0206a42:	fc46                	sd	a7,56(sp)
ffffffffc0206a44:	ceafe0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc0206a48:	7e22                	ld	t3,40(sp)
ffffffffc0206a4a:	7342                	ld	t1,48(sp)
ffffffffc0206a4c:	78e2                	ld	a7,56(sp)
ffffffffc0206a4e:	73c50263          	beq	a0,t3,ffffffffc0207172 <stride_dequeue+0x2008>
ffffffffc0206a52:	01033583          	ld	a1,16(t1)
ffffffffc0206a56:	854e                	mv	a0,s3
ffffffffc0206a58:	00833b03          	ld	s6,8(t1)
ffffffffc0206a5c:	f846                	sd	a7,48(sp)
ffffffffc0206a5e:	f41a                	sd	t1,40(sp)
ffffffffc0206a60:	d2afe0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc0206a64:	7322                	ld	t1,40(sp)
ffffffffc0206a66:	78c2                	ld	a7,48(sp)
ffffffffc0206a68:	01633823          	sd	s6,16(t1)
ffffffffc0206a6c:	00a33423          	sd	a0,8(t1)
ffffffffc0206a70:	010c2b03          	lw	s6,16(s8)
ffffffffc0206a74:	c119                	beqz	a0,ffffffffc0206a7a <stride_dequeue+0x1910>
ffffffffc0206a76:	00653023          	sd	t1,0(a0)
ffffffffc0206a7a:	7782                	ld	a5,32(sp)
ffffffffc0206a7c:	0068b423          	sd	t1,8(a7)
ffffffffc0206a80:	89da                	mv	s3,s6
ffffffffc0206a82:	00f8b823          	sd	a5,16(a7)
ffffffffc0206a86:	01133023          	sd	a7,0(t1)
ffffffffc0206a8a:	f3dfe06f          	j	ffffffffc02059c6 <stride_dequeue+0x85c>
ffffffffc0206a8e:	01093503          	ld	a0,16(s2)
ffffffffc0206a92:	00893983          	ld	s3,8(s2)
ffffffffc0206a96:	85da                	mv	a1,s6
ffffffffc0206a98:	cf2fe0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc0206a9c:	00a93423          	sd	a0,8(s2)
ffffffffc0206aa0:	01393823          	sd	s3,16(s2)
ffffffffc0206aa4:	7822                	ld	a6,40(sp)
ffffffffc0206aa6:	77c2                	ld	a5,48(sp)
ffffffffc0206aa8:	010c2983          	lw	s3,16(s8)
ffffffffc0206aac:	e119                	bnez	a0,ffffffffc0206ab2 <stride_dequeue+0x1948>
ffffffffc0206aae:	803fe06f          	j	ffffffffc02052b0 <stride_dequeue+0x146>
ffffffffc0206ab2:	01253023          	sd	s2,0(a0)
ffffffffc0206ab6:	ffafe06f          	j	ffffffffc02052b0 <stride_dequeue+0x146>
ffffffffc0206aba:	0089b783          	ld	a5,8(s3)
ffffffffc0206abe:	0109b803          	ld	a6,16(s3)
ffffffffc0206ac2:	f42a                	sd	a0,40(sp)
ffffffffc0206ac4:	ec3e                	sd	a5,24(sp)
ffffffffc0206ac6:	02080b63          	beqz	a6,ffffffffc0206afc <stride_dequeue+0x1992>
ffffffffc0206aca:	8542                	mv	a0,a6
ffffffffc0206acc:	85d2                	mv	a1,s4
ffffffffc0206ace:	f042                	sd	a6,32(sp)
ffffffffc0206ad0:	c5efe0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc0206ad4:	77a2                	ld	a5,40(sp)
ffffffffc0206ad6:	7802                	ld	a6,32(sp)
ffffffffc0206ad8:	3cf50be3          	beq	a0,a5,ffffffffc02076ae <stride_dequeue+0x2544>
ffffffffc0206adc:	010a3583          	ld	a1,16(s4)
ffffffffc0206ae0:	008a3b03          	ld	s6,8(s4)
ffffffffc0206ae4:	8542                	mv	a0,a6
ffffffffc0206ae6:	ca4fe0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc0206aea:	00aa3423          	sd	a0,8(s4)
ffffffffc0206aee:	016a3823          	sd	s6,16(s4)
ffffffffc0206af2:	010c2b03          	lw	s6,16(s8)
ffffffffc0206af6:	c119                	beqz	a0,ffffffffc0206afc <stride_dequeue+0x1992>
ffffffffc0206af8:	01453023          	sd	s4,0(a0)
ffffffffc0206afc:	67e2                	ld	a5,24(sp)
ffffffffc0206afe:	0149b423          	sd	s4,8(s3)
ffffffffc0206b02:	00f9b823          	sd	a5,16(s3)
ffffffffc0206b06:	013a3023          	sd	s3,0(s4)
ffffffffc0206b0a:	8a4e                	mv	s4,s3
ffffffffc0206b0c:	c90ff06f          	j	ffffffffc0205f9c <stride_dequeue+0xe32>
ffffffffc0206b10:	0089b783          	ld	a5,8(s3)
ffffffffc0206b14:	0109b803          	ld	a6,16(s3)
ffffffffc0206b18:	f42a                	sd	a0,40(sp)
ffffffffc0206b1a:	ec3e                	sd	a5,24(sp)
ffffffffc0206b1c:	02080b63          	beqz	a6,ffffffffc0206b52 <stride_dequeue+0x19e8>
ffffffffc0206b20:	8542                	mv	a0,a6
ffffffffc0206b22:	85e6                	mv	a1,s9
ffffffffc0206b24:	f042                	sd	a6,32(sp)
ffffffffc0206b26:	c08fe0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc0206b2a:	77a2                	ld	a5,40(sp)
ffffffffc0206b2c:	7802                	ld	a6,32(sp)
ffffffffc0206b2e:	28f50ee3          	beq	a0,a5,ffffffffc02075ca <stride_dequeue+0x2460>
ffffffffc0206b32:	010cb583          	ld	a1,16(s9)
ffffffffc0206b36:	008cbb03          	ld	s6,8(s9)
ffffffffc0206b3a:	8542                	mv	a0,a6
ffffffffc0206b3c:	c4efe0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc0206b40:	00acb423          	sd	a0,8(s9)
ffffffffc0206b44:	016cb823          	sd	s6,16(s9)
ffffffffc0206b48:	010c2b03          	lw	s6,16(s8)
ffffffffc0206b4c:	c119                	beqz	a0,ffffffffc0206b52 <stride_dequeue+0x19e8>
ffffffffc0206b4e:	01953023          	sd	s9,0(a0)
ffffffffc0206b52:	67e2                	ld	a5,24(sp)
ffffffffc0206b54:	0199b423          	sd	s9,8(s3)
ffffffffc0206b58:	00f9b823          	sd	a5,16(s3)
ffffffffc0206b5c:	013cb023          	sd	s3,0(s9)
ffffffffc0206b60:	8cce                	mv	s9,s3
ffffffffc0206b62:	de4ff06f          	j	ffffffffc0206146 <stride_dequeue+0xfdc>
ffffffffc0206b66:	0089b783          	ld	a5,8(s3)
ffffffffc0206b6a:	0109b803          	ld	a6,16(s3)
ffffffffc0206b6e:	f42a                	sd	a0,40(sp)
ffffffffc0206b70:	e83e                	sd	a5,16(sp)
ffffffffc0206b72:	02080f63          	beqz	a6,ffffffffc0206bb0 <stride_dequeue+0x1a46>
ffffffffc0206b76:	8542                	mv	a0,a6
ffffffffc0206b78:	85d2                	mv	a1,s4
ffffffffc0206b7a:	f032                	sd	a2,32(sp)
ffffffffc0206b7c:	ec42                	sd	a6,24(sp)
ffffffffc0206b7e:	bb0fe0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc0206b82:	77a2                	ld	a5,40(sp)
ffffffffc0206b84:	6862                	ld	a6,24(sp)
ffffffffc0206b86:	7602                	ld	a2,32(sp)
ffffffffc0206b88:	26f506e3          	beq	a0,a5,ffffffffc02075f4 <stride_dequeue+0x248a>
ffffffffc0206b8c:	010a3583          	ld	a1,16(s4)
ffffffffc0206b90:	008a3b03          	ld	s6,8(s4)
ffffffffc0206b94:	8542                	mv	a0,a6
ffffffffc0206b96:	ec32                	sd	a2,24(sp)
ffffffffc0206b98:	bf2fe0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc0206b9c:	00aa3423          	sd	a0,8(s4)
ffffffffc0206ba0:	016a3823          	sd	s6,16(s4)
ffffffffc0206ba4:	6662                	ld	a2,24(sp)
ffffffffc0206ba6:	010c2b03          	lw	s6,16(s8)
ffffffffc0206baa:	c119                	beqz	a0,ffffffffc0206bb0 <stride_dequeue+0x1a46>
ffffffffc0206bac:	01453023          	sd	s4,0(a0)
ffffffffc0206bb0:	67c2                	ld	a5,16(sp)
ffffffffc0206bb2:	0149b423          	sd	s4,8(s3)
ffffffffc0206bb6:	00f9b823          	sd	a5,16(s3)
ffffffffc0206bba:	013a3023          	sd	s3,0(s4)
ffffffffc0206bbe:	8a4e                	mv	s4,s3
ffffffffc0206bc0:	cb8ff06f          	j	ffffffffc0206078 <stride_dequeue+0xf0e>
ffffffffc0206bc4:	008a3783          	ld	a5,8(s4)
ffffffffc0206bc8:	010a3883          	ld	a7,16(s4)
ffffffffc0206bcc:	f42a                	sd	a0,40(sp)
ffffffffc0206bce:	ec3e                	sd	a5,24(sp)
ffffffffc0206bd0:	02088b63          	beqz	a7,ffffffffc0206c06 <stride_dequeue+0x1a9c>
ffffffffc0206bd4:	8546                	mv	a0,a7
ffffffffc0206bd6:	85ce                	mv	a1,s3
ffffffffc0206bd8:	f046                	sd	a7,32(sp)
ffffffffc0206bda:	b54fe0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc0206bde:	77a2                	ld	a5,40(sp)
ffffffffc0206be0:	7882                	ld	a7,32(sp)
ffffffffc0206be2:	26f501e3          	beq	a0,a5,ffffffffc0207644 <stride_dequeue+0x24da>
ffffffffc0206be6:	0109b583          	ld	a1,16(s3)
ffffffffc0206bea:	0089bb03          	ld	s6,8(s3)
ffffffffc0206bee:	8546                	mv	a0,a7
ffffffffc0206bf0:	b9afe0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc0206bf4:	00a9b423          	sd	a0,8(s3)
ffffffffc0206bf8:	0169b823          	sd	s6,16(s3)
ffffffffc0206bfc:	010c2b03          	lw	s6,16(s8)
ffffffffc0206c00:	c119                	beqz	a0,ffffffffc0206c06 <stride_dequeue+0x1a9c>
ffffffffc0206c02:	01353023          	sd	s3,0(a0)
ffffffffc0206c06:	67e2                	ld	a5,24(sp)
ffffffffc0206c08:	013a3423          	sd	s3,8(s4)
ffffffffc0206c0c:	00fa3823          	sd	a5,16(s4)
ffffffffc0206c10:	0149b023          	sd	s4,0(s3)
ffffffffc0206c14:	89d2                	mv	s3,s4
ffffffffc0206c16:	f9bfe06f          	j	ffffffffc0205bb0 <stride_dequeue+0xa46>
ffffffffc0206c1a:	008a3783          	ld	a5,8(s4)
ffffffffc0206c1e:	010a3883          	ld	a7,16(s4)
ffffffffc0206c22:	fc2a                	sd	a0,56(sp)
ffffffffc0206c24:	f03e                	sd	a5,32(sp)
ffffffffc0206c26:	02088f63          	beqz	a7,ffffffffc0206c64 <stride_dequeue+0x1afa>
ffffffffc0206c2a:	8546                	mv	a0,a7
ffffffffc0206c2c:	85ce                	mv	a1,s3
ffffffffc0206c2e:	f842                	sd	a6,48(sp)
ffffffffc0206c30:	f446                	sd	a7,40(sp)
ffffffffc0206c32:	afcfe0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc0206c36:	7e62                	ld	t3,56(sp)
ffffffffc0206c38:	78a2                	ld	a7,40(sp)
ffffffffc0206c3a:	7842                	ld	a6,48(sp)
ffffffffc0206c3c:	35c509e3          	beq	a0,t3,ffffffffc020778e <stride_dequeue+0x2624>
ffffffffc0206c40:	0109b583          	ld	a1,16(s3)
ffffffffc0206c44:	0089bb03          	ld	s6,8(s3)
ffffffffc0206c48:	8546                	mv	a0,a7
ffffffffc0206c4a:	f442                	sd	a6,40(sp)
ffffffffc0206c4c:	b3efe0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc0206c50:	00a9b423          	sd	a0,8(s3)
ffffffffc0206c54:	0169b823          	sd	s6,16(s3)
ffffffffc0206c58:	7822                	ld	a6,40(sp)
ffffffffc0206c5a:	010c2b03          	lw	s6,16(s8)
ffffffffc0206c5e:	c119                	beqz	a0,ffffffffc0206c64 <stride_dequeue+0x1afa>
ffffffffc0206c60:	01353023          	sd	s3,0(a0)
ffffffffc0206c64:	7782                	ld	a5,32(sp)
ffffffffc0206c66:	013a3423          	sd	s3,8(s4)
ffffffffc0206c6a:	00fa3823          	sd	a5,16(s4)
ffffffffc0206c6e:	0149b023          	sd	s4,0(s3)
ffffffffc0206c72:	89d2                	mv	s3,s4
ffffffffc0206c74:	c73fe06f          	j	ffffffffc02058e6 <stride_dequeue+0x77c>
ffffffffc0206c78:	661c                	ld	a5,8(a2)
ffffffffc0206c7a:	01063883          	ld	a7,16(a2)
ffffffffc0206c7e:	fc2a                	sd	a0,56(sp)
ffffffffc0206c80:	ec3e                	sd	a5,24(sp)
ffffffffc0206c82:	04088363          	beqz	a7,ffffffffc0206cc8 <stride_dequeue+0x1b5e>
ffffffffc0206c86:	8546                	mv	a0,a7
ffffffffc0206c88:	85ce                	mv	a1,s3
ffffffffc0206c8a:	f842                	sd	a6,48(sp)
ffffffffc0206c8c:	f432                	sd	a2,40(sp)
ffffffffc0206c8e:	f046                	sd	a7,32(sp)
ffffffffc0206c90:	a9efe0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc0206c94:	7e62                	ld	t3,56(sp)
ffffffffc0206c96:	7882                	ld	a7,32(sp)
ffffffffc0206c98:	7622                	ld	a2,40(sp)
ffffffffc0206c9a:	7842                	ld	a6,48(sp)
ffffffffc0206c9c:	25c501e3          	beq	a0,t3,ffffffffc02076de <stride_dequeue+0x2574>
ffffffffc0206ca0:	0109b583          	ld	a1,16(s3)
ffffffffc0206ca4:	0089bb03          	ld	s6,8(s3)
ffffffffc0206ca8:	8546                	mv	a0,a7
ffffffffc0206caa:	f442                	sd	a6,40(sp)
ffffffffc0206cac:	f032                	sd	a2,32(sp)
ffffffffc0206cae:	adcfe0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc0206cb2:	00a9b423          	sd	a0,8(s3)
ffffffffc0206cb6:	0169b823          	sd	s6,16(s3)
ffffffffc0206cba:	7602                	ld	a2,32(sp)
ffffffffc0206cbc:	7822                	ld	a6,40(sp)
ffffffffc0206cbe:	010c2b03          	lw	s6,16(s8)
ffffffffc0206cc2:	c119                	beqz	a0,ffffffffc0206cc8 <stride_dequeue+0x1b5e>
ffffffffc0206cc4:	01353023          	sd	s3,0(a0)
ffffffffc0206cc8:	67e2                	ld	a5,24(sp)
ffffffffc0206cca:	01363423          	sd	s3,8(a2)
ffffffffc0206cce:	ea1c                	sd	a5,16(a2)
ffffffffc0206cd0:	00c9b023          	sd	a2,0(s3)
ffffffffc0206cd4:	89b2                	mv	s3,a2
ffffffffc0206cd6:	b13fe06f          	j	ffffffffc02057e8 <stride_dequeue+0x67e>
ffffffffc0206cda:	89c6                	mv	s3,a7
ffffffffc0206cdc:	9e4ff06f          	j	ffffffffc0205ec0 <stride_dequeue+0xd56>
ffffffffc0206ce0:	0088b783          	ld	a5,8(a7)
ffffffffc0206ce4:	0108b803          	ld	a6,16(a7)
ffffffffc0206ce8:	fc2a                	sd	a0,56(sp)
ffffffffc0206cea:	f03e                	sd	a5,32(sp)
ffffffffc0206cec:	02080f63          	beqz	a6,ffffffffc0206d2a <stride_dequeue+0x1bc0>
ffffffffc0206cf0:	8542                	mv	a0,a6
ffffffffc0206cf2:	85ce                	mv	a1,s3
ffffffffc0206cf4:	f846                	sd	a7,48(sp)
ffffffffc0206cf6:	f442                	sd	a6,40(sp)
ffffffffc0206cf8:	a36fe0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc0206cfc:	7e62                	ld	t3,56(sp)
ffffffffc0206cfe:	7822                	ld	a6,40(sp)
ffffffffc0206d00:	78c2                	ld	a7,48(sp)
ffffffffc0206d02:	47c50ce3          	beq	a0,t3,ffffffffc020797a <stride_dequeue+0x2810>
ffffffffc0206d06:	0109b583          	ld	a1,16(s3)
ffffffffc0206d0a:	0089bb03          	ld	s6,8(s3)
ffffffffc0206d0e:	8542                	mv	a0,a6
ffffffffc0206d10:	f446                	sd	a7,40(sp)
ffffffffc0206d12:	a78fe0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc0206d16:	00a9b423          	sd	a0,8(s3)
ffffffffc0206d1a:	0169b823          	sd	s6,16(s3)
ffffffffc0206d1e:	78a2                	ld	a7,40(sp)
ffffffffc0206d20:	010c2b03          	lw	s6,16(s8)
ffffffffc0206d24:	c119                	beqz	a0,ffffffffc0206d2a <stride_dequeue+0x1bc0>
ffffffffc0206d26:	01353023          	sd	s3,0(a0)
ffffffffc0206d2a:	7782                	ld	a5,32(sp)
ffffffffc0206d2c:	0138b423          	sd	s3,8(a7)
ffffffffc0206d30:	00f8b823          	sd	a5,16(a7)
ffffffffc0206d34:	0119b023          	sd	a7,0(s3)
ffffffffc0206d38:	89c6                	mv	s3,a7
ffffffffc0206d3a:	8f0ff06f          	j	ffffffffc0205e2a <stride_dequeue+0xcc0>
ffffffffc0206d3e:	0088b783          	ld	a5,8(a7)
ffffffffc0206d42:	0108b803          	ld	a6,16(a7)
ffffffffc0206d46:	fc2a                	sd	a0,56(sp)
ffffffffc0206d48:	f03e                	sd	a5,32(sp)
ffffffffc0206d4a:	02080f63          	beqz	a6,ffffffffc0206d88 <stride_dequeue+0x1c1e>
ffffffffc0206d4e:	8542                	mv	a0,a6
ffffffffc0206d50:	85ce                	mv	a1,s3
ffffffffc0206d52:	f846                	sd	a7,48(sp)
ffffffffc0206d54:	f442                	sd	a6,40(sp)
ffffffffc0206d56:	9d8fe0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc0206d5a:	7e62                	ld	t3,56(sp)
ffffffffc0206d5c:	7822                	ld	a6,40(sp)
ffffffffc0206d5e:	78c2                	ld	a7,48(sp)
ffffffffc0206d60:	25c50de3          	beq	a0,t3,ffffffffc02077ba <stride_dequeue+0x2650>
ffffffffc0206d64:	0109b583          	ld	a1,16(s3)
ffffffffc0206d68:	0089bb03          	ld	s6,8(s3)
ffffffffc0206d6c:	8542                	mv	a0,a6
ffffffffc0206d6e:	f446                	sd	a7,40(sp)
ffffffffc0206d70:	a1afe0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc0206d74:	00a9b423          	sd	a0,8(s3)
ffffffffc0206d78:	0169b823          	sd	s6,16(s3)
ffffffffc0206d7c:	78a2                	ld	a7,40(sp)
ffffffffc0206d7e:	010c2b03          	lw	s6,16(s8)
ffffffffc0206d82:	c119                	beqz	a0,ffffffffc0206d88 <stride_dequeue+0x1c1e>
ffffffffc0206d84:	01353023          	sd	s3,0(a0)
ffffffffc0206d88:	7782                	ld	a5,32(sp)
ffffffffc0206d8a:	0138b423          	sd	s3,8(a7)
ffffffffc0206d8e:	00f8b823          	sd	a5,16(a7)
ffffffffc0206d92:	0119b023          	sd	a7,0(s3)
ffffffffc0206d96:	89c6                	mv	s3,a7
ffffffffc0206d98:	ee7fe06f          	j	ffffffffc0205c7e <stride_dequeue+0xb14>
ffffffffc0206d9c:	0088b783          	ld	a5,8(a7)
ffffffffc0206da0:	0108b803          	ld	a6,16(a7)
ffffffffc0206da4:	fc2a                	sd	a0,56(sp)
ffffffffc0206da6:	ec3e                	sd	a5,24(sp)
ffffffffc0206da8:	04080263          	beqz	a6,ffffffffc0206dec <stride_dequeue+0x1c82>
ffffffffc0206dac:	8542                	mv	a0,a6
ffffffffc0206dae:	85ce                	mv	a1,s3
ffffffffc0206db0:	f846                	sd	a7,48(sp)
ffffffffc0206db2:	f042                	sd	a6,32(sp)
ffffffffc0206db4:	97afe0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc0206db8:	7e62                	ld	t3,56(sp)
ffffffffc0206dba:	7802                	ld	a6,32(sp)
ffffffffc0206dbc:	7622                	ld	a2,40(sp)
ffffffffc0206dbe:	78c2                	ld	a7,48(sp)
ffffffffc0206dc0:	23c503e3          	beq	a0,t3,ffffffffc02077e6 <stride_dequeue+0x267c>
ffffffffc0206dc4:	0109b583          	ld	a1,16(s3)
ffffffffc0206dc8:	0089bb03          	ld	s6,8(s3)
ffffffffc0206dcc:	8542                	mv	a0,a6
ffffffffc0206dce:	f446                	sd	a7,40(sp)
ffffffffc0206dd0:	f032                	sd	a2,32(sp)
ffffffffc0206dd2:	9b8fe0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc0206dd6:	00a9b423          	sd	a0,8(s3)
ffffffffc0206dda:	0169b823          	sd	s6,16(s3)
ffffffffc0206dde:	7602                	ld	a2,32(sp)
ffffffffc0206de0:	78a2                	ld	a7,40(sp)
ffffffffc0206de2:	010c2b03          	lw	s6,16(s8)
ffffffffc0206de6:	c119                	beqz	a0,ffffffffc0206dec <stride_dequeue+0x1c82>
ffffffffc0206de8:	01353023          	sd	s3,0(a0)
ffffffffc0206dec:	67e2                	ld	a5,24(sp)
ffffffffc0206dee:	0138b423          	sd	s3,8(a7)
ffffffffc0206df2:	00f8b823          	sd	a5,16(a7)
ffffffffc0206df6:	0119b023          	sd	a7,0(s3)
ffffffffc0206dfa:	89c6                	mv	s3,a7
ffffffffc0206dfc:	f61fe06f          	j	ffffffffc0205d5c <stride_dequeue+0xbf2>
ffffffffc0206e00:	0089b783          	ld	a5,8(s3)
ffffffffc0206e04:	0109b303          	ld	t1,16(s3)
ffffffffc0206e08:	fc2a                	sd	a0,56(sp)
ffffffffc0206e0a:	f03e                	sd	a5,32(sp)
ffffffffc0206e0c:	02030f63          	beqz	t1,ffffffffc0206e4a <stride_dequeue+0x1ce0>
ffffffffc0206e10:	851a                	mv	a0,t1
ffffffffc0206e12:	85e6                	mv	a1,s9
ffffffffc0206e14:	f846                	sd	a7,48(sp)
ffffffffc0206e16:	f41a                	sd	t1,40(sp)
ffffffffc0206e18:	916fe0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc0206e1c:	7e62                	ld	t3,56(sp)
ffffffffc0206e1e:	7322                	ld	t1,40(sp)
ffffffffc0206e20:	78c2                	ld	a7,48(sp)
ffffffffc0206e22:	11c50be3          	beq	a0,t3,ffffffffc0207738 <stride_dequeue+0x25ce>
ffffffffc0206e26:	010cb583          	ld	a1,16(s9)
ffffffffc0206e2a:	008cbb03          	ld	s6,8(s9)
ffffffffc0206e2e:	851a                	mv	a0,t1
ffffffffc0206e30:	f446                	sd	a7,40(sp)
ffffffffc0206e32:	958fe0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc0206e36:	00acb423          	sd	a0,8(s9)
ffffffffc0206e3a:	016cb823          	sd	s6,16(s9)
ffffffffc0206e3e:	78a2                	ld	a7,40(sp)
ffffffffc0206e40:	010c2b03          	lw	s6,16(s8)
ffffffffc0206e44:	c119                	beqz	a0,ffffffffc0206e4a <stride_dequeue+0x1ce0>
ffffffffc0206e46:	01953023          	sd	s9,0(a0)
ffffffffc0206e4a:	7782                	ld	a5,32(sp)
ffffffffc0206e4c:	0199b423          	sd	s9,8(s3)
ffffffffc0206e50:	00f9b823          	sd	a5,16(s3)
ffffffffc0206e54:	013cb023          	sd	s3,0(s9)
ffffffffc0206e58:	8cce                	mv	s9,s3
ffffffffc0206e5a:	b8aff06f          	j	ffffffffc02061e4 <stride_dequeue+0x107a>
ffffffffc0206e5e:	89ee                	mv	s3,s11
ffffffffc0206e60:	dd6fe06f          	j	ffffffffc0205436 <stride_dequeue+0x2cc>
ffffffffc0206e64:	0089b783          	ld	a5,8(s3)
ffffffffc0206e68:	0109b303          	ld	t1,16(s3)
ffffffffc0206e6c:	fc2a                	sd	a0,56(sp)
ffffffffc0206e6e:	f03e                	sd	a5,32(sp)
ffffffffc0206e70:	02030f63          	beqz	t1,ffffffffc0206eae <stride_dequeue+0x1d44>
ffffffffc0206e74:	85c2                	mv	a1,a6
ffffffffc0206e76:	851a                	mv	a0,t1
ffffffffc0206e78:	f842                	sd	a6,48(sp)
ffffffffc0206e7a:	f41a                	sd	t1,40(sp)
ffffffffc0206e7c:	8b2fe0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc0206e80:	7e62                	ld	t3,56(sp)
ffffffffc0206e82:	7322                	ld	t1,40(sp)
ffffffffc0206e84:	7842                	ld	a6,48(sp)
ffffffffc0206e86:	0dc50fe3          	beq	a0,t3,ffffffffc0207764 <stride_dequeue+0x25fa>
ffffffffc0206e8a:	01083583          	ld	a1,16(a6)
ffffffffc0206e8e:	851a                	mv	a0,t1
ffffffffc0206e90:	00883b03          	ld	s6,8(a6)
ffffffffc0206e94:	f442                	sd	a6,40(sp)
ffffffffc0206e96:	8f4fe0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc0206e9a:	7822                	ld	a6,40(sp)
ffffffffc0206e9c:	01683823          	sd	s6,16(a6)
ffffffffc0206ea0:	00a83423          	sd	a0,8(a6)
ffffffffc0206ea4:	010c2b03          	lw	s6,16(s8)
ffffffffc0206ea8:	c119                	beqz	a0,ffffffffc0206eae <stride_dequeue+0x1d44>
ffffffffc0206eaa:	01053023          	sd	a6,0(a0)
ffffffffc0206eae:	7782                	ld	a5,32(sp)
ffffffffc0206eb0:	0109b423          	sd	a6,8(s3)
ffffffffc0206eb4:	00f9b823          	sd	a5,16(s3)
ffffffffc0206eb8:	01383023          	sd	s3,0(a6)
ffffffffc0206ebc:	884e                	mv	a6,s3
ffffffffc0206ebe:	bc4ff06f          	j	ffffffffc0206282 <stride_dequeue+0x1118>
ffffffffc0206ec2:	008cb783          	ld	a5,8(s9)
ffffffffc0206ec6:	010cb883          	ld	a7,16(s9)
ffffffffc0206eca:	fc2a                	sd	a0,56(sp)
ffffffffc0206ecc:	f03e                	sd	a5,32(sp)
ffffffffc0206ece:	02088f63          	beqz	a7,ffffffffc0206f0c <stride_dequeue+0x1da2>
ffffffffc0206ed2:	8546                	mv	a0,a7
ffffffffc0206ed4:	85ce                	mv	a1,s3
ffffffffc0206ed6:	f842                	sd	a6,48(sp)
ffffffffc0206ed8:	f446                	sd	a7,40(sp)
ffffffffc0206eda:	854fe0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc0206ede:	7e62                	ld	t3,56(sp)
ffffffffc0206ee0:	78a2                	ld	a7,40(sp)
ffffffffc0206ee2:	7842                	ld	a6,48(sp)
ffffffffc0206ee4:	27c505e3          	beq	a0,t3,ffffffffc020794e <stride_dequeue+0x27e4>
ffffffffc0206ee8:	0109b583          	ld	a1,16(s3)
ffffffffc0206eec:	0089bb03          	ld	s6,8(s3)
ffffffffc0206ef0:	8546                	mv	a0,a7
ffffffffc0206ef2:	f442                	sd	a6,40(sp)
ffffffffc0206ef4:	896fe0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc0206ef8:	00a9b423          	sd	a0,8(s3)
ffffffffc0206efc:	0169b823          	sd	s6,16(s3)
ffffffffc0206f00:	7822                	ld	a6,40(sp)
ffffffffc0206f02:	010c2b03          	lw	s6,16(s8)
ffffffffc0206f06:	c119                	beqz	a0,ffffffffc0206f0c <stride_dequeue+0x1da2>
ffffffffc0206f08:	01353023          	sd	s3,0(a0)
ffffffffc0206f0c:	7782                	ld	a5,32(sp)
ffffffffc0206f0e:	013cb423          	sd	s3,8(s9)
ffffffffc0206f12:	00fcb823          	sd	a5,16(s9)
ffffffffc0206f16:	0199b023          	sd	s9,0(s3)
ffffffffc0206f1a:	89e6                	mv	s3,s9
ffffffffc0206f1c:	fb0fe06f          	j	ffffffffc02056cc <stride_dequeue+0x562>
ffffffffc0206f20:	0089b783          	ld	a5,8(s3)
ffffffffc0206f24:	0109b303          	ld	t1,16(s3)
ffffffffc0206f28:	fc2a                	sd	a0,56(sp)
ffffffffc0206f2a:	f03e                	sd	a5,32(sp)
ffffffffc0206f2c:	02030f63          	beqz	t1,ffffffffc0206f6a <stride_dequeue+0x1e00>
ffffffffc0206f30:	85c2                	mv	a1,a6
ffffffffc0206f32:	851a                	mv	a0,t1
ffffffffc0206f34:	f842                	sd	a6,48(sp)
ffffffffc0206f36:	f41a                	sd	t1,40(sp)
ffffffffc0206f38:	ff7fd0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc0206f3c:	7e62                	ld	t3,56(sp)
ffffffffc0206f3e:	7322                	ld	t1,40(sp)
ffffffffc0206f40:	7842                	ld	a6,48(sp)
ffffffffc0206f42:	1bc509e3          	beq	a0,t3,ffffffffc02078f4 <stride_dequeue+0x278a>
ffffffffc0206f46:	01083583          	ld	a1,16(a6)
ffffffffc0206f4a:	851a                	mv	a0,t1
ffffffffc0206f4c:	00883b03          	ld	s6,8(a6)
ffffffffc0206f50:	f442                	sd	a6,40(sp)
ffffffffc0206f52:	838fe0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc0206f56:	7822                	ld	a6,40(sp)
ffffffffc0206f58:	01683823          	sd	s6,16(a6)
ffffffffc0206f5c:	00a83423          	sd	a0,8(a6)
ffffffffc0206f60:	010c2b03          	lw	s6,16(s8)
ffffffffc0206f64:	c119                	beqz	a0,ffffffffc0206f6a <stride_dequeue+0x1e00>
ffffffffc0206f66:	01053023          	sd	a6,0(a0)
ffffffffc0206f6a:	7782                	ld	a5,32(sp)
ffffffffc0206f6c:	0109b423          	sd	a6,8(s3)
ffffffffc0206f70:	00f9b823          	sd	a5,16(s3)
ffffffffc0206f74:	01383023          	sd	s3,0(a6)
ffffffffc0206f78:	884e                	mv	a6,s3
ffffffffc0206f7a:	ba4ff06f          	j	ffffffffc020631e <stride_dequeue+0x11b4>
ffffffffc0206f7e:	0089b783          	ld	a5,8(s3)
ffffffffc0206f82:	0109b303          	ld	t1,16(s3)
ffffffffc0206f86:	fc2a                	sd	a0,56(sp)
ffffffffc0206f88:	ec3e                	sd	a5,24(sp)
ffffffffc0206f8a:	04030363          	beqz	t1,ffffffffc0206fd0 <stride_dequeue+0x1e66>
ffffffffc0206f8e:	85c2                	mv	a1,a6
ffffffffc0206f90:	851a                	mv	a0,t1
ffffffffc0206f92:	f832                	sd	a2,48(sp)
ffffffffc0206f94:	f442                	sd	a6,40(sp)
ffffffffc0206f96:	f01a                	sd	t1,32(sp)
ffffffffc0206f98:	f97fd0ef          	jal	ra,ffffffffc0204f2e <proc_stride_comp_f>
ffffffffc0206f9c:	7642                	ld	a2,48(sp)
ffffffffc0206f9e:	7e62                	ld	t3,56(sp)
ffffffffc0206fa0:	7822                	ld	a6,40(sp)
ffffffffc0206fa2:	f432                	sd	a2,40(sp)
ffffffffc0206fa4:	7302                	ld	t1,32(sp)
ffffffffc0206fa6:	29c507e3          	beq	a0,t3,ffffffffc0207a34 <stride_dequeue+0x28ca>
ffffffffc0206faa:	01083583          	ld	a1,16(a6)
ffffffffc0206fae:	851a                	mv	a0,t1
ffffffffc0206fb0:	00883b03          	ld	s6,8(a6)
ffffffffc0206fb4:	f042                	sd	a6,32(sp)
ffffffffc0206fb6:	fd5fd0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc0206fba:	7802                	ld	a6,32(sp)
ffffffffc0206fbc:	7622                	ld	a2,40(sp)
ffffffffc0206fbe:	01683823          	sd	s6,16(a6)
ffffffffc0206fc2:	00a83423          	sd	a0,8(a6)
ffffffffc0206fc6:	010c2b03          	lw	s6,16(s8)
ffffffffc0206fca:	c119                	beqz	a0,ffffffffc0206fd0 <stride_dequeue+0x1e66>
ffffffffc0206fcc:	01053023          	sd	a6,0(a0)
ffffffffc0206fd0:	67e2                	ld	a5,24(sp)
ffffffffc0206fd2:	0109b423          	sd	a6,8(s3)
ffffffffc0206fd6:	00f9b823          	sd	a5,16(s3)
ffffffffc0206fda:	01383023          	sd	s3,0(a6)
ffffffffc0206fde:	884e                	mv	a6,s3
ffffffffc0206fe0:	be2ff06f          	j	ffffffffc02063c2 <stride_dequeue+0x1258>
ffffffffc0206fe4:	89c6                	mv	s3,a7
ffffffffc0206fe6:	9cffe06f          	j	ffffffffc02059b4 <stride_dequeue+0x84a>
ffffffffc0206fea:	89e6                	mv	s3,s9
ffffffffc0206fec:	aadfe06f          	j	ffffffffc0205a98 <stride_dequeue+0x92e>
ffffffffc0206ff0:	89ee                	mv	s3,s11
ffffffffc0206ff2:	d9efe06f          	j	ffffffffc0205590 <stride_dequeue+0x426>
ffffffffc0206ff6:	89d2                	mv	s3,s4
ffffffffc0206ff8:	bb9fe06f          	j	ffffffffc0205bb0 <stride_dequeue+0xa46>
ffffffffc0206ffc:	0108b503          	ld	a0,16(a7)
ffffffffc0207000:	85ce                	mv	a1,s3
ffffffffc0207002:	0088bb03          	ld	s6,8(a7)
ffffffffc0207006:	f81a                	sd	t1,48(sp)
ffffffffc0207008:	f446                	sd	a7,40(sp)
ffffffffc020700a:	f81fd0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc020700e:	78a2                	ld	a7,40(sp)
ffffffffc0207010:	7342                	ld	t1,48(sp)
ffffffffc0207012:	0168b823          	sd	s6,16(a7)
ffffffffc0207016:	00a8b423          	sd	a0,8(a7)
ffffffffc020701a:	010c2b03          	lw	s6,16(s8)
ffffffffc020701e:	d179                	beqz	a0,ffffffffc0206fe4 <stride_dequeue+0x1e7a>
ffffffffc0207020:	01153023          	sd	a7,0(a0)
ffffffffc0207024:	89c6                	mv	s3,a7
ffffffffc0207026:	98ffe06f          	j	ffffffffc02059b4 <stride_dequeue+0x84a>
ffffffffc020702a:	0109b503          	ld	a0,16(s3)
ffffffffc020702e:	0089bb03          	ld	s6,8(s3)
ffffffffc0207032:	85be                	mv	a1,a5
ffffffffc0207034:	f442                	sd	a6,40(sp)
ffffffffc0207036:	f55fd0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc020703a:	00a9b423          	sd	a0,8(s3)
ffffffffc020703e:	0169b823          	sd	s6,16(s3)
ffffffffc0207042:	7822                	ld	a6,40(sp)
ffffffffc0207044:	010c2b03          	lw	s6,16(s8)
ffffffffc0207048:	5e050b63          	beqz	a0,ffffffffc020763e <stride_dequeue+0x24d4>
ffffffffc020704c:	01353023          	sd	s3,0(a0)
ffffffffc0207050:	87ce                	mv	a5,s3
ffffffffc0207052:	bccff06f          	j	ffffffffc020641e <stride_dequeue+0x12b4>
ffffffffc0207056:	010cb503          	ld	a0,16(s9)
ffffffffc020705a:	008cbb03          	ld	s6,8(s9)
ffffffffc020705e:	85ce                	mv	a1,s3
ffffffffc0207060:	f2bfd0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc0207064:	00acb423          	sd	a0,8(s9)
ffffffffc0207068:	016cb823          	sd	s6,16(s9)
ffffffffc020706c:	7822                	ld	a6,40(sp)
ffffffffc020706e:	7342                	ld	t1,48(sp)
ffffffffc0207070:	010c2b03          	lw	s6,16(s8)
ffffffffc0207074:	d93d                	beqz	a0,ffffffffc0206fea <stride_dequeue+0x1e80>
ffffffffc0207076:	01953023          	sd	s9,0(a0)
ffffffffc020707a:	89e6                	mv	s3,s9
ffffffffc020707c:	a1dfe06f          	j	ffffffffc0205a98 <stride_dequeue+0x92e>
ffffffffc0207080:	0108b503          	ld	a0,16(a7)
ffffffffc0207084:	85ce                	mv	a1,s3
ffffffffc0207086:	0088bb03          	ld	s6,8(a7)
ffffffffc020708a:	f842                	sd	a6,48(sp)
ffffffffc020708c:	f446                	sd	a7,40(sp)
ffffffffc020708e:	efdfd0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc0207092:	78a2                	ld	a7,40(sp)
ffffffffc0207094:	7842                	ld	a6,48(sp)
ffffffffc0207096:	0168b823          	sd	s6,16(a7)
ffffffffc020709a:	00a8b423          	sd	a0,8(a7)
ffffffffc020709e:	010c2b03          	lw	s6,16(s8)
ffffffffc02070a2:	c2050ce3          	beqz	a0,ffffffffc0206cda <stride_dequeue+0x1b70>
ffffffffc02070a6:	01153023          	sd	a7,0(a0)
ffffffffc02070aa:	89c6                	mv	s3,a7
ffffffffc02070ac:	e15fe06f          	j	ffffffffc0205ec0 <stride_dequeue+0xd56>
ffffffffc02070b0:	010db503          	ld	a0,16(s11)
ffffffffc02070b4:	008dbb03          	ld	s6,8(s11)
ffffffffc02070b8:	85ce                	mv	a1,s3
ffffffffc02070ba:	ed1fd0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc02070be:	00adb423          	sd	a0,8(s11)
ffffffffc02070c2:	016db823          	sd	s6,16(s11)
ffffffffc02070c6:	7602                	ld	a2,32(sp)
ffffffffc02070c8:	7822                	ld	a6,40(sp)
ffffffffc02070ca:	7342                	ld	t1,48(sp)
ffffffffc02070cc:	010c2b03          	lw	s6,16(s8)
ffffffffc02070d0:	d105                	beqz	a0,ffffffffc0206ff0 <stride_dequeue+0x1e86>
ffffffffc02070d2:	01b53023          	sd	s11,0(a0)
ffffffffc02070d6:	89ee                	mv	s3,s11
ffffffffc02070d8:	cb8fe06f          	j	ffffffffc0205590 <stride_dequeue+0x426>
ffffffffc02070dc:	010db503          	ld	a0,16(s11)
ffffffffc02070e0:	008dbb03          	ld	s6,8(s11)
ffffffffc02070e4:	85ce                	mv	a1,s3
ffffffffc02070e6:	ea5fd0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc02070ea:	00adb423          	sd	a0,8(s11)
ffffffffc02070ee:	016db823          	sd	s6,16(s11)
ffffffffc02070f2:	7322                	ld	t1,40(sp)
ffffffffc02070f4:	7842                	ld	a6,48(sp)
ffffffffc02070f6:	010c2b03          	lw	s6,16(s8)
ffffffffc02070fa:	d60502e3          	beqz	a0,ffffffffc0206e5e <stride_dequeue+0x1cf4>
ffffffffc02070fe:	01b53023          	sd	s11,0(a0)
ffffffffc0207102:	89ee                	mv	s3,s11
ffffffffc0207104:	b32fe06f          	j	ffffffffc0205436 <stride_dequeue+0x2cc>
ffffffffc0207108:	89e6                	mv	s3,s9
ffffffffc020710a:	dc2fe06f          	j	ffffffffc02056cc <stride_dequeue+0x562>
ffffffffc020710e:	89c6                	mv	s3,a7
ffffffffc0207110:	d1bfe06f          	j	ffffffffc0205e2a <stride_dequeue+0xcc0>
ffffffffc0207114:	00003697          	auipc	a3,0x3
ffffffffc0207118:	bcc68693          	addi	a3,a3,-1076 # ffffffffc0209ce0 <default_pmm_manager+0x860>
ffffffffc020711c:	00001617          	auipc	a2,0x1
ffffffffc0207120:	62460613          	addi	a2,a2,1572 # ffffffffc0208740 <commands+0x410>
ffffffffc0207124:	06300593          	li	a1,99
ffffffffc0207128:	00003517          	auipc	a0,0x3
ffffffffc020712c:	be050513          	addi	a0,a0,-1056 # ffffffffc0209d08 <default_pmm_manager+0x888>
ffffffffc0207130:	8d8f90ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0207134:	89d2                	mv	s3,s4
ffffffffc0207136:	fb0fe06f          	j	ffffffffc02058e6 <stride_dequeue+0x77c>
ffffffffc020713a:	89c6                	mv	s3,a7
ffffffffc020713c:	c21fe06f          	j	ffffffffc0205d5c <stride_dequeue+0xbf2>
ffffffffc0207140:	89c6                	mv	s3,a7
ffffffffc0207142:	b3dfe06f          	j	ffffffffc0205c7e <stride_dequeue+0xb14>
ffffffffc0207146:	89b2                	mv	s3,a2
ffffffffc0207148:	ea0fe06f          	j	ffffffffc02057e8 <stride_dequeue+0x67e>
ffffffffc020714c:	0109b503          	ld	a0,16(s3)
ffffffffc0207150:	0089bb03          	ld	s6,8(s3)
ffffffffc0207154:	85a6                	mv	a1,s1
ffffffffc0207156:	e35fd0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc020715a:	00a9b423          	sd	a0,8(s3)
ffffffffc020715e:	0169b823          	sd	s6,16(s3)
ffffffffc0207162:	010c2b03          	lw	s6,16(s8)
ffffffffc0207166:	b4050363          	beqz	a0,ffffffffc02064ac <stride_dequeue+0x1342>
ffffffffc020716a:	01353023          	sd	s3,0(a0)
ffffffffc020716e:	b3eff06f          	j	ffffffffc02064ac <stride_dequeue+0x1342>
ffffffffc0207172:	0109b503          	ld	a0,16(s3)
ffffffffc0207176:	0089bb03          	ld	s6,8(s3)
ffffffffc020717a:	859a                	mv	a1,t1
ffffffffc020717c:	f446                	sd	a7,40(sp)
ffffffffc020717e:	e0dfd0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc0207182:	00a9b423          	sd	a0,8(s3)
ffffffffc0207186:	0169b823          	sd	s6,16(s3)
ffffffffc020718a:	78a2                	ld	a7,40(sp)
ffffffffc020718c:	010c2b03          	lw	s6,16(s8)
ffffffffc0207190:	100505e3          	beqz	a0,ffffffffc0207a9a <stride_dequeue+0x2930>
ffffffffc0207194:	01353023          	sd	s3,0(a0)
ffffffffc0207198:	834e                	mv	t1,s3
ffffffffc020719a:	b0c5                	j	ffffffffc0206a7a <stride_dequeue+0x1910>
ffffffffc020719c:	0109b503          	ld	a0,16(s3)
ffffffffc02071a0:	0089bb03          	ld	s6,8(s3)
ffffffffc02071a4:	85f2                	mv	a1,t3
ffffffffc02071a6:	f442                	sd	a6,40(sp)
ffffffffc02071a8:	f032                	sd	a2,32(sp)
ffffffffc02071aa:	de1fd0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc02071ae:	00a9b423          	sd	a0,8(s3)
ffffffffc02071b2:	0169b823          	sd	s6,16(s3)
ffffffffc02071b6:	7602                	ld	a2,32(sp)
ffffffffc02071b8:	7822                	ld	a6,40(sp)
ffffffffc02071ba:	010c2b03          	lw	s6,16(s8)
ffffffffc02071be:	9e050b63          	beqz	a0,ffffffffc02063b4 <stride_dequeue+0x124a>
ffffffffc02071c2:	01353023          	sd	s3,0(a0)
ffffffffc02071c6:	9eeff06f          	j	ffffffffc02063b4 <stride_dequeue+0x124a>
ffffffffc02071ca:	0109b503          	ld	a0,16(s3)
ffffffffc02071ce:	0089bb03          	ld	s6,8(s3)
ffffffffc02071d2:	859a                	mv	a1,t1
ffffffffc02071d4:	f442                	sd	a6,40(sp)
ffffffffc02071d6:	db5fd0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc02071da:	00a9b423          	sd	a0,8(s3)
ffffffffc02071de:	0169b823          	sd	s6,16(s3)
ffffffffc02071e2:	7822                	ld	a6,40(sp)
ffffffffc02071e4:	010c2b03          	lw	s6,16(s8)
ffffffffc02071e8:	08050de3          	beqz	a0,ffffffffc0207a82 <stride_dequeue+0x2918>
ffffffffc02071ec:	01353023          	sd	s3,0(a0)
ffffffffc02071f0:	834e                	mv	t1,s3
ffffffffc02071f2:	efaff06f          	j	ffffffffc02068ec <stride_dequeue+0x1782>
ffffffffc02071f6:	89a6                	mv	s3,s1
ffffffffc02071f8:	ab4ff06f          	j	ffffffffc02064ac <stride_dequeue+0x1342>
ffffffffc02071fc:	0109b503          	ld	a0,16(s3)
ffffffffc0207200:	0089bb03          	ld	s6,8(s3)
ffffffffc0207204:	85ee                	mv	a1,s11
ffffffffc0207206:	f046                	sd	a7,32(sp)
ffffffffc0207208:	d83fd0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc020720c:	00a9b423          	sd	a0,8(s3)
ffffffffc0207210:	0169b823          	sd	s6,16(s3)
ffffffffc0207214:	7882                	ld	a7,32(sp)
ffffffffc0207216:	010c2b03          	lw	s6,16(s8)
ffffffffc020721a:	bc050f63          	beqz	a0,ffffffffc02065f8 <stride_dequeue+0x148e>
ffffffffc020721e:	01353023          	sd	s3,0(a0)
ffffffffc0207222:	bd6ff06f          	j	ffffffffc02065f8 <stride_dequeue+0x148e>
ffffffffc0207226:	0109b503          	ld	a0,16(s3)
ffffffffc020722a:	0089bb03          	ld	s6,8(s3)
ffffffffc020722e:	85f2                	mv	a1,t3
ffffffffc0207230:	f442                	sd	a6,40(sp)
ffffffffc0207232:	d59fd0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc0207236:	00a9b423          	sd	a0,8(s3)
ffffffffc020723a:	0169b823          	sd	s6,16(s3)
ffffffffc020723e:	7822                	ld	a6,40(sp)
ffffffffc0207240:	010c2b03          	lw	s6,16(s8)
ffffffffc0207244:	e119                	bnez	a0,ffffffffc020724a <stride_dequeue+0x20e0>
ffffffffc0207246:	8caff06f          	j	ffffffffc0206310 <stride_dequeue+0x11a6>
ffffffffc020724a:	01353023          	sd	s3,0(a0)
ffffffffc020724e:	8c2ff06f          	j	ffffffffc0206310 <stride_dequeue+0x11a6>
ffffffffc0207252:	0109b503          	ld	a0,16(s3)
ffffffffc0207256:	0089bb03          	ld	s6,8(s3)
ffffffffc020725a:	85b2                	mv	a1,a2
ffffffffc020725c:	ec46                	sd	a7,24(sp)
ffffffffc020725e:	d2dfd0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc0207262:	00a9b423          	sd	a0,8(s3)
ffffffffc0207266:	0169b823          	sd	s6,16(s3)
ffffffffc020726a:	68e2                	ld	a7,24(sp)
ffffffffc020726c:	010c2b03          	lw	s6,16(s8)
ffffffffc0207270:	c2050963          	beqz	a0,ffffffffc02066a2 <stride_dequeue+0x1538>
ffffffffc0207274:	01353023          	sd	s3,0(a0)
ffffffffc0207278:	c2aff06f          	j	ffffffffc02066a2 <stride_dequeue+0x1538>
ffffffffc020727c:	0109b503          	ld	a0,16(s3)
ffffffffc0207280:	0089bb03          	ld	s6,8(s3)
ffffffffc0207284:	859a                	mv	a1,t1
ffffffffc0207286:	f442                	sd	a6,40(sp)
ffffffffc0207288:	f032                	sd	a2,32(sp)
ffffffffc020728a:	d01fd0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc020728e:	00a9b423          	sd	a0,8(s3)
ffffffffc0207292:	0169b823          	sd	s6,16(s3)
ffffffffc0207296:	7602                	ld	a2,32(sp)
ffffffffc0207298:	7822                	ld	a6,40(sp)
ffffffffc020729a:	010c2b03          	lw	s6,16(s8)
ffffffffc020729e:	7c050363          	beqz	a0,ffffffffc0207a64 <stride_dequeue+0x28fa>
ffffffffc02072a2:	01353023          	sd	s3,0(a0)
ffffffffc02072a6:	834e                	mv	t1,s3
ffffffffc02072a8:	eaeff06f          	j	ffffffffc0206956 <stride_dequeue+0x17ec>
ffffffffc02072ac:	0109b503          	ld	a0,16(s3)
ffffffffc02072b0:	0089bb03          	ld	s6,8(s3)
ffffffffc02072b4:	85c2                	mv	a1,a6
ffffffffc02072b6:	ec32                	sd	a2,24(sp)
ffffffffc02072b8:	cd3fd0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc02072bc:	00a9b423          	sd	a0,8(s3)
ffffffffc02072c0:	0169b823          	sd	s6,16(s3)
ffffffffc02072c4:	6662                	ld	a2,24(sp)
ffffffffc02072c6:	010c2b03          	lw	s6,16(s8)
ffffffffc02072ca:	d2050263          	beqz	a0,ffffffffc02067ee <stride_dequeue+0x1684>
ffffffffc02072ce:	01353023          	sd	s3,0(a0)
ffffffffc02072d2:	d1cff06f          	j	ffffffffc02067ee <stride_dequeue+0x1684>
ffffffffc02072d6:	0109b503          	ld	a0,16(s3)
ffffffffc02072da:	0089bb03          	ld	s6,8(s3)
ffffffffc02072de:	85c2                	mv	a1,a6
ffffffffc02072e0:	cabfd0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc02072e4:	00a9b423          	sd	a0,8(s3)
ffffffffc02072e8:	0169b823          	sd	s6,16(s3)
ffffffffc02072ec:	010c2b03          	lw	s6,16(s8)
ffffffffc02072f0:	c4050b63          	beqz	a0,ffffffffc0206746 <stride_dequeue+0x15dc>
ffffffffc02072f4:	01353023          	sd	s3,0(a0)
ffffffffc02072f8:	c4eff06f          	j	ffffffffc0206746 <stride_dequeue+0x15dc>
ffffffffc02072fc:	0109b503          	ld	a0,16(s3)
ffffffffc0207300:	0089bb03          	ld	s6,8(s3)
ffffffffc0207304:	859a                	mv	a1,t1
ffffffffc0207306:	c85fd0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc020730a:	00a9b423          	sd	a0,8(s3)
ffffffffc020730e:	0169b823          	sd	s6,16(s3)
ffffffffc0207312:	010c2b03          	lw	s6,16(s8)
ffffffffc0207316:	e119                	bnez	a0,ffffffffc020731c <stride_dequeue+0x21b2>
ffffffffc0207318:	c77fe06f          	j	ffffffffc0205f8e <stride_dequeue+0xe24>
ffffffffc020731c:	01353023          	sd	s3,0(a0)
ffffffffc0207320:	c6ffe06f          	j	ffffffffc0205f8e <stride_dequeue+0xe24>
ffffffffc0207324:	6a08                	ld	a0,16(a2)
ffffffffc0207326:	85f2                	mv	a1,t3
ffffffffc0207328:	00863b03          	ld	s6,8(a2)
ffffffffc020732c:	c5ffd0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc0207330:	7602                	ld	a2,32(sp)
ffffffffc0207332:	7822                	ld	a6,40(sp)
ffffffffc0207334:	01663823          	sd	s6,16(a2)
ffffffffc0207338:	e608                	sd	a0,8(a2)
ffffffffc020733a:	010c2b03          	lw	s6,16(s8)
ffffffffc020733e:	e119                	bnez	a0,ffffffffc0207344 <stride_dequeue+0x21da>
ffffffffc0207340:	c9afe06f          	j	ffffffffc02057da <stride_dequeue+0x670>
ffffffffc0207344:	e110                	sd	a2,0(a0)
ffffffffc0207346:	c94fe06f          	j	ffffffffc02057da <stride_dequeue+0x670>
ffffffffc020734a:	010a3503          	ld	a0,16(s4)
ffffffffc020734e:	008a3b03          	ld	s6,8(s4)
ffffffffc0207352:	859a                	mv	a1,t1
ffffffffc0207354:	c37fd0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc0207358:	00aa3423          	sd	a0,8(s4)
ffffffffc020735c:	016a3823          	sd	s6,16(s4)
ffffffffc0207360:	010c2b03          	lw	s6,16(s8)
ffffffffc0207364:	e119                	bnez	a0,ffffffffc020736a <stride_dequeue+0x2200>
ffffffffc0207366:	83dfe06f          	j	ffffffffc0205ba2 <stride_dequeue+0xa38>
ffffffffc020736a:	01453023          	sd	s4,0(a0)
ffffffffc020736e:	835fe06f          	j	ffffffffc0205ba2 <stride_dequeue+0xa38>
ffffffffc0207372:	010cb503          	ld	a0,16(s9)
ffffffffc0207376:	008cbb03          	ld	s6,8(s9)
ffffffffc020737a:	85f2                	mv	a1,t3
ffffffffc020737c:	f442                	sd	a6,40(sp)
ffffffffc020737e:	c0dfd0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc0207382:	00acb423          	sd	a0,8(s9)
ffffffffc0207386:	016cb823          	sd	s6,16(s9)
ffffffffc020738a:	7822                	ld	a6,40(sp)
ffffffffc020738c:	010c2b03          	lw	s6,16(s8)
ffffffffc0207390:	e119                	bnez	a0,ffffffffc0207396 <stride_dequeue+0x222c>
ffffffffc0207392:	b2cfe06f          	j	ffffffffc02056be <stride_dequeue+0x554>
ffffffffc0207396:	01953023          	sd	s9,0(a0)
ffffffffc020739a:	b24fe06f          	j	ffffffffc02056be <stride_dequeue+0x554>
ffffffffc020739e:	010a3503          	ld	a0,16(s4)
ffffffffc02073a2:	008a3b03          	ld	s6,8(s4)
ffffffffc02073a6:	85f2                	mv	a1,t3
ffffffffc02073a8:	f442                	sd	a6,40(sp)
ffffffffc02073aa:	be1fd0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc02073ae:	00aa3423          	sd	a0,8(s4)
ffffffffc02073b2:	016a3823          	sd	s6,16(s4)
ffffffffc02073b6:	7822                	ld	a6,40(sp)
ffffffffc02073b8:	010c2b03          	lw	s6,16(s8)
ffffffffc02073bc:	e119                	bnez	a0,ffffffffc02073c2 <stride_dequeue+0x2258>
ffffffffc02073be:	d1afe06f          	j	ffffffffc02058d8 <stride_dequeue+0x76e>
ffffffffc02073c2:	01453023          	sd	s4,0(a0)
ffffffffc02073c6:	d12fe06f          	j	ffffffffc02058d8 <stride_dequeue+0x76e>
ffffffffc02073ca:	0108b503          	ld	a0,16(a7)
ffffffffc02073ce:	85f2                	mv	a1,t3
ffffffffc02073d0:	0088bb03          	ld	s6,8(a7)
ffffffffc02073d4:	f046                	sd	a7,32(sp)
ffffffffc02073d6:	bb5fd0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc02073da:	7882                	ld	a7,32(sp)
ffffffffc02073dc:	7622                	ld	a2,40(sp)
ffffffffc02073de:	0168b823          	sd	s6,16(a7)
ffffffffc02073e2:	00a8b423          	sd	a0,8(a7)
ffffffffc02073e6:	010c2b03          	lw	s6,16(s8)
ffffffffc02073ea:	e119                	bnez	a0,ffffffffc02073f0 <stride_dequeue+0x2286>
ffffffffc02073ec:	963fe06f          	j	ffffffffc0205d4e <stride_dequeue+0xbe4>
ffffffffc02073f0:	01153023          	sd	a7,0(a0)
ffffffffc02073f4:	95bfe06f          	j	ffffffffc0205d4e <stride_dequeue+0xbe4>
ffffffffc02073f8:	0108b503          	ld	a0,16(a7)
ffffffffc02073fc:	85f2                	mv	a1,t3
ffffffffc02073fe:	0088bb03          	ld	s6,8(a7)
ffffffffc0207402:	f446                	sd	a7,40(sp)
ffffffffc0207404:	b87fd0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc0207408:	78a2                	ld	a7,40(sp)
ffffffffc020740a:	0168b823          	sd	s6,16(a7)
ffffffffc020740e:	00a8b423          	sd	a0,8(a7)
ffffffffc0207412:	010c2b03          	lw	s6,16(s8)
ffffffffc0207416:	e119                	bnez	a0,ffffffffc020741c <stride_dequeue+0x22b2>
ffffffffc0207418:	a05fe06f          	j	ffffffffc0205e1c <stride_dequeue+0xcb2>
ffffffffc020741c:	01153023          	sd	a7,0(a0)
ffffffffc0207420:	9fdfe06f          	j	ffffffffc0205e1c <stride_dequeue+0xcb2>
ffffffffc0207424:	0109b503          	ld	a0,16(s3)
ffffffffc0207428:	0089bb03          	ld	s6,8(s3)
ffffffffc020742c:	85c2                	mv	a1,a6
ffffffffc020742e:	f446                	sd	a7,40(sp)
ffffffffc0207430:	b5bfd0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc0207434:	00a9b423          	sd	a0,8(s3)
ffffffffc0207438:	0169b823          	sd	s6,16(s3)
ffffffffc020743c:	78a2                	ld	a7,40(sp)
ffffffffc020743e:	010c2b03          	lw	s6,16(s8)
ffffffffc0207442:	66050563          	beqz	a0,ffffffffc0207aac <stride_dequeue+0x2942>
ffffffffc0207446:	01353023          	sd	s3,0(a0)
ffffffffc020744a:	884e                	mv	a6,s3
ffffffffc020744c:	d6aff06f          	j	ffffffffc02069b6 <stride_dequeue+0x184c>
ffffffffc0207450:	0109b503          	ld	a0,16(s3)
ffffffffc0207454:	0089bb03          	ld	s6,8(s3)
ffffffffc0207458:	85f2                	mv	a1,t3
ffffffffc020745a:	f442                	sd	a6,40(sp)
ffffffffc020745c:	b2ffd0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc0207460:	00a9b423          	sd	a0,8(s3)
ffffffffc0207464:	0169b823          	sd	s6,16(s3)
ffffffffc0207468:	7822                	ld	a6,40(sp)
ffffffffc020746a:	010c2b03          	lw	s6,16(s8)
ffffffffc020746e:	e119                	bnez	a0,ffffffffc0207474 <stride_dequeue+0x230a>
ffffffffc0207470:	e05fe06f          	j	ffffffffc0206274 <stride_dequeue+0x110a>
ffffffffc0207474:	01353023          	sd	s3,0(a0)
ffffffffc0207478:	dfdfe06f          	j	ffffffffc0206274 <stride_dequeue+0x110a>
ffffffffc020747c:	0109b503          	ld	a0,16(s3)
ffffffffc0207480:	0089bb03          	ld	s6,8(s3)
ffffffffc0207484:	859a                	mv	a1,t1
ffffffffc0207486:	f442                	sd	a6,40(sp)
ffffffffc0207488:	b03fd0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc020748c:	00a9b423          	sd	a0,8(s3)
ffffffffc0207490:	0169b823          	sd	s6,16(s3)
ffffffffc0207494:	7822                	ld	a6,40(sp)
ffffffffc0207496:	010c2b03          	lw	s6,16(s8)
ffffffffc020749a:	64050163          	beqz	a0,ffffffffc0207adc <stride_dequeue+0x2972>
ffffffffc020749e:	01353023          	sd	s3,0(a0)
ffffffffc02074a2:	834e                	mv	t1,s3
ffffffffc02074a4:	d76ff06f          	j	ffffffffc0206a1a <stride_dequeue+0x18b0>
ffffffffc02074a8:	0109b503          	ld	a0,16(s3)
ffffffffc02074ac:	0089bb03          	ld	s6,8(s3)
ffffffffc02074b0:	85f2                	mv	a1,t3
ffffffffc02074b2:	f446                	sd	a7,40(sp)
ffffffffc02074b4:	ad7fd0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc02074b8:	00a9b423          	sd	a0,8(s3)
ffffffffc02074bc:	0169b823          	sd	s6,16(s3)
ffffffffc02074c0:	78a2                	ld	a7,40(sp)
ffffffffc02074c2:	010c2b03          	lw	s6,16(s8)
ffffffffc02074c6:	e119                	bnez	a0,ffffffffc02074cc <stride_dequeue+0x2362>
ffffffffc02074c8:	d0ffe06f          	j	ffffffffc02061d6 <stride_dequeue+0x106c>
ffffffffc02074cc:	01353023          	sd	s3,0(a0)
ffffffffc02074d0:	d07fe06f          	j	ffffffffc02061d6 <stride_dequeue+0x106c>
ffffffffc02074d4:	0109b503          	ld	a0,16(s3)
ffffffffc02074d8:	0089bb03          	ld	s6,8(s3)
ffffffffc02074dc:	859a                	mv	a1,t1
ffffffffc02074de:	aadfd0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc02074e2:	00a9b423          	sd	a0,8(s3)
ffffffffc02074e6:	0169b823          	sd	s6,16(s3)
ffffffffc02074ea:	010c2b03          	lw	s6,16(s8)
ffffffffc02074ee:	e119                	bnez	a0,ffffffffc02074f4 <stride_dequeue+0x238a>
ffffffffc02074f0:	c49fe06f          	j	ffffffffc0206138 <stride_dequeue+0xfce>
ffffffffc02074f4:	01353023          	sd	s3,0(a0)
ffffffffc02074f8:	c41fe06f          	j	ffffffffc0206138 <stride_dequeue+0xfce>
ffffffffc02074fc:	0109b503          	ld	a0,16(s3)
ffffffffc0207500:	0089bb03          	ld	s6,8(s3)
ffffffffc0207504:	859a                	mv	a1,t1
ffffffffc0207506:	ec32                	sd	a2,24(sp)
ffffffffc0207508:	a83fd0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc020750c:	00a9b423          	sd	a0,8(s3)
ffffffffc0207510:	0169b823          	sd	s6,16(s3)
ffffffffc0207514:	6662                	ld	a2,24(sp)
ffffffffc0207516:	010c2b03          	lw	s6,16(s8)
ffffffffc020751a:	e119                	bnez	a0,ffffffffc0207520 <stride_dequeue+0x23b6>
ffffffffc020751c:	b4ffe06f          	j	ffffffffc020606a <stride_dequeue+0xf00>
ffffffffc0207520:	01353023          	sd	s3,0(a0)
ffffffffc0207524:	b47fe06f          	j	ffffffffc020606a <stride_dequeue+0xf00>
ffffffffc0207528:	0108b503          	ld	a0,16(a7)
ffffffffc020752c:	85f2                	mv	a1,t3
ffffffffc020752e:	0088bb03          	ld	s6,8(a7)
ffffffffc0207532:	f446                	sd	a7,40(sp)
ffffffffc0207534:	a57fd0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc0207538:	78a2                	ld	a7,40(sp)
ffffffffc020753a:	0168b823          	sd	s6,16(a7)
ffffffffc020753e:	00a8b423          	sd	a0,8(a7)
ffffffffc0207542:	010c2b03          	lw	s6,16(s8)
ffffffffc0207546:	e119                	bnez	a0,ffffffffc020754c <stride_dequeue+0x23e2>
ffffffffc0207548:	f28fe06f          	j	ffffffffc0205c70 <stride_dequeue+0xb06>
ffffffffc020754c:	01153023          	sd	a7,0(a0)
ffffffffc0207550:	f20fe06f          	j	ffffffffc0205c70 <stride_dequeue+0xb06>
ffffffffc0207554:	0109b503          	ld	a0,16(s3)
ffffffffc0207558:	0089bb03          	ld	s6,8(s3)
ffffffffc020755c:	85d2                	mv	a1,s4
ffffffffc020755e:	f046                	sd	a7,32(sp)
ffffffffc0207560:	a2bfd0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc0207564:	00a9b423          	sd	a0,8(s3)
ffffffffc0207568:	0169b823          	sd	s6,16(s3)
ffffffffc020756c:	7882                	ld	a7,32(sp)
ffffffffc020756e:	010c2b03          	lw	s6,16(s8)
ffffffffc0207572:	e119                	bnez	a0,ffffffffc0207578 <stride_dequeue+0x240e>
ffffffffc0207574:	fe1fe06f          	j	ffffffffc0206554 <stride_dequeue+0x13ea>
ffffffffc0207578:	01353023          	sd	s3,0(a0)
ffffffffc020757c:	fd9fe06f          	j	ffffffffc0206554 <stride_dequeue+0x13ea>
ffffffffc0207580:	0109b503          	ld	a0,16(s3)
ffffffffc0207584:	0089bb03          	ld	s6,8(s3)
ffffffffc0207588:	85c2                	mv	a1,a6
ffffffffc020758a:	a01fd0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc020758e:	00a9b423          	sd	a0,8(s3)
ffffffffc0207592:	0169b823          	sd	s6,16(s3)
ffffffffc0207596:	010c2b03          	lw	s6,16(s8)
ffffffffc020759a:	ae050863          	beqz	a0,ffffffffc020688a <stride_dequeue+0x1720>
ffffffffc020759e:	01353023          	sd	s3,0(a0)
ffffffffc02075a2:	ae8ff06f          	j	ffffffffc020688a <stride_dequeue+0x1720>
ffffffffc02075a6:	89d2                	mv	s3,s4
ffffffffc02075a8:	fadfe06f          	j	ffffffffc0206554 <stride_dequeue+0x13ea>
ffffffffc02075ac:	89ee                	mv	s3,s11
ffffffffc02075ae:	84aff06f          	j	ffffffffc02065f8 <stride_dequeue+0x148e>
ffffffffc02075b2:	89c2                	mv	s3,a6
ffffffffc02075b4:	992ff06f          	j	ffffffffc0206746 <stride_dequeue+0x15dc>
ffffffffc02075b8:	89c2                	mv	s3,a6
ffffffffc02075ba:	a34ff06f          	j	ffffffffc02067ee <stride_dequeue+0x1684>
ffffffffc02075be:	89b2                	mv	s3,a2
ffffffffc02075c0:	8e2ff06f          	j	ffffffffc02066a2 <stride_dequeue+0x1538>
ffffffffc02075c4:	89c2                	mv	s3,a6
ffffffffc02075c6:	ac4ff06f          	j	ffffffffc020688a <stride_dequeue+0x1720>
ffffffffc02075ca:	01083503          	ld	a0,16(a6)
ffffffffc02075ce:	85e6                	mv	a1,s9
ffffffffc02075d0:	00883b03          	ld	s6,8(a6)
ffffffffc02075d4:	9b7fd0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc02075d8:	7802                	ld	a6,32(sp)
ffffffffc02075da:	01683823          	sd	s6,16(a6)
ffffffffc02075de:	00a83423          	sd	a0,8(a6)
ffffffffc02075e2:	010c2b03          	lw	s6,16(s8)
ffffffffc02075e6:	50050163          	beqz	a0,ffffffffc0207ae8 <stride_dequeue+0x297e>
ffffffffc02075ea:	01053023          	sd	a6,0(a0)
ffffffffc02075ee:	8cc2                	mv	s9,a6
ffffffffc02075f0:	d62ff06f          	j	ffffffffc0206b52 <stride_dequeue+0x19e8>
ffffffffc02075f4:	01083503          	ld	a0,16(a6)
ffffffffc02075f8:	85d2                	mv	a1,s4
ffffffffc02075fa:	00883b03          	ld	s6,8(a6)
ffffffffc02075fe:	98dfd0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc0207602:	6862                	ld	a6,24(sp)
ffffffffc0207604:	7602                	ld	a2,32(sp)
ffffffffc0207606:	01683823          	sd	s6,16(a6)
ffffffffc020760a:	00a83423          	sd	a0,8(a6)
ffffffffc020760e:	010c2b03          	lw	s6,16(s8)
ffffffffc0207612:	4c050863          	beqz	a0,ffffffffc0207ae2 <stride_dequeue+0x2978>
ffffffffc0207616:	01053023          	sd	a6,0(a0)
ffffffffc020761a:	8a42                	mv	s4,a6
ffffffffc020761c:	d94ff06f          	j	ffffffffc0206bb0 <stride_dequeue+0x1a46>
ffffffffc0207620:	89f2                	mv	s3,t3
ffffffffc0207622:	bb5fe06f          	j	ffffffffc02061d6 <stride_dequeue+0x106c>
ffffffffc0207626:	88f2                	mv	a7,t3
ffffffffc0207628:	e48fe06f          	j	ffffffffc0205c70 <stride_dequeue+0xb06>
ffffffffc020762c:	89f2                	mv	s3,t3
ffffffffc020762e:	ce3fe06f          	j	ffffffffc0206310 <stride_dequeue+0x11a6>
ffffffffc0207632:	89f2                	mv	s3,t3
ffffffffc0207634:	c41fe06f          	j	ffffffffc0206274 <stride_dequeue+0x110a>
ffffffffc0207638:	88f2                	mv	a7,t3
ffffffffc020763a:	fe2fe06f          	j	ffffffffc0205e1c <stride_dequeue+0xcb2>
ffffffffc020763e:	87ce                	mv	a5,s3
ffffffffc0207640:	ddffe06f          	j	ffffffffc020641e <stride_dequeue+0x12b4>
ffffffffc0207644:	0108b503          	ld	a0,16(a7)
ffffffffc0207648:	85ce                	mv	a1,s3
ffffffffc020764a:	0088bb03          	ld	s6,8(a7)
ffffffffc020764e:	93dfd0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc0207652:	7882                	ld	a7,32(sp)
ffffffffc0207654:	0168b823          	sd	s6,16(a7)
ffffffffc0207658:	00a8b423          	sd	a0,8(a7)
ffffffffc020765c:	010c2b03          	lw	s6,16(s8)
ffffffffc0207660:	42050a63          	beqz	a0,ffffffffc0207a94 <stride_dequeue+0x292a>
ffffffffc0207664:	01153023          	sd	a7,0(a0)
ffffffffc0207668:	89c6                	mv	s3,a7
ffffffffc020766a:	d9cff06f          	j	ffffffffc0206c06 <stride_dequeue+0x1a9c>
ffffffffc020766e:	8cf2                	mv	s9,t3
ffffffffc0207670:	84efe06f          	j	ffffffffc02056be <stride_dequeue+0x554>
ffffffffc0207674:	8a72                	mv	s4,t3
ffffffffc0207676:	a62fe06f          	j	ffffffffc02058d8 <stride_dequeue+0x76e>
ffffffffc020767a:	88f2                	mv	a7,t3
ffffffffc020767c:	ed2fe06f          	j	ffffffffc0205d4e <stride_dequeue+0xbe4>
ffffffffc0207680:	89f2                	mv	s3,t3
ffffffffc0207682:	d33fe06f          	j	ffffffffc02063b4 <stride_dequeue+0x124a>
ffffffffc0207686:	0109b503          	ld	a0,16(s3)
ffffffffc020768a:	0089bb03          	ld	s6,8(s3)
ffffffffc020768e:	85c6                	mv	a1,a7
ffffffffc0207690:	8fbfd0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc0207694:	00a9b423          	sd	a0,8(s3)
ffffffffc0207698:	0169b823          	sd	s6,16(s3)
ffffffffc020769c:	010c2b03          	lw	s6,16(s8)
ffffffffc02076a0:	e119                	bnez	a0,ffffffffc02076a6 <stride_dequeue+0x253c>
ffffffffc02076a2:	dfdfe06f          	j	ffffffffc020649e <stride_dequeue+0x1334>
ffffffffc02076a6:	01353023          	sd	s3,0(a0)
ffffffffc02076aa:	df5fe06f          	j	ffffffffc020649e <stride_dequeue+0x1334>
ffffffffc02076ae:	01083503          	ld	a0,16(a6)
ffffffffc02076b2:	85d2                	mv	a1,s4
ffffffffc02076b4:	00883b03          	ld	s6,8(a6)
ffffffffc02076b8:	8d3fd0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc02076bc:	7802                	ld	a6,32(sp)
ffffffffc02076be:	01683823          	sd	s6,16(a6)
ffffffffc02076c2:	00a83423          	sd	a0,8(a6)
ffffffffc02076c6:	010c2b03          	lw	s6,16(s8)
ffffffffc02076ca:	3a050363          	beqz	a0,ffffffffc0207a70 <stride_dequeue+0x2906>
ffffffffc02076ce:	01053023          	sd	a6,0(a0)
ffffffffc02076d2:	8a42                	mv	s4,a6
ffffffffc02076d4:	c28ff06f          	j	ffffffffc0206afc <stride_dequeue+0x1992>
ffffffffc02076d8:	8672                	mv	a2,t3
ffffffffc02076da:	900fe06f          	j	ffffffffc02057da <stride_dequeue+0x670>
ffffffffc02076de:	0108b503          	ld	a0,16(a7)
ffffffffc02076e2:	85ce                	mv	a1,s3
ffffffffc02076e4:	0088bb03          	ld	s6,8(a7)
ffffffffc02076e8:	8a3fd0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc02076ec:	7882                	ld	a7,32(sp)
ffffffffc02076ee:	7622                	ld	a2,40(sp)
ffffffffc02076f0:	7842                	ld	a6,48(sp)
ffffffffc02076f2:	0168b823          	sd	s6,16(a7)
ffffffffc02076f6:	00a8b423          	sd	a0,8(a7)
ffffffffc02076fa:	010c2b03          	lw	s6,16(s8)
ffffffffc02076fe:	3c050c63          	beqz	a0,ffffffffc0207ad6 <stride_dequeue+0x296c>
ffffffffc0207702:	01153023          	sd	a7,0(a0)
ffffffffc0207706:	89c6                	mv	s3,a7
ffffffffc0207708:	dc0ff06f          	j	ffffffffc0206cc8 <stride_dequeue+0x1b5e>
ffffffffc020770c:	0109b503          	ld	a0,16(s3)
ffffffffc0207710:	0089bb03          	ld	s6,8(s3)
ffffffffc0207714:	85f2                	mv	a1,t3
ffffffffc0207716:	f41a                	sd	t1,40(sp)
ffffffffc0207718:	873fd0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc020771c:	00a9b423          	sd	a0,8(s3)
ffffffffc0207720:	0169b823          	sd	s6,16(s3)
ffffffffc0207724:	7322                	ld	t1,40(sp)
ffffffffc0207726:	010c2b03          	lw	s6,16(s8)
ffffffffc020772a:	e119                	bnez	a0,ffffffffc0207730 <stride_dequeue+0x25c6>
ffffffffc020772c:	9fdfe06f          	j	ffffffffc0206128 <stride_dequeue+0xfbe>
ffffffffc0207730:	01353023          	sd	s3,0(a0)
ffffffffc0207734:	9f5fe06f          	j	ffffffffc0206128 <stride_dequeue+0xfbe>
ffffffffc0207738:	01033503          	ld	a0,16(t1)
ffffffffc020773c:	85e6                	mv	a1,s9
ffffffffc020773e:	00833b03          	ld	s6,8(t1)
ffffffffc0207742:	849fd0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc0207746:	7322                	ld	t1,40(sp)
ffffffffc0207748:	78c2                	ld	a7,48(sp)
ffffffffc020774a:	01633823          	sd	s6,16(t1)
ffffffffc020774e:	00a33423          	sd	a0,8(t1)
ffffffffc0207752:	010c2b03          	lw	s6,16(s8)
ffffffffc0207756:	34050e63          	beqz	a0,ffffffffc0207ab2 <stride_dequeue+0x2948>
ffffffffc020775a:	00653023          	sd	t1,0(a0)
ffffffffc020775e:	8c9a                	mv	s9,t1
ffffffffc0207760:	eeaff06f          	j	ffffffffc0206e4a <stride_dequeue+0x1ce0>
ffffffffc0207764:	01033503          	ld	a0,16(t1)
ffffffffc0207768:	85c2                	mv	a1,a6
ffffffffc020776a:	00833b03          	ld	s6,8(t1)
ffffffffc020776e:	81dfd0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc0207772:	7322                	ld	t1,40(sp)
ffffffffc0207774:	01633823          	sd	s6,16(t1)
ffffffffc0207778:	00a33423          	sd	a0,8(t1)
ffffffffc020777c:	010c2b03          	lw	s6,16(s8)
ffffffffc0207780:	32050c63          	beqz	a0,ffffffffc0207ab8 <stride_dequeue+0x294e>
ffffffffc0207784:	00653023          	sd	t1,0(a0)
ffffffffc0207788:	881a                	mv	a6,t1
ffffffffc020778a:	f24ff06f          	j	ffffffffc0206eae <stride_dequeue+0x1d44>
ffffffffc020778e:	0108b503          	ld	a0,16(a7)
ffffffffc0207792:	85ce                	mv	a1,s3
ffffffffc0207794:	0088bb03          	ld	s6,8(a7)
ffffffffc0207798:	ff2fd0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc020779c:	78a2                	ld	a7,40(sp)
ffffffffc020779e:	7842                	ld	a6,48(sp)
ffffffffc02077a0:	0168b823          	sd	s6,16(a7)
ffffffffc02077a4:	00a8b423          	sd	a0,8(a7)
ffffffffc02077a8:	010c2b03          	lw	s6,16(s8)
ffffffffc02077ac:	30050963          	beqz	a0,ffffffffc0207abe <stride_dequeue+0x2954>
ffffffffc02077b0:	01153023          	sd	a7,0(a0)
ffffffffc02077b4:	89c6                	mv	s3,a7
ffffffffc02077b6:	caeff06f          	j	ffffffffc0206c64 <stride_dequeue+0x1afa>
ffffffffc02077ba:	01083503          	ld	a0,16(a6)
ffffffffc02077be:	85ce                	mv	a1,s3
ffffffffc02077c0:	00883b03          	ld	s6,8(a6)
ffffffffc02077c4:	fc6fd0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc02077c8:	7822                	ld	a6,40(sp)
ffffffffc02077ca:	78c2                	ld	a7,48(sp)
ffffffffc02077cc:	01683823          	sd	s6,16(a6)
ffffffffc02077d0:	00a83423          	sd	a0,8(a6)
ffffffffc02077d4:	010c2b03          	lw	s6,16(s8)
ffffffffc02077d8:	30050b63          	beqz	a0,ffffffffc0207aee <stride_dequeue+0x2984>
ffffffffc02077dc:	01053023          	sd	a6,0(a0)
ffffffffc02077e0:	89c2                	mv	s3,a6
ffffffffc02077e2:	da6ff06f          	j	ffffffffc0206d88 <stride_dequeue+0x1c1e>
ffffffffc02077e6:	01083503          	ld	a0,16(a6)
ffffffffc02077ea:	85ce                	mv	a1,s3
ffffffffc02077ec:	00883b03          	ld	s6,8(a6)
ffffffffc02077f0:	f9afd0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc02077f4:	7802                	ld	a6,32(sp)
ffffffffc02077f6:	7622                	ld	a2,40(sp)
ffffffffc02077f8:	78c2                	ld	a7,48(sp)
ffffffffc02077fa:	01683823          	sd	s6,16(a6)
ffffffffc02077fe:	00a83423          	sd	a0,8(a6)
ffffffffc0207802:	010c2b03          	lw	s6,16(s8)
ffffffffc0207806:	2a050063          	beqz	a0,ffffffffc0207aa6 <stride_dequeue+0x293c>
ffffffffc020780a:	01053023          	sd	a6,0(a0)
ffffffffc020780e:	89c2                	mv	s3,a6
ffffffffc0207810:	ddcff06f          	j	ffffffffc0206dec <stride_dequeue+0x1c82>
ffffffffc0207814:	0109b503          	ld	a0,16(s3)
ffffffffc0207818:	0089bb03          	ld	s6,8(s3)
ffffffffc020781c:	85f2                	mv	a1,t3
ffffffffc020781e:	f41a                	sd	t1,40(sp)
ffffffffc0207820:	f6afd0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc0207824:	00a9b423          	sd	a0,8(s3)
ffffffffc0207828:	0169b823          	sd	s6,16(s3)
ffffffffc020782c:	7322                	ld	t1,40(sp)
ffffffffc020782e:	010c2b03          	lw	s6,16(s8)
ffffffffc0207832:	e119                	bnez	a0,ffffffffc0207838 <stride_dequeue+0x26ce>
ffffffffc0207834:	f4afe06f          	j	ffffffffc0205f7e <stride_dequeue+0xe14>
ffffffffc0207838:	01353023          	sd	s3,0(a0)
ffffffffc020783c:	f42fe06f          	j	ffffffffc0205f7e <stride_dequeue+0xe14>
ffffffffc0207840:	0109b503          	ld	a0,16(s3)
ffffffffc0207844:	0089bb03          	ld	s6,8(s3)
ffffffffc0207848:	85f2                	mv	a1,t3
ffffffffc020784a:	f446                	sd	a7,40(sp)
ffffffffc020784c:	f3efd0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc0207850:	00a9b423          	sd	a0,8(s3)
ffffffffc0207854:	0169b823          	sd	s6,16(s3)
ffffffffc0207858:	78a2                	ld	a7,40(sp)
ffffffffc020785a:	010c2b03          	lw	s6,16(s8)
ffffffffc020785e:	e119                	bnez	a0,ffffffffc0207864 <stride_dequeue+0x26fa>
ffffffffc0207860:	ce5fe06f          	j	ffffffffc0206544 <stride_dequeue+0x13da>
ffffffffc0207864:	01353023          	sd	s3,0(a0)
ffffffffc0207868:	cddfe06f          	j	ffffffffc0206544 <stride_dequeue+0x13da>
ffffffffc020786c:	0109b503          	ld	a0,16(s3)
ffffffffc0207870:	0089bb03          	ld	s6,8(s3)
ffffffffc0207874:	85f2                	mv	a1,t3
ffffffffc0207876:	f446                	sd	a7,40(sp)
ffffffffc0207878:	f032                	sd	a2,32(sp)
ffffffffc020787a:	f10fd0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc020787e:	00a9b423          	sd	a0,8(s3)
ffffffffc0207882:	0169b823          	sd	s6,16(s3)
ffffffffc0207886:	7602                	ld	a2,32(sp)
ffffffffc0207888:	78a2                	ld	a7,40(sp)
ffffffffc020788a:	010c2b03          	lw	s6,16(s8)
ffffffffc020788e:	e119                	bnez	a0,ffffffffc0207894 <stride_dequeue+0x272a>
ffffffffc0207890:	e05fe06f          	j	ffffffffc0206694 <stride_dequeue+0x152a>
ffffffffc0207894:	01353023          	sd	s3,0(a0)
ffffffffc0207898:	dfdfe06f          	j	ffffffffc0206694 <stride_dequeue+0x152a>
ffffffffc020789c:	010a3503          	ld	a0,16(s4)
ffffffffc02078a0:	008a3b03          	ld	s6,8(s4)
ffffffffc02078a4:	85f2                	mv	a1,t3
ffffffffc02078a6:	f41a                	sd	t1,40(sp)
ffffffffc02078a8:	ee2fd0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc02078ac:	00aa3423          	sd	a0,8(s4)
ffffffffc02078b0:	016a3823          	sd	s6,16(s4)
ffffffffc02078b4:	7322                	ld	t1,40(sp)
ffffffffc02078b6:	010c2b03          	lw	s6,16(s8)
ffffffffc02078ba:	e119                	bnez	a0,ffffffffc02078c0 <stride_dequeue+0x2756>
ffffffffc02078bc:	ad6fe06f          	j	ffffffffc0205b92 <stride_dequeue+0xa28>
ffffffffc02078c0:	01453023          	sd	s4,0(a0)
ffffffffc02078c4:	acefe06f          	j	ffffffffc0205b92 <stride_dequeue+0xa28>
ffffffffc02078c8:	0109b503          	ld	a0,16(s3)
ffffffffc02078cc:	0089bb03          	ld	s6,8(s3)
ffffffffc02078d0:	85f2                	mv	a1,t3
ffffffffc02078d2:	f446                	sd	a7,40(sp)
ffffffffc02078d4:	eb6fd0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc02078d8:	00a9b423          	sd	a0,8(s3)
ffffffffc02078dc:	0169b823          	sd	s6,16(s3)
ffffffffc02078e0:	78a2                	ld	a7,40(sp)
ffffffffc02078e2:	010c2b03          	lw	s6,16(s8)
ffffffffc02078e6:	e119                	bnez	a0,ffffffffc02078ec <stride_dequeue+0x2782>
ffffffffc02078e8:	d01fe06f          	j	ffffffffc02065e8 <stride_dequeue+0x147e>
ffffffffc02078ec:	01353023          	sd	s3,0(a0)
ffffffffc02078f0:	cf9fe06f          	j	ffffffffc02065e8 <stride_dequeue+0x147e>
ffffffffc02078f4:	01033503          	ld	a0,16(t1)
ffffffffc02078f8:	85c2                	mv	a1,a6
ffffffffc02078fa:	00833b03          	ld	s6,8(t1)
ffffffffc02078fe:	e8cfd0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc0207902:	7322                	ld	t1,40(sp)
ffffffffc0207904:	01633823          	sd	s6,16(t1)
ffffffffc0207908:	00a33423          	sd	a0,8(t1)
ffffffffc020790c:	010c2b03          	lw	s6,16(s8)
ffffffffc0207910:	1e050b63          	beqz	a0,ffffffffc0207b06 <stride_dequeue+0x299c>
ffffffffc0207914:	00653023          	sd	t1,0(a0)
ffffffffc0207918:	881a                	mv	a6,t1
ffffffffc020791a:	e50ff06f          	j	ffffffffc0206f6a <stride_dequeue+0x1e00>
ffffffffc020791e:	0109b503          	ld	a0,16(s3)
ffffffffc0207922:	0089bb03          	ld	s6,8(s3)
ffffffffc0207926:	85f2                	mv	a1,t3
ffffffffc0207928:	f442                	sd	a6,40(sp)
ffffffffc020792a:	f032                	sd	a2,32(sp)
ffffffffc020792c:	e5efd0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc0207930:	00a9b423          	sd	a0,8(s3)
ffffffffc0207934:	0169b823          	sd	s6,16(s3)
ffffffffc0207938:	7602                	ld	a2,32(sp)
ffffffffc020793a:	7822                	ld	a6,40(sp)
ffffffffc020793c:	010c2b03          	lw	s6,16(s8)
ffffffffc0207940:	e119                	bnez	a0,ffffffffc0207946 <stride_dequeue+0x27dc>
ffffffffc0207942:	e9dfe06f          	j	ffffffffc02067de <stride_dequeue+0x1674>
ffffffffc0207946:	01353023          	sd	s3,0(a0)
ffffffffc020794a:	e95fe06f          	j	ffffffffc02067de <stride_dequeue+0x1674>
ffffffffc020794e:	0108b503          	ld	a0,16(a7)
ffffffffc0207952:	85ce                	mv	a1,s3
ffffffffc0207954:	0088bb03          	ld	s6,8(a7)
ffffffffc0207958:	e32fd0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc020795c:	78a2                	ld	a7,40(sp)
ffffffffc020795e:	7842                	ld	a6,48(sp)
ffffffffc0207960:	0168b823          	sd	s6,16(a7)
ffffffffc0207964:	00a8b423          	sd	a0,8(a7)
ffffffffc0207968:	010c2b03          	lw	s6,16(s8)
ffffffffc020796c:	0e050f63          	beqz	a0,ffffffffc0207a6a <stride_dequeue+0x2900>
ffffffffc0207970:	01153023          	sd	a7,0(a0)
ffffffffc0207974:	89c6                	mv	s3,a7
ffffffffc0207976:	d96ff06f          	j	ffffffffc0206f0c <stride_dequeue+0x1da2>
ffffffffc020797a:	01083503          	ld	a0,16(a6)
ffffffffc020797e:	85ce                	mv	a1,s3
ffffffffc0207980:	00883b03          	ld	s6,8(a6)
ffffffffc0207984:	e06fd0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc0207988:	7822                	ld	a6,40(sp)
ffffffffc020798a:	78c2                	ld	a7,48(sp)
ffffffffc020798c:	01683823          	sd	s6,16(a6)
ffffffffc0207990:	00a83423          	sd	a0,8(a6)
ffffffffc0207994:	010c2b03          	lw	s6,16(s8)
ffffffffc0207998:	0e050b63          	beqz	a0,ffffffffc0207a8e <stride_dequeue+0x2924>
ffffffffc020799c:	01053023          	sd	a6,0(a0)
ffffffffc02079a0:	89c2                	mv	s3,a6
ffffffffc02079a2:	b88ff06f          	j	ffffffffc0206d2a <stride_dequeue+0x1bc0>
ffffffffc02079a6:	0109b503          	ld	a0,16(s3)
ffffffffc02079aa:	0089bb03          	ld	s6,8(s3)
ffffffffc02079ae:	85f2                	mv	a1,t3
ffffffffc02079b0:	f442                	sd	a6,40(sp)
ffffffffc02079b2:	dd8fd0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc02079b6:	00a9b423          	sd	a0,8(s3)
ffffffffc02079ba:	0169b823          	sd	s6,16(s3)
ffffffffc02079be:	7822                	ld	a6,40(sp)
ffffffffc02079c0:	010c2b03          	lw	s6,16(s8)
ffffffffc02079c4:	e119                	bnez	a0,ffffffffc02079ca <stride_dequeue+0x2860>
ffffffffc02079c6:	d71fe06f          	j	ffffffffc0206736 <stride_dequeue+0x15cc>
ffffffffc02079ca:	01353023          	sd	s3,0(a0)
ffffffffc02079ce:	d69fe06f          	j	ffffffffc0206736 <stride_dequeue+0x15cc>
ffffffffc02079d2:	0109b503          	ld	a0,16(s3)
ffffffffc02079d6:	0089bb03          	ld	s6,8(s3)
ffffffffc02079da:	85f2                	mv	a1,t3
ffffffffc02079dc:	f442                	sd	a6,40(sp)
ffffffffc02079de:	dacfd0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc02079e2:	00a9b423          	sd	a0,8(s3)
ffffffffc02079e6:	0169b823          	sd	s6,16(s3)
ffffffffc02079ea:	7822                	ld	a6,40(sp)
ffffffffc02079ec:	010c2b03          	lw	s6,16(s8)
ffffffffc02079f0:	e119                	bnez	a0,ffffffffc02079f6 <stride_dequeue+0x288c>
ffffffffc02079f2:	e89fe06f          	j	ffffffffc020687a <stride_dequeue+0x1710>
ffffffffc02079f6:	01353023          	sd	s3,0(a0)
ffffffffc02079fa:	e81fe06f          	j	ffffffffc020687a <stride_dequeue+0x1710>
ffffffffc02079fe:	89c6                	mv	s3,a7
ffffffffc0207a00:	a9ffe06f          	j	ffffffffc020649e <stride_dequeue+0x1334>
ffffffffc0207a04:	0109b503          	ld	a0,16(s3)
ffffffffc0207a08:	0089bb03          	ld	s6,8(s3)
ffffffffc0207a0c:	85f2                	mv	a1,t3
ffffffffc0207a0e:	f41a                	sd	t1,40(sp)
ffffffffc0207a10:	f032                	sd	a2,32(sp)
ffffffffc0207a12:	d78fd0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc0207a16:	00a9b423          	sd	a0,8(s3)
ffffffffc0207a1a:	0169b823          	sd	s6,16(s3)
ffffffffc0207a1e:	7602                	ld	a2,32(sp)
ffffffffc0207a20:	7322                	ld	t1,40(sp)
ffffffffc0207a22:	010c2b03          	lw	s6,16(s8)
ffffffffc0207a26:	e119                	bnez	a0,ffffffffc0207a2c <stride_dequeue+0x28c2>
ffffffffc0207a28:	e32fe06f          	j	ffffffffc020605a <stride_dequeue+0xef0>
ffffffffc0207a2c:	01353023          	sd	s3,0(a0)
ffffffffc0207a30:	e2afe06f          	j	ffffffffc020605a <stride_dequeue+0xef0>
ffffffffc0207a34:	01033503          	ld	a0,16(t1)
ffffffffc0207a38:	85c2                	mv	a1,a6
ffffffffc0207a3a:	00833b03          	ld	s6,8(t1)
ffffffffc0207a3e:	d4cfd0ef          	jal	ra,ffffffffc0204f8a <skew_heap_merge.constprop.0>
ffffffffc0207a42:	7302                	ld	t1,32(sp)
ffffffffc0207a44:	7622                	ld	a2,40(sp)
ffffffffc0207a46:	01633823          	sd	s6,16(t1)
ffffffffc0207a4a:	00a33423          	sd	a0,8(t1)
ffffffffc0207a4e:	010c2b03          	lw	s6,16(s8)
ffffffffc0207a52:	c115                	beqz	a0,ffffffffc0207a76 <stride_dequeue+0x290c>
ffffffffc0207a54:	00653023          	sd	t1,0(a0)
ffffffffc0207a58:	881a                	mv	a6,t1
ffffffffc0207a5a:	d76ff06f          	j	ffffffffc0206fd0 <stride_dequeue+0x1e66>
ffffffffc0207a5e:	89f2                	mv	s3,t3
ffffffffc0207a60:	e1bfe06f          	j	ffffffffc020687a <stride_dequeue+0x1710>
ffffffffc0207a64:	834e                	mv	t1,s3
ffffffffc0207a66:	ef1fe06f          	j	ffffffffc0206956 <stride_dequeue+0x17ec>
ffffffffc0207a6a:	89c6                	mv	s3,a7
ffffffffc0207a6c:	ca0ff06f          	j	ffffffffc0206f0c <stride_dequeue+0x1da2>
ffffffffc0207a70:	8a42                	mv	s4,a6
ffffffffc0207a72:	88aff06f          	j	ffffffffc0206afc <stride_dequeue+0x1992>
ffffffffc0207a76:	881a                	mv	a6,t1
ffffffffc0207a78:	d58ff06f          	j	ffffffffc0206fd0 <stride_dequeue+0x1e66>
ffffffffc0207a7c:	89f2                	mv	s3,t3
ffffffffc0207a7e:	ddcfe06f          	j	ffffffffc020605a <stride_dequeue+0xef0>
ffffffffc0207a82:	834e                	mv	t1,s3
ffffffffc0207a84:	e69fe06f          	j	ffffffffc02068ec <stride_dequeue+0x1782>
ffffffffc0207a88:	89f2                	mv	s3,t3
ffffffffc0207a8a:	cadfe06f          	j	ffffffffc0206736 <stride_dequeue+0x15cc>
ffffffffc0207a8e:	89c2                	mv	s3,a6
ffffffffc0207a90:	a9aff06f          	j	ffffffffc0206d2a <stride_dequeue+0x1bc0>
ffffffffc0207a94:	89c6                	mv	s3,a7
ffffffffc0207a96:	970ff06f          	j	ffffffffc0206c06 <stride_dequeue+0x1a9c>
ffffffffc0207a9a:	834e                	mv	t1,s3
ffffffffc0207a9c:	fdffe06f          	j	ffffffffc0206a7a <stride_dequeue+0x1910>
ffffffffc0207aa0:	89f2                	mv	s3,t3
ffffffffc0207aa2:	cdcfe06f          	j	ffffffffc0205f7e <stride_dequeue+0xe14>
ffffffffc0207aa6:	89c2                	mv	s3,a6
ffffffffc0207aa8:	b44ff06f          	j	ffffffffc0206dec <stride_dequeue+0x1c82>
ffffffffc0207aac:	884e                	mv	a6,s3
ffffffffc0207aae:	f09fe06f          	j	ffffffffc02069b6 <stride_dequeue+0x184c>
ffffffffc0207ab2:	8c9a                	mv	s9,t1
ffffffffc0207ab4:	b96ff06f          	j	ffffffffc0206e4a <stride_dequeue+0x1ce0>
ffffffffc0207ab8:	881a                	mv	a6,t1
ffffffffc0207aba:	bf4ff06f          	j	ffffffffc0206eae <stride_dequeue+0x1d44>
ffffffffc0207abe:	89c6                	mv	s3,a7
ffffffffc0207ac0:	9a4ff06f          	j	ffffffffc0206c64 <stride_dequeue+0x1afa>
ffffffffc0207ac4:	89f2                	mv	s3,t3
ffffffffc0207ac6:	a7ffe06f          	j	ffffffffc0206544 <stride_dequeue+0x13da>
ffffffffc0207aca:	89f2                	mv	s3,t3
ffffffffc0207acc:	bc9fe06f          	j	ffffffffc0206694 <stride_dequeue+0x152a>
ffffffffc0207ad0:	89f2                	mv	s3,t3
ffffffffc0207ad2:	e56fe06f          	j	ffffffffc0206128 <stride_dequeue+0xfbe>
ffffffffc0207ad6:	89c6                	mv	s3,a7
ffffffffc0207ad8:	9f0ff06f          	j	ffffffffc0206cc8 <stride_dequeue+0x1b5e>
ffffffffc0207adc:	834e                	mv	t1,s3
ffffffffc0207ade:	f3dfe06f          	j	ffffffffc0206a1a <stride_dequeue+0x18b0>
ffffffffc0207ae2:	8a42                	mv	s4,a6
ffffffffc0207ae4:	8ccff06f          	j	ffffffffc0206bb0 <stride_dequeue+0x1a46>
ffffffffc0207ae8:	8cc2                	mv	s9,a6
ffffffffc0207aea:	868ff06f          	j	ffffffffc0206b52 <stride_dequeue+0x19e8>
ffffffffc0207aee:	89c2                	mv	s3,a6
ffffffffc0207af0:	a98ff06f          	j	ffffffffc0206d88 <stride_dequeue+0x1c1e>
ffffffffc0207af4:	8a72                	mv	s4,t3
ffffffffc0207af6:	89cfe06f          	j	ffffffffc0205b92 <stride_dequeue+0xa28>
ffffffffc0207afa:	89f2                	mv	s3,t3
ffffffffc0207afc:	aedfe06f          	j	ffffffffc02065e8 <stride_dequeue+0x147e>
ffffffffc0207b00:	89f2                	mv	s3,t3
ffffffffc0207b02:	cddfe06f          	j	ffffffffc02067de <stride_dequeue+0x1674>
ffffffffc0207b06:	881a                	mv	a6,t1
ffffffffc0207b08:	c62ff06f          	j	ffffffffc0206f6a <stride_dequeue+0x1e00>

ffffffffc0207b0c <sys_getpid>:
ffffffffc0207b0c:	00038797          	auipc	a5,0x38
ffffffffc0207b10:	3dc7b783          	ld	a5,988(a5) # ffffffffc023fee8 <current>
ffffffffc0207b14:	43c8                	lw	a0,4(a5)
ffffffffc0207b16:	8082                	ret

ffffffffc0207b18 <sys_pgdir>:
ffffffffc0207b18:	4501                	li	a0,0
ffffffffc0207b1a:	8082                	ret

ffffffffc0207b1c <sys_gettime>:
ffffffffc0207b1c:	00038797          	auipc	a5,0x38
ffffffffc0207b20:	3fc7b783          	ld	a5,1020(a5) # ffffffffc023ff18 <ticks>
ffffffffc0207b24:	0027951b          	slliw	a0,a5,0x2
ffffffffc0207b28:	9d3d                	addw	a0,a0,a5
ffffffffc0207b2a:	0015151b          	slliw	a0,a0,0x1
ffffffffc0207b2e:	8082                	ret

ffffffffc0207b30 <sys_lab6_set_priority>:
ffffffffc0207b30:	4108                	lw	a0,0(a0)
ffffffffc0207b32:	1141                	addi	sp,sp,-16
ffffffffc0207b34:	e406                	sd	ra,8(sp)
ffffffffc0207b36:	ee5fc0ef          	jal	ra,ffffffffc0204a1a <lab6_set_priority>
ffffffffc0207b3a:	60a2                	ld	ra,8(sp)
ffffffffc0207b3c:	4501                	li	a0,0
ffffffffc0207b3e:	0141                	addi	sp,sp,16
ffffffffc0207b40:	8082                	ret

ffffffffc0207b42 <sys_putc>:
ffffffffc0207b42:	4108                	lw	a0,0(a0)
ffffffffc0207b44:	1141                	addi	sp,sp,-16
ffffffffc0207b46:	e406                	sd	ra,8(sp)
ffffffffc0207b48:	dbaf80ef          	jal	ra,ffffffffc0200102 <cputchar>
ffffffffc0207b4c:	60a2                	ld	ra,8(sp)
ffffffffc0207b4e:	4501                	li	a0,0
ffffffffc0207b50:	0141                	addi	sp,sp,16
ffffffffc0207b52:	8082                	ret

ffffffffc0207b54 <sys_kill>:
ffffffffc0207b54:	4108                	lw	a0,0(a0)
ffffffffc0207b56:	d2dfc06f          	j	ffffffffc0204882 <do_kill>

ffffffffc0207b5a <sys_sleep>:
ffffffffc0207b5a:	4108                	lw	a0,0(a0)
ffffffffc0207b5c:	ef9fc06f          	j	ffffffffc0204a54 <do_sleep>

ffffffffc0207b60 <sys_yield>:
ffffffffc0207b60:	cd5fc06f          	j	ffffffffc0204834 <do_yield>

ffffffffc0207b64 <sys_exec>:
ffffffffc0207b64:	6d14                	ld	a3,24(a0)
ffffffffc0207b66:	6910                	ld	a2,16(a0)
ffffffffc0207b68:	650c                	ld	a1,8(a0)
ffffffffc0207b6a:	6108                	ld	a0,0(a0)
ffffffffc0207b6c:	f3efc06f          	j	ffffffffc02042aa <do_execve>

ffffffffc0207b70 <sys_wait>:
ffffffffc0207b70:	650c                	ld	a1,8(a0)
ffffffffc0207b72:	4108                	lw	a0,0(a0)
ffffffffc0207b74:	cd1fc06f          	j	ffffffffc0204844 <do_wait>

ffffffffc0207b78 <sys_fork>:
ffffffffc0207b78:	00038797          	auipc	a5,0x38
ffffffffc0207b7c:	3707b783          	ld	a5,880(a5) # ffffffffc023fee8 <current>
ffffffffc0207b80:	73d0                	ld	a2,160(a5)
ffffffffc0207b82:	4501                	li	a0,0
ffffffffc0207b84:	6a0c                	ld	a1,16(a2)
ffffffffc0207b86:	ebbfb06f          	j	ffffffffc0203a40 <do_fork>

ffffffffc0207b8a <sys_exit>:
ffffffffc0207b8a:	4108                	lw	a0,0(a0)
ffffffffc0207b8c:	ad6fc06f          	j	ffffffffc0203e62 <do_exit>

ffffffffc0207b90 <syscall>:
ffffffffc0207b90:	715d                	addi	sp,sp,-80
ffffffffc0207b92:	fc26                	sd	s1,56(sp)
ffffffffc0207b94:	00038497          	auipc	s1,0x38
ffffffffc0207b98:	35448493          	addi	s1,s1,852 # ffffffffc023fee8 <current>
ffffffffc0207b9c:	6098                	ld	a4,0(s1)
ffffffffc0207b9e:	e0a2                	sd	s0,64(sp)
ffffffffc0207ba0:	f84a                	sd	s2,48(sp)
ffffffffc0207ba2:	7340                	ld	s0,160(a4)
ffffffffc0207ba4:	e486                	sd	ra,72(sp)
ffffffffc0207ba6:	0ff00793          	li	a5,255
ffffffffc0207baa:	05042903          	lw	s2,80(s0)
ffffffffc0207bae:	0327ee63          	bltu	a5,s2,ffffffffc0207bea <syscall+0x5a>
ffffffffc0207bb2:	00391713          	slli	a4,s2,0x3
ffffffffc0207bb6:	00002797          	auipc	a5,0x2
ffffffffc0207bba:	1da78793          	addi	a5,a5,474 # ffffffffc0209d90 <syscalls>
ffffffffc0207bbe:	97ba                	add	a5,a5,a4
ffffffffc0207bc0:	639c                	ld	a5,0(a5)
ffffffffc0207bc2:	c785                	beqz	a5,ffffffffc0207bea <syscall+0x5a>
ffffffffc0207bc4:	6c28                	ld	a0,88(s0)
ffffffffc0207bc6:	702c                	ld	a1,96(s0)
ffffffffc0207bc8:	7430                	ld	a2,104(s0)
ffffffffc0207bca:	7834                	ld	a3,112(s0)
ffffffffc0207bcc:	7c38                	ld	a4,120(s0)
ffffffffc0207bce:	e42a                	sd	a0,8(sp)
ffffffffc0207bd0:	e82e                	sd	a1,16(sp)
ffffffffc0207bd2:	ec32                	sd	a2,24(sp)
ffffffffc0207bd4:	f036                	sd	a3,32(sp)
ffffffffc0207bd6:	f43a                	sd	a4,40(sp)
ffffffffc0207bd8:	0028                	addi	a0,sp,8
ffffffffc0207bda:	9782                	jalr	a5
ffffffffc0207bdc:	60a6                	ld	ra,72(sp)
ffffffffc0207bde:	e828                	sd	a0,80(s0)
ffffffffc0207be0:	6406                	ld	s0,64(sp)
ffffffffc0207be2:	74e2                	ld	s1,56(sp)
ffffffffc0207be4:	7942                	ld	s2,48(sp)
ffffffffc0207be6:	6161                	addi	sp,sp,80
ffffffffc0207be8:	8082                	ret
ffffffffc0207bea:	8522                	mv	a0,s0
ffffffffc0207bec:	c3bf80ef          	jal	ra,ffffffffc0200826 <print_trapframe>
ffffffffc0207bf0:	609c                	ld	a5,0(s1)
ffffffffc0207bf2:	86ca                	mv	a3,s2
ffffffffc0207bf4:	00002617          	auipc	a2,0x2
ffffffffc0207bf8:	15460613          	addi	a2,a2,340 # ffffffffc0209d48 <default_pmm_manager+0x8c8>
ffffffffc0207bfc:	43d8                	lw	a4,4(a5)
ffffffffc0207bfe:	07300593          	li	a1,115
ffffffffc0207c02:	0b478793          	addi	a5,a5,180
ffffffffc0207c06:	00002517          	auipc	a0,0x2
ffffffffc0207c0a:	17250513          	addi	a0,a0,370 # ffffffffc0209d78 <default_pmm_manager+0x8f8>
ffffffffc0207c0e:	dfaf80ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0207c12 <strnlen>:
ffffffffc0207c12:	872a                	mv	a4,a0
ffffffffc0207c14:	4501                	li	a0,0
ffffffffc0207c16:	e589                	bnez	a1,ffffffffc0207c20 <strnlen+0xe>
ffffffffc0207c18:	a811                	j	ffffffffc0207c2c <strnlen+0x1a>
ffffffffc0207c1a:	0505                	addi	a0,a0,1
ffffffffc0207c1c:	00a58763          	beq	a1,a0,ffffffffc0207c2a <strnlen+0x18>
ffffffffc0207c20:	00a707b3          	add	a5,a4,a0
ffffffffc0207c24:	0007c783          	lbu	a5,0(a5)
ffffffffc0207c28:	fbed                	bnez	a5,ffffffffc0207c1a <strnlen+0x8>
ffffffffc0207c2a:	8082                	ret
ffffffffc0207c2c:	8082                	ret

ffffffffc0207c2e <strcmp>:
ffffffffc0207c2e:	00054783          	lbu	a5,0(a0)
ffffffffc0207c32:	0005c703          	lbu	a4,0(a1)
ffffffffc0207c36:	cb89                	beqz	a5,ffffffffc0207c48 <strcmp+0x1a>
ffffffffc0207c38:	0505                	addi	a0,a0,1
ffffffffc0207c3a:	0585                	addi	a1,a1,1
ffffffffc0207c3c:	fee789e3          	beq	a5,a4,ffffffffc0207c2e <strcmp>
ffffffffc0207c40:	0007851b          	sext.w	a0,a5
ffffffffc0207c44:	9d19                	subw	a0,a0,a4
ffffffffc0207c46:	8082                	ret
ffffffffc0207c48:	4501                	li	a0,0
ffffffffc0207c4a:	bfed                	j	ffffffffc0207c44 <strcmp+0x16>

ffffffffc0207c4c <strchr>:
ffffffffc0207c4c:	00054783          	lbu	a5,0(a0)
ffffffffc0207c50:	c799                	beqz	a5,ffffffffc0207c5e <strchr+0x12>
ffffffffc0207c52:	00f58763          	beq	a1,a5,ffffffffc0207c60 <strchr+0x14>
ffffffffc0207c56:	00154783          	lbu	a5,1(a0)
ffffffffc0207c5a:	0505                	addi	a0,a0,1
ffffffffc0207c5c:	fbfd                	bnez	a5,ffffffffc0207c52 <strchr+0x6>
ffffffffc0207c5e:	4501                	li	a0,0
ffffffffc0207c60:	8082                	ret

ffffffffc0207c62 <memset>:
ffffffffc0207c62:	ca01                	beqz	a2,ffffffffc0207c72 <memset+0x10>
ffffffffc0207c64:	962a                	add	a2,a2,a0
ffffffffc0207c66:	87aa                	mv	a5,a0
ffffffffc0207c68:	0785                	addi	a5,a5,1
ffffffffc0207c6a:	feb78fa3          	sb	a1,-1(a5)
ffffffffc0207c6e:	fec79de3          	bne	a5,a2,ffffffffc0207c68 <memset+0x6>
ffffffffc0207c72:	8082                	ret

ffffffffc0207c74 <memcpy>:
ffffffffc0207c74:	ca19                	beqz	a2,ffffffffc0207c8a <memcpy+0x16>
ffffffffc0207c76:	962e                	add	a2,a2,a1
ffffffffc0207c78:	87aa                	mv	a5,a0
ffffffffc0207c7a:	0005c703          	lbu	a4,0(a1)
ffffffffc0207c7e:	0585                	addi	a1,a1,1
ffffffffc0207c80:	0785                	addi	a5,a5,1
ffffffffc0207c82:	fee78fa3          	sb	a4,-1(a5)
ffffffffc0207c86:	fec59ae3          	bne	a1,a2,ffffffffc0207c7a <memcpy+0x6>
ffffffffc0207c8a:	8082                	ret

ffffffffc0207c8c <printnum>:
ffffffffc0207c8c:	02069813          	slli	a6,a3,0x20
ffffffffc0207c90:	7179                	addi	sp,sp,-48
ffffffffc0207c92:	02085813          	srli	a6,a6,0x20
ffffffffc0207c96:	e052                	sd	s4,0(sp)
ffffffffc0207c98:	03067a33          	remu	s4,a2,a6
ffffffffc0207c9c:	f022                	sd	s0,32(sp)
ffffffffc0207c9e:	ec26                	sd	s1,24(sp)
ffffffffc0207ca0:	e84a                	sd	s2,16(sp)
ffffffffc0207ca2:	f406                	sd	ra,40(sp)
ffffffffc0207ca4:	e44e                	sd	s3,8(sp)
ffffffffc0207ca6:	84aa                	mv	s1,a0
ffffffffc0207ca8:	892e                	mv	s2,a1
ffffffffc0207caa:	fff7041b          	addiw	s0,a4,-1
ffffffffc0207cae:	2a01                	sext.w	s4,s4
ffffffffc0207cb0:	03067e63          	bgeu	a2,a6,ffffffffc0207cec <printnum+0x60>
ffffffffc0207cb4:	89be                	mv	s3,a5
ffffffffc0207cb6:	00805763          	blez	s0,ffffffffc0207cc4 <printnum+0x38>
ffffffffc0207cba:	347d                	addiw	s0,s0,-1
ffffffffc0207cbc:	85ca                	mv	a1,s2
ffffffffc0207cbe:	854e                	mv	a0,s3
ffffffffc0207cc0:	9482                	jalr	s1
ffffffffc0207cc2:	fc65                	bnez	s0,ffffffffc0207cba <printnum+0x2e>
ffffffffc0207cc4:	1a02                	slli	s4,s4,0x20
ffffffffc0207cc6:	020a5a13          	srli	s4,s4,0x20
ffffffffc0207cca:	00003797          	auipc	a5,0x3
ffffffffc0207cce:	8c678793          	addi	a5,a5,-1850 # ffffffffc020a590 <syscalls+0x800>
ffffffffc0207cd2:	7402                	ld	s0,32(sp)
ffffffffc0207cd4:	9a3e                	add	s4,s4,a5
ffffffffc0207cd6:	000a4503          	lbu	a0,0(s4)
ffffffffc0207cda:	70a2                	ld	ra,40(sp)
ffffffffc0207cdc:	69a2                	ld	s3,8(sp)
ffffffffc0207cde:	6a02                	ld	s4,0(sp)
ffffffffc0207ce0:	85ca                	mv	a1,s2
ffffffffc0207ce2:	8326                	mv	t1,s1
ffffffffc0207ce4:	6942                	ld	s2,16(sp)
ffffffffc0207ce6:	64e2                	ld	s1,24(sp)
ffffffffc0207ce8:	6145                	addi	sp,sp,48
ffffffffc0207cea:	8302                	jr	t1
ffffffffc0207cec:	03065633          	divu	a2,a2,a6
ffffffffc0207cf0:	8722                	mv	a4,s0
ffffffffc0207cf2:	f9bff0ef          	jal	ra,ffffffffc0207c8c <printnum>
ffffffffc0207cf6:	b7f9                	j	ffffffffc0207cc4 <printnum+0x38>

ffffffffc0207cf8 <vprintfmt>:
ffffffffc0207cf8:	7119                	addi	sp,sp,-128
ffffffffc0207cfa:	f4a6                	sd	s1,104(sp)
ffffffffc0207cfc:	f0ca                	sd	s2,96(sp)
ffffffffc0207cfe:	ecce                	sd	s3,88(sp)
ffffffffc0207d00:	e8d2                	sd	s4,80(sp)
ffffffffc0207d02:	e4d6                	sd	s5,72(sp)
ffffffffc0207d04:	e0da                	sd	s6,64(sp)
ffffffffc0207d06:	fc5e                	sd	s7,56(sp)
ffffffffc0207d08:	f06a                	sd	s10,32(sp)
ffffffffc0207d0a:	fc86                	sd	ra,120(sp)
ffffffffc0207d0c:	f8a2                	sd	s0,112(sp)
ffffffffc0207d0e:	f862                	sd	s8,48(sp)
ffffffffc0207d10:	f466                	sd	s9,40(sp)
ffffffffc0207d12:	ec6e                	sd	s11,24(sp)
ffffffffc0207d14:	892a                	mv	s2,a0
ffffffffc0207d16:	84ae                	mv	s1,a1
ffffffffc0207d18:	8d32                	mv	s10,a2
ffffffffc0207d1a:	8a36                	mv	s4,a3
ffffffffc0207d1c:	02500993          	li	s3,37
ffffffffc0207d20:	5b7d                	li	s6,-1
ffffffffc0207d22:	00003a97          	auipc	s5,0x3
ffffffffc0207d26:	89aa8a93          	addi	s5,s5,-1894 # ffffffffc020a5bc <syscalls+0x82c>
ffffffffc0207d2a:	00003b97          	auipc	s7,0x3
ffffffffc0207d2e:	aaeb8b93          	addi	s7,s7,-1362 # ffffffffc020a7d8 <error_string>
ffffffffc0207d32:	000d4503          	lbu	a0,0(s10)
ffffffffc0207d36:	001d0413          	addi	s0,s10,1
ffffffffc0207d3a:	01350a63          	beq	a0,s3,ffffffffc0207d4e <vprintfmt+0x56>
ffffffffc0207d3e:	c121                	beqz	a0,ffffffffc0207d7e <vprintfmt+0x86>
ffffffffc0207d40:	85a6                	mv	a1,s1
ffffffffc0207d42:	0405                	addi	s0,s0,1
ffffffffc0207d44:	9902                	jalr	s2
ffffffffc0207d46:	fff44503          	lbu	a0,-1(s0)
ffffffffc0207d4a:	ff351ae3          	bne	a0,s3,ffffffffc0207d3e <vprintfmt+0x46>
ffffffffc0207d4e:	00044603          	lbu	a2,0(s0)
ffffffffc0207d52:	02000793          	li	a5,32
ffffffffc0207d56:	4c81                	li	s9,0
ffffffffc0207d58:	4881                	li	a7,0
ffffffffc0207d5a:	5c7d                	li	s8,-1
ffffffffc0207d5c:	5dfd                	li	s11,-1
ffffffffc0207d5e:	05500513          	li	a0,85
ffffffffc0207d62:	4825                	li	a6,9
ffffffffc0207d64:	fdd6059b          	addiw	a1,a2,-35
ffffffffc0207d68:	0ff5f593          	andi	a1,a1,255
ffffffffc0207d6c:	00140d13          	addi	s10,s0,1
ffffffffc0207d70:	04b56263          	bltu	a0,a1,ffffffffc0207db4 <vprintfmt+0xbc>
ffffffffc0207d74:	058a                	slli	a1,a1,0x2
ffffffffc0207d76:	95d6                	add	a1,a1,s5
ffffffffc0207d78:	4194                	lw	a3,0(a1)
ffffffffc0207d7a:	96d6                	add	a3,a3,s5
ffffffffc0207d7c:	8682                	jr	a3
ffffffffc0207d7e:	70e6                	ld	ra,120(sp)
ffffffffc0207d80:	7446                	ld	s0,112(sp)
ffffffffc0207d82:	74a6                	ld	s1,104(sp)
ffffffffc0207d84:	7906                	ld	s2,96(sp)
ffffffffc0207d86:	69e6                	ld	s3,88(sp)
ffffffffc0207d88:	6a46                	ld	s4,80(sp)
ffffffffc0207d8a:	6aa6                	ld	s5,72(sp)
ffffffffc0207d8c:	6b06                	ld	s6,64(sp)
ffffffffc0207d8e:	7be2                	ld	s7,56(sp)
ffffffffc0207d90:	7c42                	ld	s8,48(sp)
ffffffffc0207d92:	7ca2                	ld	s9,40(sp)
ffffffffc0207d94:	7d02                	ld	s10,32(sp)
ffffffffc0207d96:	6de2                	ld	s11,24(sp)
ffffffffc0207d98:	6109                	addi	sp,sp,128
ffffffffc0207d9a:	8082                	ret
ffffffffc0207d9c:	87b2                	mv	a5,a2
ffffffffc0207d9e:	00144603          	lbu	a2,1(s0)
ffffffffc0207da2:	846a                	mv	s0,s10
ffffffffc0207da4:	00140d13          	addi	s10,s0,1
ffffffffc0207da8:	fdd6059b          	addiw	a1,a2,-35
ffffffffc0207dac:	0ff5f593          	andi	a1,a1,255
ffffffffc0207db0:	fcb572e3          	bgeu	a0,a1,ffffffffc0207d74 <vprintfmt+0x7c>
ffffffffc0207db4:	85a6                	mv	a1,s1
ffffffffc0207db6:	02500513          	li	a0,37
ffffffffc0207dba:	9902                	jalr	s2
ffffffffc0207dbc:	fff44783          	lbu	a5,-1(s0)
ffffffffc0207dc0:	8d22                	mv	s10,s0
ffffffffc0207dc2:	f73788e3          	beq	a5,s3,ffffffffc0207d32 <vprintfmt+0x3a>
ffffffffc0207dc6:	ffed4783          	lbu	a5,-2(s10)
ffffffffc0207dca:	1d7d                	addi	s10,s10,-1
ffffffffc0207dcc:	ff379de3          	bne	a5,s3,ffffffffc0207dc6 <vprintfmt+0xce>
ffffffffc0207dd0:	b78d                	j	ffffffffc0207d32 <vprintfmt+0x3a>
ffffffffc0207dd2:	fd060c1b          	addiw	s8,a2,-48
ffffffffc0207dd6:	00144603          	lbu	a2,1(s0)
ffffffffc0207dda:	846a                	mv	s0,s10
ffffffffc0207ddc:	fd06069b          	addiw	a3,a2,-48
ffffffffc0207de0:	0006059b          	sext.w	a1,a2
ffffffffc0207de4:	02d86463          	bltu	a6,a3,ffffffffc0207e0c <vprintfmt+0x114>
ffffffffc0207de8:	00144603          	lbu	a2,1(s0)
ffffffffc0207dec:	002c169b          	slliw	a3,s8,0x2
ffffffffc0207df0:	0186873b          	addw	a4,a3,s8
ffffffffc0207df4:	0017171b          	slliw	a4,a4,0x1
ffffffffc0207df8:	9f2d                	addw	a4,a4,a1
ffffffffc0207dfa:	fd06069b          	addiw	a3,a2,-48
ffffffffc0207dfe:	0405                	addi	s0,s0,1
ffffffffc0207e00:	fd070c1b          	addiw	s8,a4,-48
ffffffffc0207e04:	0006059b          	sext.w	a1,a2
ffffffffc0207e08:	fed870e3          	bgeu	a6,a3,ffffffffc0207de8 <vprintfmt+0xf0>
ffffffffc0207e0c:	f40ddce3          	bgez	s11,ffffffffc0207d64 <vprintfmt+0x6c>
ffffffffc0207e10:	8de2                	mv	s11,s8
ffffffffc0207e12:	5c7d                	li	s8,-1
ffffffffc0207e14:	bf81                	j	ffffffffc0207d64 <vprintfmt+0x6c>
ffffffffc0207e16:	fffdc693          	not	a3,s11
ffffffffc0207e1a:	96fd                	srai	a3,a3,0x3f
ffffffffc0207e1c:	00ddfdb3          	and	s11,s11,a3
ffffffffc0207e20:	00144603          	lbu	a2,1(s0)
ffffffffc0207e24:	2d81                	sext.w	s11,s11
ffffffffc0207e26:	846a                	mv	s0,s10
ffffffffc0207e28:	bf35                	j	ffffffffc0207d64 <vprintfmt+0x6c>
ffffffffc0207e2a:	000a2c03          	lw	s8,0(s4)
ffffffffc0207e2e:	00144603          	lbu	a2,1(s0)
ffffffffc0207e32:	0a21                	addi	s4,s4,8
ffffffffc0207e34:	846a                	mv	s0,s10
ffffffffc0207e36:	bfd9                	j	ffffffffc0207e0c <vprintfmt+0x114>
ffffffffc0207e38:	4705                	li	a4,1
ffffffffc0207e3a:	008a0593          	addi	a1,s4,8
ffffffffc0207e3e:	01174463          	blt	a4,a7,ffffffffc0207e46 <vprintfmt+0x14e>
ffffffffc0207e42:	1a088e63          	beqz	a7,ffffffffc0207ffe <vprintfmt+0x306>
ffffffffc0207e46:	000a3603          	ld	a2,0(s4)
ffffffffc0207e4a:	46c1                	li	a3,16
ffffffffc0207e4c:	8a2e                	mv	s4,a1
ffffffffc0207e4e:	2781                	sext.w	a5,a5
ffffffffc0207e50:	876e                	mv	a4,s11
ffffffffc0207e52:	85a6                	mv	a1,s1
ffffffffc0207e54:	854a                	mv	a0,s2
ffffffffc0207e56:	e37ff0ef          	jal	ra,ffffffffc0207c8c <printnum>
ffffffffc0207e5a:	bde1                	j	ffffffffc0207d32 <vprintfmt+0x3a>
ffffffffc0207e5c:	000a2503          	lw	a0,0(s4)
ffffffffc0207e60:	85a6                	mv	a1,s1
ffffffffc0207e62:	0a21                	addi	s4,s4,8
ffffffffc0207e64:	9902                	jalr	s2
ffffffffc0207e66:	b5f1                	j	ffffffffc0207d32 <vprintfmt+0x3a>
ffffffffc0207e68:	4705                	li	a4,1
ffffffffc0207e6a:	008a0593          	addi	a1,s4,8
ffffffffc0207e6e:	01174463          	blt	a4,a7,ffffffffc0207e76 <vprintfmt+0x17e>
ffffffffc0207e72:	18088163          	beqz	a7,ffffffffc0207ff4 <vprintfmt+0x2fc>
ffffffffc0207e76:	000a3603          	ld	a2,0(s4)
ffffffffc0207e7a:	46a9                	li	a3,10
ffffffffc0207e7c:	8a2e                	mv	s4,a1
ffffffffc0207e7e:	bfc1                	j	ffffffffc0207e4e <vprintfmt+0x156>
ffffffffc0207e80:	00144603          	lbu	a2,1(s0)
ffffffffc0207e84:	4c85                	li	s9,1
ffffffffc0207e86:	846a                	mv	s0,s10
ffffffffc0207e88:	bdf1                	j	ffffffffc0207d64 <vprintfmt+0x6c>
ffffffffc0207e8a:	85a6                	mv	a1,s1
ffffffffc0207e8c:	02500513          	li	a0,37
ffffffffc0207e90:	9902                	jalr	s2
ffffffffc0207e92:	b545                	j	ffffffffc0207d32 <vprintfmt+0x3a>
ffffffffc0207e94:	00144603          	lbu	a2,1(s0)
ffffffffc0207e98:	2885                	addiw	a7,a7,1
ffffffffc0207e9a:	846a                	mv	s0,s10
ffffffffc0207e9c:	b5e1                	j	ffffffffc0207d64 <vprintfmt+0x6c>
ffffffffc0207e9e:	4705                	li	a4,1
ffffffffc0207ea0:	008a0593          	addi	a1,s4,8
ffffffffc0207ea4:	01174463          	blt	a4,a7,ffffffffc0207eac <vprintfmt+0x1b4>
ffffffffc0207ea8:	14088163          	beqz	a7,ffffffffc0207fea <vprintfmt+0x2f2>
ffffffffc0207eac:	000a3603          	ld	a2,0(s4)
ffffffffc0207eb0:	46a1                	li	a3,8
ffffffffc0207eb2:	8a2e                	mv	s4,a1
ffffffffc0207eb4:	bf69                	j	ffffffffc0207e4e <vprintfmt+0x156>
ffffffffc0207eb6:	03000513          	li	a0,48
ffffffffc0207eba:	85a6                	mv	a1,s1
ffffffffc0207ebc:	e03e                	sd	a5,0(sp)
ffffffffc0207ebe:	9902                	jalr	s2
ffffffffc0207ec0:	85a6                	mv	a1,s1
ffffffffc0207ec2:	07800513          	li	a0,120
ffffffffc0207ec6:	9902                	jalr	s2
ffffffffc0207ec8:	0a21                	addi	s4,s4,8
ffffffffc0207eca:	6782                	ld	a5,0(sp)
ffffffffc0207ecc:	46c1                	li	a3,16
ffffffffc0207ece:	ff8a3603          	ld	a2,-8(s4)
ffffffffc0207ed2:	bfb5                	j	ffffffffc0207e4e <vprintfmt+0x156>
ffffffffc0207ed4:	000a3403          	ld	s0,0(s4)
ffffffffc0207ed8:	008a0713          	addi	a4,s4,8
ffffffffc0207edc:	e03a                	sd	a4,0(sp)
ffffffffc0207ede:	14040263          	beqz	s0,ffffffffc0208022 <vprintfmt+0x32a>
ffffffffc0207ee2:	0fb05763          	blez	s11,ffffffffc0207fd0 <vprintfmt+0x2d8>
ffffffffc0207ee6:	02d00693          	li	a3,45
ffffffffc0207eea:	0cd79163          	bne	a5,a3,ffffffffc0207fac <vprintfmt+0x2b4>
ffffffffc0207eee:	00044783          	lbu	a5,0(s0)
ffffffffc0207ef2:	0007851b          	sext.w	a0,a5
ffffffffc0207ef6:	cf85                	beqz	a5,ffffffffc0207f2e <vprintfmt+0x236>
ffffffffc0207ef8:	00140a13          	addi	s4,s0,1
ffffffffc0207efc:	05e00413          	li	s0,94
ffffffffc0207f00:	000c4563          	bltz	s8,ffffffffc0207f0a <vprintfmt+0x212>
ffffffffc0207f04:	3c7d                	addiw	s8,s8,-1
ffffffffc0207f06:	036c0263          	beq	s8,s6,ffffffffc0207f2a <vprintfmt+0x232>
ffffffffc0207f0a:	85a6                	mv	a1,s1
ffffffffc0207f0c:	0e0c8e63          	beqz	s9,ffffffffc0208008 <vprintfmt+0x310>
ffffffffc0207f10:	3781                	addiw	a5,a5,-32
ffffffffc0207f12:	0ef47b63          	bgeu	s0,a5,ffffffffc0208008 <vprintfmt+0x310>
ffffffffc0207f16:	03f00513          	li	a0,63
ffffffffc0207f1a:	9902                	jalr	s2
ffffffffc0207f1c:	000a4783          	lbu	a5,0(s4)
ffffffffc0207f20:	3dfd                	addiw	s11,s11,-1
ffffffffc0207f22:	0a05                	addi	s4,s4,1
ffffffffc0207f24:	0007851b          	sext.w	a0,a5
ffffffffc0207f28:	ffe1                	bnez	a5,ffffffffc0207f00 <vprintfmt+0x208>
ffffffffc0207f2a:	01b05963          	blez	s11,ffffffffc0207f3c <vprintfmt+0x244>
ffffffffc0207f2e:	3dfd                	addiw	s11,s11,-1
ffffffffc0207f30:	85a6                	mv	a1,s1
ffffffffc0207f32:	02000513          	li	a0,32
ffffffffc0207f36:	9902                	jalr	s2
ffffffffc0207f38:	fe0d9be3          	bnez	s11,ffffffffc0207f2e <vprintfmt+0x236>
ffffffffc0207f3c:	6a02                	ld	s4,0(sp)
ffffffffc0207f3e:	bbd5                	j	ffffffffc0207d32 <vprintfmt+0x3a>
ffffffffc0207f40:	4705                	li	a4,1
ffffffffc0207f42:	008a0c93          	addi	s9,s4,8
ffffffffc0207f46:	01174463          	blt	a4,a7,ffffffffc0207f4e <vprintfmt+0x256>
ffffffffc0207f4a:	08088d63          	beqz	a7,ffffffffc0207fe4 <vprintfmt+0x2ec>
ffffffffc0207f4e:	000a3403          	ld	s0,0(s4)
ffffffffc0207f52:	0a044d63          	bltz	s0,ffffffffc020800c <vprintfmt+0x314>
ffffffffc0207f56:	8622                	mv	a2,s0
ffffffffc0207f58:	8a66                	mv	s4,s9
ffffffffc0207f5a:	46a9                	li	a3,10
ffffffffc0207f5c:	bdcd                	j	ffffffffc0207e4e <vprintfmt+0x156>
ffffffffc0207f5e:	000a2783          	lw	a5,0(s4)
ffffffffc0207f62:	4761                	li	a4,24
ffffffffc0207f64:	0a21                	addi	s4,s4,8
ffffffffc0207f66:	41f7d69b          	sraiw	a3,a5,0x1f
ffffffffc0207f6a:	8fb5                	xor	a5,a5,a3
ffffffffc0207f6c:	40d786bb          	subw	a3,a5,a3
ffffffffc0207f70:	02d74163          	blt	a4,a3,ffffffffc0207f92 <vprintfmt+0x29a>
ffffffffc0207f74:	00369793          	slli	a5,a3,0x3
ffffffffc0207f78:	97de                	add	a5,a5,s7
ffffffffc0207f7a:	639c                	ld	a5,0(a5)
ffffffffc0207f7c:	cb99                	beqz	a5,ffffffffc0207f92 <vprintfmt+0x29a>
ffffffffc0207f7e:	86be                	mv	a3,a5
ffffffffc0207f80:	00000617          	auipc	a2,0x0
ffffffffc0207f84:	13060613          	addi	a2,a2,304 # ffffffffc02080b0 <etext+0x20>
ffffffffc0207f88:	85a6                	mv	a1,s1
ffffffffc0207f8a:	854a                	mv	a0,s2
ffffffffc0207f8c:	0ce000ef          	jal	ra,ffffffffc020805a <printfmt>
ffffffffc0207f90:	b34d                	j	ffffffffc0207d32 <vprintfmt+0x3a>
ffffffffc0207f92:	00002617          	auipc	a2,0x2
ffffffffc0207f96:	61e60613          	addi	a2,a2,1566 # ffffffffc020a5b0 <syscalls+0x820>
ffffffffc0207f9a:	85a6                	mv	a1,s1
ffffffffc0207f9c:	854a                	mv	a0,s2
ffffffffc0207f9e:	0bc000ef          	jal	ra,ffffffffc020805a <printfmt>
ffffffffc0207fa2:	bb41                	j	ffffffffc0207d32 <vprintfmt+0x3a>
ffffffffc0207fa4:	00002417          	auipc	s0,0x2
ffffffffc0207fa8:	60440413          	addi	s0,s0,1540 # ffffffffc020a5a8 <syscalls+0x818>
ffffffffc0207fac:	85e2                	mv	a1,s8
ffffffffc0207fae:	8522                	mv	a0,s0
ffffffffc0207fb0:	e43e                	sd	a5,8(sp)
ffffffffc0207fb2:	c61ff0ef          	jal	ra,ffffffffc0207c12 <strnlen>
ffffffffc0207fb6:	40ad8dbb          	subw	s11,s11,a0
ffffffffc0207fba:	01b05b63          	blez	s11,ffffffffc0207fd0 <vprintfmt+0x2d8>
ffffffffc0207fbe:	67a2                	ld	a5,8(sp)
ffffffffc0207fc0:	00078a1b          	sext.w	s4,a5
ffffffffc0207fc4:	3dfd                	addiw	s11,s11,-1
ffffffffc0207fc6:	85a6                	mv	a1,s1
ffffffffc0207fc8:	8552                	mv	a0,s4
ffffffffc0207fca:	9902                	jalr	s2
ffffffffc0207fcc:	fe0d9ce3          	bnez	s11,ffffffffc0207fc4 <vprintfmt+0x2cc>
ffffffffc0207fd0:	00044783          	lbu	a5,0(s0)
ffffffffc0207fd4:	00140a13          	addi	s4,s0,1
ffffffffc0207fd8:	0007851b          	sext.w	a0,a5
ffffffffc0207fdc:	d3a5                	beqz	a5,ffffffffc0207f3c <vprintfmt+0x244>
ffffffffc0207fde:	05e00413          	li	s0,94
ffffffffc0207fe2:	bf39                	j	ffffffffc0207f00 <vprintfmt+0x208>
ffffffffc0207fe4:	000a2403          	lw	s0,0(s4)
ffffffffc0207fe8:	b7ad                	j	ffffffffc0207f52 <vprintfmt+0x25a>
ffffffffc0207fea:	000a6603          	lwu	a2,0(s4)
ffffffffc0207fee:	46a1                	li	a3,8
ffffffffc0207ff0:	8a2e                	mv	s4,a1
ffffffffc0207ff2:	bdb1                	j	ffffffffc0207e4e <vprintfmt+0x156>
ffffffffc0207ff4:	000a6603          	lwu	a2,0(s4)
ffffffffc0207ff8:	46a9                	li	a3,10
ffffffffc0207ffa:	8a2e                	mv	s4,a1
ffffffffc0207ffc:	bd89                	j	ffffffffc0207e4e <vprintfmt+0x156>
ffffffffc0207ffe:	000a6603          	lwu	a2,0(s4)
ffffffffc0208002:	46c1                	li	a3,16
ffffffffc0208004:	8a2e                	mv	s4,a1
ffffffffc0208006:	b5a1                	j	ffffffffc0207e4e <vprintfmt+0x156>
ffffffffc0208008:	9902                	jalr	s2
ffffffffc020800a:	bf09                	j	ffffffffc0207f1c <vprintfmt+0x224>
ffffffffc020800c:	85a6                	mv	a1,s1
ffffffffc020800e:	02d00513          	li	a0,45
ffffffffc0208012:	e03e                	sd	a5,0(sp)
ffffffffc0208014:	9902                	jalr	s2
ffffffffc0208016:	6782                	ld	a5,0(sp)
ffffffffc0208018:	8a66                	mv	s4,s9
ffffffffc020801a:	40800633          	neg	a2,s0
ffffffffc020801e:	46a9                	li	a3,10
ffffffffc0208020:	b53d                	j	ffffffffc0207e4e <vprintfmt+0x156>
ffffffffc0208022:	03b05163          	blez	s11,ffffffffc0208044 <vprintfmt+0x34c>
ffffffffc0208026:	02d00693          	li	a3,45
ffffffffc020802a:	f6d79de3          	bne	a5,a3,ffffffffc0207fa4 <vprintfmt+0x2ac>
ffffffffc020802e:	00002417          	auipc	s0,0x2
ffffffffc0208032:	57a40413          	addi	s0,s0,1402 # ffffffffc020a5a8 <syscalls+0x818>
ffffffffc0208036:	02800793          	li	a5,40
ffffffffc020803a:	02800513          	li	a0,40
ffffffffc020803e:	00140a13          	addi	s4,s0,1
ffffffffc0208042:	bd6d                	j	ffffffffc0207efc <vprintfmt+0x204>
ffffffffc0208044:	00002a17          	auipc	s4,0x2
ffffffffc0208048:	565a0a13          	addi	s4,s4,1381 # ffffffffc020a5a9 <syscalls+0x819>
ffffffffc020804c:	02800513          	li	a0,40
ffffffffc0208050:	02800793          	li	a5,40
ffffffffc0208054:	05e00413          	li	s0,94
ffffffffc0208058:	b565                	j	ffffffffc0207f00 <vprintfmt+0x208>

ffffffffc020805a <printfmt>:
ffffffffc020805a:	715d                	addi	sp,sp,-80
ffffffffc020805c:	02810313          	addi	t1,sp,40
ffffffffc0208060:	f436                	sd	a3,40(sp)
ffffffffc0208062:	869a                	mv	a3,t1
ffffffffc0208064:	ec06                	sd	ra,24(sp)
ffffffffc0208066:	f83a                	sd	a4,48(sp)
ffffffffc0208068:	fc3e                	sd	a5,56(sp)
ffffffffc020806a:	e0c2                	sd	a6,64(sp)
ffffffffc020806c:	e4c6                	sd	a7,72(sp)
ffffffffc020806e:	e41a                	sd	t1,8(sp)
ffffffffc0208070:	c89ff0ef          	jal	ra,ffffffffc0207cf8 <vprintfmt>
ffffffffc0208074:	60e2                	ld	ra,24(sp)
ffffffffc0208076:	6161                	addi	sp,sp,80
ffffffffc0208078:	8082                	ret

ffffffffc020807a <hash32>:
ffffffffc020807a:	9e3707b7          	lui	a5,0x9e370
ffffffffc020807e:	2785                	addiw	a5,a5,1
ffffffffc0208080:	02a7853b          	mulw	a0,a5,a0
ffffffffc0208084:	02000793          	li	a5,32
ffffffffc0208088:	9f8d                	subw	a5,a5,a1
ffffffffc020808a:	00f5553b          	srlw	a0,a0,a5
ffffffffc020808e:	8082                	ret
