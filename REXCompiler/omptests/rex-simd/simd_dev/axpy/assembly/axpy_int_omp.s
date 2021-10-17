	.text
	.file	"axpy_int.c"
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
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	leaq	8(%rsp), %rdi
	callq	ftime
	cvtsi2sdq	8(%rsp), %xmm1
	movzwl	16(%rsp), %eax
	cvtsi2sd	%eax, %xmm0
	divsd	.LCPI0_0(%rip), %xmm0
	addsd	%xmm1, %xmm0
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	read_timer, .Lfunc_end0-read_timer
	.cfi_endproc
                                        # -- End function
	.globl	init                            # -- Begin function init
	.p2align	4, 0x90
	.type	init,@function
init:                                   # @init
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rsi, %r14
	movq	%rdi, %r15
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB1_1:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	callq	rand
	cltq
	imulq	$-1610612725, %rax, %rcx        # imm = 0xA000000B
	shrq	$32, %rcx
	addl	%ecx, %eax
	movl	%eax, %ecx
	shrl	$31, %ecx
	sarl	$27, %eax
	addl	%ecx, %eax
	movl	%eax, (%r15,%rbx,4)
	callq	rand
	cltq
	imulq	$-1610612725, %rax, %rcx        # imm = 0xA000000B
	shrq	$32, %rcx
	addl	%ecx, %eax
	movl	%eax, %ecx
	shrl	$31, %ecx
	sarl	$27, %eax
	addl	%ecx, %eax
	movl	%eax, (%r14,%rbx,4)
	addq	$1, %rbx
	cmpq	$102400000, %rbx                # imm = 0x61A8000
	jne	.LBB1_1
# %bb.2:                                # %for.cond.cleanup
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
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
	movd	%edx, %xmm0
	pshufd	$0, %xmm0, %xmm0                # xmm0 = xmm0[0,0,0,0]
	movl	$12, %eax
	pshufd	$245, %xmm0, %xmm1              # xmm1 = xmm0[1,1,3,3]
	.p2align	4, 0x90
.LBB2_1:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	movdqu	-48(%rdi,%rax,4), %xmm2
	movdqu	-32(%rdi,%rax,4), %xmm3
	pshufd	$245, %xmm2, %xmm4              # xmm4 = xmm2[1,1,3,3]
	pmuludq	%xmm0, %xmm2
	pshufd	$232, %xmm2, %xmm2              # xmm2 = xmm2[0,2,2,3]
	pmuludq	%xmm1, %xmm4
	pshufd	$232, %xmm4, %xmm4              # xmm4 = xmm4[0,2,2,3]
	punpckldq	%xmm4, %xmm2            # xmm2 = xmm2[0],xmm4[0],xmm2[1],xmm4[1]
	pshufd	$245, %xmm3, %xmm4              # xmm4 = xmm3[1,1,3,3]
	pmuludq	%xmm0, %xmm3
	pshufd	$232, %xmm3, %xmm3              # xmm3 = xmm3[0,2,2,3]
	pmuludq	%xmm1, %xmm4
	pshufd	$232, %xmm4, %xmm4              # xmm4 = xmm4[0,2,2,3]
	punpckldq	%xmm4, %xmm3            # xmm3 = xmm3[0],xmm4[0],xmm3[1],xmm4[1]
	movdqu	-48(%rsi,%rax,4), %xmm4
	paddd	%xmm2, %xmm4
	movdqu	-32(%rsi,%rax,4), %xmm2
	paddd	%xmm3, %xmm2
	movdqu	-16(%rsi,%rax,4), %xmm3
	movdqu	(%rsi,%rax,4), %xmm5
	movdqu	%xmm4, -48(%rsi,%rax,4)
	movdqu	%xmm2, -32(%rsi,%rax,4)
	movdqu	-16(%rdi,%rax,4), %xmm2
	movdqu	(%rdi,%rax,4), %xmm4
	pshufd	$245, %xmm2, %xmm6              # xmm6 = xmm2[1,1,3,3]
	pmuludq	%xmm0, %xmm2
	pshufd	$232, %xmm2, %xmm2              # xmm2 = xmm2[0,2,2,3]
	pmuludq	%xmm1, %xmm6
	pshufd	$232, %xmm6, %xmm6              # xmm6 = xmm6[0,2,2,3]
	punpckldq	%xmm6, %xmm2            # xmm2 = xmm2[0],xmm6[0],xmm2[1],xmm6[1]
	paddd	%xmm3, %xmm2
	pshufd	$245, %xmm4, %xmm3              # xmm3 = xmm4[1,1,3,3]
	pmuludq	%xmm0, %xmm4
	pshufd	$232, %xmm4, %xmm4              # xmm4 = xmm4[0,2,2,3]
	pmuludq	%xmm1, %xmm3
	pshufd	$232, %xmm3, %xmm3              # xmm3 = xmm3[0,2,2,3]
	punpckldq	%xmm3, %xmm4            # xmm4 = xmm4[0],xmm3[0],xmm4[1],xmm3[1]
	paddd	%xmm5, %xmm4
	movdqu	%xmm2, -16(%rsi,%rax,4)
	movdqu	%xmm4, (%rsi,%rax,4)
	addq	$16, %rax
	cmpq	$102400012, %rax                # imm = 0x61A800C
	jne	.LBB2_1
# %bb.2:                                # %omp.inner.for.end
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
	leaq	409600000(%rdi), %rax
	cmpq	%rsi, %rax
	jbe	.LBB3_4
# %bb.1:                                # %entry
	leaq	409600000(%rsi), %rax
	cmpq	%rdi, %rax
	jbe	.LBB3_4
# %bb.2:                                # %for.body.preheader
	movl	$1, %eax
	.p2align	4, 0x90
.LBB3_3:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movl	-4(%rdi,%rax,4), %ecx
	imull	%edx, %ecx
	addl	%ecx, -4(%rsi,%rax,4)
	movl	(%rdi,%rax,4), %ecx
	imull	%edx, %ecx
	addl	%ecx, (%rsi,%rax,4)
	addq	$2, %rax
	cmpq	$102400001, %rax                # imm = 0x61A8001
	jne	.LBB3_3
	jmp	.LBB3_6
.LBB3_4:                                # %vector.ph
	movd	%edx, %xmm0
	pshufd	$0, %xmm0, %xmm0                # xmm0 = xmm0[0,0,0,0]
	movl	$12, %eax
	pshufd	$245, %xmm0, %xmm1              # xmm1 = xmm0[1,1,3,3]
	.p2align	4, 0x90
.LBB3_5:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	movdqu	-48(%rdi,%rax,4), %xmm2
	movdqu	-32(%rdi,%rax,4), %xmm3
	pshufd	$245, %xmm2, %xmm4              # xmm4 = xmm2[1,1,3,3]
	pmuludq	%xmm0, %xmm2
	pshufd	$232, %xmm2, %xmm2              # xmm2 = xmm2[0,2,2,3]
	pmuludq	%xmm1, %xmm4
	pshufd	$232, %xmm4, %xmm4              # xmm4 = xmm4[0,2,2,3]
	punpckldq	%xmm4, %xmm2            # xmm2 = xmm2[0],xmm4[0],xmm2[1],xmm4[1]
	pshufd	$245, %xmm3, %xmm4              # xmm4 = xmm3[1,1,3,3]
	pmuludq	%xmm0, %xmm3
	pshufd	$232, %xmm3, %xmm3              # xmm3 = xmm3[0,2,2,3]
	pmuludq	%xmm1, %xmm4
	pshufd	$232, %xmm4, %xmm4              # xmm4 = xmm4[0,2,2,3]
	punpckldq	%xmm4, %xmm3            # xmm3 = xmm3[0],xmm4[0],xmm3[1],xmm4[1]
	movdqu	-48(%rsi,%rax,4), %xmm4
	paddd	%xmm2, %xmm4
	movdqu	-32(%rsi,%rax,4), %xmm2
	paddd	%xmm3, %xmm2
	movdqu	-16(%rsi,%rax,4), %xmm3
	movdqu	(%rsi,%rax,4), %xmm5
	movdqu	%xmm4, -48(%rsi,%rax,4)
	movdqu	%xmm2, -32(%rsi,%rax,4)
	movdqu	-16(%rdi,%rax,4), %xmm2
	movdqu	(%rdi,%rax,4), %xmm4
	pshufd	$245, %xmm2, %xmm6              # xmm6 = xmm2[1,1,3,3]
	pmuludq	%xmm0, %xmm2
	pshufd	$232, %xmm2, %xmm2              # xmm2 = xmm2[0,2,2,3]
	pmuludq	%xmm1, %xmm6
	pshufd	$232, %xmm6, %xmm6              # xmm6 = xmm6[0,2,2,3]
	punpckldq	%xmm6, %xmm2            # xmm2 = xmm2[0],xmm6[0],xmm2[1],xmm6[1]
	paddd	%xmm3, %xmm2
	pshufd	$245, %xmm4, %xmm3              # xmm3 = xmm4[1,1,3,3]
	pmuludq	%xmm0, %xmm4
	pshufd	$232, %xmm4, %xmm4              # xmm4 = xmm4[0,2,2,3]
	pmuludq	%xmm1, %xmm3
	pshufd	$232, %xmm3, %xmm3              # xmm3 = xmm3[0,2,2,3]
	punpckldq	%xmm3, %xmm4            # xmm4 = xmm4[0],xmm3[0],xmm4[1],xmm3[1]
	paddd	%xmm5, %xmm4
	movdqu	%xmm2, -16(%rsi,%rax,4)
	movdqu	%xmm4, (%rsi,%rax,4)
	addq	$16, %rax
	cmpq	$102400012, %rax                # imm = 0x61A800C
	jne	.LBB3_5
.LBB3_6:                                # %for.cond.cleanup
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
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	movl	$91, %edi
	callq	putchar@PLT
	movl	(%rbx), %esi
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	callq	printf
	movl	4(%rbx), %esi
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	callq	printf
	movl	8(%rbx), %esi
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	callq	printf
	movl	12(%rbx), %esi
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	callq	printf
	movl	16(%rbx), %esi
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	callq	printf
	movl	20(%rbx), %esi
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	callq	printf
	movl	24(%rbx), %esi
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	callq	printf
	movl	28(%rbx), %esi
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	callq	printf
	movl	$.L.str.2, %edi
	popq	%rbx
	.cfi_def_cfa_offset 8
	jmp	puts                            # TAILCALL
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
	pxor	%xmm0, %xmm0
	movl	$12, %eax
	pxor	%xmm1, %xmm1
	.p2align	4, 0x90
.LBB5_1:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	movdqu	-48(%rdi,%rax,4), %xmm2
	paddd	%xmm0, %xmm2
	movdqu	-32(%rdi,%rax,4), %xmm3
	paddd	%xmm1, %xmm3
	movdqu	-16(%rdi,%rax,4), %xmm0
	paddd	%xmm2, %xmm0
	movdqu	(%rdi,%rax,4), %xmm1
	paddd	%xmm3, %xmm1
	movdqu	-48(%rsi,%rax,4), %xmm2
	movdqu	-32(%rsi,%rax,4), %xmm3
	movdqu	-16(%rsi,%rax,4), %xmm4
	paddd	%xmm2, %xmm4
	psubd	%xmm4, %xmm0
	movdqu	(%rsi,%rax,4), %xmm2
	paddd	%xmm3, %xmm2
	psubd	%xmm2, %xmm1
	addq	$16, %rax
	cmpq	$102400012, %rax                # imm = 0x61A800C
	jne	.LBB5_1
# %bb.2:                                # %middle.block
	paddd	%xmm0, %xmm1
	pshufd	$238, %xmm1, %xmm0              # xmm0 = xmm1[2,3,2,3]
	paddd	%xmm1, %xmm0
	pshufd	$85, %xmm0, %xmm1               # xmm1 = xmm0[1,1,1,1]
	paddd	%xmm0, %xmm1
	movd	%xmm1, %eax
	retq
.Lfunc_end5:
	.size	check, .Lfunc_end5-check
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3                               # -- Begin function main
.LCPI6_0:
	.quad	0x408f400000000000              # double 1000
.LCPI6_1:
	.quad	0x41cdcd6500000000              # double 1.0E+9
.LCPI6_2:
	.quad	0x43974876e8000000              # double 4.194304E+17
.LCPI6_3:
	.quad	0x4034000000000000              # double 20
.LCPI6_4:
	.quad	0x0000000000000000              # double 0
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r12
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	subq	$56, %rsp
	.cfi_def_cfa_offset 96
	.cfi_offset %rbx, -40
	.cfi_offset %r12, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movl	$409600000, %edi                # imm = 0x186A0000
	callq	malloc
	movq	%rax, %r14
	movl	$409600000, %edi                # imm = 0x186A0000
	callq	malloc
	movq	%rax, %rbx
	movl	$409600000, %edi                # imm = 0x186A0000
	callq	malloc
	movq	%rax, %r15
	xorl	%r12d, %r12d
	xorl	%edi, %edi
	callq	time
	movl	%eax, %edi
	callq	srand
	.p2align	4, 0x90
.LBB6_1:                                # %for.body.i
                                        # =>This Inner Loop Header: Depth=1
	callq	rand
	cltq
	imulq	$-1610612725, %rax, %rcx        # imm = 0xA000000B
	shrq	$32, %rcx
	addl	%ecx, %eax
	movl	%eax, %ecx
	shrl	$31, %ecx
	sarl	$27, %eax
	addl	%ecx, %eax
	movl	%eax, (%r14,%r12,4)
	callq	rand
	cltq
	imulq	$-1610612725, %rax, %rcx        # imm = 0xA000000B
	shrq	$32, %rcx
	addl	%ecx, %eax
	movl	%eax, %ecx
	shrl	$31, %ecx
	sarl	$27, %eax
	addl	%ecx, %eax
	movl	%eax, (%rbx,%r12,4)
	addq	$1, %r12
	cmpq	$102400000, %r12                # imm = 0x61A8000
	jne	.LBB6_1
# %bb.2:                                # %for.body.preheader
	movl	$409600000, %edx                # imm = 0x186A0000
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	memcpy@PLT
	movq	%rbx, %rdi
	callq	print_vector
	movq	%r14, %rdi
	callq	print_vector
	movl	$.L.str.3, %edi
	movl	$3, %esi
	xorl	%eax, %eax
	callq	printf
	movl	$.L.str.4, %edi
	callq	puts
	movl	$12, %eax
	.p2align	4, 0x90
.LBB6_3:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	movdqu	-48(%r14,%rax,4), %xmm0
	movdqu	-32(%r14,%rax,4), %xmm1
	movdqu	-48(%rbx,%rax,4), %xmm2
	paddd	%xmm0, %xmm2
	paddd	%xmm0, %xmm0
	movdqu	-32(%rbx,%rax,4), %xmm3
	paddd	%xmm1, %xmm3
	paddd	%xmm1, %xmm1
	movdqu	-16(%rbx,%rax,4), %xmm4
	movdqu	(%rbx,%rax,4), %xmm5
	paddd	%xmm0, %xmm2
	paddd	%xmm1, %xmm3
	movdqu	%xmm2, -48(%rbx,%rax,4)
	movdqu	%xmm3, -32(%rbx,%rax,4)
	movdqu	-16(%r14,%rax,4), %xmm0
	movdqu	(%r14,%rax,4), %xmm1
	paddd	%xmm0, %xmm4
	paddd	%xmm0, %xmm0
	paddd	%xmm1, %xmm5
	paddd	%xmm1, %xmm1
	paddd	%xmm0, %xmm4
	paddd	%xmm1, %xmm5
	movdqu	%xmm4, -16(%rbx,%rax,4)
	movdqu	%xmm5, (%rbx,%rax,4)
	addq	$16, %rax
	cmpq	$102400012, %rax                # imm = 0x61A800C
	jne	.LBB6_3
# %bb.4:                                # %vector.body194.preheader
	movl	$12, %eax
	.p2align	4, 0x90
.LBB6_5:                                # %vector.body194
                                        # =>This Inner Loop Header: Depth=1
	movdqu	-48(%r14,%rax,4), %xmm0
	movdqu	-32(%r14,%rax,4), %xmm1
	movdqu	-48(%r15,%rax,4), %xmm2
	paddd	%xmm0, %xmm2
	paddd	%xmm0, %xmm0
	movdqu	-32(%r15,%rax,4), %xmm3
	paddd	%xmm1, %xmm3
	paddd	%xmm1, %xmm1
	movdqu	-16(%r15,%rax,4), %xmm4
	movdqu	(%r15,%rax,4), %xmm5
	paddd	%xmm0, %xmm2
	paddd	%xmm1, %xmm3
	movdqu	%xmm2, -48(%r15,%rax,4)
	movdqu	%xmm3, -32(%r15,%rax,4)
	movdqu	-16(%r14,%rax,4), %xmm0
	movdqu	(%r14,%rax,4), %xmm1
	paddd	%xmm0, %xmm4
	paddd	%xmm0, %xmm0
	paddd	%xmm1, %xmm5
	paddd	%xmm1, %xmm1
	paddd	%xmm0, %xmm4
	paddd	%xmm1, %xmm5
	movdqu	%xmm4, -16(%r15,%rax,4)
	movdqu	%xmm5, (%r15,%rax,4)
	addq	$16, %rax
	cmpq	$102400012, %rax                # imm = 0x61A800C
	jne	.LBB6_5
# %bb.6:                                # %for.body.i146.preheader
	xorl	%r12d, %r12d
	.p2align	4, 0x90
.LBB6_7:                                # %for.body.i146
                                        # =>This Inner Loop Header: Depth=1
	callq	rand
	cltq
	imulq	$-1610612725, %rax, %rcx        # imm = 0xA000000B
	shrq	$32, %rcx
	addl	%ecx, %eax
	movl	%eax, %ecx
	shrl	$31, %ecx
	sarl	$27, %eax
	addl	%ecx, %eax
	movl	%eax, (%r14,%r12,4)
	callq	rand
	cltq
	imulq	$-1610612725, %rax, %rcx        # imm = 0xA000000B
	shrq	$32, %rcx
	addl	%ecx, %eax
	movl	%eax, %ecx
	shrl	$31, %ecx
	sarl	$27, %eax
	addl	%ecx, %eax
	movl	%eax, (%rbx,%r12,4)
	addq	$1, %r12
	cmpq	$102400000, %r12                # imm = 0x61A8000
	jne	.LBB6_7
# %bb.8:                                # %for.body14.preheader
	movl	$409600000, %edx                # imm = 0x186A0000
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	memcpy@PLT
	leaq	16(%rsp), %rdi
	callq	ftime
	movzwl	24(%rsp), %eax
	cvtsi2sd	%eax, %xmm6
	movq	16(%rsp), %rax
	divsd	.LCPI6_0(%rip), %xmm6
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB6_9:                                # %vector.ph207
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_10 Depth 2
	movl	$12, %edx
	.p2align	4, 0x90
.LBB6_10:                               # %vector.body206
                                        #   Parent Loop BB6_9 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movdqu	-48(%r14,%rdx,4), %xmm0
	movdqu	-32(%r14,%rdx,4), %xmm1
	movdqu	-48(%rbx,%rdx,4), %xmm2
	paddd	%xmm0, %xmm2
	paddd	%xmm0, %xmm0
	movdqu	-32(%rbx,%rdx,4), %xmm3
	paddd	%xmm1, %xmm3
	paddd	%xmm1, %xmm1
	movdqu	-16(%rbx,%rdx,4), %xmm4
	movdqu	(%rbx,%rdx,4), %xmm5
	paddd	%xmm0, %xmm2
	paddd	%xmm1, %xmm3
	movdqu	%xmm2, -48(%rbx,%rdx,4)
	movdqu	%xmm3, -32(%rbx,%rdx,4)
	movdqu	-16(%r14,%rdx,4), %xmm0
	movdqu	(%r14,%rdx,4), %xmm1
	paddd	%xmm0, %xmm4
	paddd	%xmm0, %xmm0
	paddd	%xmm1, %xmm5
	paddd	%xmm1, %xmm1
	paddd	%xmm0, %xmm4
	paddd	%xmm1, %xmm5
	movdqu	%xmm4, -16(%rbx,%rdx,4)
	movdqu	%xmm5, (%rbx,%rdx,4)
	addq	$16, %rdx
	cmpq	$102400012, %rdx                # imm = 0x61A800C
	jne	.LBB6_10
# %bb.11:                               # %axpy.exit175
                                        #   in Loop: Header=BB6_9 Depth=1
	addl	$1, %ecx
	cmpl	$20, %ecx
	jne	.LBB6_9
# %bb.12:                               # %for.cond.cleanup27
	xorps	%xmm0, %xmm0
	cvtsi2sd	%rax, %xmm0
	addsd	%xmm0, %xmm6
	movsd	%xmm6, 8(%rsp)                  # 8-byte Spill
	leaq	16(%rsp), %rdi
	callq	ftime
	xorps	%xmm0, %xmm0
	cvtsi2sdq	16(%rsp), %xmm0
	movzwl	24(%rsp), %eax
	xorps	%xmm1, %xmm1
	cvtsi2sd	%eax, %xmm1
	divsd	.LCPI6_0(%rip), %xmm1
	addsd	%xmm0, %xmm1
	subsd	8(%rsp), %xmm1                  # 8-byte Folded Reload
	movsd	%xmm1, 8(%rsp)                  # 8-byte Spill
	leaq	16(%rsp), %rdi
	callq	ftime
	movq	16(%rsp), %rax
	movzwl	24(%rsp), %ecx
	xorps	%xmm6, %xmm6
	cvtsi2sd	%ecx, %xmm6
	divsd	.LCPI6_0(%rip), %xmm6
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB6_13:                               # %vector.ph219
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_14 Depth 2
	movl	$12, %edx
	.p2align	4, 0x90
.LBB6_14:                               # %vector.body218
                                        #   Parent Loop BB6_13 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movdqu	-48(%r14,%rdx,4), %xmm0
	movdqu	-32(%r14,%rdx,4), %xmm1
	movdqu	-48(%r15,%rdx,4), %xmm2
	paddd	%xmm0, %xmm2
	paddd	%xmm0, %xmm0
	movdqu	-32(%r15,%rdx,4), %xmm3
	paddd	%xmm1, %xmm3
	paddd	%xmm1, %xmm1
	movdqu	-16(%r15,%rdx,4), %xmm4
	movdqu	(%r15,%rdx,4), %xmm5
	paddd	%xmm0, %xmm2
	paddd	%xmm1, %xmm3
	movdqu	%xmm2, -48(%r15,%rdx,4)
	movdqu	%xmm3, -32(%r15,%rdx,4)
	movdqu	-16(%r14,%rdx,4), %xmm0
	movdqu	(%r14,%rdx,4), %xmm1
	paddd	%xmm0, %xmm4
	paddd	%xmm0, %xmm0
	paddd	%xmm1, %xmm5
	paddd	%xmm1, %xmm1
	paddd	%xmm0, %xmm4
	paddd	%xmm1, %xmm5
	movdqu	%xmm4, -16(%r15,%rdx,4)
	movdqu	%xmm5, (%r15,%rdx,4)
	addq	$16, %rdx
	cmpq	$102400012, %rdx                # imm = 0x61A800C
	jne	.LBB6_14
# %bb.15:                               # %axpy_serial.exit129
                                        #   in Loop: Header=BB6_13 Depth=1
	addl	$1, %ecx
	cmpl	$20, %ecx
	jne	.LBB6_13
# %bb.16:                               # %for.cond.cleanup38
	xorpd	%xmm1, %xmm1
	movsd	8(%rsp), %xmm0                  # 8-byte Reload
                                        # xmm0 = mem[0],zero
	addsd	%xmm1, %xmm0
	movsd	%xmm0, 8(%rsp)                  # 8-byte Spill
	xorps	%xmm0, %xmm0
	cvtsi2sd	%rax, %xmm0
	addsd	%xmm0, %xmm6
	movsd	%xmm6, 32(%rsp)                 # 8-byte Spill
	leaq	16(%rsp), %rdi
	callq	ftime
	xorps	%xmm0, %xmm0
	cvtsi2sdq	16(%rsp), %xmm0
	movzwl	24(%rsp), %eax
	xorps	%xmm1, %xmm1
	cvtsi2sd	%eax, %xmm1
	divsd	.LCPI6_0(%rip), %xmm1
	addsd	%xmm0, %xmm1
	subsd	32(%rsp), %xmm1                 # 8-byte Folded Reload
	addsd	.LCPI6_4, %xmm1
	movsd	%xmm1, 32(%rsp)                 # 8-byte Spill
	movq	%rbx, %rdi
	callq	print_vector
	movl	$.L.str.5, %edi
	callq	puts
	movq	%r15, %rdi
	callq	print_vector
	movsd	.LCPI6_1(%rip), %xmm0           # xmm0 = mem[0],zero
	movsd	8(%rsp), %xmm1                  # 8-byte Reload
                                        # xmm1 = mem[0],zero
	mulsd	%xmm0, %xmm1
	movsd	.LCPI6_2(%rip), %xmm2           # xmm2 = mem[0],zero
	movapd	%xmm2, %xmm3
	divsd	%xmm1, %xmm3
	movsd	%xmm3, 40(%rsp)                 # 8-byte Spill
	mulsd	32(%rsp), %xmm0                 # 8-byte Folded Reload
	divsd	%xmm0, %xmm2
	movsd	%xmm2, 48(%rsp)                 # 8-byte Spill
	movl	$.Lstr, %edi
	callq	puts
	movl	$.Lstr.12, %edi
	callq	puts
	movl	$.Lstr.13, %edi
	callq	puts
	movsd	8(%rsp), %xmm0                  # 8-byte Reload
                                        # xmm0 = mem[0],zero
	divsd	.LCPI6_3(%rip), %xmm0
	movl	$.L.str.9, %edi
	movsd	40(%rsp), %xmm1                 # 8-byte Reload
                                        # xmm1 = mem[0],zero
	movb	$2, %al
	callq	printf
	movsd	32(%rsp), %xmm0                 # 8-byte Reload
                                        # xmm0 = mem[0],zero
	divsd	.LCPI6_3(%rip), %xmm0
	movl	$.L.str.10, %edi
	movq	48(%rsp), %xmm1                 # 8-byte Folded Reload
                                        # xmm1 = mem[0],zero
	movb	$2, %al
	callq	printf
	xorpd	%xmm0, %xmm0
	movl	$12, %eax
	pxor	%xmm1, %xmm1
	.p2align	4, 0x90
.LBB6_17:                               # %vector.body230
                                        # =>This Inner Loop Header: Depth=1
	movdqu	-48(%rbx,%rax,4), %xmm2
	paddd	%xmm0, %xmm2
	movdqu	-32(%rbx,%rax,4), %xmm3
	paddd	%xmm1, %xmm3
	movdqu	-16(%rbx,%rax,4), %xmm0
	paddd	%xmm2, %xmm0
	movdqu	(%rbx,%rax,4), %xmm1
	paddd	%xmm3, %xmm1
	movdqu	-48(%r15,%rax,4), %xmm2
	movdqu	-32(%r15,%rax,4), %xmm3
	movdqu	-16(%r15,%rax,4), %xmm4
	paddd	%xmm2, %xmm4
	psubd	%xmm4, %xmm0
	movdqu	(%r15,%rax,4), %xmm2
	paddd	%xmm3, %xmm2
	psubd	%xmm2, %xmm1
	addq	$16, %rax
	cmpq	$102400012, %rax                # imm = 0x61A800C
	jne	.LBB6_17
# %bb.18:                               # %middle.block228
	paddd	%xmm0, %xmm1
	pshufd	$238, %xmm1, %xmm0              # xmm0 = xmm1[2,3,2,3]
	paddd	%xmm1, %xmm0
	pshufd	$85, %xmm0, %xmm1               # xmm1 = xmm0[1,1,1,1]
	paddd	%xmm0, %xmm1
	movd	%xmm1, %esi
	movl	$.L.str.11, %edi
	xorl	%eax, %eax
	callq	printf
	movq	%r14, %rdi
	callq	free
	movq	%rbx, %rdi
	callq	free
	movq	%r15, %rdi
	callq	free
	xorl	%eax, %eax
	addq	$56, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end6:
	.size	main, .Lfunc_end6-main
	.cfi_endproc
                                        # -- End function
	.type	.L.str.1,@object                # @.str.1
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.1:
	.asciz	"%d "
	.size	.L.str.1, 4

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"]"
	.size	.L.str.2, 2

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	"%d\n"
	.size	.L.str.3, 4

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"=\n"
	.size	.L.str.4, 3

	.type	.L.str.5,@object                # @.str.5
.L.str.5:
	.asciz	"---------------------------------"
	.size	.L.str.5, 34

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
	.asciz	"Correctness check: %d\n"
	.size	.L.str.11, 23

	.type	.Lstr,@object                   # @str
.Lstr:
	.asciz	"=================================================================="
	.size	.Lstr, 67

	.type	.Lstr.12,@object                # @str.12
.Lstr.12:
	.asciz	"Performance:\t\t\tRuntime (s)\t GFLOPS"
	.size	.Lstr.12, 35

	.type	.Lstr.13,@object                # @str.13
.Lstr.13:
	.asciz	"------------------------------------------------------------------"
	.size	.Lstr.13, 67

	.ident	"clang version 12.0.1 (https://github.com/llvm/llvm-project fed41342a82f5a3a9201819a82bf7a48313e296b)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
