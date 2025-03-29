return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    --to move to trash insted of permanent delete
    local function my_on_attach(bufnr)
      local api = require "nvim-tree.api"

      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      -- default mappings
      api.config.mappings.default_on_attach(bufnr)

      -- custom mappings
      vim.keymap.set("n", "d", function() api.fs.trash() end, opts("Move to trash"))
      vim.keymap.set("n", "D", function() api.fs.remove() end, opts("permanent delete file"))
    end

    require("nvim-tree").setup {
      filters = {
        dotfiles = false,
      },
      trash = {
        cmd = "gio trash"
      },
      actions = {
        open_file = {
          quit_on_open = false, -- automatically close the nvimtree panel
        },
      },
      disable_netrw = true,
      hijack_cursor = true,
      sync_root_with_cwd = true,
      update_focused_file = {
        enable = true,
        update_root = false,
      },
      git = {
        enable = true, -- Enable Git integration
        ignore = true, -- Show ignored files
      },
      renderer = {
        highlight_git = true, -- Highlight Git changes
        icons = {
          show = {
            git = true,
          },
        },
      },
      on_attach = my_on_attach,
    }

    -- Custom highlight groups for Git status
    vim.cmd([[
      highlight NvimTreeGitNew guifg=#a6e22e guibg=NONE
      highlight NvimTreeGitModified guifg=#f4bf75 guibg=NONE
      highlight NvimTreeGitDeleted guifg=#f92672 guibg=NONE
    ]])
  end,
}
