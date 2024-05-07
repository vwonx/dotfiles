local M = {
  "aserowy/tmux.nvim",
  event = "VeryLazy",
  opts = {
    copy_sync = {
        enable = false,
    }
  },
  config = function(_, opts)
    return require("tmux").setup(opts)
  end
}

return M
