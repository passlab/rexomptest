	.text
	.file	"axpy_double.c"
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
	ldr	d0, [sp]
	scvtf	d0, d0
	ldr	h1, [sp, #8]
                                        // implicit-def: $d2
	mov	v2.16b, v1.16b
	ucvtf	d2, d2
	mov	x8, #70368744177664
	movk	x8, #16527, lsl #48
	fmov	d3, x8
	fdiv	d2, d2, d3
	fadd	d0, d0, d2
	ldp	x29, x30, [sp, #16]             // 16-byte Folded Reload
	add	sp, sp, #32                     // =32
	ret
.Lfunc_end0:
	.size	read_timer, .Lfunc_end0-read_timer
	.cfi_endproc
                                        // -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3                               // -- Begin function init
.LCPI1_0:
	.xword	0x41a9999999666666              // double 214748364.69999999
	.text
	.globl	init
	.p2align	5
	.type	init,@function
init:                                   // @init
	.cfi_startproc
// %bb.0:
	sub	sp, sp, #48                     // =48
	stp	x29, x30, [sp, #32]             // 16-byte Folded Spill
	add	x29, sp, #32                    // =32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	str	x1, [sp, #16]
	mov	w8, wzr
	str	w8, [sp, #12]
	b	.LBB1_1
.LBB1_1:                                // =>This Inner Loop Header: Depth=1
	ldr	w8, [sp, #12]
	mov	w9, #32767
	movk	w9, #1562, lsl #16
	subs	w8, w8, w9
	b.gt	.LBB1_4
	b	.LBB1_2
.LBB1_2:                                //   in Loop: Header=BB1_1 Depth=1
	bl	rand
	scvtf	d0, w0
	adrp	x8, .LCPI1_0
	ldr	d1, [x8, :lo12:.LCPI1_0]
	fdiv	d0, d0, d1
	ldur	x8, [x29, #-8]
	ldrsw	x9, [sp, #12]
	str	d0, [x8, x9, lsl #3]
	str	d1, [sp]                        // 8-byte Folded Spill
	bl	rand
	scvtf	d0, w0
	ldr	d1, [sp]                        // 8-byte Folded Reload
	fdiv	d0, d0, d1
	ldr	x8, [sp, #16]
	ldrsw	x9, [sp, #12]
	str	d0, [x8, x9, lsl #3]
	b	.LBB1_3
.LBB1_3:                                //   in Loop: Header=BB1_1 Depth=1
	ldr	w8, [sp, #12]
	add	w8, w8, #1                      // =1
	str	w8, [sp, #12]
	b	.LBB1_1
.LBB1_4:
	ldp	x29, x30, [sp, #32]             // 16-byte Folded Reload
	add	sp, sp, #48                     // =48
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
	sub	sp, sp, #48                     // =48
	.cfi_def_cfa_offset 48
	str	x0, [sp, #40]
	str	x1, [sp, #32]
	str	d0, [sp, #24]
	mov	w8, wzr
	str	w8, [sp, #16]
	b	.LBB2_1
.LBB2_1:                                // =>This Inner Loop Header: Depth=1
	ldr	w8, [sp, #16]
	mov	w9, #32767
	movk	w9, #1562, lsl #16
	subs	w8, w8, w9
	b.gt	.LBB2_5
	b	.LBB2_2
.LBB2_2:                                //   in Loop: Header=BB2_1 Depth=1
	ldr	w8, [sp, #16]
	str	w8, [sp, #12]
	ldr	d0, [sp, #24]
	ldr	x9, [sp, #40]
	ldrsw	x10, [sp, #12]
	lsl	x10, x10, #3
	ldr	d1, [x9, x10]
	fmul	d0, d0, d1
	ldr	x9, [sp, #32]
	ldr	d1, [x9, x10]
	fadd	d0, d1, d0
	str	d0, [x9, x10]
	b	.LBB2_3
.LBB2_3:                                //   in Loop: Header=BB2_1 Depth=1
	b	.LBB2_4
.LBB2_4:                                //   in Loop: Header=BB2_1 Depth=1
	ldr	w8, [sp, #16]
	add	w8, w8, #1                      // =1
	str	w8, [sp, #16]
	b	.LBB2_1
.LBB2_5:
	mov	w8, #32768
	movk	w8, #1562, lsl #16
	str	w8, [sp, #12]
	add	sp, sp, #48                     // =48
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
	sub	sp, sp, #32                     // =32
	.cfi_def_cfa_offset 32
	str	x0, [sp, #24]
	str	x1, [sp, #16]
	str	d0, [sp, #8]
	mov	w8, wzr
	str	w8, [sp, #4]
	b	.LBB3_1
.LBB3_1:                                // =>This Inner Loop Header: Depth=1
	ldr	w8, [sp, #4]
	mov	w9, #32767
	movk	w9, #1562, lsl #16
	subs	w8, w8, w9
	b.gt	.LBB3_4
	b	.LBB3_2
.LBB3_2:                                //   in Loop: Header=BB3_1 Depth=1
	ldr	d0, [sp, #8]
	ldr	x8, [sp, #24]
	ldrsw	x9, [sp, #4]
	lsl	x9, x9, #3
	ldr	d1, [x8, x9]
	fmul	d0, d0, d1
	ldr	x8, [sp, #16]
	ldr	d1, [x8, x9]
	fadd	d0, d1, d0
	str	d0, [x8, x9]
	b	.LBB3_3
.LBB3_3:                                //   in Loop: Header=BB3_1 Depth=1
	ldr	w8, [sp, #4]
	add	w8, w8, #1                      // =1
	str	w8, [sp, #4]
	b	.LBB3_1
.LBB3_4:
	add	sp, sp, #32                     // =32
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
	sub	sp, sp, #32                     // =32
	stp	x29, x30, [sp, #16]             // 16-byte Folded Spill
	add	x29, sp, #16                    // =16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	adrp	x0, .L.str
	add	x0, x0, :lo12:.L.str
	bl	printf
	mov	w8, wzr
	str	w8, [sp, #4]
	b	.LBB4_1
.LBB4_1:                                // =>This Inner Loop Header: Depth=1
	ldr	w8, [sp, #4]
	subs	w8, w8, #7                      // =7
	b.gt	.LBB4_4
	b	.LBB4_2
.LBB4_2:                                //   in Loop: Header=BB4_1 Depth=1
	ldr	x8, [sp, #8]
	ldrsw	x9, [sp, #4]
	ldr	d0, [x8, x9, lsl #3]
	adrp	x0, .L.str.1
	add	x0, x0, :lo12:.L.str.1
	bl	printf
	b	.LBB4_3
.LBB4_3:                                //   in Loop: Header=BB4_1 Depth=1
	ldr	w8, [sp, #4]
	add	w8, w8, #1                      // =1
	str	w8, [sp, #4]
	b	.LBB4_1
.LBB4_4:
	adrp	x0, .L.str.2
	add	x0, x0, :lo12:.L.str.2
	bl	puts
	ldp	x29, x30, [sp, #16]             // 16-byte Folded Reload
	add	sp, sp, #32                     // =32
	ret
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
	sub	sp, sp, #32                     // =32
	.cfi_def_cfa_offset 32
	str	x0, [sp, #24]
	str	x1, [sp, #16]
	mov	x8, xzr
	str	x8, [sp, #8]
	mov	w9, wzr
	str	w9, [sp, #4]
	b	.LBB5_1
.LBB5_1:                                // =>This Inner Loop Header: Depth=1
	ldr	w8, [sp, #4]
	mov	w9, #32767
	movk	w9, #1562, lsl #16
	subs	w8, w8, w9
	b.gt	.LBB5_4
	b	.LBB5_2
.LBB5_2:                                //   in Loop: Header=BB5_1 Depth=1
	ldr	x8, [sp, #24]
	ldrsw	x9, [sp, #4]
	lsl	x9, x9, #3
	ldr	d0, [x8, x9]
	ldr	x8, [sp, #16]
	ldr	d1, [x8, x9]
	fsub	d0, d0, d1
	ldr	d1, [sp, #8]
	fadd	d0, d1, d0
	str	d0, [sp, #8]
	b	.LBB5_3
.LBB5_3:                                //   in Loop: Header=BB5_1 Depth=1
	ldr	w8, [sp, #4]
	add	w8, w8, #1                      // =1
	str	w8, [sp, #4]
	b	.LBB5_1
.LBB5_4:
	ldr	d0, [sp, #8]
	add	sp, sp, #32                     // =32
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
	sub	sp, sp, #208                    // =208
	stp	x29, x30, [sp, #192]            // 16-byte Folded Spill
	add	x29, sp, #192                   // =192
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	w8, wzr
	stur	w8, [x29, #-4]
	stur	w0, [x29, #-8]
	stur	x1, [x29, #-16]
	mov	w9, #819200000
	mov	w1, w9
	mov	x0, x1
	str	w8, [sp, #68]                   // 4-byte Folded Spill
	str	x1, [sp, #56]                   // 8-byte Folded Spill
	bl	malloc
	stur	x0, [x29, #-24]
	ldr	x0, [sp, #56]                   // 8-byte Folded Reload
	bl	malloc
	stur	x0, [x29, #-32]
	ldr	x0, [sp, #56]                   // 8-byte Folded Reload
	bl	malloc
	stur	x0, [x29, #-40]
	mov	x10, #34079
	movk	x10, #20971, lsl #16
	movk	x10, #7864, lsl #32
	movk	x10, #16393, lsl #48
	stur	x10, [x29, #-48]
	mov	x0, xzr
	bl	time
                                        // kill: def $w0 killed $w0 killed $x0
	bl	srand
	ldur	x0, [x29, #-24]
	ldur	x1, [x29, #-32]
	bl	init
	ldr	w8, [sp, #68]                   // 4-byte Folded Reload
	stur	w8, [x29, #-52]
	b	.LBB6_1
.LBB6_1:                                // =>This Inner Loop Header: Depth=1
	ldur	w8, [x29, #-52]
	mov	w9, #32767
	movk	w9, #1562, lsl #16
	subs	w8, w8, w9
	b.gt	.LBB6_4
	b	.LBB6_2
.LBB6_2:                                //   in Loop: Header=BB6_1 Depth=1
	ldur	x8, [x29, #-32]
	ldursw	x9, [x29, #-52]
	lsl	x9, x9, #3
	ldr	d0, [x8, x9]
	ldur	x8, [x29, #-40]
	str	d0, [x8, x9]
	b	.LBB6_3
.LBB6_3:                                //   in Loop: Header=BB6_1 Depth=1
	ldur	w8, [x29, #-52]
	add	w8, w8, #1                      // =1
	stur	w8, [x29, #-52]
	b	.LBB6_1
.LBB6_4:
	ldur	x0, [x29, #-32]
	bl	print_vector
	ldur	x0, [x29, #-24]
	bl	print_vector
	ldur	d0, [x29, #-48]
	adrp	x0, .L.str.3
	add	x0, x0, :lo12:.L.str.3
	bl	printf
	adrp	x8, .L.str.4
	add	x8, x8, :lo12:.L.str.4
	str	w0, [sp, #52]                   // 4-byte Folded Spill
	mov	x0, x8
	bl	puts
	ldur	x8, [x29, #-24]
	ldur	x1, [x29, #-32]
	ldur	d0, [x29, #-48]
	str	w0, [sp, #48]                   // 4-byte Folded Spill
	mov	x0, x8
	bl	axpy
	ldur	x0, [x29, #-24]
	ldur	x1, [x29, #-40]
	ldur	d0, [x29, #-48]
	bl	axpy_serial
	ldur	x0, [x29, #-24]
	ldur	x1, [x29, #-32]
	bl	init
	mov	w9, wzr
	stur	w9, [x29, #-56]
	b	.LBB6_5
.LBB6_5:                                // =>This Inner Loop Header: Depth=1
	ldur	w8, [x29, #-56]
	mov	w9, #32767
	movk	w9, #1562, lsl #16
	subs	w8, w8, w9
	b.gt	.LBB6_8
	b	.LBB6_6
.LBB6_6:                                //   in Loop: Header=BB6_5 Depth=1
	ldur	x8, [x29, #-32]
	ldursw	x9, [x29, #-56]
	lsl	x9, x9, #3
	ldr	d0, [x8, x9]
	ldur	x8, [x29, #-40]
	str	d0, [x8, x9]
	b	.LBB6_7
.LBB6_7:                                //   in Loop: Header=BB6_5 Depth=1
	ldur	w8, [x29, #-56]
	add	w8, w8, #1                      // =1
	stur	w8, [x29, #-56]
	b	.LBB6_5
.LBB6_8:
	mov	x8, xzr
	stur	x8, [x29, #-64]
	bl	read_timer
	stur	d0, [x29, #-72]
	mov	w9, wzr
	stur	w9, [x29, #-76]
	b	.LBB6_9
.LBB6_9:                                // =>This Inner Loop Header: Depth=1
	ldur	w8, [x29, #-76]
	subs	w8, w8, #19                     // =19
	b.gt	.LBB6_12
	b	.LBB6_10
.LBB6_10:                               //   in Loop: Header=BB6_9 Depth=1
	ldur	x0, [x29, #-24]
	ldur	x1, [x29, #-32]
	ldur	d0, [x29, #-48]
	bl	axpy
	b	.LBB6_11
.LBB6_11:                               //   in Loop: Header=BB6_9 Depth=1
	ldur	w8, [x29, #-76]
	add	w8, w8, #1                      // =1
	stur	w8, [x29, #-76]
	b	.LBB6_9
.LBB6_12:
	bl	read_timer
	ldur	d1, [x29, #-72]
	fsub	d0, d0, d1
	ldur	d1, [x29, #-64]
	fadd	d0, d1, d0
	stur	d0, [x29, #-64]
	mov	x8, xzr
	stur	x8, [x29, #-88]
	bl	read_timer
	str	d0, [sp, #96]
	mov	w9, wzr
	str	w9, [sp, #92]
	b	.LBB6_13
.LBB6_13:                               // =>This Inner Loop Header: Depth=1
	ldr	w8, [sp, #92]
	subs	w8, w8, #19                     // =19
	b.gt	.LBB6_16
	b	.LBB6_14
.LBB6_14:                               //   in Loop: Header=BB6_13 Depth=1
	ldur	x0, [x29, #-24]
	ldur	x1, [x29, #-40]
	ldur	d0, [x29, #-48]
	bl	axpy_serial
	b	.LBB6_15
.LBB6_15:                               //   in Loop: Header=BB6_13 Depth=1
	ldr	w8, [sp, #92]
	add	w8, w8, #1                      // =1
	str	w8, [sp, #92]
	b	.LBB6_13
.LBB6_16:
	bl	read_timer
	ldr	d1, [sp, #96]
	fsub	d0, d0, d1
	ldur	d1, [x29, #-88]
	fadd	d0, d1, d0
	stur	d0, [x29, #-88]
	ldur	x0, [x29, #-32]
	bl	print_vector
	adrp	x0, .L.str.5
	add	x0, x0, :lo12:.L.str.5
	bl	puts
	ldur	x8, [x29, #-40]
	str	w0, [sp, #44]                   // 4-byte Folded Spill
	mov	x0, x8
	bl	print_vector
	ldur	d0, [x29, #-64]
	mov	x8, #225833675390976
	movk	x8, #16845, lsl #48
	fmov	d1, x8
	fmul	d0, d0, d1
	adrp	x8, .LCPI6_0
	ldr	d2, [x8, :lo12:.LCPI6_0]
	fdiv	d0, d2, d0
	str	d0, [sp, #80]
	ldur	d0, [x29, #-88]
	fmul	d0, d0, d1
	fdiv	d0, d2, d0
	str	d0, [sp, #72]
	adrp	x0, .L.str.6
	add	x0, x0, :lo12:.L.str.6
	bl	printf
	adrp	x8, .L.str.7
	add	x8, x8, :lo12:.L.str.7
	str	w0, [sp, #40]                   // 4-byte Folded Spill
	mov	x0, x8
	bl	printf
	adrp	x8, .L.str.8
	add	x8, x8, :lo12:.L.str.8
	str	w0, [sp, #36]                   // 4-byte Folded Spill
	mov	x0, x8
	bl	printf
	ldur	d0, [x29, #-64]
	fmov	d1, #20.00000000
	fdiv	d0, d0, d1
	ldr	d2, [sp, #80]
	adrp	x8, .L.str.9
	add	x8, x8, :lo12:.L.str.9
	str	w0, [sp, #32]                   // 4-byte Folded Spill
	mov	x0, x8
	str	d1, [sp, #24]                   // 8-byte Folded Spill
	mov	v1.16b, v2.16b
	bl	printf
	ldur	d0, [x29, #-88]
	ldr	d1, [sp, #24]                   // 8-byte Folded Reload
	fdiv	d0, d0, d1
	ldr	d1, [sp, #72]
	adrp	x8, .L.str.10
	add	x8, x8, :lo12:.L.str.10
	str	w0, [sp, #20]                   // 4-byte Folded Spill
	mov	x0, x8
	bl	printf
	ldur	x8, [x29, #-32]
	ldur	x1, [x29, #-40]
	str	w0, [sp, #16]                   // 4-byte Folded Spill
	mov	x0, x8
	bl	check
	adrp	x0, .L.str.11
	add	x0, x0, :lo12:.L.str.11
	bl	printf
	ldur	x8, [x29, #-24]
	str	w0, [sp, #12]                   // 4-byte Folded Spill
	mov	x0, x8
	bl	free
	ldur	x0, [x29, #-32]
	bl	free
	ldur	x0, [x29, #-40]
	bl	free
	mov	w2, wzr
	mov	w0, w2
	ldp	x29, x30, [sp, #192]            // 16-byte Folded Reload
	add	sp, sp, #208                    // =208
	ret
.Lfunc_end6:
	.size	main, .Lfunc_end6-main
	.cfi_endproc
                                        // -- End function
	.type	.L.str,@object                  // @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"["
	.size	.L.str, 2

	.type	.L.str.1,@object                // @.str.1
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

	.type	.L.str.6,@object                // @.str.6
.L.str.6:
	.asciz	"==================================================================\n"
	.size	.L.str.6, 68

	.type	.L.str.7,@object                // @.str.7
.L.str.7:
	.asciz	"Performance:\t\t\tRuntime (s)\t GFLOPS\n"
	.size	.L.str.7, 36

	.type	.L.str.8,@object                // @.str.8
.L.str.8:
	.asciz	"------------------------------------------------------------------\n"
	.size	.L.str.8, 68

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

	.ident	"Arm C/C++/Fortran Compiler version 21.0 (build number 879) (based on LLVM 11.0.0)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym read_timer
	.addrsig_sym ftime
	.addrsig_sym init
	.addrsig_sym rand
	.addrsig_sym axpy
	.addrsig_sym axpy_serial
	.addrsig_sym print_vector
	.addrsig_sym printf
	.addrsig_sym puts
	.addrsig_sym check
	.addrsig_sym malloc
	.addrsig_sym srand
	.addrsig_sym time
	.addrsig_sym free
