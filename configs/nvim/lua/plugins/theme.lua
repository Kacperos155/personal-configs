-- https://catppuccin.com/ports/
-- https://github.com/catppuccin/nvim
return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,

  -- It's recommended to set this to a high number for colorschemes.
  priority = 1000,

  opts = {
    highlight_overrides = {
      all = function(colors)
        return {
          CursorLineNr = { fg = colors.green },
        }
      end,
    },
  },

  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme("catppuccin-mocha")
  end,
}
