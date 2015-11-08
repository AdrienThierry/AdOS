		.code16

		.global _start

_start :
		mov $0x1000, %ax	# ax = 0x1000
		mov %ax, %ds		# ds = 0x1000
		mov %ax, %es		# es = 0x1000
		mov %ax, %ss		# ss = 0x1000
		mov $0x100, %sp		# 256 words in stack (512 bytes)

		# --------------------------------------------------
		# print call
		# --------------------------------------------------
		push $0x0007		# Page 0 + background and text color
		push $0x02			# Line number
		push $21			# Message size
		push $msg			# Message address

		call print

		add $8, %sp			# Delete function parameters on stack

		# --------------------------------------------------
		jmp idle

print :
		push %bp
		mov %sp, %bp

		# Save registers
		push %bx
		push %si
		push %di
		push %bp

		mov $0,%dl			# Column 0
		mov $0x1301,%ax		# Function to print a string
		mov 6(%bp), %cx		# Message size
		mov 8(%bp), %dh		# Line number
		mov 10(%bp), %bx	# Page + background and text color
		mov 4(%bp), %bp		# Message address

		int $0x10			# Interrupt

		# Restore registers
		pop %bp
		pop %di
		pop %si
		pop %bx

		mov %bp, %sp

		pop %bp

		ret
		
idle :
		hlt
		jmp idle

msg :
		.asciz "Boot complete ! Wow !"
