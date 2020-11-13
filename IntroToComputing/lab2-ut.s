;
; CS1022 Introduction to Computing II 2018/2019
; Lab 2 - Upper Triangular
;

N	EQU	4		

	AREA	RESET, CODE, READONLY
	ENTRY

	; initialize system stack pointer (SP)
	LDR	SP, =0x40010000

	;
	; write your program here to determine whether ARR_A
	;   (below) is a matrix in Upper Triangular form.
	;
	; Store 1 in R0 if the matrix is in Upper Triangular form
	;   and zero otherwise.
	;
	MOV R0, #1
	LDR R1, =ARR_A
	MOV R2, #1		; init rowCounter at 1 (row 0 will not check)
	MOV R3, #0		; init colCounter at 0
	MOV R4, #N		; N reference
rowFor
	CMP R0, #0
	BEQ endRowFor	; check that triangular form has not already been spoiled
	
	CMP R2, #N
	BHS endRowFor	
	MOV R3, #0		; for(i<rowNum){reset col coutner
colFor
	CMP R3, R2
	BHS endColFor	; for(j<rowNum) ; this iterates through everythign below the diagonal
	
	MUL R5, R2, R4				; index = row * rowSize
	ADD R5, R5, R3				; index += col
	LDR R6, [R1, R5, LSL #2]	; r6 = arr[index]
	ORR R7, R6, #0				; or R6, 0
	MVN R7, R7					; not R7 (if 0 or 0 then 1)
	AND R0, R0, R7				; if r0 = 1 and R7 = 1 r0 stays 0
	ADD R3, R3, #1				; iterate
	B colFor					;branch
endColFor
	ADD R2, R2, #1				; iterate
	B rowFor					; branch
endRowFor
STOP	B	STOP


;
; test data
;

ARR_A	DCD	 1,  2,  3,  4
		DCD	 0,  6,  7,  8
		DCD	 0,  0, 11, 12
		DCD	 0,  0,  0, 16

	END
