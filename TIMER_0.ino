#define OUTPUT_PIN 6  // OC0A está en el pin 6 de Arduino UNO

void setup() {
  pinMode(OUTPUT_PIN, OUTPUT);
  
  // Configuración del Timer0 en modo CTC
  TCCR0A = (1 << WGM01) | (1 << COM0A0);  // Modo CTC y Toggle OC0A en comparación
  TCCR0B = (1 << CS02) | (1 << CS00);  // Prescaler de 1024

  OCR0A = 7;  // Valor de comparación para generar la frecuencia deseada

  // OCR0A = (F_CPU / (2 * Prescaler * Freq)) - 1
  // Freq =  (16 MHz / (2 * 1024 * (124 + 1))) ≈ 62.5 Hz
}

void loop() {
  // No es necesario hacer nada aquí, el Timer0 maneja la señal automáticamente
}
 
