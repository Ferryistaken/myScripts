#!/bin/sh

# restart wanted apps
bash $HOME/.config/polybar/launchBSPWM.sh &

picom --config .config/picom/picom.conf &

killall -q glava; glava --desktop --force-mod=radial&
glava --desktop --force-mod=$(shuf -n 1 ~/.config/glava/modes.txt)&



bspc config window_gap 15
bspc config top_padding 0
bspc config border_width 3
