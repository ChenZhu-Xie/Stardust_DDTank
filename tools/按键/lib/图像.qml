[Comment]
命令库是按键精灵8.0版推出的全新功能
您可以把自己常用的函数和子程序写在命令库里让很多个脚本去调用
命令库最大的优势是让多个脚本共享一个命令，修改一处就等于修改多处
目前命令库功能还在测试当中，有任何建议可以在按键精灵论坛提出，网址：http://bbs.ajjl.cn

******注意！这是官方提供的命令库，请勿修改！避免以后按键精灵升级时覆盖您的修改。******//
******          如需新增命令库，可在命令库点击右键选择“新建”命令库            ******//



[General]
MacroID=d5e279c7-3d49-44d8-ba83-c1700ece0c96

[Script]
Function 查找屏幕图片数量(左坐标,上坐标,右坐标,下坐标,图片路径,相似度)
    //例子：MsgBox lib.图像.查找屏幕图片数量(0,0,800,300,"C:\图标.bmp",0.9)
    //A1.B1.C1.D1  是为了便于设置找图的范围
    Dim A1,B1,C1,D1,a,b,c,d,n,x,y,H
    A1=左坐标
    B1=上坐标
    C1=右坐标
    D1=下坐标
    //(a.b.c.d)不要修改
    a=A1: b=B1: c=C1: d=D1
    //n是图片的数量
    n=0
    Rem 循环搜索
    Call FindPic(a,b,c,d,图片路径,相似度,x,y)
    If (x>=0 and y>=0 and y=b and a=A1) Or (x>=0 and y>=0 and y=b and a<>A1) Or (x>=0 and y>=0 and a=A1 and y<>b) Then
        n=n+1: H=y:  a=x+1: b=y
        Goto 循环搜索
    ElseIf a>A1 Then
        a=A1: b=H+1
        Goto 循环搜索
    End If 
    查找屏幕图片数量 = n
End Function
Sub 无限屏幕截图(左坐标,上坐标,右坐标,下坐标,保存图片路径,文件格式)
    //例子：Call lib.图像.无限屏幕截图(0,0,100,100,"C:\","bmp")
    Dim 时间
    时间=Year(Now)& Month(Now)& Day(Now)& Hour(Now)& Minute(Now)& Second(Now)
    Call Plugin.Pic.PrintScreen(左坐标,上坐标,右坐标,下坐标,保存图片路径 & 时间 & "." & 文件格式)
End Sub



//制作：一只鱼
//日期：2009.12.22



