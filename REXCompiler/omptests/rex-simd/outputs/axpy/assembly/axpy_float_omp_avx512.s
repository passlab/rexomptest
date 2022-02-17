	.text
	.file	"axpy_float.c"
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
	movq	$-409600000, %rbx               # imm = 0xE7960000
	.p2align	4, 0x90
.LBB1_1:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	callq	rand
	vcvtsi2ss	%eax, %xmm2, %xmm0
	vmovss	.LCPI1_0(%rip), %xmm1           # xmm1 = mem[0],zero,zero,zero
	vdivss	%xmm1, %xmm0, %xmm0
	vmovss	%xmm0, 409600000(%r15,%rbx)
	callq	rand
	vcvtsi2ss	%eax, %xmm2, %xmm0
	vdivss	.LCPI1_0(%rip), %xmm0, %xmm0
	vmovss	%xmm0, 409600000(%r14,%rbx)
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
	vbroadcastss	%xmm0, %zmm0
	movq	$-102400000, %rax               # imm = 0xF9E58000
	.p2align	4, 0x90
.LBB2_1:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vmulps	409600000(%rdi,%rax,4), %zmm0, %zmm1
	vmulps	409600064(%rdi,%rax,4), %zmm0, %zmm2
	vmulps	409600128(%rdi,%rax,4), %zmm0, %zmm3
	vmulps	409600192(%rdi,%rax,4), %zmm0, %zmm4
	vaddps	409600000(%rsi,%rax,4), %zmm1, %zmm1
	vaddps	409600064(%rsi,%rax,4), %zmm2, %zmm2
	vaddps	409600128(%rsi,%rax,4), %zmm3, %zmm3
	vaddps	409600192(%rsi,%rax,4), %zmm4, %zmm4
	vmovups	%zmm1, 409600000(%rsi,%rax,4)
	vmovups	%zmm2, 409600064(%rsi,%rax,4)
	vmovups	%zmm3, 409600128(%rsi,%rax,4)
	vmovups	%zmm4, 409600192(%rsi,%rax,4)
	vmulps	409600256(%rdi,%rax,4), %zmm0, %zmm1
	vmulps	409600320(%rdi,%rax,4), %zmm0, %zmm2
	vmulps	409600384(%rdi,%rax,4), %zmm0, %zmm3
	vmulps	409600448(%rdi,%rax,4), %zmm0, %zmm4
	vaddps	409600256(%rsi,%rax,4), %zmm1, %zmm1
	vaddps	409600320(%rsi,%rax,4), %zmm2, %zmm2
	vaddps	409600384(%rsi,%rax,4), %zmm3, %zmm3
	vaddps	409600448(%rsi,%rax,4), %zmm4, %zmm4
	vmovups	%zmm1, 409600256(%rsi,%rax,4)
	vmovups	%zmm2, 409600320(%rsi,%rax,4)
	vmovups	%zmm3, 409600384(%rsi,%rax,4)
	vmovups	%zmm4, 409600448(%rsi,%rax,4)
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
	vmulss	409600000(%rdi,%rax), %xmm0, %xmm1
	vaddss	409600000(%rsi,%rax), %xmm1, %xmm1
	vmovss	%xmm1, 409600000(%rsi,%rax)
	vmulss	409600004(%rdi,%rax), %xmm0, %xmm1
	vaddss	409600004(%rsi,%rax), %xmm1, %xmm1
	vmovss	%xmm1, 409600004(%rsi,%rax)
	vmulss	409600008(%rdi,%rax), %xmm0, %xmm1
	vaddss	409600008(%rsi,%rax), %xmm1, %xmm1
	vmovss	%xmm1, 409600008(%rsi,%rax)
	vmulss	409600012(%rdi,%rax), %xmm0, %xmm1
	vaddss	409600012(%rsi,%rax), %xmm1, %xmm1
	vmovss	%xmm1, 409600012(%rsi,%rax)
	vmulss	409600016(%rdi,%rax), %xmm0, %xmm1
	vaddss	409600016(%rsi,%rax), %xmm1, %xmm1
	vmovss	%xmm1, 409600016(%rsi,%rax)
	addq	$20, %rax
	jne	.LBB3_3
	jmp	.LBB3_6
.LBB3_4:                                # %vector.ph
	vbroadcastss	%xmm0, %zmm0
	movq	$-102400000, %rax               # imm = 0xF9E58000
	.p2align	4, 0x90
.LBB3_5:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vmulps	409600000(%rdi,%rax,4), %zmm0, %zmm1
	vmulps	409600064(%rdi,%rax,4), %zmm0, %zmm2
	vmulps	409600128(%rdi,%rax,4), %zmm0, %zmm3
	vmulps	409600192(%rdi,%rax,4), %zmm0, %zmm4
	vaddps	409600000(%rsi,%rax,4), %zmm1, %zmm1
	vaddps	409600064(%rsi,%rax,4), %zmm2, %zmm2
	vaddps	409600128(%rsi,%rax,4), %zmm3, %zmm3
	vaddps	409600192(%rsi,%rax,4), %zmm4, %zmm4
	vmovups	%zmm1, 409600000(%rsi,%rax,4)
	vmovups	%zmm2, 409600064(%rsi,%rax,4)
	vmovups	%zmm3, 409600128(%rsi,%rax,4)
	vmovups	%zmm4, 409600192(%rsi,%rax,4)
	vmulps	409600256(%rdi,%rax,4), %zmm0, %zmm1
	vmulps	409600320(%rdi,%rax,4), %zmm0, %zmm2
	vmulps	409600384(%rdi,%rax,4), %zmm0, %zmm3
	vmulps	409600448(%rdi,%rax,4), %zmm0, %zmm4
	vaddps	409600256(%rsi,%rax,4), %zmm1, %zmm1
	vaddps	409600320(%rsi,%rax,4), %zmm2, %zmm2
	vaddps	409600384(%rsi,%rax,4), %zmm3, %zmm3
	vaddps	409600448(%rsi,%rax,4), %zmm4, %zmm4
	vmovups	%zmm1, 409600256(%rsi,%rax,4)
	vmovups	%zmm2, 409600320(%rsi,%rax,4)
	vmovups	%zmm3, 409600384(%rsi,%rax,4)
	vmovups	%zmm4, 409600448(%rsi,%rax,4)
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
	movq	$-102400000, %rax               # imm = 0xF9E58000
	.p2align	4, 0x90
.LBB5_1:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	vmovss	409600000(%rdi,%rax,4), %xmm1   # xmm1 = mem[0],zero,zero,zero
	vmovss	409600004(%rdi,%rax,4), %xmm2   # xmm2 = mem[0],zero,zero,zero
	vsubss	409600000(%rsi,%rax,4), %xmm1, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	vsubss	409600004(%rsi,%rax,4), %xmm2, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	vmovss	409600008(%rdi,%rax,4), %xmm1   # xmm1 = mem[0],zero,zero,zero
	vsubss	409600008(%rsi,%rax,4), %xmm1, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	vmovss	409600012(%rdi,%rax,4), %xmm1   # xmm1 = mem[0],zero,zero,zero
	vsubss	409600012(%rsi,%rax,4), %xmm1, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	vmovss	409600016(%rdi,%rax,4), %xmm1   # xmm1 = mem[0],zero,zero,zero
	vsubss	409600016(%rsi,%rax,4), %xmm1, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	vmovss	409600020(%rdi,%rax,4), %xmm1   # xmm1 = mem[0],zero,zero,zero
	vsubss	409600020(%rsi,%rax,4), %xmm1, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	vmovss	409600024(%rdi,%rax,4), %xmm1   # xmm1 = mem[0],zero,zero,zero
	vsubss	409600024(%rsi,%rax,4), %xmm1, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	vmovss	409600028(%rdi,%rax,4), %xmm1   # xmm1 = mem[0],zero,zero,zero
	vsubss	409600028(%rsi,%rax,4), %xmm1, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	addq	$8, %rax
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
	vcvtsi2ss	%eax, %xmm2, %xmm0
	vmovss	.LCPI6_0(%rip), %xmm1           # xmm1 = mem[0],zero,zero,zero
	vdivss	%xmm1, %xmm0, %xmm0
	vmovss	%xmm0, 409600000(%r14,%r12)
	callq	rand
	vcvtsi2ss	%eax, %xmm2, %xmm0
	vdivss	.LCPI6_0(%rip), %xmm0, %xmm0
	vmovss	%xmm0, 409600000(%r15,%r12)
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
	vmovsd	.LCPI6_1(%rip), %xmm0           # xmm0 = mem[0],zero
	movl	$.L.str.3, %edi
	movb	$1, %al
	callq	printf
	movl	$.L.str.4, %edi
	callq	puts
	movq	$-409600000, %rax               # imm = 0xE7960000
	vbroadcastss	.LCPI6_2(%rip), %zmm4   # zmm4 = [3.1400001E+0,3.1400001E+0,3.1400001E+0,3.1400001E+0,3.1400001E+0,3.1400001E+0,3.1400001E+0,3.1400001E+0,3.1400001E+0,3.1400001E+0,3.1400001E+0,3.1400001E+0,3.1400001E+0,3.1400001E+0,3.1400001E+0,3.1400001E+0]
	.p2align	4, 0x90
.LBB6_3:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vmulps	409600000(%r14,%rax), %zmm4, %zmm0
	vmulps	409600064(%r14,%rax), %zmm4, %zmm1
	vmulps	409600128(%r14,%rax), %zmm4, %zmm2
	vmulps	409600192(%r14,%rax), %zmm4, %zmm3
	vaddps	409600000(%r15,%rax), %zmm0, %zmm0
	vaddps	409600064(%r15,%rax), %zmm1, %zmm1
	vaddps	409600128(%r15,%rax), %zmm2, %zmm2
	vaddps	409600192(%r15,%rax), %zmm3, %zmm3
	vmovups	%zmm0, 409600000(%r15,%rax)
	vmovups	%zmm1, 409600064(%r15,%rax)
	vmovups	%zmm2, 409600128(%r15,%rax)
	vmovups	%zmm3, 409600192(%r15,%rax)
	vmulps	409600256(%r14,%rax), %zmm4, %zmm0
	vmulps	409600320(%r14,%rax), %zmm4, %zmm1
	vmulps	409600384(%r14,%rax), %zmm4, %zmm2
	vmulps	409600448(%r14,%rax), %zmm4, %zmm3
	vaddps	409600256(%r15,%rax), %zmm0, %zmm0
	vaddps	409600320(%r15,%rax), %zmm1, %zmm1
	vaddps	409600384(%r15,%rax), %zmm2, %zmm2
	vaddps	409600448(%r15,%rax), %zmm3, %zmm3
	vmovups	%zmm0, 409600256(%r15,%rax)
	vmovups	%zmm1, 409600320(%r15,%rax)
	vmovups	%zmm2, 409600384(%r15,%rax)
	vmovups	%zmm3, 409600448(%r15,%rax)
	addq	$512, %rax                      # imm = 0x200
	jne	.LBB6_3
# %bb.4:                                # %vector.body207.preheader
	movq	$-409600000, %rax               # imm = 0xE7960000
	.p2align	4, 0x90
.LBB6_5:                                # %vector.body207
                                        # =>This Inner Loop Header: Depth=1
	vmulps	409600000(%r14,%rax), %zmm4, %zmm0
	vmulps	409600064(%r14,%rax), %zmm4, %zmm1
	vmulps	409600128(%r14,%rax), %zmm4, %zmm2
	vmulps	409600192(%r14,%rax), %zmm4, %zmm3
	vaddps	409600000(%rbx,%rax), %zmm0, %zmm0
	vaddps	409600064(%rbx,%rax), %zmm1, %zmm1
	vaddps	409600128(%rbx,%rax), %zmm2, %zmm2
	vaddps	409600192(%rbx,%rax), %zmm3, %zmm3
	vmovups	%zmm0, 409600000(%rbx,%rax)
	vmovups	%zmm1, 409600064(%rbx,%rax)
	vmovups	%zmm2, 409600128(%rbx,%rax)
	vmovups	%zmm3, 409600192(%rbx,%rax)
	vmulps	409600256(%r14,%rax), %zmm4, %zmm0
	vmulps	409600320(%r14,%rax), %zmm4, %zmm1
	vmulps	409600384(%r14,%rax), %zmm4, %zmm2
	vmulps	409600448(%r14,%rax), %zmm4, %zmm3
	vaddps	409600256(%rbx,%rax), %zmm0, %zmm0
	vaddps	409600320(%rbx,%rax), %zmm1, %zmm1
	vaddps	409600384(%rbx,%rax), %zmm2, %zmm2
	vaddps	409600448(%rbx,%rax), %zmm3, %zmm3
	vmovups	%zmm0, 409600256(%rbx,%rax)
	vmovups	%zmm1, 409600320(%rbx,%rax)
	vmovups	%zmm2, 409600384(%rbx,%rax)
	vmovups	%zmm3, 409600448(%rbx,%rax)
	addq	$512, %rax                      # imm = 0x200
	jne	.LBB6_5
# %bb.6:                                # %for.body.i150.preheader
	vmovups	%zmm4, 64(%rsp)                 # 64-byte Spill
	movq	$-409600000, %r12               # imm = 0xE7960000
	.p2align	4, 0x90
.LBB6_7:                                # %for.body.i150
                                        # =>This Inner Loop Header: Depth=1
	callq	rand
	vcvtsi2ss	%eax, %xmm5, %xmm0
	vmovss	.LCPI6_0(%rip), %xmm1           # xmm1 = mem[0],zero,zero,zero
	vdivss	%xmm1, %xmm0, %xmm0
	vmovss	%xmm0, 409600000(%r14,%r12)
	callq	rand
	vcvtsi2ss	%eax, %xmm5, %xmm0
	vdivss	.LCPI6_0(%rip), %xmm0, %xmm0
	vmovss	%xmm0, 409600000(%r15,%r12)
	addq	$4, %r12
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
	vmovups	64(%rsp), %zmm5                 # 64-byte Reload
	.p2align	4, 0x90
.LBB6_9:                                # %vector.ph240
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_10 Depth 2
	movq	$-409600000, %rdx               # imm = 0xE7960000
	.p2align	4, 0x90
.LBB6_10:                               # %vector.body236
                                        #   Parent Loop BB6_9 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vmulps	409600000(%r14,%rdx), %zmm5, %zmm1
	vmulps	409600064(%r14,%rdx), %zmm5, %zmm2
	vmulps	409600128(%r14,%rdx), %zmm5, %zmm3
	vmulps	409600192(%r14,%rdx), %zmm5, %zmm4
	vaddps	409600000(%r15,%rdx), %zmm1, %zmm1
	vaddps	409600064(%r15,%rdx), %zmm2, %zmm2
	vaddps	409600128(%r15,%rdx), %zmm3, %zmm3
	vaddps	409600192(%r15,%rdx), %zmm4, %zmm4
	vmovups	%zmm1, 409600000(%r15,%rdx)
	vmovups	%zmm2, 409600064(%r15,%rdx)
	vmovups	%zmm3, 409600128(%r15,%rdx)
	vmovups	%zmm4, 409600192(%r15,%rdx)
	vmulps	409600256(%r14,%rdx), %zmm5, %zmm1
	vmulps	409600320(%r14,%rdx), %zmm5, %zmm2
	vmulps	409600384(%r14,%rdx), %zmm5, %zmm3
	vmulps	409600448(%r14,%rdx), %zmm5, %zmm4
	vaddps	409600256(%r15,%rdx), %zmm1, %zmm1
	vaddps	409600320(%r15,%rdx), %zmm2, %zmm2
	vaddps	409600384(%r15,%rdx), %zmm3, %zmm3
	vaddps	409600448(%r15,%rdx), %zmm4, %zmm4
	vmovups	%zmm1, 409600256(%r15,%rdx)
	vmovups	%zmm2, 409600320(%r15,%rdx)
	vmovups	%zmm3, 409600384(%r15,%rdx)
	vmovups	%zmm4, 409600448(%r15,%rdx)
	addq	$512, %rdx                      # imm = 0x200
	jne	.LBB6_10
# %bb.11:                               # %axpy.exit180
                                        #   in Loop: Header=BB6_9 Depth=1
	addl	$1, %ecx
	cmpl	$20, %ecx
	jne	.LBB6_9
# %bb.12:                               # %for.cond.cleanup28
	vcvtsi2sd	%rax, %xmm6, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, 24(%rsp)                 # 8-byte Spill
	leaq	32(%rsp), %rdi
	callq	ftime
	vcvtsi2sdq	32(%rsp), %xmm6, %xmm0
	movzwl	40(%rsp), %eax
	vcvtsi2sd	%eax, %xmm6, %xmm1
	vdivsd	.LCPI6_3(%rip), %xmm1, %xmm1
	vaddsd	%xmm0, %xmm1, %xmm0
	vsubsd	24(%rsp), %xmm0, %xmm0          # 8-byte Folded Reload
	vmovsd	%xmm0, 24(%rsp)                 # 8-byte Spill
	leaq	32(%rsp), %rdi
	callq	ftime
	vmovups	64(%rsp), %zmm5                 # 64-byte Reload
	movq	32(%rsp), %rax
	movzwl	40(%rsp), %ecx
	vcvtsi2sd	%ecx, %xmm6, %xmm0
	vdivsd	.LCPI6_3(%rip), %xmm0, %xmm0
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB6_13:                               # %vector.ph269
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_14 Depth 2
	movq	$-409600000, %rdx               # imm = 0xE7960000
	.p2align	4, 0x90
.LBB6_14:                               # %vector.body265
                                        #   Parent Loop BB6_13 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vmulps	409600000(%r14,%rdx), %zmm5, %zmm1
	vmulps	409600064(%r14,%rdx), %zmm5, %zmm2
	vmulps	409600128(%r14,%rdx), %zmm5, %zmm3
	vmulps	409600192(%r14,%rdx), %zmm5, %zmm4
	vaddps	409600000(%rbx,%rdx), %zmm1, %zmm1
	vaddps	409600064(%rbx,%rdx), %zmm2, %zmm2
	vaddps	409600128(%rbx,%rdx), %zmm3, %zmm3
	vaddps	409600192(%rbx,%rdx), %zmm4, %zmm4
	vmovups	%zmm1, 409600000(%rbx,%rdx)
	vmovups	%zmm2, 409600064(%rbx,%rdx)
	vmovups	%zmm3, 409600128(%rbx,%rdx)
	vmovups	%zmm4, 409600192(%rbx,%rdx)
	vmulps	409600256(%r14,%rdx), %zmm5, %zmm1
	vmulps	409600320(%r14,%rdx), %zmm5, %zmm2
	vmulps	409600384(%r14,%rdx), %zmm5, %zmm3
	vmulps	409600448(%r14,%rdx), %zmm5, %zmm4
	vaddps	409600256(%rbx,%rdx), %zmm1, %zmm1
	vaddps	409600320(%rbx,%rdx), %zmm2, %zmm2
	vaddps	409600384(%rbx,%rdx), %zmm3, %zmm3
	vaddps	409600448(%rbx,%rdx), %zmm4, %zmm4
	vmovups	%zmm1, 409600256(%rbx,%rdx)
	vmovups	%zmm2, 409600320(%rbx,%rdx)
	vmovups	%zmm3, 409600384(%rbx,%rdx)
	vmovups	%zmm4, 409600448(%rbx,%rdx)
	addq	$512, %rdx                      # imm = 0x200
	jne	.LBB6_14
# %bb.15:                               # %axpy_serial.exit131
                                        #   in Loop: Header=BB6_13 Depth=1
	addl	$1, %ecx
	cmpl	$20, %ecx
	jne	.LBB6_13
# %bb.16:                               # %for.cond.cleanup39
	vxorpd	%xmm1, %xmm1, %xmm1
	vaddsd	24(%rsp), %xmm1, %xmm1          # 8-byte Folded Reload
	vmovsd	%xmm1, 64(%rsp)                 # 8-byte Spill
	vcvtsi2sd	%rax, %xmm6, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, 24(%rsp)                 # 8-byte Spill
	leaq	32(%rsp), %rdi
	callq	ftime
	vcvtsi2sdq	32(%rsp), %xmm6, %xmm0
	movzwl	40(%rsp), %eax
	vcvtsi2sd	%eax, %xmm6, %xmm1
	vdivsd	.LCPI6_3(%rip), %xmm1, %xmm1
	vaddsd	%xmm0, %xmm1, %xmm0
	vsubsd	24(%rsp), %xmm0, %xmm0          # 8-byte Folded Reload
	vaddsd	.LCPI6_7, %xmm0, %xmm0
	vmovsd	%xmm0, 24(%rsp)                 # 8-byte Spill
	movq	%r15, %rdi
	callq	print_vector
	movl	$.L.str.5, %edi
	callq	puts
	movq	%rbx, %rdi
	callq	print_vector
	vmovsd	.LCPI6_4(%rip), %xmm0           # xmm0 = mem[0],zero
	vmulsd	64(%rsp), %xmm0, %xmm1          # 8-byte Folded Reload
	vmovsd	.LCPI6_5(%rip), %xmm2           # xmm2 = mem[0],zero
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
	vdivsd	.LCPI6_6(%rip), %xmm0, %xmm0
	movl	$.L.str.9, %edi
	vmovsd	48(%rsp), %xmm1                 # 8-byte Reload
                                        # xmm1 = mem[0],zero
	movb	$2, %al
	callq	printf
	vmovsd	24(%rsp), %xmm0                 # 8-byte Reload
                                        # xmm0 = mem[0],zero
	vdivsd	.LCPI6_6(%rip), %xmm0, %xmm0
	movl	$.L.str.10, %edi
	vmovsd	56(%rsp), %xmm1                 # 8-byte Reload
                                        # xmm1 = mem[0],zero
	movb	$2, %al
	callq	printf
	vxorpd	%xmm0, %xmm0, %xmm0
	movq	$-409600000, %rax               # imm = 0xE7960000
	.p2align	4, 0x90
.LBB6_17:                               # %for.body.i138
                                        # =>This Inner Loop Header: Depth=1
	vmovss	409600000(%r15,%rax), %xmm1     # xmm1 = mem[0],zero,zero,zero
	vmovss	409600004(%r15,%rax), %xmm2     # xmm2 = mem[0],zero,zero,zero
	vsubss	409600000(%rbx,%rax), %xmm1, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	vsubss	409600004(%rbx,%rax), %xmm2, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	vmovss	409600008(%r15,%rax), %xmm1     # xmm1 = mem[0],zero,zero,zero
	vsubss	409600008(%rbx,%rax), %xmm1, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	vmovss	409600012(%r15,%rax), %xmm1     # xmm1 = mem[0],zero,zero,zero
	vsubss	409600012(%rbx,%rax), %xmm1, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	vmovss	409600016(%r15,%rax), %xmm1     # xmm1 = mem[0],zero,zero,zero
	vsubss	409600016(%rbx,%rax), %xmm1, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	vmovss	409600020(%r15,%rax), %xmm1     # xmm1 = mem[0],zero,zero,zero
	vsubss	409600020(%rbx,%rax), %xmm1, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	vmovss	409600024(%r15,%rax), %xmm1     # xmm1 = mem[0],zero,zero,zero
	vsubss	409600024(%rbx,%rax), %xmm1, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	vmovss	409600028(%r15,%rax), %xmm1     # xmm1 = mem[0],zero,zero,zero
	vsubss	409600028(%rbx,%rax), %xmm1, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	addq	$32, %rax
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
