local M = {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  keys = {
    { "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
    { "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
    { "<leader>bo", "<cmd>BufferLineCloseOthers<CR>", desc = "Delete buffers except current" },
  },
  opts = {
    options = {
      separator_style = "slope",
      numbers = "ordinal",
      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          text_align = "left",
          highlight = "Directory",
          separator = true,
        },
      },
    },
  }
}

return M
