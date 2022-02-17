	.text
	.file	"axpy_double.c"
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
	movq	%rsi, %r14
	movq	%rdi, %r15
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB1_1:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	callq	rand
	vcvtsi2sd	%eax, %xmm2, %xmm0
	vmovsd	.LCPI1_0(%rip), %xmm1           # xmm1 = mem[0],zero
	vdivsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, (%r15,%rbx,8)
	callq	rand
	vcvtsi2sd	%eax, %xmm2, %xmm0
	vdivsd	.LCPI1_0(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, (%r14,%rbx,8)
	incq	%rbx
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
	vbroadcastsd	%xmm0, %ymm0
	movl	$28, %eax
	.p2align	4, 0x90
.LBB2_1:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vmulpd	-224(%rdi,%rax,8), %ymm0, %ymm1
	vmulpd	-192(%rdi,%rax,8), %ymm0, %ymm2
	vmulpd	-160(%rdi,%rax,8), %ymm0, %ymm3
	vmulpd	-128(%rdi,%rax,8), %ymm0, %ymm4
	vaddpd	-224(%rsi,%rax,8), %ymm1, %ymm1
	vaddpd	-192(%rsi,%rax,8), %ymm2, %ymm2
	vaddpd	-160(%rsi,%rax,8), %ymm3, %ymm3
	vaddpd	-128(%rsi,%rax,8), %ymm4, %ymm4
	vmovupd	%ymm1, -224(%rsi,%rax,8)
	vmovupd	%ymm2, -192(%rsi,%rax,8)
	vmovupd	%ymm3, -160(%rsi,%rax,8)
	vmovupd	%ymm4, -128(%rsi,%rax,8)
	vmulpd	-96(%rdi,%rax,8), %ymm0, %ymm1
	vmulpd	-64(%rdi,%rax,8), %ymm0, %ymm2
	vmulpd	-32(%rdi,%rax,8), %ymm0, %ymm3
	vmulpd	(%rdi,%rax,8), %ymm0, %ymm4
	vaddpd	-96(%rsi,%rax,8), %ymm1, %ymm1
	vaddpd	-64(%rsi,%rax,8), %ymm2, %ymm2
	vaddpd	-32(%rsi,%rax,8), %ymm3, %ymm3
	vaddpd	(%rsi,%rax,8), %ymm4, %ymm4
	vmovupd	%ymm1, -96(%rsi,%rax,8)
	vmovupd	%ymm2, -64(%rsi,%rax,8)
	vmovupd	%ymm3, -32(%rsi,%rax,8)
	vmovupd	%ymm4, (%rsi,%rax,8)
	addq	$32, %rax
	cmpq	$102400028, %rax                # imm = 0x61A801C
	jne	.LBB2_1
# %bb.2:                                # %omp.inner.for.end
	vzeroupper
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
	leaq	819200000(%rdi), %rax
	cmpq	%rsi, %rax
	jbe	.LBB3_4
# %bb.1:                                # %entry
	leaq	819200000(%rsi), %rax
	cmpq	%rdi, %rax
	jbe	.LBB3_4
# %bb.2:                                # %for.body.preheader
	movl	$4, %eax
	.p2align	4, 0x90
.LBB3_3:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	vmulsd	-32(%rdi,%rax,8), %xmm0, %xmm1
	vaddsd	-32(%rsi,%rax,8), %xmm1, %xmm1
	vmovsd	%xmm1, -32(%rsi,%rax,8)
	vmulsd	-24(%rdi,%rax,8), %xmm0, %xmm1
	vaddsd	-24(%rsi,%rax,8), %xmm1, %xmm1
	vmovsd	%xmm1, -24(%rsi,%rax,8)
	vmulsd	-16(%rdi,%rax,8), %xmm0, %xmm1
	vaddsd	-16(%rsi,%rax,8), %xmm1, %xmm1
	vmovsd	%xmm1, -16(%rsi,%rax,8)
	vmulsd	-8(%rdi,%rax,8), %xmm0, %xmm1
	vaddsd	-8(%rsi,%rax,8), %xmm1, %xmm1
	vmovsd	%xmm1, -8(%rsi,%rax,8)
	vmulsd	(%rdi,%rax,8), %xmm0, %xmm1
	vaddsd	(%rsi,%rax,8), %xmm1, %xmm1
	vmovsd	%xmm1, (%rsi,%rax,8)
	addq	$5, %rax
	cmpq	$102400004, %rax                # imm = 0x61A8004
	jne	.LBB3_3
	jmp	.LBB3_6
.LBB3_4:                                # %vector.ph
	vbroadcastsd	%xmm0, %ymm0
	movl	$28, %eax
	.p2align	4, 0x90
.LBB3_5:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vmulpd	-224(%rdi,%rax,8), %ymm0, %ymm1
	vmulpd	-192(%rdi,%rax,8), %ymm0, %ymm2
	vmulpd	-160(%rdi,%rax,8), %ymm0, %ymm3
	vmulpd	-128(%rdi,%rax,8), %ymm0, %ymm4
	vaddpd	-224(%rsi,%rax,8), %ymm1, %ymm1
	vaddpd	-192(%rsi,%rax,8), %ymm2, %ymm2
	vaddpd	-160(%rsi,%rax,8), %ymm3, %ymm3
	vaddpd	-128(%rsi,%rax,8), %ymm4, %ymm4
	vmovupd	%ymm1, -224(%rsi,%rax,8)
	vmovupd	%ymm2, -192(%rsi,%rax,8)
	vmovupd	%ymm3, -160(%rsi,%rax,8)
	vmovupd	%ymm4, -128(%rsi,%rax,8)
	vmulpd	-96(%rdi,%rax,8), %ymm0, %ymm1
	vmulpd	-64(%rdi,%rax,8), %ymm0, %ymm2
	vmulpd	-32(%rdi,%rax,8), %ymm0, %ymm3
	vmulpd	(%rdi,%rax,8), %ymm0, %ymm4
	vaddpd	-96(%rsi,%rax,8), %ymm1, %ymm1
	vaddpd	-64(%rsi,%rax,8), %ymm2, %ymm2
	vaddpd	-32(%rsi,%rax,8), %ymm3, %ymm3
	vaddpd	(%rsi,%rax,8), %ymm4, %ymm4
	vmovupd	%ymm1, -96(%rsi,%rax,8)
	vmovupd	%ymm2, -64(%rsi,%rax,8)
	vmovupd	%ymm3, -32(%rsi,%rax,8)
	vmovupd	%ymm4, (%rsi,%rax,8)
	addq	$32, %rax
	cmpq	$102400028, %rax                # imm = 0x61A801C
	jne	.LBB3_5
.LBB3_6:                                # %for.cond.cleanup
	vzeroupper
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
	vmovsd	(%rbx), %xmm0                   # xmm0 = mem[0],zero
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf
	vmovsd	8(%rbx), %xmm0                  # xmm0 = mem[0],zero
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf
	vmovsd	16(%rbx), %xmm0                 # xmm0 = mem[0],zero
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf
	vmovsd	24(%rbx), %xmm0                 # xmm0 = mem[0],zero
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf
	vmovsd	32(%rbx), %xmm0                 # xmm0 = mem[0],zero
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf
	vmovsd	40(%rbx), %xmm0                 # xmm0 = mem[0],zero
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf
	vmovsd	48(%rbx), %xmm0                 # xmm0 = mem[0],zero
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf
	vmovsd	56(%rbx), %xmm0                 # xmm0 = mem[0],zero
	movl	$.L.str.1, %edi
	movb	$1, %al
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
	vxorpd	%xmm0, %xmm0, %xmm0
	movl	$7, %eax
	.p2align	4, 0x90
.LBB5_1:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	vmovsd	-56(%rdi,%rax,8), %xmm1         # xmm1 = mem[0],zero
	vmovsd	-48(%rdi,%rax,8), %xmm2         # xmm2 = mem[0],zero
	vsubsd	-56(%rsi,%rax,8), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vsubsd	-48(%rsi,%rax,8), %xmm2, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	-40(%rdi,%rax,8), %xmm1         # xmm1 = mem[0],zero
	vsubsd	-40(%rsi,%rax,8), %xmm1, %xmm1
	vmovsd	-32(%rdi,%rax,8), %xmm2         # xmm2 = mem[0],zero
	vsubsd	-32(%rsi,%rax,8), %xmm2, %xmm2
	vaddsd	%xmm1, %xmm0, %xmm0
	vaddsd	%xmm2, %xmm0, %xmm0
	vmovsd	-24(%rdi,%rax,8), %xmm1         # xmm1 = mem[0],zero
	vsubsd	-24(%rsi,%rax,8), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	-16(%rdi,%rax,8), %xmm1         # xmm1 = mem[0],zero
	vsubsd	-16(%rsi,%rax,8), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	-8(%rdi,%rax,8), %xmm1          # xmm1 = mem[0],zero
	vsubsd	-8(%rsi,%rax,8), %xmm1, %xmm1
	vmovsd	(%rdi,%rax,8), %xmm2            # xmm2 = mem[0],zero
	vaddsd	%xmm1, %xmm0, %xmm0
	vsubsd	(%rsi,%rax,8), %xmm2, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	addq	$8, %rax
	cmpq	$102400007, %rax                # imm = 0x61A8007
	jne	.LBB5_1
# %bb.2:                                # %for.cond.cleanup
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
	.quad	0x40091eb851eb851f              # double 3.1400000000000001
.LCPI6_2:
	.quad	0x408f400000000000              # double 1000
.LCPI6_3:
	.quad	0x41cdcd6500000000              # double 1.0E+9
.LCPI6_4:
	.quad	0x43974876e8000000              # double 4.194304E+17
.LCPI6_5:
	.quad	0x4034000000000000              # double 20
.LCPI6_6:
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
	subq	$120, %rsp
	.cfi_def_cfa_offset 160
	.cfi_offset %rbx, -40
	.cfi_offset %r12, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movl	$819200000, %edi                # imm = 0x30D40000
	callq	malloc
	movq	%rax, %r14
	movl	$819200000, %edi                # imm = 0x30D40000
	callq	malloc
	movq	%rax, %r15
	movl	$819200000, %edi                # imm = 0x30D40000
	callq	malloc
	movq	%rax, %rbx
	xorl	%r12d, %r12d
	xorl	%edi, %edi
	callq	time
	movl	%eax, %edi
	callq	srand
	.p2align	4, 0x90
.LBB6_1:                                # %for.body.i
                                        # =>This Inner Loop Header: Depth=1
	callq	rand
	vcvtsi2sd	%eax, %xmm2, %xmm0
	vmovsd	.LCPI6_0(%rip), %xmm1           # xmm1 = mem[0],zero
	vdivsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, (%r14,%r12,8)
	callq	rand
	vcvtsi2sd	%eax, %xmm2, %xmm0
	vdivsd	.LCPI6_0(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, (%r15,%r12,8)
	incq	%r12
	cmpq	$102400000, %r12                # imm = 0x61A8000
	jne	.LBB6_1
# %bb.2:                                # %for.body.preheader
	movl	$819200000, %edx                # imm = 0x30D40000
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	memcpy@PLT
	movq	%r15, %rdi
	callq	print_vector
	movq	%r14, %rdi
	callq	print_vector
	vmovsd	.LCPI6_1(%rip), %xmm0           # xmm0 = mem[0],zero
	movl	$.L.str.3, %edi
	movb	$1, %al
	callq	printf
	movl	$.L.str.4, %edi
	callq	puts
	movl	$28, %eax
	vbroadcastsd	.LCPI6_1(%rip), %ymm4   # ymm4 = [3.1400000000000001E+0,3.1400000000000001E+0,3.1400000000000001E+0,3.1400000000000001E+0]
	.p2align	4, 0x90
.LBB6_3:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vmulpd	-224(%r14,%rax,8), %ymm4, %ymm0
	vmulpd	-192(%r14,%rax,8), %ymm4, %ymm1
	vmulpd	-160(%r14,%rax,8), %ymm4, %ymm2
	vmulpd	-128(%r14,%rax,8), %ymm4, %ymm3
	vaddpd	-224(%r15,%rax,8), %ymm0, %ymm0
	vaddpd	-192(%r15,%rax,8), %ymm1, %ymm1
	vaddpd	-160(%r15,%rax,8), %ymm2, %ymm2
	vaddpd	-128(%r15,%rax,8), %ymm3, %ymm3
	vmovupd	%ymm0, -224(%r15,%rax,8)
	vmovupd	%ymm1, -192(%r15,%rax,8)
	vmovupd	%ymm2, -160(%r15,%rax,8)
	vmovupd	%ymm3, -128(%r15,%rax,8)
	vmulpd	-96(%r14,%rax,8), %ymm4, %ymm0
	vmulpd	-64(%r14,%rax,8), %ymm4, %ymm1
	vmulpd	-32(%r14,%rax,8), %ymm4, %ymm2
	vmulpd	(%r14,%rax,8), %ymm4, %ymm3
	vaddpd	-96(%r15,%rax,8), %ymm0, %ymm0
	vaddpd	-64(%r15,%rax,8), %ymm1, %ymm1
	vaddpd	-32(%r15,%rax,8), %ymm2, %ymm2
	vaddpd	(%r15,%rax,8), %ymm3, %ymm3
	vmovupd	%ymm0, -96(%r15,%rax,8)
	vmovupd	%ymm1, -64(%r15,%rax,8)
	vmovupd	%ymm2, -32(%r15,%rax,8)
	vmovupd	%ymm3, (%r15,%rax,8)
	addq	$32, %rax
	cmpq	$102400028, %rax                # imm = 0x61A801C
	jne	.LBB6_3
# %bb.4:                                # %vector.body201.preheader
	movl	$28, %eax
	.p2align	4, 0x90
.LBB6_5:                                # %vector.body201
                                        # =>This Inner Loop Header: Depth=1
	vmulpd	-224(%r14,%rax,8), %ymm4, %ymm0
	vmulpd	-192(%r14,%rax,8), %ymm4, %ymm1
	vmulpd	-160(%r14,%rax,8), %ymm4, %ymm2
	vmulpd	-128(%r14,%rax,8), %ymm4, %ymm3
	vaddpd	-224(%rbx,%rax,8), %ymm0, %ymm0
	vaddpd	-192(%rbx,%rax,8), %ymm1, %ymm1
	vaddpd	-160(%rbx,%rax,8), %ymm2, %ymm2
	vaddpd	-128(%rbx,%rax,8), %ymm3, %ymm3
	vmovupd	%ymm0, -224(%rbx,%rax,8)
	vmovupd	%ymm1, -192(%rbx,%rax,8)
	vmovupd	%ymm2, -160(%rbx,%rax,8)
	vmovupd	%ymm3, -128(%rbx,%rax,8)
	vmulpd	-96(%r14,%rax,8), %ymm4, %ymm0
	vmulpd	-64(%r14,%rax,8), %ymm4, %ymm1
	vmulpd	-32(%r14,%rax,8), %ymm4, %ymm2
	vmulpd	(%r14,%rax,8), %ymm4, %ymm3
	vaddpd	-96(%rbx,%rax,8), %ymm0, %ymm0
	vaddpd	-64(%rbx,%rax,8), %ymm1, %ymm1
	vaddpd	-32(%rbx,%rax,8), %ymm2, %ymm2
	vaddpd	(%rbx,%rax,8), %ymm3, %ymm3
	vmovupd	%ymm0, -96(%rbx,%rax,8)
	vmovupd	%ymm1, -64(%rbx,%rax,8)
	vmovupd	%ymm2, -32(%rbx,%rax,8)
	vmovupd	%ymm3, (%rbx,%rax,8)
	addq	$32, %rax
	cmpq	$102400028, %rax                # imm = 0x61A801C
	jne	.LBB6_5
# %bb.6:                                # %for.body.i148.preheader
	vmovupd	%ymm4, 64(%rsp)                 # 32-byte Spill
	xorl	%r12d, %r12d
	.p2align	4, 0x90
.LBB6_7:                                # %for.body.i148
                                        # =>This Inner Loop Header: Depth=1
	vzeroupper
	callq	rand
	vcvtsi2sd	%eax, %xmm5, %xmm0
	vmovsd	.LCPI6_0(%rip), %xmm1           # xmm1 = mem[0],zero
	vdivsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, (%r14,%r12,8)
	callq	rand
	vcvtsi2sd	%eax, %xmm5, %xmm0
	vdivsd	.LCPI6_0(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, (%r15,%r12,8)
	incq	%r12
	cmpq	$102400000, %r12                # imm = 0x61A8000
	jne	.LBB6_7
# %bb.8:                                # %for.body14.preheader
	movl	$819200000, %edx                # imm = 0x30D40000
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	memcpy@PLT
	leaq	32(%rsp), %rdi
	callq	ftime
	movq	32(%rsp), %rax
	movzwl	40(%rsp), %ecx
	vcvtsi2sd	%ecx, %xmm5, %xmm0
	vdivsd	.LCPI6_2(%rip), %xmm0, %xmm0
	xorl	%ecx, %ecx
	vmovupd	64(%rsp), %ymm5                 # 32-byte Reload
	.p2align	4, 0x90
.LBB6_9:                                # %vector.ph218
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_10 Depth 2
	movl	$28, %edx
	.p2align	4, 0x90
.LBB6_10:                               # %vector.body217
                                        #   Parent Loop BB6_9 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vmulpd	-224(%r14,%rdx,8), %ymm5, %ymm1
	vmulpd	-192(%r14,%rdx,8), %ymm5, %ymm2
	vmulpd	-160(%r14,%rdx,8), %ymm5, %ymm3
	vmulpd	-128(%r14,%rdx,8), %ymm5, %ymm4
	vaddpd	-224(%r15,%rdx,8), %ymm1, %ymm1
	vaddpd	-192(%r15,%rdx,8), %ymm2, %ymm2
	vaddpd	-160(%r15,%rdx,8), %ymm3, %ymm3
	vaddpd	-128(%r15,%rdx,8), %ymm4, %ymm4
	vmovupd	%ymm1, -224(%r15,%rdx,8)
	vmovupd	%ymm2, -192(%r15,%rdx,8)
	vmovupd	%ymm3, -160(%r15,%rdx,8)
	vmovupd	%ymm4, -128(%r15,%rdx,8)
	vmulpd	-96(%r14,%rdx,8), %ymm5, %ymm1
	vmulpd	-64(%r14,%rdx,8), %ymm5, %ymm2
	vmulpd	-32(%r14,%rdx,8), %ymm5, %ymm3
	vmulpd	(%r14,%rdx,8), %ymm5, %ymm4
	vaddpd	-96(%r15,%rdx,8), %ymm1, %ymm1
	vaddpd	-64(%r15,%rdx,8), %ymm2, %ymm2
	vaddpd	-32(%r15,%rdx,8), %ymm3, %ymm3
	vaddpd	(%r15,%rdx,8), %ymm4, %ymm4
	vmovupd	%ymm1, -96(%r15,%rdx,8)
	vmovupd	%ymm2, -64(%r15,%rdx,8)
	vmovupd	%ymm3, -32(%r15,%rdx,8)
	vmovupd	%ymm4, (%r15,%rdx,8)
	addq	$32, %rdx
	cmpq	$102400028, %rdx                # imm = 0x61A801C
	jne	.LBB6_10
# %bb.11:                               # %axpy.exit178
                                        #   in Loop: Header=BB6_9 Depth=1
	incl	%ecx
	cmpl	$20, %ecx
	jne	.LBB6_9
# %bb.12:                               # %for.cond.cleanup27
	vcvtsi2sd	%rax, %xmm6, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, 24(%rsp)                 # 8-byte Spill
	leaq	32(%rsp), %rdi
	vzeroupper
	callq	ftime
	vcvtsi2sdq	32(%rsp), %xmm6, %xmm0
	movzwl	40(%rsp), %eax
	vcvtsi2sd	%eax, %xmm6, %xmm1
	vdivsd	.LCPI6_2(%rip), %xmm1, %xmm1
	vaddsd	%xmm0, %xmm1, %xmm0
	vsubsd	24(%rsp), %xmm0, %xmm0          # 8-byte Folded Reload
	vmovsd	%xmm0, 24(%rsp)                 # 8-byte Spill
	leaq	32(%rsp), %rdi
	callq	ftime
	vmovupd	64(%rsp), %ymm5                 # 32-byte Reload
	movq	32(%rsp), %rax
	movzwl	40(%rsp), %ecx
	vcvtsi2sd	%ecx, %xmm6, %xmm0
	vdivsd	.LCPI6_2(%rip), %xmm0, %xmm0
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB6_13:                               # %vector.ph234
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_14 Depth 2
	movl	$28, %edx
	.p2align	4, 0x90
.LBB6_14:                               # %vector.body233
                                        #   Parent Loop BB6_13 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vmulpd	-224(%r14,%rdx,8), %ymm5, %ymm1
	vmulpd	-192(%r14,%rdx,8), %ymm5, %ymm2
	vmulpd	-160(%r14,%rdx,8), %ymm5, %ymm3
	vmulpd	-128(%r14,%rdx,8), %ymm5, %ymm4
	vaddpd	-224(%rbx,%rdx,8), %ymm1, %ymm1
	vaddpd	-192(%rbx,%rdx,8), %ymm2, %ymm2
	vaddpd	-160(%rbx,%rdx,8), %ymm3, %ymm3
	vaddpd	-128(%rbx,%rdx,8), %ymm4, %ymm4
	vmovupd	%ymm1, -224(%rbx,%rdx,8)
	vmovupd	%ymm2, -192(%rbx,%rdx,8)
	vmovupd	%ymm3, -160(%rbx,%rdx,8)
	vmovupd	%ymm4, -128(%rbx,%rdx,8)
	vmulpd	-96(%r14,%rdx,8), %ymm5, %ymm1
	vmulpd	-64(%r14,%rdx,8), %ymm5, %ymm2
	vmulpd	-32(%r14,%rdx,8), %ymm5, %ymm3
	vmulpd	(%r14,%rdx,8), %ymm5, %ymm4
	vaddpd	-96(%rbx,%rdx,8), %ymm1, %ymm1
	vaddpd	-64(%rbx,%rdx,8), %ymm2, %ymm2
	vaddpd	-32(%rbx,%rdx,8), %ymm3, %ymm3
	vaddpd	(%rbx,%rdx,8), %ymm4, %ymm4
	vmovupd	%ymm1, -96(%rbx,%rdx,8)
	vmovupd	%ymm2, -64(%rbx,%rdx,8)
	vmovupd	%ymm3, -32(%rbx,%rdx,8)
	vmovupd	%ymm4, (%rbx,%rdx,8)
	addq	$32, %rdx
	cmpq	$102400028, %rdx                # imm = 0x61A801C
	jne	.LBB6_14
# %bb.15:                               # %axpy_serial.exit129
                                        #   in Loop: Header=BB6_13 Depth=1
	incl	%ecx
	cmpl	$20, %ecx
	jne	.LBB6_13
# %bb.16:                               # %for.cond.cleanup38
	vxorpd	%xmm1, %xmm1, %xmm1
	vaddsd	24(%rsp), %xmm1, %xmm1          # 8-byte Folded Reload
	vmovsd	%xmm1, 64(%rsp)                 # 8-byte Spill
	vcvtsi2sd	%rax, %xmm6, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, 24(%rsp)                 # 8-byte Spill
	leaq	32(%rsp), %rdi
	vzeroupper
	callq	ftime
	vcvtsi2sdq	32(%rsp), %xmm6, %xmm0
	movzwl	40(%rsp), %eax
	vcvtsi2sd	%eax, %xmm6, %xmm1
	vdivsd	.LCPI6_2(%rip), %xmm1, %xmm1
	vaddsd	%xmm0, %xmm1, %xmm0
	vsubsd	24(%rsp), %xmm0, %xmm0          # 8-byte Folded Reload
	vaddsd	.LCPI6_6, %xmm0, %xmm0
	vmovsd	%xmm0, 24(%rsp)                 # 8-byte Spill
	movq	%r15, %rdi
	callq	print_vector
	movl	$.L.str.5, %edi
	callq	puts
	movq	%rbx, %rdi
	callq	print_vector
	vmovsd	.LCPI6_3(%rip), %xmm0           # xmm0 = mem[0],zero
	vmulsd	64(%rsp), %xmm0, %xmm1          # 8-byte Folded Reload
	vmovsd	.LCPI6_4(%rip), %xmm2           # xmm2 = mem[0],zero
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
	vdivsd	.LCPI6_5(%rip), %xmm0, %xmm0
	movl	$.L.str.9, %edi
	vmovsd	48(%rsp), %xmm1                 # 8-byte Reload
                                        # xmm1 = mem[0],zero
	movb	$2, %al
	callq	printf
	vmovsd	24(%rsp), %xmm0                 # 8-byte Reload
                                        # xmm0 = mem[0],zero
	vdivsd	.LCPI6_5(%rip), %xmm0, %xmm0
	movl	$.L.str.10, %edi
	vmovsd	56(%rsp), %xmm1                 # 8-byte Reload
                                        # xmm1 = mem[0],zero
	movb	$2, %al
	callq	printf
	vxorpd	%xmm0, %xmm0, %xmm0
	movl	$7, %eax
	.p2align	4, 0x90
.LBB6_17:                               # %for.body.i136
                                        # =>This Inner Loop Header: Depth=1
	vmovsd	-56(%r15,%rax,8), %xmm2         # xmm2 = mem[0],zero
	vmovsd	-48(%r15,%rax,8), %xmm1         # xmm1 = mem[0],zero
	vsubsd	-56(%rbx,%rax,8), %xmm2, %xmm2
	vaddsd	%xmm2, %xmm0, %xmm0
	vsubsd	-48(%rbx,%rax,8), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	-40(%r15,%rax,8), %xmm1         # xmm1 = mem[0],zero
	vsubsd	-40(%rbx,%rax,8), %xmm1, %xmm1
	vmovsd	-32(%r15,%rax,8), %xmm2         # xmm2 = mem[0],zero
	vsubsd	-32(%rbx,%rax,8), %xmm2, %xmm2
	vaddsd	%xmm1, %xmm0, %xmm0
	vaddsd	%xmm2, %xmm0, %xmm0
	vmovsd	-24(%r15,%rax,8), %xmm1         # xmm1 = mem[0],zero
	vsubsd	-24(%rbx,%rax,8), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	-16(%r15,%rax,8), %xmm1         # xmm1 = mem[0],zero
	vsubsd	-16(%rbx,%rax,8), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	-8(%r15,%rax,8), %xmm1          # xmm1 = mem[0],zero
	vsubsd	-8(%rbx,%rax,8), %xmm1, %xmm1
	vmovsd	(%r15,%rax,8), %xmm2            # xmm2 = mem[0],zero
	vaddsd	%xmm1, %xmm0, %xmm0
	vsubsd	(%rbx,%rax,8), %xmm2, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	addq	$8, %rax
	cmpq	$102400007, %rax                # imm = 0x61A8007
	jne	.LBB6_17
# %bb.18:                               # %check.exit
	movl	$.L.str.11, %edi
	movb	$1, %al
	callq	printf
	movq	%r14, %rdi
	callq	free
	movq	%r15, %rdi
	callq	free
	movq	%rbx, %rdi
	callq	free
	xorl	%eax, %eax
	addq	$120, %rsp
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
