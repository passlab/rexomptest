	.text
	.file	"axpy_float.c"
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3                               # -- Begin function read_timer
.LCPI0_0:
	.quad	0x408f400000000000              # double 1000
	.text
	.globl	read_timer
	.p2align	4, 0x90
	.type	read_timer,@function
read_timer:                             # @read_timer
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	leaq	-16(%rbp), %rdi
	callq	ftime
	cvtsi2sdq	-16(%rbp), %xmm0
	movzwl	-8(%rbp), %eax
	cvtsi2sd	%eax, %xmm1
	movsd	.LCPI0_0(%rip), %xmm2           # xmm2 = mem[0],zero
	divsd	%xmm2, %xmm1
	addsd	%xmm1, %xmm0
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	read_timer, .Lfunc_end0-read_timer
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2                               # -- Begin function init
.LCPI1_0:
	.long	0x4d4ccccd                      # float 214748368
	.text
	.globl	init
	.p2align	4, 0x90
	.type	init,@function
init:                                   # @init
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	$0, -20(%rbp)
.LBB1_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$102400000, -20(%rbp)           # imm = 0x61A8000
	jge	.LBB1_4
# %bb.2:                                # %for.body
                                        #   in Loop: Header=BB1_1 Depth=1
	callq	rand
	cvtsi2ss	%eax, %xmm0
	movss	.LCPI1_0(%rip), %xmm1           # xmm1 = mem[0],zero,zero,zero
	divss	%xmm1, %xmm0
	movq	-8(%rbp), %rax
	movslq	-20(%rbp), %rcx
	movss	%xmm0, (%rax,%rcx,4)
	callq	rand
	cvtsi2ss	%eax, %xmm0
	movss	.LCPI1_0(%rip), %xmm1           # xmm1 = mem[0],zero,zero,zero
	divss	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	movslq	-20(%rbp), %rcx
	movss	%xmm0, (%rax,%rcx,4)
# %bb.3:                                # %for.inc
                                        #   in Loop: Header=BB1_1 Depth=1
	movl	-20(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -20(%rbp)
	jmp	.LBB1_1
.LBB1_4:                                # %for.end
	addq	$32, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end1:
	.size	init, .Lfunc_end1-init
	.cfi_endproc
                                        # -- End function
	.globl	axpy                            # -- Begin function axpy
	.p2align	4, 0x90
	.type	axpy,@function
axpy:                                   # @axpy
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movss	%xmm0, -20(%rbp)
	movl	$0, -28(%rbp)
.LBB2_1:                                # %omp.inner.for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$102400000, -28(%rbp)           # imm = 0x61A8000
	jge	.LBB2_5
# %bb.2:                                # %omp.inner.for.body
                                        #   in Loop: Header=BB2_1 Depth=1
	movl	-28(%rbp), %eax
	shll	$0, %eax
	addl	$0, %eax
	movl	%eax, -32(%rbp)
	movss	-20(%rbp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	movq	-8(%rbp), %rax
	movslq	-32(%rbp), %rcx
	mulss	(%rax,%rcx,4), %xmm0
	movq	-16(%rbp), %rax
	movslq	-32(%rbp), %rcx
	addss	(%rax,%rcx,4), %xmm0
	movss	%xmm0, (%rax,%rcx,4)
# %bb.3:                                # %omp.body.continue
                                        #   in Loop: Header=BB2_1 Depth=1
	jmp	.LBB2_4
.LBB2_4:                                # %omp.inner.for.inc
                                        #   in Loop: Header=BB2_1 Depth=1
	movl	-28(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -28(%rbp)
	jmp	.LBB2_1
.LBB2_5:                                # %omp.inner.for.end
	movl	$102400000, -32(%rbp)           # imm = 0x61A8000
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end2:
	.size	axpy, .Lfunc_end2-axpy
	.cfi_endproc
                                        # -- End function
	.globl	axpy_serial                     # -- Begin function axpy_serial
	.p2align	4, 0x90
	.type	axpy_serial,@function
axpy_serial:                            # @axpy_serial
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movss	%xmm0, -20(%rbp)
	movl	$0, -24(%rbp)
.LBB3_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$102400000, -24(%rbp)           # imm = 0x61A8000
	jge	.LBB3_4
# %bb.2:                                # %for.body
                                        #   in Loop: Header=BB3_1 Depth=1
	movss	-20(%rbp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	movq	-8(%rbp), %rax
	movslq	-24(%rbp), %rcx
	mulss	(%rax,%rcx,4), %xmm0
	movq	-16(%rbp), %rax
	movslq	-24(%rbp), %rcx
	addss	(%rax,%rcx,4), %xmm0
	movss	%xmm0, (%rax,%rcx,4)
# %bb.3:                                # %for.inc
                                        #   in Loop: Header=BB3_1 Depth=1
	movl	-24(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -24(%rbp)
	jmp	.LBB3_1
.LBB3_4:                                # %for.end
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end3:
	.size	axpy_serial, .Lfunc_end3-axpy_serial
	.cfi_endproc
                                        # -- End function
	.globl	print_vector                    # -- Begin function print_vector
	.p2align	4, 0x90
	.type	print_vector,@function
print_vector:                           # @print_vector
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movabsq	$.L.str, %rdi
	movb	$0, %al
	callq	printf
	movl	$0, -12(%rbp)
.LBB4_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$8, -12(%rbp)
	jge	.LBB4_4
# %bb.2:                                # %for.body
                                        #   in Loop: Header=BB4_1 Depth=1
	movq	-8(%rbp), %rax
	movslq	-12(%rbp), %rcx
	movss	(%rax,%rcx,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	cvtss2sd	%xmm0, %xmm0
	movabsq	$.L.str.1, %rdi
	movb	$1, %al
	callq	printf
# %bb.3:                                # %for.inc
                                        #   in Loop: Header=BB4_1 Depth=1
	movl	-12(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	jmp	.LBB4_1
.LBB4_4:                                # %for.end
	movabsq	$.L.str.2, %rdi
	callq	puts
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end4:
	.size	print_vector, .Lfunc_end4-print_vector
	.cfi_endproc
                                        # -- End function
	.globl	check                           # -- Begin function check
	.p2align	4, 0x90
	.type	check,@function
check:                                  # @check
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	xorps	%xmm0, %xmm0
	movss	%xmm0, -20(%rbp)
	movl	$0, -24(%rbp)
.LBB5_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$102400000, -24(%rbp)           # imm = 0x61A8000
	jge	.LBB5_4
# %bb.2:                                # %for.body
                                        #   in Loop: Header=BB5_1 Depth=1
	movq	-8(%rbp), %rax
	movslq	-24(%rbp), %rcx
	movss	(%rax,%rcx,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-16(%rbp), %rax
	movslq	-24(%rbp), %rcx
	subss	(%rax,%rcx,4), %xmm0
	addss	-20(%rbp), %xmm0
	movss	%xmm0, -20(%rbp)
# %bb.3:                                # %for.inc
                                        #   in Loop: Header=BB5_1 Depth=1
	movl	-24(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -24(%rbp)
	jmp	.LBB5_1
.LBB5_4:                                # %for.end
	movss	-20(%rbp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end5:
	.size	check, .Lfunc_end5-check
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2                               # -- Begin function main
.LCPI6_0:
	.long	0x4048f5c3                      # float 3.1400001
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3
.LCPI6_1:
	.quad	0x4034000000000000              # double 20
.LCPI6_2:
	.quad	0x43974876e8000000              # double 4.194304E+17
.LCPI6_3:
	.quad	0x41cdcd6500000000              # double 1.0E+9
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$128, %rsp
	movl	$0, -4(%rbp)
	movl	%edi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	$409600000, %edi                # imm = 0x186A0000
	callq	malloc
	movq	%rax, -24(%rbp)
	movl	$409600000, %edi                # imm = 0x186A0000
	callq	malloc
	movq	%rax, -32(%rbp)
	movl	$409600000, %edi                # imm = 0x186A0000
	callq	malloc
	movq	%rax, -40(%rbp)
	movss	.LCPI6_0(%rip), %xmm0           # xmm0 = mem[0],zero,zero,zero
	movss	%xmm0, -44(%rbp)
	xorl	%eax, %eax
	movl	%eax, %edi
	callq	time
	movl	%eax, %edi
	callq	srand
	movq	-24(%rbp), %rdi
	movq	-32(%rbp), %rsi
	callq	init
	movl	$0, -48(%rbp)
.LBB6_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$102400000, -48(%rbp)           # imm = 0x61A8000
	jge	.LBB6_4
# %bb.2:                                # %for.body
                                        #   in Loop: Header=BB6_1 Depth=1
	movq	-32(%rbp), %rax
	movslq	-48(%rbp), %rcx
	movss	(%rax,%rcx,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-40(%rbp), %rax
	movslq	-48(%rbp), %rcx
	movss	%xmm0, (%rax,%rcx,4)
# %bb.3:                                # %for.inc
                                        #   in Loop: Header=BB6_1 Depth=1
	movl	-48(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -48(%rbp)
	jmp	.LBB6_1
.LBB6_4:                                # %for.end
	movq	-32(%rbp), %rdi
	callq	print_vector
	movq	-24(%rbp), %rdi
	callq	print_vector
	movss	-44(%rbp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	cvtss2sd	%xmm0, %xmm0
	movabsq	$.L.str.3, %rdi
	movb	$1, %al
	callq	printf
	movabsq	$.L.str.4, %rdi
	callq	puts
	movq	-24(%rbp), %rdi
	movq	-32(%rbp), %rsi
	movss	-44(%rbp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	callq	axpy
	movq	-24(%rbp), %rdi
	movq	-40(%rbp), %rsi
	movss	-44(%rbp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	callq	axpy_serial
	movq	-24(%rbp), %rdi
	movq	-32(%rbp), %rsi
	callq	init
	movl	$0, -52(%rbp)
.LBB6_5:                                # %for.cond11
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$102400000, -52(%rbp)           # imm = 0x61A8000
	jge	.LBB6_8
# %bb.6:                                # %for.body14
                                        #   in Loop: Header=BB6_5 Depth=1
	movq	-32(%rbp), %rax
	movslq	-52(%rbp), %rcx
	movss	(%rax,%rcx,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-40(%rbp), %rax
	movslq	-52(%rbp), %rcx
	movss	%xmm0, (%rax,%rcx,4)
# %bb.7:                                # %for.inc19
                                        #   in Loop: Header=BB6_5 Depth=1
	movl	-52(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -52(%rbp)
	jmp	.LBB6_5
.LBB6_8:                                # %for.end21
	xorps	%xmm0, %xmm0
	movsd	%xmm0, -64(%rbp)
	callq	read_timer
	movsd	%xmm0, -72(%rbp)
	movl	$0, -76(%rbp)
.LBB6_9:                                # %for.cond24
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$20, -76(%rbp)
	jge	.LBB6_12
# %bb.10:                               # %for.body27
                                        #   in Loop: Header=BB6_9 Depth=1
	movq	-24(%rbp), %rdi
	movq	-32(%rbp), %rsi
	movss	-44(%rbp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	callq	axpy
# %bb.11:                               # %for.inc28
                                        #   in Loop: Header=BB6_9 Depth=1
	movl	-76(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -76(%rbp)
	jmp	.LBB6_9
.LBB6_12:                               # %for.end30
	callq	read_timer
	subsd	-72(%rbp), %xmm0
	addsd	-64(%rbp), %xmm0
	movsd	%xmm0, -64(%rbp)
	xorps	%xmm0, %xmm0
	movsd	%xmm0, -88(%rbp)
	callq	read_timer
	movsd	%xmm0, -96(%rbp)
	movl	$0, -100(%rbp)
.LBB6_13:                               # %for.cond34
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$20, -100(%rbp)
	jge	.LBB6_16
# %bb.14:                               # %for.body37
                                        #   in Loop: Header=BB6_13 Depth=1
	movq	-24(%rbp), %rdi
	movq	-40(%rbp), %rsi
	movss	-44(%rbp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	callq	axpy_serial
# %bb.15:                               # %for.inc38
                                        #   in Loop: Header=BB6_13 Depth=1
	movl	-100(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -100(%rbp)
	jmp	.LBB6_13
.LBB6_16:                               # %for.end40
	callq	read_timer
	subsd	-96(%rbp), %xmm0
	addsd	-88(%rbp), %xmm0
	movsd	%xmm0, -88(%rbp)
	movq	-32(%rbp), %rdi
	callq	print_vector
	movabsq	$.L.str.5, %rdi
	callq	puts
	movq	-40(%rbp), %rdi
	callq	print_vector
	movsd	.LCPI6_3(%rip), %xmm1           # xmm1 = mem[0],zero
	mulsd	-64(%rbp), %xmm1
	movsd	.LCPI6_2(%rip), %xmm0           # xmm0 = mem[0],zero
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -112(%rbp)
	movsd	.LCPI6_3(%rip), %xmm1           # xmm1 = mem[0],zero
	mulsd	-88(%rbp), %xmm1
	movsd	.LCPI6_2(%rip), %xmm0           # xmm0 = mem[0],zero
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -120(%rbp)
	movabsq	$.L.str.6, %rdi
	movb	$0, %al
	callq	printf
	movabsq	$.L.str.7, %rdi
	movb	$0, %al
	callq	printf
	movabsq	$.L.str.8, %rdi
	movb	$0, %al
	callq	printf
	movsd	-64(%rbp), %xmm0                # xmm0 = mem[0],zero
	movsd	.LCPI6_1(%rip), %xmm1           # xmm1 = mem[0],zero
	divsd	%xmm1, %xmm0
	movsd	-112(%rbp), %xmm1               # xmm1 = mem[0],zero
	movabsq	$.L.str.9, %rdi
	movb	$2, %al
	callq	printf
	movsd	-88(%rbp), %xmm0                # xmm0 = mem[0],zero
	movsd	.LCPI6_1(%rip), %xmm1           # xmm1 = mem[0],zero
	divsd	%xmm1, %xmm0
	movsd	-120(%rbp), %xmm1               # xmm1 = mem[0],zero
	movabsq	$.L.str.10, %rdi
	movb	$2, %al
	callq	printf
	movq	-32(%rbp), %rdi
	movq	-40(%rbp), %rsi
	callq	check
	cvtss2sd	%xmm0, %xmm0
	movabsq	$.L.str.11, %rdi
	movb	$1, %al
	callq	printf
	movq	-24(%rbp), %rdi
	callq	free
	movq	-32(%rbp), %rdi
	callq	free
	movq	-40(%rbp), %rdi
	callq	free
	xorl	%eax, %eax
	addq	$128, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end6:
	.size	main, .Lfunc_end6-main
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"["
	.size	.L.str, 2

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"%.2f "
	.size	.L.str.1, 6

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"]"
	.size	.L.str.2, 2

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	"%.2f\n"
	.size	.L.str.3, 6

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"=\n"
	.size	.L.str.4, 3

	.type	.L.str.5,@object                # @.str.5
.L.str.5:
	.asciz	"---------------------------------"
	.size	.L.str.5, 34

	.type	.L.str.6,@object                # @.str.6
.L.str.6:
	.asciz	"==================================================================\n"
	.size	.L.str.6, 68

	.type	.L.str.7,@object                # @.str.7
.L.str.7:
	.asciz	"Performance:\t\t\tRuntime (s)\t GFLOPS\n"
	.size	.L.str.7, 36

	.type	.L.str.8,@object                # @.str.8
.L.str.8:
	.asciz	"------------------------------------------------------------------\n"
	.size	.L.str.8, 68

	.type	.L.str.9,@object                # @.str.9
.L.str.9:
	.asciz	"AXPY (SIMD):\t\t%4f\t%4f\n"
	.size	.L.str.9, 23

	.type	.L.str.10,@object               # @.str.10
.L.str.10:
	.asciz	"AXPY (Serial):\t\t%4f\t%4f\n"
	.size	.L.str.10, 25

	.type	.L.str.11,@object               # @.str.11
.L.str.11:
	.asciz	"Correctness check: %f\n"
	.size	.L.str.11, 23

	.ident	"clang version 12.0.1 (https://github.com/llvm/llvm-project fed41342a82f5a3a9201819a82bf7a48313e296b)"
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
