-- https://github.com/nvim-lualine/lualine.nvim
return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },

  config = function()
    -- Option to use a single global statusline.
    -- If false, every window has its own statusline.
    -- If true, every window displays a filename in the bar at the top of the window.
    local use_global_statusline = true

    -- Condition for displaying less important info.
    local function can_show_extended_info()
      local width = use_global_statusline and vim.go.columns or vim.api.nvim_win_get_width(0)
      return width >= 80
    end

    -- Icons for filenames.
    local filename_symbols = {
      -- https://www.nerdfonts.com/cheat-sheet
      modified = " ",
      readonly = "󰌾",
    }

    local filename_statusline = {
      "filename",
      path = 1,             -- Show relative path.
      shorting_target = 50, -- Number of characters reserved for other statusline elements.
      symbols = filename_symbols,
    }

    local filename_winbar = {
      "filename",
      path = 0,             -- Show only the filename.
      shorting_target = 20, -- Number of characters reserved for other statusline elements.
      symbols = filename_symbols,
    }

    local encoding = {
      "encoding",
      icon = "󰀬 ",
      cond = function()
        return vim.bo.fileencoding ~= "utf-8"
      end,
    }

    -- Use data from "lewis6991/gitsigns.nvim" as a source for diff info.
    local function gitsigns_diff_source()
      local gitsigns = vim.b.gitsigns_status_dict
      if gitsigns then
        return {
          added = gitsigns.added,
          modified = gitsigns.changed,
          removed = gitsigns.removed,
        }
      end
    end

    -- Show window size.
    local function window_size()
      return "󰨤  " .. vim.api.nvim_win_get_width(0) .. ", " .. vim.api.nvim_win_get_height(0)
    end

    -- Show number of spaces for indentation in the current buffer.
    local function indentation()
      local shiftwidth = vim.fn.shiftwidth()

      if vim.bo.expandtab then
        return "  " .. shiftwidth
      else
        return "  TAB(" .. shiftwidth .. ")"
      end
    end

    -- Show whether spell checking is enabled and for what language.
    local function spell_checking()
      if vim.wo.spell then
        return " " .. vim.bo.spelllang
      else
        return ""
      end
    end

    require("lualine").setup({
      options = {
        globalstatus = use_global_statusline,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { filename_statusline },
        lualine_c = { { "diff", source = gitsigns_diff_source } },
        lualine_x = {
          "diagnostics",
          { indentation, cond = can_show_extended_info },
          { spell_checking, cond = can_show_extended_info },
        },
        lualine_y = {
          encoding,
          "filetype",
        },
        lualine_z = {
          window_size,
          { "location", icon = " ", cond = can_show_extended_info },
        },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = use_global_statusline and {} or { filename_statusline },
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      winbar = {
        lualine_a = {},
        lualine_b = use_global_statusline and { filename_winbar } or {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      inactive_winbar = {
        lualine_a = {},
        lualine_b = use_global_statusline and { filename_winbar } or {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      extensions = {
        "aerial",
        "quickfix",
      },
    })

    -- Avoid duplicate mode display in the command line.
    vim.o.showmode = false
  end,
}
