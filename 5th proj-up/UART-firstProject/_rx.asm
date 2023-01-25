
_main:

;_rx.c,27 :: 		void main() {
;_rx.c,31 :: 		trisd=0;
	CLRF        TRISD+0 
;_rx.c,32 :: 		trisb=0;
	CLRF        TRISB+0 
;_rx.c,34 :: 		UART1_Init(9600);
	MOVLW       51
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;_rx.c,35 :: 		Delay_ms(100);
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
;_rx.c,36 :: 		Lcd_Init();                        // Initialize LCD
	CALL        _Lcd_Init+0, 0
;_rx.c,38 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;_rx.c,39 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;_rx.c,41 :: 		Lcd_Out(1,4,"Your 3 numbers");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       4
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1__rx+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1__rx+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;_rx.c,43 :: 		while (1) {                     // Endless loop
L_main1:
;_rx.c,44 :: 		if (UART1_Data_Ready()) {     // If data is received,
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main3
;_rx.c,45 :: 		recieved_data = UART1_Read();     // read the received data,
	CALL        _UART1_Read+0, 0
;_rx.c,46 :: 		bytetostr(recieved_data,Display);
	MOVF        R0, 0 
	MOVWF       FARG_ByteToStr_input+0 
	MOVLW       main_Display_L0+0
	MOVWF       FARG_ByteToStr_output+0 
	MOVLW       hi_addr(main_Display_L0+0)
	MOVWF       FARG_ByteToStr_output+1 
	CALL        _ByteToStr+0, 0
;_rx.c,47 :: 		lcd_out(2,7,Display);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       7
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_Display_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_Display_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;_rx.c,48 :: 		}
L_main3:
;_rx.c,49 :: 		}
	GOTO        L_main1
;_rx.c,52 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
