local doubleSlash = '//'

local comment_map = {
  ['lua'] = { '--' }, -- TODO: Add support for block comments in future
  ['rust'] = { doubleSlash },
  ['go'] = { doubleSlash },
  ['yaml'] = { '#' },
}

local get_first_non_whitespace_position_in_row = function(buf, row)
  -- TODO: After testing(either through unit testing or actual testing, once the
  -- working of this function is tested, update the `4` to `20` columns)
  -- we will try in batches of 4 columns
  -- i.e first we will try to find a non-whitespace character in [0, 19] and then [4, 39] and so on
  -- NOTE: this returns postition which is 1 indexed
  local start_col = 0
  local end_col = 4
  local text = vim.api.nvim_buf_get_text(buf, row, start_col, row, end_col, {})[1]
  while text ~= nil and text ~= '' do
    local local_index = string.find(text, '%S') -- returns nil if not found
    if local_index ~= nil then
      return start_col + local_index
    end
    start_col = end_col
    end_col = end_col + 4
    text = vim.api.nvim_buf_get_text(buf, row, start_col, row, end_col, {})[1]
  end
  return nil
end

local toggleSingleLineCommentForFileType = function(row, filetype)
  local comment_character_length = string.len(comment_map[filetype][1])
  local pos = get_first_non_whitespace_position_in_row(0, row) -- NOTE: 1 indexed
  if pos == nil then
    return
  end

  local start_col = pos - 1
  local end_col = start_col + comment_character_length
  local potential_comment_chars = vim.api.nvim_buf_get_text(0, row, start_col, row, end_col, {})[1]

  if potential_comment_chars ~= comment_map[filetype][1] then
    vim.api.nvim_buf_set_text(0, row, pos - 1, row, pos - 1, { comment_map[filetype][1] })
  else
    vim.api.nvim_buf_set_text(0, row, pos - 1, row, pos + comment_character_length - 1, { '' })
  end
end

local toggleSingleLineComment = function()
  local filetype = vim.api.nvim_get_option_value('filetype', { buf = 0 })
  if filetype == nil or filetype == '' then
    return
  end
  if comment_map[filetype] == nil then
    return
  end
  local save_cursor = vim.fn.getcurpos()
  local row = save_cursor[2] - 1 -- zero based

  toggleSingleLineCommentForFileType(row, filetype)
end

local toggleMultiLineComment = function()
  local filetype = vim.api.nvim_get_option_value('filetype', { buf = 0 })
  if filetype == nil or filetype == '' then
    return
  end
  if comment_map[filetype] == nil then
    return
  end
  local start_row = vim.fn.getpos('v')[2]
  local end_row = vim.fn.getcurpos()[2]

  if end_row < start_row then
    --This swap is needed because vim.fn.getpos('v') returns the first line that was selected visually.
    --so if in visual mode, someone goes from down to up, then `end_row` < `start_row`
    local temp = end_row
    end_row = start_row
    start_row = temp
  end

  for i = start_row - 1, end_row - 1, 1 do
    toggleSingleLineCommentForFileType(i, filetype)
  end
end

vim.keymap.set('n', '<C-_>', toggleSingleLineComment, { noremap = true, silent = true })
vim.keymap.set('v', '<C-_>', toggleMultiLineComment, { noremap = true })
