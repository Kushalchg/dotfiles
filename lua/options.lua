require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "text", "markdown", "latex" },
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = "en_us"
  end,
})

-- custom vim cmmand for markdown highlight

vim.cmd [[
highlight RenderMarkdownH1Bg guibg=#FF0000
highlight RenderMarkdownH2Bg guibg=#00FF00
highlight RenderMarkdownH3Bg guibg=#0000FF
highlight RenderMarkdownH1 guifg=#FF0000
highlight RenderMarkdownH2 guifg=#00FF00
highlight RenderMarkdownH3 guifg=#0000FF
]]
