--[[
=====================================================
-----------------------------------------------------
Autostart
See https://wiki.hypr.land/Configuring/Basics/Autostart/
put former exec-once commands inside the func and former exec commands outside

hypridle is a systemd unit "systemctl --user status hypridle.service
-----------------------------------------------------
=====================================================
--]]

hl.on("hyprland.start", function()
	hl.exec_cmd("uwsm app -- /usr/lib/polkit-kde-authentication-agent-1")
	-- hl.exec_cmd("uwsm app -- /usr/lib/hyprpolkitagent/hyprpolkitagent")
	hl.exec_cmd("uwsm app -- dunst")
	hl.exec_cmd("uwsm app -- wl-paste --watch cliphist store")
	hl.exec_cmd("uwsm app -- garuda-system-maintenance")
	hl.exec_cmd("uwsm app -- /home/moosicmaan/.config/.scripts/ut-bluelight")
	hl.exec_cmd("uwsm app -- awww query || uwsm app -- awww-daemon -q --no-cache")
	hl.exec_cmd("sleep 1 && $HOME/.config/.scripts/ut-wallpaper --init")
	hl.exec_cmd("~/.config/.scripts/ut-save-env")
	hl.exec_cmd([[swayidle -w \
                   timeout 600 'swaylock -f' \
                   timeout 1200 \
                   'hyprctl dispatch "hl.dsp.dpms({ action = \"disable\" })"' \
                   resume \
                   'hyprctl dispatch "hl.dsp.dpms({ action = \"enable\" })"']])
	hl.exec_cmd("bluetoothctl connect 00:12:6F:DB:0A:DD")
	hl.exec_cmd("pactl set-card-profile bluez_card.00_12_6F_DB_0A_DD a2dp-sink-sbc_xq")

	--needed only to render some blur effects
	-- hl.env("GDK_WAYLAND_DISABLE", "ext_background_effect_manager_v1")
end)
