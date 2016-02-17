;nasm -f win32 Arguments.asm
;golink /Console /Entry Main Arguments.obj kernel32.dll

STD_OUTPUT_HANDLE equ -11
NULL equ 0

AF_INET equ 2
AF_INET6 equ 23
AF_BTH equ 32

SOCK_STREAM equ 1
SOCK_DGRAM equ 2
SOCK_RAW equ 3

IPPROTO_ICMP equ 1
IPPROTO_TCP equ 6
IPPROTO_UDP equ 17

BTHPROT_RFCOMM equ 3

VERSION equ 0x202

WSADESCRIPTION_LEN equ 256
WSASYS_STATUS_LEN equ 128

STRUC WSADATA
	.wVersion	resw	1
	.wHighVersion	resw	1
	.szDecsription resb WSADESCRIPTION_LEN + 1
	.szSystemStatus	resb	WSASYS_STATUS_LEN + 1
	.iMaxSockets	resw	1
	.iMaxUdpDg	resw	1
	.IpVendorInfo	resd	1
ENDSTRUC

global Main

;kernel32.dll
extern GetStdHandle, WriteConsoleA, ExitProcess
;Ws2_32.dll
extern socket, WSAStartup

section .data
	Hello		db	"Welcome to first Socket",10,0
	HelloLength		equ	$ - Hello

section .bss
	wsdata	resb WSADATA_size
	Handle		resd	1
	Socket1		resd	1
	Last		resd	1
	dummy		resd	1
	Error		resb	10
	Done		resb	9


section .code

	Main:
		call GetHandle
		call HelloMessage
		call GetSocketLib
		call CreateSocket
		call Exit

	HelloMessage:
		push NULL
		push dummy
		push HelloLength
		push Hello
		push dword [Handle]
		call WriteConsoleA
		ret

	GetHandle:
		push STD_OUTPUT_HANDLE
		call GetStdHandle
		mov [Handle], eax
		ret

	GetSocketLib:
		mov eax, "W"
		mov [Last], al
		mov al, "S"
		mov [Last + 1], al
		mov al, "A"
		mov [Last + 2], al
		mov al, 10
		mov [Last + 3], al
		push dword wsdata
		push 101h
		call WSAStartup
		cmp eax, NULL
		je doneWSA
		call ErrorMessage
		doneWSA:
		call DoneMessage
		ret

	CreateSocket:
		push IPPROTO_TCP
		push SOCK_STREAM
		push AF_INET
		call socket
		mov [Socket1], eax
		ret

	DoneMessage:
		mov al, "D"
		mov [Done], al
		mov al, "O"
		mov [Done+1], al
		mov al, "N"
		mov [Done+2], al
		mov al, "E"
		mov [Done+3], al
		mov al, 32
		mov [Done+4], al
		mov al, [Last]
		mov [Done+5], al
		mov al, [Last+1]
		mov [Done+6], al
		mov al, [Last+2]
		mov [Done+7], al
		mov al, [Last+3]
		mov [Done+8], al
		push NULL
		push dummy
		push 9
		push dword Done
		push dword [Handle]
		call WriteConsoleA
		ret

	ErrorMessage:
		mov al, "E"
		mov [Error], al
		mov al, "R"
		mov [Error+1], al
		mov al, "R"
		mov [Error+2], al
		mov al, "O"
		mov [Error+3], al
		mov al, "R"
		mov [Error+4], al
		mov al, 32
		mov [Error+5], al
		mov al, [Last]
		mov [Error+6], al
		mov al, [Last+1]
		mov [Error+7], al
		mov al, [Last+2]
		mov [Error+8], al
		mov al, [Last+3]
		mov [Error+9], al
		push NULL
		push dummy
		push 10
		push dword Error
		push dword [Handle]
		call WriteConsoleA
		call Exit

	Exit:
		push NULL
		call ExitProcess
