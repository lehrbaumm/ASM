STD_OUTPUT_HANDLE   equ -11
NULL                equ 0

global GobleyGook
extern ExitProcess, GetStdHandle, WriteConsoleA, GetCommandLineA, lstrlen, CommandLineToArgvW

section .data
hmsg				db "Usage test4.exe number1 number2", 10, 13, 0
lhmsg				equ $ - hmsg
newline				db 10, 13
lnw					equ $ - newline

section .bss
Handle				resd 1
ARGV				resd 1
ARGC				resd 1
msg					resd 128
lmsg				equ  128
dummy				resb 4

section .text
start:
	call get_out_handle
	call get_args
	add dword [ARGC], 48
	push NULL
	push dummy
	push 2
	push ARGC
	push Handle
	call WriteConsoleA
	call lstrlen
	push eax
	pop ebx
	call wr_newline
	;call help
	
	
start_end:
    push    NULL
    call    ExitProcess

get_args:
	call GetCommandLineA
	push eax
	push ARGC
	call CommandLineToArgvW
	mov [ARGV], eax
	ret
	
get_out_handle:
	push STD_OUTPUT_HANDLE
	call GetStdHandle
	mov [Handle], eax
	ret

wr_newline:
	push NULL
	push dummy
	push lnw
	push newline
	push Handle
	call WriteConsoleA
	ret
	

num2str:
	; eax points to memory number in decimal convert to a string number
	
	ret

help:
	push    STD_OUTPUT_HANDLE
    call    GetStdHandle
	push    NULL
    push    dummy
    push    lhmsg
    push    hmsg
    push    Handle
    call    WriteConsoleA 
	ret