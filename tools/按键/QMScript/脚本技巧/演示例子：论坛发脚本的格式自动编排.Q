[General]
SyntaxVersion=1
BeginHotkey=121
BeginHotkeyMod=0
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=0
EnableWindow=
MacroID=68a23135-16a6-4442-a9d7-f85011e67657
Description=演示例子：论坛发脚本的格式自动编排
Enable=0
AutoRun=0
[Repeat]
Type=0
Number=1
[Relative]
SetupOCXFile=
[Comment]
Content=【请在这里下拉选择】.
【功能说明】.
帮助你将按键脚本源代码，按照论坛Discuz!语言进行重新格式编排，主要是对语法进行着色，使脚本代码看起来更好看。.
.
【详细说明】.
1.演示了如何调用系统打开文件对话框，以及如何根据用户的选择，进行下一步的操作（如打开文件等）。.
2.演示了在“按键精灵”中，VBScript语言与按键精灵语言是怎么紧密结合在一起工作的（在使用中，你如果不注意，根本体会不到是在使用VBS语言）。.
3.演示了如何从头至尾，读取文件中的所有行，以及同时打开两个文件，从一个文件中读、往另外一个文件写操作。.
4.演示如何从文件名获取文件的路径。.
5.演示如何读写INI文件中脚本配置。.
.
【作者介绍】.
ahfxman, 风烈焰。.
.
【制作日期】.
2006年9月

[Script]
//变量定义
Dim objDialog, fso
Dim fSourceName,fTargetname
Dim sLine, s, stemp1,stemp2
Dim LineLenOld, LineLenNew
Dim MyArray, i1, i, s1
Dim DirPath
//变量初始化
ForReading = 1:ForWriting = 2:ForAppending=8
remColor="Green"
explainColor="Blue"
IniFileName="c:\path.ini"
//============== 主程序 ===============
Call 读取路径()
Call 打开文件()
MessageBox "程序结束, 谢谢使用"
EndScript 
//============== 子程序 ===============
Sub 打开文件()
    Set objDialog = CreateObject("UserAccounts.CommonDialog")
    objDialog.Filter = "脚本文件|*.txt"
    objDialog.InitialDir = DirPath
    intResult = objDialog.ShowOpen
    If intResult <> 0 Then
        Call 保存路径()
        Call 改名()
        Call 格式编辑()
    Else 
      Call 结束()
   End If
End Sub 
Sub 保存路径()
    sTemp2 = objDialog.FileName
    MyArray = Split(sTemp2,"\",-1,1)
    i = UBound(MyArray)
    i1 = 1
    s1 = MyArray(0)
    While i1<i
        s1 = s1 & "\" & MyArray(i1)
        i1 = i1+1
    Wend 
    s1 = s1 & "\"
    Call Plugin.File.WriteINI("setup","路径",s1,IniFileName)
End Sub 
Sub 读取路径()
    DirPath = "c:\"
    DirPath = Plugin.File.ReadINI("setup","路径",IniFileName)
End Sub
Sub 改名()
    fSourceName = objDialog.FileName
    fTargetName = Replace(fSourceName,".txt",".ini")
End Sub
Sub 格式编辑()
    Set fso = CreateObject("Scripting.FileSystemObject")
    Set fSource = fso.OpenTextFile(fSourceName, ForReading, True)
    Set fTarget = fso.OpenTextFile(fTargetName, ForWriting, True)
    While fSource.AtEndOfStream<>true
        sLine = fSource.ReadLine()
        lineLenOld = Len(sLine)
        s=Trim(sLine)
        lineLenNew = Len(s)
        sTemp1 = Left(s,2)
        sTemp2 = Right(s,Len(s)-2)
        If s="[General]"
            s="[color=" & explainColor & "]" & s
        ElseIf s="[Script]"
            s="[/color][color=" & explainColor & "]" & s & "[/color]"
        ElseIf sTemp1="//"
            s="[color=" & remColor & "]" &s &"[/color]"
        Else 
       	End If
        s = Space(lineLenOld-lineLenNew) & s
        fTarget.WriteLine(s)
    Wend     
    fSource.Close
    fTarget.Close
    Call RunApp(fTargetName)
End Sub
Sub 结束()
	EndScript 
End Sub
