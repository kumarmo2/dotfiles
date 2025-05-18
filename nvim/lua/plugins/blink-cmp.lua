return { {
  'saghen/blink.cmp',
  version = '1.*',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    -- See :h blink-cmp-config-keymap for defining your own keymap
    keymap = {
      preset = 'default',
      ['<Tab>'] = {},
    },

    appearance = {
      nerd_font_variant = 'mono'
    },

    completion = { documentation = { auto_show = false } },

    sources = {
      default = { 'lsp', 'path', 'buffer' },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" }
  },
  opts_extend = { "sources.default" }
} }
