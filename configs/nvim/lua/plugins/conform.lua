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
      cpp       = { "clang-format", timeout_ms = 3000 },
      gitcommit = { "rumdl" },
      html      = { "djlint", timeout_ms = 3000 },
      json      = { "jq" },
      lua       = { "stylua" },
      markdown  = { "rumdl" },
      python    = { "ruff_format" },
      -- stylua: ignore end
    },

    formatters = {
      rumdl = {
        inherit = "rumdl",
        append_args = {
          "--config",
          "MD060.enabled = true", -- https://rumdl.dev/md060/ | Enable table formatting.
          "--config",
          "MD060.style = 'aligned'", -- https://rumdl.dev/md060/ | Table columns are always padded.
          "--config",
          "MD022.lines-below = 0", -- https://rumdl.dev/md022/ | Do not add blank lines below headings.
        },
      },
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
