#!/bin/bash
#  _              _     _           _ _
# | | _____ _   _| |__ (_)_ __   __| (_)_ __   __ _ ___
# | |/ / _ \ | | | '_ \| | '_ \ / _` | | '_ \ / _` / __|
# |   <  __/ |_| | |_) | | | | | (_| | | | | | (_| \__ \
# |_|\_\___|\__, |_.__/|_|_| |_|\__,_|_|_| |_|\__, |___/
#           |___/                             |___/
# -----------------------------------------------------

# -----------------------------------------------------
# Path to keybindings config file
# -----------------------------------------------------
# config_file="/home/$USER$config_file"
config_file="$HOME/.config/hypr/conf/keybinding.conf"
echo "Reading from: $config_file"

# -----------------------------------------------------
# Parse keybindings
# -----------------------------------------------------
keybinds=$(grep -oP '(?<=bindd = ).*' $config_file)
keybinds=$(echo "$keybinds" | sed 's/$mainMod/SUPER/g' | sed 's/,\([^,]*\)$/ = \1/' | sed 's/, exec//g' | sed 's/^,//g')
# keybinds=$(echo "$keybinds" | sed 's/$mainMod/SUPER/g')
# debug
echo "KEYBINDS"
echo $keybinds

# -----------------------------------------------------
# Show keybindings in rofi
# -----------------------------------------------------
rofi -dmenu -i -replace -p "Keybinds" -config ~/.config/rofi/config-compact.rasi <<<"$keybinds"
