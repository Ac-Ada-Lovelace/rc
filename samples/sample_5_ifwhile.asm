FUNC @main:
	var n

	push 10
	pop n

_begWhile_1:
	push n
	push 0
	cmpne
	jz _endWhile_1
	push n
	print "n = %d"

_begIf_1:
	push n
	push 5
	cmpeq
	jz _elIf_1
	jmp _endWhile_1
	jmp _endIf_1
_elIf_1:
_endIf_1:

	push n
	push 1
	sub
	pop n

	jmp _begWhile_1
_endWhile_1:

	push 0
	ret ~

ENDFUNC

