[Comment]
命令库是按键精灵8.0版推出的全新功能
您可以把自己常用的函数和子程序写在命令库里让很多个脚本去调用
命令库最大的优势是让多个脚本共享一个命令，修改一处就等于修改多处
目前命令库功能还在测试当中，有任何建议可以在按键精灵论坛提出，网址：http://bbs.ajjl.cn

******注意！这是官方提供的命令库，请勿修改！避免以后按键精灵升级时覆盖您的修改。******//
******          如需新增命令库，可在命令库点击右键选择“新建”命令库            ******//



[General]
MacroID=a2f21d32-ba73-4078-ab71-8b1c505273bd
SyntaxVersion=2
Description=系统

[Script]
//请在下面写上您的子程序或函数
//写完保存后，在任一命令库上点击右键并选择“刷新”即可


Sub 结束进程(映像名称)
    //Call Lib.系统.结束进程("notepad.exe")
    Dim strComputer, objWMIService, colProcessList, objProcess
    strComputer = "."
    Set objWMIService = GetObject("winmgmts:\\" & strComputer & "\root\cimv2")
    Set colProcessList = objWMIService.ExecQuery("Select * from Win32_Process Where Name = '" & 映像名称 & "'")
    For Each objProcess in colProcessList
        objProcess.Terminate
    Next
End Sub


//制作：一只鱼
//日期：2010.10.07
//修改：2010.10.07