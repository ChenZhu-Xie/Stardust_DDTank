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
MacroID=b2790885-7924-41c5-9b04-2f967b877af0
Description=8.0新功能：定义私有和全局变量演示
Enable=0
AutoRun=0
[Repeat]
Type=0
Number=1
[Relative]
SetupOCXFile=
[Comment]

[Script]
Boss = "我是老板"
//<>---------------------------------------------调用私有变量子程序
Call 演示用子程序()
//<>---------------------------------------------下面测试私有变量是否能读取到
Msgbox "在全局下查看是否可以读到私有变量：值 =【" & Point & "】" & vbCrlf & vbCrlf & "为空的话，说明该变量为私有！"
Sub 演示用子程序()
    //<>-----------------------------------------在过程里定义的变量为私有变量，不定义的为全局变量
    Dim Point
    Point="我是扫地的"
    Msgbox "我是私有变量：值 = 【" & Point & "】" & vbCrlf & vbCrlf & "我是全局变量：值 = 【" & Boss & "】"
End Sub
EndScript 
//<>---------------------------------------------下面是测试例子【2】
i=10
Call test()
Msgbox "这是全局的" & i
EndScript
Sub Test()
    Dim i
    i = 3
    Msgbox "这是局部的" & i
End Sub
