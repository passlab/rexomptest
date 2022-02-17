	.text
	.intel_syntax noprefix
	.file	"sum.c"
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
	sub	rsp, 24
	.cfi_def_cfa_offset 32
	lea	rdi, [rsp + 8]
	call	ftime
	vcvtsi2sd	xmm0, xmm0, qword ptr [rsp + 8]
	movzx	eax, word ptr [rsp + 16]
	vcvtsi2sd	xmm1, xmm1, eax
	vdivsd	xmm1, xmm1, qword ptr [rip + .LCPI0_0]
	vaddsd	xmm0, xmm1, xmm0
	add	rsp, 24
	.cfi_def_cfa_offset 8
	ret
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
	push	r14
	.cfi_def_cfa_offset 16
	push	rbx
	.cfi_def_cfa_offset 24
	push	rax
	.cfi_def_cfa_offset 32
	.cfi_offset rbx, -24
	.cfi_offset r14, -16
	mov	r14, rdi
	xor	ebx, ebx
	.p2align	4, 0x90
.LBB1_1:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	call	rand
	vcvtsi2ss	xmm0, xmm1, eax
	vdivss	xmm0, xmm0, dword ptr [rip + .LCPI1_0]
	vmovss	dword ptr [r14 + 4*rbx], xmm0
	inc	rbx
	cmp	rbx, 120000
	jne	.LBB1_1
# %bb.2:                                # %for.cond.cleanup
	add	rsp, 8
	.cfi_def_cfa_offset 24
	pop	rbx
	.cfi_def_cfa_offset 16
	pop	r14
	.cfi_def_cfa_offset 8
	ret
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
	vxorps	xmm0, xmm0, xmm0
	mov	rax, -192
	vxorps	xmm1, xmm1, xmm1
	.p2align	4, 0x90
.LBB2_1:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	vaddps	zmm2, zmm0, zmmword ptr [rdi + 4*rax + 768]
	vaddps	zmm1, zmm1, zmm2
	vaddps	zmm2, zmm0, zmmword ptr [rdi + 4*rax + 832]
	vaddps	zmm1, zmm1, zmm2
	vaddps	zmm2, zmm0, zmmword ptr [rdi + 4*rax + 896]
	vaddps	zmm1, zmm1, zmm2
	vaddps	zmm2, zmm0, zmmword ptr [rdi + 4*rax + 960]
	vaddps	zmm1, zmm1, zmm2
	vaddps	zmm2, zmm0, zmmword ptr [rdi + 4*rax + 1024]
	vaddps	zmm1, zmm1, zmm2
	vaddps	zmm2, zmm0, zmmword ptr [rdi + 4*rax + 1088]
	vaddps	zmm1, zmm1, zmm2
	vaddps	zmm2, zmm0, zmmword ptr [rdi + 4*rax + 1152]
	vaddps	zmm1, zmm1, zmm2
	vaddps	zmm2, zmm0, zmmword ptr [rdi + 4*rax + 1216]
	vaddps	zmm1, zmm1, zmm2
	vaddps	zmm2, zmm0, zmmword ptr [rdi + 4*rax + 1280]
	vaddps	zmm1, zmm1, zmm2
	vaddps	zmm2, zmm0, zmmword ptr [rdi + 4*rax + 1344]
	vaddps	zmm1, zmm1, zmm2
	vaddps	zmm2, zmm0, zmmword ptr [rdi + 4*rax + 1408]
	vaddps	zmm1, zmm1, zmm2
	vaddps	zmm2, zmm0, zmmword ptr [rdi + 4*rax + 1472]
	vaddps	zmm1, zmm1, zmm2
	add	rax, 192
	cmp	rax, 119808
	jb	.LBB2_1
# %bb.2:                                # %for.end
	vextractf64x4	ymm0, zmm1, 1
	vaddps	ymm0, ymm1, ymm0
	vhaddps	ymm0, ymm0, ymm0
	vhaddps	ymm0, ymm0, ymm0
	vextractf128	xmm1, ymm0, 1
	vpermilpd	xmm1, xmm1, 1           # xmm1 = xmm1[1,0]
	vaddss	xmm0, xmm0, xmm1
	vzeroupper
	ret
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
	vxorps	xmm0, xmm0, xmm0
	mov	eax, 15
	.p2align	4, 0x90
.LBB3_1:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	vaddss	xmm0, xmm0, dword ptr [rdi + 4*rax - 60]
	vaddss	xmm0, xmm0, dword ptr [rdi + 4*rax - 56]
	vaddss	xmm0, xmm0, dword ptr [rdi + 4*rax - 52]
	vaddss	xmm0, xmm0, dword ptr [rdi + 4*rax - 48]
	vaddss	xmm0, xmm0, dword ptr [rdi + 4*rax - 44]
	vaddss	xmm0, xmm0, dword ptr [rdi + 4*rax - 40]
	vaddss	xmm0, xmm0, dword ptr [rdi + 4*rax - 36]
	vaddss	xmm0, xmm0, dword ptr [rdi + 4*rax - 32]
	vaddss	xmm0, xmm0, dword ptr [rdi + 4*rax - 28]
	vaddss	xmm0, xmm0, dword ptr [rdi + 4*rax - 24]
	vaddss	xmm0, xmm0, dword ptr [rdi + 4*rax - 20]
	vaddss	xmm0, xmm0, dword ptr [rdi + 4*rax - 16]
	vaddss	xmm0, xmm0, dword ptr [rdi + 4*rax - 12]
	vaddss	xmm0, xmm0, dword ptr [rdi + 4*rax - 8]
	vaddss	xmm0, xmm0, dword ptr [rdi + 4*rax - 4]
	vaddss	xmm0, xmm0, dword ptr [rdi + 4*rax]
	add	rax, 16
	cmp	rax, 120015
	jne	.LBB3_1
# %bb.2:                                # %for.cond.cleanup
	ret
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
	push	rbx
	.cfi_def_cfa_offset 16
	.cfi_offset rbx, -16
	mov	rbx, rdi
	mov	edi, 91
	call	putchar
	vmovss	xmm0, dword ptr [rbx]           # xmm0 = mem[0],zero,zero,zero
	vcvtss2sd	xmm0, xmm0, xmm0
	mov	edi, offset .L.str.1
	mov	al, 1
	call	printf
	vmovss	xmm0, dword ptr [rbx + 4]       # xmm0 = mem[0],zero,zero,zero
	vcvtss2sd	xmm0, xmm0, xmm0
	mov	edi, offset .L.str.1
	mov	al, 1
	call	printf
	vmovss	xmm0, dword ptr [rbx + 8]       # xmm0 = mem[0],zero,zero,zero
	vcvtss2sd	xmm0, xmm0, xmm0
	mov	edi, offset .L.str.1
	mov	al, 1
	call	printf
	vmovss	xmm0, dword ptr [rbx + 12]      # xmm0 = mem[0],zero,zero,zero
	vcvtss2sd	xmm0, xmm0, xmm0
	mov	edi, offset .L.str.1
	mov	al, 1
	call	printf
	vmovss	xmm0, dword ptr [rbx + 16]      # xmm0 = mem[0],zero,zero,zero
	vcvtss2sd	xmm0, xmm0, xmm0
	mov	edi, offset .L.str.1
	mov	al, 1
	call	printf
	vmovss	xmm0, dword ptr [rbx + 20]      # xmm0 = mem[0],zero,zero,zero
	vcvtss2sd	xmm0, xmm0, xmm0
	mov	edi, offset .L.str.1
	mov	al, 1
	call	printf
	vmovss	xmm0, dword ptr [rbx + 24]      # xmm0 = mem[0],zero,zero,zero
	vcvtss2sd	xmm0, xmm0, xmm0
	mov	edi, offset .L.str.1
	mov	al, 1
	call	printf
	vmovss	xmm0, dword ptr [rbx + 28]      # xmm0 = mem[0],zero,zero,zero
	vcvtss2sd	xmm0, xmm0, xmm0
	mov	edi, offset .L.str.1
	mov	al, 1
	call	printf
	mov	edi, offset .L.str.2
	pop	rbx
	.cfi_def_cfa_offset 8
	jmp	puts                            # TAILCALL
.Lfunc_end4:
	.size	print_vector, .Lfunc_end4-print_vector
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2                               # -- Begin function main
.LCPI5_0:
	.long	0x4d4ccccd                      # float 214748368
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI5_1:
	.quad	0x408f400000000000              # double 1000
	.quad	0x408f400000000000              # double 1000
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3
.LCPI5_2:
	.quad	0x41cdcd6500000000              # double 1.0E+9
.LCPI5_3:
	.quad	0x42f05ef39b200000              # double 2.88E+14
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
	sub	rsp, 104
	.cfi_def_cfa_offset 160
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov	edi, 480000
	call	malloc
	mov	rbx, rax
	xor	ebp, ebp
	xor	edi, edi
	call	time
	mov	edi, eax
	call	srand
	.p2align	4, 0x90
.LBB5_1:                                # %for.body.i
                                        # =>This Inner Loop Header: Depth=1
	call	rand
	vcvtsi2ss	xmm0, xmm1, eax
	vdivss	xmm0, xmm0, dword ptr [rip + .LCPI5_0]
	vmovss	dword ptr [rbx + 4*rbp], xmm0
	inc	rbp
	cmp	rbp, 120000
	jne	.LBB5_1
# %bb.2:                                # %init.exit
	lea	rdi, [rsp + 8]
	call	ftime
	mov	rax, qword ptr [rsp + 8]
	mov	qword ptr [rsp + 32], rax       # 8-byte Spill
	movzx	r15d, word ptr [rsp + 16]
	xor	eax, eax
	vxorps	xmm0, xmm0, xmm0
	.p2align	4, 0x90
.LBB5_3:                                # %for.body.i81.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_4 Depth 2
	mov	rcx, -192
	vxorps	xmm1, xmm1, xmm1
	.p2align	4, 0x90
.LBB5_4:                                # %for.body.i81
                                        #   Parent Loop BB5_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vaddps	zmm2, zmm0, zmmword ptr [rbx + 4*rcx + 768]
	vaddps	zmm1, zmm1, zmm2
	vaddps	zmm2, zmm0, zmmword ptr [rbx + 4*rcx + 832]
	vaddps	zmm1, zmm1, zmm2
	vaddps	zmm2, zmm0, zmmword ptr [rbx + 4*rcx + 896]
	vaddps	zmm1, zmm1, zmm2
	vaddps	zmm2, zmm0, zmmword ptr [rbx + 4*rcx + 960]
	vaddps	zmm1, zmm1, zmm2
	vaddps	zmm2, zmm0, zmmword ptr [rbx + 4*rcx + 1024]
	vaddps	zmm1, zmm1, zmm2
	vaddps	zmm2, zmm0, zmmword ptr [rbx + 4*rcx + 1088]
	vaddps	zmm1, zmm1, zmm2
	vaddps	zmm2, zmm0, zmmword ptr [rbx + 4*rcx + 1152]
	vaddps	zmm1, zmm1, zmm2
	vaddps	zmm2, zmm0, zmmword ptr [rbx + 4*rcx + 1216]
	vaddps	zmm1, zmm1, zmm2
	vaddps	zmm2, zmm0, zmmword ptr [rbx + 4*rcx + 1280]
	vaddps	zmm1, zmm1, zmm2
	vaddps	zmm2, zmm0, zmmword ptr [rbx + 4*rcx + 1344]
	vaddps	zmm1, zmm1, zmm2
	vaddps	zmm2, zmm0, zmmword ptr [rbx + 4*rcx + 1408]
	vaddps	zmm1, zmm1, zmm2
	vaddps	zmm2, zmm0, zmmword ptr [rbx + 4*rcx + 1472]
	vaddps	zmm1, zmm1, zmm2
	add	rcx, 192
	cmp	rcx, 119808
	jb	.LBB5_4
# %bb.5:                                # %sum.exit
                                        #   in Loop: Header=BB5_3 Depth=1
	inc	eax
	cmp	eax, 10000
	jne	.LBB5_3
# %bb.6:                                # %for.cond.cleanup
	vextractf64x4	ymm0, zmm1, 1
	vaddps	ymm0, ymm1, ymm0
	vhaddps	ymm0, ymm0, ymm0
	vhaddps	ymm0, ymm0, ymm0
	vmovups	ymmword ptr [rsp + 64], ymm0    # 32-byte Spill
	lea	rdi, [rsp + 8]
	vzeroupper
	call	ftime
	mov	rbp, qword ptr [rsp + 8]
	movzx	r14d, word ptr [rsp + 16]
	lea	rdi, [rsp + 8]
	call	ftime
	mov	r13, qword ptr [rsp + 8]
	movzx	r12d, word ptr [rsp + 16]
	xor	eax, eax
	.p2align	4, 0x90
.LBB5_7:                                # %for.body.i87.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_8 Depth 2
	vxorps	xmm0, xmm0, xmm0
	mov	ecx, 15
	.p2align	4, 0x90
.LBB5_8:                                # %for.body.i87
                                        #   Parent Loop BB5_7 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vaddss	xmm0, xmm0, dword ptr [rbx + 4*rcx - 60]
	vaddss	xmm0, xmm0, dword ptr [rbx + 4*rcx - 56]
	vaddss	xmm0, xmm0, dword ptr [rbx + 4*rcx - 52]
	vaddss	xmm0, xmm0, dword ptr [rbx + 4*rcx - 48]
	vaddss	xmm0, xmm0, dword ptr [rbx + 4*rcx - 44]
	vaddss	xmm0, xmm0, dword ptr [rbx + 4*rcx - 40]
	vaddss	xmm0, xmm0, dword ptr [rbx + 4*rcx - 36]
	vaddss	xmm0, xmm0, dword ptr [rbx + 4*rcx - 32]
	vaddss	xmm0, xmm0, dword ptr [rbx + 4*rcx - 28]
	vaddss	xmm0, xmm0, dword ptr [rbx + 4*rcx - 24]
	vaddss	xmm0, xmm0, dword ptr [rbx + 4*rcx - 20]
	vaddss	xmm0, xmm0, dword ptr [rbx + 4*rcx - 16]
	vaddss	xmm0, xmm0, dword ptr [rbx + 4*rcx - 12]
	vaddss	xmm0, xmm0, dword ptr [rbx + 4*rcx - 8]
	vaddss	xmm0, xmm0, dword ptr [rbx + 4*rcx - 4]
	vaddss	xmm0, xmm0, dword ptr [rbx + 4*rcx]
	add	rcx, 16
	cmp	rcx, 120015
	jne	.LBB5_8
# %bb.9:                                # %sum_serial.exit
                                        #   in Loop: Header=BB5_7 Depth=1
	inc	eax
	cmp	eax, 10000
	jne	.LBB5_7
# %bb.10:                               # %for.cond.cleanup11
	vmovss	dword ptr [rsp + 28], xmm0      # 4-byte Spill
	vmovd	xmm0, r14d
	vpinsrw	xmm0, xmm0, r15d, 1
	vpmovzxwd	xmm0, xmm0              # xmm0 = xmm0[0],zero,xmm0[1],zero,xmm0[2],zero,xmm0[3],zero
	vcvtdq2pd	xmm0, xmm0
	vdivpd	xmm0, xmm0, xmmword ptr [rip + .LCPI5_1]
	vmovupd	ymm2, ymmword ptr [rsp + 64]    # 32-byte Reload
	vextractf128	xmm1, ymm2, 1
	vpermilpd	xmm1, xmm1, 1           # xmm1 = xmm1[1,0]
	vaddss	xmm1, xmm2, xmm1
	vmovss	dword ptr [rsp + 64], xmm1      # 4-byte Spill
	vmovq	xmm1, qword ptr [rsp + 32]      # 8-byte Folded Reload
                                        # xmm1 = mem[0],zero
	vmovq	xmm2, rbp
	vpunpcklqdq	xmm1, xmm2, xmm1        # xmm1 = xmm2[0],xmm1[0]
	vcvtqq2pd	xmm1, xmm1
	vaddpd	xmm0, xmm0, xmm1
	vpermilpd	xmm1, xmm0, 1           # xmm1 = xmm0[1,0]
	vsubsd	xmm0, xmm0, xmm1
	vmovsd	qword ptr [rsp + 32], xmm0      # 8-byte Spill
	lea	rdi, [rsp + 8]
	vzeroupper
	call	ftime
	vmovq	xmm0, r13
	vmovq	xmm1, qword ptr [rsp + 8]       # xmm1 = mem[0],zero
	vpunpcklqdq	xmm0, xmm1, xmm0        # xmm0 = xmm1[0],xmm0[0]
	vcvtqq2pd	xmm0, xmm0
	vmovd	xmm1, dword ptr [rsp + 16]      # xmm1 = mem[0],zero,zero,zero
	vpinsrw	xmm1, xmm1, r12d, 1
	vpmovzxwd	xmm1, xmm1              # xmm1 = xmm1[0],zero,xmm1[1],zero,xmm1[2],zero,xmm1[3],zero
	vcvtdq2pd	xmm1, xmm1
	vdivpd	xmm1, xmm1, xmmword ptr [rip + .LCPI5_1]
	vaddpd	xmm0, xmm1, xmm0
	vpermilpd	xmm1, xmm0, 1           # xmm1 = xmm0[1,0]
	vsubsd	xmm0, xmm0, xmm1
	vmovsd	qword ptr [rsp + 40], xmm0      # 8-byte Spill
	mov	rdi, rbx
	call	print_vector
	mov	edi, offset .L.str.3
	call	puts
	vmovss	xmm0, dword ptr [rsp + 64]      # 4-byte Reload
                                        # xmm0 = mem[0],zero,zero,zero
	vcvtss2sd	xmm0, xmm0, xmm0
	mov	edi, offset .L.str.4
	mov	al, 1
	call	printf
	mov	edi, offset .L.str.5
	call	puts
	vmovss	xmm0, dword ptr [rsp + 28]      # 4-byte Reload
                                        # xmm0 = mem[0],zero,zero,zero
	vcvtss2sd	xmm0, xmm0, xmm0
	mov	edi, offset .L.str.6
	mov	al, 1
	call	printf
	vmovsd	xmm0, qword ptr [rip + .LCPI5_2] # xmm0 = mem[0],zero
	vmulsd	xmm1, xmm0, qword ptr [rsp + 32] # 8-byte Folded Reload
	vmovsd	xmm2, qword ptr [rip + .LCPI5_3] # xmm2 = mem[0],zero
	vdivsd	xmm1, xmm2, xmm1
	vmovsd	qword ptr [rsp + 48], xmm1      # 8-byte Spill
	vmulsd	xmm0, xmm0, qword ptr [rsp + 40] # 8-byte Folded Reload
	vdivsd	xmm0, xmm2, xmm0
	vmovsd	qword ptr [rsp + 56], xmm0      # 8-byte Spill
	mov	edi, offset .Lstr
	call	puts
	mov	edi, offset .Lstr.13
	call	puts
	mov	edi, offset .Lstr.14
	call	puts
	mov	edi, offset .L.str.10
	vmovsd	xmm0, qword ptr [rsp + 32]      # 8-byte Reload
                                        # xmm0 = mem[0],zero
	vmovsd	xmm1, qword ptr [rsp + 48]      # 8-byte Reload
                                        # xmm1 = mem[0],zero
	mov	al, 2
	call	printf
	mov	edi, offset .L.str.11
	vmovsd	xmm0, qword ptr [rsp + 40]      # 8-byte Reload
                                        # xmm0 = mem[0],zero
	vmovsd	xmm1, qword ptr [rsp + 56]      # 8-byte Reload
                                        # xmm1 = mem[0],zero
	mov	al, 2
	call	printf
	vmovss	xmm0, dword ptr [rsp + 28]      # 4-byte Reload
                                        # xmm0 = mem[0],zero,zero,zero
	vsubss	xmm0, xmm0, dword ptr [rsp + 64] # 4-byte Folded Reload
	vcvtss2sd	xmm0, xmm0, xmm0
	mov	edi, offset .L.str.12
	mov	al, 1
	call	printf
	mov	rdi, rbx
	call	free
	xor	eax, eax
	add	rsp, 104
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

	.ident	"clang version 11.1.0 (https://github.com/llvm/llvm-project 3a8282376b6c2bb65a3bb580c10d4da1296d8df1)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
