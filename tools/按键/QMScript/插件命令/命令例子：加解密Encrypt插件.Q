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
MacroID=14e23d57-658b-4c6f-bf7f-13843cb6bef9
Description=命令例子：加解密Encrypt插件
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
//下面这句是对字符串内容("按键精灵")进行MD5加密
TextMD5 = Plugin.Encrypt.Md5String("按键精灵")
MessageBox "按键精灵=" & TextMD5
//=================================================================================
//下面这句是对路径文件("C:\WINDOWS\Media\Windows XP 启动.wav")进行MD5加密
FileMD5 = Plugin.Encrypt.Md5File("C:\WINDOWS\Media\Windows XP 启动.wav")
MessageBox FileMD5
