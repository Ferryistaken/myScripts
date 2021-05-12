#!/usr/bin/sh

URL=$1

youtube-dl --restrict-filenames -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4 $URL
