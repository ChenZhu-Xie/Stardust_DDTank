[General]
SyntaxVersion=2
BeginHotkey=49
BeginHotkeyMod=2
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=daf2ab41-4a2e-4c1a-bc0b-86336ab0d07b
Description=8.0新功能：多种循环体演示
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
//<>---------------------------------------------普通循环
i=0
For 3
    Msgbox "普通循环演示：【" & i & "】"
    i=i+1
Next
//<>---------------------------------------------新语法循环
For i=0 To 3
    Msgbox "新语法To循环演示：【" & i & "】"
Next
//<>---------------------------------------------新语法循环
For i=0 To 10 Step 2
    Msgbox "新语法步进Step循环演示：【" & i & "】"
    If i>7 Then
        Msgbox "达到条件大于7时，离开循环体！"
        Exit For 
    End If 
Next
//<>---------------------------------------------新语法循环
i=0
Do While True
    Msgbox "新语法Do循环演示：【" & i & "】"
    If i>7 Then
        Msgbox "达到条件大于7时，离开循环体！"
        Exit Do
    End If 
    i=i+1
Loop
