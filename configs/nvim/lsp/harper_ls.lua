-- Harper, an offline, privacy-first grammar checker, written in Rust.
-- https://github.com/Automattic/harper

-- Install via `:MasonInstall harper-ls`.

---@type vim.lsp.Config
return {
  cmd = { "harper-ls", "--stdio" },
  root_markers = { ".git", ".harper-dictionary.txt" },
  filetypes = {
    "cpp",
    "gitcommit",
    "html",
    "lua",
    "markdown",
    "python",
    "text",
  },
  settings = {
    ["harper-ls"] = {
      linters = {
        SentenceCapitalization = false,
        SpellCheck = false,
        UseTitleCase = false,
      },
    },
  },
}
