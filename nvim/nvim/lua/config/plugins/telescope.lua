return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  config = function()
    require('telescope').setup {
      defaults = {
        file_ignore_patterns = { "node_modules" },
      }
    }
    vim.keymap.set('n', '<space>en', function()
      require('telescope.builtin').find_files {
        cwd = vim.fn.stdpath("config")
      }
    end)
    --for telescophelp_tagse
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
    vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = 'Grep strings' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
    vim.keymap.set("n", "<leader>f.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
    vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Serach only for git files.' })
    vim.keymap.set('n', '<leader>d', function()
      builtin.diagnostics({
        bufnr = 0,
      })
    end, { desc = 'Show WARN diagnostics for current buffer' })
  end


}
