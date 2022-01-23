.data
	prompt: .asciiz "Enter your age: "
	message: .asciiz "\nYour age is: "
.text 
	# prompt the user to enter age
	li $v0, 4
	la $a0, prompt
	syscall
	
	# Get the user's age
	# tell the system get integer from keyboard
	li $v0, 5
	syscall
	
	# Store the result in $t0
	move $t0, $v0
	
	# display the message
	li $v0, 4
	la $a0, message
	syscall
	
	li $v0, 1
	move $a0, $t0
	syscall 