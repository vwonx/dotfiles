local nvim_navic = {
  "SmiteshP/nvim-navic",
  opts = {
    highlight = true,
    depth_limit = 5,
  }
}

local lualine = {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  opts = {
    options = {
      globalstatus = true,
      -- theme = "jellybeans",
    },
    extensions = { "nvim-tree", "lazy" },
    sections = {
      lualine_c = {
        { "navic" },
      },
      lualine_x = {
        {
          'lsp_status',
          icon = '', -- f013
          symbols = {
            -- Standard unicode symbols to cycle through for LSP progress:
            spinner = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' },
            -- Standard unicode symbol for when LSP is done:
            done = '✓',
            -- Delimiter inserted between LSP names:
            separator = ' ',
          },
          color = { fg = "#98be65", gui = "bold" },
        },
      },
      lualine_y = {
        "encoding",
        "fileformat",
        "progress"
      }
    },
  },
}

local M = { nvim_navic, lualine }
return M
