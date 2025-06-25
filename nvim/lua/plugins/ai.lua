return {
  {
    "supermaven-inc/supermaven-nvim",
    event = "VeryLazy",
    config = function()
      require("supermaven-nvim").setup({
        -- log_level = "debug",
      })
    end,
  },
  -- {
  --   'milanglacier/minuet-ai.nvim',
  --   event = 'VeryLazy',
  --   config = function()
  --     -- write fizz buzz
  --     require('minuet').setup {
  --       virtualtext = {
  --         auto_trigger_ft = { 'cs', 'csharp', 'ts', 'js', 'tsx', 'jsx', 'lua' },
  --         keymap = {
  --           -- accept whole completion
  --           accept = '<A-A>',
  --           -- accept one line
  --           accept_line = '<A-a>',
  --           -- accept n lines (prompts for number)
  --           -- e.g. "A-z 2 CR" will accept 2 lines
  --           accept_n_lines = '<A-z>',
  --           -- Cycle to prev completion item, or manually invoke completion
  --           prev = '<A-[>',
  --           -- Cycle to next completion item, or manually invoke completion
  --           next = '<A-]>',
  --           dismiss = '<A-e>',
  --         },
  --         show_on_completion_menu = true,
  --       },
  --       provider = 'openai',
  --       provider_options = {
  --         openai = {
  --           model = 'gpt-4.1-mini',
  --           -- system = "see [Prompt] section for the default value",
  --           -- few_shots = "see [Prompt] section for the default value",
  --           -- chat_input = "See [Prompt Section for default value]",
  --           stream = true,
  --           api_key = 'OPENAI_API_KEY',
  --           optional = {
  --             -- pass any additional parameters you want to send to OpenAI request,
  --             -- e.g.
  --             -- stop = { 'end' },
  --             -- max_tokens = 256,
  --             -- top_p = 0.9,
  --           },
  --         },
  --       }
  --     }
  --   end,
  -- },
  -- {
  --   "olimorris/codecompanion.nvim",
  --   event = 'VeryLazy',
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-treesitter/nvim-treesitter",
  --   },
  --   config = function()
  --     require('codecompanion').setup({
  --       strategies = {
  --         chat = {
  --           adapter = {
  --             name = "openai",
  --             model = "gpt-4.1",
  --
  --           }
  --         }
  --       },
  --       adapters = {
  --         opts = {
  --           show_model_choices = true,
  --         },
  --         openai = function()
  --           return require('codecompanion.adapters').extend("openai", {
  --             env = {
  --               api_key =
  --               "OPENAI_API_KEY"
  --             },
  --             schema = {
  --               model = {
  --                 default = "gpt-4.1",
  --               }
  --             }
  --           })
  --         end
  --       }
  --
  --     });
  --   end
  -- },
}
