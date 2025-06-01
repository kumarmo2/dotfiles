vim.opt_local.tabstop = 2
vim.opt_local.shiftwidth = 2

require('utils.lsp').register_lsp_format('lua_ls', 'lua');
