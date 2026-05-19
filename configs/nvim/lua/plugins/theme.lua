-- https://catppuccin.com/ports/
-- https://github.com/catppuccin/nvim
return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,

  -- It's recommended to set this to a high number for colorschemes.
  priority = 1000,

  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme "catppuccin-mocha"
  end,

  opts = {},
}
