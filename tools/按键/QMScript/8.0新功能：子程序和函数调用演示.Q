[General]
SyntaxVersion=2
BeginHotkey=121
BeginHotkeyMod=0
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=0e6e35bd-72bd-49e4-8661-19ef615e76ff
Description=8.0新功能：子程序和函数调用演示
Enable=0
AutoRun=0
[Repeat]
Type=0
Number=1
[Relative]
SetupOCXFile=
[Comment]

[Script]
//<>---------------------------------------------子程序调用
Call 普通子程序()
Call 代入参数的子程序(100,50)
//<>---------------------------------------------函数调用
Msgbox 代入参数的函数(100,50) 
Sub 普通子程序()
    Msgbox "我是普通子程序，被调用了"
End Sub
Sub 代入参数的子程序(a,b)
    c=a+b
    Msgbox "我是代入参数的子程序，被调用了。结果值为：" & c
End Sub
Function 代入参数的函数(a,b)
    c=a*b
    代入参数的函数 = "我是代入参数的函数，被调用了。结果值为：" & c
End Function
