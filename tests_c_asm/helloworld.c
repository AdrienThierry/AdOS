extern void printk16(char* message, int size, char row, int attributes);

void helloworld() {
	char hello[6] = "Hello";

	printk16(hello, 5, 5, 0x0007);

}
