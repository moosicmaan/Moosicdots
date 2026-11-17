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
		-- layout = "dwindle",
	},
	decoration = {
		rounding = 0,
		rounding_power = 2,
		-- Change transparency of focused and unfocused windows
		active_opacity = 0.99,
		inactive_opacity = 0.95,
		fullscreen_opacity = 1.0,
		shadow = {
			enabled = false,
			range = 14,
			render_power = 3,
			color = "rgba(ee1a1a1a)",
		},
		blur = {
			enabled = false,
			brightness = 1.0,
			contrast = 0.8916,
			ignore_opacity = true,
			input_methods = false,
			input_methods_ignorealpha = 0.2,
			new_optimizations = true,
			noise = 0.0117,
			passes = 1,
			popups = false,
			popups_ignorealpha = 0.2,
			proportional = false,
			size = 5,
			special = false,
			-- variant = "ripple",
			acrylic = {
				aberration = 0.025,
				bulb = 48.0,
				clarity = 0.92,
				refraction = 24.0,
				tint = "0x14EEF5FF",
			},
			ripple = {
				duration = 0.95,
				radius = 400.0,
				strength = 30.0,
				width = 32.0,
			},
			vibrancy = 0.1696,
			vibrancy_darkness = 0.0,
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
		default_monitor = "HDMI-A-1",
		enable_hyprcursor = true,
		hide_on_key_press = true,
		inactive_timeout = 20,
		no_hardware_cursors = 2,
		sync_gsettings_theme = true,
		use_cpu_buffer = 2,
	},
})
