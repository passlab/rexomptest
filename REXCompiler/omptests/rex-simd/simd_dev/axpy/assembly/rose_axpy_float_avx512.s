	.text
	.file	"rose_axpy_float_avx512.c"
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
	movq	%rsi, %r14
	movq	%rdi, %r15
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB1_1:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	callq	rand
	vcvtsi2ss	%eax, %xmm2, %xmm0
	vmovss	.LCPI1_0(%rip), %xmm1           # xmm1 = mem[0],zero,zero,zero
	vdivss	%xmm1, %xmm0, %xmm0
	vmovss	%xmm0, (%r15,%rbx,4)
	callq	rand
	vcvtsi2ss	%eax, %xmm2, %xmm0
	vdivss	.LCPI1_0(%rip), %xmm0, %xmm0
	vmovss	%xmm0, (%r14,%rbx,4)
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
	vbroadcastss	%xmm0, %zmm0
	movq	$-16, %rax
	.p2align	4, 0x90
.LBB2_1:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	vmulps	64(%rdi,%rax,4), %zmm0, %zmm1
	vaddps	64(%rsi,%rax,4), %zmm1, %zmm1
	vmovups	%zmm1, 64(%rsi,%rax,4)
	vmulps	128(%rdi,%rax,4), %zmm0, %zmm1
	vaddps	128(%rsi,%rax,4), %zmm1, %zmm1
	vmovups	%zmm1, 128(%rsi,%rax,4)
	vmulps	192(%rdi,%rax,4), %zmm0, %zmm1
	vaddps	192(%rsi,%rax,4), %zmm1, %zmm1
	vmovups	%zmm1, 192(%rsi,%rax,4)
	vmulps	256(%rdi,%rax,4), %zmm0, %zmm1
	vaddps	256(%rsi,%rax,4), %zmm1, %zmm1
	vmovups	%zmm1, 256(%rsi,%rax,4)
	vmulps	320(%rdi,%rax,4), %zmm0, %zmm1
	vaddps	320(%rsi,%rax,4), %zmm1, %zmm1
	vmovups	%zmm1, 320(%rsi,%rax,4)
	vmulps	384(%rdi,%rax,4), %zmm0, %zmm1
	vaddps	384(%rsi,%rax,4), %zmm1, %zmm1
	vmovups	%zmm1, 384(%rsi,%rax,4)
	vmulps	448(%rdi,%rax,4), %zmm0, %zmm1
	vaddps	448(%rsi,%rax,4), %zmm1, %zmm1
	vmovups	%zmm1, 448(%rsi,%rax,4)
	vmulps	512(%rdi,%rax,4), %zmm0, %zmm1
	vaddps	512(%rsi,%rax,4), %zmm1, %zmm1
	vmovups	%zmm1, 512(%rsi,%rax,4)
	subq	$-128, %rax
	cmpq	$102399984, %rax                # imm = 0x61A7FF0
	jb	.LBB2_1
# %bb.2:                                # %for.end
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
	leaq	409600000(%rdi), %rax
	cmpq	%rsi, %rax
	jbe	.LBB3_4
# %bb.1:                                # %entry
	leaq	409600000(%rsi), %rax
	cmpq	%rdi, %rax
	jbe	.LBB3_4
# %bb.2:                                # %for.body.preheader
	movl	$4, %eax
	.p2align	4, 0x90
.LBB3_3:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	vmulss	-16(%rdi,%rax,4), %xmm0, %xmm1
	vaddss	-16(%rsi,%rax,4), %xmm1, %xmm1
	vmovss	%xmm1, -16(%rsi,%rax,4)
	vmulss	-12(%rdi,%rax,4), %xmm0, %xmm1
	vaddss	-12(%rsi,%rax,4), %xmm1, %xmm1
	vmovss	%xmm1, -12(%rsi,%rax,4)
	vmulss	-8(%rdi,%rax,4), %xmm0, %xmm1
	vaddss	-8(%rsi,%rax,4), %xmm1, %xmm1
	vmovss	%xmm1, -8(%rsi,%rax,4)
	vmulss	-4(%rdi,%rax,4), %xmm0, %xmm1
	vaddss	-4(%rsi,%rax,4), %xmm1, %xmm1
	vmovss	%xmm1, -4(%rsi,%rax,4)
	vmulss	(%rdi,%rax,4), %xmm0, %xmm1
	vaddss	(%rsi,%rax,4), %xmm1, %xmm1
	vmovss	%xmm1, (%rsi,%rax,4)
	addq	$5, %rax
	cmpq	$102400004, %rax                # imm = 0x61A8004
	jne	.LBB3_3
	jmp	.LBB3_6
.LBB3_4:                                # %vector.ph
	vbroadcastss	%xmm0, %ymm0
	movl	$56, %eax
	.p2align	4, 0x90
.LBB3_5:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vmulps	-224(%rdi,%rax,4), %ymm0, %ymm1
	vmulps	-192(%rdi,%rax,4), %ymm0, %ymm2
	vmulps	-160(%rdi,%rax,4), %ymm0, %ymm3
	vmulps	-128(%rdi,%rax,4), %ymm0, %ymm4
	vaddps	-224(%rsi,%rax,4), %ymm1, %ymm1
	vaddps	-192(%rsi,%rax,4), %ymm2, %ymm2
	vaddps	-160(%rsi,%rax,4), %ymm3, %ymm3
	vaddps	-128(%rsi,%rax,4), %ymm4, %ymm4
	vmovups	%ymm1, -224(%rsi,%rax,4)
	vmovups	%ymm2, -192(%rsi,%rax,4)
	vmovups	%ymm3, -160(%rsi,%rax,4)
	vmovups	%ymm4, -128(%rsi,%rax,4)
	vmulps	-96(%rdi,%rax,4), %ymm0, %ymm1
	vmulps	-64(%rdi,%rax,4), %ymm0, %ymm2
	vmulps	-32(%rdi,%rax,4), %ymm0, %ymm3
	vmulps	(%rdi,%rax,4), %ymm0, %ymm4
	vaddps	-96(%rsi,%rax,4), %ymm1, %ymm1
	vaddps	-64(%rsi,%rax,4), %ymm2, %ymm2
	vaddps	-32(%rsi,%rax,4), %ymm3, %ymm3
	vaddps	(%rsi,%rax,4), %ymm4, %ymm4
	vmovups	%ymm1, -96(%rsi,%rax,4)
	vmovups	%ymm2, -64(%rsi,%rax,4)
	vmovups	%ymm3, -32(%rsi,%rax,4)
	vmovups	%ymm4, (%rsi,%rax,4)
	addq	$64, %rax
	cmpq	$102400056, %rax                # imm = 0x61A8038
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
	vmovss	(%rbx), %xmm0                   # xmm0 = mem[0],zero,zero,zero
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf
	vmovss	4(%rbx), %xmm0                  # xmm0 = mem[0],zero,zero,zero
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf
	vmovss	8(%rbx), %xmm0                  # xmm0 = mem[0],zero,zero,zero
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf
	vmovss	12(%rbx), %xmm0                 # xmm0 = mem[0],zero,zero,zero
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf
	vmovss	16(%rbx), %xmm0                 # xmm0 = mem[0],zero,zero,zero
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf
	vmovss	20(%rbx), %xmm0                 # xmm0 = mem[0],zero,zero,zero
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf
	vmovss	24(%rbx), %xmm0                 # xmm0 = mem[0],zero,zero,zero
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf
	vmovss	28(%rbx), %xmm0                 # xmm0 = mem[0],zero,zero,zero
	vcvtss2sd	%xmm0, %xmm0, %xmm0
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
	vxorps	%xmm0, %xmm0, %xmm0
	movl	$7, %eax
	.p2align	4, 0x90
.LBB5_1:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	vmovss	-28(%rdi,%rax,4), %xmm1         # xmm1 = mem[0],zero,zero,zero
	vmovss	-24(%rdi,%rax,4), %xmm2         # xmm2 = mem[0],zero,zero,zero
	vsubss	-28(%rsi,%rax,4), %xmm1, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	vsubss	-24(%rsi,%rax,4), %xmm2, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	vmovss	-20(%rdi,%rax,4), %xmm1         # xmm1 = mem[0],zero,zero,zero
	vsubss	-20(%rsi,%rax,4), %xmm1, %xmm1
	vmovss	-16(%rdi,%rax,4), %xmm2         # xmm2 = mem[0],zero,zero,zero
	vsubss	-16(%rsi,%rax,4), %xmm2, %xmm2
	vaddss	%xmm1, %xmm0, %xmm0
	vaddss	%xmm2, %xmm0, %xmm0
	vmovss	-12(%rdi,%rax,4), %xmm1         # xmm1 = mem[0],zero,zero,zero
	vsubss	-12(%rsi,%rax,4), %xmm1, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	vmovss	-8(%rdi,%rax,4), %xmm1          # xmm1 = mem[0],zero,zero,zero
	vsubss	-8(%rsi,%rax,4), %xmm1, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	vmovss	-4(%rdi,%rax,4), %xmm1          # xmm1 = mem[0],zero,zero,zero
	vsubss	-4(%rsi,%rax,4), %xmm1, %xmm1
	vmovss	(%rdi,%rax,4), %xmm2            # xmm2 = mem[0],zero,zero,zero
	vaddss	%xmm1, %xmm0, %xmm0
	vsubss	(%rsi,%rax,4), %xmm2, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	addq	$8, %rax
	cmpq	$102400007, %rax                # imm = 0x61A8007
	jne	.LBB5_1
# %bb.2:                                # %for.cond.cleanup
	retq
.Lfunc_end5:
	.size	check, .Lfunc_end5-check
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2                               # -- Begin function main
.LCPI6_0:
	.long	0x4d4ccccd                      # float 214748368
.LCPI6_2:
	.long	0x4048f5c3                      # float 3.1400001
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3
.LCPI6_1:
	.quad	0x40091eb860000000              # double 3.1400001049041748
.LCPI6_3:
	.quad	0x408f400000000000              # double 1000
.LCPI6_4:
	.quad	0x41cdcd6500000000              # double 1.0E+9
.LCPI6_5:
	.quad	0x43974876e8000000              # double 4.194304E+17
.LCPI6_6:
	.quad	0x4034000000000000              # double 20
.LCPI6_7:
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
	subq	$216, %rsp
	.cfi_def_cfa_offset 256
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
	xorl	%r12d, %r12d
	xorl	%edi, %edi
	callq	time
	movl	%eax, %edi
	callq	srand
	.p2align	4, 0x90
.LBB6_1:                                # %for.body.i
                                        # =>This Inner Loop Header: Depth=1
	callq	rand
	vcvtsi2ss	%eax, %xmm2, %xmm0
	vmovss	.LCPI6_0(%rip), %xmm1           # xmm1 = mem[0],zero,zero,zero
	vdivss	%xmm1, %xmm0, %xmm0
	vmovss	%xmm0, (%r14,%r12,4)
	callq	rand
	vcvtsi2ss	%eax, %xmm2, %xmm0
	vdivss	.LCPI6_0(%rip), %xmm0, %xmm0
	vmovss	%xmm0, (%r15,%r12,4)
	incq	%r12
	cmpq	$102400000, %r12                # imm = 0x61A8000
	jne	.LBB6_1
# %bb.2:                                # %for.body.preheader
	movl	$409600000, %edx                # imm = 0x186A0000
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
	movq	$-16, %rax
	vbroadcastss	.LCPI6_2(%rip), %zmm1   # zmm1 = [3.1400001E+0,3.1400001E+0,3.1400001E+0,3.1400001E+0,3.1400001E+0,3.1400001E+0,3.1400001E+0,3.1400001E+0,3.1400001E+0,3.1400001E+0,3.1400001E+0,3.1400001E+0,3.1400001E+0,3.1400001E+0,3.1400001E+0,3.1400001E+0]
	.p2align	4, 0x90
.LBB6_3:                                # %for.body.i118
                                        # =>This Inner Loop Header: Depth=1
	vmulps	64(%r14,%rax,4), %zmm1, %zmm0
	vaddps	64(%r15,%rax,4), %zmm0, %zmm0
	vmovups	%zmm0, 64(%r15,%rax,4)
	vmulps	128(%r14,%rax,4), %zmm1, %zmm0
	vaddps	128(%r15,%rax,4), %zmm0, %zmm0
	vmovups	%zmm0, 128(%r15,%rax,4)
	vmulps	192(%r14,%rax,4), %zmm1, %zmm0
	vaddps	192(%r15,%rax,4), %zmm0, %zmm0
	vmovups	%zmm0, 192(%r15,%rax,4)
	vmulps	256(%r14,%rax,4), %zmm1, %zmm0
	vaddps	256(%r15,%rax,4), %zmm0, %zmm0
	vmovups	%zmm0, 256(%r15,%rax,4)
	vmulps	320(%r14,%rax,4), %zmm1, %zmm0
	vaddps	320(%r15,%rax,4), %zmm0, %zmm0
	vmovups	%zmm0, 320(%r15,%rax,4)
	vmulps	384(%r14,%rax,4), %zmm1, %zmm0
	vaddps	384(%r15,%rax,4), %zmm0, %zmm0
	vmovups	%zmm0, 384(%r15,%rax,4)
	vmulps	448(%r14,%rax,4), %zmm1, %zmm0
	vaddps	448(%r15,%rax,4), %zmm0, %zmm0
	vmovups	%zmm0, 448(%r15,%rax,4)
	vmulps	512(%r14,%rax,4), %zmm1, %zmm0
	vaddps	512(%r15,%rax,4), %zmm0, %zmm0
	vmovups	%zmm0, 512(%r15,%rax,4)
	subq	$-128, %rax
	cmpq	$102399984, %rax                # imm = 0x61A7FF0
	jb	.LBB6_3
# %bb.4:                                # %vector.body.preheader
	vmovups	%zmm1, 64(%rsp)                 # 64-byte Spill
	movl	$56, %eax
	vbroadcastss	.LCPI6_2(%rip), %ymm4   # ymm4 = [3.1400001E+0,3.1400001E+0,3.1400001E+0,3.1400001E+0,3.1400001E+0,3.1400001E+0,3.1400001E+0,3.1400001E+0]
	.p2align	4, 0x90
.LBB6_5:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vmulps	-224(%r14,%rax,4), %ymm4, %ymm0
	vmulps	-192(%r14,%rax,4), %ymm4, %ymm1
	vmulps	-160(%r14,%rax,4), %ymm4, %ymm2
	vmulps	-128(%r14,%rax,4), %ymm4, %ymm3
	vaddps	-224(%rbx,%rax,4), %ymm0, %ymm0
	vaddps	-192(%rbx,%rax,4), %ymm1, %ymm1
	vaddps	-160(%rbx,%rax,4), %ymm2, %ymm2
	vaddps	-128(%rbx,%rax,4), %ymm3, %ymm3
	vmovups	%ymm0, -224(%rbx,%rax,4)
	vmovups	%ymm1, -192(%rbx,%rax,4)
	vmovups	%ymm2, -160(%rbx,%rax,4)
	vmovups	%ymm3, -128(%rbx,%rax,4)
	vmulps	-96(%r14,%rax,4), %ymm4, %ymm0
	vmulps	-64(%r14,%rax,4), %ymm4, %ymm1
	vmulps	-32(%r14,%rax,4), %ymm4, %ymm2
	vmulps	(%r14,%rax,4), %ymm4, %ymm3
	vaddps	-96(%rbx,%rax,4), %ymm0, %ymm0
	vaddps	-64(%rbx,%rax,4), %ymm1, %ymm1
	vaddps	-32(%rbx,%rax,4), %ymm2, %ymm2
	vaddps	(%rbx,%rax,4), %ymm3, %ymm3
	vmovups	%ymm0, -96(%rbx,%rax,4)
	vmovups	%ymm1, -64(%rbx,%rax,4)
	vmovups	%ymm2, -32(%rbx,%rax,4)
	vmovups	%ymm3, (%rbx,%rax,4)
	addq	$64, %rax
	cmpq	$102400056, %rax                # imm = 0x61A8038
	jne	.LBB6_5
# %bb.6:                                # %for.body.i151.preheader
	vmovups	%ymm4, 160(%rsp)                # 32-byte Spill
	xorl	%r12d, %r12d
	.p2align	4, 0x90
.LBB6_7:                                # %for.body.i151
                                        # =>This Inner Loop Header: Depth=1
	vzeroupper
	callq	rand
	vcvtsi2ss	%eax, %xmm5, %xmm0
	vmovss	.LCPI6_0(%rip), %xmm1           # xmm1 = mem[0],zero,zero,zero
	vdivss	%xmm1, %xmm0, %xmm0
	vmovss	%xmm0, (%r14,%r12,4)
	callq	rand
	vcvtsi2ss	%eax, %xmm5, %xmm0
	vdivss	.LCPI6_0(%rip), %xmm0, %xmm0
	vmovss	%xmm0, (%r15,%r12,4)
	incq	%r12
	cmpq	$102400000, %r12                # imm = 0x61A8000
	jne	.LBB6_7
# %bb.8:                                # %for.body15.preheader
	movl	$409600000, %edx                # imm = 0x186A0000
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	memcpy@PLT
	leaq	32(%rsp), %rdi
	callq	ftime
	movq	32(%rsp), %rax
	movzwl	40(%rsp), %ecx
	vcvtsi2sd	%ecx, %xmm5, %xmm0
	vdivsd	.LCPI6_3(%rip), %xmm0, %xmm0
	xorl	%ecx, %ecx
	vmovups	64(%rsp), %zmm2                 # 64-byte Reload
	.p2align	4, 0x90
.LBB6_9:                                # %for.body.i182.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_10 Depth 2
	movq	$-16, %rdx
	.p2align	4, 0x90
.LBB6_10:                               # %for.body.i182
                                        #   Parent Loop BB6_9 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vmulps	64(%r14,%rdx,4), %zmm2, %zmm1
	vaddps	64(%r15,%rdx,4), %zmm1, %zmm1
	vmovups	%zmm1, 64(%r15,%rdx,4)
	vmulps	128(%r14,%rdx,4), %zmm2, %zmm1
	vaddps	128(%r15,%rdx,4), %zmm1, %zmm1
	vmovups	%zmm1, 128(%r15,%rdx,4)
	vmulps	192(%r14,%rdx,4), %zmm2, %zmm1
	vaddps	192(%r15,%rdx,4), %zmm1, %zmm1
	vmovups	%zmm1, 192(%r15,%rdx,4)
	vmulps	256(%r14,%rdx,4), %zmm2, %zmm1
	vaddps	256(%r15,%rdx,4), %zmm1, %zmm1
	vmovups	%zmm1, 256(%r15,%rdx,4)
	vmulps	320(%r14,%rdx,4), %zmm2, %zmm1
	vaddps	320(%r15,%rdx,4), %zmm1, %zmm1
	vmovups	%zmm1, 320(%r15,%rdx,4)
	vmulps	384(%r14,%rdx,4), %zmm2, %zmm1
	vaddps	384(%r15,%rdx,4), %zmm1, %zmm1
	vmovups	%zmm1, 384(%r15,%rdx,4)
	vmulps	448(%r14,%rdx,4), %zmm2, %zmm1
	vaddps	448(%r15,%rdx,4), %zmm1, %zmm1
	vmovups	%zmm1, 448(%r15,%rdx,4)
	vmulps	512(%r14,%rdx,4), %zmm2, %zmm1
	vaddps	512(%r15,%rdx,4), %zmm1, %zmm1
	vmovups	%zmm1, 512(%r15,%rdx,4)
	subq	$-128, %rdx
	cmpq	$102399984, %rdx                # imm = 0x61A7FF0
	jb	.LBB6_10
# %bb.11:                               # %axpy.exit183
                                        #   in Loop: Header=BB6_9 Depth=1
	incl	%ecx
	cmpl	$20, %ecx
	jne	.LBB6_9
# %bb.12:                               # %for.cond.cleanup28
	vcvtsi2sd	%rax, %xmm5, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, 64(%rsp)                 # 8-byte Spill
	leaq	32(%rsp), %rdi
	vzeroupper
	callq	ftime
	vcvtsi2sdq	32(%rsp), %xmm5, %xmm0
	movzwl	40(%rsp), %eax
	vcvtsi2sd	%eax, %xmm5, %xmm1
	vdivsd	.LCPI6_3(%rip), %xmm1, %xmm1
	vaddsd	%xmm0, %xmm1, %xmm0
	vsubsd	64(%rsp), %xmm0, %xmm0          # 8-byte Folded Reload
	vmovsd	%xmm0, 64(%rsp)                 # 8-byte Spill
	leaq	32(%rsp), %rdi
	callq	ftime
	movq	32(%rsp), %rax
	movzwl	40(%rsp), %ecx
	vcvtsi2sd	%ecx, %xmm5, %xmm0
	vdivsd	.LCPI6_3(%rip), %xmm0, %xmm0
	xorl	%ecx, %ecx
	vmovups	160(%rsp), %ymm5                # 32-byte Reload
	.p2align	4, 0x90
.LBB6_13:                               # %vector.ph207
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_14 Depth 2
	movl	$56, %edx
	.p2align	4, 0x90
.LBB6_14:                               # %vector.body206
                                        #   Parent Loop BB6_13 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vmulps	-224(%r14,%rdx,4), %ymm5, %ymm1
	vmulps	-192(%r14,%rdx,4), %ymm5, %ymm2
	vmulps	-160(%r14,%rdx,4), %ymm5, %ymm3
	vmulps	-128(%r14,%rdx,4), %ymm5, %ymm4
	vaddps	-224(%rbx,%rdx,4), %ymm1, %ymm1
	vaddps	-192(%rbx,%rdx,4), %ymm2, %ymm2
	vaddps	-160(%rbx,%rdx,4), %ymm3, %ymm3
	vaddps	-128(%rbx,%rdx,4), %ymm4, %ymm4
	vmovups	%ymm1, -224(%rbx,%rdx,4)
	vmovups	%ymm2, -192(%rbx,%rdx,4)
	vmovups	%ymm3, -160(%rbx,%rdx,4)
	vmovups	%ymm4, -128(%rbx,%rdx,4)
	vmulps	-96(%r14,%rdx,4), %ymm5, %ymm1
	vmulps	-64(%r14,%rdx,4), %ymm5, %ymm2
	vmulps	-32(%r14,%rdx,4), %ymm5, %ymm3
	vmulps	(%r14,%rdx,4), %ymm5, %ymm4
	vaddps	-96(%rbx,%rdx,4), %ymm1, %ymm1
	vaddps	-64(%rbx,%rdx,4), %ymm2, %ymm2
	vaddps	-32(%rbx,%rdx,4), %ymm3, %ymm3
	vaddps	(%rbx,%rdx,4), %ymm4, %ymm4
	vmovups	%ymm1, -96(%rbx,%rdx,4)
	vmovups	%ymm2, -64(%rbx,%rdx,4)
	vmovups	%ymm3, -32(%rbx,%rdx,4)
	vmovups	%ymm4, (%rbx,%rdx,4)
	addq	$64, %rdx
	cmpq	$102400056, %rdx                # imm = 0x61A8038
	jne	.LBB6_14
# %bb.15:                               # %axpy_serial.exit132
                                        #   in Loop: Header=BB6_13 Depth=1
	incl	%ecx
	cmpl	$20, %ecx
	jne	.LBB6_13
# %bb.16:                               # %for.cond.cleanup39
	vxorpd	%xmm1, %xmm1, %xmm1
	vaddsd	64(%rsp), %xmm1, %xmm1          # 8-byte Folded Reload
	vmovsd	%xmm1, 160(%rsp)                # 8-byte Spill
	vcvtsi2sd	%rax, %xmm6, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, 64(%rsp)                 # 8-byte Spill
	leaq	32(%rsp), %rdi
	vzeroupper
	callq	ftime
	vcvtsi2sdq	32(%rsp), %xmm6, %xmm0
	movzwl	40(%rsp), %eax
	vcvtsi2sd	%eax, %xmm6, %xmm1
	vdivsd	.LCPI6_3(%rip), %xmm1, %xmm1
	vaddsd	%xmm0, %xmm1, %xmm0
	vsubsd	64(%rsp), %xmm0, %xmm0          # 8-byte Folded Reload
	vaddsd	.LCPI6_7, %xmm0, %xmm0
	vmovsd	%xmm0, 64(%rsp)                 # 8-byte Spill
	movq	%r15, %rdi
	callq	print_vector
	movl	$.L.str.5, %edi
	callq	puts
	movq	%rbx, %rdi
	callq	print_vector
	vmovsd	.LCPI6_4(%rip), %xmm0           # xmm0 = mem[0],zero
	vmulsd	160(%rsp), %xmm0, %xmm1         # 8-byte Folded Reload
	vmovsd	.LCPI6_5(%rip), %xmm2           # xmm2 = mem[0],zero
	vdivsd	%xmm1, %xmm2, %xmm1
	vmovsd	%xmm1, 48(%rsp)                 # 8-byte Spill
	vmulsd	64(%rsp), %xmm0, %xmm0          # 8-byte Folded Reload
	vdivsd	%xmm0, %xmm2, %xmm0
	vmovsd	%xmm0, 56(%rsp)                 # 8-byte Spill
	movl	$.Lstr, %edi
	callq	puts
	movl	$.Lstr.12, %edi
	callq	puts
	movl	$.Lstr.13, %edi
	callq	puts
	vmovsd	160(%rsp), %xmm0                # 8-byte Reload
                                        # xmm0 = mem[0],zero
	vdivsd	.LCPI6_6(%rip), %xmm0, %xmm0
	movl	$.L.str.9, %edi
	vmovsd	48(%rsp), %xmm1                 # 8-byte Reload
                                        # xmm1 = mem[0],zero
	movb	$2, %al
	callq	printf
	vmovsd	64(%rsp), %xmm0                 # 8-byte Reload
                                        # xmm0 = mem[0],zero
	vdivsd	.LCPI6_6(%rip), %xmm0, %xmm0
	movl	$.L.str.10, %edi
	vmovsd	56(%rsp), %xmm1                 # 8-byte Reload
                                        # xmm1 = mem[0],zero
	movb	$2, %al
	callq	printf
	vxorpd	%xmm0, %xmm0, %xmm0
	movl	$7, %eax
	.p2align	4, 0x90
.LBB6_17:                               # %for.body.i139
                                        # =>This Inner Loop Header: Depth=1
	vmovss	-28(%r15,%rax,4), %xmm1         # xmm1 = mem[0],zero,zero,zero
	vmovss	-24(%r15,%rax,4), %xmm2         # xmm2 = mem[0],zero,zero,zero
	vsubss	-28(%rbx,%rax,4), %xmm1, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	vsubss	-24(%rbx,%rax,4), %xmm2, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	vmovss	-20(%r15,%rax,4), %xmm1         # xmm1 = mem[0],zero,zero,zero
	vsubss	-20(%rbx,%rax,4), %xmm1, %xmm1
	vmovss	-16(%r15,%rax,4), %xmm2         # xmm2 = mem[0],zero,zero,zero
	vsubss	-16(%rbx,%rax,4), %xmm2, %xmm2
	vaddss	%xmm1, %xmm0, %xmm0
	vaddss	%xmm2, %xmm0, %xmm0
	vmovss	-12(%r15,%rax,4), %xmm1         # xmm1 = mem[0],zero,zero,zero
	vsubss	-12(%rbx,%rax,4), %xmm1, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	vmovss	-8(%r15,%rax,4), %xmm1          # xmm1 = mem[0],zero,zero,zero
	vsubss	-8(%rbx,%rax,4), %xmm1, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	vmovss	-4(%r15,%rax,4), %xmm1          # xmm1 = mem[0],zero,zero,zero
	vsubss	-4(%rbx,%rax,4), %xmm1, %xmm1
	vmovss	(%r15,%rax,4), %xmm2            # xmm2 = mem[0],zero,zero,zero
	vaddss	%xmm1, %xmm0, %xmm0
	vsubss	(%rbx,%rax,4), %xmm2, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	addq	$8, %rax
	cmpq	$102400007, %rax                # imm = 0x61A8007
	jne	.LBB6_17
# %bb.18:                               # %check.exit
	vcvtss2sd	%xmm0, %xmm0, %xmm0
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
	addq	$216, %rsp
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
