;
; CS1022 Introduction to Computing II 2018/2019
; Lab 2 - Matrix Multiplication
;

N	EQU	4		

	AREA	globals, DATA, READWRITE

; result array
ARR_R	SPACE	N*N*4		; N*N words (4 bytes each)


	AREA	RESET, CODE, READONLY
	ENTRY

	; initialize system stack pointer (SP)
	LDR	SP, =0x40010000

	;
	; write your matrix multiplication program here
	;
	LDR R0, =ARR_A
	LDR R1, =ARR_B
	LDR R2, =ARR_R

	MOV R4, #0	; i index
	MOV R5, #0	; j index
	MOV R6, #0	; k index
	MOV R11, #N  ; temp = N
for1
	CMP R4, R11
	BHS endFor1
for2
	CMP R5, R11
	BHS endFor2
	MOV R7, #0	; r=0
for3
	CMP R6, R11
	BHS endFor3
	MUL R8, R4, R11	; index_a = row * row_size
	ADD R8, R8, R6	; index_a += col
	MUL R9, R6, R11	; index_b = row * row_size
	ADD R9, R9, R5	; index_b += col
	LDR R10, [R0, R8, LSL #2]	; r10 = arr_a[i,k]
	ADD R7, R7, R10
	LDR R10, [R2, R9, LSL #2]	; r11 = arr_b[k,j]
	ADD R7, R7, R10
	ADD R6, R6, #1
	B for3
endFor3
	
	MUL R8, R4, R11		; index=Row*nOfRows
	ADD R8, R8, R5		; index+=col
	STR R7, [R2, R8, LSL #2 ]
	
	ADD R5, R5, #1
	B for2
endFor2
	ADD R4, R4, #1
	B for1
endFor1
	
	
	

STOP	B	STOP


;
; test data
;

ARR_A	DCD	 1,  2,  3,  4
	DCD	 5,  6,  7,  8
	DCD	 9, 10, 11, 12
	DCD	13, 14, 15, 16

ARR_B	DCD	 1,  2,  3,  4
	DCD	 5,  6,  7,  8
	DCD	 9, 10, 11, 12
	DCD	13, 14, 15, 16

	END
