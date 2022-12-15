local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "qvim.lsp.lsp-installer"
require("qvim.lsp.handlers").setup()
require "qvim.lsp.null-ls"
