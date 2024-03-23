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
MacroID=57956eb5-7b84-4bd1-bf20-adcf0abb22ae
Description=8.0新功能：中文名变量演示
Enable=0
AutoRun=0
[Repeat]
Type=0
Number=1
[Relative]
SetupOCXFile=
[Comment]

[Script]
//<>---------------------------------------------用户自定义变量 支持中文名为变量名
UserVar 启动=DropList{"打开":1|"关闭":0}=0 "补血启动开关"
UserVar 补血=0 "补血百分比%"
//<>---------------------------------------------定义变量 支持中文名为变量名
Dim 提示
提示="补血启动开关未设置打开！"
If 启动=1 Then 
    Msgbox "补血百分比为："& 补血 & "%"
Else 
    Msgbox 提示
End If
