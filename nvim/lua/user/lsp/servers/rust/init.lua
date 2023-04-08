local rt = require('rust-tools')
local common_on_attach = require('user.lsp.handlers').on_attach

-- rust-tools plugin takes care of setting up the server capabilities.
-- in opts.on_attach, we have some common functionalities like key-mappings
-- , document formatting etc.
-- NOTE: see below script to turn on/off inlay_hints.
-- lua require('rust-tools').inlay_hints.set()
-- lua require('rust-tools').inlay_hints.unset()

local M = {}
M.setup = function()
  rt.setup({
    server = {
      on_attach = common_on_attach,
      settings = {
        ['rust-analyzer'] = {
          procMacro = {
            enable = false,
          },
          diagnostics = {
            disabled = {
              'unresolved-proc-macro',
            },
          },
          inlayHints = {
            chainingHints = {
              enable = false,
            },
            closingBraceHints = {
              enable = false,
            },
            parameterHints = {
              enable = false,
            },
            renderColons = false,
            typeHints = {
              enable = false,
            },
          },
        },
      },
    },
  })
end
return M
