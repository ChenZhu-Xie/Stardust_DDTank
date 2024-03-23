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
MacroID=6ee92d8a-7194-441a-a05f-0024dac67e96
Description=演示例子：后台按键、后台喊话
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
演示如何给一个后台的窗口发送键盘消息.
.
【使用说明】.
按下热键会启动一个写字板，之后可以将写字板切换到后台，你也会发现脚本不断的向写字板里面写入 "Hello, world" 并回车.
.
【作者介绍】.
vrBrothers.CR.
.

[Script]
Call RunApp("notepad")
Delay 1000
//需要确认把记事本放在前台
hwnd=Plugin.Window.Find(0,"无标题 - 记事本")
//需要先得到可以发送按键消息的窗口
Hwnd = Plugin.Window.FindEx(Hwnd, 0, "Edit", 0)
//Plugin Window.Active(hwnd)
//Plugin hwnd = Window.GetKeyFocusWnd()
MessageBox "提醒：如果您现在的热键模式是“普通模式”，将有可能导致键盘失去响应，按下ctrl+alt+del即可解决这个问题。建议您在设置里使用“软件模式”的热键启动方式。"
MessageBox "现在可以把记事本的窗口放在后台，或者是最小化"
//等待两秒钟
Delay 2000
For i=0 To 10
    //后台喊话
    Call Plugin.Bkgnd.SendString(hwnd,"Hello, world")
    //后台按键
    Call Plugin.Bkgnd.KeyDown(hwnd,13)
    Delay 500
Next 
