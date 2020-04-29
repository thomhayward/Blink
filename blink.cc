
// Define an architecture to appease vscode
#ifndef __AVR_ARCH__
#define __AVR_ATmega328P__
#endif

#ifndef F_CPU
#define F_CPU 16000000UL
#endif
 
#include <avr/io.h>
#include <util/delay.h>
 
int main() {
    DDRB |= (1 << PB5);          // configure PB5 as output
    while (true) {
        PORTB ^= (1 << PB5);     // flip state on PB5
        _delay_ms(250);          // wait 250 milliseconds
    }
}
