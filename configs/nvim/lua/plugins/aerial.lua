-- A code outline window for skimming and quick navigation.
-- https://github.com/stevearc/aerial.nvim
return {
  'stevearc/aerial.nvim',
  opts = {},

  config = function(_, opts)
    local Aerial = require('aerial')
    Aerial.setup(opts)

    vim.keymap.set('n', '<leader>ta', function()
      Aerial.toggle({focus = false})
    end, {desc = 'Toggle [a]erial / symbols window'})
  end,
}
