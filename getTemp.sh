#!/bin/sh

sensors | python3 $HOME/.scripts/cpuTemp.py
