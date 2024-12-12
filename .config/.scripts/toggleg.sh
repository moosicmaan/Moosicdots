#!/bin/bash

# Check if kmonad is running
if pgrep -fl "nwg-dock-hyprland" | grep -v "grep" >/dev/null; then
  echo "killing garuda visuals"
  notify-send --icon=configuration_section "killing garuda visuals"
  pkill -f "nwg-dock-hyprland" &
  pkill -f "wlsunset" &
  cat ~/.config/hypr/conf/options/main/hyprland.conf.X >~/.config/hypr/hyprland.conf &
  echo "/moosic;/moosic/black" >~/.cache/.themestyle.sh &
  echo "/home/moosicmaan/Pictures/Backgrounds/wal16.jpg" >~/.cache/current_wallpaper &
  ~/.config/.scripts/wallpaper.sh init &
  notify-send "...dead..." || notify-send --icon=configuration_section "Failed to stop garuda visuals"
else
  echo "Starting the garuda visuals"
  notify-send --icon=configuration_section "Starting the garuda visuals"
  nwg-dock-hyprland -x -p "left" -i 24 -mt 10 -mb 10 -ml 5 -f &
  wlsunset -t 2000 -T 2300 &
  cat ~/.config/hypr/conf/options/main/hyprland.conf.G >~/.config/hypr/hyprland.conf &
  echo "/gdefault;/gdefault/conf" >~/.cache/.themestyle.sh &
  echo "/home/moosicmaan/Pictures/Backgrounds/wal86.jpg" >~/.cache/current_wallpaper &
  ~/.config/.scripts/wallpaper.sh init &
  notify-send --icon=configuration_section "Garuda visuals started."
fi
