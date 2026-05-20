---- AUTOSTART ----
-- See https://wiki.hypr.land/Configuring/Basics/Autostart/
-- put former exec-once commands inside the func and former exec commands outside
hl.on("hyprland.start", function()
	hl.exec_cmd("uwsm app -- /usr/lib/hyprpolkitagent/hyprpolkitagent")
	-- hl.exec_cmd("uwsm app -- /usr/bin/pypr # --config $HOME/.config/hypr/plugins/pyprland.toml")
	hl.exec_cmd("uwsm app -- dunst")
	hl.exec_cmd("uwsm app -- foot --server")
	hl.exec_cmd("uwsm app -- wl-paste --watch cliphist store")
	hl.exec_cmd("uwsm app -- garuda-system-maintenance")
	hl.exec_cmd("/home/moosicmaan/.config/.scripts/ut-bluelight")
	hl.exec_cmd("uwsm app -- awww query || uwsm app -- awww-daemon")
	hl.exec_cmd("sleep 1 && $HOME/.config/.scripts/ut-wallpaper --init")
	hl.exec_cmd("uwsm app -- hypridle")
	-- hl.exec_cmd(
	-- "uwsm app -- swayidle - w timeout 900 'waylock' timeout 1600 'hyprctl dispatch dpms off' resume 'hyprctl dispatch dpms on' before-sleep 'waylock'"
	-- "uwsm app -- swayidle - w timeout 900 'swaylock -f' timeout 1600 'hyprctl dispatch dpms off' resume 'hyprctl dispatch dpms on' before-sleep 'swaylock -f'"
	-- )
end)

-- # =====================================================
-- # -----------------------------------------------------
-- # Autostart
-- # -----------------------------------------------------
-- # =====================================================
--
-- # --> generally not needed when using uwsm - should all be taken care of by SystemD services <--
-- # Start Polkit
-- # exec-once = /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
-- # exec-once = uwsm app -- /usr/lib/polkit-kde-authentication-agent-1
-- exec-once = uwsm app -- /usr/lib/hyprpolkitagent/hyprpolkitagent
--
-- # Setup XDG for screen sharing
-- # exec-once = $HOME/.config/.scripts/start-xdg
--
-- # Load GTK settings
-- # exec-once = $HOME/.config/.scripts/start-gtk
--
-- # Start Pyprland for scratchpads and the like
-- exec-once = uwsm app -- /usr/bin/pypr # --config $HOME/.config/hypr/plugins/pyprland.toml
-- # exec-once = hyprctl plugin load $HOME/.config/hypr/plugins/hyprspace/Hyprspace.so
--
-- # Load Dunst Notification Manager
-- exec-once = uwsm app -- dunst
--
-- # Using swayidle to start swaylock
-- # exec-once = uwsm app -- swayidle -w \
-- #             timeout 900 'swaylock -f' \
-- #             timeout 1600 'hyprctl dispatch dpms off' \
-- #             resume 'hyprctl dispatch dpms on' \
-- #             before-sleep 'swaylock -f -c 000000'
--
-- exec-once = uwsm app -- swayidle -w \
--             timeout 900 'waylock' \
--             timeout 1600 'hyprctl dispatch dpms off' \
--             resume 'hyprctl dispatch dpms on' \
--             before-sleep 'waylock'
--
-- # Load cliphist history
-- exec-once = uwsm app -- wl-paste --watch cliphist store
-- # exec-once = uwsm app -- /usr/bin/emacs --daemon=serve
--
-- # Startup the system tray applets:
-- # exec-once = uwsm app -- nm-tray
-- # exec-once = uwsm app -- pasystray
-- exec-once = uwsm app -- garuda-system-maintenance
-- # exec-once = uwsm app -- blueman-applet
-- # exec-once = uwsm app -- flameshot
-- # exec-once = uwsm app -- firewall-applet
--
-- # toggle_kmonad
-- # exec-once = $HOME/.config/.scripts/toggle_kmonad.sh
-- # exec-once = uwsm app -- kmonad $HOME/.config/kmonad/k350.kbd
--
-- # Bluelight FROM garuda
-- exec-once = $HOME/.config/.scripts/ut-bluelight
-- # exec-once = wlsunset -t 2000 -T 2300
-- # exec-once = wlsunset -t 3000 -T 4000
--
-- # Initialize awww
-- exec-once = uwsm app -- awww query || uwsm app -- awww-daemon
--
-- # Load last wallpaper and waybar with pywal colors
-- exec-once = sleep 1 && $HOME/.config/.scripts/ut-wallpaper --init
