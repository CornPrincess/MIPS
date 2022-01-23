.data
	UserInputString: .space 512 # hold the user input
	Success: 	 .asciiz " Success! Location: "
	Fail:    	 .asciiz " Fail!"
	NewLine:	 .asciiz "\n"
.text
	main:
		# 1. get user input as text
		li $v0, 8
		la $a0, UserInputString
		# tell the system maxium length of text
		li $a1, 512
		syscall
		
		while:
			# 2. print new line
			li $v0, 4
			la $a0, NewLine
			syscall
		
			# 3. read the target character
			li $v0, 12
			syscall
			# $t1 store the target character
			move $t1, $v0
			
			
			# 4. is ?
			sub $t4, $t1, 63
			beqz $t4, exit
		
			# 4.find the target
			# $a1 store the index of answer
			li $a1, 1
			# $t0 store the address of string
			la $t0, UserInputString
			while0:
				# read the character of string
				lb $t2, ($t0)
				# if $t2 == 0, it's the end of string
				beqz $t2, printFail
				# compare the target 
				beq $t2, $t1, printSuccess
				addi $a1, $a1, 1
				addi $t0, $t0, 1
				
				j while0
			
		exit:
			li $v0, 10
			syscall
		

	li $v0, 10
	syscall
	
	findCharacter:
	
	printSuccess:
		li $v0, 4
		la $a0, Success
		syscall
		
		li $v0, 1
		move $a0, $a1
		syscall
		
		j while
	
	printFail:
		li $v0, 4
		la $a0, Fail
		syscall
		
		j while
