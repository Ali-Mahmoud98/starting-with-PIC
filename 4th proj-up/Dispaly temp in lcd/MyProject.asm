
_main:

;MyProject.c,27 :: 		void main() {
;MyProject.c,31 :: 		trisc=0;
	CLRF        TRISC+0 
;MyProject.c,32 :: 		trisd=0;
	CLRF        TRISD+0 
;MyProject.c,34 :: 		Lcd_Init();                        // Initialize LCD
	CALL        _Lcd_Init+0, 0
;MyProject.c,36 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,37 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,39 :: 		Lcd_Out(1,2,"Temperature 'C");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_MyProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_MyProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,41 :: 		while(1)
L_main0:
;MyProject.c,43 :: 		temp = ADC_Read(0) * 0.487;
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	CALL        _word2double+0, 0
	MOVLW       16
	MOVWF       R4 
	MOVLW       88
	MOVWF       R5 
	MOVLW       121
	MOVWF       R6 
	MOVLW       125
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	CALL        _double2int+0, 0
;MyProject.c,44 :: 		wordtostr(temp , temp_str);
	MOVF        R0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVF        R1, 0 
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       main_temp_str_L0+0
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(main_temp_str_L0+0)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;MyProject.c,45 :: 		Lcd_Out(2,5,temp_str);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       5
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_temp_str_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_temp_str_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,46 :: 		}
	GOTO        L_main0
;MyProject.c,47 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
