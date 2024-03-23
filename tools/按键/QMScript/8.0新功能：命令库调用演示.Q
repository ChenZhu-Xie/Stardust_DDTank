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
MacroID=6e949868-23ba-4f1e-8f1a-2f0b8e575ee7
Description=8.0新功能：命令库调用演示
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
//<>---------------------------------------------演示命令库调用
Msgbox "命令库加法测试：（100+100）= " & lib.测试.加法(100,100)
Call lib.测试.移动(100,100)
Call lib.测试.连接("我是","按键精灵8.0 新功能测试例子！")
Call lib.测试.弹出窗口()
//<>---------------------------------------------打开命令库文件
MessageBox "下面打开命令库【lib】文件夹里【测试.qml】文件查看内容！"
If Plugin.File.IsFileExit(".\lib\测试.qml")=True Then
    Call RunApp("notepad.exe .\lib\测试.qml")
Else
    MsgBox "Sorry！做成小精灵测试不会打开“命令库”文件查看内容哦。"
End If
