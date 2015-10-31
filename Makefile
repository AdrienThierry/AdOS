hello : hello.o 
	ld --oformat binary -Ttext 7c00 -Tdata 7c00 -o hello hello.o 
hello.o : hello.s 
	as -o hello.o hello.s 

all: hello
 
clean : 
	rm -fv hello.o 