.data
	prompt: .asciiz "Enter the value of e: "
	
.text
	# Display message to the user
	li $v0, 4
	la $a0, prompt
	syscall
	
	# Get the double from the user
	# the input double will store in $f0,$f1
	li $v0, 7
	syscall
	
	# Display the user's input
	li $v0, 3
	add.d $f12, $f0, $f10
	syscall
