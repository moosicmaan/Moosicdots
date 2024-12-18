return {
	"nvimdev/dashboard-nvim",
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
	enabled = true,
	opts = {
		theme = "moosictheme",
		-- theme = "hyper",
		preview = {},
		hide = {
			statusline = false,
			tabline = true,
		},
		config = {
			week_header = {
				font = "~/.config/nvim/lua/assets/ansi_shadow.flf",
				enable = false,
			},
			no_git = {
				-- enable = true,
				enable = vim.fn.isdirectory(".git") == 0,
			},
			-- 		-- action can be a function type
			-- 		-- limit how many projects list, action when you press key or enter it will run this action.
			-- 		-- action can be a functino type, e.g.
			-- 		-- action = func(path) vim.cmd('telescope find_files cwd=' .. path) end
			project = {
				limit = 5, --will display +1
				enable = true,
				-- action = "fzf files cwd=",
				action = "require('fzf-lua').files({})",
			},
			mru = {
				enable = true,
				limit = 6,
				icon = " ",
				label = " Recent Files",
				cwd_only = false,
			},
			footer = {
				"",
				" 🚀 Sharp tools make good work.",
			},
			shortcut = {
				{
					group = "@property",
					desc = "Update",
					icon = "󰊳",
					action = "Lazy update",
					key = "u",
				},
				{
					group = "@property",
					action = "lua LazyVim.pick()()",
					desc = "Find",
					icon = "",
					key = "f",
				},
				{
					group = "@property",
					action = "ene | startinsert",
					desc = "New",
					icon = "",
					key = "n",
				},
				{
					action = 'lua LazyVim.pick("oldfiles")()',
					group = "@property",
					desc = "Recent",
					icon = "",
					key = "r",
				},
				{
					group = "@property",
					action = 'lua LazyVim.pick("live_grep")()',
					desc = "GREP",
					icon = "",
					key = "g",
				},
				{
					group = "@property",
					action = "lua LazyVim.pick.config_files()()",
					desc = "Conf",
					icon = "",
					key = "c",
				},
				{
					group = "@property",
					action = 'lua require("persistence").load()',
					desc = "Last",
					icon = "",
					key = "s",
				},
				{
					group = "@property",
					action = "LazyExtras",
					desc = "Extras",
					icon = "",
					key = "x",
				},
				{
					group = "@property",
					action = "Lazy",
					desc = "Lazy",
					icon = "󰒲",
					key = "l",
				},
				{
					group = "@property",
					action = function()
						vim.api.nvim_input("<cmd>qa<cr>")
					end,
					desc = "Quit",
					icon = "",
					key = "q",
				},
			},
		},
	},
}
