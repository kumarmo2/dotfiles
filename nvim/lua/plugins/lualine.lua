return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons', lazy = true },
    event = 'VeryLazy',
    config = function()
      local lualine = require('lualine')
      local config = {
        options = {
          theme = 'auto',
          component_separators = '|',
          section_separators = '',
          globalstatus = 3,
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff', 'diagnostics' },
          lualine_c = { 'filename' },
          lualine_x = {
            {
              function()
                if vim.v.hlsearch == 0 then
                  return ''
                end
                local r = vim.fn.searchcount({ maxcount = 999999 })
                if not r or r.total == 0 then
                  return ''
                end
                return string.format('%d/%d', r.current, r.total)
              end,
            },
            {
              function()
                local clients = vim.lsp.get_clients({ bufnr = 0 })
                if #clients == 0 then
                  return 'No LSP'
                end
                local client_names = {}
                for _, client in ipairs(clients) do
                  table.insert(client_names, client.name)
                end
                return 'LSP: ' .. table.concat(client_names, ', ')
              end,
              icon = ' ',
              color = { fg = '#ffffff', gui = 'bold' },
            },
            'encoding',
            'fileformat',
            'filetype',
          },
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
        },
      }
      lualine.setup(config)
    end,
  },
}
