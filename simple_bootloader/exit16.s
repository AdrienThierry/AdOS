.code16

.global exit16

exit16 :
	# Restore all registers
	push %ss
	push %es
	push %ds
	push %cs
	push %di
	push %si
	push %bp
	push %dx
	push %cx
	push %bx
	push %ax
	ret
