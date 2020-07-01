#!/usr/bin/sh

# i need to output the image in the .cache dir, then generate a colorscheme based on it, and then delete it.
# I also need to make it so that when I run the gaming mode script it kills it, and the normal mode brings it back
input=$1; ffmpeg -ss "$(bc -l <<< "$(ffprobe -loglevel error -of csv=p=0 -show_entries format=duration "$input")*0.5")" -i "$input" -frames:v 1 $HOME/.cache/animatedWallpaper/half.png
