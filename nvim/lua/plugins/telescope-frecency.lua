return {
  {

    'nvim-telescope/telescope-frecency.nvim',
    dependencies = { 'kkharji/sqlite.lua' },
    config = function()
      require('telescope').load_extension('frecency')
      vim.api.nvim_set_keymap(
        'n',
        '<leader>p',
        '<Cmd>lua require(\'telescope\').extensions.frecency.frecency({ workspace = \'CWD\' })<CR>',
        { noremap = true, silent = true }
      )
    end,
  },
}
