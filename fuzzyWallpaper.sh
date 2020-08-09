#!/usr/bin/sh

wal -i $(find $HOME/Pictures/wallpapers $HOME/Pictures/monochromeWallpapers $HOME/Pictures/animeWallpapers $HOME/Pictures/ghibliWallpaper -type f | rofi -dmenu -i -font "RobotoMono 10" -p "Choose Wallpaper"); $HOME/Documents/scripts/setColor.sh;
