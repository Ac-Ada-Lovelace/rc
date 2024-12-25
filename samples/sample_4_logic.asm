FUNC @main:
	push 0
	push 0
	and
	print "0 && 0 is %d"

	push 0
	push 1
	and
	print "0 && 1 is %d"

	push 1
	push 0
	and
	print "1 && 0 is %d"

	push 1
	push 1
	and
	print "1 && 1 is %d"

	push 0
	push 0
	or
	print "0 || 0 is %d"

	push 0
	push 1
	or
	print "0 || 1 is %d"

	push 1
	push 0
	or
	print "1 || 0 is %d"

	push 1
	push 1
	or
	print "1 || 1 is %d"

	push 1
	not
	print "!1 is %d"

	push 0
	not
	print "!0 is %d"

	push 0
	ret ~

ENDFUNC

