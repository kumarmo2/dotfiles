local vim = vim
return {
  {
    'stevearc/conform.nvim',
    opts = {},
    event = 'BufWritePre',
    config = function()
      local conform_config = {}
      conform_config.formatters_by_ft = {}
      conform_config.formatters_by_ft.lua = { 'stylua' }
      conform_config.formatters_by_ft.go = { 'gofmt' }
      conform_config.formatters_by_ft.sql = { 'sql_formatter' }
      conform_config.formatters_by_ft.sh = { 'beautysh' }
      conform_config.formatters_by_ft.javascript = { 'prettier' }
      conform_config.format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_fallback = true,
      }
      conform_config.formatters = {
        sql_formatter = {
          args = { '-l', 'tsql' },
        },
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
