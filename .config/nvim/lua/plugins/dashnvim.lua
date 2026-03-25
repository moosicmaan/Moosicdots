return {
    "nvimdev/dashboard-nvim",
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
    enabled = true,
    opts = {
        theme = "moosictheme",
        -- theme = "hyper",
        -- theme = "doom",
        disable_move = false, --  default is false disable move keymap for hyper
        shortcut_type = "letter", --  shorcut type 'letter' or 'number'
        shuffle_letter = false, --  default is true, shortcut 'letter' will be randomize, set to false to have ordered letter.
        change_to_vcs_root = false, -- default is false,for open file in hyper mru. it will change to the root of vcs
        preview = {
            -- command = "figlet -f slant",
            -- file_path = "YourTextHere",
            -- file_height = 30, -- preview file height
            -- file_width = 100, -- preview file width
        },
        hide = {
            statusline = false,
            tabline = true,
        },

        config = {
            -- Theme Highlight groups:
            --    DashboardHeader DashboardFooter
            --    DashboardProjectTitle DashboardProjectTitleIcon DashboardProjectIcon
            --    DashboardMruTitle DashboardMruIcon DashboardFiles DashboardShortCutIcon
            -- header -- type is table def
            week_header = {
                enable = true, --boolean use a week header
                -- concat  --concat string after time string line
                -- append  --table append after time string line
                -- font = "~/.config/nvim/lua/assets/fonts/doh.flf",
                -- font = "slant",
            },
            no_git = {
                -- enable = true,
                enable = vim.fn.isdirectory(".git") == 0,
            },
            packages = { enable = true }, -- show how many plugins neovim loaded
            project = {
                enable = true,
                limit = 5, --will display +1
                icon = "󰏓 ",
                -- action can be a function type, e.g.
                -- action = func(path) vim.cmd('telescope find_files cwd=' .. path) end
                -- action = "require('fzf-lua').files({})",
                action = function()
                    require("snacks").picker("files")
                end,
                label = " Recent Projects:",
            },
            mru = {
                enable = true,
                limit = 6,
                icon = " ",
                label = " Recent Files:",
                cwd_only = false,
            },
            footer = {
                "",
                "~🌊 Create That Which You Want to Join 🔥~",
            },
            shortcut = {
                {
                    group = "@property",
                    desc = "Update",
                    icon = "󰊳 ",
                    action = "Lazy update",
                    key = "u",
                },
                {
                    group = "@Constant",
                    action = "lua LazyVim.pick()()",
                    desc = "Find",
                    icon = " ",
                    key = "f",
                },
                {
                    group = "@property",
                    action = "ene | startinsert",
                    desc = "New",
                    icon = " ",
                    key = "n",
                },
                {
                    group = "@Constant",
                    action = 'lua LazyVim.pick("oldfiles")()',
                    desc = "Recent",
                    icon = " ",
                    key = "r",
                },
                {
                    group = "@property",
                    action = 'lua LazyVim.pick("live_grep")()',
                    desc = "GREP",
                    icon = " ",
                    key = "g",
                },
                {
                    group = "@Constant",
                    action = "lua LazyVim.pick.config_files()()",
                    desc = "Conf",
                    icon = " ",
                    key = "c",
                },
                {
                    group = "@property",
                    action = 'lua require("persistence").load()',
                    desc = "Last",
                    icon = " ",
                    key = "s",
                },
                {
                    group = "@Constant",
                    action = "LazyExtras",
                    desc = "Extras",
                    icon = " ",
                    key = "x",
                },
                {
                    group = "@property",
                    action = "Lazy",
                    desc = "Lazy",
                    icon = "󰒲 ",
                    key = "l",
                },
                {
                    group = "@Function",
                    action = function()
                        vim.api.nvim_input("<cmd>qa<cr>")
                    end,
                    desc = "Quit",
                    icon = " ",
                    key = "q",
                },
            },
        },
    },
}
