
../02_test/test_assembly.o:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	00f00513          	li	a0,15
   4:	00000293          	li	t0,0
   8:	00100313          	li	t1,1
   c:	00100e13          	li	t3,1

00000010 <fibonacci_loop>:
  10:	00050e63          	beqz	a0,2c <end>
  14:	01c50c63          	beq	a0,t3,2c <end>
  18:	006283b3          	add	t2,t0,t1
  1c:	00030293          	mv	t0,t1
  20:	00038313          	mv	t1,t2
  24:	fff50513          	addi	a0,a0,-1
  28:	fe9ff06f          	j	10 <fibonacci_loop>

0000002c <end>:
  2c:	00030513          	mv	a0,t1

00000030 <halt>:
  30:	00000013          	nop
  34:	00000013          	nop
  38:	00000013          	nop
  3c:	00000013          	nop
  40:	00000013          	nop
