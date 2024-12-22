#!/bin/bash

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
  notify-send --icon=keyboard "...kmonad is NOT running..." "Starting it for hyprland and extermal keyboard..."
  # kmonad is not running, so start it
  kmonad /home/moosicmaan/.config/kmonad/k350_hypr.kbd
  echo "kmonad started."
fi
