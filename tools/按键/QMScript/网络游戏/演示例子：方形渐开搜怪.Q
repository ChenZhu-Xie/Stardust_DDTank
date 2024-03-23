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
MacroID=259b91f2-de51-4a84-ac1c-2e4d9bd77776
Description=演示例子：方形渐开搜怪
Enable=0
AutoRun=0
[Repeat]
Type=0
Number=1
[Relative]
SetupOCXFile=
[Comment]
Content====网络游戏脚本===.
【功能说明】.
取用方形渐开搜怪核心.
1、可以设置搜怪范围（鼠标活动范围，让鼠标不移动到你所设的范围外）.
2、可以设置渐开起点坐标（有些游戏主角坐标并不是屏幕中点的，通过设置渐开起点坐标能保证先搜身边的怪）.
3、可以设置搜索点密度（合理设置好点距搜怪效率会更好）.
4、可以设置从第几圈开始搜索.
.
【使用说明】.
根据不同的游戏，设置好用户自定义变量就OK了.
参数格式请参照默认设置，X、Y坐标之间用“，”分隔.
.
【作者介绍】.
【按键专家团 星帆】.
.
【制作日期】.
2006.9.15

[Script]
UserVar LTop="200,100" "鼠标活动范围：左上角坐标"
UserVar RBot="700,500" "鼠标活动范围：右下角坐标"
UserVar Center="300,200" "方形渐开搜怪起点"
UserVar L=20 "2个搜怪点之间的距离"
UserVar M=3 "从第几圈开始搜索"
//变量定义
Dim s,v,i,n,x,y,a1,b1,a2,b2,c1,c2,x0,y0,k1,k2
//在鼠标左上角活动范围变量“LTop”内查找逗号，用于区分左上角的X、Y坐标
s=InStr(LTop,",")
//Mid(参数1，参数2，参数3）：从字符串中返回指定数目的字符
//参数1（字符串表达式，从中返回字符）
//参数2（参数1中被提取的字符部分的开始位置）
//参数3（要返回的字符数，若省略将返回字符串中从参数2 到字符串结束的所有字符）
//“Mid(LTop,1,s-1)”从字符串“LTop”中的第1个字符开始取s-1个字符
//int(Mid(LTop,1,s-1)):将取到的字符转换成整数
//取鼠标活动范围左上角横坐标赋值到变量a1
a1=int(Mid(LTop,1,s-1))
//取鼠标活动范围左上角纵坐标赋值到变量b1
b1=int(Mid(LTop,s+1))
s=InStr(RBot,",")
//取鼠标活动范围右下角横坐标赋值到变量a2
a2=int(Mid(RBot,1,s-1))
//取鼠标活动范围右下角纵坐标赋值到变量b2
b2=int(Mid(RBot,s+1))
s=InStr(Center,",")
//取起点坐标赋值到x0,y0
x0=int(Mid(Center,1,s-1))
y0=int(Mid(Center,s+1))
//比较x0到a1和x0到a2的长度，取最长的距离来限制方形渐开的范围，保证渐开线能全部覆盖鼠标活动范围
If x0-a1>=a2-x0 Then
    n=a1
Else 
    //将x0到a2的距离转换到左边，方便下面的While x>=n的循环判断
    n=x0-(a2-x0)
End If 
Rem 开始搜怪
//将点距赋值到v
v=L
//将渐开起点圈数赋值到i
i=M
//将渐开起点坐标赋值到x,y
x=x0:y=y0-v
While x>=n
    k1=0:k2=v
    For 2
        For i
            x=x+k1:y=y+k2
            //只有（x，y）点在鼠标活动范围内才移动鼠标和执行颜色变化判断
            If x>=a1 and x<=a2 and y>=b1 and y<=b2 Then
                //计算出x，y后，先取x，y点的颜色赋值到c1
                c1=GetPixelColor(x,y)
                MoveTo x,y
                Delay 10
                //移动到x,y延时10毫秒后再次取x,y点的颜色并赋值到c2
                c2=GetPixelColor(x,y)
                //如果x,y点的颜色鼠标移动前和鼠标移动后的颜色不同，则执行打怪动作
                If c1<>c2  Then
                    //打怪代码
                    Delay 1000
                    //打完怪后再重新开始搜索
                    Goto 开始搜怪
                End If 
                Delay 1
            End If 
        Next 
        k1=v:k2=0
    Next
    i=i+1:v=v*(-1)
Wend 
Delay 200
//搜索完鼠标活动范围后重新开始搜索
Goto 开始搜怪
