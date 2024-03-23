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
MacroID=03b2f85a-36b4-411e-8578-841d335571c9
Description=命令例子：控制台Console插件
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
// 测试OK
//下面这句是打开控制台窗口
Call Plugin.Console.Open()
//下面这句是向控制台写入一行字符串
Call Plugin.Console.WriteLine("请随意输入几个字，然后按回车")
//下面这句是从控制台读取一行字符串
ReadLine = Plugin.Console.ReadLine()
//下面这句是向控制台写入一行字符串
Call Plugin.Console.WriteLine("您的输入是" & ReadLine & vbcrlf)
Call Plugin.Console.WriteLine("演示脚本结束，请按下Y键，退出控制台" & vbcrlf)
Rem WaitUserInputKey
//下面这句是等待用户在控制台的按键
userInput = Plugin.Console.WaitKey()
If userInput = asc("y") or userInput = asc("Y") Then
    Call Plugin.Console.Close()
Else 
    Goto WaitUserInputKey
End If 
//下面这句是关闭控制台窗口
Call Plugin.Console.Close()
