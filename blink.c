#ifndef F_CPU
#define F_CPU 16000000UL
#endif
 
#include <avr/io.h>
#include <util/delay.h>
 
int main(void) {
    DDRB |= (1 << PORTB5);          // configure PB5 as output
    while (1) {
        PORTB ^= (1 << PORTB5);     // flip state on PB5
        _delay_ms(250);             // wait 250 milliseconds
    }
}
