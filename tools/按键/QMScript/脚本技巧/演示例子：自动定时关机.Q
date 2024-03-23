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
MacroID=83ac5446-d86c-44d3-aba2-a89a68cf08a7
Description=演示例子：自动定时关机
Enable=0
AutoRun=0
[Repeat]
Type=0
Number=1
[Relative]
SetupOCXFile=
[Comment]
Content====日常应用===.
【功能说明】.
自动定时关机。.
时间格式为24小时制 -- 00：00~23：59。.
当不在这个范围内会报错并返回让用户重新输入~~ ：）。.
.
【使用说明】.
电脑在无人值守里，在设置的时间自动关机！启动热键为<F10>，中止热键为<F12>。.
.
.
【作者介绍】.
【按键专家团 Jimmyzs】.
.
【制作日期】.
<2006-7-13>

[Script]
//*********************************   说明   *****************************************
//时间格式为24小时制 -- 00：00~23：59
//当不在这个范围内会报错并返回让用户重新输入~~ ：）
//*********************************   源代码   *****************************************
dim Obj,UserName,NowTime,LenS,Num
set Obj = createobject("WScript.Shell")
//调用“Wscript.Shell”
UserName=Obj.RegRead("HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\RegisteredOwner")
// RegRead -- 读取注册表
YN=Obj.Popup(UserName&" 你好，是否使用自动定时关机？",0,"关机？",36)
//Popup--弹出对话框
If YN=6 Then
    //标记 输入时间
    Rem InputTime
    SWTime=InputBox ("请输入关机时间！24小时格式(00:00~23:59之间)！如：2:03 ， 22:35")
    //*********************************** 判断时间格式 ****************************************************
    LenS=Len(SWTime)
    //Len--获得字符串的长度
    Num=Instr(SWTime,":")
    //Instr--获得":"所在字符串中的位置
    If Num=0 Then
        Num=Instr(SWTime,"：")
    End If
    If Num=0 Then
        Call Obj.Popup("间隔符错误！请用“ : ”或者“ ： ”",5,"时间格式错误！",48)
        //跳到 输入时间
        Goto InputTime
    End If
    If left(SWTime,Num-1)>23 or left(SWTime,Num-1)<0  Then
        //left--取字符串左边Num-1个长度的字符
        Call Obj.Popup("小时格式输入错误！",5,"时间格式错误！",48)
        Goto InputTime
    End If
    If Right(SWTime,LenS-Num)>59 or Right(SWTime,LenS-Num)<0 Then
        //Right--取字符串右边LenS-Num个长度的字符
        Call Obj.Popup("分钟格式输入错误！",5,"时间格式错误！",48)
        //跳到 输入时间
        Goto InputTime
    End If
    //*********************************** 判断时间格式 ****************************************************
    Call Obj.Popup("系统将在"&SWTime&"关机！！",5,"自动关机！",48)
    Rem Start
    NowTime=Time
    //Time -- 获得当前时间
    If Hour(SWTime)=Hour(NowTime) and Minute(SWTime)=Minute(NowTime) Then
         //Hour -- 获得小时， Minute -- 获得分钟
        Obj.Run "shutdown /f /s /t 0"
        //调用shutdown命令。 /f--强行关闭应用程序而不提醒， /s--关闭计算机（要重启的话，请把这改成/r[重启计算机]），/t time--在time秒后前闭计算机。
    End If
    For 30
    	Delay 1000
    Next
    Goto Start
End If
