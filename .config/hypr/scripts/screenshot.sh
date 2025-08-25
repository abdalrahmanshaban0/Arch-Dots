#!/bin/bash

# Create screenshot directory
mkdir -p ~/Pictures/Screenshots

# Capture screenshot
FILE=~/Pictures/Screenshots/Screenshot-$(date +%F_%T).png
grim -g "$(slurp)" - | wl-copy && wl-paste > "$FILE"

# Send a clickable notification
notify-send -t 3000 \
    --action="Open image path" \
    "Screenshot saved" "$FILE" \
    && thunar "$FILE"
