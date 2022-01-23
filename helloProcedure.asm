.data
	message: .asciiz "Hello everyone!\nI am iron man\n"
.text
	main:
		jal displayMessage
		
		# print number 5 
		li $v0, 1
		addi $a0, $zero, 5
		syscall
	
	# Tell the system that the program is done
	li $v0, 10
	syscall
	
	# procedure 
	displayMessage:
		li $v0, 4
		la $a0, message
		syscall
		
		jr $ra
