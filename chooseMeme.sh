#!/usr/bin/sh

xclip -sel cli < $(find $HOME/Pictures/memes/ -type f | rofi -dmenu -i -font "RobotoMono 10" -p "Choose Meme")
