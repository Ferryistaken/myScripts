#!/bin/sh

# kill unwanted apps
killall polybar&

bspc config window_gap 0
bspc config top_padding 0
bspc config border_width 0
