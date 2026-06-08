-- Search and remove all trailing whitespaces.
-- Inspired by: https://github.com/nvim-mini/mini.nvim/blob/main/readmes/mini-trailspace.md
vim.api.nvim_create_user_command("TrimTrailingWhitespaces", function()
  local view = vim.fn.winsaveview()
  vim.cmd([[keeppatterns %s/\s\+$//e]])
  vim.fn.winrestview(view)
end, {
  desc = "Remove trailing whitespaces from the current buffer",
})
