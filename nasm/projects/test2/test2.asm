STD_OUTPUT_HANDLE   equ -11
NULL                equ 0

global GobleyGook
extern ExitProcess, GetStdHandle, WriteConsoleA, GetCommandLineA, lstrlen

section .data
num					equ 48
hmsg				db "Usage test2.exe number1 number2", 10, 13, 7, 0
lhmsg				equ $ - hmsg

section .bss
dummy               resd 1
msg					resb 3
lmsg				equ $ - msg
;msg_end				equ msg+lmsg-3

section .text
start:
	call GetCommandLineA
	mov edx, eax ;edx points to a string, where the console call is saved
	push edx
	call lstrlen
	mov ebx, eax
	add edx, ebx
	sub edx, 2
	call num2str ; numbers bigger than 9?
	mov byte [msg], al
	mov byte [msg + 1], 10
	mov byte [msg + 2], 13

    push    STD_OUTPUT_HANDLE
    call    GetStdHandle
	push    NULL
    push    dummy
    push    lmsg
    push    msg
    push    eax
    call    WriteConsoleA 
start_end:
    push    NULL
    call    ExitProcess


add:
	mov eax, ebx
	add eax, ecx
	ret

num2str:
	mov eax, ebx
	add eax, num
	ret

help:
	push    STD_OUTPUT_HANDLE
    call    GetStdHandle
	push    NULL
    push    dummy
    push    lhmsg
    push    hmsg
    push    eax
    call    WriteConsoleA 
	ret