	.text
	.file	"matmul_double.c"
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
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3                               # -- Begin function init
.LCPI1_0:
	.quad	0x41a9999999666666              # double 214748364.69999999
	.text
	.globl	init
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
	movq	$-8192, %rbx                    # imm = 0xE000
	.p2align	4, 0x90
.LBB1_2:                                # %for.body3
                                        #   Parent Loop BB1_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	callq	rand
	vmovsd	.LCPI1_0(%rip), %xmm1           # xmm1 = mem[0],zero
	vcvtsi2sd	%eax, %xmm2, %xmm0
	vdivsd	%xmm1, %xmm0, %xmm0
	movq	(%r14,%r15,8), %rax
	vmovsd	%xmm0, 8192(%rax,%rbx)
	addq	$8, %rbx
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
	vxorpd	%xmm0, %xmm0, %xmm0
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
	vxorpd	%xmm1, %xmm1, %xmm1
	movq	$-1024, %rcx                    # imm = 0xFC00
	vxorpd	%xmm2, %xmm2, %xmm2
	vxorpd	%xmm3, %xmm3, %xmm3
	vxorpd	%xmm4, %xmm4, %xmm4
	.p2align	4, 0x90
.LBB2_3:                                # %vector.body
                                        #   Parent Loop BB2_1 Depth=1
                                        #     Parent Loop BB2_2 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	vmovupd	8192(%r11,%rcx,8), %zmm5
	vmovupd	8256(%r11,%rcx,8), %zmm6
	vmovupd	8320(%r11,%rcx,8), %zmm7
	vmulpd	8192(%rax,%rcx,8), %zmm5, %zmm5
	vmovupd	8384(%r11,%rcx,8), %zmm8
	vaddpd	%zmm5, %zmm1, %zmm1
	vmulpd	8256(%rax,%rcx,8), %zmm6, %zmm5
	vaddpd	%zmm5, %zmm2, %zmm2
	vmulpd	8320(%rax,%rcx,8), %zmm7, %zmm5
	vaddpd	%zmm5, %zmm3, %zmm3
	vmulpd	8384(%rax,%rcx,8), %zmm8, %zmm5
	vaddpd	%zmm5, %zmm4, %zmm4
	vmovupd	8448(%r11,%rcx,8), %zmm5
	vmovupd	8512(%r11,%rcx,8), %zmm6
	vmovupd	8576(%r11,%rcx,8), %zmm7
	vmulpd	8448(%rax,%rcx,8), %zmm5, %zmm5
	vmovupd	8640(%r11,%rcx,8), %zmm8
	vaddpd	%zmm5, %zmm1, %zmm1
	vmulpd	8512(%rax,%rcx,8), %zmm6, %zmm5
	vaddpd	%zmm5, %zmm2, %zmm2
	vmulpd	8576(%rax,%rcx,8), %zmm7, %zmm5
	vaddpd	%zmm5, %zmm3, %zmm3
	vmulpd	8640(%rax,%rcx,8), %zmm8, %zmm5
	vaddpd	%zmm5, %zmm4, %zmm4
	addq	$64, %rcx
	jne	.LBB2_3
# %bb.4:                                # %middle.block
                                        #   in Loop: Header=BB2_2 Depth=2
	vaddpd	%zmm1, %zmm2, %zmm1
	vaddpd	%zmm1, %zmm3, %zmm1
	vaddpd	%zmm1, %zmm4, %zmm1
	vpermilpd	$1, %xmm1, %xmm2        # xmm2 = xmm1[1,0]
	vaddsd	%xmm2, %xmm1, %xmm2
	vextractf128	$1, %ymm1, %xmm3
	vaddsd	%xmm3, %xmm2, %xmm2
	vpermilpd	$1, %xmm3, %xmm3        # xmm3 = xmm3[1,0]
	vaddsd	%xmm3, %xmm2, %xmm2
	vextractf32x4	$2, %zmm1, %xmm3
	vaddsd	%xmm3, %xmm2, %xmm2
	vpermilpd	$1, %xmm3, %xmm3        # xmm3 = xmm3[1,0]
	vaddsd	%xmm3, %xmm2, %xmm2
	vextractf32x4	$3, %zmm1, %xmm1
	vaddsd	%xmm1, %xmm2, %xmm2
	vpermilpd	$1, %xmm1, %xmm1        # xmm1 = xmm1[1,0]
	vaddsd	%xmm1, %xmm2, %xmm1
	vaddsd	%xmm0, %xmm1, %xmm1
	vmovsd	%xmm1, (%r9,%r10,8)
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
	vmovsd	(%rax), %xmm0                   # xmm0 = mem[0],zero
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf
	movq	64(%r14,%rbx), %rax
	vmovsd	8(%rax), %xmm0                  # xmm0 = mem[0],zero
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf
	movq	64(%r14,%rbx), %rax
	vmovsd	16(%rax), %xmm0                 # xmm0 = mem[0],zero
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf
	movq	64(%r14,%rbx), %rax
	vmovsd	24(%rax), %xmm0                 # xmm0 = mem[0],zero
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf
	movq	64(%r14,%rbx), %rax
	vmovsd	32(%rax), %xmm0                 # xmm0 = mem[0],zero
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf
	movq	64(%r14,%rbx), %rax
	vmovsd	40(%rax), %xmm0                 # xmm0 = mem[0],zero
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf
	movq	64(%r14,%rbx), %rax
	vmovsd	48(%rax), %xmm0                 # xmm0 = mem[0],zero
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf
	movq	64(%r14,%rbx), %rax
	vmovsd	56(%rax), %xmm0                 # xmm0 = mem[0],zero
	movl	$.L.str.1, %edi
	movb	$1, %al
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
	vxorpd	%xmm0, %xmm0, %xmm0
	movq	$-1024, %rcx                    # imm = 0xFC00
	.p2align	4, 0x90
.LBB4_3:                                # %for.body6
                                        #   Parent Loop BB4_1 Depth=1
                                        #     Parent Loop BB4_2 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	vmovsd	8192(%r11,%rcx,8), %xmm1        # xmm1 = mem[0],zero
	vmovsd	8200(%r11,%rcx,8), %xmm2        # xmm2 = mem[0],zero
	vmulsd	8192(%rax,%rcx,8), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmulsd	8200(%rax,%rcx,8), %xmm2, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	8208(%r11,%rcx,8), %xmm1        # xmm1 = mem[0],zero
	vmulsd	8208(%rax,%rcx,8), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	8216(%r11,%rcx,8), %xmm1        # xmm1 = mem[0],zero
	vmulsd	8216(%rax,%rcx,8), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	8224(%r11,%rcx,8), %xmm1        # xmm1 = mem[0],zero
	vmulsd	8224(%rax,%rcx,8), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	8232(%r11,%rcx,8), %xmm1        # xmm1 = mem[0],zero
	vmulsd	8232(%rax,%rcx,8), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	8240(%r11,%rcx,8), %xmm1        # xmm1 = mem[0],zero
	vmulsd	8240(%rax,%rcx,8), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	8248(%r11,%rcx,8), %xmm1        # xmm1 = mem[0],zero
	vmulsd	8248(%rax,%rcx,8), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	addq	$8, %rcx
	jne	.LBB4_3
# %bb.4:                                # %for.end
                                        #   in Loop: Header=BB4_2 Depth=2
	vmovsd	%xmm0, (%r9,%r10,8)
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
	vxorpd	%xmm0, %xmm0, %xmm0
	xorl	%r8d, %r8d
	.p2align	4, 0x90
.LBB5_1:                                # %for.cond1.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_2 Depth 2
	movq	(%rdi,%r8,8), %rcx
	movq	(%rsi,%r8,8), %rdx
	movq	$-1024, %rax                    # imm = 0xFC00
	.p2align	4, 0x90
.LBB5_2:                                # %for.body4
                                        #   Parent Loop BB5_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vmovsd	8192(%rcx,%rax,8), %xmm1        # xmm1 = mem[0],zero
	vmovsd	8200(%rcx,%rax,8), %xmm2        # xmm2 = mem[0],zero
	vsubsd	8192(%rdx,%rax,8), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vsubsd	8200(%rdx,%rax,8), %xmm2, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	8208(%rcx,%rax,8), %xmm1        # xmm1 = mem[0],zero
	vsubsd	8208(%rdx,%rax,8), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	8216(%rcx,%rax,8), %xmm1        # xmm1 = mem[0],zero
	vsubsd	8216(%rdx,%rax,8), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	8224(%rcx,%rax,8), %xmm1        # xmm1 = mem[0],zero
	vsubsd	8224(%rdx,%rax,8), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	8232(%rcx,%rax,8), %xmm1        # xmm1 = mem[0],zero
	vsubsd	8232(%rdx,%rax,8), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	8240(%rcx,%rax,8), %xmm1        # xmm1 = mem[0],zero
	vsubsd	8240(%rdx,%rax,8), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	8248(%rcx,%rax,8), %xmm1        # xmm1 = mem[0],zero
	vsubsd	8248(%rdx,%rax,8), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	addq	$8, %rax
	jne	.LBB5_2
# %bb.3:                                # %for.cond.cleanup3
                                        #   in Loop: Header=BB5_1 Depth=1
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
	.quad	0x41a9999999666666              # double 214748364.69999999
.LCPI6_1:
	.quad	0x408f400000000000              # double 1000
.LCPI6_2:
	.quad	0x41cdcd6500000000              # double 1.0E+9
.LCPI6_3:
	.quad	0x4224000000000000              # double 42949672960
.LCPI6_4:
	.quad	0x4034000000000000              # double 20
.LCPI6_5:
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
	movl	$8192, %edi                     # imm = 0x2000
	callq	malloc
	movq	%rax, 8192(%r12,%rbp)
	movl	$8192, %edi                     # imm = 0x2000
	callq	malloc
	movq	%rax, 8192(%r13,%rbp)
	movl	$8192, %edi                     # imm = 0x2000
	callq	malloc
	movq	%rax, 8192(%r14,%rbp)
	movl	$8192, %edi                     # imm = 0x2000
	callq	malloc
	movq	%rax, 8192(%r15,%rbp)
	movl	$8192, %edi                     # imm = 0x2000
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
	movq	$-8192, %r14                    # imm = 0xE000
	.p2align	4, 0x90
.LBB6_4:                                # %for.body3.i
                                        #   Parent Loop BB6_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	callq	rand
	vmovsd	.LCPI6_0(%rip), %xmm1           # xmm1 = mem[0],zero
	vcvtsi2sd	%eax, %xmm2, %xmm0
	vdivsd	%xmm1, %xmm0, %xmm0
	movq	(%r12,%rbp,8), %rax
	vmovsd	%xmm0, 8192(%rax,%r14)
	addq	$8, %r14
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
	movq	$-8192, %rbp                    # imm = 0xE000
	.p2align	4, 0x90
.LBB6_8:                                # %for.body3.i160
                                        #   Parent Loop BB6_7 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	callq	rand
	vcvtsi2sd	%eax, %xmm2, %xmm0
	vdivsd	.LCPI6_0(%rip), %xmm0, %xmm0
	movq	(%r13,%r14,8), %rax
	vmovsd	%xmm0, 8192(%rax,%rbp)
	addq	$8, %rbp
	jne	.LBB6_8
# %bb.9:                                # %for.inc6.i163
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
	movq	$-1024, %rdx                    # imm = 0xFC00
	.p2align	4, 0x90
.LBB6_12:                               # %for.body28
                                        #   Parent Loop BB6_11 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	8192(%r13,%rdx,8), %rsi
	vmovsd	(%rsi,%rax,8), %xmm0            # xmm0 = mem[0],zero
	vmovsd	%xmm0, 8192(%rcx,%rdx,8)
	movq	8200(%r13,%rdx,8), %rsi
	vmovsd	(%rsi,%rax,8), %xmm0            # xmm0 = mem[0],zero
	vmovsd	%xmm0, 8200(%rcx,%rdx,8)
	movq	8208(%r13,%rdx,8), %rsi
	vmovsd	(%rsi,%rax,8), %xmm0            # xmm0 = mem[0],zero
	vmovsd	%xmm0, 8208(%rcx,%rdx,8)
	movq	8216(%r13,%rdx,8), %rsi
	vmovsd	(%rsi,%rax,8), %xmm0            # xmm0 = mem[0],zero
	vmovsd	%xmm0, 8216(%rcx,%rdx,8)
	movq	8224(%r13,%rdx,8), %rsi
	vmovsd	(%rsi,%rax,8), %xmm0            # xmm0 = mem[0],zero
	vmovsd	%xmm0, 8224(%rcx,%rdx,8)
	movq	8232(%r13,%rdx,8), %rsi
	vmovsd	(%rsi,%rax,8), %xmm0            # xmm0 = mem[0],zero
	vmovsd	%xmm0, 8232(%rcx,%rdx,8)
	movq	8240(%r13,%rdx,8), %rsi
	vmovsd	(%rsi,%rax,8), %xmm0            # xmm0 = mem[0],zero
	vmovsd	%xmm0, 8240(%rcx,%rdx,8)
	movq	8248(%r13,%rdx,8), %rsi
	vmovsd	(%rsi,%rax,8), %xmm0            # xmm0 = mem[0],zero
	vmovsd	%xmm0, 8248(%rcx,%rdx,8)
	addq	$8, %rdx
	jne	.LBB6_12
# %bb.13:                               # %for.cond.cleanup27
                                        #   in Loop: Header=BB6_11 Depth=1
	addq	$1, %rax
	cmpq	$1024, %rax                     # imm = 0x400
	jne	.LBB6_11
# %bb.14:                               # %for.cond1.preheader.i166.preheader
	xorl	%r8d, %r8d
	vxorpd	%xmm0, %xmm0, %xmm0
	.p2align	4, 0x90
.LBB6_15:                               # %for.cond1.preheader.i166
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_16 Depth 2
                                        #       Child Loop BB6_17 Depth 3
	movq	(%r12,%r8,8), %rcx
	movq	(%r14,%r8,8), %rdx
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB6_16:                               # %omp.inner.for.cond.preheader.i
                                        #   Parent Loop BB6_15 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_17 Depth 3
	movq	(%rbx,%rsi,8), %rdi
	vxorpd	%xmm1, %xmm1, %xmm1
	movq	$-1024, %rax                    # imm = 0xFC00
	vxorpd	%xmm2, %xmm2, %xmm2
	vxorpd	%xmm3, %xmm3, %xmm3
	vxorpd	%xmm4, %xmm4, %xmm4
	.p2align	4, 0x90
.LBB6_17:                               # %vector.body
                                        #   Parent Loop BB6_15 Depth=1
                                        #     Parent Loop BB6_16 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	vmovupd	8192(%rcx,%rax,8), %zmm5
	vmovupd	8256(%rcx,%rax,8), %zmm6
	vmovupd	8320(%rcx,%rax,8), %zmm7
	vmulpd	8192(%rdi,%rax,8), %zmm5, %zmm5
	vmovupd	8384(%rcx,%rax,8), %zmm8
	vaddpd	%zmm5, %zmm1, %zmm1
	vmulpd	8256(%rdi,%rax,8), %zmm6, %zmm5
	vaddpd	%zmm5, %zmm2, %zmm2
	vmulpd	8320(%rdi,%rax,8), %zmm7, %zmm5
	vaddpd	%zmm5, %zmm3, %zmm3
	vmulpd	8384(%rdi,%rax,8), %zmm8, %zmm5
	vaddpd	%zmm5, %zmm4, %zmm4
	vmovupd	8448(%rcx,%rax,8), %zmm5
	vmovupd	8512(%rcx,%rax,8), %zmm6
	vmovupd	8576(%rcx,%rax,8), %zmm7
	vmulpd	8448(%rdi,%rax,8), %zmm5, %zmm5
	vmovupd	8640(%rcx,%rax,8), %zmm8
	vaddpd	%zmm5, %zmm1, %zmm1
	vmulpd	8512(%rdi,%rax,8), %zmm6, %zmm5
	vaddpd	%zmm5, %zmm2, %zmm2
	vmulpd	8576(%rdi,%rax,8), %zmm7, %zmm5
	vaddpd	%zmm5, %zmm3, %zmm3
	vmulpd	8640(%rdi,%rax,8), %zmm8, %zmm5
	vaddpd	%zmm5, %zmm4, %zmm4
	addq	$64, %rax
	jne	.LBB6_17
# %bb.18:                               # %middle.block
                                        #   in Loop: Header=BB6_16 Depth=2
	vaddpd	%zmm1, %zmm2, %zmm1
	vaddpd	%zmm1, %zmm3, %zmm1
	vaddpd	%zmm1, %zmm4, %zmm1
	vpermilpd	$1, %xmm1, %xmm2        # xmm2 = xmm1[1,0]
	vaddsd	%xmm2, %xmm1, %xmm2
	vextractf128	$1, %ymm1, %xmm3
	vaddsd	%xmm3, %xmm2, %xmm2
	vpermilpd	$1, %xmm3, %xmm3        # xmm3 = xmm3[1,0]
	vaddsd	%xmm3, %xmm2, %xmm2
	vextractf32x4	$2, %zmm1, %xmm3
	vaddsd	%xmm3, %xmm2, %xmm2
	vpermilpd	$1, %xmm3, %xmm3        # xmm3 = xmm3[1,0]
	vaddsd	%xmm3, %xmm2, %xmm2
	vextractf32x4	$3, %zmm1, %xmm1
	vaddsd	%xmm1, %xmm2, %xmm2
	vpermilpd	$1, %xmm1, %xmm1        # xmm1 = xmm1[1,0]
	vaddsd	%xmm1, %xmm2, %xmm1
	vaddsd	%xmm0, %xmm1, %xmm1
	vmovsd	%xmm1, (%rdx,%rsi,8)
	addq	$1, %rsi
	cmpq	$1024, %rsi                     # imm = 0x400
	jne	.LBB6_16
# %bb.19:                               # %for.inc21.i
                                        #   in Loop: Header=BB6_15 Depth=1
	addq	$1, %r8
	cmpq	$1024, %r8                      # imm = 0x400
	jne	.LBB6_15
# %bb.20:                               # %for.cond1.preheader.i178.preheader
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB6_21:                               # %for.cond1.preheader.i178
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
	vxorpd	%xmm0, %xmm0, %xmm0
	movq	$-1024, %rbp                    # imm = 0xFC00
	.p2align	4, 0x90
.LBB6_23:                               # %for.body6.i
                                        #   Parent Loop BB6_21 Depth=1
                                        #     Parent Loop BB6_22 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	vmovsd	8192(%rcx,%rbp,8), %xmm1        # xmm1 = mem[0],zero
	vmovsd	8200(%rcx,%rbp,8), %xmm2        # xmm2 = mem[0],zero
	vmulsd	8192(%rdi,%rbp,8), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmulsd	8200(%rdi,%rbp,8), %xmm2, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	8208(%rcx,%rbp,8), %xmm1        # xmm1 = mem[0],zero
	vmulsd	8208(%rdi,%rbp,8), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	8216(%rcx,%rbp,8), %xmm1        # xmm1 = mem[0],zero
	vmulsd	8216(%rdi,%rbp,8), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	8224(%rcx,%rbp,8), %xmm1        # xmm1 = mem[0],zero
	vmulsd	8224(%rdi,%rbp,8), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	8232(%rcx,%rbp,8), %xmm1        # xmm1 = mem[0],zero
	vmulsd	8232(%rdi,%rbp,8), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	8240(%rcx,%rbp,8), %xmm1        # xmm1 = mem[0],zero
	vmulsd	8240(%rdi,%rbp,8), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	8248(%rcx,%rbp,8), %xmm1        # xmm1 = mem[0],zero
	vmulsd	8248(%rdi,%rbp,8), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	addq	$8, %rbp
	jne	.LBB6_23
# %bb.24:                               # %for.end.i
                                        #   in Loop: Header=BB6_22 Depth=2
	vmovsd	%xmm0, (%rdx,%rsi,8)
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
	vcvtsi2sd	%eax, %xmm9, %xmm0
	vdivsd	.LCPI6_1(%rip), %xmm0, %xmm0
	xorl	%r9d, %r9d
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align	4, 0x90
.LBB6_27:                               # %for.cond1.preheader.i193.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_28 Depth 2
                                        #       Child Loop BB6_29 Depth 3
                                        #         Child Loop BB6_30 Depth 4
	xorl	%r10d, %r10d
	.p2align	4, 0x90
.LBB6_28:                               # %for.cond1.preheader.i193
                                        #   Parent Loop BB6_27 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_29 Depth 3
                                        #         Child Loop BB6_30 Depth 4
	movq	(%r12,%r10,8), %rsi
	movq	(%r14,%r10,8), %rdi
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB6_29:                               # %omp.inner.for.cond.preheader.i196
                                        #   Parent Loop BB6_27 Depth=1
                                        #     Parent Loop BB6_28 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB6_30 Depth 4
	movq	(%rbx,%rax,8), %rcx
	vxorpd	%xmm2, %xmm2, %xmm2
	movq	$-1024, %rdx                    # imm = 0xFC00
	vxorpd	%xmm3, %xmm3, %xmm3
	vxorpd	%xmm4, %xmm4, %xmm4
	vxorpd	%xmm5, %xmm5, %xmm5
	.p2align	4, 0x90
.LBB6_30:                               # %vector.body290
                                        #   Parent Loop BB6_27 Depth=1
                                        #     Parent Loop BB6_28 Depth=2
                                        #       Parent Loop BB6_29 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	vmovupd	8192(%rsi,%rdx,8), %zmm6
	vmovupd	8256(%rsi,%rdx,8), %zmm7
	vmovupd	8320(%rsi,%rdx,8), %zmm8
	vmulpd	8192(%rcx,%rdx,8), %zmm6, %zmm6
	vmovupd	8384(%rsi,%rdx,8), %zmm9
	vaddpd	%zmm6, %zmm2, %zmm2
	vmulpd	8256(%rcx,%rdx,8), %zmm7, %zmm6
	vaddpd	%zmm6, %zmm3, %zmm3
	vmulpd	8320(%rcx,%rdx,8), %zmm8, %zmm6
	vaddpd	%zmm6, %zmm4, %zmm4
	vmulpd	8384(%rcx,%rdx,8), %zmm9, %zmm6
	vaddpd	%zmm6, %zmm5, %zmm5
	vmovupd	8448(%rsi,%rdx,8), %zmm6
	vmovupd	8512(%rsi,%rdx,8), %zmm7
	vmovupd	8576(%rsi,%rdx,8), %zmm8
	vmulpd	8448(%rcx,%rdx,8), %zmm6, %zmm6
	vmovupd	8640(%rsi,%rdx,8), %zmm9
	vaddpd	%zmm6, %zmm2, %zmm2
	vmulpd	8512(%rcx,%rdx,8), %zmm7, %zmm6
	vaddpd	%zmm6, %zmm3, %zmm3
	vmulpd	8576(%rcx,%rdx,8), %zmm8, %zmm6
	vaddpd	%zmm6, %zmm4, %zmm4
	vmulpd	8640(%rcx,%rdx,8), %zmm9, %zmm6
	vaddpd	%zmm6, %zmm5, %zmm5
	addq	$64, %rdx
	jne	.LBB6_30
# %bb.31:                               # %middle.block288
                                        #   in Loop: Header=BB6_29 Depth=3
	vaddpd	%zmm2, %zmm3, %zmm2
	vaddpd	%zmm2, %zmm4, %zmm2
	vaddpd	%zmm2, %zmm5, %zmm2
	vpermilpd	$1, %xmm2, %xmm3        # xmm3 = xmm2[1,0]
	vaddsd	%xmm3, %xmm2, %xmm3
	vextractf128	$1, %ymm2, %xmm4
	vaddsd	%xmm4, %xmm3, %xmm3
	vpermilpd	$1, %xmm4, %xmm4        # xmm4 = xmm4[1,0]
	vaddsd	%xmm4, %xmm3, %xmm3
	vextractf32x4	$2, %zmm2, %xmm4
	vaddsd	%xmm4, %xmm3, %xmm3
	vpermilpd	$1, %xmm4, %xmm4        # xmm4 = xmm4[1,0]
	vaddsd	%xmm4, %xmm3, %xmm3
	vextractf32x4	$3, %zmm2, %xmm2
	vaddsd	%xmm2, %xmm3, %xmm3
	vpermilpd	$1, %xmm2, %xmm2        # xmm2 = xmm2[1,0]
	vaddsd	%xmm2, %xmm3, %xmm2
	vaddsd	%xmm1, %xmm2, %xmm2
	vmovsd	%xmm2, (%rdi,%rax,8)
	addq	$1, %rax
	cmpq	$1024, %rax                     # imm = 0x400
	jne	.LBB6_29
# %bb.32:                               # %for.inc21.i213
                                        #   in Loop: Header=BB6_28 Depth=2
	addq	$1, %r10
	cmpq	$1024, %r10                     # imm = 0x400
	jne	.LBB6_28
# %bb.33:                               # %matmul_simd.exit214
                                        #   in Loop: Header=BB6_27 Depth=1
	addl	$1, %r9d
	cmpl	$20, %r9d
	jne	.LBB6_27
# %bb.34:                               # %for.end51
	vcvtsi2sd	%r8, %xmm10, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, (%rsp)                   # 8-byte Spill
	leaq	8(%rsp), %rdi
	callq	ftime
	vcvtsi2sdq	8(%rsp), %xmm10, %xmm0
	movzwl	16(%rsp), %eax
	vcvtsi2sd	%eax, %xmm10, %xmm1
	vdivsd	.LCPI6_1(%rip), %xmm1, %xmm1
	vaddsd	%xmm0, %xmm1, %xmm0
	vsubsd	(%rsp), %xmm0, %xmm0            # 8-byte Folded Reload
	vmovsd	%xmm0, (%rsp)                   # 8-byte Spill
	leaq	8(%rsp), %rdi
	callq	ftime
	movq	8(%rsp), %r8
	movzwl	16(%rsp), %eax
	vcvtsi2sd	%eax, %xmm10, %xmm0
	vdivsd	.LCPI6_1(%rip), %xmm0, %xmm0
	xorl	%r9d, %r9d
	.p2align	4, 0x90
.LBB6_35:                               # %for.cond1.preheader.i234.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_36 Depth 2
                                        #       Child Loop BB6_37 Depth 3
                                        #         Child Loop BB6_38 Depth 4
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB6_36:                               # %for.cond1.preheader.i234
                                        #   Parent Loop BB6_35 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_37 Depth 3
                                        #         Child Loop BB6_38 Depth 4
	movq	(%r12,%rdx,8), %rsi
	movq	(%r15,%rdx,8), %rdi
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB6_37:                               # %for.cond4.preheader.i237
                                        #   Parent Loop BB6_35 Depth=1
                                        #     Parent Loop BB6_36 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB6_38 Depth 4
	movq	(%rbx,%rax,8), %rbp
	vxorpd	%xmm1, %xmm1, %xmm1
	movq	$-1024, %rcx                    # imm = 0xFC00
	.p2align	4, 0x90
.LBB6_38:                               # %for.body6.i246
                                        #   Parent Loop BB6_35 Depth=1
                                        #     Parent Loop BB6_36 Depth=2
                                        #       Parent Loop BB6_37 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	vmovsd	8192(%rsi,%rcx,8), %xmm2        # xmm2 = mem[0],zero
	vmovsd	8200(%rsi,%rcx,8), %xmm3        # xmm3 = mem[0],zero
	vmulsd	8192(%rbp,%rcx,8), %xmm2, %xmm2
	vaddsd	%xmm2, %xmm1, %xmm1
	vmulsd	8200(%rbp,%rcx,8), %xmm3, %xmm2
	vaddsd	%xmm2, %xmm1, %xmm1
	vmovsd	8208(%rsi,%rcx,8), %xmm2        # xmm2 = mem[0],zero
	vmulsd	8208(%rbp,%rcx,8), %xmm2, %xmm2
	vaddsd	%xmm2, %xmm1, %xmm1
	vmovsd	8216(%rsi,%rcx,8), %xmm2        # xmm2 = mem[0],zero
	vmulsd	8216(%rbp,%rcx,8), %xmm2, %xmm2
	vaddsd	%xmm2, %xmm1, %xmm1
	vmovsd	8224(%rsi,%rcx,8), %xmm2        # xmm2 = mem[0],zero
	vmulsd	8224(%rbp,%rcx,8), %xmm2, %xmm2
	vaddsd	%xmm2, %xmm1, %xmm1
	vmovsd	8232(%rsi,%rcx,8), %xmm2        # xmm2 = mem[0],zero
	vmulsd	8232(%rbp,%rcx,8), %xmm2, %xmm2
	vaddsd	%xmm2, %xmm1, %xmm1
	vmovsd	8240(%rsi,%rcx,8), %xmm2        # xmm2 = mem[0],zero
	vmulsd	8240(%rbp,%rcx,8), %xmm2, %xmm2
	vaddsd	%xmm2, %xmm1, %xmm1
	vmovsd	8248(%rsi,%rcx,8), %xmm2        # xmm2 = mem[0],zero
	vmulsd	8248(%rbp,%rcx,8), %xmm2, %xmm2
	vaddsd	%xmm2, %xmm1, %xmm1
	addq	$8, %rcx
	jne	.LBB6_38
# %bb.39:                               # %for.end.i250
                                        #   in Loop: Header=BB6_37 Depth=3
	vmovsd	%xmm1, (%rdi,%rax,8)
	addq	$1, %rax
	cmpq	$1024, %rax                     # imm = 0x400
	jne	.LBB6_37
# %bb.40:                               # %for.inc20.i253
                                        #   in Loop: Header=BB6_36 Depth=2
	addq	$1, %rdx
	cmpq	$1024, %rdx                     # imm = 0x400
	jne	.LBB6_36
# %bb.41:                               # %matmul_serial.exit254
                                        #   in Loop: Header=BB6_35 Depth=1
	addl	$1, %r9d
	cmpl	$20, %r9d
	jne	.LBB6_35
# %bb.42:                               # %for.end60
	vxorpd	%xmm1, %xmm1, %xmm1
	vaddsd	(%rsp), %xmm1, %xmm1            # 8-byte Folded Reload
	vmovsd	%xmm1, (%rsp)                   # 8-byte Spill
	vcvtsi2sd	%r8, %xmm10, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, 24(%rsp)                 # 8-byte Spill
	leaq	8(%rsp), %rdi
	callq	ftime
	vcvtsi2sdq	8(%rsp), %xmm10, %xmm0
	movzwl	16(%rsp), %eax
	vcvtsi2sd	%eax, %xmm10, %xmm1
	vdivsd	.LCPI6_1(%rip), %xmm1, %xmm1
	vaddsd	%xmm0, %xmm1, %xmm0
	vsubsd	24(%rsp), %xmm0, %xmm0          # 8-byte Folded Reload
	vaddsd	.LCPI6_5, %xmm0, %xmm0
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
	vmovsd	.LCPI6_2(%rip), %xmm0           # xmm0 = mem[0],zero
	vmulsd	(%rsp), %xmm0, %xmm1            # 8-byte Folded Reload
	vmovsd	.LCPI6_3(%rip), %xmm2           # xmm2 = mem[0],zero
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
	vdivsd	.LCPI6_4(%rip), %xmm0, %xmm0
	movl	$.L.str.10, %edi
	vmovsd	32(%rsp), %xmm1                 # 8-byte Reload
                                        # xmm1 = mem[0],zero
	movb	$2, %al
	callq	printf
	vmovsd	24(%rsp), %xmm0                 # 8-byte Reload
                                        # xmm0 = mem[0],zero
	vdivsd	.LCPI6_4(%rip), %xmm0, %xmm0
	movl	$.L.str.11, %edi
	vmovsd	40(%rsp), %xmm1                 # 8-byte Reload
                                        # xmm1 = mem[0],zero
	movb	$2, %al
	callq	printf
	vxorpd	%xmm0, %xmm0, %xmm0
	.p2align	4, 0x90
.LBB6_43:                               # %for.cond1.preheader.i172
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_44 Depth 2
	movq	(%r14,%rbx,8), %rax
	movq	(%r15,%rbx,8), %rcx
	movq	$-1024, %rdx                    # imm = 0xFC00
	.p2align	4, 0x90
.LBB6_44:                               # %for.body4.i
                                        #   Parent Loop BB6_43 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vmovsd	8192(%rax,%rdx,8), %xmm2        # xmm2 = mem[0],zero
	vmovsd	8200(%rax,%rdx,8), %xmm1        # xmm1 = mem[0],zero
	vsubsd	8192(%rcx,%rdx,8), %xmm2, %xmm2
	vaddsd	%xmm2, %xmm0, %xmm0
	vsubsd	8200(%rcx,%rdx,8), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	8208(%rax,%rdx,8), %xmm1        # xmm1 = mem[0],zero
	vsubsd	8208(%rcx,%rdx,8), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	8216(%rax,%rdx,8), %xmm1        # xmm1 = mem[0],zero
	vsubsd	8216(%rcx,%rdx,8), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	8224(%rax,%rdx,8), %xmm1        # xmm1 = mem[0],zero
	vsubsd	8224(%rcx,%rdx,8), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	8232(%rax,%rdx,8), %xmm1        # xmm1 = mem[0],zero
	vsubsd	8232(%rcx,%rdx,8), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	8240(%rax,%rdx,8), %xmm1        # xmm1 = mem[0],zero
	vsubsd	8240(%rcx,%rdx,8), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	8248(%rax,%rdx,8), %xmm1        # xmm1 = mem[0],zero
	vsubsd	8248(%rcx,%rdx,8), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	addq	$8, %rdx
	jne	.LBB6_44
# %bb.45:                               # %for.cond.cleanup3.i
                                        #   in Loop: Header=BB6_43 Depth=1
	addq	$1, %rbx
	cmpq	$1024, %rbx                     # imm = 0x400
	jne	.LBB6_43
# %bb.46:                               # %check.exit
	movl	$.L.str.12, %edi
	movb	$1, %al
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
	.asciz	"%.2f "
	.size	.L.str.1, 6

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
	.asciz	"Correctness check: %f\n"
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
