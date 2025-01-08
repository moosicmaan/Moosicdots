#!/usr/bin/lua
local wezterm = require("wezterm")

return {
	font = wezterm.font("MesloLGM Nerd Font Mono"),
	font_size = 14,

	window_frame = {
		font = wezterm.font("JetBrainsMono Nerd Font"), -- To debug window frame font glyphs
	},

	keys = {
		{
			key = "f",
			mods = "CTRL",
			action = wezterm.action_callback(function(window, pane)
				window:toast_notification("Debug Glyphs", "Test glyph: 𝒜 🌟 🚀", nil, 5000)
			end),
		},
	},
}
