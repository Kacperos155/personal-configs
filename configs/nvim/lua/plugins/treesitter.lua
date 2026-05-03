-- Highlight, edit, and navigate code
-- https://github.com/nvim-treesitter/nvim-treesitter
return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    branch = 'main',

    -- [[ Configure Treesitter ]] See `:help nvim-treesitter-intro`
    config = function()
        -- ensure basic parser are installed
        local parsers = {
            'cmake',
            'cpp',
            'diff',
            'html',
            'lua',
            'luadoc',
            'markdown',
            'markdown_inline',
            'powershell',
            'python',
            'toml',
            'vim',
            'vimdoc',
            'yaml'
        }
        require('nvim-treesitter').install(parsers)
    end
}

