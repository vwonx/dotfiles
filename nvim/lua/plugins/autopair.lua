local M = {
  "windwp/nvim-autopairs",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    check_ts = true,
  }
}

return M
