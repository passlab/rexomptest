	.text
	.file	"jacobi_float.c"
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2                               # -- Begin function jacobi_seq
.LCPI0_0:
	.long	0x3f800000                      # float 1
.LCPI0_2:
	.long	0x41200000                      # float 10
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3
.LCPI0_1:
	.quad	0xc000000000000000              # double -2
.LCPI0_3:
	.quad	0x0000000000000000              # double 0
	.text
	.globl	jacobi_seq
	.p2align	4, 0x90
	.type	jacobi_seq,@function
jacobi_seq:                             # @jacobi_seq
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$232, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rcx, %r15
	movq	%rdx, -72(%rbp)                 # 8-byte Spill
	vmovaps	%xmm3, %xmm5
	movl	%esi, %r14d
                                        # kill: def $edi killed $edi def $rdi
	movq	%rdi, -80(%rbp)                 # 8-byte Spill
	movl	%edi, %ecx
	movl	%esi, %ebx
	movq	%rbx, %rax
	movq	%rcx, %rdx
	imulq	%rcx, %rax
	leaq	15(,%rax,4), %rax
	andq	$-16, %rax
	movq	%rsp, %rcx
	subq	%rax, %rcx
	movq	%rcx, -64(%rbp)                 # 8-byte Spill
	movq	%rcx, %rsp
	vmulss	.LCPI0_2(%rip), %xmm4, %xmm3
	vmovss	%xmm4, -92(%rbp)                # 4-byte Spill
	vucomiss	%xmm4, %xmm3
	movl	$1, %esi
	jbe	.LBB0_38
# %bb.1:                                # %entry
	movl	%r8d, %r13d
	testl	%r8d, %r8d
	jle	.LBB0_38
# %bb.2:                                # %for.cond.preheader.lr.ph
	vinsertps	$16, %xmm1, %xmm0, %xmm0 # xmm0 = xmm0[0],xmm1[0],xmm0[2,3]
	vmulps	%xmm0, %xmm0, %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm1
	vmovshdup	%xmm0, %xmm3            # xmm3 = xmm0[1,1,3,3]
	vcvtss2sd	%xmm3, %xmm3, %xmm3
	vbroadcastss	.LCPI0_0(%rip), %xmm4   # xmm4 = [1.0E+0,1.0E+0,1.0E+0,1.0E+0]
	vdivps	%xmm0, %xmm4, %xmm6
	vmovsd	.LCPI0_1(%rip), %xmm0           # xmm0 = mem[0],zero
	vdivsd	%xmm1, %xmm0, %xmm1
	vdivsd	%xmm3, %xmm0, %xmm0
	vaddsd	%xmm0, %xmm1, %xmm0
	vcvtss2sd	%xmm2, %xmm2, %xmm1
	vsubsd	%xmm1, %xmm0, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm7
	movl	%r14d, %eax
	movq	-80(%rbp), %rcx                 # 8-byte Reload
	imull	%ecx, %eax
	vcvtsi2sd	%eax, %xmm8, %xmm0
	vmovsd	%xmm0, -144(%rbp)               # 8-byte Spill
	leaq	(,%rbx,4), %rsi
	movq	%rsi, -56(%rbp)                 # 8-byte Spill
	leal	-1(%r14), %eax
	addl	$-1, %ecx
	movq	%rcx, -272(%rbp)                # 8-byte Spill
	leaq	-1(%rdx), %rcx
	movq	%rcx, -136(%rbp)                # 8-byte Spill
	movq	%rax, -248(%rbp)                # 8-byte Spill
	leaq	-1(%rax), %r12
	movl	%edx, %eax
	andl	$3, %eax
	movq	%rax, -120(%rbp)                # 8-byte Spill
	andl	$-4, %edx
	movq	%rdx, -264(%rbp)                # 8-byte Spill
	movq	-64(%rbp), %rcx                 # 8-byte Reload
	leaq	(%rcx,%rbx,8), %rax
	movq	%rax, -232(%rbp)                # 8-byte Spill
	movq	%rbx, %rax
	shlq	$4, %rax
	movq	%rax, -256(%rbp)                # 8-byte Spill
	movq	-72(%rbp), %rax                 # 8-byte Reload
	leaq	(%rax,%rbx,8), %rdx
	movq	%rdx, -224(%rbp)                # 8-byte Spill
	leaq	(%rcx,%rbx,4), %rdx
	movq	%rdx, -216(%rbp)                # 8-byte Spill
	leaq	(%rsi,%rsi,2), %rdx
	leaq	(%rcx,%rdx), %rsi
	movq	%rsi, -200(%rbp)                # 8-byte Spill
	addq	%rax, %rdx
	movq	%rdx, -208(%rbp)                # 8-byte Spill
	movq	%r12, %rdx
	movq	%r12, -240(%rbp)                # 8-byte Spill
	andq	$-2, %r12
	negq	%r12
	leaq	(%rax,%rbx,4), %rdx
	movq	%rdx, -192(%rbp)                # 8-byte Spill
	leaq	8(%rcx), %rdx
	movq	%rdx, -184(%rbp)                # 8-byte Spill
	addq	$4, %rax
	movq	%rax, -176(%rbp)                # 8-byte Spill
	leaq	4(%r15), %rax
	movq	%rax, -168(%rbp)                # 8-byte Spill
	leaq	4(%rcx), %rax
	movq	%rax, -160(%rbp)                # 8-byte Spill
	movl	$1, %eax
	vmovss	%xmm5, -48(%rbp)                # 4-byte Spill
	vmovaps	%xmm6, -112(%rbp)               # 16-byte Spill
	vmovss	%xmm7, -44(%rbp)                # 4-byte Spill
	movq	%r15, -152(%rbp)                # 8-byte Spill
	movq	%rbx, -88(%rbp)                 # 8-byte Spill
	.p2align	4, 0x90
.LBB0_3:                                # %for.cond.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_16 Depth 2
                                        #     Child Loop BB0_8 Depth 2
                                        #     Child Loop BB0_13 Depth 2
                                        #       Child Loop BB0_28 Depth 3
	movq	%rax, -128(%rbp)                # 8-byte Spill
	cmpl	$0, -80(%rbp)                   # 4-byte Folded Reload
	jle	.LBB0_11
# %bb.4:                                # %for.cond23.preheader.preheader
                                        #   in Loop: Header=BB0_3 Depth=1
	movl	%r13d, %ebx
	cmpq	$3, -136(%rbp)                  # 8-byte Folded Reload
	jae	.LBB0_15
# %bb.5:                                #   in Loop: Header=BB0_3 Depth=1
	xorl	%r15d, %r15d
.LBB0_6:                                # %for.cond36.preheader.loopexit.unr-lcssa
                                        #   in Loop: Header=BB0_3 Depth=1
	cmpq	$0, -120(%rbp)                  # 8-byte Folded Reload
	movl	%ebx, %r13d
	movq	-56(%rbp), %rax                 # 8-byte Reload
	je	.LBB0_11
# %bb.7:                                # %for.cond23.preheader.epil.preheader
                                        #   in Loop: Header=BB0_3 Depth=1
	imulq	%rax, %r15
	movq	-120(%rbp), %rbx                # 8-byte Reload
	jmp	.LBB0_8
	.p2align	4, 0x90
.LBB0_10:                               # %for.inc33.epil
                                        #   in Loop: Header=BB0_8 Depth=2
	addq	%rax, %r15
	addq	$-1, %rbx
	je	.LBB0_11
.LBB0_8:                                # %for.cond23.preheader.epil
                                        #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	testl	%r14d, %r14d
	jle	.LBB0_10
# %bb.9:                                # %for.body26.lr.ph.epil
                                        #   in Loop: Header=BB0_8 Depth=2
	movq	-72(%rbp), %rax                 # 8-byte Reload
	leaq	(%rax,%r15), %rsi
	movq	-64(%rbp), %rax                 # 8-byte Reload
	leaq	(%rax,%r15), %rdi
	movq	-56(%rbp), %rdx                 # 8-byte Reload
	callq	memcpy@PLT
	movq	-56(%rbp), %rax                 # 8-byte Reload
	vmovss	-44(%rbp), %xmm7                # 4-byte Reload
                                        # xmm7 = mem[0],zero,zero,zero
	vmovaps	-112(%rbp), %xmm6               # 16-byte Reload
	vmovss	-48(%rbp), %xmm5                # 4-byte Reload
                                        # xmm5 = mem[0],zero,zero,zero
	jmp	.LBB0_10
	.p2align	4, 0x90
.LBB0_11:                               # %for.cond36.preheader
                                        #   in Loop: Header=BB0_3 Depth=1
	vxorpd	%xmm0, %xmm0, %xmm0
	cmpl	$3, -80(%rbp)                   # 4-byte Folded Reload
	movq	-152(%rbp), %r15                # 8-byte Reload
	movq	-88(%rbp), %rbx                 # 8-byte Reload
	jl	.LBB0_33
# %bb.12:                               # %for.cond41.preheader.preheader
                                        #   in Loop: Header=BB0_3 Depth=1
	vxorpd	%xmm0, %xmm0, %xmm0
	movl	$1, %r9d
	jmp	.LBB0_13
	.p2align	4, 0x90
.LBB0_14:                               # %for.cond41.preheader.for.inc97_crit_edge
                                        #   in Loop: Header=BB0_13 Depth=2
	addq	$1, %r9
.LBB0_32:                               # %for.inc97
                                        #   in Loop: Header=BB0_13 Depth=2
	cmpq	-272(%rbp), %r9                 # 8-byte Folded Reload
	je	.LBB0_33
.LBB0_13:                               # %for.cond41.preheader
                                        #   Parent Loop BB0_3 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_28 Depth 3
	cmpl	$2, %r14d
	jle	.LBB0_14
# %bb.25:                               # %for.body45.lr.ph
                                        #   in Loop: Header=BB0_13 Depth=2
	leaq	-1(%r9), %r8
	imulq	%rbx, %r8
	movq	%r9, %r10
	imulq	%rbx, %r10
	cmpl	$2, -248(%rbp)                  # 4-byte Folded Reload
	movq	-64(%rbp), %rax                 # 8-byte Reload
	vmovss	(%rax,%r10,4), %xmm4            # xmm4 = mem[0],zero,zero,zero
	vmovss	4(%rax,%r10,4), %xmm3           # xmm3 = mem[0],zero,zero,zero
	movl	$1, %edi
	jne	.LBB0_27
# %bb.26:                               #   in Loop: Header=BB0_13 Depth=2
	vmovaps	%xmm3, %xmm2
	vmovaps	%xmm4, %xmm1
	jmp	.LBB0_29
	.p2align	4, 0x90
.LBB0_27:                               # %for.body45.preheader
                                        #   in Loop: Header=BB0_13 Depth=2
	movq	%rbx, %rcx
	movq	-184(%rbp), %rax                # 8-byte Reload
	leaq	(%rax,%r10,4), %r11
	movq	-176(%rbp), %rax                # 8-byte Reload
	leaq	(%rax,%r10,4), %rbx
	movq	-168(%rbp), %rax                # 8-byte Reload
	leaq	(%rax,%r10,4), %rdx
	leaq	1(%r9), %rax
	imulq	%rcx, %rax
	movq	-160(%rbp), %rcx                # 8-byte Reload
	leaq	(%rcx,%rax,4), %rax
	leaq	(%rcx,%r8,4), %rcx
	movl	$1, %esi
	.p2align	4, 0x90
.LBB0_28:                               # %for.body45
                                        #   Parent Loop BB0_3 Depth=1
                                        #     Parent Loop BB0_13 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	vmovss	-4(%r11,%rsi,4), %xmm1          # xmm1 = mem[0],zero,zero,zero
	vmovss	-4(%rcx,%rsi,4), %xmm2          # xmm2 = mem[0],zero,zero,zero
	vinsertps	$16, %xmm4, %xmm2, %xmm2 # xmm2 = xmm2[0],xmm4[0],xmm2[2,3]
	vmovss	-4(%rax,%rsi,4), %xmm4          # xmm4 = mem[0],zero,zero,zero
	vinsertps	$16, %xmm1, %xmm4, %xmm4 # xmm4 = xmm4[0],xmm1[0],xmm4[2,3]
	vaddps	%xmm4, %xmm2, %xmm2
	vmulps	%xmm2, %xmm6, %xmm2
	vmovshdup	%xmm2, %xmm4            # xmm4 = xmm2[1,1,3,3]
	vaddss	%xmm4, %xmm2, %xmm2
	vmulss	%xmm7, %xmm3, %xmm4
	vaddss	%xmm2, %xmm4, %xmm2
	vsubss	-4(%rdx,%rsi,4), %xmm2, %xmm2
	vdivss	%xmm7, %xmm2, %xmm2
	vmulss	%xmm5, %xmm2, %xmm4
	vsubss	%xmm4, %xmm3, %xmm4
	vmovss	%xmm4, -4(%rbx,%rsi,4)
	vmulss	%xmm2, %xmm2, %xmm2
	vaddss	%xmm2, %xmm0, %xmm0
	leaq	2(%rsi), %rdi
	vmovss	(%r11,%rsi,4), %xmm2            # xmm2 = mem[0],zero,zero,zero
	vmovss	(%rcx,%rsi,4), %xmm4            # xmm4 = mem[0],zero,zero,zero
	vinsertps	$16, %xmm3, %xmm4, %xmm3 # xmm3 = xmm4[0],xmm3[0],xmm4[2,3]
	vmovss	(%rax,%rsi,4), %xmm4            # xmm4 = mem[0],zero,zero,zero
	vinsertps	$16, %xmm2, %xmm4, %xmm4 # xmm4 = xmm4[0],xmm2[0],xmm4[2,3]
	vaddps	%xmm4, %xmm3, %xmm3
	vmulps	%xmm3, %xmm6, %xmm3
	vmovshdup	%xmm3, %xmm4            # xmm4 = xmm3[1,1,3,3]
	vaddss	%xmm4, %xmm3, %xmm3
	vmulss	%xmm7, %xmm1, %xmm4
	vaddss	%xmm3, %xmm4, %xmm3
	vsubss	(%rdx,%rsi,4), %xmm3, %xmm3
	vdivss	%xmm7, %xmm3, %xmm3
	vmulss	%xmm5, %xmm3, %xmm4
	vsubss	%xmm4, %xmm1, %xmm4
	vmovss	%xmm4, (%rbx,%rsi,4)
	vmulss	%xmm3, %xmm3, %xmm3
	vaddss	%xmm3, %xmm0, %xmm0
	addq	%r12, %rsi
	addq	$2, %rsi
	cmpq	$1, %rsi
	vmovaps	%xmm2, %xmm3
	vmovaps	%xmm1, %xmm4
	movq	%rdi, %rsi
	jne	.LBB0_28
.LBB0_29:                               # %for.inc97.loopexit.unr-lcssa
                                        #   in Loop: Header=BB0_13 Depth=2
	addq	$1, %r9
	testb	$1, -240(%rbp)                  # 1-byte Folded Reload
	jne	.LBB0_31
# %bb.30:                               #   in Loop: Header=BB0_13 Depth=2
	movq	-88(%rbp), %rbx                 # 8-byte Reload
	jmp	.LBB0_32
	.p2align	4, 0x90
.LBB0_31:                               # %for.body45.epil
                                        #   in Loop: Header=BB0_13 Depth=2
	movq	%r9, %rax
	movq	-88(%rbp), %rbx                 # 8-byte Reload
	imulq	%rbx, %rax
	movq	-64(%rbp), %rdx                 # 8-byte Reload
	leaq	(%rdx,%r8,4), %rcx
	leaq	(%rdx,%rax,4), %rax
	leaq	(%rdx,%r10,4), %rdx
	leaq	(%r15,%r10,4), %rsi
	vmovss	(%rcx,%rdi,4), %xmm3            # xmm3 = mem[0],zero,zero,zero
	vinsertps	$16, %xmm1, %xmm3, %xmm1 # xmm1 = xmm3[0],xmm1[0],xmm3[2,3]
	vmovss	(%rax,%rdi,4), %xmm3            # xmm3 = mem[0],zero,zero,zero
	vinsertps	$16, 4(%rdx,%rdi,4), %xmm3, %xmm3 # xmm3 = xmm3[0],mem[0],xmm3[2,3]
	vaddps	%xmm3, %xmm1, %xmm1
	vmulps	%xmm1, %xmm6, %xmm1
	vmovshdup	%xmm1, %xmm3            # xmm3 = xmm1[1,1,3,3]
	vaddss	%xmm3, %xmm1, %xmm1
	vmulss	%xmm7, %xmm2, %xmm3
	vaddss	%xmm1, %xmm3, %xmm1
	vsubss	(%rsi,%rdi,4), %xmm1, %xmm1
	movq	-72(%rbp), %rax                 # 8-byte Reload
	leaq	(%rax,%r10,4), %rax
	vdivss	%xmm7, %xmm1, %xmm1
	vmulss	%xmm5, %xmm1, %xmm3
	vsubss	%xmm3, %xmm2, %xmm2
	vmovss	%xmm2, (%rax,%rdi,4)
	vmulss	%xmm1, %xmm1, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	jmp	.LBB0_32
	.p2align	4, 0x90
.LBB0_33:                               # %for.end99
                                        #   in Loop: Header=BB0_3 Depth=1
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vucomisd	.LCPI0_3, %xmm0
	jb	.LBB0_35
# %bb.34:                               #   in Loop: Header=BB0_3 Depth=1
	vsqrtsd	%xmm0, %xmm0, %xmm0
	jmp	.LBB0_36
	.p2align	4, 0x90
.LBB0_35:                               # %call.sqrt
                                        #   in Loop: Header=BB0_3 Depth=1
	callq	sqrt
	vmovss	-44(%rbp), %xmm7                # 4-byte Reload
                                        # xmm7 = mem[0],zero,zero,zero
	vmovaps	-112(%rbp), %xmm6               # 16-byte Reload
	vmovss	-48(%rbp), %xmm5                # 4-byte Reload
                                        # xmm5 = mem[0],zero,zero,zero
.LBB0_36:                               # %for.end99.split
                                        #   in Loop: Header=BB0_3 Depth=1
	movq	-128(%rbp), %rax                # 8-byte Reload
	vdivsd	-144(%rbp), %xmm0, %xmm0        # 8-byte Folded Reload
	vcvtsd2ss	%xmm0, %xmm0, %xmm3
	leal	1(%rax), %esi
	vucomiss	-92(%rbp), %xmm3                # 4-byte Folded Reload
	jbe	.LBB0_38
# %bb.37:                               # %for.end99.split
                                        #   in Loop: Header=BB0_3 Depth=1
	cmpl	%r13d, %eax
	movl	%esi, %eax
	jl	.LBB0_3
	jmp	.LBB0_38
	.p2align	4, 0x90
.LBB0_15:                               # %for.cond23.preheader.preheader209
                                        #   in Loop: Header=BB0_3 Depth=1
	xorl	%r13d, %r13d
	xorl	%r15d, %r15d
	jmp	.LBB0_16
	.p2align	4, 0x90
.LBB0_24:                               # %for.inc33.3
                                        #   in Loop: Header=BB0_16 Depth=2
	addq	$4, %r15
	addq	-256(%rbp), %r13                # 8-byte Folded Reload
	cmpq	%r15, -264(%rbp)                # 8-byte Folded Reload
	je	.LBB0_6
.LBB0_16:                               # %for.cond23.preheader
                                        #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	testl	%r14d, %r14d
	jle	.LBB0_18
# %bb.17:                               # %for.body26.lr.ph
                                        #   in Loop: Header=BB0_16 Depth=2
	movq	-72(%rbp), %rax                 # 8-byte Reload
	leaq	(%rax,%r13), %rsi
	movq	-64(%rbp), %rax                 # 8-byte Reload
	leaq	(%rax,%r13), %rdi
	movq	-56(%rbp), %rdx                 # 8-byte Reload
	callq	memcpy@PLT
	vmovss	-44(%rbp), %xmm7                # 4-byte Reload
                                        # xmm7 = mem[0],zero,zero,zero
	vmovaps	-112(%rbp), %xmm6               # 16-byte Reload
	vmovss	-48(%rbp), %xmm5                # 4-byte Reload
                                        # xmm5 = mem[0],zero,zero,zero
.LBB0_18:                               # %for.inc33
                                        #   in Loop: Header=BB0_16 Depth=2
	testl	%r14d, %r14d
	jle	.LBB0_20
# %bb.19:                               # %for.body26.lr.ph.1
                                        #   in Loop: Header=BB0_16 Depth=2
	movq	-192(%rbp), %rax                # 8-byte Reload
	leaq	(%rax,%r13), %rsi
	movq	-216(%rbp), %rax                # 8-byte Reload
	leaq	(%rax,%r13), %rdi
	movq	-56(%rbp), %rdx                 # 8-byte Reload
	callq	memcpy@PLT
	vmovss	-44(%rbp), %xmm7                # 4-byte Reload
                                        # xmm7 = mem[0],zero,zero,zero
	vmovaps	-112(%rbp), %xmm6               # 16-byte Reload
	vmovss	-48(%rbp), %xmm5                # 4-byte Reload
                                        # xmm5 = mem[0],zero,zero,zero
.LBB0_20:                               # %for.inc33.1
                                        #   in Loop: Header=BB0_16 Depth=2
	testl	%r14d, %r14d
	jle	.LBB0_22
# %bb.21:                               # %for.body26.lr.ph.2
                                        #   in Loop: Header=BB0_16 Depth=2
	movq	-224(%rbp), %rax                # 8-byte Reload
	leaq	(%rax,%r13), %rsi
	movq	-232(%rbp), %rax                # 8-byte Reload
	leaq	(%rax,%r13), %rdi
	movq	-56(%rbp), %rdx                 # 8-byte Reload
	callq	memcpy@PLT
	vmovss	-44(%rbp), %xmm7                # 4-byte Reload
                                        # xmm7 = mem[0],zero,zero,zero
	vmovaps	-112(%rbp), %xmm6               # 16-byte Reload
	vmovss	-48(%rbp), %xmm5                # 4-byte Reload
                                        # xmm5 = mem[0],zero,zero,zero
.LBB0_22:                               # %for.inc33.2
                                        #   in Loop: Header=BB0_16 Depth=2
	testl	%r14d, %r14d
	jle	.LBB0_24
# %bb.23:                               # %for.body26.lr.ph.3
                                        #   in Loop: Header=BB0_16 Depth=2
	movq	-208(%rbp), %rax                # 8-byte Reload
	leaq	(%rax,%r13), %rsi
	movq	-200(%rbp), %rax                # 8-byte Reload
	leaq	(%rax,%r13), %rdi
	movq	-56(%rbp), %rdx                 # 8-byte Reload
	callq	memcpy@PLT
	vmovss	-44(%rbp), %xmm7                # 4-byte Reload
                                        # xmm7 = mem[0],zero,zero,zero
	vmovaps	-112(%rbp), %xmm6               # 16-byte Reload
	vmovss	-48(%rbp), %xmm5                # 4-byte Reload
                                        # xmm5 = mem[0],zero,zero,zero
	jmp	.LBB0_24
.LBB0_38:                               # %while.end
	vmovss	%xmm3, -56(%rbp)                # 4-byte Spill
	movl	$.L.str, %edi
	xorl	%eax, %eax
	callq	printf
	vmovss	-56(%rbp), %xmm0                # 4-byte Reload
                                        # xmm0 = mem[0],zero,zero,zero
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	movl	$.L.str.1, %edi
	movb	$1, %al
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	jmp	printf                          # TAILCALL
.Lfunc_end0:
	.size	jacobi_seq, .Lfunc_end0-jacobi_seq
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2                               # -- Begin function jacobi_omp
.LCPI1_0:
	.long	0x3f800000                      # float 1
.LCPI1_2:
	.long	0x41200000                      # float 10
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3
.LCPI1_1:
	.quad	0xc000000000000000              # double -2
.LCPI1_3:
	.quad	0x0000000000000000              # double 0
	.text
	.globl	jacobi_omp
	.p2align	4, 0x90
	.type	jacobi_omp,@function
jacobi_omp:                             # @jacobi_omp
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
	subq	$248, %rsp
	.cfi_def_cfa_offset 304
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movl	%r8d, %ebx
	vmovss	%xmm4, 28(%rsp)                 # 4-byte Spill
	movq	%rcx, %rbp
	movq	%rdx, 72(%rsp)                  # 8-byte Spill
	vmovss	%xmm3, 12(%rsp)                 # 4-byte Spill
	vmovss	%xmm2, 48(%rsp)                 # 4-byte Spill
	vmovaps	%xmm1, 32(%rsp)                 # 16-byte Spill
	vmovaps	%xmm0, 96(%rsp)                 # 16-byte Spill
	movl	%esi, %r14d
	movl	%edi, %r15d
	movslq	%edi, %rax
	movslq	%esi, %rdi
	imulq	%rax, %rdi
	shlq	$2, %rdi
	callq	malloc
	movq	%rax, 16(%rsp)                  # 8-byte Spill
	vmovss	28(%rsp), %xmm1                 # 4-byte Reload
                                        # xmm1 = mem[0],zero,zero,zero
	vmulss	.LCPI1_2(%rip), %xmm1, %xmm0
	vucomiss	%xmm1, %xmm0
	movl	$1, %esi
	jbe	.LBB1_33
# %bb.1:                                # %entry
	testl	%ebx, %ebx
	vmovss	12(%rsp), %xmm8                 # 4-byte Reload
                                        # xmm8 = mem[0],zero,zero,zero
	jle	.LBB1_33
# %bb.2:                                # %for.cond.preheader.lr.ph
	movl	%r14d, %edx
	vmovaps	96(%rsp), %xmm0                 # 16-byte Reload
	vinsertps	$16, 32(%rsp), %xmm0, %xmm0 # 16-byte Folded Reload
                                        # xmm0 = xmm0[0],mem[0],xmm0[2,3]
	vmulps	%xmm0, %xmm0, %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm1
	vmovshdup	%xmm0, %xmm2            # xmm2 = xmm0[1,1,3,3]
	vcvtss2sd	%xmm2, %xmm2, %xmm2
	vbroadcastss	.LCPI1_0(%rip), %xmm3   # xmm3 = [1.0E+0,1.0E+0,1.0E+0,1.0E+0]
	vdivps	%xmm0, %xmm3, %xmm7
	vmovsd	.LCPI1_1(%rip), %xmm0           # xmm0 = mem[0],zero
	vdivsd	%xmm1, %xmm0, %xmm1
	vdivsd	%xmm2, %xmm0, %xmm0
	vaddsd	%xmm0, %xmm1, %xmm0
	vmovss	48(%rsp), %xmm1                 # 4-byte Reload
                                        # xmm1 = mem[0],zero,zero,zero
	vcvtss2sd	%xmm1, %xmm1, %xmm1
	vsubsd	%xmm1, %xmm0, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm6
	movl	%r14d, %eax
	imull	%r15d, %eax
	vcvtsi2sd	%eax, %xmm5, %xmm0
	vmovsd	%xmm0, 168(%rsp)                # 8-byte Spill
	leaq	(,%rdx,4), %r13
	leal	-2(%r14), %r12d
	leal	-1(%r15), %eax
	movq	%rax, 96(%rsp)                  # 8-byte Spill
	movl	%r15d, %eax
	leaq	-1(%rax), %rcx
	movq	%rcx, 160(%rsp)                 # 8-byte Spill
	movl	%eax, %ecx
	andl	$3, %ecx
	movq	%rcx, 80(%rsp)                  # 8-byte Spill
	andl	$-4, %eax
	movq	%rax, 120(%rsp)                 # 8-byte Spill
	movq	72(%rsp), %rcx                  # 8-byte Reload
	leaq	(%rcx,%rdx,8), %rax
	movq	%rax, 224(%rsp)                 # 8-byte Spill
	movq	%rdx, %rax
	shlq	$4, %rax
	movq	%rax, 240(%rsp)                 # 8-byte Spill
	movq	16(%rsp), %rax                  # 8-byte Reload
	leaq	(%rax,%rdx,8), %rsi
	movq	%rsi, 216(%rsp)                 # 8-byte Spill
	leaq	(%rcx,%rdx,4), %rsi
	movq	%rsi, 208(%rsp)                 # 8-byte Spill
	leaq	(%rax,%rdx,4), %rsi
	movq	%rsi, 200(%rsp)                 # 8-byte Spill
	leaq	(,%r13,2), %rsi
	addq	%r13, %rsi
	leaq	(%rcx,%rsi), %rdi
	movq	%rdi, 184(%rsp)                 # 8-byte Spill
	addq	%rax, %rsi
	movq	%rsi, 192(%rsp)                 # 8-byte Spill
	leaq	4(,%rdx,4), %rsi
	addq	%rbp, %rsi
	movq	%rsi, 152(%rsp)                 # 8-byte Spill
	leaq	8(%rax,%rdx,4), %rsi
	movq	%rsi, 144(%rsp)                 # 8-byte Spill
	leaq	4(%rcx,%rdx,4), %rcx
	movq	%rcx, 136(%rsp)                 # 8-byte Spill
	movq	%rdx, 232(%rsp)                 # 8-byte Spill
	leaq	4(%rax,%rdx,8), %rax
	movq	%rax, 128(%rsp)                 # 8-byte Spill
	movl	$1, %eax
	vmovaps	%xmm7, 48(%rsp)                 # 16-byte Spill
	vmovss	%xmm6, 32(%rsp)                 # 4-byte Spill
	movl	%ebx, 24(%rsp)                  # 4-byte Spill
	movq	%r15, 176(%rsp)                 # 8-byte Spill
	.p2align	4, 0x90
.LBB1_3:                                # %for.cond.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_21 Depth 2
                                        #     Child Loop BB1_8 Depth 2
                                        #     Child Loop BB1_13 Depth 2
                                        #       Child Loop BB1_15 Depth 3
	movq	%rax, 88(%rsp)                  # 8-byte Spill
	testl	%r15d, %r15d
	jle	.LBB1_11
# %bb.4:                                # %for.body.preheader
                                        #   in Loop: Header=BB1_3 Depth=1
	cmpq	$3, 160(%rsp)                   # 8-byte Folded Reload
	jae	.LBB1_20
# %bb.5:                                #   in Loop: Header=BB1_3 Depth=1
	xorl	%r15d, %r15d
.LBB1_6:                                # %for.cond51.preheader.loopexit.unr-lcssa
                                        #   in Loop: Header=BB1_3 Depth=1
	cmpq	$0, 80(%rsp)                    # 8-byte Folded Reload
	je	.LBB1_11
# %bb.7:                                # %for.body.epil.preheader
                                        #   in Loop: Header=BB1_3 Depth=1
	imulq	%r13, %r15
	movq	80(%rsp), %rbx                  # 8-byte Reload
	jmp	.LBB1_8
	.p2align	4, 0x90
.LBB1_10:                               # %simd.if.end.epil
                                        #   in Loop: Header=BB1_8 Depth=2
	addq	%r13, %r15
	addq	$-1, %rbx
	je	.LBB1_11
.LBB1_8:                                # %for.body.epil
                                        #   Parent Loop BB1_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	testl	%r14d, %r14d
	jle	.LBB1_10
# %bb.9:                                # %omp.inner.for.body.lr.ph.epil
                                        #   in Loop: Header=BB1_8 Depth=2
	movq	72(%rsp), %rax                  # 8-byte Reload
	leaq	(%rax,%r15), %rsi
	movq	16(%rsp), %rax                  # 8-byte Reload
	leaq	(%rax,%r15), %rdi
	movq	%r13, %rdx
	callq	memcpy@PLT
	vmovss	32(%rsp), %xmm6                 # 4-byte Reload
                                        # xmm6 = mem[0],zero,zero,zero
	vmovaps	48(%rsp), %xmm7                 # 16-byte Reload
	vmovss	12(%rsp), %xmm8                 # 4-byte Reload
                                        # xmm8 = mem[0],zero,zero,zero
	jmp	.LBB1_10
	.p2align	4, 0x90
.LBB1_11:                               # %for.cond51.preheader
                                        #   in Loop: Header=BB1_3 Depth=1
	vxorpd	%xmm0, %xmm0, %xmm0
	movq	176(%rsp), %r15                 # 8-byte Reload
	cmpl	$3, %r15d
	jl	.LBB1_18
# %bb.12:                               # %for.body55.preheader
                                        #   in Loop: Header=BB1_3 Depth=1
	vxorpd	%xmm0, %xmm0, %xmm0
	movl	$1, %r8d
	movq	16(%rsp), %rcx                  # 8-byte Reload
	movq	128(%rsp), %rdx                 # 8-byte Reload
	movq	152(%rsp), %rsi                 # 8-byte Reload
	movq	136(%rsp), %rdi                 # 8-byte Reload
	movq	144(%rsp), %rbp                 # 8-byte Reload
	jmp	.LBB1_13
	.p2align	4, 0x90
.LBB1_17:                               # %simd.if.end136
                                        #   in Loop: Header=BB1_13 Depth=2
	addq	$1, %r8
	addq	%r13, %rbp
	addq	%r13, %rdi
	addq	%r13, %rsi
	addq	%r13, %rdx
	addq	%r13, %rcx
	cmpq	96(%rsp), %r8                   # 8-byte Folded Reload
	je	.LBB1_18
.LBB1_13:                               # %for.body55
                                        #   Parent Loop BB1_3 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_15 Depth 3
	cmpl	$3, %r14d
	jl	.LBB1_17
# %bb.14:                               # %omp.inner.for.body75.lr.ph
                                        #   in Loop: Header=BB1_13 Depth=2
	movq	%r8, %rax
	imulq	232(%rsp), %rax                 # 8-byte Folded Reload
	movq	16(%rsp), %rbx                  # 8-byte Reload
	vmovss	(%rbx,%rax,4), %xmm3            # xmm3 = mem[0],zero,zero,zero
	vmovss	4(%rbx,%rax,4), %xmm2           # xmm2 = mem[0],zero,zero,zero
	vxorps	%xmm1, %xmm1, %xmm1
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB1_15:                               # %omp.inner.for.body75
                                        #   Parent Loop BB1_3 Depth=1
                                        #     Parent Loop BB1_13 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	vmovss	4(%rcx,%rbx,4), %xmm4           # xmm4 = mem[0],zero,zero,zero
	vinsertps	$16, %xmm3, %xmm4, %xmm3 # xmm3 = xmm4[0],xmm3[0],xmm4[2,3]
	vmovaps	%xmm2, %xmm4
	vmovss	(%rbp,%rbx,4), %xmm2            # xmm2 = mem[0],zero,zero,zero
	vmovss	(%rdx,%rbx,4), %xmm5            # xmm5 = mem[0],zero,zero,zero
	vinsertps	$16, %xmm2, %xmm5, %xmm5 # xmm5 = xmm5[0],xmm2[0],xmm5[2,3]
	vaddps	%xmm5, %xmm3, %xmm3
	vmulps	%xmm3, %xmm7, %xmm3
	vmovshdup	%xmm3, %xmm5            # xmm5 = xmm3[1,1,3,3]
	vaddss	%xmm5, %xmm3, %xmm3
	vmulss	%xmm6, %xmm4, %xmm5
	vaddss	%xmm3, %xmm5, %xmm3
	vsubss	(%rsi,%rbx,4), %xmm3, %xmm3
	vdivss	%xmm6, %xmm3, %xmm3
	vmulss	%xmm3, %xmm8, %xmm5
	vsubss	%xmm5, %xmm4, %xmm5
	vmovss	%xmm5, (%rdi,%rbx,4)
	addq	$1, %rbx
	vmulss	%xmm3, %xmm3, %xmm3
	vaddss	%xmm3, %xmm1, %xmm1
	cmpq	%rbx, %r12
	vmovaps	%xmm4, %xmm3
	jne	.LBB1_15
# %bb.16:                               # %omp.inner.for.end130
                                        #   in Loop: Header=BB1_13 Depth=2
	vaddss	%xmm1, %xmm0, %xmm0
	jmp	.LBB1_17
	.p2align	4, 0x90
.LBB1_18:                               # %for.end139
                                        #   in Loop: Header=BB1_3 Depth=1
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vucomisd	.LCPI1_3, %xmm0
	jb	.LBB1_30
# %bb.19:                               #   in Loop: Header=BB1_3 Depth=1
	vsqrtsd	%xmm0, %xmm0, %xmm0
	jmp	.LBB1_31
	.p2align	4, 0x90
.LBB1_30:                               # %call.sqrt
                                        #   in Loop: Header=BB1_3 Depth=1
	callq	sqrt
	vmovss	32(%rsp), %xmm6                 # 4-byte Reload
                                        # xmm6 = mem[0],zero,zero,zero
	vmovaps	48(%rsp), %xmm7                 # 16-byte Reload
	vmovss	12(%rsp), %xmm8                 # 4-byte Reload
                                        # xmm8 = mem[0],zero,zero,zero
.LBB1_31:                               # %for.end139.split
                                        #   in Loop: Header=BB1_3 Depth=1
	movl	24(%rsp), %ebx                  # 4-byte Reload
	movq	88(%rsp), %rax                  # 8-byte Reload
	vdivsd	168(%rsp), %xmm0, %xmm0         # 8-byte Folded Reload
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	leal	1(%rax), %esi
	vucomiss	28(%rsp), %xmm0                 # 4-byte Folded Reload
	jbe	.LBB1_33
# %bb.32:                               # %for.end139.split
                                        #   in Loop: Header=BB1_3 Depth=1
	cmpl	%ebx, %eax
	movl	%esi, %eax
	jl	.LBB1_3
	jmp	.LBB1_33
	.p2align	4, 0x90
.LBB1_20:                               # %for.body.preheader270
                                        #   in Loop: Header=BB1_3 Depth=1
	xorl	%ebp, %ebp
	xorl	%r15d, %r15d
	movq	120(%rsp), %rbx                 # 8-byte Reload
	jmp	.LBB1_21
	.p2align	4, 0x90
.LBB1_29:                               # %simd.if.end.3
                                        #   in Loop: Header=BB1_21 Depth=2
	addq	$4, %r15
	addq	240(%rsp), %rbp                 # 8-byte Folded Reload
	cmpq	%r15, %rbx
	je	.LBB1_6
.LBB1_21:                               # %for.body
                                        #   Parent Loop BB1_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	testl	%r14d, %r14d
	jle	.LBB1_23
# %bb.22:                               # %omp.inner.for.body.lr.ph
                                        #   in Loop: Header=BB1_21 Depth=2
	movq	72(%rsp), %rax                  # 8-byte Reload
	leaq	(%rax,%rbp), %rsi
	movq	16(%rsp), %rax                  # 8-byte Reload
	leaq	(%rax,%rbp), %rdi
	movq	%r13, %rdx
	callq	memcpy@PLT
	vmovss	32(%rsp), %xmm6                 # 4-byte Reload
                                        # xmm6 = mem[0],zero,zero,zero
	vmovaps	48(%rsp), %xmm7                 # 16-byte Reload
	vmovss	12(%rsp), %xmm8                 # 4-byte Reload
                                        # xmm8 = mem[0],zero,zero,zero
.LBB1_23:                               # %simd.if.end
                                        #   in Loop: Header=BB1_21 Depth=2
	testl	%r14d, %r14d
	jle	.LBB1_25
# %bb.24:                               # %omp.inner.for.body.lr.ph.1
                                        #   in Loop: Header=BB1_21 Depth=2
	movq	208(%rsp), %rax                 # 8-byte Reload
	leaq	(%rax,%rbp), %rsi
	movq	200(%rsp), %rax                 # 8-byte Reload
	leaq	(%rax,%rbp), %rdi
	movq	%r13, %rdx
	callq	memcpy@PLT
	vmovss	32(%rsp), %xmm6                 # 4-byte Reload
                                        # xmm6 = mem[0],zero,zero,zero
	vmovaps	48(%rsp), %xmm7                 # 16-byte Reload
	vmovss	12(%rsp), %xmm8                 # 4-byte Reload
                                        # xmm8 = mem[0],zero,zero,zero
.LBB1_25:                               # %simd.if.end.1
                                        #   in Loop: Header=BB1_21 Depth=2
	testl	%r14d, %r14d
	jle	.LBB1_27
# %bb.26:                               # %omp.inner.for.body.lr.ph.2
                                        #   in Loop: Header=BB1_21 Depth=2
	movq	224(%rsp), %rax                 # 8-byte Reload
	leaq	(%rax,%rbp), %rsi
	movq	216(%rsp), %rax                 # 8-byte Reload
	leaq	(%rax,%rbp), %rdi
	movq	%r13, %rdx
	callq	memcpy@PLT
	vmovss	32(%rsp), %xmm6                 # 4-byte Reload
                                        # xmm6 = mem[0],zero,zero,zero
	vmovaps	48(%rsp), %xmm7                 # 16-byte Reload
	vmovss	12(%rsp), %xmm8                 # 4-byte Reload
                                        # xmm8 = mem[0],zero,zero,zero
.LBB1_27:                               # %simd.if.end.2
                                        #   in Loop: Header=BB1_21 Depth=2
	testl	%r14d, %r14d
	jle	.LBB1_29
# %bb.28:                               # %omp.inner.for.body.lr.ph.3
                                        #   in Loop: Header=BB1_21 Depth=2
	movq	184(%rsp), %rax                 # 8-byte Reload
	leaq	(%rax,%rbp), %rsi
	movq	192(%rsp), %rax                 # 8-byte Reload
	leaq	(%rax,%rbp), %rdi
	movq	%r13, %rdx
	callq	memcpy@PLT
	vmovss	32(%rsp), %xmm6                 # 4-byte Reload
                                        # xmm6 = mem[0],zero,zero,zero
	vmovaps	48(%rsp), %xmm7                 # 16-byte Reload
	vmovss	12(%rsp), %xmm8                 # 4-byte Reload
                                        # xmm8 = mem[0],zero,zero,zero
	jmp	.LBB1_29
.LBB1_33:                               # %while.end
	vmovss	%xmm0, 12(%rsp)                 # 4-byte Spill
	movl	$.L.str, %edi
	xorl	%eax, %eax
	callq	printf
	vmovss	12(%rsp), %xmm0                 # 4-byte Reload
                                        # xmm0 = mem[0],zero,zero,zero
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf
	movq	16(%rsp), %rdi                  # 8-byte Reload
	addq	$248, %rsp
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
	jmp	free                            # TAILCALL
.Lfunc_end1:
	.size	jacobi_omp, .Lfunc_end1-jacobi_omp
	.cfi_endproc
                                        # -- End function
	.globl	print_array                     # -- Begin function print_array
	.p2align	4, 0x90
	.type	print_array,@function
print_array:                            # @print_array
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
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movl	%r8d, 12(%rsp)                  # 4-byte Spill
	movl	%ecx, %ebx
	movq	%rdx, %r12
	movq	%rsi, %r15
	movq	%rdi, %rsi
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	callq	printf
	testl	%ebx, %ebx
	jle	.LBB2_6
# %bb.1:                                # %for.cond1.preheader.lr.ph
	movslq	12(%rsp), %r13                  # 4-byte Folded Reload
	movl	%ebx, %eax
	movq	%rax, 16(%rsp)                  # 8-byte Spill
	movl	%r13d, %r14d
	shlq	$2, %r13
	xorl	%ebp, %ebp
	jmp	.LBB2_2
	.p2align	4, 0x90
.LBB2_5:                                # %for.end
                                        #   in Loop: Header=BB2_2 Depth=1
	movl	$10, %edi
	callq	putchar@PLT
	addq	$1, %rbp
	addq	%r13, %r12
	cmpq	16(%rsp), %rbp                  # 8-byte Folded Reload
	je	.LBB2_6
.LBB2_2:                                # %for.cond1.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_4 Depth 2
	cmpl	$0, 12(%rsp)                    # 4-byte Folded Reload
	jle	.LBB2_5
# %bb.3:                                # %for.body3.lr.ph
                                        #   in Loop: Header=BB2_2 Depth=1
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB2_4:                                # %for.body3
                                        #   Parent Loop BB2_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vmovss	(%r12,%rbx,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	movl	$.L.str.3, %edi
	movq	%r15, %rsi
	movl	%ebp, %edx
	movl	%ebx, %ecx
	movb	$1, %al
	callq	printf
	addq	$1, %rbx
	cmpq	%rbx, %r14
	jne	.LBB2_4
	jmp	.LBB2_5
.LBB2_6:                                # %for.end8
	movl	$10, %edi
	addq	$24, %rsp
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
	jmp	putchar@PLT                     # TAILCALL
.Lfunc_end2:
	.size	print_array, .Lfunc_end2-print_array
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3                               # -- Begin function initialize
.LCPI3_0:
	.quad	0x4000000000000000              # double 2
.LCPI3_2:
	.quad	0xbff0000000000000              # double -1
.LCPI3_3:
	.quad	0x3ff0000000000000              # double 1
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI3_1:
	.quad	0x8000000000000000              # double -0
	.quad	0x8000000000000000              # double -0
	.section	.rodata,"a",@progbits
	.p2align	6
.LCPI3_4:
	.long	0                               # 0x0
	.long	1                               # 0x1
	.long	2                               # 0x2
	.long	3                               # 0x3
	.long	4                               # 0x4
	.long	5                               # 0x5
	.long	6                               # 0x6
	.long	7                               # 0x7
	.long	8                               # 0x8
	.long	9                               # 0x9
	.long	10                              # 0xa
	.long	11                              # 0xb
	.long	12                              # 0xc
	.long	13                              # 0xd
	.long	14                              # 0xe
	.long	15                              # 0xf
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2
.LCPI3_5:
	.long	16                              # 0x10
	.text
	.globl	initialize
	.p2align	4, 0x90
	.type	initialize,@function
initialize:                             # @initialize
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
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
                                        # kill: def $edi killed $edi def $rdi
	leal	-1(%rdi), %eax
	vcvtsi2sd	%eax, %xmm1, %xmm1
	vmovsd	.LCPI3_0(%rip), %xmm2           # xmm2 = mem[0],zero
	vdivsd	%xmm1, %xmm2, %xmm1
	vcvtsd2ss	%xmm1, %xmm1, %xmm1
	vmovss	%xmm1, (%rdx)
	movq	%r9, -24(%rsp)                  # 8-byte Spill
	movq	%r8, -32(%rsp)                  # 8-byte Spill
                                        # kill: def $esi killed $esi def $rsi
	leal	-1(%rsi), %eax
	vcvtsi2sd	%eax, %xmm3, %xmm1
	vdivsd	%xmm1, %xmm2, %xmm1
	vcvtsd2ss	%xmm1, %xmm1, %xmm1
	vmovss	%xmm1, (%rcx)
	testl	%edi, %edi
	jle	.LBB3_16
# %bb.1:                                # %for.cond7.preheader.lr.ph
	movl	%esi, %r12d
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vxorps	.LCPI3_1(%rip), %xmm0, %xmm0
	movl	%edi, %r8d
	leaq	1(%rdx), %rax
	movq	%rax, -8(%rsp)                  # 8-byte Spill
	leaq	1(%rcx), %rax
	movq	%rax, -16(%rsp)                 # 8-byte Spill
	movl	%r12d, %r9d
	andl	$-16, %r9d
	vbroadcastsd	%xmm0, %zmm15
	leaq	(,%r12,4), %r10
	xorl	%r13d, %r13d
	vmovsd	.LCPI3_2(%rip), %xmm2           # xmm2 = mem[0],zero
	vbroadcastsd	.LCPI3_2(%rip), %zmm20  # zmm20 = [-1.0E+0,-1.0E+0,-1.0E+0,-1.0E+0,-1.0E+0,-1.0E+0,-1.0E+0,-1.0E+0]
	vmovsd	.LCPI3_3(%rip), %xmm4           # xmm4 = mem[0],zero
	vbroadcastsd	.LCPI3_3(%rip), %zmm5   # zmm5 = [1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0]
	vmovdqa64	.LCPI3_4(%rip), %zmm16  # zmm16 = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
	vpternlogd	$255, %zmm19, %zmm19, %zmm19
	vxorps	%xmm8, %xmm8, %xmm8
	vpbroadcastd	.LCPI3_5(%rip), %zmm9   # zmm9 = [16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16]
	movq	-24(%rsp), %r14                 # 8-byte Reload
	movq	-32(%rsp), %rdi                 # 8-byte Reload
	movq	%rsi, -40(%rsp)                 # 8-byte Spill
	movq	%r8, -48(%rsp)                  # 8-byte Spill
	movq	%r10, -56(%rsp)                 # 8-byte Spill
	jmp	.LBB3_2
	.p2align	4, 0x90
.LBB3_15:                               # %for.inc48
                                        #   in Loop: Header=BB3_2 Depth=1
	addq	$1, %r13
	addq	%r10, %rdi
	addq	%r10, %r14
	cmpq	%r8, %r13
	je	.LBB3_16
.LBB3_2:                                # %for.cond7.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_12 Depth 2
                                        #     Child Loop BB3_14 Depth 2
	testl	%esi, %esi
	jle	.LBB3_15
# %bb.3:                                # %for.body10.lr.ph
                                        #   in Loop: Header=BB3_2 Depth=1
	leal	-1(%r13), %eax
	cmpl	$16, %esi
	vcvtsi2ss	%eax, %xmm21, %xmm6
	jae	.LBB3_5
# %bb.4:                                #   in Loop: Header=BB3_2 Depth=1
	xorl	%ebp, %ebp
	jmp	.LBB3_14
	.p2align	4, 0x90
.LBB3_5:                                # %vector.memcheck
                                        #   in Loop: Header=BB3_2 Depth=1
	movq	%r13, %rsi
	imulq	%r12, %rsi
	leaq	(%rsi,%r12), %r8
	movq	-32(%rsp), %rax                 # 8-byte Reload
	leaq	(%rax,%rsi,4), %rbp
	leaq	(%rax,%r8,4), %r11
	movq	-24(%rsp), %rax                 # 8-byte Reload
	leaq	(%rax,%rsi,4), %rsi
	leaq	(%rax,%r8,4), %r8
	cmpq	%r8, %rbp
	setb	-57(%rsp)                       # 1-byte Folded Spill
	cmpq	%r11, %rsi
	setb	-58(%rsp)                       # 1-byte Folded Spill
	movq	-8(%rsp), %rbx                  # 8-byte Reload
	cmpq	%rbp, %rbx
	seta	%r15b
	cmpq	%rdx, %r11
	seta	-59(%rsp)                       # 1-byte Folded Spill
	movq	-16(%rsp), %rax                 # 8-byte Reload
	cmpq	%rbp, %rax
	seta	%r10b
	cmpq	%rcx, %r11
	seta	%bpl
	cmpq	%rsi, %rbx
	seta	%r11b
	cmpq	%rdx, %r8
	seta	-60(%rsp)                       # 1-byte Folded Spill
	cmpq	%rsi, %rax
	seta	%bl
	cmpq	%rcx, %r8
	seta	%sil
	movb	-58(%rsp), %al                  # 1-byte Reload
	testb	%al, -57(%rsp)                  # 1-byte Folded Reload
	jne	.LBB3_6
# %bb.7:                                # %vector.memcheck
                                        #   in Loop: Header=BB3_2 Depth=1
	andb	-59(%rsp), %r15b                # 1-byte Folded Reload
	jne	.LBB3_6
# %bb.8:                                # %vector.memcheck
                                        #   in Loop: Header=BB3_2 Depth=1
	andb	%bpl, %r10b
	jne	.LBB3_6
# %bb.9:                                # %vector.memcheck
                                        #   in Loop: Header=BB3_2 Depth=1
	andb	-60(%rsp), %r11b                # 1-byte Folded Reload
	jne	.LBB3_6
# %bb.10:                               # %vector.memcheck
                                        #   in Loop: Header=BB3_2 Depth=1
	andb	%sil, %bl
	movl	$0, %ebp
	movq	-40(%rsp), %rsi                 # 8-byte Reload
	movq	-48(%rsp), %r8                  # 8-byte Reload
	movq	-56(%rsp), %r10                 # 8-byte Reload
	jne	.LBB3_14
# %bb.11:                               # %vector.ph
                                        #   in Loop: Header=BB3_2 Depth=1
	vmulss	(%rdx), %xmm6, %xmm1
	vbroadcastss	%xmm1, %ymm1
	vcvtps2pd	%ymm1, %zmm1
	vaddpd	%zmm20, %zmm1, %zmm1
	vbroadcastss	(%rcx), %zmm11
	vcvttpd2dq	%zmm1, %ymm1
	vpmulld	%ymm1, %ymm1, %ymm1
	vcvtdq2pd	%ymm1, %zmm1
	vsubpd	%zmm1, %zmm5, %zmm1
	vmulpd	%zmm15, %zmm1, %zmm12
	vaddpd	%zmm1, %zmm1, %zmm13
	xorl	%ebp, %ebp
	vmovdqa64	%zmm16, %zmm14
	.p2align	4, 0x90
.LBB3_12:                               # %vector.body
                                        #   Parent Loop BB3_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vpaddd	%zmm19, %zmm14, %zmm1
	vcvtdq2ps	%zmm1, %zmm1
	vmulps	%zmm1, %zmm11, %zmm1
	vextractf64x4	$1, %zmm1, %ymm10
	vcvtps2pd	%ymm1, %zmm1
	vcvtps2pd	%ymm10, %zmm10
	vaddpd	%zmm20, %zmm10, %zmm10
	vaddpd	%zmm20, %zmm1, %zmm1
	vcvttpd2dq	%zmm10, %ymm10
	vmovups	%zmm8, (%rdi,%rbp,4)
	vpmulld	%ymm10, %ymm10, %ymm10
	vcvttpd2dq	%zmm1, %ymm1
	vpmulld	%ymm1, %ymm1, %ymm1
	vcvtdq2pd	%ymm10, %zmm10
	vcvtdq2pd	%ymm1, %zmm1
	vsubpd	%zmm1, %zmm5, %zmm1
	vsubpd	%zmm10, %zmm5, %zmm10
	vmulpd	%zmm10, %zmm12, %zmm17
	vmulpd	%zmm1, %zmm12, %zmm18
	vsubpd	%zmm13, %zmm18, %zmm18
	vaddpd	%zmm1, %zmm1, %zmm1
	vsubpd	%zmm13, %zmm17, %zmm17
	vsubpd	%zmm1, %zmm18, %zmm1
	vaddpd	%zmm10, %zmm10, %zmm10
	vsubpd	%zmm10, %zmm17, %zmm10
	vcvtpd2ps	%zmm1, %ymm1
	vcvtpd2ps	%zmm10, %ymm10
	vinsertf64x4	$1, %ymm10, %zmm1, %zmm1
	vmovups	%zmm1, (%r14,%rbp,4)
	addq	$16, %rbp
	cmpq	%rbp, %r9
	vpaddd	%zmm9, %zmm14, %zmm14
	jne	.LBB3_12
# %bb.13:                               # %middle.block
                                        #   in Loop: Header=BB3_2 Depth=1
	cmpq	%r12, %r9
	movq	%r9, %rbp
	jne	.LBB3_14
	jmp	.LBB3_15
.LBB3_6:                                #   in Loop: Header=BB3_2 Depth=1
	xorl	%ebp, %ebp
	movq	-40(%rsp), %rsi                 # 8-byte Reload
	movq	-48(%rsp), %r8                  # 8-byte Reload
	movq	-56(%rsp), %r10                 # 8-byte Reload
	.p2align	4, 0x90
.LBB3_14:                               # %for.body10
                                        #   Parent Loop BB3_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vmulss	(%rdx), %xmm6, %xmm1
	vcvtss2sd	%xmm1, %xmm1, %xmm1
	vaddsd	%xmm2, %xmm1, %xmm1
	vcvttsd2si	%xmm1, %ebx
	leal	-1(%rbp), %eax
	vcvtsi2ss	%eax, %xmm21, %xmm1
	vmulss	(%rcx), %xmm1, %xmm1
	vcvtss2sd	%xmm1, %xmm1, %xmm1
	vaddsd	%xmm2, %xmm1, %xmm1
	vcvttsd2si	%xmm1, %eax
	movl	$0, (%rdi,%rbp,4)
	imull	%ebx, %ebx
	vcvtsi2sd	%ebx, %xmm21, %xmm1
	vsubsd	%xmm1, %xmm4, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm7
	imull	%eax, %eax
	vcvtsi2sd	%eax, %xmm21, %xmm3
	vsubsd	%xmm3, %xmm4, %xmm3
	vmulsd	%xmm3, %xmm7, %xmm7
	vaddsd	%xmm1, %xmm1, %xmm1
	vsubsd	%xmm1, %xmm7, %xmm1
	vaddsd	%xmm3, %xmm3, %xmm3
	vsubsd	%xmm3, %xmm1, %xmm1
	vcvtsd2ss	%xmm1, %xmm1, %xmm1
	vmovss	%xmm1, (%r14,%rbp,4)
	addq	$1, %rbp
	cmpq	%rbp, %r12
	jne	.LBB3_14
	jmp	.LBB3_15
.LBB3_16:                               # %for.end50
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
.Lfunc_end3:
	.size	initialize, .Lfunc_end3-initialize
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2                               # -- Begin function error_check
.LCPI4_0:
	.long	0xbf800000                      # float -1
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3
.LCPI4_1:
	.quad	0x3ff0000000000000              # double 1
	.text
	.globl	error_check
	.p2align	4, 0x90
	.type	error_check,@function
error_check:                            # @error_check
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	pushq	%rax
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movl	%esi, %r15d
	movl	%edi, %r14d
	testl	%edi, %edi
	jle	.LBB4_1
# %bb.2:                                # %for.cond1.preheader.lr.ph
	movl	%r15d, %r8d
	movl	%r14d, %r9d
	movl	%r8d, %esi
	andl	$-2, %esi
	leaq	4(%rdx), %rdi
	leaq	(,%r8,4), %r10
	vxorps	%xmm4, %xmm4, %xmm4
	xorl	%ebx, %ebx
	vmovss	.LCPI4_0(%rip), %xmm8           # xmm8 = mem[0],zero,zero,zero
	vmovsd	.LCPI4_1(%rip), %xmm3           # xmm3 = mem[0],zero
	jmp	.LBB4_3
	.p2align	4, 0x90
.LBB4_10:                               # %for.inc26
                                        #   in Loop: Header=BB4_3 Depth=1
	addq	$1, %rbx
	addq	%r10, %rdi
	cmpq	%r9, %rbx
	je	.LBB4_11
.LBB4_3:                                # %for.cond1.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB4_7 Depth 2
	testl	%r15d, %r15d
	jle	.LBB4_10
# %bb.4:                                # %for.body3.lr.ph
                                        #   in Loop: Header=BB4_3 Depth=1
	leal	-1(%rbx), %ecx
	cmpl	$1, %r15d
	vcvtsi2ss	%ecx, %xmm9, %xmm5
	vmulss	%xmm1, %xmm5, %xmm5
	vaddss	%xmm5, %xmm8, %xmm5
	vmulss	%xmm5, %xmm5, %xmm5
	vcvtss2sd	%xmm5, %xmm5, %xmm5
	vsubsd	%xmm5, %xmm3, %xmm5
	jne	.LBB4_6
# %bb.5:                                #   in Loop: Header=BB4_3 Depth=1
	xorl	%ecx, %ecx
	jmp	.LBB4_8
	.p2align	4, 0x90
.LBB4_6:                                # %for.body3.preheader
                                        #   in Loop: Header=BB4_3 Depth=1
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB4_7:                                # %for.body3
                                        #   Parent Loop BB4_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	leal	-1(%rcx), %ebp
	vcvtsi2ss	%ebp, %xmm9, %xmm6
	vmulss	%xmm2, %xmm6, %xmm6
	vaddss	%xmm6, %xmm8, %xmm6
	vmovss	-4(%rdi,%rcx,4), %xmm7          # xmm7 = mem[0],zero,zero,zero
	vmovss	(%rdi,%rcx,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	vcvtss2sd	%xmm7, %xmm7, %xmm7
	vmulss	%xmm6, %xmm6, %xmm6
	vcvtss2sd	%xmm6, %xmm6, %xmm6
	vsubsd	%xmm6, %xmm3, %xmm6
	vmulsd	%xmm6, %xmm5, %xmm6
	vsubsd	%xmm6, %xmm7, %xmm6
	vcvtsd2ss	%xmm6, %xmm6, %xmm6
	vmulss	%xmm6, %xmm6, %xmm6
	vaddss	%xmm6, %xmm4, %xmm4
	vcvtsi2ss	%ecx, %xmm9, %xmm6
	vmulss	%xmm2, %xmm6, %xmm6
	vaddss	%xmm6, %xmm8, %xmm6
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vmulss	%xmm6, %xmm6, %xmm6
	vcvtss2sd	%xmm6, %xmm6, %xmm6
	vsubsd	%xmm6, %xmm3, %xmm6
	vmulsd	%xmm6, %xmm5, %xmm6
	vsubsd	%xmm6, %xmm0, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	vmulss	%xmm0, %xmm0, %xmm0
	vaddss	%xmm0, %xmm4, %xmm4
	addq	$2, %rcx
	cmpq	%rcx, %rsi
	jne	.LBB4_7
.LBB4_8:                                # %for.inc26.loopexit.unr-lcssa
                                        #   in Loop: Header=BB4_3 Depth=1
	testb	$1, %r8b
	je	.LBB4_10
# %bb.9:                                # %for.body3.epil
                                        #   in Loop: Header=BB4_3 Depth=1
	movq	%rbx, %rax
	imulq	%r8, %rax
	leaq	(%rdx,%rax,4), %rax
	leal	-1(%rcx), %ebp
	vcvtsi2ss	%ebp, %xmm9, %xmm0
	vmulss	%xmm2, %xmm0, %xmm0
	vaddss	%xmm0, %xmm8, %xmm0
	vmovss	(%rax,%rcx,4), %xmm6            # xmm6 = mem[0],zero,zero,zero
	vcvtss2sd	%xmm6, %xmm6, %xmm6
	vmulss	%xmm0, %xmm0, %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vsubsd	%xmm0, %xmm3, %xmm0
	vmulsd	%xmm0, %xmm5, %xmm0
	vsubsd	%xmm0, %xmm6, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	vmulss	%xmm0, %xmm0, %xmm0
	vaddss	%xmm0, %xmm4, %xmm4
	jmp	.LBB4_10
.LBB4_1:
	vxorps	%xmm4, %xmm4, %xmm4
.LBB4_11:                               # %for.end28
	vcvtss2sd	%xmm4, %xmm4, %xmm0
	vxorps	%xmm1, %xmm1, %xmm1
	vucomisd	%xmm1, %xmm0
	jb	.LBB4_13
# %bb.12:
	vsqrtsd	%xmm0, %xmm0, %xmm0
	jmp	.LBB4_14
.LBB4_13:                               # %call.sqrt
	callq	sqrt
.LBB4_14:                               # %for.end28.split
	imull	%r14d, %r15d
	vcvtsi2sd	%r15d, %xmm9, %xmm1
	vdivsd	%xmm1, %xmm0, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	movl	$.L.str.5, %edi
	movb	$1, %al
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	jmp	printf                          # TAILCALL
.Lfunc_end4:
	.size	error_check, .Lfunc_end4-error_check
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3                               # -- Begin function main
.LCPI5_0:
	.quad	0x4000000000000000              # double 2
.LCPI5_2:
	.quad	0xbff0000000000000              # double -1
.LCPI5_3:
	.quad	0x3ff0000000000000              # double 1
.LCPI5_7:
	.quad	0x408f400000000000              # double 1000
.LCPI5_8:
	.quad	0x4034000000000000              # double 20
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI5_1:
	.quad	0x8000000000000000              # double -0
	.quad	0x8000000000000000              # double -0
	.section	.rodata,"a",@progbits
	.p2align	6
.LCPI5_4:
	.long	0                               # 0x0
	.long	1                               # 0x1
	.long	2                               # 0x2
	.long	3                               # 0x3
	.long	4                               # 0x4
	.long	5                               # 0x5
	.long	6                               # 0x6
	.long	7                               # 0x7
	.long	8                               # 0x8
	.long	9                               # 0x9
	.long	10                              # 0xa
	.long	11                              # 0xb
	.long	12                              # 0xc
	.long	13                              # 0xd
	.long	14                              # 0xe
	.long	15                              # 0xf
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2
.LCPI5_5:
	.long	15                              # 0xf
.LCPI5_6:
	.long	32                              # 0x20
.LCPI5_9:
	.long	0xbf800000                      # float -1
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
	subq	$520, %rsp                      # imm = 0x208
	.cfi_def_cfa_offset 576
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
                                        # kill: def $edi killed $edi def $rdi
	movl	$256, 32(%rsp)                  # imm = 0x100
	movl	$256, 36(%rsp)                  # imm = 0x100
	movl	$1029597613, 44(%rsp)           # imm = 0x3D5E69AD
	movl	$786163455, 48(%rsp)            # imm = 0x2EDBE6FF
	movl	$1065353216, 52(%rsp)           # imm = 0x3F800000
	movl	$5000, 68(%rsp)                 # imm = 0x1388
	addl	$-2, %edi
	cmpl	$5, %edi
	ja	.LBB5_11
# %bb.1:                                # %entry
	movq	%rsi, %rbx
	jmpq	*.LJTI5_0(,%rdi,8)
.LBB5_2:                                # %if.then
	movq	8(%rbx), %rdi
	leaq	32(%rsp), %rdx
	movl	$.L.str.6, %esi
	xorl	%eax, %eax
	callq	__isoc99_sscanf
	movl	32(%rsp), %eax
	movl	%eax, 36(%rsp)
	jmp	.LBB5_11
.LBB5_3:                                # %if.then2
	movq	8(%rbx), %rdi
	leaq	32(%rsp), %rdx
	movl	$.L.str.6, %esi
	xorl	%eax, %eax
	callq	__isoc99_sscanf
	movq	16(%rbx), %rdi
	leaq	36(%rsp), %rdx
	jmp	.LBB5_9
.LBB5_4:                                # %if.then9
	movq	8(%rbx), %rdi
	leaq	32(%rsp), %rdx
	movl	$.L.str.6, %esi
	xorl	%eax, %eax
	callq	__isoc99_sscanf
	movq	16(%rbx), %rdi
	leaq	36(%rsp), %rdx
	movl	$.L.str.6, %esi
	xorl	%eax, %eax
	callq	__isoc99_sscanf
	movq	24(%rbx), %rdi
	leaq	44(%rsp), %rdx
	movl	$.L.str.7, %esi
	jmp	.LBB5_10
.LBB5_6:                                # %if.then18
	movq	8(%rbx), %rdi
	leaq	32(%rsp), %rdx
	movl	$.L.str.6, %esi
	xorl	%eax, %eax
	callq	__isoc99_sscanf
	movq	16(%rbx), %rdi
	leaq	36(%rsp), %rdx
	movl	$.L.str.6, %esi
	xorl	%eax, %eax
	callq	__isoc99_sscanf
	movq	24(%rbx), %rdi
	leaq	44(%rsp), %rdx
	movl	$.L.str.7, %esi
	xorl	%eax, %eax
	callq	__isoc99_sscanf
	movq	32(%rbx), %rdi
	leaq	48(%rsp), %rdx
	movl	$.L.str.7, %esi
	jmp	.LBB5_10
.LBB5_7:                                # %if.then29
	movq	8(%rbx), %rdi
	leaq	32(%rsp), %rdx
	movl	$.L.str.6, %esi
	xorl	%eax, %eax
	callq	__isoc99_sscanf
	movq	16(%rbx), %rdi
	leaq	36(%rsp), %rdx
	movl	$.L.str.6, %esi
	xorl	%eax, %eax
	callq	__isoc99_sscanf
	movq	24(%rbx), %rdi
	leaq	44(%rsp), %rdx
	movl	$.L.str.7, %esi
	xorl	%eax, %eax
	callq	__isoc99_sscanf
	movq	32(%rbx), %rdi
	leaq	48(%rsp), %rdx
	movl	$.L.str.7, %esi
	xorl	%eax, %eax
	callq	__isoc99_sscanf
	movq	40(%rbx), %rdi
	leaq	52(%rsp), %rdx
	movl	$.L.str.7, %esi
	jmp	.LBB5_10
.LBB5_8:                                # %if.then42
	movq	8(%rbx), %rdi
	leaq	32(%rsp), %rdx
	movl	$.L.str.6, %esi
	xorl	%eax, %eax
	callq	__isoc99_sscanf
	movq	16(%rbx), %rdi
	leaq	36(%rsp), %rdx
	movl	$.L.str.6, %esi
	xorl	%eax, %eax
	callq	__isoc99_sscanf
	movq	24(%rbx), %rdi
	leaq	44(%rsp), %rdx
	movl	$.L.str.7, %esi
	xorl	%eax, %eax
	callq	__isoc99_sscanf
	movq	32(%rbx), %rdi
	leaq	48(%rsp), %rdx
	movl	$.L.str.7, %esi
	xorl	%eax, %eax
	callq	__isoc99_sscanf
	movq	40(%rbx), %rdi
	leaq	52(%rsp), %rdx
	movl	$.L.str.7, %esi
	xorl	%eax, %eax
	callq	__isoc99_sscanf
	movq	48(%rbx), %rdi
	leaq	68(%rsp), %rdx
.LBB5_9:                                # %if.end60
	movl	$.L.str.6, %esi
.LBB5_10:                               # %if.end60
	xorl	%eax, %eax
	callq	__isoc99_sscanf
.LBB5_11:                               # %if.end60
	movl	32(%rsp), %esi
	movl	36(%rsp), %edx
	vmovss	44(%rsp), %xmm0                 # xmm0 = mem[0],zero,zero,zero
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vmovss	48(%rsp), %xmm1                 # xmm1 = mem[0],zero,zero,zero
	vcvtss2sd	%xmm1, %xmm1, %xmm1
	vmovss	52(%rsp), %xmm2                 # xmm2 = mem[0],zero,zero,zero
	vcvtss2sd	%xmm2, %xmm2, %xmm2
	movl	68(%rsp), %ecx
	movl	$.L.str.8, %edi
	movb	$3, %al
	callq	printf
	movl	$.Lstr, %edi
	callq	puts
	movslq	32(%rsp), %rbx
	movl	36(%rsp), %r15d
	movslq	%r15d, %r14
	movq	%rbx, %rbp
	imulq	%r14, %rbp
	shlq	$2, %rbp
	movq	%rbp, %rdi
	callq	malloc
	movq	%rax, 104(%rsp)                 # 8-byte Spill
	movq	%rbp, %rdi
	callq	malloc
	movq	%rax, 176(%rsp)                 # 8-byte Spill
	movq	%rbp, 184(%rsp)                 # 8-byte Spill
	movq	%rbp, %rdi
	callq	malloc
	movq	%rax, 72(%rsp)                  # 8-byte Spill
	leal	-1(%rbx), %eax
	addl	$-1, %r14d
	testq	%rbx, %rbx
	movl	%ebx, %ecx
	movq	%rcx, 56(%rsp)                  # 8-byte Spill
	vmovss	44(%rsp), %xmm0                 # xmm0 = mem[0],zero,zero,zero
	vmovss	%xmm0, 96(%rsp)                 # 4-byte Spill
	vcvtsi2sd	%eax, %xmm3, %xmm0
	vmovsd	.LCPI5_0(%rip), %xmm1           # xmm1 = mem[0],zero
	vdivsd	%xmm0, %xmm1, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	vmovss	%xmm0, 40(%rsp)                 # 4-byte Spill
	vcvtsi2sd	%r14d, %xmm3, %xmm0
	vdivsd	%xmm0, %xmm1, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm11
	vmovaps	%xmm11, 80(%rsp)                # 16-byte Spill
	jle	.LBB5_26
# %bb.12:                               # %for.cond7.preheader.lr.ph.i
	vmovss	96(%rsp), %xmm0                 # 4-byte Reload
                                        # xmm0 = mem[0],zero,zero,zero
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vxorps	.LCPI5_1(%rip), %xmm0, %xmm0
	vmovaps	%xmm0, 128(%rsp)                # 16-byte Spill
	leaq	(,%r15,4), %r13
	movl	%r15d, %eax
	andl	$-16, %eax
	movq	%rax, 168(%rsp)                 # 8-byte Spill
	addq	$-16, %rax
	movq	%rax, 160(%rsp)                 # 8-byte Spill
	movq	%rax, %rcx
	shrq	$4, %rcx
	addq	$1, %rcx
	vbroadcastss	%xmm11, %zmm12
	movq	72(%rsp), %r12                  # 8-byte Reload
	leaq	64(%r12), %r14
	movq	%rcx, %rax
	movq	%rcx, 152(%rsp)                 # 8-byte Spill
	andq	$-2, %rcx
	negq	%rcx
	movq	%rcx, 144(%rsp)                 # 8-byte Spill
	xorl	%ebp, %ebp
	vmovsd	.LCPI5_2(%rip), %xmm13          # xmm13 = mem[0],zero
	vbroadcastsd	.LCPI5_2(%rip), %zmm16  # zmm16 = [-1.0E+0,-1.0E+0,-1.0E+0,-1.0E+0,-1.0E+0,-1.0E+0,-1.0E+0,-1.0E+0]
	vbroadcastsd	.LCPI5_3(%rip), %zmm17  # zmm17 = [1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0]
	vpbroadcastd	.LCPI5_5(%rip), %zmm18  # zmm18 = [15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15]
	vpbroadcastd	.LCPI5_6(%rip), %zmm19  # zmm19 = [32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32]
	vmovups	%zmm12, 448(%rsp)               # 64-byte Spill
	vmovupd	%zmm16, 384(%rsp)               # 64-byte Spill
	vmovupd	%zmm17, 320(%rsp)               # 64-byte Spill
	vmovdqu64	%zmm18, 256(%rsp)       # 64-byte Spill
	vmovdqu64	%zmm19, 192(%rsp)       # 64-byte Spill
	jmp	.LBB5_13
	.p2align	4, 0x90
.LBB5_25:                               # %for.inc48.i
                                        #   in Loop: Header=BB5_13 Depth=1
	addq	$1, %rbp
	addq	%r13, %r14
	addq	%r13, %r12
	cmpq	56(%rsp), %rbp                  # 8-byte Folded Reload
	je	.LBB5_26
.LBB5_13:                               # %for.cond7.preheader.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_19 Depth 2
                                        #     Child Loop BB5_24 Depth 2
	testl	%r15d, %r15d
	jle	.LBB5_25
# %bb.14:                               # %for.body10.lr.ph.i
                                        #   in Loop: Header=BB5_13 Depth=1
	movq	%r13, %rdi
	imulq	%rbp, %rdi
	addq	104(%rsp), %rdi                 # 8-byte Folded Reload
	leal	-1(%rbp), %eax
	vcvtsi2ss	%eax, %xmm20, %xmm0
	vmulss	40(%rsp), %xmm0, %xmm0          # 4-byte Folded Reload
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vaddsd	%xmm0, %xmm13, %xmm0
	vcvttsd2si	%xmm0, %ebx
	imull	%ebx, %ebx
	xorl	%esi, %esi
	movq	%r13, %rdx
	callq	memset@PLT
	vmovsd	.LCPI5_3(%rip), %xmm14          # xmm14 = mem[0],zero
	cmpl	$16, %r15d
	vcvtsi2sd	%ebx, %xmm20, %xmm0
	vsubsd	%xmm0, %xmm14, %xmm1
	vmulsd	128(%rsp), %xmm1, %xmm0         # 16-byte Folded Reload
	vaddsd	%xmm1, %xmm1, %xmm1
	jae	.LBB5_16
# %bb.15:                               #   in Loop: Header=BB5_13 Depth=1
	xorl	%eax, %eax
	vmovaps	80(%rsp), %xmm11                # 16-byte Reload
	vmovsd	.LCPI5_2(%rip), %xmm13          # xmm13 = mem[0],zero
	jmp	.LBB5_23
	.p2align	4, 0x90
.LBB5_16:                               # %vector.ph
                                        #   in Loop: Header=BB5_13 Depth=1
	cmpq	$0, 160(%rsp)                   # 8-byte Folded Reload
	vbroadcastsd	%xmm0, %zmm3
	vbroadcastsd	%xmm1, %zmm2
	vmovups	448(%rsp), %zmm12               # 64-byte Reload
	vpternlogd	$255, %zmm15, %zmm15, %zmm15
	vmovupd	384(%rsp), %zmm16               # 64-byte Reload
	vmovupd	320(%rsp), %zmm17               # 64-byte Reload
	vmovdqu64	256(%rsp), %zmm18       # 64-byte Reload
	vmovdqu64	192(%rsp), %zmm19       # 64-byte Reload
	je	.LBB5_17
# %bb.18:                               # %vector.body.preheader
                                        #   in Loop: Header=BB5_13 Depth=1
	movq	144(%rsp), %rcx                 # 8-byte Reload
	xorl	%eax, %eax
	vmovdqa64	.LCPI5_4(%rip), %zmm4   # zmm4 = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
	vmovaps	80(%rsp), %xmm11                # 16-byte Reload
	vmovsd	.LCPI5_2(%rip), %xmm13          # xmm13 = mem[0],zero
	.p2align	4, 0x90
.LBB5_19:                               # %vector.body
                                        #   Parent Loop BB5_13 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vpaddd	%zmm15, %zmm4, %zmm5
	vcvtdq2ps	%zmm5, %zmm5
	vmulps	%zmm5, %zmm12, %zmm5
	vcvtps2pd	%ymm5, %zmm6
	vextractf64x4	$1, %zmm5, %ymm5
	vcvtps2pd	%ymm5, %zmm5
	vaddpd	%zmm16, %zmm5, %zmm5
	vaddpd	%zmm16, %zmm6, %zmm6
	vcvttpd2dq	%zmm6, %ymm6
	vcvttpd2dq	%zmm5, %ymm5
	vpmulld	%ymm6, %ymm6, %ymm6
	vpmulld	%ymm5, %ymm5, %ymm5
	vcvtdq2pd	%ymm5, %zmm5
	vcvtdq2pd	%ymm6, %zmm6
	vsubpd	%zmm6, %zmm17, %zmm6
	vsubpd	%zmm5, %zmm17, %zmm5
	vmulpd	%zmm6, %zmm3, %zmm7
	vaddpd	%zmm6, %zmm6, %zmm6
	vpaddd	%zmm18, %zmm4, %zmm8
	vmulpd	%zmm5, %zmm3, %zmm9
	vcvtdq2ps	%zmm8, %zmm8
	vmulps	%zmm8, %zmm12, %zmm8
	vcvtps2pd	%ymm8, %zmm10
	vaddpd	%zmm5, %zmm5, %zmm5
	vextractf64x4	$1, %zmm8, %ymm8
	vcvtps2pd	%ymm8, %zmm8
	vaddpd	%zmm16, %zmm8, %zmm8
	vsubpd	%zmm2, %zmm7, %zmm7
	vaddpd	%zmm16, %zmm10, %zmm10
	vcvttpd2dq	%zmm10, %ymm10
	vcvttpd2dq	%zmm8, %ymm8
	vsubpd	%zmm6, %zmm7, %zmm6
	vpmulld	%ymm8, %ymm8, %ymm7
	vcvtdq2pd	%ymm7, %zmm7
	vsubpd	%zmm2, %zmm9, %zmm8
	vpmulld	%ymm10, %ymm10, %ymm9
	vcvtdq2pd	%ymm9, %zmm9
	vsubpd	%zmm5, %zmm8, %zmm5
	vsubpd	%zmm9, %zmm17, %zmm8
	vsubpd	%zmm7, %zmm17, %zmm7
	vmulpd	%zmm8, %zmm3, %zmm9
	vcvtpd2ps	%zmm6, %ymm6
	vsubpd	%zmm2, %zmm9, %zmm9
	vaddpd	%zmm8, %zmm8, %zmm8
	vsubpd	%zmm8, %zmm9, %zmm8
	vcvtpd2ps	%zmm5, %ymm5
	vmulpd	%zmm7, %zmm3, %zmm9
	vsubpd	%zmm2, %zmm9, %zmm9
	vaddpd	%zmm7, %zmm7, %zmm7
	vinsertf64x4	$1, %ymm5, %zmm6, %zmm5
	vsubpd	%zmm7, %zmm9, %zmm6
	vcvtpd2ps	%zmm8, %ymm7
	vmovups	%zmm5, -64(%r14,%rax,4)
	vcvtpd2ps	%zmm6, %ymm5
	vinsertf64x4	$1, %ymm5, %zmm7, %zmm5
	vmovupd	%zmm5, (%r14,%rax,4)
	addq	$32, %rax
	addq	$2, %rcx
	vpaddd	%zmm19, %zmm4, %zmm4
	jne	.LBB5_19
# %bb.20:                               # %middle.block.unr-lcssa
                                        #   in Loop: Header=BB5_13 Depth=1
	testb	$1, 152(%rsp)                   # 1-byte Folded Reload
	je	.LBB5_22
.LBB5_21:                               # %vector.body.epil
                                        #   in Loop: Header=BB5_13 Depth=1
	movq	%rbp, %rcx
	imulq	%r15, %rcx
	movq	72(%rsp), %rdx                  # 8-byte Reload
	leaq	(%rdx,%rcx,4), %rcx
	vpaddd	%zmm15, %zmm4, %zmm4
	vcvtdq2ps	%zmm4, %zmm4
	vmulps	%zmm4, %zmm12, %zmm4
	vcvtps2pd	%ymm4, %zmm5
	vextractf64x4	$1, %zmm4, %ymm4
	vcvtps2pd	%ymm4, %zmm4
	vaddpd	%zmm16, %zmm4, %zmm4
	vaddpd	%zmm16, %zmm5, %zmm5
	vcvttpd2dq	%zmm4, %ymm4
	vpmulld	%ymm4, %ymm4, %ymm4
	vcvttpd2dq	%zmm5, %ymm5
	vcvtdq2pd	%ymm4, %zmm4
	vpmulld	%ymm5, %ymm5, %ymm5
	vcvtdq2pd	%ymm5, %zmm5
	vsubpd	%zmm5, %zmm17, %zmm5
	vsubpd	%zmm4, %zmm17, %zmm4
	vmulpd	%zmm4, %zmm3, %zmm6
	vmulpd	%zmm5, %zmm3, %zmm3
	vsubpd	%zmm2, %zmm3, %zmm3
	vsubpd	%zmm2, %zmm6, %zmm2
	vaddpd	%zmm5, %zmm5, %zmm5
	vsubpd	%zmm5, %zmm3, %zmm3
	vaddpd	%zmm4, %zmm4, %zmm4
	vsubpd	%zmm4, %zmm2, %zmm2
	vcvtpd2ps	%zmm3, %ymm3
	vcvtpd2ps	%zmm2, %ymm2
	vinsertf64x4	$1, %ymm2, %zmm3, %zmm2
	vmovupd	%zmm2, (%rcx,%rax,4)
.LBB5_22:                               # %middle.block
                                        #   in Loop: Header=BB5_13 Depth=1
	movq	168(%rsp), %rax                 # 8-byte Reload
	cmpq	%r15, %rax
	je	.LBB5_25
.LBB5_23:                               # %for.body10.i.preheader
                                        #   in Loop: Header=BB5_13 Depth=1
	movq	%r15, %rcx
	subq	%rax, %rcx
	leaq	(%r12,%rax,4), %rdx
	addl	$-1, %eax
	.p2align	4, 0x90
.LBB5_24:                               # %for.body10.i
                                        #   Parent Loop BB5_13 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vcvtsi2ss	%eax, %xmm20, %xmm2
	vmulss	%xmm2, %xmm11, %xmm2
	vcvtss2sd	%xmm2, %xmm2, %xmm2
	vaddsd	%xmm2, %xmm13, %xmm2
	vcvttsd2si	%xmm2, %esi
	imull	%esi, %esi
	vcvtsi2sd	%esi, %xmm20, %xmm2
	vsubsd	%xmm2, %xmm14, %xmm2
	vmulsd	%xmm2, %xmm0, %xmm3
	vsubsd	%xmm1, %xmm3, %xmm3
	vaddsd	%xmm2, %xmm2, %xmm2
	vsubsd	%xmm2, %xmm3, %xmm2
	vcvtsd2ss	%xmm2, %xmm2, %xmm2
	vmovss	%xmm2, (%rdx)
	addq	$4, %rdx
	addl	$1, %eax
	addq	$-1, %rcx
	jne	.LBB5_24
	jmp	.LBB5_25
.LBB5_17:                               #   in Loop: Header=BB5_13 Depth=1
	xorl	%eax, %eax
	vmovdqa64	.LCPI5_4(%rip), %zmm4   # zmm4 = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
	vmovaps	80(%rsp), %xmm11                # 16-byte Reload
	vmovsd	.LCPI5_2(%rip), %xmm13          # xmm13 = mem[0],zero
	testb	$1, 152(%rsp)                   # 1-byte Folded Reload
	jne	.LBB5_21
	jmp	.LBB5_22
.LBB5_26:                               # %initialize.exit
	movq	176(%rsp), %rbx                 # 8-byte Reload
	movq	%rbx, %rdi
	movq	104(%rsp), %rbp                 # 8-byte Reload
	movq	%rbp, %rsi
	movq	184(%rsp), %rdx                 # 8-byte Reload
	callq	memcpy@PLT
	vmovss	52(%rsp), %xmm3                 # xmm3 = mem[0],zero,zero,zero
	vmovss	48(%rsp), %xmm4                 # xmm4 = mem[0],zero,zero,zero
	movl	68(%rsp), %r8d
	movq	56(%rsp), %rdi                  # 8-byte Reload
                                        # kill: def $edi killed $edi killed $rdi
	movl	%r15d, %esi
	vmovss	40(%rsp), %xmm0                 # 4-byte Reload
                                        # xmm0 = mem[0],zero,zero,zero
	vmovaps	80(%rsp), %xmm1                 # 16-byte Reload
	vmovss	96(%rsp), %xmm2                 # 4-byte Reload
                                        # xmm2 = mem[0],zero,zero,zero
	movq	%rbp, %rdx
	movq	72(%rsp), %rbp                  # 8-byte Reload
	movq	%rbp, %rcx
	callq	jacobi_seq
	movl	32(%rsp), %edi
	movl	36(%rsp), %esi
	vmovss	44(%rsp), %xmm2                 # xmm2 = mem[0],zero,zero,zero
	vmovss	52(%rsp), %xmm3                 # xmm3 = mem[0],zero,zero,zero
	vmovd	48(%rsp), %xmm4                 # xmm4 = mem[0],zero,zero,zero
	movl	68(%rsp), %r8d
	vmovss	40(%rsp), %xmm0                 # 4-byte Reload
                                        # xmm0 = mem[0],zero,zero,zero
	vmovaps	80(%rsp), %xmm1                 # 16-byte Reload
	movq	%rbx, %rdx
	movq	%rbp, %rcx
	callq	jacobi_omp
	movl	32(%rsp), %ecx
	movl	36(%rsp), %r13d
	movslq	%r13d, %rdx
	leal	-1(%rcx), %eax
	vcvtsi2sd	%eax, %xmm20, %xmm0
	vmovsd	.LCPI5_0(%rip), %xmm1           # xmm1 = mem[0],zero
	vdivsd	%xmm0, %xmm1, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm11
	movq	%rdx, 96(%rsp)                  # 8-byte Spill
	leal	-1(%rdx), %eax
	vcvtsi2sd	%eax, %xmm20, %xmm0
	vdivsd	%xmm0, %xmm1, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm12
	movq	%rcx, 56(%rsp)                  # 8-byte Spill
	testl	%ecx, %ecx
	vmovss	%xmm11, 40(%rsp)                # 4-byte Spill
	vmovaps	%xmm12, 80(%rsp)                # 16-byte Spill
	jle	.LBB5_41
# %bb.27:                               # %for.cond7.preheader.lr.ph.i185
	vmovss	44(%rsp), %xmm0                 # xmm0 = mem[0],zero,zero,zero
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vxorps	.LCPI5_1(%rip), %xmm0, %xmm0
	vmovaps	%xmm0, 128(%rsp)                # 16-byte Spill
	leaq	(,%r13,4), %rbx
	movl	%r13d, %eax
	andl	$-16, %eax
	movq	%rax, 168(%rsp)                 # 8-byte Spill
	addq	$-16, %rax
	movq	%rax, 160(%rsp)                 # 8-byte Spill
	movq	%rax, %rcx
	shrq	$4, %rcx
	addq	$1, %rcx
	vbroadcastss	%xmm12, %zmm13
	movq	72(%rsp), %r12                  # 8-byte Reload
	leaq	64(%r12), %r14
	movq	%rcx, %rax
	movq	%rcx, 152(%rsp)                 # 8-byte Spill
	andq	$-2, %rcx
	negq	%rcx
	movq	%rcx, 144(%rsp)                 # 8-byte Spill
	xorl	%r15d, %r15d
	vmovsd	.LCPI5_2(%rip), %xmm14          # xmm14 = mem[0],zero
	vbroadcastsd	.LCPI5_2(%rip), %zmm17  # zmm17 = [-1.0E+0,-1.0E+0,-1.0E+0,-1.0E+0,-1.0E+0,-1.0E+0,-1.0E+0,-1.0E+0]
	vbroadcastsd	.LCPI5_3(%rip), %zmm18  # zmm18 = [1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0]
	vpbroadcastd	.LCPI5_5(%rip), %zmm19  # zmm19 = [15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15]
	vpbroadcastd	.LCPI5_6(%rip), %zmm20  # zmm20 = [32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32]
	vmovups	%zmm13, 448(%rsp)               # 64-byte Spill
	vmovupd	%zmm17, 384(%rsp)               # 64-byte Spill
	vmovupd	%zmm18, 320(%rsp)               # 64-byte Spill
	vmovdqu64	%zmm19, 256(%rsp)       # 64-byte Spill
	vmovdqu64	%zmm20, 192(%rsp)       # 64-byte Spill
	jmp	.LBB5_28
	.p2align	4, 0x90
.LBB5_40:                               # %for.inc48.i222
                                        #   in Loop: Header=BB5_28 Depth=1
	addq	$1, %r15
	addq	%rbx, %r14
	addq	%rbx, %r12
	cmpq	56(%rsp), %r15                  # 8-byte Folded Reload
	je	.LBB5_41
.LBB5_28:                               # %for.cond7.preheader.i187
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_34 Depth 2
                                        #     Child Loop BB5_39 Depth 2
	testl	%r13d, %r13d
	jle	.LBB5_40
# %bb.29:                               # %for.body10.lr.ph.i191
                                        #   in Loop: Header=BB5_28 Depth=1
	movq	%rbx, %rdi
	imulq	%r15, %rdi
	addq	104(%rsp), %rdi                 # 8-byte Folded Reload
	leal	-1(%r15), %eax
	vcvtsi2ss	%eax, %xmm21, %xmm0
	vmulss	%xmm0, %xmm11, %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vaddsd	%xmm0, %xmm14, %xmm0
	vcvttsd2si	%xmm0, %ebp
	imull	%ebp, %ebp
	xorl	%esi, %esi
	movq	%rbx, %rdx
	callq	memset@PLT
	vmovsd	.LCPI5_3(%rip), %xmm15          # xmm15 = mem[0],zero
	cmpl	$16, %r13d
	vcvtsi2sd	%ebp, %xmm21, %xmm0
	vsubsd	%xmm0, %xmm15, %xmm1
	vmulsd	128(%rsp), %xmm1, %xmm0         # 16-byte Folded Reload
	vaddsd	%xmm1, %xmm1, %xmm1
	jae	.LBB5_31
# %bb.30:                               #   in Loop: Header=BB5_28 Depth=1
	xorl	%eax, %eax
	vmovss	40(%rsp), %xmm11                # 4-byte Reload
                                        # xmm11 = mem[0],zero,zero,zero
	vmovaps	80(%rsp), %xmm12                # 16-byte Reload
	vmovsd	.LCPI5_2(%rip), %xmm14          # xmm14 = mem[0],zero
	jmp	.LBB5_38
	.p2align	4, 0x90
.LBB5_31:                               # %vector.ph291
                                        #   in Loop: Header=BB5_28 Depth=1
	cmpq	$0, 160(%rsp)                   # 8-byte Folded Reload
	vbroadcastsd	%xmm0, %zmm3
	vbroadcastsd	%xmm1, %zmm2
	vmovups	448(%rsp), %zmm13               # 64-byte Reload
	vpternlogd	$255, %zmm16, %zmm16, %zmm16
	vmovupd	384(%rsp), %zmm17               # 64-byte Reload
	vmovupd	320(%rsp), %zmm18               # 64-byte Reload
	vmovdqu64	256(%rsp), %zmm19       # 64-byte Reload
	vmovdqu64	192(%rsp), %zmm20       # 64-byte Reload
	je	.LBB5_32
# %bb.33:                               # %vector.body289.preheader
                                        #   in Loop: Header=BB5_28 Depth=1
	movq	144(%rsp), %rcx                 # 8-byte Reload
	xorl	%eax, %eax
	vmovdqa64	.LCPI5_4(%rip), %zmm4   # zmm4 = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
	vmovss	40(%rsp), %xmm11                # 4-byte Reload
                                        # xmm11 = mem[0],zero,zero,zero
	vmovaps	80(%rsp), %xmm12                # 16-byte Reload
	vmovsd	.LCPI5_2(%rip), %xmm14          # xmm14 = mem[0],zero
	.p2align	4, 0x90
.LBB5_34:                               # %vector.body289
                                        #   Parent Loop BB5_28 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vpaddd	%zmm16, %zmm4, %zmm5
	vcvtdq2ps	%zmm5, %zmm5
	vmulps	%zmm5, %zmm13, %zmm5
	vcvtps2pd	%ymm5, %zmm6
	vextractf64x4	$1, %zmm5, %ymm5
	vcvtps2pd	%ymm5, %zmm5
	vaddpd	%zmm17, %zmm5, %zmm5
	vaddpd	%zmm17, %zmm6, %zmm6
	vcvttpd2dq	%zmm6, %ymm6
	vcvttpd2dq	%zmm5, %ymm5
	vpmulld	%ymm6, %ymm6, %ymm6
	vpmulld	%ymm5, %ymm5, %ymm5
	vcvtdq2pd	%ymm5, %zmm5
	vcvtdq2pd	%ymm6, %zmm6
	vsubpd	%zmm6, %zmm18, %zmm6
	vsubpd	%zmm5, %zmm18, %zmm5
	vmulpd	%zmm6, %zmm3, %zmm7
	vaddpd	%zmm6, %zmm6, %zmm6
	vpaddd	%zmm19, %zmm4, %zmm8
	vmulpd	%zmm5, %zmm3, %zmm9
	vcvtdq2ps	%zmm8, %zmm8
	vmulps	%zmm8, %zmm13, %zmm8
	vcvtps2pd	%ymm8, %zmm10
	vaddpd	%zmm5, %zmm5, %zmm5
	vextractf64x4	$1, %zmm8, %ymm8
	vcvtps2pd	%ymm8, %zmm8
	vaddpd	%zmm17, %zmm8, %zmm8
	vsubpd	%zmm2, %zmm7, %zmm7
	vaddpd	%zmm17, %zmm10, %zmm10
	vcvttpd2dq	%zmm10, %ymm10
	vcvttpd2dq	%zmm8, %ymm8
	vsubpd	%zmm6, %zmm7, %zmm6
	vpmulld	%ymm8, %ymm8, %ymm7
	vcvtdq2pd	%ymm7, %zmm7
	vsubpd	%zmm2, %zmm9, %zmm8
	vpmulld	%ymm10, %ymm10, %ymm9
	vcvtdq2pd	%ymm9, %zmm9
	vsubpd	%zmm5, %zmm8, %zmm5
	vsubpd	%zmm9, %zmm18, %zmm8
	vsubpd	%zmm7, %zmm18, %zmm7
	vmulpd	%zmm8, %zmm3, %zmm9
	vcvtpd2ps	%zmm6, %ymm6
	vsubpd	%zmm2, %zmm9, %zmm9
	vaddpd	%zmm8, %zmm8, %zmm8
	vsubpd	%zmm8, %zmm9, %zmm8
	vcvtpd2ps	%zmm5, %ymm5
	vmulpd	%zmm7, %zmm3, %zmm9
	vsubpd	%zmm2, %zmm9, %zmm9
	vaddpd	%zmm7, %zmm7, %zmm7
	vinsertf64x4	$1, %ymm5, %zmm6, %zmm5
	vsubpd	%zmm7, %zmm9, %zmm6
	vcvtpd2ps	%zmm8, %ymm7
	vmovups	%zmm5, -64(%r14,%rax,4)
	vcvtpd2ps	%zmm6, %ymm5
	vinsertf64x4	$1, %ymm5, %zmm7, %zmm5
	vmovupd	%zmm5, (%r14,%rax,4)
	addq	$32, %rax
	addq	$2, %rcx
	vpaddd	%zmm20, %zmm4, %zmm4
	jne	.LBB5_34
# %bb.35:                               # %middle.block287.unr-lcssa
                                        #   in Loop: Header=BB5_28 Depth=1
	testb	$1, 152(%rsp)                   # 1-byte Folded Reload
	je	.LBB5_37
.LBB5_36:                               # %vector.body289.epil
                                        #   in Loop: Header=BB5_28 Depth=1
	movq	%r15, %rcx
	imulq	%r13, %rcx
	movq	72(%rsp), %rdx                  # 8-byte Reload
	leaq	(%rdx,%rcx,4), %rcx
	vpaddd	%zmm16, %zmm4, %zmm4
	vcvtdq2ps	%zmm4, %zmm4
	vmulps	%zmm4, %zmm13, %zmm4
	vcvtps2pd	%ymm4, %zmm5
	vextractf64x4	$1, %zmm4, %ymm4
	vcvtps2pd	%ymm4, %zmm4
	vaddpd	%zmm17, %zmm4, %zmm4
	vaddpd	%zmm17, %zmm5, %zmm5
	vcvttpd2dq	%zmm4, %ymm4
	vpmulld	%ymm4, %ymm4, %ymm4
	vcvttpd2dq	%zmm5, %ymm5
	vcvtdq2pd	%ymm4, %zmm4
	vpmulld	%ymm5, %ymm5, %ymm5
	vcvtdq2pd	%ymm5, %zmm5
	vsubpd	%zmm5, %zmm18, %zmm5
	vsubpd	%zmm4, %zmm18, %zmm4
	vmulpd	%zmm4, %zmm3, %zmm6
	vmulpd	%zmm5, %zmm3, %zmm3
	vsubpd	%zmm2, %zmm3, %zmm3
	vsubpd	%zmm2, %zmm6, %zmm2
	vaddpd	%zmm5, %zmm5, %zmm5
	vsubpd	%zmm5, %zmm3, %zmm3
	vaddpd	%zmm4, %zmm4, %zmm4
	vsubpd	%zmm4, %zmm2, %zmm2
	vcvtpd2ps	%zmm3, %ymm3
	vcvtpd2ps	%zmm2, %ymm2
	vinsertf64x4	$1, %ymm2, %zmm3, %zmm2
	vmovupd	%zmm2, (%rcx,%rax,4)
.LBB5_37:                               # %middle.block287
                                        #   in Loop: Header=BB5_28 Depth=1
	movq	168(%rsp), %rax                 # 8-byte Reload
	cmpq	%r13, %rax
	je	.LBB5_40
.LBB5_38:                               # %for.body10.i219.preheader
                                        #   in Loop: Header=BB5_28 Depth=1
	movq	%r13, %rcx
	subq	%rax, %rcx
	leaq	(%r12,%rax,4), %rdx
	addl	$-1, %eax
	.p2align	4, 0x90
.LBB5_39:                               # %for.body10.i219
                                        #   Parent Loop BB5_28 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vcvtsi2ss	%eax, %xmm21, %xmm2
	vmulss	%xmm2, %xmm12, %xmm2
	vcvtss2sd	%xmm2, %xmm2, %xmm2
	vaddsd	%xmm2, %xmm14, %xmm2
	vcvttsd2si	%xmm2, %esi
	imull	%esi, %esi
	vcvtsi2sd	%esi, %xmm21, %xmm2
	vsubsd	%xmm2, %xmm15, %xmm2
	vmulsd	%xmm2, %xmm0, %xmm3
	vsubsd	%xmm1, %xmm3, %xmm3
	vaddsd	%xmm2, %xmm2, %xmm2
	vsubsd	%xmm2, %xmm3, %xmm2
	vcvtsd2ss	%xmm2, %xmm2, %xmm2
	vmovss	%xmm2, (%rdx)
	addq	$4, %rdx
	addl	$1, %eax
	addq	$-1, %rcx
	jne	.LBB5_39
	jmp	.LBB5_40
.LBB5_32:                               #   in Loop: Header=BB5_28 Depth=1
	xorl	%eax, %eax
	vmovdqa64	.LCPI5_4(%rip), %zmm4   # zmm4 = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
	vmovss	40(%rsp), %xmm11                # 4-byte Reload
                                        # xmm11 = mem[0],zero,zero,zero
	vmovaps	80(%rsp), %xmm12                # 16-byte Reload
	vmovsd	.LCPI5_2(%rip), %xmm14          # xmm14 = mem[0],zero
	testb	$1, 152(%rsp)                   # 1-byte Folded Reload
	jne	.LBB5_36
	jmp	.LBB5_37
.LBB5_41:                               # %initialize.exit223
	movslq	56(%rsp), %rdx                  # 4-byte Folded Reload
	imulq	96(%rsp), %rdx                  # 8-byte Folded Reload
	shlq	$2, %rdx
	movq	176(%rsp), %r15                 # 8-byte Reload
	movq	%r15, %rdi
	movq	104(%rsp), %r12                 # 8-byte Reload
	movq	%r12, %rsi
	callq	memcpy@PLT
	vxorpd	%xmm0, %xmm0, %xmm0
	movl	$20, %ebp
	leaq	112(%rsp), %rbx
	movq	72(%rsp), %r13                  # 8-byte Reload
	.p2align	4, 0x90
.LBB5_42:                               # %for.body
                                        # =>This Inner Loop Header: Depth=1
	vmovsd	%xmm0, 56(%rsp)                 # 8-byte Spill
	movq	%rbx, %rdi
	callq	ftime
	vcvtsi2sdq	112(%rsp), %xmm21, %xmm0
	vmovsd	.LCPI5_7(%rip), %xmm1           # xmm1 = mem[0],zero
	vmulsd	%xmm1, %xmm0, %xmm0
	movzwl	120(%rsp), %eax
	vcvtsi2sd	%eax, %xmm21, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, 128(%rsp)                # 8-byte Spill
	movl	32(%rsp), %edi
	movl	36(%rsp), %esi
	vmovss	44(%rsp), %xmm2                 # xmm2 = mem[0],zero,zero,zero
	vmovss	52(%rsp), %xmm3                 # xmm3 = mem[0],zero,zero,zero
	vmovd	48(%rsp), %xmm4                 # xmm4 = mem[0],zero,zero,zero
	movl	68(%rsp), %r8d
	vmovss	40(%rsp), %xmm0                 # 4-byte Reload
                                        # xmm0 = mem[0],zero,zero,zero
	vmovaps	80(%rsp), %xmm1                 # 16-byte Reload
	movq	%r12, %rdx
	movq	%r13, %rcx
	callq	jacobi_seq
	movq	%rbx, %rdi
	callq	ftime
	vcvtsi2sdq	112(%rsp), %xmm21, %xmm0
	vmulsd	.LCPI5_7(%rip), %xmm0, %xmm0
	movzwl	120(%rsp), %eax
	vcvtsi2sd	%eax, %xmm21, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vsubsd	128(%rsp), %xmm0, %xmm0         # 8-byte Folded Reload
	vmovsd	56(%rsp), %xmm1                 # 8-byte Reload
                                        # xmm1 = mem[0],zero
	vaddsd	%xmm0, %xmm1, %xmm1
	vmovsd	%xmm1, 56(%rsp)                 # 8-byte Spill
	vmovsd	56(%rsp), %xmm0                 # 8-byte Reload
                                        # xmm0 = mem[0],zero
	addl	$-1, %ebp
	jne	.LBB5_42
# %bb.43:                               # %for.cond.cleanup
	vdivsd	.LCPI5_8(%rip), %xmm0, %xmm0
	movl	$.L.str.10, %edi
	movb	$1, %al
	callq	printf
	movl	$.L.str.11, %edi
	callq	puts
	vxorpd	%xmm0, %xmm0, %xmm0
	movl	$20, %ebp
	leaq	112(%rsp), %rbx
	.p2align	4, 0x90
.LBB5_44:                               # %for.body99
                                        # =>This Inner Loop Header: Depth=1
	vmovsd	%xmm0, 56(%rsp)                 # 8-byte Spill
	movq	%rbx, %rdi
	callq	ftime
	vcvtsi2sdq	112(%rsp), %xmm21, %xmm0
	vmovsd	.LCPI5_7(%rip), %xmm1           # xmm1 = mem[0],zero
	vmulsd	%xmm1, %xmm0, %xmm0
	movzwl	120(%rsp), %eax
	vcvtsi2sd	%eax, %xmm21, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, 128(%rsp)                # 8-byte Spill
	movl	32(%rsp), %edi
	movl	36(%rsp), %esi
	vmovss	44(%rsp), %xmm2                 # xmm2 = mem[0],zero,zero,zero
	vmovss	52(%rsp), %xmm3                 # xmm3 = mem[0],zero,zero,zero
	vmovd	48(%rsp), %xmm4                 # xmm4 = mem[0],zero,zero,zero
	movl	68(%rsp), %r8d
	vmovss	40(%rsp), %xmm0                 # 4-byte Reload
                                        # xmm0 = mem[0],zero,zero,zero
	vmovaps	80(%rsp), %xmm1                 # 16-byte Reload
	movq	%r15, %rdx
	movq	%r13, %rcx
	callq	jacobi_omp
	movq	%rbx, %rdi
	callq	ftime
	vcvtsi2sdq	112(%rsp), %xmm21, %xmm0
	vmulsd	.LCPI5_7(%rip), %xmm0, %xmm0
	movzwl	120(%rsp), %eax
	vcvtsi2sd	%eax, %xmm21, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vsubsd	128(%rsp), %xmm0, %xmm0         # 8-byte Folded Reload
	vmovsd	56(%rsp), %xmm1                 # 8-byte Reload
                                        # xmm1 = mem[0],zero
	vaddsd	%xmm0, %xmm1, %xmm1
	vmovsd	%xmm1, 56(%rsp)                 # 8-byte Spill
	vmovsd	56(%rsp), %xmm0                 # 8-byte Reload
                                        # xmm0 = mem[0],zero
	addl	$-1, %ebp
	jne	.LBB5_44
# %bb.45:                               # %for.cond.cleanup98
	vdivsd	.LCPI5_8(%rip), %xmm0, %xmm0
	movl	$.L.str.12, %edi
	movb	$1, %al
	callq	printf
	movl	32(%rsp), %r14d
	movl	36(%rsp), %ebp
	testl	%r14d, %r14d
	jle	.LBB5_46
# %bb.47:                               # %for.cond1.preheader.lr.ph.i
	movl	%ebp, %eax
	andl	$-2, %eax
	leaq	4(%r12), %rcx
	leaq	(,%rbp,4), %r8
	vxorpd	%xmm2, %xmm2, %xmm2
	xorl	%edx, %edx
	vmovss	.LCPI5_9(%rip), %xmm0           # xmm0 = mem[0],zero,zero,zero
	vmovsd	.LCPI5_3(%rip), %xmm1           # xmm1 = mem[0],zero
	vmovss	40(%rsp), %xmm8                 # 4-byte Reload
                                        # xmm8 = mem[0],zero,zero,zero
	vmovaps	80(%rsp), %xmm7                 # 16-byte Reload
	jmp	.LBB5_48
	.p2align	4, 0x90
.LBB5_55:                               # %for.inc26.i
                                        #   in Loop: Header=BB5_48 Depth=1
	addq	$1, %rdx
	addq	%r8, %rcx
	cmpq	%r14, %rdx
	je	.LBB5_56
.LBB5_48:                               # %for.cond1.preheader.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_52 Depth 2
	testl	%ebp, %ebp
	jle	.LBB5_55
# %bb.49:                               # %for.body3.lr.ph.i
                                        #   in Loop: Header=BB5_48 Depth=1
	leal	-1(%rdx), %edi
	cmpl	$1, %ebp
	vcvtsi2ss	%edi, %xmm9, %xmm3
	vmulss	%xmm3, %xmm8, %xmm3
	vaddss	%xmm0, %xmm3, %xmm3
	vmulss	%xmm3, %xmm3, %xmm3
	vcvtss2sd	%xmm3, %xmm3, %xmm3
	vsubsd	%xmm3, %xmm1, %xmm3
	jne	.LBB5_51
# %bb.50:                               #   in Loop: Header=BB5_48 Depth=1
	xorl	%edi, %edi
	jmp	.LBB5_53
	.p2align	4, 0x90
.LBB5_51:                               # %for.body3.i.preheader
                                        #   in Loop: Header=BB5_48 Depth=1
	xorl	%edi, %edi
	.p2align	4, 0x90
.LBB5_52:                               # %for.body3.i
                                        #   Parent Loop BB5_48 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	leal	-1(%rdi), %ebx
	vcvtsi2ss	%ebx, %xmm9, %xmm4
	vmulss	%xmm4, %xmm7, %xmm4
	vaddss	%xmm0, %xmm4, %xmm4
	vmovss	-4(%rcx,%rdi,4), %xmm5          # xmm5 = mem[0],zero,zero,zero
	vmovss	(%rcx,%rdi,4), %xmm6            # xmm6 = mem[0],zero,zero,zero
	vcvtss2sd	%xmm5, %xmm5, %xmm5
	vmulss	%xmm4, %xmm4, %xmm4
	vcvtss2sd	%xmm4, %xmm4, %xmm4
	vsubsd	%xmm4, %xmm1, %xmm4
	vmulsd	%xmm4, %xmm3, %xmm4
	vsubsd	%xmm4, %xmm5, %xmm4
	vcvtsd2ss	%xmm4, %xmm4, %xmm4
	vmulss	%xmm4, %xmm4, %xmm4
	vaddss	%xmm4, %xmm2, %xmm2
	vcvtsi2ss	%edi, %xmm9, %xmm4
	vmulss	%xmm4, %xmm7, %xmm4
	vaddss	%xmm0, %xmm4, %xmm4
	vcvtss2sd	%xmm6, %xmm6, %xmm5
	vmulss	%xmm4, %xmm4, %xmm4
	vcvtss2sd	%xmm4, %xmm4, %xmm4
	vsubsd	%xmm4, %xmm1, %xmm4
	vmulsd	%xmm4, %xmm3, %xmm4
	vsubsd	%xmm4, %xmm5, %xmm4
	vcvtsd2ss	%xmm4, %xmm4, %xmm4
	vmulss	%xmm4, %xmm4, %xmm4
	vaddss	%xmm4, %xmm2, %xmm2
	addq	$2, %rdi
	cmpq	%rdi, %rax
	jne	.LBB5_52
.LBB5_53:                               # %for.inc26.i.loopexit.unr-lcssa
                                        #   in Loop: Header=BB5_48 Depth=1
	testb	$1, %bpl
	je	.LBB5_55
# %bb.54:                               # %for.body3.i.epil
                                        #   in Loop: Header=BB5_48 Depth=1
	movq	%rdx, %rsi
	imulq	%rbp, %rsi
	leaq	(%r12,%rsi,4), %rsi
	leal	-1(%rdi), %ebx
	vcvtsi2ss	%ebx, %xmm9, %xmm4
	vmulss	%xmm4, %xmm7, %xmm4
	vaddss	%xmm0, %xmm4, %xmm4
	vmovss	(%rsi,%rdi,4), %xmm5            # xmm5 = mem[0],zero,zero,zero
	vcvtss2sd	%xmm5, %xmm5, %xmm5
	vmulss	%xmm4, %xmm4, %xmm4
	vcvtss2sd	%xmm4, %xmm4, %xmm4
	vsubsd	%xmm4, %xmm1, %xmm4
	vmulsd	%xmm4, %xmm3, %xmm3
	vsubsd	%xmm3, %xmm5, %xmm3
	vcvtsd2ss	%xmm3, %xmm3, %xmm3
	vmulss	%xmm3, %xmm3, %xmm3
	vaddss	%xmm3, %xmm2, %xmm2
	jmp	.LBB5_55
.LBB5_46:
	vxorpd	%xmm2, %xmm2, %xmm2
.LBB5_56:                               # %error_check.exit
	vcvtss2sd	%xmm2, %xmm2, %xmm0
	vxorpd	%xmm1, %xmm1, %xmm1
	vucomisd	%xmm1, %xmm0
	jb	.LBB5_58
# %bb.57:
	vsqrtsd	%xmm0, %xmm0, %xmm0
	jmp	.LBB5_59
.LBB5_58:                               # %call.sqrt
	callq	sqrt
.LBB5_59:                               # %error_check.exit.split
	imull	%ebp, %r14d
	vcvtsi2sd	%r14d, %xmm9, %xmm1
	vdivsd	%xmm1, %xmm0, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	movl	$.L.str.5, %edi
	movb	$1, %al
	callq	printf
	movq	%r12, %rdi
	callq	free
	movq	%r13, %rdi
	callq	free
	movq	%r15, %rdi
	callq	free
	xorl	%eax, %eax
	addq	$520, %rsp                      # imm = 0x208
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
.Lfunc_end5:
	.size	main, .Lfunc_end5-main
	.cfi_endproc
	.section	.rodata,"a",@progbits
	.p2align	3
.LJTI5_0:
	.quad	.LBB5_2
	.quad	.LBB5_3
	.quad	.LBB5_4
	.quad	.LBB5_6
	.quad	.LBB5_7
	.quad	.LBB5_8
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Total Number of Iterations: %d\n"
	.size	.L.str, 32

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"Residual: %.15g\n"
	.size	.L.str.1, 17

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"%s:\n"
	.size	.L.str.2, 5

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	"%s[%d][%d]:%f  "
	.size	.L.str.3, 16

	.type	.L.str.5,@object                # @.str.5
.L.str.5:
	.asciz	"Solution Error: %2.6g\n"
	.size	.L.str.5, 23

	.type	.L.str.6,@object                # @.str.6
.L.str.6:
	.asciz	"%d"
	.size	.L.str.6, 3

	.type	.L.str.7,@object                # @.str.7
.L.str.7:
	.asciz	"%g"
	.size	.L.str.7, 3

	.type	.L.str.8,@object                # @.str.8
.L.str.8:
	.asciz	"jacobi %d %d %g %g %g %d\n"
	.size	.L.str.8, 26

	.type	.L.str.10,@object               # @.str.10
.L.str.10:
	.asciz	"seq elasped time(ms): %4f\n"
	.size	.L.str.10, 27

	.type	.L.str.11,@object               # @.str.11
.L.str.11:
	.asciz	"================"
	.size	.L.str.11, 17

	.type	.L.str.12,@object               # @.str.12
.L.str.12:
	.asciz	"OpenMP elasped time(ms): %4f\n"
	.size	.L.str.12, 30

	.type	.Lstr,@object                   # @str
.Lstr:
	.asciz	"------------------------------------------------------------------------------------------------------"
	.size	.Lstr, 103

	.ident	"clang version 12.0.1 (https://github.com/llvm/llvm-project fed41342a82f5a3a9201819a82bf7a48313e296b)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
