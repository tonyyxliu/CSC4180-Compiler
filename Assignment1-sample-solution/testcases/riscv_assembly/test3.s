	.text
	.file	"test3.ll"
	.globl	main                    # -- Begin function main
	.p2align	2
	.type	main,@function
main:                                   # @main
# %bb.0:
	addi	sp, sp, -64
	sd	ra, 56(sp)
	sd	s0, 48(sp)
	sd	s1, 40(sp)
	sd	s2, 32(sp)
	addi	s0, zero, 37
	sb	s0, 18(sp)
	addi	s1, zero, 100
	sb	s1, 19(sp)
	addi	s2, zero, 32
	sb	s2, 20(sp)
	sb	s0, 21(sp)
	sb	s1, 22(sp)
	sb	zero, 23(sp)
	addi	a0, sp, 18
	addi	a1, sp, 28
	addi	a2, sp, 24
	call	scanf
	lw	a0, 28(sp)
	lw	a1, 24(sp)
	subw	a0, a0, a1
	addi	a1, a0, 3
	sw	a1, 28(sp)
	addi	a2, a0, 4
	sw	a2, 24(sp)
	sb	s0, 8(sp)
	sb	s1, 9(sp)
	sb	s2, 10(sp)
	sb	s0, 11(sp)
	sb	s1, 12(sp)
	sb	s2, 13(sp)
	sb	s0, 14(sp)
	sb	s1, 15(sp)
	addi	a0, zero, 10
	sb	a0, 16(sp)
	sb	zero, 17(sp)
	slli	a0, a1, 1
	addw	a3, a0, a2
	addi	a0, sp, 8
	call	printf
	mv	a0, zero
	ld	s2, 32(sp)
	ld	s1, 40(sp)
	ld	s0, 48(sp)
	ld	ra, 56(sp)
	addi	sp, sp, 64
	ret
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
