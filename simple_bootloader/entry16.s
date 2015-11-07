.code16

.global entry16

entry16 :
	# Save all registers (real-mode) on stack
	push %ax
	push %bx
	push %cx
	push %dx
	push %bp
	push %si
	push %di
	push %cs
	push %ds
	push %es
	push %ss
	ret
