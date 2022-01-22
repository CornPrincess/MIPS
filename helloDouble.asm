.data
	myDouble: .double 7.202
	zeroDouble: .double 0.1

.text
	ldc1 $f2, myDouble # store in f1 f2
	ldc1 $f0, zeroDouble # store in f0 f1
	
	li $v0, 3
	add.d $f12, $f2, $f0
	syscall