local common = require("lsp.common-config")
local opts = {
  capabilities = common.capabilities,
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim', 'colorscheme'},
      },
    },
  },
  flags = common.flags,
  on_attach = function(client, bufnr)
    common.disableFormat(client)
  end,
}
return {
  on_setup = function(server)
    server.setup(opts)
  end,
}
