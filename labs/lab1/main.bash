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

# MAIN PART

if [[ $# -lt 1 ]]
	then ParamsAmountError
else
	case  "$1"  in
	"calc" )
		if [[ $# -ne 4 ]]
			then
			ParamsAmountError
			echo "You entered $# parameters but need 4."
		else
			sh ./calculator.bash $2 $3 $4
		fi
	;;
	"search" )
		sh ./search.bash $2 $3
		echo $?
	;;
	"strlen" )
		shift
		sh ./strlen.bash $*
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
