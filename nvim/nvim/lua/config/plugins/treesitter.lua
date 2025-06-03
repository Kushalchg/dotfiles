return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      -- Your existing configurations
      ensure_installed = {
        "c", "lua", "typescript", "javascript", "json", "go", "python", "query", "markdown",
        "markdown_inline", "html",
      },

      -- Add these missing fields
      modules = {},         -- Empty modules list
      sync_install = false, -- No synchronous installation
      ignore_install = {},  -- No languages to ignore

      -- Other existing configurations
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
