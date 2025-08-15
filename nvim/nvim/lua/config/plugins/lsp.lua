return {

  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  -- {
  --   "williamboman/mason-lspconfig.nvim",
  --   config = function()
  --     require("mason-lspconfig").setup({
  --       automatic_enable = true,
  --       ensure_installed = {
  --         "html", "cssls", "ts_ls",
  --         "lua_ls", "tailwindcss", "pyright",
  --         "gopls", "clangd", "kotlin-language-server",
  --       },
  --     })
  --   end,
  -- },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "folke/lazydev.nvim",
      ft = "lua",
      opts = {
        library = {
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
    config = function()
      local lspconfig = require("lspconfig")
      local map = vim.keymap.set

      -- Enable inline diagnostics (virtual text) globally
      vim.diagnostic.config({
        virtual_text = {
          -- Customize how diagnostics are displayed inline
          spacing = 4,        -- Space between code and diagnostic
          prefix = "●",
          source = "if_many", -- Show source only if multiple sources
          format = function(diagnostic)
            -- Customize the message format
            return string.format("%s: %s", diagnostic.source, diagnostic.message)
          end,
        },
        float = {
          border = "rounded", -- Optional: for the floating window
          source = "always",  -- Show source in floating window
        },
      })
      -- Custom on_attach function for key mappings and buffer-specific settings
      local function on_attach(_, bufnr)
        local function opts(desc)
          return { buffer = bufnr, desc = "LSP " .. desc }
        end

        map("n", "gD", vim.lsp.buf.declaration, opts "Go to declaration")
        map("n", "gd", vim.lsp.buf.definition, opts "Go to definition")
        map("n", "gi", vim.lsp.buf.implementation, opts "Go to implementation")
        map("n", "<leader>sh", vim.lsp.buf.signature_help, opts "Show signature help")
        map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts "Add workspace folder")
        map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts "Remove workspace folder")

        map("n", "<leader>wl", function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts "List workspace folders")

        map("n", "<leader>D", vim.lsp.buf.type_definition, opts "Go to type definition")
        map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts "Code action")
        map("n", "gr", vim.lsp.buf.references, opts "Show references")

        -- Add format on save
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format({ async = false })
          end,
          desc = "LSP: Format on save",
        })
      end


      -- Custom capabilities for completion
      -- local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      capabilities.textDocument.completion.completionItem = {
        documentationFormat = { "markdown", "plaintext" },
        snippetSupport = true,
        preselectSupport = true,
        insertReplaceSupport = true,
        labelDetailsSupport = true,
        deprecatedSupport = true,
        commitCharactersSupport = true,
        tagSupport = { valueSet = { 1 } },
        resolveSupport = {
          properties = {
            "documentation",
            "detail",
            "additionalTextEdits",
          },
        },
      }
      -- List of LSP servers
      local servers = {
        "html", "cssls",
        "ts_ls", "tailwindcss", "pyright",
        "clangd", "kotlin_language_server",
      }

      -- Default setup function
      local function default_setup(server)
        lspconfig[server].setup {
          on_attach = on_attach,       -- Attach custom on_attach
          capabilities = capabilities, -- Enhanced completion capabilities
        }
      end

      -- Apply the setup to all servers
      for _, server in ipairs(servers) do
        default_setup(server)
      end

      -- Lua Language Server with custom configuration
      lspconfig.lua_ls.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
            },
          },
        },
      }

      -- Go Language Server with detailed configuration
      lspconfig.gopls.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = { "go", "gomod", "gowork", "gotmpl", "gosum" },
        settings = {
          gopls = {
            -- completeUnimported = true,
            completeFunctionCalls = true,
            hoverKind = "FullDocumentation",
            usePlaceholders = true,
            analyses = {
              unusedparams = true,
            },
          },
        },
      }
    end,
  },
}
