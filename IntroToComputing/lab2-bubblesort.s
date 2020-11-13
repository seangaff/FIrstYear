;
; CS1022 Introduction to Computing II 2019/2020
; Lab 1B - Bubble Sort
;

N	EQU	10
FALSE EQU 0
TRUE EQU 1

	AREA	globals, DATA, READWRITE

; N word-size values

SORTED	SPACE	N*4		; N words (4 bytes each)


	AREA	RESET, CODE, READONLY
	ENTRY


	;
	; copy the test data into RAM
	;

	LDR	R4, =SORTED
	LDR	R5, =UNSORT
	LDR	R6, =0
whInit	CMP	R6, #N
	BHS	eWhInit
	LDR	R7, [R5, R6, LSL #2]
	STR	R7, [R4, R6, LSL #2]
	ADD	R6, R6, #1
	B	whInit
eWhInit

	LDR	R4, =SORTED
	LDR	R5, =UNSORT

	;
	; your sort program goes here
doWh					; do {
	LDR R0, #FALSE		;swapped = false;

	LDR R1, #1			; i = 1
for						;
	CMP R1, #N			; for (i < N)
	BHS endFor
	ADD R1, R1, #1		; i ++

	SUB R2, R1, #1				; i - 1
	LDR R8, [R4 ,R2, LSL #2]	; ARR[i-1]
	LDR R9, [R4 ,R1, LSL #2]	; ARR[i]
	CMP R8, R9					; if (ARR[i-1] > ARR[i])
	BLO dontSwap				; {
	LDR R10, R8					; tempswap = array[i-1]
	STR R8, [R4 ,R2, LSL #2]	; ARR[i-1] = ARR[i]
	STR R10, [R4 ,R1, LSL #2]	; ARR[i] = tempswap
	LDR R0, #TRUE				; swapped = true
dontSwap						; }
	B for
endFor	
    
	CMP R0, #FALSE		; } 
	BEQ done			; while(swapped) 
	B doWh
done

	
stop	B stop

UNSORT	DCD	9,3,0,1,6,2,4,7,8,5

	END
