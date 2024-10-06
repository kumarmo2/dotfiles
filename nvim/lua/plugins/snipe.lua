return {
  {
    "leath-dub/snipe.nvim",
    keys = { "<leader>sb" },
    desc = "Open snipe buffer menu",
    config = function()
      local snipe = require("snipe")
      snipe.setup()

      vim.keymap.set("n", "<leader>sb", function()
        print("snipe buffers called")
        snipe.create_buffer_menu_toggler({ max_path_width = 2 })()
      end)
    end

  }
}
