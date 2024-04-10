
obj/__user_spin.out:     file format elf64-littleriscv


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
  800034:	60850513          	addi	a0,a0,1544 # 800638 <main+0xd2>
  800038:	ec06                	sd	ra,24(sp)
  80003a:	f436                	sd	a3,40(sp)
  80003c:	f83a                	sd	a4,48(sp)
  80003e:	e0c2                	sd	a6,64(sp)
  800040:	e4c6                	sd	a7,72(sp)
  800042:	e43e                	sd	a5,8(sp)
  800044:	0d6000ef          	jal	ra,80011a <cprintf>
  800048:	65a2                	ld	a1,8(sp)
  80004a:	8522                	mv	a0,s0
  80004c:	0ae000ef          	jal	ra,8000fa <vcprintf>
  800050:	00000517          	auipc	a0,0x0
  800054:	60850513          	addi	a0,a0,1544 # 800658 <main+0xf2>
  800058:	0c2000ef          	jal	ra,80011a <cprintf>
  80005c:	5559                	li	a0,-10
  80005e:	05e000ef          	jal	ra,8000bc <exit>

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

00000000008000ac <sys_yield>:
  8000ac:	4529                	li	a0,10
  8000ae:	bf55                	j	800062 <syscall>

00000000008000b0 <sys_kill>:
  8000b0:	85aa                	mv	a1,a0
  8000b2:	4531                	li	a0,12
  8000b4:	b77d                	j	800062 <syscall>

00000000008000b6 <sys_putc>:
  8000b6:	85aa                	mv	a1,a0
  8000b8:	4579                	li	a0,30
  8000ba:	b765                	j	800062 <syscall>

00000000008000bc <exit>:
  8000bc:	1141                	addi	sp,sp,-16
  8000be:	e406                	sd	ra,8(sp)
  8000c0:	fdbff0ef          	jal	ra,80009a <sys_exit>
  8000c4:	00000517          	auipc	a0,0x0
  8000c8:	59c50513          	addi	a0,a0,1436 # 800660 <main+0xfa>
  8000cc:	04e000ef          	jal	ra,80011a <cprintf>
  8000d0:	a001                	j	8000d0 <exit+0x14>

00000000008000d2 <fork>:
  8000d2:	b7f9                	j	8000a0 <sys_fork>

00000000008000d4 <waitpid>:
  8000d4:	bfc1                	j	8000a4 <sys_wait>

00000000008000d6 <yield>:
  8000d6:	bfd9                	j	8000ac <sys_yield>

00000000008000d8 <kill>:
  8000d8:	bfe1                	j	8000b0 <sys_kill>

00000000008000da <_start>:
  8000da:	076000ef          	jal	ra,800150 <umain>
  8000de:	a001                	j	8000de <_start+0x4>

00000000008000e0 <cputch>:
  8000e0:	1141                	addi	sp,sp,-16
  8000e2:	e022                	sd	s0,0(sp)
  8000e4:	e406                	sd	ra,8(sp)
  8000e6:	842e                	mv	s0,a1
  8000e8:	fcfff0ef          	jal	ra,8000b6 <sys_putc>
  8000ec:	401c                	lw	a5,0(s0)
  8000ee:	60a2                	ld	ra,8(sp)
  8000f0:	2785                	addiw	a5,a5,1
  8000f2:	c01c                	sw	a5,0(s0)
  8000f4:	6402                	ld	s0,0(sp)
  8000f6:	0141                	addi	sp,sp,16
  8000f8:	8082                	ret

00000000008000fa <vcprintf>:
  8000fa:	1101                	addi	sp,sp,-32
  8000fc:	862a                	mv	a2,a0
  8000fe:	86ae                	mv	a3,a1
  800100:	00000517          	auipc	a0,0x0
  800104:	fe050513          	addi	a0,a0,-32 # 8000e0 <cputch>
  800108:	006c                	addi	a1,sp,12
  80010a:	ec06                	sd	ra,24(sp)
  80010c:	c602                	sw	zero,12(sp)
  80010e:	0d6000ef          	jal	ra,8001e4 <vprintfmt>
  800112:	60e2                	ld	ra,24(sp)
  800114:	4532                	lw	a0,12(sp)
  800116:	6105                	addi	sp,sp,32
  800118:	8082                	ret

000000000080011a <cprintf>:
  80011a:	711d                	addi	sp,sp,-96
  80011c:	02810313          	addi	t1,sp,40
  800120:	8e2a                	mv	t3,a0
  800122:	f42e                	sd	a1,40(sp)
  800124:	f832                	sd	a2,48(sp)
  800126:	fc36                	sd	a3,56(sp)
  800128:	00000517          	auipc	a0,0x0
  80012c:	fb850513          	addi	a0,a0,-72 # 8000e0 <cputch>
  800130:	004c                	addi	a1,sp,4
  800132:	869a                	mv	a3,t1
  800134:	8672                	mv	a2,t3
  800136:	ec06                	sd	ra,24(sp)
  800138:	e0ba                	sd	a4,64(sp)
  80013a:	e4be                	sd	a5,72(sp)
  80013c:	e8c2                	sd	a6,80(sp)
  80013e:	ecc6                	sd	a7,88(sp)
  800140:	e41a                	sd	t1,8(sp)
  800142:	c202                	sw	zero,4(sp)
  800144:	0a0000ef          	jal	ra,8001e4 <vprintfmt>
  800148:	60e2                	ld	ra,24(sp)
  80014a:	4512                	lw	a0,4(sp)
  80014c:	6125                	addi	sp,sp,96
  80014e:	8082                	ret

0000000000800150 <umain>:
  800150:	1141                	addi	sp,sp,-16
  800152:	e406                	sd	ra,8(sp)
  800154:	412000ef          	jal	ra,800566 <main>
  800158:	f65ff0ef          	jal	ra,8000bc <exit>

000000000080015c <strnlen>:
  80015c:	872a                	mv	a4,a0
  80015e:	4501                	li	a0,0
  800160:	e589                	bnez	a1,80016a <strnlen+0xe>
  800162:	a811                	j	800176 <strnlen+0x1a>
  800164:	0505                	addi	a0,a0,1
  800166:	00a58763          	beq	a1,a0,800174 <strnlen+0x18>
  80016a:	00a707b3          	add	a5,a4,a0
  80016e:	0007c783          	lbu	a5,0(a5)
  800172:	fbed                	bnez	a5,800164 <strnlen+0x8>
  800174:	8082                	ret
  800176:	8082                	ret

0000000000800178 <printnum>:
  800178:	02069813          	slli	a6,a3,0x20
  80017c:	7179                	addi	sp,sp,-48
  80017e:	02085813          	srli	a6,a6,0x20
  800182:	e052                	sd	s4,0(sp)
  800184:	03067a33          	remu	s4,a2,a6
  800188:	f022                	sd	s0,32(sp)
  80018a:	ec26                	sd	s1,24(sp)
  80018c:	e84a                	sd	s2,16(sp)
  80018e:	f406                	sd	ra,40(sp)
  800190:	e44e                	sd	s3,8(sp)
  800192:	84aa                	mv	s1,a0
  800194:	892e                	mv	s2,a1
  800196:	fff7041b          	addiw	s0,a4,-1
  80019a:	2a01                	sext.w	s4,s4
  80019c:	03067e63          	bgeu	a2,a6,8001d8 <printnum+0x60>
  8001a0:	89be                	mv	s3,a5
  8001a2:	00805763          	blez	s0,8001b0 <printnum+0x38>
  8001a6:	347d                	addiw	s0,s0,-1
  8001a8:	85ca                	mv	a1,s2
  8001aa:	854e                	mv	a0,s3
  8001ac:	9482                	jalr	s1
  8001ae:	fc65                	bnez	s0,8001a6 <printnum+0x2e>
  8001b0:	1a02                	slli	s4,s4,0x20
  8001b2:	020a5a13          	srli	s4,s4,0x20
  8001b6:	00000797          	auipc	a5,0x0
  8001ba:	4c278793          	addi	a5,a5,1218 # 800678 <main+0x112>
  8001be:	7402                	ld	s0,32(sp)
  8001c0:	9a3e                	add	s4,s4,a5
  8001c2:	000a4503          	lbu	a0,0(s4)
  8001c6:	70a2                	ld	ra,40(sp)
  8001c8:	69a2                	ld	s3,8(sp)
  8001ca:	6a02                	ld	s4,0(sp)
  8001cc:	85ca                	mv	a1,s2
  8001ce:	8326                	mv	t1,s1
  8001d0:	6942                	ld	s2,16(sp)
  8001d2:	64e2                	ld	s1,24(sp)
  8001d4:	6145                	addi	sp,sp,48
  8001d6:	8302                	jr	t1
  8001d8:	03065633          	divu	a2,a2,a6
  8001dc:	8722                	mv	a4,s0
  8001de:	f9bff0ef          	jal	ra,800178 <printnum>
  8001e2:	b7f9                	j	8001b0 <printnum+0x38>

00000000008001e4 <vprintfmt>:
  8001e4:	7119                	addi	sp,sp,-128
  8001e6:	f4a6                	sd	s1,104(sp)
  8001e8:	f0ca                	sd	s2,96(sp)
  8001ea:	ecce                	sd	s3,88(sp)
  8001ec:	e8d2                	sd	s4,80(sp)
  8001ee:	e4d6                	sd	s5,72(sp)
  8001f0:	e0da                	sd	s6,64(sp)
  8001f2:	fc5e                	sd	s7,56(sp)
  8001f4:	f06a                	sd	s10,32(sp)
  8001f6:	fc86                	sd	ra,120(sp)
  8001f8:	f8a2                	sd	s0,112(sp)
  8001fa:	f862                	sd	s8,48(sp)
  8001fc:	f466                	sd	s9,40(sp)
  8001fe:	ec6e                	sd	s11,24(sp)
  800200:	892a                	mv	s2,a0
  800202:	84ae                	mv	s1,a1
  800204:	8d32                	mv	s10,a2
  800206:	8a36                	mv	s4,a3
  800208:	02500993          	li	s3,37
  80020c:	5b7d                	li	s6,-1
  80020e:	00000a97          	auipc	s5,0x0
  800212:	49ea8a93          	addi	s5,s5,1182 # 8006ac <main+0x146>
  800216:	00000b97          	auipc	s7,0x0
  80021a:	6b2b8b93          	addi	s7,s7,1714 # 8008c8 <error_string>
  80021e:	000d4503          	lbu	a0,0(s10)
  800222:	001d0413          	addi	s0,s10,1
  800226:	01350a63          	beq	a0,s3,80023a <vprintfmt+0x56>
  80022a:	c121                	beqz	a0,80026a <vprintfmt+0x86>
  80022c:	85a6                	mv	a1,s1
  80022e:	0405                	addi	s0,s0,1
  800230:	9902                	jalr	s2
  800232:	fff44503          	lbu	a0,-1(s0)
  800236:	ff351ae3          	bne	a0,s3,80022a <vprintfmt+0x46>
  80023a:	00044603          	lbu	a2,0(s0)
  80023e:	02000793          	li	a5,32
  800242:	4c81                	li	s9,0
  800244:	4881                	li	a7,0
  800246:	5c7d                	li	s8,-1
  800248:	5dfd                	li	s11,-1
  80024a:	05500513          	li	a0,85
  80024e:	4825                	li	a6,9
  800250:	fdd6059b          	addiw	a1,a2,-35
  800254:	0ff5f593          	andi	a1,a1,255
  800258:	00140d13          	addi	s10,s0,1
  80025c:	04b56263          	bltu	a0,a1,8002a0 <vprintfmt+0xbc>
  800260:	058a                	slli	a1,a1,0x2
  800262:	95d6                	add	a1,a1,s5
  800264:	4194                	lw	a3,0(a1)
  800266:	96d6                	add	a3,a3,s5
  800268:	8682                	jr	a3
  80026a:	70e6                	ld	ra,120(sp)
  80026c:	7446                	ld	s0,112(sp)
  80026e:	74a6                	ld	s1,104(sp)
  800270:	7906                	ld	s2,96(sp)
  800272:	69e6                	ld	s3,88(sp)
  800274:	6a46                	ld	s4,80(sp)
  800276:	6aa6                	ld	s5,72(sp)
  800278:	6b06                	ld	s6,64(sp)
  80027a:	7be2                	ld	s7,56(sp)
  80027c:	7c42                	ld	s8,48(sp)
  80027e:	7ca2                	ld	s9,40(sp)
  800280:	7d02                	ld	s10,32(sp)
  800282:	6de2                	ld	s11,24(sp)
  800284:	6109                	addi	sp,sp,128
  800286:	8082                	ret
  800288:	87b2                	mv	a5,a2
  80028a:	00144603          	lbu	a2,1(s0)
  80028e:	846a                	mv	s0,s10
  800290:	00140d13          	addi	s10,s0,1
  800294:	fdd6059b          	addiw	a1,a2,-35
  800298:	0ff5f593          	andi	a1,a1,255
  80029c:	fcb572e3          	bgeu	a0,a1,800260 <vprintfmt+0x7c>
  8002a0:	85a6                	mv	a1,s1
  8002a2:	02500513          	li	a0,37
  8002a6:	9902                	jalr	s2
  8002a8:	fff44783          	lbu	a5,-1(s0)
  8002ac:	8d22                	mv	s10,s0
  8002ae:	f73788e3          	beq	a5,s3,80021e <vprintfmt+0x3a>
  8002b2:	ffed4783          	lbu	a5,-2(s10)
  8002b6:	1d7d                	addi	s10,s10,-1
  8002b8:	ff379de3          	bne	a5,s3,8002b2 <vprintfmt+0xce>
  8002bc:	b78d                	j	80021e <vprintfmt+0x3a>
  8002be:	fd060c1b          	addiw	s8,a2,-48
  8002c2:	00144603          	lbu	a2,1(s0)
  8002c6:	846a                	mv	s0,s10
  8002c8:	fd06069b          	addiw	a3,a2,-48
  8002cc:	0006059b          	sext.w	a1,a2
  8002d0:	02d86463          	bltu	a6,a3,8002f8 <vprintfmt+0x114>
  8002d4:	00144603          	lbu	a2,1(s0)
  8002d8:	002c169b          	slliw	a3,s8,0x2
  8002dc:	0186873b          	addw	a4,a3,s8
  8002e0:	0017171b          	slliw	a4,a4,0x1
  8002e4:	9f2d                	addw	a4,a4,a1
  8002e6:	fd06069b          	addiw	a3,a2,-48
  8002ea:	0405                	addi	s0,s0,1
  8002ec:	fd070c1b          	addiw	s8,a4,-48
  8002f0:	0006059b          	sext.w	a1,a2
  8002f4:	fed870e3          	bgeu	a6,a3,8002d4 <vprintfmt+0xf0>
  8002f8:	f40ddce3          	bgez	s11,800250 <vprintfmt+0x6c>
  8002fc:	8de2                	mv	s11,s8
  8002fe:	5c7d                	li	s8,-1
  800300:	bf81                	j	800250 <vprintfmt+0x6c>
  800302:	fffdc693          	not	a3,s11
  800306:	96fd                	srai	a3,a3,0x3f
  800308:	00ddfdb3          	and	s11,s11,a3
  80030c:	00144603          	lbu	a2,1(s0)
  800310:	2d81                	sext.w	s11,s11
  800312:	846a                	mv	s0,s10
  800314:	bf35                	j	800250 <vprintfmt+0x6c>
  800316:	000a2c03          	lw	s8,0(s4)
  80031a:	00144603          	lbu	a2,1(s0)
  80031e:	0a21                	addi	s4,s4,8
  800320:	846a                	mv	s0,s10
  800322:	bfd9                	j	8002f8 <vprintfmt+0x114>
  800324:	4705                	li	a4,1
  800326:	008a0593          	addi	a1,s4,8
  80032a:	01174463          	blt	a4,a7,800332 <vprintfmt+0x14e>
  80032e:	1a088e63          	beqz	a7,8004ea <vprintfmt+0x306>
  800332:	000a3603          	ld	a2,0(s4)
  800336:	46c1                	li	a3,16
  800338:	8a2e                	mv	s4,a1
  80033a:	2781                	sext.w	a5,a5
  80033c:	876e                	mv	a4,s11
  80033e:	85a6                	mv	a1,s1
  800340:	854a                	mv	a0,s2
  800342:	e37ff0ef          	jal	ra,800178 <printnum>
  800346:	bde1                	j	80021e <vprintfmt+0x3a>
  800348:	000a2503          	lw	a0,0(s4)
  80034c:	85a6                	mv	a1,s1
  80034e:	0a21                	addi	s4,s4,8
  800350:	9902                	jalr	s2
  800352:	b5f1                	j	80021e <vprintfmt+0x3a>
  800354:	4705                	li	a4,1
  800356:	008a0593          	addi	a1,s4,8
  80035a:	01174463          	blt	a4,a7,800362 <vprintfmt+0x17e>
  80035e:	18088163          	beqz	a7,8004e0 <vprintfmt+0x2fc>
  800362:	000a3603          	ld	a2,0(s4)
  800366:	46a9                	li	a3,10
  800368:	8a2e                	mv	s4,a1
  80036a:	bfc1                	j	80033a <vprintfmt+0x156>
  80036c:	00144603          	lbu	a2,1(s0)
  800370:	4c85                	li	s9,1
  800372:	846a                	mv	s0,s10
  800374:	bdf1                	j	800250 <vprintfmt+0x6c>
  800376:	85a6                	mv	a1,s1
  800378:	02500513          	li	a0,37
  80037c:	9902                	jalr	s2
  80037e:	b545                	j	80021e <vprintfmt+0x3a>
  800380:	00144603          	lbu	a2,1(s0)
  800384:	2885                	addiw	a7,a7,1
  800386:	846a                	mv	s0,s10
  800388:	b5e1                	j	800250 <vprintfmt+0x6c>
  80038a:	4705                	li	a4,1
  80038c:	008a0593          	addi	a1,s4,8
  800390:	01174463          	blt	a4,a7,800398 <vprintfmt+0x1b4>
  800394:	14088163          	beqz	a7,8004d6 <vprintfmt+0x2f2>
  800398:	000a3603          	ld	a2,0(s4)
  80039c:	46a1                	li	a3,8
  80039e:	8a2e                	mv	s4,a1
  8003a0:	bf69                	j	80033a <vprintfmt+0x156>
  8003a2:	03000513          	li	a0,48
  8003a6:	85a6                	mv	a1,s1
  8003a8:	e03e                	sd	a5,0(sp)
  8003aa:	9902                	jalr	s2
  8003ac:	85a6                	mv	a1,s1
  8003ae:	07800513          	li	a0,120
  8003b2:	9902                	jalr	s2
  8003b4:	0a21                	addi	s4,s4,8
  8003b6:	6782                	ld	a5,0(sp)
  8003b8:	46c1                	li	a3,16
  8003ba:	ff8a3603          	ld	a2,-8(s4)
  8003be:	bfb5                	j	80033a <vprintfmt+0x156>
  8003c0:	000a3403          	ld	s0,0(s4)
  8003c4:	008a0713          	addi	a4,s4,8
  8003c8:	e03a                	sd	a4,0(sp)
  8003ca:	14040263          	beqz	s0,80050e <vprintfmt+0x32a>
  8003ce:	0fb05763          	blez	s11,8004bc <vprintfmt+0x2d8>
  8003d2:	02d00693          	li	a3,45
  8003d6:	0cd79163          	bne	a5,a3,800498 <vprintfmt+0x2b4>
  8003da:	00044783          	lbu	a5,0(s0)
  8003de:	0007851b          	sext.w	a0,a5
  8003e2:	cf85                	beqz	a5,80041a <vprintfmt+0x236>
  8003e4:	00140a13          	addi	s4,s0,1
  8003e8:	05e00413          	li	s0,94
  8003ec:	000c4563          	bltz	s8,8003f6 <vprintfmt+0x212>
  8003f0:	3c7d                	addiw	s8,s8,-1
  8003f2:	036c0263          	beq	s8,s6,800416 <vprintfmt+0x232>
  8003f6:	85a6                	mv	a1,s1
  8003f8:	0e0c8e63          	beqz	s9,8004f4 <vprintfmt+0x310>
  8003fc:	3781                	addiw	a5,a5,-32
  8003fe:	0ef47b63          	bgeu	s0,a5,8004f4 <vprintfmt+0x310>
  800402:	03f00513          	li	a0,63
  800406:	9902                	jalr	s2
  800408:	000a4783          	lbu	a5,0(s4)
  80040c:	3dfd                	addiw	s11,s11,-1
  80040e:	0a05                	addi	s4,s4,1
  800410:	0007851b          	sext.w	a0,a5
  800414:	ffe1                	bnez	a5,8003ec <vprintfmt+0x208>
  800416:	01b05963          	blez	s11,800428 <vprintfmt+0x244>
  80041a:	3dfd                	addiw	s11,s11,-1
  80041c:	85a6                	mv	a1,s1
  80041e:	02000513          	li	a0,32
  800422:	9902                	jalr	s2
  800424:	fe0d9be3          	bnez	s11,80041a <vprintfmt+0x236>
  800428:	6a02                	ld	s4,0(sp)
  80042a:	bbd5                	j	80021e <vprintfmt+0x3a>
  80042c:	4705                	li	a4,1
  80042e:	008a0c93          	addi	s9,s4,8
  800432:	01174463          	blt	a4,a7,80043a <vprintfmt+0x256>
  800436:	08088d63          	beqz	a7,8004d0 <vprintfmt+0x2ec>
  80043a:	000a3403          	ld	s0,0(s4)
  80043e:	0a044d63          	bltz	s0,8004f8 <vprintfmt+0x314>
  800442:	8622                	mv	a2,s0
  800444:	8a66                	mv	s4,s9
  800446:	46a9                	li	a3,10
  800448:	bdcd                	j	80033a <vprintfmt+0x156>
  80044a:	000a2783          	lw	a5,0(s4)
  80044e:	4761                	li	a4,24
  800450:	0a21                	addi	s4,s4,8
  800452:	41f7d69b          	sraiw	a3,a5,0x1f
  800456:	8fb5                	xor	a5,a5,a3
  800458:	40d786bb          	subw	a3,a5,a3
  80045c:	02d74163          	blt	a4,a3,80047e <vprintfmt+0x29a>
  800460:	00369793          	slli	a5,a3,0x3
  800464:	97de                	add	a5,a5,s7
  800466:	639c                	ld	a5,0(a5)
  800468:	cb99                	beqz	a5,80047e <vprintfmt+0x29a>
  80046a:	86be                	mv	a3,a5
  80046c:	00000617          	auipc	a2,0x0
  800470:	23c60613          	addi	a2,a2,572 # 8006a8 <main+0x142>
  800474:	85a6                	mv	a1,s1
  800476:	854a                	mv	a0,s2
  800478:	0ce000ef          	jal	ra,800546 <printfmt>
  80047c:	b34d                	j	80021e <vprintfmt+0x3a>
  80047e:	00000617          	auipc	a2,0x0
  800482:	21a60613          	addi	a2,a2,538 # 800698 <main+0x132>
  800486:	85a6                	mv	a1,s1
  800488:	854a                	mv	a0,s2
  80048a:	0bc000ef          	jal	ra,800546 <printfmt>
  80048e:	bb41                	j	80021e <vprintfmt+0x3a>
  800490:	00000417          	auipc	s0,0x0
  800494:	20040413          	addi	s0,s0,512 # 800690 <main+0x12a>
  800498:	85e2                	mv	a1,s8
  80049a:	8522                	mv	a0,s0
  80049c:	e43e                	sd	a5,8(sp)
  80049e:	cbfff0ef          	jal	ra,80015c <strnlen>
  8004a2:	40ad8dbb          	subw	s11,s11,a0
  8004a6:	01b05b63          	blez	s11,8004bc <vprintfmt+0x2d8>
  8004aa:	67a2                	ld	a5,8(sp)
  8004ac:	00078a1b          	sext.w	s4,a5
  8004b0:	3dfd                	addiw	s11,s11,-1
  8004b2:	85a6                	mv	a1,s1
  8004b4:	8552                	mv	a0,s4
  8004b6:	9902                	jalr	s2
  8004b8:	fe0d9ce3          	bnez	s11,8004b0 <vprintfmt+0x2cc>
  8004bc:	00044783          	lbu	a5,0(s0)
  8004c0:	00140a13          	addi	s4,s0,1
  8004c4:	0007851b          	sext.w	a0,a5
  8004c8:	d3a5                	beqz	a5,800428 <vprintfmt+0x244>
  8004ca:	05e00413          	li	s0,94
  8004ce:	bf39                	j	8003ec <vprintfmt+0x208>
  8004d0:	000a2403          	lw	s0,0(s4)
  8004d4:	b7ad                	j	80043e <vprintfmt+0x25a>
  8004d6:	000a6603          	lwu	a2,0(s4)
  8004da:	46a1                	li	a3,8
  8004dc:	8a2e                	mv	s4,a1
  8004de:	bdb1                	j	80033a <vprintfmt+0x156>
  8004e0:	000a6603          	lwu	a2,0(s4)
  8004e4:	46a9                	li	a3,10
  8004e6:	8a2e                	mv	s4,a1
  8004e8:	bd89                	j	80033a <vprintfmt+0x156>
  8004ea:	000a6603          	lwu	a2,0(s4)
  8004ee:	46c1                	li	a3,16
  8004f0:	8a2e                	mv	s4,a1
  8004f2:	b5a1                	j	80033a <vprintfmt+0x156>
  8004f4:	9902                	jalr	s2
  8004f6:	bf09                	j	800408 <vprintfmt+0x224>
  8004f8:	85a6                	mv	a1,s1
  8004fa:	02d00513          	li	a0,45
  8004fe:	e03e                	sd	a5,0(sp)
  800500:	9902                	jalr	s2
  800502:	6782                	ld	a5,0(sp)
  800504:	8a66                	mv	s4,s9
  800506:	40800633          	neg	a2,s0
  80050a:	46a9                	li	a3,10
  80050c:	b53d                	j	80033a <vprintfmt+0x156>
  80050e:	03b05163          	blez	s11,800530 <vprintfmt+0x34c>
  800512:	02d00693          	li	a3,45
  800516:	f6d79de3          	bne	a5,a3,800490 <vprintfmt+0x2ac>
  80051a:	00000417          	auipc	s0,0x0
  80051e:	17640413          	addi	s0,s0,374 # 800690 <main+0x12a>
  800522:	02800793          	li	a5,40
  800526:	02800513          	li	a0,40
  80052a:	00140a13          	addi	s4,s0,1
  80052e:	bd6d                	j	8003e8 <vprintfmt+0x204>
  800530:	00000a17          	auipc	s4,0x0
  800534:	161a0a13          	addi	s4,s4,353 # 800691 <main+0x12b>
  800538:	02800513          	li	a0,40
  80053c:	02800793          	li	a5,40
  800540:	05e00413          	li	s0,94
  800544:	b565                	j	8003ec <vprintfmt+0x208>

0000000000800546 <printfmt>:
  800546:	715d                	addi	sp,sp,-80
  800548:	02810313          	addi	t1,sp,40
  80054c:	f436                	sd	a3,40(sp)
  80054e:	869a                	mv	a3,t1
  800550:	ec06                	sd	ra,24(sp)
  800552:	f83a                	sd	a4,48(sp)
  800554:	fc3e                	sd	a5,56(sp)
  800556:	e0c2                	sd	a6,64(sp)
  800558:	e4c6                	sd	a7,72(sp)
  80055a:	e41a                	sd	t1,8(sp)
  80055c:	c89ff0ef          	jal	ra,8001e4 <vprintfmt>
  800560:	60e2                	ld	ra,24(sp)
  800562:	6161                	addi	sp,sp,80
  800564:	8082                	ret

0000000000800566 <main>:
  800566:	1141                	addi	sp,sp,-16
  800568:	00000517          	auipc	a0,0x0
  80056c:	42850513          	addi	a0,a0,1064 # 800990 <error_string+0xc8>
  800570:	e406                	sd	ra,8(sp)
  800572:	e022                	sd	s0,0(sp)
  800574:	ba7ff0ef          	jal	ra,80011a <cprintf>
  800578:	b5bff0ef          	jal	ra,8000d2 <fork>
  80057c:	e901                	bnez	a0,80058c <main+0x26>
  80057e:	00000517          	auipc	a0,0x0
  800582:	43a50513          	addi	a0,a0,1082 # 8009b8 <error_string+0xf0>
  800586:	b95ff0ef          	jal	ra,80011a <cprintf>
  80058a:	a001                	j	80058a <main+0x24>
  80058c:	842a                	mv	s0,a0
  80058e:	00000517          	auipc	a0,0x0
  800592:	44a50513          	addi	a0,a0,1098 # 8009d8 <error_string+0x110>
  800596:	b85ff0ef          	jal	ra,80011a <cprintf>
  80059a:	b3dff0ef          	jal	ra,8000d6 <yield>
  80059e:	b39ff0ef          	jal	ra,8000d6 <yield>
  8005a2:	b35ff0ef          	jal	ra,8000d6 <yield>
  8005a6:	00000517          	auipc	a0,0x0
  8005aa:	45a50513          	addi	a0,a0,1114 # 800a00 <error_string+0x138>
  8005ae:	b6dff0ef          	jal	ra,80011a <cprintf>
  8005b2:	8522                	mv	a0,s0
  8005b4:	b25ff0ef          	jal	ra,8000d8 <kill>
  8005b8:	ed31                	bnez	a0,800614 <main+0xae>
  8005ba:	4581                	li	a1,0
  8005bc:	00000517          	auipc	a0,0x0
  8005c0:	4ac50513          	addi	a0,a0,1196 # 800a68 <error_string+0x1a0>
  8005c4:	b57ff0ef          	jal	ra,80011a <cprintf>
  8005c8:	4581                	li	a1,0
  8005ca:	8522                	mv	a0,s0
  8005cc:	b09ff0ef          	jal	ra,8000d4 <waitpid>
  8005d0:	e11d                	bnez	a0,8005f6 <main+0x90>
  8005d2:	4581                	li	a1,0
  8005d4:	00000517          	auipc	a0,0x0
  8005d8:	4cc50513          	addi	a0,a0,1228 # 800aa0 <error_string+0x1d8>
  8005dc:	b3fff0ef          	jal	ra,80011a <cprintf>
  8005e0:	00000517          	auipc	a0,0x0
  8005e4:	4d850513          	addi	a0,a0,1240 # 800ab8 <error_string+0x1f0>
  8005e8:	b33ff0ef          	jal	ra,80011a <cprintf>
  8005ec:	60a2                	ld	ra,8(sp)
  8005ee:	6402                	ld	s0,0(sp)
  8005f0:	4501                	li	a0,0
  8005f2:	0141                	addi	sp,sp,16
  8005f4:	8082                	ret
  8005f6:	00000697          	auipc	a3,0x0
  8005fa:	48a68693          	addi	a3,a3,1162 # 800a80 <error_string+0x1b8>
  8005fe:	00000617          	auipc	a2,0x0
  800602:	44260613          	addi	a2,a2,1090 # 800a40 <error_string+0x178>
  800606:	45dd                	li	a1,23
  800608:	00000517          	auipc	a0,0x0
  80060c:	45050513          	addi	a0,a0,1104 # 800a58 <error_string+0x190>
  800610:	a11ff0ef          	jal	ra,800020 <__panic>
  800614:	00000697          	auipc	a3,0x0
  800618:	41468693          	addi	a3,a3,1044 # 800a28 <error_string+0x160>
  80061c:	00000617          	auipc	a2,0x0
  800620:	42460613          	addi	a2,a2,1060 # 800a40 <error_string+0x178>
  800624:	45d1                	li	a1,20
  800626:	00000517          	auipc	a0,0x0
  80062a:	43250513          	addi	a0,a0,1074 # 800a58 <error_string+0x190>
  80062e:	9f3ff0ef          	jal	ra,800020 <__panic>
