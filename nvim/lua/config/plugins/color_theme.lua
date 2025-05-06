return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require("rose-pine").setup({
        varient = "main",
        dark_variant = "main",
        styles = {
          italic = false,
        },
      })
      vim.cmd("colorscheme rose-pine")
    end
  }
  -- {
  --   "catppuccin/nvim",
  --   name = "catppuccin",
  --   priority = 1000,
  --   config = function()
  --     require("catppuccin").setup {
  --       color_overrides = {
  --         all = {
  --           text = "#ffffff",
  --         },
  --         mocha = {
  --           base = "#000000",
  --           mantle = "#242424",
  --           crust = "#ff3838",
  --         },
  --       }
  --     }
  --     vim.cmd.colorscheme "catppuccin"
  --     for light theme
  --     vim.cmd.colorscheme "catppuccin-latte"
  --   end
  -- },
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     vim.cmd.colorscheme "tokyonight-night"
  --   end
  -- },

}
