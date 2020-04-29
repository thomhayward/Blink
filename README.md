# Blink
Dumb project to demonstrate compilation and upload to an Arduino board without depending on Arduino IDE.

## Prerequisites
- avr-gcc
- avrdude

### Install prerequisites on macOS (with Homebrew)
```
➜ brew tap osx-cross/avr
➜ brew install avr-gcc avrdude
```

## Usage
```
➜ make upload
```

Define ```PORT``` to specify the serial port for avrdude to use. On macOS, the first ```/dev/cu.usbmodem``` device should be selected automatically.
