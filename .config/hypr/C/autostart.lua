--[[=================================================
-----------------------------------------------------
Autostart
See https://wiki.hypr.land/Configuring/Basics/Autostart/
put former exec-once commands inside the func and former exec commands outside

hypridle is a systemd unit "systemctl --user status hypridle.service
-----------------------------------------------------
=====================================================
--]]

hl.on("hyprland.start", function()
	hl.exec_cmd("uwsm app -- /usr/lib/hyprpolkitagent/hyprpolkitagent")
	hl.exec_cmd("uwsm app -- dunst")
	hl.exec_cmd("uwsm app -- wl-paste --watch cliphist store")
	hl.exec_cmd("uwsm app -- garuda-system-maintenance")
	hl.exec_cmd("uwsm app -- /home/moosicmaan/.config/.scripts/ut-bluelight")
	hl.exec_cmd("uwsm app -- awww query || uwsm app -- awww-daemon")
	hl.exec_cmd("sleep 1 && $HOME/.config/.scripts/ut-wallpaper --init")
end)
