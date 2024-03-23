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
MacroID=185ae05e-aca2-4d22-8a50-d917531d5f71
Description=8.2新功能：退出脚本运行演示
Enable=0
AutoRun=0
[Repeat]
Type=0
Number=1
[Relative]
SetupOCXFile=
[Comment]

[Script]
BeginThread 多线程
For 3 
    Delay 1000
Next 
ExitScript 
//强制中止脚本并退出执行，在这个语句之后的所有命令都不会执行
Sub 多线程()
    i=0
    Do 
        Call Plugin.Msg.ShowScrTXT(0, 0, 600, 300, "屏幕内容填写" & i, "0000FF") 
        Delay 1000
        i=i+1
    Loop 
End Sub
