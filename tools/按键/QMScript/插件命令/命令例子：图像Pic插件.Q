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
MacroID=af233f77-2a32-425e-a079-2a60b9310232
Description=命令例子：图像Pic插件
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
//下面这句在屏幕区域范围内截图保存到("C:\PIC.bmp")里
Call Plugin.Pic.PrintScreen(0, 0, Plugin.Sys.GetScRX(), Plugin.Sys.GetScRY(), "C:\PIC.bmp")
MessageBox "屏幕截图已经保存到(C:\PIC.bmp)里"
Delay 1000
//下面这句在屏幕区域范围内截图保存到("C:\PIC.jpg")里
Call Plugin.Pic.PrintScreen(0, 0, Plugin.Sys.GetScRX(), Plugin.Sys.GetScRY(), "C:\PIC.jpg")
MessageBox "屏幕截图已经压缩保存到(C:\PIC.jpg)里，演示结束"