local map_lsp_keymaps = function(bufnr, opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>s', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>.', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-.>', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>f', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>dn', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>dp', '<cmd>vim.diagnostic.goto_prev()<CR>', opts)
  vim.api.nvim_buf_set_keymap(
    bufnr,
    'n',
    'gl',
    '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ border = "rounded" })<CR>',
    opts
  )
  vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d', '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
end

vim.diagnostic.config({ virtual_lines = true }) -- in 0.11, by default diagnostics are not shown.
-- that is we need this option.

return {
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  'onsails/lspkind.nvim', -- lsp icons pack
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'Hoffs/omnisharp-extended-lsp.nvim',
  {
    'neovim/nvim-lspconfig',
    dependencies = { 'saghen/blink.cmp' },
    lazy = false,
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('LspAttachCommandGroup', { clear = true }),
        callback = function(event)
          local opts = { noremap = true, silent = true }
          local bufnr = event.buf
          map_lsp_keymaps(bufnr, opts)
          local client = vim.lsp.get_client_by_id(event.data.client_id)

          -- The following two autocommands are used to highlight references of the
          -- word under your cursor when your cursor rests there for a little while.
          --    See `:help CursorHold` for information about when this is executed
          --
          -- When you move your cursor, the highlights will be cleared (the second autocommand).
          if client and client.server_capabilities.documentHighlightProvider then
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              callback = vim.lsp.buf.clear_references,
            })
          end
        end,
      })

      local servers = {
        lua_ls = {
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = 'Disable',
              },
              diagnostics = {
                disable = { "unused-local" }
              }
            },
          },
        },
        rust_analyzer = {},
        gopls = {},
        bashls = {},
        ansiblels = {},
        omnisharp = {
          command = { "Omnisharp", "-z", "--hostPID", "79167", "DotNet:enablePackageRestore=false", "--encoding", "utf-8", "--languageserver" },
          handlers = {
            ["textDocument/definition"] = require('omnisharp_extended').definition_handler,
            ["textDocument/typeDefinition"] = require('omnisharp_extended').type_definition_handler,
            ["textDocument/references"] = require('omnisharp_extended').references_handler,
            ["textDocument/implementation"] = require('omnisharp_extended').implementation_handler,
          }
        },
        zls = {},
        dockerls = {},
        tailwindcss = {},
        terraformls = {},
        ts_ls = {},
        -- eslint = {},
        yamlls = {
          settings = {
            ['yaml'] = {
              schemas = {
                ['Kubernetes'] = { vim.fn.expand('~') .. '/dev/kumarmo2/cloud-infra-projects/common/k8s/**/*.yaml' },
              },
            },
          },
        },
      }

      require('mason').setup()
      local ensure_installed = vim.tbl_keys(servers or {})
      require('mason-lspconfig').setup({ automatic_enable = true, ensure_installed = ensure_installed })

      local capabilities = require('blink.cmp').get_lsp_capabilities()

      vim.lsp.config("*", {
        capabilities = capabilities
      })

      vim.lsp.config('rust_analyzer', {
        settings = {
          ['rust_analyzer'] = {
            diagnostics = {
              enable = false,
            },
            check = {
              command = 'clippy' -- run clippy.
            }
          }
        }
      })

      vim.lsp.config('omnisharp', {
        cmd = { vim.fn.expand("~") .. "/.local/share/nvim/mason/bin/OmniSharp", "-z", "--hostPID", "79167", "DotNet:enablePackageRestore=false", "--encoding", "utf-8", "--languageserver" },
      })
    end,
    -- NOTE: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
  },
}
