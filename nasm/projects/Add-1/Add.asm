;nasm -f win32 Arguments.asm
;golink /Console /Entry Main Arguments.obj kernel32.dll

STD_OUTPUT_HANDLE equ -11
NULL equ 0

global Main

;kernel32.dll
extern ExitProcess, GetStdHandle, WriteConsoleA, GetCommandLineA, lstrlen

section .data
	helpmsg		db	"Usage Arguments.exe [args...]"
	lenhelpmsg	equ	$ - helpmsg
	newline		db	13, 10
	lennewline	equ	$ - newline

section .bss
	Handle		resd	1
	ARGS		resd	1
	dummy		resd	2
	counter		resd	1
	first		resd	1
	second		resd	1
	solution	resd	1

section .code
	Main:
		call register_out_handle
		call wr_help
		call wr_newline
		call get_args
		call len_args
		call wr_args
		call wr_newline
		call get_first
		call wr_first
		call wr_newline
		call get_second
		call wr_second
		call wr_newline
		call addition
		call Exit

	register_out_handle:
		push STD_OUTPUT_HANDLE
		call GetStdHandle
		mov [Handle], eax
		ret

	addition:
		mov dword eax, [first]
		mov dword ebx, [second]
		mov ebx, [ebx]
		sub ebx, 48
		add dword [eax], ebx
		mov [solution], eax
		push NULL
		push dummy
		push 1
		push dword [solution]
		push dword [Handle]
		call WriteConsoleA
		ret

	Exit:
		push NULL
		call ExitProcess

	get_args:
		call GetCommandLineA
		mov [ARGS], eax
		ret

	len_args:
		push dword [ARGS]
		call lstrlen
		mov [counter], eax
		ret


	wr_args:
		push NULL
		push dummy
		push dword [counter]
		push dword [ARGS]
		push dword [Handle]
		call WriteConsoleA
		ret

	get_first:
		mov dword eax, [ARGS]
		mov dword ebx, [counter]
		sub ebx, 3
		add dword eax, ebx
		mov [first], eax
		ret

	wr_first:
		push NULL
		push dummy
		push 1
		push dword [first]
		push dword [Handle]
		call WriteConsoleA
		ret

	get_second:
		mov dword eax, [ARGS]
		mov dword ebx, [counter]
		dec ebx
		add dword eax, ebx
		mov [second], eax
		ret

	wr_second:
		push NULL
		push dummy
		push 1
		push dword [second]
		push dword [Handle]
		call WriteConsoleA
		ret

	wr_newline:
		push NULL
		push dummy
		push lennewline
		push newline
		push dword [Handle]
		call WriteConsoleA
		ret

	wr_help:
		push NULL
		push dummy
		push lenhelpmsg
		push helpmsg
		push dword [Handle]
		call WriteConsoleA
		ret
