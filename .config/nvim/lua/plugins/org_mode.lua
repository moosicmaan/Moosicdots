return {
  "nvim-orgmode/orgmode",
  event = "VeryLazy",
  ft = { "org" },
  config = function()
    -- Setup orgmode
    require("orgmode").setup({
      org_agenda_files = "/mnt/data/moosicmaan/AGENDA/orgfiles/**/*",
      org_default_notes_file = "/mnt/data/moosicmaan/AGENDA/refile.org",
    })
  end,
}
