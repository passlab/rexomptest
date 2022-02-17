	.text
	.file	"spmv_float.c"
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
	shlq	$2, %r13
	xorl	%ebp, %ebp
	jmp	.LBB1_2
	.p2align	4, 0x90
.LBB1_5:                                # %for.end
                                        #   in Loop: Header=BB1_2 Depth=1
	movl	$10, %edi
	callq	putchar@PLT
	addq	$1, %rbp
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
	vmovss	(%r12,%rbx,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	movl	$.L.str.1, %edi
	movq	%r15, %rsi
	movl	%ebp, %edx
	movl	%ebx, %ecx
	movb	$1, %al
	callq	printf
	addq	$1, %rbx
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
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2                               # -- Begin function main
.LCPI2_0:
	.long	0x3f800000                      # float 1
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3
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
	movq	%rax, 32(%rsp)                  # 8-byte Spill
                                        # kill: def $eax killed $eax killed $rax def $rax
	imull	%eax, %eax
	leal	(%rax,%rax,4), %ebx
	movq	%rax, 64(%rsp)                  # 8-byte Spill
	leaq	(,%rax,4), %rbp
	movq	%rbp, %rdi
	callq	malloc
	movq	%rax, %r14
	shlq	$2, %rbx
	movq	%rbx, %rdi
	callq	malloc
	movq	%rax, %r15
	movq	%rbx, %rdi
	callq	malloc
	movq	%rax, %rbx
	movq	%rbp, %rdi
	callq	malloc
	movq	%rax, %r12
	movq	%rbp, %rdi
	callq	malloc
	movq	32(%rsp), %rbp                  # 8-byte Reload
	movq	%rax, 56(%rsp)                  # 8-byte Spill
	testl	%ebp, %ebp
	movq	%r14, 8(%rsp)                   # 8-byte Spill
	jle	.LBB2_3
# %bb.4:                                # %for.cond18.preheader.lr.ph
	leal	-1(%rbp), %eax
	leal	1(%rbp), %ecx
	movq	%rcx, 80(%rsp)                  # 8-byte Spill
	movl	$1, %ecx
	subl	%ebp, %ecx
	movl	%ecx, 28(%rsp)                  # 4-byte Spill
	movq	%r14, %rcx
	addq	$4, %rcx
	movq	%rcx, 72(%rsp)                  # 8-byte Spill
	xorl	%edx, %edx
	xorl	%edi, %edi
	xorl	%r13d, %r13d
	jmp	.LBB2_5
	.p2align	4, 0x90
.LBB2_22:                               # %for.inc69.loopexit
                                        #   in Loop: Header=BB2_5 Depth=1
	movq	16(%rsp), %rcx                  # 8-byte Reload
	addq	%r10, %rcx
	movq	8(%rsp), %r14                   # 8-byte Reload
	movq	32(%rsp), %rbp                  # 8-byte Reload
.LBB2_23:                               # %for.inc69
                                        #   in Loop: Header=BB2_5 Depth=1
	addl	$1, %edi
	cmpl	%ebp, %edi
	movl	%ecx, %edx
	je	.LBB2_24
.LBB2_5:                                # %for.body21.lr.ph
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_14 Depth 2
	testl	%edi, %edi
	movslq	%edx, %r8
	movl	%r13d, (%r14,%r8,4)
	je	.LBB2_7
# %bb.6:                                # %if.then25.peel
                                        #   in Loop: Header=BB2_5 Depth=1
	movl	%edx, %ecx
	subl	%ebp, %ecx
	movslq	%r13d, %rsi
	movl	%ecx, (%r15,%rsi,4)
	movl	$-1082130432, (%rbx,%rsi,4)     # imm = 0xBF800000
	addl	$1, %r13d
.LBB2_7:                                # %if.end40.peel
                                        #   in Loop: Header=BB2_5 Depth=1
	leal	1(%r13), %ecx
	cmpl	$1, %ebp
	movslq	%r13d, %rsi
	movl	%edx, (%r15,%rsi,4)
	movl	$1082130432, (%rbx,%rsi,4)      # imm = 0x40800000
	je	.LBB2_9
# %bb.8:                                # %if.then49.peel
                                        #   in Loop: Header=BB2_5 Depth=1
	leal	1(%rdx), %esi
	movslq	%ecx, %rcx
	movl	%esi, (%r15,%rcx,4)
	movl	$-1082130432, (%rbx,%rcx,4)     # imm = 0xBF800000
	addl	$2, %r13d
	movl	%r13d, %ecx
.LBB2_9:                                # %if.end55.peel
                                        #   in Loop: Header=BB2_5 Depth=1
	cmpl	%eax, %edi
	jge	.LBB2_10
# %bb.11:                               # %if.then59.peel
                                        #   in Loop: Header=BB2_5 Depth=1
	leal	(%rdx,%rbp), %esi
	movslq	%ecx, %r13
	movl	%esi, (%r15,%r13,4)
	movl	$-1082130432, (%rbx,%r13,4)     # imm = 0xBF800000
	addl	$1, %r13d
	jmp	.LBB2_12
	.p2align	4, 0x90
.LBB2_10:                               #   in Loop: Header=BB2_5 Depth=1
	movl	%ecx, %r13d
.LBB2_12:                               # %if.end66.peel
                                        #   in Loop: Header=BB2_5 Depth=1
	leaq	1(%r8), %rcx
	cmpl	$1, %ebp
	je	.LBB2_23
# %bb.13:                               # %for.body21.preheader
                                        #   in Loop: Header=BB2_5 Depth=1
	movq	%rcx, 16(%rsp)                  # 8-byte Spill
	movl	%edx, %ebp
	movq	80(%rsp), %rcx                  # 8-byte Reload
	leal	(%rcx,%rdx), %r11d
	addl	28(%rsp), %edx                  # 4-byte Folded Reload
	movq	72(%rsp), %rcx                  # 8-byte Reload
	leaq	(%rcx,%r8,4), %r8
	xorl	%r9d, %r9d
	jmp	.LBB2_14
	.p2align	4, 0x90
.LBB2_20:                               # %if.then59
                                        #   in Loop: Header=BB2_14 Depth=2
	movslq	%ecx, %r13
	addl	%r11d, %r9d
	movl	%r9d, (%r15,%r13,4)
	movl	$-1082130432, (%rbx,%r13,4)     # imm = 0xBF800000
	addl	$1, %r13d
.LBB2_21:                               # %if.end66
                                        #   in Loop: Header=BB2_14 Depth=2
	cmpl	%r10d, %eax
	movq	%r10, %r9
	je	.LBB2_22
.LBB2_14:                               # %for.body21
                                        #   Parent Loop BB2_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	leaq	1(%r9), %r10
	testl	%edi, %edi
	movl	%r13d, (%r8,%r9,4)
	je	.LBB2_16
# %bb.15:                               # %if.then25
                                        #   in Loop: Header=BB2_14 Depth=2
	movslq	%r13d, %rcx
	leal	(%rdx,%r9), %r14d
	movl	%r14d, (%r15,%rcx,4)
	movl	$-1082130432, (%rbx,%rcx,4)     # imm = 0xBF800000
	addl	$1, %r13d
.LBB2_16:                               # %if.end40
                                        #   in Loop: Header=BB2_14 Depth=2
	movslq	%r13d, %rcx
	leal	(%r9,%rbp), %esi
	movl	%esi, (%r15,%rcx,4)
	movl	$-1082130432, (%rbx,%rcx,4)     # imm = 0xBF800000
	leal	(%r9,%rbp), %esi
	addl	$1, %esi
	movl	%esi, 4(%r15,%rcx,4)
	movl	$1082130432, 4(%rbx,%rcx,4)     # imm = 0x40800000
	addl	$2, %ecx
	cmpl	%eax, %r10d
	jge	.LBB2_18
# %bb.17:                               # %if.then49
                                        #   in Loop: Header=BB2_14 Depth=2
	movslq	%ecx, %rcx
	leal	(%r9,%rbp), %esi
	addl	$2, %esi
	movl	%esi, (%r15,%rcx,4)
	movl	$-1082130432, (%rbx,%rcx,4)     # imm = 0xBF800000
	addl	$3, %r13d
	movl	%r13d, %ecx
.LBB2_18:                               # %if.end55
                                        #   in Loop: Header=BB2_14 Depth=2
	cmpl	%eax, %edi
	jl	.LBB2_20
# %bb.19:                               #   in Loop: Header=BB2_14 Depth=2
	movl	%ecx, %r13d
	jmp	.LBB2_21
.LBB2_24:                               # %for.end71.loopexit
	movslq	%ecx, %rax
	jmp	.LBB2_25
.LBB2_3:
	xorl	%r13d, %r13d
	xorl	%eax, %eax
.LBB2_25:                               # %for.end71
	movl	%r13d, (%r14,%rax,4)
	movq	64(%rsp), %r14                  # 8-byte Reload
	testl	%r14d, %r14d
	movq	56(%rsp), %r13                  # 8-byte Reload
	je	.LBB2_44
# %bb.26:                               # %iter.check
	cmpl	$4, %r14d
	jae	.LBB2_28
# %bb.27:
	xorl	%eax, %eax
	jmp	.LBB2_42
.LBB2_28:                               # %vector.main.loop.iter.check
	cmpl	$64, %r14d
	jae	.LBB2_30
# %bb.29:
	xorl	%eax, %eax
	jmp	.LBB2_39
.LBB2_30:                               # %vector.ph
	movl	%r14d, %eax
	andl	$-64, %eax
	leaq	-64(%rax), %rsi
	movq	%rsi, %rdx
	shrq	$6, %rdx
	addq	$1, %rdx
	movl	%edx, %ecx
	andl	$7, %ecx
	cmpq	$448, %rsi                      # imm = 0x1C0
	jae	.LBB2_32
# %bb.31:
	xorl	%esi, %esi
	jmp	.LBB2_34
.LBB2_32:                               # %vector.ph.new
	leaq	1984(%r12), %rdi
	andq	$-8, %rdx
	negq	%rdx
	xorl	%esi, %esi
	vbroadcastss	.LCPI2_0(%rip), %zmm0   # zmm0 = [1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0]
	.p2align	4, 0x90
.LBB2_33:                               # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vmovupd	%zmm0, -1984(%rdi,%rsi,4)
	vmovupd	%zmm0, -1920(%rdi,%rsi,4)
	vmovupd	%zmm0, -1856(%rdi,%rsi,4)
	vmovupd	%zmm0, -1792(%rdi,%rsi,4)
	vmovupd	%zmm0, -1728(%rdi,%rsi,4)
	vmovupd	%zmm0, -1664(%rdi,%rsi,4)
	vmovupd	%zmm0, -1600(%rdi,%rsi,4)
	vmovupd	%zmm0, -1536(%rdi,%rsi,4)
	vmovupd	%zmm0, -1472(%rdi,%rsi,4)
	vmovupd	%zmm0, -1408(%rdi,%rsi,4)
	vmovupd	%zmm0, -1344(%rdi,%rsi,4)
	vmovupd	%zmm0, -1280(%rdi,%rsi,4)
	vmovupd	%zmm0, -1216(%rdi,%rsi,4)
	vmovupd	%zmm0, -1152(%rdi,%rsi,4)
	vmovupd	%zmm0, -1088(%rdi,%rsi,4)
	vmovupd	%zmm0, -1024(%rdi,%rsi,4)
	vmovupd	%zmm0, -960(%rdi,%rsi,4)
	vmovupd	%zmm0, -896(%rdi,%rsi,4)
	vmovupd	%zmm0, -832(%rdi,%rsi,4)
	vmovupd	%zmm0, -768(%rdi,%rsi,4)
	vmovupd	%zmm0, -704(%rdi,%rsi,4)
	vmovupd	%zmm0, -640(%rdi,%rsi,4)
	vmovupd	%zmm0, -576(%rdi,%rsi,4)
	vmovupd	%zmm0, -512(%rdi,%rsi,4)
	vmovupd	%zmm0, -448(%rdi,%rsi,4)
	vmovupd	%zmm0, -384(%rdi,%rsi,4)
	vmovupd	%zmm0, -320(%rdi,%rsi,4)
	vmovupd	%zmm0, -256(%rdi,%rsi,4)
	vmovupd	%zmm0, -192(%rdi,%rsi,4)
	vmovupd	%zmm0, -128(%rdi,%rsi,4)
	vmovupd	%zmm0, -64(%rdi,%rsi,4)
	vmovupd	%zmm0, (%rdi,%rsi,4)
	addq	$512, %rsi                      # imm = 0x200
	addq	$8, %rdx
	jne	.LBB2_33
.LBB2_34:                               # %middle.block.unr-lcssa
	testq	%rcx, %rcx
	je	.LBB2_37
# %bb.35:                               # %vector.body.epil.preheader
	leaq	(%r12,%rsi,4), %rdx
	addq	$192, %rdx
	negq	%rcx
	vbroadcastss	.LCPI2_0(%rip), %zmm0   # zmm0 = [1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0]
	.p2align	4, 0x90
.LBB2_36:                               # %vector.body.epil
                                        # =>This Inner Loop Header: Depth=1
	vmovupd	%zmm0, -192(%rdx)
	vmovupd	%zmm0, -128(%rdx)
	vmovupd	%zmm0, -64(%rdx)
	vmovupd	%zmm0, (%rdx)
	addq	$256, %rdx                      # imm = 0x100
	incq	%rcx
	jne	.LBB2_36
.LBB2_37:                               # %middle.block
	cmpq	%r14, %rax
	je	.LBB2_44
# %bb.38:                               # %vec.epilog.iter.check
	testb	$60, %r14b
	je	.LBB2_42
.LBB2_39:                               # %vec.epilog.ph
	movq	%rax, %rcx
	movl	%r14d, %eax
	andl	$-4, %eax
	leaq	(%r12,%rcx,4), %rdx
	subq	%rax, %rcx
	vbroadcastss	.LCPI2_0(%rip), %xmm0   # xmm0 = [1.0E+0,1.0E+0,1.0E+0,1.0E+0]
	.p2align	4, 0x90
.LBB2_40:                               # %vec.epilog.vector.body
                                        # =>This Inner Loop Header: Depth=1
	vmovupd	%xmm0, (%rdx)
	addq	$16, %rdx
	addq	$4, %rcx
	jne	.LBB2_40
# %bb.41:                               # %vec.epilog.middle.block
	cmpq	%r14, %rax
	je	.LBB2_44
.LBB2_42:                               # %for.body77.preheader
	leaq	(%r12,%rax,4), %rcx
	movq	%r14, %rdx
	subq	%rax, %rdx
	.p2align	4, 0x90
.LBB2_43:                               # %for.body77
                                        # =>This Inner Loop Header: Depth=1
	movl	$1065353216, (%rcx)             # imm = 0x3F800000
	addq	$4, %rcx
	addq	$-1, %rdx
	jne	.LBB2_43
.LBB2_44:                               # %for.end82
	leaq	40(%rsp), %rdi
	callq	ftime
	movq	8(%rsp), %r10                   # 8-byte Reload
	testl	%r14d, %r14d
	vcvtsi2sdq	40(%rsp), %xmm1, %xmm0
	movzwl	48(%rsp), %eax
	vcvtsi2sd	%eax, %xmm1, %xmm1
	vdivsd	.LCPI2_1(%rip), %xmm1, %xmm1
	vaddsd	%xmm0, %xmm1, %xmm0
	vmovsd	%xmm0, 16(%rsp)                 # 8-byte Spill
	je	.LBB2_61
# %bb.45:                               # %for.body87.preheader
	movl	(%r10), %edx
	xorl	%r9d, %r9d
	vxorpd	%xmm0, %xmm0, %xmm0
	jmp	.LBB2_46
.LBB2_48:                               #   in Loop: Header=BB2_46 Depth=1
	vxorpd	%xmm1, %xmm1, %xmm1
.LBB2_59:                               # %omp.inner.for.end
                                        #   in Loop: Header=BB2_46 Depth=1
	vaddss	%xmm0, %xmm1, %xmm1
.LBB2_60:                               # %simd.if.end
                                        #   in Loop: Header=BB2_46 Depth=1
	vmovss	%xmm1, (%r13,%r9,4)
	cmpq	%r14, %r8
	movl	%eax, %edx
	movq	%r8, %r9
	je	.LBB2_61
.LBB2_46:                               # %for.body87
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_52 Depth 2
                                        #     Child Loop BB2_55 Depth 2
                                        #     Child Loop BB2_58 Depth 2
	leaq	1(%r9), %r8
	movl	4(%r10,%r9,4), %eax
	movl	%eax, %ebp
	subl	%edx, %ebp
	vxorpd	%xmm1, %xmm1, %xmm1
	jle	.LBB2_60
# %bb.47:                               # %omp.inner.for.cond.preheader
                                        #   in Loop: Header=BB2_46 Depth=1
	testl	%ebp, %ebp
	je	.LBB2_48
# %bb.49:                               # %omp.inner.for.body.preheader
                                        #   in Loop: Header=BB2_46 Depth=1
	xorl	%esi, %esi
	cmpl	$64, %ebp
	vxorpd	%xmm1, %xmm1, %xmm1
	jb	.LBB2_54
# %bb.50:                               # %omp.inner.for.body.preheader
                                        #   in Loop: Header=BB2_46 Depth=1
	leal	-1(%rax), %ecx
	cmpl	%edx, %ecx
	jl	.LBB2_54
# %bb.51:                               # %vector.ph330
                                        #   in Loop: Header=BB2_46 Depth=1
	movl	%ebp, %esi
	andl	$-64, %esi
	vxorpd	%xmm1, %xmm1, %xmm1
	movl	%esi, %ecx
	movl	%edx, %edi
	vxorps	%xmm2, %xmm2, %xmm2
	vxorps	%xmm3, %xmm3, %xmm3
	vxorps	%xmm4, %xmm4, %xmm4
	.p2align	4, 0x90
.LBB2_52:                               # %vector.body326
                                        #   Parent Loop BB2_46 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movslq	%edi, %rdi
	vmovups	(%r15,%rdi,4), %zmm5
	vmovups	64(%r15,%rdi,4), %zmm6
	vmovups	128(%r15,%rdi,4), %zmm7
	vmovups	192(%r15,%rdi,4), %zmm8
	kxnorw	%k0, %k0, %k1
	vgatherdps	(%r12,%zmm5,4), %zmm9 {%k1}
	kxnorw	%k0, %k0, %k1
	vgatherdps	(%r12,%zmm6,4), %zmm5 {%k1}
	kxnorw	%k0, %k0, %k1
	vgatherdps	(%r12,%zmm7,4), %zmm6 {%k1}
	kxnorw	%k0, %k0, %k1
	vgatherdps	(%r12,%zmm8,4), %zmm7 {%k1}
	vmulps	(%rbx,%rdi,4), %zmm9, %zmm8
	vaddps	%zmm8, %zmm1, %zmm1
	vmulps	64(%rbx,%rdi,4), %zmm5, %zmm5
	vaddps	%zmm5, %zmm2, %zmm2
	vmulps	128(%rbx,%rdi,4), %zmm6, %zmm5
	vmulps	192(%rbx,%rdi,4), %zmm7, %zmm6
	vaddps	%zmm5, %zmm3, %zmm3
	vaddps	%zmm6, %zmm4, %zmm4
	addl	$64, %edi
	addl	$-64, %ecx
	jne	.LBB2_52
# %bb.53:                               # %middle.block325
                                        #   in Loop: Header=BB2_46 Depth=1
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
	cmpl	%esi, %ebp
	je	.LBB2_59
.LBB2_54:                               # %omp.inner.for.body.preheader377
                                        #   in Loop: Header=BB2_46 Depth=1
	movl	%edx, %ecx
	notl	%ecx
	addl	%eax, %ecx
	subl	%esi, %ecx
	andl	$3, %ebp
	je	.LBB2_56
	.p2align	4, 0x90
.LBB2_55:                               # %omp.inner.for.body.prol
                                        #   Parent Loop BB2_46 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	leal	(%rdx,%rsi), %edi
	movslq	%edi, %rdi
	vmovss	(%rbx,%rdi,4), %xmm2            # xmm2 = mem[0],zero,zero,zero
	movslq	(%r15,%rdi,4), %rdi
	vmulss	(%r12,%rdi,4), %xmm2, %xmm2
	vaddss	%xmm2, %xmm1, %xmm1
	addl	$1, %esi
	addl	$-1, %ebp
	jne	.LBB2_55
.LBB2_56:                               # %omp.inner.for.body.prol.loopexit
                                        #   in Loop: Header=BB2_46 Depth=1
	cmpl	$3, %ecx
	jb	.LBB2_59
# %bb.57:                               # %omp.inner.for.body.preheader401
                                        #   in Loop: Header=BB2_46 Depth=1
	addl	%edx, %esi
	.p2align	4, 0x90
.LBB2_58:                               # %omp.inner.for.body
                                        #   Parent Loop BB2_46 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movslq	%esi, %rsi
	vmovss	(%rbx,%rsi,4), %xmm2            # xmm2 = mem[0],zero,zero,zero
	movslq	(%r15,%rsi,4), %rcx
	vmulss	(%r12,%rcx,4), %xmm2, %xmm2
	vaddss	%xmm2, %xmm1, %xmm1
	leal	1(%rsi), %ecx
	movslq	%ecx, %rcx
	vmovss	(%rbx,%rcx,4), %xmm2            # xmm2 = mem[0],zero,zero,zero
	movslq	(%r15,%rcx,4), %rcx
	vmulss	(%r12,%rcx,4), %xmm2, %xmm2
	vaddss	%xmm2, %xmm1, %xmm1
	leal	2(%rsi), %ecx
	movslq	%ecx, %rcx
	vmovss	(%rbx,%rcx,4), %xmm2            # xmm2 = mem[0],zero,zero,zero
	movslq	(%r15,%rcx,4), %rcx
	vmulss	(%r12,%rcx,4), %xmm2, %xmm2
	leal	3(%rsi), %ecx
	movslq	%ecx, %rcx
	vmovss	(%rbx,%rcx,4), %xmm3            # xmm3 = mem[0],zero,zero,zero
	movslq	(%r15,%rcx,4), %rcx
	vmulss	(%r12,%rcx,4), %xmm3, %xmm3
	vaddss	%xmm2, %xmm1, %xmm1
	vaddss	%xmm3, %xmm1, %xmm1
	addl	$4, %esi
	cmpl	%esi, %eax
	jne	.LBB2_58
	jmp	.LBB2_59
.LBB2_61:                               # %for.end129
	leaq	40(%rsp), %rdi
	callq	ftime
	vcvtsi2sdq	40(%rsp), %xmm10, %xmm0
	movzwl	48(%rsp), %eax
	vcvtsi2sd	%eax, %xmm10, %xmm1
	vdivsd	.LCPI2_1(%rip), %xmm1, %xmm1
	vaddsd	%xmm0, %xmm1, %xmm0
	vsubsd	16(%rsp), %xmm0, %xmm0          # 8-byte Folded Reload
	movl	$.L.str.3, %edi
	movb	$1, %al
	callq	printf
	testl	%r14d, %r14d
	je	.LBB2_62
# %bb.63:                               # %for.body136.preheader
	cmpl	$64, %r14d
	jae	.LBB2_65
# %bb.64:
	xorl	%eax, %eax
	xorl	%esi, %esi
	jmp	.LBB2_72
.LBB2_62:
	xorl	%esi, %esi
	jmp	.LBB2_74
.LBB2_65:                               # %vector.ph356
	movl	%r14d, %eax
	andl	$-64, %eax
	leaq	-64(%rax), %rcx
	movq	%rcx, %rdx
	shrq	$6, %rdx
	addq	$1, %rdx
	testq	%rcx, %rcx
	je	.LBB2_66
# %bb.67:                               # %vector.ph356.new
	movq	%rdx, %rsi
	andq	$-2, %rsi
	negq	%rsi
	vxorps	%xmm4, %xmm4, %xmm4
	xorl	%ecx, %ecx
	vxorpd	%xmm0, %xmm0, %xmm0
	vxorpd	%xmm1, %xmm1, %xmm1
	vxorps	%xmm2, %xmm2, %xmm2
	vxorps	%xmm3, %xmm3, %xmm3
	.p2align	4, 0x90
.LBB2_68:                               # %vector.body354
                                        # =>This Inner Loop Header: Depth=1
	vcmpgtps	(%r13,%rcx,4), %zmm4, %k1
	vcmpgtps	64(%r13,%rcx,4), %zmm4, %k2
	vcmpgtps	128(%r13,%rcx,4), %zmm4, %k3
	vcmpgtps	192(%r13,%rcx,4), %zmm4, %k4
	vpternlogd	$255, %zmm5, %zmm5, %zmm5 {%k1} {z}
	vpsubd	%zmm5, %zmm0, %zmm0
	vpternlogd	$255, %zmm5, %zmm5, %zmm5 {%k2} {z}
	vpsubd	%zmm5, %zmm1, %zmm1
	vpternlogd	$255, %zmm5, %zmm5, %zmm5 {%k3} {z}
	vpsubd	%zmm5, %zmm2, %zmm2
	vpternlogd	$255, %zmm5, %zmm5, %zmm5 {%k4} {z}
	vpsubd	%zmm5, %zmm3, %zmm3
	vcmpgtps	256(%r13,%rcx,4), %zmm4, %k1
	vcmpgtps	320(%r13,%rcx,4), %zmm4, %k2
	vcmpgtps	384(%r13,%rcx,4), %zmm4, %k3
	vcmpgtps	448(%r13,%rcx,4), %zmm4, %k4
	vpternlogd	$255, %zmm5, %zmm5, %zmm5 {%k1} {z}
	vpsubd	%zmm5, %zmm0, %zmm0
	vpternlogd	$255, %zmm5, %zmm5, %zmm5 {%k2} {z}
	vpsubd	%zmm5, %zmm1, %zmm1
	vpternlogd	$255, %zmm5, %zmm5, %zmm5 {%k3} {z}
	vpsubd	%zmm5, %zmm2, %zmm2
	vpternlogd	$255, %zmm5, %zmm5, %zmm5 {%k4} {z}
	vpsubd	%zmm5, %zmm3, %zmm3
	subq	$-128, %rcx
	addq	$2, %rsi
	jne	.LBB2_68
# %bb.69:                               # %middle.block352.unr-lcssa
	testb	$1, %dl
	je	.LBB2_71
.LBB2_70:                               # %vector.body354.epil
	vxorps	%xmm4, %xmm4, %xmm4
	vcmpgtps	192(%r13,%rcx,4), %zmm4, %k1
	vpternlogd	$255, %zmm5, %zmm5, %zmm5 {%k1} {z}
	vpsubd	%zmm5, %zmm3, %zmm3
	vcmpgtps	128(%r13,%rcx,4), %zmm4, %k1
	vpternlogd	$255, %zmm5, %zmm5, %zmm5 {%k1} {z}
	vpsubd	%zmm5, %zmm2, %zmm2
	vcmpgtps	64(%r13,%rcx,4), %zmm4, %k1
	vpternlogd	$255, %zmm5, %zmm5, %zmm5 {%k1} {z}
	vpsubd	%zmm5, %zmm1, %zmm1
	vcmpgtps	(%r13,%rcx,4), %zmm4, %k1
	vpternlogd	$255, %zmm4, %zmm4, %zmm4 {%k1} {z}
	vpsubd	%zmm4, %zmm0, %zmm0
.LBB2_71:                               # %middle.block352
	vpaddd	%zmm3, %zmm1, %zmm1
	vpaddd	%zmm2, %zmm0, %zmm0
	vpaddd	%zmm1, %zmm0, %zmm0
	vextracti64x4	$1, %zmm0, %ymm1
	vpaddd	%zmm1, %zmm0, %zmm0
	vextracti128	$1, %ymm0, %xmm1
	vpaddd	%xmm1, %xmm0, %xmm0
	vpshufd	$238, %xmm0, %xmm1              # xmm1 = xmm0[2,3,2,3]
	vpaddd	%xmm1, %xmm0, %xmm0
	vpshufd	$85, %xmm0, %xmm1               # xmm1 = xmm0[1,1,1,1]
	vpaddd	%xmm1, %xmm0, %xmm0
	vmovd	%xmm0, %esi
	cmpq	%r14, %rax
	je	.LBB2_74
.LBB2_72:                               # %for.body136.preheader376
	leaq	(,%rax,4), %rcx
	addq	%r13, %rcx
	subq	%rax, %r14
	vpxor	%xmm0, %xmm0, %xmm0
	.p2align	4, 0x90
.LBB2_73:                               # %for.body136
                                        # =>This Inner Loop Header: Depth=1
	xorl	%eax, %eax
	vucomiss	(%rcx), %xmm0
	seta	%al
	addl	%eax, %esi
	addq	$4, %rcx
	addq	$-1, %r14
	jne	.LBB2_73
.LBB2_74:                               # %for.end146
	movl	$.L.str.4, %edi
	xorl	%eax, %eax
	callq	printf
	movq	8(%rsp), %rdi                   # 8-byte Reload
	callq	free
	movq	%r15, %rdi
	callq	free
	movq	%rbx, %rdi
	callq	free
	movq	%r12, %rdi
	callq	free
	movq	%r13, %rdi
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
.LBB2_66:
	.cfi_def_cfa_offset 144
	vxorpd	%xmm0, %xmm0, %xmm0
	xorl	%ecx, %ecx
	vxorpd	%xmm1, %xmm1, %xmm1
	vxorps	%xmm2, %xmm2, %xmm2
	vxorps	%xmm3, %xmm3, %xmm3
	testb	$1, %dl
	jne	.LBB2_70
	jmp	.LBB2_71
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
