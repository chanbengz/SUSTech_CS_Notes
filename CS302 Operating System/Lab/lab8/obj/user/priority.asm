
obj/__user_priority.out:     file format elf64-littleriscv


Disassembly of section .text:

0000000000800020 <__panic>:
  800020:	715d                	addi	sp,sp,-80
  800022:	8e2e                	mv	t3,a1
  800024:	e822                	sd	s0,16(sp)
  800026:	85aa                	mv	a1,a0
  800028:	8432                	mv	s0,a2
  80002a:	fc3e                	sd	a5,56(sp)
  80002c:	8672                	mv	a2,t3
  80002e:	103c                	addi	a5,sp,40
  800030:	00000517          	auipc	a0,0x0
  800034:	71850513          	addi	a0,a0,1816 # 800748 <main+0x1bc>
  800038:	ec06                	sd	ra,24(sp)
  80003a:	f436                	sd	a3,40(sp)
  80003c:	f83a                	sd	a4,48(sp)
  80003e:	e0c2                	sd	a6,64(sp)
  800040:	e4c6                	sd	a7,72(sp)
  800042:	e43e                	sd	a5,8(sp)
  800044:	0ea000ef          	jal	ra,80012e <cprintf>
  800048:	65a2                	ld	a1,8(sp)
  80004a:	8522                	mv	a0,s0
  80004c:	0c2000ef          	jal	ra,80010e <vcprintf>
  800050:	00000517          	auipc	a0,0x0
  800054:	71850513          	addi	a0,a0,1816 # 800768 <main+0x1dc>
  800058:	0d6000ef          	jal	ra,80012e <cprintf>
  80005c:	5559                	li	a0,-10
  80005e:	06a000ef          	jal	ra,8000c8 <exit>

0000000000800062 <syscall>:
  800062:	7175                	addi	sp,sp,-144
  800064:	f8ba                	sd	a4,112(sp)
  800066:	e0ba                	sd	a4,64(sp)
  800068:	0118                	addi	a4,sp,128
  80006a:	e42a                	sd	a0,8(sp)
  80006c:	ecae                	sd	a1,88(sp)
  80006e:	f0b2                	sd	a2,96(sp)
  800070:	f4b6                	sd	a3,104(sp)
  800072:	fcbe                	sd	a5,120(sp)
  800074:	e142                	sd	a6,128(sp)
  800076:	e546                	sd	a7,136(sp)
  800078:	f42e                	sd	a1,40(sp)
  80007a:	f832                	sd	a2,48(sp)
  80007c:	fc36                	sd	a3,56(sp)
  80007e:	f03a                	sd	a4,32(sp)
  800080:	e4be                	sd	a5,72(sp)
  800082:	4522                	lw	a0,8(sp)
  800084:	55a2                	lw	a1,40(sp)
  800086:	5642                	lw	a2,48(sp)
  800088:	56e2                	lw	a3,56(sp)
  80008a:	4706                	lw	a4,64(sp)
  80008c:	47a6                	lw	a5,72(sp)
  80008e:	00000073          	ecall
  800092:	ce2a                	sw	a0,28(sp)
  800094:	4572                	lw	a0,28(sp)
  800096:	6149                	addi	sp,sp,144
  800098:	8082                	ret

000000000080009a <sys_exit>:
  80009a:	85aa                	mv	a1,a0
  80009c:	4505                	li	a0,1
  80009e:	b7d1                	j	800062 <syscall>

00000000008000a0 <sys_fork>:
  8000a0:	4509                	li	a0,2
  8000a2:	b7c1                	j	800062 <syscall>

00000000008000a4 <sys_wait>:
  8000a4:	862e                	mv	a2,a1
  8000a6:	85aa                	mv	a1,a0
  8000a8:	450d                	li	a0,3
  8000aa:	bf65                	j	800062 <syscall>

00000000008000ac <sys_kill>:
  8000ac:	85aa                	mv	a1,a0
  8000ae:	4531                	li	a0,12
  8000b0:	bf4d                	j	800062 <syscall>

00000000008000b2 <sys_getpid>:
  8000b2:	4549                	li	a0,18
  8000b4:	b77d                	j	800062 <syscall>

00000000008000b6 <sys_putc>:
  8000b6:	85aa                	mv	a1,a0
  8000b8:	4579                	li	a0,30
  8000ba:	b765                	j	800062 <syscall>

00000000008000bc <sys_gettime>:
  8000bc:	4545                	li	a0,17
  8000be:	b755                	j	800062 <syscall>

00000000008000c0 <sys_lab6_set_priority>:
  8000c0:	85aa                	mv	a1,a0
  8000c2:	0ff00513          	li	a0,255
  8000c6:	bf71                	j	800062 <syscall>

00000000008000c8 <exit>:
  8000c8:	1141                	addi	sp,sp,-16
  8000ca:	e406                	sd	ra,8(sp)
  8000cc:	fcfff0ef          	jal	ra,80009a <sys_exit>
  8000d0:	00000517          	auipc	a0,0x0
  8000d4:	6a050513          	addi	a0,a0,1696 # 800770 <main+0x1e4>
  8000d8:	056000ef          	jal	ra,80012e <cprintf>
  8000dc:	a001                	j	8000dc <exit+0x14>

00000000008000de <fork>:
  8000de:	b7c9                	j	8000a0 <sys_fork>

00000000008000e0 <waitpid>:
  8000e0:	b7d1                	j	8000a4 <sys_wait>

00000000008000e2 <kill>:
  8000e2:	b7e9                	j	8000ac <sys_kill>

00000000008000e4 <getpid>:
  8000e4:	b7f9                	j	8000b2 <sys_getpid>

00000000008000e6 <gettime_msec>:
  8000e6:	bfd9                	j	8000bc <sys_gettime>

00000000008000e8 <lab6_set_priority>:
  8000e8:	1502                	slli	a0,a0,0x20
  8000ea:	9101                	srli	a0,a0,0x20
  8000ec:	bfd1                	j	8000c0 <sys_lab6_set_priority>

00000000008000ee <_start>:
  8000ee:	076000ef          	jal	ra,800164 <umain>
  8000f2:	a001                	j	8000f2 <_start+0x4>

00000000008000f4 <cputch>:
  8000f4:	1141                	addi	sp,sp,-16
  8000f6:	e022                	sd	s0,0(sp)
  8000f8:	e406                	sd	ra,8(sp)
  8000fa:	842e                	mv	s0,a1
  8000fc:	fbbff0ef          	jal	ra,8000b6 <sys_putc>
  800100:	401c                	lw	a5,0(s0)
  800102:	60a2                	ld	ra,8(sp)
  800104:	2785                	addiw	a5,a5,1
  800106:	c01c                	sw	a5,0(s0)
  800108:	6402                	ld	s0,0(sp)
  80010a:	0141                	addi	sp,sp,16
  80010c:	8082                	ret

000000000080010e <vcprintf>:
  80010e:	1101                	addi	sp,sp,-32
  800110:	862a                	mv	a2,a0
  800112:	86ae                	mv	a3,a1
  800114:	00000517          	auipc	a0,0x0
  800118:	fe050513          	addi	a0,a0,-32 # 8000f4 <cputch>
  80011c:	006c                	addi	a1,sp,12
  80011e:	ec06                	sd	ra,24(sp)
  800120:	c602                	sw	zero,12(sp)
  800122:	0e8000ef          	jal	ra,80020a <vprintfmt>
  800126:	60e2                	ld	ra,24(sp)
  800128:	4532                	lw	a0,12(sp)
  80012a:	6105                	addi	sp,sp,32
  80012c:	8082                	ret

000000000080012e <cprintf>:
  80012e:	711d                	addi	sp,sp,-96
  800130:	02810313          	addi	t1,sp,40
  800134:	8e2a                	mv	t3,a0
  800136:	f42e                	sd	a1,40(sp)
  800138:	f832                	sd	a2,48(sp)
  80013a:	fc36                	sd	a3,56(sp)
  80013c:	00000517          	auipc	a0,0x0
  800140:	fb850513          	addi	a0,a0,-72 # 8000f4 <cputch>
  800144:	004c                	addi	a1,sp,4
  800146:	869a                	mv	a3,t1
  800148:	8672                	mv	a2,t3
  80014a:	ec06                	sd	ra,24(sp)
  80014c:	e0ba                	sd	a4,64(sp)
  80014e:	e4be                	sd	a5,72(sp)
  800150:	e8c2                	sd	a6,80(sp)
  800152:	ecc6                	sd	a7,88(sp)
  800154:	e41a                	sd	t1,8(sp)
  800156:	c202                	sw	zero,4(sp)
  800158:	0b2000ef          	jal	ra,80020a <vprintfmt>
  80015c:	60e2                	ld	ra,24(sp)
  80015e:	4512                	lw	a0,4(sp)
  800160:	6125                	addi	sp,sp,96
  800162:	8082                	ret

0000000000800164 <umain>:
  800164:	1141                	addi	sp,sp,-16
  800166:	e406                	sd	ra,8(sp)
  800168:	424000ef          	jal	ra,80058c <main>
  80016c:	f5dff0ef          	jal	ra,8000c8 <exit>

0000000000800170 <strnlen>:
  800170:	872a                	mv	a4,a0
  800172:	4501                	li	a0,0
  800174:	e589                	bnez	a1,80017e <strnlen+0xe>
  800176:	a811                	j	80018a <strnlen+0x1a>
  800178:	0505                	addi	a0,a0,1
  80017a:	00a58763          	beq	a1,a0,800188 <strnlen+0x18>
  80017e:	00a707b3          	add	a5,a4,a0
  800182:	0007c783          	lbu	a5,0(a5)
  800186:	fbed                	bnez	a5,800178 <strnlen+0x8>
  800188:	8082                	ret
  80018a:	8082                	ret

000000000080018c <memset>:
  80018c:	ca01                	beqz	a2,80019c <memset+0x10>
  80018e:	962a                	add	a2,a2,a0
  800190:	87aa                	mv	a5,a0
  800192:	0785                	addi	a5,a5,1
  800194:	feb78fa3          	sb	a1,-1(a5)
  800198:	fec79de3          	bne	a5,a2,800192 <memset+0x6>
  80019c:	8082                	ret

000000000080019e <printnum>:
  80019e:	02069813          	slli	a6,a3,0x20
  8001a2:	7179                	addi	sp,sp,-48
  8001a4:	02085813          	srli	a6,a6,0x20
  8001a8:	e052                	sd	s4,0(sp)
  8001aa:	03067a33          	remu	s4,a2,a6
  8001ae:	f022                	sd	s0,32(sp)
  8001b0:	ec26                	sd	s1,24(sp)
  8001b2:	e84a                	sd	s2,16(sp)
  8001b4:	f406                	sd	ra,40(sp)
  8001b6:	e44e                	sd	s3,8(sp)
  8001b8:	84aa                	mv	s1,a0
  8001ba:	892e                	mv	s2,a1
  8001bc:	fff7041b          	addiw	s0,a4,-1
  8001c0:	2a01                	sext.w	s4,s4
  8001c2:	03067e63          	bgeu	a2,a6,8001fe <printnum+0x60>
  8001c6:	89be                	mv	s3,a5
  8001c8:	00805763          	blez	s0,8001d6 <printnum+0x38>
  8001cc:	347d                	addiw	s0,s0,-1
  8001ce:	85ca                	mv	a1,s2
  8001d0:	854e                	mv	a0,s3
  8001d2:	9482                	jalr	s1
  8001d4:	fc65                	bnez	s0,8001cc <printnum+0x2e>
  8001d6:	1a02                	slli	s4,s4,0x20
  8001d8:	020a5a13          	srli	s4,s4,0x20
  8001dc:	00000797          	auipc	a5,0x0
  8001e0:	5ac78793          	addi	a5,a5,1452 # 800788 <main+0x1fc>
  8001e4:	7402                	ld	s0,32(sp)
  8001e6:	9a3e                	add	s4,s4,a5
  8001e8:	000a4503          	lbu	a0,0(s4)
  8001ec:	70a2                	ld	ra,40(sp)
  8001ee:	69a2                	ld	s3,8(sp)
  8001f0:	6a02                	ld	s4,0(sp)
  8001f2:	85ca                	mv	a1,s2
  8001f4:	8326                	mv	t1,s1
  8001f6:	6942                	ld	s2,16(sp)
  8001f8:	64e2                	ld	s1,24(sp)
  8001fa:	6145                	addi	sp,sp,48
  8001fc:	8302                	jr	t1
  8001fe:	03065633          	divu	a2,a2,a6
  800202:	8722                	mv	a4,s0
  800204:	f9bff0ef          	jal	ra,80019e <printnum>
  800208:	b7f9                	j	8001d6 <printnum+0x38>

000000000080020a <vprintfmt>:
  80020a:	7119                	addi	sp,sp,-128
  80020c:	f4a6                	sd	s1,104(sp)
  80020e:	f0ca                	sd	s2,96(sp)
  800210:	ecce                	sd	s3,88(sp)
  800212:	e8d2                	sd	s4,80(sp)
  800214:	e4d6                	sd	s5,72(sp)
  800216:	e0da                	sd	s6,64(sp)
  800218:	fc5e                	sd	s7,56(sp)
  80021a:	f06a                	sd	s10,32(sp)
  80021c:	fc86                	sd	ra,120(sp)
  80021e:	f8a2                	sd	s0,112(sp)
  800220:	f862                	sd	s8,48(sp)
  800222:	f466                	sd	s9,40(sp)
  800224:	ec6e                	sd	s11,24(sp)
  800226:	892a                	mv	s2,a0
  800228:	84ae                	mv	s1,a1
  80022a:	8d32                	mv	s10,a2
  80022c:	8a36                	mv	s4,a3
  80022e:	02500993          	li	s3,37
  800232:	5b7d                	li	s6,-1
  800234:	00000a97          	auipc	s5,0x0
  800238:	588a8a93          	addi	s5,s5,1416 # 8007bc <main+0x230>
  80023c:	00000b97          	auipc	s7,0x0
  800240:	79cb8b93          	addi	s7,s7,1948 # 8009d8 <error_string>
  800244:	000d4503          	lbu	a0,0(s10)
  800248:	001d0413          	addi	s0,s10,1
  80024c:	01350a63          	beq	a0,s3,800260 <vprintfmt+0x56>
  800250:	c121                	beqz	a0,800290 <vprintfmt+0x86>
  800252:	85a6                	mv	a1,s1
  800254:	0405                	addi	s0,s0,1
  800256:	9902                	jalr	s2
  800258:	fff44503          	lbu	a0,-1(s0)
  80025c:	ff351ae3          	bne	a0,s3,800250 <vprintfmt+0x46>
  800260:	00044603          	lbu	a2,0(s0)
  800264:	02000793          	li	a5,32
  800268:	4c81                	li	s9,0
  80026a:	4881                	li	a7,0
  80026c:	5c7d                	li	s8,-1
  80026e:	5dfd                	li	s11,-1
  800270:	05500513          	li	a0,85
  800274:	4825                	li	a6,9
  800276:	fdd6059b          	addiw	a1,a2,-35
  80027a:	0ff5f593          	andi	a1,a1,255
  80027e:	00140d13          	addi	s10,s0,1
  800282:	04b56263          	bltu	a0,a1,8002c6 <vprintfmt+0xbc>
  800286:	058a                	slli	a1,a1,0x2
  800288:	95d6                	add	a1,a1,s5
  80028a:	4194                	lw	a3,0(a1)
  80028c:	96d6                	add	a3,a3,s5
  80028e:	8682                	jr	a3
  800290:	70e6                	ld	ra,120(sp)
  800292:	7446                	ld	s0,112(sp)
  800294:	74a6                	ld	s1,104(sp)
  800296:	7906                	ld	s2,96(sp)
  800298:	69e6                	ld	s3,88(sp)
  80029a:	6a46                	ld	s4,80(sp)
  80029c:	6aa6                	ld	s5,72(sp)
  80029e:	6b06                	ld	s6,64(sp)
  8002a0:	7be2                	ld	s7,56(sp)
  8002a2:	7c42                	ld	s8,48(sp)
  8002a4:	7ca2                	ld	s9,40(sp)
  8002a6:	7d02                	ld	s10,32(sp)
  8002a8:	6de2                	ld	s11,24(sp)
  8002aa:	6109                	addi	sp,sp,128
  8002ac:	8082                	ret
  8002ae:	87b2                	mv	a5,a2
  8002b0:	00144603          	lbu	a2,1(s0)
  8002b4:	846a                	mv	s0,s10
  8002b6:	00140d13          	addi	s10,s0,1
  8002ba:	fdd6059b          	addiw	a1,a2,-35
  8002be:	0ff5f593          	andi	a1,a1,255
  8002c2:	fcb572e3          	bgeu	a0,a1,800286 <vprintfmt+0x7c>
  8002c6:	85a6                	mv	a1,s1
  8002c8:	02500513          	li	a0,37
  8002cc:	9902                	jalr	s2
  8002ce:	fff44783          	lbu	a5,-1(s0)
  8002d2:	8d22                	mv	s10,s0
  8002d4:	f73788e3          	beq	a5,s3,800244 <vprintfmt+0x3a>
  8002d8:	ffed4783          	lbu	a5,-2(s10)
  8002dc:	1d7d                	addi	s10,s10,-1
  8002de:	ff379de3          	bne	a5,s3,8002d8 <vprintfmt+0xce>
  8002e2:	b78d                	j	800244 <vprintfmt+0x3a>
  8002e4:	fd060c1b          	addiw	s8,a2,-48
  8002e8:	00144603          	lbu	a2,1(s0)
  8002ec:	846a                	mv	s0,s10
  8002ee:	fd06069b          	addiw	a3,a2,-48
  8002f2:	0006059b          	sext.w	a1,a2
  8002f6:	02d86463          	bltu	a6,a3,80031e <vprintfmt+0x114>
  8002fa:	00144603          	lbu	a2,1(s0)
  8002fe:	002c169b          	slliw	a3,s8,0x2
  800302:	0186873b          	addw	a4,a3,s8
  800306:	0017171b          	slliw	a4,a4,0x1
  80030a:	9f2d                	addw	a4,a4,a1
  80030c:	fd06069b          	addiw	a3,a2,-48
  800310:	0405                	addi	s0,s0,1
  800312:	fd070c1b          	addiw	s8,a4,-48
  800316:	0006059b          	sext.w	a1,a2
  80031a:	fed870e3          	bgeu	a6,a3,8002fa <vprintfmt+0xf0>
  80031e:	f40ddce3          	bgez	s11,800276 <vprintfmt+0x6c>
  800322:	8de2                	mv	s11,s8
  800324:	5c7d                	li	s8,-1
  800326:	bf81                	j	800276 <vprintfmt+0x6c>
  800328:	fffdc693          	not	a3,s11
  80032c:	96fd                	srai	a3,a3,0x3f
  80032e:	00ddfdb3          	and	s11,s11,a3
  800332:	00144603          	lbu	a2,1(s0)
  800336:	2d81                	sext.w	s11,s11
  800338:	846a                	mv	s0,s10
  80033a:	bf35                	j	800276 <vprintfmt+0x6c>
  80033c:	000a2c03          	lw	s8,0(s4)
  800340:	00144603          	lbu	a2,1(s0)
  800344:	0a21                	addi	s4,s4,8
  800346:	846a                	mv	s0,s10
  800348:	bfd9                	j	80031e <vprintfmt+0x114>
  80034a:	4705                	li	a4,1
  80034c:	008a0593          	addi	a1,s4,8
  800350:	01174463          	blt	a4,a7,800358 <vprintfmt+0x14e>
  800354:	1a088e63          	beqz	a7,800510 <vprintfmt+0x306>
  800358:	000a3603          	ld	a2,0(s4)
  80035c:	46c1                	li	a3,16
  80035e:	8a2e                	mv	s4,a1
  800360:	2781                	sext.w	a5,a5
  800362:	876e                	mv	a4,s11
  800364:	85a6                	mv	a1,s1
  800366:	854a                	mv	a0,s2
  800368:	e37ff0ef          	jal	ra,80019e <printnum>
  80036c:	bde1                	j	800244 <vprintfmt+0x3a>
  80036e:	000a2503          	lw	a0,0(s4)
  800372:	85a6                	mv	a1,s1
  800374:	0a21                	addi	s4,s4,8
  800376:	9902                	jalr	s2
  800378:	b5f1                	j	800244 <vprintfmt+0x3a>
  80037a:	4705                	li	a4,1
  80037c:	008a0593          	addi	a1,s4,8
  800380:	01174463          	blt	a4,a7,800388 <vprintfmt+0x17e>
  800384:	18088163          	beqz	a7,800506 <vprintfmt+0x2fc>
  800388:	000a3603          	ld	a2,0(s4)
  80038c:	46a9                	li	a3,10
  80038e:	8a2e                	mv	s4,a1
  800390:	bfc1                	j	800360 <vprintfmt+0x156>
  800392:	00144603          	lbu	a2,1(s0)
  800396:	4c85                	li	s9,1
  800398:	846a                	mv	s0,s10
  80039a:	bdf1                	j	800276 <vprintfmt+0x6c>
  80039c:	85a6                	mv	a1,s1
  80039e:	02500513          	li	a0,37
  8003a2:	9902                	jalr	s2
  8003a4:	b545                	j	800244 <vprintfmt+0x3a>
  8003a6:	00144603          	lbu	a2,1(s0)
  8003aa:	2885                	addiw	a7,a7,1
  8003ac:	846a                	mv	s0,s10
  8003ae:	b5e1                	j	800276 <vprintfmt+0x6c>
  8003b0:	4705                	li	a4,1
  8003b2:	008a0593          	addi	a1,s4,8
  8003b6:	01174463          	blt	a4,a7,8003be <vprintfmt+0x1b4>
  8003ba:	14088163          	beqz	a7,8004fc <vprintfmt+0x2f2>
  8003be:	000a3603          	ld	a2,0(s4)
  8003c2:	46a1                	li	a3,8
  8003c4:	8a2e                	mv	s4,a1
  8003c6:	bf69                	j	800360 <vprintfmt+0x156>
  8003c8:	03000513          	li	a0,48
  8003cc:	85a6                	mv	a1,s1
  8003ce:	e03e                	sd	a5,0(sp)
  8003d0:	9902                	jalr	s2
  8003d2:	85a6                	mv	a1,s1
  8003d4:	07800513          	li	a0,120
  8003d8:	9902                	jalr	s2
  8003da:	0a21                	addi	s4,s4,8
  8003dc:	6782                	ld	a5,0(sp)
  8003de:	46c1                	li	a3,16
  8003e0:	ff8a3603          	ld	a2,-8(s4)
  8003e4:	bfb5                	j	800360 <vprintfmt+0x156>
  8003e6:	000a3403          	ld	s0,0(s4)
  8003ea:	008a0713          	addi	a4,s4,8
  8003ee:	e03a                	sd	a4,0(sp)
  8003f0:	14040263          	beqz	s0,800534 <vprintfmt+0x32a>
  8003f4:	0fb05763          	blez	s11,8004e2 <vprintfmt+0x2d8>
  8003f8:	02d00693          	li	a3,45
  8003fc:	0cd79163          	bne	a5,a3,8004be <vprintfmt+0x2b4>
  800400:	00044783          	lbu	a5,0(s0)
  800404:	0007851b          	sext.w	a0,a5
  800408:	cf85                	beqz	a5,800440 <vprintfmt+0x236>
  80040a:	00140a13          	addi	s4,s0,1
  80040e:	05e00413          	li	s0,94
  800412:	000c4563          	bltz	s8,80041c <vprintfmt+0x212>
  800416:	3c7d                	addiw	s8,s8,-1
  800418:	036c0263          	beq	s8,s6,80043c <vprintfmt+0x232>
  80041c:	85a6                	mv	a1,s1
  80041e:	0e0c8e63          	beqz	s9,80051a <vprintfmt+0x310>
  800422:	3781                	addiw	a5,a5,-32
  800424:	0ef47b63          	bgeu	s0,a5,80051a <vprintfmt+0x310>
  800428:	03f00513          	li	a0,63
  80042c:	9902                	jalr	s2
  80042e:	000a4783          	lbu	a5,0(s4)
  800432:	3dfd                	addiw	s11,s11,-1
  800434:	0a05                	addi	s4,s4,1
  800436:	0007851b          	sext.w	a0,a5
  80043a:	ffe1                	bnez	a5,800412 <vprintfmt+0x208>
  80043c:	01b05963          	blez	s11,80044e <vprintfmt+0x244>
  800440:	3dfd                	addiw	s11,s11,-1
  800442:	85a6                	mv	a1,s1
  800444:	02000513          	li	a0,32
  800448:	9902                	jalr	s2
  80044a:	fe0d9be3          	bnez	s11,800440 <vprintfmt+0x236>
  80044e:	6a02                	ld	s4,0(sp)
  800450:	bbd5                	j	800244 <vprintfmt+0x3a>
  800452:	4705                	li	a4,1
  800454:	008a0c93          	addi	s9,s4,8
  800458:	01174463          	blt	a4,a7,800460 <vprintfmt+0x256>
  80045c:	08088d63          	beqz	a7,8004f6 <vprintfmt+0x2ec>
  800460:	000a3403          	ld	s0,0(s4)
  800464:	0a044d63          	bltz	s0,80051e <vprintfmt+0x314>
  800468:	8622                	mv	a2,s0
  80046a:	8a66                	mv	s4,s9
  80046c:	46a9                	li	a3,10
  80046e:	bdcd                	j	800360 <vprintfmt+0x156>
  800470:	000a2783          	lw	a5,0(s4)
  800474:	4761                	li	a4,24
  800476:	0a21                	addi	s4,s4,8
  800478:	41f7d69b          	sraiw	a3,a5,0x1f
  80047c:	8fb5                	xor	a5,a5,a3
  80047e:	40d786bb          	subw	a3,a5,a3
  800482:	02d74163          	blt	a4,a3,8004a4 <vprintfmt+0x29a>
  800486:	00369793          	slli	a5,a3,0x3
  80048a:	97de                	add	a5,a5,s7
  80048c:	639c                	ld	a5,0(a5)
  80048e:	cb99                	beqz	a5,8004a4 <vprintfmt+0x29a>
  800490:	86be                	mv	a3,a5
  800492:	00000617          	auipc	a2,0x0
  800496:	32660613          	addi	a2,a2,806 # 8007b8 <main+0x22c>
  80049a:	85a6                	mv	a1,s1
  80049c:	854a                	mv	a0,s2
  80049e:	0ce000ef          	jal	ra,80056c <printfmt>
  8004a2:	b34d                	j	800244 <vprintfmt+0x3a>
  8004a4:	00000617          	auipc	a2,0x0
  8004a8:	30460613          	addi	a2,a2,772 # 8007a8 <main+0x21c>
  8004ac:	85a6                	mv	a1,s1
  8004ae:	854a                	mv	a0,s2
  8004b0:	0bc000ef          	jal	ra,80056c <printfmt>
  8004b4:	bb41                	j	800244 <vprintfmt+0x3a>
  8004b6:	00000417          	auipc	s0,0x0
  8004ba:	2ea40413          	addi	s0,s0,746 # 8007a0 <main+0x214>
  8004be:	85e2                	mv	a1,s8
  8004c0:	8522                	mv	a0,s0
  8004c2:	e43e                	sd	a5,8(sp)
  8004c4:	cadff0ef          	jal	ra,800170 <strnlen>
  8004c8:	40ad8dbb          	subw	s11,s11,a0
  8004cc:	01b05b63          	blez	s11,8004e2 <vprintfmt+0x2d8>
  8004d0:	67a2                	ld	a5,8(sp)
  8004d2:	00078a1b          	sext.w	s4,a5
  8004d6:	3dfd                	addiw	s11,s11,-1
  8004d8:	85a6                	mv	a1,s1
  8004da:	8552                	mv	a0,s4
  8004dc:	9902                	jalr	s2
  8004de:	fe0d9ce3          	bnez	s11,8004d6 <vprintfmt+0x2cc>
  8004e2:	00044783          	lbu	a5,0(s0)
  8004e6:	00140a13          	addi	s4,s0,1
  8004ea:	0007851b          	sext.w	a0,a5
  8004ee:	d3a5                	beqz	a5,80044e <vprintfmt+0x244>
  8004f0:	05e00413          	li	s0,94
  8004f4:	bf39                	j	800412 <vprintfmt+0x208>
  8004f6:	000a2403          	lw	s0,0(s4)
  8004fa:	b7ad                	j	800464 <vprintfmt+0x25a>
  8004fc:	000a6603          	lwu	a2,0(s4)
  800500:	46a1                	li	a3,8
  800502:	8a2e                	mv	s4,a1
  800504:	bdb1                	j	800360 <vprintfmt+0x156>
  800506:	000a6603          	lwu	a2,0(s4)
  80050a:	46a9                	li	a3,10
  80050c:	8a2e                	mv	s4,a1
  80050e:	bd89                	j	800360 <vprintfmt+0x156>
  800510:	000a6603          	lwu	a2,0(s4)
  800514:	46c1                	li	a3,16
  800516:	8a2e                	mv	s4,a1
  800518:	b5a1                	j	800360 <vprintfmt+0x156>
  80051a:	9902                	jalr	s2
  80051c:	bf09                	j	80042e <vprintfmt+0x224>
  80051e:	85a6                	mv	a1,s1
  800520:	02d00513          	li	a0,45
  800524:	e03e                	sd	a5,0(sp)
  800526:	9902                	jalr	s2
  800528:	6782                	ld	a5,0(sp)
  80052a:	8a66                	mv	s4,s9
  80052c:	40800633          	neg	a2,s0
  800530:	46a9                	li	a3,10
  800532:	b53d                	j	800360 <vprintfmt+0x156>
  800534:	03b05163          	blez	s11,800556 <vprintfmt+0x34c>
  800538:	02d00693          	li	a3,45
  80053c:	f6d79de3          	bne	a5,a3,8004b6 <vprintfmt+0x2ac>
  800540:	00000417          	auipc	s0,0x0
  800544:	26040413          	addi	s0,s0,608 # 8007a0 <main+0x214>
  800548:	02800793          	li	a5,40
  80054c:	02800513          	li	a0,40
  800550:	00140a13          	addi	s4,s0,1
  800554:	bd6d                	j	80040e <vprintfmt+0x204>
  800556:	00000a17          	auipc	s4,0x0
  80055a:	24ba0a13          	addi	s4,s4,587 # 8007a1 <main+0x215>
  80055e:	02800513          	li	a0,40
  800562:	02800793          	li	a5,40
  800566:	05e00413          	li	s0,94
  80056a:	b565                	j	800412 <vprintfmt+0x208>

000000000080056c <printfmt>:
  80056c:	715d                	addi	sp,sp,-80
  80056e:	02810313          	addi	t1,sp,40
  800572:	f436                	sd	a3,40(sp)
  800574:	869a                	mv	a3,t1
  800576:	ec06                	sd	ra,24(sp)
  800578:	f83a                	sd	a4,48(sp)
  80057a:	fc3e                	sd	a5,56(sp)
  80057c:	e0c2                	sd	a6,64(sp)
  80057e:	e4c6                	sd	a7,72(sp)
  800580:	e41a                	sd	t1,8(sp)
  800582:	c89ff0ef          	jal	ra,80020a <vprintfmt>
  800586:	60e2                	ld	ra,24(sp)
  800588:	6161                	addi	sp,sp,80
  80058a:	8082                	ret

000000000080058c <main>:
  80058c:	711d                	addi	sp,sp,-96
  80058e:	4651                	li	a2,20
  800590:	4581                	li	a1,0
  800592:	00001517          	auipc	a0,0x1
  800596:	a9e50513          	addi	a0,a0,-1378 # 801030 <pids>
  80059a:	ec86                	sd	ra,88(sp)
  80059c:	e8a2                	sd	s0,80(sp)
  80059e:	e4a6                	sd	s1,72(sp)
  8005a0:	e0ca                	sd	s2,64(sp)
  8005a2:	fc4e                	sd	s3,56(sp)
  8005a4:	f852                	sd	s4,48(sp)
  8005a6:	f456                	sd	s5,40(sp)
  8005a8:	f05a                	sd	s6,32(sp)
  8005aa:	ec5e                	sd	s7,24(sp)
  8005ac:	be1ff0ef          	jal	ra,80018c <memset>
  8005b0:	4519                	li	a0,6
  8005b2:	00001a97          	auipc	s5,0x1
  8005b6:	a4ea8a93          	addi	s5,s5,-1458 # 801000 <acc>
  8005ba:	00001917          	auipc	s2,0x1
  8005be:	a7690913          	addi	s2,s2,-1418 # 801030 <pids>
  8005c2:	b27ff0ef          	jal	ra,8000e8 <lab6_set_priority>
  8005c6:	89d6                	mv	s3,s5
  8005c8:	84ca                	mv	s1,s2
  8005ca:	4401                	li	s0,0
  8005cc:	4a15                	li	s4,5
  8005ce:	0009a023          	sw	zero,0(s3)
  8005d2:	b0dff0ef          	jal	ra,8000de <fork>
  8005d6:	c088                	sw	a0,0(s1)
  8005d8:	c969                	beqz	a0,8006aa <main+0x11e>
  8005da:	12054d63          	bltz	a0,800714 <main+0x188>
  8005de:	2405                	addiw	s0,s0,1
  8005e0:	0991                	addi	s3,s3,4
  8005e2:	0491                	addi	s1,s1,4
  8005e4:	ff4415e3          	bne	s0,s4,8005ce <main+0x42>
  8005e8:	00001497          	auipc	s1,0x1
  8005ec:	a3048493          	addi	s1,s1,-1488 # 801018 <status>
  8005f0:	00000517          	auipc	a0,0x0
  8005f4:	4d050513          	addi	a0,a0,1232 # 800ac0 <error_string+0xe8>
  8005f8:	b37ff0ef          	jal	ra,80012e <cprintf>
  8005fc:	00001997          	auipc	s3,0x1
  800600:	a3098993          	addi	s3,s3,-1488 # 80102c <status+0x14>
  800604:	8a26                	mv	s4,s1
  800606:	8426                	mv	s0,s1
  800608:	00000b97          	auipc	s7,0x0
  80060c:	4e0b8b93          	addi	s7,s7,1248 # 800ae8 <error_string+0x110>
  800610:	00092503          	lw	a0,0(s2)
  800614:	85a2                	mv	a1,s0
  800616:	00042023          	sw	zero,0(s0)
  80061a:	ac7ff0ef          	jal	ra,8000e0 <waitpid>
  80061e:	00092a83          	lw	s5,0(s2)
  800622:	00042b03          	lw	s6,0(s0)
  800626:	ac1ff0ef          	jal	ra,8000e6 <gettime_msec>
  80062a:	0005069b          	sext.w	a3,a0
  80062e:	865a                	mv	a2,s6
  800630:	85d6                	mv	a1,s5
  800632:	855e                	mv	a0,s7
  800634:	0411                	addi	s0,s0,4
  800636:	af9ff0ef          	jal	ra,80012e <cprintf>
  80063a:	0911                	addi	s2,s2,4
  80063c:	fd341ae3          	bne	s0,s3,800610 <main+0x84>
  800640:	00000517          	auipc	a0,0x0
  800644:	4c850513          	addi	a0,a0,1224 # 800b08 <error_string+0x130>
  800648:	ae7ff0ef          	jal	ra,80012e <cprintf>
  80064c:	00000517          	auipc	a0,0x0
  800650:	4d450513          	addi	a0,a0,1236 # 800b20 <error_string+0x148>
  800654:	adbff0ef          	jal	ra,80012e <cprintf>
  800658:	00000417          	auipc	s0,0x0
  80065c:	4e840413          	addi	s0,s0,1256 # 800b40 <error_string+0x168>
  800660:	408c                	lw	a1,0(s1)
  800662:	000a2783          	lw	a5,0(s4)
  800666:	0491                	addi	s1,s1,4
  800668:	0015959b          	slliw	a1,a1,0x1
  80066c:	02f5c5bb          	divw	a1,a1,a5
  800670:	8522                	mv	a0,s0
  800672:	2585                	addiw	a1,a1,1
  800674:	01f5d79b          	srliw	a5,a1,0x1f
  800678:	9dbd                	addw	a1,a1,a5
  80067a:	4015d59b          	sraiw	a1,a1,0x1
  80067e:	ab1ff0ef          	jal	ra,80012e <cprintf>
  800682:	fd349fe3          	bne	s1,s3,800660 <main+0xd4>
  800686:	00000517          	auipc	a0,0x0
  80068a:	0e250513          	addi	a0,a0,226 # 800768 <main+0x1dc>
  80068e:	aa1ff0ef          	jal	ra,80012e <cprintf>
  800692:	60e6                	ld	ra,88(sp)
  800694:	6446                	ld	s0,80(sp)
  800696:	64a6                	ld	s1,72(sp)
  800698:	6906                	ld	s2,64(sp)
  80069a:	79e2                	ld	s3,56(sp)
  80069c:	7a42                	ld	s4,48(sp)
  80069e:	7aa2                	ld	s5,40(sp)
  8006a0:	7b02                	ld	s6,32(sp)
  8006a2:	6be2                	ld	s7,24(sp)
  8006a4:	4501                	li	a0,0
  8006a6:	6125                	addi	sp,sp,96
  8006a8:	8082                	ret
  8006aa:	0014051b          	addiw	a0,s0,1
  8006ae:	040a                	slli	s0,s0,0x2
  8006b0:	9456                	add	s0,s0,s5
  8006b2:	6485                	lui	s1,0x1
  8006b4:	6989                	lui	s3,0x2
  8006b6:	a33ff0ef          	jal	ra,8000e8 <lab6_set_priority>
  8006ba:	fa04849b          	addiw	s1,s1,-96
  8006be:	00042023          	sw	zero,0(s0)
  8006c2:	71098993          	addi	s3,s3,1808 # 2710 <__panic-0x7fd910>
  8006c6:	4014                	lw	a3,0(s0)
  8006c8:	2685                	addiw	a3,a3,1
  8006ca:	0c800713          	li	a4,200
  8006ce:	47b2                	lw	a5,12(sp)
  8006d0:	377d                	addiw	a4,a4,-1
  8006d2:	2781                	sext.w	a5,a5
  8006d4:	0017b793          	seqz	a5,a5
  8006d8:	c63e                	sw	a5,12(sp)
  8006da:	fb75                	bnez	a4,8006ce <main+0x142>
  8006dc:	0296f7bb          	remuw	a5,a3,s1
  8006e0:	0016871b          	addiw	a4,a3,1
  8006e4:	c399                	beqz	a5,8006ea <main+0x15e>
  8006e6:	86ba                	mv	a3,a4
  8006e8:	b7cd                	j	8006ca <main+0x13e>
  8006ea:	c014                	sw	a3,0(s0)
  8006ec:	9fbff0ef          	jal	ra,8000e6 <gettime_msec>
  8006f0:	0005091b          	sext.w	s2,a0
  8006f4:	fd29d9e3          	bge	s3,s2,8006c6 <main+0x13a>
  8006f8:	9edff0ef          	jal	ra,8000e4 <getpid>
  8006fc:	4010                	lw	a2,0(s0)
  8006fe:	85aa                	mv	a1,a0
  800700:	86ca                	mv	a3,s2
  800702:	00000517          	auipc	a0,0x0
  800706:	39e50513          	addi	a0,a0,926 # 800aa0 <error_string+0xc8>
  80070a:	a25ff0ef          	jal	ra,80012e <cprintf>
  80070e:	4008                	lw	a0,0(s0)
  800710:	9b9ff0ef          	jal	ra,8000c8 <exit>
  800714:	00001417          	auipc	s0,0x1
  800718:	93040413          	addi	s0,s0,-1744 # 801044 <pids+0x14>
  80071c:	00092503          	lw	a0,0(s2)
  800720:	00a05463          	blez	a0,800728 <main+0x19c>
  800724:	9bfff0ef          	jal	ra,8000e2 <kill>
  800728:	0911                	addi	s2,s2,4
  80072a:	ff2419e3          	bne	s0,s2,80071c <main+0x190>
  80072e:	00000617          	auipc	a2,0x0
  800732:	41a60613          	addi	a2,a2,1050 # 800b48 <error_string+0x170>
  800736:	04b00593          	li	a1,75
  80073a:	00000517          	auipc	a0,0x0
  80073e:	41e50513          	addi	a0,a0,1054 # 800b58 <error_string+0x180>
  800742:	8dfff0ef          	jal	ra,800020 <__panic>
