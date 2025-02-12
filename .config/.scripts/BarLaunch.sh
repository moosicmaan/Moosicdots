#!/bin/bash
# -----------------------------------------------------
#    Jason Bradberry (2024)
# -----------------------------------------------------

# Check if waybar-disabled file exists
# if [ -f $HOME/.cache/waybar-disabled ] ;then
#     killall waybar
#     pkill waybar
#     exit 1
# fi

# Prefix to run commands in wayland using uwsm.
PREFIX=$("$HOME/.config/.scripts/wayland-prefix.sh")

# -----------------------------------------------------
# Quit all running statuesbar instances
# -----------------------------------------------------
killall waybar
pkill waybar
pkill gBar
sleep 0.2

# -----------------------------------------------------
# Default theme: /THEMEFOLDER;/VARIATION
# -----------------------------------------------------
themestyle="/moosic;/moosic/mixed"

# -----------------------------------------------------
# Get current theme information from .cache/.themestyle.sh
# -----------------------------------------------------
if [ -f ~/.cache/.themestyle.sh ]; then
  themestyle=$(cat ~/.cache/.themestyle.sh)
else
  touch ~/.cache/.themestyle.sh
  echo "$themestyle" >~/.cache/.themestyle.sh
fi

IFS=';' read -ra arrThemes <<<"$themestyle"
echo "Theme: ${arrThemes[0]}"

if [ ! -f ~/.config/waybar/themes${arrThemes[1]}/style.css ]; then
  themestyle="/moosic;/moosic/mixed"
fi

# -----------------------------------------------------
# Load gBar if selected
# -----------------------------------------------------
echo "I am here now"
echo "arrThemes[0] = ${arrThemes[0]}"
if [ ${arrThemes[0]} == "/gBar" ]; then
  ${PREFIX}gBar bar 0 &
  # ${PREFIX}gBar bar 1 &
  notify-send "Set the statusbar to gBar"
  exit 1
fi

# -----------------------------------------------------
# Loading the configuration for Waybar
# -----------------------------------------------------
config_file="config.jsonc"
style_file="style.css"

# Standard files can be overwritten with an existing config-custom or style-custom.css
if [ -f ~/.config/waybar/themes${arrThemes[0]}/config-custom ]; then
  config_file="config-custom"
fi
if [ -f ~/.config/waybar/themes${arrThemes[1]}/style-custom.css ]; then
  style_file="style-custom.css"
fi

${PREFIX}waybar -c ~/.config/waybar/themes${arrThemes[0]}/$config_file -s ~/.config/waybar/themes${arrThemes[1]}/$style_file &
