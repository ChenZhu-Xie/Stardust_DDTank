[Comment]
命令库是按键精灵8.0版推出的全新功能
您可以把自己常用的函数和子程序写在命令库里让很多个脚本去调用
命令库最大的优势是让多个脚本共享一个命令，修改一处就等于修改多处
目前命令库功能还在测试当中，有任何建议可以在按键精灵论坛提出，网址：http://bbs.ajjl.cn

******注意！这是官方提供的命令库，请勿修改！避免以后按键精灵升级时覆盖您的修改。******//
******          如需新增命令库，可在命令库点击右键选择“新建”命令库            ******//


[General]
MacroID=45322cb5-c49c-4570-97d6-48c53e5170ed

[Script]
Function 得到鼠标在窗口上位置()
    //例子：MsgBox lib.窗口.得到鼠标在窗口上位置()
    Dim 鼠标下句柄,x,y,坐标
    鼠标下句柄 = Plugin.Window.MousePoint()
    Call GetCursorPos(x,y)
    坐标 = Plugin.Window.GetClientRect(鼠标下句柄)
    Dim MyArray
    MyArray = Split(坐标, "|")
    得到鼠标在窗口上位置 = x - Clng(MyArray(0)) & "|" & y - Clng(MyArray(1)) 
End Function

Function 弹出对话框(提示内容,等待时间,提示标题,显示样式)
    //例子：MsgBox "你选择的是：" & lib.窗口.弹出对话框("提示内容",0,"提示标题",68)
    //详细使用参考这里：http://bbs.vrbrothers.com/viewthread.php?tid=7662
    Dim obj
    Set obj = CreateObject("WScript.Shell")
    弹出对话框=Cint(obj.Popup(提示内容,等待时间,提示标题,显示样式))
    Set obj = Nothing
End Function





//制作：一只鱼
//日期：2009.12.22
//修改：2010.01.19


