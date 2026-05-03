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

    require('lualine').setup({
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
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
