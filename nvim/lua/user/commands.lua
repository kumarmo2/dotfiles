local hight_au_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })

vim.api.nvim_create_autocmd('TextYankPost', {
  group = hight_au_group,
  callback = function()
    vim.highlight.on_yank({ timeout = 500 })
  end,
})
