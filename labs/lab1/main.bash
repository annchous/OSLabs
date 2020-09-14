#!/bin/bash

path=$( pwd )

if [[ $# -lt 1 ]]
	then echo "Not enough parameters!"
else
	case  "$1"  in
	"calc" )
		if [[ $# -ne 4 ]]
			then echo "Wrong parameters amount! You entered $# parameters but need 4."
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
	esac
fi

exit 0
