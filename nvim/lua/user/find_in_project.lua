local find_proj_buf = -1
local find_proj_win = -1


local function find_in_project()
  if vim.api.nvim_win_is_valid(find_proj_win) then
    -- close the existing window
    vim.api.nvim_win_close(find_proj_win, true)
    find_proj_win = -1
    return
  end

  vim.cmd('vsplit')
  local total_cols = vim.o.columns
  local target_width = math.floor(total_cols * 0.20)

  vim.cmd('vertical resize ' .. target_width)
  vim.cmd('enew')
  find_proj_buf = vim.api.nvim_get_current_buf()

  -- make it a “prompt” buffer
  vim.api.nvim_set_option_value('buftype', 'prompt', { buf = find_proj_buf })
  vim.api.nvim_set_option_value('swapfile', false, { buf = find_proj_buf })
  vim.api.nvim_set_option_value('filetype', 'prompt', { buf = find_proj_buf })
  vim.api.nvim_set_option_value('bufhidden', 'wipe', { buf = find_proj_buf })

  -- set up the little input prompt
  vim.fn.prompt_setprompt(find_proj_buf, 'Find▶ ')

  vim.fn.prompt_setcallback(find_proj_buf, function(input)
    if input and #input > 0 then
      vim.cmd('silent grep! ' .. vim.fn.shellescape(input) .. ' **/*')
      -- open quickfix window
      vim.cmd('copen')
      vim.cmd('bd! ' .. find_proj_buf)
    end
  end)

  -- go into insert mode so you can start typing right away
  vim.api.nvim_set_current_buf(find_proj_buf)
  find_proj_win = vim.api.nvim_get_current_win()
  vim.cmd('startinsert')
end

-- 2) Expose a user command and a convenient mapping
vim.api.nvim_create_user_command('FindInProject', find_in_project, {})
vim.keymap.set('n', '<leader>fp', '<cmd>FindInProject<CR>', { desc = 'VSCode‑style find in project' })
