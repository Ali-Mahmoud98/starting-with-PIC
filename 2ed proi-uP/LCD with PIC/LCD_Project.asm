
_main:

;LCD_Project.c,27 :: 		void main() {
;LCD_Project.c,28 :: 		char s=0;
	CLRF        main_s_L0+0 
	CLRF        main_m_L0+0 
	CLRF        main_h_L0+0 
;LCD_Project.c,34 :: 		TRISD = 0;
	CLRF        TRISD+0 
;LCD_Project.c,35 :: 		TRISC = 0;
	CLRF        TRISC+0 
;LCD_Project.c,36 :: 		TRISB = 7;
	MOVLW       7
	MOVWF       TRISB+0 
;LCD_Project.c,37 :: 		Lcd_Init();                        // Initialize LCD
	CALL        _Lcd_Init+0, 0
;LCD_Project.c,39 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;LCD_Project.c,40 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;LCD_Project.c,42 :: 		Lcd_Out(1,5,"Hr");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       5
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_LCD_Project+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_LCD_Project+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;LCD_Project.c,43 :: 		Lcd_Out(1,7,":");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       7
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_LCD_Project+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_LCD_Project+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;LCD_Project.c,44 :: 		Lcd_Out(1,8,"Min");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       8
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr3_LCD_Project+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr3_LCD_Project+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;LCD_Project.c,45 :: 		Lcd_Out(1,11,":");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       11
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr4_LCD_Project+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr4_LCD_Project+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;LCD_Project.c,46 :: 		Lcd_Out(1,12,"Sec");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       12
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr5_LCD_Project+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr5_LCD_Project+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;LCD_Project.c,47 :: 		Lcd_Out(2,7,":");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       7
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr6_LCD_Project+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr6_LCD_Project+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;LCD_Project.c,48 :: 		Lcd_Out(2,11,":");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       11
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr7_LCD_Project+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr7_LCD_Project+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;LCD_Project.c,49 :: 		start:
___main_start:
;LCD_Project.c,50 :: 		if(s>59){s=0 ; m=m+1;}
	MOVF        main_s_L0+0, 0 
	SUBLW       59
	BTFSC       STATUS+0, 0 
	GOTO        L_main0
	CLRF        main_s_L0+0 
	INCF        main_m_L0+0, 1 
L_main0:
;LCD_Project.c,51 :: 		while(1)
L_main1:
;LCD_Project.c,53 :: 		s=s+1;
	INCF        main_s_L0+0, 1 
;LCD_Project.c,54 :: 		if(portb.b0==1){}
	BTFSS       PORTB+0, 0 
	GOTO        L_main3
L_main3:
;LCD_Project.c,55 :: 		if(s>59){s=0 ; m=m+1;}
	MOVF        main_s_L0+0, 0 
	SUBLW       59
	BTFSC       STATUS+0, 0 
	GOTO        L_main4
	CLRF        main_s_L0+0 
	INCF        main_m_L0+0, 1 
L_main4:
;LCD_Project.c,56 :: 		if(m>59){m=0 ; h=h+1;}
	MOVF        main_m_L0+0, 0 
	SUBLW       59
	BTFSC       STATUS+0, 0 
	GOTO        L_main5
	CLRF        main_m_L0+0 
	INCF        main_h_L0+0, 1 
L_main5:
;LCD_Project.c,57 :: 		if(h>23){h=0 ;}
	MOVF        main_h_L0+0, 0 
	SUBLW       23
	BTFSC       STATUS+0, 0 
	GOTO        L_main6
	CLRF        main_h_L0+0 
L_main6:
;LCD_Project.c,58 :: 		bytetostr(s ,sec);
	MOVF        main_s_L0+0, 0 
	MOVWF       FARG_ByteToStr_input+0 
	MOVLW       main_sec_L0+0
	MOVWF       FARG_ByteToStr_output+0 
	MOVLW       hi_addr(main_sec_L0+0)
	MOVWF       FARG_ByteToStr_output+1 
	CALL        _ByteToStr+0, 0
;LCD_Project.c,59 :: 		bytetostr(m ,min);
	MOVF        main_m_L0+0, 0 
	MOVWF       FARG_ByteToStr_input+0 
	MOVLW       main_min_L0+0
	MOVWF       FARG_ByteToStr_output+0 
	MOVLW       hi_addr(main_min_L0+0)
	MOVWF       FARG_ByteToStr_output+1 
	CALL        _ByteToStr+0, 0
;LCD_Project.c,60 :: 		bytetostr(h ,hr);
	MOVF        main_h_L0+0, 0 
	MOVWF       FARG_ByteToStr_input+0 
	MOVLW       main_hr_L0+0
	MOVWF       FARG_ByteToStr_output+0 
	MOVLW       hi_addr(main_hr_L0+0)
	MOVWF       FARG_ByteToStr_output+1 
	CALL        _ByteToStr+0, 0
;LCD_Project.c,61 :: 		if(portb.b0==1){goto adj;}
	BTFSS       PORTB+0, 0 
	GOTO        L_main7
	GOTO        ___main_adj
L_main7:
;LCD_Project.c,62 :: 		Lcd_Out(2,3,hr);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       3
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_hr_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_hr_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;LCD_Project.c,63 :: 		Lcd_Out(2,8,min);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       8
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_min_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_min_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;LCD_Project.c,64 :: 		Lcd_Out(2,12,sec);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       12
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_sec_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_sec_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;LCD_Project.c,66 :: 		delay_ms(400);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main8:
	DECFSZ      R13, 1, 1
	BRA         L_main8
	DECFSZ      R12, 1, 1
	BRA         L_main8
	DECFSZ      R11, 1, 1
	BRA         L_main8
;LCD_Project.c,67 :: 		}
	GOTO        L_main1
;LCD_Project.c,68 :: 		while(1)
L_main9:
;LCD_Project.c,70 :: 		adj:
___main_adj:
;LCD_Project.c,71 :: 		if(portb.b1==1){m = m+1;}
	BTFSS       PORTB+0, 1 
	GOTO        L_main11
	INCF        main_m_L0+0, 1 
L_main11:
;LCD_Project.c,72 :: 		if(portb.b2==1){h = h+1;}
	BTFSS       PORTB+0, 2 
	GOTO        L_main12
	INCF        main_h_L0+0, 1 
L_main12:
;LCD_Project.c,73 :: 		if(m>59){m=0 ; h=h+1;}
	MOVF        main_m_L0+0, 0 
	SUBLW       59
	BTFSC       STATUS+0, 0 
	GOTO        L_main13
	CLRF        main_m_L0+0 
	INCF        main_h_L0+0, 1 
L_main13:
;LCD_Project.c,74 :: 		if(h>23){h=0 ;}
	MOVF        main_h_L0+0, 0 
	SUBLW       23
	BTFSC       STATUS+0, 0 
	GOTO        L_main14
	CLRF        main_h_L0+0 
L_main14:
;LCD_Project.c,75 :: 		bytetostr(s ,sec);
	MOVF        main_s_L0+0, 0 
	MOVWF       FARG_ByteToStr_input+0 
	MOVLW       main_sec_L0+0
	MOVWF       FARG_ByteToStr_output+0 
	MOVLW       hi_addr(main_sec_L0+0)
	MOVWF       FARG_ByteToStr_output+1 
	CALL        _ByteToStr+0, 0
;LCD_Project.c,76 :: 		bytetostr(m ,min);
	MOVF        main_m_L0+0, 0 
	MOVWF       FARG_ByteToStr_input+0 
	MOVLW       main_min_L0+0
	MOVWF       FARG_ByteToStr_output+0 
	MOVLW       hi_addr(main_min_L0+0)
	MOVWF       FARG_ByteToStr_output+1 
	CALL        _ByteToStr+0, 0
;LCD_Project.c,77 :: 		bytetostr(h ,hr);
	MOVF        main_h_L0+0, 0 
	MOVWF       FARG_ByteToStr_input+0 
	MOVLW       main_hr_L0+0
	MOVWF       FARG_ByteToStr_output+0 
	MOVLW       hi_addr(main_hr_L0+0)
	MOVWF       FARG_ByteToStr_output+1 
	CALL        _ByteToStr+0, 0
;LCD_Project.c,78 :: 		Lcd_Out(2,3,hr);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       3
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_hr_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_hr_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;LCD_Project.c,79 :: 		Lcd_Out(2,8,min);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       8
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_min_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_min_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;LCD_Project.c,80 :: 		Lcd_Out(2,12,sec);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       12
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_sec_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_sec_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;LCD_Project.c,81 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main15:
	DECFSZ      R13, 1, 1
	BRA         L_main15
	DECFSZ      R12, 1, 1
	BRA         L_main15
	DECFSZ      R11, 1, 1
	BRA         L_main15
	NOP
;LCD_Project.c,82 :: 		if(portb.b0==0){goto start;}
	BTFSC       PORTB+0, 0 
	GOTO        L_main16
	GOTO        ___main_start
L_main16:
;LCD_Project.c,83 :: 		}
	GOTO        L_main9
;LCD_Project.c,84 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
