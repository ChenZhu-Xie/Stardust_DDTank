[General]
SyntaxVersion=1
BeginHotkey=122
BeginHotkeyMod=0
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=0
EnableWindow=
MacroID=9876d6ab-8008-45cf-a7b4-63dae9a097c2
Description=演示例子：附件直接查找图形
Enable=0
AutoRun=0
[Repeat]
Type=0
Number=1
[Relative]
SetupOCXFile=
[Comment]
Content=

【功能说明】
在屏幕上查找Windows自带的扫雷程序里的笑脸图形
.

[Attachment]
UEsDBBQAAgAIAGx3jzqSd2hfcwAAAG4EAAALABEAd2lubWluZS5ibXBVVA0AB2r25Ulq9+VJavblSXPyzWNhAAMzINYAYhEgFgJiRgYJsLgFVB4ZHCAXNDQ0YBUnxnxMvVDV//+jIGwmoOnFogvVBFx6CWjE0A7Xi64RDWDTjl0vVv/i0EtAIw7tWPQSgwahXrSwxRHUOMMZL5dA/BKRPKiSrihMzxTmI1LzLwBQSwECFwsUAAIACABsd486kndoX3MAAABuBAAACwAJAAAAAAAAACAAgIEAAAAAd2lubWluZS5ibXBVVAUAB2r25UlQSwUGAAAAAAEAAQBCAAAArQAAAAAA

[Script]
MessageBox "这个例子会启动一个Windows自带的扫雷程序，然后查找扫雷程序里的笑脸图形"
Call RunApp("winmine.exe")
//加入一点延时，让扫雷程序顺利启动
Delay 2000
Call FindPic(0,50,1023,767,"winmine.bmp",0.9,intX,intY)
If intX>0 and intY>0 then
    MoveTo intX,intY
    MessageBox "找到图形，鼠标已经移到图形上面"
Else 
    MessageBox "没找到！请确认扫雷程序已经打开，并且您用的是WinXP系统"
End If 
MessageBox "下面把鼠标先移到0，0点，再用附件找图的方式继续查找笑脸"
Call FindPic(0,50,1023,767,"Attachment:\winmine.bmp",0.9,intX,intY)
If intX>0 and intY>0 then
    MoveTo intX,intY
    MessageBox "找到图形，鼠标已经移到图形上面"
Else 
    MessageBox "没找到！请确认扫雷程序已经打开，并且您用的是WinXP系统"
End If
MessageBox "脚本演示结束，最好的脚本永远是您自己制作的。 :-)"
EndScript 
