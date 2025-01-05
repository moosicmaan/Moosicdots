local wezterm = require("wezterm")
local platform = require("utils.platform")

-- local font = "MesloLGM Nerd Font Mono"
-- local font = "JetBrainsMono NFM ExtraBold"
-- local font = "SpaceMono Nerd Font Mono"
local font = "MesloLGLNerdFontMono"
local font_size = platform().is_mac and 14 or 14

return {
	font = wezterm.font(font),
	font_size = font_size,

	--ref: https://wezfurlong.org/wezterm/config/lua/config/freetype_pcf_long_family_names.html#why-doesnt-wezterm-use-the-distro-freetype-or-match-its-configuration
	freetype_load_target = "Normal", ---@type 'Normal'|'Light'|'Mono'|'HorizontalLcd'
	freetype_render_target = "Normal", ---@type 'Normal'|'Light'|'Mono'|'HorizontalLcd'
}
