#!/bin/bash
#starting utility applications at boot time
nm-applet &
numlockx on &
blueman-applet &
pasystray &
firewall-applet &
garuda-system-maintenance &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

#starting user applications at boot time
volumeicon &

# Load Dunst Notification Manager
dunst &

# Load GTK settings
"$HOME"/.config/.scripts/gtk.sh &

# Using swayidle to start swaylock
swayidle -w timeout 600 'swaylock -f -i /home/moosicmaan/Pictures/Backgrounds/wal122.jpg' timeout 900 'hyprctl dispatch dpms off' resume 'hyprctl dispatch dpms on' &

# Load cliphist history
wl-paste --watch cliphist store &

# Initialize swww
swww query || swww-daemon

# Load last wallpaper and waybar with pywal colors
# $HOME/.config/.scripts/wallpaper.sh init &

dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP &
/usr/lib/xdg-desktop-portal &

# Set alternate keyboar
kmonad /home/moosicmaan/.config/kmonad/k350_hypr.kbd &
# Emacs
# /usr/bin/emacs --daemon=serve &

# SET ENVIRONMENT
