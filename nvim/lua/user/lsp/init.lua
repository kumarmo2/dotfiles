local found, mason = pcall(require, "mason")

if found ~= true then
	return
end

mason.setup({})

require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "rust_analyzer", "omnisharp" },
})
local common_on_attach = require("user.lsp.handlers").on_attach
local client_capablities = require("user.lsp.handlers").capabilities

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
require("user.lsp.servers.lua").setup()
require("user.lsp.servers.rust").setup()
require("lspconfig").tsserver.setup({ on_attach = common_on_attach, capabilities = client_capablities })
