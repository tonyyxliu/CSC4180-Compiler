	.text
	.file	"test5.ll"
	.globl	main                    # -- Begin function main
	.p2align	2
	.type	main,@function
main:                                   # @main
# %bb.0:
	addi	sp, sp, -48
	sd	ra, 40(sp)
	sd	s0, 32(sp)
	sd	s1, 24(sp)
	addi	s0, zero, 37
	sb	s0, 17(sp)
	addi	s1, zero, 100
	sb	s1, 18(sp)
	sb	zero, 19(sp)
	addi	a0, sp, 17
	addi	a1, sp, 20
	call	scanf
	lw	a0, 20(sp)
	sb	s0, 13(sp)
	sb	s1, 14(sp)
	addi	a1, zero, 10
	sb	a1, 15(sp)
	sb	zero, 16(sp)
	addi	a1, zero, 10
	call	__muldi3
	addi	a1, a0, 45
	addi	a0, sp, 13
	call	printf
	mv	a0, zero
	ld	s1, 24(sp)
	ld	s0, 32(sp)
	ld	ra, 40(sp)
	addi	sp, sp, 48
	ret
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
