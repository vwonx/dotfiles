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
      navic = true,
    },
    transparent_background = false,
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)
    -- load the colorscheme here
    vim.cmd([[colorscheme catppuccin]])
    -- vim.cmd([[colorscheme catppuccin-mocha]])
  end
}

local moonfly = {
  "bluz71/vim-moonfly-colors",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function(_, opts)
    vim.g.moonflyWinSeparator = 2
    -- load the colorscheme here
    -- vim.cmd([[colorscheme moonfly]])
  end
}

local nightfly = {
  "bluz71/vim-nightfly-colors",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function(_, opts)
    vim.g.nightflyWinSeparator = 2
    -- load the colorscheme here
    -- vim.cmd([[colorscheme nightfly]])
  end
}

local M = {catppuccin, moonfly, nightfly }
return M
