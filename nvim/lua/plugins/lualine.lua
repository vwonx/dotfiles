local nvim_navic = {
  "SmiteshP/nvim-navic",
  opts = {
    separator = "  ",
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
      theme = "catppuccin",
      section_separators = { left = '', right = '' },
      globalstatus = true,
    },
    extensions = { "nvim-tree", "lazy" },
    sections = {
      lualine_c = {
        { "diagnostics" },
        { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
        { "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },
        {
          function() return require("nvim-navic").get_location() end,
          cond = function() return package.loaded["nvim-navic"] and require("nvim-navic").is_available() end,
        },
      },
    },
  },
}

local M = { nvim_navic, lualine }
return M
