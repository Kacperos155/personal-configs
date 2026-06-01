-- Set <space> as the leader key
-- See `:help mapleader`
-- NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Clear highlights on search when pressing <Esc> in normal mode.
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Use double <Esc> to exit terminal mode.
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>')

-- Interactions with the system clipboard.
vim.keymap.set({ 'n', 'x' }, "<leader>y",  [["+y]],  { desc = "Yank to the system clipboard" })
vim.keymap.set({ 'n',     }, "<leader>Y",  [["+y$]], { desc = "Yank line from this point to the system clipboard" })
vim.keymap.set({ 'n', 'x' }, "<leader>p",  [["+p]],  { desc = "Paste from the system clipboard (after cursor)" })
vim.keymap.set({ 'n', 'x' }, "<leader>P",  [["+P]],  { desc = "Paste from the system clipboard (before cursor)" })

-- Save file on <Ctrl-S>.
vim.keymap.set({ 'n', 'v', 'i' }, '<C-S>', '<cmd>write<CR>',    { desc = 'Save file' })

-- Move whole lines.
vim.keymap.set({ 'n', 'x' }, '<A-Up>',      ':move -2<CR>',       { desc = 'Move line up' })
vim.keymap.set({ 'n', 'x' }, '<A-Down>',    ':move +1<CR>',       { desc = 'Move line down' })
vim.keymap.set({ 'i',     }, '<A-Up>',      '<C-o>:move -2<CR>',  { desc = 'Move line up' })
vim.keymap.set({ 'i',     }, '<A-Down>',    '<C-o>:move +1<CR>',  { desc = 'Move line down' })
vim.keymap.set({ 'n', 'x' }, '<C-A-Up>',    ':move -2<CR>',       { desc = 'Move line up' })
vim.keymap.set({ 'n', 'x' }, '<C-A-Down>',  ':move +1<CR>',       { desc = 'Move line down' })
vim.keymap.set({ 'i',     }, '<C-A-Up>',    '<C-o>:move -2<CR>',  { desc = 'Move line up' })
vim.keymap.set({ 'i',     }, '<C-A-Down>',  '<C-o>:move +1<CR>',  { desc = 'Move line down' })

-- Do not return to normal mode after changing indentation.
vim.keymap.set('v', '<', '<gv', {})
vim.keymap.set('v', '>', '>gv', {})

-- Change active buffer (file view).
vim.keymap.set('n', '<C-PageUp>',   '<cmd>bnext<CR>',       { desc = 'Go to next buffer' })
vim.keymap.set('n', '<C-PageDown>', '<cmd>bprevious<CR>',   { desc = 'Go to previous buffer' })
-- Remap tab navigation keys to <ALT-PageUp/Down>.
vim.keymap.set('n', '<A-PageUp>',   '<cmd>tabnext<CR>',     { desc = 'Go to next tab page' })
vim.keymap.set('n', '<A-PageDown>', '<cmd>tabprevious<CR>', { desc = 'Go to previous tab page' })
