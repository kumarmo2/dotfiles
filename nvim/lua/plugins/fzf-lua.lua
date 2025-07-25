local keys_to_command_map = {
  ['<leader>p'] = ':FzfLua files<CR>',
  ['<leader>;'] = ':FzfLua buffers<CR>',
  ['<leader>fg'] = ':FzfLua live_grep<CR>',
  ['<leader>gf'] = ':FzfLua git_files<CR>',
  ['<leader>th'] = ':FzfLua helptags<CR>',
}
local keys = {}

for k, _ in pairs(keys_to_command_map) do
  table.insert(keys, k)
end

return {
  {
    'ibhagwan/fzf-lua',
    -- optional for icon support
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = keys,
    config = function()
      -- calling `setup` is optional for customization
      require('fzf-lua').setup({
        keymap = {
          fzf = { true, ['ctrl-q'] = 'select-all+accept' }, -- send to quickfix list
        },
      })
      local opts = { noremap = true, silent = true }
      vim.api.nvim_exec2('FzfLua register_ui_select', {})
      for k, v in pairs(keys_to_command_map) do
        vim.keymap.set('n', k, v, opts)
      end
    end,
  },
}
