.data
	newLine: .asciiz "\n"
.text
	main:
		addi $s0, $zero, 10
		
		jal increaseMyRegister
		
		# print a new line
		li, $v0, 4
		la $a0, newLine
		syscall
		
		jal printTheValue
		
	# This line is going to signal end of program
	li $v0, 10
	syscall
		
	increaseMyRegister:
		# push stack
		addi $sp, $sp, -8
		sw $s0, 0($sp)
		# store the return address
		sw $ra, 4($sp)
		
		addi $s0, $s0, 20
		
		# nested procedure
		jal printTheValue
		
		# pop stack
		lw $s0, 0($sp)
		# resolve the return address
		lw $ra, 4($sp)
		addi $sp, $sp, 8
		
		jr $ra
		
	printTheValue:
		li $v0, 1
		move $a0, $s0
		syscall
		
		jr $ra