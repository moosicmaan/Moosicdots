return {
  "nvim-neo-tree/neo-tree.nvim",
  enabled = false,
  opts = {
    add_blank_line_at_top = false, -- Add a blank line at the top of the tree.
    statusline = true,
    filesystem = {
      bind_to_cwd = false,
      follow_current_file = { enabled = true },
      -- hijack_netrw_behavior = "open_default", -- Use neo-tree to handle netrw
      use_libuv_file_watcher = true,
      -- cwd_target = {
      --   current = "window", -- Keep the cwd consistent with the window
      --   search_upwards = true, -- Search upwards for a .git directory
      -- },
      filtered_items = {
        visible = true,
        show_hidden_count = true,
        hide_dotfiles = false,
        hide_gitignored = true,
        hide_by_name = {
          -- '.git',
          -- '.DS_Store',
          -- 'thumbs.db',
        },
        never_show = {},
      },
    },
    window = {
      width = 30,
      mappings = {
        ["<space>"] = {
          "toggle_node",
          nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use
        },
        -- ["<CR>"] = "open_with_cwd",
      },
    },
  },
}
