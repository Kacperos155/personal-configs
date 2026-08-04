-- ty, an extremely fast Python type checker and language server, written in Rust.
-- https://github.com/astral-sh/ty

-- Install via `:MasonInstall ty`.

---@type vim.lsp.Config
return {
  cmd = { "ty", "server" },
  filetypes = { "python" },
  root_markers = {
    "ty.toml",
    "pyproject.toml",
    "setup.py",
    "setup.cfg",
    "requirements.txt",
    ".git",
  },
}
