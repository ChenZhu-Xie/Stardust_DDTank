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
MacroID=c410af2f-db30-42d1-90db-7b10366f3f84
Description=8.2新功能：重启脚本运行演示
Enable=0
AutoRun=0
[Repeat]
Type=0
Number=1
[Relative]
SetupOCXFile=
[Comment]

[Script]
For i=0 to 2 
    Delay 1000
    Call Plugin.Msg.ShowScrTXT(0, 0, 1024, 768, "屏幕内容填写" & i, "0000FF") 
Next 
RestartScript //重新启动脚本运行
