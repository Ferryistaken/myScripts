#!/bin/sh

# kill unwanted apps
killall polybar
killall glava

$HOME/.config/polybar/launch-tiny.sh


bspc config window_gap 5
bspc config border_width 0
bspc config top_padding 0

