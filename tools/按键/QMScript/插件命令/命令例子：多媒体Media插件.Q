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
MacroID=968acfa3-f6d6-42ed-a3c5-b7bcd7e68d49
Description=命令例子：多媒体Media插件
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
//下面这句是音阶(标准(M))音符(DO(1))节拍(1/16拍)
Call Plugin.Media.Beep(523, 200)
//下面这句是音阶(标准(M))音符(RE(2))节拍(1/16拍)
Call Plugin.Media.Beep(578, 200)
//下面这句是音阶(标准(M))音符(MI(3))节拍(1/16拍)
Call Plugin.Media.Beep(659, 200)
//下面这句是音阶(标准(M))音符(FA(4))节拍(1/16拍)
Call Plugin.Media.Beep(698, 200)
//下面这句是音阶(标准(M))音符(SO(5))节拍(1/16拍)
Call Plugin.Media.Beep(784, 200)
//下面这句是音阶(标准(M))音符(LA(6))节拍(1/16拍)
Call Plugin.Media.Beep(880, 200)
//下面这句是音阶(标准(M))音符(SI(7))节拍(1/16拍)
Call Plugin.Media.Beep(988, 200)
MessageBox "Beep 播放结束!!"
//=================================================================================
//下面这句是播放路径("C:\WINDOWS\Media\Windows XP 启动.wav")音乐文件
Call Plugin.Media.Play("C:\WINDOWS\Media\Windows XP 启动.wav")
MessageBox "现在 播放音乐!!"
Delay 1000
//下面这句是关闭声音播放
Call Plugin.Media.Stop()
MessageBox "播放停止!!"
//=================================================================================
//下面这句是设置波形音量大小为(50)
Call Plugin.Media.Vol(50)
MessageBox "设置了声音大小!!"
//=================================================================================
//下面这句是播放路径("C:\WINDOWS\Media\Windows XP 关机.wav")音乐文件
Call Plugin.Media.Play("C:\WINDOWS\Media\Windows XP 关机.wav")
Delay 1000
MessageBox "现在 播放音乐!!"
