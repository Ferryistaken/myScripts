#!/bin/bash

NEWPATH=`readlink -f $1`

sed -i "s:=.*:=$NEWPATH:" $HOME/.xsession
