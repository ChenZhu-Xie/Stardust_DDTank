[General]
SyntaxVersion=1
BeginHotkey=121
BeginHotkeyMod=0
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=0
EnableWindow=
MacroID=621a7e36-5ab8-43b4-be2c-3f10ceea0617
Description=演示例子：一键抓图
Enable=0
AutoRun=0
[Repeat]
Type=0
Number=1
[Relative]
SetupOCXFile=
[Comment]
Content====日常应用===.
【功能说明】.
一键抓图,抓的图保存在桌面上! .
.
【使用说明】.
一键抓图,抓的图保存在桌面上! ,但是自己要的图片还得在这个基础上自己修改.[在按键上看到很多人不会抓图].启动热键为<F10>，中止热键为<F12>。.
.
【作者介绍】.
【按键专家团 Jimmyzs】.
.
【制作日期】.
<2006-9-6>.

[Script]
//下面这句在屏幕区域范围内截图保存到桌面
//下面两句是获取用户桌面文件夹
set Obj = createobject("WScript.Shell")
FileName = Obj.SpecialFolders("desktop")
Call Plugin.Pic.PrintScreen(10, 10,200 , 200, FileName & "\按键精灵一键抓图.bmp")
MessageBox "已经将截图保存在桌面！"
