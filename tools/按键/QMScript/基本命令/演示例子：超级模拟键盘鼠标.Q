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
MacroID=801fe712-e944-4e35-be44-bca33ac84911
Description=演示例子：硬件或超级模拟键盘鼠标
Enable=0
AutoRun=0
[Repeat]
Type=0
Number=1
[Relative]
SetupOCXFile=
[Comment]
Content=【功能说明】
测试硬件模拟和超级模拟命令。

[Script]
MessageBox "这个例子会演示 普通/硬件/超级 这三种模拟方式的效果，点击确定后3秒钟开始模拟，会用普通模拟按3下a，硬件模拟按3下b，超级模拟按3下c"
Delay 3000
SetSimMode 0
KeyPress 65,3
MoveTo 0,0
Delay 1000
SetSimMode 1
KeyPress 66,3
MoveTo 100,100
Delay 1000
SetSimMode 2
KeyPress 67,3
MoveTo 200,200
MessageBox "演示结束"
