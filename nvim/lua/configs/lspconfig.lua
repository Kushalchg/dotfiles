-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls", "eslint", "ts_ls", "lua_ls", "tailwindcss", "pyright" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuring single server, example:go
--
lspconfig.gopls.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  filetypes = { "go", "gomod", "gowork", "gotmpl", "gosum" },
  capabilities = nvlsp.capabilities,
  settings = {
    gopls = {
      completeUnimported = true,
      completeFunctionCalls = true,
      hoverKind = "FullDocumentation",
      -- staticcheck=true,(it is expremental)
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
}
