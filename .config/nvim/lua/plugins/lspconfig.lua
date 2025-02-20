return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = {
      enabled = true,
      exclude = {
        "vue",
        "java",
      },
      codelense = {
        enabled = true,
      },
    },
  },
}
