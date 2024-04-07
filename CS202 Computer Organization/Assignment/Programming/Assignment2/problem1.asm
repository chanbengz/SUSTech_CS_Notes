.data 
	arr: .space 808
	res: .float 0.0
	n:   .space 4
.text
main:
        li a7,5
        ecall
        la a4,n
        sw a0,(a4)
        mv a5,a0
        slli t3,a0,1
        la a6,arr
        la a3,res
        li t1,0
loop:
        bgt t3,t1,read
        flw fa5,(a3)
        slli t1,a5,2
        li a7,0
        li a4,0
        la a6,arr
cal_loop:
        blt a4,a5,calc
        beq a7,zero,exit
        fsw fa5,(a3)
exit:
        li a7,2
        flw fa0,(a3)
        ecall
        li a7,10
        ecall

read:
        li a7,6
        ecall
        fsw fa0,0(a6)
        addi t1,t1,1
        addi a6,a6,4
        j loop
calc:
        add a7,a6,t1
        flw fa3,0(a6)
        flw fa4,0(a7)
        addi a4,a4,1
        addi a6,a6,4
        fmadd.s fa5,fa3,fa4,fa5
        li a7,1
        j cal_loop
