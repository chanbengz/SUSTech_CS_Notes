.data
    str: .ascii "\nWelcome "
    sid: .space 9
    e1:  .asciz " to RISC-V World"

.text
main:
    li a7, 8 # to get a string
    la a0, sid
    li a1, 9
    ecall

    la t1, e1       # target
    addi t0, a0, 8  # start of destination
    addi t2, t1, 17 # end of destination

copy:
    lb t3, (t1) # copy bytes iteratively
    sb t3, (t0)
    addi t0, t0, 1
    addi t1, t1, 1
    bne t1, t2, copy

    li a7, 4 # to print a string
    la a0, str
    ecall
    li a7, 10 # to exit
    ecall
