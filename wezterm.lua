local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.initial_cols = 120
config.initial_rows = 28

config.font = wezterm.font("FiraCode Nerd Font Mono")
config.font_size = 20 

--- Available color schemes: https://wezfurlong.org/wezterm/colorschemes/index.html
--- Catppuccin Mocha
---Catppuccin Macchiato
---Tokyo Night
---Gruvbox Dark
---Dracula
---OneDark (base16)
---Nord
---Solarized Dark
---Builtin Solarized Dark
---GitHub Dark
---Kanagawa (Dragon)
---Kanagawa (Wave)
---Night Owl
---Everforest Dark (Hard)
---Monokai Pro
---AdventureTime
config.color_scheme = 'Catppuccin Macchiato'

config.keys = {
  -- New tab
  {
    key = "t",
    mods = "CMD",
    action = wezterm.action.SpawnTab("CurrentPaneDomain"),
  },

  -- Switch tabs
  {
    key = "[",
    mods = "CMD",
    action = wezterm.action.ActivateTabRelative(-1),
  },

  {
    key = "]",
    mods = "CMD",
    action = wezterm.action.ActivateTabRelative(1),
  },

  -- Split into top and bottom
  {
    key = "d",
    mods = "CMD",
    action = wezterm.action.SplitHorizontal {
      domain = "CurrentPaneDomain",
    },
  },

  -- Split into left and right
  {
    key = "d",
    mods = "CMD|SHIFT",
    action = wezterm.action.SplitVertical {
      domain = "CurrentPaneDomain",
    },
  },

  -- Navigate between panes
  {
    key = "h",
    mods = "ALT",
    action = wezterm.action.ActivatePaneDirection("Left"),
  },
  {
    key = "j",
    mods = "ALT",
    action = wezterm.action.ActivatePaneDirection("Down"),
  },
  {
    key = "k",
    mods = "ALT",
    action = wezterm.action.ActivatePaneDirection("Up"),
  },
  {
    key = "l",
    mods = "ALT",
    action = wezterm.action.ActivatePaneDirection("Right"),
  },
}

return config
