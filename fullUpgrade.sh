#!/usr/bin/sh

echo -e "\n\033[0;32m⬡ Upgrading Npm Packages\033[0m\n" && sudo npm update -g &&
echo -e "\n\033[0;33m📦 Upgrading Cargo Packages and Rust Binaries\033[0m\n" && cargo install-update --all && echo "Updating Rust Binary" && rustup update &&
echo -e "\n\033[0;34m🐧 Upgrading system packages\033[0m\n" && yay &&
echo -e "\n\033[0;31m🐦 Upgrading flatpaks\033[0m\n" && flatpak update
