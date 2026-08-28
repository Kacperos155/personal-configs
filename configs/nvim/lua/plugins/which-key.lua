-- Hints keybinds.
-- https://github.com/folke/which-key.nvim
return {
  "folke/which-key.nvim",
  event = "VeryLazy",

  opts = {
    -- Delay before showing the popup. Can be a number or a function that returns a number.
    ---@type number | fun(ctx: { keys: string, mode: string, plugin?: string }):number
    delay = function(ctx)
      return ctx.plugin and 0 or 1000 -- 0s for plugins (marks/registers/spelling) and 1s otherwise
    end,

    --- Custom mapping groups.
    --- Defaults: https://raw.githubusercontent.com/folke/which-key.nvim/refs/heads/main/lua/which-key/icons.lua
    ---@type wk.Spec
    spec = {
      -- stylua: ignore start
      { "<leader>b", group = "[B]uffer", icon = { icon = "󰈔", color = "cyan" } },
        { "<leader>br", icon = { icon = "󰈔 󰑐", color = "green"  } }, -- Reload
        { "<leader>by", icon = { icon = "󰆒 󰁍", color = "cyan"   } }, -- Yank
      { "<leader>f", group = "[F]ind", icon = { icon = " ", color = "green" }, mode = { "n", "x" } },
        { "<leader>ff", icon = { icon = "󰱼 ", color = "green" }, desc = "Find [f]iles" },
        { "<leader>fg", icon = { icon = "󱎸 ", color = "green" }, desc = "Find via live [g]rep" },
        { "<leader>fs", icon = { icon = "󱎸 ", color = "green" }, desc = "Find current [s]election/word", mode = { "n", "x" } },
      { "<leader>o", group = "[O]pen", icon = { icon = "󱥫 ", color = "blue" } },
        { "<leader>ot", icon = { icon = " ", color = "red"    } }, -- Terminal
        { "<leader>oy", icon = { icon = "󰇥 ", color = "yellow" } }, -- Yazi
      { "<leader>t", group = "[T]oggle", icon = { icon = " ", color = "yellow" } },
      { "<leader>h", group = "Git [H]unks", mode = { "n", "v" } },
      -- Main / Without group:
        { "<leader>F", icon = { icon = " ",  color = "cyan"   }, mode = { "n", "x" } }, -- Format
        { "<leader>p", icon = { icon = "󰆒 󰁔", color = "orange" }, mode = { "n", "x" } }, -- Paste
        { "<leader>P", icon = { icon = "󰆒 󰁔", color = "orange" }, mode = { "n", "x" } }, -- Paste
        { "<leader>y", icon = { icon = "󰆒 󰁍", color = "cyan"   }, mode = { "n", "x" } }, -- Yank
        { "<leader>Y", icon = { icon = "󰆒 󰁍", color = "cyan"   }                      }, -- Yank
      -- stylua: ignore end
    },
  },
}
