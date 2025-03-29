return {
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      -- vim.keymap.set('n', 'qn', "<cmd>cnext<CR>", { desc = 'Go to next item in quickfix' })
      vim.opt.termguicolors = true
      local bufferline = require('bufferline')
      bufferline.setup {
        options = {
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
