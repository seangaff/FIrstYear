;
; CS1022 Introduction to Computing II 2018/2019
; Lab 1 - Array Move
;

N	EQU	16		; number of elements

	AREA	globals, DATA, READWRITE

; N word-size values

ARRAY	SPACE	N*4		; N words


	AREA	RESET, CODE, READONLY
	ENTRY

	; for convenience, let's initialise test array [0, 1, 2, ... , N-1]

	LDR	R0, =ARRAY
	LDR	R1, =0
L1	CMP	R1, #N
	BHS	L2
	STR	R1, [R0, R1, LSL #2]
	ADD	R1, R1, #1
	B	L1
L2

	; initialise registers for your program

	LDR	R0, =ARRAY
	LDR	R1, =6
	LDR	R2, =3
	LDR	R3, =N

	; your program goes here
    LDR R4 [R0, R1, LSL #2]     ; indexVal = Array[oldIndex]
	MOV R6,R1;I
	MOV R7,R2;X

wh
	CMP R6,R7				; while(I >= x) {
	BLS endwh
	SUB R9,R6,#1			; temp = I -1
	LDR R8, [R0,R9, LSL #2]	; ARR[I-1]
	STR R8, [R0,R6, LSL #2]	; ARR[I]=ARR[I-1]
	SUB R6,R6,#1			; I -= 1
	B   wh					;}
endwh

	STR R4, [R0, R2, LSL #2]	; write to newIndex

STOP	B	STOP

	END
