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
MacroID=256abed0-03da-4187-9507-61366c49b042
Description=8.2新功能：日志信息记录演示
Enable=0
AutoRun=0
[Repeat]
Type=0
Number=1
[Relative]
SetupOCXFile=
[Comment]

[Script]
//<>---------------------------------开始记录日志
LogStart "C:\a.log"
For i = 0 To 3
    //<>---------------------------------以下“TracePrint”输出信息内容将被记录为日志
    TracePrint "屏幕内容填写" & i
    Call Plugin.Msg.ShowScrTXT(0, 0, 600, 300, "屏幕内容填写" & i, "0000FF")
Next
//<>---------------------------------记录日志停止
LogStop 
//<>---------------------------------日志停止了，下一句“TracePrint”输出信息不会被记录
TracePrint "这句不会输出！"
