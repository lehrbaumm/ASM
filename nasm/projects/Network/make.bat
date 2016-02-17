..\..\nasm -f win32 Network.asm
..\..\golink /Console /Entry Main Network.obj Kernel32.dll Ws2_32.dll winsock.dll
