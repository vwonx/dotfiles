local common = require("lsp.common-config")

local opts = {
  capabilities = common.capabilities,
  on_attach = function(client, bufnr)
    common.key_attach(bufnr)
    common.navic_attach(client, bufnr)
  end,
}

return {
  on_setup = function(server)
    server.setup(opts)
  end,
}
