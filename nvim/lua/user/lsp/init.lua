local found, mason = pcall(require, 'mason')

if found ~= true then
  return
end

mason.setup({})

require('mason-lspconfig').setup({
  ensure_installed = { 'lua_ls', 'rust_analyzer', 'omnisharp', 'gopls', 'bashls' },
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
lspconfig.gopls.setup(lsp_options)
lspconfig.bashls.setup(lsp_options)
lspconfig.sqlls.setup(lsp_options)
lspconfig.bicep.setup(lsp_options)
lspconfig.ruby_ls.setup(lsp_options)
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
lspconfig.ansiblels.setup({})

require('user.lsp.servers.omnisharp').setup() -- csharp
require('user.lsp.servers.tsserver').setup() -- js/ts
