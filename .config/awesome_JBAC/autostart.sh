#!/bin/bash

function run {
  if ! pgrep $"1"; then
    $"@" &
  fi
}
#run xrandr --output VGA-1 --primary --mode 1360x768 --pos 0x0 --rotate normal
xrandr --output eDP-1 --mode 1920x1080 --pos 0x0 --rotate normal --output DP-2 --off --output HDMI-2 --off --output DP-3 --off --output HDMI-3 --off --output HDMI-1-0 --primary --mode 1920x1080 --pos 1920x0 --rotate normal --output DP-1-0 --off --output DP-1-1 --off
# run autorandr horizontal

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1

nm-applet &
pasystray &
blueman-applet &
garuda-system-maintenance &

picom -b --config ~/.config/awesome/picom.conf &

# set alternate keyboard, refresh rate and repeat delay, and numlock on
kmonad /home/moosicmaan/.config/kmonad/k350.kbd &
xset r rate 300 100 &

variety &
