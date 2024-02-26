.data
    str: .ascii "\nWelcome "
    sid: .space 8
    e1:  .asciz " to RISC-V World"

.text
main:
    la t0, e1
    lb t1, 0(t0) # store and let input overflow
    
    li a7, 8     # to get a string
    la a0, sid
    li a1, 9
    ecall
    
    sb t1, 0(t0) # fix the byte

    li a7, 4  # to print a string
    la a0, str
    ecall
    li a7, 10 # to exit
    ecall
