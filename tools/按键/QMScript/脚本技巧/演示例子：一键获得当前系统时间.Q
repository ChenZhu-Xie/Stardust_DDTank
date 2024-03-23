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
MacroID=b102b659-a66f-4979-8541-1ae75660e025
Description=演示例子：一键获得当前系统时间
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
按下热键，返回当前的时间.
.
【使用说明】.
请先设置一下时间通知方式.
1是弹对话框提示.
2是输出文本提示（适合网游里面用）.
.
【按键专家团 晨风】 .
.
.

[Script]
UserVar ShuChuFangShi = 1 "获取到时间之后的输出方式。1是弹对话框，适合平时看时间；2是文本输出，适合网游里使用"
Dim Y,Mon,D,W,h,m,s,SJ
//先声明变量
Y=Year(Date):Mon=Month(Date):D=Day(Date):W=Weekday(Date,vbMonday)
//利用VBS函数获得当前系统的年,月,日,星期   并各自保存到变量中
h=Hour(time):m=Minute(time):s=Second(time)
//利用VBS函数获得当前系统的时,分,秒   并各自保存到变量中
SJ=Y &"年"& Mon &"月"& D &"号 星期"& W &" "& h &"点"& m &"分"& s &"秒"
//把得到的年,月,日,星期,时,分,秒连接起来   并保存到SJ变量中
If ShuChuFangShi=1 Then
    //最后弹出个窗口   显示当前的系统时间（变量SJ）
    MessageBox SJ
End If  
If ShuChuFangShi=2 Then
    //最后弹出个窗口   显示当前的系统时间（变量SJ）
    MessageBox SJ
End If 
