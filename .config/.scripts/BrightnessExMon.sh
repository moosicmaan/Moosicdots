#!/bin/bash

# ICONS
licon="/usr/share/icons/candy-icons/apps/scalable/lightbeat.svg"

# Get the current brightness value
notify-send -u normal -i "$licon" "Getting/Setting Brightness" "For External Monitor..."
echo "Getting/Setting Brightness..."
current_brightness=$(ddcutil getvcp 10 | grep -oP 'current value =\s*\K\d+')

# Ensure the brightness value was retrieved and is a number
if [[ -z "$current_brightness" || ! "$current_brightness" =~ ^[0-9]+$ ]]; then
  echo "Error: Failed to retrieve current brightness!" >&2
  notify-send -u normal -i "$licon" "current_brightness: $current_brightness" "Error: Failed to retrieve current brightness!" >&2
  exit 1
fi

#evaluate input and calulate new brightness
case $1 in
"--inc")
  new_brightness=$((current_brightness + 25))
  ;;
"--dec")
  new_brightness=$((current_brightness - 25))
  ;;
*)
  echo "Invalid input"
  echo "Usage: $0 --inc | --dec"
  notify-send -u normal -i "$licon" "Invalid Input" "Usage: $0 --inc | --dec"
  exit 1
  ;;
esac

echo "Current Brightness: $current_brightness..."
echo "New Calculated Brightness: $new_brightness..."
notify-send -u normal -i "$licon" "Current Brightness: $current_brightness" "New Calculated Brightness: $new_brightness..."

# Ensure brightness doesn't go below 0
if [ "$new_brightness" -lt 0 ]; then
  new_brightness=0
  echo "New Brightness was <0, set to 0"
  notify-send -u normal -i "licon" "New Brightness was <0" "Set to 0..."
elif [ "$new_brightness" -gt 100 ]; then
  new_brightness=100
  echo "New Brightness was >100, set to 100"
  notify-send -u normal -i "$licon" "New Brightness was >100" "Set to 100..."
fi

# Set the new brightness
if ! ddcutil setvcp 10 "$new_brightness"; then
  echo "Failed to set brightness!" >&2
  notify-send -u normal -i "$licon" "Failed to set brightness!" >&2
else
  echo "Brightness set to $new_brightness"
  notify-send -u normal -i "$licon" "Brightness set to:" "$new_brightness"
fi
