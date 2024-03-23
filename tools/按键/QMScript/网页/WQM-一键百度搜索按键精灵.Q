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
MacroID=c2a722f3-6f63-4793-975d-f5fd58d4c1dc
Description=WQM-一键百度搜索按键精灵
Enable=0
AutoRun=0
[Repeat]
Type=0
Number=1
[Relative]
SetupOCXFile=
[Comment]
Content=【功能说明】
一键百度搜索关键字按键精灵
【使用说明】
1.打开网页按键精灵
2.启动脚本即可
【作者介绍】
工程师01
【制作日期】
2009.6.22

[Script]
UserVar txt="按键精灵" "搜索内容"
Call Plugin.Web.Bind("WQM.exe")
Call Plugin.Web.Go("http://www.baidu.com/")
//搜索内容
Call Plugin.Web.HtmlInput(txt,"tag:input&name:wd")
//百度一下
Call Plugin.Web.HtmlClick("tag:input&id:su")
