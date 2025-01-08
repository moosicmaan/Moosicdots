local wezterm = require("wezterm")
local platform = require("utils.platform")

-- local font = "MesloLGM Nerd Font Mono"
local font = "JetBrainsMono Nerd Font"
-- local font = "SpaceMono Nerd Font Mono"
-- local font = "MesloLGS Nerd Font Mono"
-- local font = "Hack Nerd Font"
local fontsize = platform().is_mac and 14.5 or 14.5

return {
	font = wezterm.font_with_fallback({
		font, -- Primary font
		"Noto Sans Symbols", -- Fallback for symbols
		"Symbola", -- Fallback for extended Unicode symbols
		"Noto Color Emoji", -- Fallback for emoji
	}),
	-- font = wezterm.font(font),
	font_size = fontsize,

	--ref: https://wezfurlong.org/wezterm/config/lua/config/freetype_pcf_long_family_names.html#why-doesnt-wezterm-use-the-distro-freetype-or-match-its-configuration
	freetype_load_target = "Normal", ---@type 'Normal'|'Light'|'Mono'|'HorizontalLcd'
	freetype_render_target = "Normal", ---@type 'Normal'|'Light'|'Mono'|'HorizontalLcd'
}
