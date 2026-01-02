require("full-border"):setup({
	-- Available values: ui.Border.PLAIN, ui.Border.ROUNDED
	type = ui.Border.PLAIN,
})

require("git"):setup()

require("yatline"):setup({
	--theme = my_theme,
	section_separator = { open = "", close = "" },
	part_separator = { open = "", close = "" },
	inverse_separator = { open = "", close = "" },

	style_a = {
		fg = "black",
		bg_mode = {
			normal = "brightgreen",
			select = "yellow",
			un_set = "red",
		},
	},
	style_b = { bg = "brightwhite", fg = "black" },
	style_c = { bg = "black", fg = "brightwhite" },

	permissions_t_fg = "green",
	permissions_r_fg = "yellow",
	permissions_w_fg = "red",
	permissions_x_fg = "cyan",
	permissions_s_fg = "white",

	tab_width = 20,
	tab_use_inverse = true,

	selected = { icon = "󰻭", fg = "yellow" },
	copied = { icon = "", fg = "green" },
	cut = { icon = "", fg = "red" },

	total = { icon = "󰮍", fg = "yellow" },
	succ = { icon = "", fg = "green" },
	fail = { icon = "", fg = "red" },
	found = { icon = "󰮕", fg = "blue" },
	processed = { icon = "󰐍", fg = "green" },

	show_background = false,

	display_header_line = true,
	display_status_line = true,

	component_positions = { "header", "tab", "status" },

	header_line = {
		left = {
			section_a = {
				{ type = "line", custom = false, name = "tabs", params = { "left" } },
			},
			section_b = {},
			section_c = {},
		},
		right = {
			section_a = {
				-- { type = "string", custom = false, name = "date", params = { "%A, %d %B %Y" } },
				{ type = "string", custom = false, name = "date", params = { "%X" } },
			},
			section_b = {
				{ type = "string", custom = false, name = "hovered_path" },
				{ type = "coloreds", custom = false, name = "link" },
			},
			section_c = {},
		},
	},

	status_line = {
		left = {
			section_a = {
				{ type = "string", custom = false, name = "tab_mode" },
			},
			section_b = {
				{ type = "string", custom = false, name = "hovered_file_extension", params = { true } },
				{ type = "string", custom = false, name = "hovered_mime" },
				-- { type = "string", custom = false, name = "hovered_size" },
			},
			section_c = {
				{ type = "coloreds", custom = false, name = "count" },
			},
		},
		right = {
			section_a = {
				{ type = "string", custom = false, name = "cursor_position" },
				-- { type = "string", custom = false, name = "cursor_percentage" },
			},
			section_b = {
				{ type = "string", custom = false, name = "hovered_ownership" },
			},
			section_c = {
				-- { type = "string", custom = false, name = "hovered_file_extension", params = { true } },
				{ type = "coloreds", custom = false, name = "permissions" },
			},
		},
	},
})

require("relative-motions"):setup({ show_numbers = "relative", show_motion = true, enter_mode = "first" })
