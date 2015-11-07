		.code16

		.global _start

_start :

		# The BIOS initializes IP with 0x7c00 and CS with 0x0. We have to initialize ds, es, and ss with 0x7c00
		mov $0x7c0, %ax		# ax = 0x07c0
		mov %ax, %ds		# ds = 0x07c0
		mov %ax, %es		# es = 0x07c0
		mov %ax, %ss		# ss = 0x07c0

		mov $0x100, %sp		# 256 words in stack (512 bytes)
		
clear_screen :
		mov $0x0012, %ax	# 640 * 480
		int $0x10

print :
		mov $0x0007, %bx	# Page 00 + Background and text color
		mov $0, %dh			# Row 0
		mov $0, %dl			# Column 0
		mov $0x1301, %ax	# Function to print a string
		mov $19, %cx		# Message address
		mov $boot_msg, %bp	# Message size

		int $0x10			# Interrupt
	
load_kernel :
		mov $0x0264, %ax	# Load 64 sectors of floppy into memory
		movb $0x00, %ch		# First cylinder
		movb $0x02, %cl		# Sector 2
		mov $0, %dx			# First drive, first head
		mov $0x1000, %bx	# Segment to load kernel in
		mov %bx, %es
		mov $0, %bx			# Offset to load kernel in
		int $0x13			# Interrupt

		ljmp $0x1000, $0x0000 	# Jump to kernel

boot_msg:
		.asciz "Wow such booting..."

signature:
		.org 510
		.word 0xaa55		# Make floppy bootable
