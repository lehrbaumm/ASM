..\..\nasm -f win32 Add.asm
..\..\golink /Console /Entry Main Add.obj Kernel32.dll
