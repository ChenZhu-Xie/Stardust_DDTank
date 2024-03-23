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
MacroID=0840e189-a2d4-47b9-8a03-6dff97a3048e
Description=命令例子：下拉型用户自定义变量
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
//说明：{}当中是下拉的选项 =0是指的默认显示哪个选项(从0开始)
UserVar Var1=DropList{"低于10%时补血":"0.1"|"低于20%时补血":"0.2"|"低于30%时补血":"0.3"}=2 "自动补血设置"
UserVar Var2=0 "普通自定义变量"
MessageBox(Var1)
MessageBox(Var2)
