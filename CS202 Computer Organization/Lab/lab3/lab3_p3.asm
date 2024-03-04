.include "macro_print_str.asm"
.data
    str: .asciz "  *   =    "
.text
main:
    li t3, 10
    la t4, str

loop_i:
    li t1, 1
    addi t0, t0, 1
    blt t0, t3, loop_j
    end

loop_j:
    jal print_abc
    addi t1, t1, 1
    bge t0, t1, loop_j
    print_string("\n")
    j loop_i

print_abc:
    mul t2, t0, t1
    addi t5, t0, 48
    sb t5, 0(t4)
    addi t5, t1, 48
    sb t5, 4(t4)
    div t5, t2, t3
    mul s0, t5, t3
    sub t6, t2, s0
    addi t5, t5, 48
    addi t6, t6, 48
    sb t5, 8(t4)
    sb t6 9(t4)
    la a0, str
    li a7, 4
    ecall
    jr ra
