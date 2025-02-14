vim.opt.termguicolors = true
require("config.lazy")
require("config.mappings")

vim.opt.fillchars:append({ eob = ' ' })
vim.opt.textwidth = 80     -- Set text width to 80 columns
vim.opt.number = true
vim.opt.colorcolumn = "80" -- Add a visual guide at column 80
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.signcolumn = "yes"
vim.opt.linespace = 4

--setup for specific files
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = { "javascript", "typescript", "lua", "html", "css" },
--   callback = function()
--     vim.opt_local.tabstop = 2
--     vim.opt_local.shiftwidth = 2
--     vim.opt_local.expandtab = true
--   end
-- })

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = { "text", "markdown", "latex" },
--   callback = function()
--     vim.opt_local.spell = true
--     vim.opt_local.spelllang = "en_us"
--   end,
-- })

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "*",
--   callback = function()
--     vim.api.nvim_create_autocmd("Syntax", {
--       buffer = vim.api.nvim_get_current_buf(),
--       callback = function()
--         -- Enable spell checking only for comments
--         vim.cmd("syntax spell toplevel")
--         vim.cmd("syntax enable")
--       end,
--     })
--
--     vim.opt_local.spell = true        -- Enable spell checking
--     vim.opt_local.spelllang = "en_us" -- Set spell language to English (US)
--   end,
-- })

--custom colorcodes
vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#f74a40" })
vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#FFAA00" })
vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#b34fff" })
vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#4CAF50" })
vim.api.nvim_set_hl(0, "Visual", { bg = "#FFFFFF", fg = "#000000" })
vim.api.nvim_set_hl_ns(0)


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
