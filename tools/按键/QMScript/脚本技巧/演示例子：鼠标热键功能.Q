[General]
SyntaxVersion=1
BeginHotkey=32771
BeginHotkeyMod=0
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=f6abbc5e-1f86-40cb-b54a-8c6e6aab8d9a
Description=演示例子：鼠标热键功能
Enable=0
AutoRun=0
[Repeat]
Type=1
Number=1943232333
[Relative]
SetupOCXFile=
[Comment]
Content=.
【功能说明】.
主要用来演示鼠标热键的有趣之处，在屏幕画圆.
.
【使用说明】.
双击鼠标左键即可在屏幕画圆，按下中止热键即可中止.
.
【作者介绍】.
vrBrothers.Leo.
感谢使用按键精灵.
.
【制作日期】.
2006.9.
.

[Script]
//例子:用鼠标画一个圆
Gosub 画圆
Sub 画圆()
    r=300:x0=512:y0=384:x=0:y=0:n=0
    While n<3.1415926*2
        x=x0+r*cos(n)
        y=y0-r*sin(n)
        MoveTo x,y
        Delay 5
        n=n+0.03
    Wend 
End sub
