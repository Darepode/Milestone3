
../02_test/test_assembly.o:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	00000013          	nop
   4:	00007437          	lui	s0,0x7
   8:	01040413          	addi	s0,s0,16 # 7010 <delay_loop+0x688c>
   c:	0ff00493          	li	s1,255
  10:	00942023          	sw	s1,0(s0)

00000014 <power_reset_lcd>:
  14:	00007137          	lui	sp,0x7
  18:	03010113          	addi	sp,sp,48 # 7030 <delay_loop+0x68ac>
  1c:	c00001b7          	lui	gp,0xc0000
  20:	00312023          	sw	gp,0(sp)
  24:	0001f1b7          	lui	gp,0x1f
  28:	84718193          	addi	gp,gp,-1977 # 1e847 <delay_loop+0x1e0c3>
  2c:	73c000ef          	jal	768 <delay>
  30:	00000213          	li	tp,0
  34:	03000193          	li	gp,48
  38:	0ac000ef          	jal	e4 <out_lcd>
  3c:	000061b7          	lui	gp,0x6
  40:	68918193          	addi	gp,gp,1673 # 6689 <delay_loop+0x5f05>
  44:	724000ef          	jal	768 <delay>
  48:	00000213          	li	tp,0
  4c:	03000193          	li	gp,48
  50:	094000ef          	jal	e4 <out_lcd>
  54:	000031b7          	lui	gp,0x3
  58:	0d318193          	addi	gp,gp,211 # 30d3 <delay_loop+0x294f>
  5c:	70c000ef          	jal	768 <delay>
  60:	00000213          	li	tp,0
  64:	03000193          	li	gp,48
  68:	07c000ef          	jal	e4 <out_lcd>
  6c:	000031b7          	lui	gp,0x3
  70:	0d318193          	addi	gp,gp,211 # 30d3 <delay_loop+0x294f>
  74:	6f4000ef          	jal	768 <delay>

00000078 <init_lcd>:
  78:	00000213          	li	tp,0
  7c:	03800193          	li	gp,56
  80:	064000ef          	jal	e4 <out_lcd>
  84:	27000193          	li	gp,624
  88:	6e0000ef          	jal	768 <delay>
  8c:	00000213          	li	tp,0
  90:	00100193          	li	gp,1
  94:	050000ef          	jal	e4 <out_lcd>
  98:	000031b7          	lui	gp,0x3
  9c:	0d318193          	addi	gp,gp,211 # 30d3 <delay_loop+0x294f>
  a0:	6c8000ef          	jal	768 <delay>
  a4:	00000213          	li	tp,0
  a8:	00c00193          	li	gp,12
  ac:	038000ef          	jal	e4 <out_lcd>
  b0:	27000193          	li	gp,624
  b4:	6b4000ef          	jal	768 <delay>
  b8:	00000213          	li	tp,0
  bc:	00600193          	li	gp,6
  c0:	024000ef          	jal	e4 <out_lcd>
  c4:	27000193          	li	gp,624
  c8:	6a0000ef          	jal	768 <delay>
  cc:	00000213          	li	tp,0
  d0:	08200193          	li	gp,130
  d4:	010000ef          	jal	e4 <out_lcd>
  d8:	27000193          	li	gp,624
  dc:	68c000ef          	jal	768 <delay>
  e0:	1980006f          	j	278 <init_prog>

000000e4 <out_lcd>:
  e4:	00008393          	mv	t2,ra
  e8:	00007137          	lui	sp,0x7
  ec:	03010113          	addi	sp,sp,48 # 7030 <delay_loop+0x68ac>
  f0:	000f0663          	beqz	t5,fc <command>
  f4:	60018193          	addi	gp,gp,1536
  f8:	0080006f          	j	100 <send>

000000fc <command>:
  fc:	40018193          	addi	gp,gp,1024

00000100 <send>:
 100:	00311023          	sh	gp,0(sp)
 104:	27000193          	li	gp,624
 108:	660000ef          	jal	768 <delay>
 10c:	000110a3          	sh	zero,1(sp)
 110:	00038093          	mv	ra,t2
 114:	00a00193          	li	gp,10
 118:	00a00213          	li	tp,10
 11c:	00600393          	li	t2,6
 120:	00007137          	lui	sp,0x7
 124:	02010113          	addi	sp,sp,32 # 7020 <delay_loop+0x689c>
 128:	00008067          	ret

0000012c <lap>:
 12c:	00008713          	mv	a4,ra

00000130 <P_WAIT1>:
 130:	00040583          	lb	a1,0(s0)
 134:	0045f613          	andi	a2,a1,4
 138:	fe061ce3          	bnez	a2,130 <P_WAIT1>
 13c:	640000ef          	jal	77c <delay_10ms>
 140:	63c000ef          	jal	77c <delay_10ms>
 144:	00040583          	lb	a1,0(s0)
 148:	0045f613          	andi	a2,a1,4
 14c:	fe0612e3          	bnez	a2,130 <P_WAIT1>

00000150 <R_WAIT1>:
 150:	00040583          	lb	a1,0(s0)
 154:	0045f613          	andi	a2,a1,4
 158:	fe060ce3          	beqz	a2,150 <R_WAIT1>
 15c:	620000ef          	jal	77c <delay_10ms>
 160:	61c000ef          	jal	77c <delay_10ms>
 164:	00040583          	lb	a1,0(s0)
 168:	0045f613          	andi	a2,a1,4
 16c:	fe0602e3          	beqz	a2,150 <R_WAIT1>
 170:	00100f13          	li	t5,1
 174:	000e8193          	mv	gp,t4
 178:	f6dff0ef          	jal	e4 <out_lcd>
 17c:	27000193          	li	gp,624
 180:	5e8000ef          	jal	768 <delay>
 184:	00100f13          	li	t5,1
 188:	000e0193          	mv	gp,t3
 18c:	f59ff0ef          	jal	e4 <out_lcd>
 190:	27000193          	li	gp,624
 194:	5d4000ef          	jal	768 <delay>
 198:	00100f13          	li	t5,1
 19c:	03a00193          	li	gp,58
 1a0:	f45ff0ef          	jal	e4 <out_lcd>
 1a4:	27000193          	li	gp,624
 1a8:	5c0000ef          	jal	768 <delay>
 1ac:	00100f13          	li	t5,1
 1b0:	00098193          	mv	gp,s3
 1b4:	f31ff0ef          	jal	e4 <out_lcd>
 1b8:	27000193          	li	gp,624
 1bc:	5ac000ef          	jal	768 <delay>
 1c0:	00100f13          	li	t5,1
 1c4:	00090193          	mv	gp,s2
 1c8:	f1dff0ef          	jal	e4 <out_lcd>
 1cc:	27000193          	li	gp,624
 1d0:	598000ef          	jal	768 <delay>
 1d4:	00100f13          	li	t5,1
 1d8:	03a00193          	li	gp,58
 1dc:	f09ff0ef          	jal	e4 <out_lcd>
 1e0:	27000193          	li	gp,624
 1e4:	584000ef          	jal	768 <delay>
 1e8:	00100f13          	li	t5,1
 1ec:	00088193          	mv	gp,a7
 1f0:	ef5ff0ef          	jal	e4 <out_lcd>
 1f4:	27000193          	li	gp,624
 1f8:	570000ef          	jal	768 <delay>
 1fc:	00100f13          	li	t5,1
 200:	00080193          	mv	gp,a6
 204:	ee1ff0ef          	jal	e4 <out_lcd>
 208:	27000193          	li	gp,624
 20c:	55c000ef          	jal	768 <delay>
 210:	00100f13          	li	t5,1
 214:	03a00193          	li	gp,58
 218:	ecdff0ef          	jal	e4 <out_lcd>
 21c:	27000193          	li	gp,624
 220:	548000ef          	jal	768 <delay>
 224:	00100f13          	li	t5,1
 228:	00078193          	mv	gp,a5
 22c:	eb9ff0ef          	jal	e4 <out_lcd>
 230:	27000193          	li	gp,624
 234:	534000ef          	jal	768 <delay>
 238:	00100f13          	li	t5,1
 23c:	00048193          	mv	gp,s1
 240:	ea5ff0ef          	jal	e4 <out_lcd>
 244:	27000193          	li	gp,624
 248:	520000ef          	jal	768 <delay>
 24c:	000f9863          	bnez	t6,25c <row2>
 250:	08200193          	li	gp,130
 254:	00100f93          	li	t6,1
 258:	00c0006f          	j	264 <movecur>

0000025c <row2>:
 25c:	0c200193          	li	gp,194
 260:	00000f93          	li	t6,0

00000264 <movecur>:
 264:	00000f13          	li	t5,0
 268:	e7dff0ef          	jal	e4 <out_lcd>
 26c:	27000193          	li	gp,624
 270:	4f8000ef          	jal	768 <delay>
 274:	00070067          	jr	a4

00000278 <init_prog>:
 278:	00a00193          	li	gp,10
 27c:	00a00213          	li	tp,10
 280:	00600393          	li	t2,6
 284:	00000a13          	li	s4,0
 288:	00000a93          	li	s5,0
 28c:	00000b13          	li	s6,0
 290:	00000b93          	li	s7,0
 294:	00000c13          	li	s8,0
 298:	00000c93          	li	s9,0
 29c:	00000d13          	li	s10,0
 2a0:	00000d93          	li	s11,0
 2a4:	03000493          	li	s1,48
 2a8:	03000793          	li	a5,48
 2ac:	03000813          	li	a6,48
 2b0:	03000893          	li	a7,48
 2b4:	03000913          	li	s2,48
 2b8:	03000993          	li	s3,48
 2bc:	03000e13          	li	t3,48
 2c0:	03000e93          	li	t4,48
 2c4:	00100f93          	li	t6,1
 2c8:	00007137          	lui	sp,0x7
 2cc:	02010113          	addi	sp,sp,32 # 7020 <delay_loop+0x689c>
 2d0:	00008437          	lui	s0,0x8
 2d4:	81040413          	addi	s0,s0,-2032 # 7810 <delay_loop+0x708c>
 2d8:	000a0513          	mv	a0,s4
 2dc:	388000ef          	jal	664 <seven_seg_decode>
 2e0:	00610023          	sb	t1,0(sp)
 2e4:	000a8513          	mv	a0,s5
 2e8:	37c000ef          	jal	664 <seven_seg_decode>
 2ec:	006100a3          	sb	t1,1(sp)
 2f0:	000b0513          	mv	a0,s6
 2f4:	370000ef          	jal	664 <seven_seg_decode>
 2f8:	00610123          	sb	t1,2(sp)
 2fc:	000b8513          	mv	a0,s7
 300:	364000ef          	jal	664 <seven_seg_decode>
 304:	006101a3          	sb	t1,3(sp)
 308:	000c0513          	mv	a0,s8
 30c:	358000ef          	jal	664 <seven_seg_decode>
 310:	00610223          	sb	t1,4(sp)
 314:	000c8513          	mv	a0,s9
 318:	34c000ef          	jal	664 <seven_seg_decode>
 31c:	006102a3          	sb	t1,5(sp)
 320:	000d0513          	mv	a0,s10
 324:	340000ef          	jal	664 <seven_seg_decode>
 328:	00610323          	sb	t1,6(sp)
 32c:	000d8513          	mv	a0,s11
 330:	334000ef          	jal	664 <seven_seg_decode>
 334:	006103a3          	sb	t1,7(sp)
 338:	1e00076f          	jal	a4,518 <init_start>

0000033c <here>:
 33c:	00040583          	lb	a1,0(s0)
 340:	0085f613          	andi	a2,a1,8
 344:	00061463          	bnez	a2,34c <check1>
 348:	17c000ef          	jal	4c4 <stop>

0000034c <check1>:
 34c:	00040583          	lb	a1,0(s0)
 350:	0045f613          	andi	a2,a1,4
 354:	00061463          	bnez	a2,35c <skip>
 358:	dd5ff0ef          	jal	12c <lap>

0000035c <skip>:
 35c:	000a0513          	mv	a0,s4
 360:	030a0493          	addi	s1,s4,48
 364:	300000ef          	jal	664 <seven_seg_decode>
 368:	00610023          	sb	t1,0(sp)
 36c:	001a0a13          	addi	s4,s4,1
 370:	40c000ef          	jal	77c <delay_10ms>
 374:	fc3a14e3          	bne	s4,gp,33c <here>
 378:	00000a13          	li	s4,0
 37c:	000a0513          	mv	a0,s4
 380:	030a0493          	addi	s1,s4,48
 384:	2e0000ef          	jal	664 <seven_seg_decode>
 388:	00610023          	sb	t1,0(sp)
 38c:	001a8a93          	addi	s5,s5,1
 390:	000a8513          	mv	a0,s5
 394:	030a8793          	addi	a5,s5,48
 398:	2cc000ef          	jal	664 <seven_seg_decode>
 39c:	006100a3          	sb	t1,1(sp)
 3a0:	f9521ee3          	bne	tp,s5,33c <here>
 3a4:	00000a93          	li	s5,0
 3a8:	000a8513          	mv	a0,s5
 3ac:	030a8793          	addi	a5,s5,48
 3b0:	2b4000ef          	jal	664 <seven_seg_decode>
 3b4:	006100a3          	sb	t1,1(sp)
 3b8:	001b0b13          	addi	s6,s6,1
 3bc:	000b0513          	mv	a0,s6
 3c0:	030b0813          	addi	a6,s6,48
 3c4:	2a0000ef          	jal	664 <seven_seg_decode>
 3c8:	00610123          	sb	t1,2(sp)
 3cc:	f76218e3          	bne	tp,s6,33c <here>
 3d0:	00000b13          	li	s6,0
 3d4:	000b0513          	mv	a0,s6
 3d8:	030b0813          	addi	a6,s6,48
 3dc:	288000ef          	jal	664 <seven_seg_decode>
 3e0:	00610123          	sb	t1,2(sp)
 3e4:	001b8b93          	addi	s7,s7,1
 3e8:	000b8513          	mv	a0,s7
 3ec:	030b8893          	addi	a7,s7,48
 3f0:	274000ef          	jal	664 <seven_seg_decode>
 3f4:	006101a3          	sb	t1,3(sp)
 3f8:	f57392e3          	bne	t2,s7,33c <here>
 3fc:	00000b93          	li	s7,0
 400:	000b8513          	mv	a0,s7
 404:	030b8893          	addi	a7,s7,48
 408:	25c000ef          	jal	664 <seven_seg_decode>
 40c:	006101a3          	sb	t1,3(sp)
 410:	001c0c13          	addi	s8,s8,1
 414:	000c0513          	mv	a0,s8
 418:	030c0913          	addi	s2,s8,48
 41c:	248000ef          	jal	664 <seven_seg_decode>
 420:	00610223          	sb	t1,4(sp)
 424:	f1821ce3          	bne	tp,s8,33c <here>
 428:	00000c13          	li	s8,0
 42c:	000c0513          	mv	a0,s8
 430:	030c0913          	addi	s2,s8,48
 434:	230000ef          	jal	664 <seven_seg_decode>
 438:	00610223          	sb	t1,4(sp)
 43c:	001c8c93          	addi	s9,s9,1
 440:	000c8513          	mv	a0,s9
 444:	030c8993          	addi	s3,s9,48
 448:	21c000ef          	jal	664 <seven_seg_decode>
 44c:	006102a3          	sb	t1,5(sp)
 450:	ef9396e3          	bne	t2,s9,33c <here>
 454:	00000c93          	li	s9,0
 458:	000c8513          	mv	a0,s9
 45c:	030c8993          	addi	s3,s9,48
 460:	204000ef          	jal	664 <seven_seg_decode>
 464:	006102a3          	sb	t1,5(sp)
 468:	001d0d13          	addi	s10,s10,1
 46c:	000d0513          	mv	a0,s10
 470:	030d0e13          	addi	t3,s10,48
 474:	1f0000ef          	jal	664 <seven_seg_decode>
 478:	00610323          	sb	t1,6(sp)
 47c:	eda210e3          	bne	tp,s10,33c <here>
 480:	00000d13          	li	s10,0
 484:	000d0513          	mv	a0,s10
 488:	030d0e13          	addi	t3,s10,48
 48c:	1d8000ef          	jal	664 <seven_seg_decode>
 490:	00610323          	sb	t1,6(sp)
 494:	001d8d93          	addi	s11,s11,1
 498:	000d8513          	mv	a0,s11
 49c:	030d8e93          	addi	t4,s11,48
 4a0:	1c4000ef          	jal	664 <seven_seg_decode>
 4a4:	006103a3          	sb	t1,7(sp)
 4a8:	e9b21ae3          	bne	tp,s11,33c <here>
 4ac:	00000d93          	li	s11,0
 4b0:	000d8513          	mv	a0,s11
 4b4:	030d8e93          	addi	t4,s11,48
 4b8:	1ac000ef          	jal	664 <seven_seg_decode>
 4bc:	006103a3          	sb	t1,7(sp)
 4c0:	e7dff06f          	j	33c <here>

000004c4 <stop>:
 4c4:	00008713          	mv	a4,ra
 4c8:	00000693          	li	a3,0

000004cc <P_WAIT>:
 4cc:	00040583          	lb	a1,0(s0)
 4d0:	0025f613          	andi	a2,a1,2
 4d4:	00061463          	bnez	a2,4dc <cont>
 4d8:	050000ef          	jal	528 <reset>

000004dc <cont>:
 4dc:	0085f613          	andi	a2,a1,8
 4e0:	fe0616e3          	bnez	a2,4cc <P_WAIT>
 4e4:	298000ef          	jal	77c <delay_10ms>
 4e8:	294000ef          	jal	77c <delay_10ms>
 4ec:	00040583          	lb	a1,0(s0)
 4f0:	0085f613          	andi	a2,a1,8
 4f4:	fc061ce3          	bnez	a2,4cc <P_WAIT>

000004f8 <R_WAIT>:
 4f8:	00040583          	lb	a1,0(s0)
 4fc:	0085f613          	andi	a2,a1,8
 500:	fe060ce3          	beqz	a2,4f8 <R_WAIT>
 504:	278000ef          	jal	77c <delay_10ms>
 508:	274000ef          	jal	77c <delay_10ms>
 50c:	00040583          	lb	a1,0(s0)
 510:	0085f613          	andi	a2,a1,8
 514:	fe0602e3          	beqz	a2,4f8 <R_WAIT>

00000518 <init_start>:
 518:	00069663          	bnez	a3,524 <run>
 51c:	00168693          	addi	a3,a3,1
 520:	fadff06f          	j	4cc <P_WAIT>

00000524 <run>:
 524:	00070067          	jr	a4

00000528 <reset>:
 528:	00002137          	lui	sp,0x2
 52c:	10010113          	addi	sp,sp,256 # 2100 <delay_loop+0x197c>
 530:	00112023          	sw	ra,0(sp)

00000534 <P_WAIT2>:
 534:	00040583          	lb	a1,0(s0)
 538:	0025f613          	andi	a2,a1,2
 53c:	fe061ce3          	bnez	a2,534 <P_WAIT2>
 540:	23c000ef          	jal	77c <delay_10ms>
 544:	238000ef          	jal	77c <delay_10ms>
 548:	00040583          	lb	a1,0(s0)
 54c:	0025f613          	andi	a2,a1,2
 550:	fe0612e3          	bnez	a2,534 <P_WAIT2>

00000554 <R_WAIT2>:
 554:	00040583          	lb	a1,0(s0)
 558:	0025f613          	andi	a2,a1,2
 55c:	fe060ce3          	beqz	a2,554 <R_WAIT2>
 560:	21c000ef          	jal	77c <delay_10ms>
 564:	218000ef          	jal	77c <delay_10ms>
 568:	00040583          	lb	a1,0(s0)
 56c:	0025f613          	andi	a2,a1,2
 570:	fe0602e3          	beqz	a2,554 <R_WAIT2>
 574:	00000a13          	li	s4,0
 578:	00000a93          	li	s5,0
 57c:	00000b13          	li	s6,0
 580:	00000b93          	li	s7,0
 584:	00000c13          	li	s8,0
 588:	00000c93          	li	s9,0
 58c:	00000d13          	li	s10,0
 590:	00000d93          	li	s11,0
 594:	00007137          	lui	sp,0x7
 598:	02010113          	addi	sp,sp,32 # 7020 <delay_loop+0x689c>
 59c:	000a0513          	mv	a0,s4
 5a0:	0c4000ef          	jal	664 <seven_seg_decode>
 5a4:	00610023          	sb	t1,0(sp)
 5a8:	000a8513          	mv	a0,s5
 5ac:	0b8000ef          	jal	664 <seven_seg_decode>
 5b0:	006100a3          	sb	t1,1(sp)
 5b4:	000b0513          	mv	a0,s6
 5b8:	0ac000ef          	jal	664 <seven_seg_decode>
 5bc:	00610123          	sb	t1,2(sp)
 5c0:	000b8513          	mv	a0,s7
 5c4:	0a0000ef          	jal	664 <seven_seg_decode>
 5c8:	006101a3          	sb	t1,3(sp)
 5cc:	000c0513          	mv	a0,s8
 5d0:	094000ef          	jal	664 <seven_seg_decode>
 5d4:	00610223          	sb	t1,4(sp)
 5d8:	000c8513          	mv	a0,s9
 5dc:	088000ef          	jal	664 <seven_seg_decode>
 5e0:	006102a3          	sb	t1,5(sp)
 5e4:	000d0513          	mv	a0,s10
 5e8:	07c000ef          	jal	664 <seven_seg_decode>
 5ec:	00610323          	sb	t1,6(sp)
 5f0:	000d8513          	mv	a0,s11
 5f4:	070000ef          	jal	664 <seven_seg_decode>
 5f8:	006103a3          	sb	t1,7(sp)
 5fc:	00000213          	li	tp,0
 600:	00100193          	li	gp,1
 604:	ae1ff0ef          	jal	e4 <out_lcd>
 608:	000031b7          	lui	gp,0x3
 60c:	0d318193          	addi	gp,gp,211 # 30d3 <delay_loop+0x294f>
 610:	158000ef          	jal	768 <delay>
 614:	00000213          	li	tp,0
 618:	08200193          	li	gp,130
 61c:	ac9ff0ef          	jal	e4 <out_lcd>
 620:	27000193          	li	gp,624
 624:	144000ef          	jal	768 <delay>
 628:	03000493          	li	s1,48
 62c:	03000793          	li	a5,48
 630:	03000813          	li	a6,48
 634:	03000893          	li	a7,48
 638:	03000913          	li	s2,48
 63c:	03000993          	li	s3,48
 640:	03000e13          	li	t3,48
 644:	03000e93          	li	t4,48
 648:	00100f93          	li	t6,1
 64c:	00002137          	lui	sp,0x2
 650:	10010113          	addi	sp,sp,256 # 2100 <delay_loop+0x197c>
 654:	00012083          	lw	ra,0(sp)
 658:	00007137          	lui	sp,0x7
 65c:	02010113          	addi	sp,sp,32 # 7020 <delay_loop+0x689c>
 660:	00008067          	ret

00000664 <seven_seg_decode>:
 664:	00000293          	li	t0,0
 668:	08550063          	beq	a0,t0,6e8 <display_0>
 66c:	00100293          	li	t0,1
 670:	08550063          	beq	a0,t0,6f0 <display_1>
 674:	00200293          	li	t0,2
 678:	08550063          	beq	a0,t0,6f8 <display_2>
 67c:	00300293          	li	t0,3
 680:	08550063          	beq	a0,t0,700 <display_3>
 684:	00400293          	li	t0,4
 688:	08550063          	beq	a0,t0,708 <display_4>
 68c:	00500293          	li	t0,5
 690:	08550063          	beq	a0,t0,710 <display_5>
 694:	00600293          	li	t0,6
 698:	08550063          	beq	a0,t0,718 <display_6>
 69c:	00700293          	li	t0,7
 6a0:	08550063          	beq	a0,t0,720 <display_7>
 6a4:	00800293          	li	t0,8
 6a8:	08550063          	beq	a0,t0,728 <display_8>
 6ac:	00900293          	li	t0,9
 6b0:	08550063          	beq	a0,t0,730 <display_9>
 6b4:	00a00293          	li	t0,10
 6b8:	08550063          	beq	a0,t0,738 <display_A>
 6bc:	00b00293          	li	t0,11
 6c0:	08550063          	beq	a0,t0,740 <display_B>
 6c4:	00c00293          	li	t0,12
 6c8:	08550063          	beq	a0,t0,748 <display_C>
 6cc:	00d00293          	li	t0,13
 6d0:	08550063          	beq	a0,t0,750 <display_D>
 6d4:	00e00293          	li	t0,14
 6d8:	08550063          	beq	a0,t0,758 <display_E>
 6dc:	00f00293          	li	t0,15
 6e0:	08550063          	beq	a0,t0,760 <display_F>
 6e4:	00008067          	ret

000006e8 <display_0>:
 6e8:	04000313          	li	t1,64
 6ec:	00008067          	ret

000006f0 <display_1>:
 6f0:	07900313          	li	t1,121
 6f4:	00008067          	ret

000006f8 <display_2>:
 6f8:	02400313          	li	t1,36
 6fc:	00008067          	ret

00000700 <display_3>:
 700:	03000313          	li	t1,48
 704:	00008067          	ret

00000708 <display_4>:
 708:	01900313          	li	t1,25
 70c:	00008067          	ret

00000710 <display_5>:
 710:	01200313          	li	t1,18
 714:	00008067          	ret

00000718 <display_6>:
 718:	00200313          	li	t1,2
 71c:	00008067          	ret

00000720 <display_7>:
 720:	07800313          	li	t1,120
 724:	00008067          	ret

00000728 <display_8>:
 728:	00000313          	li	t1,0
 72c:	00008067          	ret

00000730 <display_9>:
 730:	01000313          	li	t1,16
 734:	00008067          	ret

00000738 <display_A>:
 738:	00800313          	li	t1,8
 73c:	00008067          	ret

00000740 <display_B>:
 740:	00300313          	li	t1,3
 744:	00008067          	ret

00000748 <display_C>:
 748:	04600313          	li	t1,70
 74c:	00008067          	ret

00000750 <display_D>:
 750:	02100313          	li	t1,33
 754:	00008067          	ret

00000758 <display_E>:
 758:	00600313          	li	t1,6
 75c:	00008067          	ret

00000760 <display_F>:
 760:	00e00313          	li	t1,14
 764:	00008067          	ret

00000768 <delay>:
 768:	003002b3          	add	t0,zero,gp

0000076c <dloop>:
 76c:	fff28293          	addi	t0,t0,-1
 770:	fe029ee3          	bnez	t0,76c <dloop>
 774:	00a00193          	li	gp,10
 778:	00008067          	ret

0000077c <delay_10ms>:
 77c:	0000f2b7          	lui	t0,0xf
 780:	42428293          	addi	t0,t0,1060 # f424 <delay_loop+0xeca0>

00000784 <delay_loop>:
 784:	fff28293          	addi	t0,t0,-1
 788:	fe029ee3          	bnez	t0,784 <delay_loop>
 78c:	00008067          	ret
