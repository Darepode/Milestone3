    .section .text
    .globl _start

_start:
    li x1, 10
    loop:
    addi x1,x1,-1
    bne x0,x1, loop

    nop
    nop
    nop
    nop

    addi x31, x0, 7
here:
 j here
