
obj/__user_faultreadkernel.out:     file format elf64-littleriscv


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
  800034:	54850513          	addi	a0,a0,1352 # 800578 <main+0x30>
  800038:	ec06                	sd	ra,24(sp)
  80003a:	f436                	sd	a3,40(sp)
  80003c:	f83a                	sd	a4,48(sp)
  80003e:	e0c2                	sd	a6,64(sp)
  800040:	e4c6                	sd	a7,72(sp)
  800042:	e43e                	sd	a5,8(sp)
  800044:	0b8000ef          	jal	ra,8000fc <cprintf>
  800048:	65a2                	ld	a1,8(sp)
  80004a:	8522                	mv	a0,s0
  80004c:	090000ef          	jal	ra,8000dc <vcprintf>
  800050:	00000517          	auipc	a0,0x0
  800054:	54850513          	addi	a0,a0,1352 # 800598 <main+0x50>
  800058:	0a4000ef          	jal	ra,8000fc <cprintf>
  80005c:	5559                	li	a0,-10
  80005e:	048000ef          	jal	ra,8000a6 <exit>

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

00000000008000a0 <sys_putc>:
  8000a0:	85aa                	mv	a1,a0
  8000a2:	4579                	li	a0,30
  8000a4:	bf7d                	j	800062 <syscall>

00000000008000a6 <exit>:
  8000a6:	1141                	addi	sp,sp,-16
  8000a8:	e406                	sd	ra,8(sp)
  8000aa:	ff1ff0ef          	jal	ra,80009a <sys_exit>
  8000ae:	00000517          	auipc	a0,0x0
  8000b2:	4f250513          	addi	a0,a0,1266 # 8005a0 <main+0x58>
  8000b6:	046000ef          	jal	ra,8000fc <cprintf>
  8000ba:	a001                	j	8000ba <exit+0x14>

00000000008000bc <_start>:
  8000bc:	076000ef          	jal	ra,800132 <umain>
  8000c0:	a001                	j	8000c0 <_start+0x4>

00000000008000c2 <cputch>:
  8000c2:	1141                	addi	sp,sp,-16
  8000c4:	e022                	sd	s0,0(sp)
  8000c6:	e406                	sd	ra,8(sp)
  8000c8:	842e                	mv	s0,a1
  8000ca:	fd7ff0ef          	jal	ra,8000a0 <sys_putc>
  8000ce:	401c                	lw	a5,0(s0)
  8000d0:	60a2                	ld	ra,8(sp)
  8000d2:	2785                	addiw	a5,a5,1
  8000d4:	c01c                	sw	a5,0(s0)
  8000d6:	6402                	ld	s0,0(sp)
  8000d8:	0141                	addi	sp,sp,16
  8000da:	8082                	ret

00000000008000dc <vcprintf>:
  8000dc:	1101                	addi	sp,sp,-32
  8000de:	862a                	mv	a2,a0
  8000e0:	86ae                	mv	a3,a1
  8000e2:	00000517          	auipc	a0,0x0
  8000e6:	fe050513          	addi	a0,a0,-32 # 8000c2 <cputch>
  8000ea:	006c                	addi	a1,sp,12
  8000ec:	ec06                	sd	ra,24(sp)
  8000ee:	c602                	sw	zero,12(sp)
  8000f0:	0d6000ef          	jal	ra,8001c6 <vprintfmt>
  8000f4:	60e2                	ld	ra,24(sp)
  8000f6:	4532                	lw	a0,12(sp)
  8000f8:	6105                	addi	sp,sp,32
  8000fa:	8082                	ret

00000000008000fc <cprintf>:
  8000fc:	711d                	addi	sp,sp,-96
  8000fe:	02810313          	addi	t1,sp,40
  800102:	8e2a                	mv	t3,a0
  800104:	f42e                	sd	a1,40(sp)
  800106:	f832                	sd	a2,48(sp)
  800108:	fc36                	sd	a3,56(sp)
  80010a:	00000517          	auipc	a0,0x0
  80010e:	fb850513          	addi	a0,a0,-72 # 8000c2 <cputch>
  800112:	004c                	addi	a1,sp,4
  800114:	869a                	mv	a3,t1
  800116:	8672                	mv	a2,t3
  800118:	ec06                	sd	ra,24(sp)
  80011a:	e0ba                	sd	a4,64(sp)
  80011c:	e4be                	sd	a5,72(sp)
  80011e:	e8c2                	sd	a6,80(sp)
  800120:	ecc6                	sd	a7,88(sp)
  800122:	e41a                	sd	t1,8(sp)
  800124:	c202                	sw	zero,4(sp)
  800126:	0a0000ef          	jal	ra,8001c6 <vprintfmt>
  80012a:	60e2                	ld	ra,24(sp)
  80012c:	4512                	lw	a0,4(sp)
  80012e:	6125                	addi	sp,sp,96
  800130:	8082                	ret

0000000000800132 <umain>:
  800132:	1141                	addi	sp,sp,-16
  800134:	e406                	sd	ra,8(sp)
  800136:	412000ef          	jal	ra,800548 <main>
  80013a:	f6dff0ef          	jal	ra,8000a6 <exit>

000000000080013e <strnlen>:
  80013e:	872a                	mv	a4,a0
  800140:	4501                	li	a0,0
  800142:	e589                	bnez	a1,80014c <strnlen+0xe>
  800144:	a811                	j	800158 <strnlen+0x1a>
  800146:	0505                	addi	a0,a0,1
  800148:	00a58763          	beq	a1,a0,800156 <strnlen+0x18>
  80014c:	00a707b3          	add	a5,a4,a0
  800150:	0007c783          	lbu	a5,0(a5)
  800154:	fbed                	bnez	a5,800146 <strnlen+0x8>
  800156:	8082                	ret
  800158:	8082                	ret

000000000080015a <printnum>:
  80015a:	02069813          	slli	a6,a3,0x20
  80015e:	7179                	addi	sp,sp,-48
  800160:	02085813          	srli	a6,a6,0x20
  800164:	e052                	sd	s4,0(sp)
  800166:	03067a33          	remu	s4,a2,a6
  80016a:	f022                	sd	s0,32(sp)
  80016c:	ec26                	sd	s1,24(sp)
  80016e:	e84a                	sd	s2,16(sp)
  800170:	f406                	sd	ra,40(sp)
  800172:	e44e                	sd	s3,8(sp)
  800174:	84aa                	mv	s1,a0
  800176:	892e                	mv	s2,a1
  800178:	fff7041b          	addiw	s0,a4,-1
  80017c:	2a01                	sext.w	s4,s4
  80017e:	03067e63          	bgeu	a2,a6,8001ba <printnum+0x60>
  800182:	89be                	mv	s3,a5
  800184:	00805763          	blez	s0,800192 <printnum+0x38>
  800188:	347d                	addiw	s0,s0,-1
  80018a:	85ca                	mv	a1,s2
  80018c:	854e                	mv	a0,s3
  80018e:	9482                	jalr	s1
  800190:	fc65                	bnez	s0,800188 <printnum+0x2e>
  800192:	1a02                	slli	s4,s4,0x20
  800194:	020a5a13          	srli	s4,s4,0x20
  800198:	00000797          	auipc	a5,0x0
  80019c:	42078793          	addi	a5,a5,1056 # 8005b8 <main+0x70>
  8001a0:	7402                	ld	s0,32(sp)
  8001a2:	9a3e                	add	s4,s4,a5
  8001a4:	000a4503          	lbu	a0,0(s4)
  8001a8:	70a2                	ld	ra,40(sp)
  8001aa:	69a2                	ld	s3,8(sp)
  8001ac:	6a02                	ld	s4,0(sp)
  8001ae:	85ca                	mv	a1,s2
  8001b0:	8326                	mv	t1,s1
  8001b2:	6942                	ld	s2,16(sp)
  8001b4:	64e2                	ld	s1,24(sp)
  8001b6:	6145                	addi	sp,sp,48
  8001b8:	8302                	jr	t1
  8001ba:	03065633          	divu	a2,a2,a6
  8001be:	8722                	mv	a4,s0
  8001c0:	f9bff0ef          	jal	ra,80015a <printnum>
  8001c4:	b7f9                	j	800192 <printnum+0x38>

00000000008001c6 <vprintfmt>:
  8001c6:	7119                	addi	sp,sp,-128
  8001c8:	f4a6                	sd	s1,104(sp)
  8001ca:	f0ca                	sd	s2,96(sp)
  8001cc:	ecce                	sd	s3,88(sp)
  8001ce:	e8d2                	sd	s4,80(sp)
  8001d0:	e4d6                	sd	s5,72(sp)
  8001d2:	e0da                	sd	s6,64(sp)
  8001d4:	fc5e                	sd	s7,56(sp)
  8001d6:	f06a                	sd	s10,32(sp)
  8001d8:	fc86                	sd	ra,120(sp)
  8001da:	f8a2                	sd	s0,112(sp)
  8001dc:	f862                	sd	s8,48(sp)
  8001de:	f466                	sd	s9,40(sp)
  8001e0:	ec6e                	sd	s11,24(sp)
  8001e2:	892a                	mv	s2,a0
  8001e4:	84ae                	mv	s1,a1
  8001e6:	8d32                	mv	s10,a2
  8001e8:	8a36                	mv	s4,a3
  8001ea:	02500993          	li	s3,37
  8001ee:	5b7d                	li	s6,-1
  8001f0:	00000a97          	auipc	s5,0x0
  8001f4:	3fca8a93          	addi	s5,s5,1020 # 8005ec <main+0xa4>
  8001f8:	00000b97          	auipc	s7,0x0
  8001fc:	610b8b93          	addi	s7,s7,1552 # 800808 <error_string>
  800200:	000d4503          	lbu	a0,0(s10)
  800204:	001d0413          	addi	s0,s10,1
  800208:	01350a63          	beq	a0,s3,80021c <vprintfmt+0x56>
  80020c:	c121                	beqz	a0,80024c <vprintfmt+0x86>
  80020e:	85a6                	mv	a1,s1
  800210:	0405                	addi	s0,s0,1
  800212:	9902                	jalr	s2
  800214:	fff44503          	lbu	a0,-1(s0)
  800218:	ff351ae3          	bne	a0,s3,80020c <vprintfmt+0x46>
  80021c:	00044603          	lbu	a2,0(s0)
  800220:	02000793          	li	a5,32
  800224:	4c81                	li	s9,0
  800226:	4881                	li	a7,0
  800228:	5c7d                	li	s8,-1
  80022a:	5dfd                	li	s11,-1
  80022c:	05500513          	li	a0,85
  800230:	4825                	li	a6,9
  800232:	fdd6059b          	addiw	a1,a2,-35
  800236:	0ff5f593          	andi	a1,a1,255
  80023a:	00140d13          	addi	s10,s0,1
  80023e:	04b56263          	bltu	a0,a1,800282 <vprintfmt+0xbc>
  800242:	058a                	slli	a1,a1,0x2
  800244:	95d6                	add	a1,a1,s5
  800246:	4194                	lw	a3,0(a1)
  800248:	96d6                	add	a3,a3,s5
  80024a:	8682                	jr	a3
  80024c:	70e6                	ld	ra,120(sp)
  80024e:	7446                	ld	s0,112(sp)
  800250:	74a6                	ld	s1,104(sp)
  800252:	7906                	ld	s2,96(sp)
  800254:	69e6                	ld	s3,88(sp)
  800256:	6a46                	ld	s4,80(sp)
  800258:	6aa6                	ld	s5,72(sp)
  80025a:	6b06                	ld	s6,64(sp)
  80025c:	7be2                	ld	s7,56(sp)
  80025e:	7c42                	ld	s8,48(sp)
  800260:	7ca2                	ld	s9,40(sp)
  800262:	7d02                	ld	s10,32(sp)
  800264:	6de2                	ld	s11,24(sp)
  800266:	6109                	addi	sp,sp,128
  800268:	8082                	ret
  80026a:	87b2                	mv	a5,a2
  80026c:	00144603          	lbu	a2,1(s0)
  800270:	846a                	mv	s0,s10
  800272:	00140d13          	addi	s10,s0,1
  800276:	fdd6059b          	addiw	a1,a2,-35
  80027a:	0ff5f593          	andi	a1,a1,255
  80027e:	fcb572e3          	bgeu	a0,a1,800242 <vprintfmt+0x7c>
  800282:	85a6                	mv	a1,s1
  800284:	02500513          	li	a0,37
  800288:	9902                	jalr	s2
  80028a:	fff44783          	lbu	a5,-1(s0)
  80028e:	8d22                	mv	s10,s0
  800290:	f73788e3          	beq	a5,s3,800200 <vprintfmt+0x3a>
  800294:	ffed4783          	lbu	a5,-2(s10)
  800298:	1d7d                	addi	s10,s10,-1
  80029a:	ff379de3          	bne	a5,s3,800294 <vprintfmt+0xce>
  80029e:	b78d                	j	800200 <vprintfmt+0x3a>
  8002a0:	fd060c1b          	addiw	s8,a2,-48
  8002a4:	00144603          	lbu	a2,1(s0)
  8002a8:	846a                	mv	s0,s10
  8002aa:	fd06069b          	addiw	a3,a2,-48
  8002ae:	0006059b          	sext.w	a1,a2
  8002b2:	02d86463          	bltu	a6,a3,8002da <vprintfmt+0x114>
  8002b6:	00144603          	lbu	a2,1(s0)
  8002ba:	002c169b          	slliw	a3,s8,0x2
  8002be:	0186873b          	addw	a4,a3,s8
  8002c2:	0017171b          	slliw	a4,a4,0x1
  8002c6:	9f2d                	addw	a4,a4,a1
  8002c8:	fd06069b          	addiw	a3,a2,-48
  8002cc:	0405                	addi	s0,s0,1
  8002ce:	fd070c1b          	addiw	s8,a4,-48
  8002d2:	0006059b          	sext.w	a1,a2
  8002d6:	fed870e3          	bgeu	a6,a3,8002b6 <vprintfmt+0xf0>
  8002da:	f40ddce3          	bgez	s11,800232 <vprintfmt+0x6c>
  8002de:	8de2                	mv	s11,s8
  8002e0:	5c7d                	li	s8,-1
  8002e2:	bf81                	j	800232 <vprintfmt+0x6c>
  8002e4:	fffdc693          	not	a3,s11
  8002e8:	96fd                	srai	a3,a3,0x3f
  8002ea:	00ddfdb3          	and	s11,s11,a3
  8002ee:	00144603          	lbu	a2,1(s0)
  8002f2:	2d81                	sext.w	s11,s11
  8002f4:	846a                	mv	s0,s10
  8002f6:	bf35                	j	800232 <vprintfmt+0x6c>
  8002f8:	000a2c03          	lw	s8,0(s4)
  8002fc:	00144603          	lbu	a2,1(s0)
  800300:	0a21                	addi	s4,s4,8
  800302:	846a                	mv	s0,s10
  800304:	bfd9                	j	8002da <vprintfmt+0x114>
  800306:	4705                	li	a4,1
  800308:	008a0593          	addi	a1,s4,8
  80030c:	01174463          	blt	a4,a7,800314 <vprintfmt+0x14e>
  800310:	1a088e63          	beqz	a7,8004cc <vprintfmt+0x306>
  800314:	000a3603          	ld	a2,0(s4)
  800318:	46c1                	li	a3,16
  80031a:	8a2e                	mv	s4,a1
  80031c:	2781                	sext.w	a5,a5
  80031e:	876e                	mv	a4,s11
  800320:	85a6                	mv	a1,s1
  800322:	854a                	mv	a0,s2
  800324:	e37ff0ef          	jal	ra,80015a <printnum>
  800328:	bde1                	j	800200 <vprintfmt+0x3a>
  80032a:	000a2503          	lw	a0,0(s4)
  80032e:	85a6                	mv	a1,s1
  800330:	0a21                	addi	s4,s4,8
  800332:	9902                	jalr	s2
  800334:	b5f1                	j	800200 <vprintfmt+0x3a>
  800336:	4705                	li	a4,1
  800338:	008a0593          	addi	a1,s4,8
  80033c:	01174463          	blt	a4,a7,800344 <vprintfmt+0x17e>
  800340:	18088163          	beqz	a7,8004c2 <vprintfmt+0x2fc>
  800344:	000a3603          	ld	a2,0(s4)
  800348:	46a9                	li	a3,10
  80034a:	8a2e                	mv	s4,a1
  80034c:	bfc1                	j	80031c <vprintfmt+0x156>
  80034e:	00144603          	lbu	a2,1(s0)
  800352:	4c85                	li	s9,1
  800354:	846a                	mv	s0,s10
  800356:	bdf1                	j	800232 <vprintfmt+0x6c>
  800358:	85a6                	mv	a1,s1
  80035a:	02500513          	li	a0,37
  80035e:	9902                	jalr	s2
  800360:	b545                	j	800200 <vprintfmt+0x3a>
  800362:	00144603          	lbu	a2,1(s0)
  800366:	2885                	addiw	a7,a7,1
  800368:	846a                	mv	s0,s10
  80036a:	b5e1                	j	800232 <vprintfmt+0x6c>
  80036c:	4705                	li	a4,1
  80036e:	008a0593          	addi	a1,s4,8
  800372:	01174463          	blt	a4,a7,80037a <vprintfmt+0x1b4>
  800376:	14088163          	beqz	a7,8004b8 <vprintfmt+0x2f2>
  80037a:	000a3603          	ld	a2,0(s4)
  80037e:	46a1                	li	a3,8
  800380:	8a2e                	mv	s4,a1
  800382:	bf69                	j	80031c <vprintfmt+0x156>
  800384:	03000513          	li	a0,48
  800388:	85a6                	mv	a1,s1
  80038a:	e03e                	sd	a5,0(sp)
  80038c:	9902                	jalr	s2
  80038e:	85a6                	mv	a1,s1
  800390:	07800513          	li	a0,120
  800394:	9902                	jalr	s2
  800396:	0a21                	addi	s4,s4,8
  800398:	6782                	ld	a5,0(sp)
  80039a:	46c1                	li	a3,16
  80039c:	ff8a3603          	ld	a2,-8(s4)
  8003a0:	bfb5                	j	80031c <vprintfmt+0x156>
  8003a2:	000a3403          	ld	s0,0(s4)
  8003a6:	008a0713          	addi	a4,s4,8
  8003aa:	e03a                	sd	a4,0(sp)
  8003ac:	14040263          	beqz	s0,8004f0 <vprintfmt+0x32a>
  8003b0:	0fb05763          	blez	s11,80049e <vprintfmt+0x2d8>
  8003b4:	02d00693          	li	a3,45
  8003b8:	0cd79163          	bne	a5,a3,80047a <vprintfmt+0x2b4>
  8003bc:	00044783          	lbu	a5,0(s0)
  8003c0:	0007851b          	sext.w	a0,a5
  8003c4:	cf85                	beqz	a5,8003fc <vprintfmt+0x236>
  8003c6:	00140a13          	addi	s4,s0,1
  8003ca:	05e00413          	li	s0,94
  8003ce:	000c4563          	bltz	s8,8003d8 <vprintfmt+0x212>
  8003d2:	3c7d                	addiw	s8,s8,-1
  8003d4:	036c0263          	beq	s8,s6,8003f8 <vprintfmt+0x232>
  8003d8:	85a6                	mv	a1,s1
  8003da:	0e0c8e63          	beqz	s9,8004d6 <vprintfmt+0x310>
  8003de:	3781                	addiw	a5,a5,-32
  8003e0:	0ef47b63          	bgeu	s0,a5,8004d6 <vprintfmt+0x310>
  8003e4:	03f00513          	li	a0,63
  8003e8:	9902                	jalr	s2
  8003ea:	000a4783          	lbu	a5,0(s4)
  8003ee:	3dfd                	addiw	s11,s11,-1
  8003f0:	0a05                	addi	s4,s4,1
  8003f2:	0007851b          	sext.w	a0,a5
  8003f6:	ffe1                	bnez	a5,8003ce <vprintfmt+0x208>
  8003f8:	01b05963          	blez	s11,80040a <vprintfmt+0x244>
  8003fc:	3dfd                	addiw	s11,s11,-1
  8003fe:	85a6                	mv	a1,s1
  800400:	02000513          	li	a0,32
  800404:	9902                	jalr	s2
  800406:	fe0d9be3          	bnez	s11,8003fc <vprintfmt+0x236>
  80040a:	6a02                	ld	s4,0(sp)
  80040c:	bbd5                	j	800200 <vprintfmt+0x3a>
  80040e:	4705                	li	a4,1
  800410:	008a0c93          	addi	s9,s4,8
  800414:	01174463          	blt	a4,a7,80041c <vprintfmt+0x256>
  800418:	08088d63          	beqz	a7,8004b2 <vprintfmt+0x2ec>
  80041c:	000a3403          	ld	s0,0(s4)
  800420:	0a044d63          	bltz	s0,8004da <vprintfmt+0x314>
  800424:	8622                	mv	a2,s0
  800426:	8a66                	mv	s4,s9
  800428:	46a9                	li	a3,10
  80042a:	bdcd                	j	80031c <vprintfmt+0x156>
  80042c:	000a2783          	lw	a5,0(s4)
  800430:	4761                	li	a4,24
  800432:	0a21                	addi	s4,s4,8
  800434:	41f7d69b          	sraiw	a3,a5,0x1f
  800438:	8fb5                	xor	a5,a5,a3
  80043a:	40d786bb          	subw	a3,a5,a3
  80043e:	02d74163          	blt	a4,a3,800460 <vprintfmt+0x29a>
  800442:	00369793          	slli	a5,a3,0x3
  800446:	97de                	add	a5,a5,s7
  800448:	639c                	ld	a5,0(a5)
  80044a:	cb99                	beqz	a5,800460 <vprintfmt+0x29a>
  80044c:	86be                	mv	a3,a5
  80044e:	00000617          	auipc	a2,0x0
  800452:	19a60613          	addi	a2,a2,410 # 8005e8 <main+0xa0>
  800456:	85a6                	mv	a1,s1
  800458:	854a                	mv	a0,s2
  80045a:	0ce000ef          	jal	ra,800528 <printfmt>
  80045e:	b34d                	j	800200 <vprintfmt+0x3a>
  800460:	00000617          	auipc	a2,0x0
  800464:	17860613          	addi	a2,a2,376 # 8005d8 <main+0x90>
  800468:	85a6                	mv	a1,s1
  80046a:	854a                	mv	a0,s2
  80046c:	0bc000ef          	jal	ra,800528 <printfmt>
  800470:	bb41                	j	800200 <vprintfmt+0x3a>
  800472:	00000417          	auipc	s0,0x0
  800476:	15e40413          	addi	s0,s0,350 # 8005d0 <main+0x88>
  80047a:	85e2                	mv	a1,s8
  80047c:	8522                	mv	a0,s0
  80047e:	e43e                	sd	a5,8(sp)
  800480:	cbfff0ef          	jal	ra,80013e <strnlen>
  800484:	40ad8dbb          	subw	s11,s11,a0
  800488:	01b05b63          	blez	s11,80049e <vprintfmt+0x2d8>
  80048c:	67a2                	ld	a5,8(sp)
  80048e:	00078a1b          	sext.w	s4,a5
  800492:	3dfd                	addiw	s11,s11,-1
  800494:	85a6                	mv	a1,s1
  800496:	8552                	mv	a0,s4
  800498:	9902                	jalr	s2
  80049a:	fe0d9ce3          	bnez	s11,800492 <vprintfmt+0x2cc>
  80049e:	00044783          	lbu	a5,0(s0)
  8004a2:	00140a13          	addi	s4,s0,1
  8004a6:	0007851b          	sext.w	a0,a5
  8004aa:	d3a5                	beqz	a5,80040a <vprintfmt+0x244>
  8004ac:	05e00413          	li	s0,94
  8004b0:	bf39                	j	8003ce <vprintfmt+0x208>
  8004b2:	000a2403          	lw	s0,0(s4)
  8004b6:	b7ad                	j	800420 <vprintfmt+0x25a>
  8004b8:	000a6603          	lwu	a2,0(s4)
  8004bc:	46a1                	li	a3,8
  8004be:	8a2e                	mv	s4,a1
  8004c0:	bdb1                	j	80031c <vprintfmt+0x156>
  8004c2:	000a6603          	lwu	a2,0(s4)
  8004c6:	46a9                	li	a3,10
  8004c8:	8a2e                	mv	s4,a1
  8004ca:	bd89                	j	80031c <vprintfmt+0x156>
  8004cc:	000a6603          	lwu	a2,0(s4)
  8004d0:	46c1                	li	a3,16
  8004d2:	8a2e                	mv	s4,a1
  8004d4:	b5a1                	j	80031c <vprintfmt+0x156>
  8004d6:	9902                	jalr	s2
  8004d8:	bf09                	j	8003ea <vprintfmt+0x224>
  8004da:	85a6                	mv	a1,s1
  8004dc:	02d00513          	li	a0,45
  8004e0:	e03e                	sd	a5,0(sp)
  8004e2:	9902                	jalr	s2
  8004e4:	6782                	ld	a5,0(sp)
  8004e6:	8a66                	mv	s4,s9
  8004e8:	40800633          	neg	a2,s0
  8004ec:	46a9                	li	a3,10
  8004ee:	b53d                	j	80031c <vprintfmt+0x156>
  8004f0:	03b05163          	blez	s11,800512 <vprintfmt+0x34c>
  8004f4:	02d00693          	li	a3,45
  8004f8:	f6d79de3          	bne	a5,a3,800472 <vprintfmt+0x2ac>
  8004fc:	00000417          	auipc	s0,0x0
  800500:	0d440413          	addi	s0,s0,212 # 8005d0 <main+0x88>
  800504:	02800793          	li	a5,40
  800508:	02800513          	li	a0,40
  80050c:	00140a13          	addi	s4,s0,1
  800510:	bd6d                	j	8003ca <vprintfmt+0x204>
  800512:	00000a17          	auipc	s4,0x0
  800516:	0bfa0a13          	addi	s4,s4,191 # 8005d1 <main+0x89>
  80051a:	02800513          	li	a0,40
  80051e:	02800793          	li	a5,40
  800522:	05e00413          	li	s0,94
  800526:	b565                	j	8003ce <vprintfmt+0x208>

0000000000800528 <printfmt>:
  800528:	715d                	addi	sp,sp,-80
  80052a:	02810313          	addi	t1,sp,40
  80052e:	f436                	sd	a3,40(sp)
  800530:	869a                	mv	a3,t1
  800532:	ec06                	sd	ra,24(sp)
  800534:	f83a                	sd	a4,48(sp)
  800536:	fc3e                	sd	a5,56(sp)
  800538:	e0c2                	sd	a6,64(sp)
  80053a:	e4c6                	sd	a7,72(sp)
  80053c:	e41a                	sd	t1,8(sp)
  80053e:	c89ff0ef          	jal	ra,8001c6 <vprintfmt>
  800542:	60e2                	ld	ra,24(sp)
  800544:	6161                	addi	sp,sp,80
  800546:	8082                	ret

0000000000800548 <main>:
  800548:	3eb00793          	li	a5,1003
  80054c:	07da                	slli	a5,a5,0x16
  80054e:	438c                	lw	a1,0(a5)
  800550:	1141                	addi	sp,sp,-16
  800552:	00000517          	auipc	a0,0x0
  800556:	37e50513          	addi	a0,a0,894 # 8008d0 <error_string+0xc8>
  80055a:	e406                	sd	ra,8(sp)
  80055c:	ba1ff0ef          	jal	ra,8000fc <cprintf>
  800560:	00000617          	auipc	a2,0x0
  800564:	39060613          	addi	a2,a2,912 # 8008f0 <error_string+0xe8>
  800568:	459d                	li	a1,7
  80056a:	00000517          	auipc	a0,0x0
  80056e:	39650513          	addi	a0,a0,918 # 800900 <error_string+0xf8>
  800572:	aafff0ef          	jal	ra,800020 <__panic>
