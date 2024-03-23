[General]
SyntaxVersion=1
BeginHotkey=121
BeginHotkeyMod=0
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=32771
StopHotkeyMod=0
RunOnce=0
EnableWindow=
MacroID=e42bfd00-f002-4b37-8e29-28ad5396949f
Description=演示例子：鼠标右键连点器（可调频率）
Enable=0
AutoRun=0
[Repeat]
Type=1
Number=3954080
[Relative]
SetupOCXFile=
[Comment]
Content====通用脚本===.
【功能说明】.
按下热键即可反复点击鼠标右键，可调整点击频率.
.
【使用说明】.
按下热键即可反复点击鼠标右键，按中止键停止运行。.
.
【作者介绍】.
vrBrothers.Leo.
.
【制作日期】.
05年09月04日

[Script]
//说明：按照一定频率反复点击鼠标右键
//1秒 = 1000毫秒
UserVar Yanshi=200 "两次点击的时间间隔（毫秒）"
RightClick 1
Delay Yanshi
