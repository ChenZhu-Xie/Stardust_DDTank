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
MacroID=f04b0a7e-5137-4d2b-890c-73a7cce07956
Description=8.1新功能：调用API演示（测试）
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

//<>-----------------------------------------------------------------------------<>
//<>------------------------------调用ＡＰＩ：------------------------------------<> 
//<>-----------------------------------------------------------------------------<>
//１：(支持3种调用方法)：
//Declare Function URLDownloadToFile Lib "urlmon" Alias "URLDownloadToFileA" (ByVal pCaller As Long, ByVal szURL As String, ByVal szFileName As String, ByVal dwReserved As Long, ByVal lpfnCB As Long) As Long
//Public Declare Function URLDownloadToFile Lib "urlmon" Alias "URLDownloadToFileA" (ByVal pCaller As Long, ByVal szURL As String, ByVal szFileName As String, ByVal dwReserved As Long, ByVal lpfnCB As Long) As Long
Private Declare Function URLDownloadToFile Lib "urlmon" Alias "URLDownloadToFileA" (ByVal pCaller As Long, ByVal szURL As String, ByVal szFileName As String, ByVal dwReserved As Long, ByVal lpfnCB As Long) As Long
//２：(支持3种调用方法)：
Declare Function GetForegroundWindow Lib "user32" () As Long
Private Declare Function GetWindowText Lib "user32" Alias "GetWindowTextA" (ByVal hwnd As Long, ByVal lpString As String, ByVal cch As Long) As Long
Public Declare Function GetNextWindow Lib "user32" Alias "GetWindow" (ByVal hwnd As Long, ByVal wFlag As Long) As Long


//<>-----------------------------------------------------------------------------<>
//<>------------------------------演示例子１：------------------------------------<>
//<>-----------------------------------------------------------------------------<>
MsgBox "演示例子1：下载文件"
//下载兄弟论坛Logo图片例子：
判断 = 下载文件("http://bbs.vrbrothers.com/images/newblue/logo.gif", "c:\logo.gif")
If 判断 = 0 Then
    If MsgBox("下载文件成功！是否打开查看图像？",4,"提示：") = 6 Then
        //存放在C盘，下面会帮你打开查看
        RunApp "c:\logo.gif"
    End If
End If


//<>-----------------------------------------------------------------------------<>
//<>------------------------------演示例子２：------------------------------------<> 
//<>-----------------------------------------------------------------------------<>
//首先手动打开多个记事本：
MsgBox "演示例子2： 遍历窗口句柄"& vbcrlf & vbcrlf &"首先请手动打开多个记事本，然后再按“确定”"
//遍历符合标题窗口句柄例子：
MsgBox "找到的窗口，它是：" & 遍历窗口句柄("记事本")


//<>-----------------------------------------------------------------------------<>
//<>------------------------------子程序归类：------------------------------------<> 
//<>-----------------------------------------------------------------------------<>
EndScript
//１：
Function 下载文件(网页地址, 保存文件路径)
    下载文件 = URLDownloadToFile(0, 网页地址, 保存文件路径, 0, 0)
End Function
//２：
Function 遍历窗口句柄(查找标题)
    Dim hwd,长度,句柄集合
    句柄集合=""
    '没参数 也要加括号()
    hwd = GetForegroundWindow() 
    '“标题”这个变量不能去定义，因为不能用普通定义变量的方法。
    标题 = Space(255)  
    GetWindowText hwd, 标题, 255
    Do While hwd <> 0 
        '只有2才表示找下一个窗口
        hwd = GetNextWindow(hwd, 2)
        长度 = GetWindowText(hwd, 标题, 255)
        If InStr(left(标题,长度), 查找标题) > 0 Then
            TracePrint 标题
            句柄集合=句柄集合 & hwd & "|"
        End If
    Loop    
    遍历窗口句柄 = 句柄集合
End Function
