local wezterm = require("wezterm")
local gpu_adapters = require("utils.gpu_adapter")
-- local colors = require("colors.custom")

return {
	animation_fps = 60,
	max_fps = 60,
	front_end = "WebGpu",
	webgpu_power_preference = "HighPerformance",
	webgpu_preferred_adapter = gpu_adapters:pick_best(),

	-- ------------------------------------------------
	-- COLORS
	-- ------------------------------------------------
	-- The color scheme:
	-- color_scheme = "Campbell '(Gogh)",
	color_scheme = "CGA",
	-- colors = {
	-- 	foreground = "white",
	-- 	background = "black",
	-- },

	-- scrollbar
	enable_scroll_bar = false,

	-- tab bar
	enable_tab_bar = true,
	hide_tab_bar_if_only_one_tab = true,
	use_fancy_tab_bar = true,
	tab_max_width = 25,
	show_tab_index_in_tab_bar = false,
	switch_to_last_active_tab_when_closing_tab = true,

	-- window
	-- window_decorations = "INTEGRATED_BUTTONS | RESIZE",

	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
	window_close_confirmation = "NeverPrompt",
	window_frame = {
		-- The font used in the tab bar.
		-- Roboto Bold is the default; this font is bundled
		-- with wezterm.
		-- Whatever font is selected here, it will have the
		-- main font setting appended to it to pick up any
		-- fallback fonts you may have used there.
		font = wezterm.font({ family = "Roboto", weight = "Bold" }),
		-- The size of the font in the tab bar.
		-- Default to 10.0 on Windows but 12.0 on other systems
		font_size = 8.0,
		-- The overall background color of the tab bar when
		-- the window is focused
		active_titlebar_bg = "#000000",
		-- The overall background color of the tab bar when
		-- the window is not focused
		inactive_titlebar_bg = "#313131",
	},
	inactive_pane_hsb = {
		saturation = 0.9,
		brightness = 0.65,
	},
}
