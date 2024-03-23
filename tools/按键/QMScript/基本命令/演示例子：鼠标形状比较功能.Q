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
MacroID=7dd48867-08f3-4f38-a581-dc780c03a875
Description=演示例子：鼠标形状比较功能
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
演示鼠标形状比较功能，在网络游戏中，可以移动鼠标，并且根据鼠标形状的变化实现打怪功能.
.
【使用说明】.
请使用 抓点抓色 功能首先抓取鼠标的形状，然后在脚本中进行比较.
.
【作者介绍】.
vrBrothers.Leo.
06.11.7

[Script]
//下面是我们普通的WINDOWS鼠标形状特征
//不同电脑上鼠标形状特征也许不同，请使用"抓点抓色"功能抓取正确的鼠标形状特征
Shape1 = 1593350287
//下面是我们访问网页超链接时候的手型鼠标形状
Shape2 = 1055991329
Shape=GetCursorShape(0)
If shape = shape1 then
    MessageBox "当前鼠标形状是普通的WINDOWS鼠标"
ElseIf shape = shape2 then
    MessageBox "当前鼠标形状是手型鼠标"
Else 
    MessageBox "不认识当前鼠标形状！"
End If 
