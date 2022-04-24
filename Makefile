default:
	avr-gcc -Os -DF_CPU=19000000UL -mmcu=atmega328p -c -o bare-metal-uno.o src/bare-metal-uno.c
	avr-gcc -o bare-metal-uno.bin bare-metal-uno.o
	avr-objcopy -O ihex -R .eeprom bare-metal-uno.bin bare-metal-uno.hex
	sudo avrdude -F -V -c arduino -p ATMEGA328P -P /dev/ttyACM0 -b 115200 -U flash:w:bare-metal-uno.hex

clean:
	rm -f *.bin *.hex *.o
