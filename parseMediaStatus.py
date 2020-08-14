#!/usr/bin/python3

import sys

mediastatus = ""

for line in sys.stdin:
    if 'Exit' == line.rstrip():
        break
    mediastatus += line

if mediastatus == "No player could handle this command":
    print("Helllosdofsdj")
