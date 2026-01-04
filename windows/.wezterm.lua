local wezterm = require 'wezterm'
local act = wezterm.action

local keys = {
  -- This will create a new split and run your default program inside it
  {
    key = ';',
    mods = 'ALT',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = "'",
    mods = 'ALT',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'x',
    mods = 'ALT',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },
  { key = 'p', mods = 'CTRL', action = act.PaneSelect },
  {
    key = 'n',
    mods = 'ALT',
    action = act.SpawnTab 'CurrentPaneDomain',
  },
   {
    key = 'LeftArrow',
    mods = 'CTRL',
    action = act.ActivatePaneDirection 'Left',
  },
  {
    key = 'RightArrow',
    mods = 'CTRL',
    action = act.ActivatePaneDirection 'Right',
  },
  {
    key = 'UpArrow',
    mods = 'CTRL',
    action = act.ActivatePaneDirection 'Up',
  },
  {
    key = 'DownArrow',
    mods = 'CTRL',
    action = act.ActivatePaneDirection 'Down',

  }
}

  local default_prog = {
    'pwsh.exe', '-NoLogo', '-NoExit', '-Command',
    [[
      Import-Module "C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\Tools\Microsoft.VisualStudio.DevShell.dll";
      Enter-VsDevShell -VsInstallPath "C:\Program Files\Microsoft Visual Studio\2022\Community" -SkipAutomaticLocation -DevCmdArguments "-arch=x64";
      Write-Host "MSVC environment ready in PowerShell."
    ]]
  }


return {
  default_prog = default_prog,
  keys = keys,
  automatically_reload_config = true
}

