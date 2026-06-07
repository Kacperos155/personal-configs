-- Small standalone plugins.
return {
  {
    -- Detect tabstop and shiftwidth automatically.
    -- https://github.com/NMAC427/guess-indent.nvim
    'NMAC427/guess-indent.nvim',
    opts = {},
  },
  {
    -- Hints keybinds.
    -- https://github.com/folke/which-key.nvim
    'folke/which-key.nvim',
    opts = {
      -- Delay before showing the popup. Can be a number or a function that returns a number.
      ---@type number | fun(ctx: { keys: string, mode: string, plugin?: string }):number
      delay = function(ctx)
          return ctx.plugin and 0 or 1000 -- 0s for plugins (marks/registers/spelling) and 1s otherwise
      end,

      --- Custom mapping groups.
      ---@type wk.Spec
      spec = {
        { '<leader>o', group = '[O]pen' },
        { '<leader>t', group = '[T]oggle' },
        { '<leader>h', group = 'Git [H]unks', mode = { 'n', 'v' } },
      },
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
    event = {"BufReadPre", "InsertEnter"},
    opts = {
      options = {
        parsers = {
          names = { enable = false },
        },
      },
    },
  },
}
