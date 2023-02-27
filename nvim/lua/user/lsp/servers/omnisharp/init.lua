local vim = vim
local lspconfig = require("lspconfig")

local common_on_attach = require("user.lsp.handlers").on_attach
local client_capablities = require("user.lsp.handlers").capabilities

local lsp_options = { on_attach = common_on_attach, capabilities = client_capablities }

local M = {}

M.setup = function()
	local pid = vim.fn.getpid()
	local omnisharp_bin = "/usr/bin/omnisharp"

	local config = {
		handlers = {
			["textDocument/definition"] = require("omnisharp_extended").handler,
		},
		cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
		-- rest of your settings
	}
	lsp_options = vim.tbl_deep_extend("force", config, lsp_options)

	lspconfig.omnisharp.setup(lsp_options)
end

return M
