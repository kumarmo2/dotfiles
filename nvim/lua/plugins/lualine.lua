local batt_percent = ""
local my_section = function()
  return "BATT:" .. batt_percent
end

local set_battery = function()
  local on_exit = function(cmp_obj)
    local stdout = cmp_obj.stdout
    if stdout == nil or stdout == "" then
      return
    end
    local first_occurence_idx = string.find(stdout, ',', 1, true)
    if first_occurence_idx == nil then
      return
    end
    local second_occurence_idx = string.find(stdout, ',', first_occurence_idx + 1, true)
    local substring = string.sub(stdout, first_occurence_idx + 1, second_occurence_idx - 2)
    batt_percent = substring or ""
  end

  vim.system({ "acpi", "-b" }, { text = true }, on_exit)
end

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    print("VimEnter callback")
    local timer = vim.uv.new_timer()
    if timer == nil then
      return
    end
    if vim.fn.executable("acpi") ~= 1 then
      return
    end
    set_battery()
    timer:start(10000, 10000, function()
      set_battery()
    end)
  end
})

return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons', lazy = true },
    lazy = false,
    config = function()
      local lualine = require('lualine')
      local config = {
        options = {
          theme = 'auto',
          component_separators = '|',
          section_separators = '',
          globalstatus = 3,
        },
        sections = {
          lualine_z = { 'location', my_section }
        }
      }
      lualine.setup(config)
    end,
  },
}
