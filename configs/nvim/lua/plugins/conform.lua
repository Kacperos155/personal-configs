-- Lightweight yet powerful formatter plugin for Neovim.
-- https://github.com/stevearc/conform.nvim
return {
  "stevearc/conform.nvim",
  event = "VeryLazy",

  opts = {
    formatters_by_ft = {
      cpp     = { "clang-format" },
      json    = { "jq" },
      lua     = { "stylua" },
      python  = { "ruff_format" },
    },
  },

  config = function(_, opts)
    local Conform = require("conform")
    Conform.setup(opts)

    vim.keymap.set("n", "<leader>F", function()
      Conform.format()
    end, { desc = "[F]ormat whole buffer" })

    vim.keymap.set("x", "<leader>F", function()
      Conform.format()
    end, { desc = "[F]ormat selected text" })
  end,
}
