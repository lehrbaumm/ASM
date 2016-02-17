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
msg					resb 6
lmsg				equ $ - msg
;msg_end				equ msg+lmsg-3
amount				resb 4
arguments			resb 2
count				resb 4

section .text
start:
	call GetCommandLineA
	mov edx, eax ;edx points to a string, where the console call is saved
	push edx
	call lstrlen
	push eax
	call num2str ; numbers bigger than 9?
	mov eax, [amount]
	mov byte [msg], al
	mov eax, [amount+1]
	mov byte [msg+1], al
	mov eax, [amount+2]
	mov byte [msg+2], al
	mov eax, [amount+3]
	mov byte [msg+3], al
	mov byte [msg + 4], 10
	mov byte [msg + 5], 13

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

num2str:
	mov ebx, [esp + 4]
	cmp ebx, 10
	mov dword [count], 0
	jge loop
	mov dword [amount+3], ebx
	add dword [amount+3], num
	jmp end
	loop:
	sub ebx, 10
	add byte [count], 4
	mov dword [amount+2], 49
	cmp ebx, 10
	jge loop
	ret
	end:
	mov edx, [esp]
	add edx, 8
	mov [esp], edx
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