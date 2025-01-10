return {
  {
    'NeogitOrg/neogit',
    keys = {'<leader>gg'},
    dependencies = {
      'nvim-lua/plenary.nvim', -- required
      'nvim-telescope/telescope.nvim', -- optional
      'sindrets/diffview.nvim', -- optional
      'ibhagwan/fzf-lua', -- optional
    },
    config = function ()
      require('neogit').setup{}
      vim.api.nvim_set_keymap('n', '<leader>gg', ':Neogit<CR>', {})
    end,
  },
}
