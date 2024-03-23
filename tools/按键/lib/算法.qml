[Comment]
命令库是按键精灵8.0版推出的全新功能
您可以把自己常用的函数和子程序写在命令库里让很多个脚本去调用
命令库最大的优势是让多个脚本共享一个命令，修改一处就等于修改多处
目前命令库功能还在测试当中，有任何建议可以在按键精灵论坛提出，网址：http://bbs.ajjl.cn

******注意！这是官方提供的命令库，请勿修改！避免以后按键精灵升级时覆盖您的修改。******//
******          如需新增命令库，可在命令库点击右键选择“新建”命令库            ******//


[General]
MacroID=3f1e0d02-3591-4461-aead-f3fdd3e337b1

[Script]
Function 结构数组排序(数组,返回类型)
    //数字="100=A|50=B|1=C|0=D|10=E|20=F|12=G|21=H"
    //数组=Split(数字,"|")
    //例子：Msgbox lib.算法.结构数组排序(数组,0)
    //语法格式：数组() = "数字大小=值"
    //数组：NB_PaiXu(0) = "200=A"
    //返回类型：[0全部1最小2最大]
    Dim Int_A,Int_B,Int_Num,Int_Len,A_Str,Int_Temp
    //〈————————————————————初始赋值
    Int_A = 0: Int_Num = UBound(数组)
    For Int_A=0 TO UBound(数组) - 1
        Int_B = Int_A
        For Int_Len=0 To Int_Num - Int_A 
            //〈————————————————根据“=”号分离，进行大小判断
            A_Str = Split(数组(Int_A), "="): B_Str = Split(数组(Int_B), "=")
            If Clng(A_Str(0)) > Clng(B_Str(0)) Then
                Int_Temp = 数组(Int_A): 数组(Int_A) = 数组(Int_B): 数组(Int_B) = Int_Temp
            End If 
            Int_B = Int_B + 1
        Next 
    Next 
    If 返回类型 = 0 Then
        //〈——————————————————排序结果
        结构数组排序 = Join(数组)
    ElseIf 返回类型 = 1 Then
        //〈——————————————————返回最小值
        结构数组排序 = 数组(0)
    ElseIf 返回类型 = 2 Then
        //〈——————————————————返回最大值
        结构数组排序 = 数组(Int_Num)
    End If 
End Function   
Function 提取字串符中所有数字(字符串)
    //MsgBox lib.算法.提取字串符中所有数字("dfghhj12dsfg3.hgk54dsfg67-45678")
    Dim rExp, 数字
    数字 = ""
    Set rExp = CreateObject("VBScript.RegExp")
    rExp.Pattern = "\d+"
    rExp.Global = True
    Dim Num, Nums
    Set Nums = rExp.Execute(字符串)
    For Each Num In Nums
        数字 = 数字 & Num 
    next 
    Set rExp = Nothing 
    提取字串符中所有数字=数字
End Function
Function 提取汉字拼音首字母(中文汉字)
    //例子：MsgBox lib.算法.提取汉字拼音首字母("我是一只鱼！")
    Dim 拼音首字母,单个汉字,汉字编码,首字母,i
    拼音首字母=""
    For i=0 To Len(中文汉字)-1
        单个汉字=Mid(中文汉字,i+1,1)    
        汉字编码 = 65536 + Asc(单个汉字)
        首字母 = ""
        If (汉字编码 >= 45217 And 汉字编码 <= 45252)
            首字母 = "A"
        ElseIf (汉字编码 >= 45253 And 汉字编码 <= 45760)
            首字母 = "B"
        ElseIf (汉字编码 >= 45761 And 汉字编码 <= 46317)
            首字母 = "C"
        ElseIf (汉字编码 >= 46318 And 汉字编码 <= 46825)
            首字母 = "D"
        ElseIf (汉字编码 >= 46826 And 汉字编码 <= 47009)
            首字母 = "E"
        ElseIf (汉字编码 >= 47010 And 汉字编码 <= 47296)
            首字母 = "F"
        ElseIf (汉字编码 >= 47297 And 汉字编码 <= 47613)   
            首字母 = "G"  
        ElseIf (汉字编码 >= 47614 And 汉字编码 <= 48118)   
            首字母 = "H"  
        ElseIf (汉字编码 >= 48119 And 汉字编码 <= 49061)   
            首字母 = "J"  
        ElseIf (汉字编码 >= 49062 And 汉字编码 <= 49323)   
            首字母 = "K"  
        ElseIf (汉字编码 >= 49324 And 汉字编码 <= 49895)   
            首字母 = "L"  
        ElseIf (汉字编码 >= 49896 And 汉字编码 <= 50370)   
            首字母 = "M"  
        ElseIf (汉字编码 >= 50371 And 汉字编码 <= 50613)   
            首字母 = "N"  
        ElseIf (汉字编码 >= 50614 And 汉字编码 <= 50621)   
            首字母 = "O"  
        ElseIf (汉字编码 >= 50622 And 汉字编码 <= 50905)   
            首字母 = "P"  
        ElseIf (汉字编码 >= 50906 And 汉字编码 <= 51386)   
            首字母 = "Q"  
        ElseIf (汉字编码 >= 51387 And 汉字编码 <= 51445)   
            首字母 = "R"  
        ElseIf (汉字编码 >= 51446 And 汉字编码 <= 52217)   
            首字母 = "S"  
        ElseIf (汉字编码 >= 52218 And 汉字编码 <= 52697)   
            首字母 = "T"  
        ElseIf (汉字编码 >= 52698 And 汉字编码 <= 52979)   
            首字母 = "W"  
        ElseIf (汉字编码 >= 52980 And 汉字编码 <= 53640)   
            首字母 = "X"  
        ElseIf (汉字编码 >= 53689 And 汉字编码 <= 54480)   
            首字母 = "Y"  
        ElseIf (汉字编码 >= 54481 And 汉字编码 <= 55289)   
            首字母 = "Z"  
        EndIf  
        拼音首字母 = 拼音首字母 & 首字母
    Next
    提取汉字拼音首字母 = 拼音首字母
End Function     
Function 中文汉字转拼音(中文汉字)
    //例子：MsgBox lib.算法.中文汉字转拼音("我是一只鱼！")
    Dim 拼音库码(395)
    拼音库码(0) = "A=-20319"
    拼音库码(1) = "Ai=-20317"
    拼音库码(2) = "An=-20304"
    拼音库码(3) = "Ang=-20295"
    拼音库码(4) = "Ao=-20292"

    拼音库码(5) = "Ba=-20283"
    拼音库码(6) = "Bai=-20265"
    拼音库码(7) = "Ban=-20257"
    拼音库码(8) = "Bang=-20242"
    拼音库码(9) = "Bao=-20230"
    拼音库码(10) = "Bei=-20051"
    拼音库码(11) = "Ben=-20036"
    拼音库码(12) = "Beng=-20032"
    拼音库码(13) = "Bi=-20026"
    拼音库码(14) = "Bian=-20002"
    拼音库码(15) = "Biao=-19990"
    拼音库码(16) = "Bie=-19986"
    拼音库码(17) = "Bin=-19982"
    拼音库码(18) = "Bing=-19976"
    拼音库码(19) = "Bo=-19805"
    拼音库码(20) = "Bu=-19784"

    拼音库码(21) = "Ca=-19775"
    拼音库码(22) = "Cai=-19774"
    拼音库码(23) = "Can=-19763"
    拼音库码(24) = "Cang=-19756"
    拼音库码(25) = "Cao=-19751"
    拼音库码(26) = "Ce=-19746"
    拼音库码(27) = "Ceng=-19741"
    拼音库码(28) = "Cha=-19739"
    拼音库码(29) = "Chai=-19728"
    拼音库码(30) = "Chan=-19725"
    拼音库码(31) = "Chang=-19715"
    拼音库码(32) = "Chao=-19540"
    拼音库码(33) = "Che=-19531"
    拼音库码(34) = "Chen=-19525"
    拼音库码(35) = "Cheng=-19515"
    拼音库码(36) = "Chi=-19500"
    拼音库码(37) = "Chong=-19484"
    拼音库码(38) = "Chou=-19479"
    拼音库码(39) = "Chu=-19467"
    拼音库码(40) = "Chuai=-19289"
    拼音库码(41) = "Chuan=-19288"
    拼音库码(42) = "Chuang=-19281"
    拼音库码(43) = "Chui=-19275"
    拼音库码(44) = "Chun=-19270"
    拼音库码(45) = "Chuo=-19263"
    拼音库码(46) = "Ci=-19261"
    拼音库码(47) = "Cong=-19249"
    拼音库码(48) = "Cou=-19243"
    拼音库码(49) = "Cu=-19242"
    拼音库码(50) = "Cuan=-19238"
    拼音库码(51) = "Cui=-19235"
    拼音库码(52) = "Cun=-19227"
    拼音库码(53) = "Cuo=-19224"

    拼音库码(54) = "Da=-19218"
    拼音库码(55) = "Dai=-19212"
    拼音库码(56) = "Dan=-19038"
    拼音库码(57) = "Dang=-19023"
    拼音库码(58) = "Dao=-19018"
    拼音库码(59) = "De=-19006"
    拼音库码(60) = "Deng=-19003"
    拼音库码(61) = "Di=-18996"
    拼音库码(62) = "Dian=-18977"
    拼音库码(63) = "Diao=-18961"
    拼音库码(64) = "Die=-18952"
    拼音库码(65) = "Ding=-18783"
    拼音库码(66) = "Diu=-18774"
    拼音库码(67) = "Dong=-18773"
    拼音库码(68) = "Dou=-18763"
    拼音库码(69) = "Du=-18756"
    拼音库码(70) = "Duan=-18741"
    拼音库码(71) = "Dui=-18735"
    拼音库码(72) = "Dun=-18731"
    拼音库码(73) = "Duo=-18722"

    拼音库码(74) = "E=-18710"
    拼音库码(75) = "En=-18697"
    拼音库码(76) = "Er=-18696"

    拼音库码(77) = "Fa=-18526"
    拼音库码(78) = "Fan=-18518"
    拼音库码(79) = "Fang=-18501"
    拼音库码(80) = "Fei=-18490"
    拼音库码(81) = "Fen=-18478"
    拼音库码(82) = "Feng=-18463"
    拼音库码(83) = "Fo=-18448"
    拼音库码(84) = "Fou=-18447"
    拼音库码(85) = "Fu=-18446"

    拼音库码(86) = "Ga=-18239"
    拼音库码(87) = "Gai=-18237"
    拼音库码(88) = "Gan=-18231"
    拼音库码(89) = "Gang=-18220"
    拼音库码(90) = "Gao=-18211"
    拼音库码(91) = "Ge=-18201"
    拼音库码(92) = "Gei=-18184"
    拼音库码(93) = "Gen=-18183"
    拼音库码(94) = "Geng=-18181"
    拼音库码(95) = "Gong=-18012"
    拼音库码(96) = "Gou=-17997"
    拼音库码(97) = "Gu=-17988"
    拼音库码(98) = "Gua=-17970"
    拼音库码(99) = "Guai=-17964"
    拼音库码(100) = "Guan=-17961"
    拼音库码(101) = "Guang=-17950"
    拼音库码(102) = "Gui=-17947"
    拼音库码(103) = "Gun=-17931"
    拼音库码(104) = "Guo=-17928"

    拼音库码(105) = "Ha=-17922"
    拼音库码(106) = "Hai=-17759"
    拼音库码(107) = "Han=-17752"
    拼音库码(108) = "Hang=-17733"
    拼音库码(109) = "Hao=-17730"
    拼音库码(110) = "He=-17721"
    拼音库码(111) = "Hei=-17703"
    拼音库码(112) = "Hen=-17701"
    拼音库码(113) = "Heng=-17697"
    拼音库码(114) = "Hong=-17692"
    拼音库码(115) = "Hou=-17683"
    拼音库码(116) = "Hu=-17676"
    拼音库码(117) = "Hua=-17496"
    拼音库码(118) = "Huai=-17487"
    拼音库码(119) = "Huan=-17482"
    拼音库码(120) = "Huang=-17468"
    拼音库码(121) = "Hui=-17454"
    拼音库码(122) = "Hun=-17433"
    拼音库码(123) = "Huo=-17427"

    拼音库码(124) = "Ji=-17417"
    拼音库码(125) = "Jia=-17202"
    拼音库码(126) = "Jian=-17185"
    拼音库码(127) = "Jiang=-16983"
    拼音库码(128) = "Jiao=-16970"
    拼音库码(129) = "Jie=-16942"
    拼音库码(130) = "Jin=-16915"
    拼音库码(131) = "Jing=-16733"
    拼音库码(132) = "Jiong=-16708"
    拼音库码(133) = "Jiu=-16706"
    拼音库码(134) = "Ju=-16689"
    拼音库码(135) = "Juan=-16664"
    拼音库码(136) = "Jue=-16657"
    拼音库码(137) = "Jun=-16647"

    拼音库码(138) = "Ka=-16474"
    拼音库码(139) = "Kai=-16470"
    拼音库码(140) = "Kan=-16465"
    拼音库码(141) = "Kang=-16459"
    拼音库码(142) = "Kao=-16452"
    拼音库码(143) = "Ke=-16448"
    拼音库码(144) = "Ken=-16433"
    拼音库码(145) = "Keng=-16429"
    拼音库码(146) = "Kong=-16427"
    拼音库码(147) = "Kou=-16423"
    拼音库码(148) = "Ku=-16419"
    拼音库码(149) = "Kua=-16412"
    拼音库码(150) = "Kuai=-16407"
    拼音库码(151) = "Kuan=-16403"
    拼音库码(152) = "Kuang=-16401"
    拼音库码(153) = "Kui=-16393"
    拼音库码(154) = "Kun=-16220"
    拼音库码(155) = "Kuo=-16216"

    拼音库码(156) = "La=-16212"
    拼音库码(157) = "Lai=-16205"
    拼音库码(158) = "Lan=-16202"
    拼音库码(159) = "Lang=-16187"
    拼音库码(160) = "Lao=-16180"
    拼音库码(161) = "Le=-16171"
    拼音库码(162) = "Lei=-16169"
    拼音库码(163) = "Leng=-16158"
    拼音库码(164) = "Li=-16155"
    拼音库码(165) = "Lia=-15959"
    拼音库码(166) = "Lian=-15958"
    拼音库码(167) = "Liang=-15944"
    拼音库码(168) = "Liao=-15933"
    拼音库码(169) = "Lie=-15920"
    拼音库码(170) = "Lin=-15915"
    拼音库码(171) = "Ling=-15903"
    拼音库码(172) = "Liu=-15889"
    拼音库码(173) = "Long=-15878"
    拼音库码(174) = "Lou=-15707"
    拼音库码(175) = "Lu=-15701"
    拼音库码(176) = "Lv=-15681"
    拼音库码(177) = "Luan=-15667"
    拼音库码(178) = "Lue=-15661"
    拼音库码(179) = "Lun=-15659"
    拼音库码(180) = "Luo=-15652"

    拼音库码(181) = "Ma=-15640"
    拼音库码(182) = "Mai=-15631"
    拼音库码(183) = "Man=-15625"
    拼音库码(184) = "Mang=-15454"
    拼音库码(185) = "Mao=-15448"
    拼音库码(186) = "Me=-15436"
    拼音库码(187) = "Mei=-15435"
    拼音库码(188) = "Men=-15419"
    拼音库码(189) = "Meng=-15416"
    拼音库码(190) = "Mi=-15408"
    拼音库码(191) = "Mian=-15394"
    拼音库码(192) = "Miao=-15385"
    拼音库码(193) = "Mie=-15377"
    拼音库码(194) = "Min=-15375"
    拼音库码(195) = "Ming=-15369"
    拼音库码(196) = "Miu=-15363"
    拼音库码(197) = "Mo=-15362"
    拼音库码(198) = "Mou=-15183"
    拼音库码(199) = "Mu=-15180"

    拼音库码(200) = "Na=-15165"
    拼音库码(201) = "Nai=-15158"
    拼音库码(202) = "Nan=-15153"
    拼音库码(203) = "Nang=-15150"
    拼音库码(204) = "Nao=-15149"
    拼音库码(205) = "Ne=-15144"
    拼音库码(206) = "Nei=-15143"
    拼音库码(207) = "Nen=-15141"
    拼音库码(208) = "Neng=-15140"
    拼音库码(209) = "Ni=-15139"
    拼音库码(210) = "Nian=-15128"
    拼音库码(211) = "Niang=-15121"
    拼音库码(212) = "Niao=-15119"
    拼音库码(213) = "Nie=-15117"
    拼音库码(214) = "Nin=-15110"
    拼音库码(215) = "Ning=-15109"
    拼音库码(216) = "Niu=-14941"
    拼音库码(217) = "Nong=-14937"
    拼音库码(218) = "Nu=-14933"
    拼音库码(219) = "Nv=-14930"
    拼音库码(220) = "Nuan=-14929"
    拼音库码(221) = "Nue=-14928"
    拼音库码(222) = "Nuo=-14926"

    拼音库码(223) = "O=-14922"
    拼音库码(224) = "Ou=-14921"

    拼音库码(225) = "Pa=-14914"
    拼音库码(226) = "Pai=-14908"
    拼音库码(227) = "Pan=-14902"
    拼音库码(228) = "Pang=-14894"
    拼音库码(229) = "Pao=-14889"
    拼音库码(230) = "Pei=-14882"
    拼音库码(231) = "Pen=-14873"
    拼音库码(232) = "Peng=-14871"
    拼音库码(233) = "Pi=-14857"
    拼音库码(234) = "Pian=-14678"
    拼音库码(235) = "Piao=-14674"
    拼音库码(236) = "Pie=-14670"
    拼音库码(237) = "Pin=-14668"
    拼音库码(238) = "Ping=-14663"
    拼音库码(239) = "Po=-14654"
    拼音库码(240) = "Pu=-14645"

    拼音库码(241) = "Qi=-14630"
    拼音库码(242) = "Qia=-14594"
    拼音库码(243) = "Qian=-14429"
    拼音库码(244) = "Qiang=-14407"
    拼音库码(245) = "Qiao=-14399"
    拼音库码(246) = "Qie=-14384"
    拼音库码(247) = "Qin=-14379"
    拼音库码(248) = "Qing=-14368"
    拼音库码(249) = "Qiong=-14355"
    拼音库码(250) = "Qiu=-14353"
    拼音库码(251) = "Qu=-14345"
    拼音库码(252) = "Quan=-14170"
    拼音库码(253) = "Que=-14159"
    拼音库码(254) = "Qun=-14151"

    拼音库码(255) = "Ran=-14149"
    拼音库码(256) = "Rang=-14145"
    拼音库码(257) = "Rao=-14140"
    拼音库码(258) = "Re=-14137"
    拼音库码(259) = "Ren=-14135"
    拼音库码(260) = "Reng=-14125"
    拼音库码(261) = "Ri=-14123"
    拼音库码(262) = "Rong=-14122"
    拼音库码(263) = "Rou=-14112"
    拼音库码(264) = "Ru=-14109"
    拼音库码(265) = "Ruan=-14099"
    拼音库码(266) = "Rui=-14097"
    拼音库码(267) = "Run=-14094"
    拼音库码(268) = "Ruo=-14092"

    拼音库码(269) = "Sa=-14090"
    拼音库码(270) = "Sai=-14087"
    拼音库码(271) = "San=-14083"
    拼音库码(272) = "Sang=-13917"
    拼音库码(273) = "Sao=-13914"
    拼音库码(274) = "Se=-13910"
    拼音库码(275) = "Sen=-13907"
    拼音库码(276) = "Seng=-13906"
    拼音库码(277) = "Sha=-13905"
    拼音库码(278) = "Shai=-13896"
    拼音库码(279) = "Shan=-13894"
    拼音库码(280) = "Shang=-13878"
    拼音库码(281) = "Shao=-13870"
    拼音库码(282) = "She=-13859"
    拼音库码(283) = "Shen=-13847"
    拼音库码(284) = "Sheng=-13831"
    拼音库码(285) = "Shi=-13658"
    拼音库码(286) = "Shou=-13611"
    拼音库码(287) = "Shu=-13601"
    拼音库码(288) = "Shua=-13406"
    拼音库码(289) = "Shuai=-13404"
    拼音库码(290) = "Shuan=-13400"
    拼音库码(291) = "Shuang=-13398"
    拼音库码(292) = "Shui=-13395"
    拼音库码(293) = "Shun=-13391"
    拼音库码(294) = "Shuo=-13387"
    拼音库码(295) = "Si=-13383"
    拼音库码(296) = "Song=-13367"
    拼音库码(297) = "Sou=-13359"
    拼音库码(298) = "Su=-13356"
    拼音库码(299) = "Suan=-13343"
    拼音库码(300) = "Sui=-13340"
    拼音库码(301) = "Sun=-13329"
    拼音库码(302) = "Suo=-13326"

    拼音库码(303) = "Ta=-13318"
    拼音库码(304) = "Tai=-13147"
    拼音库码(305) = "Tan=-13138"
    拼音库码(306) = "Tang=-13120"
    拼音库码(307) = "Tao=-13107"
    拼音库码(308) = "Te=-13096"
    拼音库码(309) = "Teng=-13095"
    拼音库码(310) = "Ti=-13091"
    拼音库码(311) = "Tian=-13076"
    拼音库码(312) = "Tiao=-13068"
    拼音库码(313) = "Tie=-13063"
    拼音库码(314) = "Ting=-13060"
    拼音库码(315) = "Tong=-12888"
    拼音库码(316) = "Tou=-12875"
    拼音库码(317) = "Tu=-12871"
    拼音库码(318) = "Tuan=-12860"
    拼音库码(319) = "Tui=-12858"
    拼音库码(320) = "Tun=-12852"
    拼音库码(321) = "Tuo=-12849"

    拼音库码(322) = "Wa=-12838"
    拼音库码(323) = "Wai=-12831"
    拼音库码(324) = "Wan=-12829"
    拼音库码(325) = "Wang=-12812"
    拼音库码(326) = "Wei=-12802"
    拼音库码(327) = "Wen=-12607"
    拼音库码(328) = "Weng=-12597"
    拼音库码(329) = "Wo=-12594"
    拼音库码(330) = "Wu=-12585"

    拼音库码(331) = "Xi=-12556"
    拼音库码(332) = "Xia=-12359"
    拼音库码(333) = "Xian=-12346"
    拼音库码(334) = "Xiang=-12320"
    拼音库码(335) = "Xiao=-12300"
    拼音库码(336) = "Xie=-12120"
    拼音库码(337) = "Xin=-12099"
    拼音库码(338) = "Xing=-12089"
    拼音库码(339) = "Xiong=-12074"
    拼音库码(340) = "Xiu=-12067"
    拼音库码(341) = "Xu=-12058"
    拼音库码(342) = "Xuan=-12039"
    拼音库码(343) = "Xue=-11867"
    拼音库码(344) = "Xun=-11861"

    拼音库码(345) = "Ya=-11847"
    拼音库码(346) = "Yan=-11831"
    拼音库码(347) = "Yang=-11798"
    拼音库码(348) = "Yao=-11781"
    拼音库码(349) = "Ye=-11604"
    拼音库码(350) = "Yi=-11589"
    拼音库码(351) = "Yin=-11536"
    拼音库码(352) = "Ying=-11358"
    拼音库码(353) = "Yo=-11340"
    拼音库码(354) = "Yong=-11339"
    拼音库码(355) = "You=-11324"
    拼音库码(356) = "Yu=-11303"
    拼音库码(357) = "Yuan=-11097"
    拼音库码(358) = "Yue=-11077"
    拼音库码(359) = "Yun=-11067"

    拼音库码(360) = "Za=-11055"
    拼音库码(361) = "Zai=-11052"
    拼音库码(362) = "Zan=-11045"
    拼音库码(363) = "Zang=-11041"
    拼音库码(364) = "Zao=-11038"
    拼音库码(365) = "Ze=-11024"
    拼音库码(366) = "Zei=-11020"
    拼音库码(367) = "Zen=-11019"
    拼音库码(368) = "Zeng=-11018"
    拼音库码(369) = "Zha=-11014"
    拼音库码(370) = "Zhai=-10838"
    拼音库码(371) = "Zhan=-10832"
    拼音库码(372) = "Zhang=-10815"
    拼音库码(373) = "Zhao=-10800"
    拼音库码(374) = "Zhe=-10790"
    拼音库码(375) = "Zhen=-10780"
    拼音库码(376) = "Zheng=-10764"
    拼音库码(377) = "Zhi=-10587"
    拼音库码(378) = "Zhong=-10544"
    拼音库码(379) = "Zhou=-10533"
    拼音库码(380) = "Zhu=-10519"
    拼音库码(381) = "Zhua=-10331"
    拼音库码(382) = "Zhuai=-10329"
    拼音库码(383) = "Zhuan=-10328"
    拼音库码(384) = "Zhuang=-10322"
    拼音库码(385) = "Zhui=-10315"
    拼音库码(386) = "Zhun=-10309"
    拼音库码(387) = "Zhuo=-10307"
    拼音库码(388) = "Zi=-10296"
    拼音库码(389) = "Zong=-10281"
    拼音库码(390) = "Zou=-10274"
    拼音库码(391) = "Zu=-10270"
    拼音库码(392) = "Zuan=-10262"
    拼音库码(393) = "Zui=-10260"
    拼音库码(394) = "Zun=-10256"
    拼音库码(395) = "Zuo=-10254"
    汉字拼音 = ""
    Dim i,汉字码,拼音
    For i = 1 To Len(中文汉字) 
        汉字码 = Asc(Mid(中文汉字, i, 1))
        If 汉字码 > 0 And 汉字码 < 160 Then
            //不在拼音范围内还原符号
            拼音 = Chr(汉字码)
        Else
            If 汉字码 < -20319 Or 汉字码 > -10247 Then
                //不在拼音范围内还原符号
                拼音 = Chr(汉字码)
            Else
                Dim 分割,n,汉字拼音
                For n = UBound(拼音库码) To 0 Step -1
                    分割 = Split(拼音库码(n), "=")
                    If CLng(分割(1)) <= 汉字码 Then Exit For
                Next
                拼音 = 分割(0)
            End If
        End If
        汉字拼音 = 汉字拼音 & 拼音
    Next
    中文汉字转拼音 = 汉字拼音
End Function
Function 随机字符串(位数)
    //例子：Msgbox lib.算法.随机字符串(16)
    Dim i,位置,字符串,字母
    字母="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
    字符串=""
    For i=0 To 位数 - 1
        Randomize
        位置 = Int((Len(字母) * Rnd) + 1)
        字符串 = 字符串 & Mid(字母,位置,1)
    Next
    随机字符串 = 字符串
End Function 
Function 随机数字串(位数)
    //例子：Msgbox lib.算法.随机数字串(16)
    Dim i,位置,数字,数字串
    数字="0123456789"
    数字串=""
    For i=0 To 位数 - 1
        Randomize
        位置 = Int((Len(数字) * Rnd) + 1)
        数字串 = 数字串 & Mid(数字,位置,1)
    Next
    随机数字串 = 数字串
End Function 
Function 随机取姓名()
    //例子：Msgbox lib.算法.随机取姓名()
    Dim a,b,c,nei,zhu
    Randomize
    a = CInt((102) * Rnd)
    b = CInt((85) * Rnd)
    c = CInt((59) * Rnd)
    nei = ""
    Select Case a
    Case 1
        zhu = "贾"
    Case 2
        zhu = "赵"
    Case 3
        zhu = "萧"
    Case 4
        zhu = "梁"
    Case 5
        zhu = "胡"
    Case 6
        zhu = "谢"
    Case 7
        zhu = "曹"
    Case 8
        zhu = "袁"
    Case 9
        zhu = "傅"
    Case 10
        zhu = "彭"
    Case 11
        zhu = "蒋"
    Case 12
        zhu = "蔡"
    Case 13
        zhu = "魏"
    Case 14
        zhu = "薛"
    Case 15
        zhu = "阎"
    Case 16
        zhu = "潘"
    Case 17
        zhu = "戴"
    Case 18
        zhu = "夏"
    Case 19
        zhu = "姜"
    Case 20
        zhu = "姚"
    Case 21
        zhu = "邹"
    Case 22
        zhu = "熊"
    Case 23
        zhu = "郝"
    Case 24
        zhu = "秦蒋"
    Case 25
        zhu = "邵"
    Case 26
        zhu = "侯"
    Case 27
        zhu = "段"
    Case 28
        zhu = "武"
    Case 29
        zhu = "赖"
    Case 30
        zhu = "龚"
    Case 31
        zhu = "奥"
    Case 32
        zhu = "夏侯"
    Case 33
        zhu = "诸葛"
    Case 34
        zhu = "上官"
    Case 35
        zhu = "欧阳"
    Case 36
        zhu = "尉迟"
    Case 37
        zhu = "公孙"
    Case 38
        zhu = "岳"
    Case 39
        zhu = "墨"
    Case 40
        zhu = "琴"
    Case 41
        zhu = "涂"
    Case 42
        zhu = "温"
    Case 43
        zhu = "匡"
    Case 44
        zhu = "余"
    Case 45
        zhu = "余"
    Case 46
        zhu = "温"
    Case 47
        zhu = "景"
    Case 48
        zhu = "庄"
    Case 49
        zhu = "庄"
    Case 50
        zhu = "燕"
    Case 51
        zhu = "司马"
    Case 52
        zhu = "景"
    Case 53
        zhu = "马"
    Case 54
        zhu = "伊"
    Case 55
        zhu = "樊"
    Case 56
        zhu = "朱"
    Case 57
        zhu = "冯"
    Case 58
        zhu = "雷"
    Case 59
        zhu = "范"
    Case 60
        zhu = "穆"
    Case 61
        zhu = "麒"
    Case 62
        zhu = "安"
    Case 63
        zhu = "布"
    Case 64
        zhu = "卜"
    Case 65
        zhu = "白"
    Case 66
        zhu = "拜"
    Case 67
        zhu = "鲍"
    Case 68
        zhu = "庹"
    Case 69
        zhu = "崔"
    Case 70
        zhu = "程"
    Case 71
        zhu = "晨"
    Case 72
        zhu = "迟"
    Case 73
        zhu = "常"
    Case 74
        zhu = "车"
    Case 75
        zhu = "翟"
    Case 76
        zhu = "窦"
    Case 77
        zhu = "狄"
    Case 78
        zhu = "费"
    Case 79
        zhu = "范"
    Case 80
        zhu = "郭"
    Case 81
        zhu = "葛"
    Case 82
        zhu = "恭"
    Case 83
        zhu = "霍"
    Case 84
        zhu = "孔"
    Case 85
        zhu = "柯"
    Case 86
        zhu = "骆"
    Case 87
        zhu = "苗"
    Case 88
        zhu = "孟"
    Case 89
        zhu = "潘"
    Case 90
        zhu = "乔"
    Case 91
        zhu = "屠"
    Case 92
        zhu = "邰"
    Case 93
        zhu = "谭"
    Case 94
        zhu = "巫"
    Case 95
        zhu = "翁"
    Case 96
        zhu = "徐"
    Case 97
        zhu = "肖"
    Case 98
        zhu = "萧"
    Case 99
        zhu = "夏"
    Case 100
        zhu = "袁"
    Case 101
        zhu = "章"
    Case 102
        zhu = "童"
    End Select
    nei = nei & zhu
    Select Case b
    Case 1
        zhu = "雷"
    Case 2
        zhu = "琳"
    Case 3
        zhu = "甜"
    Case 4
        zhu = "琪"
    Case 5
        zhu = "茂"
    Case 6
        zhu = "莆"
    Case 7
        zhu = "倩"
    Case 8
        zhu = "祥"
    Case 9
        zhu = "霞"
    Case 10
        zhu = "莠"
    Case 11
        zhu = "唇"
    Case 12
        zhu = "汝"
    Case 13
        zhu = "瑞"
    Case 14
        zhu = "妮"
    Case 15
        zhu = "莫"
    Case 16
        zhu = "终"
    Case 17
        zhu = "慧"
    Case 18
        zhu = "诗"
    Case 19
        zhu = "雯"
    Case 20
        zhu = "鸿"
    Case 21
        zhu = "乔"
    Case 22
        zhu = "雪"
    Case 23
        zhu = "君"
    Case 24
        zhu = "雅"
    Case 25
        zhu = "森"
    Case 26
        zhu = "沐"
    Case 27
        zhu = "淮"
    Case 28
        zhu = "莉"
    Case 29
        zhu = "淑"
    Case 30
        zhu = "申"
    Case 31
        zhu = "双"
    Case 32
        zhu = "霆"
    Case 33
        zhu = "媛"
    Case 34
        zhu = "熙"
    Case 35
        zhu = "彩"
    Case 36
        zhu = "明"
    Case 37
        zhu = "琪"
    Case 38
        zhu = "兴"
    Case 39
        zhu = "旺"
    Case 40
        zhu = "泉"
    Case 41
        zhu = "诚"
    Case 42
        zhu = "秋"
    Case 43
        zhu = "生"
    Case 44
        zhu = "骏"
    Case 45
        zhu = "晶"
    Case 46
        zhu = "然"
    Case 47
        zhu = "怡"
    Case 48
        zhu = "蓉"
    Case 49
        zhu = "淳"
    Case 50
        zhu = "宇"
    Case 51
        zhu = "玉"
    Case 52
        zhu = "志"
    Case 53
        zhu = "麻"
    Case 54
        zhu = "宏"
    Case 55
        zhu = "静"
    Case 56
        zhu = "萱"
    Case 57
        zhu = "楚"
    Case 58
        zhu = "茵"
    Case 59
        zhu = "迪"
    Case 60
        zhu = "卡"
    Case 61
        zhu = "辉"
    Case 62
        zhu = "苑"
    Case 63
        zhu = "博"
    Case 64
        zhu = "新"
    Case 65
        zhu = "豪"
    Case 66
        zhu = "炫"
    Case 67
        zhu = "翰"
    Case 68
        zhu = "豪"
    Case 69
        zhu = "睿"
    Case 70
        zhu = "渊"
    Case 71
        zhu = "昊"
    Case 72
        zhu = "宸"
    Case 73
        zhu = "博"
    Case 74
        zhu = "哲"
    Case 75
        zhu = "瀚"
    Case 76
        zhu = "幽"
    Case 77
        zhu = "桦"
    Case 78
        zhu = "逸"
    Case 79
        zhu = "智"
    Case 80
        zhu = "鑫"
    Case 81
        zhu = "鹏"
    Case 82
        zhu = "顾"
    Case 83
        zhu = "玮"
    Case 84
        zhu = "益"
    Case 85
        zhu = "轩"
    End Select
    nei = nei & zhu
    //第三个字
    Select Case c
    Case 1
        zhu = "敢"
    Case 2
        zhu = "款"
    Case 3
        zhu = "淦"
    Case 4
        zhu = "筐"
    Case 5
        zhu = "贵"
    Case 6
        zhu = "辜"
    Case 7
        zhu = "凯"
    Case 8
        zhu = "植"
    Case 9
        zhu = "奠"
    Case 10
        zhu = "捷"
    Case 11
        zhu = "掎"
    Case 12
        zhu = "探"
    Case 13
        zhu = "敦"
    Case 14
        zhu = "智"
    Case 15
        zhu = "棠"
    Case 16
        zhu = "淘"
    Case 17
        zhu = "淡"
    Case 18
        zhu = "焦"
    Case 19
        zhu = "荔"
    Case 20
        zhu = "轸"
    Case 21
        zhu = "迦"
    Case 22
        zhu = "钧"
    Case 23
        zhu = "婷"
    Case 24
        zhu = "喋"
    Case 25
        zhu = "塘"
    Case 26
        zhu = "塔"
    Case 27
        zhu = "暖"
    Case 28
        zhu = "楠"
    Case 29
        zhu = "幄"
    Case 30
        zhu = "涯"
    Case 31
        zhu = "焰"
    Case 32
        zhu = "雁"
    Case 33
        zhu = "雅"
    Case 34
        zhu = "雯"
    Case 35
        zhu = "喻"
    Case 36
        zhu = "婺"
    Case 37
        zhu = "琬"
    Case 38
        zhu = "博"
    Case 39
        zhu = "棉"
    Case 40
        zhu = "涵"
    Case 41
        zhu = "淼"
    Case 42
        zhu = "淮"
    Case 43
        zhu = "番"
    Case 44
        zhu = "徨"
    Case 45
        zhu = "惠"
    Case 46
        zhu = "斑"
    Case 47
        zhu = "酣"
    Case 48
        zhu = "邯"
    Case 49
        zhu = "媚"
    Case 50
        zhu = "彬"
    Case 51
        zhu = "棠"
    Case 52
        zhu = "磊"
    Case 53
        zhu = "宸"
    Case 54
        zhu = "瓿"
    Case 55
        zhu = "梅"
    Case 56
        zhu = "晴"
    Case 57
        zhu = "婷"
    Case 58
        zhu = "霞"
    Case 59
        zhu = "惠"
    End Select
    随机取姓名 = nei & zhu
End Function
Function 得到字符串中字母的数量(字符串)
    //例子：MsgBox lib.算法.得到字符串中字母的数量("[email=abc@#$%de]abc@#$%de[/email]")
    VBSBegin
        Function test_letters(str)
            Dim regEx, Matches
            Set regEx = New RegExp
            regEx.Pattern = "([a-z]{1})"
            regEx.IgnoreCase = true
            regEx.Global = True
            Set Matches = regEx.Execute(str)             
            test_letters = Matches.count
        End Function
    VBSEnd
    得到字符串中字母的数量 = test_letters(字符串)  
End Function  
Function 十六进制转十进制(十六进制字符串)
    //例子：Msgbox lib.算法.十六进制转十进制("FFFFFF")
    Dim D,H,i,Ia
    D = 0
    H = UCase(十六进制字符串)
    For i = 1 To Len(H)
        Ia = Asc(Mid(H, i, 1)) - 48
        If Ia > 9 Then Ia = Ia - 7
        D = D * 16 + Ia
    Next
    十六进制转十进制 = D
End Function
Sub 乘法表生成器()
    //例子：Call lib.算法.乘法表生成器()
    Dim c,d 
    Dim str,s
    For c = 1 To 9 
        For d = 1 To c
            s = d & "×" & c & "=" & c * d 
            s = s & Space(6-len(s))
            str = str & s & " " 
        Next 
        str = str & vbCrlf  
    Next
    MsgBox str,0,"乘法表生成器" 
End Sub 
Function 洗牌(字符串内容)
    //说明：可以打乱一句内容顺序
    //例子：MsgBox lib.算法.洗牌("123啊456")
    Dim 结果,数量,i, j, temp
    数量=Len(字符串内容)
    ReDim tt(数量)
    结果 = ""
    For i = 1 To 数量 
        tt(i) = Mid(字符串内容,i,1)
    Next
    Randomize
    For j = 1 To 数量
        i = Int(数量 * Rnd + 1)
        temp=tt(i)        
        tt(i)=tt(j)
        tt(j)=temp 
    Next
    洗牌 = Join(tt,"")
End Function
Function 判断是否在一条直线上(起点x坐标,起点y坐标,终点x坐标,终点y坐标,判断点x坐标,判断点y坐标)
    //例子：MsgBox CBool(lib.算法.判断是否在一条直线上(0,3,2,5,4,7))
    //计算公式：y=k*x+b 
    Dim k,b,y   
    判断是否在一条直线上=False
    //判断除数是否为0
    If 终点x坐标 - 起点x坐标 = 0 then 
        判断是否在一条直线上=True
        Exit Function 
    End If
    k = abs(终点y坐标-起点y坐标) / abs(终点x坐标-起点x坐标)
    b = 起点y坐标 - k * 起点x坐标
    y = k * 判断点x坐标 + b
    //因会计算出小数点，所以加范围判断
    If y>判断点y坐标-1 and y<判断点y坐标+1 Then
        判断是否在一条直线上=True
    End If
End Function
Function 角度计算(中心点x坐标,中心点y坐标,移动点x坐标,移动点y坐标)
    //例子：MsgBox lib.算法.角度计算(0,0,10,10)
    //上为0°，右为90°，下为180°，左为270°
    Dim x,y,a,b
    If 移动点x坐标=中心点x坐标 Then
        If 移动点y坐标>中心点y坐标 Then
            //↑
            角度计算 = 0
        Else
            //↓
            角度计算 = 180
        End If
    ElseIf 移动点y坐标=中心点y坐标 Then
        If 移动点x坐标>中心点x坐标 Then
            //→
            角度计算 = 90
        Else
            //←
            角度计算 = 270
        End If
    Else
        If 移动点x坐标>中心点x坐标 and 移动点y坐标>中心点y坐标 Then
            //↘
            b = 90
        ElseIf 移动点x坐标>中心点x坐标 and 移动点y坐标<中心点y坐标 Then
            //↗
            b = 0
        ElseIf 移动点x坐标<中心点x坐标 and 移动点y坐标<中心点y坐标 Then
            //↖
            b = 270
        ElseIf 移动点x坐标<中心点x坐标 and 移动点y坐标>中心点y坐标 Then
            //↙
            b = 180
        End If
        x = abs(移动点y坐标 - 中心点y坐标)
        y = abs(移动点x坐标 - 中心点x坐标)
        If x>0 Then
            //1弧度约为57.3
            a = Atn(y / x)
            角度计算 = fix(a * 57.3) + b
            //角度计算 = fix(a/(3.14159265/180))
        End If
    End If
End Function


//制作：一只鱼
//日期：2009.12.22
//修改：2010.11.16




