#!/bin/bash
case "$1" in
	"sum" )
	let sum=`expr $2 + $3`
	echo $sum
	;;
esac
exit 0
