	.text
	.file	"matmul_double.c"
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
	mov	x21, #2621440
	mov	x19, x0
	mov	x20, xzr
	movk	x21, #15924, lsl #48
	.p2align	5
.LBB1_1:                                // =>This Loop Header: Depth=1
                                        //     Child Loop BB1_2 Depth 2
	mov	x22, xzr
	.p2align	5
.LBB1_2:                                //   Parent Loop BB1_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	bl	rand
	ldr	x8, [x19, x20, lsl #3]
	scvtf	d0, w0
	fmov	d1, x21
	fmul	d0, d0, d1
	str	d0, [x8, x22]
	add	x22, x22, #8                    // =8
	cmp	x22, #2, lsl #12                // =8192
	b.ne	.LBB1_2
// %bb.3:                               //   in Loop: Header=BB1_1 Depth=1
	add	x20, x20, #1                    // =1
	cmp	x20, #1024                      // =1024
	b.ne	.LBB1_1
// %bb.4:
	ldp	x20, x19, [sp, #32]             // 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             // 16-byte Folded Reload
	ldp	x29, x30, [sp], #48             // 16-byte Folded Reload
	ret
.Lfunc_end1:
	.size	init, .Lfunc_end1-init
	.cfi_endproc
                                        // -- End function
	.globl	matmul_simd                     // -- Begin function matmul_simd
	.p2align	5
	.type	matmul_simd,@function
matmul_simd:                            // @matmul_simd
	.cfi_startproc
// %bb.0:
	mov	x8, xzr
	mov	w9, #1024
	mov	z0.d, #0                        // =0x0
	ptrue	p0.d
	.p2align	5
.LBB2_1:                                // =>This Loop Header: Depth=1
                                        //     Child Loop BB2_2 Depth 2
                                        //       Child Loop BB2_3 Depth 3
	lsl	x11, x8, #3
	ldr	x10, [x0, x11]
	ldr	x11, [x2, x11]
	mov	x12, xzr
	.p2align	5
.LBB2_2:                                //   Parent Loop BB2_1 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB2_3 Depth 3
	ldr	x14, [x1, x12, lsl #3]
	mov	x13, xzr
	whilelo	p1.d, xzr, x9
	mov	z1.d, z0.d
	.p2align	5
.LBB2_3:                                //   Parent Loop BB2_1 Depth=1
                                        //     Parent Loop BB2_2 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	ld1d	{ z2.d }, p1/z, [x10, x13, lsl #3]
	ld1d	{ z3.d }, p1/z, [x14, x13, lsl #3]
	incd	x13
	fmla	z1.d, p1/m, z3.d, z2.d
	whilelo	p1.d, x13, x9
	b.mi	.LBB2_3
// %bb.4:                               //   in Loop: Header=BB2_2 Depth=2
	faddv	d1, p0, z1.d
	str	d1, [x11, x12, lsl #3]
	add	x12, x12, #1                    // =1
	cmp	x12, #1024                      // =1024
	b.ne	.LBB2_2
// %bb.5:                               //   in Loop: Header=BB2_1 Depth=1
	add	x8, x8, #1                      // =1
	cmp	x8, #1024                       // =1024
	b.ne	.LBB2_1
// %bb.6:
	ret
.Lfunc_end2:
	.size	matmul_simd, .Lfunc_end2-matmul_simd
	.cfi_endproc
                                        // -- End function
	.globl	print_matrix                    // -- Begin function print_matrix
	.p2align	5
	.type	print_matrix,@function
print_matrix:                           // @print_matrix
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
	adrp	x20, .L.str.1
	adrp	x21, .L.str.2
	mov	x19, x0
	mov	x22, xzr
	add	x20, x20, :lo12:.L.str.1
	add	x21, x21, :lo12:.L.str.2
	.p2align	5
.LBB3_1:                                // =>This Inner Loop Header: Depth=1
	mov	w0, #91
	bl	putchar
	ldr	x8, [x19, x22]
	mov	x0, x20
	ldr	d0, [x8]
	bl	printf
	ldr	x8, [x19, x22]
	mov	x0, x20
	ldr	d0, [x8, #8]
	bl	printf
	ldr	x8, [x19, x22]
	mov	x0, x20
	ldr	d0, [x8, #16]
	bl	printf
	ldr	x8, [x19, x22]
	mov	x0, x20
	ldr	d0, [x8, #24]
	bl	printf
	ldr	x8, [x19, x22]
	mov	x0, x20
	ldr	d0, [x8, #32]
	bl	printf
	ldr	x8, [x19, x22]
	mov	x0, x20
	ldr	d0, [x8, #40]
	bl	printf
	ldr	x8, [x19, x22]
	mov	x0, x20
	ldr	d0, [x8, #48]
	bl	printf
	ldr	x8, [x19, x22]
	mov	x0, x20
	ldr	d0, [x8, #56]
	bl	printf
	mov	x0, x21
	bl	puts
	add	x22, x22, #8                    // =8
	cmp	x22, #64                        // =64
	b.ne	.LBB3_1
// %bb.2:
	ldp	x20, x19, [sp, #32]             // 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             // 16-byte Folded Reload
	mov	w0, #10
	ldp	x29, x30, [sp], #48             // 16-byte Folded Reload
	b	putchar
.Lfunc_end3:
	.size	print_matrix, .Lfunc_end3-print_matrix
	.cfi_endproc
                                        // -- End function
	.globl	matmul_serial                   // -- Begin function matmul_serial
	.p2align	5
	.type	matmul_serial,@function
matmul_serial:                          // @matmul_serial
	.cfi_startproc
// %bb.0:
	mov	x8, xzr
	mov	w9, #1024
	mov	z0.d, #0                        // =0x0
	ptrue	p0.d
	.p2align	5
.LBB4_1:                                // =>This Loop Header: Depth=1
                                        //     Child Loop BB4_2 Depth 2
                                        //       Child Loop BB4_3 Depth 3
	lsl	x11, x8, #3
	ldr	x10, [x0, x11]
	ldr	x11, [x2, x11]
	mov	x12, xzr
	.p2align	5
.LBB4_2:                                //   Parent Loop BB4_1 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB4_3 Depth 3
	ldr	x14, [x1, x12, lsl #3]
	mov	x13, xzr
	whilelo	p1.d, xzr, x9
	mov	z1.d, z0.d
	.p2align	5
.LBB4_3:                                //   Parent Loop BB4_1 Depth=1
                                        //     Parent Loop BB4_2 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	ld1d	{ z2.d }, p1/z, [x10, x13, lsl #3]
	ld1d	{ z3.d }, p1/z, [x14, x13, lsl #3]
	incd	x13
	fmla	z1.d, p1/m, z3.d, z2.d
	whilelo	p1.d, x13, x9
	b.mi	.LBB4_3
// %bb.4:                               //   in Loop: Header=BB4_2 Depth=2
	faddv	d1, p0, z1.d
	str	d1, [x11, x12, lsl #3]
	add	x12, x12, #1                    // =1
	cmp	x12, #1024                      // =1024
	b.ne	.LBB4_2
// %bb.5:                               //   in Loop: Header=BB4_1 Depth=1
	add	x8, x8, #1                      // =1
	cmp	x8, #1024                       // =1024
	b.ne	.LBB4_1
// %bb.6:
	ret
.Lfunc_end4:
	.size	matmul_serial, .Lfunc_end4-matmul_serial
	.cfi_endproc
                                        // -- End function
	.globl	check                           // -- Begin function check
	.p2align	5
	.type	check,@function
check:                                  // @check
	.cfi_startproc
// %bb.0:
	mov	x8, xzr
	fmov	d0, xzr
	mov	z1.d, #0                        // =0x0
	ptrue	p0.d, vl1
	mov	w9, #1024
	ptrue	p1.d
	.p2align	5
.LBB5_1:                                // =>This Loop Header: Depth=1
                                        //     Child Loop BB5_2 Depth 2
	lsl	x12, x8, #3
	ldr	x11, [x0, x12]
	ldr	x12, [x1, x12]
	mov	x10, xzr
	sel	z0.d, p0, z0.d, z1.d
	whilelo	p2.d, xzr, x9
	.p2align	5
.LBB5_2:                                //   Parent Loop BB5_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ld1d	{ z2.d }, p2/z, [x11, x10, lsl #3]
	ld1d	{ z3.d }, p2/z, [x12, x10, lsl #3]
	incd	x10
	fadd	z2.d, z2.d, z0.d
	fsub	z2.d, z2.d, z3.d
	mov	z0.d, p2/m, z2.d
	whilelo	p2.d, x10, x9
	b.mi	.LBB5_2
// %bb.3:                               //   in Loop: Header=BB5_1 Depth=1
	add	x8, x8, #1                      // =1
	cmp	x8, #1024                       // =1024
	faddv	d0, p1, z0.d
	b.ne	.LBB5_1
// %bb.4:
                                        // kill: def $d0 killed $d0 killed $z0
	ret
.Lfunc_end5:
	.size	check, .Lfunc_end5-check
	.cfi_endproc
                                        // -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3                               // -- Begin function main
.LCPI6_0:
	.xword	0x3f50624dd2f1a9fc              // double 0.001
.LCPI6_1:
	.xword	0x4045798ee2308c3a              // double 42.949672960000001
.LCPI6_2:
	.xword	0x3fa999999999999a              // double 0.050000000000000003
	.text
	.globl	main
	.p2align	5
	.type	main,@function
main:                                   // @main
	.cfi_startproc
// %bb.0:
	sub	sp, sp, #144                    // =144
	stp	d13, d12, [sp, #16]             // 16-byte Folded Spill
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
	.cfi_offset b12, -120
	.cfi_offset b13, -128
	mov	w0, #8192
	bl	malloc
	mov	x21, x0
	mov	w0, #8192
	bl	malloc
	mov	x23, x0
	mov	w0, #8192
	bl	malloc
	mov	x19, x0
	mov	w0, #8192
	bl	malloc
	mov	x20, x0
	mov	w0, #8192
	bl	malloc
	mov	x22, x0
	mov	x24, xzr
	.p2align	5
.LBB6_1:                                // =>This Inner Loop Header: Depth=1
	mov	w0, #8192
	bl	malloc
	str	x0, [x21, x24]
	mov	w0, #8192
	bl	malloc
	str	x0, [x23, x24]
	mov	w0, #8192
	bl	malloc
	str	x0, [x19, x24]
	mov	w0, #8192
	bl	malloc
	str	x0, [x20, x24]
	mov	w0, #8192
	bl	malloc
	str	x0, [x22, x24]
	add	x24, x24, #8                    // =8
	cmp	x24, #2, lsl #12                // =8192
	b.ne	.LBB6_1
// %bb.2:
	mov	x0, xzr
	bl	time
                                        // kill: def $w0 killed $w0 killed $x0
	bl	srand
	mov	x25, #2621440
	mov	x24, xzr
	movk	x25, #15924, lsl #48
	.p2align	5
.LBB6_3:                                // =>This Loop Header: Depth=1
                                        //     Child Loop BB6_4 Depth 2
	mov	x26, xzr
	.p2align	5
.LBB6_4:                                //   Parent Loop BB6_3 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	bl	rand
	ldr	x8, [x21, x24, lsl #3]
	scvtf	d0, w0
	fmov	d1, x25
	fmul	d0, d0, d1
	str	d0, [x8, x26]
	add	x26, x26, #8                    // =8
	cmp	x26, #2, lsl #12                // =8192
	b.ne	.LBB6_4
// %bb.5:                               //   in Loop: Header=BB6_3 Depth=1
	add	x24, x24, #1                    // =1
	cmp	x24, #1024                      // =1024
	b.ne	.LBB6_3
// %bb.6:
	mov	x25, #2621440
	mov	x24, xzr
	movk	x25, #15924, lsl #48
	.p2align	5
.LBB6_7:                                // =>This Loop Header: Depth=1
                                        //     Child Loop BB6_8 Depth 2
	mov	x26, xzr
	.p2align	5
.LBB6_8:                                //   Parent Loop BB6_7 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	bl	rand
	ldr	x8, [x23, x24, lsl #3]
	scvtf	d0, w0
	fmov	d1, x25
	fmul	d0, d0, d1
	str	d0, [x8, x26]
	add	x26, x26, #8                    // =8
	cmp	x26, #2, lsl #12                // =8192
	b.ne	.LBB6_8
// %bb.9:                               //   in Loop: Header=BB6_7 Depth=1
	add	x24, x24, #1                    // =1
	cmp	x24, #1024                      // =1024
	b.ne	.LBB6_7
// %bb.10:
	mov	x8, xzr
	.p2align	5
.LBB6_11:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB6_12 Depth 2
	ldr	x9, [x22, x8, lsl #3]
	mov	x10, xzr
	.p2align	5
.LBB6_12:                               //   Parent Loop BB6_11 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldr	x11, [x23, x10]
	ldr	x11, [x11, x8, lsl #3]
	str	x11, [x9, x10]
	add	x10, x10, #8                    // =8
	cmp	x10, #2, lsl #12                // =8192
	b.ne	.LBB6_12
// %bb.13:                              //   in Loop: Header=BB6_11 Depth=1
	add	x8, x8, #1                      // =1
	cmp	x8, #1024                       // =1024
	b.ne	.LBB6_11
// %bb.14:
	mov	x8, xzr
	mov	w9, #1024
	mov	z0.d, #0                        // =0x0
	ptrue	p1.d
	.p2align	5
.LBB6_15:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB6_16 Depth 2
                                        //       Child Loop BB6_17 Depth 3
	lsl	x11, x8, #3
	ldr	x10, [x21, x11]
	ldr	x11, [x19, x11]
	mov	x12, xzr
	.p2align	5
.LBB6_16:                               //   Parent Loop BB6_15 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB6_17 Depth 3
	ldr	x14, [x22, x12, lsl #3]
	mov	x13, xzr
	whilelo	p0.d, xzr, x9
	mov	z1.d, z0.d
	.p2align	5
.LBB6_17:                               //   Parent Loop BB6_15 Depth=1
                                        //     Parent Loop BB6_16 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	ld1d	{ z2.d }, p0/z, [x10, x13, lsl #3]
	ld1d	{ z3.d }, p0/z, [x14, x13, lsl #3]
	incd	x13
	fmla	z1.d, p0/m, z3.d, z2.d
	whilelo	p0.d, x13, x9
	b.mi	.LBB6_17
// %bb.18:                              //   in Loop: Header=BB6_16 Depth=2
	faddv	d1, p1, z1.d
	str	d1, [x11, x12, lsl #3]
	add	x12, x12, #1                    // =1
	cmp	x12, #1024                      // =1024
	b.ne	.LBB6_16
// %bb.19:                              //   in Loop: Header=BB6_15 Depth=1
	add	x8, x8, #1                      // =1
	cmp	x8, #1024                       // =1024
	b.ne	.LBB6_15
// %bb.20:
	mov	x8, xzr
	mov	w9, #1024
	mov	z0.d, #0                        // =0x0
	.p2align	5
.LBB6_21:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB6_22 Depth 2
                                        //       Child Loop BB6_23 Depth 3
	lsl	x11, x8, #3
	ldr	x10, [x21, x11]
	ldr	x11, [x20, x11]
	mov	x12, xzr
	.p2align	5
.LBB6_22:                               //   Parent Loop BB6_21 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB6_23 Depth 3
	ldr	x14, [x22, x12, lsl #3]
	mov	x13, xzr
	whilelo	p0.d, xzr, x9
	mov	z1.d, z0.d
	.p2align	5
.LBB6_23:                               //   Parent Loop BB6_21 Depth=1
                                        //     Parent Loop BB6_22 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	ld1d	{ z2.d }, p0/z, [x10, x13, lsl #3]
	ld1d	{ z3.d }, p0/z, [x14, x13, lsl #3]
	incd	x13
	fmla	z1.d, p0/m, z3.d, z2.d
	whilelo	p0.d, x13, x9
	b.mi	.LBB6_23
// %bb.24:                              //   in Loop: Header=BB6_22 Depth=2
	faddv	d1, p1, z1.d
	str	d1, [x11, x12, lsl #3]
	add	x12, x12, #1                    // =1
	cmp	x12, #1024                      // =1024
	b.ne	.LBB6_22
// %bb.25:                              //   in Loop: Header=BB6_21 Depth=1
	add	x8, x8, #1                      // =1
	cmp	x8, #1024                       // =1024
	b.ne	.LBB6_21
// %bb.26:
	mov	x0, sp
	bl	ftime
	ldr	x8, [sp]
	ldrh	w9, [sp, #8]
	ptrue	p1.d
	mov	w10, wzr
	mov	w11, #1024
	mov	z0.d, #0                        // =0x0
	.p2align	5
.LBB6_27:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB6_28 Depth 2
                                        //       Child Loop BB6_29 Depth 3
                                        //         Child Loop BB6_30 Depth 4
	mov	x12, xzr
	.p2align	5
.LBB6_28:                               //   Parent Loop BB6_27 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB6_29 Depth 3
                                        //         Child Loop BB6_30 Depth 4
	lsl	x14, x12, #3
	ldr	x13, [x21, x14]
	ldr	x14, [x19, x14]
	mov	x15, xzr
	.p2align	5
.LBB6_29:                               //   Parent Loop BB6_27 Depth=1
                                        //     Parent Loop BB6_28 Depth=2
                                        // =>    This Loop Header: Depth=3
                                        //         Child Loop BB6_30 Depth 4
	ldr	x17, [x22, x15, lsl #3]
	mov	x16, xzr
	whilelo	p0.d, xzr, x11
	mov	z1.d, z0.d
	.p2align	5
.LBB6_30:                               //   Parent Loop BB6_27 Depth=1
                                        //     Parent Loop BB6_28 Depth=2
                                        //       Parent Loop BB6_29 Depth=3
                                        // =>      This Inner Loop Header: Depth=4
	ld1d	{ z2.d }, p0/z, [x13, x16, lsl #3]
	ld1d	{ z3.d }, p0/z, [x17, x16, lsl #3]
	incd	x16
	fmla	z1.d, p0/m, z3.d, z2.d
	whilelo	p0.d, x16, x11
	b.mi	.LBB6_30
// %bb.31:                              //   in Loop: Header=BB6_29 Depth=3
	faddv	d1, p1, z1.d
	str	d1, [x14, x15, lsl #3]
	add	x15, x15, #1                    // =1
	cmp	x15, #1024                      // =1024
	b.ne	.LBB6_29
// %bb.32:                              //   in Loop: Header=BB6_28 Depth=2
	add	x12, x12, #1                    // =1
	cmp	x12, #1024                      // =1024
	b.ne	.LBB6_28
// %bb.33:                              //   in Loop: Header=BB6_27 Depth=1
	add	w10, w10, #1                    // =1
	cmp	w10, #20                        // =20
	b.ne	.LBB6_27
// %bb.34:
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
	ptrue	p1.d
	mov	w10, wzr
	mov	w11, #1024
	mov	z0.d, #0                        // =0x0
	.p2align	5
.LBB6_35:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB6_36 Depth 2
                                        //       Child Loop BB6_37 Depth 3
                                        //         Child Loop BB6_38 Depth 4
	mov	x12, xzr
	.p2align	5
.LBB6_36:                               //   Parent Loop BB6_35 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB6_37 Depth 3
                                        //         Child Loop BB6_38 Depth 4
	lsl	x14, x12, #3
	ldr	x13, [x21, x14]
	ldr	x14, [x20, x14]
	mov	x15, xzr
	.p2align	5
.LBB6_37:                               //   Parent Loop BB6_35 Depth=1
                                        //     Parent Loop BB6_36 Depth=2
                                        // =>    This Loop Header: Depth=3
                                        //         Child Loop BB6_38 Depth 4
	ldr	x17, [x22, x15, lsl #3]
	mov	x16, xzr
	whilelo	p0.d, xzr, x11
	mov	z1.d, z0.d
	.p2align	5
.LBB6_38:                               //   Parent Loop BB6_35 Depth=1
                                        //     Parent Loop BB6_36 Depth=2
                                        //       Parent Loop BB6_37 Depth=3
                                        // =>      This Inner Loop Header: Depth=4
	ld1d	{ z2.d }, p0/z, [x13, x16, lsl #3]
	ld1d	{ z3.d }, p0/z, [x17, x16, lsl #3]
	incd	x16
	fmla	z1.d, p0/m, z3.d, z2.d
	whilelo	p0.d, x16, x11
	b.mi	.LBB6_38
// %bb.39:                              //   in Loop: Header=BB6_37 Depth=3
	faddv	d1, p1, z1.d
	str	d1, [x14, x15, lsl #3]
	add	x15, x15, #1                    // =1
	cmp	x15, #1024                      // =1024
	b.ne	.LBB6_37
// %bb.40:                              //   in Loop: Header=BB6_36 Depth=2
	add	x12, x12, #1                    // =1
	cmp	x12, #1024                      // =1024
	b.ne	.LBB6_36
// %bb.41:                              //   in Loop: Header=BB6_35 Depth=1
	add	w10, w10, #1                    // =1
	cmp	w10, #20                        // =20
	b.ne	.LBB6_35
// %bb.42:
	adrp	x10, .LCPI6_0
	ldr	d11, [x10, :lo12:.LCPI6_0]
	adrp	x10, .LCPI6_1
	ldr	d13, [x10, :lo12:.LCPI6_1]
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
	bl	print_matrix
	adrp	x0, .L.str.4
	add	x0, x0, :lo12:.L.str.4
	bl	puts
	mov	x0, x19
	bl	print_matrix
	adrp	x0, .L.str.5
	add	x0, x0, :lo12:.L.str.5
	bl	puts
	mov	x0, x20
	bl	print_matrix
	adrp	x0, .Lstr
	add	x0, x0, :lo12:.Lstr
	bl	puts
	adrp	x0, .L.str.7
	add	x0, x0, :lo12:.L.str.7
	mov	w1, #1024
	mov	w22, #1024
	bl	printf
	adrp	x21, .Lstr.15
	add	x21, x21, :lo12:.Lstr.15
	mov	x0, x21
	bl	puts
	adrp	x0, .Lstr.14
	add	x0, x0, :lo12:.Lstr.14
	bl	puts
	mov	x0, x21
	bl	puts
	adrp	x8, .LCPI6_2
	ldr	d12, [x8, :lo12:.LCPI6_2]
	adrp	x0, .L.str.10
	add	x0, x0, :lo12:.L.str.10
	mov	v1.16b, v8.16b
	fmul	d0, d10, d12
	bl	printf
	adrp	x0, .L.str.11
	fmul	d0, d11, d12
	add	x0, x0, :lo12:.L.str.11
	mov	v1.16b, v9.16b
	bl	printf
	ptrue	p2.d
	mov	x8, xzr
	fmov	d0, xzr
	mov	z1.d, #0                        // =0x0
	ptrue	p0.d, vl1
	.p2align	5
.LBB6_43:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB6_44 Depth 2
	lsl	x11, x8, #3
	ldr	x10, [x19, x11]
	ldr	x11, [x20, x11]
	mov	x9, xzr
	sel	z0.d, p0, z0.d, z1.d
	whilelo	p1.d, xzr, x22
	.p2align	5
.LBB6_44:                               //   Parent Loop BB6_43 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ld1d	{ z2.d }, p1/z, [x10, x9, lsl #3]
	ld1d	{ z3.d }, p1/z, [x11, x9, lsl #3]
	incd	x9
	fadd	z2.d, z2.d, z0.d
	fsub	z2.d, z2.d, z3.d
	mov	z0.d, p1/m, z2.d
	whilelo	p1.d, x9, x22
	b.mi	.LBB6_44
// %bb.45:                              //   in Loop: Header=BB6_43 Depth=1
	add	x8, x8, #1                      // =1
	cmp	x8, #1024                       // =1024
	faddv	d0, p2, z0.d
	b.ne	.LBB6_43
// %bb.46:
	adrp	x0, .L.str.12
	add	x0, x0, :lo12:.L.str.12
                                        // kill: def $d0 killed $d0 killed $z0
	bl	printf
	ldp	x20, x19, [sp, #128]            // 16-byte Folded Reload
	ldp	x22, x21, [sp, #112]            // 16-byte Folded Reload
	ldp	x24, x23, [sp, #96]             // 16-byte Folded Reload
	ldp	x26, x25, [sp, #80]             // 16-byte Folded Reload
	ldp	x29, x30, [sp, #64]             // 16-byte Folded Reload
	ldp	d9, d8, [sp, #48]               // 16-byte Folded Reload
	ldp	d11, d10, [sp, #32]             // 16-byte Folded Reload
	ldp	d13, d12, [sp, #16]             // 16-byte Folded Reload
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
	.asciz	"%.2f "
	.size	.L.str.1, 6

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

	.type	.L.str.7,@object                // @.str.7
.L.str.7:
	.asciz	"\tMatrix Multiplication: A[N][N] * B[N][N] = C[N][N], N=%d\n"
	.size	.L.str.7, 59

	.type	.L.str.10,@object               // @.str.10
.L.str.10:
	.asciz	"matmul_omp:\t\t%4f\t%4f\n"
	.size	.L.str.10, 22

	.type	.L.str.11,@object               // @.str.11
.L.str.11:
	.asciz	"matmul_serial:\t\t%4f\t%4f\n"
	.size	.L.str.11, 25

	.type	.L.str.12,@object               // @.str.12
.L.str.12:
	.asciz	"Correctness check: %f\n"
	.size	.L.str.12, 23

	.type	.Lstr,@object                   // @str
.Lstr:
	.asciz	"======================================================================================================"
	.size	.Lstr, 103

	.type	.Lstr.14,@object                // @str.14
.Lstr.14:
	.asciz	"Performance:\t\tRuntime (s)\t GFLOPS"
	.size	.Lstr.14, 34

	.type	.Lstr.15,@object                // @str.15
.Lstr.15:
	.asciz	"------------------------------------------------------------------------------------------------------"
	.size	.Lstr.15, 103

	.ident	"Arm C/C++/Fortran Compiler version 21.0 (build number 879) (based on LLVM 11.0.0)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
