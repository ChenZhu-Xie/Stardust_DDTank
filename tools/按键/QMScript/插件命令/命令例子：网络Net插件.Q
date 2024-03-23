[General]
SyntaxVersion=1
BeginHotkey=121
BeginHotkeyMod=0
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=f1b0229c-b5e6-4576-8ce7-59e06313f7f3
Description=命令例子：网络Net插件
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
//测试OK
Rem 拨号
//下面这句是拨号远程网络连接(网络连接名字)[失败返回<False>,成功返回<True>]
OnLine = Plugin.Net.DialUp("ADSL连接测试")
If OnLine = False Then
    Goto 拨号
End If 
Delay 1000
//下面这句是断开远程网络连接
Call Plugin.Net.HangUp()
//下面这句是判断连接是否在线[断线返回<False>,否则返回<True>]
OnLine = Plugin.Net.IsOnline()
If OnLine = False Then
    Goto 拨号
End If 
