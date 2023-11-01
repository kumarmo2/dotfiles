local vim = vim
return {
  {
    'stevearc/conform.nvim',
    opts = {},
    config = function()
      local conform_config = {}
      conform_config.formatters_by_ft = {}
      conform_config.formatters_by_ft.lua = { 'stylua' }
      conform_config.formatters_by_ft.rust = { 'rustfmt' }
      conform_config.formatters_by_ft.go = { 'gofmt' }
      conform_config.format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_fallback = true,
      }
      require('conform').setup(conform_config)

      vim.api.nvim_create_autocmd('BufWritePre', {
        pattern = '*',
        callback = function(args)
          require('conform').format({ bufnr = args.buf })
        end,
      })
    end,
  },
}
