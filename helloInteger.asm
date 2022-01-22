.data
	age: .word 28

.text
	li $v0, 1
	lw $a0, age
	syscall 
