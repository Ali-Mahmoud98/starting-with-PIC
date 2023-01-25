void main() {
       char n;
    char x=0;
    char y=0;
    char z=0;
    char count =0;
    UART1_Init(9600);
    Delay_ms(100);

    trisd=0;
    trisb=3;

    loop1:
    count =0;
    while(1)
    {

     n = rand();
     UART1_Write(n);
     portd = n;
     if(portb.b0==1)  // S1 = portb.b0
     {
     count = count +1;
     if(count == 1){
        x = n;
        //UART1_Write(x);
        //portd = x;
     }
     if(count == 2){
        y = n;
        //UART1_Write(y);
        //portd = y;
     }
     if(count == 3)
       {
       z = n;
       //UART1_Write(z);
       //portd = z;
       goto loop2;
       }
     while(portb.b0==1){}   // S1 = portb.b0
     }
    }

    loop2:
    while(1)
    {
     UART1_Write(x);
     portd = x;
     delay_ms(500);
     UART1_Write(y);
     portd = y;
     delay_ms(500);
     UART1_Write(z);
     portd = z;
     delay_ms(500);
     if(portb.b1 == 1 ){goto loop1;}   // S1 = portb.b1
    }
}