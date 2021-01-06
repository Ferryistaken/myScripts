#!/bin/bash

modes="Master\nRMaster\nWide\nRWide\nGrid\nTiled\nMonocle\nClear"


printf $modes | rofi -dmenu -i -font "Roboto Mono 13" -p "Choose Layout"
