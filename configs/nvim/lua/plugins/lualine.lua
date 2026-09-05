-- https://github.com/nvim-lualine/lualine.nvim
return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VimEnter",

  config = function()
    -- Condition for displaying less important info.
    local function can_show_extended_info()
      local width = vim.go.columns
      return width >= 80
    end

    -- Icons for filenames.
    local filename_symbols = {
      -- https://www.nerdfonts.com/cheat-sheet
      modified = " ",
      readonly = "󰌾",
      unnamed = "",
      newfile = "",
    }

    local filename_statusline = {
      "filename",
      path = 1, -- Show relative path.
      shorting_target = 50, -- Number of characters reserved for other statusline elements.
      symbols = filename_symbols,
    }

    local filename_winbar = {
      "filename",
      path = 0, -- Show only the filename.
      shorting_target = 20, -- Number of characters reserved for other statusline elements.
      symbols = filename_symbols,
    }

    -- Show whether diff mode is enabled for given window.
    local function diffmode_status()
      if vim.wo.diff then
        return " Diff"
      else
        return ""
      end
    end

    -- Show current tabpage number when tabline is disabled.
    local function current_tabpage()
      if vim.go.showtabline == 0 then
        local tabpage_count = vim.fn.tabpagenr("$")

        if tabpage_count >= 2 then
          local current_tabpage_number = vim.fn.tabpagenr()

          -- The same format as mini.tabline.
          return string.format("Tab %s/%s", current_tabpage_number, tabpage_count)
        end
      end
      return ""
    end

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
        -- Use a single global statusline instead of separate ones for each window.
        globalstatus = true,
      },
      sections = {
        lualine_a = {
          "mode",
        },
        lualine_b = {
          current_tabpage,
          filename_statusline,
        },
        lualine_c = {
          { "diff", source = gitsigns_diff_source },
        },
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
      winbar = {
        lualine_a = { diffmode_status },
        lualine_b = { filename_winbar },
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      inactive_winbar = {
        lualine_a = { diffmode_status },
        lualine_b = { filename_winbar },
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
