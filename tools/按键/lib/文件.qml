[Comment]
命令库是按键精灵8.0版推出的全新功能
您可以把自己常用的函数和子程序写在命令库里让很多个脚本去调用
命令库最大的优势是让多个脚本共享一个命令，修改一处就等于修改多处
目前命令库功能还在测试当中，有任何建议可以在按键精灵论坛提出，网址：http://bbs.ajjl.cn

******注意！这是官方提供的命令库，请勿修改！避免以后按键精灵升级时覆盖您的修改。******//
******          如需新增命令库，可在命令库点击右键选择“新建”命令库            ******//



[General]
MacroID=1f3dfae4-1654-4de0-a32c-37e85ed16fd8

[Script]
Function 读取指定行文本内容(文本路径, 行数)
    //例子：Msgbox lib.文件.读取指定行文本内容("C:\Log.txt", 3)
    Dim fso,myfile,i,flag,tempp 
    flag = 1
    Set fso=CreateObject("scripting.FileSystemObject")
    If fso.FileExists(文本路径) then
        Set myfile = fso.openTextFile(文本路径,1,false)
    Else
        flag = 0
    End If
    For i=1 To 行数 - 1
        If Not myfile.AtEndOfLine Then
            myfile.SkipLine
            tempp = myfile.Line
        End If
    Next
    If flag = 1 Then
        If Not myfile.AtEndOfLine Then
            读取指定行文本内容 = myfile.ReadLine
        Else
            读取指定行文本内容 = "溢出！"
        End If
        myfile.close
    Else
        读取指定行文本内容 = "文件不存在！"
    End If
End Function
Sub 删除指定行文本内容(文本路径, 行数)
    //例子：Call lib.文件.删除指定行文本内容("C:\log.txt",5)
    Dim ForReading ,ForWriting 
    ForReading = 1
    ForWriting = 2
    Dim objFSO,objFile,strLine,strNewFile
    Set objFSO = CreateObject("Scripting.FileSystemObject")
    Set objFile = objFSO.OpenTextFile(文本路径,ForReading)
    Do Until objFile.AtEndOfStream
        strLine = objFile.Readline       
        If 行数 = objFile.Line-1 or 行数 = 0 then 
            strNewFile = strNewFile 
        Else
            strNewFile = strNewFile & strLine & vbcrlf
        End If
    Loop
    objFile.Close
    Set objFile = objFSO.OpenTextFile(文本路径,ForWriting)
    objFile.Write strNewFile
    objFile.Close
End Sub
Sub 替换指定行文本内容(文本路径, 文本内容, 行数)
    //例子：Call lib.文件.替换指定行文本内容("C:\log.txt","文本内容",5)
    Dim ForReading ,ForWriting 
    ForReading = 1
    ForWriting = 2
    Dim objFSO,objFile,strLine,strNewFile
    Set objFSO = CreateObject("Scripting.FileSystemObject")
    Set objFile = objFSO.OpenTextFile(文本路径,ForReading)
    Do Until objFile.AtEndOfStream
        strLine = objFile.Readline  
        If 行数 = objFile.Line-1 or 行数 = 0 then
            strNewFile = strNewFile & 文本内容 & vbcrlf
        Else
            strNewFile = strNewFile & strLine & vbcrlf
        End If
    Loop
    objFile.Close
    Set objFile = objFSO.OpenTextFile(文本路径,ForWriting)
    objFile.Write strNewFile
    objFile.Close
End Sub
Sub 插入文本内容到指定行(文本路径, 文本内容, 行数)
    //例子：Call lib.文件.插入文本内容到指定行("C:\log.txt","文本内容",5)
    Dim ForReading ,ForWriting 
    ForReading = 1
    ForWriting = 2
    Dim objFSO,objFile,strLine,strNewFile
    Set objFSO = CreateObject("Scripting.FileSystemObject")
    Set objFile = objFSO.OpenTextFile(文本路径,ForReading)
    Do Until objFile.AtEndOfStream
        strLine = objFile.Readline       
        strNewFile = strNewFile & strLine & vbcrlf
        If 行数 = objFile.Line-1 or 行数 = 0 then
            strNewFile = strNewFile & 文本内容 & vbcrlf
        End If
    Loop
    objFile.Close
    Set objFile = objFSO.OpenTextFile(文本路径,ForWriting)
    objFile.Write strNewFile
    objFile.Close
End Sub
Function 遍历指定目录下所有文件名(文件夹路径)
    //注意：返回的是数组变量，存储着每一个文件名。
    //例子：数组 = lib.文件.遍历指定目录下所有文件名("C:\")
    //      For i=0 to UBound(数组)-1
    //          TracePrint 数组(i)
    //      Next
    Dim 文件名,fso,folder,f,files
    文件名 = ""
    set fso=createobject("scripting.filesystemobject")
    set folder=fso.getfolder(文件夹路径)
    set files=folder.files
    For each f in files
        文件名 = 文件名 & f.name & ","
    next
    //遍历指定目录下所有文件名 = 文件名
    遍历指定目录下所有文件名 = Split(文件名, ",")
End Function


//制作：一只鱼
//日期：2009.12.22
//修改：2011.01.04


