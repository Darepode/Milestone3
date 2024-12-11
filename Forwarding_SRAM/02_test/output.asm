
../02_test/test_assembly.o:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	00000013          	nop
   4:	00000013          	nop
   8:	00000013          	nop

0000000c <power_reset_lcd>:
   c:	00007137          	lui	sp,0x7
  10:	03010113          	addi	sp,sp,48 # 7030 <delay_loop+0x68e4>
  14:	c00001b7          	lui	gp,0xc0000
  18:	00312023          	sw	gp,0(sp)
  1c:	0001f1b7          	lui	gp,0x1f
  20:	84718193          	addi	gp,gp,-1977 # 1e847 <delay_loop+0x1e0fb>
  24:	70c000ef          	jal	730 <delay>
  28:	00000213          	li	tp,0
  2c:	03000193          	li	gp,48
  30:	0ac000ef          	jal	dc <out_lcd>
  34:	000061b7          	lui	gp,0x6
  38:	68918193          	addi	gp,gp,1673 # 6689 <delay_loop+0x5f3d>
  3c:	6f4000ef          	jal	730 <delay>
  40:	00000213          	li	tp,0
  44:	03000193          	li	gp,48
  48:	094000ef          	jal	dc <out_lcd>
  4c:	000031b7          	lui	gp,0x3
  50:	0d318193          	addi	gp,gp,211 # 30d3 <delay_loop+0x2987>
  54:	6dc000ef          	jal	730 <delay>
  58:	00000213          	li	tp,0
  5c:	03000193          	li	gp,48
  60:	07c000ef          	jal	dc <out_lcd>
  64:	000031b7          	lui	gp,0x3
  68:	0d318193          	addi	gp,gp,211 # 30d3 <delay_loop+0x2987>
  6c:	6c4000ef          	jal	730 <delay>

00000070 <init_lcd>:
  70:	00000213          	li	tp,0
  74:	03800193          	li	gp,56
  78:	064000ef          	jal	dc <out_lcd>
  7c:	27000193          	li	gp,624
  80:	6b0000ef          	jal	730 <delay>
  84:	00000213          	li	tp,0
  88:	00100193          	li	gp,1
  8c:	050000ef          	jal	dc <out_lcd>
  90:	000031b7          	lui	gp,0x3
  94:	0d318193          	addi	gp,gp,211 # 30d3 <delay_loop+0x2987>
  98:	698000ef          	jal	730 <delay>
  9c:	00000213          	li	tp,0
  a0:	00c00193          	li	gp,12
  a4:	038000ef          	jal	dc <out_lcd>
  a8:	27000193          	li	gp,624
  ac:	684000ef          	jal	730 <delay>
  b0:	00000213          	li	tp,0
  b4:	00600193          	li	gp,6
  b8:	024000ef          	jal	dc <out_lcd>
  bc:	27000193          	li	gp,624
  c0:	670000ef          	jal	730 <delay>
  c4:	00000213          	li	tp,0
  c8:	08200193          	li	gp,130
  cc:	010000ef          	jal	dc <out_lcd>
  d0:	27000193          	li	gp,624
  d4:	65c000ef          	jal	730 <delay>
  d8:	1980006f          	j	270 <init_prog>

000000dc <out_lcd>:
  dc:	00008393          	mv	t2,ra
  e0:	00007137          	lui	sp,0x7
  e4:	03010113          	addi	sp,sp,48 # 7030 <delay_loop+0x68e4>
  e8:	000f0663          	beqz	t5,f4 <command>
  ec:	60018193          	addi	gp,gp,1536
  f0:	0080006f          	j	f8 <send>

000000f4 <command>:
  f4:	40018193          	addi	gp,gp,1024

000000f8 <send>:
  f8:	00311023          	sh	gp,0(sp)
  fc:	27000193          	li	gp,624
 100:	630000ef          	jal	730 <delay>
 104:	000110a3          	sh	zero,1(sp)
 108:	00038093          	mv	ra,t2
 10c:	00a00193          	li	gp,10
 110:	00a00213          	li	tp,10
 114:	00600393          	li	t2,6
 118:	00007137          	lui	sp,0x7
 11c:	02010113          	addi	sp,sp,32 # 7020 <delay_loop+0x68d4>
 120:	00008067          	ret

00000124 <lap>:
 124:	00008713          	mv	a4,ra

00000128 <P_WAIT1>:
 128:	00040583          	lb	a1,0(s0)
 12c:	0045f613          	andi	a2,a1,4
 130:	fe061ce3          	bnez	a2,128 <P_WAIT1>
 134:	610000ef          	jal	744 <delay_10ms>
 138:	60c000ef          	jal	744 <delay_10ms>
 13c:	00040583          	lb	a1,0(s0)
 140:	0045f613          	andi	a2,a1,4
 144:	fe0612e3          	bnez	a2,128 <P_WAIT1>

00000148 <R_WAIT1>:
 148:	00040583          	lb	a1,0(s0)
 14c:	0045f613          	andi	a2,a1,4
 150:	fe060ce3          	beqz	a2,148 <R_WAIT1>
 154:	5f0000ef          	jal	744 <delay_10ms>
 158:	5ec000ef          	jal	744 <delay_10ms>
 15c:	00040583          	lb	a1,0(s0)
 160:	0045f613          	andi	a2,a1,4
 164:	fe0602e3          	beqz	a2,148 <R_WAIT1>
 168:	00100f13          	li	t5,1
 16c:	000e8193          	mv	gp,t4
 170:	f6dff0ef          	jal	dc <out_lcd>
 174:	27000193          	li	gp,624
 178:	5b8000ef          	jal	730 <delay>
 17c:	00100f13          	li	t5,1
 180:	000e0193          	mv	gp,t3
 184:	f59ff0ef          	jal	dc <out_lcd>
 188:	27000193          	li	gp,624
 18c:	5a4000ef          	jal	730 <delay>
 190:	00100f13          	li	t5,1
 194:	03a00193          	li	gp,58
 198:	f45ff0ef          	jal	dc <out_lcd>
 19c:	27000193          	li	gp,624
 1a0:	590000ef          	jal	730 <delay>
 1a4:	00100f13          	li	t5,1
 1a8:	00098193          	mv	gp,s3
 1ac:	f31ff0ef          	jal	dc <out_lcd>
 1b0:	27000193          	li	gp,624
 1b4:	57c000ef          	jal	730 <delay>
 1b8:	00100f13          	li	t5,1
 1bc:	00090193          	mv	gp,s2
 1c0:	f1dff0ef          	jal	dc <out_lcd>
 1c4:	27000193          	li	gp,624
 1c8:	568000ef          	jal	730 <delay>
 1cc:	00100f13          	li	t5,1
 1d0:	03a00193          	li	gp,58
 1d4:	f09ff0ef          	jal	dc <out_lcd>
 1d8:	27000193          	li	gp,624
 1dc:	554000ef          	jal	730 <delay>
 1e0:	00100f13          	li	t5,1
 1e4:	00088193          	mv	gp,a7
 1e8:	ef5ff0ef          	jal	dc <out_lcd>
 1ec:	27000193          	li	gp,624
 1f0:	540000ef          	jal	730 <delay>
 1f4:	00100f13          	li	t5,1
 1f8:	00080193          	mv	gp,a6
 1fc:	ee1ff0ef          	jal	dc <out_lcd>
 200:	27000193          	li	gp,624
 204:	52c000ef          	jal	730 <delay>
 208:	00100f13          	li	t5,1
 20c:	03a00193          	li	gp,58
 210:	ecdff0ef          	jal	dc <out_lcd>
 214:	27000193          	li	gp,624
 218:	518000ef          	jal	730 <delay>
 21c:	00100f13          	li	t5,1
 220:	00078193          	mv	gp,a5
 224:	eb9ff0ef          	jal	dc <out_lcd>
 228:	27000193          	li	gp,624
 22c:	504000ef          	jal	730 <delay>
 230:	00100f13          	li	t5,1
 234:	00048193          	mv	gp,s1
 238:	ea5ff0ef          	jal	dc <out_lcd>
 23c:	27000193          	li	gp,624
 240:	4f0000ef          	jal	730 <delay>
 244:	000f9863          	bnez	t6,254 <row2>
 248:	08200193          	li	gp,130
 24c:	00100f93          	li	t6,1
 250:	00c0006f          	j	25c <movecur>

00000254 <row2>:
 254:	0c200193          	li	gp,194
 258:	00000f93          	li	t6,0

0000025c <movecur>:
 25c:	00000f13          	li	t5,0
 260:	e7dff0ef          	jal	dc <out_lcd>
 264:	27000193          	li	gp,624
 268:	4c8000ef          	jal	730 <delay>
 26c:	00070067          	jr	a4

00000270 <init_prog>:
 270:	00a00193          	li	gp,10
 274:	00a00213          	li	tp,10
 278:	00600393          	li	t2,6
 27c:	00000a13          	li	s4,0
 280:	00000a93          	li	s5,0
 284:	00000b13          	li	s6,0
 288:	00000b93          	li	s7,0
 28c:	00000c13          	li	s8,0
 290:	00000c93          	li	s9,0
 294:	00000d13          	li	s10,0
 298:	00000d93          	li	s11,0
 29c:	03000493          	li	s1,48
 2a0:	03000793          	li	a5,48
 2a4:	03000813          	li	a6,48
 2a8:	03000893          	li	a7,48
 2ac:	03000913          	li	s2,48
 2b0:	03000993          	li	s3,48
 2b4:	03000e13          	li	t3,48
 2b8:	03000e93          	li	t4,48
 2bc:	00100f93          	li	t6,1
 2c0:	00007137          	lui	sp,0x7
 2c4:	02010113          	addi	sp,sp,32 # 7020 <delay_loop+0x68d4>
 2c8:	00008437          	lui	s0,0x8
 2cc:	81040413          	addi	s0,s0,-2032 # 7810 <delay_loop+0x70c4>
 2d0:	000a0513          	mv	a0,s4
 2d4:	358000ef          	jal	62c <seven_seg_decode>
 2d8:	00610023          	sb	t1,0(sp)
 2dc:	000a8513          	mv	a0,s5
 2e0:	34c000ef          	jal	62c <seven_seg_decode>
 2e4:	006100a3          	sb	t1,1(sp)
 2e8:	000b0513          	mv	a0,s6
 2ec:	340000ef          	jal	62c <seven_seg_decode>
 2f0:	00610123          	sb	t1,2(sp)
 2f4:	000b8513          	mv	a0,s7
 2f8:	334000ef          	jal	62c <seven_seg_decode>
 2fc:	006101a3          	sb	t1,3(sp)
 300:	000c0513          	mv	a0,s8
 304:	328000ef          	jal	62c <seven_seg_decode>
 308:	00610223          	sb	t1,4(sp)
 30c:	000c8513          	mv	a0,s9
 310:	31c000ef          	jal	62c <seven_seg_decode>
 314:	006102a3          	sb	t1,5(sp)
 318:	000d0513          	mv	a0,s10
 31c:	310000ef          	jal	62c <seven_seg_decode>
 320:	00610323          	sb	t1,6(sp)
 324:	000d8513          	mv	a0,s11
 328:	304000ef          	jal	62c <seven_seg_decode>
 32c:	006103a3          	sb	t1,7(sp)
 330:	2ec0076f          	jal	a4,61c <init_start>

00000334 <here>:
 334:	00040583          	lb	a1,0(s0)
 338:	0085f613          	andi	a2,a1,8
 33c:	00061463          	bnez	a2,344 <check1>
 340:	17c000ef          	jal	4bc <stop>

00000344 <check1>:
 344:	00040583          	lb	a1,0(s0)
 348:	0045f613          	andi	a2,a1,4
 34c:	00061463          	bnez	a2,354 <skip>
 350:	dd5ff0ef          	jal	124 <lap>

00000354 <skip>:
 354:	000a0513          	mv	a0,s4
 358:	030a0493          	addi	s1,s4,48
 35c:	2d0000ef          	jal	62c <seven_seg_decode>
 360:	00610023          	sb	t1,0(sp)
 364:	001a0a13          	addi	s4,s4,1
 368:	3dc000ef          	jal	744 <delay_10ms>
 36c:	fc3a14e3          	bne	s4,gp,334 <here>
 370:	00000a13          	li	s4,0
 374:	000a0513          	mv	a0,s4
 378:	030a0493          	addi	s1,s4,48
 37c:	2b0000ef          	jal	62c <seven_seg_decode>
 380:	00610023          	sb	t1,0(sp)
 384:	001a8a93          	addi	s5,s5,1
 388:	000a8513          	mv	a0,s5
 38c:	030a8793          	addi	a5,s5,48
 390:	29c000ef          	jal	62c <seven_seg_decode>
 394:	006100a3          	sb	t1,1(sp)
 398:	f9521ee3          	bne	tp,s5,334 <here>
 39c:	00000a93          	li	s5,0
 3a0:	000a8513          	mv	a0,s5
 3a4:	030a8793          	addi	a5,s5,48
 3a8:	284000ef          	jal	62c <seven_seg_decode>
 3ac:	006100a3          	sb	t1,1(sp)
 3b0:	001b0b13          	addi	s6,s6,1
 3b4:	000b0513          	mv	a0,s6
 3b8:	030b0813          	addi	a6,s6,48
 3bc:	270000ef          	jal	62c <seven_seg_decode>
 3c0:	00610123          	sb	t1,2(sp)
 3c4:	f76218e3          	bne	tp,s6,334 <here>
 3c8:	00000b13          	li	s6,0
 3cc:	000b0513          	mv	a0,s6
 3d0:	030b0813          	addi	a6,s6,48
 3d4:	258000ef          	jal	62c <seven_seg_decode>
 3d8:	00610123          	sb	t1,2(sp)
 3dc:	001b8b93          	addi	s7,s7,1
 3e0:	000b8513          	mv	a0,s7
 3e4:	030b8893          	addi	a7,s7,48
 3e8:	244000ef          	jal	62c <seven_seg_decode>
 3ec:	006101a3          	sb	t1,3(sp)
 3f0:	f57392e3          	bne	t2,s7,334 <here>
 3f4:	00000b93          	li	s7,0
 3f8:	000b8513          	mv	a0,s7
 3fc:	030b8893          	addi	a7,s7,48
 400:	22c000ef          	jal	62c <seven_seg_decode>
 404:	006101a3          	sb	t1,3(sp)
 408:	001c0c13          	addi	s8,s8,1
 40c:	000c0513          	mv	a0,s8
 410:	030c0913          	addi	s2,s8,48
 414:	218000ef          	jal	62c <seven_seg_decode>
 418:	00610223          	sb	t1,4(sp)
 41c:	f1821ce3          	bne	tp,s8,334 <here>
 420:	00000c13          	li	s8,0
 424:	000c0513          	mv	a0,s8
 428:	030c0913          	addi	s2,s8,48
 42c:	200000ef          	jal	62c <seven_seg_decode>
 430:	00610223          	sb	t1,4(sp)
 434:	001c8c93          	addi	s9,s9,1
 438:	000c8513          	mv	a0,s9
 43c:	030c8993          	addi	s3,s9,48
 440:	1ec000ef          	jal	62c <seven_seg_decode>
 444:	006102a3          	sb	t1,5(sp)
 448:	ef9396e3          	bne	t2,s9,334 <here>
 44c:	00000c93          	li	s9,0
 450:	000c8513          	mv	a0,s9
 454:	030c8993          	addi	s3,s9,48
 458:	1d4000ef          	jal	62c <seven_seg_decode>
 45c:	006102a3          	sb	t1,5(sp)
 460:	001d0d13          	addi	s10,s10,1
 464:	000d0513          	mv	a0,s10
 468:	030d0e13          	addi	t3,s10,48
 46c:	1c0000ef          	jal	62c <seven_seg_decode>
 470:	00610323          	sb	t1,6(sp)
 474:	eda210e3          	bne	tp,s10,334 <here>
 478:	00000d13          	li	s10,0
 47c:	000d0513          	mv	a0,s10
 480:	030d0e13          	addi	t3,s10,48
 484:	1a8000ef          	jal	62c <seven_seg_decode>
 488:	00610323          	sb	t1,6(sp)
 48c:	001d8d93          	addi	s11,s11,1
 490:	000d8513          	mv	a0,s11
 494:	030d8e93          	addi	t4,s11,48
 498:	194000ef          	jal	62c <seven_seg_decode>
 49c:	006103a3          	sb	t1,7(sp)
 4a0:	e9b21ae3          	bne	tp,s11,334 <here>
 4a4:	00000d93          	li	s11,0
 4a8:	000d8513          	mv	a0,s11
 4ac:	030d8e93          	addi	t4,s11,48
 4b0:	17c000ef          	jal	62c <seven_seg_decode>
 4b4:	006103a3          	sb	t1,7(sp)
 4b8:	e7dff06f          	j	334 <here>

000004bc <stop>:
 4bc:	00008713          	mv	a4,ra
 4c0:	00000693          	li	a3,0

000004c4 <P_WAIT>:
 4c4:	00040583          	lb	a1,0(s0)
 4c8:	0025f613          	andi	a2,a1,2
 4cc:	10061a63          	bnez	a2,5e0 <cont>

000004d0 <P_WAIT2>:
 4d0:	00040583          	lb	a1,0(s0)
 4d4:	0025f613          	andi	a2,a1,2
 4d8:	fe061ce3          	bnez	a2,4d0 <P_WAIT2>
 4dc:	268000ef          	jal	744 <delay_10ms>
 4e0:	264000ef          	jal	744 <delay_10ms>
 4e4:	00040583          	lb	a1,0(s0)
 4e8:	0025f613          	andi	a2,a1,2
 4ec:	fe0612e3          	bnez	a2,4d0 <P_WAIT2>

000004f0 <R_WAIT2>:
 4f0:	00040583          	lb	a1,0(s0)
 4f4:	0025f613          	andi	a2,a1,2
 4f8:	fe060ce3          	beqz	a2,4f0 <R_WAIT2>
 4fc:	248000ef          	jal	744 <delay_10ms>
 500:	244000ef          	jal	744 <delay_10ms>
 504:	00040583          	lb	a1,0(s0)
 508:	0025f613          	andi	a2,a1,2
 50c:	fe0602e3          	beqz	a2,4f0 <R_WAIT2>
 510:	00000a13          	li	s4,0
 514:	00000a93          	li	s5,0
 518:	00000b13          	li	s6,0
 51c:	00000b93          	li	s7,0
 520:	00000c13          	li	s8,0
 524:	00000c93          	li	s9,0
 528:	00000d13          	li	s10,0
 52c:	00000d93          	li	s11,0
 530:	000a0513          	mv	a0,s4
 534:	0f8000ef          	jal	62c <seven_seg_decode>
 538:	00610023          	sb	t1,0(sp)
 53c:	000a8513          	mv	a0,s5
 540:	0ec000ef          	jal	62c <seven_seg_decode>
 544:	006100a3          	sb	t1,1(sp)
 548:	000b0513          	mv	a0,s6
 54c:	0e0000ef          	jal	62c <seven_seg_decode>
 550:	00610123          	sb	t1,2(sp)
 554:	000b8513          	mv	a0,s7
 558:	0d4000ef          	jal	62c <seven_seg_decode>
 55c:	006101a3          	sb	t1,3(sp)
 560:	000c0513          	mv	a0,s8
 564:	0c8000ef          	jal	62c <seven_seg_decode>
 568:	00610223          	sb	t1,4(sp)
 56c:	000c8513          	mv	a0,s9
 570:	0bc000ef          	jal	62c <seven_seg_decode>
 574:	006102a3          	sb	t1,5(sp)
 578:	000d0513          	mv	a0,s10
 57c:	0b0000ef          	jal	62c <seven_seg_decode>
 580:	00610323          	sb	t1,6(sp)
 584:	000d8513          	mv	a0,s11
 588:	0a4000ef          	jal	62c <seven_seg_decode>
 58c:	006103a3          	sb	t1,7(sp)
 590:	00000213          	li	tp,0
 594:	00100193          	li	gp,1
 598:	b45ff0ef          	jal	dc <out_lcd>
 59c:	000031b7          	lui	gp,0x3
 5a0:	0d318193          	addi	gp,gp,211 # 30d3 <delay_loop+0x2987>
 5a4:	18c000ef          	jal	730 <delay>
 5a8:	00000213          	li	tp,0
 5ac:	08200193          	li	gp,130
 5b0:	b2dff0ef          	jal	dc <out_lcd>
 5b4:	27000193          	li	gp,624
 5b8:	178000ef          	jal	730 <delay>
 5bc:	03000493          	li	s1,48
 5c0:	03000793          	li	a5,48
 5c4:	03000813          	li	a6,48
 5c8:	03000893          	li	a7,48
 5cc:	03000913          	li	s2,48
 5d0:	03000993          	li	s3,48
 5d4:	03000e13          	li	t3,48
 5d8:	03000e93          	li	t4,48
 5dc:	00100f93          	li	t6,1

000005e0 <cont>:
 5e0:	0085f613          	andi	a2,a1,8
 5e4:	ee0610e3          	bnez	a2,4c4 <P_WAIT>
 5e8:	15c000ef          	jal	744 <delay_10ms>
 5ec:	158000ef          	jal	744 <delay_10ms>
 5f0:	00040583          	lb	a1,0(s0)
 5f4:	0085f613          	andi	a2,a1,8
 5f8:	ec0616e3          	bnez	a2,4c4 <P_WAIT>

000005fc <R_WAIT>:
 5fc:	00040583          	lb	a1,0(s0)
 600:	0085f613          	andi	a2,a1,8
 604:	fe060ce3          	beqz	a2,5fc <R_WAIT>
 608:	13c000ef          	jal	744 <delay_10ms>
 60c:	138000ef          	jal	744 <delay_10ms>
 610:	00040583          	lb	a1,0(s0)
 614:	0085f613          	andi	a2,a1,8
 618:	fe0602e3          	beqz	a2,5fc <R_WAIT>

0000061c <init_start>:
 61c:	00069663          	bnez	a3,628 <run>
 620:	00168693          	addi	a3,a3,1
 624:	ea1ff06f          	j	4c4 <P_WAIT>

00000628 <run>:
 628:	00070067          	jr	a4

0000062c <seven_seg_decode>:
 62c:	00000293          	li	t0,0
 630:	08550063          	beq	a0,t0,6b0 <display_0>
 634:	00100293          	li	t0,1
 638:	08550063          	beq	a0,t0,6b8 <display_1>
 63c:	00200293          	li	t0,2
 640:	08550063          	beq	a0,t0,6c0 <display_2>
 644:	00300293          	li	t0,3
 648:	08550063          	beq	a0,t0,6c8 <display_3>
 64c:	00400293          	li	t0,4
 650:	08550063          	beq	a0,t0,6d0 <display_4>
 654:	00500293          	li	t0,5
 658:	08550063          	beq	a0,t0,6d8 <display_5>
 65c:	00600293          	li	t0,6
 660:	08550063          	beq	a0,t0,6e0 <display_6>
 664:	00700293          	li	t0,7
 668:	08550063          	beq	a0,t0,6e8 <display_7>
 66c:	00800293          	li	t0,8
 670:	08550063          	beq	a0,t0,6f0 <display_8>
 674:	00900293          	li	t0,9
 678:	08550063          	beq	a0,t0,6f8 <display_9>
 67c:	00a00293          	li	t0,10
 680:	08550063          	beq	a0,t0,700 <display_A>
 684:	00b00293          	li	t0,11
 688:	08550063          	beq	a0,t0,708 <display_B>
 68c:	00c00293          	li	t0,12
 690:	08550063          	beq	a0,t0,710 <display_C>
 694:	00d00293          	li	t0,13
 698:	08550063          	beq	a0,t0,718 <display_D>
 69c:	00e00293          	li	t0,14
 6a0:	08550063          	beq	a0,t0,720 <display_E>
 6a4:	00f00293          	li	t0,15
 6a8:	08550063          	beq	a0,t0,728 <display_F>
 6ac:	00008067          	ret

000006b0 <display_0>:
 6b0:	04000313          	li	t1,64
 6b4:	00008067          	ret

000006b8 <display_1>:
 6b8:	07900313          	li	t1,121
 6bc:	00008067          	ret

000006c0 <display_2>:
 6c0:	02400313          	li	t1,36
 6c4:	00008067          	ret

000006c8 <display_3>:
 6c8:	03000313          	li	t1,48
 6cc:	00008067          	ret

000006d0 <display_4>:
 6d0:	01900313          	li	t1,25
 6d4:	00008067          	ret

000006d8 <display_5>:
 6d8:	01200313          	li	t1,18
 6dc:	00008067          	ret

000006e0 <display_6>:
 6e0:	00200313          	li	t1,2
 6e4:	00008067          	ret

000006e8 <display_7>:
 6e8:	07800313          	li	t1,120
 6ec:	00008067          	ret

000006f0 <display_8>:
 6f0:	00000313          	li	t1,0
 6f4:	00008067          	ret

000006f8 <display_9>:
 6f8:	01000313          	li	t1,16
 6fc:	00008067          	ret

00000700 <display_A>:
 700:	00800313          	li	t1,8
 704:	00008067          	ret

00000708 <display_B>:
 708:	00300313          	li	t1,3
 70c:	00008067          	ret

00000710 <display_C>:
 710:	04600313          	li	t1,70
 714:	00008067          	ret

00000718 <display_D>:
 718:	02100313          	li	t1,33
 71c:	00008067          	ret

00000720 <display_E>:
 720:	00600313          	li	t1,6
 724:	00008067          	ret

00000728 <display_F>:
 728:	00e00313          	li	t1,14
 72c:	00008067          	ret

00000730 <delay>:
 730:	003002b3          	add	t0,zero,gp

00000734 <dloop>:
 734:	fff28293          	addi	t0,t0,-1
 738:	fe029ee3          	bnez	t0,734 <dloop>
 73c:	00a00193          	li	gp,10
 740:	00008067          	ret

00000744 <delay_10ms>:
 744:	0000f2b7          	lui	t0,0xf
 748:	42428293          	addi	t0,t0,1060 # f424 <delay_loop+0xecd8>

0000074c <delay_loop>:
 74c:	fff28293          	addi	t0,t0,-1
 750:	fe029ee3          	bnez	t0,74c <delay_loop>
 754:	00008067          	ret
