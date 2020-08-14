#!/usr/bin/bash

mediaStatus=`playerctl metadata 2>&1`


if [[ "$mediaStatus" == "No player could handle this command" ]]; then
	echo "♫ No Player Found"
else
	echo `playerctl --player=playerctld metadata --format " ♫ {{ title }} - {{ artist }}({{ status }})"`
fi
