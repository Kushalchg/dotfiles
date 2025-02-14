return {
  -- {
  --   "rose-pine/neovim",
  --   name = "rose-pine",
  --   config = function()
  --     vim.cmd("colorscheme rose-pine")
  --   end
  -- }
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
  --   end
  -- },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme "tokyonight-night"
    end
  }

}
