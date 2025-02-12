# -----------------------------------------------------
# Reload Monitors
# -----------------------------------------------------
# JDB - just a simple script to reload monitors when working with multiple ttys.
#     - useful for when you have a laptop and docked setup.
#     - work-around for Wayland bug where monitors are not detected properly when switching ttys.
mv "$HOME/.config/hypr/conf/monitor.conf" "$HOME/.config/hypr/conf/monitor.conf.bak"
echo "monitor=,preferred,auto,auto" >"$HOME/.config/hypr/conf/monitor.conf"
hyprctl reload
sleep 3
rm "$HOME/.config/hypr/conf/monitor.conf"
mv "$HOME/.config/hypr/conf/monitor.conf.bak" "$HOME/.config/hypr/conf/monitor.conf"
hyprctl reload
