#!/usr/bin/bash

# what applications have NO sound
if [[ "$1" != "notify-send" ]] || [[ "$1" != "Spotify" ]]
then
	if [ "$2" = "Pomodoro" ];
	then
		paplay $HOME/Audio/399191__spiceprogram__drip-echo.wav
		exit
	fi

	paplay $HOME/Audio/japan_sms.wav
fi
