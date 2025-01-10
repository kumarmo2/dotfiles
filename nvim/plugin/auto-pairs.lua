local map = {
  ['('] = '()<Left>',
  ['{'] = '{}<Left>',
  ['['] = '[]<Left>',
  ['"'] = '""<Left>',
  ['\''] = '\'\'<Left>',
}

for k, v in pairs(map) do
  vim.keymap.set('i', k, v)
end
