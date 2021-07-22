#!/bin/sh

cd ~/.config/kitty/ && ln -sf ./kitty-themes/themes/$(find kitty-themes/themes/ -type f -printf "%f\n" | fzf) ~/.config/kitty/theme.conf && cd -
