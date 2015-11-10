stage1 : stage1.o
	ld --oformat binary -Ttext 0 -o stage1 stage1.o
stage1.o : stage1.s
	as -o stage1.o stage1.s

stage2 : stage2.o
	ld --oformat binary -Ttext 0 -o stage2 stage2.o
stage2.o : stage2.s
	as -o stage2.o stage2.s

all: stage1 stage2
 
clean : 
	rm -fv stage1.o stage2.o
