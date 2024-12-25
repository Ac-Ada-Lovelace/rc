FUNC @main:
	var x, y, z

	push 1
	pop x

	push 2
	pop y

	push x
	push y
	add
	pop z

	push x
	push y
	push z
	print "x = %d, y = %d, z = %d"

	push x
	push y
	add
	print "x + y = %d"

	push x
	push y
	sub
	print "x - y = %d"

	push x
	push y
	mul
	print "x * y = %d"

	push x
	push y
	div
	print "x / y = %d"

	push x
	push y
	mod
	print "x %% y = %d"

	push x
	neg
	push y
	neg
	print "-x = %d, -y = %d"

	push 0
	ret ~

ENDFUNC

