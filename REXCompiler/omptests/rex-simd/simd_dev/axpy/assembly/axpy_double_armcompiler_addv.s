	.text
	.file	"axpy_double.c"
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3                               // -- Begin function read_timer
.LCPI0_0:
	.xword	0x3f50624dd2f1a9fc              // double 0.001
	.text
	.globl	read_timer
	.p2align	5
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
	ldr	d0, [sp]
	ldr	h1, [sp, #8]
	adrp	x8, .LCPI0_0
	ldr	d2, [x8, :lo12:.LCPI0_0]
	ldp	x29, x30, [sp, #16]             // 16-byte Folded Reload
	scvtf	d0, d0
	ucvtf	d1, d1
	fmadd	d0, d1, d2, d0
	add	sp, sp, #32                     // =32
	ret
.Lfunc_end0:
	.size	read_timer, .Lfunc_end0-read_timer
	.cfi_endproc
                                        // -- End function
	.globl	init                            // -- Begin function init
	.p2align	5
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
	mov	x22, #2621440
	mov	x19, x1
	mov	x20, x0
	movk	w21, #1562, lsl #16
	movk	x22, #15924, lsl #48
	.p2align	5
.LBB1_1:                                // =>This Inner Loop Header: Depth=1
	bl	rand
	scvtf	d0, w0
	fmov	d8, x22
	fmul	d0, d0, d8
	str	d0, [x20], #8
	bl	rand
	scvtf	d0, w0
	fmul	d0, d0, d8
	subs	x21, x21, #1                    // =1
	str	d0, [x19], #8
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
	.p2align	5
	.type	axpy,@function
axpy:                                   // @axpy
	.cfi_startproc
// %bb.0:
	mov	w9, #32768
	movk	w9, #1562, lsl #16
	mov	x8, xzr
	mov	z0.d, d0
	whilelo	p1.d, xzr, x9
	ptrue	p0.d
	.p2align	5
.LBB2_1:                                // =>This Inner Loop Header: Depth=1
	ld1d	{ z1.d }, p1/z, [x0, x8, lsl #3]
	ld1d	{ z2.d }, p1/z, [x1, x8, lsl #3]
	fmad	z1.d, p0/m, z0.d, z2.d
	st1d	{ z1.d }, p1, [x1, x8, lsl #3]
	incd	x8
	whilelo	p1.d, x8, x9
	b.mi	.LBB2_1
// %bb.2:
	ret
.Lfunc_end2:
	.size	axpy, .Lfunc_end2-axpy
	.cfi_endproc
                                        // -- End function
	.globl	axpy_serial                     // -- Begin function axpy_serial
	.p2align	5
	.type	axpy_serial,@function
axpy_serial:                            // @axpy_serial
	.cfi_startproc
// %bb.0:
	mov	w9, #819200000
	add	x8, x0, x9
	cmp	x8, x1
	mov	w8, #32768
	movk	w8, #1562, lsl #16
	b.ls	.LBB3_3
// %bb.1:
	add	x9, x1, x9
	cmp	x9, x0
	b.ls	.LBB3_3
	.p2align	5
.LBB3_2:                                // =>This Inner Loop Header: Depth=1
	ldr	d1, [x0], #8
	ldr	d2, [x1]
	subs	x8, x8, #1                      // =1
	fmadd	d1, d1, d0, d2
	str	d1, [x1], #8
	b.ne	.LBB3_2
	b	.LBB3_5
.LBB3_3:
	mov	x9, xzr
	mov	z0.d, d0
	whilelo	p1.d, xzr, x8
	ptrue	p0.d
	.p2align	5
.LBB3_4:                                // =>This Inner Loop Header: Depth=1
	ld1d	{ z1.d }, p1/z, [x0, x9, lsl #3]
	ld1d	{ z2.d }, p1/z, [x1, x9, lsl #3]
	fmad	z1.d, p0/m, z0.d, z2.d
	st1d	{ z1.d }, p1, [x1, x9, lsl #3]
	incd	x9
	whilelo	p1.d, x9, x8
	b.mi	.LBB3_4
.LBB3_5:
	ret
.Lfunc_end3:
	.size	axpy_serial, .Lfunc_end3-axpy_serial
	.cfi_endproc
                                        // -- End function
	.globl	print_vector                    // -- Begin function print_vector
	.p2align	5
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
	ldr	d0, [x19]
	adrp	x20, .L.str.1
	add	x20, x20, :lo12:.L.str.1
	mov	x0, x20
	bl	printf
	ldr	d0, [x19, #8]
	mov	x0, x20
	bl	printf
	ldr	d0, [x19, #16]
	mov	x0, x20
	bl	printf
	ldr	d0, [x19, #24]
	mov	x0, x20
	bl	printf
	ldr	d0, [x19, #32]
	mov	x0, x20
	bl	printf
	ldr	d0, [x19, #40]
	mov	x0, x20
	bl	printf
	ldr	d0, [x19, #48]
	mov	x0, x20
	bl	printf
	ldr	d0, [x19, #56]
	mov	x0, x20
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
	.p2align	5
	.type	check,@function
check:                                  // @check
	.cfi_startproc
// %bb.0:
	mov	w9, #32768
	movk	w9, #1562, lsl #16
	mov	x8, xzr
	mov	z0.d, #0                        // =0x0
	whilelo	p1.d, xzr, x9
	ptrue	p0.d
	.p2align	5
.LBB5_1:                                // =>This Inner Loop Header: Depth=1
	ld1d	{ z1.d }, p1/z, [x0, x8, lsl #3]
	ld1d	{ z2.d }, p1/z, [x1, x8, lsl #3]
	incd	x8
	fadd	z1.d, z1.d, z0.d
	fsub	z1.d, z1.d, z2.d
	mov	z0.d, p1/m, z1.d
	whilelo	p1.d, x8, x9
	b.mi	.LBB5_1
// %bb.2:
	faddv	d0, p0, z0.d
                                        // kill: def $d0 killed $d0 killed $z0
	ret
.Lfunc_end5:
	.size	check, .Lfunc_end5-check
	.cfi_endproc
                                        // -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3                               // -- Begin function main
.LCPI6_0:
	.xword	0x40091eb851eb851f              // double 3.1400000000000001
.LCPI6_1:
	.xword	0x3f50624dd2f1a9fc              // double 0.001
.LCPI6_2:
	.xword	0x3fa999999999999a              // double 0.050000000000000003
	.text
	.globl	main
	.p2align	5
	.type	main,@function
main:                                   // @main
	.cfi_startproc
// %bb.0:
	stp	d13, d12, [sp, #-144]!          // 16-byte Folded Spill
	stp	d11, d10, [sp, #16]             // 16-byte Folded Spill
	stp	d9, d8, [sp, #32]               // 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             // 16-byte Folded Spill
	str	x28, [sp, #64]                  // 8-byte Folded Spill
	stp	x26, x25, [sp, #80]             // 16-byte Folded Spill
	stp	x24, x23, [sp, #96]             // 16-byte Folded Spill
	stp	x22, x21, [sp, #112]            // 16-byte Folded Spill
	stp	x20, x19, [sp, #128]            // 16-byte Folded Spill
	mov	x29, sp
	addvl	sp, sp, #-1
	sub	sp, sp, #16                     // =16
	.cfi_def_cfa w29, 144
	.cfi_offset w19, -8
	.cfi_offset w20, -16
	.cfi_offset w21, -24
	.cfi_offset w22, -32
	.cfi_offset w23, -40
	.cfi_offset w24, -48
	.cfi_offset w25, -56
	.cfi_offset w26, -64
	.cfi_offset w28, -80
	.cfi_offset w30, -88
	.cfi_offset w29, -96
	.cfi_offset b8, -104
	.cfi_offset b9, -112
	.cfi_offset b10, -120
	.cfi_offset b11, -128
	.cfi_offset b12, -136
	.cfi_offset b13, -144
	mov	w0, #819200000
	mov	w22, #819200000
	bl	malloc
	mov	x19, x0
	mov	w0, #819200000
	bl	malloc
	mov	x20, x0
	mov	w0, #819200000
	bl	malloc
	mov	x21, x0
	mov	x0, xzr
	bl	time
                                        // kill: def $w0 killed $w0 killed $x0
	bl	srand
	mov	x24, #2621440
	mov	x23, xzr
	movk	x24, #15924, lsl #48
	.p2align	5
.LBB6_1:                                // =>This Inner Loop Header: Depth=1
	bl	rand
	scvtf	d0, w0
	fmov	d8, x24
	fmul	d0, d0, d8
	str	d0, [x19, x23]
	bl	rand
	scvtf	d0, w0
	fmul	d0, d0, d8
	str	d0, [x20, x23]
	add	x23, x23, #8                    // =8
	cmp	x23, x22
	b.ne	.LBB6_1
// %bb.2:
	rdvl	x23, #1
	cmp	x23, #17                        // =17
	b.hs	.LBB6_4
// %bb.3:
	mov	w2, #819200000
	mov	x0, x21
	mov	x1, x20
	bl	memcpy
	b	.LBB6_6
.LBB6_4:
	mov	w9, #819200000
	mov	x8, xzr
	whilelo	p0.b, xzr, x9
	.p2align	5
.LBB6_5:                                // =>This Inner Loop Header: Depth=1
	ld1b	{ z0.b }, p0/z, [x20, x8]
	st1b	{ z0.b }, p0, [x21, x8]
	addvl	x8, x8, #1
	whilelo	p0.b, x8, x9
	b.mi	.LBB6_5
.LBB6_6:
	mov	w22, #32768
	mov	x0, x20
	movk	w22, #1562, lsl #16
	bl	print_vector
	mov	x0, x19
	bl	print_vector
	adrp	x8, .LCPI6_0
	ldr	d8, [x8, :lo12:.LCPI6_0]
	adrp	x0, .L.str.3
	add	x0, x0, :lo12:.L.str.3
	mov	v0.16b, v8.16b
	bl	printf
	adrp	x0, .L.str.4
	add	x0, x0, :lo12:.L.str.4
	bl	puts
	mov	x8, xzr
	whilelo	p0.d, xzr, x22
	mov	z2.d, d8
	ptrue	p1.d
	.p2align	5
.LBB6_7:                                // =>This Inner Loop Header: Depth=1
	ld1d	{ z0.d }, p0/z, [x19, x8, lsl #3]
	ld1d	{ z1.d }, p0/z, [x20, x8, lsl #3]
	fmad	z0.d, p1/m, z2.d, z1.d
	st1d	{ z0.d }, p0, [x20, x8, lsl #3]
	incd	x8
	whilelo	p0.d, x8, x22
	b.mi	.LBB6_7
// %bb.8:
	mov	x8, xzr
	whilelo	p0.d, xzr, x22
	.p2align	5
.LBB6_9:                                // =>This Inner Loop Header: Depth=1
	ld1d	{ z0.d }, p0/z, [x19, x8, lsl #3]
	ld1d	{ z1.d }, p0/z, [x21, x8, lsl #3]
	fmad	z0.d, p1/m, z2.d, z1.d
	st1d	{ z0.d }, p0, [x21, x8, lsl #3]
	incd	x8
	whilelo	p0.d, x8, x22
	b.mi	.LBB6_9
// %bb.10:
	mov	x25, #2621440
	mov	x24, xzr
	movk	x25, #15924, lsl #48
	mov	w26, #819200000
	str	z2, [x29, #-1, mul vl]          // 16-byte Folded Spill
	.p2align	5
.LBB6_11:                               // =>This Inner Loop Header: Depth=1
	bl	rand
	scvtf	d0, w0
	fmov	d8, x25
	fmul	d0, d0, d8
	str	d0, [x19, x24]
	bl	rand
	scvtf	d0, w0
	fmul	d0, d0, d8
	str	d0, [x20, x24]
	add	x24, x24, #8                    // =8
	cmp	x24, x26
	b.ne	.LBB6_11
// %bb.12:
	cmp	x23, #17                        // =17
	b.hs	.LBB6_14
// %bb.13:
	mov	w2, #819200000
	mov	x0, x21
	mov	x1, x20
	bl	memcpy
	b	.LBB6_16
.LBB6_14:
	mov	w9, #819200000
	mov	x8, xzr
	whilelo	p0.b, xzr, x9
	.p2align	5
.LBB6_15:                               // =>This Inner Loop Header: Depth=1
	ld1b	{ z0.b }, p0/z, [x20, x8]
	st1b	{ z0.b }, p0, [x21, x8]
	addvl	x8, x8, #1
	whilelo	p0.b, x8, x9
	b.mi	.LBB6_15
.LBB6_16:
	mov	x0, sp
	bl	ftime
	ldr	x8, [sp]
	ldrh	w9, [sp, #8]
	ldr	z2, [x29, #-1, mul vl]          // 16-byte Folded Reload
	mov	w10, wzr
	ptrue	p1.d
	.p2align	5
.LBB6_17:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB6_18 Depth 2
	mov	x11, xzr
	whilelo	p0.d, xzr, x22
	.p2align	5
.LBB6_18:                               //   Parent Loop BB6_17 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ld1d	{ z0.d }, p0/z, [x19, x11, lsl #3]
	ld1d	{ z1.d }, p0/z, [x20, x11, lsl #3]
	fmad	z0.d, p1/m, z2.d, z1.d
	st1d	{ z0.d }, p0, [x20, x11, lsl #3]
	incd	x11
	whilelo	p0.d, x11, x22
	b.mi	.LBB6_18
// %bb.19:                              //   in Loop: Header=BB6_17 Depth=1
	add	w10, w10, #1                    // =1
	cmp	w10, #20                        // =20
	b.ne	.LBB6_17
// %bb.20:
	mov	x0, sp
	scvtf	d9, x8
	ucvtf	d8, w9
	bl	ftime
	ldr	d0, [sp]
	ldr	h1, [sp, #8]
	mov	x0, sp
	scvtf	d0, d0
	ucvtf	d1, d1
	fsub	d8, d1, d8
	fsub	d9, d0, d9
	bl	ftime
	ldr	z2, [x29, #-1, mul vl]          // 16-byte Folded Reload
	ldr	x9, [sp]
	ldrh	w8, [sp, #8]
	ptrue	p1.d
	mov	w10, wzr
	.p2align	5
.LBB6_21:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB6_22 Depth 2
	mov	x11, xzr
	whilelo	p0.d, xzr, x22
	.p2align	5
.LBB6_22:                               //   Parent Loop BB6_21 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ld1d	{ z0.d }, p0/z, [x19, x11, lsl #3]
	ld1d	{ z1.d }, p0/z, [x21, x11, lsl #3]
	fmad	z0.d, p1/m, z2.d, z1.d
	st1d	{ z0.d }, p0, [x21, x11, lsl #3]
	incd	x11
	whilelo	p0.d, x11, x22
	b.mi	.LBB6_22
// %bb.23:                              //   in Loop: Header=BB6_21 Depth=1
	add	w10, w10, #1                    // =1
	cmp	w10, #20                        // =20
	b.ne	.LBB6_21
// %bb.24:
	adrp	x10, .LCPI6_1
	ldr	d10, [x10, :lo12:.LCPI6_1]
	mov	x10, #4735816483156787200
	fmov	d12, x10
	mov	x0, sp
	fmadd	d13, d8, d10, d9
	frecpe	d0, d13
	frecps	d1, d13, d0
	fmul	d0, d0, d1
	frecps	d1, d13, d0
	fmul	d0, d0, d1
	frecps	d1, d13, d0
	fmul	d1, d1, d12
	scvtf	d11, x9
	fmul	d8, d0, d1
	ucvtf	d9, w8
	bl	ftime
	ldr	d0, [sp]
	ldr	h1, [sp, #8]
	mov	x0, x20
	scvtf	d0, d0
	ucvtf	d1, d1
	fsub	d1, d1, d9
	fsub	d0, d0, d11
	fmadd	d10, d1, d10, d0
	frecpe	d0, d10
	frecps	d1, d10, d0
	fmul	d0, d0, d1
	frecps	d1, d10, d0
	fmul	d0, d0, d1
	frecps	d1, d10, d0
	fmul	d1, d1, d12
	fmul	d9, d0, d1
	bl	print_vector
	adrp	x0, .L.str.5
	add	x0, x0, :lo12:.L.str.5
	bl	puts
	mov	x0, x21
	bl	print_vector
	adrp	x0, .Lstr
	add	x0, x0, :lo12:.Lstr
	bl	puts
	adrp	x0, .Lstr.12
	add	x0, x0, :lo12:.Lstr.12
	bl	puts
	adrp	x0, .Lstr.13
	add	x0, x0, :lo12:.Lstr.13
	bl	puts
	adrp	x8, .LCPI6_2
	ldr	d11, [x8, :lo12:.LCPI6_2]
	adrp	x0, .L.str.9
	add	x0, x0, :lo12:.L.str.9
	mov	v1.16b, v8.16b
	fmul	d0, d13, d11
	bl	printf
	adrp	x0, .L.str.10
	fmul	d0, d10, d11
	add	x0, x0, :lo12:.L.str.10
	mov	v1.16b, v9.16b
	bl	printf
	mov	x8, xzr
	whilelo	p0.d, xzr, x22
	mov	z0.d, #0                        // =0x0
	.p2align	5
.LBB6_25:                               // =>This Inner Loop Header: Depth=1
	ld1d	{ z1.d }, p0/z, [x20, x8, lsl #3]
	ld1d	{ z2.d }, p0/z, [x21, x8, lsl #3]
	incd	x8
	fadd	z1.d, z1.d, z0.d
	fsub	z1.d, z1.d, z2.d
	mov	z0.d, p0/m, z1.d
	whilelo	p0.d, x8, x22
	b.mi	.LBB6_25
// %bb.26:
	ptrue	p0.d
	adrp	x0, .L.str.11
	faddv	d0, p0, z0.d
	add	x0, x0, :lo12:.L.str.11
                                        // kill: def $d0 killed $d0 killed $z0
	bl	printf
	mov	x0, x19
	bl	free
	mov	x0, x20
	bl	free
	mov	x0, x21
	bl	free
	mov	w0, wzr
	addvl	sp, sp, #1
	add	sp, sp, #16                     // =16
	ldp	x20, x19, [sp, #128]            // 16-byte Folded Reload
	ldp	x22, x21, [sp, #112]            // 16-byte Folded Reload
	ldp	x24, x23, [sp, #96]             // 16-byte Folded Reload
	ldp	x26, x25, [sp, #80]             // 16-byte Folded Reload
	ldr	x28, [sp, #64]                  // 8-byte Folded Reload
	ldp	x29, x30, [sp, #48]             // 16-byte Folded Reload
	ldp	d9, d8, [sp, #32]               // 16-byte Folded Reload
	ldp	d11, d10, [sp, #16]             // 16-byte Folded Reload
	ldp	d13, d12, [sp], #144            // 16-byte Folded Reload
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
