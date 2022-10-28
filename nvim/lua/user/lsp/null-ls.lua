local null_ls = require("null-ls")
local vim = vim

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
-- local completion = null_ls.builtins.completion

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
}

null_ls.setup(config)

-- Setting auto-command for format on save for particular languages.
local group = vim.api.nvim_create_augroup("nvim_auto_format", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.js", "*.lua", "*.cs", "*.rs" },
  command = "lua vim.lsp.buf.format()",
})
