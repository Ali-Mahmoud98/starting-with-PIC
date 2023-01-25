
_main:

;My1Project.c,1 :: 		void main() {
;My1Project.c,2 :: 		TRISC = 0x00;
	CLRF        TRISC+0 
;My1Project.c,3 :: 		while(1){
L_main0:
;My1Project.c,4 :: 		PORTC = 0b11110000;
	MOVLW       240
	MOVWF       PORTC+0 
;My1Project.c,5 :: 		Delay_ms(500);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_main2:
	DECFSZ      R13, 1, 1
	BRA         L_main2
	DECFSZ      R12, 1, 1
	BRA         L_main2
	DECFSZ      R11, 1, 1
	BRA         L_main2
	NOP
	NOP
;My1Project.c,6 :: 		PORTC = ~PORTC;
	COMF        PORTC+0, 1 
;My1Project.c,7 :: 		Delay_ms(500);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_main3:
	DECFSZ      R13, 1, 1
	BRA         L_main3
	DECFSZ      R12, 1, 1
	BRA         L_main3
	DECFSZ      R11, 1, 1
	BRA         L_main3
	NOP
	NOP
;My1Project.c,8 :: 		}
	GOTO        L_main0
;My1Project.c,9 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
