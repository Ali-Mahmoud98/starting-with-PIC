
_main:

;MyProject.c,27 :: 		void main() {
;MyProject.c,30 :: 		char x=0;
;MyProject.c,31 :: 		char y=0;
;MyProject.c,32 :: 		char z=0;
;MyProject.c,36 :: 		char count =0;
	CLRF        main_count_L0+0 
;MyProject.c,37 :: 		trisc=0;
	CLRF        TRISC+0 
;MyProject.c,38 :: 		trisd=0;
	CLRF        TRISD+0 
;MyProject.c,39 :: 		trisb=3;
	MOVLW       3
	MOVWF       TRISB+0 
;MyProject.c,40 :: 		portc=0;
	CLRF        PORTC+0 
;MyProject.c,42 :: 		Lcd_Init();                        // Initialize LCD
	CALL        _Lcd_Init+0, 0
;MyProject.c,44 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,45 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,47 :: 		Lcd_Out(1,4,"Your 3 numbers");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       4
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_MyProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_MyProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,49 :: 		loop1:
___main_loop1:
;MyProject.c,50 :: 		count =0;
	CLRF        main_count_L0+0 
;MyProject.c,51 :: 		while(1)
L_main0:
;MyProject.c,53 :: 		n = rand();
	CALL        _rand+0, 0
	MOVF        R0, 0 
	MOVWF       main_n_L0+0 
;MyProject.c,54 :: 		bytetostr(n ,nstr);
	MOVF        R0, 0 
	MOVWF       FARG_ByteToStr_input+0 
	MOVLW       main_nstr_L0+0
	MOVWF       FARG_ByteToStr_output+0 
	MOVLW       hi_addr(main_nstr_L0+0)
	MOVWF       FARG_ByteToStr_output+1 
	CALL        _ByteToStr+0, 0
;MyProject.c,55 :: 		Lcd_Out(2,7,nstr);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       7
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_nstr_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_nstr_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,56 :: 		if(portb.b0==1)
	BTFSS       PORTB+0, 0 
	GOTO        L_main2
;MyProject.c,58 :: 		count = count +1;
	INCF        main_count_L0+0, 1 
;MyProject.c,59 :: 		if(count == 1){x = n; bytetostr(x ,xstr);}
	MOVF        main_count_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main3
	MOVF        main_n_L0+0, 0 
	MOVWF       FARG_ByteToStr_input+0 
	MOVLW       main_xstr_L0+0
	MOVWF       FARG_ByteToStr_output+0 
	MOVLW       hi_addr(main_xstr_L0+0)
	MOVWF       FARG_ByteToStr_output+1 
	CALL        _ByteToStr+0, 0
L_main3:
;MyProject.c,60 :: 		if(count == 2){y = n; bytetostr(y ,ystr);}
	MOVF        main_count_L0+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_main4
	MOVF        main_n_L0+0, 0 
	MOVWF       FARG_ByteToStr_input+0 
	MOVLW       main_ystr_L0+0
	MOVWF       FARG_ByteToStr_output+0 
	MOVLW       hi_addr(main_ystr_L0+0)
	MOVWF       FARG_ByteToStr_output+1 
	CALL        _ByteToStr+0, 0
L_main4:
;MyProject.c,61 :: 		if(count == 3)
	MOVF        main_count_L0+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_main5
;MyProject.c,64 :: 		bytetostr(z ,zstr);
	MOVF        main_n_L0+0, 0 
	MOVWF       FARG_ByteToStr_input+0 
	MOVLW       main_zstr_L0+0
	MOVWF       FARG_ByteToStr_output+0 
	MOVLW       hi_addr(main_zstr_L0+0)
	MOVWF       FARG_ByteToStr_output+1 
	CALL        _ByteToStr+0, 0
;MyProject.c,65 :: 		goto loop2;
	GOTO        ___main_loop2
;MyProject.c,66 :: 		}
L_main5:
;MyProject.c,67 :: 		while(portb.b0==1){}
L_main6:
	BTFSS       PORTB+0, 0 
	GOTO        L_main7
	GOTO        L_main6
L_main7:
;MyProject.c,68 :: 		}
L_main2:
;MyProject.c,69 :: 		}
	GOTO        L_main0
;MyProject.c,71 :: 		loop2:
___main_loop2:
;MyProject.c,72 :: 		while(1)
L_main8:
;MyProject.c,74 :: 		Lcd_Out(2,7,xstr);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       7
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_xstr_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_xstr_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,75 :: 		delay_ms(500);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_main10:
	DECFSZ      R13, 1, 1
	BRA         L_main10
	DECFSZ      R12, 1, 1
	BRA         L_main10
	DECFSZ      R11, 1, 1
	BRA         L_main10
	NOP
	NOP
;MyProject.c,76 :: 		Lcd_Out(2,7,ystr);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       7
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_ystr_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_ystr_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,77 :: 		delay_ms(500);
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
;MyProject.c,78 :: 		Lcd_Out(2,7,zstr);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       7
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_zstr_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_zstr_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,79 :: 		delay_ms(500);
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
;MyProject.c,80 :: 		if(portb.b1 == 1 ){goto loop1;}
	BTFSS       PORTB+0, 1 
	GOTO        L_main13
	GOTO        ___main_loop1
L_main13:
;MyProject.c,81 :: 		}
	GOTO        L_main8
;MyProject.c,82 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
