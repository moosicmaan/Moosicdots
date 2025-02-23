return {
  "nvim-orgmode/orgmode",
  event = "VeryLazy",
  ft = { "org" },
  config = function()
    -- Setup orgmode
    require("orgmode").setup({
      org_agenda_files = "/mnt/data/moosicmaan/AGENDA/*.org",
      org_default_notes_file = "/mnt/data/moosicmaan/AGENDA/notes.org",
      org_todo_keywords = { "TODO", "SCHEDULED", "|", "DONE", "ABANDONED" },
      org_split_mode = "vertical",
      org_capture_templates = {
        r = {
          description = "Repo",
          template = "* [[%x][%(return string.match('%x', '([^/]+)$'))]]%?",
          target = "/mnt/data/moosicmaan/AGENDA/repos.org",
        },
      },
      org_todo_keyword_faces = {
        SCHEDULED = ":foreground blue :weight bold",
        ABANDONED = ":background #333333 :slant italic :underline on",
        TODO = ":background #000000 :foreground red", -- overrides builtin color for `TODO` keyword
        DONE = ":background #000000 :foreground blue", -- overrides builtin color for `TODO` keyword
      },
    })

    -- NOTE: If you are using nvim-treesitter with ~ensure_installed = "all"~ option
    -- add ~org~ to ignore_install
    -- require('nvim-treesitter.configs').setup({
    --   ensure_installed = 'all',
    --   ignore_install = { 'org' },
    -- })
  end,
}
