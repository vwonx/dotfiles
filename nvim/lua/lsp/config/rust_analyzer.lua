local common = require("lsp.common-config")

local opts = {
  flags = common.flags,
}

return {
  on_setup = function(server)
    server.setup(opts)
  end,
}
