return {
	-- add symbols-outline
	{
		"snacks.nvim",
		opts = {
			dashboard = {
				enabled = false,
				-- your dashboard configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
				width = 80,
				preset = {
					-- header = {
					-- 	{
					-- 		section = "terminal",
					-- 		padding = 1,
					-- 		random = 10,
					-- 	},
					-- },
					header = [[
  ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z
  ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z    
  ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z       
  ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z         
  ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║           
  ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝           
   ]],
        -- stylua: ignore
        ---@type snacks.dashboard.Item[]
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
          { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
				},
				sections = {
					{ section = "header", padding = 0 },
					{ section = "keys", padding = 0 },
					{ section = "startup" },
					{ section = "recent_files", icon = " ", title = "Recent Files", indent = 3, padding = 0 },
					{ section = "projects", icon = " ", title = "Projects", indent = 3, padding = 0 },
					{
						section = "terminal",
						icon = " ",
						title = "Git Status",
						enabled = vim.fn.isdirectory(".git") == 1,
						cmd = "hub diff --stat -B -M -C",
						height = 8,
						padding = 0,
						indent = 0,
					},
				},
			},
		},
	},
}
