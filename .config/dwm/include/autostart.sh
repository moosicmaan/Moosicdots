#!/bin/bash

# Set up display and keyboard settings - in ~/.xprofile
# xrandr --output eDP-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-1-0 --mode 1920x1080 --pos 1920x0 --rotate normal
# setxkbmap -option 'caps:escape_shifted_capslock'
# xset r rate 300 90

picom -b &
pkill kmonad
kmonad -c /home/moosicmaan/.config/kmonad/k350.kbd &
# variety &
nm-applet &
pasystray &
firewall-applet &
# garuda-system-maintenance &
dunst &
flameshot &
blueman-applet &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
/home/moosicmaan/.config/dwm/include/dwmblocks/dwmblocks &
# /usr/local/bin/dwmblocks &
# dwmblocks &
