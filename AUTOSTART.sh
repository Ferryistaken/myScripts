#!/usr/bin/sh

# this makes them not steal focus
bspc config ignore_ewmh_focus true

# Start mail client
mailspring&

# turn the focus back
bspc config ignore_ewmh_focus false
