.text
main:
	addi t0, zero, 1024
	slli a0, t0, 4
	addi a7, zero, 9
	ecall
	addi a7, zero, 8
	slli a1, t0, 4
	ecall
	addi a7, zero, 4
	ecall
	addi a7, zero, 10
	ecall