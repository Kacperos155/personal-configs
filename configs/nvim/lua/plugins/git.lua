-- Git integration focused on NeoVim buffers.
-- https://github.com/lewis6991/gitsigns.nvim
return {
  "lewis6991/gitsigns.nvim",
  event = "VeryLazy",

  opts = {},

  config = function(_, opts)
    local Git = require("gitsigns")
    Git.setup(opts)

    -- Blame
    vim.keymap.set("n", "<leader>ob", function()
      Git.blame({ ignore_whitespace = true })
    end, { desc = "Open git-[b]lame window" })

    vim.keymap.set("n", "<leader>hb", function()
      Git.blame_line({ ignore_whitespace = true })
    end, { desc = "[B]lame this line" })

    -- Stage changes
    vim.keymap.set("n", "<leader>hS", Git.stage_buffer, { desc = "[S]tage whole buffer" })
    vim.keymap.set("n", "<leader>hs", Git.stage_hunk,   { desc = "[S]tage/unstage hunk at the cursor" })
    vim.keymap.set("v", "<leader>hs", function()
      Git.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
    end, { desc = "[S]tage/unstage selected lines" })

    -- Reset changes
    vim.keymap.set("n", "<leader>hR", Git.reset_buffer, { desc = "[R]eset whole buffer" })
    vim.keymap.set("n", "<leader>hr", Git.reset_hunk,   { desc = "[R]eset hunk at the cursor" })
    vim.keymap.set("v", "<leader>hr", function()
      Git.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
    end, { desc = "[R]eset selected lines" })

    -- List changes
    vim.keymap.set("n", "<leader>hL", function()
      Git.setqflist("all")
    end, { desc = "[L]ist changes in all files (quickfix)" })
    vim.keymap.set("n", "<leader>hl", Git.setloclist, { desc = "[L]ist changes in this file (loclist)" })

    -- Preview changes
    vim.keymap.set("n", "<leader>hp", Git.preview_hunk, { desc = "[P]review hunk" })

    -- Navigation
    local map_hunk_navigation = function(keymap, direction, target, description)
      vim.keymap.set({ "n", "v" }, keymap, function()
        if vim.wo.diff then
          local diff_keymap = direction == "next" and "]c" or "[c"
          vim.cmd.normal({ vim.v.count1 .. diff_keymap, bang = true })
        else
          Git.nav_hunk(direction, { target = target })
        end
      end, { desc = description })
    end

    map_hunk_navigation("]c", "next", "all", "Next change")
    map_hunk_navigation("[c", "prev", "all", "Previous change")
    map_hunk_navigation("]C", "next", "unstaged", "Next unstaged change")
    map_hunk_navigation("[C", "prev", "unstaged", "Previous unstaged change")
  end,
}
