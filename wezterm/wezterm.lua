local wezterm = require 'wezterm'

local config = wezterm.config_builder()

-- Detect OS
local is_macos = wezterm.target_triple:find("darwin") ~= nil

-- Platform-specific modifiers
local CMD = is_macos and "CMD" or "CTRL|SHIFT"
local CMD_SHIFT = is_macos and "CMD|SHIFT" or "CTRL|ALT"

config.initial_cols = 120
config.initial_rows = 28

config.font = wezterm.font("FiraCode Nerd Font Mono")
config.font_size = 15

-- Available color schemes:
-- https://wezfurlong.org/wezterm/colorschemes/index.html
config.color_scheme = "Catppuccin Macchiato"

config.keys = {
  ----------------------------------------------------------------------
  -- Tabs
  ----------------------------------------------------------------------
  {
    key = "t",
    mods = CMD,
    action = wezterm.action.SpawnTab("CurrentPaneDomain"),
  },

  {
    key = "w",
    mods = CMD,
    action = wezterm.action.CloseCurrentPane { confirm = false },
  },

  {
    key = "[",
    mods = CMD,
    action = wezterm.action.ActivateTabRelative(-1),
  },

  {
    key = "]",
    mods = CMD,
    action = wezterm.action.ActivateTabRelative(1),
  },

  ----------------------------------------------------------------------
  -- Split panes
  ----------------------------------------------------------------------
  {
    key = "d",
    mods = CMD,
    action = wezterm.action.SplitHorizontal {
      domain = "CurrentPaneDomain",
    },
  },

  {
    key = "d",
    mods = CMD_SHIFT,
    action = wezterm.action.SplitVertical {
      domain = "CurrentPaneDomain",
    },
  },

  ----------------------------------------------------------------------
  -- Pane navigation (same on every OS)
  ----------------------------------------------------------------------
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
