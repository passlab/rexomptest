	.text
	.file	"sum_double.c"
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
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	%rdi, %r14
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB1_1:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	callq	rand
	vcvtsi2sd	%eax, %xmm1, %xmm0
	vdivsd	.LCPI1_0(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, (%r14,%rbx,8)
	incq	%rbx
	cmpq	$10240000, %rbx                 # imm = 0x9C4000
	jne	.LBB1_1
# %bb.2:                                # %for.cond.cleanup
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end1:
	.size	init, .Lfunc_end1-init
	.cfi_endproc
                                        # -- End function
	.globl	sum                             # -- Begin function sum
	.p2align	4, 0x90
	.type	sum,@function
sum:                                    # @sum
	.cfi_startproc
# %bb.0:                                # %entry
	vxorpd	%xmm0, %xmm0, %xmm0
	movl	$76, %eax
	vxorpd	%xmm1, %xmm1, %xmm1
	vxorpd	%xmm2, %xmm2, %xmm2
	vxorpd	%xmm3, %xmm3, %xmm3
	.p2align	4, 0x90
.LBB2_1:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vaddpd	-608(%rdi,%rax,8), %ymm0, %ymm0
	vaddpd	-576(%rdi,%rax,8), %ymm1, %ymm1
	vaddpd	-544(%rdi,%rax,8), %ymm2, %ymm2
	vaddpd	-512(%rdi,%rax,8), %ymm3, %ymm3
	vaddpd	-480(%rdi,%rax,8), %ymm0, %ymm0
	vaddpd	-448(%rdi,%rax,8), %ymm1, %ymm1
	vaddpd	-416(%rdi,%rax,8), %ymm2, %ymm2
	vaddpd	-384(%rdi,%rax,8), %ymm3, %ymm3
	vaddpd	-352(%rdi,%rax,8), %ymm0, %ymm0
	vaddpd	-320(%rdi,%rax,8), %ymm1, %ymm1
	vaddpd	-288(%rdi,%rax,8), %ymm2, %ymm2
	vaddpd	-256(%rdi,%rax,8), %ymm3, %ymm3
	vaddpd	-224(%rdi,%rax,8), %ymm0, %ymm0
	vaddpd	-192(%rdi,%rax,8), %ymm1, %ymm1
	vaddpd	-160(%rdi,%rax,8), %ymm2, %ymm2
	vaddpd	-128(%rdi,%rax,8), %ymm3, %ymm3
	vaddpd	-96(%rdi,%rax,8), %ymm0, %ymm0
	vaddpd	-64(%rdi,%rax,8), %ymm1, %ymm1
	vaddpd	-32(%rdi,%rax,8), %ymm2, %ymm2
	vaddpd	(%rdi,%rax,8), %ymm3, %ymm3
	addq	$80, %rax
	cmpq	$10240076, %rax                 # imm = 0x9C404C
	jne	.LBB2_1
# %bb.2:                                # %middle.block
	vaddpd	%ymm0, %ymm1, %ymm0
	vaddpd	%ymm0, %ymm2, %ymm0
	vaddpd	%ymm0, %ymm3, %ymm0
	vpermilpd	$1, %xmm0, %xmm1        # xmm1 = xmm0[1,0]
	vaddsd	%xmm1, %xmm0, %xmm1
	vextractf128	$1, %ymm0, %xmm0
	vaddsd	%xmm0, %xmm1, %xmm1
	vpermilpd	$1, %xmm0, %xmm0        # xmm0 = xmm0[1,0]
	vaddsd	%xmm0, %xmm1, %xmm0
	vxorpd	%xmm1, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vzeroupper
	retq
.Lfunc_end2:
	.size	sum, .Lfunc_end2-sum
	.cfi_endproc
                                        # -- End function
	.globl	sum_serial                      # -- Begin function sum_serial
	.p2align	4, 0x90
	.type	sum_serial,@function
sum_serial:                             # @sum_serial
	.cfi_startproc
# %bb.0:                                # %entry
	vxorpd	%xmm0, %xmm0, %xmm0
	movl	$15, %eax
	.p2align	4, 0x90
.LBB3_1:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	vaddsd	-120(%rdi,%rax,8), %xmm0, %xmm0
	vaddsd	-112(%rdi,%rax,8), %xmm0, %xmm0
	vaddsd	-104(%rdi,%rax,8), %xmm0, %xmm0
	vaddsd	-96(%rdi,%rax,8), %xmm0, %xmm0
	vaddsd	-88(%rdi,%rax,8), %xmm0, %xmm0
	vaddsd	-80(%rdi,%rax,8), %xmm0, %xmm0
	vaddsd	-72(%rdi,%rax,8), %xmm0, %xmm0
	vaddsd	-64(%rdi,%rax,8), %xmm0, %xmm0
	vaddsd	-56(%rdi,%rax,8), %xmm0, %xmm0
	vaddsd	-48(%rdi,%rax,8), %xmm0, %xmm0
	vaddsd	-40(%rdi,%rax,8), %xmm0, %xmm0
	vaddsd	-32(%rdi,%rax,8), %xmm0, %xmm0
	vaddsd	-24(%rdi,%rax,8), %xmm0, %xmm0
	vaddsd	-16(%rdi,%rax,8), %xmm0, %xmm0
	vaddsd	-8(%rdi,%rax,8), %xmm0, %xmm0
	vaddsd	(%rdi,%rax,8), %xmm0, %xmm0
	addq	$16, %rax
	cmpq	$10240015, %rax                 # imm = 0x9C400F
	jne	.LBB3_1
# %bb.2:                                # %for.cond.cleanup
	retq
.Lfunc_end3:
	.size	sum_serial, .Lfunc_end3-sum_serial
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
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3                               # -- Begin function main
.LCPI5_0:
	.quad	0x41a9999999666666              # double 214748364.69999999
.LCPI5_2:
	.quad	0x41cdcd6500000000              # double 1.0E+9
.LCPI5_3:
	.quad	0x432dcd6500000000              # double 4.194304E+15
.LCPI5_4:
	.quad	0x4034000000000000              # double 20
.LCPI5_5:
	.quad	0x0000000000000000              # double 0
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI5_1:
	.quad	0x408f400000000000              # double 1000
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
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	subq	$208, %rsp
	.cfi_def_cfa_offset 256
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movl	$81920000, %edi                 # imm = 0x4E20000
	callq	malloc
	movq	%rax, %rbx
	xorl	%ebp, %ebp
	xorl	%edi, %edi
	callq	time
	movl	%eax, %edi
	callq	srand
	.p2align	4, 0x90
.LBB5_1:                                # %for.body.i
                                        # =>This Inner Loop Header: Depth=1
	callq	rand
	vcvtsi2sd	%eax, %xmm1, %xmm0
	vdivsd	.LCPI5_0(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, (%rbx,%rbp,8)
	incq	%rbp
	cmpq	$10240000, %rbp                 # imm = 0x9C4000
	jne	.LBB5_1
# %bb.2:                                # %iter.check
	leaq	16(%rsp), %rdi
	callq	ftime
	movq	16(%rsp), %r14
	movzwl	24(%rsp), %r15d
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_3:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	addq	$-5120, %rax                    # imm = 0xEC00
	jne	.LBB5_3
# %bb.4:                                # %vector.body125.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_5:                                # %vector.body125
                                        # =>This Inner Loop Header: Depth=1
	addq	$-5120, %rax                    # imm = 0xEC00
	jne	.LBB5_5
# %bb.6:                                # %vector.body144.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_7:                                # %vector.body144
                                        # =>This Inner Loop Header: Depth=1
	addq	$-5120, %rax                    # imm = 0xEC00
	jne	.LBB5_7
# %bb.8:                                # %vector.body163.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_9:                                # %vector.body163
                                        # =>This Inner Loop Header: Depth=1
	addq	$-5120, %rax                    # imm = 0xEC00
	jne	.LBB5_9
# %bb.10:                               # %vector.body182.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_11:                               # %vector.body182
                                        # =>This Inner Loop Header: Depth=1
	addq	$-5120, %rax                    # imm = 0xEC00
	jne	.LBB5_11
# %bb.12:                               # %vector.body201.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_13:                               # %vector.body201
                                        # =>This Inner Loop Header: Depth=1
	addq	$-5120, %rax                    # imm = 0xEC00
	jne	.LBB5_13
# %bb.14:                               # %vector.body220.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_15:                               # %vector.body220
                                        # =>This Inner Loop Header: Depth=1
	addq	$-5120, %rax                    # imm = 0xEC00
	jne	.LBB5_15
# %bb.16:                               # %vector.body239.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_17:                               # %vector.body239
                                        # =>This Inner Loop Header: Depth=1
	addq	$-5120, %rax                    # imm = 0xEC00
	jne	.LBB5_17
# %bb.18:                               # %vector.body258.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_19:                               # %vector.body258
                                        # =>This Inner Loop Header: Depth=1
	addq	$-5120, %rax                    # imm = 0xEC00
	jne	.LBB5_19
# %bb.20:                               # %vector.body277.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_21:                               # %vector.body277
                                        # =>This Inner Loop Header: Depth=1
	addq	$-5120, %rax                    # imm = 0xEC00
	jne	.LBB5_21
# %bb.22:                               # %vector.body296.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_23:                               # %vector.body296
                                        # =>This Inner Loop Header: Depth=1
	addq	$-5120, %rax                    # imm = 0xEC00
	jne	.LBB5_23
# %bb.24:                               # %vector.body315.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_25:                               # %vector.body315
                                        # =>This Inner Loop Header: Depth=1
	addq	$-5120, %rax                    # imm = 0xEC00
	jne	.LBB5_25
# %bb.26:                               # %vector.body334.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_27:                               # %vector.body334
                                        # =>This Inner Loop Header: Depth=1
	addq	$-5120, %rax                    # imm = 0xEC00
	jne	.LBB5_27
# %bb.28:                               # %vector.body353.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_29:                               # %vector.body353
                                        # =>This Inner Loop Header: Depth=1
	addq	$-5120, %rax                    # imm = 0xEC00
	jne	.LBB5_29
# %bb.30:                               # %vector.body372.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_31:                               # %vector.body372
                                        # =>This Inner Loop Header: Depth=1
	addq	$-5120, %rax                    # imm = 0xEC00
	jne	.LBB5_31
# %bb.32:                               # %vector.body391.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_33:                               # %vector.body391
                                        # =>This Inner Loop Header: Depth=1
	addq	$-5120, %rax                    # imm = 0xEC00
	jne	.LBB5_33
# %bb.34:                               # %vector.body410.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_35:                               # %vector.body410
                                        # =>This Inner Loop Header: Depth=1
	addq	$-5120, %rax                    # imm = 0xEC00
	jne	.LBB5_35
# %bb.36:                               # %vector.body429.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_37:                               # %vector.body429
                                        # =>This Inner Loop Header: Depth=1
	addq	$-5120, %rax                    # imm = 0xEC00
	jne	.LBB5_37
# %bb.38:                               # %vector.body448.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_39:                               # %vector.body448
                                        # =>This Inner Loop Header: Depth=1
	addq	$-5120, %rax                    # imm = 0xEC00
	jne	.LBB5_39
# %bb.40:                               # %vector.body467.preheader
	vxorpd	%xmm0, %xmm0, %xmm0
	movl	$76, %eax
	vxorpd	%xmm1, %xmm1, %xmm1
	vxorpd	%xmm2, %xmm2, %xmm2
	vxorpd	%xmm3, %xmm3, %xmm3
	.p2align	4, 0x90
.LBB5_41:                               # %vector.body467
                                        # =>This Inner Loop Header: Depth=1
	vaddpd	-608(%rbx,%rax,8), %ymm0, %ymm0
	vaddpd	-576(%rbx,%rax,8), %ymm1, %ymm1
	vaddpd	-544(%rbx,%rax,8), %ymm2, %ymm2
	vaddpd	-512(%rbx,%rax,8), %ymm3, %ymm3
	vaddpd	-480(%rbx,%rax,8), %ymm0, %ymm0
	vaddpd	-448(%rbx,%rax,8), %ymm1, %ymm1
	vaddpd	-416(%rbx,%rax,8), %ymm2, %ymm2
	vaddpd	-384(%rbx,%rax,8), %ymm3, %ymm3
	vaddpd	-352(%rbx,%rax,8), %ymm0, %ymm0
	vaddpd	-320(%rbx,%rax,8), %ymm1, %ymm1
	vaddpd	-288(%rbx,%rax,8), %ymm2, %ymm2
	vaddpd	-256(%rbx,%rax,8), %ymm3, %ymm3
	vaddpd	-224(%rbx,%rax,8), %ymm0, %ymm0
	vaddpd	-192(%rbx,%rax,8), %ymm1, %ymm1
	vaddpd	-160(%rbx,%rax,8), %ymm2, %ymm2
	vaddpd	-128(%rbx,%rax,8), %ymm3, %ymm3
	vaddpd	-96(%rbx,%rax,8), %ymm0, %ymm0
	vaddpd	-64(%rbx,%rax,8), %ymm1, %ymm1
	vaddpd	-32(%rbx,%rax,8), %ymm2, %ymm2
	vaddpd	(%rbx,%rax,8), %ymm3, %ymm3
	addq	$80, %rax
	cmpq	$10240076, %rax                 # imm = 0x9C404C
	jne	.LBB5_41
# %bb.42:                               # %middle.block466
	vmovupd	%ymm3, 160(%rsp)                # 32-byte Spill
	vmovupd	%ymm2, 64(%rsp)                 # 32-byte Spill
	vmovupd	%ymm1, 96(%rsp)                 # 32-byte Spill
	vmovupd	%ymm0, 128(%rsp)                # 32-byte Spill
	leaq	16(%rsp), %rdi
	vzeroupper
	callq	ftime
	vmovapd	16(%rsp), %xmm0
	vmovapd	%xmm0, 48(%rsp)                 # 16-byte Spill
	leaq	16(%rsp), %rdi
	callq	ftime
	movq	16(%rsp), %rbp
	movzwl	24(%rsp), %r12d
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_43:                               # %for.body.i72
                                        # =>This Inner Loop Header: Depth=1
	addq	$-40, %rax
	jne	.LBB5_43
# %bb.44:                               # %for.body.i72.1.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_45:                               # %for.body.i72.1
                                        # =>This Inner Loop Header: Depth=1
	addq	$-40, %rax
	jne	.LBB5_45
# %bb.46:                               # %for.body.i72.2.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	vmovupd	96(%rsp), %ymm1                 # 32-byte Reload
	vmovupd	64(%rsp), %ymm2                 # 32-byte Reload
	vmovupd	160(%rsp), %ymm3                # 32-byte Reload
	.p2align	4, 0x90
.LBB5_47:                               # %for.body.i72.2
                                        # =>This Inner Loop Header: Depth=1
	addq	$-40, %rax
	jne	.LBB5_47
# %bb.48:                               # %for.body.i72.3.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_49:                               # %for.body.i72.3
                                        # =>This Inner Loop Header: Depth=1
	addq	$-40, %rax
	jne	.LBB5_49
# %bb.50:                               # %for.body.i72.4.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_51:                               # %for.body.i72.4
                                        # =>This Inner Loop Header: Depth=1
	addq	$-40, %rax
	jne	.LBB5_51
# %bb.52:                               # %for.body.i72.5.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_53:                               # %for.body.i72.5
                                        # =>This Inner Loop Header: Depth=1
	addq	$-40, %rax
	jne	.LBB5_53
# %bb.54:                               # %for.body.i72.6.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_55:                               # %for.body.i72.6
                                        # =>This Inner Loop Header: Depth=1
	addq	$-40, %rax
	jne	.LBB5_55
# %bb.56:                               # %for.body.i72.7.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_57:                               # %for.body.i72.7
                                        # =>This Inner Loop Header: Depth=1
	addq	$-40, %rax
	jne	.LBB5_57
# %bb.58:                               # %for.body.i72.8.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_59:                               # %for.body.i72.8
                                        # =>This Inner Loop Header: Depth=1
	addq	$-40, %rax
	jne	.LBB5_59
# %bb.60:                               # %for.body.i72.9.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_61:                               # %for.body.i72.9
                                        # =>This Inner Loop Header: Depth=1
	addq	$-40, %rax
	jne	.LBB5_61
# %bb.62:                               # %for.body.i72.10.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_63:                               # %for.body.i72.10
                                        # =>This Inner Loop Header: Depth=1
	addq	$-40, %rax
	jne	.LBB5_63
# %bb.64:                               # %for.body.i72.11.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_65:                               # %for.body.i72.11
                                        # =>This Inner Loop Header: Depth=1
	addq	$-40, %rax
	jne	.LBB5_65
# %bb.66:                               # %for.body.i72.12.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_67:                               # %for.body.i72.12
                                        # =>This Inner Loop Header: Depth=1
	addq	$-40, %rax
	jne	.LBB5_67
# %bb.68:                               # %for.body.i72.13.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_69:                               # %for.body.i72.13
                                        # =>This Inner Loop Header: Depth=1
	addq	$-40, %rax
	jne	.LBB5_69
# %bb.70:                               # %for.body.i72.14.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_71:                               # %for.body.i72.14
                                        # =>This Inner Loop Header: Depth=1
	addq	$-40, %rax
	jne	.LBB5_71
# %bb.72:                               # %for.body.i72.15.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_73:                               # %for.body.i72.15
                                        # =>This Inner Loop Header: Depth=1
	addq	$-40, %rax
	jne	.LBB5_73
# %bb.74:                               # %for.body.i72.16.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_75:                               # %for.body.i72.16
                                        # =>This Inner Loop Header: Depth=1
	addq	$-40, %rax
	jne	.LBB5_75
# %bb.76:                               # %for.body.i72.17.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_77:                               # %for.body.i72.17
                                        # =>This Inner Loop Header: Depth=1
	addq	$-40, %rax
	jne	.LBB5_77
# %bb.78:                               # %for.body.i72.18.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_79:                               # %for.body.i72.18
                                        # =>This Inner Loop Header: Depth=1
	addq	$-40, %rax
	jne	.LBB5_79
# %bb.80:                               # %for.body.i72.19.preheader
	vxorpd	%xmm0, %xmm0, %xmm0
	movl	$15, %eax
	.p2align	4, 0x90
.LBB5_81:                               # %for.body.i72.19
                                        # =>This Inner Loop Header: Depth=1
	vaddsd	-120(%rbx,%rax,8), %xmm0, %xmm0
	vaddsd	-112(%rbx,%rax,8), %xmm0, %xmm0
	vaddsd	-104(%rbx,%rax,8), %xmm0, %xmm0
	vaddsd	-96(%rbx,%rax,8), %xmm0, %xmm0
	vaddsd	-88(%rbx,%rax,8), %xmm0, %xmm0
	vaddsd	-80(%rbx,%rax,8), %xmm0, %xmm0
	vaddsd	-72(%rbx,%rax,8), %xmm0, %xmm0
	vaddsd	-64(%rbx,%rax,8), %xmm0, %xmm0
	vaddsd	-56(%rbx,%rax,8), %xmm0, %xmm0
	vaddsd	-48(%rbx,%rax,8), %xmm0, %xmm0
	vaddsd	-40(%rbx,%rax,8), %xmm0, %xmm0
	vaddsd	-32(%rbx,%rax,8), %xmm0, %xmm0
	vaddsd	-24(%rbx,%rax,8), %xmm0, %xmm0
	vaddsd	-16(%rbx,%rax,8), %xmm0, %xmm0
	vaddsd	-8(%rbx,%rax,8), %xmm0, %xmm0
	vaddsd	(%rbx,%rax,8), %xmm0, %xmm0
	addq	$16, %rax
	cmpq	$10240015, %rax                 # imm = 0x9C400F
	jne	.LBB5_81
# %bb.82:                               # %sum_serial.exit.19
	vmovdqa	48(%rsp), %xmm4                 # 16-byte Reload
	vmovsd	%xmm0, 40(%rsp)                 # 8-byte Spill
	vpshufd	$238, %xmm4, %xmm0              # xmm0 = xmm4[2,3,2,3]
	vaddpd	128(%rsp), %ymm1, %ymm1         # 32-byte Folded Reload
	vaddpd	%ymm1, %ymm2, %ymm1
	vaddpd	%ymm1, %ymm3, %ymm1
	vpermilpd	$1, %xmm1, %xmm2        # xmm2 = xmm1[1,0]
	vaddsd	%xmm2, %xmm1, %xmm2
	vextractf128	$1, %ymm1, %xmm1
	vaddsd	%xmm1, %xmm2, %xmm2
	vpermilpd	$1, %xmm1, %xmm1        # xmm1 = xmm1[1,0]
	vaddsd	%xmm1, %xmm2, %xmm1
	vpinsrw	$1, %r15d, %xmm0, %xmm0
	vpmovzxwd	%xmm0, %xmm0            # xmm0 = xmm0[0],zero,xmm0[1],zero,xmm0[2],zero,xmm0[3],zero
	vcvtdq2pd	%xmm0, %xmm0
	vdivpd	.LCPI5_1(%rip), %xmm0, %xmm0
	vpinsrq	$1, %r14, %xmm4, %xmm2
	vcvtqq2pd	%xmm2, %xmm2
	vaddpd	%xmm2, %xmm0, %xmm0
	vpermilpd	$1, %xmm0, %xmm2        # xmm2 = xmm0[1,0]
	vsubsd	%xmm2, %xmm0, %xmm0
	vxorpd	%xmm2, %xmm2, %xmm2
	vaddsd	%xmm2, %xmm1, %xmm1
	vmovsd	%xmm1, 128(%rsp)                # 8-byte Spill
	vaddsd	%xmm2, %xmm0, %xmm0
	vmovsd	%xmm0, 96(%rsp)                 # 8-byte Spill
	leaq	16(%rsp), %rdi
	vzeroupper
	callq	ftime
	vmovdqa	16(%rsp), %xmm0
	vpinsrq	$1, %rbp, %xmm0, %xmm0
	vpbroadcastw	24(%rsp), %xmm1
	vpinsrw	$1, %r12d, %xmm1, %xmm1
	vpmovzxwd	%xmm1, %xmm1            # xmm1 = xmm1[0],zero,xmm1[1],zero,xmm1[2],zero,xmm1[3],zero
	vcvtdq2pd	%xmm1, %xmm1
	vcvtqq2pd	%xmm0, %xmm0
	vdivpd	.LCPI5_1(%rip), %xmm1, %xmm1
	vaddpd	%xmm0, %xmm1, %xmm0
	vpermilpd	$1, %xmm0, %xmm1        # xmm1 = xmm0[1,0]
	vsubsd	%xmm1, %xmm0, %xmm0
	vaddsd	.LCPI5_5, %xmm0, %xmm0
	vmovsd	%xmm0, 64(%rsp)                 # 8-byte Spill
	movq	%rbx, %rdi
	callq	print_vector
	movl	$.L.str.3, %edi
	callq	puts
	movl	$.L.str.4, %edi
	vmovsd	128(%rsp), %xmm0                # 8-byte Reload
                                        # xmm0 = mem[0],zero
	movb	$1, %al
	callq	printf
	movl	$.L.str.5, %edi
	callq	puts
	movl	$.L.str.6, %edi
	vmovsd	40(%rsp), %xmm0                 # 8-byte Reload
                                        # xmm0 = mem[0],zero
	movb	$1, %al
	callq	printf
	vmovsd	.LCPI5_2(%rip), %xmm0           # xmm0 = mem[0],zero
	vmulsd	96(%rsp), %xmm0, %xmm1          # 8-byte Folded Reload
	vmovsd	.LCPI5_3(%rip), %xmm2           # xmm2 = mem[0],zero
	vdivsd	%xmm1, %xmm2, %xmm1
	vmovsd	%xmm1, 48(%rsp)                 # 8-byte Spill
	vmulsd	64(%rsp), %xmm0, %xmm0          # 8-byte Folded Reload
	vdivsd	%xmm0, %xmm2, %xmm0
	vmovsd	%xmm0, 160(%rsp)                # 8-byte Spill
	movl	$.Lstr, %edi
	callq	puts
	movl	$.Lstr.13, %edi
	callq	puts
	movl	$.Lstr.14, %edi
	callq	puts
	vmovsd	96(%rsp), %xmm0                 # 8-byte Reload
                                        # xmm0 = mem[0],zero
	vdivsd	.LCPI5_4(%rip), %xmm0, %xmm0
	movl	$.L.str.10, %edi
	vmovsd	48(%rsp), %xmm1                 # 8-byte Reload
                                        # xmm1 = mem[0],zero
	movb	$2, %al
	callq	printf
	vmovsd	64(%rsp), %xmm0                 # 8-byte Reload
                                        # xmm0 = mem[0],zero
	vdivsd	.LCPI5_4(%rip), %xmm0, %xmm0
	movl	$.L.str.11, %edi
	vmovsd	160(%rsp), %xmm1                # 8-byte Reload
                                        # xmm1 = mem[0],zero
	movb	$2, %al
	callq	printf
	vmovsd	40(%rsp), %xmm0                 # 8-byte Reload
                                        # xmm0 = mem[0],zero
	vsubsd	128(%rsp), %xmm0, %xmm0         # 8-byte Folded Reload
	movl	$.L.str.12, %edi
	movb	$1, %al
	callq	printf
	movq	%rbx, %rdi
	callq	free
	xorl	%eax, %eax
	addq	$208, %rsp
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%r12
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
	.asciz	"=\n"
	.size	.L.str.3, 3

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"SIMD: %f\n"
	.size	.L.str.4, 10

	.type	.L.str.5,@object                # @.str.5
.L.str.5:
	.asciz	"---------------------------------"
	.size	.L.str.5, 34

	.type	.L.str.6,@object                # @.str.6
.L.str.6:
	.asciz	"Serial: %f\n"
	.size	.L.str.6, 12

	.type	.L.str.10,@object               # @.str.10
.L.str.10:
	.asciz	"Sum (SIMD):\t\t%4f\t%4f\n"
	.size	.L.str.10, 22

	.type	.L.str.11,@object               # @.str.11
.L.str.11:
	.asciz	"Sum (Serial):\t\t%4f\t%4f\n"
	.size	.L.str.11, 24

	.type	.L.str.12,@object               # @.str.12
.L.str.12:
	.asciz	"Correctness check: %f\n"
	.size	.L.str.12, 23

	.type	.Lstr,@object                   # @str
.Lstr:
	.asciz	"=================================================================="
	.size	.Lstr, 67

	.type	.Lstr.13,@object                # @str.13
.Lstr.13:
	.asciz	"Performance:\t\t\tRuntime (s)\t GFLOPS"
	.size	.Lstr.13, 35

	.type	.Lstr.14,@object                # @str.14
.Lstr.14:
	.asciz	"------------------------------------------------------------------"
	.size	.Lstr.14, 67

	.ident	"clang version 12.0.1 (https://github.com/llvm/llvm-project fed41342a82f5a3a9201819a82bf7a48313e296b)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
