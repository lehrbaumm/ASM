..\..\nasm -f win32 Testing.asm
..\..\golink /Console /Entry Main Testing.obj Kernel32.dll User32.dll
