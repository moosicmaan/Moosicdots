#!/bin/bash
# =====================================================
# -----------------------------------------------------
# Rofi script to take screenshots
#    Jason Bradberry (2025)
# -----------------------------------------------------
# =====================================================

DIR="$HOME/Pictures/Screenshots/"
# NAME="screenshot_$(date +%d%m%Y_%H%M%S).png"
NAME="flameshot_$(date +%d%m%Y_%H%M%S).png"

option1="Selected area"
option2="Main Screen (delay 3 sec)"
option3="All Screens (delay 3 sec)"
option4="Launcher"

options="$option1\n$option2\n$option3\n$option4"

choice=$(echo -e "$options" | rofi -dmenu -replace -config ~/.config/rofi/config-screenshot.rasi -i -no-show-icons -l 4 -width 60 -p "Take Screenshot")

case $choice in
"$option1")
  # grim -g "$(slurp)" - | swappy -f -
  flameshot gui
  # notify-send --icon=configuration_section "Screenshot created" "Mode: Selected area"
  ;;
"$option2")
  # sleep 3
  # grim - | swappy -f -
  flameshot screen -d 3 -p "$DIR$NAME"
  # notify-send --icon=configuration_section "Screenshot created" "Mode: Fullscreen"
  ;;
"$option3")
  # sleep 3
  # grim - | swappy -f -
  flameshot full -d 3 -p "$DIR$NAME"
  # notify-send --icon=configuration_section "Screenshot created" "Mode: Double Fullscreen"
  ;;
"$option4")
  flameshot launcher
  ;;
esac
