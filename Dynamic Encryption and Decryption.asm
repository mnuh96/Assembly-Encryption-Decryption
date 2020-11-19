Title PROJECT
INCLUDE Irvine32.inc

.data
	wel byte "Welcome to Encryption/Decryption Software",0	;Greeting

	BUFFER_SIZE = 50	;filing
	file DWORD ?
	filename byte "Output File.txt",0

	rand1 dword ?	; encryption number
	rand2 dword ?	; PROC selection

	work1 byte  "Press 1 for encryption",0Ah,		;choice
				"Press 2 for decryption",0Ah,
				"Press 3 to exit",0

	msg1 byte "Write a message to encrypt: ",0
	setnum byte "Using Set: ",0

	choice byte ?

	error1 byte "There is an error. Terminating Program!",0

	encryption byte "ENCRYPTION SUCCESSFUL",0
	decryption byte "DECRYPTION SUCCESSFUL",0

	msgIn	byte	BUFFER_SIZE Dup(?)

.code

set1 PROTO, a:byte
set2 PROTO, a:byte
set3 PROTO, a:byte
set4 PROTO, a:byte
set5 PROTO, a:byte
set6 PROTO, a:byte
set7 PROTO, a:byte
set8 PROTO, a:byte
set9 PROTO, a:byte
set10 PROTO, a:byte
set11 PROTO, a:byte
set12 PROTO, a:byte
set13 PROTO, a:byte
set14 PROTO, a:byte
set15 PROTO, a:byte
set16 PROTO, a:byte
set17 PROTO, a:byte
set18 PROTO, a:byte
set19 PROTO, a:byte
set20 PROTO, a:byte


main PROC
	mov edx, offset wel
	Call WriteString
	call crlf

;-------------------------Repeat----------------------------
again:
	mov edx, 0
	call crlf
	mov edx, offset work1
	Call WriteString
	call crlf
	Call ReadInt
	mov choice, al
	cmp eax, 1
	JE en
	cmp eax, 2
	JE de
	cmp eax, 3
	JE ex
;-------------------------Filing Error----------------------------
er:
	mov edx, offset error1
	Call WriteString
	call crlf
	JMP ex

;-------------------------Encryption----------------------------
en:
	mov edx, offset msg1
	call WriteString
	mov ecx, BUFFER_SIZE
	mov edx, offset msgIn
	Call ReadString
	call crlf
	mov eax, 20
	Call Randomize
	Call RandomRange
	mov rand2, eax

;-------------------------Choosing Set----------------------------
bck:
	Call crlf
	mov edx, offset setnum
	call WriteString
	mov eax, rand2
	Call writeDec
	call crlf

	cmp eax, 0
	JE p0

	cmp eax, 1
	JE p1

	cmp eax, 2
	JE p2

	cmp eax, 3
	JE p3

	cmp eax, 4
	JE p4

	cmp eax, 5
	JE p5

	cmp eax, 6
	JE p6

	cmp eax, 7
	JE p7

	cmp eax, 8
	JE p8

	cmp eax, 9
	JE p9

	cmp eax, 10
	JE p10

	cmp eax, 11
	JE p11

	cmp eax, 12
	JE p12

	cmp eax, 13
	JE p13

	cmp eax, 14
	JE p14

	cmp eax, 15
	JE p15

	cmp eax, 16
	JE p16

	cmp eax, 17
	JE p17

	cmp eax, 18
	JE p18

	cmp eax, 19
	JE p19

	JMP er

p0: Invoke set1, choice
	cmp choice, 1
	JE fil
	cmp choice, 2
	JE d2
p1: Invoke set2, choice
	cmp choice, 1
	JE fil
	cmp choice, 2
	JE d2
p2: Invoke set3, choice
	cmp choice, 1
	JE fil
	cmp choice, 2
	JE d2
p3: Invoke set4, choice
	cmp choice, 1
	JE fil
	cmp choice, 2
	JE d2
p4: Invoke set5, choice
	cmp choice, 1
	JE fil
	cmp choice, 2
	JE d2
p5: Invoke set6, choice
	cmp choice, 1
	JE fil
	cmp choice, 2
	JE d2
p6: Invoke set7, choice
	cmp choice, 1
	JE fil
	cmp choice, 2
	JE d2
p7: Invoke set8, choice
	cmp choice, 1
	JE fil
	cmp choice, 2
	JE d2
p8: Invoke set9, choice
	cmp choice, 1
	JE fil
	cmp choice, 2
	JE d2
p9: Invoke set10, choice
	cmp choice, 1
	JE fil
	cmp choice, 2
	JE d2
p10: Invoke set11, choice
	 cmp choice, 1
	 JE fil
	 cmp choice, 2
	 JE d2
p11: Invoke set12, choice
	 cmp choice, 1
	 JE fil
	 cmp choice, 2
	 JE d2
p12: Invoke set13, choice
	 cmp choice, 1
	 JE fil
	 cmp choice, 2
	 JE d2
p13: Invoke set14, choice
	 cmp choice, 1
	 JE fil
	 cmp choice, 2
	 JE d2
p14: Invoke set15, choice
	 cmp choice, 1
	 JE fil
	 cmp choice, 2
	 JE d2
p15: Invoke set16, choice
	 cmp choice, 1
	 JE fil
	 cmp choice, 2
	 JE d2
p16: Invoke set17, choice
	 cmp choice, 1
	 JE fil
	 cmp choice, 2
	 JE d2
p17: Invoke set18, choice
	 cmp choice, 1
	 JE fil
	 cmp choice, 2
	 JE d2
p18: Invoke set19, choice
	 cmp choice, 1
	 JE fil
	 cmp choice, 2
	 JE d2
p19: Invoke set20, choice
	 cmp choice, 1
	 JE fil
	 cmp choice, 2
	 JE d2


;-------------------------Filing Encryption----------------------------
fil:
	mov edx, offset filename
	Call CreateOutputFile
	cmp eax, INVALID_HANDLE_VALUE
	JE er
	mov file, eax
	mov edx, offset msgIn
	mov ecx, BUFFER_SIZE
	Call WriteToFile
	mov eax, file
	mov edx, offset rand1
	mov ecx, 5
	Call WriteToFile
	mov eax, file
	mov edx, offset rand2
	mov ecx, 5
	Call WriteToFile
	mov eax, file
	Call CloseFile
	mov edx, offset msgIn
	Call WriteString
	call crlf
	JMP again

;-------------------------Decryption----------------------------
de:
	mov edx, offset filename
	Call OpenInputFile
	cmp eax, INVALID_HANDLE_VALUE
	JE er
	mov file, eax
	mov eax, file
	mov edx, offset msgIn
	mov ecx, BUFFER_SIZE
	Call ReadFromFile
	mov eax, file
	mov edx, offset rand1
	mov ecx, 5
	Call ReadFromFile
	mov eax, file
	mov edx, offset rand2
	mov ecx, 5
	Call ReadFromFile
	mov eax, file
	Call CloseFile
	JMP bck

;------------------Print Decryption Message------- ------------
d2:	mov edx, offset msgIn
	Call WriteString
	call crlf
	JMP again
ex:	exit
main ENDP

;-------------------------SETS----------------------------

set1 PROC, a: byte
	cmp a, 1
	JE j1
	JNE j2
j1:	mov eax, 6
	Call Randomize
	Call RandomRange
	mov rand1, eax
	mov esi, 0
	mov ecx, BUFFER_SIZE
	l1:
		mov ebx, ecx
		mov ecx, rand1
		ror msgIn[esi], cl
		inc esi
		mov ecx, ebx
	loop l1
	mov edx, offset encryption
	Call WriteString
	call crlf
	JMP ex

j2:	mov esi, 0
	mov ecx, BUFFER_SIZE
	l2:
		mov ebx, ecx
		mov ecx, rand1

		rol msgIn[esi], cl
		inc esi
		mov ecx, ebx
	loop l2
	mov edx, offset decryption
	Call WriteString
	call crlf
ex:
	ret
set1 ENDP

set2 PROC, a:byte
	cmp a, 1
	JE j1
	JNE j2
j1:	mov eax, 20
	Call Randomize
	Call RandomRange
	mov rand1, eax
	mov esi, 0
	mov ecx, BUFFER_SIZE
	l1:
		mov ebx, ecx
		mov ecx, rand1

		xor msgIn[esi], cl


		inc esi
		mov ecx, ebx
	loop l1
	mov edx, offset encryption
	Call WriteString
	call crlf
	JMP ex

j2:	mov esi, 0
	mov ecx, BUFFER_SIZE
	l2:
		mov ebx, ecx
		mov ecx, rand1

		xor msgIn[esi], cl

		inc esi
		mov ecx, ebx
	loop l2
	mov edx, offset decryption
	Call WriteString
	call crlf
ex:
	ret
set2 ENDP

set3 PROC, a:byte
	cmp a, 1
	JE j1
	JNE j2
j1:	mov eax, 20
	Call Randomize
	Call randomRange
	mov rand1, eax
	mov esi, 0
	mov ecx, BUFFER_SIZE
	l1:
		mov ebx, ecx
		mov ecx, rand1

		xor msgIn[esi], cl
		sub msgIn[esi], cl

		inc esi
		mov ecx, ebx
	loop l1
	mov edx, offset encryption
	Call WriteString
	call crlf
	JMP ex

j2:	mov esi, 0
	mov ecx, BUFFER_SIZE
	l2:
		mov ebx, ecx
		mov ecx, rand1

		add msgIn[esi],cl
		xor msgIn[esi], cl

		inc esi
		mov ecx, ebx
	loop l2
	mov edx, offset decryption
	Call WriteString
	call crlf
ex:
	ret
set3 ENDP

set4 PROC, a:byte
	cmp a, 1
	JE j1
	JNE j2
j1:	mov eax, 20
	Call Randomize
	Call RandomRange
	mov rand1, eax
	mov esi, 0
	mov ecx, BUFFER_SIZE
	l1:
		mov ebx, ecx
		mov ecx, rand1

		inc msgIn[esi]
		ror msgIn[esi],cl
		xor msgIn[esi], cl
		sub msgIn[esi], cl

		inc esi
		mov ecx, ebx
	loop l1
	mov edx, offset encryption
	Call WriteString
	call crlf
	JMP ex

j2:	mov esi, 0
	mov ecx, BUFFER_SIZE
	l2:
		mov ebx, ecx
		mov ecx, rand1


		add msgIn[esi],cl
		xor msgIn[esi], cl
		rol msgIn[esi],cl
		dec msgIn[esi]

		inc esi
		mov ecx, ebx
	loop l2
	mov edx, offset decryption
	Call WriteString
	call crlf
ex:
	ret
set4 ENDP

set5 PROC, a:byte
	cmp a, 1
	JE j1
	JNE j2
j1:	mov eax, 20
	Call Randomize
	Call RandomRange
	mov rand1, eax
	mov esi, 0
	mov ecx, BUFFER_SIZE
	l1:
		mov ebx, ecx
		mov ecx, rand1

		add msgIn[esi],cl
		xor msgIn[esi], cl
		rol msgIn[esi],cl
		dec msgIn[esi]

		inc esi
		mov ecx, ebx
	loop l1
	mov edx, offset encryption
	Call WriteString
	call crlf
	JMP ex

j2:	mov esi, 0
	mov ecx, BUFFER_SIZE
	l2:
		mov ebx, ecx
		mov ecx, rand1


		inc msgIn[esi]
		ror msgIn[esi],cl
		xor msgIn[esi], cl
		sub msgIn[esi], cl

		inc esi
		mov ecx, ebx
	loop l2
	mov edx, offset decryption
	Call WriteString
	call crlf
ex:
	ret
set5 ENDP

set6 PROC, a:byte
	cmp a, 1
	JE j1
	JNE j2
j1:	mov eax, 20
	Call Randomize
	Call RandomRange
	mov rand1, eax
	mov esi, 0
	mov ecx, BUFFER_SIZE
	l1:
		mov ebx, ecx
		mov ecx, rand1

		ror msgIn[esi],cl
		add msgIn[esi],cl
		xor msgIn[esi], cl

		inc esi
		mov ecx, ebx
	loop l1
	mov edx, offset encryption
	Call WriteString
	call crlf
	JMP ex

j2:	mov esi, 0
	mov ecx, BUFFER_SIZE
	l2:
		mov ebx, ecx
		mov ecx, rand1


		xor msgIn[esi], cl
		sub msgIn[esi], cl
		rol msgIn[esi],cl

		inc esi
		mov ecx, ebx
	loop l2
	mov edx, offset decryption
	Call WriteString
	call crlf
ex:
	ret
set6 ENDP

set7 PROC, a:byte
	cmp a, 1
	JE j1
	JNE j2
j1:	mov eax, 20
	Call Randomize
	Call RandomRange
	mov rand1, eax
	mov esi, 0
	mov ecx, BUFFER_SIZE
	l1:
		mov ebx, ecx
		mov ecx, rand1

		ror msgIn[esi],cl
		xor msgIn[esi], cl
		inc msgIn[esi]

		inc esi
		mov ecx, ebx
	loop l1
	mov edx, offset encryption
	Call WriteString
	call crlf
	JMP ex

j2:	mov esi, 0
	mov ecx, BUFFER_SIZE
	l2:
		mov ebx, ecx
		mov ecx, rand1

		dec msgIn[esi]
		xor msgIn[esi], cl
		rol msgIn[esi],cl

		inc esi
		mov ecx, ebx
	loop l2
	mov edx, offset decryption
	Call WriteString
	call crlf
ex:
	ret
set7 ENDP

set8 PROC, a:byte
	cmp a, 1
	JE j1
	JNE j2
j1:	mov eax, 20
	Call Randomize
	Call RandomRange
	mov rand1, eax
	mov esi, 0
	mov ecx, BUFFER_SIZE
	l1:
		mov ebx, ecx
		mov ecx, rand1


		xor msgIn[esi], cl
		ror msgIn[esi],cl
		dec msgIn[esi]

		inc esi
		mov ecx, ebx
	loop l1
	mov edx, offset encryption
	Call WriteString
	call crlf
	JMP ex

j2:	mov esi, 0
	mov ecx, BUFFER_SIZE
	l2:
		mov ebx, ecx
		mov ecx, rand1

		inc msgIn[esi]
		rol msgIn[esi],cl
		xor msgIn[esi], cl

		inc esi
		mov ecx, ebx
	loop l2
	mov edx, offset decryption
	Call WriteString
	call crlf
ex:
	ret
set8 ENDP

set9 PROC, a:byte
	cmp a, 1
	JE j1
	JNE j2
j1:	mov eax, 20
	Call Randomize
	Call RandomRange
	mov rand1, eax
	mov esi, 0
	mov ecx, BUFFER_SIZE
	l1:
		mov ebx, ecx
		mov ecx, rand1

		sub msgIn[esi],cl
		ror msgIn[esi],cl
		xor msgIn[esi], cl
		dec msgIn[esi]

		inc esi
		mov ecx, ebx
	loop l1
	mov edx, offset encryption
	Call WriteString
	call crlf
	JMP ex

j2:	mov esi, 0
	mov ecx, BUFFER_SIZE
	l2:
		mov ebx, ecx
		mov ecx, rand1


		inc msgIn[esi]
		xor msgIn[esi], cl
		rol msgIn[esi],cl
		add msgIn[esi], cl

		inc esi
		mov ecx, ebx
	loop l2
	mov edx, offset decryption
	Call WriteString
	call crlf
ex:
	ret
set9 ENDP

set10 PROC, a:byte
	cmp a, 1
	JE j1
	JNE j2
j1:	mov eax, 20
	Call Randomize
	Call RandomRange
	mov rand1, eax
	mov esi, 0
	mov ecx, BUFFER_SIZE
	l1:
		mov ebx, ecx
		mov ecx, rand1
		inc msgIn[esi]
		add msgIn[esi], cl
		mul al
		inc esi
		mov ecx, ebx
	loop l1
	mov edx, offset encryption
	Call WriteString
	call crlf
	JMP ex

j2:	mov esi, 0
	mov ecx, BUFFER_SIZE
	l2:
		mov ebx, ecx
		mov ecx, rand1
		sub msgIn[esi], cl
		div al
		dec msgIn[esi]
		inc esi
		mov ecx, ebx
	loop l2
	mov edx, offset decryption
	Call WriteString
	call crlf
ex:
	ret
set10 ENDP

set11 PROC, a:byte
	cmp a, 1
	JE j1
	JNE j2
j1:	mov eax, 20
	Call Randomize
	Call RandomRange
	mov rand1, eax
	mov esi, 0
	mov ecx, BUFFER_SIZE
	l1:
		mov ebx, ecx
		mov ecx, rand1
		xor msgIn[esi], cl
		ror msgIn[esi], cl
		not msgIn[esi]
		inc esi
		mov ecx, ebx
	loop l1
	mov edx, offset encryption
	Call WriteString
	call crlf
	JMP ex

j2:	mov esi, 0
	mov ecx, BUFFER_SIZE
	l2:
		mov ebx, ecx
		mov ecx, rand1
		not msgIn[esi]
		rol msgIn[esi], cl
		xor msgIn[esi], cl
		inc esi
		mov ecx, ebx
	loop l2
	mov edx, offset decryption
	Call WriteString
	call crlf
ex:
	ret
set11 ENDP

set12 PROC, a:byte
	cmp a, 1
	JE j1
	JNE j2
j1:	mov eax, 20
	Call Randomize
	Call RandomRange
	mov rand1, eax
	mov esi, 0
	mov ecx, BUFFER_SIZE
	l1:
		mov ebx, ecx
		mov ecx, rand1

		NOT msgIn[esi]


		inc esi
		mov ecx, ebx
	loop l1
	mov edx, offset encryption
	Call WriteString
	call crlf
	JMP ex

j2:	mov esi, 0
	mov ecx, BUFFER_SIZE
	l2:
		mov ebx, ecx
		mov ecx, rand1

		NOT msgIn[esi]

		inc esi
		mov ecx, ebx
	loop l2
	mov edx, offset decryption
	Call WriteString
	call crlf
ex:
	ret
set12 ENDP

set13 PROC, a:byte
	cmp a, 1
	JE j1
	JNE j2
j1:	mov eax, 20
	Call Randomize
	Call RandomRange
	mov rand1, eax
	mov bl,byte ptr rand1
	mov esi, 0
	mov edx,rand1
	mov ecx, BUFFER_SIZE
	l1:
		mov ebx, ecx
		mov ecx, rand1
		add msgIn[esi], cl
		mul al
		add msgIn[esi],bl

		inc esi
		mov ecx, ebx
	loop l1
	mov edx, offset encryption
	Call WriteString
	call crlf
	JMP ex

j2:	mov esi, 0
	mov ecx, BUFFER_SIZE
	l2:
		mov ebx, ecx
		mov ecx, rand1
		sub msgIn[esi], cl
		div al
		sub msgIn[esi],bl

		inc esi
		mov ecx, ebx
	loop l2
	mov edx, offset decryption
	Call WriteString
	call crlf
ex:
	ret

set13 ENDP

set14 PROC, a:byte
	cmp a, 1
	JE j1
	JNE j2
j1:	mov eax, 20
	Call Randomize
	Call RandomRange
	mov rand1, eax
	mov esi, 0
	mov ecx, BUFFER_SIZE
	l1:
		mov ebx, ecx
		mov ecx, rand1
		add msgIn[esi], cl
		mul al
		inc esi
		mov ecx, ebx
	loop l1
	mov edx, offset encryption
	Call WriteString
	call crlf
	JMP ex

j2:	mov esi, 0
	mov ecx, BUFFER_SIZE
	l2:
		mov ebx, ecx
		mov ecx, rand1
		sub msgIn[esi], cl
		div al
		inc esi
		mov ecx, ebx
	loop l2
	mov edx, offset decryption
	Call WriteString
	call crlf
ex:
	ret
set14 ENDP

set15 PROC, a:byte
	cmp a, 1
	JE j1
	JNE j2
j1:	mov eax, 20
	Call Randomize
	Call RandomRange
	mov rand1, eax
	mov esi, 0
	mov ecx, BUFFER_SIZE
	l1:
		mov ebx, ecx
		mov ecx, rand1
		dec msgIn[esi]
		sub msgIn[esi],cl
		xor msgIn[esi], cl


		inc esi
		mov ecx, ebx
	loop l1
	mov edx, offset encryption
	Call WriteString
	call crlf
	JMP ex

j2:	mov esi, 0
	mov ecx, BUFFER_SIZE
	l2:
		mov ebx, ecx
		mov ecx, rand1

		xor msgIn[esi], cl
		inc msgIn[esi]
		add msgIn[esi],cl

		inc esi
		mov ecx, ebx
	loop l2
	mov edx, offset decryption
	Call WriteString
	call crlf
ex:
	ret
set15 ENDP

set16 PROC, a:byte
	cmp a, 1
	JE j1
	JNE j2
j1:	mov eax, 20
	Call Randomize
	Call RandomRange
	mov rand1, eax
	mov esi, 0
	mov ecx, BUFFER_SIZE
	l1:
		mov ebx, ecx
		mov ecx, rand1
		dec msgIn[esi]
		sub msgIn[esi],cl
		NOT msgIn[esi];, cl


		inc esi
		mov ecx, ebx
	loop l1
	mov edx, offset encryption
	Call WriteString
	call crlf
	JMP ex

j2:	mov esi, 0
	mov ecx, BUFFER_SIZE
	l2:
		mov ebx, ecx
		mov ecx, rand1
		NOT msgIn[esi]
		inc msgIn[esi]
		add msgIn[esi],cl

		inc esi
		mov ecx, ebx
	loop l2
	mov edx, offset decryption
	Call WriteString
	call crlf
ex:
	ret
set16 ENDP

set17 PROC, a:byte
	cmp a, 1
	JE j1
	JNE j2
j1:	mov eax, 20
	Call Randomize
	Call RandomRange
	mov rand1, eax
	mov esi, 0
	mov ecx, BUFFER_SIZE
	l1:
		mov ebx, ecx
		mov ecx, rand1
		dec msgIn[esi]
		sub msgIn[esi],cl
		NOT msgIn[esi];, cl
		div al

		inc esi
		mov ecx, ebx
	loop l1
	mov edx, offset encryption
	Call WriteString
	call crlf
	JMP ex

j2:	mov esi, 0
	mov ecx, BUFFER_SIZE
	l2:
		mov ebx, ecx
		mov ecx, rand1
		NOT msgIn[esi]
		inc msgIn[esi]
		add msgIn[esi],cl
		mul al
		inc esi
		mov ecx, ebx
	loop l2
	mov edx, offset decryption
	Call WriteString
	call crlf
ex:
	ret
set17 ENDP

set18 PROC, a:byte
	cmp a, 1
	JE j1
	JNE j2
j1:	mov eax, 20
	Call Randomize
	Call RandomRange
	mov rand1, eax
	mov esi, 0
	mov ecx, BUFFER_SIZE
	l1:
		mov ebx, ecx
		mov ecx, rand1
		add msgIn[esi],cl
		sub msgIn[esi],cl
		NOT msgIn[esi];, cl


		inc esi
		mov ecx, ebx
	loop l1
	mov edx, offset encryption
	Call WriteString
	call crlf
	JMP ex

j2:	mov esi, 0
	mov ecx, BUFFER_SIZE
	l2:
		mov ebx, ecx
		mov ecx, rand1
		NOT msgIn[esi]
		sub msgIn[esi],cl
		add msgIn[esi],cl
		inc esi
		mov ecx, ebx
	loop l2
	mov edx, offset decryption
	Call WriteString
	call crlf
ex:
	ret
set18 ENDP

set19 PROC, a:byte
	cmp a, 1
	JE j1
	JNE j2
j1:	mov eax, 20
	Call Randomize
	Call RandomRange
	mov rand1, eax
	mov esi, 0
	mov ecx, BUFFER_SIZE
	l1:
		mov ebx, ecx
		mov ecx, rand1
		rol msgIn[esi],cl
		xor msgIn[esi],cl
		NOT msgIn[esi];, cl


		inc esi
		mov ecx, ebx
	loop l1
	mov edx, offset encryption
	Call WriteString
	call crlf
	JMP ex

j2:	mov esi, 0
	mov ecx, BUFFER_SIZE
	l2:
		mov ebx, ecx
		mov ecx, rand1
		NOT msgIn[esi]
		xor msgIn[esi],cl
		ror msgIn[esi],cl
		inc esi
		mov ecx, ebx
	loop l2
	mov edx, offset decryption
	Call WriteString
	call crlf
ex:
	ret
set19 ENDP

set20 PROC, a:byte
	cmp a, 1
	JE j1
	JNE j2
j1:	mov eax, 20
	Call Randomize
	Call RandomRange
	mov rand1, eax
	mov esi, 0
	mov ecx, BUFFER_SIZE
	l1:
		mov ebx, ecx
		mov ecx, rand1
		rol msgIn[esi],cl
		xor msgIn[esi],cl
		NOT msgIn[esi];, cl
		add msgIn[esi], cl

		inc esi
		mov ecx, ebx
	loop l1
	mov edx, offset encryption
	Call WriteString
	call crlf
	JMP ex

j2:	mov esi, 0
	mov ecx, BUFFER_SIZE
	l2:
		mov ebx, ecx
		mov ecx, rand1
		sub msgIn[esi], cl
		NOT msgIn[esi]
		xor msgIn[esi],cl
		ror msgIn[esi],cl

		inc esi
		mov ecx, ebx
	loop l2
	mov edx, offset decryption
	Call WriteString
	call crlf
ex:
	ret
set20 ENDP

END main
