
../02_test/test_assembly.o:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	000021b7          	lui	gp,0x2
   4:	10018193          	addi	gp,gp,256 # 2100 <delay_loop+0x20a8>
   8:	00007237          	lui	tp,0x7
   c:	000023b7          	lui	t2,0x2
  10:	11038393          	addi	t2,t2,272 # 2110 <delay_loop+0x20b8>
  14:	00007437          	lui	s0,0x7
  18:	01040413          	addi	s0,s0,16 # 7010 <delay_loop+0x6fb8>
  1c:	0ff00493          	li	s1,255
  20:	00942023          	sw	s1,0(s0)

00000024 <loop>:
  24:	00010137          	lui	sp,0x10
  28:	fff10113          	addi	sp,sp,-1 # ffff <delay_loop+0xffa7>
  2c:	0021a023          	sw	sp,0(gp)
  30:	0001a303          	lw	t1,0(gp)
  34:	00622023          	sw	t1,0(tp) # 7000 <delay_loop+0x6fa8>
  38:	01c000ef          	jal	54 <delay_1s>
  3c:	ffff0137          	lui	sp,0xffff0
  40:	0023a023          	sw	sp,0(t2)
  44:	0003a303          	lw	t1,0(t2)
  48:	00622023          	sw	t1,0(tp) # 0 <_start>
  4c:	008000ef          	jal	54 <delay_1s>
  50:	fd5ff06f          	j	24 <loop>

00000054 <delay_1s>:
  54:	00500293          	li	t0,5

00000058 <delay_loop>:
  58:	fff28293          	addi	t0,t0,-1
  5c:	fe029ee3          	bnez	t0,58 <delay_loop>
  60:	00008067          	ret
