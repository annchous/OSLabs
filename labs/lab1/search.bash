#!/bin/bash

DIR=$(find / -type d -name '$1')
echo "$DIR"

if cd "$1" ;
then
	grep -r "$2" $1
elif cd "$DIR" ;
then
	grep -r "$2" $DIR
else
	echo "Invalid directory!"
	exit 1
fi

exit 0
