STD_OUTPUT_HANDLE   equ -11
NULL                equ 0

global GobleyGook
extern ExitProcess, GetStdHandle, WriteConsoleA

section .data
;msg				db "a", 10, 13, 0
;length				equ 4
num					equ 48

section .bss
dummy               resd 1
a					resd 1
msg					resb 6
lmsg				equ $ - msg
;msg_end				equ msg+lmsg-3

section .text
start:
	;mov edi, msg_end
	;mov esi, 3940h
	;call hex32tostr
	mov ebx, 2
	call num2str
	mov byte [msg], al
	mov byte [msg + 1], 32
	mov byte [a], 1
	mov ebx, 1
	call num2str
	mov byte [msg + 2], al
	mov byte [a], 4
	mov ebx, 4
	call num2str
	mov byte [msg + 3], al
	mov byte [msg + 4], 10
	mov byte [msg + 5], 13

	xor eax, eax

    push    STD_OUTPUT_HANDLE
    call    GetStdHandle
	push    NULL
    push    dummy
    push    lmsg
    push    msg
    push    eax
    call    WriteConsoleA 

    push    NULL
    call    ExitProcess


add:
	mov eax, [esp+4] ;first variable in stack
	add eax, [esp+8]
	ret

num2str:
	mov eax, ebx
	add eax, num
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; hex32tostr                                       ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Description:                                     ;
;   Takes a 32bit value and converts it to         ;
;   an ASCII string.                               ;
; Usage and Effects:                               ;
;   EAX: DESTROYED upon return.                    ;
;   ECX: DESTROYED upon return.                    ;
;   ESI: 32bit input value. DESTROYED upon return. ;
;   EDI: On function call, must be set to point to ;
;        the last character in the output buffer.  ;
;        Function will decrement EDI for each char ;
;        written, totalling 8 times. EDI will be   ;
;        pointing to the character preceding the   ;
;        start of the output buffer upon return.   ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
hex32tostr:
    xor ecx, ecx
.loop:
    mov eax, esi
    and eax, dword 0fh
    add eax, 030h
    cmp eax, 039h
    jle .nonalpha
    add eax, 7
.nonalpha:
    mov byte [edi], al
    add ecx, 4
    dec edi
    shr esi, 4
    cmp ecx, 32
    jl .loop
    ret