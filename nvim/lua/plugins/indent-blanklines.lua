local vim = vim
vim.opt.termguicolors = true

return {
  {

    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('indent_blankline').setup({
        -- for example, context is off by default, use this to turn it on
        show_current_context = true,
        show_trailing_blankline_indent = true,
        -- show_current_context_start = true,
        -- space_char_blankline = '',
        -- char_highlight_list = {
        -- 'IndentBlanklineIndent1',
        -- 'IndentBlanklineIndent2',
        -- 'IndentBlanklineIndent3',
        -- 'IndentBlanklineIndent4',
        -- 'IndentBlanklineIndent5',
        -- 'IndentBlanklineIndent6',
        -- },
      })
    end,
  },
}
