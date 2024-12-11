return { {
    'stevearc/conform.nvim',
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            css = { "prettier" },
            html = { "prettier" },
            go = { "goimports", "gofmt" },
            typescript = { "prettier" },
            javascript = { "prettier" },
            typescriptreact = { "prettier" },
            javascriptreact = { "prettier" },
        },

        format_on_save = {
            -- These options will be passed to conform.format()
            timeout_ms = 3000,
            lsp_fallback = true,
        },
    }
},
}
