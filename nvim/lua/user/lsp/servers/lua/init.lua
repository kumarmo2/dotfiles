local common_on_attach = require("user.lsp.handlers").on_attach

local M = {}

M.setup = function()
	require("lspconfig").sumneko_lua.setup({
		on_attach = common_on_attach,
	})
end
return M
