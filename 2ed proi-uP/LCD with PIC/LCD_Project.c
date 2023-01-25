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
     char s=0;
     char m=0;
     char h=0;
     char sec[4];
     char min[4];
     char hr[4];
     TRISD = 0;
     TRISC = 0;
     TRISB = 7;
     Lcd_Init();                        // Initialize LCD

     Lcd_Cmd(_LCD_CLEAR);               // Clear display
     Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
    
    Lcd_Out(1,5,"Hr");
    Lcd_Out(1,7,":");
    Lcd_Out(1,8,"Min");
    Lcd_Out(1,11,":");
    Lcd_Out(1,12,"Sec");
    Lcd_Out(2,7,":");
    Lcd_Out(2,11,":");
    start:
    if(s>59){s=0 ; m=m+1;}
    while(1)
     {
       s=s+1;
       if(portb.b0==1){}
       if(s>59){s=0 ; m=m+1;}
       if(m>59){m=0 ; h=h+1;}
       if(h>23){h=0 ;}
       bytetostr(s ,sec);
       bytetostr(m ,min);
       bytetostr(h ,hr);
       if(portb.b0==1){goto adj;}
       Lcd_Out(2,3,hr);
       Lcd_Out(2,8,min);
       Lcd_Out(2,12,sec);
       
       delay_ms(400);
     }
     while(1)
     {
     adj:
     if(portb.b1==1){m = m+1;}
     if(portb.b2==1){h = h+1;}
     if(m>59){m=0 ; h=h+1;}
     if(h>23){h=0 ;}
     bytetostr(s ,sec);
     bytetostr(m ,min);
     bytetostr(h ,hr);
     Lcd_Out(2,3,hr);
     Lcd_Out(2,8,min);
     Lcd_Out(2,12,sec);
     delay_ms(100);
     if(portb.b0==0){goto start;}
     }
}