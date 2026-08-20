-- A code outline window for skimming and quick navigation.
-- https://github.com/stevearc/aerial.nvim
return {
  "stevearc/aerial.nvim",
  event = "VeryLazy",

  opts = {
    -- A list of symbol types to display.
    filter_kind = {
      "Class",
      "Constructor",
      "Enum",
      "Function",
      "Interface",
      "Method",
      "Module",
      "Namespace",
      "Struct",
    },
    nav = {
      keymaps = {
        ["<Left>"] = "actions.left",
        ["<Right>"] = "actions.right",
      },
    },
  },

  config = function(_, opts)
    local Aerial = require("aerial")
    Aerial.setup(opts)

    vim.keymap.set("n", "<leader>ta", function()
      Aerial.toggle({ focus = false })
    end, { desc = "Toggle [a]erial / symbols window" })

    vim.keymap.set("n", "<leader>oa", function()
      Aerial.nav_toggle()
    end, { desc = "Open [a]erial / symbols navigation window" })
  end,
}
