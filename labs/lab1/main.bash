#!/bin/bash

ParamsAmountError()
{
echo -e "\e[31mWrong parameters amount!\e[0m"
}

WrongCommand()
{
echo -e "\e[31mCommand $1 does not exist!\e[0m"
echo -e "\e[36mWould you like to get a help list? (y/n)\e[0m"
read ans
if [[ $ans = "y" ]]
then
	sh ./help.bash
	exit 0
else if [[ $ans = "n" ]]
then
	echo -e "\e[36mOkay, goodbye!\e[0m"
	exit 0
else
	echo -e "\e[36mI don't understand you, dude! Try again...\e[0m"
	exit 0
fi
fi
}

CheckParamsAmount()
{
if [[ $1 -ne $2 ]]
	then ParamsAmountError
	echo "You entered $1 parameters but need $2."
	exit 1
fi
}

SearchFunc()
{
if [[ $# -ne 2 ]]
then
	ParamsAmountError
	exit 1
fi
}

StrlenFunc()
{
if [[ $1 -lt 2 ]]
then
	CheckParamsAmount $1 2
fi
shift
sh ./strlen.bash $*
}

# MAIN PART

if [[ $# -lt 1 ]]
	then ParamsAmountError
else
	case  "$1"  in
	"calc" )
	CheckParamsAmount $# 4
	sh ./calculator.bash $2 $3 $4
	;;
	"search" )
		sh ./search.bash $2 $3
		echo $?
	;;
	"reverse" )
	sh ./reverse.bash $2 $3
	;;
	"strlen" )
	args=$#
	shift
	StrlenFunc $args $*
	;;
	"exit" )
		if [[ $# -eq 2 ]]
		then
			sh ./exit.bash $2
		else
			sh ./exit.bash
		fi
		echo "Program finished with exit code $?"
	;;
	"help" )
		sh ./help.bash
	;;
	* )
		WrongCommand $1
	esac
fi

exit 0
