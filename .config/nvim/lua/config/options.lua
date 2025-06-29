-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- JDB --> my changes/additions
local opt = vim.opt
opt.wrap = true -- Disable line wrap
opt.scrolloff = 14 -- Lines of context-put cursor in the middle of the screen
opt.termguicolors = true
opt.breakindent = true -- wrapped line repeats indent
opt.colorcolumn = "120"
opt.lisp = true -- automatic indenting for Lisp
opt.mousehide = true -- hide mouse pointer while typing
opt.softtabstop = 2 -- see multiple spaces as tabstops so <BS> does the right thing
opt.ttyfast = true -- speeds up scrolling in vim
-- opt.guicursor = "n-v-c:block,o:hor50,i-ci:ver25,r-cr:hor50,n-v:r-v:blinkon0,i:ver25"
-- for orgmode
opt.conceallevel = 2
opt.concealcursor = "nc"
vim.g.tutor_is_loaded = 0
-- for hyprlang and other files/types not natively recognized
vim.filetype.add({
  extension = { rasi = "rasi" },
  pattern = {
    [".*/.config/kmonad/.*%.kbd"] = "lisp",
    [".*/.config/hypr/.*%.conf"] = "hyprlang",
    [".*/.config/.settings/.*%.conf"] = "hyprlang",
    [".*/.config/.scripts/.*%.conf"] = "hyprlang",
    [".*/.local/bin/.*%.conf"] = "hyprlang",
  },
})
-- NEOVIDE CONFIGURE
if vim.g.neovide then
  -- Put anything you want to happen only in Neovide here
  vim.g.neovide_text_gamma = 0.9
  vim.g.neovide_text_contrast = 0.1
  vim.g.neovide_padding_top = 0
  vim.g.neovide_padding_bottom = 0
  vim.g.neovide_padding_right = 0
  vim.g.neovide_padding_left = 0
  vim.g.neovide_window_blurred = true
  vim.g.neovide_floating_blur_amount_x = 2.0
  vim.g.neovide_floating_blur_amount_y = 2.0
  -- vim.g.neovide_transparency = 0.2
  vim.g.neovide_position_animation_length = 0.15
  vim.g.neovide_scroll_animation_length = 0.2
  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_theme = "auto"
  vim.g.neovide_fullscreen = false
  vim.g.neovide_cursor_animation_length = 0.11
  vim.g.neovide_cursor_trail_size = 0.5
  vim.g.neovide_cursor_antialiasing = true
  vim.g.neovide_cursor_animate_in_insert_mode = true
  vim.g.neovide_cursor_animate_command_line = true
  vim.g.neovide_cursor_smooth_blink = false
  -- vim.g.neovide_cursor_vfx_particle_curl = 1.5 -- only for railgun
  -- vim.g.neovide_cursor_vfx_particle_phase = 1.5 -- only for railgun
  -- vim.g.neovide_cursor_vfx_mode = ""
  -- vim.g.neovide_cursor_vfx_mode = "railgun"
  -- vim.g.neovide_cursor_vfx_mode = "torpedo"
  vim.g.neovide_cursor_vfx_mode = "pixiedust"
  -- vim.g.neovide_cursor_vfx_mode = "sonicboom"
  -- vim.g.neovide_cursor_vfx_mode = "ripple"
  -- vim.g.neovide_cursor_vfx_mode = "wireframe"
  vim.g.neovide_cursor_vfx_opacity = 200.0
  vim.g.neovide_cursor_vfx_particle_lifetime = 1.0
  vim.g.neovide_cursor_vfx_particle_density = 7.0
  vim.g.neovide_cursor_vfx_particle_speed = 10.0
end

-- LAZYVIM DEFAULTS (commented out but here for reference)-->
-- vim.g.mapleader = " "
-- vim.g.maplocalleader = "\\"
--
-- -- LazyVim auto format
-- vim.g.autoformat = true
--
-- -- LazyVim picker to use.
-- -- Can be one of: telescope, fzf
-- -- Leave it to "auto" to automatically use the picker
-- -- enabled with `:LazyExtras`
-- vim.g.lazyvim_picker = "auto"
--
-- -- LazyVim root dir detection
-- -- Each entry can be:
-- -- * the name of a detector function like `lsp` or `cwd`
-- -- * a pattern or array of patterns like `.git` or `lua`.
-- -- * a function with signature `function(buf) -> string|string[]`
-- vim.g.root_spec = { "lsp", { ".git", "lua" }, "cwd" }
--
-- -- LazyVim automatically configures lazygit:
-- --  * theme, based on the active colorscheme.
-- --  * editorPreset to nvim-remote
-- --  * enables nerd font icons
-- -- Set to false to disable.
-- vim.g.lazygit_config = true
--
-- -- Options for the LazyVim statuscolumn
-- vim.g.lazyvim_statuscolumn = {
--   folds_open = false, -- show fold sign when fold is open
--   folds_githl = false, -- highlight fold sign with git sign color
-- }
--
-- -- Optionally setup the terminal to use
-- -- This sets `vim.o.shell` and does some additional configuration for:
-- -- * pwsh
-- -- * powershell
-- -- LazyVim.terminal.setup("pwsh")
--
-- -- Hide deprecation warnings
-- vim.g.deprecation_warnings = false
--
-- -- Set filetype to `bigfile` for files larger than 1.5 MB
-- -- Only vim syntax will be enabled (with the correct filetype)
-- -- LSP, treesitter and other ft plugins will be disabled.
-- -- mini.animate will also be disabled.
-- vim.g.bigfile_size = 1024 * 1024 * 1.5 -- 1.5 MB
--
-- -- Show the current document symbols location from Trouble in lualine
-- -- You can disable this for a buffer by setting `vim.b.trouble_lualine = false`
-- vim.g.trouble_lualine = true
--
-- local opt = vim.opt
--
-- opt.autowrite = true -- Enable auto write
-- -- only set clipboard if not in ssh, to make sure the OSC 52
-- -- integration works automatically. Requires Neovim >= 0.10.0
-- opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Sync with system clipboard
-- opt.completeopt = "menu,menuone,noselect"
-- opt.conceallevel = 2 -- Hide * markup for bold and italic, but not markers with substitutions
-- opt.confirm = true -- Confirm to save changes before exiting modified buffer
-- opt.cursorline = true -- Enable highlighting of the current line
-- opt.expandtab = true -- Use spaces instead of tabs
-- opt.fillchars = {
--   foldopen = "",
--   foldclose = "",
--   fold = " ",
--   foldsep = " ",
--   diff = "╱",
--   eob = " ",
-- }
-- opt.foldlevel = 99
-- opt.formatexpr = "v:lua.require'lazyvim.util'.format.formatexpr()"
-- opt.formatoptions = "jcroqlnt" -- tcqj
-- opt.grepformat = "%f:%l:%c:%m"
-- opt.grepprg = "rg --vimgrep"
-- opt.ignorecase = true -- Ignore case
-- opt.inccommand = "nosplit" -- preview incremental substitute
-- opt.jumpoptions = "view"
-- opt.laststatus = 3 -- global statusline
-- opt.linebreak = true -- Wrap lines at convenient points
-- opt.list = true -- Show some invisible characters (tabs...
-- opt.mouse = "a" -- Enable mouse mode
-- opt.number = true -- Print line number
-- opt.pumblend = 10 -- Popup blend
-- opt.pumheight = 10 -- Maximum number of entries in a popup
-- opt.relativenumber = true -- Relative line numbers
-- opt.scrolloff = 4 -- Lines of context
-- opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
-- opt.shiftround = true -- Round indent
-- opt.shiftwidth = 2 -- Size of an indent
-- opt.shortmess:append({ W = true, I = true, c = true, C = true })
-- opt.showmode = false -- Dont show mode since we have a statusline
-- opt.sidescrolloff = 8 -- Columns of context
-- opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
-- opt.smartcase = true -- Don't ignore case with capitals
-- opt.smartindent = true -- Insert indents automatically
-- opt.spelllang = { "en" }
-- opt.spelloptions:append("noplainbuffer")
-- opt.splitbelow = true -- Put new windows below current
-- opt.splitkeep = "screen"
-- opt.splitright = true -- Put new windows right of current
-- opt.statuscolumn = [[%!v:lua.require'lazyvim.util'.ui.statuscolumn()]]
-- opt.tabstop = 2 -- Number of spaces tabs count for
-- opt.termguicolors = true -- True color support
-- opt.timeoutlen = vim.g.vscode and 1000 or 300 -- Lower than default (1000) to quickly trigger which-key
-- opt.undofile = true
-- opt.undolevels = 10000
-- opt.updatetime = 200 -- Save swap file and trigger CursorHold
-- opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
-- opt.wildmode = "longest:full,full" -- Command-line completion mode
-- opt.winminwidth = 5 -- Minimum window width
-- opt.wrap = false -- Disable line wrap
--
-- if vim.fn.has("nvim-0.10") == 1 then
--   opt.smoothscroll = true
--   opt.foldexpr = "v:lua.require'lazyvim.util'.ui.foldexpr()"
--   opt.foldmethod = "expr"
--   opt.foldtext = ""
-- else
--   opt.foldmethod = "indent"
--   opt.foldtext = "v:lua.require'lazyvim.util'.ui.foldtext()"
-- end
--
-- -- Fix markdown indentation settings
-- vim.g.markdown_recommended_style = 0
-- -- LAZYVIM DEFAULTS <--
