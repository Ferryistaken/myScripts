#!/bin/sh
# this is to set a certain picture in my wallpapers folder to have a certain name so that xprofile will use it as a wallpaper on next boot

if [ $# -lt 2 ]
then
	echo "ERROR: not enough arguments. Usage: setWall /path/to/image/to/set/as/wp newNameForPreviousWall"
elif [ $# -lt 2 ]
then
	echo "ERROR: too many arguments. Usage: setWall /path/to/image/to/set/as/wp newNameForPreviousWall"
else [ $# == 2 ]
	mv $HOME/Pictures/wallpapers/wall.jpg $HOME/Pictures/wallpapers/$2 && mv $1 $HOME/Pictures/wallpapers/wall.jpg && echo "Operation has been completed. New file name : $2"
fi

