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
MacroID=1187030d-5e67-46cd-946b-4c4a10bdd20a
Description=演示例子：建立备忘录到桌面上并定时提醒
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
在桌面建立一个备忘录并自动提醒.
.
.
【按键专家团  wx19841231】.
.
.

[Script]
UserVar thing="提醒事件" "在这输入你要记录的事 编辑你需要提醒的事件"
UserVar awoke="3(s)" "在这输入多少秒s,分钟m,小时h后提醒"
Set objShell = CreateObject("WScript.Shell")
x = objShell.SpecialFolders.Item("desktop")
//↑取得桌面路径
set fso=CreateObject("Scripting.FileSystemObject")
const forwriting=2
const forreading=1
set myfile=fso.createtextfile(x & "\备忘录.txt")
//↑写一个TXT到桌面
myfile.writeline("时间:"& now)
myfile.writeline("事件:"& thing)
//↑这两行就是你写进TXT的内容
myfile.Close
Lleft=instr(1,awoke,"(")
Rright=instr(1,awoke,")")
o=mid(awoke,Lleft+1,Rright-Lleft-1)
//↑检测沿时单位
p=mid(awoke,1,Lleft-1)
//↑检测沿时长度
If o="h" Then
    q=3600
ElseIf o="m" Then
    q=60
Else 
    q=1
End If
t=now
do
    Rem 检查时间
    If DateDiff("s",t,now)>=p*q  Then
        //↑比较时间
        Exit Do
    End If
    Delay 50
loop
Rem 时间到了
Set myfile=fso.OpenTextFile(x & "\备忘录.txt",ForReading)
a=myfile.ReadLine
b=myfile.ReadLine
//↑读取刚写的内容
myfile.Close
MessageBox a & vbCrlf & b
//↑把刚读取的显示出来
RunApp x & "\备忘录.txt"
//↑运行刚建立的TXT文本
