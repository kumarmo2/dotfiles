local comment_map = {
  ['lua'] = '--',
}

local get_first_non_whitespace_position_in_row = function(buf, row)
  -- we will try in batches of 20 columns
  -- i.e first we will try to find a non-whitespace character in [0, 19] and then [20, 39] and so on
  -- NOTE: this returns postition which is 1 indexed
  local start_col = 0
  local end_col = 20
  local text = vim.api.nvim_buf_get_text(buf, row, start_col, row, end_col, {})[1]
  while text ~= nil and text ~= '' do
    local local_index = string.find(text, '%S') -- returns nil if not found
    if local_index ~= nil then
      return start_col + local_index
    end
    text = vim.api.nvim_buf_get_text(buf, row, end_col, row, end_col + 20, {})[1]
  end
  return nil
end

local toggleSingleLineComment = function()
  local filetype = vim.api.nvim_get_option_value('filetype', { buf = 0 })
  if filetype == nil or filetype == '' then
    return
  end
  if comment_map[filetype] == nil then
    return
  end
  local comment_character_length = string.len(comment_map[filetype])
  local save_cursor = vim.fn.getcurpos()
  local row = save_cursor[2] - 1 -- zero based
  local pos = get_first_non_whitespace_position_in_row(0, row) -- NOTE: 1 indexed

  if pos == nil then
    return
  end
  local start_col = pos - 1 --
  local end_col = start_col + comment_character_length
  local potential_comment_chars = vim.api.nvim_buf_get_text(0, row, start_col, row, end_col, {})[1]

  if potential_comment_chars ~= comment_map[filetype] then
    vim.api.nvim_buf_set_text(0, row, pos - 1, row, pos - 1, { comment_map[filetype] })
  else
    vim.api.nvim_buf_set_text(0, row, pos - 1, row, pos + comment_character_length - 1, { '' })
  end
end

local toggleMultiLineComment = function()
  local start_mark = vim.api.nvim_buf_get_mark(0, '<')
  print(vim.inspect(start_mark))
  local end_mark = vim.api.nvim_buf_get_mark(0, '>')
  print(vim.inspect(end_mark))
end

vim.keymap.set('n', '<leader>/', toggleSingleLineComment, { noremap = true, silent = true })
--toggleMultiLineComment()