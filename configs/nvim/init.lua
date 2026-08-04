-- Core settings.
require("core.powershell")
require("core.options")
require("core.keymaps")
require("core.auto_commands")
require("core.user_commands")

-- Setup plugin manager.
require("config.lazy")

-- Enable Treesitter syntax parsing.
-- Parsers are asynchronously installed by the 'nvim-treesitter/nvim-treesitter' plugin.
require("treesitter").setup()
