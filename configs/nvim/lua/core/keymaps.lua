-- Set <space> as the leader key
-- See `:help mapleader`
-- NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Clear highlights on search when pressing <Esc> in normal mode.
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Use double <Esc> to exit terminal mode.
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>")

-- Interactions with the system clipboard.
vim.keymap.set({ "n", "x" }, "<leader>y", [["+y]],  { desc = "Yank to the system clipboard" })
vim.keymap.set({ "n"      }, "<leader>Y", [["+y$]], { desc = "Yank line from this point to the system clipboard" })
vim.keymap.set({ "n", "x" }, "<leader>p", [["+p]],  { desc = "Paste from the system clipboard (after cursor)" })
vim.keymap.set({ "n", "x" }, "<leader>P", [["+P]],  { desc = "Paste from the system clipboard (before cursor)" })

-- Save file on <Ctrl-S>.
vim.keymap.set({ "n", "v", "i" }, "<C-S>", "<cmd>write<CR>", { desc = "Save file" })

-- Move whole lines with <ALT> + <Up/Down>
vim.keymap.set({ "n", "i" }, "<A-Up>",     "<cmd>move -2<CR>",  { desc = "Move line up" })
vim.keymap.set({ "n", "i" }, "<A-Down>",   "<cmd>move +1<CR>",  { desc = "Move line down" })
vim.keymap.set("x",          "<A-Up>",     ":move '<-2<CR>gv",  { desc = "Move line up" })
vim.keymap.set("x",          "<A-Down>",   ":move '>+1<CR>gv",  { desc = "Move line down" })
-- Move whole lines with <CTRL> + <ALT> + <Up/Down>
vim.keymap.set({ "n", "i" }, "<C-A-Up>",   "<cmd>move -2<CR>",  { desc = "Move line up" })
vim.keymap.set({ "n", "i" }, "<C-A-Down>", "<cmd>move +1<CR>",  { desc = "Move line down" })
vim.keymap.set("x",          "<C-A-Up>",   ":move '<-2<CR>gv",  { desc = "Move line up" })
vim.keymap.set("x",          "<C-A-Down>", ":move '>+1<CR>gv",  { desc = "Move line down" })

-- Do not return to normal mode after changing indentation.
vim.keymap.set("v", "<", "<gv", {})
vim.keymap.set("v", ">", ">gv", {})

-- Change active buffer (file view).
vim.keymap.set("n", "<C-PageUp>",   "<cmd>bnext<CR>",       { desc = "Go to next buffer" })
vim.keymap.set("n", "<C-PageDown>", "<cmd>bprevious<CR>",   { desc = "Go to previous buffer" })
-- Remap tab navigation keys to <ALT-PageUp/Down>.
vim.keymap.set("n", "<A-PageUp>",   "<cmd>tabnext<CR>",     { desc = "Go to next tab page" })
vim.keymap.set("n", "<A-PageDown>", "<cmd>tabprevious<CR>", { desc = "Go to previous tab page" })

-- Toggle <something>.
vim.keymap.set("n", "<leader>tw", "<cmd>set wrap!<CR>",   { desc = "Toggle line [w]rapping" })
vim.keymap.set("n", "<leader>ts", "<cmd>set spell!<CR>",  { desc = "Toggle [s]pell checking" })
-- Toggle tabline.
vim.keymap.set("n", "<leader>tt", function()
  if vim.go.showtabline ~= 0 then
    vim.go.showtabline = 0 -- Disable tabline.
  else
    vim.go.showtabline = 2 -- Always show tabline.
  end
end, { desc = "Toggle [t]abline" })
-- Toggle diff mode.
vim.keymap.set("n", "<leader>td", function()
  if vim.wo.diff == false then
    vim.cmd.diffthis()
  else
    vim.cmd.diffoff()
  end
end, { desc = "Toggle [d]iff mode" })

-- Open <something>.
vim.keymap.set("n", "<leader>oy", function()
  local yazi = require("yazi")
  yazi.pick_files()
end, { desc = "Open files via [Y]azi" })
