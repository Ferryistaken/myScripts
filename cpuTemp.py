#!/usr/bin/python3.8

import sys

s = ""

for line in sys.stdin:
    if 'Exit' == line.rstrip():
        break
    s = s + str(line)

s = s.split('Tdie:', 1)[-1]
s = s.split('Tctl:', 1)[0]
s = s.replace(" ", "")
s = s.replace("\n", "")

print(s)
