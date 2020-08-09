#!/usr/bin/bash

mediaStatus=$(playerctl --player=playerctld metadata --format " ♫ {{ title }} - {{ artist }}({{ status }})")

if [[ $mediaStatus == "No player could handle this command" ]]; then
	echo "♫ No Player Found"
else
	playerctl --player=playerctld metadata --format " ♫ {{ title }} - {{ artist }}({{ status }})"
fi
