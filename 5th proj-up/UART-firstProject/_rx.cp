#line 1 "C:/Users/Ali Mahmoud/Desktop/final task/_rx.c"
 sbit LCD_RS at RB0_bit;
 sbit LCD_RW at RB1_bit;
 sbit LCD_EN at RB2_bit;

 sbit LCD_D0 at RD0_bit;
 sbit LCD_D1 at RD1_bit;
 sbit LCD_D2 at RD2_bit;
 sbit LCD_D3 at RD3_bit;
 sbit LCD_D4 at RD4_bit;
 sbit LCD_D5 at RD5_bit;
 sbit LCD_D6 at RD6_bit;
 sbit LCD_D7 at RD7_bit;

 sbit LCD_RS_Direction at TRISB0_bit;
 sbit LCD_RW_Direction at TRISB1_bit;
 sbit LCD_EN_Direction at TRISB2_bit;

 sbit LCD_D0_Direction at TRISD0_bit;
 sbit LCD_D1_Direction at TRISD1_bit;
 sbit LCD_D2_Direction at TRISD2_bit;
 sbit LCD_D3_Direction at TRISD3_bit;
 sbit LCD_D4_Direction at TRISD4_bit;
 sbit LCD_D5_Direction at TRISD5_bit;
 sbit LCD_D6_Direction at TRISD6_bit;
 sbit LCD_D7_Direction at TRISD7_bit;

void main() {
char recieved_data;
char Display[4];

trisd=0;
trisb=0;

UART1_Init(9600);
Delay_ms(100);
Lcd_Init();

Lcd_Cmd(_LCD_CLEAR);
Lcd_Cmd(_LCD_CURSOR_OFF);

Lcd_Out(1,4,"Your 3 numbers");

 while (1) {
 if (UART1_Data_Ready()) {
 recieved_data = UART1_Read();
 bytetostr(recieved_data,Display);
 lcd_out(2,7,Display);
 }
 }


}
