local util = require("util")

local M = {}
M.treesitter_install = {}
M.mason_lspconfig_install = {}
M.servers = {}

-- cpp
M.treesitter_install = util.list_insert_unique(M.treesitter_install, { "cpp" })
M.mason_lspconfig_install = util.list_insert_unique(M.mason_lspconfig_install, { "clangd" })
M.servers["clangd"] = require("lsp.config.clangd")

-- js/ts
M.treesitter_install = util.list_insert_unique(M.treesitter_install, { "javascript", "typescript", "tsx", "jsdoc" })
M.mason_lspconfig_install = util.list_insert_unique(M.mason_lspconfig_install, { "tsserver" })
M.servers["tsserver"] = require("lsp.config.tsserver")

return M
