.include "macro_print_str.asm"
.data
.text
main:
    print_string("Please input an integer: \n")
    li a7, 5
    ecall
    li t1, 1
    mv t0, a0 # pesudo instruction
    print_string("It is an odd number (0: false,1: true): ")
    and a0, t1, t0
    # mv a0, t0
    li a7, 1
    ecall
    end