#!/bin/bash
path="$HOME/.config/BetterDiscord/themes"
theme="default"
print_usage() {
  echo "Usage: $0 [-t theme] [-p path]"
  echo "-h                          Display this info"
  echo "-t theme                    Available: [default,abou]"
  echo "-p path/to/folder/or/file   Path where pywal-discord will generate theme. Default: $path"
}

while getopts 'p:vt:vh' flag; do
  case "${flag}" in
    p) path="${OPTARG}" ;;
    t) theme="${OPTARG}" ;;
    h) print_usage ;;
    *) print_usage 
       exit 1 ;;
  esac
done

config=/usr/share/pywal-discord
newfile=$path/pywal-discord-$theme.theme.css

cat $config/meta.css $HOME/.cache/wal/colors.css $config/pywal-discord-$theme.css > $newfile 
if [ ! -f $newfile ]
then
    echo ⚠️ THEME WAS NOT CREATED ⚠️ 
    echo Try to change path with -p because $path doesn\'t exist
    exit 1
fi
