#!/usr/bin/sh

wal -i $(find $HOME/Pictures/wallpapers $HOME/Pictures/ghibliWallpaper | rofi -dmenu -i); $HOME/Documents/scripts/setColor.sh;
