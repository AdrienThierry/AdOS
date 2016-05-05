#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

extern uint64_t asm_func();

void main() {
	printf("%ld\n", asm_func());
}
