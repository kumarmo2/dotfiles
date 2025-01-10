return {
  {
    'saghen/blink.cmp',
    version = 'v0.*',
    build = 'cargo build --release',
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = {
        preset = 'enter',
        ['<C-k>'] = { 'select_prev', },
        ['<C-j>'] = { 'select_next', },
      },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono'
      },

      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer', 'lazydev' },
        providers = {
          -- dont show LuaLS require statements when lazydev has items
          lsp = { fallbacks = { "lazydev" } },
          lazydev = { name = "LazyDev", module = "lazydev.integrations.blink" },
        },
      },

    },
    opts_extend = { "sources.default" }
  },
}
