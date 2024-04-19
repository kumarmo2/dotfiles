-- TODO: Check if we need this file or not. Right not its not getting referenced
-- after the refactoring. But since its doing some extra work, we might require the
-- logic for it
local M = {}
local lspconfig = require('lspconfig')

local common_on_attach = require('user.lsp.handlers').on_attach
local client_capablities = require('user.lsp.handlers').capabilities

local function filter(arr, fn)
  if type(arr) ~= 'table' then
    return arr
  end

  local filtered = {}
  for k, v in pairs(arr) do
    if fn(v, k, arr) then
      table.insert(filtered, v)
    end
  end

  return filtered
end

local function filterFiles(value)
  return string.match(value.targetUri, 'react/index.d.ts') == nil
    and string.match(value.targetUri, 'qwik/core.d.ts') == nil
end

M.setup = function()
  lspconfig.tsserver.setup({
    on_attach = common_on_attach,
    capabilities = client_capablities,
    handlers = {
      -- NOTE: filtering out `react` && `qwik` library definition files if "GoToDefinition" returns multiple results.
      ['textDocument/definition'] = function(err, result, method, ...)
        if vim.tbl_islist(result) and #result > 1 then
          local filtered_result = filter(result, filterFiles)
          return vim.lsp.handlers['textDocument/definition'](err, filtered_result, method, ...)
        end

        vim.lsp.handlers['textDocument/definition'](err, result, method, ...)
      end,
    },
  })
end

return M
