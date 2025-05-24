vim.opt_local.makeprg = 'zig build'
vim.opt_local.errorformat = "%f:%l:%c: %t%*[^:]: %m"

vim.api.nvim_buf_set_keymap(0, 'n', '<leader>bp', ':Make<CR>', { silent = true, noremap = true });

vim.api.nvim_create_user_command("Make",
  function()
    local logfile = "/tmp/zig_build.log"
    print("Building Zig..")
    vim.fn.jobstart("zig build > " .. logfile .. " 2>&1", {
      on_exit = function(_, code)
        if code == 0 then
          print("✅ Zig build succeeded")
        else
          vim.cmd("vertical cfile " .. logfile)
          vim.cmd("vertical topleft copen 80")
          print("❌ Zig build failed. Check quickfix.")
        end
      end,
    })
  end, {}
)
