[General]
SyntaxVersion=1
BeginHotkey=121
BeginHotkeyMod=0
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=4d353010-67d9-4dde-a438-2cada4b9f620
Description=命令例子：内存进程Memory插件
Enable=0
AutoRun=0
[Repeat]
Type=0
Number=1
[Relative]
SetupOCXFile=
[Comment]
Content=

[Script]
//测试OK
Call RunApp("notepad.exe")
Delay 1000
//下面这句是查找窗口类名(0)或者标题("无标题 - 记事本"),返回找到的句柄Hwnd
Hwnd = Plugin.Window.Find(0, "无标题 - 记事本")
MessageBox "查找到的父窗口句柄为：" & Hwnd
//下面这句是设置进程优先级为(高于标准(A))
Call Plugin.Memory.SetProcessLive(Hwnd, 4)
MessageBox "返设置进程优先级为(高于标准(A))"
//下面这句是返回进程优先级返回到变量(Live)
Live = Plugin.Memory.GetProcessLive(Hwnd)
MessageBox "返回进程优先级为：" & Live
//下面这句是结束句柄(Hwnd)进程
Call Plugin.Memory.TerminateProc(Hwnd)
MessageBox "结束句柄进程"
//===========================================================================
Call RunApp("winmine.exe")
Delay 1000
hwnd=Plugin.Window.Find(0,"扫雷")
Dim x, y
//x, y中分别保存当前扫雷的长与宽的格子数量
x=Plugin.Memory.Read32Bit(hwnd,&h1005334)
y=Plugin.Memory.Read32Bit(hwnd,&h1005338)
MessageBox "扫雷的长与宽的格子数量为：" & x & "  *  " & y &"格"
//下面这句是从内存地址范围开始(&H7D7045B4到&H7D8045B4)以步长为(2)进行搜索内存字符串("雷")地址
DiZhi = Plugin.Memory.FindString(Hwnd, "雷", &H7D7045B4, &H7D8045B4, 2)
MessageBox "搜索到第一个""雷""字内存地址为：&H" & Hex(DiZhi)
//下面这句是读取内存字符串(&H7D7A45B4)内存地址返回到变量(z)
z = Plugin.Memory.ReadString(Hwnd, Clng(DiZhi), 2)
MessageBox "读到的内存字符串为：" & z
//建个双重循环，循环所有格子
TestMemory_resut=""
Dim i, j, value, strview
strview="说明：@代表安全，*代表雷" & vbcrlf
For i=0 To x-1
    For j=0 To y-1
        value=Plugin.Memory.Read8Bit(hwnd,&h1005360+(j+i*32+1))
        If value=&h8A or value=&h8F Then
            strview=strview & " *"
        Else 
            strview=strview & " @"
        End If        
    Next 
    strview=strview & vbcrlf   
Next 
TestMemory_resut="扫雷测试:" & strview
MessageBox TestMemory_resut
//关闭扫雷
Call Plugin.Window.Close(hwnd)
MessageBox "关闭扫雷游戏"
