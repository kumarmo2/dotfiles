local vim = vim;
local opt = vim.opt;

require'nvim-treesitter.configs'.setup {
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = {"rust", "c", "css", "html", "lua", "javascript", "python"} ,

  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing
  -- ignore_install = { "javascript" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- list of language that will be disabled
    -- disable = { "c", "rust" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true
  },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  }
}

-- code folding starts

-- opt.foldmethod = "expr"
-- opt.foldexpr = "nvim_treesitter#foldexpr()"

-- local callback = function ()
    -- print("inside callback")
    -- vim.api.nvim_command('normal zR')
-- end

-- local group = vim.api.nvim_create_augroup("OpenCodeFoldsByDefault", { clear = true});
-- vim.api.nvim_create_autocmd({"BufReadPost", "FileReadPost", "BufEnter"}, { pattern = "*", callback = callback, group = group})

-- code folding ends
