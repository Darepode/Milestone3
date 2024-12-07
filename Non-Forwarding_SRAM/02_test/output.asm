
../02_test/test_assembly.o:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	00000013          	nop
   4:	00000013          	nop
   8:	00000013          	nop

0000000c <power_reset_lcd>:
   c:	00007137          	lui	sp,0x7
  10:	03010113          	addi	sp,sp,48 # 7030 <delay_loop+0x68d0>
  14:	c00001b7          	lui	gp,0xc0000
  18:	00312023          	sw	gp,0(sp)
  1c:	00500193          	li	gp,5
  20:	728000ef          	jal	748 <delay>
  24:	00000213          	li	tp,0
  28:	03000193          	li	gp,48
  2c:	09c000ef          	jal	c8 <out_lcd>
  30:	00500193          	li	gp,5
  34:	714000ef          	jal	748 <delay>
  38:	00000213          	li	tp,0
  3c:	03000193          	li	gp,48
  40:	088000ef          	jal	c8 <out_lcd>
  44:	00500193          	li	gp,5
  48:	700000ef          	jal	748 <delay>
  4c:	00000213          	li	tp,0
  50:	03000193          	li	gp,48
  54:	074000ef          	jal	c8 <out_lcd>
  58:	00500193          	li	gp,5
  5c:	6ec000ef          	jal	748 <delay>

00000060 <init_lcd>:
  60:	00000213          	li	tp,0
  64:	03800193          	li	gp,56
  68:	060000ef          	jal	c8 <out_lcd>
  6c:	00500193          	li	gp,5
  70:	6d8000ef          	jal	748 <delay>
  74:	00000213          	li	tp,0
  78:	00100193          	li	gp,1
  7c:	04c000ef          	jal	c8 <out_lcd>
  80:	00500193          	li	gp,5
  84:	6c4000ef          	jal	748 <delay>
  88:	00000213          	li	tp,0
  8c:	00c00193          	li	gp,12
  90:	038000ef          	jal	c8 <out_lcd>
  94:	00500193          	li	gp,5
  98:	6b0000ef          	jal	748 <delay>
  9c:	00000213          	li	tp,0
  a0:	00600193          	li	gp,6
  a4:	024000ef          	jal	c8 <out_lcd>
  a8:	00500193          	li	gp,5
  ac:	69c000ef          	jal	748 <delay>
  b0:	00000213          	li	tp,0
  b4:	08200193          	li	gp,130
  b8:	010000ef          	jal	c8 <out_lcd>
  bc:	00500193          	li	gp,5
  c0:	688000ef          	jal	748 <delay>
  c4:	1980006f          	j	25c <init_prog>

000000c8 <out_lcd>:
  c8:	00008393          	mv	t2,ra
  cc:	00007137          	lui	sp,0x7
  d0:	03010113          	addi	sp,sp,48 # 7030 <delay_loop+0x68d0>
  d4:	000f0663          	beqz	t5,e0 <command>
  d8:	60018193          	addi	gp,gp,1536 # c0000600 <delay_loop+0xbffffea0>
  dc:	0080006f          	j	e4 <send>

000000e0 <command>:
  e0:	40018193          	addi	gp,gp,1024

000000e4 <send>:
  e4:	00311023          	sh	gp,0(sp)
  e8:	00500193          	li	gp,5
  ec:	65c000ef          	jal	748 <delay>
  f0:	000110a3          	sh	zero,1(sp)
  f4:	00038093          	mv	ra,t2
  f8:	00a00193          	li	gp,10
  fc:	00a00213          	li	tp,10
 100:	00600393          	li	t2,6
 104:	00007137          	lui	sp,0x7
 108:	02010113          	addi	sp,sp,32 # 7020 <delay_loop+0x68c0>
 10c:	00008067          	ret

00000110 <lap>:
 110:	00008713          	mv	a4,ra

00000114 <P_WAIT1>:
 114:	00040583          	lb	a1,0(s0)
 118:	0045f613          	andi	a2,a1,4
 11c:	fe061ce3          	bnez	a2,114 <P_WAIT1>
 120:	63c000ef          	jal	75c <delay_10ms>
 124:	638000ef          	jal	75c <delay_10ms>
 128:	00040583          	lb	a1,0(s0)
 12c:	0045f613          	andi	a2,a1,4
 130:	fe0612e3          	bnez	a2,114 <P_WAIT1>

00000134 <R_WAIT1>:
 134:	00040583          	lb	a1,0(s0)
 138:	0045f613          	andi	a2,a1,4
 13c:	fe060ce3          	beqz	a2,134 <R_WAIT1>
 140:	61c000ef          	jal	75c <delay_10ms>
 144:	618000ef          	jal	75c <delay_10ms>
 148:	00040583          	lb	a1,0(s0)
 14c:	0045f613          	andi	a2,a1,4
 150:	fe0602e3          	beqz	a2,134 <R_WAIT1>
 154:	00100f13          	li	t5,1
 158:	000e8193          	mv	gp,t4
 15c:	f6dff0ef          	jal	c8 <out_lcd>
 160:	00500193          	li	gp,5
 164:	5e4000ef          	jal	748 <delay>
 168:	00100f13          	li	t5,1
 16c:	000e0193          	mv	gp,t3
 170:	f59ff0ef          	jal	c8 <out_lcd>
 174:	00500193          	li	gp,5
 178:	5d0000ef          	jal	748 <delay>
 17c:	00100f13          	li	t5,1
 180:	03a00193          	li	gp,58
 184:	f45ff0ef          	jal	c8 <out_lcd>
 188:	00500193          	li	gp,5
 18c:	5bc000ef          	jal	748 <delay>
 190:	00100f13          	li	t5,1
 194:	00098193          	mv	gp,s3
 198:	f31ff0ef          	jal	c8 <out_lcd>
 19c:	00500193          	li	gp,5
 1a0:	5a8000ef          	jal	748 <delay>
 1a4:	00100f13          	li	t5,1
 1a8:	00090193          	mv	gp,s2
 1ac:	f1dff0ef          	jal	c8 <out_lcd>
 1b0:	00500193          	li	gp,5
 1b4:	594000ef          	jal	748 <delay>
 1b8:	00100f13          	li	t5,1
 1bc:	03a00193          	li	gp,58
 1c0:	f09ff0ef          	jal	c8 <out_lcd>
 1c4:	00500193          	li	gp,5
 1c8:	580000ef          	jal	748 <delay>
 1cc:	00100f13          	li	t5,1
 1d0:	00088193          	mv	gp,a7
 1d4:	ef5ff0ef          	jal	c8 <out_lcd>
 1d8:	00500193          	li	gp,5
 1dc:	56c000ef          	jal	748 <delay>
 1e0:	00100f13          	li	t5,1
 1e4:	00080193          	mv	gp,a6
 1e8:	ee1ff0ef          	jal	c8 <out_lcd>
 1ec:	00500193          	li	gp,5
 1f0:	558000ef          	jal	748 <delay>
 1f4:	00100f13          	li	t5,1
 1f8:	03a00193          	li	gp,58
 1fc:	ecdff0ef          	jal	c8 <out_lcd>
 200:	00500193          	li	gp,5
 204:	544000ef          	jal	748 <delay>
 208:	00100f13          	li	t5,1
 20c:	00078193          	mv	gp,a5
 210:	eb9ff0ef          	jal	c8 <out_lcd>
 214:	00500193          	li	gp,5
 218:	530000ef          	jal	748 <delay>
 21c:	00100f13          	li	t5,1
 220:	00048193          	mv	gp,s1
 224:	ea5ff0ef          	jal	c8 <out_lcd>
 228:	00500193          	li	gp,5
 22c:	51c000ef          	jal	748 <delay>
 230:	000f9863          	bnez	t6,240 <row2>
 234:	08200193          	li	gp,130
 238:	00100f93          	li	t6,1
 23c:	00c0006f          	j	248 <movecur>

00000240 <row2>:
 240:	0c200193          	li	gp,194
 244:	00000f93          	li	t6,0

00000248 <movecur>:
 248:	00000f13          	li	t5,0
 24c:	e7dff0ef          	jal	c8 <out_lcd>
 250:	00500193          	li	gp,5
 254:	4f4000ef          	jal	748 <delay>
 258:	00070067          	jr	a4

0000025c <init_prog>:
 25c:	00a00193          	li	gp,10
 260:	00a00213          	li	tp,10
 264:	00600393          	li	t2,6
 268:	00000a13          	li	s4,0
 26c:	00000a93          	li	s5,0
 270:	00000b13          	li	s6,0
 274:	00000b93          	li	s7,0
 278:	00000c13          	li	s8,0
 27c:	00000c93          	li	s9,0
 280:	00000d13          	li	s10,0
 284:	00000d93          	li	s11,0
 288:	03000493          	li	s1,48
 28c:	03000793          	li	a5,48
 290:	03000813          	li	a6,48
 294:	03000893          	li	a7,48
 298:	03000913          	li	s2,48
 29c:	03000993          	li	s3,48
 2a0:	03000e13          	li	t3,48
 2a4:	03000e93          	li	t4,48
 2a8:	00100f93          	li	t6,1
 2ac:	00007137          	lui	sp,0x7
 2b0:	02010113          	addi	sp,sp,32 # 7020 <delay_loop+0x68c0>
 2b4:	00008437          	lui	s0,0x8
 2b8:	81040413          	addi	s0,s0,-2032 # 7810 <delay_loop+0x70b0>
 2bc:	000a0513          	mv	a0,s4
 2c0:	384000ef          	jal	644 <seven_seg_decode>
 2c4:	00610023          	sb	t1,0(sp)
 2c8:	000a8513          	mv	a0,s5
 2cc:	378000ef          	jal	644 <seven_seg_decode>
 2d0:	006100a3          	sb	t1,1(sp)
 2d4:	000b0513          	mv	a0,s6
 2d8:	36c000ef          	jal	644 <seven_seg_decode>
 2dc:	00610123          	sb	t1,2(sp)
 2e0:	000b8513          	mv	a0,s7
 2e4:	360000ef          	jal	644 <seven_seg_decode>
 2e8:	006101a3          	sb	t1,3(sp)
 2ec:	000c0513          	mv	a0,s8
 2f0:	354000ef          	jal	644 <seven_seg_decode>
 2f4:	00610223          	sb	t1,4(sp)
 2f8:	000c8513          	mv	a0,s9
 2fc:	348000ef          	jal	644 <seven_seg_decode>
 300:	006102a3          	sb	t1,5(sp)
 304:	000d0513          	mv	a0,s10
 308:	33c000ef          	jal	644 <seven_seg_decode>
 30c:	00610323          	sb	t1,6(sp)
 310:	000d8513          	mv	a0,s11
 314:	330000ef          	jal	644 <seven_seg_decode>
 318:	006103a3          	sb	t1,7(sp)
 31c:	1e00076f          	jal	a4,4fc <init_start>

00000320 <here>:
 320:	00040583          	lb	a1,0(s0)
 324:	0085f613          	andi	a2,a1,8
 328:	00061463          	bnez	a2,330 <check1>
 32c:	17c000ef          	jal	4a8 <stop>

00000330 <check1>:
 330:	00040583          	lb	a1,0(s0)
 334:	0045f613          	andi	a2,a1,4
 338:	00061463          	bnez	a2,340 <skip>
 33c:	dd5ff0ef          	jal	110 <lap>

00000340 <skip>:
 340:	000a0513          	mv	a0,s4
 344:	030a0493          	addi	s1,s4,48
 348:	2fc000ef          	jal	644 <seven_seg_decode>
 34c:	00610023          	sb	t1,0(sp)
 350:	001a0a13          	addi	s4,s4,1
 354:	408000ef          	jal	75c <delay_10ms>
 358:	fc3a14e3          	bne	s4,gp,320 <here>
 35c:	00000a13          	li	s4,0
 360:	000a0513          	mv	a0,s4
 364:	030a0493          	addi	s1,s4,48
 368:	2dc000ef          	jal	644 <seven_seg_decode>
 36c:	00610023          	sb	t1,0(sp)
 370:	001a8a93          	addi	s5,s5,1
 374:	000a8513          	mv	a0,s5
 378:	030a8793          	addi	a5,s5,48
 37c:	2c8000ef          	jal	644 <seven_seg_decode>
 380:	006100a3          	sb	t1,1(sp)
 384:	f9521ee3          	bne	tp,s5,320 <here>
 388:	00000a93          	li	s5,0
 38c:	000a8513          	mv	a0,s5
 390:	030a8793          	addi	a5,s5,48
 394:	2b0000ef          	jal	644 <seven_seg_decode>
 398:	006100a3          	sb	t1,1(sp)
 39c:	001b0b13          	addi	s6,s6,1
 3a0:	000b0513          	mv	a0,s6
 3a4:	030b0813          	addi	a6,s6,48
 3a8:	29c000ef          	jal	644 <seven_seg_decode>
 3ac:	00610123          	sb	t1,2(sp)
 3b0:	f76218e3          	bne	tp,s6,320 <here>
 3b4:	00000b13          	li	s6,0
 3b8:	000b0513          	mv	a0,s6
 3bc:	030b0813          	addi	a6,s6,48
 3c0:	284000ef          	jal	644 <seven_seg_decode>
 3c4:	00610123          	sb	t1,2(sp)
 3c8:	001b8b93          	addi	s7,s7,1
 3cc:	000b8513          	mv	a0,s7
 3d0:	030b8893          	addi	a7,s7,48
 3d4:	270000ef          	jal	644 <seven_seg_decode>
 3d8:	006101a3          	sb	t1,3(sp)
 3dc:	f57392e3          	bne	t2,s7,320 <here>
 3e0:	00000b93          	li	s7,0
 3e4:	000b8513          	mv	a0,s7
 3e8:	030b8893          	addi	a7,s7,48
 3ec:	258000ef          	jal	644 <seven_seg_decode>
 3f0:	006101a3          	sb	t1,3(sp)
 3f4:	001c0c13          	addi	s8,s8,1
 3f8:	000c0513          	mv	a0,s8
 3fc:	030c0913          	addi	s2,s8,48
 400:	244000ef          	jal	644 <seven_seg_decode>
 404:	00610223          	sb	t1,4(sp)
 408:	f1821ce3          	bne	tp,s8,320 <here>
 40c:	00000c13          	li	s8,0
 410:	000c0513          	mv	a0,s8
 414:	030c0913          	addi	s2,s8,48
 418:	22c000ef          	jal	644 <seven_seg_decode>
 41c:	00610223          	sb	t1,4(sp)
 420:	001c8c93          	addi	s9,s9,1
 424:	000c8513          	mv	a0,s9
 428:	030c8993          	addi	s3,s9,48
 42c:	218000ef          	jal	644 <seven_seg_decode>
 430:	006102a3          	sb	t1,5(sp)
 434:	ef9396e3          	bne	t2,s9,320 <here>
 438:	00000c93          	li	s9,0
 43c:	000c8513          	mv	a0,s9
 440:	030c8993          	addi	s3,s9,48
 444:	200000ef          	jal	644 <seven_seg_decode>
 448:	006102a3          	sb	t1,5(sp)
 44c:	001d0d13          	addi	s10,s10,1
 450:	000d0513          	mv	a0,s10
 454:	030d0e13          	addi	t3,s10,48
 458:	1ec000ef          	jal	644 <seven_seg_decode>
 45c:	00610323          	sb	t1,6(sp)
 460:	eda210e3          	bne	tp,s10,320 <here>
 464:	00000d13          	li	s10,0
 468:	000d0513          	mv	a0,s10
 46c:	030d0e13          	addi	t3,s10,48
 470:	1d4000ef          	jal	644 <seven_seg_decode>
 474:	00610323          	sb	t1,6(sp)
 478:	001d8d93          	addi	s11,s11,1
 47c:	000d8513          	mv	a0,s11
 480:	030d8e93          	addi	t4,s11,48
 484:	1c0000ef          	jal	644 <seven_seg_decode>
 488:	006103a3          	sb	t1,7(sp)
 48c:	e9b21ae3          	bne	tp,s11,320 <here>
 490:	00000d93          	li	s11,0
 494:	000d8513          	mv	a0,s11
 498:	030d8e93          	addi	t4,s11,48
 49c:	1a8000ef          	jal	644 <seven_seg_decode>
 4a0:	006103a3          	sb	t1,7(sp)
 4a4:	e7dff06f          	j	320 <here>

000004a8 <stop>:
 4a8:	00008713          	mv	a4,ra
 4ac:	00000693          	li	a3,0

000004b0 <P_WAIT>:
 4b0:	00040583          	lb	a1,0(s0)
 4b4:	0025f613          	andi	a2,a1,2
 4b8:	00061463          	bnez	a2,4c0 <cont>
 4bc:	050000ef          	jal	50c <reset>

000004c0 <cont>:
 4c0:	0085f613          	andi	a2,a1,8
 4c4:	fe0616e3          	bnez	a2,4b0 <P_WAIT>
 4c8:	294000ef          	jal	75c <delay_10ms>
 4cc:	290000ef          	jal	75c <delay_10ms>
 4d0:	00040583          	lb	a1,0(s0)
 4d4:	0085f613          	andi	a2,a1,8
 4d8:	fc061ce3          	bnez	a2,4b0 <P_WAIT>

000004dc <R_WAIT>:
 4dc:	00040583          	lb	a1,0(s0)
 4e0:	0085f613          	andi	a2,a1,8
 4e4:	fe060ce3          	beqz	a2,4dc <R_WAIT>
 4e8:	274000ef          	jal	75c <delay_10ms>
 4ec:	270000ef          	jal	75c <delay_10ms>
 4f0:	00040583          	lb	a1,0(s0)
 4f4:	0085f613          	andi	a2,a1,8
 4f8:	fe0602e3          	beqz	a2,4dc <R_WAIT>

000004fc <init_start>:
 4fc:	00069663          	bnez	a3,508 <run>
 500:	00168693          	addi	a3,a3,1
 504:	fadff06f          	j	4b0 <P_WAIT>

00000508 <run>:
 508:	00070067          	jr	a4

0000050c <reset>:
 50c:	00002137          	lui	sp,0x2
 510:	10010113          	addi	sp,sp,256 # 2100 <delay_loop+0x19a0>
 514:	00112023          	sw	ra,0(sp)

00000518 <P_WAIT2>:
 518:	00040583          	lb	a1,0(s0)
 51c:	0025f613          	andi	a2,a1,2
 520:	fe061ce3          	bnez	a2,518 <P_WAIT2>
 524:	238000ef          	jal	75c <delay_10ms>
 528:	234000ef          	jal	75c <delay_10ms>
 52c:	00040583          	lb	a1,0(s0)
 530:	0025f613          	andi	a2,a1,2
 534:	fe0612e3          	bnez	a2,518 <P_WAIT2>

00000538 <R_WAIT2>:
 538:	00040583          	lb	a1,0(s0)
 53c:	0025f613          	andi	a2,a1,2
 540:	fe060ce3          	beqz	a2,538 <R_WAIT2>
 544:	218000ef          	jal	75c <delay_10ms>
 548:	214000ef          	jal	75c <delay_10ms>
 54c:	00040583          	lb	a1,0(s0)
 550:	0025f613          	andi	a2,a1,2
 554:	fe0602e3          	beqz	a2,538 <R_WAIT2>
 558:	00000a13          	li	s4,0
 55c:	00000a93          	li	s5,0
 560:	00000b13          	li	s6,0
 564:	00000b93          	li	s7,0
 568:	00000c13          	li	s8,0
 56c:	00000c93          	li	s9,0
 570:	00000d13          	li	s10,0
 574:	00000d93          	li	s11,0
 578:	00007137          	lui	sp,0x7
 57c:	02010113          	addi	sp,sp,32 # 7020 <delay_loop+0x68c0>
 580:	000a0513          	mv	a0,s4
 584:	0c0000ef          	jal	644 <seven_seg_decode>
 588:	00610023          	sb	t1,0(sp)
 58c:	000a8513          	mv	a0,s5
 590:	0b4000ef          	jal	644 <seven_seg_decode>
 594:	006100a3          	sb	t1,1(sp)
 598:	000b0513          	mv	a0,s6
 59c:	0a8000ef          	jal	644 <seven_seg_decode>
 5a0:	00610123          	sb	t1,2(sp)
 5a4:	000b8513          	mv	a0,s7
 5a8:	09c000ef          	jal	644 <seven_seg_decode>
 5ac:	006101a3          	sb	t1,3(sp)
 5b0:	000c0513          	mv	a0,s8
 5b4:	090000ef          	jal	644 <seven_seg_decode>
 5b8:	00610223          	sb	t1,4(sp)
 5bc:	000c8513          	mv	a0,s9
 5c0:	084000ef          	jal	644 <seven_seg_decode>
 5c4:	006102a3          	sb	t1,5(sp)
 5c8:	000d0513          	mv	a0,s10
 5cc:	078000ef          	jal	644 <seven_seg_decode>
 5d0:	00610323          	sb	t1,6(sp)
 5d4:	000d8513          	mv	a0,s11
 5d8:	06c000ef          	jal	644 <seven_seg_decode>
 5dc:	006103a3          	sb	t1,7(sp)
 5e0:	00000213          	li	tp,0
 5e4:	00100193          	li	gp,1
 5e8:	ae1ff0ef          	jal	c8 <out_lcd>
 5ec:	00500193          	li	gp,5
 5f0:	158000ef          	jal	748 <delay>
 5f4:	00000213          	li	tp,0
 5f8:	08200193          	li	gp,130
 5fc:	acdff0ef          	jal	c8 <out_lcd>
 600:	00500193          	li	gp,5
 604:	144000ef          	jal	748 <delay>
 608:	03000493          	li	s1,48
 60c:	03000793          	li	a5,48
 610:	03000813          	li	a6,48
 614:	03000893          	li	a7,48
 618:	03000913          	li	s2,48
 61c:	03000993          	li	s3,48
 620:	03000e13          	li	t3,48
 624:	03000e93          	li	t4,48
 628:	00100f93          	li	t6,1
 62c:	00002137          	lui	sp,0x2
 630:	10010113          	addi	sp,sp,256 # 2100 <delay_loop+0x19a0>
 634:	00012083          	lw	ra,0(sp)
 638:	00007137          	lui	sp,0x7
 63c:	02010113          	addi	sp,sp,32 # 7020 <delay_loop+0x68c0>
 640:	00008067          	ret

00000644 <seven_seg_decode>:
 644:	00000293          	li	t0,0
 648:	08550063          	beq	a0,t0,6c8 <display_0>
 64c:	00100293          	li	t0,1
 650:	08550063          	beq	a0,t0,6d0 <display_1>
 654:	00200293          	li	t0,2
 658:	08550063          	beq	a0,t0,6d8 <display_2>
 65c:	00300293          	li	t0,3
 660:	08550063          	beq	a0,t0,6e0 <display_3>
 664:	00400293          	li	t0,4
 668:	08550063          	beq	a0,t0,6e8 <display_4>
 66c:	00500293          	li	t0,5
 670:	08550063          	beq	a0,t0,6f0 <display_5>
 674:	00600293          	li	t0,6
 678:	08550063          	beq	a0,t0,6f8 <display_6>
 67c:	00700293          	li	t0,7
 680:	08550063          	beq	a0,t0,700 <display_7>
 684:	00800293          	li	t0,8
 688:	08550063          	beq	a0,t0,708 <display_8>
 68c:	00900293          	li	t0,9
 690:	08550063          	beq	a0,t0,710 <display_9>
 694:	00a00293          	li	t0,10
 698:	08550063          	beq	a0,t0,718 <display_A>
 69c:	00b00293          	li	t0,11
 6a0:	08550063          	beq	a0,t0,720 <display_B>
 6a4:	00c00293          	li	t0,12
 6a8:	08550063          	beq	a0,t0,728 <display_C>
 6ac:	00d00293          	li	t0,13
 6b0:	08550063          	beq	a0,t0,730 <display_D>
 6b4:	00e00293          	li	t0,14
 6b8:	08550063          	beq	a0,t0,738 <display_E>
 6bc:	00f00293          	li	t0,15
 6c0:	08550063          	beq	a0,t0,740 <display_F>
 6c4:	00008067          	ret

000006c8 <display_0>:
 6c8:	04000313          	li	t1,64
 6cc:	00008067          	ret

000006d0 <display_1>:
 6d0:	07900313          	li	t1,121
 6d4:	00008067          	ret

000006d8 <display_2>:
 6d8:	02400313          	li	t1,36
 6dc:	00008067          	ret

000006e0 <display_3>:
 6e0:	03000313          	li	t1,48
 6e4:	00008067          	ret

000006e8 <display_4>:
 6e8:	01900313          	li	t1,25
 6ec:	00008067          	ret

000006f0 <display_5>:
 6f0:	01200313          	li	t1,18
 6f4:	00008067          	ret

000006f8 <display_6>:
 6f8:	00200313          	li	t1,2
 6fc:	00008067          	ret

00000700 <display_7>:
 700:	07800313          	li	t1,120
 704:	00008067          	ret

00000708 <display_8>:
 708:	00000313          	li	t1,0
 70c:	00008067          	ret

00000710 <display_9>:
 710:	01000313          	li	t1,16
 714:	00008067          	ret

00000718 <display_A>:
 718:	00800313          	li	t1,8
 71c:	00008067          	ret

00000720 <display_B>:
 720:	00300313          	li	t1,3
 724:	00008067          	ret

00000728 <display_C>:
 728:	04600313          	li	t1,70
 72c:	00008067          	ret

00000730 <display_D>:
 730:	02100313          	li	t1,33
 734:	00008067          	ret

00000738 <display_E>:
 738:	00600313          	li	t1,6
 73c:	00008067          	ret

00000740 <display_F>:
 740:	00e00313          	li	t1,14
 744:	00008067          	ret

00000748 <delay>:
 748:	003002b3          	add	t0,zero,gp

0000074c <dloop>:
 74c:	fff28293          	addi	t0,t0,-1
 750:	fe029ee3          	bnez	t0,74c <dloop>
 754:	00a00193          	li	gp,10
 758:	00008067          	ret

0000075c <delay_10ms>:
 75c:	00500293          	li	t0,5

00000760 <delay_loop>:
 760:	fff28293          	addi	t0,t0,-1
 764:	fe029ee3          	bnez	t0,760 <delay_loop>
 768:	00008067          	ret
