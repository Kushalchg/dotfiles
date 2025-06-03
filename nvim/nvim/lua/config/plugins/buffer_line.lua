return {
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',

    config = function()
      vim.keymap.set('n', '<leader>bp', "<cmd>BufferLinePick<CR>", { desc = 'Pick from bufferline tab' })
      vim.keymap.set('n', '<leader>bl', "<cmd>BufferLineCycleNext<CR>", { desc = 'move to the Next buffer' })
      vim.keymap.set('n', '<leader>bh', "<cmd>BufferLineCyclePrev<CR>", { desc = 'move to the previous buffer' })
      vim.keymap.set('n', '<leader><Tab>', "<cmd>b#<CR>", { desc = 'Toggle between last two buffers' })
      vim.opt.termguicolors = true
      local bufferline = require('bufferline')
      bufferline.setup {
        options = {
          pick = {
            alphabet = "abcdefghijklmopqrstuvwxyz"
          },
          style_preset = bufferline.style_preset.minimal,
          diagnostics = "nvim_lsp",
          diagnostics_update_on_event = true, -- use nvim's diagnostic handler
          auto_toggle_bufferline = true,
          diagnostics_indicator = function(_, _, diagnostics_dict, _)
            local s = " "
            for e, n in pairs(diagnostics_dict) do
              local sym = e == "error" and " "
                  or (e == "warning" and " " or " ")
              s = s .. n .. sym
            end
            return s
          end
        }
      }
    end
  }
}
