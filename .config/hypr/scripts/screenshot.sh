#!/bin/bash

# Create screenshot directory
mkdir -p ~/Pictures/Screenshots

# Capture screenshot
FILE=~/Pictures/Screenshots/Screenshot-$(date +%F_%T).png

grimblast --notify copysave area $FILE
