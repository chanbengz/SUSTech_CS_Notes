.data
	str: .space 1024
.text
main:
        li      a7,8
        la      a0,str
        li      a1,300
        ecall

        lbu     a4,1(a0)
        li      a3,32
        beq     a4,a3,.L2
        addi    a5,a0,2
        li      a0,-27
.L3:
        lbu     a4,2(a5)
        beq     a4,zero,.L4
        bne     a4,a3,.L5
        lbu     a4,4(a5)
        bne     a4,a3,.L5
        lbu     a0,3(a5)
        addi    a0,a0,-65
.L5:
        addi    a5,a5,1
        j       .L3
.L2:
        lbu     a4,0(a0)
        addi    a0,a4,-73
.L4:
        bge     a0,zero,.L7
        addi    a0,a0,26
.L7:
        li      a7,1
        ecall
        li      a7,10
        ecall