..\..\nasm -f win32 main.asm
..\..\golink /Console /Entry Main main.obj Kernel32.dll User32.dll
