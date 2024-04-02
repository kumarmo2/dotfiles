-- Autocommand for setting the filetype of ansible playbook, so that
-- the LSP gets attached automatically.
local augroup = vim.api.nvim_create_augroup('ansible_playbook_augroup', {})
vim.api.nvim_clear_autocmds({ group = augroup })
vim.api.nvim_create_autocmd({ 'BufEnter' }, {
  pattern = '*.playbook.yaml',
  group = augroup,
  callback = function()
    print('entered a playbook')
    vim.cmd('set filetype=yaml.ansible')
  end,
})
