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
MacroID=ed204273-9592-4038-b6a1-69bda407749a
Description=8.2新功能：调用E语言插件演示
Enable=0
AutoRun=0
[Repeat]
Type=0
Number=1
[Relative]
SetupOCXFile=
[Comment]

[Script]
//E语言插件模版位置：按键精灵目录下 的 source\QMPlugin插件制作模版(易语言).zip
信息 = MsgBox("因打包【易语言DLL插件】文件容易被杀毒软件误报，所以请按【确定】进入论坛详细查看使用例子及演示！！", 65, "信息提示：")
If 信息=1 Then
    RunApp "http://bbs.vrbrothers.com/viewthread.php?tid=190236"
End If 

