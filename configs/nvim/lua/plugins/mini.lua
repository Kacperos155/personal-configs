-- Collection of independent mini modules.
-- https://github.com/nvim-mini/mini.nvim
return {
  {
    -- Simple tabline for buffers with fixed order.
    -- https://github.com/nvim-mini/mini.nvim/blob/main/readmes/mini-tabline.md
    'nvim-mini/mini.tabline',
    opts = {},

    config = function(_, opts)
      local showtabline = vim.go.showtabline

      local M = require('mini.tabline')
      M.setup(opts)

      -- Restore 'showtabline' setting.
      vim.go.showtabline = showtabline
    end,
  },
  {
    -- Automatic highlighting of word under cursor.
    -- https://github.com/nvim-mini/mini.nvim/blob/main/readmes/mini-cursorword.md
    'nvim-mini/mini.cursorword',
    opts = {},
  },
  {
    -- Remove buffers without changing window layout.
    -- https://github.com/nvim-mini/mini.nvim/blob/main/readmes/mini-bufremove.md
    'nvim-mini/mini.bufremove',
    opts = {},

    config = function(_, opts)
      local M = require('mini.bufremove')
      M.setup(opts)

      vim.keymap.set('n', '<A-W>', function()
        M.delete()
      end, { desc = 'Remove the current buffer' })
    end,
  },
}
