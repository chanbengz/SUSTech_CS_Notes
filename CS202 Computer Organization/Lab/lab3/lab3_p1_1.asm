.include "macro_print_str.asm"
.data
    arrayx: .space 10
    str: .asciz "\nThe arrayx is: "
.text
main:
    print_string("Please input 10 integers: \n")
    la t0, arrayx
    addi t1, t0, 10

loop_r:
    li a7, 5
    ecall
    sb a0, (t0)
    addi t0, t0, 1
    bne t0, t1, loop_r
    la a0, str
    li a7, 4
    ecall
    la t0, arrayx

loop_w:
    lb a0, (t0)
    li a7, 1
    ecall
    print_string(" ")
    addi t0, t0, 1
    bne t0, t1, loop_w
    end