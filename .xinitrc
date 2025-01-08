#!/bin/bash

# Set up display and keyboard settings
xrandr --output eDP-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-1-0 --mode 1920x1080 --pos 1920x0 --rotate normal
setxkbmap -option 'caps:escape_shifted_capslock'
xset r rate 300 90

# Start the window manager (dwm in this case)
# exec dwm
