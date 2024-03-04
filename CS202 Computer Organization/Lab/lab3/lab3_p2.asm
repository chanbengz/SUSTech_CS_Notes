.include "macro_print_str.asm"
.data
.text
main:
    print_string("Please input a character: \n")
    li a7, 12
    ecall
    mv t0, a0
    li t3, 0
    li s8, 7
    li t6, 1
cmp:
    srl t1, t0, t3
    andi t1, t1, 1
    srl t2, t0, t4
    andi t2, t2, 1
    xor t5, t1, t2
    xori t5, t5, 1
    and t6, t6, t5
    addi t3, t3, 1
    sub t4, s8, t3
    bltu t3, t4, cmp
    
    print_string("\nIt's a palindrom (0: false, 1: true): ")
    mv a0, t6
    li a7, 1
    ecall
    
    end