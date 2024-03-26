.data
    m1: .half 28 # multiplicand
    m2: .half -89 # multiplier
.text
	li   s1, 1
	li   s3, 0x8000
	li   a1, 16
    lh   t0, m1
    lh   t1, m2
    add  t2, zero, zero # result
    and  t3, t0, s3
    and  t4, t1, s3
    xor  t5, t3, t4
    beqz t3, check_m2
    addi t0, t0, -1
    not  t0, t0
check_m2:
	beqz t4, loop
	addi t1, t1, -1
	not  t1, t1
loop:
    and  s2, s1, t1     # to determine the lowest bit of t1
    beq  s2, zero, jumpAdd
    add  t2, t0, t2     # add up to result
jumpAdd:
    slli t0, t0, 1
    srli t1, t1, 1
    addi a0, a0, 1
    blt  a0, a1, loop
   	beqz t5, exit
   	not  t2, t2        # +ve -> -ve
   	addi t2, t2, 1
exit:
    mv   a0, t2
    li   a7, 1
    ecall
    li   a7, 10
    ecall
