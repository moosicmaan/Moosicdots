#!/bin/bash

# Check if kmonad is running
if pgrep -fl "nwg-dock-hyprland" | grep -v "grep" >/dev/null; then
  echo "killing garuda visuals"
  notify-send "killing garuda visuals"
  pkill -f "nwg-dock-hyprland" &
  pkill -f "wlsunset" &
  cat ~/.config/hypr/hyprland.conf.X >~/.config/hypr/hyprland.conf &
  echo "/moosic;/moosic/black" >~/.cache/.themestyle.sh &
  echo "/home/moosicmaan/Pictures/Backgrounds/wal16.jpg" >~/.cache/current_wallpaper &
  ~/.config/.scripts/wallpaper.sh init &
  notify-send "...dead..." || notify-send "Failed to stop garuda visuals"
else
  echo "Starting the garuda visuals"
  notify-send "Starting the garuda visuals"
  nwg-dock-hyprland -x -p "left" -i 24 -mt 10 -mb 10 -ml 5 -f &
  wlsunset -t 2000 -T 2300 &
  cat ~/.config/hypr/hyprland.conf.G >~/.config/hypr/hyprland.conf &
  echo "/gdefault;/gdefault/conf" >~/.cache/.themestyle.sh &
  echo "/home/moosicmaan/Pictures/Backgrounds/wal86.jpg" >~/.cache/current_wallpaper &
  ~/.config/.scripts/wallpaper.sh init &
  notify-send "Garuda visuals started."
fi
