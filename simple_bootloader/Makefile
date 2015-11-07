simple_bootloader : simple_bootloader.o
	ld --oformat binary -Ttext 0 -o simple_bootloader simple_bootloader.o
simple_bootloader.o : simple_bootloader.s
	as -o simple_bootloader.o simple_bootloader.s

kernel : kernel.o
	ld --oformat binary -Ttext 0 -o kernel kernel.o
kernel.o : kernel.s
	as -o kernel.o kernel.s

all: kernel simple_bootloader
 
clean : 
	rm -fv simple_bootloader.o kernel.o
