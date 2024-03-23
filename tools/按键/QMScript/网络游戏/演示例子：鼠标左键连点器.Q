[General]
SyntaxVersion=1
BeginHotkey=121
BeginHotkeyMod=0
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=32775
StopHotkeyMod=0
RunOnce=0
EnableWindow=
MacroID=32af1d79-6ba9-40e6-bd31-1c536cc2df2f
Description=演示例子：鼠标左键连点器（可调频率）
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
按下热键即可反复点击鼠标左键，可调整点击频率.
.
【使用说明】.
按下热键即可反复点击鼠标左键，按中止键停止运行。.
注意：默认中止热键是双击鼠标热键，一般情况下需要多次连击鼠标右键才会停止。也是演示如何使用鼠标热键。.
.
【作者介绍】.
vrBrothers.Leo.
.
【制作日期】.
06年09月04日.
.

[Script]
//说明：按照一定频率反复点击鼠标右键
//1秒 = 1000毫秒
UserVar Yanshi=200 "两次点击的时间间隔（毫秒）"
LeftClick 1
Delay Yanshi
