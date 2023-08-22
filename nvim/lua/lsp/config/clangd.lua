local common = require("lsp.common-config")
common.capabilities.offsetEncoding = "utf-8"

local opts = {
  capabilities = common.capabilities,
  cmd = {
    "clangd",
    "--header-insertion=never",
  },
  on_attach = function(client, bufnr)
    common.disable_format(client)
    common.key_attach(bufnr)
    common.navic_attach(client, bufnr)
  end,
}

return {
  on_setup = function(server)
    server.setup(opts)
  end,
}
