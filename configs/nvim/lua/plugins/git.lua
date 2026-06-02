-- Git integration focused on NeoVim buffers.
-- https://github.com/lewis6991/gitsigns.nvim
return {
  'lewis6991/gitsigns.nvim',
  opts = {},

  config = function(_, opts)
    local Git = require('gitsigns')
    Git.setup(opts)

    vim.keymap.set('n', '<leader>ob', function()
      Git.blame({ignore_whitespace = true})
    end, {desc = 'Open git-[b]lame window'})
  end,
}
