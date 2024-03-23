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
MacroID=3f185363-c959-446b-a627-62be0ab6d230
Description=演示例子：查找当前鼠标所指点的颜色相同个数
Enable=0
AutoRun=0
[Repeat]
Type=0
Number=1
[Relative]
SetupOCXFile=
[Comment]
Content=【作者,wx19841231】..
结果会记录在桌面上

[Script]
Dim Rx(10000),Ry(10000)
allx=Plugin.Sys.GetScRX()
ally=Plugin.Sys.GetScRY()
Call GetCursorPos(sx,sy)
color1=GetPixelColor(sx,sy)
x=0:y=0:a=0:i=0
t1=Plugin.Sys.GetTime()
While y<=ally/10
    While x<=allx/10
        //搜索范围,可自行调整
        IfColor x,y,color1,0 Then
            a=a+1
            i=i+1
            Rx(i)=x:Ry(i)=y
        EndIf 
        MoveTo x,y
        x=x+1
        //搜索密度,可自行调整
    wend 
    x=0
    y=y+1
    //搜索密度,可自行调整
wend 
t2=Plugin.Sys.GetTime()
t=t2-t1
Call MessageBox("当前分辨率"&allx&":"&ally&vbCrlf&"启动脚本时鼠标指向点坐标为"&sx&","&sy&vbCrlf&"所指点颜色为"& color1 &vbCrlf&"你当前屏幕共有 "&a&" 个相同颜色点"&vbCrlf&"总共耗时："&t&" 毫秒"&vbCrlf&"详情看桌面的测试结果")
Set objShell = CreateObject("WScript.Shell")
desk = objShell.SpecialFolders.Item("desktop")
//↑取得桌面路径
set fso=CreateObject("Scripting.FileSystemObject")
Const forreading=1
const forwriting=2
const forappending=8
If fso.FileExists(desk&"\测试结果.txt")=0
    set myfile=fso.createtextfile(desk&"\测试结果.txt")
    myfile.Close
    how=0
Else 
    set myfile=fso.opentextfile(desk&"\测试结果.txt",forreading)
    While myfile.atendofstream=0
        zero=myfile.readline
        Lleft=instr(1,zero,"(")
        Rright=instr(1,zero,")")
        If Rright-Lleft-1>0 then
            how=mid(zero,Lleft+1,Rright-Lleft-1)
        End if
        //↑检测第几次检测
    wend 
    myfile.Close
End If 
set myfile=fso.opentextfile(desk&"\测试结果.txt",forappending)
//↑写一个TXT到桌面
myfile.writeline ("第("& how + 1 &")次测试于"&now)
myfile.writeline ("当前分辨率"&allx&":"&ally)
myfile.writeline ("启动脚本时鼠标指向点坐标为"&sx&","&sy)
myfile.writeline ("所指点颜色为"&color1)
myfile.writeline ("你当前屏幕共有 "&a&" 个相同颜色点")
myfile.writeline ("总共耗时："&t&" 毫秒")
//↑上面就是写进TXT的测试结果
If a<>0
    myfile.writeline ("下面是找到点的坐标:x,y")
    While i>0
        myfile.writeline(Rx(i)&","&Ry(i))
        i=i-1
    wend 
    //↑上面就是写进TXT的找到的点坐标
End If 
myfile.Close
