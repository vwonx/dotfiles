local keys = require("utils.global-keys-mapping").treesitter

return {{
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    -- A list of parser names, or "all" (the first five listed parsers should always be installed)
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query" ,"cpp", "cmake", "java", "rust" },
    highlight = {
      enable = true,
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = keys.init_selection,
        node_incremental = keys.node_incremental,
        node_decremental = keys.node_decremental,
        scope_incremental = keys.scope_incremental,
      },
    },
    indent = {
      enable = true,
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}}
