return {
  {
    'MeanderingProgrammer/render-markdown.nvim',
    opts = {},
    ft = "markdown",
    config = function()
      require('render-markdown').setup {
        -- bullet = {
        --   -- Turn on / off list bullet rendering
        --   enabled = true,
        --   -- Replaces '-'|'+'|'*' of 'list_item'
        --   -- How deeply nested the list is determines the 'level'
        --   -- The 'level' is used to index into the array using a cycle
        --   -- If the item is a 'checkbox' a conceal is used to hide the bullet instead
        --   icons = { '●', '○', '◆', '◇' },
        --   -- Padding to add to the left of bullet point
        --   left_pad = 0,
        --   -- Padding to add to the right of bullet point
        --   right_pad = 0,
        --   -- Highlight for the bullet icon
        --   highlight = 'RenderMarkdownBullet',
        -- },
        -- {
        --   -- Mimic org-indent-mode behavior by indenting everything under a heading based on the
        --   -- level of the heading. Indenting starts from level 2 headings onward.
        --   indent = {
        --     -- Turn on / off org-indent-mode
        --     enabled = false,
        --     -- Amount of additional padding added for each heading level
        --     per_level = 2,
        --   },
        -- }
      }
    end,
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  }
}
