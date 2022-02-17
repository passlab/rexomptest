	.text
	.file	"rose_axpy_float_sve.c"
	.globl	read_timer                      // -- Begin function read_timer
	.p2align	2
	.type	read_timer,@function
read_timer:                             // @read_timer
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
	ldr	h1, [sp, #8]
	ldr	d0, [sp]
	mov	x8, #70368744177664
	movk	x8, #16527, lsl #48
	ldp	x29, x30, [sp, #16]             // 16-byte Folded Reload
	ucvtf	d1, d1
	fmov	d2, x8
	scvtf	d0, d0
	fdiv	d1, d1, d2
	fadd	d0, d1, d0
	add	sp, sp, #32                     // =32
	ret
.Lfunc_end0:
	.size	read_timer, .Lfunc_end0-read_timer
	.cfi_endproc
                                        // -- End function
	.globl	init                            // -- Begin function init
	.p2align	2
	.type	init,@function
init:                                   // @init
	.cfi_startproc
// %bb.0:
	str	d8, [sp, #-64]!                 // 8-byte Folded Spill
	stp	x29, x30, [sp, #16]             // 16-byte Folded Spill
	stp	x22, x21, [sp, #32]             // 16-byte Folded Spill
	stp	x20, x19, [sp, #48]             // 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 64
	.cfi_offset w19, -8
	.cfi_offset w20, -16
	.cfi_offset w21, -24
	.cfi_offset w22, -32
	.cfi_offset w30, -40
	.cfi_offset w29, -48
	.cfi_offset b8, -64
	mov	w21, #32768
	mov	w22, #52429
	mov	x19, x1
	mov	x20, x0
	movk	w21, #1562, lsl #16
	movk	w22, #19788, lsl #16
.LBB1_1:                                // =>This Inner Loop Header: Depth=1
	bl	rand
	scvtf	s0, w0
	fmov	s8, w22
	fdiv	s0, s0, s8
	str	s0, [x20], #4
	bl	rand
	scvtf	s0, w0
	fdiv	s0, s0, s8
	subs	x21, x21, #1                    // =1
	str	s0, [x19], #4
	b.ne	.LBB1_1
// %bb.2:
	ldp	x20, x19, [sp, #48]             // 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]             // 16-byte Folded Reload
	ldp	x29, x30, [sp, #16]             // 16-byte Folded Reload
	ldr	d8, [sp], #64                   // 8-byte Folded Reload
	ret
.Lfunc_end1:
	.size	init, .Lfunc_end1-init
	.cfi_endproc
                                        // -- End function
	.globl	axpy                            // -- Begin function axpy
	.p2align	2
	.type	axpy,@function
axpy:                                   // @axpy
	.cfi_startproc
// %bb.0:
	mov	w10, #32767
	movk	w10, #1562, lsl #16
	mov	x8, xzr
	mov	w9, wzr
	mov	z0.s, s0
	whilelt	p0.s, wzr, w10
	cntw	x11
.LBB2_1:                                // =>This Inner Loop Header: Depth=1
	add	x12, x1, x8
	add	x13, x0, x8
	ld1w	{ z1.s }, p0/z, [x12]
	ld1w	{ z2.s }, p0/z, [x13]
	addvl	x8, x8, #1
	fmul	z2.s, p0/m, z2.s, z0.s
	fadd	z2.s, p0/m, z2.s, z1.s
	st1w	{ z2.s }, p0, [x12]
	whilelt	p0.s, w9, w10
	add	w9, w9, w11
	add	w12, w10, #1                    // =1
	cmp	w9, w12
	b.lt	.LBB2_1
// %bb.2:
	ret
.Lfunc_end2:
	.size	axpy, .Lfunc_end2-axpy
	.cfi_endproc
                                        // -- End function
	.globl	axpy_serial                     // -- Begin function axpy_serial
	.p2align	2
	.type	axpy_serial,@function
axpy_serial:                            // @axpy_serial
	.cfi_startproc
// %bb.0:
	mov	w9, #409600000
	add	x8, x0, x9
	cmp	x8, x1
	mov	w8, #32768
	movk	w8, #1562, lsl #16
	b.ls	.LBB3_3
// %bb.1:
	add	x9, x1, x9
	cmp	x9, x0
	b.ls	.LBB3_3
.LBB3_2:                                // =>This Inner Loop Header: Depth=1
	ldr	s1, [x0], #4
	ldr	s2, [x1]
	subs	x8, x8, #1                      // =1
	fmul	s1, s1, s0
	fadd	s1, s2, s1
	str	s1, [x1], #4
	b.ne	.LBB3_2
	b	.LBB3_5
.LBB3_3:
	mov	x9, xzr
	mov	z0.s, s0
	whilelo	p0.s, xzr, x8
.LBB3_4:                                // =>This Inner Loop Header: Depth=1
	ld1w	{ z1.s }, p0/z, [x0, x9, lsl #2]
	ld1w	{ z2.s }, p0/z, [x1, x9, lsl #2]
	fmul	z1.s, z1.s, z0.s
	fadd	z1.s, z2.s, z1.s
	st1w	{ z1.s }, p0, [x1, x9, lsl #2]
	incw	x9
	whilelo	p0.s, x9, x8
	b.mi	.LBB3_4
.LBB3_5:
	ret
.Lfunc_end3:
	.size	axpy_serial, .Lfunc_end3-axpy_serial
	.cfi_endproc
                                        // -- End function
	.globl	print_vector                    // -- Begin function print_vector
	.p2align	2
	.type	print_vector,@function
print_vector:                           // @print_vector
	.cfi_startproc
// %bb.0:
	stp	x29, x30, [sp, #-32]!           // 16-byte Folded Spill
	stp	x20, x19, [sp, #16]             // 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 32
	.cfi_offset w19, -8
	.cfi_offset w20, -16
	.cfi_offset w30, -24
	.cfi_offset w29, -32
	mov	x19, x0
	mov	w0, #91
	bl	putchar
	ldr	s0, [x19]
	adrp	x20, .L.str.1
	add	x20, x20, :lo12:.L.str.1
	mov	x0, x20
	fcvt	d0, s0
	bl	printf
	ldr	s0, [x19, #4]
	mov	x0, x20
	fcvt	d0, s0
	bl	printf
	ldr	s0, [x19, #8]
	mov	x0, x20
	fcvt	d0, s0
	bl	printf
	ldr	s0, [x19, #12]
	mov	x0, x20
	fcvt	d0, s0
	bl	printf
	ldr	s0, [x19, #16]
	mov	x0, x20
	fcvt	d0, s0
	bl	printf
	ldr	s0, [x19, #20]
	mov	x0, x20
	fcvt	d0, s0
	bl	printf
	ldr	s0, [x19, #24]
	mov	x0, x20
	fcvt	d0, s0
	bl	printf
	ldr	s0, [x19, #28]
	mov	x0, x20
	fcvt	d0, s0
	bl	printf
	ldp	x20, x19, [sp, #16]             // 16-byte Folded Reload
	adrp	x0, .L.str.2
	add	x0, x0, :lo12:.L.str.2
	ldp	x29, x30, [sp], #32             // 16-byte Folded Reload
	b	puts
.Lfunc_end4:
	.size	print_vector, .Lfunc_end4-print_vector
	.cfi_endproc
                                        // -- End function
	.globl	check                           // -- Begin function check
	.p2align	2
	.type	check,@function
check:                                  // @check
	.cfi_startproc
// %bb.0:
	mov	w9, #32768
	movk	w9, #1562, lsl #16
	mov	x8, xzr
	whilelo	p0.s, xzr, x9
	fmov	s0, wzr
.LBB5_1:                                // =>This Inner Loop Header: Depth=1
	ld1w	{ z1.s }, p0/z, [x0, x8, lsl #2]
	ld1w	{ z2.s }, p0/z, [x1, x8, lsl #2]
	incw	x8
	fsub	z1.s, z1.s, z2.s
	fadda	s0, p0, s0, z1.s
	whilelo	p0.s, x8, x9
	b.mi	.LBB5_1
// %bb.2:
                                        // kill: def $s0 killed $s0 killed $z0
	ret
.Lfunc_end5:
	.size	check, .Lfunc_end5-check
	.cfi_endproc
                                        // -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3                               // -- Begin function main
.LCPI6_0:
	.xword	0x40091eb860000000              // double 3.1400001049041748
.LCPI6_1:
	.xword	0x43974876e8000000              // double 4.194304E+17
	.text
	.globl	main
	.p2align	2
	.type	main,@function
main:                                   // @main
	.cfi_startproc
// %bb.0:
	str	d12, [sp, #-144]!               // 8-byte Folded Spill
	stp	d11, d10, [sp, #16]             // 16-byte Folded Spill
	stp	d9, d8, [sp, #32]               // 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             // 16-byte Folded Spill
	stp	x28, x27, [sp, #64]             // 16-byte Folded Spill
	stp	x26, x25, [sp, #80]             // 16-byte Folded Spill
	stp	x24, x23, [sp, #96]             // 16-byte Folded Spill
	stp	x22, x21, [sp, #112]            // 16-byte Folded Spill
	stp	x20, x19, [sp, #128]            // 16-byte Folded Spill
	mov	x29, sp
	addvl	sp, sp, #-1
	sub	sp, sp, #32                     // =32
	.cfi_def_cfa w29, 144
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
	.cfi_offset b12, -144
	mov	w0, #409600000
	mov	w22, #409600000
	bl	malloc
	mov	x19, x0
	mov	w0, #409600000
	bl	malloc
	mov	x20, x0
	mov	w0, #409600000
	bl	malloc
	mov	x21, x0
	mov	x0, xzr
	bl	time
                                        // kill: def $w0 killed $w0 killed $x0
	bl	srand
	mov	w24, #52429
	mov	x23, xzr
	movk	w24, #19788, lsl #16
.LBB6_1:                                // =>This Inner Loop Header: Depth=1
	bl	rand
	scvtf	s0, w0
	fmov	s8, w24
	fdiv	s0, s0, s8
	str	s0, [x19, x23]
	bl	rand
	scvtf	s0, w0
	fdiv	s0, s0, s8
	str	s0, [x20, x23]
	add	x23, x23, #4                    // =4
	cmp	x23, x22
	b.ne	.LBB6_1
// %bb.2:
	rdvl	x25, #1
	cmp	x25, #17                        // =17
	b.hs	.LBB6_4
// %bb.3:
	mov	w2, #409600000
	mov	x0, x21
	mov	x1, x20
	bl	memcpy
	b	.LBB6_6
.LBB6_4:
	mov	w9, #409600000
	mov	x8, xzr
	whilelo	p0.b, xzr, x9
.LBB6_5:                                // =>This Inner Loop Header: Depth=1
	ld1b	{ z0.b }, p0/z, [x20, x8]
	st1b	{ z0.b }, p0, [x21, x8]
	addvl	x8, x8, #1
	whilelo	p0.b, x8, x9
	b.mi	.LBB6_5
.LBB6_6:
	mov	w23, #32767
	mov	x0, x20
	movk	w23, #1562, lsl #16
	bl	print_vector
	mov	x0, x19
	bl	print_vector
	adrp	x8, .LCPI6_0
	ldr	d0, [x8, :lo12:.LCPI6_0]
	adrp	x0, .L.str.3
	add	x0, x0, :lo12:.L.str.3
	bl	printf
	adrp	x0, .L.str.4
	add	x0, x0, :lo12:.L.str.4
	bl	puts
	mov	w10, #62915
	whilelt	p1.s, wzr, w23
	movk	w10, #16456, lsl #16
	mov	x8, xzr
	mov	w9, wzr
	cntw	x24
	mov	z0.s, w10
	mov	p0.b, p1.b
.LBB6_7:                                // =>This Inner Loop Header: Depth=1
	add	x10, x20, x8
	add	x11, x19, x8
	ld1w	{ z1.s }, p0/z, [x10]
	ld1w	{ z2.s }, p0/z, [x11]
	addvl	x8, x8, #1
	fmul	z2.s, p0/m, z2.s, z0.s
	fadd	z2.s, p0/m, z2.s, z1.s
	st1w	{ z2.s }, p0, [x10]
	whilelt	p0.s, w9, w23
	add	w9, w9, w24
	add	w10, w23, #1                    // =1
	cmp	w9, w10
	b.lt	.LBB6_7
// %bb.8:
	mov	w22, #32768
	mov	w9, #62915
	movk	w22, #1562, lsl #16
	movk	w9, #16456, lsl #16
	mov	x8, xzr
	whilelo	p0.s, xzr, x22
	mov	z0.s, w9
	str	p1, [x29, #-1, mul vl]          // 2-byte Folded Spill
.LBB6_9:                                // =>This Inner Loop Header: Depth=1
	ld1w	{ z1.s }, p0/z, [x19, x8, lsl #2]
	ld1w	{ z2.s }, p0/z, [x21, x8, lsl #2]
	fmul	z1.s, z1.s, z0.s
	fadd	z1.s, z2.s, z1.s
	st1w	{ z1.s }, p0, [x21, x8, lsl #2]
	incw	x8
	whilelo	p0.s, x8, x22
	b.mi	.LBB6_9
// %bb.10:
	mov	w27, #52429
	mov	x26, xzr
	movk	w27, #19788, lsl #16
	mov	w28, #409600000
.LBB6_11:                               // =>This Inner Loop Header: Depth=1
	bl	rand
	scvtf	s0, w0
	fmov	s8, w27
	fdiv	s0, s0, s8
	str	s0, [x19, x26]
	bl	rand
	scvtf	s0, w0
	fdiv	s0, s0, s8
	str	s0, [x20, x26]
	add	x26, x26, #4                    // =4
	cmp	x26, x28
	b.ne	.LBB6_11
// %bb.12:
	cmp	x25, #17                        // =17
	b.hs	.LBB6_14
// %bb.13:
	mov	w2, #409600000
	mov	x0, x21
	mov	x1, x20
	bl	memcpy
	b	.LBB6_16
.LBB6_14:
	mov	w9, #409600000
	mov	x8, xzr
	whilelo	p0.b, xzr, x9
.LBB6_15:                               // =>This Inner Loop Header: Depth=1
	ld1b	{ z0.b }, p0/z, [x20, x8]
	st1b	{ z0.b }, p0, [x21, x8]
	addvl	x8, x8, #1
	whilelo	p0.b, x8, x9
	b.mi	.LBB6_15
.LBB6_16:
	add	x0, sp, #16                     // =16
	bl	ftime
	ldr	h0, [sp, #24]
	ldr	x9, [sp, #16]
	mov	x10, #70368744177664
	ldr	p1, [x29, #-1, mul vl]          // 2-byte Folded Reload
	movk	x10, #16527, lsl #48
	mov	w11, #62915
	movk	w11, #16456, lsl #16
	fmov	d1, x10
	ucvtf	d0, d0
	mov	w8, wzr
	fdiv	d0, d0, d1
	mov	z1.s, w11
.LBB6_17:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB6_18 Depth 2
	mov	x10, xzr
	mov	w11, wzr
	mov	p0.b, p1.b
.LBB6_18:                               //   Parent Loop BB6_17 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	add	x12, x20, x10
	add	x13, x19, x10
	ld1w	{ z2.s }, p0/z, [x12]
	ld1w	{ z3.s }, p0/z, [x13]
	addvl	x10, x10, #1
	fmul	z3.s, p0/m, z3.s, z1.s
	fadd	z3.s, p0/m, z3.s, z2.s
	st1w	{ z3.s }, p0, [x12]
	whilelt	p0.s, w11, w23
	add	w11, w11, w24
	add	w12, w23, #1                    // =1
	cmp	w11, w12
	b.lt	.LBB6_18
// %bb.19:                              //   in Loop: Header=BB6_17 Depth=1
	add	w8, w8, #1                      // =1
	cmp	w8, #20                         // =20
	b.ne	.LBB6_17
// %bb.20:
	scvtf	d1, x9
	add	x0, sp, #16                     // =16
	fadd	d8, d0, d1
	bl	ftime
	ldr	h1, [sp, #24]
	ldr	d0, [sp, #16]
	mov	x8, #70368744177664
	movk	x8, #16527, lsl #48
	ucvtf	d1, d1
	fmov	d9, x8
	scvtf	d0, d0
	fdiv	d1, d1, d9
	fadd	d0, d1, d0
	add	x0, sp, #16                     // =16
	fsub	d8, d0, d8
	bl	ftime
	ldr	h0, [sp, #24]
	ldr	x8, [sp, #16]
	mov	w10, #62915
	movk	w10, #16456, lsl #16
	ucvtf	d0, d0
	mov	w9, wzr
	fdiv	d0, d0, d9
	mov	z1.s, w10
.LBB6_21:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB6_22 Depth 2
	mov	x10, xzr
	whilelo	p0.s, xzr, x22
.LBB6_22:                               //   Parent Loop BB6_21 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ld1w	{ z2.s }, p0/z, [x19, x10, lsl #2]
	ld1w	{ z3.s }, p0/z, [x21, x10, lsl #2]
	fmul	z2.s, z2.s, z1.s
	fadd	z2.s, z3.s, z2.s
	st1w	{ z2.s }, p0, [x21, x10, lsl #2]
	incw	x10
	whilelo	p0.s, x10, x22
	b.mi	.LBB6_22
// %bb.23:                              //   in Loop: Header=BB6_21 Depth=1
	add	w9, w9, #1                      // =1
	cmp	w9, #20                         // =20
	b.ne	.LBB6_21
// %bb.24:
	fmov	d9, xzr
	scvtf	d1, x8
	add	x0, sp, #16                     // =16
	fadd	d10, d8, d9
	fadd	d8, d0, d1
	bl	ftime
	ldr	h1, [sp, #24]
	ldr	d0, [sp, #16]
	mov	x8, #70368744177664
	movk	x8, #16527, lsl #48
	ucvtf	d1, d1
	fmov	d2, x8
	scvtf	d0, d0
	fdiv	d1, d1, d2
	fadd	d0, d1, d0
	fsub	d0, d0, d8
	mov	x0, x20
	fadd	d11, d0, d9
	bl	print_vector
	adrp	x0, .L.str.5
	add	x0, x0, :lo12:.L.str.5
	bl	puts
	mov	x0, x21
	bl	print_vector
	adrp	x9, .LCPI6_1
	mov	x8, #225833675390976
	ldr	d0, [x9, :lo12:.LCPI6_1]
	movk	x8, #16845, lsl #48
	fmov	d1, x8
	adrp	x0, .Lstr
	fmul	d2, d10, d1
	fmul	d1, d11, d1
	add	x0, x0, :lo12:.Lstr
	fdiv	d8, d0, d2
	fdiv	d9, d0, d1
	bl	puts
	adrp	x0, .Lstr.12
	add	x0, x0, :lo12:.Lstr.12
	bl	puts
	adrp	x0, .Lstr.13
	add	x0, x0, :lo12:.Lstr.13
	bl	puts
	fmov	d12, #20.00000000
	adrp	x0, .L.str.9
	fdiv	d0, d10, d12
	add	x0, x0, :lo12:.L.str.9
	mov	v1.16b, v8.16b
	bl	printf
	adrp	x0, .L.str.10
	fdiv	d0, d11, d12
	add	x0, x0, :lo12:.L.str.10
	mov	v1.16b, v9.16b
	bl	printf
	mov	x8, xzr
	whilelo	p0.s, xzr, x22
	fmov	s0, wzr
.LBB6_25:                               // =>This Inner Loop Header: Depth=1
	ld1w	{ z1.s }, p0/z, [x20, x8, lsl #2]
	ld1w	{ z2.s }, p0/z, [x21, x8, lsl #2]
	incw	x8
	fsub	z1.s, z1.s, z2.s
	fadda	s0, p0, s0, z1.s
	whilelo	p0.s, x8, x22
	b.mi	.LBB6_25
// %bb.26:
	adrp	x0, .L.str.11
	fcvt	d0, s0
	add	x0, x0, :lo12:.L.str.11
	bl	printf
	mov	x0, x19
	bl	free
	mov	x0, x20
	bl	free
	mov	x0, x21
	bl	free
	mov	w0, wzr
	addvl	sp, sp, #1
	add	sp, sp, #32                     // =32
	ldp	x20, x19, [sp, #128]            // 16-byte Folded Reload
	ldp	x22, x21, [sp, #112]            // 16-byte Folded Reload
	ldp	x24, x23, [sp, #96]             // 16-byte Folded Reload
	ldp	x26, x25, [sp, #80]             // 16-byte Folded Reload
	ldp	x28, x27, [sp, #64]             // 16-byte Folded Reload
	ldp	x29, x30, [sp, #48]             // 16-byte Folded Reload
	ldp	d9, d8, [sp, #32]               // 16-byte Folded Reload
	ldp	d11, d10, [sp, #16]             // 16-byte Folded Reload
	ldr	d12, [sp], #144                 // 8-byte Folded Reload
	ret
.Lfunc_end6:
	.size	main, .Lfunc_end6-main
	.cfi_endproc
                                        // -- End function
	.type	.L.str.1,@object                // @.str.1
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.1:
	.asciz	"%.2f "
	.size	.L.str.1, 6

	.type	.L.str.2,@object                // @.str.2
.L.str.2:
	.asciz	"]"
	.size	.L.str.2, 2

	.type	.L.str.3,@object                // @.str.3
.L.str.3:
	.asciz	"%.2f\n"
	.size	.L.str.3, 6

	.type	.L.str.4,@object                // @.str.4
.L.str.4:
	.asciz	"=\n"
	.size	.L.str.4, 3

	.type	.L.str.5,@object                // @.str.5
.L.str.5:
	.asciz	"---------------------------------"
	.size	.L.str.5, 34

	.type	.L.str.9,@object                // @.str.9
.L.str.9:
	.asciz	"AXPY (SIMD):\t\t%4f\t%4f\n"
	.size	.L.str.9, 23

	.type	.L.str.10,@object               // @.str.10
.L.str.10:
	.asciz	"AXPY (Serial):\t\t%4f\t%4f\n"
	.size	.L.str.10, 25

	.type	.L.str.11,@object               // @.str.11
.L.str.11:
	.asciz	"Correctness check: %f\n"
	.size	.L.str.11, 23

	.type	.Lstr,@object                   // @str
.Lstr:
	.asciz	"=================================================================="
	.size	.Lstr, 67

	.type	.Lstr.12,@object                // @str.12
.Lstr.12:
	.asciz	"Performance:\t\t\tRuntime (s)\t GFLOPS"
	.size	.Lstr.12, 35

	.type	.Lstr.13,@object                // @str.13
.Lstr.13:
	.asciz	"------------------------------------------------------------------"
	.size	.Lstr.13, 67

	.ident	"Arm C/C++/Fortran Compiler version 21.0 (build number 879) (based on LLVM 11.0.0)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
