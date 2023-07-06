local common = require("lsp.common-config")

local opts = {
  -- capabilities = common.capabilities,
  flags = common.flags,
  settings = {
    -- to enable rust-analyzer settings visit:
    -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
    ["rust-analyzer"] = {
      cargo = {
        autoreload = true,
      },
    },
  },
}

return {
  on_setup = function(server)
    local ok_rt, rust_tools = pcall(require, "rust-tools")
    if not ok_rt then
      print("Failed to load rust tools, will set up `rust_analyzer` without `rust-tools`.")
      server.setup(opts)
    else
      -- We don't want to call lspconfig.rust_analyzer.setup() when using rust-tools
      rust_tools.setup({
        server = opts,
      })
    end
  end,
}
