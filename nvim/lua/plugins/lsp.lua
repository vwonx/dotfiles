local lsp_info = require("lsp")

-- nvim-lspconfig
local nvim_lspconfig = {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
}

function nvim_lspconfig.config()
  local lspconfig = require("lspconfig")
  require('lspconfig.ui.windows').default_options.border = "rounded"

  for name, config in pairs(lsp_info.servers) do
    vim.lsp.config(name, config)
  end

  local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
  ---@diagnostic disable-next-line: duplicate-set-field
  function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = "rounded"
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
  end

end

-- mason
local mason = {
  "williamboman/mason.nvim",
  build = ":MasonUpdate", -- :MasonUpdate updates registry contents
  cmd = "Mason",
  opts = {
    ui = {
      border = "rounded",
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
