	.text
	.file	"jacobi_double.c"
	.globl	jacobi_seq                      // -- Begin function jacobi_seq
	.p2align	5
	.type	jacobi_seq,@function
jacobi_seq:                             // @jacobi_seq
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
	addvl	sp, sp, #-6
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
	.cfi_offset b14, -152
	.cfi_offset b15, -160
	umull	x8, w1, w0
	lsl	x8, x8, #2
	add	x8, x8, #15                     // =15
	and	x8, x8, #0xfffffffffffffff0
	mov	x9, sp
	mov	v9.16b, v3.16b
	mov	w22, w1
	sub	x17, x9, x8
	mov	sp, x17
	fmov	s3, #10.00000000
	fmul	s15, s4, s3
	fcmp	s15, s4
	mov	w1, #1
	b.le	.LBB0_25
// %bb.1:
	cmp	w4, #1                          // =1
	b.lt	.LBB0_25
// %bb.2:
	fmul	s0, s0, s0
	fmul	s1, s1, s1
	frecpe	s6, s0
	fcvt	d3, s0
	frecpe	s7, s1
	frecps	s19, s0, s6
	mov	v8.16b, v4.16b
	mul	w8, w22, w0
	fcvt	d4, s1
	frecpe	d16, d3
	fmul	s6, s6, s19
	frecps	s19, s1, s7
	scvtf	d5, w8
	frecpe	d17, d4
	fmul	s7, s7, s19
	frecps	d19, d3, d16
	frecpe	d18, d5
	fmul	d16, d16, d19
	frecps	d19, d4, d17
	fmul	d17, d17, d19
	frecps	d19, d5, d18
	fmul	d18, d18, d19
	mov	z19.s, s0
	frecps	s0, s0, s6
	fmul	s10, s6, s0
	mov	z0.s, s1
	frecps	s1, s1, s7
	fmul	s11, s7, s1
	frecps	d1, d3, d16
	fmul	d1, d16, d1
	frecps	d6, d4, d17
	frecps	d7, d5, d18
	fmul	d6, d17, d6
	fmul	d7, d18, d7
	frecps	d3, d3, d1
	sub	w8, w22, #1                     // =1
	sub	w9, w0, #1                      // =1
	fmul	d1, d1, d3
	frecps	d3, d4, d6
	frecps	d4, d5, d7
	str	x9, [x19, #24]                  // 8-byte Folded Spill
	mov	z5.s, s9
	mov	w10, #-1
	lsl	x11, x8, #2
	add	x13, x2, #4                     // =4
	str	z5, [x29, #-2, mul vl]          // 16-byte Folded Spill
	fmov	z5.s, #1.00000000
	ptrue	p1.s
	cntw	x9
	add	x12, x3, x11
	incw	x10
	add	x5, x3, #4                      // =4
	cmp	x13, x12
	sub	x23, x8, #1                     // =1
	sub	x3, x8, #2                      // =2
	mvn	x25, x9
	add	x8, x2, x11
	fdivr	z0.s, p1/m, z0.s, z5.s
	sxtw	x9, w10
	fmul	d12, d7, d4
	str	x13, [x19, #16]                 // 8-byte Folded Spill
	movprfx	z7, z5
	fdiv	z7.s, p1/m, z7.s, z19.s
	str	z7, [x29, #-3, mul vl]          // 16-byte Folded Spill
	str	z0, [x29, #-4, mul vl]          // 16-byte Folded Spill
	mov	z0.s, w9
	cset	w9, lo
	cmp	x5, x8
	fmul	d3, d6, d3
	fcvt	d2, s2
	fmov	d4, #2.00000000
	index	z6.s, #0, #1
	cset	w8, lo
	whilelo	p0.s, xzr, x23
	str	p0, [x29, #-1, mul vl]          // 2-byte Folded Spill
	cmpeq	p0.s, p1/z, z6.s, z0.s
	fnmadd	d0, d1, d4, d2
	fadd	d1, d3, d3
	fsub	d0, d0, d1
	and	w8, w9, w8
	addvl	x9, x29, #-6
	fcvt	s13, d0
	str	p0, [x29, #-2, mul vl]          // 2-byte Folded Spill
	stur	w8, [x9, #-4]                   // 4-byte Folded Spill
	frecpe	s0, s13
	mov	z2.s, s13
	frecps	s1, s13, s0
	str	z2, [x29, #-5, mul vl]          // 16-byte Folded Spill
	fdivr	z2.s, p1/m, z2.s, z5.s
	addvl	x8, x29, #-6
	str	z2, [x29, #-6, mul vl]          // 16-byte Folded Spill
	fmul	s0, s0, s1
	stur	w4, [x8, #-20]                  // 4-byte Folded Spill
	addvl	x8, x29, #-6
	mov	w27, w22
	frecps	s1, s13, s0
	stur	w0, [x8, #-24]                  // 4-byte Folded Spill
	addvl	x8, x29, #-6
	mov	w26, w0
	add	x6, x17, #4                     // =4
	add	x7, x17, #8                     // =8
	mov	w21, #1
	rdvl	x20, #1
	lsl	x24, x27, #2
	fmul	s14, s0, s1
	mov	x28, #2
	stur	x5, [x8, #-32]                  // 8-byte Folded Spill
	addvl	x8, x29, #-6
	stur	x6, [x8, #-40]                  // 8-byte Folded Spill
	stp	x3, x7, [x19, #40]              // 16-byte Folded Spill
	str	x25, [x19, #32]                 // 8-byte Folded Spill
	.p2align	5
.LBB0_3:                                // =>This Loop Header: Depth=1
                                        //     Child Loop BB0_7 Depth 2
                                        //       Child Loop BB0_10 Depth 3
                                        //     Child Loop BB0_16 Depth 2
                                        //       Child Loop BB0_21 Depth 3
                                        //       Child Loop BB0_19 Depth 3
	cmp	w0, #1                          // =1
	b.lt	.LBB0_12
// %bb.4:                               //   in Loop: Header=BB0_3 Depth=1
	addvl	x8, x29, #-6
	mov	x25, xzr
	stur	x21, [x8, #-16]                 // 8-byte Folded Spill
	b	.LBB0_7
	.p2align	5
.LBB0_5:                                //   in Loop: Header=BB0_7 Depth=2
	mov	x28, x2
	mov	x2, x24
	mov	x21, x27
	mov	w27, w22
	mov	x22, x26
	mov	x26, x20
	mov	x20, x17
	bl	memcpy
	ptrue	p1.s
	mov	x17, x20
	mov	x20, x26
	mov	x2, x28
	mov	x28, #2
	mov	x26, x22
	mov	w22, w27
	mov	x27, x21
.LBB0_6:                                //   in Loop: Header=BB0_7 Depth=2
	add	x25, x25, #1                    // =1
	cmp	x25, x26
	b.eq	.LBB0_11
.LBB0_7:                                //   Parent Loop BB0_3 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB0_10 Depth 3
	cmp	w22, #1                         // =1
	b.lt	.LBB0_6
// %bb.8:                               //   in Loop: Header=BB0_7 Depth=2
	mul	x8, x25, x27
	lsl	x8, x8, #2
	cmp	x20, #17                        // =17
	add	x1, x2, x8
	add	x0, x17, x8
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
	addvl	x8, x29, #-6
	ldur	w4, [x8, #-20]                  // 4-byte Folded Reload
	addvl	x8, x29, #-6
	ldur	w0, [x8, #-24]                  // 4-byte Folded Reload
	addvl	x8, x29, #-6
	ldur	x5, [x8, #-32]                  // 8-byte Folded Reload
	addvl	x8, x29, #-6
	ldur	x6, [x8, #-40]                  // 8-byte Folded Reload
	addvl	x8, x29, #-6
	ldp	x3, x7, [x19, #40]              // 16-byte Folded Reload
	ldur	x21, [x8, #-16]                 // 8-byte Folded Reload
	ldr	x25, [x19, #32]                 // 8-byte Folded Reload
.LBB0_12:                               //   in Loop: Header=BB0_3 Depth=1
	cmp	w0, #3                          // =3
	fmov	s0, wzr
	b.lt	.LBB0_23
// %bb.13:                              //   in Loop: Header=BB0_3 Depth=1
	ldp	x1, x18, [x19, #16]             // 16-byte Folded Reload
	ldr	z6, [x29, #-2, mul vl]          // 16-byte Folded Reload
	ldr	z16, [x29, #-3, mul vl]         // 16-byte Folded Reload
	ldr	z17, [x29, #-4, mul vl]         // 16-byte Folded Reload
	ldr	z18, [x29, #-5, mul vl]         // 16-byte Folded Reload
	ldr	z19, [x29, #-6, mul vl]         // 16-byte Folded Reload
	fmov	s0, wzr
	mov	w11, #1
	mov	z7.s, #0                        // =0x0
	b	.LBB0_16
	.p2align	5
.LBB0_14:                               //   in Loop: Header=BB0_16 Depth=2
	add	x8, x11, #1                     // =1
.LBB0_15:                               //   in Loop: Header=BB0_16 Depth=2
	cmp	x8, x18
	mov	x11, x8
	b.eq	.LBB0_23
.LBB0_16:                               //   Parent Loop BB0_3 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB0_21 Depth 3
                                        //       Child Loop BB0_19 Depth 3
	cmp	w22, #2                         // =2
	b.le	.LBB0_14
// %bb.17:                              //   in Loop: Header=BB0_16 Depth=2
	mul	x8, x11, x27
	add	x9, x17, x8, lsl #2
	addvl	x8, x29, #-6
	ldur	w8, [x8, #-4]                   // 4-byte Folded Reload
	cmp	x3, x25
	ldr	s1, [x9, #4]
	cset	w10, hs
	orr	w8, w10, w8
	cmp	w8, #1                          // =1
	add	x8, x11, #1                     // =1
	b.ne	.LBB0_20
// %bb.18:                              //   in Loop: Header=BB0_16 Depth=2
	mul	x10, x27, x11
	sub	x11, x11, #1                    // =1
	mul	x12, x27, x8
	lsl	x13, x10, #2
	mul	x14, x27, x11
	mov	x9, xzr
	add	x10, x6, x12, lsl #2
	add	x11, x7, x13
	add	x12, x1, x13
	add	x13, x5, x13
	add	x14, x6, x14, lsl #2
	mov	x15, x23
	.p2align	5
.LBB0_19:                               //   Parent Loop BB0_3 Depth=1
                                        //     Parent Loop BB0_16 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	ldr	s2, [x14, x9]
	ldr	s3, [x10, x9]
	add	x16, x11, x9
	ldur	s4, [x16, #-8]
	ldr	s5, [x16]
	fadd	s2, s3, s2
	ldr	s3, [x13, x9]
	fmul	s2, s2, s10
	fadd	s4, s5, s4
	fmadd	s2, s4, s11, s2
	fmadd	s2, s1, s13, s2
	fsub	s2, s2, s3
	fmul	s2, s2, s14
	fmsub	s1, s2, s9, s1
	subs	x15, x15, #1                    // =1
	fmadd	s0, s2, s2, s0
	str	s1, [x12, x9]
	add	x9, x9, #4                      // =4
	mov	v1.16b, v5.16b
	b.ne	.LBB0_19
	b	.LBB0_15
	.p2align	5
.LBB0_20:                               //   in Loop: Header=BB0_16 Depth=2
	ptrue	p0.s, vl1
	sel	z0.s, p0, z0.s, z7.s
	ldr	p0, [x29, #-2, mul vl]          // 2-byte Folded Reload
	sub	x12, x11, #1                    // =1
	mul	x14, x27, x11
	mul	x13, x27, x8
	mov	z1.s, p0/m, s1
	ldr	p0, [x29, #-1, mul vl]          // 2-byte Folded Reload
	mul	x12, x27, x12
	lsl	x14, x14, #2
	mov	x10, xzr
	add	x11, x6, x13, lsl #2
	add	x12, x6, x12, lsl #2
	add	x13, x5, x14
	add	x14, x1, x14
	.p2align	5
.LBB0_21:                               //   Parent Loop BB0_3 Depth=1
                                        //     Parent Loop BB0_16 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	add	x15, x9, x10, lsl #2
	ld1w	{ z2.s }, p0/z, [x12, x10, lsl #2]
	ld1w	{ z3.s }, p0/z, [x11, x10, lsl #2]
	ld1w	{ z4.s }, p0/z, [x15]
	ld1w	{ z5.s }, p0/z, [x15, x28, lsl #2]
	lastb	s1, p1, z1.s
	fadd	z2.s, z3.s, z2.s
	fmul	z2.s, z2.s, z16.s
	fadd	z3.s, z5.s, z4.s
	movprfx	z4, z5
	insr	z4.s, s1
	ld1w	{ z1.s }, p0/z, [x13, x10, lsl #2]
	fmla	z2.s, p1/m, z3.s, z17.s
	fmla	z2.s, p1/m, z4.s, z18.s
	fsub	z1.s, z2.s, z1.s
	fmul	z1.s, z1.s, z19.s
	movprfx	z2, z4
	fmls	z2.s, p1/m, z1.s, z6.s
	st1w	{ z2.s }, p0, [x14, x10, lsl #2]
	incw	x10
	fmla	z0.s, p0/m, z1.s, z1.s
	whilelo	p0.s, x10, x23
	mov	z1.d, z5.d
	b.mi	.LBB0_21
// %bb.22:                              //   in Loop: Header=BB0_16 Depth=2
	faddv	s0, p1, z0.s
	b	.LBB0_15
	.p2align	5
.LBB0_23:                               //   in Loop: Header=BB0_3 Depth=1
	fcvt	d0, s0
	fsqrt	d0, d0
	fmul	d0, d0, d12
	fcvt	s15, d0
	fcmp	s15, s8
	add	w1, w21, #1                     // =1
	b.le	.LBB0_25
// %bb.24:                              //   in Loop: Header=BB0_3 Depth=1
	cmp	w21, w4
	mov	w21, w1
	b.lt	.LBB0_3
.LBB0_25:
	adrp	x0, .L.str
	add	x0, x0, :lo12:.L.str
	bl	printf
	adrp	x0, .L.str.1
	fcvt	d0, s15
	add	x0, x0, :lo12:.L.str.1
	addvl	sp, sp, #6
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
	ldp	d15, d14, [sp], #160            // 16-byte Folded Reload
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
	addvl	sp, sp, #-6
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
	addvl	x8, x29, #-6
	stur	x2, [x8, #-8]                   // 8-byte Folded Spill
	addvl	x8, x29, #-6
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
	fmul	s15, s8, s0
	mov	x19, x0
	fcmp	s15, s8
	mov	w1, #1
	b.le	.LBB1_25
// %bb.1:
	cmp	w23, #1                         // =1
	b.lt	.LBB1_25
// %bb.2:
	addvl	x8, x29, #-6
	ldur	w9, [x8, #-12]                  // 4-byte Folded Reload
	fmul	s0, s12, s12
	fmul	s1, s11, s11
	frecpe	s5, s0
	fcvt	d2, s0
	frecpe	s6, s1
	frecps	s18, s0, s5
	mul	w8, w22, w9
	fcvt	d3, s1
	frecpe	d7, d2
	fmul	s5, s5, s18
	frecps	s18, s1, s6
	scvtf	d4, w8
	frecpe	d16, d3
	fmul	s6, s6, s18
	frecps	d18, d2, d7
	frecpe	d17, d4
	fmul	d7, d7, d18
	frecps	d18, d3, d16
	fmul	d16, d16, d18
	frecps	d18, d4, d17
	fmul	d17, d17, d18
	mov	z18.s, s0
	frecps	s0, s0, s5
	fmul	s11, s5, s0
	mov	z0.s, s1
	frecps	s1, s1, s6
	fmul	s12, s6, s1
	frecps	d1, d2, d7
	fmul	d1, d7, d1
	frecps	d5, d3, d16
	fmul	d5, d16, d5
	frecps	d2, d2, d1
	fmul	d1, d1, d2
	frecps	d2, d3, d5
	sub	w8, w9, #1                      // =1
	fmul	d2, d5, d2
	str	x8, [sp, #8]                    // 8-byte Folded Spill
	mov	z5.s, s9
	str	z5, [x29, #-2, mul vl]          // 16-byte Folded Spill
	addvl	x8, x29, #-6
	ldur	x8, [x8, #-8]                   // 8-byte Folded Reload
	mov	w28, w9
	frecps	d6, d4, d17
	fmul	d6, d17, d6
	add	x9, x8, #4                      // =4
	add	x8, x24, #4                     // =4
	stp	x8, x9, [sp, #16]               // 16-byte Folded Spill
	mov	w8, #-1
	sub	w26, w22, #2                    // =2
	fmov	z5.s, #1.00000000
	ptrue	p1.s
	incw	x8
	frecps	d4, d4, d6
	whilelo	p0.s, xzr, x26
	fdivr	z0.s, p1/m, z0.s, z5.s
	sxtw	x8, w8
	fcvt	d3, s10
	fmul	d10, d6, d4
	fmov	d4, #2.00000000
	index	z6.s, #0, #1
	str	p0, [x29, #-1, mul vl]          // 2-byte Folded Spill
	movprfx	z7, z5
	fdiv	z7.s, p1/m, z7.s, z18.s
	str	z7, [x29, #-3, mul vl]          // 16-byte Folded Spill
	str	z0, [x29, #-4, mul vl]          // 16-byte Folded Spill
	mov	z0.s, w8
	cmpeq	p0.s, p1/z, z6.s, z0.s
	fnmadd	d0, d1, d4, d3
	fadd	d1, d2, d2
	fsub	d0, d0, d1
	fcvt	s13, d0
	frecpe	s0, s13
	frecps	s1, s13, s0
	fmul	s0, s0, s1
	mov	w25, w22
	str	p0, [x29, #-2, mul vl]          // 2-byte Folded Spill
	mov	z2.s, s13
	frecps	s1, s13, s0
	add	x20, x19, #4                    // =4
	mov	w27, #1
	rdvl	x21, #1
	lsl	x24, x25, #2
	str	z2, [x29, #-5, mul vl]          // 16-byte Folded Spill
	fdivr	z2.s, p1/m, z2.s, z5.s
	fmul	s14, s0, s1
	addvl	x8, x29, #-6
	str	z2, [x29, #-6, mul vl]          // 16-byte Folded Spill
	stur	w23, [x8, #-16]                 // 4-byte Folded Spill
	.p2align	5
.LBB1_3:                                // =>This Loop Header: Depth=1
                                        //     Child Loop BB1_7 Depth 2
                                        //       Child Loop BB1_10 Depth 3
                                        //     Child Loop BB1_15 Depth 2
                                        //       Child Loop BB1_18 Depth 3
                                        //       Child Loop BB1_21 Depth 3
	addvl	x8, x29, #-6
	ldur	w8, [x8, #-12]                  // 4-byte Folded Reload
	cmp	w8, #1                          // =1
	b.lt	.LBB1_12
// %bb.4:                               //   in Loop: Header=BB1_3 Depth=1
	mov	x23, xzr
	b	.LBB1_7
	.p2align	5
.LBB1_5:                                //   in Loop: Header=BB1_7 Depth=2
	mov	x2, x24
	bl	memcpy
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
	addvl	x9, x29, #-6
	ldur	x9, [x9, #-8]                   // 8-byte Folded Reload
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
	addvl	x8, x29, #-6
	ldur	w23, [x8, #-16]                 // 4-byte Folded Reload
.LBB1_12:                               //   in Loop: Header=BB1_3 Depth=1
	addvl	x8, x29, #-6
	ldur	w8, [x8, #-12]                  // 4-byte Folded Reload
	fmov	s0, wzr
	cmp	w8, #3                          // =3
	b.lt	.LBB1_23
// %bb.13:                              //   in Loop: Header=BB1_3 Depth=1
	ldr	z7, [x29, #-2, mul vl]          // 16-byte Folded Reload
	ldp	x18, x17, [sp, #16]             // 16-byte Folded Reload
	ldr	x0, [sp, #8]                    // 8-byte Folded Reload
	ldr	z16, [x29, #-3, mul vl]         // 16-byte Folded Reload
	ldr	z17, [x29, #-4, mul vl]         // 16-byte Folded Reload
	ldr	z18, [x29, #-5, mul vl]         // 16-byte Folded Reload
	ldr	z19, [x29, #-6, mul vl]         // 16-byte Folded Reload
	fmov	s0, wzr
	mov	w11, #1
	mov	z20.s, #0                       // =0x0
	b	.LBB1_15
	.p2align	5
.LBB1_14:                               //   in Loop: Header=BB1_15 Depth=2
	add	x11, x11, #1                    // =1
	cmp	x11, x0
	b.eq	.LBB1_23
.LBB1_15:                               //   Parent Loop BB1_3 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB1_18 Depth 3
                                        //       Child Loop BB1_21 Depth 3
	cmp	w22, #2                         // =2
	b.le	.LBB1_14
// %bb.16:                              //   in Loop: Header=BB1_15 Depth=2
	mul	x8, x11, x25
	add	x8, x19, x8, lsl #2
	ldr	s1, [x8, #4]
	add	x8, x11, #1                     // =1
	mov	x9, xzr
	cbz	w26, .LBB1_20
// %bb.17:                              //   in Loop: Header=BB1_15 Depth=2
	ldr	p0, [x29, #-2, mul vl]          // 2-byte Folded Reload
	mul	x13, x25, x11
	madd	x10, x24, x11, x19
	sub	x11, x11, #1                    // =1
	mov	z2.s, p0/m, s1
	ldr	p0, [x29, #-1, mul vl]          // 2-byte Folded Reload
	lsl	x14, x13, #2
	madd	x12, x24, x8, x20
	madd	x11, x24, x11, x20
	add	x13, x17, x14
	add	x14, x18, x14
	add	x15, x10, #8                    // =8
	mov	z1.d, z20.d
	.p2align	5
.LBB1_18:                               //   Parent Loop BB1_3 Depth=1
                                        //     Parent Loop BB1_15 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	ld1w	{ z3.s }, p0/z, [x11, x9, lsl #2]
	ld1w	{ z4.s }, p0/z, [x12, x9, lsl #2]
	ld1w	{ z5.s }, p0/z, [x10, x9, lsl #2]
	ld1w	{ z6.s }, p0/z, [x15, x9, lsl #2]
	lastb	s2, p1, z2.s
	fadd	z3.s, z4.s, z3.s
	fmul	z3.s, z3.s, z16.s
	fadd	z4.s, z6.s, z5.s
	movprfx	z5, z6
	insr	z5.s, s2
	ld1w	{ z2.s }, p0/z, [x14, x9, lsl #2]
	fmla	z3.s, p1/m, z4.s, z17.s
	fmla	z3.s, p1/m, z5.s, z18.s
	fsub	z2.s, z3.s, z2.s
	fmul	z2.s, z2.s, z19.s
	movprfx	z3, z5
	fmls	z3.s, p1/m, z2.s, z7.s
	st1w	{ z3.s }, p0, [x13, x9, lsl #2]
	incw	x9
	fmla	z1.s, p0/m, z2.s, z2.s
	whilelo	p0.s, x9, x26
	mov	z2.d, z6.d
	b.mi	.LBB1_18
// %bb.19:                              //   in Loop: Header=BB1_15 Depth=2
	faddv	s2, p1, z1.s
	b	.LBB1_22
.LBB1_20:                               //   in Loop: Header=BB1_15 Depth=2
	mul	x13, x25, x11
	sub	x12, x11, #1                    // =1
	lsl	x14, x13, #2
	madd	x10, x24, x11, x19
	madd	x11, x24, x8, x20
	madd	x12, x24, x12, x20
	add	x13, x17, x14
	add	x14, x18, x14
	fmov	s2, wzr
	mov	x15, x26
	.p2align	5
.LBB1_21:                               //   Parent Loop BB1_3 Depth=1
                                        //     Parent Loop BB1_15 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	ldr	s3, [x12, x9]
	ldr	s4, [x11, x9]
	add	x16, x10, x9
	ldr	s5, [x16]
	ldr	s6, [x16, #8]
	fadd	s3, s4, s3
	ldr	s4, [x14, x9]
	fmul	s3, s3, s11
	fadd	s5, s6, s5
	fmadd	s3, s5, s12, s3
	fmadd	s3, s1, s13, s3
	fsub	s3, s3, s4
	fmul	s3, s3, s14
	fmsub	s1, s3, s9, s1
	subs	x15, x15, #1                    // =1
	fmadd	s2, s3, s3, s2
	str	s1, [x13, x9]
	add	x9, x9, #4                      // =4
	mov	v1.16b, v6.16b
	b.ne	.LBB1_21
.LBB1_22:                               //   in Loop: Header=BB1_15 Depth=2
	fadd	s0, s2, s0
	mov	x11, x8
	cmp	x11, x0
	b.ne	.LBB1_15
.LBB1_23:                               //   in Loop: Header=BB1_3 Depth=1
	fcvt	d0, s0
	fsqrt	d0, d0
	fmul	d0, d0, d10
	fcvt	s15, d0
	fcmp	s15, s8
	add	w1, w27, #1                     // =1
	b.le	.LBB1_25
// %bb.24:                              //   in Loop: Header=BB1_3 Depth=1
	cmp	w27, w23
	mov	w27, w1
	b.lt	.LBB1_3
.LBB1_25:
	adrp	x0, .L.str
	add	x0, x0, :lo12:.L.str
	bl	printf
	adrp	x0, .L.str.1
	fcvt	d0, s15
	add	x0, x0, :lo12:.L.str.1
	bl	printf
	mov	x0, x19
	addvl	sp, sp, #6
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
	subs	w9, w0, #1                      // =1
	sub	w8, w1, #1                      // =1
	scvtf	d1, w9
	scvtf	d2, w8
	frecpe	d3, d1
	frecpe	d4, d2
	frecps	d5, d1, d3
	fmul	d3, d3, d5
	frecps	d5, d2, d4
	fmul	d4, d4, d5
	frecps	d5, d1, d3
	fmul	d3, d3, d5
	frecps	d5, d2, d4
	fmul	d4, d4, d5
	frecps	d1, d1, d3
	frecps	d2, d2, d4
	fmul	d1, d3, d1
	fmul	d2, d4, d2
	fadd	d1, d1, d1
	fadd	d2, d2, d2
	fcvt	s1, d1
	fcvt	s2, d2
	str	s1, [x2]
	str	s2, [x3]
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
	st1w	{ z5.s }, p3, [x18, x0, lsl #2]
	fmul	s19, s19, s17
	scvtf	z21.s, p1/m, z21.s
	mov	z19.s, s19
	fmul	z20.s, z20.s, z21.s
	zip2	z22.s, z19.s, z19.s
	zip1	z19.s, z19.s, z19.s
	zip2	z21.s, z20.s, z20.s
	zip1	z20.s, z20.s, z20.s
	fcvt	z22.d, p0/m, z22.s
	fcvt	z19.d, p0/m, z19.s
	fcvt	z21.d, p0/m, z21.s
	fcvt	z20.d, p0/m, z20.s
	fadd	z19.d, z19.d, z3.d
	fadd	z22.d, z22.d, z3.d
	fadd	z20.d, z20.d, z3.d
	fadd	z21.d, z21.d, z3.d
	fcvtzs	z22.d, p0/m, z22.d
	fcvtzs	z19.d, p0/m, z19.d
	fcvtzs	z21.d, p0/m, z21.d
	fcvtzs	z20.d, p0/m, z20.d
	uzp1	z19.s, z19.s, z22.s
	uzp1	z20.s, z20.s, z21.s
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
	fadd	z21.d, z22.d, z21.d
	fadd	z20.d, z19.d, z20.d
	fmul	z20.d, p0/m, z20.d, #2.0
	fmul	z21.d, p0/m, z21.d, #2.0
	fnmls	z21.d, p0/m, z24.d, z22.d
	fnmsb	z19.d, p0/m, z23.d, z20.d
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
	fadd	d18, d19, d18
	fadd	d18, d18, d18
	lsl	x7, x0, #2
	add	x0, x0, #1                      // =1
	fnmsub	d18, d20, d19, d18
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
	cmp	w0, #1                          // =1
	b.lt	.LBB4_7
// %bb.1:
	mov	w9, w1
	mov	x8, xzr
	mov	w10, w0
	mov	z0.s, s2
	fmov	s16, wzr
	fmov	s2, #-1.00000000
	fmov	d3, #1.00000000
	mov	z4.s, #0                        // =0x0
	ptrue	p0.s, vl1
	index	z5.s, #0, #1
	mov	z6.s, #-1                       // =0xffffffffffffffff
	ptrue	p1.s
	fmov	z7.s, #-1.00000000
	whilelo	p2.s, xzr, x9
	lsl	x11, x9, #2
	ptrue	p3.d
	b	.LBB4_3
	.p2align	5
.LBB4_2:                                //   in Loop: Header=BB4_3 Depth=1
	add	x8, x8, #1                      // =1
	cmp	x8, x10
	add	x2, x2, x11
	b.eq	.LBB4_8
.LBB4_3:                                // =>This Loop Header: Depth=1
                                        //     Child Loop BB4_5 Depth 2
	cmp	w1, #1                          // =1
	b.lt	.LBB4_2
// %bb.4:                               //   in Loop: Header=BB4_3 Depth=1
	sub	w13, w8, #1                     // =1
	scvtf	s17, w13
	fmadd	s17, s17, s1, s2
	fmul	s17, s17, s17
	fcvt	d17, s17
	fsub	d17, d3, d17
	mov	x12, xzr
	sel	z16.s, p0, z16.s, z4.s
	mov	z17.d, d17
	mov	p4.b, p2.b
	mov	z18.d, z5.d
	.p2align	5
.LBB4_5:                                //   Parent Loop BB4_3 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	add	z19.s, z18.s, z6.s
	ld1w	{ z20.s }, p4/z, [x2, x12, lsl #2]
	scvtf	z19.s, p1/m, z19.s
	fmad	z19.s, p1/m, z0.s, z7.s
	fmul	z19.s, z19.s, z19.s
	zip1	z22.s, z19.s, z19.s
	zip2	z19.s, z19.s, z19.s
	zip2	z21.s, z20.s, z20.s
	zip1	z20.s, z20.s, z20.s
	fcvt	z22.d, p3/m, z22.s
	fcvt	z19.d, p3/m, z19.s
	fcvt	z21.d, p3/m, z21.s
	fcvt	z20.d, p3/m, z20.s
	fsub	z19.d, p3/m, z19.d, #1.0
	fsub	z22.d, p3/m, z22.d, #1.0
	fmla	z20.d, p3/m, z22.d, z17.d
	fmad	z19.d, p3/m, z17.d, z21.d
	fcvt	z19.s, p3/m, z19.d
	fcvt	z20.s, p3/m, z20.d
	incw	x12
	uzp1	z19.s, z20.s, z19.s
	fmla	z16.s, p4/m, z19.s, z19.s
	whilelo	p4.s, x12, x9
	incw	z18.s
	b.mi	.LBB4_5
// %bb.6:                               //   in Loop: Header=BB4_3 Depth=1
	faddv	s16, p1, z16.s
	b	.LBB4_2
.LBB4_7:
	fmov	s16, wzr
.LBB4_8:
	mul	w8, w1, w0
	scvtf	d1, w8
	frecpe	d2, d1
	frecps	d3, d1, d2
	fmul	d2, d2, d3
	frecps	d3, d1, d2
	fcvt	d0, s16
	fmul	d2, d2, d3
	fsqrt	d0, d0
	frecps	d1, d1, d2
	fmul	d0, d1, d0
	fmul	d0, d2, d0
	fcvt	s0, d0
	adrp	x0, .L.str.5
	fcvt	d0, s0
	add	x0, x0, :lo12:.L.str.5
	b	printf
.Lfunc_end4:
	.size	error_check, .Lfunc_end4-error_check
	.cfi_endproc
                                        // -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3                               // -- Begin function main
.LCPI5_0:
	.xword	0x3fa999999999999a              // double 0.050000000000000003
	.text
	.globl	main
	.p2align	5
	.type	main,@function
main:                                   // @main
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
	.cfi_offset b14, -160
	mov	w9, #256
	mov	w10, #27053
	mov	w11, #59135
	sub	w8, w0, #2                      // =2
	movk	w10, #15710, lsl #16
	movk	w11, #11995, lsl #16
	mov	w12, #1065353216
	mov	w13, #5000
	stp	w9, w9, [x29, #8]
	addvl	x9, x29, #-2
	cmp	w8, #5                          // =5
	stur	w10, [x9, #-20]
	stp	w12, w11, [sp, #20]
	str	w13, [sp, #16]
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
	add	x1, x1, :lo12:.L.str.6
	add	x2, x29, #12                    // =12
	bl	__isoc99_sscanf
	ldr	w8, [x29, #12]
	str	w8, [x29, #8]
	b	.LBB5_10
.LBB5_3:
	ldr	x0, [x19, #8]
	adrp	x20, .L.str.6
	add	x20, x20, :lo12:.L.str.6
	add	x2, x29, #12                    // =12
	mov	x1, x20
	bl	__isoc99_sscanf
	ldr	x0, [x19, #16]
	add	x2, x29, #8                     // =8
	b	.LBB5_8
.LBB5_4:
	ldr	x0, [x19, #8]
	adrp	x20, .L.str.6
	add	x20, x20, :lo12:.L.str.6
	add	x2, x29, #12                    // =12
	mov	x1, x20
	bl	__isoc99_sscanf
	ldr	x0, [x19, #16]
	add	x2, x29, #8                     // =8
	mov	x1, x20
	bl	__isoc99_sscanf
	ldr	x0, [x19, #24]
	adrp	x1, .L.str.7
	sub	x2, x29, #20                    // =20
	add	x1, x1, :lo12:.L.str.7
	addvl	x2, x2, #-2
	b	.LBB5_9
.LBB5_5:
	ldr	x0, [x19, #8]
	adrp	x20, .L.str.6
	add	x20, x20, :lo12:.L.str.6
	add	x2, x29, #12                    // =12
	mov	x1, x20
	bl	__isoc99_sscanf
	ldr	x0, [x19, #16]
	add	x2, x29, #8                     // =8
	mov	x1, x20
	bl	__isoc99_sscanf
	ldr	x0, [x19, #24]
	adrp	x20, .L.str.7
	add	x20, x20, :lo12:.L.str.7
	sub	x2, x29, #20                    // =20
	addvl	x2, x2, #-2
	mov	x1, x20
	bl	__isoc99_sscanf
	ldr	x0, [x19, #32]
	add	x2, sp, #24                     // =24
	b	.LBB5_8
.LBB5_6:
	ldr	x0, [x19, #8]
	adrp	x20, .L.str.6
	add	x20, x20, :lo12:.L.str.6
	add	x2, x29, #12                    // =12
	mov	x1, x20
	bl	__isoc99_sscanf
	ldr	x0, [x19, #16]
	add	x2, x29, #8                     // =8
	mov	x1, x20
	bl	__isoc99_sscanf
	ldr	x0, [x19, #24]
	adrp	x20, .L.str.7
	add	x20, x20, :lo12:.L.str.7
	sub	x2, x29, #20                    // =20
	addvl	x2, x2, #-2
	mov	x1, x20
	bl	__isoc99_sscanf
	ldr	x0, [x19, #32]
	add	x2, sp, #24                     // =24
	mov	x1, x20
	bl	__isoc99_sscanf
	ldr	x0, [x19, #40]
	add	x2, sp, #20                     // =20
	b	.LBB5_8
.LBB5_7:
	ldr	x0, [x19, #8]
	adrp	x20, .L.str.6
	add	x20, x20, :lo12:.L.str.6
	add	x2, x29, #12                    // =12
	mov	x1, x20
	bl	__isoc99_sscanf
	ldr	x0, [x19, #16]
	add	x2, x29, #8                     // =8
	mov	x1, x20
	bl	__isoc99_sscanf
	ldr	x0, [x19, #24]
	adrp	x21, .L.str.7
	add	x21, x21, :lo12:.L.str.7
	sub	x2, x29, #20                    // =20
	addvl	x2, x2, #-2
	mov	x1, x21
	bl	__isoc99_sscanf
	ldr	x0, [x19, #32]
	add	x2, sp, #24                     // =24
	mov	x1, x21
	bl	__isoc99_sscanf
	ldr	x0, [x19, #40]
	add	x2, sp, #20                     // =20
	mov	x1, x21
	bl	__isoc99_sscanf
	ldr	x0, [x19, #48]
	add	x2, sp, #16                     // =16
.LBB5_8:
	mov	x1, x20
.LBB5_9:
	bl	__isoc99_sscanf
.LBB5_10:
	addvl	x8, x29, #-2
	ldur	s0, [x8, #-20]
	ldp	s2, s1, [sp, #20]
	ldp	w2, w1, [x29, #8]
	ldr	w3, [sp, #16]
	adrp	x0, .L.str.8
	fcvt	d0, s0
	fcvt	d1, s1
	fcvt	d2, s2
	add	x0, x0, :lo12:.L.str.8
	bl	printf
	adrp	x0, .Lstr
	add	x0, x0, :lo12:.Lstr
	bl	puts
	ldp	w22, w25, [x29, #8]
                                        // kill: def $w25 killed $w25 def $x25
	sxtw	x25, w25
	and	x23, x25, #0xffffffff
	sxtw	x8, w22
	mul	x8, x25, x8
	lsl	x24, x8, #2
	mov	x0, x24
	bl	malloc
	mov	x20, x0
	mov	x0, x24
	bl	malloc
	mov	x19, x0
	mov	x0, x24
	bl	malloc
	subs	w9, w25, #1                     // =1
	sub	w8, w22, #1                     // =1
	scvtf	d0, w9
	scvtf	d1, w8
	frecpe	d2, d0
	frecpe	d3, d1
	frecps	d4, d0, d2
	fmul	d2, d2, d4
	frecps	d4, d1, d3
	fmul	d3, d3, d4
	frecps	d4, d0, d2
	fmul	d2, d2, d4
	frecps	d4, d1, d3
	fmul	d3, d3, d4
	addvl	x8, x29, #-2
	ldur	s10, [x8, #-20]
	frecps	d0, d0, d2
	frecps	d1, d1, d3
	fmul	d0, d2, d0
	fmul	d1, d3, d1
	fadd	d0, d0, d0
	fadd	d1, d1, d1
	mov	x21, x0
	fmov	d12, #-1.00000000
	fmov	d11, #1.00000000
	rdvl	x26, #1
	mov	z7.s, #-1                       // =0xffffffffffffffff
	ptrue	p1.s
	ptrue	p2.d
	fmov	z16.d, #-1.00000000
	fmov	z17.d, #1.00000000
	fcvt	s9, d0
	fcvt	s8, d1
	mov	z18.b, #0                       // =0x0
	b.lt	.LBB5_20
// %bb.11:
	fcvt	d0, s10
	mov	x27, xzr
	lsl	x25, x22, #2
	whilelo	p3.s, xzr, x22
	mov	z19.s, s8
	fneg	d13, d0
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
	fmul	s0, s0, s9
	fcvt	d0, s0
	fadd	d0, d0, d12
	fcvtzs	w8, d0
	mul	w8, w8, w8
	scvtf	d0, w8
	madd	x0, x25, x27, x20
	cmp	x26, #17                        // =17
	fsub	d14, d11, d0
	b.hs	.LBB5_16
// %bb.15:                              //   in Loop: Header=BB5_13 Depth=1
	mov	w1, wzr
	mov	x2, x25
	bl	memset
	ldr	z19, [x29, #-2, mul vl]         // 16-byte Folded Reload
	ldr	p3, [x29, #-8, mul vl]          // 2-byte Folded Reload
	index	z20.s, #0, #1
	mov	z18.b, #0                       // =0x0
	fmov	z17.d, #1.00000000
	fmov	z16.d, #-1.00000000
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
	fmul	d0, d14, d13
	mov	x8, xzr
	mov	z0.d, d0
	mov	z1.d, d14
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
	fadd	z3.d, z3.d, z16.d
	fadd	z4.d, z4.d, z16.d
	fcvtzs	z4.d, p2/m, z4.d
	fcvtzs	z3.d, p2/m, z3.d
	uzp1	z3.s, z3.s, z4.s
	movprfx	z4, z3
	mul	z4.s, p1/m, z4.s, z3.s
	sunpklo	z3.d, z4.s
	sunpkhi	z4.d, z4.s
	scvtf	z3.d, p2/m, z3.d
	scvtf	z4.d, p2/m, z4.d
	fsub	z4.d, z17.d, z4.d
	fsub	z3.d, z17.d, z3.d
	fadd	z5.d, z3.d, z1.d
	fadd	z6.d, z4.d, z1.d
	fmul	z6.d, p2/m, z6.d, #2.0
	fmul	z5.d, p2/m, z5.d, #2.0
	fnmsb	z3.d, p2/m, z0.d, z5.d
	fnmsb	z4.d, p2/m, z0.d, z6.d
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
	ldp	s3, s4, [sp, #20]
	ldr	w4, [sp, #16]
	mov	w0, w23
	mov	w1, w22
	mov	v0.16b, v9.16b
	mov	v1.16b, v8.16b
	mov	v2.16b, v10.16b
	mov	x2, x20
	mov	x3, x21
	bl	jacobi_seq
	addvl	x8, x29, #-2
	ldp	w1, w0, [x29, #8]
	ldur	s2, [x8, #-20]
	ldp	s3, s4, [sp, #20]
	ldr	w4, [sp, #16]
	mov	v0.16b, v9.16b
	mov	v1.16b, v8.16b
	mov	x2, x19
	mov	x3, x21
	bl	jacobi_omp
	ldp	w23, w24, [x29, #8]
	mov	z7.s, #-1                       // =0xffffffffffffffff
	ptrue	p1.s
	ptrue	p2.d
	subs	w9, w24, #1                     // =1
	sub	w8, w23, #1                     // =1
	scvtf	d0, w9
	scvtf	d1, w8
	frecpe	d2, d0
	frecpe	d3, d1
	frecps	d4, d0, d2
	fmul	d2, d2, d4
	frecps	d4, d1, d3
	fmul	d3, d3, d4
	frecps	d4, d0, d2
	fmul	d2, d2, d4
	frecps	d4, d1, d3
	fmul	d3, d3, d4
	frecps	d1, d1, d3
	frecps	d0, d0, d2
	fmul	d1, d3, d1
	fmul	d0, d2, d0
	fadd	d1, d1, d1
	fadd	d0, d0, d0
	fcvt	s9, d1
	fcvt	s8, d0
	mov	z16.s, s9
	str	z16, [x29, #-1, mul vl]         // 16-byte Folded Spill
	b.lt	.LBB5_34
// %bb.25:
	addvl	x8, x29, #-2
	ldur	s0, [x8, #-20]
	mov	x25, xzr
	lsl	x22, x23, #2
	whilelo	p3.s, xzr, x23
	fcvt	d0, s0
	fneg	d10, d0
	index	z20.s, #0, #1
	mov	x27, x21
	fmov	z17.d, #-1.00000000
	fmov	z18.d, #1.00000000
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
	fmul	s0, s0, s8
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
	ldr	z16, [x29, #-1, mul vl]         // 16-byte Folded Reload
	index	z20.s, #0, #1
	mov	z19.b, #0                       // =0x0
	fmov	z18.d, #1.00000000
	fmov	z17.d, #-1.00000000
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
	fmul	d0, d13, d10
	mov	x8, xzr
	mov	z0.d, d0
	mov	z1.d, d13
	mov	p0.b, p3.b
	mov	z2.d, z20.d
	.p2align	5
.LBB5_33:                               //   Parent Loop BB5_27 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	add	z3.s, z2.s, z7.s
	scvtf	z3.s, p1/m, z3.s
	fmul	z3.s, z16.s, z3.s
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
	fsub	z4.d, z18.d, z4.d
	fsub	z3.d, z18.d, z3.d
	fadd	z5.d, z3.d, z1.d
	fadd	z6.d, z4.d, z1.d
	fmul	z6.d, p2/m, z6.d, #2.0
	fmul	z5.d, p2/m, z5.d, #2.0
	fnmsb	z3.d, p2/m, z0.d, z5.d
	fnmsb	z4.d, p2/m, z0.d, z6.d
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
	ldp	w1, w0, [x29, #8]
	ldur	s2, [x8, #-20]
	ldp	s3, s4, [sp, #20]
	ldr	w4, [sp, #16]
	scvtf	d10, d0
	ucvtf	d13, d1
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
	fsub	d2, d12, d13
	scvtf	d0, d0
	fmov	d3, x23
	ucvtf	d1, d1
	fsub	d0, d0, d10
	fadd	d1, d2, d1
	subs	w22, w22, #1                    // =1
	fmadd	d12, d0, d3, d1
	b.ne	.LBB5_39
// %bb.40:
	adrp	x8, .LCPI5_0
	ldr	d10, [x8, :lo12:.LCPI5_0]
	adrp	x0, .L.str.10
	add	x0, x0, :lo12:.L.str.10
	fmul	d0, d12, d10
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
	ldp	w1, w0, [x29, #8]
	ldur	s2, [x8, #-20]
	ldp	s3, s4, [sp, #20]
	ldr	w4, [sp, #16]
	scvtf	d13, d0
	ucvtf	d14, d1
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
	fsub	d2, d12, d14
	scvtf	d0, d0
	fmov	d3, x23
	ucvtf	d1, d1
	fsub	d0, d0, d13
	fadd	d1, d2, d1
	subs	w22, w22, #1                    // =1
	fmadd	d12, d0, d3, d1
	b.ne	.LBB5_41
// %bb.42:
	adrp	x0, .L.str.12
	fmul	d0, d12, d10
	add	x0, x0, :lo12:.L.str.12
	bl	printf
	ldp	w9, w8, [x29, #8]
	cmp	w8, #1                          // =1
	b.lt	.LBB5_49
// %bb.43:
	ldr	z19, [x29, #-1, mul vl]         // 16-byte Folded Reload
	mov	x10, xzr
	whilelo	p0.s, xzr, x9
	lsl	x11, x9, #2
	fmov	s3, wzr
	fmov	s0, #-1.00000000
	mov	z1.s, #0                        // =0x0
	ptrue	p1.s, vl1
	fmov	z2.s, #-1.00000000
	mov	x12, x20
	mov	z18.s, #-1                      // =0xffffffffffffffff
	ptrue	p3.s
	ptrue	p4.d
	index	z20.s, #0, #1
	b	.LBB5_45
	.p2align	5
.LBB5_44:                               //   in Loop: Header=BB5_45 Depth=1
	add	x10, x10, #1                    // =1
	cmp	x10, x8
	add	x12, x12, x11
	b.eq	.LBB5_50
.LBB5_45:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB5_47 Depth 2
	cmp	w9, #1                          // =1
	b.lt	.LBB5_44
// %bb.46:                              //   in Loop: Header=BB5_45 Depth=1
	sub	w14, w10, #1                    // =1
	scvtf	s4, w14
	fmadd	s4, s4, s8, s0
	fmul	s4, s4, s4
	fcvt	d4, s4
	fsub	d4, d11, d4
	mov	x13, xzr
	sel	z3.s, p1, z3.s, z1.s
	mov	z4.d, d4
	mov	p2.b, p0.b
	mov	z5.d, z20.d
	.p2align	5
.LBB5_47:                               //   Parent Loop BB5_45 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	add	z6.s, z5.s, z18.s
	ld1w	{ z7.s }, p2/z, [x12, x13, lsl #2]
	scvtf	z6.s, p3/m, z6.s
	fmad	z6.s, p3/m, z19.s, z2.s
	fmul	z6.s, z6.s, z6.s
	zip1	z17.s, z6.s, z6.s
	zip2	z6.s, z6.s, z6.s
	zip2	z16.s, z7.s, z7.s
	zip1	z7.s, z7.s, z7.s
	fcvt	z17.d, p4/m, z17.s
	fcvt	z6.d, p4/m, z6.s
	fcvt	z16.d, p4/m, z16.s
	fcvt	z7.d, p4/m, z7.s
	fsub	z6.d, p4/m, z6.d, #1.0
	fsub	z17.d, p4/m, z17.d, #1.0
	fmla	z7.d, p4/m, z17.d, z4.d
	fmad	z6.d, p4/m, z4.d, z16.d
	fcvt	z6.s, p4/m, z6.d
	fcvt	z7.s, p4/m, z7.d
	incw	x13
	uzp1	z6.s, z7.s, z6.s
	fmla	z3.s, p2/m, z6.s, z6.s
	whilelo	p2.s, x13, x9
	incw	z5.s
	b.mi	.LBB5_47
// %bb.48:                              //   in Loop: Header=BB5_45 Depth=1
	faddv	s3, p3, z3.s
	b	.LBB5_44
.LBB5_49:
	fmov	s3, wzr
.LBB5_50:
	mul	w8, w9, w8
	scvtf	d1, w8
	frecpe	d2, d1
	fcvt	d0, s3
	frecps	d3, d1, d2
	fmul	d2, d2, d3
	frecps	d3, d1, d2
	fmul	d2, d2, d3
	fsqrt	d0, d0
	frecps	d1, d1, d2
	fmul	d0, d1, d0
	fmul	d0, d2, d0
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
	ldr	d14, [sp], #160                 // 8-byte Folded Reload
	ret
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
