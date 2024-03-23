[Comment]
命令库是按键精灵8.0版推出的全新功能
您可以把自己常用的函数和子程序写在命令库里让很多个脚本去调用
命令库最大的优势是让多个脚本共享一个命令，修改一处就等于修改多处
目前命令库功能还在测试当中，有任何建议可以在按键精灵论坛提出，网址：http://bbs.ajjl.cn

******注意！这是官方提供的命令库，请勿修改！避免以后按键精灵升级时覆盖您的修改。******//
******          如需新增命令库，可在命令库点击右键选择“新建”命令库            ******//


[General]
MacroID=3626b374-83c9-406b-978f-7ef9fe123bc1



[Script]
Sub 键盘组合键(键盘码,模拟方式)
    //例子：Call lib.键盘.键盘组合键("Ctrl + Alt + A",0)
    //模拟方式：【0普通模拟，1硬件模拟，2超级模拟】
    //更多【按键码】可以自行添加
    Dim 控制键,辅助键,功能键,方向键,字母键,数字键,符号键
    控制键 = "CTRL 17,ALT 18,SHIFT 16,LCTRL 162,LALT 164,LSHIFT 160,RCTRL 163,RALT 165,RSHIFT 161,WIN 91"
    辅助键 = "CTRL 17,ALT 18,SHIFT 16,LCTRL 162,LALT 164,LSHIFT 160,RCTRL 163,RALT 165,RSHIFT 161"
    功能键 = "F1 112,F2 113,F3 114,F4 115,F5 116,F6 117,F7 118,F8 119,F9 120,F10 121,F11 122,F12 123,HOME 36,END 35,PAGEDOWN 34,PAGEUP 33,ESC 27,ENTER 13,SPACE 32"
    方向键 = "DOWN 40,UP 38,LEFT 37,RIGHT 39"
    字母键 = "A 65,B 66,C 67,D 68,E 69,F 70,G 71,H 72,I 73,J 74,K 75,L 76,M 77,N 78,O 79,P 80,Q 81,R 82,S 83,T 84,U 85,V 86,W 87,X 88,Y 89,Z 90"
    数字键 = "0 48,1 49,2 50,3 51,4 52,5 53,6 54,7 55,8 56,9 57"
    符号键 = "~ 192,` 192,- 189,= 187,[ 219,] 221,\ 220,/ 191,? 191,< 188,> 190"
    //安全检测1
    Dim 转成大写,去掉空格,i
    转成大写 = UCase(键盘码)
    去掉空格 = Replace(转成大写," ","")
    Dim 分割加号,加号数量
    分割加号 = Split(去掉空格,"+") 
    加号数量 = UBound(分割加号)
    If 加号数量>0 And 加号数量<3 Then        
        If InStr(控制键,分割加号(0))>0 And 分割加号(0)<>"" Then 
            //计算控制键码
            Dim 控,控制
            控 = Split(控制键,",") 
            For i=0 To UBound(控)
                If InStr(控(i),分割加号(0))>0 Then
                    控制 = Split(控(i)," ")   
                    Exit For 
                End If 
            Next       
            Dim 辅,辅助,按键
            If 加号数量 = 1 Then   
                If 分割加号(1)<>分割加号(0) And 分割加号(1)<>"" Then    
                    Dim 合法1(4)
                    合法1(0) = InStr(功能键,分割加号(1))
                    合法1(1) = InStr(方向键,分割加号(1))
                    合法1(2) = InStr(字母键,分割加号(1))
                    合法1(3) = InStr(数字键,分割加号(1))
                    合法1(4) = InStr(符号键,分割加号(1))
                    //安全检测2
                    If 合法1(0)>0 Or 合法1(1)>0 Or 合法1(2)>0 Or 合法1(3)>0 Or 合法1(4)>0 Then  
                        //计算按键键码
                        辅 = Split(字母键,",") 
                        For i=0 To UBound(辅)
                            If InStr(辅(i),分割加号(1) & " ")>0 Then
                                辅助 = Split(辅(i)," ")  
                                Goto 完成1 
                            End If 
                        Next  
                        辅 = Split(数字键,",") 
                        For i=0 To UBound(辅)
                            If InStr(辅(i),分割加号(1) & " ")>0 Then
                                辅助 = Split(辅(i)," ") 
                                Goto 完成1 
                            End If 
                        Next  
                        辅 = Split(功能键,",") 
                        For i=0 To UBound(辅)
                            If InStr(辅(i),分割加号(1) & " ")>0 Then
                                辅助 = Split(辅(i)," ")
                                Goto 完成1 
                            End If 
                        Next 
                        辅 = Split(符号键,",") 
                        For i=0 To UBound(辅)
                            If InStr(辅(i),分割加号(1) & " ")>0 Then
                                辅助 = Split(辅(i)," ")  
                                Goto 完成1 
                            End If 
                        Next                    
                        辅 = Split(方向键,",") 
                        For i=0 To UBound(辅)
                            If InStr(辅(i),分割加号(1) & " ")>0 Then
                                辅助 = Split(辅(i)," ")   
                                Goto 完成1 
                            End If 
                        Next  
                        Rem 完成1 
                        //按键盘组合键
                        If 模拟方式 = 0 Then
                            KeyDown Clng(控制(1)), 1
                            KeyPress Clng(辅助(1)), 1
                            KeyUp Clng(控制(1)), 1
                        ElseIf 模拟方式 = 1 Then
                            KeyDownH Clng(控制(1)), 1
                            KeyPressH Clng(辅助(1)), 1
                            KeyUpH Clng(控制(1)), 1
                        ElseIf 模拟方式 = 2 Then 
                            KeyDownS Clng(控制(1)), 1
                            KeyPressS Clng(辅助(1)), 1
                            KeyUpS Clng(控制(1)), 1
                        End If 
                        Exit Sub
                    End If 
                End If 
            ElseIf 加号数量 = 2 Then
                If 分割加号(2)<>分割加号(1) And 分割加号(2)<>"" Then 
                    Dim 合法2(5)
                    合法2(0) = InStr(辅助键,分割加号(2))
                    合法2(1) = InStr(功能键,分割加号(2))
                    合法2(2) = InStr(方向键,分割加号(2))
                    合法2(3) = InStr(字母键,分割加号(2))
                    合法2(4) = InStr(数字键,分割加号(2))
                    合法2(5) = InStr(符号键,分割加号(2))
                    //安全检测3
                    If 合法2(0)>0 Or 合法2(1)>0 Or 合法2(2)>0 Or 合法2(3)>0 Or 合法2(4)>0 Or 合法2(5)>0 Then
                        //计算按键键码
                        辅 = Split(字母键,",") 
                        For i=0 To UBound(辅)
                            If InStr(辅(i),分割加号(2) & " ")>0 Then
                                按键 = Split(辅(i)," ")  
                                Goto 完成2 
                            End If 
                        Next  
                        辅 = Split(数字键,",") 
                        For i=0 To UBound(辅)
                            If InStr(辅(i),分割加号(2) & " ")>0 Then
                                按键 = Split(辅(i)," ") 
                                Goto 完成2 
                            End If 
                        Next 
                        辅 = Split(功能键,",") 
                        For i=0 To UBound(辅)
                            If InStr(辅(i),分割加号(2) & " ")>0 Then
                                按键 = Split(辅(i)," ")
                                Goto 完成2 
                            End If 
                        Next  
                        辅 = Split(符号键,",") 
                        For i=0 To UBound(辅)
                            If InStr(辅(i),分割加号(2) & " ")>0 Then
                                按键 = Split(辅(i)," ")  
                                Goto 完成2 
                            End If 
                        Next 
                        辅 = Split(方向键,",") 
                        For i=0 To UBound(辅)
                            If InStr(辅(i),分割加号(2) & " ")>0 Then
                                按键 = Split(辅(i)," ")   
                                Goto 完成2 
                            End If 
                        Next    
                        //计算辅助键码
                        辅 = Split(辅助键,",") 
                        For i=0 To UBound(辅)
                            If InStr(辅(i),分割加号(1) & " ")>0 Then
                                辅助 = Split(辅(i)," ")
                                Exit For 
                            End If 
                        Next  
                        Rem 完成2
                        //按键盘组合键
                        If 模拟方式 = 0 Then
                            KeyDown Clng(控制(1)), 1
                            KeyDown Clng(辅助(1)), 1
                            KeyPress Clng(按键(1)), 1
                            KeyUp Clng(辅助(1)), 1
                            KeyUp Clng(控制(1)), 1
                        ElseIf 模拟方式 = 1 Then
                            KeyDownH Clng(控制(1)), 1
                            KeyDownH Clng(辅助(1)), 1
                            KeyPressH Clng(按键(1)), 1
                            KeyUpH Clng(辅助(1)), 1
                            KeyUpH Clng(控制(1)), 1
                        ElseIf 模拟方式 = 2 Then
                            KeyDownS Clng(控制(1)), 1
                            KeyDownS Clng(辅助(1)), 1
                            KeyPressS Clng(按键(1)), 1
                            KeyUpS Clng(辅助(1)), 1
                            KeyUpS Clng(控制(1)), 1
                        End If 
                        Exit Sub
                    End If 
                End If 
            End If
            //通过安检            
        End If
    End If 
End Sub


Sub 键盘按键组(键码组,模拟方式,毫秒延时)
    //例子：Call lib.键盘.键盘按键组("A,B,C,SPACE,D,E,F,G",0,50)
    //模拟方式：【0普通模拟，1硬件模拟，2超级模拟】
    //更多【按键码】可以自行添加
    Dim 控制键,辅助键,功能键,方向键,字母键,数字键,符号键,组合键
    控制键 = "CTRL 17,ALT 18,SHIFT 16,LCTRL 162,LALT 164,LSHIFT 160,RCTRL 163,RALT 165,RSHIFT 161,WIN 91"
    功能键 = "F1 112,F2 113,F3 114,F4 115,F5 116,F6 117,F7 118,F8 119,F9 120,F10 121,F11 122,F12 123,HOME 36,END 35,PAGEDOWN 34,PAGEUP 33,ESC 27,ENTER 13,SPACE 32"
    方向键 = "DOWN 40,UP 38,LEFT 37,RIGHT 39"
    字母键 = "A 65,B 66,C 67,D 68,E 69,F 70,G 71,H 72,I 73,J 74,K 75,L 76,M 77,N 78,O 79,P 80,Q 81,R 82,S 83,T 84,U 85,V 86,W 87,X 88,Y 89,Z 90"
    数字键 = "0 48,1 49,2 50,3 51,4 52,5 53,6 54,7 55,8 56,9 57"
    符号键 = "~ 192,` 192,- 189,= 187,[ 219,] 221,\ 220,/ 191,? 191,< 188,> 190"
    组合键 = 控制键 &","& 功能键 &","& 方向键 &","& 字母键 &","& 数字键 &","& 符号键
    //安全检测
    Dim 转成大写,去掉空格
    转成大写 = UCase(键码组)
    去掉空格 = Replace(转成大写," ","")
    //参数
    Dim 分割逗号,逗号数量,分割键码,键盘,键码数量
    分割逗号 = Split(去掉空格,",")
    逗号数量 = UBound(分割逗号) 
    //键库
    分割键码 = Split(组合键,",")
    键码数量 = UBound(分割键码)
    Dim i,k,n
    For i=0 To 逗号数量 
        //计算键码
        For k=0 To 键码数量
            键盘 = Split(分割键码(k)," ") 
            If 键盘(0) = 分割逗号(i) Then 
                If 模拟方式 = 0 Then 
                    KeyPress Clng(键盘(1)), 1
                ElseIf 模拟方式 = 1 Then
                    KeyPressH Clng(键盘(1)), 1 
                ElseIf 模拟方式 = 2 Then
                    KeyPressS Clng(键盘(1)), 1 
                End If 
                n = Plugin.Sys.GetTime() + 毫秒延时
                Do   
                    Delay 5
                loop Until Plugin.Sys.GetTime() >= n
                Exit For
            End If 
        Next
    Next 
End Sub 




Sub KeyList(键码组,模拟方式,毫秒延时)
    //例子：Call lib.键盘.KeyList("aA@2?"">.',/|\=-+_)(*&^QAsD",0,50)
    //需要注意的是：当输入一个引号时（"）必须输入一对（""）
    //模拟方式：【0普通模拟，1硬件模拟，2超级模拟】
    Dim 键码(46)
    键码(0) ="a〓A〓65"
    键码(1) ="b〓B〓66"
    键码(2) ="c〓C〓67"
    键码(3) ="d〓D〓68"
    键码(4) ="e〓E〓69"
    键码(5) ="f〓F〓70"
    键码(6) ="g〓G〓71"
    键码(7) ="h〓H〓72"
    键码(8) ="i〓I〓73"
    键码(9) ="j〓J〓74"
    键码(10)="k〓K〓75"
    键码(11)="l〓L〓76"
    键码(12)="m〓M〓77"
    键码(13)="n〓N〓78"
    键码(14)="o〓O〓79"
    键码(15)="p〓P〓80"
    键码(16)="q〓Q〓81"
    键码(17)="r〓R〓82"
    键码(18)="s〓S〓83"
    键码(19)="t〓T〓84"
    键码(20)="u〓U〓85"
    键码(21)="v〓V〓86"
    键码(22)="w〓W〓87"
    键码(23)="x〓X〓88"
    键码(24)="y〓Y〓89"
    键码(25)="z〓Z〓90"
    键码(26)="`〓~〓192"
    键码(27)="1〓!〓49"
    键码(28)="2〓@〓50"
    键码(29)="3〓#〓51"
    键码(30)="4〓$〓52"
    键码(31)="5〓%〓53"
    键码(32)="6〓^〓54"
    键码(33)="7〓&〓55"
    键码(34)="8〓*〓56"
    键码(35)="9〓(〓57"
    键码(36)="0〓)〓48"
    键码(37)="-〓_〓189"
    键码(38)="=〓+〓187"
    键码(39)="[〓{〓219"
    键码(40)="]〓}〓221"
    键码(41)="\〓|〓220"
    键码(42)=";〓:〓186"
    键码(43)="'〓""〓222"
    键码(44)=",〓<〓188"
    键码(45)=".〓>〓190"
    键码(46)="/〓?〓191"
    //Dim KeyS()
    Dim 数量,判断,i,m,n
    数量=Len(键码组)
    ReDim KeyS(数量)
    For i=0 to 数量-1
        KeyS(i)=Mid(键码组,i+1,1)
        判断=False
        For n=0 to 46
            MyKeyS=Split(键码(n),"〓")
            If KeyS(i)=MyKeyS(0) Then
                判断=True
                If 模拟方式 = 0 Then 
                    KeyPress Clng(MyKeyS(2)), 1
                ElseIf 模拟方式 = 1 Then
                    KeyPressH Clng(MyKeyS(2)), 1
                ElseIf 模拟方式 = 2 Then
                    KeyPressS Clng(MyKeyS(2)), 1
                End If
                Exit For
            ElseIf KeyS(i)=MyKeyS(1) Then ://需要按住Shift键来模拟
                判断=True
                If 模拟方式 = 0 Then 
                    KeyDown 16, 1
                    KeyPress Clng(MyKeyS(2)), 1
                    KeyUp 16, 1
                ElseIf 模拟方式 = 1 Then
                    KeyDownH 16, 1
                    KeyPressH Clng(MyKeyS(2)), 1
                    KeyUpH 16, 1
                ElseIf 模拟方式 = 2 Then
                    KeyDownS 16, 1
                    KeyPressS Clng(MyKeyS(2)), 1
                    KeyUpS 16, 1
                End If
                Exit For
            End If
        Next
        m = Plugin.Sys.GetTime() + 毫秒延时
        Do   
            Delay 5
        loop Until Plugin.Sys.GetTime() >= m
        If 判断=False Then Exit Sub
    Next
End Sub

//制作：一只鱼
//日期：2009.12.24
//修改：2011.04.06


