local ts = require("treesitter")

-- Archived plugin but still useful for installing parsers.
-- https://github.com/nvim-treesitter/nvim-treesitter
return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    branch = 'main',

    config = function()
        require('nvim-treesitter').install(ts.parsers)
    end
}
