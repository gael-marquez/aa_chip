#define FOSC 1600000 // Clock Speed
#define BAUD 9600 // VELOCIDAD DE COMUNICACION
#define MYUBRR FOSC/16/BAUD-1 // FORMULA cargar en el registro UBRR para que la UART transmita a la velocidad deseada.
//PRACT  LABB
#include <avr/io.h>
#include <util/delay.h>

void USART_Init(unsigned int ubrr)
{
    /* Set baud rate */
    UBRR0H = (unsigned char)(ubrr>>8);
    UBRR0L = (unsigned char)ubrr;


    UCSR0B = (1<<RXEN0) | (1<<TXEN0);
    
   
    UCSR0C = (1<<USBS0) | (3<<UCSZ00); //FORMATO DE COMUNICACION   SIZE BIT  AND SIZE CHARACTER
}

void USART_Transmit(unsigned char data)
{
    while (!(UCSR0A & (1<<UDRE0))); // Espera a que el buffer esté vacío
    UDR0 = data; // Envía el dato
}

int main(void)
{
    USART_Init(MYUBRR); // Inicializa UART  

    while (1)
    {
        USART_Transmit('A'); // Envía el carácter 'A'
        _delay_ms(1000); // Espera para visualizar mejor la señal
    }
}
