require "nvchad.mappings"

local map = vim.keymap.set
map("n", "<leader>pv", vim.cmd.Ex)

-- map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jj", "<ESC>")


-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
--
-- vim.keymap.del('n', 'gr')
map('n', "<leader>kd", "<cmd>lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true })
map('n', "grn", "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true, silent = true })
map('n', "gri", "<cmd>lua vim.lsp.buf.implementation()<CR>", { noremap = true, silent = true })
map('n', "grr", "<cmd>lua vim.lsp.buf.references()<CR>", { noremap = true, silent = true })
map('n', "gra", "<cmd>lua vim.lsp.buf.code_action()<CR>", { noremap = true, silent = true })


vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected text up" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected text down" })
vim.keymap.set("v", "L", ">gv", { desc = "Indent selected text", silent = true })
vim.keymap.set("v", "H", "<gv", { desc = "Outdent selected text", silent = true })
