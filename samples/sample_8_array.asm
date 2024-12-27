

setLastType: int
FUNC @main:

setLastType: int

lastType: int
	var i

	push 0
	pop i

_begWhile_1:
	push i
	push 5
	cmplt
	jz _endWhile_1
	push i
    ; a[i] = *(a+i)    
    ; a[i] = i  =>   memset ((a+i), i)
    deref a
    push i
    push 4
    mul
    add
    memset

	push i
	push 1
	add
	pop i

	jmp _begWhile_1
_endWhile_1:


setLastType: int

lastType: int
	var j

	push 0
	pop i

	push 0
	pop j

_begWhile_2:
	push i
	push 5
	cmplt
	jz _endWhile_2
	push 0
	pop j

_begWhile_3:
	push j
	push 5
	cmplt
	jz _endWhile_3
	push i
	push j

    push 5
    push i
    mul
    push 4
    mul
    push j 
    push 4
    add
    memset


	push j
	push 1
	add
	pop j

	jmp _begWhile_3
_endWhile_3:

	push i
	push 1
	add
	pop i

	jmp _begWhile_2
_endWhile_2:

ENDFUNC


