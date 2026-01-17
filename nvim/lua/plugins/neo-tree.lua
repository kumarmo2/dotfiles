return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    config = function()
      vim.keymap.set("n", "<leader>n", "<Cmd>Neotree float toggle reveal<CR>")
      require('neo-tree').setup({
        filesystem = {
          filtered_items = {
            hide_dotfiles = false,
            visible = true,
            hide_gitignored = true,
            always_show_by_pattern = {
              ".env*"
            }
          },
          follow_current_file = {
            enabled = true
          }
        }
      })
    end,
    lazy = false, -- neo-tree will lazily load itself
  }
}
