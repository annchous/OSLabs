#!/bin/bash

show_help() 
{
echo -e "\e[35mCalculator Commands"
echo -e "--------------------"
echo -e "- sum value1 value2: get sum value1 + value2"
echo -e "- sub value1 value2: get subtraction value1 - value2"
echo -e "- mul value1 value2: get multiplication value1 * value2"
echo -e "- div value1 value2: get division value1 / value2"
echo -e "--------------------\e[0m"
}

WrongCommand()
{
echo -e "\e[32mCommand $1 does not exist!\e[0m"
echo -e "\e[36mWould you like to get a Calculator help list? (y/n)\e[0m"
read ans
if [[ "$ans" = "y" ]]
then
	show_help
	exit 0
else if [[ "$ans" == "n" ]]
then
	echo -e "\e[36mOkay, goodbye!\e[0m"
	exit 0
else
	echo -e "\e[36mI don't understand you, dude! Try again...\e[0m"
	exit 1
fi
fi
}

DivisionByZeroError()
{
echo -e "\e[36mAre you crazy, dude?\e[0m"
echo -e "\e[31mDivision by zero is not possible!\e[0m"
exit 1
}

BothInteger()
{
if [[ $1 =~ ^[+-]?[0-9]+?$ ]] && [[ $2 =~ ^[+-]?[0-9]+?$ ]]
then
	return 0
else
	return 1
fi
}

SumFunc()
{
if BothInteger $1 $2
then
	res=$(( $1 + $2 ))
	echo $res
	return 0
else
	res=$( echo "$1 + $2" | bc -l )
	echo $res
	return 0
fi
return 1
}

SubFunc()
{
if BothInteger $1 $2
then
	res=$(( $1 - $2 ))
	echo $res
	return 0
else
	res=$( echo "$1 - $2" | bc -l )
	echo $res
	return 0
fi
return 1
}

MulFunc()
{
if BothInteger $1 $2
then
	res=$(( $1 * $2 ))
	echo $res
	return 0
else
	res=$( echo "$1 * $2" | bc -l )
	echo $res
	return 0
fi
return 1
}

DivFunc()
{
if [[ $2 =~ ^[+-]?[0]+([.][0]+)?$ ]]
then
	DivisionByZeroError
fi
if BothInteger $1 $2
then
	div=$(( $1 / $2 ))
	echo $div
	return 0
else
	div=$( echo "$1 / $2" | bc -l )
	echo $div
	return 0
fi
return 1
}

if [[ $# -ne 3 ]]
then
	echo -e "\e[31mWrong parameters amount!\e[0m\nYou entered $# parameter(s) but need 3.\e[0m"
	exit 1
fi

if ! [[ $2 =~ ^[+-]?[0-9]+$ ]] || ! [[ $3 =~ ^[+-]?[0-9]+$ ]]
then
	if ! [[ $2 =~ ^[+-]?[0-9]+([.][0-9]+)?$ ]] || ! [[ $3 =~ ^[+-]?[0-9]+([.][0-9]+)?$ ]]
	then
	echo -e "\e[31mWrong arguments! They should be two numbers!\e[0m"
	exit 1
	fi
fi

case "$1" in
	"sum" )
	SumFunc $2 $3
	;;
	"sub" )
	SubFunc $2 $3
	;;
	"mul" )
	MulFunc $2 $3
	;;
	"div" )
	DivFunc $2 $3
	;;
	* )
	WrongCommand $1
	;;
esac

exit 0
