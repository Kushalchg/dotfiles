vim.opt.termguicolors = true
require("config.lazy")
require("config.mappings")

vim.opt.fillchars:append({ eob = ' ' })
vim.opt.textwidth = 80      -- Set text width to 80 columns
vim.opt.colorcolumn = "100" -- Add a visual guide at column 80
vim.opt.number = true
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.signcolumn = "yes"
vim.opt.linespace = 4
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.o.ignorecase = true
vim.o.smartcase = true

vim.cmd [[highlight ColorColumn guibg=#000000]] -- Change to red

--custom colorcodes
vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#f74a40" })
vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#FFAA00" })
vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#b34fff" })
vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#4CAF50" })
vim.api.nvim_set_hl(0, "Visual", { bg = "#aaafff", fg = "#000000" })

-- Customize NvimTree folder colors
vim.api.nvim_set_hl(0, "NvimTreeFolderName", { fg = "#89B4FA", bold = true })
vim.api.nvim_set_hl(0, "NvimTreeFolderIcon", { fg = "#a0C7EC" })
vim.api.nvim_set_hl(0, "NvimTreeOpenedFolderName", { fg = "#89B4FA", italic = true })
vim.api.nvim_set_hl(0, "NvimTreeRootFolder", { fg = "#F9E2AF", bold = true })
vim.api.nvim_set_hl(0, "NvimTreeIndentMarker", { fg = "#6C7086" })

-- Customize Git-related colors for folders in NvimTree
vim.api.nvim_set_hl(0, "NvimTreeGitDirty", { fg = "#FF9E1B" })   -- vibrant orange
vim.api.nvim_set_hl(0, "NvimTreeGitStaged", { fg = "#5EE7C9" })  -- vibrant teal
vim.api.nvim_set_hl(0, "NvimTreeGitMerge", { fg = "#6BAEFF" })   -- vibrant blue
vim.api.nvim_set_hl(0, "NvimTreeGitRenamed", { fg = "#4ABFEF" }) -- vibrant cyan
vim.api.nvim_set_hl(0, "NvimTreeGitNew", { fg = "#BB84FF" })     -- vibrant purple
vim.api.nvim_set_hl(0, "NvimTreeGitDeleted", { fg = "#FF6F91" }) -- vibrant red/pink
vim.api.nvim_set_hl(0, "NvimTreeGitIgnored", { fg = "#7F85A3" }) -- vibrant gray

vim.api.nvim_set_hl_ns(0)

-- set column width to 100 for tsx and jsx fle
vim.api.nvim_create_augroup('FileTypeSettings', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
  group = 'FileTypeSettings',
  pattern = { 'javascriptreact', 'typescriptreact' },
  callback = function()
    vim.opt_local.textwidth = 90
    vim.opt_local.colorcolumn = "90"
  end
})


-- for highlight on yank
vim.api.nvim_create_autocmd('textyankpost', {
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 200 })
  end,
})

-- for matchup
vim.g.matchup_matchparen_offscreen = { method = "popup" }

-- Vertical split terminal at the bottom
vim.keymap.set('n', '<leader>tv', ':botright vsplit | terminal<CR>')
-- Horizontal split terminal at the bottom
vim.keymap.set('n', '<leader>th', ':botright split | terminal<CR>')
