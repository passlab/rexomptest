	.text
	.file	"matmul_int.c"
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
	vcvtsi2sdq	8(%rsp), %xmm0, %xmm0
	movzwl	16(%rsp), %eax
	vcvtsi2sd	%eax, %xmm1, %xmm1
	vdivsd	.LCPI0_0(%rip), %xmm1, %xmm1
	vaddsd	%xmm0, %xmm1, %xmm0
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
	movq	%rdi, %r14
	xorl	%r15d, %r15d
	.p2align	4, 0x90
.LBB1_1:                                # %for.cond1.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_2 Depth 2
	movq	$-4096, %rbx                    # imm = 0xF000
	.p2align	4, 0x90
.LBB1_2:                                # %for.body3
                                        #   Parent Loop BB1_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	callq	rand
	cltq
	imulq	$-1610612725, %rax, %rcx        # imm = 0xA000000B
	shrq	$32, %rcx
	addl	%ecx, %eax
	movl	%eax, %ecx
	shrl	$31, %ecx
	sarl	$27, %eax
	addl	%ecx, %eax
	movq	(%r14,%r15,8), %rcx
	movl	%eax, 4096(%rcx,%rbx)
	addq	$4, %rbx
	jne	.LBB1_2
# %bb.3:                                # %for.inc6
                                        #   in Loop: Header=BB1_1 Depth=1
	addq	$1, %r15
	cmpq	$1024, %r15                     # imm = 0x400
	jne	.LBB1_1
# %bb.4:                                # %for.end8
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
	.globl	matmul_simd                     # -- Begin function matmul_simd
	.p2align	4, 0x90
	.type	matmul_simd,@function
matmul_simd:                            # @matmul_simd
	.cfi_startproc
# %bb.0:                                # %entry
	xorl	%r8d, %r8d
	.p2align	4, 0x90
.LBB2_1:                                # %for.cond1.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_2 Depth 2
                                        #       Child Loop BB2_3 Depth 3
	movq	(%rdi,%r8,8), %r11
	movq	(%rdx,%r8,8), %r9
	xorl	%r10d, %r10d
	.p2align	4, 0x90
.LBB2_2:                                # %omp.inner.for.cond.preheader
                                        #   Parent Loop BB2_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB2_3 Depth 3
	movq	(%rsi,%r10,8), %rax
	vpxor	%xmm0, %xmm0, %xmm0
	movq	$-1024, %rcx                    # imm = 0xFC00
	vpxor	%xmm1, %xmm1, %xmm1
	vpxor	%xmm2, %xmm2, %xmm2
	vpxor	%xmm3, %xmm3, %xmm3
	.p2align	4, 0x90
.LBB2_3:                                # %vector.body
                                        #   Parent Loop BB2_1 Depth=1
                                        #     Parent Loop BB2_2 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	vmovdqu64	4096(%rax,%rcx,4), %zmm4
	vmovdqu64	4160(%rax,%rcx,4), %zmm5
	vpmulld	4096(%r11,%rcx,4), %zmm4, %zmm4
	vmovdqu64	4224(%rax,%rcx,4), %zmm6
	vpmulld	4160(%r11,%rcx,4), %zmm5, %zmm5
	vmovdqu64	4288(%rax,%rcx,4), %zmm7
	vpmulld	4224(%r11,%rcx,4), %zmm6, %zmm6
	vpaddd	%zmm0, %zmm4, %zmm0
	vpmulld	4288(%r11,%rcx,4), %zmm7, %zmm4
	vpaddd	%zmm1, %zmm5, %zmm1
	vpaddd	%zmm2, %zmm6, %zmm2
	vpaddd	%zmm3, %zmm4, %zmm3
	vmovdqu64	4352(%rax,%rcx,4), %zmm4
	vmovdqu64	4416(%rax,%rcx,4), %zmm5
	vpmulld	4352(%r11,%rcx,4), %zmm4, %zmm4
	vmovdqu64	4480(%rax,%rcx,4), %zmm6
	vpmulld	4416(%r11,%rcx,4), %zmm5, %zmm5
	vmovdqu64	4544(%rax,%rcx,4), %zmm7
	vpmulld	4480(%r11,%rcx,4), %zmm6, %zmm6
	vpaddd	%zmm0, %zmm4, %zmm0
	vpmulld	4544(%r11,%rcx,4), %zmm7, %zmm4
	vpaddd	%zmm1, %zmm5, %zmm1
	vpaddd	%zmm2, %zmm6, %zmm2
	vpaddd	%zmm3, %zmm4, %zmm3
	subq	$-128, %rcx
	jne	.LBB2_3
# %bb.4:                                # %middle.block
                                        #   in Loop: Header=BB2_2 Depth=2
	vpaddd	%zmm0, %zmm1, %zmm0
	vpaddd	%zmm0, %zmm2, %zmm0
	vpaddd	%zmm0, %zmm3, %zmm0
	vextracti64x4	$1, %zmm0, %ymm1
	vpaddd	%zmm1, %zmm0, %zmm0
	vextracti128	$1, %ymm0, %xmm1
	vpaddd	%xmm1, %xmm0, %xmm0
	vpshufd	$238, %xmm0, %xmm1              # xmm1 = xmm0[2,3,2,3]
	vpaddd	%xmm1, %xmm0, %xmm0
	vpshufd	$85, %xmm0, %xmm1               # xmm1 = xmm0[1,1,1,1]
	vpaddd	%xmm1, %xmm0, %xmm0
	vmovd	%xmm0, (%r9,%r10,4)
	addq	$1, %r10
	cmpq	$1024, %r10                     # imm = 0x400
	jne	.LBB2_2
# %bb.5:                                # %for.inc21
                                        #   in Loop: Header=BB2_1 Depth=1
	addq	$1, %r8
	cmpq	$1024, %r8                      # imm = 0x400
	jne	.LBB2_1
# %bb.6:                                # %for.end23
	retq
.Lfunc_end2:
	.size	matmul_simd, .Lfunc_end2-matmul_simd
	.cfi_endproc
                                        # -- End function
	.globl	print_matrix                    # -- Begin function print_matrix
	.p2align	4, 0x90
	.type	print_matrix,@function
print_matrix:                           # @print_matrix
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	%rdi, %r14
	movq	$-64, %rbx
	.p2align	4, 0x90
.LBB3_1:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movl	$91, %edi
	callq	putchar@PLT
	movq	64(%r14,%rbx), %rax
	movl	(%rax), %esi
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	callq	printf
	movq	64(%r14,%rbx), %rax
	movl	4(%rax), %esi
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	callq	printf
	movq	64(%r14,%rbx), %rax
	movl	8(%rax), %esi
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	callq	printf
	movq	64(%r14,%rbx), %rax
	movl	12(%rax), %esi
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	callq	printf
	movq	64(%r14,%rbx), %rax
	movl	16(%rax), %esi
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	callq	printf
	movq	64(%r14,%rbx), %rax
	movl	20(%rax), %esi
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	callq	printf
	movq	64(%r14,%rbx), %rax
	movl	24(%rax), %esi
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	callq	printf
	movq	64(%r14,%rbx), %rax
	movl	28(%rax), %esi
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	callq	printf
	movl	$.L.str.2, %edi
	callq	puts
	addq	$8, %rbx
	jne	.LBB3_1
# %bb.2:                                # %for.cond.cleanup
	movl	$10, %edi
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	jmp	putchar@PLT                     # TAILCALL
.Lfunc_end3:
	.size	print_matrix, .Lfunc_end3-print_matrix
	.cfi_endproc
                                        # -- End function
	.globl	matmul_serial                   # -- Begin function matmul_serial
	.p2align	4, 0x90
	.type	matmul_serial,@function
matmul_serial:                          # @matmul_serial
	.cfi_startproc
# %bb.0:                                # %entry
	xorl	%r8d, %r8d
	.p2align	4, 0x90
.LBB4_1:                                # %for.cond1.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB4_2 Depth 2
                                        #       Child Loop BB4_3 Depth 3
	movq	(%rdi,%r8,8), %r11
	movq	(%rdx,%r8,8), %r9
	xorl	%r10d, %r10d
	.p2align	4, 0x90
.LBB4_2:                                # %for.cond4.preheader
                                        #   Parent Loop BB4_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB4_3 Depth 3
	movq	(%rsi,%r10,8), %rax
	vpxor	%xmm0, %xmm0, %xmm0
	movq	$-1024, %rcx                    # imm = 0xFC00
	vpxor	%xmm1, %xmm1, %xmm1
	vpxor	%xmm2, %xmm2, %xmm2
	vpxor	%xmm3, %xmm3, %xmm3
	.p2align	4, 0x90
.LBB4_3:                                # %vector.body
                                        #   Parent Loop BB4_1 Depth=1
                                        #     Parent Loop BB4_2 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	vmovdqu64	4096(%rax,%rcx,4), %zmm4
	vmovdqu64	4160(%rax,%rcx,4), %zmm5
	vpmulld	4096(%r11,%rcx,4), %zmm4, %zmm4
	vmovdqu64	4224(%rax,%rcx,4), %zmm6
	vpmulld	4160(%r11,%rcx,4), %zmm5, %zmm5
	vmovdqu64	4288(%rax,%rcx,4), %zmm7
	vpmulld	4224(%r11,%rcx,4), %zmm6, %zmm6
	vpaddd	%zmm0, %zmm4, %zmm0
	vpmulld	4288(%r11,%rcx,4), %zmm7, %zmm4
	vpaddd	%zmm1, %zmm5, %zmm1
	vpaddd	%zmm2, %zmm6, %zmm2
	vpaddd	%zmm3, %zmm4, %zmm3
	vmovdqu64	4352(%rax,%rcx,4), %zmm4
	vmovdqu64	4416(%rax,%rcx,4), %zmm5
	vpmulld	4352(%r11,%rcx,4), %zmm4, %zmm4
	vmovdqu64	4480(%rax,%rcx,4), %zmm6
	vpmulld	4416(%r11,%rcx,4), %zmm5, %zmm5
	vmovdqu64	4544(%rax,%rcx,4), %zmm7
	vpmulld	4480(%r11,%rcx,4), %zmm6, %zmm6
	vpaddd	%zmm0, %zmm4, %zmm0
	vpmulld	4544(%r11,%rcx,4), %zmm7, %zmm4
	vpaddd	%zmm1, %zmm5, %zmm1
	vpaddd	%zmm2, %zmm6, %zmm2
	vpaddd	%zmm3, %zmm4, %zmm3
	subq	$-128, %rcx
	jne	.LBB4_3
# %bb.4:                                # %middle.block
                                        #   in Loop: Header=BB4_2 Depth=2
	vpaddd	%zmm0, %zmm1, %zmm0
	vpaddd	%zmm0, %zmm2, %zmm0
	vpaddd	%zmm0, %zmm3, %zmm0
	vextracti64x4	$1, %zmm0, %ymm1
	vpaddd	%zmm1, %zmm0, %zmm0
	vextracti128	$1, %ymm0, %xmm1
	vpaddd	%xmm1, %xmm0, %xmm0
	vpshufd	$238, %xmm0, %xmm1              # xmm1 = xmm0[2,3,2,3]
	vpaddd	%xmm1, %xmm0, %xmm0
	vpshufd	$85, %xmm0, %xmm1               # xmm1 = xmm0[1,1,1,1]
	vpaddd	%xmm1, %xmm0, %xmm0
	vmovd	%xmm0, (%r9,%r10,4)
	addq	$1, %r10
	cmpq	$1024, %r10                     # imm = 0x400
	jne	.LBB4_2
# %bb.5:                                # %for.inc20
                                        #   in Loop: Header=BB4_1 Depth=1
	addq	$1, %r8
	cmpq	$1024, %r8                      # imm = 0x400
	jne	.LBB4_1
# %bb.6:                                # %for.end22
	retq
.Lfunc_end4:
	.size	matmul_serial, .Lfunc_end4-matmul_serial
	.cfi_endproc
                                        # -- End function
	.globl	check                           # -- Begin function check
	.p2align	4, 0x90
	.type	check,@function
check:                                  # @check
	.cfi_startproc
# %bb.0:                                # %entry
	xorl	%r8d, %r8d
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB5_1:                                # %for.cond1.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_2 Depth 2
	movq	(%rdi,%r8,8), %rdx
	movq	(%rsi,%r8,8), %rcx
	vmovd	%eax, %xmm0
	vpxor	%xmm1, %xmm1, %xmm1
	movq	$-1024, %rax                    # imm = 0xFC00
	vpxor	%xmm2, %xmm2, %xmm2
	vpxor	%xmm3, %xmm3, %xmm3
	.p2align	4, 0x90
.LBB5_2:                                # %vector.body
                                        #   Parent Loop BB5_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vmovdqu64	4096(%rcx,%rax,4), %zmm4
	vmovdqu64	4160(%rcx,%rax,4), %zmm5
	vmovdqu64	4224(%rcx,%rax,4), %zmm6
	vpaddd	4096(%rdx,%rax,4), %zmm0, %zmm0
	vpaddd	4160(%rdx,%rax,4), %zmm1, %zmm1
	vpaddd	4224(%rdx,%rax,4), %zmm2, %zmm2
	vpaddd	4288(%rdx,%rax,4), %zmm3, %zmm3
	vpaddd	4352(%rdx,%rax,4), %zmm0, %zmm0
	vmovdqu64	4288(%rcx,%rax,4), %zmm7
	vpaddd	4352(%rcx,%rax,4), %zmm4, %zmm4
	vpsubd	%zmm4, %zmm0, %zmm0
	vpaddd	4416(%rdx,%rax,4), %zmm1, %zmm1
	vpaddd	4416(%rcx,%rax,4), %zmm5, %zmm4
	vpaddd	4480(%rdx,%rax,4), %zmm2, %zmm2
	vpaddd	4480(%rcx,%rax,4), %zmm6, %zmm5
	vpsubd	%zmm4, %zmm1, %zmm1
	vpsubd	%zmm5, %zmm2, %zmm2
	vpaddd	4544(%rdx,%rax,4), %zmm3, %zmm3
	vpaddd	4544(%rcx,%rax,4), %zmm7, %zmm4
	vpsubd	%zmm4, %zmm3, %zmm3
	subq	$-128, %rax
	jne	.LBB5_2
# %bb.3:                                # %middle.block
                                        #   in Loop: Header=BB5_1 Depth=1
	vpaddd	%zmm0, %zmm1, %zmm0
	vpaddd	%zmm0, %zmm2, %zmm0
	vpaddd	%zmm0, %zmm3, %zmm0
	vextracti64x4	$1, %zmm0, %ymm1
	vpaddd	%zmm1, %zmm0, %zmm0
	vextracti128	$1, %ymm0, %xmm1
	vpaddd	%xmm1, %xmm0, %xmm0
	vpshufd	$238, %xmm0, %xmm1              # xmm1 = xmm0[2,3,2,3]
	vpaddd	%xmm1, %xmm0, %xmm0
	vpshufd	$85, %xmm0, %xmm1               # xmm1 = xmm0[1,1,1,1]
	vpaddd	%xmm1, %xmm0, %xmm0
	vmovd	%xmm0, %eax
	addq	$1, %r8
	cmpq	$1024, %r8                      # imm = 0x400
	jne	.LBB5_1
# %bb.4:                                # %for.cond.cleanup
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
	.quad	0x4224000000000000              # double 42949672960
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
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movl	$8192, %edi                     # imm = 0x2000
	callq	malloc
	movq	%rax, %r12
	movl	$8192, %edi                     # imm = 0x2000
	callq	malloc
	movq	%rax, %r13
	movl	$8192, %edi                     # imm = 0x2000
	callq	malloc
	movq	%rax, %r14
	movl	$8192, %edi                     # imm = 0x2000
	callq	malloc
	movq	%rax, %r15
	movl	$8192, %edi                     # imm = 0x2000
	callq	malloc
	movq	%rax, %rbx
	movq	$-8192, %rbp                    # imm = 0xE000
	.p2align	4, 0x90
.LBB6_1:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movl	$4096, %edi                     # imm = 0x1000
	callq	malloc
	movq	%rax, 8192(%r12,%rbp)
	movl	$4096, %edi                     # imm = 0x1000
	callq	malloc
	movq	%rax, 8192(%r13,%rbp)
	movl	$4096, %edi                     # imm = 0x1000
	callq	malloc
	movq	%rax, 8192(%r14,%rbp)
	movl	$4096, %edi                     # imm = 0x1000
	callq	malloc
	movq	%rax, 8192(%r15,%rbp)
	movl	$4096, %edi                     # imm = 0x1000
	callq	malloc
	movq	%rax, 8192(%rbx,%rbp)
	addq	$8, %rbp
	jne	.LBB6_1
# %bb.2:                                # %for.cond.cleanup
	movq	%r14, 48(%rsp)                  # 8-byte Spill
	xorl	%ebp, %ebp
	xorl	%edi, %edi
	callq	time
	movl	%eax, %edi
	callq	srand
	.p2align	4, 0x90
.LBB6_3:                                # %for.cond1.preheader.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_4 Depth 2
	movq	$-4096, %r14                    # imm = 0xF000
	.p2align	4, 0x90
.LBB6_4:                                # %for.body3.i
                                        #   Parent Loop BB6_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	callq	rand
	cltq
	imulq	$-1610612725, %rax, %rcx        # imm = 0xA000000B
	shrq	$32, %rcx
	addl	%ecx, %eax
	movl	%eax, %ecx
	shrl	$31, %ecx
	sarl	$27, %eax
	addl	%ecx, %eax
	movq	(%r12,%rbp,8), %rcx
	movl	%eax, 4096(%rcx,%r14)
	addq	$4, %r14
	jne	.LBB6_4
# %bb.5:                                # %for.inc6.i
                                        #   in Loop: Header=BB6_3 Depth=1
	addq	$1, %rbp
	cmpq	$1024, %rbp                     # imm = 0x400
	jne	.LBB6_3
# %bb.6:                                # %for.cond1.preheader.i152.preheader
	xorl	%r14d, %r14d
	.p2align	4, 0x90
.LBB6_7:                                # %for.cond1.preheader.i152
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_8 Depth 2
	movq	$-4096, %rbp                    # imm = 0xF000
	.p2align	4, 0x90
.LBB6_8:                                # %for.body3.i159
                                        #   Parent Loop BB6_7 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	callq	rand
	cltq
	imulq	$-1610612725, %rax, %rcx        # imm = 0xA000000B
	shrq	$32, %rcx
	addl	%ecx, %eax
	movl	%eax, %ecx
	shrl	$31, %ecx
	sarl	$27, %eax
	addl	%ecx, %eax
	movq	(%r13,%r14,8), %rcx
	movl	%eax, 4096(%rcx,%rbp)
	addq	$4, %rbp
	jne	.LBB6_8
# %bb.9:                                # %for.inc6.i162
                                        #   in Loop: Header=BB6_7 Depth=1
	addq	$1, %r14
	cmpq	$1024, %r14                     # imm = 0x400
	jne	.LBB6_7
# %bb.10:                               # %for.cond24.preheader.preheader
	xorl	%eax, %eax
	movq	48(%rsp), %r14                  # 8-byte Reload
	.p2align	4, 0x90
.LBB6_11:                               # %for.cond24.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_12 Depth 2
	movq	(%rbx,%rax,8), %rcx
	movq	$-2048, %rdx                    # imm = 0xF800
	.p2align	4, 0x90
.LBB6_12:                               # %for.body28
                                        #   Parent Loop BB6_11 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	8192(%r13,%rdx,4), %rsi
	movl	(%rsi,%rax,4), %esi
	movl	%esi, 4096(%rcx,%rdx,2)
	movq	8200(%r13,%rdx,4), %rsi
	movl	(%rsi,%rax,4), %esi
	movl	%esi, 4100(%rcx,%rdx,2)
	movq	8208(%r13,%rdx,4), %rsi
	movl	(%rsi,%rax,4), %esi
	movl	%esi, 4104(%rcx,%rdx,2)
	movq	8216(%r13,%rdx,4), %rsi
	movl	(%rsi,%rax,4), %esi
	movl	%esi, 4108(%rcx,%rdx,2)
	movq	8224(%r13,%rdx,4), %rsi
	movl	(%rsi,%rax,4), %esi
	movl	%esi, 4112(%rcx,%rdx,2)
	movq	8232(%r13,%rdx,4), %rsi
	movl	(%rsi,%rax,4), %esi
	movl	%esi, 4116(%rcx,%rdx,2)
	movq	8240(%r13,%rdx,4), %rsi
	movl	(%rsi,%rax,4), %esi
	movl	%esi, 4120(%rcx,%rdx,2)
	movq	8248(%r13,%rdx,4), %rsi
	movl	(%rsi,%rax,4), %esi
	movl	%esi, 4124(%rcx,%rdx,2)
	addq	$16, %rdx
	jne	.LBB6_12
# %bb.13:                               # %for.cond.cleanup27
                                        #   in Loop: Header=BB6_11 Depth=1
	addq	$1, %rax
	cmpq	$1024, %rax                     # imm = 0x400
	jne	.LBB6_11
# %bb.14:                               # %for.cond1.preheader.i165.preheader
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB6_15:                               # %for.cond1.preheader.i165
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_16 Depth 2
                                        #       Child Loop BB6_17 Depth 3
	movq	(%r12,%rax,8), %rcx
	movq	(%r14,%rax,8), %rdx
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB6_16:                               # %omp.inner.for.cond.preheader.i
                                        #   Parent Loop BB6_15 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_17 Depth 3
	movq	(%rbx,%rsi,8), %rdi
	vpxor	%xmm0, %xmm0, %xmm0
	movq	$-1024, %rbp                    # imm = 0xFC00
	vpxor	%xmm1, %xmm1, %xmm1
	vpxor	%xmm2, %xmm2, %xmm2
	vpxor	%xmm3, %xmm3, %xmm3
	.p2align	4, 0x90
.LBB6_17:                               # %vector.body
                                        #   Parent Loop BB6_15 Depth=1
                                        #     Parent Loop BB6_16 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	vmovdqu64	4096(%rdi,%rbp,4), %zmm4
	vmovdqu64	4160(%rdi,%rbp,4), %zmm5
	vpmulld	4096(%rcx,%rbp,4), %zmm4, %zmm4
	vmovdqu64	4224(%rdi,%rbp,4), %zmm6
	vpmulld	4160(%rcx,%rbp,4), %zmm5, %zmm5
	vmovdqu64	4288(%rdi,%rbp,4), %zmm7
	vpmulld	4224(%rcx,%rbp,4), %zmm6, %zmm6
	vpaddd	%zmm0, %zmm4, %zmm0
	vpmulld	4288(%rcx,%rbp,4), %zmm7, %zmm4
	vpaddd	%zmm1, %zmm5, %zmm1
	vpaddd	%zmm2, %zmm6, %zmm2
	vpaddd	%zmm3, %zmm4, %zmm3
	vmovdqu64	4352(%rdi,%rbp,4), %zmm4
	vmovdqu64	4416(%rdi,%rbp,4), %zmm5
	vpmulld	4352(%rcx,%rbp,4), %zmm4, %zmm4
	vmovdqu64	4480(%rdi,%rbp,4), %zmm6
	vpmulld	4416(%rcx,%rbp,4), %zmm5, %zmm5
	vmovdqu64	4544(%rdi,%rbp,4), %zmm7
	vpmulld	4480(%rcx,%rbp,4), %zmm6, %zmm6
	vpaddd	%zmm0, %zmm4, %zmm0
	vpmulld	4544(%rcx,%rbp,4), %zmm7, %zmm4
	vpaddd	%zmm1, %zmm5, %zmm1
	vpaddd	%zmm2, %zmm6, %zmm2
	vpaddd	%zmm3, %zmm4, %zmm3
	subq	$-128, %rbp
	jne	.LBB6_17
# %bb.18:                               # %middle.block
                                        #   in Loop: Header=BB6_16 Depth=2
	vpaddd	%zmm0, %zmm1, %zmm0
	vpaddd	%zmm0, %zmm2, %zmm0
	vpaddd	%zmm0, %zmm3, %zmm0
	vextracti64x4	$1, %zmm0, %ymm1
	vpaddd	%zmm1, %zmm0, %zmm0
	vextracti128	$1, %ymm0, %xmm1
	vpaddd	%xmm1, %xmm0, %xmm0
	vpshufd	$238, %xmm0, %xmm1              # xmm1 = xmm0[2,3,2,3]
	vpaddd	%xmm1, %xmm0, %xmm0
	vpshufd	$85, %xmm0, %xmm1               # xmm1 = xmm0[1,1,1,1]
	vpaddd	%xmm1, %xmm0, %xmm0
	vmovd	%xmm0, (%rdx,%rsi,4)
	addq	$1, %rsi
	cmpq	$1024, %rsi                     # imm = 0x400
	jne	.LBB6_16
# %bb.19:                               # %for.inc21.i
                                        #   in Loop: Header=BB6_15 Depth=1
	addq	$1, %rax
	cmpq	$1024, %rax                     # imm = 0x400
	jne	.LBB6_15
# %bb.20:                               # %for.cond1.preheader.i177.preheader
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB6_21:                               # %for.cond1.preheader.i177
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_22 Depth 2
                                        #       Child Loop BB6_23 Depth 3
	movq	(%r12,%rax,8), %rcx
	movq	(%r15,%rax,8), %rdx
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB6_22:                               # %for.cond4.preheader.i
                                        #   Parent Loop BB6_21 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_23 Depth 3
	movq	(%rbx,%rsi,8), %rdi
	vpxor	%xmm0, %xmm0, %xmm0
	movq	$-1024, %rbp                    # imm = 0xFC00
	vpxor	%xmm1, %xmm1, %xmm1
	vpxor	%xmm2, %xmm2, %xmm2
	vpxor	%xmm3, %xmm3, %xmm3
	.p2align	4, 0x90
.LBB6_23:                               # %vector.body287
                                        #   Parent Loop BB6_21 Depth=1
                                        #     Parent Loop BB6_22 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	vmovdqu64	4096(%rdi,%rbp,4), %zmm4
	vmovdqu64	4160(%rdi,%rbp,4), %zmm5
	vpmulld	4096(%rcx,%rbp,4), %zmm4, %zmm4
	vmovdqu64	4224(%rdi,%rbp,4), %zmm6
	vpmulld	4160(%rcx,%rbp,4), %zmm5, %zmm5
	vmovdqu64	4288(%rdi,%rbp,4), %zmm7
	vpmulld	4224(%rcx,%rbp,4), %zmm6, %zmm6
	vpaddd	%zmm0, %zmm4, %zmm0
	vpmulld	4288(%rcx,%rbp,4), %zmm7, %zmm4
	vpaddd	%zmm1, %zmm5, %zmm1
	vpaddd	%zmm2, %zmm6, %zmm2
	vpaddd	%zmm3, %zmm4, %zmm3
	vmovdqu64	4352(%rdi,%rbp,4), %zmm4
	vmovdqu64	4416(%rdi,%rbp,4), %zmm5
	vpmulld	4352(%rcx,%rbp,4), %zmm4, %zmm4
	vmovdqu64	4480(%rdi,%rbp,4), %zmm6
	vpmulld	4416(%rcx,%rbp,4), %zmm5, %zmm5
	vmovdqu64	4544(%rdi,%rbp,4), %zmm7
	vpmulld	4480(%rcx,%rbp,4), %zmm6, %zmm6
	vpaddd	%zmm0, %zmm4, %zmm0
	vpmulld	4544(%rcx,%rbp,4), %zmm7, %zmm4
	vpaddd	%zmm1, %zmm5, %zmm1
	vpaddd	%zmm2, %zmm6, %zmm2
	vpaddd	%zmm3, %zmm4, %zmm3
	subq	$-128, %rbp
	jne	.LBB6_23
# %bb.24:                               # %middle.block285
                                        #   in Loop: Header=BB6_22 Depth=2
	vpaddd	%zmm0, %zmm1, %zmm0
	vpaddd	%zmm0, %zmm2, %zmm0
	vpaddd	%zmm0, %zmm3, %zmm0
	vextracti64x4	$1, %zmm0, %ymm1
	vpaddd	%zmm1, %zmm0, %zmm0
	vextracti128	$1, %ymm0, %xmm1
	vpaddd	%xmm1, %xmm0, %xmm0
	vpshufd	$238, %xmm0, %xmm1              # xmm1 = xmm0[2,3,2,3]
	vpaddd	%xmm1, %xmm0, %xmm0
	vpshufd	$85, %xmm0, %xmm1               # xmm1 = xmm0[1,1,1,1]
	vpaddd	%xmm1, %xmm0, %xmm0
	vmovd	%xmm0, (%rdx,%rsi,4)
	addq	$1, %rsi
	cmpq	$1024, %rsi                     # imm = 0x400
	jne	.LBB6_22
# %bb.25:                               # %for.inc20.i
                                        #   in Loop: Header=BB6_21 Depth=1
	addq	$1, %rax
	cmpq	$1024, %rax                     # imm = 0x400
	jne	.LBB6_21
# %bb.26:                               # %matmul_serial.exit
	leaq	8(%rsp), %rdi
	callq	ftime
	movq	8(%rsp), %r8
	movzwl	16(%rsp), %eax
	vcvtsi2sd	%eax, %xmm8, %xmm0
	vdivsd	.LCPI6_0(%rip), %xmm0, %xmm0
	xorl	%r9d, %r9d
	.p2align	4, 0x90
.LBB6_27:                               # %for.cond1.preheader.i191.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_28 Depth 2
                                        #       Child Loop BB6_29 Depth 3
                                        #         Child Loop BB6_30 Depth 4
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB6_28:                               # %for.cond1.preheader.i191
                                        #   Parent Loop BB6_27 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_29 Depth 3
                                        #         Child Loop BB6_30 Depth 4
	movq	(%r12,%rdx,8), %rsi
	movq	(%r14,%rdx,8), %rdi
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB6_29:                               # %omp.inner.for.cond.preheader.i194
                                        #   Parent Loop BB6_27 Depth=1
                                        #     Parent Loop BB6_28 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB6_30 Depth 4
	movq	(%rbx,%rax,8), %rbp
	vpxor	%xmm1, %xmm1, %xmm1
	movq	$-1024, %rcx                    # imm = 0xFC00
	vpxor	%xmm2, %xmm2, %xmm2
	vpxor	%xmm3, %xmm3, %xmm3
	vpxor	%xmm4, %xmm4, %xmm4
	.p2align	4, 0x90
.LBB6_30:                               # %vector.body311
                                        #   Parent Loop BB6_27 Depth=1
                                        #     Parent Loop BB6_28 Depth=2
                                        #       Parent Loop BB6_29 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	vmovdqu64	4096(%rbp,%rcx,4), %zmm5
	vmovdqu64	4160(%rbp,%rcx,4), %zmm6
	vpmulld	4096(%rsi,%rcx,4), %zmm5, %zmm5
	vmovdqu64	4224(%rbp,%rcx,4), %zmm7
	vpmulld	4160(%rsi,%rcx,4), %zmm6, %zmm6
	vmovdqu64	4288(%rbp,%rcx,4), %zmm8
	vpmulld	4224(%rsi,%rcx,4), %zmm7, %zmm7
	vpaddd	%zmm1, %zmm5, %zmm1
	vpmulld	4288(%rsi,%rcx,4), %zmm8, %zmm5
	vpaddd	%zmm2, %zmm6, %zmm2
	vpaddd	%zmm3, %zmm7, %zmm3
	vpaddd	%zmm4, %zmm5, %zmm4
	vmovdqu64	4352(%rbp,%rcx,4), %zmm5
	vmovdqu64	4416(%rbp,%rcx,4), %zmm6
	vpmulld	4352(%rsi,%rcx,4), %zmm5, %zmm5
	vmovdqu64	4480(%rbp,%rcx,4), %zmm7
	vpmulld	4416(%rsi,%rcx,4), %zmm6, %zmm6
	vmovdqu64	4544(%rbp,%rcx,4), %zmm8
	vpmulld	4480(%rsi,%rcx,4), %zmm7, %zmm7
	vpaddd	%zmm1, %zmm5, %zmm1
	vpmulld	4544(%rsi,%rcx,4), %zmm8, %zmm5
	vpaddd	%zmm2, %zmm6, %zmm2
	vpaddd	%zmm3, %zmm7, %zmm3
	vpaddd	%zmm4, %zmm5, %zmm4
	subq	$-128, %rcx
	jne	.LBB6_30
# %bb.31:                               # %middle.block309
                                        #   in Loop: Header=BB6_29 Depth=3
	vpaddd	%zmm1, %zmm2, %zmm1
	vpaddd	%zmm1, %zmm3, %zmm1
	vpaddd	%zmm1, %zmm4, %zmm1
	vextracti64x4	$1, %zmm1, %ymm2
	vpaddd	%zmm2, %zmm1, %zmm1
	vextracti128	$1, %ymm1, %xmm2
	vpaddd	%xmm2, %xmm1, %xmm1
	vpshufd	$238, %xmm1, %xmm2              # xmm2 = xmm1[2,3,2,3]
	vpaddd	%xmm2, %xmm1, %xmm1
	vpshufd	$85, %xmm1, %xmm2               # xmm2 = xmm1[1,1,1,1]
	vpaddd	%xmm2, %xmm1, %xmm1
	vmovd	%xmm1, (%rdi,%rax,4)
	addq	$1, %rax
	cmpq	$1024, %rax                     # imm = 0x400
	jne	.LBB6_29
# %bb.32:                               # %for.inc21.i210
                                        #   in Loop: Header=BB6_28 Depth=2
	addq	$1, %rdx
	cmpq	$1024, %rdx                     # imm = 0x400
	jne	.LBB6_28
# %bb.33:                               # %matmul_simd.exit211
                                        #   in Loop: Header=BB6_27 Depth=1
	addl	$1, %r9d
	cmpl	$20, %r9d
	jne	.LBB6_27
# %bb.34:                               # %for.end51
	vcvtsi2sd	%r8, %xmm9, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, (%rsp)                   # 8-byte Spill
	leaq	8(%rsp), %rdi
	callq	ftime
	vcvtsi2sdq	8(%rsp), %xmm9, %xmm0
	movzwl	16(%rsp), %eax
	vcvtsi2sd	%eax, %xmm9, %xmm1
	vdivsd	.LCPI6_0(%rip), %xmm1, %xmm1
	vaddsd	%xmm0, %xmm1, %xmm0
	vsubsd	(%rsp), %xmm0, %xmm0            # 8-byte Folded Reload
	vmovsd	%xmm0, (%rsp)                   # 8-byte Spill
	leaq	8(%rsp), %rdi
	callq	ftime
	movq	8(%rsp), %r8
	movzwl	16(%rsp), %eax
	vcvtsi2sd	%eax, %xmm9, %xmm0
	vdivsd	.LCPI6_0(%rip), %xmm0, %xmm0
	xorl	%r9d, %r9d
	.p2align	4, 0x90
.LBB6_35:                               # %for.cond1.preheader.i231.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_36 Depth 2
                                        #       Child Loop BB6_37 Depth 3
                                        #         Child Loop BB6_38 Depth 4
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB6_36:                               # %for.cond1.preheader.i231
                                        #   Parent Loop BB6_35 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_37 Depth 3
                                        #         Child Loop BB6_38 Depth 4
	movq	(%r12,%rdx,8), %rsi
	movq	(%r15,%rdx,8), %rdi
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB6_37:                               # %for.cond4.preheader.i234
                                        #   Parent Loop BB6_35 Depth=1
                                        #     Parent Loop BB6_36 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB6_38 Depth 4
	movq	(%rbx,%rax,8), %rbp
	vxorpd	%xmm1, %xmm1, %xmm1
	movq	$-1024, %rcx                    # imm = 0xFC00
	vpxor	%xmm2, %xmm2, %xmm2
	vpxor	%xmm3, %xmm3, %xmm3
	vpxor	%xmm4, %xmm4, %xmm4
	.p2align	4, 0x90
.LBB6_38:                               # %vector.body335
                                        #   Parent Loop BB6_35 Depth=1
                                        #     Parent Loop BB6_36 Depth=2
                                        #       Parent Loop BB6_37 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	vmovdqu64	4096(%rbp,%rcx,4), %zmm5
	vmovdqu64	4160(%rbp,%rcx,4), %zmm6
	vpmulld	4096(%rsi,%rcx,4), %zmm5, %zmm5
	vmovdqu64	4224(%rbp,%rcx,4), %zmm7
	vpmulld	4160(%rsi,%rcx,4), %zmm6, %zmm6
	vmovdqu64	4288(%rbp,%rcx,4), %zmm8
	vpmulld	4224(%rsi,%rcx,4), %zmm7, %zmm7
	vpaddd	%zmm1, %zmm5, %zmm1
	vpmulld	4288(%rsi,%rcx,4), %zmm8, %zmm5
	vpaddd	%zmm2, %zmm6, %zmm2
	vpaddd	%zmm3, %zmm7, %zmm3
	vpaddd	%zmm4, %zmm5, %zmm4
	vmovdqu64	4352(%rbp,%rcx,4), %zmm5
	vmovdqu64	4416(%rbp,%rcx,4), %zmm6
	vpmulld	4352(%rsi,%rcx,4), %zmm5, %zmm5
	vmovdqu64	4480(%rbp,%rcx,4), %zmm7
	vpmulld	4416(%rsi,%rcx,4), %zmm6, %zmm6
	vmovdqu64	4544(%rbp,%rcx,4), %zmm8
	vpmulld	4480(%rsi,%rcx,4), %zmm7, %zmm7
	vpaddd	%zmm1, %zmm5, %zmm1
	vpmulld	4544(%rsi,%rcx,4), %zmm8, %zmm5
	vpaddd	%zmm2, %zmm6, %zmm2
	vpaddd	%zmm3, %zmm7, %zmm3
	vpaddd	%zmm4, %zmm5, %zmm4
	subq	$-128, %rcx
	jne	.LBB6_38
# %bb.39:                               # %middle.block333
                                        #   in Loop: Header=BB6_37 Depth=3
	vpaddd	%zmm1, %zmm2, %zmm1
	vpaddd	%zmm1, %zmm3, %zmm1
	vpaddd	%zmm1, %zmm4, %zmm1
	vextracti64x4	$1, %zmm1, %ymm2
	vpaddd	%zmm2, %zmm1, %zmm1
	vextracti128	$1, %ymm1, %xmm2
	vpaddd	%xmm2, %xmm1, %xmm1
	vpshufd	$238, %xmm1, %xmm2              # xmm2 = xmm1[2,3,2,3]
	vpaddd	%xmm2, %xmm1, %xmm1
	vpshufd	$85, %xmm1, %xmm2               # xmm2 = xmm1[1,1,1,1]
	vpaddd	%xmm2, %xmm1, %xmm1
	vmovd	%xmm1, (%rdi,%rax,4)
	addq	$1, %rax
	cmpq	$1024, %rax                     # imm = 0x400
	jne	.LBB6_37
# %bb.40:                               # %for.inc20.i250
                                        #   in Loop: Header=BB6_36 Depth=2
	addq	$1, %rdx
	cmpq	$1024, %rdx                     # imm = 0x400
	jne	.LBB6_36
# %bb.41:                               # %matmul_serial.exit251
                                        #   in Loop: Header=BB6_35 Depth=1
	addl	$1, %r9d
	cmpl	$20, %r9d
	jne	.LBB6_35
# %bb.42:                               # %for.end60
	vxorpd	%xmm1, %xmm1, %xmm1
	vaddsd	(%rsp), %xmm1, %xmm1            # 8-byte Folded Reload
	vmovsd	%xmm1, (%rsp)                   # 8-byte Spill
	vcvtsi2sd	%r8, %xmm9, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, 24(%rsp)                 # 8-byte Spill
	leaq	8(%rsp), %rdi
	callq	ftime
	vcvtsi2sdq	8(%rsp), %xmm9, %xmm0
	movzwl	16(%rsp), %eax
	vcvtsi2sd	%eax, %xmm9, %xmm1
	vdivsd	.LCPI6_0(%rip), %xmm1, %xmm1
	vaddsd	%xmm0, %xmm1, %xmm0
	vsubsd	24(%rsp), %xmm0, %xmm0          # 8-byte Folded Reload
	vaddsd	.LCPI6_4, %xmm0, %xmm0
	vmovsd	%xmm0, 24(%rsp)                 # 8-byte Spill
	movq	%r12, %rdi
	callq	print_matrix
	movq	%rbx, %rdi
	callq	print_matrix
	movl	$.L.str.4, %edi
	callq	puts
	movq	%r14, %rdi
	callq	print_matrix
	movl	$.L.str.5, %edi
	callq	puts
	movq	%r15, %rdi
	callq	print_matrix
	vmovsd	.LCPI6_1(%rip), %xmm0           # xmm0 = mem[0],zero
	vmulsd	(%rsp), %xmm0, %xmm1            # 8-byte Folded Reload
	vmovsd	.LCPI6_2(%rip), %xmm2           # xmm2 = mem[0],zero
	vdivsd	%xmm1, %xmm2, %xmm1
	vmovsd	%xmm1, 32(%rsp)                 # 8-byte Spill
	vmulsd	24(%rsp), %xmm0, %xmm0          # 8-byte Folded Reload
	vdivsd	%xmm0, %xmm2, %xmm0
	vmovsd	%xmm0, 40(%rsp)                 # 8-byte Spill
	movl	$.Lstr, %edi
	callq	puts
	xorl	%ebx, %ebx
	movl	$.L.str.7, %edi
	movl	$1024, %esi                     # imm = 0x400
	xorl	%eax, %eax
	callq	printf
	movl	$.Lstr.15, %edi
	callq	puts
	movl	$.Lstr.14, %edi
	callq	puts
	movl	$.Lstr.15, %edi
	callq	puts
	vmovsd	(%rsp), %xmm0                   # 8-byte Reload
                                        # xmm0 = mem[0],zero
	vdivsd	.LCPI6_3(%rip), %xmm0, %xmm0
	movl	$.L.str.10, %edi
	vmovsd	32(%rsp), %xmm1                 # 8-byte Reload
                                        # xmm1 = mem[0],zero
	movb	$2, %al
	callq	printf
	vmovsd	24(%rsp), %xmm0                 # 8-byte Reload
                                        # xmm0 = mem[0],zero
	vdivsd	.LCPI6_3(%rip), %xmm0, %xmm0
	movl	$.L.str.11, %edi
	vmovq	40(%rsp), %xmm1                 # 8-byte Folded Reload
                                        # xmm1 = mem[0],zero
	movb	$2, %al
	callq	printf
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB6_43:                               # %for.cond1.preheader.i171
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_44 Depth 2
	movq	(%r14,%rbx,8), %rax
	movq	(%r15,%rbx,8), %rcx
	vmovd	%esi, %xmm0
	vpxor	%xmm1, %xmm1, %xmm1
	movq	$-1024, %rdx                    # imm = 0xFC00
	vxorpd	%xmm2, %xmm2, %xmm2
	vpxor	%xmm3, %xmm3, %xmm3
	.p2align	4, 0x90
.LBB6_44:                               # %vector.body359
                                        #   Parent Loop BB6_43 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vmovdqu64	4096(%rcx,%rdx,4), %zmm4
	vmovdqu64	4160(%rcx,%rdx,4), %zmm5
	vmovdqu64	4224(%rcx,%rdx,4), %zmm6
	vpaddd	4096(%rax,%rdx,4), %zmm0, %zmm0
	vpaddd	4160(%rax,%rdx,4), %zmm1, %zmm1
	vpaddd	4224(%rax,%rdx,4), %zmm2, %zmm2
	vpaddd	4288(%rax,%rdx,4), %zmm3, %zmm3
	vpaddd	4352(%rax,%rdx,4), %zmm0, %zmm0
	vmovdqu64	4288(%rcx,%rdx,4), %zmm7
	vpaddd	4352(%rcx,%rdx,4), %zmm4, %zmm4
	vpsubd	%zmm4, %zmm0, %zmm0
	vpaddd	4416(%rax,%rdx,4), %zmm1, %zmm1
	vpaddd	4416(%rcx,%rdx,4), %zmm5, %zmm4
	vpaddd	4480(%rax,%rdx,4), %zmm2, %zmm2
	vpaddd	4480(%rcx,%rdx,4), %zmm6, %zmm5
	vpsubd	%zmm4, %zmm1, %zmm1
	vpsubd	%zmm5, %zmm2, %zmm2
	vpaddd	4544(%rax,%rdx,4), %zmm3, %zmm3
	vpaddd	4544(%rcx,%rdx,4), %zmm7, %zmm4
	vpsubd	%zmm4, %zmm3, %zmm3
	subq	$-128, %rdx
	jne	.LBB6_44
# %bb.45:                               # %middle.block357
                                        #   in Loop: Header=BB6_43 Depth=1
	vpaddd	%zmm0, %zmm1, %zmm0
	vpaddd	%zmm0, %zmm2, %zmm0
	vpaddd	%zmm0, %zmm3, %zmm0
	vextracti64x4	$1, %zmm0, %ymm1
	vpaddd	%zmm1, %zmm0, %zmm0
	vextracti128	$1, %ymm0, %xmm1
	vpaddd	%xmm1, %xmm0, %xmm0
	vpshufd	$238, %xmm0, %xmm1              # xmm1 = xmm0[2,3,2,3]
	vpaddd	%xmm1, %xmm0, %xmm0
	vpshufd	$85, %xmm0, %xmm1               # xmm1 = xmm0[1,1,1,1]
	vpaddd	%xmm1, %xmm0, %xmm0
	vmovd	%xmm0, %esi
	addq	$1, %rbx
	cmpq	$1024, %rbx                     # imm = 0x400
	jne	.LBB6_43
# %bb.46:                               # %check.exit
	movl	$.L.str.12, %edi
	xorl	%eax, %eax
	callq	printf
	xorl	%eax, %eax
	addq	$56, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
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

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"=\n"
	.size	.L.str.4, 3

	.type	.L.str.5,@object                # @.str.5
.L.str.5:
	.asciz	"---------------------------------"
	.size	.L.str.5, 34

	.type	.L.str.7,@object                # @.str.7
.L.str.7:
	.asciz	"\tMatrix Multiplication: A[N][N] * B[N][N] = C[N][N], N=%d\n"
	.size	.L.str.7, 59

	.type	.L.str.10,@object               # @.str.10
.L.str.10:
	.asciz	"matmul_omp:\t\t%4f\t%4f\n"
	.size	.L.str.10, 22

	.type	.L.str.11,@object               # @.str.11
.L.str.11:
	.asciz	"matmul_serial:\t\t%4f\t%4f\n"
	.size	.L.str.11, 25

	.type	.L.str.12,@object               # @.str.12
.L.str.12:
	.asciz	"Correctness check: %d\n"
	.size	.L.str.12, 23

	.type	.Lstr,@object                   # @str
.Lstr:
	.asciz	"======================================================================================================"
	.size	.Lstr, 103

	.type	.Lstr.14,@object                # @str.14
.Lstr.14:
	.asciz	"Performance:\t\tRuntime (s)\t GFLOPS"
	.size	.Lstr.14, 34

	.type	.Lstr.15,@object                # @str.15
.Lstr.15:
	.asciz	"------------------------------------------------------------------------------------------------------"
	.size	.Lstr.15, 103

	.ident	"clang version 12.0.1 (https://github.com/llvm/llvm-project fed41342a82f5a3a9201819a82bf7a48313e296b)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
