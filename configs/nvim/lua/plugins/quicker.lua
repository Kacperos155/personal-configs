-- Improved UI and workflow for quickfix & loclist.
-- https://github.com/stevearc/quicker.nvim
return {
  'stevearc/quicker.nvim',
  ft = "qf",

  ---@module "quicker"
  ---@type quicker.SetupOptions
  opts = {},

  config = function(_, opts)
    local Quicker = require('quicker')
    Quicker.setup(opts)

    vim.keymap.set('n', '<leader>tq', function()
      Quicker.toggle({ focus = false })
    end, {desc = 'Toggle [q]uickfix window'})

    vim.keymap.set('n', '<leader>tl', function()
      Quicker.toggle({ focus = false, loclist = true })
    end, {desc = 'Toggle [l]oclist window'})
  end,
}
