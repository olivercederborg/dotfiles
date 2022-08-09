local wezterm = require("wezterm")
local act = wezterm.action

return {
  leader = { key = "Space", mods = "SHIFT" },

  keys = {
    {
      key = "w",
      mods = "CMD",
      action = act.CloseCurrentPane({ confirm = true }),
    },

    -- activate resize mode
    {
      key = "r",
      mods = "LEADER",
      action = act.ActivateKeyTable({
        name = "resize_pane",
        one_shot = false,
      }),
    },

    -- focus panes
    {
      key = "k",
      mods = "LEADER",
      action = act.ActivatePaneDirection("Left"),
    },
    {
      key = "i",
      mods = "LEADER",
      action = act.ActivatePaneDirection("Right"),
    },
    {
      key = "e",
      mods = "LEADER",
      action = act.ActivatePaneDirection("Up"),
    },
    {
      key = "n",
      mods = "LEADER",
      action = act.ActivatePaneDirection("Down"),
    },

    -- add new panes
    {
      key = "v",
      mods = "LEADER",
      action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
    },
    {
      key = "h",
      mods = "LEADER",
      action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
    },
  },

  key_tables = {
    resize_pane = {
      { key = "LeftArrow", action = act.AdjustPaneSize({ "Left", 1 }) },
      { key = "k", action = act.AdjustPaneSize({ "Left", 1 }) },

      { key = "RightArrow", action = act.AdjustPaneSize({ "Right", 1 }) },
      { key = "i", action = act.AdjustPaneSize({ "Right", 1 }) },

      { key = "UpArrow", action = act.AdjustPaneSize({ "Up", 1 }) },
      { key = "e", action = act.AdjustPaneSize({ "Up", 1 }) },

      { key = "DownArrow", action = act.AdjustPaneSize({ "Down", 1 }) },
      { key = "n", action = act.AdjustPaneSize({ "Down", 1 }) },

      { key = "Escape", action = "PopKeyTable" },
    },
  },
}
