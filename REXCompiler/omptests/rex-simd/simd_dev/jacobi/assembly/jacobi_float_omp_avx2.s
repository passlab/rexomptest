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
	movq	%rcx, -136(%rbp)                # 8-byte Spill
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
	vmovsd	.LCPI0_1(%rip), %xmm4           # xmm4 = mem[0],zero
	vdivsd	%xmm1, %xmm4, %xmm1
	vdivsd	%xmm3, %xmm4, %xmm3
	vbroadcastss	.LCPI0_0(%rip), %xmm4   # xmm4 = [1.0E+0,1.0E+0,1.0E+0,1.0E+0]
	vaddsd	%xmm3, %xmm1, %xmm1
	vcvtss2sd	%xmm2, %xmm2, %xmm2
	vsubsd	%xmm2, %xmm1, %xmm1
	vcvtsd2ss	%xmm1, %xmm1, %xmm6
	movl	%r14d, %eax
	movq	-80(%rbp), %rcx                 # 8-byte Reload
	imull	%ecx, %eax
	vcvtsi2sd	%eax, %xmm7, %xmm1
	vmovsd	%xmm1, -152(%rbp)               # 8-byte Spill
	vdivps	%xmm0, %xmm4, %xmm7
	leaq	(,%rbx,4), %rsi
	movq	%rsi, -56(%rbp)                 # 8-byte Spill
	leal	-1(%r14), %eax
	decl	%ecx
	movq	%rcx, -272(%rbp)                # 8-byte Spill
	leaq	-1(%rdx), %rcx
	movq	%rcx, -144(%rbp)                # 8-byte Spill
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
	movq	-136(%rbp), %rax                # 8-byte Reload
	addq	$4, %rax
	movq	%rax, -168(%rbp)                # 8-byte Spill
	leaq	4(%rcx), %rax
	movq	%rax, -160(%rbp)                # 8-byte Spill
	movl	$1, %eax
	vmovss	%xmm5, -48(%rbp)                # 4-byte Spill
	vmovss	%xmm6, -44(%rbp)                # 4-byte Spill
	vmovaps	%xmm7, -112(%rbp)               # 16-byte Spill
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
	cmpq	$3, -144(%rbp)                  # 8-byte Folded Reload
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
	decq	%rbx
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
	vmovaps	-112(%rbp), %xmm7               # 16-byte Reload
	vmovss	-44(%rbp), %xmm6                # 4-byte Reload
                                        # xmm6 = mem[0],zero,zero,zero
	vmovss	-48(%rbp), %xmm5                # 4-byte Reload
                                        # xmm5 = mem[0],zero,zero,zero
	jmp	.LBB0_10
	.p2align	4, 0x90
.LBB0_11:                               # %for.cond36.preheader
                                        #   in Loop: Header=BB0_3 Depth=1
	vxorps	%xmm0, %xmm0, %xmm0
	cmpl	$3, -80(%rbp)                   # 4-byte Folded Reload
	movq	-88(%rbp), %rbx                 # 8-byte Reload
	jl	.LBB0_33
# %bb.12:                               # %for.cond41.preheader.preheader
                                        #   in Loop: Header=BB0_3 Depth=1
	vxorps	%xmm0, %xmm0, %xmm0
	movl	$1, %r9d
	jmp	.LBB0_13
	.p2align	4, 0x90
.LBB0_14:                               # %for.cond41.preheader.for.inc97_crit_edge
                                        #   in Loop: Header=BB0_13 Depth=2
	incq	%r9
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
	movq	-64(%rbp), %rax                 # 8-byte Reload
	vmovss	(%rax,%r10,4), %xmm4            # xmm4 = mem[0],zero,zero,zero
	vmovss	4(%rax,%r10,4), %xmm3           # xmm3 = mem[0],zero,zero,zero
	movl	$1, %edi
	cmpl	$2, -248(%rbp)                  # 4-byte Folded Reload
	jne	.LBB0_27
# %bb.26:                               #   in Loop: Header=BB0_13 Depth=2
	vmovaps	%xmm3, %xmm2
	vmovaps	%xmm4, %xmm1
	jmp	.LBB0_29
	.p2align	4, 0x90
.LBB0_27:                               # %for.body45.preheader
                                        #   in Loop: Header=BB0_13 Depth=2
	movq	-184(%rbp), %rax                # 8-byte Reload
	leaq	(%rax,%r10,4), %r11
	movq	-176(%rbp), %rax                # 8-byte Reload
	leaq	(%rax,%r10,4), %r15
	movq	-168(%rbp), %rax                # 8-byte Reload
	leaq	(%rax,%r10,4), %rdx
	leaq	1(%r9), %rax
	imulq	%rbx, %rax
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
	vmulps	%xmm2, %xmm7, %xmm2
	vmovshdup	%xmm2, %xmm4            # xmm4 = xmm2[1,1,3,3]
	vaddss	%xmm4, %xmm2, %xmm2
	vmulss	%xmm6, %xmm3, %xmm4
	vaddss	%xmm2, %xmm4, %xmm2
	vsubss	-4(%rdx,%rsi,4), %xmm2, %xmm2
	vdivss	%xmm6, %xmm2, %xmm2
	vmulss	%xmm5, %xmm2, %xmm4
	vsubss	%xmm4, %xmm3, %xmm4
	vmovss	%xmm4, -4(%r15,%rsi,4)
	vmulss	%xmm2, %xmm2, %xmm2
	vaddss	%xmm2, %xmm0, %xmm0
	vmovss	(%r11,%rsi,4), %xmm2            # xmm2 = mem[0],zero,zero,zero
	leaq	2(%rsi), %rdi
	vmovss	(%rcx,%rsi,4), %xmm4            # xmm4 = mem[0],zero,zero,zero
	vinsertps	$16, %xmm3, %xmm4, %xmm3 # xmm3 = xmm4[0],xmm3[0],xmm4[2,3]
	vmovss	(%rax,%rsi,4), %xmm4            # xmm4 = mem[0],zero,zero,zero
	vinsertps	$16, %xmm2, %xmm4, %xmm4 # xmm4 = xmm4[0],xmm2[0],xmm4[2,3]
	vaddps	%xmm4, %xmm3, %xmm3
	vmulps	%xmm3, %xmm7, %xmm3
	vmovshdup	%xmm3, %xmm4            # xmm4 = xmm3[1,1,3,3]
	vaddss	%xmm4, %xmm3, %xmm3
	vmulss	%xmm6, %xmm1, %xmm4
	vaddss	%xmm3, %xmm4, %xmm3
	vsubss	(%rdx,%rsi,4), %xmm3, %xmm3
	vdivss	%xmm6, %xmm3, %xmm3
	vmulss	%xmm5, %xmm3, %xmm4
	vsubss	%xmm4, %xmm1, %xmm4
	vmovss	%xmm4, (%r15,%rsi,4)
	vmulss	%xmm3, %xmm3, %xmm3
	vaddss	%xmm3, %xmm0, %xmm0
	leaq	2(%r12,%rsi), %rbx
	vmovaps	%xmm2, %xmm3
	vmovaps	%xmm1, %xmm4
	movq	%rdi, %rsi
	cmpq	$1, %rbx
	jne	.LBB0_28
.LBB0_29:                               # %for.inc97.loopexit.unr-lcssa
                                        #   in Loop: Header=BB0_13 Depth=2
	incq	%r9
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
	movq	-136(%rbp), %rsi                # 8-byte Reload
	leaq	(%rsi,%r10,4), %rsi
	vmovss	(%rcx,%rdi,4), %xmm3            # xmm3 = mem[0],zero,zero,zero
	vinsertps	$16, %xmm1, %xmm3, %xmm1 # xmm1 = xmm3[0],xmm1[0],xmm3[2,3]
	vmovss	(%rax,%rdi,4), %xmm3            # xmm3 = mem[0],zero,zero,zero
	movq	-72(%rbp), %rax                 # 8-byte Reload
	leaq	(%rax,%r10,4), %rax
	vinsertps	$16, 4(%rdx,%rdi,4), %xmm3, %xmm3 # xmm3 = xmm3[0],mem[0],xmm3[2,3]
	vaddps	%xmm3, %xmm1, %xmm1
	vmulps	%xmm1, %xmm7, %xmm1
	vmovshdup	%xmm1, %xmm3            # xmm3 = xmm1[1,1,3,3]
	vaddss	%xmm3, %xmm1, %xmm1
	vmulss	%xmm6, %xmm2, %xmm3
	vaddss	%xmm1, %xmm3, %xmm1
	vsubss	(%rsi,%rdi,4), %xmm1, %xmm1
	vdivss	%xmm6, %xmm1, %xmm1
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
	vmovaps	-112(%rbp), %xmm7               # 16-byte Reload
	vmovss	-44(%rbp), %xmm6                # 4-byte Reload
                                        # xmm6 = mem[0],zero,zero,zero
	vmovss	-48(%rbp), %xmm5                # 4-byte Reload
                                        # xmm5 = mem[0],zero,zero,zero
.LBB0_36:                               # %for.end99.split
                                        #   in Loop: Header=BB0_3 Depth=1
	movq	-128(%rbp), %rax                # 8-byte Reload
	vdivsd	-152(%rbp), %xmm0, %xmm0        # 8-byte Folded Reload
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
	vmovaps	-112(%rbp), %xmm7               # 16-byte Reload
	vmovss	-44(%rbp), %xmm6                # 4-byte Reload
                                        # xmm6 = mem[0],zero,zero,zero
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
	vmovaps	-112(%rbp), %xmm7               # 16-byte Reload
	vmovss	-44(%rbp), %xmm6                # 4-byte Reload
                                        # xmm6 = mem[0],zero,zero,zero
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
	vmovaps	-112(%rbp), %xmm7               # 16-byte Reload
	vmovss	-44(%rbp), %xmm6                # 4-byte Reload
                                        # xmm6 = mem[0],zero,zero,zero
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
	vmovaps	-112(%rbp), %xmm7               # 16-byte Reload
	vmovss	-44(%rbp), %xmm6                # 4-byte Reload
                                        # xmm6 = mem[0],zero,zero,zero
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
	vmovaps	96(%rsp), %xmm0                 # 16-byte Reload
	vinsertps	$16, 32(%rsp), %xmm0, %xmm0 # 16-byte Folded Reload
                                        # xmm0 = xmm0[0],mem[0],xmm0[2,3]
	vmulps	%xmm0, %xmm0, %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm1
	vmovshdup	%xmm0, %xmm2            # xmm2 = xmm0[1,1,3,3]
	vcvtss2sd	%xmm2, %xmm2, %xmm2
	vbroadcastss	.LCPI1_0(%rip), %xmm3   # xmm3 = [1.0E+0,1.0E+0,1.0E+0,1.0E+0]
	movl	%r14d, %edx
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
	decq	%rbx
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
	incq	%r8
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
	leaq	1(%rbx), %rax
	vmulss	%xmm3, %xmm3, %xmm3
	vaddss	%xmm3, %xmm1, %xmm1
	vmovaps	%xmm4, %xmm3
	movq	%rax, %rbx
	cmpq	%rax, %r12
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
	incq	%rbp
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
	incq	%rbx
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
	.section	.rodata.cst32,"aM",@progbits,32
	.p2align	5
.LCPI3_4:
	.long	0                               # 0x0
	.long	1                               # 0x1
	.long	2                               # 0x2
	.long	3                               # 0x3
	.long	4                               # 0x4
	.long	5                               # 0x5
	.long	6                               # 0x6
	.long	7                               # 0x7
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2
.LCPI3_5:
	.long	8                               # 0x8
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
	movq	%r9, -24(%rsp)                  # 8-byte Spill
	movq	%r8, -32(%rsp)                  # 8-byte Spill
                                        # kill: def $esi killed $esi def $rsi
	vmovss	%xmm1, (%rdx)
	leal	-1(%rsi), %eax
	vcvtsi2sd	%eax, %xmm3, %xmm1
	vdivsd	%xmm1, %xmm2, %xmm1
	vcvtsd2ss	%xmm1, %xmm1, %xmm1
	vmovss	%xmm1, (%rcx)
	testl	%edi, %edi
	jle	.LBB3_16
# %bb.1:                                # %for.cond7.preheader.lr.ph
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	movl	%esi, %r12d
	vxorps	.LCPI3_1(%rip), %xmm0, %xmm0
	movl	%edi, %r8d
	leaq	1(%rdx), %rax
	movq	%rax, -8(%rsp)                  # 8-byte Spill
	leaq	1(%rcx), %rax
	movq	%rax, -16(%rsp)                 # 8-byte Spill
	movl	%r12d, %r14d
	andl	$-8, %r14d
	vbroadcastsd	%xmm0, %ymm15
	leaq	(,%r12,4), %r9
	xorl	%r13d, %r13d
	vmovsd	.LCPI3_2(%rip), %xmm2           # xmm2 = mem[0],zero
	vmovsd	.LCPI3_3(%rip), %xmm3           # xmm3 = mem[0],zero
	vbroadcastsd	.LCPI3_2(%rip), %ymm19  # ymm19 = [-1.0E+0,-1.0E+0,-1.0E+0,-1.0E+0]
	vbroadcastsd	.LCPI3_3(%rip), %ymm5   # ymm5 = [1.0E+0,1.0E+0,1.0E+0,1.0E+0]
	vmovdqa64	.LCPI3_4(%rip), %ymm17  # ymm17 = [0,1,2,3,4,5,6,7]
	vpcmpeqd	%ymm10, %ymm10, %ymm10
	vxorps	%xmm8, %xmm8, %xmm8
	vpbroadcastd	.LCPI3_5(%rip), %ymm9   # ymm9 = [8,8,8,8,8,8,8,8]
	movq	-24(%rsp), %rbx                 # 8-byte Reload
	movq	-32(%rsp), %r11                 # 8-byte Reload
	movq	%rsi, -40(%rsp)                 # 8-byte Spill
	movq	%r8, -48(%rsp)                  # 8-byte Spill
	movq	%r9, -56(%rsp)                  # 8-byte Spill
	jmp	.LBB3_2
	.p2align	4, 0x90
.LBB3_15:                               # %for.inc48
                                        #   in Loop: Header=BB3_2 Depth=1
	incq	%r13
	addq	%r9, %r11
	addq	%r9, %rbx
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
	vcvtsi2ss	%eax, %xmm20, %xmm6
	cmpl	$8, %esi
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
	leaq	(%rax,%r8,4), %r10
	movq	-24(%rsp), %rax                 # 8-byte Reload
	leaq	(%rax,%rsi,4), %rsi
	leaq	(%rax,%r8,4), %r15
	cmpq	%r15, %rbp
	setb	-57(%rsp)                       # 1-byte Folded Spill
	cmpq	%r10, %rsi
	setb	%r8b
	movq	-8(%rsp), %rdi                  # 8-byte Reload
	cmpq	%rbp, %rdi
	seta	%r9b
	cmpq	%rdx, %r10
	seta	-58(%rsp)                       # 1-byte Folded Spill
	movq	-16(%rsp), %rax                 # 8-byte Reload
	cmpq	%rbp, %rax
	seta	%bpl
	cmpq	%rcx, %r10
	seta	-59(%rsp)                       # 1-byte Folded Spill
	cmpq	%rsi, %rdi
	seta	%dil
	cmpq	%rdx, %r15
	seta	-60(%rsp)                       # 1-byte Folded Spill
	cmpq	%rsi, %rax
	seta	%r10b
	cmpq	%rcx, %r15
	seta	%al
	testb	%r8b, -57(%rsp)                 # 1-byte Folded Reload
	jne	.LBB3_6
# %bb.7:                                # %vector.memcheck
                                        #   in Loop: Header=BB3_2 Depth=1
	andb	-58(%rsp), %r9b                 # 1-byte Folded Reload
	jne	.LBB3_6
# %bb.8:                                # %vector.memcheck
                                        #   in Loop: Header=BB3_2 Depth=1
	andb	-59(%rsp), %bpl                 # 1-byte Folded Reload
	jne	.LBB3_6
# %bb.9:                                # %vector.memcheck
                                        #   in Loop: Header=BB3_2 Depth=1
	andb	-60(%rsp), %dil                 # 1-byte Folded Reload
	jne	.LBB3_6
# %bb.10:                               # %vector.memcheck
                                        #   in Loop: Header=BB3_2 Depth=1
	movl	$0, %ebp
	andb	%al, %r10b
	movq	-40(%rsp), %rsi                 # 8-byte Reload
	movq	-48(%rsp), %r8                  # 8-byte Reload
	movq	-56(%rsp), %r9                  # 8-byte Reload
	jne	.LBB3_14
# %bb.11:                               # %vector.ph
                                        #   in Loop: Header=BB3_2 Depth=1
	vmulss	(%rdx), %xmm6, %xmm1
	vbroadcastss	%xmm1, %xmm1
	vcvtps2pd	%xmm1, %ymm1
	vaddpd	%ymm19, %ymm1, %ymm1
	vcvttpd2dq	%ymm1, %xmm1
	vbroadcastss	(%rcx), %ymm11
	vpmulld	%xmm1, %xmm1, %xmm1
	vcvtdq2pd	%xmm1, %ymm1
	vsubpd	%ymm1, %ymm5, %ymm1
	vmulpd	%ymm1, %ymm15, %ymm12
	vaddpd	%ymm1, %ymm1, %ymm13
	xorl	%ebp, %ebp
	vmovdqa64	%ymm17, %ymm14
	.p2align	4, 0x90
.LBB3_12:                               # %vector.body
                                        #   Parent Loop BB3_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vpaddd	%ymm10, %ymm14, %ymm1
	vcvtdq2ps	%ymm1, %ymm1
	vmulps	%ymm1, %ymm11, %ymm1
	vcvtps2pd	%xmm1, %ymm16
	vextractf128	$1, %ymm1, %xmm1
	vcvtps2pd	%xmm1, %ymm1
	vaddpd	%ymm19, %ymm16, %ymm16
	vaddpd	%ymm19, %ymm1, %ymm1
	vcvttpd2dq	%ymm16, %xmm7
	vcvttpd2dq	%ymm1, %xmm1
	vpmulld	%xmm1, %xmm1, %xmm1
	vpmulld	%xmm7, %xmm7, %xmm7
	vcvtdq2pd	%xmm7, %ymm7
	vcvtdq2pd	%xmm1, %ymm1
	vsubpd	%ymm7, %ymm5, %ymm7
	vsubpd	%ymm1, %ymm5, %ymm1
	vmulpd	%ymm1, %ymm12, %ymm16
	vmulpd	%ymm7, %ymm12, %ymm18
	vsubpd	%ymm13, %ymm18, %ymm18
	vsubpd	%ymm13, %ymm16, %ymm16
	vaddpd	%ymm7, %ymm7, %ymm7
	vsubpd	%ymm7, %ymm18, %ymm7
	vaddpd	%ymm1, %ymm1, %ymm1
	vsubpd	%ymm1, %ymm16, %ymm1
	vmovups	%ymm8, (%r11,%rbp,4)
	vcvtpd2ps	%ymm7, %xmm7
	vcvtpd2ps	%ymm1, %xmm1
	vmovups	%xmm1, 16(%rbx,%rbp,4)
	vmovupd	%xmm7, (%rbx,%rbp,4)
	addq	$8, %rbp
	vpaddd	%ymm9, %ymm14, %ymm14
	cmpq	%rbp, %r14
	jne	.LBB3_12
# %bb.13:                               # %middle.block
                                        #   in Loop: Header=BB3_2 Depth=1
	movq	%r14, %rbp
	cmpq	%r12, %r14
	jne	.LBB3_14
	jmp	.LBB3_15
.LBB3_6:                                #   in Loop: Header=BB3_2 Depth=1
	xorl	%ebp, %ebp
	movq	-40(%rsp), %rsi                 # 8-byte Reload
	movq	-48(%rsp), %r8                  # 8-byte Reload
	movq	-56(%rsp), %r9                  # 8-byte Reload
	.p2align	4, 0x90
.LBB3_14:                               # %for.body10
                                        #   Parent Loop BB3_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vmulss	(%rdx), %xmm6, %xmm1
	vcvtss2sd	%xmm1, %xmm1, %xmm1
	vaddsd	%xmm2, %xmm1, %xmm1
	vcvttsd2si	%xmm1, %edi
	leal	-1(%rbp), %eax
	vcvtsi2ss	%eax, %xmm20, %xmm1
	vmulss	(%rcx), %xmm1, %xmm1
	vcvtss2sd	%xmm1, %xmm1, %xmm1
	vaddsd	%xmm2, %xmm1, %xmm1
	vcvttsd2si	%xmm1, %eax
	imull	%edi, %edi
	vcvtsi2sd	%edi, %xmm20, %xmm1
	movl	$0, (%r11,%rbp,4)
	vsubsd	%xmm1, %xmm3, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm7
	imull	%eax, %eax
	vcvtsi2sd	%eax, %xmm20, %xmm4
	vsubsd	%xmm4, %xmm3, %xmm4
	vmulsd	%xmm4, %xmm7, %xmm7
	vaddsd	%xmm1, %xmm1, %xmm1
	vsubsd	%xmm1, %xmm7, %xmm1
	vaddsd	%xmm4, %xmm4, %xmm4
	vsubsd	%xmm4, %xmm1, %xmm1
	vcvtsd2ss	%xmm1, %xmm1, %xmm1
	vmovss	%xmm1, (%rbx,%rbp,4)
	incq	%rbp
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
	vzeroupper
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
	vxorps	%xmm0, %xmm0, %xmm0
	xorl	%ebx, %ebx
	vmovss	.LCPI4_0(%rip), %xmm8           # xmm8 = mem[0],zero,zero,zero
	vmovsd	.LCPI4_1(%rip), %xmm4           # xmm4 = mem[0],zero
	jmp	.LBB4_3
	.p2align	4, 0x90
.LBB4_8:                                # %for.inc26
                                        #   in Loop: Header=BB4_3 Depth=1
	incq	%rbx
	addq	%r10, %rdi
	cmpq	%r9, %rbx
	je	.LBB4_9
.LBB4_3:                                # %for.cond1.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB4_5 Depth 2
	testl	%r15d, %r15d
	jle	.LBB4_8
# %bb.4:                                # %for.body3.lr.ph
                                        #   in Loop: Header=BB4_3 Depth=1
	leal	-1(%rbx), %ecx
	vcvtsi2ss	%ecx, %xmm9, %xmm5
	vmulss	%xmm1, %xmm5, %xmm5
	vaddss	%xmm5, %xmm8, %xmm5
	vmulss	%xmm5, %xmm5, %xmm5
	vcvtss2sd	%xmm5, %xmm5, %xmm5
	vsubsd	%xmm5, %xmm4, %xmm5
	xorl	%ecx, %ecx
	cmpl	$1, %r15d
	je	.LBB4_6
	.p2align	4, 0x90
.LBB4_5:                                # %for.body3
                                        #   Parent Loop BB4_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	leal	-1(%rcx), %ebp
	vcvtsi2ss	%ebp, %xmm9, %xmm6
	vmulss	%xmm2, %xmm6, %xmm6
	vmovss	-4(%rdi,%rcx,4), %xmm7          # xmm7 = mem[0],zero,zero,zero
	vmovss	(%rdi,%rcx,4), %xmm3            # xmm3 = mem[0],zero,zero,zero
	vaddss	%xmm6, %xmm8, %xmm6
	vcvtss2sd	%xmm7, %xmm7, %xmm7
	vmulss	%xmm6, %xmm6, %xmm6
	vcvtss2sd	%xmm6, %xmm6, %xmm6
	vsubsd	%xmm6, %xmm4, %xmm6
	vmulsd	%xmm6, %xmm5, %xmm6
	vsubsd	%xmm6, %xmm7, %xmm6
	vcvtsi2ss	%ecx, %xmm9, %xmm7
	vcvtsd2ss	%xmm6, %xmm6, %xmm6
	vmulss	%xmm2, %xmm7, %xmm7
	vaddss	%xmm7, %xmm8, %xmm7
	vcvtss2sd	%xmm3, %xmm3, %xmm3
	vmulss	%xmm7, %xmm7, %xmm7
	vmulss	%xmm6, %xmm6, %xmm6
	vcvtss2sd	%xmm7, %xmm7, %xmm7
	vsubsd	%xmm7, %xmm4, %xmm7
	vmulsd	%xmm7, %xmm5, %xmm7
	vsubsd	%xmm7, %xmm3, %xmm3
	vaddss	%xmm6, %xmm0, %xmm0
	vcvtsd2ss	%xmm3, %xmm3, %xmm3
	vmulss	%xmm3, %xmm3, %xmm3
	vaddss	%xmm3, %xmm0, %xmm0
	addq	$2, %rcx
	cmpq	%rcx, %rsi
	jne	.LBB4_5
.LBB4_6:                                # %for.inc26.loopexit.unr-lcssa
                                        #   in Loop: Header=BB4_3 Depth=1
	testb	$1, %r8b
	je	.LBB4_8
# %bb.7:                                # %for.body3.epil
                                        #   in Loop: Header=BB4_3 Depth=1
	movq	%rbx, %rax
	imulq	%r8, %rax
	leaq	(%rdx,%rax,4), %rax
	leal	-1(%rcx), %ebp
	vcvtsi2ss	%ebp, %xmm9, %xmm3
	vmulss	%xmm2, %xmm3, %xmm3
	vaddss	%xmm3, %xmm8, %xmm3
	vmovss	(%rax,%rcx,4), %xmm6            # xmm6 = mem[0],zero,zero,zero
	vcvtss2sd	%xmm6, %xmm6, %xmm6
	vmulss	%xmm3, %xmm3, %xmm3
	vcvtss2sd	%xmm3, %xmm3, %xmm3
	vsubsd	%xmm3, %xmm4, %xmm3
	vmulsd	%xmm3, %xmm5, %xmm3
	vsubsd	%xmm3, %xmm6, %xmm3
	vcvtsd2ss	%xmm3, %xmm3, %xmm3
	vmulss	%xmm3, %xmm3, %xmm3
	vaddss	%xmm3, %xmm0, %xmm0
	jmp	.LBB4_8
.LBB4_1:
	vxorps	%xmm0, %xmm0, %xmm0
.LBB4_9:                                # %for.end28
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vxorps	%xmm1, %xmm1, %xmm1
	vucomisd	%xmm1, %xmm0
	jb	.LBB4_11
# %bb.10:
	vsqrtsd	%xmm0, %xmm0, %xmm0
	jmp	.LBB4_12
.LBB4_11:                               # %call.sqrt
	callq	sqrt
.LBB4_12:                               # %for.end28.split
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
	.section	.rodata.cst32,"aM",@progbits,32
	.p2align	5
.LCPI5_4:
	.long	0                               # 0x0
	.long	1                               # 0x1
	.long	2                               # 0x2
	.long	3                               # 0x3
	.long	4                               # 0x4
	.long	5                               # 0x5
	.long	6                               # 0x6
	.long	7                               # 0x7
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2
.LCPI5_5:
	.long	7                               # 0x7
.LCPI5_6:
	.long	16                              # 0x10
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
	subq	$328, %rsp                      # imm = 0x148
	.cfi_def_cfa_offset 384
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
                                        # kill: def $edi killed $edi def $rdi
	movl	$256, (%rsp)                    # imm = 0x100
	movl	$256, 4(%rsp)                   # imm = 0x100
	movl	$1029597613, 12(%rsp)           # imm = 0x3D5E69AD
	movl	$786163455, 16(%rsp)            # imm = 0x2EDBE6FF
	movl	$1065353216, 20(%rsp)           # imm = 0x3F800000
	movl	$5000, 36(%rsp)                 # imm = 0x1388
	addl	$-2, %edi
	cmpl	$5, %edi
	ja	.LBB5_11
# %bb.1:                                # %entry
	movq	%rsi, %rbx
	jmpq	*.LJTI5_0(,%rdi,8)
.LBB5_2:                                # %if.then
	movq	8(%rbx), %rdi
	movq	%rsp, %rdx
	movl	$.L.str.6, %esi
	xorl	%eax, %eax
	callq	__isoc99_sscanf
	movl	(%rsp), %eax
	movl	%eax, 4(%rsp)
	jmp	.LBB5_11
.LBB5_3:                                # %if.then2
	movq	8(%rbx), %rdi
	movq	%rsp, %rdx
	movl	$.L.str.6, %esi
	xorl	%eax, %eax
	callq	__isoc99_sscanf
	movq	16(%rbx), %rdi
	leaq	4(%rsp), %rdx
	jmp	.LBB5_9
.LBB5_4:                                # %if.then9
	movq	8(%rbx), %rdi
	movq	%rsp, %rdx
	movl	$.L.str.6, %esi
	xorl	%eax, %eax
	callq	__isoc99_sscanf
	movq	16(%rbx), %rdi
	leaq	4(%rsp), %rdx
	movl	$.L.str.6, %esi
	xorl	%eax, %eax
	callq	__isoc99_sscanf
	movq	24(%rbx), %rdi
	leaq	12(%rsp), %rdx
	movl	$.L.str.7, %esi
	jmp	.LBB5_10
.LBB5_6:                                # %if.then18
	movq	8(%rbx), %rdi
	movq	%rsp, %rdx
	movl	$.L.str.6, %esi
	xorl	%eax, %eax
	callq	__isoc99_sscanf
	movq	16(%rbx), %rdi
	leaq	4(%rsp), %rdx
	movl	$.L.str.6, %esi
	xorl	%eax, %eax
	callq	__isoc99_sscanf
	movq	24(%rbx), %rdi
	leaq	12(%rsp), %rdx
	movl	$.L.str.7, %esi
	xorl	%eax, %eax
	callq	__isoc99_sscanf
	movq	32(%rbx), %rdi
	leaq	16(%rsp), %rdx
	movl	$.L.str.7, %esi
	jmp	.LBB5_10
.LBB5_7:                                # %if.then29
	movq	8(%rbx), %rdi
	movq	%rsp, %rdx
	movl	$.L.str.6, %esi
	xorl	%eax, %eax
	callq	__isoc99_sscanf
	movq	16(%rbx), %rdi
	leaq	4(%rsp), %rdx
	movl	$.L.str.6, %esi
	xorl	%eax, %eax
	callq	__isoc99_sscanf
	movq	24(%rbx), %rdi
	leaq	12(%rsp), %rdx
	movl	$.L.str.7, %esi
	xorl	%eax, %eax
	callq	__isoc99_sscanf
	movq	32(%rbx), %rdi
	leaq	16(%rsp), %rdx
	movl	$.L.str.7, %esi
	xorl	%eax, %eax
	callq	__isoc99_sscanf
	movq	40(%rbx), %rdi
	leaq	20(%rsp), %rdx
	movl	$.L.str.7, %esi
	jmp	.LBB5_10
.LBB5_8:                                # %if.then42
	movq	8(%rbx), %rdi
	movq	%rsp, %rdx
	movl	$.L.str.6, %esi
	xorl	%eax, %eax
	callq	__isoc99_sscanf
	movq	16(%rbx), %rdi
	leaq	4(%rsp), %rdx
	movl	$.L.str.6, %esi
	xorl	%eax, %eax
	callq	__isoc99_sscanf
	movq	24(%rbx), %rdi
	leaq	12(%rsp), %rdx
	movl	$.L.str.7, %esi
	xorl	%eax, %eax
	callq	__isoc99_sscanf
	movq	32(%rbx), %rdi
	leaq	16(%rsp), %rdx
	movl	$.L.str.7, %esi
	xorl	%eax, %eax
	callq	__isoc99_sscanf
	movq	40(%rbx), %rdi
	leaq	20(%rsp), %rdx
	movl	$.L.str.7, %esi
	xorl	%eax, %eax
	callq	__isoc99_sscanf
	movq	48(%rbx), %rdi
	leaq	36(%rsp), %rdx
.LBB5_9:                                # %if.end60
	movl	$.L.str.6, %esi
.LBB5_10:                               # %if.end60
	xorl	%eax, %eax
	callq	__isoc99_sscanf
.LBB5_11:                               # %if.end60
	movl	(%rsp), %esi
	vmovss	12(%rsp), %xmm0                 # xmm0 = mem[0],zero,zero,zero
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vmovss	16(%rsp), %xmm1                 # xmm1 = mem[0],zero,zero,zero
	vcvtss2sd	%xmm1, %xmm1, %xmm1
	movl	4(%rsp), %edx
	vmovss	20(%rsp), %xmm2                 # xmm2 = mem[0],zero,zero,zero
	vcvtss2sd	%xmm2, %xmm2, %xmm2
	movl	36(%rsp), %ecx
	movl	$.L.str.8, %edi
	movb	$3, %al
	callq	printf
	movl	$.Lstr, %edi
	callq	puts
	movslq	(%rsp), %r14
	movl	4(%rsp), %ebx
	movslq	%ebx, %r15
	movq	%r14, %rbp
	imulq	%r15, %rbp
	shlq	$2, %rbp
	movq	%rbp, %rdi
	callq	malloc
	movq	%rax, 72(%rsp)                  # 8-byte Spill
	movq	%rbp, %rdi
	callq	malloc
	movq	%rax, 144(%rsp)                 # 8-byte Spill
	movq	%rbp, 152(%rsp)                 # 8-byte Spill
	movq	%rbp, %rdi
	callq	malloc
	movq	%rax, 40(%rsp)                  # 8-byte Spill
	leal	-1(%r14), %eax
	decl	%r15d
	vmovss	12(%rsp), %xmm0                 # xmm0 = mem[0],zero,zero,zero
	vmovss	%xmm0, 64(%rsp)                 # 4-byte Spill
	vcvtsi2sd	%eax, %xmm3, %xmm0
	movl	%r14d, %eax
	movq	%rax, 24(%rsp)                  # 8-byte Spill
	vmovsd	.LCPI5_0(%rip), %xmm1           # xmm1 = mem[0],zero
	vdivsd	%xmm0, %xmm1, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	vmovss	%xmm0, 8(%rsp)                  # 4-byte Spill
	vcvtsi2sd	%r15d, %xmm3, %xmm0
	vdivsd	%xmm0, %xmm1, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm13
	testq	%r14, %r14
	vmovaps	%xmm13, 48(%rsp)                # 16-byte Spill
	jle	.LBB5_25
# %bb.12:                               # %for.cond7.preheader.lr.ph.i
	vmovss	64(%rsp), %xmm0                 # 4-byte Reload
                                        # xmm0 = mem[0],zero,zero,zero
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vxorps	.LCPI5_1(%rip), %xmm0, %xmm0
	vmovaps	%xmm0, 96(%rsp)                 # 16-byte Spill
	leaq	(,%rbx,4), %r13
	movl	%ebx, %eax
	andl	$-8, %eax
	movq	%rax, 136(%rsp)                 # 8-byte Spill
	addq	$-8, %rax
	movq	%rax, 128(%rsp)                 # 8-byte Spill
	movq	%rax, %rcx
	shrq	$3, %rcx
	incq	%rcx
	vbroadcastss	%xmm13, %ymm14
	movq	40(%rsp), %r12                  # 8-byte Reload
	leaq	32(%r12), %r14
	movq	%rcx, %rax
	movq	%rcx, 120(%rsp)                 # 8-byte Spill
	andq	$-2, %rcx
	negq	%rcx
	movq	%rcx, 112(%rsp)                 # 8-byte Spill
	vmovsd	.LCPI5_2(%rip), %xmm15          # xmm15 = mem[0],zero
	xorl	%r15d, %r15d
	vbroadcastsd	.LCPI5_2(%rip), %ymm17  # ymm17 = [-1.0E+0,-1.0E+0,-1.0E+0,-1.0E+0]
	vbroadcastsd	.LCPI5_3(%rip), %ymm18  # ymm18 = [1.0E+0,1.0E+0,1.0E+0,1.0E+0]
	vpbroadcastd	.LCPI5_5(%rip), %ymm19  # ymm19 = [7,7,7,7,7,7,7,7]
	vpbroadcastd	.LCPI5_6(%rip), %ymm20  # ymm20 = [16,16,16,16,16,16,16,16]
	vmovups	%ymm14, 288(%rsp)               # 32-byte Spill
	vmovupd	%ymm17, 256(%rsp)               # 32-byte Spill
	vmovupd	%ymm18, 224(%rsp)               # 32-byte Spill
	vmovdqu64	%ymm19, 192(%rsp)       # 32-byte Spill
	vmovdqu64	%ymm20, 160(%rsp)       # 32-byte Spill
	jmp	.LBB5_13
	.p2align	4, 0x90
.LBB5_24:                               # %for.inc48.i
                                        #   in Loop: Header=BB5_13 Depth=1
	incq	%r15
	addq	%r13, %r14
	addq	%r13, %r12
	cmpq	24(%rsp), %r15                  # 8-byte Folded Reload
	je	.LBB5_25
.LBB5_13:                               # %for.cond7.preheader.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_19 Depth 2
                                        #     Child Loop BB5_23 Depth 2
	testl	%ebx, %ebx
	jle	.LBB5_24
# %bb.14:                               # %for.body10.lr.ph.i
                                        #   in Loop: Header=BB5_13 Depth=1
	movq	%r13, %rdi
	imulq	%r15, %rdi
	addq	72(%rsp), %rdi                  # 8-byte Folded Reload
	leal	-1(%r15), %eax
	vcvtsi2ss	%eax, %xmm21, %xmm0
	vmulss	8(%rsp), %xmm0, %xmm0           # 4-byte Folded Reload
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vaddsd	%xmm0, %xmm15, %xmm0
	vcvttsd2si	%xmm0, %ebp
	imull	%ebp, %ebp
	xorl	%esi, %esi
	movq	%r13, %rdx
	vzeroupper
	callq	memset@PLT
	vmovsd	.LCPI5_3(%rip), %xmm16          # xmm16 = mem[0],zero
	vcvtsi2sd	%ebp, %xmm21, %xmm0
	vsubsd	%xmm0, %xmm16, %xmm1
	vmulsd	96(%rsp), %xmm1, %xmm11         # 16-byte Folded Reload
	vaddsd	%xmm1, %xmm1, %xmm12
	cmpl	$8, %ebx
	jae	.LBB5_16
# %bb.15:                               #   in Loop: Header=BB5_13 Depth=1
	xorl	%eax, %eax
	vmovaps	48(%rsp), %xmm13                # 16-byte Reload
	vmovsd	.LCPI5_2(%rip), %xmm15          # xmm15 = mem[0],zero
	jmp	.LBB5_23
	.p2align	4, 0x90
.LBB5_16:                               # %vector.ph
                                        #   in Loop: Header=BB5_13 Depth=1
	vbroadcastsd	%xmm11, %ymm3
	vbroadcastsd	%xmm12, %ymm2
	cmpq	$0, 128(%rsp)                   # 8-byte Folded Reload
	vmovups	288(%rsp), %ymm14               # 32-byte Reload
	vmovupd	256(%rsp), %ymm17               # 32-byte Reload
	vmovupd	224(%rsp), %ymm18               # 32-byte Reload
	vmovdqu64	192(%rsp), %ymm19       # 32-byte Reload
	vmovdqu64	160(%rsp), %ymm20       # 32-byte Reload
	je	.LBB5_17
# %bb.18:                               # %vector.body.preheader
                                        #   in Loop: Header=BB5_13 Depth=1
	movq	112(%rsp), %rcx                 # 8-byte Reload
	xorl	%eax, %eax
	vmovdqa	.LCPI5_4(%rip), %ymm4           # ymm4 = [0,1,2,3,4,5,6,7]
	vmovaps	48(%rsp), %xmm13                # 16-byte Reload
	vmovsd	.LCPI5_2(%rip), %xmm15          # xmm15 = mem[0],zero
	vpcmpeqd	%ymm9, %ymm9, %ymm9
	.p2align	4, 0x90
.LBB5_19:                               # %vector.body
                                        #   Parent Loop BB5_13 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vpaddd	%ymm4, %ymm9, %ymm5
	vcvtdq2ps	%ymm5, %ymm5
	vmulps	%ymm5, %ymm14, %ymm5
	vcvtps2pd	%xmm5, %ymm6
	vextractf128	$1, %ymm5, %xmm5
	vcvtps2pd	%xmm5, %ymm5
	vaddpd	%ymm17, %ymm5, %ymm5
	vaddpd	%ymm17, %ymm6, %ymm6
	vcvttpd2dq	%ymm6, %xmm6
	vcvttpd2dq	%ymm5, %xmm5
	vpmulld	%xmm5, %xmm5, %xmm5
	vcvtdq2pd	%xmm5, %ymm5
	vpmulld	%xmm6, %xmm6, %xmm6
	vcvtdq2pd	%xmm6, %ymm6
	vsubpd	%ymm6, %ymm18, %ymm6
	vsubpd	%ymm5, %ymm18, %ymm5
	vmulpd	%ymm5, %ymm3, %ymm7
	vmulpd	%ymm6, %ymm3, %ymm8
	vaddpd	%ymm6, %ymm6, %ymm6
	vaddpd	%ymm5, %ymm5, %ymm5
	vpaddd	%ymm19, %ymm4, %ymm9
	vsubpd	%ymm2, %ymm8, %ymm8
	vcvtdq2ps	%ymm9, %ymm9
	vmulps	%ymm9, %ymm14, %ymm9
	vcvtps2pd	%xmm9, %ymm10
	vextractf128	$1, %ymm9, %xmm0
	vsubpd	%ymm2, %ymm7, %ymm7
	vcvtps2pd	%xmm0, %ymm0
	vaddpd	%ymm17, %ymm10, %ymm9
	vcvttpd2dq	%ymm9, %xmm1
	vpcmpeqd	%ymm9, %ymm9, %ymm9
	vsubpd	%ymm6, %ymm8, %ymm6
	vaddpd	%ymm17, %ymm0, %ymm0
	vcvttpd2dq	%ymm0, %xmm0
	vpmulld	%xmm0, %xmm0, %xmm0
	vsubpd	%ymm5, %ymm7, %ymm5
	vpmulld	%xmm1, %xmm1, %xmm1
	vcvtdq2pd	%xmm1, %ymm1
	vcvtpd2ps	%ymm6, %xmm6
	vsubpd	%ymm1, %ymm18, %ymm1
	vmulpd	%ymm1, %ymm3, %ymm7
	vsubpd	%ymm2, %ymm7, %ymm7
	vaddpd	%ymm1, %ymm1, %ymm1
	vcvtpd2ps	%ymm5, %xmm5
	vsubpd	%ymm1, %ymm7, %ymm1
	vcvtdq2pd	%xmm0, %ymm0
	vsubpd	%ymm0, %ymm18, %ymm0
	vmovups	%xmm6, -32(%r14,%rax,4)
	vmulpd	%ymm0, %ymm3, %ymm6
	vsubpd	%ymm2, %ymm6, %ymm6
	vaddpd	%ymm0, %ymm0, %ymm0
	vsubpd	%ymm0, %ymm6, %ymm0
	vmovups	%xmm5, -16(%r14,%rax,4)
	vcvtpd2ps	%ymm1, %xmm1
	vcvtpd2ps	%ymm0, %xmm0
	vmovupd	%xmm0, 16(%r14,%rax,4)
	vmovupd	%xmm1, (%r14,%rax,4)
	addq	$16, %rax
	vpaddd	%ymm20, %ymm4, %ymm4
	addq	$2, %rcx
	jne	.LBB5_19
# %bb.20:                               # %middle.block.unr-lcssa
                                        #   in Loop: Header=BB5_13 Depth=1
	testb	$1, 120(%rsp)                   # 1-byte Folded Reload
	je	.LBB5_22
.LBB5_21:                               # %vector.body.epil
                                        #   in Loop: Header=BB5_13 Depth=1
	movq	%r15, %rcx
	imulq	%rbx, %rcx
	vpaddd	%ymm4, %ymm9, %ymm0
	vcvtdq2ps	%ymm0, %ymm0
	vmulps	%ymm0, %ymm14, %ymm0
	vcvtps2pd	%xmm0, %ymm1
	movq	40(%rsp), %rdx                  # 8-byte Reload
	leaq	(%rdx,%rcx,4), %rcx
	vextractf128	$1, %ymm0, %xmm0
	vcvtps2pd	%xmm0, %ymm0
	vaddpd	%ymm17, %ymm0, %ymm0
	vaddpd	%ymm17, %ymm1, %ymm1
	vcvttpd2dq	%ymm1, %xmm1
	vcvttpd2dq	%ymm0, %xmm0
	vpmulld	%xmm0, %xmm0, %xmm0
	vcvtdq2pd	%xmm0, %ymm0
	vpmulld	%xmm1, %xmm1, %xmm1
	vcvtdq2pd	%xmm1, %ymm1
	vsubpd	%ymm1, %ymm18, %ymm1
	vsubpd	%ymm0, %ymm18, %ymm0
	vmulpd	%ymm0, %ymm3, %ymm4
	vmulpd	%ymm1, %ymm3, %ymm3
	vsubpd	%ymm2, %ymm3, %ymm3
	vsubpd	%ymm2, %ymm4, %ymm2
	vaddpd	%ymm1, %ymm1, %ymm1
	vsubpd	%ymm1, %ymm3, %ymm1
	vaddpd	%ymm0, %ymm0, %ymm0
	vsubpd	%ymm0, %ymm2, %ymm0
	vcvtpd2ps	%ymm1, %xmm1
	vcvtpd2ps	%ymm0, %xmm0
	vmovupd	%xmm0, 16(%rcx,%rax,4)
	vmovupd	%xmm1, (%rcx,%rax,4)
.LBB5_22:                               # %middle.block
                                        #   in Loop: Header=BB5_13 Depth=1
	movq	136(%rsp), %rcx                 # 8-byte Reload
	movq	%rcx, %rax
	cmpq	%rbx, %rcx
	je	.LBB5_24
	.p2align	4, 0x90
.LBB5_23:                               # %for.body10.i
                                        #   Parent Loop BB5_13 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	leal	-1(%rax), %ecx
	vcvtsi2ss	%ecx, %xmm21, %xmm0
	vmulss	%xmm0, %xmm13, %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vaddsd	%xmm0, %xmm15, %xmm0
	vcvttsd2si	%xmm0, %ecx
	imull	%ecx, %ecx
	vcvtsi2sd	%ecx, %xmm21, %xmm0
	vsubsd	%xmm0, %xmm16, %xmm0
	vmulsd	%xmm0, %xmm11, %xmm1
	vsubsd	%xmm12, %xmm1, %xmm1
	vaddsd	%xmm0, %xmm0, %xmm0
	vsubsd	%xmm0, %xmm1, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	vmovss	%xmm0, (%r12,%rax,4)
	incq	%rax
	cmpq	%rax, %rbx
	jne	.LBB5_23
	jmp	.LBB5_24
.LBB5_17:                               #   in Loop: Header=BB5_13 Depth=1
	xorl	%eax, %eax
	vmovdqa	.LCPI5_4(%rip), %ymm4           # ymm4 = [0,1,2,3,4,5,6,7]
	vmovaps	48(%rsp), %xmm13                # 16-byte Reload
	vmovsd	.LCPI5_2(%rip), %xmm15          # xmm15 = mem[0],zero
	vpcmpeqd	%ymm9, %ymm9, %ymm9
	testb	$1, 120(%rsp)                   # 1-byte Folded Reload
	jne	.LBB5_21
	jmp	.LBB5_22
.LBB5_25:                               # %initialize.exit
	movq	144(%rsp), %r14                 # 8-byte Reload
	movq	%r14, %rdi
	movq	72(%rsp), %rbp                  # 8-byte Reload
	movq	%rbp, %rsi
	movq	152(%rsp), %rdx                 # 8-byte Reload
	vzeroupper
	callq	memcpy@PLT
	vmovss	20(%rsp), %xmm3                 # xmm3 = mem[0],zero,zero,zero
	vmovss	16(%rsp), %xmm4                 # xmm4 = mem[0],zero,zero,zero
	movl	36(%rsp), %r8d
	movq	24(%rsp), %rdi                  # 8-byte Reload
                                        # kill: def $edi killed $edi killed $rdi
	movl	%ebx, %esi
	vmovss	8(%rsp), %xmm0                  # 4-byte Reload
                                        # xmm0 = mem[0],zero,zero,zero
	vmovaps	48(%rsp), %xmm1                 # 16-byte Reload
	vmovss	64(%rsp), %xmm2                 # 4-byte Reload
                                        # xmm2 = mem[0],zero,zero,zero
	movq	%rbp, %rdx
	movq	40(%rsp), %rbx                  # 8-byte Reload
	movq	%rbx, %rcx
	callq	jacobi_seq
	movl	(%rsp), %edi
	vmovss	12(%rsp), %xmm2                 # xmm2 = mem[0],zero,zero,zero
	movl	4(%rsp), %esi
	vmovss	20(%rsp), %xmm3                 # xmm3 = mem[0],zero,zero,zero
	vmovd	16(%rsp), %xmm4                 # xmm4 = mem[0],zero,zero,zero
	movl	36(%rsp), %r8d
	vmovss	8(%rsp), %xmm0                  # 4-byte Reload
                                        # xmm0 = mem[0],zero,zero,zero
	vmovaps	48(%rsp), %xmm1                 # 16-byte Reload
	movq	%r14, %rdx
	movq	%rbx, %rcx
	callq	jacobi_omp
	movl	(%rsp), %ecx
	movl	4(%rsp), %r13d
	movslq	%r13d, %rdx
	leal	-1(%rcx), %eax
	vcvtsi2sd	%eax, %xmm21, %xmm0
	vmovsd	.LCPI5_0(%rip), %xmm1           # xmm1 = mem[0],zero
	vdivsd	%xmm0, %xmm1, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm13
	movq	%rdx, 64(%rsp)                  # 8-byte Spill
	leal	-1(%rdx), %eax
	vcvtsi2sd	%eax, %xmm21, %xmm0
	vdivsd	%xmm0, %xmm1, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm14
	movq	%rcx, 24(%rsp)                  # 8-byte Spill
	testl	%ecx, %ecx
	vmovss	%xmm13, 8(%rsp)                 # 4-byte Spill
	vmovaps	%xmm14, 48(%rsp)                # 16-byte Spill
	jle	.LBB5_39
# %bb.26:                               # %for.cond7.preheader.lr.ph.i185
	vmovss	12(%rsp), %xmm0                 # xmm0 = mem[0],zero,zero,zero
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vxorps	.LCPI5_1(%rip), %xmm0, %xmm0
	vmovaps	%xmm0, 96(%rsp)                 # 16-byte Spill
	leaq	(,%r13,4), %r12
	movl	%r13d, %eax
	andl	$-8, %eax
	movq	%rax, 136(%rsp)                 # 8-byte Spill
	addq	$-8, %rax
	movq	%rax, 128(%rsp)                 # 8-byte Spill
	movq	%rax, %rcx
	shrq	$3, %rcx
	incq	%rcx
	vbroadcastss	%xmm14, %ymm15
	movq	40(%rsp), %rbx                  # 8-byte Reload
	leaq	32(%rbx), %r14
	movq	%rcx, %rax
	movq	%rcx, 120(%rsp)                 # 8-byte Spill
	andq	$-2, %rcx
	negq	%rcx
	movq	%rcx, 112(%rsp)                 # 8-byte Spill
	vmovsd	.LCPI5_2(%rip), %xmm16          # xmm16 = mem[0],zero
	xorl	%ebp, %ebp
	vbroadcastsd	.LCPI5_2(%rip), %ymm18  # ymm18 = [-1.0E+0,-1.0E+0,-1.0E+0,-1.0E+0]
	vbroadcastsd	.LCPI5_3(%rip), %ymm19  # ymm19 = [1.0E+0,1.0E+0,1.0E+0,1.0E+0]
	vpbroadcastd	.LCPI5_5(%rip), %ymm20  # ymm20 = [7,7,7,7,7,7,7,7]
	vpbroadcastd	.LCPI5_6(%rip), %ymm21  # ymm21 = [16,16,16,16,16,16,16,16]
	vmovups	%ymm15, 288(%rsp)               # 32-byte Spill
	vmovupd	%ymm18, 256(%rsp)               # 32-byte Spill
	vmovupd	%ymm19, 224(%rsp)               # 32-byte Spill
	vmovdqu64	%ymm20, 192(%rsp)       # 32-byte Spill
	vmovdqu64	%ymm21, 160(%rsp)       # 32-byte Spill
	jmp	.LBB5_27
	.p2align	4, 0x90
.LBB5_38:                               # %for.inc48.i222
                                        #   in Loop: Header=BB5_27 Depth=1
	incq	%rbp
	addq	%r12, %r14
	addq	%r12, %rbx
	cmpq	24(%rsp), %rbp                  # 8-byte Folded Reload
	je	.LBB5_39
.LBB5_27:                               # %for.cond7.preheader.i187
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_33 Depth 2
                                        #     Child Loop BB5_37 Depth 2
	testl	%r13d, %r13d
	jle	.LBB5_38
# %bb.28:                               # %for.body10.lr.ph.i191
                                        #   in Loop: Header=BB5_27 Depth=1
	movq	%r12, %rdi
	imulq	%rbp, %rdi
	addq	72(%rsp), %rdi                  # 8-byte Folded Reload
	leal	-1(%rbp), %eax
	vcvtsi2ss	%eax, %xmm22, %xmm0
	vmulss	%xmm0, %xmm13, %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vaddsd	%xmm16, %xmm0, %xmm0
	vcvttsd2si	%xmm0, %r15d
	imull	%r15d, %r15d
	xorl	%esi, %esi
	movq	%r12, %rdx
	vzeroupper
	callq	memset@PLT
	vmovsd	.LCPI5_3(%rip), %xmm17          # xmm17 = mem[0],zero
	vcvtsi2sd	%r15d, %xmm22, %xmm0
	vsubsd	%xmm0, %xmm17, %xmm1
	vmulsd	96(%rsp), %xmm1, %xmm11         # 16-byte Folded Reload
	vaddsd	%xmm1, %xmm1, %xmm12
	cmpl	$8, %r13d
	jae	.LBB5_30
# %bb.29:                               #   in Loop: Header=BB5_27 Depth=1
	xorl	%eax, %eax
	vmovss	8(%rsp), %xmm13                 # 4-byte Reload
                                        # xmm13 = mem[0],zero,zero,zero
	vmovaps	48(%rsp), %xmm14                # 16-byte Reload
	vmovsd	.LCPI5_2(%rip), %xmm16          # xmm16 = mem[0],zero
	jmp	.LBB5_37
	.p2align	4, 0x90
.LBB5_30:                               # %vector.ph291
                                        #   in Loop: Header=BB5_27 Depth=1
	vbroadcastsd	%xmm11, %ymm3
	vbroadcastsd	%xmm12, %ymm2
	cmpq	$0, 128(%rsp)                   # 8-byte Folded Reload
	vmovups	288(%rsp), %ymm15               # 32-byte Reload
	vmovupd	256(%rsp), %ymm18               # 32-byte Reload
	vmovupd	224(%rsp), %ymm19               # 32-byte Reload
	vmovdqu64	192(%rsp), %ymm20       # 32-byte Reload
	vmovdqu64	160(%rsp), %ymm21       # 32-byte Reload
	je	.LBB5_31
# %bb.32:                               # %vector.body289.preheader
                                        #   in Loop: Header=BB5_27 Depth=1
	movq	112(%rsp), %rcx                 # 8-byte Reload
	xorl	%eax, %eax
	vmovdqa	.LCPI5_4(%rip), %ymm4           # ymm4 = [0,1,2,3,4,5,6,7]
	vmovss	8(%rsp), %xmm13                 # 4-byte Reload
                                        # xmm13 = mem[0],zero,zero,zero
	vmovaps	48(%rsp), %xmm14                # 16-byte Reload
	vmovsd	.LCPI5_2(%rip), %xmm16          # xmm16 = mem[0],zero
	vpcmpeqd	%ymm9, %ymm9, %ymm9
	.p2align	4, 0x90
.LBB5_33:                               # %vector.body289
                                        #   Parent Loop BB5_27 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vpaddd	%ymm4, %ymm9, %ymm5
	vcvtdq2ps	%ymm5, %ymm5
	vmulps	%ymm5, %ymm15, %ymm5
	vcvtps2pd	%xmm5, %ymm6
	vextractf128	$1, %ymm5, %xmm5
	vcvtps2pd	%xmm5, %ymm5
	vaddpd	%ymm18, %ymm5, %ymm5
	vaddpd	%ymm18, %ymm6, %ymm6
	vcvttpd2dq	%ymm6, %xmm6
	vcvttpd2dq	%ymm5, %xmm5
	vpmulld	%xmm5, %xmm5, %xmm5
	vcvtdq2pd	%xmm5, %ymm5
	vpmulld	%xmm6, %xmm6, %xmm6
	vcvtdq2pd	%xmm6, %ymm6
	vsubpd	%ymm6, %ymm19, %ymm6
	vsubpd	%ymm5, %ymm19, %ymm5
	vmulpd	%ymm5, %ymm3, %ymm7
	vmulpd	%ymm6, %ymm3, %ymm8
	vaddpd	%ymm6, %ymm6, %ymm6
	vaddpd	%ymm5, %ymm5, %ymm5
	vpaddd	%ymm20, %ymm4, %ymm9
	vsubpd	%ymm2, %ymm8, %ymm8
	vcvtdq2ps	%ymm9, %ymm9
	vmulps	%ymm9, %ymm15, %ymm9
	vcvtps2pd	%xmm9, %ymm10
	vextractf128	$1, %ymm9, %xmm0
	vsubpd	%ymm2, %ymm7, %ymm7
	vcvtps2pd	%xmm0, %ymm0
	vaddpd	%ymm18, %ymm10, %ymm9
	vcvttpd2dq	%ymm9, %xmm1
	vpcmpeqd	%ymm9, %ymm9, %ymm9
	vsubpd	%ymm6, %ymm8, %ymm6
	vaddpd	%ymm18, %ymm0, %ymm0
	vcvttpd2dq	%ymm0, %xmm0
	vpmulld	%xmm0, %xmm0, %xmm0
	vsubpd	%ymm5, %ymm7, %ymm5
	vpmulld	%xmm1, %xmm1, %xmm1
	vcvtdq2pd	%xmm1, %ymm1
	vcvtpd2ps	%ymm6, %xmm6
	vsubpd	%ymm1, %ymm19, %ymm1
	vmulpd	%ymm1, %ymm3, %ymm7
	vsubpd	%ymm2, %ymm7, %ymm7
	vaddpd	%ymm1, %ymm1, %ymm1
	vcvtpd2ps	%ymm5, %xmm5
	vsubpd	%ymm1, %ymm7, %ymm1
	vcvtdq2pd	%xmm0, %ymm0
	vsubpd	%ymm0, %ymm19, %ymm0
	vmovups	%xmm6, -32(%r14,%rax,4)
	vmulpd	%ymm0, %ymm3, %ymm6
	vsubpd	%ymm2, %ymm6, %ymm6
	vaddpd	%ymm0, %ymm0, %ymm0
	vsubpd	%ymm0, %ymm6, %ymm0
	vmovups	%xmm5, -16(%r14,%rax,4)
	vcvtpd2ps	%ymm1, %xmm1
	vcvtpd2ps	%ymm0, %xmm0
	vmovupd	%xmm0, 16(%r14,%rax,4)
	vmovupd	%xmm1, (%r14,%rax,4)
	addq	$16, %rax
	vpaddd	%ymm21, %ymm4, %ymm4
	addq	$2, %rcx
	jne	.LBB5_33
# %bb.34:                               # %middle.block287.unr-lcssa
                                        #   in Loop: Header=BB5_27 Depth=1
	testb	$1, 120(%rsp)                   # 1-byte Folded Reload
	je	.LBB5_36
.LBB5_35:                               # %vector.body289.epil
                                        #   in Loop: Header=BB5_27 Depth=1
	movq	%rbp, %rcx
	imulq	%r13, %rcx
	vpaddd	%ymm4, %ymm9, %ymm0
	vcvtdq2ps	%ymm0, %ymm0
	vmulps	%ymm0, %ymm15, %ymm0
	vcvtps2pd	%xmm0, %ymm1
	movq	40(%rsp), %rdx                  # 8-byte Reload
	leaq	(%rdx,%rcx,4), %rcx
	vextractf128	$1, %ymm0, %xmm0
	vcvtps2pd	%xmm0, %ymm0
	vaddpd	%ymm18, %ymm0, %ymm0
	vaddpd	%ymm18, %ymm1, %ymm1
	vcvttpd2dq	%ymm1, %xmm1
	vcvttpd2dq	%ymm0, %xmm0
	vpmulld	%xmm0, %xmm0, %xmm0
	vcvtdq2pd	%xmm0, %ymm0
	vpmulld	%xmm1, %xmm1, %xmm1
	vcvtdq2pd	%xmm1, %ymm1
	vsubpd	%ymm1, %ymm19, %ymm1
	vsubpd	%ymm0, %ymm19, %ymm0
	vmulpd	%ymm0, %ymm3, %ymm4
	vmulpd	%ymm1, %ymm3, %ymm3
	vsubpd	%ymm2, %ymm3, %ymm3
	vsubpd	%ymm2, %ymm4, %ymm2
	vaddpd	%ymm1, %ymm1, %ymm1
	vsubpd	%ymm1, %ymm3, %ymm1
	vaddpd	%ymm0, %ymm0, %ymm0
	vsubpd	%ymm0, %ymm2, %ymm0
	vcvtpd2ps	%ymm1, %xmm1
	vcvtpd2ps	%ymm0, %xmm0
	vmovupd	%xmm0, 16(%rcx,%rax,4)
	vmovupd	%xmm1, (%rcx,%rax,4)
.LBB5_36:                               # %middle.block287
                                        #   in Loop: Header=BB5_27 Depth=1
	movq	136(%rsp), %rcx                 # 8-byte Reload
	movq	%rcx, %rax
	cmpq	%r13, %rcx
	je	.LBB5_38
	.p2align	4, 0x90
.LBB5_37:                               # %for.body10.i219
                                        #   Parent Loop BB5_27 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	leal	-1(%rax), %ecx
	vcvtsi2ss	%ecx, %xmm22, %xmm0
	vmulss	%xmm0, %xmm14, %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vaddsd	%xmm16, %xmm0, %xmm0
	vcvttsd2si	%xmm0, %ecx
	imull	%ecx, %ecx
	vcvtsi2sd	%ecx, %xmm22, %xmm0
	vsubsd	%xmm0, %xmm17, %xmm0
	vmulsd	%xmm0, %xmm11, %xmm1
	vsubsd	%xmm12, %xmm1, %xmm1
	vaddsd	%xmm0, %xmm0, %xmm0
	vsubsd	%xmm0, %xmm1, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	vmovss	%xmm0, (%rbx,%rax,4)
	incq	%rax
	cmpq	%rax, %r13
	jne	.LBB5_37
	jmp	.LBB5_38
.LBB5_31:                               #   in Loop: Header=BB5_27 Depth=1
	xorl	%eax, %eax
	vmovdqa	.LCPI5_4(%rip), %ymm4           # ymm4 = [0,1,2,3,4,5,6,7]
	vmovss	8(%rsp), %xmm13                 # 4-byte Reload
                                        # xmm13 = mem[0],zero,zero,zero
	vmovaps	48(%rsp), %xmm14                # 16-byte Reload
	vmovsd	.LCPI5_2(%rip), %xmm16          # xmm16 = mem[0],zero
	vpcmpeqd	%ymm9, %ymm9, %ymm9
	testb	$1, 120(%rsp)                   # 1-byte Folded Reload
	jne	.LBB5_35
	jmp	.LBB5_36
.LBB5_39:                               # %initialize.exit223
	movslq	24(%rsp), %rdx                  # 4-byte Folded Reload
	imulq	64(%rsp), %rdx                  # 8-byte Folded Reload
	shlq	$2, %rdx
	movq	144(%rsp), %r15                 # 8-byte Reload
	movq	%r15, %rdi
	movq	72(%rsp), %r12                  # 8-byte Reload
	movq	%r12, %rsi
	vzeroupper
	callq	memcpy@PLT
	vxorpd	%xmm0, %xmm0, %xmm0
	movl	$20, %ebp
	leaq	80(%rsp), %rbx
	movq	40(%rsp), %r13                  # 8-byte Reload
	.p2align	4, 0x90
.LBB5_40:                               # %for.body
                                        # =>This Inner Loop Header: Depth=1
	vmovsd	%xmm0, 24(%rsp)                 # 8-byte Spill
	movq	%rbx, %rdi
	callq	ftime
	vcvtsi2sdq	80(%rsp), %xmm22, %xmm0
	vmovsd	.LCPI5_7(%rip), %xmm1           # xmm1 = mem[0],zero
	vmulsd	%xmm1, %xmm0, %xmm0
	movzwl	88(%rsp), %eax
	vcvtsi2sd	%eax, %xmm22, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, 96(%rsp)                 # 8-byte Spill
	movl	(%rsp), %edi
	vmovss	12(%rsp), %xmm2                 # xmm2 = mem[0],zero,zero,zero
	movl	4(%rsp), %esi
	vmovss	20(%rsp), %xmm3                 # xmm3 = mem[0],zero,zero,zero
	vmovd	16(%rsp), %xmm4                 # xmm4 = mem[0],zero,zero,zero
	movl	36(%rsp), %r8d
	vmovss	8(%rsp), %xmm0                  # 4-byte Reload
                                        # xmm0 = mem[0],zero,zero,zero
	vmovaps	48(%rsp), %xmm1                 # 16-byte Reload
	movq	%r12, %rdx
	movq	%r13, %rcx
	callq	jacobi_seq
	movq	%rbx, %rdi
	callq	ftime
	vcvtsi2sdq	80(%rsp), %xmm22, %xmm0
	vmulsd	.LCPI5_7(%rip), %xmm0, %xmm0
	movzwl	88(%rsp), %eax
	vcvtsi2sd	%eax, %xmm22, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vsubsd	96(%rsp), %xmm0, %xmm0          # 8-byte Folded Reload
	vmovsd	24(%rsp), %xmm1                 # 8-byte Reload
                                        # xmm1 = mem[0],zero
	vaddsd	%xmm0, %xmm1, %xmm1
	vmovsd	%xmm1, 24(%rsp)                 # 8-byte Spill
	vmovsd	24(%rsp), %xmm0                 # 8-byte Reload
                                        # xmm0 = mem[0],zero
	decl	%ebp
	jne	.LBB5_40
# %bb.41:                               # %for.cond.cleanup
	vdivsd	.LCPI5_8(%rip), %xmm0, %xmm0
	movl	$.L.str.10, %edi
	movb	$1, %al
	callq	printf
	movl	$.L.str.11, %edi
	callq	puts
	vxorpd	%xmm0, %xmm0, %xmm0
	movl	$20, %ebp
	leaq	80(%rsp), %rbx
	.p2align	4, 0x90
.LBB5_42:                               # %for.body99
                                        # =>This Inner Loop Header: Depth=1
	vmovsd	%xmm0, 24(%rsp)                 # 8-byte Spill
	movq	%rbx, %rdi
	callq	ftime
	vcvtsi2sdq	80(%rsp), %xmm22, %xmm0
	vmovsd	.LCPI5_7(%rip), %xmm1           # xmm1 = mem[0],zero
	vmulsd	%xmm1, %xmm0, %xmm0
	movzwl	88(%rsp), %eax
	vcvtsi2sd	%eax, %xmm22, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, 96(%rsp)                 # 8-byte Spill
	movl	(%rsp), %edi
	vmovss	12(%rsp), %xmm2                 # xmm2 = mem[0],zero,zero,zero
	movl	4(%rsp), %esi
	vmovss	20(%rsp), %xmm3                 # xmm3 = mem[0],zero,zero,zero
	vmovd	16(%rsp), %xmm4                 # xmm4 = mem[0],zero,zero,zero
	movl	36(%rsp), %r8d
	vmovss	8(%rsp), %xmm0                  # 4-byte Reload
                                        # xmm0 = mem[0],zero,zero,zero
	vmovaps	48(%rsp), %xmm1                 # 16-byte Reload
	movq	%r15, %rdx
	movq	%r13, %rcx
	callq	jacobi_omp
	movq	%rbx, %rdi
	callq	ftime
	vcvtsi2sdq	80(%rsp), %xmm8, %xmm0
	vmulsd	.LCPI5_7(%rip), %xmm0, %xmm0
	movzwl	88(%rsp), %eax
	vcvtsi2sd	%eax, %xmm8, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vsubsd	96(%rsp), %xmm0, %xmm0          # 8-byte Folded Reload
	vmovsd	24(%rsp), %xmm1                 # 8-byte Reload
                                        # xmm1 = mem[0],zero
	vaddsd	%xmm0, %xmm1, %xmm1
	vmovsd	%xmm1, 24(%rsp)                 # 8-byte Spill
	vmovsd	24(%rsp), %xmm0                 # 8-byte Reload
                                        # xmm0 = mem[0],zero
	decl	%ebp
	jne	.LBB5_42
# %bb.43:                               # %for.cond.cleanup98
	vdivsd	.LCPI5_8(%rip), %xmm0, %xmm0
	movl	$.L.str.12, %edi
	movb	$1, %al
	callq	printf
	movl	(%rsp), %r14d
	movl	4(%rsp), %ebp
	testl	%r14d, %r14d
	jle	.LBB5_44
# %bb.45:                               # %for.cond1.preheader.lr.ph.i
	movl	%ebp, %eax
	andl	$-2, %eax
	leaq	4(%r12), %rcx
	leaq	(,%rbp,4), %r8
	vxorpd	%xmm0, %xmm0, %xmm0
	xorl	%edx, %edx
	vmovss	.LCPI5_9(%rip), %xmm1           # xmm1 = mem[0],zero,zero,zero
	vmovsd	.LCPI5_3(%rip), %xmm2           # xmm2 = mem[0],zero
	vmovss	8(%rsp), %xmm8                  # 4-byte Reload
                                        # xmm8 = mem[0],zero,zero,zero
	vmovaps	48(%rsp), %xmm7                 # 16-byte Reload
	jmp	.LBB5_46
	.p2align	4, 0x90
.LBB5_51:                               # %for.inc26.i
                                        #   in Loop: Header=BB5_46 Depth=1
	incq	%rdx
	addq	%r8, %rcx
	cmpq	%r14, %rdx
	je	.LBB5_52
.LBB5_46:                               # %for.cond1.preheader.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_48 Depth 2
	testl	%ebp, %ebp
	jle	.LBB5_51
# %bb.47:                               # %for.body3.lr.ph.i
                                        #   in Loop: Header=BB5_46 Depth=1
	leal	-1(%rdx), %edi
	vcvtsi2ss	%edi, %xmm10, %xmm3
	vmulss	%xmm3, %xmm8, %xmm3
	vaddss	%xmm1, %xmm3, %xmm3
	vmulss	%xmm3, %xmm3, %xmm3
	vcvtss2sd	%xmm3, %xmm3, %xmm3
	vsubsd	%xmm3, %xmm2, %xmm3
	xorl	%edi, %edi
	cmpl	$1, %ebp
	je	.LBB5_49
	.p2align	4, 0x90
.LBB5_48:                               # %for.body3.i
                                        #   Parent Loop BB5_46 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	leal	-1(%rdi), %ebx
	vcvtsi2ss	%ebx, %xmm9, %xmm4
	vmulss	%xmm4, %xmm7, %xmm4
	vmovss	-4(%rcx,%rdi,4), %xmm5          # xmm5 = mem[0],zero,zero,zero
	vmovss	(%rcx,%rdi,4), %xmm6            # xmm6 = mem[0],zero,zero,zero
	vaddss	%xmm1, %xmm4, %xmm4
	vcvtss2sd	%xmm5, %xmm5, %xmm5
	vmulss	%xmm4, %xmm4, %xmm4
	vcvtss2sd	%xmm4, %xmm4, %xmm4
	vsubsd	%xmm4, %xmm2, %xmm4
	vmulsd	%xmm4, %xmm3, %xmm4
	vsubsd	%xmm4, %xmm5, %xmm4
	vcvtsi2ss	%edi, %xmm9, %xmm5
	vcvtsd2ss	%xmm4, %xmm4, %xmm4
	vmulss	%xmm5, %xmm7, %xmm5
	vaddss	%xmm1, %xmm5, %xmm5
	vcvtss2sd	%xmm6, %xmm6, %xmm6
	vmulss	%xmm5, %xmm5, %xmm5
	vmulss	%xmm4, %xmm4, %xmm4
	vcvtss2sd	%xmm5, %xmm5, %xmm5
	vsubsd	%xmm5, %xmm2, %xmm5
	vmulsd	%xmm5, %xmm3, %xmm5
	vsubsd	%xmm5, %xmm6, %xmm5
	vaddss	%xmm4, %xmm0, %xmm0
	vcvtsd2ss	%xmm5, %xmm5, %xmm4
	vmulss	%xmm4, %xmm4, %xmm4
	vaddss	%xmm4, %xmm0, %xmm0
	addq	$2, %rdi
	cmpq	%rdi, %rax
	jne	.LBB5_48
.LBB5_49:                               # %for.inc26.i.loopexit.unr-lcssa
                                        #   in Loop: Header=BB5_46 Depth=1
	testb	$1, %bpl
	je	.LBB5_51
# %bb.50:                               # %for.body3.i.epil
                                        #   in Loop: Header=BB5_46 Depth=1
	movq	%rdx, %rsi
	imulq	%rbp, %rsi
	leaq	(%r12,%rsi,4), %rsi
	leal	-1(%rdi), %ebx
	vcvtsi2ss	%ebx, %xmm9, %xmm4
	vmulss	%xmm4, %xmm7, %xmm4
	vaddss	%xmm1, %xmm4, %xmm4
	vmovss	(%rsi,%rdi,4), %xmm5            # xmm5 = mem[0],zero,zero,zero
	vcvtss2sd	%xmm5, %xmm5, %xmm5
	vmulss	%xmm4, %xmm4, %xmm4
	vcvtss2sd	%xmm4, %xmm4, %xmm4
	vsubsd	%xmm4, %xmm2, %xmm4
	vmulsd	%xmm4, %xmm3, %xmm3
	vsubsd	%xmm3, %xmm5, %xmm3
	vcvtsd2ss	%xmm3, %xmm3, %xmm3
	vmulss	%xmm3, %xmm3, %xmm3
	vaddss	%xmm3, %xmm0, %xmm0
	jmp	.LBB5_51
.LBB5_44:
	vxorpd	%xmm0, %xmm0, %xmm0
.LBB5_52:                               # %error_check.exit
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vxorps	%xmm1, %xmm1, %xmm1
	vucomisd	%xmm1, %xmm0
	jb	.LBB5_54
# %bb.53:
	vsqrtsd	%xmm0, %xmm0, %xmm0
	jmp	.LBB5_55
.LBB5_54:                               # %call.sqrt
	callq	sqrt
.LBB5_55:                               # %error_check.exit.split
	imull	%ebp, %r14d
	vcvtsi2sd	%r14d, %xmm10, %xmm1
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
	addq	$328, %rsp                      # imm = 0x148
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
