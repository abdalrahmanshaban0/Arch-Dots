#!/bin/bash
# play adhan audio
AUDIO_FILE="$HOME/.local/share/IslamicPrayerTimings/adhan-mansour-al-zahrani.mp3"
mpv --no-video --loop=no --really-quiet "$AUDIO_FILE" &
sleep 10
# lock screen (for hyprland)
hyprlock
