.text
main:
	li a7, 5
	ecall            # input integer
	jal fib
	li a7, 1
	ecall            # output result
	li a7, 10
    ecall            # end
fib:
	addi sp, sp, -12 # adjust stack for 2 items
	sw ra, 4(sp)     # save the return address
	sw a0, 0(sp)     # save the argument n
	slti t0, a0, 2   # test for n<2
	beq t0, zero, L1 # if n >= 2, go to L1
	addi a0, zero, 1 # else return 1
	addi sp, sp, 12  # pop 2 items off stack
	jr ra            # return to caller
L1:
	addi a0, a0, -1  # n>=2; argument gets(n-1)
	jal fib          # call fib(n-1)
	sw a0, 8(sp)     # save result for fib(n-1)
	lw a0, 0(sp)     # load n
	addi a0, a0, -2  # n>=2; argument gets(n-2)
	jal fib          # call fib(n-2)
	lw t1, 8(sp)     # restore fib(n-1)
	add a0, a0, t1   # ao = fib(n-1) + fib(n-2)
	lw ra, 4(sp)     # restore the return address
	lw t1, 8(sp)     # restore fib(n-1)
	addi sp, sp, 12  # adjust stack pointer to pop 2 items
	jr ra            # return to the caller
