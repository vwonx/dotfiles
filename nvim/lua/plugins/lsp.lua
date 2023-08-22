local lsp_info = require("lsp")

-- nvim-lspconfig
local nvim_lspconfig = {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
}

function nvim_lspconfig.config()
  local lspconfig = require("lspconfig")

  for name, config in pairs(lsp_info.servers) do
    if config ~= nil and type(config) == "table" then
      -- config file must implement on_setup method
      config.on_setup(lspconfig[name])
    else
      -- or else use default params
      lspconfig[name].setup({})
    end
  end
end

-- mason
local mason = {
  "williamboman/mason.nvim",
  build = ":MasonUpdate", -- :MasonUpdate updates registry contents
  cmd = "Mason",
  opts = {
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗"
      }
    }
  }
}

-- mason-lspconfig
local mason_lspconfig = {
  "williamboman/mason-lspconfig.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    ensure_installed = lsp_info.mason_lspconfig_install
  }
}

local M = { nvim_lspconfig, mason, mason_lspconfig }
return M
