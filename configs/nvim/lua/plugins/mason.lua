-- Portable NeoVim package manager for: LSP servers, DAP servers, linters, and formatters.
-- https://github.com/mason-org/mason.nvim
return {
  "mason-org/mason.nvim",
  lazy = false, -- Mason adds installed executables to PATH during setup.
  opts = {},
}
