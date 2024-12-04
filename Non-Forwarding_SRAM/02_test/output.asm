
../02_test/test_assembly.o:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	000021b7          	lui	gp,0x2
   4:	10018193          	addi	gp,gp,256 # 2100 <delay_loop+0x20a4>
   8:	00007237          	lui	tp,0x7
   c:	000023b7          	lui	t2,0x2
  10:	11038393          	addi	t2,t2,272 # 2110 <delay_loop+0x20b4>
  14:	00007437          	lui	s0,0x7
  18:	01040413          	addi	s0,s0,16 # 7010 <delay_loop+0x6fb4>
  1c:	0ff00493          	li	s1,255
  20:	00942023          	sw	s1,0(s0)

00000024 <loop>:
  24:	00010137          	lui	sp,0x10
  28:	fff10113          	addi	sp,sp,-1 # ffff <delay_loop+0xffa3>
  2c:	0021a023          	sw	sp,0(gp)
  30:	0001a303          	lw	t1,0(gp)
  34:	00622023          	sw	t1,0(tp) # 7000 <delay_loop+0x6fa4>
  38:	01c000ef          	jal	54 <delay_1s>
  3c:	ffff0137          	lui	sp,0xffff0
  40:	0023a023          	sw	sp,0(t2)
  44:	0003a303          	lw	t1,0(t2)
  48:	00622023          	sw	t1,0(tp) # 0 <_start>
  4c:	008000ef          	jal	54 <delay_1s>
  50:	fd5ff06f          	j	24 <loop>

00000054 <delay_1s>:
  54:	005f62b7          	lui	t0,0x5f6
  58:	e1028293          	addi	t0,t0,-496 # 5f5e10 <delay_loop+0x5f5db4>

0000005c <delay_loop>:
  5c:	fff28293          	addi	t0,t0,-1
  60:	fe029ee3          	bnez	t0,5c <delay_loop>
  64:	00008067          	ret
