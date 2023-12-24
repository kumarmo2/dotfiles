return {
  {

    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', name = 'nvim_tree_web_devicons' },
    cmd = { 'TroubleToggle' },
    config = function()
      require('trouble').setup({})
    end,
  },
}
