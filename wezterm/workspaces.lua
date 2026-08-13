-- ~/.config/wezterm/workspaces.lua
local wezterm = require("wezterm")
local act = wezterm.action

local M = {}

-- We export a function that takes your main keys table and injects the mappings
function M.apply_to_keys(keys_table)
  table.insert(keys_table, {
    key = "w",
    mods = "LEADER",
    action = act.ShowLauncherArgs { flags = "FUZZY|WORKSPACES" }
  })

  table.insert(keys_table, {
    key = "W",
    mods = "LEADER",
    action = act.PromptInputLine {
      description = "Enter name for new workspace:",
      action = wezterm.action_callback(function(window, pane, line)
        if line and line ~= "" then
          window:perform_action(act.SwitchToWorkspace { name = line }, pane)
        end
      end),
    },
  })
end

return M
