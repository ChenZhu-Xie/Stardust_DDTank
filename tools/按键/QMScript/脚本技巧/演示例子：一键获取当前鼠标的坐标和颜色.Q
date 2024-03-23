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
MacroID=0719c9d3-05a8-4764-9c1d-4271b7763a3f
Description=演示例子：一键获取当前鼠标的坐标和颜色
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
一键可得到当前鼠标的坐标和颜色.
.
【使用说明】.
把鼠标移动到任意坐标位置  按下启动热键即可.
.
【作者介绍】.
【按键专家团 晨风】.
.
【制作日期】.
<2006-09-15>

[Script]
dim x,y,color
//声明变量
GetCursorPos x, y
//得到当前鼠标的坐标位置  并保存到变量x,y中
Color=GetPixelColor(x,y)
//得到指定坐标位置的颜色  并保存到变量color中
MessageBox("坐标为:"&x&","&y&" 颜色为:"&color)
//弹出窗口 输出坐标和颜色的值
