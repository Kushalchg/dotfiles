-- return {
--   "nvim-tree/nvim-tree.lua",
--   version = "*",
--   lazy = false,
--   dependencies = {
--     "nvim-tree/nvim-web-devicons",
--   },
--   config = function()
--     require("nvim-tree").setup {
--       filters = {
--         dotfiles = false
--       },
--       disable_netrw = true,
--       hijack_cursor = true,
--       sync_root_with_cwd = true,
--       update_focused_file = {
--         enable = true,
--         update_root = false,
--       },
--     }
--   end,
-- }

return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup {
            filters = {
                dotfiles = false,
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
        }

        -- Custom highlight groups for Git status
        vim.cmd([[
      highlight NvimTreeGitNew guifg=#a6e22e guibg=NONE
      highlight NvimTreeGitModified guifg=#f4bf75 guibg=NONE
      highlight NvimTreeGitDeleted guifg=#f92672 guibg=NONE
    ]])
    end,
}
