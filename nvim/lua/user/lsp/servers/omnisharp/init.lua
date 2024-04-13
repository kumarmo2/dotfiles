local vim = vim
local lspconfig = require('lspconfig')

local common_on_attach = require('user.lsp.handlers').on_attach
local client_capablities = require('user.lsp.handlers').capabilities

-- NOTE: because of some bug in omnishar, had to update the "on_attach function."
-- https://github.com/OmniSharp/omnisharp-roslyn/issues/2483#issuecomment-1515702042
local lsp_options = {
  on_attach = function(client, bufnr)
    -- https://github.com/OmniSharp/omnisharp-roslyn/issues/2483#issuecomment-1492605642
    local tokenModifiers = client.server_capabilities.semanticTokensProvider.legend.tokenModifiers
    for i, v in ipairs(tokenModifiers) do
      local tmp = string.gsub(v, ' ', '_')
      tokenModifiers[i] = string.gsub(tmp, '-_', '')
    end
    local tokenTypes = client.server_capabilities.semanticTokensProvider.legend.tokenTypes
    for i, v in ipairs(tokenTypes) do
      local tmp = string.gsub(v, ' ', '_')
      tokenTypes[i] = string.gsub(tmp, '-_', '')
    end
    common_on_attach(client, bufnr)
  end,
  capabilities = client_capablities,
}

local M = {}

M.setup = function()
  local pid = vim.fn.getpid()
  local omnisharp_bin = vim.fn.expand('~/.local/share/nvim/mason/bin/omnisharp')

  local config = {
    handlers = {
      ['textDocument/definition'] = require('omnisharp_extended').definition_handler,
      ['textDocument/typeDefinition'] = require('omnisharp_extended').type_definition_handler,
      ['textDocument/references'] = require('omnisharp_extended').references_handler,
      ['textDocument/implementation'] = require('omnisharp_extended').implementation_handler,
    },
    cmd = { omnisharp_bin, '--languageserver', '--hostPID', tostring(pid) },
    -- rest of your settings
  }
  lsp_options = vim.tbl_deep_extend('force', config, lsp_options)

  lspconfig.omnisharp.setup(lsp_options)
end

return M
