local util = require("util")
local lsp_info = require("lsp")

local M = {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    ensure_installed = util.list_insert_unique({ "c", "lua", "vim", "vimdoc", "query" }, lsp_info.treesitter_install),
    highlight = { enable = true },
    indent = { enable = true },
  },
}

function M.config(_, opts)
  require("nvim-treesitter.configs").setup(opts)
end

return M
