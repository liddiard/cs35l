	.file	"thttpd.c"
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.text
.Ltext0:
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"throttle #%d '%.80s' rate %ld greatly exceeding limit %ld; %d sending"
	.align 8
.LC1:
	.string	"throttle #%d '%.80s' rate %ld exceeding limit %ld; %d sending"
	.align 8
.LC2:
	.string	"throttle #%d '%.80s' rate %ld lower than minimum %ld; %d sending"
	.text
	.p2align 4,,15
	.type	update_throttles, @function
update_throttles:
.LFB63:
	.file 1 "thttpd.c"
	.loc 1 1933 0
	.cfi_startproc
.LVL0:
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	subq	$16, %rsp
	.cfi_def_cfa_offset 48
	.loc 1 1942 0
	movl	numthrottles(%rip), %edx
	testl	%edx, %edx
	jle	.L2
	xorl	%ebp, %ebp
	xorl	%ebx, %ebx
	.loc 1 1944 0
	movabsq	$6148914691236517206, %r12
	jmp	.L6
.LVL1:
	.p2align 4,,10
	.p2align 3
.L5:
	.loc 1 1942 0
	addl	$1, %ebx
.LVL2:
	addq	$48, %rbp
	cmpl	%ebx, numthrottles(%rip)
	jle	.L2
.LVL3:
.L6:
	.loc 1 1944 0
	movq	%rbp, %rcx
	addq	throttles(%rip), %rcx
	movq	32(%rcx), %rax
	.loc 1 1947 0
	movq	8(%rcx), %r9
	.loc 1 1945 0
	movq	$0, 32(%rcx)
	.loc 1 1944 0
	movq	%rax, %rdx
	shrq	$63, %rdx
	leaq	(%rdx,%rax), %rax
	movq	24(%rcx), %rdx
	sarq	%rax
	leaq	(%rax,%rdx,2), %rsi
	movq	%rsi, %rax
	sarq	$63, %rsi
	imulq	%r12
	subq	%rsi, %rdx
	.loc 1 1947 0
	cmpq	%r9, %rdx
	.loc 1 1944 0
	movq	%rdx, 24(%rcx)
	.loc 1 1947 0
	jle	.L3
	movl	40(%rcx), %eax
	testl	%eax, %eax
	je	.L3
	.loc 1 1949 0
	leaq	(%r9,%r9), %rsi
	cmpq	%rsi, %rdx
	jle	.L4
	.loc 1 1950 0
	movl	%eax, (%rsp)
	movq	(%rcx), %rcx
	movq	%rdx, %r8
	movl	$.LC0, %esi
	movl	%ebx, %edx
	movl	$5, %edi
.LVL4:
.L16:
	.loc 1 1952 0
	xorl	%eax, %eax
	call	syslog
	movq	%rbp, %rcx
	addq	throttles(%rip), %rcx
	movq	24(%rcx), %rdx
.LVL5:
.L3:
	.loc 1 1954 0
	movq	16(%rcx), %r9
	cmpq	%r9, %rdx
	jge	.L5
	movl	40(%rcx), %eax
	testl	%eax, %eax
	je	.L5
	.loc 1 1956 0
	movl	%eax, (%rsp)
	movq	(%rcx), %rcx
	movq	%rdx, %r8
	xorl	%eax, %eax
	movl	%ebx, %edx
	movl	$.LC2, %esi
	movl	$5, %edi
.LVL6:
	.loc 1 1942 0
	addl	$1, %ebx
	addq	$48, %rbp
	.loc 1 1956 0
	call	syslog
.LVL7:
	.loc 1 1942 0
	cmpl	%ebx, numthrottles(%rip)
	jg	.L6
.LVL8:
	.p2align 4,,10
	.p2align 3
.L2:
	.loc 1 1963 0
	movl	max_connects(%rip), %r10d
	testl	%r10d, %r10d
	jle	.L13
	movq	throttles(%rip), %r9
	movq	connects(%rip), %rbx
	xorl	%ebp, %ebp
	jmp	.L12
.LVL9:
	.p2align 4,,10
	.p2align 3
.L8:
	addl	$1, %ebp
.LVL10:
	addq	$144, %rbx
	cmpl	%r10d, %ebp
	je	.L13
.LVL11:
.L12:
	.loc 1 1966 0
	movl	(%rbx), %eax
	subl	$2, %eax
	cmpl	$1, %eax
	ja	.L8
	.loc 1 1969 0
	movl	56(%rbx), %eax
	.loc 1 1968 0
	movq	$-1, 64(%rbx)
.LVL12:
	.loc 1 1969 0
	testl	%eax, %eax
	jle	.L8
	movl	56(%rbx), %r8d
	movq	%rbx, %rdi
.LVL13:
	movq	$-1, %rcx
	xorl	%esi, %esi
	jmp	.L11
.LVL14:
	.p2align 4,,10
	.p2align 3
.L9:
	.loc 1 1976 0
	cmpq	%rax, %rcx
	cmovg	%rax, %rcx
	movq	%rcx, 64(%rbx)
.L10:
	.loc 1 1969 0
	addl	$1, %esi
.LVL15:
	addq	$4, %rdi
.LVL16:
	cmpl	%esi, %r8d
	jle	.L8
	movq	64(%rbx), %rcx
.LVL17:
.L11:
	.loc 1 1972 0
	movslq	16(%rdi), %rax
	leaq	(%rax,%rax,2), %rax
	salq	$4, %rax
	leaq	(%r9,%rax), %rax
	movslq	40(%rax), %r11
	movq	8(%rax), %rdx
	movq	%rdx, %rax
	sarq	$63, %rdx
	idivq	%r11
.LVL18:
	.loc 1 1973 0
	cmpq	$-1, %rcx
	jne	.L9
	.loc 1 1974 0
	movq	%rax, 64(%rbx)
	jmp	.L10
.LVL19:
	.p2align 4,,10
	.p2align 3
.L4:
	.loc 1 1952 0
	movl	%eax, (%rsp)
	movq	%rdx, %r8
	movq	(%rcx), %rcx
	movl	%ebx, %edx
	movl	$.LC1, %esi
	movl	$6, %edi
.LVL20:
	jmp	.L16
.LVL21:
	.p2align 4,,10
	.p2align 3
.L13:
	.loc 1 1980 0
	addq	$16, %rsp
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE63:
	.size	update_throttles, .-update_throttles
	.section	.rodata.str1.8
	.align 8
.LC3:
	.string	"%s: no value required for %s option\n"
	.text
	.p2align 4,,15
	.type	no_value_required, @function
no_value_required:
.LFB52:
	.loc 1 1207 0
	.cfi_startproc
.LVL22:
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	.loc 1 1208 0
	testq	%rsi, %rsi
	jne	.L21
	.loc 1 1215 0
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L21:
	.cfi_restore_state
	.loc 1 1210 0
	movq	%rdi, %rcx
	movq	argv0(%rip), %rdx
	movq	stderr(%rip), %rdi
.LVL23:
	movl	$.LC3, %esi
.LVL24:
	xorl	%eax, %eax
	call	fprintf
.LVL25:
	.loc 1 1213 0
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE52:
	.size	no_value_required, .-no_value_required
	.section	.rodata.str1.8
	.align 8
.LC4:
	.string	"%s: value required for %s option\n"
	.text
	.p2align 4,,15
	.type	value_required, @function
value_required:
.LFB51:
	.loc 1 1195 0
	.cfi_startproc
.LVL26:
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	.loc 1 1196 0
	testq	%rsi, %rsi
	je	.L25
	.loc 1 1202 0
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L25:
	.cfi_restore_state
	.loc 1 1198 0
	movq	%rdi, %rcx
	movq	argv0(%rip), %rdx
	movq	stderr(%rip), %rdi
.LVL27:
	movl	$.LC4, %esi
.LVL28:
	xorl	%eax, %eax
	call	fprintf
.LVL29:
	.loc 1 1200 0
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE51:
	.size	value_required, .-value_required
	.section	.rodata.str1.8
	.align 8
.LC5:
	.string	"usage:  %s [-C configfile] [-p port] [-d dir] [-r|-nor] [-dd data_dir] [-s|-nos] [-v|-nov] [-g|-nog] [-u user] [-c cgipat] [-t throttles] [-h host] [-l logfile] [-i pidfile] [-T charset] [-P P3P] [-M maxage] [-V] [-D]\n"
	.text
	.p2align 4,,15
	.type	usage, @function
usage:
.LFB49:
	.loc 1 990 0
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	.loc 1 991 0
	movq	stderr(%rip), %rdi
	movq	argv0(%rip), %rdx
	movl	$.LC5, %esi
	xorl	%eax, %eax
	call	fprintf
	.loc 1 994 0
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE49:
	.size	usage, .-usage
	.p2align 4,,15
	.type	wakeup_connection, @function
wakeup_connection:
.LFB68:
	.loc 1 2105 0
	.cfi_startproc
.LVL30:
	.loc 1 2110 0
	cmpl	$3, (%rdi)
	.loc 1 2109 0
	movq	$0, 96(%rdi)
	.loc 1 2110 0
	je	.L31
	rep
	ret
	.p2align 4,,10
	.p2align 3
.L31:
	.loc 1 2113 0
	movq	8(%rdi), %rax
	.loc 1 2112 0
	movl	$2, (%rdi)
	.loc 1 2113 0
	movq	%rdi, %rsi
.LVL31:
	movl	$1, %edx
	movl	704(%rax), %eax
	movl	%eax, %edi
.LVL32:
	jmp	fdwatch_add_fd
	.cfi_endproc
.LFE68:
	.size	wakeup_connection, .-wakeup_connection
	.p2align 4,,15
	.type	handle_hup, @function
handle_hup:
.LFB42:
	.loc 1 238 0
	.cfi_startproc
.LVL33:
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	.loc 1 239 0
	call	__errno_location
.LVL34:
	movl	(%rax), %edx
.LVL35:
	.loc 1 247 0
	movl	$1, got_hup(%rip)
	.loc 1 250 0
	movl	%edx, (%rax)
	.loc 1 251 0
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE42:
	.size	handle_hup, .-handle_hup
	.section	.rodata.str1.8
	.align 8
.LC6:
	.string	"out of memory copying a string"
	.align 8
.LC7:
	.string	"%s: out of memory copying a string\n"
	.text
	.p2align 4,,15
	.type	e_strdup, @function
e_strdup:
.LFB53:
	.loc 1 1220 0
	.cfi_startproc
.LVL36:
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	.loc 1 1223 0
	call	__strdup
.LVL37:
	.loc 1 1224 0
	testq	%rax, %rax
	je	.L37
	.loc 1 1231 0
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L37:
	.cfi_restore_state
	.loc 1 1226 0
	movl	$.LC6, %esi
	movl	$2, %edi
	call	syslog
.LVL38:
	.loc 1 1227 0
	movq	stderr(%rip), %rdi
	movq	argv0(%rip), %rdx
	movl	$.LC7, %esi
	xorl	%eax, %eax
	call	fprintf
	.loc 1 1228 0
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE53:
	.size	e_strdup, .-e_strdup
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC8:
	.string	"r"
.LC9:
	.string	" \t\n\r"
.LC10:
	.string	"debug"
.LC11:
	.string	"port"
.LC12:
	.string	"dir"
.LC13:
	.string	"chroot"
.LC14:
	.string	"nochroot"
.LC15:
	.string	"data_dir"
.LC16:
	.string	"symlink"
.LC17:
	.string	"nosymlink"
.LC18:
	.string	"symlinks"
.LC19:
	.string	"nosymlinks"
.LC20:
	.string	"user"
.LC21:
	.string	"cgipat"
.LC22:
	.string	"cgilimit"
.LC23:
	.string	"urlpat"
.LC24:
	.string	"noemptyreferers"
.LC25:
	.string	"localpat"
.LC26:
	.string	"throttles"
.LC27:
	.string	"host"
.LC28:
	.string	"logfile"
.LC29:
	.string	"vhost"
.LC30:
	.string	"novhost"
.LC31:
	.string	"globalpasswd"
.LC32:
	.string	"noglobalpasswd"
.LC33:
	.string	"pidfile"
.LC34:
	.string	"charset"
.LC35:
	.string	"p3p"
.LC36:
	.string	"max_age"
	.section	.rodata.str1.8
	.align 8
.LC37:
	.string	"%s: unknown config option '%s'\n"
	.text
	.p2align 4,,15
	.type	read_config, @function
read_config:
.LFB50:
	.loc 1 1000 0
	.cfi_startproc
.LVL39:
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	.loc 1 1008 0
	movl	$.LC8, %esi
	.loc 1 1000 0
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movq	%rdi, %rbx
	subq	$10016, %rsp
	.cfi_def_cfa_offset 10064
	.loc 1 1000 0
	movq	%fs:40, %rax
	movq	%rax, 10008(%rsp)
	xorl	%eax, %eax
	.loc 1 1008 0
	call	fopen
.LVL40:
	.loc 1 1009 0
	testq	%rax, %rax
	.loc 1 1008 0
	movq	%rax, %r12
.LVL41:
	.loc 1 1009 0
	je	.L82
	movq	%rsp, %rbp
.LVL42:
	.p2align 4,,10
	.p2align 3
.L81:
	.loc 1 1015 0
	movq	%r12, %rdx
	movl	$10000, %esi
	movq	%rsp, %rdi
	call	fgets
	testq	%rax, %rax
	je	.L85
	.loc 1 1018 0
	movl	$35, %esi
	movq	%rsp, %rdi
	call	strchr
.LVL43:
	testq	%rax, %rax
	je	.L40
	.loc 1 1019 0
	movb	$0, (%rax)
.L40:
.LVL44:
.LBB92:
	.loc 1 1023 0
	movl	$.LC9, %esi
	movq	%rsp, %rdi
	call	strspn
.LBE92:
	leaq	0(%rbp,%rax), %r14
.LVL45:
	.loc 1 1026 0
	cmpb	$0, (%r14)
	je	.L81
.L78:
.LVL46:
.LBB93:
	.loc 1 1029 0
	movl	$.LC9, %esi
	movq	%r14, %rdi
	call	strcspn
.LBE93:
	leaq	(%r14,%rax), %rbx
.LVL47:
	.loc 1 1031 0
	jmp	.L41
	.p2align 4,,10
	.p2align 3
.L42:
	.loc 1 1032 0
	movb	$0, (%rbx)
	addq	$1, %rbx
.LVL48:
.L41:
	.loc 1 1031 0
	movzbl	(%rbx), %eax
	cmpb	$9, %al
	je	.L42
	cmpb	$32, %al
	je	.L42
	cmpb	$10, %al
	je	.L42
	cmpb	$13, %al
	.p2align 4,,5
	je	.L42
.LVL49:
	.loc 1 1035 0
	movl	$61, %esi
	movq	%r14, %rdi
	call	strchr
	.loc 1 1036 0
	testq	%rax, %rax
	.loc 1 1035 0
	movq	%rax, %r13
.LVL50:
	.loc 1 1036 0
	je	.L43
	.loc 1 1037 0
	movb	$0, (%rax)
	addq	$1, %r13
.LVL51:
.L43:
	.loc 1 1039 0
	movl	$.LC10, %esi
	movq	%r14, %rdi
	call	strcasecmp
	testl	%eax, %eax
	je	.L86
	.loc 1 1044 0
	movl	$.LC11, %esi
	movq	%r14, %rdi
	call	strcasecmp
	testl	%eax, %eax
	je	.L87
	.loc 1 1049 0
	movl	$.LC12, %esi
	movq	%r14, %rdi
	call	strcasecmp
	testl	%eax, %eax
	je	.L88
	.loc 1 1054 0
	movl	$.LC13, %esi
	movq	%r14, %rdi
	call	strcasecmp
	testl	%eax, %eax
	je	.L89
	.loc 1 1060 0
	movl	$.LC14, %esi
	movq	%r14, %rdi
	call	strcasecmp
	testl	%eax, %eax
	je	.L90
	.loc 1 1066 0
	movl	$.LC15, %esi
	movq	%r14, %rdi
	call	strcasecmp
	testl	%eax, %eax
	je	.L91
	.loc 1 1071 0
	movl	$.LC16, %esi
	movq	%r14, %rdi
	call	strcasecmp
	testl	%eax, %eax
	je	.L83
	.loc 1 1076 0
	movl	$.LC17, %esi
	movq	%r14, %rdi
	call	strcasecmp
	testl	%eax, %eax
	je	.L84
	.loc 1 1081 0
	movl	$.LC18, %esi
	movq	%r14, %rdi
	call	strcasecmp
	testl	%eax, %eax
	je	.L83
	.loc 1 1086 0
	movl	$.LC19, %esi
	movq	%r14, %rdi
	call	strcasecmp
	testl	%eax, %eax
	je	.L84
	.loc 1 1091 0
	movl	$.LC20, %esi
	movq	%r14, %rdi
	call	strcasecmp
	testl	%eax, %eax
	je	.L92
	.loc 1 1096 0
	movl	$.LC21, %esi
	movq	%r14, %rdi
	call	strcasecmp
	testl	%eax, %eax
	je	.L93
	.loc 1 1101 0
	movl	$.LC22, %esi
	movq	%r14, %rdi
	call	strcasecmp
	testl	%eax, %eax
	je	.L94
	.loc 1 1106 0
	movl	$.LC23, %esi
	movq	%r14, %rdi
	call	strcasecmp
	testl	%eax, %eax
	je	.L95
	.loc 1 1111 0
	movl	$.LC24, %esi
	movq	%r14, %rdi
	call	strcasecmp
	testl	%eax, %eax
	je	.L96
	.loc 1 1116 0
	movl	$.LC25, %esi
	movq	%r14, %rdi
	call	strcasecmp
	testl	%eax, %eax
	je	.L97
	.loc 1 1121 0
	movl	$.LC26, %esi
	movq	%r14, %rdi
	call	strcasecmp
	testl	%eax, %eax
	je	.L98
	.loc 1 1126 0
	movl	$.LC27, %esi
	movq	%r14, %rdi
	call	strcasecmp
	testl	%eax, %eax
	je	.L99
	.loc 1 1131 0
	movl	$.LC28, %esi
	movq	%r14, %rdi
	call	strcasecmp
	testl	%eax, %eax
	je	.L100
	.loc 1 1136 0
	movl	$.LC29, %esi
	movq	%r14, %rdi
	call	strcasecmp
	testl	%eax, %eax
	je	.L101
	.loc 1 1141 0
	movl	$.LC30, %esi
	movq	%r14, %rdi
	call	strcasecmp
	testl	%eax, %eax
	je	.L102
	.loc 1 1146 0
	movl	$.LC31, %esi
	movq	%r14, %rdi
	call	strcasecmp
	testl	%eax, %eax
	je	.L103
	.loc 1 1151 0
	movl	$.LC32, %esi
	movq	%r14, %rdi
	call	strcasecmp
	testl	%eax, %eax
	je	.L104
	.loc 1 1156 0
	movl	$.LC33, %esi
	movq	%r14, %rdi
	call	strcasecmp
	testl	%eax, %eax
	je	.L105
	.loc 1 1161 0
	movl	$.LC34, %esi
	movq	%r14, %rdi
	call	strcasecmp
	testl	%eax, %eax
	je	.L106
	.loc 1 1166 0
	movl	$.LC35, %esi
	movq	%r14, %rdi
	call	strcasecmp
	testl	%eax, %eax
	je	.L107
	.loc 1 1171 0
	movl	$.LC36, %esi
	movq	%r14, %rdi
	call	strcasecmp
	testl	%eax, %eax
	jne	.L71
	.loc 1 1173 0
	movq	%r13, %rsi
	movq	%r14, %rdi
	call	value_required
.LVL52:
.LBB94:
.LBB95:
	.file 2 "/usr/include/stdlib.h"
	.loc 2 286 0
	movl	$10, %edx
	xorl	%esi, %esi
	movq	%r13, %rdi
	call	strtol
	.loc 1 1174 0
	movl	%eax, max_age(%rip)
	jmp	.L45
.LVL53:
	.p2align 4,,10
	.p2align 3
.L85:
.LBE95:
.LBE94:
	.loc 1 1189 0
	movq	%r12, %rdi
	call	fclose
	.loc 1 1190 0
	movq	10008(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L108
	addq	$10016, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
.LVL54:
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
.LVL55:
.L86:
	.cfi_restore_state
	.loc 1 1041 0
	movq	%r13, %rsi
	movq	%r14, %rdi
	call	no_value_required
	.loc 1 1042 0
	movl	$1, debug(%rip)
.L45:
.LVL56:
.LBB96:
	.loc 1 1185 0
	movl	$.LC9, %esi
	movq	%rbx, %rdi
	call	strspn
.LBE96:
	leaq	(%rbx,%rax), %r14
.LVL57:
	.loc 1 1026 0
	cmpb	$0, (%r14)
	je	.L81
	jmp	.L78
.LVL58:
.L87:
	.loc 1 1046 0
	movq	%r13, %rsi
	movq	%r14, %rdi
	call	value_required
.LVL59:
.LBB97:
.LBB98:
	.loc 2 286 0
	movl	$10, %edx
	xorl	%esi, %esi
	movq	%r13, %rdi
	call	strtol
.LBE98:
.LBE97:
	.loc 1 1047 0
	movw	%ax, port(%rip)
	jmp	.L45
.LVL60:
.L88:
	.loc 1 1051 0
	movq	%r13, %rsi
	movq	%r14, %rdi
	call	value_required
	.loc 1 1052 0
	movq	%r13, %rdi
	call	e_strdup
	movq	%rax, dir(%rip)
	jmp	.L45
.L83:
	.loc 1 1083 0
	movq	%r13, %rsi
	movq	%r14, %rdi
	call	no_value_required
	.loc 1 1084 0
	movl	$0, no_symlink_check(%rip)
	jmp	.L45
.L89:
	.loc 1 1056 0
	movq	%r13, %rsi
	movq	%r14, %rdi
	call	no_value_required
	.loc 1 1057 0
	movl	$1, do_chroot(%rip)
	.loc 1 1058 0
	movl	$1, no_symlink_check(%rip)
	jmp	.L45
.L90:
	.loc 1 1062 0
	movq	%r13, %rsi
	movq	%r14, %rdi
	call	no_value_required
	.loc 1 1063 0
	movl	$0, do_chroot(%rip)
	.loc 1 1064 0
	movl	$0, no_symlink_check(%rip)
	jmp	.L45
.L91:
	.loc 1 1068 0
	movq	%r13, %rsi
	movq	%r14, %rdi
	call	value_required
	.loc 1 1069 0
	movq	%r13, %rdi
	call	e_strdup
	movq	%rax, data_dir(%rip)
	jmp	.L45
.L84:
	.loc 1 1088 0
	movq	%r13, %rsi
	movq	%r14, %rdi
	call	no_value_required
	.loc 1 1089 0
	movl	$1, no_symlink_check(%rip)
	jmp	.L45
.L95:
	.loc 1 1108 0
	movq	%r13, %rsi
	movq	%r14, %rdi
	call	value_required
	.loc 1 1109 0
	movq	%r13, %rdi
	call	e_strdup
	movq	%rax, url_pattern(%rip)
	jmp	.L45
.L92:
	.loc 1 1093 0
	movq	%r13, %rsi
	movq	%r14, %rdi
	call	value_required
	.loc 1 1094 0
	movq	%r13, %rdi
	call	e_strdup
	movq	%rax, user(%rip)
	jmp	.L45
.L93:
	.loc 1 1098 0
	movq	%r13, %rsi
	movq	%r14, %rdi
	call	value_required
	.loc 1 1099 0
	movq	%r13, %rdi
	call	e_strdup
	movq	%rax, cgi_pattern(%rip)
	jmp	.L45
.L94:
	.loc 1 1103 0
	movq	%r13, %rsi
	movq	%r14, %rdi
	call	value_required
.LVL61:
.LBB99:
.LBB100:
	.loc 2 286 0
	movl	$10, %edx
	xorl	%esi, %esi
	movq	%r13, %rdi
	call	strtol
	.loc 1 1104 0
	movl	%eax, cgi_limit(%rip)
	jmp	.L45
.LVL62:
.L97:
.LBE100:
.LBE99:
	.loc 1 1118 0
	movq	%r13, %rsi
	movq	%r14, %rdi
	call	value_required
	.loc 1 1119 0
	movq	%r13, %rdi
	call	e_strdup
	movq	%rax, local_pattern(%rip)
	jmp	.L45
.L96:
	.loc 1 1113 0
	movq	%r13, %rsi
	movq	%r14, %rdi
	call	no_value_required
	.loc 1 1114 0
	movl	$1, no_empty_referers(%rip)
	jmp	.L45
.L71:
	.loc 1 1178 0
	movq	stderr(%rip), %rdi
	movq	argv0(%rip), %rdx
	movq	%r14, %rcx
	movl	$.LC37, %esi
	xorl	%eax, %eax
	call	fprintf
	.loc 1 1180 0
	movl	$1, %edi
	call	exit
.LVL63:
.L82:
	.loc 1 1011 0
	movq	%rbx, %rdi
	call	perror
	.loc 1 1012 0
	movl	$1, %edi
	call	exit
.LVL64:
.L108:
	.loc 1 1190 0
	call	__stack_chk_fail
.LVL65:
.L99:
	.loc 1 1128 0
	movq	%r13, %rsi
	movq	%r14, %rdi
	call	value_required
	.loc 1 1129 0
	movq	%r13, %rdi
	call	e_strdup
	movq	%rax, hostname(%rip)
	jmp	.L45
.L98:
	.loc 1 1123 0
	movq	%r13, %rsi
	movq	%r14, %rdi
	call	value_required
	.loc 1 1124 0
	movq	%r13, %rdi
	call	e_strdup
	movq	%rax, throttlefile(%rip)
	jmp	.L45
.L107:
	.loc 1 1168 0
	movq	%r13, %rsi
	movq	%r14, %rdi
	call	value_required
	.loc 1 1169 0
	movq	%r13, %rdi
	call	e_strdup
	movq	%rax, p3p(%rip)
	jmp	.L45
.L106:
	.loc 1 1163 0
	movq	%r13, %rsi
	movq	%r14, %rdi
	call	value_required
	.loc 1 1164 0
	movq	%r13, %rdi
	call	e_strdup
	movq	%rax, charset(%rip)
	jmp	.L45
.L105:
	.loc 1 1158 0
	movq	%r13, %rsi
	movq	%r14, %rdi
	call	value_required
	.loc 1 1159 0
	movq	%r13, %rdi
	call	e_strdup
	movq	%rax, pidfile(%rip)
	jmp	.L45
.L104:
	.loc 1 1153 0
	movq	%r13, %rsi
	movq	%r14, %rdi
	call	no_value_required
	.loc 1 1154 0
	movl	$0, do_global_passwd(%rip)
	jmp	.L45
.L103:
	.loc 1 1148 0
	movq	%r13, %rsi
	movq	%r14, %rdi
	call	no_value_required
	.loc 1 1149 0
	movl	$1, do_global_passwd(%rip)
	jmp	.L45
.L102:
	.loc 1 1143 0
	movq	%r13, %rsi
	movq	%r14, %rdi
	call	no_value_required
	.loc 1 1144 0
	movl	$0, do_vhost(%rip)
	jmp	.L45
.L101:
	.loc 1 1138 0
	movq	%r13, %rsi
	movq	%r14, %rdi
	call	no_value_required
	.loc 1 1139 0
	movl	$1, do_vhost(%rip)
	jmp	.L45
.L100:
	.loc 1 1133 0
	movq	%r13, %rsi
	movq	%r14, %rdi
	call	value_required
	.loc 1 1134 0
	movq	%r13, %rdi
	call	e_strdup
	movq	%rax, logfile(%rip)
	jmp	.L45
	.cfi_endproc
.LFE50:
	.size	read_config, .-read_config
	.section	.rodata.str1.1
.LC38:
	.string	"too many connections!"
	.section	.rodata.str1.8
	.align 8
.LC39:
	.string	"the connects free list is messed up"
	.align 8
.LC40:
	.string	"out of memory allocating an httpd_conn"
	.text
	.p2align 4,,15
	.type	handle_newconnect, @function
handle_newconnect:
.LFB57:
	.loc 1 1505 0
	.cfi_startproc
.LVL66:
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movl	num_connects(%rip), %eax
	movq	%rdi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movl	%esi, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
.LVL67:
.L123:
	.loc 1 1516 0
	cmpl	%eax, max_connects(%rip)
	jle	.L125
	.loc 1 1527 0
	movl	first_free_connect(%rip), %eax
	cmpl	$-1, %eax
	je	.L112
	cltq
	leaq	(%rax,%rax,8), %rbx
	salq	$4, %rbx
	addq	connects(%rip), %rbx
	movl	(%rbx), %ecx
	testl	%ecx, %ecx
	jne	.L112
.LVL68:
	.loc 1 1534 0
	movq	8(%rbx), %rdx
	testq	%rdx, %rdx
	je	.L126
.L114:
	.loc 1 1547 0
	movq	hs(%rip), %rdi
	movl	%ebp, %esi
	call	httpd_get_conn
	testl	%eax, %eax
	jne	.L127
	.loc 1 1553 0
	movq	%r12, %rdi
	call	tmr_run
	xorl	%eax, %eax
.LVL69:
.L111:
	.loc 1 1581 0
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
.LVL70:
	popq	%r12
	.cfi_def_cfa_offset 8
.LVL71:
	ret
.LVL72:
	.p2align 4,,10
	.p2align 3
.L127:
	.cfi_restore_state
	.loc 1 1547 0
	cmpl	$2, %eax
	je	.L128
	.loc 1 1562 0
	movl	4(%rbx), %eax
	.loc 1 1560 0
	movl	$1, (%rbx)
	.loc 1 1567 0
	movq	$0, 96(%rbx)
	.loc 1 1568 0
	movq	$0, 104(%rbx)
	.loc 1 1562 0
	movl	%eax, first_free_connect(%rip)
	.loc 1 1566 0
	movq	(%r12), %rax
	.loc 1 1563 0
	movl	$-1, 4(%rbx)
	.loc 1 1564 0
	addl	$1, num_connects(%rip)
	.loc 1 1570 0
	movl	$0, 56(%rbx)
	.loc 1 1569 0
	movq	$0, 136(%rbx)
	.loc 1 1566 0
	movq	%rax, 88(%rbx)
	.loc 1 1573 0
	movq	8(%rbx), %rax
	movl	704(%rax), %edi
	call	httpd_set_ndelay
	.loc 1 1575 0
	movq	8(%rbx), %rax
	xorl	%edx, %edx
	movq	%rbx, %rsi
	movl	704(%rax), %edi
	call	fdwatch_add_fd
	.loc 1 1577 0
	addq	$1, stats_connections(%rip)
	.loc 1 1578 0
	movl	num_connects(%rip), %eax
	cmpl	stats_simultaneous(%rip), %eax
	jle	.L123
	.loc 1 1579 0
	movl	%eax, stats_simultaneous(%rip)
	jmp	.L123
	.p2align 4,,10
	.p2align 3
.L128:
	.loc 1 1581 0
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
.LVL73:
	popq	%rbp
	.cfi_def_cfa_offset 16
.LVL74:
	.loc 1 1579 0
	movl	$1, %eax
	.loc 1 1581 0
	popq	%r12
	.cfi_def_cfa_offset 8
.LVL75:
	ret
.LVL76:
	.p2align 4,,10
	.p2align 3
.L126:
	.cfi_restore_state
	.loc 1 1536 0
	movl	$720, %edi
	call	malloc
	.loc 1 1537 0
	testq	%rax, %rax
	.loc 1 1536 0
	movq	%rax, 8(%rbx)
	.loc 1 1537 0
	je	.L129
	.loc 1 1542 0
	movl	$0, (%rax)
	.loc 1 1543 0
	movq	%rax, %rdx
	addl	$1, httpd_conn_count(%rip)
	jmp	.L114
.LVL77:
	.p2align 4,,10
	.p2align 3
.L125:
	.loc 1 1522 0
	xorl	%eax, %eax
	movl	$.LC38, %esi
	movl	$4, %edi
	call	syslog
	.loc 1 1523 0
	movq	%r12, %rdi
	call	tmr_run
	xorl	%eax, %eax
	.loc 1 1524 0
	jmp	.L111
.L112:
	.loc 1 1529 0
	movl	$2, %edi
	movl	$.LC39, %esi
	xorl	%eax, %eax
	call	syslog
	.loc 1 1530 0
	movl	$1, %edi
	call	exit
.LVL78:
.L129:
	.loc 1 1539 0
	movl	$2, %edi
	movl	$.LC40, %esi
	call	syslog
	.loc 1 1540 0
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE57:
	.size	handle_newconnect, .-handle_newconnect
	.p2align 4,,15
	.type	really_clear_connection, @function
really_clear_connection:
.LFB66:
	.loc 1 2048 0
	.cfi_startproc
.LVL79:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.loc 1 2049 0
	movq	8(%rdi), %rdi
.LVL80:
	movq	200(%rdi), %rax
	addq	%rax, stats_bytes(%rip)
	.loc 1 2050 0
	cmpl	$3, (%rbx)
	je	.L131
	.loc 1 2051 0
	movl	704(%rdi), %edi
	movq	%rsi, 8(%rsp)
	call	fdwatch_del_fd
.LVL81:
	movq	8(%rbx), %rdi
	movq	8(%rsp), %rsi
.L131:
	.loc 1 2052 0
	call	httpd_close_conn
.LVL82:
.LBB101:
.LBB102:
	.loc 1 1926 0
	movl	56(%rbx), %eax
	testl	%eax, %eax
	jle	.L132
	.loc 1 2047 0
	subl	$1, %eax
	.loc 1 1926 0
	movq	throttles(%rip), %rcx
	.loc 1 2047 0
	xorl	%edx, %edx
	leaq	4(,%rax,4), %rsi
.LVL83:
	.p2align 4,,10
	.p2align 3
.L133:
	.loc 1 1927 0
	movslq	16(%rbx,%rdx), %rax
	addq	$4, %rdx
	leaq	(%rax,%rax,2), %rax
	salq	$4, %rax
	subl	$1, 40(%rcx,%rax)
	.loc 1 1926 0
	cmpq	%rsi, %rdx
	jne	.L133
.L132:
.LBE102:
.LBE101:
	.loc 1 2054 0
	movq	104(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L134
	.loc 1 2056 0
	call	tmr_cancel
	.loc 1 2057 0
	movq	$0, 104(%rbx)
.L134:
	.loc 1 2060 0
	movl	first_free_connect(%rip), %eax
	.loc 1 2059 0
	movl	$0, (%rbx)
	.loc 1 2060 0
	movl	%eax, 4(%rbx)
	.loc 1 2061 0
	subq	connects(%rip), %rbx
.LVL84:
	movabsq	$-8198552921648689607, %rax
	.loc 1 2062 0
	subl	$1, num_connects(%rip)
	.loc 1 2061 0
	sarq	$4, %rbx
	imulq	%rax, %rbx
	movl	%ebx, first_free_connect(%rip)
	.loc 1 2063 0
	addq	$16, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE66:
	.size	really_clear_connection, .-really_clear_connection
	.section	.rodata.str1.8
	.align 8
.LC41:
	.string	"replacing non-null linger_timer!"
	.align 8
.LC42:
	.string	"tmr_create(linger_clear_connection) failed"
	.text
	.p2align 4,,15
	.type	clear_connection, @function
clear_connection:
.LFB65:
	.loc 1 1996 0
	.cfi_startproc
.LVL85:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	.loc 1 1999 0
	movq	96(%rdi), %rdi
.LVL86:
	testq	%rdi, %rdi
	je	.L138
	.loc 1 2001 0
	call	tmr_cancel
.LVL87:
	.loc 1 2002 0
	movq	$0, 96(%rbx)
.L138:
	.loc 1 2016 0
	movl	(%rbx), %edx
	cmpl	$4, %edx
	je	.L145
	.loc 1 2023 0
	movq	8(%rbx), %rax
	movl	556(%rax), %esi
	testl	%esi, %esi
	je	.L140
	.loc 1 2025 0
	cmpl	$3, %edx
	je	.L141
	.loc 1 2026 0
	movl	704(%rax), %edi
	call	fdwatch_del_fd
	movq	8(%rbx), %rax
.L141:
	.loc 1 2027 0
	movl	$4, (%rbx)
	.loc 1 2028 0
	movl	704(%rax), %edi
	movl	$1, %esi
	call	shutdown
	.loc 1 2029 0
	movq	8(%rbx), %rax
	xorl	%edx, %edx
	movq	%rbx, %rsi
	movl	704(%rax), %edi
	call	fdwatch_add_fd
	.loc 1 2031 0
	cmpq	$0, 104(%rbx)
	je	.L142
	.loc 1 2032 0
	movl	$.LC41, %esi
	movl	$3, %edi
	xorl	%eax, %eax
	call	syslog
.L142:
	.loc 1 2033 0
	xorl	%r8d, %r8d
	movl	$500, %ecx
	movq	%rbx, %rdx
	movl	$linger_clear_connection, %esi
	movq	%rbp, %rdi
	call	tmr_create
	.loc 1 2035 0
	testq	%rax, %rax
	.loc 1 2033 0
	movq	%rax, 104(%rbx)
	.loc 1 2035 0
	je	.L146
	.loc 1 2043 0
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
.LVL88:
	popq	%rbp
	.cfi_def_cfa_offset 8
.LVL89:
	ret
.LVL90:
	.p2align 4,,10
	.p2align 3
.L145:
	.cfi_restore_state
	.loc 1 2019 0
	movq	104(%rbx), %rdi
	call	tmr_cancel
	.loc 1 2021 0
	movq	8(%rbx), %rax
	.loc 1 2020 0
	movq	$0, 104(%rbx)
	.loc 1 2021 0
	movl	$0, 556(%rax)
.L140:
	.loc 1 2043 0
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	.loc 1 2042 0
	movq	%rbx, %rdi
	movq	%rbp, %rsi
	.loc 1 2043 0
	popq	%rbx
	.cfi_def_cfa_offset 16
.LVL91:
	popq	%rbp
	.cfi_def_cfa_offset 8
.LVL92:
	.loc 1 2042 0
	jmp	really_clear_connection
.LVL93:
.L146:
	.cfi_restore_state
	.loc 1 2037 0
	movl	$2, %edi
	movl	$.LC42, %esi
	call	syslog
	.loc 1 2038 0
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE65:
	.size	clear_connection, .-clear_connection
	.p2align 4,,15
	.type	linger_clear_connection, @function
linger_clear_connection:
.LFB69:
	.loc 1 2119 0
	.cfi_startproc
.LVL94:
	.loc 1 2123 0
	movq	$0, 104(%rdi)
	.loc 1 2124 0
	jmp	really_clear_connection
	.cfi_endproc
.LFE69:
	.size	linger_clear_connection, .-linger_clear_connection
	.p2align 4,,15
	.type	finish_connection, @function
finish_connection:
.LFB64:
	.loc 1 1985 0
	.cfi_startproc
.LVL95:
	movq	%rbx, -16(%rsp)
	movq	%rbp, -8(%rsp)
	movq	%rdi, %rbx
	.cfi_offset 6, -16
	.cfi_offset 3, -24
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	.loc 1 1987 0
	movq	8(%rdi), %rdi
.LVL96:
	.loc 1 1985 0
	movq	%rsi, %rbp
	.loc 1 1987 0
	call	httpd_write_response
.LVL97:
	.loc 1 1990 0
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	.loc 1 1991 0
	movq	16(%rsp), %rbp
.LVL98:
	movq	8(%rsp), %rbx
.LVL99:
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	.loc 1 1990 0
	jmp	clear_connection
	.cfi_endproc
.LFE64:
	.size	finish_connection, .-finish_connection
	.section	.rodata.str1.8
	.align 8
.LC43:
	.string	"up %ld seconds, stats for %ld seconds:"
	.align 8
.LC44:
	.string	"  thttpd - %ld connections (%g/sec), %d max simultaneous, %lld bytes (%g/sec), %d httpd_conns allocated"
	.text
	.p2align 4,,15
	.type	logstats, @function
logstats:
.LFB72:
	.loc 1 2149 0
	.cfi_startproc
.LVL100:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.loc 1 2154 0
	testq	%rdi, %rdi
	je	.L157
.L152:
	.loc 1 2159 0
	movq	(%rdi), %rax
.LVL101:
	.loc 1 2160 0
	movq	%rax, %rdx
	.loc 1 2162 0
	movq	%rax, %rbx
	.loc 1 2160 0
	subq	start_time(%rip), %rdx
.LVL102:
	.loc 1 2162 0
	subq	stats_time(%rip), %rbx
	je	.L153
	.loc 1 2164 0
	movq	%rax, stats_time(%rip)
	.loc 1 2165 0
	movq	%rbx, %rcx
	xorl	%eax, %eax
	movl	$.LC43, %esi
	movl	$6, %edi
.LVL103:
	call	syslog
.LVL104:
.LBB103:
.LBB105:
	.loc 1 2180 0
	testq	%rbx, %rbx
	jg	.L155
.LVL105:
.L154:
.LBE105:
.LBE103:
	.loc 1 2169 0
	movq	%rbx, %rdi
.LBB107:
.LBB104:
	.loc 1 2186 0
	movq	$0, stats_connections(%rip)
	.loc 1 2187 0
	movq	$0, stats_bytes(%rip)
	.loc 1 2188 0
	movl	$0, stats_simultaneous(%rip)
.LBE104:
.LBE107:
	.loc 1 2169 0
	call	httpd_logstats
	.loc 1 2170 0
	movq	%rbx, %rdi
	call	mmc_logstats
	.loc 1 2171 0
	movq	%rbx, %rdi
	call	fdwatch_logstats
	.loc 1 2172 0
	movq	%rbx, %rdi
	call	tmr_logstats
	.loc 1 2173 0
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
.LVL106:
	.p2align 4,,10
	.p2align 3
.L153:
	.cfi_restore_state
	.loc 1 2164 0
	movq	%rax, stats_time(%rip)
	.loc 1 2165 0
	movl	$1, %ecx
	movl	$.LC43, %esi
	movl	$6, %edi
.LVL107:
	xorl	%eax, %eax
.LVL108:
	movl	$1, %ebx
	call	syslog
.LVL109:
.L155:
.LBB108:
.LBB106:
	.loc 1 2185 0
	movq	stats_bytes(%rip), %r8
	.loc 1 2183 0
	movq	stats_connections(%rip), %rdx
	.loc 1 2181 0
	movl	$.LC44, %esi
	.loc 1 2185 0
	cvtsi2ssq	%rbx, %xmm2
	.loc 1 2181 0
	movl	httpd_conn_count(%rip), %r9d
	movl	stats_simultaneous(%rip), %ecx
	movl	$6, %edi
	movl	$2, %eax
	cvtsi2ssq	%r8, %xmm1
	cvtsi2ssq	%rdx, %xmm0
	divss	%xmm2, %xmm1
	divss	%xmm2, %xmm0
	unpcklps	%xmm1, %xmm1
	unpcklps	%xmm0, %xmm0
	cvtps2pd	%xmm1, %xmm1
	cvtps2pd	%xmm0, %xmm0
	call	syslog
	jmp	.L154
.LVL110:
	.p2align 4,,10
	.p2align 3
.L157:
.LBE106:
.LBE108:
	.loc 1 2156 0
	movq	%rsp, %rdi
.LVL111:
	xorl	%esi, %esi
	call	gettimeofday
.LVL112:
	movq	%rsp, %rdi
	jmp	.L152
	.cfi_endproc
.LFE72:
	.size	logstats, .-logstats
	.p2align 4,,15
	.type	shut_down, @function
shut_down:
.LFB56:
	.loc 1 1467 0
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	.loc 1 1471 0
	xorl	%esi, %esi
	.loc 1 1467 0
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	subq	$16, %rsp
	.cfi_def_cfa_offset 48
	.loc 1 1471 0
	movq	%rsp, %rdi
	call	gettimeofday
	.loc 1 1472 0
	movq	%rsp, %rdi
	call	logstats
.LVL113:
	.loc 1 1473 0
	movl	max_connects(%rip), %ebp
	testl	%ebp, %ebp
	jle	.L159
	xorl	%ebp, %ebp
	xorl	%r12d, %r12d
	jmp	.L162
.LVL114:
	.p2align 4,,10
	.p2align 3
.L160:
	.loc 1 1477 0
	movq	8(%rax), %rdi
	testq	%rdi, %rdi
	je	.L161
	.loc 1 1479 0
	call	httpd_destroy_conn
	.loc 1 1480 0
	movq	connects(%rip), %rax
	movq	8(%rax,%rbp), %rdi
	call	free
	.loc 1 1482 0
	movq	connects(%rip), %rax
	.loc 1 1481 0
	subl	$1, httpd_conn_count(%rip)
	.loc 1 1482 0
	movq	$0, 8(%rax,%rbp)
.L161:
	.loc 1 1473 0
	addl	$1, %r12d
.LVL115:
	addq	$144, %rbp
	cmpl	%r12d, max_connects(%rip)
	jle	.L159
.LVL116:
.L162:
	.loc 1 1475 0
	movq	%rbp, %rax
	addq	connects(%rip), %rax
	movl	(%rax), %edi
	testl	%edi, %edi
	je	.L160
	.loc 1 1476 0
	movq	8(%rax), %rdi
	movq	%rsp, %rsi
	call	httpd_close_conn
	movq	%rbp, %rax
	addq	connects(%rip), %rax
	jmp	.L160
	.p2align 4,,10
	.p2align 3
.L159:
	.loc 1 1485 0
	movq	hs(%rip), %rbx
	testq	%rbx, %rbx
	je	.L163
.LVL117:
.LBB109:
	.loc 1 1489 0
	movl	72(%rbx), %edi
	.loc 1 1488 0
	movq	$0, hs(%rip)
	.loc 1 1489 0
	cmpl	$-1, %edi
	je	.L164
	.loc 1 1490 0
	call	fdwatch_del_fd
.LVL118:
.L164:
	.loc 1 1491 0
	movl	76(%rbx), %edi
	cmpl	$-1, %edi
	je	.L165
	.loc 1 1492 0
	call	fdwatch_del_fd
.L165:
	.loc 1 1493 0
	movq	%rbx, %rdi
	call	httpd_terminate
.LVL119:
.L163:
.LBE109:
	.loc 1 1495 0
	call	mmc_destroy
	.loc 1 1496 0
	call	tmr_destroy
	.loc 1 1497 0
	movq	connects(%rip), %rdi
	call	free
	.loc 1 1498 0
	movq	throttles(%rip), %rdi
	testq	%rdi, %rdi
	je	.L167
	.loc 1 1499 0
	call	free
.L167:
	.loc 1 1500 0
	addq	$16, %rsp
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE56:
	.size	shut_down, .-shut_down
	.section	.rodata.str1.1
.LC45:
	.string	"exiting"
	.text
	.p2align 4,,15
	.type	handle_usr1, @function
handle_usr1:
.LFB43:
	.loc 1 257 0
	.cfi_startproc
.LVL120:
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	.loc 1 260 0
	movl	num_connects(%rip), %r8d
	testl	%r8d, %r8d
	je	.L172
	.loc 1 273 0
	movl	$1, got_usr1(%rip)
	.loc 1 276 0
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L172:
	.cfi_restore_state
	.loc 1 266 0
	call	shut_down
.LVL121:
	.loc 1 267 0
	movl	$5, %edi
	movl	$.LC45, %esi
	xorl	%eax, %eax
	call	syslog
	.loc 1 268 0
	call	closelog
	.loc 1 269 0
	xorl	%edi, %edi
	call	exit
	.cfi_endproc
.LFE43:
	.size	handle_usr1, .-handle_usr1
	.section	.rodata.str1.1
.LC46:
	.string	"exiting due to signal %d"
	.text
	.p2align 4,,15
	.type	handle_term, @function
handle_term:
.LFB40:
	.loc 1 172 0
	.cfi_startproc
.LVL122:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	.loc 1 172 0
	movl	%edi, %ebx
	.loc 1 175 0
	call	shut_down
.LVL123:
	.loc 1 176 0
	movl	$5, %edi
	movl	%ebx, %edx
	movl	$.LC46, %esi
	xorl	%eax, %eax
	call	syslog
	.loc 1 177 0
	call	closelog
	.loc 1 178 0
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE40:
	.size	handle_term, .-handle_term
	.p2align 4,,15
	.type	show_stats, @function
show_stats:
.LFB71:
	.loc 1 2140 0
	.cfi_startproc
.LVL124:
	.loc 1 2141 0
	movq	%rsi, %rdi
.LVL125:
	jmp	logstats
	.cfi_endproc
.LFE71:
	.size	show_stats, .-show_stats
	.p2align 4,,15
	.type	handle_usr2, @function
handle_usr2:
.LFB44:
	.loc 1 282 0
	.cfi_startproc
.LVL126:
	movq	%rbx, -16(%rsp)
	movq	%rbp, -8(%rsp)
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -16
	.cfi_offset 3, -24
	.loc 1 283 0
	call	__errno_location
.LVL127:
	movl	(%rax), %ebp
.LVL128:
	movq	%rax, %rbx
	.loc 1 290 0
	xorl	%edi, %edi
	call	logstats
.LVL129:
	.loc 1 293 0
	movl	%ebp, (%rbx)
	.loc 1 294 0
	movq	8(%rsp), %rbx
	movq	16(%rsp), %rbp
.LVL130:
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE44:
	.size	handle_usr2, .-handle_usr2
	.section	.rodata.str1.8
	.align 8
.LC47:
	.string	"%.80s connection timed out reading"
	.section	.rodata.str1.1
.LC48:
	.string	""
	.section	.rodata.str1.8
	.align 8
.LC49:
	.string	"%.80s connection timed out sending"
	.text
	.p2align 4,,15
	.type	idle, @function
idle:
.LFB67:
	.loc 1 2068 0
	.cfi_startproc
.LVL131:
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	movq	%rsi, %r13
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
	.loc 1 2072 0
	movl	max_connects(%rip), %r9d
	testl	%r9d, %r9d
	jle	.L185
	xorl	%ebp, %ebp
	xorl	%r12d, %r12d
	jmp	.L184
.LVL132:
	.p2align 4,,10
	.p2align 3
.L189:
	.loc 1 2075 0
	jl	.L181
	cmpl	$3, %eax
	jg	.L181
	.loc 1 2090 0
	movq	0(%r13), %rax
	subq	88(%rbx), %rax
	cmpq	$299, %rax
	jg	.L188
.L181:
	.loc 1 2072 0
	addl	$1, %r12d
.LVL133:
	addq	$144, %rbp
	cmpl	%r12d, max_connects(%rip)
	jle	.L185
.LVL134:
.L184:
	.loc 1 2074 0
	movq	%rbp, %rbx
	addq	connects(%rip), %rbx
.LVL135:
	.loc 1 2075 0
	movl	(%rbx), %eax
	cmpl	$1, %eax
	jne	.L189
	.loc 1 2078 0
	movq	0(%r13), %rax
	subq	88(%rbx), %rax
	cmpq	$59, %rax
	jle	.L181
	.loc 1 2080 0
	movq	8(%rbx), %rdi
.LVL136:
	addq	$16, %rdi
	call	httpd_ntoa
	movl	$.LC47, %esi
	movq	%rax, %rdx
	movl	$6, %edi
	xorl	%eax, %eax
	call	syslog
	.loc 1 2083 0
	movq	8(%rbx), %rdi
	movq	httpd_err408form(%rip), %r8
	movl	$.LC48, %r9d
	movq	httpd_err408title(%rip), %rdx
	movq	%r9, %rcx
	movl	$408, %esi
	call	httpd_send_err
	.loc 1 2085 0
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	finish_connection
	jmp	.L181
.LVL137:
	.p2align 4,,10
	.p2align 3
.L185:
	.loc 1 2100 0
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
.LVL138:
	ret
.LVL139:
	.p2align 4,,10
	.p2align 3
.L188:
	.cfi_restore_state
	.loc 1 2092 0
	movq	8(%rbx), %rdi
.LVL140:
	addq	$16, %rdi
	call	httpd_ntoa
	movl	$.LC49, %esi
	movq	%rax, %rdx
	movl	$6, %edi
	xorl	%eax, %eax
	call	syslog
	.loc 1 2095 0
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	clear_connection
	jmp	.L181
	.cfi_endproc
.LFE67:
	.size	idle, .-idle
	.p2align 4,,15
	.type	occasional, @function
occasional:
.LFB70:
	.loc 1 2130 0
	.cfi_startproc
.LVL141:
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	.loc 1 2131 0
	movq	%rsi, %rdi
.LVL142:
	call	mmc_cleanup
.LVL143:
	.loc 1 2132 0
	call	tmr_cleanup
	.loc 1 2133 0
	movl	$1, watchdog_flag(%rip)
	.loc 1 2134 0
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE70:
	.size	occasional, .-occasional
	.section	.rodata.str1.1
.LC50:
	.string	"/tmp"
	.text
	.p2align 4,,15
	.type	handle_alrm, @function
handle_alrm:
.LFB45:
	.loc 1 300 0
	.cfi_startproc
.LVL144:
	movq	%rbx, -16(%rsp)
	movq	%rbp, -8(%rsp)
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -16
	.cfi_offset 3, -24
	.loc 1 301 0
	call	__errno_location
.LVL145:
	movq	%rax, %rbx
	movl	(%rax), %ebp
.LVL146:
	.loc 1 304 0
	movl	watchdog_flag(%rip), %eax
.LVL147:
	testl	%eax, %eax
	je	.L195
	.loc 1 318 0
	movl	$360, %edi
	.loc 1 311 0
	movl	$0, watchdog_flag(%rip)
	.loc 1 318 0
	call	alarm
.LVL148:
	.loc 1 321 0
	movl	%ebp, (%rbx)
	.loc 1 322 0
	movq	8(%rsp), %rbx
	movq	16(%rsp), %rbp
.LVL149:
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.LVL150:
.L195:
	.cfi_restore_state
	.loc 1 307 0
	movl	$.LC50, %edi
	call	chdir
	.loc 1 309 0
	call	abort
	.cfi_endproc
.LFE45:
	.size	handle_alrm, .-handle_alrm
	.section	.rodata.str1.1
.LC51:
	.string	"child wait - %m"
	.text
	.p2align 4,,15
	.type	handle_chld, @function
handle_chld:
.LFB41:
	.loc 1 185 0
	.cfi_startproc
.LVL151:
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	.loc 1 226 0
	xorl	%r12d, %r12d
	.loc 1 185 0
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$24, %rsp
	.cfi_def_cfa_offset 64
	.loc 1 186 0
	call	__errno_location
.LVL152:
	movl	(%rax), %r13d
.LVL153:
	leaq	12(%rsp), %rbx
	movq	%rax, %rbp
.LVL154:
	.p2align 4,,10
	.p2align 3
.L203:
	.loc 1 199 0
	movl	$1, %edx
	movq	%rbx, %rsi
	movl	$-1, %edi
	call	waitpid
.LVL155:
	.loc 1 203 0
	cmpl	$0, %eax
	je	.L197
	.loc 1 205 0
	jl	.L204
	.loc 1 222 0
	movq	hs(%rip), %rax
.LVL156:
	testq	%rax, %rax
	je	.L203
	.loc 1 224 0
	movl	36(%rax), %edx
	.loc 1 226 0
	subl	$1, %edx
	cmovs	%r12d, %edx
	movl	%edx, 36(%rax)
	jmp	.L203
.LVL157:
	.p2align 4,,10
	.p2align 3
.L204:
	.loc 1 207 0
	movl	0(%rbp), %eax
.LVL158:
	cmpl	$11, %eax
	je	.L203
	cmpl	$4, %eax
	je	.L203
	.loc 1 212 0
	cmpl	$10, %eax
	je	.L197
	.loc 1 213 0
	movl	$.LC51, %esi
	movl	$3, %edi
	xorl	%eax, %eax
	call	syslog
.L197:
	.loc 1 231 0
	movl	%r13d, 0(%rbp)
	.loc 1 232 0
	addq	$24, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
.LVL159:
	ret
	.cfi_endproc
.LFE41:
	.size	handle_chld, .-handle_chld
	.section	.rodata.str1.1
.LC52:
	.string	"nobody"
.LC53:
	.string	"iso-8859-1"
.LC54:
	.string	"-V"
.LC55:
	.string	"thttpd/2.27.0 Oct 3, 2014"
.LC56:
	.string	"-C"
.LC57:
	.string	"-p"
.LC58:
	.string	"-d"
.LC59:
	.string	"-r"
.LC60:
	.string	"-nor"
.LC61:
	.string	"-dd"
.LC62:
	.string	"-s"
.LC63:
	.string	"-nos"
.LC64:
	.string	"-u"
.LC65:
	.string	"-c"
.LC66:
	.string	"-t"
.LC67:
	.string	"-h"
.LC68:
	.string	"-l"
.LC69:
	.string	"-v"
.LC70:
	.string	"-nov"
.LC71:
	.string	"-g"
.LC72:
	.string	"-nog"
.LC73:
	.string	"-i"
.LC74:
	.string	"-T"
.LC75:
	.string	"-P"
.LC76:
	.string	"-M"
.LC77:
	.string	"-D"
.LC78:
	.string	"%d"
.LC79:
	.string	"getaddrinfo %.80s - %.80s"
.LC80:
	.string	"%s: getaddrinfo %s - %s\n"
	.section	.rodata.str1.8
	.align 8
.LC81:
	.string	"%.80s - sockaddr too small (%lu < %lu)"
	.section	.rodata.str1.1
.LC82:
	.string	"can't find any valid address"
	.section	.rodata.str1.8
	.align 8
.LC83:
	.string	"%s: can't find any valid address\n"
	.section	.rodata.str1.1
.LC84:
	.string	"%.80s - %m"
.LC85:
	.string	" %4900[^ \t] %ld-%ld"
.LC86:
	.string	" %4900[^ \t] %ld"
	.section	.rodata.str1.8
	.align 8
.LC87:
	.string	"unparsable line in %.80s - %.80s"
	.align 8
.LC88:
	.string	"%s: unparsable line in %.80s - %.80s\n"
	.section	.rodata.str1.1
.LC89:
	.string	"|/"
	.section	.rodata.str1.8
	.align 8
.LC90:
	.string	"out of memory allocating a throttletab"
	.align 8
.LC91:
	.string	"%s: out of memory allocating a throttletab\n"
	.section	.rodata.str1.1
.LC92:
	.string	"unknown user - '%.80s'"
.LC93:
	.string	"%s: unknown user - '%s'\n"
.LC94:
	.string	"/dev/null"
.LC95:
	.string	"-"
.LC96:
	.string	"a"
	.section	.rodata.str1.8
	.align 8
.LC97:
	.string	"logfile is not an absolute path, you may not be able to re-open it"
	.align 8
.LC98:
	.string	"%s: logfile is not an absolute path, you may not be able to re-open it\n"
	.section	.rodata.str1.1
.LC99:
	.string	"fchown logfile - %m"
.LC100:
	.string	"fchown logfile"
.LC101:
	.string	"chdir - %m"
.LC102:
	.string	"chdir"
.LC103:
	.string	"daemon - %m"
.LC104:
	.string	"w"
.LC105:
	.string	"%d\n"
	.section	.rodata.str1.8
	.align 8
.LC106:
	.string	"fdwatch initialization failure"
	.section	.rodata.str1.1
.LC107:
	.string	"chroot - %m"
	.section	.rodata.str1.8
	.align 8
.LC108:
	.string	"logfile is not within the chroot tree, you will not be able to re-open it"
	.align 8
.LC109:
	.string	"%s: logfile is not within the chroot tree, you will not be able to re-open it\n"
	.section	.rodata.str1.1
.LC110:
	.string	"chroot chdir - %m"
.LC111:
	.string	"chroot chdir"
.LC112:
	.string	"data_dir chdir - %m"
.LC113:
	.string	"data_dir chdir"
.LC114:
	.string	"tmr_create(occasional) failed"
.LC115:
	.string	"tmr_create(idle) failed"
	.section	.rodata.str1.8
	.align 8
.LC116:
	.string	"tmr_create(update_throttles) failed"
	.section	.rodata.str1.1
.LC117:
	.string	"tmr_create(show_stats) failed"
.LC118:
	.string	"setgroups - %m"
.LC119:
	.string	"setgid - %m"
.LC120:
	.string	"initgroups - %m"
.LC121:
	.string	"setuid - %m"
	.section	.rodata.str1.8
	.align 8
.LC122:
	.string	"started as root without requesting chroot(), warning only"
	.align 8
.LC123:
	.string	"out of memory allocating a connecttab"
	.section	.rodata.str1.1
.LC124:
	.string	"re-opening logfile"
.LC125:
	.string	"re-opening %.80s - %m"
.LC126:
	.string	"fdwatch - %m"
	.section	.rodata.str1.8
	.align 8
.LC127:
	.string	"throttle sending count was negative - shouldn't happen!"
	.align 8
.LC128:
	.string	"replacing non-null wakeup_timer!"
	.align 8
.LC129:
	.string	"tmr_create(wakeup_connection) failed"
	.section	.rodata.str1.1
.LC130:
	.string	"write - %m sending %.80s"
	.text
	.p2align 4,,15
.globl main
	.type	main, @function
main:
.LFB47:
	.loc 1 353 0
	.cfi_startproc
.LVL160:
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rsi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movl	%edi, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$14680, %rsp
	.cfi_def_cfa_offset 14736
	.loc 1 370 0
	movq	(%rsi), %rbx
	.loc 1 372 0
	movl	$47, %esi
.LVL161:
	.loc 1 353 0
	movq	%fs:40, %rax
	movq	%rax, 14664(%rsp)
	xorl	%eax, %eax
.LVL162:
	.loc 1 372 0
	movq	%rbx, %rdi
.LVL163:
	.loc 1 370 0
	movq	%rbx, argv0(%rip)
	.loc 1 372 0
	call	strrchr
.LVL164:
	.loc 1 374 0
	leaq	1(%rax), %rdx
	testq	%rax, %rax
	.loc 1 377 0
	movl	$9, %esi
	.loc 1 374 0
	cmovne	%rdx, %rbx
.LVL165:
	.loc 1 377 0
	movl	$24, %edx
	movq	%rbx, %rdi
	call	openlog
.LVL166:
.LBB188:
.LBB194:
	.loc 1 883 0
	cmpl	$1, %ebp
	.loc 1 840 0
	movl	$0, debug(%rip)
	.loc 1 841 0
	movw	$80, port(%rip)
	.loc 1 842 0
	movq	$0, dir(%rip)
	.loc 1 843 0
	movq	$0, data_dir(%rip)
	.loc 1 847 0
	movl	$0, do_chroot(%rip)
	.loc 1 849 0
	movl	$0, no_log(%rip)
	.loc 1 850 0
	movl	$0, no_symlink_check(%rip)
	.loc 1 854 0
	movl	$0, do_vhost(%rip)
	.loc 1 859 0
	movl	$0, do_global_passwd(%rip)
	.loc 1 864 0
	movq	$0, cgi_pattern(%rip)
	.loc 1 869 0
	movl	$0, cgi_limit(%rip)
	.loc 1 871 0
	movq	$0, url_pattern(%rip)
	.loc 1 872 0
	movl	$0, no_empty_referers(%rip)
	.loc 1 873 0
	movq	$0, local_pattern(%rip)
	.loc 1 874 0
	movq	$0, throttlefile(%rip)
	.loc 1 875 0
	movq	$0, hostname(%rip)
	.loc 1 876 0
	movq	$0, logfile(%rip)
	.loc 1 877 0
	movq	$0, pidfile(%rip)
	.loc 1 878 0
	movq	$.LC52, user(%rip)
	.loc 1 879 0
	movq	$.LC53, charset(%rip)
	.loc 1 880 0
	movq	$.LC48, p3p(%rip)
	.loc 1 881 0
	movl	$-1, max_age(%rip)
.LVL167:
	.loc 1 883 0
	jle	.L207
	movq	8(%r12), %r15
	cmpb	$45, (%r15)
	jne	.L208
	movl	$1, %ebx
.LVL168:
.LBB214:
	.loc 1 910 0
	movl	$.LC60, %r14d
	movl	$5, %r13d
	jmp	.L237
.LVL169:
	.p2align 4,,10
	.p2align 3
.L439:
.LBE214:
.LBB211:
.LBB212:
	.loc 1 890 0
	movzbl	1(%r15), %eax
	cmpb	.LC56+1(%rip), %al
	jne	.L210
.LVL170:
.LBE212:
.LBE211:
	movzbl	2(%r15), %eax
	cmpb	.LC56+2(%rip), %al
	jne	.L210
	addl	$1, %ebx
	cmpl	%ebx, %ebp
	jg	.L436
.LVL171:
.L212:
.LBB209:
.LBB210:
	.loc 1 895 0
	movzbl	.LC57(%rip), %eax
	cmpl	%eax, %edx
	jne	.L215
.LVL172:
	movzbl	1(%r15), %eax
	cmpb	.LC57+1(%rip), %al
	jne	.L215
.LBE210:
.LBE209:
	movzbl	2(%r15), %eax
	cmpb	.LC57+2(%rip), %al
	jne	.L215
	cmpl	%ebx, %ebp
	jg	.L437
.L215:
.LVL173:
.LBB207:
.LBB208:
	.loc 1 900 0
	movzbl	.LC58(%rip), %eax
	cmpl	%eax, %edx
	jne	.L216
.LVL174:
	movzbl	1(%r15), %eax
	cmpb	.LC58+1(%rip), %al
	jne	.L216
.LBE208:
.LBE207:
	movzbl	2(%r15), %eax
	cmpb	.LC58+2(%rip), %al
	jne	.L216
	cmpl	%ebx, %ebp
	jle	.L216
.LVL175:
	.loc 1 903 0
	movslq	%ebx, %rax
	addl	$1, %ebx
.LVL176:
	movq	(%r12,%rax,8), %rax
.LVL177:
	movq	%rax, dir(%rip)
.LVL178:
.L214:
	.loc 1 883 0
	cmpl	%ebx, %ebp
	jle	.L236
.L440:
	movslq	%ebx, %rax
	movq	(%r12,%rax,8), %r15
.LVL179:
	cmpb	$45, (%r15)
	jne	.L208
.LVL180:
.L237:
.LBB205:
.LBB206:
	.loc 1 885 0
	movzbl	(%r15), %edx
	movzbl	.LC54(%rip), %eax
	cmpl	%eax, %edx
	jne	.L209
.LVL181:
	movzbl	1(%r15), %eax
	cmpb	.LC54+1(%rip), %al
	jne	.L209
.LBE206:
.LBE205:
	movzbl	2(%r15), %eax
	cmpb	.LC54+2(%rip), %al
	je	.L438
.L209:
.LVL182:
.LBB204:
.LBB213:
	.loc 1 890 0
	movzbl	.LC56(%rip), %eax
	cmpl	%eax, %edx
	je	.L439
.L210:
.LBE213:
.LBE204:
	.loc 1 893 0
	addl	$1, %ebx
	jmp	.L212
.LVL183:
	.p2align 4,,10
	.p2align 3
.L216:
.LBB202:
.LBB203:
	.loc 1 905 0
	movzbl	.LC59(%rip), %eax
	cmpl	%eax, %edx
	jne	.L217
.LVL184:
	movzbl	1(%r15), %eax
	cmpb	.LC59+1(%rip), %al
	jne	.L217
.LBE203:
.LBE202:
	movzbl	2(%r15), %eax
	cmpb	.LC59+2(%rip), %al
	jne	.L217
	.loc 1 883 0
	cmpl	%ebx, %ebp
	.loc 1 907 0
	movl	$1, do_chroot(%rip)
	.loc 1 908 0
	movl	$1, no_symlink_check(%rip)
.LVL185:
	.loc 1 883 0
	jg	.L440
.LVL186:
.L236:
	.loc 1 983 0
	cmpl	%ebx, %ebp
	je	.L238
.L208:
	.loc 1 984 0
	call	usage
.L238:
.LBE194:
.LBE188:
.LBB256:
.LBB258:
	.loc 1 1247 0
	leaq	128(%rsp), %rbp
.LVL187:
	.loc 1 1251 0
	leaq	5280(%rsp), %rbx
.LBE258:
.LBE256:
	.loc 1 383 0
	call	tzset
.LVL188:
.LBB261:
.LBB259:
	.loc 1 1247 0
	xorl	%eax, %eax
	movq	%rbp, %rdi
	movl	$6, %ecx
	rep stosq
	.loc 1 1251 0
	movzwl	port(%rip), %ecx
	movl	$.LC78, %edx
	movl	$10, %esi
	movq	%rbx, %rdi
	.loc 1 1249 0
	movl	$1, 128(%rsp)
	.loc 1 1250 0
	movl	$1, 136(%rsp)
	.loc 1 1251 0
	call	snprintf
	.loc 1 1252 0
	movq	hostname(%rip), %rdi
	leaq	264(%rsp), %rcx
	movq	%rbp, %rdx
	movq	%rbx, %rsi
	call	getaddrinfo
	testl	%eax, %eax
	movl	%eax, %ebp
.LVL189:
	jne	.L441
.LVL190:
	.loc 1 1266 0
	movq	264(%rsp), %rax
.LVL191:
	testq	%rax, %rax
	movq	%rax, %rdi
.LVL192:
	je	.L240
	xorl	%ebp, %ebp
.LVL193:
	xorl	%esi, %esi
	jmp	.L244
.LVL194:
	.p2align 4,,10
	.p2align 3
.L443:
	.loc 1 1268 0
	cmpl	$10, %edx
	jne	.L241
	.loc 1 1271 0
	testq	%rsi, %rsi
	cmove	%rax, %rsi
.L241:
.LVL195:
	.loc 1 1266 0
	movq	40(%rax), %rax
.LVL196:
	testq	%rax, %rax
	je	.L442
.LVL197:
.L244:
	.loc 1 1268 0
	movl	4(%rax), %edx
	cmpl	$2, %edx
	jne	.L443
	.loc 1 1275 0
	testq	%rbp, %rbp
	cmove	%rax, %rbp
.LVL198:
	.loc 1 1266 0
	movq	40(%rax), %rax
.LVL199:
	testq	%rax, %rax
	jne	.L244
.L442:
	.loc 1 1281 0
	testq	%rsi, %rsi
	movl	$0, 112(%rsp)
	je	.L246
	.loc 1 1285 0
	movl	16(%rsi), %r8d
	cmpl	$128, %r8d
	ja	.L444
	.loc 1 1293 0
	leaq	14400(%rsp), %r8
	movl	$16, %ecx
	movq	%r8, %rdi
	rep stosq
	.loc 1 1294 0
	movq	%r8, %rdi
	mov	16(%rsi), %edx
	movq	24(%rsi), %rsi
.LVL200:
	call	memmove
.LVL201:
	movl	$1, 112(%rsp)
.LVL202:
.L246:
	.loc 1 1298 0
	testq	%rbp, %rbp
	je	.L445
	.loc 1 1302 0
	movl	16(%rbp), %r8d
	cmpl	$128, %r8d
	ja	.L446
	.loc 1 1310 0
	leaq	14528(%rsp), %r8
	xorl	%eax, %eax
	movl	$16, %ecx
	movq	%r8, %rdi
	rep stosq
	.loc 1 1311 0
	movq	%r8, %rdi
	mov	16(%rbp), %edx
	movq	24(%rbp), %rsi
	call	memmove
.LVL203:
	.loc 1 1315 0
	movq	264(%rsp), %rdi
	call	freeaddrinfo
	movl	$1, 116(%rsp)
.LVL204:
.L250:
.LBE259:
.LBE261:
	.loc 1 398 0
	movq	throttlefile(%rip), %r14
	.loc 1 395 0
	movl	$0, numthrottles(%rip)
	.loc 1 396 0
	movl	$0, maxthrottles(%rip)
	.loc 1 397 0
	movq	$0, throttles(%rip)
	.loc 1 398 0
	testq	%r14, %r14
	je	.L252
.LVL205:
.LBB262:
.LBB265:
	.loc 1 1379 0
	movl	$.LC8, %esi
	movq	%r14, %rdi
	call	fopen
.LVL206:
	.loc 1 1380 0
	testq	%rax, %rax
	.loc 1 1379 0
	movq	%rax, %r12
.LVL207:
	.loc 1 1380 0
	je	.L447
	.loc 1 1387 0
	leaq	208(%rsp), %rdi
	.loc 1 1408 0
	leaq	272(%rsp), %rbp
	.loc 1 1387 0
	xorl	%esi, %esi
	.loc 1 1408 0
	leaq	256(%rsp), %r13
	leaq	248(%rsp), %r15
	.loc 1 1387 0
	call	gettimeofday
.LVL208:
	.loc 1 1424 0
	leaq	1(%rbp), %rdx
	movq	%rdx, 120(%rsp)
.LVL209:
	.p2align 4,,10
	.p2align 3
.L415:
	.loc 1 1389 0
	movq	%r12, %rdx
	movl	$5000, %esi
	movq	%rbx, %rdi
	call	fgets
	testq	%rax, %rax
	je	.L448
	.loc 1 1392 0
	movl	$35, %esi
	movq	%rbx, %rdi
	call	strchr
.LVL210:
	.loc 1 1393 0
	testq	%rax, %rax
	je	.L255
	.loc 1 1394 0
	movb	$0, (%rax)
.L255:
	.loc 1 1397 0
	movq	%rbx, %rax
.LVL211:
.L256:
	movl	(%rax), %ecx
	addq	$4, %rax
	leal	-16843009(%rcx), %edx
	notl	%ecx
	andl	%ecx, %edx
	andl	$-2139062144, %edx
	je	.L256
	movl	%edx, %ecx
	shrl	$16, %ecx
	testl	$32896, %edx
	cmove	%ecx, %edx
	leaq	2(%rax), %rcx
	cmove	%rcx, %rax
	addb	%dl, %dl
	sbbq	$3, %rax
	subl	%ebx, %eax
.LVL212:
	.loc 1 1398 0
	testl	%eax, %eax
	jle	.L259
	.p2align 4,,10
	.p2align 3
.L410:
	.loc 1 1399 0
	subl	$1, %eax
.LVL213:
	movslq	%eax, %rcx
	movzbl	5280(%rsp,%rcx), %edx
	.loc 1 1398 0
	cmpb	$9, %dl
	je	.L260
	cmpb	$32, %dl
	je	.L260
	cmpb	$10, %dl
	je	.L260
	cmpb	$13, %dl
	.p2align 4,,2
	jne	.L261
.L260:
.LVL214:
	testl	%eax, %eax
	.loc 1 1401 0
	movb	$0, 5280(%rsp,%rcx)
	.loc 1 1398 0
	jg	.L410
.L259:
	.loc 1 1404 0
	testl	%eax, %eax
	je	.L415
.LVL215:
	.p2align 4,,10
	.p2align 3
.L261:
	.loc 1 1408 0
	xorl	%eax, %eax
	movq	%r13, %r8
	movq	%r15, %rcx
	movq	%rbp, %rdx
	movl	$.LC85, %esi
	movq	%rbx, %rdi
	call	__isoc99_sscanf
	cmpl	$3, %eax
	je	.L262
	.loc 1 1410 0
	xorl	%eax, %eax
	movq	%r13, %rcx
	movq	%rbp, %rdx
	movl	$.LC86, %esi
	movq	%rbx, %rdi
	call	__isoc99_sscanf
	cmpl	$2, %eax
	jne	.L263
	.loc 1 1411 0
	movq	$0, 248(%rsp)
.L262:
	.loc 1 1423 0
	cmpb	$47, 272(%rsp)
	jne	.L412
	jmp	.L485
.LVL216:
	.p2align 4,,10
	.p2align 3
.L265:
	.loc 1 1426 0
	leaq	2(%rax), %rsi
	leaq	1(%rax), %rdi
	call	strcpy
.LVL217:
.L412:
	.loc 1 1425 0
	movl	$.LC89, %esi
	movq	%rbp, %rdi
	call	strstr
.LVL218:
	testq	%rax, %rax
	jne	.L265
	.loc 1 1429 0
	movl	numthrottles(%rip), %edx
	movl	maxthrottles(%rip), %eax
.LVL219:
	cmpl	%eax, %edx
	jl	.L266
	.loc 1 1431 0
	testl	%eax, %eax
	jne	.L267
	.loc 1 1434 0
	movl	$4800, %edi
	.loc 1 1433 0
	movl	$100, maxthrottles(%rip)
	.loc 1 1434 0
	call	malloc
	movq	%rax, %rcx
	movq	%rax, throttles(%rip)
.L268:
	.loc 1 1441 0
	testq	%rcx, %rcx
	je	.L269
	movl	numthrottles(%rip), %edx
.L270:
	.loc 1 1452 0
	movq	%rbp, %rdi
	movl	%edx, 104(%rsp)
	movq	%rcx, 96(%rsp)
	call	e_strdup
	movl	104(%rsp), %edx
	movq	96(%rsp), %rcx
	movslq	%edx, %rdx
	leaq	(%rdx,%rdx,2), %rdx
	salq	$4, %rdx
	movq	%rax, (%rdx,%rcx)
	.loc 1 1453 0
	movslq	numthrottles(%rip), %rax
	movq	throttles(%rip), %rdx
	movq	256(%rsp), %rcx
	leaq	(%rax,%rax,2), %rax
	salq	$4, %rax
	movq	%rcx, 8(%rax,%rdx)
	.loc 1 1454 0
	movq	248(%rsp), %rcx
	.loc 1 1457 0
	movl	$0, 40(%rdx,%rax)
	.loc 1 1455 0
	movq	$0, 24(%rdx,%rax)
	.loc 1 1456 0
	movq	$0, 32(%rdx,%rax)
	.loc 1 1459 0
	addl	$1, numthrottles(%rip)
	.loc 1 1454 0
	movq	%rcx, 16(%rdx,%rax)
	jmp	.L415
.LVL220:
	.p2align 4,,10
	.p2align 3
.L217:
.LBE265:
.LBE262:
.LBB269:
.LBB250:
.LBB215:
	.loc 1 910 0
	movq	%r15, %rsi
	movq	%r14, %rdi
	movq	%r13, %rcx
.LBE215:
	repz cmpsb
	jne	.L218
	.loc 1 912 0
	movl	$0, do_chroot(%rip)
	.loc 1 913 0
	movl	$0, no_symlink_check(%rip)
	jmp	.L214
.LVL221:
	.p2align 4,,10
	.p2align 3
.L436:
	.loc 1 893 0
	movslq	%ebx, %rax
	addl	$1, %ebx
.LVL222:
	movq	(%r12,%rax,8), %rdi
	call	read_config
.LVL223:
	jmp	.L214
.LVL224:
	.p2align 4,,10
	.p2align 3
.L218:
.LBB216:
.LBB217:
	.loc 1 915 0
	movzbl	.LC61(%rip), %eax
	cmpl	%eax, %edx
	jne	.L219
.LVL225:
	movzbl	1(%r15), %eax
	cmpb	.LC61+1(%rip), %al
	jne	.L219
	movzbl	2(%r15), %eax
	cmpb	.LC61+2(%rip), %al
	jne	.L219
.LBE217:
.LBE216:
	movzbl	3(%r15), %eax
	cmpb	.LC61+3(%rip), %al
	jne	.L219
	cmpl	%ebx, %ebp
	jle	.L219
.LVL226:
	.loc 1 918 0
	movslq	%ebx, %rax
	addl	$1, %ebx
.LVL227:
	movq	(%r12,%rax,8), %rax
.LVL228:
	movq	%rax, data_dir(%rip)
	jmp	.L214
.LVL229:
	.p2align 4,,10
	.p2align 3
.L219:
.LBB218:
.LBB219:
	.loc 1 920 0
	movzbl	.LC62(%rip), %eax
	cmpl	%eax, %edx
	jne	.L220
.LVL230:
	movzbl	1(%r15), %eax
	cmpb	.LC62+1(%rip), %al
	jne	.L220
.LBE219:
.LBE218:
	movzbl	2(%r15), %eax
	cmpb	.LC62+2(%rip), %al
	jne	.L220
	.loc 1 921 0
	movl	$0, no_symlink_check(%rip)
	jmp	.L214
.L220:
.LVL231:
.LBB220:
	.loc 1 922 0
	movq	%r15, %rsi
	movl	$.LC63, %edi
	movq	%r13, %rcx
.LBE220:
	repz cmpsb
	je	.L450
.LVL232:
.LBB221:
.LBB222:
	.loc 1 924 0
	movzbl	.LC64(%rip), %eax
	cmpl	%eax, %edx
	jne	.L222
.LVL233:
	movzbl	1(%r15), %eax
	cmpb	.LC64+1(%rip), %al
	jne	.L222
.LBE222:
.LBE221:
	movzbl	2(%r15), %eax
	cmpb	.LC64+2(%rip), %al
	jne	.L222
	cmpl	%ebx, %ebp
	jle	.L222
.LVL234:
	.loc 1 927 0
	movslq	%ebx, %rax
	addl	$1, %ebx
.LVL235:
	movq	(%r12,%rax,8), %rax
.LVL236:
	movq	%rax, user(%rip)
	jmp	.L214
.LVL237:
	.p2align 4,,10
	.p2align 3
.L437:
	.loc 2 286 0
	movslq	%ebx, %rax
.LBB223:
.LBB224:
	movl	$10, %edx
	xorl	%esi, %esi
	movq	(%r12,%rax,8), %rdi
.LBE224:
.LBE223:
	.loc 1 898 0
	addl	$1, %ebx
.LVL238:
.LBB226:
.LBB225:
	.loc 2 286 0
	call	strtol
.LVL239:
.LBE225:
.LBE226:
	.loc 1 898 0
	movw	%ax, port(%rip)
	jmp	.L214
.LVL240:
.L263:
.LBE250:
.LBE269:
.LBB270:
.LBB266:
	.loc 1 1414 0
	movq	%rbx, %rcx
	movq	%r14, %rdx
	xorl	%eax, %eax
	movl	$.LC87, %esi
	movl	$2, %edi
	call	syslog
	.loc 1 1416 0
	movq	argv0(%rip), %rdx
	movq	stderr(%rip), %rdi
	movq	%rbx, %r8
	movq	%r14, %rcx
	movl	$.LC88, %esi
	xorl	%eax, %eax
	call	fprintf
	jmp	.L415
.L267:
	.loc 1 1438 0
	addl	%eax, %eax
	.loc 1 1439 0
	movq	throttles(%rip), %rdi
	.loc 1 1438 0
	movl	%eax, maxthrottles(%rip)
	.loc 1 1439 0
	cltq
	leaq	(%rax,%rax,2), %rsi
	salq	$4, %rsi
	call	realloc
	movq	%rax, %rcx
	movq	%rax, throttles(%rip)
	jmp	.L268
.L448:
	.loc 1 1461 0
	movq	%r12, %rdi
	call	fclose
.LVL241:
.L252:
.LBE266:
.LBE270:
	.loc 1 404 0
	call	getuid
	testl	%eax, %eax
	movl	$32767, %r14d
	movl	$32767, %r15d
	je	.L451
.LVL242:
.L273:
	.loc 1 418 0
	movq	logfile(%rip), %rax
	xorl	%r12d, %r12d
	testq	%rax, %rax
	je	.L276
.LVL243:
.LBB271:
	.loc 1 420 0
	movl	$.LC94, %edi
	movl	$10, %ecx
	movq	%rax, %rsi
.LBE271:
	repz cmpsb
	je	.L452
.LVL244:
.LBB272:
.LBB273:
	.loc 1 425 0
	movzbl	(%rax), %edx
	cmpb	.LC95(%rip), %dl
	je	.L453
.LVL245:
.L278:
.LBE273:
.LBE272:
	.loc 1 429 0
	movl	$.LC96, %esi
	movq	%rax, %rdi
	call	fopen
.LVL246:
	.loc 1 430 0
	movq	logfile(%rip), %rdi
	movl	$384, %esi
	.loc 1 429 0
	movq	%rax, %r12
.LVL247:
	.loc 1 430 0
	call	chmod
.LVL248:
	.loc 1 431 0
	testl	%eax, %eax
	jne	.L393
	testq	%r12, %r12
	je	.L393
	.loc 1 437 0
	movq	logfile(%rip), %rax
.LVL249:
	cmpb	$47, (%rax)
	je	.L281
	.loc 1 439 0
	movl	$.LC97, %esi
	movl	$4, %edi
	xorl	%eax, %eax
	call	syslog
	.loc 1 440 0
	movq	argv0(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$.LC98, %esi
	xorl	%eax, %eax
	call	fprintf
.L281:
	.loc 1 442 0
	movq	%r12, %rdi
	call	fileno
	movl	$1, %edx
	movl	%eax, %edi
	movl	$2, %esi
	xorl	%eax, %eax
	call	fcntl
	.loc 1 443 0
	call	getuid
	testl	%eax, %eax
	je	.L454
.LVL250:
.L276:
	.loc 1 460 0
	movq	dir(%rip), %rdi
	testq	%rdi, %rdi
	je	.L282
	.loc 1 462 0
	call	chdir
	testl	%eax, %eax
	js	.L455
.L282:
	.loc 1 486 0
	leaq	10288(%rsp), %rbp
	movl	$4096, %esi
	movq	%rbp, %rdi
	call	getcwd
	.loc 1 487 0
	movq	%rbp, %rdx
.L283:
	movl	(%rdx), %ecx
	addq	$4, %rdx
	leal	-16843009(%rcx), %eax
	notl	%ecx
	andl	%ecx, %eax
	andl	$-2139062144, %eax
	je	.L283
	movl	%eax, %ecx
	shrl	$16, %ecx
	testl	$32896, %eax
	cmove	%ecx, %eax
	leaq	2(%rdx), %rcx
	cmove	%rcx, %rdx
	addb	%al, %al
	sbbq	$3, %rdx
	subq	%rbp, %rdx
	cmpb	$47, 10287(%rsp,%rdx)
	je	.L285
	.loc 1 488 0
	movq	%rbp, %rdx
.L286:
	movl	(%rdx), %ecx
	addq	$4, %rdx
	leal	-16843009(%rcx), %eax
	notl	%ecx
	andl	%ecx, %eax
	andl	$-2139062144, %eax
	je	.L286
	movl	%eax, %ecx
	shrl	$16, %ecx
	testl	$32896, %eax
	cmove	%ecx, %eax
	leaq	2(%rdx), %rcx
	cmove	%rcx, %rdx
	addb	%al, %al
	sbbq	$3, %rdx
	movw	$47, (%rdx)
.L285:
	.loc 1 490 0
	movl	debug(%rip), %r8d
	testl	%r8d, %r8d
	jne	.L288
	.loc 1 495 0
	movq	stdin(%rip), %rdi
	call	fclose
	.loc 1 496 0
	movq	stdout(%rip), %rdi
	cmpq	%rdi, %r12
	je	.L289
	.loc 1 497 0
	call	fclose
.L289:
	.loc 1 498 0
	movq	stderr(%rip), %rdi
	call	fclose
	.loc 1 502 0
	movl	$1, %esi
	movl	$1, %edi
	call	daemon
	testl	%eax, %eax
	.loc 1 504 0
	movl	$.LC103, %esi
	.loc 1 502 0
	js	.L432
.L290:
	.loc 1 533 0
	movq	pidfile(%rip), %rdi
	testq	%rdi, %rdi
	je	.L291
.LBB274:
	.loc 1 536 0
	movl	$.LC104, %esi
	call	fopen
	.loc 1 537 0
	testq	%rax, %rax
	.loc 1 536 0
	movq	%rax, %r13
.LVL251:
	.loc 1 537 0
	je	.L456
	.loc 1 542 0
	call	getpid
.LVL252:
	movq	%r13, %rdi
	movl	%eax, %edx
	movl	$.LC105, %esi
	xorl	%eax, %eax
	call	fprintf
	.loc 1 543 0
	movq	%r13, %rdi
	call	fclose
.LVL253:
.L291:
.LBE274:
	.loc 1 549 0
	call	fdwatch_get_nfiles
	.loc 1 550 0
	testl	%eax, %eax
	.loc 1 549 0
	movl	%eax, max_connects(%rip)
	.loc 1 550 0
	js	.L457
	.loc 1 558 0
	movl	do_chroot(%rip), %edi
	.loc 1 555 0
	subl	$10, %eax
	movl	%eax, max_connects(%rip)
	.loc 1 558 0
	testl	%edi, %edi
	jne	.L458
.L294:
	.loc 1 598 0
	movq	data_dir(%rip), %rdi
	testq	%rdi, %rdi
	je	.L299
	.loc 1 600 0
	call	chdir
	testl	%eax, %eax
	js	.L459
.L299:
	.loc 1 610 0
	movl	$handle_term, %esi
	movl	$15, %edi
	xorl	%eax, %eax
	call	sigset
	.loc 1 611 0
	movl	$handle_term, %esi
	movl	$2, %edi
	xorl	%eax, %eax
	call	sigset
	.loc 1 612 0
	movl	$handle_chld, %esi
	movl	$17, %edi
	xorl	%eax, %eax
	call	sigset
	.loc 1 613 0
	movl	$1, %esi
	movl	$13, %edi
	xorl	%eax, %eax
	call	sigset
	.loc 1 614 0
	movl	$handle_hup, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	sigset
	.loc 1 615 0
	movl	$handle_usr1, %esi
	movl	$10, %edi
	xorl	%eax, %eax
	call	sigset
	.loc 1 616 0
	movl	$handle_usr2, %esi
	movl	$12, %edi
	xorl	%eax, %eax
	call	sigset
	.loc 1 617 0
	movl	$handle_alrm, %esi
	movl	$14, %edi
	xorl	%eax, %eax
	call	sigset
	.loc 1 631 0
	movl	$360, %edi
	.loc 1 628 0
	movl	$0, got_hup(%rip)
	.loc 1 629 0
	movl	$0, got_usr1(%rip)
	.loc 1 630 0
	movl	$0, watchdog_flag(%rip)
	.loc 1 631 0
	call	alarm
	.loc 1 634 0
	call	tmr_init
	.loc 1 639 0
	movl	112(%rsp), %esi
	movl	116(%rsp), %ecx
	leaq	14400(%rsp), %rdx
	xorl	%eax, %eax
	movl	cgi_limit(%rip), %r9d
	movq	cgi_pattern(%rip), %r8
	movq	hostname(%rip), %rdi
	movq	%r12, 40(%rsp)
	testl	%esi, %esi
	leaq	14528(%rsp), %rsi
	movq	%rbp, 24(%rsp)
	cmove	%rax, %rdx
	testl	%ecx, %ecx
	movzwl	port(%rip), %ecx
	cmove	%rax, %rsi
	movl	no_empty_referers(%rip), %eax
	movl	%eax, 88(%rsp)
	movq	local_pattern(%rip), %rax
	movq	%rax, 80(%rsp)
	movq	url_pattern(%rip), %rax
	movq	%rax, 72(%rsp)
	movl	do_global_passwd(%rip), %eax
	movl	%eax, 64(%rsp)
	movl	do_vhost(%rip), %eax
	movl	%eax, 56(%rsp)
	movl	no_symlink_check(%rip), %eax
	movl	%eax, 48(%rsp)
	movl	no_log(%rip), %eax
	movl	%eax, 32(%rsp)
	movl	max_age(%rip), %eax
	movl	%eax, 16(%rsp)
	movq	p3p(%rip), %rax
	movq	%rax, 8(%rsp)
	movq	charset(%rip), %rax
	movq	%rax, (%rsp)
	call	httpd_initialize
	.loc 1 645 0
	testq	%rax, %rax
	.loc 1 639 0
	movq	%rax, hs(%rip)
	.loc 1 645 0
	je	.L433
	.loc 1 649 0
	movq	JunkClientData(%rip), %rdx
	xorl	%edi, %edi
	movl	$1, %r8d
	movl	$120000, %ecx
	movl	$occasional, %esi
	call	tmr_create
	testq	%rax, %rax
	je	.L460
	.loc 1 655 0
	movq	JunkClientData(%rip), %rdx
	xorl	%edi, %edi
	movl	$1, %r8d
	movl	$5000, %ecx
	movl	$idle, %esi
	call	tmr_create
	testq	%rax, %rax
	je	.L461
	.loc 1 660 0
	movl	numthrottles(%rip), %r13d
	testl	%r13d, %r13d
	jle	.L307
	.loc 1 663 0
	movq	JunkClientData(%rip), %rdx
	xorl	%edi, %edi
	movl	$1, %r8d
	movl	$2000, %ecx
	movl	$update_throttles, %esi
	call	tmr_create
	testq	%rax, %rax
	je	.L462
.L307:
	.loc 1 671 0
	movq	JunkClientData(%rip), %rdx
	xorl	%edi, %edi
	movl	$1, %r8d
	movl	$3600000, %ecx
	movl	$show_stats, %esi
	call	tmr_create
	testq	%rax, %rax
	je	.L463
	.loc 1 677 0
	xorl	%edi, %edi
	call	time
	.loc 1 678 0
	movq	$0, stats_connections(%rip)
	.loc 1 677 0
	movq	%rax, stats_time(%rip)
	movq	%rax, start_time(%rip)
	.loc 1 679 0
	movq	$0, stats_bytes(%rip)
	.loc 1 680 0
	movl	$0, stats_simultaneous(%rip)
	.loc 1 683 0
	call	getuid
	testl	%eax, %eax
	jne	.L309
	.loc 1 686 0
	xorl	%esi, %esi
	xorl	%edi, %edi
	call	setgroups
	testl	%eax, %eax
	.loc 1 688 0
	movl	$.LC118, %esi
	.loc 1 686 0
	js	.L432
	.loc 1 692 0
	movl	%r14d, %edi
	call	setgid
	testl	%eax, %eax
	.loc 1 694 0
	movl	$.LC119, %esi
	.loc 1 692 0
	js	.L432
	.loc 1 698 0
	movq	user(%rip), %rdi
	movl	%r14d, %esi
	call	initgroups
	testl	%eax, %eax
	js	.L464
.L312:
	.loc 1 705 0
	movl	%r15d, %edi
	call	setuid
	testl	%eax, %eax
	.loc 1 707 0
	movl	$.LC121, %esi
	.loc 1 705 0
	js	.L432
	.loc 1 711 0
	cmpl	$0, do_chroot(%rip)
	je	.L465
.L309:
	.loc 1 718 0
	movslq	max_connects(%rip), %rdi
	imulq	$144, %rdi, %rdi
	call	malloc
	.loc 1 719 0
	testq	%rax, %rax
	.loc 1 718 0
	movq	%rax, connects(%rip)
	.loc 1 719 0
	je	.L314
.LVL254:
	.loc 1 724 0
	movl	max_connects(%rip), %esi
	testl	%esi, %esi
	jle	.L316
	.loc 1 722 0
	movq	%rax, %rdx
	xorl	%ecx, %ecx
.LVL255:
.L317:
	.loc 1 727 0
	addl	$1, %ecx
	.loc 1 726 0
	movl	$0, (%rdx)
	.loc 1 728 0
	movq	$0, 8(%rdx)
.LVL256:
	.loc 1 727 0
	movl	%ecx, 4(%rdx)
	.loc 1 728 0
	addq	$144, %rdx
	.loc 1 724 0
	cmpl	%esi, %ecx
	jl	.L317
.LVL257:
.L316:
	.loc 1 730 0
	movslq	%esi, %rdx
	subq	$1, %rdx
	imulq	$144, %rdx, %rdx
	movl	$-1, 4(%rax,%rdx)
	.loc 1 735 0
	movq	hs(%rip), %rax
	.loc 1 731 0
	movl	$0, first_free_connect(%rip)
	.loc 1 732 0
	movl	$0, num_connects(%rip)
	.loc 1 733 0
	movl	$0, httpd_conn_count(%rip)
	.loc 1 735 0
	testq	%rax, %rax
	je	.L318
	.loc 1 737 0
	movl	72(%rax), %edi
	cmpl	$-1, %edi
	je	.L319
	.loc 1 738 0
	xorl	%edx, %edx
	xorl	%esi, %esi
	call	fdwatch_add_fd
	movq	hs(%rip), %rax
.L319:
	.loc 1 739 0
	movl	76(%rax), %edi
	cmpl	$-1, %edi
	je	.L318
	.loc 1 740 0
	xorl	%edx, %edx
	xorl	%esi, %esi
	call	fdwatch_add_fd
.L318:
	.loc 1 744 0
	leaq	224(%rsp), %r13
.LBB275:
.LBB278:
	.loc 1 1837 0
	movl	$1, %r14d
.LVL258:
.LBE278:
.LBE275:
	.loc 1 744 0
	movq	%r13, %rdi
	call	tmr_prepare_timeval
	movl	terminate(%rip), %eax
.LVL259:
.L417:
	.loc 1 745 0
	testl	%eax, %eax
	jne	.L396
.L388:
	.loc 1 748 0
	movl	got_hup(%rip), %eax
	testl	%eax, %eax
	jne	.L466
.L321:
	.loc 1 755 0
	movq	%r13, %rdi
	call	tmr_mstimeout
	movq	%rax, %rdi
	call	fdwatch
	.loc 1 756 0
	testl	%eax, %eax
	.loc 1 755 0
	movl	%eax, %ebp
.LVL260:
	.loc 1 756 0
	js	.L467
	.loc 1 763 0
	movq	%r13, %rdi
	call	tmr_prepare_timeval
.LVL261:
	.loc 1 765 0
	testl	%ebp, %ebp
	je	.L468
	.loc 1 773 0
	movq	hs(%rip), %rax
	testq	%rax, %rax
	je	.L414
	movl	76(%rax), %edi
	cmpl	$-1, %edi
	je	.L331
	.loc 1 774 0
	call	fdwatch_check_fd
	.loc 1 773 0
	testl	%eax, %eax
	jne	.L469
.L332:
	.loc 1 783 0
	movq	hs(%rip), %rax
	testq	%rax, %rax
	je	.L414
.L331:
	movl	72(%rax), %edi
	cmpl	$-1, %edi
	je	.L414
	.loc 1 784 0
	call	fdwatch_check_fd
	.loc 1 783 0
	testl	%eax, %eax
	jne	.L470
.LVL262:
	.p2align 4,,10
	.p2align 3
.L414:
	.loc 1 795 0
	call	fdwatch_get_next_client_data
	cmpq	$-1, %rax
	movq	%rax, %rbp
.LVL263:
	je	.L471
.L383:
	.loc 1 797 0
	testq	%rbp, %rbp
	je	.L414
.LVL264:
	.loc 1 800 0
	movq	8(%rbp), %rax
.LVL265:
	movl	704(%rax), %edi
	call	fdwatch_check_fd
.LVL266:
	testl	%eax, %eax
	je	.L369
	.loc 1 804 0
	movl	0(%rbp), %eax
	cmpl	$2, %eax
	je	.L335
	cmpl	$4, %eax
	je	.L336
	cmpl	$1, %eax
	jne	.L414
.LVL267:
.LBB284:
.LBB287:
	.loc 1 1589 0
	movq	8(%rbp), %r12
.LVL268:
	.loc 1 1592 0
	movq	152(%r12), %rdx
	cmpq	%rdx, 160(%r12)
	jb	.L337
	.loc 1 1594 0
	cmpq	$5000, %rdx
	ja	.L427
	.loc 1 1600 0
	leaq	152(%r12), %rsi
	leaq	144(%r12), %rdi
	addq	$1000, %rdx
	call	httpd_realloc_str
.LVL269:
	movq	152(%r12), %rdx
.L337:
	.loc 1 1605 0
	movq	144(%r12), %rsi
	addq	160(%r12), %rsi
	movl	704(%r12), %edi
	call	read
.LVL270:
	.loc 1 1608 0
	cmpl	$0, %eax
	je	.L427
	.loc 1 1614 0
	jl	.L472
	.loc 1 1628 0
	cltq
	addq	%rax, 160(%r12)
	.loc 1 1632 0
	movq	%r12, %rdi
	.loc 1 1629 0
	movq	224(%rsp), %rax
.LVL271:
	movq	%rax, 88(%rbp)
	.loc 1 1632 0
	call	httpd_got_request
	testl	%eax, %eax
	je	.L414
	cmpl	$2, %eax
	je	.L427
	.loc 1 1643 0
	movq	%r12, %rdi
	call	httpd_parse_request
	testl	%eax, %eax
	js	.L429
.LVL272:
.LBB288:
.LBB289:
	.loc 1 1889 0
	cmpl	$0, numthrottles(%rip)
	.loc 1 1887 0
	movl	$0, 56(%rbp)
	.loc 1 1888 0
	movq	$-1, 72(%rbp)
	movq	$-1, 64(%rbp)
.LVL273:
	.loc 1 1889 0
	jle	.L344
	xorl	%r15d, %r15d
	xorl	%ecx, %ecx
	jmp	.L351
.LVL274:
.L473:
	movq	throttles(%rip), %rsi
.L347:
	.loc 1 1904 0
	movl	56(%rbp), %eax
	movslq	%eax, %rdx
	addl	$1, %eax
	movl	%eax, 56(%rbp)
	.loc 1 1905 0
	movq	%r15, %rax
	addq	throttles(%rip), %rax
	.loc 1 1904 0
	movl	%ecx, 16(%rbp,%rdx,4)
	.loc 1 1905 0
	addl	$1, 40(%rax)
	.loc 1 1906 0
	movq	8(%rax), %rdx
	movslq	40(%rax), %rdi
	movq	%rdx, %rax
	sarq	$63, %rdx
	idivq	%rdi
.LVL275:
	.loc 1 1907 0
	movq	64(%rbp), %rdx
	cmpq	$-1, %rdx
	je	.L423
	.loc 1 1910 0
	cmpq	%rdx, %rax
	cmovg	%rdx, %rax
.LVL276:
.L423:
	.loc 1 1912 0
	movq	72(%rbp), %rdx
	.loc 1 1910 0
	movq	%rax, 64(%rbp)
	.loc 1 1911 0
	movq	16(%rsi,%r15), %rax
.LVL277:
	.loc 1 1912 0
	cmpq	$-1, %rdx
	je	.L424
	.loc 1 1915 0
	cmpq	%rax, %rdx
	cmovge	%rdx, %rax
.L424:
	movq	%rax, 72(%rbp)
.LVL278:
.L345:
	.loc 1 1890 0
	addl	$1, %ecx
.LVL279:
	.loc 1 1889 0
	cmpl	numthrottles(%rip), %ecx
	jge	.L344
	addq	$48, %r15
	cmpl	$9, 56(%rbp)
	jg	.L344
.LVL280:
.L351:
	.loc 1 1891 0
	movq	8(%rbp), %rax
	movl	%ecx, 96(%rsp)
	movq	240(%rax), %rsi
	movq	throttles(%rip), %rax
	movq	(%rax,%r15), %rdi
	call	match
	testl	%eax, %eax
	movl	96(%rsp), %ecx
	je	.L345
	.loc 1 1894 0
	movq	%r15, %rax
	addq	throttles(%rip), %rax
	movq	8(%rax), %rsi
	movq	24(%rax), %rdx
	addq	%rsi, %rsi
	cmpq	%rsi, %rdx
	jg	.L346
	.loc 1 1897 0
	cmpq	16(%rax), %rdx
	jl	.L346
	.loc 1 1899 0
	movl	40(%rax), %r11d
	testl	%r11d, %r11d
	jns	.L473
	.loc 1 1901 0
	movl	$.LC127, %esi
	movl	$3, %edi
	xorl	%eax, %eax
	movl	%ecx, 96(%rsp)
	call	syslog
	.loc 1 1902 0
	movq	throttles(%rip), %rsi
	movl	96(%rsp), %ecx
	movl	$0, 40(%rsi,%r15)
	jmp	.L347
.LVL281:
	.p2align 4,,10
	.p2align 3
.L266:
.LBE289:
.LBE288:
.LBE287:
.LBE284:
.LBB294:
.LBB264:
	.loc 1 1447 0
	movq	throttles(%rip), %rcx
	jmp	.L270
.LVL282:
.L450:
.LBE264:
.LBE294:
.LBB295:
.LBB193:
	.loc 1 923 0
	movl	$1, no_symlink_check(%rip)
	jmp	.L214
.LVL283:
.L452:
.LBE193:
.LBE295:
	.loc 1 422 0
	movl	$1, no_log(%rip)
.LVL284:
	jmp	.L276
.LVL285:
.L222:
.LBB296:
.LBB251:
.LBB227:
.LBB228:
	.loc 1 929 0
	movzbl	.LC65(%rip), %eax
	cmpl	%eax, %edx
	jne	.L223
.LVL286:
	movzbl	1(%r15), %eax
	cmpb	.LC65+1(%rip), %al
	jne	.L223
.LBE228:
.LBE227:
	movzbl	2(%r15), %eax
	cmpb	.LC65+2(%rip), %al
	jne	.L223
	cmpl	%ebx, %ebp
	jle	.L223
.LVL287:
	.loc 1 932 0
	movslq	%ebx, %rax
	addl	$1, %ebx
.LVL288:
	movq	(%r12,%rax,8), %rax
.LVL289:
	movq	%rax, cgi_pattern(%rip)
	jmp	.L214
.LVL290:
.L223:
.LBB229:
.LBB230:
	.loc 1 934 0
	movzbl	.LC66(%rip), %eax
	cmpl	%eax, %edx
	je	.L474
.LVL291:
.L224:
.LBE230:
.LBE229:
.LBB232:
.LBB233:
	.loc 1 939 0
	movzbl	.LC67(%rip), %eax
	cmpl	%eax, %edx
	jne	.L225
.LVL292:
	movzbl	1(%r15), %eax
	cmpb	.LC67+1(%rip), %al
	jne	.L225
.LBE233:
.LBE232:
	movzbl	2(%r15), %eax
	cmpb	.LC67+2(%rip), %al
	jne	.L225
	cmpl	%ebx, %ebp
	jle	.L225
.LVL293:
	.loc 1 942 0
	movslq	%ebx, %rax
	addl	$1, %ebx
.LVL294:
	movq	(%r12,%rax,8), %rax
.LVL295:
	movq	%rax, hostname(%rip)
	jmp	.L214
.LVL296:
.L485:
.LBE251:
.LBE296:
.LBB297:
.LBB267:
	.loc 1 1424 0
	movq	120(%rsp), %rsi
	movq	%rbp, %rdi
	call	strcpy
	jmp	.L412
.LVL297:
.L288:
.LBE267:
.LBE297:
	.loc 1 529 0
	call	setsid
	.p2align 4,,8
	jmp	.L290
.LVL298:
.L451:
	.loc 1 406 0
	movq	user(%rip), %rdi
	call	getpwnam
.LVL299:
	.loc 1 407 0
	testq	%rax, %rax
	je	.L475
	.loc 1 413 0
	movl	16(%rax), %r15d
.LVL300:
	.loc 1 414 0
	movl	20(%rax), %r14d
.LVL301:
	jmp	.L273
.LVL302:
.L240:
.LBB298:
.LBB257:
	.loc 1 1315 0
	movl	$0, 112(%rsp)
.LVL303:
.L248:
	call	freeaddrinfo
.LBE257:
.LBE298:
	.loc 1 387 0
	cmpl	$0, 112(%rsp)
	.loc 1 391 0
	movl	$0, 116(%rsp)
	.loc 1 387 0
	jne	.L250
	.loc 1 389 0
	movl	$.LC82, %esi
	movl	$3, %edi
	xorl	%eax, %eax
	call	syslog
	.loc 1 390 0
	movq	argv0(%rip), %rdx
	movl	$.LC83, %esi
.LVL304:
.L431:
.LBB299:
.LBB263:
	.loc 1 1444 0
	movq	stderr(%rip), %rdi
	xorl	%eax, %eax
	call	fprintf
.LVL305:
.L433:
	.loc 1 1447 0
	movl	$1, %edi
	call	exit
.LVL306:
.L453:
.LBE263:
.LBE299:
	.loc 1 425 0
	movzbl	1(%rax), %edx
	cmpb	.LC95+1(%rip), %dl
	jne	.L278
	.loc 1 426 0
	movq	stdout(%rip), %r12
.LVL307:
	jmp	.L276
.LVL308:
.L457:
	.loc 1 552 0
	movl	$.LC106, %esi
.L432:
	movl	$2, %edi
	xorl	%eax, %eax
	call	syslog
	.loc 1 553 0
	movl	$1, %edi
	call	exit
.LVL309:
.L474:
.LBB300:
.LBB192:
.LBB201:
.LBB231:
	.loc 1 934 0
	movzbl	1(%r15), %eax
	cmpb	.LC66+1(%rip), %al
	jne	.L224
.LBE231:
.LBE201:
	movzbl	2(%r15), %eax
	cmpb	.LC66+2(%rip), %al
	jne	.L224
	cmpl	%ebx, %ebp
	jle	.L224
.LVL310:
	.loc 1 937 0
	movslq	%ebx, %rax
	addl	$1, %ebx
.LVL311:
	movq	(%r12,%rax,8), %rax
.LVL312:
	movq	%rax, throttlefile(%rip)
	jmp	.L214
.LVL313:
.L477:
.LBE192:
.LBE300:
.LBB301:
.LBB281:
	.loc 1 1743 0
	call	__errno_location
.LVL314:
	movl	(%rax), %eax
	cmpl	$4, %eax
	je	.L414
	.loc 1 1746 0
	cmpl	$11, %eax
	je	.L365
	.loc 1 1788 0
	cmpl	$22, %eax
	je	.L369
	cmpl	$32, %eax
	.p2align 4,,2
	je	.L369
	cmpl	$104, %eax
	.p2align 4,,2
	je	.L369
	.loc 1 1789 0
	movq	208(%r12), %rdx
	movl	$.LC130, %esi
	movl	$3, %edi
	xorl	%eax, %eax
	call	syslog
.LVL315:
.L369:
	.loc 1 1790 0
	movq	%rbp, %rdi
	movq	%r13, %rsi
	call	clear_connection
.LBE281:
.LBE301:
	.loc 1 795 0
	call	fdwatch_get_next_client_data
	cmpq	$-1, %rax
	movq	%rax, %rbp
.LVL316:
	jne	.L383
.L471:
	.loc 1 811 0
	movq	%r13, %rdi
	call	tmr_run
.LVL317:
	.loc 1 813 0
	movl	got_usr1(%rip), %eax
	testl	%eax, %eax
	je	.L430
	cmpl	$0, terminate(%rip)
	jne	.L396
	.loc 1 816 0
	movq	hs(%rip), %rax
	.loc 1 815 0
	movl	$1, terminate(%rip)
	.loc 1 816 0
	testq	%rax, %rax
	je	.L396
	.loc 1 818 0
	movl	72(%rax), %edi
	cmpl	$-1, %edi
	je	.L386
	.loc 1 819 0
	call	fdwatch_del_fd
	movq	hs(%rip), %rax
.L386:
	.loc 1 820 0
	movl	76(%rax), %edi
	cmpl	$-1, %edi
	je	.L387
	.loc 1 821 0
	call	fdwatch_del_fd
	movq	hs(%rip), %rax
.L387:
	.loc 1 822 0
	movq	%rax, %rdi
	call	httpd_unlisten
	jmp	.L430
.LVL318:
.L396:
	.loc 1 745 0
	movl	num_connects(%rip), %r10d
	testl	%r10d, %r10d
	jg	.L388
	.loc 1 828 0
	call	shut_down
	.loc 1 829 0
	movl	$5, %edi
	movl	$.LC45, %esi
	xorl	%eax, %eax
	call	syslog
	.loc 1 830 0
	call	closelog
	.loc 1 831 0
	xorl	%edi, %edi
	call	exit
.LVL319:
	.p2align 4,,10
	.p2align 3
.L467:
	.loc 1 758 0
	call	__errno_location
.LVL320:
	movl	(%rax), %eax
	cmpl	$11, %eax
	jne	.L476
.LVL321:
.L430:
	.loc 1 822 0
	movl	terminate(%rip), %eax
	jmp	.L417
.LVL322:
.L335:
.LBB302:
.LBB277:
	.loc 1 1716 0
	movq	64(%rbp), %rdx
	.loc 1 1713 0
	movq	8(%rbp), %r12
.LVL323:
	.loc 1 1716 0
	movl	$1000000000, %eax
	cmpq	$-1, %rdx
	je	.L360
	.loc 1 1719 0
	leaq	3(%rdx), %rax
	testq	%rdx, %rdx
	cmovns	%rdx, %rax
	sarq	$2, %rax
.L360:
.LVL324:
	.loc 1 1722 0
	cmpq	$0, 472(%r12)
	jne	.L361
	.loc 1 1727 0
	movq	136(%rbp), %rsi
	.loc 1 1725 0
	movq	128(%rbp), %rdx
	movl	704(%r12), %edi
	subq	%rsi, %rdx
	cmpq	%rdx, %rax
	cmovbe	%rax, %rdx
	addq	712(%r12), %rsi
	call	write
.LVL325:
.L362:
	.loc 1 1743 0
	cmpl	$0, %eax
	jl	.L477
	.loc 1 1746 0
	je	.L365
	.loc 1 1795 0
	movq	224(%rsp), %rdx
	.loc 1 1797 0
	movslq	%eax, %r8
	.loc 1 1795 0
	movq	%rdx, 88(%rbp)
	.loc 1 1797 0
	movq	472(%r12), %rdx
	testq	%rdx, %rdx
	je	.L371
	.loc 1 1800 0
	cmpq	%r8, %rdx
	ja	.L478
	.loc 1 1811 0
	subl	%edx, %eax
.LVL326:
	.loc 1 1812 0
	movq	$0, 472(%r12)
	movslq	%eax, %r8
.LVL327:
.L371:
	.loc 1 1817 0
	movq	8(%rbp), %rdi
	.loc 1 1818 0
	movl	56(%rbp), %r9d
	.loc 1 1816 0
	addq	%r8, 136(%rbp)
	.loc 1 1817 0
	addq	%r8, 200(%rdi)
.LVL328:
	.loc 1 1818 0
	testl	%r9d, %r9d
	jle	.L373
	.loc 1 1819 0
	movq	throttles(%rip), %rsi
	movq	%rbp, %rcx
	xorl	%edx, %edx
.LVL329:
.L374:
	movslq	16(%rcx), %rax
	.loc 1 1818 0
	addl	$1, %edx
.LVL330:
	addq	$4, %rcx
	.loc 1 1819 0
	leaq	(%rax,%rax,2), %rax
	salq	$4, %rax
	addq	%r8, 32(%rsi,%rax)
	.loc 1 1818 0
	cmpl	%edx, %r9d
	jg	.L374
.LVL331:
.L373:
	.loc 1 1822 0
	movq	128(%rbp), %rax
	cmpq	%rax, 136(%rbp)
	jge	.L429
	.loc 1 1830 0
	movq	112(%rbp), %rax
	cmpq	$100, %rax
	jle	.L376
	.loc 1 1831 0
	subq	$100, %rax
	movq	%rax, 112(%rbp)
.L376:
	.loc 1 1834 0
	movq	64(%rbp), %rcx
	cmpq	$-1, %rcx
	je	.L414
	.loc 1 1836 0
	movq	224(%rsp), %r15
.LVL332:
	.loc 1 1837 0
	subq	80(%rbp), %r15
	.loc 1 1839 0
	movq	200(%rdi), %rdx
	.loc 1 1837 0
	cmove	%r14, %r15
.LVL333:
	.loc 1 1839 0
	movq	%rdx, %rax
	sarq	$63, %rdx
	idivq	%r15
	cmpq	%rax, %rcx
	jge	.L414
	.loc 1 1841 0
	movl	$3, 0(%rbp)
	.loc 1 1842 0
	movl	704(%r12), %edi
	call	fdwatch_del_fd
	.loc 1 1846 0
	movq	8(%rbp), %rax
	movq	200(%rax), %rdx
	movq	%rdx, %rax
	sarq	$63, %rdx
	idivq	64(%rbp)
	subl	%r15d, %eax
	.loc 1 1848 0
	cmpq	$0, 96(%rbp)
	.loc 1 1846 0
	movl	%eax, %r15d
.LVL334:
	.loc 1 1848 0
	je	.L378
	.loc 1 1849 0
	movl	$.LC128, %esi
	movl	$3, %edi
	xorl	%eax, %eax
.LVL335:
	call	syslog
.L378:
	.loc 1 1850 0
	testl	%r15d, %r15d
	movl	$500, %ecx
	jle	.L380
	movslq	%r15d, %rcx
	imulq	$1000, %rcx, %rcx
.LVL336:
.L380:
	xorl	%r8d, %r8d
	movq	%rbp, %rdx
	movl	$wakeup_connection, %esi
	movq	%r13, %rdi
	call	tmr_create
	.loc 1 1853 0
	testq	%rax, %rax
	.loc 1 1850 0
	movq	%rax, 96(%rbp)
	.loc 1 1853 0
	jne	.L414
	.loc 1 1855 0
	movl	$2, %edi
	movl	$.LC129, %esi
	call	syslog
	.loc 1 1856 0
	movl	$1, %edi
	call	exit
.LVL337:
	.p2align 4,,10
	.p2align 3
.L336:
.LBE277:
.LBE302:
.LBB303:
.LBB304:
	.loc 1 1873 0
	movq	8(%rbp), %rax
	movl	$4096, %edx
	movq	%rbx, %rsi
	movl	704(%rax), %edi
	call	read
.LVL338:
	.loc 1 1874 0
	cmpl	$0, %eax
	jl	.L479
	.loc 1 1876 0
	jne	.L414
	.p2align 4,,8
	jmp	.L382
.LVL339:
.L472:
.LBE304:
.LBE303:
.LBB306:
.LBB291:
	.loc 1 1621 0
	.p2align 4,,11
	call	__errno_location
.LVL340:
	movl	(%rax), %eax
	cmpl	$11, %eax
	.p2align 4,,3
	je	.L414
	cmpl	$4, %eax
	je	.L414
.L427:
	.loc 1 1637 0
	movq	httpd_err400form(%rip), %r8
	movq	httpd_err400title(%rip), %rdx
	movl	$.LC48, %r9d
	movq	%r9, %rcx
	movl	$400, %esi
.L428:
	.loc 1 1652 0
	movq	%r12, %rdi
	call	httpd_send_err
.LVL341:
.L429:
	.loc 1 1654 0
	movq	%r13, %rsi
	movq	%rbp, %rdi
	call	finish_connection
	jmp	.L414
.LVL342:
.L466:
.LBE291:
.LBE306:
.LBB307:
.LBB309:
	.loc 1 331 0
	movl	no_log(%rip), %r12d
	testl	%r12d, %r12d
	jne	.L322
	cmpq	$0, hs(%rip)
	je	.L322
	.loc 1 335 0
	movq	logfile(%rip), %rax
	testq	%rax, %rax
	je	.L322
.LVL343:
.LBB310:
.LBB311:
	movzbl	(%rax), %edx
	cmpb	.LC95(%rip), %dl
	jne	.L323
.LVL344:
.LBE311:
.LBE310:
	movzbl	1(%rax), %eax
	cmpb	.LC95+1(%rip), %al
	jne	.L323
.LVL345:
.L322:
.LBE309:
.LBE307:
	.loc 1 751 0
	movl	$0, got_hup(%rip)
	jmp	.L321
.LVL346:
.L361:
.LBB313:
.LBB282:
.LBB279:
	.loc 1 1736 0
	movq	368(%r12), %rdx
	.loc 1 1740 0
	movl	704(%r12), %edi
	leaq	176(%rsp), %rsi
	.loc 1 1736 0
	movq	%rdx, 176(%rsp)
	.loc 1 1737 0
	movq	472(%r12), %rdx
	movq	%rdx, 184(%rsp)
	.loc 1 1738 0
	movq	136(%rbp), %rcx
	movq	%rcx, %rdx
	addq	712(%r12), %rdx
	movq	%rdx, 192(%rsp)
	.loc 1 1739 0
	movq	128(%rbp), %rdx
	subq	%rcx, %rdx
	cmpq	%rdx, %rax
	cmova	%rdx, %rax
.LVL347:
	.loc 1 1740 0
	movl	$2, %edx
	.loc 1 1739 0
	movq	%rax, 200(%rsp)
	.loc 1 1740 0
	call	writev
.LVL348:
	jmp	.L362
.LVL349:
.L468:
.LBE279:
.LBE282:
.LBE313:
	.loc 1 768 0
	movq	%r13, %rdi
	call	tmr_run
	movl	terminate(%rip), %eax
	.loc 1 769 0
	jmp	.L417
.LVL350:
.L458:
	.loc 1 560 0
	movq	%rbp, %rdi
	call	chroot
	testl	%eax, %eax
	js	.L480
	.loc 1 571 0
	movq	logfile(%rip), %r13
	testq	%r13, %r13
	je	.L296
.LVL351:
.LBB314:
.LBB315:
	movzbl	0(%r13), %eax
	cmpb	.LC95(%rip), %al
	jne	.L297
.LVL352:
.LBE315:
.LBE314:
	movzbl	1(%r13), %eax
	cmpb	.LC95+1(%rip), %al
	jne	.L297
.LVL353:
.L296:
	.loc 1 589 0
	movq	%rbp, %rdi
	.loc 1 587 0
	movw	$47, 10288(%rsp)
	.loc 1 589 0
	call	chdir
	testl	%eax, %eax
	jns	.L294
	.loc 1 591 0
	movl	$.LC110, %esi
	movl	$2, %edi
	xorl	%eax, %eax
	call	syslog
	.loc 1 592 0
	movl	$.LC111, %edi
	call	perror
	.loc 1 593 0
	movl	$1, %edi
	call	exit
.LVL354:
.L476:
	.loc 1 758 0
	cmpl	$4, %eax
	je	.L430
	.loc 1 760 0
	movl	$3, %edi
	movl	$.LC126, %esi
	xorl	%eax, %eax
	call	syslog
	.loc 1 761 0
	movl	$1, %edi
	call	exit
.LVL355:
.L365:
.LBB316:
.LBB276:
	.loc 1 1759 0
	addq	$100, 112(%rbp)
	.loc 1 1760 0
	movl	$3, 0(%rbp)
	.loc 1 1761 0
	movl	704(%r12), %edi
	call	fdwatch_del_fd
	.loc 1 1763 0
	cmpq	$0, 96(%rbp)
	je	.L368
	.loc 1 1764 0
	movl	$.LC128, %esi
	movl	$3, %edi
	xorl	%eax, %eax
	call	syslog
.L368:
	.loc 1 1765 0
	movq	112(%rbp), %rcx
	jmp	.L380
.LVL356:
.L225:
.LBE276:
.LBE316:
.LBB317:
.LBB252:
.LBB234:
.LBB235:
	.loc 1 944 0
	movzbl	.LC68(%rip), %eax
	cmpl	%eax, %edx
	jne	.L226
.LVL357:
	movzbl	1(%r15), %eax
	cmpb	.LC68+1(%rip), %al
	jne	.L226
.LBE235:
.LBE234:
	movzbl	2(%r15), %eax
	cmpb	.LC68+2(%rip), %al
	jne	.L226
	cmpl	%ebx, %ebp
	jle	.L226
.LVL358:
	.loc 1 947 0
	movslq	%ebx, %rax
	addl	$1, %ebx
.LVL359:
	movq	(%r12,%rax,8), %rax
.LVL360:
	movq	%rax, logfile(%rip)
	jmp	.L214
.LVL361:
.L479:
.LBE252:
.LBE317:
.LBB318:
.LBB305:
	.loc 1 1874 0
	call	__errno_location
.LVL362:
	movl	(%rax), %eax
	cmpl	$11, %eax
	je	.L414
	cmpl	$4, %eax
	je	.L414
.L382:
	.loc 1 1877 0
	movq	%r13, %rsi
	movq	%rbp, %rdi
	call	really_clear_connection
	jmp	.L414
.LVL363:
.L226:
.LBE305:
.LBE318:
.LBB319:
.LBB191:
.LBB199:
.LBB200:
	.loc 1 949 0
	movzbl	.LC69(%rip), %eax
	cmpl	%eax, %edx
	jne	.L227
.LVL364:
	movzbl	1(%r15), %eax
	cmpb	.LC69+1(%rip), %al
	jne	.L227
.LBE200:
.LBE199:
	movzbl	2(%r15), %eax
	cmpb	.LC69+2(%rip), %al
	jne	.L227
	.loc 1 950 0
	movl	$1, do_vhost(%rip)
	jmp	.L214
.L227:
.LVL365:
.LBB198:
	.loc 1 951 0
	movl	$.LC70, %esi
	movq	%r15, %rdi
	movl	%edx, 104(%rsp)
	call	strcmp
.LBE198:
	testl	%eax, %eax
	movl	104(%rsp), %edx
	je	.L481
.LVL366:
.LBB196:
.LBB197:
	.loc 1 953 0
	movzbl	.LC71(%rip), %eax
	cmpl	%eax, %edx
	jne	.L229
.LVL367:
	movzbl	1(%r15), %eax
	cmpb	.LC71+1(%rip), %al
	jne	.L229
.LBE197:
.LBE196:
	movzbl	2(%r15), %eax
	cmpb	.LC71+2(%rip), %al
	jne	.L229
	.loc 1 954 0
	movl	$1, do_global_passwd(%rip)
	jmp	.L214
.LVL368:
.L455:
.LBE191:
.LBE319:
	.loc 1 464 0
	movl	$.LC101, %esi
	movl	$2, %edi
	xorl	%eax, %eax
	call	syslog
	.loc 1 465 0
	movl	$.LC102, %edi
	call	perror
	.loc 1 466 0
	movl	$1, %edi
	call	exit
.LVL369:
.L456:
.LBB320:
	.loc 1 539 0
	movq	pidfile(%rip), %rdx
	movl	$2, %edi
	movl	$.LC84, %esi
	xorl	%eax, %eax
.LVL370:
	call	syslog
	.loc 1 540 0
	movl	$1, %edi
	call	exit
.LVL371:
.L460:
.LBE320:
	.loc 1 651 0
	movl	$2, %edi
	movl	$.LC114, %esi
	call	syslog
	.loc 1 652 0
	movl	$1, %edi
	call	exit
.L459:
	.loc 1 602 0
	movl	$.LC112, %esi
	movl	$2, %edi
	xorl	%eax, %eax
	call	syslog
	.loc 1 603 0
	movl	$.LC113, %edi
	call	perror
	.loc 1 604 0
	movl	$1, %edi
	call	exit
.LVL372:
.L297:
	.loc 1 573 0
	xorl	%eax, %eax
	orq	$-1, %rcx
	movq	%rbp, %rdi
	repnz scasb
	movq	%rbp, %rsi
	movq	%r13, %rdi
	notq	%rcx
	leaq	-1(%rcx), %rdx
	movq	%rcx, 96(%rsp)
	call	strncmp
	testl	%eax, %eax
	movq	96(%rsp), %rcx
	jne	.L298
	.loc 1 575 0
	leaq	-2(%r13,%rcx), %rsi
	movq	%r13, %rdi
	call	strcpy
	jmp	.L296
.LVL373:
.L323:
.LBB321:
.LBB308:
	.loc 1 337 0
	xorl	%eax, %eax
	movl	$.LC124, %esi
	movl	$5, %edi
	call	syslog
.LVL374:
	.loc 1 338 0
	movq	logfile(%rip), %rdi
	movl	$.LC96, %esi
	call	fopen
	.loc 1 339 0
	movq	logfile(%rip), %rdi
	movl	$384, %esi
	.loc 1 338 0
	movq	%rax, %rbp
.LVL375:
	.loc 1 339 0
	call	chmod
.LVL376:
	.loc 1 340 0
	testl	%eax, %eax
	jne	.L394
	testq	%rbp, %rbp
	je	.L394
	.loc 1 345 0
	movq	%rbp, %rdi
	call	fileno
.LVL377:
	movl	$1, %edx
	movl	%eax, %edi
	movl	$2, %esi
	xorl	%eax, %eax
	call	fcntl
	.loc 1 346 0
	movq	hs(%rip), %rdi
	movq	%rbp, %rsi
	call	httpd_set_logfp
	jmp	.L322
.LVL378:
.L463:
.LBE308:
.LBE321:
	.loc 1 673 0
	movl	$2, %edi
	movl	$.LC117, %esi
	call	syslog
	.loc 1 674 0
	movl	$1, %edi
	call	exit
.LVL379:
.L469:
	.loc 1 776 0
	movq	hs(%rip), %rax
	movq	%r13, %rdi
	movl	76(%rax), %esi
	call	handle_newconnect
	testl	%eax, %eax
	je	.L332
	jmp	.L430
.LVL380:
.L344:
.LBB322:
.LBB286:
	.loc 1 1659 0
	movq	%r13, %rsi
	movq	%r12, %rdi
	call	httpd_start_request
	testl	%eax, %eax
	js	.L429
	.loc 1 1667 0
	cmpl	$0, 528(%r12)
	jne	.L482
	.loc 1 1672 0
	movq	192(%r12), %rax
	.loc 1 1673 0
	movl	$0, %edx
	testq	%rax, %rax
	cmovs	%rdx, %rax
	movq	%rax, 128(%rbp)
.L353:
	.loc 1 1678 0
	cmpq	$0, 712(%r12)
	je	.L483
	.loc 1 1688 0
	movq	128(%rbp), %rdi
	cmpq	%rdi, 136(%rbp)
	jge	.L429
	.loc 1 1697 0
	movq	224(%rsp), %rax
	.loc 1 1696 0
	movl	$2, 0(%rbp)
	.loc 1 1701 0
	movl	704(%r12), %edi
	.loc 1 1698 0
	movq	$0, 112(%rbp)
	.loc 1 1697 0
	movq	%rax, 80(%rbp)
	.loc 1 1701 0
	call	fdwatch_del_fd
	.loc 1 1702 0
	movl	704(%r12), %edi
	movl	$1, %edx
	movq	%rbp, %rsi
	call	fdwatch_add_fd
	jmp	.L414
.LVL381:
.L470:
.LBE286:
.LBE322:
	.loc 1 786 0
	movq	hs(%rip), %rax
	movq	%r13, %rdi
	movl	72(%rax), %esi
	call	handle_newconnect
	testl	%eax, %eax
	je	.L414
	jmp	.L430
.LVL382:
.L394:
.LBB323:
.LBB312:
	.loc 1 342 0
	movq	logfile(%rip), %rdx
	movl	$.LC125, %esi
	movl	$2, %edi
	xorl	%eax, %eax
.LVL383:
	call	syslog
	jmp	.L322
.LVL384:
.L481:
.LBE312:
.LBE323:
.LBB324:
.LBB253:
	.loc 1 952 0
	movl	$0, do_vhost(%rip)
	jmp	.L214
.LVL385:
.L393:
.LBE253:
.LBE324:
	.loc 1 433 0
	movq	logfile(%rip), %rdx
	movl	$.LC84, %esi
	movl	$2, %edi
	xorl	%eax, %eax
.LVL386:
	call	syslog
	.loc 1 434 0
	movq	logfile(%rip), %rdi
	call	perror
	.loc 1 435 0
	movl	$1, %edi
	call	exit
.L454:
	.loc 1 448 0
	movq	%r12, %rdi
	call	fileno
	movl	%r14d, %edx
	movl	%r15d, %esi
	movl	%eax, %edi
	call	fchown
	testl	%eax, %eax
	jns	.L276
	.loc 1 450 0
	movl	$.LC99, %esi
	movl	$4, %edi
	xorl	%eax, %eax
	call	syslog
	.loc 1 451 0
	movl	$.LC100, %edi
	call	perror
	jmp	.L276
.LVL387:
.L465:
	.loc 1 712 0
	movl	$.LC122, %esi
	movl	$4, %edi
	xorl	%eax, %eax
	call	syslog
	jmp	.L309
.LVL388:
.L482:
.LBB325:
.LBB292:
	.loc 1 1669 0
	movq	536(%r12), %rax
	movq	%rax, 136(%rbp)
	.loc 1 1670 0
	movq	544(%r12), %rax
	addq	$1, %rax
	movq	%rax, 128(%rbp)
	jmp	.L353
.LVL389:
.L480:
.LBE292:
.LBE325:
	.loc 1 562 0
	movl	$.LC107, %esi
	movl	$2, %edi
	xorl	%eax, %eax
	call	syslog
	.loc 1 563 0
	movl	$.LC13, %edi
	call	perror
	.loc 1 564 0
	movl	$1, %edi
	call	exit
.LVL390:
.L229:
.LBB326:
.LBB190:
.LBB195:
	.loc 1 955 0
	movl	$.LC72, %esi
	movq	%r15, %rdi
	movl	%edx, 104(%rsp)
	call	strcmp
.LBE195:
	testl	%eax, %eax
	movl	104(%rsp), %edx
	jne	.L230
	.loc 1 956 0
	movl	$0, do_global_passwd(%rip)
	jmp	.L214
.LVL391:
.L478:
.LBE190:
.LBE326:
.LBB327:
.LBB283:
.LBB280:
	.loc 1 1804 0
	movq	368(%r12), %rdi
	subl	%eax, %edx
.LVL392:
	movslq	%edx, %r15
	movq	%r15, %rdx
	leaq	(%rdi,%r8), %rsi
	call	memmove
.LVL393:
	.loc 1 1805 0
	movq	%r15, 472(%r12)
.LVL394:
	xorl	%r8d, %r8d
	jmp	.L371
.LVL395:
.L314:
.LBE280:
.LBE283:
.LBE327:
	.loc 1 721 0
	movl	$.LC123, %esi
	jmp	.L432
.LVL396:
.L207:
.LBB328:
.LBB254:
	.loc 1 883 0
	movl	$1, %ebx
.LVL397:
	jmp	.L236
.LVL398:
.L445:
	movq	264(%rsp), %rdi
	jmp	.L248
.LVL399:
.L475:
.LBE254:
.LBE328:
	.loc 1 409 0
	movq	user(%rip), %rdx
	movl	$.LC92, %esi
	movl	$2, %edi
	call	syslog
.LVL400:
	.loc 1 410 0
	movq	stderr(%rip), %rdi
	movq	user(%rip), %rcx
	movl	$.LC93, %esi
	movq	argv0(%rip), %rdx
	xorl	%eax, %eax
	call	fprintf
	.loc 1 411 0
	movl	$1, %edi
	call	exit
.LVL401:
.L462:
	.loc 1 665 0
	movl	$2, %edi
	movl	$.LC116, %esi
	call	syslog
	.loc 1 666 0
	movl	$1, %edi
	call	exit
.LVL402:
.L298:
	.loc 1 583 0
	xorl	%eax, %eax
	movl	$.LC108, %esi
	movl	$4, %edi
	call	syslog
	.loc 1 584 0
	movq	argv0(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$.LC109, %esi
	xorl	%eax, %eax
	call	fprintf
	jmp	.L296
.LVL403:
.L461:
	.loc 1 657 0
	movl	$2, %edi
	movl	$.LC115, %esi
	call	syslog
	.loc 1 658 0
	movl	$1, %edi
	call	exit
.LVL404:
.L346:
.LBB329:
.LBB285:
	.loc 1 1652 0
	movq	208(%r12), %r9
	movq	httpd_err503form(%rip), %r8
	movl	$.LC48, %ecx
	movq	httpd_err503title(%rip), %rdx
	movl	$503, %esi
	jmp	.L428
.LVL405:
.L464:
.LBE285:
.LBE329:
	.loc 1 699 0
	movl	$.LC120, %esi
	movl	$4, %edi
	xorl	%eax, %eax
	call	syslog
	jmp	.L312
.LVL406:
.L483:
.LBB330:
.LBB293:
.LBB290:
	.loc 1 1682 0
	movl	56(%rbp), %edi
	.loc 1 1683 0
	movq	throttles(%rip), %rcx
	movq	%rbp, %rdx
	xorl	%eax, %eax
	jmp	.L356
.LVL407:
.L357:
	movslq	12(%rdx), %rsi
	movq	200(%r12), %r8
	.loc 1 1682 0
	addl	$1, %eax
.LVL408:
	.loc 1 1683 0
	imulq	$48, %rsi, %rsi
	addq	%r8, 32(%rcx,%rsi)
.LVL409:
.L356:
	.loc 1 1682 0
	addq	$4, %rdx
	cmpl	%edi, %eax
	jl	.L357
	.loc 1 1684 0
	movq	200(%r12), %rax
.LVL410:
	.loc 1 1685 0
	movq	%r13, %rsi
	movq	%rbp, %rdi
	.loc 1 1684 0
	movq	%rax, 136(%rbp)
	.loc 1 1685 0
	call	finish_connection
	jmp	.L414
.LVL411:
.L438:
.LBE290:
.LBE293:
.LBE330:
.LBB331:
.LBB189:
	.loc 1 887 0
	movl	$.LC55, %edi
	call	puts
	.loc 1 888 0
	xorl	%edi, %edi
	call	exit
.LVL412:
.L447:
.LBE189:
.LBE331:
.LBB332:
.LBB268:
	.loc 1 1382 0
	movq	%r14, %rdx
	movl	$.LC84, %esi
	movl	$2, %edi
	xorl	%eax, %eax
.LVL413:
	call	syslog
	.loc 1 1383 0
	movq	%r14, %rdi
	call	perror
	.loc 1 1384 0
	movl	$1, %edi
	call	exit
.LVL414:
.L269:
	.loc 1 1443 0
	movl	$.LC90, %esi
	movl	$2, %edi
	xorl	%eax, %eax
	call	syslog
	.loc 1 1444 0
	movq	argv0(%rip), %rdx
	movl	$.LC91, %esi
	jmp	.L431
.LVL415:
.L446:
.LBE268:
.LBE332:
.LBB333:
.LBB260:
	.loc 1 1304 0
	movq	hostname(%rip), %rdx
	movl	$2, %edi
	mov	%r8d, %r8d
	movl	$128, %ecx
	movl	$.LC81, %esi
	xorl	%eax, %eax
	call	syslog
	.loc 1 1308 0
	movl	$1, %edi
	call	exit
.LVL416:
.L441:
	.loc 1 1254 0
	movl	%eax, %edi
	call	gai_strerror
.LVL417:
	movq	hostname(%rip), %rdx
	movq	%rax, %rcx
	movl	$.LC79, %esi
	movl	$2, %edi
	xorl	%eax, %eax
	call	syslog
	.loc 1 1257 0
	movl	%ebp, %edi
	call	gai_strerror
	movq	stderr(%rip), %rdi
	movq	hostname(%rip), %rcx
	movq	%rax, %r8
	movq	argv0(%rip), %rdx
	movl	$.LC80, %esi
	xorl	%eax, %eax
	call	fprintf
	.loc 1 1260 0
	movl	$1, %edi
	call	exit
.LVL418:
.L444:
	.loc 1 1287 0
	movq	hostname(%rip), %rdx
	movl	$2, %edi
	mov	%r8d, %r8d
	movl	$128, %ecx
	movl	$.LC81, %esi
.LVL419:
	call	syslog
.LVL420:
	.loc 1 1291 0
	movl	$1, %edi
	call	exit
.LVL421:
.L230:
.LBE260:
.LBE333:
.LBB334:
.LBB255:
.LBB236:
.LBB237:
	.loc 1 957 0
	movzbl	.LC73(%rip), %eax
	cmpl	%eax, %edx
	jne	.L231
.LVL422:
	movzbl	1(%r15), %eax
	cmpb	.LC73+1(%rip), %al
	jne	.L231
.LBE237:
.LBE236:
	movzbl	2(%r15), %eax
	cmpb	.LC73+2(%rip), %al
	jne	.L231
	cmpl	%ebx, %ebp
	jle	.L231
.LVL423:
	.loc 1 960 0
	movslq	%ebx, %rax
	addl	$1, %ebx
.LVL424:
	movq	(%r12,%rax,8), %rax
.LVL425:
	movq	%rax, pidfile(%rip)
	jmp	.L214
.LVL426:
.L231:
.LBB238:
.LBB239:
	.loc 1 962 0
	movzbl	.LC74(%rip), %eax
	cmpl	%eax, %edx
	jne	.L232
.LVL427:
	movzbl	1(%r15), %eax
	cmpb	.LC74+1(%rip), %al
	jne	.L232
.LBE239:
.LBE238:
	movzbl	2(%r15), %eax
	cmpb	.LC74+2(%rip), %al
	jne	.L232
	cmpl	%ebx, %ebp
	jle	.L232
.LVL428:
	.loc 1 965 0
	movslq	%ebx, %rax
	addl	$1, %ebx
.LVL429:
	movq	(%r12,%rax,8), %rax
.LVL430:
	movq	%rax, charset(%rip)
	jmp	.L214
.LVL431:
.L232:
.LBB240:
.LBB241:
	.loc 1 967 0
	movzbl	.LC75(%rip), %eax
	cmpl	%eax, %edx
	jne	.L233
.LVL432:
	movzbl	1(%r15), %eax
	cmpb	.LC75+1(%rip), %al
	jne	.L233
.LBE241:
.LBE240:
	movzbl	2(%r15), %eax
	cmpb	.LC75+2(%rip), %al
	jne	.L233
	cmpl	%ebx, %ebp
	jle	.L233
.LVL433:
	.loc 1 970 0
	movslq	%ebx, %rax
	addl	$1, %ebx
.LVL434:
	movq	(%r12,%rax,8), %rax
.LVL435:
	movq	%rax, p3p(%rip)
	jmp	.L214
.LVL436:
.L233:
.LBB242:
.LBB243:
	.loc 1 972 0
	movzbl	.LC76(%rip), %eax
	cmpl	%eax, %edx
	jne	.L234
.LVL437:
	movzbl	1(%r15), %eax
	cmpb	.LC76+1(%rip), %al
	jne	.L234
.LBE243:
.LBE242:
	movzbl	2(%r15), %eax
	cmpb	.LC76+2(%rip), %al
	jne	.L234
	cmpl	%ebx, %ebp
	jg	.L484
.L234:
.LVL438:
.LBB244:
.LBB245:
	.loc 1 977 0
	movzbl	.LC77(%rip), %eax
	cmpl	%eax, %edx
	jne	.L235
.LVL439:
	movzbl	1(%r15), %eax
	cmpb	.LC77+1(%rip), %al
	jne	.L235
.LBE245:
.LBE244:
	movzbl	2(%r15), %eax
	cmpb	.LC77+2(%rip), %al
	jne	.L235
	.loc 1 978 0
	movl	$1, debug(%rip)
	jmp	.L214
.LVL440:
.L484:
	.loc 2 286 0
	movslq	%ebx, %rax
.LBB246:
.LBB247:
	movl	$10, %edx
	xorl	%esi, %esi
	movq	(%r12,%rax,8), %rdi
.LBE247:
.LBE246:
	.loc 1 975 0
	addl	$1, %ebx
.LVL441:
.LBB249:
.LBB248:
	.loc 2 286 0
	call	strtol
.LVL442:
	.loc 1 975 0
	movl	%eax, max_age(%rip)
	jmp	.L214
.LVL443:
.L235:
.LBE248:
.LBE249:
	.loc 1 980 0
	call	usage
	.p2align 4,,2
	jmp	.L214
.LBE255:
.LBE334:
	.cfi_endproc
.LFE47:
	.size	main, .-main
.globl terminate
	.bss
	.align 4
	.type	terminate, @object
	.size	terminate, 4
terminate:
	.zero	4
	.local	hs
	.comm	hs,8,8
	.local	argv0
	.comm	argv0,8,8
	.local	debug
	.comm	debug,4,4
	.local	port
	.comm	port,2,2
	.local	dir
	.comm	dir,8,8
	.local	data_dir
	.comm	data_dir,8,8
	.local	do_chroot
	.comm	do_chroot,4,4
	.local	no_log
	.comm	no_log,4,4
	.local	no_symlink_check
	.comm	no_symlink_check,4,4
	.local	do_vhost
	.comm	do_vhost,4,4
	.local	do_global_passwd
	.comm	do_global_passwd,4,4
	.local	cgi_pattern
	.comm	cgi_pattern,8,8
	.local	cgi_limit
	.comm	cgi_limit,4,4
	.local	url_pattern
	.comm	url_pattern,8,8
	.local	no_empty_referers
	.comm	no_empty_referers,4,4
	.local	local_pattern
	.comm	local_pattern,8,8
	.local	logfile
	.comm	logfile,8,8
	.local	throttlefile
	.comm	throttlefile,8,8
	.local	hostname
	.comm	hostname,8,8
	.local	pidfile
	.comm	pidfile,8,8
	.local	user
	.comm	user,8,8
	.local	charset
	.comm	charset,8,8
	.local	p3p
	.comm	p3p,8,8
	.local	max_age
	.comm	max_age,4,4
	.local	throttles
	.comm	throttles,8,8
	.local	numthrottles
	.comm	numthrottles,4,4
	.local	maxthrottles
	.comm	maxthrottles,4,4
	.local	connects
	.comm	connects,8,8
	.local	num_connects
	.comm	num_connects,4,4
	.local	max_connects
	.comm	max_connects,4,4
	.local	first_free_connect
	.comm	first_free_connect,4,4
	.local	httpd_conn_count
	.comm	httpd_conn_count,4,4
	.local	got_hup
	.comm	got_hup,4,4
	.local	got_usr1
	.comm	got_usr1,4,4
	.local	watchdog_flag
	.comm	watchdog_flag,4,4
	.comm	start_time,8,8
	.comm	stats_time,8,8
	.comm	stats_connections,8,8
	.comm	stats_bytes,8,8
	.comm	stats_simultaneous,4,4
	.text
.Letext0:
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.quad	.LVL0-.Ltext0
	.quad	.LVL4-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL5-.Ltext0
	.quad	.LVL6-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL8-.Ltext0
	.quad	.LVL13-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL19-.Ltext0
	.quad	.LVL20-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL21-.Ltext0
	.quad	.LFE63-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	0x0
	.quad	0x0
.LLST1:
	.quad	.LVL0-.Ltext0
	.quad	.LVL1-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	0x0
	.quad	0x0
.LLST2:
	.quad	.LVL0-.Ltext0
	.quad	.LVL1-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL2-.Ltext0
	.quad	.LVL3-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL7-.Ltext0
	.quad	.LVL8-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL14-.Ltext0
	.quad	.LVL16-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 16
	.quad	.LVL16-.Ltext0
	.quad	.LVL17-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 12
	.quad	.LVL17-.Ltext0
	.quad	.LVL19-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 16
	.quad	0x0
	.quad	0x0
.LLST3:
	.quad	.LVL12-.Ltext0
	.quad	.LVL14-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL15-.Ltext0
	.quad	.LVL17-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	0x0
	.quad	0x0
.LLST4:
	.quad	.LVL8-.Ltext0
	.quad	.LVL9-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL10-.Ltext0
	.quad	.LVL11-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0x0
	.quad	0x0
.LLST5:
	.quad	.LVL9-.Ltext0
	.quad	.LVL10-.Ltext0
	.value	0x17
	.byte	0x76
	.sleb128 0
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x8
	.byte	0x90
	.byte	0x1e
	.byte	0x3
	.quad	connects
	.byte	0x6
	.byte	0x22
	.byte	0x9f
	.quad	.LVL10-.Ltext0
	.quad	.LVL11-.Ltext0
	.value	0x17
	.byte	0x76
	.sleb128 -1
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x8
	.byte	0x90
	.byte	0x1e
	.byte	0x3
	.quad	connects
	.byte	0x6
	.byte	0x22
	.byte	0x9f
	.quad	.LVL11-.Ltext0
	.quad	.LVL19-.Ltext0
	.value	0x17
	.byte	0x76
	.sleb128 0
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x8
	.byte	0x90
	.byte	0x1e
	.byte	0x3
	.quad	connects
	.byte	0x6
	.byte	0x22
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST6:
	.quad	.LVL14-.Ltext0
	.quad	.LVL17-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL18-.Ltext0
	.quad	.LVL19-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0x0
	.quad	0x0
.LLST7:
	.quad	.LVL22-.Ltext0
	.quad	.LVL23-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL23-.Ltext0
	.quad	.LVL25-1-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	0x0
	.quad	0x0
.LLST8:
	.quad	.LVL22-.Ltext0
	.quad	.LVL24-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	0x0
	.quad	0x0
.LLST9:
	.quad	.LVL26-.Ltext0
	.quad	.LVL27-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL27-.Ltext0
	.quad	.LVL29-1-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	0x0
	.quad	0x0
.LLST10:
	.quad	.LVL26-.Ltext0
	.quad	.LVL28-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	0x0
	.quad	0x0
.LLST11:
	.quad	.LVL30-.Ltext0
	.quad	.LVL32-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	0x0
	.quad	0x0
.LLST12:
	.quad	.LVL30-.Ltext0
	.quad	.LVL31-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	0x0
	.quad	0x0
.LLST13:
	.quad	.LVL30-.Ltext0
	.quad	.LVL32-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL32-.Ltext0
	.quad	.LFE68-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	0x0
	.quad	0x0
.LLST14:
	.quad	.LVL33-.Ltext0
	.quad	.LVL34-1-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	0x0
	.quad	0x0
.LLST15:
	.quad	.LVL36-.Ltext0
	.quad	.LVL37-1-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	0x0
	.quad	0x0
.LLST16:
	.quad	.LVL37-.Ltext0
	.quad	.LVL38-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0x0
	.quad	0x0
.LLST17:
	.quad	.LVL39-.Ltext0
	.quad	.LVL40-1-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL40-1-.Ltext0
	.quad	.LVL42-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL63-.Ltext0
	.quad	.LVL64-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0x0
	.quad	0x0
.LLST18:
	.quad	.LVL41-.Ltext0
	.quad	.LVL42-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL42-.Ltext0
	.quad	.LVL54-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL55-.Ltext0
	.quad	.LFE50-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	0x0
	.quad	0x0
.LLST19:
	.quad	.LVL43-.Ltext0
	.quad	.LVL44-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL44-.Ltext0
	.quad	.LVL45-.Ltext0
	.value	0x1
	.byte	0x57
	.quad	.LVL45-.Ltext0
	.quad	.LVL53-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL55-.Ltext0
	.quad	.LVL56-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL56-.Ltext0
	.quad	.LVL57-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL57-.Ltext0
	.quad	.LVL63-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL65-.Ltext0
	.quad	.LFE50-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	0x0
	.quad	0x0
.LLST20:
	.quad	.LVL47-.Ltext0
	.quad	.LVL53-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL55-.Ltext0
	.quad	.LVL63-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL65-.Ltext0
	.quad	.LFE50-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0x0
	.quad	0x0
.LLST21:
	.quad	.LVL49-.Ltext0
	.quad	.LVL53-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL55-.Ltext0
	.quad	.LVL57-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL58-.Ltext0
	.quad	.LVL63-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL65-.Ltext0
	.quad	.LFE50-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	0x0
	.quad	0x0
.LLST22:
	.quad	.LVL50-.Ltext0
	.quad	.LVL51-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL51-.Ltext0
	.quad	.LVL53-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL55-.Ltext0
	.quad	.LVL63-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL65-.Ltext0
	.quad	.LFE50-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	0x0
	.quad	0x0
.LLST23:
	.quad	.LVL44-.Ltext0
	.quad	.LVL53-.Ltext0
	.value	0x3
	.byte	0x8
	.byte	0x20
	.byte	0x9f
	.quad	.LVL55-.Ltext0
	.quad	.LVL63-.Ltext0
	.value	0x3
	.byte	0x8
	.byte	0x20
	.byte	0x9f
	.quad	.LVL65-.Ltext0
	.quad	.LFE50-.Ltext0
	.value	0x3
	.byte	0x8
	.byte	0x20
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST24:
	.quad	.LVL44-.Ltext0
	.quad	.LVL53-.Ltext0
	.value	0x2
	.byte	0x39
	.byte	0x9f
	.quad	.LVL55-.Ltext0
	.quad	.LVL63-.Ltext0
	.value	0x2
	.byte	0x39
	.byte	0x9f
	.quad	.LVL65-.Ltext0
	.quad	.LFE50-.Ltext0
	.value	0x2
	.byte	0x39
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST25:
	.quad	.LVL44-.Ltext0
	.quad	.LVL53-.Ltext0
	.value	0x2
	.byte	0x3a
	.byte	0x9f
	.quad	.LVL55-.Ltext0
	.quad	.LVL63-.Ltext0
	.value	0x2
	.byte	0x3a
	.byte	0x9f
	.quad	.LVL65-.Ltext0
	.quad	.LFE50-.Ltext0
	.value	0x2
	.byte	0x3a
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST26:
	.quad	.LVL46-.Ltext0
	.quad	.LVL53-.Ltext0
	.value	0x3
	.byte	0x8
	.byte	0x20
	.byte	0x9f
	.quad	.LVL55-.Ltext0
	.quad	.LVL63-.Ltext0
	.value	0x3
	.byte	0x8
	.byte	0x20
	.byte	0x9f
	.quad	.LVL65-.Ltext0
	.quad	.LFE50-.Ltext0
	.value	0x3
	.byte	0x8
	.byte	0x20
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST27:
	.quad	.LVL46-.Ltext0
	.quad	.LVL53-.Ltext0
	.value	0x2
	.byte	0x39
	.byte	0x9f
	.quad	.LVL55-.Ltext0
	.quad	.LVL63-.Ltext0
	.value	0x2
	.byte	0x39
	.byte	0x9f
	.quad	.LVL65-.Ltext0
	.quad	.LFE50-.Ltext0
	.value	0x2
	.byte	0x39
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST28:
	.quad	.LVL46-.Ltext0
	.quad	.LVL53-.Ltext0
	.value	0x2
	.byte	0x3a
	.byte	0x9f
	.quad	.LVL55-.Ltext0
	.quad	.LVL63-.Ltext0
	.value	0x2
	.byte	0x3a
	.byte	0x9f
	.quad	.LVL65-.Ltext0
	.quad	.LFE50-.Ltext0
	.value	0x2
	.byte	0x3a
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST29:
	.quad	.LVL52-.Ltext0
	.quad	.LVL53-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	0x0
	.quad	0x0
.LLST30:
	.quad	.LVL56-.Ltext0
	.quad	.LVL58-.Ltext0
	.value	0x3
	.byte	0x8
	.byte	0x20
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST31:
	.quad	.LVL56-.Ltext0
	.quad	.LVL58-.Ltext0
	.value	0x2
	.byte	0x39
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST32:
	.quad	.LVL56-.Ltext0
	.quad	.LVL58-.Ltext0
	.value	0x2
	.byte	0x3a
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST33:
	.quad	.LVL59-.Ltext0
	.quad	.LVL60-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	0x0
	.quad	0x0
.LLST34:
	.quad	.LVL61-.Ltext0
	.quad	.LVL62-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	0x0
	.quad	0x0
.LLST35:
	.quad	.LVL66-.Ltext0
	.quad	.LVL67-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL67-.Ltext0
	.quad	.LVL71-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL72-.Ltext0
	.quad	.LVL75-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL76-.Ltext0
	.quad	.LFE57-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	0x0
	.quad	0x0
.LLST36:
	.quad	.LVL66-.Ltext0
	.quad	.LVL67-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL67-.Ltext0
	.quad	.LVL70-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL72-.Ltext0
	.quad	.LVL74-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL76-.Ltext0
	.quad	.LFE57-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0x0
	.quad	0x0
.LLST37:
	.quad	.LVL68-.Ltext0
	.quad	.LVL69-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL72-.Ltext0
	.quad	.LVL73-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL76-.Ltext0
	.quad	.LVL77-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL78-.Ltext0
	.quad	.LFE57-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0x0
	.quad	0x0
.LLST38:
	.quad	.LVL79-.Ltext0
	.quad	.LVL80-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL80-.Ltext0
	.quad	.LVL84-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0x0
	.quad	0x0
.LLST39:
	.quad	.LVL79-.Ltext0
	.quad	.LVL81-1-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	0x0
	.quad	0x0
.LLST40:
	.quad	.LVL82-.Ltext0
	.quad	.LVL84-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0x0
	.quad	0x0
.LLST41:
	.quad	.LVL82-.Ltext0
	.quad	.LVL83-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST42:
	.quad	.LVL85-.Ltext0
	.quad	.LVL86-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL86-.Ltext0
	.quad	.LVL88-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL90-.Ltext0
	.quad	.LVL91-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL91-.Ltext0
	.quad	.LVL93-1-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL93-.Ltext0
	.quad	.LFE65-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0x0
	.quad	0x0
.LLST43:
	.quad	.LVL85-.Ltext0
	.quad	.LVL87-1-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL87-1-.Ltext0
	.quad	.LVL89-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL90-.Ltext0
	.quad	.LVL92-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL92-.Ltext0
	.quad	.LVL93-1-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL93-.Ltext0
	.quad	.LFE65-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0x0
	.quad	0x0
.LLST44:
	.quad	.LVL95-.Ltext0
	.quad	.LVL96-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL96-.Ltext0
	.quad	.LVL99-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL99-.Ltext0
	.quad	.LFE64-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	0x0
	.quad	0x0
.LLST45:
	.quad	.LVL95-.Ltext0
	.quad	.LVL97-1-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL97-1-.Ltext0
	.quad	.LVL98-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL98-.Ltext0
	.quad	.LFE64-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	0x0
	.quad	0x0
.LLST46:
	.quad	.LVL100-.Ltext0
	.quad	.LVL103-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL106-.Ltext0
	.quad	.LVL107-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL110-.Ltext0
	.quad	.LVL111-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL112-.Ltext0
	.quad	.LFE72-.Ltext0
	.value	0x1
	.byte	0x57
	.quad	0x0
	.quad	0x0
.LLST47:
	.quad	.LVL101-.Ltext0
	.quad	.LVL103-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 0
	.quad	.LVL103-.Ltext0
	.quad	.LVL104-1-.Ltext0
	.value	0x9
	.byte	0x3
	.quad	stats_time
	.quad	.LVL106-.Ltext0
	.quad	.LVL108-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL108-.Ltext0
	.quad	.LVL109-1-.Ltext0
	.value	0x9
	.byte	0x3
	.quad	stats_time
	.quad	0x0
	.quad	0x0
.LLST48:
	.quad	.LVL102-.Ltext0
	.quad	.LVL104-1-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL106-.Ltext0
	.quad	.LVL109-1-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	0x0
	.quad	0x0
.LLST49:
	.quad	.LVL102-.Ltext0
	.quad	.LVL103-.Ltext0
	.value	0xf
	.byte	0x75
	.sleb128 0
	.byte	0x6
	.byte	0x3
	.quad	stats_time
	.byte	0x6
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL103-.Ltext0
	.quad	.LVL104-1-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL104-1-.Ltext0
	.quad	.LVL105-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL106-.Ltext0
	.quad	.LVL109-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST50:
	.quad	.LVL104-.Ltext0
	.quad	.LVL105-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0x0
	.quad	0x0
.LLST51:
	.quad	.LVL113-.Ltext0
	.quad	.LVL114-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL115-.Ltext0
	.quad	.LVL116-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	0x0
	.quad	0x0
.LLST52:
	.quad	.LVL117-.Ltext0
	.quad	.LVL118-1-.Ltext0
	.value	0x9
	.byte	0x3
	.quad	hs
	.quad	.LVL118-1-.Ltext0
	.quad	.LVL119-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0x0
	.quad	0x0
.LLST53:
	.quad	.LVL120-.Ltext0
	.quad	.LVL121-1-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	0x0
	.quad	0x0
.LLST54:
	.quad	.LVL122-.Ltext0
	.quad	.LVL123-1-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL123-1-.Ltext0
	.quad	.LFE40-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0x0
	.quad	0x0
.LLST55:
	.quad	.LVL124-.Ltext0
	.quad	.LVL125-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	0x0
	.quad	0x0
.LLST56:
	.quad	.LVL126-.Ltext0
	.quad	.LVL127-1-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	0x0
	.quad	0x0
.LLST57:
	.quad	.LVL128-.Ltext0
	.quad	.LVL129-1-.Ltext0
	.value	0x2
	.byte	0x70
	.sleb128 0
	.quad	.LVL129-1-.Ltext0
	.quad	.LVL130-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0x0
	.quad	0x0
.LLST58:
	.quad	.LVL131-.Ltext0
	.quad	.LVL136-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL137-.Ltext0
	.quad	.LVL140-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	0x0
	.quad	0x0
.LLST59:
	.quad	.LVL131-.Ltext0
	.quad	.LVL132-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL132-.Ltext0
	.quad	.LVL138-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL139-.Ltext0
	.quad	.LFE67-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	0x0
	.quad	0x0
.LLST60:
	.quad	.LVL131-.Ltext0
	.quad	.LVL132-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL133-.Ltext0
	.quad	.LVL134-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	0x0
	.quad	0x0
.LLST61:
	.quad	.LVL132-.Ltext0
	.quad	.LVL134-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL135-.Ltext0
	.quad	.LVL137-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL139-.Ltext0
	.quad	.LFE67-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0x0
	.quad	0x0
.LLST62:
	.quad	.LVL141-.Ltext0
	.quad	.LVL142-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	0x0
	.quad	0x0
.LLST63:
	.quad	.LVL141-.Ltext0
	.quad	.LVL143-1-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	0x0
	.quad	0x0
.LLST64:
	.quad	.LVL144-.Ltext0
	.quad	.LVL145-1-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	0x0
	.quad	0x0
.LLST65:
	.quad	.LVL146-.Ltext0
	.quad	.LVL147-.Ltext0
	.value	0x2
	.byte	0x70
	.sleb128 0
	.quad	.LVL147-.Ltext0
	.quad	.LVL148-1-.Ltext0
	.value	0x2
	.byte	0x73
	.sleb128 0
	.quad	.LVL148-1-.Ltext0
	.quad	.LVL149-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL150-.Ltext0
	.quad	.LFE45-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0x0
	.quad	0x0
.LLST66:
	.quad	.LVL151-.Ltext0
	.quad	.LVL152-1-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	0x0
	.quad	0x0
.LLST67:
	.quad	.LVL153-.Ltext0
	.quad	.LVL154-.Ltext0
	.value	0x2
	.byte	0x70
	.sleb128 0
	.quad	.LVL154-.Ltext0
	.quad	.LVL159-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	0x0
	.quad	0x0
.LLST68:
	.quad	.LVL155-.Ltext0
	.quad	.LVL156-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL157-.Ltext0
	.quad	.LVL158-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0x0
	.quad	0x0
.LLST69:
	.quad	.LVL160-.Ltext0
	.quad	.LVL163-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL163-.Ltext0
	.quad	.LVL187-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL220-.Ltext0
	.quad	.LVL240-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL282-.Ltext0
	.quad	.LVL283-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL285-.Ltext0
	.quad	.LVL296-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL309-.Ltext0
	.quad	.LVL313-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL356-.Ltext0
	.quad	.LVL361-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL363-.Ltext0
	.quad	.LVL368-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL384-.Ltext0
	.quad	.LVL385-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL390-.Ltext0
	.quad	.LVL391-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL396-.Ltext0
	.quad	.LVL398-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL411-.Ltext0
	.quad	.LVL412-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL421-.Ltext0
	.quad	.LFE47-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0x0
	.quad	0x0
.LLST70:
	.quad	.LVL160-.Ltext0
	.quad	.LVL161-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL161-.Ltext0
	.quad	.LVL207-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL220-.Ltext0
	.quad	.LVL240-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL282-.Ltext0
	.quad	.LVL283-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL285-.Ltext0
	.quad	.LVL296-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL302-.Ltext0
	.quad	.LVL304-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL309-.Ltext0
	.quad	.LVL313-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL356-.Ltext0
	.quad	.LVL361-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL363-.Ltext0
	.quad	.LVL368-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL384-.Ltext0
	.quad	.LVL385-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL390-.Ltext0
	.quad	.LVL391-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL396-.Ltext0
	.quad	.LVL399-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL411-.Ltext0
	.quad	.LVL412-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL415-.Ltext0
	.quad	.LFE47-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	0x0
	.quad	0x0
.LLST71:
	.quad	.LVL164-.Ltext0
	.quad	.LVL165-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL165-.Ltext0
	.quad	.LVL168-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL396-.Ltext0
	.quad	.LVL397-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0x0
	.quad	0x0
.LLST72:
	.quad	.LVL299-.Ltext0
	.quad	.LVL302-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL399-.Ltext0
	.quad	.LVL400-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0x0
	.quad	0x0
.LLST73:
	.quad	.LVL162-.Ltext0
	.quad	.LVL242-.Ltext0
	.value	0x4
	.byte	0xa
	.value	0x7fff
	.byte	0x9f
	.quad	.LVL242-.Ltext0
	.quad	.LVL259-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL281-.Ltext0
	.quad	.LVL283-.Ltext0
	.value	0x4
	.byte	0xa
	.value	0x7fff
	.byte	0x9f
	.quad	.LVL283-.Ltext0
	.quad	.LVL285-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL285-.Ltext0
	.quad	.LVL297-.Ltext0
	.value	0x4
	.byte	0xa
	.value	0x7fff
	.byte	0x9f
	.quad	.LVL297-.Ltext0
	.quad	.LVL298-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL298-.Ltext0
	.quad	.LVL300-.Ltext0
	.value	0x4
	.byte	0xa
	.value	0x7fff
	.byte	0x9f
	.quad	.LVL300-.Ltext0
	.quad	.LVL302-.Ltext0
	.value	0x2
	.byte	0x70
	.sleb128 16
	.quad	.LVL302-.Ltext0
	.quad	.LVL305-.Ltext0
	.value	0x4
	.byte	0xa
	.value	0x7fff
	.byte	0x9f
	.quad	.LVL306-.Ltext0
	.quad	.LVL309-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL309-.Ltext0
	.quad	.LVL313-.Ltext0
	.value	0x4
	.byte	0xa
	.value	0x7fff
	.byte	0x9f
	.quad	.LVL350-.Ltext0
	.quad	.LVL354-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL356-.Ltext0
	.quad	.LVL361-.Ltext0
	.value	0x4
	.byte	0xa
	.value	0x7fff
	.byte	0x9f
	.quad	.LVL363-.Ltext0
	.quad	.LVL368-.Ltext0
	.value	0x4
	.byte	0xa
	.value	0x7fff
	.byte	0x9f
	.quad	.LVL368-.Ltext0
	.quad	.LVL373-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL378-.Ltext0
	.quad	.LVL379-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL384-.Ltext0
	.quad	.LVL385-.Ltext0
	.value	0x4
	.byte	0xa
	.value	0x7fff
	.byte	0x9f
	.quad	.LVL385-.Ltext0
	.quad	.LVL388-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL389-.Ltext0
	.quad	.LVL390-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL390-.Ltext0
	.quad	.LVL391-.Ltext0
	.value	0x4
	.byte	0xa
	.value	0x7fff
	.byte	0x9f
	.quad	.LVL395-.Ltext0
	.quad	.LVL396-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL396-.Ltext0
	.quad	.LVL401-.Ltext0
	.value	0x4
	.byte	0xa
	.value	0x7fff
	.byte	0x9f
	.quad	.LVL401-.Ltext0
	.quad	.LVL404-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL405-.Ltext0
	.quad	.LVL406-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL411-.Ltext0
	.quad	.LFE47-.Ltext0
	.value	0x4
	.byte	0xa
	.value	0x7fff
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST74:
	.quad	.LVL162-.Ltext0
	.quad	.LVL242-.Ltext0
	.value	0x4
	.byte	0xa
	.value	0x7fff
	.byte	0x9f
	.quad	.LVL242-.Ltext0
	.quad	.LVL258-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL281-.Ltext0
	.quad	.LVL283-.Ltext0
	.value	0x4
	.byte	0xa
	.value	0x7fff
	.byte	0x9f
	.quad	.LVL283-.Ltext0
	.quad	.LVL285-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL285-.Ltext0
	.quad	.LVL297-.Ltext0
	.value	0x4
	.byte	0xa
	.value	0x7fff
	.byte	0x9f
	.quad	.LVL297-.Ltext0
	.quad	.LVL298-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL298-.Ltext0
	.quad	.LVL301-.Ltext0
	.value	0x4
	.byte	0xa
	.value	0x7fff
	.byte	0x9f
	.quad	.LVL301-.Ltext0
	.quad	.LVL302-.Ltext0
	.value	0x2
	.byte	0x70
	.sleb128 20
	.quad	.LVL302-.Ltext0
	.quad	.LVL305-.Ltext0
	.value	0x4
	.byte	0xa
	.value	0x7fff
	.byte	0x9f
	.quad	.LVL306-.Ltext0
	.quad	.LVL309-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL309-.Ltext0
	.quad	.LVL313-.Ltext0
	.value	0x4
	.byte	0xa
	.value	0x7fff
	.byte	0x9f
	.quad	.LVL350-.Ltext0
	.quad	.LVL354-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL356-.Ltext0
	.quad	.LVL361-.Ltext0
	.value	0x4
	.byte	0xa
	.value	0x7fff
	.byte	0x9f
	.quad	.LVL363-.Ltext0
	.quad	.LVL368-.Ltext0
	.value	0x4
	.byte	0xa
	.value	0x7fff
	.byte	0x9f
	.quad	.LVL368-.Ltext0
	.quad	.LVL373-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL378-.Ltext0
	.quad	.LVL379-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL384-.Ltext0
	.quad	.LVL385-.Ltext0
	.value	0x4
	.byte	0xa
	.value	0x7fff
	.byte	0x9f
	.quad	.LVL385-.Ltext0
	.quad	.LVL388-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL389-.Ltext0
	.quad	.LVL390-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL390-.Ltext0
	.quad	.LVL391-.Ltext0
	.value	0x4
	.byte	0xa
	.value	0x7fff
	.byte	0x9f
	.quad	.LVL395-.Ltext0
	.quad	.LVL396-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL396-.Ltext0
	.quad	.LVL401-.Ltext0
	.value	0x4
	.byte	0xa
	.value	0x7fff
	.byte	0x9f
	.quad	.LVL401-.Ltext0
	.quad	.LVL404-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL405-.Ltext0
	.quad	.LVL406-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL411-.Ltext0
	.quad	.LFE47-.Ltext0
	.value	0x4
	.byte	0xa
	.value	0x7fff
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST75:
	.quad	.LVL247-.Ltext0
	.quad	.LVL248-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL248-1-.Ltext0
	.quad	.LVL259-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL284-.Ltext0
	.quad	.LVL285-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL297-.Ltext0
	.quad	.LVL298-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL308-.Ltext0
	.quad	.LVL309-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL350-.Ltext0
	.quad	.LVL354-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL368-.Ltext0
	.quad	.LVL373-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL378-.Ltext0
	.quad	.LVL379-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL385-.Ltext0
	.quad	.LVL388-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL389-.Ltext0
	.quad	.LVL390-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL395-.Ltext0
	.quad	.LVL396-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL401-.Ltext0
	.quad	.LVL404-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL405-.Ltext0
	.quad	.LVL406-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	0x0
	.quad	0x0
.LLST76:
	.quad	.LVL248-.Ltext0
	.quad	.LVL249-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL385-.Ltext0
	.quad	.LVL386-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0x0
	.quad	0x0
.LLST77:
	.quad	.LVL260-.Ltext0
	.quad	.LVL261-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL261-1-.Ltext0
	.quad	.LVL262-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL319-.Ltext0
	.quad	.LVL320-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL320-1-.Ltext0
	.quad	.LVL321-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL349-.Ltext0
	.quad	.LVL350-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL354-.Ltext0
	.quad	.LVL355-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL379-.Ltext0
	.quad	.LVL380-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL381-.Ltext0
	.quad	.LVL382-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0x0
	.quad	0x0
.LLST78:
	.quad	.LVL254-.Ltext0
	.quad	.LVL255-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL256-.Ltext0
	.quad	.LVL257-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	0x0
	.quad	0x0
.LLST79:
	.quad	.LVL263-.Ltext0
	.quad	.LVL265-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL265-.Ltext0
	.quad	.LVL281-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL313-.Ltext0
	.quad	.LVL316-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL316-.Ltext0
	.quad	.LVL317-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL317-1-.Ltext0
	.quad	.LVL318-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL322-.Ltext0
	.quad	.LVL342-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL346-.Ltext0
	.quad	.LVL349-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL355-.Ltext0
	.quad	.LVL356-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL361-.Ltext0
	.quad	.LVL363-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL380-.Ltext0
	.quad	.LVL381-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL388-.Ltext0
	.quad	.LVL389-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL391-.Ltext0
	.quad	.LVL395-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL404-.Ltext0
	.quad	.LVL405-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL406-.Ltext0
	.quad	.LVL411-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0x0
	.quad	0x0
.LLST80:
	.quad	.LVL264-.Ltext0
	.quad	.LVL265-.Ltext0
	.value	0x2
	.byte	0x70
	.sleb128 8
	.quad	.LVL265-.Ltext0
	.quad	.LVL266-1-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 8
	.quad	0x0
	.quad	0x0
.LLST81:
	.quad	.LVL203-.Ltext0
	.quad	.LVL204-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	.LVL303-.Ltext0
	.quad	.LVL304-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST82:
	.quad	.LVL201-.Ltext0
	.quad	.LVL202-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	.LVL202-.Ltext0
	.quad	.LVL204-.Ltext0
	.value	0x4
	.byte	0x91
	.sleb128 -14624
	.quad	.LVL398-.Ltext0
	.quad	.LVL399-.Ltext0
	.value	0x4
	.byte	0x91
	.sleb128 -14624
	.quad	.LVL415-.Ltext0
	.quad	.LVL416-.Ltext0
	.value	0x4
	.byte	0x91
	.sleb128 -14624
	.quad	0x0
	.quad	0x0
.LLST83:
	.quad	.LVL166-.Ltext0
	.quad	.LVL207-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL220-.Ltext0
	.quad	.LVL240-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL282-.Ltext0
	.quad	.LVL283-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL285-.Ltext0
	.quad	.LVL296-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL302-.Ltext0
	.quad	.LVL304-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL309-.Ltext0
	.quad	.LVL313-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL356-.Ltext0
	.quad	.LVL361-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL363-.Ltext0
	.quad	.LVL368-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL384-.Ltext0
	.quad	.LVL385-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL390-.Ltext0
	.quad	.LVL391-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL396-.Ltext0
	.quad	.LVL399-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL411-.Ltext0
	.quad	.LVL412-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL415-.Ltext0
	.quad	.LFE47-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	0x0
	.quad	0x0
.LLST84:
	.quad	.LVL166-.Ltext0
	.quad	.LVL187-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL220-.Ltext0
	.quad	.LVL240-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL282-.Ltext0
	.quad	.LVL283-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL285-.Ltext0
	.quad	.LVL296-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL309-.Ltext0
	.quad	.LVL313-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL356-.Ltext0
	.quad	.LVL361-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL363-.Ltext0
	.quad	.LVL368-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL384-.Ltext0
	.quad	.LVL385-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL390-.Ltext0
	.quad	.LVL391-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL396-.Ltext0
	.quad	.LVL398-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL411-.Ltext0
	.quad	.LVL412-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL421-.Ltext0
	.quad	.LFE47-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0x0
	.quad	0x0
.LLST85:
	.quad	.LVL167-.Ltext0
	.quad	.LVL169-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	.LVL175-.Ltext0
	.quad	.LVL176-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL176-.Ltext0
	.quad	.LVL177-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL177-.Ltext0
	.quad	.LVL178-.Ltext0
	.value	0x3
	.byte	0x73
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL178-.Ltext0
	.quad	.LVL180-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL185-.Ltext0
	.quad	.LVL186-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL221-.Ltext0
	.quad	.LVL222-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL222-.Ltext0
	.quad	.LVL223-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL223-1-.Ltext0
	.quad	.LVL224-.Ltext0
	.value	0x3
	.byte	0x73
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL226-.Ltext0
	.quad	.LVL227-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL227-.Ltext0
	.quad	.LVL228-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL228-.Ltext0
	.quad	.LVL229-.Ltext0
	.value	0x3
	.byte	0x73
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL234-.Ltext0
	.quad	.LVL235-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL235-.Ltext0
	.quad	.LVL236-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL236-.Ltext0
	.quad	.LVL237-.Ltext0
	.value	0x3
	.byte	0x73
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL237-.Ltext0
	.quad	.LVL238-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL238-.Ltext0
	.quad	.LVL239-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL239-1-.Ltext0
	.quad	.LVL240-.Ltext0
	.value	0x3
	.byte	0x73
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL287-.Ltext0
	.quad	.LVL288-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL288-.Ltext0
	.quad	.LVL289-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL289-.Ltext0
	.quad	.LVL290-.Ltext0
	.value	0x3
	.byte	0x73
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL293-.Ltext0
	.quad	.LVL294-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL294-.Ltext0
	.quad	.LVL295-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL295-.Ltext0
	.quad	.LVL296-.Ltext0
	.value	0x3
	.byte	0x73
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL310-.Ltext0
	.quad	.LVL311-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL311-.Ltext0
	.quad	.LVL312-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL312-.Ltext0
	.quad	.LVL313-.Ltext0
	.value	0x3
	.byte	0x73
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL358-.Ltext0
	.quad	.LVL359-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL359-.Ltext0
	.quad	.LVL360-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL360-.Ltext0
	.quad	.LVL361-.Ltext0
	.value	0x3
	.byte	0x73
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL396-.Ltext0
	.quad	.LVL398-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	.LVL423-.Ltext0
	.quad	.LVL424-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL424-.Ltext0
	.quad	.LVL425-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL425-.Ltext0
	.quad	.LVL426-.Ltext0
	.value	0x3
	.byte	0x73
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL428-.Ltext0
	.quad	.LVL429-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL429-.Ltext0
	.quad	.LVL430-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL430-.Ltext0
	.quad	.LVL431-.Ltext0
	.value	0x3
	.byte	0x73
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL433-.Ltext0
	.quad	.LVL434-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL434-.Ltext0
	.quad	.LVL435-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL435-.Ltext0
	.quad	.LVL436-.Ltext0
	.value	0x3
	.byte	0x73
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL440-.Ltext0
	.quad	.LVL441-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL441-.Ltext0
	.quad	.LVL442-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL442-1-.Ltext0
	.quad	.LVL443-.Ltext0
	.value	0x3
	.byte	0x73
	.sleb128 -1
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST86:
	.quad	.LVL390-.Ltext0
	.quad	.LVL391-.Ltext0
	.value	0x2
	.byte	0x34
	.byte	0x9f
	.quad	.LVL421-.Ltext0
	.quad	.LFE47-.Ltext0
	.value	0x2
	.byte	0x34
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST87:
	.quad	.LVL366-.Ltext0
	.quad	.LVL368-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL390-.Ltext0
	.quad	.LVL391-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL421-.Ltext0
	.quad	.LFE47-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST88:
	.quad	.LVL366-.Ltext0
	.quad	.LVL368-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL390-.Ltext0
	.quad	.LVL391-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL421-.Ltext0
	.quad	.LFE47-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	0x0
	.quad	0x0
.LLST89:
	.quad	.LVL365-.Ltext0
	.quad	.LVL368-.Ltext0
	.value	0x2
	.byte	0x34
	.byte	0x9f
	.quad	.LVL384-.Ltext0
	.quad	.LVL385-.Ltext0
	.value	0x2
	.byte	0x34
	.byte	0x9f
	.quad	.LVL390-.Ltext0
	.quad	.LVL391-.Ltext0
	.value	0x2
	.byte	0x34
	.byte	0x9f
	.quad	.LVL421-.Ltext0
	.quad	.LFE47-.Ltext0
	.value	0x2
	.byte	0x34
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST90:
	.quad	.LVL363-.Ltext0
	.quad	.LVL368-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL384-.Ltext0
	.quad	.LVL385-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL390-.Ltext0
	.quad	.LVL391-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL421-.Ltext0
	.quad	.LFE47-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST91:
	.quad	.LVL363-.Ltext0
	.quad	.LVL368-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL384-.Ltext0
	.quad	.LVL385-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL390-.Ltext0
	.quad	.LVL391-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL421-.Ltext0
	.quad	.LFE47-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	0x0
	.quad	0x0
.LLST92:
	.quad	.LVL183-.Ltext0
	.quad	.LVL186-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL220-.Ltext0
	.quad	.LVL221-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL224-.Ltext0
	.quad	.LVL237-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL282-.Ltext0
	.quad	.LVL283-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL285-.Ltext0
	.quad	.LVL296-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL309-.Ltext0
	.quad	.LVL313-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL356-.Ltext0
	.quad	.LVL361-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL363-.Ltext0
	.quad	.LVL368-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL384-.Ltext0
	.quad	.LVL385-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL390-.Ltext0
	.quad	.LVL391-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL421-.Ltext0
	.quad	.LFE47-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST93:
	.quad	.LVL183-.Ltext0
	.quad	.LVL186-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL220-.Ltext0
	.quad	.LVL221-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL224-.Ltext0
	.quad	.LVL237-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL282-.Ltext0
	.quad	.LVL283-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL285-.Ltext0
	.quad	.LVL296-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL309-.Ltext0
	.quad	.LVL313-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL356-.Ltext0
	.quad	.LVL361-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL363-.Ltext0
	.quad	.LVL368-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL384-.Ltext0
	.quad	.LVL385-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL390-.Ltext0
	.quad	.LVL391-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL421-.Ltext0
	.quad	.LFE47-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	0x0
	.quad	0x0
.LLST94:
	.quad	.LVL169-.Ltext0
	.quad	.LVL186-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL220-.Ltext0
	.quad	.LVL240-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL282-.Ltext0
	.quad	.LVL283-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL285-.Ltext0
	.quad	.LVL296-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL309-.Ltext0
	.quad	.LVL313-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL356-.Ltext0
	.quad	.LVL361-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL363-.Ltext0
	.quad	.LVL368-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL384-.Ltext0
	.quad	.LVL385-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL390-.Ltext0
	.quad	.LVL391-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL411-.Ltext0
	.quad	.LVL412-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL421-.Ltext0
	.quad	.LFE47-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST95:
	.quad	.LVL169-.Ltext0
	.quad	.LVL170-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL171-.Ltext0
	.quad	.LVL179-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL180-.Ltext0
	.quad	.LVL186-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL220-.Ltext0
	.quad	.LVL240-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL282-.Ltext0
	.quad	.LVL283-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL285-.Ltext0
	.quad	.LVL296-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL309-.Ltext0
	.quad	.LVL313-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL356-.Ltext0
	.quad	.LVL361-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL363-.Ltext0
	.quad	.LVL368-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL384-.Ltext0
	.quad	.LVL385-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL390-.Ltext0
	.quad	.LVL391-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL411-.Ltext0
	.quad	.LVL412-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL421-.Ltext0
	.quad	.LFE47-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	0x0
	.quad	0x0
.LLST96:
	.quad	.LVL173-.Ltext0
	.quad	.LVL178-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL183-.Ltext0
	.quad	.LVL186-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL220-.Ltext0
	.quad	.LVL221-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL224-.Ltext0
	.quad	.LVL237-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL282-.Ltext0
	.quad	.LVL283-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL285-.Ltext0
	.quad	.LVL296-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL309-.Ltext0
	.quad	.LVL313-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL356-.Ltext0
	.quad	.LVL361-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL363-.Ltext0
	.quad	.LVL368-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL384-.Ltext0
	.quad	.LVL385-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL390-.Ltext0
	.quad	.LVL391-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL421-.Ltext0
	.quad	.LFE47-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST97:
	.quad	.LVL173-.Ltext0
	.quad	.LVL178-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL183-.Ltext0
	.quad	.LVL186-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL220-.Ltext0
	.quad	.LVL221-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL224-.Ltext0
	.quad	.LVL237-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL282-.Ltext0
	.quad	.LVL283-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL285-.Ltext0
	.quad	.LVL296-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL309-.Ltext0
	.quad	.LVL313-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL356-.Ltext0
	.quad	.LVL361-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL363-.Ltext0
	.quad	.LVL368-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL384-.Ltext0
	.quad	.LVL385-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL390-.Ltext0
	.quad	.LVL391-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL421-.Ltext0
	.quad	.LFE47-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	0x0
	.quad	0x0
.LLST98:
	.quad	.LVL171-.Ltext0
	.quad	.LVL178-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL183-.Ltext0
	.quad	.LVL186-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL220-.Ltext0
	.quad	.LVL221-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL224-.Ltext0
	.quad	.LVL240-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL282-.Ltext0
	.quad	.LVL283-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL285-.Ltext0
	.quad	.LVL296-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL309-.Ltext0
	.quad	.LVL313-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL356-.Ltext0
	.quad	.LVL361-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL363-.Ltext0
	.quad	.LVL368-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL384-.Ltext0
	.quad	.LVL385-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL390-.Ltext0
	.quad	.LVL391-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL421-.Ltext0
	.quad	.LFE47-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST99:
	.quad	.LVL171-.Ltext0
	.quad	.LVL178-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL183-.Ltext0
	.quad	.LVL186-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL220-.Ltext0
	.quad	.LVL221-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL224-.Ltext0
	.quad	.LVL240-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL282-.Ltext0
	.quad	.LVL283-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL285-.Ltext0
	.quad	.LVL296-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL309-.Ltext0
	.quad	.LVL313-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL356-.Ltext0
	.quad	.LVL361-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL363-.Ltext0
	.quad	.LVL368-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL384-.Ltext0
	.quad	.LVL385-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL390-.Ltext0
	.quad	.LVL391-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL421-.Ltext0
	.quad	.LFE47-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	0x0
	.quad	0x0
.LLST100:
	.quad	.LVL169-.Ltext0
	.quad	.LVL180-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL182-.Ltext0
	.quad	.LVL186-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL220-.Ltext0
	.quad	.LVL240-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL282-.Ltext0
	.quad	.LVL283-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL285-.Ltext0
	.quad	.LVL296-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL309-.Ltext0
	.quad	.LVL313-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL356-.Ltext0
	.quad	.LVL361-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL363-.Ltext0
	.quad	.LVL368-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL384-.Ltext0
	.quad	.LVL385-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL390-.Ltext0
	.quad	.LVL391-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL421-.Ltext0
	.quad	.LFE47-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST101:
	.quad	.LVL169-.Ltext0
	.quad	.LVL179-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL182-.Ltext0
	.quad	.LVL186-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL220-.Ltext0
	.quad	.LVL240-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL282-.Ltext0
	.quad	.LVL283-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL285-.Ltext0
	.quad	.LVL296-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL309-.Ltext0
	.quad	.LVL313-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL356-.Ltext0
	.quad	.LVL361-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL363-.Ltext0
	.quad	.LVL368-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL384-.Ltext0
	.quad	.LVL385-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL390-.Ltext0
	.quad	.LVL391-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL421-.Ltext0
	.quad	.LFE47-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	0x0
	.quad	0x0
.LLST102:
	.quad	.LVL220-.Ltext0
	.quad	.LVL221-.Ltext0
	.value	0x2
	.byte	0x34
	.byte	0x9f
	.quad	.LVL224-.Ltext0
	.quad	.LVL237-.Ltext0
	.value	0x2
	.byte	0x34
	.byte	0x9f
	.quad	.LVL282-.Ltext0
	.quad	.LVL283-.Ltext0
	.value	0x2
	.byte	0x34
	.byte	0x9f
	.quad	.LVL285-.Ltext0
	.quad	.LVL296-.Ltext0
	.value	0x2
	.byte	0x34
	.byte	0x9f
	.quad	.LVL309-.Ltext0
	.quad	.LVL313-.Ltext0
	.value	0x2
	.byte	0x34
	.byte	0x9f
	.quad	.LVL356-.Ltext0
	.quad	.LVL361-.Ltext0
	.value	0x2
	.byte	0x34
	.byte	0x9f
	.quad	.LVL363-.Ltext0
	.quad	.LVL368-.Ltext0
	.value	0x2
	.byte	0x34
	.byte	0x9f
	.quad	.LVL384-.Ltext0
	.quad	.LVL385-.Ltext0
	.value	0x2
	.byte	0x34
	.byte	0x9f
	.quad	.LVL390-.Ltext0
	.quad	.LVL391-.Ltext0
	.value	0x2
	.byte	0x34
	.byte	0x9f
	.quad	.LVL421-.Ltext0
	.quad	.LFE47-.Ltext0
	.value	0x2
	.byte	0x34
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST103:
	.quad	.LVL224-.Ltext0
	.quad	.LVL237-.Ltext0
	.value	0x2
	.byte	0x33
	.byte	0x9f
	.quad	.LVL282-.Ltext0
	.quad	.LVL283-.Ltext0
	.value	0x2
	.byte	0x33
	.byte	0x9f
	.quad	.LVL285-.Ltext0
	.quad	.LVL296-.Ltext0
	.value	0x2
	.byte	0x33
	.byte	0x9f
	.quad	.LVL309-.Ltext0
	.quad	.LVL313-.Ltext0
	.value	0x2
	.byte	0x33
	.byte	0x9f
	.quad	.LVL356-.Ltext0
	.quad	.LVL361-.Ltext0
	.value	0x2
	.byte	0x33
	.byte	0x9f
	.quad	.LVL363-.Ltext0
	.quad	.LVL368-.Ltext0
	.value	0x2
	.byte	0x33
	.byte	0x9f
	.quad	.LVL384-.Ltext0
	.quad	.LVL385-.Ltext0
	.value	0x2
	.byte	0x33
	.byte	0x9f
	.quad	.LVL390-.Ltext0
	.quad	.LVL391-.Ltext0
	.value	0x2
	.byte	0x33
	.byte	0x9f
	.quad	.LVL421-.Ltext0
	.quad	.LFE47-.Ltext0
	.value	0x2
	.byte	0x33
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST104:
	.quad	.LVL224-.Ltext0
	.quad	.LVL237-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL282-.Ltext0
	.quad	.LVL283-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL285-.Ltext0
	.quad	.LVL296-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL309-.Ltext0
	.quad	.LVL313-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL356-.Ltext0
	.quad	.LVL361-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL363-.Ltext0
	.quad	.LVL368-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL384-.Ltext0
	.quad	.LVL385-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL390-.Ltext0
	.quad	.LVL391-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL421-.Ltext0
	.quad	.LFE47-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	0x0
	.quad	0x0
.LLST105:
	.quad	.LVL229-.Ltext0
	.quad	.LVL237-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL282-.Ltext0
	.quad	.LVL283-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL285-.Ltext0
	.quad	.LVL296-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL309-.Ltext0
	.quad	.LVL313-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL356-.Ltext0
	.quad	.LVL361-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL363-.Ltext0
	.quad	.LVL368-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL384-.Ltext0
	.quad	.LVL385-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL390-.Ltext0
	.quad	.LVL391-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL421-.Ltext0
	.quad	.LFE47-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST106:
	.quad	.LVL229-.Ltext0
	.quad	.LVL237-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL282-.Ltext0
	.quad	.LVL283-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL285-.Ltext0
	.quad	.LVL296-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL309-.Ltext0
	.quad	.LVL313-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL356-.Ltext0
	.quad	.LVL361-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL363-.Ltext0
	.quad	.LVL368-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL384-.Ltext0
	.quad	.LVL385-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL390-.Ltext0
	.quad	.LVL391-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL421-.Ltext0
	.quad	.LFE47-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	0x0
	.quad	0x0
.LLST107:
	.quad	.LVL231-.Ltext0
	.quad	.LVL237-.Ltext0
	.value	0x2
	.byte	0x34
	.byte	0x9f
	.quad	.LVL282-.Ltext0
	.quad	.LVL283-.Ltext0
	.value	0x2
	.byte	0x34
	.byte	0x9f
	.quad	.LVL285-.Ltext0
	.quad	.LVL296-.Ltext0
	.value	0x2
	.byte	0x34
	.byte	0x9f
	.quad	.LVL309-.Ltext0
	.quad	.LVL313-.Ltext0
	.value	0x2
	.byte	0x34
	.byte	0x9f
	.quad	.LVL356-.Ltext0
	.quad	.LVL361-.Ltext0
	.value	0x2
	.byte	0x34
	.byte	0x9f
	.quad	.LVL363-.Ltext0
	.quad	.LVL368-.Ltext0
	.value	0x2
	.byte	0x34
	.byte	0x9f
	.quad	.LVL384-.Ltext0
	.quad	.LVL385-.Ltext0
	.value	0x2
	.byte	0x34
	.byte	0x9f
	.quad	.LVL390-.Ltext0
	.quad	.LVL391-.Ltext0
	.value	0x2
	.byte	0x34
	.byte	0x9f
	.quad	.LVL421-.Ltext0
	.quad	.LFE47-.Ltext0
	.value	0x2
	.byte	0x34
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST108:
	.quad	.LVL232-.Ltext0
	.quad	.LVL237-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL285-.Ltext0
	.quad	.LVL296-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL309-.Ltext0
	.quad	.LVL313-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL356-.Ltext0
	.quad	.LVL361-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL363-.Ltext0
	.quad	.LVL368-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL384-.Ltext0
	.quad	.LVL385-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL390-.Ltext0
	.quad	.LVL391-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL421-.Ltext0
	.quad	.LFE47-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST109:
	.quad	.LVL232-.Ltext0
	.quad	.LVL237-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL285-.Ltext0
	.quad	.LVL296-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL309-.Ltext0
	.quad	.LVL313-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL356-.Ltext0
	.quad	.LVL361-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL363-.Ltext0
	.quad	.LVL368-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL384-.Ltext0
	.quad	.LVL385-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL390-.Ltext0
	.quad	.LVL391-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL421-.Ltext0
	.quad	.LFE47-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	0x0
	.quad	0x0
.LLST110:
	.quad	.LVL237-.Ltext0
	.quad	.LVL238-.Ltext0
	.value	0xd
	.byte	0x73
	.sleb128 0
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x33
	.byte	0x24
	.byte	0x7c
	.sleb128 0
	.byte	0x22
	.quad	.LVL238-.Ltext0
	.quad	.LVL239-1-.Ltext0
	.value	0xd
	.byte	0x70
	.sleb128 0
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x33
	.byte	0x24
	.byte	0x7c
	.sleb128 0
	.byte	0x22
	.quad	0x0
	.quad	0x0
.LLST111:
	.quad	.LVL285-.Ltext0
	.quad	.LVL296-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL309-.Ltext0
	.quad	.LVL313-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL356-.Ltext0
	.quad	.LVL361-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL363-.Ltext0
	.quad	.LVL368-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL384-.Ltext0
	.quad	.LVL385-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL390-.Ltext0
	.quad	.LVL391-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL421-.Ltext0
	.quad	.LFE47-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST112:
	.quad	.LVL285-.Ltext0
	.quad	.LVL296-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL309-.Ltext0
	.quad	.LVL313-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL356-.Ltext0
	.quad	.LVL361-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL363-.Ltext0
	.quad	.LVL368-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL384-.Ltext0
	.quad	.LVL385-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL390-.Ltext0
	.quad	.LVL391-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL421-.Ltext0
	.quad	.LFE47-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	0x0
	.quad	0x0
.LLST113:
	.quad	.LVL290-.Ltext0
	.quad	.LVL296-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL309-.Ltext0
	.quad	.LVL313-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL356-.Ltext0
	.quad	.LVL361-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL363-.Ltext0
	.quad	.LVL368-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL384-.Ltext0
	.quad	.LVL385-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL390-.Ltext0
	.quad	.LVL391-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL421-.Ltext0
	.quad	.LFE47-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST114:
	.quad	.LVL290-.Ltext0
	.quad	.LVL296-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL309-.Ltext0
	.quad	.LVL313-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL356-.Ltext0
	.quad	.LVL361-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL363-.Ltext0
	.quad	.LVL368-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL384-.Ltext0
	.quad	.LVL385-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL390-.Ltext0
	.quad	.LVL391-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL421-.Ltext0
	.quad	.LFE47-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	0x0
	.quad	0x0
.LLST115:
	.quad	.LVL291-.Ltext0
	.quad	.LVL296-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL356-.Ltext0
	.quad	.LVL361-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL363-.Ltext0
	.quad	.LVL368-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL384-.Ltext0
	.quad	.LVL385-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL390-.Ltext0
	.quad	.LVL391-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL421-.Ltext0
	.quad	.LFE47-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST116:
	.quad	.LVL291-.Ltext0
	.quad	.LVL296-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL356-.Ltext0
	.quad	.LVL361-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL363-.Ltext0
	.quad	.LVL368-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL384-.Ltext0
	.quad	.LVL385-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL390-.Ltext0
	.quad	.LVL391-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL421-.Ltext0
	.quad	.LFE47-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	0x0
	.quad	0x0
.LLST117:
	.quad	.LVL356-.Ltext0
	.quad	.LVL361-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL363-.Ltext0
	.quad	.LVL368-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL384-.Ltext0
	.quad	.LVL385-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL390-.Ltext0
	.quad	.LVL391-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL421-.Ltext0
	.quad	.LFE47-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST118:
	.quad	.LVL356-.Ltext0
	.quad	.LVL361-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL363-.Ltext0
	.quad	.LVL368-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL384-.Ltext0
	.quad	.LVL385-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL390-.Ltext0
	.quad	.LVL391-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL421-.Ltext0
	.quad	.LFE47-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	0x0
	.quad	0x0
.LLST119:
	.quad	.LVL438-.Ltext0
	.quad	.LVL440-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL443-.Ltext0
	.quad	.LFE47-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST120:
	.quad	.LVL438-.Ltext0
	.quad	.LVL440-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL443-.Ltext0
	.quad	.LFE47-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	0x0
	.quad	0x0
.LLST121:
	.quad	.LVL440-.Ltext0
	.quad	.LVL441-.Ltext0
	.value	0xd
	.byte	0x73
	.sleb128 0
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x33
	.byte	0x24
	.byte	0x7c
	.sleb128 0
	.byte	0x22
	.quad	.LVL441-.Ltext0
	.quad	.LVL442-1-.Ltext0
	.value	0xd
	.byte	0x70
	.sleb128 0
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x33
	.byte	0x24
	.byte	0x7c
	.sleb128 0
	.byte	0x22
	.quad	0x0
	.quad	0x0
.LLST122:
	.quad	.LVL188-.Ltext0
	.quad	.LVL220-.Ltext0
	.value	0x4
	.byte	0x91
	.sleb128 -336
	.byte	0x9f
	.quad	.LVL240-.Ltext0
	.quad	.LVL282-.Ltext0
	.value	0x4
	.byte	0x91
	.sleb128 -336
	.byte	0x9f
	.quad	.LVL283-.Ltext0
	.quad	.LVL285-.Ltext0
	.value	0x4
	.byte	0x91
	.sleb128 -336
	.byte	0x9f
	.quad	.LVL296-.Ltext0
	.quad	.LVL309-.Ltext0
	.value	0x4
	.byte	0x91
	.sleb128 -336
	.byte	0x9f
	.quad	.LVL313-.Ltext0
	.quad	.LVL356-.Ltext0
	.value	0x4
	.byte	0x91
	.sleb128 -336
	.byte	0x9f
	.quad	.LVL361-.Ltext0
	.quad	.LVL363-.Ltext0
	.value	0x4
	.byte	0x91
	.sleb128 -336
	.byte	0x9f
	.quad	.LVL368-.Ltext0
	.quad	.LVL384-.Ltext0
	.value	0x4
	.byte	0x91
	.sleb128 -336
	.byte	0x9f
	.quad	.LVL385-.Ltext0
	.quad	.LVL390-.Ltext0
	.value	0x4
	.byte	0x91
	.sleb128 -336
	.byte	0x9f
	.quad	.LVL391-.Ltext0
	.quad	.LVL396-.Ltext0
	.value	0x4
	.byte	0x91
	.sleb128 -336
	.byte	0x9f
	.quad	.LVL398-.Ltext0
	.quad	.LVL411-.Ltext0
	.value	0x4
	.byte	0x91
	.sleb128 -336
	.byte	0x9f
	.quad	.LVL412-.Ltext0
	.quad	.LVL421-.Ltext0
	.value	0x4
	.byte	0x91
	.sleb128 -336
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST123:
	.quad	.LVL188-.Ltext0
	.quad	.LVL220-.Ltext0
	.value	0x4
	.byte	0x91
	.sleb128 -208
	.byte	0x9f
	.quad	.LVL240-.Ltext0
	.quad	.LVL282-.Ltext0
	.value	0x4
	.byte	0x91
	.sleb128 -208
	.byte	0x9f
	.quad	.LVL283-.Ltext0
	.quad	.LVL285-.Ltext0
	.value	0x4
	.byte	0x91
	.sleb128 -208
	.byte	0x9f
	.quad	.LVL296-.Ltext0
	.quad	.LVL309-.Ltext0
	.value	0x4
	.byte	0x91
	.sleb128 -208
	.byte	0x9f
	.quad	.LVL313-.Ltext0
	.quad	.LVL356-.Ltext0
	.value	0x4
	.byte	0x91
	.sleb128 -208
	.byte	0x9f
	.quad	.LVL361-.Ltext0
	.quad	.LVL363-.Ltext0
	.value	0x4
	.byte	0x91
	.sleb128 -208
	.byte	0x9f
	.quad	.LVL368-.Ltext0
	.quad	.LVL384-.Ltext0
	.value	0x4
	.byte	0x91
	.sleb128 -208
	.byte	0x9f
	.quad	.LVL385-.Ltext0
	.quad	.LVL390-.Ltext0
	.value	0x4
	.byte	0x91
	.sleb128 -208
	.byte	0x9f
	.quad	.LVL391-.Ltext0
	.quad	.LVL396-.Ltext0
	.value	0x4
	.byte	0x91
	.sleb128 -208
	.byte	0x9f
	.quad	.LVL398-.Ltext0
	.quad	.LVL411-.Ltext0
	.value	0x4
	.byte	0x91
	.sleb128 -208
	.byte	0x9f
	.quad	.LVL412-.Ltext0
	.quad	.LVL421-.Ltext0
	.value	0x4
	.byte	0x91
	.sleb128 -208
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST124:
	.quad	.LVL189-.Ltext0
	.quad	.LVL191-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL191-.Ltext0
	.quad	.LVL193-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL302-.Ltext0
	.quad	.LVL303-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL416-.Ltext0
	.quad	.LVL417-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL417-1-.Ltext0
	.quad	.LVL418-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0x0
	.quad	0x0
.LLST125:
	.quad	.LVL190-.Ltext0
	.quad	.LVL192-.Ltext0
	.value	0x4
	.byte	0x91
	.sleb128 -14472
	.quad	.LVL203-.Ltext0
	.quad	.LVL220-.Ltext0
	.value	0x4
	.byte	0x91
	.sleb128 -14472
	.quad	.LVL240-.Ltext0
	.quad	.LVL282-.Ltext0
	.value	0x4
	.byte	0x91
	.sleb128 -14472
	.quad	.LVL283-.Ltext0
	.quad	.LVL285-.Ltext0
	.value	0x4
	.byte	0x91
	.sleb128 -14472
	.quad	.LVL296-.Ltext0
	.quad	.LVL302-.Ltext0
	.value	0x4
	.byte	0x91
	.sleb128 -14472
	.quad	.LVL303-.Ltext0
	.quad	.LVL309-.Ltext0
	.value	0x4
	.byte	0x91
	.sleb128 -14472
	.quad	.LVL313-.Ltext0
	.quad	.LVL356-.Ltext0
	.value	0x4
	.byte	0x91
	.sleb128 -14472
	.quad	.LVL361-.Ltext0
	.quad	.LVL363-.Ltext0
	.value	0x4
	.byte	0x91
	.sleb128 -14472
	.quad	.LVL368-.Ltext0
	.quad	.LVL384-.Ltext0
	.value	0x4
	.byte	0x91
	.sleb128 -14472
	.quad	.LVL385-.Ltext0
	.quad	.LVL390-.Ltext0
	.value	0x4
	.byte	0x91
	.sleb128 -14472
	.quad	.LVL391-.Ltext0
	.quad	.LVL396-.Ltext0
	.value	0x4
	.byte	0x91
	.sleb128 -14472
	.quad	.LVL398-.Ltext0
	.quad	.LVL411-.Ltext0
	.value	0x4
	.byte	0x91
	.sleb128 -14472
	.quad	.LVL412-.Ltext0
	.quad	.LVL415-.Ltext0
	.value	0x4
	.byte	0x91
	.sleb128 -14472
	.quad	0x0
	.quad	0x0
.LLST126:
	.quad	.LVL192-.Ltext0
	.quad	.LVL194-.Ltext0
	.value	0x4
	.byte	0x91
	.sleb128 -14472
	.quad	.LVL194-.Ltext0
	.quad	.LVL201-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL302-.Ltext0
	.quad	.LVL303-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL418-.Ltext0
	.quad	.LVL420-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0x0
	.quad	0x0
.LLST127:
	.quad	.LVL190-.Ltext0
	.quad	.LVL194-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL195-.Ltext0
	.quad	.LVL197-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL198-.Ltext0
	.quad	.LVL200-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL302-.Ltext0
	.quad	.LVL303-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL418-.Ltext0
	.quad	.LVL419-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	0x0
	.quad	0x0
.LLST128:
	.quad	.LVL190-.Ltext0
	.quad	.LVL194-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL195-.Ltext0
	.quad	.LVL197-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL198-.Ltext0
	.quad	.LVL204-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL302-.Ltext0
	.quad	.LVL303-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL398-.Ltext0
	.quad	.LVL399-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL415-.Ltext0
	.quad	.LVL416-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL418-.Ltext0
	.quad	.LVL421-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0x0
	.quad	0x0
.LLST129:
	.quad	.LVL188-.Ltext0
	.quad	.LVL220-.Ltext0
	.value	0x3
	.byte	0x8
	.byte	0x80
	.byte	0x9f
	.quad	.LVL240-.Ltext0
	.quad	.LVL282-.Ltext0
	.value	0x3
	.byte	0x8
	.byte	0x80
	.byte	0x9f
	.quad	.LVL283-.Ltext0
	.quad	.LVL285-.Ltext0
	.value	0x3
	.byte	0x8
	.byte	0x80
	.byte	0x9f
	.quad	.LVL296-.Ltext0
	.quad	.LVL309-.Ltext0
	.value	0x3
	.byte	0x8
	.byte	0x80
	.byte	0x9f
	.quad	.LVL313-.Ltext0
	.quad	.LVL356-.Ltext0
	.value	0x3
	.byte	0x8
	.byte	0x80
	.byte	0x9f
	.quad	.LVL361-.Ltext0
	.quad	.LVL363-.Ltext0
	.value	0x3
	.byte	0x8
	.byte	0x80
	.byte	0x9f
	.quad	.LVL368-.Ltext0
	.quad	.LVL384-.Ltext0
	.value	0x3
	.byte	0x8
	.byte	0x80
	.byte	0x9f
	.quad	.LVL385-.Ltext0
	.quad	.LVL390-.Ltext0
	.value	0x3
	.byte	0x8
	.byte	0x80
	.byte	0x9f
	.quad	.LVL391-.Ltext0
	.quad	.LVL396-.Ltext0
	.value	0x3
	.byte	0x8
	.byte	0x80
	.byte	0x9f
	.quad	.LVL398-.Ltext0
	.quad	.LVL411-.Ltext0
	.value	0x3
	.byte	0x8
	.byte	0x80
	.byte	0x9f
	.quad	.LVL412-.Ltext0
	.quad	.LVL421-.Ltext0
	.value	0x3
	.byte	0x8
	.byte	0x80
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST130:
	.quad	.LVL188-.Ltext0
	.quad	.LVL220-.Ltext0
	.value	0x3
	.byte	0x8
	.byte	0x80
	.byte	0x9f
	.quad	.LVL240-.Ltext0
	.quad	.LVL282-.Ltext0
	.value	0x3
	.byte	0x8
	.byte	0x80
	.byte	0x9f
	.quad	.LVL283-.Ltext0
	.quad	.LVL285-.Ltext0
	.value	0x3
	.byte	0x8
	.byte	0x80
	.byte	0x9f
	.quad	.LVL296-.Ltext0
	.quad	.LVL309-.Ltext0
	.value	0x3
	.byte	0x8
	.byte	0x80
	.byte	0x9f
	.quad	.LVL313-.Ltext0
	.quad	.LVL356-.Ltext0
	.value	0x3
	.byte	0x8
	.byte	0x80
	.byte	0x9f
	.quad	.LVL361-.Ltext0
	.quad	.LVL363-.Ltext0
	.value	0x3
	.byte	0x8
	.byte	0x80
	.byte	0x9f
	.quad	.LVL368-.Ltext0
	.quad	.LVL384-.Ltext0
	.value	0x3
	.byte	0x8
	.byte	0x80
	.byte	0x9f
	.quad	.LVL385-.Ltext0
	.quad	.LVL390-.Ltext0
	.value	0x3
	.byte	0x8
	.byte	0x80
	.byte	0x9f
	.quad	.LVL391-.Ltext0
	.quad	.LVL396-.Ltext0
	.value	0x3
	.byte	0x8
	.byte	0x80
	.byte	0x9f
	.quad	.LVL398-.Ltext0
	.quad	.LVL411-.Ltext0
	.value	0x3
	.byte	0x8
	.byte	0x80
	.byte	0x9f
	.quad	.LVL412-.Ltext0
	.quad	.LVL421-.Ltext0
	.value	0x3
	.byte	0x8
	.byte	0x80
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST131:
	.quad	.LVL205-.Ltext0
	.quad	.LVL206-1-.Ltext0
	.value	0x9
	.byte	0x3
	.quad	throttlefile
	.quad	.LVL206-1-.Ltext0
	.quad	.LVL220-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL240-.Ltext0
	.quad	.LVL241-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL281-.Ltext0
	.quad	.LVL282-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL296-.Ltext0
	.quad	.LVL297-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL412-.Ltext0
	.quad	.LVL415-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	0x0
	.quad	0x0
.LLST132:
	.quad	.LVL207-.Ltext0
	.quad	.LVL208-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL208-1-.Ltext0
	.quad	.LVL220-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL240-.Ltext0
	.quad	.LVL241-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL281-.Ltext0
	.quad	.LVL282-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL296-.Ltext0
	.quad	.LVL297-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL412-.Ltext0
	.quad	.LVL413-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL413-.Ltext0
	.quad	.LVL415-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	0x0
	.quad	0x0
.LLST133:
	.quad	.LVL210-.Ltext0
	.quad	.LVL211-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL216-.Ltext0
	.quad	.LVL217-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL218-.Ltext0
	.quad	.LVL219-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0x0
	.quad	0x0
.LLST134:
	.quad	.LVL212-.Ltext0
	.quad	.LVL213-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL213-.Ltext0
	.quad	.LVL214-.Ltext0
	.value	0x3
	.byte	0x70
	.sleb128 1
	.byte	0x9f
	.quad	.LVL214-.Ltext0
	.quad	.LVL215-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0x0
	.quad	0x0
.LLST135:
	.quad	.LVL209-.Ltext0
	.quad	.LVL220-.Ltext0
	.value	0x4
	.byte	0x91
	.sleb128 -14480
	.quad	.LVL240-.Ltext0
	.quad	.LVL282-.Ltext0
	.value	0x4
	.byte	0x91
	.sleb128 -14480
	.quad	.LVL283-.Ltext0
	.quad	.LVL285-.Ltext0
	.value	0x4
	.byte	0x91
	.sleb128 -14480
	.quad	.LVL296-.Ltext0
	.quad	.LVL302-.Ltext0
	.value	0x4
	.byte	0x91
	.sleb128 -14480
	.quad	.LVL304-.Ltext0
	.quad	.LVL309-.Ltext0
	.value	0x4
	.byte	0x91
	.sleb128 -14480
	.quad	.LVL313-.Ltext0
	.quad	.LVL356-.Ltext0
	.value	0x4
	.byte	0x91
	.sleb128 -14480
	.quad	.LVL361-.Ltext0
	.quad	.LVL363-.Ltext0
	.value	0x4
	.byte	0x91
	.sleb128 -14480
	.quad	.LVL368-.Ltext0
	.quad	.LVL384-.Ltext0
	.value	0x4
	.byte	0x91
	.sleb128 -14480
	.quad	.LVL385-.Ltext0
	.quad	.LVL390-.Ltext0
	.value	0x4
	.byte	0x91
	.sleb128 -14480
	.quad	.LVL391-.Ltext0
	.quad	.LVL396-.Ltext0
	.value	0x4
	.byte	0x91
	.sleb128 -14480
	.quad	.LVL399-.Ltext0
	.quad	.LVL411-.Ltext0
	.value	0x4
	.byte	0x91
	.sleb128 -14480
	.quad	.LVL414-.Ltext0
	.quad	.LVL415-.Ltext0
	.value	0x4
	.byte	0x91
	.sleb128 -14480
	.quad	0x0
	.quad	0x0
.LLST136:
	.quad	.LVL209-.Ltext0
	.quad	.LVL220-.Ltext0
	.value	0x4
	.byte	0x91
	.sleb128 -14488
	.quad	.LVL240-.Ltext0
	.quad	.LVL282-.Ltext0
	.value	0x4
	.byte	0x91
	.sleb128 -14488
	.quad	.LVL283-.Ltext0
	.quad	.LVL285-.Ltext0
	.value	0x4
	.byte	0x91
	.sleb128 -14488
	.quad	.LVL296-.Ltext0
	.quad	.LVL302-.Ltext0
	.value	0x4
	.byte	0x91
	.sleb128 -14488
	.quad	.LVL304-.Ltext0
	.quad	.LVL309-.Ltext0
	.value	0x4
	.byte	0x91
	.sleb128 -14488
	.quad	.LVL313-.Ltext0
	.quad	.LVL356-.Ltext0
	.value	0x4
	.byte	0x91
	.sleb128 -14488
	.quad	.LVL361-.Ltext0
	.quad	.LVL363-.Ltext0
	.value	0x4
	.byte	0x91
	.sleb128 -14488
	.quad	.LVL368-.Ltext0
	.quad	.LVL384-.Ltext0
	.value	0x4
	.byte	0x91
	.sleb128 -14488
	.quad	.LVL385-.Ltext0
	.quad	.LVL390-.Ltext0
	.value	0x4
	.byte	0x91
	.sleb128 -14488
	.quad	.LVL391-.Ltext0
	.quad	.LVL396-.Ltext0
	.value	0x4
	.byte	0x91
	.sleb128 -14488
	.quad	.LVL399-.Ltext0
	.quad	.LVL411-.Ltext0
	.value	0x4
	.byte	0x91
	.sleb128 -14488
	.quad	.LVL414-.Ltext0
	.quad	.LVL415-.Ltext0
	.value	0x4
	.byte	0x91
	.sleb128 -14488
	.quad	0x0
	.quad	0x0
.LLST137:
	.quad	.LVL243-.Ltext0
	.quad	.LVL250-.Ltext0
	.value	0x2
	.byte	0x39
	.byte	0x9f
	.quad	.LVL283-.Ltext0
	.quad	.LVL285-.Ltext0
	.value	0x2
	.byte	0x39
	.byte	0x9f
	.quad	.LVL306-.Ltext0
	.quad	.LVL308-.Ltext0
	.value	0x2
	.byte	0x39
	.byte	0x9f
	.quad	.LVL385-.Ltext0
	.quad	.LVL387-.Ltext0
	.value	0x2
	.byte	0x39
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST138:
	.quad	.LVL244-.Ltext0
	.quad	.LVL250-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	.LVL306-.Ltext0
	.quad	.LVL308-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	.LVL385-.Ltext0
	.quad	.LVL387-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST139:
	.quad	.LVL244-.Ltext0
	.quad	.LVL246-1-.Ltext0
	.value	0x9
	.byte	0x3
	.quad	logfile
	.quad	.LVL306-.Ltext0
	.quad	.LVL308-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0x0
	.quad	0x0
.LLST140:
	.quad	.LVL244-.Ltext0
	.quad	.LVL245-.Ltext0
	.value	0x25
	.byte	0x3
	.quad	logfile
	.byte	0x6
	.byte	0x94
	.byte	0x1
	.byte	0x8
	.byte	0x38
	.byte	0x24
	.byte	0x8
	.byte	0x38
	.byte	0x25
	.byte	0x3
	.quad	.LC95
	.byte	0x94
	.byte	0x1
	.byte	0x8
	.byte	0x38
	.byte	0x24
	.byte	0x8
	.byte	0x38
	.byte	0x25
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL306-.Ltext0
	.quad	.LVL308-.Ltext0
	.value	0x1d
	.byte	0x70
	.sleb128 1
	.byte	0x94
	.byte	0x1
	.byte	0x8
	.byte	0x38
	.byte	0x24
	.byte	0x8
	.byte	0x38
	.byte	0x25
	.byte	0x3
	.quad	.LC95+1
	.byte	0x94
	.byte	0x1
	.byte	0x8
	.byte	0x38
	.byte	0x24
	.byte	0x8
	.byte	0x38
	.byte	0x25
	.byte	0x1c
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST141:
	.quad	.LVL251-.Ltext0
	.quad	.LVL252-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL252-1-.Ltext0
	.quad	.LVL253-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL369-.Ltext0
	.quad	.LVL370-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL370-.Ltext0
	.quad	.LVL371-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	0x0
	.quad	0x0
.LLST142:
	.quad	.LVL313-.Ltext0
	.quad	.LVL315-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL322-.Ltext0
	.quad	.LVL337-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL346-.Ltext0
	.quad	.LVL349-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL355-.Ltext0
	.quad	.LVL356-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL391-.Ltext0
	.quad	.LVL395-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	0x0
	.quad	0x0
.LLST143:
	.quad	.LVL313-.Ltext0
	.quad	.LVL315-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL322-.Ltext0
	.quad	.LVL337-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL346-.Ltext0
	.quad	.LVL349-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL355-.Ltext0
	.quad	.LVL356-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL391-.Ltext0
	.quad	.LVL395-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0x0
	.quad	0x0
.LLST144:
	.quad	.LVL324-.Ltext0
	.quad	.LVL325-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL346-.Ltext0
	.quad	.LVL347-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0x0
	.quad	0x0
.LLST145:
	.quad	.LVL313-.Ltext0
	.quad	.LVL314-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL325-.Ltext0
	.quad	.LVL327-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL348-.Ltext0
	.quad	.LVL349-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL391-.Ltext0
	.quad	.LVL393-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL394-.Ltext0
	.quad	.LVL395-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST146:
	.quad	.LVL334-.Ltext0
	.quad	.LVL335-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL335-.Ltext0
	.quad	.LVL336-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	0x0
	.quad	0x0
.LLST147:
	.quad	.LVL332-.Ltext0
	.quad	.LVL333-.Ltext0
	.value	0x9
	.byte	0x7d
	.sleb128 0
	.byte	0x6
	.byte	0x76
	.sleb128 80
	.byte	0x6
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL333-.Ltext0
	.quad	.LVL334-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	0x0
	.quad	0x0
.LLST148:
	.quad	.LVL313-.Ltext0
	.quad	.LVL315-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL323-.Ltext0
	.quad	.LVL325-1-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 8
	.quad	.LVL325-1-.Ltext0
	.quad	.LVL337-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL346-.Ltext0
	.quad	.LVL349-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL355-.Ltext0
	.quad	.LVL356-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL391-.Ltext0
	.quad	.LVL395-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	0x0
	.quad	0x0
.LLST149:
	.quad	.LVL328-.Ltext0
	.quad	.LVL329-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL330-.Ltext0
	.quad	.LVL331-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	0x0
	.quad	0x0
.LLST150:
	.quad	.LVL391-.Ltext0
	.quad	.LVL392-.Ltext0
	.value	0x6
	.byte	0x71
	.sleb128 0
	.byte	0x70
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL392-.Ltext0
	.quad	.LVL393-1-.Ltext0
	.value	0x9
	.byte	0x7c
	.sleb128 472
	.byte	0x94
	.byte	0x4
	.byte	0x70
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST151:
	.quad	.LVL267-.Ltext0
	.quad	.LVL281-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL339-.Ltext0
	.quad	.LVL341-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL380-.Ltext0
	.quad	.LVL381-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL388-.Ltext0
	.quad	.LVL389-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL404-.Ltext0
	.quad	.LVL405-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL406-.Ltext0
	.quad	.LVL411-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	0x0
	.quad	0x0
.LLST152:
	.quad	.LVL267-.Ltext0
	.quad	.LVL281-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL339-.Ltext0
	.quad	.LVL341-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL380-.Ltext0
	.quad	.LVL381-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL388-.Ltext0
	.quad	.LVL389-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL404-.Ltext0
	.quad	.LVL405-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL406-.Ltext0
	.quad	.LVL411-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0x0
	.quad	0x0
.LLST153:
	.quad	.LVL270-.Ltext0
	.quad	.LVL271-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL339-.Ltext0
	.quad	.LVL340-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0x0
	.quad	0x0
.LLST154:
	.quad	.LVL268-.Ltext0
	.quad	.LVL269-1-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 8
	.quad	.LVL269-1-.Ltext0
	.quad	.LVL281-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL339-.Ltext0
	.quad	.LVL341-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL380-.Ltext0
	.quad	.LVL381-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL388-.Ltext0
	.quad	.LVL389-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL404-.Ltext0
	.quad	.LVL405-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL406-.Ltext0
	.quad	.LVL411-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	0x0
	.quad	0x0
.LLST155:
	.quad	.LVL272-.Ltext0
	.quad	.LVL281-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL380-.Ltext0
	.quad	.LVL381-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL388-.Ltext0
	.quad	.LVL389-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL404-.Ltext0
	.quad	.LVL405-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL406-.Ltext0
	.quad	.LVL411-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0x0
	.quad	0x0
.LLST156:
	.quad	.LVL273-.Ltext0
	.quad	.LVL274-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL279-.Ltext0
	.quad	.LVL280-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	0x0
	.quad	0x0
.LLST157:
	.quad	.LVL275-.Ltext0
	.quad	.LVL276-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL277-.Ltext0
	.quad	.LVL278-.Ltext0
	.value	0x7
	.byte	0x74
	.sleb128 0
	.byte	0x7f
	.sleb128 0
	.byte	0x22
	.byte	0x23
	.uleb128 0x10
	.quad	0x0
	.quad	0x0
.LLST158:
	.quad	.LVL407-.Ltext0
	.quad	.LVL408-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL408-.Ltext0
	.quad	.LVL409-.Ltext0
	.value	0x3
	.byte	0x70
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL409-.Ltext0
	.quad	.LVL410-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0x0
	.quad	0x0
.LLST159:
	.quad	.LVL337-.Ltext0
	.quad	.LVL339-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL361-.Ltext0
	.quad	.LVL363-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	0x0
	.quad	0x0
.LLST160:
	.quad	.LVL337-.Ltext0
	.quad	.LVL339-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL361-.Ltext0
	.quad	.LVL363-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0x0
	.quad	0x0
.LLST161:
	.quad	.LVL338-.Ltext0
	.quad	.LVL339-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL361-.Ltext0
	.quad	.LVL362-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0x0
	.quad	0x0
.LLST162:
	.quad	.LVL375-.Ltext0
	.quad	.LVL376-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL376-1-.Ltext0
	.quad	.LVL378-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL382-.Ltext0
	.quad	.LVL384-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0x0
	.quad	0x0
.LLST163:
	.quad	.LVL376-.Ltext0
	.quad	.LVL377-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL382-.Ltext0
	.quad	.LVL383-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0x0
	.quad	0x0
.LLST164:
	.quad	.LVL343-.Ltext0
	.quad	.LVL345-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	.LVL373-.Ltext0
	.quad	.LVL378-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	.LVL382-.Ltext0
	.quad	.LVL384-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST165:
	.quad	.LVL343-.Ltext0
	.quad	.LVL345-.Ltext0
	.value	0x9
	.byte	0x3
	.quad	logfile
	.quad	.LVL373-.Ltext0
	.quad	.LVL374-1-.Ltext0
	.value	0x9
	.byte	0x3
	.quad	logfile
	.quad	0x0
	.quad	0x0
.LLST166:
	.quad	.LVL351-.Ltext0
	.quad	.LVL353-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	.LVL372-.Ltext0
	.quad	.LVL373-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	.LVL402-.Ltext0
	.quad	.LVL403-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST167:
	.quad	.LVL351-.Ltext0
	.quad	.LVL353-.Ltext0
	.value	0x9
	.byte	0x3
	.quad	logfile
	.quad	.LVL372-.Ltext0
	.quad	.LVL373-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL402-.Ltext0
	.quad	.LVL403-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	0x0
	.quad	0x0
.LLST168:
	.quad	.LVL351-.Ltext0
	.quad	.LVL352-.Ltext0
	.value	0x25
	.byte	0x3
	.quad	logfile
	.byte	0x6
	.byte	0x94
	.byte	0x1
	.byte	0x8
	.byte	0x38
	.byte	0x24
	.byte	0x8
	.byte	0x38
	.byte	0x25
	.byte	0x3
	.quad	.LC95
	.byte	0x94
	.byte	0x1
	.byte	0x8
	.byte	0x38
	.byte	0x24
	.byte	0x8
	.byte	0x38
	.byte	0x25
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL352-.Ltext0
	.quad	.LVL353-.Ltext0
	.value	0x27
	.byte	0x3
	.quad	logfile
	.byte	0x6
	.byte	0x23
	.uleb128 0x1
	.byte	0x94
	.byte	0x1
	.byte	0x8
	.byte	0x38
	.byte	0x24
	.byte	0x8
	.byte	0x38
	.byte	0x25
	.byte	0x3
	.quad	.LC95+1
	.byte	0x94
	.byte	0x1
	.byte	0x8
	.byte	0x38
	.byte	0x24
	.byte	0x8
	.byte	0x38
	.byte	0x25
	.byte	0x1c
	.byte	0x9f
	.quad	0x0
	.quad	0x0
	.file 3 "/usr/include/bits/types.h"
	.file 4 "/usr/include/sys/types.h"
	.file 5 "/usr/include/time.h"
	.file 6 "/usr/lib/gcc/x86_64-redhat-linux/4.4.7/include/stddef.h"
	.file 7 "/usr/include/bits/time.h"
	.file 8 "/usr/include/bits/stat.h"
	.file 9 "/usr/include/signal.h"
	.file 10 "/usr/include/bits/uio.h"
	.file 11 "/usr/include/pwd.h"
	.file 12 "/usr/include/stdio.h"
	.file 13 "/usr/include/libio.h"
	.file 14 "/usr/include/unistd.h"
	.file 15 "/usr/include/sys/time.h"
	.file 16 "/usr/include/bits/sockaddr.h"
	.file 17 "/usr/include/bits/socket.h"
	.file 18 "/usr/include/stdint.h"
	.file 19 "/usr/include/netinet/in.h"
	.file 20 "/usr/include/netdb.h"
	.file 21 "./libhttpd.h"
	.file 22 "./timers.h"
	.file 23 "/usr/include/bits/string2.h"
	.file 24 "/usr/include/sys/socket.h"
	.section	.debug_info
	.long	0x31f1
	.value	0x3
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF403
	.byte	0x1
	.long	.LASF404
	.long	.LASF405
	.quad	.Ltext0
	.quad	.Letext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF0
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF1
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF2
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF3
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF4
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.long	.LASF5
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF6
	.uleb128 0x4
	.long	.LASF7
	.byte	0x3
	.byte	0x86
	.long	0x42
	.uleb128 0x4
	.long	.LASF8
	.byte	0x3
	.byte	0x87
	.long	0x3b
	.uleb128 0x4
	.long	.LASF9
	.byte	0x3
	.byte	0x88
	.long	0x3b
	.uleb128 0x4
	.long	.LASF10
	.byte	0x3
	.byte	0x89
	.long	0x42
	.uleb128 0x4
	.long	.LASF11
	.byte	0x3
	.byte	0x8b
	.long	0x3b
	.uleb128 0x4
	.long	.LASF12
	.byte	0x3
	.byte	0x8c
	.long	0x42
	.uleb128 0x4
	.long	.LASF13
	.byte	0x3
	.byte	0x8d
	.long	0x5e
	.uleb128 0x4
	.long	.LASF14
	.byte	0x3
	.byte	0x8e
	.long	0x5e
	.uleb128 0x4
	.long	.LASF15
	.byte	0x3
	.byte	0x8f
	.long	0x57
	.uleb128 0x4
	.long	.LASF16
	.byte	0x3
	.byte	0x95
	.long	0x5e
	.uleb128 0x4
	.long	.LASF17
	.byte	0x3
	.byte	0x97
	.long	0x5e
	.uleb128 0x5
	.byte	0x8
	.uleb128 0x4
	.long	.LASF18
	.byte	0x3
	.byte	0xa4
	.long	0x5e
	.uleb128 0x4
	.long	.LASF19
	.byte	0x3
	.byte	0xa9
	.long	0x5e
	.uleb128 0x6
	.byte	0x8
	.long	0xfc
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF20
	.uleb128 0x4
	.long	.LASF21
	.byte	0x3
	.byte	0xc0
	.long	0x3b
	.uleb128 0x4
	.long	.LASF22
	.byte	0x4
	.byte	0x42
	.long	0x7b
	.uleb128 0x4
	.long	.LASF23
	.byte	0x4
	.byte	0x51
	.long	0x70
	.uleb128 0x4
	.long	.LASF24
	.byte	0x4
	.byte	0x57
	.long	0xa7
	.uleb128 0x4
	.long	.LASF25
	.byte	0x4
	.byte	0x63
	.long	0xbd
	.uleb128 0x4
	.long	.LASF26
	.byte	0x5
	.byte	0x4c
	.long	0xc8
	.uleb128 0x4
	.long	.LASF27
	.byte	0x6
	.byte	0xd3
	.long	0x42
	.uleb128 0x4
	.long	.LASF28
	.byte	0x4
	.byte	0xc6
	.long	0x5e
	.uleb128 0x7
	.long	.LASF31
	.byte	0x10
	.byte	0x5
	.byte	0x79
	.long	0x180
	.uleb128 0x8
	.long	.LASF29
	.byte	0x5
	.byte	0x7a
	.long	0xc8
	.sleb128 0
	.uleb128 0x8
	.long	.LASF30
	.byte	0x5
	.byte	0x7b
	.long	0x5e
	.sleb128 8
	.byte	0x0
	.uleb128 0x7
	.long	.LASF32
	.byte	0x10
	.byte	0x7
	.byte	0x4c
	.long	0x1a5
	.uleb128 0x8
	.long	.LASF29
	.byte	0x7
	.byte	0x4d
	.long	0xc8
	.sleb128 0
	.uleb128 0x8
	.long	.LASF33
	.byte	0x7
	.byte	0x4e
	.long	0xd3
	.sleb128 8
	.byte	0x0
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF34
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF35
	.uleb128 0x9
	.long	0x57
	.uleb128 0x7
	.long	.LASF36
	.byte	0x90
	.byte	0x8
	.byte	0x2f
	.long	0x27e
	.uleb128 0x8
	.long	.LASF37
	.byte	0x8
	.byte	0x30
	.long	0x65
	.sleb128 0
	.uleb128 0x8
	.long	.LASF38
	.byte	0x8
	.byte	0x35
	.long	0x86
	.sleb128 8
	.uleb128 0x8
	.long	.LASF39
	.byte	0x8
	.byte	0x3d
	.long	0x9c
	.sleb128 16
	.uleb128 0x8
	.long	.LASF40
	.byte	0x8
	.byte	0x3e
	.long	0x91
	.sleb128 24
	.uleb128 0x8
	.long	.LASF41
	.byte	0x8
	.byte	0x40
	.long	0x70
	.sleb128 28
	.uleb128 0x8
	.long	.LASF42
	.byte	0x8
	.byte	0x41
	.long	0x7b
	.sleb128 32
	.uleb128 0x8
	.long	.LASF43
	.byte	0x8
	.byte	0x43
	.long	0x57
	.sleb128 36
	.uleb128 0x8
	.long	.LASF44
	.byte	0x8
	.byte	0x45
	.long	0x65
	.sleb128 40
	.uleb128 0x8
	.long	.LASF45
	.byte	0x8
	.byte	0x4a
	.long	0xa7
	.sleb128 48
	.uleb128 0x8
	.long	.LASF46
	.byte	0x8
	.byte	0x4e
	.long	0xe0
	.sleb128 56
	.uleb128 0x8
	.long	.LASF47
	.byte	0x8
	.byte	0x50
	.long	0xeb
	.sleb128 64
	.uleb128 0x8
	.long	.LASF48
	.byte	0x8
	.byte	0x5b
	.long	0x15b
	.sleb128 72
	.uleb128 0x8
	.long	.LASF49
	.byte	0x8
	.byte	0x5c
	.long	0x15b
	.sleb128 88
	.uleb128 0x8
	.long	.LASF50
	.byte	0x8
	.byte	0x5d
	.long	0x15b
	.sleb128 104
	.uleb128 0x8
	.long	.LASF51
	.byte	0x8
	.byte	0x6a
	.long	0x27e
	.sleb128 120
	.byte	0x0
	.uleb128 0xa
	.long	0x5e
	.long	0x28e
	.uleb128 0xb
	.long	0x42
	.byte	0x2
	.byte	0x0
	.uleb128 0x4
	.long	.LASF52
	.byte	0x9
	.byte	0x54
	.long	0x299
	.uleb128 0x6
	.byte	0x8
	.long	0x29f
	.uleb128 0xc
	.byte	0x1
	.long	0x2ab
	.uleb128 0xd
	.long	0x57
	.byte	0x0
	.uleb128 0x6
	.byte	0x8
	.long	0x57
	.uleb128 0x7
	.long	.LASF53
	.byte	0x10
	.byte	0xa
	.byte	0x2d
	.long	0x2d6
	.uleb128 0x8
	.long	.LASF54
	.byte	0xa
	.byte	0x2e
	.long	0xde
	.sleb128 0
	.uleb128 0x8
	.long	.LASF55
	.byte	0xa
	.byte	0x2f
	.long	0x145
	.sleb128 8
	.byte	0x0
	.uleb128 0x7
	.long	.LASF56
	.byte	0x30
	.byte	0xb
	.byte	0x33
	.long	0x337
	.uleb128 0x8
	.long	.LASF57
	.byte	0xb
	.byte	0x34
	.long	0xf6
	.sleb128 0
	.uleb128 0x8
	.long	.LASF58
	.byte	0xb
	.byte	0x35
	.long	0xf6
	.sleb128 8
	.uleb128 0x8
	.long	.LASF59
	.byte	0xb
	.byte	0x36
	.long	0x70
	.sleb128 16
	.uleb128 0x8
	.long	.LASF60
	.byte	0xb
	.byte	0x37
	.long	0x7b
	.sleb128 20
	.uleb128 0x8
	.long	.LASF61
	.byte	0xb
	.byte	0x38
	.long	0xf6
	.sleb128 24
	.uleb128 0x8
	.long	.LASF62
	.byte	0xb
	.byte	0x39
	.long	0xf6
	.sleb128 32
	.uleb128 0x8
	.long	.LASF63
	.byte	0xb
	.byte	0x3a
	.long	0xf6
	.sleb128 40
	.byte	0x0
	.uleb128 0x4
	.long	.LASF64
	.byte	0xc
	.byte	0x31
	.long	0x342
	.uleb128 0xe
	.long	.LASF65
	.byte	0xd8
	.byte	0xd
	.value	0x10f
	.long	0x4de
	.uleb128 0xf
	.long	.LASF66
	.byte	0xd
	.value	0x110
	.long	0x57
	.sleb128 0
	.uleb128 0xf
	.long	.LASF67
	.byte	0xd
	.value	0x115
	.long	0xf6
	.sleb128 8
	.uleb128 0xf
	.long	.LASF68
	.byte	0xd
	.value	0x116
	.long	0xf6
	.sleb128 16
	.uleb128 0xf
	.long	.LASF69
	.byte	0xd
	.value	0x117
	.long	0xf6
	.sleb128 24
	.uleb128 0xf
	.long	.LASF70
	.byte	0xd
	.value	0x118
	.long	0xf6
	.sleb128 32
	.uleb128 0xf
	.long	.LASF71
	.byte	0xd
	.value	0x119
	.long	0xf6
	.sleb128 40
	.uleb128 0xf
	.long	.LASF72
	.byte	0xd
	.value	0x11a
	.long	0xf6
	.sleb128 48
	.uleb128 0xf
	.long	.LASF73
	.byte	0xd
	.value	0x11b
	.long	0xf6
	.sleb128 56
	.uleb128 0xf
	.long	.LASF74
	.byte	0xd
	.value	0x11c
	.long	0xf6
	.sleb128 64
	.uleb128 0xf
	.long	.LASF75
	.byte	0xd
	.value	0x11e
	.long	0xf6
	.sleb128 72
	.uleb128 0xf
	.long	.LASF76
	.byte	0xd
	.value	0x11f
	.long	0xf6
	.sleb128 80
	.uleb128 0xf
	.long	.LASF77
	.byte	0xd
	.value	0x120
	.long	0xf6
	.sleb128 88
	.uleb128 0xf
	.long	.LASF78
	.byte	0xd
	.value	0x122
	.long	0x51c
	.sleb128 96
	.uleb128 0xf
	.long	.LASF79
	.byte	0xd
	.value	0x124
	.long	0x522
	.sleb128 104
	.uleb128 0xf
	.long	.LASF80
	.byte	0xd
	.value	0x126
	.long	0x57
	.sleb128 112
	.uleb128 0xf
	.long	.LASF81
	.byte	0xd
	.value	0x12a
	.long	0x57
	.sleb128 116
	.uleb128 0xf
	.long	.LASF82
	.byte	0xd
	.value	0x12c
	.long	0xa7
	.sleb128 120
	.uleb128 0xf
	.long	.LASF83
	.byte	0xd
	.value	0x130
	.long	0x34
	.sleb128 128
	.uleb128 0xf
	.long	.LASF84
	.byte	0xd
	.value	0x131
	.long	0x49
	.sleb128 130
	.uleb128 0xf
	.long	.LASF85
	.byte	0xd
	.value	0x132
	.long	0x528
	.sleb128 131
	.uleb128 0xf
	.long	.LASF86
	.byte	0xd
	.value	0x136
	.long	0x538
	.sleb128 136
	.uleb128 0xf
	.long	.LASF87
	.byte	0xd
	.value	0x13f
	.long	0xb2
	.sleb128 144
	.uleb128 0xf
	.long	.LASF88
	.byte	0xd
	.value	0x148
	.long	0xde
	.sleb128 152
	.uleb128 0xf
	.long	.LASF89
	.byte	0xd
	.value	0x149
	.long	0xde
	.sleb128 160
	.uleb128 0xf
	.long	.LASF90
	.byte	0xd
	.value	0x14a
	.long	0xde
	.sleb128 168
	.uleb128 0xf
	.long	.LASF91
	.byte	0xd
	.value	0x14b
	.long	0xde
	.sleb128 176
	.uleb128 0xf
	.long	.LASF92
	.byte	0xd
	.value	0x14c
	.long	0x145
	.sleb128 184
	.uleb128 0xf
	.long	.LASF93
	.byte	0xd
	.value	0x14e
	.long	0x57
	.sleb128 192
	.uleb128 0xf
	.long	.LASF94
	.byte	0xd
	.value	0x150
	.long	0x53e
	.sleb128 196
	.byte	0x0
	.uleb128 0x6
	.byte	0x8
	.long	0xf6
	.uleb128 0x10
	.long	.LASF406
	.byte	0xd
	.byte	0xb4
	.uleb128 0x7
	.long	.LASF95
	.byte	0x18
	.byte	0xd
	.byte	0xba
	.long	0x51c
	.uleb128 0x8
	.long	.LASF96
	.byte	0xd
	.byte	0xbb
	.long	0x51c
	.sleb128 0
	.uleb128 0x8
	.long	.LASF97
	.byte	0xd
	.byte	0xbc
	.long	0x522
	.sleb128 8
	.uleb128 0x8
	.long	.LASF98
	.byte	0xd
	.byte	0xc0
	.long	0x57
	.sleb128 16
	.byte	0x0
	.uleb128 0x6
	.byte	0x8
	.long	0x4eb
	.uleb128 0x6
	.byte	0x8
	.long	0x342
	.uleb128 0xa
	.long	0xfc
	.long	0x538
	.uleb128 0xb
	.long	0x42
	.byte	0x0
	.byte	0x0
	.uleb128 0x6
	.byte	0x8
	.long	0x4e4
	.uleb128 0xa
	.long	0xfc
	.long	0x54e
	.uleb128 0xb
	.long	0x42
	.byte	0x13
	.byte	0x0
	.uleb128 0x6
	.byte	0x8
	.long	0x554
	.uleb128 0x11
	.long	0xfc
	.uleb128 0x11
	.long	0x57
	.uleb128 0x12
	.long	.LASF99
	.byte	0xe
	.value	0x113
	.long	0x103
	.uleb128 0x7
	.long	.LASF100
	.byte	0x8
	.byte	0xf
	.byte	0x3a
	.long	0x58f
	.uleb128 0x8
	.long	.LASF101
	.byte	0xf
	.byte	0x3b
	.long	0x57
	.sleb128 0
	.uleb128 0x8
	.long	.LASF102
	.byte	0xf
	.byte	0x3c
	.long	0x57
	.sleb128 4
	.byte	0x0
	.uleb128 0x13
	.long	.LASF407
	.byte	0x4
	.byte	0x11
	.byte	0x29
	.long	0x5d5
	.uleb128 0x14
	.long	.LASF103
	.sleb128 1
	.uleb128 0x14
	.long	.LASF104
	.sleb128 2
	.uleb128 0x14
	.long	.LASF105
	.sleb128 3
	.uleb128 0x14
	.long	.LASF106
	.sleb128 4
	.uleb128 0x14
	.long	.LASF107
	.sleb128 5
	.uleb128 0x14
	.long	.LASF108
	.sleb128 6
	.uleb128 0x14
	.long	.LASF109
	.sleb128 10
	.uleb128 0x14
	.long	.LASF110
	.sleb128 524288
	.uleb128 0x14
	.long	.LASF111
	.sleb128 2048
	.byte	0x0
	.uleb128 0x4
	.long	.LASF112
	.byte	0x10
	.byte	0x1d
	.long	0x34
	.uleb128 0x7
	.long	.LASF113
	.byte	0x10
	.byte	0x11
	.byte	0xaf
	.long	0x605
	.uleb128 0x8
	.long	.LASF114
	.byte	0x11
	.byte	0xb0
	.long	0x5d5
	.sleb128 0
	.uleb128 0x8
	.long	.LASF115
	.byte	0x11
	.byte	0xb1
	.long	0x605
	.sleb128 2
	.byte	0x0
	.uleb128 0xa
	.long	0xfc
	.long	0x615
	.uleb128 0xb
	.long	0x42
	.byte	0xd
	.byte	0x0
	.uleb128 0x7
	.long	.LASF116
	.byte	0x80
	.byte	0x11
	.byte	0xbc
	.long	0x646
	.uleb128 0x8
	.long	.LASF117
	.byte	0x11
	.byte	0xbd
	.long	0x5d5
	.sleb128 0
	.uleb128 0x8
	.long	.LASF118
	.byte	0x11
	.byte	0xbe
	.long	0x42
	.sleb128 8
	.uleb128 0x8
	.long	.LASF119
	.byte	0x11
	.byte	0xbf
	.long	0x646
	.sleb128 16
	.byte	0x0
	.uleb128 0xa
	.long	0xfc
	.long	0x656
	.uleb128 0xb
	.long	0x42
	.byte	0x6f
	.byte	0x0
	.uleb128 0x15
	.byte	0x4
	.byte	0x18
	.byte	0x37
	.long	0x671
	.uleb128 0x14
	.long	.LASF120
	.sleb128 0
	.uleb128 0x14
	.long	.LASF121
	.sleb128 1
	.uleb128 0x14
	.long	.LASF122
	.sleb128 2
	.byte	0x0
	.uleb128 0x4
	.long	.LASF123
	.byte	0x12
	.byte	0x31
	.long	0x2d
	.uleb128 0x4
	.long	.LASF124
	.byte	0x12
	.byte	0x32
	.long	0x34
	.uleb128 0x4
	.long	.LASF125
	.byte	0x12
	.byte	0x34
	.long	0x3b
	.uleb128 0x4
	.long	.LASF126
	.byte	0x13
	.byte	0x61
	.long	0x67c
	.uleb128 0x4
	.long	.LASF127
	.byte	0x13
	.byte	0x8d
	.long	0x687
	.uleb128 0x7
	.long	.LASF128
	.byte	0x4
	.byte	0x13
	.byte	0x8f
	.long	0x6c1
	.uleb128 0x8
	.long	.LASF129
	.byte	0x13
	.byte	0x90
	.long	0x69d
	.sleb128 0
	.byte	0x0
	.uleb128 0x16
	.byte	0x10
	.byte	0x13
	.byte	0xc9
	.long	0x6eb
	.uleb128 0x17
	.long	.LASF130
	.byte	0x13
	.byte	0xca
	.long	0x6eb
	.uleb128 0x17
	.long	.LASF131
	.byte	0x13
	.byte	0xcc
	.long	0x6fb
	.uleb128 0x17
	.long	.LASF132
	.byte	0x13
	.byte	0xcd
	.long	0x70b
	.byte	0x0
	.uleb128 0xa
	.long	0x671
	.long	0x6fb
	.uleb128 0xb
	.long	0x42
	.byte	0xf
	.byte	0x0
	.uleb128 0xa
	.long	0x67c
	.long	0x70b
	.uleb128 0xb
	.long	0x42
	.byte	0x7
	.byte	0x0
	.uleb128 0xa
	.long	0x687
	.long	0x71b
	.uleb128 0xb
	.long	0x42
	.byte	0x3
	.byte	0x0
	.uleb128 0x7
	.long	.LASF133
	.byte	0x10
	.byte	0x13
	.byte	0xc7
	.long	0x734
	.uleb128 0x8
	.long	.LASF134
	.byte	0x13
	.byte	0xcf
	.long	0x6c1
	.sleb128 0
	.byte	0x0
	.uleb128 0x7
	.long	.LASF135
	.byte	0x10
	.byte	0x13
	.byte	0xe2
	.long	0x771
	.uleb128 0x8
	.long	.LASF136
	.byte	0x13
	.byte	0xe3
	.long	0x5d5
	.sleb128 0
	.uleb128 0x8
	.long	.LASF137
	.byte	0x13
	.byte	0xe4
	.long	0x692
	.sleb128 2
	.uleb128 0x8
	.long	.LASF138
	.byte	0x13
	.byte	0xe5
	.long	0x6a8
	.sleb128 4
	.uleb128 0x8
	.long	.LASF139
	.byte	0x13
	.byte	0xe8
	.long	0x771
	.sleb128 8
	.byte	0x0
	.uleb128 0xa
	.long	0x2d
	.long	0x781
	.uleb128 0xb
	.long	0x42
	.byte	0x7
	.byte	0x0
	.uleb128 0x7
	.long	.LASF140
	.byte	0x1c
	.byte	0x13
	.byte	0xf0
	.long	0x7ca
	.uleb128 0x8
	.long	.LASF141
	.byte	0x13
	.byte	0xf1
	.long	0x5d5
	.sleb128 0
	.uleb128 0x8
	.long	.LASF142
	.byte	0x13
	.byte	0xf2
	.long	0x692
	.sleb128 2
	.uleb128 0x8
	.long	.LASF143
	.byte	0x13
	.byte	0xf3
	.long	0x687
	.sleb128 4
	.uleb128 0x8
	.long	.LASF144
	.byte	0x13
	.byte	0xf4
	.long	0x71b
	.sleb128 8
	.uleb128 0x8
	.long	.LASF145
	.byte	0x13
	.byte	0xf5
	.long	0x687
	.sleb128 24
	.byte	0x0
	.uleb128 0xe
	.long	.LASF146
	.byte	0x30
	.byte	0x14
	.value	0x23a
	.long	0x840
	.uleb128 0xf
	.long	.LASF147
	.byte	0x14
	.value	0x23b
	.long	0x57
	.sleb128 0
	.uleb128 0xf
	.long	.LASF148
	.byte	0x14
	.value	0x23c
	.long	0x57
	.sleb128 4
	.uleb128 0xf
	.long	.LASF149
	.byte	0x14
	.value	0x23d
	.long	0x57
	.sleb128 8
	.uleb128 0xf
	.long	.LASF150
	.byte	0x14
	.value	0x23e
	.long	0x57
	.sleb128 12
	.uleb128 0xf
	.long	.LASF151
	.byte	0x14
	.value	0x23f
	.long	0x55e
	.sleb128 16
	.uleb128 0xf
	.long	.LASF152
	.byte	0x14
	.value	0x240
	.long	0x840
	.sleb128 24
	.uleb128 0xf
	.long	.LASF153
	.byte	0x14
	.value	0x241
	.long	0xf6
	.sleb128 32
	.uleb128 0xf
	.long	.LASF154
	.byte	0x14
	.value	0x242
	.long	0x846
	.sleb128 40
	.byte	0x0
	.uleb128 0x6
	.byte	0x8
	.long	0x5e0
	.uleb128 0x6
	.byte	0x8
	.long	0x7ca
	.uleb128 0x16
	.byte	0x80
	.byte	0x15
	.byte	0x3b
	.long	0x880
	.uleb128 0x18
	.string	"sa"
	.byte	0x15
	.byte	0x3c
	.long	0x5e0
	.uleb128 0x17
	.long	.LASF155
	.byte	0x15
	.byte	0x3d
	.long	0x734
	.uleb128 0x17
	.long	.LASF156
	.byte	0x15
	.byte	0x3f
	.long	0x781
	.uleb128 0x17
	.long	.LASF157
	.byte	0x15
	.byte	0x40
	.long	0x615
	.byte	0x0
	.uleb128 0x4
	.long	.LASF158
	.byte	0x15
	.byte	0x42
	.long	0x84c
	.uleb128 0x19
	.byte	0x88
	.byte	0x15
	.byte	0x45
	.long	0x98f
	.uleb128 0x8
	.long	.LASF159
	.byte	0x15
	.byte	0x46
	.long	0xf6
	.sleb128 0
	.uleb128 0x8
	.long	.LASF160
	.byte	0x15
	.byte	0x47
	.long	0xf6
	.sleb128 8
	.uleb128 0x8
	.long	.LASF161
	.byte	0x15
	.byte	0x48
	.long	0x34
	.sleb128 16
	.uleb128 0x8
	.long	.LASF162
	.byte	0x15
	.byte	0x49
	.long	0xf6
	.sleb128 24
	.uleb128 0x8
	.long	.LASF163
	.byte	0x15
	.byte	0x4a
	.long	0x57
	.sleb128 32
	.uleb128 0x8
	.long	.LASF164
	.byte	0x15
	.byte	0x4a
	.long	0x57
	.sleb128 36
	.uleb128 0x8
	.long	.LASF165
	.byte	0x15
	.byte	0x4b
	.long	0xf6
	.sleb128 40
	.uleb128 0x1a
	.string	"p3p"
	.byte	0x15
	.byte	0x4c
	.long	0xf6
	.sleb128 48
	.uleb128 0x8
	.long	.LASF166
	.byte	0x15
	.byte	0x4d
	.long	0x57
	.sleb128 56
	.uleb128 0x1a
	.string	"cwd"
	.byte	0x15
	.byte	0x4e
	.long	0xf6
	.sleb128 64
	.uleb128 0x8
	.long	.LASF167
	.byte	0x15
	.byte	0x4f
	.long	0x57
	.sleb128 72
	.uleb128 0x8
	.long	.LASF168
	.byte	0x15
	.byte	0x4f
	.long	0x57
	.sleb128 76
	.uleb128 0x8
	.long	.LASF169
	.byte	0x15
	.byte	0x50
	.long	0x57
	.sleb128 80
	.uleb128 0x8
	.long	.LASF170
	.byte	0x15
	.byte	0x51
	.long	0x98f
	.sleb128 88
	.uleb128 0x8
	.long	.LASF171
	.byte	0x15
	.byte	0x52
	.long	0x57
	.sleb128 96
	.uleb128 0x8
	.long	.LASF172
	.byte	0x15
	.byte	0x53
	.long	0x57
	.sleb128 100
	.uleb128 0x8
	.long	.LASF173
	.byte	0x15
	.byte	0x54
	.long	0x57
	.sleb128 104
	.uleb128 0x8
	.long	.LASF174
	.byte	0x15
	.byte	0x55
	.long	0xf6
	.sleb128 112
	.uleb128 0x8
	.long	.LASF175
	.byte	0x15
	.byte	0x56
	.long	0xf6
	.sleb128 120
	.uleb128 0x8
	.long	.LASF176
	.byte	0x15
	.byte	0x57
	.long	0x57
	.sleb128 128
	.byte	0x0
	.uleb128 0x6
	.byte	0x8
	.long	0x337
	.uleb128 0x4
	.long	.LASF177
	.byte	0x15
	.byte	0x58
	.long	0x88b
	.uleb128 0x1b
	.value	0x2d0
	.byte	0x15
	.byte	0x5b
	.long	0xccb
	.uleb128 0x8
	.long	.LASF178
	.byte	0x15
	.byte	0x5c
	.long	0x57
	.sleb128 0
	.uleb128 0x1a
	.string	"hs"
	.byte	0x15
	.byte	0x5d
	.long	0xccb
	.sleb128 8
	.uleb128 0x8
	.long	.LASF179
	.byte	0x15
	.byte	0x5e
	.long	0x880
	.sleb128 16
	.uleb128 0x8
	.long	.LASF180
	.byte	0x15
	.byte	0x5f
	.long	0xf6
	.sleb128 144
	.uleb128 0x8
	.long	.LASF181
	.byte	0x15
	.byte	0x60
	.long	0x145
	.sleb128 152
	.uleb128 0x8
	.long	.LASF182
	.byte	0x15
	.byte	0x60
	.long	0x145
	.sleb128 160
	.uleb128 0x8
	.long	.LASF183
	.byte	0x15
	.byte	0x60
	.long	0x145
	.sleb128 168
	.uleb128 0x8
	.long	.LASF184
	.byte	0x15
	.byte	0x61
	.long	0x57
	.sleb128 176
	.uleb128 0x8
	.long	.LASF185
	.byte	0x15
	.byte	0x62
	.long	0x57
	.sleb128 180
	.uleb128 0x8
	.long	.LASF186
	.byte	0x15
	.byte	0x63
	.long	0x57
	.sleb128 184
	.uleb128 0x8
	.long	.LASF187
	.byte	0x15
	.byte	0x64
	.long	0x124
	.sleb128 192
	.uleb128 0x8
	.long	.LASF188
	.byte	0x15
	.byte	0x65
	.long	0x124
	.sleb128 200
	.uleb128 0x8
	.long	.LASF189
	.byte	0x15
	.byte	0x66
	.long	0xf6
	.sleb128 208
	.uleb128 0x8
	.long	.LASF190
	.byte	0x15
	.byte	0x67
	.long	0xf6
	.sleb128 216
	.uleb128 0x8
	.long	.LASF191
	.byte	0x15
	.byte	0x68
	.long	0xf6
	.sleb128 224
	.uleb128 0x8
	.long	.LASF192
	.byte	0x15
	.byte	0x69
	.long	0xf6
	.sleb128 232
	.uleb128 0x8
	.long	.LASF193
	.byte	0x15
	.byte	0x6a
	.long	0xf6
	.sleb128 240
	.uleb128 0x8
	.long	.LASF194
	.byte	0x15
	.byte	0x6b
	.long	0xf6
	.sleb128 248
	.uleb128 0x8
	.long	.LASF195
	.byte	0x15
	.byte	0x6c
	.long	0xf6
	.sleb128 256
	.uleb128 0x8
	.long	.LASF196
	.byte	0x15
	.byte	0x6d
	.long	0xf6
	.sleb128 264
	.uleb128 0x8
	.long	.LASF197
	.byte	0x15
	.byte	0x6e
	.long	0xf6
	.sleb128 272
	.uleb128 0x8
	.long	.LASF198
	.byte	0x15
	.byte	0x6f
	.long	0xf6
	.sleb128 280
	.uleb128 0x8
	.long	.LASF199
	.byte	0x15
	.byte	0x70
	.long	0xf6
	.sleb128 288
	.uleb128 0x8
	.long	.LASF200
	.byte	0x15
	.byte	0x71
	.long	0xf6
	.sleb128 296
	.uleb128 0x8
	.long	.LASF201
	.byte	0x15
	.byte	0x72
	.long	0xf6
	.sleb128 304
	.uleb128 0x8
	.long	.LASF202
	.byte	0x15
	.byte	0x73
	.long	0xf6
	.sleb128 312
	.uleb128 0x8
	.long	.LASF203
	.byte	0x15
	.byte	0x74
	.long	0xf6
	.sleb128 320
	.uleb128 0x8
	.long	.LASF204
	.byte	0x15
	.byte	0x75
	.long	0xf6
	.sleb128 328
	.uleb128 0x8
	.long	.LASF205
	.byte	0x15
	.byte	0x76
	.long	0xf6
	.sleb128 336
	.uleb128 0x8
	.long	.LASF206
	.byte	0x15
	.byte	0x77
	.long	0xf6
	.sleb128 344
	.uleb128 0x8
	.long	.LASF207
	.byte	0x15
	.byte	0x78
	.long	0xf6
	.sleb128 352
	.uleb128 0x8
	.long	.LASF208
	.byte	0x15
	.byte	0x79
	.long	0xf6
	.sleb128 360
	.uleb128 0x8
	.long	.LASF209
	.byte	0x15
	.byte	0x7a
	.long	0xf6
	.sleb128 368
	.uleb128 0x8
	.long	.LASF210
	.byte	0x15
	.byte	0x7b
	.long	0x145
	.sleb128 376
	.uleb128 0x8
	.long	.LASF211
	.byte	0x15
	.byte	0x7b
	.long	0x145
	.sleb128 384
	.uleb128 0x8
	.long	.LASF212
	.byte	0x15
	.byte	0x7b
	.long	0x145
	.sleb128 392
	.uleb128 0x8
	.long	.LASF213
	.byte	0x15
	.byte	0x7b
	.long	0x145
	.sleb128 400
	.uleb128 0x8
	.long	.LASF214
	.byte	0x15
	.byte	0x7c
	.long	0x145
	.sleb128 408
	.uleb128 0x8
	.long	.LASF215
	.byte	0x15
	.byte	0x7c
	.long	0x145
	.sleb128 416
	.uleb128 0x8
	.long	.LASF216
	.byte	0x15
	.byte	0x7c
	.long	0x145
	.sleb128 424
	.uleb128 0x8
	.long	.LASF217
	.byte	0x15
	.byte	0x7c
	.long	0x145
	.sleb128 432
	.uleb128 0x8
	.long	.LASF218
	.byte	0x15
	.byte	0x7c
	.long	0x145
	.sleb128 440
	.uleb128 0x8
	.long	.LASF219
	.byte	0x15
	.byte	0x7c
	.long	0x145
	.sleb128 448
	.uleb128 0x8
	.long	.LASF220
	.byte	0x15
	.byte	0x7d
	.long	0x145
	.sleb128 456
	.uleb128 0x8
	.long	.LASF221
	.byte	0x15
	.byte	0x7d
	.long	0x145
	.sleb128 464
	.uleb128 0x8
	.long	.LASF222
	.byte	0x15
	.byte	0x82
	.long	0x145
	.sleb128 472
	.uleb128 0x8
	.long	.LASF223
	.byte	0x15
	.byte	0x83
	.long	0x13a
	.sleb128 480
	.uleb128 0x8
	.long	.LASF224
	.byte	0x15
	.byte	0x83
	.long	0x13a
	.sleb128 488
	.uleb128 0x8
	.long	.LASF225
	.byte	0x15
	.byte	0x84
	.long	0x145
	.sleb128 496
	.uleb128 0x8
	.long	.LASF226
	.byte	0x15
	.byte	0x85
	.long	0xf6
	.sleb128 504
	.uleb128 0x8
	.long	.LASF227
	.byte	0x15
	.byte	0x86
	.long	0xf6
	.sleb128 512
	.uleb128 0x8
	.long	.LASF228
	.byte	0x15
	.byte	0x87
	.long	0x57
	.sleb128 520
	.uleb128 0x8
	.long	.LASF229
	.byte	0x15
	.byte	0x88
	.long	0x57
	.sleb128 524
	.uleb128 0x8
	.long	.LASF230
	.byte	0x15
	.byte	0x89
	.long	0x57
	.sleb128 528
	.uleb128 0x8
	.long	.LASF231
	.byte	0x15
	.byte	0x8a
	.long	0x57
	.sleb128 532
	.uleb128 0x8
	.long	.LASF232
	.byte	0x15
	.byte	0x8b
	.long	0x124
	.sleb128 536
	.uleb128 0x8
	.long	.LASF233
	.byte	0x15
	.byte	0x8b
	.long	0x124
	.sleb128 544
	.uleb128 0x8
	.long	.LASF234
	.byte	0x15
	.byte	0x8c
	.long	0x57
	.sleb128 552
	.uleb128 0x8
	.long	.LASF235
	.byte	0x15
	.byte	0x8d
	.long	0x57
	.sleb128 556
	.uleb128 0x1a
	.string	"sb"
	.byte	0x15
	.byte	0x8e
	.long	0x1b8
	.sleb128 560
	.uleb128 0x8
	.long	.LASF236
	.byte	0x15
	.byte	0x8f
	.long	0x57
	.sleb128 704
	.uleb128 0x8
	.long	.LASF237
	.byte	0x15
	.byte	0x90
	.long	0xf6
	.sleb128 712
	.byte	0x0
	.uleb128 0x6
	.byte	0x8
	.long	0x995
	.uleb128 0x4
	.long	.LASF238
	.byte	0x15
	.byte	0x91
	.long	0x9a0
	.uleb128 0x16
	.byte	0x8
	.byte	0x16
	.byte	0x2a
	.long	0xd00
	.uleb128 0x18
	.string	"p"
	.byte	0x16
	.byte	0x2b
	.long	0xde
	.uleb128 0x18
	.string	"i"
	.byte	0x16
	.byte	0x2c
	.long	0x57
	.uleb128 0x18
	.string	"l"
	.byte	0x16
	.byte	0x2d
	.long	0x5e
	.byte	0x0
	.uleb128 0x4
	.long	.LASF239
	.byte	0x16
	.byte	0x2e
	.long	0xcdc
	.uleb128 0x4
	.long	.LASF240
	.byte	0x16
	.byte	0x36
	.long	0xd16
	.uleb128 0xc
	.byte	0x1
	.long	0xd27
	.uleb128 0xd
	.long	0xd00
	.uleb128 0xd
	.long	0xd27
	.byte	0x0
	.uleb128 0x6
	.byte	0x8
	.long	0x180
	.uleb128 0x7
	.long	.LASF241
	.byte	0x48
	.byte	0x16
	.byte	0x39
	.long	0xd9b
	.uleb128 0x8
	.long	.LASF242
	.byte	0x16
	.byte	0x3a
	.long	0xd9b
	.sleb128 0
	.uleb128 0x8
	.long	.LASF243
	.byte	0x16
	.byte	0x3b
	.long	0xd00
	.sleb128 8
	.uleb128 0x8
	.long	.LASF244
	.byte	0x16
	.byte	0x3c
	.long	0x5e
	.sleb128 16
	.uleb128 0x8
	.long	.LASF245
	.byte	0x16
	.byte	0x3d
	.long	0x57
	.sleb128 24
	.uleb128 0x8
	.long	.LASF246
	.byte	0x16
	.byte	0x3e
	.long	0x180
	.sleb128 32
	.uleb128 0x8
	.long	.LASF247
	.byte	0x16
	.byte	0x3f
	.long	0xda1
	.sleb128 48
	.uleb128 0x8
	.long	.LASF248
	.byte	0x16
	.byte	0x40
	.long	0xda1
	.sleb128 56
	.uleb128 0x8
	.long	.LASF249
	.byte	0x16
	.byte	0x41
	.long	0x57
	.sleb128 64
	.byte	0x0
	.uleb128 0x6
	.byte	0x8
	.long	0xd0b
	.uleb128 0x6
	.byte	0x8
	.long	0xd2d
	.uleb128 0x4
	.long	.LASF250
	.byte	0x16
	.byte	0x42
	.long	0xd2d
	.uleb128 0x19
	.byte	0x30
	.byte	0x1
	.byte	0x58
	.long	0xe03
	.uleb128 0x8
	.long	.LASF251
	.byte	0x1
	.byte	0x59
	.long	0xf6
	.sleb128 0
	.uleb128 0x8
	.long	.LASF252
	.byte	0x1
	.byte	0x5a
	.long	0x5e
	.sleb128 8
	.uleb128 0x8
	.long	.LASF253
	.byte	0x1
	.byte	0x5a
	.long	0x5e
	.sleb128 16
	.uleb128 0x8
	.long	.LASF254
	.byte	0x1
	.byte	0x5b
	.long	0x5e
	.sleb128 24
	.uleb128 0x8
	.long	.LASF255
	.byte	0x1
	.byte	0x5c
	.long	0x124
	.sleb128 32
	.uleb128 0x8
	.long	.LASF256
	.byte	0x1
	.byte	0x5d
	.long	0x57
	.sleb128 40
	.byte	0x0
	.uleb128 0x4
	.long	.LASF257
	.byte	0x1
	.byte	0x5e
	.long	0xdb2
	.uleb128 0x19
	.byte	0x90
	.byte	0x1
	.byte	0x65
	.long	0xed4
	.uleb128 0x8
	.long	.LASF258
	.byte	0x1
	.byte	0x66
	.long	0x57
	.sleb128 0
	.uleb128 0x8
	.long	.LASF259
	.byte	0x1
	.byte	0x67
	.long	0x57
	.sleb128 4
	.uleb128 0x1a
	.string	"hc"
	.byte	0x1
	.byte	0x68
	.long	0xed4
	.sleb128 8
	.uleb128 0x8
	.long	.LASF260
	.byte	0x1
	.byte	0x69
	.long	0xeda
	.sleb128 16
	.uleb128 0x8
	.long	.LASF261
	.byte	0x1
	.byte	0x6a
	.long	0x57
	.sleb128 56
	.uleb128 0x8
	.long	.LASF252
	.byte	0x1
	.byte	0x6b
	.long	0x5e
	.sleb128 64
	.uleb128 0x8
	.long	.LASF253
	.byte	0x1
	.byte	0x6b
	.long	0x5e
	.sleb128 72
	.uleb128 0x8
	.long	.LASF262
	.byte	0x1
	.byte	0x6c
	.long	0x13a
	.sleb128 80
	.uleb128 0x8
	.long	.LASF263
	.byte	0x1
	.byte	0x6c
	.long	0x13a
	.sleb128 88
	.uleb128 0x8
	.long	.LASF264
	.byte	0x1
	.byte	0x6d
	.long	0xeea
	.sleb128 96
	.uleb128 0x8
	.long	.LASF265
	.byte	0x1
	.byte	0x6e
	.long	0xeea
	.sleb128 104
	.uleb128 0x8
	.long	.LASF266
	.byte	0x1
	.byte	0x6f
	.long	0x5e
	.sleb128 112
	.uleb128 0x8
	.long	.LASF267
	.byte	0x1
	.byte	0x70
	.long	0x124
	.sleb128 120
	.uleb128 0x8
	.long	.LASF268
	.byte	0x1
	.byte	0x71
	.long	0x124
	.sleb128 128
	.uleb128 0x8
	.long	.LASF269
	.byte	0x1
	.byte	0x72
	.long	0x124
	.sleb128 136
	.byte	0x0
	.uleb128 0x6
	.byte	0x8
	.long	0xcd1
	.uleb128 0xa
	.long	0x57
	.long	0xeea
	.uleb128 0xb
	.long	0x42
	.byte	0x9
	.byte	0x0
	.uleb128 0x6
	.byte	0x8
	.long	0xda7
	.uleb128 0x4
	.long	.LASF270
	.byte	0x1
	.byte	0x73
	.long	0xe0e
	.uleb128 0x1c
	.byte	0x1
	.long	.LASF272
	.byte	0x17
	.value	0x417
	.byte	0x1
	.long	0x145
	.byte	0x3
	.long	0xf33
	.uleb128 0x1d
	.string	"__s"
	.byte	0x17
	.value	0x417
	.long	0x54e
	.uleb128 0x1e
	.long	.LASF271
	.byte	0x17
	.value	0x417
	.long	0x57
	.uleb128 0x1f
	.long	.LASF276
	.byte	0x17
	.value	0x419
	.long	0x145
	.byte	0x0
	.uleb128 0x1c
	.byte	0x1
	.long	.LASF273
	.byte	0x17
	.value	0x423
	.byte	0x1
	.long	0x145
	.byte	0x3
	.long	0xf77
	.uleb128 0x1d
	.string	"__s"
	.byte	0x17
	.value	0x423
	.long	0x54e
	.uleb128 0x1e
	.long	.LASF274
	.byte	0x17
	.value	0x423
	.long	0x57
	.uleb128 0x1e
	.long	.LASF275
	.byte	0x17
	.value	0x423
	.long	0x57
	.uleb128 0x1f
	.long	.LASF276
	.byte	0x17
	.value	0x425
	.long	0x145
	.byte	0x0
	.uleb128 0x1c
	.byte	0x1
	.long	.LASF277
	.byte	0x17
	.value	0x42f
	.byte	0x1
	.long	0x145
	.byte	0x3
	.long	0xfc7
	.uleb128 0x1d
	.string	"__s"
	.byte	0x17
	.value	0x42f
	.long	0x54e
	.uleb128 0x1e
	.long	.LASF274
	.byte	0x17
	.value	0x42f
	.long	0x57
	.uleb128 0x1e
	.long	.LASF275
	.byte	0x17
	.value	0x42f
	.long	0x57
	.uleb128 0x1e
	.long	.LASF278
	.byte	0x17
	.value	0x42f
	.long	0x57
	.uleb128 0x1f
	.long	.LASF276
	.byte	0x17
	.value	0x431
	.long	0x145
	.byte	0x0
	.uleb128 0x1c
	.byte	0x1
	.long	.LASF279
	.byte	0x17
	.value	0x3cb
	.byte	0x1
	.long	0x145
	.byte	0x3
	.long	0xfff
	.uleb128 0x1d
	.string	"__s"
	.byte	0x17
	.value	0x3cb
	.long	0x54e
	.uleb128 0x1e
	.long	.LASF280
	.byte	0x17
	.value	0x3cb
	.long	0x57
	.uleb128 0x1f
	.long	.LASF276
	.byte	0x17
	.value	0x3cd
	.long	0x145
	.byte	0x0
	.uleb128 0x1c
	.byte	0x1
	.long	.LASF281
	.byte	0x17
	.value	0x3d6
	.byte	0x1
	.long	0x145
	.byte	0x3
	.long	0x1043
	.uleb128 0x1d
	.string	"__s"
	.byte	0x17
	.value	0x3d6
	.long	0x54e
	.uleb128 0x1e
	.long	.LASF282
	.byte	0x17
	.value	0x3d6
	.long	0x57
	.uleb128 0x1e
	.long	.LASF283
	.byte	0x17
	.value	0x3d6
	.long	0x57
	.uleb128 0x1f
	.long	.LASF276
	.byte	0x17
	.value	0x3d8
	.long	0x145
	.byte	0x0
	.uleb128 0x1c
	.byte	0x1
	.long	.LASF284
	.byte	0x17
	.value	0x3e2
	.byte	0x1
	.long	0x145
	.byte	0x3
	.long	0x1093
	.uleb128 0x1d
	.string	"__s"
	.byte	0x17
	.value	0x3e2
	.long	0x54e
	.uleb128 0x1e
	.long	.LASF282
	.byte	0x17
	.value	0x3e2
	.long	0x57
	.uleb128 0x1e
	.long	.LASF283
	.byte	0x17
	.value	0x3e2
	.long	0x57
	.uleb128 0x1e
	.long	.LASF285
	.byte	0x17
	.value	0x3e3
	.long	0x57
	.uleb128 0x1f
	.long	.LASF276
	.byte	0x17
	.value	0x3e5
	.long	0x145
	.byte	0x0
	.uleb128 0x1c
	.byte	0x1
	.long	.LASF286
	.byte	0x2
	.value	0x11c
	.byte	0x1
	.long	0x57
	.byte	0x3
	.long	0x10b3
	.uleb128 0x1e
	.long	.LASF287
	.byte	0x2
	.value	0x11c
	.long	0x54e
	.byte	0x0
	.uleb128 0x20
	.long	.LASF289
	.byte	0x1
	.value	0x782
	.byte	0x1
	.byte	0x1
	.long	0x10e4
	.uleb128 0x1d
	.string	"c"
	.byte	0x1
	.value	0x782
	.long	0x10e4
	.uleb128 0x1d
	.string	"tvP"
	.byte	0x1
	.value	0x782
	.long	0xd27
	.uleb128 0x1f
	.long	.LASF288
	.byte	0x1
	.value	0x784
	.long	0x57
	.byte	0x0
	.uleb128 0x6
	.byte	0x8
	.long	0xef0
	.uleb128 0x20
	.long	.LASF290
	.byte	0x1
	.value	0x882
	.byte	0x1
	.byte	0x1
	.long	0x1105
	.uleb128 0x1e
	.long	.LASF291
	.byte	0x1
	.value	0x882
	.long	0x5e
	.byte	0x0
	.uleb128 0x20
	.long	.LASF292
	.byte	0x1
	.value	0x749
	.byte	0x1
	.byte	0x1
	.long	0x1140
	.uleb128 0x1d
	.string	"c"
	.byte	0x1
	.value	0x749
	.long	0x10e4
	.uleb128 0x1d
	.string	"tvP"
	.byte	0x1
	.value	0x749
	.long	0xd27
	.uleb128 0x21
	.string	"buf"
	.byte	0x1
	.value	0x74b
	.long	0x1140
	.uleb128 0x21
	.string	"r"
	.byte	0x1
	.value	0x74c
	.long	0x57
	.byte	0x0
	.uleb128 0xa
	.long	0xfc
	.long	0x1151
	.uleb128 0x22
	.long	0x42
	.value	0xfff
	.byte	0x0
	.uleb128 0x20
	.long	.LASF293
	.byte	0x1
	.value	0x4d3
	.byte	0x1
	.byte	0x1
	.long	0x11fb
	.uleb128 0x1e
	.long	.LASF294
	.byte	0x1
	.value	0x4d3
	.long	0x11fb
	.uleb128 0x1e
	.long	.LASF295
	.byte	0x1
	.value	0x4d3
	.long	0x145
	.uleb128 0x1e
	.long	.LASF296
	.byte	0x1
	.value	0x4d3
	.long	0x2ab
	.uleb128 0x1e
	.long	.LASF297
	.byte	0x1
	.value	0x4d3
	.long	0x11fb
	.uleb128 0x1e
	.long	.LASF298
	.byte	0x1
	.value	0x4d3
	.long	0x145
	.uleb128 0x1e
	.long	.LASF299
	.byte	0x1
	.value	0x4d3
	.long	0x2ab
	.uleb128 0x1f
	.long	.LASF300
	.byte	0x1
	.value	0x4d7
	.long	0x7ca
	.uleb128 0x1f
	.long	.LASF301
	.byte	0x1
	.value	0x4d8
	.long	0x1201
	.uleb128 0x1f
	.long	.LASF302
	.byte	0x1
	.value	0x4d9
	.long	0x57
	.uleb128 0x21
	.string	"ai"
	.byte	0x1
	.value	0x4da
	.long	0x846
	.uleb128 0x21
	.string	"ai2"
	.byte	0x1
	.value	0x4db
	.long	0x846
	.uleb128 0x1f
	.long	.LASF303
	.byte	0x1
	.value	0x4dc
	.long	0x846
	.uleb128 0x1f
	.long	.LASF304
	.byte	0x1
	.value	0x4dd
	.long	0x846
	.byte	0x0
	.uleb128 0x6
	.byte	0x8
	.long	0x880
	.uleb128 0xa
	.long	0xfc
	.long	0x1211
	.uleb128 0xb
	.long	0x42
	.byte	0x9
	.byte	0x0
	.uleb128 0x23
	.long	.LASF308
	.byte	0x1
	.value	0x78c
	.byte	0x1
	.quad	.LFB63
	.quad	.LFE63
	.byte	0x1
	.byte	0x9c
	.long	0x129d
	.uleb128 0x24
	.long	.LASF243
	.byte	0x1
	.value	0x78c
	.long	0xd00
	.long	.LLST0
	.uleb128 0x24
	.long	.LASF305
	.byte	0x1
	.value	0x78c
	.long	0xd27
	.long	.LLST1
	.uleb128 0x25
	.long	.LASF306
	.byte	0x1
	.value	0x78e
	.long	0x57
	.long	.LLST2
	.uleb128 0x25
	.long	.LASF288
	.byte	0x1
	.value	0x78e
	.long	0x57
	.long	.LLST3
	.uleb128 0x25
	.long	.LASF307
	.byte	0x1
	.value	0x78f
	.long	0x57
	.long	.LLST4
	.uleb128 0x26
	.string	"c"
	.byte	0x1
	.value	0x790
	.long	0x10e4
	.long	.LLST5
	.uleb128 0x26
	.string	"l"
	.byte	0x1
	.value	0x791
	.long	0x5e
	.long	.LLST6
	.byte	0x0
	.uleb128 0x23
	.long	.LASF309
	.byte	0x1
	.value	0x4b6
	.byte	0x1
	.quad	.LFB52
	.quad	.LFE52
	.byte	0x1
	.byte	0x9c
	.long	0x12dd
	.uleb128 0x24
	.long	.LASF310
	.byte	0x1
	.value	0x4b6
	.long	0xf6
	.long	.LLST7
	.uleb128 0x24
	.long	.LASF311
	.byte	0x1
	.value	0x4b6
	.long	0xf6
	.long	.LLST8
	.byte	0x0
	.uleb128 0x23
	.long	.LASF312
	.byte	0x1
	.value	0x4aa
	.byte	0x1
	.quad	.LFB51
	.quad	.LFE51
	.byte	0x1
	.byte	0x9c
	.long	0x131d
	.uleb128 0x24
	.long	.LASF310
	.byte	0x1
	.value	0x4aa
	.long	0xf6
	.long	.LLST9
	.uleb128 0x24
	.long	.LASF311
	.byte	0x1
	.value	0x4aa
	.long	0xf6
	.long	.LLST10
	.byte	0x0
	.uleb128 0x27
	.long	.LASF408
	.byte	0x1
	.value	0x3dd
	.byte	0x1
	.quad	.LFB49
	.quad	.LFE49
	.byte	0x1
	.byte	0x9c
	.uleb128 0x23
	.long	.LASF313
	.byte	0x1
	.value	0x838
	.byte	0x1
	.quad	.LFB68
	.quad	.LFE68
	.byte	0x1
	.byte	0x9c
	.long	0x1386
	.uleb128 0x24
	.long	.LASF243
	.byte	0x1
	.value	0x838
	.long	0xd00
	.long	.LLST11
	.uleb128 0x24
	.long	.LASF305
	.byte	0x1
	.value	0x838
	.long	0xd27
	.long	.LLST12
	.uleb128 0x26
	.string	"c"
	.byte	0x1
	.value	0x83a
	.long	0x10e4
	.long	.LLST13
	.byte	0x0
	.uleb128 0x28
	.long	.LASF314
	.byte	0x1
	.byte	0xed
	.byte	0x1
	.quad	.LFB42
	.quad	.LFE42
	.byte	0x1
	.byte	0x9c
	.long	0x13c2
	.uleb128 0x29
	.string	"sig"
	.byte	0x1
	.byte	0xed
	.long	0x57
	.long	.LLST14
	.uleb128 0x2a
	.long	.LASF315
	.byte	0x1
	.byte	0xef
	.long	0x559
	.byte	0x2
	.byte	0x70
	.sleb128 0
	.byte	0x0
	.uleb128 0x2b
	.long	.LASF327
	.byte	0x1
	.value	0x4c3
	.byte	0x1
	.long	0xf6
	.quad	.LFB53
	.quad	.LFE53
	.byte	0x1
	.byte	0x9c
	.long	0x1406
	.uleb128 0x24
	.long	.LASF316
	.byte	0x1
	.value	0x4c3
	.long	0xf6
	.long	.LLST15
	.uleb128 0x25
	.long	.LASF317
	.byte	0x1
	.value	0x4c5
	.long	0xf6
	.long	.LLST16
	.byte	0x0
	.uleb128 0x23
	.long	.LASF318
	.byte	0x1
	.value	0x3e7
	.byte	0x1
	.quad	.LFB50
	.quad	.LFE50
	.byte	0x1
	.byte	0x9c
	.long	0x15d5
	.uleb128 0x24
	.long	.LASF319
	.byte	0x1
	.value	0x3e7
	.long	0xf6
	.long	.LLST17
	.uleb128 0x26
	.string	"fp"
	.byte	0x1
	.value	0x3e9
	.long	0x98f
	.long	.LLST18
	.uleb128 0x2c
	.long	.LASF320
	.byte	0x1
	.value	0x3ea
	.long	0x15d5
	.byte	0x4
	.byte	0x91
	.sleb128 -10064
	.uleb128 0x26
	.string	"cp"
	.byte	0x1
	.value	0x3eb
	.long	0xf6
	.long	.LLST19
	.uleb128 0x26
	.string	"cp2"
	.byte	0x1
	.value	0x3ec
	.long	0xf6
	.long	.LLST20
	.uleb128 0x25
	.long	.LASF310
	.byte	0x1
	.value	0x3ed
	.long	0xf6
	.long	.LLST21
	.uleb128 0x25
	.long	.LASF311
	.byte	0x1
	.value	0x3ee
	.long	0xf6
	.long	.LLST22
	.uleb128 0x2d
	.quad	.LBB92
	.quad	.LBE92
	.long	0x14da
	.uleb128 0x25
	.long	.LASF321
	.byte	0x1
	.value	0x3ff
	.long	0xfc
	.long	.LLST23
	.uleb128 0x25
	.long	.LASF322
	.byte	0x1
	.value	0x3ff
	.long	0xfc
	.long	.LLST24
	.uleb128 0x25
	.long	.LASF323
	.byte	0x1
	.value	0x3ff
	.long	0xfc
	.long	.LLST25
	.byte	0x0
	.uleb128 0x2d
	.quad	.LBB93
	.quad	.LBE93
	.long	0x1520
	.uleb128 0x25
	.long	.LASF324
	.byte	0x1
	.value	0x405
	.long	0xfc
	.long	.LLST26
	.uleb128 0x25
	.long	.LASF325
	.byte	0x1
	.value	0x405
	.long	0xfc
	.long	.LLST27
	.uleb128 0x25
	.long	.LASF326
	.byte	0x1
	.value	0x405
	.long	0xfc
	.long	.LLST28
	.byte	0x0
	.uleb128 0x2e
	.long	0x1093
	.quad	.LBB94
	.quad	.LBE94
	.byte	0x1
	.value	0x496
	.long	0x1546
	.uleb128 0x2f
	.long	0x10a6
	.long	.LLST29
	.byte	0x0
	.uleb128 0x2d
	.quad	.LBB96
	.quad	.LBE96
	.long	0x158c
	.uleb128 0x25
	.long	.LASF321
	.byte	0x1
	.value	0x4a1
	.long	0xfc
	.long	.LLST30
	.uleb128 0x25
	.long	.LASF322
	.byte	0x1
	.value	0x4a1
	.long	0xfc
	.long	.LLST31
	.uleb128 0x25
	.long	.LASF323
	.byte	0x1
	.value	0x4a1
	.long	0xfc
	.long	.LLST32
	.byte	0x0
	.uleb128 0x2e
	.long	0x1093
	.quad	.LBB97
	.quad	.LBE97
	.byte	0x1
	.value	0x417
	.long	0x15b2
	.uleb128 0x2f
	.long	0x10a6
	.long	.LLST33
	.byte	0x0
	.uleb128 0x30
	.long	0x1093
	.quad	.LBB99
	.quad	.LBE99
	.byte	0x1
	.value	0x450
	.uleb128 0x2f
	.long	0x10a6
	.long	.LLST34
	.byte	0x0
	.byte	0x0
	.uleb128 0xa
	.long	0xfc
	.long	0x15e6
	.uleb128 0x22
	.long	0x42
	.value	0x270f
	.byte	0x0
	.uleb128 0x2b
	.long	.LASF328
	.byte	0x1
	.value	0x5e0
	.byte	0x1
	.long	0x57
	.quad	.LFB57
	.quad	.LFE57
	.byte	0x1
	.byte	0x9c
	.long	0x1644
	.uleb128 0x31
	.string	"tvP"
	.byte	0x1
	.value	0x5e0
	.long	0xd27
	.long	.LLST35
	.uleb128 0x24
	.long	.LASF329
	.byte	0x1
	.value	0x5e0
	.long	0x57
	.long	.LLST36
	.uleb128 0x26
	.string	"c"
	.byte	0x1
	.value	0x5e2
	.long	0x10e4
	.long	.LLST37
	.uleb128 0x1f
	.long	.LASF243
	.byte	0x1
	.value	0x5e3
	.long	0xd00
	.byte	0x0
	.uleb128 0x23
	.long	.LASF330
	.byte	0x1
	.value	0x7ff
	.byte	0x1
	.quad	.LFB66
	.quad	.LFE66
	.byte	0x1
	.byte	0x9c
	.long	0x16c4
	.uleb128 0x31
	.string	"c"
	.byte	0x1
	.value	0x7ff
	.long	0x10e4
	.long	.LLST38
	.uleb128 0x31
	.string	"tvP"
	.byte	0x1
	.value	0x7ff
	.long	0xd27
	.long	.LLST39
	.uleb128 0x30
	.long	0x10b3
	.quad	.LBB101
	.quad	.LBE101
	.byte	0x1
	.value	0x805
	.uleb128 0x32
	.long	0x10cb
	.uleb128 0x2f
	.long	0x10c1
	.long	.LLST40
	.uleb128 0x33
	.quad	.LBB102
	.quad	.LBE102
	.uleb128 0x34
	.long	0x10d7
	.long	.LLST41
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x23
	.long	.LASF331
	.byte	0x1
	.value	0x7cb
	.byte	0x1
	.quad	.LFB65
	.quad	.LFE65
	.byte	0x1
	.byte	0x9c
	.long	0x170e
	.uleb128 0x31
	.string	"c"
	.byte	0x1
	.value	0x7cb
	.long	0x10e4
	.long	.LLST42
	.uleb128 0x31
	.string	"tvP"
	.byte	0x1
	.value	0x7cb
	.long	0xd27
	.long	.LLST43
	.uleb128 0x1f
	.long	.LASF243
	.byte	0x1
	.value	0x7cd
	.long	0xd00
	.byte	0x0
	.uleb128 0x23
	.long	.LASF332
	.byte	0x1
	.value	0x846
	.byte	0x1
	.quad	.LFB69
	.quad	.LFE69
	.byte	0x1
	.byte	0x9c
	.long	0x1756
	.uleb128 0x35
	.long	.LASF243
	.byte	0x1
	.value	0x846
	.long	0xd00
	.byte	0x1
	.byte	0x55
	.uleb128 0x35
	.long	.LASF305
	.byte	0x1
	.value	0x846
	.long	0xd27
	.byte	0x1
	.byte	0x54
	.uleb128 0x36
	.string	"c"
	.byte	0x1
	.value	0x848
	.long	0x10e4
	.byte	0x1
	.byte	0x55
	.byte	0x0
	.uleb128 0x23
	.long	.LASF333
	.byte	0x1
	.value	0x7c0
	.byte	0x1
	.quad	.LFB64
	.quad	.LFE64
	.byte	0x1
	.byte	0x9c
	.long	0x1794
	.uleb128 0x31
	.string	"c"
	.byte	0x1
	.value	0x7c0
	.long	0x10e4
	.long	.LLST44
	.uleb128 0x31
	.string	"tvP"
	.byte	0x1
	.value	0x7c0
	.long	0xd27
	.long	.LLST45
	.byte	0x0
	.uleb128 0x23
	.long	.LASF334
	.byte	0x1
	.value	0x864
	.byte	0x1
	.quad	.LFB72
	.quad	.LFE72
	.byte	0x1
	.byte	0x9c
	.long	0x1820
	.uleb128 0x24
	.long	.LASF305
	.byte	0x1
	.value	0x864
	.long	0xd27
	.long	.LLST46
	.uleb128 0x36
	.string	"tv"
	.byte	0x1
	.value	0x866
	.long	0x180
	.byte	0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x26
	.string	"now"
	.byte	0x1
	.value	0x867
	.long	0x13a
	.long	.LLST47
	.uleb128 0x25
	.long	.LASF335
	.byte	0x1
	.value	0x868
	.long	0x5e
	.long	.LLST48
	.uleb128 0x25
	.long	.LASF336
	.byte	0x1
	.value	0x868
	.long	0x5e
	.long	.LLST49
	.uleb128 0x37
	.long	0x10ea
	.quad	.LBB103
	.long	.Ldebug_ranges0+0x0
	.byte	0x1
	.value	0x878
	.uleb128 0x2f
	.long	0x10f8
	.long	.LLST50
	.byte	0x0
	.byte	0x0
	.uleb128 0x23
	.long	.LASF337
	.byte	0x1
	.value	0x5ba
	.byte	0x1
	.quad	.LFB56
	.quad	.LFE56
	.byte	0x1
	.byte	0x9c
	.long	0x1880
	.uleb128 0x25
	.long	.LASF307
	.byte	0x1
	.value	0x5bc
	.long	0x57
	.long	.LLST51
	.uleb128 0x36
	.string	"tv"
	.byte	0x1
	.value	0x5bd
	.long	0x180
	.byte	0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x33
	.quad	.LBB109
	.quad	.LBE109
	.uleb128 0x26
	.string	"ths"
	.byte	0x1
	.value	0x5cf
	.long	0xccb
	.long	.LLST52
	.byte	0x0
	.byte	0x0
	.uleb128 0x23
	.long	.LASF338
	.byte	0x1
	.value	0x100
	.byte	0x1
	.quad	.LFB43
	.quad	.LFE43
	.byte	0x1
	.byte	0x9c
	.long	0x18b0
	.uleb128 0x31
	.string	"sig"
	.byte	0x1
	.value	0x100
	.long	0x57
	.long	.LLST53
	.byte	0x0
	.uleb128 0x28
	.long	.LASF339
	.byte	0x1
	.byte	0xab
	.byte	0x1
	.quad	.LFB40
	.quad	.LFE40
	.byte	0x1
	.byte	0x9c
	.long	0x18de
	.uleb128 0x29
	.string	"sig"
	.byte	0x1
	.byte	0xab
	.long	0x57
	.long	.LLST54
	.byte	0x0
	.uleb128 0x23
	.long	.LASF340
	.byte	0x1
	.value	0x85b
	.byte	0x1
	.quad	.LFB71
	.quad	.LFE71
	.byte	0x1
	.byte	0x9c
	.long	0x191c
	.uleb128 0x24
	.long	.LASF243
	.byte	0x1
	.value	0x85b
	.long	0xd00
	.long	.LLST55
	.uleb128 0x35
	.long	.LASF305
	.byte	0x1
	.value	0x85b
	.long	0xd27
	.byte	0x1
	.byte	0x54
	.byte	0x0
	.uleb128 0x23
	.long	.LASF341
	.byte	0x1
	.value	0x119
	.byte	0x1
	.quad	.LFB44
	.quad	.LFE44
	.byte	0x1
	.byte	0x9c
	.long	0x195c
	.uleb128 0x31
	.string	"sig"
	.byte	0x1
	.value	0x119
	.long	0x57
	.long	.LLST56
	.uleb128 0x25
	.long	.LASF315
	.byte	0x1
	.value	0x11b
	.long	0x559
	.long	.LLST57
	.byte	0x0
	.uleb128 0x23
	.long	.LASF342
	.byte	0x1
	.value	0x813
	.byte	0x1
	.quad	.LFB67
	.quad	.LFE67
	.byte	0x1
	.byte	0x9c
	.long	0x19ba
	.uleb128 0x24
	.long	.LASF243
	.byte	0x1
	.value	0x813
	.long	0xd00
	.long	.LLST58
	.uleb128 0x24
	.long	.LASF305
	.byte	0x1
	.value	0x813
	.long	0xd27
	.long	.LLST59
	.uleb128 0x25
	.long	.LASF307
	.byte	0x1
	.value	0x815
	.long	0x57
	.long	.LLST60
	.uleb128 0x26
	.string	"c"
	.byte	0x1
	.value	0x816
	.long	0x10e4
	.long	.LLST61
	.byte	0x0
	.uleb128 0x23
	.long	.LASF343
	.byte	0x1
	.value	0x851
	.byte	0x1
	.quad	.LFB70
	.quad	.LFE70
	.byte	0x1
	.byte	0x9c
	.long	0x19fa
	.uleb128 0x24
	.long	.LASF243
	.byte	0x1
	.value	0x851
	.long	0xd00
	.long	.LLST62
	.uleb128 0x24
	.long	.LASF305
	.byte	0x1
	.value	0x851
	.long	0xd27
	.long	.LLST63
	.byte	0x0
	.uleb128 0x23
	.long	.LASF344
	.byte	0x1
	.value	0x12b
	.byte	0x1
	.quad	.LFB45
	.quad	.LFE45
	.byte	0x1
	.byte	0x9c
	.long	0x1a3a
	.uleb128 0x31
	.string	"sig"
	.byte	0x1
	.value	0x12b
	.long	0x57
	.long	.LLST64
	.uleb128 0x25
	.long	.LASF315
	.byte	0x1
	.value	0x12d
	.long	0x559
	.long	.LLST65
	.byte	0x0
	.uleb128 0x28
	.long	.LASF345
	.byte	0x1
	.byte	0xb8
	.byte	0x1
	.quad	.LFB41
	.quad	.LFE41
	.byte	0x1
	.byte	0x9c
	.long	0x1a94
	.uleb128 0x29
	.string	"sig"
	.byte	0x1
	.byte	0xb8
	.long	0x57
	.long	.LLST66
	.uleb128 0x38
	.long	.LASF315
	.byte	0x1
	.byte	0xba
	.long	0x559
	.long	.LLST67
	.uleb128 0x39
	.string	"pid"
	.byte	0x1
	.byte	0xbb
	.long	0x12f
	.long	.LLST68
	.uleb128 0x2a
	.long	.LASF186
	.byte	0x1
	.byte	0xbc
	.long	0x57
	.byte	0x2
	.byte	0x91
	.sleb128 -52
	.byte	0x0
	.uleb128 0x20
	.long	.LASF346
	.byte	0x1
	.value	0x344
	.byte	0x1
	.byte	0x1
	.long	0x1fcb
	.uleb128 0x1e
	.long	.LASF347
	.byte	0x1
	.value	0x344
	.long	0x57
	.uleb128 0x1e
	.long	.LASF348
	.byte	0x1
	.value	0x344
	.long	0x4de
	.uleb128 0x1f
	.long	.LASF349
	.byte	0x1
	.value	0x346
	.long	0x57
	.uleb128 0x3a
	.long	0x1afe
	.uleb128 0x1f
	.long	.LASF350
	.byte	0x1
	.value	0x375
	.long	0x145
	.uleb128 0x1f
	.long	.LASF351
	.byte	0x1
	.value	0x375
	.long	0x145
	.uleb128 0x3b
	.uleb128 0x1f
	.long	.LASF352
	.byte	0x1
	.value	0x375
	.long	0x1fcb
	.uleb128 0x1f
	.long	.LASF276
	.byte	0x1
	.value	0x375
	.long	0x57
	.byte	0x0
	.byte	0x0
	.uleb128 0x3a
	.long	0x1b36
	.uleb128 0x1f
	.long	.LASF350
	.byte	0x1
	.value	0x37a
	.long	0x145
	.uleb128 0x1f
	.long	.LASF351
	.byte	0x1
	.value	0x37a
	.long	0x145
	.uleb128 0x3b
	.uleb128 0x1f
	.long	.LASF352
	.byte	0x1
	.value	0x37a
	.long	0x1fcb
	.uleb128 0x1f
	.long	.LASF276
	.byte	0x1
	.value	0x37a
	.long	0x57
	.byte	0x0
	.byte	0x0
	.uleb128 0x3a
	.long	0x1b6e
	.uleb128 0x1f
	.long	.LASF350
	.byte	0x1
	.value	0x37f
	.long	0x145
	.uleb128 0x1f
	.long	.LASF351
	.byte	0x1
	.value	0x37f
	.long	0x145
	.uleb128 0x3b
	.uleb128 0x1f
	.long	.LASF352
	.byte	0x1
	.value	0x37f
	.long	0x1fcb
	.uleb128 0x1f
	.long	.LASF276
	.byte	0x1
	.value	0x37f
	.long	0x57
	.byte	0x0
	.byte	0x0
	.uleb128 0x3a
	.long	0x1ba6
	.uleb128 0x1f
	.long	.LASF350
	.byte	0x1
	.value	0x384
	.long	0x145
	.uleb128 0x1f
	.long	.LASF351
	.byte	0x1
	.value	0x384
	.long	0x145
	.uleb128 0x3b
	.uleb128 0x1f
	.long	.LASF352
	.byte	0x1
	.value	0x384
	.long	0x1fcb
	.uleb128 0x1f
	.long	.LASF276
	.byte	0x1
	.value	0x384
	.long	0x57
	.byte	0x0
	.byte	0x0
	.uleb128 0x3a
	.long	0x1bde
	.uleb128 0x1f
	.long	.LASF350
	.byte	0x1
	.value	0x389
	.long	0x145
	.uleb128 0x1f
	.long	.LASF351
	.byte	0x1
	.value	0x389
	.long	0x145
	.uleb128 0x3b
	.uleb128 0x1f
	.long	.LASF352
	.byte	0x1
	.value	0x389
	.long	0x1fcb
	.uleb128 0x1f
	.long	.LASF276
	.byte	0x1
	.value	0x389
	.long	0x57
	.byte	0x0
	.byte	0x0
	.uleb128 0x3a
	.long	0x1c16
	.uleb128 0x1f
	.long	.LASF350
	.byte	0x1
	.value	0x38e
	.long	0x145
	.uleb128 0x1f
	.long	.LASF351
	.byte	0x1
	.value	0x38e
	.long	0x145
	.uleb128 0x3b
	.uleb128 0x1f
	.long	.LASF352
	.byte	0x1
	.value	0x38e
	.long	0x1fcb
	.uleb128 0x1f
	.long	.LASF276
	.byte	0x1
	.value	0x38e
	.long	0x57
	.byte	0x0
	.byte	0x0
	.uleb128 0x3a
	.long	0x1c4e
	.uleb128 0x1f
	.long	.LASF350
	.byte	0x1
	.value	0x393
	.long	0x145
	.uleb128 0x1f
	.long	.LASF351
	.byte	0x1
	.value	0x393
	.long	0x145
	.uleb128 0x3b
	.uleb128 0x1f
	.long	.LASF352
	.byte	0x1
	.value	0x393
	.long	0x1fcb
	.uleb128 0x1f
	.long	.LASF276
	.byte	0x1
	.value	0x393
	.long	0x57
	.byte	0x0
	.byte	0x0
	.uleb128 0x3a
	.long	0x1c86
	.uleb128 0x1f
	.long	.LASF350
	.byte	0x1
	.value	0x398
	.long	0x145
	.uleb128 0x1f
	.long	.LASF351
	.byte	0x1
	.value	0x398
	.long	0x145
	.uleb128 0x3b
	.uleb128 0x1f
	.long	.LASF352
	.byte	0x1
	.value	0x398
	.long	0x1fcb
	.uleb128 0x1f
	.long	.LASF276
	.byte	0x1
	.value	0x398
	.long	0x57
	.byte	0x0
	.byte	0x0
	.uleb128 0x3a
	.long	0x1cbe
	.uleb128 0x1f
	.long	.LASF350
	.byte	0x1
	.value	0x39a
	.long	0x145
	.uleb128 0x1f
	.long	.LASF351
	.byte	0x1
	.value	0x39a
	.long	0x145
	.uleb128 0x3b
	.uleb128 0x1f
	.long	.LASF352
	.byte	0x1
	.value	0x39a
	.long	0x1fcb
	.uleb128 0x1f
	.long	.LASF276
	.byte	0x1
	.value	0x39a
	.long	0x57
	.byte	0x0
	.byte	0x0
	.uleb128 0x3a
	.long	0x1cf6
	.uleb128 0x1f
	.long	.LASF350
	.byte	0x1
	.value	0x39c
	.long	0x145
	.uleb128 0x1f
	.long	.LASF351
	.byte	0x1
	.value	0x39c
	.long	0x145
	.uleb128 0x3b
	.uleb128 0x1f
	.long	.LASF352
	.byte	0x1
	.value	0x39c
	.long	0x1fcb
	.uleb128 0x1f
	.long	.LASF276
	.byte	0x1
	.value	0x39c
	.long	0x57
	.byte	0x0
	.byte	0x0
	.uleb128 0x3a
	.long	0x1d2e
	.uleb128 0x1f
	.long	.LASF350
	.byte	0x1
	.value	0x3a1
	.long	0x145
	.uleb128 0x1f
	.long	.LASF351
	.byte	0x1
	.value	0x3a1
	.long	0x145
	.uleb128 0x3b
	.uleb128 0x1f
	.long	.LASF352
	.byte	0x1
	.value	0x3a1
	.long	0x1fcb
	.uleb128 0x1f
	.long	.LASF276
	.byte	0x1
	.value	0x3a1
	.long	0x57
	.byte	0x0
	.byte	0x0
	.uleb128 0x3a
	.long	0x1d66
	.uleb128 0x1f
	.long	.LASF350
	.byte	0x1
	.value	0x3a6
	.long	0x145
	.uleb128 0x1f
	.long	.LASF351
	.byte	0x1
	.value	0x3a6
	.long	0x145
	.uleb128 0x3b
	.uleb128 0x1f
	.long	.LASF352
	.byte	0x1
	.value	0x3a6
	.long	0x1fcb
	.uleb128 0x1f
	.long	.LASF276
	.byte	0x1
	.value	0x3a6
	.long	0x57
	.byte	0x0
	.byte	0x0
	.uleb128 0x3a
	.long	0x1d9e
	.uleb128 0x1f
	.long	.LASF350
	.byte	0x1
	.value	0x3ab
	.long	0x145
	.uleb128 0x1f
	.long	.LASF351
	.byte	0x1
	.value	0x3ab
	.long	0x145
	.uleb128 0x3b
	.uleb128 0x1f
	.long	.LASF352
	.byte	0x1
	.value	0x3ab
	.long	0x1fcb
	.uleb128 0x1f
	.long	.LASF276
	.byte	0x1
	.value	0x3ab
	.long	0x57
	.byte	0x0
	.byte	0x0
	.uleb128 0x3a
	.long	0x1dd6
	.uleb128 0x1f
	.long	.LASF350
	.byte	0x1
	.value	0x3b0
	.long	0x145
	.uleb128 0x1f
	.long	.LASF351
	.byte	0x1
	.value	0x3b0
	.long	0x145
	.uleb128 0x3b
	.uleb128 0x1f
	.long	.LASF352
	.byte	0x1
	.value	0x3b0
	.long	0x1fcb
	.uleb128 0x1f
	.long	.LASF276
	.byte	0x1
	.value	0x3b0
	.long	0x57
	.byte	0x0
	.byte	0x0
	.uleb128 0x3a
	.long	0x1e0e
	.uleb128 0x1f
	.long	.LASF350
	.byte	0x1
	.value	0x3b5
	.long	0x145
	.uleb128 0x1f
	.long	.LASF351
	.byte	0x1
	.value	0x3b5
	.long	0x145
	.uleb128 0x3b
	.uleb128 0x1f
	.long	.LASF352
	.byte	0x1
	.value	0x3b5
	.long	0x1fcb
	.uleb128 0x1f
	.long	.LASF276
	.byte	0x1
	.value	0x3b5
	.long	0x57
	.byte	0x0
	.byte	0x0
	.uleb128 0x3a
	.long	0x1e46
	.uleb128 0x1f
	.long	.LASF350
	.byte	0x1
	.value	0x3b7
	.long	0x145
	.uleb128 0x1f
	.long	.LASF351
	.byte	0x1
	.value	0x3b7
	.long	0x145
	.uleb128 0x3b
	.uleb128 0x1f
	.long	.LASF352
	.byte	0x1
	.value	0x3b7
	.long	0x1fcb
	.uleb128 0x1f
	.long	.LASF276
	.byte	0x1
	.value	0x3b7
	.long	0x57
	.byte	0x0
	.byte	0x0
	.uleb128 0x3a
	.long	0x1e7e
	.uleb128 0x1f
	.long	.LASF350
	.byte	0x1
	.value	0x3b9
	.long	0x145
	.uleb128 0x1f
	.long	.LASF351
	.byte	0x1
	.value	0x3b9
	.long	0x145
	.uleb128 0x3b
	.uleb128 0x1f
	.long	.LASF352
	.byte	0x1
	.value	0x3b9
	.long	0x1fcb
	.uleb128 0x1f
	.long	.LASF276
	.byte	0x1
	.value	0x3b9
	.long	0x57
	.byte	0x0
	.byte	0x0
	.uleb128 0x3a
	.long	0x1eb6
	.uleb128 0x1f
	.long	.LASF350
	.byte	0x1
	.value	0x3bb
	.long	0x145
	.uleb128 0x1f
	.long	.LASF351
	.byte	0x1
	.value	0x3bb
	.long	0x145
	.uleb128 0x3b
	.uleb128 0x1f
	.long	.LASF352
	.byte	0x1
	.value	0x3bb
	.long	0x1fcb
	.uleb128 0x1f
	.long	.LASF276
	.byte	0x1
	.value	0x3bb
	.long	0x57
	.byte	0x0
	.byte	0x0
	.uleb128 0x3a
	.long	0x1eee
	.uleb128 0x1f
	.long	.LASF350
	.byte	0x1
	.value	0x3bd
	.long	0x145
	.uleb128 0x1f
	.long	.LASF351
	.byte	0x1
	.value	0x3bd
	.long	0x145
	.uleb128 0x3b
	.uleb128 0x1f
	.long	.LASF352
	.byte	0x1
	.value	0x3bd
	.long	0x1fcb
	.uleb128 0x1f
	.long	.LASF276
	.byte	0x1
	.value	0x3bd
	.long	0x57
	.byte	0x0
	.byte	0x0
	.uleb128 0x3a
	.long	0x1f26
	.uleb128 0x1f
	.long	.LASF350
	.byte	0x1
	.value	0x3c2
	.long	0x145
	.uleb128 0x1f
	.long	.LASF351
	.byte	0x1
	.value	0x3c2
	.long	0x145
	.uleb128 0x3b
	.uleb128 0x1f
	.long	.LASF352
	.byte	0x1
	.value	0x3c2
	.long	0x1fcb
	.uleb128 0x1f
	.long	.LASF276
	.byte	0x1
	.value	0x3c2
	.long	0x57
	.byte	0x0
	.byte	0x0
	.uleb128 0x3a
	.long	0x1f5e
	.uleb128 0x1f
	.long	.LASF350
	.byte	0x1
	.value	0x3c7
	.long	0x145
	.uleb128 0x1f
	.long	.LASF351
	.byte	0x1
	.value	0x3c7
	.long	0x145
	.uleb128 0x3b
	.uleb128 0x1f
	.long	.LASF352
	.byte	0x1
	.value	0x3c7
	.long	0x1fcb
	.uleb128 0x1f
	.long	.LASF276
	.byte	0x1
	.value	0x3c7
	.long	0x57
	.byte	0x0
	.byte	0x0
	.uleb128 0x3a
	.long	0x1f96
	.uleb128 0x1f
	.long	.LASF350
	.byte	0x1
	.value	0x3cc
	.long	0x145
	.uleb128 0x1f
	.long	.LASF351
	.byte	0x1
	.value	0x3cc
	.long	0x145
	.uleb128 0x3b
	.uleb128 0x1f
	.long	.LASF352
	.byte	0x1
	.value	0x3cc
	.long	0x1fcb
	.uleb128 0x1f
	.long	.LASF276
	.byte	0x1
	.value	0x3cc
	.long	0x57
	.byte	0x0
	.byte	0x0
	.uleb128 0x3b
	.uleb128 0x1f
	.long	.LASF350
	.byte	0x1
	.value	0x3d1
	.long	0x145
	.uleb128 0x1f
	.long	.LASF351
	.byte	0x1
	.value	0x3d1
	.long	0x145
	.uleb128 0x3b
	.uleb128 0x1f
	.long	.LASF352
	.byte	0x1
	.value	0x3d1
	.long	0x1fcb
	.uleb128 0x1f
	.long	.LASF276
	.byte	0x1
	.value	0x3d1
	.long	0x57
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x6
	.byte	0x8
	.long	0x1fd1
	.uleb128 0x11
	.long	0x2d
	.uleb128 0x20
	.long	.LASF353
	.byte	0x1
	.value	0x559
	.byte	0x1
	.byte	0x1
	.long	0x204e
	.uleb128 0x1e
	.long	.LASF354
	.byte	0x1
	.value	0x559
	.long	0xf6
	.uleb128 0x21
	.string	"fp"
	.byte	0x1
	.value	0x55b
	.long	0x98f
	.uleb128 0x21
	.string	"buf"
	.byte	0x1
	.value	0x55c
	.long	0x204e
	.uleb128 0x21
	.string	"cp"
	.byte	0x1
	.value	0x55d
	.long	0xf6
	.uleb128 0x21
	.string	"len"
	.byte	0x1
	.value	0x55e
	.long	0x57
	.uleb128 0x1f
	.long	.LASF251
	.byte	0x1
	.value	0x55f
	.long	0x204e
	.uleb128 0x1f
	.long	.LASF252
	.byte	0x1
	.value	0x560
	.long	0x5e
	.uleb128 0x1f
	.long	.LASF253
	.byte	0x1
	.value	0x560
	.long	0x5e
	.uleb128 0x21
	.string	"tv"
	.byte	0x1
	.value	0x561
	.long	0x180
	.byte	0x0
	.uleb128 0xa
	.long	0xfc
	.long	0x205f
	.uleb128 0x22
	.long	0x42
	.value	0x1387
	.byte	0x0
	.uleb128 0x20
	.long	.LASF355
	.byte	0x1
	.value	0x146
	.byte	0x1
	.byte	0x1
	.long	0x20ba
	.uleb128 0x1f
	.long	.LASF170
	.byte	0x1
	.value	0x148
	.long	0x98f
	.uleb128 0x1f
	.long	.LASF356
	.byte	0x1
	.value	0x149
	.long	0x57
	.uleb128 0x3b
	.uleb128 0x1f
	.long	.LASF350
	.byte	0x1
	.value	0x14f
	.long	0x145
	.uleb128 0x1f
	.long	.LASF351
	.byte	0x1
	.value	0x14f
	.long	0x145
	.uleb128 0x3b
	.uleb128 0x1f
	.long	.LASF352
	.byte	0x1
	.value	0x14f
	.long	0x1fcb
	.uleb128 0x1f
	.long	.LASF276
	.byte	0x1
	.value	0x14f
	.long	0x57
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x20
	.long	.LASF357
	.byte	0x1
	.value	0x631
	.byte	0x1
	.byte	0x1
	.long	0x210f
	.uleb128 0x1d
	.string	"c"
	.byte	0x1
	.value	0x631
	.long	0x10e4
	.uleb128 0x1d
	.string	"tvP"
	.byte	0x1
	.value	0x631
	.long	0xd27
	.uleb128 0x21
	.string	"sz"
	.byte	0x1
	.value	0x633
	.long	0x57
	.uleb128 0x1f
	.long	.LASF243
	.byte	0x1
	.value	0x634
	.long	0xd00
	.uleb128 0x21
	.string	"hc"
	.byte	0x1
	.value	0x635
	.long	0xed4
	.uleb128 0x3b
	.uleb128 0x1f
	.long	.LASF288
	.byte	0x1
	.value	0x691
	.long	0x57
	.byte	0x0
	.byte	0x0
	.uleb128 0x3c
	.long	.LASF409
	.byte	0x1
	.value	0x75a
	.byte	0x1
	.long	0x57
	.byte	0x1
	.long	0x2142
	.uleb128 0x1d
	.string	"c"
	.byte	0x1
	.value	0x75a
	.long	0x10e4
	.uleb128 0x1f
	.long	.LASF306
	.byte	0x1
	.value	0x75c
	.long	0x57
	.uleb128 0x21
	.string	"l"
	.byte	0x1
	.value	0x75d
	.long	0x5e
	.byte	0x0
	.uleb128 0x20
	.long	.LASF358
	.byte	0x1
	.value	0x6ab
	.byte	0x1
	.byte	0x1
	.long	0x21d8
	.uleb128 0x1d
	.string	"c"
	.byte	0x1
	.value	0x6ab
	.long	0x10e4
	.uleb128 0x1d
	.string	"tvP"
	.byte	0x1
	.value	0x6ab
	.long	0xd27
	.uleb128 0x1f
	.long	.LASF359
	.byte	0x1
	.value	0x6ad
	.long	0x145
	.uleb128 0x21
	.string	"sz"
	.byte	0x1
	.value	0x6ae
	.long	0x57
	.uleb128 0x1f
	.long	.LASF360
	.byte	0x1
	.value	0x6ae
	.long	0x57
	.uleb128 0x1f
	.long	.LASF243
	.byte	0x1
	.value	0x6af
	.long	0xd00
	.uleb128 0x1f
	.long	.LASF361
	.byte	0x1
	.value	0x6b0
	.long	0x13a
	.uleb128 0x21
	.string	"hc"
	.byte	0x1
	.value	0x6b1
	.long	0xed4
	.uleb128 0x1f
	.long	.LASF288
	.byte	0x1
	.value	0x6b2
	.long	0x57
	.uleb128 0x3a
	.long	0x21c9
	.uleb128 0x21
	.string	"iv"
	.byte	0x1
	.value	0x6c6
	.long	0x21d8
	.byte	0x0
	.uleb128 0x3b
	.uleb128 0x1f
	.long	.LASF362
	.byte	0x1
	.value	0x70b
	.long	0x57
	.byte	0x0
	.byte	0x0
	.uleb128 0xa
	.long	0x2b1
	.long	0x21e8
	.uleb128 0xb
	.long	0x42
	.byte	0x1
	.byte	0x0
	.uleb128 0x3d
	.byte	0x1
	.long	.LASF410
	.byte	0x1
	.value	0x160
	.byte	0x1
	.long	0x57
	.quad	.LFB47
	.quad	.LFE47
	.byte	0x1
	.byte	0x9c
	.long	0x2d1d
	.uleb128 0x24
	.long	.LASF347
	.byte	0x1
	.value	0x160
	.long	0x57
	.long	.LLST69
	.uleb128 0x24
	.long	.LASF348
	.byte	0x1
	.value	0x160
	.long	0x4de
	.long	.LLST70
	.uleb128 0x26
	.string	"cp"
	.byte	0x1
	.value	0x162
	.long	0xf6
	.long	.LLST71
	.uleb128 0x26
	.string	"pwd"
	.byte	0x1
	.value	0x163
	.long	0x2d1d
	.long	.LLST72
	.uleb128 0x26
	.string	"uid"
	.byte	0x1
	.value	0x164
	.long	0x119
	.long	.LLST73
	.uleb128 0x26
	.string	"gid"
	.byte	0x1
	.value	0x165
	.long	0x10e
	.long	.LLST74
	.uleb128 0x36
	.string	"cwd"
	.byte	0x1
	.value	0x166
	.long	0x2d23
	.byte	0x3
	.byte	0x91
	.sleb128 -4448
	.uleb128 0x25
	.long	.LASF170
	.byte	0x1
	.value	0x167
	.long	0x98f
	.long	.LLST75
	.uleb128 0x25
	.long	.LASF356
	.byte	0x1
	.value	0x168
	.long	0x57
	.long	.LLST76
	.uleb128 0x25
	.long	.LASF363
	.byte	0x1
	.value	0x169
	.long	0x57
	.long	.LLST77
	.uleb128 0x25
	.long	.LASF307
	.byte	0x1
	.value	0x16a
	.long	0x57
	.long	.LLST78
	.uleb128 0x26
	.string	"c"
	.byte	0x1
	.value	0x16b
	.long	0x10e4
	.long	.LLST79
	.uleb128 0x26
	.string	"hc"
	.byte	0x1
	.value	0x16c
	.long	0xed4
	.long	.LLST80
	.uleb128 0x36
	.string	"sa4"
	.byte	0x1
	.value	0x16d
	.long	0x880
	.byte	0x3
	.byte	0x91
	.sleb128 -208
	.uleb128 0x36
	.string	"sa6"
	.byte	0x1
	.value	0x16e
	.long	0x880
	.byte	0x3
	.byte	0x91
	.sleb128 -336
	.uleb128 0x25
	.long	.LASF364
	.byte	0x1
	.value	0x16f
	.long	0x57
	.long	.LLST81
	.uleb128 0x25
	.long	.LASF365
	.byte	0x1
	.value	0x16f
	.long	0x57
	.long	.LLST82
	.uleb128 0x36
	.string	"tv"
	.byte	0x1
	.value	0x170
	.long	0x180
	.byte	0x4
	.byte	0x91
	.sleb128 -14512
	.uleb128 0x3e
	.byte	0x1
	.long	.LASF411
	.byte	0x1
	.value	0x262
	.long	0x57
	.byte	0x1
	.long	0x233c
	.uleb128 0x3f
	.byte	0x0
	.uleb128 0x40
	.long	0x1a94
	.quad	.LBB188
	.long	.Ldebug_ranges0+0x40
	.byte	0x1
	.value	0x17c
	.long	0x2902
	.uleb128 0x2f
	.long	0x1aae
	.long	.LLST83
	.uleb128 0x2f
	.long	0x1aa2
	.long	.LLST84
	.uleb128 0x41
	.long	.Ldebug_ranges0+0x110
	.uleb128 0x34
	.long	0x1aba
	.long	.LLST85
	.uleb128 0x2d
	.quad	.LBB195
	.quad	.LBE195
	.long	0x2398
	.uleb128 0x34
	.long	0x1e8f
	.long	.LLST86
	.uleb128 0x42
	.long	0x1e83
	.byte	0x0
	.uleb128 0x2d
	.quad	.LBB196
	.quad	.LBE196
	.long	0x23dc
	.uleb128 0x34
	.long	0x1e57
	.long	.LLST87
	.uleb128 0x42
	.long	0x1e4b
	.uleb128 0x33
	.quad	.LBB197
	.quad	.LBE197
	.uleb128 0x34
	.long	0x1e64
	.long	.LLST88
	.uleb128 0x42
	.long	0x1e70
	.byte	0x0
	.byte	0x0
	.uleb128 0x2d
	.quad	.LBB198
	.quad	.LBE198
	.long	0x2400
	.uleb128 0x34
	.long	0x1e1f
	.long	.LLST89
	.uleb128 0x42
	.long	0x1e13
	.byte	0x0
	.uleb128 0x2d
	.quad	.LBB199
	.quad	.LBE199
	.long	0x2444
	.uleb128 0x34
	.long	0x1de7
	.long	.LLST90
	.uleb128 0x42
	.long	0x1ddb
	.uleb128 0x33
	.quad	.LBB200
	.quad	.LBE200
	.uleb128 0x34
	.long	0x1df4
	.long	.LLST91
	.uleb128 0x42
	.long	0x1e00
	.byte	0x0
	.byte	0x0
	.uleb128 0x2d
	.quad	.LBB202
	.quad	.LBE202
	.long	0x2488
	.uleb128 0x34
	.long	0x1bb7
	.long	.LLST92
	.uleb128 0x42
	.long	0x1bab
	.uleb128 0x33
	.quad	.LBB203
	.quad	.LBE203
	.uleb128 0x34
	.long	0x1bc4
	.long	.LLST93
	.uleb128 0x42
	.long	0x1bd0
	.byte	0x0
	.byte	0x0
	.uleb128 0x2d
	.quad	.LBB205
	.quad	.LBE205
	.long	0x24cc
	.uleb128 0x42
	.long	0x1acb
	.uleb128 0x34
	.long	0x1ad7
	.long	.LLST94
	.uleb128 0x33
	.quad	.LBB206
	.quad	.LBE206
	.uleb128 0x34
	.long	0x1ae4
	.long	.LLST95
	.uleb128 0x42
	.long	0x1af0
	.byte	0x0
	.byte	0x0
	.uleb128 0x2d
	.quad	.LBB207
	.quad	.LBE207
	.long	0x2510
	.uleb128 0x34
	.long	0x1b7f
	.long	.LLST96
	.uleb128 0x42
	.long	0x1b73
	.uleb128 0x33
	.quad	.LBB208
	.quad	.LBE208
	.uleb128 0x34
	.long	0x1b8c
	.long	.LLST97
	.uleb128 0x42
	.long	0x1b98
	.byte	0x0
	.byte	0x0
	.uleb128 0x2d
	.quad	.LBB209
	.quad	.LBE209
	.long	0x2554
	.uleb128 0x34
	.long	0x1b47
	.long	.LLST98
	.uleb128 0x42
	.long	0x1b3b
	.uleb128 0x33
	.quad	.LBB210
	.quad	.LBE210
	.uleb128 0x34
	.long	0x1b54
	.long	.LLST99
	.uleb128 0x42
	.long	0x1b60
	.byte	0x0
	.byte	0x0
	.uleb128 0x43
	.long	.Ldebug_ranges0+0x1e0
	.long	0x2580
	.uleb128 0x34
	.long	0x1b0f
	.long	.LLST100
	.uleb128 0x42
	.long	0x1b03
	.uleb128 0x41
	.long	.Ldebug_ranges0+0x210
	.uleb128 0x34
	.long	0x1b1c
	.long	.LLST101
	.uleb128 0x42
	.long	0x1b28
	.byte	0x0
	.byte	0x0
	.uleb128 0x43
	.long	.Ldebug_ranges0+0x240
	.long	0x2598
	.uleb128 0x34
	.long	0x1bef
	.long	.LLST102
	.uleb128 0x42
	.long	0x1be3
	.byte	0x0
	.uleb128 0x2d
	.quad	.LBB216
	.quad	.LBE216
	.long	0x25dc
	.uleb128 0x34
	.long	0x1c27
	.long	.LLST103
	.uleb128 0x42
	.long	0x1c1b
	.uleb128 0x33
	.quad	.LBB217
	.quad	.LBE217
	.uleb128 0x34
	.long	0x1c34
	.long	.LLST104
	.uleb128 0x42
	.long	0x1c40
	.byte	0x0
	.byte	0x0
	.uleb128 0x2d
	.quad	.LBB218
	.quad	.LBE218
	.long	0x2620
	.uleb128 0x34
	.long	0x1c5f
	.long	.LLST105
	.uleb128 0x42
	.long	0x1c53
	.uleb128 0x33
	.quad	.LBB219
	.quad	.LBE219
	.uleb128 0x34
	.long	0x1c6c
	.long	.LLST106
	.uleb128 0x42
	.long	0x1c78
	.byte	0x0
	.byte	0x0
	.uleb128 0x2d
	.quad	.LBB220
	.quad	.LBE220
	.long	0x2644
	.uleb128 0x34
	.long	0x1c97
	.long	.LLST107
	.uleb128 0x42
	.long	0x1c8b
	.byte	0x0
	.uleb128 0x2d
	.quad	.LBB221
	.quad	.LBE221
	.long	0x2688
	.uleb128 0x34
	.long	0x1ccf
	.long	.LLST108
	.uleb128 0x42
	.long	0x1cc3
	.uleb128 0x33
	.quad	.LBB222
	.quad	.LBE222
	.uleb128 0x34
	.long	0x1cdc
	.long	.LLST109
	.uleb128 0x42
	.long	0x1ce8
	.byte	0x0
	.byte	0x0
	.uleb128 0x40
	.long	0x1093
	.quad	.LBB223
	.long	.Ldebug_ranges0+0x270
	.byte	0x1
	.value	0x382
	.long	0x26aa
	.uleb128 0x2f
	.long	0x10a6
	.long	.LLST110
	.byte	0x0
	.uleb128 0x2d
	.quad	.LBB227
	.quad	.LBE227
	.long	0x26ee
	.uleb128 0x34
	.long	0x1d07
	.long	.LLST111
	.uleb128 0x42
	.long	0x1cfb
	.uleb128 0x33
	.quad	.LBB228
	.quad	.LBE228
	.uleb128 0x34
	.long	0x1d14
	.long	.LLST112
	.uleb128 0x42
	.long	0x1d20
	.byte	0x0
	.byte	0x0
	.uleb128 0x43
	.long	.Ldebug_ranges0+0x2a0
	.long	0x271a
	.uleb128 0x34
	.long	0x1d3f
	.long	.LLST113
	.uleb128 0x42
	.long	0x1d33
	.uleb128 0x41
	.long	.Ldebug_ranges0+0x2d0
	.uleb128 0x34
	.long	0x1d4c
	.long	.LLST114
	.uleb128 0x42
	.long	0x1d58
	.byte	0x0
	.byte	0x0
	.uleb128 0x2d
	.quad	.LBB232
	.quad	.LBE232
	.long	0x275e
	.uleb128 0x34
	.long	0x1d77
	.long	.LLST115
	.uleb128 0x42
	.long	0x1d6b
	.uleb128 0x33
	.quad	.LBB233
	.quad	.LBE233
	.uleb128 0x34
	.long	0x1d84
	.long	.LLST116
	.uleb128 0x42
	.long	0x1d90
	.byte	0x0
	.byte	0x0
	.uleb128 0x2d
	.quad	.LBB234
	.quad	.LBE234
	.long	0x27a2
	.uleb128 0x34
	.long	0x1daf
	.long	.LLST117
	.uleb128 0x42
	.long	0x1da3
	.uleb128 0x33
	.quad	.LBB235
	.quad	.LBE235
	.uleb128 0x34
	.long	0x1dbc
	.long	.LLST118
	.uleb128 0x42
	.long	0x1dc8
	.byte	0x0
	.byte	0x0
	.uleb128 0x2d
	.quad	.LBB236
	.quad	.LBE236
	.long	0x27e1
	.uleb128 0x44
	.long	0x1ec7
	.byte	0x2
	.uleb128 0x42
	.long	0x1ebb
	.uleb128 0x33
	.quad	.LBB237
	.quad	.LBE237
	.uleb128 0x45
	.long	0x1ed4
	.byte	0x1
	.byte	0x5f
	.uleb128 0x42
	.long	0x1ee0
	.byte	0x0
	.byte	0x0
	.uleb128 0x2d
	.quad	.LBB238
	.quad	.LBE238
	.long	0x2820
	.uleb128 0x44
	.long	0x1eff
	.byte	0x2
	.uleb128 0x42
	.long	0x1ef3
	.uleb128 0x33
	.quad	.LBB239
	.quad	.LBE239
	.uleb128 0x45
	.long	0x1f0c
	.byte	0x1
	.byte	0x5f
	.uleb128 0x42
	.long	0x1f18
	.byte	0x0
	.byte	0x0
	.uleb128 0x2d
	.quad	.LBB240
	.quad	.LBE240
	.long	0x285f
	.uleb128 0x44
	.long	0x1f37
	.byte	0x2
	.uleb128 0x42
	.long	0x1f2b
	.uleb128 0x33
	.quad	.LBB241
	.quad	.LBE241
	.uleb128 0x45
	.long	0x1f44
	.byte	0x1
	.byte	0x5f
	.uleb128 0x42
	.long	0x1f50
	.byte	0x0
	.byte	0x0
	.uleb128 0x2d
	.quad	.LBB242
	.quad	.LBE242
	.long	0x289e
	.uleb128 0x44
	.long	0x1f6f
	.byte	0x2
	.uleb128 0x42
	.long	0x1f63
	.uleb128 0x33
	.quad	.LBB243
	.quad	.LBE243
	.uleb128 0x45
	.long	0x1f7c
	.byte	0x1
	.byte	0x5f
	.uleb128 0x42
	.long	0x1f88
	.byte	0x0
	.byte	0x0
	.uleb128 0x2d
	.quad	.LBB244
	.quad	.LBE244
	.long	0x28e2
	.uleb128 0x34
	.long	0x1fa3
	.long	.LLST119
	.uleb128 0x42
	.long	0x1f97
	.uleb128 0x33
	.quad	.LBB245
	.quad	.LBE245
	.uleb128 0x34
	.long	0x1fb0
	.long	.LLST120
	.uleb128 0x42
	.long	0x1fbc
	.byte	0x0
	.byte	0x0
	.uleb128 0x37
	.long	0x1093
	.quad	.LBB246
	.long	.Ldebug_ranges0+0x300
	.byte	0x1
	.value	0x3cf
	.uleb128 0x2f
	.long	0x10a6
	.long	.LLST121
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x40
	.long	0x1151
	.quad	.LBB256
	.long	.Ldebug_ranges0+0x330
	.byte	0x1
	.value	0x182
	.long	0x2990
	.uleb128 0x32
	.long	0x119b
	.uleb128 0x2f
	.long	0x1183
	.long	.LLST122
	.uleb128 0x32
	.long	0x1177
	.uleb128 0x2f
	.long	0x115f
	.long	.LLST123
	.uleb128 0x41
	.long	.Ldebug_ranges0+0x380
	.uleb128 0x45
	.long	0x11a7
	.byte	0x4
	.byte	0x91
	.sleb128 -14608
	.uleb128 0x45
	.long	0x11b3
	.byte	0x4
	.byte	0x91
	.sleb128 -9456
	.uleb128 0x34
	.long	0x11bf
	.long	.LLST124
	.uleb128 0x34
	.long	0x11cb
	.long	.LLST125
	.uleb128 0x34
	.long	0x11d6
	.long	.LLST126
	.uleb128 0x34
	.long	0x11e2
	.long	.LLST127
	.uleb128 0x34
	.long	0x11ee
	.long	.LLST128
	.uleb128 0x2f
	.long	0x118f
	.long	.LLST129
	.uleb128 0x2f
	.long	0x116b
	.long	.LLST130
	.byte	0x0
	.byte	0x0
	.uleb128 0x40
	.long	0x1fd6
	.quad	.LBB262
	.long	.Ldebug_ranges0+0x3d0
	.byte	0x1
	.value	0x18f
	.long	0x2a03
	.uleb128 0x2f
	.long	0x1fe4
	.long	.LLST131
	.uleb128 0x41
	.long	.Ldebug_ranges0+0x440
	.uleb128 0x34
	.long	0x1ff0
	.long	.LLST132
	.uleb128 0x45
	.long	0x1ffb
	.byte	0x4
	.byte	0x91
	.sleb128 -9456
	.uleb128 0x34
	.long	0x2007
	.long	.LLST133
	.uleb128 0x34
	.long	0x2012
	.long	.LLST134
	.uleb128 0x45
	.long	0x201e
	.byte	0x4
	.byte	0x91
	.sleb128 -14464
	.uleb128 0x34
	.long	0x202a
	.long	.LLST135
	.uleb128 0x34
	.long	0x2036
	.long	.LLST136
	.uleb128 0x45
	.long	0x2042
	.byte	0x4
	.byte	0x91
	.sleb128 -14528
	.byte	0x0
	.byte	0x0
	.uleb128 0x2d
	.quad	.LBB271
	.quad	.LBE271
	.long	0x2a35
	.uleb128 0x1f
	.long	.LASF350
	.byte	0x1
	.value	0x1a4
	.long	0x145
	.uleb128 0x25
	.long	.LASF351
	.byte	0x1
	.value	0x1a4
	.long	0x145
	.long	.LLST137
	.byte	0x0
	.uleb128 0x2d
	.quad	.LBB272
	.quad	.LBE272
	.long	0x2a99
	.uleb128 0x1f
	.long	.LASF350
	.byte	0x1
	.value	0x1a9
	.long	0x145
	.uleb128 0x25
	.long	.LASF351
	.byte	0x1
	.value	0x1a9
	.long	0x145
	.long	.LLST138
	.uleb128 0x33
	.quad	.LBB273
	.quad	.LBE273
	.uleb128 0x25
	.long	.LASF352
	.byte	0x1
	.value	0x1a9
	.long	0x1fcb
	.long	.LLST139
	.uleb128 0x25
	.long	.LASF276
	.byte	0x1
	.value	0x1a9
	.long	0x57
	.long	.LLST140
	.byte	0x0
	.byte	0x0
	.uleb128 0x43
	.long	.Ldebug_ranges0+0x4b0
	.long	0x2ab3
	.uleb128 0x25
	.long	.LASF366
	.byte	0x1
	.value	0x218
	.long	0x98f
	.long	.LLST141
	.byte	0x0
	.uleb128 0x40
	.long	0x2142
	.quad	.LBB275
	.long	.Ldebug_ranges0+0x4e0
	.byte	0x1
	.value	0x327
	.long	0x2b5a
	.uleb128 0x2f
	.long	0x215a
	.long	.LLST142
	.uleb128 0x2f
	.long	0x2150
	.long	.LLST143
	.uleb128 0x41
	.long	.Ldebug_ranges0+0x550
	.uleb128 0x34
	.long	0x2166
	.long	.LLST144
	.uleb128 0x34
	.long	0x2172
	.long	.LLST145
	.uleb128 0x34
	.long	0x217d
	.long	.LLST146
	.uleb128 0x42
	.long	0x2189
	.uleb128 0x34
	.long	0x2195
	.long	.LLST147
	.uleb128 0x34
	.long	0x21a1
	.long	.LLST148
	.uleb128 0x34
	.long	0x21ac
	.long	.LLST149
	.uleb128 0x2d
	.quad	.LBB279
	.quad	.LBE279
	.long	0x2b3d
	.uleb128 0x45
	.long	0x21bd
	.byte	0x4
	.byte	0x91
	.sleb128 -14560
	.byte	0x0
	.uleb128 0x33
	.quad	.LBB280
	.quad	.LBE280
	.uleb128 0x34
	.long	0x21ca
	.long	.LLST150
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x40
	.long	0x20ba
	.quad	.LBB284
	.long	.Ldebug_ranges0+0x5c0
	.byte	0x1
	.value	0x326
	.long	0x2c07
	.uleb128 0x2f
	.long	0x20d2
	.long	.LLST151
	.uleb128 0x2f
	.long	0x20c8
	.long	.LLST152
	.uleb128 0x41
	.long	.Ldebug_ranges0+0x630
	.uleb128 0x34
	.long	0x20de
	.long	.LLST153
	.uleb128 0x42
	.long	0x20e9
	.uleb128 0x34
	.long	0x20f5
	.long	.LLST154
	.uleb128 0x2e
	.long	0x210f
	.quad	.LBB288
	.quad	.LBE288
	.byte	0x1
	.value	0x672
	.long	0x2bea
	.uleb128 0x2f
	.long	0x2121
	.long	.LLST155
	.uleb128 0x33
	.quad	.LBB289
	.quad	.LBE289
	.uleb128 0x34
	.long	0x212b
	.long	.LLST156
	.uleb128 0x34
	.long	0x2137
	.long	.LLST157
	.byte	0x0
	.byte	0x0
	.uleb128 0x33
	.quad	.LBB290
	.quad	.LBE290
	.uleb128 0x34
	.long	0x2101
	.long	.LLST158
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x40
	.long	0x1105
	.quad	.LBB303
	.long	.Ldebug_ranges0+0x6a0
	.byte	0x1
	.value	0x328
	.long	0x2c4b
	.uleb128 0x2f
	.long	0x111d
	.long	.LLST159
	.uleb128 0x2f
	.long	0x1113
	.long	.LLST160
	.uleb128 0x41
	.long	.Ldebug_ranges0+0x6d0
	.uleb128 0x45
	.long	0x1129
	.byte	0x4
	.byte	0x91
	.sleb128 -9456
	.uleb128 0x34
	.long	0x1135
	.long	.LLST161
	.byte	0x0
	.byte	0x0
	.uleb128 0x40
	.long	0x205f
	.quad	.LBB307
	.long	.Ldebug_ranges0+0x700
	.byte	0x1
	.value	0x2ee
	.long	0x2cbc
	.uleb128 0x41
	.long	.Ldebug_ranges0+0x740
	.uleb128 0x34
	.long	0x206d
	.long	.LLST162
	.uleb128 0x34
	.long	0x2079
	.long	.LLST163
	.uleb128 0x33
	.quad	.LBB310
	.quad	.LBE310
	.uleb128 0x42
	.long	0x2086
	.uleb128 0x34
	.long	0x2092
	.long	.LLST164
	.uleb128 0x33
	.quad	.LBB311
	.quad	.LBE311
	.uleb128 0x34
	.long	0x209f
	.long	.LLST165
	.uleb128 0x42
	.long	0x20ab
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x33
	.quad	.LBB314
	.quad	.LBE314
	.uleb128 0x1f
	.long	.LASF350
	.byte	0x1
	.value	0x23b
	.long	0x145
	.uleb128 0x25
	.long	.LASF351
	.byte	0x1
	.value	0x23b
	.long	0x145
	.long	.LLST166
	.uleb128 0x33
	.quad	.LBB315
	.quad	.LBE315
	.uleb128 0x25
	.long	.LASF352
	.byte	0x1
	.value	0x23b
	.long	0x1fcb
	.long	.LLST167
	.uleb128 0x25
	.long	.LASF276
	.byte	0x1
	.value	0x23b
	.long	0x57
	.long	.LLST168
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x6
	.byte	0x8
	.long	0x2d6
	.uleb128 0xa
	.long	0xfc
	.long	0x2d34
	.uleb128 0x22
	.long	0x42
	.value	0x1000
	.byte	0x0
	.uleb128 0x46
	.long	.LASF367
	.byte	0xc
	.byte	0xa5
	.long	0x522
	.byte	0x1
	.byte	0x1
	.uleb128 0x46
	.long	.LASF368
	.byte	0xc
	.byte	0xa6
	.long	0x522
	.byte	0x1
	.byte	0x1
	.uleb128 0x46
	.long	.LASF369
	.byte	0xc
	.byte	0xa7
	.long	0x522
	.byte	0x1
	.byte	0x1
	.uleb128 0x46
	.long	.LASF370
	.byte	0x15
	.byte	0xfd
	.long	0xf6
	.byte	0x1
	.byte	0x1
	.uleb128 0x46
	.long	.LASF371
	.byte	0x15
	.byte	0xfe
	.long	0xf6
	.byte	0x1
	.byte	0x1
	.uleb128 0x46
	.long	.LASF372
	.byte	0x15
	.byte	0xff
	.long	0xf6
	.byte	0x1
	.byte	0x1
	.uleb128 0x47
	.long	.LASF373
	.byte	0x15
	.value	0x100
	.long	0xf6
	.byte	0x1
	.byte	0x1
	.uleb128 0x47
	.long	.LASF374
	.byte	0x15
	.value	0x101
	.long	0xf6
	.byte	0x1
	.byte	0x1
	.uleb128 0x47
	.long	.LASF375
	.byte	0x15
	.value	0x102
	.long	0xf6
	.byte	0x1
	.byte	0x1
	.uleb128 0x46
	.long	.LASF376
	.byte	0x16
	.byte	0x30
	.long	0xd00
	.byte	0x1
	.byte	0x1
	.uleb128 0x2a
	.long	.LASF377
	.byte	0x1
	.byte	0x43
	.long	0xf6
	.byte	0x9
	.byte	0x3
	.quad	argv0
	.uleb128 0x2a
	.long	.LASF378
	.byte	0x1
	.byte	0x44
	.long	0x57
	.byte	0x9
	.byte	0x3
	.quad	debug
	.uleb128 0x2a
	.long	.LASF161
	.byte	0x1
	.byte	0x45
	.long	0x34
	.byte	0x9
	.byte	0x3
	.quad	port
	.uleb128 0x48
	.string	"dir"
	.byte	0x1
	.byte	0x46
	.long	0xf6
	.byte	0x9
	.byte	0x3
	.quad	dir
	.uleb128 0x2a
	.long	.LASF379
	.byte	0x1
	.byte	0x47
	.long	0xf6
	.byte	0x9
	.byte	0x3
	.quad	data_dir
	.uleb128 0x2a
	.long	.LASF380
	.byte	0x1
	.byte	0x48
	.long	0x57
	.byte	0x9
	.byte	0x3
	.quad	do_chroot
	.uleb128 0x2a
	.long	.LASF169
	.byte	0x1
	.byte	0x48
	.long	0x57
	.byte	0x9
	.byte	0x3
	.quad	no_log
	.uleb128 0x2a
	.long	.LASF171
	.byte	0x1
	.byte	0x48
	.long	0x57
	.byte	0x9
	.byte	0x3
	.quad	no_symlink_check
	.uleb128 0x2a
	.long	.LASF381
	.byte	0x1
	.byte	0x48
	.long	0x57
	.byte	0x9
	.byte	0x3
	.quad	do_vhost
	.uleb128 0x2a
	.long	.LASF382
	.byte	0x1
	.byte	0x48
	.long	0x57
	.byte	0x9
	.byte	0x3
	.quad	do_global_passwd
	.uleb128 0x2a
	.long	.LASF162
	.byte	0x1
	.byte	0x49
	.long	0xf6
	.byte	0x9
	.byte	0x3
	.quad	cgi_pattern
	.uleb128 0x2a
	.long	.LASF163
	.byte	0x1
	.byte	0x4a
	.long	0x57
	.byte	0x9
	.byte	0x3
	.quad	cgi_limit
	.uleb128 0x2a
	.long	.LASF174
	.byte	0x1
	.byte	0x4b
	.long	0xf6
	.byte	0x9
	.byte	0x3
	.quad	url_pattern
	.uleb128 0x2a
	.long	.LASF176
	.byte	0x1
	.byte	0x4c
	.long	0x57
	.byte	0x9
	.byte	0x3
	.quad	no_empty_referers
	.uleb128 0x2a
	.long	.LASF175
	.byte	0x1
	.byte	0x4d
	.long	0xf6
	.byte	0x9
	.byte	0x3
	.quad	local_pattern
	.uleb128 0x2a
	.long	.LASF383
	.byte	0x1
	.byte	0x4e
	.long	0xf6
	.byte	0x9
	.byte	0x3
	.quad	logfile
	.uleb128 0x2a
	.long	.LASF354
	.byte	0x1
	.byte	0x4f
	.long	0xf6
	.byte	0x9
	.byte	0x3
	.quad	throttlefile
	.uleb128 0x2a
	.long	.LASF227
	.byte	0x1
	.byte	0x50
	.long	0xf6
	.byte	0x9
	.byte	0x3
	.quad	hostname
	.uleb128 0x2a
	.long	.LASF384
	.byte	0x1
	.byte	0x51
	.long	0xf6
	.byte	0x9
	.byte	0x3
	.quad	pidfile
	.uleb128 0x2a
	.long	.LASF385
	.byte	0x1
	.byte	0x52
	.long	0xf6
	.byte	0x9
	.byte	0x3
	.quad	user
	.uleb128 0x2a
	.long	.LASF165
	.byte	0x1
	.byte	0x53
	.long	0xf6
	.byte	0x9
	.byte	0x3
	.quad	charset
	.uleb128 0x48
	.string	"p3p"
	.byte	0x1
	.byte	0x54
	.long	0xf6
	.byte	0x9
	.byte	0x3
	.quad	p3p
	.uleb128 0x2a
	.long	.LASF166
	.byte	0x1
	.byte	0x55
	.long	0x57
	.byte	0x9
	.byte	0x3
	.quad	max_age
	.uleb128 0x2a
	.long	.LASF386
	.byte	0x1
	.byte	0x5f
	.long	0x2fb1
	.byte	0x9
	.byte	0x3
	.quad	throttles
	.uleb128 0x6
	.byte	0x8
	.long	0xe03
	.uleb128 0x2a
	.long	.LASF387
	.byte	0x1
	.byte	0x60
	.long	0x57
	.byte	0x9
	.byte	0x3
	.quad	numthrottles
	.uleb128 0x2a
	.long	.LASF388
	.byte	0x1
	.byte	0x60
	.long	0x57
	.byte	0x9
	.byte	0x3
	.quad	maxthrottles
	.uleb128 0x2a
	.long	.LASF389
	.byte	0x1
	.byte	0x74
	.long	0x10e4
	.byte	0x9
	.byte	0x3
	.quad	connects
	.uleb128 0x2a
	.long	.LASF390
	.byte	0x1
	.byte	0x75
	.long	0x57
	.byte	0x9
	.byte	0x3
	.quad	num_connects
	.uleb128 0x2a
	.long	.LASF391
	.byte	0x1
	.byte	0x75
	.long	0x57
	.byte	0x9
	.byte	0x3
	.quad	max_connects
	.uleb128 0x2a
	.long	.LASF392
	.byte	0x1
	.byte	0x75
	.long	0x57
	.byte	0x9
	.byte	0x3
	.quad	first_free_connect
	.uleb128 0x2a
	.long	.LASF393
	.byte	0x1
	.byte	0x76
	.long	0x57
	.byte	0x9
	.byte	0x3
	.quad	httpd_conn_count
	.uleb128 0x48
	.string	"hs"
	.byte	0x1
	.byte	0x80
	.long	0xccb
	.byte	0x9
	.byte	0x3
	.quad	hs
	.uleb128 0x46
	.long	.LASF394
	.byte	0x1
	.byte	0x81
	.long	0x57
	.byte	0x1
	.byte	0x1
	.uleb128 0x46
	.long	.LASF395
	.byte	0x1
	.byte	0x82
	.long	0x13a
	.byte	0x1
	.byte	0x1
	.uleb128 0x46
	.long	.LASF396
	.byte	0x1
	.byte	0x82
	.long	0x13a
	.byte	0x1
	.byte	0x1
	.uleb128 0x46
	.long	.LASF397
	.byte	0x1
	.byte	0x83
	.long	0x5e
	.byte	0x1
	.byte	0x1
	.uleb128 0x46
	.long	.LASF398
	.byte	0x1
	.byte	0x84
	.long	0x124
	.byte	0x1
	.byte	0x1
	.uleb128 0x46
	.long	.LASF399
	.byte	0x1
	.byte	0x85
	.long	0x57
	.byte	0x1
	.byte	0x1
	.uleb128 0x2a
	.long	.LASF400
	.byte	0x1
	.byte	0x87
	.long	0x1b3
	.byte	0x9
	.byte	0x3
	.quad	got_hup
	.uleb128 0x2a
	.long	.LASF401
	.byte	0x1
	.byte	0x87
	.long	0x1b3
	.byte	0x9
	.byte	0x3
	.quad	got_usr1
	.uleb128 0x2a
	.long	.LASF402
	.byte	0x1
	.byte	0x87
	.long	0x1b3
	.byte	0x9
	.byte	0x3
	.quad	watchdog_flag
	.uleb128 0x46
	.long	.LASF367
	.byte	0xc
	.byte	0xa5
	.long	0x522
	.byte	0x1
	.byte	0x1
	.uleb128 0x46
	.long	.LASF368
	.byte	0xc
	.byte	0xa6
	.long	0x522
	.byte	0x1
	.byte	0x1
	.uleb128 0x46
	.long	.LASF369
	.byte	0xc
	.byte	0xa7
	.long	0x522
	.byte	0x1
	.byte	0x1
	.uleb128 0x46
	.long	.LASF370
	.byte	0x15
	.byte	0xfd
	.long	0xf6
	.byte	0x1
	.byte	0x1
	.uleb128 0x46
	.long	.LASF371
	.byte	0x15
	.byte	0xfe
	.long	0xf6
	.byte	0x1
	.byte	0x1
	.uleb128 0x46
	.long	.LASF372
	.byte	0x15
	.byte	0xff
	.long	0xf6
	.byte	0x1
	.byte	0x1
	.uleb128 0x47
	.long	.LASF373
	.byte	0x15
	.value	0x100
	.long	0xf6
	.byte	0x1
	.byte	0x1
	.uleb128 0x47
	.long	.LASF374
	.byte	0x15
	.value	0x101
	.long	0xf6
	.byte	0x1
	.byte	0x1
	.uleb128 0x47
	.long	.LASF375
	.byte	0x15
	.value	0x102
	.long	0xf6
	.byte	0x1
	.byte	0x1
	.uleb128 0x46
	.long	.LASF376
	.byte	0x16
	.byte	0x30
	.long	0xd00
	.byte	0x1
	.byte	0x1
	.uleb128 0x49
	.long	.LASF394
	.byte	0x1
	.byte	0x81
	.long	0x57
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	terminate
	.uleb128 0x49
	.long	.LASF395
	.byte	0x1
	.byte	0x82
	.long	0x13a
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	start_time
	.uleb128 0x49
	.long	.LASF396
	.byte	0x1
	.byte	0x82
	.long	0x13a
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	stats_time
	.uleb128 0x49
	.long	.LASF397
	.byte	0x1
	.byte	0x83
	.long	0x5e
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	stats_connections
	.uleb128 0x49
	.long	.LASF398
	.byte	0x1
	.byte	0x84
	.long	0x124
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	stats_bytes
	.uleb128 0x49
	.long	.LASF399
	.byte	0x1
	.byte	0x85
	.long	0x57
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	stats_simultaneous
	.byte	0x0
	.section	.debug_abbrev
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0x0
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0x0
	.byte	0x0
	.uleb128 0x4
	.uleb128 0x16
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x5
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x7
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x8
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xd
	.byte	0x0
	.byte	0x0
	.uleb128 0x9
	.uleb128 0x35
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xa
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xb
	.uleb128 0x21
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0xc
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xd
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xe
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xf
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xd
	.byte	0x0
	.byte	0x0
	.uleb128 0x10
	.uleb128 0x16
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x11
	.uleb128 0x26
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x12
	.uleb128 0x16
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x13
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x14
	.uleb128 0x28
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0x0
	.byte	0x0
	.uleb128 0x15
	.uleb128 0x4
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x16
	.uleb128 0x17
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x17
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x18
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x19
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x1a
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xd
	.byte	0x0
	.byte	0x0
	.uleb128 0x1b
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0x5
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x1c
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x1d
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x1e
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x1f
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x20
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x21
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x22
	.uleb128 0x21
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0x0
	.byte	0x0
	.uleb128 0x23
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x24
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x25
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x26
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x27
	.uleb128 0x2e
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x28
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x29
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x2a
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x2b
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x2c
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x2d
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x2e
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x30
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0x5
	.byte	0x0
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x32
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x33
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x34
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x35
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x36
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x37
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x55
	.uleb128 0x6
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0x5
	.byte	0x0
	.byte	0x0
	.uleb128 0x38
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x39
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x3a
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x3c
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x3d
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x3e
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x3f
	.uleb128 0x18
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x40
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x55
	.uleb128 0x6
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x41
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x42
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x43
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x44
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x45
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x46
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0x0
	.byte	0x0
	.uleb128 0x47
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.section	.debug_pubnames,"",@progbits
	.long	0x80
	.value	0x2
	.long	.Ldebug_info0
	.long	0x31f5
	.long	0x21e8
	.string	"main"
	.long	0x3170
	.string	"terminate"
	.long	0x3186
	.string	"start_time"
	.long	0x319c
	.string	"stats_time"
	.long	0x31b2
	.string	"stats_connections"
	.long	0x31c8
	.string	"stats_bytes"
	.long	0x31de
	.string	"stats_simultaneous"
	.long	0x0
	.section	.debug_pubtypes,"",@progbits
	.long	0x306
	.value	0x2
	.long	.Ldebug_info0
	.long	0x31f5
	.long	0x65
	.string	"__dev_t"
	.long	0x70
	.string	"__uid_t"
	.long	0x7b
	.string	"__gid_t"
	.long	0x86
	.string	"__ino_t"
	.long	0x91
	.string	"__mode_t"
	.long	0x9c
	.string	"__nlink_t"
	.long	0xa7
	.string	"__off_t"
	.long	0xb2
	.string	"__off64_t"
	.long	0xbd
	.string	"__pid_t"
	.long	0xc8
	.string	"__time_t"
	.long	0xd3
	.string	"__suseconds_t"
	.long	0xe0
	.string	"__blksize_t"
	.long	0xeb
	.string	"__blkcnt_t"
	.long	0x103
	.string	"__socklen_t"
	.long	0x10e
	.string	"gid_t"
	.long	0x119
	.string	"uid_t"
	.long	0x124
	.string	"off_t"
	.long	0x12f
	.string	"pid_t"
	.long	0x13a
	.string	"time_t"
	.long	0x145
	.string	"size_t"
	.long	0x150
	.string	"int64_t"
	.long	0x15b
	.string	"timespec"
	.long	0x180
	.string	"timeval"
	.long	0x1b8
	.string	"stat"
	.long	0x28e
	.string	"__sighandler_t"
	.long	0x2b1
	.string	"iovec"
	.long	0x2d6
	.string	"passwd"
	.long	0x337
	.string	"FILE"
	.long	0x4e4
	.string	"_IO_lock_t"
	.long	0x4eb
	.string	"_IO_marker"
	.long	0x342
	.string	"_IO_FILE"
	.long	0x55e
	.string	"socklen_t"
	.long	0x56a
	.string	"timezone"
	.long	0x58f
	.string	"__socket_type"
	.long	0x5d5
	.string	"sa_family_t"
	.long	0x5e0
	.string	"sockaddr"
	.long	0x615
	.string	"sockaddr_storage"
	.long	0x671
	.string	"uint8_t"
	.long	0x67c
	.string	"uint16_t"
	.long	0x687
	.string	"uint32_t"
	.long	0x692
	.string	"in_port_t"
	.long	0x69d
	.string	"in_addr_t"
	.long	0x6a8
	.string	"in_addr"
	.long	0x71b
	.string	"in6_addr"
	.long	0x734
	.string	"sockaddr_in"
	.long	0x781
	.string	"sockaddr_in6"
	.long	0x7ca
	.string	"addrinfo"
	.long	0x880
	.string	"httpd_sockaddr"
	.long	0x995
	.string	"httpd_server"
	.long	0xcd1
	.string	"httpd_conn"
	.long	0xd00
	.string	"ClientData"
	.long	0xd0b
	.string	"TimerProc"
	.long	0xd2d
	.string	"TimerStruct"
	.long	0xda7
	.string	"Timer"
	.long	0xe03
	.string	"throttletab"
	.long	0xef0
	.string	"connecttab"
	.long	0x0
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0x0
	.value	0x0
	.value	0x0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	0x0
	.quad	0x0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.quad	.LBB103-.Ltext0
	.quad	.LBE103-.Ltext0
	.quad	.LBB108-.Ltext0
	.quad	.LBE108-.Ltext0
	.quad	.LBB107-.Ltext0
	.quad	.LBE107-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB188-.Ltext0
	.quad	.LBE188-.Ltext0
	.quad	.LBB334-.Ltext0
	.quad	.LBE334-.Ltext0
	.quad	.LBB331-.Ltext0
	.quad	.LBE331-.Ltext0
	.quad	.LBB328-.Ltext0
	.quad	.LBE328-.Ltext0
	.quad	.LBB326-.Ltext0
	.quad	.LBE326-.Ltext0
	.quad	.LBB324-.Ltext0
	.quad	.LBE324-.Ltext0
	.quad	.LBB319-.Ltext0
	.quad	.LBE319-.Ltext0
	.quad	.LBB317-.Ltext0
	.quad	.LBE317-.Ltext0
	.quad	.LBB300-.Ltext0
	.quad	.LBE300-.Ltext0
	.quad	.LBB296-.Ltext0
	.quad	.LBE296-.Ltext0
	.quad	.LBB295-.Ltext0
	.quad	.LBE295-.Ltext0
	.quad	.LBB269-.Ltext0
	.quad	.LBE269-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB194-.Ltext0
	.quad	.LBE194-.Ltext0
	.quad	.LBB255-.Ltext0
	.quad	.LBE255-.Ltext0
	.quad	.LBB189-.Ltext0
	.quad	.LBE189-.Ltext0
	.quad	.LBB254-.Ltext0
	.quad	.LBE254-.Ltext0
	.quad	.LBB190-.Ltext0
	.quad	.LBE190-.Ltext0
	.quad	.LBB253-.Ltext0
	.quad	.LBE253-.Ltext0
	.quad	.LBB191-.Ltext0
	.quad	.LBE191-.Ltext0
	.quad	.LBB252-.Ltext0
	.quad	.LBE252-.Ltext0
	.quad	.LBB192-.Ltext0
	.quad	.LBE192-.Ltext0
	.quad	.LBB251-.Ltext0
	.quad	.LBE251-.Ltext0
	.quad	.LBB193-.Ltext0
	.quad	.LBE193-.Ltext0
	.quad	.LBB250-.Ltext0
	.quad	.LBE250-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB211-.Ltext0
	.quad	.LBE211-.Ltext0
	.quad	.LBB204-.Ltext0
	.quad	.LBE204-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB212-.Ltext0
	.quad	.LBE212-.Ltext0
	.quad	.LBB213-.Ltext0
	.quad	.LBE213-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB214-.Ltext0
	.quad	.LBE214-.Ltext0
	.quad	.LBB215-.Ltext0
	.quad	.LBE215-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB223-.Ltext0
	.quad	.LBE223-.Ltext0
	.quad	.LBB226-.Ltext0
	.quad	.LBE226-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB229-.Ltext0
	.quad	.LBE229-.Ltext0
	.quad	.LBB201-.Ltext0
	.quad	.LBE201-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB230-.Ltext0
	.quad	.LBE230-.Ltext0
	.quad	.LBB231-.Ltext0
	.quad	.LBE231-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB246-.Ltext0
	.quad	.LBE246-.Ltext0
	.quad	.LBB249-.Ltext0
	.quad	.LBE249-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB256-.Ltext0
	.quad	.LBE256-.Ltext0
	.quad	.LBB333-.Ltext0
	.quad	.LBE333-.Ltext0
	.quad	.LBB298-.Ltext0
	.quad	.LBE298-.Ltext0
	.quad	.LBB261-.Ltext0
	.quad	.LBE261-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB258-.Ltext0
	.quad	.LBE258-.Ltext0
	.quad	.LBB260-.Ltext0
	.quad	.LBE260-.Ltext0
	.quad	.LBB257-.Ltext0
	.quad	.LBE257-.Ltext0
	.quad	.LBB259-.Ltext0
	.quad	.LBE259-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB262-.Ltext0
	.quad	.LBE262-.Ltext0
	.quad	.LBB332-.Ltext0
	.quad	.LBE332-.Ltext0
	.quad	.LBB299-.Ltext0
	.quad	.LBE299-.Ltext0
	.quad	.LBB297-.Ltext0
	.quad	.LBE297-.Ltext0
	.quad	.LBB294-.Ltext0
	.quad	.LBE294-.Ltext0
	.quad	.LBB270-.Ltext0
	.quad	.LBE270-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB265-.Ltext0
	.quad	.LBE265-.Ltext0
	.quad	.LBB268-.Ltext0
	.quad	.LBE268-.Ltext0
	.quad	.LBB263-.Ltext0
	.quad	.LBE263-.Ltext0
	.quad	.LBB267-.Ltext0
	.quad	.LBE267-.Ltext0
	.quad	.LBB264-.Ltext0
	.quad	.LBE264-.Ltext0
	.quad	.LBB266-.Ltext0
	.quad	.LBE266-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB274-.Ltext0
	.quad	.LBE274-.Ltext0
	.quad	.LBB320-.Ltext0
	.quad	.LBE320-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB275-.Ltext0
	.quad	.LBE275-.Ltext0
	.quad	.LBB327-.Ltext0
	.quad	.LBE327-.Ltext0
	.quad	.LBB316-.Ltext0
	.quad	.LBE316-.Ltext0
	.quad	.LBB313-.Ltext0
	.quad	.LBE313-.Ltext0
	.quad	.LBB302-.Ltext0
	.quad	.LBE302-.Ltext0
	.quad	.LBB301-.Ltext0
	.quad	.LBE301-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB278-.Ltext0
	.quad	.LBE278-.Ltext0
	.quad	.LBB283-.Ltext0
	.quad	.LBE283-.Ltext0
	.quad	.LBB276-.Ltext0
	.quad	.LBE276-.Ltext0
	.quad	.LBB282-.Ltext0
	.quad	.LBE282-.Ltext0
	.quad	.LBB277-.Ltext0
	.quad	.LBE277-.Ltext0
	.quad	.LBB281-.Ltext0
	.quad	.LBE281-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB284-.Ltext0
	.quad	.LBE284-.Ltext0
	.quad	.LBB330-.Ltext0
	.quad	.LBE330-.Ltext0
	.quad	.LBB329-.Ltext0
	.quad	.LBE329-.Ltext0
	.quad	.LBB325-.Ltext0
	.quad	.LBE325-.Ltext0
	.quad	.LBB322-.Ltext0
	.quad	.LBE322-.Ltext0
	.quad	.LBB306-.Ltext0
	.quad	.LBE306-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB287-.Ltext0
	.quad	.LBE287-.Ltext0
	.quad	.LBB293-.Ltext0
	.quad	.LBE293-.Ltext0
	.quad	.LBB285-.Ltext0
	.quad	.LBE285-.Ltext0
	.quad	.LBB292-.Ltext0
	.quad	.LBE292-.Ltext0
	.quad	.LBB286-.Ltext0
	.quad	.LBE286-.Ltext0
	.quad	.LBB291-.Ltext0
	.quad	.LBE291-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB303-.Ltext0
	.quad	.LBE303-.Ltext0
	.quad	.LBB318-.Ltext0
	.quad	.LBE318-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB304-.Ltext0
	.quad	.LBE304-.Ltext0
	.quad	.LBB305-.Ltext0
	.quad	.LBE305-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB307-.Ltext0
	.quad	.LBE307-.Ltext0
	.quad	.LBB323-.Ltext0
	.quad	.LBE323-.Ltext0
	.quad	.LBB321-.Ltext0
	.quad	.LBE321-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB309-.Ltext0
	.quad	.LBE309-.Ltext0
	.quad	.LBB312-.Ltext0
	.quad	.LBE312-.Ltext0
	.quad	.LBB308-.Ltext0
	.quad	.LBE308-.Ltext0
	.quad	0x0
	.quad	0x0
	.section	.debug_str,"MS",@progbits,1
.LASF99:
	.string	"socklen_t"
.LASF50:
	.string	"st_ctim"
.LASF241:
	.string	"TimerStruct"
.LASF27:
	.string	"size_t"
.LASF114:
	.string	"sa_family"
.LASF140:
	.string	"sockaddr_in6"
.LASF193:
	.string	"expnfilename"
.LASF192:
	.string	"origfilename"
.LASF46:
	.string	"st_blksize"
.LASF47:
	.string	"st_blocks"
.LASF385:
	.string	"user"
.LASF292:
	.string	"handle_linger"
.LASF151:
	.string	"ai_addrlen"
.LASF122:
	.string	"SHUT_RDWR"
.LASF136:
	.string	"sin_family"
.LASF306:
	.string	"tnum"
.LASF138:
	.string	"sin_addr"
.LASF77:
	.string	"_IO_save_end"
.LASF265:
	.string	"linger_timer"
.LASF330:
	.string	"really_clear_connection"
.LASF9:
	.string	"__gid_t"
.LASF147:
	.string	"ai_flags"
.LASF176:
	.string	"no_empty_referers"
.LASF105:
	.string	"SOCK_RAW"
.LASF49:
	.string	"st_mtim"
.LASF26:
	.string	"time_t"
.LASF144:
	.string	"sin6_addr"
.LASF170:
	.string	"logfp"
.LASF70:
	.string	"_IO_write_base"
.LASF162:
	.string	"cgi_pattern"
.LASF382:
	.string	"do_global_passwd"
.LASF154:
	.string	"ai_next"
.LASF86:
	.string	"_lock"
.LASF263:
	.string	"active_at"
.LASF226:
	.string	"type"
.LASF36:
	.string	"stat"
.LASF75:
	.string	"_IO_save_base"
.LASF270:
	.string	"connecttab"
.LASF329:
	.string	"listen_fd"
.LASF153:
	.string	"ai_canonname"
.LASF79:
	.string	"_chain"
.LASF117:
	.string	"ss_family"
.LASF83:
	.string	"_cur_column"
.LASF304:
	.string	"aiv4"
.LASF303:
	.string	"aiv6"
.LASF338:
	.string	"handle_usr1"
.LASF341:
	.string	"handle_usr2"
.LASF239:
	.string	"ClientData"
.LASF7:
	.string	"__dev_t"
.LASF23:
	.string	"uid_t"
.LASF203:
	.string	"contenttype"
.LASF182:
	.string	"read_idx"
.LASF286:
	.string	"atoi"
.LASF291:
	.string	"secs"
.LASF163:
	.string	"cgi_limit"
.LASF397:
	.string	"stats_connections"
.LASF56:
	.string	"passwd"
.LASF225:
	.string	"contentlength"
.LASF108:
	.string	"SOCK_DCCP"
.LASF6:
	.string	"long int"
.LASF106:
	.string	"SOCK_RDM"
.LASF178:
	.string	"initialized"
.LASF171:
	.string	"no_symlink_check"
.LASF228:
	.string	"mime_flag"
.LASF316:
	.string	"oldstr"
.LASF373:
	.string	"httpd_err408form"
.LASF62:
	.string	"pw_dir"
.LASF392:
	.string	"first_free_connect"
.LASF95:
	.string	"_IO_marker"
.LASF410:
	.string	"main"
.LASF351:
	.string	"__s2_len"
.LASF318:
	.string	"read_config"
.LASF358:
	.string	"handle_send"
.LASF335:
	.string	"up_secs"
.LASF190:
	.string	"decodedurl"
.LASF359:
	.string	"max_bytes"
.LASF160:
	.string	"server_hostname"
.LASF405:
	.string	"/u/eng/class/classhli/tmp/sthttpd-2.27.0/src"
.LASF253:
	.string	"min_limit"
.LASF290:
	.string	"thttpd_logstats"
.LASF63:
	.string	"pw_shell"
.LASF4:
	.string	"signed char"
.LASF18:
	.string	"__blksize_t"
.LASF123:
	.string	"uint8_t"
.LASF374:
	.string	"httpd_err503title"
.LASF65:
	.string	"_IO_FILE"
.LASF319:
	.string	"filename"
.LASF41:
	.string	"st_uid"
.LASF107:
	.string	"SOCK_SEQPACKET"
.LASF317:
	.string	"newstr"
.LASF0:
	.string	"unsigned char"
.LASF223:
	.string	"if_modified_since"
.LASF44:
	.string	"st_rdev"
.LASF394:
	.string	"terminate"
.LASF343:
	.string	"occasional"
.LASF61:
	.string	"pw_gecos"
.LASF289:
	.string	"clear_throttles"
.LASF357:
	.string	"handle_read"
.LASF177:
	.string	"httpd_server"
.LASF145:
	.string	"sin6_scope_id"
.LASF267:
	.string	"bytes"
.LASF235:
	.string	"should_linger"
.LASF208:
	.string	"remoteuser"
.LASF301:
	.string	"portstr"
.LASF311:
	.string	"value"
.LASF407:
	.string	"__socket_type"
.LASF295:
	.string	"sa4_len"
.LASF20:
	.string	"char"
.LASF103:
	.string	"SOCK_STREAM"
.LASF180:
	.string	"read_buf"
.LASF118:
	.string	"__ss_align"
.LASF166:
	.string	"max_age"
.LASF346:
	.string	"parse_args"
.LASF401:
	.string	"got_usr1"
.LASF219:
	.string	"maxhostdir"
.LASF252:
	.string	"max_limit"
.LASF207:
	.string	"authorization"
.LASF406:
	.string	"_IO_lock_t"
.LASF135:
	.string	"sockaddr_in"
.LASF32:
	.string	"timeval"
.LASF372:
	.string	"httpd_err408title"
.LASF137:
	.string	"sin_port"
.LASF100:
	.string	"timezone"
.LASF381:
	.string	"do_vhost"
.LASF313:
	.string	"wakeup_connection"
.LASF11:
	.string	"__mode_t"
.LASF255:
	.string	"bytes_since_avg"
.LASF309:
	.string	"no_value_required"
.LASF183:
	.string	"checked_idx"
.LASF67:
	.string	"_IO_read_ptr"
.LASF211:
	.string	"maxorigfilename"
.LASF362:
	.string	"newlen"
.LASF142:
	.string	"sin6_port"
.LASF98:
	.string	"_pos"
.LASF21:
	.string	"__socklen_t"
.LASF367:
	.string	"stdin"
.LASF139:
	.string	"sin_zero"
.LASF361:
	.string	"elapsed"
.LASF350:
	.string	"__s1_len"
.LASF78:
	.string	"_markers"
.LASF354:
	.string	"throttlefile"
.LASF164:
	.string	"cgi_count"
.LASF172:
	.string	"vhost"
.LASF278:
	.string	"__accept3"
.LASF231:
	.string	"tildemapped"
.LASF334:
	.string	"logstats"
.LASF296:
	.string	"gotv4P"
.LASF33:
	.string	"tv_usec"
.LASF127:
	.string	"in_addr_t"
.LASF159:
	.string	"binding_hostname"
.LASF254:
	.string	"rate"
.LASF307:
	.string	"cnum"
.LASF236:
	.string	"conn_fd"
.LASF185:
	.string	"method"
.LASF233:
	.string	"last_byte_index"
.LASF87:
	.string	"_offset"
.LASF221:
	.string	"maxresponse"
.LASF42:
	.string	"st_gid"
.LASF355:
	.string	"re_open_logfile"
.LASF258:
	.string	"conn_state"
.LASF245:
	.string	"periodic"
.LASF370:
	.string	"httpd_err400title"
.LASF321:
	.string	"__a0"
.LASF322:
	.string	"__a1"
.LASF323:
	.string	"__a2"
.LASF383:
	.string	"logfile"
.LASF396:
	.string	"stats_time"
.LASF3:
	.string	"long unsigned int"
.LASF186:
	.string	"status"
.LASF81:
	.string	"_flags2"
.LASF120:
	.string	"SHUT_RD"
.LASF45:
	.string	"st_size"
.LASF299:
	.string	"gotv6P"
.LASF69:
	.string	"_IO_read_base"
.LASF244:
	.string	"msecs"
.LASF411:
	.string	"sigset"
.LASF320:
	.string	"line"
.LASF94:
	.string	"_unused2"
.LASF328:
	.string	"handle_newconnect"
.LASF148:
	.string	"ai_family"
.LASF149:
	.string	"ai_socktype"
.LASF332:
	.string	"linger_clear_connection"
.LASF55:
	.string	"iov_len"
.LASF165:
	.string	"charset"
.LASF347:
	.string	"argc"
.LASF230:
	.string	"got_range"
.LASF82:
	.string	"_old_offset"
.LASF349:
	.string	"argn"
.LASF272:
	.string	"__strspn_c1"
.LASF273:
	.string	"__strspn_c2"
.LASF277:
	.string	"__strspn_c3"
.LASF19:
	.string	"__blkcnt_t"
.LASF218:
	.string	"maxreqhost"
.LASF195:
	.string	"pathinfo"
.LASF101:
	.string	"tz_minuteswest"
.LASF204:
	.string	"reqhost"
.LASF10:
	.string	"__ino_t"
.LASF352:
	.string	"__s1"
.LASF371:
	.string	"httpd_err400form"
.LASF264:
	.string	"wakeup_timer"
.LASF130:
	.string	"__u6_addr8"
.LASF191:
	.string	"protocol"
.LASF375:
	.string	"httpd_err503form"
.LASF35:
	.string	"long long int"
.LASF404:
	.string	"thttpd.c"
.LASF262:
	.string	"started_at"
.LASF53:
	.string	"iovec"
.LASF256:
	.string	"num_sending"
.LASF72:
	.string	"_IO_write_end"
.LASF179:
	.string	"client_addr"
.LASF393:
	.string	"httpd_conn_count"
.LASF300:
	.string	"hints"
.LASF403:
	.string	"GNU C 4.4.7 20120313 (Red Hat 4.4.7-11)"
.LASF274:
	.string	"__accept1"
.LASF275:
	.string	"__accept2"
.LASF271:
	.string	"__accept"
.LASF175:
	.string	"local_pattern"
.LASF232:
	.string	"first_byte_index"
.LASF282:
	.string	"__reject1"
.LASF283:
	.string	"__reject2"
.LASF285:
	.string	"__reject3"
.LASF73:
	.string	"_IO_buf_base"
.LASF2:
	.string	"unsigned int"
.LASF314:
	.string	"handle_hup"
.LASF268:
	.string	"end_byte_index"
.LASF43:
	.string	"__pad0"
.LASF59:
	.string	"pw_uid"
.LASF89:
	.string	"__pad2"
.LASF90:
	.string	"__pad3"
.LASF91:
	.string	"__pad4"
.LASF92:
	.string	"__pad5"
.LASF97:
	.string	"_sbuf"
.LASF25:
	.string	"pid_t"
.LASF409:
	.string	"check_throttles"
.LASF269:
	.string	"next_byte_index"
.LASF202:
	.string	"cookie"
.LASF17:
	.string	"__suseconds_t"
.LASF111:
	.string	"SOCK_NONBLOCK"
.LASF391:
	.string	"max_connects"
.LASF240:
	.string	"TimerProc"
.LASF121:
	.string	"SHUT_WR"
.LASF217:
	.string	"maxaccepte"
.LASF327:
	.string	"e_strdup"
.LASF66:
	.string	"_flags"
.LASF302:
	.string	"gaierr"
.LASF215:
	.string	"maxquery"
.LASF93:
	.string	"_mode"
.LASF279:
	.string	"__strcspn_c1"
.LASF281:
	.string	"__strcspn_c2"
.LASF284:
	.string	"__strcspn_c3"
.LASF213:
	.string	"maxencodings"
.LASF133:
	.string	"in6_addr"
.LASF39:
	.string	"st_nlink"
.LASF24:
	.string	"off_t"
.LASF376:
	.string	"JunkClientData"
.LASF398:
	.string	"stats_bytes"
.LASF356:
	.string	"retchmod"
.LASF51:
	.string	"__unused"
.LASF379:
	.string	"data_dir"
.LASF344:
	.string	"handle_alrm"
.LASF196:
	.string	"query"
.LASF345:
	.string	"handle_chld"
.LASF200:
	.string	"accepte"
.LASF152:
	.string	"ai_addr"
.LASF201:
	.string	"acceptl"
.LASF141:
	.string	"sin6_family"
.LASF64:
	.string	"FILE"
.LASF15:
	.string	"__pid_t"
.LASF37:
	.string	"st_dev"
.LASF229:
	.string	"one_one"
.LASF31:
	.string	"timespec"
.LASF104:
	.string	"SOCK_DGRAM"
.LASF174:
	.string	"url_pattern"
.LASF360:
	.string	"coast"
.LASF34:
	.string	"long long unsigned int"
.LASF112:
	.string	"sa_family_t"
.LASF158:
	.string	"httpd_sockaddr"
.LASF260:
	.string	"tnums"
.LASF124:
	.string	"uint16_t"
.LASF13:
	.string	"__off_t"
.LASF308:
	.string	"update_throttles"
.LASF155:
	.string	"sa_in"
.LASF115:
	.string	"sa_data"
.LASF259:
	.string	"next_free_connect"
.LASF384:
	.string	"pidfile"
.LASF340:
	.string	"show_stats"
.LASF400:
	.string	"got_hup"
.LASF222:
	.string	"responselen"
.LASF378:
	.string	"debug"
.LASF113:
	.string	"sockaddr"
.LASF16:
	.string	"__time_t"
.LASF146:
	.string	"addrinfo"
.LASF227:
	.string	"hostname"
.LASF280:
	.string	"__reject"
.LASF238:
	.string	"httpd_conn"
.LASF76:
	.string	"_IO_backup_base"
.LASF85:
	.string	"_shortbuf"
.LASF60:
	.string	"pw_gid"
.LASF210:
	.string	"maxdecodedurl"
.LASF386:
	.string	"throttles"
.LASF387:
	.string	"numthrottles"
.LASF294:
	.string	"sa4P"
.LASF198:
	.string	"useragent"
.LASF96:
	.string	"_next"
.LASF14:
	.string	"__off64_t"
.LASF128:
	.string	"in_addr"
.LASF388:
	.string	"maxthrottles"
.LASF333:
	.string	"finish_connection"
.LASF348:
	.string	"argv"
.LASF337:
	.string	"shut_down"
.LASF336:
	.string	"stats_secs"
.LASF377:
	.string	"argv0"
.LASF188:
	.string	"bytes_sent"
.LASF74:
	.string	"_IO_buf_end"
.LASF363:
	.string	"num_ready"
.LASF288:
	.string	"tind"
.LASF134:
	.string	"__in6_u"
.LASF110:
	.string	"SOCK_CLOEXEC"
.LASF310:
	.string	"name"
.LASF161:
	.string	"port"
.LASF353:
	.string	"read_throttlefile"
.LASF276:
	.string	"__result"
.LASF109:
	.string	"SOCK_PACKET"
.LASF366:
	.string	"pidfp"
.LASF119:
	.string	"__ss_padding"
.LASF116:
	.string	"sockaddr_storage"
.LASF369:
	.string	"stderr"
.LASF5:
	.string	"short int"
.LASF197:
	.string	"referer"
.LASF251:
	.string	"pattern"
.LASF339:
	.string	"handle_term"
.LASF220:
	.string	"maxremoteuser"
.LASF380:
	.string	"do_chroot"
.LASF30:
	.string	"tv_nsec"
.LASF297:
	.string	"sa6P"
.LASF408:
	.string	"usage"
.LASF84:
	.string	"_vtable_offset"
.LASF331:
	.string	"clear_connection"
.LASF58:
	.string	"pw_passwd"
.LASF342:
	.string	"idle"
.LASF167:
	.string	"listen4_fd"
.LASF52:
	.string	"__sighandler_t"
.LASF389:
	.string	"connects"
.LASF199:
	.string	"accept"
.LASF168:
	.string	"listen6_fd"
.LASF390:
	.string	"num_connects"
.LASF287:
	.string	"__nptr"
.LASF209:
	.string	"response"
.LASF266:
	.string	"wouldblock_delay"
.LASF184:
	.string	"checked_state"
.LASF261:
	.string	"numtnums"
.LASF156:
	.string	"sa_in6"
.LASF402:
	.string	"watchdog_flag"
.LASF57:
	.string	"pw_name"
.LASF40:
	.string	"st_mode"
.LASF8:
	.string	"__uid_t"
.LASF187:
	.string	"bytes_to_send"
.LASF68:
	.string	"_IO_read_end"
.LASF205:
	.string	"hdrhost"
.LASF129:
	.string	"s_addr"
.LASF234:
	.string	"keep_alive"
.LASF131:
	.string	"__u6_addr16"
.LASF194:
	.string	"encodings"
.LASF125:
	.string	"uint32_t"
.LASF80:
	.string	"_fileno"
.LASF102:
	.string	"tz_dsttime"
.LASF216:
	.string	"maxaccept"
.LASF315:
	.string	"oerrno"
.LASF212:
	.string	"maxexpnfilename"
.LASF395:
	.string	"start_time"
.LASF242:
	.string	"timer_proc"
.LASF1:
	.string	"short unsigned int"
.LASF368:
	.string	"stdout"
.LASF250:
	.string	"Timer"
.LASF224:
	.string	"range_if"
.LASF54:
	.string	"iov_base"
.LASF293:
	.string	"lookup_hostname"
.LASF257:
	.string	"throttletab"
.LASF305:
	.string	"nowP"
.LASF71:
	.string	"_IO_write_ptr"
.LASF246:
	.string	"time"
.LASF243:
	.string	"client_data"
.LASF28:
	.string	"int64_t"
.LASF298:
	.string	"sa6_len"
.LASF364:
	.string	"gotv4"
.LASF365:
	.string	"gotv6"
.LASF324:
	.string	"__r0"
.LASF325:
	.string	"__r1"
.LASF326:
	.string	"__r2"
.LASF173:
	.string	"global_passwd"
.LASF132:
	.string	"__u6_addr32"
.LASF38:
	.string	"st_ino"
.LASF12:
	.string	"__nlink_t"
.LASF169:
	.string	"no_log"
.LASF249:
	.string	"hash"
.LASF157:
	.string	"sa_stor"
.LASF143:
	.string	"sin6_flowinfo"
.LASF248:
	.string	"next"
.LASF22:
	.string	"gid_t"
.LASF88:
	.string	"__pad1"
.LASF237:
	.string	"file_address"
.LASF247:
	.string	"prev"
.LASF29:
	.string	"tv_sec"
.LASF150:
	.string	"ai_protocol"
.LASF126:
	.string	"in_port_t"
.LASF399:
	.string	"stats_simultaneous"
.LASF214:
	.string	"maxpathinfo"
.LASF312:
	.string	"value_required"
.LASF181:
	.string	"read_size"
.LASF48:
	.string	"st_atim"
.LASF206:
	.string	"hostdir"
.LASF189:
	.string	"encodedurl"
	.ident	"GCC: (GNU) 4.4.7 20120313 (Red Hat 4.4.7-11)"
	.section	.note.GNU-stack,"",@progbits
