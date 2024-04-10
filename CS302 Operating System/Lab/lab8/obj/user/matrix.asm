
obj/__user_matrix.out:     file format elf64-littleriscv


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
  800034:	77850513          	addi	a0,a0,1912 # 8007a8 <main+0xc6>
  800038:	ec06                	sd	ra,24(sp)
  80003a:	f436                	sd	a3,40(sp)
  80003c:	f83a                	sd	a4,48(sp)
  80003e:	e0c2                	sd	a6,64(sp)
  800040:	e4c6                	sd	a7,72(sp)
  800042:	e43e                	sd	a5,8(sp)
  800044:	0e0000ef          	jal	ra,800124 <cprintf>
  800048:	65a2                	ld	a1,8(sp)
  80004a:	8522                	mv	a0,s0
  80004c:	0b8000ef          	jal	ra,800104 <vcprintf>
  800050:	00001517          	auipc	a0,0x1
  800054:	ae050513          	addi	a0,a0,-1312 # 800b30 <error_string+0x100>
  800058:	0cc000ef          	jal	ra,800124 <cprintf>
  80005c:	5559                	li	a0,-10
  80005e:	062000ef          	jal	ra,8000c0 <exit>

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

00000000008000b6 <sys_getpid>:
  8000b6:	4549                	li	a0,18
  8000b8:	b76d                	j	800062 <syscall>

00000000008000ba <sys_putc>:
  8000ba:	85aa                	mv	a1,a0
  8000bc:	4579                	li	a0,30
  8000be:	b755                	j	800062 <syscall>

00000000008000c0 <exit>:
  8000c0:	1141                	addi	sp,sp,-16
  8000c2:	e406                	sd	ra,8(sp)
  8000c4:	fd7ff0ef          	jal	ra,80009a <sys_exit>
  8000c8:	00000517          	auipc	a0,0x0
  8000cc:	70050513          	addi	a0,a0,1792 # 8007c8 <main+0xe6>
  8000d0:	054000ef          	jal	ra,800124 <cprintf>
  8000d4:	a001                	j	8000d4 <exit+0x14>

00000000008000d6 <fork>:
  8000d6:	b7e9                	j	8000a0 <sys_fork>

00000000008000d8 <wait>:
  8000d8:	4581                	li	a1,0
  8000da:	4501                	li	a0,0
  8000dc:	b7e1                	j	8000a4 <sys_wait>

00000000008000de <yield>:
  8000de:	b7f9                	j	8000ac <sys_yield>

00000000008000e0 <kill>:
  8000e0:	bfc1                	j	8000b0 <sys_kill>

00000000008000e2 <getpid>:
  8000e2:	bfd1                	j	8000b6 <sys_getpid>

00000000008000e4 <_start>:
  8000e4:	076000ef          	jal	ra,80015a <umain>
  8000e8:	a001                	j	8000e8 <_start+0x4>

00000000008000ea <cputch>:
  8000ea:	1141                	addi	sp,sp,-16
  8000ec:	e022                	sd	s0,0(sp)
  8000ee:	e406                	sd	ra,8(sp)
  8000f0:	842e                	mv	s0,a1
  8000f2:	fc9ff0ef          	jal	ra,8000ba <sys_putc>
  8000f6:	401c                	lw	a5,0(s0)
  8000f8:	60a2                	ld	ra,8(sp)
  8000fa:	2785                	addiw	a5,a5,1
  8000fc:	c01c                	sw	a5,0(s0)
  8000fe:	6402                	ld	s0,0(sp)
  800100:	0141                	addi	sp,sp,16
  800102:	8082                	ret

0000000000800104 <vcprintf>:
  800104:	1101                	addi	sp,sp,-32
  800106:	862a                	mv	a2,a0
  800108:	86ae                	mv	a3,a1
  80010a:	00000517          	auipc	a0,0x0
  80010e:	fe050513          	addi	a0,a0,-32 # 8000ea <cputch>
  800112:	006c                	addi	a1,sp,12
  800114:	ec06                	sd	ra,24(sp)
  800116:	c602                	sw	zero,12(sp)
  800118:	0e8000ef          	jal	ra,800200 <vprintfmt>
  80011c:	60e2                	ld	ra,24(sp)
  80011e:	4532                	lw	a0,12(sp)
  800120:	6105                	addi	sp,sp,32
  800122:	8082                	ret

0000000000800124 <cprintf>:
  800124:	711d                	addi	sp,sp,-96
  800126:	02810313          	addi	t1,sp,40
  80012a:	8e2a                	mv	t3,a0
  80012c:	f42e                	sd	a1,40(sp)
  80012e:	f832                	sd	a2,48(sp)
  800130:	fc36                	sd	a3,56(sp)
  800132:	00000517          	auipc	a0,0x0
  800136:	fb850513          	addi	a0,a0,-72 # 8000ea <cputch>
  80013a:	004c                	addi	a1,sp,4
  80013c:	869a                	mv	a3,t1
  80013e:	8672                	mv	a2,t3
  800140:	ec06                	sd	ra,24(sp)
  800142:	e0ba                	sd	a4,64(sp)
  800144:	e4be                	sd	a5,72(sp)
  800146:	e8c2                	sd	a6,80(sp)
  800148:	ecc6                	sd	a7,88(sp)
  80014a:	e41a                	sd	t1,8(sp)
  80014c:	c202                	sw	zero,4(sp)
  80014e:	0b2000ef          	jal	ra,800200 <vprintfmt>
  800152:	60e2                	ld	ra,24(sp)
  800154:	4512                	lw	a0,4(sp)
  800156:	6125                	addi	sp,sp,96
  800158:	8082                	ret

000000000080015a <umain>:
  80015a:	1141                	addi	sp,sp,-16
  80015c:	e406                	sd	ra,8(sp)
  80015e:	584000ef          	jal	ra,8006e2 <main>
  800162:	f5fff0ef          	jal	ra,8000c0 <exit>

0000000000800166 <strnlen>:
  800166:	872a                	mv	a4,a0
  800168:	4501                	li	a0,0
  80016a:	e589                	bnez	a1,800174 <strnlen+0xe>
  80016c:	a811                	j	800180 <strnlen+0x1a>
  80016e:	0505                	addi	a0,a0,1
  800170:	00a58763          	beq	a1,a0,80017e <strnlen+0x18>
  800174:	00a707b3          	add	a5,a4,a0
  800178:	0007c783          	lbu	a5,0(a5)
  80017c:	fbed                	bnez	a5,80016e <strnlen+0x8>
  80017e:	8082                	ret
  800180:	8082                	ret

0000000000800182 <memset>:
  800182:	ca01                	beqz	a2,800192 <memset+0x10>
  800184:	962a                	add	a2,a2,a0
  800186:	87aa                	mv	a5,a0
  800188:	0785                	addi	a5,a5,1
  80018a:	feb78fa3          	sb	a1,-1(a5)
  80018e:	fec79de3          	bne	a5,a2,800188 <memset+0x6>
  800192:	8082                	ret

0000000000800194 <printnum>:
  800194:	02069813          	slli	a6,a3,0x20
  800198:	7179                	addi	sp,sp,-48
  80019a:	02085813          	srli	a6,a6,0x20
  80019e:	e052                	sd	s4,0(sp)
  8001a0:	03067a33          	remu	s4,a2,a6
  8001a4:	f022                	sd	s0,32(sp)
  8001a6:	ec26                	sd	s1,24(sp)
  8001a8:	e84a                	sd	s2,16(sp)
  8001aa:	f406                	sd	ra,40(sp)
  8001ac:	e44e                	sd	s3,8(sp)
  8001ae:	84aa                	mv	s1,a0
  8001b0:	892e                	mv	s2,a1
  8001b2:	fff7041b          	addiw	s0,a4,-1
  8001b6:	2a01                	sext.w	s4,s4
  8001b8:	03067e63          	bgeu	a2,a6,8001f4 <printnum+0x60>
  8001bc:	89be                	mv	s3,a5
  8001be:	00805763          	blez	s0,8001cc <printnum+0x38>
  8001c2:	347d                	addiw	s0,s0,-1
  8001c4:	85ca                	mv	a1,s2
  8001c6:	854e                	mv	a0,s3
  8001c8:	9482                	jalr	s1
  8001ca:	fc65                	bnez	s0,8001c2 <printnum+0x2e>
  8001cc:	1a02                	slli	s4,s4,0x20
  8001ce:	020a5a13          	srli	s4,s4,0x20
  8001d2:	00000797          	auipc	a5,0x0
  8001d6:	60e78793          	addi	a5,a5,1550 # 8007e0 <main+0xfe>
  8001da:	7402                	ld	s0,32(sp)
  8001dc:	9a3e                	add	s4,s4,a5
  8001de:	000a4503          	lbu	a0,0(s4)
  8001e2:	70a2                	ld	ra,40(sp)
  8001e4:	69a2                	ld	s3,8(sp)
  8001e6:	6a02                	ld	s4,0(sp)
  8001e8:	85ca                	mv	a1,s2
  8001ea:	8326                	mv	t1,s1
  8001ec:	6942                	ld	s2,16(sp)
  8001ee:	64e2                	ld	s1,24(sp)
  8001f0:	6145                	addi	sp,sp,48
  8001f2:	8302                	jr	t1
  8001f4:	03065633          	divu	a2,a2,a6
  8001f8:	8722                	mv	a4,s0
  8001fa:	f9bff0ef          	jal	ra,800194 <printnum>
  8001fe:	b7f9                	j	8001cc <printnum+0x38>

0000000000800200 <vprintfmt>:
  800200:	7119                	addi	sp,sp,-128
  800202:	f4a6                	sd	s1,104(sp)
  800204:	f0ca                	sd	s2,96(sp)
  800206:	ecce                	sd	s3,88(sp)
  800208:	e8d2                	sd	s4,80(sp)
  80020a:	e4d6                	sd	s5,72(sp)
  80020c:	e0da                	sd	s6,64(sp)
  80020e:	fc5e                	sd	s7,56(sp)
  800210:	f06a                	sd	s10,32(sp)
  800212:	fc86                	sd	ra,120(sp)
  800214:	f8a2                	sd	s0,112(sp)
  800216:	f862                	sd	s8,48(sp)
  800218:	f466                	sd	s9,40(sp)
  80021a:	ec6e                	sd	s11,24(sp)
  80021c:	892a                	mv	s2,a0
  80021e:	84ae                	mv	s1,a1
  800220:	8d32                	mv	s10,a2
  800222:	8a36                	mv	s4,a3
  800224:	02500993          	li	s3,37
  800228:	5b7d                	li	s6,-1
  80022a:	00000a97          	auipc	s5,0x0
  80022e:	5eaa8a93          	addi	s5,s5,1514 # 800814 <main+0x132>
  800232:	00000b97          	auipc	s7,0x0
  800236:	7feb8b93          	addi	s7,s7,2046 # 800a30 <error_string>
  80023a:	000d4503          	lbu	a0,0(s10)
  80023e:	001d0413          	addi	s0,s10,1
  800242:	01350a63          	beq	a0,s3,800256 <vprintfmt+0x56>
  800246:	c121                	beqz	a0,800286 <vprintfmt+0x86>
  800248:	85a6                	mv	a1,s1
  80024a:	0405                	addi	s0,s0,1
  80024c:	9902                	jalr	s2
  80024e:	fff44503          	lbu	a0,-1(s0)
  800252:	ff351ae3          	bne	a0,s3,800246 <vprintfmt+0x46>
  800256:	00044603          	lbu	a2,0(s0)
  80025a:	02000793          	li	a5,32
  80025e:	4c81                	li	s9,0
  800260:	4881                	li	a7,0
  800262:	5c7d                	li	s8,-1
  800264:	5dfd                	li	s11,-1
  800266:	05500513          	li	a0,85
  80026a:	4825                	li	a6,9
  80026c:	fdd6059b          	addiw	a1,a2,-35
  800270:	0ff5f593          	andi	a1,a1,255
  800274:	00140d13          	addi	s10,s0,1
  800278:	04b56263          	bltu	a0,a1,8002bc <vprintfmt+0xbc>
  80027c:	058a                	slli	a1,a1,0x2
  80027e:	95d6                	add	a1,a1,s5
  800280:	4194                	lw	a3,0(a1)
  800282:	96d6                	add	a3,a3,s5
  800284:	8682                	jr	a3
  800286:	70e6                	ld	ra,120(sp)
  800288:	7446                	ld	s0,112(sp)
  80028a:	74a6                	ld	s1,104(sp)
  80028c:	7906                	ld	s2,96(sp)
  80028e:	69e6                	ld	s3,88(sp)
  800290:	6a46                	ld	s4,80(sp)
  800292:	6aa6                	ld	s5,72(sp)
  800294:	6b06                	ld	s6,64(sp)
  800296:	7be2                	ld	s7,56(sp)
  800298:	7c42                	ld	s8,48(sp)
  80029a:	7ca2                	ld	s9,40(sp)
  80029c:	7d02                	ld	s10,32(sp)
  80029e:	6de2                	ld	s11,24(sp)
  8002a0:	6109                	addi	sp,sp,128
  8002a2:	8082                	ret
  8002a4:	87b2                	mv	a5,a2
  8002a6:	00144603          	lbu	a2,1(s0)
  8002aa:	846a                	mv	s0,s10
  8002ac:	00140d13          	addi	s10,s0,1
  8002b0:	fdd6059b          	addiw	a1,a2,-35
  8002b4:	0ff5f593          	andi	a1,a1,255
  8002b8:	fcb572e3          	bgeu	a0,a1,80027c <vprintfmt+0x7c>
  8002bc:	85a6                	mv	a1,s1
  8002be:	02500513          	li	a0,37
  8002c2:	9902                	jalr	s2
  8002c4:	fff44783          	lbu	a5,-1(s0)
  8002c8:	8d22                	mv	s10,s0
  8002ca:	f73788e3          	beq	a5,s3,80023a <vprintfmt+0x3a>
  8002ce:	ffed4783          	lbu	a5,-2(s10)
  8002d2:	1d7d                	addi	s10,s10,-1
  8002d4:	ff379de3          	bne	a5,s3,8002ce <vprintfmt+0xce>
  8002d8:	b78d                	j	80023a <vprintfmt+0x3a>
  8002da:	fd060c1b          	addiw	s8,a2,-48
  8002de:	00144603          	lbu	a2,1(s0)
  8002e2:	846a                	mv	s0,s10
  8002e4:	fd06069b          	addiw	a3,a2,-48
  8002e8:	0006059b          	sext.w	a1,a2
  8002ec:	02d86463          	bltu	a6,a3,800314 <vprintfmt+0x114>
  8002f0:	00144603          	lbu	a2,1(s0)
  8002f4:	002c169b          	slliw	a3,s8,0x2
  8002f8:	0186873b          	addw	a4,a3,s8
  8002fc:	0017171b          	slliw	a4,a4,0x1
  800300:	9f2d                	addw	a4,a4,a1
  800302:	fd06069b          	addiw	a3,a2,-48
  800306:	0405                	addi	s0,s0,1
  800308:	fd070c1b          	addiw	s8,a4,-48
  80030c:	0006059b          	sext.w	a1,a2
  800310:	fed870e3          	bgeu	a6,a3,8002f0 <vprintfmt+0xf0>
  800314:	f40ddce3          	bgez	s11,80026c <vprintfmt+0x6c>
  800318:	8de2                	mv	s11,s8
  80031a:	5c7d                	li	s8,-1
  80031c:	bf81                	j	80026c <vprintfmt+0x6c>
  80031e:	fffdc693          	not	a3,s11
  800322:	96fd                	srai	a3,a3,0x3f
  800324:	00ddfdb3          	and	s11,s11,a3
  800328:	00144603          	lbu	a2,1(s0)
  80032c:	2d81                	sext.w	s11,s11
  80032e:	846a                	mv	s0,s10
  800330:	bf35                	j	80026c <vprintfmt+0x6c>
  800332:	000a2c03          	lw	s8,0(s4)
  800336:	00144603          	lbu	a2,1(s0)
  80033a:	0a21                	addi	s4,s4,8
  80033c:	846a                	mv	s0,s10
  80033e:	bfd9                	j	800314 <vprintfmt+0x114>
  800340:	4705                	li	a4,1
  800342:	008a0593          	addi	a1,s4,8
  800346:	01174463          	blt	a4,a7,80034e <vprintfmt+0x14e>
  80034a:	1a088e63          	beqz	a7,800506 <vprintfmt+0x306>
  80034e:	000a3603          	ld	a2,0(s4)
  800352:	46c1                	li	a3,16
  800354:	8a2e                	mv	s4,a1
  800356:	2781                	sext.w	a5,a5
  800358:	876e                	mv	a4,s11
  80035a:	85a6                	mv	a1,s1
  80035c:	854a                	mv	a0,s2
  80035e:	e37ff0ef          	jal	ra,800194 <printnum>
  800362:	bde1                	j	80023a <vprintfmt+0x3a>
  800364:	000a2503          	lw	a0,0(s4)
  800368:	85a6                	mv	a1,s1
  80036a:	0a21                	addi	s4,s4,8
  80036c:	9902                	jalr	s2
  80036e:	b5f1                	j	80023a <vprintfmt+0x3a>
  800370:	4705                	li	a4,1
  800372:	008a0593          	addi	a1,s4,8
  800376:	01174463          	blt	a4,a7,80037e <vprintfmt+0x17e>
  80037a:	18088163          	beqz	a7,8004fc <vprintfmt+0x2fc>
  80037e:	000a3603          	ld	a2,0(s4)
  800382:	46a9                	li	a3,10
  800384:	8a2e                	mv	s4,a1
  800386:	bfc1                	j	800356 <vprintfmt+0x156>
  800388:	00144603          	lbu	a2,1(s0)
  80038c:	4c85                	li	s9,1
  80038e:	846a                	mv	s0,s10
  800390:	bdf1                	j	80026c <vprintfmt+0x6c>
  800392:	85a6                	mv	a1,s1
  800394:	02500513          	li	a0,37
  800398:	9902                	jalr	s2
  80039a:	b545                	j	80023a <vprintfmt+0x3a>
  80039c:	00144603          	lbu	a2,1(s0)
  8003a0:	2885                	addiw	a7,a7,1
  8003a2:	846a                	mv	s0,s10
  8003a4:	b5e1                	j	80026c <vprintfmt+0x6c>
  8003a6:	4705                	li	a4,1
  8003a8:	008a0593          	addi	a1,s4,8
  8003ac:	01174463          	blt	a4,a7,8003b4 <vprintfmt+0x1b4>
  8003b0:	14088163          	beqz	a7,8004f2 <vprintfmt+0x2f2>
  8003b4:	000a3603          	ld	a2,0(s4)
  8003b8:	46a1                	li	a3,8
  8003ba:	8a2e                	mv	s4,a1
  8003bc:	bf69                	j	800356 <vprintfmt+0x156>
  8003be:	03000513          	li	a0,48
  8003c2:	85a6                	mv	a1,s1
  8003c4:	e03e                	sd	a5,0(sp)
  8003c6:	9902                	jalr	s2
  8003c8:	85a6                	mv	a1,s1
  8003ca:	07800513          	li	a0,120
  8003ce:	9902                	jalr	s2
  8003d0:	0a21                	addi	s4,s4,8
  8003d2:	6782                	ld	a5,0(sp)
  8003d4:	46c1                	li	a3,16
  8003d6:	ff8a3603          	ld	a2,-8(s4)
  8003da:	bfb5                	j	800356 <vprintfmt+0x156>
  8003dc:	000a3403          	ld	s0,0(s4)
  8003e0:	008a0713          	addi	a4,s4,8
  8003e4:	e03a                	sd	a4,0(sp)
  8003e6:	14040263          	beqz	s0,80052a <vprintfmt+0x32a>
  8003ea:	0fb05763          	blez	s11,8004d8 <vprintfmt+0x2d8>
  8003ee:	02d00693          	li	a3,45
  8003f2:	0cd79163          	bne	a5,a3,8004b4 <vprintfmt+0x2b4>
  8003f6:	00044783          	lbu	a5,0(s0)
  8003fa:	0007851b          	sext.w	a0,a5
  8003fe:	cf85                	beqz	a5,800436 <vprintfmt+0x236>
  800400:	00140a13          	addi	s4,s0,1
  800404:	05e00413          	li	s0,94
  800408:	000c4563          	bltz	s8,800412 <vprintfmt+0x212>
  80040c:	3c7d                	addiw	s8,s8,-1
  80040e:	036c0263          	beq	s8,s6,800432 <vprintfmt+0x232>
  800412:	85a6                	mv	a1,s1
  800414:	0e0c8e63          	beqz	s9,800510 <vprintfmt+0x310>
  800418:	3781                	addiw	a5,a5,-32
  80041a:	0ef47b63          	bgeu	s0,a5,800510 <vprintfmt+0x310>
  80041e:	03f00513          	li	a0,63
  800422:	9902                	jalr	s2
  800424:	000a4783          	lbu	a5,0(s4)
  800428:	3dfd                	addiw	s11,s11,-1
  80042a:	0a05                	addi	s4,s4,1
  80042c:	0007851b          	sext.w	a0,a5
  800430:	ffe1                	bnez	a5,800408 <vprintfmt+0x208>
  800432:	01b05963          	blez	s11,800444 <vprintfmt+0x244>
  800436:	3dfd                	addiw	s11,s11,-1
  800438:	85a6                	mv	a1,s1
  80043a:	02000513          	li	a0,32
  80043e:	9902                	jalr	s2
  800440:	fe0d9be3          	bnez	s11,800436 <vprintfmt+0x236>
  800444:	6a02                	ld	s4,0(sp)
  800446:	bbd5                	j	80023a <vprintfmt+0x3a>
  800448:	4705                	li	a4,1
  80044a:	008a0c93          	addi	s9,s4,8
  80044e:	01174463          	blt	a4,a7,800456 <vprintfmt+0x256>
  800452:	08088d63          	beqz	a7,8004ec <vprintfmt+0x2ec>
  800456:	000a3403          	ld	s0,0(s4)
  80045a:	0a044d63          	bltz	s0,800514 <vprintfmt+0x314>
  80045e:	8622                	mv	a2,s0
  800460:	8a66                	mv	s4,s9
  800462:	46a9                	li	a3,10
  800464:	bdcd                	j	800356 <vprintfmt+0x156>
  800466:	000a2783          	lw	a5,0(s4)
  80046a:	4761                	li	a4,24
  80046c:	0a21                	addi	s4,s4,8
  80046e:	41f7d69b          	sraiw	a3,a5,0x1f
  800472:	8fb5                	xor	a5,a5,a3
  800474:	40d786bb          	subw	a3,a5,a3
  800478:	02d74163          	blt	a4,a3,80049a <vprintfmt+0x29a>
  80047c:	00369793          	slli	a5,a3,0x3
  800480:	97de                	add	a5,a5,s7
  800482:	639c                	ld	a5,0(a5)
  800484:	cb99                	beqz	a5,80049a <vprintfmt+0x29a>
  800486:	86be                	mv	a3,a5
  800488:	00000617          	auipc	a2,0x0
  80048c:	38860613          	addi	a2,a2,904 # 800810 <main+0x12e>
  800490:	85a6                	mv	a1,s1
  800492:	854a                	mv	a0,s2
  800494:	0ce000ef          	jal	ra,800562 <printfmt>
  800498:	b34d                	j	80023a <vprintfmt+0x3a>
  80049a:	00000617          	auipc	a2,0x0
  80049e:	36660613          	addi	a2,a2,870 # 800800 <main+0x11e>
  8004a2:	85a6                	mv	a1,s1
  8004a4:	854a                	mv	a0,s2
  8004a6:	0bc000ef          	jal	ra,800562 <printfmt>
  8004aa:	bb41                	j	80023a <vprintfmt+0x3a>
  8004ac:	00000417          	auipc	s0,0x0
  8004b0:	34c40413          	addi	s0,s0,844 # 8007f8 <main+0x116>
  8004b4:	85e2                	mv	a1,s8
  8004b6:	8522                	mv	a0,s0
  8004b8:	e43e                	sd	a5,8(sp)
  8004ba:	cadff0ef          	jal	ra,800166 <strnlen>
  8004be:	40ad8dbb          	subw	s11,s11,a0
  8004c2:	01b05b63          	blez	s11,8004d8 <vprintfmt+0x2d8>
  8004c6:	67a2                	ld	a5,8(sp)
  8004c8:	00078a1b          	sext.w	s4,a5
  8004cc:	3dfd                	addiw	s11,s11,-1
  8004ce:	85a6                	mv	a1,s1
  8004d0:	8552                	mv	a0,s4
  8004d2:	9902                	jalr	s2
  8004d4:	fe0d9ce3          	bnez	s11,8004cc <vprintfmt+0x2cc>
  8004d8:	00044783          	lbu	a5,0(s0)
  8004dc:	00140a13          	addi	s4,s0,1
  8004e0:	0007851b          	sext.w	a0,a5
  8004e4:	d3a5                	beqz	a5,800444 <vprintfmt+0x244>
  8004e6:	05e00413          	li	s0,94
  8004ea:	bf39                	j	800408 <vprintfmt+0x208>
  8004ec:	000a2403          	lw	s0,0(s4)
  8004f0:	b7ad                	j	80045a <vprintfmt+0x25a>
  8004f2:	000a6603          	lwu	a2,0(s4)
  8004f6:	46a1                	li	a3,8
  8004f8:	8a2e                	mv	s4,a1
  8004fa:	bdb1                	j	800356 <vprintfmt+0x156>
  8004fc:	000a6603          	lwu	a2,0(s4)
  800500:	46a9                	li	a3,10
  800502:	8a2e                	mv	s4,a1
  800504:	bd89                	j	800356 <vprintfmt+0x156>
  800506:	000a6603          	lwu	a2,0(s4)
  80050a:	46c1                	li	a3,16
  80050c:	8a2e                	mv	s4,a1
  80050e:	b5a1                	j	800356 <vprintfmt+0x156>
  800510:	9902                	jalr	s2
  800512:	bf09                	j	800424 <vprintfmt+0x224>
  800514:	85a6                	mv	a1,s1
  800516:	02d00513          	li	a0,45
  80051a:	e03e                	sd	a5,0(sp)
  80051c:	9902                	jalr	s2
  80051e:	6782                	ld	a5,0(sp)
  800520:	8a66                	mv	s4,s9
  800522:	40800633          	neg	a2,s0
  800526:	46a9                	li	a3,10
  800528:	b53d                	j	800356 <vprintfmt+0x156>
  80052a:	03b05163          	blez	s11,80054c <vprintfmt+0x34c>
  80052e:	02d00693          	li	a3,45
  800532:	f6d79de3          	bne	a5,a3,8004ac <vprintfmt+0x2ac>
  800536:	00000417          	auipc	s0,0x0
  80053a:	2c240413          	addi	s0,s0,706 # 8007f8 <main+0x116>
  80053e:	02800793          	li	a5,40
  800542:	02800513          	li	a0,40
  800546:	00140a13          	addi	s4,s0,1
  80054a:	bd6d                	j	800404 <vprintfmt+0x204>
  80054c:	00000a17          	auipc	s4,0x0
  800550:	2ada0a13          	addi	s4,s4,685 # 8007f9 <main+0x117>
  800554:	02800513          	li	a0,40
  800558:	02800793          	li	a5,40
  80055c:	05e00413          	li	s0,94
  800560:	b565                	j	800408 <vprintfmt+0x208>

0000000000800562 <printfmt>:
  800562:	715d                	addi	sp,sp,-80
  800564:	02810313          	addi	t1,sp,40
  800568:	f436                	sd	a3,40(sp)
  80056a:	869a                	mv	a3,t1
  80056c:	ec06                	sd	ra,24(sp)
  80056e:	f83a                	sd	a4,48(sp)
  800570:	fc3e                	sd	a5,56(sp)
  800572:	e0c2                	sd	a6,64(sp)
  800574:	e4c6                	sd	a7,72(sp)
  800576:	e41a                	sd	t1,8(sp)
  800578:	c89ff0ef          	jal	ra,800200 <vprintfmt>
  80057c:	60e2                	ld	ra,24(sp)
  80057e:	6161                	addi	sp,sp,80
  800580:	8082                	ret

0000000000800582 <rand>:
  800582:	00001697          	auipc	a3,0x1
  800586:	a7e68693          	addi	a3,a3,-1410 # 801000 <next>
  80058a:	629c                	ld	a5,0(a3)
  80058c:	00000717          	auipc	a4,0x0
  800590:	5ec73703          	ld	a4,1516(a4) # 800b78 <error_string+0x148>
  800594:	02e787b3          	mul	a5,a5,a4
  800598:	80000737          	lui	a4,0x80000
  80059c:	fff74713          	not	a4,a4
  8005a0:	07ad                	addi	a5,a5,11
  8005a2:	07c2                	slli	a5,a5,0x10
  8005a4:	83c1                	srli	a5,a5,0x10
  8005a6:	00c7d513          	srli	a0,a5,0xc
  8005aa:	02e57533          	remu	a0,a0,a4
  8005ae:	e29c                	sd	a5,0(a3)
  8005b0:	2505                	addiw	a0,a0,1
  8005b2:	8082                	ret

00000000008005b4 <srand>:
  8005b4:	1502                	slli	a0,a0,0x20
  8005b6:	9101                	srli	a0,a0,0x20
  8005b8:	00001797          	auipc	a5,0x1
  8005bc:	a4a7b423          	sd	a0,-1464(a5) # 801000 <next>
  8005c0:	8082                	ret

00000000008005c2 <work>:
  8005c2:	7179                	addi	sp,sp,-48
  8005c4:	ec26                	sd	s1,24(sp)
  8005c6:	00001497          	auipc	s1,0x1
  8005ca:	a4248493          	addi	s1,s1,-1470 # 801008 <mata>
  8005ce:	f022                	sd	s0,32(sp)
  8005d0:	e84a                	sd	s2,16(sp)
  8005d2:	e44e                	sd	s3,8(sp)
  8005d4:	f406                	sd	ra,40(sp)
  8005d6:	89aa                	mv	s3,a0
  8005d8:	00001917          	auipc	s2,0x1
  8005dc:	bc090913          	addi	s2,s2,-1088 # 801198 <matb>
  8005e0:	00001597          	auipc	a1,0x1
  8005e4:	be058593          	addi	a1,a1,-1056 # 8011c0 <matb+0x28>
  8005e8:	00001417          	auipc	s0,0x1
  8005ec:	d6840413          	addi	s0,s0,-664 # 801350 <matc+0x28>
  8005f0:	8626                	mv	a2,s1
  8005f2:	4685                	li	a3,1
  8005f4:	fd858793          	addi	a5,a1,-40
  8005f8:	8732                	mv	a4,a2
  8005fa:	c394                	sw	a3,0(a5)
  8005fc:	c314                	sw	a3,0(a4)
  8005fe:	0791                	addi	a5,a5,4
  800600:	0711                	addi	a4,a4,4
  800602:	feb79ce3          	bne	a5,a1,8005fa <work+0x38>
  800606:	02878593          	addi	a1,a5,40
  80060a:	02860613          	addi	a2,a2,40
  80060e:	fe8593e3          	bne	a1,s0,8005f4 <work+0x32>
  800612:	acdff0ef          	jal	ra,8000de <yield>
  800616:	acdff0ef          	jal	ra,8000e2 <getpid>
  80061a:	85aa                	mv	a1,a0
  80061c:	864e                	mv	a2,s3
  80061e:	00000517          	auipc	a0,0x0
  800622:	4da50513          	addi	a0,a0,1242 # 800af8 <error_string+0xc8>
  800626:	affff0ef          	jal	ra,800124 <cprintf>
  80062a:	fff9839b          	addiw	t2,s3,-1
  80062e:	00001297          	auipc	t0,0x1
  800632:	e8a28293          	addi	t0,t0,-374 # 8014b8 <matc+0x190>
  800636:	00001f97          	auipc	t6,0x1
  80063a:	b62f8f93          	addi	t6,t6,-1182 # 801198 <matb>
  80063e:	00001f17          	auipc	t5,0x1
  800642:	ceaf0f13          	addi	t5,t5,-790 # 801328 <matc>
  800646:	02800e13          	li	t3,40
  80064a:	50fd                	li	ra,-1
  80064c:	06098f63          	beqz	s3,8006ca <work+0x108>
  800650:	00001897          	auipc	a7,0x1
  800654:	cd888893          	addi	a7,a7,-808 # 801328 <matc>
  800658:	8ec6                	mv	t4,a7
  80065a:	8326                	mv	t1,s1
  80065c:	857a                	mv	a0,t5
  80065e:	8876                	mv	a6,t4
  800660:	e7050793          	addi	a5,a0,-400
  800664:	869a                	mv	a3,t1
  800666:	4601                	li	a2,0
  800668:	4298                	lw	a4,0(a3)
  80066a:	438c                	lw	a1,0(a5)
  80066c:	02878793          	addi	a5,a5,40
  800670:	0691                	addi	a3,a3,4
  800672:	02b7073b          	mulw	a4,a4,a1
  800676:	9e39                	addw	a2,a2,a4
  800678:	fea798e3          	bne	a5,a0,800668 <work+0xa6>
  80067c:	00c82023          	sw	a2,0(a6)
  800680:	00478513          	addi	a0,a5,4
  800684:	0811                	addi	a6,a6,4
  800686:	fc851de3          	bne	a0,s0,800660 <work+0x9e>
  80068a:	02830313          	addi	t1,t1,40
  80068e:	028e8e93          	addi	t4,t4,40
  800692:	fc6f95e3          	bne	t6,t1,80065c <work+0x9a>
  800696:	8526                	mv	a0,s1
  800698:	85ca                	mv	a1,s2
  80069a:	4781                	li	a5,0
  80069c:	00f88733          	add	a4,a7,a5
  8006a0:	4318                	lw	a4,0(a4)
  8006a2:	00f58633          	add	a2,a1,a5
  8006a6:	00f506b3          	add	a3,a0,a5
  8006aa:	c218                	sw	a4,0(a2)
  8006ac:	c298                	sw	a4,0(a3)
  8006ae:	0791                	addi	a5,a5,4
  8006b0:	ffc796e3          	bne	a5,t3,80069c <work+0xda>
  8006b4:	02888893          	addi	a7,a7,40
  8006b8:	02858593          	addi	a1,a1,40
  8006bc:	02850513          	addi	a0,a0,40
  8006c0:	fc589de3          	bne	a7,t0,80069a <work+0xd8>
  8006c4:	33fd                	addiw	t2,t2,-1
  8006c6:	f81395e3          	bne	t2,ra,800650 <work+0x8e>
  8006ca:	a19ff0ef          	jal	ra,8000e2 <getpid>
  8006ce:	85aa                	mv	a1,a0
  8006d0:	00000517          	auipc	a0,0x0
  8006d4:	44850513          	addi	a0,a0,1096 # 800b18 <error_string+0xe8>
  8006d8:	a4dff0ef          	jal	ra,800124 <cprintf>
  8006dc:	4501                	li	a0,0
  8006de:	9e3ff0ef          	jal	ra,8000c0 <exit>

00000000008006e2 <main>:
  8006e2:	7175                	addi	sp,sp,-144
  8006e4:	f4ce                	sd	s3,104(sp)
  8006e6:	05400613          	li	a2,84
  8006ea:	4581                	li	a1,0
  8006ec:	0028                	addi	a0,sp,8
  8006ee:	00810993          	addi	s3,sp,8
  8006f2:	e122                	sd	s0,128(sp)
  8006f4:	fca6                	sd	s1,120(sp)
  8006f6:	f8ca                	sd	s2,112(sp)
  8006f8:	e506                	sd	ra,136(sp)
  8006fa:	84ce                	mv	s1,s3
  8006fc:	a87ff0ef          	jal	ra,800182 <memset>
  800700:	4401                	li	s0,0
  800702:	4955                	li	s2,21
  800704:	9d3ff0ef          	jal	ra,8000d6 <fork>
  800708:	c088                	sw	a0,0(s1)
  80070a:	cd2d                	beqz	a0,800784 <main+0xa2>
  80070c:	04054663          	bltz	a0,800758 <main+0x76>
  800710:	2405                	addiw	s0,s0,1
  800712:	0491                	addi	s1,s1,4
  800714:	ff2418e3          	bne	s0,s2,800704 <main+0x22>
  800718:	00000517          	auipc	a0,0x0
  80071c:	41050513          	addi	a0,a0,1040 # 800b28 <error_string+0xf8>
  800720:	a05ff0ef          	jal	ra,800124 <cprintf>
  800724:	4455                	li	s0,21
  800726:	9b3ff0ef          	jal	ra,8000d8 <wait>
  80072a:	e10d                	bnez	a0,80074c <main+0x6a>
  80072c:	347d                	addiw	s0,s0,-1
  80072e:	fc65                	bnez	s0,800726 <main+0x44>
  800730:	00000517          	auipc	a0,0x0
  800734:	41850513          	addi	a0,a0,1048 # 800b48 <error_string+0x118>
  800738:	9edff0ef          	jal	ra,800124 <cprintf>
  80073c:	60aa                	ld	ra,136(sp)
  80073e:	640a                	ld	s0,128(sp)
  800740:	74e6                	ld	s1,120(sp)
  800742:	7946                	ld	s2,112(sp)
  800744:	79a6                	ld	s3,104(sp)
  800746:	4501                	li	a0,0
  800748:	6149                	addi	sp,sp,144
  80074a:	8082                	ret
  80074c:	00000517          	auipc	a0,0x0
  800750:	3ec50513          	addi	a0,a0,1004 # 800b38 <error_string+0x108>
  800754:	9d1ff0ef          	jal	ra,800124 <cprintf>
  800758:	08e0                	addi	s0,sp,92
  80075a:	0009a503          	lw	a0,0(s3)
  80075e:	00a05463          	blez	a0,800766 <main+0x84>
  800762:	97fff0ef          	jal	ra,8000e0 <kill>
  800766:	0991                	addi	s3,s3,4
  800768:	fe8999e3          	bne	s3,s0,80075a <main+0x78>
  80076c:	00000617          	auipc	a2,0x0
  800770:	3ec60613          	addi	a2,a2,1004 # 800b58 <error_string+0x128>
  800774:	05200593          	li	a1,82
  800778:	00000517          	auipc	a0,0x0
  80077c:	3f050513          	addi	a0,a0,1008 # 800b68 <error_string+0x138>
  800780:	8a1ff0ef          	jal	ra,800020 <__panic>
  800784:	0284053b          	mulw	a0,s0,s0
  800788:	e2dff0ef          	jal	ra,8005b4 <srand>
  80078c:	df7ff0ef          	jal	ra,800582 <rand>
  800790:	47d5                	li	a5,21
  800792:	02f577bb          	remuw	a5,a0,a5
  800796:	06400513          	li	a0,100
  80079a:	02f787bb          	mulw	a5,a5,a5
  80079e:	27a9                	addiw	a5,a5,10
  8007a0:	02f5053b          	mulw	a0,a0,a5
  8007a4:	e1fff0ef          	jal	ra,8005c2 <work>
