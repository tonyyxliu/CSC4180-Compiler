	.text
	.file	"test7.ll"
	.globl	main                    # -- Begin function main
	.p2align	2
	.type	main,@function
main:                                   # @main
# %bb.0:
	addi	sp, sp, -64
	sd	ra, 56(sp)
	sd	s0, 48(sp)
	sd	s1, 40(sp)
	addi	s0, zero, 37
	sb	s0, 19(sp)
	addi	s1, zero, 100
	sb	s1, 20(sp)
	addi	a0, zero, 32
	sb	a0, 21(sp)
	sb	s0, 22(sp)
	sb	s1, 23(sp)
	sb	a0, 24(sp)
	sb	s0, 25(sp)
	sb	s1, 26(sp)
	sb	zero, 27(sp)
	addi	a0, sp, 19
	addi	a1, sp, 36
	addi	a2, sp, 32
	addi	a3, sp, 28
	call	scanf
	lw	a0, 36(sp)
	lw	a1, 28(sp)
	lw	a2, 32(sp)
	sub	a0, a0, a1
	addw	a0, a0, a2
	addi	a1, a0, 5
	sb	s0, 15(sp)
	sb	s1, 16(sp)
	addi	a0, zero, 10
	sb	a0, 17(sp)
	sb	zero, 18(sp)
	addi	a0, sp, 15
	call	printf
	mv	a0, zero
	ld	s1, 40(sp)
	ld	s0, 48(sp)
	ld	ra, 56(sp)
	addi	sp, sp, 64
	ret
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
