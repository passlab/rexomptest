	.text
	.file	"sum_int.c"
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
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	%rdi, %r14
	movq	$-40960000, %rbx                # imm = 0xFD8F0000
	.p2align	4, 0x90
.LBB1_1:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	callq	rand
	movl	%eax, 40960000(%r14,%rbx)
	addq	$4, %rbx
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
	vpxor	%xmm0, %xmm0, %xmm0
	movq	$-40960000, %rax                # imm = 0xFD8F0000
	vpxor	%xmm1, %xmm1, %xmm1
	vpxor	%xmm2, %xmm2, %xmm2
	vpxor	%xmm3, %xmm3, %xmm3
	.p2align	4, 0x90
.LBB2_1:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vpaddd	40960000(%rdi,%rax), %zmm0, %zmm0
	vpaddd	40960064(%rdi,%rax), %zmm1, %zmm1
	vpaddd	40960128(%rdi,%rax), %zmm2, %zmm2
	vpaddd	40960192(%rdi,%rax), %zmm3, %zmm3
	vpaddd	40960256(%rdi,%rax), %zmm0, %zmm0
	vpaddd	40960320(%rdi,%rax), %zmm1, %zmm1
	vpaddd	40960384(%rdi,%rax), %zmm2, %zmm2
	vpaddd	40960448(%rdi,%rax), %zmm3, %zmm3
	vpaddd	40960512(%rdi,%rax), %zmm0, %zmm0
	vpaddd	40960576(%rdi,%rax), %zmm1, %zmm1
	vpaddd	40960640(%rdi,%rax), %zmm2, %zmm2
	vpaddd	40960704(%rdi,%rax), %zmm3, %zmm3
	vpaddd	40960768(%rdi,%rax), %zmm0, %zmm0
	vpaddd	40960832(%rdi,%rax), %zmm1, %zmm1
	vpaddd	40960896(%rdi,%rax), %zmm2, %zmm2
	vpaddd	40960960(%rdi,%rax), %zmm3, %zmm3
	vpaddd	40961024(%rdi,%rax), %zmm0, %zmm0
	vpaddd	40961088(%rdi,%rax), %zmm1, %zmm1
	vpaddd	40961152(%rdi,%rax), %zmm2, %zmm2
	vpaddd	40961216(%rdi,%rax), %zmm3, %zmm3
	addq	$1280, %rax                     # imm = 0x500
	jne	.LBB2_1
# %bb.2:                                # %middle.block
	vpaddd	%zmm0, %zmm1, %zmm0
	vpaddd	%zmm0, %zmm2, %zmm0
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
	vpxor	%xmm0, %xmm0, %xmm0
	movq	$-40960000, %rax                # imm = 0xFD8F0000
	vpxor	%xmm1, %xmm1, %xmm1
	vpxor	%xmm2, %xmm2, %xmm2
	vpxor	%xmm3, %xmm3, %xmm3
	.p2align	4, 0x90
.LBB3_1:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vpaddd	40960000(%rdi,%rax), %zmm0, %zmm0
	vpaddd	40960064(%rdi,%rax), %zmm1, %zmm1
	vpaddd	40960128(%rdi,%rax), %zmm2, %zmm2
	vpaddd	40960192(%rdi,%rax), %zmm3, %zmm3
	vpaddd	40960256(%rdi,%rax), %zmm0, %zmm0
	vpaddd	40960320(%rdi,%rax), %zmm1, %zmm1
	vpaddd	40960384(%rdi,%rax), %zmm2, %zmm2
	vpaddd	40960448(%rdi,%rax), %zmm3, %zmm3
	vpaddd	40960512(%rdi,%rax), %zmm0, %zmm0
	vpaddd	40960576(%rdi,%rax), %zmm1, %zmm1
	vpaddd	40960640(%rdi,%rax), %zmm2, %zmm2
	vpaddd	40960704(%rdi,%rax), %zmm3, %zmm3
	vpaddd	40960768(%rdi,%rax), %zmm0, %zmm0
	vpaddd	40960832(%rdi,%rax), %zmm1, %zmm1
	vpaddd	40960896(%rdi,%rax), %zmm2, %zmm2
	vpaddd	40960960(%rdi,%rax), %zmm3, %zmm3
	vpaddd	40961024(%rdi,%rax), %zmm0, %zmm0
	vpaddd	40961088(%rdi,%rax), %zmm1, %zmm1
	vpaddd	40961152(%rdi,%rax), %zmm2, %zmm2
	vpaddd	40961216(%rdi,%rax), %zmm3, %zmm3
	addq	$1280, %rax                     # imm = 0x500
	jne	.LBB3_1
# %bb.2:                                # %middle.block
	vpaddd	%zmm0, %zmm1, %zmm0
	vpaddd	%zmm0, %zmm2, %zmm0
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
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3                               # -- Begin function main
.LCPI5_0:
	.quad	0x408f400000000000              # double 1000
.LCPI5_1:
	.quad	0x41cdcd6500000000              # double 1.0E+9
.LCPI5_2:
	.quad	0x432dcd6500000000              # double 4.194304E+15
.LCPI5_3:
	.quad	0x4034000000000000              # double 20
.LCPI5_4:
	.quad	0x0000000000000000              # double 0
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
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movl	$40960000, %edi                 # imm = 0x2710000
	callq	malloc
	movq	%rax, %rbx
	xorl	%edi, %edi
	callq	time
	movl	%eax, %edi
	callq	srand
	movq	$-40960000, %rbp                # imm = 0xFD8F0000
	.p2align	4, 0x90
.LBB5_1:                                # %for.body.i
                                        # =>This Inner Loop Header: Depth=1
	callq	rand
	movl	%eax, 40960000(%rbx,%rbp)
	addq	$4, %rbp
	jne	.LBB5_1
# %bb.2:                                # %iter.check
	leaq	8(%rsp), %rdi
	callq	ftime
	movq	8(%rsp), %rax
	movq	%rax, 32(%rsp)                  # 8-byte Spill
	movzwl	16(%rsp), %r12d
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_3:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	addq	$-10240, %rax                   # imm = 0xD800
	jne	.LBB5_3
# %bb.4:                                # %vector.body121.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_5:                                # %vector.body121
                                        # =>This Inner Loop Header: Depth=1
	addq	$-10240, %rax                   # imm = 0xD800
	jne	.LBB5_5
# %bb.6:                                # %vector.body140.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_7:                                # %vector.body140
                                        # =>This Inner Loop Header: Depth=1
	addq	$-10240, %rax                   # imm = 0xD800
	jne	.LBB5_7
# %bb.8:                                # %vector.body159.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_9:                                # %vector.body159
                                        # =>This Inner Loop Header: Depth=1
	addq	$-10240, %rax                   # imm = 0xD800
	jne	.LBB5_9
# %bb.10:                               # %vector.body178.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_11:                               # %vector.body178
                                        # =>This Inner Loop Header: Depth=1
	addq	$-10240, %rax                   # imm = 0xD800
	jne	.LBB5_11
# %bb.12:                               # %vector.body197.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_13:                               # %vector.body197
                                        # =>This Inner Loop Header: Depth=1
	addq	$-10240, %rax                   # imm = 0xD800
	jne	.LBB5_13
# %bb.14:                               # %vector.body216.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_15:                               # %vector.body216
                                        # =>This Inner Loop Header: Depth=1
	addq	$-10240, %rax                   # imm = 0xD800
	jne	.LBB5_15
# %bb.16:                               # %vector.body235.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_17:                               # %vector.body235
                                        # =>This Inner Loop Header: Depth=1
	addq	$-10240, %rax                   # imm = 0xD800
	jne	.LBB5_17
# %bb.18:                               # %vector.body254.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_19:                               # %vector.body254
                                        # =>This Inner Loop Header: Depth=1
	addq	$-10240, %rax                   # imm = 0xD800
	jne	.LBB5_19
# %bb.20:                               # %vector.body273.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_21:                               # %vector.body273
                                        # =>This Inner Loop Header: Depth=1
	addq	$-10240, %rax                   # imm = 0xD800
	jne	.LBB5_21
# %bb.22:                               # %vector.body292.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_23:                               # %vector.body292
                                        # =>This Inner Loop Header: Depth=1
	addq	$-10240, %rax                   # imm = 0xD800
	jne	.LBB5_23
# %bb.24:                               # %vector.body311.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_25:                               # %vector.body311
                                        # =>This Inner Loop Header: Depth=1
	addq	$-10240, %rax                   # imm = 0xD800
	jne	.LBB5_25
# %bb.26:                               # %vector.body330.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_27:                               # %vector.body330
                                        # =>This Inner Loop Header: Depth=1
	addq	$-10240, %rax                   # imm = 0xD800
	jne	.LBB5_27
# %bb.28:                               # %vector.body349.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_29:                               # %vector.body349
                                        # =>This Inner Loop Header: Depth=1
	addq	$-10240, %rax                   # imm = 0xD800
	jne	.LBB5_29
# %bb.30:                               # %vector.body368.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_31:                               # %vector.body368
                                        # =>This Inner Loop Header: Depth=1
	addq	$-10240, %rax                   # imm = 0xD800
	jne	.LBB5_31
# %bb.32:                               # %vector.body387.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_33:                               # %vector.body387
                                        # =>This Inner Loop Header: Depth=1
	addq	$-10240, %rax                   # imm = 0xD800
	jne	.LBB5_33
# %bb.34:                               # %vector.body406.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_35:                               # %vector.body406
                                        # =>This Inner Loop Header: Depth=1
	addq	$-10240, %rax                   # imm = 0xD800
	jne	.LBB5_35
# %bb.36:                               # %vector.body425.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_37:                               # %vector.body425
                                        # =>This Inner Loop Header: Depth=1
	addq	$-10240, %rax                   # imm = 0xD800
	jne	.LBB5_37
# %bb.38:                               # %vector.body444.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_39:                               # %vector.body444
                                        # =>This Inner Loop Header: Depth=1
	addq	$-10240, %rax                   # imm = 0xD800
	jne	.LBB5_39
# %bb.40:                               # %vector.body463.preheader
	vpxor	%xmm0, %xmm0, %xmm0
	movq	$-40960000, %rax                # imm = 0xFD8F0000
	vpxor	%xmm1, %xmm1, %xmm1
	vpxor	%xmm2, %xmm2, %xmm2
	vpxor	%xmm3, %xmm3, %xmm3
	.p2align	4, 0x90
.LBB5_41:                               # %vector.body463
                                        # =>This Inner Loop Header: Depth=1
	vpaddd	40960000(%rbx,%rax), %zmm0, %zmm0
	vpaddd	40960064(%rbx,%rax), %zmm1, %zmm1
	vpaddd	40960128(%rbx,%rax), %zmm2, %zmm2
	vpaddd	40960192(%rbx,%rax), %zmm3, %zmm3
	vpaddd	40960256(%rbx,%rax), %zmm0, %zmm0
	vpaddd	40960320(%rbx,%rax), %zmm1, %zmm1
	vpaddd	40960384(%rbx,%rax), %zmm2, %zmm2
	vpaddd	40960448(%rbx,%rax), %zmm3, %zmm3
	vpaddd	40960512(%rbx,%rax), %zmm0, %zmm0
	vpaddd	40960576(%rbx,%rax), %zmm1, %zmm1
	vpaddd	40960640(%rbx,%rax), %zmm2, %zmm2
	vpaddd	40960704(%rbx,%rax), %zmm3, %zmm3
	vpaddd	40960768(%rbx,%rax), %zmm0, %zmm0
	vpaddd	40960832(%rbx,%rax), %zmm1, %zmm1
	vpaddd	40960896(%rbx,%rax), %zmm2, %zmm2
	vpaddd	40960960(%rbx,%rax), %zmm3, %zmm3
	vpaddd	40961024(%rbx,%rax), %zmm0, %zmm0
	vpaddd	40961088(%rbx,%rax), %zmm1, %zmm1
	vpaddd	40961152(%rbx,%rax), %zmm2, %zmm2
	vpaddd	40961216(%rbx,%rax), %zmm3, %zmm3
	addq	$1280, %rax                     # imm = 0x500
	jne	.LBB5_41
# %bb.42:                               # %middle.block462
	vpaddd	%zmm0, %zmm1, %zmm0
	vpaddd	%zmm0, %zmm2, %zmm0
	vpaddd	%zmm0, %zmm3, %zmm0
	vextracti64x4	$1, %zmm0, %ymm1
	vpaddd	%zmm1, %zmm0, %zmm0
	vextracti128	$1, %ymm0, %xmm1
	vpaddd	%xmm1, %xmm0, %xmm0
	vpshufd	$238, %xmm0, %xmm1              # xmm1 = xmm0[2,3,2,3]
	vpaddd	%xmm1, %xmm0, %xmm0
	vpshufd	$85, %xmm0, %xmm1               # xmm1 = xmm0[1,1,1,1]
	vpaddd	%xmm1, %xmm0, %xmm0
	vmovd	%xmm0, %r14d
	leaq	8(%rsp), %rdi
	callq	ftime
	movq	8(%rsp), %r13
	movzwl	16(%rsp), %r15d
	leaq	8(%rsp), %rdi
	callq	ftime
	movq	8(%rsp), %rax
	movzwl	16(%rsp), %ecx
	movl	$10240000, %edx                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_43:                               # %for.body.i72
                                        # =>This Inner Loop Header: Depth=1
	addq	$-40, %rdx
	jne	.LBB5_43
# %bb.44:                               # %for.body.i72.1.preheader
	movl	$10240000, %edx                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_45:                               # %for.body.i72.1
                                        # =>This Inner Loop Header: Depth=1
	addq	$-40, %rdx
	jne	.LBB5_45
# %bb.46:                               # %for.body.i72.2.preheader
	movl	$10240000, %edx                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_47:                               # %for.body.i72.2
                                        # =>This Inner Loop Header: Depth=1
	addq	$-40, %rdx
	jne	.LBB5_47
# %bb.48:                               # %for.body.i72.3.preheader
	movl	$10240000, %edx                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_49:                               # %for.body.i72.3
                                        # =>This Inner Loop Header: Depth=1
	addq	$-40, %rdx
	jne	.LBB5_49
# %bb.50:                               # %for.body.i72.4.preheader
	movl	$10240000, %edx                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_51:                               # %for.body.i72.4
                                        # =>This Inner Loop Header: Depth=1
	addq	$-40, %rdx
	jne	.LBB5_51
# %bb.52:                               # %for.body.i72.5.preheader
	movl	$10240000, %edx                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_53:                               # %for.body.i72.5
                                        # =>This Inner Loop Header: Depth=1
	addq	$-40, %rdx
	jne	.LBB5_53
# %bb.54:                               # %for.body.i72.6.preheader
	movl	$10240000, %edx                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_55:                               # %for.body.i72.6
                                        # =>This Inner Loop Header: Depth=1
	addq	$-40, %rdx
	jne	.LBB5_55
# %bb.56:                               # %for.body.i72.7.preheader
	movl	$10240000, %edx                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_57:                               # %for.body.i72.7
                                        # =>This Inner Loop Header: Depth=1
	addq	$-40, %rdx
	jne	.LBB5_57
# %bb.58:                               # %for.body.i72.8.preheader
	movl	$10240000, %edx                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_59:                               # %for.body.i72.8
                                        # =>This Inner Loop Header: Depth=1
	addq	$-40, %rdx
	jne	.LBB5_59
# %bb.60:                               # %for.body.i72.9.preheader
	movl	$10240000, %edx                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_61:                               # %for.body.i72.9
                                        # =>This Inner Loop Header: Depth=1
	addq	$-40, %rdx
	jne	.LBB5_61
# %bb.62:                               # %for.body.i72.10.preheader
	movl	$10240000, %edx                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_63:                               # %for.body.i72.10
                                        # =>This Inner Loop Header: Depth=1
	addq	$-40, %rdx
	jne	.LBB5_63
# %bb.64:                               # %for.body.i72.11.preheader
	movl	$10240000, %edx                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_65:                               # %for.body.i72.11
                                        # =>This Inner Loop Header: Depth=1
	addq	$-40, %rdx
	jne	.LBB5_65
# %bb.66:                               # %for.body.i72.12.preheader
	movl	$10240000, %edx                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_67:                               # %for.body.i72.12
                                        # =>This Inner Loop Header: Depth=1
	addq	$-40, %rdx
	jne	.LBB5_67
# %bb.68:                               # %for.body.i72.13.preheader
	movl	$10240000, %edx                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_69:                               # %for.body.i72.13
                                        # =>This Inner Loop Header: Depth=1
	addq	$-40, %rdx
	jne	.LBB5_69
# %bb.70:                               # %for.body.i72.14.preheader
	movl	$10240000, %edx                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_71:                               # %for.body.i72.14
                                        # =>This Inner Loop Header: Depth=1
	addq	$-40, %rdx
	jne	.LBB5_71
# %bb.72:                               # %for.body.i72.15.preheader
	movl	$10240000, %edx                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_73:                               # %for.body.i72.15
                                        # =>This Inner Loop Header: Depth=1
	addq	$-40, %rdx
	jne	.LBB5_73
# %bb.74:                               # %for.body.i72.16.preheader
	movl	$10240000, %edx                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_75:                               # %for.body.i72.16
                                        # =>This Inner Loop Header: Depth=1
	addq	$-40, %rdx
	jne	.LBB5_75
# %bb.76:                               # %for.body.i72.17.preheader
	movl	$10240000, %edx                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_77:                               # %for.body.i72.17
                                        # =>This Inner Loop Header: Depth=1
	addq	$-40, %rdx
	jne	.LBB5_77
# %bb.78:                               # %for.body.i72.18.preheader
	movl	$10240000, %edx                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_79:                               # %for.body.i72.18
                                        # =>This Inner Loop Header: Depth=1
	addq	$-40, %rdx
	jne	.LBB5_79
# %bb.80:                               # %vector.body479.preheader
	vpxor	%xmm0, %xmm0, %xmm0
	movq	$-40960000, %rdx                # imm = 0xFD8F0000
	vpxor	%xmm1, %xmm1, %xmm1
	vpxor	%xmm2, %xmm2, %xmm2
	vpxor	%xmm3, %xmm3, %xmm3
	.p2align	4, 0x90
.LBB5_81:                               # %vector.body479
                                        # =>This Inner Loop Header: Depth=1
	vpaddd	40960000(%rbx,%rdx), %zmm0, %zmm0
	vpaddd	40960064(%rbx,%rdx), %zmm1, %zmm1
	vpaddd	40960128(%rbx,%rdx), %zmm2, %zmm2
	vpaddd	40960192(%rbx,%rdx), %zmm3, %zmm3
	vpaddd	40960256(%rbx,%rdx), %zmm0, %zmm0
	vpaddd	40960320(%rbx,%rdx), %zmm1, %zmm1
	vpaddd	40960384(%rbx,%rdx), %zmm2, %zmm2
	vpaddd	40960448(%rbx,%rdx), %zmm3, %zmm3
	vpaddd	40960512(%rbx,%rdx), %zmm0, %zmm0
	vpaddd	40960576(%rbx,%rdx), %zmm1, %zmm1
	vpaddd	40960640(%rbx,%rdx), %zmm2, %zmm2
	vpaddd	40960704(%rbx,%rdx), %zmm3, %zmm3
	vpaddd	40960768(%rbx,%rdx), %zmm0, %zmm0
	vpaddd	40960832(%rbx,%rdx), %zmm1, %zmm1
	vpaddd	40960896(%rbx,%rdx), %zmm2, %zmm2
	vpaddd	40960960(%rbx,%rdx), %zmm3, %zmm3
	vpaddd	40961024(%rbx,%rdx), %zmm0, %zmm0
	vpaddd	40961088(%rbx,%rdx), %zmm1, %zmm1
	vpaddd	40961152(%rbx,%rdx), %zmm2, %zmm2
	vpaddd	40961216(%rbx,%rdx), %zmm3, %zmm3
	addq	$1280, %rdx                     # imm = 0x500
	jne	.LBB5_81
# %bb.82:                               # %middle.block477
	vpaddd	%zmm0, %zmm1, %zmm0
	vpaddd	%zmm0, %zmm2, %zmm0
	vpaddd	%zmm0, %zmm3, %zmm0
	vextracti64x4	$1, %zmm0, %ymm1
	vpaddd	%zmm1, %zmm0, %zmm0
	vextracti128	$1, %ymm0, %xmm1
	vpaddd	%xmm1, %xmm0, %xmm0
	vpshufd	$238, %xmm0, %xmm1              # xmm1 = xmm0[2,3,2,3]
	vpaddd	%xmm1, %xmm0, %xmm0
	vpshufd	$85, %xmm0, %xmm1               # xmm1 = xmm0[1,1,1,1]
	vpaddd	%xmm1, %xmm0, %xmm0
	vmovd	%xmm0, %ebp
	movzwl	%r15w, %edx
	vcvtsi2sd	%edx, %xmm4, %xmm0
	vmovsd	.LCPI5_0(%rip), %xmm3           # xmm3 = mem[0],zero
	vdivsd	%xmm3, %xmm0, %xmm0
	vcvtsi2sd	%r13, %xmm4, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	movzwl	%r12w, %edx
	vcvtsi2sd	%edx, %xmm4, %xmm1
	vdivsd	%xmm3, %xmm1, %xmm1
	vcvtsi2sdq	32(%rsp), %xmm4, %xmm2  # 8-byte Folded Reload
	vaddsd	%xmm2, %xmm1, %xmm1
	vsubsd	%xmm1, %xmm0, %xmm0
	vxorpd	%xmm1, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, 32(%rsp)                 # 8-byte Spill
	movzwl	%cx, %ecx
	vcvtsi2sd	%ecx, %xmm4, %xmm0
	vdivsd	%xmm3, %xmm0, %xmm0
	vcvtsi2sd	%rax, %xmm4, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, 24(%rsp)                 # 8-byte Spill
	leaq	8(%rsp), %rdi
	callq	ftime
	vcvtsi2sdq	8(%rsp), %xmm4, %xmm0
	movzwl	16(%rsp), %eax
	vcvtsi2sd	%eax, %xmm4, %xmm1
	vdivsd	.LCPI5_0(%rip), %xmm1, %xmm1
	vaddsd	%xmm0, %xmm1, %xmm0
	vsubsd	24(%rsp), %xmm0, %xmm0          # 8-byte Folded Reload
	vaddsd	.LCPI5_4, %xmm0, %xmm0
	vmovsd	%xmm0, 24(%rsp)                 # 8-byte Spill
	movq	%rbx, %rdi
	callq	print_vector
	movl	$.L.str.3, %edi
	callq	puts
	movl	$.L.str.4, %edi
	movl	%r14d, %esi
	xorl	%eax, %eax
	callq	printf
	movl	$.L.str.5, %edi
	callq	puts
	movl	$.L.str.6, %edi
	movl	%ebp, %esi
	xorl	%eax, %eax
	callq	printf
	vmovsd	.LCPI5_1(%rip), %xmm0           # xmm0 = mem[0],zero
	vmulsd	32(%rsp), %xmm0, %xmm1          # 8-byte Folded Reload
	vmovsd	.LCPI5_2(%rip), %xmm2           # xmm2 = mem[0],zero
	vdivsd	%xmm1, %xmm2, %xmm1
	vmovsd	%xmm1, 40(%rsp)                 # 8-byte Spill
	vmulsd	24(%rsp), %xmm0, %xmm0          # 8-byte Folded Reload
	vdivsd	%xmm0, %xmm2, %xmm0
	vmovsd	%xmm0, 48(%rsp)                 # 8-byte Spill
	movl	$.Lstr, %edi
	callq	puts
	movl	$.Lstr.13, %edi
	callq	puts
	movl	$.Lstr.14, %edi
	callq	puts
	vmovsd	32(%rsp), %xmm0                 # 8-byte Reload
                                        # xmm0 = mem[0],zero
	vdivsd	.LCPI5_3(%rip), %xmm0, %xmm0
	movl	$.L.str.10, %edi
	vmovsd	40(%rsp), %xmm1                 # 8-byte Reload
                                        # xmm1 = mem[0],zero
	movb	$2, %al
	callq	printf
	vmovsd	24(%rsp), %xmm0                 # 8-byte Reload
                                        # xmm0 = mem[0],zero
	vdivsd	.LCPI5_3(%rip), %xmm0, %xmm0
	movl	$.L.str.11, %edi
	vmovsd	48(%rsp), %xmm1                 # 8-byte Reload
                                        # xmm1 = mem[0],zero
	movb	$2, %al
	callq	printf
	subl	%r14d, %ebp
	movl	$.L.str.12, %edi
	movl	%ebp, %esi
	xorl	%eax, %eax
	callq	printf
	movq	%rbx, %rdi
	callq	free
	xorl	%eax, %eax
	addq	$56, %rsp
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
	.asciz	"=\n"
	.size	.L.str.3, 3

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"SIMD: %d\n"
	.size	.L.str.4, 10

	.type	.L.str.5,@object                # @.str.5
.L.str.5:
	.asciz	"---------------------------------"
	.size	.L.str.5, 34

	.type	.L.str.6,@object                # @.str.6
.L.str.6:
	.asciz	"Serial: %d\n"
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
	.asciz	"Correctness check: %d\n"
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
