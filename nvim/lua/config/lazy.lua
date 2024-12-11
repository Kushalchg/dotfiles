-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        {
            "rose-pine/neovim",
            name = "rose-pine-moon",
            config = function()
                require("rose-pine").setup({
                    styles = {
                        bold = true,
                        italic = false,
                        transparency = true,
                    },
                    palette = {
                        -- Override the builtin palette per variant
                        moon = {
                            base = '#000000',
                            overlay = '#282828',
                        },
                    },
                    enable = {
                        terminal = true,
                        legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
                        migrations = true,        -- Handle deprecated options automatically
                    },
                })
                vim.cmd("colorscheme rose-pine-moon")
            end
        },
        -- {
        --     "folke/tokyonight.nvim",
        --     lazy = false,
        --     priority = 1000,
        --     config = function()
        --         vim.cmd [[colorscheme tokyonight]]
        --     end
        -- },
        -- {
        --     "catppuccin/nvim",
        --     name = "catppuccin",
        --     priority = 1000,
        --     config = function()
        --         vim.cmd.colorscheme "catppuccin-mocha"
        --     end
        -- },
        { import = "config.plugins" },
    },
    -- automatically check for plugin updates
    -- checker = { enabled = true },
})
