#!/usr/bin/bash

string=$2
abbNumber=$1

charNumber=`wc -c $string`


if [[ charNumber -ge abbNumber ]]; then
	echo ${string:0:abbNumber}
fi

