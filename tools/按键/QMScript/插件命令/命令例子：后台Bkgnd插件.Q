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
MacroID=3183564f-52cc-43db-8a9a-6af6b967b135
Description=命令例子：后台Bkgnd插件
Enable=0
AutoRun=0
[Repeat]
Type=0
Number=1
[Relative]
SetupOCXFile=
[Comment]
Content=

[Script]
//测试OK
Dim MyArray
//=================================================================================
//[[以下是测试后台模拟鼠标取色找色操作]]
//=================================================================================
Call RunApp("mspaint.exe")
Delay 1000
//=================================================================================
//找画图区句柄
Hwnd=Plugin.Window.Find(0,"未命名 - 画图")
Hwnd=Plugin.Window.FindEx(Hwnd, 0, "AfxFrameOrView42u", 0)
Hwnd=Plugin.Window.FindEx(Hwnd, 0, "Afx:1000000:8", 0)
TracePrint "画图区句柄=" & Hwnd
//=================================================================================
//下面这句用于向后台窗口句柄(变量：Hwnd)的客户区域(坐标：5, 5)处发送一个鼠标左键单击
Call Plugin.Bkgnd.LeftClick(Hwnd, 5, 5)
TracePrint "鼠标在后台窗口(坐标：5, 5)处的单击"
//=================================================================================
//下面这句用于向后台窗口句柄(变量：Hwnd)的客户区域(坐标：10, 10)处发送一个鼠标左键双击
Call Plugin.Bkgnd.LeftDoubleClick(Hwnd, 10, 10)
TracePrint "鼠标在后台窗口(坐标：10, 10)处的双击"
//=================================================================================
//下面这句取窗口句柄(变量：Hwnd)窗口的客户区(坐标：5, 5)处的颜色
Color1 = Plugin.Bkgnd.GetPixelColor(Hwnd, 5, 5)
TracePrint "后台窗口(坐标：5, 5)处的颜色=" & Color1
//=================================================================================
//下面这句按从左到右，从上到下的顺序查找窗口句柄(变量：Hwnd)窗口的指定矩形区域内指定颜色
XY = Plugin.Bkgnd.FindColor(Hwnd, 0, 0, 20, 20, "FFFFFF")
//下面这句用于分割字符串,将横坐标和纵坐标分成两个字符串
MyArray = Split(XY, "|")
//下面这句将字符串转换成数值
X = CInt(MyArray(0)): Y = CInt(MyArray(1))
TracePrint "后台窗口颜色X坐标=" & X & "    Y坐标=" & Y
//=================================================================================
//下面这句按(从左到右从上到下的顺序找色)模糊查找窗口句柄(变量：Hwnd)窗口的指定矩形区域内指定颜色
XY = Plugin.Bkgnd.FindColorEx(Hwnd, 0, 0, 20, 20, "FFFFFF", 0, 0.9)
//下面这句用于分割字符串
MyArray = Split(XY, "|")
//下面这句将字符串转换成数值
X = CInt(MyArray(0)): Y = CInt(MyArray(1))
TracePrint "后台窗口颜色X坐标=" & X & "    Y坐标=" & Y
//=================================================================================
//下面这句按从中间到四周的顺序查找窗口句柄(变量：Hwnd)窗口的指定的矩形区域内指定颜色
XY = Plugin.Bkgnd.FindCenterColor(Hwnd, 0, 0, 20, 20, "FFFFFF")
//下面这句用于分割字符串,将横坐标和纵坐标分成两个字符串
MyArray = Split(XY, "|")
//下面这句将字符串转换成数值
X = CInt(MyArray(0)): Y = CInt(MyArray(1))
TracePrint "后台窗口颜色X坐标=" & X & "    Y坐标=" & Y
//=================================================================================
Hwnd = Plugin.Window.Find(0, "未命名 - 画图")
MessageBox "查找到的父窗口句柄为：" & Hwnd
//下面这句是关闭窗口
Call Plugin.Window.Quit(Hwnd)
MessageBox "退出画图窗口"
//=================================================================================
//[[以下是测试后台模拟键盘操作]]
//=================================================================================
Call RunApp("notepad.exe")
Delay 1000
//=================================================================================
//找记事本输入区句柄
Hwnd=Plugin.Window.Find(0,"无标题 - 记事本")
Hwnd=Plugin.Window.FindEx(Hwnd, 0, "Edit", 0)
TracePrint "记事本输入区句柄=" & Hwnd
//=================================================================================
//下面这句用于向后台窗口句柄(变量：Hwnd)发送一个键盘(扫描码：65)按键
Call Plugin.Bkgnd.KeyPress(Hwnd, 65)
TracePrint "在后台窗口输入A键"
//下面这句用于向后台窗口句柄(变量：Hwnd)发送一个键盘(扫描码：66)按下
Call Plugin.Bkgnd.KeyDown(Hwnd, 66)
//下面这句用于向后台窗口句柄(变量：Hwnd)发送一个键盘(扫描码：66)按下
Call Plugin.Bkgnd.KeyDown(Hwnd, 66)
TracePrint "在后台窗口输入B键"
//下面这句用于向后台窗口句柄(变量：Hwnd)发送一个文本消息(内容："内容")到客户区
Call Plugin.Bkgnd.SendString(Hwnd, "内容")
TracePrint "发送一个文本消息(内容)"
//=================================================================================
Hwnd = Plugin.Window.Find(0, "无标题 - 记事本")
MessageBox "查找到的父窗口句柄为：" & Hwnd
//下面这句是关闭窗口
Call Plugin.Window.Close(Hwnd)
MessageBox "退出记事本窗口"
//=================================================================================
