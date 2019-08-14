	.file	"sum.c"
	.text
	.align	2
	.p2align 3,,7
	.global	sum
	.arch armv8-a+fp+simd
	//.tune generic
	.type	sum, %function
sum:
	ldr	w0, [sp]
	add	w0, w7, w0
	ret
	.size	sum, .-sum
	.ident	"GCC: (Ubuntu/Linaro 5.3.1-14ubuntu2) 5.3.1 20160413"
	.section	.note.GNU-stack,"",@progbits
