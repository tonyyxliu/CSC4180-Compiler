	.text
	.file	"test9.ll"
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
	sb	s0, 33(sp)
	addi	s1, zero, 100
	sb	s1, 34(sp)
	sb	zero, 35(sp)
	addi	a0, sp, 33
	addi	a1, sp, 36
	call	scanf
	sb	s0, 8(sp)
	sb	s1, 9(sp)
	addi	a0, zero, 32
	sb	a0, 10(sp)
	sb	s0, 11(sp)
	sb	s1, 12(sp)
	sb	a0, 13(sp)
	sb	s0, 14(sp)
	sb	s1, 15(sp)
	sb	a0, 16(sp)
	sb	s0, 17(sp)
	sb	s1, 18(sp)
	sb	a0, 19(sp)
	sb	s0, 20(sp)
	sb	s1, 21(sp)
	sb	a0, 22(sp)
	sb	s0, 23(sp)
	sb	s1, 24(sp)
	sb	a0, 25(sp)
	sb	s0, 26(sp)
	sb	s1, 27(sp)
	sb	a0, 28(sp)
	sb	s0, 29(sp)
	sb	s1, 30(sp)
	addi	a0, zero, 10
	lw	a1, 36(sp)
	sb	a0, 31(sp)
	sb	zero, 32(sp)
	addi	a0, zero, 1
	subw	a4, a0, a1
	slli	a0, a0, 32
	addi	a5, a0, -19
	addi	a0, sp, 8
	addi	a1, zero, 3
	addi	a2, zero, 20
	addi	a3, zero, 1
	addi	a6, zero, 255
	sd	zero, 0(sp)
	mv	a7, zero
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
