#!/usr/bin/zsh

playerctl --player=$(playerctl --list-all | rofi -dmenu -i) $(echo "play-pause\nnext\nprevious\n" | rofi -dmenu -i)
