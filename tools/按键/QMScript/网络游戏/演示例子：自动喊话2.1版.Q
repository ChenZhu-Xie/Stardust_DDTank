[General]
SyntaxVersion=1
BeginHotkey=120
BeginHotkeyMod=0
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=eb81f30d-247c-4a36-905a-7346cc2a4b5d
Description=演示例子：自动喊话2.1版
Enable=0
AutoRun=0
[Repeat]
Type=1
Number=1015
[Relative]
SetupOCXFile=
[Comment]
Content=.
【功能说明】.
自动叫卖，反复输入一些话.
【使用说明】.
在游戏中按下热键即可说话，自己可以修改说话的内容。.
最多支持5句话反复叫喊，可以设定每句话叫喊的时间间隔.
【作者介绍】 vrBrothers.Leo.
【制作日期】 06年08月21日

[Script]
UserVar MoShi=DropList{"普通模拟":0|"超级模拟":1|"硬件模拟":2}=0 "设置模拟方式"
UserVar str1="这是自动喊的第1句话" "请输入自动叫喊的第1句话"
UserVar str2="这是自动喊的第2句话" "请输入自动叫喊的第2句话"
UserVar str3="这是自动喊的第3句话" "请输入自动叫喊的第3句话"
UserVar str4="这是自动喊的第4句话" "请输入自动叫喊的第4句话"
UserVar str5="这是自动喊的第5句话" "请输入自动叫喊的第5句话"
UserVar Yanshi=3000 "两句喊话之间的等待时间，1秒钟是1000"
//****************设置结束*****************
If MoShi=0 Then
    SetSimMode 0
ElseIf MoShi=1 Then
    SetSimMode 2
ElseIf MoShi=2 Then
    SetSimMode 1
End If
Delay 500
Rem go
SayString str1
KeyPress 13,1
Delay Yanshi
SayString str2
KeyPress 13,1
Delay Yanshi
SayString str3
KeyPress 13,1
Delay Yanshi
SayString str4
KeyPress 13,1
Delay Yanshi
SayString str5
KeyPress 13,1
Delay Yanshi
//等待半分钟后，进行下一轮叫卖
For 30
    Delay 1000
Next
Goto go
