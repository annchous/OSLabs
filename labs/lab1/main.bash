#!/bin/bash
if [[ $# -lt 1 ]]
	then echo "Not enough parameters!"
else
	if [[ "$1" = "calc" ]]
	then
		if [[ $# -ne 4 ]]
			then echo "Wrong parameters amount!"
		else
			echo "Calculator"
		fi
	fi
fi
