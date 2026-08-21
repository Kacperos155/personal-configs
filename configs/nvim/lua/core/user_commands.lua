-- Search and remove all trailing whitespaces.
-- Inspired by: https://github.com/nvim-mini/mini.nvim/blob/main/readmes/mini-trailspace.md
vim.api.nvim_create_user_command("TrimTrailingWhitespaces", function()
  local view = vim.fn.winsaveview()
  vim.cmd([[keeppatterns %s/\s\+$//e]])
  vim.fn.winrestview(view)
end, {
  desc = "Remove trailing whitespaces from the current buffer",
})

-- Compare range against register.
-- :[range]DiffAgainstReg [register]
vim.api.nvim_create_user_command("DiffAgainstReg", function(opts)
  local source_buf = vim.api.nvim_get_current_buf()
  local source_buf_name = vim.api.nvim_buf_get_name(source_buf)
  local filetype = vim.bo[source_buf].filetype

  -- Use provided register or default to unnamed register.
  local reg = opts.reg ~= "" and opts.reg or '"'

  local function setup_diff_buffer(lines, buf_name)
    local buf = vim.api.nvim_get_current_buf()

    vim.bo[buf].bufhidden = "wipe"
    vim.bo[buf].buflisted = false
    vim.bo[buf].buftype = "nofile"
    vim.bo[buf].swapfile = false

    vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
    vim.bo[buf].filetype = filetype
    vim.bo[buf].modifiable = false

    local full_buf_name = ("diff://%s//:%d://%s"):format(buf_name, buf, source_buf_name)
    vim.api.nvim_buf_set_name(buf, full_buf_name)

    -- Close whole diff tab instead of just the current window.
    vim.keymap.set("n", "<C-W>q", "<cmd>tabclose<CR>", { buffer = buf, desc = "Close whole diff tab" })
    vim.keymap.set("n", "<C-W><C-q>", "<cmd>tabclose<CR>", { buffer = buf, desc = "Close whole diff tab" })
  end

  -- Left: register
  vim.cmd("tabnew")
  local reg_win = vim.api.nvim_get_current_win()

  local reg_lines = vim.fn.getreg(reg, 1, true)

  setup_diff_buffer(
    reg_lines,
    ("register-%s"):format(reg)
  )

  -- Right: range
  vim.cmd("rightbelow vnew")
  local range_win = vim.api.nvim_get_current_win()

  local range_lines = vim.api.nvim_buf_get_lines(
    source_buf,
    opts.line1 - 1,
    opts.line2,
    false
  )

  setup_diff_buffer(
    range_lines,
    "range"
  )

  -- Enable diff mode in both windows.
  vim.api.nvim_set_current_win(reg_win)
  vim.wo[reg_win].winfixbuf = true
  vim.cmd("diffthis")

  vim.api.nvim_set_current_win(range_win)
  vim.wo[range_win].winfixbuf = true
  vim.cmd("diffthis")
end, {
  range = true,
  register = true,
  desc = "Diff range against register",
})
