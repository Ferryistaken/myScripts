#!/bin/sh

file=`ls $HOME/Pictures/wallpapers/ | shuf | head -n 1`
wal -i $HOME/Pictures/wallpapers/$file

echo $file

$HOME/Documents/scripts/setColor.sh
