int main(void){

  cli();   //clear desa
  DDRB =0x20;
  PORTD |= 0x08;  // estado
  EICRA = 0b00001000;
  EIMSK = 2;
  sei();         //puerto 5 led del arduino  SET ACTIVA
  while(1){  
  }

}
 ISR(INT1_vect){ // LA NUEVA ES, LA VIEJA ES 
  PINB |= 0x20;
 }
    //con interrupcion 1 encinede led -> 0 apaga