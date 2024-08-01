global _start

section .data     ; här är för att hålla variabler
    welcome db 0dh, 0ah, 0dh, 0ah, " ****** Welcome to this calculator! ****** ", 0dh, 0ah, 0dh, 0ah
    welcome_length equ $-welcome
    choice db "Please make your choice: ", 0dh, 0ah
    choice_length equ $-choice
    operator db "1. Add", 0dh, 0ah, "2. Subtract", 0dh, 0ah, "3. Multiply", 0dh, 0ah, "4. Divide", 0dh, 0ah, "5. Exit", 10 
    operators_length equ $-operator  ; definierar längden för meddelandet
    tmp db 0, 0                      ; tmp variabel för input

section .text    ; den faktiska koden

_start:          ; typ som main i vanliga fall
    call welcome_message
    call get_choice
    call operators

    ; exit program
    mov rax, 60          ; system call for exit
    xor rdi, rdi         ; exit code 0
    syscall

welcome_message:
    mov rax, 1            ; system call for write
    mov rdi, 1            ; file descriptor 1 är stdout
    mov rsi, welcome      ; pekare till välkomstmeddelandet
    mov rdx, welcome_length ; längd på välkomstmeddelandet
    syscall               ; anropa systemet för att skriva ut meddelandet
    ret                   ; returnera

get_choice:
    mov rax, 1            ; system call for write
    mov rdi, 1            ; file descriptor 1 är stdout
    mov rsi, choice       ; pekare till valmeddelandet
    mov rdx, choice_length ; längd på valmeddelandet
    syscall               ; anropa systemet för att skriva ut meddelandet
    ret                   ; returnera

operators:
    mov rax, 1            ; system call for write
    mov rdi, 1            ; file descriptor 1 är stdout
    mov rsi, operator     ; pekare till operatormeddelandet
    mov rdx, operators_length ; längd på operatormeddelandet
    syscall               ; anropa systemet för att skriva ut meddelandet
    ret                   ; returnera

get_input:
    mov rax, 0            ; system call for read
    mov rdi, 0            ; file descriptor 0 är stdin
    mov rsi, tmp          ; pekare till tmp
    mov rdx, 2            ; antal byte att läsa
    syscall               ; anropa systemet för att läsa input
    ret                   ; returnera
