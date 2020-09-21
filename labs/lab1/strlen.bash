#!/bin/bash

if ! [[ $* =~ ^$ ]] && [[ $# -eq 0 ]]
then
	echo -e "\e[31mNot enough parameters!"
	echo -e "Where is your string, dude?\e[0m"
	exit 1
fi

string=$*
echo ${#string}

exit 0
