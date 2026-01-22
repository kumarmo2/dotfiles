local register_lsp_format_with_au_group = function(lsp, extension, opts)
  local aug_group_name = opts.aug_group_name or lsp .. "Format"

  vim.api.nvim_create_autocmd('BufWritePre', {

    group = vim.api.nvim_create_augroup(aug_group_name, { clear = true }),
    pattern = extension,
    callback = function()
      local is_lsp_enabled = vim.lsp.is_enabled(lsp)
      if not is_lsp_enabled then
        return
      end
      local lines = vim.api.nvim_buf_line_count(0)
      if lines < 5000 then
        vim.lsp.buf.format()
      else
        vim.lsp.buf.format({ async = true })
      end
    end,
  })
end

local register_lsp_format = function(lsp, extension, opts)
  if lsp == nil then
    local msg = "`lsp` cannot be empty"
    vim.notify(msg, vim.log.levels.ERROR, nil);
    return
  end

  if extension == nil or extension == "" then
    return
  end

  opts = opts or {
    lsp_format = true
  }

  if opts.lsp_format then
    register_lsp_format_with_au_group(lsp, extension, opts)
  end
end



local map_lsp_keymaps = function(bufnr, opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>s', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>.', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-.>', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>f', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>dn', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>dp', '<cmd>vim.diagnostic.goto_prev()<CR>', opts)
  vim.api.nvim_buf_set_keymap(
    bufnr,
    'n',
    'gl',
    '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ border = "rounded" })<CR>',
    opts
  )
  vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d', '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
end

vim.diagnostic.config({ virtual_lines = true }) -- in 0.11, by default diagnostics are not shown.
-- that is we need this option.

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('LspAttachCommandGroup', { clear = true }),
  callback = function(event)
    local opts = { noremap = true, silent = true }
    local bufnr = event.buf
    map_lsp_keymaps(bufnr, opts)
    local client = vim.lsp.get_client_by_id(event.data.client_id)

    -- The following two autocommands are used to highlight references of the
    -- word under your cursor when your cursor rests there for a little while.
    --    See `:help CursorHold` for information about when this is executed
    --
    -- When you move your cursor, the highlights will be cleared (the second autocommand).
    if client and client.server_capabilities.documentHighlightProvider then
      vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        buffer = event.buf,
        callback = vim.lsp.buf.document_highlight,
      })

      vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
        buffer = event.buf,
        callback = vim.lsp.buf.clear_references,
      })
    end
  end,
})


--
local capabilities = require('blink.cmp').get_lsp_capabilities()
--
vim.lsp.config('*', {
  capabilities = capabilities,
})

local lsps = { { lsp = 'zls', pattern = '*.zig',                           opts = nil },
  { lsp = 'lua_ls',        extension = '*.lua',                              opts = nil },
  { lsp = 'roslyn',        extension = '*.cs',                               opts = nil },
  { lsp = 'ts_ls',         extension = { "*.ts", "*.js", "*.jsx", "*.tsx" }, opts = nil },
  { lsp = 'tailwindcss',   extension = { "*.ts", "*.js", "*.jsx", "*.tsx" }, opts = nil },
  { lsp = 'gopls',         extension = '*.go',                               opts = nil },
  { lsp = 'rust_analyzer', extension = '*.rs',                               opts = nil },
  {
    lsp = 'clangd',
    extension = '*.c',
    opts = { lsp_format = false },
    config = {
      cmd = {
        'clangd',
        '--clang-tidy',
        '--background-index',
        '--offset-encoding=utf-8',
      },
      root_markers = { '.clangd', 'compile_commands.json' },
      filetypes = { 'c', 'cpp' },
    }
  },
  { lsp = 'docker_compose_language_service' },
};
--
for _, lsp in ipairs(lsps) do
  vim.lsp.enable(lsp.lsp);
  if lsp.config ~= nil then
    vim.lsp.config(lsp.lsp, lsp.config)
  end
  register_lsp_format(lsp.lsp, lsp.extension, lsp.opts)
end
