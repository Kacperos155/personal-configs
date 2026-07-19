-- Hints keybinds.
-- https://github.com/folke/which-key.nvim
return {
  "folke/which-key.nvim",
  opts = {
    -- Delay before showing the popup. Can be a number or a function that returns a number.
    ---@type number | fun(ctx: { keys: string, mode: string, plugin?: string }):number
    delay = function(ctx)
      return ctx.plugin and 0 or 1000 -- 0s for plugins (marks/registers/spelling) and 1s otherwise
    end,

    --- Custom mapping groups.
    ---@type wk.Spec
    spec = {
      -- stylua: ignore start
      { "<leader>o", group = "[O]pen", icon = { icon = "󱥫 ", color = "blue" } },
        { "<leader>ot", icon = { icon = " ", color = "red" } },
        { "<leader>oy", icon = { icon = "󰇥 ", color = "yellow" } },
      { "<leader>t", group = "[T]oggle", icon = { icon = " ", color = "yellow" } },
      { "<leader>h", group = "Git [H]unks", mode = { "n", "v" } },
      -- Main / Without group:
        { "<leader>f", mode = { "n", "x" }, icon = { icon = " ",  color = "cyan"   } },
        { "<leader>p", mode = { "n", "x" }, icon = { icon = "󰆒 󰁍", color = "orange" } },
        { "<leader>P", mode = { "n", "x" }, icon = { icon = "󰆒 󰁍", color = "orange" } },
        { "<leader>y", mode = { "n", "x" }, icon = { icon = "󰆒 󰁔", color = "cyan"   } },
        { "<leader>Y",                      icon = { icon = "󰆒 󰁔", color = "cyan"   } },
      -- stylua: ignore end
    },
  },
}
