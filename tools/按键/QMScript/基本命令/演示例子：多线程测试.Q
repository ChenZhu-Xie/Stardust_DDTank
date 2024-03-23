[General]
SyntaxVersion=1
BeginHotkey=122
BeginHotkeyMod=0
PauseHotkey=120
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=f2099881-eb0e-41d5-88af-5b027ad87114
Description=演示例子：多线程测试
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
MessageBox "多线程命令还在测试当中，并不稳定，请谨慎使用"
//下面这个例子会打开一个记事本，用2个线程向其中模拟按键
Call RunApp("notepad")
Delay 1000
DimEnv Key
Key=65
BeginThread Thread1
While True
    Call PressKey()
    key=key+1
    If (key>90)
        key=65
    EndIf 
Wend
EndScript 
Sub Thread1()
    For 10
        Call PressKey()
    Next  
    KeyPress 13,1
    SayString "线程1已经结束"
    KeyPress 13,1
End Sub
Sub PressKey()
    KeyPress key,1
    Delay 200
End Sub
