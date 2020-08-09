#!/usr/bin/sh

# Shadowplay functionality
obs --startreplaybuffer --profile "shadowplay"&

# Torrent client
transmission-gtk&

# Spotify
spotify&
