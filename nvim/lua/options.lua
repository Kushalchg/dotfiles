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
