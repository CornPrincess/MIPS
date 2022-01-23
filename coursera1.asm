.data
	Uppercase: 	 .asciiz  " Alpha\n"," Bravo\n"," China\n"," Delta\n"," Echo\n"," Foxtrot\n"," Golf\n"," Hotel\n",
    				" India\n"," Juliet\n"," Kilo\n"," Lima\n"," Mary\n"," November\n"," Oscar\n"," Paper\n"," Quebec\n",
    				" Research\n"," Sierra\n"," Tango\n"," Uniform\n"," Victor\n"," Whisky\n"," X-ray\n"," Yankee\n"," Zulu\n"
    				
	Lowercase: 	 .asciiz  " alpha\n"," bravo\n"," china\n"," delta\n"," echo\n"," foxtrot\n"," golf\n"," hotel\n"," india\n",
    				" juliet\n"," kilo\n"," lima\n"," mary\n"," november\n"," oscar\n"," paper\n"," quebec\n"," research\n",
    				" sierra\n"," tango\n"," uniform\n"," victor\n"," whisky\n"," x-ray\n"," yankee\n"," zulu\n"
    				
	Numbers:	 .asciiz " zero\n", " one\n", " two\n", " three\n", " four\n", " five\n", " six\n", " seven\n"," eight\n", " nine\n"
	
	LitterKey: 	 .word 0, 8, 16, 24, 32, 39, 49, 56, 64, 72, 81, 88, 95, 102, 113, 121, 129, 138, 149, 158, 166,176, 185, 194, 202, 211
	
	NumberKey:	 .word 0, 7, 13, 19, 27, 34, 41, 47, 55, 63
	
	EndMessage: 	 .asciiz " End\n"
	
	OtherMessage:    .asciiz " *\n"

.text
	main:		
		while:
			# read the character
			li $v0, 12
			syscall
			
			# save character to $t0
			move $t0 $v0
			
			# compare with ?
			sub $t1, $t0, 63
			beqz $t1, exit

			# is number
			# ascii 48-57 0-9
			sge $s1, $t0, 48
			sle $s2, $t0, 57
			and $s3, $s1, $s2
			beq $s3, 1, printNumber
			
			# is Uppercase
			# ascii 65-90 A-Z
			sge $s1, $t0, 65
			sle $s2, $t0, 90
			and $s3, $s1, $s2
			beq $s3, 1, printUppercase
			
			# is lowcase
			# ascii 97-122
			sge $s1, $t0, 97
			sle $s2, $t0, 122
			and $s3, $s1, $s2
			beq $s3, 1, printLowercase
			
			# other print *
			j printOthers
			
			j while
		
		exit:
			li $v0, 4
			la $a0, EndMessage
			syscall
	
	# End of program
	li $v0, 10
	syscall
	
	printNumber: 
		li  $v0, 4
		la  $a0, Numbers
		# The real number
		sub $t2, $t0, 48
		# one word has 4 bytes
		sll $t2, $t2, 2
		# find the index of Numberkey
		la  $t3, NumberKey
		add $t3, $t3, $t2
		# read the offset of NumberKey 
		lw  $t4, ($t3) 
		
		add $a0, $a0, $t4
		syscall
		j main
		
	printUppercase: 
		li  $v0, 4
		la  $a0, Uppercase
		# The real character
		sub $t2, $t0, 65
		sll $t2, $t2, 2
		# find the index of LitterKey
		la  $t3, LitterKey
		add $t3, $t3, $t2
		# read the offset of LitterKey 
		lw  $t4, ($t3) 
		
		add $a0, $a0, $t4
		syscall
		j main 
		
	printLowercase: 
		li  $v0, 4
		la  $a0, Lowercase
		# The real character
		sub $t2, $t0, 97
		sll $t2, $t2, 2
		# find the index of LitterKey
		la  $t3, LitterKey
		add $t3, $t3, $t2
		# read the offset of LitterKey 
		lw  $t4, ($t3) 
		
		add $a0, $a0, $t4
		syscall
		j main
		
	printOthers:
		#li $v0, 11
		#li $a0, 42 
		li $v0, 4
		la $a0, OtherMessage
		syscall
		j main
