
../02_test/test_assembly.o:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	00000013          	nop
   4:	00000013          	nop
   8:	00000013          	nop

0000000c <power_reset_lcd>:
   c:	00007137          	lui	sp,0x7
  10:	03010113          	addi	sp,sp,48 # 7030 <delay_loop+0x68bc>
  14:	c00001b7          	lui	gp,0xc0000
  18:	00312023          	sw	gp,0(sp)
  1c:	0001f1b7          	lui	gp,0x1f
  20:	84718193          	addi	gp,gp,-1977 # 1e847 <delay_loop+0x1e0d3>
  24:	734000ef          	jal	758 <delay>
  28:	00000213          	li	tp,0
  2c:	03000193          	li	gp,48
  30:	0ac000ef          	jal	dc <out_lcd>
  34:	000061b7          	lui	gp,0x6
  38:	68918193          	addi	gp,gp,1673 # 6689 <delay_loop+0x5f15>
  3c:	71c000ef          	jal	758 <delay>
  40:	00000213          	li	tp,0
  44:	03000193          	li	gp,48
  48:	094000ef          	jal	dc <out_lcd>
  4c:	000031b7          	lui	gp,0x3
  50:	0d318193          	addi	gp,gp,211 # 30d3 <delay_loop+0x295f>
  54:	704000ef          	jal	758 <delay>
  58:	00000213          	li	tp,0
  5c:	03000193          	li	gp,48
  60:	07c000ef          	jal	dc <out_lcd>
  64:	000031b7          	lui	gp,0x3
  68:	0d318193          	addi	gp,gp,211 # 30d3 <delay_loop+0x295f>
  6c:	6ec000ef          	jal	758 <delay>

00000070 <init_lcd>:
  70:	00000213          	li	tp,0
  74:	03800193          	li	gp,56
  78:	064000ef          	jal	dc <out_lcd>
  7c:	27000193          	li	gp,624
  80:	6d8000ef          	jal	758 <delay>
  84:	00000213          	li	tp,0
  88:	00100193          	li	gp,1
  8c:	050000ef          	jal	dc <out_lcd>
  90:	000031b7          	lui	gp,0x3
  94:	0d318193          	addi	gp,gp,211 # 30d3 <delay_loop+0x295f>
  98:	6c0000ef          	jal	758 <delay>
  9c:	00000213          	li	tp,0
  a0:	00c00193          	li	gp,12
  a4:	038000ef          	jal	dc <out_lcd>
  a8:	27000193          	li	gp,624
  ac:	6ac000ef          	jal	758 <delay>
  b0:	00000213          	li	tp,0
  b4:	00600193          	li	gp,6
  b8:	024000ef          	jal	dc <out_lcd>
  bc:	27000193          	li	gp,624
  c0:	698000ef          	jal	758 <delay>
  c4:	00000213          	li	tp,0
  c8:	08200193          	li	gp,130
  cc:	010000ef          	jal	dc <out_lcd>
  d0:	27000193          	li	gp,624
  d4:	684000ef          	jal	758 <delay>
  d8:	1980006f          	j	270 <init_prog>

000000dc <out_lcd>:
  dc:	00008393          	mv	t2,ra
  e0:	00007137          	lui	sp,0x7
  e4:	03010113          	addi	sp,sp,48 # 7030 <delay_loop+0x68bc>
  e8:	000f0663          	beqz	t5,f4 <command>
  ec:	60018193          	addi	gp,gp,1536
  f0:	0080006f          	j	f8 <send>

000000f4 <command>:
  f4:	40018193          	addi	gp,gp,1024

000000f8 <send>:
  f8:	00311023          	sh	gp,0(sp)
  fc:	27000193          	li	gp,624
 100:	658000ef          	jal	758 <delay>
 104:	000110a3          	sh	zero,1(sp)
 108:	00038093          	mv	ra,t2
 10c:	00a00193          	li	gp,10
 110:	00a00213          	li	tp,10
 114:	00600393          	li	t2,6
 118:	00007137          	lui	sp,0x7
 11c:	02010113          	addi	sp,sp,32 # 7020 <delay_loop+0x68ac>
 120:	00008067          	ret

00000124 <lap>:
 124:	00008713          	mv	a4,ra

00000128 <P_WAIT1>:
 128:	00040583          	lb	a1,0(s0)
 12c:	0045f613          	andi	a2,a1,4
 130:	fe061ce3          	bnez	a2,128 <P_WAIT1>
 134:	638000ef          	jal	76c <delay_10ms>
 138:	634000ef          	jal	76c <delay_10ms>
 13c:	00040583          	lb	a1,0(s0)
 140:	0045f613          	andi	a2,a1,4
 144:	fe0612e3          	bnez	a2,128 <P_WAIT1>

00000148 <R_WAIT1>:
 148:	00040583          	lb	a1,0(s0)
 14c:	0045f613          	andi	a2,a1,4
 150:	fe060ce3          	beqz	a2,148 <R_WAIT1>
 154:	618000ef          	jal	76c <delay_10ms>
 158:	614000ef          	jal	76c <delay_10ms>
 15c:	00040583          	lb	a1,0(s0)
 160:	0045f613          	andi	a2,a1,4
 164:	fe0602e3          	beqz	a2,148 <R_WAIT1>
 168:	00100f13          	li	t5,1
 16c:	000e8193          	mv	gp,t4
 170:	f6dff0ef          	jal	dc <out_lcd>
 174:	27000193          	li	gp,624
 178:	5e0000ef          	jal	758 <delay>
 17c:	00100f13          	li	t5,1
 180:	000e0193          	mv	gp,t3
 184:	f59ff0ef          	jal	dc <out_lcd>
 188:	27000193          	li	gp,624
 18c:	5cc000ef          	jal	758 <delay>
 190:	00100f13          	li	t5,1
 194:	03a00193          	li	gp,58
 198:	f45ff0ef          	jal	dc <out_lcd>
 19c:	27000193          	li	gp,624
 1a0:	5b8000ef          	jal	758 <delay>
 1a4:	00100f13          	li	t5,1
 1a8:	00098193          	mv	gp,s3
 1ac:	f31ff0ef          	jal	dc <out_lcd>
 1b0:	27000193          	li	gp,624
 1b4:	5a4000ef          	jal	758 <delay>
 1b8:	00100f13          	li	t5,1
 1bc:	00090193          	mv	gp,s2
 1c0:	f1dff0ef          	jal	dc <out_lcd>
 1c4:	27000193          	li	gp,624
 1c8:	590000ef          	jal	758 <delay>
 1cc:	00100f13          	li	t5,1
 1d0:	03a00193          	li	gp,58
 1d4:	f09ff0ef          	jal	dc <out_lcd>
 1d8:	27000193          	li	gp,624
 1dc:	57c000ef          	jal	758 <delay>
 1e0:	00100f13          	li	t5,1
 1e4:	00088193          	mv	gp,a7
 1e8:	ef5ff0ef          	jal	dc <out_lcd>
 1ec:	27000193          	li	gp,624
 1f0:	568000ef          	jal	758 <delay>
 1f4:	00100f13          	li	t5,1
 1f8:	00080193          	mv	gp,a6
 1fc:	ee1ff0ef          	jal	dc <out_lcd>
 200:	27000193          	li	gp,624
 204:	554000ef          	jal	758 <delay>
 208:	00100f13          	li	t5,1
 20c:	03a00193          	li	gp,58
 210:	ecdff0ef          	jal	dc <out_lcd>
 214:	27000193          	li	gp,624
 218:	540000ef          	jal	758 <delay>
 21c:	00100f13          	li	t5,1
 220:	00078193          	mv	gp,a5
 224:	eb9ff0ef          	jal	dc <out_lcd>
 228:	27000193          	li	gp,624
 22c:	52c000ef          	jal	758 <delay>
 230:	00100f13          	li	t5,1
 234:	00048193          	mv	gp,s1
 238:	ea5ff0ef          	jal	dc <out_lcd>
 23c:	27000193          	li	gp,624
 240:	518000ef          	jal	758 <delay>
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
 268:	4f0000ef          	jal	758 <delay>
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
 2c4:	02010113          	addi	sp,sp,32 # 7020 <delay_loop+0x68ac>
 2c8:	00008437          	lui	s0,0x8
 2cc:	81040413          	addi	s0,s0,-2032 # 7810 <delay_loop+0x709c>
 2d0:	000a0513          	mv	a0,s4
 2d4:	380000ef          	jal	654 <seven_seg_decode>
 2d8:	00610023          	sb	t1,0(sp)
 2dc:	000a8513          	mv	a0,s5
 2e0:	374000ef          	jal	654 <seven_seg_decode>
 2e4:	006100a3          	sb	t1,1(sp)
 2e8:	000b0513          	mv	a0,s6
 2ec:	368000ef          	jal	654 <seven_seg_decode>
 2f0:	00610123          	sb	t1,2(sp)
 2f4:	000b8513          	mv	a0,s7
 2f8:	35c000ef          	jal	654 <seven_seg_decode>
 2fc:	006101a3          	sb	t1,3(sp)
 300:	000c0513          	mv	a0,s8
 304:	350000ef          	jal	654 <seven_seg_decode>
 308:	00610223          	sb	t1,4(sp)
 30c:	000c8513          	mv	a0,s9
 310:	344000ef          	jal	654 <seven_seg_decode>
 314:	006102a3          	sb	t1,5(sp)
 318:	000d0513          	mv	a0,s10
 31c:	338000ef          	jal	654 <seven_seg_decode>
 320:	00610323          	sb	t1,6(sp)
 324:	000d8513          	mv	a0,s11
 328:	32c000ef          	jal	654 <seven_seg_decode>
 32c:	006103a3          	sb	t1,7(sp)
 330:	1e00076f          	jal	a4,510 <init_start>

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
 35c:	2f8000ef          	jal	654 <seven_seg_decode>
 360:	00610023          	sb	t1,0(sp)
 364:	001a0a13          	addi	s4,s4,1
 368:	404000ef          	jal	76c <delay_10ms>
 36c:	fc3a14e3          	bne	s4,gp,334 <here>
 370:	00000a13          	li	s4,0
 374:	000a0513          	mv	a0,s4
 378:	030a0493          	addi	s1,s4,48
 37c:	2d8000ef          	jal	654 <seven_seg_decode>
 380:	00610023          	sb	t1,0(sp)
 384:	001a8a93          	addi	s5,s5,1
 388:	000a8513          	mv	a0,s5
 38c:	030a8793          	addi	a5,s5,48
 390:	2c4000ef          	jal	654 <seven_seg_decode>
 394:	006100a3          	sb	t1,1(sp)
 398:	f9521ee3          	bne	tp,s5,334 <here>
 39c:	00000a93          	li	s5,0
 3a0:	000a8513          	mv	a0,s5
 3a4:	030a8793          	addi	a5,s5,48
 3a8:	2ac000ef          	jal	654 <seven_seg_decode>
 3ac:	006100a3          	sb	t1,1(sp)
 3b0:	001b0b13          	addi	s6,s6,1
 3b4:	000b0513          	mv	a0,s6
 3b8:	030b0813          	addi	a6,s6,48
 3bc:	298000ef          	jal	654 <seven_seg_decode>
 3c0:	00610123          	sb	t1,2(sp)
 3c4:	f76218e3          	bne	tp,s6,334 <here>
 3c8:	00000b13          	li	s6,0
 3cc:	000b0513          	mv	a0,s6
 3d0:	030b0813          	addi	a6,s6,48
 3d4:	280000ef          	jal	654 <seven_seg_decode>
 3d8:	00610123          	sb	t1,2(sp)
 3dc:	001b8b93          	addi	s7,s7,1
 3e0:	000b8513          	mv	a0,s7
 3e4:	030b8893          	addi	a7,s7,48
 3e8:	26c000ef          	jal	654 <seven_seg_decode>
 3ec:	006101a3          	sb	t1,3(sp)
 3f0:	f57392e3          	bne	t2,s7,334 <here>
 3f4:	00000b93          	li	s7,0
 3f8:	000b8513          	mv	a0,s7
 3fc:	030b8893          	addi	a7,s7,48
 400:	254000ef          	jal	654 <seven_seg_decode>
 404:	006101a3          	sb	t1,3(sp)
 408:	001c0c13          	addi	s8,s8,1
 40c:	000c0513          	mv	a0,s8
 410:	030c0913          	addi	s2,s8,48
 414:	240000ef          	jal	654 <seven_seg_decode>
 418:	00610223          	sb	t1,4(sp)
 41c:	f1821ce3          	bne	tp,s8,334 <here>
 420:	00000c13          	li	s8,0
 424:	000c0513          	mv	a0,s8
 428:	030c0913          	addi	s2,s8,48
 42c:	228000ef          	jal	654 <seven_seg_decode>
 430:	00610223          	sb	t1,4(sp)
 434:	001c8c93          	addi	s9,s9,1
 438:	000c8513          	mv	a0,s9
 43c:	030c8993          	addi	s3,s9,48
 440:	214000ef          	jal	654 <seven_seg_decode>
 444:	006102a3          	sb	t1,5(sp)
 448:	ef9396e3          	bne	t2,s9,334 <here>
 44c:	00000c93          	li	s9,0
 450:	000c8513          	mv	a0,s9
 454:	030c8993          	addi	s3,s9,48
 458:	1fc000ef          	jal	654 <seven_seg_decode>
 45c:	006102a3          	sb	t1,5(sp)
 460:	001d0d13          	addi	s10,s10,1
 464:	000d0513          	mv	a0,s10
 468:	030d0e13          	addi	t3,s10,48
 46c:	1e8000ef          	jal	654 <seven_seg_decode>
 470:	00610323          	sb	t1,6(sp)
 474:	eda210e3          	bne	tp,s10,334 <here>
 478:	00000d13          	li	s10,0
 47c:	000d0513          	mv	a0,s10
 480:	030d0e13          	addi	t3,s10,48
 484:	1d0000ef          	jal	654 <seven_seg_decode>
 488:	00610323          	sb	t1,6(sp)
 48c:	001d8d93          	addi	s11,s11,1
 490:	000d8513          	mv	a0,s11
 494:	030d8e93          	addi	t4,s11,48
 498:	1bc000ef          	jal	654 <seven_seg_decode>
 49c:	006103a3          	sb	t1,7(sp)
 4a0:	e9b21ae3          	bne	tp,s11,334 <here>
 4a4:	00000d93          	li	s11,0
 4a8:	000d8513          	mv	a0,s11
 4ac:	030d8e93          	addi	t4,s11,48
 4b0:	1a4000ef          	jal	654 <seven_seg_decode>
 4b4:	006103a3          	sb	t1,7(sp)
 4b8:	e7dff06f          	j	334 <here>

000004bc <stop>:
 4bc:	00008713          	mv	a4,ra
 4c0:	00000693          	li	a3,0

000004c4 <P_WAIT>:
 4c4:	00040583          	lb	a1,0(s0)
 4c8:	0025f613          	andi	a2,a1,2
 4cc:	00061463          	bnez	a2,4d4 <cont>
 4d0:	050000ef          	jal	520 <reset>

000004d4 <cont>:
 4d4:	0085f613          	andi	a2,a1,8
 4d8:	fe0616e3          	bnez	a2,4c4 <P_WAIT>
 4dc:	290000ef          	jal	76c <delay_10ms>
 4e0:	28c000ef          	jal	76c <delay_10ms>
 4e4:	00040583          	lb	a1,0(s0)
 4e8:	0085f613          	andi	a2,a1,8
 4ec:	fc061ce3          	bnez	a2,4c4 <P_WAIT>

000004f0 <R_WAIT>:
 4f0:	00040583          	lb	a1,0(s0)
 4f4:	0085f613          	andi	a2,a1,8
 4f8:	fe060ce3          	beqz	a2,4f0 <R_WAIT>
 4fc:	270000ef          	jal	76c <delay_10ms>
 500:	26c000ef          	jal	76c <delay_10ms>
 504:	00040583          	lb	a1,0(s0)
 508:	0085f613          	andi	a2,a1,8
 50c:	fe0602e3          	beqz	a2,4f0 <R_WAIT>

00000510 <init_start>:
 510:	00069663          	bnez	a3,51c <run>
 514:	00168693          	addi	a3,a3,1
 518:	fadff06f          	j	4c4 <P_WAIT>

0000051c <run>:
 51c:	00070067          	jr	a4

00000520 <reset>:
 520:	00002137          	lui	sp,0x2
 524:	00112023          	sw	ra,0(sp) # 2000 <delay_loop+0x188c>

00000528 <P_WAIT2>:
 528:	00040583          	lb	a1,0(s0)
 52c:	0025f613          	andi	a2,a1,2
 530:	fe061ce3          	bnez	a2,528 <P_WAIT2>
 534:	238000ef          	jal	76c <delay_10ms>
 538:	234000ef          	jal	76c <delay_10ms>
 53c:	00040583          	lb	a1,0(s0)
 540:	0025f613          	andi	a2,a1,2
 544:	fe0612e3          	bnez	a2,528 <P_WAIT2>

00000548 <R_WAIT2>:
 548:	00040583          	lb	a1,0(s0)
 54c:	0025f613          	andi	a2,a1,2
 550:	fe060ce3          	beqz	a2,548 <R_WAIT2>
 554:	218000ef          	jal	76c <delay_10ms>
 558:	214000ef          	jal	76c <delay_10ms>
 55c:	00040583          	lb	a1,0(s0)
 560:	0025f613          	andi	a2,a1,2
 564:	fe0602e3          	beqz	a2,548 <R_WAIT2>
 568:	00000a13          	li	s4,0
 56c:	00000a93          	li	s5,0
 570:	00000b13          	li	s6,0
 574:	00000b93          	li	s7,0
 578:	00000c13          	li	s8,0
 57c:	00000c93          	li	s9,0
 580:	00000d13          	li	s10,0
 584:	00000d93          	li	s11,0
 588:	00007137          	lui	sp,0x7
 58c:	02010113          	addi	sp,sp,32 # 7020 <delay_loop+0x68ac>
 590:	000a0513          	mv	a0,s4
 594:	0c0000ef          	jal	654 <seven_seg_decode>
 598:	00610023          	sb	t1,0(sp)
 59c:	000a8513          	mv	a0,s5
 5a0:	0b4000ef          	jal	654 <seven_seg_decode>
 5a4:	006100a3          	sb	t1,1(sp)
 5a8:	000b0513          	mv	a0,s6
 5ac:	0a8000ef          	jal	654 <seven_seg_decode>
 5b0:	00610123          	sb	t1,2(sp)
 5b4:	000b8513          	mv	a0,s7
 5b8:	09c000ef          	jal	654 <seven_seg_decode>
 5bc:	006101a3          	sb	t1,3(sp)
 5c0:	000c0513          	mv	a0,s8
 5c4:	090000ef          	jal	654 <seven_seg_decode>
 5c8:	00610223          	sb	t1,4(sp)
 5cc:	000c8513          	mv	a0,s9
 5d0:	084000ef          	jal	654 <seven_seg_decode>
 5d4:	006102a3          	sb	t1,5(sp)
 5d8:	000d0513          	mv	a0,s10
 5dc:	078000ef          	jal	654 <seven_seg_decode>
 5e0:	00610323          	sb	t1,6(sp)
 5e4:	000d8513          	mv	a0,s11
 5e8:	06c000ef          	jal	654 <seven_seg_decode>
 5ec:	006103a3          	sb	t1,7(sp)
 5f0:	00000213          	li	tp,0
 5f4:	00100193          	li	gp,1
 5f8:	ae5ff0ef          	jal	dc <out_lcd>
 5fc:	000031b7          	lui	gp,0x3
 600:	0d318193          	addi	gp,gp,211 # 30d3 <delay_loop+0x295f>
 604:	154000ef          	jal	758 <delay>
 608:	00000213          	li	tp,0
 60c:	08200193          	li	gp,130
 610:	acdff0ef          	jal	dc <out_lcd>
 614:	27000193          	li	gp,624
 618:	140000ef          	jal	758 <delay>
 61c:	03000493          	li	s1,48
 620:	03000793          	li	a5,48
 624:	03000813          	li	a6,48
 628:	03000893          	li	a7,48
 62c:	03000913          	li	s2,48
 630:	03000993          	li	s3,48
 634:	03000e13          	li	t3,48
 638:	03000e93          	li	t4,48
 63c:	00100f93          	li	t6,1
 640:	00002137          	lui	sp,0x2
 644:	00012083          	lw	ra,0(sp) # 2000 <delay_loop+0x188c>
 648:	00007137          	lui	sp,0x7
 64c:	02010113          	addi	sp,sp,32 # 7020 <delay_loop+0x68ac>
 650:	00008067          	ret

00000654 <seven_seg_decode>:
 654:	00000293          	li	t0,0
 658:	08550063          	beq	a0,t0,6d8 <display_0>
 65c:	00100293          	li	t0,1
 660:	08550063          	beq	a0,t0,6e0 <display_1>
 664:	00200293          	li	t0,2
 668:	08550063          	beq	a0,t0,6e8 <display_2>
 66c:	00300293          	li	t0,3
 670:	08550063          	beq	a0,t0,6f0 <display_3>
 674:	00400293          	li	t0,4
 678:	08550063          	beq	a0,t0,6f8 <display_4>
 67c:	00500293          	li	t0,5
 680:	08550063          	beq	a0,t0,700 <display_5>
 684:	00600293          	li	t0,6
 688:	08550063          	beq	a0,t0,708 <display_6>
 68c:	00700293          	li	t0,7
 690:	08550063          	beq	a0,t0,710 <display_7>
 694:	00800293          	li	t0,8
 698:	08550063          	beq	a0,t0,718 <display_8>
 69c:	00900293          	li	t0,9
 6a0:	08550063          	beq	a0,t0,720 <display_9>
 6a4:	00a00293          	li	t0,10
 6a8:	08550063          	beq	a0,t0,728 <display_A>
 6ac:	00b00293          	li	t0,11
 6b0:	08550063          	beq	a0,t0,730 <display_B>
 6b4:	00c00293          	li	t0,12
 6b8:	08550063          	beq	a0,t0,738 <display_C>
 6bc:	00d00293          	li	t0,13
 6c0:	08550063          	beq	a0,t0,740 <display_D>
 6c4:	00e00293          	li	t0,14
 6c8:	08550063          	beq	a0,t0,748 <display_E>
 6cc:	00f00293          	li	t0,15
 6d0:	08550063          	beq	a0,t0,750 <display_F>
 6d4:	00008067          	ret

000006d8 <display_0>:
 6d8:	04000313          	li	t1,64
 6dc:	00008067          	ret

000006e0 <display_1>:
 6e0:	07900313          	li	t1,121
 6e4:	00008067          	ret

000006e8 <display_2>:
 6e8:	02400313          	li	t1,36
 6ec:	00008067          	ret

000006f0 <display_3>:
 6f0:	03000313          	li	t1,48
 6f4:	00008067          	ret

000006f8 <display_4>:
 6f8:	01900313          	li	t1,25
 6fc:	00008067          	ret

00000700 <display_5>:
 700:	01200313          	li	t1,18
 704:	00008067          	ret

00000708 <display_6>:
 708:	00200313          	li	t1,2
 70c:	00008067          	ret

00000710 <display_7>:
 710:	07800313          	li	t1,120
 714:	00008067          	ret

00000718 <display_8>:
 718:	00000313          	li	t1,0
 71c:	00008067          	ret

00000720 <display_9>:
 720:	01000313          	li	t1,16
 724:	00008067          	ret

00000728 <display_A>:
 728:	00800313          	li	t1,8
 72c:	00008067          	ret

00000730 <display_B>:
 730:	00300313          	li	t1,3
 734:	00008067          	ret

00000738 <display_C>:
 738:	04600313          	li	t1,70
 73c:	00008067          	ret

00000740 <display_D>:
 740:	02100313          	li	t1,33
 744:	00008067          	ret

00000748 <display_E>:
 748:	00600313          	li	t1,6
 74c:	00008067          	ret

00000750 <display_F>:
 750:	00e00313          	li	t1,14
 754:	00008067          	ret

00000758 <delay>:
 758:	003002b3          	add	t0,zero,gp

0000075c <dloop>:
 75c:	fff28293          	addi	t0,t0,-1
 760:	fe029ee3          	bnez	t0,75c <dloop>
 764:	00a00193          	li	gp,10
 768:	00008067          	ret

0000076c <delay_10ms>:
 76c:	0000f2b7          	lui	t0,0xf
 770:	42428293          	addi	t0,t0,1060 # f424 <delay_loop+0xecb0>

00000774 <delay_loop>:
 774:	fff28293          	addi	t0,t0,-1
 778:	fe029ee3          	bnez	t0,774 <delay_loop>
 77c:	00008067          	ret
