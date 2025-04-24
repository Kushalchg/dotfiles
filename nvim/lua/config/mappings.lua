local map = vim.keymap.set
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")

vim.keymap.set("i", "jj", "<esc>")
--for systemclipboard plus
vim.opt.clipboard = "unnamedplus"
vim.opt.number = true
vim.opt.relativenumber = true

--Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost',
  {
    group = vim.api.nvim_create_augroup('highlight_yank', {}),
    desc = 'Hightlight selection on yank',
    pattern = '*',
    callback = function()
      vim.highlight.on_yank { higroup = 'IncSearch', timeout = 200 }
    end,
  })

--nvim tree mappings
vim.keymap.set('n', '<C-n>', "<cmd>NvimTreeToggle<CR>", {})

-- Keybindings to navigate between splits
-- Move to the left split
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
-- Move to the right split
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })
-- Move to the up split
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
-- Move to the down split
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })

--lsp mappings
map('n', "<leader>kd", "<cmd>lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true })
map('n', "grn", "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true, silent = true })
map('n', "gri", "<cmd>lua vim.lsp.buf.implementation()<CR>", { noremap = true, silent = true })
map('n', "grr", "<cmd>lua vim.lsp.buf.references()<CR>", { noremap = true, silent = true })

--for giving indentation and move the selected section up and down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected text up" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected text down" })
vim.keymap.set("v", "H", "<gv", { desc = "Outdent selected text", silent = true })
vim.keymap.set("v", "L", ">gv", { desc = "Indent selected text", silent = true })


--for quickfix mapping
---- Function to cycle to the next item in the quickfix list
vim.keymap.set('n', 'qn', function()
  local ok, err = pcall(vim.cmd, 'cnext')
  if not ok then
    -- If cnext fails (e.g., at the end of the list), go to the first item
    vim.cmd('cfirst')
  end
end, { desc = 'Cycle to next item in quickfix' })

-- Function to cycle to the previous item in the quickfix list
vim.keymap.set('n', 'qp', function()
  local ok, err = pcall(vim.cmd, 'cprevious')
  if not ok then
    -- If cprevious fails (e.g., at the start of the list), go to the last item
    vim.cmd('clast')
  end
end, { desc = 'Cycle to previous item in quickfix' })

-- vim.keymap.set('n', 'qf', ":copen<CR>", { desc = 'Opening quickfix menu' })
-- vim.keymap.set('n', 'qn', "<cmd>cnext<CR>", { desc = 'Go to next item in quickfix' })
-- vim.keymap.set('n', 'qp', "<cmd>cprevious<CR>", { desc = 'Go to previous item in quickfix' })
vim.keymap.set('n', '<leader>qw', function()
  local word = vim.fn.expand('<cword>')
  local command = string.format('silent grep! -w %s', word)
  vim.cmd(command)
  -- vim.cmd('copen')
end, { desc = 'Search word under cursor to quickfix' })

--for cycle through the active buffer using bufferline
vim.keymap.set('n', '<C-Tab>', "<Cmd>BufferLineCyclePrev<CR>", { noremap = true, silent = true, nowait = true })

--for switching the current opened and last opened file map into <leader><Tab>
local last_two_files = { nil, nil }
