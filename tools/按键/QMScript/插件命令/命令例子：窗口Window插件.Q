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
MacroID=c204790c-bfa5-44ec-86ad-62c44aed5a52
Description=命令例子：窗口Window插件
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
Call RunApp("notepad.exe")
Delay 1000
//=================================================================================
//下面这句是查找窗口类名(0)或者标题("无标题 - 记事本"),返回找到的句柄Hwnd
Hwnd = Plugin.Window.Find(0, "无标题 - 记事本")
MessageBox "查找到的父窗口句柄为：" & Hwnd
//下面这句是根据父窗口句柄(Hwnd)查找子窗口匹配类名("Edit")或者匹配标题(0),返回找到匹配的句柄Hwnd
Hwnd = Plugin.Window.FindEx(Hwnd, 0, "Edit", 0)
MessageBox "查找到的子窗口句柄为：" & Hwnd
//=================================================================================
//下面这句是激活窗口
Call Plugin.Window.Active(Hwnd)
MessageBox "当前激活窗口"
//下面这句是得到当前最前面的窗口句柄
Hwnd = Plugin.Window.Foreground()
MessageBox "得到当前最前面的窗口句柄为：" & Hwnd
//下面这句是最小化窗口
Call Plugin.Window.Min(Hwnd)
MessageBox "当前最小化"
//下面这句是还原窗口
Call Plugin.Window.Restore(Hwnd)
MessageBox "当前还原窗口"
//下面这句是最大化窗口
Call Plugin.Window.Max(Hwnd)
MessageBox "当前最大化"
//下面这句是还原窗口
Call Plugin.Window.Restore(Hwnd)
MessageBox "当前还原窗口"
//下面这句是得到鼠标指向的窗口句柄
Hwnd0 = Plugin.Window.MousePoint()
MessageBox "得到鼠标指向的窗口句柄为：" & Hwnd0
//下面这句是隐藏窗口
Call Plugin.Window.Hide(Hwnd)
MessageBox "当前隐藏窗口"
//下面这句是显示窗口
Call Plugin.Window.Show(Hwnd)
MessageBox "当前显示窗口"
//=================================================================================
//下面这句是得到窗口句柄的边框大小(包括标题栏)
Rect = Plugin.Window.GetWindowRect(Hwnd)
MessageBox "得到窗口句柄的边框大小(包括标题栏)为：" & Rect
//下面这句用于分割字符串,将横坐标和纵坐标分成两个字符串
MyArray = Split(Rect, "|")
//下面这句将字符串转换成数值
W1 = Clng(MyArray(0)): H1 = Clng(MyArray(1))
W2 = Clng(MyArray(2)): H2 = Clng(MyArray(3))
MessageBox "边框大小：       "  &  W2-W1 & "             " & H2-H1
//下面这句是改变窗口大小为(100, 100)
Call Plugin.Window.Size(Hwnd, 100, 100)
MessageBox "当前改变窗口大小"
//下面这句是得到窗口句柄的客户区大小
Rect = Plugin.Window.GetClientRect(Hwnd)
MessageBox "得到窗口句柄的客户区大小为：" & Rect
//下面这句用于分割字符串,将横坐标和纵坐标分成两个字符串
MyArray = Split(Rect, "|")
//下面这句将字符串转换成数值
L = Clng(MyArray(0)): T = Clng(MyArray(1))
R = Clng(MyArray(2)): B = Clng(MyArray(3))
//下面这句是改变窗口大小为(W, H)
Call Plugin.Window.Size(Hwnd, W2-W1, H2-H1)
MessageBox "当前改变窗口大小"
//=================================================================================
//下面这句是移动窗口到(100, 100)位置
Call Plugin.Window.Move(Hwnd, 100, 100)
MessageBox "当前移动窗口到(100, 100)位置"
//下面这句是判断窗口是否打开
Window1 = Plugin.Window.IsWindow(Hwnd)
If Window1 = 1 Then
    MessageBox "窗口打开中"
Else 
    MessageBox "窗口没有打开"
End If 
//下面这句是得到窗口句柄的标题
Text = Plugin.Window.GetText(Hwnd)
MessageBox "得到窗口句柄的标题为：" & Text
//下面这句是得到窗口句柄的类名
Class1 = Plugin.Window.GetClass(Hwnd)
MessageBox "得到窗口句柄的类名为：" & Class1
//=================================================================================
//下面这句是遍历符合窗口标题("记事本")的句柄保存到数组(HwndEx)里
HwndEx = Plugin.Window.Search("记事本")
MessageBox "查找到符合的窗口句柄为：" & HwndEx 
//下面这句用于分割字符串,将横坐标和纵坐标分成两个字符串
MyArray = Split(HwndEx, "|")
If UBound(MyArray)>=0 Then    
    For i=0 To UBound(MyArray)-1
        //下面这句将字符串转换成数值
        MessageBox "第 " & i+1 & " 个窗口句柄为：" & Clng(MyArray(i))        
    Next 
End If 
//=================================================================================
//下面这句是改变窗口大小为(300, 200)
Call Plugin.Window.Size(Hwnd, 300, 200)
MessageBox "当前改变窗口大小"
//=================================================================================
//下面这句是窗口属性设置为(窗口置前)
Call Plugin.Window.Top(Hwnd, 0)
MessageBox "当前窗口置前"
//下面这句是窗口属性设置为(取消窗口置前)
Call Plugin.Window.Top(Hwnd, 1)
MessageBox "当前取消窗口置前"
//=================================================================================
//下面这句是关闭窗口
Call Plugin.Window.Close(Hwnd)
MessageBox "当前关闭窗口"
