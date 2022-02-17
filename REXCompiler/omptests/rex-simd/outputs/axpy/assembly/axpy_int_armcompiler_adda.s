	.text
	.file	"axpy_int.c"
	.globl	read_timer                      // -- Begin function read_timer
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
	.p2align	5
	.type	init,@function
init:                                   // @init
	.cfi_startproc
// %bb.0:
	stp	x29, x30, [sp, #-48]!           // 16-byte Folded Spill
	stp	x22, x21, [sp, #16]             // 16-byte Folded Spill
	stp	x20, x19, [sp, #32]             // 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 48
	.cfi_offset w19, -8
	.cfi_offset w20, -16
	.cfi_offset w21, -24
	.cfi_offset w22, -32
	.cfi_offset w30, -40
	.cfi_offset w29, -48
	mov	w21, #52428
	mov	w22, #32768
	mov	x19, x1
	mov	x20, x0
	movk	w21, #3276, lsl #16
	movk	w22, #1562, lsl #16
	.p2align	5
.LBB1_1:                                // =>This Inner Loop Header: Depth=1
	bl	rand
	sdiv	w8, w0, w21
	str	w8, [x20], #4
	bl	rand
	sdiv	w8, w0, w21
	subs	x22, x22, #1                    // =1
	str	w8, [x19], #4
	b.ne	.LBB1_1
// %bb.2:
	ldp	x20, x19, [sp, #32]             // 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             // 16-byte Folded Reload
	ldp	x29, x30, [sp], #48             // 16-byte Folded Reload
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
	mov	z0.s, w2
	whilelo	p1.s, xzr, x9
	ptrue	p0.s
	.p2align	5
.LBB2_1:                                // =>This Inner Loop Header: Depth=1
	ld1w	{ z1.s }, p1/z, [x0, x8, lsl #2]
	ld1w	{ z2.s }, p1/z, [x1, x8, lsl #2]
	mad	z1.s, p0/m, z0.s, z2.s
	st1w	{ z1.s }, p1, [x1, x8, lsl #2]
	incw	x8
	whilelo	p1.s, x8, x9
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
	.p2align	5
.LBB3_2:                                // =>This Inner Loop Header: Depth=1
	ldr	w9, [x0], #4
	ldr	w10, [x1]
	subs	x8, x8, #1                      // =1
	madd	w9, w9, w2, w10
	str	w9, [x1], #4
	b.ne	.LBB3_2
	b	.LBB3_5
.LBB3_3:
	mov	x9, xzr
	mov	z0.s, w2
	whilelo	p1.s, xzr, x8
	ptrue	p0.s
	.p2align	5
.LBB3_4:                                // =>This Inner Loop Header: Depth=1
	ld1w	{ z1.s }, p1/z, [x0, x9, lsl #2]
	ld1w	{ z2.s }, p1/z, [x1, x9, lsl #2]
	mad	z1.s, p0/m, z0.s, z2.s
	st1w	{ z1.s }, p1, [x1, x9, lsl #2]
	incw	x9
	whilelo	p1.s, x9, x8
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
	ldr	w1, [x19]
	adrp	x20, .L.str.1
	add	x20, x20, :lo12:.L.str.1
	mov	x0, x20
	bl	printf
	ldr	w1, [x19, #4]
	mov	x0, x20
	bl	printf
	ldr	w1, [x19, #8]
	mov	x0, x20
	bl	printf
	ldr	w1, [x19, #12]
	mov	x0, x20
	bl	printf
	ldr	w1, [x19, #16]
	mov	x0, x20
	bl	printf
	ldr	w1, [x19, #20]
	mov	x0, x20
	bl	printf
	ldr	w1, [x19, #24]
	mov	x0, x20
	bl	printf
	ldr	w1, [x19, #28]
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
	mov	z0.s, #0                        // =0x0
	whilelo	p1.s, xzr, x9
	ptrue	p0.s
	.p2align	5
.LBB5_1:                                // =>This Inner Loop Header: Depth=1
	ld1w	{ z1.s }, p1/z, [x0, x8, lsl #2]
	ld1w	{ z2.s }, p1/z, [x1, x8, lsl #2]
	incw	x8
	add	z1.s, z1.s, z0.s
	sub	z1.s, z1.s, z2.s
	mov	z0.s, p1/m, z1.s
	whilelo	p1.s, x8, x9
	b.mi	.LBB5_1
// %bb.2:
	uaddv	d0, p0, z0.s
	fmov	x0, d0
                                        // kill: def $w0 killed $w0 killed $x0
	ret
.Lfunc_end5:
	.size	check, .Lfunc_end5-check
	.cfi_endproc
                                        // -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3                               // -- Begin function main
.LCPI6_0:
	.xword	0x43974876e8000000              // double 4.194304E+17
	.text
	.globl	main
	.p2align	5
	.type	main,@function
main:                                   // @main
	.cfi_startproc
// %bb.0:
	sub	sp, sp, #144                    // =144
	str	d12, [sp, #16]                  // 8-byte Folded Spill
	stp	d11, d10, [sp, #32]             // 16-byte Folded Spill
	stp	d9, d8, [sp, #48]               // 16-byte Folded Spill
	stp	x29, x30, [sp, #64]             // 16-byte Folded Spill
	stp	x26, x25, [sp, #80]             // 16-byte Folded Spill
	stp	x24, x23, [sp, #96]             // 16-byte Folded Spill
	stp	x22, x21, [sp, #112]            // 16-byte Folded Spill
	stp	x20, x19, [sp, #128]            // 16-byte Folded Spill
	add	x29, sp, #16                    // =16
	.cfi_def_cfa w29, 128
	.cfi_offset w19, -8
	.cfi_offset w20, -16
	.cfi_offset w21, -24
	.cfi_offset w22, -32
	.cfi_offset w23, -40
	.cfi_offset w24, -48
	.cfi_offset w25, -56
	.cfi_offset w26, -64
	.cfi_offset w30, -72
	.cfi_offset w29, -80
	.cfi_offset b8, -88
	.cfi_offset b9, -96
	.cfi_offset b10, -104
	.cfi_offset b11, -112
	.cfi_offset b12, -128
	mov	w23, #52428
	mov	w0, #409600000
	movk	w23, #3276, lsl #16
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
	mov	x24, xzr
	.p2align	5
.LBB6_1:                                // =>This Inner Loop Header: Depth=1
	bl	rand
	sdiv	w8, w0, w23
	str	w8, [x19, x24]
	bl	rand
	sdiv	w8, w0, w23
	str	w8, [x20, x24]
	add	x24, x24, #4                    // =4
	cmp	x24, x22
	b.ne	.LBB6_1
// %bb.2:
	rdvl	x24, #1
	cmp	x24, #17                        // =17
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
	adrp	x0, .L.str.3
	add	x0, x0, :lo12:.L.str.3
	mov	w1, #3
	bl	printf
	adrp	x0, .L.str.4
	add	x0, x0, :lo12:.L.str.4
	bl	puts
	mov	x8, xzr
	whilelo	p0.s, xzr, x22
	mov	z2.s, #3                        // =0x3
	ptrue	p1.s
	.p2align	5
.LBB6_7:                                // =>This Inner Loop Header: Depth=1
	ld1w	{ z0.s }, p0/z, [x19, x8, lsl #2]
	ld1w	{ z1.s }, p0/z, [x20, x8, lsl #2]
	mad	z0.s, p1/m, z2.s, z1.s
	st1w	{ z0.s }, p0, [x20, x8, lsl #2]
	incw	x8
	whilelo	p0.s, x8, x22
	b.mi	.LBB6_7
// %bb.8:
	mov	x8, xzr
	whilelo	p0.s, xzr, x22
	.p2align	5
.LBB6_9:                                // =>This Inner Loop Header: Depth=1
	ld1w	{ z0.s }, p0/z, [x19, x8, lsl #2]
	ld1w	{ z1.s }, p0/z, [x21, x8, lsl #2]
	mad	z0.s, p1/m, z2.s, z1.s
	st1w	{ z0.s }, p0, [x21, x8, lsl #2]
	incw	x8
	whilelo	p0.s, x8, x22
	b.mi	.LBB6_9
// %bb.10:
	mov	x25, xzr
	mov	w26, #409600000
	.p2align	5
.LBB6_11:                               // =>This Inner Loop Header: Depth=1
	bl	rand
	sdiv	w8, w0, w23
	str	w8, [x19, x25]
	bl	rand
	sdiv	w8, w0, w23
	str	w8, [x20, x25]
	add	x25, x25, #4                    // =4
	cmp	x25, x26
	b.ne	.LBB6_11
// %bb.12:
	cmp	x24, #17                        // =17
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
	ldr	h0, [sp, #8]
	ldr	x9, [sp]
	mov	x10, #70368744177664
	movk	x10, #16527, lsl #48
	ucvtf	d0, d0
	fmov	d1, x10
	mov	w8, wzr
	fdiv	d0, d0, d1
	ptrue	p1.s
	mov	z3.s, #3                        // =0x3
	.p2align	5
.LBB6_17:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB6_18 Depth 2
	mov	x10, xzr
	whilelo	p0.s, xzr, x22
	.p2align	5
.LBB6_18:                               //   Parent Loop BB6_17 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ld1w	{ z1.s }, p0/z, [x19, x10, lsl #2]
	ld1w	{ z2.s }, p0/z, [x20, x10, lsl #2]
	mad	z1.s, p1/m, z3.s, z2.s
	st1w	{ z1.s }, p0, [x20, x10, lsl #2]
	incw	x10
	whilelo	p0.s, x10, x22
	b.mi	.LBB6_18
// %bb.19:                              //   in Loop: Header=BB6_17 Depth=1
	add	w8, w8, #1                      // =1
	cmp	w8, #20                         // =20
	b.ne	.LBB6_17
// %bb.20:
	scvtf	d1, x9
	mov	x0, sp
	fadd	d8, d0, d1
	bl	ftime
	ldr	h1, [sp, #8]
	ldr	d0, [sp]
	mov	x8, #70368744177664
	movk	x8, #16527, lsl #48
	ucvtf	d1, d1
	fmov	d9, x8
	scvtf	d0, d0
	fdiv	d1, d1, d9
	fadd	d0, d1, d0
	mov	x0, sp
	fsub	d8, d0, d8
	bl	ftime
	ldr	h0, [sp, #8]
	ldr	x8, [sp]
	mov	z3.s, #3                        // =0x3
	ptrue	p1.s
	ucvtf	d0, d0
	mov	w9, wzr
	fdiv	d0, d0, d9
	.p2align	5
.LBB6_21:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB6_22 Depth 2
	mov	x10, xzr
	whilelo	p0.s, xzr, x22
	.p2align	5
.LBB6_22:                               //   Parent Loop BB6_21 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ld1w	{ z1.s }, p0/z, [x19, x10, lsl #2]
	ld1w	{ z2.s }, p0/z, [x21, x10, lsl #2]
	mad	z1.s, p1/m, z3.s, z2.s
	st1w	{ z1.s }, p0, [x21, x10, lsl #2]
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
	mov	x0, sp
	fadd	d10, d8, d9
	fadd	d8, d0, d1
	bl	ftime
	ldr	h1, [sp, #8]
	ldr	d0, [sp]
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
	adrp	x9, .LCPI6_0
	mov	x8, #225833675390976
	ldr	d0, [x9, :lo12:.LCPI6_0]
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
	mov	z0.s, #0                        // =0x0
	.p2align	5
.LBB6_25:                               // =>This Inner Loop Header: Depth=1
	ld1w	{ z1.s }, p0/z, [x20, x8, lsl #2]
	ld1w	{ z2.s }, p0/z, [x21, x8, lsl #2]
	incw	x8
	add	z1.s, z1.s, z0.s
	sub	z1.s, z1.s, z2.s
	mov	z0.s, p0/m, z1.s
	whilelo	p0.s, x8, x22
	b.mi	.LBB6_25
// %bb.26:
	ptrue	p0.s
	uaddv	d0, p0, z0.s
	adrp	x0, .L.str.11
	fmov	x1, d0
	add	x0, x0, :lo12:.L.str.11
                                        // kill: def $w1 killed $w1 killed $x1
	bl	printf
	mov	x0, x19
	bl	free
	mov	x0, x20
	bl	free
	mov	x0, x21
	bl	free
	ldp	x20, x19, [sp, #128]            // 16-byte Folded Reload
	ldp	x22, x21, [sp, #112]            // 16-byte Folded Reload
	ldp	x24, x23, [sp, #96]             // 16-byte Folded Reload
	ldp	x26, x25, [sp, #80]             // 16-byte Folded Reload
	ldp	x29, x30, [sp, #64]             // 16-byte Folded Reload
	ldp	d9, d8, [sp, #48]               // 16-byte Folded Reload
	ldp	d11, d10, [sp, #32]             // 16-byte Folded Reload
	ldr	d12, [sp, #16]                  // 8-byte Folded Reload
	mov	w0, wzr
	add	sp, sp, #144                    // =144
	ret
.Lfunc_end6:
	.size	main, .Lfunc_end6-main
	.cfi_endproc
                                        // -- End function
	.type	.L.str.1,@object                // @.str.1
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.1:
	.asciz	"%d "
	.size	.L.str.1, 4

	.type	.L.str.2,@object                // @.str.2
.L.str.2:
	.asciz	"]"
	.size	.L.str.2, 2

	.type	.L.str.3,@object                // @.str.3
.L.str.3:
	.asciz	"%d\n"
	.size	.L.str.3, 4

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
	.asciz	"Correctness check: %d\n"
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
