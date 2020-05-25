#!/usr/bin/python

import sys

s = ""

for line in sys.stdin:
    if 'Exit' == line.rstrip():
        break
    s = s + str(line)

if "The server is not running!" in s:
    print("No song currently playing")
else:
#### Song Status ####
    status = s.split('State: ', 1)[-1]
    status = status.split('File', 1)[0]
    status = status.replace(" ", "")
    status = status.replace("\n", "")
    if status == 'PLAY':
        status = '▶'
    elif status == 'PAUSE':
        status = '⏸'
    else:
        status = 'Status Unavailable'

#### Song File Name ####
    songName = s.split('File: ', 1)[-1]
    songName = songName.split('\n', 1)[0]
    songName = songName[::-1]
    songName = songName.split('/', 1)[0]
    songName = songName[::-1]

#### Song Time ####

#### Total Time
    totalTime = s.split('TotalTime: ', 1)[-1]
    totalTime = totalTime.split('TimeLeft', 1)[0]
    totalTime = totalTime.replace(" ", "")
    totalTime = totalTime.replace("\n", "")

#### Current Time
    currentTime = s.split('CurrentTime: ', 1)[-1]
    currentTime = currentTime.split('CurrentSec', 1)[0]
    currentTime = currentTime.replace(" ", "")
    currentTime = currentTime.replace("\n", "")

#### Time
    time = currentTime + ' / ' + totalTime

#### FINAL MESSAGE ####
    print("    ♫     " + songName + "  " + status + "  " + "[" + time + "]")

