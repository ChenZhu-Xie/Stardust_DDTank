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
MacroID=ee22e37e-e500-4614-8b0f-0365d863f6a9
Description=命令例子：办公文档Office插件
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
//在您的电脑上需要安装有Office办公软件,否则使用不了
//下面这句是打开Excel文档工作表
Call Plugin.Office.OpenXls("C:\测试.xls")
//下面这句是向Excel文档工作表(1)单元格(1, 1)写入("内容")内容
Call Plugin.Office.WriteXls(1, 1, 1, "内容")
MessageBox "写入单元格的内容是：""内容"""
//=================================================================================
//下面这句是向Excel文档工作表(1)单元格(1, 1)读出内容存入(Text)变量
Text = Plugin.Office.ReadXls(1, 1, 1)
//下面这句是关闭Excel文档工作表
Call Plugin.Office.CloseXls()
MessageBox "读取到的单元格内容是：" & Text
//=================================================================================
//下面这句是删除目标文件
MessageBox "可以打开(C:\测试.xls)文件查看是否成功写入内容"
