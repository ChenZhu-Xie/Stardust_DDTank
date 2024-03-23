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
MacroID=66f8625f-f0f3-4cf8-bc42-e32a36a5f7c1
Description=演示例子：QQ消息发送器
Enable=0
AutoRun=0
[Repeat]
Type=1
Number=1943232333
[Relative]
SetupOCXFile=
[Comment]
Content=.
【功能说明】.
QQ消息自动发送器.
.
【使用说明】.
请把QQ聊天窗口放在最前，发送过程必须保证窗口在最前方。后台发送的版本正在制作中 ：）.
本脚本仅供娱乐，切勿用于骚扰他人。要做有趣的人，不要作无聊的人。.
.
【作者介绍】.
vrBrothers.Leo.
.
【制作日期】.
2006.9.
.

[Script]
//自定义变量设置
UserVar Hua1="窗前明月光" "发送的第一句话"
UserVar Hua2="疑是地上霜" "发送的第二句话"
UserVar Hua3="举头望明月" "发送的第三句话"
UserVar Hua4="低头思故乡" "发送的第四句话"
UserVar Hua5="按键精灵自动发送" "发送的第五句话"
UserVar Yanshi=1000 "发送两句话之间的时间间隔，默认1000就是1秒"
//用一个变量来设置需要发送的话的内容
Dim Hua
//发送第一句
Hua = Hua1
Call FaSongXiaoXi()
Delay Yanshi
//发送第二句，以下雷同
Hua = Hua2
Call FaSongXiaoXi()
Delay Yanshi
Hua = Hua3
Call FaSongXiaoXi()
Delay Yanshi
Hua = Hua4
Call FaSongXiaoXi()
Delay Yanshi
Hua = Hua5
Call FaSongXiaoXi()
Delay Yanshi
EndScript 
//发送消息的子程序
Sub FaSongXiaoXi()
    //填上要发的话
    SayString Hua
    Delay 100
    //按下Alt+S的QQ发消息热键，发送成功
    KeyDown 18, 1
    KeyPress 83, 1
    KeyUp 18, 1
End Sub
