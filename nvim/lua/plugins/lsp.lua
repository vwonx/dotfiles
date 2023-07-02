return {
  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      -- mason-tool-installer
    },
    config = function(_, _)
      -- servers map
      -- { key: server name， value: config file }
      local servers = {
        lua_ls = require("lsp.config.lua"),
        clangd = require("lsp.config.clangd"),
        cmake = require("lsp.config.cmake"),
        -- jdtls = require("lsp.config.jdtls"),
        rust_analyzer = require("lsp.config.rust_analyzer"),
      }
      local lspconfig = require("lspconfig")

      for name, config in pairs(servers) do
        if config ~= nil and type(config) == "table" then
          -- config file must implement on_setup method
          config.on_setup(lspconfig[name])
        else
          -- or else use default params
          lspconfig[name].setup({})
        end
      end
    end
  },

  -- mason
  {
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
  },

  -- mason-lspconfig
  {
    "williamboman/mason-lspconfig.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      ensure_installed = {
        "lua_ls",
        "clangd",
        "cmake",
        -- "jdtls",
        "rust_analyzer",
      }
    }
  },

  -- mason-tool-installer
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      ensure_installed = {
        "stylua",
      }
    }
  },
}
