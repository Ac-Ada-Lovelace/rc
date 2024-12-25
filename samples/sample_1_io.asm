FUNC @main:
	var n

	readint "Please input an integer: "
	pop n

	push n
	print "Your input number is: %d"

	push 0
	ret ~

ENDFUNC

