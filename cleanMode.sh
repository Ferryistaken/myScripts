#!/bin/sh

# restart wanted apps
bash $HOME/.config/polybar/launchBSPWM.sh &
picom --config .config/picom/picom.conf &

bspc config window_gap 40
bspc config top_padding 0
bspc config border_width 2
