		.code16
		.data
		.text
		.global _start

_start :

		mov %cs, %ax		# ax = 0x07c0
		mov %ax, %ds		# ds = 0x07c0
		mov %ax, %es		# es = 0x07c0
		mov %ax, %ss		# ss = 0x07c0
		mov $0x100, %sp		# 256 words in stack (512 bytes)

		mov $0x3f,%bl	# Background and text color
		mov $0,%dh		# Column 0
		mov $0,%dl		# Line 0
		mov $0x1301,%ax	# Function to print a string
		mov $msg,%bp	# Message address
		mov $13,%cx		# Message size 
		int $0x10		# Interrupt

msg:
		.asciz "Hello World !"
		.org 510

signature:

		.word 0xaa55	# Make floppy bootable
