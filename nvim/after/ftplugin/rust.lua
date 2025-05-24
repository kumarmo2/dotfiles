vim.bo.makeprg = "cargo build"
vim.bo.errorformat = table.concat({
  "%-G%.%#aborting due to previous error%.%#", -- ignore “aborting due to previous error” :contentReference[oaicite:6]{index=6}
  "%-G%.%#test failed, to rerun pass%.%#",     -- ignore test hints :contentReference[oaicite:7]{index=7}
  "%D%*\\sDoc-tests %f%.%#",                   -- doc-test file entries :contentReference[oaicite:8]{index=8}
  "%E---- %f - %o (line %l) stdout ----,",     -- doc-test header :contentReference[oaicite:9]{index=9}
  "%Cerror%m,",                                -- doc-test error message :contentReference[oaicite:10]{index=10}
  "%-Z%*\\s--> %f:%l:%c,",                     -- file:line:column info :contentReference[oaicite:11]{index=11}
  "%Eerror%m,",                                -- compiler errors :contentReference[oaicite:12]{index=12}
  "%Wwarning: %m,",                            -- compiler warnings :contentReference[oaicite:13]{index=13}
  "%-Z%*\\s--> %f:%l:%c,",                     -- file info continuation :contentReference[oaicite:14]{index=14}
  "%C%m"                                       -- continuation lines :contentReference[oaicite:15]{index=15}
}, ",")


vim.api.nvim_buf_set_keymap(0, 'n', '<leader>bp', ':Make<CR>', { silent = true, noremap = true });

vim.api.nvim_create_user_command("Make",
  function()
    local logfile = "/tmp/rust_build.log"
    vim.notify("Building rust..", vim.log.levels.INFO);
    vim.fn.jobstart("cargo build > " .. logfile .. " 2>&1", {
      on_exit = function(_, code)
        if code == 0 then
          vim.notify("✅ rust build succeeded", vim.log.levels.INFO)
          vim.cmd("cclose")
        else
          vim.cmd("vertical cfile " .. logfile)
          vim.cmd("vertical topleft copen 80")
          vim.notify("❌ rust build failed. Check quickfix.", vim.log.levels.ERROR);
        end
      end,
    })
  end, {}
)
