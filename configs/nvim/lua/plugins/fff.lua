-- Fast File Finder with live grep and background file watcher.
-- https://github.com/dmtrKovalenko/fff#fffnvim
return {
  "dmtrKovalenko/fff.nvim",
  lazy = false, -- The plugin has internal lazy-loading.

  build = function()
    -- Downloads a prebuilt binary or falls back to cargo build.
    require("fff.download").download_or_build_binary()
  end,

  opts = {
    debug = {
      -- File info panel above preview window.
      enabled = false, -- Toggle with <F2>.
    },
  },

  config = function(_, opts)
    local FFF = require("fff")
    FFF.setup(opts)

    vim.keymap.set("n", "<leader>ff", function()
      FFF.find_files()
    end, { desc = "Find [f]iles" })

    vim.keymap.set("n", "<leader>fg", function()
      FFF.live_grep()
    end, { desc = "Find via live [g]rep" })

    vim.keymap.set({ "n", "x" }, "<leader>fs", function()
      FFF.live_grep_under_cursor()
    end, { desc = "Find current [s]election/word" })
  end,
}
