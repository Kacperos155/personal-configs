-- Core settings.
require("core.powershell")
require("core.options")
require("core.keymaps")
require("core.auto_commands")
require("core.user_commands")

-- Set up plugin manager.
require("config.lazy")

-- Set up Language Server Protocol (LSP) clients.
require("config.lsp")

-- Enable Treesitter syntax parsing.
-- Parsers are asynchronously installed by the 'nvim-treesitter/nvim-treesitter' plugin.
require("treesitter").setup()
