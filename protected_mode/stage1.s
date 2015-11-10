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
		mov $0x0003, %ax	# 80*25 (video mode 3)
		int $0x10

print :
		mov $0x0007, %bx	# Page 00 + Background and text color
		mov $0, %dh			# Row 0
		mov $0, %dl			# Column 0
		mov $0x1301, %ax	# Function to print a string
		mov $19, %cx		# Message size
		mov $boot_msg, %bp	# Message address

		int $0x10			# Interrupt
	
load_stage2 :
		mov $0x0264, %ax	# Load 64 sectors of floppy into memory
		movb $0x00, %ch		# First cylinder
		movb $0x02, %cl		# Sector 2
		mov $0, %dx			# First drive, first head
		mov $0x1000, %bx	# Segment to load stage2 in
		mov %bx, %es
		mov $0, %bx			# Offset to load stage2 in
		int $0x13			# Interrupt

		mov $0x7c0, %ax
		mov %ax, %es
		
		jc error			# If read error
		ljmp $0x1000, $0x0000 	# Else Jump to stage2

error :
		mov $0x0004, %bx	# Page 00 + Background and text color
		mov $2, %dh			# Row 2
		mov $0, %dl			# Column 0
		mov $0x1301, %ax	# Function to print a string
		mov $21, %cx		# Message size
		mov $error_msg, %bp	# Message address

		int $0x10			# Interrupt

		jmp idle

idle :
		hlt
		jmp idle

boot_msg:
		.asciz "Wow such booting..."

error_msg:
		.asciz "Stage2 loading failed"

signature:
		.org 510
		.word 0xaa55		# Make floppy bootable
