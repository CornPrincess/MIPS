.data

.text
	addi $t0, $zero, 31
	addi $t1, $zero, 5
	
	div $t0, $t1
	
	mflo $s0 # quotient
	mfhi $s1 # remainder
	
	li $v0, 1
	add $a0, $zero, $s1
	syscall