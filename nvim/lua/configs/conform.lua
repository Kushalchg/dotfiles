local options = {
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

  formatters = {
    prettier = {
      command = "prettier",
      args = {
        "--stdin-filepath",
        "$FILENAME",
        "--single-quote",
        "--jsx-single-quote",
        "--print-width", "80", -- Max line width
        "--trailing-comma", "es5",
        "--bracket-spacing", "true",
        "--bracket-same-line", "false",
        "--arrow-parens", "always",
        "--parser", "typescript", -- Explicitly set parser for TS files
      },
      require_cwd = true,
    },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 5000,
    lsp_fallback = true,
  },
}

return options
