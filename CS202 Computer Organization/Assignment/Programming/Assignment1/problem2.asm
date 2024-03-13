.text
main:
	addi a7, zero, 5
	addi t0, zero, 0
	addi t1, zero, 1
	ecall
	addi t3, a0, 0
	ecall
	addi t4, a0, 0
	xor a0, a0, a0

loop:
	add t2, t0, t1
	addi t0, t1, 0
	addi t1, t2, 0
	blt t2, t3, loop
	
	blt t4, t2, exit
count:
	add t2, t0, t1
	addi t0, t1, 0
	addi t1, t2, 0
	addi a0, a0, 1
	bge t4, t2, count

exit:
	addi a7, zero, 1
	ecall
	addi a7, zero, 10
	ecall