#!/bin/bash

NEWPATH=`readlink -f $1`

sed -i "s:WALLPAPER=.*:WALLPAPER=$NEWPATH:" $HOME/.xsession
