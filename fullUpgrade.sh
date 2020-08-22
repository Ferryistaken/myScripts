#!/usr/bin/sh

echo -e "\n\033[0;33m📦 Upgrading Cargo Packages\033[0m\n" && cargo install-update --all && echo -e "\n\033[0;34m🐧 Upgrading system packages\033[0m\n" && yay
