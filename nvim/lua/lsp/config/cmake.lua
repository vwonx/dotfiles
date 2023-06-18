local common = require("lsp.common-config")
local opts = {
  capabilities = common.capabilities,
  flags = common.flags,
}

return {
  on_setup = function(server)
    server.setup(opts)
  end,
}
