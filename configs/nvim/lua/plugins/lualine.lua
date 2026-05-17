-- https://github.com/nvim-lualine/lualine.nvim
return {
  "nvim-lualine/lualine.nvim",
  dependencies = { 'nvim-tree/nvim-web-devicons' },

  config = function()
    -- Condition for displaying less important info.
    local function can_show_extended_info()
      return vim.api.nvim_win_get_width(0) >= 80
    end

    local filename = {
      'filename',
      symbols = {
        -- https://www.nerdfonts.com/cheat-sheet
        modified = ' ',
        readonly = '󰌾',
      }
    }

    local encoding = {
      'encoding',
      icon = '󰀬 ',
      cond = function()
        return vim.o.fileencoding ~= 'utf-8'
      end
    }

    -- Use data from "lewis6991/gitsigns.nvim" as a source for diff info.
    local function gitsigns_diff_source()
      local gitsigns = vim.b.gitsigns_status_dict
      if gitsigns then
        return {
          added = gitsigns.added,
          modified = gitsigns.changed,
          removed = gitsigns.removed
        }
      end
    end

    -- Show window size.
    local function window_size()
      return '󰨤  ' .. vim.api.nvim_win_get_width(0) .. ', ' .. vim.api.nvim_win_get_height(0)
    end

    -- Show number of spaces for indentation in the current buffer.
    local function indentation()
      if vim.o.expandtab then
        return '  ' .. vim.o.shiftwidth
      else
        return '  TAB(' .. vim.o.shiftwidth .. ')'
      end
    end

    require('lualine').setup({
      sections = {
        lualine_a = {'mode'},
        lualine_b = {filename},
        lualine_c = {{'branch', cond = can_show_extended_info}, {'diff', source = gitsigns_diff_source}},
        lualine_x = {'diagnostics', {indentation, cond = can_show_extended_info}},
        lualine_y = {encoding, 'filetype'},
        lualine_z = {window_size, {'location', icon = ' ', cond = can_show_extended_info}},
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {filename},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      extensions = {
        'quickfix',
      },
    })
  end
}
