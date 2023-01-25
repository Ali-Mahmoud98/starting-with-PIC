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
    int temp;
    char temp_str[6];
    
    trisc=0;
    trisd=0;

    Lcd_Init();                        // Initialize LCD

    Lcd_Cmd(_LCD_CLEAR);               // Clear display
    Lcd_Cmd(_LCD_CURSOR_OFF);
    
    Lcd_Out(1,2,"Temperature 'C");
    
    while(1)
    {
     temp = ADC_Read(0) * 0.487;
     wordtostr(temp , temp_str);
     Lcd_Out(2,5,temp_str);
    }
}