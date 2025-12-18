CC=avr-gcc
PORT ?= COM6
TARGET=attiny85
ISP=stk500v1
CONF=C:\Users\joshu\AppData\Local\Arduino15\packages\arduino\tools\avrdude\6.3.0-arduino17/etc/avrdude.conf
BAUD=19200
SOURCES=src/mySPI.c src/synth.c src/theory.C src/main.c

IDIR = include
CFLAGS = -I$(IDIR) -Os -mmcu=attiny85 #-DF_CPU=16000000LU
ODIR = build

flash: main.hex
	@echo Flashing to port $(PORT)
	avrdude -v -C$(CONF) -c$(ISP) -p$(TARGET) -P$(PORT) -b$(BAUD) -U flash:w:'main.hex':a 

main.hex: main.elf
	avr-objcopy -O ihex main.elf main.hex

main.elf: include/*.h src/*.c  makefile
	$(CC) $(CFLAGS) $(SOURCES) -o main.elf 
