#!/usr/bin/env bash
#http://www.artificialworlds.net/blog/2012/10/17/bash-associative-array-examples/
git submodule update --init --recursive
if [ "$1" == "--help" ] || [ "$1" == "-h" ];then
    echo USAGE $0 [--butler] [--clean]
    echo "Install from BSM dirs or..."
    echo "if option --butler:"
    echo "run ./butler on branch model"
    echo "Default model is SM"
    echo "if option --clean:"
    echo "remove Model files directories"
    exit
fi
source functions.sh
CHECK=True
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

SUMMARY="===============================================================================
Summary
===============================================================================\n"


# Install generated codes in several tools
#get MODEL
#TODO: Check against SARAH/Models DIRs
MDL #from functions.sh: fill global arrat mdl
MODELDIR=${mdl[MODELDIR]}
MODEL=${mdl[MODEL]}
sep=${mdl[sep]}

echo $MODELDIR$sep$MODEL

#Check
if [ ! -d SARAH/Models/$MODELDIR$sep$MODEL ] && [ -d  BSM/SARAH/Models/$MODELDIR$sep$MODEL ]; then
        mkdir -p SARAH/Models/$MODELDIR$sep$MODEL
	cp -r BSM/SARAH/Models/$MODELDIR$sep$MODEL/*  SARAH/Models/$MODELDIR$sep$MODEL
fi
if [ "$1" == '--butler' ];then
    ./butler $MODELDIR$sep$MODEL

    printf "===============================================================================\n"
    printf "\nWaiting for 180s (Use ./CalcRGEs.sh directly)\nSkip RGEs compilation? (y/n)"
    read -6 180 yn
    if [ "$yn" != y ];then
	./CalRGEs.sh
    fi

    
    exit
fi
FULLMODELNAME=$(echo $MODELDIR$MODEL| sed 's/-//g')

declare -A ModelDir=( [SPHENO]="" [calchep]=""  [micromegas]="" [madgraph]=models )
declare -A ModelDir2=( [SPHENO]="" [calchep]="models"  [micromegas]="work/models" [madgraph]="" )
declare -A ModelExec=( [SPHENO]="" [calchep]="./mkWORKdir"  [micromegas]="./newProject" [madgraph]=""  )
if [ "$1" == '--clean' ];then
    echo "Deleting installed model files..."
    for tool in "${!ModelDir[@]}";do
	SUBMODEL=""
	if [ "${ModelDir[$tool]}"  ];then
	    SUBMODEL=${ModelDir[$tool]}/
	fi

	if [ $FULLMODELNAME  ] && [ -d $tool/${SUBMODEL}$FULLMODELNAME ];then
	    rm -rf $tool/${SUBMODEL}$FULLMODELNAME
	fi
    done
    exit
fi
for tool in "${!ModelDir[@]}";do
    echo installing BSM/$tool/$FULLMODELNAME ...

    if [ ! -d  BSM/$tool/$FULLMODELNAME ];then
	echo ERROR! run first:
	echo cd BSM
	echo ./output.sh
    fi
    if [ ! -d $tool/${ModelDir[$tool]}/$FULLMODELNAME ] && [ -d  BSM/$tool/$FULLMODELNAME ]; then
	# change to proper branch
	create_branch="-b"
        if [ -f BSM/$tool/$FULLMODELNAME/VERSION ];then
	    version="$(cat BSM/$tool/$FULLMODELNAME/VERSION)"
	    cd $tool
	    if [ $version ] && [ "$(git branch | grep -E '\s+'$version)" ]; then
		create_branch=""
	    fi    
	    git checkout $create_branch $version
	    echo git checkout $create_branch $version
	    cd ..
	fi
	# Creates $FULLMODELNAME with command if necessary
	if [ "${ModelExec[$tool]}" ];then
	    cd $tool
	    #Be sure to compile inside the last branch
	    make
	    make 
	    echo ${ModelExec[$tool]}
	    ${ModelExec[$tool]} $FULLMODELNAME
	    cd ..
	fi
	# Copy files into the proper model directory
	cp -r BSM/$tool/$FULLMODELNAME $tool/${ModelDir[$tool]}
	if [ "$tool" == calchep ] || [ "$tool" == micromegas ];then
	    cp -r BSM/$tool/$FULLMODELNAME/* $tool/$FULLMODELNAME/${ModelDir2[$tool]}
	fi
	# Creates executables where necessary
	if [ "$tool" == SPHENO ];then
	    cd $tool
	    make Model=$FULLMODELNAME
	    cd ..
	fi

	if [ "$tool" == micromegas ];then
	    oldPWD="$PWD"
	    cd $tool/$FULLMODELNAME
	    make main=CalcOmega_with_DDetection_MOv4.3.cpp
	    cd "$oldPWD"
	fi
	executable=""
	if [ $tool == SPHENO ] ||  [ $tool == micromegas ];then
	    executable=" and executable "
	fi
	
	SUMMARY=${SUMMARY}$(printf "%-15s %s" $tool ": code$executable located in ./$tool/$FULLMODELNAME")"\n"

    fi
done
printf "$SUMMARY"
