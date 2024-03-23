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
MacroID=207e549e-26ed-4db9-b76f-2d79559533d8
Description=演示例子：输出一个随机数字
Enable=0
AutoRun=0
[Repeat]
Type=0
Number=1
[Relative]
SetupOCXFile=
[Comment]
Content=.
【功能说明】.
生成8位数的随机数，并使用输入到页面的文本框.
.
【使用说明】.
打开写字板，按下热键，就可以输出一个8位的数字.
.
【作者介绍】 按键专家团 无忧魔神(godeden ).
.
.

[Script]
//清空随机种子数
Rem start
Randomize
//得到 1~99999999 之间的一个随机数
x = Int((99999999 * Rnd) + 1)
//判断这个数字是否8位数字，如果不是8位数字，就重新生成
If x<10000000 Then
    Goto start
End If 
SayString x
