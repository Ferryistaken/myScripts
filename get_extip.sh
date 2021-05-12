#!/bin/bash

extIP=$(curl -s http://icanhazip.com)
#echo extip,network=mine externalIP=\"$extIP\"
echo "$extIP"
