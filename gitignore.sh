#!/usr/bin/sh

# https://www.toptal.com/developers/gitignore/api/
BASEURL="https://www.toptal.com/developers/gitignore/api/"

for arg; do
  # printf '%s\n' "$arg"
  if [ $1 == "-l" ]
  then
	  curl -sL "$BASEURL/list" | sed -e 's/,/\n/g' | fzf
	  exit
  fi
  BASEURL="$BASEURL$arg,"
done

# remove last character, because it would be ','
BASEURL=${BASEURL::-1}

# echo $BASEURL

curl -sL $BASEURL
