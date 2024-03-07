local nvim_navic = {
  "SmiteshP/nvim-navic",
  opts = {
    -- separator = "  ",
    separator = "  ",
    -- highlight = true,
    depth_limit = 5,
  }
}

local lualine = {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  opts = {
    options = {
      -- theme = "catppuccin",
      section_separators = { left = '', right = '' },
      component_separators = { left = '', right = '' },
      -- section_separators = { left = '', right = '' },
      globalstatus = true,
    },
    extensions = { "nvim-tree", "lazy" },
    sections = {
      lualine_c = {
        { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
        { "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },
        { "navic" },
      },
    },
  },
}

local M = { nvim_navic, lualine }
return M
