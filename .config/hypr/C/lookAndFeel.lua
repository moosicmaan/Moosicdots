---- LOAD PYWAL COLOR FILE ----
local colors = require("C.colorslink")

---- GENERAL ----
-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
	general = {
		gaps_in = 2,
		gaps_out = 2,
		border_size = 2,
		col = {
			active_border = { colors = { "rgba(efefeffa)", colors.color5 }, angle = 65 },
			inactive_border = { colors = { colors.color5, "rgba(333333aa)" }, angle = 65 },
		},
		-- Set to true to enable resizing windows by clicking and dragging on borders and gaps
		resize_on_border = false,
		-- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
		allow_tearing = false,
		layout = "master",
	},
	decoration = {
		rounding = 0,
		rounding_power = 0,
		-- Change transparency of focused and unfocused windows
		active_opacity = 0.93,
		inactive_opacity = 0.83,
		fullscreen_opacity = 1.0,
		shadow = {
			enabled = false,
			range = 14,
			render_power = 3,
			color = "rgba(ee1a1a1a)",
		},
		blur = {
			enabled = true,
			size = 8,
			passes = 2,
			ignore_opacity = true,
			xray = true,
		},
	},
	animations = {
		enabled = true,
	},
})

---- CURSOR ----
hl.config({
	cursor = {
		sync_gsettings_theme = true,
		no_hardware_cursors = 2,
		default_monitor = "HDMI-A-1",
		enable_hyprcursor = true,
		hide_on_key_press = true,
	},
})
