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
  },
}
