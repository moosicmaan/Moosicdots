#!/bin/bash

# Start picom if not already running
pgrep -x picom >/dev/null || picom -b &

# Restart kmonad cleanly
pkill kmonad
// kmonad -c /home/moosicmaan/.config/kmonad/k350.kbd &
// setxkbmap -layout us -option && setxkbmap -layout us -option caps:escape_shifted_capslock -option compose:ralt
setxkbmap -layout us -option

# Start system tray apps only if not running
pgrep -x nm-applet >/dev/null || nm-applet &
pgrep -x pasystray >/dev/null || pasystray &
pgrep -x firewall-applet >/dev/null || firewall-applet &
pgrep -x dunst >/dev/null || dunst &
pgrep -x flameshot >/dev/null || flameshot &
pgrep -x blueman-applet >/dev/null || blueman-applet &

# Polkit agent (usually doesn't duplicate, but just in case)
pgrep -f polkit-gnome-authentication-agent >/dev/null ||
  /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

# Start dwmblocks (with logging) if not already running
pgrep -x dwmblocks >/dev/null || /usr/local/bin/dwmblocks >/tmp/dwmblocks.log 2>&1 &

# Musikcube background server
# pgrep -x musikcubed >/dev/null || musikcubed --start &
