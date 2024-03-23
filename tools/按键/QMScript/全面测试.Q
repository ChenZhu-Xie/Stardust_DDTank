[General]
SyntaxVersion=2
BeginHotkey=121
BeginHotkeyMod=0
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=37e7eb1b-8700-4a1d-9279-1b5528ef62bf
Description=命令检测：全面测试升级版
Enable=0
AutoRun=0
[Repeat]
Type=0
Number=1
[Relative]
SetupOCXFile=
[Comment]

[Script]
AllStartTime = Plugin.Sys.GetTime()
//PutAttachment Call Plugin.*.bmp
set TiShiObj = createobject("WScript.Shell")
Dim NotepadHwnd
dim TestFileFolder,TestFilePath,PaintTitle
TestFileFolder = "c:\Qm_Auto_Test\"
TestFilePath = TestFileFolder & "测试报告.txt"
PaintTitle = "未命名 - 画图"
//PaintClass = "MSPaintApp"
PaintViewClass = "AfxFrameOrView42u"
PaintClientClass = "Afx:1000000:8"
NotepadTitle = "无标题 - 记事本"
//NotepadClass = "notepad"
Call Plugin.File.DeleteFolder("c:\Qm_Auto_Test")
Delay 300
Call Plugin.File.CreateFolder("c:\Qm_Auto_Test")
Delay 300
TestItemTitle = "开始测试，请不要移动鼠标"
TiShiXinXi = TestItemTitle
ScRX = 800
ScRY = 600
Call 提示信息()
TestItemNum = 1
Call Plugin.File.WriteFileEx(TestFilePath,"获取用户系统配置")
Call 获取机器详细硬件信息()
Call 获取机器主要硬件信息()
Call 用WMI对象列出系统所有进程()
Call Plugin.File.WriteFileEx(TestFilePath,"开始测试")
Call 测试Sys系统插件()
Call 获取当前鼠标位置()
Call 获取鼠标形状()
Call 获取指定点颜色()
Call 查找颜色()
Call 查找中心颜色()
Call 查找颜色扩展()
Call 读取内存()
Call 测试Memory内存进程插件()
Call 测试Color颜色插件()
Call 测试File文件插件()
Call 测试Bkgnd后台控制插件()
Call 测试Window窗口插件()
Call 测试Media多媒体插件()
//Call 测试Msg信息提示插件()
//Call 测试Pic图像插件()
Call 测试Office办公文档插件()
//Call 测试Console控制台插件()
Call 测试Encrypt加解密插件()
Call 测试Net网络插件()
Call 测试Web网页插件()
AllEndTime = Plugin.Sys.GetTime()
Call Plugin.File.WriteFileEx(TestFilePath,"全部测试结束，总共耗时" & AllEndTime-AllStartTime & "毫秒")
MsgBox "全部测试结束，总共耗时" & AllEndTime-AllStartTime & "毫秒,点确定后查看测试结果！"
Call RunApp(TestFileFolder)
EndScript 
Sub 提示信息()	
    Call Plugin.Msg.HideScrTXT()
    Delay 100
    Call Plugin.Msg.ShowScrTXT(0, 0, ScRX, ScRY, TiShiXinXi, "0000FF")
    Call Plugin.Msg.Tips(TiShiXinXi)
    TracePrint TiShiXinXi
    Delay 100
End Sub
Sub 截图()
    TiShiXinXi = ScreenSnapShotTitle
    Call 提示信息()
    Call Plugin.Pic.PrintScreen(0, 0, ScRX, ScRY, TestFileFolder & ScreenSnapShotTitle & ".jpg")
End Sub
Sub 开始测试()
    TiShiXinXi = TestItemTitle & "测试开始！"
    Call 提示信息()
    StartTime=Plugin.Sys.GetTime()
    Call Plugin.File.WriteFileEx(TestFilePath,TestItemNum & "." & TiShiXinXi & vbcrlf & "[code]")
    TestItemNum = TestItemNum + 1
End Sub 
Sub 结束测试()
    TiShiXinXi = TestItemTitle & "测试结束！"
    EndTime=Plugin.Sys.GetTime()
    Call 提示信息()
    Call Plugin.File.WriteFileEx(TestFilePath,TiShiXinXi & "●执行速度为：" & EndTime-StartTime & "毫秒" & vbcrlf & "[/code]" & vbcrlf)
End Sub 
Sub 获取机器详细硬件信息()
    TestItemTitle = "获取机器详细硬件信息"
    Call 开始测试()
    VBSBegin 
        al=""
        set ws=createobject("wscript.shell")
        set fso2=createobject("scripting.filesystemobject")
        ws.run"cmd /c systeminfo >>c:\sys.txt",0,true
        set file2=fso2.opentextfile("c:\sys.txt")
        al=file2.readall
        file2.close
        fso2.deletefile("c:\sys.txt")
    VBSEnd 
    Call Plugin.File.WriteFileEx(TestFilePath,al & vbcrlf)
    Call 结束测试()
End Sub 
Sub 获取机器主要硬件信息()
    TestItemTitle = "获取机器主要硬件信息"
    Call 开始测试()
    VBSBegin 
        all=""
        temp=0
        set wshshell=createObject("wscript.shell")
        '启动WMI服务(没有这个服务就不行)
        wshshell.run ("%comspec% /c regsvr32 /s scrrun.dll"),0,True
        wshshell.run ("%comspec% /c sc config winmgmt start= auto"),0,True
        wshshell.run ("%comspec% /c net start winmgmt"),0
        strComputer = "."
        Set objWMIService = GetObject("winmgmts:\\" & strComputer & "\root\cimv2")
        '主板
        set board =objwmiservice.execQuery("select * from win32_baseboard")
        for each item in board
        	board2=board2 & "主板:" & item.Product
        next
        'CPU
        set cpu =objwmiservice.execQuery("select * from win32_processor")
        for each item in cpu
        	cpu2= cpu2 & "CPU:" & item.Name
        next
        '内存
        Set colItems = objWMIService.ExecQuery("Select * from Win32_PhysicalMemory", Null ,48)
        For Each objItem in colItems
        	a=objitem.capacity
        	temp=temp+objitem.capacity
        	n=n+1
        Next
        memory1=temp/1048576
        if n=1 then
        	memory2= "内存: " & n & "条" &a&"M"
        else
        	memory2= "内存: " & n & "条" &a&"M"&" 总计"&memory1&"M"
        end if
        '硬盘
        set disk =objwmiservice.execQuery("select * from win32_diskdrive")
        for each item in disk
        	disk2= disk2&"硬盘: " & item.Model&" "
        next
        '显卡
        set video =objwmiservice.execQuery("select * from win32_videocontroller",Null,48)
        for each item in video
        	video2= video2&"显卡: " & item.Description
        next
        '网卡
        Set colItems = objWMIService.ExecQuery("Select * from Win32_NetworkAdapter",Null,48)
        For Each objItem in colItems
        	if (left(objItem.NetConnectionID,4)="本地连接") then
        		lanname=lanname & objItem.Name
        	end if
        Next
        lan2="网卡: " & lanname
    VBSEnd 
    Call Plugin.File.WriteFileEx(TestFilePath,board2)
    Call Plugin.File.WriteFileEx(TestFilePath,cpu2)
    Call Plugin.File.WriteFileEx(TestFilePath,memory2)
    Call Plugin.File.WriteFileEx(TestFilePath,disk2)
    Call Plugin.File.WriteFileEx(TestFilePath,video2)
    Call Plugin.File.WriteFileEx(TestFilePath,lan2)
    Call Plugin.File.WriteFileEx(TestFilePath,all)
    Call 结束测试()
End Sub
Sub 用WMI对象列出系统所有进程()
    TestItemTitle = "用WMI对象列出系统所有进程"
    Call 开始测试()
    Set WMI = GetObject("WinMgmts:")
    Set objs = WMI.InstancesOf("Win32_Process")
    stt=stt & vbcrlf & "For Each obj In objs "
    stt=stt & vbcrlf & "Enum1 =  Enum1 & obj.Description & vbcrlf"
    stt=stt & vbcrlf & "Next"
    Execute(stt)
    Call Plugin.File.WriteFileEx(TestFilePath,Enum1)
    Call 结束测试()
End Sub
Sub 测试Sys系统插件()
    TestItemTitle="Sys插件"
    Call 开始测试()
    OS = Plugin.Sys.GetOSType()
    If OS=0 Then
        Call Plugin.File.WriteFileEx(TestFilePath,"您的操作系统版本是Windows 95/98")
    ElseIf OS=1 Then
        Call Plugin.File.WriteFileEx(TestFilePath,"您的操作系统版本是Windows ME/NT/2K/XP")
    ElseIf OS=2 Then
        Call Plugin.File.WriteFileEx(TestFilePath,"您的操作系统版本是Windows 2003")
    ElseIf OS=3 Then
        Call Plugin.File.WriteFileEx(TestFilePath,"您的操作系统版本是Windows 2008")
        PaintTitle = "无标题 - 画图"
        PaintClientClass = "Afx:130000:8"
    ElseIf OS=4 Then
        Call Plugin.File.WriteFileEx(TestFilePath,"您的操作系统版本是Windows Vista")
        PaintTitle = "无标题 - 画图"
        PaintClientClass = "Afx:1d0000:8"
    ElseIf OS=5 Then
        Call Plugin.File.WriteFileEx(TestFilePath,"您的操作系统版本是Windows 7")
        PaintTitle = "无标题 - 画图"
        PaintViewClass = "MSPaintView"
        PaintClientClass = "Afx:9c0000:8"
    ElseIf OS=6 Then
        Call Plugin.File.WriteFileEx(TestFilePath,"您的操作系统版本是Windows CE")
    Else 
        Call Plugin.File.WriteFileEx(TestFilePath,"不能识别当前操作系统版本")
    End If 
    ScRX=Plugin.Sys.GetScRX()
    Call Plugin.File.WriteFileEx(TestFilePath,"您的当前屏幕分辨率宽度：" & ScRX)
    ScRY=Plugin.Sys.GetScRY()
    Call Plugin.File.WriteFileEx(TestFilePath,"您的当前屏幕分辨率高度：" & ScRY)
    ScDep=Plugin.Sys.GetScDep()
    Call Plugin.File.WriteFileEx(TestFilePath,"您的当前屏幕色彩深度：" & ScDep)
    s=Plugin.Sys.GetTime()
    xs=int(s/1000/60/60)
    fz=int(s/1000/60)-xs*60
    m=Clng(s/1000)-fz*60-xs*60*60
    Call Plugin.File.WriteFileEx(TestFilePath,"您的操作系统从启动到目前的时间：" & xs & "小时" & fz & "分钟" & m & "秒")
    HDDSN = Plugin.Sys.GetHDDSN()
    Call Plugin.File.WriteFileEx(TestFilePath,"您的硬盘序列号是：" & hex(HDDSN))
    CurrentPath = Plugin.Sys.GetDir(0)
    Call Plugin.File.WriteFileEx(TestFilePath,"获得当前路径为：" & CurrentPath)
    Call Plugin.Sys.SetCLB("测试设置剪切板内容")
    Call Plugin.File.WriteFileEx(TestFilePath,"测试设置剪切板内容")
    Clipboard = Plugin.Sys.GetCLB()
    Call Plugin.File.WriteFileEx(TestFilePath,"读取剪切板内容：" & Clipboard)
    Call 结束测试()
End Sub
Sub 测试File文件插件()
    TestItemTitle="File"
    Call 开始测试()
    fileINI = "C:\QmTestINI.ini"
    Call Plugin.File.WriteINI("Command", "Val", "兼容性测试", fileINI)
    Delay 300
    IsFile = Plugin.File.IsFileExit(fileINI)
    If IsFile = True Then
        txt="目标文件创建成功"
        Text = Plugin.File.ReadINI("Command", "Val", fileINI)
    Else 
        txt="目标文件创建失败"
    End If 
    Call Plugin.File.WriteFileEx(TestFilePath,fileINI & txt & " 读写内容为：" & Text)
    filePath = TestFileFolder & "Log.txt"
    fileHandle=Plugin.File.OpenFile(filePath)
    If fileHandle=-1 Then
        Call Plugin.File.WriteFileEx(TestFilePath,"●创建文件" & filePath & "失败")
    Else 
        Call Plugin.File.WriteFileEx(TestFilePath,"☆创建文件" & filePath & "成功,返回句柄："& fileHandle)
    End If 
    Call Plugin.File.SeekFile(fileHandle,0)
    Call Plugin.File.WriteFileEx(TestFilePath,"定位到文件开头")
    Text = "您好，欢迎使用按键精灵测试脚本"
    Call Plugin.File.WriteFile(fileHandle,Text)
    Call Plugin.File.WriteFileEx(TestFilePath,"写入文本：" & Text)
    Text = "下面开始测试"
    Call Plugin.File.WriteLine(fileHandle,Text)
    Call Plugin.File.WriteFileEx(TestFilePath,"写入一行文本：" & Text)
    Call Plugin.File.CloseFile(fileHandle)
    Call Plugin.File.WriteFileEx(TestFilePath,"☆关闭文件" & filePath)
    Length = Plugin.File.GetFileLength(filePath)
    Call Plugin.File.WriteFileEx(TestFilePath,filePath & "文件长度为：" & Length)
    fileHandle=Plugin.File.OpenFile(filePath)
    If fileHandle=-1 Then
        Call Plugin.File.WriteFileEx(TestFilePath,"●创建文件" & filePath & "失败")
    Else 
        Call Plugin.File.WriteFileEx(TestFilePath,"☆创建文件" & filePath & "成功,返回句柄：" & fileHandle)
    End If 
    file20byte=Plugin.File.ReadFile(fileHandle,20)
    Call Plugin.File.WriteFileEx(TestFilePath,"读取20个字符：" & file20byte)
    fileline=Plugin.File.ReadLine(fileHandle)
    Call Plugin.File.WriteFileEx(TestFilePath,"读取一行字符：" & fileline)
    Call Plugin.File.CloseFile(fileHandle)
    Call Plugin.File.WriteFileEx(TestFilePath,"☆关闭文件" & filePath)
    fileBak = TestFileFolder & "Log.bak"
    Call Plugin.File.CopyFile(filePath, fileBak)
    Delay 300
    IsFile = Plugin.File.IsFileExit(fileBak)
    If IsFile=True Then
        Call Plugin.File.WriteFileEx(TestFilePath,"将" & filePath & "复制到" & fileBak & "成功")
    Else 
        Call Plugin.File.WriteFileEx(TestFilePath,"●将" & filePath & "复制到" & fileBak & "失败")
    End If 
    Call Plugin.File.MoveFile(fileINI, TestFileFolder & "QmTestINI.ini")
    Delay 300
    IsFile = Plugin.File.IsFileExit(fileINI)
    If IsFile=True Then
        Call Plugin.File.DeleteFile(fileINI)
        Call Plugin.File.WriteFileEx(TestFilePath,"●移动文件失败，删除" & fileINI)
    Else 
        Call Plugin.File.WriteFileEx(TestFilePath,"移动文件" & fileINI & "成功")
    End If 
    TestPath = TestFileFolder & "Test"
    Call Plugin.File.CreateFolder(TestPath)
    Delay 300
    IsFile = Plugin.File.IsFileExit(TestPath)
    If IsFile=0 Then
        Call Plugin.File.DeleteFolder(TestPath)
        Call Plugin.File.WriteFileEx(TestFilePath,"创建文件夹成功，删除文件夹" & TestPath)
    Else 
        Call Plugin.File.WriteFileEx(TestFilePath,"●创建文件夹失败")
    End If 
    fileBakup = TestFileFolder & "Log.bakup"
    Call Plugin.File.ReNameFile(fileBak, fileBakup)
    Call Plugin.File.WriteFileEx(TestFilePath,"●将" & fileBak & "改名为" & fileBakup)
    Call Plugin.File.SetAttrib(fileBakup, 0)
    Call Plugin.File.SetDate(fileBakup, "2009-2-19 10:10:10")
    Call Plugin.File.WriteFileEx(TestFilePath,"●将" & fileBakup & "修改日期改为2009-2-19 10:10:10")
    //下面命令需要用户操作
    //    Call Plugin.filepath = File.SelectFile()
    //    Call Plugin.File.WriteFileEx(TestFilePath, "您所选择的文件是：" & filepath)
    //    Call Plugin.dirPath = File.SelectDirectory()
    //    Call Plugin.File.WriteFileEx(TestFilePath, "您所选择的目录是：" & dirPath)
    Call 结束测试()
End Sub
Sub 测试Bkgnd后台控制插件()
    TestItemTitle="Bkgnd"
    Call 开始测试()
    PaintPath="mspaint.exe"
    Call RunApp(PaintPath)
    Call Plugin.File.WriteFileEx(TestFilePath, "运行程序：" & PaintPath)
    Delay 1000
    PaintHwnd=Plugin.Window.Find(0,PaintTitle)
    If PaintHwnd = 0 Then
        Delay 1000
        PaintHwnd=Plugin.Window.Find(0,PaintTitle)
    End If 
    If PaintHwnd = 0 Then
        Call Plugin.File.WriteFileEx(TestFilePath,"☆" & PaintPath & "运行失败")
    Else 
        Call Plugin.File.WriteFileEx(TestFilePath,"☆" & PaintPath & "运行成功，句柄为：" & PaintHwnd)
        SubHwnd=Plugin.Window.FindEx(PaintHwnd, 0, PaintViewClass, 0)
        SubHwnd=Plugin.Window.FindEx(SubHwnd, 0, PaintClientClass, 0)
        Call Plugin.File.WriteFileEx(TestFilePath,"画图区句柄为：" & SubHwnd)
        x = 10
        y = 50
        For 5
            Call Plugin.Bkgnd.LeftClick(SubHwnd, x, y)
            x = x + 10
            y = y + 10
            Delay 100
        Next  
        x = 30
        y = 50
        For 5
            Call Plugin.Bkgnd.LeftDoubleClick(SubHwnd, x, y)
            x = x + 10
            y = y + 10
        Next  
        Call Plugin.File.WriteFileEx(TestFilePath, "后台鼠标模拟结束")
        Call 模拟鼠标操作()
        Color1 = Plugin.Bkgnd.GetPixelColor(SubHwnd, 5, 5)		
        Call Plugin.File.WriteFileEx(TestFilePath,"窗口" & SubHwnd & "(坐标:5,5)处的颜色=" & Color1)
        XY = Plugin.Bkgnd.FindColor(SubHwnd, 0, 0, 700,550,"FFFFFF")
		ZB = InStr(XY, "|")
		X = Clng(Left(XY, ZB - 1)): Y = Clng(Right(XY, Len(XY) - ZB))
        Call Plugin.File.WriteFileEx(TestFilePath,"FindColor查找窗口" & SubHwnd & "颜色:FFFFFF的X坐标="& X & ",Y坐标=" & Y)
        XY = Plugin.Bkgnd.FindColorEx(SubHwnd, 0, 0, 700,550,"FFFFFF", 0, 0.9)
		ZB = InStr(XY, "|")
		X = Clng(Left(XY, ZB - 1)): Y = Clng(Right(XY, Len(XY) - ZB))
        Call Plugin.File.WriteFileEx(TestFilePath,"FindColorEx模糊查找窗口" & SubHwnd & "颜色:FFFFFF的X坐标="& X & ",Y坐标=" & Y)
        XY = Plugin.Bkgnd.FindCenterColor(SubHwnd, 0, 0, 700,550,"FFFFFF")
		ZB = InStr(XY, "|")
		X = Clng(Left(XY, ZB - 1)): Y = Clng(Right(XY, Len(XY) - ZB))
        Call Plugin.File.WriteFileEx(TestFilePath,"FindCenterColor查找窗口" & SubHwnd & "颜色:FFFFFF的X坐标="& X & ",Y坐标=" & Y)
        ScreenSnapShotTitle = "模拟鼠标操作和找色功能结果"
        Call Plugin.File.WriteFileEx(TestFilePath,"模拟鼠标操作和后台找色功能测试结束,关闭画图程序,测试结果请查看截图:" & ScreenSnapShotTitle)
        Call 截图()
        Call Plugin.Window.Close(PaintHwnd)
        Call Plugin.File.WriteFileEx(TestFilePath,"☆" & PaintPath & "关闭成功")
    End If 
    NotepadPath = "notepad.exe"
    Call RunApp(NotepadPath)
    Call Plugin.File.WriteFileEx(TestFilePath, "运行程序：" & NotepadPath)
    Delay 1000
    NotepadHwnd=Plugin.Window.Find(0,NotepadTitle)
    If NotepadHwnd = 0 Then
        Delay 1000
        NotepadHwnd=Plugin.Window.Find(0,NotepadTitle)
    End If 
    If NotepadHwnd = 0 Then
        Call Plugin.File.WriteFileEx(TestFilePath,"☆" & NotepadPath & "运行失败")
    Else 
        Call Plugin.File.WriteFileEx(TestFilePath,"☆" & NotepadPath & "运行成功，句柄为：" & NotepadHwnd)
        Call 模拟键盘操作()
        SubHwnd=Plugin.Window.FindEx(NotepadHwnd, 0, "Edit", 0)
        If SubHwnd=0 Then
            Call Plugin.File.WriteFileEx(TestFilePath,"●没有找到子窗口句柄")
        Else 
            Call Plugin.File.WriteFileEx(TestFilePath,"查到到的可输入区句柄为：" & SubHwnd)
            InputText="后台模拟键盘操作测试信息："
            Call Plugin.Bkgnd.SendString(SubHwnd, InputText)
            For 5
                Call Plugin.Bkgnd.KeyPress(SubHwnd, 65)
                Delay 100
            Next  
            Call Plugin.Bkgnd.KeyDown(SubHwnd, 13)
            Call Plugin.Bkgnd.KeyUp(SubHwnd, 13)
            Call Plugin.File.WriteFileEx(TestFilePath,InputText & "aaaaa")
        End If 
    End If 
    Call 结束测试()
End Sub 
Sub 测试Window窗口插件()
    TestItemTitle="Window"
    Call 开始测试()
    InputText = "窗口模拟键盘输入测试信息："
    Call Plugin.Window.SendString(SubHwnd, InputText)
    For 5
        Call Plugin.Window.SendKeyPress(SubHwnd, 66)
        Delay 50
    Next  
    Call Plugin.Window.SendKeyDown(SubHwnd, 13)
    Call Plugin.Window.SendKeyUp(SubHwnd, 13)
    Call Plugin.File.WriteFileEx(TestFilePath,InputText & "bbbbb")
    ScreenSnapShotTitle = "模拟键盘相关操作结果"
    Call Plugin.File.WriteFileEx(TestFilePath,"模拟键盘相关操作已完成，请查看截图:" & ScreenSnapShotTitle)
    Call 截图()
    path=Plugin.Window.GetExePath(NotepadHwnd)
    Call Plugin.File.WriteFileEx(TestFilePath,"记事本路径是：" & path)
    Call Plugin.Window.Active(NotepadHwnd)
    Call Plugin.File.WriteFileEx(TestFilePath,"激活窗口" & NotepadHwnd)
    Delay 100
    Hwnd = Plugin.Window.Foreground()
    Call Plugin.File.WriteFileEx(TestFilePath,"●得到当前最前面窗口句柄为：" & Hwnd)
    Delay 100
    Call Plugin.Window.Min(NotepadHwnd)
    Call Plugin.File.WriteFileEx(TestFilePath,"最小化窗口" & NotepadHwnd)
    Delay 100
    Call Plugin.Window.Restore(NotepadHwnd)
    Call Plugin.File.WriteFileEx(TestFilePath,"还原窗口" & NotepadHwnd)
    Delay 100
    Call Plugin.Window.Max(NotepadHwnd)
    Call Plugin.File.WriteFileEx(TestFilePath,"最大化窗口" & NotepadHwnd)
    Delay 100
    Call Plugin.Window.Restore(NotepadHwnd)
    Call Plugin.File.WriteFileEx(TestFilePath,"还原窗口" & NotepadHwnd)
    Delay 100
    Call Plugin.Window.Hide(NotepadHwnd)
    Call Plugin.File.WriteFileEx(TestFilePath,"隐藏窗口" & NotepadHwnd)
    Delay 100
    Call Plugin.Window.Show(NotepadHwnd)
    Call Plugin.File.WriteFileEx(TestFilePath,"显示窗口" & NotepadHwnd)
    Delay 100
    Call Plugin.Window.Top(NotepadHwnd, 0)
    Call Plugin.File.WriteFileEx(TestFilePath,"置前窗口" & NotepadHwnd)
    Delay 100
    Call Plugin.Window.Top(NotepadHwnd, 1)
    Call Plugin.File.WriteFileEx(TestFilePath,"取消置前窗口" & NotepadHwnd)
    Delay 100
    MousePointHwnd = Plugin.Window.MousePoint()
    Call Plugin.File.WriteFileEx(TestFilePath,"得到鼠标指向窗口句柄为：" & MousePointHwnd)
    Delay 100
    Rect = Plugin.Window.GetWindowRect(NotepadHwnd)
    Call Plugin.File.WriteFileEx(TestFilePath,"得到窗口" & NotepadHwnd & "的边框大小(包括标题栏)为：" & Rect)
    Dim MyArray
    MyArray = Split(Rect, "|")
    W1 = Clng(MyArray(0)): H1 = Clng(MyArray(1))
    W2 = Clng(MyArray(2)): H2 = Clng(MyArray(3))
    Call Plugin.File.WriteFileEx(TestFilePath,"得到窗口" & NotepadHwnd & "的边框大小(包括标题栏)为：" &  W2-W1 & "*" & H2-H1)
    Delay 100
    Rect = Plugin.Window.GetClientRect(NotepadHwnd)
    Call Plugin.File.WriteFileEx(TestFilePath,"获取到客户区大小为：" & Rect)
    MyArray = Split(Rect, "|")
    L = Clng(MyArray(0)): T = Clng(MyArray(1))
    R = Clng(MyArray(2)): B = Clng(MyArray(3))
    Call Plugin.File.WriteFileEx(TestFilePath,"客户区大小为：" & R-L & "*" & B-T)
    Delay 100
    Call Plugin.Window.Size(NotepadHwnd, 100, 100)
    Call Plugin.File.WriteFileEx(TestFilePath,"改变窗口" & NotepadHwnd & "大小为100*100")
    Delay 100
    Call Plugin.Window.Size(NotepadHwnd, W2-W1, H2-H1)
    Call Plugin.File.WriteFileEx(TestFilePath,"改变窗口" & NotepadHwnd & "大小为" &  W2-W1 & "*" & H2-H1)
    Delay 100
    Call Plugin.Window.Move(NotepadHwnd, 100, 100)
    Call Plugin.File.WriteFileEx(TestFilePath,"移动窗口到(100,100)位置")
    Delay 100
    Window1 = Plugin.Window.IsWindow(NotepadHwnd)
    If Window1 = 1 Then
        Call Plugin.File.WriteFileEx(TestFilePath,"窗口" & NotepadHwnd & "已打开")
    Else 
        Call Plugin.File.WriteFileEx(TestFilePath,"●窗口" & NotepadHwnd & "没有打开")
    End If 
    Title = Plugin.Window.GetText(NotepadHwnd)
    If Title="" Then
        Call Plugin.File.WriteFileEx(TestFilePath,"●窗口" & NotepadHwnd & "标题获取失败")
    Else 
        Call Plugin.File.WriteFileEx(TestFilePath,"窗口" & NotepadHwnd & "标题为：" & Title)
    End If 
    ClassName = Plugin.Window.GetClass(NotepadHwnd)
    If ClassName="" Then
        Call Plugin.File.WriteFileEx(TestFilePath,"●窗口" & NotepadHwnd & "类名获取失败")
    Else 
        Call Plugin.File.WriteFileEx(TestFilePath,"窗口" & NotepadHwnd & "类名为：" & ClassName)
    End If 
    HwndEx = Plugin.Window.Search("记事本")
    If HwndEx="" Then
        Call Plugin.File.WriteFileEx(TestFilePath,"●没有找到符合的窗口句柄")
    Else 
        Call Plugin.File.WriteFileEx(TestFilePath,"查找到的窗口句柄为：" & HwndEx)
    End If 
    MyArray = Split(HwndEx, "|")
    If UBound(MyArray)>=0  Then
        For i=0 To UBound(MyArray)-1
            Call Plugin.File.WriteFileEx(TestFilePath,"第" & i+1 & "个窗口句柄为：" & Clng(MyArray(i)))
        Next 
    End If 
    Call Plugin.Window.Close(NotepadHwnd)
    Call Plugin.File.WriteFileEx(TestFilePath,"☆" & NotepadPath & "关闭成功")
    Call 结束测试()
End Sub
Sub 测试Office办公文档插件()
    TestItemTitle="Office"
    Call 开始测试()
    set oExcel = createobject("Excel.Application")
    If TypeName(oExcel) = "Application" Then
        Text = "Office测试"
        XmlPath = TestFileFolder & "测试.xls"
        Call Plugin.Office.WriteXls(1, 1, 1, Text, XmlPath)
        Call Plugin.File.WriteFileEx(TestFilePath,"向" & XmlPath & "写入文本：" & Text)
        Text = Plugin.Office.ReadXls(1, 1, 1, XmlPath)
        Call Plugin.File.WriteFileEx(TestFilePath,"从" & XmlPath & "Excel文档工作表(1)单元格(1, 1)读出内容:" & Text)
    Else 
        Call Plugin.File.WriteFileEx(TestFilePath,"●电脑上未安装Office办公软件")
    End If 
    Call 结束测试()
End Sub
Sub 获取当前鼠标位置()
    Call GetCursorPos(x,y)
    If x>=0 Then
        Call Plugin.File.WriteFileEx(TestFilePath,"当前鼠标的位置是：" & x &","& y)
    Else 
        Call Plugin.File.WriteFileEx(TestFilePath,"●未能得到当前鼠标位置")
    End If 
End Sub
Sub 获取指定点颜色()
    color1=GetPixelColor(100,100)
    If color1="" Then
        Call Plugin.File.WriteFileEx(TestFilePath,"●未能得到坐标点:100,100的颜色值")
    Else 
        Call Plugin.File.WriteFileEx(TestFilePath,"坐标点:100,100的颜色值是：" & color1)
    End If 
End Sub
Sub 查找颜色()
	Call FindColor(0,0,ScRX,ScRY,"FFFFFF",x,y)
    If x>=0 Then
        Call Plugin.File.WriteFileEx(TestFilePath,"在0,0," & ScRX & "," & ScRY & "的区域中已寻找到'FFFFFF'颜色。")
    Else 
        Call Plugin.File.WriteFileEx(TestFilePath,"●未能在0,0," & ScRX & "," & ScRY & "的区域中寻找到'FFFFFF'颜色。")
    End If 
End Sub 
Sub 查找中心颜色()
    Call FindCenterColor(0,0,ScRX,ScRY,"FFFFFF",x,y)
    If x>=0 Then
        Call Plugin.File.WriteFileEx(TestFilePath,"在0,0," & ScRX & "," & ScRY & "的区域中已寻找到'FFFFFF'颜色。")
    Else 
        Call Plugin.File.WriteFileEx(TestFilePath,"●未能在0,0," & ScRX & "," & ScRY & "的区域中寻找到'FFFFFF'颜色。")
    End If 
End Sub
Sub 查找颜色扩展()
    Call FindColorEx(0,0,ScRX,ScRY,"FFFFFF",0,0.9,x,y)
    If x>=0 Then
        Call Plugin.File.WriteFileEx(TestFilePath,"在0,0," & ScRX & "," & ScRY & "的区域中从左至右开始已寻找到'FFFFFF'颜色。")
    Else 
        Call Plugin.File.WriteFileEx(TestFilePath,"●未能在0,0," & ScRX & "," & ScRY & "的区域中从左至右开始寻找到'FFFFFF'颜色。")
    End If 
    Delay 1000
    Call FindColorEx(0,0,ScRX,ScRY,"FFFFFF",1,0.9,x,y)
    If x>=0 Then
        Call Plugin.File.WriteFileEx(TestFilePath,"在0,0," & ScRX & "," & ScRY & "的区域中从中心开始已寻找到'FFFFFF'颜色。")
    Else 
        Call Plugin.File.WriteFileEx(TestFilePath,"●未能在0,0," & ScRX & "," & ScRY & "的区域从中心开始寻找到'FFFFFF'颜色。")
    End If 
    Delay 1000
    Call FindColorEx(0,0,ScRX,ScRY,"FFFFFF",2,0.9,x,y)
    If x>=0 Then
        Call Plugin.File.WriteFileEx(TestFilePath,"在0,0," & ScRX & "," & ScRY & "的区域中从右至左开始已寻找'FFFFFF'颜色。")
    Else 
        Call Plugin.File.WriteFileEx(TestFilePath,"●未能在0,0," & ScRX & "," & ScRY & "的区域中从右至左开始寻找到'FFFFFF'颜色。")
    End If 
End Sub 
Sub 查找图片()
    Call FindPic(0,50,1023,767,"winmine.bmp",0.9,intX,intY)
    If intX>0 and intY>0 Then
        Call Plugin.File.WriteFileEx(TestFilePath,"能在" & ScRX & "X" & ScRY & "的分辨率内寻找到扫雷程序的笑脸图形")
    Else 
        Call Plugin.File.WriteFileEx(TestFilePath,"●不能在" & ScRX & "X" & ScRY & "的分辨率内寻找到扫雷程序的笑脸图形")
    End If 
End Sub 
Sub 读取内存()
    Call ReadMemory(&h400000,2,val)
    Call Plugin.File.WriteFileEx(TestFilePath,"读取内存地址&h400000的结果是："& CStr(val))
End Sub 
Sub 获取鼠标形状()
    shape=GetCursorShape(0)
    Call Plugin.File.WriteFileEx(TestFilePath,"当前鼠标的特征码是:" & shape)
End Sub 
Sub 模拟鼠标操作()
    Call Plugin.Window.Max(PaintHwnd)
    Call Plugin.File.WriteFileEx(TestFilePath,"最大化窗口" & PaintHwnd)
    Delay 100
    Call Plugin.Window.Active(PaintHwnd)
    Call Plugin.File.WriteFileEx(TestFilePath,"激活窗口" & PaintHwnd)
    Delay 100
    KeyDown 17,1
    KeyPress 69,1
    KeyUp 17,1
    Delay 100
    SayString "500"
    Delay 50
    KeyPress 9,1
    SayString "500"
    Delay 50
    KeyPress 13,1
    Delay 50
    MoveTo 150,200
    Delay 50
    For 5
        MoveR 10,10
        Delay 50
        LeftClick 1
        Delay 50
    Next 
    Call Plugin.File.WriteFileEx(TestFilePath,"普通鼠标模拟结束")
    Delay 50
    MoveTo 200,200
    Delay 50
    For 5
        MoveRS 10,10
        Delay 50
        LeftClickS 1
        Delay 50
    Next 
    Call Plugin.File.WriteFileEx(TestFilePath,"超级鼠标模拟结束")
    Delay 50
    MoveTo 300,200
    Delay 50
    For 5
        MoveRH 10,10
        LeftClickH 1
        Delay 50
    Next  
    Call Plugin.File.WriteFileEx(TestFilePath,"硬件鼠标模拟结束")
End Sub
Sub 模拟键盘操作()
    Call Plugin.Window.Active(NotepadHwnd)
    Delay 300
    SayString "普通模拟:"
    Delay 50
    For 5
        KeyPress 65,1
        Delay 50
    Next  
    KeyPress 13,1
    Call Plugin.File.WriteFileEx(TestFilePath,"普通键盘模拟:aaaaa")
    Delay 50
    SayString "超级模拟:"
    Delay 50
    For 5
        KeyPressS 66,1
        Delay 50
    Next 
    KeyPressS 13,1
    Call Plugin.File.WriteFileEx(TestFilePath,"超级键盘模拟:bbbbb")
    Delay 50
    SayString "硬件模拟:"
    Delay 50
    For 5
        KeyPressH 67,1
        Delay 50
    Next 
    KeyPressH 13,1
    Call Plugin.File.WriteFileEx(TestFilePath,"硬件键盘模拟:ccccc")
End Sub 
Sub TestFindNumber()
    dh_x=916:dh_y=5
    Normal1X=array(dh_x+4,dh_x+1,dh_x,dh_x+4,dh_x+3,dh_x+2,dh_x+1)
    Normal1Y=array(dh_y,dh_y+1,dh_y+2,dh_y+2,dh_y+3,dh_y+4,dh_y+5)
    jx=0
    zuobiao1_i=0
    zuobiao1_y=0
//    VBSCall zuobiao1_n=getnum(Normal1X,Normal1Y,jx,"FFFFFF")
    If zuobiao1_n < 10 Then
        zuobiao1_y = zuobiao1_y * 10 + zuobiao1_n
    End If 
    For 3
        jx=jx+6
        zuobiao1_n=getnum(Normal1X,Normal1Y,jx,"FFFFFF")
        If zuobiao1_n < 10 Then
            zuobiao1_y = zuobiao1_y * 10 + zuobiao1_n
        End If 
    Next 
    myx=abs(zuobiao1_y)
    Normal2X=array(dh_x+4+50,dh_x+1+50,dh_x+50,dh_x+4+50,dh_x+3+50,dh_x+2+50,dh_x+1+50)
    Normal2Y=array(dh_y,dh_y+1,dh_y+2,dh_y+2,dh_y+3,dh_y+4,dh_y+5)
    jx=0
    zuobiao2_i=0
    zuobiao2_y=0
    zuobiao2_n=getnum(Normal2X,Normal2Y,jx,"FFFFFF")
    If zuobiao2_n < 10 Then
        zuobiao2_y = zuobiao2_y * 10 + zuobiao2_n
    End If 
    For 3
        jx=jx+6
        zuobiao2_n=getnum(Normal2X,Normal2Y,jx,"FFFFFF")
        If zuobiao2_n < 10 Then
            zuobiao2_y = zuobiao2_y * 10 + zuobiao2_n
        End If 
    Next  
    myy=abs(zuobiao2_y)
End Sub
Sub 测试Media多媒体插件()
    TestItemTitle="Media"
    Call 开始测试()
    Call Plugin.Media.Beep(523, 200)
    Call Plugin.Media.Beep(578, 200)
    Call Plugin.Media.Beep(659, 200)
    Call Plugin.Media.Beep(698, 200)
    Call Plugin.Media.Beep(784, 200)
    Call Plugin.Media.Beep(880, 200)
    Call Plugin.Media.Beep(988, 200)
    Call Plugin.File.WriteFileEx(TestFilePath,"Beep播放结束")
    Call Plugin.Media.Play("C:\WINDOWS\Media\Windows XP 启动.wav")
    Call Plugin.File.WriteFileEx(TestFilePath,"开始播放音乐")
    Call Plugin.Media.Vol(50)
    Call Plugin.File.WriteFileEx(TestFilePath,"设置声音大小为：50")
    Call Plugin.Media.Stop()
    Call Plugin.File.WriteFileEx(TestFilePath,"停止播放音乐")
    Call 结束测试()
End Sub
Sub 测试Msg信息提示插件()
    TestItemTitle="Msg"
    Call 开始测试()
    PU=0
    //For 1
        Call Plugin.Msg.HideScrTXT()
        Call Plugin.File.WriteFileEx(TestFilePath,"刷新屏幕")
        Delay 300
        Call Plugin.Msg.ShowScrTXT(0, 0, ScRX, ScRY, "屏幕内容填写  "& PU, "0000FF")
        ScreenSnapShotTitle = "Msg插件测试结果"
        Call Plugin.File.WriteFileEx(TestFilePath,"屏幕输出内容：屏幕内容填写  " & PU & "，输出结果请看截图:" & ScreenSnapShotTitle)
        Call 截图()
        Delay 300
        PU=PU+1
    //Next 
    Call 结束测试()
End Sub
Sub 测试Color颜色插件()
    TestItemTitle="Color"
    Call 开始测试()
    Call Plugin.Color.ColorToRGB("0000FF", R, G, B)
    Call Plugin.File.WriteFileEx(TestFilePath,"16进制颜色(0000FF)转换分解到10进制(R:" & R & ",G:" & G &",B:" & B & ")")
    Color1 = Plugin.Color.GetRGB(255, 0, 0)
    Call Plugin.File.WriteFileEx(TestFilePath,"10进制颜色(255,0,0)转换为16进制颜色：" & Color1)
    Call Plugin.Color.ColorToHSL("0000FF", H, S, L)
    Call Plugin.File.WriteFileEx(TestFilePath,"16进制颜色(0000FF)转换分解到10进制(H:" & H & ",S:" & S & ",L:" & L & ")")
    NUM = Plugin.Color.CountColor(0, 0, ScRX, ScRY, "FFFFFF",1)
    Call Plugin.File.WriteFileEx(TestFilePath,"颜色(FFFFFF)的数量=" & NUM)
    XY = Plugin.Color.FindMutiColor(0, 0, ScRX, ScRY, "FFFFFF", "2|0|FFFFFF,-6|1|FFFFFF,-3|1|FFFFFF,-6|3|FFFFFF,-3|3|FFFFFF,0|3|FFFFFF,4|3|FFFFFF,-1|5|FFFFFF,3|5|FFFFFF,-3|6|FFFFFF,-6|7|FFFFFF,1|8|FFFFFF,4|8|FFFFFF,-5|10|FFFFFF,-3|10|FFFFFF,4|10|FFFFFF", 1)
	ZB = InStr(XY, "|")
	X = Clng(Left(XY, ZB - 1)): Y = Clng(Right(XY, Len(XY) - ZB))
    Call Plugin.File.WriteFileEx(TestFilePath,"屏幕多点找色功能：找屏幕""我""字位置为：" & X &","& Y)
    XY = Plugin.Color.FindShape(0, 0, ScRX, ScRY, "5|0|1,4|1|1,7|1|1,-2|2|1,8|2|1,4|3|1,0|4|1,3|5|1,5|5|1,-2|6|1,0|6|1,3|7|1,6|7|1,0|8|1,5|9|1,-2|10|1,0|10|1,2|10|1,8|10|1", 1)
	ZB = InStr(XY, "|")
	X = Clng(Left(XY, ZB - 1)): Y = Clng(Right(XY, Len(XY) - ZB))
    Call Plugin.File.WriteFileEx(TestFilePath,"屏幕找图形形状功能：找屏幕""按""字位置为：" & X & "," & Y)
    ScreenSnapShotTitle = "Color插件测试结果"
    Call Plugin.File.WriteFileEx(TestFilePath,"Color(颜色)插件测试结束,测试结果请查看截图:" & ScreenSnapShotTitle)
    Call 截图()
    Call 结束测试()
End Sub
Sub 测试Console控制台插件()
    TestItemTitle="Console"
    Call 开始测试()
    Call Plugin.Console.Open()
    Call Plugin.File.WriteFileEx(TestFilePath,"打开控制台窗口")
    Call Plugin.Console.WriteLine("控制台测试开始，请随意输入几个字符，然后按回车")
    Call Plugin.File.WriteFileEx(TestFilePath,"控制台测试开始，请随意输入几个字符，然后按回车")
    ReadLine = Plugin.Console.ReadLine()
    Call Plugin.File.WriteFileEx(TestFilePath,"读取文本：" & ReadLine)
    Call Plugin.Console.WriteLine("演示脚本结束，退出控制台" & vbcrlf)
    Call Plugin.File.WriteFileEx(TestFilePath,"演示脚本结束，退出控制台" & vbcrlf)
    Call Plugin.Console.Close()
    Call Plugin.File.WriteFileEx(TestFilePath,"关闭控制台窗口")
    Call 结束测试()
End Sub
Sub 测试Pic图像插件()
    TestItemTitle="Pic"
    Call 开始测试()
    Call Plugin.Pic.PrintScreen(0, 0, ScRX, ScRY, TestFileFolder & "PIC.bmp")
    Call Plugin.File.WriteFileEx(TestFilePath,"截图保存到(" & TestFileFolder & "PIC.bmp)")
    Delay 200
    Call Plugin.Pic.PrintScreen(0, 0, ScRX, ScRY, TestFileFolder & "PIC.jpg")
    Call Plugin.File.WriteFileEx(TestFilePath,"截图保存到(" & TestFileFolder & "PIC.jpg)")
    Call 结束测试()
End Sub
Sub 测试Memory内存进程插件()
    TestItemTitle="Memory"
    Call 开始测试()
    WinminePath = "winmine.exe"
    WinmineTitle = "扫雷"
    Call RunApp(WinminePath)
    Delay 1000
    WinmineHwnd=Plugin.Window.Find(0,WinmineTitle)
    If WinmineHwnd = 0 Then
        Delay 1000
        WinmineHwnd=Plugin.Window.Find(0,WinmineTitle)
    End If 
    If WinmineHwnd=0 Then
        Call Plugin.File.WriteFileEx(TestFilePath,"☆" & WinminePath & "运行失败")
    Else 
        Call 查找图片()
        Call Plugin.File.WriteFileEx(TestFilePath,"☆" & WinminePath & "运行成功，句柄为：" & WinmineHwnd)
        Call Plugin.Memory.SetProcessLive(WinmineHwnd, 4)
        Call Plugin.File.WriteFileEx(TestFilePath,"设置进程优先级为(高于标准(A)")
        Live = Plugin.Memory.GetProcessLive(WinmineHwnd)
        Call Plugin.File.WriteFileEx(TestFilePath,"进程优先级为："& Live)
        Dim x, y
        x=Plugin.Memory.Read32Bit(WinmineHwnd,&h1005334)
        y=Plugin.Memory.Read32Bit(WinmineHwnd,&h1005338)
        Call Plugin.File.WriteFileEx(TestFilePath, "扫雷的长与宽的格子数量为：" & x & "  *  " & y & "格")
        strview = ""        
        ClickX = 18
        ClickY = 56
        Call Plugin.Bkgnd.LeftClick(WinmineHwnd,ClickX,ClickY)
        For i = 0 To y-1
            For j = 0 To x-1
                Val = Plugin.Memory.Read8Bit(WinmineHwnd,&h1005360+(j+i*32+1))
                If Val = &h8F or Val = &h8A Then
                    strview = strview & " *"
                    Call Plugin.Bkgnd.RightClick(WinmineHwnd,ClickX + 16*j,ClickY + 16*i)
                Else 
                    strview = strview & " @"
                    Call Plugin.Bkgnd.LeftClick(WinmineHwnd,ClickX + 16*j,ClickY + 16*i)
                End If 
            Next 
            strview = strview & vbcrlf
        Next 
        strview = strview & "说明：@代表安全，*代表雷"
        Call Plugin.File.WriteFileEx(TestFilePath,strview)
        Val = Plugin.Memory.Read8Bit(WinmineHwnd, &H400000)
        Call Plugin.File.WriteFileEx(TestFilePath, "读取8位内存数值(&H400000)内存地址"& Val)
        Val = Plugin.Memory.Read16Bit(WinmineHwnd, &H400000)
        Call Plugin.File.WriteFileEx(TestFilePath, "读取16位内存数值(&H400000)内存地址"& Val)
        Val = Plugin.Memory.ReadSingle(WinmineHwnd,&h1005338)
        Call Plugin.File.WriteFileEx(TestFilePath, "读取32位内存浮点数值(&h1005338)内存地址"& Val)
        Val = Plugin.Memory.ReadDouble(WinmineHwnd, &H400000)
        Call Plugin.File.WriteFileEx(TestFilePath, "读取64位内存浮点数值(&H400000)内存地址"& Val)
        z = Plugin.Memory.ReadString(WinmineHwnd, &H7D7A45B4, 2)
        Call Plugin.File.WriteFileEx(TestFilePath, "搜索到第一个""雷""字内存地址为：&H" & Hex(DiZhi))
        Val = Plugin.Memory.Find8Bit(WinmineHwnd, 100, &H400000, &H600000, 2)
        Call Plugin.File.WriteFileEx(TestFilePath, "8位内存数值(100)地址："& Val)
        Val = Plugin.Memory.Find16Bit(WinmineHwnd, 100, &H400000, &H600000, 2)
        Call Plugin.File.WriteFileEx(TestFilePath, "16位内存数值(100)地址："& Val)
        Val = Plugin.Memory.Find32Bit(WinmineHwnd, 100, &H400000, &H600000, 2)
        Call Plugin.File.WriteFileEx(TestFilePath, "32位内存数值(100)地址："& Val)
        DiZhi = Plugin.Memory.FindString(WinmineHwnd, "雷", &H7D7045B4, &H7D8045B4, 2)
        Call Plugin.File.WriteFileEx(TestFilePath, "搜索到第一个""雷""字内存地址为：&H" & Hex(DiZhi))
        ScreenSnapShotTitle = "Memory插件测试结果"
        Call Plugin.File.WriteFileEx(TestFilePath,"Memory插件测试结束,测试结果请看截图:" & ScreenSnapShotTitle)
        Call 截图()
        Call Plugin.Memory.TerminateProc(WinmineHwnd)
        Call Plugin.File.WriteFileEx(TestFilePath,"☆" & WinminePath & "关闭成功")
    End If 
    Call 结束测试()
End Sub
Sub 测试Encrypt加解密插件()
    TestItemTitle = "Encrypt"
    Call 开始测试()
    TextMD5 = Plugin.Encrypt.Md5String("按键精灵")
    Call Plugin.File.WriteFileEx(TestFilePath,"字符串：按键精灵 转换为MD5为：" & TextMD5)
    MD5FilePath = TestFileFolder & "log.txt"
    FileMD5 = Plugin.Encrypt.Md5File(MD5FilePath)
    Call Plugin.File.WriteFileEx(TestFilePath,MD5FilePath & "转换为MD5为：" & FileMD5)
    Call 结束测试()
End Sub
Sub 测试Net网络插件()
    TestItemTitle = "Net"
    Call 开始测试()
    Call 结束测试()
End Sub
Sub 测试Web网页插件()
    TestItemTitle = "Web"
    Call 开始测试()
    Call 结束测试()
End Sub
