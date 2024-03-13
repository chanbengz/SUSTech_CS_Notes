.data
	str: .space 300
.text
main:
	la a0, str
	li t1, 32
	li a7, 8
	li a1, 300
	ecall
	lb t0, 1(a0)
	beq t0, t1, begin
	addi t0, a0, 1
loop:
	addi t0, t0, 1
	lb t2, (t0)
	beqz t2, notfo
	bne t1, t2, loop
	lb t3, 1(t0)
	lb t2, 2(t0)
	beq t1, t2, found
	addi t0, t0, 2
	bnez t2, loop
notfo:
	li a0, -1
	j exit
found:
	addi a0, t3, -65
	bgtz a0, exit
	addi a0, a0, 26
	j exit
	
begin:
	lb   a0, 0(a0)
	addi a0, a0, -73
	bgtz a0, exit
	addi  a0, a0, 26
exit:
	li a7, 1
	ecall
	li a7, 10
	ecall