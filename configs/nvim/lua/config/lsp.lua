-- https://neovim.io/doc/user/lsp/ or `:h lsp`

vim.api.nvim_create_autocmd("LspAttach", {
  desc = "Configure LSP features.",
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)

    if client:supports_method("textDocument/completion", ev.buf) then
      -- Enable LSP autocompletion on LSP's `triggerCharacters`.
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end
  end,
})

vim.lsp.enable("ty")
