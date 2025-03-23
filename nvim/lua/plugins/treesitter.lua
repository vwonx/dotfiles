local util = require("util")
local lsp_info = require("lsp")

local M = {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    ensure_installed = util.list_insert_unique({ "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
                                                lsp_info.treesitter_install),
    highlight = {
      enable = true,
      disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
          return true
        end
      end,
    },
    indent = { enable = true },
  },
}

function M.config(_, opts)
  require("nvim-treesitter.configs").setup(opts)
end

return M
