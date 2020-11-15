#!/bin/sh

file=`ls $1 | shuf | head -n 1`
wal -i $1/$file

echo $file

$HOME/.scripts/setColor.sh
