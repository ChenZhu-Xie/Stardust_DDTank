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
MacroID=f654c0be-2a57-484a-a776-86e588a5127a
Description=命令例子：区域模糊找色打怪
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
在屏幕的固定区域使用模糊找色功能寻找怪物，并将鼠标移过去点击打怪.
.
【使用说明】.
这是个脚本例子，无法直接运行，供大家学习参考.
.
【作者介绍】.
摘自兄弟论坛，帖子网址：.
http://bbs.vrbrothers.com/viewthread.php?tid=20488.
作者： 晨风 .
.
.

[Script]
Call FindColorEx(0,0,1024,768,"FFFFFF",1,0.8,x,y)
//区域模煳找色  0,0,1024,768为区域范围 "FFFFFF"为颜色 1为查找方式(中间向外) 0.8为模煳值 x,y为找到颜色后的坐标变量
If x>0 and y>0 Then
    //如果找到颜色  比如找到颜色就会赋值给坐标变量  通过判断坐标变量可以知道有没有找到怪
    MoveTo x,y
    //把鼠标移动到该色的坐标 如果找的是怪名字或血条  可能移动不到怪身上 这时就要用鼠标偏移 如：MoveTo x+10 y+10
    Delay 50
    //延时
    LeftClick 1
    //左键单击进行攻击
End If 
//条件结束
