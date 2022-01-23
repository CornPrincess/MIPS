.data
	message: .asciiz "Hello pseudo"
.text
	main:
		addi $s0, $zero, 14
		addi $s1, $zero, 10
	
		# pseudo 
		bgt $s0, $s1, displayMessage
		
	li $v0, 10
	syscall
	
	displayMessage:
	 	li $v0, 4
	 	la $a0, message
	 	syscall