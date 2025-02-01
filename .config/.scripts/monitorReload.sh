# -----------------------------------------------------
# Reload Monitors
# -----------------------------------------------------
mv "$HOME/.config/hypr/conf/monitor.conf" "$HOME/.config/hypr/conf/monitor.conf.bak"
echo "monitor=,preferred,auto,auto" >"$HOME/.config/hypr/conf/monitor.conf"
hyprctl reload
sleep 3
rm "$HOME/.config/hypr/conf/monitor.conf"
mv "$HOME/.config/hypr/conf/monitor.conf.bak" "$HOME/.config/hypr/conf/monitor.conf"
hyprctl reload
