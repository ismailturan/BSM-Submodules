! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.12.2 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 17:31 on 25.10.2017   
! ----------------------------------------------------------------------  
 
 
Module CouplingsForDecays_THDMIIIHB
 
Use Control 
Use Settings 
Use Model_Data_THDMIIIHB 
Use Couplings_THDMIIIHB 
Use LoopCouplings_THDMIIIHB 
Use Tadpoles_THDMIIIHB 
 Use TreeLevelMasses_THDMIIIHB 
Use Mathematics, Only: CompareMatrices, Adjungate 
 
Use StandardModel 
Contains 
 
 
 
Subroutine CouplingsFor_Fu_decays_2B(m_in,i1,MAhinput,MAh2input,MFdinput,             & 
& MFd2input,MFeinput,MFe2input,MFuinput,MFu2input,Mhhinput,Mhh2input,MHminput,           & 
& MHm2input,Msigma1input,Msigma12input,MVWminput,MVWm2input,MVZinput,MVZ2input,          & 
& TWinput,ZDRinput,ZERinput,ZURinput,ZDLinput,ZELinput,ZULinput,ZHinput,ZPinput,         & 
& ZWinput,ZZinput,alphaHinput,g1input,g2input,g3input,Lam6input,Lam5input,               & 
& Lam7input,Lam1input,Lam4input,Lam3input,Lam2input,epYUinput,Yuinput,Ydinput,           & 
& Yeinput,epYDinput,epYEinput,M12input,M112input,M222input,vinput,v2input,               & 
& cplcFuFuAhL,cplcFuFuAhR,cplcFuFdcHmL,cplcFuFdcHmR,cplcFuFdcVWmL,cplcFuFdcVWmR,         & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,vinput,v2input

Complex(dp),Intent(in) :: Lam6input,Lam5input,Lam7input,Lam1input,Lam4input,Lam3input,Lam2input,epYUinput(3,3), & 
& Yuinput(3,3),Ydinput(3,3),Yeinput(3,3),epYDinput(3,3),epYEinput(3,3),M12input,         & 
& M112input,M222input

Real(dp),Intent(in) :: MAhinput,MAh2input,MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),MFuinput(3),     & 
& MFu2input(3),Mhhinput(2),Mhh2input(2),MHminput(2),MHm2input(2),Msigma1input,           & 
& Msigma12input,MVWminput,MVWm2input,MVZinput,MVZ2input,TWinput,ZHinput(2,2),            & 
& ZPinput(2,2),ZZinput(2,2),alphaHinput

Complex(dp),Intent(in) :: ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),ZELinput(3,3),ZULinput(3,3),  & 
& ZWinput(2,2)

Real(dp) :: g1,g2,g3,v,v2

Complex(dp) :: Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,epYU(3,3),Yu(3,3),Yd(3,3),Ye(3,3),epYD(3,3),       & 
& epYE(3,3),M12,M112,M222

Complex(dp),Intent(out) :: cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),cplcFuFdcHmL(3,3,2),cplcFuFdcHmR(3,3,2),            & 
& cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),           & 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh,MAh2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),Mhh(2),Mhh2(2),MHm(2),          & 
& MHm2(2),Msigma1,Msigma12,MVWm,MVWm2,MVZ,MVZ2,TW,ZH(2,2),ZP(2,2),ZZ(2,2),alphaH

Complex(dp) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Fu_2B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
Lam6 = Lam6input 
Lam5 = Lam5input 
Lam7 = Lam7input 
Lam1 = Lam1input 
Lam4 = Lam4input 
Lam3 = Lam3input 
Lam2 = Lam2input 
epYU = epYUinput 
Yu = Yuinput 
Yd = Ydinput 
Ye = Yeinput 
epYD = epYDinput 
epYE = epYEinput 
M12 = M12input 
M112 = M112input 
M222 = M222input 
v = vinput 
v2 = v2input 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(g1,g2,g3,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,               & 
& epYU,Yu,Yd,Ye,epYD,epYE,M12,M112,M222,v,v2,(/ ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHm,MHm2,Msigma1,        & 
& Msigma12,MVWm,MVWm2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,ZH,ZP,ZW,ZZ,alphaH,            & 
& v,v2,g1,g2,g3,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,epYU,Yu,Yd,Ye,epYD,epYE,              & 
& M12,M112,M222,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
ZH = ZHinput 
ZP = ZPinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHm = MHminput 
MHm2 = MHm2input 
Msigma1 = Msigma1input 
Msigma12 = Msigma12input 
MVWm = MVWminput 
MVWm2 = MVWm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
End if 
cplcFuFuAhL = 0._dp 
cplcFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuAhT(gt1,gt2,Yu,ZUL,ZUR,cplcFuFuAhL(gt1,gt2),cplcFuFuAhR(gt1,gt2))

 End Do 
End Do 


cplcFuFdcHmL = 0._dp 
cplcFuFdcHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFdcHmT(gt1,gt2,gt3,epYU,Yu,Yd,epYD,ZP,ZDL,ZDR,ZUL,ZUR,cplcFuFdcHmL(gt1,gt2,gt3)& 
& ,cplcFuFdcHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFuhhT(gt1,gt2,gt3,epYU,Yu,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)         & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFdcVWmL = 0._dp 
cplcFuFdcVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdcVWmT(gt1,gt2,g2,ZDL,ZUL,cplcFuFdcVWmL(gt1,gt2),cplcFuFdcVWmR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZT(gt1,gt2,g1,g2,TW,cplcFuFuVZL(gt1,gt2),cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Fu_decays_2B
 
Subroutine CouplingsFor_Fe_decays_2B(m_in,i1,MAhinput,MAh2input,MFdinput,             & 
& MFd2input,MFeinput,MFe2input,MFuinput,MFu2input,Mhhinput,Mhh2input,MHminput,           & 
& MHm2input,Msigma1input,Msigma12input,MVWminput,MVWm2input,MVZinput,MVZ2input,          & 
& TWinput,ZDRinput,ZERinput,ZURinput,ZDLinput,ZELinput,ZULinput,ZHinput,ZPinput,         & 
& ZWinput,ZZinput,alphaHinput,g1input,g2input,g3input,Lam6input,Lam5input,               & 
& Lam7input,Lam1input,Lam4input,Lam3input,Lam2input,epYUinput,Yuinput,Ydinput,           & 
& Yeinput,epYDinput,epYEinput,M12input,M112input,M222input,vinput,v2input,               & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFeFvHmL,cplcFeFvHmR,cplcFeFvVWmL,cplcFeFvVWmR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,vinput,v2input

Complex(dp),Intent(in) :: Lam6input,Lam5input,Lam7input,Lam1input,Lam4input,Lam3input,Lam2input,epYUinput(3,3), & 
& Yuinput(3,3),Ydinput(3,3),Yeinput(3,3),epYDinput(3,3),epYEinput(3,3),M12input,         & 
& M112input,M222input

Real(dp),Intent(in) :: MAhinput,MAh2input,MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),MFuinput(3),     & 
& MFu2input(3),Mhhinput(2),Mhh2input(2),MHminput(2),MHm2input(2),Msigma1input,           & 
& Msigma12input,MVWminput,MVWm2input,MVZinput,MVZ2input,TWinput,ZHinput(2,2),            & 
& ZPinput(2,2),ZZinput(2,2),alphaHinput

Complex(dp),Intent(in) :: ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),ZELinput(3,3),ZULinput(3,3),  & 
& ZWinput(2,2)

Real(dp) :: g1,g2,g3,v,v2

Complex(dp) :: Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,epYU(3,3),Yu(3,3),Yd(3,3),Ye(3,3),epYD(3,3),       & 
& epYE(3,3),M12,M112,M222

Complex(dp),Intent(out) :: cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),              & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFvHmL(3,3,2),cplcFeFvHmR(3,3,2),               & 
& cplcFeFvVWmL(3,3),cplcFeFvVWmR(3,3)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh,MAh2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),Mhh(2),Mhh2(2),MHm(2),          & 
& MHm2(2),Msigma1,Msigma12,MVWm,MVWm2,MVZ,MVZ2,TW,ZH(2,2),ZP(2,2),ZZ(2,2),alphaH

Complex(dp) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Fe_2B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
Lam6 = Lam6input 
Lam5 = Lam5input 
Lam7 = Lam7input 
Lam1 = Lam1input 
Lam4 = Lam4input 
Lam3 = Lam3input 
Lam2 = Lam2input 
epYU = epYUinput 
Yu = Yuinput 
Yd = Ydinput 
Ye = Yeinput 
epYD = epYDinput 
epYE = epYEinput 
M12 = M12input 
M112 = M112input 
M222 = M222input 
v = vinput 
v2 = v2input 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(g1,g2,g3,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,               & 
& epYU,Yu,Yd,Ye,epYD,epYE,M12,M112,M222,v,v2,(/ ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHm,MHm2,Msigma1,        & 
& Msigma12,MVWm,MVWm2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,ZH,ZP,ZW,ZZ,alphaH,            & 
& v,v2,g1,g2,g3,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,epYU,Yu,Yd,Ye,epYD,epYE,              & 
& M12,M112,M222,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
ZH = ZHinput 
ZP = ZPinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHm = MHminput 
MHm2 = MHm2input 
Msigma1 = Msigma1input 
Msigma12 = Msigma12input 
MVWm = MVWminput 
MVWm2 = MVWm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
End if 
cplcFeFeAhL = 0._dp 
cplcFeFeAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeAhT(gt1,gt2,epYE,ZEL,ZER,cplcFeFeAhL(gt1,gt2),cplcFeFeAhR(gt1,gt2))

 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFeFehhT(gt1,gt2,gt3,Ye,epYE,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)         & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFvHmL = 0._dp 
cplcFeFvHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFeFvHmT(gt1,gt2,gt3,Ye,epYE,ZP,ZER,cplcFeFvHmL(gt1,gt2,gt3)             & 
& ,cplcFeFvHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZT(gt1,gt2,g1,g2,TW,cplcFeFeVZL(gt1,gt2),cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFeFvVWmL = 0._dp 
cplcFeFvVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFvVWmT(gt1,gt2,g2,ZEL,cplcFeFvVWmL(gt1,gt2),cplcFeFvVWmR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Fe_decays_2B
 
Subroutine CouplingsFor_Fd_decays_2B(m_in,i1,MAhinput,MAh2input,MFdinput,             & 
& MFd2input,MFeinput,MFe2input,MFuinput,MFu2input,Mhhinput,Mhh2input,MHminput,           & 
& MHm2input,Msigma1input,Msigma12input,MVWminput,MVWm2input,MVZinput,MVZ2input,          & 
& TWinput,ZDRinput,ZERinput,ZURinput,ZDLinput,ZELinput,ZULinput,ZHinput,ZPinput,         & 
& ZWinput,ZZinput,alphaHinput,g1input,g2input,g3input,Lam6input,Lam5input,               & 
& Lam7input,Lam1input,Lam4input,Lam3input,Lam2input,epYUinput,Yuinput,Ydinput,           & 
& Yeinput,epYDinput,epYEinput,M12input,M112input,M222input,vinput,v2input,               & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFdFuHmL,cplcFdFuHmR,cplcFdFuVWmL,cplcFdFuVWmR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,vinput,v2input

Complex(dp),Intent(in) :: Lam6input,Lam5input,Lam7input,Lam1input,Lam4input,Lam3input,Lam2input,epYUinput(3,3), & 
& Yuinput(3,3),Ydinput(3,3),Yeinput(3,3),epYDinput(3,3),epYEinput(3,3),M12input,         & 
& M112input,M222input

Real(dp),Intent(in) :: MAhinput,MAh2input,MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),MFuinput(3),     & 
& MFu2input(3),Mhhinput(2),Mhh2input(2),MHminput(2),MHm2input(2),Msigma1input,           & 
& Msigma12input,MVWminput,MVWm2input,MVZinput,MVZ2input,TWinput,ZHinput(2,2),            & 
& ZPinput(2,2),ZZinput(2,2),alphaHinput

Complex(dp),Intent(in) :: ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),ZELinput(3,3),ZULinput(3,3),  & 
& ZWinput(2,2)

Real(dp) :: g1,g2,g3,v,v2

Complex(dp) :: Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,epYU(3,3),Yu(3,3),Yd(3,3),Ye(3,3),epYD(3,3),       & 
& epYE(3,3),M12,M112,M222

Complex(dp),Intent(out) :: cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),              & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFdFuHmL(3,3,2),cplcFdFuHmR(3,3,2),               & 
& cplcFdFuVWmL(3,3),cplcFdFuVWmR(3,3)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh,MAh2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),Mhh(2),Mhh2(2),MHm(2),          & 
& MHm2(2),Msigma1,Msigma12,MVWm,MVWm2,MVZ,MVZ2,TW,ZH(2,2),ZP(2,2),ZZ(2,2),alphaH

Complex(dp) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Fd_2B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
Lam6 = Lam6input 
Lam5 = Lam5input 
Lam7 = Lam7input 
Lam1 = Lam1input 
Lam4 = Lam4input 
Lam3 = Lam3input 
Lam2 = Lam2input 
epYU = epYUinput 
Yu = Yuinput 
Yd = Ydinput 
Ye = Yeinput 
epYD = epYDinput 
epYE = epYEinput 
M12 = M12input 
M112 = M112input 
M222 = M222input 
v = vinput 
v2 = v2input 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(g1,g2,g3,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,               & 
& epYU,Yu,Yd,Ye,epYD,epYE,M12,M112,M222,v,v2,(/ ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHm,MHm2,Msigma1,        & 
& Msigma12,MVWm,MVWm2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,ZH,ZP,ZW,ZZ,alphaH,            & 
& v,v2,g1,g2,g3,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,epYU,Yu,Yd,Ye,epYD,epYE,              & 
& M12,M112,M222,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
ZH = ZHinput 
ZP = ZPinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHm = MHminput 
MHm2 = MHm2input 
Msigma1 = Msigma1input 
Msigma12 = Msigma12input 
MVWm = MVWminput 
MVWm2 = MVWm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
End if 
cplcFdFdAhL = 0._dp 
cplcFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdAhT(gt1,gt2,epYD,ZDL,ZDR,cplcFdFdAhL(gt1,gt2),cplcFdFdAhR(gt1,gt2))

 End Do 
End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFdFdhhT(gt1,gt2,gt3,Yd,epYD,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)         & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFuHmL = 0._dp 
cplcFdFuHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFdFuHmT(gt1,gt2,gt3,epYU,Yu,Yd,epYD,ZP,ZDL,ZDR,ZUL,ZUR,cplcFdFuHmL(gt1,gt2,gt3)& 
& ,cplcFdFuHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZT(gt1,gt2,g1,g2,TW,cplcFdFdVZL(gt1,gt2),cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFdFuVWmL = 0._dp 
cplcFdFuVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFuVWmT(gt1,gt2,g2,ZDL,ZUL,cplcFdFuVWmL(gt1,gt2),cplcFdFuVWmR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Fd_decays_2B
 
Subroutine CouplingsFor_hh_decays_2B(m_in,i1,MAhinput,MAh2input,MFdinput,             & 
& MFd2input,MFeinput,MFe2input,MFuinput,MFu2input,Mhhinput,Mhh2input,MHminput,           & 
& MHm2input,Msigma1input,Msigma12input,MVWminput,MVWm2input,MVZinput,MVZ2input,          & 
& TWinput,ZDRinput,ZERinput,ZURinput,ZDLinput,ZELinput,ZULinput,ZHinput,ZPinput,         & 
& ZWinput,ZZinput,alphaHinput,g1input,g2input,g3input,Lam6input,Lam5input,               & 
& Lam7input,Lam1input,Lam4input,Lam3input,Lam2input,epYUinput,Yuinput,Ydinput,           & 
& Yeinput,epYDinput,epYEinput,M12input,M112input,M222input,vinput,v2input,               & 
& cplHiggsPP,cplHiggsGG,cplHiggsZZvirt,cplHiggsWWvirt,cplAhAhhh,cplAhhhhh,               & 
& cplAhhhVZ,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,     & 
& cplhhhhhh,cplhhHmcHm,cplhhHmcVWm,cplhhcVWmVWm,cplhhVZVZ,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,vinput,v2input

Complex(dp),Intent(in) :: Lam6input,Lam5input,Lam7input,Lam1input,Lam4input,Lam3input,Lam2input,epYUinput(3,3), & 
& Yuinput(3,3),Ydinput(3,3),Yeinput(3,3),epYDinput(3,3),epYEinput(3,3),M12input,         & 
& M112input,M222input

Real(dp),Intent(in) :: MAhinput,MAh2input,MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),MFuinput(3),     & 
& MFu2input(3),Mhhinput(2),Mhh2input(2),MHminput(2),MHm2input(2),Msigma1input,           & 
& Msigma12input,MVWminput,MVWm2input,MVZinput,MVZ2input,TWinput,ZHinput(2,2),            & 
& ZPinput(2,2),ZZinput(2,2),alphaHinput

Complex(dp),Intent(in) :: ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),ZELinput(3,3),ZULinput(3,3),  & 
& ZWinput(2,2)

Real(dp) :: g1,g2,g3,v,v2

Complex(dp) :: Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,epYU(3,3),Yu(3,3),Yd(3,3),Ye(3,3),epYD(3,3),       & 
& epYE(3,3),M12,M112,M222

Complex(dp),Intent(out) :: cplHiggsPP(2),cplHiggsGG(2),cplHiggsZZvirt(2),cplHiggsWWvirt(2),cplAhAhhh(2),         & 
& cplAhhhhh(2,2),cplAhhhVZ(2),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFeFehhL(3,3,2),  & 
& cplcFeFehhR(3,3,2),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplhhhhhh(2,2,2),             & 
& cplhhHmcHm(2,2,2),cplhhHmcVWm(2,2),cplhhcVWmVWm(2),cplhhVZVZ(2)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh,MAh2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),Mhh(2),Mhh2(2),MHm(2),          & 
& MHm2(2),Msigma1,Msigma12,MVWm,MVWm2,MVZ,MVZ2,TW,ZH(2,2),ZP(2,2),ZZ(2,2),alphaH

Complex(dp) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZW(2,2)

Complex(dp) :: ratFd(3),ratFe(3),ratFu(3),ratHm(2),ratVWm

Complex(dp) :: ratPFd(3),ratPFe(3),ratPFu(3),ratPHm(2),ratPVWm

Complex(dp) :: coup 
Real(dp) :: vev, gNLO, NLOqcd, NNLOqcd, NNNLOqcd, AlphaSQ, AlphaSQhlf 
Real(dp) :: g1SM,g2SM,g3SM,vSM
Complex(dp) ::YuSM(3,3),YdSM(3,3),YeSM(3,3)
Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_hh_2B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
Lam6 = Lam6input 
Lam5 = Lam5input 
Lam7 = Lam7input 
Lam1 = Lam1input 
Lam4 = Lam4input 
Lam3 = Lam3input 
Lam2 = Lam2input 
epYU = epYUinput 
Yu = Yuinput 
Yd = Ydinput 
Ye = Yeinput 
epYD = epYDinput 
epYE = epYEinput 
M12 = M12input 
M112 = M112input 
M222 = M222input 
v = vinput 
v2 = v2input 
Qin=sqrt(getRenormalizationScale()) 
! Run always SM gauge couplings if present 
  Qin=sqrt(getRenormalizationScale()) 
  Call RunSMohdm(m_in,deltaM,g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM) 
   ! SM pole masses needed for diphoton/digluon rate 
   ! But only top and W play a role. 
   vSM=1/Sqrt((G_F*Sqrt(2._dp))) ! On-Shell VEV needed for loop 
   YuSM(3,3)=sqrt(2._dp)*mf_u(3)/vSM  ! On-Shell top needed in loop 
   ! Other running values kept to get H->ff correct 
Call SetMatchingConditions(g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM,v,v2,g1,g2,              & 
& g3,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,epYU,Yu,Yd,Ye,epYD,epYE,M12,M112,M222,.False.)

! Run always SM gauge couplings if present 
! alphaS(mH/2) for NLO corrections to diphoton rate 
Call RunSMgauge(m_in/2._dp,deltaM, g1,g2,g3) 
AlphaSQhlf=g3**2/(4._dp*Pi) 
! alphaS(mH) for digluon rate 
Call RunSMgauge(m_in,deltaM, g1,g2,g3) 
AlphaSQ=g3**2/(4._dp*Pi) 
Call SolveTadpoleEquations(g1,g2,g3,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,               & 
& epYU,Yu,Yd,Ye,epYD,epYE,M12,M112,M222,v,v2,(/ ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHm,MHm2,Msigma1,        & 
& Msigma12,MVWm,MVWm2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,ZH,ZP,ZW,ZZ,alphaH,            & 
& v,v2,g1,g2,g3,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,epYU,Yu,Yd,Ye,epYD,epYE,              & 
& M12,M112,M222,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
ZH = ZHinput 
ZP = ZPinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
cplAhAhhh = 0._dp 
Do gt3 = 1, 2
Call CouplingAhAhhhT(gt3,Lam5,Lam7,Lam4,Lam3,Lam2,v,v2,ZH,cplAhAhhh(gt3))

End Do 


cplAhhhhh = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplingAhhhhhT(gt2,gt3,Lam6,Lam5,Lam7,v,v2,ZH,cplAhhhhh(gt2,gt3))

 End Do 
End Do 


cplhhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplinghhhhhhT(gt1,gt2,gt3,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,v,v2,             & 
& ZH,cplhhhhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhHmcHm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplinghhHmcHmT(gt1,gt2,gt3,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,v,               & 
& v2,ZH,ZP,cplhhHmcHm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhhhVZ = 0._dp 
Do gt2 = 1, 2
Call CouplingAhhhVZT(gt2,g1,g2,ZH,TW,cplAhhhVZ(gt2))

End Do 


cplhhHmcVWm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhHmcVWmT(gt1,gt2,g2,ZH,ZP,cplhhHmcVWm(gt1,gt2))

 End Do 
End Do 


cplhhcVWmVWm = 0._dp 
Do gt1 = 1, 2
Call CouplinghhcVWmVWmT(gt1,g2,v,v2,ZH,cplhhcVWmVWm(gt1))

End Do 


cplhhVZVZ = 0._dp 
Do gt1 = 1, 2
Call CouplinghhVZVZT(gt1,g1,g2,v,v2,ZH,TW,cplhhVZVZ(gt1))

End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFdFdhhT(gt1,gt2,gt3,Yd,epYD,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)         & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFeFehhT(gt1,gt2,gt3,Ye,epYE,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)         & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFuhhT(gt1,gt2,gt3,epYU,Yu,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)         & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


vev=1/Sqrt((G_F*Sqrt(2._dp)))
cplHiggsWWvirt = cplhhcVWmVWm/vev 
cplHiggsZZvirt = cplhhVZVZ*Sqrt(7._dp/12._dp-10._dp/9._dp*Sin(TW)**2+40._dp/27._dp*Sin(TW)**4)/vev 
 

!----------------------------------------------------
! Coupling ratios for HiggsBounds 
!----------------------------------------------------
 
rHB_S_VZ(i1) = Abs(-0.5_dp*cplhhVZVZ(i1)*vev/MVZ2) 
rHB_S_VWm(i1) = Abs(-0.5_dp*cplhhcVWmVWm(i1)*vev/MVWm2) 
Do i2=1, 3
rHB_S_S_Fd(i1,i2) = Abs((cplcFdFdhhL(i2,i2,i1)+cplcFdFdhhR(i2,i2,i1))*vev/(2._dp*MFd(i2))) 
rHB_S_P_Fd(i1,i2) = Abs((cplcFdFdhhL(i2,i2,i1)-cplcFdFdhhR(i2,i2,i1))*vev/(2._dp*MFd(i2))) 
End Do 
Do i2=1, 3
rHB_S_S_Fu(i1,i2) = Abs((cplcFuFuhhL(i2,i2,i1)+cplcFuFuhhR(i2,i2,i1))*vev/(2._dp*MFu(i2))) 
rHB_S_P_Fu(i1,i2) = Abs((cplcFuFuhhL(i2,i2,i1)-cplcFuFuhhR(i2,i2,i1))*vev/(2._dp*MFu(i2))) 
End Do 
Do i2=1, 3
rHB_S_S_Fe(i1,i2) = Abs((cplcFeFehhL(i2,i2,i1)+cplcFeFehhR(i2,i2,i1))*vev/(2._dp*MFe(i2))) 
rHB_S_P_Fe(i1,i2) = Abs((cplcFeFehhL(i2,i2,i1)-cplcFeFehhR(i2,i2,i1))*vev/(2._dp*MFe(i2))) 
End Do 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHm = MHminput 
MHm2 = MHm2input 
Msigma1 = Msigma1input 
Msigma12 = Msigma12input 
MVWm = MVWminput 
MVWm2 = MVWm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
End if 
!----------------------------------------------------
! Scalar Higgs coupling ratios 
!----------------------------------------------------
 
Do i2=1, 3
ratFd(i2) = cplcFdFdhhL(i2,i2,i1)*1._dp*vev/MFd(i2) 
End Do 
Do i2=1, 3
ratFe(i2) = cplcFeFehhL(i2,i2,i1)*1._dp*vev/MFe(i2) 
End Do 
Do i2=1, 3
ratFu(i2) = cplcFuFuhhL(i2,i2,i1)*1._dp*vev/MFu(i2) 
End Do 
Do i2=1, 2
ratHm(i2) = 0.5_dp*cplhhHmcHm(i1,i2,i2)*vev/MHm2(i2) 
End Do 
ratVWm = -0.5_dp*cplhhcVWmVWm(i1)*vev/MVWm2 
If (HigherOrderDiboson) Then 
  gNLO = Sqrt(AlphaSQhlf*4._dp*Pi) 
Else  
  gNLO = -1._dp 
End if 
Call CoupHiggsToPhoton(m_in,i1,ratFd,ratFe,ratFu,ratHm,ratVWm,MFd,MFe,MFu,            & 
& MHm,MVWm,gNLO,coup)

cplHiggsPP(i1) = coup*Alpha 
CoupHPP(i1) = coup 
Call CoupHiggsToPhotonSM(m_in,MFd,MFe,MFu,MHm,MVWm,gNLO,coup)

ratioPP(i1) = Abs(cplHiggsPP(i1)/(coup*Alpha)) 
  gNLO = -1._dp 
Call CoupHiggsToGluon(m_in,i1,ratFd,ratFu,MFd,MFu,gNLO,coup)

cplHiggsGG(i1) = coup*AlphaSQ 
CoupHGG(i1) = coup 
Call CoupHiggsToGluonSM(m_in,MFd,MFu,gNLO,coup)

If (HigherOrderDiboson) Then 
  NLOqcd = 12._dp*oo48pi2*(95._dp/4._dp - 7._dp/6._dp*NFlav(m_in))*g3**2 
  NNLOqcd = 0.0005785973353112832_dp*(410.52103034222284_dp - 52.326413200014684_dp*NFlav(m_in)+NFlav(m_in)**2 & 
 & +(2.6337085360233763_dp +0.7392866066030529_dp *NFlav(m_in))*Log(m_in**2/mf_u(3)**2))*g3**4 
  NNNLOqcd = 0.00017781840290519607_dp*(42.74607514668917_dp + 11.191050460173795_dp*Log(m_in**2/mf_u(3)**2) + Log(m_in**2/mf_u(3)**2)**2)*g3**6 
Else 
  NLOqcd = 0._dp 
  NNLOqcd = 0._dp 
  NNNLOqcd = 0._dp 
End if 
coup = coup*Sqrt(1._dp + NLOqcd+NNLOqcd+NNNLOqcd) 
cplHiggsGG(i1) = cplHiggsGG(i1)*Sqrt(1._dp + NLOqcd+NNLOqcd+NNNLOqcd) 
CoupHGG(i1)=cplHiggsGG(i1) 
ratioGG(i1) = Abs(cplHiggsGG(i1)/(coup*AlphaSQ)) 
If (i1.eq.1) Then 
CPL_A_H_Z = 0 
CPL_H_H_Z = 0._dp 
End if 
cplAhAhhh = 0._dp 
Do gt3 = 1, 2
Call CouplingAhAhhhT(gt3,Lam5,Lam7,Lam4,Lam3,Lam2,v,v2,ZH,cplAhAhhh(gt3))

End Do 


cplAhhhhh = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplingAhhhhhT(gt2,gt3,Lam6,Lam5,Lam7,v,v2,ZH,cplAhhhhh(gt2,gt3))

 End Do 
End Do 


cplhhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplinghhhhhhT(gt1,gt2,gt3,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,v,v2,             & 
& ZH,cplhhhhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhHmcHm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplinghhHmcHmT(gt1,gt2,gt3,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,v,               & 
& v2,ZH,ZP,cplhhHmcHm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhhhVZ = 0._dp 
Do gt2 = 1, 2
Call CouplingAhhhVZT(gt2,g1,g2,ZH,TW,cplAhhhVZ(gt2))

End Do 


cplhhHmcVWm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhHmcVWmT(gt1,gt2,g2,ZH,ZP,cplhhHmcVWm(gt1,gt2))

 End Do 
End Do 


cplhhcVWmVWm = 0._dp 
Do gt1 = 1, 2
Call CouplinghhcVWmVWmT(gt1,g2,v,v2,ZH,cplhhcVWmVWm(gt1))

End Do 


cplhhVZVZ = 0._dp 
Do gt1 = 1, 2
Call CouplinghhVZVZT(gt1,g1,g2,v,v2,ZH,TW,cplhhVZVZ(gt1))

End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFdFdhhT(gt1,gt2,gt3,Yd,epYD,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)         & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFeFehhT(gt1,gt2,gt3,Ye,epYE,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)         & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFuhhT(gt1,gt2,gt3,epYU,Yu,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)         & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_hh_decays_2B
 
Subroutine CouplingsFor_Ah_decays_2B(m_in,i1,MAhinput,MAh2input,MFdinput,             & 
& MFd2input,MFeinput,MFe2input,MFuinput,MFu2input,Mhhinput,Mhh2input,MHminput,           & 
& MHm2input,Msigma1input,Msigma12input,MVWminput,MVWm2input,MVZinput,MVZ2input,          & 
& TWinput,ZDRinput,ZERinput,ZURinput,ZDLinput,ZELinput,ZULinput,ZHinput,ZPinput,         & 
& ZWinput,ZZinput,alphaHinput,g1input,g2input,g3input,Lam6input,Lam5input,               & 
& Lam7input,Lam1input,Lam4input,Lam3input,Lam2input,epYUinput,Yuinput,Ydinput,           & 
& Yeinput,epYDinput,epYEinput,M12input,M112input,M222input,vinput,v2input,               & 
& cplAhAhAh,cplAhAhhh,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,       & 
& cplcFuFuAhR,cplAhhhhh,cplAhhhVZ,cplAhHmcHm,cplAhHmcVWm,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,vinput,v2input

Complex(dp),Intent(in) :: Lam6input,Lam5input,Lam7input,Lam1input,Lam4input,Lam3input,Lam2input,epYUinput(3,3), & 
& Yuinput(3,3),Ydinput(3,3),Yeinput(3,3),epYDinput(3,3),epYEinput(3,3),M12input,         & 
& M112input,M222input

Real(dp),Intent(in) :: MAhinput,MAh2input,MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),MFuinput(3),     & 
& MFu2input(3),Mhhinput(2),Mhh2input(2),MHminput(2),MHm2input(2),Msigma1input,           & 
& Msigma12input,MVWminput,MVWm2input,MVZinput,MVZ2input,TWinput,ZHinput(2,2),            & 
& ZPinput(2,2),ZZinput(2,2),alphaHinput

Complex(dp),Intent(in) :: ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),ZELinput(3,3),ZULinput(3,3),  & 
& ZWinput(2,2)

Real(dp) :: g1,g2,g3,v,v2

Complex(dp) :: Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,epYU(3,3),Yu(3,3),Yd(3,3),Ye(3,3),epYD(3,3),       & 
& epYE(3,3),M12,M112,M222

Complex(dp),Intent(out) :: cplAhAhAh,cplAhAhhh(2),cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplcFeFeAhL(3,3),            & 
& cplcFeFeAhR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),cplAhhhhh(2,2),cplAhhhVZ(2),        & 
& cplAhHmcHm(2,2),cplAhHmcVWm(2)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh,MAh2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),Mhh(2),Mhh2(2),MHm(2),          & 
& MHm2(2),Msigma1,Msigma12,MVWm,MVWm2,MVZ,MVZ2,TW,ZH(2,2),ZP(2,2),ZZ(2,2),alphaH

Complex(dp) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Ah_2B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
Lam6 = Lam6input 
Lam5 = Lam5input 
Lam7 = Lam7input 
Lam1 = Lam1input 
Lam4 = Lam4input 
Lam3 = Lam3input 
Lam2 = Lam2input 
epYU = epYUinput 
Yu = Yuinput 
Yd = Ydinput 
Ye = Yeinput 
epYD = epYDinput 
epYE = epYEinput 
M12 = M12input 
M112 = M112input 
M222 = M222input 
v = vinput 
v2 = v2input 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(g1,g2,g3,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,               & 
& epYU,Yu,Yd,Ye,epYD,epYE,M12,M112,M222,v,v2,(/ ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHm,MHm2,Msigma1,        & 
& Msigma12,MVWm,MVWm2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,ZH,ZP,ZW,ZZ,alphaH,            & 
& v,v2,g1,g2,g3,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,epYU,Yu,Yd,Ye,epYD,epYE,              & 
& M12,M112,M222,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
ZH = ZHinput 
ZP = ZPinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHm = MHminput 
MHm2 = MHm2input 
Msigma1 = Msigma1input 
Msigma12 = Msigma12input 
MVWm = MVWminput 
MVWm2 = MVWm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
End if 
cplAhAhAh = 0._dp 
Call CouplingAhAhAhT(Lam7,v,cplAhAhAh)



cplAhAhhh = 0._dp 
Do gt3 = 1, 2
Call CouplingAhAhhhT(gt3,Lam5,Lam7,Lam4,Lam3,Lam2,v,v2,ZH,cplAhAhhh(gt3))

End Do 


cplAhhhhh = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplingAhhhhhT(gt2,gt3,Lam6,Lam5,Lam7,v,v2,ZH,cplAhhhhh(gt2,gt3))

 End Do 
End Do 


cplAhHmcHm = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplingAhHmcHmT(gt2,gt3,Lam6,Lam5,Lam7,Lam4,v,ZP,cplAhHmcHm(gt2,gt3))

 End Do 
End Do 


cplAhhhVZ = 0._dp 
Do gt2 = 1, 2
Call CouplingAhhhVZT(gt2,g1,g2,ZH,TW,cplAhhhVZ(gt2))

End Do 


cplAhHmcVWm = 0._dp 
Do gt2 = 1, 2
Call CouplingAhHmcVWmT(gt2,g2,ZP,cplAhHmcVWm(gt2))

End Do 


cplcFdFdAhL = 0._dp 
cplcFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdAhT(gt1,gt2,epYD,ZDL,ZDR,cplcFdFdAhL(gt1,gt2),cplcFdFdAhR(gt1,gt2))

 End Do 
End Do 


cplcFeFeAhL = 0._dp 
cplcFeFeAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeAhT(gt1,gt2,epYE,ZEL,ZER,cplcFeFeAhL(gt1,gt2),cplcFeFeAhR(gt1,gt2))

 End Do 
End Do 


cplcFuFuAhL = 0._dp 
cplcFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuAhT(gt1,gt2,Yu,ZUL,ZUR,cplcFuFuAhL(gt1,gt2),cplcFuFuAhR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Ah_decays_2B
 
Subroutine CouplingsFor_Hm_decays_2B(m_in,i1,MAhinput,MAh2input,MFdinput,             & 
& MFd2input,MFeinput,MFe2input,MFuinput,MFu2input,Mhhinput,Mhh2input,MHminput,           & 
& MHm2input,Msigma1input,Msigma12input,MVWminput,MVWm2input,MVZinput,MVZ2input,          & 
& TWinput,ZDRinput,ZERinput,ZURinput,ZDLinput,ZELinput,ZULinput,ZHinput,ZPinput,         & 
& ZWinput,ZZinput,alphaHinput,g1input,g2input,g3input,Lam6input,Lam5input,               & 
& Lam7input,Lam1input,Lam4input,Lam3input,Lam2input,epYUinput,Yuinput,Ydinput,           & 
& Yeinput,epYDinput,epYEinput,M12input,M112input,M222input,vinput,v2input,               & 
& cplAhHmcHm,cplAhcHmVWm,cplcFuFdcHmL,cplcFuFdcHmR,cplcFvFecHmL,cplcFvFecHmR,            & 
& cplhhHmcHm,cplhhcHmVWm,cplHmcHmVZ,cplcHmVWmVZ,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,vinput,v2input

Complex(dp),Intent(in) :: Lam6input,Lam5input,Lam7input,Lam1input,Lam4input,Lam3input,Lam2input,epYUinput(3,3), & 
& Yuinput(3,3),Ydinput(3,3),Yeinput(3,3),epYDinput(3,3),epYEinput(3,3),M12input,         & 
& M112input,M222input

Real(dp),Intent(in) :: MAhinput,MAh2input,MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),MFuinput(3),     & 
& MFu2input(3),Mhhinput(2),Mhh2input(2),MHminput(2),MHm2input(2),Msigma1input,           & 
& Msigma12input,MVWminput,MVWm2input,MVZinput,MVZ2input,TWinput,ZHinput(2,2),            & 
& ZPinput(2,2),ZZinput(2,2),alphaHinput

Complex(dp),Intent(in) :: ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),ZELinput(3,3),ZULinput(3,3),  & 
& ZWinput(2,2)

Real(dp) :: g1,g2,g3,v,v2

Complex(dp) :: Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,epYU(3,3),Yu(3,3),Yd(3,3),Ye(3,3),epYD(3,3),       & 
& epYE(3,3),M12,M112,M222

Complex(dp),Intent(out) :: cplAhHmcHm(2,2),cplAhcHmVWm(2),cplcFuFdcHmL(3,3,2),cplcFuFdcHmR(3,3,2),               & 
& cplcFvFecHmL(3,3,2),cplcFvFecHmR(3,3,2),cplhhHmcHm(2,2,2),cplhhcHmVWm(2,2),            & 
& cplHmcHmVZ(2,2),cplcHmVWmVZ(2)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh,MAh2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),Mhh(2),Mhh2(2),MHm(2),          & 
& MHm2(2),Msigma1,Msigma12,MVWm,MVWm2,MVZ,MVZ2,TW,ZH(2,2),ZP(2,2),ZZ(2,2),alphaH

Complex(dp) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Hm_2B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
Lam6 = Lam6input 
Lam5 = Lam5input 
Lam7 = Lam7input 
Lam1 = Lam1input 
Lam4 = Lam4input 
Lam3 = Lam3input 
Lam2 = Lam2input 
epYU = epYUinput 
Yu = Yuinput 
Yd = Ydinput 
Ye = Yeinput 
epYD = epYDinput 
epYE = epYEinput 
M12 = M12input 
M112 = M112input 
M222 = M222input 
v = vinput 
v2 = v2input 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(g1,g2,g3,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,               & 
& epYU,Yu,Yd,Ye,epYD,epYE,M12,M112,M222,v,v2,(/ ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHm,MHm2,Msigma1,        & 
& Msigma12,MVWm,MVWm2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,ZH,ZP,ZW,ZZ,alphaH,            & 
& v,v2,g1,g2,g3,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,epYU,Yu,Yd,Ye,epYD,epYE,              & 
& M12,M112,M222,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
ZH = ZHinput 
ZP = ZPinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHm = MHminput 
MHm2 = MHm2input 
Msigma1 = Msigma1input 
Msigma12 = Msigma12input 
MVWm = MVWminput 
MVWm2 = MVWm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
End if 
cplAhHmcHm = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplingAhHmcHmT(gt2,gt3,Lam6,Lam5,Lam7,Lam4,v,ZP,cplAhHmcHm(gt2,gt3))

 End Do 
End Do 


cplhhHmcHm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplinghhHmcHmT(gt1,gt2,gt3,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,v,               & 
& v2,ZH,ZP,cplhhHmcHm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhcHmVWm = 0._dp 
Do gt2 = 1, 2
Call CouplingAhcHmVWmT(gt2,g2,ZP,cplAhcHmVWm(gt2))

End Do 


cplhhcHmVWm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhcHmVWmT(gt1,gt2,g2,ZH,ZP,cplhhcHmVWm(gt1,gt2))

 End Do 
End Do 


cplHmcHmVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingHmcHmVZT(gt1,gt2,g1,g2,ZP,TW,cplHmcHmVZ(gt1,gt2))

 End Do 
End Do 


cplcHmVWmVZ = 0._dp 
Do gt1 = 1, 2
Call CouplingcHmVWmVZT(gt1,g1,g2,v,v2,ZP,TW,cplcHmVWmVZ(gt1))

End Do 


cplcFuFdcHmL = 0._dp 
cplcFuFdcHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFdcHmT(gt1,gt2,gt3,epYU,Yu,Yd,epYD,ZP,ZDL,ZDR,ZUL,ZUR,cplcFuFdcHmL(gt1,gt2,gt3)& 
& ,cplcFuFdcHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFvFecHmL = 0._dp 
cplcFvFecHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFvFecHmT(gt1,gt2,gt3,Ye,epYE,ZP,ZER,cplcFvFecHmL(gt1,gt2,gt3)           & 
& ,cplcFvFecHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Hm_decays_2B
 
Subroutine CouplingsFor_Fu_decays_3B(m_in,i1,MAhinput,MAh2input,MFdinput,             & 
& MFd2input,MFeinput,MFe2input,MFuinput,MFu2input,Mhhinput,Mhh2input,MHminput,           & 
& MHm2input,Msigma1input,Msigma12input,MVWminput,MVWm2input,MVZinput,MVZ2input,          & 
& TWinput,ZDRinput,ZERinput,ZURinput,ZDLinput,ZELinput,ZULinput,ZHinput,ZPinput,         & 
& ZWinput,ZZinput,alphaHinput,g1input,g2input,g3input,Lam6input,Lam5input,               & 
& Lam7input,Lam1input,Lam4input,Lam3input,Lam2input,epYUinput,Yuinput,Ydinput,           & 
& Yeinput,epYDinput,epYEinput,M12input,M112input,M222input,vinput,v2input,               & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFdFuHmL,cplcFdFuHmR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFeFeAhL,cplcFeFeAhR,             & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvHmL,cplcFeFvHmR,               & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplcFuFdcHmL,cplcFuFdcHmR,cplcFuFdcVWmL,cplcFuFdcVWmR,       & 
& cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcFvFvVZL,cplcFvFvVZR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,vinput,v2input

Complex(dp),Intent(in) :: Lam6input,Lam5input,Lam7input,Lam1input,Lam4input,Lam3input,Lam2input,epYUinput(3,3), & 
& Yuinput(3,3),Ydinput(3,3),Yeinput(3,3),epYDinput(3,3),epYEinput(3,3),M12input,         & 
& M112input,M222input

Real(dp),Intent(in) :: MAhinput,MAh2input,MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),MFuinput(3),     & 
& MFu2input(3),Mhhinput(2),Mhh2input(2),MHminput(2),MHm2input(2),Msigma1input,           & 
& Msigma12input,MVWminput,MVWm2input,MVZinput,MVZ2input,TWinput,ZHinput(2,2),            & 
& ZPinput(2,2),ZZinput(2,2),alphaHinput

Complex(dp),Intent(in) :: ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),ZELinput(3,3),ZULinput(3,3),  & 
& ZWinput(2,2)

Real(dp) :: g1,g2,g3,v,v2

Complex(dp) :: Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,epYU(3,3),Yu(3,3),Yd(3,3),Ye(3,3),epYD(3,3),       & 
& epYE(3,3),M12,M112,M222

Complex(dp),Intent(out) :: cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),              & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFdFuHmL(3,3,2),cplcFdFuHmR(3,3,2),               & 
& cplcFdFuVWmL(3,3),cplcFdFuVWmR(3,3),cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFeFehhL(3,3,2),& 
& cplcFeFehhR(3,3,2),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFvHmL(3,3,2),               & 
& cplcFeFvHmR(3,3,2),cplcFeFvVWmL(3,3),cplcFeFvVWmR(3,3),cplcFuFdcHmL(3,3,2),            & 
& cplcFuFdcHmR(3,3,2),cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),cplcFuFuAhL(3,3),            & 
& cplcFuFuAhR(3,3),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFuFuVZL(3,3),               & 
& cplcFuFuVZR(3,3),cplcFvFvVZL(3,3),cplcFvFvVZR(3,3)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh,MAh2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),Mhh(2),Mhh2(2),MHm(2),          & 
& MHm2(2),Msigma1,Msigma12,MVWm,MVWm2,MVZ,MVZ2,TW,ZH(2,2),ZP(2,2),ZZ(2,2),alphaH

Complex(dp) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Fu_3B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
Lam6 = Lam6input 
Lam5 = Lam5input 
Lam7 = Lam7input 
Lam1 = Lam1input 
Lam4 = Lam4input 
Lam3 = Lam3input 
Lam2 = Lam2input 
epYU = epYUinput 
Yu = Yuinput 
Yd = Ydinput 
Ye = Yeinput 
epYD = epYDinput 
epYE = epYEinput 
M12 = M12input 
M112 = M112input 
M222 = M222input 
v = vinput 
v2 = v2input 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(g1,g2,g3,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,               & 
& epYU,Yu,Yd,Ye,epYD,epYE,M12,M112,M222,v,v2,(/ ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHm,MHm2,Msigma1,        & 
& Msigma12,MVWm,MVWm2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,ZH,ZP,ZW,ZZ,alphaH,            & 
& v,v2,g1,g2,g3,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,epYU,Yu,Yd,Ye,epYD,epYE,              & 
& M12,M112,M222,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
ZH = ZHinput 
ZP = ZPinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHm = MHminput 
MHm2 = MHm2input 
Msigma1 = Msigma1input 
Msigma12 = Msigma12input 
MVWm = MVWminput 
MVWm2 = MVWm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
End if 
cplcFdFdAhL = 0._dp 
cplcFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdAhT(gt1,gt2,epYD,ZDL,ZDR,cplcFdFdAhL(gt1,gt2),cplcFdFdAhR(gt1,gt2))

 End Do 
End Do 


cplcFeFeAhL = 0._dp 
cplcFeFeAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeAhT(gt1,gt2,epYE,ZEL,ZER,cplcFeFeAhL(gt1,gt2),cplcFeFeAhR(gt1,gt2))

 End Do 
End Do 


cplcFuFuAhL = 0._dp 
cplcFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuAhT(gt1,gt2,Yu,ZUL,ZUR,cplcFuFuAhL(gt1,gt2),cplcFuFuAhR(gt1,gt2))

 End Do 
End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFdFdhhT(gt1,gt2,gt3,Yd,epYD,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)         & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFdcHmL = 0._dp 
cplcFuFdcHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFdcHmT(gt1,gt2,gt3,epYU,Yu,Yd,epYD,ZP,ZDL,ZDR,ZUL,ZUR,cplcFuFdcHmL(gt1,gt2,gt3)& 
& ,cplcFuFdcHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFeFehhT(gt1,gt2,gt3,Ye,epYE,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)         & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFuhhT(gt1,gt2,gt3,epYU,Yu,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)         & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFuHmL = 0._dp 
cplcFdFuHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFdFuHmT(gt1,gt2,gt3,epYU,Yu,Yd,epYD,ZP,ZDL,ZDR,ZUL,ZUR,cplcFdFuHmL(gt1,gt2,gt3)& 
& ,cplcFdFuHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFvHmL = 0._dp 
cplcFeFvHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFeFvHmT(gt1,gt2,gt3,Ye,epYE,ZP,ZER,cplcFeFvHmL(gt1,gt2,gt3)             & 
& ,cplcFeFvHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZT(gt1,gt2,g1,g2,TW,cplcFdFdVZL(gt1,gt2),cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFdcVWmL = 0._dp 
cplcFuFdcVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdcVWmT(gt1,gt2,g2,ZDL,ZUL,cplcFuFdcVWmL(gt1,gt2),cplcFuFdcVWmR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZT(gt1,gt2,g1,g2,TW,cplcFeFeVZL(gt1,gt2),cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFdFuVWmL = 0._dp 
cplcFdFuVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFuVWmT(gt1,gt2,g2,ZDL,ZUL,cplcFdFuVWmL(gt1,gt2),cplcFdFuVWmR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZT(gt1,gt2,g1,g2,TW,cplcFuFuVZL(gt1,gt2),cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplcFeFvVWmL = 0._dp 
cplcFeFvVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFvVWmT(gt1,gt2,g2,ZEL,cplcFeFvVWmL(gt1,gt2),cplcFeFvVWmR(gt1,gt2))

 End Do 
End Do 


cplcFvFvVZL = 0._dp 
cplcFvFvVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFvFvVZT(gt1,gt2,g1,g2,TW,cplcFvFvVZL(gt1,gt2),cplcFvFvVZR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Fu_decays_3B
 
Subroutine CouplingsFor_Fe_decays_3B(m_in,i1,MAhinput,MAh2input,MFdinput,             & 
& MFd2input,MFeinput,MFe2input,MFuinput,MFu2input,Mhhinput,Mhh2input,MHminput,           & 
& MHm2input,Msigma1input,Msigma12input,MVWminput,MVWm2input,MVZinput,MVZ2input,          & 
& TWinput,ZDRinput,ZERinput,ZURinput,ZDLinput,ZELinput,ZULinput,ZHinput,ZPinput,         & 
& ZWinput,ZZinput,alphaHinput,g1input,g2input,g3input,Lam6input,Lam5input,               & 
& Lam7input,Lam1input,Lam4input,Lam3input,Lam2input,epYUinput,Yuinput,Ydinput,           & 
& Yeinput,epYDinput,epYEinput,M12input,M112input,M222input,vinput,v2input,               & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFeFvHmL,cplcFeFvHmR,cplcFeFvVWmL,cplcFeFvVWmR,cplcFuFdcHmL,cplcFuFdcHmR,           & 
& cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,           & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFvFecHmL,cplcFvFecHmR,cplcFvFecVWmL,cplcFvFecVWmR,         & 
& cplcFvFvVZL,cplcFvFvVZR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,vinput,v2input

Complex(dp),Intent(in) :: Lam6input,Lam5input,Lam7input,Lam1input,Lam4input,Lam3input,Lam2input,epYUinput(3,3), & 
& Yuinput(3,3),Ydinput(3,3),Yeinput(3,3),epYDinput(3,3),epYEinput(3,3),M12input,         & 
& M112input,M222input

Real(dp),Intent(in) :: MAhinput,MAh2input,MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),MFuinput(3),     & 
& MFu2input(3),Mhhinput(2),Mhh2input(2),MHminput(2),MHm2input(2),Msigma1input,           & 
& Msigma12input,MVWminput,MVWm2input,MVZinput,MVZ2input,TWinput,ZHinput(2,2),            & 
& ZPinput(2,2),ZZinput(2,2),alphaHinput

Complex(dp),Intent(in) :: ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),ZELinput(3,3),ZULinput(3,3),  & 
& ZWinput(2,2)

Real(dp) :: g1,g2,g3,v,v2

Complex(dp) :: Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,epYU(3,3),Yu(3,3),Yd(3,3),Ye(3,3),epYD(3,3),       & 
& epYE(3,3),M12,M112,M222

Complex(dp),Intent(out) :: cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),              & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFeFehhL(3,3,2),& 
& cplcFeFehhR(3,3,2),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFvHmL(3,3,2),               & 
& cplcFeFvHmR(3,3,2),cplcFeFvVWmL(3,3),cplcFeFvVWmR(3,3),cplcFuFdcHmL(3,3,2),            & 
& cplcFuFdcHmR(3,3,2),cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),cplcFuFuAhL(3,3),            & 
& cplcFuFuAhR(3,3),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFuFuVZL(3,3),               & 
& cplcFuFuVZR(3,3),cplcFvFecHmL(3,3,2),cplcFvFecHmR(3,3,2),cplcFvFecVWmL(3,3),           & 
& cplcFvFecVWmR(3,3),cplcFvFvVZL(3,3),cplcFvFvVZR(3,3)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh,MAh2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),Mhh(2),Mhh2(2),MHm(2),          & 
& MHm2(2),Msigma1,Msigma12,MVWm,MVWm2,MVZ,MVZ2,TW,ZH(2,2),ZP(2,2),ZZ(2,2),alphaH

Complex(dp) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Fe_3B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
Lam6 = Lam6input 
Lam5 = Lam5input 
Lam7 = Lam7input 
Lam1 = Lam1input 
Lam4 = Lam4input 
Lam3 = Lam3input 
Lam2 = Lam2input 
epYU = epYUinput 
Yu = Yuinput 
Yd = Ydinput 
Ye = Yeinput 
epYD = epYDinput 
epYE = epYEinput 
M12 = M12input 
M112 = M112input 
M222 = M222input 
v = vinput 
v2 = v2input 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(g1,g2,g3,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,               & 
& epYU,Yu,Yd,Ye,epYD,epYE,M12,M112,M222,v,v2,(/ ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHm,MHm2,Msigma1,        & 
& Msigma12,MVWm,MVWm2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,ZH,ZP,ZW,ZZ,alphaH,            & 
& v,v2,g1,g2,g3,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,epYU,Yu,Yd,Ye,epYD,epYE,              & 
& M12,M112,M222,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
ZH = ZHinput 
ZP = ZPinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHm = MHminput 
MHm2 = MHm2input 
Msigma1 = Msigma1input 
Msigma12 = Msigma12input 
MVWm = MVWminput 
MVWm2 = MVWm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
End if 
cplcFdFdAhL = 0._dp 
cplcFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdAhT(gt1,gt2,epYD,ZDL,ZDR,cplcFdFdAhL(gt1,gt2),cplcFdFdAhR(gt1,gt2))

 End Do 
End Do 


cplcFeFeAhL = 0._dp 
cplcFeFeAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeAhT(gt1,gt2,epYE,ZEL,ZER,cplcFeFeAhL(gt1,gt2),cplcFeFeAhR(gt1,gt2))

 End Do 
End Do 


cplcFuFuAhL = 0._dp 
cplcFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuAhT(gt1,gt2,Yu,ZUL,ZUR,cplcFuFuAhL(gt1,gt2),cplcFuFuAhR(gt1,gt2))

 End Do 
End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFdFdhhT(gt1,gt2,gt3,Yd,epYD,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)         & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFdcHmL = 0._dp 
cplcFuFdcHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFdcHmT(gt1,gt2,gt3,epYU,Yu,Yd,epYD,ZP,ZDL,ZDR,ZUL,ZUR,cplcFuFdcHmL(gt1,gt2,gt3)& 
& ,cplcFuFdcHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFeFehhT(gt1,gt2,gt3,Ye,epYE,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)         & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFvFecHmL = 0._dp 
cplcFvFecHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFvFecHmT(gt1,gt2,gt3,Ye,epYE,ZP,ZER,cplcFvFecHmL(gt1,gt2,gt3)           & 
& ,cplcFvFecHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFuhhT(gt1,gt2,gt3,epYU,Yu,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)         & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFvHmL = 0._dp 
cplcFeFvHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFeFvHmT(gt1,gt2,gt3,Ye,epYE,ZP,ZER,cplcFeFvHmL(gt1,gt2,gt3)             & 
& ,cplcFeFvHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZT(gt1,gt2,g1,g2,TW,cplcFdFdVZL(gt1,gt2),cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFdcVWmL = 0._dp 
cplcFuFdcVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdcVWmT(gt1,gt2,g2,ZDL,ZUL,cplcFuFdcVWmL(gt1,gt2),cplcFuFdcVWmR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZT(gt1,gt2,g1,g2,TW,cplcFeFeVZL(gt1,gt2),cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFvFecVWmL = 0._dp 
cplcFvFecVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFvFecVWmT(gt1,gt2,g2,ZEL,cplcFvFecVWmL(gt1,gt2),cplcFvFecVWmR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZT(gt1,gt2,g1,g2,TW,cplcFuFuVZL(gt1,gt2),cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplcFeFvVWmL = 0._dp 
cplcFeFvVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFvVWmT(gt1,gt2,g2,ZEL,cplcFeFvVWmL(gt1,gt2),cplcFeFvVWmR(gt1,gt2))

 End Do 
End Do 


cplcFvFvVZL = 0._dp 
cplcFvFvVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFvFvVZT(gt1,gt2,g1,g2,TW,cplcFvFvVZL(gt1,gt2),cplcFvFvVZR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Fe_decays_3B
 
Subroutine CouplingsFor_Fd_decays_3B(m_in,i1,MAhinput,MAh2input,MFdinput,             & 
& MFd2input,MFeinput,MFe2input,MFuinput,MFu2input,Mhhinput,Mhh2input,MHminput,           & 
& MHm2input,Msigma1input,Msigma12input,MVWminput,MVWm2input,MVZinput,MVZ2input,          & 
& TWinput,ZDRinput,ZERinput,ZURinput,ZDLinput,ZELinput,ZULinput,ZHinput,ZPinput,         & 
& ZWinput,ZZinput,alphaHinput,g1input,g2input,g3input,Lam6input,Lam5input,               & 
& Lam7input,Lam1input,Lam4input,Lam3input,Lam2input,epYUinput,Yuinput,Ydinput,           & 
& Yeinput,epYDinput,epYEinput,M12input,M112input,M222input,vinput,v2input,               & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFdFuHmL,cplcFdFuHmR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFeFeAhL,cplcFeFeAhR,             & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFdcHmL,cplcFuFdcHmR,             & 
& cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,           & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFvFecHmL,cplcFvFecHmR,cplcFvFecVWmL,cplcFvFecVWmR,         & 
& cplcFvFvVZL,cplcFvFvVZR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,vinput,v2input

Complex(dp),Intent(in) :: Lam6input,Lam5input,Lam7input,Lam1input,Lam4input,Lam3input,Lam2input,epYUinput(3,3), & 
& Yuinput(3,3),Ydinput(3,3),Yeinput(3,3),epYDinput(3,3),epYEinput(3,3),M12input,         & 
& M112input,M222input

Real(dp),Intent(in) :: MAhinput,MAh2input,MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),MFuinput(3),     & 
& MFu2input(3),Mhhinput(2),Mhh2input(2),MHminput(2),MHm2input(2),Msigma1input,           & 
& Msigma12input,MVWminput,MVWm2input,MVZinput,MVZ2input,TWinput,ZHinput(2,2),            & 
& ZPinput(2,2),ZZinput(2,2),alphaHinput

Complex(dp),Intent(in) :: ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),ZELinput(3,3),ZULinput(3,3),  & 
& ZWinput(2,2)

Real(dp) :: g1,g2,g3,v,v2

Complex(dp) :: Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,epYU(3,3),Yu(3,3),Yd(3,3),Ye(3,3),epYD(3,3),       & 
& epYE(3,3),M12,M112,M222

Complex(dp),Intent(out) :: cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),              & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFdFuHmL(3,3,2),cplcFdFuHmR(3,3,2),               & 
& cplcFdFuVWmL(3,3),cplcFdFuVWmR(3,3),cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFeFehhL(3,3,2),& 
& cplcFeFehhR(3,3,2),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFdcHmL(3,3,2),              & 
& cplcFuFdcHmR(3,3,2),cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),cplcFuFuAhL(3,3),            & 
& cplcFuFuAhR(3,3),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFuFuVZL(3,3),               & 
& cplcFuFuVZR(3,3),cplcFvFecHmL(3,3,2),cplcFvFecHmR(3,3,2),cplcFvFecVWmL(3,3),           & 
& cplcFvFecVWmR(3,3),cplcFvFvVZL(3,3),cplcFvFvVZR(3,3)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh,MAh2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),Mhh(2),Mhh2(2),MHm(2),          & 
& MHm2(2),Msigma1,Msigma12,MVWm,MVWm2,MVZ,MVZ2,TW,ZH(2,2),ZP(2,2),ZZ(2,2),alphaH

Complex(dp) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Fd_3B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
Lam6 = Lam6input 
Lam5 = Lam5input 
Lam7 = Lam7input 
Lam1 = Lam1input 
Lam4 = Lam4input 
Lam3 = Lam3input 
Lam2 = Lam2input 
epYU = epYUinput 
Yu = Yuinput 
Yd = Ydinput 
Ye = Yeinput 
epYD = epYDinput 
epYE = epYEinput 
M12 = M12input 
M112 = M112input 
M222 = M222input 
v = vinput 
v2 = v2input 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(g1,g2,g3,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,               & 
& epYU,Yu,Yd,Ye,epYD,epYE,M12,M112,M222,v,v2,(/ ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHm,MHm2,Msigma1,        & 
& Msigma12,MVWm,MVWm2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,ZH,ZP,ZW,ZZ,alphaH,            & 
& v,v2,g1,g2,g3,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,epYU,Yu,Yd,Ye,epYD,epYE,              & 
& M12,M112,M222,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
ZH = ZHinput 
ZP = ZPinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHm = MHminput 
MHm2 = MHm2input 
Msigma1 = Msigma1input 
Msigma12 = Msigma12input 
MVWm = MVWminput 
MVWm2 = MVWm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
End if 
cplcFdFdAhL = 0._dp 
cplcFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdAhT(gt1,gt2,epYD,ZDL,ZDR,cplcFdFdAhL(gt1,gt2),cplcFdFdAhR(gt1,gt2))

 End Do 
End Do 


cplcFeFeAhL = 0._dp 
cplcFeFeAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeAhT(gt1,gt2,epYE,ZEL,ZER,cplcFeFeAhL(gt1,gt2),cplcFeFeAhR(gt1,gt2))

 End Do 
End Do 


cplcFuFuAhL = 0._dp 
cplcFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuAhT(gt1,gt2,Yu,ZUL,ZUR,cplcFuFuAhL(gt1,gt2),cplcFuFuAhR(gt1,gt2))

 End Do 
End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFdFdhhT(gt1,gt2,gt3,Yd,epYD,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)         & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFdcHmL = 0._dp 
cplcFuFdcHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFdcHmT(gt1,gt2,gt3,epYU,Yu,Yd,epYD,ZP,ZDL,ZDR,ZUL,ZUR,cplcFuFdcHmL(gt1,gt2,gt3)& 
& ,cplcFuFdcHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFeFehhT(gt1,gt2,gt3,Ye,epYE,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)         & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFvFecHmL = 0._dp 
cplcFvFecHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFvFecHmT(gt1,gt2,gt3,Ye,epYE,ZP,ZER,cplcFvFecHmL(gt1,gt2,gt3)           & 
& ,cplcFvFecHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFuhhT(gt1,gt2,gt3,epYU,Yu,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)         & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFuHmL = 0._dp 
cplcFdFuHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFdFuHmT(gt1,gt2,gt3,epYU,Yu,Yd,epYD,ZP,ZDL,ZDR,ZUL,ZUR,cplcFdFuHmL(gt1,gt2,gt3)& 
& ,cplcFdFuHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZT(gt1,gt2,g1,g2,TW,cplcFdFdVZL(gt1,gt2),cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFdcVWmL = 0._dp 
cplcFuFdcVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdcVWmT(gt1,gt2,g2,ZDL,ZUL,cplcFuFdcVWmL(gt1,gt2),cplcFuFdcVWmR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZT(gt1,gt2,g1,g2,TW,cplcFeFeVZL(gt1,gt2),cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFvFecVWmL = 0._dp 
cplcFvFecVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFvFecVWmT(gt1,gt2,g2,ZEL,cplcFvFecVWmL(gt1,gt2),cplcFvFecVWmR(gt1,gt2))

 End Do 
End Do 


cplcFdFuVWmL = 0._dp 
cplcFdFuVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFuVWmT(gt1,gt2,g2,ZDL,ZUL,cplcFdFuVWmL(gt1,gt2),cplcFdFuVWmR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZT(gt1,gt2,g1,g2,TW,cplcFuFuVZL(gt1,gt2),cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplcFvFvVZL = 0._dp 
cplcFvFvVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFvFvVZT(gt1,gt2,g1,g2,TW,cplcFvFvVZL(gt1,gt2),cplcFvFvVZR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Fd_decays_3B
 
Function NFlav(m_in) 
Implicit None 
Real(dp), Intent(in) :: m_in 
Real(dp) :: NFlav 
If (m_in.lt.mf_d(3)) Then 
  NFlav = 4._dp 
Else If (m_in.lt.mf_u(3)) Then 
  NFlav = 5._dp 
Else 
  NFlav = 6._dp 
End if 
End Function

Subroutine RunSM(scale_out,deltaM,tb,g1,g2,g3,Yu, Yd, Ye, vd, vu) 
Implicit None
Real(dp), Intent(in) :: scale_out,deltaM, tb
Real(dp), Intent(out) :: g1, g2, g3, vd, vu
Complex(dp), Intent(out) :: Yu(3,3), Yd(3,3), Ye(3,3)
Real(dp) :: dt, gSM(14), gSM2(2), gSM3(3), mtopMS,  sinw2, vev, tz, alphaStop 
Integer :: kont

RunningTopMZ = .false.

Yd = 0._dp
Ye = 0._dp
Yu = 0._dp

If (.not.RunningTopMZ) Then

! Calculating alpha_S(m_top)
gSM2(1)=sqrt(Alpha_mZ*4*Pi) 
gSM2(2)=sqrt(AlphaS_mZ*4*Pi) 


tz=Log(sqrt(mz2)/mf_u(3)) 
dt=tz/50._dp 
Call odeint(gSM2,2,tz,0._dp,deltaM,dt,0._dp,RGEAlphaS,kont)



alphaStop = gSM2(2)**2/4._dp/Pi



! m_top^pole to m_top^MS(m_top) 

mtopMS = mf_u(3)*(1._dp - 4._dp/3._dp*alphaStop/Pi)


! Running m_top^MS(m_top) to M_Z 

gSM3(1)=gSM2(1) 
gSM3(2)=gSM2(2)
gSM3(3)=mtopMS

tz=Log(sqrt(mz2)/mf_u(3)) 
dt=tz/50._dp 
Call odeint(gSM3,3,0._dp,tz,deltaM,dt,0._dp,RGEtop,kont)


mf_u_mz_running = gSM3(3)


RunningTopMZ = .True.

End if

! Starting values at MZ

gSM(1)=sqrt(Alpha_mZ*4*Pi) 
gSM(2)=sqrt(AlphaS_mZ*4*Pi) 
gSM(3)= 0.486E-03_dp ! mf_l_mz(1) 
gSM(4)= 0.10272 !mf_l_mz(2) 
gSM(5)= 1.74624 !mf_l_mz(3) 
gSM(6)= 1.27E-03_dp ! mf_u_mz(1) 
gSM(7)= 0.619  ! mf_u_mz(2) 
gSM(8)= mf_u_mz_running ! m_top 
gSM(9)= 2.9E-03_dp !mf_d_mz(1) 
gSM(10)= 0.055 !mf_d_mz(2) 
gSM(11)= 2.85 ! mf_d_mz(3) 
 

! To get the running sin(w2) 
SinW2 = 0.22290_dp
gSM(12) = 5._dp/3._dp*Alpha_MZ/(1-sinW2)
gSM(13) = Alpha_MZ/Sinw2
gSM(14) = AlphaS_mZ

  nUp =2._dp 
  nDown =3._dp 
  nLep =3._dp 
 

If (scale_out.gt.sqrt(mz2)) Then

 ! From M_Z to Min(M_top,scale_out) 
 If (scale_out.gt.mf_u(3)) Then 
  tz=Log(sqrt(mz2)/mf_u(3)) 
  dt=tz/50._dp 
 Else 
  tz=Log(sqrt(mz2)/scale_out) 
  dt=tz/50._dp 
 End if 

  Call odeint(gSM,14,tz,0._dp,deltaM,dt,0._dp,rge11,kont)


 ! From M_top to M_SUSY if M_top < M_SUSY 
 If (scale_out.gt.mf_u(3)) Then 
  tz=Log(mf_u(3)/scale_out) 
  dt=tz/50._dp 
  nUp =3._dp 
  Call odeint(gSM,14,tz,0._dp,deltaM,dt,0._dp,rge11,kont)
 End if 
Else

 ! From M_Z down to scale_out
  tz=Log(scale_out/sqrt(mz2)) 
  dt=tz/50._dp 
  Call odeint(gSM,14,0._dp,tz,deltaM,dt,0._dp,rge11_SMa,kont)

End if

! Calculating Couplings 

 sinW2=1._dp-mW2/mZ2 
 vev=Sqrt(mZ2*(1._dp-sinW2)*SinW2/(gSM(1)**2/4._dp))
 vd=vev/Sqrt(1._dp+tb**2)
 vu=tb*vd
 
Yd(1,1) =gSM(9)*sqrt(2._dp)/vd 
Yd(2,2) =gSM(10)*sqrt(2._dp)/vd 
Yd(3,3) =gSM(11)*sqrt(2._dp)/vd 
Ye(1,1) =gSM(3)*sqrt(2._dp)/vd 
Ye(2,2)=gSM(4)*sqrt(2._dp)/vd 
Ye(3,3)=gSM(5)*sqrt(2._dp)/vd 
Yu(1,1)=gSM(6)*sqrt(2._dp)/vu 
Yu(2,2)=gSM(7)*sqrt(2._dp)/vu 
Yu(3,3)=gSM(8)*sqrt(2._dp)/vu 


g3 =gSM(2) 
g3running=gSM(2) 

g1 = sqrt(gSM(12)*4._dp*Pi*3._dp/5._dp)
g2 = sqrt(gSM(13)*4._dp*Pi)
! g3 = sqrt(gSM(3)*4._dp*Pi)

sinw2 = g1**2/(g1**2 + g2**2)

!g2=gSM(1)/sqrt(sinW2) 
!g1 = g2*Sqrt(sinW2/(1._dp-sinW2)) 

If (GenerationMixing) Then 

If (YukawaScheme.Eq.1) Then ! CKM into Yu
 If (TransposedYukawa) Then ! check, if superpotential is Yu Hu u q  or Yu Hu q u
   Yu= Matmul(Transpose(CKM),Transpose(Yu))
 Else 
   Yu=Transpose(Matmul(Transpose(CKM),Transpose(Yu)))
 End if 

Else ! CKM into Yd 
 
 If (TransposedYukawa) Then ! 
  Yd= Matmul(Conjg(CKM),Transpose(Yd))
 Else 
  Yd=Transpose(Matmul(Conjg(CKM),Transpose(Yd)))
 End if 

End if ! Yukawa scheme
End If ! Generatoin mixing


End Subroutine RunSM


Subroutine RunSMohdm(scale_out,deltaM,g1,g2,g3,Yu, Yd, Ye, v) 
Implicit None
Real(dp), Intent(in) :: scale_out,deltaM
Real(dp), Intent(out) :: g1, g2, g3, v
Complex(dp), Intent(out) :: Yu(3,3), Yd(3,3), Ye(3,3)
Real(dp) :: dt, gSM(14), gSM2(2), gSM3(3), mtopMS,  sinw2, vev, tz, alphaStop 
Integer :: kont

Yd = 0._dp
Ye = 0._dp
Yu = 0._dp

If (.not.RunningTopMZ) Then

! Calculating alpha_S(m_top)
gSM2(1)=sqrt(Alpha_mZ*4*Pi) 
gSM2(2)=sqrt(AlphaS_mZ*4*Pi) 


tz=Log(sqrt(mz2)/mf_u(3)) 
dt=tz/50._dp 
Call odeint(gSM2,2,tz,0._dp,deltaM,dt,0._dp,RGEAlphaS,kont)



alphaStop = gSM2(2)**2/4._dp/Pi



! m_top^pole to m_top^MS(m_top) 

mtopMS = mf_u(3)*(1._dp - 4._dp/3._dp*alphaStop/Pi)


! Running m_top^MS(m_top) to M_Z 

gSM3(1)=gSM2(1) 
gSM3(2)=gSM2(2)
gSM3(3)=mtopMS

tz=Log(sqrt(mz2)/mf_u(3)) 
dt=tz/50._dp 
Call odeint(gSM3,3,0._dp,tz,deltaM,dt,0._dp,RGEtop,kont)


mf_u_mz_running = gSM3(3)


RunningTopMZ = .True.

End if

! Starting values at MZ

gSM(1)=sqrt(Alpha_mZ*4*Pi) 
gSM(2)=sqrt(AlphaS_mZ*4*Pi) 
gSM(3)= 0.486E-03_dp ! mf_l_mz(1) 
gSM(4)= 0.10272 !mf_l_mz(2) 
gSM(5)= 1.74624 !mf_l_mz(3) 
gSM(6)= 1.27E-03_dp ! mf_u_mz(1) 
gSM(7)= 0.619  ! mf_u_mz(2) 
gSM(8)= mf_u_mz_running ! m_top 
gSM(9)= 2.9E-03_dp !mf_d_mz(1) 
gSM(10)= 0.055 !mf_d_mz(2) 
gSM(11)= 2.85 ! mf_d_mz(3) 
 

! To get the running sin(w2) 
SinW2 = 0.22290_dp
gSM(12) = 5._dp/3._dp*Alpha_MZ/(1-sinW2)
gSM(13) = Alpha_MZ/Sinw2
gSM(14) = AlphaS_mZ

  nUp =2._dp 
  nDown =3._dp 
  nLep =3._dp 
 

If (scale_out.gt.sqrt(mz2)) Then

 ! From M_Z to Min(M_top,scale_out) 
 If (scale_out.gt.mf_u(3)) Then 
  tz=Log(sqrt(mz2)/mf_u(3)) 
  dt=tz/50._dp 
 Else 
  tz=Log(sqrt(mz2)/scale_out) 
  dt=tz/50._dp 
 End if 

  Call odeint(gSM,14,tz,0._dp,deltaM,dt,0._dp,rge11,kont)


 ! From M_top to M_SUSY if M_top < M_SUSY 
 If (scale_out.gt.mf_u(3)) Then 
  tz=Log(mf_u(3)/scale_out) 
  dt=tz/50._dp 
  nUp =3._dp 
  Call odeint(gSM,14,tz,0._dp,deltaM,dt,0._dp,rge11,kont)
 End if 
Else

 ! From M_Z down to scale_out
  If (abs(scale_out - sqrt(mz2)).gt.1.0E-3_dp) Then 
   tz=Log(scale_out/sqrt(mz2)) 
   dt=tz/50._dp 
   Call odeint(gSM,14,0._dp,tz,deltaM,dt,0._dp,rge11_SMa,kont)
  End if
End if

! Calculating Couplings 

 sinW2=1._dp-mW2/mZ2 
 vev=Sqrt(mZ2*(1._dp-sinW2)*SinW2/(gSM(1)**2/4._dp))
 v = vev
 
Yd(1,1) =gSM(9)*sqrt(2._dp)/v 
Yd(2,2) =gSM(10)*sqrt(2._dp)/v 
Yd(3,3) =gSM(11)*sqrt(2._dp)/v 
Ye(1,1) =gSM(3)*sqrt(2._dp)/v 
Ye(2,2)=gSM(4)*sqrt(2._dp)/v 
Ye(3,3)=gSM(5)*sqrt(2._dp)/v 
Yu(1,1)=gSM(6)*sqrt(2._dp)/v 
Yu(2,2)=gSM(7)*sqrt(2._dp)/v 
Yu(3,3)=gSM(8)*sqrt(2._dp)/v 


g3 =gSM(2) 
g3running=gSM(2) 

g1 = sqrt(gSM(12)*4._dp*Pi*3._dp/5._dp)
g2 = sqrt(gSM(13)*4._dp*Pi)
! g3 = sqrt(gSM(3)*4._dp*Pi)

sinw2 = g1**2/(g1**2 + g2**2)

g2=gSM(1)/sqrt(sinW2) 
g1 = g2*Sqrt(sinW2/(1._dp-sinW2)) 

If (GenerationMixing) Then 

If (YukawaScheme.Eq.1) Then ! CKM into Yu
 If (TransposedYukawa) Then ! check, if superpotential is Yu Hu u q  or Yu Hu q u
   Yu= Matmul(Transpose(CKM),Transpose(Yu))
 Else 
   Yu=Transpose(Matmul(Transpose(CKM),Transpose(Yu)))
 End if 

Else ! CKM into Yd 
 
 If (TransposedYukawa) Then ! 
  Yd= Matmul(Conjg(CKM),Transpose(Yd))
 Else 
  Yd=Transpose(Matmul(Conjg(CKM),Transpose(Yd)))
 End if 

End if ! Yukawa scheme
End If ! Generation mixing



End Subroutine RunSMohdm

Subroutine RunSMgauge(scale_out,deltaM,g1,g2,g3) 
Implicit None
Real(dp), Intent(in) :: scale_out,deltaM
Real(dp), Intent(out) :: g1, g2, g3
Complex(dp) :: Yu(3,3), Yd(3,3), Ye(3,3)
Real(dp) :: v, dt, gSM(14), gSM2(2), gSM3(3), mtopMS,  sinw2, vev, tz, alphaStop 
Integer :: kont

Yd = 0._dp
Ye = 0._dp
Yu = 0._dp

RunningTopMZ = .false.

If (.not.RunningTopMZ) Then

! Calculating alpha_S(m_top)
gSM2(1)=sqrt(Alpha_mZ*4*Pi) 
gSM2(2)=sqrt(AlphaS_mZ*4*Pi) 


tz=Log(sqrt(mz2)/mf_u(3)) 
dt=tz/50._dp 
Call odeint(gSM2,2,tz,0._dp,deltaM,dt,0._dp,RGEAlphaS,kont)



alphaStop = gSM2(2)**2/4._dp/Pi



! m_top^pole to m_top^MS(m_top) 

mtopMS = mf_u(3)*(1._dp - 4._dp/3._dp*alphaStop/Pi)


! Running m_top^MS(m_top) to M_Z 

gSM3(1)=gSM2(1) 
gSM3(2)=gSM2(2)
gSM3(3)=mtopMS

tz=Log(sqrt(mz2)/mf_u(3)) 
dt=tz/50._dp 
Call odeint(gSM3,3,0._dp,tz,deltaM,dt,0._dp,RGEtop,kont)


mf_u_mz_running = gSM3(3)


RunningTopMZ = .True.

End if

! Starting values at MZ

gSM(1)=sqrt(Alpha_mZ*4*Pi) 
gSM(2)=sqrt(AlphaS_mZ*4*Pi) 
gSM(3)= 0.486E-03_dp ! mf_l_mz(1) 
gSM(4)= 0.10272 !mf_l_mz(2) 
gSM(5)= 1.74624 !mf_l_mz(3) 
gSM(6)= 1.27E-03_dp ! mf_u_mz(1) 
gSM(7)= 0.619  ! mf_u_mz(2) 
gSM(8)= mf_u_mz_running ! m_top 
gSM(9)= 2.9E-03_dp !mf_d_mz(1) 
gSM(10)= 0.055 !mf_d_mz(2) 
gSM(11)= 2.85 ! mf_d_mz(3) 
 

! To get the running sin(w2) 
SinW2 = 0.22290_dp
gSM(12) = 5._dp/3._dp*Alpha_MZ/(1-sinW2)
gSM(13) = Alpha_MZ/Sinw2
gSM(14) = AlphaS_mZ

  nUp =2._dp 
  nDown =3._dp 
  nLep =3._dp 
 

If (scale_out.gt.sqrt(mz2)) Then

 ! From M_Z to Min(M_top,scale_out) 
 If (scale_out.gt.mf_u(3)) Then 
  tz=Log(sqrt(mz2)/mf_u(3)) 
  dt=tz/50._dp 
 Else 
  tz=Log(sqrt(mz2)/scale_out) 
  dt=tz/50._dp 
 End if 

  Call odeint(gSM,14,tz,0._dp,deltaM,dt,0._dp,rge11,kont)


 ! From M_top to M_SUSY if M_top < M_SUSY 
 If (scale_out.gt.mf_u(3)) Then 
  tz=Log(mf_u(3)/scale_out) 
  dt=tz/50._dp 
  nUp =3._dp 
  Call odeint(gSM,14,tz,0._dp,deltaM,dt,0._dp,rge11,kont)
 End if 
Else

 ! From M_Z down to scale_out
  tz=Log(scale_out/sqrt(mz2)) 
  dt=tz/50._dp 
  Call odeint(gSM,14,0._dp,tz,deltaM,dt,0._dp,rge11_SMa,kont)

End if

! Calculating Couplings 

 sinW2=1._dp-mW2/mZ2 
 vev=Sqrt(mZ2*(1._dp-sinW2)*SinW2/(gSM(1)**2/4._dp))
 v = vev
 
Yd(1,1) =gSM(9)*sqrt(2._dp)/v 
Yd(2,2) =gSM(10)*sqrt(2._dp)/v 
Yd(3,3) =gSM(11)*sqrt(2._dp)/v 
Ye(1,1) =gSM(3)*sqrt(2._dp)/v 
Ye(2,2)=gSM(4)*sqrt(2._dp)/v 
Ye(3,3)=gSM(5)*sqrt(2._dp)/v 
Yu(1,1)=gSM(6)*sqrt(2._dp)/v 
Yu(2,2)=gSM(7)*sqrt(2._dp)/v 
Yu(3,3)=gSM(8)*sqrt(2._dp)/v 


g3 =gSM(2) 
g3running=gSM(2) 

g1 = sqrt(gSM(12)*4._dp*Pi*3._dp/5._dp)
g2 = sqrt(gSM(13)*4._dp*Pi)
! g3 = sqrt(gSM(3)*4._dp*Pi)

sinw2 = g1**2/(g1**2 + g2**2)

g2=gSM(1)/sqrt(sinW2) 
g1 = g2*Sqrt(sinW2/(1._dp-sinW2)) 

If (GenerationMixing) Then 
If (TransposedYukawa) Then ! check, if superpotential is Yu Hu u q  or Yu Hu q u
 Yu= Matmul(Transpose(CKM),Transpose(Yu))
Else 
 Yu=Transpose(Matmul(Transpose(CKM),Transpose(Yu)))
End if 
End If


End Subroutine RunSMgauge
End Module CouplingsForDecays_THDMIIIHB
