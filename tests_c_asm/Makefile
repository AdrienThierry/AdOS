stage1 : stage1.o
	ld --oformat binary -Ttext 0 -o stage1 stage1.o
stage1.o : stage1.s
	as -o stage1.o stage1.s




kernel : helloworld.c printk16.s stage2.s
	i686-elf-gcc -T linker.ld -o kernel -ffreestanding -nostdlib helloworld.c printk16.s stage2.s -lgcc




all: stage1 kernel
 
clean : 
	rm -fv stage1.o
