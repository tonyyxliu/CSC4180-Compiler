	.text
	.file	"test8.ll"
	.globl	main                    # -- Begin function main
	.p2align	2
	.type	main,@function
main:                                   # @main
# %bb.0:
	addi	sp, sp, -80
	sd	ra, 72(sp)
	sd	s0, 64(sp)
	sd	s1, 56(sp)
	sd	s2, 48(sp)
	addi	s0, zero, 37
	sb	s0, 27(sp)
	addi	s1, zero, 100
	sb	s1, 28(sp)
	addi	s2, zero, 32
	sb	s2, 29(sp)
	sb	s0, 30(sp)
	sb	s1, 31(sp)
	sb	s2, 32(sp)
	sb	s0, 33(sp)
	sb	s1, 34(sp)
	sb	zero, 35(sp)
	addi	a0, sp, 27
	addi	a1, sp, 44
	addi	a2, sp, 40
	addi	a3, sp, 36
	call	scanf
	lw	a0, 44(sp)
	lw	a2, 40(sp)
	lw	a3, 36(sp)
	add	a4, a2, a0
	addw	a0, a2, a0
	addi	a0, a0, 5
	subw	a1, a0, a3
	sub	a5, a0, a3
	not	a2, a2
	sub	a2, a2, a3
	addw	a2, a2, a5
	addi	a2, a2, 100
	addw	a3, a0, a2
	add	a0, a0, a2
	subw	a4, a0, a4
	addi	a5, a4, -1
	sb	s0, 8(sp)
	sb	s1, 9(sp)
	sb	s2, 10(sp)
	sb	s0, 11(sp)
	sb	s1, 12(sp)
	sb	s2, 13(sp)
	sb	s0, 14(sp)
	sb	s1, 15(sp)
	sb	s2, 16(sp)
	sb	s0, 17(sp)
	sb	s1, 18(sp)
	sb	s2, 19(sp)
	sb	s0, 20(sp)
	sb	s1, 21(sp)
	sb	s2, 22(sp)
	sb	s0, 23(sp)
	sb	s1, 24(sp)
	addi	a0, zero, 10
	sb	a0, 25(sp)
	sb	zero, 26(sp)
	addi	a0, sp, 8
	mv	a6, a4
	call	printf
	mv	a0, zero
	ld	s2, 48(sp)
	ld	s1, 56(sp)
	ld	s0, 64(sp)
	ld	ra, 72(sp)
	addi	sp, sp, 80
	ret
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
