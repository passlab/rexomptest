	.text
	.file	"matmul_float.c"
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
	vmovss	.LCPI1_0(%rip), %xmm1           # xmm1 = mem[0],zero,zero,zero
	vcvtsi2ss	%eax, %xmm2, %xmm0
	vdivss	%xmm1, %xmm0, %xmm0
	movq	(%r14,%r15,8), %rax
	vmovss	%xmm0, 4096(%rax,%rbx)
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
	vxorps	%xmm0, %xmm0, %xmm0
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
	vxorps	%xmm1, %xmm1, %xmm1
	movq	$-1024, %rcx                    # imm = 0xFC00
	vxorps	%xmm2, %xmm2, %xmm2
	vxorps	%xmm3, %xmm3, %xmm3
	vxorps	%xmm4, %xmm4, %xmm4
	.p2align	4, 0x90
.LBB2_3:                                # %vector.body
                                        #   Parent Loop BB2_1 Depth=1
                                        #     Parent Loop BB2_2 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	vmovups	4096(%r11,%rcx,4), %zmm5
	vmovups	4160(%r11,%rcx,4), %zmm6
	vmovups	4224(%r11,%rcx,4), %zmm7
	vmulps	4096(%rax,%rcx,4), %zmm5, %zmm5
	vmovups	4288(%r11,%rcx,4), %zmm8
	vaddps	%zmm5, %zmm1, %zmm1
	vmulps	4160(%rax,%rcx,4), %zmm6, %zmm5
	vaddps	%zmm5, %zmm2, %zmm2
	vmulps	4224(%rax,%rcx,4), %zmm7, %zmm5
	vaddps	%zmm5, %zmm3, %zmm3
	vmulps	4288(%rax,%rcx,4), %zmm8, %zmm5
	vaddps	%zmm5, %zmm4, %zmm4
	vmovups	4352(%r11,%rcx,4), %zmm5
	vmovups	4416(%r11,%rcx,4), %zmm6
	vmovups	4480(%r11,%rcx,4), %zmm7
	vmulps	4352(%rax,%rcx,4), %zmm5, %zmm5
	vmovups	4544(%r11,%rcx,4), %zmm8
	vaddps	%zmm5, %zmm1, %zmm1
	vmulps	4416(%rax,%rcx,4), %zmm6, %zmm5
	vaddps	%zmm5, %zmm2, %zmm2
	vmulps	4480(%rax,%rcx,4), %zmm7, %zmm5
	vaddps	%zmm5, %zmm3, %zmm3
	vmulps	4544(%rax,%rcx,4), %zmm8, %zmm5
	vaddps	%zmm5, %zmm4, %zmm4
	subq	$-128, %rcx
	jne	.LBB2_3
# %bb.4:                                # %middle.block
                                        #   in Loop: Header=BB2_2 Depth=2
	vaddps	%zmm1, %zmm2, %zmm1
	vaddps	%zmm1, %zmm3, %zmm1
	vaddps	%zmm1, %zmm4, %zmm1
	vmovshdup	%xmm1, %xmm2            # xmm2 = xmm1[1,1,3,3]
	vaddss	%xmm2, %xmm1, %xmm2
	vpermilpd	$1, %xmm1, %xmm3        # xmm3 = xmm1[1,0]
	vaddss	%xmm3, %xmm2, %xmm2
	vpermilps	$255, %xmm1, %xmm3      # xmm3 = xmm1[3,3,3,3]
	vaddss	%xmm3, %xmm2, %xmm2
	vextractf128	$1, %ymm1, %xmm3
	vaddss	%xmm3, %xmm2, %xmm2
	vmovshdup	%xmm3, %xmm4            # xmm4 = xmm3[1,1,3,3]
	vaddss	%xmm4, %xmm2, %xmm2
	vpermilpd	$1, %xmm3, %xmm4        # xmm4 = xmm3[1,0]
	vaddss	%xmm4, %xmm2, %xmm2
	vpermilps	$255, %xmm3, %xmm3      # xmm3 = xmm3[3,3,3,3]
	vaddss	%xmm3, %xmm2, %xmm2
	vextractf32x4	$2, %zmm1, %xmm3
	vaddss	%xmm3, %xmm2, %xmm2
	vmovshdup	%xmm3, %xmm4            # xmm4 = xmm3[1,1,3,3]
	vaddss	%xmm4, %xmm2, %xmm2
	vpermilpd	$1, %xmm3, %xmm4        # xmm4 = xmm3[1,0]
	vaddss	%xmm4, %xmm2, %xmm2
	vpermilps	$255, %xmm3, %xmm3      # xmm3 = xmm3[3,3,3,3]
	vaddss	%xmm3, %xmm2, %xmm2
	vextractf32x4	$3, %zmm1, %xmm1
	vaddss	%xmm1, %xmm2, %xmm2
	vmovshdup	%xmm1, %xmm3            # xmm3 = xmm1[1,1,3,3]
	vaddss	%xmm3, %xmm2, %xmm2
	vpermilpd	$1, %xmm1, %xmm3        # xmm3 = xmm1[1,0]
	vaddss	%xmm3, %xmm2, %xmm2
	vpermilps	$255, %xmm1, %xmm1      # xmm1 = xmm1[3,3,3,3]
	vaddss	%xmm1, %xmm2, %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	vmovss	%xmm1, (%r9,%r10,4)
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
	vmovss	(%rax), %xmm0                   # xmm0 = mem[0],zero,zero,zero
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf
	movq	64(%r14,%rbx), %rax
	vmovss	4(%rax), %xmm0                  # xmm0 = mem[0],zero,zero,zero
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf
	movq	64(%r14,%rbx), %rax
	vmovss	8(%rax), %xmm0                  # xmm0 = mem[0],zero,zero,zero
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf
	movq	64(%r14,%rbx), %rax
	vmovss	12(%rax), %xmm0                 # xmm0 = mem[0],zero,zero,zero
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf
	movq	64(%r14,%rbx), %rax
	vmovss	16(%rax), %xmm0                 # xmm0 = mem[0],zero,zero,zero
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf
	movq	64(%r14,%rbx), %rax
	vmovss	20(%rax), %xmm0                 # xmm0 = mem[0],zero,zero,zero
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf
	movq	64(%r14,%rbx), %rax
	vmovss	24(%rax), %xmm0                 # xmm0 = mem[0],zero,zero,zero
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf
	movq	64(%r14,%rbx), %rax
	vmovss	28(%rax), %xmm0                 # xmm0 = mem[0],zero,zero,zero
	vcvtss2sd	%xmm0, %xmm0, %xmm0
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
	vxorps	%xmm0, %xmm0, %xmm0
	movq	$-1024, %rcx                    # imm = 0xFC00
	.p2align	4, 0x90
.LBB4_3:                                # %for.body6
                                        #   Parent Loop BB4_1 Depth=1
                                        #     Parent Loop BB4_2 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	vmovss	4096(%r11,%rcx,4), %xmm1        # xmm1 = mem[0],zero,zero,zero
	vmovss	4100(%r11,%rcx,4), %xmm2        # xmm2 = mem[0],zero,zero,zero
	vmulss	4096(%rax,%rcx,4), %xmm1, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	vmulss	4100(%rax,%rcx,4), %xmm2, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	vmovss	4104(%r11,%rcx,4), %xmm1        # xmm1 = mem[0],zero,zero,zero
	vmulss	4104(%rax,%rcx,4), %xmm1, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	vmovss	4108(%r11,%rcx,4), %xmm1        # xmm1 = mem[0],zero,zero,zero
	vmulss	4108(%rax,%rcx,4), %xmm1, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	vmovss	4112(%r11,%rcx,4), %xmm1        # xmm1 = mem[0],zero,zero,zero
	vmulss	4112(%rax,%rcx,4), %xmm1, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	vmovss	4116(%r11,%rcx,4), %xmm1        # xmm1 = mem[0],zero,zero,zero
	vmulss	4116(%rax,%rcx,4), %xmm1, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	vmovss	4120(%r11,%rcx,4), %xmm1        # xmm1 = mem[0],zero,zero,zero
	vmulss	4120(%rax,%rcx,4), %xmm1, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	vmovss	4124(%r11,%rcx,4), %xmm1        # xmm1 = mem[0],zero,zero,zero
	vmulss	4124(%rax,%rcx,4), %xmm1, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	addq	$8, %rcx
	jne	.LBB4_3
# %bb.4:                                # %for.end
                                        #   in Loop: Header=BB4_2 Depth=2
	vmovss	%xmm0, (%r9,%r10,4)
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
	vxorps	%xmm0, %xmm0, %xmm0
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
	vmovss	4096(%rcx,%rax,4), %xmm1        # xmm1 = mem[0],zero,zero,zero
	vmovss	4100(%rcx,%rax,4), %xmm2        # xmm2 = mem[0],zero,zero,zero
	vsubss	4096(%rdx,%rax,4), %xmm1, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	vsubss	4100(%rdx,%rax,4), %xmm2, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	vmovss	4104(%rcx,%rax,4), %xmm1        # xmm1 = mem[0],zero,zero,zero
	vsubss	4104(%rdx,%rax,4), %xmm1, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	vmovss	4108(%rcx,%rax,4), %xmm1        # xmm1 = mem[0],zero,zero,zero
	vsubss	4108(%rdx,%rax,4), %xmm1, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	vmovss	4112(%rcx,%rax,4), %xmm1        # xmm1 = mem[0],zero,zero,zero
	vsubss	4112(%rdx,%rax,4), %xmm1, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	vmovss	4116(%rcx,%rax,4), %xmm1        # xmm1 = mem[0],zero,zero,zero
	vsubss	4116(%rdx,%rax,4), %xmm1, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	vmovss	4120(%rcx,%rax,4), %xmm1        # xmm1 = mem[0],zero,zero,zero
	vsubss	4120(%rdx,%rax,4), %xmm1, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	vmovss	4124(%rcx,%rax,4), %xmm1        # xmm1 = mem[0],zero,zero,zero
	vsubss	4124(%rdx,%rax,4), %xmm1, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
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
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2                               # -- Begin function main
.LCPI6_0:
	.long	0x4d4ccccd                      # float 214748368
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3
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
	vmovss	.LCPI6_0(%rip), %xmm1           # xmm1 = mem[0],zero,zero,zero
	vcvtsi2ss	%eax, %xmm2, %xmm0
	vdivss	%xmm1, %xmm0, %xmm0
	movq	(%r12,%rbp,8), %rax
	vmovss	%xmm0, 4096(%rax,%r14)
	addq	$4, %r14
	jne	.LBB6_4
# %bb.5:                                # %for.inc6.i
                                        #   in Loop: Header=BB6_3 Depth=1
	addq	$1, %rbp
	cmpq	$1024, %rbp                     # imm = 0x400
	jne	.LBB6_3
# %bb.6:                                # %for.cond1.preheader.i153.preheader
	xorl	%r14d, %r14d
	.p2align	4, 0x90
.LBB6_7:                                # %for.cond1.preheader.i153
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_8 Depth 2
	movq	$-4096, %rbp                    # imm = 0xF000
	.p2align	4, 0x90
.LBB6_8:                                # %for.body3.i161
                                        #   Parent Loop BB6_7 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	callq	rand
	vcvtsi2ss	%eax, %xmm2, %xmm0
	vdivss	.LCPI6_0(%rip), %xmm0, %xmm0
	movq	(%r13,%r14,8), %rax
	vmovss	%xmm0, 4096(%rax,%rbp)
	addq	$4, %rbp
	jne	.LBB6_8
# %bb.9:                                # %for.inc6.i164
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
	vmovss	(%rsi,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	vmovss	%xmm0, 4096(%rcx,%rdx,2)
	movq	8200(%r13,%rdx,4), %rsi
	vmovss	(%rsi,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	vmovss	%xmm0, 4100(%rcx,%rdx,2)
	movq	8208(%r13,%rdx,4), %rsi
	vmovss	(%rsi,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	vmovss	%xmm0, 4104(%rcx,%rdx,2)
	movq	8216(%r13,%rdx,4), %rsi
	vmovss	(%rsi,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	vmovss	%xmm0, 4108(%rcx,%rdx,2)
	movq	8224(%r13,%rdx,4), %rsi
	vmovss	(%rsi,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	vmovss	%xmm0, 4112(%rcx,%rdx,2)
	movq	8232(%r13,%rdx,4), %rsi
	vmovss	(%rsi,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	vmovss	%xmm0, 4116(%rcx,%rdx,2)
	movq	8240(%r13,%rdx,4), %rsi
	vmovss	(%rsi,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	vmovss	%xmm0, 4120(%rcx,%rdx,2)
	movq	8248(%r13,%rdx,4), %rsi
	vmovss	(%rsi,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	vmovss	%xmm0, 4124(%rcx,%rdx,2)
	addq	$16, %rdx
	jne	.LBB6_12
# %bb.13:                               # %for.cond.cleanup27
                                        #   in Loop: Header=BB6_11 Depth=1
	addq	$1, %rax
	cmpq	$1024, %rax                     # imm = 0x400
	jne	.LBB6_11
# %bb.14:                               # %for.cond1.preheader.i167.preheader
	xorl	%r8d, %r8d
	vxorps	%xmm0, %xmm0, %xmm0
	.p2align	4, 0x90
.LBB6_15:                               # %for.cond1.preheader.i167
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
	vxorps	%xmm1, %xmm1, %xmm1
	movq	$-1024, %rax                    # imm = 0xFC00
	vxorps	%xmm2, %xmm2, %xmm2
	vxorps	%xmm3, %xmm3, %xmm3
	vxorps	%xmm4, %xmm4, %xmm4
	.p2align	4, 0x90
.LBB6_17:                               # %vector.body
                                        #   Parent Loop BB6_15 Depth=1
                                        #     Parent Loop BB6_16 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	vmovups	4096(%rcx,%rax,4), %zmm5
	vmovups	4160(%rcx,%rax,4), %zmm6
	vmovups	4224(%rcx,%rax,4), %zmm7
	vmulps	4096(%rdi,%rax,4), %zmm5, %zmm5
	vmovups	4288(%rcx,%rax,4), %zmm8
	vaddps	%zmm5, %zmm1, %zmm1
	vmulps	4160(%rdi,%rax,4), %zmm6, %zmm5
	vaddps	%zmm5, %zmm2, %zmm2
	vmulps	4224(%rdi,%rax,4), %zmm7, %zmm5
	vaddps	%zmm5, %zmm3, %zmm3
	vmulps	4288(%rdi,%rax,4), %zmm8, %zmm5
	vaddps	%zmm5, %zmm4, %zmm4
	vmovups	4352(%rcx,%rax,4), %zmm5
	vmovups	4416(%rcx,%rax,4), %zmm6
	vmovups	4480(%rcx,%rax,4), %zmm7
	vmulps	4352(%rdi,%rax,4), %zmm5, %zmm5
	vmovups	4544(%rcx,%rax,4), %zmm8
	vaddps	%zmm5, %zmm1, %zmm1
	vmulps	4416(%rdi,%rax,4), %zmm6, %zmm5
	vaddps	%zmm5, %zmm2, %zmm2
	vmulps	4480(%rdi,%rax,4), %zmm7, %zmm5
	vaddps	%zmm5, %zmm3, %zmm3
	vmulps	4544(%rdi,%rax,4), %zmm8, %zmm5
	vaddps	%zmm5, %zmm4, %zmm4
	subq	$-128, %rax
	jne	.LBB6_17
# %bb.18:                               # %middle.block
                                        #   in Loop: Header=BB6_16 Depth=2
	vaddps	%zmm1, %zmm2, %zmm1
	vaddps	%zmm1, %zmm3, %zmm1
	vaddps	%zmm1, %zmm4, %zmm1
	vmovshdup	%xmm1, %xmm2            # xmm2 = xmm1[1,1,3,3]
	vaddss	%xmm2, %xmm1, %xmm2
	vpermilpd	$1, %xmm1, %xmm3        # xmm3 = xmm1[1,0]
	vaddss	%xmm3, %xmm2, %xmm2
	vpermilps	$255, %xmm1, %xmm3      # xmm3 = xmm1[3,3,3,3]
	vaddss	%xmm3, %xmm2, %xmm2
	vextractf128	$1, %ymm1, %xmm3
	vaddss	%xmm3, %xmm2, %xmm2
	vmovshdup	%xmm3, %xmm4            # xmm4 = xmm3[1,1,3,3]
	vaddss	%xmm4, %xmm2, %xmm2
	vpermilpd	$1, %xmm3, %xmm4        # xmm4 = xmm3[1,0]
	vaddss	%xmm4, %xmm2, %xmm2
	vpermilps	$255, %xmm3, %xmm3      # xmm3 = xmm3[3,3,3,3]
	vaddss	%xmm3, %xmm2, %xmm2
	vextractf32x4	$2, %zmm1, %xmm3
	vaddss	%xmm3, %xmm2, %xmm2
	vmovshdup	%xmm3, %xmm4            # xmm4 = xmm3[1,1,3,3]
	vaddss	%xmm4, %xmm2, %xmm2
	vpermilpd	$1, %xmm3, %xmm4        # xmm4 = xmm3[1,0]
	vaddss	%xmm4, %xmm2, %xmm2
	vpermilps	$255, %xmm3, %xmm3      # xmm3 = xmm3[3,3,3,3]
	vaddss	%xmm3, %xmm2, %xmm2
	vextractf32x4	$3, %zmm1, %xmm1
	vaddss	%xmm1, %xmm2, %xmm2
	vmovshdup	%xmm1, %xmm3            # xmm3 = xmm1[1,1,3,3]
	vaddss	%xmm3, %xmm2, %xmm2
	vpermilpd	$1, %xmm1, %xmm3        # xmm3 = xmm1[1,0]
	vaddss	%xmm3, %xmm2, %xmm2
	vpermilps	$255, %xmm1, %xmm1      # xmm1 = xmm1[3,3,3,3]
	vaddss	%xmm1, %xmm2, %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	vmovss	%xmm1, (%rdx,%rsi,4)
	addq	$1, %rsi
	cmpq	$1024, %rsi                     # imm = 0x400
	jne	.LBB6_16
# %bb.19:                               # %for.inc21.i
                                        #   in Loop: Header=BB6_15 Depth=1
	addq	$1, %r8
	cmpq	$1024, %r8                      # imm = 0x400
	jne	.LBB6_15
# %bb.20:                               # %for.cond1.preheader.i179.preheader
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB6_21:                               # %for.cond1.preheader.i179
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
	vxorps	%xmm0, %xmm0, %xmm0
	movq	$-1024, %rbp                    # imm = 0xFC00
	.p2align	4, 0x90
.LBB6_23:                               # %for.body6.i
                                        #   Parent Loop BB6_21 Depth=1
                                        #     Parent Loop BB6_22 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	vmovss	4096(%rcx,%rbp,4), %xmm1        # xmm1 = mem[0],zero,zero,zero
	vmovss	4100(%rcx,%rbp,4), %xmm2        # xmm2 = mem[0],zero,zero,zero
	vmulss	4096(%rdi,%rbp,4), %xmm1, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	vmulss	4100(%rdi,%rbp,4), %xmm2, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	vmovss	4104(%rcx,%rbp,4), %xmm1        # xmm1 = mem[0],zero,zero,zero
	vmulss	4104(%rdi,%rbp,4), %xmm1, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	vmovss	4108(%rcx,%rbp,4), %xmm1        # xmm1 = mem[0],zero,zero,zero
	vmulss	4108(%rdi,%rbp,4), %xmm1, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	vmovss	4112(%rcx,%rbp,4), %xmm1        # xmm1 = mem[0],zero,zero,zero
	vmulss	4112(%rdi,%rbp,4), %xmm1, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	vmovss	4116(%rcx,%rbp,4), %xmm1        # xmm1 = mem[0],zero,zero,zero
	vmulss	4116(%rdi,%rbp,4), %xmm1, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	vmovss	4120(%rcx,%rbp,4), %xmm1        # xmm1 = mem[0],zero,zero,zero
	vmulss	4120(%rdi,%rbp,4), %xmm1, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	vmovss	4124(%rcx,%rbp,4), %xmm1        # xmm1 = mem[0],zero,zero,zero
	vmulss	4124(%rdi,%rbp,4), %xmm1, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	addq	$8, %rbp
	jne	.LBB6_23
# %bb.24:                               # %for.end.i
                                        #   in Loop: Header=BB6_22 Depth=2
	vmovss	%xmm0, (%rdx,%rsi,4)
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
	vxorps	%xmm1, %xmm1, %xmm1
	.p2align	4, 0x90
.LBB6_27:                               # %for.cond1.preheader.i194.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_28 Depth 2
                                        #       Child Loop BB6_29 Depth 3
                                        #         Child Loop BB6_30 Depth 4
	xorl	%r10d, %r10d
	.p2align	4, 0x90
.LBB6_28:                               # %for.cond1.preheader.i194
                                        #   Parent Loop BB6_27 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_29 Depth 3
                                        #         Child Loop BB6_30 Depth 4
	movq	(%r12,%r10,8), %rsi
	movq	(%r14,%r10,8), %rdi
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB6_29:                               # %omp.inner.for.cond.preheader.i197
                                        #   Parent Loop BB6_27 Depth=1
                                        #     Parent Loop BB6_28 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB6_30 Depth 4
	movq	(%rbx,%rax,8), %rcx
	vxorps	%xmm2, %xmm2, %xmm2
	movq	$-1024, %rdx                    # imm = 0xFC00
	vxorps	%xmm3, %xmm3, %xmm3
	vxorps	%xmm4, %xmm4, %xmm4
	vxorps	%xmm5, %xmm5, %xmm5
	.p2align	4, 0x90
.LBB6_30:                               # %vector.body291
                                        #   Parent Loop BB6_27 Depth=1
                                        #     Parent Loop BB6_28 Depth=2
                                        #       Parent Loop BB6_29 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	vmovups	4096(%rsi,%rdx,4), %zmm6
	vmovups	4160(%rsi,%rdx,4), %zmm7
	vmovups	4224(%rsi,%rdx,4), %zmm8
	vmulps	4096(%rcx,%rdx,4), %zmm6, %zmm6
	vmovups	4288(%rsi,%rdx,4), %zmm9
	vaddps	%zmm6, %zmm2, %zmm2
	vmulps	4160(%rcx,%rdx,4), %zmm7, %zmm6
	vaddps	%zmm6, %zmm3, %zmm3
	vmulps	4224(%rcx,%rdx,4), %zmm8, %zmm6
	vaddps	%zmm6, %zmm4, %zmm4
	vmulps	4288(%rcx,%rdx,4), %zmm9, %zmm6
	vaddps	%zmm6, %zmm5, %zmm5
	vmovups	4352(%rsi,%rdx,4), %zmm6
	vmovups	4416(%rsi,%rdx,4), %zmm7
	vmovups	4480(%rsi,%rdx,4), %zmm8
	vmulps	4352(%rcx,%rdx,4), %zmm6, %zmm6
	vmovups	4544(%rsi,%rdx,4), %zmm9
	vaddps	%zmm6, %zmm2, %zmm2
	vmulps	4416(%rcx,%rdx,4), %zmm7, %zmm6
	vaddps	%zmm6, %zmm3, %zmm3
	vmulps	4480(%rcx,%rdx,4), %zmm8, %zmm6
	vaddps	%zmm6, %zmm4, %zmm4
	vmulps	4544(%rcx,%rdx,4), %zmm9, %zmm6
	vaddps	%zmm6, %zmm5, %zmm5
	subq	$-128, %rdx
	jne	.LBB6_30
# %bb.31:                               # %middle.block289
                                        #   in Loop: Header=BB6_29 Depth=3
	vaddps	%zmm2, %zmm3, %zmm2
	vaddps	%zmm2, %zmm4, %zmm2
	vaddps	%zmm2, %zmm5, %zmm2
	vmovshdup	%xmm2, %xmm3            # xmm3 = xmm2[1,1,3,3]
	vaddss	%xmm3, %xmm2, %xmm3
	vpermilpd	$1, %xmm2, %xmm4        # xmm4 = xmm2[1,0]
	vaddss	%xmm4, %xmm3, %xmm3
	vpermilps	$255, %xmm2, %xmm4      # xmm4 = xmm2[3,3,3,3]
	vaddss	%xmm4, %xmm3, %xmm3
	vextractf128	$1, %ymm2, %xmm4
	vaddss	%xmm4, %xmm3, %xmm3
	vmovshdup	%xmm4, %xmm5            # xmm5 = xmm4[1,1,3,3]
	vaddss	%xmm5, %xmm3, %xmm3
	vpermilpd	$1, %xmm4, %xmm5        # xmm5 = xmm4[1,0]
	vaddss	%xmm5, %xmm3, %xmm3
	vpermilps	$255, %xmm4, %xmm4      # xmm4 = xmm4[3,3,3,3]
	vaddss	%xmm4, %xmm3, %xmm3
	vextractf32x4	$2, %zmm2, %xmm4
	vaddss	%xmm4, %xmm3, %xmm3
	vmovshdup	%xmm4, %xmm5            # xmm5 = xmm4[1,1,3,3]
	vaddss	%xmm5, %xmm3, %xmm3
	vpermilpd	$1, %xmm4, %xmm5        # xmm5 = xmm4[1,0]
	vaddss	%xmm5, %xmm3, %xmm3
	vpermilps	$255, %xmm4, %xmm4      # xmm4 = xmm4[3,3,3,3]
	vaddss	%xmm4, %xmm3, %xmm3
	vextractf32x4	$3, %zmm2, %xmm2
	vaddss	%xmm2, %xmm3, %xmm3
	vmovshdup	%xmm2, %xmm4            # xmm4 = xmm2[1,1,3,3]
	vaddss	%xmm4, %xmm3, %xmm3
	vpermilpd	$1, %xmm2, %xmm4        # xmm4 = xmm2[1,0]
	vaddss	%xmm4, %xmm3, %xmm3
	vpermilps	$255, %xmm2, %xmm2      # xmm2 = xmm2[3,3,3,3]
	vaddss	%xmm2, %xmm3, %xmm2
	vaddss	%xmm1, %xmm2, %xmm2
	vmovss	%xmm2, (%rdi,%rax,4)
	addq	$1, %rax
	cmpq	$1024, %rax                     # imm = 0x400
	jne	.LBB6_29
# %bb.32:                               # %for.inc21.i214
                                        #   in Loop: Header=BB6_28 Depth=2
	addq	$1, %r10
	cmpq	$1024, %r10                     # imm = 0x400
	jne	.LBB6_28
# %bb.33:                               # %matmul_simd.exit215
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
.LBB6_35:                               # %for.cond1.preheader.i235.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_36 Depth 2
                                        #       Child Loop BB6_37 Depth 3
                                        #         Child Loop BB6_38 Depth 4
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB6_36:                               # %for.cond1.preheader.i235
                                        #   Parent Loop BB6_35 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_37 Depth 3
                                        #         Child Loop BB6_38 Depth 4
	movq	(%r12,%rdx,8), %rsi
	movq	(%r15,%rdx,8), %rdi
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB6_37:                               # %for.cond4.preheader.i238
                                        #   Parent Loop BB6_35 Depth=1
                                        #     Parent Loop BB6_36 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB6_38 Depth 4
	movq	(%rbx,%rax,8), %rbp
	vxorpd	%xmm1, %xmm1, %xmm1
	movq	$-1024, %rcx                    # imm = 0xFC00
	.p2align	4, 0x90
.LBB6_38:                               # %for.body6.i247
                                        #   Parent Loop BB6_35 Depth=1
                                        #     Parent Loop BB6_36 Depth=2
                                        #       Parent Loop BB6_37 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	vmovss	4096(%rsi,%rcx,4), %xmm2        # xmm2 = mem[0],zero,zero,zero
	vmovss	4100(%rsi,%rcx,4), %xmm3        # xmm3 = mem[0],zero,zero,zero
	vmulss	4096(%rbp,%rcx,4), %xmm2, %xmm2
	vaddss	%xmm2, %xmm1, %xmm1
	vmulss	4100(%rbp,%rcx,4), %xmm3, %xmm2
	vaddss	%xmm2, %xmm1, %xmm1
	vmovss	4104(%rsi,%rcx,4), %xmm2        # xmm2 = mem[0],zero,zero,zero
	vmulss	4104(%rbp,%rcx,4), %xmm2, %xmm2
	vaddss	%xmm2, %xmm1, %xmm1
	vmovss	4108(%rsi,%rcx,4), %xmm2        # xmm2 = mem[0],zero,zero,zero
	vmulss	4108(%rbp,%rcx,4), %xmm2, %xmm2
	vaddss	%xmm2, %xmm1, %xmm1
	vmovss	4112(%rsi,%rcx,4), %xmm2        # xmm2 = mem[0],zero,zero,zero
	vmulss	4112(%rbp,%rcx,4), %xmm2, %xmm2
	vaddss	%xmm2, %xmm1, %xmm1
	vmovss	4116(%rsi,%rcx,4), %xmm2        # xmm2 = mem[0],zero,zero,zero
	vmulss	4116(%rbp,%rcx,4), %xmm2, %xmm2
	vaddss	%xmm2, %xmm1, %xmm1
	vmovss	4120(%rsi,%rcx,4), %xmm2        # xmm2 = mem[0],zero,zero,zero
	vmulss	4120(%rbp,%rcx,4), %xmm2, %xmm2
	vaddss	%xmm2, %xmm1, %xmm1
	vmovss	4124(%rsi,%rcx,4), %xmm2        # xmm2 = mem[0],zero,zero,zero
	vmulss	4124(%rbp,%rcx,4), %xmm2, %xmm2
	vaddss	%xmm2, %xmm1, %xmm1
	addq	$8, %rcx
	jne	.LBB6_38
# %bb.39:                               # %for.end.i251
                                        #   in Loop: Header=BB6_37 Depth=3
	vmovss	%xmm1, (%rdi,%rax,4)
	addq	$1, %rax
	cmpq	$1024, %rax                     # imm = 0x400
	jne	.LBB6_37
# %bb.40:                               # %for.inc20.i254
                                        #   in Loop: Header=BB6_36 Depth=2
	addq	$1, %rdx
	cmpq	$1024, %rdx                     # imm = 0x400
	jne	.LBB6_36
# %bb.41:                               # %matmul_serial.exit255
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
	vcvtsi2sd	%eax, %xmm7, %xmm1
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
.LBB6_43:                               # %for.cond1.preheader.i173
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_44 Depth 2
	movq	(%r14,%rbx,8), %rax
	movq	(%r15,%rbx,8), %rcx
	movq	$-1024, %rdx                    # imm = 0xFC00
	.p2align	4, 0x90
.LBB6_44:                               # %for.body4.i
                                        #   Parent Loop BB6_43 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vmovss	4096(%rax,%rdx,4), %xmm1        # xmm1 = mem[0],zero,zero,zero
	vmovss	4100(%rax,%rdx,4), %xmm2        # xmm2 = mem[0],zero,zero,zero
	vsubss	4096(%rcx,%rdx,4), %xmm1, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	vsubss	4100(%rcx,%rdx,4), %xmm2, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	vmovss	4104(%rax,%rdx,4), %xmm1        # xmm1 = mem[0],zero,zero,zero
	vsubss	4104(%rcx,%rdx,4), %xmm1, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	vmovss	4108(%rax,%rdx,4), %xmm1        # xmm1 = mem[0],zero,zero,zero
	vsubss	4108(%rcx,%rdx,4), %xmm1, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	vmovss	4112(%rax,%rdx,4), %xmm1        # xmm1 = mem[0],zero,zero,zero
	vsubss	4112(%rcx,%rdx,4), %xmm1, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	vmovss	4116(%rax,%rdx,4), %xmm1        # xmm1 = mem[0],zero,zero,zero
	vsubss	4116(%rcx,%rdx,4), %xmm1, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	vmovss	4120(%rax,%rdx,4), %xmm1        # xmm1 = mem[0],zero,zero,zero
	vsubss	4120(%rcx,%rdx,4), %xmm1, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	vmovss	4124(%rax,%rdx,4), %xmm1        # xmm1 = mem[0],zero,zero,zero
	vsubss	4124(%rcx,%rdx,4), %xmm1, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	addq	$8, %rdx
	jne	.LBB6_44
# %bb.45:                               # %for.cond.cleanup3.i
                                        #   in Loop: Header=BB6_43 Depth=1
	addq	$1, %rbx
	cmpq	$1024, %rbx                     # imm = 0x400
	jne	.LBB6_43
# %bb.46:                               # %check.exit
	vcvtss2sd	%xmm0, %xmm0, %xmm0
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
