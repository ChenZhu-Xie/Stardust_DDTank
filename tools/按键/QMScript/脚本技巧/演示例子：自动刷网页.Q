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
MacroID=4efcf531-f14d-4ae8-a9ef-1352253ab502
Description=演示例子：自动刷网页
Enable=0
AutoRun=0
[Repeat]
Type=1
Number=3954080
[Relative]
SetupOCXFile=
[Comment]
Content=.
【功能说明】.
自动按F5刷新网页，可设置刷新的时间频率，默认是2秒.
.
【使用说明】.
请先打开网页浏览器，访问你需要刷新的网址。然后按下热键，即可自动刷新。.
注意：刷新的时候请保证浏览器在前台，如果切换到后台就无法刷新了。能刷新后台网页的版本还在制作当中，欢迎大家关注。.
.
【作者介绍】.
vrBrothers.Leo.
2006.9.
.
.

[Script]
UserVar YanShi=5000 "请输入刷新网页的时间间隔，默认是5000毫秒，也就是5秒"
KeyPress 116,1
Delay YanShi
