.include "macro_print_str.asm"
.data
	dividend: .word 7
	divisor:  .word -2
.text
	lw   t1, dividend
	lw   t2, divisor
	add  t4, zero, zero
	li   a1, 0x80000000
	add  t0, zero, zero
	li   s1, 5
	and  s3, t1, a1
    and  s4, t2, a1
    xor  s5, s3, s4
    beqz s3, check_m2
    addi t1, t1, -1
    not  t1, t1
check_m2:
	beqz s4, start_div
	addi t2, t2, -1
	not  t2, t2
start_div:
	mv   t3, t1
	slli t2, t2, 4       # align divisor
loopb:
	sub  t3, t3, t2      # dividend - divisor
	and  s0, t3, a1      # get the highest bit of remainder to check if rem<0
	slli t4, t4, 1       # shift left quot with 1bit
	beq  s0, zero, SdrUq # if rem >= 0, shift Div right
	add  t3, t3, t2      # if rem < 0, rem=rem+div
	srli t2, t2, 1
	addi t4, t4, 0
	j loope
SdrUq:
	srli t2, t2, 1
	addi t4, t4, 1
loope:
	addi t0, t0, 1
	bne  t0, s1, loopb
	beqz s5, adjust_rem
   	not  t4, t4
   	addi t4, t4, 1
adjust_rem:
	beqz s3, exit
   	not  t3, t3
   	addi t3, t3, 1
exit:
	li   a7, 1
	mv   a0, t4
	ecall
	print_string("\n")
	li   a7, 1
	mv   a0, t3
	ecall
	li   a7, 10
	ecall