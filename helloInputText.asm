.data
	message:   .asciiz "Hello, MIPS"
	userInput: .space 3 # hold the user input														
.text
	main:
		# get user input as text
		li $v0, 8
		la $a0, userInput
		# tell the system maxium length of text
		li $a1, 3
		syscall
		
		# display hello
		li $v0, 4
		la $a0, message
		syscall
		
		# diplay the input
		li $v0, 4
		la $a0, userInput
		syscall
	
	# Tell the system this is the end of main.
	li $v0, 10
	syscall
