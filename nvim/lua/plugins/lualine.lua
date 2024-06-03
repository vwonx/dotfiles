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
          -- Lsp server name .
          function()
            local msg = "No Active Lsp"
            local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
            local clients = vim.lsp.get_active_clients()
            if next(clients) == nil then
              return msg
            end
            for _, client in ipairs(clients) do
              local filetypes = client.config.filetypes
              if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                return client.name
              end
            end
            return msg
          end,
          icon = " LSP:",
          color = { fg = "#51afef", gui = "bold" },
        },
      },
      lualine_y = {
        {
          "encoding",
          color = { fg = "#98be65", gui = "bold" },
        },
        "fileformat",
        "progress"
      }
    },
  },
}

local M = { nvim_navic, lualine }
return M
