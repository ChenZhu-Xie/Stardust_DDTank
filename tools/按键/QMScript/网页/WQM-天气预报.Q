[General]
SyntaxVersion=2
BeginHotkey=121
BeginHotkeyMod=0
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=7444b3d5-a42c-4be0-be0a-dfdf2598b11a
Description=WQM-天气预报
Enable=0
AutoRun=0
[Repeat]
Type=0
Number=1
[Relative]
SetupOCXFile=
[Comment]

[Script]
//
UserVar city="福州" "请输入城市名"
Call Plugin.Web.Bind("WQM.exe")
Call Plugin.Web.Tips("请等待页面加载完成！")
Call Plugin.Web.Go("http://weather.news.sina.com.cn/")
Delay 500
Call Plugin.Web.HtmlInput(city,"name:city")
//Call Plugin.Web.HtmlInput(city,"id:city")
Delay 500
Call Plugin.Web.HtmlClick("id:wea_search")
//Call Plugin.Web.HtmlClick("tag:INPUT&value:搜 索")
Call Plugin.Web.Tips("当前"&city&"天气")
EndScript 
