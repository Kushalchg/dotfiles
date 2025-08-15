return {
  -- {
  --   "rose-pine/neovim",
  --   name = "rose-pine",
  --   config = function()
  --     ---@diagnostic disable-next-line: missing-fields
  --     require("rose-pine").setup({
  --       varient = "main",
  --       dark_variant = "main",
  --       styles = {
  --         italic = false,
  --       },
  --       palette = {
  --         main = {
  --           base = '#0a0a00',
  --           overlay = '#18191a',
  --         },
  --       },
  --     })
  --     vim.cmd("colorscheme rose-pine")
  --   end
  -- },
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
  --           -- base = "#000000",
  --           -- mantle = "#242424",
  --           -- crust = "#ff3838",
  --         },
  --       }
  --     }
  --     vim.cmd.colorscheme "catppuccin"
  --     -- vim.cmd.colorscheme "catppuccin-mocha"
  --     -- for light theme
  --     -- vim.cmd.colorscheme "catppuccin-latte"
  --   end
  -- },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme "tokyonight-night"
    end
  },
  -- {
  --   'Everblush/nvim',
  --   name = 'everblush',
  --   config = function()
  --     vim.cmd('colorscheme everblush')
  --     require('everblush').setup({
  --
  --       -- Default options
  --       override = {},
  --       transparent_background = false,
  --       nvim_tree = {
  --         contrast = false,
  --       },
  --
  --       -- Configuration examples
  --
  --       -- Override the default highlights using Everblush or other colors
  --       override = {
  --         Normal = { fg = '#ffffff', bg = 'comment' },
  --       },
  --
  --       -- Set transparent background
  --       transparent_background = true,
  --
  --       -- Set contrast for nvim-tree highlights
  --       nvim_tree = {
  --         contrast = true,
  --       },
  --     })
  --   end
  -- }
  -- {
  --   "EdenEast/nightfox.nvim",
  --   config = function()
  --     vim.cmd("colorscheme nightfox")
  --   end
  -- },

}
