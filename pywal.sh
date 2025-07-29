#!/usr/bin/env bash
set -xe  # Show commands and exit on error

# Packages to install
packages=(
    python-pywal16-git
    rofi
    swaync
    blueman
    alsa-utils
)

# Install packages using yay
yay -S --noconfirm "${packages[@]}"

# Get the directory where this script is located
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"

# Copy wallpapers folder to ~/Pictures/
mkdir -p "$HOME/Pictures"
cp -r "$SCRIPT_DIR/wallpapers" "$HOME/Pictures/"

# Make all files in config/hypr/scripts/ executable
SCRIPTS_DIR="$SCRIPT_DIR/config/hypr/scripts"
if [ -d "$SCRIPTS_DIR" ]; then
    chmod +x "$SCRIPTS_DIR"/*  # all files in the folder
fi
wal -i ~/Pictures/wallpapers
