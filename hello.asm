.data
	myMessage: .asciiz "Hello Worldhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh123\n"

.text
	li $v0, 4
	la $a0, myMessage
	syscall 

