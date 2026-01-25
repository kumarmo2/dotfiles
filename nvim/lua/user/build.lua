local function run_build_bash()
  local cwd = vim.fn.getcwd()
  local build_script = cwd .. "/build.sh"
  local output_lines = {}

  -- check if file exists
  if vim.fn.filereadable(build_script) == 0 then
    vim.notify("build.sh not found in " .. cwd, vim.log.levels.WARN)
    return
  end

  local function append_output(data)
    if not data then
      return
    end
    -- jobstart often sends a final { "" } chunk; keep quickfix clean.
    local last = #data
    if last > 0 and data[last] == "" then
      data[last] = nil
    end
    if #data == 0 then
      return
    end
    for _, line in ipairs(data) do
      output_lines[#output_lines + 1] = line
    end
  end


  -- start job
  vim.fn.jobstart(
    { "bash", build_script },
    {
      -- stdout_buffered = false,
      -- stderr_buffered = false,

      on_stdout = function(_, data)
        if data then
          append_output(data)
        end
      end,

      on_stderr = function(_, data)
        if data then
          append_output(data)
        end
      end,

      on_exit = function(_, code)
        vim.schedule(function()
          vim.fn.setqflist({}, "r", {
            title = "build.sh (" .. cwd .. ")",
            lines = output_lines,
          })
          vim.cmd("copen")
        end)
      end,
    }
  )
end

vim.api.nvim_create_user_command('Build', run_build_bash, {})
