	.text
	.file	"matvec_int.c"
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
	stp	x29, x30, [sp, #-64]!           // 16-byte Folded Spill
	stp	x24, x23, [sp, #16]             // 16-byte Folded Spill
	stp	x22, x21, [sp, #32]             // 16-byte Folded Spill
	stp	x20, x19, [sp, #48]             // 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 64
	.cfi_offset w19, -8
	.cfi_offset w20, -16
	.cfi_offset w21, -24
	.cfi_offset w22, -32
	.cfi_offset w23, -40
	.cfi_offset w24, -48
	.cfi_offset w30, -56
	.cfi_offset w29, -64
	mov	w22, #52428
	mov	x19, x1
	mov	x20, x0
	mov	x21, xzr
	movk	w22, #3276, lsl #16
	mov	w23, #10240
	.p2align	5
.LBB1_1:                                // =>This Loop Header: Depth=1
                                        //     Child Loop BB1_2 Depth 2
	bl	rand
	mov	x24, xzr
	sdiv	w8, w0, w22
	.p2align	5
.LBB1_2:                                //   Parent Loop BB1_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	str	w8, [x20, x24]
	bl	rand
	add	x24, x24, #4                    // =4
	cmp	x24, #10, lsl #12               // =40960
	sdiv	w8, w0, w22
	b.ne	.LBB1_2
// %bb.3:                               //   in Loop: Header=BB1_1 Depth=1
	str	w8, [x19, x21, lsl #2]
	add	x21, x21, #1                    // =1
	cmp	x21, x23
	add	x20, x20, #10, lsl #12          // =40960
	b.ne	.LBB1_1
// %bb.4:
	ldp	x20, x19, [sp, #48]             // 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]             // 16-byte Folded Reload
	ldp	x24, x23, [sp, #16]             // 16-byte Folded Reload
	ldp	x29, x30, [sp], #64             // 16-byte Folded Reload
	ret
.Lfunc_end1:
	.size	init, .Lfunc_end1-init
	.cfi_endproc
                                        // -- End function
	.globl	matvec_simd                     // -- Begin function matvec_simd
	.p2align	5
	.type	matvec_simd,@function
matvec_simd:                            // @matvec_simd
	.cfi_startproc
// %bb.0:
	mov	x8, xzr
	mov	w9, #10240
	mov	z0.s, #0                        // =0x0
	ptrue	p0.s
	.p2align	5
.LBB2_1:                                // =>This Loop Header: Depth=1
                                        //     Child Loop BB2_2 Depth 2
	mov	x10, xzr
	whilelo	p1.s, xzr, x9
	mov	z1.d, z0.d
	.p2align	5
.LBB2_2:                                //   Parent Loop BB2_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ld1w	{ z2.s }, p1/z, [x0, x10, lsl #2]
	ld1w	{ z3.s }, p1/z, [x1, x10, lsl #2]
	incw	x10
	mla	z1.s, p1/m, z3.s, z2.s
	whilelo	p1.s, x10, x9
	b.mi	.LBB2_2
// %bb.3:                               //   in Loop: Header=BB2_1 Depth=1
	uaddv	d1, p0, z1.s
	fmov	x10, d1
	str	w10, [x2, x8, lsl #2]
	add	x8, x8, #1                      // =1
	cmp	x8, x9
	add	x0, x0, #10, lsl #12            // =40960
	b.ne	.LBB2_1
// %bb.4:
	ret
.Lfunc_end2:
	.size	matvec_simd, .Lfunc_end2-matvec_simd
	.cfi_endproc
                                        // -- End function
	.globl	matvec_serial                   // -- Begin function matvec_serial
	.p2align	5
	.type	matvec_serial,@function
matvec_serial:                          // @matvec_serial
	.cfi_startproc
// %bb.0:
	mov	x8, xzr
	mov	w9, #10240
	mov	z0.s, #0                        // =0x0
	ptrue	p0.s
	.p2align	5
.LBB3_1:                                // =>This Loop Header: Depth=1
                                        //     Child Loop BB3_2 Depth 2
	mov	x10, xzr
	whilelo	p1.s, xzr, x9
	mov	z1.d, z0.d
	.p2align	5
.LBB3_2:                                //   Parent Loop BB3_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ld1w	{ z2.s }, p1/z, [x0, x10, lsl #2]
	ld1w	{ z3.s }, p1/z, [x1, x10, lsl #2]
	incw	x10
	mla	z1.s, p1/m, z3.s, z2.s
	whilelo	p1.s, x10, x9
	b.mi	.LBB3_2
// %bb.3:                               //   in Loop: Header=BB3_1 Depth=1
	uaddv	d1, p0, z1.s
	fmov	x10, d1
	str	w10, [x2, x8, lsl #2]
	add	x8, x8, #1                      // =1
	cmp	x8, x9
	add	x0, x0, #10, lsl #12            // =40960
	b.ne	.LBB3_1
// %bb.4:
	ret
.Lfunc_end3:
	.size	matvec_serial, .Lfunc_end3-matvec_serial
	.cfi_endproc
                                        // -- End function
	.globl	print_matrix                    // -- Begin function print_matrix
	.p2align	5
	.type	print_matrix,@function
print_matrix:                           // @print_matrix
	.cfi_startproc
// %bb.0:
	stp	x29, x30, [sp, #-64]!           // 16-byte Folded Spill
	str	x23, [sp, #16]                  // 8-byte Folded Spill
	stp	x22, x21, [sp, #32]             // 16-byte Folded Spill
	stp	x20, x19, [sp, #48]             // 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 64
	.cfi_offset w19, -8
	.cfi_offset w20, -16
	.cfi_offset w21, -24
	.cfi_offset w22, -32
	.cfi_offset w23, -48
	.cfi_offset w30, -56
	.cfi_offset w29, -64
	adrp	x19, .L.str.1
	adrp	x20, .L.str.2
	mov	x21, xzr
	add	x22, x0, #16                    // =16
	add	x19, x19, :lo12:.L.str.1
	add	x20, x20, :lo12:.L.str.2
	.p2align	5
.LBB4_1:                                // =>This Inner Loop Header: Depth=1
	mov	w0, #91
	bl	putchar
	add	x23, x22, x21
	ldur	w1, [x23, #-16]
	mov	x0, x19
	bl	printf
	ldur	w1, [x23, #-12]
	mov	x0, x19
	bl	printf
	ldur	w1, [x23, #-8]
	mov	x0, x19
	bl	printf
	ldur	w1, [x23, #-4]
	mov	x0, x19
	bl	printf
	ldr	w1, [x23]
	mov	x0, x19
	bl	printf
	ldr	w1, [x23, #4]
	mov	x0, x19
	bl	printf
	ldr	w1, [x23, #8]
	mov	x0, x19
	bl	printf
	ldr	w1, [x23, #12]
	mov	x0, x19
	bl	printf
	mov	x0, x20
	bl	puts
	add	x21, x21, #10, lsl #12          // =40960
	cmp	x21, #80, lsl #12               // =327680
	b.ne	.LBB4_1
// %bb.2:
	ldp	x20, x19, [sp, #48]             // 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]             // 16-byte Folded Reload
	ldr	x23, [sp, #16]                  // 8-byte Folded Reload
	mov	w0, #10
	ldp	x29, x30, [sp], #64             // 16-byte Folded Reload
	b	putchar
.Lfunc_end4:
	.size	print_matrix, .Lfunc_end4-print_matrix
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
.Lfunc_end5:
	.size	print_vector, .Lfunc_end5-print_vector
	.cfi_endproc
                                        // -- End function
	.globl	check                           // -- Begin function check
	.p2align	5
	.type	check,@function
check:                                  // @check
	.cfi_startproc
// %bb.0:
	mov	w9, #10240
	mov	x8, xzr
	mov	z0.s, #0                        // =0x0
	whilelo	p1.s, xzr, x9
	ptrue	p0.s
	.p2align	5
.LBB6_1:                                // =>This Inner Loop Header: Depth=1
	ld1w	{ z1.s }, p1/z, [x0, x8, lsl #2]
	ld1w	{ z2.s }, p1/z, [x1, x8, lsl #2]
	incw	x8
	sub	z1.s, z1.s, z2.s
	asr	z2.s, z1.s, #31
	add	z1.s, z1.s, z2.s
	eor	z1.d, z1.d, z2.d
	add	z0.s, p1/m, z0.s, z1.s
	whilelo	p1.s, x8, x9
	b.mi	.LBB6_1
// %bb.2:
	uaddv	d0, p0, z0.s
	fmov	x0, d0
                                        // kill: def $w0 killed $w0 killed $x0
	ret
.Lfunc_end6:
	.size	check, .Lfunc_end6-check
	.cfi_endproc
                                        // -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3                               // -- Begin function main
.LCPI7_0:
	.xword	0x3f50624dd2f1a9fc              // double 0.001
.LCPI7_1:
	.xword	0x4010c6f7a0b5ed8d              // double 4.1943039999999998
.LCPI7_2:
	.xword	0x3fa999999999999a              // double 0.050000000000000003
	.text
	.globl	main
	.p2align	5
	.type	main,@function
main:                                   // @main
	.cfi_startproc
// %bb.0:
	sub	sp, sp, #160                    // =160
	stp	d13, d12, [sp, #16]             // 16-byte Folded Spill
	stp	d11, d10, [sp, #32]             // 16-byte Folded Spill
	stp	d9, d8, [sp, #48]               // 16-byte Folded Spill
	stp	x29, x30, [sp, #64]             // 16-byte Folded Spill
	str	x27, [sp, #80]                  // 8-byte Folded Spill
	stp	x26, x25, [sp, #96]             // 16-byte Folded Spill
	stp	x24, x23, [sp, #112]            // 16-byte Folded Spill
	stp	x22, x21, [sp, #128]            // 16-byte Folded Spill
	stp	x20, x19, [sp, #144]            // 16-byte Folded Spill
	add	x29, sp, #16                    // =16
	.cfi_def_cfa w29, 144
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
	.cfi_offset b8, -104
	.cfi_offset b9, -112
	.cfi_offset b10, -120
	.cfi_offset b11, -128
	.cfi_offset b12, -136
	.cfi_offset b13, -144
	mov	w0, #16384
	mov	w23, #52428
	movk	w0, #1, lsl #16
	movk	w23, #3276, lsl #16
	bl	malloc
	mov	x19, x0
	mov	w0, #16384
	movk	w0, #1, lsl #16
	bl	malloc
	mov	x20, x0
	mov	w0, #838860800
	bl	malloc
	mov	x21, x0
	mov	w0, #40960
	bl	malloc
	mov	x22, x0
	mov	x0, xzr
	bl	time
                                        // kill: def $w0 killed $w0 killed $x0
	bl	srand
	mov	x24, xzr
	mov	w25, #10240
	mov	x26, x21
	.p2align	5
.LBB7_1:                                // =>This Loop Header: Depth=1
                                        //     Child Loop BB7_2 Depth 2
	bl	rand
	mov	x27, xzr
	sdiv	w8, w0, w23
	.p2align	5
.LBB7_2:                                //   Parent Loop BB7_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	str	w8, [x26, x27]
	bl	rand
	add	x27, x27, #4                    // =4
	cmp	x27, #10, lsl #12               // =40960
	sdiv	w8, w0, w23
	b.ne	.LBB7_2
// %bb.3:                               //   in Loop: Header=BB7_1 Depth=1
	str	w8, [x22, x24, lsl #2]
	add	x24, x24, #1                    // =1
	cmp	x24, x25
	add	x26, x26, #10, lsl #12          // =40960
	b.ne	.LBB7_1
// %bb.4:
	mov	x8, xzr
	mov	w9, #10240
	mov	z0.s, #0                        // =0x0
	ptrue	p1.s
	mov	x10, x21
	.p2align	5
.LBB7_5:                                // =>This Loop Header: Depth=1
                                        //     Child Loop BB7_6 Depth 2
	mov	x11, xzr
	whilelo	p0.s, xzr, x9
	mov	z1.d, z0.d
	.p2align	5
.LBB7_6:                                //   Parent Loop BB7_5 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ld1w	{ z2.s }, p0/z, [x10, x11, lsl #2]
	ld1w	{ z3.s }, p0/z, [x22, x11, lsl #2]
	incw	x11
	mla	z1.s, p0/m, z3.s, z2.s
	whilelo	p0.s, x11, x9
	b.mi	.LBB7_6
// %bb.7:                               //   in Loop: Header=BB7_5 Depth=1
	uaddv	d1, p1, z1.s
	fmov	x11, d1
	str	w11, [x19, x8, lsl #2]
	add	x8, x8, #1                      // =1
	cmp	x8, x9
	add	x10, x10, #10, lsl #12          // =40960
	b.ne	.LBB7_5
// %bb.8:
	mov	x0, sp
	bl	ftime
	ldr	x8, [sp]
	ldrh	w9, [sp, #8]
	ptrue	p1.s
	mov	w10, wzr
	mov	w11, #10240
	mov	z0.s, #0                        // =0x0
	.p2align	5
.LBB7_9:                                // =>This Loop Header: Depth=1
                                        //     Child Loop BB7_10 Depth 2
                                        //       Child Loop BB7_11 Depth 3
	mov	x12, xzr
	mov	x13, x21
	.p2align	5
.LBB7_10:                               //   Parent Loop BB7_9 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB7_11 Depth 3
	mov	x14, xzr
	whilelo	p0.s, xzr, x11
	mov	z1.d, z0.d
	.p2align	5
.LBB7_11:                               //   Parent Loop BB7_9 Depth=1
                                        //     Parent Loop BB7_10 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	ld1w	{ z2.s }, p0/z, [x13, x14, lsl #2]
	ld1w	{ z3.s }, p0/z, [x22, x14, lsl #2]
	incw	x14
	mla	z1.s, p0/m, z3.s, z2.s
	whilelo	p0.s, x14, x11
	b.mi	.LBB7_11
// %bb.12:                              //   in Loop: Header=BB7_10 Depth=2
	uaddv	d1, p1, z1.s
	fmov	x14, d1
	str	w14, [x19, x12, lsl #2]
	add	x12, x12, #1                    // =1
	cmp	x12, x11
	add	x13, x13, #10, lsl #12          // =40960
	b.ne	.LBB7_10
// %bb.13:                              //   in Loop: Header=BB7_9 Depth=1
	add	w10, w10, #1                    // =1
	cmp	w10, #20                        // =20
	b.ne	.LBB7_9
// %bb.14:
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
	ldr	x9, [sp]
	ldrh	w8, [sp, #8]
	ptrue	p1.s
	mov	w10, wzr
	mov	w11, #10240
	mov	z0.s, #0                        // =0x0
	.p2align	5
.LBB7_15:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB7_16 Depth 2
                                        //       Child Loop BB7_17 Depth 3
	mov	x12, xzr
	mov	x13, x21
	.p2align	5
.LBB7_16:                               //   Parent Loop BB7_15 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB7_17 Depth 3
	mov	x14, xzr
	whilelo	p0.s, xzr, x11
	mov	z1.d, z0.d
	.p2align	5
.LBB7_17:                               //   Parent Loop BB7_15 Depth=1
                                        //     Parent Loop BB7_16 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	ld1w	{ z2.s }, p0/z, [x13, x14, lsl #2]
	ld1w	{ z3.s }, p0/z, [x22, x14, lsl #2]
	incw	x14
	mla	z1.s, p0/m, z3.s, z2.s
	whilelo	p0.s, x14, x11
	b.mi	.LBB7_17
// %bb.18:                              //   in Loop: Header=BB7_16 Depth=2
	uaddv	d1, p1, z1.s
	fmov	x14, d1
	str	w14, [x20, x12, lsl #2]
	add	x12, x12, #1                    // =1
	cmp	x12, x11
	add	x13, x13, #10, lsl #12          // =40960
	b.ne	.LBB7_16
// %bb.19:                              //   in Loop: Header=BB7_15 Depth=1
	add	w10, w10, #1                    // =1
	cmp	w10, #20                        // =20
	b.ne	.LBB7_15
// %bb.20:
	adrp	x10, .LCPI7_0
	ldr	d11, [x10, :lo12:.LCPI7_0]
	adrp	x10, .LCPI7_1
	ldr	d13, [x10, :lo12:.LCPI7_1]
	mov	x0, sp
	fmadd	d10, d8, d11, d9
	frecpe	d0, d10
	frecps	d1, d10, d0
	fmul	d0, d0, d1
	frecps	d1, d10, d0
	fmul	d0, d0, d1
	frecps	d1, d10, d0
	fmul	d1, d1, d13
	scvtf	d12, x9
	fmul	d8, d0, d1
	ucvtf	d9, w8
	bl	ftime
	ldr	d0, [sp]
	ldr	h1, [sp, #8]
	mov	x0, x21
	scvtf	d0, d0
	ucvtf	d1, d1
	fsub	d1, d1, d9
	fsub	d0, d0, d12
	fmadd	d11, d1, d11, d0
	frecpe	d0, d11
	frecps	d1, d11, d0
	fmul	d0, d0, d1
	frecps	d1, d11, d0
	fmul	d0, d0, d1
	frecps	d1, d11, d0
	fmul	d1, d1, d13
	fmul	d9, d0, d1
	bl	print_matrix
	mov	x0, x22
	bl	print_vector
	adrp	x0, .L.str.4
	add	x0, x0, :lo12:.L.str.4
	bl	puts
	mov	x0, x19
	bl	print_vector
	adrp	x0, .L.str.5
	add	x0, x0, :lo12:.L.str.5
	bl	puts
	mov	x0, x20
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
	adrp	x8, .LCPI7_2
	ldr	d12, [x8, :lo12:.LCPI7_2]
	adrp	x0, .L.str.9
	add	x0, x0, :lo12:.L.str.9
	mov	v1.16b, v8.16b
	fmul	d0, d10, d12
	bl	printf
	adrp	x0, .L.str.10
	fmul	d0, d11, d12
	add	x0, x0, :lo12:.L.str.10
	mov	v1.16b, v9.16b
	bl	printf
	mov	w9, #10240
	mov	x8, xzr
	whilelo	p0.s, xzr, x9
	mov	z0.s, #0                        // =0x0
	.p2align	5
.LBB7_21:                               // =>This Inner Loop Header: Depth=1
	ld1w	{ z1.s }, p0/z, [x19, x8, lsl #2]
	ld1w	{ z2.s }, p0/z, [x20, x8, lsl #2]
	incw	x8
	sub	z1.s, z1.s, z2.s
	asr	z2.s, z1.s, #31
	add	z1.s, z1.s, z2.s
	eor	z1.d, z1.d, z2.d
	add	z0.s, p0/m, z0.s, z1.s
	whilelo	p0.s, x8, x9
	b.mi	.LBB7_21
// %bb.22:
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
	mov	x0, x22
	bl	free
	ldp	x20, x19, [sp, #144]            // 16-byte Folded Reload
	ldp	x22, x21, [sp, #128]            // 16-byte Folded Reload
	ldp	x24, x23, [sp, #112]            // 16-byte Folded Reload
	ldp	x26, x25, [sp, #96]             // 16-byte Folded Reload
	ldr	x27, [sp, #80]                  // 8-byte Folded Reload
	ldp	x29, x30, [sp, #64]             // 16-byte Folded Reload
	ldp	d9, d8, [sp, #48]               // 16-byte Folded Reload
	ldp	d11, d10, [sp, #32]             // 16-byte Folded Reload
	ldp	d13, d12, [sp, #16]             // 16-byte Folded Reload
	mov	w0, wzr
	add	sp, sp, #160                    // =160
	ret
.Lfunc_end7:
	.size	main, .Lfunc_end7-main
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
	.asciz	"Matrix-vector (SIMD):\t\t%4f\t%4f\n"
	.size	.L.str.9, 32

	.type	.L.str.10,@object               // @.str.10
.L.str.10:
	.asciz	"Matrix-vector (Serial):\t\t%4f\t%4f\n"
	.size	.L.str.10, 34

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
