[Comment]
命令库是按键精灵8.0版推出的全新功能
您可以把自己常用的函数和子程序写在命令库里让很多个脚本去调用
命令库最大的优势是让多个脚本共享一个命令，修改一处就等于修改多处
目前命令库功能还在测试当中，有任何建议可以在按键精灵论坛提出，网址：http://bbs.ajjl.cn

******注意！这是官方提供的命令库，请勿修改！避免以后按键精灵升级时覆盖您的修改。******//
******          如需新增命令库，可在命令库点击右键选择“新建”命令库            ******//



[General]
MacroID=a1c52b4e-dc44-4ded-887c-ff94144acf68

[Script]
Function 获得网页源文件(网页地址)
    //例子：MsgBox lib.网络.获得网页源文件("http://www.jdyou.com")
    Dim xmlHttp, xmlBody, xmlUrl
    Dim ThisCharCode ,NextCharCode ,BytesToBstr
    If InStr(网页地址, "http://") = 0 Then 
        xmlUrl = "http://" & 网页地址
    Else
        xmlUrl = 网页地址
    End if
    Set xmlHttp = CreateObject("Microsoft.XMLHTTP")
    xmlHttp.Open "Get", xmlUrl, False
    xmlHttp.Send
    xmlBody = xmlHttp.ResponseBody
    Set xmlHttp = Nothing  
    获得网页源文件 = ""
    If Len(xmlBody) = 0 Then Exit Function
    Set ObjStream = CreateObject("Adodb.Stream")
    With ObjStream
        .Type = 1
        .Mode = 3
        .Open
        .Write xmlBody
        .Position = 0
        .Type = 2
        .Charset = "GB2312"
        BytesToBstr = .ReadText
        .Close
    End With
    Set ObjStream = Nothing    
    获得网页源文件 = BytesToBstr
End Function
Function 获得外网IP地址()   
    //例子：MsgBox lib.网络.获得外网IP地址()
    Dim 网页内容,开始位置,结束位置
    网页内容 = lib.网络.获得网页源文件("http://www.ip138.com/ip2city.asp?jdfwkey=htu173")
    开始位置 = inStr(网页内容,"[") + 1
    结束位置 = inStr(网页内容,"]") - 开始位置
    获得外网IP地址 = Mid(网页内容,开始位置,结束位置)
End Function
Function 发送邮件(你的邮箱帐号, 你的邮箱密码, 发送邮件地址, 邮件主题, 邮件内容, 邮件附件) 
    //例子：MsgBox lib.网络.发送邮件("ceshi0000001@163.com","ceshi000001","ceshi0000001@163.com","邮件主题","邮件内容","")
    Dim You_ID,MS_Space,Email
    '帐号和服务器分离 
    You_ID = Split(你的邮箱帐号, "@") 
    '这个是必须要的，不过可以放心的事，不会通过微软发送邮件 
    MS_Space = "http://schemas.microsoft.com/cdo/configuration/" 
    Set Email = CreateObject("CDO.Message") 
    '这个一定要和发送邮件的帐号一样
    Email.From = 你的邮箱帐号 
    'Execute "Email.to = 发送邮件地址"
    Email.CC = 发送邮件地址
    Email.Subject = 邮件主题
    Email.Textbody = 邮件内容 
    If 邮件附件 <> "" Then 
        Email.AddAttachment 邮件附件 
    End If 
    With Email.Configuration.Fields 
        '发信端口 
        .Item(MS_Space & "sendusing") = 2 
        'SMTP服务器地址 
        .Item(MS_Space & "smtpserver") = "smtp." & You_ID(1) 
        'SMTP服务器端口 
        .Item(MS_Space & "smtpserverport") = 25 
        .Item(MS_Space & "smtpauthenticate") = 1
        .Item(MS_Space & "sendusername") = You_ID(0) 
        .Item(MS_Space & "sendpassword") = 你的邮箱密码  
        .Update 
    End With 
    '发送邮件 
    Email.Send 
    '关闭组件 
    Set Email = Nothing 
    发送邮件 = True
    '如果没有任何错误信息，则表示发送成功,否则发送失败 
    If Err Then 
        Err.Clear 
        发送邮件 = False 
    End If 
End Function 
Function 获取网络时间()
    //例子：MsgBox "当前标准时间为：" & lib.网络.获取网络时间()
    //判断：If NowTime>CDate("2010-5-9") Then
    Dim SvrName(7),xPost,HttpAdd,NowTime,StartTime,i
    StartTime=Now 
    SvrName(0) = "time-a.nist.gov"
    SvrName(1) = "time-a.timefreq.bldrdoc.gov"
    SvrName(2) = "time-b.timefreq.bldrdoc.gov"
    SvrName(3) = "time-c.timefreq.bldrdoc.gov"
    SvrName(4) = "utcnist.colorado.edu"
    SvrName(5) = "time.nist.gov"
    SvrName(6) = "nist1.datum.com"
    SvrName(7) = "nist1.aol-ca.truetime.com"
    Set xPost=createObject("Microsoft.XMLHTTP") 
    Do While NowTime=""
        For i=0 to 7
            NowTime=""
            HttpAdd="Http://" & SvrName(i) & ":13"
            xPost.Open "Put", HttpAdd, False
            xPost.Send
            Delay 10
            If xPost.readyState=4 Then
                NowTime=mid(xPost.responsetext, 8, 17)
                If NowTime<>"" Then
                    NowTime=CDate(NowTime) + 8 / 24
                    Exit Do
                Else
                    xPost.abort
                    NowTime=""
                End If
            End If
        Next
        If DateDiff("s", StartTime, Now)>=30 And NowTime="" Then
            Msgbox "请确定你已经连接上了互联网！", 0, "获取网络时间"
            Exit Do 
        End If
    Loop
    xPost.abort
    Set xPost=Nothing
    获取网络时间=NowTime
End Function






//制作：一只鱼
//日期：2009.12.30
//修改：2011.04.19

