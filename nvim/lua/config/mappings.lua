local map = vim.keymap.set
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")

vim.keymap.set("i", "jj", "<esc>")


--for systemclipboard plus
vim.opt.clipboard = "unnamedplus"
vim.opt.number = true
vim.opt.relativenumber = true

--Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight_yank', {}),
  desc = 'Hightlight selection on yank',
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { higroup = 'IncSearch', timeout = 200 }
  end,
})

--nvim tree mappings
vim.keymap.set('n', '<C-n>', "<cmd>NvimTreeToggle<CR>", {})
vim.keymap.set('n', '<leader>n', ':NvimTreeFindFile<CR>') -- Find current file

-- Keybindings to navigate between splits
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true }) -- Move to the left split
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true }) -- Move to the right split
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true, silent = true }) -- Move to the up split
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true, silent = true }) -- Move to the down split

--lsp mappings
map('n', "<leader>kd", "<cmd>lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true })
map('n', "grn", "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true, silent = true })
map('n', "gri", "<cmd>lua vim.lsp.buf.implementation()<CR>", { noremap = true, silent = true })
map('n', "grr", "<cmd>lua vim.lsp.buf.references()<CR>", { noremap = true, silent = true })
map('n', "gra", "<cmd>lua vim.lsp.buf.code_action()<CR>", { noremap = true, silent = true })
--for telescophelp_tagse
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Serach only for git files.' })

--for giving indentation and move the selected section up and down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected text up" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected text down" })
vim.keymap.set("v", "H", "<gv", { desc = "Outdent selected text", silent = true })
vim.keymap.set("v", "L", ">gv", { desc = "Indent selected text", silent = true })

-- JSX/TSX comment mapping for visual mode
vim.keymap.set('v', '<Space>gc', function()
  local start_line = vim.fn.line("'<")
  local end_line = vim.fn.line("'>")
  -- Ensure start_line is always less than end_line
  if start_line > end_line then
    start_line, end_line = end_line, start_line
  end
  local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)
  local text = table.concat(lines, "\n")
  local commented = "{/* " .. text .. " */}"
  vim.api.nvim_buf_set_lines(0, start_line - 1, end_line, false, vim.split(commented, "\n"))
  -- Exit visual mode
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>', true, false, true), 'n', false)
end, {
  noremap = true,
  silent = true,
  desc = "Wrap entire selection in JSX comment and exit visual mode"
})
--for quickfix mapping
-- vim.keymap.set('n', 'qf', ":copen<CR>", { desc = 'Opening quickfix menu' })
vim.keymap.set('n', 'qn', "<cmd>cnext<CR>", { desc = 'Go to next item in quickfix' })
vim.keymap.set('n', 'qp', "<cmd>cprevious<CR>", { desc = 'Go to previous item in quickfix' })
vim.keymap.set('n', '<leader>qw', function()
  local word = vim.fn.expand('<cword>')
  local command = string.format('silent grep! -w %s', word)
  vim.cmd(command)
  -- vim.cmd('copen')
end, { desc = 'Search word under cursor to quickfix' })

--for cycle through the active buffer using bufferline
vim.keymap.set('n', '<C-Tab>', "<Cmd>BufferLineCyclePrev<CR>", { noremap = true, silent = true, nowait = true })
