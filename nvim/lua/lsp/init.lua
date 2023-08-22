local M = {}
M.treesitter_install = {}
M.mason_lspconfig_install = {}
M.servers = {}

-- cpp
table.insert(M.treesitter_install, "cpp")
table.insert(M.mason_lspconfig_install, "clangd")
M.servers["clangd"] = require("lsp.config.clangd")

return M
