#!/bin/dash

echo "\n\033[0;32m⬡ Skipping npm updates\033[0m\n" &&
echo "\n\033[0;33m📦 Upgrading Cargo Packages and Rust Binaries\033[0m\n" && cargo install-update --all && echo "Updating Rust Binary" && rustup update &&
echo "\n\033[0;31m🐦 Upgrading flatpaks\033[0m\n" && sudo flatpak update &&
echo "\n\033[0;34m🐧 Upgrading system packages\033[0m\n" && sudo dnf upgrade &&
echo "\n\033[0;35mⓘ Updatin TLDR pages\033[0m\n" && tldr --update
