-- Highlight when yanking (copying) text.
-- See `:h vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Auto-open quickfix/loclist window when grep returns at least one result.
vim.api.nvim_create_autocmd('QuickFixCmdPost', {
  desc = 'Open quickfix window after grep with non-zero results',
  pattern = { 'grep', 'grepadd', 'vimgrep', 'vimgrepadd' },
  command = 'cwindow',
})
vim.api.nvim_create_autocmd('QuickFixCmdPost', {
  desc = 'Open loclist window after lgrep with non-zero results',
  pattern = { 'lgrep', 'lgrepadd', 'lvimgrep', 'lvimgrepadd' },
  command = 'lwindow',
})
