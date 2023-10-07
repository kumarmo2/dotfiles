local vim = vim
vim.opt.termguicolors = true

return {
  {

    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    config = function()
      require('ibl').setup({})
    end,
  },
}
