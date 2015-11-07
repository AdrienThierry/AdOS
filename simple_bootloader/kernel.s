		.code16

		.global _start

_start :
		mov $0x1000, %ax	# ax = 0x1000
		mov %ax, %ds		# ds = 0x1000
		mov %ax, %es		# es = 0x1000
		mov %ax, %ss		# ss = 0x1000
		mov $0x100, %sp		# 256 words in stack (512 bytes)

		mov $0x0007, %bx	# Background and text color
		mov $0x02, %dh		# Line number
		push $msg			# Message address
		push $21			# Message size

		call print

		jmp idle

print :
		mov %sp, %bp		# Copy sp in bp

		mov $0,%dl			# Column 0
		mov $0x1301,%ax		# Function to print a string
		mov 2(%bp), %cx		# Message size
		mov 4(%bp), %bp		# Message address

		int $0x10			# Interrupt

		ret
		
idle :
		hlt
		jmp idle

msg :
		.asciz "Kernel booted ! Wow !"
