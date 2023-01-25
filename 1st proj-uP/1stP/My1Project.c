void main() {
    TRISC = 0x00;
    while(1){
    PORTC = 0b11110000;
    Delay_ms(500);
    PORTC = ~PORTC;
    Delay_ms(500);
    }
}