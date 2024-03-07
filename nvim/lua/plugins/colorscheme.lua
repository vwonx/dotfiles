local catppuccin = {
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
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)
  end
}

local moonfly = {
  "bluz71/vim-moonfly-colors",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function(_, opts)
    vim.g.moonflyWinSeparator = 2
    -- load the colorscheme here
    vim.cmd([[colorscheme moonfly]])
  end
}

local nightfox = {
  "EdenEast/nightfox.nvim",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  -- config = function(_, opts)
  --   -- load the colorscheme here
  --   vim.cmd([[colorscheme carbonfox]])
  -- end
}

local M = {catppuccin, moonfly, nightfox}
return M
