-- Small standalone plugins.
return {
  {
    -- Detect tabstop and shiftwidth automatically.
    -- https://github.com/NMAC427/guess-indent.nvim
    'NMAC427/guess-indent.nvim',
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
    -- https://github.com/catgoose/nvim-colorizer.lua
    'catgoose/nvim-colorizer.lua',
    event = "BufReadPre",
    opts = {},
  },
  {
    -- Improved UI and workflow for quickfix & loclist
    -- https://github.com/stevearc/quicker.nvim
    'stevearc/quicker.nvim',
    ft = "qf",
    ---@module "quicker"
    ---@type quicker.SetupOptions
    opts = {},
  },
}
