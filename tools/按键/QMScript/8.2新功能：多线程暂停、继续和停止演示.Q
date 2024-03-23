[General]
SyntaxVersion=2
BeginHotkey=121
BeginHotkeyMod=0
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=9935b5cb-a294-431f-b9b6-1a4713c6d160
Description=8.2新功能：多线程暂停、继续和停止演示
Enable=0
AutoRun=0
[Repeat]
Type=0
Number=1
[Relative]
SetupOCXFile=
[Comment]

[Script]
MessageBox "多线程命令还在测试当中，并不稳定，请谨慎使用！不推荐新手使用。"
线程ID=BeginThread(测试) 
Delay 3000
//<>-----------------------------------------启动“测试”线程的运行，并返回线程ID编号

MsgBox "线程暂停运行！3秒", 64, "演示："
PauseThread 线程ID
Delay 3000
//<>-----------------------------------------等待3秒后暂停“测试”线程的运行

MsgBox "线程继续运行！3秒", 64, "演示："
ContinueThread 线程ID
Delay 3000
//<>-----------------------------------------等待3秒后继续“测试”线程的运行

MsgBox "线程停止运行！", 64, "演示："
StopThread 线程ID
//<>-----------------------------------------3秒后停止“测试”线程的运行

ExitScript 
//<>-----------------------------------------停止并退出脚本运行
Sub 测试()
    i=0
    Do 
        Call Plugin.Msg.ShowScrTXT(0, 0, 600, 100, "线程1屏幕内容填写" & i, "0000FF")
        TracePrint  "屏幕内容填写" & i
        Call Plugin.Msg.Tips("我是气泡！线程1屏幕内容填写" & i)
        Delay 1000
        i=i+1
    Loop 
End Sub

