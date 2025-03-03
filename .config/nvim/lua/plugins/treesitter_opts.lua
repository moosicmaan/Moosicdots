return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    { "nvim-treesitter/playground" },
  },
  playground = {
    enable = true,
  },
  opts = {
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = { "org" },
    },
    indent = { enable = true },
    ensure_installed = {
      "bash",
      "c",
      "commonlisp",
      "diff",
      "json",
      "jsonc",
      "lua",
      "luadoc",
      "luap",
      "printf",
      "python",
      "regex",
      "toml",
      "yaml",
      "toml",
      "rust",
      "hyprlang",
      "org",
      "rasi",
      "fish",
    },
    -- ignore_installed = {
    --   "org",
    -- },
  },
}
