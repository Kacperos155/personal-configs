-- Small standalone plugins.
return {
  {
    -- Detect tabstop and shiftwidth automatically.
    -- https://github.com/tpope/vim-sleuth
    'tpope/vim-sleuth',
  },
  {
    -- Hints keybinds.
    -- https://github.com/folke/which-key.nvim
    'folke/which-key.nvim',
    opts = {
      delay = 3000,
    },
  },
  {
    -- Autoclose parentheses, brackets, quotes, etc.
    -- https://github.com/windwp/nvim-autopairs
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
    opts = {},
  },
  {
    -- Highlight todo, notes, etc in comments.
    -- https://github.com/folke/todo-comments.nvim
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },
  {
    -- High-performance color highlighter.
    -- https://github.com/norcalli/nvim-colorizer.lua
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end,
  },
}

