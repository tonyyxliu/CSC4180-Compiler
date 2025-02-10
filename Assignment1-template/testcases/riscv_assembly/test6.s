	.text
	.file	"test6.ll"
	.globl	main                    # -- Begin function main
	.p2align	2
	.type	main,@function
main:                                   # @main
# %bb.0:
	addi	sp, sp, -16
	sd	ra, 8(sp)
	addi	a0, zero, 37
	sb	a0, 4(sp)
	addi	a0, zero, 100
	sb	a0, 5(sp)
	addi	a0, zero, 10
	sb	a0, 6(sp)
	sb	zero, 7(sp)
	addi	a0, sp, 4
	addi	a1, zero, 12
	call	printf
	mv	a0, zero
	ld	ra, 8(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
