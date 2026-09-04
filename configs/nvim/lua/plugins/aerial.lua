-- A code outline window for skimming and quick navigation.
-- https://github.com/stevearc/aerial.nvim
return {
  "stevearc/aerial.nvim",
  -- Lazy-load on specified key mappings.
  -- Since the key mappings are created at plugin load,
  -- which-key.nvim needs descriptions of these keys to provide info before the plugin is loaded.
  keys = {
    { "<leader>ta" },
    { "<leader>oa" },
  },

  opts = {
    -- File size limits.
    disable_max_lines = 100000,
    disable_max_size = 5 * 1024 * 1024, -- 5 MB
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
      Aerial.open({ direction = "float" })
    end, { desc = "Open [a]erial / symbols floating window" })
  end,
}
