#!/usr/bin/sh

RED='\033[0;31m'

killall mpv 1>/dev/null 2>/dev/null;
killall xwinwrap 1>/dev/null 2>/dev/null;

setsid -f xwinwrap -fs -fdt -ni -b -nf -un -o 1.0 -debug -- mpv -wid WID --loop --no-audio $1;
$HOME/Documents/scripts/findMiddleFrame.sh $1;

# this is to generate the scheme based on the middle frame of the video and then delete that picture
rm -R $HOME/.cache/wal/schemes/;
wal -i $HOME/.cache/animatedWallpaper/half.png;
rm $HOME/.cache/animatedWallpaper/half.png;

printf "${RED}[WARNING] You should now close this terminal, or things will break"
