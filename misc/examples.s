	.file	"examples.c"
	.text
	.globl	max_bst
	.type	max_bst, @function
max_bst:
.LFB23:
	.cfi_startproc
	endbr64
	movl	$0, %eax
	testq	%rdi, %rdi
	je	.L1
.L3:
	movq	%rdi, %rax
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L3
	movq	(%rax), %rax
.L1:
	ret
	.cfi_endproc
.LFE23:
	.size	max_bst, .-max_bst
	.globl	max_btree
	.type	max_btree, @function
max_btree:
.LFB24:
	.cfi_startproc
	endbr64
	testq	%rdi, %rdi
	je	.L8
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movq	%rdi, %rbp
	movq	8(%rdi), %rdi
	call	max_btree
	movq	%rax, %rbx
	movq	16(%rbp), %rdi
	call	max_btree
	cmpq	%rax, %rbx
	cmovl	%rax, %rbx
	movq	0(%rbp), %rax
	cmpq	%rax, %rbx
	cmovge	%rbx, %rax
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L8:
	.cfi_restore 3
	.cfi_restore 6
	movabsq	$-9223372036854775808, %rax
	ret
	.cfi_endproc
.LFE24:
	.size	max_btree, .-max_btree
	.globl	collect_into
	.type	collect_into, @function
collect_into:
.LFB25:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	testq	%rdi, %rdi
	je	.L15
	movq	%rdi, %rbp
	movq	%rsi, %r12
	movq	%rdx, %rbx
	testq	%rdx, %rdx
	jle	.L15
	movq	8(%rdi), %rdi
	call	collect_into
	movq	%rax, %r13
	cmpq	%rax, %rbx
	je	.L13
	movq	0(%rbp), %rax
	movq	%rax, (%r12,%r13,8)
	subq	%r13, %rbx
	leaq	-1(%rbx), %rdx
	leaq	8(%r12,%r13,8), %rsi
	movq	16(%rbp), %rdi
	call	collect_into
	leaq	1(%r13,%rax), %r13
	jmp	.L13
.L15:
	movl	$0, %r13d
.L13:
	movq	%r13, %rax
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE25:
	.size	collect_into, .-collect_into
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%lx "
	.text
	.globl	main
	.type	main, @function
main:
.LFB26:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	subq	$432, %rsp
	.cfi_def_cfa_offset 464
	movq	%fs:40, %rax
	movq	%rax, 424(%rsp)
	xorl	%eax, %eax
	movq	$17, (%rsp)
	leaq	32(%rsp), %rax
	movq	%rax, 8(%rsp)
	leaq	224(%rsp), %rax
	movq	%rax, 16(%rsp)
	movq	$6, 32(%rsp)
	leaq	64(%rsp), %rax
	movq	%rax, 40(%rsp)
	leaq	160(%rsp), %rax
	movq	%rax, 48(%rsp)
	movq	$4, 64(%rsp)
	leaq	96(%rsp), %rax
	movq	%rax, 72(%rsp)
	leaq	128(%rsp), %rax
	movq	%rax, 80(%rsp)
	movq	$3, 96(%rsp)
	movq	$0, 104(%rsp)
	movq	$0, 112(%rsp)
	movq	$5, 128(%rsp)
	movq	$0, 136(%rsp)
	movq	$0, 144(%rsp)
	movq	$11, 160(%rsp)
	leaq	192(%rsp), %rax
	movq	%rax, 168(%rsp)
	movq	$0, 176(%rsp)
	movq	$8, 192(%rsp)
	movq	$0, 200(%rsp)
	movq	$0, 208(%rsp)
	movq	$24, 224(%rsp)
	leaq	256(%rsp), %rax
	movq	%rax, 232(%rsp)
	leaq	288(%rsp), %rax
	movq	%rax, 240(%rsp)
	movq	$19, 256(%rsp)
	movq	$0, 264(%rsp)
	movq	$0, 272(%rsp)
	movq	$40, 288(%rsp)
	movq	$0, 296(%rsp)
	leaq	320(%rsp), %rax
	movq	%rax, 304(%rsp)
	movq	$52, 320(%rsp)
	movq	$0, 328(%rsp)
	movq	$0, 336(%rsp)
	leaq	352(%rsp), %rbx
	movq	%rsp, %rdi
	movl	$8, %edx
	movq	%rbx, %rsi
	call	collect_into
	leaq	416(%rsp), %r12
	leaq	.LC0(%rip), %rbp
.L18:
	movq	(%rbx), %rdx
	movq	%rbp, %rsi
	movl	$1, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	addq	$8, %rbx
	cmpq	%r12, %rbx
	jne	.L18
	movq	424(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L22
	movl	$0, %eax
	addq	$432, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L22:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE26:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
