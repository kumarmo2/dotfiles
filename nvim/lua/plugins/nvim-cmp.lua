return {

  { 'hrsh7th/cmp-buffer',   event = 'VeryLazy' },
  { 'hrsh7th/cmp-path',     event = 'VeryLazy' },
  { 'hrsh7th/cmp-nvim-lsp', event = 'VeryLazy' },
  {
    'hrsh7th/nvim-cmp',
    event = 'VeryLazy',
    config = function()
      local cmp = require('cmp')
      -- local luasnip = require("luasnip");
      cmp.setup({
        -- snippet = {
        --   expand = function(args)
        --     -- vim.snippet.expand(args.body)
        --     luasnip.lsp_expand(args.body);
        --   end,
        -- },
        window = {
          -- completion = cmp.config.window.bordered(),
          -- documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-k>'] = cmp.mapping.select_prev_item(),
          ['<C-j>'] = cmp.mapping.select_next_item(),
          ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-1), { 'i', 'c' }),
          ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(1), { 'i', 'c' }),
          ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
          ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
          ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
          }),
          ['<CR>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.confirm({
                select = true,
              })
              -- if luasnip.expandable() then
              --   luasnip.expand()
              -- else
              --   cmp.confirm({
              --     select = true,
              --   })
              -- end
            else
              fallback()
            end
          end),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
              -- elseif luasnip.locally_jumpable(1) then
              --   luasnip.jump(1)
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
              -- elseif luasnip.locally_jumpable(-1) then
              --   luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),

        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          -- { name = 'luasnip' },
          { name = 'nvim_lua' },
          { name = 'buffer' },
          { name = 'path' },
        }),
        formatting = {
          format = function(entry, vim_item)
            if vim.tbl_contains({ 'path' }, entry.source.name) then
              local icon, hl_group = require('nvim-web-devicons').get_icon(entry:get_completion_item().label)
              if icon then
                vim_item.kind = icon
                vim_item.kind_hl_group = hl_group
                return vim_item
              end
            end
            return require('lspkind').cmp_format({ with_text = false })(entry, vim_item)
          end,
        },
      })
    end,
  },
  -- {
  --   "L3MON4D3/LuaSnip",
  --   lazy = false,
  --   -- follow latest release.
  --   version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
  --   -- install jsregexp (optional!).
  --   build = "make install_jsregexp",
  --   dependencies = { 'saadparwaiz1/cmp_luasnip', },
  --   config = function()
  --     local ls = require("luasnip");
  --     local s = ls.snippet;
  --     local t = ls.text_node;
  --     local i = ls.insert_node;
  --     local types = require("luasnip.util.types")
  --     ls.setup({
  --       keep_roots = true,
  --       link_roots = true,
  --       link_children = true,
  --
  --       -- Update more often, :h events for more info.
  --       update_events = "TextChanged,TextChangedI",
  --       -- Snippets aren't automatically removed if their text is deleted.
  --       -- `delete_check_events` determines on which events (:h events) a check for
  --       -- deleted snippets is performed.
  --       -- This can be especially useful when `history` is enabled.
  --       delete_check_events = "TextChanged",
  --       ext_opts = {
  --         [types.choiceNode] = {
  --           active = {
  --             virt_text = { { "choiceNode", "Comment" } },
  --           },
  --         },
  --       },
  --       -- treesitter-hl has 100, use something higher (default is 200).
  --       ext_base_prio = 300,
  --       -- minimal increase in priority.
  --       ext_prio_increase = 1,
  --       enable_autosnippets = true,
  --       -- mapping for cutting selected text so it's usable as SELECT_DEDENT,
  --       -- SELECT_RAW or TM_SELECTED_TEXT (mapped via xmap).
  --       store_selection_keys = "<Tab>",
  --       -- luasnip uses this function to get the currently active filetype. This
  --       -- is the (rather uninteresting) default, but it's possible to use
  --       -- eg. treesitter for getting the current filetype by setting ft_func to
  --       -- require("luasnip.extras.filetype_functions").from_cursor (requires
  --       -- `nvim-treesitter/nvim-treesitter`). This allows correctly resolving
  --       -- the current filetype in eg. a markdown-code block or `vim.cmd()`.
  --       ft_func = function()
  --         return vim.split(vim.bo.filetype, ".", true)
  --       end,
  --
  --     })
  --     require("luasnip.loaders.from_vscode").lazy_load()
  --     local js_doc_snippet = { s("///", {
  --       t({ "/** ", "" }), t(" * "), i(1), t({ "", " * */" })
  --     }) };
  --
  --     ls.add_snippets("javascript", js_doc_snippet)
  --     ls.add_snippets("javascriptreact", js_doc_snippet)
  --   end
  --
  -- }
}
