local keys = require("utils.global-keys-mapping").bufferline

return {{
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "moll/vim-bbye",
  },
  keys = {
    { keys.prev, ":BufferLineCyclePrev<CR>", desc = "Buffer prev"},
    { keys.next, ":BufferLineCycleNext<CR>", desc = "Buffee next"},
    -- "moll/vim-bbye"
    { keys.close, ":Bdelete<CR>", desc = "Buffer delete"},
    { keys.close_left, ":BufferLineCloseLeft<CR>", desc = "Buffer close left"},
    { keys.close_right, ":BufferLineCloseRight<CR>", desc = "Buffer close right"},
    { keys.close_others, ":BufferLineCloseRight<CR>:BufferLineCloseLeft<CR>", desc = "Buffer close others"},
    { keys.close_pick, ":BufferLinePickClose<CR>", desc = "Buffer pick close"},
  },
  opts = {
    options = {
      separator_style = "slant",
      numbers = "ordinal",
      close_command = "Bdelete! %d",
      right_mouse_command = "Bdelete! %d",
      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          text_align = "left",
          separator = true,
        },
      },
    },
  }
}}
