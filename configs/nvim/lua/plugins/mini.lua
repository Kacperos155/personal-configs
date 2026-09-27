-- Collection of independent mini modules.
-- https://github.com/nvim-mini/mini.nvim
return {
  {
    -- Remove buffers without changing window layout.
    -- https://github.com/nvim-mini/mini.nvim/blob/main/readmes/mini-bufremove.md
    "nvim-mini/mini.bufremove",
    event = "UIEnter",
    opts = {},

    config = function(_, opts)
      local M = require("mini.bufremove")
      M.setup(opts)

      vim.keymap.set("n", "<A-W>", function()
        M.delete()
      end, { desc = "Remove the current buffer" })
    end,
  },
  {
    -- Automatic highlighting of word under cursor.
    -- https://github.com/nvim-mini/mini.nvim/blob/main/readmes/mini-cursorword.md
    "nvim-mini/mini.cursorword",
    event = "UIEnter",
    opts = {},
  },
  {
    -- Git CLI integration.
    -- https://github.com/nvim-mini/mini.nvim/blob/main/readmes/mini-git.md
    "nvim-mini/mini-git",
    cmd = "Git",
    opts = {},
    config = function(_, opts)
      local Git = require("mini.git")
      Git.setup(opts)
    end,
  },
  {
    -- Automatic character pairs.
    -- https://github.com/nvim-mini/mini.nvim/blob/main/readmes/mini-pairs.md
    "nvim-mini/mini.pairs",
    event = "InsertEnter",
    opts = {},
  },
  {
    -- Interactive picker with support for custom sources.
    -- https://github.com/nvim-mini/mini.nvim/blob/main/readmes/mini-pick.md
    "nvim-mini/mini.pick",
    event = "UIEnter",
    opts = {},

    config = function(_, opts)
      local Pick = require("mini.pick")
      Pick.setup(opts)

      vim.keymap.set("n", "<leader>fb", function()
        Pick.builtin.buffers({ include_current = false })
      end, { desc = "Find [b]uffer" })

      vim.keymap.set("n", "<leader>ff", function()
        Pick.builtin.files()
      end, { desc = "Find [f]iles" })

      vim.keymap.set("n", "<leader>fg", function()
        Pick.builtin.grep_live()
      end, { desc = "Find via live [g]rep" })

      -- Helper for <leader>fs keymaps.
      local function pick_plain_grep(pattern)
        local picker_name = string.format('Grep = "%s"', pattern)

        Pick.builtin.grep(
          { pattern = pattern, method = "plain" },
          { source = { name = picker_name } }
        )
      end

      vim.keymap.set("n", "<leader>fs", function()
        -- Get current <word> under the cursor, see: `:h <cword>`
        pick_plain_grep(vim.fn.expand("<cword>"))
      end, { desc = "Find current [s]election/word" })

      vim.keymap.set("x", "<leader>fs", function()
        -- Get current visual selection.
        local selection_lines = vim.fn.getregion(vim.fn.getpos("v"), vim.fn.getpos("."), {
          type = vim.fn.mode(),
        })

        -- Truncate selection to only the first line.
        -- Ripgrep (and fallbacks) search within individual lines by default.
        pick_plain_grep(selection_lines[1])
      end, { desc = "Find current [s]election" })
    end,
  },
  {
    -- Simple tabline for buffers with fixed order.
    -- https://github.com/nvim-mini/mini.nvim/blob/main/readmes/mini-tabline.md
    "nvim-mini/mini.tabline",
    event = "VimEnter",
    opts = {},

    config = function(_, opts)
      local showtabline = vim.go.showtabline

      local M = require("mini.tabline")
      M.setup(opts)

      -- Restore 'showtabline' setting.
      vim.go.showtabline = showtabline
    end,
  },
}
