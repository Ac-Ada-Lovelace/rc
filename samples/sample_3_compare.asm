FUNC @main:
	push 1
	push 2
	cmpeq
	print "1 == 2 is %d"

	push 2
	push 2
	cmpeq
	print "2 == 2 is %d"

	push 2
	push 3
	cmpeq
	print "2 == 3 is %d"

	push 1
	push 2
	cmpne
	print "1 != 2 is %d"

	push 2
	push 2
	cmpne
	print "2 != 2 is %d"

	push 2
	push 3
	cmpne
	print "2 != 3 is %d"

	push 1
	push 2
	cmpgt
	print "1 >  2 is %d"

	push 2
	push 2
	cmpgt
	print "2 >  2 is %d"

	push 2
	push 3
	cmpgt
	print "2 >  3 is %d"

	push 1
	push 2
	cmplt
	print "1 <  2 is %d"

	push 2
	push 2
	cmplt
	print "2 <  2 is %d"

	push 2
	push 3
	cmplt
	print "2 <  3 is %d"

	push 1
	push 2
	cmpge
	print "1 >= 2 is %d"

	push 2
	push 2
	cmpge
	print "2 >= 2 is %d"

	push 2
	push 3
	cmpge
	print "2 >= 3 is %d"

	push 1
	push 2
	cmple
	print "1 <= 2 is %d"

	push 2
	push 2
	cmple
	print "2 <= 2 is %d"

	push 2
	push 3
	cmple
	print "2 <= 3 is %d"

	push 0
	ret ~

ENDFUNC

