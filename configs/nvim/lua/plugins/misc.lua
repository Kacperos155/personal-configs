-- Small standalone plugins.
return {
  {
    -- Detect tabstop and shiftwidth automatically.
    -- https://github.com/NMAC427/guess-indent.nvim
    "NMAC427/guess-indent.nvim",
    -- Do not lazy-load as this plugin sets up autocommands for `BufReadPost` and `BufNewFile` events.
    lazy = false,
    opts = {},
  },
  {
    -- Highlight todo, notes, etc in comments.
    -- https://github.com/folke/todo-comments.nvim
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = { signs = false },
  },
  {
    -- High-performance color highlighter.
    -- https://github.com/catgoose/nvim-colorizer.lua
    "catgoose/nvim-colorizer.lua",
    cmd = { "ColorizerAttachToBuffer", "ColorizerToggle" },
    ft = { "css", "html" },

    opts = {
      options = {
        parsers = {
          names = { enable = false },
        },
      },
    },
  },
}
