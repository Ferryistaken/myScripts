#!/usr/bin/bash

echo `xprintidle`

if [[ `xprintidle` -ge 1800000 ]]; then
	betterlockscreen -u $HOME/Pictures/wallpapers/ -l blur;
fi
