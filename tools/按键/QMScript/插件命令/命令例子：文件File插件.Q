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
MacroID=f3b9222e-8959-4701-8fe2-14959854a150
Description=命令例子：文件File插件
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
// 测试OK
//下面这句是保存一个配置文件参数(小节名："Command" 键值名："Val" 写入内容："内容")
Call Plugin.File.WriteINI("Command", "Val", "内容", "C:\Config.ini")
MessageBox "保存一个配置文件键值"
//下面这句是读取一个配置文件参数(小节名："Command" 键值名："Val")得到内容(Text )
Text = Plugin.File.ReadINI("Command", "Val", "C:\Config.ini")
MessageBox "得到一个配置文件键值为：" & Text
//=================================================================================
//下面这句是复制目标文件("C:\Config.ini")到其他目录里("D:\")
Call Plugin.File.CopyFile("C:\Config.ini", "D:\Config.ini")
MessageBox "复制目标文件"
//下面这句是判断一个文件是否存在返回(IsFile)
IsFile = Plugin.File.IsFileExit("C:\Config.ini")
If IsFile = True Then
    MessageBox "目标文件存在"
Else 
    MessageBox "目标文件不存在"
End If 
//下面这句是删除目标文件
Call Plugin.File.DeleteFile("C:\Config.ini")
MessageBox "删除目标文件"
//=================================================================================
//下面这句是移动目标文件("D:\Config.ini")到其他目录里("C:\")
Call Plugin.File.MoveFile("D:\Config.ini", "C:\Config.ini")
MessageBox "移动目标文件"
//下面这句是创建一个文件夹
Call Plugin.File.CreateFolder("C:\Plugin")
MessageBox "创建一个文件夹"
//下面这句是删除目标文件夹
Call Plugin.File.DeleteFolder("C:\Plugin")
MessageBox "删除目标文件夹"
//下面这句是重命名文件或者文件夹("C:\Config.ini")，改名为("C:\Config.txt")
Call Plugin.File.ReNameFile("C:\Config.ini", "C:\Config.txt")
MessageBox "重命名文件"
//=================================================================================
//下面这句是设置修改文件日期时间
Call Plugin.File.SetDate("C:\Config.txt", "2009-2-19 10:10:10")
MessageBox "设置修改文件日期时间为：" & "2009-2-19 10:10:10"
//下面这句是设置文件属性读写状态(只读)
Call Plugin.File.SetAttrib("C:\Config.txt", 1)
MessageBox "设置文件属性读写状态(只读)"
//下面这句是设置文件属性读写状态(取消只读)
Call Plugin.File.SetAttrib("C:\Config.txt", 0)
MessageBox "设置文件属性读写状态(取消只读)"
//=================================================================================
//下面这句是向目标文件("C:\Config.txt")写入文本内容("内容")
Call Plugin.File.WriteFileEx("C:\Config.txt", "内容")
MessageBox "向目标文件写入文本内容"
//下面这句是向目标文件("C:\Config.txt")读出文本内容到变量(Text)
Text = Plugin.File.ReadFileEx("C:\Config.txt")
MessageBox "向目标文件读出文本内容为：" & Text
//下面这句是得到文件大小长度
Length = Plugin.File.GetFileLength("C:\Config.txt")
MessageBox "得到文件大小长度为：" & Length
//=================================================================================
//下面这句是删除目标文件
Call Plugin.File.DeleteFile("C:\Config.txt")
MessageBox "删除目标文件"
