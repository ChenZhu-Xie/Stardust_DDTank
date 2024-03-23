[General]
SyntaxVersion=1
BeginHotkey=121
BeginHotkeyMod=0
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=0
EnableWindow=
MacroID=c6ae48df-4a95-413b-8e2c-a92755e9b45d
Description=演示例子：OnScriptExit子程序
Enable=0
AutoRun=0
[Repeat]
Type=0
Number=1
[Relative]
SetupOCXFile=
[Comment]
Content=【功能说明】.
这个脚本主要演示了OnScriptExit子程序的功能。.
.
在脚本中写一个名字叫OnScriptExit的子程序，在脚本结束的时候（无论是脚本正常运行结束，还是按下了中止热键结束），脚本会自动调用这个子程序。.
.
比如在这个脚本中，脚本启动时保存一下鼠标的位置，脚本功能是鼠标一直在屏幕上画正弦曲线，一旦按下中止热键，脚本在结束前会自动调用OnScriptExit子程序，弹出一个对话框，并且把鼠标恢复到最初保存的位置。.
.
【作者介绍】.
vrBrothers.CR.
07.11.9

[Script]
SaveMousePos 
While 1
    x = 0
    While x < 1024
        y = 300 - sin(x/30) * 100
        MoveTo x,y
        x = x + 1
        Delay 3
    Wend
Wend
Sub OnScriptExit()
    MessageBox "脚本已经停止！"
    RestoreMousePos 
End Sub

