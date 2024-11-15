return {
  "nvimdev/dashboard-nvim",
  dependencies = { { "nvim-tree/nvim-web-devicons" } },
  opts = {
    theme = "hyper",
    preview = {},
    config = {
      week_header = {
        enable = true,
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
        -- {
        --   action = 'lua LazyVim.pick("oldfiles")()',
        --   group = "@property",
        --   desc = "Recent",
        --   icon = "",
        --   key = "r",
        -- },
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
