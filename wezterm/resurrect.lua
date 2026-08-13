-- ~/.config/wezterm/resurrect.lua
local wezterm = require("wezterm")
local resurrect = wezterm.plugin.require("https://github.com/MLFlexer/resurrect.wezterm")

local M = {}

-- Enable periodic auto-save every 15 minutes (optional, comment out if unwanted)
resurrect.state_manager.periodic_save({ interval_seconds = 900 })

-- Inject keybindings into main keys table
function M.apply_to_keys(keys_table)
  -- LEADER + s: Save current workspace state
  table.insert(keys_table, {
    key = "s",
    mods = "LEADER",
    action = wezterm.action_callback(function(win, pane)
      resurrect.state_manager.save_state(resurrect.workspace_state.get_workspace_state())
      wezterm.log_info("Workspace state saved")
      --win:toast_notification("WezTerm Resurrect", "Workspace state saved!", nil, 3000)
      win:set_right_status(wezterm.format({
        { Foreground = { Color = "#a6e3a1" } },
        { Text = " Saved! " },
      }))
    end),
  })

  -- LEADER + R: Load workspace/window state via fuzzy finder
  table.insert(keys_table, {
    key = "l",
    mods = "LEADER",
    action = wezterm.action_callback(function(win, pane)
      resurrect.fuzzy_loader.fuzzy_load(win, pane, function(id, label)
        local type = string.match(id, "^([^/]+)")
        id = string.match(id, "([^/]+)$")
        id = string.match(id, "(.+)%..+$")

        local opts = {
          relative = true,
          restore_text = true,
          on_pane_restore = resurrect.tab_state.default_on_pane_restore,
        }

        if type == "workspace" then
          local state = resurrect.state_manager.load_state(id, "workspace")
          resurrect.workspace_state.restore_workspace(state, opts)
        elseif type == "window" then
          local state = resurrect.state_manager.load_state(id, "window")
          resurrect.window_state.restore_window(pane:window(), state, opts)
        end
      end)
    end),
  })

  -- LEADER + D: Delete a saved state via fuzzy finder
  table.insert(keys_table, {
    key = "d",
    mods = "LEADER",
    action = wezterm.action_callback(function(win, pane)
      resurrect.fuzzy_loader.fuzzy_load(win, pane, function(id)
        resurrect.state_manager.delete_state(id)
      end, {
        title = "Delete State",
        description = "Select State to Delete and press Enter = accept, Esc = cancel",
        fuzzy_description = "Search State to Delete: ",
        is_fuzzy = true,
      })
    end),
  })
end

return M
