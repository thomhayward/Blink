
PROJECT = blink

MCU ?= atmega328p
PORT ?= $(firstword $(wildcard /dev/cu.usbmodem*))

CXX = avr-g++
CXXSTANDARD = -std=gnu++11
CXXEXTRA = -Os -Wall -fno-exceptions -ffunction-sections -fdata-sections
CXXFLAGS = $(CXXSTANDARD) $(CXXEXTRA) -mmcu=$(MCU)

OBJCOPY = avr-objcopy

%.elf: $(wildcard *.cc)
	$(CXX) $(CXXFLAGS) -o $@ $^

%.hex: %.elf
	$(OBJCOPY) -j .text -j .data -O ihex $< $@

.PHONY: build
build: $(PROJECT).hex
	#

.PHONY: upload
upload: $(PROJECT).hex
	avrdude -p $(MCU) -c arduino -P $(PORT) -D -U $<

.PHONY: clean
clean:
	rm $(PROJECT).hex
