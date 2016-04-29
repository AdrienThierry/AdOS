.code16

.global printk16

printk16:
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
