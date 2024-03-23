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
MacroID=475129c3-9188-4426-899c-263a15d71efd
Description=演示例子：数组区域查找多色
Enable=0
AutoRun=0
[Repeat]
Type=0
Number=1
[Relative]
SetupOCXFile=
[Comment]
Content=【请在这里下拉选择】.
【功能说明】.
此脚本利用数组定义多个颜色进行区域找色(也可以用这种方法区域查找多个图片).
.
【使用说明】.
先修改颜色代码  保存退出即可.
.
【作者介绍】.
【按键专家团 晨风】.
.
【制作日期】.
<2006-09-15>

[Script]
dim Cor(2)
dim s,x,y
//声明变量
Cor(0)="FFFFFF":Cor(1)="000000":Cor(2)="00FFFF"
//定义颜色数组变量 请自行修改颜色代码
Rem start
s=0
//定义数组下标初始值变量
For 3
    //循环3次
    Delay 10
    //循环里设置延时  防止系统内存占用太高
    //VBSCall FindCenterColor(0,0,1024,768,Cor(s),x,y)
    Call FindCenterColor(0,0,1024,768,Cor(s),x,y)
    //区域从中间向外查找颜色。0,0,1024,768为区域范围，Cor(s)为颜色数组变量，x,y为坐标变量
    If x>0 and y>0 Then
        //如果找到颜色
        Delay 100
        //延时100毫秒
        Call MessageBox("找到颜色"&"Cor("&s&") "&"坐标为:"&x&","&y)
        //弹出窗口 找到颜色和坐标
    Else 
        Delay 100
        //延时100毫秒
        Call MessageBox("没找到颜色"&"Cor("&s&")")
        //弹出窗口 没有找到颜色
   End If
    //条件结束
    s=s+1
    //变量递增
Next 
//循环结束
EndScript 
Goto start
