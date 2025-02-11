#!/bin/bash

PREFIX=$("$HOME/.config/.scripts/wayland-prefix.sh")

# Debugging output
echo "Checking if kmonad is running..."

# List processes for debugging
ps aux | grep kmonad

# Check if kmonad is running
if pgrep -fl "kmonad" | grep -v "grep" >/dev/null; then
  echo "kmonad is running. Attempting to stop it..."
  notify-send --icon=keyboard "...kmonad is running..." "Stopping it..."
  # kmonad is running, so stop it
  pkill -f "kmonad" && echo "kmonad stopped." || echo "Failed to stop kmonad."
else
  echo "kmonad is not running. Starting it..."
  notify-send --icon=keyboard "...kmonad was NOT running..." "Starting it for the laptop..."
  # kmonad is not running, so start it
  ${PREFIX}kmonad /home/moosicmaan/.config/kmonad/dellg7.kbd
  echo "kmonad started for the laptop."
fi
