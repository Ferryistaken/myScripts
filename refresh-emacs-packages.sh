#!/bin/bash

emacs -nw -Q --eval="(package-refresh-contents)" &
PID=$!
sleep 100
kill -9 $PID
exit 0
