local common = require("lsp.common-config")
common.capabilities.offsetEncoding = "utf-8"

local opts = {
  capabilities = common.capabilities,
  flags = common.flags,
  cmd = {
    "clangd",
    "--background-index",
    "--pch-storage=memory",
    "--clang-tidy",
    "--completion-style=detailed",
    "--header-insertion=never",
  },
  init_options = {
    clangdFileStatus = true,
    usePlaceholders = true,
    completeUnimported = true,
    semanticHighlighting = true,
  },
}

return {
  on_setup = function(server)
    server.setup(opts)
  end,
}
