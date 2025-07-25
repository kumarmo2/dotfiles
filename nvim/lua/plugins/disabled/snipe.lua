return {
  {
    "leath-dub/snipe.nvim",
    keys = {
      { "fj", function() require("snipe").open_buffer_menu() end, desc = "Open Snipe buffer menu" }
    },
    config = function()
      local snipe = require('snipe')
      snipe.setup({
        ui = {
          position = "center"
        }
      })
    end
  }
}
