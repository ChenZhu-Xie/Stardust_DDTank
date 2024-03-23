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
MacroID=dfb33df9-2c96-4a6d-bddb-536242c0fd78
Description=演示例子：按顺序输出数字序列号
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
按顺序输出数字，可以设定开始的数字和结束的数字。.
.
【作者介绍】按键专家团 无忧魔神 (godeden).
.
.

[Script]
// 〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓★说★明★〓〓〓〓〓〓〓〓〓〓〓〓〓☆〓
// 【功能说明】数字序列号输出〖模板〗
// 【使用说明】在弹出的对话框中输入起始号码(最小数字)跟结束号码(最大数字)
// 【提示说明】请在记事本中测试
// 〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓★定变量★〓〓〓〓〓〓〓〓〓〓〓〓〓☆〓
dim a,b
// 〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓★主程序★〓〓〓〓〓〓〓〓〓〓〓〓〓☆〓
// 〖脚本开始〗
a=InputBox("输入起始号码")
b=InputBox("输入结束号码")
// 〖这个cint(x)是把变量值转换成数字〗
a=cint(a)
b=cint(b)
While a<=b
    SayString a
    KeyPress 32,1
    a=a+1
Wend
// 〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓★备★注★〓〓〓〓〓〓〓〓〓〓〓〓〓☆〓
// 【脚本经过修改】
// 【创作日期】2005
// 【数字记号】①②③④⑤⑥⑦⑧⑨⑩
// 〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓★结★束★〓〓〓〓〓〓〓〓〓〓〓〓〓☆〓
