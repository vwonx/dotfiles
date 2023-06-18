local common = require("lsp.common-config")
local opts = {
  capabilities = common.capabilities,
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim', 'colorscheme' },
      },
    },
  },
  flags = common.flags,
}
return {
  on_setup = function(server)
    server.setup(opts)
  end,
}
