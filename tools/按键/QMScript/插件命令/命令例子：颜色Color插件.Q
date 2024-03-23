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
MacroID=0d6bea7f-5016-4ed9-a9c5-62e46e13d2ea
Description=命令例子：颜色Color插件
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
Dim MyArray
//下面这句是把10进制(R：255, G：0, B：0)分量合并到16进制颜色值变量(Color)中
Color1 = Plugin.Color.GetRGB(255, 0, 0)
MessageBox color1
//下面这句是把16进制颜色("0000FF")转换分解到10进制(R：R, G：G, B：B)分量中
Call Plugin.Color.ColorToRGB("ffffFF", R, G, B)
MessageBox R&"  " & G &"  " & B
//=================================================================================
//下面这句是把16进制颜色("0000FF")转换分解到10进制(H：H, S：S, L：L)分量中
Call Plugin.Color.ColorToHSL("0000FF", H, S, L)
MessageBox H&"  " & S &"  " & L
//=================================================================================
//下面这句在屏幕区域范围内查找16进制颜色("0000FF")的数量
NUM = Plugin.Color.CountColor(0, 0, 1024, 768, "FFFFFF",1)
MessageBox "颜色(""FFFFFF"")的数量=" & NUM
//=================================================================================
//下面这句在屏幕区域范围内查找多点颜色,返回左上角第一点颜色位置坐标
MessageBox "下面演示在桌面上多点找色：找""我""字位置"
XY = Plugin.Color.FindMutiColor(0, 0, 1024, 768, "FFFFFF", "2|0|FFFFFF,-6|1|FFFFFF,-3|1|FFFFFF,-6|3|FFFFFF,-3|3|FFFFFF,0|3|FFFFFF,4|3|FFFFFF,-1|5|FFFFFF,3|5|FFFFFF,-3|6|FFFFFF,-6|7|FFFFFF,1|8|FFFFFF,4|8|FFFFFF,-5|10|FFFFFF,-3|10|FFFFFF,4|10|FFFFFF", 1)
//下面这句用于分割字符串
MyArray = Split(XY, "|")
//下面这句将字符串转换成数值
X = CInt(MyArray(0)): Y = CInt(MyArray(1))
MessageBox "屏幕多点找色功能：找屏幕""我""字位置位：" & X&","&Y
MoveTo x,y
//=================================================================================
//下面这句在屏幕区域范围内查找图形形状,返回左上角第一点坐标位置
XY = Plugin.Color.FindShape(0, 0, 1024, 768, "2|0|1,4|0|1,6|0|0,-4|1|1,-1|1|1,5|1|1,-4|3|1,-1|3|1,2|3|1,6|3|1,-4|5|0,2|5|1,5|5|1,-1|6|1,6|6|0,-4|7|1,3|8|1,6|8|1,-4|10|0,-3|10|1,-1|10|1,2|10|0,6|10|1", 1)
//下面这句用于分割字符串
MyArray = Split(XY, "|")
//下面这句将字符串转换成数值
X = CInt(MyArray(0)): Y = CInt(MyArray(1))
MessageBox "屏幕找图形形状功能：找屏幕""我""字位置位：" & X&","&Y
MoveTo x,y
