local M = {
  'stevearc/aerial.nvim',
  event = { "BufReadPre", "BufNewFile" },
  -- Optional dependencies
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons"
  },
  opts = {
    attach_mode = "global",
    backends = { "lsp", "treesitter", "markdown", "man" },
    layout = { min_width = 35 },
    show_guides = true,
    filter_kind = false,
    guides = {
      mid_item = "├ ",
      last_item = "└ ",
      nested_top = "│ ",
      whitespace = "  ",
    },
    icons = {
      File          = "󰈙",
      Module        = "",
      Namespace     = "󰌗",
      Package       = "",
      Class         = "󰌗",
      Method        = "󰆧",
      Property      = "",
      Field         = "",
      Constructor   = "",
      Enum          = "󰕘",
      Interface     = "󰕘",
      Function      = "󰊕",
      Variable      = "󰆧",
      Constant      = "󰏿",
      String        = "󰀬",
      Number        = "󰎠",
      Boolean       = "◩",
      Array         = "󰅪",
      Object        = "󰅩",
      Key           = "󰌋",
      Null          = "󰟢",
      EnumMember    = "",
      Struct        = "󰌗",
      Event         = "",
      Operator      = "󰆕",
      TypeParameter = "󰊄",
    },
  },
  keys = {
    { "<leader>ls", "<cmd>AerialToggle!<CR>", desc = "Aerial Toggle" },
  }
}

return M
