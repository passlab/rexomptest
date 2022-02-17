	.text
	.intel_syntax noprefix
	.file	"sum.c"
	.section	.rodata.cst8,"aM",@progbits,8

	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2                               # -- Begin function main
.LCPI2_0:
	.long	0x3f800000                      # float 1
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3
.LCPI2_1:
	.quad	0x408f400000000000              # double 1000
.LCPI2_2:
	.quad	0x41cdcd6500000000              # double 1.0E+9
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	push	rbp
	.cfi_def_cfa_offset 16
	push	r15
	.cfi_def_cfa_offset 24
	push	r14
	.cfi_def_cfa_offset 32
	push	r13
	.cfi_def_cfa_offset 40
	push	r12
	.cfi_def_cfa_offset 48
	push	rbx
	.cfi_def_cfa_offset 56
	sub	rsp, 88
	.cfi_def_cfa_offset 144
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov	eax, 10240
	cmp	edi, 2
	jl	.LBB2_2
# %bb.1:                                # %if.then
	mov	rdi, qword ptr [rsi + 8]
	xor	esi, esi
	mov	edx, 10
	call	strtol
.LBB2_2:                                # %if.end
	mov	qword ptr [rsp + 40], rax       # 8-byte Spill
                                        # kill: def $eax killed $eax killed $rax def $rax
	imul	eax, eax
	lea	ebx, [rax + 4*rax]
	mov	qword ptr [rsp + 8], rax        # 8-byte Spill
	lea	rbp, [4*rax]
	mov	rdi, rbp
	call	malloc
	mov	r14, rax
	shl	rbx, 2
	mov	rdi, rbx
	call	malloc
	mov	r12, rax
	mov	rdi, rbx
	call	malloc
	mov	rbx, rax
	mov	rdi, rbp
	call	malloc
	mov	r13, rax
	mov	rdi, rbp
	call	malloc
	mov	r8, qword ptr [rsp + 40]        # 8-byte Reload
	mov	qword ptr [rsp + 24], rax       # 8-byte Spill
	test	r8d, r8d
	mov	qword ptr [rsp + 32], r14       # 8-byte Spill
	jle	.LBB2_3
# %bb.4:                                # %for.cond18.preheader.lr.ph
	lea	eax, [r8 - 1]
	lea	ecx, [r8 + 1]
	mov	qword ptr [rsp + 80], rcx       # 8-byte Spill
	mov	ecx, 1
	sub	ecx, r8d
	mov	qword ptr [rsp + 72], rcx       # 8-byte Spill
	mov	rcx, r14
	add	rcx, 4
	mov	qword ptr [rsp + 64], rcx       # 8-byte Spill
	xor	ecx, ecx
	xor	edi, edi
	xor	edx, edx
	jmp	.LBB2_5
	.p2align	4, 0x90
.LBB2_23:                               # %for.inc69.loopexit
                                        #   in Loop: Header=BB2_5 Depth=1
	mov	rcx, qword ptr [rsp + 16]       # 8-byte Reload
	add	rcx, r10
	mov	r14, qword ptr [rsp + 32]       # 8-byte Reload
	mov	r8, qword ptr [rsp + 40]        # 8-byte Reload
.LBB2_24:                               # %for.inc69
                                        #   in Loop: Header=BB2_5 Depth=1
	inc	edi
	cmp	edi, r8d
	je	.LBB2_25
.LBB2_5:                                # %for.body21.lr.ph
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_15 Depth 2
	movsxd	r9, ecx
	mov	dword ptr [r14 + 4*r9], edx
	test	edi, edi
	je	.LBB2_7
# %bb.6:                                # %if.then25.peel
                                        #   in Loop: Header=BB2_5 Depth=1
	movsxd	rsi, edx
	mov	ebp, ecx
	sub	ebp, r8d
	mov	dword ptr [r12 + 4*rsi], ebp
	mov	dword ptr [rbx + 4*rsi], -1082130432
	inc	edx
.LBB2_7:                                # %if.end40.peel
                                        #   in Loop: Header=BB2_5 Depth=1
	lea	esi, [rdx + 1]
	movsxd	rbp, edx
	mov	dword ptr [r12 + 4*rbp], ecx
	mov	dword ptr [rbx + 4*rbp], 1082130432
	cmp	r8d, 2
	jl	.LBB2_9
# %bb.8:                                # %if.then49.peel
                                        #   in Loop: Header=BB2_5 Depth=1
	movsxd	rsi, esi
	lea	ebp, [rcx + 1]
	mov	dword ptr [r12 + 4*rsi], ebp
	mov	dword ptr [rbx + 4*rsi], -1082130432
	add	edx, 2
	mov	esi, edx
.LBB2_9:                                # %if.end55.peel
                                        #   in Loop: Header=BB2_5 Depth=1
	cmp	edi, eax
	jge	.LBB2_10
# %bb.11:                               # %if.then59.peel
                                        #   in Loop: Header=BB2_5 Depth=1
	movsxd	rdx, esi
	lea	esi, [r8 + rcx]
	mov	dword ptr [r12 + 4*rdx], esi
	mov	dword ptr [rbx + 4*rdx], -1082130432
	inc	edx
	jmp	.LBB2_12
	.p2align	4, 0x90
.LBB2_10:                               #   in Loop: Header=BB2_5 Depth=1
	mov	edx, esi
.LBB2_12:                               # %if.end66.peel
                                        #   in Loop: Header=BB2_5 Depth=1
	inc	r9
	cmp	r8d, 1
	jne	.LBB2_14
# %bb.13:                               #   in Loop: Header=BB2_5 Depth=1
	mov	rcx, r9
	jmp	.LBB2_24
	.p2align	4, 0x90
.LBB2_14:                               # %for.body21.preheader
                                        #   in Loop: Header=BB2_5 Depth=1
	mov	rsi, qword ptr [rsp + 80]       # 8-byte Reload
	lea	r14d, [rsi + rcx]
	mov	rsi, qword ptr [rsp + 72]       # 8-byte Reload
	lea	r11d, [rsi + rcx]
	mov	rsi, qword ptr [rsp + 64]       # 8-byte Reload
	mov	qword ptr [rsp + 16], r9        # 8-byte Spill
	lea	r8, [rsi + 4*r9]
	add	r8, -4
	xor	r9d, r9d
	jmp	.LBB2_15
	.p2align	4, 0x90
.LBB2_21:                               # %if.then59
                                        #   in Loop: Header=BB2_15 Depth=2
	movsxd	rdx, r15d
	add	r9d, r14d
	mov	dword ptr [r12 + 4*rdx], r9d
	mov	dword ptr [rbx + 4*rdx], -1082130432
	inc	edx
.LBB2_22:                               # %if.end66
                                        #   in Loop: Header=BB2_15 Depth=2
	mov	r9, r10
	cmp	eax, r10d
	je	.LBB2_23
.LBB2_15:                               # %for.body21
                                        #   Parent Loop BB2_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lea	r10, [r9 + 1]
	mov	dword ptr [r8 + 4*r9], edx
	test	edi, edi
	je	.LBB2_17
# %bb.16:                               # %if.then25
                                        #   in Loop: Header=BB2_15 Depth=2
	movsxd	rbp, edx
	lea	esi, [r11 + r9]
	mov	dword ptr [r12 + 4*rbp], esi
	mov	dword ptr [rbx + 4*rbp], -1082130432
	inc	edx
.LBB2_17:                               # %if.then33
                                        #   in Loop: Header=BB2_15 Depth=2
	movsxd	rsi, edx
	lea	ebp, [rcx + r9]
	mov	dword ptr [r12 + 4*rsi], ebp
	mov	dword ptr [rbx + 4*rsi], -1082130432
	lea	ebp, [rcx + r9]
	inc	ebp
	mov	dword ptr [r12 + 4*rsi + 4], ebp
	mov	dword ptr [rbx + 4*rsi + 4], 1082130432
	lea	r15d, [rdx + 2]
	cmp	r10d, eax
	jge	.LBB2_19
# %bb.18:                               # %if.then49
                                        #   in Loop: Header=BB2_15 Depth=2
	inc	edx
	movsxd	rsi, r15d
	lea	ebp, [rcx + r9]
	add	ebp, 2
	mov	dword ptr [r12 + 4*rsi], ebp
	mov	dword ptr [rbx + 4*rsi], -1082130432
	add	edx, 2
	mov	r15d, edx
.LBB2_19:                               # %if.end55
                                        #   in Loop: Header=BB2_15 Depth=2
	cmp	edi, eax
	jl	.LBB2_21
# %bb.20:                               #   in Loop: Header=BB2_15 Depth=2
	mov	edx, r15d
	jmp	.LBB2_22
.LBB2_25:                               # %for.end71.loopexit
	movsxd	rax, ecx
	jmp	.LBB2_26
.LBB2_3:
	xor	edx, edx
	xor	eax, eax
.LBB2_26:                               # %for.end71
	mov	dword ptr [r14 + 4*rax], edx
	mov	rcx, qword ptr [rsp + 8]        # 8-byte Reload
	test	ecx, ecx
	je	.LBB2_38
# %bb.27:                               # %for.body77.preheader
	cmp	ecx, 32
	jae	.LBB2_29
# %bb.28:
	xor	eax, eax
	jmp	.LBB2_37
.LBB2_29:                               # %vector.ph
	mov	eax, ecx
	and	eax, -32
	lea	rsi, [rax - 32]
	mov	rdx, rsi
	shr	rdx, 5
	inc	rdx
	mov	ecx, edx
	and	ecx, 7
	cmp	rsi, 224
	jae	.LBB2_31
# %bb.30:
	xor	esi, esi
	jmp	.LBB2_33
.LBB2_31:                               # %vector.ph.new
	lea	rdi, [r13 + 992]
	and	rdx, -8
	neg	rdx
	xor	esi, esi
	vbroadcastss	ymm0, dword ptr [rip + .LCPI2_0] # ymm0 = [1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0]
	.p2align	4, 0x90
.LBB2_32:                               # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vmovupd	ymmword ptr [rdi + 4*rsi - 992], ymm0
	vmovupd	ymmword ptr [rdi + 4*rsi - 960], ymm0
	vmovupd	ymmword ptr [rdi + 4*rsi - 928], ymm0
	vmovupd	ymmword ptr [rdi + 4*rsi - 896], ymm0
	vmovupd	ymmword ptr [rdi + 4*rsi - 864], ymm0
	vmovupd	ymmword ptr [rdi + 4*rsi - 832], ymm0
	vmovupd	ymmword ptr [rdi + 4*rsi - 800], ymm0
	vmovupd	ymmword ptr [rdi + 4*rsi - 768], ymm0
	vmovupd	ymmword ptr [rdi + 4*rsi - 736], ymm0
	vmovupd	ymmword ptr [rdi + 4*rsi - 704], ymm0
	vmovupd	ymmword ptr [rdi + 4*rsi - 672], ymm0
	vmovupd	ymmword ptr [rdi + 4*rsi - 640], ymm0
	vmovupd	ymmword ptr [rdi + 4*rsi - 608], ymm0
	vmovupd	ymmword ptr [rdi + 4*rsi - 576], ymm0
	vmovupd	ymmword ptr [rdi + 4*rsi - 544], ymm0
	vmovupd	ymmword ptr [rdi + 4*rsi - 512], ymm0
	vmovupd	ymmword ptr [rdi + 4*rsi - 480], ymm0
	vmovupd	ymmword ptr [rdi + 4*rsi - 448], ymm0
	vmovupd	ymmword ptr [rdi + 4*rsi - 416], ymm0
	vmovupd	ymmword ptr [rdi + 4*rsi - 384], ymm0
	vmovupd	ymmword ptr [rdi + 4*rsi - 352], ymm0
	vmovupd	ymmword ptr [rdi + 4*rsi - 320], ymm0
	vmovupd	ymmword ptr [rdi + 4*rsi - 288], ymm0
	vmovupd	ymmword ptr [rdi + 4*rsi - 256], ymm0
	vmovupd	ymmword ptr [rdi + 4*rsi - 224], ymm0
	vmovupd	ymmword ptr [rdi + 4*rsi - 192], ymm0
	vmovupd	ymmword ptr [rdi + 4*rsi - 160], ymm0
	vmovupd	ymmword ptr [rdi + 4*rsi - 128], ymm0
	vmovupd	ymmword ptr [rdi + 4*rsi - 96], ymm0
	vmovupd	ymmword ptr [rdi + 4*rsi - 64], ymm0
	vmovupd	ymmword ptr [rdi + 4*rsi - 32], ymm0
	vmovupd	ymmword ptr [rdi + 4*rsi], ymm0
	add	rsi, 256
	add	rdx, 8
	jne	.LBB2_32
.LBB2_33:                               # %middle.block.unr-lcssa
	test	rcx, rcx
	je	.LBB2_36
# %bb.34:                               # %vector.body.epil.preheader
	lea	rdx, [4*rsi + 96]
	add	rdx, r13
	neg	rcx
	vbroadcastss	ymm0, dword ptr [rip + .LCPI2_0] # ymm0 = [1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0]
	.p2align	4, 0x90
.LBB2_35:                               # %vector.body.epil
                                        # =>This Inner Loop Header: Depth=1
	vmovupd	ymmword ptr [rdx - 96], ymm0
	vmovupd	ymmword ptr [rdx - 64], ymm0
	vmovupd	ymmword ptr [rdx - 32], ymm0
	vmovupd	ymmword ptr [rdx], ymm0
	sub	rdx, -128
	inc	rcx
	jne	.LBB2_35
.LBB2_36:                               # %middle.block
	mov	rcx, qword ptr [rsp + 8]        # 8-byte Reload
	cmp	rax, rcx
	je	.LBB2_38
	.p2align	4, 0x90
.LBB2_37:                               # %for.body77
                                        # =>This Inner Loop Header: Depth=1
	mov	dword ptr [r13 + 4*rax], 1065353216
	inc	rax
	cmp	rcx, rax
	jne	.LBB2_37
.LBB2_38:                               # %for.end82
	lea	rdi, [rsp + 48]
	vzeroupper
	call	ftime
	mov	r11, qword ptr [rsp + 32]       # 8-byte Reload
	mov	rcx, qword ptr [rsp + 8]        # 8-byte Reload
	vcvtsi2sd	xmm0, xmm1, qword ptr [rsp + 48]
	movzx	eax, word ptr [rsp + 56]
	vcvtsi2sd	xmm1, xmm1, eax
	xor	r14d, r14d
	vdivsd	xmm1, xmm1, qword ptr [rip + .LCPI2_1]
	vaddsd	xmm0, xmm1, xmm0
	vmovsd	qword ptr [rsp + 16], xmm0      # 8-byte Spill
	mov	r15d, 0
	test	ecx, ecx
	mov	rdx, qword ptr [rsp + 24]       # 8-byte Reload
	je	.LBB2_57
# %bb.39:                               # %for.body87.preheader
	mov	ebp, dword ptr [r11]
	xor	r9d, r9d
	vxorpd	xmm0, xmm0, xmm0
	xor	r15d, r15d
	jmp	.LBB2_40
	.p2align	4, 0x90
.LBB2_41:                               #   in Loop: Header=BB2_40 Depth=1
	vxorpd	xmm1, xmm1, xmm1
.LBB2_56:                               # %simd.if.end
                                        #   in Loop: Header=BB2_40 Depth=1
	vmovss	dword ptr [rdx + 4*r9], xmm1
	mov	ebp, eax
	mov	r9, r8
	cmp	r8, rcx
	je	.LBB2_57
.LBB2_40:                               # %for.body87
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_47 Depth 2
                                        #     Child Loop BB2_50 Depth 2
                                        #     Child Loop BB2_53 Depth 2
	lea	r8, [r9 + 1]
	mov	eax, dword ptr [r11 + 4*r9 + 4]
	mov	r10d, eax
	sub	r10d, ebp
	jle	.LBB2_41
# %bb.42:                               # %omp.inner.for.cond.preheader
                                        #   in Loop: Header=BB2_40 Depth=1
	test	r10d, r10d
	je	.LBB2_43
# %bb.44:                               # %omp.inner.for.body.preheader
                                        #   in Loop: Header=BB2_40 Depth=1
	xor	edi, edi
	vxorpd	xmm1, xmm1, xmm1
	cmp	r10d, 32
	jb	.LBB2_49
# %bb.45:                               # %omp.inner.for.body.preheader
                                        #   in Loop: Header=BB2_40 Depth=1
	lea	ecx, [rax - 1]
	cmp	ecx, ebp
	jl	.LBB2_49
# %bb.46:                               # %vector.ph342
                                        #   in Loop: Header=BB2_40 Depth=1
	mov	edi, r10d
	and	edi, -32
	vxorpd	xmm1, xmm1, xmm1
	mov	ecx, edi
	mov	edx, ebp
	vxorps	xmm2, xmm2, xmm2
	vxorps	xmm3, xmm3, xmm3
	vxorps	xmm4, xmm4, xmm4
	.p2align	4, 0x90
.LBB2_47:                               # %vector.body338
                                        #   Parent Loop BB2_40 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movsxd	rdx, edx
	vmovups	ymm5, ymmword ptr [r12 + 4*rdx]
	vmovups	ymm6, ymmword ptr [r12 + 4*rdx + 32]
	vmovups	ymm7, ymmword ptr [r12 + 4*rdx + 64]
	vmovups	ymm8, ymmword ptr [r12 + 4*rdx + 96]
	kxnorw	k1, k0, k0
	vgatherdps	ymm9 {k1}, ymmword ptr [r13 + 4*ymm5]
	kxnorw	k1, k0, k0
	vgatherdps	ymm5 {k1}, ymmword ptr [r13 + 4*ymm6]
	kxnorw	k1, k0, k0
	vgatherdps	ymm6 {k1}, ymmword ptr [r13 + 4*ymm7]
	kxnorw	k1, k0, k0
	vgatherdps	ymm7 {k1}, ymmword ptr [r13 + 4*ymm8]
	vmulps	ymm8, ymm9, ymmword ptr [rbx + 4*rdx]
	vaddps	ymm1, ymm8, ymm1
	vmulps	ymm5, ymm5, ymmword ptr [rbx + 4*rdx + 32]
	vaddps	ymm2, ymm2, ymm5
	vmulps	ymm5, ymm6, ymmword ptr [rbx + 4*rdx + 64]
	vaddps	ymm3, ymm3, ymm5
	vmulps	ymm5, ymm7, ymmword ptr [rbx + 4*rdx + 96]
	vaddps	ymm4, ymm4, ymm5
	add	edx, 32
	add	ecx, -32
	jne	.LBB2_47
# %bb.48:                               # %middle.block336
                                        #   in Loop: Header=BB2_40 Depth=1
	vaddps	ymm1, ymm2, ymm1
	vaddps	ymm1, ymm3, ymm1
	vaddps	ymm1, ymm4, ymm1
	vaddss	xmm2, xmm1, xmm0
	vmovshdup	xmm3, xmm1              # xmm3 = xmm1[1,1,3,3]
	vaddss	xmm2, xmm2, xmm3
	vpermilpd	xmm3, xmm1, 1           # xmm3 = xmm1[1,0]
	vaddss	xmm2, xmm2, xmm3
	vpermilps	xmm3, xmm1, 231         # xmm3 = xmm1[3,1,2,3]
	vaddss	xmm2, xmm2, xmm3
	vextractf128	xmm1, ymm1, 1
	vaddss	xmm2, xmm2, xmm1
	vmovshdup	xmm3, xmm1              # xmm3 = xmm1[1,1,3,3]
	vaddss	xmm2, xmm2, xmm3
	vpermilpd	xmm3, xmm1, 1           # xmm3 = xmm1[1,0]
	vaddss	xmm2, xmm2, xmm3
	vpermilps	xmm1, xmm1, 231         # xmm1 = xmm1[3,1,2,3]
	vaddss	xmm1, xmm2, xmm1
	cmp	r10d, edi
	je	.LBB2_54
.LBB2_49:                               # %omp.inner.for.body.preheader389
                                        #   in Loop: Header=BB2_40 Depth=1
	mov	ecx, ebp
	not	ecx
	add	ecx, eax
	sub	ecx, edi
	mov	edx, r10d
	and	edx, 3
	je	.LBB2_51
	.p2align	4, 0x90
.LBB2_50:                               # %omp.inner.for.body.prol
                                        #   Parent Loop BB2_40 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lea	esi, [rdi + rbp]
	movsxd	rsi, esi
	vmovss	xmm2, dword ptr [rbx + 4*rsi]   # xmm2 = mem[0],zero,zero,zero
	movsxd	rsi, dword ptr [r12 + 4*rsi]
	vmulss	xmm2, xmm2, dword ptr [r13 + 4*rsi]
	vaddss	xmm1, xmm1, xmm2
	inc	edi
	dec	edx
	jne	.LBB2_50
.LBB2_51:                               # %omp.inner.for.body.prol.loopexit
                                        #   in Loop: Header=BB2_40 Depth=1
	cmp	ecx, 3
	jb	.LBB2_54
# %bb.52:                               # %omp.inner.for.body.preheader416
                                        #   in Loop: Header=BB2_40 Depth=1
	add	edi, ebp
	.p2align	4, 0x90
.LBB2_53:                               # %omp.inner.for.body
                                        #   Parent Loop BB2_40 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movsxd	rdi, edi
	vmovss	xmm2, dword ptr [rbx + 4*rdi]   # xmm2 = mem[0],zero,zero,zero
	movsxd	rcx, dword ptr [r12 + 4*rdi]
	vmulss	xmm2, xmm2, dword ptr [r13 + 4*rcx]
	vaddss	xmm1, xmm1, xmm2
	lea	ecx, [rdi + 1]
	movsxd	rcx, ecx
	vmovss	xmm2, dword ptr [rbx + 4*rcx]   # xmm2 = mem[0],zero,zero,zero
	movsxd	rcx, dword ptr [r12 + 4*rcx]
	vmulss	xmm2, xmm2, dword ptr [r13 + 4*rcx]
	lea	ecx, [rdi + 2]
	movsxd	rcx, ecx
	vmovss	xmm3, dword ptr [rbx + 4*rcx]   # xmm3 = mem[0],zero,zero,zero
	movsxd	rcx, dword ptr [r12 + 4*rcx]
	vmulss	xmm3, xmm3, dword ptr [r13 + 4*rcx]
	vaddss	xmm1, xmm1, xmm2
	vaddss	xmm1, xmm1, xmm3
	lea	ecx, [rdi + 3]
	movsxd	rcx, ecx
	vmovss	xmm2, dword ptr [rbx + 4*rcx]   # xmm2 = mem[0],zero,zero,zero
	movsxd	rcx, dword ptr [r12 + 4*rcx]
	vmulss	xmm2, xmm2, dword ptr [r13 + 4*rcx]
	vaddss	xmm1, xmm1, xmm2
	add	edi, 4
	cmp	eax, edi
	jne	.LBB2_53
.LBB2_54:                               # %omp.inner.for.end.loopexit
                                        #   in Loop: Header=BB2_40 Depth=1
	add	r10d, r10d
	mov	rcx, qword ptr [rsp + 8]        # 8-byte Reload
	mov	rdx, qword ptr [rsp + 24]       # 8-byte Reload
	jmp	.LBB2_55
.LBB2_43:                               #   in Loop: Header=BB2_40 Depth=1
	xor	r10d, r10d
	vxorpd	xmm1, xmm1, xmm1
.LBB2_55:                               # %omp.inner.for.end
                                        #   in Loop: Header=BB2_40 Depth=1
	vaddss	xmm1, xmm1, xmm0
	add	r15d, r10d
	jmp	.LBB2_56
.LBB2_57:                               # %for.end132
	lea	rdi, [rsp + 48]
	vzeroupper
	call	ftime
	vcvtsi2sd	xmm0, xmm10, qword ptr [rsp + 48]
	movzx	eax, word ptr [rsp + 56]
	vcvtsi2sd	xmm1, xmm10, eax
	vdivsd	xmm1, xmm1, qword ptr [rip + .LCPI2_1]
	vaddsd	xmm0, xmm1, xmm0
	vsubsd	xmm0, xmm0, qword ptr [rsp + 16] # 8-byte Folded Reload
	vcvtsi2sd	xmm1, xmm10, r15d
	vmulsd	xmm2, xmm0, qword ptr [rip + .LCPI2_2]
	vdivsd	xmm1, xmm1, xmm2
	vmovsd	qword ptr [rsp + 16], xmm1      # 8-byte Spill
	mov	edi, offset .L.str.3
	mov	al, 1
	call	printf
	mov	edi, offset .L.str.4
	vmovq	xmm0, qword ptr [rsp + 16]      # 8-byte Folded Reload
                                        # xmm0 = mem[0],zero
	mov	al, 1
	call	printf
	mov	rbp, qword ptr [rsp + 24]       # 8-byte Reload
	mov	rdx, qword ptr [rsp + 8]        # 8-byte Reload
	test	edx, edx
	je	.LBB2_69
# %bb.58:                               # %for.body143.preheader
	cmp	edx, 32
	jae	.LBB2_60
# %bb.59:
	xor	eax, eax
	xor	r14d, r14d
	jmp	.LBB2_67
.LBB2_60:                               # %vector.ph368
	mov	eax, edx
	and	eax, -32
	lea	rdx, [rax - 32]
	mov	rcx, rdx
	shr	rcx, 5
	inc	rcx
	test	rdx, rdx
	je	.LBB2_61
# %bb.62:                               # %vector.ph368.new
	mov	rsi, rcx
	and	rsi, -2
	neg	rsi
	vxorps	xmm4, xmm4, xmm4
	xor	edx, edx
	vpxor	xmm0, xmm0, xmm0
	vxorpd	xmm1, xmm1, xmm1
	vxorpd	xmm2, xmm2, xmm2
	vxorps	xmm3, xmm3, xmm3
	.p2align	4, 0x90
.LBB2_63:                               # %vector.body366
                                        # =>This Inner Loop Header: Depth=1
	vmovups	ymm5, ymmword ptr [rbp + 4*rdx]
	vmovups	ymm6, ymmword ptr [rbp + 4*rdx + 32]
	vmovups	ymm7, ymmword ptr [rbp + 4*rdx + 64]
	vmovups	ymm8, ymmword ptr [rbp + 4*rdx + 96]
	vcmpltps	ymm5, ymm5, ymm4
	vpsubd	ymm0, ymm0, ymm5
	vcmpltps	ymm5, ymm6, ymm4
	vpsubd	ymm1, ymm1, ymm5
	vcmpltps	ymm5, ymm7, ymm4
	vpsubd	ymm2, ymm2, ymm5
	vcmpltps	ymm5, ymm8, ymm4
	vpsubd	ymm3, ymm3, ymm5
	vmovups	ymm5, ymmword ptr [rbp + 4*rdx + 128]
	vmovups	ymm6, ymmword ptr [rbp + 4*rdx + 160]
	vmovups	ymm7, ymmword ptr [rbp + 4*rdx + 192]
	vmovups	ymm8, ymmword ptr [rbp + 4*rdx + 224]
	vcmpltps	ymm5, ymm5, ymm4
	vpsubd	ymm0, ymm0, ymm5
	vcmpltps	ymm5, ymm6, ymm4
	vpsubd	ymm1, ymm1, ymm5
	vcmpltps	ymm5, ymm7, ymm4
	vpsubd	ymm2, ymm2, ymm5
	vcmpltps	ymm5, ymm8, ymm4
	vpsubd	ymm3, ymm3, ymm5
	add	rdx, 64
	add	rsi, 2
	jne	.LBB2_63
# %bb.64:                               # %middle.block364.unr-lcssa
	test	cl, 1
	je	.LBB2_66
.LBB2_65:                               # %vector.body366.epil
	vmovups	ymm4, ymmword ptr [rbp + 4*rdx]
	vmovups	ymm5, ymmword ptr [rbp + 4*rdx + 32]
	vmovups	ymm6, ymmword ptr [rbp + 4*rdx + 64]
	vmovups	ymm7, ymmword ptr [rbp + 4*rdx + 96]
	vxorps	xmm8, xmm8, xmm8
	vcmpltps	ymm7, ymm7, ymm8
	vpsubd	ymm3, ymm3, ymm7
	vcmpltps	ymm6, ymm6, ymm8
	vpsubd	ymm2, ymm2, ymm6
	vcmpltps	ymm5, ymm5, ymm8
	vpsubd	ymm1, ymm1, ymm5
	vcmpltps	ymm4, ymm4, ymm8
	vpsubd	ymm0, ymm0, ymm4
.LBB2_66:                               # %middle.block364
	vpaddd	ymm1, ymm1, ymm3
	vpaddd	ymm0, ymm0, ymm2
	vpaddd	ymm0, ymm0, ymm1
	vextracti128	xmm1, ymm0, 1
	vpaddd	xmm0, xmm0, xmm1
	vpshufd	xmm1, xmm0, 78                  # xmm1 = xmm0[2,3,0,1]
	vpaddd	xmm0, xmm0, xmm1
	vpshufd	xmm1, xmm0, 229                 # xmm1 = xmm0[1,1,2,3]
	vpaddd	xmm0, xmm0, xmm1
	vmovd	r14d, xmm0
	mov	rdx, qword ptr [rsp + 8]        # 8-byte Reload
	cmp	rax, rdx
	je	.LBB2_69
.LBB2_67:                               # %for.body143.preheader388
	vpxor	xmm0, xmm0, xmm0
	.p2align	4, 0x90
.LBB2_68:                               # %for.body143
                                        # =>This Inner Loop Header: Depth=1
	xor	ecx, ecx
	vucomiss	xmm0, dword ptr [rbp + 4*rax]
	seta	cl
	add	r14d, ecx
	inc	rax
	cmp	rdx, rax
	jne	.LBB2_68
.LBB2_69:                               # %for.end154
	mov	edi, offset .L.str.5
	mov	esi, r14d
                                        # kill: def $edx killed $edx killed $rdx
	xor	eax, eax
	vzeroupper
	call	printf
	mov	rdi, qword ptr [rsp + 32]       # 8-byte Reload
	call	free
	mov	rdi, r12
	call	free
	mov	rdi, rbx
	call	free
	mov	rdi, r13
	call	free
	mov	rdi, rbp
	call	free
	xor	eax, eax
	add	rsp, 88
	.cfi_def_cfa_offset 56
	pop	rbx
	.cfi_def_cfa_offset 48
	pop	r12
	.cfi_def_cfa_offset 40
	pop	r13
	.cfi_def_cfa_offset 32
	pop	r14
	.cfi_def_cfa_offset 24
	pop	r15
	.cfi_def_cfa_offset 16
	pop	rbp
	.cfi_def_cfa_offset 8
	ret
.LBB2_61:
	.cfi_def_cfa_offset 144
	vpxor	xmm0, xmm0, xmm0
	xor	edx, edx
	vxorpd	xmm1, xmm1, xmm1
	vxorpd	xmm2, xmm2, xmm2
	vxorps	xmm3, xmm3, xmm3
	test	cl, 1
	jne	.LBB2_65
	jmp	.LBB2_66
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
	.asciz	"GFlops: %.4f\n"
	.size	.L.str.4, 14

	.type	.L.str.5,@object                # @.str.5
.L.str.5:
	.asciz	"%d errors out of %d\n"
	.size	.L.str.5, 21

	.ident	"clang version 11.1.0 (https://github.com/llvm/llvm-project 3a8282376b6c2bb65a3bb580c10d4da1296d8df1)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
