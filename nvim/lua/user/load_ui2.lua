local enable_ui2 = function()
  require('vim._core.ui2').enable({})
  vim.cmd("set cmdheight=0") -- ui2 will handle to show the cmdline when its needed
end


local vim_version = vim.version()

if vim_version.major > 0 then
  enable_ui2()
end

if vim_version.minor >= 12 then
  enable_ui2()
end
