local M = {};

M.register_lsp_format = function(lsp, extension, opts)
  if extension == nil or extension == "" then
    local msg = "'extension' cannot be empty"
    vim.notify(msg, vim.log.levels.ERROR, nil)
    return
  end

  if lsp == nil then
    local msg = "`lsp` cannot be empty"
    vim.notify(msg, vim.log.levels.ERROR, nil);
    return
  end

  opts = opts or {}
  local aug_group_name = opts.aug_group_name or lsp .. "Format"

  vim.api.nvim_create_autocmd('BufWritePre', {

    group = vim.api.nvim_create_augroup(aug_group_name, { clear = true }),
    pattern = "*." .. extension,
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

return M
