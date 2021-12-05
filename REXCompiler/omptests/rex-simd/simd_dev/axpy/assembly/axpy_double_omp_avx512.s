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
	movq	$-819200000, %rbx               # imm = 0xCF2C0000
	.p2align	4, 0x90
.LBB1_1:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	callq	rand
	vcvtsi2sd	%eax, %xmm2, %xmm0
	vmovsd	.LCPI1_0(%rip), %xmm1           # xmm1 = mem[0],zero
	vdivsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, 819200000(%r15,%rbx)
	callq	rand
	vcvtsi2sd	%eax, %xmm2, %xmm0
	vdivsd	.LCPI1_0(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, 819200000(%r14,%rbx)
	addq	$8, %rbx
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
	vbroadcastsd	%xmm0, %zmm0
	movq	$-102400000, %rax               # imm = 0xF9E58000
	.p2align	4, 0x90
.LBB2_1:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vmulpd	819200000(%rdi,%rax,8), %zmm0, %zmm1
	vmulpd	819200064(%rdi,%rax,8), %zmm0, %zmm2
	vmulpd	819200128(%rdi,%rax,8), %zmm0, %zmm3
	vmulpd	819200192(%rdi,%rax,8), %zmm0, %zmm4
	vaddpd	819200000(%rsi,%rax,8), %zmm1, %zmm1
	vaddpd	819200064(%rsi,%rax,8), %zmm2, %zmm2
	vaddpd	819200128(%rsi,%rax,8), %zmm3, %zmm3
	vaddpd	819200192(%rsi,%rax,8), %zmm4, %zmm4
	vmovupd	%zmm1, 819200000(%rsi,%rax,8)
	vmovupd	%zmm2, 819200064(%rsi,%rax,8)
	vmovupd	%zmm3, 819200128(%rsi,%rax,8)
	vmovupd	%zmm4, 819200192(%rsi,%rax,8)
	vmulpd	819200256(%rdi,%rax,8), %zmm0, %zmm1
	vmulpd	819200320(%rdi,%rax,8), %zmm0, %zmm2
	vmulpd	819200384(%rdi,%rax,8), %zmm0, %zmm3
	vmulpd	819200448(%rdi,%rax,8), %zmm0, %zmm4
	vaddpd	819200256(%rsi,%rax,8), %zmm1, %zmm1
	vaddpd	819200320(%rsi,%rax,8), %zmm2, %zmm2
	vaddpd	819200384(%rsi,%rax,8), %zmm3, %zmm3
	vaddpd	819200448(%rsi,%rax,8), %zmm4, %zmm4
	vmovupd	%zmm1, 819200256(%rsi,%rax,8)
	vmovupd	%zmm2, 819200320(%rsi,%rax,8)
	vmovupd	%zmm3, 819200384(%rsi,%rax,8)
	vmovupd	%zmm4, 819200448(%rsi,%rax,8)
	addq	$64, %rax
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
# %bb.0:                                # %entry
	leaq	819200000(%rdi), %rax
	cmpq	%rsi, %rax
	jbe	.LBB3_4
# %bb.1:                                # %entry
	leaq	819200000(%rsi), %rax
	cmpq	%rdi, %rax
	jbe	.LBB3_4
# %bb.2:                                # %for.body.preheader
	movq	$-819200000, %rax               # imm = 0xCF2C0000
	.p2align	4, 0x90
.LBB3_3:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	vmulsd	819200000(%rdi,%rax), %xmm0, %xmm1
	vaddsd	819200000(%rsi,%rax), %xmm1, %xmm1
	vmovsd	%xmm1, 819200000(%rsi,%rax)
	vmulsd	819200008(%rdi,%rax), %xmm0, %xmm1
	vaddsd	819200008(%rsi,%rax), %xmm1, %xmm1
	vmovsd	%xmm1, 819200008(%rsi,%rax)
	vmulsd	819200016(%rdi,%rax), %xmm0, %xmm1
	vaddsd	819200016(%rsi,%rax), %xmm1, %xmm1
	vmovsd	%xmm1, 819200016(%rsi,%rax)
	vmulsd	819200024(%rdi,%rax), %xmm0, %xmm1
	vaddsd	819200024(%rsi,%rax), %xmm1, %xmm1
	vmovsd	%xmm1, 819200024(%rsi,%rax)
	vmulsd	819200032(%rdi,%rax), %xmm0, %xmm1
	vaddsd	819200032(%rsi,%rax), %xmm1, %xmm1
	vmovsd	%xmm1, 819200032(%rsi,%rax)
	addq	$40, %rax
	jne	.LBB3_3
	jmp	.LBB3_6
.LBB3_4:                                # %vector.ph
	vbroadcastsd	%xmm0, %zmm0
	movq	$-102400000, %rax               # imm = 0xF9E58000
	.p2align	4, 0x90
.LBB3_5:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vmulpd	819200000(%rdi,%rax,8), %zmm0, %zmm1
	vmulpd	819200064(%rdi,%rax,8), %zmm0, %zmm2
	vmulpd	819200128(%rdi,%rax,8), %zmm0, %zmm3
	vmulpd	819200192(%rdi,%rax,8), %zmm0, %zmm4
	vaddpd	819200000(%rsi,%rax,8), %zmm1, %zmm1
	vaddpd	819200064(%rsi,%rax,8), %zmm2, %zmm2
	vaddpd	819200128(%rsi,%rax,8), %zmm3, %zmm3
	vaddpd	819200192(%rsi,%rax,8), %zmm4, %zmm4
	vmovupd	%zmm1, 819200000(%rsi,%rax,8)
	vmovupd	%zmm2, 819200064(%rsi,%rax,8)
	vmovupd	%zmm3, 819200128(%rsi,%rax,8)
	vmovupd	%zmm4, 819200192(%rsi,%rax,8)
	vmulpd	819200256(%rdi,%rax,8), %zmm0, %zmm1
	vmulpd	819200320(%rdi,%rax,8), %zmm0, %zmm2
	vmulpd	819200384(%rdi,%rax,8), %zmm0, %zmm3
	vmulpd	819200448(%rdi,%rax,8), %zmm0, %zmm4
	vaddpd	819200256(%rsi,%rax,8), %zmm1, %zmm1
	vaddpd	819200320(%rsi,%rax,8), %zmm2, %zmm2
	vaddpd	819200384(%rsi,%rax,8), %zmm3, %zmm3
	vaddpd	819200448(%rsi,%rax,8), %zmm4, %zmm4
	vmovupd	%zmm1, 819200256(%rsi,%rax,8)
	vmovupd	%zmm2, 819200320(%rsi,%rax,8)
	vmovupd	%zmm3, 819200384(%rsi,%rax,8)
	vmovupd	%zmm4, 819200448(%rsi,%rax,8)
	addq	$64, %rax
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
	movq	$-102400000, %rax               # imm = 0xF9E58000
	.p2align	4, 0x90
.LBB5_1:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	vmovsd	819200000(%rdi,%rax,8), %xmm1   # xmm1 = mem[0],zero
	vmovsd	819200008(%rdi,%rax,8), %xmm2   # xmm2 = mem[0],zero
	vsubsd	819200000(%rsi,%rax,8), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vsubsd	819200008(%rsi,%rax,8), %xmm2, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	819200016(%rdi,%rax,8), %xmm1   # xmm1 = mem[0],zero
	vsubsd	819200016(%rsi,%rax,8), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	819200024(%rdi,%rax,8), %xmm1   # xmm1 = mem[0],zero
	vsubsd	819200024(%rsi,%rax,8), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	819200032(%rdi,%rax,8), %xmm1   # xmm1 = mem[0],zero
	vsubsd	819200032(%rsi,%rax,8), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	819200040(%rdi,%rax,8), %xmm1   # xmm1 = mem[0],zero
	vsubsd	819200040(%rsi,%rax,8), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	819200048(%rdi,%rax,8), %xmm1   # xmm1 = mem[0],zero
	vsubsd	819200048(%rsi,%rax,8), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	819200056(%rdi,%rax,8), %xmm1   # xmm1 = mem[0],zero
	vsubsd	819200056(%rsi,%rax,8), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	addq	$8, %rax
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
	subq	$152, %rsp
	.cfi_def_cfa_offset 192
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
	xorl	%edi, %edi
	callq	time
	movl	%eax, %edi
	callq	srand
	movq	$-819200000, %r12               # imm = 0xCF2C0000
	.p2align	4, 0x90
.LBB6_1:                                # %for.body.i
                                        # =>This Inner Loop Header: Depth=1
	callq	rand
	vcvtsi2sd	%eax, %xmm2, %xmm0
	vmovsd	.LCPI6_0(%rip), %xmm1           # xmm1 = mem[0],zero
	vdivsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, 819200000(%r14,%r12)
	callq	rand
	vcvtsi2sd	%eax, %xmm2, %xmm0
	vdivsd	.LCPI6_0(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, 819200000(%r15,%r12)
	addq	$8, %r12
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
	movq	$-819200000, %rax               # imm = 0xCF2C0000
	vbroadcastsd	.LCPI6_1(%rip), %zmm4   # zmm4 = [3.1400000000000001E+0,3.1400000000000001E+0,3.1400000000000001E+0,3.1400000000000001E+0,3.1400000000000001E+0,3.1400000000000001E+0,3.1400000000000001E+0,3.1400000000000001E+0]
	.p2align	4, 0x90
.LBB6_3:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vmulpd	819200000(%r14,%rax), %zmm4, %zmm0
	vmulpd	819200064(%r14,%rax), %zmm4, %zmm1
	vmulpd	819200128(%r14,%rax), %zmm4, %zmm2
	vmulpd	819200192(%r14,%rax), %zmm4, %zmm3
	vaddpd	819200000(%r15,%rax), %zmm0, %zmm0
	vaddpd	819200064(%r15,%rax), %zmm1, %zmm1
	vaddpd	819200128(%r15,%rax), %zmm2, %zmm2
	vaddpd	819200192(%r15,%rax), %zmm3, %zmm3
	vmovupd	%zmm0, 819200000(%r15,%rax)
	vmovupd	%zmm1, 819200064(%r15,%rax)
	vmovupd	%zmm2, 819200128(%r15,%rax)
	vmovupd	%zmm3, 819200192(%r15,%rax)
	vmulpd	819200256(%r14,%rax), %zmm4, %zmm0
	vmulpd	819200320(%r14,%rax), %zmm4, %zmm1
	vmulpd	819200384(%r14,%rax), %zmm4, %zmm2
	vmulpd	819200448(%r14,%rax), %zmm4, %zmm3
	vaddpd	819200256(%r15,%rax), %zmm0, %zmm0
	vaddpd	819200320(%r15,%rax), %zmm1, %zmm1
	vaddpd	819200384(%r15,%rax), %zmm2, %zmm2
	vaddpd	819200448(%r15,%rax), %zmm3, %zmm3
	vmovupd	%zmm0, 819200256(%r15,%rax)
	vmovupd	%zmm1, 819200320(%r15,%rax)
	vmovupd	%zmm2, 819200384(%r15,%rax)
	vmovupd	%zmm3, 819200448(%r15,%rax)
	addq	$512, %rax                      # imm = 0x200
	jne	.LBB6_3
# %bb.4:                                # %vector.body201.preheader
	movq	$-819200000, %rax               # imm = 0xCF2C0000
	.p2align	4, 0x90
.LBB6_5:                                # %vector.body201
                                        # =>This Inner Loop Header: Depth=1
	vmulpd	819200000(%r14,%rax), %zmm4, %zmm0
	vmulpd	819200064(%r14,%rax), %zmm4, %zmm1
	vmulpd	819200128(%r14,%rax), %zmm4, %zmm2
	vmulpd	819200192(%r14,%rax), %zmm4, %zmm3
	vaddpd	819200000(%rbx,%rax), %zmm0, %zmm0
	vaddpd	819200064(%rbx,%rax), %zmm1, %zmm1
	vaddpd	819200128(%rbx,%rax), %zmm2, %zmm2
	vaddpd	819200192(%rbx,%rax), %zmm3, %zmm3
	vmovupd	%zmm0, 819200000(%rbx,%rax)
	vmovupd	%zmm1, 819200064(%rbx,%rax)
	vmovupd	%zmm2, 819200128(%rbx,%rax)
	vmovupd	%zmm3, 819200192(%rbx,%rax)
	vmulpd	819200256(%r14,%rax), %zmm4, %zmm0
	vmulpd	819200320(%r14,%rax), %zmm4, %zmm1
	vmulpd	819200384(%r14,%rax), %zmm4, %zmm2
	vmulpd	819200448(%r14,%rax), %zmm4, %zmm3
	vaddpd	819200256(%rbx,%rax), %zmm0, %zmm0
	vaddpd	819200320(%rbx,%rax), %zmm1, %zmm1
	vaddpd	819200384(%rbx,%rax), %zmm2, %zmm2
	vaddpd	819200448(%rbx,%rax), %zmm3, %zmm3
	vmovupd	%zmm0, 819200256(%rbx,%rax)
	vmovupd	%zmm1, 819200320(%rbx,%rax)
	vmovupd	%zmm2, 819200384(%rbx,%rax)
	vmovupd	%zmm3, 819200448(%rbx,%rax)
	addq	$512, %rax                      # imm = 0x200
	jne	.LBB6_5
# %bb.6:                                # %for.body.i148.preheader
	vmovupd	%zmm4, 64(%rsp)                 # 64-byte Spill
	movq	$-819200000, %r12               # imm = 0xCF2C0000
	.p2align	4, 0x90
.LBB6_7:                                # %for.body.i148
                                        # =>This Inner Loop Header: Depth=1
	callq	rand
	vcvtsi2sd	%eax, %xmm5, %xmm0
	vmovsd	.LCPI6_0(%rip), %xmm1           # xmm1 = mem[0],zero
	vdivsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, 819200000(%r14,%r12)
	callq	rand
	vcvtsi2sd	%eax, %xmm5, %xmm0
	vdivsd	.LCPI6_0(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, 819200000(%r15,%r12)
	addq	$8, %r12
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
	vmovupd	64(%rsp), %zmm5                 # 64-byte Reload
	.p2align	4, 0x90
.LBB6_9:                                # %vector.ph218
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_10 Depth 2
	movq	$-819200000, %rdx               # imm = 0xCF2C0000
	.p2align	4, 0x90
.LBB6_10:                               # %vector.body217
                                        #   Parent Loop BB6_9 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vmulpd	819200000(%r14,%rdx), %zmm5, %zmm1
	vmulpd	819200064(%r14,%rdx), %zmm5, %zmm2
	vmulpd	819200128(%r14,%rdx), %zmm5, %zmm3
	vmulpd	819200192(%r14,%rdx), %zmm5, %zmm4
	vaddpd	819200000(%r15,%rdx), %zmm1, %zmm1
	vaddpd	819200064(%r15,%rdx), %zmm2, %zmm2
	vaddpd	819200128(%r15,%rdx), %zmm3, %zmm3
	vaddpd	819200192(%r15,%rdx), %zmm4, %zmm4
	vmovupd	%zmm1, 819200000(%r15,%rdx)
	vmovupd	%zmm2, 819200064(%r15,%rdx)
	vmovupd	%zmm3, 819200128(%r15,%rdx)
	vmovupd	%zmm4, 819200192(%r15,%rdx)
	vmulpd	819200256(%r14,%rdx), %zmm5, %zmm1
	vmulpd	819200320(%r14,%rdx), %zmm5, %zmm2
	vmulpd	819200384(%r14,%rdx), %zmm5, %zmm3
	vmulpd	819200448(%r14,%rdx), %zmm5, %zmm4
	vaddpd	819200256(%r15,%rdx), %zmm1, %zmm1
	vaddpd	819200320(%r15,%rdx), %zmm2, %zmm2
	vaddpd	819200384(%r15,%rdx), %zmm3, %zmm3
	vaddpd	819200448(%r15,%rdx), %zmm4, %zmm4
	vmovupd	%zmm1, 819200256(%r15,%rdx)
	vmovupd	%zmm2, 819200320(%r15,%rdx)
	vmovupd	%zmm3, 819200384(%r15,%rdx)
	vmovupd	%zmm4, 819200448(%r15,%rdx)
	addq	$512, %rdx                      # imm = 0x200
	jne	.LBB6_10
# %bb.11:                               # %axpy.exit178
                                        #   in Loop: Header=BB6_9 Depth=1
	addl	$1, %ecx
	cmpl	$20, %ecx
	jne	.LBB6_9
# %bb.12:                               # %for.cond.cleanup27
	vcvtsi2sd	%rax, %xmm6, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, 24(%rsp)                 # 8-byte Spill
	leaq	32(%rsp), %rdi
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
	vmovupd	64(%rsp), %zmm5                 # 64-byte Reload
	movq	32(%rsp), %rax
	movzwl	40(%rsp), %ecx
	vcvtsi2sd	%ecx, %xmm6, %xmm0
	vdivsd	.LCPI6_2(%rip), %xmm0, %xmm0
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB6_13:                               # %vector.ph234
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_14 Depth 2
	movq	$-819200000, %rdx               # imm = 0xCF2C0000
	.p2align	4, 0x90
.LBB6_14:                               # %vector.body233
                                        #   Parent Loop BB6_13 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vmulpd	819200000(%r14,%rdx), %zmm5, %zmm1
	vmulpd	819200064(%r14,%rdx), %zmm5, %zmm2
	vmulpd	819200128(%r14,%rdx), %zmm5, %zmm3
	vmulpd	819200192(%r14,%rdx), %zmm5, %zmm4
	vaddpd	819200000(%rbx,%rdx), %zmm1, %zmm1
	vaddpd	819200064(%rbx,%rdx), %zmm2, %zmm2
	vaddpd	819200128(%rbx,%rdx), %zmm3, %zmm3
	vaddpd	819200192(%rbx,%rdx), %zmm4, %zmm4
	vmovupd	%zmm1, 819200000(%rbx,%rdx)
	vmovupd	%zmm2, 819200064(%rbx,%rdx)
	vmovupd	%zmm3, 819200128(%rbx,%rdx)
	vmovupd	%zmm4, 819200192(%rbx,%rdx)
	vmulpd	819200256(%r14,%rdx), %zmm5, %zmm1
	vmulpd	819200320(%r14,%rdx), %zmm5, %zmm2
	vmulpd	819200384(%r14,%rdx), %zmm5, %zmm3
	vmulpd	819200448(%r14,%rdx), %zmm5, %zmm4
	vaddpd	819200256(%rbx,%rdx), %zmm1, %zmm1
	vaddpd	819200320(%rbx,%rdx), %zmm2, %zmm2
	vaddpd	819200384(%rbx,%rdx), %zmm3, %zmm3
	vaddpd	819200448(%rbx,%rdx), %zmm4, %zmm4
	vmovupd	%zmm1, 819200256(%rbx,%rdx)
	vmovupd	%zmm2, 819200320(%rbx,%rdx)
	vmovupd	%zmm3, 819200384(%rbx,%rdx)
	vmovupd	%zmm4, 819200448(%rbx,%rdx)
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
	vcvtsi2sd	%rax, %xmm6, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, 24(%rsp)                 # 8-byte Spill
	leaq	32(%rsp), %rdi
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
	movq	$-819200000, %rax               # imm = 0xCF2C0000
	.p2align	4, 0x90
.LBB6_17:                               # %for.body.i136
                                        # =>This Inner Loop Header: Depth=1
	vmovsd	819200000(%r15,%rax), %xmm2     # xmm2 = mem[0],zero
	vmovsd	819200008(%r15,%rax), %xmm1     # xmm1 = mem[0],zero
	vsubsd	819200000(%rbx,%rax), %xmm2, %xmm2
	vaddsd	%xmm2, %xmm0, %xmm0
	vsubsd	819200008(%rbx,%rax), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	819200016(%r15,%rax), %xmm1     # xmm1 = mem[0],zero
	vsubsd	819200016(%rbx,%rax), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	819200024(%r15,%rax), %xmm1     # xmm1 = mem[0],zero
	vsubsd	819200024(%rbx,%rax), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	819200032(%r15,%rax), %xmm1     # xmm1 = mem[0],zero
	vsubsd	819200032(%rbx,%rax), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	819200040(%r15,%rax), %xmm1     # xmm1 = mem[0],zero
	vsubsd	819200040(%rbx,%rax), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	819200048(%r15,%rax), %xmm1     # xmm1 = mem[0],zero
	vsubsd	819200048(%rbx,%rax), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	819200056(%r15,%rax), %xmm1     # xmm1 = mem[0],zero
	vsubsd	819200056(%rbx,%rax), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	addq	$64, %rax
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
