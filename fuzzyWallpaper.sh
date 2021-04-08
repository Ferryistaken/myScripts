#!/usr/bin/sh

WALLPAPER=$(find $HOME/Pictures/wallpapers $HOME/Pictures/monochromeWallpapers $HOME/Pictures/animeWallpapers $HOME/Pictures/ghibliWallpaper -type f | rofi -dmenu -i -font "RobotoMono 10" -p "Choose Wallpaper")

wal -i $WALLPAPER -o wal-set; $HOME/.scripts/setColor.sh; $HOME/.scripts/setWall.sh;
