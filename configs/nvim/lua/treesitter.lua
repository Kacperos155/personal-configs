local M = {}

M.parsers = {
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
    'yaml',
}

function M.setup()
    -- Query each Treesitter parser for supported filetypes.
    local filetypes = {}
    for _, parser in pairs(M.parsers) do
        local parser_filetypes = vim.treesitter.language.get_filetypes(parser)

        for _, supported_filetype in pairs(parser_filetypes) do
            table.insert(filetypes, supported_filetype)
        end
    end

    -- Start Treesitter only when the filetype is supported (i.e. when parser is available).
    vim.api.nvim_create_autocmd('FileType', {
        pattern = filetypes,
        callback = function()
            vim.treesitter.start()
        end,
    })
end

return M
