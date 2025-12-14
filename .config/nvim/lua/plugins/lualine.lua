return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = function()
    local opts = {
      options = {
        -- theme = "catppucchin",
        -- theme = "powerline_dark",
        -- theme = "pywal",
        -- theme = "codedark",
        -- theme = "gruvbox",
        -- theme = "ayu_dark",
        -- theme = "nightfly",
        -- theme = "papercolor_dark",
        globalstatus = vim.o.laststatus == 3,
        disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard" } },
        -- component_separators = { left = "", right = "" },
        -- section_separators = { left = "", right = "" },
        -- section_separators = { left = "", right = "" },
        -- component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
        -- section_separators = "",
        -- component_separators = "",
      },
    }
    return opts
  end,
}
