local found, mason = pcall(require, 'mason')

if found ~= true then
  return
end

mason.setup({})

require('mason-lspconfig').setup({
  ensure_installed = { 'lua_ls', 'rust_analyzer', 'omnisharp', 'gopls', 'bashls' },
})

local lspconfig = require('lspconfig')

local common_on_attach = require('user.lsp.handlers').on_attach
local client_capablities = require('user.lsp.handlers').capabilities

local lsp_options = { on_attach = common_on_attach, capabilities = client_capablities }
-- NOTE: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

lspconfig.lua_ls.setup(lsp_options) -- lua
lspconfig.pylsp.setup(lsp_options)
lspconfig.bufls.setup(lsp_options)
lspconfig.clangd.setup(lsp_options)
lspconfig.gopls.setup(lsp_options)
lspconfig.bashls.setup(lsp_options)

require('lspconfig').tailwindcss.setup(lsp_options)
require('user.lsp.servers.rust').setup() -- rust
require('user.lsp.servers.omnisharp').setup() -- csharp
require('user.lsp.servers.tsserver').setup() -- js/ts
require('lspconfig').dockerls.setup(lsp_options)
