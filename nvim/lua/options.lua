require "nvchad.options"

-- add yours here!

vim.opt.relativenumber = true
-- local o = vim.o
vim.opt.linebreak = true
-- o.cursorlineopt ='both' -- to enable cursorline!
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "text", "markdown", "latex" },
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = "en_us"
  end,
})

-- custom vim cmmand for markdown highlight
-- copyed from primeagen set.lua file

vim.opt.nu = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"


vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#FF0000" }) -- Red for LSP errors
vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#FFA500" })  -- Orange for warnings (formatting errors)
vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#00FFFF" })  -- Cyan for info
vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#00FF00" })  -- Green for hints

-- for matchup
vim.g.matchup_matchparen_offscreen = { method = "popup" }
