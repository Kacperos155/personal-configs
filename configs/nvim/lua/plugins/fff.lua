-- Fast File Finder with live grep and background file watcher.
-- https://github.com/dmtrKovalenko/fff#fffnvim
return {
  "dmtrKovalenko/fff",
  -- Lazy-load on "find" key group.
  -- Since the key mappings are created at plugin load,
  -- which-key.nvim needs descriptions of these keys to provide info before the plugin is loaded.
  keys = {
    { "<leader>ff" },
    { "<leader>fg" },
    { "<leader>fs", mode = { "n", "x" } },
  },

  build = function()
    -- Downloads a prebuilt binary or falls back to cargo build.
    require("fff.download").download_or_build_binary()
  end,

  opts = {
    debug = {
      -- File info panel above preview window.
      enabled = false, -- Toggle with <F2>.
    },
    keymaps = {
      move_up = { "<Up>" },
      move_down = { "<Down>" },
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

    -- Disable autocompletion in picker.
    vim.api.nvim_create_autocmd("FileType", {
      desc = "Disable autocompletion in FFF picker",
      pattern = "fff_input",
      callback = function()
        vim.bo.autocomplete = false
        vim.b.minipairs_disable = true
      end,
    })
  end,
}
