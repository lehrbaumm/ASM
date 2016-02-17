;nasm -f win32 Arguments.asm
;golink /Console /Entry Main Arguments.obj kernel32.dll

STD_OUTPUT_HANDLE equ -11
NULL equ 0

CD_TYPE equ 5

global Main

;kernel32.dll
extern ExitProcess, WriteConsoleA, GetStdHandle, GetDriveTypeA, MessageBoxA

section .data
	Drive		db	"ABCDEFGHIJKLMNOPQRSTUVWXYZ",0

section .bss
	Handle		resd	1
	dummy		resd	1
	du			resb	3
	cdDrive resb	1
	DrivePath	resb	5


section .code

	Main:
		call GetHandle
		call GetType
		call Exit

	GetHandle:
		push STD_OUTPUT_HANDLE
		call GetStdHandle
		mov [Handle], eax
		ret


	GetType:
		mov ecx, 65
		ll:
			push ecx
			mov al, cl
			mov [du], al
			mov al, 58
			mov [du+1], al
			mov al, 92
			mov [du+2], al
			push NULL
			push dummy
			push 4
			push du
			push dword [Handle]
			call WriteConsoleA
			push du
			call GetDriveTypeA
			cmp eax, CD_TYPE
			jne end
				mov al, [du]
				mov [cdDrive], al
				call MessageCD
				pop ecx
				mov ecx, 90
				push ecx
			end:
			pop ecx
			inc ecx
		cmp ecx, 91
		jne ll
		ret

	MessageCD:
		mov al, 92
		mov [DrivePath], al
		mov al, 92
		mov [DrivePath+1], al
		mov al, 46
		mov [DrivePath+2], al
		mov al, 92
		mov [DrivePath+3], al
		mov al, [cdDrive]
		mov [DrivePath+4], al
		ret

	Exit:
		push NULL
		call ExitProcess
