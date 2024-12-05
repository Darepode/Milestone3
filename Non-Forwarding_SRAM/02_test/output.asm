
../02_test/test_assembly.o:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	00007137          	lui	sp,0x7
   4:	03010113          	addi	sp,sp,48 # 7030 <delay_loop+0x68c0>
   8:	c00001b7          	lui	gp,0xc0000
   c:	00312023          	sw	gp,0(sp)
  10:	0001f1b7          	lui	gp,0x1f
  14:	84718193          	addi	gp,gp,-1977 # 1e847 <delay_loop+0x1e0d7>
  18:	73c000ef          	jal	754 <delay>
  1c:	00000213          	li	tp,0
  20:	03000193          	li	gp,48
  24:	0ac000ef          	jal	d0 <out_lcd>
  28:	000061b7          	lui	gp,0x6
  2c:	68918193          	addi	gp,gp,1673 # 6689 <delay_loop+0x5f19>
  30:	724000ef          	jal	754 <delay>
  34:	00000213          	li	tp,0
  38:	03000193          	li	gp,48
  3c:	094000ef          	jal	d0 <out_lcd>
  40:	000031b7          	lui	gp,0x3
  44:	0d318193          	addi	gp,gp,211 # 30d3 <delay_loop+0x2963>
  48:	70c000ef          	jal	754 <delay>
  4c:	00000213          	li	tp,0
  50:	03000193          	li	gp,48
  54:	07c000ef          	jal	d0 <out_lcd>
  58:	000031b7          	lui	gp,0x3
  5c:	0d318193          	addi	gp,gp,211 # 30d3 <delay_loop+0x2963>
  60:	6f4000ef          	jal	754 <delay>

00000064 <init_lcd>:
  64:	00000213          	li	tp,0
  68:	03800193          	li	gp,56
  6c:	064000ef          	jal	d0 <out_lcd>
  70:	27000193          	li	gp,624
  74:	6e0000ef          	jal	754 <delay>
  78:	00000213          	li	tp,0
  7c:	00100193          	li	gp,1
  80:	050000ef          	jal	d0 <out_lcd>
  84:	000031b7          	lui	gp,0x3
  88:	0d318193          	addi	gp,gp,211 # 30d3 <delay_loop+0x2963>
  8c:	6c8000ef          	jal	754 <delay>
  90:	00000213          	li	tp,0
  94:	00c00193          	li	gp,12
  98:	038000ef          	jal	d0 <out_lcd>
  9c:	27000193          	li	gp,624
  a0:	6b4000ef          	jal	754 <delay>
  a4:	00000213          	li	tp,0
  a8:	00600193          	li	gp,6
  ac:	024000ef          	jal	d0 <out_lcd>
  b0:	27000193          	li	gp,624
  b4:	6a0000ef          	jal	754 <delay>
  b8:	00000213          	li	tp,0
  bc:	08200193          	li	gp,130
  c0:	010000ef          	jal	d0 <out_lcd>
  c4:	27000193          	li	gp,624
  c8:	68c000ef          	jal	754 <delay>
  cc:	1980006f          	j	264 <init_prog>

000000d0 <out_lcd>:
  d0:	00008393          	mv	t2,ra
  d4:	00007137          	lui	sp,0x7
  d8:	03010113          	addi	sp,sp,48 # 7030 <delay_loop+0x68c0>
  dc:	000f0663          	beqz	t5,e8 <command>
  e0:	60018193          	addi	gp,gp,1536
  e4:	0080006f          	j	ec <send>

000000e8 <command>:
  e8:	40018193          	addi	gp,gp,1024

000000ec <send>:
  ec:	00311023          	sh	gp,0(sp)
  f0:	27000193          	li	gp,624
  f4:	660000ef          	jal	754 <delay>
  f8:	000110a3          	sh	zero,1(sp)
  fc:	00038093          	mv	ra,t2
 100:	00a00193          	li	gp,10
 104:	00a00213          	li	tp,10
 108:	00600393          	li	t2,6
 10c:	00007137          	lui	sp,0x7
 110:	02010113          	addi	sp,sp,32 # 7020 <delay_loop+0x68b0>
 114:	00008067          	ret

00000118 <lap>:
 118:	00008713          	mv	a4,ra

0000011c <P_WAIT1>:
 11c:	00040583          	lb	a1,0(s0)
 120:	0045f613          	andi	a2,a1,4
 124:	fe061ce3          	bnez	a2,11c <P_WAIT1>
 128:	640000ef          	jal	768 <delay_10ms>
 12c:	63c000ef          	jal	768 <delay_10ms>
 130:	00040583          	lb	a1,0(s0)
 134:	0045f613          	andi	a2,a1,4
 138:	fe0612e3          	bnez	a2,11c <P_WAIT1>

0000013c <R_WAIT1>:
 13c:	00040583          	lb	a1,0(s0)
 140:	0045f613          	andi	a2,a1,4
 144:	fe060ce3          	beqz	a2,13c <R_WAIT1>
 148:	620000ef          	jal	768 <delay_10ms>
 14c:	61c000ef          	jal	768 <delay_10ms>
 150:	00040583          	lb	a1,0(s0)
 154:	0045f613          	andi	a2,a1,4
 158:	fe0602e3          	beqz	a2,13c <R_WAIT1>
 15c:	00100f13          	li	t5,1
 160:	000e8193          	mv	gp,t4
 164:	f6dff0ef          	jal	d0 <out_lcd>
 168:	27000193          	li	gp,624
 16c:	5e8000ef          	jal	754 <delay>
 170:	00100f13          	li	t5,1
 174:	000e0193          	mv	gp,t3
 178:	f59ff0ef          	jal	d0 <out_lcd>
 17c:	27000193          	li	gp,624
 180:	5d4000ef          	jal	754 <delay>
 184:	00100f13          	li	t5,1
 188:	03a00193          	li	gp,58
 18c:	f45ff0ef          	jal	d0 <out_lcd>
 190:	27000193          	li	gp,624
 194:	5c0000ef          	jal	754 <delay>
 198:	00100f13          	li	t5,1
 19c:	00098193          	mv	gp,s3
 1a0:	f31ff0ef          	jal	d0 <out_lcd>
 1a4:	27000193          	li	gp,624
 1a8:	5ac000ef          	jal	754 <delay>
 1ac:	00100f13          	li	t5,1
 1b0:	00090193          	mv	gp,s2
 1b4:	f1dff0ef          	jal	d0 <out_lcd>
 1b8:	27000193          	li	gp,624
 1bc:	598000ef          	jal	754 <delay>
 1c0:	00100f13          	li	t5,1
 1c4:	03a00193          	li	gp,58
 1c8:	f09ff0ef          	jal	d0 <out_lcd>
 1cc:	27000193          	li	gp,624
 1d0:	584000ef          	jal	754 <delay>
 1d4:	00100f13          	li	t5,1
 1d8:	00088193          	mv	gp,a7
 1dc:	ef5ff0ef          	jal	d0 <out_lcd>
 1e0:	27000193          	li	gp,624
 1e4:	570000ef          	jal	754 <delay>
 1e8:	00100f13          	li	t5,1
 1ec:	00080193          	mv	gp,a6
 1f0:	ee1ff0ef          	jal	d0 <out_lcd>
 1f4:	27000193          	li	gp,624
 1f8:	55c000ef          	jal	754 <delay>
 1fc:	00100f13          	li	t5,1
 200:	03a00193          	li	gp,58
 204:	ecdff0ef          	jal	d0 <out_lcd>
 208:	27000193          	li	gp,624
 20c:	548000ef          	jal	754 <delay>
 210:	00100f13          	li	t5,1
 214:	00078193          	mv	gp,a5
 218:	eb9ff0ef          	jal	d0 <out_lcd>
 21c:	27000193          	li	gp,624
 220:	534000ef          	jal	754 <delay>
 224:	00100f13          	li	t5,1
 228:	00048193          	mv	gp,s1
 22c:	ea5ff0ef          	jal	d0 <out_lcd>
 230:	27000193          	li	gp,624
 234:	520000ef          	jal	754 <delay>
 238:	000f9863          	bnez	t6,248 <row2>
 23c:	08200193          	li	gp,130
 240:	00100f93          	li	t6,1
 244:	00c0006f          	j	250 <movecur>

00000248 <row2>:
 248:	0c200193          	li	gp,194
 24c:	00000f93          	li	t6,0

00000250 <movecur>:
 250:	00000f13          	li	t5,0
 254:	e7dff0ef          	jal	d0 <out_lcd>
 258:	27000193          	li	gp,624
 25c:	4f8000ef          	jal	754 <delay>
 260:	00070067          	jr	a4

00000264 <init_prog>:
 264:	00a00193          	li	gp,10
 268:	00a00213          	li	tp,10
 26c:	00600393          	li	t2,6
 270:	00000a13          	li	s4,0
 274:	00000a93          	li	s5,0
 278:	00000b13          	li	s6,0
 27c:	00000b93          	li	s7,0
 280:	00000c13          	li	s8,0
 284:	00000c93          	li	s9,0
 288:	00000d13          	li	s10,0
 28c:	00000d93          	li	s11,0
 290:	03000493          	li	s1,48
 294:	03000793          	li	a5,48
 298:	03000813          	li	a6,48
 29c:	03000893          	li	a7,48
 2a0:	03000913          	li	s2,48
 2a4:	03000993          	li	s3,48
 2a8:	03000e13          	li	t3,48
 2ac:	03000e93          	li	t4,48
 2b0:	00100f93          	li	t6,1
 2b4:	00007137          	lui	sp,0x7
 2b8:	02010113          	addi	sp,sp,32 # 7020 <delay_loop+0x68b0>
 2bc:	00008437          	lui	s0,0x8
 2c0:	81040413          	addi	s0,s0,-2032 # 7810 <delay_loop+0x70a0>
 2c4:	000a0513          	mv	a0,s4
 2c8:	388000ef          	jal	650 <seven_seg_decode>
 2cc:	00610023          	sb	t1,0(sp)
 2d0:	000a8513          	mv	a0,s5
 2d4:	37c000ef          	jal	650 <seven_seg_decode>
 2d8:	006100a3          	sb	t1,1(sp)
 2dc:	000b0513          	mv	a0,s6
 2e0:	370000ef          	jal	650 <seven_seg_decode>
 2e4:	00610123          	sb	t1,2(sp)
 2e8:	000b8513          	mv	a0,s7
 2ec:	364000ef          	jal	650 <seven_seg_decode>
 2f0:	006101a3          	sb	t1,3(sp)
 2f4:	000c0513          	mv	a0,s8
 2f8:	358000ef          	jal	650 <seven_seg_decode>
 2fc:	00610223          	sb	t1,4(sp)
 300:	000c8513          	mv	a0,s9
 304:	34c000ef          	jal	650 <seven_seg_decode>
 308:	006102a3          	sb	t1,5(sp)
 30c:	000d0513          	mv	a0,s10
 310:	340000ef          	jal	650 <seven_seg_decode>
 314:	00610323          	sb	t1,6(sp)
 318:	000d8513          	mv	a0,s11
 31c:	334000ef          	jal	650 <seven_seg_decode>
 320:	006103a3          	sb	t1,7(sp)
 324:	1e00076f          	jal	a4,504 <init_start>

00000328 <here>:
 328:	00040583          	lb	a1,0(s0)
 32c:	0085f613          	andi	a2,a1,8
 330:	00061463          	bnez	a2,338 <check1>
 334:	17c000ef          	jal	4b0 <stop>

00000338 <check1>:
 338:	00040583          	lb	a1,0(s0)
 33c:	0045f613          	andi	a2,a1,4
 340:	00061463          	bnez	a2,348 <skip>
 344:	dd5ff0ef          	jal	118 <lap>

00000348 <skip>:
 348:	000a0513          	mv	a0,s4
 34c:	030a0493          	addi	s1,s4,48
 350:	300000ef          	jal	650 <seven_seg_decode>
 354:	00610023          	sb	t1,0(sp)
 358:	001a0a13          	addi	s4,s4,1
 35c:	40c000ef          	jal	768 <delay_10ms>
 360:	fc3a14e3          	bne	s4,gp,328 <here>
 364:	00000a13          	li	s4,0
 368:	000a0513          	mv	a0,s4
 36c:	030a0493          	addi	s1,s4,48
 370:	2e0000ef          	jal	650 <seven_seg_decode>
 374:	00610023          	sb	t1,0(sp)
 378:	001a8a93          	addi	s5,s5,1
 37c:	000a8513          	mv	a0,s5
 380:	030a8793          	addi	a5,s5,48
 384:	2cc000ef          	jal	650 <seven_seg_decode>
 388:	006100a3          	sb	t1,1(sp)
 38c:	f9521ee3          	bne	tp,s5,328 <here>
 390:	00000a93          	li	s5,0
 394:	000a8513          	mv	a0,s5
 398:	030a8793          	addi	a5,s5,48
 39c:	2b4000ef          	jal	650 <seven_seg_decode>
 3a0:	006100a3          	sb	t1,1(sp)
 3a4:	001b0b13          	addi	s6,s6,1
 3a8:	000b0513          	mv	a0,s6
 3ac:	030b0813          	addi	a6,s6,48
 3b0:	2a0000ef          	jal	650 <seven_seg_decode>
 3b4:	00610123          	sb	t1,2(sp)
 3b8:	f76218e3          	bne	tp,s6,328 <here>
 3bc:	00000b13          	li	s6,0
 3c0:	000b0513          	mv	a0,s6
 3c4:	030b0813          	addi	a6,s6,48
 3c8:	288000ef          	jal	650 <seven_seg_decode>
 3cc:	00610123          	sb	t1,2(sp)
 3d0:	001b8b93          	addi	s7,s7,1
 3d4:	000b8513          	mv	a0,s7
 3d8:	030b8893          	addi	a7,s7,48
 3dc:	274000ef          	jal	650 <seven_seg_decode>
 3e0:	006101a3          	sb	t1,3(sp)
 3e4:	f57392e3          	bne	t2,s7,328 <here>
 3e8:	00000b93          	li	s7,0
 3ec:	000b8513          	mv	a0,s7
 3f0:	030b8893          	addi	a7,s7,48
 3f4:	25c000ef          	jal	650 <seven_seg_decode>
 3f8:	006101a3          	sb	t1,3(sp)
 3fc:	001c0c13          	addi	s8,s8,1
 400:	000c0513          	mv	a0,s8
 404:	030c0913          	addi	s2,s8,48
 408:	248000ef          	jal	650 <seven_seg_decode>
 40c:	00610223          	sb	t1,4(sp)
 410:	f1821ce3          	bne	tp,s8,328 <here>
 414:	00000c13          	li	s8,0
 418:	000c0513          	mv	a0,s8
 41c:	030c0913          	addi	s2,s8,48
 420:	230000ef          	jal	650 <seven_seg_decode>
 424:	00610223          	sb	t1,4(sp)
 428:	001c8c93          	addi	s9,s9,1
 42c:	000c8513          	mv	a0,s9
 430:	030c8993          	addi	s3,s9,48
 434:	21c000ef          	jal	650 <seven_seg_decode>
 438:	006102a3          	sb	t1,5(sp)
 43c:	ef9396e3          	bne	t2,s9,328 <here>
 440:	00000c93          	li	s9,0
 444:	000c8513          	mv	a0,s9
 448:	030c8993          	addi	s3,s9,48
 44c:	204000ef          	jal	650 <seven_seg_decode>
 450:	006102a3          	sb	t1,5(sp)
 454:	001d0d13          	addi	s10,s10,1
 458:	000d0513          	mv	a0,s10
 45c:	030d0e13          	addi	t3,s10,48
 460:	1f0000ef          	jal	650 <seven_seg_decode>
 464:	00610323          	sb	t1,6(sp)
 468:	eda210e3          	bne	tp,s10,328 <here>
 46c:	00000d13          	li	s10,0
 470:	000d0513          	mv	a0,s10
 474:	030d0e13          	addi	t3,s10,48
 478:	1d8000ef          	jal	650 <seven_seg_decode>
 47c:	00610323          	sb	t1,6(sp)
 480:	001d8d93          	addi	s11,s11,1
 484:	000d8513          	mv	a0,s11
 488:	030d8e93          	addi	t4,s11,48
 48c:	1c4000ef          	jal	650 <seven_seg_decode>
 490:	006103a3          	sb	t1,7(sp)
 494:	e9b21ae3          	bne	tp,s11,328 <here>
 498:	00000d93          	li	s11,0
 49c:	000d8513          	mv	a0,s11
 4a0:	030d8e93          	addi	t4,s11,48
 4a4:	1ac000ef          	jal	650 <seven_seg_decode>
 4a8:	006103a3          	sb	t1,7(sp)
 4ac:	e7dff06f          	j	328 <here>

000004b0 <stop>:
 4b0:	00008713          	mv	a4,ra
 4b4:	00000693          	li	a3,0

000004b8 <P_WAIT>:
 4b8:	00040583          	lb	a1,0(s0)
 4bc:	0025f613          	andi	a2,a1,2
 4c0:	00061463          	bnez	a2,4c8 <cont>
 4c4:	050000ef          	jal	514 <reset>

000004c8 <cont>:
 4c8:	0085f613          	andi	a2,a1,8
 4cc:	fe0616e3          	bnez	a2,4b8 <P_WAIT>
 4d0:	298000ef          	jal	768 <delay_10ms>
 4d4:	294000ef          	jal	768 <delay_10ms>
 4d8:	00040583          	lb	a1,0(s0)
 4dc:	0085f613          	andi	a2,a1,8
 4e0:	fc061ce3          	bnez	a2,4b8 <P_WAIT>

000004e4 <R_WAIT>:
 4e4:	00040583          	lb	a1,0(s0)
 4e8:	0085f613          	andi	a2,a1,8
 4ec:	fe060ce3          	beqz	a2,4e4 <R_WAIT>
 4f0:	278000ef          	jal	768 <delay_10ms>
 4f4:	274000ef          	jal	768 <delay_10ms>
 4f8:	00040583          	lb	a1,0(s0)
 4fc:	0085f613          	andi	a2,a1,8
 500:	fe0602e3          	beqz	a2,4e4 <R_WAIT>

00000504 <init_start>:
 504:	00069663          	bnez	a3,510 <run>
 508:	00168693          	addi	a3,a3,1
 50c:	fadff06f          	j	4b8 <P_WAIT>

00000510 <run>:
 510:	00070067          	jr	a4

00000514 <reset>:
 514:	00002137          	lui	sp,0x2
 518:	10010113          	addi	sp,sp,256 # 2100 <delay_loop+0x1990>
 51c:	00112023          	sw	ra,0(sp)

00000520 <P_WAIT2>:
 520:	00040583          	lb	a1,0(s0)
 524:	0025f613          	andi	a2,a1,2
 528:	fe061ce3          	bnez	a2,520 <P_WAIT2>
 52c:	23c000ef          	jal	768 <delay_10ms>
 530:	238000ef          	jal	768 <delay_10ms>
 534:	00040583          	lb	a1,0(s0)
 538:	0025f613          	andi	a2,a1,2
 53c:	fe0612e3          	bnez	a2,520 <P_WAIT2>

00000540 <R_WAIT2>:
 540:	00040583          	lb	a1,0(s0)
 544:	0025f613          	andi	a2,a1,2
 548:	fe060ce3          	beqz	a2,540 <R_WAIT2>
 54c:	21c000ef          	jal	768 <delay_10ms>
 550:	218000ef          	jal	768 <delay_10ms>
 554:	00040583          	lb	a1,0(s0)
 558:	0025f613          	andi	a2,a1,2
 55c:	fe0602e3          	beqz	a2,540 <R_WAIT2>
 560:	00000a13          	li	s4,0
 564:	00000a93          	li	s5,0
 568:	00000b13          	li	s6,0
 56c:	00000b93          	li	s7,0
 570:	00000c13          	li	s8,0
 574:	00000c93          	li	s9,0
 578:	00000d13          	li	s10,0
 57c:	00000d93          	li	s11,0
 580:	00007137          	lui	sp,0x7
 584:	02010113          	addi	sp,sp,32 # 7020 <delay_loop+0x68b0>
 588:	000a0513          	mv	a0,s4
 58c:	0c4000ef          	jal	650 <seven_seg_decode>
 590:	00610023          	sb	t1,0(sp)
 594:	000a8513          	mv	a0,s5
 598:	0b8000ef          	jal	650 <seven_seg_decode>
 59c:	006100a3          	sb	t1,1(sp)
 5a0:	000b0513          	mv	a0,s6
 5a4:	0ac000ef          	jal	650 <seven_seg_decode>
 5a8:	00610123          	sb	t1,2(sp)
 5ac:	000b8513          	mv	a0,s7
 5b0:	0a0000ef          	jal	650 <seven_seg_decode>
 5b4:	006101a3          	sb	t1,3(sp)
 5b8:	000c0513          	mv	a0,s8
 5bc:	094000ef          	jal	650 <seven_seg_decode>
 5c0:	00610223          	sb	t1,4(sp)
 5c4:	000c8513          	mv	a0,s9
 5c8:	088000ef          	jal	650 <seven_seg_decode>
 5cc:	006102a3          	sb	t1,5(sp)
 5d0:	000d0513          	mv	a0,s10
 5d4:	07c000ef          	jal	650 <seven_seg_decode>
 5d8:	00610323          	sb	t1,6(sp)
 5dc:	000d8513          	mv	a0,s11
 5e0:	070000ef          	jal	650 <seven_seg_decode>
 5e4:	006103a3          	sb	t1,7(sp)
 5e8:	00000213          	li	tp,0
 5ec:	00100193          	li	gp,1
 5f0:	ae1ff0ef          	jal	d0 <out_lcd>
 5f4:	000031b7          	lui	gp,0x3
 5f8:	0d318193          	addi	gp,gp,211 # 30d3 <delay_loop+0x2963>
 5fc:	158000ef          	jal	754 <delay>
 600:	00000213          	li	tp,0
 604:	08200193          	li	gp,130
 608:	ac9ff0ef          	jal	d0 <out_lcd>
 60c:	27000193          	li	gp,624
 610:	144000ef          	jal	754 <delay>
 614:	03000493          	li	s1,48
 618:	03000793          	li	a5,48
 61c:	03000813          	li	a6,48
 620:	03000893          	li	a7,48
 624:	03000913          	li	s2,48
 628:	03000993          	li	s3,48
 62c:	03000e13          	li	t3,48
 630:	03000e93          	li	t4,48
 634:	00100f93          	li	t6,1
 638:	00002137          	lui	sp,0x2
 63c:	10010113          	addi	sp,sp,256 # 2100 <delay_loop+0x1990>
 640:	00012083          	lw	ra,0(sp)
 644:	00007137          	lui	sp,0x7
 648:	02010113          	addi	sp,sp,32 # 7020 <delay_loop+0x68b0>
 64c:	00008067          	ret

00000650 <seven_seg_decode>:
 650:	00000293          	li	t0,0
 654:	08550063          	beq	a0,t0,6d4 <display_0>
 658:	00100293          	li	t0,1
 65c:	08550063          	beq	a0,t0,6dc <display_1>
 660:	00200293          	li	t0,2
 664:	08550063          	beq	a0,t0,6e4 <display_2>
 668:	00300293          	li	t0,3
 66c:	08550063          	beq	a0,t0,6ec <display_3>
 670:	00400293          	li	t0,4
 674:	08550063          	beq	a0,t0,6f4 <display_4>
 678:	00500293          	li	t0,5
 67c:	08550063          	beq	a0,t0,6fc <display_5>
 680:	00600293          	li	t0,6
 684:	08550063          	beq	a0,t0,704 <display_6>
 688:	00700293          	li	t0,7
 68c:	08550063          	beq	a0,t0,70c <display_7>
 690:	00800293          	li	t0,8
 694:	08550063          	beq	a0,t0,714 <display_8>
 698:	00900293          	li	t0,9
 69c:	08550063          	beq	a0,t0,71c <display_9>
 6a0:	00a00293          	li	t0,10
 6a4:	08550063          	beq	a0,t0,724 <display_A>
 6a8:	00b00293          	li	t0,11
 6ac:	08550063          	beq	a0,t0,72c <display_B>
 6b0:	00c00293          	li	t0,12
 6b4:	08550063          	beq	a0,t0,734 <display_C>
 6b8:	00d00293          	li	t0,13
 6bc:	08550063          	beq	a0,t0,73c <display_D>
 6c0:	00e00293          	li	t0,14
 6c4:	08550063          	beq	a0,t0,744 <display_E>
 6c8:	00f00293          	li	t0,15
 6cc:	08550063          	beq	a0,t0,74c <display_F>
 6d0:	00008067          	ret

000006d4 <display_0>:
 6d4:	04000313          	li	t1,64
 6d8:	00008067          	ret

000006dc <display_1>:
 6dc:	07900313          	li	t1,121
 6e0:	00008067          	ret

000006e4 <display_2>:
 6e4:	02400313          	li	t1,36
 6e8:	00008067          	ret

000006ec <display_3>:
 6ec:	03000313          	li	t1,48
 6f0:	00008067          	ret

000006f4 <display_4>:
 6f4:	01900313          	li	t1,25
 6f8:	00008067          	ret

000006fc <display_5>:
 6fc:	01200313          	li	t1,18
 700:	00008067          	ret

00000704 <display_6>:
 704:	00200313          	li	t1,2
 708:	00008067          	ret

0000070c <display_7>:
 70c:	07800313          	li	t1,120
 710:	00008067          	ret

00000714 <display_8>:
 714:	00000313          	li	t1,0
 718:	00008067          	ret

0000071c <display_9>:
 71c:	01000313          	li	t1,16
 720:	00008067          	ret

00000724 <display_A>:
 724:	00800313          	li	t1,8
 728:	00008067          	ret

0000072c <display_B>:
 72c:	00300313          	li	t1,3
 730:	00008067          	ret

00000734 <display_C>:
 734:	04600313          	li	t1,70
 738:	00008067          	ret

0000073c <display_D>:
 73c:	02100313          	li	t1,33
 740:	00008067          	ret

00000744 <display_E>:
 744:	00600313          	li	t1,6
 748:	00008067          	ret

0000074c <display_F>:
 74c:	00e00313          	li	t1,14
 750:	00008067          	ret

00000754 <delay>:
 754:	003002b3          	add	t0,zero,gp

00000758 <dloop>:
 758:	fff28293          	addi	t0,t0,-1
 75c:	fe029ee3          	bnez	t0,758 <dloop>
 760:	00a00193          	li	gp,10
 764:	00008067          	ret

00000768 <delay_10ms>:
 768:	0000f2b7          	lui	t0,0xf
 76c:	42428293          	addi	t0,t0,1060 # f424 <delay_loop+0xecb4>

00000770 <delay_loop>:
 770:	fff28293          	addi	t0,t0,-1
 774:	fe029ee3          	bnez	t0,770 <delay_loop>
 778:	00008067          	ret
