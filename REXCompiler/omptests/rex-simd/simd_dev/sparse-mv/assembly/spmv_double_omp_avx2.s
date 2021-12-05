	.text
	.file	"spmv_double.c"
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
	movl	$.L.str, %edi
	xorl	%eax, %eax
	callq	printf
	testl	%ebx, %ebx
	jle	.LBB1_6
# %bb.1:                                # %for.cond1.preheader.lr.ph
	movslq	12(%rsp), %r13                  # 4-byte Folded Reload
	movl	%ebx, %eax
	movq	%rax, 16(%rsp)                  # 8-byte Spill
	movl	%r13d, %r14d
	shlq	$3, %r13
	xorl	%ebp, %ebp
	jmp	.LBB1_2
	.p2align	4, 0x90
.LBB1_5:                                # %for.end
                                        #   in Loop: Header=BB1_2 Depth=1
	movl	$10, %edi
	callq	putchar@PLT
	incq	%rbp
	addq	%r13, %r12
	cmpq	16(%rsp), %rbp                  # 8-byte Folded Reload
	je	.LBB1_6
.LBB1_2:                                # %for.cond1.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_4 Depth 2
	cmpl	$0, 12(%rsp)                    # 4-byte Folded Reload
	jle	.LBB1_5
# %bb.3:                                # %for.body3.lr.ph
                                        #   in Loop: Header=BB1_2 Depth=1
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB1_4:                                # %for.body3
                                        #   Parent Loop BB1_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vmovsd	(%r12,%rbx,8), %xmm0            # xmm0 = mem[0],zero
	movl	$.L.str.1, %edi
	movq	%r15, %rsi
	movl	%ebp, %edx
	movl	%ebx, %ecx
	movb	$1, %al
	callq	printf
	incq	%rbx
	cmpq	%rbx, %r14
	jne	.LBB1_4
	jmp	.LBB1_5
.LBB1_6:                                # %for.end8
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
.Lfunc_end1:
	.size	print_array, .Lfunc_end1-print_array
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3                               # -- Begin function main
.LCPI2_0:
	.quad	0x3ff0000000000000              # double 1
.LCPI2_1:
	.quad	0x408f400000000000              # double 1000
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
	subq	$88, %rsp
	.cfi_def_cfa_offset 144
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movl	$10240, %eax                    # imm = 0x2800
	cmpl	$2, %edi
	jl	.LBB2_2
# %bb.1:                                # %if.then
	movq	8(%rsi), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	callq	strtol
.LBB2_2:                                # %if.end
	movq	%rax, 40(%rsp)                  # 8-byte Spill
	movl	%eax, %ebp
	imull	%ebp, %ebp
	leal	(%rbp,%rbp,4), %ebx
	leaq	(,%rbp,4), %rdi
	callq	malloc
	movq	%rax, %r14
	leaq	(,%rbx,4), %rdi
	callq	malloc
	movq	%rax, %r15
	shlq	$3, %rbx
	movq	%rbx, %rdi
	callq	malloc
	movq	%rax, %rbx
	movq	%rbp, 16(%rsp)                  # 8-byte Spill
	leaq	(,%rbp,8), %r13
	movq	%r13, %rdi
	callq	malloc
	movq	%rax, %r12
	movq	%r13, %rdi
	callq	malloc
	movq	40(%rsp), %r8                   # 8-byte Reload
	movq	%rax, 8(%rsp)                   # 8-byte Spill
	testl	%r8d, %r8d
	jle	.LBB2_3
# %bb.4:                                # %for.cond18.preheader.lr.ph
	leal	-1(%r8), %eax
	leal	1(%r8), %ecx
	movq	%rcx, 72(%rsp)                  # 8-byte Spill
	movl	$1, %ecx
	subl	%r8d, %ecx
	movl	%ecx, 36(%rsp)                  # 4-byte Spill
	movq	%r14, %rcx
	addq	$4, %rcx
	movq	%rcx, 64(%rsp)                  # 8-byte Spill
	xorl	%ebp, %ebp
	movabsq	$-4616189618054758400, %rcx     # imm = 0xBFF0000000000000
	xorl	%edx, %edx
	xorl	%r11d, %r11d
	movq	%r14, 80(%rsp)                  # 8-byte Spill
	jmp	.LBB2_5
	.p2align	4, 0x90
.LBB2_22:                               # %for.inc69.loopexit
                                        #   in Loop: Header=BB2_5 Depth=1
	movq	24(%rsp), %rsi                  # 8-byte Reload
	addq	%r14, %rsi
	movq	80(%rsp), %r14                  # 8-byte Reload
	movq	40(%rsp), %r8                   # 8-byte Reload
.LBB2_23:                               # %for.inc69
                                        #   in Loop: Header=BB2_5 Depth=1
	incl	%edx
	movl	%esi, %ebp
	cmpl	%r8d, %edx
	je	.LBB2_24
.LBB2_5:                                # %for.body21.lr.ph
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_14 Depth 2
	movslq	%ebp, %r10
	movl	%r11d, (%r14,%r10,4)
	testl	%edx, %edx
	je	.LBB2_7
# %bb.6:                                # %if.then25.peel
                                        #   in Loop: Header=BB2_5 Depth=1
	movl	%ebp, %esi
	subl	%r8d, %esi
	movslq	%r11d, %rdi
	movl	%esi, (%r15,%rdi,4)
	movq	%rcx, (%rbx,%rdi,8)
	incl	%r11d
.LBB2_7:                                # %if.end40.peel
                                        #   in Loop: Header=BB2_5 Depth=1
	leal	1(%r11), %r9d
	movslq	%r11d, %rdi
	movl	%ebp, (%r15,%rdi,4)
	movabsq	$4616189618054758400, %rsi      # imm = 0x4010000000000000
	movq	%rsi, (%rbx,%rdi,8)
	cmpl	$1, %r8d
	je	.LBB2_9
# %bb.8:                                # %if.then49.peel
                                        #   in Loop: Header=BB2_5 Depth=1
	leal	1(%rbp), %edi
	movslq	%r9d, %rsi
	movl	%edi, (%r15,%rsi,4)
	movq	%rcx, (%rbx,%rsi,8)
	addl	$2, %r11d
	movl	%r11d, %r9d
.LBB2_9:                                # %if.end55.peel
                                        #   in Loop: Header=BB2_5 Depth=1
	cmpl	%eax, %edx
	jge	.LBB2_10
# %bb.11:                               # %if.then59.peel
                                        #   in Loop: Header=BB2_5 Depth=1
	leal	(%r8,%rbp), %edi
	movslq	%r9d, %r11
	movl	%edi, (%r15,%r11,4)
	movq	%rcx, (%rbx,%r11,8)
	incl	%r11d
	jmp	.LBB2_12
	.p2align	4, 0x90
.LBB2_10:                               #   in Loop: Header=BB2_5 Depth=1
	movl	%r9d, %r11d
.LBB2_12:                               # %if.end66.peel
                                        #   in Loop: Header=BB2_5 Depth=1
	leaq	1(%r10), %rsi
	cmpl	$1, %r8d
	je	.LBB2_23
# %bb.13:                               # %for.body21.preheader
                                        #   in Loop: Header=BB2_5 Depth=1
	movq	%rsi, 24(%rsp)                  # 8-byte Spill
	movl	%ebp, %r8d
	movq	72(%rsp), %rsi                  # 8-byte Reload
	leal	(%rsi,%rbp), %r9d
	addl	36(%rsp), %ebp                  # 4-byte Folded Reload
	movq	64(%rsp), %rsi                  # 8-byte Reload
	leaq	(%rsi,%r10,4), %r10
	xorl	%r13d, %r13d
	jmp	.LBB2_14
	.p2align	4, 0x90
.LBB2_20:                               # %if.then59
                                        #   in Loop: Header=BB2_14 Depth=2
	movslq	%esi, %r11
	addl	%r9d, %r13d
	movl	%r13d, (%r15,%r11,4)
	movq	%rcx, (%rbx,%r11,8)
	incl	%r11d
.LBB2_21:                               # %if.end66
                                        #   in Loop: Header=BB2_14 Depth=2
	movq	%r14, %r13
	cmpl	%r14d, %eax
	je	.LBB2_22
.LBB2_14:                               # %for.body21
                                        #   Parent Loop BB2_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	leaq	1(%r13), %r14
	movl	%r11d, (%r10,%r13,4)
	testl	%edx, %edx
	je	.LBB2_16
# %bb.15:                               # %if.then25
                                        #   in Loop: Header=BB2_14 Depth=2
	movslq	%r11d, %rsi
	leal	(%rbp,%r13), %edi
	movl	%edi, (%r15,%rsi,4)
	movq	%rcx, (%rbx,%rsi,8)
	incl	%r11d
.LBB2_16:                               # %if.end40
                                        #   in Loop: Header=BB2_14 Depth=2
	movslq	%r11d, %rsi
	leal	(%r8,%r13), %edi
	movl	%edi, (%r15,%rsi,4)
	movq	%rcx, (%rbx,%rsi,8)
	leal	(%r8,%r13), %edi
	incl	%edi
	movl	%edi, 4(%r15,%rsi,4)
	movabsq	$4616189618054758400, %rdi      # imm = 0x4010000000000000
	movq	%rdi, 8(%rbx,%rsi,8)
	addl	$2, %esi
	cmpl	%eax, %r14d
	jge	.LBB2_18
# %bb.17:                               # %if.then49
                                        #   in Loop: Header=BB2_14 Depth=2
	movslq	%esi, %rsi
	leal	(%r8,%r13), %edi
	addl	$2, %edi
	movl	%edi, (%r15,%rsi,4)
	movq	%rcx, (%rbx,%rsi,8)
	addl	$3, %r11d
	movl	%r11d, %esi
.LBB2_18:                               # %if.end55
                                        #   in Loop: Header=BB2_14 Depth=2
	cmpl	%eax, %edx
	jl	.LBB2_20
# %bb.19:                               #   in Loop: Header=BB2_14 Depth=2
	movl	%esi, %r11d
	jmp	.LBB2_21
.LBB2_24:                               # %for.end71.loopexit
	movslq	%esi, %rax
	jmp	.LBB2_25
.LBB2_3:
	xorl	%r11d, %r11d
	xorl	%eax, %eax
.LBB2_25:                               # %for.end71
	movq	16(%rsp), %rbp                  # 8-byte Reload
	movl	%r11d, (%r14,%rax,4)
	testl	%ebp, %ebp
	je	.LBB2_38
# %bb.26:                               # %for.body77.preheader
	cmpl	$16, %ebp
	jae	.LBB2_28
# %bb.27:
	xorl	%eax, %eax
	jmp	.LBB2_36
.LBB2_28:                               # %vector.ph
	movl	%ebp, %eax
	andl	$-16, %eax
	leaq	-16(%rax), %rsi
	movq	%rsi, %rdx
	shrq	$4, %rdx
	incq	%rdx
	movl	%edx, %ecx
	andl	$7, %ecx
	cmpq	$112, %rsi
	jae	.LBB2_30
# %bb.29:
	xorl	%esi, %esi
	jmp	.LBB2_32
.LBB2_30:                               # %vector.ph.new
	leaq	992(%r12), %rdi
	andq	$-8, %rdx
	negq	%rdx
	xorl	%esi, %esi
	vbroadcastsd	.LCPI2_0(%rip), %ymm0   # ymm0 = [1.0E+0,1.0E+0,1.0E+0,1.0E+0]
	.p2align	4, 0x90
.LBB2_31:                               # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vmovupd	%ymm0, -992(%rdi,%rsi,8)
	vmovupd	%ymm0, -960(%rdi,%rsi,8)
	vmovupd	%ymm0, -928(%rdi,%rsi,8)
	vmovupd	%ymm0, -896(%rdi,%rsi,8)
	vmovupd	%ymm0, -864(%rdi,%rsi,8)
	vmovupd	%ymm0, -832(%rdi,%rsi,8)
	vmovupd	%ymm0, -800(%rdi,%rsi,8)
	vmovupd	%ymm0, -768(%rdi,%rsi,8)
	vmovupd	%ymm0, -736(%rdi,%rsi,8)
	vmovupd	%ymm0, -704(%rdi,%rsi,8)
	vmovupd	%ymm0, -672(%rdi,%rsi,8)
	vmovupd	%ymm0, -640(%rdi,%rsi,8)
	vmovupd	%ymm0, -608(%rdi,%rsi,8)
	vmovupd	%ymm0, -576(%rdi,%rsi,8)
	vmovupd	%ymm0, -544(%rdi,%rsi,8)
	vmovupd	%ymm0, -512(%rdi,%rsi,8)
	vmovupd	%ymm0, -480(%rdi,%rsi,8)
	vmovupd	%ymm0, -448(%rdi,%rsi,8)
	vmovupd	%ymm0, -416(%rdi,%rsi,8)
	vmovupd	%ymm0, -384(%rdi,%rsi,8)
	vmovupd	%ymm0, -352(%rdi,%rsi,8)
	vmovupd	%ymm0, -320(%rdi,%rsi,8)
	vmovupd	%ymm0, -288(%rdi,%rsi,8)
	vmovupd	%ymm0, -256(%rdi,%rsi,8)
	vmovupd	%ymm0, -224(%rdi,%rsi,8)
	vmovupd	%ymm0, -192(%rdi,%rsi,8)
	vmovupd	%ymm0, -160(%rdi,%rsi,8)
	vmovupd	%ymm0, -128(%rdi,%rsi,8)
	vmovupd	%ymm0, -96(%rdi,%rsi,8)
	vmovupd	%ymm0, -64(%rdi,%rsi,8)
	vmovupd	%ymm0, -32(%rdi,%rsi,8)
	vmovupd	%ymm0, (%rdi,%rsi,8)
	subq	$-128, %rsi
	addq	$8, %rdx
	jne	.LBB2_31
.LBB2_32:                               # %middle.block.unr-lcssa
	testq	%rcx, %rcx
	je	.LBB2_35
# %bb.33:                               # %vector.body.epil.preheader
	leaq	(%r12,%rsi,8), %rdx
	addq	$96, %rdx
	shlq	$7, %rcx
	xorl	%esi, %esi
	vbroadcastsd	.LCPI2_0(%rip), %ymm0   # ymm0 = [1.0E+0,1.0E+0,1.0E+0,1.0E+0]
	.p2align	4, 0x90
.LBB2_34:                               # %vector.body.epil
                                        # =>This Inner Loop Header: Depth=1
	vmovupd	%ymm0, -96(%rdx,%rsi)
	vmovupd	%ymm0, -64(%rdx,%rsi)
	vmovupd	%ymm0, -32(%rdx,%rsi)
	vmovupd	%ymm0, (%rdx,%rsi)
	subq	$-128, %rsi
	cmpq	%rsi, %rcx
	jne	.LBB2_34
.LBB2_35:                               # %middle.block
	cmpq	%rbp, %rax
	je	.LBB2_38
.LBB2_36:                               # %for.body77.preheader373
	movabsq	$4607182418800017408, %rcx      # imm = 0x3FF0000000000000
	.p2align	4, 0x90
.LBB2_37:                               # %for.body77
                                        # =>This Inner Loop Header: Depth=1
	movq	%rcx, (%r12,%rax,8)
	incq	%rax
	cmpq	%rax, %rbp
	jne	.LBB2_37
.LBB2_38:                               # %for.end82
	leaq	48(%rsp), %rdi
	vzeroupper
	callq	ftime
	movq	16(%rsp), %r10                  # 8-byte Reload
	vcvtsi2sdq	48(%rsp), %xmm1, %xmm0
	movzwl	56(%rsp), %eax
	vcvtsi2sd	%eax, %xmm1, %xmm1
	vdivsd	.LCPI2_1(%rip), %xmm1, %xmm1
	vaddsd	%xmm0, %xmm1, %xmm0
	vmovsd	%xmm0, 24(%rsp)                 # 8-byte Spill
	testl	%r10d, %r10d
	movq	8(%rsp), %r11                   # 8-byte Reload
	je	.LBB2_55
# %bb.39:                               # %for.body87.preheader
	movl	(%r14), %edx
	xorl	%r9d, %r9d
	vxorpd	%xmm8, %xmm8, %xmm8
	jmp	.LBB2_40
.LBB2_42:                               #   in Loop: Header=BB2_40 Depth=1
	vxorpd	%xmm1, %xmm1, %xmm1
.LBB2_53:                               # %omp.inner.for.end
                                        #   in Loop: Header=BB2_40 Depth=1
	vaddsd	%xmm1, %xmm8, %xmm1
.LBB2_54:                               # %simd.if.end
                                        #   in Loop: Header=BB2_40 Depth=1
	vmovsd	%xmm1, (%r11,%r9,8)
	movl	%eax, %edx
	movq	%r8, %r9
	cmpq	%r10, %r8
	je	.LBB2_55
.LBB2_40:                               # %for.body87
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_46 Depth 2
                                        #     Child Loop BB2_49 Depth 2
                                        #     Child Loop BB2_52 Depth 2
	leaq	1(%r9), %r8
	movl	4(%r14,%r9,4), %eax
	movl	%eax, %ebp
	vxorpd	%xmm1, %xmm1, %xmm1
	subl	%edx, %ebp
	jle	.LBB2_54
# %bb.41:                               # %omp.inner.for.cond.preheader
                                        #   in Loop: Header=BB2_40 Depth=1
	testl	%ebp, %ebp
	je	.LBB2_42
# %bb.43:                               # %omp.inner.for.body.preheader
                                        #   in Loop: Header=BB2_40 Depth=1
	xorl	%esi, %esi
	vxorpd	%xmm1, %xmm1, %xmm1
	cmpl	$16, %ebp
	jb	.LBB2_48
# %bb.44:                               # %omp.inner.for.body.preheader
                                        #   in Loop: Header=BB2_40 Depth=1
	leal	-1(%rax), %ecx
	cmpl	%edx, %ecx
	jl	.LBB2_48
# %bb.45:                               # %vector.ph325
                                        #   in Loop: Header=BB2_40 Depth=1
	movl	%ebp, %esi
	andl	$-16, %esi
	vxorpd	%xmm1, %xmm1, %xmm1
	movl	%esi, %ecx
	movl	%edx, %edi
	vxorpd	%xmm2, %xmm2, %xmm2
	vxorpd	%xmm3, %xmm3, %xmm3
	vxorpd	%xmm4, %xmm4, %xmm4
	.p2align	4, 0x90
.LBB2_46:                               # %vector.body321
                                        #   Parent Loop BB2_40 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movslq	%edi, %rdi
	vmovupd	(%r15,%rdi,4), %xmm5
	vmovupd	16(%r15,%rdi,4), %xmm6
	vmovupd	32(%r15,%rdi,4), %xmm7
	vmovupd	48(%r15,%rdi,4), %xmm0
	kxnorw	%k0, %k0, %k1
	vgatherdpd	(%r12,%xmm5,8), %ymm9 {%k1}
	kxnorw	%k0, %k0, %k1
	vgatherdpd	(%r12,%xmm6,8), %ymm5 {%k1}
	kxnorw	%k0, %k0, %k1
	vgatherdpd	(%r12,%xmm7,8), %ymm6 {%k1}
	kxnorw	%k0, %k0, %k1
	vgatherdpd	(%r12,%xmm0,8), %ymm7 {%k1}
	vmulpd	(%rbx,%rdi,8), %ymm9, %ymm0
	vaddpd	%ymm0, %ymm1, %ymm1
	vmulpd	32(%rbx,%rdi,8), %ymm5, %ymm0
	vaddpd	%ymm0, %ymm2, %ymm2
	vmulpd	64(%rbx,%rdi,8), %ymm6, %ymm0
	vaddpd	%ymm0, %ymm3, %ymm3
	vmulpd	96(%rbx,%rdi,8), %ymm7, %ymm0
	vaddpd	%ymm0, %ymm4, %ymm4
	addl	$16, %edi
	addl	$-16, %ecx
	jne	.LBB2_46
# %bb.47:                               # %middle.block319
                                        #   in Loop: Header=BB2_40 Depth=1
	vaddpd	%ymm1, %ymm2, %ymm0
	vaddpd	%ymm0, %ymm3, %ymm0
	vaddpd	%ymm0, %ymm4, %ymm0
	vpermilpd	$1, %xmm0, %xmm1        # xmm1 = xmm0[1,0]
	vaddsd	%xmm1, %xmm0, %xmm1
	vextractf128	$1, %ymm0, %xmm0
	vaddsd	%xmm0, %xmm1, %xmm1
	vpermilpd	$1, %xmm0, %xmm0        # xmm0 = xmm0[1,0]
	vaddsd	%xmm0, %xmm1, %xmm1
	cmpl	%esi, %ebp
	je	.LBB2_53
.LBB2_48:                               # %omp.inner.for.body.preheader372
                                        #   in Loop: Header=BB2_40 Depth=1
	movl	%edx, %ecx
	notl	%ecx
	addl	%eax, %ecx
	subl	%esi, %ecx
	andl	$3, %ebp
	je	.LBB2_50
	.p2align	4, 0x90
.LBB2_49:                               # %omp.inner.for.body.prol
                                        #   Parent Loop BB2_40 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	leal	(%rdx,%rsi), %edi
	movslq	%edi, %rdi
	vmovsd	(%rbx,%rdi,8), %xmm0            # xmm0 = mem[0],zero
	movslq	(%r15,%rdi,4), %rdi
	vmulsd	(%r12,%rdi,8), %xmm0, %xmm0
	vaddsd	%xmm0, %xmm1, %xmm1
	incl	%esi
	decl	%ebp
	jne	.LBB2_49
.LBB2_50:                               # %omp.inner.for.body.prol.loopexit
                                        #   in Loop: Header=BB2_40 Depth=1
	cmpl	$3, %ecx
	jb	.LBB2_53
# %bb.51:                               # %omp.inner.for.body.preheader397
                                        #   in Loop: Header=BB2_40 Depth=1
	addl	%edx, %esi
	.p2align	4, 0x90
.LBB2_52:                               # %omp.inner.for.body
                                        #   Parent Loop BB2_40 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movslq	%esi, %rsi
	vmovsd	(%rbx,%rsi,8), %xmm0            # xmm0 = mem[0],zero
	movslq	(%r15,%rsi,4), %rcx
	vmulsd	(%r12,%rcx,8), %xmm0, %xmm0
	vaddsd	%xmm0, %xmm1, %xmm0
	leal	1(%rsi), %ecx
	movslq	%ecx, %rcx
	vmovsd	(%rbx,%rcx,8), %xmm1            # xmm1 = mem[0],zero
	movslq	(%r15,%rcx,4), %rcx
	vmulsd	(%r12,%rcx,8), %xmm1, %xmm1
	leal	2(%rsi), %ecx
	movslq	%ecx, %rcx
	vmovsd	(%rbx,%rcx,8), %xmm2            # xmm2 = mem[0],zero
	movslq	(%r15,%rcx,4), %rcx
	vmulsd	(%r12,%rcx,8), %xmm2, %xmm2
	vaddsd	%xmm1, %xmm0, %xmm0
	vaddsd	%xmm2, %xmm0, %xmm0
	leal	3(%rsi), %ecx
	movslq	%ecx, %rcx
	vmovsd	(%rbx,%rcx,8), %xmm1            # xmm1 = mem[0],zero
	movslq	(%r15,%rcx,4), %rcx
	vmulsd	(%r12,%rcx,8), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm1
	addl	$4, %esi
	cmpl	%esi, %eax
	jne	.LBB2_52
	jmp	.LBB2_53
.LBB2_55:                               # %for.end129
	leaq	48(%rsp), %rdi
	vzeroupper
	callq	ftime
	vcvtsi2sdq	48(%rsp), %xmm10, %xmm0
	movzwl	56(%rsp), %eax
	vcvtsi2sd	%eax, %xmm10, %xmm1
	vdivsd	.LCPI2_1(%rip), %xmm1, %xmm1
	vaddsd	%xmm0, %xmm1, %xmm0
	vsubsd	24(%rsp), %xmm0, %xmm0          # 8-byte Folded Reload
	movl	$.L.str.3, %edi
	movb	$1, %al
	callq	printf
	movq	16(%rsp), %rdi                  # 8-byte Reload
	testl	%edi, %edi
	je	.LBB2_56
# %bb.57:                               # %for.body136.preheader
	cmpl	$16, %edi
	jae	.LBB2_59
# %bb.58:
	xorl	%eax, %eax
	xorl	%esi, %esi
	movq	8(%rsp), %rbp                   # 8-byte Reload
	jmp	.LBB2_66
.LBB2_56:
	xorl	%esi, %esi
	movq	8(%rsp), %rbp                   # 8-byte Reload
	jmp	.LBB2_68
.LBB2_59:                               # %vector.ph351
	movl	%edi, %eax
	andl	$-16, %eax
	leaq	-16(%rax), %rcx
	movq	%rcx, %rdx
	shrq	$4, %rdx
	incq	%rdx
	testq	%rcx, %rcx
	movq	8(%rsp), %rbp                   # 8-byte Reload
	je	.LBB2_60
# %bb.61:                               # %vector.ph351.new
	movq	%rdx, %rsi
	andq	$-2, %rsi
	negq	%rsi
	vxorpd	%xmm0, %xmm0, %xmm0
	xorl	%ecx, %ecx
	vxorpd	%xmm4, %xmm4, %xmm4
	vxorpd	%xmm1, %xmm1, %xmm1
	vxorpd	%xmm2, %xmm2, %xmm2
	vxorpd	%xmm3, %xmm3, %xmm3
	.p2align	4, 0x90
.LBB2_62:                               # %vector.body349
                                        # =>This Inner Loop Header: Depth=1
	vcmpgtpd	(%rbp,%rcx,8), %ymm4, %k0
	vcmpgtpd	32(%rbp,%rcx,8), %ymm4, %k1
	vcmpgtpd	64(%rbp,%rcx,8), %ymm4, %k2
	vcmpgtpd	96(%rbp,%rcx,8), %ymm4, %k3
	vpmovm2d	%k0, %xmm5
	vpsubd	%xmm5, %xmm0, %xmm0
	vpmovm2d	%k1, %xmm5
	vpsubd	%xmm5, %xmm1, %xmm1
	vpmovm2d	%k2, %xmm5
	vpsubd	%xmm5, %xmm2, %xmm2
	vpmovm2d	%k3, %xmm5
	vpsubd	%xmm5, %xmm3, %xmm3
	vcmpgtpd	128(%rbp,%rcx,8), %ymm4, %k0
	vcmpgtpd	160(%rbp,%rcx,8), %ymm4, %k1
	vcmpgtpd	192(%rbp,%rcx,8), %ymm4, %k2
	vcmpgtpd	224(%rbp,%rcx,8), %ymm4, %k3
	vpmovm2d	%k0, %xmm5
	vpsubd	%xmm5, %xmm0, %xmm0
	vpmovm2d	%k1, %xmm5
	vpsubd	%xmm5, %xmm1, %xmm1
	vpmovm2d	%k2, %xmm5
	vpsubd	%xmm5, %xmm2, %xmm2
	vpmovm2d	%k3, %xmm5
	vpsubd	%xmm5, %xmm3, %xmm3
	addq	$32, %rcx
	addq	$2, %rsi
	jne	.LBB2_62
# %bb.63:                               # %middle.block347.unr-lcssa
	testb	$1, %dl
	je	.LBB2_65
.LBB2_64:                               # %vector.body349.epil
	vxorpd	%xmm4, %xmm4, %xmm4
	vcmpgtpd	96(%rbp,%rcx,8), %ymm4, %k0
	vpmovm2d	%k0, %xmm5
	vpsubd	%xmm5, %xmm3, %xmm3
	vcmpgtpd	64(%rbp,%rcx,8), %ymm4, %k0
	vpmovm2d	%k0, %xmm5
	vpsubd	%xmm5, %xmm2, %xmm2
	vcmpgtpd	32(%rbp,%rcx,8), %ymm4, %k0
	vpmovm2d	%k0, %xmm5
	vpsubd	%xmm5, %xmm1, %xmm1
	vcmpgtpd	(%rbp,%rcx,8), %ymm4, %k0
	vpmovm2d	%k0, %xmm4
	vpsubd	%xmm4, %xmm0, %xmm0
.LBB2_65:                               # %middle.block347
	vpaddd	%xmm3, %xmm1, %xmm1
	vpaddd	%xmm2, %xmm0, %xmm0
	vpaddd	%xmm1, %xmm0, %xmm0
	vpshufd	$238, %xmm0, %xmm1              # xmm1 = xmm0[2,3,2,3]
	vpaddd	%xmm1, %xmm0, %xmm0
	vpshufd	$85, %xmm0, %xmm1               # xmm1 = xmm0[1,1,1,1]
	vpaddd	%xmm1, %xmm0, %xmm0
	vmovd	%xmm0, %esi
	cmpq	%rdi, %rax
	je	.LBB2_68
.LBB2_66:                               # %for.body136.preheader371
	vpxor	%xmm0, %xmm0, %xmm0
	.p2align	4, 0x90
.LBB2_67:                               # %for.body136
                                        # =>This Inner Loop Header: Depth=1
	xorl	%ecx, %ecx
	vucomisd	(%rbp,%rax,8), %xmm0
	seta	%cl
	addl	%ecx, %esi
	incq	%rax
	cmpq	%rax, %rdi
	jne	.LBB2_67
.LBB2_68:                               # %for.end146
	movl	$.L.str.4, %edi
	xorl	%eax, %eax
	vzeroupper
	callq	printf
	movq	%r14, %rdi
	callq	free
	movq	%r15, %rdi
	callq	free
	movq	%rbx, %rdi
	callq	free
	movq	%r12, %rdi
	callq	free
	movq	%rbp, %rdi
	callq	free
	xorl	%eax, %eax
	addq	$88, %rsp
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
.LBB2_60:
	.cfi_def_cfa_offset 144
	vxorpd	%xmm0, %xmm0, %xmm0
	xorl	%ecx, %ecx
	vxorpd	%xmm1, %xmm1, %xmm1
	vxorpd	%xmm2, %xmm2, %xmm2
	vxorpd	%xmm3, %xmm3, %xmm3
	testb	$1, %dl
	jne	.LBB2_64
	jmp	.LBB2_65
.Lfunc_end2:
	.size	main, .Lfunc_end2-main
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%s:\n"
	.size	.L.str, 5

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"%s[%d][%d]:%f  "
	.size	.L.str.1, 16

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	"seq elasped time(s): %.4f\n"
	.size	.L.str.3, 27

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"Errors: %d\n"
	.size	.L.str.4, 12

	.ident	"clang version 12.0.1 (https://github.com/llvm/llvm-project fed41342a82f5a3a9201819a82bf7a48313e296b)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
