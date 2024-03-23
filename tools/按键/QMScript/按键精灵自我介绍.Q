[General]
SyntaxVersion=1
BeginHotkey=57
BeginHotkeyMod=2
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=0
EnableWindow=
MacroID=992ef3b9-b20f-43c2-bebd-d1280e7b5fa1
Description=动作教程：按键自我介绍1.3版
Enable=0
AutoRun=0
[Repeat]
Type=0
Number=1
[Relative]
SetupOCXFile=
[Comment]
Content====通用脚本===.
【功能说明】.
介绍按键精灵最基本的功能，包括打开一个程序、模拟按键、延时、鼠标移动、鼠标点击、鼠标相对移动、保存/恢复鼠标位置、if判断语句、等待按键功能.
.
【使用说明】.
按下热键即可启动脚本，之后请按照脚本提示进行操作.
.
【制作日期】.
05年05月05日

[Script]
//点击编辑界面的注释按钮，即可看到比较详细的脚本说明
Call RunApp("notepad")
Delay 2000
StringDelay=1000
//最大化写字板
KeyDown "Alt", 1
KeyPress "F", 1
KeyUp "Alt", 1
Delay 500
KeyPress "Left", 1
Delay 500
KeyPress "X", 1
SayString "hi，你好，我是""按键精灵""，我是个很有趣的软件，如果你愿意花5分钟的时间来了解我，你一定会喜欢上我的。 :-)"
KeyPress "Enter", 1
Delay StringDelay
SayString "愿意了解我吗？如果愿意，请你按下键盘上的Y键，如果不喜欢我，那就按下键盘上的N键（等待按键...）"
KeyPress "Enter", 1
Do
    //等待按键
    key=WaitKey()
    KeyPress "Enter", 1
    TracePrint "用户按下的键是：" & key
    If key=78 Then
        Call GuanBiChuangKou()
        //按下n不保存，直接关闭
        Delay 1000
        KeyPress "N", 1
        Delay 1000
        Call 脚本结束()
    ElseIf key=89 Then
        Exit do
    Else 
        SayString "请按Y或者N，不要按其他键(等待按键...)"
        KeyPress "Enter", 1
    End If 
loop
//结束等待
SayString "哈哈，我太高兴了，又多了一个喜欢我的朋友，那我先来一个自我介绍吧。"
KeyPress "Enter", 1
Delay StringDelay
SayString "我叫“按键精灵”，我的爸爸是伟大的兄弟工作组，我在网上有个家，地址是www.vrbrothers.com，欢迎来做客哦"
KeyPress "Enter", 1
Delay StringDelay
SayString "嗯，好像废话多了些，如果不希望我继续废话，请按一下键盘，随便哪个键都可以啦（等待按键...）"
KeyPress "Enter", 1
key=WaitKey()
KeyPress "Enter", 1
SayString "嘿嘿，按键了吧。其实我的本领就是让你按一下键盘，就可以作很多动作。不过你好像还有点不太理解哦"
KeyPress "Enter", 1
Delay StringDelay
SayString "嗯"
For 6
    SayString "."
    Delay 500
Next 
SayString "让我想想怎么解释给你"
For 6
    SayString "."
    Delay 500
Next 
KeyPress "Enter", 1
SayString "哈，有了，我把一些好朋友使用我的例子介绍给你吧，想听的话就再按一下键盘吧（等待按键...）"
KeyPress "Enter", 1
key = WaitKey()
KeyPress "Enter", 1
SayString "呵呵，其实我最多的朋友是玩游戏的朋友，特别是玩网络游戏的朋友。"
KeyPress "Enter", 1
Delay StringDelay
SayString "在游戏里，经常要做一些重复的动作，比如反复按鼠标和键盘，有了我就轻松啦，我可以代替你按键盘和鼠标。"
KeyPress "Enter", 1
Delay StringDelay
SayString "我还很聪明的，只要你稍微熟悉我一些，就可以让我作出很多聪明的动作，比如在游戏里面自动找怪物打怪物。"
KeyPress "Enter", 1
Delay StringDelay
SayString "由于我只是模仿人们双手的操作，所以我和那些万恶的外挂是坚决划清界限的，大家一定要支持我啊"
KeyPress "Enter", 1
Delay StringDelay
SayString "除了玩家之外，我还有很多朋友，比如有的把我当作日常办公的小助手，减轻了很多工作，可惜不给我发工资。"
KeyPress "Enter", 1
Delay StringDelay
SayString "总之，我很有用啦，双手可以做到的事情，我都可以代劳，如果你发现有些事情双手做起来很累，就交给我吧！"
KeyPress "Enter", 1
KeyPress "Enter", 1
Delay StringDelay
SayString "啊，罗嗦了很多啦，下面我还是手把手的告诉你一些我的具体能力吧。"
KeyPress "Enter", 1
Delay StringDelay
SayString "先把我的废话都清空，嘻嘻，随便按一个键看我本事吧（等待按键...）"
KeyPress "Enter", 1
key = WaitKey()
KeyPress "Enter", 1
SayString "注意看哦，我接下来会自动按下""alt+e""进入写字板的""编辑""菜单，然后再按下a全选我的废话，再按del清空"
KeyPress "Enter", 1
Delay StringDelay
Delay StringDelay
SayString "倒计时，3、"
Delay StringDelay
SayString "2、"
Delay StringDelay
SayString "1"
Delay StringDelay
KeyDown "Alt",1
KeyPress "E", 1
KeyUp "Alt",1
Delay StringDelay
KeyPress "A", 1
Delay StringDelay
KeyPress "Delete", 1
Delay StringDelay
//第二步
KeyPress "Enter", 1
SayString "呼..... 整个世界清净了，下面我先介绍一下我的基本能力：模拟键盘和鼠标"
KeyPress "Enter", 1
Delay StringDelay
SayString "先按下一下a键，注意了，这可不是我说出来的a，是我模拟按出来的哦"
KeyPress "Enter", 1
Delay StringDelay
KeyPress "Enter", 1
KeyPress "A", 1
KeyPress "Enter", 1
KeyPress "Enter", 1
SayString "看明白了吗？好像不是很明显，那我按3下a键"
KeyPress "Enter", 1
Delay StringDelay
KeyPress "Enter", 1
KeyPress "A", 3
KeyPress "Enter", 1
KeyPress "Enter", 1
SayString "这下是不是更清楚了呢？我再多按一些"
KeyPress "Enter", 1
Delay StringDelay
KeyPress "Enter", 1
KeyPress "A", 1
KeyPress "B", 1
KeyPress "C", 1
KeyPress "D", 1
KeyPress "E", 1
KeyPress "F", 1
KeyPress "G", 1
KeyPress "H", 1
KeyPress "Enter", 1
KeyPress "Enter", 1
SayString "哈，这下看清了吧？上面这些字母都是我模拟键盘按下去的。"
KeyPress "Enter", 1
Delay StringDelay
SayString "我还会按 组合键 呢，我现在按一下ctrl+a，这样可以把我的废话全部选中"
KeyPress "Enter", 1
Delay StringDelay
KeyDown "Ctrl", 1
KeyPress "A", 1
KeyUp "Ctrl", 1
Delay StringDelay
KeyPress "End", 1
SayString "哈哈，看到了吧？我厉害吧？下面介绍一下模拟鼠标，这个动作可复杂了，是套组合动作"
KeyPress "Enter", 1
Delay StringDelay
SayString "想让我演示的话就按一下键盘吧（等待按键...）"
KeyPress "Enter", 1
Delay StringDelay
key=WaitKey()
KeyPress "Enter", 1
SayString "我先用鼠标画一个圆，然后把鼠标移动到屏幕中间，保存一下鼠标的位置，然后按下右键，"
KeyPress "Enter", 1
SayString "再向左平移一些，再按下左键，然后再把鼠标恢复到中间的位置"
KeyPress "Enter", 1
Delay StringDelay
SayString "是不是看起来很复杂？我用慢动作表演一下，注意开始喽"
KeyPress "Enter", 1
KeyPress "Enter", 1
Delay StringDelay
//第三步
Call 画圆()
Delay 1000
Call GetScreenResolution(intX,intY)
MoveTo 0,0
Delay StringDelay
MoveTo intX/2,intY/2
SaveMousePos 
Delay StringDelay
RightClick 1
Delay StringDelay
MoveR -20,0
Delay StringDelay
LeftClick 1
Delay StringDelay
RestoreMousePos 
Delay StringDelay
KeyDown "Ctrl", 1
KeyPress "End", 1
KeyUp "Ctrl", 1
SayString "有没有看晕呢？呵呵。其实我演示了我模拟鼠标的基本能力，那就是"
KeyPress "Enter", 1
SayString "鼠标点击、鼠标移动、鼠标相对移动和保存/恢复鼠标位置，当然中间还加了一些""延时"""
Delay StringDelay
KeyPress "Enter", 1
KeyPress "Enter", 1
SayString "好了，基本的本领介绍完了，你可以使用我的编辑功能制作这些动作，全是界面操作，非常非常简单，快去试试吧！"
Delay StringDelay
Call 脚本结束()
//脚本结束
Sub 脚本结束()
MessageBox "脚本演示结束，最好的脚本永远是您自己制作的。 :-)"
EndScript 
End Sub
//例子:关闭当前窗口
//说明:Windows里面按下alt+f4即可关闭当前窗口,模拟这个操作
Sub GuanBiChuangKou()
    KeyDown "Alt", 1
    KeyPress "F4", 1
    KeyUp "Alt", 1
End Sub
//例子:用鼠标画一个圆
Sub 画圆()
    r=300:x0=512:y0=384:x=0:y=0:n=0
    While n<3.1415926*2
        x=x0+r*cos(n)
        y=y0-r*sin(n)
        MoveTo x,y
        Delay 20
        n=n+0.03
    Wend 
End Sub
