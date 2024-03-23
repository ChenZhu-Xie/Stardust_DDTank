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
MacroID=603a0d92-39e1-4f0b-8075-5da86172a1d0
Description=命令例子：信息提示Msg插件
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
For PU=0 To 9
    //下面这句是直接对屏幕进行刷新清除
    Call Plugin.Msg.HideScrTXT()
    //延迟半秒等待刷新完毕
    Delay 500
    //下面这句是在屏幕上范围位置(0, 0, 1024, 100)进行输出内容("屏幕内容填写")
    Call Plugin.Msg.ShowScrTXT(0, 0, 1024, 100, "屏幕内容填写  " & PU, "0000FF")
    //延迟半秒可以让你看的清楚
    Delay 500
    //下面这句是在系统托盘上显示提示信息
    Call Plugin.Msg.Tips("屏幕内容填写  " & PU)
    //延迟半秒可以让你看的清楚
    Delay 500
Next
EndScript 
//1.首先[发送者]必须注册飞信帐号
//2.[接收方]必须要在[发送者]的飞信帐号好友列表里
//3.注册飞信帐号地址：http://www.fetion.com.cn/account/register/
//参数3，当长度为0时表示接收方号码与发送用户相同
SMS = Plugin.Msg.SendSMS("13900000001","1314520","13900000002","发送短信消息内容")
If SMS = True Then 
    MessageBox "发送成功！"
Else 
    MessageBox "发送失败！"
End If 
