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
	movq	%rsi, %r14
	movq	%rdi, %r15
	movq	$-409600000, %rbx               # imm = 0xE7960000
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
	movl	%eax, 409600000(%r15,%rbx)
	callq	rand
	cltq
	imulq	$-1610612725, %rax, %rcx        # imm = 0xA000000B
	shrq	$32, %rcx
	addl	%ecx, %eax
	movl	%eax, %ecx
	shrl	$31, %ecx
	sarl	$27, %eax
	addl	%ecx, %eax
	movl	%eax, 409600000(%r14,%rbx)
	addq	$4, %rbx
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
# %bb.0:                                # %iter.check
	vpbroadcastd	%edx, %zmm0
	movq	$-102400000, %rax               # imm = 0xF9E58000
	.p2align	4, 0x90
.LBB2_1:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vpmulld	409600000(%rdi,%rax,4), %zmm0, %zmm1
	vpmulld	409600064(%rdi,%rax,4), %zmm0, %zmm2
	vpmulld	409600128(%rdi,%rax,4), %zmm0, %zmm3
	vpmulld	409600192(%rdi,%rax,4), %zmm0, %zmm4
	vpaddd	409600000(%rsi,%rax,4), %zmm1, %zmm1
	vpaddd	409600064(%rsi,%rax,4), %zmm2, %zmm2
	vpaddd	409600128(%rsi,%rax,4), %zmm3, %zmm3
	vpaddd	409600192(%rsi,%rax,4), %zmm4, %zmm4
	vmovdqu64	%zmm1, 409600000(%rsi,%rax,4)
	vmovdqu64	%zmm2, 409600064(%rsi,%rax,4)
	vmovdqu64	%zmm3, 409600128(%rsi,%rax,4)
	vmovdqu64	%zmm4, 409600192(%rsi,%rax,4)
	vpmulld	409600256(%rdi,%rax,4), %zmm0, %zmm1
	vpmulld	409600320(%rdi,%rax,4), %zmm0, %zmm2
	vpmulld	409600384(%rdi,%rax,4), %zmm0, %zmm3
	vpmulld	409600448(%rdi,%rax,4), %zmm0, %zmm4
	vpaddd	409600256(%rsi,%rax,4), %zmm1, %zmm1
	vpaddd	409600320(%rsi,%rax,4), %zmm2, %zmm2
	vpaddd	409600384(%rsi,%rax,4), %zmm3, %zmm3
	vpaddd	409600448(%rsi,%rax,4), %zmm4, %zmm4
	vmovdqu64	%zmm1, 409600256(%rsi,%rax,4)
	vmovdqu64	%zmm2, 409600320(%rsi,%rax,4)
	vmovdqu64	%zmm3, 409600384(%rsi,%rax,4)
	vmovdqu64	%zmm4, 409600448(%rsi,%rax,4)
	subq	$-128, %rax
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
# %bb.0:                                # %iter.check
	leaq	409600000(%rdi), %rax
	cmpq	%rsi, %rax
	jbe	.LBB3_4
# %bb.1:                                # %iter.check
	leaq	409600000(%rsi), %rax
	cmpq	%rdi, %rax
	jbe	.LBB3_4
# %bb.2:                                # %for.body.preheader
	movq	$-409600000, %rax               # imm = 0xE7960000
	.p2align	4, 0x90
.LBB3_3:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movl	409600000(%rdi,%rax), %ecx
	imull	%edx, %ecx
	addl	%ecx, 409600000(%rsi,%rax)
	movl	409600004(%rdi,%rax), %ecx
	imull	%edx, %ecx
	addl	%ecx, 409600004(%rsi,%rax)
	movl	409600008(%rdi,%rax), %ecx
	imull	%edx, %ecx
	addl	%ecx, 409600008(%rsi,%rax)
	movl	409600012(%rdi,%rax), %ecx
	imull	%edx, %ecx
	addl	%ecx, 409600012(%rsi,%rax)
	movl	409600016(%rdi,%rax), %ecx
	imull	%edx, %ecx
	addl	%ecx, 409600016(%rsi,%rax)
	addq	$20, %rax
	jne	.LBB3_3
	jmp	.LBB3_6
.LBB3_4:                                # %vector.ph
	vpbroadcastd	%edx, %zmm0
	movq	$-102400000, %rax               # imm = 0xF9E58000
	.p2align	4, 0x90
.LBB3_5:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vpmulld	409600000(%rdi,%rax,4), %zmm0, %zmm1
	vpmulld	409600064(%rdi,%rax,4), %zmm0, %zmm2
	vpmulld	409600128(%rdi,%rax,4), %zmm0, %zmm3
	vpmulld	409600192(%rdi,%rax,4), %zmm0, %zmm4
	vpaddd	409600000(%rsi,%rax,4), %zmm1, %zmm1
	vpaddd	409600064(%rsi,%rax,4), %zmm2, %zmm2
	vpaddd	409600128(%rsi,%rax,4), %zmm3, %zmm3
	vpaddd	409600192(%rsi,%rax,4), %zmm4, %zmm4
	vmovdqu64	%zmm1, 409600000(%rsi,%rax,4)
	vmovdqu64	%zmm2, 409600064(%rsi,%rax,4)
	vmovdqu64	%zmm3, 409600128(%rsi,%rax,4)
	vmovdqu64	%zmm4, 409600192(%rsi,%rax,4)
	vpmulld	409600256(%rdi,%rax,4), %zmm0, %zmm1
	vpmulld	409600320(%rdi,%rax,4), %zmm0, %zmm2
	vpmulld	409600384(%rdi,%rax,4), %zmm0, %zmm3
	vpmulld	409600448(%rdi,%rax,4), %zmm0, %zmm4
	vpaddd	409600256(%rsi,%rax,4), %zmm1, %zmm1
	vpaddd	409600320(%rsi,%rax,4), %zmm2, %zmm2
	vpaddd	409600384(%rsi,%rax,4), %zmm3, %zmm3
	vpaddd	409600448(%rsi,%rax,4), %zmm4, %zmm4
	vmovdqu64	%zmm1, 409600256(%rsi,%rax,4)
	vmovdqu64	%zmm2, 409600320(%rsi,%rax,4)
	vmovdqu64	%zmm3, 409600384(%rsi,%rax,4)
	vmovdqu64	%zmm4, 409600448(%rsi,%rax,4)
	subq	$-128, %rax
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
	vpxor	%xmm0, %xmm0, %xmm0
	movq	$-102400000, %rax               # imm = 0xF9E58000
	vpxor	%xmm2, %xmm2, %xmm2
	vpxor	%xmm1, %xmm1, %xmm1
	vpxor	%xmm3, %xmm3, %xmm3
	.p2align	4, 0x90
.LBB5_1:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vmovdqu64	409600000(%rsi,%rax,4), %zmm4
	vmovdqu64	409600064(%rsi,%rax,4), %zmm5
	vmovdqu64	409600128(%rsi,%rax,4), %zmm6
	vpaddd	409600000(%rdi,%rax,4), %zmm0, %zmm0
	vpaddd	409600064(%rdi,%rax,4), %zmm2, %zmm2
	vpaddd	409600128(%rdi,%rax,4), %zmm1, %zmm1
	vpaddd	409600192(%rdi,%rax,4), %zmm3, %zmm3
	vpaddd	409600256(%rdi,%rax,4), %zmm0, %zmm0
	vmovdqu64	409600192(%rsi,%rax,4), %zmm7
	vpaddd	409600256(%rsi,%rax,4), %zmm4, %zmm4
	vpsubd	%zmm4, %zmm0, %zmm0
	vpaddd	409600320(%rdi,%rax,4), %zmm2, %zmm2
	vpaddd	409600320(%rsi,%rax,4), %zmm5, %zmm4
	vpaddd	409600384(%rdi,%rax,4), %zmm1, %zmm1
	vpaddd	409600384(%rsi,%rax,4), %zmm6, %zmm5
	vpsubd	%zmm4, %zmm2, %zmm2
	vpsubd	%zmm5, %zmm1, %zmm1
	vpaddd	409600448(%rdi,%rax,4), %zmm3, %zmm3
	vpaddd	409600448(%rsi,%rax,4), %zmm7, %zmm4
	vpsubd	%zmm4, %zmm3, %zmm3
	subq	$-128, %rax
	jne	.LBB5_1
# %bb.2:                                # %middle.block
	vpaddd	%zmm0, %zmm2, %zmm0
	vpaddd	%zmm0, %zmm1, %zmm0
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
	retq
.Lfunc_end5:
	.size	check, .Lfunc_end5-check
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2                               # -- Begin function main
.LCPI6_0:
	.long	3                               # 0x3
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3
.LCPI6_1:
	.quad	0x408f400000000000              # double 1000
.LCPI6_2:
	.quad	0x41cdcd6500000000              # double 1.0E+9
.LCPI6_3:
	.quad	0x43974876e8000000              # double 4.194304E+17
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
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r12
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	subq	$152, %rsp
	.cfi_def_cfa_offset 192
	.cfi_offset %rbx, -40
	.cfi_offset %r12, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movl	$409600000, %edi                # imm = 0x186A0000
	callq	malloc
	movq	%rax, %r14
	movl	$409600000, %edi                # imm = 0x186A0000
	callq	malloc
	movq	%rax, %r15
	movl	$409600000, %edi                # imm = 0x186A0000
	callq	malloc
	movq	%rax, %rbx
	xorl	%edi, %edi
	callq	time
	movl	%eax, %edi
	callq	srand
	movq	$-409600000, %r12               # imm = 0xE7960000
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
	movl	%eax, 409600000(%r14,%r12)
	callq	rand
	cltq
	imulq	$-1610612725, %rax, %rcx        # imm = 0xA000000B
	shrq	$32, %rcx
	addl	%ecx, %eax
	movl	%eax, %ecx
	shrl	$31, %ecx
	sarl	$27, %eax
	addl	%ecx, %eax
	movl	%eax, 409600000(%r15,%r12)
	addq	$4, %r12
	jne	.LBB6_1
# %bb.2:                                # %iter.check
	movl	$409600000, %edx                # imm = 0x186A0000
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	memcpy@PLT
	movq	%r15, %rdi
	callq	print_vector
	movq	%r14, %rdi
	callq	print_vector
	movl	$.L.str.3, %edi
	movl	$3, %esi
	xorl	%eax, %eax
	callq	printf
	movl	$.L.str.4, %edi
	callq	puts
	movq	$-409600000, %rax               # imm = 0xE7960000
	vpbroadcastd	.LCPI6_0(%rip), %zmm5   # zmm5 = [3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3]
	.p2align	4, 0x90
.LBB6_3:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vpmulld	409600000(%r14,%rax), %zmm5, %zmm0
	vpmulld	409600064(%r14,%rax), %zmm5, %zmm1
	vpmulld	409600128(%r14,%rax), %zmm5, %zmm2
	vpmulld	409600192(%r14,%rax), %zmm5, %zmm3
	vpaddd	409600000(%r15,%rax), %zmm0, %zmm0
	vpaddd	409600064(%r15,%rax), %zmm1, %zmm1
	vpaddd	409600128(%r15,%rax), %zmm2, %zmm2
	vpaddd	409600192(%r15,%rax), %zmm3, %zmm3
	vmovdqu64	%zmm0, 409600000(%r15,%rax)
	vmovdqu64	%zmm1, 409600064(%r15,%rax)
	vmovdqu64	%zmm2, 409600128(%r15,%rax)
	vpmulld	409600256(%r14,%rax), %zmm5, %zmm0
	vpmulld	409600320(%r14,%rax), %zmm5, %zmm1
	vpmulld	409600384(%r14,%rax), %zmm5, %zmm2
	vpmulld	409600448(%r14,%rax), %zmm5, %zmm4
	vmovdqu64	%zmm3, 409600192(%r15,%rax)
	vpaddd	409600256(%r15,%rax), %zmm0, %zmm0
	vpaddd	409600320(%r15,%rax), %zmm1, %zmm1
	vpaddd	409600384(%r15,%rax), %zmm2, %zmm2
	vpaddd	409600448(%r15,%rax), %zmm4, %zmm3
	vmovdqu64	%zmm0, 409600256(%r15,%rax)
	vmovdqu64	%zmm1, 409600320(%r15,%rax)
	vmovdqu64	%zmm2, 409600384(%r15,%rax)
	vmovdqu64	%zmm3, 409600448(%r15,%rax)
	addq	$512, %rax                      # imm = 0x200
	jne	.LBB6_3
# %bb.4:                                # %vector.body202.preheader
	movq	$-409600000, %rax               # imm = 0xE7960000
	.p2align	4, 0x90
.LBB6_5:                                # %vector.body202
                                        # =>This Inner Loop Header: Depth=1
	vpmulld	409600000(%r14,%rax), %zmm5, %zmm0
	vpmulld	409600064(%r14,%rax), %zmm5, %zmm1
	vpmulld	409600128(%r14,%rax), %zmm5, %zmm2
	vpmulld	409600192(%r14,%rax), %zmm5, %zmm3
	vpaddd	409600000(%rbx,%rax), %zmm0, %zmm0
	vpaddd	409600064(%rbx,%rax), %zmm1, %zmm1
	vpaddd	409600128(%rbx,%rax), %zmm2, %zmm2
	vpaddd	409600192(%rbx,%rax), %zmm3, %zmm3
	vmovdqu64	%zmm0, 409600000(%rbx,%rax)
	vmovdqu64	%zmm1, 409600064(%rbx,%rax)
	vmovdqu64	%zmm2, 409600128(%rbx,%rax)
	vpmulld	409600256(%r14,%rax), %zmm5, %zmm0
	vpmulld	409600320(%r14,%rax), %zmm5, %zmm1
	vpmulld	409600384(%r14,%rax), %zmm5, %zmm2
	vpmulld	409600448(%r14,%rax), %zmm5, %zmm4
	vmovdqu64	%zmm3, 409600192(%rbx,%rax)
	vpaddd	409600256(%rbx,%rax), %zmm0, %zmm0
	vpaddd	409600320(%rbx,%rax), %zmm1, %zmm1
	vpaddd	409600384(%rbx,%rax), %zmm2, %zmm2
	vpaddd	409600448(%rbx,%rax), %zmm4, %zmm3
	vmovdqu64	%zmm0, 409600256(%rbx,%rax)
	vmovdqu64	%zmm1, 409600320(%rbx,%rax)
	vmovdqu64	%zmm2, 409600384(%rbx,%rax)
	vmovdqu64	%zmm3, 409600448(%rbx,%rax)
	addq	$512, %rax                      # imm = 0x200
	jne	.LBB6_5
# %bb.6:                                # %for.body.i146.preheader
	vmovdqu64	%zmm5, 64(%rsp)         # 64-byte Spill
	movq	$-409600000, %r12               # imm = 0xE7960000
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
	movl	%eax, 409600000(%r14,%r12)
	callq	rand
	cltq
	imulq	$-1610612725, %rax, %rcx        # imm = 0xA000000B
	shrq	$32, %rcx
	addl	%ecx, %eax
	movl	%eax, %ecx
	shrl	$31, %ecx
	sarl	$27, %eax
	addl	%ecx, %eax
	movl	%eax, 409600000(%r15,%r12)
	addq	$4, %r12
	jne	.LBB6_7
# %bb.8:                                # %for.body14.preheader
	movl	$409600000, %edx                # imm = 0x186A0000
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	memcpy@PLT
	leaq	32(%rsp), %rdi
	callq	ftime
	movq	32(%rsp), %rax
	movzwl	40(%rsp), %ecx
	vcvtsi2sd	%ecx, %xmm6, %xmm0
	vdivsd	.LCPI6_1(%rip), %xmm0, %xmm0
	xorl	%ecx, %ecx
	vmovdqu64	64(%rsp), %zmm6         # 64-byte Reload
	.p2align	4, 0x90
.LBB6_9:                                # %vector.ph235
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_10 Depth 2
	movq	$-409600000, %rdx               # imm = 0xE7960000
	.p2align	4, 0x90
.LBB6_10:                               # %vector.body231
                                        #   Parent Loop BB6_9 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vpmulld	409600000(%r14,%rdx), %zmm6, %zmm1
	vpmulld	409600064(%r14,%rdx), %zmm6, %zmm2
	vpmulld	409600128(%r14,%rdx), %zmm6, %zmm3
	vpmulld	409600192(%r14,%rdx), %zmm6, %zmm4
	vpaddd	409600000(%r15,%rdx), %zmm1, %zmm1
	vpaddd	409600064(%r15,%rdx), %zmm2, %zmm2
	vpaddd	409600128(%r15,%rdx), %zmm3, %zmm3
	vpaddd	409600192(%r15,%rdx), %zmm4, %zmm4
	vmovdqu64	%zmm1, 409600000(%r15,%rdx)
	vmovdqu64	%zmm2, 409600064(%r15,%rdx)
	vmovdqu64	%zmm3, 409600128(%r15,%rdx)
	vpmulld	409600256(%r14,%rdx), %zmm6, %zmm1
	vpmulld	409600320(%r14,%rdx), %zmm6, %zmm2
	vpmulld	409600384(%r14,%rdx), %zmm6, %zmm3
	vpmulld	409600448(%r14,%rdx), %zmm6, %zmm5
	vmovdqu64	%zmm4, 409600192(%r15,%rdx)
	vpaddd	409600256(%r15,%rdx), %zmm1, %zmm1
	vpaddd	409600320(%r15,%rdx), %zmm2, %zmm2
	vpaddd	409600384(%r15,%rdx), %zmm3, %zmm3
	vpaddd	409600448(%r15,%rdx), %zmm5, %zmm4
	vmovdqu64	%zmm1, 409600256(%r15,%rdx)
	vmovdqu64	%zmm2, 409600320(%r15,%rdx)
	vmovdqu64	%zmm3, 409600384(%r15,%rdx)
	vmovdqu64	%zmm4, 409600448(%r15,%rdx)
	addq	$512, %rdx                      # imm = 0x200
	jne	.LBB6_10
# %bb.11:                               # %axpy.exit175
                                        #   in Loop: Header=BB6_9 Depth=1
	addl	$1, %ecx
	cmpl	$20, %ecx
	jne	.LBB6_9
# %bb.12:                               # %for.cond.cleanup27
	vcvtsi2sd	%rax, %xmm7, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, 24(%rsp)                 # 8-byte Spill
	leaq	32(%rsp), %rdi
	callq	ftime
	vcvtsi2sdq	32(%rsp), %xmm7, %xmm0
	movzwl	40(%rsp), %eax
	vcvtsi2sd	%eax, %xmm7, %xmm1
	vdivsd	.LCPI6_1(%rip), %xmm1, %xmm1
	vaddsd	%xmm0, %xmm1, %xmm0
	vsubsd	24(%rsp), %xmm0, %xmm0          # 8-byte Folded Reload
	vmovsd	%xmm0, 24(%rsp)                 # 8-byte Spill
	leaq	32(%rsp), %rdi
	callq	ftime
	vmovdqu64	64(%rsp), %zmm6         # 64-byte Reload
	movq	32(%rsp), %rax
	movzwl	40(%rsp), %ecx
	vcvtsi2sd	%ecx, %xmm7, %xmm0
	vdivsd	.LCPI6_1(%rip), %xmm0, %xmm0
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB6_13:                               # %vector.ph264
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_14 Depth 2
	movq	$-409600000, %rdx               # imm = 0xE7960000
	.p2align	4, 0x90
.LBB6_14:                               # %vector.body260
                                        #   Parent Loop BB6_13 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vpmulld	409600000(%r14,%rdx), %zmm6, %zmm1
	vpmulld	409600064(%r14,%rdx), %zmm6, %zmm2
	vpmulld	409600128(%r14,%rdx), %zmm6, %zmm3
	vpmulld	409600192(%r14,%rdx), %zmm6, %zmm4
	vpaddd	409600000(%rbx,%rdx), %zmm1, %zmm1
	vpaddd	409600064(%rbx,%rdx), %zmm2, %zmm2
	vpaddd	409600128(%rbx,%rdx), %zmm3, %zmm3
	vpaddd	409600192(%rbx,%rdx), %zmm4, %zmm4
	vmovdqu64	%zmm1, 409600000(%rbx,%rdx)
	vmovdqu64	%zmm2, 409600064(%rbx,%rdx)
	vmovdqu64	%zmm3, 409600128(%rbx,%rdx)
	vpmulld	409600256(%r14,%rdx), %zmm6, %zmm1
	vpmulld	409600320(%r14,%rdx), %zmm6, %zmm2
	vpmulld	409600384(%r14,%rdx), %zmm6, %zmm3
	vpmulld	409600448(%r14,%rdx), %zmm6, %zmm5
	vmovdqu64	%zmm4, 409600192(%rbx,%rdx)
	vpaddd	409600256(%rbx,%rdx), %zmm1, %zmm1
	vpaddd	409600320(%rbx,%rdx), %zmm2, %zmm2
	vpaddd	409600384(%rbx,%rdx), %zmm3, %zmm3
	vpaddd	409600448(%rbx,%rdx), %zmm5, %zmm4
	vmovdqu64	%zmm1, 409600256(%rbx,%rdx)
	vmovdqu64	%zmm2, 409600320(%rbx,%rdx)
	vmovdqu64	%zmm3, 409600384(%rbx,%rdx)
	vmovdqu64	%zmm4, 409600448(%rbx,%rdx)
	addq	$512, %rdx                      # imm = 0x200
	jne	.LBB6_14
# %bb.15:                               # %axpy_serial.exit129
                                        #   in Loop: Header=BB6_13 Depth=1
	addl	$1, %ecx
	cmpl	$20, %ecx
	jne	.LBB6_13
# %bb.16:                               # %for.cond.cleanup38
	vxorpd	%xmm1, %xmm1, %xmm1
	vaddsd	24(%rsp), %xmm1, %xmm1          # 8-byte Folded Reload
	vmovsd	%xmm1, 64(%rsp)                 # 8-byte Spill
	vcvtsi2sd	%rax, %xmm7, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, 24(%rsp)                 # 8-byte Spill
	leaq	32(%rsp), %rdi
	callq	ftime
	vcvtsi2sdq	32(%rsp), %xmm7, %xmm0
	movzwl	40(%rsp), %eax
	vcvtsi2sd	%eax, %xmm7, %xmm1
	vdivsd	.LCPI6_1(%rip), %xmm1, %xmm1
	vaddsd	%xmm0, %xmm1, %xmm0
	vsubsd	24(%rsp), %xmm0, %xmm0          # 8-byte Folded Reload
	vaddsd	.LCPI6_5, %xmm0, %xmm0
	vmovsd	%xmm0, 24(%rsp)                 # 8-byte Spill
	movq	%r15, %rdi
	callq	print_vector
	movl	$.L.str.5, %edi
	callq	puts
	movq	%rbx, %rdi
	callq	print_vector
	vmovsd	.LCPI6_2(%rip), %xmm0           # xmm0 = mem[0],zero
	vmulsd	64(%rsp), %xmm0, %xmm1          # 8-byte Folded Reload
	vmovsd	.LCPI6_3(%rip), %xmm2           # xmm2 = mem[0],zero
	vdivsd	%xmm1, %xmm2, %xmm1
	vmovsd	%xmm1, 48(%rsp)                 # 8-byte Spill
	vmulsd	24(%rsp), %xmm0, %xmm0          # 8-byte Folded Reload
	vdivsd	%xmm0, %xmm2, %xmm0
	vmovsd	%xmm0, 56(%rsp)                 # 8-byte Spill
	movl	$.Lstr, %edi
	callq	puts
	movl	$.Lstr.12, %edi
	callq	puts
	movl	$.Lstr.13, %edi
	callq	puts
	vmovsd	64(%rsp), %xmm0                 # 8-byte Reload
                                        # xmm0 = mem[0],zero
	vdivsd	.LCPI6_4(%rip), %xmm0, %xmm0
	movl	$.L.str.9, %edi
	vmovsd	48(%rsp), %xmm1                 # 8-byte Reload
                                        # xmm1 = mem[0],zero
	movb	$2, %al
	callq	printf
	vmovsd	24(%rsp), %xmm0                 # 8-byte Reload
                                        # xmm0 = mem[0],zero
	vdivsd	.LCPI6_4(%rip), %xmm0, %xmm0
	movl	$.L.str.10, %edi
	vmovq	56(%rsp), %xmm1                 # 8-byte Folded Reload
                                        # xmm1 = mem[0],zero
	movb	$2, %al
	callq	printf
	vxorpd	%xmm0, %xmm0, %xmm0
	movq	$-409600000, %rax               # imm = 0xE7960000
	vxorpd	%xmm2, %xmm2, %xmm2
	vpxor	%xmm1, %xmm1, %xmm1
	vpxor	%xmm3, %xmm3, %xmm3
	.p2align	4, 0x90
.LBB6_17:                               # %vector.body289
                                        # =>This Inner Loop Header: Depth=1
	vmovdqu64	409600000(%rbx,%rax), %zmm4
	vmovdqu64	409600064(%rbx,%rax), %zmm5
	vmovdqu64	409600128(%rbx,%rax), %zmm6
	vpaddd	409600000(%r15,%rax), %zmm0, %zmm0
	vpaddd	409600064(%r15,%rax), %zmm2, %zmm2
	vpaddd	409600128(%r15,%rax), %zmm1, %zmm1
	vpaddd	409600192(%r15,%rax), %zmm3, %zmm3
	vpaddd	409600256(%r15,%rax), %zmm0, %zmm0
	vmovdqu64	409600192(%rbx,%rax), %zmm7
	vpaddd	409600256(%rbx,%rax), %zmm4, %zmm4
	vpsubd	%zmm4, %zmm0, %zmm0
	vpaddd	409600320(%r15,%rax), %zmm2, %zmm2
	vpaddd	409600320(%rbx,%rax), %zmm5, %zmm4
	vpaddd	409600384(%r15,%rax), %zmm1, %zmm1
	vpaddd	409600384(%rbx,%rax), %zmm6, %zmm5
	vpsubd	%zmm4, %zmm2, %zmm2
	vpsubd	%zmm5, %zmm1, %zmm1
	vpaddd	409600448(%r15,%rax), %zmm3, %zmm3
	vpaddd	409600448(%rbx,%rax), %zmm7, %zmm4
	vpsubd	%zmm4, %zmm3, %zmm3
	addq	$512, %rax                      # imm = 0x200
	jne	.LBB6_17
# %bb.18:                               # %middle.block288
	vpaddd	%zmm0, %zmm2, %zmm0
	vpaddd	%zmm0, %zmm1, %zmm0
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
	movl	$.L.str.11, %edi
	xorl	%eax, %eax
	callq	printf
	movq	%r14, %rdi
	callq	free
	movq	%r15, %rdi
	callq	free
	movq	%rbx, %rdi
	callq	free
	xorl	%eax, %eax
	addq	$152, %rsp
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
