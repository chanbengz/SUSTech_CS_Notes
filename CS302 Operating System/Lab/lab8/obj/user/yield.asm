
obj/__user_yield.out:     file format elf64-littleriscv


Disassembly of section .text:

0000000000800020 <syscall>:
  800020:	7175                	addi	sp,sp,-144
  800022:	f8ba                	sd	a4,112(sp)
  800024:	e0ba                	sd	a4,64(sp)
  800026:	0118                	addi	a4,sp,128
  800028:	e42a                	sd	a0,8(sp)
  80002a:	ecae                	sd	a1,88(sp)
  80002c:	f0b2                	sd	a2,96(sp)
  80002e:	f4b6                	sd	a3,104(sp)
  800030:	fcbe                	sd	a5,120(sp)
  800032:	e142                	sd	a6,128(sp)
  800034:	e546                	sd	a7,136(sp)
  800036:	f42e                	sd	a1,40(sp)
  800038:	f832                	sd	a2,48(sp)
  80003a:	fc36                	sd	a3,56(sp)
  80003c:	f03a                	sd	a4,32(sp)
  80003e:	e4be                	sd	a5,72(sp)
  800040:	4522                	lw	a0,8(sp)
  800042:	55a2                	lw	a1,40(sp)
  800044:	5642                	lw	a2,48(sp)
  800046:	56e2                	lw	a3,56(sp)
  800048:	4706                	lw	a4,64(sp)
  80004a:	47a6                	lw	a5,72(sp)
  80004c:	00000073          	ecall
  800050:	ce2a                	sw	a0,28(sp)
  800052:	4572                	lw	a0,28(sp)
  800054:	6149                	addi	sp,sp,144
  800056:	8082                	ret

0000000000800058 <sys_exit>:
  800058:	85aa                	mv	a1,a0
  80005a:	4505                	li	a0,1
  80005c:	b7d1                	j	800020 <syscall>

000000000080005e <sys_yield>:
  80005e:	4529                	li	a0,10
  800060:	b7c1                	j	800020 <syscall>

0000000000800062 <sys_getpid>:
  800062:	4549                	li	a0,18
  800064:	bf75                	j	800020 <syscall>

0000000000800066 <sys_putc>:
  800066:	85aa                	mv	a1,a0
  800068:	4579                	li	a0,30
  80006a:	bf5d                	j	800020 <syscall>

000000000080006c <exit>:
  80006c:	1141                	addi	sp,sp,-16
  80006e:	e406                	sd	ra,8(sp)
  800070:	fe9ff0ef          	jal	ra,800058 <sys_exit>
  800074:	00000517          	auipc	a0,0x0
  800078:	4ec50513          	addi	a0,a0,1260 # 800560 <main+0x6e>
  80007c:	02a000ef          	jal	ra,8000a6 <cprintf>
  800080:	a001                	j	800080 <exit+0x14>

0000000000800082 <yield>:
  800082:	bff1                	j	80005e <sys_yield>

0000000000800084 <getpid>:
  800084:	bff9                	j	800062 <sys_getpid>

0000000000800086 <_start>:
  800086:	056000ef          	jal	ra,8000dc <umain>
  80008a:	a001                	j	80008a <_start+0x4>

000000000080008c <cputch>:
  80008c:	1141                	addi	sp,sp,-16
  80008e:	e022                	sd	s0,0(sp)
  800090:	e406                	sd	ra,8(sp)
  800092:	842e                	mv	s0,a1
  800094:	fd3ff0ef          	jal	ra,800066 <sys_putc>
  800098:	401c                	lw	a5,0(s0)
  80009a:	60a2                	ld	ra,8(sp)
  80009c:	2785                	addiw	a5,a5,1
  80009e:	c01c                	sw	a5,0(s0)
  8000a0:	6402                	ld	s0,0(sp)
  8000a2:	0141                	addi	sp,sp,16
  8000a4:	8082                	ret

00000000008000a6 <cprintf>:
  8000a6:	711d                	addi	sp,sp,-96
  8000a8:	02810313          	addi	t1,sp,40
  8000ac:	8e2a                	mv	t3,a0
  8000ae:	f42e                	sd	a1,40(sp)
  8000b0:	f832                	sd	a2,48(sp)
  8000b2:	fc36                	sd	a3,56(sp)
  8000b4:	00000517          	auipc	a0,0x0
  8000b8:	fd850513          	addi	a0,a0,-40 # 80008c <cputch>
  8000bc:	004c                	addi	a1,sp,4
  8000be:	869a                	mv	a3,t1
  8000c0:	8672                	mv	a2,t3
  8000c2:	ec06                	sd	ra,24(sp)
  8000c4:	e0ba                	sd	a4,64(sp)
  8000c6:	e4be                	sd	a5,72(sp)
  8000c8:	e8c2                	sd	a6,80(sp)
  8000ca:	ecc6                	sd	a7,88(sp)
  8000cc:	e41a                	sd	t1,8(sp)
  8000ce:	c202                	sw	zero,4(sp)
  8000d0:	0a0000ef          	jal	ra,800170 <vprintfmt>
  8000d4:	60e2                	ld	ra,24(sp)
  8000d6:	4512                	lw	a0,4(sp)
  8000d8:	6125                	addi	sp,sp,96
  8000da:	8082                	ret

00000000008000dc <umain>:
  8000dc:	1141                	addi	sp,sp,-16
  8000de:	e406                	sd	ra,8(sp)
  8000e0:	412000ef          	jal	ra,8004f2 <main>
  8000e4:	f89ff0ef          	jal	ra,80006c <exit>

00000000008000e8 <strnlen>:
  8000e8:	872a                	mv	a4,a0
  8000ea:	4501                	li	a0,0
  8000ec:	e589                	bnez	a1,8000f6 <strnlen+0xe>
  8000ee:	a811                	j	800102 <strnlen+0x1a>
  8000f0:	0505                	addi	a0,a0,1
  8000f2:	00a58763          	beq	a1,a0,800100 <strnlen+0x18>
  8000f6:	00a707b3          	add	a5,a4,a0
  8000fa:	0007c783          	lbu	a5,0(a5)
  8000fe:	fbed                	bnez	a5,8000f0 <strnlen+0x8>
  800100:	8082                	ret
  800102:	8082                	ret

0000000000800104 <printnum>:
  800104:	02069813          	slli	a6,a3,0x20
  800108:	7179                	addi	sp,sp,-48
  80010a:	02085813          	srli	a6,a6,0x20
  80010e:	e052                	sd	s4,0(sp)
  800110:	03067a33          	remu	s4,a2,a6
  800114:	f022                	sd	s0,32(sp)
  800116:	ec26                	sd	s1,24(sp)
  800118:	e84a                	sd	s2,16(sp)
  80011a:	f406                	sd	ra,40(sp)
  80011c:	e44e                	sd	s3,8(sp)
  80011e:	84aa                	mv	s1,a0
  800120:	892e                	mv	s2,a1
  800122:	fff7041b          	addiw	s0,a4,-1
  800126:	2a01                	sext.w	s4,s4
  800128:	03067e63          	bgeu	a2,a6,800164 <printnum+0x60>
  80012c:	89be                	mv	s3,a5
  80012e:	00805763          	blez	s0,80013c <printnum+0x38>
  800132:	347d                	addiw	s0,s0,-1
  800134:	85ca                	mv	a1,s2
  800136:	854e                	mv	a0,s3
  800138:	9482                	jalr	s1
  80013a:	fc65                	bnez	s0,800132 <printnum+0x2e>
  80013c:	1a02                	slli	s4,s4,0x20
  80013e:	020a5a13          	srli	s4,s4,0x20
  800142:	00000797          	auipc	a5,0x0
  800146:	43678793          	addi	a5,a5,1078 # 800578 <main+0x86>
  80014a:	7402                	ld	s0,32(sp)
  80014c:	9a3e                	add	s4,s4,a5
  80014e:	000a4503          	lbu	a0,0(s4)
  800152:	70a2                	ld	ra,40(sp)
  800154:	69a2                	ld	s3,8(sp)
  800156:	6a02                	ld	s4,0(sp)
  800158:	85ca                	mv	a1,s2
  80015a:	8326                	mv	t1,s1
  80015c:	6942                	ld	s2,16(sp)
  80015e:	64e2                	ld	s1,24(sp)
  800160:	6145                	addi	sp,sp,48
  800162:	8302                	jr	t1
  800164:	03065633          	divu	a2,a2,a6
  800168:	8722                	mv	a4,s0
  80016a:	f9bff0ef          	jal	ra,800104 <printnum>
  80016e:	b7f9                	j	80013c <printnum+0x38>

0000000000800170 <vprintfmt>:
  800170:	7119                	addi	sp,sp,-128
  800172:	f4a6                	sd	s1,104(sp)
  800174:	f0ca                	sd	s2,96(sp)
  800176:	ecce                	sd	s3,88(sp)
  800178:	e8d2                	sd	s4,80(sp)
  80017a:	e4d6                	sd	s5,72(sp)
  80017c:	e0da                	sd	s6,64(sp)
  80017e:	fc5e                	sd	s7,56(sp)
  800180:	f06a                	sd	s10,32(sp)
  800182:	fc86                	sd	ra,120(sp)
  800184:	f8a2                	sd	s0,112(sp)
  800186:	f862                	sd	s8,48(sp)
  800188:	f466                	sd	s9,40(sp)
  80018a:	ec6e                	sd	s11,24(sp)
  80018c:	892a                	mv	s2,a0
  80018e:	84ae                	mv	s1,a1
  800190:	8d32                	mv	s10,a2
  800192:	8a36                	mv	s4,a3
  800194:	02500993          	li	s3,37
  800198:	5b7d                	li	s6,-1
  80019a:	00000a97          	auipc	s5,0x0
  80019e:	412a8a93          	addi	s5,s5,1042 # 8005ac <main+0xba>
  8001a2:	00000b97          	auipc	s7,0x0
  8001a6:	626b8b93          	addi	s7,s7,1574 # 8007c8 <error_string>
  8001aa:	000d4503          	lbu	a0,0(s10)
  8001ae:	001d0413          	addi	s0,s10,1
  8001b2:	01350a63          	beq	a0,s3,8001c6 <vprintfmt+0x56>
  8001b6:	c121                	beqz	a0,8001f6 <vprintfmt+0x86>
  8001b8:	85a6                	mv	a1,s1
  8001ba:	0405                	addi	s0,s0,1
  8001bc:	9902                	jalr	s2
  8001be:	fff44503          	lbu	a0,-1(s0)
  8001c2:	ff351ae3          	bne	a0,s3,8001b6 <vprintfmt+0x46>
  8001c6:	00044603          	lbu	a2,0(s0)
  8001ca:	02000793          	li	a5,32
  8001ce:	4c81                	li	s9,0
  8001d0:	4881                	li	a7,0
  8001d2:	5c7d                	li	s8,-1
  8001d4:	5dfd                	li	s11,-1
  8001d6:	05500513          	li	a0,85
  8001da:	4825                	li	a6,9
  8001dc:	fdd6059b          	addiw	a1,a2,-35
  8001e0:	0ff5f593          	andi	a1,a1,255
  8001e4:	00140d13          	addi	s10,s0,1
  8001e8:	04b56263          	bltu	a0,a1,80022c <vprintfmt+0xbc>
  8001ec:	058a                	slli	a1,a1,0x2
  8001ee:	95d6                	add	a1,a1,s5
  8001f0:	4194                	lw	a3,0(a1)
  8001f2:	96d6                	add	a3,a3,s5
  8001f4:	8682                	jr	a3
  8001f6:	70e6                	ld	ra,120(sp)
  8001f8:	7446                	ld	s0,112(sp)
  8001fa:	74a6                	ld	s1,104(sp)
  8001fc:	7906                	ld	s2,96(sp)
  8001fe:	69e6                	ld	s3,88(sp)
  800200:	6a46                	ld	s4,80(sp)
  800202:	6aa6                	ld	s5,72(sp)
  800204:	6b06                	ld	s6,64(sp)
  800206:	7be2                	ld	s7,56(sp)
  800208:	7c42                	ld	s8,48(sp)
  80020a:	7ca2                	ld	s9,40(sp)
  80020c:	7d02                	ld	s10,32(sp)
  80020e:	6de2                	ld	s11,24(sp)
  800210:	6109                	addi	sp,sp,128
  800212:	8082                	ret
  800214:	87b2                	mv	a5,a2
  800216:	00144603          	lbu	a2,1(s0)
  80021a:	846a                	mv	s0,s10
  80021c:	00140d13          	addi	s10,s0,1
  800220:	fdd6059b          	addiw	a1,a2,-35
  800224:	0ff5f593          	andi	a1,a1,255
  800228:	fcb572e3          	bgeu	a0,a1,8001ec <vprintfmt+0x7c>
  80022c:	85a6                	mv	a1,s1
  80022e:	02500513          	li	a0,37
  800232:	9902                	jalr	s2
  800234:	fff44783          	lbu	a5,-1(s0)
  800238:	8d22                	mv	s10,s0
  80023a:	f73788e3          	beq	a5,s3,8001aa <vprintfmt+0x3a>
  80023e:	ffed4783          	lbu	a5,-2(s10)
  800242:	1d7d                	addi	s10,s10,-1
  800244:	ff379de3          	bne	a5,s3,80023e <vprintfmt+0xce>
  800248:	b78d                	j	8001aa <vprintfmt+0x3a>
  80024a:	fd060c1b          	addiw	s8,a2,-48
  80024e:	00144603          	lbu	a2,1(s0)
  800252:	846a                	mv	s0,s10
  800254:	fd06069b          	addiw	a3,a2,-48
  800258:	0006059b          	sext.w	a1,a2
  80025c:	02d86463          	bltu	a6,a3,800284 <vprintfmt+0x114>
  800260:	00144603          	lbu	a2,1(s0)
  800264:	002c169b          	slliw	a3,s8,0x2
  800268:	0186873b          	addw	a4,a3,s8
  80026c:	0017171b          	slliw	a4,a4,0x1
  800270:	9f2d                	addw	a4,a4,a1
  800272:	fd06069b          	addiw	a3,a2,-48
  800276:	0405                	addi	s0,s0,1
  800278:	fd070c1b          	addiw	s8,a4,-48
  80027c:	0006059b          	sext.w	a1,a2
  800280:	fed870e3          	bgeu	a6,a3,800260 <vprintfmt+0xf0>
  800284:	f40ddce3          	bgez	s11,8001dc <vprintfmt+0x6c>
  800288:	8de2                	mv	s11,s8
  80028a:	5c7d                	li	s8,-1
  80028c:	bf81                	j	8001dc <vprintfmt+0x6c>
  80028e:	fffdc693          	not	a3,s11
  800292:	96fd                	srai	a3,a3,0x3f
  800294:	00ddfdb3          	and	s11,s11,a3
  800298:	00144603          	lbu	a2,1(s0)
  80029c:	2d81                	sext.w	s11,s11
  80029e:	846a                	mv	s0,s10
  8002a0:	bf35                	j	8001dc <vprintfmt+0x6c>
  8002a2:	000a2c03          	lw	s8,0(s4)
  8002a6:	00144603          	lbu	a2,1(s0)
  8002aa:	0a21                	addi	s4,s4,8
  8002ac:	846a                	mv	s0,s10
  8002ae:	bfd9                	j	800284 <vprintfmt+0x114>
  8002b0:	4705                	li	a4,1
  8002b2:	008a0593          	addi	a1,s4,8
  8002b6:	01174463          	blt	a4,a7,8002be <vprintfmt+0x14e>
  8002ba:	1a088e63          	beqz	a7,800476 <vprintfmt+0x306>
  8002be:	000a3603          	ld	a2,0(s4)
  8002c2:	46c1                	li	a3,16
  8002c4:	8a2e                	mv	s4,a1
  8002c6:	2781                	sext.w	a5,a5
  8002c8:	876e                	mv	a4,s11
  8002ca:	85a6                	mv	a1,s1
  8002cc:	854a                	mv	a0,s2
  8002ce:	e37ff0ef          	jal	ra,800104 <printnum>
  8002d2:	bde1                	j	8001aa <vprintfmt+0x3a>
  8002d4:	000a2503          	lw	a0,0(s4)
  8002d8:	85a6                	mv	a1,s1
  8002da:	0a21                	addi	s4,s4,8
  8002dc:	9902                	jalr	s2
  8002de:	b5f1                	j	8001aa <vprintfmt+0x3a>
  8002e0:	4705                	li	a4,1
  8002e2:	008a0593          	addi	a1,s4,8
  8002e6:	01174463          	blt	a4,a7,8002ee <vprintfmt+0x17e>
  8002ea:	18088163          	beqz	a7,80046c <vprintfmt+0x2fc>
  8002ee:	000a3603          	ld	a2,0(s4)
  8002f2:	46a9                	li	a3,10
  8002f4:	8a2e                	mv	s4,a1
  8002f6:	bfc1                	j	8002c6 <vprintfmt+0x156>
  8002f8:	00144603          	lbu	a2,1(s0)
  8002fc:	4c85                	li	s9,1
  8002fe:	846a                	mv	s0,s10
  800300:	bdf1                	j	8001dc <vprintfmt+0x6c>
  800302:	85a6                	mv	a1,s1
  800304:	02500513          	li	a0,37
  800308:	9902                	jalr	s2
  80030a:	b545                	j	8001aa <vprintfmt+0x3a>
  80030c:	00144603          	lbu	a2,1(s0)
  800310:	2885                	addiw	a7,a7,1
  800312:	846a                	mv	s0,s10
  800314:	b5e1                	j	8001dc <vprintfmt+0x6c>
  800316:	4705                	li	a4,1
  800318:	008a0593          	addi	a1,s4,8
  80031c:	01174463          	blt	a4,a7,800324 <vprintfmt+0x1b4>
  800320:	14088163          	beqz	a7,800462 <vprintfmt+0x2f2>
  800324:	000a3603          	ld	a2,0(s4)
  800328:	46a1                	li	a3,8
  80032a:	8a2e                	mv	s4,a1
  80032c:	bf69                	j	8002c6 <vprintfmt+0x156>
  80032e:	03000513          	li	a0,48
  800332:	85a6                	mv	a1,s1
  800334:	e03e                	sd	a5,0(sp)
  800336:	9902                	jalr	s2
  800338:	85a6                	mv	a1,s1
  80033a:	07800513          	li	a0,120
  80033e:	9902                	jalr	s2
  800340:	0a21                	addi	s4,s4,8
  800342:	6782                	ld	a5,0(sp)
  800344:	46c1                	li	a3,16
  800346:	ff8a3603          	ld	a2,-8(s4)
  80034a:	bfb5                	j	8002c6 <vprintfmt+0x156>
  80034c:	000a3403          	ld	s0,0(s4)
  800350:	008a0713          	addi	a4,s4,8
  800354:	e03a                	sd	a4,0(sp)
  800356:	14040263          	beqz	s0,80049a <vprintfmt+0x32a>
  80035a:	0fb05763          	blez	s11,800448 <vprintfmt+0x2d8>
  80035e:	02d00693          	li	a3,45
  800362:	0cd79163          	bne	a5,a3,800424 <vprintfmt+0x2b4>
  800366:	00044783          	lbu	a5,0(s0)
  80036a:	0007851b          	sext.w	a0,a5
  80036e:	cf85                	beqz	a5,8003a6 <vprintfmt+0x236>
  800370:	00140a13          	addi	s4,s0,1
  800374:	05e00413          	li	s0,94
  800378:	000c4563          	bltz	s8,800382 <vprintfmt+0x212>
  80037c:	3c7d                	addiw	s8,s8,-1
  80037e:	036c0263          	beq	s8,s6,8003a2 <vprintfmt+0x232>
  800382:	85a6                	mv	a1,s1
  800384:	0e0c8e63          	beqz	s9,800480 <vprintfmt+0x310>
  800388:	3781                	addiw	a5,a5,-32
  80038a:	0ef47b63          	bgeu	s0,a5,800480 <vprintfmt+0x310>
  80038e:	03f00513          	li	a0,63
  800392:	9902                	jalr	s2
  800394:	000a4783          	lbu	a5,0(s4)
  800398:	3dfd                	addiw	s11,s11,-1
  80039a:	0a05                	addi	s4,s4,1
  80039c:	0007851b          	sext.w	a0,a5
  8003a0:	ffe1                	bnez	a5,800378 <vprintfmt+0x208>
  8003a2:	01b05963          	blez	s11,8003b4 <vprintfmt+0x244>
  8003a6:	3dfd                	addiw	s11,s11,-1
  8003a8:	85a6                	mv	a1,s1
  8003aa:	02000513          	li	a0,32
  8003ae:	9902                	jalr	s2
  8003b0:	fe0d9be3          	bnez	s11,8003a6 <vprintfmt+0x236>
  8003b4:	6a02                	ld	s4,0(sp)
  8003b6:	bbd5                	j	8001aa <vprintfmt+0x3a>
  8003b8:	4705                	li	a4,1
  8003ba:	008a0c93          	addi	s9,s4,8
  8003be:	01174463          	blt	a4,a7,8003c6 <vprintfmt+0x256>
  8003c2:	08088d63          	beqz	a7,80045c <vprintfmt+0x2ec>
  8003c6:	000a3403          	ld	s0,0(s4)
  8003ca:	0a044d63          	bltz	s0,800484 <vprintfmt+0x314>
  8003ce:	8622                	mv	a2,s0
  8003d0:	8a66                	mv	s4,s9
  8003d2:	46a9                	li	a3,10
  8003d4:	bdcd                	j	8002c6 <vprintfmt+0x156>
  8003d6:	000a2783          	lw	a5,0(s4)
  8003da:	4761                	li	a4,24
  8003dc:	0a21                	addi	s4,s4,8
  8003de:	41f7d69b          	sraiw	a3,a5,0x1f
  8003e2:	8fb5                	xor	a5,a5,a3
  8003e4:	40d786bb          	subw	a3,a5,a3
  8003e8:	02d74163          	blt	a4,a3,80040a <vprintfmt+0x29a>
  8003ec:	00369793          	slli	a5,a3,0x3
  8003f0:	97de                	add	a5,a5,s7
  8003f2:	639c                	ld	a5,0(a5)
  8003f4:	cb99                	beqz	a5,80040a <vprintfmt+0x29a>
  8003f6:	86be                	mv	a3,a5
  8003f8:	00000617          	auipc	a2,0x0
  8003fc:	1b060613          	addi	a2,a2,432 # 8005a8 <main+0xb6>
  800400:	85a6                	mv	a1,s1
  800402:	854a                	mv	a0,s2
  800404:	0ce000ef          	jal	ra,8004d2 <printfmt>
  800408:	b34d                	j	8001aa <vprintfmt+0x3a>
  80040a:	00000617          	auipc	a2,0x0
  80040e:	18e60613          	addi	a2,a2,398 # 800598 <main+0xa6>
  800412:	85a6                	mv	a1,s1
  800414:	854a                	mv	a0,s2
  800416:	0bc000ef          	jal	ra,8004d2 <printfmt>
  80041a:	bb41                	j	8001aa <vprintfmt+0x3a>
  80041c:	00000417          	auipc	s0,0x0
  800420:	17440413          	addi	s0,s0,372 # 800590 <main+0x9e>
  800424:	85e2                	mv	a1,s8
  800426:	8522                	mv	a0,s0
  800428:	e43e                	sd	a5,8(sp)
  80042a:	cbfff0ef          	jal	ra,8000e8 <strnlen>
  80042e:	40ad8dbb          	subw	s11,s11,a0
  800432:	01b05b63          	blez	s11,800448 <vprintfmt+0x2d8>
  800436:	67a2                	ld	a5,8(sp)
  800438:	00078a1b          	sext.w	s4,a5
  80043c:	3dfd                	addiw	s11,s11,-1
  80043e:	85a6                	mv	a1,s1
  800440:	8552                	mv	a0,s4
  800442:	9902                	jalr	s2
  800444:	fe0d9ce3          	bnez	s11,80043c <vprintfmt+0x2cc>
  800448:	00044783          	lbu	a5,0(s0)
  80044c:	00140a13          	addi	s4,s0,1
  800450:	0007851b          	sext.w	a0,a5
  800454:	d3a5                	beqz	a5,8003b4 <vprintfmt+0x244>
  800456:	05e00413          	li	s0,94
  80045a:	bf39                	j	800378 <vprintfmt+0x208>
  80045c:	000a2403          	lw	s0,0(s4)
  800460:	b7ad                	j	8003ca <vprintfmt+0x25a>
  800462:	000a6603          	lwu	a2,0(s4)
  800466:	46a1                	li	a3,8
  800468:	8a2e                	mv	s4,a1
  80046a:	bdb1                	j	8002c6 <vprintfmt+0x156>
  80046c:	000a6603          	lwu	a2,0(s4)
  800470:	46a9                	li	a3,10
  800472:	8a2e                	mv	s4,a1
  800474:	bd89                	j	8002c6 <vprintfmt+0x156>
  800476:	000a6603          	lwu	a2,0(s4)
  80047a:	46c1                	li	a3,16
  80047c:	8a2e                	mv	s4,a1
  80047e:	b5a1                	j	8002c6 <vprintfmt+0x156>
  800480:	9902                	jalr	s2
  800482:	bf09                	j	800394 <vprintfmt+0x224>
  800484:	85a6                	mv	a1,s1
  800486:	02d00513          	li	a0,45
  80048a:	e03e                	sd	a5,0(sp)
  80048c:	9902                	jalr	s2
  80048e:	6782                	ld	a5,0(sp)
  800490:	8a66                	mv	s4,s9
  800492:	40800633          	neg	a2,s0
  800496:	46a9                	li	a3,10
  800498:	b53d                	j	8002c6 <vprintfmt+0x156>
  80049a:	03b05163          	blez	s11,8004bc <vprintfmt+0x34c>
  80049e:	02d00693          	li	a3,45
  8004a2:	f6d79de3          	bne	a5,a3,80041c <vprintfmt+0x2ac>
  8004a6:	00000417          	auipc	s0,0x0
  8004aa:	0ea40413          	addi	s0,s0,234 # 800590 <main+0x9e>
  8004ae:	02800793          	li	a5,40
  8004b2:	02800513          	li	a0,40
  8004b6:	00140a13          	addi	s4,s0,1
  8004ba:	bd6d                	j	800374 <vprintfmt+0x204>
  8004bc:	00000a17          	auipc	s4,0x0
  8004c0:	0d5a0a13          	addi	s4,s4,213 # 800591 <main+0x9f>
  8004c4:	02800513          	li	a0,40
  8004c8:	02800793          	li	a5,40
  8004cc:	05e00413          	li	s0,94
  8004d0:	b565                	j	800378 <vprintfmt+0x208>

00000000008004d2 <printfmt>:
  8004d2:	715d                	addi	sp,sp,-80
  8004d4:	02810313          	addi	t1,sp,40
  8004d8:	f436                	sd	a3,40(sp)
  8004da:	869a                	mv	a3,t1
  8004dc:	ec06                	sd	ra,24(sp)
  8004de:	f83a                	sd	a4,48(sp)
  8004e0:	fc3e                	sd	a5,56(sp)
  8004e2:	e0c2                	sd	a6,64(sp)
  8004e4:	e4c6                	sd	a7,72(sp)
  8004e6:	e41a                	sd	t1,8(sp)
  8004e8:	c89ff0ef          	jal	ra,800170 <vprintfmt>
  8004ec:	60e2                	ld	ra,24(sp)
  8004ee:	6161                	addi	sp,sp,80
  8004f0:	8082                	ret

00000000008004f2 <main>:
  8004f2:	1101                	addi	sp,sp,-32
  8004f4:	ec06                	sd	ra,24(sp)
  8004f6:	e822                	sd	s0,16(sp)
  8004f8:	e426                	sd	s1,8(sp)
  8004fa:	e04a                	sd	s2,0(sp)
  8004fc:	b89ff0ef          	jal	ra,800084 <getpid>
  800500:	85aa                	mv	a1,a0
  800502:	00000517          	auipc	a0,0x0
  800506:	38e50513          	addi	a0,a0,910 # 800890 <error_string+0xc8>
  80050a:	b9dff0ef          	jal	ra,8000a6 <cprintf>
  80050e:	4401                	li	s0,0
  800510:	00000917          	auipc	s2,0x0
  800514:	3a090913          	addi	s2,s2,928 # 8008b0 <error_string+0xe8>
  800518:	4495                	li	s1,5
  80051a:	b69ff0ef          	jal	ra,800082 <yield>
  80051e:	b67ff0ef          	jal	ra,800084 <getpid>
  800522:	85aa                	mv	a1,a0
  800524:	8622                	mv	a2,s0
  800526:	854a                	mv	a0,s2
  800528:	2405                	addiw	s0,s0,1
  80052a:	b7dff0ef          	jal	ra,8000a6 <cprintf>
  80052e:	fe9416e3          	bne	s0,s1,80051a <main+0x28>
  800532:	b53ff0ef          	jal	ra,800084 <getpid>
  800536:	85aa                	mv	a1,a0
  800538:	00000517          	auipc	a0,0x0
  80053c:	3a050513          	addi	a0,a0,928 # 8008d8 <error_string+0x110>
  800540:	b67ff0ef          	jal	ra,8000a6 <cprintf>
  800544:	00000517          	auipc	a0,0x0
  800548:	3b450513          	addi	a0,a0,948 # 8008f8 <error_string+0x130>
  80054c:	b5bff0ef          	jal	ra,8000a6 <cprintf>
  800550:	60e2                	ld	ra,24(sp)
  800552:	6442                	ld	s0,16(sp)
  800554:	64a2                	ld	s1,8(sp)
  800556:	6902                	ld	s2,0(sp)
  800558:	4501                	li	a0,0
  80055a:	6105                	addi	sp,sp,32
  80055c:	8082                	ret
