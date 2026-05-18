-- Set <space> as the leader key
-- See `:help mapleader`
-- NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Clear highlights on search when pressing <Esc> in normal mode.
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Use double <Esc> to exit terminal mode.
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>')

-- Save file on <Ctrl-S>.
vim.keymap.set({ 'n', 'v', 'i' }, '<C-S>', '<cmd>write<CR>',    { desc = 'Save file' })

-- Move whole lines.
vim.keymap.set({ 'n', 'x' }, '<A-Up>',    ':move -2<CR>',       { desc = 'Move Line Up' })
vim.keymap.set({ 'n', 'x' }, '<A-Down>',  ':move +1<CR>',       { desc = 'Move Line Down' })
vim.keymap.set('i',          '<A-Up>',    '<C-o>:move -2<CR>',  { desc = 'Move Line Up' })
vim.keymap.set('i',          '<A-Down>',  '<C-o>:move +1<CR>',  { desc = 'Move Line Down' })

-- Do not return to normal mode after changing indentation.
vim.keymap.set('v', '<', '<gv', {})
vim.keymap.set('v', '>', '>gv', {})

-- Change active buffer (file view).
vim.keymap.set('n', '<C-PageUp>',   '<cmd>bnext<CR>',       { desc = 'Go to next buffer' })
vim.keymap.set('n', '<C-PageDown>', '<cmd>bprevious<CR>',   { desc = 'Go to previous buffer' })
-- Remap tab navigation keys to <ALT-PageUp/Down>.
vim.keymap.set('n', '<A-PageUp>',   '<cmd>tabnext<CR>',     { desc = 'Go to next tab page' })
vim.keymap.set('n', '<A-PageDown>', '<cmd>tabprevious<CR>', { desc = 'Go to previous tab page' })
