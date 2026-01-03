return {
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  ft = "markdown",
  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    legacy_commands = false, -- this will be removed in the next major release
    workspaces = {
      {
        name = "3_0-personal",
        path = "~/Documents/3_0",
      },
      -- {
      --   name = "work",
      --   path = "~/vaults/work",
      -- },
    },
    -- keys = {
    --   { icon = "📝", key = "o", desc = "Obsidian", action = ":Obsidian" },
    -- },
  },
  ui = {
    enabled = false,
  },
}
