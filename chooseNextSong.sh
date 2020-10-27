#!/usr/bin/sh

find $HOME/Music -type f  | rofi -dmenu -i | sed "s/^/'/;s/$/'/" | xargs deadbeef --queue
