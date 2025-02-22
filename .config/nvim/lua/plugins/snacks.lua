return {
  -- add symbols-outline
  {
    "snacks.nvim",
    opts = {
      explorer = {
        -- your explorer configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        enabled = true,
      },
      picker = {
        sources = {
          buffers = {
            hidden = true,
          },
          grep = {
            hidden = true,
          },
          files = {
            hidden = true,
          },
          explorer = {
            -- to show the explorer to the right, add the below to
            -- your config under `opts.picker.sources.explorer`
            -- layout = { layout = { position = "right" } },
            -- your explorer picker configuration comes here
            -- or leave it empty to use the default settings
            hidden = true,
            tree = true,
            auto_close = false,
            jump = { close = true },
            layout = {
              layout = { position = "left" },
              preset = "sidebar",
              preview = false,
            },
          },
        },
      },
      dashboard = {
        enabled = false,
        -- your dashboard configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        width = 80,
        preset = {
          -- header = {
          -- 	function()
          -- 		-- Set the font dynamically using the font parameter
          -- local fonth = "slant",
          -- version = "day", -- 		local command if version == "day" then
          -- 			command = string.format("figlet -f %s $(date '+%%A')", font)
          -- 			command = string.format("figlet -f %s 'MoosicVIM'", font)
          -- 		end
          --
          -- 		local handle = io.popen(command)
          -- 		if not handle then
          -- 			return { "Error: Failed to execute figlet command." }
          -- 		end
          --
          -- 		local result = handle:read("*a")
          -- 		handle:close()
          --
          -- 		-- Split the result into lines and store them in a table
          -- 		local formatted_header = {}
          -- 		table.insert(formatted_header, "")
          -- 		for line in result:gmatch("[^\r\n]+") do
          -- 			table.insert(formatted_header, line)
          -- 		end
          -- 		return formatted_header
          -- 	end,
          -- },
          -- header = [[
          --  ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z
          --  ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z
          --  ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z
          --  ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z
          --  ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║
          --  ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝
          --   ]],
          -- stylua: ignore
          ---@type snacks.dashboard.Item[]
          -- keys = {
          --   { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          --   { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          --   { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          --   { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          --   { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
          --   { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          --   { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
          --   { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
          --   { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          -- },
        },
        sections = {
          -- { section = "header", padding = 0 },
          {
            section = "header",
            function()
              -- Set the font dynamically using the font parameter
              local font = "slant"
              local command = string.format("figlet -f %s $(date '+%%A')", font)

              local handle = io.popen(command)
              if not handle then
                return { "Error: Failed to execute figlet command." }
              end

              local result = handle:read("*a")
              handle:close()

              -- Split the result into lines and store them in a table
              local formatted_header = {}
              table.insert(formatted_header, "")
              for line in result:gmatch("[^\r\n]+") do
                table.insert(formatted_header, line)
              end
              return formatted_header
            end,
          },
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
