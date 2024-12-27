vim.api.nvim_create_user_command("ToLowercase", function()
  -- Get the start and end positions of the visual selection
  local start_line = vim.fn.line("'<")
  local end_line = vim.fn.line("'>")
  local start_col = vim.fn.col("'<")
  local end_col = vim.fn.col("'>")

  -- Retrieve the selected lines
  local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)

  -- Adjust columns for single-line and multi-line selections
  if #lines == 1 then
    -- Single-line selection: Replace the text between start_col and end_col
    lines[1] = string.sub(lines[1], 1, start_col - 1) ..
        string.lower(string.sub(lines[1], start_col, end_col)) ..
        string.sub(lines[1], end_col + 1)
  else
    -- Multi-line selection:
    lines[1] = string.sub(lines[1], 1, start_col - 1) ..
        string.lower(string.sub(lines[1], start_col))
    lines[#lines] = string.lower(string.sub(lines[#lines], 1, end_col)) ..
        string.sub(lines[#lines], end_col + 1)
    for i = 2, #lines - 1 do
      lines[i] = string.lower(lines[i])
    end
  end

  -- Replace the selected lines in the buffer
  vim.api.nvim_buf_set_lines(0, start_line - 1, end_line, false, lines)
end, { range = true })
