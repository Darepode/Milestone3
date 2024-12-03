
../02_test/test_assembly.o:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	00a00093          	li	ra,10

00000004 <loop>:
   4:	fff08093          	addi	ra,ra,-1
   8:	fe101ee3          	bne	zero,ra,4 <loop>
   c:	00000013          	nop
  10:	00000013          	nop
  14:	00000013          	nop
  18:	00000013          	nop
  1c:	00700f93          	li	t6,7

00000020 <here>:
  20:	0000006f          	j	20 <here>
