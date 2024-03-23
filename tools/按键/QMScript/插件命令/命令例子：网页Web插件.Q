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
MacroID=6fbe8f6c-258e-49e7-96de-c435e4407959
Description=命令例子：网页Web插件
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
//下面这句是删除IE临时文件
Call Plugin.Web.ClearTemp()
//下面这句是清除IE历史记录
Call Plugin.Web.ClearHistory()
//下面这句是删除IE的Cookie
Call Plugin.Web.ClearCookie()
