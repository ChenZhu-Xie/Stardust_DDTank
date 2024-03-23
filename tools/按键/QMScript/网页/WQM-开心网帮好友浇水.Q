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
MacroID=ad237c08-d3c7-4ece-9810-3261a8ef8c5b
Description=WQM-开心网帮好友浇水
Enable=0
AutoRun=0
[Repeat]
Type=0
Number=1
[Relative]
SetupOCXFile=
[Comment]
Content=【功能说明】
开心网帮好友浇水
【使用说明】
1.打开网页按键精灵
2.手动登陆开心网
3.启动脚本即可
【作者介绍】
兄弟工程师01
【制作日期】
2009.7.21

[Script]
Call Plugin.Web.Bind("WQM.exe")
Call Plugin.Web.SetSize(1020,740)
Call Plugin.Web.Go("http://www.kaixin001.com/home/")
Delay 3000
Call Plugin.Web.Go("http://www.kaixin001.com/!house/garden/index.php")
While 1
    //移动滚动条往下150位置
    Call Plugin.Web.ScrollTo(0,150)
    Delay 200
    //点下位好友
    Call Plugin.Web.LeftClick(955,20)
    Delay 6000
    //移动滚动条往下150位置
    Call Plugin.Web.ScrollTo(0,150)
    Delay 200
    //点浇水
    Call Plugin.Web.LeftClick(570,550)
    Delay 1000
    //
    Call Plugin.Web.LeftClick(860,370)
    Delay 1000
    Call Plugin.Web.LeftClick(760,320)
    Delay 1000
    Call Plugin.Web.LeftClick(650,270)
    Delay 1000
    Call Plugin.Web.LeftClick(550,220)
    Delay 1000
    Call Plugin.Web.LeftClick(450,170)
    Delay 1000
    //
    Call Plugin.Web.LeftClick(350,220)
    Delay 1000
    Call Plugin.Web.LeftClick(450,270)
    Delay 1000
    Call Plugin.Web.LeftClick(550,320)
    Delay 1000
    Call Plugin.Web.LeftClick(650,370)
    Delay 1000
    Call Plugin.Web.LeftClick(750,420)
    Delay 1000
Wend

