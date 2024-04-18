local binding_opts = { silent = true, noremap = true }
return {
  {
    keys = { '<leader>,', '<leader>m', '<leader>]', '<leader>[' },
    'ThePrimeagen/harpoon',
    config = function()
      vim.api.nvim_set_keymap('n', '<leader>,', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', binding_opts)
      vim.api.nvim_set_keymap('n', '<leader>m', ':lua require("harpoon.mark").add_file()<CR>', binding_opts)
      vim.api.nvim_set_keymap('n', '<leader>]', ':lua require("harpoon.ui").nav_next()<CR>', binding_opts)
      vim.api.nvim_set_keymap('n', '<leader>[', ':lua require("harpoon.ui").nav_prev()<CR>', binding_opts)
    end,
  },
}
