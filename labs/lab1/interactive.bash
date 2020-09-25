#!/bin/bash

Menu()
{
echo -e "\e[36mHey, dude! Do you want to have some fun?"
echo -e "Choose one command from the following list below.\e[0m"
echo ""
echo -e "\e[35ma. calc"
echo -e "b. search"
echo -e "c. reverse"
echo -e "d. strlen"
echo -e "e. log"
echo -e "f. exit"
echo -e "g. help"
echo -e "h. interactive"
echo -e "Press q to quit.\e[0m"
}

NoAccess()
{
echo -e "\e[31mCannot access script!\e[0m"
exit 1
}

Calc()
{
if ! [[ -e ./calculator.bash ]]
then
	NoAccess
fi
echo -e "\e[36mPlease, enter 3 arguments:"
echo -e "1. sum/sub/mul/div option"
echo -e "2. value 1"
echo -e "3. value 2"
echo -e "in format: option value1 value2\e[0m"
read option val1 val2
sh ./calculator.bash $option $val1 $val2
}

Search()
{
if ! [[ -e ./search.bash ]]
then
	NoAccess
fi
echo -e "\e[36mPlease, enter 2 arguments:"
echo -e "1. directory"
echo -e "2. regex"
echo -e "int format: directory regex\e[0m"
read dir regex
sh ./search.bash $dir $regex
}

Reverse()
{
if ! [[ -e ./reverse.bash ]]
then
	NoAccess
fi
echo -e "\e[36mPlease, enter 2 arguments:"
echo -e "1. source file"
echo -e "2. end file"
echo -e "in format: sourcefile endfile\e[0m"
read sfile efile
sh ./reverse.bash $sfile $efile
}

Strlen()
{
if ! [[ -e ./strlen.bash ]]
then
	NoAccess
fi
echo -e "\e[36mPlease, enter 1 argument:"
echo -e "1. string"
echo -e "in format: string\e[0m"
read str
eval "string=($str)"
if [[ -z $str ]]
then
	sh ./strlen.bash
else
	sh ./strlen.bash "${string[0]}"
fi
}

Exit()
{
if ! [[ -e ./exit.bash ]]
then
	NoAccess
fi
echo -e "\e[36mPlease, enter an exit code (default = 0)\e[0m"
read ecode
if [[ -n $ecode ]]
then
	if ! [[ $ecode =~ ^[-]?[0-9]+?$ ]]
then
		echo -e "\e[31mArgument $ecode is not an integer number!\e[0m"
	exit 1
	else
		exec sh ./exit.bash $ecode
	fi
else
	exec sh ./exit.bash 0
fi
}

while true
do
	Menu
	read command
	if [[ $command = "a" ]] || [[ $command = "calc" ]]
	then
		Calc
	else if [[ $command = "b" ]] || [[ $command = "search" ]]
	then
		Search
	else if [[ $command = "c" ]] || [[ $command = "reverse" ]]
	then
		Reverse
	else if [[ $command = "d" ]] || [[ $command = "strlen" ]]
	then
		Strlen
	else if [[ $command = "e" ]] || [[ $command = "log" ]]
	then
		if ! [[ -e ./log.bash ]]
		then
			NoAccess
		fi
		sh ./log.bash
	else if [[ $command = "f" ]] || [[ $command = "exit" ]]
	then
		Exit
	else if [[ $command = "g" ]] || [[ $command = "help" ]]
	then
		if ! [[ -e ./help.bash ]]
		then
			NoAccess
		fi
		sh ./help.bash
	else if [[ $command = "h" ]] || [[ $command = "interactive" ]]
	then
		if ! [[ -e ./interactive.bash ]]
		then
			NoAccess
		fi
		sh ./interactive.bash
	else if [[ $command = "q" ]] || [[ $command = "quit" ]]
	then
		exit 0
	else
		echo -e "\e[35mSorry, dude, but I don't understand you..."
		echo -e "Would you like to get menu? (y/n)"
		echo -e "If you wouldn't, program will finish.\e[0m"
		read ans
		if ! [[ $ans = "y" ]]
		then
			exit 0
		fi
	fi
	fi
	fi
	fi
	fi
	fi
	fi
	fi
	fi
done

exit 0
