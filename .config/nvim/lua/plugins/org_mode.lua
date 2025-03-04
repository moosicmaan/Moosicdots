return {
  "nvim-orgmode/orgmode",
  event = "VeryLazy",
  ft = { "org" },
  config = function()
    -- Setup orgmode
    -- local org = require("orgmode")
    -- org.setup_ts_grammar()
    require("orgmode").setup({
      org_agenda_files = {
        "/mnt/data/moosicmaan/ORG/agenda/*.org",
        "/mnt/data/moosicmaan/ORG/*.org",
      },
      org_default_notes_file = "/mnt/data/moosicmaan/ORG/refile.org",
      org_archive_location = "/mnt/data/moosicmaan/ORG/agenda/archive.org::* From %s",
      win_split_mode = "vertical",
      org_startup_folded = "content",
      org_todo_keywords = { "TODO", "WAITING", "|", "DONE", "DELEGATED" },
      org_todo_keyword_faces = {
        WAITING = ":foreground blue :weight bold",
        DELEGATED = ":background #FFFFFF :slant italic :underline on",
        TODO = ":background #000000 :foreground red", -- overrides builtin color for `TODO` keyword
      },
      org_log_done = "note",
      org_log_into_drawer = "LOGBOOK",
      mappings = {
        org = {
          org_toggle_checkbox = { "<Leader>of", "g<Space>", desc = "Toggle Checkbox" },
          org_todo = { "<Leader>o." },
          org_todo_prev = { "<Leader>o/" },
        },
        global = {
          -- org_capture = { "<D-c>", desc = "Open Capture Prompt" },
          -- org_agenda = { "<Leader>oa" },
          -- org_capture = { "<Leader>oc" },
        },
      },

      org_capture_templates = {
        r = {
          description = "Repo",
          template = "* [[%x][%(return string.match('%x', '([^/]+)$'))]]%?",
          target = "/mnt/data/moosicmaan/ORG/repos.org",
        },
        {
          j = {
            description = "Journal",
            template = "\n*** %<%Y-%m-%d> %<%A>\n**** %U\n\n%?",
            target = "/mnt/data/moosicmaan/ORG/journal.org",
          },
        },
      },
    })
  end,
}
