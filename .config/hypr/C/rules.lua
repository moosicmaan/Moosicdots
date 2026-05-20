---- WORKSPACES RULES ----
-- "Smart gaps" / "No gaps when only"
hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
hl.workspace_rule({ workspace = "f[1]", gaps_out = 0, gaps_in = 0 })
hl.window_rule({
	name = "no-gaps-wtv1",
	match = { float = false, workspace = "w[tv1]" },
	border_size = 0,
	rounding = 0,
})
hl.window_rule({
	name = "no-gaps-f1",
	match = { float = false, workspace = "f[1]" },
	border_size = 0,
	rounding = 0,
})
hl.workspace_rule({ workspace = "10", monitor = "eDP-1", default = false })
hl.workspace_rule({ workspace = "1", monitor = "eDP-1", default = true })
hl.workspace_rule({ workspace = "2", monitor = "eDP-1", default = false, layout = "scrolling" })
hl.workspace_rule({ workspace = "3", monitor = "eDP-1", default = false, layout = "scrolling" })
hl.workspace_rule({ workspace = "4", monitor = "HDMI-A-1", default = false })
hl.workspace_rule({ workspace = "5", monitor = "HDMI-A-1", default = false })
hl.workspace_rule({ workspace = "6", monitor = "HDMI-A-1", default = true })
hl.workspace_rule({ workspace = "7", monitor = "HDMI-A-1", default = false })
hl.workspace_rule({ workspace = "8", monitor = "HDMI-A-1", default = false })
hl.workspace_rule({ workspace = "9", monitor = "HDMI-A-1", default = false })

---- WINDOWS RULES ----
-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
hl.window_rule({
	name = "foot override",
	match = { initial_title = "foot" },
	opacity = "0.85 override 0.74 override 1.0 override",
})
hl.window_rule({
	name = "MPV rules",
	match = {
		class = "mpv",
	},
	border_size = 0,
	float = true,
	dim_around = true,
	center = true,
	suppress_event = "fullscreen",
	size = { 800, 450 },
	opacity = "1.0 override 1.0 override 1.0 override",
})
hl.window_rule({
	name = "VLC rules",
	match = {
		class = "vlc",
	},
	border_size = 0,
	float = true,
	dim_around = true,
	center = true,
	suppress_event = "fullscreen",
	size = { 800, 450 },
	opacity = "1.0 override 1.0 override 1.0 override",
})
hl.window_rule({
	name = "waypaper rules",
	match = {
		class = "waypaper",
	},
	border_size = 1,
	float = true,
	dim_around = true,
	center = true,
	stay_focused = true,
	suppress_event = "fullscreen",
	size = { 1530, 726 },
	opacity = "1.0 override 1.0 override 1.0 override",
})
hl.window_rule({
	name = "galculator rules",
	match = {
		class = "galculator",
	},
	border_size = 1,
	float = true,
	center = true,
	size = { 500, 300 },
	opacity = "1.0 override 1.0 override 1.0 override",
})
hl.window_rule({
	name = "cava rules",
	match = {
		class = "cava",
	},
	opacity = "0.8",
	float = true,
	size = { 800, 800 },
	fullscreen = false,
	xray = true,
	suppress_event = "activatefocus",
	border_size = 10,
})
local streaming_titles = ".*Watch.*|.*Picture%-in%-Picture.*|.*Tubi.*|.*Prime Video.*|"
	.. ".*amazon%.com.*|.*Crackle.*|.*Pluto.*|.*Freevie.*|.*Netflix.*|"
	.. ".*Disney.*|.*Peacock.*|.*Paramount.*|.*Vimeo.*|.*Vudu.*|"
	.. ".*Fandango.*|.*IMDb.*|.*YouTube.*|.*Popcornflix.*|Picture-in-Picture"
hl.window_rule({
	match = {
		title = streaming_titles,
	},
	opacity = "1.0 override 1.0 override 1.0 override",
})
hl.window_rule({
	match = {
		title = streaming_titles,
	},
	idle_inhibit = "fullscreen",
})
hl.window_rule({ match = { xwayland = true }, border_size = 3 })
hl.window_rule({ match = { class = "clamtk" }, float = true })
hl.window_rule({ match = { class = "elisa" }, float = true })
hl.window_rule({ match = { class = "org.kde.elisa" }, float = true })
hl.window_rule({ match = { class = "setup-assistant" }, float = true })
hl.window_rule({ match = { class = "btrfs-assistant" }, float = true })
hl.window_rule({ match = { class = "wihotspot" }, float = true })
hl.window_rule({ match = { class = "modem-manager-gui" }, float = true })
hl.window_rule({ match = { class = "nm-connection-editor" }, float = true })
hl.window_rule({ match = { class = "garuda*" }, float = true })
hl.window_rule({ match = { class = "floating" }, center = true })
-- Hyprland-run windowrule
hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },
	move = "20 monitor_h-120",
	float = true,
})
-- Example window rules that are useful
local suppressMaximizeRule = hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	name = "suppress-maximize-events",
	match = { class = ".*" },
	suppress_event = "maximize",
})
suppressMaximizeRule:set_enabled(true)
hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},
	no_focus = true,
})

---- LAYERS RULES ----
-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)
hl.layer_rule({
	name = "rofi rules",
	match = {
		namespace = "rofi",
	},
	dim_around = true,
})
hl.layer_rule({
	name = "logout",
	match = {
		namespace = "logout_dialog",
	},
	blur = true,
	xray = true,
})
