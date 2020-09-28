#!/usr/bin/sh

pkill -usr1 -x sxhkd; notify-send --icon=$HOME/.local/share/icons/Custom/reload.png 'sxhkd' 'Reloaded config'
