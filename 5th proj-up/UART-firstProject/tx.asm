
_main:

;tx.c,1 :: 		void main() {
;tx.c,3 :: 		char x=0;
	CLRF        main_x_L0+0 
	CLRF        main_y_L0+0 
	CLRF        main_z_L0+0 
	CLRF        main_count_L0+0 
;tx.c,7 :: 		UART1_Init(9600);
	MOVLW       51
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;tx.c,8 :: 		Delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main0:
	DECFSZ      R13, 1, 1
	BRA         L_main0
	DECFSZ      R12, 1, 1
	BRA         L_main0
	DECFSZ      R11, 1, 1
	BRA         L_main0
	NOP
;tx.c,10 :: 		trisd=0;
	CLRF        TRISD+0 
;tx.c,11 :: 		trisb=3;
	MOVLW       3
	MOVWF       TRISB+0 
;tx.c,13 :: 		loop1:
___main_loop1:
;tx.c,14 :: 		count =0;
	CLRF        main_count_L0+0 
;tx.c,15 :: 		while(1)
L_main1:
;tx.c,18 :: 		n = rand();
	CALL        _rand+0, 0
	MOVF        R0, 0 
	MOVWF       main_n_L0+0 
;tx.c,19 :: 		UART1_Write(n);
	MOVF        R0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;tx.c,20 :: 		portd = n;
	MOVF        main_n_L0+0, 0 
	MOVWF       PORTD+0 
;tx.c,21 :: 		if(portb.b0==1)  // S1 = portb.b0
	BTFSS       PORTB+0, 0 
	GOTO        L_main3
;tx.c,23 :: 		count = count +1;
	INCF        main_count_L0+0, 1 
;tx.c,24 :: 		if(count == 1){
	MOVF        main_count_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main4
;tx.c,25 :: 		x = n;
	MOVF        main_n_L0+0, 0 
	MOVWF       main_x_L0+0 
;tx.c,28 :: 		}
L_main4:
;tx.c,29 :: 		if(count == 2){
	MOVF        main_count_L0+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_main5
;tx.c,30 :: 		y = n;
	MOVF        main_n_L0+0, 0 
	MOVWF       main_y_L0+0 
;tx.c,33 :: 		}
L_main5:
;tx.c,34 :: 		if(count == 3)
	MOVF        main_count_L0+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_main6
;tx.c,36 :: 		z = n;
	MOVF        main_n_L0+0, 0 
	MOVWF       main_z_L0+0 
;tx.c,39 :: 		goto loop2;
	GOTO        ___main_loop2
;tx.c,40 :: 		}
L_main6:
;tx.c,41 :: 		while(portb.b0==1){}   // S1 = portb.b0
L_main7:
	BTFSS       PORTB+0, 0 
	GOTO        L_main8
	GOTO        L_main7
L_main8:
;tx.c,42 :: 		}
L_main3:
;tx.c,43 :: 		}
	GOTO        L_main1
;tx.c,45 :: 		loop2:
___main_loop2:
;tx.c,46 :: 		while(1)
L_main9:
;tx.c,48 :: 		UART1_Write(x);
	MOVF        main_x_L0+0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;tx.c,49 :: 		portd = x;
	MOVF        main_x_L0+0, 0 
	MOVWF       PORTD+0 
;tx.c,50 :: 		delay_ms(500);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_main11:
	DECFSZ      R13, 1, 1
	BRA         L_main11
	DECFSZ      R12, 1, 1
	BRA         L_main11
	DECFSZ      R11, 1, 1
	BRA         L_main11
	NOP
	NOP
;tx.c,51 :: 		UART1_Write(y);
	MOVF        main_y_L0+0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;tx.c,52 :: 		portd = y;
	MOVF        main_y_L0+0, 0 
	MOVWF       PORTD+0 
;tx.c,53 :: 		delay_ms(500);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_main12:
	DECFSZ      R13, 1, 1
	BRA         L_main12
	DECFSZ      R12, 1, 1
	BRA         L_main12
	DECFSZ      R11, 1, 1
	BRA         L_main12
	NOP
	NOP
;tx.c,54 :: 		UART1_Write(z);
	MOVF        main_z_L0+0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;tx.c,55 :: 		portd = z;
	MOVF        main_z_L0+0, 0 
	MOVWF       PORTD+0 
;tx.c,56 :: 		delay_ms(500);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_main13:
	DECFSZ      R13, 1, 1
	BRA         L_main13
	DECFSZ      R12, 1, 1
	BRA         L_main13
	DECFSZ      R11, 1, 1
	BRA         L_main13
	NOP
	NOP
;tx.c,57 :: 		if(portb.b1 == 1 ){goto loop1;}   // S1 = portb.b1
	BTFSS       PORTB+0, 1 
	GOTO        L_main14
	GOTO        ___main_loop1
L_main14:
;tx.c,58 :: 		}
	GOTO        L_main9
;tx.c,59 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
