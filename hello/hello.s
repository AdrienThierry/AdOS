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

		mov $0x01, %bl		# Background and text color
		mov $0x00, %dl		# Line number

		push $msg			# Message address
		push $13			# Message size

		mov loop_count, %cx
		jmp print

print :
		mov %sp, %bp		# Copy sp in bp

		push %cx			# Save loop counter

		mov $0,%dl			# Column 0
		mov $0x1301,%ax		# Function to print a string
		mov 0(%bp), %cx		# Message size
		mov 2(%bp), %bp		# Message address
		int $0x10			# Interrupt

		incb %bl			# Change color
		incb %dh			# Change line

		pop %cx				# Restore loop counter

		loop print			# Loop
		
idle :
		hlt
		jmp idle

loop_count:
		.word 10			# Number of iterations

msg:
		.asciz "Hello World !"

signature:
		.org 510
		.word 0xaa55		# Make floppy bootable
