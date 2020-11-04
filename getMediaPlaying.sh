#!/usr/bin/bash

mediaStatus=`playerctl metadata 2>&1`


if [[ "$mediaStatus" == "No player could handle this command" ]]; then
	echo "♫ No Player Found"
else
	#title=`playerctl --player=playerctld metadata --format " ♫ {{ title }}" | cut -c1-30`
	title=`playerctl --player=playerctld metadata --format " ♫ {{ title }}"`
	#echo $title...
	echo "$title`playerctl --player=playerctld metadata --format " - {{ artist }}({{ status }})"`"
fi
