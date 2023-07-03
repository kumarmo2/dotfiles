return {
  {
    'nvim-neorg/neorg',
    build = ':Neorg sync-parsers',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('neorg').setup({
        load = {
          ['core.defaults'] = {}, -- Loads default behaviour
          ['core.concealer'] = {}, -- Adds pretty icons to your documents
          ['core.dirman'] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                notes = '~/dev/kumarmo2/norg-notes',
                ['work-notes'] = '~/work/joyn_fdg_service/self_notes/norg_notes',
              },
            },
          },
        },
      })
    end,
  },
}
