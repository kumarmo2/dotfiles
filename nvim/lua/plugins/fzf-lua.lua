return {
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    config = function()
      -- calling `setup` is optional for customization
      require("fzf-lua").setup({})
      local keys_to_command_map = {
        ['<leader>p'] = ':FzfLua files<CR>',
        ['<leader>;'] = ':FzfLua buffers<CR>',
        ['<leader>fg'] = ':FzfLua live_grep<CR>',
        ['<leader>gf'] = ':FzfLua git_files<CR>',
        ['<leader>th'] = ':FzfLua helptags<CR>',
      }
      local opts = { noremap = true, silent = true }
      vim.api.nvim_exec2("FzfLua register_ui_select", {})
      for k, v in pairs(keys_to_command_map) do
        vim.keymap.set('n', k, v, opts)
      end
    end
  }
}
