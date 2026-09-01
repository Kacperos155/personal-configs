-- Lightweight yet powerful formatter plugin for Neovim.
-- https://github.com/stevearc/conform.nvim
return {
  "stevearc/conform.nvim",
  event = "VeryLazy",

  init = function()
    -- Delegate native formatting to Conform.
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,

  opts = {
    -- The following formatters can be installed via mason.nvim.
    formatters_by_ft = {
      -- stylua: ignore start
      cpp     = { "clang-format", timeout_ms = 3000 },
      html    = { "djlint", timeout_ms = 3000 },
      json    = { "jq" },
      lua     = { "stylua" },
      python  = { "ruff_format" },
      -- stylua: ignore end
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
