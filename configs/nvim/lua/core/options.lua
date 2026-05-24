-- [[ Setting options ]]
-- See `:help vim.o`
--  For more options, you can see `:help option-list`
-- To see documentation for an option, you can use `:h 'optionname'`, for example `:h 'number'`
-- (Note the single quotes)

-- [Core behavior]
-- Enable mouse in all modes.
vim.o.mouse = 'a'
-- If performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s).
vim.o.confirm = true
-- Save undo operations between sessions.
vim.o.undofile = true
-- Sync clipboard between OS and Neovim.
-- Schedule the setting after `UIEnter` because it can increase startup-time.
vim.api.nvim_create_autocmd('UIEnter', {
  callback = function()
    vim.o.clipboard = 'unnamedplus'
  end,
  once = true,
})

-- [Responsiveness]
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- [Editor UI]
-- Show line numbers in a column.
vim.o.number = true
-- Show line numbers relative to where the cursor is, see `:h number_relativenumber`.
vim.o.relativenumber = true
-- Highlight the line where the cursor is on.
vim.o.cursorline = true
-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10
-- Always show the sign column. Prevents text from shifting when signs appear.
vim.o.signcolumn = 'yes'
-- Force enable 24-bit RGB colors
vim.o.termguicolors = true

-- [Windows]
-- Better position for new (split) windows.
vim.o.splitright = true
vim.o.splitbelow = true

-- [Popup menus]
vim.o.pumblend = 3
vim.o.pumborder = 'single'
vim.o.pumheight = 10

-- [Whitespaces]
-- Sets how neovim will display certain whitespace characters in the editor.
vim.o.list = true
vim.opt.listchars = {
  tab = '» ',
  trail = '·',
  nbsp = '␣',
}
-- Display <TAB> as 4 spaces.
vim.o.tabstop = 4
-- Number of spaces for each indentation level.
vim.o.shiftwidth = 4
vim.o.softtabstop = -1
-- Replace <TAB> with spaces
vim.o.expandtab = true

-- [Text wrapping]
-- Display long lines as a single line instead of visually wrapping them.
vim.o.wrap = false
-- When wrapping is enabled, visually indent wrapped line segments.
vim.o.breakindent = true

-- [Text search]
-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- [Folds]
-- Open all folds by default.
vim.o.foldlevelstart = 99

-- [Autocompletion]
vim.o.autocomplete = true
vim.o.completeopt = 'menuone,noselect'
