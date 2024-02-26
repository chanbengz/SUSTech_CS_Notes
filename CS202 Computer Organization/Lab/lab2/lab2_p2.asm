.data
    name:  .space 16
    mick:  .ascii "Mick\n"
    alice: .asciz "Alice\n"
    tony:  .asciz "Tony\n"
    chen:  .asciz "Chen\n"

.text
main:
    la t0, name
    la t1, mick
    sw t1, (t0)
    la t1, alice
    sw t1, 4(t0)
    la t1, tony
    sw t1, 8(t0)
    la t1, chen
    sw t1, 12(t0)
    
    li a7, 4
    lw, a0, (t0)
    ecall
    
    li a7, 10
    ecall