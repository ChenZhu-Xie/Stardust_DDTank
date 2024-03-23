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
MacroID=b428d4d1-61ed-40fd-8eda-5eea7783d418
Description=8.0新功能：选择条件结构演示
Enable=0
AutoRun=0
[Repeat]
Type=0
Number=1
[Relative]
SetupOCXFile=
[Comment]

[Script]
UserVar 变量=0 "输入（0~9）数字"
//<>---------------------------------------------以下是选择条件结结构判断
Select Case 变量
Case 0
    Msgbox "你输入的数字为：0" 
Case 1
    Msgbox "你输入的数字为：1" 
Case 2
    Msgbox "你输入的数字为：2" 
Case 3
    Msgbox "你输入的数字为：3" 
Case 4
    Msgbox "你输入的数字为：4" 
Case 5
    Msgbox "你输入的数字为：5" 
Case 6
    Msgbox "你输入的数字为：6" 
Case 7
    Msgbox "你输入的数字为：7" 
Case 8
    Msgbox "你输入的数字为：8" 
Case 9
    Msgbox "你输入的数字为：9" 
Case Else
    Msgbox "你输入的数字不正确，请输入（0~9）数字！"
End Select
