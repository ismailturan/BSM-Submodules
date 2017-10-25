! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.12.2 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 17:26 on 25.10.2017   
! ----------------------------------------------------------------------  
 
 
Module Fe3Decays_THDMIIIHB 
 
Use Control 
Use Settings 
Use CouplingsForDecays_THDMIIIHB 
Use ThreeBodyPhaseSpace 
 
Contains 
 
Subroutine FeThreeBodyDecay(n_in,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,             & 
& Mhh2,MHm,MHm2,Msigma1,Msigma12,MVWm,MVWm2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,             & 
& ZUL,ZH,ZP,ZW,ZZ,alphaH,g1,g2,g3,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,epYU,               & 
& Yu,Yd,Ye,epYD,epYE,M12,M112,M222,v,v2,gTAh,gThh,gTHm,gTVWm,gTVZ,gFeFecFdFd,            & 
& gFeFecFeFe,gFeFecFuFu,gFeFecFvFv,gFeFvcFuFd,epsI,deltaM,CheckRealStates,               & 
& gT,gPartial,BR)

Implicit None 
 
Real(dp),Intent(in) :: MAh,MAh2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),Mhh(2),Mhh2(2),MHm(2),          & 
& MHm2(2),Msigma1,Msigma12,MVWm,MVWm2,MVZ,MVZ2,TW,ZH(2,2),ZP(2,2),ZZ(2,2),alphaH

Complex(dp),Intent(in) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZW(2,2)

Complex(dp) :: cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),              & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFeFehhL(3,3,2),& 
& cplcFeFehhR(3,3,2),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFvHmL(3,3,2),               & 
& cplcFeFvHmR(3,3,2),cplcFeFvVWmL(3,3),cplcFeFvVWmR(3,3),cplcFuFdcHmL(3,3,2),            & 
& cplcFuFdcHmR(3,3,2),cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),cplcFuFuAhL(3,3),            & 
& cplcFuFuAhR(3,3),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFuFuVZL(3,3),               & 
& cplcFuFuVZR(3,3),cplcFvFecHmL(3,3,2),cplcFvFecHmR(3,3,2),cplcFvFecVWmL(3,3),           & 
& cplcFvFecVWmR(3,3),cplcFvFvVZL(3,3),cplcFvFvVZR(3,3)

Real(dp),Intent(in) :: g1,g2,g3,v,v2

Complex(dp),Intent(in) :: Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,epYU(3,3),Yu(3,3),Yd(3,3),Ye(3,3),epYD(3,3),       & 
& epYE(3,3),M12,M112,M222

Real(dp),Intent(inout) :: gFeFecFdFd(3,3,3,3),gFeFecFeFe(3,3,3,3),gFeFecFuFu(3,3,3,3),gFeFecFvFv(3,3,3,3),      & 
& gFeFvcFuFd(3,3,3,3)

Real(dp),Intent(in) :: gTAh,gThh(2),gTHm(2),gTVWm,gTVZ

Real(dp) :: gFeFecFdFdi(3,3,3),gFeFecFeFei(3,3,3),gFeFecFuFui(3,3,3),gFeFecFvFvi(3,3,3),          & 
& gFeFvcFuFdi(3,3,3)

Real(dp) :: gTAhtemp,gThhtemp(2),gTHmtemp(2),gTVWmtemp,gTVZtemp
Integer :: NVs,NVst,NSs,NVVst,NVVss,NVSss,NVSst,NSSss,NSSst
Complex(dp), Allocatable :: IntegralVVst(:,:),IntegralVSss(:,:),IntegralVSst(:,:),IntegralSSss(:,:)               & 
& ,IntegralSSst(:,:)
Real(dp), Allocatable :: IntegralVs(:,:),IntegralVst(:,:),IntegralSs(:,:),IntegralVVss(:,:)
Real(dp), Intent(inout), Optional :: BR(:,:), gPartial(:,:) 
Real(dp), Intent(inout) :: gT(:) 
Integer, Intent(in) :: n_in 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Intent(in) ::  CheckRealStates 
Integer :: i_start, i_end, i_run, n_out, n_length, gt1, gt2, gt3, i1 
Logical :: check 
Iname = Iname +1 
NameOfUnit(Iname) = 'FeThreeBodyDecay' 
 
Allocate( IntegralVs(25000,9) ) 
Allocate( IntegralVst(25000,12) ) 
Allocate( IntegralSs(500000,10) ) 
Allocate( IntegralVVst(25000,12) ) 
Allocate( IntegralVVss(500000,12) ) 
Allocate( IntegralVSss(500000,12) ) 
Allocate( IntegralVSst(500000,16) ) 
Allocate( IntegralSSss(500000,12) ) 
Allocate( IntegralSSst(500000,16) ) 

 
If (CheckRealStates) Then 
gTAhtemp = 0._dp 
gThhtemp = 0._dp 
gTHmtemp = 0._dp 
gTVWmtemp = 0._dp 
gTVZtemp = 0._dp 
Else 
gTAhtemp = gTAh 
gThhtemp = gThh 
gTHmtemp = gTHm 
gTVWmtemp = gTVWm 
gTVZtemp = gTVZ 
End If 
 
check=CheckRealStates 

 
If (n_in.Lt.0) Then 
 i_start = 1 
 i_end = 3 
 Else If ( (n_in.Ge.1).And.(n_in.Le. 3) ) Then 
 i_start = n_in 
 i_end = n_in 
Else 
 If (ErrorLevel.Ge.-1) Then 
   Write (ErrCan, *) 'Problem in subroutine'//NameOfUnit(Iname) 
   Write (ErrCan, *) 'Value of n_in out of range, (n_in,3) = ',n_in,3 
 End If 
 
 If (ErrorLevel.Gt.0) Call TerminateProgram 
 
 If (Present(BR)) BR = 0._dp 
 Iname = Iname - 1 
 Return 
End If 
 
Do i_run = i_start, i_end 
 
Call CouplingsFor_Fe_decays_3B(MFe(i_run),i_run,MAh,MAh2,MFd,MFd2,MFe,MFe2,           & 
& MFu,MFu2,Mhh,Mhh2,MHm,MHm2,Msigma1,Msigma12,MVWm,MVWm2,MVZ,MVZ2,TW,ZDR,ZER,            & 
& ZUR,ZDL,ZEL,ZUL,ZH,ZP,ZW,ZZ,alphaH,g1,g2,g3,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,             & 
& Lam2,epYU,Yu,Yd,Ye,epYD,epYE,M12,M112,M222,v,v2,cplcFdFdAhL,cplcFdFdAhR,               & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeAhL,cplcFeFeAhR,               & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvHmL,cplcFeFvHmR,               & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplcFuFdcHmL,cplcFuFdcHmR,cplcFuFdcVWmL,cplcFuFdcVWmR,       & 
& cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcFvFecHmL,cplcFvFecHmR,cplcFvFecVWmL,cplcFvFecVWmR,cplcFvFvVZL,cplcFvFvVZR,deltaM)

IntegralVs = 0._dp 
NVs = 0  
IntegralVst = 0._dp 
NVst = 0  
IntegralSs = 0._dp 
NSs = 0  
IntegralVVst = 0._dp 
NVVst = 0  
IntegralVVss = 0._dp 
NVVss = 0  
IntegralVSss = 0._dp 
NVSss = 0  
IntegralVSst = 0._dp 
NVSst = 0  
IntegralSSss = 0._dp 
NSSss = 0  
IntegralSSst = 0._dp 
NSSst = 0  

 
gFeFecFdFdi = 0._dp 
Call FeToFecFdFd(i_run,MFe,MFd,MVZ,MAh,Mhh,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,       & 
& cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,               & 
& cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,IntegralSs,IntegralSSss,IntegralVs,IntegralVSss,   & 
& IntegralVVss,NSs,NSSss,NVs,NVSss,NVVss,gTVZtemp,gTAhtemp,gThhtemp,deltaM,              & 
& epsI,check,gFeFecFdFdi)

gFeFecFdFd(i_run,:,:,:) = gFeFecFdFdi 
gT(i_run) = gT(i_run) + Sum(gFeFecFdFdi) 
 
gFeFecFeFei = 0._dp 
Call FeToFecFeFe(i_run,MFe,MVZ,MAh,Mhh,cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,           & 
& cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,IntegralSs,IntegralSSss,IntegralSSst,              & 
& IntegralVs,IntegralVSss,IntegralVSst,IntegralVVss,IntegralVVst,NSs,NSSss,              & 
& NSSst,NVs,NVSss,NVSst,NVVss,NVVst,gTVZtemp,gTAhtemp,gThhtemp,deltaM,epsI,              & 
& check,gFeFecFeFei)

gFeFecFeFe(i_run,:,:,:) = gFeFecFeFei 
gT(i_run) = gT(i_run) + Sum(gFeFecFeFei) 
 
gFeFecFuFui = 0._dp 
Call FeToFecFuFu(i_run,MFe,MFu,MVZ,MAh,Mhh,cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,       & 
& cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,               & 
& cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,IntegralSs,IntegralSSss,IntegralVs,IntegralVSss,   & 
& IntegralVVss,NSs,NSSss,NVs,NVSss,NVVss,gTVZtemp,gTAhtemp,gThhtemp,deltaM,              & 
& epsI,check,gFeFecFuFui)

gFeFecFuFu(i_run,:,:,:) = gFeFecFuFui 
gT(i_run) = gT(i_run) + Sum(gFeFecFuFui) 
 
gFeFecFvFvi = 0._dp 
Call FeToFecFvFv(i_run,MFe,MVZ,MVWm,MHm,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvHmL,          & 
& cplcFeFvHmR,cplcFeFvVWmL,cplcFeFvVWmR,cplcFvFecHmL,cplcFvFecHmR,cplcFvFecVWmL,         & 
& cplcFvFecVWmR,cplcFvFvVZL,cplcFvFvVZR,IntegralSs,IntegralSSss,IntegralVs,              & 
& IntegralVSss,IntegralVSst,IntegralVVss,IntegralVVst,NSs,NSSss,NVs,NVSss,               & 
& NVSst,NVVss,NVVst,gTVZtemp,gTVWmtemp,gTHmtemp,deltaM,epsI,check,gFeFecFvFvi)

gFeFecFvFv(i_run,:,:,:) = gFeFecFvFvi 
gT(i_run) = gT(i_run) + Sum(gFeFecFvFvi) 
 
gFeFvcFuFdi = 0._dp 
Call FeToFvcFuFd(i_run,MFu,MFd,MVWm,MHm,MFe,cplcFeFvHmL,cplcFeFvHmR,cplcFeFvVWmL,     & 
& cplcFeFvVWmR,cplcFuFdcHmL,cplcFuFdcHmR,cplcFuFdcVWmL,cplcFuFdcVWmR,IntegralSs,         & 
& IntegralSSss,IntegralVs,IntegralVSss,IntegralVVss,NSs,NSSss,NVs,NVSss,NVVss,           & 
& gTVWmtemp,gTHmtemp,deltaM,epsI,check,gFeFvcFuFdi)

gFeFvcFuFd(i_run,:,:,:) = gFeFvcFuFdi 
gT(i_run) = gT(i_run) + Sum(gFeFvcFuFdi) 
 
End Do 
 

If (Present(gPartial)) Then
Do i1 = i_start, i_end 
 
n_length=1
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= gFeFecFdFd(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=gt1,3
gPartial(i1,n_length)= gFeFecFeFe(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= gFeFecFuFu(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= gFeFecFvFv(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= gFeFvcFuFd(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
If (Present(BR).And.(gT(i1).Gt.0._dp)) Then 
BR(i1,:)=gPartial(i1,:)/gT(i1)
Else If (Present(BR)) Then
BR(i1,:)=0._dp
End If
 
End Do 
End if 
Deallocate( IntegralVs ) 
Deallocate( IntegralVst ) 
Deallocate( IntegralSs ) 
Deallocate( IntegralVVst ) 
Deallocate( IntegralVVss ) 
Deallocate( IntegralVSss ) 
Deallocate( IntegralVSst ) 
Deallocate( IntegralSSss ) 
Deallocate( IntegralSSst ) 
Iname = Iname - 1 
 
End Subroutine FeThreeBodyDecay
 
 
Subroutine FeToFecFdFd(iIN,MFe,MFd,MVZ,MAh,Mhh,cplcFdFdAhL,cplcFdFdAhR,               & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeAhL,cplcFeFeAhR,               & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,IntegralSs,IntegralSSss,               & 
& IntegralVs,IntegralVSss,IntegralVVss,NSs,NSSss,NVs,NVSss,NVVss,gTVZ,gTAh,              & 
& gThh,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFe(3),MFd(3),MVZ,MAh,Mhh(2)

Complex(dp),Intent(in) :: cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),              & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFeFehhL(3,3,2),& 
& cplcFeFehhR(3,3,2),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3)

Real(dp),Intent(inout) :: IntegralSs(500000,10),IntegralVs(25000,9),IntegralVVss(500000,12)

Complex(dp),Intent(inout) :: IntegralSSss(500000,12),IntegralVSss(500000,12)

Real(dp),Intent(inout) :: gTVZ,gTAh,gThh(2)

Integer, Intent(inout) :: NSs,NSSss,NVs,NVSss,NVVss
Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp) :: Boson2(2), mass(4),  Boson4(4) 
Complex(dp) :: coup(4), coup2(8),coupT 
mass(1) = MFe(iIN) 
 
Isum = 16 
Allocate( gSum(3,3,3, Isum) ) 
Allocate( Contribution(3,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=1,3
Isum = 0 
 
If(Abs(MFe(iIN)).gt.(Abs(MFd(gt3))+Abs(MFd(gt2))+Abs(MFe(gt1)))) Then 
!-------------- 
!  VZ 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVZ 
Boson2(2) =gTVZ 
 
Boson4(1) = MVZ 
Boson4(2) =gTVZ 
Boson4(3) = MVZ 
Boson4(4) =gTVZ 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFe(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup(2) = Conjg(cplcFeFeVZL(iIN,gt1)) 
coup(1) = Conjg(cplcFeFeVZR(iIN,gt1)) 
coup(4) = Conjg(cplcFdFdVZL(gt2,gt3)) 
coup(3) = Conjg(cplcFdFdVZR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFd Fd Propagator: VZ" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ'



!-------------- 
!  Ah 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MAh 
Boson2(2) =gTAh 
 
Boson4(1) = MAh 
Boson4(2) =gTAh 
Boson4(3) = MAh 
Boson4(4) =gTAh 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFe(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup(2) = Conjg(cplcFeFeAhL(iIN,gt1)) 
coup(1) = Conjg(cplcFeFeAhR(iIN,gt1)) 
coup(4) = Conjg(cplcFdFdAhL(gt2,gt3)) 
coup(3) = Conjg(cplcFdFdAhR(gt2,gt3))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFd Fd Propagator: Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah'



!-------------- 
!  hh 
!-------------- 
Do i1=1,2
Isum = Isum + 1 
Boson2(1) = Mhh(i1) 
Boson2(2) =gThh(i1) 
 
Boson4(1) = Mhh(i1) 
Boson4(2) =gThh(i1) 
Boson4(3) = Mhh(i1) 
Boson4(4) =gThh(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFe(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup(2) = Conjg(cplcFeFehhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcFeFehhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplcFdFdhhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplcFdFdhhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFd Fd Propagator: hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='hh'
      End Do 



!-------------- 
!  VZ, Ah 
!-------------- 
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MAh 
Boson4(4) = gTAh 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplcFeFeVZL(iIN,gt1) 
coup2(2) = cplcFeFeVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFeFeAhL(iIN,gt1)) 
coup2(4) = Conjg(cplcFeFeAhR(iIN,gt1))  
coup2(5) = cplcFdFdVZL(gt2,gt3) 
coup2(6) = cplcFdFdVZR(gt2,gt3) 
coup2(7) = Conjg(cplcFdFdAhL(gt2,gt3)) 
coup2(8) = Conjg(cplcFdFdAhR(gt2,gt3)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFd Fd Propagator: VZ,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,Ah'



!-------------- 
!  VZ, hh 
!-------------- 
  Do i2=1,2
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplcFeFeVZL(iIN,gt1) 
coup2(2) = cplcFeFeVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFeFehhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFeFehhR(iIN,gt1,i2))  
coup2(5) = cplcFdFdVZL(gt2,gt3) 
coup2(6) = cplcFdFdVZR(gt2,gt3) 
coup2(7) = Conjg(cplcFdFdhhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFdFdhhR(gt2,gt3,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFd Fd Propagator: VZ,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,hh'
      End Do 



!-------------- 
!  Ah, hh 
!-------------- 
  Do i2=1,2
Boson4(1) = MAh 
Boson4(2) = gTAh 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplcFeFeAhL(iIN,gt1) 
coup2(2) = cplcFeFeAhR(iIN,gt1) 
coup2(3) = Conjg(cplcFeFehhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFeFehhR(iIN,gt1,i2))  
coup2(5) = cplcFdFdAhL(gt2,gt3) 
coup2(6) = cplcFdFdAhR(gt2,gt3) 
coup2(7) = Conjg(cplcFdFdhhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFdFdhhR(gt2,gt3,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFd Fd Propagator: Ah,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,hh'
      End Do 



!-------------- 
!  hh, hh 
!-------------- 
Do i1=1,1
  Do i2=i1+1,2
Boson4(1) = Mhh(i1) 
Boson4(2) = gThh(i1) 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplcFeFehhL(iIN,gt1,i1) 
coup2(2) = cplcFeFehhR(iIN,gt1,i1) 
coup2(3) = Conjg(cplcFeFehhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFeFehhR(iIN,gt1,i2))  
coup2(5) = cplcFdFdhhL(gt2,gt3,i1) 
coup2(6) = cplcFdFdhhR(gt2,gt3,i1) 
coup2(7) = Conjg(cplcFdFdhhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFdFdhhR(gt2,gt3,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFd Fd Propagator: hh,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='hh,hh'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=1,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:16))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MFe(iIN))**3*g
End Subroutine FeToFecFdFd 
 
 
Subroutine FeToFecFeFe(iIN,MFe,MVZ,MAh,Mhh,cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,       & 
& cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,IntegralSs,IntegralSSss,IntegralSSst,              & 
& IntegralVs,IntegralVSss,IntegralVSst,IntegralVVss,IntegralVVst,NSs,NSSss,              & 
& NSSst,NVs,NVSss,NVSst,NVVss,NVVst,gTVZ,gTAh,gThh,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFe(3),MVZ,MAh,Mhh(2)

Complex(dp),Intent(in) :: cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),              & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3)

Real(dp),Intent(inout) :: IntegralSs(500000,10),IntegralVs(25000,9),IntegralVVss(500000,12)

Complex(dp),Intent(inout) :: IntegralSSss(500000,12),IntegralSSst(500000,16),IntegralVSss(500000,12),              & 
& IntegralVSst(500000,16),IntegralVVst(25000,12)

Real(dp),Intent(inout) :: gTVZ,gTAh,gThh(2)

Integer, Intent(inout) :: NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss,NVVst
Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp) :: Boson2(2), mass(4),  Boson4(4) 
Complex(dp) :: coup(4), coup2(8),coupT 
mass(1) = MFe(iIN) 
 
Isum = 16 
Allocate( gSum(3,3,3, Isum) ) 
Allocate( Contribution(3,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=gt1, iIN-1
Isum = 0 
 
If(Abs(MFe(iIN)).gt.(Abs(MFe(gt3))+Abs(MFe(gt2))+Abs(MFe(gt1)))) Then 
!-------------- 
!  VZ 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVZ 
Boson2(2) =gTVZ 
 
Boson4(1) = MVZ 
Boson4(2) =gTVZ 
Boson4(3) = MVZ 
Boson4(4) =gTVZ 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFe(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup(2) = Conjg(cplcFeFeVZL(iIN,gt1)) 
coup(1) = Conjg(cplcFeFeVZR(iIN,gt1)) 
coup(4) = Conjg(cplcFeFeVZL(gt2,gt3)) 
coup(3) = Conjg(cplcFeFeVZR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFe(gt3) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt1) 
 
coup(2) = Conjg(cplcFeFeVZL(iIN,gt3)) 
coup(1) = Conjg(cplcFeFeVZR(iIN,gt3)) 
coup(4) = Conjg(cplcFeFeVZL(gt2,gt1)) 
coup(3) = Conjg(cplcFeFeVZR(gt2,gt1))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFe(gt1) 
mass(4) = MFe(gt3) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplcFeFeVZL(iIN,gt3) 
coup2(2) = cplcFeFeVZR(iIN,gt3) 
coup2(4) = Conjg(cplcFeFeVZL(iIN,gt1)) 
coup2(3) = Conjg(cplcFeFeVZR(iIN,gt1))  
coup2(5) = cplcFeFeVZL(gt2,gt1) 
coup2(6) = cplcFeFeVZR(gt2,gt1) 
coup2(8) = Conjg(cplcFeFeVZL(gt2,gt3)) 
coup2(7) = Conjg(cplcFeFeVZR(gt2,gt3)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFe Fe Propagator: VZ" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ'



!-------------- 
!  Ah 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MAh 
Boson2(2) =gTAh 
 
Boson4(1) = MAh 
Boson4(2) =gTAh 
Boson4(3) = MAh 
Boson4(4) =gTAh 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFe(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup(2) = Conjg(cplcFeFeAhL(iIN,gt1)) 
coup(1) = Conjg(cplcFeFeAhR(iIN,gt1)) 
coup(4) = Conjg(cplcFeFeAhL(gt2,gt3)) 
coup(3) = Conjg(cplcFeFeAhR(gt2,gt3))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFe(gt3) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt1) 
 
coup(2) = Conjg(cplcFeFeAhL(iIN,gt3)) 
coup(1) = Conjg(cplcFeFeAhR(iIN,gt3)) 
coup(4) = Conjg(cplcFeFeAhL(gt2,gt1)) 
coup(3) = Conjg(cplcFeFeAhR(gt2,gt1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFe(gt1) 
mass(4) = MFe(gt3) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplcFeFeAhL(iIN,gt3) 
coup2(2) = cplcFeFeAhR(iIN,gt3) 
coup2(3) = Conjg(cplcFeFeAhL(iIN,gt1)) 
coup2(4) = Conjg(cplcFeFeAhR(iIN,gt1))  
coup2(5) = cplcFeFeAhL(gt2,gt1) 
coup2(6) = cplcFeFeAhR(gt2,gt1) 
coup2(7) = Conjg(cplcFeFeAhL(gt2,gt3)) 
coup2(8) = Conjg(cplcFeFeAhR(gt2,gt3)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFe Fe Propagator: Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah'



!-------------- 
!  hh 
!-------------- 
Do i1=1,2
Isum = Isum + 1 
Boson2(1) = Mhh(i1) 
Boson2(2) =gThh(i1) 
 
Boson4(1) = Mhh(i1) 
Boson4(2) =gThh(i1) 
Boson4(3) = Mhh(i1) 
Boson4(4) =gThh(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFe(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup(2) = Conjg(cplcFeFehhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcFeFehhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplcFeFehhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplcFeFehhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFe(gt3) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt1) 
 
coup(2) = Conjg(cplcFeFehhL(iIN,gt3,i1)) 
coup(1) = Conjg(cplcFeFehhR(iIN,gt3,i1)) 
coup(4) = Conjg(cplcFeFehhL(gt2,gt1,i1)) 
coup(3) = Conjg(cplcFeFehhR(gt2,gt1,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFe(gt1) 
mass(4) = MFe(gt3) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplcFeFehhL(iIN,gt3,i1) 
coup2(2) = cplcFeFehhR(iIN,gt3,i1) 
coup2(3) = Conjg(cplcFeFehhL(iIN,gt1,i1)) 
coup2(4) = Conjg(cplcFeFehhR(iIN,gt1,i1))  
coup2(5) = cplcFeFehhL(gt2,gt1,i1) 
coup2(6) = cplcFeFehhR(gt2,gt1,i1) 
coup2(7) = Conjg(cplcFeFehhL(gt2,gt3,i1)) 
coup2(8) = Conjg(cplcFeFehhR(gt2,gt3,i1)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFe Fe Propagator: hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='hh'
      End Do 



!-------------- 
!  VZ, Ah 
!-------------- 
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MAh 
Boson4(4) = gTAh 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcFeFeVZL(iIN,gt1) 
coup2(2) = cplcFeFeVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFeFeAhL(iIN,gt1)) 
coup2(4) = Conjg(cplcFeFeAhR(iIN,gt1))  
coup2(5) = cplcFeFeVZL(gt2,gt3) 
coup2(6) = cplcFeFeVZR(gt2,gt3) 
coup2(7) = Conjg(cplcFeFeAhL(gt2,gt3)) 
coup2(8) = Conjg(cplcFeFeAhR(gt2,gt3)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFe(gt1) 
mass(4) = MFe(gt3) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplcFeFeVZL(iIN,gt3) 
coup2(2) = cplcFeFeVZR(iIN,gt3) 
coup2(3) = Conjg(cplcFeFeAhL(iIN,gt1)) 
coup2(4) = Conjg(cplcFeFeAhR(iIN,gt1))  
coup2(5) = cplcFeFeVZL(gt2,gt1) 
coup2(6) = cplcFeFeVZR(gt2,gt1) 
coup2(7) = Conjg(cplcFeFeAhL(gt2,gt3)) 
coup2(8) = Conjg(cplcFeFeAhR(gt2,gt3)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFe(gt3) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt1) 
 
coup2(1) = cplcFeFeVZL(iIN,gt3) 
coup2(2) = cplcFeFeVZR(iIN,gt3) 
coup2(3) = Conjg(cplcFeFeAhL(iIN,gt3)) 
coup2(4) = Conjg(cplcFeFeAhR(iIN,gt3))  
coup2(5) = cplcFeFeVZL(gt2,gt1) 
coup2(6) = cplcFeFeVZR(gt2,gt1) 
coup2(7) = Conjg(cplcFeFeAhL(gt2,gt1)) 
coup2(8) = Conjg(cplcFeFeAhR(gt2,gt1)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFe(gt3) 
mass(4) = MFe(gt1) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplcFeFeVZL(iIN,gt1) 
coup2(2) = cplcFeFeVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFeFeAhL(iIN,gt3)) 
coup2(4) = Conjg(cplcFeFeAhR(iIN,gt3))  
coup2(5) = cplcFeFeVZL(gt2,gt3) 
coup2(6) = cplcFeFeVZR(gt2,gt3) 
coup2(7) = Conjg(cplcFeFeAhL(gt2,gt1)) 
coup2(8) = Conjg(cplcFeFeAhR(gt2,gt1)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFe Fe Propagator: VZ,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,Ah'



!-------------- 
!  VZ, hh 
!-------------- 
  Do i2=1,2
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcFeFeVZL(iIN,gt1) 
coup2(2) = cplcFeFeVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFeFehhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFeFehhR(iIN,gt1,i2))  
coup2(5) = cplcFeFeVZL(gt2,gt3) 
coup2(6) = cplcFeFeVZR(gt2,gt3) 
coup2(7) = Conjg(cplcFeFehhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFeFehhR(gt2,gt3,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFe(gt1) 
mass(4) = MFe(gt3) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplcFeFeVZL(iIN,gt3) 
coup2(2) = cplcFeFeVZR(iIN,gt3) 
coup2(3) = Conjg(cplcFeFehhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFeFehhR(iIN,gt1,i2))  
coup2(5) = cplcFeFeVZL(gt2,gt1) 
coup2(6) = cplcFeFeVZR(gt2,gt1) 
coup2(7) = Conjg(cplcFeFehhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFeFehhR(gt2,gt3,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFe(gt3) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt1) 
 
coup2(1) = cplcFeFeVZL(iIN,gt3) 
coup2(2) = cplcFeFeVZR(iIN,gt3) 
coup2(3) = Conjg(cplcFeFehhL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFeFehhR(iIN,gt3,i2))  
coup2(5) = cplcFeFeVZL(gt2,gt1) 
coup2(6) = cplcFeFeVZR(gt2,gt1) 
coup2(7) = Conjg(cplcFeFehhL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplcFeFehhR(gt2,gt1,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFe(gt3) 
mass(4) = MFe(gt1) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplcFeFeVZL(iIN,gt1) 
coup2(2) = cplcFeFeVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFeFehhL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFeFehhR(iIN,gt3,i2))  
coup2(5) = cplcFeFeVZL(gt2,gt3) 
coup2(6) = cplcFeFeVZR(gt2,gt3) 
coup2(7) = Conjg(cplcFeFehhL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplcFeFehhR(gt2,gt1,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFe Fe Propagator: VZ,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,hh'
      End Do 



!-------------- 
!  Ah, hh 
!-------------- 
  Do i2=1,2
Boson4(1) = MAh 
Boson4(2) = gTAh 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcFeFeAhL(iIN,gt1) 
coup2(2) = cplcFeFeAhR(iIN,gt1) 
coup2(3) = Conjg(cplcFeFehhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFeFehhR(iIN,gt1,i2))  
coup2(5) = cplcFeFeAhL(gt2,gt3) 
coup2(6) = cplcFeFeAhR(gt2,gt3) 
coup2(7) = Conjg(cplcFeFehhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFeFehhR(gt2,gt3,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFe(gt1) 
mass(4) = MFe(gt3) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplcFeFeAhL(iIN,gt3) 
coup2(2) = cplcFeFeAhR(iIN,gt3) 
coup2(3) = Conjg(cplcFeFehhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFeFehhR(iIN,gt1,i2))  
coup2(5) = cplcFeFeAhL(gt2,gt1) 
coup2(6) = cplcFeFeAhR(gt2,gt1) 
coup2(7) = Conjg(cplcFeFehhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFeFehhR(gt2,gt3,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFe(gt3) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt1) 
 
coup2(1) = cplcFeFeAhL(iIN,gt3) 
coup2(2) = cplcFeFeAhR(iIN,gt3) 
coup2(3) = Conjg(cplcFeFehhL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFeFehhR(iIN,gt3,i2))  
coup2(5) = cplcFeFeAhL(gt2,gt1) 
coup2(6) = cplcFeFeAhR(gt2,gt1) 
coup2(7) = Conjg(cplcFeFehhL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplcFeFehhR(gt2,gt1,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFe(gt3) 
mass(4) = MFe(gt1) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplcFeFeAhL(iIN,gt1) 
coup2(2) = cplcFeFeAhR(iIN,gt1) 
coup2(3) = Conjg(cplcFeFehhL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFeFehhR(iIN,gt3,i2))  
coup2(5) = cplcFeFeAhL(gt2,gt3) 
coup2(6) = cplcFeFeAhR(gt2,gt3) 
coup2(7) = Conjg(cplcFeFehhL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplcFeFehhR(gt2,gt1,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFe Fe Propagator: Ah,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,hh'
      End Do 



!-------------- 
!  hh, hh 
!-------------- 
Do i1=1,1
  Do i2=i1+1,2
Boson4(1) = Mhh(i1) 
Boson4(2) = gThh(i1) 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcFeFehhL(iIN,gt1,i1) 
coup2(2) = cplcFeFehhR(iIN,gt1,i1) 
coup2(3) = Conjg(cplcFeFehhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFeFehhR(iIN,gt1,i2))  
coup2(5) = cplcFeFehhL(gt2,gt3,i1) 
coup2(6) = cplcFeFehhR(gt2,gt3,i1) 
coup2(7) = Conjg(cplcFeFehhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFeFehhR(gt2,gt3,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFe(gt1) 
mass(4) = MFe(gt3) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplcFeFehhL(iIN,gt3,i1) 
coup2(2) = cplcFeFehhR(iIN,gt3,i1) 
coup2(3) = Conjg(cplcFeFehhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFeFehhR(iIN,gt1,i2))  
coup2(5) = cplcFeFehhL(gt2,gt1,i1) 
coup2(6) = cplcFeFehhR(gt2,gt1,i1) 
coup2(7) = Conjg(cplcFeFehhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFeFehhR(gt2,gt3,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFe(gt3) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt1) 
 
coup2(1) = cplcFeFehhL(iIN,gt3,i1) 
coup2(2) = cplcFeFehhR(iIN,gt3,i1) 
coup2(3) = Conjg(cplcFeFehhL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFeFehhR(iIN,gt3,i2))  
coup2(5) = cplcFeFehhL(gt2,gt1,i1) 
coup2(6) = cplcFeFehhR(gt2,gt1,i1) 
coup2(7) = Conjg(cplcFeFehhL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplcFeFehhR(gt2,gt1,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFe(gt3) 
mass(4) = MFe(gt1) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplcFeFehhL(iIN,gt1,i1) 
coup2(2) = cplcFeFehhR(iIN,gt1,i1) 
coup2(3) = Conjg(cplcFeFehhL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFeFehhR(iIN,gt3,i2))  
coup2(5) = cplcFeFehhL(gt2,gt3,i1) 
coup2(6) = cplcFeFehhR(gt2,gt3,i1) 
coup2(7) = Conjg(cplcFeFehhL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplcFeFehhR(gt2,gt1,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFe Fe Propagator: hh,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='hh,hh'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=gt1, iIN-1
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:16))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MFe(iIN))**3*g
End Subroutine FeToFecFeFe 
 
 
Subroutine FeToFecFuFu(iIN,MFe,MFu,MVZ,MAh,Mhh,cplcFeFeAhL,cplcFeFeAhR,               & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuAhL,cplcFuFuAhR,               & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,IntegralSs,IntegralSSss,               & 
& IntegralVs,IntegralVSss,IntegralVVss,NSs,NSSss,NVs,NVSss,NVVss,gTVZ,gTAh,              & 
& gThh,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFe(3),MFu(3),MVZ,MAh,Mhh(2)

Complex(dp),Intent(in) :: cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),              & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),cplcFuFuhhL(3,3,2),& 
& cplcFuFuhhR(3,3,2),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3)

Real(dp),Intent(inout) :: IntegralSs(500000,10),IntegralVs(25000,9),IntegralVVss(500000,12)

Complex(dp),Intent(inout) :: IntegralSSss(500000,12),IntegralVSss(500000,12)

Real(dp),Intent(inout) :: gTVZ,gTAh,gThh(2)

Integer, Intent(inout) :: NSs,NSSss,NVs,NVSss,NVVss
Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp) :: Boson2(2), mass(4),  Boson4(4) 
Complex(dp) :: coup(4), coup2(8),coupT 
mass(1) = MFe(iIN) 
 
Isum = 16 
Allocate( gSum(3,3,3, Isum) ) 
Allocate( Contribution(3,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=1,3
Isum = 0 
 
If(Abs(MFe(iIN)).gt.(Abs(MFu(gt3))+Abs(MFu(gt2))+Abs(MFe(gt1)))) Then 
!-------------- 
!  VZ 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVZ 
Boson2(2) =gTVZ 
 
Boson4(1) = MVZ 
Boson4(2) =gTVZ 
Boson4(3) = MVZ 
Boson4(4) =gTVZ 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFe(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup(2) = Conjg(cplcFeFeVZL(iIN,gt1)) 
coup(1) = Conjg(cplcFeFeVZR(iIN,gt1)) 
coup(4) = Conjg(cplcFuFuVZL(gt2,gt3)) 
coup(3) = Conjg(cplcFuFuVZR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFu Fu Propagator: VZ" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ'



!-------------- 
!  Ah 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MAh 
Boson2(2) =gTAh 
 
Boson4(1) = MAh 
Boson4(2) =gTAh 
Boson4(3) = MAh 
Boson4(4) =gTAh 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFe(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup(2) = Conjg(cplcFeFeAhL(iIN,gt1)) 
coup(1) = Conjg(cplcFeFeAhR(iIN,gt1)) 
coup(4) = Conjg(cplcFuFuAhL(gt2,gt3)) 
coup(3) = Conjg(cplcFuFuAhR(gt2,gt3))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFu Fu Propagator: Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah'



!-------------- 
!  hh 
!-------------- 
Do i1=1,2
Isum = Isum + 1 
Boson2(1) = Mhh(i1) 
Boson2(2) =gThh(i1) 
 
Boson4(1) = Mhh(i1) 
Boson4(2) =gThh(i1) 
Boson4(3) = Mhh(i1) 
Boson4(4) =gThh(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFe(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup(2) = Conjg(cplcFeFehhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcFeFehhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplcFuFuhhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplcFuFuhhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFu Fu Propagator: hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='hh'
      End Do 



!-------------- 
!  VZ, Ah 
!-------------- 
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MAh 
Boson4(4) = gTAh 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplcFeFeVZL(iIN,gt1) 
coup2(2) = cplcFeFeVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFeFeAhL(iIN,gt1)) 
coup2(4) = Conjg(cplcFeFeAhR(iIN,gt1))  
coup2(5) = cplcFuFuVZL(gt2,gt3) 
coup2(6) = cplcFuFuVZR(gt2,gt3) 
coup2(7) = Conjg(cplcFuFuAhL(gt2,gt3)) 
coup2(8) = Conjg(cplcFuFuAhR(gt2,gt3)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFu Fu Propagator: VZ,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,Ah'



!-------------- 
!  VZ, hh 
!-------------- 
  Do i2=1,2
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplcFeFeVZL(iIN,gt1) 
coup2(2) = cplcFeFeVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFeFehhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFeFehhR(iIN,gt1,i2))  
coup2(5) = cplcFuFuVZL(gt2,gt3) 
coup2(6) = cplcFuFuVZR(gt2,gt3) 
coup2(7) = Conjg(cplcFuFuhhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFuFuhhR(gt2,gt3,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFu Fu Propagator: VZ,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,hh'
      End Do 



!-------------- 
!  Ah, hh 
!-------------- 
  Do i2=1,2
Boson4(1) = MAh 
Boson4(2) = gTAh 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplcFeFeAhL(iIN,gt1) 
coup2(2) = cplcFeFeAhR(iIN,gt1) 
coup2(3) = Conjg(cplcFeFehhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFeFehhR(iIN,gt1,i2))  
coup2(5) = cplcFuFuAhL(gt2,gt3) 
coup2(6) = cplcFuFuAhR(gt2,gt3) 
coup2(7) = Conjg(cplcFuFuhhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFuFuhhR(gt2,gt3,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFu Fu Propagator: Ah,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,hh'
      End Do 



!-------------- 
!  hh, hh 
!-------------- 
Do i1=1,1
  Do i2=i1+1,2
Boson4(1) = Mhh(i1) 
Boson4(2) = gThh(i1) 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplcFeFehhL(iIN,gt1,i1) 
coup2(2) = cplcFeFehhR(iIN,gt1,i1) 
coup2(3) = Conjg(cplcFeFehhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFeFehhR(iIN,gt1,i2))  
coup2(5) = cplcFuFuhhL(gt2,gt3,i1) 
coup2(6) = cplcFuFuhhR(gt2,gt3,i1) 
coup2(7) = Conjg(cplcFuFuhhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFuFuhhR(gt2,gt3,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFu Fu Propagator: hh,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='hh,hh'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=1,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:16))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MFe(iIN))**3*g
End Subroutine FeToFecFuFu 
 
 
Subroutine FeToFecFvFv(iIN,MFe,MVZ,MVWm,MHm,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvHmL,      & 
& cplcFeFvHmR,cplcFeFvVWmL,cplcFeFvVWmR,cplcFvFecHmL,cplcFvFecHmR,cplcFvFecVWmL,         & 
& cplcFvFecVWmR,cplcFvFvVZL,cplcFvFvVZR,IntegralSs,IntegralSSss,IntegralVs,              & 
& IntegralVSss,IntegralVSst,IntegralVVss,IntegralVVst,NSs,NSSss,NVs,NVSss,               & 
& NVSst,NVVss,NVVst,gTVZ,gTVWm,gTHm,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFe(3),MVZ,MVWm,MHm(2)

Complex(dp),Intent(in) :: cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFvHmL(3,3,2),cplcFeFvHmR(3,3,2),              & 
& cplcFeFvVWmL(3,3),cplcFeFvVWmR(3,3),cplcFvFecHmL(3,3,2),cplcFvFecHmR(3,3,2),           & 
& cplcFvFecVWmL(3,3),cplcFvFecVWmR(3,3),cplcFvFvVZL(3,3),cplcFvFvVZR(3,3)

Real(dp),Intent(inout) :: IntegralSs(500000,10),IntegralVs(25000,9),IntegralVVss(500000,12)

Complex(dp),Intent(inout) :: IntegralSSss(500000,12),IntegralVSss(500000,12),IntegralVSst(500000,16),              & 
& IntegralVVst(25000,12)

Real(dp),Intent(inout) :: gTVZ,gTVWm,gTHm(2)

Integer, Intent(inout) :: NSs,NSSss,NVs,NVSss,NVSst,NVVss,NVVst
Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp) :: Boson2(2), mass(4),  Boson4(4) 
Complex(dp) :: coup(4), coup2(8),coupT 
mass(1) = MFe(iIN) 
 
Isum = 16 
Allocate( gSum(3,3,3, Isum) ) 
Allocate( Contribution(3,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=1,3
Isum = 0 
 
If(Abs(MFe(iIN)).gt.(Abs(0.)+Abs(0.)+Abs(MFe(gt1)))) Then 
!-------------- 
!  VZ 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVZ 
Boson2(2) =gTVZ 
 
Boson4(1) = MVZ 
Boson4(2) =gTVZ 
Boson4(3) = MVZ 
Boson4(4) =gTVZ 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFe(gt1) 
mass(3) = -0. 
mass(4) = 0. 
 
coup(2) = Conjg(cplcFeFeVZL(iIN,gt1)) 
coup(1) = Conjg(cplcFeFeVZR(iIN,gt1)) 
coup(4) = Conjg(cplcFvFvVZL(gt2,gt3)) 
coup(3) = Conjg(cplcFvFvVZR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFv Fv Propagator: VZ" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ'



!-------------- 
!  VWm 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVWm 
Boson2(2) =gTVWm 
 
Boson4(1) = MVWm 
Boson4(2) =gTVWm 
Boson4(3) = MVWm 
Boson4(4) =gTVWm 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = 0. 
mass(3) = -0. 
mass(4) = MFe(gt1) 
 
coup(2) = Conjg(cplcFeFvVWmL(iIN,gt3)) 
coup(1) = Conjg(cplcFeFvVWmR(iIN,gt3)) 
coup(4) = Conjg(cplcFvFecVWmL(gt2,gt1)) 
coup(3) = Conjg(cplcFvFecVWmR(gt2,gt1))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFv Fv Propagator: VWm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VWm'



!-------------- 
!  Hm 
!-------------- 
Do i1=1,2
Isum = Isum + 1 
Boson2(1) = MHm(i1) 
Boson2(2) =gTHm(i1) 
 
Boson4(1) = MHm(i1) 
Boson4(2) =gTHm(i1) 
Boson4(3) = MHm(i1) 
Boson4(4) =gTHm(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = 0. 
mass(3) = -0. 
mass(4) = MFe(gt1) 
 
coup(2) = Conjg(cplcFeFvHmL(iIN,gt3,i1)) 
coup(1) = Conjg(cplcFeFvHmR(iIN,gt3,i1)) 
coup(4) = Conjg(cplcFvFecHmL(gt2,gt1,i1)) 
coup(3) = Conjg(cplcFvFecHmR(gt2,gt1,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFv Fv Propagator: Hm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Hm'
      End Do 



!-------------- 
!  VZ, VWm 
!-------------- 
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MVWm 
Boson4(4) = gTVWm 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = 0. 
mass(4) = MFe(gt1) 
mass(3) = -0. 
 
coup2(1) = cplcFeFeVZL(iIN,gt1) 
coup2(2) = cplcFeFeVZR(iIN,gt1) 
coup2(4) = Conjg(cplcFeFvVWmL(iIN,gt3)) 
coup2(3) = Conjg(cplcFeFvVWmR(iIN,gt3))  
coup2(5) = cplcFvFvVZL(gt2,gt3) 
coup2(6) = cplcFvFvVZR(gt2,gt3) 
coup2(8) = Conjg(cplcFvFecVWmL(gt2,gt1)) 
coup2(7) = Conjg(cplcFvFecVWmR(gt2,gt1)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFv Fv Propagator: VZ,VWm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,VWm'



!-------------- 
!  VZ, Hm 
!-------------- 
  Do i2=1,2
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MHm(i2) 
Boson4(4) = gTHm(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = 0. 
mass(4) = MFe(gt1) 
mass(3) = -0. 
 
coup2(1) = cplcFeFeVZL(iIN,gt1) 
coup2(2) = cplcFeFeVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFeFvHmL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFeFvHmR(iIN,gt3,i2))  
coup2(5) = cplcFvFvVZL(gt2,gt3) 
coup2(6) = cplcFvFvVZR(gt2,gt3) 
coup2(7) = Conjg(cplcFvFecHmL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplcFvFecHmR(gt2,gt1,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFv Fv Propagator: VZ,Hm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,Hm'
      End Do 



!-------------- 
!  VWm, Hm 
!-------------- 
  Do i2=1,2
Boson4(1) = MVWm 
Boson4(2) = gTVWm 
Boson4(3) = MHm(i2) 
Boson4(4) = gTHm(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = 0. 
mass(3) = -0. 
mass(4) = MFe(gt1) 
 
coup2(1) = cplcFeFvVWmL(iIN,gt3) 
coup2(2) = cplcFeFvVWmR(iIN,gt3) 
coup2(3) = Conjg(cplcFeFvHmL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFeFvHmR(iIN,gt3,i2))  
coup2(5) = cplcFvFecVWmL(gt2,gt1) 
coup2(6) = cplcFvFecVWmR(gt2,gt1) 
coup2(7) = Conjg(cplcFvFecHmL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplcFvFecHmR(gt2,gt1,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFv Fv Propagator: VWm,Hm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VWm,Hm'
      End Do 



!-------------- 
!  Hm, Hm 
!-------------- 
Do i1=1,1
  Do i2=i1+1,2
Boson4(1) = MHm(i1) 
Boson4(2) = gTHm(i1) 
Boson4(3) = MHm(i2) 
Boson4(4) = gTHm(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = 0. 
mass(3) = -0. 
mass(4) = MFe(gt1) 
 
coup2(1) = cplcFeFvHmL(iIN,gt3,i1) 
coup2(2) = cplcFeFvHmR(iIN,gt3,i1) 
coup2(3) = Conjg(cplcFeFvHmL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFeFvHmR(iIN,gt3,i2))  
coup2(5) = cplcFvFecHmL(gt2,gt1,i1) 
coup2(6) = cplcFvFecHmR(gt2,gt1,i1) 
coup2(7) = Conjg(cplcFvFecHmL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplcFvFecHmR(gt2,gt1,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFv Fv Propagator: Hm,Hm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Hm,Hm'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=1,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:16))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MFe(iIN))**3*g
End Subroutine FeToFecFvFv 
 
 
Subroutine FeToFvcFuFd(iIN,MFu,MFd,MVWm,MHm,MFe,cplcFeFvHmL,cplcFeFvHmR,              & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplcFuFdcHmL,cplcFuFdcHmR,cplcFuFdcVWmL,cplcFuFdcVWmR,       & 
& IntegralSs,IntegralSSss,IntegralVs,IntegralVSss,IntegralVVss,NSs,NSSss,NVs,            & 
& NVSss,NVVss,gTVWm,gTHm,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFu(3),MFd(3),MVWm,MHm(2),MFe(3)

Complex(dp),Intent(in) :: cplcFeFvHmL(3,3,2),cplcFeFvHmR(3,3,2),cplcFeFvVWmL(3,3),cplcFeFvVWmR(3,3),            & 
& cplcFuFdcHmL(3,3,2),cplcFuFdcHmR(3,3,2),cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3)

Real(dp),Intent(inout) :: IntegralSs(500000,10),IntegralVs(25000,9),IntegralVVss(500000,12)

Complex(dp),Intent(inout) :: IntegralSSss(500000,12),IntegralVSss(500000,12)

Real(dp),Intent(inout) :: gTVWm,gTHm(2)

Integer, Intent(inout) :: NSs,NSSss,NVs,NVSss,NVVss
Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp) :: Boson2(2), mass(4),  Boson4(4) 
Complex(dp) :: coup(4), coup2(8),coupT 
mass(1) = MFe(iIN) 
 
Isum = 9 
Allocate( gSum(3,3,3, Isum) ) 
Allocate( Contribution(3,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,3
      Do gt2=1,3
        Do gt3=1,3
Isum = 0 
 
If(Abs(MFe(iIN)).gt.(Abs(MFd(gt3))+Abs(MFu(gt2))+Abs(0.))) Then 
!-------------- 
!  VWm 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVWm 
Boson2(2) =gTVWm 
 
Boson4(1) = MVWm 
Boson4(2) =gTVWm 
Boson4(3) = MVWm 
Boson4(4) =gTVWm 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = 0. 
mass(3) = -MFu(gt2) 
mass(4) = MFd(gt3) 
 
coup(2) = Conjg(cplcFeFvVWmL(iIN,gt1)) 
coup(1) = Conjg(cplcFeFvVWmR(iIN,gt1)) 
coup(4) = Conjg(cplcFuFdcVWmL(gt2,gt3)) 
coup(3) = Conjg(cplcFuFdcVWmR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fv cFu Fd Propagator: VWm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VWm'



!-------------- 
!  Hm 
!-------------- 
Do i1=1,2
Isum = Isum + 1 
Boson2(1) = MHm(i1) 
Boson2(2) =gTHm(i1) 
 
Boson4(1) = MHm(i1) 
Boson4(2) =gTHm(i1) 
Boson4(3) = MHm(i1) 
Boson4(4) =gTHm(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = 0. 
mass(3) = -MFu(gt2) 
mass(4) = MFd(gt3) 
 
coup(2) = Conjg(cplcFeFvHmL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcFeFvHmR(iIN,gt1,i1)) 
coup(4) = Conjg(cplcFuFdcHmL(gt2,gt3,i1)) 
coup(3) = Conjg(cplcFuFdcHmR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fv cFu Fd Propagator: Hm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Hm'
      End Do 



!-------------- 
!  VWm, Hm 
!-------------- 
  Do i2=1,2
Boson4(1) = MVWm 
Boson4(2) = gTVWm 
Boson4(3) = MHm(i2) 
Boson4(4) = gTHm(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = 0. 
mass(3) = -MFu(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplcFeFvVWmL(iIN,gt1) 
coup2(2) = cplcFeFvVWmR(iIN,gt1) 
coup2(3) = Conjg(cplcFeFvHmL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFeFvHmR(iIN,gt1,i2))  
coup2(5) = cplcFuFdcVWmL(gt2,gt3) 
coup2(6) = cplcFuFdcVWmR(gt2,gt3) 
coup2(7) = Conjg(cplcFuFdcHmL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFuFdcHmR(gt2,gt3,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fv cFu Fd Propagator: VWm,Hm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VWm,Hm'
      End Do 



!-------------- 
!  Hm, Hm 
!-------------- 
Do i1=1,1
  Do i2=i1+1,2
Boson4(1) = MHm(i1) 
Boson4(2) = gTHm(i1) 
Boson4(3) = MHm(i2) 
Boson4(4) = gTHm(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = 0. 
mass(3) = -MFu(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplcFeFvHmL(iIN,gt1,i1) 
coup2(2) = cplcFeFvHmR(iIN,gt1,i1) 
coup2(3) = Conjg(cplcFeFvHmL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFeFvHmR(iIN,gt1,i2))  
coup2(5) = cplcFuFdcHmL(gt2,gt3,i1) 
coup2(6) = cplcFuFdcHmR(gt2,gt3,i1) 
coup2(7) = Conjg(cplcFuFdcHmL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFuFdcHmR(gt2,gt3,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fv cFu Fd Propagator: Hm,Hm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Hm,Hm'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1,3
      Do gt2=1,3
        Do gt3=1,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:9))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MFe(iIN))**3*g
End Subroutine FeToFvcFuFd 
 
 
End Module Fe3Decays_THDMIIIHB 
 
