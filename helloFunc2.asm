.data 

.text
	main:
		addi $a1, $zero, 100
		addi $a2, $zero, 20
		
		jal addNumber
		li $v0, 1
		add $a0, $v1, $zero
		syscall
	
	# Tell the system that the program is done	
	li $v0, 10
	syscall
	
	addNumber:
		add $v1, $a1, $a2
		
		jr $ra