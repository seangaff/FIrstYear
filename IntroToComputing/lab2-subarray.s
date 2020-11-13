;
; CS1022 Introduction to Computing II 2018/2019
; Lab 2 - Subarray
;

N	EQU	7
M	EQU	3	
TRUE EQU 1
FALSE EQU 0	

	AREA	RESET, CODE, READONLY
	ENTRY

	; initialize system stack pointer (SP)
	LDR	SP, =0x40010000

	;
	; Write your program here to determine whether SMALL_A
	;   is a subarray of LARGE_A
	;
	; Store 1 in R0 if SMALL_A is a subarray and zero otherwise
	;
	LDR R0, =0	; initialize isSub to false
	LDR r1, =0	; initialize originX
	LDR r2, =0	; initialize originY

	LDR r4, =LARGE_A	; init largeArr start address
	LDR r5, =SMALL_A	; init smallArr start address
wh
	BL findOrigin
	CMP r1, #N	; while( originX = length of largeArr end Loop)
	BHS eWh		; {
	BL checkSub
	CMP R0, #TRUE 		;if(isSub) {
	BEQ STOP				;break }
	ADD R2, R2, #1		;originY++
	B wh		; }
eWh

STOP	B	STOP

; findOrigin subroutine
; Finds the potential origin of subarr
; r1 and r2 contain starting origin x y
; returns r1 and r2 with origin x and y
findOrigin
	PUSH {R4-R11, lr}
	MOV R4, R1	; i = origin
	LDR R9, =LARGE_A
	LDR R10, =SMALL_A
	LDR R8, [R10]	; set small arr 0,0 from get go.
	LDR R11, =N 	; largeArrSize = N
findOrigin1
	CMP R4, #N		;while(i < N) {
	BHS findOrigin5
	MOV R5, R2		; j = origin
findOrigin2
	CMP R5, #N		; while(j < N) {
	BHS findOrigin4
	MUL R6, R4, R11 ; i * N
	ADD R6, R6, R5	; R6 = index
	LDR R7, [R9, R6, LSL #2]	; = largeArr[i][j]
	LDR R8, [R10]				; = smallArr[0][0]
	CMP R7,R8			; if(largeArr[i][j] == smallArr[0][0]) {
	BNE findOrigin3
	MOV R1, R4			; originX = i
	MOV R2, R5			; originY = j
	B findOrigin6		; }
findOrigin3				; else {
	ADD R5, R5, #1		; j++
	B findOrigin2		;}
findOrigin4				;}
	ADD R4, R4, #1		; i++
	B findOrigin1		;}
findOrigin5
	LDR R1, =N			
findOrigin6
	POP {R4-R11, pc}


; checkSub subroutine to check if array is sub array from origin
; input R1, R2 origin (x, y)
checkSub
	PUSH {R4-R12, lr}
	LDR R4, =LARGE_A
	LDR R5, =SMALL_A
	LDR R0, =TRUE ; match = true
	LDR R7, =0
checkSub1
	CMP R7, #M	; for(i<smallArr.length)
	BHS checkSub5
	LDR R8, =0  ; j = 0
checkSub2
	CMP R8, #M	; for(j<smallArr[0].length)
	BHS checkSub4
	LDR R12, =N
	LDR R11, =M
	MUL R9, R7, R11 
	ADD R9, R9, R8	;  = index Small
	ADD R11, R7, R1	;  = i+origin (throwaway var)
	MUL R10, R11,R12	; x = M*(i+origin)
	ADD R10, R10, R8	;x = x + M 
	ADD R10, R10, R2 ; x = indexBig [i+origin][j+origin]
	LDR R11, [R5, R9, LSL #2]	;  = smallArr[i][j]
	LDR R12, [R4, R10, LSL #2]	; y = bigArr[i+origin][j+origin]
	CMP R11, R12
	BEQ checkSub3 		; if (y != y not subarray false,) {quit}
	LDR R0, =FALSE
	B checkSub5
checkSub3
	ADD R8, R8, #1   ;j++
	B checkSub2
checkSub4
	ADD R7, R7, #1	; i++
	B checkSub1
checkSub5
	POP {R4-R12, pc}
	BX LR
;
; test data
;

LARGE_A	DCD	 48, 37, 15, 44,  3, 17, 26
	DCD	  2,  9, 12, 18, 14, 33, 16
	DCD	 13, 20,  1, 22,  7, 48, 21
	DCD	 27, 19, 44, 49, 44, 18, 10
	DCD	 29, 17, 22,  4, 46, 43, 41
	DCD	 37, 35, 38, 34, 16, 25,  0
	DCD	 17,  0, 48, 15, 27, 35, 11

SMALL_A	DCD	 49, 44, 18
	DCD	  4, 46, 43
	DCD	 34, 16, 25

	END