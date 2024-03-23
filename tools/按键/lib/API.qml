[Comment]
命令库是按键精灵8.0版推出的全新功能
您可以把自己常用的函数和子程序写在命令库里让很多个脚本去调用
命令库最大的优势是让多个脚本共享一个命令，修改一处就等于修改多处
目前命令库功能还在测试当中，有任何建议可以在按键精灵论坛提出，网址：http://bbs.ajjl.cn

******注意！这是官方提供的命令库，请勿修改！避免以后按键精灵升级时覆盖您的修改。******//
******          如需新增命令库，可在命令库点击右键选择“新建”命令库            ******//


[General]
MacroID=703c757b-2ea1-46a1-8191-3111913e3930
SyntaxVersion=2
Description=API

[Script]
//API调用（测试）是一个很强大的功能，可以方便的使用系统自带的API增强脚本功能。
//但同时API调用又是一个很难用的功能，只有熟悉API的作者（一般是程序员），才能有能力用好。
//因此，按键精灵对API调用功能的使用态度应该是：
//1、鼓励将API调用功能包装为库命令，发布给大家使用。
//2、反对任何利用API调用功能开发写内存、修改数据封包、修改游戏客户端数据等可能侵犯第三方知识产权的功能。
//3、对于一些特殊的API，暂时无法支持的，可以用插件机制来弥补API的不足。

Private Declare Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String) As Long
Private Declare Function SetForegroundWindow Lib "user32" (ByVal hwnd As Long) As Long
Private Declare Function GetWindowLong Lib "user32" Alias "GetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long) As Long
Private Declare Function SetWindowLong Lib "user32" Alias "SetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long
Private Declare Function SetLayeredWindowAttributes Lib "user32" (ByVal hwnd As Long, ByVal crKey As Long, ByVal bAlpha As Byte, ByVal dwFlags As Long) As Long
Private Declare Function GetDesktopWindow Lib "user32" () As Long
Private Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal Hwnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long
Private Declare Function ShowWindow Lib "user32.dll" (ByVal hwnd As Long, ByVal nCmdShow As Long) As Long

Function 查找窗口句柄(窗口类名,窗口标题)
    //例子：MsgBox lib.API.查找窗口句柄("notepad",0)
    Dim sClass,sTitle
    If Cstr(窗口类名) = "0" Then
        查找窗口句柄 = FindWindow(vbNullString, Cstr(窗口标题))
    ElseIf Cstr(窗口标题) = "0" Then
        查找窗口句柄 = FindWindow(Cstr(窗口类名), vbNullString)
    Else
        查找窗口句柄 = FindWindow(Cstr(窗口类名), Cstr(窗口标题))
    End If
End Function
Sub 激活窗口并置前(窗口句柄)
    //返回值 = lib.API.查找窗口句柄("notepad",0)
    //例子：Call lib.API.激活窗口并置前(返回值)
    Dim SW_SHOWNORMAL
    SW_SHOWNORMAL = 1
    If 窗口句柄 <> 0 Then 
        Call ShowWindow(窗口句柄, SW_SHOWNORMAL)
        Call SetForegroundWindow(窗口句柄)
    End If
End Sub
Sub 设置窗口透明度(窗口句柄,透明度)
    //透明度：0~255
    //返回值 = lib.API.查找窗口句柄("notepad",0)
    //例子：Call lib.API.设置窗口透明度(返回值,100)
    Dim GWL_EXSTYLE, LWA_ALPHA, WS_EX_LAYERED 
    GWL_EXSTYLE = (-20)
    LWA_ALPHA = &H2
    WS_EX_LAYERED = &H80000
    Dim Rt
    If 窗口句柄 <> 0 And 透明度>=0 And 透明度<=255 Then
        Rt = GetWindowLong(窗口句柄, GWL_EXSTYLE)
        Rt = Rt Or WS_EX_LAYERED
        Call SetWindowLong(窗口句柄, GWL_EXSTYLE, Rt)
        Call SetLayeredWindowAttributes(窗口句柄, 0, 透明度, LWA_ALPHA)
    End If
End Sub
Sub 运行程序(程序路径)
    //例子：Call Lib.API.运行程序("E:\网络游戏\S三国策6\GLSGC.exe")
    Dim P, I, DirPath, ExeName
    P = Split(程序路径, "\")
    For I = 0 To UBound(P) - 1
        DirPath = DirPath & P(I) & "\"
    Next
    ExeName = P(UBound(P))
    ShellExecute GetDesktopWindow, "open", ExeName, vbNullString, DirPath, 5
End Sub







//制作：一只鱼
//日期：2010.11.10
//修改：2010.12.16
