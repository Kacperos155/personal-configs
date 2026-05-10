-- Use PowerShell 7+ as the default shell.
vim.o.shell = "pwsh"
vim.o.shellcmdflag = [[
-NoLogo -NoProfile -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new(); $PSDefaultParameterValues['Out-File:Encoding']='utf8'; $PSStyle.OutputRendering='PlainText';
]]
vim.o.shellpipe = "> %s 2>&1"
vim.o.shelltemp = false
vim.o.shellquote = ""
vim.o.shellxquote = ""
