local enable_ui2 = function()
  require('vim._core.ui2').enable({})
end

local vim_version = vim.version()

if vim_version.major > 0 then
  enable_ui2()
end

if vim_version.minor >= 12 then
  enable_ui2()
end

