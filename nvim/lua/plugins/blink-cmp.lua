return {
  {
    'saghen/blink.cmp',
    lazy = false, -- lazy loading handled internally
    -- optional: provides snippets for the snippet source
    dependencies = 'rafamadriz/friendly-snippets',

    -- use a release tag to download pre-built binaries
    version = 'v0.*',
    -- OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',
    -- On musl libc based systems you need to add this flag
    -- build = 'RUSTFLAGS="-C target-feature=-crt-static" cargo build --release',
    -- If you use nix, you can build from source using latest nightly rust with:
    -- build = 'nix run .#build-plugin',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = {
        ['<C-e>'] = { 'hide' },
        ['<C-CR>'] = { 'accept' },
        -- select_and_accept = {},
        ['<C-k>'] = { 'select_prev' },
        ['<Up>'] = { 'select_prev' },
        -- select_prev = { '<Up>' },
        -- select_next = { '<Down>' },
        ['<Down>'] = { 'select_next' },
        ['<C-j>'] = { 'select_next' },

        ['<C-space>'] = { 'show_documentation' },
        -- ['<C-space>']= {'hide_documentation'},
        ['<C-b>'] = { 'scroll_documentation_up' },
        ['<C-f>'] = { 'scroll_documentation_down' },

        -- snippet_forward = {},
        ['<S-Tab>'] = { 'snippet_backward' },
      },
      sources = {
        -- list of enabled providers
        completion = {
          -- enabled_providers = { 'lsp', 'path', 'snippets', 'buffer' },
          enabled_providers = { 'lsp', 'path', 'buffer' },
        }
      },

      highlight = {
        -- sets the fallback highlight groups to nvim-cmp's highlight groups
        -- useful for when your theme doesn't support blink.cmp
        -- will be removed in a future release, assuming themes add support
        use_nvim_cmp_as_default = true,
      },
      -- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- adjusts spacing to ensure icons are aligned
      nerd_font_variant = 'normal',

      -- experimental auto-brackets support
      accept = { auto_brackets = { enabled = true } }

      -- experimental signature help support
      -- trigger = { signature_help = { enabled = true } }
    }
  }

}