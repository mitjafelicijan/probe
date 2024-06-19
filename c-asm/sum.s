.intel_syntax noprefix

.global sum

.text

sum:
	add rdi, rsi
	mov rax, rdi
	ret

