return {
    "neovim/nvim-lspconfig",
    opts = {
        inlay_hints = {
            enabled = true,
            exclude = {
                "vue",
                "java",
            },
            codelens = {
                enabled = true,
            },
        },

        servers = {
            lua_ls = {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim", "hl" },
                        },
                        workspace = {
                            checkThirdParty = false,
                            library = {
                                "/usr/share/hypr/stubs",
                            },
                        },
                    },
                },
            },
        },
    },
}
