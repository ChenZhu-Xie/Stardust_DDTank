[Comment]
命令库是按键精灵8.0版推出的全新功能
您可以把自己常用的函数和子程序写在命令库里让很多个脚本去调用
命令库最大的优势是让多个脚本共享一个命令，修改一处就等于修改多处
目前命令库功能还在测试当中，有任何建议可以在按键精灵论坛提出，网址：http://bbs.ajjl.cn

******注意！这是官方提供的命令库，请勿修改！避免以后按键精灵升级时覆盖您的修改。******//
******          如需新增命令库，可在命令库点击右键选择“新建”命令库            ******//


[General]
MacroID=dc62cde5-acb9-4b09-8c9d-53e637884bab

[Script]
Sub 移动(a,b)
    MoveTo a,b
    Delay 1000
    Call lib.测试.Yidong(500,200)
End Sub
Sub Yidong(a,b)
    MoveTo a,b
End Sub
Sub 连接(a,b)
    msgbox a & "   " & b
End Sub
Function 加法(a,b)
    加法 = a + b
End Function
Sub 弹出窗口()
    Call Lib.窗口.弹出对话框("弹出窗口a", 9000, "这是在窗口库中实现的", 0)
End Sub 



