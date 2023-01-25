#line 1 "C:/Users/Ali Mahmoud/Desktop/3ed proj-up/MyProject.c"
 sbit LCD_RS at RD0_bit;
 sbit LCD_RW at RD1_bit;
 sbit LCD_EN at RD2_bit;

 sbit LCD_D0 at RC0_bit;
 sbit LCD_D1 at RC1_bit;
 sbit LCD_D2 at RC2_bit;
 sbit LCD_D3 at RC3_bit;
 sbit LCD_D4 at RC4_bit;
 sbit LCD_D5 at RC5_bit;
 sbit LCD_D6 at RC6_bit;
 sbit LCD_D7 at RC7_bit;

 sbit LCD_RS_Direction at TRISD0_bit;
 sbit LCD_RW_Direction at TRISD1_bit;
 sbit LCD_EN_Direction at TRISD2_bit;

 sbit LCD_D0_Direction at TRISC0_bit;
 sbit LCD_D1_Direction at TRISC1_bit;
 sbit LCD_D2_Direction at TRISC2_bit;
 sbit LCD_D3_Direction at TRISC3_bit;
 sbit LCD_D4_Direction at TRISC4_bit;
 sbit LCD_D5_Direction at TRISC5_bit;
 sbit LCD_D6_Direction at TRISC6_bit;
 sbit LCD_D7_Direction at TRISC7_bit;

void main() {
 char n;
 char nstr[4];
 char x=0;
 char y=0;
 char z=0;
 char xstr[4];
 char ystr[4];
 char zstr[4];
 char count =0;
 trisc=0;
 trisd=0;
 trisb=3;
 portc=0;

 Lcd_Init();

 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);

 Lcd_Out(1,4,"Your 3 numbers");

 loop1:
 count =0;
 while(1)
 {
 n = rand();
 bytetostr(n ,nstr);
 Lcd_Out(2,7,nstr);
 if(portb.b0==1)
 {
 count = count +1;
 if(count == 1){x = n; bytetostr(x ,xstr);}
 if(count == 2){y = n; bytetostr(y ,ystr);}
 if(count == 3)
 {
 z = n;
 bytetostr(z ,zstr);
 goto loop2;
 }
 while(portb.b0==1){}
 }
 }

 loop2:
 while(1)
 {
 Lcd_Out(2,7,xstr);
 delay_ms(500);
 Lcd_Out(2,7,ystr);
 delay_ms(500);
 Lcd_Out(2,7,zstr);
 delay_ms(500);
 if(portb.b1 == 1 ){goto loop1;}
 }
}
