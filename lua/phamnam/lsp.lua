local M = {}

function M.toggleInlayHints()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end

function M.toggleAutoformat()
  LazyVim.format.toggle()
end

return M
