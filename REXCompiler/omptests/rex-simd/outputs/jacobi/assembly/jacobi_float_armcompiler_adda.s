	.text
	.file	"jacobi_float.c"
	.globl	jacobi_seq                      // -- Begin function jacobi_seq
	.p2align	5
	.type	jacobi_seq,@function
jacobi_seq:                             // @jacobi_seq
	.cfi_startproc
// %bb.0:
	str	d14, [sp, #-160]!               // 8-byte Folded Spill
	stp	d13, d12, [sp, #16]             // 16-byte Folded Spill
	stp	d11, d10, [sp, #32]             // 16-byte Folded Spill
	stp	d9, d8, [sp, #48]               // 16-byte Folded Spill
	stp	x29, x30, [sp, #64]             // 16-byte Folded Spill
	stp	x28, x27, [sp, #80]             // 16-byte Folded Spill
	stp	x26, x25, [sp, #96]             // 16-byte Folded Spill
	stp	x24, x23, [sp, #112]            // 16-byte Folded Spill
	stp	x22, x21, [sp, #128]            // 16-byte Folded Spill
	stp	x20, x19, [sp, #144]            // 16-byte Folded Spill
	mov	x29, sp
	addvl	sp, sp, #-5
	sub	sp, sp, #96                     // =96
	mov	x19, sp
	.cfi_def_cfa w29, 160
	.cfi_offset w19, -8
	.cfi_offset w20, -16
	.cfi_offset w21, -24
	.cfi_offset w22, -32
	.cfi_offset w23, -40
	.cfi_offset w24, -48
	.cfi_offset w25, -56
	.cfi_offset w26, -64
	.cfi_offset w27, -72
	.cfi_offset w28, -80
	.cfi_offset w30, -88
	.cfi_offset w29, -96
	.cfi_offset b8, -104
	.cfi_offset b9, -112
	.cfi_offset b10, -120
	.cfi_offset b11, -128
	.cfi_offset b12, -136
	.cfi_offset b13, -144
	.cfi_offset b14, -160
	addvl	x8, x29, #-5
	stur	w0, [x8, #-28]                  // 4-byte Folded Spill
	umull	x8, w1, w0
	lsl	x8, x8, #2
	add	x8, x8, #15                     // =15
	and	x8, x8, #0xfffffffffffffff0
	mov	x9, sp
	mov	v9.16b, v3.16b
	mov	w26, w1
	sub	x5, x9, x8
	mov	sp, x5
	fmov	s3, #10.00000000
	fmul	s14, s4, s3
	fcmp	s14, s4
	mov	w1, #1
	b.le	.LBB0_26
// %bb.1:
	mov	w28, w4
	cmp	w4, #1                          // =1
	b.lt	.LBB0_26
// %bb.2:
	addvl	x8, x29, #-5
	ldur	w10, [x8, #-28]                 // 4-byte Folded Reload
	sub	w9, w26, #1                     // =1
	addvl	x11, x29, #-5
	fmul	s0, s0, s0
	mov	w22, w10
	mul	w8, w26, w10
	sub	w10, w10, #1                    // =1
	str	x10, [x19, #40]                 // 8-byte Folded Spill
	mov	z5.s, s9
	add	x10, x5, #4                     // =4
	str	z5, [x29, #-2, mul vl]          // 16-byte Folded Spill
	str	x10, [x19, #16]                 // 8-byte Folded Spill
	add	x10, x5, #8                     // =8
	fmov	s3, #1.00000000
	fmul	s1, s1, s1
	add	x13, x2, #4                     // =4
	stur	x10, [x11, #-24]                // 8-byte Folded Spill
	cntw	x10
	mov	w11, #-1
	scvtf	d12, w8
	lsl	x8, x9, #2
	sub	x23, x9, #1                     // =1
	sub	x9, x9, #2                      // =2
	mov	v8.16b, v4.16b
	fmov	d4, #-2.00000000
	fcvt	d6, s0
	fdiv	s10, s3, s0
	fcvt	d0, s1
	add	x12, x3, x8
	str	x13, [x19, #32]                 // 8-byte Folded Spill
	str	x9, [x29, #8]                   // 8-byte Folded Spill
	mvn	x9, x10
	addvl	x10, x29, #-5
	incw	x11
	add	x14, x3, #4                     // =4
	fdiv	s11, s3, s1
	fdiv	d1, d4, d6
	fdiv	d0, d4, d0
	cmp	x13, x12
	stur	x9, [x10, #-8]                  // 8-byte Folded Spill
	add	x8, x2, x8
	sxtw	x9, w11
	fcvt	d2, s2
	mov	z3.s, s10
	fadd	d0, d1, d0
	mov	z1.s, w9
	cset	w9, lo
	cmp	x14, x8
	index	z5.s, #0, #1
	ptrue	p1.s
	str	z3, [x29, #-3, mul vl]          // 16-byte Folded Spill
	mov	z3.s, s11
	fsub	d0, d0, d2
	cset	w8, lo
	whilelo	p0.s, xzr, x23
	mov	w21, w26
	str	z3, [x29, #-4, mul vl]          // 16-byte Folded Spill
	str	x14, [x19, #24]                 // 8-byte Folded Spill
	fcvt	s13, d0
	str	p0, [x29, #-1, mul vl]          // 2-byte Folded Spill
	cmpeq	p0.s, p1/z, z5.s, z1.s
	and	w8, w9, w8
	addvl	x9, x29, #-5
	mov	x20, x2
	rdvl	x25, #1
	lsl	x24, x21, #2
	str	p0, [x29, #-2, mul vl]          // 2-byte Folded Spill
	stur	w8, [x9, #-12]                  // 4-byte Folded Spill
	mov	w8, #1
	mov	z0.s, s13
	mov	x3, #2
	addvl	x9, x29, #-5
	str	z0, [x29, #-5, mul vl]          // 16-byte Folded Spill
	stur	w28, [x9, #-44]                 // 4-byte Folded Spill
	.p2align	5
.LBB0_3:                                // =>This Loop Header: Depth=1
                                        //     Child Loop BB0_7 Depth 2
                                        //       Child Loop BB0_10 Depth 3
                                        //     Child Loop BB0_16 Depth 2
                                        //       Child Loop BB0_21 Depth 3
                                        //       Child Loop BB0_19 Depth 3
	addvl	x9, x29, #-5
	stur	x8, [x9, #-40]                  // 8-byte Folded Spill
	addvl	x8, x29, #-5
	ldur	w8, [x8, #-28]                  // 4-byte Folded Reload
	cmp	w8, #1                          // =1
	b.lt	.LBB0_12
// %bb.4:                               //   in Loop: Header=BB0_3 Depth=1
	mov	x28, xzr
	b	.LBB0_7
	.p2align	5
.LBB0_5:                                //   in Loop: Header=BB0_7 Depth=2
	mov	x2, x24
	mov	w27, w26
	mov	x26, x5
	bl	memcpy
	mov	x3, #2
	ptrue	p1.s
	mov	x5, x26
	mov	w26, w27
.LBB0_6:                                //   in Loop: Header=BB0_7 Depth=2
	add	x28, x28, #1                    // =1
	cmp	x28, x22
	b.eq	.LBB0_11
.LBB0_7:                                //   Parent Loop BB0_3 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB0_10 Depth 3
	cmp	w26, #1                         // =1
	b.lt	.LBB0_6
// %bb.8:                               //   in Loop: Header=BB0_7 Depth=2
	mul	x8, x28, x21
	lsl	x8, x8, #2
	cmp	x25, #17                        // =17
	add	x1, x20, x8
	add	x0, x5, x8
	b.lo	.LBB0_5
// %bb.9:                               //   in Loop: Header=BB0_7 Depth=2
	mov	x8, xzr
	whilelo	p0.b, xzr, x24
	.p2align	5
.LBB0_10:                               //   Parent Loop BB0_3 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	ld1b	{ z0.b }, p0/z, [x1, x8]
	st1b	{ z0.b }, p0, [x0, x8]
	incp	x8, p0.b
	whilelo	p0.b, x8, x24
	b.mi	.LBB0_10
	b	.LBB0_6
	.p2align	5
.LBB0_11:                               //   in Loop: Header=BB0_3 Depth=1
	addvl	x8, x29, #-5
	ldur	w28, [x8, #-44]                 // 4-byte Folded Reload
.LBB0_12:                               //   in Loop: Header=BB0_3 Depth=1
	addvl	x8, x29, #-5
	ldur	w8, [x8, #-28]                  // 4-byte Folded Reload
	fmov	s0, wzr
	cmp	w8, #3                          // =3
	b.lt	.LBB0_22
// %bb.13:                              //   in Loop: Header=BB0_3 Depth=1
	ldp	x18, x17, [x19, #32]            // 16-byte Folded Reload
	ldp	x1, x0, [x19, #16]              // 16-byte Folded Reload
	ldr	z6, [x29, #-2, mul vl]          // 16-byte Folded Reload
	ldr	z7, [x29, #-3, mul vl]          // 16-byte Folded Reload
	ldr	z16, [x29, #-4, mul vl]         // 16-byte Folded Reload
	ldr	z17, [x29, #-5, mul vl]         // 16-byte Folded Reload
	fmov	s0, wzr
	mov	w11, #1
	b	.LBB0_16
	.p2align	5
.LBB0_14:                               //   in Loop: Header=BB0_16 Depth=2
	add	x8, x11, #1                     // =1
.LBB0_15:                               //   in Loop: Header=BB0_16 Depth=2
	cmp	x8, x17
	mov	x11, x8
	b.eq	.LBB0_22
.LBB0_16:                               //   Parent Loop BB0_3 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB0_21 Depth 3
                                        //       Child Loop BB0_19 Depth 3
	cmp	w26, #2                         // =2
	b.le	.LBB0_14
// %bb.17:                              //   in Loop: Header=BB0_16 Depth=2
	addvl	x9, x29, #-5
	ldr	x8, [x29, #8]                   // 8-byte Folded Reload
	ldur	x9, [x9, #-8]                   // 8-byte Folded Reload
	cmp	x8, x9
	mul	x8, x11, x21
	add	x9, x5, x8, lsl #2
	addvl	x8, x29, #-5
	ldur	w8, [x8, #-12]                  // 4-byte Folded Reload
	ldr	s1, [x9, #4]
	cset	w10, hs
	orr	w8, w10, w8
	cmp	w8, #1                          // =1
	add	x8, x11, #1                     // =1
	b.ne	.LBB0_20
// %bb.18:                              //   in Loop: Header=BB0_16 Depth=2
	mul	x10, x21, x11
	sub	x11, x11, #1                    // =1
	mul	x14, x21, x11
	addvl	x11, x29, #-5
	ldur	x11, [x11, #-24]                // 8-byte Folded Reload
	mul	x12, x21, x8
	lsl	x13, x10, #2
	mov	x9, xzr
	add	x10, x1, x12, lsl #2
	add	x11, x11, x13
	add	x12, x18, x13
	add	x13, x0, x13
	add	x14, x1, x14, lsl #2
	mov	x15, x23
	.p2align	5
.LBB0_19:                               //   Parent Loop BB0_3 Depth=1
                                        //     Parent Loop BB0_16 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	add	x16, x11, x9
	ldr	s2, [x14, x9]
	ldr	s3, [x10, x9]
	ldur	s4, [x16, #-8]
	ldr	s5, [x16]
	subs	x15, x15, #1                    // =1
	fadd	s2, s2, s3
	ldr	s3, [x13, x9]
	fadd	s4, s4, s5
	fmul	s2, s10, s2
	fmul	s4, s11, s4
	fadd	s2, s2, s4
	fmul	s4, s1, s13
	fadd	s2, s4, s2
	fsub	s2, s2, s3
	fdiv	s2, s2, s13
	fmul	s3, s2, s9
	fmul	s2, s2, s2
	fsub	s1, s1, s3
	fadd	s0, s0, s2
	str	s1, [x12, x9]
	add	x9, x9, #4                      // =4
	mov	v1.16b, v5.16b
	b.ne	.LBB0_19
	b	.LBB0_15
	.p2align	5
.LBB0_20:                               //   in Loop: Header=BB0_16 Depth=2
	ldr	p0, [x29, #-2, mul vl]          // 2-byte Folded Reload
	sub	x12, x11, #1                    // =1
	mul	x14, x21, x11
	mul	x13, x21, x8
	mov	z1.s, p0/m, s1
	ldr	p0, [x29, #-1, mul vl]          // 2-byte Folded Reload
	mul	x12, x21, x12
	lsl	x14, x14, #2
	mov	x10, xzr
	add	x11, x1, x13, lsl #2
	add	x12, x1, x12, lsl #2
	add	x13, x0, x14
	add	x14, x18, x14
	.p2align	5
.LBB0_21:                               //   Parent Loop BB0_3 Depth=1
                                        //     Parent Loop BB0_16 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	add	x15, x9, x10, lsl #2
	ld1w	{ z2.s }, p0/z, [x12, x10, lsl #2]
	ld1w	{ z3.s }, p0/z, [x11, x10, lsl #2]
	ld1w	{ z4.s }, p0/z, [x15]
	ld1w	{ z5.s }, p0/z, [x15, x3, lsl #2]
	lastb	s1, p1, z1.s
	fadd	z2.s, z2.s, z3.s
	fmul	z2.s, z7.s, z2.s
	fadd	z3.s, z4.s, z5.s
	movprfx	z4, z5
	insr	z4.s, s1
	fmul	z1.s, z16.s, z3.s
	ld1w	{ z3.s }, p0/z, [x13, x10, lsl #2]
	fadd	z1.s, z2.s, z1.s
	fmul	z2.s, z4.s, z17.s
	fadd	z1.s, z2.s, z1.s
	fsub	z1.s, z1.s, z3.s
	fdiv	z1.s, p0/m, z1.s, z17.s
	fmul	z2.s, z1.s, z6.s
	fsub	z2.s, z4.s, z2.s
	fmul	z1.s, z1.s, z1.s
	st1w	{ z2.s }, p0, [x14, x10, lsl #2]
	incw	x10
	fadda	s0, p0, s0, z1.s
	whilelo	p0.s, x10, x23
	mov	z1.d, z5.d
	b.mi	.LBB0_21
	b	.LBB0_15
	.p2align	5
.LBB0_22:                               //   in Loop: Header=BB0_3 Depth=1
	fcvt	d1, s0
	fsqrt	d0, d1
	fcmp	d0, d0
	b.vs	.LBB0_25
.LBB0_23:                               //   in Loop: Header=BB0_3 Depth=1
	addvl	x8, x29, #-5
	ldur	x8, [x8, #-40]                  // 8-byte Folded Reload
	fdiv	d0, d0, d12
	fcvt	s14, d0
	fcmp	s14, s8
	add	w1, w8, #1                      // =1
	b.le	.LBB0_26
// %bb.24:                              //   in Loop: Header=BB0_3 Depth=1
	cmp	w8, w28
	mov	w8, w1
	b.lt	.LBB0_3
	b	.LBB0_26
.LBB0_25:                               //   in Loop: Header=BB0_3 Depth=1
	mov	v0.16b, v1.16b
	str	x5, [x19, #8]                   // 8-byte Folded Spill
	bl	sqrt
	ldr	x5, [x19, #8]                   // 8-byte Folded Reload
	mov	x3, #2
	ptrue	p1.s
	b	.LBB0_23
.LBB0_26:
	adrp	x0, .L.str
	add	x0, x0, :lo12:.L.str
	bl	printf
	adrp	x0, .L.str.1
	fcvt	d0, s14
	add	x0, x0, :lo12:.L.str.1
	addvl	sp, sp, #5
	mov	sp, x29
	ldp	x20, x19, [sp, #144]            // 16-byte Folded Reload
	ldp	x22, x21, [sp, #128]            // 16-byte Folded Reload
	ldp	x24, x23, [sp, #112]            // 16-byte Folded Reload
	ldp	x26, x25, [sp, #96]             // 16-byte Folded Reload
	ldp	x28, x27, [sp, #80]             // 16-byte Folded Reload
	ldp	x29, x30, [sp, #64]             // 16-byte Folded Reload
	ldp	d9, d8, [sp, #48]               // 16-byte Folded Reload
	ldp	d11, d10, [sp, #32]             // 16-byte Folded Reload
	ldp	d13, d12, [sp, #16]             // 16-byte Folded Reload
	ldr	d14, [sp], #160                 // 8-byte Folded Reload
	b	printf
.Lfunc_end0:
	.size	jacobi_seq, .Lfunc_end0-jacobi_seq
	.cfi_endproc
                                        // -- End function
	.globl	jacobi_omp                      // -- Begin function jacobi_omp
	.p2align	5
	.type	jacobi_omp,@function
jacobi_omp:                             // @jacobi_omp
	.cfi_startproc
// %bb.0:
	str	d14, [sp, #-160]!               // 8-byte Folded Spill
	stp	d13, d12, [sp, #16]             // 16-byte Folded Spill
	stp	d11, d10, [sp, #32]             // 16-byte Folded Spill
	stp	d9, d8, [sp, #48]               // 16-byte Folded Spill
	stp	x29, x30, [sp, #64]             // 16-byte Folded Spill
	stp	x28, x27, [sp, #80]             // 16-byte Folded Spill
	stp	x26, x25, [sp, #96]             // 16-byte Folded Spill
	stp	x24, x23, [sp, #112]            // 16-byte Folded Spill
	stp	x22, x21, [sp, #128]            // 16-byte Folded Spill
	stp	x20, x19, [sp, #144]            // 16-byte Folded Spill
	mov	x29, sp
	addvl	sp, sp, #-5
	sub	sp, sp, #48                     // =48
	.cfi_def_cfa w29, 160
	.cfi_offset w19, -8
	.cfi_offset w20, -16
	.cfi_offset w21, -24
	.cfi_offset w22, -32
	.cfi_offset w23, -40
	.cfi_offset w24, -48
	.cfi_offset w25, -56
	.cfi_offset w26, -64
	.cfi_offset w27, -72
	.cfi_offset w28, -80
	.cfi_offset w30, -88
	.cfi_offset w29, -96
	.cfi_offset b8, -104
	.cfi_offset b9, -112
	.cfi_offset b10, -120
	.cfi_offset b11, -128
	.cfi_offset b12, -136
	.cfi_offset b13, -144
	.cfi_offset b14, -160
	addvl	x8, x29, #-5
	str	x2, [x29, #8]                   // 8-byte Folded Spill
	stur	w0, [x8, #-12]                  // 4-byte Folded Spill
	smull	x8, w0, w1
	lsl	x0, x8, #2
	mov	w23, w4
	mov	v8.16b, v4.16b
	mov	x24, x3
	mov	v9.16b, v3.16b
	mov	v10.16b, v2.16b
	mov	v11.16b, v1.16b
	mov	v12.16b, v0.16b
	mov	w22, w1
	bl	malloc
	fmov	s0, #10.00000000
	fmul	s14, s8, s0
	mov	x19, x0
	fcmp	s14, s8
	mov	w1, #1
	b.le	.LBB1_26
// %bb.1:
	cmp	w23, #1                         // =1
	b.lt	.LBB1_26
// %bb.2:
	addvl	x8, x29, #-5
	ldur	w9, [x8, #-12]                  // 4-byte Folded Reload
	mov	z5.s, s9
	str	z5, [x29, #-2, mul vl]          // 16-byte Folded Spill
	fmul	s0, s12, s12
	mul	w8, w22, w9
	sub	w27, w9, #1                     // =1
	mov	w28, w9
	ldr	x9, [x29, #8]                   // 8-byte Folded Reload
	fmov	s1, #1.00000000
	fmul	s2, s11, s11
	fmov	d3, #-2.00000000
	fcvt	d4, s10
	add	x10, x9, #4                     // =4
	add	x9, x24, #4                     // =4
	fcvt	d6, s0
	fdiv	s10, s1, s0
	fcvt	d0, s2
	sub	w26, w22, #2                    // =2
	stp	x9, x10, [sp, #16]              // 16-byte Folded Spill
	mov	w9, #-1
	fdiv	s11, s1, s2
	fdiv	d1, d3, d6
	fdiv	d0, d3, d0
	whilelo	p0.s, xzr, x26
	incw	x9
	fadd	d0, d1, d0
	scvtf	d12, w8
	str	p0, [x29, #-1, mul vl]          // 2-byte Folded Spill
	mov	z2.s, s10
	sxtw	x8, w9
	fsub	d0, d0, d4
	mov	w25, w22
	index	z5.s, #0, #1
	ptrue	p1.s
	str	z2, [x29, #-3, mul vl]          // 16-byte Folded Spill
	mov	z2.s, s11
	mov	z1.s, w8
	fcvt	s13, d0
	add	x20, x19, #4                    // =4
	mov	w2, #1
	rdvl	x21, #1
	lsl	x24, x25, #2
	str	z2, [x29, #-4, mul vl]          // 16-byte Folded Spill
	mov	z0.s, s13
	cmpeq	p0.s, p1/z, z5.s, z1.s
	addvl	x8, x29, #-5
	str	z0, [x29, #-5, mul vl]          // 16-byte Folded Spill
	str	p0, [x29, #-2, mul vl]          // 2-byte Folded Spill
	stur	w23, [x8, #-16]                 // 4-byte Folded Spill
	.p2align	5
.LBB1_3:                                // =>This Loop Header: Depth=1
                                        //     Child Loop BB1_7 Depth 2
                                        //       Child Loop BB1_10 Depth 3
                                        //     Child Loop BB1_15 Depth 2
                                        //       Child Loop BB1_18 Depth 3
                                        //       Child Loop BB1_20 Depth 3
	addvl	x8, x29, #-5
	ldur	w8, [x8, #-12]                  // 4-byte Folded Reload
	cmp	w8, #1                          // =1
	addvl	x8, x29, #-5
	stur	x2, [x8, #-8]                   // 8-byte Folded Spill
	b.lt	.LBB1_12
// %bb.4:                               //   in Loop: Header=BB1_3 Depth=1
	mov	x23, xzr
	b	.LBB1_7
	.p2align	5
.LBB1_5:                                //   in Loop: Header=BB1_7 Depth=2
	mov	x2, x24
	bl	memcpy
	addvl	x8, x29, #-5
	ldur	x2, [x8, #-8]                   // 8-byte Folded Reload
	ptrue	p1.s
.LBB1_6:                                //   in Loop: Header=BB1_7 Depth=2
	add	x23, x23, #1                    // =1
	cmp	x23, x28
	b.eq	.LBB1_11
.LBB1_7:                                //   Parent Loop BB1_3 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB1_10 Depth 3
	cmp	w22, #1                         // =1
	b.lt	.LBB1_6
// %bb.8:                               //   in Loop: Header=BB1_7 Depth=2
	ldr	x9, [x29, #8]                   // 8-byte Folded Reload
	mul	x8, x23, x25
	cmp	x21, #17                        // =17
	madd	x0, x24, x23, x19
	add	x1, x9, x8, lsl #2
	b.lo	.LBB1_5
// %bb.9:                               //   in Loop: Header=BB1_7 Depth=2
	mov	x8, xzr
	whilelo	p0.b, xzr, x24
	.p2align	5
.LBB1_10:                               //   Parent Loop BB1_3 Depth=1
                                        //     Parent Loop BB1_7 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	ld1b	{ z0.b }, p0/z, [x1, x8]
	st1b	{ z0.b }, p0, [x0, x8]
	incp	x8, p0.b
	whilelo	p0.b, x8, x24
	b.mi	.LBB1_10
	b	.LBB1_6
	.p2align	5
.LBB1_11:                               //   in Loop: Header=BB1_3 Depth=1
	addvl	x8, x29, #-5
	ldur	w23, [x8, #-16]                 // 4-byte Folded Reload
.LBB1_12:                               //   in Loop: Header=BB1_3 Depth=1
	addvl	x8, x29, #-5
	ldur	w8, [x8, #-12]                  // 4-byte Folded Reload
	fmov	s0, wzr
	cmp	w8, #3                          // =3
	b.lt	.LBB1_22
// %bb.13:                              //   in Loop: Header=BB1_3 Depth=1
	ldr	z7, [x29, #-2, mul vl]          // 16-byte Folded Reload
	ldp	x18, x17, [sp, #16]             // 16-byte Folded Reload
	ldr	z16, [x29, #-3, mul vl]         // 16-byte Folded Reload
	ldr	z17, [x29, #-4, mul vl]         // 16-byte Folded Reload
	ldr	z18, [x29, #-5, mul vl]         // 16-byte Folded Reload
	fmov	s0, wzr
	mov	w12, #1
	b	.LBB1_15
	.p2align	5
.LBB1_14:                               //   in Loop: Header=BB1_15 Depth=2
	add	x12, x12, #1                    // =1
	cmp	x12, x27
	b.eq	.LBB1_22
.LBB1_15:                               //   Parent Loop BB1_3 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB1_18 Depth 3
                                        //       Child Loop BB1_20 Depth 3
	cmp	w22, #2                         // =2
	b.le	.LBB1_14
// %bb.16:                              //   in Loop: Header=BB1_15 Depth=2
	mul	x8, x12, x25
	add	x8, x19, x8, lsl #2
	ldr	s2, [x8, #4]
	add	x8, x12, #1                     // =1
	mov	x9, xzr
	cbz	w26, .LBB1_19
// %bb.17:                              //   in Loop: Header=BB1_15 Depth=2
	ldr	p0, [x29, #-2, mul vl]          // 2-byte Folded Reload
	mul	x13, x25, x12
	madd	x10, x24, x12, x19
	sub	x12, x12, #1                    // =1
	mov	z2.s, p0/m, s2
	ldr	p0, [x29, #-1, mul vl]          // 2-byte Folded Reload
	lsl	x15, x13, #2
	madd	x11, x24, x8, x20
	madd	x12, x24, x12, x20
	add	x13, x10, #8                    // =8
	add	x14, x17, x15
	add	x15, x18, x15
	fmov	s1, wzr
	.p2align	5
.LBB1_18:                               //   Parent Loop BB1_3 Depth=1
                                        //     Parent Loop BB1_15 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	ld1w	{ z3.s }, p0/z, [x12, x9, lsl #2]
	ld1w	{ z4.s }, p0/z, [x11, x9, lsl #2]
	ld1w	{ z5.s }, p0/z, [x10, x9, lsl #2]
	ld1w	{ z6.s }, p0/z, [x13, x9, lsl #2]
	lastb	s2, p1, z2.s
	fadd	z3.s, z3.s, z4.s
	fmul	z3.s, z16.s, z3.s
	fadd	z4.s, z5.s, z6.s
	movprfx	z5, z6
	insr	z5.s, s2
	fmul	z2.s, z17.s, z4.s
	ld1w	{ z4.s }, p0/z, [x15, x9, lsl #2]
	fadd	z2.s, z3.s, z2.s
	fmul	z3.s, z5.s, z18.s
	fadd	z2.s, z3.s, z2.s
	fsub	z2.s, z2.s, z4.s
	fdiv	z2.s, p0/m, z2.s, z18.s
	fmul	z3.s, z2.s, z7.s
	fsub	z3.s, z5.s, z3.s
	fmul	z2.s, z2.s, z2.s
	st1w	{ z3.s }, p0, [x14, x9, lsl #2]
	incw	x9
	fadda	s1, p0, s1, z2.s
	whilelo	p0.s, x9, x26
	mov	z2.d, z6.d
	b.mi	.LBB1_18
	b	.LBB1_21
.LBB1_19:                               //   in Loop: Header=BB1_15 Depth=2
	mul	x14, x25, x12
	sub	x13, x12, #1                    // =1
	lsl	x14, x14, #2
	madd	x10, x24, x12, x19
	madd	x11, x24, x8, x20
	madd	x12, x24, x13, x20
	add	x13, x17, x14
	add	x14, x18, x14
	fmov	s1, wzr
	mov	x15, x26
	.p2align	5
.LBB1_20:                               //   Parent Loop BB1_3 Depth=1
                                        //     Parent Loop BB1_15 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	add	x16, x10, x9
	ldr	s3, [x12, x9]
	ldr	s4, [x11, x9]
	ldr	s5, [x16]
	ldr	s6, [x16, #8]
	subs	x15, x15, #1                    // =1
	fadd	s3, s3, s4
	ldr	s4, [x14, x9]
	fadd	s5, s5, s6
	fmul	s3, s10, s3
	fmul	s5, s11, s5
	fadd	s3, s3, s5
	fmul	s5, s2, s13
	fadd	s3, s5, s3
	fsub	s3, s3, s4
	fdiv	s3, s3, s13
	fmul	s4, s3, s9
	fmul	s3, s3, s3
	fsub	s2, s2, s4
	fadd	s1, s1, s3
	str	s2, [x13, x9]
	add	x9, x9, #4                      // =4
	mov	v2.16b, v6.16b
	b.ne	.LBB1_20
.LBB1_21:                               //   in Loop: Header=BB1_15 Depth=2
	fadd	s0, s0, s1
	mov	x12, x8
	cmp	x12, x27
	b.ne	.LBB1_15
.LBB1_22:                               //   in Loop: Header=BB1_3 Depth=1
	fcvt	d1, s0
	fsqrt	d0, d1
	fcmp	d0, d0
	b.vs	.LBB1_25
.LBB1_23:                               //   in Loop: Header=BB1_3 Depth=1
	fdiv	d0, d0, d12
	fcvt	s14, d0
	fcmp	s14, s8
	add	w1, w2, #1                      // =1
	b.le	.LBB1_26
// %bb.24:                              //   in Loop: Header=BB1_3 Depth=1
	cmp	w2, w23
	mov	w2, w1
	b.lt	.LBB1_3
	b	.LBB1_26
.LBB1_25:                               //   in Loop: Header=BB1_3 Depth=1
	mov	v0.16b, v1.16b
	bl	sqrt
	addvl	x8, x29, #-5
	ldur	x2, [x8, #-8]                   // 8-byte Folded Reload
	ptrue	p1.s
	rdvl	x21, #1
	b	.LBB1_23
.LBB1_26:
	adrp	x0, .L.str
	add	x0, x0, :lo12:.L.str
	bl	printf
	adrp	x0, .L.str.1
	fcvt	d0, s14
	add	x0, x0, :lo12:.L.str.1
	bl	printf
	mov	x0, x19
	addvl	sp, sp, #5
	add	sp, sp, #48                     // =48
	ldp	x20, x19, [sp, #144]            // 16-byte Folded Reload
	ldp	x22, x21, [sp, #128]            // 16-byte Folded Reload
	ldp	x24, x23, [sp, #112]            // 16-byte Folded Reload
	ldp	x26, x25, [sp, #96]             // 16-byte Folded Reload
	ldp	x28, x27, [sp, #80]             // 16-byte Folded Reload
	ldp	x29, x30, [sp, #64]             // 16-byte Folded Reload
	ldp	d9, d8, [sp, #48]               // 16-byte Folded Reload
	ldp	d11, d10, [sp, #32]             // 16-byte Folded Reload
	ldp	d13, d12, [sp, #16]             // 16-byte Folded Reload
	ldr	d14, [sp], #160                 // 8-byte Folded Reload
	b	free
.Lfunc_end1:
	.size	jacobi_omp, .Lfunc_end1-jacobi_omp
	.cfi_endproc
                                        // -- End function
	.globl	print_array                     // -- Begin function print_array
	.p2align	5
	.type	print_array,@function
print_array:                            // @print_array
	.cfi_startproc
// %bb.0:
	stp	x29, x30, [sp, #-96]!           // 16-byte Folded Spill
	str	x27, [sp, #16]                  // 8-byte Folded Spill
	stp	x26, x25, [sp, #32]             // 16-byte Folded Spill
	stp	x24, x23, [sp, #48]             // 16-byte Folded Spill
	stp	x22, x21, [sp, #64]             // 16-byte Folded Spill
	stp	x20, x19, [sp, #80]             // 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 96
	.cfi_offset w19, -8
	.cfi_offset w20, -16
	.cfi_offset w21, -24
	.cfi_offset w22, -32
	.cfi_offset w23, -40
	.cfi_offset w24, -48
	.cfi_offset w25, -56
	.cfi_offset w26, -64
	.cfi_offset w27, -80
	.cfi_offset w30, -88
	.cfi_offset w29, -96
	mov	x21, x1
	mov	x1, x0
	adrp	x0, .L.str.2
	add	x0, x0, :lo12:.L.str.2
	mov	w19, w4
	mov	w23, w3
	mov	x20, x2
	bl	printf
	cmp	w23, #1                         // =1
	b.lt	.LBB2_6
// %bb.1:
	mov	w25, w23
	adrp	x23, .L.str.3
	mov	x22, xzr
	mov	w26, w19
	sbfiz	x27, x19, #2, #32
	add	x23, x23, :lo12:.L.str.3
	b	.LBB2_3
	.p2align	5
.LBB2_2:                                //   in Loop: Header=BB2_3 Depth=1
	mov	w0, #10
	bl	putchar
	add	x22, x22, #1                    // =1
	cmp	x22, x25
	add	x20, x20, x27
	b.eq	.LBB2_6
.LBB2_3:                                // =>This Loop Header: Depth=1
                                        //     Child Loop BB2_5 Depth 2
	cmp	w19, #1                         // =1
	b.lt	.LBB2_2
// %bb.4:                               //   in Loop: Header=BB2_3 Depth=1
	mov	x24, xzr
	.p2align	5
.LBB2_5:                                //   Parent Loop BB2_3 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldr	s0, [x20, x24, lsl #2]
	mov	x0, x23
	mov	x1, x21
	mov	w2, w22
	fcvt	d0, s0
	mov	w3, w24
	bl	printf
	add	x24, x24, #1                    // =1
	cmp	x26, x24
	b.ne	.LBB2_5
	b	.LBB2_2
.LBB2_6:
	ldp	x20, x19, [sp, #80]             // 16-byte Folded Reload
	ldp	x22, x21, [sp, #64]             // 16-byte Folded Reload
	ldp	x24, x23, [sp, #48]             // 16-byte Folded Reload
	ldp	x26, x25, [sp, #32]             // 16-byte Folded Reload
	ldr	x27, [sp, #16]                  // 8-byte Folded Reload
	mov	w0, #10
	ldp	x29, x30, [sp], #96             // 16-byte Folded Reload
	b	putchar
.Lfunc_end2:
	.size	print_array, .Lfunc_end2-print_array
	.cfi_endproc
                                        // -- End function
	.globl	initialize                      // -- Begin function initialize
	.p2align	5
	.type	initialize,@function
initialize:                             // @initialize
	.cfi_startproc
// %bb.0:
	str	x23, [sp, #-48]!                // 8-byte Folded Spill
	stp	x22, x21, [sp, #16]             // 16-byte Folded Spill
	stp	x20, x19, [sp, #32]             // 16-byte Folded Spill
	.cfi_def_cfa_offset 48
	.cfi_offset w19, -8
	.cfi_offset w20, -16
	.cfi_offset w21, -24
	.cfi_offset w22, -32
	.cfi_offset w23, -48
	sub	w8, w1, #1                      // =1
	subs	w9, w0, #1                      // =1
	fmov	d1, #2.00000000
	scvtf	d2, w9
	scvtf	d3, w8
	fdiv	d2, d1, d2
	fdiv	d1, d1, d3
	fcvt	s2, d2
	fcvt	s1, d1
	str	s2, [x2]
	str	s1, [x3]
	b.lt	.LBB3_12
// %bb.1:
	mov	w9, w1
	lsl	x13, x9, #2
	add	x15, x5, x13
	add	x14, x4, x13
	cmp	x15, x4
	fcvt	d6, s0
	cset	w16, hi
	cmp	x14, x5
	fneg	d6, d6
	cset	w17, hi
	mov	x8, xzr
	mov	w10, w0
	add	x11, x2, #1                     // =1
	add	x12, x3, #1                     // =1
	fmov	d0, #-1.00000000
	fmov	d1, #1.00000000
	index	z2.s, #0, #1
	ptrue	p0.d
	fmov	z3.d, #-1.00000000
	ptrue	p1.s
	mov	z4.s, #-1                       // =0xffffffffffffffff
	mov	z5.s, #0                        // =0x0
	mov	z7.d, d6
	whilelo	p2.s, xzr, x9
	and	w16, w16, w17
	fmov	z16.d, #1.00000000
	mov	x17, x5
	mov	x18, x4
	b	.LBB3_3
	.p2align	5
.LBB3_2:                                //   in Loop: Header=BB3_3 Depth=1
	add	x8, x8, #1                      // =1
	add	x18, x18, x13
	cmp	x8, x10
	add	x17, x17, x13
	b.eq	.LBB3_12
.LBB3_3:                                // =>This Loop Header: Depth=1
                                        //     Child Loop BB3_9 Depth 2
                                        //     Child Loop BB3_11 Depth 2
	cmp	w1, #1                          // =1
	b.lt	.LBB3_2
// %bb.4:                               //   in Loop: Header=BB3_3 Depth=1
	mul	x0, x8, x9
	sub	w6, w8, #1                      // =1
	lsl	x0, x0, #2
	scvtf	s17, w6
	add	x6, x4, x0
	add	x7, x14, x0
	cmp	x11, x6
	add	x21, x5, x0
	add	x22, x15, x0
	cset	w0, hi
	cmp	x7, x2
	cset	w19, hi
	cmp	x12, x6
	and	w6, w0, w19
	cset	w0, hi
	cmp	x7, x3
	cset	w19, hi
	cmp	x11, x21
	orr	w23, w16, w6
	cset	w6, hi
	cmp	x22, x2
	cset	w20, hi
	cmp	x12, x21
	cset	w7, hi
	cmp	x22, x3
	cset	w21, hi
	tbnz	w23, #0, .LBB3_10
// %bb.5:                               //   in Loop: Header=BB3_3 Depth=1
	and	w0, w0, w19
	tbnz	w0, #0, .LBB3_10
// %bb.6:                               //   in Loop: Header=BB3_3 Depth=1
	and	w0, w6, w20
	tbnz	w0, #0, .LBB3_10
// %bb.7:                               //   in Loop: Header=BB3_3 Depth=1
	and	w0, w7, w21
	tbnz	w0, #0, .LBB3_10
// %bb.8:                               //   in Loop: Header=BB3_3 Depth=1
	mov	x0, xzr
	mov	p3.b, p2.b
	mov	z18.d, z2.d
	.p2align	5
.LBB3_9:                                //   Parent Loop BB3_3 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldr	s19, [x2]
	ld1rw	{ z20.s }, p1/z, [x3]
	add	z21.s, z18.s, z4.s
	scvtf	z21.s, p1/m, z21.s
	fmul	s19, s19, s17
	st1w	{ z5.s }, p3, [x18, x0, lsl #2]
	fmul	z20.s, z20.s, z21.s
	mov	z19.s, s19
	zip2	z21.s, z20.s, z20.s
	zip1	z20.s, z20.s, z20.s
	zip2	z22.s, z19.s, z19.s
	zip1	z19.s, z19.s, z19.s
	fcvt	z21.d, p0/m, z21.s
	fcvt	z20.d, p0/m, z20.s
	fcvt	z22.d, p0/m, z22.s
	fcvt	z19.d, p0/m, z19.s
	fadd	z20.d, z20.d, z3.d
	fadd	z21.d, z21.d, z3.d
	fadd	z19.d, z19.d, z3.d
	fadd	z22.d, z22.d, z3.d
	fcvtzs	z21.d, p0/m, z21.d
	fcvtzs	z20.d, p0/m, z20.d
	fcvtzs	z22.d, p0/m, z22.d
	fcvtzs	z19.d, p0/m, z19.d
	uzp1	z20.s, z20.s, z21.s
	uzp1	z19.s, z19.s, z22.s
	movprfx	z21, z19
	mul	z21.s, p1/m, z21.s, z19.s
	movprfx	z19, z20
	mul	z19.s, p1/m, z19.s, z20.s
	sunpkhi	z20.d, z21.s
	sunpklo	z21.d, z21.s
	sunpklo	z22.d, z19.s
	sunpkhi	z19.d, z19.s
	scvtf	z20.d, p0/m, z20.d
	scvtf	z21.d, p0/m, z21.d
	scvtf	z22.d, p0/m, z22.d
	scvtf	z19.d, p0/m, z19.d
	fsub	z21.d, z16.d, z21.d
	fsub	z20.d, z16.d, z20.d
	fsub	z19.d, z16.d, z19.d
	fsub	z22.d, z16.d, z22.d
	fmul	z23.d, z20.d, z7.d
	fmul	z24.d, z21.d, z7.d
	fmul	z21.d, p0/m, z21.d, #2.0
	fmul	z20.d, p0/m, z20.d, #2.0
	fmul	z23.d, z23.d, z19.d
	fmul	z24.d, z24.d, z22.d
	fmul	z19.d, p0/m, z19.d, #2.0
	fmul	z22.d, p0/m, z22.d, #2.0
	fsub	z20.d, z23.d, z20.d
	fsub	z21.d, z24.d, z21.d
	fsub	z21.d, z21.d, z22.d
	fsub	z19.d, z20.d, z19.d
	fcvt	z19.s, p0/m, z19.d
	fcvt	z20.s, p0/m, z21.d
	uzp1	z19.s, z20.s, z19.s
	st1w	{ z19.s }, p3, [x17, x0, lsl #2]
	incw	x0
	whilelo	p3.s, x0, x9
	incw	z18.s
	b.mi	.LBB3_9
	b	.LBB3_2
	.p2align	5
.LBB3_10:                               //   in Loop: Header=BB3_3 Depth=1
	mov	x0, xzr
	.p2align	5
.LBB3_11:                               //   Parent Loop BB3_3 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldr	s18, [x2]
	ldr	s19, [x3]
	sub	w6, w0, #1                      // =1
	scvtf	s20, w6
	fmul	s18, s18, s17
	fmul	s19, s19, s20
	fcvt	d18, s18
	fcvt	d19, s19
	fadd	d18, d18, d0
	fadd	d19, d19, d0
	fcvtzs	w6, d18
	fcvtzs	w19, d19
	mul	w6, w6, w6
	mul	w19, w19, w19
	scvtf	d18, w6
	scvtf	d19, w19
	fsub	d18, d1, d18
	fsub	d19, d1, d19
	fmul	d20, d18, d6
	fadd	d18, d18, d18
	fmul	d20, d20, d19
	fadd	d19, d19, d19
	fsub	d18, d20, d18
	lsl	x7, x0, #2
	add	x0, x0, #1                      // =1
	fsub	d18, d18, d19
	fcvt	s18, d18
	cmp	x9, x0
	str	wzr, [x18, x7]
	str	s18, [x17, x7]
	b.ne	.LBB3_11
	b	.LBB3_2
.LBB3_12:
	ldp	x20, x19, [sp, #32]             // 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             // 16-byte Folded Reload
	ldr	x23, [sp], #48                  // 8-byte Folded Reload
	ret
.Lfunc_end3:
	.size	initialize, .Lfunc_end3-initialize
	.cfi_endproc
                                        // -- End function
	.globl	error_check                     // -- Begin function error_check
	.p2align	5
	.type	error_check,@function
error_check:                            // @error_check
	.cfi_startproc
// %bb.0:
	sub	sp, sp, #32                     // =32
	stp	x29, x30, [sp, #16]             // 16-byte Folded Spill
	add	x29, sp, #16                    // =16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	cmp	w0, #1                          // =1
	b.lt	.LBB4_6
// %bb.1:
	mov	w9, w1
	mov	x8, xzr
	mov	w10, w0
	mov	z2.s, s2
	fmov	s0, wzr
	fmov	s3, #-1.00000000
	fmov	d4, #1.00000000
	index	z5.s, #0, #1
	mov	z6.s, #-1                       // =0xffffffffffffffff
	ptrue	p0.s
	fmov	z7.s, #-1.00000000
	ptrue	p1.d
	whilelo	p2.s, xzr, x9
	lsl	x11, x9, #2
	fmov	z16.d, #1.00000000
	b	.LBB4_3
	.p2align	5
.LBB4_2:                                //   in Loop: Header=BB4_3 Depth=1
	add	x8, x8, #1                      // =1
	cmp	x8, x10
	add	x2, x2, x11
	b.eq	.LBB4_7
.LBB4_3:                                // =>This Loop Header: Depth=1
                                        //     Child Loop BB4_5 Depth 2
	cmp	w1, #1                          // =1
	b.lt	.LBB4_2
// %bb.4:                               //   in Loop: Header=BB4_3 Depth=1
	sub	w13, w8, #1                     // =1
	scvtf	s17, w13
	fmul	s17, s17, s1
	fadd	s17, s17, s3
	fmul	s17, s17, s17
	fcvt	d17, s17
	fsub	d17, d4, d17
	mov	x12, xzr
	mov	z17.d, d17
	mov	p3.b, p2.b
	mov	z18.d, z5.d
	.p2align	5
.LBB4_5:                                //   Parent Loop BB4_3 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	add	z19.s, z18.s, z6.s
	scvtf	z19.s, p0/m, z19.s
	fmul	z19.s, z2.s, z19.s
	ld1w	{ z20.s }, p3/z, [x2, x12, lsl #2]
	fadd	z19.s, z19.s, z7.s
	fmul	z19.s, z19.s, z19.s
	zip2	z22.s, z19.s, z19.s
	zip1	z19.s, z19.s, z19.s
	fcvt	z22.d, p1/m, z22.s
	fcvt	z19.d, p1/m, z19.s
	zip2	z21.s, z20.s, z20.s
	zip1	z20.s, z20.s, z20.s
	fsub	z19.d, z16.d, z19.d
	fsub	z22.d, z16.d, z22.d
	fcvt	z21.d, p1/m, z21.s
	fcvt	z20.d, p1/m, z20.s
	fmul	z22.d, z17.d, z22.d
	fmul	z19.d, z17.d, z19.d
	fsub	z19.d, z20.d, z19.d
	fsub	z20.d, z21.d, z22.d
	fcvt	z20.s, p1/m, z20.d
	fcvt	z19.s, p1/m, z19.d
	uzp1	z19.s, z19.s, z20.s
	incw	x12
	fmul	z19.s, z19.s, z19.s
	fadda	s0, p3, s0, z19.s
	whilelo	p3.s, x12, x9
	incw	z18.s
	b.mi	.LBB4_5
	b	.LBB4_2
.LBB4_6:
	fmov	s0, wzr
.LBB4_7:
	fcvt	d1, s0
	fsqrt	d0, d1
	fcmp	d0, d0
	b.vs	.LBB4_9
.LBB4_8:
	mul	w8, w1, w0
	scvtf	d1, w8
	ldp	x29, x30, [sp, #16]             // 16-byte Folded Reload
	fdiv	d0, d0, d1
	fcvt	s0, d0
	adrp	x0, .L.str.5
	fcvt	d0, s0
	add	x0, x0, :lo12:.L.str.5
	add	sp, sp, #32                     // =32
	b	printf
.LBB4_9:
	mov	v0.16b, v1.16b
	stur	w0, [x29, #-4]                  // 4-byte Folded Spill
	str	w1, [sp, #8]                    // 4-byte Folded Spill
	bl	sqrt
	ldr	w1, [sp, #8]                    // 4-byte Folded Reload
	ldur	w0, [x29, #-4]                  // 4-byte Folded Reload
	b	.LBB4_8
.Lfunc_end4:
	.size	error_check, .Lfunc_end4-error_check
	.cfi_endproc
                                        // -- End function
	.globl	main                            // -- Begin function main
	.p2align	5
	.type	main,@function
main:                                   // @main
	.cfi_startproc
// %bb.0:
	stp	d15, d14, [sp, #-160]!          // 16-byte Folded Spill
	stp	d13, d12, [sp, #16]             // 16-byte Folded Spill
	stp	d11, d10, [sp, #32]             // 16-byte Folded Spill
	stp	d9, d8, [sp, #48]               // 16-byte Folded Spill
	stp	x29, x30, [sp, #64]             // 16-byte Folded Spill
	stp	x28, x27, [sp, #80]             // 16-byte Folded Spill
	stp	x26, x25, [sp, #96]             // 16-byte Folded Spill
	stp	x24, x23, [sp, #112]            // 16-byte Folded Spill
	stp	x22, x21, [sp, #128]            // 16-byte Folded Spill
	stp	x20, x19, [sp, #144]            // 16-byte Folded Spill
	mov	x29, sp
	addvl	sp, sp, #-2
	sub	sp, sp, #48                     // =48
	.cfi_def_cfa w29, 160
	.cfi_offset w19, -8
	.cfi_offset w20, -16
	.cfi_offset w21, -24
	.cfi_offset w22, -32
	.cfi_offset w23, -40
	.cfi_offset w24, -48
	.cfi_offset w25, -56
	.cfi_offset w26, -64
	.cfi_offset w27, -72
	.cfi_offset w28, -80
	.cfi_offset w30, -88
	.cfi_offset w29, -96
	.cfi_offset b8, -104
	.cfi_offset b9, -112
	.cfi_offset b10, -120
	.cfi_offset b11, -128
	.cfi_offset b12, -136
	.cfi_offset b13, -144
	.cfi_offset b14, -152
	.cfi_offset b15, -160
	mov	w10, #27053
	mov	w11, #59135
	sub	w8, w0, #2                      // =2
	mov	w9, #256
	movk	w10, #15710, lsl #16
	movk	w11, #11995, lsl #16
	mov	w12, #1065353216
	mov	w13, #5000
	addvl	x14, x29, #-2
	cmp	w8, #5                          // =5
	stur	w9, [x14, #-20]
	stp	w10, w9, [sp, #20]
	stp	w12, w11, [sp, #12]
	str	w13, [sp, #8]
	b.hi	.LBB5_10
// %bb.1:
	adrp	x9, .LJTI5_0
	add	x9, x9, :lo12:.LJTI5_0
	adr	x10, .LBB5_2
	ldrb	w11, [x9, x8]
	add	x10, x10, x11, lsl #2
	mov	x19, x1
	br	x10
.LBB5_2:
	ldr	x0, [x19, #8]
	adrp	x1, .L.str.6
	sub	x2, x29, #20                    // =20
	add	x1, x1, :lo12:.L.str.6
	addvl	x2, x2, #-2
	bl	__isoc99_sscanf
	addvl	x8, x29, #-2
	ldur	w8, [x8, #-20]
	str	w8, [sp, #24]
	b	.LBB5_10
.LBB5_3:
	ldr	x0, [x19, #8]
	adrp	x20, .L.str.6
	add	x20, x20, :lo12:.L.str.6
	sub	x2, x29, #20                    // =20
	addvl	x2, x2, #-2
	mov	x1, x20
	bl	__isoc99_sscanf
	ldr	x0, [x19, #16]
	add	x2, sp, #24                     // =24
	b	.LBB5_8
.LBB5_4:
	ldr	x0, [x19, #8]
	adrp	x20, .L.str.6
	add	x20, x20, :lo12:.L.str.6
	sub	x2, x29, #20                    // =20
	addvl	x2, x2, #-2
	mov	x1, x20
	bl	__isoc99_sscanf
	ldr	x0, [x19, #16]
	add	x2, sp, #24                     // =24
	mov	x1, x20
	bl	__isoc99_sscanf
	ldr	x0, [x19, #24]
	adrp	x1, .L.str.7
	add	x1, x1, :lo12:.L.str.7
	add	x2, sp, #20                     // =20
	b	.LBB5_9
.LBB5_5:
	ldr	x0, [x19, #8]
	adrp	x20, .L.str.6
	add	x20, x20, :lo12:.L.str.6
	sub	x2, x29, #20                    // =20
	addvl	x2, x2, #-2
	mov	x1, x20
	bl	__isoc99_sscanf
	ldr	x0, [x19, #16]
	add	x2, sp, #24                     // =24
	mov	x1, x20
	bl	__isoc99_sscanf
	ldr	x0, [x19, #24]
	adrp	x20, .L.str.7
	add	x20, x20, :lo12:.L.str.7
	add	x2, sp, #20                     // =20
	mov	x1, x20
	bl	__isoc99_sscanf
	ldr	x0, [x19, #32]
	add	x2, sp, #16                     // =16
	b	.LBB5_8
.LBB5_6:
	ldr	x0, [x19, #8]
	adrp	x20, .L.str.6
	add	x20, x20, :lo12:.L.str.6
	sub	x2, x29, #20                    // =20
	addvl	x2, x2, #-2
	mov	x1, x20
	bl	__isoc99_sscanf
	ldr	x0, [x19, #16]
	add	x2, sp, #24                     // =24
	mov	x1, x20
	bl	__isoc99_sscanf
	ldr	x0, [x19, #24]
	adrp	x20, .L.str.7
	add	x20, x20, :lo12:.L.str.7
	add	x2, sp, #20                     // =20
	mov	x1, x20
	bl	__isoc99_sscanf
	ldr	x0, [x19, #32]
	add	x2, sp, #16                     // =16
	mov	x1, x20
	bl	__isoc99_sscanf
	ldr	x0, [x19, #40]
	add	x2, sp, #12                     // =12
	b	.LBB5_8
.LBB5_7:
	ldr	x0, [x19, #8]
	adrp	x20, .L.str.6
	add	x20, x20, :lo12:.L.str.6
	sub	x2, x29, #20                    // =20
	addvl	x2, x2, #-2
	mov	x1, x20
	bl	__isoc99_sscanf
	ldr	x0, [x19, #16]
	add	x2, sp, #24                     // =24
	mov	x1, x20
	bl	__isoc99_sscanf
	ldr	x0, [x19, #24]
	adrp	x21, .L.str.7
	add	x21, x21, :lo12:.L.str.7
	add	x2, sp, #20                     // =20
	mov	x1, x21
	bl	__isoc99_sscanf
	ldr	x0, [x19, #32]
	add	x2, sp, #16                     // =16
	mov	x1, x21
	bl	__isoc99_sscanf
	ldr	x0, [x19, #40]
	add	x2, sp, #12                     // =12
	mov	x1, x21
	bl	__isoc99_sscanf
	ldr	x0, [x19, #48]
	add	x2, sp, #8                      // =8
.LBB5_8:
	mov	x1, x20
.LBB5_9:
	bl	__isoc99_sscanf
.LBB5_10:
	addvl	x8, x29, #-2
	ldp	s1, s0, [sp, #16]
	ldr	s2, [sp, #12]
	ldur	w1, [x8, #-20]
	ldr	w2, [sp, #24]
	ldr	w3, [sp, #8]
	adrp	x0, .L.str.8
	fcvt	d0, s0
	fcvt	d1, s1
	fcvt	d2, s2
	add	x0, x0, :lo12:.L.str.8
	bl	printf
	adrp	x0, .Lstr
	add	x0, x0, :lo12:.Lstr
	bl	puts
	addvl	x8, x29, #-2
	ldr	w22, [sp, #24]
	ldursw	x25, [x8, #-20]
	sxtw	x8, w22
	mul	x8, x25, x8
	lsl	x24, x8, #2
	mov	x0, x24
	and	x23, x25, #0xffffffff
	bl	malloc
	mov	x20, x0
	mov	x0, x24
	bl	malloc
	mov	x19, x0
	mov	x0, x24
	bl	malloc
	ldr	s8, [sp, #20]
	sub	w8, w22, #1                     // =1
	subs	w9, w25, #1                     // =1
	fmov	d13, #2.00000000
	scvtf	d0, w9
	scvtf	d1, w8
	fdiv	d0, d13, d0
	fdiv	d1, d13, d1
	mov	x21, x0
	fmov	d12, #-1.00000000
	fmov	d11, #1.00000000
	rdvl	x26, #1
	mov	z7.s, #-1                       // =0xffffffffffffffff
	ptrue	p1.s
	ptrue	p2.d
	fmov	z17.d, #-1.00000000
	fmov	z16.d, #1.00000000
	fcvt	s10, d0
	fcvt	s9, d1
	mov	z18.b, #0                       // =0x0
	b.lt	.LBB5_20
// %bb.11:
	fcvt	d0, s8
	mov	x27, xzr
	lsl	x25, x22, #2
	whilelo	p3.s, xzr, x22
	mov	z19.s, s9
	fneg	d14, d0
	index	z20.s, #0, #1
	mov	x28, x21
	str	p3, [x29, #-8, mul vl]          // 2-byte Folded Spill
	str	z19, [x29, #-2, mul vl]         // 16-byte Folded Spill
	b	.LBB5_13
	.p2align	5
.LBB5_12:                               //   in Loop: Header=BB5_13 Depth=1
	add	x27, x27, #1                    // =1
	cmp	x27, x23
	add	x28, x28, x25
	b.eq	.LBB5_20
.LBB5_13:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB5_17 Depth 2
                                        //     Child Loop BB5_19 Depth 2
	cmp	w22, #1                         // =1
	b.lt	.LBB5_12
// %bb.14:                              //   in Loop: Header=BB5_13 Depth=1
	sub	w8, w27, #1                     // =1
	scvtf	s0, w8
	fmul	s0, s10, s0
	fcvt	d0, s0
	fadd	d0, d0, d12
	fcvtzs	w8, d0
	mul	w8, w8, w8
	scvtf	d0, w8
	madd	x0, x25, x27, x20
	cmp	x26, #17                        // =17
	fsub	d15, d11, d0
	b.hs	.LBB5_16
// %bb.15:                              //   in Loop: Header=BB5_13 Depth=1
	mov	w1, wzr
	mov	x2, x25
	bl	memset
	ldr	z19, [x29, #-2, mul vl]         // 16-byte Folded Reload
	ldr	p3, [x29, #-8, mul vl]          // 2-byte Folded Reload
	index	z20.s, #0, #1
	mov	z18.b, #0                       // =0x0
	fmov	z17.d, #-1.00000000
	fmov	z16.d, #1.00000000
	ptrue	p2.d
	ptrue	p1.s
	mov	z7.s, #-1                       // =0xffffffffffffffff
	b	.LBB5_18
	.p2align	5
.LBB5_16:                               //   in Loop: Header=BB5_13 Depth=1
	mov	x8, xzr
	whilelo	p0.b, xzr, x25
	.p2align	5
.LBB5_17:                               //   Parent Loop BB5_13 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	st1b	{ z18.b }, p0, [x0, x8]
	incp	x8, p0.b
	whilelo	p0.b, x8, x25
	b.mi	.LBB5_17
.LBB5_18:                               //   in Loop: Header=BB5_13 Depth=1
	fadd	d1, d15, d15
	fmul	d0, d15, d14
	mov	x8, xzr
	mov	z0.d, d0
	mov	z1.d, d1
	mov	p0.b, p3.b
	mov	z2.d, z20.d
	.p2align	5
.LBB5_19:                               //   Parent Loop BB5_13 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	add	z3.s, z2.s, z7.s
	scvtf	z3.s, p1/m, z3.s
	fmul	z3.s, z19.s, z3.s
	zip2	z4.s, z3.s, z3.s
	zip1	z3.s, z3.s, z3.s
	fcvt	z4.d, p2/m, z4.s
	fcvt	z3.d, p2/m, z3.s
	fadd	z3.d, z3.d, z17.d
	fadd	z4.d, z4.d, z17.d
	fcvtzs	z4.d, p2/m, z4.d
	fcvtzs	z3.d, p2/m, z3.d
	uzp1	z3.s, z3.s, z4.s
	movprfx	z4, z3
	mul	z4.s, p1/m, z4.s, z3.s
	sunpklo	z3.d, z4.s
	sunpkhi	z4.d, z4.s
	scvtf	z3.d, p2/m, z3.d
	scvtf	z4.d, p2/m, z4.d
	fsub	z4.d, z16.d, z4.d
	fsub	z3.d, z16.d, z3.d
	fmul	z5.d, z0.d, z3.d
	fmul	z6.d, z0.d, z4.d
	fmul	z4.d, p2/m, z4.d, #2.0
	fmul	z3.d, p2/m, z3.d, #2.0
	fsub	z6.d, z6.d, z1.d
	fsub	z5.d, z5.d, z1.d
	fsub	z3.d, z5.d, z3.d
	fsub	z4.d, z6.d, z4.d
	fcvt	z4.s, p2/m, z4.d
	fcvt	z3.s, p2/m, z3.d
	uzp1	z3.s, z3.s, z4.s
	st1w	{ z3.s }, p0, [x28, x8, lsl #2]
	incw	x8
	whilelo	p0.s, x8, x22
	incw	z2.s
	b.mi	.LBB5_19
	b	.LBB5_12
.LBB5_20:
	cmp	x26, #17                        // =17
	b.hs	.LBB5_22
// %bb.21:
	mov	x0, x19
	mov	x1, x20
	mov	x2, x24
	bl	memcpy
	b	.LBB5_24
.LBB5_22:
	mov	x8, xzr
	whilelo	p0.b, xzr, x24
	.p2align	5
.LBB5_23:                               // =>This Inner Loop Header: Depth=1
	ld1b	{ z0.b }, p0/z, [x20, x8]
	st1b	{ z0.b }, p0, [x19, x8]
	incp	x8, p0.b
	whilelo	p0.b, x8, x24
	b.mi	.LBB5_23
.LBB5_24:
	ldp	s3, s4, [sp, #12]
	ldr	w4, [sp, #8]
	mov	w0, w23
	mov	w1, w22
	mov	v0.16b, v10.16b
	mov	v1.16b, v9.16b
	mov	v2.16b, v8.16b
	mov	x2, x20
	mov	x3, x21
	bl	jacobi_seq
	addvl	x8, x29, #-2
	ldur	w0, [x8, #-20]
	ldr	w1, [sp, #24]
	ldp	s4, s2, [sp, #16]
	ldr	s3, [sp, #12]
	ldr	w4, [sp, #8]
	mov	v0.16b, v10.16b
	mov	v1.16b, v9.16b
	mov	x2, x19
	mov	x3, x21
	bl	jacobi_omp
	ldr	w23, [sp, #24]
	addvl	x8, x29, #-2
	ldur	w24, [x8, #-20]
	mov	z7.s, #-1                       // =0xffffffffffffffff
	sub	w8, w23, #1                     // =1
	scvtf	d1, w8
	subs	w9, w24, #1                     // =1
	scvtf	d0, w9
	fdiv	d1, d13, d1
	fdiv	d0, d13, d0
	fcvt	s9, d1
	fcvt	s8, d0
	mov	z17.s, s9
	ptrue	p1.s
	ptrue	p2.d
	fmov	z16.d, #1.00000000
	str	z17, [x29, #-1, mul vl]         // 16-byte Folded Spill
	b.lt	.LBB5_34
// %bb.25:
	ldr	s0, [sp, #20]
	mov	x25, xzr
	lsl	x22, x23, #2
	whilelo	p3.s, xzr, x23
	fcvt	d0, s0
	fneg	d10, d0
	index	z20.s, #0, #1
	mov	x27, x21
	fmov	z18.d, #-1.00000000
	mov	z19.b, #0                       // =0x0
	str	p3, [x29, #-16, mul vl]         // 2-byte Folded Spill
	b	.LBB5_27
	.p2align	5
.LBB5_26:                               //   in Loop: Header=BB5_27 Depth=1
	add	x25, x25, #1                    // =1
	cmp	x25, x24
	add	x27, x27, x22
	b.eq	.LBB5_34
.LBB5_27:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB5_31 Depth 2
                                        //     Child Loop BB5_33 Depth 2
	cmp	w23, #1                         // =1
	b.lt	.LBB5_26
// %bb.28:                              //   in Loop: Header=BB5_27 Depth=1
	sub	w8, w25, #1                     // =1
	scvtf	s0, w8
	fmul	s0, s8, s0
	fcvt	d0, s0
	fadd	d0, d0, d12
	fcvtzs	w8, d0
	mul	w8, w8, w8
	scvtf	d0, w8
	madd	x0, x22, x25, x20
	cmp	x26, #17                        // =17
	fsub	d13, d11, d0
	b.hs	.LBB5_30
// %bb.29:                              //   in Loop: Header=BB5_27 Depth=1
	mov	w1, wzr
	mov	x2, x22
	bl	memset
	ldr	p3, [x29, #-16, mul vl]         // 2-byte Folded Reload
	ldr	z17, [x29, #-1, mul vl]         // 16-byte Folded Reload
	index	z20.s, #0, #1
	mov	z19.b, #0                       // =0x0
	fmov	z18.d, #-1.00000000
	fmov	z16.d, #1.00000000
	ptrue	p2.d
	ptrue	p1.s
	mov	z7.s, #-1                       // =0xffffffffffffffff
	b	.LBB5_32
	.p2align	5
.LBB5_30:                               //   in Loop: Header=BB5_27 Depth=1
	mov	x8, xzr
	whilelo	p0.b, xzr, x22
	.p2align	5
.LBB5_31:                               //   Parent Loop BB5_27 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	st1b	{ z19.b }, p0, [x0, x8]
	incp	x8, p0.b
	whilelo	p0.b, x8, x22
	b.mi	.LBB5_31
.LBB5_32:                               //   in Loop: Header=BB5_27 Depth=1
	fadd	d1, d13, d13
	fmul	d0, d13, d10
	mov	x8, xzr
	mov	z0.d, d0
	mov	z1.d, d1
	mov	p0.b, p3.b
	mov	z2.d, z20.d
	.p2align	5
.LBB5_33:                               //   Parent Loop BB5_27 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	add	z3.s, z2.s, z7.s
	scvtf	z3.s, p1/m, z3.s
	fmul	z3.s, z17.s, z3.s
	zip2	z4.s, z3.s, z3.s
	zip1	z3.s, z3.s, z3.s
	fcvt	z4.d, p2/m, z4.s
	fcvt	z3.d, p2/m, z3.s
	fadd	z3.d, z3.d, z18.d
	fadd	z4.d, z4.d, z18.d
	fcvtzs	z4.d, p2/m, z4.d
	fcvtzs	z3.d, p2/m, z3.d
	uzp1	z3.s, z3.s, z4.s
	movprfx	z4, z3
	mul	z4.s, p1/m, z4.s, z3.s
	sunpklo	z3.d, z4.s
	sunpkhi	z4.d, z4.s
	scvtf	z3.d, p2/m, z3.d
	scvtf	z4.d, p2/m, z4.d
	fsub	z4.d, z16.d, z4.d
	fsub	z3.d, z16.d, z3.d
	fmul	z5.d, z0.d, z3.d
	fmul	z6.d, z0.d, z4.d
	fmul	z4.d, p2/m, z4.d, #2.0
	fmul	z3.d, p2/m, z3.d, #2.0
	fsub	z6.d, z6.d, z1.d
	fsub	z5.d, z5.d, z1.d
	fsub	z3.d, z5.d, z3.d
	fsub	z4.d, z6.d, z4.d
	fcvt	z4.s, p2/m, z4.d
	fcvt	z3.s, p2/m, z3.d
	uzp1	z3.s, z3.s, z4.s
	st1w	{ z3.s }, p0, [x27, x8, lsl #2]
	incw	x8
	whilelo	p0.s, x8, x23
	incw	z2.s
	b.mi	.LBB5_33
	b	.LBB5_26
.LBB5_34:
	sxtw	x8, w24
	sxtw	x9, w23
	mul	x8, x8, x9
	cmp	x26, #17                        // =17
	lsl	x2, x8, #2
	b.hs	.LBB5_36
// %bb.35:
	mov	x0, x19
	mov	x1, x20
	bl	memcpy
	b	.LBB5_38
.LBB5_36:
	mov	x8, xzr
	whilelo	p0.b, xzr, x2
	.p2align	5
.LBB5_37:                               // =>This Inner Loop Header: Depth=1
	ld1b	{ z0.b }, p0/z, [x20, x8]
	st1b	{ z0.b }, p0, [x19, x8]
	incp	x8, p0.b
	whilelo	p0.b, x8, x2
	b.mi	.LBB5_37
.LBB5_38:
	mov	x23, #70368744177664
	fmov	d12, xzr
	mov	w22, #20
	movk	x23, #16527, lsl #48
	.p2align	5
.LBB5_39:                               // =>This Inner Loop Header: Depth=1
	sub	x0, x29, #16                    // =16
	addvl	x0, x0, #-2
	bl	ftime
	addvl	x8, x29, #-2
	ldur	d0, [x8, #-16]
	addvl	x8, x29, #-2
	ldur	h1, [x8, #-8]
	addvl	x8, x29, #-2
	ldur	w0, [x8, #-20]
	ldr	w1, [sp, #24]
	ldp	s4, s2, [sp, #16]
	ldr	s3, [sp, #12]
	ldr	w4, [sp, #8]
	fmov	d10, x23
	scvtf	d0, d0
	fmul	d0, d0, d10
	ucvtf	d1, d1
	fadd	d13, d0, d1
	mov	v0.16b, v8.16b
	mov	v1.16b, v9.16b
	mov	x2, x20
	mov	x3, x21
	bl	jacobi_seq
	sub	x0, x29, #16                    // =16
	addvl	x0, x0, #-2
	bl	ftime
	addvl	x8, x29, #-2
	ldur	d0, [x8, #-16]
	addvl	x8, x29, #-2
	ldur	h1, [x8, #-8]
	subs	w22, w22, #1                    // =1
	scvtf	d0, d0
	fmul	d0, d0, d10
	ucvtf	d1, d1
	fadd	d0, d0, d1
	fsub	d0, d0, d13
	fadd	d12, d12, d0
	b.ne	.LBB5_39
// %bb.40:
	fmov	d10, #20.00000000
	adrp	x0, .L.str.10
	fdiv	d0, d12, d10
	add	x0, x0, :lo12:.L.str.10
	bl	printf
	adrp	x0, .L.str.11
	add	x0, x0, :lo12:.L.str.11
	bl	puts
	mov	x23, #70368744177664
	fmov	d12, xzr
	mov	w22, #20
	movk	x23, #16527, lsl #48
	.p2align	5
.LBB5_41:                               // =>This Inner Loop Header: Depth=1
	sub	x0, x29, #16                    // =16
	addvl	x0, x0, #-2
	bl	ftime
	addvl	x8, x29, #-2
	ldur	d0, [x8, #-16]
	addvl	x8, x29, #-2
	ldur	h1, [x8, #-8]
	addvl	x8, x29, #-2
	ldur	w0, [x8, #-20]
	ldr	w1, [sp, #24]
	ldp	s4, s2, [sp, #16]
	ldr	s3, [sp, #12]
	ldr	w4, [sp, #8]
	fmov	d13, x23
	scvtf	d0, d0
	fmul	d0, d0, d13
	ucvtf	d1, d1
	fadd	d14, d0, d1
	mov	v0.16b, v8.16b
	mov	v1.16b, v9.16b
	mov	x2, x19
	mov	x3, x21
	bl	jacobi_omp
	sub	x0, x29, #16                    // =16
	addvl	x0, x0, #-2
	bl	ftime
	addvl	x8, x29, #-2
	ldur	d0, [x8, #-16]
	addvl	x8, x29, #-2
	ldur	h1, [x8, #-8]
	subs	w22, w22, #1                    // =1
	scvtf	d0, d0
	fmul	d0, d0, d13
	ucvtf	d1, d1
	fadd	d0, d0, d1
	fsub	d0, d0, d14
	fadd	d12, d12, d0
	b.ne	.LBB5_41
// %bb.42:
	adrp	x0, .L.str.12
	fdiv	d0, d12, d10
	add	x0, x0, :lo12:.L.str.12
	bl	printf
	addvl	x8, x29, #-2
	ldur	w22, [x8, #-20]
	ldr	w23, [sp, #24]
	cmp	w22, #1                         // =1
	b.lt	.LBB5_48
// %bb.43:
	ldr	z19, [x29, #-1, mul vl]         // 16-byte Folded Reload
	mov	x8, xzr
	whilelo	p0.s, xzr, x23
	lsl	x9, x23, #2
	fmov	s0, wzr
	fmov	s1, #-1.00000000
	fmov	z2.s, #-1.00000000
	mov	x10, x20
	mov	z17.s, #-1                      // =0xffffffffffffffff
	ptrue	p2.s
	ptrue	p3.d
	fmov	z18.d, #1.00000000
	index	z20.s, #0, #1
	b	.LBB5_45
	.p2align	5
.LBB5_44:                               //   in Loop: Header=BB5_45 Depth=1
	add	x8, x8, #1                      // =1
	cmp	x8, x22
	add	x10, x10, x9
	b.eq	.LBB5_49
.LBB5_45:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB5_47 Depth 2
	cmp	w23, #1                         // =1
	b.lt	.LBB5_44
// %bb.46:                              //   in Loop: Header=BB5_45 Depth=1
	sub	w12, w8, #1                     // =1
	scvtf	s3, w12
	fmul	s3, s8, s3
	fadd	s3, s3, s1
	fmul	s3, s3, s3
	fcvt	d3, s3
	fsub	d3, d11, d3
	mov	x11, xzr
	mov	z3.d, d3
	mov	p1.b, p0.b
	mov	z4.d, z20.d
	.p2align	5
.LBB5_47:                               //   Parent Loop BB5_45 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	add	z5.s, z4.s, z17.s
	scvtf	z5.s, p2/m, z5.s
	fmul	z5.s, z19.s, z5.s
	ld1w	{ z6.s }, p1/z, [x10, x11, lsl #2]
	fadd	z5.s, z5.s, z2.s
	fmul	z5.s, z5.s, z5.s
	zip2	z16.s, z5.s, z5.s
	zip1	z5.s, z5.s, z5.s
	fcvt	z16.d, p3/m, z16.s
	fcvt	z5.d, p3/m, z5.s
	zip2	z7.s, z6.s, z6.s
	zip1	z6.s, z6.s, z6.s
	fsub	z5.d, z18.d, z5.d
	fsub	z16.d, z18.d, z16.d
	fcvt	z7.d, p3/m, z7.s
	fcvt	z6.d, p3/m, z6.s
	fmul	z16.d, z3.d, z16.d
	fmul	z5.d, z3.d, z5.d
	fsub	z5.d, z6.d, z5.d
	fsub	z6.d, z7.d, z16.d
	fcvt	z6.s, p3/m, z6.d
	fcvt	z5.s, p3/m, z5.d
	uzp1	z5.s, z5.s, z6.s
	incw	x11
	fmul	z5.s, z5.s, z5.s
	fadda	s0, p1, s0, z5.s
	whilelo	p1.s, x11, x23
	incw	z4.s
	b.mi	.LBB5_47
	b	.LBB5_44
.LBB5_48:
	fmov	s0, wzr
.LBB5_49:
	fcvt	d1, s0
	fsqrt	d0, d1
	fcmp	d0, d0
	b.vs	.LBB5_51
.LBB5_50:
	mul	w8, w23, w22
	scvtf	d1, w8
	fdiv	d0, d0, d1
	fcvt	s0, d0
	adrp	x0, .L.str.5
	fcvt	d0, s0
	add	x0, x0, :lo12:.L.str.5
	bl	printf
	mov	x0, x20
	bl	free
	mov	x0, x21
	bl	free
	mov	x0, x19
	bl	free
	mov	w0, wzr
	addvl	sp, sp, #2
	add	sp, sp, #48                     // =48
	ldp	x20, x19, [sp, #144]            // 16-byte Folded Reload
	ldp	x22, x21, [sp, #128]            // 16-byte Folded Reload
	ldp	x24, x23, [sp, #112]            // 16-byte Folded Reload
	ldp	x26, x25, [sp, #96]             // 16-byte Folded Reload
	ldp	x28, x27, [sp, #80]             // 16-byte Folded Reload
	ldp	x29, x30, [sp, #64]             // 16-byte Folded Reload
	ldp	d9, d8, [sp, #48]               // 16-byte Folded Reload
	ldp	d11, d10, [sp, #32]             // 16-byte Folded Reload
	ldp	d13, d12, [sp, #16]             // 16-byte Folded Reload
	ldp	d15, d14, [sp], #160            // 16-byte Folded Reload
	ret
.LBB5_51:
	mov	v0.16b, v1.16b
	bl	sqrt
	b	.LBB5_50
.Lfunc_end5:
	.size	main, .Lfunc_end5-main
	.cfi_endproc
	.section	.rodata,"a",@progbits
.LJTI5_0:
	.byte	(.LBB5_2-.LBB5_2)>>2
	.byte	(.LBB5_3-.LBB5_2)>>2
	.byte	(.LBB5_4-.LBB5_2)>>2
	.byte	(.LBB5_5-.LBB5_2)>>2
	.byte	(.LBB5_6-.LBB5_2)>>2
	.byte	(.LBB5_7-.LBB5_2)>>2
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

	.type	.Lstr,@object                   // @str
.Lstr:
	.asciz	"------------------------------------------------------------------------------------------------------"
	.size	.Lstr, 103

	.ident	"Arm C/C++/Fortran Compiler version 21.0 (build number 879) (based on LLVM 11.0.0)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym _ZGVsMxv_sqrt
