-- Build / quickfix integration (go)
vim.opt_local.makeprg = 'go build'
vim.opt_local.errorformat = table.concat({
  -- Ignore command echo / noise
  '%-Ggo build%.%#',
  '%-Gmake:%.[^:]:%m',
  -- Ignore package header lines like: "# my/module/pkg"
  '%-G#%.%#',
  -- Typical go build errors:
  --   ./main.go:4:2: message
  '%f:%l:%c: %m',
  -- Sometimes no column:
  '%f:%l: %m',
}, ',')

vim.api.nvim_buf_set_keymap(0, 'n', '<leader>bp', ':Make<CR>', { silent = true, noremap = true })

vim.api.nvim_buf_create_user_command(0, 'Make', function()
  local logfile = '/tmp/go_build.log'
  vim.notify('Building go..', vim.log.levels.INFO)

  local out = {}
  local function append(_, data)
    if not data then return end
    for _, line in ipairs(data) do
      if line ~= '' then table.insert(out, line) end
    end
  end

  vim.fn.jobstart({ 'go', 'build' }, {
    stdout_buffered = true,
    stderr_buffered = true,
    on_stdout = append,
    on_stderr = append,
    on_exit = function(_, code)
      vim.fn.writefile(out, logfile)

      if code == 0 then
        vim.notify('✅ go build succeeded', vim.log.levels.INFO)
        vim.fn.setqflist({})
        vim.cmd('cclose')
        return
      end

      vim.notify('go build failed. Check quickfix.', vim.log.levels.INFO)
      vim.cmd('cgetfile ' .. logfile)
      vim.cmd('vertical topleft copen 80')
    end,
  })
end, {})
