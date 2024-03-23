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
MacroID=f7305e79-1ff2-4026-b508-2eb567732b9b
Description=演示例子：中间渐开找怪（区域找色）
Enable=0
AutoRun=0
[Repeat]
Type=0
Number=1
[Relative]
SetupOCXFile=
[Comment]
Content====找怪脚本===.
【功能说明】.
通用脚本，把全屏分成很多区域找怪！.
.
【使用说明】.
本脚本不能单独运行，只能结合到游戏脚本中~启动热键为<F10>，中止热键为<F12>。.
.
【作者介绍】.
【按键专家团 Jimmyzs】.
.
【制作日期】.
<2006-7-26>

[Script]
dim NumA,NumB,NumC,NumK,NumN,CenterX,CenterY,GBX,GBY,StepX,StepY
//NumA--X轴移动的变量，NumB--Y轴移动的变量，NumK--中间变量
NumA=0:NumB=0:NumC=0:CenterX=385:CenterY=310:StepX=82:StepY=66
//CenterX，CenterY---中心坐标(一般是人数) StepY,StepY--步长
//****************************主程序开始**************************************
While NumC<3
    //NumC---三圈， 相当会把找怪范围会成25个格
    NumN=NumC*8:NumK=0
    //NumN---找怪的格子位置
    While NumK<NumN
        //向下移动
        If NumK>0 and NumK<(NumN/4) Then
            NumB=NumB+1
       	End If
        //向左移动
        If NumK>=(NumN/4) and NumK<(NumN/2) Then
            NumA=NumA-1
       	End If
        //向上移动
        If NumK>=(NumN/2) and NumK<(NumN/4)*3 Then
            NumB=NumB-1
       	End If
        //向右移动
        If NumK>=(NumN/4)*3 and NumK<NumN Then
            NumA=NumA+1
       	End If
        //每一格的中心坐标
        GBX=CenterX+StepX*NumA
        GBY=CenterY+StepY*NumB
        Delay Time/2
        //***************查看运行效果********************
        //如果想看本脚本的执行路线，请打开图画，再打把下面三句前的//去掉
        //MoveTo GBX GBY
        //Delay 100
        //LeftClick 1
        //*******************************************
        //×××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××
        //×××××××××××××××××××××××××××××  找怪部分 ××××××××××××××××××××××××××××××
        Call FindColorEx (GBX-StepX/2,GBY-StepY/2,GBX+StepX/2,GBY+StepY/2,"FFFFFF",1,0.6,AX,AY)
        //“FFFFFF”----怪的色，其它部分不要动，这里也可以改成在（GBX-StepX/2,GBY-StepY/2,GBX+StepX/2,GBY+StepY/2）范围内找图片
        Delay Time/2
        If AX>0 Then
            //找到色
            MoveTo AX,AY
            //移动到AX，AY
            //*****判断是否是怪********
            //gosub Mon
            //<判断是否是怪>子程序在这里调用！
            //*************************
            Delay Time
            Goto KillMon
       	End If
        //××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××
        NumK=NumK+1
    Wend    
    NumA=NumA+1:NumC=NumC+1
Wend
//************************************主程序结束***************************************
//*************************************************************************************
//******************** 打怪 ********************
Rem KillMon
//下面请自己添加打怪要的动作
//提示：1。可以先判断是否是怪。[要判断的话，就写个子程序，上面有提示<判断是否是怪>调用的地方。]
//      2。是怪的话就攻击，杀死后跳到开始，重新开始找怪；不是的话，就跳到下一格接着找！
