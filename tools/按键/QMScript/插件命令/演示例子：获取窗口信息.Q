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
MacroID=b41b7dd1-10a0-47a3-9935-7183c8a34224
Description=演示例子：获取窗口信息
Enable=0
AutoRun=0
[Repeat]
Type=0
Number=1
[Relative]
SetupOCXFile=
[Comment]
Content=.
【功能说明】.
　　该脚本查找当前窗口的子窗体，包括按钮、标签、图像、列表框等，并将这些子窗体的窗口句柄、类名、坐标信息，保存到c盘根目录下的log.txt文件中。.
.
【详细说明】.
　　该脚本主要举例说明以下功能：.
　　1、文本文件的读写操作。.
　　2、Window插件的调用演示。.
　　3、如何从一个长字符串中，按特定的格式分解出所需要的数据——Split函数使用.
　　4、数组元素的使用方法。.
5、循环语句的使用。.
　　4、如何调用软件（RunApp的使用）。.
.
【作者介绍】.
ahfxman.
.
【制作日期】.
2006年9月.
.

[Script]
//先定义变量是一个好习惯
dim handle,handle1, s,s1,s2,s3, MyArray,parentH, fileHandle
set TiShiObj = createobject("WScript.Shell")
//=================== 主程序 ======================
//创建一个文件名为
fileHandle ="c:\log.txt"
//调用子程序
Call 查找窗体()
//用笔记本软件打开刚才保存的文件
Call RunApp(fileHandle)
Rem 结束
//弹出对话框,显示程序结束
Call TiShiObj.Popup("程序终止运行",3,"3秒后窗口自动关闭",0)
//msgbox "程序终止运行",64,"程序终止运行"
//程序结束
EndScript 
//================== 子程序 ========================
Sub 查找窗体()
    //获取当前窗口的句柄
    parentH = Plugin.Window.Foreground()
    //如果当前无窗口,则结束程序
    If parentH = 0 Then
        Call MessageBox("没有找到父窗口，程序结束")
        //Goto 结束
    End If 
    //变量初始化
    handle=1
    handle1=0
    //一直循环查找到子窗口,直到找不到为止
    While handle<>0
        //查找当前窗口的子窗口
        handle = Plugin.Window.FindEx(parentH, handle1,0,0)
        //如果找到子窗口
        If handle <> 0 Then
            //获取子窗口的信息, GetClientRect 返回的信息是一个字符串, 格式如:123|356|200|400
            s = Plugin.Window.GetClientRect(handle)
            //按|对上面的字符串进行分割, 并保存到数组里面
            //Split进行分割后, MyArray数组中的数组如下:
            // MyArray(0) = 123  <---窗口的左边坐标
            // MyArray(1) = 356  <---窗口的上边坐标
            // MyArray(2) = 200  <---窗口的宽度
            // MyArray(3) = 400  <---窗口的高度
            //注意: 数组的第一个元素, 读取的时候是 MyArray(0), 而不是  MyArray(1)
            //即数组元素的下标是从 0 开始, 而不是从 1 开始的
            dim MyArray
            MyArray = Split(s, "|", -1, 1)
            //用 & 连字符, 将各数组连接起来
            s = "坐标(x,y)：" & MyArray(0) & "," & MyArray(1) & " 宽度，高度：" & MyArray(2) & "," & MyArray(3)
            //获取窗口的类名称
            s1 = Plugin.Window.GetClass(handle)
            s1 = "类名: " & s1
            //获取窗口的标题
            s2 = Plugin.Window.GetText(handle)
            s2 = ",标题：" & s2
            s3 = " 句柄： " & CStr(handle)
            //保存上面的各种信息写到文件中,即c:\log.txt
            If fileHandle <> -1 Then
                Call Plugin.File.WriteFileEx(fileHandle, s1 & s2 & s & s3)
            End If 
        End If 
        //更新handle1的值,以保证循环继续
        handle1 = handle
    Wend 
End Sub
