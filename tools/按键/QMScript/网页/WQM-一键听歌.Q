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
MacroID=018f6f7a-9435-4fb5-9324-938f4727f253
Description=WQM-一键听歌
Enable=0
AutoRun=0
[Repeat]
Type=0
Number=1
[Relative]
SetupOCXFile=
[Comment]
一键静听流行歌曲！
【作者】
一只鱼
【修改日期】
2011.04.29

[Script]
//
UserVar diange="我的爱情不见了" "输入歌名"
Delay 200
//获取浏览器进程ID
Call Plugin.Web.Bind("WQM.exe")
//跳转网页
Call Plugin.Web.Go("http://mp3.baidu.com/")
Delay 500
//在网页查询框中输入歌名
Call Plugin.Web.HtmlInput(diange,"id:ww")
Delay 500
//点击搜索
Call Plugin.Web.HtmlClick("tag:INPUT&value:百度一下")
Delay 2500
//点击试听
Call Plugin.Web.HtmlClick("index:0&tag:A&txt:试听")
Call Plugin.Web.Tips("音乐播放中，请欣赏！")

