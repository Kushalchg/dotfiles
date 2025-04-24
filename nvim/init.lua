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

vim.cmd [[highlight ColorColumn guibg=#000000]] -- Change to red

--custom colorcodes
vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#f74a40" })
vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#FFAA00" })
vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#b34fff" })
vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#4CAF50" })
vim.api.nvim_set_hl(0, "Visual", { bg = "#aaabbb", fg = "#000000" })
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
