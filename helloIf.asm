.data
	message: .asciiz "Hello if"
.text
	main:
		addi $t0, $zero, 20
		addi $t1, $zero, 20
		
		beq $t0, $t1, numberEqual
	
	li $v0, 10
	syscall
	
	numberEqual:
		li $v0, 4
		la $a0, message
		syscall
