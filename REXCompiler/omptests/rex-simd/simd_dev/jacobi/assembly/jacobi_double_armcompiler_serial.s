	.text
	.file	"jacobi_double.c"
	.globl	jacobi_seq                      // -- Begin function jacobi_seq
	.p2align	5
	.type	jacobi_seq,@function
jacobi_seq:                             // @jacobi_seq
	.cfi_startproc
// %bb.0:
	stp	x29, x30, [sp, #-32]!           // 16-byte Folded Spill
	str	x19, [sp, #16]                  // 8-byte Folded Spill
	mov	x29, sp
	sub	sp, sp, #160                    // =160
	.cfi_def_cfa w29, 32
	.cfi_offset w19, -16
	.cfi_offset w30, -24
	.cfi_offset w29, -32
	stur	w0, [x29, #-4]
	stur	w1, [x29, #-8]
	stur	s0, [x29, #-12]
	stur	s1, [x29, #-16]
	stur	s2, [x29, #-20]
	stur	s3, [x29, #-24]
	stur	x2, [x29, #-32]
	stur	x3, [x29, #-40]
	stur	s4, [x29, #-44]
	stur	w4, [x29, #-48]
	ldur	w8, [x29, #-4]
	mov	w9, w8
	ldur	w8, [x29, #-8]
	mov	w10, w8
	mov	x11, sp
	stur	x11, [x29, #-88]
	mul	x11, x9, x10
	lsl	x11, x11, #2
	add	x11, x11, #15                   // =15
	and	x11, x11, #0xfffffffffffffff0
	mov	x12, sp
	subs	x11, x12, x11
	mov	sp, x11
	stur	x9, [x29, #-96]
	stur	x10, [x29, #-104]
	ldur	w8, [x29, #-8]
	mov	w9, w8
	ldur	x12, [x29, #-32]
	stur	x12, [x29, #-112]
	ldur	w8, [x29, #-8]
	mov	w12, w8
	ldur	x13, [x29, #-40]
	stur	x13, [x29, #-120]
	ldur	s0, [x29, #-12]
	fmul	s0, s0, s0
	fcvt	d5, s0
	fmov	d6, #1.00000000
	fdiv	d5, d6, d5
	fcvt	s0, d5
	stur	s0, [x29, #-68]
	ldur	s0, [x29, #-16]
	fmul	s0, s0, s0
	fcvt	d5, s0
	fdiv	d5, d6, d5
	fcvt	s0, d5
	stur	s0, [x29, #-72]
	ldur	s0, [x29, #-12]
	fmul	s0, s0, s0
	fcvt	d5, s0
	fmov	d6, #-2.00000000
	fdiv	d5, d6, d5
	ldur	s0, [x29, #-16]
	fmul	s0, s0, s0
	fcvt	d7, s0
	fdiv	d6, d6, d7
	fadd	d5, d5, d6
	ldur	s0, [x29, #-20]
	fcvt	d6, s0
	fsub	d5, d5, d6
	fcvt	s0, d5
	stur	s0, [x29, #-76]
	ldur	s0, [x29, #-44]
	fcvt	d5, s0
	fmov	d6, #10.00000000
	fmul	d5, d5, d6
	fcvt	s0, d5
	stur	s0, [x29, #-64]
	mov	w8, #1
	stur	w8, [x29, #-60]
	stur	x10, [x29, #-128]               // 8-byte Folded Spill
	stur	x11, [x29, #-136]               // 8-byte Folded Spill
	stur	x9, [x29, #-144]                // 8-byte Folded Spill
	stur	x12, [x29, #-152]               // 8-byte Folded Spill
	b	.LBB0_1
.LBB0_1:                                // =>This Loop Header: Depth=1
                                        //     Child Loop BB0_5 Depth 2
                                        //       Child Loop BB0_7 Depth 3
                                        //     Child Loop BB0_13 Depth 2
                                        //       Child Loop BB0_15 Depth 3
	ldur	w8, [x29, #-60]
	ldur	w9, [x29, #-48]
	mov	w0, wzr
	subs	w8, w8, w9
	stur	w0, [x29, #-156]                // 4-byte Folded Spill
	b.gt	.LBB0_3
	b	.LBB0_2
.LBB0_2:                                //   in Loop: Header=BB0_1 Depth=1
	ldur	s0, [x29, #-64]
	ldur	s1, [x29, #-44]
	fcmp	s0, s1
	cset	w8, gt
	stur	w8, [x29, #-156]                // 4-byte Folded Spill
	b	.LBB0_3
.LBB0_3:                                //   in Loop: Header=BB0_1 Depth=1
	ldur	w8, [x29, #-156]                // 4-byte Folded Reload
	tbz	w8, #0, .LBB0_21
	b	.LBB0_4
.LBB0_4:                                //   in Loop: Header=BB0_1 Depth=1
	mov	w8, wzr
	stur	w8, [x29, #-64]
	stur	w8, [x29, #-52]
	b	.LBB0_5
.LBB0_5:                                //   Parent Loop BB0_1 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB0_7 Depth 3
	ldur	w8, [x29, #-52]
	ldur	w9, [x29, #-4]
	subs	w8, w8, w9
	b.ge	.LBB0_12
	b	.LBB0_6
.LBB0_6:                                //   in Loop: Header=BB0_5 Depth=2
	mov	w8, wzr
	stur	w8, [x29, #-56]
	b	.LBB0_7
.LBB0_7:                                //   Parent Loop BB0_1 Depth=1
                                        //     Parent Loop BB0_5 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	ldur	w8, [x29, #-56]
	ldur	w9, [x29, #-8]
	subs	w8, w8, w9
	b.ge	.LBB0_10
	b	.LBB0_8
.LBB0_8:                                //   in Loop: Header=BB0_7 Depth=3
	ldur	x8, [x29, #-112]
	ldursw	x9, [x29, #-52]
	ldur	x10, [x29, #-144]               // 8-byte Folded Reload
	mul	x11, x9, x10
	add	x8, x8, x11, lsl #2
	ldursw	x11, [x29, #-56]
	lsl	x11, x11, #2
	ldr	s0, [x8, x11]
	ldur	x8, [x29, #-128]                // 8-byte Folded Reload
	mul	x9, x9, x8
	ldur	x12, [x29, #-136]               // 8-byte Folded Reload
	add	x9, x12, x9, lsl #2
	str	s0, [x9, x11]
	b	.LBB0_9
.LBB0_9:                                //   in Loop: Header=BB0_7 Depth=3
	ldur	w8, [x29, #-56]
	add	w8, w8, #1                      // =1
	stur	w8, [x29, #-56]
	b	.LBB0_7
.LBB0_10:                               //   in Loop: Header=BB0_5 Depth=2
	b	.LBB0_11
.LBB0_11:                               //   in Loop: Header=BB0_5 Depth=2
	ldur	w8, [x29, #-52]
	add	w8, w8, #1                      // =1
	stur	w8, [x29, #-52]
	b	.LBB0_5
.LBB0_12:                               //   in Loop: Header=BB0_1 Depth=1
	mov	w8, #1
	stur	w8, [x29, #-52]
	b	.LBB0_13
.LBB0_13:                               //   Parent Loop BB0_1 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB0_15 Depth 3
	ldur	w8, [x29, #-52]
	ldur	w9, [x29, #-4]
	subs	w9, w9, #1                      // =1
	subs	w8, w8, w9
	b.ge	.LBB0_20
	b	.LBB0_14
.LBB0_14:                               //   in Loop: Header=BB0_13 Depth=2
	mov	w8, #1
	stur	w8, [x29, #-56]
	b	.LBB0_15
.LBB0_15:                               //   Parent Loop BB0_1 Depth=1
                                        //     Parent Loop BB0_13 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	ldur	w8, [x29, #-56]
	ldur	w9, [x29, #-8]
	subs	w9, w9, #1                      // =1
	subs	w8, w8, w9
	b.ge	.LBB0_18
	b	.LBB0_16
.LBB0_16:                               //   in Loop: Header=BB0_15 Depth=3
	ldur	s0, [x29, #-68]
	ldursw	x8, [x29, #-52]
	mov	w9, w8
	subs	w10, w9, #1                     // =1
                                        // implicit-def: $x0
	mov	w0, w10
	sxtw	x11, w0
	ldur	x12, [x29, #-128]               // 8-byte Folded Reload
	mul	x11, x11, x12
	ldur	x13, [x29, #-136]               // 8-byte Folded Reload
	add	x11, x13, x11, lsl #2
	ldursw	x14, [x29, #-56]
	mov	w10, w14
	lsl	x14, x14, #2
	ldr	s1, [x11, x14]
	add	w9, w9, #1                      // =1
                                        // implicit-def: $x0
	mov	w0, w9
	sxtw	x11, w0
	mul	x11, x11, x12
	add	x11, x13, x11, lsl #2
	ldr	s2, [x11, x14]
	fadd	s1, s1, s2
	fmul	s0, s0, s1
	ldur	s1, [x29, #-72]
	mul	x11, x8, x12
	add	x11, x13, x11, lsl #2
	subs	w9, w10, #1                     // =1
	ldr	s2, [x11, w9, sxtw #2]
	add	w9, w10, #1                     // =1
	ldr	s3, [x11, w9, sxtw #2]
	fadd	s2, s2, s3
	fmul	s1, s1, s2
	fadd	s0, s0, s1
	ldur	s1, [x29, #-76]
	ldr	s2, [x11, x14]
	fmul	s2, s1, s2
	fadd	s0, s0, s2
	ldur	x11, [x29, #-120]
	ldur	x15, [x29, #-152]               // 8-byte Folded Reload
	mul	x8, x8, x15
	add	x8, x11, x8, lsl #2
	ldr	s2, [x8, x14]
	fsub	s0, s0, s2
	fdiv	s0, s0, s1
	stur	s0, [x29, #-80]
	ldursw	x8, [x29, #-52]
	mul	x11, x8, x12
	add	x11, x13, x11, lsl #2
	ldursw	x14, [x29, #-56]
	lsl	x14, x14, #2
	ldr	s0, [x11, x14]
	ldur	s1, [x29, #-24]
	ldur	s2, [x29, #-80]
	fmul	s1, s1, s2
	fsub	s0, s0, s1
	ldur	x11, [x29, #-112]
	ldur	x16, [x29, #-144]               // 8-byte Folded Reload
	mul	x8, x8, x16
	add	x8, x11, x8, lsl #2
	str	s0, [x8, x14]
	ldur	s0, [x29, #-64]
	ldur	s1, [x29, #-80]
	fmul	s1, s1, s1
	fadd	s0, s0, s1
	stur	s0, [x29, #-64]
	b	.LBB0_17
.LBB0_17:                               //   in Loop: Header=BB0_15 Depth=3
	ldur	w8, [x29, #-56]
	add	w8, w8, #1                      // =1
	stur	w8, [x29, #-56]
	b	.LBB0_15
.LBB0_18:                               //   in Loop: Header=BB0_13 Depth=2
	b	.LBB0_19
.LBB0_19:                               //   in Loop: Header=BB0_13 Depth=2
	ldur	w8, [x29, #-52]
	add	w8, w8, #1                      // =1
	stur	w8, [x29, #-52]
	b	.LBB0_13
.LBB0_20:                               //   in Loop: Header=BB0_1 Depth=1
	ldur	s0, [x29, #-64]
	fcvt	d0, s0
	bl	sqrt
	ldur	w8, [x29, #-4]
	ldur	w9, [x29, #-8]
	mul	w8, w8, w9
	scvtf	d1, w8
	fdiv	d0, d0, d1
	fcvt	s2, d0
	stur	s2, [x29, #-64]
	ldur	w8, [x29, #-60]
	add	w8, w8, #1                      // =1
	stur	w8, [x29, #-60]
	b	.LBB0_1
.LBB0_21:
	ldur	w1, [x29, #-60]
	adrp	x0, .L.str
	add	x0, x0, :lo12:.L.str
	bl	printf
	ldur	s0, [x29, #-64]
	fcvt	d0, s0
	adrp	x8, .L.str.1
	add	x8, x8, :lo12:.L.str.1
	stur	w0, [x29, #-160]                // 4-byte Folded Spill
	mov	x0, x8
	bl	printf
	ldur	x8, [x29, #-88]
	mov	sp, x8
	mov	sp, x29
	ldr	x19, [sp, #16]                  // 8-byte Folded Reload
	ldp	x29, x30, [sp], #32             // 16-byte Folded Reload
	ret
.Lfunc_end0:
	.size	jacobi_seq, .Lfunc_end0-jacobi_seq
	.cfi_endproc
                                        // -- End function
	.weak	___ZGVsMxv_sqrt_SVE_VFABI_WRAPPER // -- Begin function ___ZGVsMxv_sqrt_SVE_VFABI_WRAPPER
	.p2align	5
	.type	___ZGVsMxv_sqrt_SVE_VFABI_WRAPPER,@function
	.variant_pcs ___ZGVsMxv_sqrt_SVE_VFABI_WRAPPER
___ZGVsMxv_sqrt_SVE_VFABI_WRAPPER:      // @___ZGVsMxv_sqrt_SVE_VFABI_WRAPPER
	.cfi_startproc
// %bb.0:
	str	x30, [sp, #-16]!                // 8-byte Folded Spill
	.cfi_def_cfa_offset 16
	.cfi_offset w30, -16
	bl	_ZGVsMxv_sqrt
	ldr	x30, [sp], #16                  // 8-byte Folded Reload
	ret
.Lfunc_end1:
	.size	___ZGVsMxv_sqrt_SVE_VFABI_WRAPPER, .Lfunc_end1-___ZGVsMxv_sqrt_SVE_VFABI_WRAPPER
	.cfi_endproc
                                        // -- End function
	.globl	jacobi_omp                      // -- Begin function jacobi_omp
	.p2align	5
	.type	jacobi_omp,@function
jacobi_omp:                             // @jacobi_omp
	.cfi_startproc
// %bb.0:
	sub	sp, sp, #240                    // =240
	stp	x29, x30, [sp, #224]            // 16-byte Folded Spill
	add	x29, sp, #224                   // =224
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	sub	x8, x29, #32                    // =32
	stur	w0, [x29, #-4]
	stur	w1, [x29, #-8]
	stur	s0, [x29, #-12]
	stur	s1, [x29, #-16]
	stur	s2, [x29, #-20]
	stur	s3, [x29, #-24]
	str	x2, [x8]
	stur	x3, [x29, #-40]
	stur	s4, [x29, #-44]
	stur	w4, [x29, #-48]
	ldursw	x9, [x29, #-4]
	ldursw	x10, [x29, #-8]
	mul	x9, x9, x10
	lsl	x0, x9, #2
	str	x8, [sp, #48]                   // 8-byte Folded Spill
	bl	malloc
	stur	x0, [x29, #-88]
	ldur	w11, [x29, #-8]
	mov	w8, w11
	ldur	x9, [x29, #-88]
	stur	x9, [x29, #-96]
	ldur	w11, [x29, #-8]
	mov	w9, w11
	ldr	x10, [sp, #48]                  // 8-byte Folded Reload
	ldr	x12, [x10]
	stur	x12, [x29, #-104]
	ldur	w11, [x29, #-8]
	mov	w12, w11
	ldur	x13, [x29, #-40]
	str	x13, [sp, #112]
	ldur	s0, [x29, #-12]
	fmul	s0, s0, s0
	fcvt	d5, s0
	fmov	d6, #1.00000000
	fdiv	d5, d6, d5
	fcvt	s0, d5
	stur	s0, [x29, #-68]
	ldur	s0, [x29, #-16]
	fmul	s0, s0, s0
	fcvt	d5, s0
	fdiv	d5, d6, d5
	fcvt	s0, d5
	stur	s0, [x29, #-72]
	ldur	s0, [x29, #-12]
	fmul	s0, s0, s0
	fcvt	d5, s0
	fmov	d6, #-2.00000000
	fdiv	d5, d6, d5
	ldur	s0, [x29, #-16]
	fmul	s0, s0, s0
	fcvt	d7, s0
	fdiv	d6, d6, d7
	fadd	d5, d5, d6
	ldur	s0, [x29, #-20]
	fcvt	d6, s0
	fsub	d5, d5, d6
	fcvt	s0, d5
	stur	s0, [x29, #-76]
	ldur	s0, [x29, #-44]
	fcvt	d5, s0
	fmov	d6, #10.00000000
	fmul	d5, d5, d6
	fcvt	s0, d5
	stur	s0, [x29, #-64]
	mov	w11, #1
	stur	w11, [x29, #-60]
	str	x8, [sp, #40]                   // 8-byte Folded Spill
	str	x9, [sp, #32]                   // 8-byte Folded Spill
	str	x12, [sp, #24]                  // 8-byte Folded Spill
	b	.LBB2_1
.LBB2_1:                                // =>This Loop Header: Depth=1
                                        //     Child Loop BB2_5 Depth 2
                                        //       Child Loop BB2_8 Depth 3
                                        //     Child Loop BB2_16 Depth 2
                                        //       Child Loop BB2_19 Depth 3
	ldur	w8, [x29, #-60]
	ldur	w9, [x29, #-48]
	mov	w0, wzr
	subs	w8, w8, w9
	str	w0, [sp, #20]                   // 4-byte Folded Spill
	b.gt	.LBB2_3
	b	.LBB2_2
.LBB2_2:                                //   in Loop: Header=BB2_1 Depth=1
	ldur	s0, [x29, #-64]
	ldur	s1, [x29, #-44]
	fcmp	s0, s1
	cset	w8, gt
	str	w8, [sp, #20]                   // 4-byte Folded Spill
	b	.LBB2_3
.LBB2_3:                                //   in Loop: Header=BB2_1 Depth=1
	ldr	w8, [sp, #20]                   // 4-byte Folded Reload
	tbz	w8, #0, .LBB2_27
	b	.LBB2_4
.LBB2_4:                                //   in Loop: Header=BB2_1 Depth=1
	mov	w8, wzr
	stur	w8, [x29, #-64]
	stur	w8, [x29, #-52]
	b	.LBB2_5
.LBB2_5:                                //   Parent Loop BB2_1 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB2_8 Depth 3
	ldur	w8, [x29, #-52]
	ldur	w9, [x29, #-4]
	subs	w8, w8, w9
	b.ge	.LBB2_15
	b	.LBB2_6
.LBB2_6:                                //   in Loop: Header=BB2_5 Depth=2
	ldur	w8, [x29, #-8]
	str	w8, [sp, #104]
	ldr	w8, [sp, #104]
	subs	w8, w8, #1                      // =1
	str	w8, [sp, #100]
	mov	w8, wzr
	str	w8, [sp, #96]
	ldr	w8, [sp, #104]
	subs	w8, w8, #1                      // =1
	b.lt	.LBB2_13
	b	.LBB2_7
.LBB2_7:                                //   in Loop: Header=BB2_5 Depth=2
	mov	w8, wzr
	str	w8, [sp, #92]
	b	.LBB2_8
.LBB2_8:                                //   Parent Loop BB2_1 Depth=1
                                        //     Parent Loop BB2_5 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	ldr	w8, [sp, #92]
	ldr	w9, [sp, #100]
	add	w9, w9, #1                      // =1
	subs	w8, w8, w9
	b.ge	.LBB2_12
	b	.LBB2_9
.LBB2_9:                                //   in Loop: Header=BB2_8 Depth=3
	ldr	w8, [sp, #92]
	str	w8, [sp, #88]
	ldur	x9, [x29, #-104]
	ldursw	x10, [x29, #-52]
	ldr	x11, [sp, #32]                  // 8-byte Folded Reload
	mul	x12, x10, x11
	add	x9, x9, x12, lsl #2
	ldrsw	x12, [sp, #88]
	lsl	x12, x12, #2
	ldr	s0, [x9, x12]
	ldur	x9, [x29, #-96]
	ldr	x13, [sp, #40]                  // 8-byte Folded Reload
	mul	x10, x10, x13
	add	x9, x9, x10, lsl #2
	str	s0, [x9, x12]
	b	.LBB2_10
.LBB2_10:                               //   in Loop: Header=BB2_8 Depth=3
	b	.LBB2_11
.LBB2_11:                               //   in Loop: Header=BB2_8 Depth=3
	ldr	w8, [sp, #92]
	add	w8, w8, #1                      // =1
	str	w8, [sp, #92]
	b	.LBB2_8
.LBB2_12:                               //   in Loop: Header=BB2_5 Depth=2
	ldr	w8, [sp, #104]
	stur	w8, [x29, #-56]
	b	.LBB2_13
.LBB2_13:                               //   in Loop: Header=BB2_5 Depth=2
	b	.LBB2_14
.LBB2_14:                               //   in Loop: Header=BB2_5 Depth=2
	ldur	w8, [x29, #-52]
	add	w8, w8, #1                      // =1
	stur	w8, [x29, #-52]
	b	.LBB2_5
.LBB2_15:                               //   in Loop: Header=BB2_1 Depth=1
	mov	w8, #1
	stur	w8, [x29, #-52]
	b	.LBB2_16
.LBB2_16:                               //   Parent Loop BB2_1 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB2_19 Depth 3
	ldur	w8, [x29, #-52]
	ldur	w9, [x29, #-4]
	subs	w9, w9, #1                      // =1
	subs	w8, w8, w9
	b.ge	.LBB2_26
	b	.LBB2_17
.LBB2_17:                               //   in Loop: Header=BB2_16 Depth=2
	ldur	w8, [x29, #-8]
	subs	w8, w8, #1                      // =1
	str	w8, [sp, #80]
	ldr	w8, [sp, #80]
	subs	w8, w8, #2                      // =2
	str	w8, [sp, #76]
	mov	w8, #1
	str	w8, [sp, #72]
	ldr	w8, [sp, #80]
	subs	w8, w8, #2                      // =2
	b.lt	.LBB2_24
	b	.LBB2_18
.LBB2_18:                               //   in Loop: Header=BB2_16 Depth=2
	mov	w8, wzr
	str	w8, [sp, #68]
	str	w8, [sp, #60]
	b	.LBB2_19
.LBB2_19:                               //   Parent Loop BB2_1 Depth=1
                                        //     Parent Loop BB2_16 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	ldr	w8, [sp, #68]
	ldr	w9, [sp, #76]
	add	w9, w9, #1                      // =1
	subs	w8, w8, w9
	b.ge	.LBB2_23
	b	.LBB2_20
.LBB2_20:                               //   in Loop: Header=BB2_19 Depth=3
	ldr	w8, [sp, #68]
	add	w8, w8, #1                      // =1
	str	w8, [sp, #64]
	ldur	s0, [x29, #-68]
	ldur	x9, [x29, #-96]
	ldursw	x10, [x29, #-52]
	mov	w8, w10
	subs	w11, w8, #1                     // =1
                                        // implicit-def: $x0
	mov	w0, w11
	sxtw	x12, w0
	ldr	x13, [sp, #40]                  // 8-byte Folded Reload
	mul	x12, x12, x13
	add	x12, x9, x12, lsl #2
	ldrsw	x14, [sp, #64]
	mov	w11, w14
	lsl	x14, x14, #2
	ldr	s1, [x12, x14]
	add	w8, w8, #1                      // =1
                                        // implicit-def: $x0
	mov	w0, w8
	sxtw	x12, w0
	mul	x12, x12, x13
	add	x12, x9, x12, lsl #2
	ldr	s2, [x12, x14]
	fadd	s1, s1, s2
	fmul	s0, s0, s1
	ldur	s1, [x29, #-72]
	mul	x12, x10, x13
	add	x9, x9, x12, lsl #2
	subs	w8, w11, #1                     // =1
	ldr	s2, [x9, w8, sxtw #2]
	add	w8, w11, #1                     // =1
	ldr	s3, [x9, w8, sxtw #2]
	fadd	s2, s2, s3
	fmul	s1, s1, s2
	fadd	s0, s0, s1
	ldur	s1, [x29, #-76]
	ldr	s2, [x9, x14]
	fmul	s2, s1, s2
	fadd	s0, s0, s2
	ldr	x9, [sp, #112]
	ldr	x12, [sp, #24]                  // 8-byte Folded Reload
	mul	x10, x10, x12
	add	x9, x9, x10, lsl #2
	ldr	s2, [x9, x14]
	fsub	s0, s0, s2
	fdiv	s0, s0, s1
	stur	s0, [x29, #-80]
	ldur	x9, [x29, #-96]
	ldursw	x10, [x29, #-52]
	mul	x14, x10, x13
	add	x9, x9, x14, lsl #2
	ldrsw	x14, [sp, #64]
	lsl	x14, x14, #2
	ldr	s0, [x9, x14]
	ldur	s1, [x29, #-24]
	ldur	s2, [x29, #-80]
	fmul	s1, s1, s2
	fsub	s0, s0, s1
	ldur	x9, [x29, #-104]
	ldr	x15, [sp, #32]                  // 8-byte Folded Reload
	mul	x10, x10, x15
	add	x9, x9, x10, lsl #2
	str	s0, [x9, x14]
	ldr	s0, [sp, #60]
	ldur	s1, [x29, #-80]
	fmul	s1, s1, s1
	fadd	s0, s0, s1
	str	s0, [sp, #60]
	b	.LBB2_21
.LBB2_21:                               //   in Loop: Header=BB2_19 Depth=3
	b	.LBB2_22
.LBB2_22:                               //   in Loop: Header=BB2_19 Depth=3
	ldr	w8, [sp, #68]
	add	w8, w8, #1                      // =1
	str	w8, [sp, #68]
	b	.LBB2_19
.LBB2_23:                               //   in Loop: Header=BB2_16 Depth=2
	ldr	w8, [sp, #80]
	stur	w8, [x29, #-56]
	ldur	s0, [x29, #-64]
	ldr	s1, [sp, #60]
	fadd	s0, s0, s1
	stur	s0, [x29, #-64]
	b	.LBB2_24
.LBB2_24:                               //   in Loop: Header=BB2_16 Depth=2
	b	.LBB2_25
.LBB2_25:                               //   in Loop: Header=BB2_16 Depth=2
	ldur	w8, [x29, #-52]
	add	w8, w8, #1                      // =1
	stur	w8, [x29, #-52]
	b	.LBB2_16
.LBB2_26:                               //   in Loop: Header=BB2_1 Depth=1
	ldur	s0, [x29, #-64]
	fcvt	d0, s0
	bl	sqrt
	ldur	w8, [x29, #-4]
	ldur	w9, [x29, #-8]
	mul	w8, w8, w9
	scvtf	d1, w8
	fdiv	d0, d0, d1
	fcvt	s2, d0
	stur	s2, [x29, #-64]
	ldur	w8, [x29, #-60]
	add	w8, w8, #1                      // =1
	stur	w8, [x29, #-60]
	b	.LBB2_1
.LBB2_27:
	ldur	w1, [x29, #-60]
	adrp	x0, .L.str
	add	x0, x0, :lo12:.L.str
	bl	printf
	ldur	s0, [x29, #-64]
	fcvt	d0, s0
	adrp	x8, .L.str.1
	add	x8, x8, :lo12:.L.str.1
	str	w0, [sp, #16]                   // 4-byte Folded Spill
	mov	x0, x8
	bl	printf
	ldur	x8, [x29, #-88]
	str	w0, [sp, #12]                   // 4-byte Folded Spill
	mov	x0, x8
	bl	free
	ldp	x29, x30, [sp, #224]            // 16-byte Folded Reload
	add	sp, sp, #240                    // =240
	ret
.Lfunc_end2:
	.size	jacobi_omp, .Lfunc_end2-jacobi_omp
	.cfi_endproc
                                        // -- End function
	.globl	print_array                     // -- Begin function print_array
	.p2align	5
	.type	print_array,@function
print_array:                            // @print_array
	.cfi_startproc
// %bb.0:
	sub	sp, sp, #64                     // =64
	stp	x29, x30, [sp, #48]             // 16-byte Folded Spill
	add	x29, sp, #48                    // =48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	stur	x1, [x29, #-16]
	str	x2, [sp, #24]
	str	w3, [sp, #20]
	str	w4, [sp, #16]
	ldur	x1, [x29, #-8]
	adrp	x0, .L.str.2
	add	x0, x0, :lo12:.L.str.2
	bl	printf
	mov	w8, wzr
	str	w8, [sp, #12]
	b	.LBB3_1
.LBB3_1:                                // =>This Loop Header: Depth=1
                                        //     Child Loop BB3_3 Depth 2
	ldr	w8, [sp, #12]
	ldr	w9, [sp, #20]
	subs	w8, w8, w9
	b.ge	.LBB3_8
	b	.LBB3_2
.LBB3_2:                                //   in Loop: Header=BB3_1 Depth=1
	mov	w8, wzr
	str	w8, [sp, #8]
	b	.LBB3_3
.LBB3_3:                                //   Parent Loop BB3_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldr	w8, [sp, #8]
	ldr	w9, [sp, #16]
	subs	w8, w8, w9
	b.ge	.LBB3_6
	b	.LBB3_4
.LBB3_4:                                //   in Loop: Header=BB3_3 Depth=2
	ldur	x1, [x29, #-16]
	ldr	w8, [sp, #12]
	ldr	w9, [sp, #8]
	ldr	x10, [sp, #24]
	ldr	w11, [sp, #16]
	mul	w11, w8, w11
	add	w11, w11, w9
	ldr	s0, [x10, w11, sxtw #2]
	fcvt	d0, s0
	adrp	x0, .L.str.3
	add	x0, x0, :lo12:.L.str.3
	mov	w2, w8
	mov	w3, w9
	bl	printf
	b	.LBB3_5
.LBB3_5:                                //   in Loop: Header=BB3_3 Depth=2
	ldr	w8, [sp, #8]
	add	w8, w8, #1                      // =1
	str	w8, [sp, #8]
	b	.LBB3_3
.LBB3_6:                                //   in Loop: Header=BB3_1 Depth=1
	adrp	x0, .L.str.4
	add	x0, x0, :lo12:.L.str.4
	bl	printf
	b	.LBB3_7
.LBB3_7:                                //   in Loop: Header=BB3_1 Depth=1
	ldr	w8, [sp, #12]
	add	w8, w8, #1                      // =1
	str	w8, [sp, #12]
	b	.LBB3_1
.LBB3_8:
	adrp	x0, .L.str.4
	add	x0, x0, :lo12:.L.str.4
	bl	printf
	ldp	x29, x30, [sp, #48]             // 16-byte Folded Reload
	add	sp, sp, #64                     // =64
	ret
.Lfunc_end3:
	.size	print_array, .Lfunc_end3-print_array
	.cfi_endproc
                                        // -- End function
	.globl	initialize                      // -- Begin function initialize
	.p2align	5
	.type	initialize,@function
initialize:                             // @initialize
	.cfi_startproc
// %bb.0:
	sub	sp, sp, #96                     // =96
	.cfi_def_cfa_offset 96
	str	w0, [sp, #92]
	str	w1, [sp, #88]
	str	s0, [sp, #84]
	str	x2, [sp, #72]
	str	x3, [sp, #64]
	str	x4, [sp, #56]
	str	x5, [sp, #48]
	ldr	w8, [sp, #88]
	mov	w9, w8
	ldr	x10, [sp, #56]
	str	x10, [sp, #24]
	ldr	w8, [sp, #88]
	mov	w10, w8
	ldr	x11, [sp, #48]
	str	x11, [sp, #16]
	ldr	w8, [sp, #92]
	subs	w8, w8, #1                      // =1
	scvtf	d1, w8
	fmov	d2, #2.00000000
	fdiv	d1, d2, d1
	fcvt	s0, d1
	ldr	x11, [sp, #72]
	str	s0, [x11]
	ldr	w8, [sp, #88]
	subs	w8, w8, #1                      // =1
	scvtf	d1, w8
	fdiv	d1, d2, d1
	fcvt	s0, d1
	ldr	x11, [sp, #64]
	str	s0, [x11]
	mov	w8, wzr
	str	w8, [sp, #44]
	str	x9, [sp, #8]                    // 8-byte Folded Spill
	str	x10, [sp]                       // 8-byte Folded Spill
	b	.LBB4_1
.LBB4_1:                                // =>This Loop Header: Depth=1
                                        //     Child Loop BB4_3 Depth 2
	ldr	w8, [sp, #44]
	ldr	w9, [sp, #92]
	subs	w8, w8, w9
	b.ge	.LBB4_8
	b	.LBB4_2
.LBB4_2:                                //   in Loop: Header=BB4_1 Depth=1
	mov	w8, wzr
	str	w8, [sp, #40]
	b	.LBB4_3
.LBB4_3:                                //   Parent Loop BB4_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldr	w8, [sp, #40]
	ldr	w9, [sp, #88]
	subs	w8, w8, w9
	b.ge	.LBB4_6
	b	.LBB4_4
.LBB4_4:                                //   in Loop: Header=BB4_3 Depth=2
	ldr	x8, [sp, #72]
	ldr	s0, [x8]
	ldr	w9, [sp, #44]
	subs	w9, w9, #1                      // =1
	scvtf	s1, w9
	fmul	s0, s0, s1
	fcvt	d2, s0
	fmov	d3, #-1.00000000
	fadd	d2, d2, d3
	fcvtzs	w9, d2
	str	w9, [sp, #36]
	ldr	x8, [sp, #64]
	ldr	s0, [x8]
	ldr	w9, [sp, #40]
	subs	w9, w9, #1                      // =1
	scvtf	s1, w9
	fmul	s0, s0, s1
	fcvt	d2, s0
	fadd	d2, d2, d3
	fcvtzs	w9, d2
	str	w9, [sp, #32]
	ldr	x8, [sp, #24]
	ldrsw	x10, [sp, #44]
	ldr	x11, [sp, #8]                   // 8-byte Folded Reload
	mul	x10, x10, x11
	add	x8, x8, x10, lsl #2
	ldrsw	x10, [sp, #40]
	mov	w9, wzr
	str	w9, [x8, x10, lsl #2]
	ldr	s0, [sp, #84]
	fcvt	d2, s0
	fneg	d2, d2
	ldr	w9, [sp, #36]
	mul	w9, w9, w9
	scvtf	d3, w9
	fmov	d4, #1.00000000
	fsub	d3, d4, d3
	fmul	d2, d2, d3
	ldr	w9, [sp, #32]
	mul	w9, w9, w9
	scvtf	d5, w9
	fsub	d4, d4, d5
	fmul	d2, d2, d4
	fadd	d3, d3, d3
	fsub	d2, d2, d3
	fadd	d3, d4, d4
	fsub	d2, d2, d3
	fcvt	s0, d2
	ldr	x8, [sp, #16]
	ldrsw	x10, [sp, #44]
	ldr	x12, [sp]                       // 8-byte Folded Reload
	mul	x10, x10, x12
	add	x8, x8, x10, lsl #2
	ldrsw	x10, [sp, #40]
	str	s0, [x8, x10, lsl #2]
	b	.LBB4_5
.LBB4_5:                                //   in Loop: Header=BB4_3 Depth=2
	ldr	w8, [sp, #40]
	add	w8, w8, #1                      // =1
	str	w8, [sp, #40]
	b	.LBB4_3
.LBB4_6:                                //   in Loop: Header=BB4_1 Depth=1
	b	.LBB4_7
.LBB4_7:                                //   in Loop: Header=BB4_1 Depth=1
	ldr	w8, [sp, #44]
	add	w8, w8, #1                      // =1
	str	w8, [sp, #44]
	b	.LBB4_1
.LBB4_8:
	add	sp, sp, #96                     // =96
	ret
.Lfunc_end4:
	.size	initialize, .Lfunc_end4-initialize
	.cfi_endproc
                                        // -- End function
	.globl	error_check                     // -- Begin function error_check
	.p2align	5
	.type	error_check,@function
error_check:                            // @error_check
	.cfi_startproc
// %bb.0:
	sub	sp, sp, #112                    // =112
	stp	x29, x30, [sp, #96]             // 16-byte Folded Spill
	add	x29, sp, #96                    // =96
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	w0, [x29, #-4]
	stur	w1, [x29, #-8]
	stur	s0, [x29, #-12]
	stur	s1, [x29, #-16]
	stur	s2, [x29, #-20]
	stur	x2, [x29, #-32]
	stur	x3, [x29, #-40]
	mov	w8, wzr
	str	w8, [sp, #32]
	ldur	w9, [x29, #-8]
	mov	w10, w9
	ldur	x11, [x29, #-32]
	str	x11, [sp, #24]
	ldur	x11, [x29, #-40]
	str	x11, [sp, #16]
	stur	w8, [x29, #-44]
	str	x10, [sp, #8]                   // 8-byte Folded Spill
	b	.LBB5_1
.LBB5_1:                                // =>This Loop Header: Depth=1
                                        //     Child Loop BB5_3 Depth 2
	ldur	w8, [x29, #-44]
	ldur	w9, [x29, #-4]
	subs	w8, w8, w9
	b.ge	.LBB5_8
	b	.LBB5_2
.LBB5_2:                                //   in Loop: Header=BB5_1 Depth=1
	mov	w8, wzr
	str	w8, [sp, #48]
	b	.LBB5_3
.LBB5_3:                                //   Parent Loop BB5_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldr	w8, [sp, #48]
	ldur	w9, [x29, #-8]
	subs	w8, w8, w9
	b.ge	.LBB5_6
	b	.LBB5_4
.LBB5_4:                                //   in Loop: Header=BB5_3 Depth=2
	ldur	s0, [x29, #-16]
	ldur	w8, [x29, #-44]
	subs	w8, w8, #1                      // =1
	scvtf	s1, w8
	fmul	s0, s0, s1
	fcvt	d2, s0
	fmov	d3, #-1.00000000
	fadd	d2, d2, d3
	fcvt	s0, d2
	str	s0, [sp, #44]
	ldur	s0, [x29, #-20]
	ldr	w8, [sp, #48]
	subs	w8, w8, #1                      // =1
	scvtf	s1, w8
	fmul	s0, s0, s1
	fcvt	d2, s0
	fadd	d2, d2, d3
	fcvt	s0, d2
	str	s0, [sp, #40]
	ldr	x9, [sp, #24]
	ldursw	x10, [x29, #-44]
	ldr	x11, [sp, #8]                   // 8-byte Folded Reload
	mul	x10, x10, x11
	add	x9, x9, x10, lsl #2
	ldrsw	x10, [sp, #48]
	ldr	s0, [x9, x10, lsl #2]
	fcvt	d2, s0
	ldr	s0, [sp, #44]
	fmul	s0, s0, s0
	fcvt	d3, s0
	fmov	d4, #1.00000000
	fsub	d3, d4, d3
	ldr	s0, [sp, #40]
	fmul	s0, s0, s0
	fcvt	d5, s0
	fsub	d4, d4, d5
	fmul	d3, d3, d4
	fsub	d2, d2, d3
	fcvt	s0, d2
	str	s0, [sp, #36]
	ldr	s0, [sp, #32]
	ldr	s1, [sp, #36]
	fmul	s1, s1, s1
	fadd	s0, s0, s1
	str	s0, [sp, #32]
	b	.LBB5_5
.LBB5_5:                                //   in Loop: Header=BB5_3 Depth=2
	ldr	w8, [sp, #48]
	add	w8, w8, #1                      // =1
	str	w8, [sp, #48]
	b	.LBB5_3
.LBB5_6:                                //   in Loop: Header=BB5_1 Depth=1
	b	.LBB5_7
.LBB5_7:                                //   in Loop: Header=BB5_1 Depth=1
	ldur	w8, [x29, #-44]
	add	w8, w8, #1                      // =1
	stur	w8, [x29, #-44]
	b	.LBB5_1
.LBB5_8:
	ldr	s0, [sp, #32]
	fcvt	d0, s0
	bl	sqrt
	ldur	w8, [x29, #-4]
	ldur	w9, [x29, #-8]
	mul	w8, w8, w9
	scvtf	d1, w8
	fdiv	d0, d0, d1
	fcvt	s2, d0
	str	s2, [sp, #32]
	ldr	s2, [sp, #32]
	fcvt	d0, s2
	adrp	x0, .L.str.5
	add	x0, x0, :lo12:.L.str.5
	bl	printf
	ldp	x29, x30, [sp, #96]             // 16-byte Folded Reload
	add	sp, sp, #112                    // =112
	ret
.Lfunc_end5:
	.size	error_check, .Lfunc_end5-error_check
	.cfi_endproc
                                        // -- End function
	.globl	main                            // -- Begin function main
	.p2align	5
	.type	main,@function
main:                                   // @main
	.cfi_startproc
// %bb.0:
	sub	sp, sp, #336                    // =336
	stp	x29, x30, [sp, #304]            // 16-byte Folded Spill
	str	x28, [sp, #320]                 // 8-byte Folded Spill
	add	x29, sp, #304                   // =304
	.cfi_def_cfa w29, 32
	.cfi_offset w28, -16
	.cfi_offset w30, -24
	.cfi_offset w29, -32
	mov	w8, wzr
	stur	w8, [x29, #-4]
	stur	w0, [x29, #-8]
	stur	x1, [x29, #-16]
	mov	w8, #256
	stur	w8, [x29, #-20]
	stur	w8, [x29, #-24]
	mov	w8, #27053
	movk	w8, #15710, lsl #16
	stur	w8, [x29, #-28]
	mov	w8, #59135
	movk	w8, #11995, lsl #16
	stur	w8, [x29, #-32]
	mov	w8, #1065353216
	stur	w8, [x29, #-36]
	mov	w8, #5000
	stur	w8, [x29, #-40]
	ldur	w8, [x29, #-8]
	subs	w8, w8, #2                      // =2
	b.ne	.LBB6_2
	b	.LBB6_1
.LBB6_1:
	ldur	x8, [x29, #-16]
	ldr	x0, [x8, #8]
	adrp	x1, .L.str.6
	add	x1, x1, :lo12:.L.str.6
	sub	x2, x29, #20                    // =20
	bl	__isoc99_sscanf
	ldur	w9, [x29, #-20]
	stur	w9, [x29, #-24]
	b	.LBB6_18
.LBB6_2:
	ldur	w8, [x29, #-8]
	subs	w8, w8, #3                      // =3
	b.ne	.LBB6_4
	b	.LBB6_3
.LBB6_3:
	ldur	x8, [x29, #-16]
	ldr	x0, [x8, #8]
	adrp	x8, .L.str.6
	add	x8, x8, :lo12:.L.str.6
	sub	x2, x29, #20                    // =20
	mov	x1, x8
	stur	x8, [x29, #-136]                // 8-byte Folded Spill
	bl	__isoc99_sscanf
	ldur	x8, [x29, #-16]
	ldr	x8, [x8, #16]
	sub	x2, x29, #24                    // =24
	stur	w0, [x29, #-140]                // 4-byte Folded Spill
	mov	x0, x8
	ldur	x1, [x29, #-136]                // 8-byte Folded Reload
	bl	__isoc99_sscanf
	b	.LBB6_17
.LBB6_4:
	ldur	w8, [x29, #-8]
	subs	w8, w8, #4                      // =4
	b.ne	.LBB6_6
	b	.LBB6_5
.LBB6_5:
	ldur	x8, [x29, #-16]
	ldr	x0, [x8, #8]
	adrp	x8, .L.str.6
	add	x8, x8, :lo12:.L.str.6
	sub	x2, x29, #20                    // =20
	mov	x1, x8
	str	x8, [sp, #152]                  // 8-byte Folded Spill
	bl	__isoc99_sscanf
	ldur	x8, [x29, #-16]
	ldr	x8, [x8, #16]
	sub	x2, x29, #24                    // =24
	str	w0, [sp, #148]                  // 4-byte Folded Spill
	mov	x0, x8
	ldr	x1, [sp, #152]                  // 8-byte Folded Reload
	bl	__isoc99_sscanf
	ldur	x8, [x29, #-16]
	ldr	x8, [x8, #24]
	adrp	x1, .L.str.7
	add	x1, x1, :lo12:.L.str.7
	sub	x2, x29, #28                    // =28
	str	w0, [sp, #144]                  // 4-byte Folded Spill
	mov	x0, x8
	bl	__isoc99_sscanf
	b	.LBB6_16
.LBB6_6:
	ldur	w8, [x29, #-8]
	subs	w8, w8, #5                      // =5
	b.ne	.LBB6_8
	b	.LBB6_7
.LBB6_7:
	ldur	x8, [x29, #-16]
	ldr	x0, [x8, #8]
	adrp	x8, .L.str.6
	add	x8, x8, :lo12:.L.str.6
	sub	x2, x29, #20                    // =20
	mov	x1, x8
	str	x8, [sp, #136]                  // 8-byte Folded Spill
	bl	__isoc99_sscanf
	ldur	x8, [x29, #-16]
	ldr	x8, [x8, #16]
	sub	x2, x29, #24                    // =24
	str	w0, [sp, #132]                  // 4-byte Folded Spill
	mov	x0, x8
	ldr	x1, [sp, #136]                  // 8-byte Folded Reload
	bl	__isoc99_sscanf
	ldur	x8, [x29, #-16]
	ldr	x8, [x8, #24]
	adrp	x9, .L.str.7
	add	x9, x9, :lo12:.L.str.7
	sub	x2, x29, #28                    // =28
	str	w0, [sp, #128]                  // 4-byte Folded Spill
	mov	x0, x8
	mov	x1, x9
	str	x9, [sp, #120]                  // 8-byte Folded Spill
	bl	__isoc99_sscanf
	ldur	x8, [x29, #-16]
	ldr	x8, [x8, #32]
	sub	x2, x29, #32                    // =32
	str	w0, [sp, #116]                  // 4-byte Folded Spill
	mov	x0, x8
	ldr	x1, [sp, #120]                  // 8-byte Folded Reload
	bl	__isoc99_sscanf
	b	.LBB6_15
.LBB6_8:
	ldur	w8, [x29, #-8]
	subs	w8, w8, #6                      // =6
	b.ne	.LBB6_10
	b	.LBB6_9
.LBB6_9:
	ldur	x8, [x29, #-16]
	ldr	x0, [x8, #8]
	adrp	x8, .L.str.6
	add	x8, x8, :lo12:.L.str.6
	sub	x2, x29, #20                    // =20
	mov	x1, x8
	str	x8, [sp, #104]                  // 8-byte Folded Spill
	bl	__isoc99_sscanf
	ldur	x8, [x29, #-16]
	ldr	x8, [x8, #16]
	sub	x2, x29, #24                    // =24
	str	w0, [sp, #100]                  // 4-byte Folded Spill
	mov	x0, x8
	ldr	x1, [sp, #104]                  // 8-byte Folded Reload
	bl	__isoc99_sscanf
	ldur	x8, [x29, #-16]
	ldr	x8, [x8, #24]
	adrp	x9, .L.str.7
	add	x9, x9, :lo12:.L.str.7
	sub	x2, x29, #28                    // =28
	str	w0, [sp, #96]                   // 4-byte Folded Spill
	mov	x0, x8
	mov	x1, x9
	str	x9, [sp, #88]                   // 8-byte Folded Spill
	bl	__isoc99_sscanf
	ldur	x8, [x29, #-16]
	ldr	x8, [x8, #32]
	sub	x2, x29, #32                    // =32
	str	w0, [sp, #84]                   // 4-byte Folded Spill
	mov	x0, x8
	ldr	x1, [sp, #88]                   // 8-byte Folded Reload
	bl	__isoc99_sscanf
	ldur	x8, [x29, #-16]
	ldr	x8, [x8, #40]
	sub	x2, x29, #36                    // =36
	str	w0, [sp, #80]                   // 4-byte Folded Spill
	mov	x0, x8
	ldr	x1, [sp, #88]                   // 8-byte Folded Reload
	bl	__isoc99_sscanf
	b	.LBB6_14
.LBB6_10:
	ldur	w8, [x29, #-8]
	subs	w8, w8, #7                      // =7
	b.ne	.LBB6_12
	b	.LBB6_11
.LBB6_11:
	ldur	x8, [x29, #-16]
	ldr	x0, [x8, #8]
	adrp	x8, .L.str.6
	add	x8, x8, :lo12:.L.str.6
	sub	x2, x29, #20                    // =20
	mov	x1, x8
	str	x8, [sp, #72]                   // 8-byte Folded Spill
	bl	__isoc99_sscanf
	ldur	x8, [x29, #-16]
	ldr	x8, [x8, #16]
	sub	x2, x29, #24                    // =24
	str	w0, [sp, #68]                   // 4-byte Folded Spill
	mov	x0, x8
	ldr	x1, [sp, #72]                   // 8-byte Folded Reload
	bl	__isoc99_sscanf
	ldur	x8, [x29, #-16]
	ldr	x8, [x8, #24]
	adrp	x9, .L.str.7
	add	x9, x9, :lo12:.L.str.7
	sub	x2, x29, #28                    // =28
	str	w0, [sp, #64]                   // 4-byte Folded Spill
	mov	x0, x8
	mov	x1, x9
	str	x9, [sp, #56]                   // 8-byte Folded Spill
	bl	__isoc99_sscanf
	ldur	x8, [x29, #-16]
	ldr	x8, [x8, #32]
	sub	x2, x29, #32                    // =32
	str	w0, [sp, #52]                   // 4-byte Folded Spill
	mov	x0, x8
	ldr	x1, [sp, #56]                   // 8-byte Folded Reload
	bl	__isoc99_sscanf
	ldur	x8, [x29, #-16]
	ldr	x8, [x8, #40]
	sub	x2, x29, #36                    // =36
	str	w0, [sp, #48]                   // 4-byte Folded Spill
	mov	x0, x8
	ldr	x1, [sp, #56]                   // 8-byte Folded Reload
	bl	__isoc99_sscanf
	ldur	x8, [x29, #-16]
	ldr	x8, [x8, #48]
	sub	x2, x29, #40                    // =40
	str	w0, [sp, #44]                   // 4-byte Folded Spill
	mov	x0, x8
	ldr	x1, [sp, #72]                   // 8-byte Folded Reload
	bl	__isoc99_sscanf
	b	.LBB6_13
.LBB6_12:
	b	.LBB6_13
.LBB6_13:
	b	.LBB6_14
.LBB6_14:
	b	.LBB6_15
.LBB6_15:
	b	.LBB6_16
.LBB6_16:
	b	.LBB6_17
.LBB6_17:
	b	.LBB6_18
.LBB6_18:
	ldur	w1, [x29, #-20]
	ldur	w2, [x29, #-24]
	ldur	s0, [x29, #-28]
	fcvt	d0, s0
	ldur	s1, [x29, #-32]
	fcvt	d1, s1
	ldur	s2, [x29, #-36]
	fcvt	d2, s2
	ldur	w3, [x29, #-40]
	adrp	x0, .L.str.8
	add	x0, x0, :lo12:.L.str.8
	bl	printf
	adrp	x8, .L.str.9
	add	x8, x8, :lo12:.L.str.9
	str	w0, [sp, #40]                   // 4-byte Folded Spill
	mov	x0, x8
	bl	printf
	ldursw	x8, [x29, #-20]
	ldursw	x9, [x29, #-24]
	mul	x8, x8, x9
	lsl	x8, x8, #2
	str	w0, [sp, #36]                   // 4-byte Folded Spill
	mov	x0, x8
	bl	malloc
	stur	x0, [x29, #-48]
	ldursw	x8, [x29, #-20]
	ldursw	x9, [x29, #-24]
	mul	x8, x8, x9
	lsl	x0, x8, #2
	bl	malloc
	stur	x0, [x29, #-56]
	ldursw	x8, [x29, #-20]
	ldursw	x9, [x29, #-24]
	mul	x8, x8, x9
	lsl	x0, x8, #2
	bl	malloc
	stur	x0, [x29, #-64]
	ldur	w0, [x29, #-20]
	ldur	w1, [x29, #-24]
	ldur	s0, [x29, #-28]
	ldur	x4, [x29, #-48]
	ldur	x5, [x29, #-64]
	sub	x8, x29, #68                    // =68
	sub	x9, x29, #72                    // =72
	mov	x2, x8
	mov	x3, x9
	str	x8, [sp, #24]                   // 8-byte Folded Spill
	str	x9, [sp, #16]                   // 8-byte Folded Spill
	bl	initialize
	ldur	x0, [x29, #-56]
	ldur	x1, [x29, #-48]
	ldursw	x8, [x29, #-20]
	ldursw	x9, [x29, #-24]
	mul	x8, x8, x9
	lsl	x2, x8, #2
	bl	memcpy
	ldur	w10, [x29, #-20]
	ldur	w1, [x29, #-24]
	ldur	s0, [x29, #-68]
	ldur	s1, [x29, #-72]
	ldur	s2, [x29, #-28]
	ldur	s3, [x29, #-36]
	ldur	x2, [x29, #-48]
	ldur	x3, [x29, #-64]
	ldur	s4, [x29, #-32]
	ldur	w4, [x29, #-40]
	str	x0, [sp, #8]                    // 8-byte Folded Spill
	mov	w0, w10
	bl	jacobi_seq
	ldur	w0, [x29, #-20]
	ldur	w1, [x29, #-24]
	ldur	s0, [x29, #-68]
	ldur	s1, [x29, #-72]
	ldur	s2, [x29, #-28]
	ldur	s3, [x29, #-36]
	ldur	x2, [x29, #-56]
	ldur	x3, [x29, #-64]
	ldur	s4, [x29, #-32]
	ldur	w4, [x29, #-40]
	bl	jacobi_omp
	ldur	w0, [x29, #-20]
	ldur	w1, [x29, #-24]
	ldur	s0, [x29, #-28]
	ldur	x4, [x29, #-48]
	ldur	x5, [x29, #-64]
	ldr	x2, [sp, #24]                   // 8-byte Folded Reload
	ldr	x3, [sp, #16]                   // 8-byte Folded Reload
	bl	initialize
	ldur	x0, [x29, #-56]
	ldur	x1, [x29, #-48]
	ldursw	x8, [x29, #-20]
	ldursw	x9, [x29, #-24]
	mul	x8, x8, x9
	lsl	x2, x8, #2
	bl	memcpy
	mov	w10, #20
	stur	w10, [x29, #-76]
	mov	x8, xzr
	stur	x8, [x29, #-88]
	mov	w10, wzr
	stur	w10, [x29, #-92]
	b	.LBB6_19
.LBB6_19:                               // =>This Inner Loop Header: Depth=1
	ldur	w8, [x29, #-92]
	subs	w8, w8, #19                     // =19
	b.gt	.LBB6_22
	b	.LBB6_20
.LBB6_20:                               //   in Loop: Header=BB6_19 Depth=1
	bl	read_timer_ms
	stur	d0, [x29, #-104]
	ldur	w0, [x29, #-20]
	ldur	w1, [x29, #-24]
	ldur	s0, [x29, #-68]
	ldur	s1, [x29, #-72]
	ldur	s2, [x29, #-28]
	ldur	s3, [x29, #-36]
	ldur	x2, [x29, #-48]
	ldur	x3, [x29, #-64]
	ldur	s4, [x29, #-32]
	ldur	w4, [x29, #-40]
	bl	jacobi_seq
	bl	read_timer_ms
	ldur	d5, [x29, #-104]
	fsub	d0, d0, d5
	ldur	d5, [x29, #-88]
	fadd	d0, d5, d0
	stur	d0, [x29, #-88]
	b	.LBB6_21
.LBB6_21:                               //   in Loop: Header=BB6_19 Depth=1
	ldur	w8, [x29, #-92]
	add	w8, w8, #1                      // =1
	stur	w8, [x29, #-92]
	b	.LBB6_19
.LBB6_22:
	ldur	d0, [x29, #-88]
	ldur	s1, [x29, #-76]
                                        // implicit-def: $d2
	mov	v2.16b, v1.16b
	sshll	v3.2d, v2.2s, #0
                                        // kill: def $d3 killed $d3 killed $q3
	scvtf	d2, d3
	fdiv	d0, d0, d2
	adrp	x0, .L.str.10
	add	x0, x0, :lo12:.L.str.10
	bl	printf
	adrp	x8, .L.str.11
	add	x8, x8, :lo12:.L.str.11
	str	w0, [sp, #4]                    // 4-byte Folded Spill
	mov	x0, x8
	bl	puts
	mov	x8, xzr
	stur	x8, [x29, #-112]
	mov	w9, wzr
	stur	w9, [x29, #-116]
	b	.LBB6_23
.LBB6_23:                               // =>This Inner Loop Header: Depth=1
	ldur	w8, [x29, #-116]
	subs	w8, w8, #19                     // =19
	b.gt	.LBB6_26
	b	.LBB6_24
.LBB6_24:                               //   in Loop: Header=BB6_23 Depth=1
	bl	read_timer_ms
	stur	d0, [x29, #-128]
	ldur	w0, [x29, #-20]
	ldur	w1, [x29, #-24]
	ldur	s0, [x29, #-68]
	ldur	s1, [x29, #-72]
	ldur	s2, [x29, #-28]
	ldur	s3, [x29, #-36]
	ldur	x2, [x29, #-56]
	ldur	x3, [x29, #-64]
	ldur	s4, [x29, #-32]
	ldur	w4, [x29, #-40]
	bl	jacobi_omp
	bl	read_timer_ms
	ldur	d5, [x29, #-128]
	fsub	d0, d0, d5
	ldur	d5, [x29, #-112]
	fadd	d0, d5, d0
	stur	d0, [x29, #-112]
	b	.LBB6_25
.LBB6_25:                               //   in Loop: Header=BB6_23 Depth=1
	ldur	w8, [x29, #-116]
	add	w8, w8, #1                      // =1
	stur	w8, [x29, #-116]
	b	.LBB6_23
.LBB6_26:
	ldur	d0, [x29, #-112]
	ldur	s1, [x29, #-76]
                                        // implicit-def: $d2
	mov	v2.16b, v1.16b
	sshll	v3.2d, v2.2s, #0
                                        // kill: def $d3 killed $d3 killed $q3
	scvtf	d2, d3
	fdiv	d0, d0, d2
	adrp	x0, .L.str.12
	add	x0, x0, :lo12:.L.str.12
	bl	printf
	ldur	w8, [x29, #-20]
	ldur	w1, [x29, #-24]
	ldur	s0, [x29, #-28]
	ldur	s1, [x29, #-68]
	ldur	s2, [x29, #-72]
	ldur	x2, [x29, #-48]
	ldur	x3, [x29, #-64]
	str	w0, [sp]                        // 4-byte Folded Spill
	mov	w0, w8
	bl	error_check
	ldur	x0, [x29, #-48]
	bl	free
	ldur	x0, [x29, #-64]
	bl	free
	ldur	x0, [x29, #-56]
	bl	free
	mov	w1, wzr
	mov	w0, w1
	ldr	x28, [sp, #320]                 // 8-byte Folded Reload
	ldp	x29, x30, [sp, #304]            // 16-byte Folded Reload
	add	sp, sp, #336                    // =336
	ret
.Lfunc_end6:
	.size	main, .Lfunc_end6-main
	.cfi_endproc
                                        // -- End function
	.p2align	5                               // -- Begin function read_timer_ms
	.type	read_timer_ms,@function
read_timer_ms:                          // @read_timer_ms
	.cfi_startproc
// %bb.0:
	sub	sp, sp, #32                     // =32
	stp	x29, x30, [sp, #16]             // 16-byte Folded Spill
	add	x29, sp, #16                    // =16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	x0, sp
	bl	ftime
	ldr	d0, [sp]
	scvtf	d0, d0
	mov	x8, #70368744177664
	movk	x8, #16527, lsl #48
	fmov	d1, x8
	fmul	d0, d0, d1
	ldr	h2, [sp, #8]
                                        // implicit-def: $d1
	mov	v1.16b, v2.16b
	ucvtf	d1, d1
	fadd	d0, d0, d1
	ldp	x29, x30, [sp, #16]             // 16-byte Folded Reload
	add	sp, sp, #32                     // =32
	ret
.Lfunc_end7:
	.size	read_timer_ms, .Lfunc_end7-read_timer_ms
	.cfi_endproc
                                        // -- End function
	.type	.L.str,@object                  // @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Total Number of Iterations: %d\n"
	.size	.L.str, 32

	.type	.L.str.1,@object                // @.str.1
.L.str.1:
	.asciz	"Residual: %.15g\n"
	.size	.L.str.1, 17

	.type	.L.str.2,@object                // @.str.2
.L.str.2:
	.asciz	"%s:\n"
	.size	.L.str.2, 5

	.type	.L.str.3,@object                // @.str.3
.L.str.3:
	.asciz	"%s[%d][%d]:%f  "
	.size	.L.str.3, 16

	.type	.L.str.4,@object                // @.str.4
.L.str.4:
	.asciz	"\n"
	.size	.L.str.4, 2

	.type	.L.str.5,@object                // @.str.5
.L.str.5:
	.asciz	"Solution Error: %2.6g\n"
	.size	.L.str.5, 23

	.type	.L.str.6,@object                // @.str.6
.L.str.6:
	.asciz	"%d"
	.size	.L.str.6, 3

	.type	.L.str.7,@object                // @.str.7
.L.str.7:
	.asciz	"%g"
	.size	.L.str.7, 3

	.type	.L.str.8,@object                // @.str.8
.L.str.8:
	.asciz	"jacobi %d %d %g %g %g %d\n"
	.size	.L.str.8, 26

	.type	.L.str.9,@object                // @.str.9
.L.str.9:
	.asciz	"------------------------------------------------------------------------------------------------------\n"
	.size	.L.str.9, 104

	.type	.L.str.10,@object               // @.str.10
.L.str.10:
	.asciz	"seq elasped time(ms): %4f\n"
	.size	.L.str.10, 27

	.type	.L.str.11,@object               // @.str.11
.L.str.11:
	.asciz	"================"
	.size	.L.str.11, 17

	.type	.L.str.12,@object               // @.str.12
.L.str.12:
	.asciz	"OpenMP elasped time(ms): %4f\n"
	.size	.L.str.12, 30

	.ident	"Arm C/C++/Fortran Compiler version 21.0 (build number 879) (based on LLVM 11.0.0)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym jacobi_seq
	.addrsig_sym sqrt
	.addrsig_sym _ZGVsMxv_sqrt
	.addrsig_sym ___ZGVsMxv_sqrt_SVE_VFABI_WRAPPER
	.addrsig_sym printf
	.addrsig_sym jacobi_omp
	.addrsig_sym malloc
	.addrsig_sym free
	.addrsig_sym initialize
	.addrsig_sym error_check
	.addrsig_sym __isoc99_sscanf
	.addrsig_sym puts
	.addrsig_sym read_timer_ms
	.addrsig_sym ftime
