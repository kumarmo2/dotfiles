return {
  { 'folke/neodev.nvim', opts = {} },
  { 'hrsh7th/cmp-buffer', event = 'VeryLazy' },
  { 'hrsh7th/cmp-path', event = 'VeryLazy' },
  { 'hrsh7th/cmp-nvim-lsp', event = 'VeryLazy' },
  'onsails/lspkind.nvim', -- lsp icons pack
  {
    'hrsh7th/nvim-cmp',
    event = 'VeryLazy',
    config = function()
      local cmp = require('cmp')
      cmp.setup({
        snippet = {
          expand = function(args)
            vim.snippet.expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-k>'] = cmp.mapping.select_prev_item(),
          ['<C-j>'] = cmp.mapping.select_next_item(),
          ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-1), { 'i', 'c' }),
          ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(1), { 'i', 'c' }),
          ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
          ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
          ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
          }),
          -- Accept currently selected item. If none selected, `select` first item.
          -- Set `select` to `false` to only confirm explicitly selected items.
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lua' },
          { name = 'nvim_lsp' },
          { name = 'buffer' },
          { name = 'path' },
        }),
        formatting = {
          format = function(entry, vim_item)
            if vim.tbl_contains({ 'path' }, entry.source.name) then
              local icon, hl_group = require('nvim-web-devicons').get_icon(entry:get_completion_item().label)
              if icon then
                vim_item.kind = icon
                vim_item.kind_hl_group = hl_group
                return vim_item
              end
            end
            return require('lspkind').cmp_format({ with_text = false })(entry, vim_item)
          end,
        },
      })
    end,
  },
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'Hoffs/omnisharp-extended-lsp.nvim',
  {
    'neovim/nvim-lspconfig',
    lazy = false,
    config = function()
      local found, mason = pcall(require, 'mason')

      if found ~= true then
        return
      end

      mason.setup({})

      require('mason-lspconfig').setup({
        ensure_installed = {
          'lua_ls',
          'rust_analyzer',
          'omnisharp',
          -- 'gopls',
          'bashls',
          'ansiblels',
          'dockerls',
          'tailwindcss',
          'terraformls',
          'tsserver',
          'eslint',
        },
      })

      -- `neodev` needs to be required before lspconfig.
      require('neodev').setup()
      local lspconfig = require('lspconfig')

      local common_on_attach = require('user.lsp.handlers').on_attach
      local client_capablities = require('user.lsp.handlers').capabilities

      local lsp_options = {
        on_attach = common_on_attach,
        capabilities = client_capablities,
      }
      ---@diagnostic disable-next-line: unused-local
      local lua_lsp_options = vim.tbl_deep_extend('force', lsp_options, {
        settings = {
          Lua = {
            workspace = {
              checkThirdParty = 'Disable',
            },
          },
        },
      })

      -- local docker_compose_lsp_options = vim.tbl_deep_extend('force', lsp_options, {})
      -- NOTE: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

      lspconfig.lua_ls.setup(lsp_options) -- lua
      lspconfig.pylsp.setup(lsp_options)
      lspconfig.bufls.setup(lsp_options)
      lspconfig.clangd.setup(lsp_options)
      -- lspconfig.gopls.setup(lsp_options)
      lspconfig.bashls.setup(lsp_options)
      lspconfig.sqlls.setup(lsp_options)
      lspconfig.bicep.setup(lsp_options)
      -- lspconfig.ruby_lsp.setup(lsp_options)
      lspconfig.dockerls.setup(lsp_options)
      lspconfig.docker_compose_language_service.setup(lsp_options)
      lspconfig.html.setup({
        on_attach = common_on_attach,
        capabilities = client_capablities,
        filetypes = { 'html', 'erb', 'rb' },
      })
      lspconfig.cssls.setup(lsp_options)
      lspconfig.eslint.setup(lsp_options)

      lspconfig.tailwindcss.setup(lsp_options)
      -- require('user.lsp.servers.rust').setup() -- rust
      lspconfig.rust_analyzer.setup({
        on_attach = common_on_attach,
        capabilities = client_capablities,
        settings = {
          ['rust-analyzer'] = {
            diagnostics = {
              enable = false,
            },
          },
        },
      })
      -- lspconfig.ansiblels.setup({})
      lspconfig.terraformls.setup({})

      require('user.lsp.servers.omnisharp').setup() -- csharp
      require('user.lsp.servers.tsserver').setup() -- js/ts
    end,
  }, -- enable lsp
}
