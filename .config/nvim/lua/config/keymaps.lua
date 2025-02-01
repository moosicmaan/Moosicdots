-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- enable zoom for neovide
vim.g.neovide_scale_factor = 1.0
local change_scale_factor = function(delta)
  vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
end
vim.keymap.set("n", "<C-=>", function()
  change_scale_factor(1.01)
end)
vim.keymap.set("n", "<C-->", function()
  change_scale_factor(1 / 1.01)
end)

-- open up the Dashboard
vim.keymap.set("n", "<leader>z", ":Dashboard<CR>", {
  desc = "Open Dashboard", -- This description will appear in WhichKey
})

-- This was supposed to reload the configuration so that pyway.nvim would pick up new colors...didn't work
-- local function reload_config()
--   for name, _ in pairs(package.loaded) do
--     if name:match("^plugins") or name:match("^lazyvim") then
--       package.loaded[name] = nil
--     end
--   end
--   vim.cmd("source $MYVIMRC")
--   vim.notify("Configuration reloaded!", vim.log.levels.INFO)
-- end
--
-- vim.keymap.set("n", "<leader>r", reload_config, {
--   desc = "RELOAD Configuration",
-- })
