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
MacroID=09fcfac4-f5cb-4604-819f-9f7b726ec631
Description=演示例子：网游通用帐号输入器v1
Enable=0
AutoRun=0
[Repeat]
Type=0
Number=1
[Relative]
SetupOCXFile=
[Comment]
Content====通用脚本===.
【功能说明】.
比如你的脚本里面有全自动输入帐号跟密码时,在那个位置删掉你的帐号密码输入,换成加入按F11键就可以帮你输,这样你的帐号跟密码不会被人知道了.
.
【使用说明】.
注意:此脚本要一直开着,除非你退出游戏不玩时再关掉;.
前提是光标在输帐号框里面闪动;输完后会帮你回车;.
122为F11键(只要在你的脚本加入按F11键就可以).
输入启动按键码! 如:F1~F12键为112~123码;a~z键为65~90码;.
(注意:按键码,不要设成跟你脚本有冲突的键).
.
【作者介绍】.
一只鱼(OneFish)♂.
.
【制作日期】.
2004.12.21

[Script]
//前提是光标在输帐号框里面闪动
GG=InputBox("请输入您的帐号!!!"&Vbcrlf&"无内容输入时直接按[确定]或[取消]退出!!!")
If StrComp("",GG)=0 Then
    Goto 结束
End If
MM=InputBox("请输入您的密码!!!"&Vbcrlf&"无内容输入时直接按[确定]或[取消]退出!!!")
If StrComp("",MM)=0 Then
    Goto 结束
End If
KEY=InputBox("请输入启动按键码! 如:F1~F12键为112~123码;a~z键为65~90码;"&Vbcrlf&"无内容输入时直接按[确定]或[取消]退出!!!")
If StrComp("",KEY)=0 Then
     Goto 结束
End If
//转换按键码
KEY=CInt(KEY)
Rem ID
Delay 100
K=WaitKey()
//122为F11键(只要在你的脚本加入按F11键就可以)
If K=KEY Then
    //GG为帐号
    SayString GG
    Delay 500
    KeyPress 9 ,1
    Delay 200
    //MM为密码
    SayString MM
    Delay 500
    KeyPress 13, 1
End If
Goto ID
Rem 结束
EndScript 
