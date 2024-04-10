
obj/__user_hello.out:     file format elf64-littleriscv


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

000000000080005e <sys_getpid>:
  80005e:	4549                	li	a0,18
  800060:	b7c1                	j	800020 <syscall>

0000000000800062 <sys_putc>:
  800062:	85aa                	mv	a1,a0
  800064:	4579                	li	a0,30
  800066:	bf6d                	j	800020 <syscall>

0000000000800068 <exit>:
  800068:	1141                	addi	sp,sp,-16
  80006a:	e406                	sd	ra,8(sp)
  80006c:	fedff0ef          	jal	ra,800058 <sys_exit>
  800070:	00000517          	auipc	a0,0x0
  800074:	4b850513          	addi	a0,a0,1208 # 800528 <main+0x3c>
  800078:	028000ef          	jal	ra,8000a0 <cprintf>
  80007c:	a001                	j	80007c <exit+0x14>

000000000080007e <getpid>:
  80007e:	b7c5                	j	80005e <sys_getpid>

0000000000800080 <_start>:
  800080:	056000ef          	jal	ra,8000d6 <umain>
  800084:	a001                	j	800084 <_start+0x4>

0000000000800086 <cputch>:
  800086:	1141                	addi	sp,sp,-16
  800088:	e022                	sd	s0,0(sp)
  80008a:	e406                	sd	ra,8(sp)
  80008c:	842e                	mv	s0,a1
  80008e:	fd5ff0ef          	jal	ra,800062 <sys_putc>
  800092:	401c                	lw	a5,0(s0)
  800094:	60a2                	ld	ra,8(sp)
  800096:	2785                	addiw	a5,a5,1
  800098:	c01c                	sw	a5,0(s0)
  80009a:	6402                	ld	s0,0(sp)
  80009c:	0141                	addi	sp,sp,16
  80009e:	8082                	ret

00000000008000a0 <cprintf>:
  8000a0:	711d                	addi	sp,sp,-96
  8000a2:	02810313          	addi	t1,sp,40
  8000a6:	8e2a                	mv	t3,a0
  8000a8:	f42e                	sd	a1,40(sp)
  8000aa:	f832                	sd	a2,48(sp)
  8000ac:	fc36                	sd	a3,56(sp)
  8000ae:	00000517          	auipc	a0,0x0
  8000b2:	fd850513          	addi	a0,a0,-40 # 800086 <cputch>
  8000b6:	004c                	addi	a1,sp,4
  8000b8:	869a                	mv	a3,t1
  8000ba:	8672                	mv	a2,t3
  8000bc:	ec06                	sd	ra,24(sp)
  8000be:	e0ba                	sd	a4,64(sp)
  8000c0:	e4be                	sd	a5,72(sp)
  8000c2:	e8c2                	sd	a6,80(sp)
  8000c4:	ecc6                	sd	a7,88(sp)
  8000c6:	e41a                	sd	t1,8(sp)
  8000c8:	c202                	sw	zero,4(sp)
  8000ca:	0a0000ef          	jal	ra,80016a <vprintfmt>
  8000ce:	60e2                	ld	ra,24(sp)
  8000d0:	4512                	lw	a0,4(sp)
  8000d2:	6125                	addi	sp,sp,96
  8000d4:	8082                	ret

00000000008000d6 <umain>:
  8000d6:	1141                	addi	sp,sp,-16
  8000d8:	e406                	sd	ra,8(sp)
  8000da:	412000ef          	jal	ra,8004ec <main>
  8000de:	f8bff0ef          	jal	ra,800068 <exit>

00000000008000e2 <strnlen>:
  8000e2:	872a                	mv	a4,a0
  8000e4:	4501                	li	a0,0
  8000e6:	e589                	bnez	a1,8000f0 <strnlen+0xe>
  8000e8:	a811                	j	8000fc <strnlen+0x1a>
  8000ea:	0505                	addi	a0,a0,1
  8000ec:	00a58763          	beq	a1,a0,8000fa <strnlen+0x18>
  8000f0:	00a707b3          	add	a5,a4,a0
  8000f4:	0007c783          	lbu	a5,0(a5)
  8000f8:	fbed                	bnez	a5,8000ea <strnlen+0x8>
  8000fa:	8082                	ret
  8000fc:	8082                	ret

00000000008000fe <printnum>:
  8000fe:	02069813          	slli	a6,a3,0x20
  800102:	7179                	addi	sp,sp,-48
  800104:	02085813          	srli	a6,a6,0x20
  800108:	e052                	sd	s4,0(sp)
  80010a:	03067a33          	remu	s4,a2,a6
  80010e:	f022                	sd	s0,32(sp)
  800110:	ec26                	sd	s1,24(sp)
  800112:	e84a                	sd	s2,16(sp)
  800114:	f406                	sd	ra,40(sp)
  800116:	e44e                	sd	s3,8(sp)
  800118:	84aa                	mv	s1,a0
  80011a:	892e                	mv	s2,a1
  80011c:	fff7041b          	addiw	s0,a4,-1
  800120:	2a01                	sext.w	s4,s4
  800122:	03067e63          	bgeu	a2,a6,80015e <printnum+0x60>
  800126:	89be                	mv	s3,a5
  800128:	00805763          	blez	s0,800136 <printnum+0x38>
  80012c:	347d                	addiw	s0,s0,-1
  80012e:	85ca                	mv	a1,s2
  800130:	854e                	mv	a0,s3
  800132:	9482                	jalr	s1
  800134:	fc65                	bnez	s0,80012c <printnum+0x2e>
  800136:	1a02                	slli	s4,s4,0x20
  800138:	020a5a13          	srli	s4,s4,0x20
  80013c:	00000797          	auipc	a5,0x0
  800140:	40478793          	addi	a5,a5,1028 # 800540 <main+0x54>
  800144:	7402                	ld	s0,32(sp)
  800146:	9a3e                	add	s4,s4,a5
  800148:	000a4503          	lbu	a0,0(s4)
  80014c:	70a2                	ld	ra,40(sp)
  80014e:	69a2                	ld	s3,8(sp)
  800150:	6a02                	ld	s4,0(sp)
  800152:	85ca                	mv	a1,s2
  800154:	8326                	mv	t1,s1
  800156:	6942                	ld	s2,16(sp)
  800158:	64e2                	ld	s1,24(sp)
  80015a:	6145                	addi	sp,sp,48
  80015c:	8302                	jr	t1
  80015e:	03065633          	divu	a2,a2,a6
  800162:	8722                	mv	a4,s0
  800164:	f9bff0ef          	jal	ra,8000fe <printnum>
  800168:	b7f9                	j	800136 <printnum+0x38>

000000000080016a <vprintfmt>:
  80016a:	7119                	addi	sp,sp,-128
  80016c:	f4a6                	sd	s1,104(sp)
  80016e:	f0ca                	sd	s2,96(sp)
  800170:	ecce                	sd	s3,88(sp)
  800172:	e8d2                	sd	s4,80(sp)
  800174:	e4d6                	sd	s5,72(sp)
  800176:	e0da                	sd	s6,64(sp)
  800178:	fc5e                	sd	s7,56(sp)
  80017a:	f06a                	sd	s10,32(sp)
  80017c:	fc86                	sd	ra,120(sp)
  80017e:	f8a2                	sd	s0,112(sp)
  800180:	f862                	sd	s8,48(sp)
  800182:	f466                	sd	s9,40(sp)
  800184:	ec6e                	sd	s11,24(sp)
  800186:	892a                	mv	s2,a0
  800188:	84ae                	mv	s1,a1
  80018a:	8d32                	mv	s10,a2
  80018c:	8a36                	mv	s4,a3
  80018e:	02500993          	li	s3,37
  800192:	5b7d                	li	s6,-1
  800194:	00000a97          	auipc	s5,0x0
  800198:	3e0a8a93          	addi	s5,s5,992 # 800574 <main+0x88>
  80019c:	00000b97          	auipc	s7,0x0
  8001a0:	5f4b8b93          	addi	s7,s7,1524 # 800790 <error_string>
  8001a4:	000d4503          	lbu	a0,0(s10)
  8001a8:	001d0413          	addi	s0,s10,1
  8001ac:	01350a63          	beq	a0,s3,8001c0 <vprintfmt+0x56>
  8001b0:	c121                	beqz	a0,8001f0 <vprintfmt+0x86>
  8001b2:	85a6                	mv	a1,s1
  8001b4:	0405                	addi	s0,s0,1
  8001b6:	9902                	jalr	s2
  8001b8:	fff44503          	lbu	a0,-1(s0)
  8001bc:	ff351ae3          	bne	a0,s3,8001b0 <vprintfmt+0x46>
  8001c0:	00044603          	lbu	a2,0(s0)
  8001c4:	02000793          	li	a5,32
  8001c8:	4c81                	li	s9,0
  8001ca:	4881                	li	a7,0
  8001cc:	5c7d                	li	s8,-1
  8001ce:	5dfd                	li	s11,-1
  8001d0:	05500513          	li	a0,85
  8001d4:	4825                	li	a6,9
  8001d6:	fdd6059b          	addiw	a1,a2,-35
  8001da:	0ff5f593          	andi	a1,a1,255
  8001de:	00140d13          	addi	s10,s0,1
  8001e2:	04b56263          	bltu	a0,a1,800226 <vprintfmt+0xbc>
  8001e6:	058a                	slli	a1,a1,0x2
  8001e8:	95d6                	add	a1,a1,s5
  8001ea:	4194                	lw	a3,0(a1)
  8001ec:	96d6                	add	a3,a3,s5
  8001ee:	8682                	jr	a3
  8001f0:	70e6                	ld	ra,120(sp)
  8001f2:	7446                	ld	s0,112(sp)
  8001f4:	74a6                	ld	s1,104(sp)
  8001f6:	7906                	ld	s2,96(sp)
  8001f8:	69e6                	ld	s3,88(sp)
  8001fa:	6a46                	ld	s4,80(sp)
  8001fc:	6aa6                	ld	s5,72(sp)
  8001fe:	6b06                	ld	s6,64(sp)
  800200:	7be2                	ld	s7,56(sp)
  800202:	7c42                	ld	s8,48(sp)
  800204:	7ca2                	ld	s9,40(sp)
  800206:	7d02                	ld	s10,32(sp)
  800208:	6de2                	ld	s11,24(sp)
  80020a:	6109                	addi	sp,sp,128
  80020c:	8082                	ret
  80020e:	87b2                	mv	a5,a2
  800210:	00144603          	lbu	a2,1(s0)
  800214:	846a                	mv	s0,s10
  800216:	00140d13          	addi	s10,s0,1
  80021a:	fdd6059b          	addiw	a1,a2,-35
  80021e:	0ff5f593          	andi	a1,a1,255
  800222:	fcb572e3          	bgeu	a0,a1,8001e6 <vprintfmt+0x7c>
  800226:	85a6                	mv	a1,s1
  800228:	02500513          	li	a0,37
  80022c:	9902                	jalr	s2
  80022e:	fff44783          	lbu	a5,-1(s0)
  800232:	8d22                	mv	s10,s0
  800234:	f73788e3          	beq	a5,s3,8001a4 <vprintfmt+0x3a>
  800238:	ffed4783          	lbu	a5,-2(s10)
  80023c:	1d7d                	addi	s10,s10,-1
  80023e:	ff379de3          	bne	a5,s3,800238 <vprintfmt+0xce>
  800242:	b78d                	j	8001a4 <vprintfmt+0x3a>
  800244:	fd060c1b          	addiw	s8,a2,-48
  800248:	00144603          	lbu	a2,1(s0)
  80024c:	846a                	mv	s0,s10
  80024e:	fd06069b          	addiw	a3,a2,-48
  800252:	0006059b          	sext.w	a1,a2
  800256:	02d86463          	bltu	a6,a3,80027e <vprintfmt+0x114>
  80025a:	00144603          	lbu	a2,1(s0)
  80025e:	002c169b          	slliw	a3,s8,0x2
  800262:	0186873b          	addw	a4,a3,s8
  800266:	0017171b          	slliw	a4,a4,0x1
  80026a:	9f2d                	addw	a4,a4,a1
  80026c:	fd06069b          	addiw	a3,a2,-48
  800270:	0405                	addi	s0,s0,1
  800272:	fd070c1b          	addiw	s8,a4,-48
  800276:	0006059b          	sext.w	a1,a2
  80027a:	fed870e3          	bgeu	a6,a3,80025a <vprintfmt+0xf0>
  80027e:	f40ddce3          	bgez	s11,8001d6 <vprintfmt+0x6c>
  800282:	8de2                	mv	s11,s8
  800284:	5c7d                	li	s8,-1
  800286:	bf81                	j	8001d6 <vprintfmt+0x6c>
  800288:	fffdc693          	not	a3,s11
  80028c:	96fd                	srai	a3,a3,0x3f
  80028e:	00ddfdb3          	and	s11,s11,a3
  800292:	00144603          	lbu	a2,1(s0)
  800296:	2d81                	sext.w	s11,s11
  800298:	846a                	mv	s0,s10
  80029a:	bf35                	j	8001d6 <vprintfmt+0x6c>
  80029c:	000a2c03          	lw	s8,0(s4)
  8002a0:	00144603          	lbu	a2,1(s0)
  8002a4:	0a21                	addi	s4,s4,8
  8002a6:	846a                	mv	s0,s10
  8002a8:	bfd9                	j	80027e <vprintfmt+0x114>
  8002aa:	4705                	li	a4,1
  8002ac:	008a0593          	addi	a1,s4,8
  8002b0:	01174463          	blt	a4,a7,8002b8 <vprintfmt+0x14e>
  8002b4:	1a088e63          	beqz	a7,800470 <vprintfmt+0x306>
  8002b8:	000a3603          	ld	a2,0(s4)
  8002bc:	46c1                	li	a3,16
  8002be:	8a2e                	mv	s4,a1
  8002c0:	2781                	sext.w	a5,a5
  8002c2:	876e                	mv	a4,s11
  8002c4:	85a6                	mv	a1,s1
  8002c6:	854a                	mv	a0,s2
  8002c8:	e37ff0ef          	jal	ra,8000fe <printnum>
  8002cc:	bde1                	j	8001a4 <vprintfmt+0x3a>
  8002ce:	000a2503          	lw	a0,0(s4)
  8002d2:	85a6                	mv	a1,s1
  8002d4:	0a21                	addi	s4,s4,8
  8002d6:	9902                	jalr	s2
  8002d8:	b5f1                	j	8001a4 <vprintfmt+0x3a>
  8002da:	4705                	li	a4,1
  8002dc:	008a0593          	addi	a1,s4,8
  8002e0:	01174463          	blt	a4,a7,8002e8 <vprintfmt+0x17e>
  8002e4:	18088163          	beqz	a7,800466 <vprintfmt+0x2fc>
  8002e8:	000a3603          	ld	a2,0(s4)
  8002ec:	46a9                	li	a3,10
  8002ee:	8a2e                	mv	s4,a1
  8002f0:	bfc1                	j	8002c0 <vprintfmt+0x156>
  8002f2:	00144603          	lbu	a2,1(s0)
  8002f6:	4c85                	li	s9,1
  8002f8:	846a                	mv	s0,s10
  8002fa:	bdf1                	j	8001d6 <vprintfmt+0x6c>
  8002fc:	85a6                	mv	a1,s1
  8002fe:	02500513          	li	a0,37
  800302:	9902                	jalr	s2
  800304:	b545                	j	8001a4 <vprintfmt+0x3a>
  800306:	00144603          	lbu	a2,1(s0)
  80030a:	2885                	addiw	a7,a7,1
  80030c:	846a                	mv	s0,s10
  80030e:	b5e1                	j	8001d6 <vprintfmt+0x6c>
  800310:	4705                	li	a4,1
  800312:	008a0593          	addi	a1,s4,8
  800316:	01174463          	blt	a4,a7,80031e <vprintfmt+0x1b4>
  80031a:	14088163          	beqz	a7,80045c <vprintfmt+0x2f2>
  80031e:	000a3603          	ld	a2,0(s4)
  800322:	46a1                	li	a3,8
  800324:	8a2e                	mv	s4,a1
  800326:	bf69                	j	8002c0 <vprintfmt+0x156>
  800328:	03000513          	li	a0,48
  80032c:	85a6                	mv	a1,s1
  80032e:	e03e                	sd	a5,0(sp)
  800330:	9902                	jalr	s2
  800332:	85a6                	mv	a1,s1
  800334:	07800513          	li	a0,120
  800338:	9902                	jalr	s2
  80033a:	0a21                	addi	s4,s4,8
  80033c:	6782                	ld	a5,0(sp)
  80033e:	46c1                	li	a3,16
  800340:	ff8a3603          	ld	a2,-8(s4)
  800344:	bfb5                	j	8002c0 <vprintfmt+0x156>
  800346:	000a3403          	ld	s0,0(s4)
  80034a:	008a0713          	addi	a4,s4,8
  80034e:	e03a                	sd	a4,0(sp)
  800350:	14040263          	beqz	s0,800494 <vprintfmt+0x32a>
  800354:	0fb05763          	blez	s11,800442 <vprintfmt+0x2d8>
  800358:	02d00693          	li	a3,45
  80035c:	0cd79163          	bne	a5,a3,80041e <vprintfmt+0x2b4>
  800360:	00044783          	lbu	a5,0(s0)
  800364:	0007851b          	sext.w	a0,a5
  800368:	cf85                	beqz	a5,8003a0 <vprintfmt+0x236>
  80036a:	00140a13          	addi	s4,s0,1
  80036e:	05e00413          	li	s0,94
  800372:	000c4563          	bltz	s8,80037c <vprintfmt+0x212>
  800376:	3c7d                	addiw	s8,s8,-1
  800378:	036c0263          	beq	s8,s6,80039c <vprintfmt+0x232>
  80037c:	85a6                	mv	a1,s1
  80037e:	0e0c8e63          	beqz	s9,80047a <vprintfmt+0x310>
  800382:	3781                	addiw	a5,a5,-32
  800384:	0ef47b63          	bgeu	s0,a5,80047a <vprintfmt+0x310>
  800388:	03f00513          	li	a0,63
  80038c:	9902                	jalr	s2
  80038e:	000a4783          	lbu	a5,0(s4)
  800392:	3dfd                	addiw	s11,s11,-1
  800394:	0a05                	addi	s4,s4,1
  800396:	0007851b          	sext.w	a0,a5
  80039a:	ffe1                	bnez	a5,800372 <vprintfmt+0x208>
  80039c:	01b05963          	blez	s11,8003ae <vprintfmt+0x244>
  8003a0:	3dfd                	addiw	s11,s11,-1
  8003a2:	85a6                	mv	a1,s1
  8003a4:	02000513          	li	a0,32
  8003a8:	9902                	jalr	s2
  8003aa:	fe0d9be3          	bnez	s11,8003a0 <vprintfmt+0x236>
  8003ae:	6a02                	ld	s4,0(sp)
  8003b0:	bbd5                	j	8001a4 <vprintfmt+0x3a>
  8003b2:	4705                	li	a4,1
  8003b4:	008a0c93          	addi	s9,s4,8
  8003b8:	01174463          	blt	a4,a7,8003c0 <vprintfmt+0x256>
  8003bc:	08088d63          	beqz	a7,800456 <vprintfmt+0x2ec>
  8003c0:	000a3403          	ld	s0,0(s4)
  8003c4:	0a044d63          	bltz	s0,80047e <vprintfmt+0x314>
  8003c8:	8622                	mv	a2,s0
  8003ca:	8a66                	mv	s4,s9
  8003cc:	46a9                	li	a3,10
  8003ce:	bdcd                	j	8002c0 <vprintfmt+0x156>
  8003d0:	000a2783          	lw	a5,0(s4)
  8003d4:	4761                	li	a4,24
  8003d6:	0a21                	addi	s4,s4,8
  8003d8:	41f7d69b          	sraiw	a3,a5,0x1f
  8003dc:	8fb5                	xor	a5,a5,a3
  8003de:	40d786bb          	subw	a3,a5,a3
  8003e2:	02d74163          	blt	a4,a3,800404 <vprintfmt+0x29a>
  8003e6:	00369793          	slli	a5,a3,0x3
  8003ea:	97de                	add	a5,a5,s7
  8003ec:	639c                	ld	a5,0(a5)
  8003ee:	cb99                	beqz	a5,800404 <vprintfmt+0x29a>
  8003f0:	86be                	mv	a3,a5
  8003f2:	00000617          	auipc	a2,0x0
  8003f6:	17e60613          	addi	a2,a2,382 # 800570 <main+0x84>
  8003fa:	85a6                	mv	a1,s1
  8003fc:	854a                	mv	a0,s2
  8003fe:	0ce000ef          	jal	ra,8004cc <printfmt>
  800402:	b34d                	j	8001a4 <vprintfmt+0x3a>
  800404:	00000617          	auipc	a2,0x0
  800408:	15c60613          	addi	a2,a2,348 # 800560 <main+0x74>
  80040c:	85a6                	mv	a1,s1
  80040e:	854a                	mv	a0,s2
  800410:	0bc000ef          	jal	ra,8004cc <printfmt>
  800414:	bb41                	j	8001a4 <vprintfmt+0x3a>
  800416:	00000417          	auipc	s0,0x0
  80041a:	14240413          	addi	s0,s0,322 # 800558 <main+0x6c>
  80041e:	85e2                	mv	a1,s8
  800420:	8522                	mv	a0,s0
  800422:	e43e                	sd	a5,8(sp)
  800424:	cbfff0ef          	jal	ra,8000e2 <strnlen>
  800428:	40ad8dbb          	subw	s11,s11,a0
  80042c:	01b05b63          	blez	s11,800442 <vprintfmt+0x2d8>
  800430:	67a2                	ld	a5,8(sp)
  800432:	00078a1b          	sext.w	s4,a5
  800436:	3dfd                	addiw	s11,s11,-1
  800438:	85a6                	mv	a1,s1
  80043a:	8552                	mv	a0,s4
  80043c:	9902                	jalr	s2
  80043e:	fe0d9ce3          	bnez	s11,800436 <vprintfmt+0x2cc>
  800442:	00044783          	lbu	a5,0(s0)
  800446:	00140a13          	addi	s4,s0,1
  80044a:	0007851b          	sext.w	a0,a5
  80044e:	d3a5                	beqz	a5,8003ae <vprintfmt+0x244>
  800450:	05e00413          	li	s0,94
  800454:	bf39                	j	800372 <vprintfmt+0x208>
  800456:	000a2403          	lw	s0,0(s4)
  80045a:	b7ad                	j	8003c4 <vprintfmt+0x25a>
  80045c:	000a6603          	lwu	a2,0(s4)
  800460:	46a1                	li	a3,8
  800462:	8a2e                	mv	s4,a1
  800464:	bdb1                	j	8002c0 <vprintfmt+0x156>
  800466:	000a6603          	lwu	a2,0(s4)
  80046a:	46a9                	li	a3,10
  80046c:	8a2e                	mv	s4,a1
  80046e:	bd89                	j	8002c0 <vprintfmt+0x156>
  800470:	000a6603          	lwu	a2,0(s4)
  800474:	46c1                	li	a3,16
  800476:	8a2e                	mv	s4,a1
  800478:	b5a1                	j	8002c0 <vprintfmt+0x156>
  80047a:	9902                	jalr	s2
  80047c:	bf09                	j	80038e <vprintfmt+0x224>
  80047e:	85a6                	mv	a1,s1
  800480:	02d00513          	li	a0,45
  800484:	e03e                	sd	a5,0(sp)
  800486:	9902                	jalr	s2
  800488:	6782                	ld	a5,0(sp)
  80048a:	8a66                	mv	s4,s9
  80048c:	40800633          	neg	a2,s0
  800490:	46a9                	li	a3,10
  800492:	b53d                	j	8002c0 <vprintfmt+0x156>
  800494:	03b05163          	blez	s11,8004b6 <vprintfmt+0x34c>
  800498:	02d00693          	li	a3,45
  80049c:	f6d79de3          	bne	a5,a3,800416 <vprintfmt+0x2ac>
  8004a0:	00000417          	auipc	s0,0x0
  8004a4:	0b840413          	addi	s0,s0,184 # 800558 <main+0x6c>
  8004a8:	02800793          	li	a5,40
  8004ac:	02800513          	li	a0,40
  8004b0:	00140a13          	addi	s4,s0,1
  8004b4:	bd6d                	j	80036e <vprintfmt+0x204>
  8004b6:	00000a17          	auipc	s4,0x0
  8004ba:	0a3a0a13          	addi	s4,s4,163 # 800559 <main+0x6d>
  8004be:	02800513          	li	a0,40
  8004c2:	02800793          	li	a5,40
  8004c6:	05e00413          	li	s0,94
  8004ca:	b565                	j	800372 <vprintfmt+0x208>

00000000008004cc <printfmt>:
  8004cc:	715d                	addi	sp,sp,-80
  8004ce:	02810313          	addi	t1,sp,40
  8004d2:	f436                	sd	a3,40(sp)
  8004d4:	869a                	mv	a3,t1
  8004d6:	ec06                	sd	ra,24(sp)
  8004d8:	f83a                	sd	a4,48(sp)
  8004da:	fc3e                	sd	a5,56(sp)
  8004dc:	e0c2                	sd	a6,64(sp)
  8004de:	e4c6                	sd	a7,72(sp)
  8004e0:	e41a                	sd	t1,8(sp)
  8004e2:	c89ff0ef          	jal	ra,80016a <vprintfmt>
  8004e6:	60e2                	ld	ra,24(sp)
  8004e8:	6161                	addi	sp,sp,80
  8004ea:	8082                	ret

00000000008004ec <main>:
  8004ec:	1141                	addi	sp,sp,-16
  8004ee:	00000517          	auipc	a0,0x0
  8004f2:	36a50513          	addi	a0,a0,874 # 800858 <error_string+0xc8>
  8004f6:	e406                	sd	ra,8(sp)
  8004f8:	ba9ff0ef          	jal	ra,8000a0 <cprintf>
  8004fc:	b83ff0ef          	jal	ra,80007e <getpid>
  800500:	85aa                	mv	a1,a0
  800502:	00000517          	auipc	a0,0x0
  800506:	36650513          	addi	a0,a0,870 # 800868 <error_string+0xd8>
  80050a:	b97ff0ef          	jal	ra,8000a0 <cprintf>
  80050e:	00000517          	auipc	a0,0x0
  800512:	37250513          	addi	a0,a0,882 # 800880 <error_string+0xf0>
  800516:	b8bff0ef          	jal	ra,8000a0 <cprintf>
  80051a:	60a2                	ld	ra,8(sp)
  80051c:	4501                	li	a0,0
  80051e:	0141                	addi	sp,sp,16
  800520:	8082                	ret
