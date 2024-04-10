
obj/__user_exit.out:     file format elf64-littleriscv


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
  800034:	64850513          	addi	a0,a0,1608 # 800678 <main+0x114>
  800038:	ec06                	sd	ra,24(sp)
  80003a:	f436                	sd	a3,40(sp)
  80003c:	f83a                	sd	a4,48(sp)
  80003e:	e0c2                	sd	a6,64(sp)
  800040:	e4c6                	sd	a7,72(sp)
  800042:	e43e                	sd	a5,8(sp)
  800044:	0d4000ef          	jal	ra,800118 <cprintf>
  800048:	65a2                	ld	a1,8(sp)
  80004a:	8522                	mv	a0,s0
  80004c:	0ac000ef          	jal	ra,8000f8 <vcprintf>
  800050:	00001517          	auipc	a0,0x1
  800054:	9d850513          	addi	a0,a0,-1576 # 800a28 <error_string+0x128>
  800058:	0c0000ef          	jal	ra,800118 <cprintf>
  80005c:	5559                	li	a0,-10
  80005e:	058000ef          	jal	ra,8000b6 <exit>

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

00000000008000b0 <sys_putc>:
  8000b0:	85aa                	mv	a1,a0
  8000b2:	4579                	li	a0,30
  8000b4:	b77d                	j	800062 <syscall>

00000000008000b6 <exit>:
  8000b6:	1141                	addi	sp,sp,-16
  8000b8:	e406                	sd	ra,8(sp)
  8000ba:	fe1ff0ef          	jal	ra,80009a <sys_exit>
  8000be:	00000517          	auipc	a0,0x0
  8000c2:	5da50513          	addi	a0,a0,1498 # 800698 <main+0x134>
  8000c6:	052000ef          	jal	ra,800118 <cprintf>
  8000ca:	a001                	j	8000ca <exit+0x14>

00000000008000cc <fork>:
  8000cc:	bfd1                	j	8000a0 <sys_fork>

00000000008000ce <wait>:
  8000ce:	4581                	li	a1,0
  8000d0:	4501                	li	a0,0
  8000d2:	bfc9                	j	8000a4 <sys_wait>

00000000008000d4 <waitpid>:
  8000d4:	bfc1                	j	8000a4 <sys_wait>

00000000008000d6 <yield>:
  8000d6:	bfd9                	j	8000ac <sys_yield>

00000000008000d8 <_start>:
  8000d8:	076000ef          	jal	ra,80014e <umain>
  8000dc:	a001                	j	8000dc <_start+0x4>

00000000008000de <cputch>:
  8000de:	1141                	addi	sp,sp,-16
  8000e0:	e022                	sd	s0,0(sp)
  8000e2:	e406                	sd	ra,8(sp)
  8000e4:	842e                	mv	s0,a1
  8000e6:	fcbff0ef          	jal	ra,8000b0 <sys_putc>
  8000ea:	401c                	lw	a5,0(s0)
  8000ec:	60a2                	ld	ra,8(sp)
  8000ee:	2785                	addiw	a5,a5,1
  8000f0:	c01c                	sw	a5,0(s0)
  8000f2:	6402                	ld	s0,0(sp)
  8000f4:	0141                	addi	sp,sp,16
  8000f6:	8082                	ret

00000000008000f8 <vcprintf>:
  8000f8:	1101                	addi	sp,sp,-32
  8000fa:	862a                	mv	a2,a0
  8000fc:	86ae                	mv	a3,a1
  8000fe:	00000517          	auipc	a0,0x0
  800102:	fe050513          	addi	a0,a0,-32 # 8000de <cputch>
  800106:	006c                	addi	a1,sp,12
  800108:	ec06                	sd	ra,24(sp)
  80010a:	c602                	sw	zero,12(sp)
  80010c:	0d6000ef          	jal	ra,8001e2 <vprintfmt>
  800110:	60e2                	ld	ra,24(sp)
  800112:	4532                	lw	a0,12(sp)
  800114:	6105                	addi	sp,sp,32
  800116:	8082                	ret

0000000000800118 <cprintf>:
  800118:	711d                	addi	sp,sp,-96
  80011a:	02810313          	addi	t1,sp,40
  80011e:	8e2a                	mv	t3,a0
  800120:	f42e                	sd	a1,40(sp)
  800122:	f832                	sd	a2,48(sp)
  800124:	fc36                	sd	a3,56(sp)
  800126:	00000517          	auipc	a0,0x0
  80012a:	fb850513          	addi	a0,a0,-72 # 8000de <cputch>
  80012e:	004c                	addi	a1,sp,4
  800130:	869a                	mv	a3,t1
  800132:	8672                	mv	a2,t3
  800134:	ec06                	sd	ra,24(sp)
  800136:	e0ba                	sd	a4,64(sp)
  800138:	e4be                	sd	a5,72(sp)
  80013a:	e8c2                	sd	a6,80(sp)
  80013c:	ecc6                	sd	a7,88(sp)
  80013e:	e41a                	sd	t1,8(sp)
  800140:	c202                	sw	zero,4(sp)
  800142:	0a0000ef          	jal	ra,8001e2 <vprintfmt>
  800146:	60e2                	ld	ra,24(sp)
  800148:	4512                	lw	a0,4(sp)
  80014a:	6125                	addi	sp,sp,96
  80014c:	8082                	ret

000000000080014e <umain>:
  80014e:	1141                	addi	sp,sp,-16
  800150:	e406                	sd	ra,8(sp)
  800152:	412000ef          	jal	ra,800564 <main>
  800156:	f61ff0ef          	jal	ra,8000b6 <exit>

000000000080015a <strnlen>:
  80015a:	872a                	mv	a4,a0
  80015c:	4501                	li	a0,0
  80015e:	e589                	bnez	a1,800168 <strnlen+0xe>
  800160:	a811                	j	800174 <strnlen+0x1a>
  800162:	0505                	addi	a0,a0,1
  800164:	00a58763          	beq	a1,a0,800172 <strnlen+0x18>
  800168:	00a707b3          	add	a5,a4,a0
  80016c:	0007c783          	lbu	a5,0(a5)
  800170:	fbed                	bnez	a5,800162 <strnlen+0x8>
  800172:	8082                	ret
  800174:	8082                	ret

0000000000800176 <printnum>:
  800176:	02069813          	slli	a6,a3,0x20
  80017a:	7179                	addi	sp,sp,-48
  80017c:	02085813          	srli	a6,a6,0x20
  800180:	e052                	sd	s4,0(sp)
  800182:	03067a33          	remu	s4,a2,a6
  800186:	f022                	sd	s0,32(sp)
  800188:	ec26                	sd	s1,24(sp)
  80018a:	e84a                	sd	s2,16(sp)
  80018c:	f406                	sd	ra,40(sp)
  80018e:	e44e                	sd	s3,8(sp)
  800190:	84aa                	mv	s1,a0
  800192:	892e                	mv	s2,a1
  800194:	fff7041b          	addiw	s0,a4,-1
  800198:	2a01                	sext.w	s4,s4
  80019a:	03067e63          	bgeu	a2,a6,8001d6 <printnum+0x60>
  80019e:	89be                	mv	s3,a5
  8001a0:	00805763          	blez	s0,8001ae <printnum+0x38>
  8001a4:	347d                	addiw	s0,s0,-1
  8001a6:	85ca                	mv	a1,s2
  8001a8:	854e                	mv	a0,s3
  8001aa:	9482                	jalr	s1
  8001ac:	fc65                	bnez	s0,8001a4 <printnum+0x2e>
  8001ae:	1a02                	slli	s4,s4,0x20
  8001b0:	020a5a13          	srli	s4,s4,0x20
  8001b4:	00000797          	auipc	a5,0x0
  8001b8:	4fc78793          	addi	a5,a5,1276 # 8006b0 <main+0x14c>
  8001bc:	7402                	ld	s0,32(sp)
  8001be:	9a3e                	add	s4,s4,a5
  8001c0:	000a4503          	lbu	a0,0(s4)
  8001c4:	70a2                	ld	ra,40(sp)
  8001c6:	69a2                	ld	s3,8(sp)
  8001c8:	6a02                	ld	s4,0(sp)
  8001ca:	85ca                	mv	a1,s2
  8001cc:	8326                	mv	t1,s1
  8001ce:	6942                	ld	s2,16(sp)
  8001d0:	64e2                	ld	s1,24(sp)
  8001d2:	6145                	addi	sp,sp,48
  8001d4:	8302                	jr	t1
  8001d6:	03065633          	divu	a2,a2,a6
  8001da:	8722                	mv	a4,s0
  8001dc:	f9bff0ef          	jal	ra,800176 <printnum>
  8001e0:	b7f9                	j	8001ae <printnum+0x38>

00000000008001e2 <vprintfmt>:
  8001e2:	7119                	addi	sp,sp,-128
  8001e4:	f4a6                	sd	s1,104(sp)
  8001e6:	f0ca                	sd	s2,96(sp)
  8001e8:	ecce                	sd	s3,88(sp)
  8001ea:	e8d2                	sd	s4,80(sp)
  8001ec:	e4d6                	sd	s5,72(sp)
  8001ee:	e0da                	sd	s6,64(sp)
  8001f0:	fc5e                	sd	s7,56(sp)
  8001f2:	f06a                	sd	s10,32(sp)
  8001f4:	fc86                	sd	ra,120(sp)
  8001f6:	f8a2                	sd	s0,112(sp)
  8001f8:	f862                	sd	s8,48(sp)
  8001fa:	f466                	sd	s9,40(sp)
  8001fc:	ec6e                	sd	s11,24(sp)
  8001fe:	892a                	mv	s2,a0
  800200:	84ae                	mv	s1,a1
  800202:	8d32                	mv	s10,a2
  800204:	8a36                	mv	s4,a3
  800206:	02500993          	li	s3,37
  80020a:	5b7d                	li	s6,-1
  80020c:	00000a97          	auipc	s5,0x0
  800210:	4d8a8a93          	addi	s5,s5,1240 # 8006e4 <main+0x180>
  800214:	00000b97          	auipc	s7,0x0
  800218:	6ecb8b93          	addi	s7,s7,1772 # 800900 <error_string>
  80021c:	000d4503          	lbu	a0,0(s10)
  800220:	001d0413          	addi	s0,s10,1
  800224:	01350a63          	beq	a0,s3,800238 <vprintfmt+0x56>
  800228:	c121                	beqz	a0,800268 <vprintfmt+0x86>
  80022a:	85a6                	mv	a1,s1
  80022c:	0405                	addi	s0,s0,1
  80022e:	9902                	jalr	s2
  800230:	fff44503          	lbu	a0,-1(s0)
  800234:	ff351ae3          	bne	a0,s3,800228 <vprintfmt+0x46>
  800238:	00044603          	lbu	a2,0(s0)
  80023c:	02000793          	li	a5,32
  800240:	4c81                	li	s9,0
  800242:	4881                	li	a7,0
  800244:	5c7d                	li	s8,-1
  800246:	5dfd                	li	s11,-1
  800248:	05500513          	li	a0,85
  80024c:	4825                	li	a6,9
  80024e:	fdd6059b          	addiw	a1,a2,-35
  800252:	0ff5f593          	andi	a1,a1,255
  800256:	00140d13          	addi	s10,s0,1
  80025a:	04b56263          	bltu	a0,a1,80029e <vprintfmt+0xbc>
  80025e:	058a                	slli	a1,a1,0x2
  800260:	95d6                	add	a1,a1,s5
  800262:	4194                	lw	a3,0(a1)
  800264:	96d6                	add	a3,a3,s5
  800266:	8682                	jr	a3
  800268:	70e6                	ld	ra,120(sp)
  80026a:	7446                	ld	s0,112(sp)
  80026c:	74a6                	ld	s1,104(sp)
  80026e:	7906                	ld	s2,96(sp)
  800270:	69e6                	ld	s3,88(sp)
  800272:	6a46                	ld	s4,80(sp)
  800274:	6aa6                	ld	s5,72(sp)
  800276:	6b06                	ld	s6,64(sp)
  800278:	7be2                	ld	s7,56(sp)
  80027a:	7c42                	ld	s8,48(sp)
  80027c:	7ca2                	ld	s9,40(sp)
  80027e:	7d02                	ld	s10,32(sp)
  800280:	6de2                	ld	s11,24(sp)
  800282:	6109                	addi	sp,sp,128
  800284:	8082                	ret
  800286:	87b2                	mv	a5,a2
  800288:	00144603          	lbu	a2,1(s0)
  80028c:	846a                	mv	s0,s10
  80028e:	00140d13          	addi	s10,s0,1
  800292:	fdd6059b          	addiw	a1,a2,-35
  800296:	0ff5f593          	andi	a1,a1,255
  80029a:	fcb572e3          	bgeu	a0,a1,80025e <vprintfmt+0x7c>
  80029e:	85a6                	mv	a1,s1
  8002a0:	02500513          	li	a0,37
  8002a4:	9902                	jalr	s2
  8002a6:	fff44783          	lbu	a5,-1(s0)
  8002aa:	8d22                	mv	s10,s0
  8002ac:	f73788e3          	beq	a5,s3,80021c <vprintfmt+0x3a>
  8002b0:	ffed4783          	lbu	a5,-2(s10)
  8002b4:	1d7d                	addi	s10,s10,-1
  8002b6:	ff379de3          	bne	a5,s3,8002b0 <vprintfmt+0xce>
  8002ba:	b78d                	j	80021c <vprintfmt+0x3a>
  8002bc:	fd060c1b          	addiw	s8,a2,-48
  8002c0:	00144603          	lbu	a2,1(s0)
  8002c4:	846a                	mv	s0,s10
  8002c6:	fd06069b          	addiw	a3,a2,-48
  8002ca:	0006059b          	sext.w	a1,a2
  8002ce:	02d86463          	bltu	a6,a3,8002f6 <vprintfmt+0x114>
  8002d2:	00144603          	lbu	a2,1(s0)
  8002d6:	002c169b          	slliw	a3,s8,0x2
  8002da:	0186873b          	addw	a4,a3,s8
  8002de:	0017171b          	slliw	a4,a4,0x1
  8002e2:	9f2d                	addw	a4,a4,a1
  8002e4:	fd06069b          	addiw	a3,a2,-48
  8002e8:	0405                	addi	s0,s0,1
  8002ea:	fd070c1b          	addiw	s8,a4,-48
  8002ee:	0006059b          	sext.w	a1,a2
  8002f2:	fed870e3          	bgeu	a6,a3,8002d2 <vprintfmt+0xf0>
  8002f6:	f40ddce3          	bgez	s11,80024e <vprintfmt+0x6c>
  8002fa:	8de2                	mv	s11,s8
  8002fc:	5c7d                	li	s8,-1
  8002fe:	bf81                	j	80024e <vprintfmt+0x6c>
  800300:	fffdc693          	not	a3,s11
  800304:	96fd                	srai	a3,a3,0x3f
  800306:	00ddfdb3          	and	s11,s11,a3
  80030a:	00144603          	lbu	a2,1(s0)
  80030e:	2d81                	sext.w	s11,s11
  800310:	846a                	mv	s0,s10
  800312:	bf35                	j	80024e <vprintfmt+0x6c>
  800314:	000a2c03          	lw	s8,0(s4)
  800318:	00144603          	lbu	a2,1(s0)
  80031c:	0a21                	addi	s4,s4,8
  80031e:	846a                	mv	s0,s10
  800320:	bfd9                	j	8002f6 <vprintfmt+0x114>
  800322:	4705                	li	a4,1
  800324:	008a0593          	addi	a1,s4,8
  800328:	01174463          	blt	a4,a7,800330 <vprintfmt+0x14e>
  80032c:	1a088e63          	beqz	a7,8004e8 <vprintfmt+0x306>
  800330:	000a3603          	ld	a2,0(s4)
  800334:	46c1                	li	a3,16
  800336:	8a2e                	mv	s4,a1
  800338:	2781                	sext.w	a5,a5
  80033a:	876e                	mv	a4,s11
  80033c:	85a6                	mv	a1,s1
  80033e:	854a                	mv	a0,s2
  800340:	e37ff0ef          	jal	ra,800176 <printnum>
  800344:	bde1                	j	80021c <vprintfmt+0x3a>
  800346:	000a2503          	lw	a0,0(s4)
  80034a:	85a6                	mv	a1,s1
  80034c:	0a21                	addi	s4,s4,8
  80034e:	9902                	jalr	s2
  800350:	b5f1                	j	80021c <vprintfmt+0x3a>
  800352:	4705                	li	a4,1
  800354:	008a0593          	addi	a1,s4,8
  800358:	01174463          	blt	a4,a7,800360 <vprintfmt+0x17e>
  80035c:	18088163          	beqz	a7,8004de <vprintfmt+0x2fc>
  800360:	000a3603          	ld	a2,0(s4)
  800364:	46a9                	li	a3,10
  800366:	8a2e                	mv	s4,a1
  800368:	bfc1                	j	800338 <vprintfmt+0x156>
  80036a:	00144603          	lbu	a2,1(s0)
  80036e:	4c85                	li	s9,1
  800370:	846a                	mv	s0,s10
  800372:	bdf1                	j	80024e <vprintfmt+0x6c>
  800374:	85a6                	mv	a1,s1
  800376:	02500513          	li	a0,37
  80037a:	9902                	jalr	s2
  80037c:	b545                	j	80021c <vprintfmt+0x3a>
  80037e:	00144603          	lbu	a2,1(s0)
  800382:	2885                	addiw	a7,a7,1
  800384:	846a                	mv	s0,s10
  800386:	b5e1                	j	80024e <vprintfmt+0x6c>
  800388:	4705                	li	a4,1
  80038a:	008a0593          	addi	a1,s4,8
  80038e:	01174463          	blt	a4,a7,800396 <vprintfmt+0x1b4>
  800392:	14088163          	beqz	a7,8004d4 <vprintfmt+0x2f2>
  800396:	000a3603          	ld	a2,0(s4)
  80039a:	46a1                	li	a3,8
  80039c:	8a2e                	mv	s4,a1
  80039e:	bf69                	j	800338 <vprintfmt+0x156>
  8003a0:	03000513          	li	a0,48
  8003a4:	85a6                	mv	a1,s1
  8003a6:	e03e                	sd	a5,0(sp)
  8003a8:	9902                	jalr	s2
  8003aa:	85a6                	mv	a1,s1
  8003ac:	07800513          	li	a0,120
  8003b0:	9902                	jalr	s2
  8003b2:	0a21                	addi	s4,s4,8
  8003b4:	6782                	ld	a5,0(sp)
  8003b6:	46c1                	li	a3,16
  8003b8:	ff8a3603          	ld	a2,-8(s4)
  8003bc:	bfb5                	j	800338 <vprintfmt+0x156>
  8003be:	000a3403          	ld	s0,0(s4)
  8003c2:	008a0713          	addi	a4,s4,8
  8003c6:	e03a                	sd	a4,0(sp)
  8003c8:	14040263          	beqz	s0,80050c <vprintfmt+0x32a>
  8003cc:	0fb05763          	blez	s11,8004ba <vprintfmt+0x2d8>
  8003d0:	02d00693          	li	a3,45
  8003d4:	0cd79163          	bne	a5,a3,800496 <vprintfmt+0x2b4>
  8003d8:	00044783          	lbu	a5,0(s0)
  8003dc:	0007851b          	sext.w	a0,a5
  8003e0:	cf85                	beqz	a5,800418 <vprintfmt+0x236>
  8003e2:	00140a13          	addi	s4,s0,1
  8003e6:	05e00413          	li	s0,94
  8003ea:	000c4563          	bltz	s8,8003f4 <vprintfmt+0x212>
  8003ee:	3c7d                	addiw	s8,s8,-1
  8003f0:	036c0263          	beq	s8,s6,800414 <vprintfmt+0x232>
  8003f4:	85a6                	mv	a1,s1
  8003f6:	0e0c8e63          	beqz	s9,8004f2 <vprintfmt+0x310>
  8003fa:	3781                	addiw	a5,a5,-32
  8003fc:	0ef47b63          	bgeu	s0,a5,8004f2 <vprintfmt+0x310>
  800400:	03f00513          	li	a0,63
  800404:	9902                	jalr	s2
  800406:	000a4783          	lbu	a5,0(s4)
  80040a:	3dfd                	addiw	s11,s11,-1
  80040c:	0a05                	addi	s4,s4,1
  80040e:	0007851b          	sext.w	a0,a5
  800412:	ffe1                	bnez	a5,8003ea <vprintfmt+0x208>
  800414:	01b05963          	blez	s11,800426 <vprintfmt+0x244>
  800418:	3dfd                	addiw	s11,s11,-1
  80041a:	85a6                	mv	a1,s1
  80041c:	02000513          	li	a0,32
  800420:	9902                	jalr	s2
  800422:	fe0d9be3          	bnez	s11,800418 <vprintfmt+0x236>
  800426:	6a02                	ld	s4,0(sp)
  800428:	bbd5                	j	80021c <vprintfmt+0x3a>
  80042a:	4705                	li	a4,1
  80042c:	008a0c93          	addi	s9,s4,8
  800430:	01174463          	blt	a4,a7,800438 <vprintfmt+0x256>
  800434:	08088d63          	beqz	a7,8004ce <vprintfmt+0x2ec>
  800438:	000a3403          	ld	s0,0(s4)
  80043c:	0a044d63          	bltz	s0,8004f6 <vprintfmt+0x314>
  800440:	8622                	mv	a2,s0
  800442:	8a66                	mv	s4,s9
  800444:	46a9                	li	a3,10
  800446:	bdcd                	j	800338 <vprintfmt+0x156>
  800448:	000a2783          	lw	a5,0(s4)
  80044c:	4761                	li	a4,24
  80044e:	0a21                	addi	s4,s4,8
  800450:	41f7d69b          	sraiw	a3,a5,0x1f
  800454:	8fb5                	xor	a5,a5,a3
  800456:	40d786bb          	subw	a3,a5,a3
  80045a:	02d74163          	blt	a4,a3,80047c <vprintfmt+0x29a>
  80045e:	00369793          	slli	a5,a3,0x3
  800462:	97de                	add	a5,a5,s7
  800464:	639c                	ld	a5,0(a5)
  800466:	cb99                	beqz	a5,80047c <vprintfmt+0x29a>
  800468:	86be                	mv	a3,a5
  80046a:	00000617          	auipc	a2,0x0
  80046e:	27660613          	addi	a2,a2,630 # 8006e0 <main+0x17c>
  800472:	85a6                	mv	a1,s1
  800474:	854a                	mv	a0,s2
  800476:	0ce000ef          	jal	ra,800544 <printfmt>
  80047a:	b34d                	j	80021c <vprintfmt+0x3a>
  80047c:	00000617          	auipc	a2,0x0
  800480:	25460613          	addi	a2,a2,596 # 8006d0 <main+0x16c>
  800484:	85a6                	mv	a1,s1
  800486:	854a                	mv	a0,s2
  800488:	0bc000ef          	jal	ra,800544 <printfmt>
  80048c:	bb41                	j	80021c <vprintfmt+0x3a>
  80048e:	00000417          	auipc	s0,0x0
  800492:	23a40413          	addi	s0,s0,570 # 8006c8 <main+0x164>
  800496:	85e2                	mv	a1,s8
  800498:	8522                	mv	a0,s0
  80049a:	e43e                	sd	a5,8(sp)
  80049c:	cbfff0ef          	jal	ra,80015a <strnlen>
  8004a0:	40ad8dbb          	subw	s11,s11,a0
  8004a4:	01b05b63          	blez	s11,8004ba <vprintfmt+0x2d8>
  8004a8:	67a2                	ld	a5,8(sp)
  8004aa:	00078a1b          	sext.w	s4,a5
  8004ae:	3dfd                	addiw	s11,s11,-1
  8004b0:	85a6                	mv	a1,s1
  8004b2:	8552                	mv	a0,s4
  8004b4:	9902                	jalr	s2
  8004b6:	fe0d9ce3          	bnez	s11,8004ae <vprintfmt+0x2cc>
  8004ba:	00044783          	lbu	a5,0(s0)
  8004be:	00140a13          	addi	s4,s0,1
  8004c2:	0007851b          	sext.w	a0,a5
  8004c6:	d3a5                	beqz	a5,800426 <vprintfmt+0x244>
  8004c8:	05e00413          	li	s0,94
  8004cc:	bf39                	j	8003ea <vprintfmt+0x208>
  8004ce:	000a2403          	lw	s0,0(s4)
  8004d2:	b7ad                	j	80043c <vprintfmt+0x25a>
  8004d4:	000a6603          	lwu	a2,0(s4)
  8004d8:	46a1                	li	a3,8
  8004da:	8a2e                	mv	s4,a1
  8004dc:	bdb1                	j	800338 <vprintfmt+0x156>
  8004de:	000a6603          	lwu	a2,0(s4)
  8004e2:	46a9                	li	a3,10
  8004e4:	8a2e                	mv	s4,a1
  8004e6:	bd89                	j	800338 <vprintfmt+0x156>
  8004e8:	000a6603          	lwu	a2,0(s4)
  8004ec:	46c1                	li	a3,16
  8004ee:	8a2e                	mv	s4,a1
  8004f0:	b5a1                	j	800338 <vprintfmt+0x156>
  8004f2:	9902                	jalr	s2
  8004f4:	bf09                	j	800406 <vprintfmt+0x224>
  8004f6:	85a6                	mv	a1,s1
  8004f8:	02d00513          	li	a0,45
  8004fc:	e03e                	sd	a5,0(sp)
  8004fe:	9902                	jalr	s2
  800500:	6782                	ld	a5,0(sp)
  800502:	8a66                	mv	s4,s9
  800504:	40800633          	neg	a2,s0
  800508:	46a9                	li	a3,10
  80050a:	b53d                	j	800338 <vprintfmt+0x156>
  80050c:	03b05163          	blez	s11,80052e <vprintfmt+0x34c>
  800510:	02d00693          	li	a3,45
  800514:	f6d79de3          	bne	a5,a3,80048e <vprintfmt+0x2ac>
  800518:	00000417          	auipc	s0,0x0
  80051c:	1b040413          	addi	s0,s0,432 # 8006c8 <main+0x164>
  800520:	02800793          	li	a5,40
  800524:	02800513          	li	a0,40
  800528:	00140a13          	addi	s4,s0,1
  80052c:	bd6d                	j	8003e6 <vprintfmt+0x204>
  80052e:	00000a17          	auipc	s4,0x0
  800532:	19ba0a13          	addi	s4,s4,411 # 8006c9 <main+0x165>
  800536:	02800513          	li	a0,40
  80053a:	02800793          	li	a5,40
  80053e:	05e00413          	li	s0,94
  800542:	b565                	j	8003ea <vprintfmt+0x208>

0000000000800544 <printfmt>:
  800544:	715d                	addi	sp,sp,-80
  800546:	02810313          	addi	t1,sp,40
  80054a:	f436                	sd	a3,40(sp)
  80054c:	869a                	mv	a3,t1
  80054e:	ec06                	sd	ra,24(sp)
  800550:	f83a                	sd	a4,48(sp)
  800552:	fc3e                	sd	a5,56(sp)
  800554:	e0c2                	sd	a6,64(sp)
  800556:	e4c6                	sd	a7,72(sp)
  800558:	e41a                	sd	t1,8(sp)
  80055a:	c89ff0ef          	jal	ra,8001e2 <vprintfmt>
  80055e:	60e2                	ld	ra,24(sp)
  800560:	6161                	addi	sp,sp,80
  800562:	8082                	ret

0000000000800564 <main>:
  800564:	1101                	addi	sp,sp,-32
  800566:	00000517          	auipc	a0,0x0
  80056a:	46250513          	addi	a0,a0,1122 # 8009c8 <error_string+0xc8>
  80056e:	ec06                	sd	ra,24(sp)
  800570:	e822                	sd	s0,16(sp)
  800572:	ba7ff0ef          	jal	ra,800118 <cprintf>
  800576:	b57ff0ef          	jal	ra,8000cc <fork>
  80057a:	c561                	beqz	a0,800642 <main+0xde>
  80057c:	842a                	mv	s0,a0
  80057e:	85aa                	mv	a1,a0
  800580:	00000517          	auipc	a0,0x0
  800584:	48850513          	addi	a0,a0,1160 # 800a08 <error_string+0x108>
  800588:	b91ff0ef          	jal	ra,800118 <cprintf>
  80058c:	08805c63          	blez	s0,800624 <main+0xc0>
  800590:	00000517          	auipc	a0,0x0
  800594:	4d050513          	addi	a0,a0,1232 # 800a60 <error_string+0x160>
  800598:	b81ff0ef          	jal	ra,800118 <cprintf>
  80059c:	006c                	addi	a1,sp,12
  80059e:	8522                	mv	a0,s0
  8005a0:	b35ff0ef          	jal	ra,8000d4 <waitpid>
  8005a4:	e131                	bnez	a0,8005e8 <main+0x84>
  8005a6:	4732                	lw	a4,12(sp)
  8005a8:	00001797          	auipc	a5,0x1
  8005ac:	a587a783          	lw	a5,-1448(a5) # 801000 <magic>
  8005b0:	02f71c63          	bne	a4,a5,8005e8 <main+0x84>
  8005b4:	006c                	addi	a1,sp,12
  8005b6:	8522                	mv	a0,s0
  8005b8:	b1dff0ef          	jal	ra,8000d4 <waitpid>
  8005bc:	c529                	beqz	a0,800606 <main+0xa2>
  8005be:	b11ff0ef          	jal	ra,8000ce <wait>
  8005c2:	c131                	beqz	a0,800606 <main+0xa2>
  8005c4:	85a2                	mv	a1,s0
  8005c6:	00000517          	auipc	a0,0x0
  8005ca:	51250513          	addi	a0,a0,1298 # 800ad8 <error_string+0x1d8>
  8005ce:	b4bff0ef          	jal	ra,800118 <cprintf>
  8005d2:	00000517          	auipc	a0,0x0
  8005d6:	51650513          	addi	a0,a0,1302 # 800ae8 <error_string+0x1e8>
  8005da:	b3fff0ef          	jal	ra,800118 <cprintf>
  8005de:	60e2                	ld	ra,24(sp)
  8005e0:	6442                	ld	s0,16(sp)
  8005e2:	4501                	li	a0,0
  8005e4:	6105                	addi	sp,sp,32
  8005e6:	8082                	ret
  8005e8:	00000697          	auipc	a3,0x0
  8005ec:	49868693          	addi	a3,a3,1176 # 800a80 <error_string+0x180>
  8005f0:	00000617          	auipc	a2,0x0
  8005f4:	44860613          	addi	a2,a2,1096 # 800a38 <error_string+0x138>
  8005f8:	45ed                	li	a1,27
  8005fa:	00000517          	auipc	a0,0x0
  8005fe:	45650513          	addi	a0,a0,1110 # 800a50 <error_string+0x150>
  800602:	a1fff0ef          	jal	ra,800020 <__panic>
  800606:	00000697          	auipc	a3,0x0
  80060a:	4aa68693          	addi	a3,a3,1194 # 800ab0 <error_string+0x1b0>
  80060e:	00000617          	auipc	a2,0x0
  800612:	42a60613          	addi	a2,a2,1066 # 800a38 <error_string+0x138>
  800616:	45f1                	li	a1,28
  800618:	00000517          	auipc	a0,0x0
  80061c:	43850513          	addi	a0,a0,1080 # 800a50 <error_string+0x150>
  800620:	a01ff0ef          	jal	ra,800020 <__panic>
  800624:	00000697          	auipc	a3,0x0
  800628:	40c68693          	addi	a3,a3,1036 # 800a30 <error_string+0x130>
  80062c:	00000617          	auipc	a2,0x0
  800630:	40c60613          	addi	a2,a2,1036 # 800a38 <error_string+0x138>
  800634:	45e1                	li	a1,24
  800636:	00000517          	auipc	a0,0x0
  80063a:	41a50513          	addi	a0,a0,1050 # 800a50 <error_string+0x150>
  80063e:	9e3ff0ef          	jal	ra,800020 <__panic>
  800642:	00000517          	auipc	a0,0x0
  800646:	3ae50513          	addi	a0,a0,942 # 8009f0 <error_string+0xf0>
  80064a:	acfff0ef          	jal	ra,800118 <cprintf>
  80064e:	a89ff0ef          	jal	ra,8000d6 <yield>
  800652:	a85ff0ef          	jal	ra,8000d6 <yield>
  800656:	a81ff0ef          	jal	ra,8000d6 <yield>
  80065a:	a7dff0ef          	jal	ra,8000d6 <yield>
  80065e:	a79ff0ef          	jal	ra,8000d6 <yield>
  800662:	a75ff0ef          	jal	ra,8000d6 <yield>
  800666:	a71ff0ef          	jal	ra,8000d6 <yield>
  80066a:	00001517          	auipc	a0,0x1
  80066e:	99652503          	lw	a0,-1642(a0) # 801000 <magic>
  800672:	a45ff0ef          	jal	ra,8000b6 <exit>
