local found, mason = pcall(require, "mason")

if found ~= true then
	return
end

mason.setup({})

require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "rust_analyzer", "omnisharp" },
})

local lspconfig = require("lspconfig")

local common_on_attach = require("user.lsp.handlers").on_attach
local client_capablities = require("user.lsp.handlers").capabilities

local lsp_options = { on_attach = common_on_attach, capabilities = client_capablities }
-- NOTE: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

-- Language servers setup.

lspconfig.lua_ls.setup(lsp_options) -- lua
lspconfig.tsserver.setup(lsp_options) -- js/ts
require("user.lsp.servers.rust").setup() -- rust
require("user.lsp.servers.omnisharp").setup() -- csharp
