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
MacroID=0aef30aa-ce07-4ea4-9b09-c6f002645ba9
Description=命令例子：系统Sys插件
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
//下面这句是获得屏幕分辨率宽度
ScreenW = Plugin.Sys.GetScRX()
MessageBox "获得屏幕分辨率宽度："& ScreenW
//下面这句是获得屏幕分辨率高度
ScreenH = Plugin.Sys.GetScRY()
MessageBox "获得屏幕分辨率高度："& ScreenH
//下面这句是获得屏幕色深度(颜色质量)
Dev = Plugin.Sys.GetScDep()
MessageBox "获得屏幕色深度(颜色质量)："& Dev
//=================================================================================
//下面这句是设置屏幕分辨率(1024×768)/颜色质量(32位)
Call Plugin.Sys.SetSc(1024,768,32)
MessageBox "设置屏幕分辨率"
Call Plugin.Sys.SetSc(ScreenW,ScreenH,Dev)
MessageBox "屏幕分辨率改回来"
//=================================================================================
//下面这句是精准地计算毫秒时间差
s = Plugin.Sys.GetTime()
xs=int(s/1000/60/60)
fz=int(s/1000/60)-xs*60
m=Clng(s/1000)-fz*60-xs*60*60
MessageBox "您的操作系统从启动到目前的时间：" & xs & "小时" & fz & "分钟" & m & "秒"
//下面这句是得到硬盘第一个分区的序列号
GetSN = Plugin.Sys.GetHDDSN()
MessageBox "得到硬盘第一个分区的序列号："& GetSN
//=================================================================================
//下面这句是设置剪切板内容
Call Plugin.Sys.SetCLB("剪切板内容")
MessageBox "设置剪切板内容"
//下面这句是获得剪切板内容
Clipboard = Plugin.Sys.GetCLB()
MessageBox "获得剪切板内容："& Clipboard
//=================================================================================
//下面这句是获得(当前路径)
Path = Plugin.Sys.GetDir(0)
MessageBox "获得路径："& Path
EndScript 
//=================================================================================
//下面这句是关机计算机(注销)
Call Plugin.Sys.ExitOS(0)
