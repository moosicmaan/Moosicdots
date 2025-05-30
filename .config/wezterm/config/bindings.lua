local wezterm = require("wezterm")
local platform = require("utils.platform")()
local act = wezterm.action

local mod = {}

if platform.is_mac then
	mod.SUPER = "SUPER"
	mod.SUPER_REV = "SUPER|CTRL"
elseif platform.is_win or platform.is_linux then
	mod.SUPER = "ALT" -- to not conflict with Windows key shortcuts
	mod.SUPER_REV = "ALT|CTRL"
end

local keys = {
	-- misc/useful --
	{ key = "F1", mods = "NONE", action = "ActivateCopyMode" },
	{ key = "F2", mods = "NONE", action = act.ActivateCommandPalette },
	{ key = "F3", mods = "NONE", action = act.ShowLauncher },
	{ key = "F4", mods = "NONE", action = act.ShowLauncherArgs({ flags = "FUZZY|TABS" }) },
	{
		key = "F5",
		mods = "NONE",
		action = act.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }),
	},
	{ key = "F11", mods = "NONE", action = act.ToggleFullScreen },
	{ key = "F12", mods = "NONE", action = act.ShowDebugOverlay },
	{ key = "f", mods = mod.SUPER, action = act.Search({ CaseInSensitiveString = "" }) },
	{
		key = "u",
		mods = mod.SUPER,
		action = wezterm.action.QuickSelectArgs({
			label = "open url",
			patterns = {
				"\\((https?://\\S+)\\)",
				"\\[(https?://\\S+)\\]",
				"\\{(https?://\\S+)\\}",
				"<(https?://\\S+)>",
				"\\bhttps?://\\S+[)/a-zA-Z0-9-]+",
			},
			action = wezterm.action_callback(function(window, pane)
				local url = window:get_selection_text_for_pane(pane)
				wezterm.log_info("opening: " .. url)
				wezterm.open_with(url)
			end),
		}),
	},

	-- cursor movement --
	{ key = "LeftArrow", mods = mod.SUPER, action = act.SendString("\x1bOH") },
	{ key = "RightArrow", mods = mod.SUPER, action = act.SendString("\x1bOF") },
	{ key = "Backspace", mods = mod.SUPER, action = act.SendString("\x15") },

	-- copy/paste --
	{ key = "c", mods = "CTRL|SHIFT", action = act.CopyTo("Clipboard") },
	{ key = "v", mods = "CTRL|SHIFT", action = act.PasteFrom("Clipboard") },
	{ key = "Insert", mods = "SHIFT", action = act.PasteFrom("PrimarySelection") },

	-- tabs --
	-- tabs: spawn+close
	{ key = "t", mods = mod.SUPER, action = act.SpawnTab("DefaultDomain") },
	{ key = "q", mods = mod.SUPER, action = act.CloseCurrentTab({ confirm = false }) },

	-- tabs: navigation
	{ key = "h", mods = mod.SUPER, action = act.ActivateTabRelative(-1) },
	{ key = "l", mods = mod.SUPER, action = act.ActivateTabRelative(1) },

	-- window --
	-- spawn windows
	{ key = "n", mods = mod.SUPER, action = act.SpawnWindow },

	-- panes --
	-- panes: split panes
	{
		key = [[-]],
		mods = mod.SUPER,
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = [[\]],
		mods = mod.SUPER,
		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},

	-- panes: zoom+close pane
	{ key = "Enter", mods = mod.SUPER, action = act.TogglePaneZoomState },
	{ key = "w", mods = mod.SUPER, action = act.CloseCurrentPane({ confirm = false }) },

	-- panes: navigation
	{ key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
	{ key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
	{ key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
	{ key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
	{
		key = "p",
		mods = mod.SUPER_REV,
		action = act.PaneSelect({ alphabet = "1234567890", mode = "SwapWithActiveKeepFocus" }),
	},

	-- scrollback
	{ key = "PageUp", mods = "SHIFT", action = act.ScrollByPage(-0.5) },
	{ key = "PageDown", mods = "SHIFT", action = act.ScrollByPage(0.5) },

	-- fonts: resize
	{ key = "UpArrow", mods = mod.SUPER_REV, action = act.IncreaseFontSize },
	{ key = "DownArrow", mods = mod.SUPER_REV, action = act.DecreaseFontSize },
	{ key = "r", mods = mod.SUPER_REV, action = act.ResetFontSize },

	-- key-tables --
	-- resizes fonts
	{
		key = "f",
		mods = "LEADER",
		action = act.ActivateKeyTable({
			name = "resize_font",
			one_shot = false,
			timemout_miliseconds = 1000,
		}),
	},
	-- resize panes
	{
		key = "p",
		mods = "LEADER",
		action = act.ActivateKeyTable({
			name = "resize_pane",
			one_shot = false,
			timemout_miliseconds = 1000,
		}),
	},
}

local key_tables = {
	resize_font = {
		{ key = "k", action = act.IncreaseFontSize },
		{ key = "j", action = act.DecreaseFontSize },
		{ key = "r", action = act.ResetFontSize },
		{ key = "Escape", action = "PopKeyTable" },
		{ key = "q", action = "PopKeyTable" },
	},
	resize_pane = {
		{ key = "k", action = act.AdjustPaneSize({ "Up", 1 }) },
		{ key = "j", action = act.AdjustPaneSize({ "Down", 1 }) },
		{ key = "h", action = act.AdjustPaneSize({ "Left", 1 }) },
		{ key = "l", action = act.AdjustPaneSize({ "Right", 1 }) },
		{ key = "Escape", action = "PopKeyTable" },
		{ key = "q", action = "PopKeyTable" },
	},
}

local mouse_bindings = {
	-- Ctrl-click will open the link under the mouse cursor
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "CTRL",
		action = act.OpenLinkAtMouseCursor,
	},
}

return {
	disable_default_key_bindings = false,
	keys = {
		{ key = "=", mods = "CTRL", action = wezterm.action.IncreaseFontSize },
		{ key = "-", mods = "CTRL", action = wezterm.action.DecreaseFontSize },
	},
	-- disable_default_key_bindings = true,
	-- leader = { key = "Space", mods = "CTRL" },
	-- keys = keys,
	-- key_tables = key_tables,
	-- mouse_bindings = mouse_bindin.gs,
}
