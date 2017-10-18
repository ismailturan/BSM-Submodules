#!/usr/bin/env bash
#http://www.artificialworlds.net/blog/2012/10/17/bash-associative-array-examples/
source functions.sh
CHECK=False
if [ $CHECK == True ];then  
    cd SPHENO
    if [ "$(grep -E '\#\s*F90\s*=\s*gfortran' Makefile)" ];then
	sed -i 's/\# F90 = gfortran/F90 = gfortran/' Makefile
	sed -ri 's/^F90 = ifort/\# F90 = ifort/' Makefile
    fi    

    cd ../calchep
    make
    make
    cd ../micromegas
    make
    make
    cd ..
fi

# Install generated codes in several tools
#get MODEL
#TODO: Check against SARAH/Models DIRs
MDL #from functions.sh: fill global arrat mdl
MODELDIR=${mdl[MODELDIR]}
MODEL=${mdl[MODEL]}
sep=${mdl[sep]}

echo $MODELDIR$sep$MODEL

#Check
if [ ! -d SARAH/Models/$MODELDIR$sep$MODEL ] && [ -d  BSM/SARAH/Models$MODELDIR$sep$MODEL ]; then
        mkdir -p SARAH/Models/$MODELDIR$sep$MODEL
	cp -r BSM/SARAH/Models/$MODELDIR$sep$MODEL/*  SARAH/Models/$MODELDIR$sep$MODEL
fi

declare -A ModelDir=( [SPHENO]="" [calchep]=""  [micromegas]="" [madgraph]=models )
declare -A ModelDir2=( [SPHENO]="" [calchep]="models"  [micromegas]="work/models" [madgraph]="" )
declare -A ModelExec=( [SPHENO]="" [calchep]="./mkWORKdir"  [micromegas]="./newProject" [madgraph]=""  )
for tool in "${!ModelDir[@]}";do
    echo $tool
    if [ ! -d $tool/${ModelDir[$tool]}$MODELDIR$MODEL ] && [ -d  BSM/SPHENO/$MODELDIR$MODEL ]; then
	if [ "${ModelExec[$tool]}" ];then
	    cd $tool
	    pwd
	    echo ${ModelExec[$tool]}
	    ${ModelExec[$tool]} $MODELDIR$MODEL
	    cd ..
	fi
	cp -r BSM/$tool/$MODELDIR$MODEL/ $tool/${ModelDir[$tool]}
	if [ "$tool" == calchep ] || [ "$tool" == micromegas ];then
	    cp -r BSM/$tool/$MODELDIR$MODEL/* $tool/$MODELDIR$MODEL/${ModelDir2[$tool]}
	fi
	if [ "$tool" == SPHENO ];then
	    cd $tool
	    make Model=$MODELDIR$MODEL
	    cd ..
	fi

	if [ "$tool" == micromegas ];then
	    PWD=$(pwd)
	    cd $tool/$MODELDIR$MODEL
	    make main=CalcOmega_with_DDetection_MOv4.3.cpp
	    cd "$PWD"
	fi
	
    fi    		     
done

