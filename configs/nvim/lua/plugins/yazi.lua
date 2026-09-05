--- Floating window wrapper for Yazi file manager.
--- https://github.com/mikavilpas/yazi.nvim
---@type LazySpec
return {
  "mikavilpas/yazi.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim", lazy = true },
  },
  -- Lazy-load on specified key mappings.
  -- Since the key mappings are created at plugin load,
  -- which-key.nvim needs descriptions of these keys to provide info before the plugin is loaded.
  keys = {
    { "<leader>oy" },
  },

  ---@type YaziConfig
  opts = {
    keymaps = {
      show_help = "?",
      change_working_directory = "<c-\\>",
      cycle_open_buffers = "<tab>",
      send_to_quickfix_list = "<c-q>",
      copy_relative_path_to_selected_files = false,
      grep_in_directory = false,
      open_and_pick_window = false,
      open_file_in_horizontal_split = false,
      open_file_in_tab = false,
      open_file_in_vertical_split = false,
      replace_in_directory = false,
    },
    floating_window_scaling_factor = 0.8,
    yazi_floating_window_border = "single",
  },

  config = function(_, opts)
    local Yazi = require("yazi")
    Yazi.setup(opts)

    vim.keymap.set("n", "<leader>oy", function()
      Yazi.toggle()
    end, { desc = "Open [Y]azi" })
  end,
}
