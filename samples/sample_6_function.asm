FUNC @main:
	var n

	push 1
	pop n

	print "The first 10 number of the fibonacci sequence:"

_begWhile_1:
	push n
	push 10
	cmple
	jz _endWhile_1
	push n
	push n
	$fib
	print "fib(%d)=%d"

	push n
	push 1
	add
	pop n

	jmp _begWhile_1
_endWhile_1:

	push 0
	ret ~

ENDFUNC

FUNC @fib:
	arg n

_begIf_1:
	push n
	push 2
	cmple
	jz _elIf_1
	push 1
	ret ~

	jmp _endIf_1
_elIf_1:
_endIf_1:

	push n
	push 1
	sub
	$fib
	push n
	push 2
	sub
	$fib
	add
	ret ~

ENDFUNC

