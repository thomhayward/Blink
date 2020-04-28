
PROJECT = blink
ARCH = atmega328p

AVRDUDE_PORT = /dev/cu.usbmodem14101

CMMCU = -mmcu=$(ARCH)
CSTANDARD = -std=gnu99
CEXTRA = -Os -Wall -fno-exceptions -ffunction-sections -fdata-sections
ALL_CFLAGS = $(CSTANDARD) $(CEXTRA) $(CMMCU)

CC = avr-gcc
OBJCOPY = avr-objcopy

%.o: %.c
	$(CC) -c $(ALL_CFLAGS) -o $@ $<

%.elf: %.o
	$(CC) $(ALL_CFLAGS) -o $@ $<

%.hex: %.elf
	$(OBJCOPY) -j .text -j .data -O ihex $< $@

build: $(PROJECT).hex
	#

upload: $(PROJECT).hex
	avrdude -p $(ARCH) -c arduino -P $(AVRDUDE_PORT) -D -U $<

clean:
	rm $(PROJECT).hex
