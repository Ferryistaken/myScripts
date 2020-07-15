#!/usr/bin/bash

echo `xprintidle`

if [[ `xprintidle` -ge 600000 ]]; then
	betterlockscreen -u $HOME/Pictures/wallpapers/ -l blur;
fi
