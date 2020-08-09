#!/usr/bin/python3.8

import os
import time

output = os.popen('xdotool getmouselocation --shell').read()

output = output.split("\n")
output.pop()
# this will output something like this:
#
#X=599
#Y=1400
#SCREEN=0
#WINDOW=18932

def click():
    os.system("xdotool click 1")

xCoordinate = output[0].split("=")[1]
yCoordinate = output[1].split("=")[1]

# move the mouse to the X on the ad, click, and go back to the first location
os.system("xdotool mousemove 3412 1331")
click()
command = "xdotool mousemove " + xCoordinate + " " + yCoordinate
os.system(command)
