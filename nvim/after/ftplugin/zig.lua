vim.opt_local.makeprg = 'zig build'
vim.opt_local.errorformat = '%f:%l:%c: %t%*[^:]: %m'

vim.api.nvim_buf_set_keymap(0, 'n', '<leader>bp', ':Make<CR>', { silent = true, noremap = true })



vim.api.nvim_create_user_command('Make', function()
  local logfile = '/tmp/zig_build.log'
  vim.notify('Building Zig..', vim.log.levels.INFO)
  vim.fn.jobstart('zig build > ' .. logfile .. ' 2>&1', {
    on_exit = function(_, code)
      if code == 0 then
        vim.notify('✅ Zig build succeeded', vim.log.levels.INFO)
        local qlist = vim.fn.getqflist()
        if qlist == nil or #qlist == 0 then
          vim.cmd('vertical topleft copen 80')
          return
        end
        vim.fn.setqflist({})
        -- vim.cmd("cclose")
      else
        vim.cmd('vertical cfile ' .. logfile)
        vim.cmd('vertical topleft copen 80')
        vim.notify('❌ Zig build failed. Check quickfix.', vim.log.levels.ERROR)
      end
    end,
  })
end, {})
