local M = {
  "aserowy/tmux.nvim",
  event = "VeryLazy",
  config = function() return require("tmux").setup() end
}

return M
