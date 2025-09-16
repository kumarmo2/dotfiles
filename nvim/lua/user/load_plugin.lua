local get_unloaded_plugins = function()
  local ok, lazy = pcall(require, 'lazy')
  if not ok then
    print('Error loading lazy.nvim')
  else
    print("loaded lazy.nvim")
  end

  local unloaded = {}
  local rtp = vim.api.nvim_list_runtime_paths()

  for _, p in pairs(lazy.plugins()) do
    -- Skip disabled plugins
    if p.enabled ~= false then
      -- lazy.nvim marks runtime state on p._.loaded (true when actually loaded)
      local loaded = p._ and p._.loaded

      -- Fallback check: if plugin dir is on &rtp, it’s effectively loaded
      if loaded == nil then
        loaded = vim.tbl_contains(rtp, p.dir)
      end

      if not loaded then
        table.insert(unloaded, p)
      end
    end
  end

  return unloaded
end

local function open_unloaded_plugins_fzf()
  local ok_fzf, fzf = pcall(require, "fzf-lua")
  if not ok_fzf then
    vim.notify("fzf-lua not found", vim.log.levels.ERROR)
    return
  end

  local plugins = get_unloaded_plugins()
  if #plugins == 0 then
    vim.notify("All lazy.nvim plugins appear to be loaded.", vim.log.levels.INFO)
    return
  end

  -- Build display lines and quick lookup by name
  local lines = {}
  for _, p in ipairs(plugins) do
    local dir = p.dir or ""
    local desc = p.desc or (p._ and p._.module) or ""
    local line = string.format("%s\t%s\t%s", p.name, dir, desc)
    table.insert(lines, line)
    -- print("p: " .. vim.inspect(p))
  end

  fzf.fzf_exec(lines, {
    prompt = "Unloaded plugins> ",
    -- show only the plugin name in the list, with dir + desc as preview
    fzf_opts = {
      ["--delimiter"] = "\t",
      ["--with-nth"] = "1",
      ["--preview-window"] = "wrap",
      ["--preview"] = [[
        echo -e "Dir: {2}\n\nDesc: {3}\n\nREADME (if present):\n" ; \
        test -f {2}/README.md && sed -n '1,120p' {2}/README.md || true
      ]],
    },
    actions = {
      -- <Enter>: load the plugin via lazy.load
      ["default"] = function(selected)
        local sel = selected[1]
        if not sel then return end
        local name = sel:match("^([^\t]+)")
        local ok_lazy, lazy = pcall(require, "lazy")
        if not ok_lazy then return end
        lazy.load({ plugins = { name } })
        vim.notify("Loaded plugin: " .. name, vim.log.levels.INFO)
      end,
    },
  })
end

-- Expose a user command
vim.api.nvim_create_user_command("LazyUnloadedFzf", open_unloaded_plugins_fzf, {})
vim.api.nvim_set_keymap('n', '<leader>llp', ':LazyUnloadedFzf<CR>', { noremap = true, silent = true })
