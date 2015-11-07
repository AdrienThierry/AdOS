entry16.o : entry16.s
	as -o entry16.o	entry16.s
exit16.o : exit16.s
	as -o exit16.o	exit16.s

simple_bootloader : simple_bootloader.o
	ld --oformat binary -Ttext 0 -o simple_bootloader simple_bootloader.o
simple_bootloader.o : simple_bootloader.s
	as -o simple_bootloader.o simple_bootloader.s

kernel : kernel.o entry16.o exit16.o
	ld --oformat binary -Ttext 0 -o kernel kernel.o entry16.o exit16.o
kernel.o : kernel.s
	as -o kernel.o kernel.s

all: kernel simple_bootloader
 
clean : 
	rm -fv simple_bootloader.o kernel.o entry16.o exit16.o
