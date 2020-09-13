#!/bin/bash
case "$1" in
	"sum" )
	let sum=$(( $2 + $3 ))
	echo $sum
	;;
	"sub" )
	let sub=$(( $2 - $3 ))
	echo $sub
	;;
	"mul" )
	let mul=$(( $2 * $3 ))
	echo $mul
	;;
	"div" )
	let div=$(( $2 / $3 ))
	echo $div
	;;
	* )
	echo "Wrong parameter!"
	show-help
	;;
esac

show-help()
{
echo "Calculator Commands"
echo "--------------------"
echo "- sum value1 value2: get sum value1 + value2"
echo "- sub value1 value2: get subtraction value1 - value2"
echo "- mul value1 value2: get multiplication value1 * value2"
echo "- div value1 value2: get division value1 / value2"
echo "--------------------"
}

exit 0
