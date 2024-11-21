-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--
--  local cmd = string.format("kitty @ --to unix:% set-spacing padding=0", kitty_socket)
--
--  Close NvimTree automatically if It's the Last Window
vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and vim.bo.filetype == "neo-tree" then
      vim.cmd("quit")
    end
  end,
})
