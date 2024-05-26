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
      conform_config.formatters_by_ft.javascript = { { 'prettierd', 'prettier' } } -- using prettierd as its faster.
      conform_config.formatters_by_ft.javascriptreact = { { 'prettierd', 'prettier' } } -- using prettierd as its faster.
      local slow_format_filetypes = { ['javascript'] = true, ['javascriptreact'] = true } -- assumption here(not actually an assumption if its true),
      -- that prettier is always slow. and its is being used for formatting javascript.
      conform_config.formatters = {
        sql_formatter = {
          args = { '-l', 'postgresql' },
        },
      }
      -- asyn formatting start:  https://github.com/stevearc/conform.nvim/blob/master/doc/recipes.md#automatically-run-slow-formatters-async
      local format_on_save = function(bufnr)
        if slow_format_filetypes[vim.bo[bufnr].filetype] then
          return
        end
        local function on_format(err)
          if err and err:match('timeout$') then
            print('formatting timed out for ' .. vim.bo[bufnr].filetype)
            slow_format_filetypes[vim.bo[bufnr].filetype] = true
          end
        end

        return { timeout_ms = 200, lsp_fallback = true }, on_format
      end
      local format_after_save = function(bufnr)
        if not slow_format_filetypes[vim.bo[bufnr].filetype] then
          return
        end
        return { lsp_fallback = true }
      end
      conform_config.format_on_save = format_on_save
      conform_config.format_after_save = format_after_save
      -- asyn formatting ends:

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
