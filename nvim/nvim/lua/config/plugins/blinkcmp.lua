return {
  {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets' },
    version = '1.*',
    opts = {
      keymap = {
        -- disable all presets
        preset        = 'default',
        -- Tab: select next item in the menu, or fall back if menu is closed
        ['<Tab>']     = { 'select_next', 'fallback' },

        -- Shift-Tab: select previous item, or fall back
        ['<S-Tab>']   = { 'select_prev', 'fallback' },

        -- Enter: accept the selected completion, or fall back to inserting a newline
        ['<CR>']      = { 'accept', 'fallback' },

        ['<C-Space>'] = { 'show', 'fallback' },
      },

      appearance = {
        nerd_font_variant = 'mono',
      },

      completion = { documentation = { auto_show = true, auto_show_delay_ms = 100, } },

    },

    snippets = {
      expand = function(snippet) vim.snippet.expand(snippet) end,
      active = function(filter) return vim.snippet.active(filter) end,
      jump   = function(direction) vim.snippet.jump(direction) end,
    },
    signature = { enabled = true },


    opts_extend = { "sources.default" },

  }
}
