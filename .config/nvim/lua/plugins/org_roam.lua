return {
  "chipsenkbeil/org-roam.nvim",
  tag = "0.1.1",
  dependencies = {
    {
      "nvim-orgmode/orgmode",
      tag = "0.3.7",
    },
  },
  config = function()
    require("org-roam").setup({
      directory = "/mnt/data/moosicmaan/AGENDA/orgroam/**/*",
      -- optional
      org_files = {
        "/mnt/data/moosicmaan/AGENDA/orgfiles/**/*",
        "/mnt/data/moosicmaan/AGENDA/*.org",
        "/mnt/data/moosicmaan/AGENDA/refile.org",
      },
    })
  end,
}
