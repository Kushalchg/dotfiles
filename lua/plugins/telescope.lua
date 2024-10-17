local plugins = {
  {
    "nvim-telescope/telescope.nvim",
    opts = function()
      local conf = require "nvchad.configs.telescope"

      -- for ignoring the node modules beacusue it's heavy.
      conf.defaults.file_ignore_patterns = { "node_modules" }

      return conf
    end,
  },
}
return plugins
