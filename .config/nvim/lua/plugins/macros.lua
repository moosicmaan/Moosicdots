return {
  "kr40/nvim-macros",
  cmd = { "MacroSave", "MacroYank", "MacroSelect", "MacroDelete" },
  opts = {
    json_file_path = vim.fs.normalize(vim.fn.stdpath("config") .. "/lua/assets/macros.json"),
    default_macro_register = "q",
    json_formatter = "jq",
  },
  keys = {
    { "<leader>m", desc = "Macros" }, -- This ensures "Macros" appears in WhichKey
    { "<leader>mv", ":MacroSave<CR>", desc = "Save Macro" },
    { "<leader>my", ":MacroYank<CR>", desc = "Yank Macro" },
    { "<leader>ms", ":MacroSelect<CR>", desc = "Select Macro" },
    { "<leader>md", ":MacroDelete<CR>", desc = "Delete Macro" },
  },
}
