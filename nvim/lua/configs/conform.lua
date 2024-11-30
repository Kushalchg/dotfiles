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

  -- formatters = {
  --   prettier = {
  --     command = "prettier",
  --     args = {
  --       "--stdin-filepath",
  --       "$FILENAME",
  --       "--single-quote",
  --       "--jsx-single-quote",
  --       -- "--print-width", "80", -- Max line width
  --       "--trailing-comma", "all",
  --       "--bracket-spacing", "true",
  --       "--bracket-same-line", "true",
  --       "--parser", "typescript", -- Explicitly set parser for TS files
  --       "--arrow-parens", "avoid",
  --     },
  --     require_cwd = true,
  --   },
  -- },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 3000,
    lsp_fallback = true,
  },
}

return options
