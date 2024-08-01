; section .data
;     hello db 'Hello, World!',0

; section .text
;     global _start

; _start:
;     ; Write "Hello, World!" to stdout
;     mov rax, 1              ; system call for write
;     mov rdi, 1              ; file descriptor 1 is stdout
;     mov rsi, hello          ; address of string to output
;     mov rdx, 13             ; number of bytes
;     syscall                 ; invoke operating system to do the write

;     ; Exit program
;     mov rax, 60             ; system call for exit
;     xor rdi, rdi            ; exit code 0
;     syscall                 ; invoke operating system to exit
