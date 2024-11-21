return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        jsonls = {
          on_attach = function(client, bufnr)
            if vim.bo[bufnr].filetype == "json" or vim.bo[bufnr].filetype == "jsonc" then
              client.server_capabilities.documentFormattingProvider = false -- Disable formatting for JSON/JSONC
            end
          end,
        },
      },
    },
  },
}
