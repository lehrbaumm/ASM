..\..\nasm -f win32 CD-Eject.asm -g
..\..\golink /Console /Entry Main CD-Eject.obj Kernel32.dll User32.dll Dxva2.dll
