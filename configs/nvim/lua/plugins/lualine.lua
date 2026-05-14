-- https://github.com/nvim-lualine/lualine.nvim
return {
  "nvim-lualine/lualine.nvim",
  dependencies = { 'nvim-tree/nvim-web-devicons' },

  config = function()
    local filename = {
      'filename',
      symbols = {
        -- https://www.nerdfonts.com/cheat-sheet
        modified = ' ',
        readonly = '󰌾',
      }
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

    require('lualine').setup({
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', {'diff', source = gitsigns_diff_source}, 'diagnostics'},
        lualine_c = {filename},
        lualine_x = {'encoding'},
        lualine_y = {'filetype'},
        lualine_z = {'location', 'progress'},
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {filename},
        lualine_x = {'location', 'progress'},
        lualine_y = {},
        lualine_z = {},
      },
    })
  end
}
