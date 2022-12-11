local null_ls = require("null-ls")
local vim = vim

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
-- local completion = null_ls.builtins.completion
-- [[
-- NOTE:
-- in this config file we are only setting up the null-ls. i.e we are telling what
-- formatters, linters etc to use. This setup will make sure when a call is made to `vim.lsp.buf.format` and null-ls
-- ends up formatting the document, it will format according to this setup.
-- check the lsp on_attach handler where I am setting up the lsp based formatting.
--
-- ]]
-- NOTE: Need to make sure the sources are available in $PATH.
local config = {
	sources = {
		-- formatters
		formatting.stylua,
		formatting.prettier,
		formatting.csharpier,
		formatting.rustfmt,

		-- linters/diagnostics
		diagnostics.eslint,
	},
	-- debug = true
}

null_ls.setup(config)
