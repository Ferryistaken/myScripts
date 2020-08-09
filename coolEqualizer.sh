#!/usr/bin/zsh

killall -q alacritty
echo " -p /home/ferry/.config/cava/customSoundConfig" |  xargs alacritty --position 2700 50 --dimensions 100 12 --title=coolEqualizer --command cava& sleep 0.2 && bspc node $1 --flag sticky=on &&
killall play
