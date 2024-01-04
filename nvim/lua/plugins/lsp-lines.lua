vim.diagnostic.config({
  virtual_text = false,
})
return {
  {
    'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
    event = 'VeryLazy',
    config = function()
      -- plugin for managing user session.
      -- plugin: https://github.com/folke/persistence.nvim
      require('lsp_lines').setup()
    end,
  },
}
