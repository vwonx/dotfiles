local M = {
  "catppuccin/nvim",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  opts = {
    integrations = {
      nvimtree = true,
      telescope = true,
      mini = true,
      mason = true,
      cmp = true,
    },
    transparent_background = true,
  }
}

function M.config(_, opts)
  require("catppuccin").setup(opts)
  -- load the colorscheme here
  vim.cmd([[colorscheme catppuccin-mocha]])
end

return M
