;nasm -f win32 Arguments.asm
;golink /Console /Entry Main Arguments.obj kernel32.dll

HIDE equ 0
SHOW equ 5
NULL equ 0
MILISEC equ 1
MILISEC2 equ 10

GENERICREAD equ 0x80000000
OPENEXISTING equ 3
IOCTL_CDROM_EJECT_DRIVE equ 0x24808
IOCTL_CDROM_LOAD_MEDIA equ 0x2480c
FILE_SHARE_WRITE equ 0x00000002

INVALID_HANDLE_VALUE equ -1

CD_TYPE equ 5


Volume_UP equ 0xAF
Volume_DOWN equ 0xAE
Volume_MUTE equ 0xAD
BeepWave equ 0x7FFF

GENERIC_READ_WRITE	equ	0xC0000000
IOCTL_VIDEO_SET_DISPLAY_BRIGHTNESS	equ 0x23049c
MAXIMUM_BRIGHTNESS	equ 100
Bitmask equ 0x63
BitMaskPower equ 0x00FF0000

global Main

;kernel32.dll
extern ExitProcess, GetConsoleWindow, Sleep, FreeConsole
;IOCTL
extern CloseHandle, CreateFileA, DeviceIoControl, GetSystemPowerStatus, GetLastError, GetDriveTypeA
;Volume
extern keybd_event, Beep
;User32.dll
extern ShowWindow, MessageBoxA

section .data
	Drive		db	"\\.\E:",0
	FunString	db	"Done",0
	ErrorString	db	"Error!",0
	Laptop	db	"Laptop",0
	PC			db	"PC",0
	Display	db	"\\.\LCD",0
	ErrorCD	db	"Error with CD",0

section .bss
	Handle		resd	1
	CDHandle	resd	1
	dummy			resd	1
	Power_State	resd	1
	Frequenzy	resd 	1
	Counter 	resd	1
	MonitorHandle	resd		1
	Brightness resd	4
	dummy2		resd 128

	du			resb	3
	cdDrive resb	1
	DrivePath	resb	6


section .code

	Main:
		call get_console_handle
		call FreeConsole
		call Hide
		call VolumeZero
		call VolumeFun
		;call VolumeMute_1
		call VolumeUp_1
		;call VolumeMute_1
		;call BeepLoop
		call sleep_window
		call Get_CD
		call Get_Power
		call close_cd_handle
		call GetMHandle
		call DisplayFun
		call Close_MHandle
		;call MessageBox
		call Exit

	GetMHandle:
		push NULL
		push NULL
		push OPENEXISTING
		push NULL
		push NULL
		push GENERIC_READ_WRITE
		push Display
		call CreateFileA
		mov [MonitorHandle], eax
		ret

	DisplayFun:
		mov dword [Counter], 200
		lopD:
			call SetBrightness
			call sleep_window2
			dec dword [Counter]
		cmp dword [Counter], 0
		jne lopD
		ret

	SetBrightness:
		rdtsc
		and eax, Bitmask
		mov bh, 2
		mov [Brightness], bh
		mov [Brightness+1], al
		mov [Brightness+2], al
		push NULL
		push dword [dummy2]
		push NULL
		push NULL
		push 3
		push dword Brightness
		push IOCTL_VIDEO_SET_DISPLAY_BRIGHTNESS
		push dword [MonitorHandle]
		call DeviceIoControl
		ret

	Close_MHandle:
		push dword [MonitorHandle]
		call CloseHandle
		ret

	VolumeZero:
		mov ebx, 60
		lop:
			call VolumeDown_1
			call sleep_window
			dec ebx
		cmp ebx, 0
		jne lop
		ret

	VolumeFun:
		mov ebx, 20
		FunLoop:
			call VolumeUp_1
			call sleep_window
			dec ebx
		cmp ebx, 0
		jne FunLoop
		ret

	VolumeMute_1:
		push NULL
		push NULL
		push NULL
		push Volume_MUTE
		call keybd_event
		ret

	VolumeDown_1:
		push NULL
		push NULL
		push NULL
		push Volume_DOWN
		call keybd_event
		ret

	VolumeUp_1:
		push NULL
		push NULL
		push NULL
		push Volume_UP
		call keybd_event
		ret

	BeepLoop:
		mov dword [Frequenzy], BeepWave
		bloop:
			push 200
			push dword [Frequenzy]
			call Beep
			sub dword [Frequenzy], 0xFF
		cmp dword [Frequenzy], 38
		jge bloop
		ret

	Get_Power:
		push dword Power_State
		call GetSystemPowerStatus
		cmp eax, NULL
		je end
		mov dword eax, [Power_State]
		and eax, BitMaskPower
		cmp eax, 0x00FF0000
		je isPC
		jne isLaptop
		isLaptop:
			;call MessageLaptop
			call FunLaptop
			jmp Nope
		isPC:
			;call MessagePC
			call FunPC
		Nope:
		ret

	MessageCD:
		push NULL
		push NULL
		push ErrorCD
		push NULL
		call MessageBoxA
		ret

	MessagePC:
		push NULL
		push NULL
		push PC
		push NULL
		call MessageBoxA
		ret

	FunPC:
		mov dword [Counter],10
		loop1:
			call eject_cd
			call load_cd
			dec dword [Counter]
		cmp dword [Counter], 0
		jne loop1
		ret

	MessageLaptop:
		push NULL
		push NULL
		push Laptop
		push NULL
		call MessageBoxA
		ret

	FunLaptop:
		mov dword [Counter],255
		loop2:
			call eject_cd
			call sleep_window
			dec dword [Counter]
		cmp dword [Counter], 0
		jne loop2
		ret

	MessageBox:
		push NULL
		push NULL
		push FunString
		push NULL
		call MessageBoxA
		ret

	Error:
		push NULL
		push NULL
		push ErrorString
		push NULL
		call MessageBoxA
		ret

	Hide:
		push HIDE
		push dword [Handle]
		call ShowWindow
		ret

	get_console_handle:
		call GetConsoleWindow
		mov [Handle], eax
		ret

	sleep_window:
		push MILISEC
		call Sleep
		ret

	sleep_window2:
		push MILISEC2
		call Sleep
		ret


	Get_CD:
		mov ecx, 65
		ll:
			push ecx
			mov al, cl
			mov [du], al
			mov al, 58
			mov [du+1], al
			mov al, 92
			mov [du+2], al
			push du
			call GetDriveTypeA
			cmp eax, CD_TYPE
			jne end2
				mov al, [du]
				mov [cdDrive], al
				call get_cd_handle
				pop ecx
				mov ecx, 90
				push ecx
			end2:
			pop ecx
			inc ecx
		cmp ecx, 91
		jne ll
		ret

	get_cd_handle:
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
		mov al, 58
		mov [DrivePath+5], al
		push NULL
		push NULL
		PUSH OPENEXISTING
		push NULL
		push FILE_SHARE_WRITE
		push GENERICREAD
		push DrivePath
		call CreateFileA
		cmp eax, INVALID_HANDLE_VALUE
		je end
		mov [CDHandle], eax
		ret
		end:
			call MessageCD
			call Exit

	close_cd_handle:
		push dword [CDHandle]
		call CloseHandle
		ret

	eject_cd:
		push NULL
		push dummy
		push NULL
		push NULL
		push NULL
		push NULL
		push IOCTL_CDROM_EJECT_DRIVE
		push dword [CDHandle]
		call DeviceIoControl
		ret

	load_cd:
		push NULL
		push dummy
		push NULL
		push NULL
		push NULL
		push NULL
		push IOCTL_CDROM_LOAD_MEDIA
		push dword [CDHandle]
		call DeviceIoControl
		ret

	Exit:
		push NULL
		call ExitProcess
