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
MacroID=79ee1a60-6e7e-410a-93a6-5d1bcf30be4e
Description=自动备份功能说明
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
在主界面点击[设置]按钮可以设置自动备份的方法.
自动备份会在每次编辑脚本和保存脚本时将脚本自动备份.
避免停电等意外故障导致的脚本丢失.
.
.

[Script]
Call 功能介绍()
Call 如何使用备份文件()
EndScript 
Sub 功能介绍()
    Txt="大家好,我是按键精灵,今天我要给大家介绍一下如何使用按键精灵提供的自动备份功能"&vbcrlf
    Txt=Txt& "在主界面点击[设置]按钮可以设置自动备份的方法。"&vbcrlf
    Txt=Txt& "1、提供这个功能可以更好的为你脚本做备份,避免停电等意外故障导致的脚本丢失！！"&vbcrlf
    Txt=Txt& "2、备份功能使用情况："&vbcrlf
    Txt=Txt& "a、会在保存脚本时自动备份一次。"&vbcrlf
    Txt=Txt& "b、会在修改脚本时自动备份一次。"&vbcrlf
    Txt=Txt& "c、备份出来的文件名按顺序序号排列保存在[自动备份]目录里，提供了十次备份记录！！"&vbcrlf
    Txt=Txt& "d、在自动备份目录下点鼠标右键，选择刷新列表，即可看到最近备份的文件"&vbcrlf
    Txt=Txt& "访问按键精灵官网提供的知识库，学习自动备份功能的设置技巧。"
    MessageBox Txt
End Sub
Sub 如何使用备份文件()
    MessageBox "保存的备份文件后缀名默认为.bak。在使用备份文件时，只要将备份文件的后缀名改为.Q就可以使用了"
    Call RunApp("自动备份")
    MessageBox "介绍结束，大家可以自己动手体验一下~"
End Sub
