-- Markdown rendering for Neovim.
-- https://github.com/MeanderingProgrammer/render-markdown.nvim

local filetypes = { "markdown", "gitcommit" }

return {
  "MeanderingProgrammer/render-markdown.nvim",
  cmd = "RenderMarkdown",
  ft = filetypes,

  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {
    sign = {
      -- Disable sign column rendering.
      enabled = false,
    },
    anti_conceal = {
      enabled = false,
    },
    heading = {
      border = true,
      position = "inline",
      left_pad = 2,
      right_pad = 2,
      width = "block",
    },
    overrides = {
      filetype = {
        gitcommit = {
          heading = {
            -- Disable ATX headings, i.e. headings starting with '#'.
            -- They interfere with git comments.
            atx = false,
            -- Disable icons for Setext headings, i.e. headings underlined with `---` or `===`.
            icons = {},
            setext = true,
          },
        },
      },
    },
  },

  config = function(_, opts)
    local RM = require("render-markdown")
    RM.setup(opts)

    -- Keymaps only for filetypes that use render-markdown.nvim.
    vim.api.nvim_create_autocmd("FileType", {
      pattern = filetypes,
      callback = function(args)
        -- Inline preview
        vim.keymap.set("n", "<leader>tp", function()
          RM.buf_toggle()
        end, {
          buffer = args.buf,
          desc = "Toggle inline [p]review",
        })

        -- Side preview
        vim.keymap.set("n", "<leader>op", function()
          RM.preview()
        end, {
          buffer = args.buf,
          desc = "Open side-by-side [p]review",
        })
      end,
      desc = "Set up Markdown related keymaps",
    })
  end,
}
