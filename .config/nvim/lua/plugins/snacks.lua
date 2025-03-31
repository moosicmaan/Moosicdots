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
        width = 70,
        row = nil, -- dashboard position. nil for center
        col = nil, -- dashboard position. nil for center
        pane_gap = 4, -- empty columns between vertical panes
        autokeys = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", -- autokey sequence
        -- These settings are used by some built-in sections
        preset = {
          -- Defaults to a picker that supports `fzf-lua`, `telescope.nvim` and `mini.pick`
          ---@type fun(cmd:string, opts:table)|nil
          pick = nil,
          -- Used by the `keys` section to show keymaps.
          -- Set your custom keymaps here.
          -- When using a function, the `items` argument are the default keymaps.
          ---@type snacks.dashboard.Item[]
          -- keys = {
          --   { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          --   { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          --   { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          --   { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          --   {
          --     icon = " ",
          --     key = "c",
          --     desc = "Config",
          --     action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
          --   },
          --   { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          --   { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
          --   { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          -- },
          -- Used by the `header` section
          header = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
        },
        -- item field formatters
        formats = {
          icon = function(item)
            -- if item.file and item.icon == "file" or item.icon == "directory" then
            -- return M.icon(item.file, item.icon)
            -- end
            return { item.icon, width = 2, hl = "icon" }
          end,
          footer = { "%s", align = "center" },
          header = { "%s", align = "center" },
          file = function(item, ctx)
            local fname = vim.fn.fnamemodify(item.file, ":~")
            fname = ctx.width and #fname > ctx.width and vim.fn.pathshorten(fname) or fname
            if #fname > ctx.width then
              local dir = vim.fn.fnamemodify(fname, ":h")
              local file = vim.fn.fnamemodify(fname, ":t")
              if dir and file then
                file = file:sub(-(ctx.width - #dir - 2))
                fname = dir .. "/…" .. file
              end
            end
            local dir, file = fname:match("^(.*)/(.+)$")
            return dir and { { dir .. "/", hl = "dir" }, { file, hl = "file" } } or { { fname, hl = "file" } }
          end,
        },
        sections = {
          -- { section = "header" },
          {
            section = "terminal",
            -- cmd = "colorscript -e square",
            cmd = "figlet -f ~/.config/nvim/lua/assets/fonts/ansi_shadow.flf 'Today'",
            height = 5,
            padding = 1,
          },
          {
            -- pane = 2,
            section = "terminal",
            cmd = "colorscript -e square",
            -- cmd = "figlet 'Hello!'",
            height = 5,
            padding = 1,
          },
          {
            section = "keys",
            render = function(items)
              local line = ""
              for _, item in ipairs(items) do
                line = line .. item.text .. "  "
              end
              return line
            end,
            items = {
              { text = "󰊳Update [u]", action = ":SnackUpdate<CR>" },
              { text = "Find [f]", action = ":Telescope find_files<CR>" },
              { text = "New [n]", action = ":enew<CR>" },
              { text = "Recent [r]", action = ":Telescope oldfiles<CR>" },
              { text = "GREP [g]", action = ":Telescope live_grep<CR>" },
              { text = "Conf [c]", action = ":e $MYVIMRC<CR>" },
              { text = "Last [s]", action = ":bprevious<CR>" },
              { text = "Extras [x]", action = ":Telescope commands<CR>" },
              { text = "󰒲Lazy [l]", action = ":Lazy<CR>" },
              { text = "Quit [q]", action = ":q<CR>" },
            },
          },
          -- { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
          -- { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
          { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
          { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
          {
            -- pane = 2,
            icon = " ",
            title = "Git Status",
            section = "terminal",
            enabled = function()
              return Snacks.git.get_root() ~= nil
            end,
            cmd = "git --no-pager diff --stat -B -M -C",
            height = 5,
            padding = 1,
            ttl = 5 * 60,
            indent = 3,
          },
          { section = "startup" },
        },
        -- sections = {
        --   { section = "header" },
        --   { section = "keys", gap = 1, padding = 1 },
        --   { section = "startup" },
        -- },
      },
    },
  },
}
