-- vim.api.nvim_set_hl(0, "StatusColRelative", { fg = "#8155BA" })
vim.api.nvim_set_hl(0, "StatusColRelative", { link = "LineNr" })
vim.api.nvim_set_hl(0, "StatusColAbsolute", { link = "CursorLineNr", bold = true })

-- statuscolumn entrypoint
-- vim.o.statuscolumn = "%!v:lua.StatusColumnNumbers()"
local friendly_status = "%!v:lua.StatusColumnNumbers()"
local is_friendly = false
-- vim.o.statuscolumn = ""

function _G.StatusColumnNumbers()
  local absolute = vim.v.lnum
  local current = vim.fn.line(".")
  local relative = math.abs(absolute - current)
  if absolute == current then
    relative = 0
  end

  -- Format string notes:
  --   %#Group#  -> statuscolumn: switch highlight group
  --   %*        -> statuscolumn: reset highlight
  --   %4d       -> string.format: integer width 4
  --   %%        -> escape % so it reaches statuscolumn formatting
  -- Result: highlight absolute number, reset, highlight relative number, reset, then add a separator.
  return string.format(
    "%%#StatusColAbsolute#%4d%%* %%#StatusColRelative#%4d%%* │ ",
    absolute,
    relative
  )
end

vim.api.nvim_create_user_command("ToggleFriendlyLineNumbers", function()
  if is_friendly then
    is_friendly = false
  else
    is_friendly = true
  end


  if is_friendly then
    vim.o.statuscolumn = friendly_status
  else
    vim.o.statuscolumn = ""
  end
end, {})
