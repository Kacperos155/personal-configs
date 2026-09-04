-- Markdown rendering for Neovim.
-- https://github.com/MeanderingProgrammer/render-markdown.nvim
return {
  "MeanderingProgrammer/render-markdown.nvim",
  cmd = "RenderMarkdown",
  ft = { "markdown", "gitcommit" },

  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {
    sign = {
      -- Disable sign column rendering.
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
}
